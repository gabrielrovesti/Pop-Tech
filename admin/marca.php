<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/marca.html');

    $pageID = 'marca';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="marche.php">Marche</a> > Nuova Marca</p>';

    if(!isLoggedIn(true)){

        $content = '<p class="message errorMsg">Attenzione non disponi dei privilegi necessari per accede a questa pagina.</p>';

    }else{


        $content = "<h1>Nuova Marca</h1>";

        $id   = '';
        $nome = '';
        $errorsStr = '';

        $connection = new DBAccess();

        if($connection->open_connection()){

        
            if(isset($_POST['submit'])){
            //Invio del form

                $errors = [];
                $query = "";
                $action = "inserita";

                //Prelevamento dati
                $nome = sanitize($_POST['nome'],"");

                //Validazione dati
                if(strlen($nome)<=1){
                    array_push($errors,'<p class="message successMsg">Inserire un nome con almeno due caratteri.</p>');
                }

                if(count($errors)==0){
                    //Procedi con inserimento o medifica
                    if(isset($_POST['id']) && intval($_POST['id'])!=0){

                        //Richiesta di modifica del prodotto
                        $id   = intval(sanitize($_POST['id'],""));
                        $query = "UPDATE marca SET nome='$nome' WHERE id=$id";
                        $action = "modificata";
                
                    }else{

                        //Richiesta di creazione del prodotto
                        $id = '';
                        $query = "INSERT INTO marca(nome) VALUES ('$nome')";

                    }

                    $queryOK = $connection->exec_alter_query($query);

                    if($queryOK){
                        $content .= '<p class="message successMsg">Marca '.$action.' con successo</p>';
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
                    $form = str_replace('{{nome}}',$nome,$form);
                    $form = str_replace('{{errors}}',$errorsStr,$form);

                    $content .= $form;

                }

            }else{
                //Richiesta di visualizzazione del form

                if(isset($_GET['id']) && intval($_GET['id'])!=0){
                    //Form per la modifica
                    $id = intval(sanitize($_GET['id'],""));

                    $brands = $connection->exec_select_query('SELECT * FROM marca WHERE id='.$id.';');

                    if(isset($brands[0])){

                        $brand = $brands[0];

                        $content = "<h1>Modifica ".parse_lang($brand['nome'])."</h1>";

                        $breadcrumbs = '<p>Ti trovi in: <a href="marche.php">Marche</a> > '.parse_lang($brand['nome']).'</p>';

                        $nome = $brand['nome'];

                    }else{
                        //TODO 404
                    }           

                }

                $form = str_replace('{{id}}',$id,$form);
                $form = str_replace('{{nome}}',$nome,$form);
                $form = str_replace('{{errors}}',$errorsStr,$form);

                $content .= $form;
            }
            $connection->close_connection();

        }else{
            $content .= '<p>I sistemi sono momentaneamente fuori servizio. Ci scusiamo per il disagio.</p>';
        }

    }

    $menu = get_admin_menu();
    $template = str_replace('{{menu}}',$menu,$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>