async function drawTeamWins() {
    google.charts.load('current', {'packages': ['corechart']}).then(
    async () => {
        console.log("Fetching team wins data")
                const response = await fetch("https://yogsstats.com/stats/ttt/teamWins", {
                method: 'GET',
                mode: 'cors',
            })

        const json = await response.json()

        var dataArray = [["Team", "Wins"]]
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

import { fetchMetaData } from "./site-wide.js";

window.onload = function() {
    fetchMetaData()
    drawTeamWins()
}