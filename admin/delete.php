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
    $breadcrumbs = '<p>Ti trovi in: Elimina</p>';

    $typeText = "";
    $nome     = "";
    $backLink = "#";

    if(!isLoggedIn(true)){

        $content = getAdminLoggedOutError();

    }else{

        $content = "";

        if($connection->open_connection()){

            
            if( isset($_GET['id']) && isset($_GET['type']) && !isset($_POST['submit'])){
            //Produzione form di eliminazione       

                $id = intval(sanitize($_GET['id'],""));
                $type = sanitize($_GET['type'],"");

                $content = "<h1>Elimina</h1>";            

                switch($type){
                    
                    case 'prodotto':
                        
                        $typeText = "del prodotto";
                        $backLink = "prodotti.php";
                        $products = $connection->exec_select_query('SELECT id, nome FROM prodotto WHERE id='.$id.';');
                        if(isset($products[0])){
                            $product = $products[0];
                            $nome    = parse_lang($product['nome']);
                        }

                    break;
                    
                    case 'marca':

                        $typeText = "della marca";
                        $backLink = "marche.php";
                        $brands = $connection->exec_select_query('SELECT id, nome FROM marca WHERE id='.$id.';');
                        if(isset($products[0])){
                            $brand = $brands[0];
                            $nome  = parse_lang($brand['nome']);
                        }

                    break;

                    case 'categoria':


                        $typeText = "della categoria";
                        $backLink = "categorie.php";
                        $categories = $connection->exec_select_query('SELECT id, nome FROM categoria WHERE id='.$id.';');
                        if(isset($categories[0])){
                            $category = $categories[0];
                            $nome     = parse_lang($category['nome']);
                        }

                    break;

                    case 'utente':


                        $typeText = "dell'utente";
                        $backLink = "utenti.php";
                        $users = $connection->exec_select_query('SELECT id, nome FROM utente WHERE id='.$id.';');
                        if(isset($users[0])){
                            $user = $users[0];
                            $nome = $user['nome'];
                        }

                    break;

                    case 'faq':

                        $typeText = "della FAQ'";
                        $backLink = "faqs.php";
                        $faqs = $connection->exec_select_query('SELECT domanda FROM faq WHERE id='.$id.';');
                        if(isset($faqs[0])){
                            $faq = $faqs[0];
                            $nome = $faq['domanda'];
                        }

                    break;

                    case 'recensione':

                        $typeText = "della recensione";
                        $backLink = "recensioni.php";
                        $reviews = $connection->exec_select_query('SELECT id FROM recensione WHERE id='.$id.';');
                        if(isset($reviews[0])){
                            $review = $reviews[0];
                            $nome   = '';
                        }

                    break;

                    default:
                        $content = '<p class="message errorMsg" role="alert">L\'indirizzo digitato non è corretto. Selezionare un elemento da eliminare dalla lista.</p>';
                    break;
                }

                $form = str_replace('{{id}}',$id,$form);
                $form = str_replace('{{type}}',$type,$form);
                $form = str_replace('{{nome}}',$nome,$form);
                $form = str_replace('{{typeText}}',$typeText,$form);
                $form = str_replace('{{backLink}}',$backLink,$form);

                $content .= $form;
                

            }elseif(isset($_POST['submit'])){
                //Operazione di eliminazione 

                $errors = [];

                if(!isset($_POST['id']) || intval($_POST['id'])<=0){
                    array_push($errors,"Errore: ID non selezionato.");
                }

                if(!isset($_POST['type'])){
                    array_push($errors,"Errore: tipo non selezionato.");
                }

                $id   = intval($_POST['id']);
                $type = sanitize($_POST['type'],'');

                if(count($errors)==0){
                            
                        $queryOK = $connection->exec_alter_query("DELETE FROM $type WHERE id=$id;");
                
                        if($queryOK){
                            $content .= '<p class="message successMsg">Elemento eliminato con successo</p>';
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

    $menu = get_admin_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{onload}}','',$template);
    $template = str_replace('{{pageID}}',$pageID,$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>