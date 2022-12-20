<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $connection = new DBAccess;

    if ($connection->open_connection()) {
        $content = '<h1>I Nostri Prodotti</h1>';
        //$category = $connection->exec_select_query('SELECT categoria.nome FROM categoria, prodotto WHERE prodotto.categoria=categoria.nome;');
        //da modificare per prendere la categoria inerente al link, giusta come idea e codice
        $content .= '<h2 class="categoryTitle">Categoria</h2> <a href="categoria.php?id=1" class="button">Vedi Tutti</a>';

        $products = $connection->exec_select_query('SELECT id, nome, altimmagine, descrizione, origine, marca, modello, dimensione, peso, categoria, prezzo FROM prodotto;');
        
        foreach($products as $product){
            $content = '<h1>'.parse_lang($product['nome']).'</h1>';
            $breadcrumbs = '<p>Ti trovi in:'.parse_lang($product['nome']).'</p> ';
            $pageID = parse_lang($product['nome']);
            $title = parse_lang($product['nome']) . ' - Pop Tech';

            //$content .= '<h2 class="categoryTitle">'.parse_lang($category['nome']).'</h2>';
            //$content .= '<a href="categoria.php?id='.$category['id'].'" title="Vedi tutti i prodotti in '.parse_lang($category['nome']).'" class="button">Vedi Tutti</a>';
            
            $content .= '<h2 class="categoryTitle">Categoria</h2>';
            $content .= '<a href="categoria.php?id=1" class="button">Vedi Tutti</a>';
            
            $content .= '<div class="productsRow">';

            $content .= '<article> 
            <header>
                <img src="images/testImg.jpg" alt="Descrizione Immagine">
                <h2>Product Name</h2>
            </header>
            Descrizione Descrizione Descrizione Descrizione Descrizione
            <a href="" class="button" title="Vedi prodotto ' . parse_lang($product['nome']) . '">Scopri di più</a></article>';
        }
        $content .= "</div>";
    }
    else{
        $content = "<h1>I Nostri Prodotti</h1>";
        $breadcrumbs = '<p>Ti trovi in: Home > Prodotti</p> ';
        $pageID = 'Prodotti';
        $title = "Prodotti - Pop Tech";
        $content .= '<p>I sistemi sono momentaneamente fuori servizio. Ci scusiamo per il disagio.</p>';
    }

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{keywords}}', parse_lang($product['descrizione']), $template);
    $template = str_replace('{{description}}', parse_lang($product['descrizione']), $template);
    echo replace_in_page($template,$title,$pageID,$breadcrumbs,$content);
?>

