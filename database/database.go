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

type UserFeedback struct {
	Feedback string
}

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

func getTeams(team string) ([]string, error) {
	var query string
	if team == "*" {
		query = "SELECT * FROM team;"
	} else {
		query = fmt.Sprintf("SELECT * FROM team WHERE team = '%s';", team)
	}

	var rows []string
	err := db.Select(&rows, query)
	if err != nil {
		return nil, errors.Wrap(err, query)
	}

	var teams []string
	for _, t := range rows {
		teams = append(teams, t)
	}

	return teams, nil
}

func countRows(table, whereClause string) (int, error) {
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

func InsertRound(round *TTTRound) error {
	tx := db.MustBegin()

	escapeCharacter(&round.Randomat, "'")

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
			return nil, errors.New(fmt.Sprintf("Invalid id lenght %d, must be of lenght 8 or 9", len(id)))
		} 

		query = fmt.Sprintf("SELECT R.id, R.date, R.winning_team, R.randomat, RP.player, RP.role, RP.team FROM round R JOIN round_participation RP ON RP.id = R.id WHERE R.id = %s ORDER BY R.id ASC;", id)
	} else {
		query = fmt.Sprintf("SELECT R.id, R.date, R.winning_team, R.randomat, RP.player, RP.role, RP.team FROM round R JOIN round_participation RP ON RP.id = R.id WHERE R.date >= '%s' AND R.date <= '%s' ORDER BY R.id ASC;", from, to)
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

			round = TTTRound{Round: Round{Id: strconv.Itoa(row.Id), Date: row.Date}, Randomat: row.Randomat, WinningTeam: row.WinningTeam}
		}

		round.Players = append(round.Players, TTTPlayer{Player: Player{Name: row.Player}, Role: row.Role, Team: row.Team})
	}

	rounds = append(rounds, round)

	return rounds, nil
}

type TeamWinShareResponse struct {
	UserFeedback UserFeedback	`json:"feedback"`
	Response map[string]float64 `json:"response"`
}

func TeamWinShare(team, from, to string) (TeamWinShareResponse, error) {
	teams, err := getTeams(team)
	if err != nil {
		return TeamWinShareResponse{}, err
	}

	totalRounds, err := countRows("round", fmt.Sprintf("date >= '%s' AND date <= '%s'", from, to))
	if err != nil {
		return TeamWinShareResponse{UserFeedback: UserFeedback{"Error counting rows"}}, err
	}

	if totalRounds == 0 {
		return TeamWinShareResponse{UserFeedback: UserFeedback{Feedback: "No rounds found"}}, nil
	}

	var response TeamWinShareResponse
	response.Response = map[string]float64{}
	for _, team := range teams {
		winsOfTeam, err := countRows("round", fmt.Sprintf("winning_team = '%s' AND date >= '%s' AND date <= '%s'", team, from, to))
		if err != nil {
			return TeamWinShareResponse{UserFeedback: UserFeedback{"Internal server erros"}}, err
		}

		result := float64(winsOfTeam) / float64(totalRounds)
		response.Response[team] = float64(int(result*100)) / 1000
	}

	response.UserFeedback.Feedback = "Successfull requst"
	return response, nil
}