package database

import (
	"database/sql"
	"fmt"
	"math"
	"os"
	"strconv"

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
	dbIp = os.Getenv("HOST") + ":5432"
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
		return errors.Wrapf(err, "Failed to add player %s to database", name)
	}
	_, err = stmt.Exec(name)
	return errors.Wrapf(err, "Failed to add player %s to database", name)
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
		return nil, errors.Wrapf(err, "Failed getting entries with query: %s", query)
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
		return -1, errors.Wrapf(err, "Failed to count rows with query: %s", query)
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
		return RoundInfo{}, errors.Errorf("Unknown sort '%s', only accepts 'ASC' or 'DESC'", sort)
	}

	query := fmt.Sprintf("SELECT id, date FROM round ORDER by id %s LIMIT 1", sort)

	var info []RoundInfo
	err := db.Select(&info, query)
	if err != nil {
		return RoundInfo{}, errors.Wrapf(err, "Failed to get round info")
	}

	return info[0], nil
}

func InsertRound(round *TTTRound) error {
	tx, err := db.Begin()
	if err != nil {
		return errors.Wrapf(err, "Failed to initialize transaction of round with id %s", round.Id)
	}

	defer tx.Rollback()

	stmt, err := tx.Prepare("INSERT INTO video (title, vid) VALUES ($1, $2) ON CONFLICT DO NOTHING;")
	if err != nil {
		return errors.Wrapf(err, "Failed to prepare insert video statment of round with id %s", round.Id)
	}
	_, err = stmt.Exec(round.Title, round.Vid)
	if err != nil {
		return errors.Wrapf(err, "Failed to insert video with id: %s of round with id %s", round.Vid, round.Id)
	}

	stmt, err = tx.Prepare("INSERT INTO round (id, date, winning_team, video, vid_start, vid_end) VALUES ($1, $2, $3, $4, $5, $6);")
	if err != nil {
		return errors.Wrapf(err, "Failed to prepare insert round statment of round with id %s", round.Id)
	}
	_, err = stmt.Exec(round.Id, round.Date, round.WinningTeam, round.Vid, round.Start, round.End)
	if err != nil {
		return errors.Wrapf(err, "Failed to insert round with id %s", round.Id)
	}

	for _, player := range round.Players {
		err := addPlayer(player.Name, tx)
		if err != nil {
			return errors.Wrapf(err, "Failed to insert round with id %s", round.Id)
		}

		stmt, err = tx.Prepare("INSERT INTO round_participation (id, player, role, team, died) VALUES ($1, $2, $3, $4, $5);")
		if err != nil {
			return errors.Wrapf(err, "Failed to prepare round participation statment, player = %s", player.Name)
		}
		_, err = stmt.Exec(round.Id, player.Name, player.Role, player.Team, player.Died)
		if err != nil {
			return errors.Wrapf(err, "Failed to insert round participation, player = %s", player.Name)
		}
	}

	tx.Commit()

	log.Info().Str("round", round.Id).Msgf("Inserted round into database")
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
		Died			string
		Title			string
		Vid				string
		Start			int		`db:"vid_start"`
		End				int		`db:"vid_end"`
	}

	rows := []row{}

	var query string
	var err error
	if id == "" {
		query = "SELECT R.id, R.date, R.winning_team, RP.player, RP.role, RP.team, RP.Died, V.Title, V.vid, R.vid_start, R.vid_end FROM round R JOIN round_participation RP ON RP.id = R.id JOIN video V ON R.id = RP.id AND V.vid = R.video WHERE R.date >= $1 AND R.date <= $2 ORDER BY R.id ASC;"
		err = db.Select(&rows, query, from, to)
	} else {
		query = "SELECT R.id, R.date, R.winning_team, RP.player, RP.role, RP.team, RP.Died, V.Title, V.vid, R.vid_start, R.vid_end FROM round R JOIN round_participation RP ON RP.id = R.id JOIN video V ON R.id = RP.id AND V.vid = R.video WHERE R.id = $1 AND R.date >= $2 AND R.date <= $3 ORDER BY R.id ASC;"
		err = db.Select(&rows, query, id, from, to)
	}

	if err != nil {
		return nil, errors.Wrapf(err, "Failed to query the database, round id = %s", id)
	}

	if len(rows) == 0 {
		log.Debug().Msg("No rows found")
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

		round.Players = append(round.Players, TTTPlayer{Player: Player{Name: row.Player}, Role: row.Role, Team: row.Team, Died: row.Died})
	}

	rounds = append(rounds, round)

	log.Info().Msg("Returning rounds")
	return rounds, nil
}

