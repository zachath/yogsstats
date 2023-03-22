async function detectiveWinPercentages(from, to) {
    google.charts.load('current', {'packages': ['table']}).then(
        async () => {
            const response = await fetch("https://yogsstats.com/stats/ttt/detectiveWinPercentage?round=true&from="+from+"&to="+to, {
                method: 'GET',
                mode: 'cors',
            })

            const json = await response.json()
            var players = json['players']
            var players = new Map(Object.entries(players))

            var dataTable = new google.visualization.DataTable()
            dataTable.addColumn('string', 'Player')
            dataTable.addColumn('number', '%')

            for (let [player, entry] of players) {
                dataTable.addRow([player, {v:entry.WinRate, f:(entry.WinRate * 100).toFixed(1) + "% (" + entry.RoundsPlayed + ")"}])
            }

            var options = {
                height: '50%',
                width: '50%',
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

import { fetchMetaData, getDate } from "./site-wide.js";

window.getDate = getDate;
window.detectiveWinPercentages = detectiveWinPercentages;

window.onload = function() {
    var today = getDate()
    document.getElementById("to").setAttribute("value", today);
    fetchMetaData()
    detectiveWinPercentages("2022-10-23", today)
}