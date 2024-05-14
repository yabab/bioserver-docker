<?php
    $serv = getenv("DB_HOST");
    $datb = getenv("DB_DATABASE");
    $user = getenv("DB_USER");
    $pass = getenv("DB_PASSWORD");
    
    $conn = mysqli_connect($serv, $user, $pass, $datb)
        or die ("connection error");

?>
