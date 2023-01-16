<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/registrazione.html');

    $pageID = 'registrazione';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Profilo</p>';

    $nome     = '';
    $email    = '';
    $username = '';
    
    $errorsStr = "";
    $errors    = [];


    $content = "<h1>Registrazione Utente</h1>";

    $connection = new DBAccess();

    if($connection->open_connection()){

        if(isset($_POST['submit'])){
            //Invio del form

            //Prelevamento dati
            
            $nome            = sanitize($_POST['nome'],"");
            $email           = sanitize($_POST['email'],"");
            $username        = sanitize($_POST['username'],"");
            $password        = sanitize($_POST['password'],"");
            $passwordConfirm = sanitize($_POST['passwordConfirm'],"");
            
            //Validazione dati
            if(strlen($nome)<2){
                array_push($errors,'<p class="message errorMsg">Inserire un nome con almeno 2 caratteri.</p>');
            }

            if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                array_push($errors,'<p class="message errorMsg">Inserire una <span lang="en">email</span> corretta.</p>');
            }

            if(!preg_match('/\w{4,}/',$username)){
                array_push($errors,'<p class="message errorMsg">Inserire un nome utente con almeno 4 lettere e/o numeri.</p>');
            }

            if(strlen($password)<4){
                array_push($errors,'<p class="message errorMsg">Inserire una <span lang="en">password</span> con almeno 4 caretteri.</p>');
            }

            if($password != $passwordConfirm){
                array_push($errors,'<p class="message errorMsg">Le <span lang="en">password</span inserite non combaciano.</p>');
            }

            if(count($errors)==0){

                $query = "";
                
                $encPassword = password_hash($password,PASSWORD_BCRYPT);

                $query = "INSERT INTO utente(nome,username,email,password,admin) VALUES('$nome','$username','$email','$encPassword',0);";

                $queryOK = $connection->exec_alter_query($query);

                if($queryOK){
                    $content .= '<p class="message successMsg">Utente creato con successo. Clicca su Accedi per entrare nella tua area utente.</p>';
                }else{
                    $content .= '<p class="message errorMsg">Errore durante la creazione dell\'utente. Contatta il supporto tecnico.</p>';
                }

            }else{

                //Ritorna il form con i dati precompilati
                $errorsStr = '<ul>';
                foreach($errors as $error){
                    $errorsStr .= '<li>'.$error.'</li>';
                }
                $errorsStr .= '<ul>';

                $form = str_replace('{{email}}',$_POST['email'],$form);
                $form = str_replace('{{username}}',$_POST['username'],$form);
                $form = str_replace('{{nome}}',$_POST['nome'],$form);
                            
                $form = str_replace('{{errors}}',$errorsStr,$form);

                $content .= $form;

            }

        }else{

            $form = str_replace('{{errors}}',$errorsStr,$form);
            $form = str_replace('{{email}}',"",$form);
            $form = str_replace('{{username}}',"",$form);
            $form = str_replace('{{nome}}',"",$form);

            $content .= $form;

        }
            
        $connection->close_connection();

    }else{
        $content .= getDBConnectionError(true);
    }

    $menu = get_user_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{pageID}}',$pageID,$template);
    echo replace_in_user_page($template,$title,$pageID,$breadcrumbs,$content, 'setUserRegistrazioneChecks();addFieldsEvent();');

?>  