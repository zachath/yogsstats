package handlers

import (
	"fmt"
	"math"
	"strconv"

	//Local packages
	db "yogsstats/database"
	. "yogsstats/models"

	"github.com/pingcap/errors"
	log "github.com/rs/zerolog/log"
)

func CalculatePlayerWinPercentage(player, from, to string, round bool) (PlayerWinPercentageResponse, error) {
	players, err := db.GetEntries("*", "player", "name", player)
	if err != nil {
		return PlayerWinPercentageResponse{Feedback: "Error getting entries"}, errors.Annotate(err, "Error getting entries")
	}

	response := PlayerWinPercentageResponse{
		Players: make(map[string]TeamsWinPercentage),
	}

	for _, player := range players {
		roundsPlayed := 0
		teams, err := db.GetEntries("*", "team", "team", "*")
		if err != nil {
			return PlayerWinPercentageResponse{Feedback: "Error getting entries"}, errors.Annotate(err, "Error getting entries")
		}

		response.Players[player] = TeamsWinPercentage{Teams: make(map[string]PercentageEntry)}
		for _, team := range teams {
			tt, err := db.GetRoundParticipationTeamsByPlayer(player, from, to, team)
			if err != nil {
				return PlayerWinPercentageResponse{Feedback: "Error getting team participation info"}, errors.Annotate(err, "Error getting team participation info")
			}

			roundsPlayed += len(tt)

			if len(tt) == 0 {
				continue
			}

			wins := 0
			for _, row := range tt {
				if row.Team == row.Win {
					wins++
				}
			}

			result := float64(wins) / float64(len(tt))
			if round {
				f, err := roundup(result)
				if err != nil {
					log.Error().Err(err).Msg("Failed to round result.")
					response.Players[player].Teams[team] = PercentageEntry{Percentage: result, Wins: wins, RoundPlayedAs: len(tt)}
				}
				response.Players[player].Teams[team] = PercentageEntry{Percentage: f, Wins: wins, RoundPlayedAs: len(tt)}
			} else {
				response.Players[player].Teams[team] = PercentageEntry{Percentage: result, Wins: wins, RoundPlayedAs: len(tt)}
			}
		}

		entry := response.Players[player]
		entry.RoundsPlayed = roundsPlayed
		response.Players[player] = entry
	}

	response.Feedback = "Successfull request"
	return response, nil
}

func CalculateTeamWins(team, from, to string) (TeamWinPercentageResponse, error) {
	teams, err := db.GetEntries("*", "team", "team", team)
	if err != nil {
		return TeamWinPercentageResponse{Feedback: "Error getting entries."}, errors.Annotate(err, "Error getting entries")
	}

	totalRounds, err := db.CountRows("round", fmt.Sprintf("date >= '%s' AND date <= '%s'", from, to))
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
		winsOfTeam, err := db.CountRows("round", fmt.Sprintf("winning_team = '%s' AND date >= '%s' AND date <= '%s'", team, from, to))
		if err != nil {
			return TeamWinPercentageResponse{Feedback: "Internal server error"}, errors.Annotate(err, "Failed counting team wins")
		}

		response.Response[team] = winsOfTeam
	}

	log.Info().Msg("Team win percentage request")
	response.Feedback = "Successfull request"
	return response, nil
}

func CalculateDetectiveWinPercentage(player, from, to string, canon, round bool) (DetecitveWinPercentageResponse, error) {
	players, err := db.GetEntries("*", "player", "name", player)
	if err != nil {
		return DetecitveWinPercentageResponse{Feedback: "Error getting entries"}, errors.Annotate(err, "Error getting entries")
	}

	response := DetecitveWinPercentageResponse{
		Players: []DetectiveWinPercentageEntry{},
	}

	for _, player := range players {
		dWins, err := db.InnocentWinsByPlayer(player, from, to, round)
		if err != nil {
			return DetecitveWinPercentageResponse{Feedback: fmt.Sprintf("Error getting detective win percentage (%s)", player)}, errors.Annotate(err, "Error getting detective win percentage")
		}

		roundsPlayed, err := db.DetectiveRoundsByPlayer(player, from, to)
		if err != nil {
			return DetecitveWinPercentageResponse{Feedback: fmt.Sprintf("Error getting detective win percentage (%s)", player)}, errors.Annotate(err, "Error getting detective win percentage")
		}

		if roundsPlayed == 0 {
			continue
		}

		dWin := float64(dWins) / float64(roundsPlayed)

		if round {
			dWin, err = roundup(dWin)
			if err != nil {
				return DetecitveWinPercentageResponse{Feedback: "Failed roduning results"}, errors.Annotate(err, "failed rouding results")
			}
		}

		if canon && player == "Zylus" {
			log.Info().Msg("Canon flag set to true, setting detective win percentage of Zylus to 1.")
			dWin = 1
		}

		response.Players = append(response.Players, DetectiveWinPercentageEntry{Player: player, WinRate: dWin, RoundsPlayed: roundsPlayed})
	}

	response.Feedback = "Successfull request"
	return response, nil
}

