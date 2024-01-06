# yogsstats
### An API serving statistics related to Yogscast TTT videos

Frontend found at https://yogsstats.com

API found at https://api.yogsstats.com/

`/meta`: Returns meta information about the API, the amount of rounds tracked, the oldest and latest rounds added.
Returns the following schema:
```
{
  "roundCount": int,
  "oldestRound": {
    "id": string,
    "video": {
      "id": string,
      "date": "string,
      "title": string,
      "introDeath": false
    },
    "winningTeam": string,
    "start": int,
    "end": int,
    "length": int
  },
  "newestRound": {
    "id": string,
    "video": {
      "id": string,
      "date": "string,
      "title": string,
      "introDeath": false
    },
    "winningTeam": string,
    "start": int,
    "end": int,
    "length": int
  },
  "shortestRound": {
    "id": string,
    "video": {
      "id": string,
      "date": "string,
      "title": string,
      "introDeath": false
    },
    "winningTeam": string,
    "start": int,
    "end": int,
    "length": int
  },
  "longestRound": {
    "id": string,
    "video": {
      "id": string,
      "date": "string,
      "title": string,
      "introDeath": false
    },
    "winningTeam": string,
    "start": int,
    "end": int,
    "length": int
  }
}
```

`/rounds`: Returns rounds stored in the database. Optional bool query parameter `players` (default false): if to include the `players` field in response. 
Returns the following schema:
```
[
    {
        "id": int,
        "video": {
            "id": "string,
            "date": string,
            "title": string,
            "introDeath": bool
        },
        "players": [
            {
                "id": int,
                "player": string,
                "role": string,
                "team": string
            }
        ]
        "winningTeam": string,
        "start": int,
        "end": int,
        "length": int
    }
]
```

`/rounds/round`: Specific round. The id of rounds follows the following format: `YYYYMMDDN`, with `YYYMMDD` being the date of the upload of the video containing the round, and `N` being the nth round in said video. The index starts at 0 so the id of the first round played on 2022-12-06 would be: `202212060`.

`/videos`: Returns videos in database.
Returns the following schema:

```
[
    {
        "id": string,
        "date": string,
        "title": string,
        "introDeath": bool
    }
]
```
`/videos/{video}`: Specific video.

`/teams`: Returns teams in database.
Returns to following schema:
```
[
    {
        "teamName": string,
        "canWin": bool,
        "wins": int,
        "possibleRoles": [
            string
        ]
    }
]
```
`/teams/{team}`: Specific team.

`/roles`: Returns roles in database.
Returns the following schema:

```
[
    {
        "roleName": string,
        "detective": bool,
        "possibleTeams": [
            string
        ]
    }
]
```

`/roles/{role}`: Specific team.

`/players`: Returns players in database. 
Returns the following schema:

```
[
    {
        "name": string,
        "detectiveWinPercentage": {
            "percentage": float,
            "wins": int,
            "rounds": int
        },
        "teamWinPercentage": [
            {
            "percentage": float,
            "wins": int,
            "rounds": int,
            "team": string
            }
        ],
        "roleWinPercentage": [
            {
            "percentage": float,
            "wins": int,
            "rounds": int,
            "role": string
            }
        ],
        "traitorCombos": [
            {
            "percentage": float,
            "wins": int,
            "rounds": int,
            "buddy": string
            },
        ],
        "jesterKills": int
    }
]
```
`/players/{player}`: Specific player.

Every endpoint, except `meta & roles`, supports the following query parameters: `to` and `from` in the `YYYY-MM-DD` format which then only includes rounds within the specified date range. These are implicitly used if not explicitly defined, with the `to` date being set to the time of the request.

### This API is unofficial and unrelated to the Yogscast.

<sup>*I have a tiny penis*<sup>