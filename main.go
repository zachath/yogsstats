package main

import (
	//Go packages

	"fmt"
	"net/http"
	"os"
	"time"

	//External dependencies
	"github.com/gorilla/mux"
	"github.com/rs/zerolog"
	log "github.com/rs/zerolog/log"
	"github.com/rs/zerolog/pkgerrors"

	//Local packages
	handlers "yogsstats/handlers"
)

// TODO: Why no stacktrace
func init() {
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})
	zerolog.ErrorStackMarshaler = pkgerrors.MarshalStack
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/meta", handlers.SetHeaders(handlers.APIMetaData)).Methods(http.MethodOptions, http.MethodGet)

	r.HandleFunc("/rounds", handlers.SetHeaders(handlers.DateValidation(handlers.Rounds))).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/rounds/{round}", handlers.SetHeaders(handlers.GetRound)).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/rounds/{round}", handlers.SetHeaders(handlers.BasicAuth(handlers.InsertRound))).Methods(http.MethodOptions, http.MethodPost)

	r.HandleFunc("/videos", handlers.SetHeaders(handlers.DateValidation(handlers.Videos))).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/videos/{video}", handlers.SetHeaders(handlers.GetVideo2)).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/videos/{video}", handlers.SetHeaders(handlers.BasicAuth(handlers.PostVideo2))).Methods(http.MethodOptions, http.MethodPost)

	r.HandleFunc("/players", handlers.SetHeaders(nil)).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/players/{player}", handlers.SetHeaders(nil)).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/players/{player}", handlers.SetHeaders(handlers.BasicAuth(handlers.PostPlayer))).Methods(http.MethodOptions, http.MethodPost)

	r.HandleFunc("/teams", handlers.SetHeaders(handlers.DateValidation(handlers.Teams))).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/teams/{team}", handlers.SetHeaders(handlers.DateValidation(handlers.GetTeam))).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/teams/{team}", handlers.SetHeaders(handlers.BasicAuth(handlers.InsertTeam))).Methods(http.MethodOptions, http.MethodPost)

	r.HandleFunc("/roles", handlers.SetHeaders(handlers.Roles)).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/roles/{role}", handlers.SetHeaders(handlers.GetRole)).Methods(http.MethodOptions, http.MethodGet)
	r.HandleFunc("/roles/{role}", handlers.SetHeaders(handlers.BasicAuth(handlers.InsertRole))).Methods(http.MethodOptions, http.MethodPost)

	port := fmt.Sprintf(":%s", os.Getenv("PORT"))
	log.Info().Msgf("Server listening on port: %s", port)

	server := &http.Server{
		Handler:      r,
		Addr:         port,
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	log.Fatal().Err(server.ListenAndServeTLS("/etc/letsencrypt/live/yogsstats.com/fullchain.pem", "/etc/letsencrypt/live/yogsstats.com/privkey.pem")).Msg("Server exited.")
}
