async function playerWinPercentages(from, to) {
    google.charts.load('current', {'packages': ['table']}).then(
        async () => {
            console.log("Fetching player win percentage data")
            const response = await fetch("https://yogsstats.com/stats/ttt/playerWinPercentage?round=true&from="+from+"&to="+to, {
                method: 'GET',
                mode: 'cors',
            })

            const json = await response.json()
            var players = json['players']
            var players = new Map(Object.entries(players))

            console.log("Fetching teams")
            const teamsResponse = await fetch("https://yogsstats.com/stats/ttt/teams", {
                method: 'GET',
                mode: 'cors'
            })

            const jsonTeams = await teamsResponse.json()
            var teams = jsonTeams['teams']

            var dataTable = new google.visualization.DataTable()
            var teamsMap = new Map()
            for (let i = 2; i < teams.length+2; i++) {
                teamsMap.set(teams[i-2], i)
            }
            var cols = ['Player', 'Rounds Played']
            var cols = cols.concat(...[...teamsMap.keys()])
            for (var col of cols) {
                if (col == 'Player') {
                    dataTable.addColumn('string', col)
                } else {
                    dataTable.addColumn('number', col)
                }
            }

            for (let [name, entries] of players) {
                var roundsPlayed = entries.roundsPlayed
                var row = [name, roundsPlayed]

                for (let i = 0; i < teams.length; i++) {
                    row.push({v:-1, f:"∅"})
                }

                for (let [team, rate] of new Map(Object.entries(entries.teams))) {
                    row[teamsMap.get(team)] = {v: rate.percentage, f: (rate.percentage * 100).toFixed(1) + "% (" + rate.rounds + ")"}
                }

                dataTable.addRow(row)
            }

            var options = {
                height: '75%',
                width: '75%',
                showRowNumber: false,
                allowHtml: true,
                cssClassNames: {
                'headerRow': 'main-color-background',
                'tableRow': 'table-row',
                'selectedTableRow':'selected-row',
                'oddTableRow': 'odd'
                }
            }

            new google.visualization.Table(document.getElementById('info-display')).draw(dataTable, options)

            document.getElementById('info-description').innerText = "The win percentages of each player for every team they have played as (number of rounds played as that team), ∅ - never been that team."
        }
    )
}

import { fetchMetaData, getDate } from "./site-wide.js";

window.getDate = getDate;
window.playerWinPercentages = playerWinPercentages

window.onload = function() {
    var today = getDate()
    document.getElementById("to").setAttribute("value", today);
    fetchMetaData()
    playerWinPercentages("2022-10-23", today)
}