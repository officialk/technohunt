<?php
//    error_reporting(0);
    $conn = new mysqli("localhost", "root","","technohunt");
    if(isset($_REQUEST['addTeams'])){
        $teamName = $_REQUEST['teamName'];
        $teamPassword = $_REQUEST['teamPassword'];
        for($i=0;$i<sizeof($teamName);$i++){
            $query = "insert into teams values(null,'$teamName[$i]',false,false,'','$teamPassword[$i]');";
            $conn->query($query);
        }
    }
    else if(isset($_REQUEST['addQuestions'])){
        $count = $_REQUEST['count'];
        $title = $_REQUEST['title'];
        $round = $_REQUEST['round'];
        $content = $_REQUEST['content'];
        for($i=0;$i<sizeof($count)+1;$i++){
            echo "<br>".$query = "insert into question values(null,'$title[$i]','$round[$i]','$content[$i]');";
            $res = $conn->query($query);
            $id = $conn->insert_id;
            $x=$i+1;
            $c = $_REQUEST["answer$x"];
            $t = $_REQUEST["isTrue$x"];
            for($j=0;$j<sizeof($c);$j++){
                echo "<br>".$query = "insert into options values(null,$id,'$c[$j]',$t[$j]);";
                $conn->query($query);
            }
        }
    }
    if(isset($_REQUEST['getTeams'])){
//        $query = "select * from teamList";
        $query = "select * from teamDet";
        $res = $conn->query($query);
        $ret = "";
        while($r=$res->fetch_assoc()){
            $ret .= json_encode($r).',';
        }
        $ret = rtrim($ret,',');
        echo '{"teams":['.$ret.']}';
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
                    $query = "update round set points=$points/(TIMESTAMPDIFF(minutes,startTime,endTime)*leftWindow) where round=1 and teamId=$id";
                    $conn->query($query);
                    $query = "select teamId from round where round=1 order by points ASC limit 50";
                    $conn->query("uodate teams set isAlive=false");
                    $res2 = $conn->query($query);
                    while($x = $res2->fetch_assoc()){
                        $xid = $x['id'];
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
                        $xid = $x['id'];
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
