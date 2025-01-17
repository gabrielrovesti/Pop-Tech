<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/profilo.html');

    $pageID = 'profilo';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Area Utente &gt; Profilo</p>';

    $nome     = '';
    $email    = '';
    $username = '';
    
    $errorsStr = "";
    $errors    = [];

    if(!isLoggedIn()){
        $content = getAdminLoggedOutError();
    }else{

        $content = "<h1>Il tuo profilo</h1>";

        $userid = $_SESSION['user'];

        $connection = new DBAccess();

        if($connection->open_connection()){
            if(isset($_POST['submit'])){
                //Invio del form e prelevamento dati
                
                $nome     = sanitize($_POST['nome'],"");
                $email    = sanitize($_POST['email'],"");
                $username = sanitize($_POST['username'],"");
                $password = sanitize($_POST['password'],"");
                
                //Validazione dati
                if(strlen($nome)<2){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire un nome con almeno 2 caratteri.</p>');
                }

                if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire una <span lang="en">email</span> corretta.</p>');
                }

                if(!preg_match('/\w{4,}/',$username)){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire un nome utente con almeno 4 lettere e/o numeri.</p>');
                }

                if(strlen($password)<4){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire una <span lang="en">password</span> con almeno 4 caretteri.</p>');
                }

                if(count($errors)==0){
                    $query = "";

                    //Richiesta di modifica
                    $encPassword = password_hash($password,PASSWORD_BCRYPT);

                    $query = "UPDATE utente SET nome='$nome', email='$email', username='$username', password='$encPassword' WHERE id=$userid;";

                    $queryOK = $connection->exec_alter_query($query);

                    if($queryOK){
                        $content .= '<p class="message successMsg">Profilo salvato con successo</p>';
                    }else{
                        $content .= '<p class="message errorMsg" role="alert">Errore durante l\'inserimento. Contatta il supporto tecnico.</p>';
                    }
                }else{
                    //Ritorna il form con i dati precompilati
                    $errorsStr = '<ul>';
                    foreach($errors as $error){
                        $errorsStr .= '<li>'.$error.'</li>';
                    }
                    $errorsStr .= '<ul>';

                    $form = str_replace('{{email}}',$_POST['email'],$form);
                    $form = str_replace('{{nome}}',$_POST['nome'],$form);
                    $form = str_replace('{{username}}',$_POST['username'],$form);
                                
                    $form = str_replace('{{errors}}',$errorsStr,$form);

                    $content .= $form;
                }
            }else{
                $users = $connection->exec_select_query('SELECT nome,email,username FROM utente WHERE id='.$userid.';');

                if(isset($users[0])){

                    $user = $users[0];

                    $form = str_replace('{{errors}}',$errorsStr,$form);
                    $form = str_replace('{{email}}',$user['email'],$form);
                    $form = str_replace('{{username}}',$user['username'],$form);
                    $form = str_replace('{{nome}}',$user['nome'],$form);

                }
                $content .= $form;
            }
            $connection->close_connection();

        }else{
            $content .= getDBConnectionError(true);
        }
    }

    $menu = get_user_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{pageID}}',$pageID,$template);
    echo replace_in_user_page($template,$title,$pageID,$breadcrumbs,$content, 'setUserProfiloChecks();addFieldsEvent();');
?>  