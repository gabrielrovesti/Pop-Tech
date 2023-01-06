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
    $keywords = '';

    if ($connection->open_connection()) {
        
        if(isset($_GET['id'])){

            $id = intval(sanitize($_GET['id'],''));
            $products = $connection->exec_select_query("SELECT id, nome, immagine, keywords, descrizione, origine, marca, modello, dimensione, peso, categoria, prezzo FROM prodotto WHERE id=$id;");
            

            if(count($products)){

                $product = $products[0];

                $breadcrumbs = '<p>Ti trovi in: <a href="index.php" lang="en">Home</a> &gt; <a href="prodotti.php">Prodotti</a> &gt; '.parse_lang($product['nome']).'</p> ';
                
                $title = parse_lang($product['nome'],true) . ' - Pop Tech';

                $content .= file_get_contents('layouts/prodotto.html');

                $categoria = "";
                $categories = $connection->exec_select_query("SELECT nome FROM categoria WHERE id=".$product['categoria'].";");
                if(isset($categories[0])){
                    $categoria = '<a href="categoria.php?id='.$product['categoria'].'">'.$categories[0]['nome'].'</a>';
                }

                $marca = "";
                $brands = $connection->exec_select_query("SELECT nome FROM marca WHERE id=".$product['marca'].";");
                if(isset($brands[0])){
                    $marca = $brands[0]['nome'];
                }

                $content = str_replace('{{nome}}',parse_lang($product['nome']),$content);
                $content = str_replace('{{immagine}}',$product['immagine'],$content);
                $content = str_replace('{{descrizione}}',parse_lang($product['descrizione']),$content);
                $content = str_replace('{{origine}}',$product['origine'],$content);
                $content = str_replace('{{marca}}',$marca,$content);
                $content = str_replace('{{modello}}',$product['modello'],$content);
                $content = str_replace('{{dimensioni}}',parse_abbr($product['dimensione']),$content);
                $content = str_replace('{{peso}}',parse_abbr($product['peso']),$content);
                $content = str_replace('{{categoria}}',$categoria,$content);
                $content = str_replace('{{prezzo}}',$product['prezzo'],$content);

                $descrizione = parse_lang(strip_tags($product['descrizione']),true);
                $keywords    = $product['keywords'];

                $feedbacks = $connection->exec_select_query("SELECT contenuto, punteggio FROM recensione WHERE prodotto=$id;"); 
                $connection->close_connection();

                foreach($feedbacks as $feedback){
                    $content .= '<div class="comic_box">';
                    $i=0;
                    for(;$i<intval($feedback['punteggio']);$i++){
                        $content .= '<img src="images/stella_piena.svg" />';
                    }
                    if(intval($feedback['punteggio'])!=$feedback['punteggio']){
                        $content .= '<img src="images/stella_mezza.svg" />';
                        $i++;
                    }
                    for(;$i<5;$i++){
                        $content .= '<img src="images/stella_vuota.svg" />';
                    }
                    $content.='<p>'.$feedback['contenuto'].'</p></div>';
                }

            }else{
               
                $content .= '<p>Prodotto non trovato</p>';
            }
        }
    }else{
        $breadcrumbs = '<p>Ti trovi in: <a href="index.php" lang="en">Home</a> &gt; <a href="prodotti.php">Prodotti</a> &gt; Prodotto</p> ';
        $content .= getDBConnectionError();
    }

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);

    echo replace_in_page($template,$title,$pageID,$breadcrumbs,$keywords, $descrizione, $content);
?>