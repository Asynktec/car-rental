<?php

    $dbname = "icuudqqc_zeus";
    $dns = "mySql:host=localhost;dbname=$dbname";

    $user =  "icuudqqc_user_t";
    $passwd = "EngKevito1995"

    try {
        $db = new PDO($dns, $user, $passwd);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
?>