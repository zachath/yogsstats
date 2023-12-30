package handlers

import (
	"encoding/json"
	"io"
	"net/http"
	"yogsstats/database"
	"yogsstats/models"

	"github.com/gorilla/mux"
	log "github.com/rs/zerolog/log"
)

func Videos(rw http.ResponseWriter, req *http.Request) {
	from := req.Context().Value("from").(string)
	to := req.Context().Value("to").(string)

	videos, err := database.GetVideos(from, to, "")
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to get videos")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	err = json.NewEncoder(rw).Encode(videos)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Msg("videos (GET) request served")
}

func GetVideo2(rw http.ResponseWriter, req *http.Request) {
	vars := mux.Vars(req)

	video, err := database.GetVideo2("2000-12-24", "2099-12-24", " AND video_id = $3", vars["video"])
	if err != nil {
		log.Error().Stack().Err(err).Msgf("failed to get video '%s'", vars["video"])
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	if video.Id == "" {
		log.Error().Stack().Err(err).Msgf("did not find video '%s'", vars["video"])
		http.Error(rw, "bad request", http.StatusBadRequest)
		return
	}

	err = json.NewEncoder(rw).Encode(video)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to encode response")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Msgf("video (GET) request served, round: %s", vars["video"])
}

func PostVideo2(rw http.ResponseWriter, req *http.Request) {
	video := models.Video2{
		Id: mux.Vars(req)["video"],
	}

	b, err := io.ReadAll(req.Body)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to read body")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	err = json.Unmarshal(b, &video)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to unmarshal request")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	if video.Id == "" || video.Date == "" || video.Title == "" {
		log.Error().Stack().Err(err).Msg("request did not contian all required fields")
		http.Error(rw, "bad request", http.StatusBadRequest)
		return
	}

	err = database.InsertVideo2(video)
	if err != nil {
		log.Error().Stack().Err(err).Msg("failed to insert video")
		http.Error(rw, "internal server error", http.StatusInternalServerError)
		return
	}

	log.Info().Int("code", http.StatusOK).Str("video", mux.Vars(req)["video"]).Msg("video (POST) request served")
}
