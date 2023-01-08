<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    session_start();

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/login.html');

    $pageID = 'loginPage';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Accedi';

    $errorsStr = "";

    if(isLoggedIn(true)){

        header("Location: index.php");
        die();

    }else{
        $content = "<h1>Accedi</h1>";

        if(isset($_POST['submit'])){
            //Invio del form

            $errors = [];

            $email = sanitize($_POST['email'],"");
            $password = sanitize($_POST['password'],"");

            if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                array_push($errors,'<p class="message errorMsg">Formato dell\'email non corretto</p>');
            }

            if(strlen($password)<5){
                array_push($errors,'<p class="message errorMsg">Formato della password non corretto.</p>');
            }

            if(count($errors)==0){
                $connection = new DBAccess();
                if($connection->open_connection()){
                    
                    //Cerca utente con quell'id
                    $users = $connection->exec_select_query("SELECT id,admin,password FROM utente WHERE email='$email' AND admin=1;");  
                    $connection->close_connection();

                    if(count($users)>0){ //Utente trovato
                       
                        $user = $users[0];

                        if(password_verify($password,$user['password'])){

                            $_SESSION['user'] = $user['id'];

                            header("Location: index.php");
                            die();

                        }else{
                            array_push($errors,'<p class="message errorMsg">Nome utente o password non corretti</p>');
                        }

                    }else{
                        array_push($errors,'<p class="message errorMsg">Nome utente o password non corretti</p>');
                    }

                    $errorsStr = '<ul>';
                    foreach($errors as $error){
                        $errorsStr .= '<li>'.$error.'</li>';
                    }
                    $errorsStr .= '</ul>';
                    $form = str_replace("{{errors}}",$errorsStr,$form); //Contiene solo l'ultimo errore
                    $content .= $form;
                }else{
                    $content .= getDBConnectionError(true);
                }                       
            }else{ //Mostra form con errori di formato
                $errorsStr = '<ul>';
                foreach($errors as $error){
                    $errorsStr .= '<li>'.$error.'</li>';
                }
                $errorsStr .= '<ul>';
                $form = str_replace("{{errors}}",$errorsStr,$form);
                $content .= $form;
            }
        }else{
            $form = str_replace("{{errors}}",$errorsStr,$form);
            $content .= $form; 
        } 
    }

    $template = str_replace('{{menu}}',"",$template);
    $template = str_replace('{{onload}}','setAdminLoginChecks();addFieldsEvent();',$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>