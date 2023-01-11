<?php

    require_once "../includes/connection.php";
    require_once "../includes/utilities.php";

    use DB\DBAccess;

    session_start();

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'marche';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: Marche</p>';

    if(!isLoggedIn(true)){

        $content = getAdminLoggedOutError();

    }else{

        $content = "<h1>Marche</h1>";

        $content .= '<a href="marca.php" class="btn btn-green">Aggiungi Marca</a>';

        $connection = new DBAccess();

        if($connection->open_connection()){

            $brands = $connection->exec_select_query('SELECT id, nome FROM marca ORDER BY nome;');
            $connection->close_connection();

            foreach($brands as $brand){
                
                $content .= '<div class="listItem">';
                    $content .= '<span>'.parse_lang($brand['nome']).'</span>';
                    $content .= '<span><a href="marca.php?id='.$brand['id'].'" class="btn btn-info" title="Modifica '.parse_lang($brand['nome'],true).'">Modifica</a>';
                    $content .= '<a href="delete.php?id='.$brand['id'].'&type=marca" class="btn btn-danger" title="Elimina '.parse_lang($brand['nome'],true).'">Elimina</a></span>';
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