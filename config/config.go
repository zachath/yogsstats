package config

import "regexp"

var (
	DateRegex = regexp.MustCompile("[0-9]{4}-[0-9]{2}-[0-9]{2}") //Dont judge, regex is hard.
)