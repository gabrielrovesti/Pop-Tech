<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'prodotti';
    $title = "Prodotti - Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="index.php" lang="en">Home</a> &gt; Prodotti</p> ';

    $connection = new DBAccess;

    $content = '<h1>I Nostri Prodotti</h1>';

    if ($connection->open_connection()) {
        
        $categories = $connection->exec_select_query('SELECT id, nome FROM categoria ORDER BY nome;');

        $content .= '<div class="categoryList">';
        foreach($categories as $category){
            $content .= '<a href="#cat-'.$category['id'].'" class="button">'.parse_lang($category['nome']).'</a>';
        }
        $content .= '</div>';
       
        foreach($categories as $category){

            $content .= '<div class="comic_box" id="cat-'.$category['id'].'"><h2 class="categoryTitle">'.parse_lang($category['nome']).'</h2> <a href="categoria.php?id='.$category['id'].'" class="button" title="Vedi i prodotti in '.parse_lang($category['nome']).'">Vedi Tutti</a></div>';

            $products = $connection->exec_select_query('SELECT id, nome, immagine, descrizione, origine, marca, modello, dimensione, peso, categoria, prezzo FROM prodotto WHERE categoria='.$category['id'].';');

            $content .= '<div class="productsRow">';

            foreach($products as $product){               
                
                $content .= get_product_tile($product);
            }
           
            $content .= "</div>";

        }
        $connection->close_connection();

    }else{
        $content .= getDBConnectionError();
    }

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    
    echo replace_in_page($template,$title,$pageID,$breadcrumbs,'fumetti, manga, action figures, giochi da tavolo, videogiochi, abbigliamento, abbigliamento gamer, gaming','Scopri i nostri prodotti dai Fumetti e i Manga ai Giochi da Tavolo, Videogiochi e molto altro ancora.',$content,'addScrollEventListener()');
?>

