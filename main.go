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
	"yogsstats/handlers"
)

func init() {
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})
}

func main() {
	log.Debug().Msg("[main]")

	r := mux.NewRouter()
	r.HandleFunc("/", handlers.HomeHandler).Methods(http.MethodGet)
	r.HandleFunc("/stats", handlers.StatsHandler).Methods(http.MethodGet, http.MethodPost)

	s := &http.Server{
		Handler: r,
		Addr: ":8080",
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Info().Msgf("Server listening on port: %s", s.Addr)
	s.ListenAndServe()
}