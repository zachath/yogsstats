package handlers

import (
	//Go packages
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"strconv"

	//External dependencies

	log "github.com/rs/zerolog/log"

	//Local packages
	db "yogsstats/database"
	. "yogsstats/models"
	stupid "yogsstats/stupid"
)

func GetVideo(rw http.ResponseWriter, req *http.Request) {
	var videos []Video
	var err error

	vid := req.URL.Query().Get("vid")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	setTimeBox(&from, &to)

	videos, err = db.GetVideo(vid, from, to)

	if err != nil {
		log.Error().Stack().Err(err).Msgf("Failed to get video")
		http.Error(rw, fmt.Sprintf("Failed to get video: %s", vid), http.StatusInternalServerError)
		return
	}

	if videos == nil {
		http.Error(rw, "No rounds found.", http.StatusNotFound)
		return
	}

	for index := range videos {
		videos[index].Date = stupid.FixStupidDate(videos[index].Date)
	}

	rw.Header().Set("Content-Type", "application/json")
	rw.WriteHeader(http.StatusOK)

	log.Info().Msg("Served Get videos request!")

	json.NewEncoder(rw).Encode(videos)
}

func PostVideo(rw http.ResponseWriter, req *http.Request) {
	video := req.Context().Value("video").(Video)

	err := db.InsertVideo(&video)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Round insertion failed.")
		http.Error(rw, fmt.Sprintf("Failed to add POSTed round with id %s to database", video.Vid), http.StatusInternalServerError)
		return
	}

	log.Info().Msg("Served TTT video POST request!")

	io.WriteString(rw, "POSTed video successfully")
}

func GetTTTRound(rw http.ResponseWriter, req *http.Request) {
	var rounds []Round
	var err error

	id := req.URL.Query().Get("id")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	setTimeBox(&from, &to)

	rounds, err = db.GetRound(id, from, to)

	if err != nil {
		log.Error().Stack().Err(err).Msgf("Failed to get TTT round")
		http.Error(rw, fmt.Sprintf("Failed to get TTT round: %s", id), http.StatusInternalServerError)
		return
	}

	if rounds == nil {
		http.Error(rw, "No rounds found.", http.StatusNotFound)
		return
	}

	for index := range rounds {
		rounds[index].Date = stupid.FixStupidDate(rounds[index].Date)
	}

	rw.Header().Set("Content-Type", "application/json")
	rw.WriteHeader(http.StatusOK)

	log.Info().Msg("Served Get TTT round request!")

	json.NewEncoder(rw).Encode(rounds)
}

func GetTeams(rw http.ResponseWriter, req *http.Request) {
	teams, err := db.GetTeams()
	if err != nil {
		log.Error().Stack().Err(err).Msg("Failed to get teams")
		return
	}

	json.NewEncoder(rw).Encode(teams)
}

func PostTTTRound(rw http.ResponseWriter, req *http.Request) {
	round := req.Context().Value("round").(Round)

	err := db.InsertRound(&round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Round insertion failed.")
		http.Error(rw, fmt.Sprintf("Failed to add POSTed round with id %s to database", round.Id), http.StatusInternalServerError)
		return
	}

	log.Info().Msg("Served TTT Round POST request!")

	io.WriteString(rw, "POSTed round successfully")
}

func GetRoles(rw http.ResponseWriter, req *http.Request) {
	canWin := true
	if req.URL.Query().Get("canWin") == "false" {
		canWin = false
	}

	roles, err := db.GetRoles("*", canWin)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Failed to get roles")
		return
	}

	json.NewEncoder(rw).Encode(RolesResponse{Roles: roles})
}

func TeamWins(rw http.ResponseWriter, req *http.Request) {
	team := req.URL.Query().Get("team")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	setTimeBox(&from, &to)

	var response TeamWinPercentageResponse
	var err error
	if team == "" {
		team = "*"
	}

	response, err = CalculateTeamWins(team, from, to)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Failed getting team win percentage.")
		http.Error(rw, "Failed getting team win percentage.", http.StatusInternalServerError)
		return
	}

	log.Info().Msg("Served Team Win Percentage request!")

	json.NewEncoder(rw).Encode(response)
}

func PlayerWinPercentage(rw http.ResponseWriter, req *http.Request) {
	player := req.URL.Query().Get("player")
	team := req.URL.Query().Get("team")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	round := false
	if req.URL.Query().Get("round") == "true" {
		round = true
	}

	var err error

	setTimeBox(&from, &to)

	var response PlayerWinPercentageResponse
	if player == "" {
		player = "*"
	}

	if team == "" {
		team = "*"
	}

	response, err = CalculatePlayerWinPercentage(player, team, from, to, round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Failed getting player win percentage.")
		http.Error(rw, "Failed getting player win percentage.", http.StatusInternalServerError)
		return
	}

	log.Info().Msg("Served player win percentage request!")

	json.NewEncoder(rw).Encode(response)
}

