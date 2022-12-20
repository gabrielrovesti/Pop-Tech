<?php

    // Link da inserire
    $links = ["index.php","prodotti.php","contatti.php","faq.php","chiSiamo.php"];
    // Nomi delle voci di menu
    $names = ["Home","Prodotti","Contatti","FAQ","Chi Siamo"];
    // Lingue dei link (se diverse da Italiano)
    $langs = ["en","","","en",""];
    // Numero dei link da mostrare (grandezza array)
    $nLinks = count($links);

    //Togliere dall'url restituito da PHP -- cambierà in base all'hosting (probilmente non sará necessario in fase di consegna)
    $strToRemove = "/poptech/sito/";
    $currentPage = str_replace($strToRemove,"",$_SERVER['REQUEST_URI']);
?>


<nav id="menu">
    <ul>   
        <?php for($i=0;$i<$nLinks;$i++){
           //Se la pagina in qui sono è uguale al link che sto esaminando
           //mostra solo il testo senza link
           if($currentPage==$links[$i]){?>
                <li id="currentLink" <?php if($langs[$i]) echo('lang="'.$langs[$i].'"'); ?> ><?php echo($names[$i]); ?></li>
            <?php }else{ 
                //Altrimenti mostra il link con il tag anchor ?>
                <li><a href="<?php echo($links[$i]); ?>" <?php if($langs[$i]) echo('lang="'.$langs[$i].'"'); ?> ><?php echo($names[$i]); ?></a></li>
            <?php } //fine else  ?>
        <?php } //fine for ?>
        <a href="accedi.php" id="login_link">Accedi</a>
    </ul>
    
</nav>

