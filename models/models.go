package models
type Round struct {
	Id			string	`json:"id" db:"id"`
	Date		string 	`json:"date" db:"date"`
	Title		string	`json:"title" db:"title"`
	Vid			string	`json:"vid" db:"id"`
	Start		int		`json:"start" db:"vid_start"`
	End			int 	`json:"end" db:"vid_end"`
}

type TTTRound struct {
	Round
	Players		[]TTTPlayer `json:"players" db:"players"`
	WinningTeam	string		`json:"winningTeam" db:"winning_team"`
	IntroDeath	string      `json:"introDeath" db:"intro_death"`
}

type Player struct {
	Name	string 	`json:"name" db:"name"`
}
type TTTPlayer struct {
	Player
	Role	string	`json:"role" db:"role"`
	Team	string 	`json:"team" db:"team"`
	Died	string	`json:"died" db:"died"`
}