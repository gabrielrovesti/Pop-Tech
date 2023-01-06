<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'faqs';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <abbr title="Frequently Asked Questions" lang="en">FAQ</abbr></p>';

    if(!isLoggedIn(true)){

        $content = '<p class="message errorMsg">Attenzione: non disponi dei privilegi necessari per accede a questa pagina.</p>';

    }else{

        $content = "<h1>FAQ</h1>";

        $content .= '<a href="faq.php" class="btn btn-green"> Aggiungi FAQ</a>';

        $connection = new DBAccess();

        if($connection->open_connection()){

            $faqs = $connection->exec_select_query('SELECT id, domanda FROM faq;');
            $connection->close_connection();

            foreach($faqs as $faq){
                
                $content .= '<div class="listItem">';
                    $content .= '<span>'.parse_lang($faq['domanda']).'</span>';
                    $content .= '<span><a href="faq.php?id='.$faq['id'].'" class="btn btn-info" title="Modifica '.parse_lang($faq['domanda'],true).'">Modifica</a>';
                    $content .= '<a href="delete.php?id='.$faq['id'].'&type=faq" class="btn btn-danger" title="Elimina '.parse_lang($faq['domanda'],true).'">Elimina</a></span>';
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