<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $contatti = file_get_contents('layouts/contatti.html');

    $pageID = 'contattaci';
    $title = "Contatti - Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="/" lang="en">Home</a> > Contatti</p>';

    $content = "";

    //Validazione form
    $form_messages = '';
    $allowed_tags = '<em><strong><h1><h2><h3><h4><h5><h6>';
    $result = true;

    $nome      = "";
    $telefono  = "";
    $email     = "";
    $messaggio = "";

    if($_SERVER["REQUEST_METHOD"] == "POST"){

        //Controllo Nome
        $nome = sanitize($_POST['nome'], $allowed_tags);
        if(strlen($nome) == 0){
            $form_messages .= '<p>Il campo nome non può essere vuoto</p>';
        }else{
            if(preg_match("/\d/",$nome)){
                $form_messages .= '<li>Il nome non può contenere numeri</li>';
            }
        }
        
        //Controllo Telefono
        $telefono = sanitize($_POST['telefono'], $allowed_tags);
        if(strlen($telefono) == 0){
            $form_messages .= '<p>Il campo telefono non può essere vuoto</p>';
        }else{
            if(!preg_match("/^[0-9]+$/",$telefono)){
                $form_messages .= '<p>Il campo telefono non può contenere lettere</p>';
            }
        }


        //Controllo Email
        $email = sanitize($_POST['email'], $allowed_tags);
        $email = filter_var($email, FILTER_SANITIZE_EMAIL);
        if(strlen($email) == 0){
            $form_messages .= '<p>Il campo e-mail non può essere vuoto</p>';
        }else{
            if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                $form_messages .= '<p>Il campo e-mail non è valido</p>';
            }
            if(!preg_match("/^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/",$email)){
                $form_messages .= '<p>Il campo e-mail non è stato inserito nel formato corretto</p>';
            }
        }
     
        //Controllo Messaggio
        $messaggio = sanitize($_POST['messaggio'], $allowed_tags);
        if(strlen($messaggio) == 0){
            $form_messages .= '<p>Il campo messaggio non può essere vuoto</p>';
        }

        // Se non ci sono errori, si inviano i dati correttamente
        if(strlen($form_messages) == 0){
            $result = true;
        }

        if($result){
            $form_messages .= '<p class="formSuccess">Il messaggio è stato inviato correttamente</p>';
        }
        else{
            $form_messages .= '<p class="formError">Abbiamo un problema con l\'invio; riprova più tardi</p>';
        }

    }


    $contatti = str_replace('{{formMessages}}',$form_messages,$contatti);

    $contatti = str_replace('{{nome}}',$nome,$contatti);
    $contatti = str_replace('{{telefono}}',$telefono,$contatti);
    $contatti = str_replace('{{email}}',$email,$contatti);
    $contatti = str_replace('{{messaggio}}',$messaggio,$contatti);

    $content .= $contatti;

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);

    echo replace_in_page($template,$title,$pageID,$breadcrumbs,'keywords','descrizione',$content);

?>


