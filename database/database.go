package database

import (
	"fmt"
	"os"
	"strconv"
	"strings"

	//External dependencies
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"github.com/pkg/errors"
	log "github.com/rs/zerolog/log"

	. "yogsstats/models"
)

var (
	user = "postgres"
	password = os.Getenv("PQ_PASS")
	dbIp = "localhost:5432"
	connectionStringTTT = fmt.Sprintf("postgresql://%s:%s@%s/%s", user, password, dbIp, "ttt")
	db *sqlx.DB = initDB(connectionStringTTT)
)

func initDB(connectionString string) *sqlx.DB {
	db, err := sqlx.Open("postgres", connectionString)
	if err != nil {
		os.Exit(1)
	}

	return db
}

func rollbackTransaction(id string) {
	tx := db.MustBegin()
	tx.MustExec("DELETE FROM round_participation WHERE id = $1;", id)
	tx.MustExec("DELETE FROM round WHERE id = $1;", id)
	err := tx.Commit()
	if err != nil {
		log.Fatal().Err(err).Msg("Database rollback failed, terminating...")
	}

	log.Debug().Msgf("Round with id '%s' has been rolled back.", id)
}

func addPlayer(name string) {
	tx := db.MustBegin()
	tx.MustExec(fmt.Sprintf("INSERT INTO player (name) VALUES ('%s') ON CONFLICT (name) DO NOTHING;", name))
	tx.Commit()
}

func escapeCharacter(s *string, char string) {
	if strings.Contains(*s, char) {
		tmp := ""
		for _, c := range *s {
			ch := string(c)
			if ch == char {
				ch = "'" + ch
			}

			tmp += ch
		}

		*s = tmp
	}
}

func getEntries(table, column, value string) ([]string, error) {
	var query string
	if value == "*" {
		query = fmt.Sprintf("SELECT * FROM %s;", table)
	} else {
		query = fmt.Sprintf("SELECT * FROM %s WHERE %s = '%s';", table, column, value)
	}

	var rows []string
	err := db.Select(&rows, query)
	if err != nil {
		return nil, errors.Wrap(err, query)
	}

	var entries []string
	for _, t := range rows {
		entries = append(entries, t)
	}

	return entries, nil
}

func CountRows(table, whereClause string) (int, error) {
	var count []int
	var query string

	if whereClause == "" {
		query = fmt.Sprintf("SELECT COUNT(*) FROM %s", table)
	} else {
		query = fmt.Sprintf("SELECT COUNT(*) FROM %s WHERE %s", table, whereClause)
	}

	err := db.Select(&count, query)
	if err != nil {
		return -1, errors.Wrap(err, query)
	}

	return count[0], nil
}

func GetOldestRoundInfo() (RoundInfo, error) {
	return getRoundInfo("ASC")
}

func GetNewestRoundInfo() (RoundInfo, error) {
	return getRoundInfo("DESC")
}

type RoundInfo struct {
	Id 		string `json:"id"`
	Date 	string `json:"date"`
}

func getRoundInfo(sort string) (RoundInfo, error) {
	if sort != "ASC" && sort != "DESC" {
		return RoundInfo{}, errors.Errorf("Unknown sort '%s', only accepts 'ASC' or 'DESC'.", sort)
	}

	query := fmt.Sprintf("SELECT id, date FROM round ORDER by id %s LIMIT 1", sort)

	var info []RoundInfo
	err := db.Select(&info, query)
	if err != nil {
		log.Error().Err(err).Msg("")
		return RoundInfo{}, err
	}

	return info[0], nil
}

func InsertRound(round *TTTRound) error {
	tx := db.MustBegin()

	escapeCharacter(&round.Randomat, "'")

	tx.MustExec(fmt.Sprintf("INSERT INTO video (title, id) VALUES ('%s', '%s')", round.Vid, round.Title))
	tx.MustExec(fmt.Sprintf("INSERT INTO round (id, date, winning_team, randomat) VALUES ('%s', '%s', '%s', '%s');", round.Id, round.Date, round.WinningTeam, round.Randomat))
	for _, player := range round.Players {
		addPlayer(player.Name)
		tx.NamedExec(fmt.Sprintf("INSERT INTO round_participation (id, player, role, team) VALUES ('%s', :name, :role, :team);", round.Id), player)
	}

	err := tx.Commit()
	if err != nil {
		log.Error().Err(err).Msgf("Failed to insert round '%v' into database, rolling back transaction...", round)
		rollbackTransaction(round.Id)
		return err
	}

	log.Debug().Msgf("Inserted round with id '%s' into database.", round.Id)
	return nil
}

