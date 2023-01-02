<?php

    require_once "includes/connection.php";
    require_once "includes/utilities.php";

    use DB\DBAccess;

    $template = file_get_contents('layouts/layout.html');

    $pageID = 'FAQ';
    $title = "FAQ - Pop Tech";
    $breadcrumbs = '<p>Ti trovi in: <a href="/" lang="en">Home</a> > <abbr title="Frequently Asked Questions" lang="en">FAQ</abbr></p> ';

    $content = '<h1><abbr title="Frequently Asked Questions" lang="en">FAQ</abbr></h1>';

    $connection = new DBAccess;

    $content .= '<div class="faqRow">';

    if ($connection->open_connection()) {
        $faqs = $connection->exec_select_query('SELECT id, domanda, risposta FROM faq;');
        foreach($faqs as $faq){

            $content .= '<details open="">
                    <summary class="comic_box">'.parse_lang($faq['domanda']).'</summary>
                    <p class="comic_box2">'.parse_lang($faq['risposta']).'</p>
            </details>';
        }

        $content .= "</div>";
    }else{
        $content .= '<p class="error">I sistemi sono momentaneamente fuori servizio. Ci scusiamo per il disagio.</p>
        <img class="error_image" src="images/comic_error.png">';
    }

    $menu = get_menu();
    $template = str_replace('{{menu}}',$menu,$template);
    echo replace_in_page($template,$title,$pageID,$breadcrumbs,'keywords','description',$content);
?>