<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $contatti = file_get_contents('layouts/contatti.html');

    $pageID = 'contattaci';
    $title = "Contatti - Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="index.php" lang="en">Home</a> &gt; Contatti</p>';

    $content = "";

    //Validazione form
    $form_messages = '';
    $allowed_tags = '<em><strong><h1><h2><h3><h4><h5><h6>';
    $result = true;

    $nome      = "";
    $telefono  = "";
    $email     = "";
    $messaggio = "";
    $privacy   = 0;

    if($_SERVER["REQUEST_METHOD"] == "POST"){

        //Prelievo dati
        
        $nome      = sanitize($_POST['nome'],"");
        $telefono  = sanitize($_POST['telefono'],"");
        $email     = sanitize($_POST['email'],"");
        $messaggio = sanitize($_POST['messaggio'],$allowed_tags);
        $privacy   = isset($_POST['privacy']) ? sanitize($_POST['privacy'],"") : 0; //Se esiste il valore del checkbox impostalo altrimenti imposta 0 (false)
        
        //Controllo campi

        if(strlen($nome) == 0){
            $form_messages .= '<p class="formError">Il campo nome non può essere vuoto</p>';
        }else{
            if(preg_match("/\d/",$nome)){
                $form_messages .= '<p class="formError">Il nome non può contenere numeri</p>';
            }
        }
        
        if(strlen($telefono) == 0){
            $form_messages .= '<p class="formError">Il campo telefono non può essere vuoto</p>';
        }else{
            if(!preg_match("/^[0-9]+$/",$telefono)){
                $form_messages .= '<p class="formError">Il campo telefono non può contenere lettere</p>';
            }
        }

        if(strlen($email) == 0){
            $form_messages .= '<p class="formError">Il campo <span lang="en">email</span> non può essere vuoto</p>';
        }else{
            if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                $form_messages .= '<p class="formError">Il campo <span lang="en">email</span> non è valido</p>';
            }
            if(!preg_match("/^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/",$email)){
                $form_messages .= '<p class="formError">Il campo e-mail non è stato inserito nel formato corretto</p>';
            }
        }
     
        if(strlen($messaggio) == 0){
            $form_messages .= '<p class="formError">Il campo messaggio non può essere vuoto</p>';
        }

        if(strlen($messaggio) == 0){
            $form_messages .= '<p class="formError">Il campo messaggio non può essere vuoto</p>';
        }

        if($privacy!=1){
            $form_messages .= '<p>Per cortesia accettare la <span lang="en">Privacy Policy</span> per spedire il messaggio.</p>';
        }

        // Se non ci sono errori, si inviano i dati correttamente
        if(strlen($form_messages) == 0){
            $result = true; //Simulazione di invio della mail di contatto
        }

        if($result){

            $form_messages .= '<p class="formSuccess" role="status">Il messaggio è stato inviato correttamente</p>';
            $nome      = "";
            $telefono  = "";
            $email     = "";
            $messaggio = "";

        }else{
            $form_messages .= '<p class="formError" role="status">Abbiamo un problema con l\'invio; riprova più tardi</p>';
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

    echo replace_in_page($template,$title,$pageID,$breadcrumbs,'keywords','descrizione',$content,'setContattiChecks();addFieldsEvent();addScrollEventListener();');

?>


