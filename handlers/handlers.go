package handlers

import (
	//Go packages
	"context"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"time"

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

func TeamWinShare(rw http.ResponseWriter, req *http.Request) {
	team := req.URL.Query().Get("team")
	from := req.URL.Query().Get("from")
	to := req.URL.Query().Get("to")

	if from == "" {
		from = "2000-12-24"
	}

	if to == "" {
		to = time.Now().Format("2006-01-02")
	}

	var response db.TeamWinShareResponse
	var err error
	if team == "" {
		response, err = db.TeamWinShare("*", from, to)
		if err != nil {
			log.Error().Err(err).Msg("Failed getting team win share.")
		}
	} else {
		response, err = db.TeamWinShare(team, from, to)
		if err != nil {
			log.Error().Err(err).Msg("Failed getting team win share.")
		}
	}
	
	json.NewEncoder(rw).Encode(response)
}