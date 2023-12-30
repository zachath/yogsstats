package handlers

import (
	"encoding/json"
	"net/http"

	log "github.com/rs/zerolog/log"

	db "yogsstats/database"
	"yogsstats/models"
)

type MetaResponse struct {
	Count         int           `json:"roundCount"`
	OldestRound   models.Round2 `json:"oldestRound"`
	NewestRound   models.Round2 `json:"newestRound"`
	ShortestRound models.Round2 `json:"shortestRound"`
	LongestRound  models.Round2 `json:"longestRound"`
}

func APIMetaData(rw http.ResponseWriter, req *http.Request) {
	from := "2000-12-24"
	to := "2099-12-24"

	count, err := db.CountRows("round", "")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to count round rows")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	oldestRound, err := db.GetRound2(false, from, to, " ORDER BY V.date DESC")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get oldest round")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	newestRound, err := db.GetRound2(false, from, to, " ORDER BY V.date ASC")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get newest round")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	shortestRound, err := db.GetRound2(false, from, to, " ORDER BY length ASC")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get shortest round")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	longestRound, err := db.GetRound2(false, from, to, " ORDER BY length DESC")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get longest round")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
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
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("meta request served")
}