func GetRound(id, from, to string) ([]TTTRound, error) {
	var query string
	if id != "" {
		if len(id) != 9 { //Specific
			return nil, errors.New(fmt.Sprintf("Invalid id length %d, must be of length 8 or 9", len(id)))
		} 

		query = fmt.Sprintf("SELECT R.id, R.date, R.winning_team, R.randomat, RP.player, RP.role, RP.team, V.Title, V.vid, R.start, R.end FROM round R JOIN round_participation RP ON RP.id = R.id JOIN video V ON R.id = RP.id AND V.vid = R.video WHERE R.id = '%s' ORDER BY R.id ASC;", id)
	} else {
		query = fmt.Sprintf("SELECT R.id, R.date, R.winning_team, R.randomat, RP.player, RP.role, RP.team, V.Title, V.vid, R.start, R.end FROM round R JOIN round_participation RP ON RP.id = R.id JOIN video V ON R.id = RP.id AND V.vid = R.video WHERE R.date >= '%s' AND R.date <= '%s' ORDER BY R.id ASC;", from, to)
	}

	rounds := []TTTRound{}

	type row struct {
		Id				int
		Date			string
		WinningTeam		string `db:"winning_team"`
		Randomat		string
		Player			string
		Role			string
		Team			string
		Title			string
		Vid				string
		Start			int
		End				int
	}

	rows := []row{}
	err := db.Select(&rows, query)
	if err != nil {
		log.Error().Err(err).Msg("Failed to query the database.")
		return nil, err
	}

	if len(rows) == 0 {
		log.Debug().Msg("No rows found.")
		return nil, nil
	}

	var round TTTRound
	for _, row := range rows {
		if round.Id != strconv.Itoa(row.Id) {
			if round.Id != "" {
				rounds = append(rounds, round)
			}

			round = TTTRound{Round: Round{Id: strconv.Itoa(row.Id), Date: row.Date, Title: row.Title, Vid: row.Vid, Start: row.Start, End: row.End}, Randomat: row.Randomat, WinningTeam: row.WinningTeam}
		}

		round.Players = append(round.Players, TTTPlayer{Player: Player{Name: row.Player}, Role: row.Role, Team: row.Team})
	}

	rounds = append(rounds, round)

	return rounds, nil
}

type TeamWinShareResponse struct {
	Feedback string	`json:"feedback"`
	Response map[string]float64 `json:"teams"`
}

func TeamWinShare(team, from, to string) (TeamWinShareResponse, error) {
	teams, err := getEntries("team", "team", team)
	if err != nil {
		return TeamWinShareResponse{Feedback: "Error getting entries"}, err
	}

	totalRounds, err := CountRows("round", fmt.Sprintf("date >= '%s' AND date <= '%s'", from, to))
	if err != nil {
		return TeamWinShareResponse{Feedback: "Error counting rows"}, err
	}

	if totalRounds == 0 {
		return TeamWinShareResponse{Feedback: "No rounds found"}, nil
	}

	var response TeamWinShareResponse
	response.Response = map[string]float64{}
	for _, team := range teams {
		winsOfTeam, err := CountRows("round", fmt.Sprintf("winning_team = '%s' AND date >= '%s' AND date <= '%s'", team, from, to))
		if err != nil {
			return TeamWinShareResponse{Feedback: "Internal server erros"}, err
		}

		result := float64(winsOfTeam) / float64(totalRounds)
		response.Response[team] = float64(int(result*100)) / 100
	}

	response.Feedback = "Successfull request"
	return response, nil
}

type TeamsWinPercentage struct {
	Teams map[string]float64 `json:"teams"`
	Dwin  float64 `json:"detectiveWinPercentage"`
}
type PlayerWinPercentageResponse struct {
	Feedback string 						`json:"feedback"`
	Players map[string]TeamsWinPercentage 	`json:"players"`
}

