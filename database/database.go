package database

import (
	"database/sql"
	"fmt"
	"os"
	"strconv"

	//External dependencies
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"github.com/pingcap/errors"
	log "github.com/rs/zerolog/log"

	models "yogsstats/models"
)

var (
	user                         = "postgres"
	password                     = os.Getenv("PQ_PASS")
	dbIp                         = os.Getenv("HOST") + ":5432"
	connectionStringTTT          = fmt.Sprintf("postgresql://%s:%s@%s/%s", user, password, dbIp, "ttt")
	db                  *sqlx.DB = initDB(connectionStringTTT)
)

func initDB(connectionString string) *sqlx.DB {
	db, err := sqlx.Open("postgres", connectionString)
	if err != nil {
		log.Panic().Err(err).Msg("Failed to init database, exiting...")
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

func GetEntries(cols, table, column, value string) ([]string, error) {
	var query string
	if value == "*" {
		query = fmt.Sprintf("SELECT %s FROM %s;", cols, table)
	} else {
		query = fmt.Sprintf("SELECT %s FROM %s WHERE %s = '%s';", cols, table, column, value)
	}

	var rows []string
	err := db.Select(&rows, query)
	if err != nil {
		return nil, errors.Wrapf(err, "Failed getting entries with query: %s", query)
	}

	var entries []string
	entries = append(entries, rows...)

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
	Id   string `json:"id"`
	Date string `json:"date"`
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

func InsertVideo(video *models.Video) error {
	tx, err := db.Begin()
	if err != nil {
		return errors.Wrapf(err, "Failed to initialize transaction of video with Vid %s", video.Vid)
	}

	defer tx.Rollback()

	stmt, err := tx.Prepare("INSERT INTO video (title, vid, intro_death, date) VALUES ($1, $2, $3, $4) ON CONFLICT DO NOTHING;")
	if err != nil {
		return errors.Wrapf(err, "Failed to prepare insert video statment of video with vid %s", video.Vid)
	}
	_, err = stmt.Exec(video.Title, video.Vid, video.IntroDeath, video.Date)
	if err != nil {
		return errors.Wrapf(err, "Failed to insert video with vid: %s", video.Vid)
	}

	tx.Commit()

	log.Info().Str("video", video.Vid).Msgf("Inserted video into database")
	return nil
}

func checkVideoExists(vid string) error {
	len, err := CountRows("video", fmt.Sprintf("vid = '%s'", vid))
	if err != nil {
		return err
	}

	if len != 1 {
		return errors.New("No video found")
	}

	return nil
}

func InsertRound(round *models.Round) error {
	err := checkVideoExists(round.Vid)
	if err != nil {
		return errors.Wrapf(err, "Video with vid %s does not exist in database.", round.Vid)
	}

	tx, err := db.Begin()
	if err != nil {
		return errors.Wrapf(err, "Failed to initialize transaction of round with id %s", round.Id)
	}

	defer tx.Rollback()

	stmt, err := tx.Prepare("INSERT INTO round (id, date, winning_team, video, vid_start, vid_end) VALUES ($1, $2, $3, $4, $5, $6);")
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

func GetVideo(vid, from, to string) ([]models.Video, error) {
	videos := []models.Video{}

	type row struct {
		Title      string
		Date       string
		Vid        string
		IntroDeath string `db:"intro_death"`
	}

	rows := []row{}

	var query string
	var err error
	if vid == "" {
		query = "SELECT * FROM video WHERE date >= $1 AND date <= $2 ORDER BY date DESC;"
		err = db.Select(&rows, query, from, to)
	} else {
		query = "SELECT * FROM video WHERE vid = $1 AND date >= $2 AND date <= $3 ORDER BY date DESC;"
		err = db.Select(&rows, query, vid, from, to)
	}

	if err != nil {
		return nil, errors.Wrapf(err, "Failed to query the database, video vid = %s", vid)
	}

	if len(rows) == 0 {
		log.Debug().Msg("No rows found")
		return nil, nil
	}

	for _, row := range rows {
		video := models.Video{Vid: row.Vid, Date: row.Date, IntroDeath: row.IntroDeath, Title: row.Title}
		videos = append(videos, video)
	}

	return videos, nil
}

func GetRound(id, from, to string) ([]models.Round, error) {
	rounds := []models.Round{}

	type row struct {
		Id          int
		Date        string
		WinningTeam string `db:"winning_team"`
		Player      string
		Role        string
		Team        string
		Died        string
		Vid         string
		Start       int `db:"vid_start"`
		End         int `db:"vid_end"`
	}

	rows := []row{}

	var query string
	var err error
	if id == "" {
		query = "SELECT R.id, R.date, R.winning_team, RP.player, RP.role, RP.team, RP.Died, V.vid, R.vid_start, R.vid_end FROM round R JOIN round_participation RP ON RP.id = R.id JOIN video V ON R.id = RP.id AND V.vid = R.video WHERE R.date >= $1 AND R.date <= $2 ORDER BY R.id DESC;"
		err = db.Select(&rows, query, from, to)
	} else {
		query = "SELECT R.id, R.date, R.winning_team, RP.player, RP.role, RP.team, RP.Died, V.vid, R.vid_start, R.vid_end FROM round R JOIN round_participation RP ON RP.id = R.id JOIN video V ON R.id = RP.id AND V.vid = R.video WHERE R.id = $1 AND R.date >= $2 AND R.date <= $3 ORDER BY R.id DESC;"
		err = db.Select(&rows, query, id, from, to)
	}

	if err != nil {
		return nil, errors.Wrapf(err, "Failed to query the database, round id = %s", id)
	}

	if len(rows) == 0 {
		log.Debug().Msg("No rows found")
		return nil, nil
	}

	var round models.Round
	for _, row := range rows {
		if round.Id != strconv.Itoa(row.Id) {
			if round.Id != "" {
				rounds = append(rounds, round)
			}

			round = models.Round{Id: strconv.Itoa(row.Id), Date: row.Date, Vid: row.Vid, Start: row.Start, End: row.End, WinningTeam: row.WinningTeam}
		}

		round.Players = append(round.Players, models.Player{Name: row.Player, Role: row.Role, Team: row.Team, Died: row.Died})
	}

	rounds = append(rounds, round)

	log.Info().Msg("Returning rounds")
	return rounds, nil
}

type RoundParticipationTeams struct {
	Team string
	Win  string `db:"winning_team"`
}

func GetRoundParticipationTeamsByPlayer(player, from, to, team string) ([]RoundParticipationTeams, error) {
	query := "SELECT RP.team, R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = $1 AND R.date >= $2 AND R.date <= $3 AND RP.team = $4;"

	var rows []RoundParticipationTeams
	err := db.Select(&rows, query, player, from, to, team)
	if err != nil {
		return []RoundParticipationTeams{}, errors.Wrapf(err, "Error getting player rows (%s)", player)
	}

	return rows, nil
}

func InnocentWinsByPlayer(player, from, to string, round bool) (int, error) {
	query := "SELECT COUNT(*) FROM round_participation RP JOIN round R ON RP.id = R.id JOIN role RO ON RP.role = RO.role WHERE RP.player = $1 AND date >= $2 AND date <= $3 AND RO.detective = 'd' AND R.winning_team = 'innocents';"

	var wins []int
	err := db.Select(&wins, query, player, from, to)
	if err != nil {
		return -1, errors.Wrap(err, "Error counting innocent wins")
	}

	return wins[0], nil
}

func DetectiveRoundsByPlayer(player, from, to string) (int, error) {
	query := "SELECT COUNT(*) FROM round_participation RP JOIN round R ON RP.id = R.id JOIN role RO ON RP.role = RO.role WHERE RP.player = $1 AND date >= $2 AND date <= $3 AND RO.detective = 'd';"

	var rounds []int
	err := db.Select(&rounds, query, player, from, to)
	if err != nil {
		return -1, errors.Wrap(err, "Error counting innocent wins")
	}

	return rounds[0], nil
}

func GetTraitorRounds(player, from, to string) ([]models.TraitorRound, error) {
	query := "SELECT R.id, R.winning_team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = $1 AND R.date >= $2 AND R.date <= $3 AND RP.team = 'traitors';"

	var rounds []models.TraitorRound
	err := db.Select(&rounds, query, player, from, to)
	if err != nil {
		return nil, err
	}

	return rounds, nil
}

func WinsByRole(player, role, from, to string) (int, int, error) {
	query := "SELECT R.winning_team, RP.team FROM round_participation RP JOIN round R ON RP.id = R.id WHERE RP.player = $1 AND R.date >= $2 AND R.date <= $3 AND RP.role = $4;"

	type row struct {
		WinningTeam string `db:"winning_team"`
		Team        string
	}

	var rows []row
	err := db.Select(&rows, query, player, from, to, role)
	if err != nil {
		return 0, 0, err
	}

	roundsPlayed := len(rows)
	wins := 0
	for _, row := range rows {
		if row.WinningTeam == row.Team {
			wins++
		}
	}

	return wins, roundsPlayed, nil
}
