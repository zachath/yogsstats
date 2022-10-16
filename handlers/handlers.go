package handlers

import (
	//Go packages
	"fmt"
	"io"
	"net/http"

	//External dependencies
	log "github.com/rs/zerolog/log"
)

func HomeHandler(rw http.ResponseWriter, req *http.Request) {
	log.Debug().Msg("[HomeHandler]")
	http.Error(rw, "Not implemented", http.StatusNotImplemented)
}

func StatsHandler(rw http.ResponseWriter, req *http.Request) {
	log.Debug().Msg("[StatsHandler]")
	switch req.Method {
	case http.MethodGet:
		serveStatsGet(rw, req)
	case http.MethodPost:
		serveStatsPost(rw, req)
	default:
		errString := fmt.Sprintf("Unsupported method %s\n", req.Method)
		log.Error().Msgf(errString)
		http.Error(rw, errString, http.StatusForbidden)
	}
}

func serveStatsGet(rw http.ResponseWriter, req *http.Request) {
	log.Debug().Msg("[serverStatsGet]")
	io.WriteString(rw, "serveStatsGet\n")
}

func serveStatsPost(rw http.ResponseWriter, req *http.Request) {
	log.Debug().Msg("[serverStatsPost]")
	io.WriteString(rw, "serveStatsPost\n")
}