<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'recensioni';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Recensioni</p>';

    if(!isLoggedIn(true)){

        $content = getAdminLoggedOutError();

    }else{

        $content = "<h1>Recensioni</h1>";

        $content .= '<a href="recensione.php" class="btn btn-green">Aggiungi Recensione</a>';

        $connection = new DBAccess();

        if($connection->open_connection()){

            $reviews = $connection->exec_select_query('SELECT recensione.id, utente.nome AS user, prodotto.nome AS product FROM recensione, prodotto, utente WHERE recensione.utente=utente.id AND recensione.prodotto=prodotto.id;');
            $connection->close_connection();

            foreach($reviews as $review){

                $content .= '<div class="listItem">';
                    $content .= '<span>'.$review['user'].' - ';
                    $content .= parse_lang($review['product']).'</span>';
                    $content .= '<span><a href="recensione.php?id='.$review['id'].'" class="btn btn-info" title="Modifica '.parse_lang($review['product'],true).' di '.$review['user'].'">Modifica</a>';
                    $content .= '<a href="delete.php?id='.$review['id'].'&type=recensione" class="btn btn-danger" title="Elimina '.parse_lang($review['product'],true).' di '.$review['user'].'">Elimina</a></span>';
                $content .= '</div>';

            }

        }else{
            $content .= getDBConnectionError(true);
        }

    }

    $menu = get_admin_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{onload}}','',$template);
    $template = str_replace('{{pageID}}',$pageID,$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>