func PlayerWinPercentage(player, from, to string) (PlayerWinPercentageResponse, error) {
	players, err := getEntries("player", "name", player)
	if err != nil {
		return PlayerWinPercentageResponse{Feedback: "Error getting entries"}, nil
	}

	type row struct {
		Team	string
		Win		string `db:"winning_team"`
	}

	response := PlayerWinPercentageResponse{
		Players: make(map[string]TeamsWinPercentage),
	}

	for _, player := range players {
		query := fmt.Sprintf("SELECT RP.team, R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = '%s' AND R.date >= '%s' AND R.date <= '%s';", player, from, to)
		var rows []row
		err := db.Select(&rows, query)
		if err != nil {
			return PlayerWinPercentageResponse{Feedback: fmt.Sprintf("Error getting player rows (%s)", player)}, err
		}

		totalRounds := float64(len(rows))

		winsByTeams := make(map[string]int)
		for _, row := range rows {
			if _, exists := winsByTeams[row.Team]; !exists {
				winsByTeams[row.Team] = 0
			} 

			if row.Team == row.Win {
				winsByTeams[row.Team]++
			}
		}

		response.Players[player] = TeamsWinPercentage{Teams: make(map[string]float64)}
		for team, val := range winsByTeams {
			result := float64(val) / totalRounds
			response.Players[player].Teams[team] = float64(int(result*100)) / 100
		}

		dWin, err := detectiveWinPercentage(player, from, to)
		if err != nil {
			return PlayerWinPercentageResponse{Feedback: fmt.Sprintf("Error getting detective win percentage (%s)", player)}, err
		}

		entry, _ := response.Players[player]
		entry.Dwin = float64(int(dWin*100)) / 100
		response.Players[player] = entry
	}

	response.Feedback = "Successfull request"
	return response, nil
}

func detectiveWinPercentage(player, from, to string) (float64, error) {
	query := fmt.Sprintf("SELECT R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = '%s' AND date >= '%s' AND date <= '%s' AND (RP.role = 'paladin' OR RP.role = 'tracker' OR RP.role = 'medium');", player, from, to)

	type row struct {
		Role	string 
		Win		string `db:"winning_team"`
	}

	var rows []row
	err := db.Select(&rows, query)
	if err != nil {
		return -1, err
	}

	if len(rows) == 0 {
		return 0, nil
	}

	var wins float64
	for _, row := range rows {
		if row.Win == "innocents" {
			wins++
		}
	}

	return (wins / float64(len(rows))), nil
}

type TraitorCombosResponse struct {
	Feedback string	`json:"feedback"`
	Combos map[string]map[string]float64 `json:"combos"`
}

func TraitorCombos(player, from, to string) (TraitorCombosResponse, error) {
	players, err := getEntries("player", "name", player)
	if err != nil {
		return TraitorCombosResponse{Feedback: "Error getting entries"}, nil
	}

	response := TraitorCombosResponse{Combos: make(map[string]map[string]float64)}

	for _, player := range players {
		for _, other := range players {
			if _, alreadyDone := response.Combos[player][other]; other != player && !alreadyDone {
				comboWinRate, err, anyCommonRounds := getTraitorWinRate(player, other, from, to)
				if err != nil {
					log.Error().Err(err).Msg("")
					return TraitorCombosResponse{Feedback: "Error getting combo win %"}, nil
				}

				if !anyCommonRounds {
					continue
				}
				
				if response.Combos[player] == nil {
					response.Combos[player] = make(map[string]float64)
				}
				response.Combos[player][other] = comboWinRate

				if response.Combos[other] == nil {
					response.Combos[other] = make(map[string]float64)
				}
				response.Combos[other][player] = comboWinRate
			}
		}
	}

	response.Feedback = "Successfull request"
	return response, nil
}

func getTraitorWinRate(player1, player2, from, to string) (float64, error, bool) {
	player1Rounds, err := getTraitorRounds(player1, from, to)
	if err != nil {
		return -1, err, false
	}

	player2Rounds, err := getTraitorRounds(player2, from, to)
	if err != nil {
		return -1, err, false
	}

	var len float64
	var wins float64
	for _, round := range player1Rounds {
		for _, otherRound := range player2Rounds {
			if round.Id == otherRound.Id {
				len++
				if round.Win == "traitors" {
					wins++
				}
			}
		}
	}

	if len == 0 {
		return 0, nil, false
	}

	return float64(int((wins / len)*100)) / 100, nil, true
}

type traitorRound struct {
	Id string
	Win string `db:"winning_team"`
}

func getTraitorRounds(player, from, to string) ([]traitorRound, error) {
	query := fmt.Sprintf("SELECT R.id, R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = '%s' AND R.date >= '%s' AND R.date <= '%s' AND RP.team = 'traitors';", player, from, to)

	var rounds []traitorRound
	err := db.Select(&rounds, query)
	if err != nil {
		return nil, err
	}

	return rounds, nil
}