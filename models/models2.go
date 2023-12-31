package models

type Video2 struct {
	Id         string `json:"id" db:"video_id"`
	Date       string `json:"date" db:"date"`
	Title      string `json:"title" db:"title"`
	IntroDeath bool   `json:"introDeath" db:"intro_death"`
}

type Player2 struct {
	Name                   string  `json:"name,omitempty" db:"name"`
	DetectiveWinPercentage float64 `json:"detectiveWinPercentage"`
	TeamWinPercentage      float64 `json:"teamWinPercentage"`
	RoleWinPercentage      float64 `json:"roleWinPercentage"`
	JesterKills            int     `json:"jesterKills"`
}

type Role2 struct {
	RoleName      string   `json:"roleName" db:"role"`
	Detective     bool     `json:"detective" db:"is_detective"`
	PossibleTeams []string `json:"possibleTeams,omitempty"`
}

type Team2 struct {
	TeamName      string   `json:"teamName" db:"team"`
	CanWin        bool     `json:"canWin" db:"can_win"`
	Wins          int      `json:"wins"`
	PossibleRoles []string `json:"possibleRoles,omitempty"`
}

type RoundParticipation struct {
	Id     int    `db:"id"`
	Player string `json:"player" db:"player"`
	Role   string `json:"role" db:"role"`
	Team   string `json:"team" db:"team"`
}

type Round2 struct {
	Id           string               `json:"id" db:"id"`
	Video        Video2               `json:"video"`
	Players      []RoundParticipation `json:"players,omitempty" db:"players"`
	WinningTeam  string               `json:"winningTeam" db:"winning_team"`
	Start        int                  `json:"start" db:"vid_start"`
	End          int                  `json:"end" db:"vid_end"`
	Length       int                  `json:"length"`
	JesterKiller Player2              `json:"jesterKiller,omitempty" db:"jester_killer"`
}
