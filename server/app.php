<?php
//    error_reporting(0);
    $conn = new mysqli("localhost", "root","","technohunt");
    if(isset($_REQUEST['login'])){
        $name = $_REQUEST['name'];
        $pass = $_REQUEST['pass'];
        $query = "select id,count(*) as count from teams where teamName='$name' and password='$pass';";
        $res = $conn->query($query);
        while($x = $res->fetch_assoc()){
            echo json_encode($x);
        }
    }
?>
<?php
//    changes every round
//    include_once("prebegin.php");
    include_once("round1.php");
//    include_once("round2.php");
//    include_once("round3.php");
//    include_once("round4.php");
?>
