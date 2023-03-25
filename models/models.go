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

type PercentageEntry struct {
	Percentage    float64 `json:"percentage"`
	Wins          int     `json:"wins"`
	RoundPlayedAs int     `json:"rounds"`
}

type TeamsWinPercentage struct {
	Teams        map[string]PercentageEntry `json:"teams"`
	RoundsPlayed int                        `json:"roundsPlayed"`
}
type PlayerWinPercentageResponse struct {
	Feedback string                        `json:"feedback"`
	Players  map[string]TeamsWinPercentage `json:"players"`
}

type TeamWinPercentageResponse struct {
	Feedback string         `json:"feedback"`
	Total    int            `json:"total"`
	Response map[string]int `json:"teams"`
}

type DetectiveWinPercentageEntry struct {
	WinRate      float64
	RoundsPlayed int
}
type DetecitveWinPercentageResponse struct {
	Feedback string                                 `json:"feedback"`
	Players  map[string]DetectiveWinPercentageEntry `json:"players"`
}

type RoleWinsEntry struct {
	WinRate      float64
	RoundsPlayed int
}
type RoleWinsResponse struct {
	Feedback string                              `json:"feedback"`
	Players  map[string]map[string]RoleWinsEntry `json:"players"` //"player": {"role": {"rate": e, "played": e}}
}

type TraitorComboEntry struct {
	RoundsTogether int
	WinRate        float64
}
type TraitorCombosResponse struct {
	Feedback string                                  `json:"feedback"`
	Combos   map[string]map[string]TraitorComboEntry `json:"combos"`
}

type TraitorRound struct {
	Id  string
	Win string `db:"winning_team"`
}
