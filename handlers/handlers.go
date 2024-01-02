package handlers

import (
	//Go packages
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"time"
	"yogsstats/models"

	//External dependencies
	log "github.com/rs/zerolog/log"
	"golang.org/x/crypto/bcrypt"
	//Local packages
)

func BasicAuth(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		_, providedPassword, ok := req.BasicAuth()
		log.Debug().Bool("ok", ok).Msg("")

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
		writeError(&rw, "unauthorized", http.StatusUnauthorized)
	})
}

func ValidateVideoPost(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		ctx := req.Context()

		var video models.Video
		defer req.Body.Close()

		reqBody, err := io.ReadAll(req.Body)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Parsing body to video failed")
			writeError(&rw, "could not parse input data", http.StatusBadRequest)
			return
		}

		err = json.Unmarshal(reqBody, &video)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Unmarshaling failed")
			writeError(&rw, "could not marshal input data", http.StatusBadRequest)
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

		var round models.Round
		defer req.Body.Close()

		reqBody, err := io.ReadAll(req.Body)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Parsing body to TTT round failed")
			writeError(&rw, "could not parse input data", http.StatusBadRequest)
			return
		}

		err = json.Unmarshal(reqBody, &round)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Unmarshaling failed")
			writeError(&rw, "could not marshal input data", http.StatusBadRequest)
			return
		}

		ctx = context.WithValue(ctx, "round", round)
		req = req.WithContext(ctx)

		next(rw, req)
	})
}

func setTimeBox(from, to *string) {
	if *from == "" {
		*from = "2000-12-24"
	}

	if *to == "" {
		*to = time.Now().Format("2006-01-02")
	}
}

func SetHeaders(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		rw.Header().Set("Access-Control-Allow-Origin", "*")
		next(rw, req)
	})
}

func verifyDate(date string) error {
	_, err := time.Parse("2006-01-02", date)
	return err
}

func writeError(rw *http.ResponseWriter, msg string, code int) {
	http.Error(*rw, fmt.Sprintf(`{"code": %d, "error": "%s"}`, code, msg), code)
}

func wrtiteInternalError(rw *http.ResponseWriter) {
	writeError(rw, "internal server error", http.StatusInternalServerError)
}

func DateValidation(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		ctx := req.Context()

		from := req.URL.Query().Get("from")
		if from != "" {
			err := verifyDate(from)
			if err != nil {
				log.Error().Stack().Err(err).Msg("invalid date format")
				writeError(&rw, "invalid date (from)", http.StatusBadRequest)
				return
			}
		} else {
			from = "2000-12-24"
		}

		to := req.URL.Query().Get("to")
		if to != "" {
			err := verifyDate(to)
			if err != nil {
				log.Error().Stack().Err(err).Msg("invalid date format")
				writeError(&rw, "invalid date (to)", http.StatusBadRequest)
				return
			}
		} else {
			to = "2099-12-24"
		}

		ctx = context.WithValue(ctx, "from", from)
		ctx = context.WithValue(ctx, "to", to)
		req = req.WithContext(ctx)

		next(rw, req)
	})
}
