package database

import (
	"database/sql"
	"fmt"

	//External dependencies
	log "github.com/rs/zerolog/log"
	_ "github.com/lib/pq"

	. "yogsstats/models"
)

var (
	user = "postgres"
	password = "zacharias00"
	dbIp = "localhost:5432"
	connectionStringTTT = fmt.Sprintf("postgresql://%s:%s@%s/%s", user, password, dbIp, "ttt")
)

func InsertRoundTTT(round TTTRound) error {
	log.Debug().Msg("[InsertRoundTTT]")

	db, err := sql.Open("postgres", connectionStringTTT)
	if err != nil {
		return err
	}

	for _, player := range round.Players {
		err := ensurePlayerExistence(player.Name, db)
		if err != nil {
			log.Error().Err(err).Msg("Got error while ensuring players in database")
			return err
		}
	}

	return  nil
}

func ensurePlayerExistence(player string, db *sql.DB) error {
	log.Debug().Msg("[ensurePlayerExistence]")

	checkQuery := fmt.Sprintf("SELECT 1 FROM \"Player\" WHERE name = '%s';", player)
	rows, err := db.Query(checkQuery)
	if err != nil {
		return err
	}
	defer rows.Close()

	if rows.Next() {
		log.Debug().Msgf("Player '%s' already present in the database", player)
		return nil
	} else {
		log.Debug().Msgf("No player found, inserting into database player '%s'", player)
		_, err := db.Exec(fmt.Sprintf("INSERT INTO \"Player\" VALUES ('%s', %d, %d)", player, 0, 0))
		return err
	}
}