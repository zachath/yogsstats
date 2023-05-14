package models

type Video struct {
	Vid        string `json:"vid" db:"id"`
	Date       string `json:"date" db:"date"`
	Title      string `json:"title" db:"title"`
	IntroDeath string `json:"introDeath" db:"intro_death"`
}

type Round struct {
	Id           string   `json:"id" db:"id"`
	Date         string   `json:"date" db:"date"`
	Players      []Player `json:"players" db:"players"`
	WinningTeam  string   `json:"winningTeam" db:"winning_team"`
	Vid          string   `json:"vid" db:"id"`
	Start        int      `json:"start" db:"vid_start"`
	End          int      `json:"end" db:"vid_end"`
	JesterKiller string   `json:"jesterKiller" db:"jester_killer"`
}

type Player struct {
	Name string `json:"name" db:"name"`
	Role string `json:"role" db:"role"`
	Team string `json:"team" db:"team"`
	Died string `json:"died" db:"died"`
}

type TeamEntry struct {
	Team          string  `json:"team"`
	WinPercentage float64 `json:"winPercentage"`
	Wins          int     `json:"wins"`
	RoundPlayedAs int     `json:"rounds"`
}

type TeamsWinPercentage struct {
	Player       string      `json:"player"`
	Teams        []TeamEntry `json:"teams"`
	RoundsPlayed int         `json:"roundsPlayed"`
}
type PlayerWinPercentageResponse struct {
	Feedback string               `json:"feedback"`
	Players  []TeamsWinPercentage `json:"players"`
}

type TeamWin struct {
	Team string `json:"team"`
	Wins int    `json:"wins"`
}

type TeamWinPercentageResponse struct {
	Feedback string    `json:"feedback"`
	Total    int       `json:"total"`
	Response []TeamWin `json:"teams"`
}

type DetectiveWinPercentageEntry struct {
	Player        string  `json:"player"`
	WinPercentage float64 `json:"winPercentage"`
	RoundsPlayed  int     `json:"roundsPlayed"`
}
type DetecitveWinPercentageResponse struct {
	Feedback string                        `json:"feedback"`
	Players  []DetectiveWinPercentageEntry `json:"players"`
}

type RoleWinsEntry struct {
	Role          string  `json:"role"`
	WinPercentage float64 `json:"winPercentage"`
	Wins          int     `json:"wins"`
	RoundPlayedAs int     `json:"rounds"`
}

type RoleWinPercentage struct {
	Player string          `json:"player"`
	Roles  []RoleWinsEntry `json:"roles"`
}
type RoleWinsResponse struct {
	Feedback string              `json:"feedback"`
	Players  []RoleWinPercentage `json:"players"`
}

type TraitorComboEntry struct {
	Player         string  `json:"player"`
	RoundsTogether int     `json:"roundsTogether"`
	WinPercentage  float64 `json:"winPercentage"`
}

type Pairings struct {
	Player  string              `json:"player"`
	Entries []TraitorComboEntry `json:"entries"`
}
type TraitorCombosResponse struct {
	Feedback string     `json:"feedback"`
	Combos   []Pairings `json:"combos"`
}

type TraitorRound struct {
	Id  string
	Win string `db:"winning_team"`
}

type TeamsResponse struct {
	Teams []string `json:"teams"`
}

type RolesResponse struct {
	Roles []string `json:"roles"`
}

type JesterKillsResponse struct {
	Feedback        string             `json:"feedback"`
	TotalJesterWins int                `json:"totalJesterWins"`
	Players         []JesterKillsEntry `json:"players"`
}

type JesterKillsEntry struct {
	Player string  `json:"player"`
	Kills  int     `json:"kills"`
	Rate   float64 `json:"rate"`
}
