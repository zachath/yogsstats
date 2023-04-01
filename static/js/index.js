async function drawTeamWins(from, to) {
    google.charts.load('current', {'packages': ['corechart']}).then(
    async () => {
        console.log("Fetching team wins data")
                const response = await fetch("https://yogsstats.com/stats/ttt/teamWins?from="+from+"&to="+to, {
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
        colors: ['pink', '#8b0000', 'brown', 'green', 'purple', '#FF69B4', 'red', 'black'],
        legend: 'none',
        pieSliceText: 'label'
    };

    var chart = new google.visualization.PieChart(document.getElementById('info-display'));
    chart.draw(data, options);

    document.getElementById('info-description').innerText = "Percentages of rounds won by each team."
    }
)
}

window.drawTeamWins = drawTeamWins;

import { fetchMetaData, getDate } from "./site-wide.js";

window.getDate = getDate;

window.onload = function() {
    fetchMetaData()
    var today = getDate()
    document.getElementById("to").setAttribute("value", today);
    drawTeamWins("2022-10-23", today)
}