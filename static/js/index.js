async function drawTeamWins() {
    google.charts.load('current', {'packages': ['corechart']}).then(
    async () => {
        console.log("Fetching team wins data")
                const response = await fetch("https://yogsstats.com/stats/ttt/teamWins", {
                method: 'GET',
                mode: 'cors',
            })

        const json = await response.json()

        dataArray = [["Team", "Wins"]]
        for (var key in json['teams']) {
            dataArray.push([key, json['teams'][key]])
        }

        var data = google.visualization.arrayToDataTable(dataArray);

        var options = {
        title: 'Wins by teams',
        titleTextStyle: {
            color: "white"
        },
        backgroundColor: "#1c2833",
        colors: ['pink', 'brown', 'green', 'purple', 'red', 'black'],
        legend: {
            textStyle: {
                color: 'white'
            }
        }
    };

    var chart = new google.visualization.PieChart(document.getElementById('info-display'));
    chart.draw(data, options);

    document.getElementById('info-description').innerText = "Percentages of rounds won by each team."
    }
)
}

async function detectiveWinPercentages() {
    google.charts.load('current', {'packages': ['table']}).then(
        async () => {
            const response = await fetch("https://yogsstats.com/stats/ttt/detectiveWinPercentage?round=true", {
                method: 'GET',
                mode: 'cors',
            })

            const json = await response.json()
            players = json['players']
            players = new Map(Object.entries(players))

            var dataTable = new google.visualization.DataTable()
            dataTable.addColumn('string', 'Player')
            dataTable.addColumn('number', '%')
            dataTable.addColumn('number', "Rounds played")

            for (let [player, entry] of players) {
                ratePercent = Math.round((entry.WinRate * 100) * 10) / 10
                dataTable.addRow([player, ratePercent, entry.RoundsPlayed])
            }

            options = {
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

async function playerWinPercentages() {
    google.charts.load('current', {'packages': ['table']}).then(
        async () => {
            console.log("Fetching player win percentage data")
            const response = await fetch("https://yogsstats.com/stats/ttt/playerWinPercentage?round=true", {
                method: 'GET',
                mode: 'cors',
            })

            const json = await response.json()
            players = json['players']
            players = new Map(Object.entries(players))

            var dataTable = new google.visualization.DataTable()
            teams = new Map(Object.entries({'clown':2, 'elves':3, 'innocents':4, 'jester':5, 'traitors':6, 'zombies':7}))
            cols = ['Player', 'Rounds Played']
            cols = cols.concat(...[...teams.keys()])
            for (col of cols) {
                if (col == 'Player') {
                    dataTable.addColumn('string', col)
                } else {
                    dataTable.addColumn('number', col)
                }
            }

            for (let [name, entries] of players) {
                roundsPlayed = entries.roundsPlayed
                row = [name, roundsPlayed, -1, -1, -1, -1, -1, -1]

                for (let [team, rate] of new Map(Object.entries(entries.teams))) {
                    ratePercent = Math.round((rate.percentage * 100) *10) / 10
                    row[teams.get(team)] = ratePercent
                }

                dataTable.addRow(row)
            }

            options = {
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

            document.getElementById('info-description').innerText = "The win percentages of each player for every team they have played as (-1 => not played as that team)."
        }
    )
}

async function traitorCombos() {
    google.charts.load('current', {'packages': ['table']}).then(
        async () => {
            console.log("Fetching traitor combo data")
            const response = await fetch("https://yogsstats.com/stats/ttt/traitorCombos?round=true", {
                method: 'GET',
                mode: 'cors',
            })

            const json = await response.json()
            combos = json['combos']
            combos = new Map(Object.entries(combos))

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
                row = [player]
                for (let i = 0; i < combos.size; i++) {
                    row.push(-1)
                }
                for (let [other, entry] of new Map(Object.entries(entries))) {
                    row[playerColIndex.get(other)] = entry.WinRate
                }
                dataTable.addRow(row)
            }

            options = {
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

async function fetchMetaData() {
    console.log("Fetching API meta data")
        const response = await fetch("https://yogsstats.com/stats/ttt/meta", {
        method: 'GET',
        mode: 'cors',
    })

    const json = await response.json()
    
    const roundCount = json['roundCount']
    const oldestDate = json['oldestRound']['date']
    const newestDate = json['newestRound']['date']

    document.getElementById("meta-info").innerText = `Total rounds tracked by API: ${roundCount}, oldest round added on ${oldestDate} & newest round added on ${newestDate}.`;
}

window.onload = function() {
    fetchMetaData()
    console.log("WINDOW ONLOAD!!!")
    drawTeamWins()
}