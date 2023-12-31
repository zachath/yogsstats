package database

import (
	"fmt"
	"os"
	"yogsstats/models"

	"github.com/jmoiron/sqlx"
	"github.com/pingcap/errors"
	log "github.com/rs/zerolog/log"
)

var (
	user2                         = "postgres"
	password2                     = os.Getenv("PQ_PASS")
	dbIp2                         = os.Getenv("HOST") + ":5432"
	connectionStringTTT2          = fmt.Sprintf("postgresql://%s:%s@%s/%s", user2, password2, dbIp2, "ttt2")
	db2                  *sqlx.DB = initDB2(connectionStringTTT2)
)

func initDB2(connectionString string) *sqlx.DB {
	db, err := sqlx.Open("postgres", connectionString)
	if err != nil {
		log.Panic().Err(err).Msg("Failed to init database, exiting...")
		os.Exit(1)
	}

	return db
}

func GetRound2(players bool, from, to, where string, args ...string) (models.Round2, error) {
	rounds, err := GetRounds(players, from, to, fmt.Sprintf("%s LIMIT 1;", where), args...)
	if err != nil {
		return models.Round2{}, errors.Annotate(err, "failed to get round")
	} else if len(rounds) != 1 {
		return models.Round2{}, errors.Annotatef(err, "failed to get round, expected 1 but got %d", len(rounds))
	}

	return rounds[0], nil
}

func GetRounds(players bool, from, to, where string, args ...string) ([]models.Round2, error) {
	rounds := []models.Round2{}

	type row struct {
		Video        string  `db:"video"`
		Title        string  `db:"title"`
		IntroDeath   bool    `db:"intro_death"`
		Date         string  `db:"date"`
		Id           string  `db:"id"`
		WinningTeam  string  `db:"winning_team"`
		Start        int     `db:"round_start"`
		End          int     `db:"round_end"`
		Length       int     `db:"length"`
		JesterKiller *string `db:"jester_killer"`
	}

	rows := []row{}
	query := "SELECT video, V.title, V.intro_death, V.date, id, winning_team, round_start, round_end, (round_end - round_start) as length, jester_killer FROM rounds JOIN videos V ON video = V.video_id WHERE V.date >= $1 AND V.date <= $2"

	if where == "" {
		query = query + " ORDER BY V.date DESC;"
	} else {
		query = query + where
	}

	arguments := []interface{}{}
	arguments = append(arguments, from)
	arguments = append(arguments, to)
	for _, arg := range args {
		arguments = append(arguments, arg)
	}

	err := db2.Select(&rows, query, arguments...)
	if err != nil {
		return nil, errors.Wrap(err, "failed to get rounds")
	}

	for _, row := range rows {
		playerParticipations := []models.RoundParticipation{}
		if players {
			err = db2.Select(&playerParticipations, "SELECT * from round_participation WHERE id = $1;", row.Id)
			if err != nil {
				return nil, errors.Wrapf(err, "failed to get player participations of round '%s'", row.Id)
			}
		}

		video := models.Video2{
			Id:         row.Video,
			Date:       row.Date,
			Title:      row.Title,
			IntroDeath: row.IntroDeath,
		}

		round := models.Round2{
			Id:          row.Id,
			Video:       video,
			Players:     playerParticipations,
			WinningTeam: row.WinningTeam,
			Start:       row.Start,
			End:         row.End,
			Length:      row.Length,
		}

		if row.JesterKiller != nil {
			round.JesterKiller = models.Player2{Name: *row.JesterKiller}
		}

		rounds = append(rounds, round)
	}

	return rounds, nil
}

func InsertRound2(round models.Round2) error {
	tx, err := db2.Beginx()
	if err != nil {
		return errors.Annotate(err, "failed to begin transaction")
	}

	if round.JesterKiller.Name == "" {
		_, err = tx.Exec("INSERT INTO rounds VALUES ($1, $2, $3, $4, $5);", round.Id, round.WinningTeam, round.Video.Id, round.Start, round.End)
	} else {
		_, err = tx.Exec("INSERT INTO rounds VALUES ($1, $2, $3, $4, $5, $6);", round.Id, round.WinningTeam, round.Video.Id, round.Start, round.End, round.JesterKiller.Name)
	}

	if err != nil {
		if rollback := tx.Rollback(); rollback != nil {
			return errors.Annotate(rollback, "failed to perform & rollback query")
		}
		return errors.Annotate(err, "failed to perform query")
	}

	for _, rp := range round.Players {
		_, err = tx.Exec("INSERT INTO round_participation VALUES ($1, $2, $3, $4);", round.Id, rp.Player, rp.Role, rp.Team)
		if err != nil {
			if rollback := tx.Rollback(); rollback != nil {
				return errors.Annotate(rollback, "failed to perform & rollback query")
			}
			return errors.Annotate(err, "failed to perform query")
		}
	}

	return tx.Commit()
}

