package handlers

import (
	//Go packages
	"context"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"os"
	"strconv"
	"time"

	//External dependencies
	"github.com/gomarkdown/markdown"
	"github.com/gomarkdown/markdown/html"
	"github.com/pkg/errors"
	log "github.com/rs/zerolog/log"
	"golang.org/x/crypto/bcrypt"

	//Local packages
	config "yogsstats/config"
	db "yogsstats/database"
	. "yogsstats/models"
)

func ValidatePost(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		hashedPass := os.Getenv("POST_PASS")
		
		err := bcrypt.CompareHashAndPassword([]byte(hashedPass), []byte(req.Header.Get("X-Access-Token")))

		if err != nil {
			log.Error().Err(err).Msg("POST ATTEMTED USING INVALID PASSWORD!!!")
			http.Error(rw, "", http.StatusNotFound)
			b, _ := bcrypt.GenerateFromPassword([]byte(req.Header.Get("X-Access-Token")), 10)
			log.Debug().Str("Got", string(b)).Str("expected", hashedPass).Msg("")
			return
		}

		next(rw, req)
	})
}

func ValidateTTTInput(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		ctx := req.Context()

		var round TTTRound
		defer req.Body.Close()

		reqBody, err := ioutil.ReadAll(req.Body)
		if err != nil {
			log.Error().Err(err).Stack().Msg("Parsing body to TTT round failed")
			http.Error(rw, "Could not parse input data", http.StatusBadRequest)
			return
		}

		err = json.Unmarshal(reqBody, &round)
		if err != nil {
			log.Error().Err(err).Stack().Msg("Unmarshaling failed")
			http.Error(rw, "Could not marshal input data", http.StatusBadRequest)
			return
		}

		matched := len(config.DateRegex.FindAllString(round.Date, -1)) == 1
		if !matched {
			log.Error().Err(err).Stack().Msgf("Date did not match regex")
			http.Error(rw, "Wrong date format", http.StatusBadRequest)
			return
		}

		ctx = context.WithValue(ctx, "round", round)
		req = req.WithContext(ctx)

		next(rw, req)
	})
}

func verifyDate(date string) error {
	_, err := time.Parse("2006-01-02", date)
	return err
}

func setTimeBox(from, to *string) {
	if *from == "" {
		*from = "2000-12-24"
	}

	if *to == "" {
		*to = time.Now().Format("2006-01-02")
	}
}

func DateValidation(next http.HandlerFunc) http.HandlerFunc {
	return http.HandlerFunc(func(rw http.ResponseWriter, req *http.Request) {
		ctx := req.Context()

		from := req.URL.Query().Get("from")
		if from != "" {
			err := verifyDate(from)
			if err != nil {
				log.Error().Err(err).Msg("Invalid date format")
				http.Error(rw, "Invalid date (from)", http.StatusBadRequest)
				return
			}
		}

		to := req.URL.Query().Get("to")
		if to != "" {
			err := verifyDate(from)
			if err != nil {
				log.Error().Err(err).Msg("Invalid date format")
				http.Error(rw, "Invalid date (to)", http.StatusBadRequest)
				return
			}
		}

		ctx = context.WithValue(ctx, "from", from)
		ctx = context.WithValue(ctx, "to", to)
		req = req.WithContext(ctx)

		next(rw, req)
	})
}

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
		log.Error().Err(err).Msgf("Failed to get TTT round")
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
		log.Error().Msg("Round insertion failed.")
		http.Error(rw, fmt.Sprintf("Failed to add POSTed round to database: %s", err.Error()), http.StatusInternalServerError)
		return
	}

	io.WriteString(rw, "POSTed round successfully")
}

func TeamWinShare(rw http.ResponseWriter, req *http.Request) {
	team := req.URL.Query().Get("team")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	setTimeBox(&from, &to)

	var response db.TeamWinShareResponse
	var err error
	if team == "" {
		response, err = db.TeamWinShare("*", from, to)
		if err != nil {
			log.Error().Err(err).Msg("Failed getting team win share.")
		}
	} else {
		response, err = db.TeamWinShare(team, from, to)
		if err != nil {
			log.Error().Err(err).Msg("Failed getting team win share.")
		}
	}
	
	json.NewEncoder(rw).Encode(response)
}

func PlayerWinPercentage(rw http.ResponseWriter, req *http.Request) {
	player := req.URL.Query().Get("player")
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	trunc := false
	if req.URL.Query().Get("trunc") != "false" {
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
			log.Error().Err(err).Msg("Failed getting team win share.")
		}
	} else {
		response, err = db.PlayerWinPercentage(player, from, to, canon, trunc)
		if err != nil {
			log.Error().Err(err).Msg("Failed getting team win share.")
		}
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
	if req.URL.Query().Get("trunc") != "false" {
		trunc = true
	}

	var response db.TraitorCombosResponse
	var err error
	response, err = db.TraitorCombos("*", from, to, trunc)
	if err != nil {
		log.Error().Err(err).Msg("Failed getting team win share.")
	}
	
	json.NewEncoder(rw).Encode(response)
}