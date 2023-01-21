<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/recensione.html');

    $pageID = 'recensione';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="recensioni.php">Recensioni</a> &gt; Nuova recensione</p>';

    $errorsStr = "";

    if(!isLoggedIn(true)){

        $content = getAdminLoggedOutError();

    }else{


        $content = "<h1>Nuova Recensione</h1>";

        $id         = '';
        $utente     = '';
        $prodotto   = '';
        $contenuto  = '';
        $punteggio = '';

        $connection = new DBAccess();

        if($connection->open_connection()){

            $users    = $connection->exec_select_query('SELECT id,nome FROM utente ORDER BY nome;');
            $products = $connection->exec_select_query('SELECT id,nome FROM prodotto ORDER BY nome;');
        
            if(isset($_POST['submit'])){
            //Invio del form

                $errors = [];
                $query = "";
                $action = "inserita";

                //Prelevamento dati
                $utente    = sanitize($_POST['utente'],"");
                $prodotto  = sanitize($_POST['prodotto'],"");
                $contenuto = sanitize($_POST['contenuto'],"<p><em><b><strong><ul><li><ol>");
                $punteggio = floatVal(sanitize($_POST['punteggio'],""));
                

                //Validazione dati
                if($utente==''){
                    array_push($errors,'<p class="message errorMsg">Selezionare un utente.</p>');
                }

                if($prodotto==''){
                    array_push($errors,'<p class="message errorMsg">Selezionare un utente.</p>');
                }

                

                if(count($errors)==0){
                    //Procedi con inserimento o medifica
                    if(isset($_POST['id']) && intval($_POST['id'])!=0){

                        //Richiesta di modifica del prodotto
                        $id   = intval(sanitize($_POST['id'],""));
                        $query = "UPDATE recensione SET utente=$utente, prodotto=$prodotto, contenuto='$contenuto', punteggio=$punteggio WHERE id=$id";
                        $action = "modificata";
                
                    }else{

                        //Richiesta di creazione del prodotto
                        $id = '';
                        $query = "INSERT INTO recensione(utente,prodotto,contenuto,punteggio) VALUES ($utente,$prodotto,'$contenuto',$punteggio);";

                    }

                    $queryOK = $connection->exec_alter_query($query);

                    if($queryOK){
                        $content .= '<p class="message successMsg" role="status">Recensione '.$action.' con successo</p>';
                    }else{
                        $content .= '<p class="message errorMsg" role="status">Errore durante l\'inserimento. Contatta il supporto tecnico.</p>';
                    }

                }else{
                    //Ritorna il form con i dati precompilati
                    $errorsStr = '<ul>';
                    foreach($errors as $error){
                        $errorsStr .= '<li>'.$error.'</li>';
                    }
                    $errorsStr .= '<ul>';

                    $form = str_replace('{{id}}',$id,$form);

                    $utenti = "";
                    foreach($users as $user){
                        $utenti .= '<option value="'.$user['id'].'" '.(($user['id']==$review['utente'])?'selected':'').'>'.$user['nome'].'</option>';
                    }

                    $prodotti = "";
                    foreach($products as $product){
                        $prodotti .= '<option value="'.$product['id'].'" '.(($product['id']==$review['prodotto'])?'selected':'').'>'.parse_lang($product['nome'],true).'</option>';
                    }

                    $form = str_replace('{{utenti}}',$utenti,$form);

                    $form = str_replace('{{prodotti}}',$prodotti,$form);

                    $form = str_replace('{{contenuto}}',$contenuto,$form);
                    $form = str_replace('{{punteggio}}',$punteggio,$form);
                                
                    $form = str_replace('{{errors}}',$errorsStr,$form);

                    $content .= $form;

                }

            }else{
                //Richiesta di visualizzazione del form

                if(isset($_GET['id']) && intval($_GET['id'])!=0){
                    //Form per la modifica
                    $id = intval(sanitize($_GET['id'],""));

                    $reviews = $connection->exec_select_query('SELECT * FROM recensione WHERE id='.$id.';');

                    if(isset($reviews[0])){

                        $review = $reviews[0];

                        $content = "<h1>Modifica Recensione</h1>";

                        $breadcrumbs = '<p>Ti trovi in: <a href="recensioni.php">Recensioni</a> &gt; Modifica Recensione</p>';

                        $utente     = $review['utente'];
                        $prodotto   = $review['prodotto'];
                        $contenuto  = $review['contenuto'];
                        $punteggio = $review['punteggio'];

                    }else{
                        $content .= '<p class="message errorMsg">Recensione non trovata.</p>';
                    }           

                }

                $utenti = "";
                foreach($users as $user){
                    $utenti .= '<option value="'.$user['id'].'" '.(($user['id']==$utente)?'selected':'').'>'.$user['nome'].'</option>';
                }

                $prodotti = "";
                
                foreach($products as $product){
                    $prodotti .= '<option value="'.$product['id'].'" '.(($product['id']==$prodotto)?'selected':'').'>'.parse_lang($product['nome'],true).'</option>';
                }

                $form = str_replace('{{id}}',$id,$form);

                $form = str_replace('{{utenti}}',$utenti,$form);
                $form = str_replace('{{prodotti}}',$prodotti,$form);

                $form = str_replace('{{contenuto}}',$contenuto,$form);
                $form = str_replace('{{punteggio}}',$punteggio,$form);
                                
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
    $template = str_replace('{{onload}}','setRangeListener();',$template); //Utente e prodotto sono già selezionati
    $template = str_replace('{{pageID}}',$pageID,$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>