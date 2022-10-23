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
	log.Debug().Msg("[ValidateTTTInput]")
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
	log.Debug().Msg("[HomeHandler]")
	http.Error(rw, "Not implemented", http.StatusNotImplemented)
}

func ServeTTTStatsGet(rw http.ResponseWriter, req *http.Request) {
	log.Debug().Msg("[serveTTTStatsGet]")
	
	id := req.URL.Query().Get("id") //TODO: Support batch requests
	if len(id) != 9 {
		http.Error(rw, "Id must be of length 9, in the future batch requests with lenght 8 will be supported", http.StatusBadRequest)
		return
	}

	round, err := db.GetTTTRound(id)
	if err != nil {
		log.Error().Err(err).Msgf("Failed to get TTT round with id '%s'", id)
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
	log.Debug().Msg("[serveTTTStatsPost]")
	
	round := req.Context().Value("round").(TTTRound)

	err := db.InsertRoundTTT(&round)
	if err != nil {
		log.Error().Err(err).Msg("Round insertion failed")
		http.Error(rw, fmt.Sprintf("Failed to add POSTed round to database: %s", err.Error()), http.StatusInternalServerError)
		return
	}

	io.WriteString(rw, "POSTed round successfully")
}