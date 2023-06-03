package handlers

import (
	//Go packages
	"context"
	"encoding/json"
	"io/ioutil"
	"net/http"
	"os"
	"time"

	//External dependencies
	log "github.com/rs/zerolog/log"
	"golang.org/x/crypto/bcrypt"

	//Local packages
	. "yogsstats/models"
)

func GetOrPost(get, post http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		if req.Method == http.MethodGet {
			get(rw, req)
		} else if req.Method == http.MethodPost {
			post(rw, req)
		} else {
			http.Error(rw, "Unsupported method", http.StatusBadRequest)
			return
		}
	})
}

func BasicAuth(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		_, providedPassword, ok := req.BasicAuth()

		if ok {
			hashedPass := os.Getenv("POST_PASS")
			err := bcrypt.CompareHashAndPassword([]byte(hashedPass), []byte(providedPassword))
			if err == nil {
				next(rw, req)
				return
			}
		}

		log.Error().Msgf("unauthorized login attempt, password: %s", providedPassword)
		rw.Header().Set("WWW-Authenticate", `Basic realm="restricted"`)
		http.Error(rw, "Unauthorized", http.StatusUnauthorized)
	})
}

func ValidateVideoPost(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		ctx := req.Context()

		var video Video
		defer req.Body.Close()

		reqBody, err := ioutil.ReadAll(req.Body)
		if err != nil {
			log.Error().Err(err).Stack().Msg("Parsing body to video failed")
			http.Error(rw, "Could not parse input data", http.StatusBadRequest)
			return
		}

		err = json.Unmarshal(reqBody, &video)
		if err != nil {
			log.Error().Err(err).Stack().Msg("Unmarshaling failed")
			http.Error(rw, "Could not marshal input data", http.StatusBadRequest)
			return
		}

		ctx = context.WithValue(ctx, "video", video)
		req = req.WithContext(ctx)

		next(rw, req)
	})
}

func ValidateTTTRoundPost(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		ctx := req.Context()

		var round Round
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

		ctx = context.WithValue(ctx, "round", round)
		req = req.WithContext(ctx)

		next(rw, req)
	})
}

func verifyDate(date string) error {
	_, err := time.Parse("2006-01-02", date)
	return err
}

func setTimeBox(from, to *string) {
	if *from == "" {
		*from = "2000-12-24"
	}

	if *to == "" {
		*to = time.Now().Format("2006-01-02")
	}
}

func DateValidation(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		ctx := req.Context()

		from := req.URL.Query().Get("from")
		if from != "" {
			err := verifyDate(from)
			if err != nil {
				log.Error().Err(err).Msg("Invalid date format")
				http.Error(rw, "Invalid date (from)", http.StatusBadRequest)
				return
			}
		}

		to := req.URL.Query().Get("to")
		if to != "" {
			err := verifyDate(to)
			if err != nil {
				log.Error().Err(err).Msg("Invalid date format")
				http.Error(rw, "Invalid date (to)", http.StatusBadRequest)
				return
			}
		}

		ctx = context.WithValue(ctx, "from", from)
		ctx = context.WithValue(ctx, "to", to)
		req = req.WithContext(ctx)

		next(rw, req)
	})
}

func SetHeaders(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		rw.Header().Set("Access-Control-Allow-Origin", "*")
		next(rw, req)
	})
}
