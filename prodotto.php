<?php
    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $connection = new DBAccess;

    $pageID = 'prodotto';
    $title  = '';
    $breadcrumbs = '';
    $content = '';
    $descrizione = '';

    if ($connection->open_connection()) {
        
        if(isset($_GET['id'])){

            $id = intval(sanitize($_GET['id'],''));
            $products = $connection->exec_select_query("SELECT id, nome, immagine, altImmagine, descrizione, origine, marca, modello, dimensione, peso, categoria, prezzo FROM prodotto WHERE id=$id;");

            if(count($products)){

                $product = $products[0];

                $breadcrumbs = '<p>Ti trovi in: <a href="/" lang="en">Home</a> >  <a href="prodotti.php">Prodotti</a> > '.parse_lang($product['nome']).'</p> ';
                
                $title = parse_lang($product['nome'],true) . ' - Pop Tech';

                $content .= file_get_contents('layouts/prodotto.html');

                $content = str_replace('{{nome}}',parse_lang($product['nome']),$content);
                $content = str_replace('{{immagine}}',$product['immagine'],$content);
                $content = str_replace('{{altImmagine}}',$product['altImmagine'],$content);
                $content = str_replace('{{descrizione}}',$product['descrizione'],$content);
                $content = str_replace('{{origine}}',$product['origine'],$content);
                $content = str_replace('{{marca}}',$product['marca'],$content);
                $content = str_replace('{{modello}}',$product['modello'],$content);
                $content = str_replace('{{dimensioni}}',parse_abbr($product['dimensione']),$content);
                $content = str_replace('{{peso}}',parse_abbr($product['peso']),$content);
                $content = str_replace('{{categoria}}',$product['categoria'],$content);
                $content = str_replace('{{prezzo}}',$product['prezzo'],$content);

                $descrizione = $product['descrizione'];
            }else{
               
                $content .= '<p>Prodotto non trovato</p>';
            }
        }
    }else{
        $content = '<h1>Prodotto</h1>';
        $breadcrumbs = '<p>Ti trovi in: Home > Prodotto</p> ';
        $title = "Prodotto - Pop Tech";
        $content .= '<p class="error">I sistemi sono momentaneamente fuori servizio. Ci scusiamo per il disagio.</p>
        <img class="error_image" src="images/comic_error.png">';
    }

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);

    echo replace_in_page($template,$title,$pageID,$breadcrumbs, 'keywords', $descrizione, $content);
?>