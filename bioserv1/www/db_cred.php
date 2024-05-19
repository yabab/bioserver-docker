<?php
    $config = parse_ini_file(__DIR__ . DIRECTORY_SEPARATOR . "config.ini");

    $serv = $config["host"];
    $datb = $config["database"];
    $user = $config["user"];
    $pass = $config["password"];
    
    $conn = mysqli_connect($serv, $user, $pass, $datb)
        or die ("connection error");

?>
