package database

import (
	"fmt"
	"os"

	//External dependencies
	_ "github.com/lib/pq"
	log "github.com/rs/zerolog/log"
	"github.com/jmoiron/sqlx"

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

func GetRound(id string) (*TTTRound, error) {
	round := TTTRound{}

	type row struct {
		Date			string
		WinningTeam		string `db:"winning_team"`
		Randomat		string
		Player			string
		Role			string
		Team			string
	}

	rows := []row{}
	err := db.Select(&rows, fmt.Sprintf("SELECT R.date, R.winning_team, R.randomat, RP.player, RP.role, RP.team FROM round R JOIN round_participation RP ON RP.id = R.id WHERE R.id = %s;", id))
	if err != nil {
		log.Error().Err(err).Msg("Failed to query the database")
		return nil, err
	}

	round.Id = id
	round.Date = rows[0].Date
	round.Randomat = rows[0].Randomat
	round.WinningTeam = rows[0].WinningTeam

	for _, row := range rows {
		round.Players = append(round.Players, TTTPlayer{Player: Player{Name: row.Player}, Role: row.Role, Team: row.Team})
	}
	
	return &round, nil
}

func TeamWinPercentage(team string) (float64, error) {
	return 0, nil
}