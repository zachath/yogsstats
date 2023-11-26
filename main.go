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
	http.HandleFunc("/stats/ttt/input", SetHeaders(BasicAuth(func(rw http.ResponseWriter, req *http.Request) {
		http.ServeFile(rw, req, "input.html")
	})))

	/*
		v2:
		/players
		/stats/{player}
	*/

	http.HandleFunc("/stats/ttt", SetHeaders(DateValidation(GetOrPost(GetTTTRound, BasicAuth(ValidateTTTRoundPost(PostTTTRound))))))
	http.HandleFunc("/stats/ttt/meta", SetHeaders(APIMetaData))
	http.HandleFunc("/stats/ttt/teamWins", SetHeaders(DateValidation(TeamWins)))
	http.HandleFunc("/stats/ttt/playerWinPercentage", SetHeaders(DateValidation(PlayerWinPercentage)))
	http.HandleFunc("/stats/ttt/detectiveWinPercentage", SetHeaders(DateValidation(DetectiveWinPercentage)))
	http.HandleFunc("/stats/ttt/traitorCombos", SetHeaders(DateValidation(TraitorCombos)))
	http.HandleFunc("/stats/ttt/videos", SetHeaders(DateValidation(GetOrPost(GetVideo, BasicAuth(ValidateVideoPost(PostVideo))))))
	http.HandleFunc("/stats/ttt/roleWinPercentage", SetHeaders(DateValidation(RoleWinPercentageHandler)))
	http.HandleFunc("/stats/ttt/jesterKills", SetHeaders(DateValidation(JesterKills)))
	http.HandleFunc("/stats/ttt/teams", SetHeaders(GetTeams))
	http.HandleFunc("/stats/ttt/roles", SetHeaders(GetRoles))
	http.HandleFunc("/stats/ttt/players", SetHeaders(GetPlayers))
	http.HandleFunc("/stats/ttt/beggarWinRateByTeam", SetHeaders(BeggarWinRateByTeam))

	port := fmt.Sprintf(":%s", os.Getenv("PORT"))
	log.Info().Msgf("Server listening on port: %s", port)
	err := http.ListenAndServeTLS(port, "/etc/letsencrypt/live/yogsstats.com/fullchain.pem", "/etc/letsencrypt/live/yogsstats.com/privkey.pem", nil)
	log.Error().Err(err).Msg("Server exited.")
}
