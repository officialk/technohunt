const server = "http://192.168.0.104/Techno/__adminPAN/admin.php?";
var count = 0;
window.onload = (e) => {
    M.AutoInit();
    M.Modal.init(document.querySelectorAll('.modal'), {});
    M.Sidenav.init(document.querySelectorAll('.sidenav'), {});
    createDynamicElement('teamList');
    createDynamicElement('questionList');
    createDynamicElement('answerList' + (++count), '$$');
    createDynamicElement('answerList' + (count), '$$');
    createDynamicElement('answerList' + (count), '$$');
    createDynamicElement('answerList' + (count), '$$');
    getTeamList();
}
const submitTeamList = () => {
    let names = ["teamName", "teamPassword"];
    let qs = server + "addTeams=true";
    getValuesByNames(["teamName"]).forEach(x => {
        x.forEach(e => {
            if (e != "") {
                qs += `&teamName[]=${escape(e)}`;
            }
        })
    })
    getValuesByNames(["teamPassword"]).forEach(x => {
        x.forEach(e => {
            if (e != "") {
                qs += `&teamPassword[]=${escape(e)}`;
            }
        })
    })
    post(qs)
        .then(res => {
            getTeamList();
        })
}
const submitQuestionsList = () => {
    let req = server + 'addQuestions=true&count=' + count;
    let titles = document.getElementsByName("questionTitle");
    let round = document.getElementsByName("questionRound");
    let content = document.getElementsByName("questionContent");
    for (let i = 1; i < count + 1; i++) {
        req += `&title[]=${escape(titles[i].value)}`;
        req += `&round[]=${escape(round[i].value)}`;
        req += `&content[]=${escape(content[i].value)}`;
        getValuesByNames(["questionAnswer" + i]).forEach(x => {
            x.forEach((e, j) => {
                if (e != "") {
                    var t = document
                        .getElementsByName("questionisAnswer" + i)[j]
                        .checked ? 'true' : 'false';
                    req += `&answer${i}[]=${escape(e)}`;
                    req += `&isTrue${i}[]=${escape(t)}`;
                }
            })
        })
    }
    post(req)
        .then(res => res.text())
        .then(res => {});
}
const getTeamList = () => {
    post(server + 'getTeams=true')
        .then(res => res.json())
        .then(res => {
            let html = '';
            res.teams.forEach((e, i) => {
                html += `<tr>`;
                html += `<td>${i+1}</td>`;
                html += `<td>${e.name}</td>`;
                html += `<td>${e.pass}</td>`;
                html += `<td>${e.players||'-'}</td>`;
                html += `<td>${e.points||0}</td>`;
                html += `<td>${e.round||0}</td>`;
                html += `<td><div class="btn-floating btn-small ${(e.stat!=undefined && e.stat=='1')?'green':'red'}"><i class="icon">computer</i></td>`;
                html += `</tr>`;
            });
            document.getElementById("teamOutputDetails").innerHTML = html;
        })
}
const endRound = () => {
    let qs = server + "round=" + document.getElementById('roundCount').value;
    post(qs)
        .then(res => res.text())
        .then(res => getTeamList());
}
const post = req => {
    return fetch(req, {
        method: "post"
    })
}
