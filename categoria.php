<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $connection = new DBAccess;

    $pageID      = 'categoria';
    $title       = "Categoria - Pop Tech";
    $breadcrumbs = '';
    $content     = '';

    $keywords    = '';
    $descrizione = '';

    if ($connection->open_connection()) {
            
        if(isset($_GET['id'])){

            $id = intval(sanitize($_GET['id'],''));        
            $categories = $connection->exec_select_query("SELECT id, nome, keywords, descrizione FROM categoria WHERE id=$id;");

            if(count($categories)){

                $category = $categories[0];
            
                $content .= '<h1 class="comic-title">'.parse_lang($category['nome']).'</h1>';
            
                $breadcrumbs = '<p>Ti trovi in: <a href="index.php"><span lang="en">Home</span></a> &gt; Categorie &gt; '.parse_lang($category['nome']).'</p> ';
                
                $title = parse_lang($category['nome']) . ' - Pop Tech';

                $keywords    = $category['keywords'];
                $descrizione = $category['descrizione'];
            
                $content .= '<div class="productsRow">';
                
                $products = $connection->exec_select_query("SELECT id, nome, immagine, descrizione, origine, marca, modello, dimensione, peso, categoria, prezzo FROM prodotto WHERE categoria=$id;");
                $connection->close_connection();

                foreach ($products as $product) {
                    $content .= get_product_tile($product,true);
                }
                
                $content .= "</div>";
            
            }else{
                $content .= '<p>Categoria non trovata</p>';
            }

        }
    }
    else{
        $content .= getDBConnectionError();
    }

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);

    echo replace_in_page($template,$title,$pageID,$breadcrumbs,html_entity_decode($keywords),$descrizione,$content,'addScrollEventListener()');
?>