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

func Roles(rw http.ResponseWriter, req *http.Request) {
	roles, err := database.GetRoles2()
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get roles")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	for i := range roles {
		teams, err := database.GetTeamsOfRole(roles[i].RoleName)
		if err != nil {
			log.Error().Stack().Err(err).Msg("failed to get teams")
			http.Error(rw, "internal server error", http.StatusInternalServerError)
			return
		}
		roles[i].PossibleTeams = teams
	}

	err = json.NewEncoder(rw).Encode(roles)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("roles (GET) request served")
}

func GetRole(rw http.ResponseWriter, req *http.Request) {
	role := mux.Vars(req)["role"]

	roles, err := database.GetRoles2()
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get roles")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	for i := range roles {
		if role == roles[i].RoleName {
			teams, err := database.GetTeamsOfRole(roles[i].RoleName)
			if err != nil {
				log.Error().Stack().Err(err).Msg("failed to get teams")
				http.Error(rw, "internal server error", http.StatusInternalServerError)
				return
			}
			roles[i].PossibleTeams = teams

			err = json.NewEncoder(rw).Encode(roles[i])
			if err != nil {
				log.Error().Stack().Err(err).Msg("failed to encode response")
				http.Error(rw, "internal server error", http.StatusInternalServerError)
				return
			}
			log.Info().Int("code", http.StatusOK).Str("role", role).Msg("role (GET) request served")
			return
		}
	}

	log.Error().Stack().Err(err).Str("role", role).Msg("failed to find role")
	http.Error(rw, "bad request", http.StatusBadRequest)
}

func InsertRole(rw http.ResponseWriter, req *http.Request) {
	role := models.Role2{
		RoleName: mux.Vars(req)["role"],
	}

	b, err := io.ReadAll(req.Body)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to read body")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	err = json.Unmarshal(b, &role)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to unmarshal request")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	if role.RoleName == "" || len(role.PossibleTeams) == 0 {
		log.Error().Stack().Err(err).Msg("request did not contian all required fields")
		http.Error(rw, "bad request", http.StatusBadRequest)
		return
	}

	err = database.InsertRole(role)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to insert role")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Str("role", mux.Vars(req)["role"]).Msg("role (POST) request served")
}
