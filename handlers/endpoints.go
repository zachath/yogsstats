package handlers

import (
	//Go packages
	"net/http"
	"encoding/json"
	"strconv"
	"io"
	"io/ioutil"
	"fmt"

	//External dependencies
	log "github.com/rs/zerolog/log"
	"github.com/pkg/errors"
	"github.com/gomarkdown/markdown"
	"github.com/gomarkdown/markdown/html"

	//Local packages
	db "yogsstats/database"
	. "yogsstats/models"
)

func HomeHandler(rw http.ResponseWriter, req *http.Request) {
	content, err := ioutil.ReadFile("README.md")
	if err != nil {
		http.Error(rw, "Error loading page.", http.StatusInternalServerError)
		return
	}

	md := []byte(content)
	flags := html.CommonFlags | html.HrefTargetBlank
	html := markdown.ToHTML(md, nil, html.NewRenderer(html.RendererOptions{Flags: flags}))
	rw.Write(html)
}

func GetTTTRound(rw http.ResponseWriter, req *http.Request) {
	var rounds []TTTRound
	var err	error

	id := req.URL.Query().Get("id")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	setTimeBox(&from, &to)

	rounds, err = db.GetRound(id, from, to)

	if err != nil {
		log.Error().Stack().Err(err).Msgf("Failed to get TTT round")
		http.Error(rw, fmt.Sprintf("Failed to get TTT round: %s", err.Error()), http.StatusInternalServerError)
		return
	}

	if rounds == nil {
		http.Error(rw, fmt.Sprint("No rounds found."), http.StatusNotFound)
		return
	}

	rw.Header().Set("Content-Type", "application/json")
	rw.WriteHeader(http.StatusOK)

	json.NewEncoder(rw).Encode(rounds)
}

func PostTTTRound(rw http.ResponseWriter, req *http.Request) {
	round := req.Context().Value("round").(TTTRound)

	err := db.InsertRound(&round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Round insertion failed.")
		http.Error(rw, fmt.Sprintf("Failed to add POSTed round to database: %s", err.Error()), http.StatusInternalServerError)
		return
	}

	io.WriteString(rw, "POSTed round successfully")
}

func TeamWinPercentage(rw http.ResponseWriter, req *http.Request) {
	team := req.URL.Query().Get("team")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	trunc := false
	if req.URL.Query().Get("trunc") == "true" {
		trunc = true
	}

	setTimeBox(&from, &to)

	var response db.TeamWinPercentageResponse
	var err error
	if team == "" {
		response, err = db.TeamWinPercentage("*", from, to, trunc)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Failed getting team win share.")
		}
	} else {
		response, err = db.TeamWinPercentage(team, from, to, trunc)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Failed getting team win share.")
		}
	}

	delete(response.Response, "none")
	
	json.NewEncoder(rw).Encode(response)
}

func PlayerWinPercentage(rw http.ResponseWriter, req *http.Request) {
	player := req.URL.Query().Get("player")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	trunc := false
	if req.URL.Query().Get("trunc") == "true" {
		trunc = true
	}
	
	canon := false
	var err error
	if req.URL.Query().Has("canon") {
		canon, err = strconv.ParseBool(req.URL.Query().Get("canon"))
		if err != nil {
			io.WriteString(rw, "Cannot parse 'canon' paramter, reverting to default\n")
			canon = false
		}
	}

	setTimeBox(&from, &to)

	var response db.PlayerWinPercentageResponse
	if player == "" {
		response, err = db.PlayerWinPercentage("*", from, to, canon, trunc)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Failed getting team win share.")
		}
	} else {
		response, err = db.PlayerWinPercentage(player, from, to, canon, trunc)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Failed getting team win share.")
		}
	}

	for player := range response.Players {
		delete(response.Players[player].Teams, "none")
	}
	
	json.NewEncoder(rw).Encode(response)
}

func APIMetaData(rw http.ResponseWriter, req *http.Request) {
	type MetaResponse struct {
		Count 		int 			`json:"roundCount"`
		OldestRound db.RoundInfo 	`json:"oldestRound"`
		NewestRound db.RoundInfo 	`json:"newestRound"`
	}

	count, err := db.CountRows("round", "")
	if err != nil {
		http.Error(rw, errors.Wrap(err, "Failed to count round rows").Error(), http.StatusInternalServerError)
		return
	}

	oldestRound, err := db.GetOldestRoundInfo()
	if err != nil {
		http.Error(rw, errors.Wrap(err, "Failed to get oldest round info").Error(), http.StatusInternalServerError)
		return
	}

	newestRound, err := db.GetNewestRoundInfo()
	if err != nil {
		http.Error(rw, errors.Wrap(err, "Faailed to get newest round info").Error(), http.StatusInternalServerError)
		return
	}

	response := MetaResponse{
		Count: count,
		OldestRound: oldestRound,
		NewestRound: newestRound,
	}

	json.NewEncoder(rw).Encode(response)
}

func TraitorCombos(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	setTimeBox(&from, &to)

	trunc := false
	if req.URL.Query().Get("trunc") == "true" {
		trunc = true
	}

	var response db.TraitorCombosResponse
	var err error
	response, err = db.TraitorCombos("*", from, to, trunc)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Failed getting team win share.")
	}
	
	json.NewEncoder(rw).Encode(response)
}