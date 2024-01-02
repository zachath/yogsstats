package handlers

import (
	"encoding/json"
	"io"
	"net/http"
	"yogsstats/database"
	"yogsstats/models"

	"github.com/gorilla/mux"
	"github.com/pingcap/errors"
	log "github.com/rs/zerolog/log"
)

func Teams(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	teams, err := database.GetTeams(true)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get teams")
		wrtiteInternalError(&rw)
		return
	}

	for i := range teams {
		err = setTeamInfo(&teams[i], from, to)
		if err != nil {
			log.Error().Stack().Err(err).Msg("failed to set team info")
			wrtiteInternalError(&rw)
			return
		}
	}

	err = json.NewEncoder(rw).Encode(teams)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("teams (GET) request served")
}

func GetTeam(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	team := mux.Vars(req)["team"]

	teams, err := database.GetTeams(true)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get teams")
		wrtiteInternalError(&rw)
		return
	}

	for _, t := range teams {
		if t.TeamName == team {
			err = setTeamInfo(&t, from, to)
			if err != nil {
				log.Error().Stack().Err(err).Msg("failed to set team info")
				wrtiteInternalError(&rw)
				return
			}

			err = json.NewEncoder(rw).Encode(t)
			if err != nil {
				log.Error().Stack().Err(err).Msg("failed to encode response")
				wrtiteInternalError(&rw)
				return
			}
			log.Info().Int("code", http.StatusOK).Msg("team (GET) request served")
			return
		}
	}

	log.Error().Stack().Err(err).Str("team", team).Msg("failed to find team")
	http.Error(rw, "bad request", http.StatusBadRequest)
}

func setTeamInfo(team *models.Team, from, to string) error {
	roles, err := database.GetRolesOfTeam(team.TeamName)
	if err != nil {
		return errors.Annotatef(err, "failed to get roles of team: '%s'", team.TeamName)
	}
	team.PossibleRoles = roles

	wins, err := database.GetTeamWins(team.TeamName, from, to)
	if err != nil {
		return errors.Annotatef(err, "failed to get wins of team: '%s'", team.TeamName)
	}
	team.Wins = wins

	return nil
}

func InsertTeam(rw http.ResponseWriter, req *http.Request) {
	team := models.Team{
		TeamName: mux.Vars(req)["team"],
	}

	b, err := io.ReadAll(req.Body)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to read body")
		wrtiteInternalError(&rw)
		return
	}

	err = json.Unmarshal(b, &team)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to unmarshal request")
		wrtiteInternalError(&rw)
		return
	}

	if team.TeamName == "" || len(team.PossibleRoles) == 0 {
		log.Error().Stack().Err(err).Msg("request did not contian all required fields")
		http.Error(rw, "bad request", http.StatusBadRequest)
		return
	}

	err = database.InsertTeam(team)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to insert team")
		wrtiteInternalError(&rw)
		return
	}

	log.Info().Int("code", http.StatusOK).Str("team", mux.Vars(req)["team"]).Msg("team (POST) request served")
}
