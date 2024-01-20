package models

type Video struct {
	Id         string `json:"id" db:"video_id"`
	Date       string `json:"date" db:"date"`
	Title      string `json:"title" db:"title"`
	IntroDeath bool   `json:"introDeath" db:"intro_death"`
}

type Player struct {
	Name                   string              `json:"name,omitempty" db:"name"`
	DetectiveWinPercentage WinPercentageStat   `json:"detectiveWinPercentage"`
	TeamWinPercentage      []WinPercentageStat `json:"teamWinPercentage"`
	RoleWinPercentage      []WinPercentageStat `json:"roleWinPercentage"`
	TraitorCombos          []WinPercentageStat `json:"traitorCombos"`
	JesterKills            int                 `json:"jesterKills"`
}

type WinPercentageStat struct {
	Percentage float64 `json:"percentage" db:"percentage"`
	Wins       int     `json:"wins" db:"wins"`
	Rounds     int     `json:"rounds" db:"total"`
	Team       string  `json:"team,omitempty"`
	Role       string  `json:"role,omitempty"`
	Buddy      string  `json:"buddy,omitempty" db:"buddy"`
}

type Role struct {
	RoleName      string   `json:"roleName" db:"role"`
	Detective     bool     `json:"detective" db:"is_detective"`
	PossibleTeams []string `json:"possibleTeams,omitempty"`
}

type Team struct {
	TeamName      string   `json:"teamName" db:"team"`
	CanWin        bool     `json:"canWin" db:"can_win"`
	Wins          int      `json:"wins"`
	PossibleRoles []string `json:"possibleRoles,omitempty"`
}

type RoundParticipation struct {
	Id     int    `json:"id" db:"id"`
	Player string `json:"player" db:"player"`
	Role   string `json:"role" db:"role"`
	Team   string `json:"team" db:"team"`
	Died   bool   `json:"died" db:"died"`
}

type Round struct {
	Id               int                  `json:"id" db:"id"`
	Video            Video                `json:"video"`
	Players          []RoundParticipation `json:"players,omitempty" db:"players"`
	WinningTeam      string               `json:"winningTeam" db:"winning_team"`
	Start            int                  `json:"start" db:"vid_start"`
	End              int                  `json:"end" db:"vid_end"`
	Length           int                  `json:"length"`
	JesterKiller     string               `json:"jesterKiller,omitempty" db:"jester_killer"`
	Guessed          string               `json:"guessed,omitempty" db:"guessed"`
	VindicatorKiller string               `json:"vindicatorKiller,omitempty" db:"vindicator_killer"`
}
