<?php

    session_start();

    //Elimina dati della sessione
    session_unset();

    //Redirect al login
    header("Location: login.php");
    die();

?>