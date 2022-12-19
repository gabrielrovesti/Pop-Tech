<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');


    $pageID = 'homePage';
    $title = "Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <span lang="en">Home</span></p>';

  

    $content = "<h1>Il tuo negozio di Fumetti e Gaming a Padova</h1>";

    $content .= '
        <div id="homeBanner">
            <div>
                <ul>
                    <li>Aperti dal 2000</li>
                    <li>Edizioni Originali</li>
                    <li><span lang="en">Import USA</span> e Giappone</li>
                    <li>Taglie XL e più</li>
                    <li><span lang="en">Vintage</span> Italiano</li>
                </ul>
            </div>
            <img src="dd" alt="Immagine banner">
        </div>';

    $connection = new DBAccess;
    

    if($connection->open_connection()){

        $categories = $connection->exec_select_query('SELECT id, nome FROM categoria WHERE inPrimaPagina=1;');

        //if count($categories) omesso perché non deve stampare nulla se non sono selezionate categorie da inserire in prima pagina

        foreach($categories as $category){

            $content .= '<h2 class="categoryTitle">'.parse_lang($category['nome']).'</h2>';
            $content .= '<a href="categoria.php?id='.$category['id'].'" title="Vedi tutti i prodotti in '.parse_lang($category['nome']).'" class="button">Vedi Tutti</a>';

            $products = $connection->exec_select_query('SELECT id, nome, descrizione, immagine, altImmagine FROM prodotto WHERE categoria='.$category['id'].' ORDER BY id DESC LIMIT 5;');

            $content .= '<div class="productsRow">';

            foreach($products as $product){

                $content .= '<article>
                                    <header>
                                        <img src="'.$product['immagine'].'" alt="'.$product['altImmagine'].'"/>
                                        <h3>'.parse_lang($product['nome']).'</h3>
                                    </header>                
                                    '.parse_lang($product['descrizione']).'
                                    <a href="/prodotto.php?id='.$product['id'].'" class="button" title="Vedi prodotto '.$product['nome'].'">Scopri di più</a>
                            </article>';


            }

            $content .= '</div>';

        }

    }else{
        $content .= '<p>I sistemi sono momentaneamente fuori servizio. Ci scusiamo per il disagio.</p>';
    }


    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);

    echo replace_in_page($template,$title,$pageID,$breadcrumbs,$content);

?>


