<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'area_utente';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Area Utente &gt; Recensioni</p>';

    if(!isLoggedIn()){

        $content = getAdminLoggedOutError();

    }else{

        $content = "<h1>Le tue Recensioni</h1>";

        $userid = $_SESSION['user'];

        $connection = new DBAccess();

        if($connection->open_connection()){

            $reviews = $connection->exec_select_query('SELECT recensione.id, recensione.contenuto, recensione.punteggio, prodotto.nome AS product FROM recensione, prodotto WHERE recensione.utente='.$userid.' AND recensione.prodotto=prodotto.id;');
            $connection->close_connection();

            if(count($reviews)==0){
                $content .= '<p>Nessuna recensione disponibile.</p>';
            }

            foreach($reviews as $review){
                $content .= '<div class="listItem">';
                    $content .= '<span>'.parse_lang($review['product']).'</span>';

                    if($review['contenuto']=='' && $review['punteggio']==0)
                        $content .= '<a href="recensione.php?id='.$review['id'].'" class="button" title="Inserisci recensione di '.parse_lang($review['product'],true).'">Inserisci</a>';
                    else
                    $content .= '<a href="recensione.php?id='.$review['id'].'" class="button" title="Vedi recensione di '.parse_lang($review['product'],true).'">Vedi</a>';
                $content .= '</div>';

            }

        }else{
            $content .= getDBConnectionError(true);
        }

    }

    $menu = get_user_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{pageID}}',$pageID,$template);
    echo replace_in_user_page($template,$title,$pageID,$breadcrumbs,$content, '');
?>  