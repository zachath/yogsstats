package models
type Round struct {
	Id			string	`json:"id" db:"id"`
	Date		string 	`json:"date" db:"date"`
	Title		string	`json:"title" db:"title"`
	Vid			string	`json:"vid" db:"id"`
	Start		int		`json:"start" db:"start"`
	End			int 	`json:"end" db:"end"`
}

type TTTRound struct {
	Round
	Players		[]TTTPlayer `json:"players" db:"players"`
	WinningTeam	string		`json:"winningTeam" db:"winning_team"`
	Randomat	string		`json:"randomat" db:"randomat"`
}

type Player struct {
	Name	string 	`json:"name" db:"name"`
}
type TTTPlayer struct {
	Player
	Role	string	`json:"role" db:"role"`
	Team	string 	`json:"team" db:"team"`
}