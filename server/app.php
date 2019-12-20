<?php
//    error_reporting(0);
    $conn = new mysqli("localhost", "root","","technohunt");
    if(isset($_REQUEST['login'])){
        $name = $_REQUEST['name'];
        $pass = $_REQUEST['pass'];
        $query = "select id,count(*) as count,isAlive,isLoggedIn from teams where teamName='$name' and password='$pass';";
        $res = $conn->query($query);
        while($x = $res->fetch_assoc()){
            $id = $x['id'];
            if($x['isLoggedIn']==true){
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
            echo $id
            $conn->query("update isLoggedIn=true where id=$id");
        }
    }
    if(isset($_REQUEST['logout'])){
        $id = $_REQUEST['id'];
        $conn->query("update isLoggedIn=false where id=$id");
    }
?>
<?php
//    changes every round
//    include_once("prebegin.php");
//    include_once("round1.php");
//    include_once("round2.php");
//    include_once("round3.php");
//    include_once("round4.php");
?>
