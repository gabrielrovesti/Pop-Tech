<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');
    $form     = file_get_contents('layouts/prodotto.html');
    
    $pageID = 'prodotto';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="index.php">Prodotti</a> > Nuovo Prodotto</p>';

    if(!isLoggedIn(true)){

        $content = '<p class="message errorMsg">Attenzione: non disponi dei privilegi necessari per accede a questa pagina.</p>';

    }else{

        $content = "<h1>Nuovo Prodotto</h1>";
        $errorsStr = "";


        $connection = new DBAccess();

        if($connection->open_connection()){

        
            if(isset($_POST['submit'])){

                //Invio del form

                $errors = [];
                
                $id = '';

                //Prelevamento dati
                $nome        = sanitize($_POST['nome'],"");
                $immagine    = $_FILES['immagine'];
                $altImmagine = sanitize($_POST['altImmagine'],"");
                $categoria   = sanitize($_POST['categoria'],"");
                $origine     = sanitize($_POST['origine'],"");
                $marca       = sanitize($_POST['marca'],"");
                $modello     = sanitize($_POST['modello'],"");
                $dimensione  = sanitize($_POST['dimensione'],"");
                $peso        = sanitize($_POST['peso'],"");
                $prezzo      = floatval(sanitize($_POST['prezzo'],""));
                $descrizione = sanitize($_POST['descrizione'],"<span><em><ul><li><b><strong><ol>");

                //Validazione dati
                if(strlen($nome)<=4){
                    array_push($errors,"Inserire un nome con almeno 5 caratteri.");
                }

                if(strlen($categoria)==0){
                    array_push($errors,"Scegliere una categoria.");
                }

                if(strlen($origine)==0){
                    array_push($errors,"Inserire una nazione di origine.");
                }

                if(strlen($marca)==0){
                    array_push($errors,"Scegliere una marca.");
                }

                if(strlen($modello)<=1){
                    array_push($errors,"Inserire un modello di almeno 2 cifre.");
                }

                if(strlen($descrizione)<=9){
                    array_push($errors,"Inserire una descrizione con almeno 10 caratteri.");
                }

                if($prezzo<=0){
                    array_push($errors,"Inserire un prezzo maggiore di zero.");
                }

                if(  $immagine['name']=="" && (!isset($_POST['id']) || intval($_POST['id'])==0) ){
                    //Immagine necessaria per l'inserimento
                    array_push($errors,"Immagine richiesta per l'inserimento di un nuovo prodotto.");
                }

                if( $immagine['name']!=""){
                    //Il true nella chiamata fa in maniera tale che faccia solo i test senza salvare l'immagine
                    if(!upload_file($immagine,true)){
                        array_push($errors,"Sono supportati solamente file immagine di tipo jpg, jpeg e png.");
                    }
                }

                if(count($errors)==0){     
                    
                    $query = "";
                    $action = "inserito";

                    if(isset($_POST['id']) && intval($_POST['id'])!=0){
                        //Richiesta di modifica del prodotto
                        $path = false;
                                        
                        if($immagine['name']!=''){
                            $path = upload_file($immagine);
                            if(!$path){
                                $content .= '<p class="message errorMsg">Errore durante il caricamento dell\'immagine. Sono supportati file jpg,jpeg e png.</p>';
                            }
                        }

                        $action = "modificato";

                        $id = intval(sanitize($_POST['id'],""));

                        $query = "UPDATE `prodotto` SET `nome`='$nome',".(($path)?"`immagine`='$path',":"")."`altImmagine`='$altImmagine',`descrizione`='$descrizione',`origine`='$origine',`marca`='$marca',`modello`='$modello',`dimensione`='$dimensione',`peso`='$peso',`categoria`='$categoria',`prezzo`='$prezzo' WHERE id=$id";

                    }else{
                        $path = upload_file($immagine);
                        //Richiesta di creazione del prodotto                  
                        if($path){              
                            $query = "INSERT INTO `prodotto`(`nome`, `immagine`, `altImmagine`, `descrizione`, `origine`, `marca`, `modello`, `dimensione`, `peso`, `categoria`, `prezzo`) VALUES ('$nome','$path','$altImmagine','$descrizione','$origine','$marca','$modello','$dimensione','$peso','$categoria','$prezzo')";
                        }else{
                            $content .= '<p class="message errorMsg">Errore durante il caricamento dell\'immagine. Sono supportati file jpg,jpeg e png.</p>';
                        }
                    }

                    if($query)
                        $queryOK = $connection->exec_alter_query($query);
                    else
                        $queryOK = false;

                    if($queryOK){
                        $content .= '<p class="message successMsg">Prodotto '.$action.' con successo</p>';
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
                    //$form = str_replace('{{immagine}}',$immagine,$form); l'utente deve ri-selezionare il file
                    $form = str_replace('{{altImmagine}}',$altImmagine,$form);
                    
                    $form = str_replace('{{origine}}',$origine,$form);
                    $form = str_replace('{{prezzo}}',$prezzo,$form);
                    $form = str_replace('{{modello}}',$modello,$form);
                    $form = str_replace('{{dimensione}}',$dimensione,$form);
                    $form = str_replace('{{peso}}',$peso,$form);
                    $form = str_replace('{{descrizione}}',$descrizione,$form);

                    $categories = $connection->exec_select_query('SELECT id,nome FROM categoria ORDER BY nome;');
                    $brands     = $connection->exec_select_query('SELECT id,nome FROM marca ORDER BY nome;');  

                    //Preleva le categorie per il campo select selezionando quella inserita
                    $categorie = "";
                    foreach($categories as $category){
                        $categorie .= '<option value="'.$category['id'].'" '.(($category['id']==$categoria)?'selected':'').'>'.$category['nome'].'</option>';
                    }

                    //Preleva le marche per il campo select selezionando quella inserita
                    $marche = "";
                    foreach($brands as $brand){
                        $marche .= '<option value="'.$brand['id'].'" '.(($brand['id']==$marca)?'selected':'').'>'.$brand['nome'].'</option>';
                    }

                    $form = str_replace('{{marche}}',$marche,$form);
                    $form = str_replace('{{categorie}}',$categorie,$form);
                    
                    $form = str_replace('{{errors}}',$errorsStr,$form);

                    $content .= $form;

                }
                $connection->close_connection();
            }else{

                //Richiesta di visualizzazione del form

                $id          = '';
                $nome        = '';
                $immagine    = '';
                $descrizione = '';
                $altImmagine = '';
                $prezzo      = '';

                $categories = $connection->exec_select_query('SELECT id,nome FROM categoria ORDER BY nome;');
                $brands     = $connection->exec_select_query('SELECT id,nome FROM marca ORDER BY nome;');            
                    
                $origine     = '';            
                $modello     = '';
                $peso        = '';
                $dimensione  = '';

                if(isset($_GET['id']) && intval($_GET['id'])!=0){
                    //Presenta orm per la modifica
                    $id = intval(sanitize($_GET['id'],""));

                    $products = $connection->exec_select_query('SELECT * FROM prodotto WHERE id='.$id.';');

                    if(isset($products[0])){

                        $product = $products[0];

                        $content = "<h1>Modifica ".parse_lang($product['nome'])."</h1>";

                        $breadcrumbs = '<p>Ti trovi in: <a href="index.php">Prodotti</a> > '.parse_lang($product['nome']).'</p>';

                        //Preleva i dati dal DB
                        $nome        = $product['nome'];
                        $immagine    = $product['immagine'];
                        $altImmagine = $product['altImmagine'];
                        $descrizione = $product['descrizione'];            
                        $origine     = $product['origine'];
                        $modello     = $product['modello'];
                        $peso        = $product['peso'];
                        $dimensione  = $product['dimensione'];
                        $prezzo      = $product['prezzo'];

                        //Preleva le categorie per il campo select selezionando quella inserita
                        $categorie = "";
                        foreach($categories as $category){
                            $categorie .= '<option value="'.$category['id'].'" '.(($category['id']==$product['categoria'])?'selected':'').'>'.$category['nome'].'</option>';
                        }

                        //Preleva le marche per il campo select selezionando quella inserita
                        $marche = "";
                        foreach($brands as $brand){
                            $marche .= '<option value="'.$brand['id'].'" '.(($brand['id']==$product['marca'])?'selected':'').'>'.$brand['nome'].'</option>';
                        }

                    }else{
                        $content .= '<p class="message errorMsg">Prodotto non trovato.</p>';
                    }    
                    
                    $connection->close_connection();

                }else{
                    //Presenta form per l'inserimento

                    //Preleva le categorie per il campo select
                    $categorie = "";
                    foreach($categories as $category){
                        $categorie .= '<option value="'.$category['id'].'">'.$category['nome'].'</option>';
                    }
                    
                    //Preleva le marche per il campo select
                    $marche = "";
                    foreach($brands as $brand){
                        $marche .= '<option value="'.$brand['id'].'">'.$brand['nome'].'</option>';
                    }   

                }

                $form = str_replace('{{id}}',$id,$form);
                $form = str_replace('{{nome}}',$nome,$form);
                $form = str_replace('{{immagine}}','<img src="../'.getThumbnail($immagine).'" alt="">',$form);
                $form = str_replace('{{altImmagine}}',$altImmagine,$form);
                $form = str_replace('{{marche}}',$marche,$form);
                $form = str_replace('{{categorie}}',$categorie,$form);
                $form = str_replace('{{descrizione}}',$descrizione,$form);
                $form = str_replace('{{origine}}',$origine,$form);
                $form = str_replace('{{modello}}',$modello,$form);
                $form = str_replace('{{descrizione}}',$descrizione,$form);
                $form = str_replace('{{dimensione}}',$dimensione,$form);
                $form = str_replace('{{peso}}',$peso,$form);
                $form = str_replace('{{prezzo}}',$prezzo,$form);

                $form = str_replace('{{errors}}',$errorsStr,$form);

                $content .= $form;
            }

        }else{
            //Errore di connessione al database
            $content .= getDBConnectionError(true);
        }

    }

    $menu = get_admin_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{onload}}','setAdminProdottoChecks();addFieldsEvent();',$template);


    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>