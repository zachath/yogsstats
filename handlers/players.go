package handlers

import (
	"net/http"
	"yogsstats/database"

	"github.com/gorilla/mux"
	log "github.com/rs/zerolog/log"
)

func Players(rw http.ResponseWriter, req *http.Request) {
	//players, err := database.GetAllPlayers()
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
