<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'prodotti';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Prodotti</p>';

    if(!isLoggedIn(true)){

        $content = '<p class="message errorMsg">Attenzione: non disponi dei privilegi necessari per accede a questa pagina.</p>';

    }else{

        $content = "<h1>Prodotti</h1>";

        $content .= '<a href="prodotto.php" class="btn btn-green">Aggiungi Prodotto</a>';

        $connection = new DBAccess();

        if($connection->open_connection()){

            $products = $connection->exec_select_query('SELECT id, nome FROM prodotto ORDER BY nome;');
            $connection->close_connection();

            foreach($products as $product){
                
                $content .= '<div class="listItem">';
                    $content .= '<span>'.parse_lang($product['nome']).'</span>';
                    $content .= '<a href="prodotto.php?id='.$product['id'].'" class="btn btn-info">Modifica</a>';
                    $content .= '<a href="delete.php?id='.$product['id'].'&type=prodotto" class="btn btn-danger">Elimina</a>';
                $content .= '</div>';

            }

        }else{
            $content .= getDBConnectionError(true);
        }

    }

    $menu = get_admin_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{onload}}','',$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>