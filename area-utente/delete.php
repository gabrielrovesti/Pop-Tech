<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/elimina.html');

    $connection = new DBAccess();

    $pageID = 'delete';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Elimina Recensione</p>';
    $errors = [];
    $prodotto = "";

    if(!isLoggedIn()){

        $content = getAdminLoggedOutError();

    }else{

        $content = "";

        if($connection->open_connection()){

            
            if( isset($_GET['id']) && !isset($_POST['submit'])){
            //Produzione form di eliminazione       

                $id = intval(sanitize($_GET['id'],""));

                $content = "<h1>Elimina</h1>";            

                $reviews = $connection->exec_select_query('SELECT recensione.id, prodotto.nome FROM recensione,prodotto WHERE recensione.id='.$id.' AND prodotto.id = recensione.prodotto;');
                if(isset($reviews[0])){
                    $review = $reviews[0];
                    $prodotto   = parse_lang($review['nome']);
                }else{
                    $errors = ["Errore: Recensione non selezionata."];
                }

                $errorsStr = '<ul>';
                foreach($errors as $error){
                    $errorsStr .= '<li>'.$error.'</li>';
                }
                $errorsStr .= '<ul>';

                $form = str_replace('{{errors}}',$errorsStr,$form);
                $form = str_replace('{{id}}',$id,$form);
                $form = str_replace('{{prodotto}}',$prodotto,$form);

                $content .= $form;
                

            }elseif(isset($_POST['submit'])){
                //Operazione di eliminazione 

                $errors = [];

                if(!isset($_POST['id']) || intval($_POST['id'])<=0){
                    array_push($errors,"Errore: Recensione non selezionata.");
                }

                $id   = intval($_POST['id']);

                if(count($errors)==0){
                            
                        $queryOK = $connection->exec_alter_query("DELETE FROM recensione WHERE id=$id;");
                
                        if($queryOK){
                            $content .= '<p class="message successMsg">Recensione eliminata con successo</p>';
                        }else{
                            $content .= '<p class="message errorMsg" role="alert">Eliminazione non riuscita.</p>';
                        } 
                
                }else{
                        $content .= getDBConnectionError(true);
                }       

            }else{
                $content = '<p class="message errorMsg" role="alert">L\'indirizzo digitato non è completo. Selezionare un elemento da eliminare dalla lista.</p>';
            }
            $connection->close_connection();

        }else{
            $content .= '<p class="message errorMsg" role="alert">Errore nell\'eliminazione. Contatta il supporto tecnico.</p>';
        }      

    }

    $menu = get_user_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{pageID}}',$pageID,$template);
    echo replace_in_user_page($template,$title,$pageID,$breadcrumbs,$content,'setUserRecensioneChecks();addFieldsEvent();setRangeListener();');

?>