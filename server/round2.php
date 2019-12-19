<!--
CHANGE THE PASSWORD IN ROUND2.PHP
CHANGE THE CLUE TO BE GIVEN IN ROUND2.PHP
-->

<?php
if(isset($_REQUEST["doWhat"])){
    $id= $_REQUEST["id"];
    $query = "select count(*) as c,endTime from round where teamId=$id and round=2";
    $res = $conn->query($query);
    while($x = $res->fetch_assoc()){
        if($x['c']==0){
            $query = "insert into round values($id,2,sysdate(),'',0);";
            $conn->query($query);
        }
        if($x['endTime']!='0000-00-00 00:00:00'){
            $html = '
            <div class="row container center">
                <h3>Your Submission For Round 2 is Complete Please Logout And Wait For The Next Round To Start</h3>
                <button type="button" onclick="logout()" class="btn btn-large theme green"><i class="icon">exit_to_app</i></button>
            </div>
            ';
        }
        else{
            $html = '
                <br>
                <div class="card-panel">
                    <div class="card-title"><b>Password Hint</b></div>
                    <div class="card-content">TO BE CHANGED</div>
                </div>
                <div class="card">
                    <div class="card-title"><b>Password Break</b></div>
                    <div class="card-content">
                        <p class="flow-text">Talos, the Skrull Commander has approached Captain Marvel and explained that Skrulls are just refugees looking for a new home, and they need help to ensure the captured Skrulls escape from their ship. But the ship’s hatches have been locked! Help Captain Marvel, to decode the password of the ship’s 8 hatches holding Skrulls prisoners while she tries to keep the kree at bay.</p>
                        <div class="input-field col s12 m12 l12">
                            <i class="icon prefix">lock</i>
                            <input type="text" id="ShipsPass">
                            <label for="ShipsPass">Enter the Password</label>
                        </div>
                        <div class="flow-text center red-text" id="passStatus"></div>
                    </div>
                    <div class="card-action center">
                        <div class="btn theme" onclick="submitRound2();">Unlock</div>
                    </div>
                </div>
            ';
        }
        echo $html;
    }
}
if(isset($_REQUEST["submit"])){
    $tid = $_REQUEST['tid'];
    $ans = $_REQUEST['ans'];
    if($ans=="ANSWER"){
        echo "correct";
        $query = "update round set endTime=sysdate() where teamId=$tid and round=2";
        $conn->query($query);
    }
    else{
        echo "incorrect";
        $query = "update round set leftWindow=leftWindow+1 where teamId=$tid and round=2";
        $conn->query($query);
    }
}
?>
