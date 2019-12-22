<?php
/*
ROUND 2.1
    CLUE: The original betrayer. The one who defied the Supreme Intelligence and committed treason. The answer is in a popular digital interpretation format, used by the inhabitants of the target planet.
    HINT 1: The answer to the character is within the proposal. Read the document carefully.
    HINT 2: The answer is represented in an ASCII Format.
    HINT 3: <a href=" " target= "_blank"><img src="../images/ascii.png"></a>
    PASSWORD: 7765824586697676 (MAR-VELL), 779711445118101108108 (Mar-vell), 1099711445118101108108 (mar-vell), 10997114118101108108 (marvell), 7797114118101108108 (Marvell), 77658286697676 (MARVELL) 
ROUND 2.2
    CLUE:
    HINT:
    PASSWORD:
ROUND 2.3
    CLUE:
    HINT:
    PASSWORD:
ROUND 2.4
    CLUE:
    HINT:
    PASSWORD:
*/
$hint='';
$clue=array('','','');
$password='';
if(isset($_REQUEST["doWhat"])){
    $id= $_REQUEST["id"];
    $query = "select count(*) as c,endTime from round where teamId=$id and round=2";
    $res = $conn->query($query);
    while($x = $res->fetch_assoc()){
        if($x['c']==0){
            $query = "insert into round values($id,2,0,sysdate(),'',0);";
            $conn->query($query);
            $html = '
                <br>
                <div class="card-panel">
                <div class="card-title center flow-text"><b>Password Break</b></div>
                    <div class="card-content">
                        <p class="flow-text">Talos, the Skrull Commander has approached Captain Marvel and explained that Skrulls are just refugees looking for a new home, and they need help to ensure the captured Skrulls escape from their ship. But the ship’s hatches have been locked! Help Captain Marvel, to decode the password of the ship’s 8 hatches holding Skrulls prisoners while she tries to keep the kree at bay.</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-title center flow-text"><b>Password Hint</b><div class="btn" onclick="getHint()">Get Hint</div></div>
                    <div class="card-content center flow-text">'.$hint.'<br>
                        <div class="input-field col s12 m12 l12">
                            <i class="icon prefix">lock</i>
                            <input type="password" id="ShipsPass">
                            <label for="ShipsPass">Enter the Password</label>
                        </div>
                        <div class="flow-text center red-text" id="passStatus"></div>
                    </div>
                    <div class="card-action center">
                        <div class="btn theme" onclick="submitRound2();">Unlock</div>
                    </div>
                </div>
            ';
            echo $html;
        }
        if($x['endTime']!='0000-00-00 00:00:00' and $x['c']==1){
            $html = '
            <div class="row container center">
                <h3>Your Submission For Round 2 is Complete Please Logout And Wait For The Next Round To Start</h3>
                <button type="button" onclick="logout()" class="btn btn-large theme green"><i class="icon">exit_to_app</i></button>
            </div>
            ';
            echo $html;
        }
    }
}
if(isset($_REQUEST["getHint"])){

}
if(isset($_REQUEST["submit"])){
    $tid = $_REQUEST['tid'];
    $ans = $_REQUEST['ans'];
    if($ans==$password){
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
