package handlers

import (
	"encoding/json"
	"net/http"
	"strings"

	log "github.com/rs/zerolog/log"

	db "yogsstats/database"
	"yogsstats/models"
)

type MetaResponse struct {
	Count         int          `json:"roundCount"`
	OldestRound   models.Round `json:"oldestRound"`
	NewestRound   models.Round `json:"newestRound"`
	ShortestRound models.Round `json:"shortestRound"`
	LongestRound  models.Round `json:"longestRound"`
}

func APIMetaData(rw http.ResponseWriter, req *http.Request) {
	from := "2000-12-24"
	to := "2099-12-24"

	count, err := db.CountRounds()
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to count round rows")
		wrtiteInternalError(&rw)
		return
	}

	oldestRound, err := db.GetRound(false, from, to, " ORDER BY V.date DESC")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get oldest round")
		wrtiteInternalError(&rw)
		return
	}

	newestRound, err := db.GetRound(false, from, to, " ORDER BY V.date ASC")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get newest round")
		wrtiteInternalError(&rw)
		return
	}

	shortestRound, err := db.GetRound(false, from, to, " ORDER BY length ASC")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get shortest round")
		wrtiteInternalError(&rw)
		return
	}

	longestRound, err := db.GetRound(false, from, to, " ORDER BY length DESC")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get longest round")
		wrtiteInternalError(&rw)
		return
	}

	newestRound.Video.Date = reformatDate(newestRound.Video.Date)
	oldestRound.Video.Date = reformatDate(oldestRound.Video.Date)
	shortestRound.Video.Date = reformatDate(shortestRound.Video.Date)
	longestRound.Video.Date = reformatDate(longestRound.Video.Date)

	response := MetaResponse{
		Count:         count,
		OldestRound:   oldestRound,
		NewestRound:   newestRound,
		ShortestRound: shortestRound,
		LongestRound:  longestRound,
	}

	err = json.NewEncoder(rw).Encode(response)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("meta request served")
}

func reformatDate(s string) string {
	if idx := strings.Index(s, "T"); idx != -1 {
		s = s[:idx]
	}

	return s
}
