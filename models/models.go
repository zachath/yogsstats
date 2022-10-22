package models
type Round struct {
	Id			string		`json:"id"`
	Date		string 		`json:"date"`
}
type TTTRound struct {
	Round
	Players		[]TTTPlayer `json:"players"`
	WinningTeam	string		`json:"winningTeam"`
}

type Player struct {
	Name	string 	`json:"name"`
}
type TTTPlayer struct {
	Player
	Role	string	`json:"role"`
	Team	string 	`json:"team"`
}