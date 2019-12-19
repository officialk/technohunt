<?php
if(isset($_REQUEST["doWhat"])){
    $id= $_REQUEST["id"];
    $query = "select count(*) as c,endTime from round where teamId=$id and round=1";
    $res = $conn->query($query);
    while($x = $res->fetch_assoc()){
        if($x['c']==0){
            $query = "insert into round values($id,1,sysdate(),'',0);";
            $conn->query($query);
        }
        if($x['endTime']!='0000-00-00 00:00:00'){
            $html = '
            <div class="row container center">
                <h3>Your Submission For Round 1 is Complete Please Logout And Wait For The Next Round To Start</h3>
                <button type="button" onclick="logout()" class="btn btn-large theme green"><i class="icon">exit_to_app</i></button>
            </div>
            ';
        }
        else{
            $query = "select id,title,content from question where round=1 order by RAND() limit 10";
            $res = $conn->query($query);
            $html = "<div class='row container center'>";
            $ids = '';
            while($r = $res->fetch_assoc()){
                    $title = $res["title"];
                    $content = $res["content"];
                    $id = $res["id"];
                    $ids.="$id,";
                    $html.="
                        <div class='card-panel col s12 m12 l12'>
                            <div class='card-title'>$title</div>
                            <div class='card-content'>$content<br>
                                ";
                                $query = "select id,content from options where questionId=$id";
                                $res1 = $conn->query($query);
                                while($x=$res1->fetch_assoc()){
                                    $optId = $x["id"];
                                    $optCon = $x["content"];
                                    $html+="
                                        <div class='input-field col s12 m6 l3'>
                                            <p>
                                                <label>
                                                    <input name='ans$id' type='radio' value='$optId' />
                                                    <span>$optCon</span>
                                                </label>
                                            </p>
                                        </div>";
                                }
                    $html.="
                            </div>
                            <div class='card-action'></div>
                        </div>";
            }
            $html.="</div><button type='button' onclick='submitRound1()' class='btn theme'>Submit</button><input type='hidden' value='$ids' id='idsList'";
        }
        echo $html;
    }
}
if(isset($_REQUEST["leftWindow"])){
    $id= $_REQUEST["id"];
    $query = "update round set leftWindow=leftWindow+1 where round=1 and teamId=$id";
}
if(isset($_REQUEST["submit"])){
    $tid = $_REQUEST['tid'];
    $ans = $_REQUEST['ans[]'];
    $qId = $_REQUEST['qId[]'];
    $query = "update round set endTime=sysdate() where teamId=$tid and round=1";
    $conn->query($query);
    for($i=0;$i<10;$i++){
        try{
            $query = "insert into answers values($tid,$ans[$i],$qId[$i])";
            $conn->query($query);
        }
        catch(exception $e){
            break;
        }
    }
}
?>
