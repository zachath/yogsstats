package database

import (
	"fmt"
	"os"
	"strconv"
	"database/sql"

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

func addPlayer(name string, tx *sql.Tx) error {
	stmt, err := tx.Prepare("INSERT INTO player (name) VALUES ($1) ON CONFLICT (name) DO NOTHING;")
	if err != nil {
		return err
	}
	_, err = stmt.Exec(name)
	return err
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
	tx, err := db.Begin()
	if err != nil {
		log.Error().Err(err).Str("round", round.Id).Msg("Failed to initialize transaction.")
		return err
	}

	defer tx.Rollback()

	stmt, err := tx.Prepare("INSERT INTO video (title, vid) VALUES ($1, $2) ON CONFLICT DO NOTHING;")
	if err != nil {
		log.Error().Err(err).Str("id", round.Id).Msg("Failed to prepare insert video statment.")
		return err
	}
	_, err = stmt.Exec(round.Title, round.Vid)
	if err != nil {
		log.Error().Err(err).Str("round", round.Id).Str("Video", round.Vid).Msg("Failed to insert video.")
		return err
	}

	stmt, err = tx.Prepare("INSERT INTO round (id, date, winning_team, video, vid_start, vid_end) VALUES ($1, $2, $3, $4, $5, $6);")
	if err != nil {
		log.Error().Err(err).Str("id", round.Id).Msg("Failed to prepare insert round statment.")
		return err
	}
	_, err = stmt.Exec(round.Id, round.Date, round.WinningTeam, round.Vid, round.Start, round.End)
	if err != nil {
		log.Error().Err(err).Str("id", round.Id).Msg("Failed to insert round.")
		return err
	}

	for _, player := range round.Players {
		err := addPlayer(player.Name, tx)
		if err != nil {
			log.Error().Err(err).Str("player", player.Name).Msg("Failed to insert player.")
			return err
		}

		stmt, err = tx.Prepare("INSERT INTO round_participation (id, player, role, team) VALUES ($1, $2, $3, $4);")
		if err != nil {
			log.Error().Err(err).Str("player", player.Name).Msg("Failed to prepare round participation statment.")
			return err
		}
		_, err = stmt.Exec(round.Id, player.Name, player.Role, player.Team)
		if err != nil {
			log.Error().Err(err).Str("player", player.Name).Msg("Failed to insert round participation.")
			return err
		}
	}

	tx.Commit()

	log.Info().Str("round", round.Id).Msgf("Inserted round into database.")
	return nil
}

func GetRound(id, from, to string) ([]TTTRound, error) {
	rounds := []TTTRound{}

	type row struct {
		Id				int
		Date			string
		WinningTeam		string `db:"winning_team"`
		Player			string
		Role			string
		Team			string
		Title			string
		Vid				string
		Start			int		`db:"vid_start"`
		End				int		`db:"vid_end"`
	}

	rows := []row{}

	var query string
	var err error
	if id == "" {
		query = "SELECT R.id, R.date, R.winning_team, RP.player, RP.role, RP.team, V.Title, V.vid, R.vid_start, R.vid_end FROM round R JOIN round_participation RP ON RP.id = R.id JOIN video V ON R.id = RP.id AND V.vid = R.video WHERE R.date >= $1 AND R.date <= $2 ORDER BY R.id ASC;"
		err = db.Select(&rows, query, from, to)
	} else {
		query = "SELECT R.id, R.date, R.winning_team, RP.player, RP.role, RP.team, V.Title, V.vid, R.vid_start, R.vid_end FROM round R JOIN round_participation RP ON RP.id = R.id JOIN video V ON R.id = RP.id AND V.vid = R.video WHERE R.id = $1 AND R.date >= $2 AND R.date <= $3 ORDER BY R.id ASC;"
		err = db.Select(&rows, query, id, from, to)
	}

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

			round = TTTRound{Round: Round{Id: strconv.Itoa(row.Id), Date: row.Date, Title: row.Title, Vid: row.Vid, Start: row.Start, End: row.End}, WinningTeam: row.WinningTeam}
		}

		round.Players = append(round.Players, TTTPlayer{Player: Player{Name: row.Player}, Role: row.Role, Team: row.Team})
	}

	rounds = append(rounds, round)

	return rounds, nil
}

type TeamWinPercentageResponse struct {
	Feedback string	`json:"feedback"`
	Response map[string]float64 `json:"teams"`
}

