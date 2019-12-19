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
const login = () => {
    let name = data.user || document.getElementById("teamName").value;
    let pass = data.pass || document.getElementById("teamPass").value;
    post(`login=true&name=${name}&pass=${pass}`)
        .then(res => res.text())
        .then(res => {
            console.log(res)
            res = JSON.parse(res);
            if (res.id != null || res.count != 0) {
                data.user = name;
                data.pass = pass;
                data.id = res.id;
                localStorage.setItem("data", JSON.stringify(data));
                display();
            } else {
                alert("Invalid Username/Password");
            }
        })
}
const LeftWindow = () => {
    post(`leftWindow=true&id=${data.id}`);
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
const logout = () => {
    localStorage.setItem("data", "{}");
    window.location.reload();
}