func CalculateRoleWins(player, from, to string, round bool) (RoleWinsResponse, error) {
	players, err := db.GetEntries("*", "player", "name", player)
	if err != nil {
		return RoleWinsResponse{Feedback: "Error getting entries"}, errors.Annotate(err, "Error getting entries")
	}

	response := RoleWinsResponse{
		Players: make(map[string]RoleWinPercentage),
	}

	roles, err := db.GetEntries("role", "role", "win", "true")
	if err != nil {
		return RoleWinsResponse{Feedback: "Error getting entries"}, errors.Annotate(err, "Error getting entries")
	}

	for _, p := range players {
		response.Players[p] = RoleWinPercentage{Roles: make(map[string]PercentageEntry)}
		for _, role := range roles {
			wins, roundsPlayed, err := db.WinsByRole(p, role, from, to)
			if err != nil {
				return RoleWinsResponse{Feedback: "Error calculating winrate by role"}, errors.Annotatef(err, "Failed calculation for role %s", role)
			}

			if roundsPlayed == 0 {
				continue
			}

			rate := float64(wins) / float64(roundsPlayed)

			if round {
				rate, err = roundup(rate)
				if err != nil {
					return RoleWinsResponse{Feedback: "Failed roduning results"}, errors.Annotate(err, "failed rouding results")
				}
			}

			response.Players[p].Roles[role] = PercentageEntry{Percentage: rate, RoundPlayedAs: roundsPlayed, Wins: wins}
		}
	}

	response.Feedback = "Successfull request"
	return response, nil
}

func CalculateTraitorCombos(player, from, to string, round bool) (TraitorCombosResponse, error) {
	selectedPlayers, err := db.GetEntries("*", "player", "name", player)
	if err != nil {
		return TraitorCombosResponse{Feedback: "Error getting entries"}, errors.Annotatef(err, "Error getting entries, player = %s", player)
	}

	allPlayers, err := db.GetEntries("*", "player", "name", "*")
	if err != nil {
		return TraitorCombosResponse{Feedback: "Error getting entries"}, errors.Annotatef(err, "Error getting entries, player = %s", player)
	}

	response := TraitorCombosResponse{Combos: []Pairings{}}

	for currentPlayerIdx, player := range selectedPlayers {
		playerRounds, err := db.GetTraitorRounds(player, from, to)
		if err != nil {
			return TraitorCombosResponse{Feedback: "Error getting combo win %"}, errors.Annotatef(err, "Error getting combo win percentage, player = %s, player")
		}

		response.Combos = append(response.Combos, Pairings{Player: player, Entries: []TraitorComboEntry{}})

		for _, other := range allPlayers {
			if other != player {
				comboWinRate, commonRounds, err := getTraitorWinRate(playerRounds, other, from, to, round)
				if err != nil {
					log.Error().Err(err).Msg("")
					return TraitorCombosResponse{Feedback: "Error getting combo win %"}, errors.Annotatef(err, "Error getting combo win percentage, player = %s & other = %s", player, other)
				}

				if commonRounds == 0 {
					continue
				}

				response.Combos[currentPlayerIdx].Entries = append(response.Combos[currentPlayerIdx].Entries, TraitorComboEntry{Player: other, WinRate: comboWinRate, RoundsTogether: commonRounds})
			}
		}
	}

	log.Info().Msg("Traitor combo request")
	response.Feedback = "Successfull request"
	return response, nil
}

func getTraitorWinRate(player1Rounds []TraitorRound, player2, from, to string, round bool) (float64, int, error) {
	player2Rounds, err := db.GetTraitorRounds(player2, from, to)
	if err != nil {
		return -1, 0, err
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
		return 0, len, err
	}

	rate := wins / float64(len)

	if round {
		f, err := roundup(rate)
		return f, len, errors.Wrap(err, "failed rounding")
	}

	return rate, len, nil
}

func calculateJesterKills(from, to string) (JesterKillsResponse, error) {
	numJesterWins, err := db.CountRows("round", fmt.Sprintf("winning_team = 'jester' AND date >= '%s' AND date <= '%s';", from, to))
	if err != nil {
		return JesterKillsResponse{Feedback: "failed counting jester wins"}, errors.Annotate(err, "failed counting jester wins")
	}

	allPlayers, err := db.GetEntries("*", "player", "name", "*")
	if err != nil {
		return JesterKillsResponse{Feedback: "Error getting entries"}, errors.Annotate(err, "Error getting entries, players")
	}

	var response = JesterKillsResponse{TotalJesterWins: numJesterWins, Players: make(map[string]JesterKillsEntry)}
	for _, player := range allPlayers {
		kills, rate, err := db.GetJesterKills(numJesterWins, player, from, to)
		if err != nil {
			return JesterKillsResponse{Feedback: "failed getting jester kills"}, errors.Annotatef(err, "Error getting jester kills, player: %s", player)
		}

		if kills != 0 {
			response.Players[player] = JesterKillsEntry{Kills: kills, Rate: rate}
		}
	}

	log.Info().Msg("jester kills request")
	response.Feedback = "Successfull request"
	return response, nil
}

func roundup(f float64) (float64, error) {
	return strconv.ParseFloat(fmt.Sprintf("%.3f", (math.Round(f/0.001)*0.001)), 64)
}
