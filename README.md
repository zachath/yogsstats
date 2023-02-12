# yogsstats
### An API serving statistics related to Yogscast TTT videos

Data is manually entered for every round played, the players, their roles, teams and what team won, etc. This data is then queried upon using the following API endpoints:

`/stats/ttt/meta`: Returns meta information about the API, the amount of rounds tracked, the oldest and latest rounds added.

`/stats/ttt`: Returns rounds stored in the database. Valid query parameter: `id` to only return information about the specified round. The id of rounds follows the following format: `YYYYMMDDN`, with `YYYMMDD` being the date of the upload of the video containing the round, and `N` being the nth round in said video. The index starts at 0 so the id of the first round played on 2022-12-06 would be: `202212060`. 

`/stats/ttt/teamWins`: Returns the number rounds won of all the teams. Valid query parameter: `team` to only return the amount of wins of the specified team.

`/stats/ttt/playerWinPercentage:` Returns the win percentage and total rounds played of all the players. Valid optional query parameters: `player` to only return the win percentage of the specified player, `canon` a boolean value of `true` or `false`, if set to true the response will only include stats from "canon" rounds (default false).

`/stats/ttt/detectiveWinPercentage`: Returns the detective win percentage. Valid query parameter: `player` to only return the percentage of the specified player. `canon` - boolean, to only return statistics of 'canon' rounds.

`/stats/ttt/traitorCombos`: Returns every player tracked in the database, mapped to every player they have been "traitor buddies" with and what their win rate together has been. Valid query parameter: `player` to only return the percentages of the specified player.

`/stats/ttt/videos`: Returns videos in database.

Every endpoint, except `meta`, supports the following query parameters: `to` and `from` in the `YYYY-MM-DD` format which then only includes rounds within the specified date range. These are implicitly used if not explicitly defined, with the `to` date being set to the time of the request. Any endpoint which returns float values to indicate percentages have the optional parameter `round` which truncates the response, set to false by default.

All response data is in JSON format.

### This API is unoffical and unrelated to the Yogscast.

For any questions, send a dm to u/SgtTorran on reddit.<sup>*I have a tiny penis*<sup>
