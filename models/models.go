package models

type Video struct {
	Vid        string `json:"vid" db:"id"`
	Date       string `json:"date" db:"date"`
	Title      string `json:"title" db:"title"`
	IntroDeath string `json:"introDeath" db:"intro_death"`
}

type Round struct {
	Id          string   `json:"id" db:"id"`
	Date        string   `json:"date" db:"date"`
	Players     []Player `json:"players" db:"players"`
	WinningTeam string   `json:"winningTeam" db:"winning_team"`
	Vid         string   `json:"vid" db:"id"`
	Start       int      `json:"start" db:"vid_start"`
	End         int      `json:"end" db:"vid_end"`
}

type Player struct {
	Name string `json:"name" db:"name"`
	Role string `json:"role" db:"role"`
	Team string `json:"team" db:"team"`
	Died string `json:"died" db:"died"`
}
