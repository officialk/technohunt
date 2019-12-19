<?php
if(isset($_REQUEST["doWhat"])){
    $id = $_REQUEST["id"];
    $query = "select memberNames from teams where id=$id limit 1";
    $r = $conn->query($query);
    $html = "";
    while($res=$r->fetch_assoc()){
        if ($res["memberNames"] != "") {
            $html = '
                <div class="row container center">
                    <h3>Your Registration Is Complete Please Logout And Wait For The Next Round To Start</h3>
                    <button type="button" onclick="logout()" class="btn btn-large theme green"><i class="icon">exit_to_app</i></button>
                </div>
                ';
        } else {
            $html = '
                <div class="row container">
                    <div class="col s12 m3 l3"></div>
                    <div class="col s12 m6 l6 card">
                        <center>
                            <h3>Enter Member Names</h3>
                        </center>
                        <div class="input-field col s12 m12 l12">
                            <i class="icon prefix">face</i>
                            <input type="text" id="teamMem1">
                            <label for="teamMem1">Team Member1 Name</label>
                        </div>
                        <div class="input-field col s12 m12 l12">
                            <i class="icon prefix">face</i>
                            <input type="text" id="teamMem2">
                            <label for="teamMem2">Team Member2 Name</label>
                        </div>
                        <div class="input-field col s12 m12 l12">
                            <button type="button" class="btn theme" onclick="addMembers()">Add Names</button>
                        </div>
                    </div>
                    <div class="col s12 m3 l3"></div>
                </div>
            ';
        }
    }
    echo $html;
}
if(isset($_REQUEST["submit"])){
    $names = $_REQUEST['names'];
    $id = $_REQUEST['id'];
    $query = "update teams set memberNames='$names' where id=$id";
    $conn->query($query);
}
?>
