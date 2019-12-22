const data = JSON.parse(localStorage.getItem("data")) || {};
window.onload = () => {
    M.AutoInit();
    M.updateTextFields();
    if (data.user != undefined) {
        login();
    }
}
window.addEventListener("blur", () => {
    LeftWindow();
});
const logout = () => {
    post("logout=true")
        .then(res => res.text())
        .then(res => {
            localStorage.setItem("data", "{}");
            window.location.reload();
        })
}
const post = query => {
    let qs = `http://192.168.0.104/Techno/server/app.php?${query}`;
    console.log(qs);
    return fetch(qs, {
        method: "post"
    });
}
const display = () => {
    if (data.dowhat == undefined || null) {
        post(`doWhat=true&id=${data.id}`)
            .then(res => res.text())
            .then(res => {
                data.dowhat = res;
                document.getElementById("main").innerHTML = res;
                localStorage.setItem("data", JSON.stringify(data));
            })
    } else {
        document.getElementById("main").innerHTML = data.dowhat;
    }
}
const login = () => {
    let name = data.user || document.getElementById("teamName").value;
    let pass = data.pass || document.getElementById("teamPass").value;
    post(`login=true&name=${name}&pass=${pass}`)
        .then(res => res.text())
        .then(res => {
            [id, error] = res.split("##");
            if (id != "error") {
                data.user = name;
                data.pass = pass;
                data.id = id;
                localStorage.setItem("data", JSON.stringify(data));
                display();
            } else {
                alert(error);
            }
        })
}
const LeftWindow = () => {
    post(`leftWindow=true&id=${data.id}`);
}
/*
    round based functions
*/
const addMembers = () => {
    let name1 = document.getElementById("teamMem1").value;
    let name2 = document.getElementById("teamMem2").value;
    post(`submit=true&names=${name1},${name2}&id=${data.id}`)
        .then(res => res.text())
        .then(res => {
            if (res == "error") {
                alert("Please Try Again");
            } else {
                alert("Your Registration Has Bee Completed Successfully Please Wait For the round to start");
                logout();
            }
        })
}
const submitRound1 = () => {
    let qs = `submit=true&tid=${data.id}`;
    document
        .getElementById("idsList")
        .value
        .split(",")
        .forEach(e => {
            if (e != "") {
                document.getElementsByName("ans" + e)
                    .forEach(x => {
                        if (x.checked == true) {
                            qs += `&ans[]=${x.value}&qId[]=${e}`;
                        }
                    })
            }
        })
    post(qs)
        .then(res => res.text())
        .then(res => {
            alert("Answers Submitted!");
            logout();
        });
}
const submitRound2 = () => {
    let ans = document.getElementById("ShipsPass").value;
    let qs = `submit=true&tid=${data.id}&ans=${ans}`;
    post(qs)
        .then(res => res.text())
        .then(res => {
            if (res == 'correct') {
                alert("Password Accepted!\nCaptain Marvel Entered The Ship");
                logout();
            } else {
                document.getElementById("passStatus").innerHTML = `${ans} is not accepted`;
                document.getElementById("ShipsPass").value = "";
            }
        })
}
const getHint = () => {
    data.hints = (data.hints == undefined) ? 0 : data.hints;
    if (data.hints < 3) {
        post(`getHint=true&num=${data.hints}&id=${data.id}`)
            .then(res => res.text())
            .then(res => {
                data.hints++;
                document.getElementById("hintsView").innerHTML += `<br>Hint ${data.hints}::${res}`;
            });
    } else {
        alert("All Hints Taken!!");
    }
}
