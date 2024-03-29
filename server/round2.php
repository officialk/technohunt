<?php
/*
ROUND 2.1
    CLUE: The original betrayer. The one who defied the Supreme Intelligence and committed treason. The answer is in a popular digital interpretation format, used by the inhabitants of the target planet.
    HINT 1: The answer to the character is within the proposal. Read the document carefully.
    HINT 2: The answer is represented in an ASCII Format without spaces.
    HINT 3: <a href="images/ascii.png" target= "_blank">CLICK HERE</a>
    PASSWORD: 77971144586101108108
ROUND 2.2
    CLUE: The leader of Kree Starforce. The answer is in a popular digital interpretation format, used by the inhabitants of the target planet.
    HINT 1: The one tasked with controlling Vers by the Supreme Intelligence.  
    HINT 2: The answer is represented in an ASCII Format without spaces.
    HINT 3: <a href="images/ascii.png" target= "_blank">CLICK HERE</a>
    PASSWORD: 891111104582111103103 
ROUND 2.3
    CLUE: The one who is called as backup to eradicate Skrulls from Earth. The answer is in a popular digital interpretation format, used by the inhabitants of the target planet.
    HINT 1: This person is killed by the Guardians of the Galaxy.
    HINT 2: The answer is represented in an ASCII Format without spaces.
    HINT 3: <a href="images/ascii.png" target= "_blank">CLICK HERE</a>
    PASSWORD: 8211111097110 
*/
$hint='The original betrayer. The one who defied the Supreme Intelligence and committed treason. The answer is in a popular digital interpretation format, used by the inhabitants of the target planet.';
$clue=array(
    'The answer to the character is within the proposal. Read the document carefully.',
    'The answer is represented in an ASCII Format without spaces.',
    '<a href="images/ascii.png" target= "_blank">CLICK HERE</a>');
$password='77971144586101108108';
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
                        <br><div class="flow-text" id="hintsView"></div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-title center flow-text"><b>Password Hint</b></div>
                    <div class="card-content center flow-text">'.$hint.'<br>
                        <div class="input-field col s12 m12 l12">
                            <i class="icon prefix">lock</i>
                            <input type="password" id="ShipsPass">
                            <label for="ShipsPass">Enter the Password</label>
                        </div>
                        <div class="flow-text center red-text" id="passStatus"></div>
                    </div>
                    <div class="card-action center row">
                        <div class="col s6 l6 m6 center left">
                            <div class="btn left" onclick="getHint()">Get Hint</div>
                        </div>
                        <div class="col s6 l6 m6 center right">
                            <div class="btn" onclick="submitRound2();">Unlock</div>
                        </div>
                        <p class="left">You can use hints, but each hint costs negative points!</p>
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
    $num  = $_REQUEST['num'];
    $id  = $_REQUEST['id'];
    $query = "update round set leftWindow=leftWindow+10 where round=2 and teamId=$id and endTime='0000-00-00 00:00:00'";
    $conn->query($query);
    echo $clue[$num];
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
