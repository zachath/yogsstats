async function traitorCombos() {
    google.charts.load('current', {'packages': ['table']}).then(
        async () => {
            console.log("Fetching traitor combo data")
            const response = await fetch("https://yogsstats.com/stats/ttt/traitorCombos?round=true", {
                method: 'GET',
                mode: 'cors',
            })

            const json = await response.json()
            var combos = json['combos']
            var combos = new Map(Object.entries(combos))

            var dataTable = new google.visualization.DataTable()

            dataTable.addColumn('string', 'Player')
            let i = 1
            let playerColIndex = new Map()
            for (let [player, _] of combos) {
                dataTable.addColumn('number', player)
                playerColIndex.set(player, i)
                i++
            }

            for (let [player, entries] of combos) {
                var row = [player]
                for (let i = 0; i < combos.size; i++) {
                    row.push(-1)
                }
                for (let [other, entry] of new Map(Object.entries(entries))) {
                    row[playerColIndex.get(other)] = entry.WinRate
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

            document.getElementById('info-description').innerText = "The win rate of traitor combinations (-1 => They have not been traitor buddies)"
        }
    )
}

import { fetchMetaData } from "./site-wide.js";

window.onload = function() {
    fetchMetaData()
    traitorCombos()
}