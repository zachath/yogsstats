package stupid

import "strings"

//SQLX (or postgres?) has bested me :(

func FixStupidDate(s string) string {
	if idx := strings.Index(s, "T"); idx != -1 {
		s =  s[:idx]
	}

	return s
}