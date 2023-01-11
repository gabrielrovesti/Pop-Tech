<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/categoria.html');

    $pageID = 'categoria';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="categorie.php">Categorie</a> &gt; Nuova Categoria</p>';


    if(!isLoggedIn(true)){

        $content = getAdminLoggedOutError();

        }else{

        $content = "<h1>Nuova Categoria</h1>";


        $connection = new DBAccess();

        $id   = '';
        $nome = '';
        $keywords = '';
        $descrizione = '';
        $errorsStr = '';
        $checked = '';

        if($connection->open_connection()){

        
            if(isset($_POST['submit'])){
            //Invio del form

                $errors = [];
                $query = "";
                $action = 'inserita';

                //Prelevamento dati
                $nome          = sanitize($_POST['nome'],"");
                $inPrimaPagina = (isset($_POST['inPrimaPagina']) ? intval(sanitize($_POST['inPrimaPagina'],"")) : 0);
                $keywords      = sanitize($_POST['keywords'],"");
                $descrizione    = sanitize($_POST['descrizione'],"");

                //Validazione dati
                if(strlen($nome)<=1){
                    array_push($errors,'<p class="message errorMsg">Inserire un nome con almeno due caratteri.</p>');
                }

                if(strlen($descrizione)<50){
                    array_push($errors,'<p class="message errorMsg">Inserire una descrizione con almeno 50 caratteri.</p>');
                }

                if(strlen($keywords)<2){
                    array_push($errors,'<p class="message errorMsg">Inserire delle keywords.</p>');
                }

                if(count($errors)==0){
                    //Procedi con inserimento o medifica
                    if(isset($_POST['id']) && intval($_POST['id'])!=0){

                        //Richiesta di modifica del prodotto
                        $id   = intval(sanitize($_POST['id'],""));
                        $query = "UPDATE categoria SET nome='$nome', inPrimaPagina='$inPrimaPagina', keywords='$keywords', descrizione='$descrizione' WHERE id=$id";
                        $action = 'modificata';
                
                    }else{

                        //Richiesta di creazione del prodotto
                        $query = "INSERT INTO categoria(nome,inPrimaPagina,keywords,descrizione) VALUES ('$nome','$inPrimaPagina','$keywords','$descrizione')";

                    }

                    $queryOK = $connection->exec_alter_query($query);

                    if($queryOK){
                        $content .= '<p class="message successMsg" role="status">Categoria '.$action.' con successo</p>';
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
                    $form = str_replace('{{nome}}',$nome,$form);
                    $form = str_replace('{{keywords}}',$keywords,$form);
                    $form = str_replace('{{descrizione}}',$descrizione,$form);
                    $form = str_replace('{{errors}}',$errorsStr,$form);

                    $content .= $form;

                }

            }else{     
                //Richiesta di visualizzazione del form

                if(isset($_GET['id']) && intval($_GET['id'])!=0){
                    
                    //Form per la modifica
                    $id = intval(sanitize($_GET['id'],""));

                    $categories = $connection->exec_select_query('SELECT * FROM categoria WHERE id='.$id.';');

                    if(isset($categories[0])){

                        $category = $categories[0];

                        $content = "<h1>Modifica ".parse_lang($category['nome'])."</h1>";

                        $breadcrumbs = '<p>Ti trovi in: <a href="categorie.php">Categorie</a> > '.parse_lang($category['nome']).'</p>';

                        $nome        = $category['nome'];
                        $keywords    = $category['keywords'];
                        $descrizione = $category['descrizione'];
                        $checked = ($category['inPrimaPagina']==1)?'checked':'';

                    }else{
                        $content .= '<p class="message errorMsg">Categoria non trovata.</p>';
                    }           

                }

                $form = str_replace('{{id}}',$id,$form);
                $form = str_replace('{{errors}}',$errorsStr,$form);
                $form = str_replace('{{nome}}',$nome,$form);
                $form = str_replace('{{keywords}}',$keywords,$form);
                $form = str_replace('{{descrizione}}',$descrizione,$form);

                $form = str_replace('{{checked}}',$checked,$form);

                $content .= $form;
            
            }

            $connection->close_connection();
        

        }else{
            $content .= getDBConnectionError(true);
        }

        
    }

    $menu = get_admin_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{onload}}','setAdminCategoriaMarcaChecks();addFieldsEvent();',$template);
    $template = str_replace('{{pageID}}',$pageID,$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>