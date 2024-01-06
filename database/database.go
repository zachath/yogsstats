package database

import (
	"fmt"
	"os"
	"sync"
	"yogsstats/models"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"github.com/pingcap/errors"
	log "github.com/rs/zerolog/log"
)

var (
	user                         = "postgres"
	password                     = os.Getenv("PQ_PASS")
	dbIp                         = os.Getenv("HOST") + ":5432"
	connectionStringTTT          = fmt.Sprintf("postgresql://%s:%s@%s/%s", user, password, dbIp, "ttt2")
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

func GetRound(players bool, from, to, where string, args ...string) (models.Round, error) {
	rounds, err := GetRounds(players, from, to, fmt.Sprintf("%s LIMIT 1;", where), args...)
	if err != nil {
		return models.Round{}, errors.Annotate(err, "failed to get round")
	} else if len(rounds) != 1 {
		return models.Round{}, errors.Annotatef(err, "failed to get round, expected 1 but got %d", len(rounds))
	}

	return rounds[0], nil
}

func GetRounds(players bool, from, to, where string, args ...string) ([]models.Round, error) {
	rounds := []models.Round{}

	type row struct {
		Video        string  `db:"video"`
		Title        string  `db:"title"`
		IntroDeath   bool    `db:"intro_death"`
		Date         string  `db:"date"`
		Id           int     `db:"id"`
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

	err := db.Select(&rows, query, arguments...)
	if err != nil {
		return nil, errors.Wrap(err, "failed to get rounds")
	}

	for _, row := range rows {
		playerParticipations := []models.RoundParticipation{}
		if players {
			err = db.Select(&playerParticipations, "SELECT * from round_participation WHERE id = $1;", row.Id)
			if err != nil {
				return nil, errors.Annotatef(err, "failed to get player participations of round '%s'", row.Id)
			}
		}

		video := models.Video{
			Id:         row.Video,
			Date:       row.Date,
			Title:      row.Title,
			IntroDeath: row.IntroDeath,
		}

		round := models.Round{
			Id:          row.Id,
			Video:       video,
			Players:     playerParticipations,
			WinningTeam: row.WinningTeam,
			Start:       row.Start,
			End:         row.End,
			Length:      row.Length,
		}

		if row.JesterKiller != nil {
			round.JesterKiller = *row.JesterKiller
		}

		rounds = append(rounds, round)
	}

	return rounds, nil
}

func InsertRound(round models.Round) error {
	tx, err := db.Beginx()
	if err != nil {
		return errors.Annotate(err, "failed to begin transaction")
	}

	if round.JesterKiller == "" {
		_, err = tx.Exec("INSERT INTO rounds VALUES ($1, $2, $3, $4, $5);", round.Id, round.WinningTeam, round.Video.Id, round.Start, round.End)
	} else {
		_, err = tx.Exec("INSERT INTO rounds VALUES ($1, $2, $3, $4, $5, $6);", round.Id, round.WinningTeam, round.Video.Id, round.Start, round.End, round.JesterKiller)
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

func GetVideos(from, to, where string, args ...string) ([]models.Video, error) {
	videos := []models.Video{}
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

	err := db.Select(&videos, query, arguments...)
	if err != nil {
		return nil, errors.Wrap(err, "failed to get rounds")
	}

	return videos, nil
}

func GetVideo(from, to, where string, args ...string) (models.Video, error) {
	videos, err := GetVideos(from, to, fmt.Sprintf("%s LIMIT 1;", where), args...)
	if err != nil {
		return models.Video{}, errors.Annotate(err, "failed to get video")
	} else if len(videos) != 1 {
		return models.Video{}, errors.Annotatef(err, "failed to get video, expected 1 but got %d", len(videos))
	}

	return videos[0], nil
}

func GetTeams(canWin bool) ([]models.Team, error) {
	var query string
	if canWin {
		query = "SELECT * FROM teams WHERE can_Win = true;"
	} else {
		query = "SELECT * FROM teams;"
	}

	teams := []models.Team{}
	err := db.Select(&teams, query)
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return teams, nil
}

func GetRolesOfTeam(team string) ([]string, error) {
	var roles []string
	err := db.Select(&roles, "SELECT role FROM roles_by_teams WHERE team = $1;", team)
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return roles, nil
}

func GetTeamWins(team, from, to string) (int, error) {
	var wins []int
	err := db.Select(&wins, "SELECT COUNT(*) FROM rounds JOIN videos V ON video = V.video_id WHERE winning_team = $1 AND date >= $2 AND date <= $3", team, from, to)
	if err != nil {
		return 0, errors.Annotate(err, "failed to perform query")
	}

	if len(wins) != 1 {
		return 0, errors.Annotatef(err, "received wrong lenght of slice: %d", len(wins))
	}

	return wins[0], nil
}

func InsertTeam(team models.Team) error {
	tx, err := db.Beginx()
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

func GetRoles(canwin bool) ([]models.Role, error) {
	roles := []models.Role{}

	var err error

	if canwin {
		err = db.Select(&roles, "SELECT * FROM roles WHERE role IN (SELECT role FROM roles_by_teams RT JOIN teams T ON T.team = RT.team WHERE T.can_win);")
	} else {
		err = db.Select(&roles, "SELECT * FROM roles;")
	}
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return roles, nil
}

func InsertRole(role models.Role) error {
	tx, err := db.Beginx()
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
	err := db.Select(&roles, "SELECT team FROM roles_by_teams WHERE role = $1;", role)
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return roles, nil
}

func InsertVideo(video models.Video) error {
	_, err := db.Exec("INSERT INTO videos VALUES ($1, $2, $3, $4);", video.Id, video.Title, video.IntroDeath, video.Date)
	if err != nil {
		return errors.Annotate(err, "failed to perform query")
	}

	return nil
}

func GetAllPlayerNames() ([]string, error) {
	var playerNames []string
	err := db.Select(&playerNames, "SELECT * FROM players;")
	if err != nil {
		return nil, errors.Annotate(err, "failed to perform query")
	}

	return playerNames, nil
}

func GetAllPlayers(from, to string, playerNames []string, canon bool) ([]models.Player, error) {
	teams, err := GetTeams(true)
	if err != nil {
		return nil, errors.Annotate(err, "failed to get teams")
	}

	roles, err := GetRoles(true)
	if err != nil {
		return nil, errors.Annotate(err, "failed to get roles")
	}

	players := []models.Player{}
	mu := sync.Mutex{}
	wg := sync.WaitGroup{}

	tc := map[string]map[string]models.WinPercentageStat{}
	tcmu := sync.Mutex{}
	for _, p := range playerNames {
		wg.Add(1)
		go func(name string) {
			defer wg.Done()

			player := models.Player{
				Name: name,
			}

			player.DetectiveWinPercentage, err = detectiveWinPercentage(player.Name, from, to, canon)
			if err != nil {
				log.Error().Stack().Err(err).Str("player", name).Msg("failed to get detective win percentage")
				return
			}

			player.TeamWinPercentage, err = teamWinPercentage(player.Name, from, to, teams)
			if err != nil {
				log.Error().Stack().Err(err).Str("player", name).Msg("failed to get team win percentage")
				return
			}

			player.RoleWinPercentage, err = roleWinPercentage(player.Name, from, to, roles)
			if err != nil {
				log.Error().Stack().Err(err).Str("player", name).Msg("failed to get team win percentage")
				return
			}

			player.TraitorCombos, err = traitorCombos(player.Name, from, to, &tc, &tcmu)
			if err != nil {
				log.Error().Stack().Err(err).Str("player", name).Msg("failed to get traitor win percentage")
				return
			}

			player.JesterKills, err = jesterKills(player.Name, from, to)
			if err != nil {
				log.Error().Stack().Err(err).Str("player", name).Msg("failed to get jester kills")
				return
			}

			mu.Lock()
			players = append(players, player)
			mu.Unlock()
		}(p)
	}

	wg.Wait()

	return players, nil
}

func detectiveWinPercentage(player, from, to string, canon bool) (models.WinPercentageStat, error) {
	var stat []models.WinPercentageStat
	err := db.Select(
		&stat,
		"SELECT trunc(A.wins / (B.total)::numeric,3) as percentage, A.wins as wins, B.total as total FROM (SELECT COUNT(*) as wins FROM round_participation RP JOIN rounds R ON RP.id = R.id JOIN roles RO ON RP.role = RO.role JOIN videos V on R.video = V.video_id WHERE RP.player = $1 AND V.date >= $2 AND V.date <= $3 AND RO.is_detective = true AND R.winning_team = 'innocents') as A, (SELECT COUNT(*) as total FROM round_participation RP JOIN rounds R ON RP.id = R.id JOIN roles RO ON RP.role = RO.role JOIN videos V on R.video = V.video_id WHERE RP.player = $1 AND V.date >= $2 AND V.date <= $3 AND RO.is_detective = true) as B;",
		player,
		from,
		to,
	)
	if err != nil {
		if err.Error() == "pq: division by zero" {
			return models.WinPercentageStat{}, nil
		}
		return models.WinPercentageStat{}, errors.Annotatef(err, "failed to get detective percentage for player '%s'", player)
	}

	if len(stat) != 1 {
		return models.WinPercentageStat{}, errors.Errorf("got unexpected amount of rows: %d", len(stat))
	}

	s := stat[0]
	if canon && player == "Zylus" {
		s.Percentage = 1
		s.Rounds = s.Wins
	}

	return s, nil
}

func teamWinPercentage(player, from, to string, teams []models.Team) ([]models.WinPercentageStat, error) {
	var stats []models.WinPercentageStat
	for _, team := range teams {
		var teamStat []models.WinPercentageStat

		err := db.Select(
			&teamStat,
			"SELECT trunc(A.wins / (B.total)::numeric,3) as percentage, A.wins as wins, B.total as total FROM (SELECT COUNT(*) as wins FROM round_participation RP JOIN rounds R ON RP.id = R.id JOIN videos V on R.video = V.video_id WHERE RP.player = $1 AND V.date >= $2 AND V.date <= $3 AND RP.team = $4 AND R.winning_team = $4) as A, (SELECT COUNT(*) as total FROM round_participation RP JOIN rounds R ON RP.id = R.id JOIN videos V on R.video = V.video_id WHERE RP.player = $1 AND V.date >= $2 AND V.date <= $3 AND RP.team = $4) as B;",
			player,
			from,
			to,
			team.TeamName,
		)
		if err != nil {
			if err.Error() == "pq: division by zero" {
				continue
			}
			return nil, errors.Annotatef(err, "failed to get win percentage for player '%s' of team '%s'", player, team.TeamName)
		}

		if len(teamStat) != 1 {
			return nil, errors.Errorf("got unexpected amount of rows: %d", len(teamStat))
		}

		teamStat[0].Team = team.TeamName
		stats = append(stats, teamStat[0])
	}

	return stats, nil
}

func roleWinPercentage(player, from, to string, roles []models.Role) ([]models.WinPercentageStat, error) {
	var stats []models.WinPercentageStat
	for _, role := range roles {
		var roleStat []models.WinPercentageStat

		err := db.Select(
			&roleStat,
			"SELECT trunc(A.wins / (B.total)::numeric,3) as percentage, A.wins as wins, B.total as total FROM (SELECT COUNT(*) as wins FROM round_participation RP JOIN rounds R ON RP.id = R.id JOIN videos V on R.video = V.video_id WHERE RP.player = $1 AND V.date >= $2 AND V.date <= $3 AND RP.role = $4 AND R.winning_team IN (SELECT team FROM roles_by_teams WHERE role = $4)) as A, (SELECT COUNT(*) as total FROM round_participation RP JOIN rounds R ON RP.id = R.id JOIN videos V on R.video = V.video_id WHERE RP.player = $1 AND V.date >= $2 AND V.date <= $3 AND RP.role = $4) as B;",
			player,
			from,
			to,
			role.RoleName,
		)
		if err != nil {
			if err.Error() == "pq: division by zero" {
				continue
			}
			return nil, errors.Annotatef(err, "failed to get win percentage for player '%s' of role '%s'", player, role.RoleName)
		}

		if len(roleStat) != 1 {
			return nil, errors.Errorf("got unexpected amount of rows: %d", len(roleStat))
		}

		roleStat[0].Role = role.RoleName
		stats = append(stats, roleStat[0])
	}

	return stats, nil
}

func traitorCombos(player, from, to string, tc *map[string]map[string]models.WinPercentageStat, mu *sync.Mutex) ([]models.WinPercentageStat, error) {
	players, err := GetAllPlayerNames()
	if err != nil {
		return nil, errors.Annotate(err, "failed to get all players")
	}

	for _, p := range players {
		if p != player {
			mu.Lock()
			if val, ok := (*tc)[p][player]; ok {
				(*tc)[player][p] = val
				mu.Unlock()
				continue
			}
			mu.Unlock()

			var val []models.WinPercentageStat
			err = db.Select(
				&val,
				"SELECT $2 as buddy, trunc(A.wins / (B.total)::numeric,3) as percentage, A.wins as wins, B.total as total FROM (SELECT COUNT(*) as wins FROM rounds R JOIN videos V ON R.video = V.video_id JOIN round_participation RP1 ON RP1.id = R.id JOIN round_participation RP2 ON RP2.id = R.id WHERE RP1.player = $1 AND RP2.player = $2 AND RP1.team = 'traitors' AND RP2.team = 'traitors' AND R.winning_team = 'traitors' AND V.date >= $3 AND V.date <= $4) as A, (SELECT COUNT(*) as total FROM rounds R JOIN videos V ON R.video = V.video_id JOIN round_participation RP1 ON RP1.id = R.id JOIN round_participation RP2 ON RP2.id = R.id WHERE RP1.player = $1 AND RP2.player = $2 AND RP1.team = 'traitors' AND RP2.team = 'traitors' AND V.date >= $3 AND V.date <= $4) as B;",
				player,
				p,
				from,
				to,
			)
			if err != nil {
				if err.Error() == "pq: division by zero" {
					continue
				}
				return nil, errors.Annotatef(err, "failed to get traitor percentage for player '%s' and '%s'", player, p)
			}

			if len(val) != 1 {
				return nil, errors.Errorf("got unexpected amount of rows: %d", len(val))
			}

			mu.Lock()

			if (*tc)[player] == nil {
				(*tc)[player] = make(map[string]models.WinPercentageStat)
			}

			(*tc)[player][p] = val[0]

			if (*tc)[p] == nil {
				(*tc)[p] = make(map[string]models.WinPercentageStat)
			}

			(*tc)[p][player] = val[0]

			mu.Unlock()
		}
	}

	stats := []models.WinPercentageStat{}

	mu.Lock()
	for _, val := range (*tc)[player] {
		stats = append(stats, val)
	}
	mu.Unlock()

	return stats, nil
}

func jesterKills(player, from, to string) (int, error) {
	var wins []int
	err := db.Select(&wins, "SELECT K.kills from (SELECT COUNT(*) as kills FROM ROUNDS JOIN videos V ON video = V.video_id WHERE jester_killer = $1 AND V.date >= $2 AND V.date <= $3) as K;", player, from, to)
	if err != nil {
		return 0, errors.Annotatef(err, "failed to get jester kills for player '%s'", player)
	}

	if len(wins) != 1 {
		return 0, errors.Errorf("got unexpected amount of rows: %d", len(wins))
	}

	return wins[0], nil
}

func InsertPlayer(name string) error {
	_, err := db.Exec("INSERT INTO players VALUES ($1);", name)
	if err != nil {
		return errors.Annotate(err, "failed to perform query")
	}

	return nil
}

func CountRounds() (int, error) {
	var count []int

	err := db.Select(&count, "SELECT COUNT(*) FROM rounds;")
	if err != nil {
		return -1, errors.Annotate(err, "failed to count rounds")
	}

	if len(count) != 1 {
		return 0, errors.Errorf("got unexpected amount of rows: %d", len(count))
	}

	return count[0], nil
}
