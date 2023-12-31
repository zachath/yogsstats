package handlers

import (
	"encoding/json"
	"net/http"
	"yogsstats/database"

	"github.com/gorilla/mux"
	log "github.com/rs/zerolog/log"
)

func Players(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	players, err := database.GetAllPlayers(from, to)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get players")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	err = json.NewEncoder(rw).Encode(players)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("players (GET) request served")
}

func GetPlayer(rw http.ResponseWriter, req *http.Request) {

}

func PostPlayer(rw http.ResponseWriter, req *http.Request) {
	err := database.InsertPlayer(mux.Vars(req)["player"])
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to insert player")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Str("player", mux.Vars(req)["player"]).Msg("player (POST) request served")
}
