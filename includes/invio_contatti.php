<?php
require_once("includes/connection.php");

use DB\DB_A;

$html_page = file_get_contents("contatti.html");
$form_messages = '';
$allowed_tags = '<em><strong><h1><h2><h3><h4><h5><h6>';

function sanitize($input, $allowed_tags) {
    $input = strip_tags($input, $allowed_tags);
    $input = htmlentities($input, ENT_QUOTES, 'UTF-8');
    $input = stripslashes($input);
    $input = trim($input);
    return $input;
}

if (isset($_POST['submit'])) {
    $nome = sanitize($_POST['nome'], $allowed_tags);
    if(strlen($nome) == 0){
        $form_messages .= '<p>Il campo nome non può essere vuoto</p>';
    }
    else{
        if(!preg_match("/^[a-zA-Z]+$/",$nome)){
            $messaggiPerForm .= '<li>Il nome non può contenere numeri</li>';
        }
    }
    $cognome = sanitize($_POST['cognome'], $allowed_tags);
    if(strlen($cognome) == 0){
        $form_messages .= '<p>Il campo cognome non può essere vuoto</p>';
    }
    else{
        if(!preg_match("/^[a-zA-Z]+$/",$cognome)){
            $messaggiPerForm .= '<li>Il cognome non può contenere numeri</li>';
        }
    }
    
    $email = sanitize($_POST['email'], $allowed_tags);
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);
    if(strlen($email) == 0){
        $form_messages .= '<p>Il campo e-mail non può essere vuoto</p>';
    }
    else{
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $form_messages .= '<p>Il campo e-mail non è valido</p>';
        }
        if(!preg_match("/^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/",$email)){
            $form_messages .= '<p>Il campo e-mail non è stato inserito nel formato corretto</p>';
        }
    }
    $telefono = sanitize($_POST['telefono'], $allowed_tags);
    if(strlen($telefono) == 0){
        $form_messages .= '<p>Il campo telefono non può essere vuoto</p>';
    }
    else{
        if(!preg_match("/^[0-9]+$/",$telefono)){
            $form_messages .= '<p>Il campo telefono non può contenere lettere</p>';
        }
    }

    $messaggio = sanitize($_POST['messaggio'], $allowed_tags);
    if(strlen($messaggio) == 0){
        $form_messages .= '<p>Il campo messaggio non può essere vuoto</p>';
    }
    else{
        if(!preg_match("/^[a-zA-Z]+$/",$messaggio)){
            $form_messages .= '<p>Il campo messaggio non può contenere numeri</p>';
        }
    }

    // Se non ci sono errori, si inviano i dati correttamente
    if(strlen($form_messages) == 0){
        $db = new DB_A();
        $db->open_connection();
        $query = "INSERT INTO contatti (nome, cognome, email, telefono, messaggio) VALUES ('$nome', '$cognome', '$email', '$telefono', '$messaggio')";
        $result = mysqli_query($connection, $query);
        $db->close_connection();
    }

    if($result){
        $form_messages .= '<p>Il messaggio è stato inviato correttamente</p>';
    }
    else{
        $form_messages .= '<p>Abbiamo un problema con l\'invio; riprova più tardi</p>';
    }
}
?>