package handlers

import (
	"fmt"
	"math"
	"strconv"

	//Local packages
	db "yogsstats/database"
	. "yogsstats/models"

	"github.com/pkg/errors"
	log "github.com/rs/zerolog/log"
)

//TODO: Where all the calculations should actually happen, you fat fuck

func CalculatePlayerWinPercentage(player, from, to string, round bool) (PlayerWinPercentageResponse, error) {
	players, err := db.GetEntries("player", "name", player)
	if err != nil {
		return PlayerWinPercentageResponse{Feedback: "Error getting entries"}, errors.Wrap(err, "Error getting entries")
	}

	response := PlayerWinPercentageResponse{
		Players: make(map[string]TeamsWinPercentage),
	}

	for _, player := range players {
		roundsPlayed := 0
		teams, err := db.GetEntries("team", "team", "*")
		if err != nil {
			return PlayerWinPercentageResponse{Feedback: "Error getting entries"}, errors.Wrap(err, "Error getting entries")
		}

		response.Players[player] = TeamsWinPercentage{Teams: make(map[string]PercentageEntry)}
		for _, team := range teams {
			tt, err := db.GetRoundParticipationTeamsByPlayer(player, from, to, team)
			if err != nil {
				return PlayerWinPercentageResponse{Feedback: "Error getting team participation info"}, errors.Wrap(err, "Error getting team participation info")
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
	teams, err := db.GetEntries("team", "team", team)
	if err != nil {
		return TeamWinPercentageResponse{Feedback: "Error getting entries."}, errors.Wrap(err, "Error getting entries")
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
			return TeamWinPercentageResponse{Feedback: "Internal server error"}, errors.Wrap(err, "Failed counting team wins")
		}

		response.Response[team] = winsOfTeam
	}

	log.Info().Msg("Team win percentage request")
	response.Feedback = "Successfull request"
	return response, nil
}

func CalculateDetectiveWinPercentage(player, from, to string, canon, round bool) (DetecitveWinPercentageResponse, error) {
	players, err := db.GetEntries("player", "name", player)
	if err != nil {
		return DetecitveWinPercentageResponse{Feedback: "Error getting entries"}, errors.Wrap(err, "Error getting entries")
	}

	response := DetecitveWinPercentageResponse{
		Players: make(map[string]DetectiveWinPercentageEntry),
	}

	for _, player := range players {
		dWins, err := db.InnocentWinsByPlayer(player, from, to, round)
		if err != nil {
			return DetecitveWinPercentageResponse{Feedback: fmt.Sprintf("Error getting detective win percentage (%s)", player)}, errors.Wrap(err, "Error getting detective win percentage")
		}

		roundsPlayed, err := db.DetectiveRoundsByPlayer(player, from, to)
		if err != nil {
			return DetecitveWinPercentageResponse{Feedback: fmt.Sprintf("Error getting detective win percentage (%s)", player)}, errors.Wrap(err, "Error getting detective win percentage")
		}

		if roundsPlayed == 0 {
			return DetecitveWinPercentageResponse{Feedback: "Successfull request"}, nil
		}

		dWin := float64(dWins) / float64(roundsPlayed)

		if round {
			dWin, err = roundup(dWin)
			if err != nil {
				return DetecitveWinPercentageResponse{Feedback: "Failed roduning results"}, errors.Wrap(err, "failed rouding results")
			}
		}

		if canon && player == "Zylus" {
			log.Info().Msg("Canon flag set to true, setting detective win percentage of Zylus to 1.")
			dWin = 1
		}

		response.Players[player] = DetectiveWinPercentageEntry{WinRate: dWin, RoundsPlayed: roundsPlayed}
	}

	response.Feedback = "Successfull request"
	return response, nil
}

func roundup(f float64) (float64, error) {
	return strconv.ParseFloat(fmt.Sprintf("%.3f", (math.Round(f/0.001)*0.001)), 64)
}
