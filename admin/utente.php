<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/utente.html');

    $pageID = 'utente';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="utenti.php">Utenti</a> &gt; Nuovo utente</p>';

    if(!isLoggedIn(true)){

        $content = getAdminLoggedOutError();

    }else{


        $content = "<h1>Nuovo Utente</h1>";

        $id        = '';
        $nome      = '';
        $email     = '';
        $username  = '';
        $admin     = '';
        $errorsStr = '';

        $connection = new DBAccess();

        if($connection->open_connection()){
        
            if(isset($_POST['submit'])){
            //Invio del form

                $errors = [];
                $query = "";
                $action = "inserito";

                //Prelevamento dati
                $nome     = sanitize($_POST['nome'],"");
                $email    = sanitize($_POST['email'],"");
                $username = sanitize($_POST['username'],"");
                $password = sanitize($_POST['password'],"");
                $admin    = intval(sanitize($_POST['admin'] or 0,""));

                $encPassword = password_hash($password,PASSWORD_BCRYPT);

                //Validazione dati
                if(strlen($nome)<=1){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire un nome con almeno due caratteri.</p>');
                }

                if(strlen($nome)<=1){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire un nome con almeno due caratteri.</p>');
                }

                if(!preg_match('/\w{4,}/',$username)){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire un nome utente con almeno 4 lettere e/o numeri.</p>');
                }

                if(strlen($password)<4){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire una <span lang="en">password</span> di almeno 4 caratteri.</p>');
                }

                if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                    array_push($errors,'<p class="message errorMsg" role="alert">Inserire una <span lang="en">email</span> valida.</p>');
                }
                

                if(count($errors)==0){
                    //Procedi con inserimento o medifica
                    if(isset($_POST['id']) && intval($_POST['id'])!=0){

                        //Richiesta di modifica del prodotto
                        $id   = intval(sanitize($_POST['id'],""));
                        $query = "UPDATE utente SET nome='$nome', email='', password='$encPassword', username='$username', admin='$admin' WHERE id=$id;";
                        $action = "modificato";
                
                    }else{

                        //Richiesta di creazione del prodotto
                        $id = '';
                        $query = "INSERT INTO utente(nome,email,username,password,admin) VALUES ('$nome','$email','$username','$encPassword',$admin);";

                    }

                    $queryOK = $connection->exec_alter_query($query);

                    if($queryOK){
                        $content .= '<p class="message successMsg" role="status">utente '.$action.' con successo</p>';
                    }else{
                        $content .= '<p class="message errorMsg" role="alert" role="status">Errore durante l\'inserimento. Contatta il supporto tecnico.</p>';
                    }

                }else{
                    //Ritorna il form con i dati precompilati
                    $errorsStr = '<ul>';
                    foreach($errors as $error){
                        $errorsStr .= '<li>'.$error.'</li>';
                    }
                    $errorsStr .= '<ul>';

                    $form = str_replace('{{id}}',$id,$form);
                    $form = str_replace('{{nome}}',$nome,$form);
                    $form = str_replace('{{email}}',$email,$form);
                    $form = str_replace('{{username}}',$username,$form);
                    $form = str_replace('{{admin}}',($admin)?'checked=""':"",$form);
                    $form = str_replace('{{errors}}',$errorsStr,$form);

                    $content .= $form;

                }

            }else{
                //Richiesta di visualizzazione del form

                if(isset($_GET['id']) && intval($_GET['id'])!=0){
                    //Form per la modifica
                    $id = intval(sanitize($_GET['id'],""));

                    $users = $connection->exec_select_query('SELECT * FROM utente WHERE id='.$id.';');

                    if(isset($users[0])){

                        $user = $users[0];

                        $content = "<h1>Modifica ".parse_lang($user['nome'])."</h1>";

                        $breadcrumbs = '<p>Ti trovi in: <a href="utenti.php">Utenti</a> &gt; '.parse_lang($user['nome']).'</p>';

                        $nome  = $user['nome'];
                        $email = $user['email'];
                        $admin = $user['admin'];
                        $username = $user['username'];

                    }else{
                        $content .= '<p class="message errorMsg" role="alert">Utente non trovato.</p>';
                    }           

                }

                $form = str_replace('{{id}}',$id,$form);
                $form = str_replace('{{nome}}',$nome,$form);
                $form = str_replace('{{email}}',$email,$form);
                $form = str_replace('{{username}}',$username,$form);
                $form = str_replace('{{admin}}',($admin)?'checked=""':"",$form);
                $form = str_replace('{{errors}}',$errorsStr,$form);

                $content .= $form;
            }
            $connection->close_connection();
        }else{
            $content .= getDBConnectionError(true);
        }

    }

    $menu = get_admin_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{onload}}','setAdminUtenteChecks();addFieldsEvent();',$template);
    $template = str_replace('{{pageID}}',$pageID,$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>