<?php
//    error_reporting(0);
    $conn = new mysqli("localhost", "root","","technohunt");
    if(isset($_REQUEST['addTeams'])){
        $teamName = $_REQUEST['teamName'];
        $teamPassword = $_REQUEST['teamPassword'];
        for($i=0;$i<len($teamName);$i++){
            $query = "insert into teams values(null,'$teamName[$i]',false,'',$teamPassword[$i]')";
            $conn->query($query);
        }
    }
    if(isset($_REQUEST['addQuestions'])){
        $count = $_REQUEST['count'];
        $title = $_REQUEST['title'];
        $round = $_REQUEST['round'];
        $content = $_REQUEST['content'];
        $query = "insert into question values(null,'$title','$round','$content');";
        $res = $conn->query($query);
        $id = $conn->insert_id;
        for($i=1;$i<$count;$i++){
            $c = $_REQUEST["answer$i"];
            $t = $_REQUEST["isTrue$i"];
            $query = "insert into options values(null,$id,'$c','$t');";
            $conn->query($query);
            
        }
    }
    if(isset($_REQUEST['getTeams'])){
//        $query = "select * from teamList";
        $query = "select * from teamList";
        $res = $conn->query($query);
        echo "{teams:[";
        while($r=$res->fetch_assoc()){
            echo json_encode($r);
        }
        echo "]}";
    }
    if(isset($_REQUEST['endRound'])){
        $round = $_REQUEST["round"];
        $limit = 0;
        switch($round){
            case 1:
                $query = "select id from teams where isAlive==true order by id";
                $res = $conn->query($query);
                while($r=$res->fetch_assoc()){
                    $id = $r['id'];
                    $query = "select count(*) as c from round1Answers where team=$id";
                    $cnt = $conn->query($query);
                    $points = $cnt->fetch_assoc()["c"];
                    $query = "update round set points=$points/(TIMESTAMPDIFF(minutes,startTime,endTime)*leftWindow) where rouond=1 and teamId=$id";
                    $conn->query($query);
                    $query = "select teamId from round where round=1 order by points ASC limit 50";
                    $conn->query("uodate teams set isAlive=false");
                    $res2 = $conn->query($query);
                    while($x = $res2->fetch_assoc()){
                        $xid = $x['id']
                        $conn->query("uodate teams set isAlive=true where id=$xid");
                    }
                }
                break;
            case 2:
                $query = "select id from teams where isAlive==true order by id";
                $res = $conn->query($query);
                while($r=$res->fetch_assoc()){
                    $id = $r['id'];
                    $query = "update round set points=10000/(TIMESTAMPDIFF(minutes,startTime,endTime)*leftWindow) where rouond=2 and teamId=$id";
                    $conn->query($query);
                    $query = "select teamId from round where round=2 order by points ASC limit 8";
                    $res2 = $conn->query($query);
                    $conn->query("uodate teams set isAlive=false");
                    while($x = $res2->fetch_assoc()){
                        $xid = $x['id']
                        $conn->query("uodate teams set isAlive=true where id=$xid");
                    }
                }
                break;
        }
        $query = "select id from teams where isAlive==true order by id";
        $res = $conn->query($query);
        $ret = "{op:[";
        while($r=$res->fetch_assoc()){
            $ret.=json_encode($r);
        }
        $ret = "]}";
        echo $ret;
    }
?>