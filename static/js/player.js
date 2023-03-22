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

            var dataTable = new google.visualization.DataTable()
            var teams = new Map(Object.entries({'clown':2, 'elves':3, 'innocents':4, 'jester':5, 'traitors':6, 'zombies':7, 'lovers': 8, 'communists': 9}))
            var cols = ['Player', 'Rounds Played']
            var cols = cols.concat(...[...teams.keys()])
            for (var col of cols) {
                if (col == 'Player') {
                    dataTable.addColumn('string', col)
                } else {
                    dataTable.addColumn('number', col)
                }
            }

            for (let [name, entries] of players) {
                var roundsPlayed = entries.roundsPlayed
                var row = [name, roundsPlayed, {v:-1, f:"∅"}, {v:-1, f:"∅"}, {v:-1, f:"∅"}, {v:-1, f:"∅"}, {v:-1, f:"∅"}, {v:-1, f:"∅"}, {v:-1, f:"∅"}, {v:-1, f:"∅"}]

                for (let [team, rate] of new Map(Object.entries(entries.teams))) {
                    row[teams.get(team)] = {v: rate.percentage, f: (rate.percentage * 100).toFixed(1) + "% (" + rate.rounds + ")"}
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