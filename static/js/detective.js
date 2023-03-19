async function detectiveWinPercentages() {
    google.charts.load('current', {'packages': ['table']}).then(
        async () => {
            const response = await fetch("https://yogsstats.com/stats/ttt/detectiveWinPercentage?round=true", {
                method: 'GET',
                mode: 'cors',
            })

            const json = await response.json()
            var players = json['players']
            var players = new Map(Object.entries(players))

            var dataTable = new google.visualization.DataTable()
            dataTable.addColumn('string', 'Player')
            dataTable.addColumn('number', '%')
            dataTable.addColumn('number', "Rounds played")

            for (let [player, entry] of players) {
                var ratePercent = Math.round((entry.WinRate * 100) * 10) / 10
                dataTable.addRow([player, ratePercent, entry.RoundsPlayed])
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
            document.getElementById('info-description').innerText = "The detective win percentages of the players (including non-canon rounds)."
        }
    )
}

import { fetchMetaData } from "./site-wide.js";

window.onload = function() {
    fetchMetaData()
    detectiveWinPercentages()
}