func roundup(f float64) (float64, error) {
	return strconv.ParseFloat(fmt.Sprintf("%.3f", (math.Round(f/0.001) * 0.001)), 64)
}

type TeamWinPercentageResponse struct {
	Feedback string	`json:"feedback"`
	Total	int	`json:"total"`
	Response map[string]int `json:"teams"`
}

func TeamWins(team, from, to string) (TeamWinPercentageResponse, error) {
	teams, err := getEntries("team", "team", team)
	if err != nil {
		return TeamWinPercentageResponse{Feedback: "Error getting entries."}, errors.Wrap(err, "Error getting entries")
	}

	totalRounds, err := CountRows("round", fmt.Sprintf("date >= '%s' AND date <= '%s'", from, to))
	if err != nil {
		return TeamWinPercentageResponse{Feedback: "Error counting rows."}, errors.Wrap(err, "Error counting rows")
	}

	var response TeamWinPercentageResponse
	response.Response = map[string]int{}

	response.Total = totalRounds

	if totalRounds == 0 {
		return TeamWinPercentageResponse{Feedback: "No rounds found"}, nil
	}

	for _, team := range teams {
		winsOfTeam, err := CountRows("round", fmt.Sprintf("winning_team = '%s' AND date >= '%s' AND date <= '%s'", team, from, to))
		if err != nil {
			return TeamWinPercentageResponse{Feedback: "Internal server error"}, errors.Wrap(err, "Failed counting team wins")
		}

		response.Response[team] = winsOfTeam
	}

	log.Info().Msg("Team win percentage request")
	response.Feedback = "Successfull request"
	return response, nil
}

type TeamsWinPercentage struct {
	Teams 			map[string]float64 `json:"teams"`
	RoundsPlayed	int					`json:"roundsPlayed"`
}
type PlayerWinPercentageResponse struct {
	Feedback string 						`json:"feedback"`
	Players map[string]TeamsWinPercentage 	`json:"players"`
}

func PlayerWinPercentage(player, from, to string, round bool) (PlayerWinPercentageResponse, error) {
	players, err := getEntries("player", "name", player)
	if err != nil {
		return PlayerWinPercentageResponse{Feedback: "Error getting entries"}, errors.Wrap(err, "Error getting entries")
	}

	type row struct {
		Team	string
		Win		string `db:"winning_team"`
	}

	response := PlayerWinPercentageResponse{
		Players: make(map[string]TeamsWinPercentage),
	}

	for _, player := range players {
		roundsPlayed := 0
		teams, err := getEntries("team", "team", "*")
		if err != nil {
			return PlayerWinPercentageResponse{Feedback: "Error getting entries"}, errors.Wrap(err, "Error getting entries")
		}

		response.Players[player] = TeamsWinPercentage{Teams: make(map[string]float64)}
		for _, team := range teams {
			query := "SELECT RP.team, R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = $1 AND R.date >= $2 AND R.date <= $3 AND RP.team = $4;"
			var rows []row
			err = db.Select(&rows, query, player, from, to, team)
			if err != nil {
				return PlayerWinPercentageResponse{Feedback: fmt.Sprintf("Error getting player rows (%s)", player)}, errors.Wrapf(err, "Error getting player rows (%s)", player)
			}

			roundsPlayed += len(rows)

			if len(rows) == 0 {
				continue
			}

			wins := 0
			for _, row := range rows {
				if row.Team == row.Win {
					wins++
				}
			}

			result := float64(wins) / float64(len(rows))
			if round {
				f, err := roundup(result)
				if err != nil {
					log.Error().Err(err).Msg("Failed to round result.")
					response.Players[player].Teams[team] = result
				}
				response.Players[player].Teams[team] = f
			} else {
				response.Players[player].Teams[team] = result
			}
		}

		entry, _ := response.Players[player]
		entry.RoundsPlayed = roundsPlayed
		response.Players[player] = entry
	}

	response.Feedback = "Successfull request"
	return response, nil
}

type DetectiveWinPercentageEntry struct {
	WinRate 		float64
	RoundsPlayed	int
}
type DetecitveWinPercentageResponse struct {
	Feedback string 			`json:"feedback"`
	Players map[string]DetectiveWinPercentageEntry 	`json:"players"`
}

