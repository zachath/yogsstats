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

	playerNames, err := database.GetAllPlayerNames()
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get players")
		wrtiteInternalError(&rw)
		return
	}

	players, err := database.GetAllPlayers(from, to, playerNames, req.URL.Query().Get("canon") == "true")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get player stats")
		wrtiteInternalError(&rw)
		return
	}

	err = json.NewEncoder(rw).Encode(players)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("players (GET) request served")
}

func GetPlayer(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	playerNames, err := database.GetAllPlayerNames()
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get players")
		wrtiteInternalError(&rw)
		return
	}

	name := mux.Vars(req)["player"]

	var found bool
	for _, p := range playerNames {
		if p == name {
			found = true
			break
		}
	}

	if !found {
		log.Error().Stack().Err(err).Str("player", name).Msg("player not found")
		wrtiteInternalError(&rw)
		return
	}

	players, err := database.GetAllPlayers(from, to, []string{name}, req.URL.Query().Get("canon") == "true")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get player stats")
		wrtiteInternalError(&rw)
		return
	}

	if len(players) != 1 {
		log.Error().Stack().Err(err).Int("len", len(players)).Msg("got unexpected amount of players")
		wrtiteInternalError(&rw)
		return
	}
	player := players[0]

	err = json.NewEncoder(rw).Encode(player)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("player (GET) request served")
}

func PostPlayer(rw http.ResponseWriter, req *http.Request) {
	err := database.InsertPlayer(mux.Vars(req)["player"])
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to insert player")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Str("player", mux.Vars(req)["player"]).Msg("player (POST) request served")
}
