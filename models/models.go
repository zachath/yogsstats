package models
type Round struct {
	Id			string		`json:"id"`
	Date		string 		`json:"date"`
}
type TTTRound struct {
	Round
	Innocents	[]TTTPlayer `json:"innocents"`
	Traitors	[]TTTPlayer	`json:"traitors"`
	WinningTeam	string		`json:"winningTeam"`
}
type GTARound struct {
	Round
	Teams		[][]Player 	`json:"teams"`
	WinningTeam	[]Player	`json:"winningTeam"`
}
type Player struct {
	Name	string 	`json:"name"`
}
type TTTPlayer struct {
	Player
	Role	string	`json:"role"`
}