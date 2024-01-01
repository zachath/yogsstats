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
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	players, err := database.GetAllPlayers(from, to, playerNames, req.URL.Query().Get("canon") == "true")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get player stats")
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
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	playerNames, err := database.GetAllPlayerNames()
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get players")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
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
		http.Error(rw, "bad request", http.StatusBadRequest)
		return
	}

	players, err := database.GetAllPlayers(from, to, []string{name}, req.URL.Query().Get("canon") == "true")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get player stats")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	if len(players) != 1 {
		log.Error().Stack().Err(err).Int("len", len(players)).Msg("got unexpected amount of players")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}
	player := players[0]

	err = json.NewEncoder(rw).Encode(player)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("player (GET) request served")
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
