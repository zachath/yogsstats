package main

import (
	//Go packages
	"fmt"
	"net/http"
	"os"
	"time"

	//External dependencies
	mux "github.com/gorilla/mux"
	"github.com/rs/zerolog"
	log "github.com/rs/zerolog/log"
	"github.com/rs/zerolog/pkgerrors"

	//Local packages
	. "yogsstats/handlers"
	//. "yogsstats/util"
)

func init() {
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})
	zerolog.ErrorStackMarshaler = pkgerrors.MarshalStack
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", HomeHandler).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt", ValidatePost(ValidateTTTInput(PostTTTRound))).Methods(http.MethodPost)
	r.HandleFunc("/stats/ttt", DateValidation(GetTTTRound)).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/meta", APIMetaData).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/teamWinPercentage", DateValidation(TeamWinPercentage)).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/playerWinPercentage", DateValidation(PlayerWinPercentage)).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/traitorCombos", DateValidation(TraitorCombos)).Methods(http.MethodGet)

	s := &http.Server{
		Handler: r,
		Addr: fmt.Sprintf(":%s", os.Getenv("PORT")),
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Info().Msgf("Server listening on port: %s", s.Addr)
	s.ListenAndServe()
}