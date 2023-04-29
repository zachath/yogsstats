var player_id = 0
var default_text_value = "Not Set"

function remove(ev) {
    var button = ev.target;
    var div = button.parentElement;

    var id = button.getAttribute('to_remove')
    
    var name = document.getElementById('player_name' + id)
    var nameL = document.getElementById('player_name_label' + id)
    var role = document.getElementById('player_role' + id)
    var roleL = document.getElementById('player_role_label' + id)
    var team = document.getElementById('player_team' + id)
    var teamL = document.getElementById('player_team_label' + id)
    var died = document.getElementById('player_died' + id)
    var diedL = document.getElementById('player_died_label' + id)

    div.removeChild(name)
    div.removeChild(role)
    div.removeChild(team)
    div.removeChild(died)
    div.removeChild(nameL)
    div.removeChild(roleL)
    div.removeChild(teamL)
    div.removeChild(diedL)
    div.removeChild(button)
    div.remove()
    
    const index = players.indexOf(div)
    if (index > -1) {
        players.splice(index, 1)
    }
    console.log(players)
}

var players = []
function add() {
    var div = document.createElement('div')
    player_id++;

    var nameLabel = document.createElement('label')
    nameLabel.innerHTML = "Name: "
    nameLabel.setAttribute('id', 'player_name_label' + player_id);
    var name = document.createElement('input');
    name.type = "text";
    name.setAttribute('id', 'player_name' + player_id);

    var roleLabel = document.createElement('label')
    roleLabel.innerHTML = "Role: "
    roleLabel.setAttribute('id', 'player_role_label' + player_id);
    var role = document.createElement('select');
    role.setAttribute('id', 'player_role' + player_id);
    for (var idx in roles) {
        var opt = document.createElement('option')
        opt.value = roles[idx]
        opt.innerHTML = roles[idx]
        role.appendChild(opt)
    }
    var opt = document.createElement('option')
    opt.value = default_text_value
    opt.innerHTML = default_text_value
    opt.selected = true
    opt.disabled = true
    opt.hidden = true
    role.appendChild(opt)

    var teamLabel = document.createElement('label')
    teamLabel.innerHTML = "Team: "
    teamLabel.setAttribute('id', 'player_team_label' + player_id);
    var team = document.createElement('select');
    team.setAttribute('id', 'player_team' + player_id);
    for (var idx in teams) {
        var opt = document.createElement('option')
        opt.value = teams[idx]
        opt.innerHTML = teams[idx]
        team.appendChild(opt)
    }
    var opt = document.createElement('option')
    opt.value = default_text_value
    opt.innerHTML = default_text_value
    opt.selected = true
    opt.disabled = true
    opt.hidden = true
    team.appendChild(opt)

    var diedLabel = document.createElement('label')
    diedLabel.innerHTML = "Died: "
    diedLabel.setAttribute('id', 'player_died_label' + player_id);
    var died = document.createElement('input');
    died.type = "checkbox";
    died.setAttribute('id', 'player_died' + player_id);

    var player_list = document.getElementById("player_list");

    var removeButton = document.createElement('button');
    removeButton.setAttribute('id', 'player_remove' + player_id);
    removeButton.setAttribute('to_remove', player_id);
    removeButton.onclick = function(e) {
        remove(e)
    };
    removeButton.setAttribute("type", "button");
    removeButton.innerHTML = "Remove";

    div.appendChild(nameLabel);
    div.appendChild(name);

    div.appendChild(roleLabel);
    div.appendChild(role);

    div.appendChild(teamLabel);
    div.appendChild(team);

    div.appendChild(diedLabel);
    div.appendChild(died);

    div.appendChild(removeButton);

    player_list.appendChild(div)
    players.push(div)
}

function clearRound() {
    for (const div of players) {
        for (const child of div.children) {
            if (child.type != "text") {
                let value = child.value
                if (typeof value !== "undefined") {
                    if (value == "on") {
                        child.checked = false
                    } else {
                        child.value = default_text_value
                    }
                }
            }
        }
    }

    document.getElementById("start").value = ""
    document.getElementById("end").value = ""
    document.getElementById("winning-team").value = default_text_value
    document.getElementById("jester-killer").value = ""
}

var teams = []

async function getTeams() {
    var winSelect = document.getElementById('winning-team')
    let response = await fetch("https://yogsstats.com/stats/ttt/teams")
    let json = await response.json()
    for (var idx in json['teams']) {
        var team = json['teams'][idx]
        teams.push(team)
    }
    teams.push("none")
    teams.sort()

    for (var idx in teams) {
        team = teams[idx]
        var opt = document.createElement('option')
        opt.value = team
        opt.innerHTML = team
        winSelect.appendChild(opt)
    }
    
    var opt = document.createElement('option')
    opt.value = default_text_value
    opt.innerHTML = default_text_value
    opt.selected = true
    opt.disabled = true
    opt.hidden = true
    winSelect.appendChild(opt)
}

var roles = []
async function getRoles() {
    let response = await fetch("https://yogsstats.com/stats/ttt/roles")
    let json = await response.json()
    for (var idx in json['roles']) {
        var role = json['roles'][idx]
        roles.push(role)
    }

    roles.sort()
}

async function postVideo() {
    let data = {
        title: document.getElementById('title').value,
        date: document.getElementById('date').value,
        vid: document.getElementById('vid').value,
        introDeath: document.getElementById('intro-death').checked.toString()
    }

    fetch("https://yogsstats.com/stats/ttt/videos", {
        method: "POST",
        mode: "cors",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Basic " + btoa(":" + document.getElementById('auth').value),
        },
        body: JSON.stringify(data)
    }).then(response => {
       document.getElementById('video-status').innerHTML = "Status: " + response.status;
    })
}

async function postRound() {
    let data = {
        id: document.getElementById("id").value,
        date: document.getElementById("date").value,
        vid: document.getElementById("vid").value,
        start: Number(document.getElementById("start").value),
        end: Number(document.getElementById("end").value),
        winningTeam: document.getElementById("winning-team").value,
        jesterKiller: document.getElementById("jester-killer").value,
        players: []
    }

    for (const div of players) {
        let values = []
        for (const child of div.children) {
            let value = child.value
            if (typeof value !== "undefined") {
                if (value == "on") {
                    if (child.checked) {
                        values.push("yes")
                    } else {
                        values.push("no")
                    }
                } else {
                    values.push(value)
                }
            }
        }

        if (values.length > 0) {
            data.players.push({
                "name": values[0],
                "role": values[1],
                "team": values[2],
                "died": values[3]
            })
        }
    }

    fetch("https://yogsstats.com/stats/ttt", {
        method: "POST",
        mode: "cors",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Basic " + btoa(":" + document.getElementById('auth').value),
        },
        body: JSON.stringify(data)
    }).then(response => {
       document.getElementById('round-status').innerHTML = "Status: " + response.status;
    })
}

import { getDate } from "./site-wide.js";

window.getDate = getDate;
window.add = add;
window.remove = remove;
window.clearRound = clearRound;
window.postVideo = postVideo;
window.postRound = postRound;

window.onload = function() {
    var today = getDate()
    document.getElementById("date").setAttribute("value", today);
    getTeams()
    getRoles()
}