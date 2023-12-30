package handlers

import (
	"encoding/json"
	"net/http"
	"yogsstats/database"

	"github.com/gorilla/mux"
	log "github.com/rs/zerolog/log"
)

func Rounds(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	players := req.URL.Query().Get("players")

	rounds, err := database.GetRounds(players == "true", from, to, "")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get rounds")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	err = json.NewEncoder(rw).Encode(rounds)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("rounds (GET) request served")
}

func GetRound(rw http.ResponseWriter, req *http.Request) {
	players := req.URL.Query().Get("players")
	vars := mux.Vars(req)

	round, err := database.GetRound2(players == "true", "2000-12-24", "2099-12-24", " AND id = $3", vars["round"])
	if err != nil {
		log.Error().Stack().Err(err).Msgf("failed to get round '%s'", vars["round"])
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	err = json.NewEncoder(rw).Encode(round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Msgf("round (GET) request served, round: %s", vars["round"])
}

func PostRound(rw http.ResponseWriter, req *http.Request) {
}
