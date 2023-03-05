package main

import (
	//Go packages

	"fmt"
	"net/http"
	"os"

	//External dependencies
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
	http.HandleFunc("/", RootHandler)
	http.HandleFunc("/readme", SetHeaders(ReadMeHandler))
	http.HandleFunc("/stats/ttt/post", SetHeaders(ValidatePost(ValidateTTTRoundPost(PostTTTRound))))
	http.HandleFunc("/stats/ttt", SetHeaders(DateValidation(GetTTTRound)))
	http.HandleFunc("/stats/ttt/meta", SetHeaders(APIMetaData))
	http.HandleFunc("/stats/ttt/teamWins", SetHeaders(DateValidation(TeamWins)))
	http.HandleFunc("/stats/ttt/playerWinPercentage", SetHeaders(DateValidation(PlayerWinPercentage)))
	http.HandleFunc("/stats/ttt/detectiveWinPercentage", SetHeaders(DateValidation(DetectiveWinPercentage)))
	http.HandleFunc("/stats/ttt/traitorCombos", SetHeaders(DateValidation(TraitorCombos)))
	http.HandleFunc("/stats/ttt/videos", SetHeaders(DateValidation(GetVideo)))
	http.HandleFunc("/stats/ttt/videos/post", SetHeaders(ValidatePost(ValidateVideoPost(PostVideo))))

	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))

	go func() {
		log.Fatal().Err(http.ListenAndServe(":80", http.HandlerFunc(redirectToTls))).Msg("")
	}()

	port := fmt.Sprintf(":%s", os.Getenv("PORT"))
	log.Info().Msgf("Server listening on port: %s", port)
	err := http.ListenAndServeTLS(port, "/etc/letsencrypt/live/yogsstats.com/fullchain.pem", "/etc/letsencrypt/live/yogsstats.com/privkey.pem", nil)
	log.Error().Err(err).Msg("Server exited.")

	//When running locally.
	//log.Info().Msgf("Running on port %s", s.Addr)
	//err := http.ListenAndServe(":8080", nil)
	//log.Error().Err(err).Msg("")
}

func redirectToTls(rw http.ResponseWriter, req *http.Request) {
	http.Redirect(rw, req, "https://"+req.Host+req.RequestURI, http.StatusMovedPermanently)
}
