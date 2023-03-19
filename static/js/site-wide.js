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

export { fetchMetaData }