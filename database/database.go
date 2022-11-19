package database

import (
	"errors"
	"fmt"
	"os"
	"strconv"

	//External dependencies
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
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

func InsertRound(round *TTTRound) error {
	tx := db.MustBegin()
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

func TeamWinPercentage(team string) (float64, error) {
	return 0, nil
}