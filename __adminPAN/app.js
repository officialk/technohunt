const server = "http://localhost/Techno/__adminPAN/admin.php?";
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
            qs += `&teamName[]=${e}`;
        }
    })
    getValuesByNames(["teamPassword"]).forEach(e => {
        if (e != "") {
            qs += `&teamPassword[]=${e}`;
        }
    })
    fetch(qs)
        .then(res => {
            getTeamList();
            M.Modal.close(document.querySelectorAll('#addTeam'));
        })
}
const submitQuestionsList = () => {
    let req = server + 'addQuestions=true&count=' + count;
    let titles = document.getElementsByName("questionTitle");
    let round = document.getElementsByName("questionRound");
    let content = document.getElementsByName("questionContent");
    for (let i = 1; i <= count; i++) {
        req += `&title[]=${titles[i].value}`;
        req += `&round[]=${round[i].value}`;
        req += `&content[]=${content[i].value}`;
        let answers = document.getElementsByName("questionAnswer" + i);
        let isTrue = document.getElementsByName("questionisAnswer" + i);
        answers.forEach((e, j) => {
            req += `&answer${i}[]=${answers[j].value}`;
            req += `&isTrue${i}[]=${(isTrue[j].checked)?'true':'false'}`;
        })
    }
    fetch(req)
        .then(res => M.Modal.close(document.querySelectorAll('#addQuestions')))
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
