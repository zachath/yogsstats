package handlers

import (
	//Go packages
	"context"
	"encoding/json"
	"io"
	"io/ioutil"
	"net/http"
	
	//External dependencies
	log "github.com/rs/zerolog/log"

	//Local packages
	. "yogsstats/models"
	config "yogsstats/config"
	db "yogsstats/database"
)

func ValidateTTTInput(next http.HandlerFunc, game string) http.HandlerFunc {
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

func TTTStatsHandler(rw http.ResponseWriter, req *http.Request) {
	log.Debug().Msg("[TTTStatsHandler]")
	switch req.Method {
	case http.MethodGet:
		serveTTTStatsGet(rw, req)
	case http.MethodPost:
		serveTTTStatsPost(rw, req)
	}
}

func serveTTTStatsGet(rw http.ResponseWriter, req *http.Request) {
	log.Debug().Msg("[serveTTTStatsGet]")
	io.WriteString(rw, "serveStatsGet\n")
	http.Error(rw, "Not implemented", http.StatusNotImplemented)
}

func serveTTTStatsPost(rw http.ResponseWriter, req *http.Request) {
	log.Debug().Msg("[serveTTTStatsPost]")
	
	round := req.Context().Value("round").(TTTRound)

	err := db.InsertRoundTTT(round)
	if err != nil {
		log.Error().Err(err).Msg("Round insertion failed")
		http.Error(rw, "Failed to add POSTed round to database", http.StatusInternalServerError)
		return
	}

	io.WriteString(rw, "POSTed round successfully")
}