func DetectiveWinPercentage(player, from, to string, canon, round bool) (DetecitveWinPercentageResponse, error) {
	players, err := getEntries("player", "name", player)
	if err != nil {
		return DetecitveWinPercentageResponse{Feedback: "Error getting entries"}, errors.Wrap(err, "Error getting entries")
	}

	response := DetecitveWinPercentageResponse{
		Players: make(map[string]DetectiveWinPercentageEntry),
	}

	for _, player := range players {
		dWin, roundsPlayed, err := detectiveWinPercentage(player, from, to, round)
		if err != nil {
			return DetecitveWinPercentageResponse{Feedback: fmt.Sprintf("Error getting detective win percentage (%s)", player)}, errors.Wrap(err, "Error getting detective win percentage")
		}

		if canon && player == "Zylus" {
			log.Info().Msg("Canon rounds, setting detective win percentage of Zylus to 1.")
			dWin = 1
		}

		response.Players[player] = DetectiveWinPercentageEntry{WinRate: dWin, RoundsPlayed: roundsPlayed}
	}

	response.Feedback = "Successfull request"
	return response, nil
}

func detectiveWinPercentage(player, from, to string, round bool) (float64, int, error) {
	query := "SELECT R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id JOIN role RO ON RP.role = RO.role WHERE RP.player = $1 AND date >= $2 AND date <= $3 AND RO.detective = 'd';"

	type row struct {
		Role	string 
		Win		string `db:"winning_team"`
	}

	var rows []row
	err := db.Select(&rows, query, player, from, to)
	if err != nil {
		return -1, -1, errors.Wrap(err, "Error selecting with detective query")
	}

	if len(rows) == 0 {
		return 0, 0, nil
	}

	var wins float64
	for _, row := range rows {
		if row.Win == "innocents" {
			wins++
		}
	}

	rate := wins / float64(len(rows))

	if round {
		rate, err := roundup(rate)
		return rate, len(rows), err
	}

	return rate, len(rows), nil
}

type TraitorComboEntry struct {
	RoundsTogether 	int
	WinRate			float64
}
type TraitorCombosResponse struct {
	Feedback string	`json:"feedback"`
	Combos map[string]map[string]TraitorComboEntry `json:"combos"`
}

func TraitorCombos(player, from, to string, round bool) (TraitorCombosResponse, error) {
	selectedPlayers, err := getEntries("player", "name", player)
	if err != nil {
		return TraitorCombosResponse{Feedback: "Error getting entries"}, errors.Wrapf(err, "Error getting entries, player = %s", player)
	}

	allPlayers, err := getEntries("player", "name", "*")
	if err != nil {
		return TraitorCombosResponse{Feedback: "Error getting entries"}, errors.Wrapf(err, "Error getting entries, player = %s", player)
	}

	response := TraitorCombosResponse{Combos: make(map[string]map[string]TraitorComboEntry)}

	for _, player := range selectedPlayers {
		playerRounds, err := getTraitorRounds(player, from, to)
		if err != nil {
			return TraitorCombosResponse{Feedback: "Error getting combo win %"}, errors.Wrapf(err, "Error getting combo win percentage, player = %s, player")
		}
		for _, other := range allPlayers {
			if _, alreadyDone := response.Combos[player][other]; other != player && !alreadyDone {
				comboWinRate, err, commonRounds := getTraitorWinRate(playerRounds, other, from, to, round)
				if err != nil {
					log.Error().Err(err).Msg("")
					return TraitorCombosResponse{Feedback: "Error getting combo win %"}, errors.Wrapf(err, "Error getting combo win percentage, player = %s & other = %s", player, other)
				}

				if commonRounds == 0 {
					continue
				}
				
				if response.Combos[player] == nil {
					response.Combos[player] = make(map[string]TraitorComboEntry)
				}
				response.Combos[player][other] = TraitorComboEntry{WinRate: comboWinRate, RoundsTogether: commonRounds}

				if player == "*" {
					if response.Combos[other] == nil {
						response.Combos[other] = make(map[string]TraitorComboEntry)
					}
					response.Combos[other][player] = TraitorComboEntry{WinRate: comboWinRate, RoundsTogether: commonRounds}
				}
			}
		}
	}

	log.Info().Msg("Traitor combo request")
	response.Feedback = "Successfull request"
	return response, nil
}

func getTraitorWinRate(player1Rounds []traitorRound, player2, from, to string, round bool) (float64, error, int) {
	player2Rounds, err := getTraitorRounds(player2, from, to)
	if err != nil {
		return -1, err, 0
	}

	var len int
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
		return 0, nil, len
	}

	rate := wins / float64(len)

	if round {
		f, err := roundup(rate)
		return f, err, len
	}

	return rate, nil, len
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