package main

import (
	//Go packages
	"net/http"
	"os"
	"time"

	//External dependencies
	mux "github.com/gorilla/mux"
	"github.com/rs/zerolog"
	log "github.com/rs/zerolog/log"

	//Local packages
	. "yogsstats/handlers"
)

func init() {
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})
}

func main() {
	log.Debug().Msg("[main]")

	r := mux.NewRouter()
	r.HandleFunc("/", HomeHandler).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt", ValidateTTTInput(ServeTTTStatsPost)).Methods(http.MethodPost)
	r.HandleFunc("/stats/ttt", ServeTTTStatsGet).Methods(http.MethodGet)

	s := &http.Server{
		Handler: r,
		Addr: ":8080",
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Info().Msgf("Server listening on port: %s", s.Addr)
	s.ListenAndServe()
}