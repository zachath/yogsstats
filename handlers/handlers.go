package handlers

import (
	//Go packages
	"context"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"

	//External dependencies
	log "github.com/rs/zerolog/log"

	//Local packages
	config "yogsstats/config"
	db "yogsstats/database"
	. "yogsstats/models"
)

func ValidateTTTInput(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		ctx := req.Context()

		var round TTTRound
		defer req.Body.Close()

		reqBody, err := ioutil.ReadAll(req.Body)
		if err != nil {
			log.Error().Err(err).Stack().Msg("Parsing body to TTT round failed")
			http.Error(rw, "Could not parse input data", http.StatusBadRequest)
			return
		}

		err = json.Unmarshal(reqBody, &round)
		if err != nil {
			log.Error().Err(err).Stack().Msg("Unmarshaling failed")
			http.Error(rw, "Could not marshal input data", http.StatusBadRequest)
			return
		}

		matched := len(config.DateRegex.FindAllString(round.Date, -1)) == 1
		if !matched {
			log.Error().Err(err).Stack().Msgf("Date did not match regex")
			http.Error(rw, "Wrong date format", http.StatusBadRequest)
			return
		}

		ctx = context.WithValue(ctx, "round", round)
		req = req.WithContext(ctx)

		next(rw, req)
	})
}

func HomeHandler(rw http.ResponseWriter, req *http.Request) {
	http.Error(rw, "Not implemented", http.StatusNotImplemented)
}

func ServeTTTStatsGet(rw http.ResponseWriter, req *http.Request) {
	id := req.URL.Query().Get("id") //TODO: Support batch requests
	if len(id) != 9 {
		http.Error(rw, "Id must be of length 9, in the future batch requests with lenght 8 will be supported", http.StatusBadRequest)
		return
	}

	round, err := db.GetRound(id)
	if err != nil {
		log.Error().Msgf("Failed to get TTT round with id '%s'", id)
		http.Error(rw, "Failed to get TTT round", http.StatusInternalServerError)
		return
	}

	if round == nil {
		http.Error(rw, fmt.Sprintf("No round with id '%s' found", id), http.StatusNotFound)
		return
	}

	rw.Header().Set("Content-Type", "application/json")
	rw.WriteHeader(http.StatusOK)

	json.NewEncoder(rw).Encode(round)
}

func ServeTTTStatsPost(rw http.ResponseWriter, req *http.Request) {
	round := req.Context().Value("round").(TTTRound)

	err := db.InsertRound(&round)
	if err != nil {
		log.Error().Msg("Round insertion failed.")
		http.Error(rw, fmt.Sprintf("Failed to add POSTed round to database: %s", err.Error()), http.StatusInternalServerError)
		return
	}

	io.WriteString(rw, "POSTed round successfully")
}

func ServeWinPercentage(rw http.ResponseWriter, req *http.Request) {
	if req.URL.Query().Has("team") && req.URL.Query().Has("player") {
		http.Error(rw, "May only specify either team or player as arguments", http.StatusBadRequest)
		return
	}

	team := req.URL.Query().Get("team")
	player := req.URL.Query().Get("player")

	if team != "" {
		win, err := db.TeamWinPercentage(team)
		if err != nil {
			log.Error().Err(err).Str("team", team).Msg("Failed getting win %")
			http.Error(rw, fmt.Sprintf("Failed to get win %s of team with error: %s", team, err.Error()), http.StatusInternalServerError)
			return
		}

		io.WriteString(rw, fmt.Sprintf("Win percentage of team %s: %f", team, win))
	} else if player != "" {
		io.WriteString(rw, "Not yet supported")
		return
	} else {
		io.WriteString(rw, "Either 'team' or 'player' has to be specified as argument in the url.")
		return
	}
}