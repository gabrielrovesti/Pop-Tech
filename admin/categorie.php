<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'homePage';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Categorie</p>';

    if(!isLoggedIn(true)){

        $content = '<p class="message errorMsg">Attenzione non disponi dei privilegi necessari per accede a questa pagina.</p>';

    }else{

        $content = "<h1>Categorie</h1>";

        $content .= '<a href="categoria.php" class="btn btn-green" aria-label="button">Aggiungi Categoria</a>';

        $connection = new DBAccess();

        if($connection->open_connection()){

            $categories = $connection->exec_select_query('SELECT id, nome FROM categoria ORDER BY nome;');
            $connection->close_connection();

            foreach($categories as $category){
                
                $content .= '<article class="listItem">';
                    $content .= '<span>'.parse_lang($category['nome']).'</span>';
                    $content .= '<a href="categoria.php?id='.$category['id'].'" class="btn btn-info" aria-label="button">Modifica</a>';
                    $content .= '<a href="delete.php?id='.$category['id'].'&type=categoria" class="btn btn-danger" aria-label="button">Elimina</a>';
                $content .= '</article>';

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