package main

import (
	"net/http"
)

func main() {
	http.HandleFunc("/", rootHandler)
	http.Handle("/assets/", http.StripPrefix("/assets/", http.FileServer(http.Dir("assets"))))
	http.ListenAndServe(":5002", nil)
}

func rootHandler(rw http.ResponseWriter, r *http.Request) {
	http.ServeFile(rw, r, "templates/index.html")
}