func TeamWinPercentage(team, from, to string) (TeamWinPercentageResponse, error) {
	teams, err := getEntries("team", "team", team)
	if err != nil {
		return TeamWinPercentageResponse{Feedback: "Error getting entries"}, err
	}

	totalRounds, err := CountRows("round", fmt.Sprintf("date >= '%s' AND date <= '%s'", from, to))
	if err != nil {
		return TeamWinPercentageResponse{Feedback: "Error counting rows"}, err
	}

	if totalRounds == 0 {
		return TeamWinPercentageResponse{Feedback: "No rounds found"}, nil
	}

	var response TeamWinPercentageResponse
	response.Response = map[string]float64{}
	for _, team := range teams {
		winsOfTeam, err := CountRows("round", fmt.Sprintf("winning_team = '%s' AND date >= '%s' AND date <= '%s'", team, from, to))
		if err != nil {
			return TeamWinPercentageResponse{Feedback: "Internal server error"}, err
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

func PlayerWinPercentage(player, from, to string, canon, trunc bool) (PlayerWinPercentageResponse, error) {
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
		teams, err := getEntries("team", "team", "*")
		if err != nil {
			return PlayerWinPercentageResponse{Feedback: "Error getting entries"}, nil
		}

		response.Players[player] = TeamsWinPercentage{Teams: make(map[string]float64)}
		for _, team := range teams {
			query := "SELECT RP.team, R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = $1 AND R.date >= $2 AND R.date <= $3 AND RP.team = $4;"
			var rows []row
			err = db.Select(&rows, query, player, from, to, team)
			if err != nil {
				return PlayerWinPercentageResponse{Feedback: fmt.Sprintf("Error getting player rows (%s)", player)}, err
			}

			if len(rows) == 0 {
				continue
			}

			totalRounds := float64(len(rows))

			wins := 0
			for _, row := range rows {
				if row.Team == row.Win {
					wins++
				}
			}

			result := float64(wins) / totalRounds
			if trunc {
				response.Players[player].Teams[team] = float64(int(result*100)) / 100
			} else {
				response.Players[player].Teams[team] = result
			}
		}

		dWin, err := detectiveWinPercentage(player, from, to, trunc)
		if err != nil {
			return PlayerWinPercentageResponse{Feedback: fmt.Sprintf("Error getting detective win percentage (%s)", player)}, err
		}

		entry, _ := response.Players[player]
		entry.Dwin = dWin

		if canon && player == "Zylus" {
			entry.Dwin = 1
		}

		response.Players[player] = entry
	}

	response.Feedback = "Successfull request"
	return response, nil
}

func detectiveWinPercentage(player, from, to string, trunc bool) (float64, error) {
	query := "SELECT R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id JOIN role RO ON RP.role = RO.role WHERE RP.player = $1 AND date >= $2 AND date <= $3 AND RO.detective = 'd';"

	type row struct {
		Role	string 
		Win		string `db:"winning_team"`
	}

	var rows []row
	err := db.Select(&rows, query, player, from, to)
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

	rate := wins / float64(len(rows))

	if trunc {
		return float64(int(rate*100)) / 100, nil
	}

	return rate, nil
}

type TraitorCombosResponse struct {
	Feedback string	`json:"feedback"`
	Combos map[string]map[string]float64 `json:"combos"`
}

func TraitorCombos(player, from, to string, trunc bool) (TraitorCombosResponse, error) {
	players, err := getEntries("player", "name", player)
	if err != nil {
		return TraitorCombosResponse{Feedback: "Error getting entries"}, nil
	}

	response := TraitorCombosResponse{Combos: make(map[string]map[string]float64)}

	for _, player := range players {
		for _, other := range players {
			if _, alreadyDone := response.Combos[player][other]; other != player && !alreadyDone {
				comboWinRate, err, anyCommonRounds := getTraitorWinRate(player, other, from, to, trunc)
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

func getTraitorWinRate(player1, player2, from, to string, trunc bool) (float64, error, bool) {
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

	rate := wins / len

	if trunc {
		return float64(int((rate)*100)) / 100, nil, true
	}

	return rate, nil, true
}

type traitorRound struct {
	Id string
	Win string `db:"winning_team"`
}

func getTraitorRounds(player, from, to string) ([]traitorRound, error) {
	query := "SELECT R.id, R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = $1 AND R.date >= $2 AND R.date <= $3 AND RP.team = 'traitors';"

	var rounds []traitorRound
	err := db.Select(&rounds, query, player, from, to)
	if err != nil {
		return nil, err
	}

	return rounds, nil
}