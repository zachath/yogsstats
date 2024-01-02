package handlers

import (
	"encoding/json"
	"io"
	"net/http"
	"yogsstats/database"
	"yogsstats/models"

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
		wrtiteInternalError(&rw)
		return
	}

	err = json.NewEncoder(rw).Encode(rounds)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("rounds (GET) request served")
}

func GetRound(rw http.ResponseWriter, req *http.Request) {
	players := req.URL.Query().Get("players")
	vars := mux.Vars(req)

	round, err := database.GetRound(players == "true", "2000-12-24", "2099-12-24", " AND id = $3", vars["round"])
	if err != nil {
		log.Error().Stack().Err(err).Msgf("failed to get round '%s'", vars["round"])
		wrtiteInternalError(&rw)
		return
	}

	err = json.NewEncoder(rw).Encode(round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Msgf("round (GET) request served, round: %s", vars["round"])
}

func InsertRound(rw http.ResponseWriter, req *http.Request) {
	round := models.Round{
		Id: mux.Vars(req)["round"],
	}

	b, err := io.ReadAll(req.Body)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to read body")
		wrtiteInternalError(&rw)
		return
	}

	err = json.Unmarshal(b, &round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to unmarshal request")
		wrtiteInternalError(&rw)
		return
	}

	if round.Id == "" || round.Video.Id == "" || round.WinningTeam == "" || round.Start > round.End || len(round.Players) == 0 {
		log.Error().Stack().Err(err).Msg("request did not contian all required fields")
		http.Error(rw, "bad request", http.StatusBadRequest)
		return
	}

	err = database.InsertRound(round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to insert round")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Str("round", mux.Vars(req)["round"]).Msg("round (POST) request served")
}
