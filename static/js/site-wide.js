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

function getDate() {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    return today
}

export { fetchMetaData, getDate }