func DetectiveWinPercentage(rw http.ResponseWriter, req *http.Request) {
	player := req.URL.Query().Get("player")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	round := false
	if req.URL.Query().Get("round") == "true" {
		round = true
	}

	setTimeBox(&from, &to)
	canon := false
	var err error
	if req.URL.Query().Has("canon") {
		canon, err = strconv.ParseBool(req.URL.Query().Get("canon"))
		if err != nil {
			canon = false
		}
	}

	var response DetecitveWinPercentageResponse
	if player == "" {
		player = "*"
	}

	response, err = CalculateDetectiveWinPercentage(player, from, to, canon, round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Failed getting detective win percentage.")
		http.Error(rw, "Failed getting detective win percentage.", http.StatusInternalServerError)
		return
	}

	log.Info().Msg("Served detective win percentage request!")

	json.NewEncoder(rw).Encode(response)
}

func RoleWinPercentageHandler(rw http.ResponseWriter, req *http.Request) {
	player := req.URL.Query().Get("player")
	role := req.URL.Query().Get("role")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	round := false
	if req.URL.Query().Get("round") == "true" {
		round = true
	}

	setTimeBox(&from, &to)
	var err error

	var response RoleWinsResponse
	if player == "" {
		player = "*"
	}
	if role == "" {
		role = "*"
	}

	response, err = CalculateRoleWins(player, role, from, to, round)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Failed getting role win percentage.")
		http.Error(rw, "Failed getting role win percentage.", http.StatusInternalServerError)
		return
	}

	log.Info().Msg("Served role win percentage request!")

	json.NewEncoder(rw).Encode(response)
}

func APIMetaData(rw http.ResponseWriter, req *http.Request) {
	type MetaResponse struct {
		Count       int          `json:"roundCount"`
		OldestRound db.RoundInfo `json:"oldestRound"`
		NewestRound db.RoundInfo `json:"newestRound"`
	}

	count, err := db.CountRows("round", "")
	if err != nil {
		log.Error().Stack().Err(err).Msg("")
		http.Error(rw, "Failed to count round rows", http.StatusInternalServerError)
		return
	}

	oldestRound, err := db.GetOldestRoundInfo()
	if err != nil {
		log.Error().Stack().Err(err).Msg("")
		http.Error(rw, "Failed to get oldest round info", http.StatusInternalServerError)
		return
	}

	newestRound, err := db.GetNewestRoundInfo()
	if err != nil {
		log.Error().Stack().Err(err).Msg("")
		http.Error(rw, "Failed to get newest round info", http.StatusInternalServerError)
		return
	}

	newestRound.Date = stupid.FixStupidDate(newestRound.Date)
	oldestRound.Date = stupid.FixStupidDate(oldestRound.Date)

	response := MetaResponse{
		Count:       count,
		OldestRound: oldestRound,
		NewestRound: newestRound,
	}

	log.Info().Int("code", http.StatusOK).Msg("API meta request served.")

	json.NewEncoder(rw).Encode(response)
}

type traitorComboCache struct {
	LatestRound int
	Response    TraitorCombosResponse
	From        string
	To          string
	Round       bool
	Player      string
}

var cache = traitorComboCache{LatestRound: -1}

func redoCalculation(from, to, player string, round bool) (int, bool, error) {
	newestRound, err := db.GetNewestRoundInfo()
	if err != nil {
		return cache.LatestRound, true, err
	}

	newestRoundID, err := strconv.Atoi(newestRound.Id)
	if err != nil {
		return cache.LatestRound, true, err
	}

	if player != cache.Player {
		return newestRoundID, true, nil
	}

	return newestRoundID, cache.LatestRound < newestRoundID || cache.From != from || cache.To != to || cache.Round != round, nil
}

func TraitorCombos(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)
	player := req.URL.Query().Get("player")

	setTimeBox(&from, &to)

	round := false
	if req.URL.Query().Get("round") == "true" {
		round = true
	}

	var response TraitorCombosResponse
	newestRoundID, redo, err := redoCalculation(from, to, player, round)
	if err != nil {
		log.Error().Err(err).Msg("Redo check failed.")
		redo = true
	}

	if redo {
		log.Debug().Msg("Redoing Traitor Combo calculations...")
		inputPlayer := player
		if player == "" {
			inputPlayer = "*"
		}

		response, err = CalculateTraitorCombos(inputPlayer, from, to, round)
		if err != nil {
			log.Error().Stack().Err(err).Msg("Failed getting traitor combos.")
			http.Error(rw, "Failed getting traitor combos", http.StatusInternalServerError)
			return
		}

		cache.Response = response
		cache.LatestRound = newestRoundID
		cache.From = from
		cache.To = to
		cache.Round = round
		cache.Player = player
	} else {
		log.Debug().Msg("Using cached Traitor Combo response...")
		response = cache.Response
	}

	log.Info().Msg("Served Traitor Combos request request!")

	json.NewEncoder(rw).Encode(response)
}

func JesterKills(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	setTimeBox(&from, &to)

	response, err := calculateJesterKills(from, to)
	if err != nil {
		log.Error().Stack().Err(err).Msg("Failed getting jester kills")
		http.Error(rw, "Failed getting jester kills.", http.StatusInternalServerError)
		return
	}

	log.Info().Msg("Served jester kills request!")

	json.NewEncoder(rw).Encode(response)
}