func GetVideos(from, to, where string, args ...string) ([]models.Video2, error) {
	videos := []models.Video2{}
	query := "SELECT video_id, title, intro_death, date FROM videos WHERE date >= $1 AND date <= $2"

	if where == "" {
		query = query + " ORDER BY date DESC;"
	} else {
		query = query + where
	}

	arguments := []interface{}{}
	arguments = append(arguments, from)
	arguments = append(arguments, to)
	for _, arg := range args {
		arguments = append(arguments, arg)
	}

	log.Debug().Str("query", query).Msg("")

	err := db2.Select(&videos, query, arguments...)
	if err != nil {
		return nil, errors.Wrap(err, "failed to get rounds")
	}

	return videos, nil
}

func GetVideo2(from, to, where string, args ...string) (models.Video2, error) {
	videos, err := GetVideos(from, to, fmt.Sprintf("%s LIMIT 1;", where), args...)
	if err != nil {
		return models.Video2{}, errors.Annotate(err, "failed to get video")
	} else if len(videos) != 1 {
		return models.Video2{}, errors.Annotatef(err, "failed to get video, expected 1 but got %d", len(videos))
	}

	return videos[0], nil
}

func GetTeams2(canWin bool) ([]models.Team2, error) {
	var query string
	if canWin {
		query = "SELECT * FROM teams WHERE can_Win = true;"
	} else {
		query = "SELECT * FROM teams;"
	}

	teams := []models.Team2{}
	err := db2.Select(&teams, query)
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return teams, nil
}

func GetRolesOfTeam(team string) ([]string, error) {
	var roles []string
	err := db2.Select(&roles, "SELECT role FROM roles_by_teams WHERE team = $1;", team)
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return roles, nil
}

func GetTeamWins(team, from, to string) (int, error) {
	var wins []int
	err := db2.Select(&wins, "SELECT COUNT(*) FROM rounds JOIN videos V ON video = V.video_id WHERE winning_team = $1 AND date >= $2 AND date <= $3", team, from, to)
	if err != nil {
		return 0, errors.Annotate(err, "failed to perform query")
	}

	if len(wins) != 1 {
		return 0, errors.Annotatef(err, "received wrong lenght of slice: %d", len(wins))
	}

	return wins[0], nil
}

func InsertTeam(team models.Team2) error {
	tx, err := db2.Beginx()
	if err != nil {
		return errors.Annotate(err, "failed to begin transaction")
	}

	_, err = tx.Exec("INSERT INTO teams VALUES ($1, $2);", team.TeamName, team.CanWin)
	if err != nil {
		if rollback := tx.Rollback(); rollback != nil {
			return errors.Annotate(rollback, "failed to perform & rollback query")
		}
		return errors.Annotate(err, "failed to perform query")
	}

	for _, role := range team.PossibleRoles {
		_, err = tx.Exec("INSERT INTO roles_by_teams VALUES ($1, $2);", role, team.TeamName)
		if err != nil {
			if rollback := tx.Rollback(); rollback != nil {
				return errors.Annotate(rollback, "failed to perform & rollback query")
			}
			return errors.Annotate(err, "failed to perform query")
		}
	}

	return tx.Commit()
}

func GetRoles2() ([]models.Role2, error) {
	roles := []models.Role2{}
	err := db2.Select(&roles, "SELECT * FROM roles;")
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return roles, nil
}

func InsertRole(role models.Role2) error {
	tx, err := db2.Beginx()
	if err != nil {
		return errors.Annotate(err, "failed to begin transaction")
	}

	_, err = tx.Exec("INSERT INTO roles VALUES ($1, $2);", role.RoleName, role.Detective)
	if err != nil {
		if rollback := tx.Rollback(); rollback != nil {
			return errors.Annotate(rollback, "failed to perform & rollback query")
		}
		return errors.Annotate(err, "failed to perform query")
	}

	for _, team := range role.PossibleTeams {
		_, err = tx.Exec("INSERT INTO roles_by_teams VALUES ($1, $2);", role.RoleName, team)
		if err != nil {
			if rollback := tx.Rollback(); rollback != nil {
				return errors.Annotate(rollback, "failed to perform & rollback query")
			}
			return errors.Annotate(err, "failed to perform query")
		}
	}

	return tx.Commit()
}

func GetTeamsOfRole(role string) ([]string, error) {
	var roles []string
	err := db2.Select(&roles, "SELECT team FROM roles_by_teams WHERE role = $1;", role)
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return roles, nil
}

func InsertVideo2(video models.Video2) error {
	_, err := db2.Exec("INSERT INTO videos VALUES ($1, $2, $3, $4);", video.Id, video.Title, video.IntroDeath, video.Date)
	if err != nil {
		return errors.Annotate(err, "failed to perform query")
	}

	return nil
}

func GetAllPlayers() ([]models.Player2, error) {
	return nil, nil
}

func InsertPlayer(name string) error {
	_, err := db2.Exec("INSERT INTO players VALUES ($1);", name)
	if err != nil {
		return errors.Annotate(err, "failed to perform query")
	}

	return nil
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
