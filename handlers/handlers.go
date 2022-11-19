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

func GetTTTRound(rw http.ResponseWriter, req *http.Request) {
	var id string
	var rounds []TTTRound
	var err	error

	if req.URL.Query().Has("id") {
		id = req.URL.Query().Get("id")
		rounds, err = db.GetRound(id, "", "")
	} else if req.URL.Query().Has("from") && req.URL.Query().Has("to") {
		from := req.URL.Query().Get("from")
		to := req.URL.Query().Get("to")
		rounds, err = db.GetRound("", from, to)
	} else {
		http.Error(rw, "Invalid argument combination provided (id OR (from AND to)).", http.StatusBadRequest)
		return
	}

	if err != nil {
		log.Error().Msgf("Failed to get TTT round")
		http.Error(rw, "Failed to get TTT round", http.StatusInternalServerError)
		return
	}

	if rounds == nil {
		http.Error(rw, fmt.Sprint("No rounds found."), http.StatusNotFound)
		return
	}

	rw.Header().Set("Content-Type", "application/json")
	rw.WriteHeader(http.StatusOK)

	json.NewEncoder(rw).Encode(rounds)
}

func PostTTTRound(rw http.ResponseWriter, req *http.Request) {
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