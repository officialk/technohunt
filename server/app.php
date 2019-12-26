<?php
//    error_reporting(0);
    function getIp(){
        if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
        {
          $ip=$_SERVER['HTTP_CLIENT_IP'];
        }
        elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
        {
          $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
        }
        else
        {
          $ip=$_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }
    $conn = new mysqli("localhost", "root","","technohunt");
    if(isset($_REQUEST['login'])){
        $name = $_REQUEST['name'];
        $pass = $_REQUEST['pass'];
        $query = "select id,count(*) as count,isAlive,isLoggedIn from teams where teamName='$name' and password='$pass';";
        $res = $conn->query($query);
        while($x = $res->fetch_assoc()){
            $id = $x['id'];
            $ip = getIp();
            if($x['isLoggedIn']!=$ip && $x['isLoggedIn']!='::1'){
                echo "error##Sorry Already Logged In";
                break;
            }
            if($x['isAlive']==false){
                echo "error##Sorry You Been Snapped Away";
                break;
            }
            if($x["count"]==0){
                echo "error##Director Fury Says YOU HAVE TO KEEP BOTH EYES OPEN";
                break;
            }
            $conn->query("update teams set isLoggedIn='$ip' where id=$id");
            echo $id;
        }
    }
    if(isset($_REQUEST['logout'])){
        $id = $_REQUEST['id'];
        $conn->query("update isLoggedIn='::1' where id=$id");
    }
?>
<?php
//    changes every round
//    include_once("prebegin.php");
//    include_once("round1.php");
//    include_once("round2.php");
?>
