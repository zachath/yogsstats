package database

//TODO: Check out the sqlx package

import (
	"database/sql"
	"fmt"

	//External dependencies
	_ "github.com/lib/pq"
	log "github.com/rs/zerolog/log"

	. "yogsstats/models"
)

var (
	user = "postgres"
	password = "zacharias00"
	dbIp = "localhost:5432"
	connectionStringTTT = fmt.Sprintf("postgresql://%s:%s@%s/%s", user, password, dbIp, "ttt")
)

func InsertRoundTTT(round *TTTRound) error {
	db, err := sql.Open("postgres", connectionStringTTT)
	if err != nil {
		return err
	}

	err = executeQuery(fmt.Sprintf("INSERT INTO \"Round\" VALUES ('%s', '%s', '%s', '%s')", round.Id, round.Date, round.WinningTeam, round.Randomat), db)
	if err != nil {
		log.Error().Err(err).Msg("Failed to insert Roud into database")
		return err
	}

	for _, player := range round.Players {
		err := ensurePlayerExistence(player.Name, db)
		if err != nil {
			log.Error().Err(err).Msg("Got error while ensuring players in database")
			return err
		}
	}

	for _, player := range round.Players {
		err = executeQuery(fmt.Sprintf("INSERT INTO \"RoundParticipation\" VALUES ('%s', '%s', '%s', '%s')", round.Id, player.Name, player.Role, player.Team), db)
		if err != nil {
			log.Error().Err(err).Msg("Failed to insert RoudParticipation into database")
			return err
		}
	}

	return nil
}

func GetTTTRound(id string) (*TTTRound, error) {
	db, err := sql.Open("postgres", connectionStringTTT)
	if err != nil {
		log.Error().Msg("Failed to connect to database")
		return nil, err
	}

	query := fmt.Sprintf("SELECT R.date, R.winning_team, R.randomat, RP.player, RP.role, RP.team FROM \"Round\" R JOIN \"RoundParticipation\" RP ON RP.id = R.id WHERE R.id = %s;", id)
	rows, err := db.Query(query)
	if err != nil {
		log.Error().Msg("Failed query")
		return nil, err
	}

	defer rows.Close()

	round := &TTTRound{}
	round.Id = id

	type row struct {
		Date		string
		WinningTeam	string
		Randomat	string
		Player		string
		Role		string
		Team		string
	}

	if rows.Next() {
		row := row{}
		rows.Scan(&row.Date, &row.WinningTeam, &row.Randomat, &row.Player, &row.Role, &row.Team)
		if err != nil {
			log.Error().Msg("Failed to scan rows")
			return nil, err
		}
		round.Date = row.Date
		round.WinningTeam = row.WinningTeam
		round.Randomat = row.Randomat
		round.Players = append(round.Players, TTTPlayer{Player: Player{Name: row.Player}, Role: row.Role, Team: row.Team})
	} else {
		log.Debug().Msg("No rows found")
		return nil, nil
	}

	for rows.Next() {
		row := row{}
		err := rows.Scan(&row.Date, &row.WinningTeam, &row.Randomat, &row.Player, &row.Role, &row.Team)
		if err != nil {
			log.Error().Msg("Failed to scan rows")
			return nil, err
		}

		round.Players = append(round.Players, TTTPlayer{Player: Player{Name: row.Player}, Role: row.Role, Team: row.Team})
	}

	return round, nil
}

func TeamWinPercentage(team string) (float64, error) {
	db, err := sql.Open("postgres", connectionStringTTT)
	if err != nil {
		log.Error().Msg("Failed to connect to database")
		return 0, err
	}

	teamInDB, err := teamExists(team, db)
	if err != nil {
		return -1, err
	} else if !teamInDB {
		return -1, fmt.Errorf("Team %s does not exist", team)
	}

	totalRowsQuery := "SELECT COUNT(id) FROM \"Round\""
	rowsOfTeam := "SELECT COUNT(id) FROM \"Round\" WHERE winning_team = '%s'"

	rows, err := db.Query(totalRowsQuery)
	if err != nil {
		return 0, err
	}

	if !rows.Next() {
		return -1, fmt.Errorf("Error querying database, received no rows.")
	}

	var totalRowsCount float64
	rows.Scan(&totalRowsCount)

	rows, err = db.Query(fmt.Sprintf(rowsOfTeam, team))
	if err != nil {
		return 0, err
	}

	if !rows.Next() {
		return -1, fmt.Errorf("Error querying database, received no rows.")
	}

	var totalRowsTeam float64
	rows.Scan(&totalRowsTeam)

	return totalRowsTeam / totalRowsCount, nil
}

func executeQuery(query string, db *sql.DB) error {
	_, err := db.Exec(query)
	return err
}

func ensurePlayerExistence(player string, db *sql.DB) error {
	checkQuery := fmt.Sprintf("SELECT 1 FROM \"Player\" WHERE name = '%s';", player)
	rows, err := db.Query(checkQuery)
	if err != nil {
		return err
	}
	defer rows.Close()

	if rows.Next() {
		return nil
	} else {
		log.Debug().Msgf("No player found, inserting into database player '%s'", player)
		_, err := db.Exec(fmt.Sprintf("INSERT INTO \"Player\" VALUES ('%s')", player))
		return err
	}
}

func teamExists(team string, db *sql.DB) (bool, error) {
	query := fmt.Sprintf("SELECT 1 FROM \"Team\" WHERE team = '%s'", team)
	rows, err := db.Query(query)
	if err != nil {
		return false, err
	}

	return rows.Next(), nil
}