<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'prodotti';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Prodotti</p>';

    if(!isLoggedIn()){

        $content = '<p class="message errorMsg">Attenzione non disponi dei privilegi necessari per accede a questa pagina.</p>';

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

                
                $content .= '<article class="listItem">';
                    $content .= '<span>'.parse_lang($review['product']).'</span>';

                    if($review['contenuto']=='' && $review['punteggio']==0)
                        $content .= '<a href="recensione.php?id='.$review['id'].'" class="btn btn-green">Inserisci</a>';
                    else
                    $content .= '<a href="recensione.php?id='.$review['id'].'" class="btn btn-info">Vedi</a>';
                $content .= '</article>';

            }

        }else{
            $content .= getDBConnectionError(true);
        }

    }

    $menu = get_user_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    $template = str_replace('{{onload}}','',$template);

    $template = str_replace('{{title}}',$title,$template);
    $template = str_replace('{{breadcrumbs}}',$breadcrumbs,$template);
    $template = str_replace('{{content}}',$content,$template);

    echo $template;

?>  