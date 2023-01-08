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
)

func init() {
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})
	zerolog.ErrorStackMarshaler = pkgerrors.MarshalStack
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", SetHeaders(HomeHandler)).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt", SetHeaders(ValidatePost(ValidateTTTInput(PostTTTRound)))).Methods(http.MethodPost)
	r.HandleFunc("/stats/ttt", SetHeaders(DateValidation(GetTTTRound))).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/meta", SetHeaders(APIMetaData)).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/teamWins", SetHeaders(DateValidation(TeamWins))).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/playerWinPercentage", SetHeaders(DateValidation(PlayerWinPercentage))).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/detectiveWinPercentage", SetHeaders(DateValidation(DetectiveWinPercentage))).Methods(http.MethodGet)
	r.HandleFunc("/stats/ttt/traitorCombos", SetHeaders(DateValidation(TraitorCombos))).Methods(http.MethodGet)

	s := &http.Server{
		Handler: r,
		Addr: fmt.Sprintf(":%s", os.Getenv("PORT")),
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Info().Msgf("Server listening on port: %s", s.Addr)
	err := s.ListenAndServe()
	log.Error().Err(err).Msg("Server exited.")
}