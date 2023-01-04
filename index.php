<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'homePage';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <span lang="en">Home</span></p>';

    $content = "<h1>Il tuo negozio di Fumetti e Videogiochi a Padova</h1>";

    $content .= '
        <div id="homeBanner">
            <div id="slogans">
                <ul>
                    <li>Aperti dal 2000</li>
                    <li>Edizioni Originali</li>
                    <li><span lang="en">Import USA</span> e Giappone</li>
                    <li>Taglie XL e più</li>
                    <li><span lang="en">Vintage</span> Italiano</li>
                </ul>
            </div>
            <div id="picture">
                <img src="images/home-illustration.svg" alt="" >
            </div>
        </div>';

    $connection = new DBAccess();

    if($connection->open_connection()){

        $categories = $connection->exec_select_query('SELECT id, nome FROM categoria WHERE inPrimaPagina=1;');

        //if count($categories) omesso perché non deve stampare nulla se non sono selezionate categorie da inserire in prima pagina

        foreach($categories as $category){

            $content .= '<div class="comic_box"><h2 class="categoryTitle">'.parse_lang($category['nome']).'</h2> <a href="categoria.php?id='.$category['id'].'" class="button" aria-label="Vedi i prodotti in '.parse_lang($category['nome']).'">Vedi Tutti</a></div>';

            $products = $connection->exec_select_query('SELECT id, nome, descrizione, immagine FROM prodotto WHERE categoria='.$category['id'].' ORDER BY id DESC LIMIT 5;');

            $content .= '<div class="productsRow">';

            foreach($products as $product){
                $content .= get_product_tile($product);
            }
            $content .= '</div>';
        }
        $connection->close_connection();

    }else{
        $content .= getDBConnectionError();
    }

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);

    echo replace_in_page($template,$title,$pageID,$breadcrumbs,'keywords','descrizione',$content);

?>


