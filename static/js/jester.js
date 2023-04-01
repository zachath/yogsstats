async function jesterKills(from, to) {
    google.charts.load('current', {'packages': ['corechart']}).then(
    async () => {
        console.log("Fetching team wins data")
                const response = await fetch("https://yogsstats.com/stats/ttt/jesterKills?from="+from+"&to="+to, {
                method: 'GET',
                mode: 'cors',
            })

        const json = await response.json()

        var dataArray = [["Player", "Kills"]]
        for (var key in json['players']) {
            dataArray.push([key, json['players'][key]["kills"]])
        }

        var data = google.visualization.arrayToDataTable(dataArray);

        var options = {
        title: 'Jester kills by player',
        titleTextStyle: {
            color: "white"
        },
        backgroundColor: "#1c2833",
        legend: {
            textStyle: {
                color: 'white'
            }
        }
    };

    var chart = new google.visualization.PieChart(document.getElementById('info-display'));
    chart.draw(data, options);

    document.getElementById('info-description').innerText = "Jester kills by player"
    }
)
}

window.jesterKills = jesterKills;

import { fetchMetaData, getDate } from "./site-wide.js";

window.getDate = getDate;

window.onload = function() {
    fetchMetaData()
    var today = getDate()
    document.getElementById("to").setAttribute("value", today);
    jesterKills("2022-10-23", today)
}