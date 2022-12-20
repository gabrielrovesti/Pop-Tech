<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $connection = new DBAccess;

    $pageID      = 'categoria';
    $title       = "Categoria - Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Home > Categoria</p>';
    $content     = '';

    if ($connection->open_connection()) {
            
        if(isset($_GET['id'])){

            $id = intval(sanitize($_GET['id'],''));        
            $categories = $connection->exec_select_query("SELECT id, nome FROM categoria WHERE id=$id;");

            if(count($categories)){

                $category = $categories[0];
            
                $content .= '<h1>'.parse_lang($category['nome']).'</h1>';
            
                $breadcrumbs = '<p>Ti trovi in:'.parse_lang($category['nome']).'</p> ';
                
                $title = parse_lang($category['nome']) . ' - Pop Tech';          
            
                $content .= '<div class="productsRow">';
                
                $products = $connection->exec_select_query("SELECT id, nome, immagine, altimmagine, descrizione, origine, marca, modello, dimensione, peso, categoria, prezzo FROM prodotto WHERE categoria=$id;");

                foreach ($products as $product) {
                    $content .= get_product_tile($product);
                }
                
                $content .= "</div>";
            
            }else{
                $content .= '<p>Categoria non trovata</p>';
            }

        }
    }
    else{
        $content .= " <h1>Categoria</h1>";
        $content .= '<p>I sistemi sono momentaneamente fuori servizio. Ci scusiamo per il disagio.</p>';
    }

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);

    echo replace_in_page($template,$title,$pageID,$breadcrumbs,'keywords','description',$content);
?>