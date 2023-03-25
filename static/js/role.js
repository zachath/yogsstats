async function roleWin(from, to) {
    google.charts.load('current', {'packages': ['table']}).then(
        async () => {
            console.log("Fetching role win percentage data")
            const response = await fetch("https://yogscast.com/stats/ttt/roleWinPercentage?round=true&from="+from+"&to="+to, {
                method: 'GET',
                mode: 'cors',
            })

            const json = await response.json()
            var players = json['players']
            var players = new Map(Object.entries(players))

            console.log("Fetching roles")
            const rolesResponse = await fetch("https://yogscast.com/stats/ttt/roles", {
                method: 'GET',
                mode: 'cors'
            })

            const jsonRoles = await rolesResponse.json()
            var roles = jsonRoles['roles']

            roles.splice(roles.indexOf('drunk'), 1)
            roles.splice(roles.indexOf('swapper'), 1)
            roles.splice(roles.indexOf('loot goblin'), 1)

            var dataTable = new google.visualization.DataTable()
            var rolesMap = new Map()
            for (let i = 1; i < roles.length+1; i++) {
                rolesMap.set(roles[i-1], i)
            }
            var cols = ['Player']
            var cols = cols.concat(...[...rolesMap.keys()])
            for (var col of cols) {
                if (col == 'Player') {
                    dataTable.addColumn('string', col)
                } else {
                    dataTable.addColumn('number', col)
                }
            }

            for (let [name, entries] of players) {
                var row = [name]

                for (let i = 0; i < roles.length; i++) {
                    row.push({v:-1, f:"∅"})
                }

                for (let [role, rate] of new Map(Object.entries(entries.roles))) {
                    row[rolesMap.get(role)] = {v: rate.percentage, f: (rate.percentage * 100).toFixed(1) + "% (" + rate.rounds + ")"}
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

            document.getElementById('info-description').innerText = "The win percentages of each player for every role they have played as (number of rounds played as that role), ∅ - never been that role."
        }
    )
}

import { fetchMetaData, getDate } from "./site-wide.js";

window.getDate = getDate;
window.roleWin = roleWin

window.onload = function() {
    var today = getDate()
    document.getElementById("to").setAttribute("value", today);
    fetchMetaData()
    roleWin("2022-10-23", today)
}