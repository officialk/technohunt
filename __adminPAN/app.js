const server = "http://192.168.0.104/Techno/__adminPAN/admin.php?";
var count = 0;
window.onload = (e) => {
    M.AutoInit();
    M.Modal.init(document.querySelectorAll('.modal'), {});
    M.Sidenav.init(document.querySelectorAll('.sidenav'), {});
    createDynamicElement('teamList');
    createDynamicElement('questionList');
    createDynamicElement('answerList' + (++count), '$$');
}
const submitTeamList = () => {
    let names = ["teamName", "teamPassword"];
    let qs = server + "addTeams=true";
    getValuesByNames(["teamName"]).forEach(e => {
        if (e != "") {
            qs += escape(`&teamName[]=${e}`);
        }
    })
    getValuesByNames(["teamPassword"]).forEach(e => {
        if (e != "") {
            qs += escape(`&teamPassword[]=${e}`);
        }
    })
    console.log(qs);
    fetch(qs)
        .then(res => {
            getTeamList();
        })
}
const submitQuestionsList = () => {
    let req = server + escape('addQuestions=true&count=' + count);
    let titles = document.getElementsByName("questionTitle");
    let round = document.getElementsByName("questionRound");
    let content = document.getElementsByName("questionContent");
    for (let i = 1; i <= count; i++) {
        req += escape(`&title[]=${titles[i].value}`);
        req += escape(`&round[]=${round[i].value}`);
        req += escape(`&content[]=${content[i].value}`);
        let answers = document.getElementsByName("questionAnswer" + i);
        let isTrue = document.getElementsByName("questionisAnswer" + i);
        answers.forEach((e, j) => {
            req += escape(`&answer${i}[]=${answers[j].value}`);
            req += escape(`&isTrue${i}[]=${(isTrue[j].checked)?'true':'false'}`);
        })
    }
    console.log(req);
    fetch(req)
        .then(res => res.text())
        .then(res => {});
}
const getTeamList = () => {
    fetch(server + 'getTeams=true')
        .then(res => res.json())
        .then(res => {
            let html = '';
            res.teams.forEach((e, i) => {
                html += `<tr>`;
                html += `<td>${i}</td>`;
                html += `<td>${e.name}</td>`;
                html += `<td>${e.pass}</td>`;
                html += `<td>${e.players}</td>`;
                html += `<td>${e.points}</td>`;
                html += `<td>${e.round}</td>`;
                html += `<td><div class="btn-floating btn-small ${(e.stat)?"green":"red"}</td>`;
                html += `</tr>`;
            });
            document.getElementById("teamOutputDetails").innerHTML = html;
        })
}
const endRound = () => {
    let qs = server + "round=" + document.getElementById('roundCount').value;
    console.log(qs);
    fetch(qs)
        .then(res => res.text())
        .then(res => getTeamList());
}
