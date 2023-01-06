<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/faq.html');

    $pageID = 'faq';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="faqs.php">FAQ</a> &gt; Nuova FAQ</p>';


    if(!isLoggedIn(true)){

        $content = '<p class="message errorMsg">Attenzione: non disponi dei privilegi necessari per accede a questa pagina.</p>';

        }else{

        $content = "<h1>Nuova FAQ</h1>";


        $connection = new DBAccess();

        $id        = '';
        $domanda   = '';
        $risposta  = '';
        $errorsStr = '';

        if($connection->open_connection()){

        
            if(isset($_POST['submit'])){
            //Invio del form

                $errors = [];
                $query = "";
                $action = 'inserita';

                //Prelevamento dati
                $domanda  = sanitize($_POST['domanda'],"");
                $risposta = sanitize($_POST['risposta'],"");

                //Validazione dati
                if(strlen($domanda)<=10){
                    array_push($errors,'<p class="message errorMsg">Inserire una domanda con almeno dieci caratteri.</p>');
                }
                if(strlen($risposta)<=10){
                    array_push($errors,'<p class="message errorMsg">Inserire una risposta con almeno dieci caratteri.</p>');
                }

                if(count($errors)==0){
                    //Procedi con inserimento o medifica
                    if(isset($_POST['id']) && intval($_POST['id'])!=0){

                        //Richiesta di modifica del prodotto
                        $id   = intval(sanitize($_POST['id'],""));
                        $query = "UPDATE faq SET domanda='$domanda', risposta='$risposta' WHERE id=$id";
                        $action = 'modificata';
                
                    }else{

                        //Richiesta di creazione del prodotto
                        $query = "INSERT INTO faq(domanda,risposta) VALUES ('$domanda','$risposta')";

                    }

                    $queryOK = $connection->exec_alter_query($query);

                    if($queryOK){
                        $content .= '<p class="message successMsg">FAQ '.$action.' con successo</p>';
                    }else{
                        $content .= '<p class="message errorMsg">Errore durante l\'inserimento. Contatta il supporto tecnico.</p>';
                    }

                }else{
                    //Ritorna il form con i dati precompilati
                    $errorsStr = '<ul>';
                    foreach($errors as $error){
                        $errorsStr .= '<li>'.$error.'</li>';
                    }
                    $errorsStr .= '<ul>';

                    $form = str_replace('{{id}}',$id,$form);
                    $form = str_replace('{{domnda}}',$domanda,$form);
                    $form = str_replace('{{risposta}}',$risposta,$form);

                    $content .= $form;

                }

            }else{     
                //Richiesta di visualizzazione del form

                if(isset($_GET['id']) && intval($_GET['id'])!=0){
                    
                    //Form per la modifica
                    $id = intval(sanitize($_GET['id'],""));

                    $faqs = $connection->exec_select_query('SELECT domanda,risposta FROM faq WHERE id='.$id.';');

                    if(isset($faqs[0])){

                        $faq = $faqs[0];

                        $content = "<h1>Modifica ".parse_lang($faq['domanda'])."</h1>";

                        $breadcrumbs = '<p>Ti trovi in: <a href="faqs.php">FAQ</a> &gt; '.parse_lang($faq['domanda']).'</p>';

                        $domanda  = $faq['domanda'];
                        $risposta = $faq['risposta'];

                    }else{
                        $content .= '<p class="message errorMsg">FAQ non trovata.</p>';
                    }           

                }

                $form = str_replace('{{id}}',$id,$form);
                $form = str_replace('{{errors}}',$errorsStr,$form);
                $form = str_replace('{{domanda}}',$domanda,$form);
                $form = str_replace('{{risposta}}',$risposta,$form);

                $content .= $form;
            
            }

            $connection->close_connection();

        }else{
            $content .= getDBConnectionError(true);
        }

        
    }

    $menu = get_admin_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{onload}}','setAdminFAQChecks();addFieldsEvent();',$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>