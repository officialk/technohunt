const app = require("express")();
const sql = require("mysql");
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "technohunt"
});
app.listen(8080);
app.get("/addTeams", (req, res) => {
    let query = '';
    req.query.teamName.forEach((e, i) => {
        query += `insert into teams values(null,'${e}',0,true,'','${req.query.teamPassword[i]}')`;
    })
    con.query(query, (e, r) => {
        res.send("done");
    })
})
app.get("/addQuestions", (req, res) => {
    let count = req.query.count;
    for (let i = 1; i <= count; i++) {
        let title = req.query.title[i];
        let round = req.query.round[i];
        let content = req.query.content[i];

        var query = `insert into question values(null,'${title}','${round}','${content}')`;
        con.query(query, (e, r) => {
            var query = `select id from question where title='${title}' and round='${round}' and content='${content}'`
            con.query(query, (e, r) => {
                let id = r[0].id;
                let c = req.url.split("?")[1].split("&answer" + i);
                let t = req.url.split("?")[1].split("&isTrue" + i);
                var query = '';
                for (let x = 1; x < c.length - 1; x++) {
                    let con = c.split("=")[1];
                    let isT = t.split("=")[1];
                    query += `insert into options values(null,${id},'${con}','${isT}');`;
                }
                con.query(query, (e, r) => {
                    res.send("done");
                });
            })
        });
    }
})
app.get("/getTeams", (req, res) => {
    let query = `select * from teamList`;
    con.query(query, (e, r) => {
        res.json({
            teams: r
        })
    })
})
