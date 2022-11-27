<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="utf-8" />
    
	<title></title>
	
    <meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
    
    <link rel="stylesheet" href="styles/style.css" media="handheld,screen"  /> 
    <link rel="stylesheet" href="styles/mobile.css" media="screen and (max-width: 600px), only screen and (max-device-width: 600px)" />
    <link rel="stylesheet" href="styles/print.css" media="print" />

    <link rel="shortcut icon" type="images/png" href="images/favicon.ico" />

</head>
<body id="homePage">

    <a href="#content" class="srOnly">Vai al contenuto</a>
	
    <?php include "includes/header.php"; ?>
    <?php include "includes/menu.php"; ?>
   
    <nav id="breadcrumbs">
        <p>Ti trovi in: Prodotti > {nome categoria}</p> 
    </nav>    
   
	<main id="content">
       
        <h1>Categoria</h1> 

        <div class="productsRow">

            <?php for($j=0;$j<20;$j++){ ?>

                <article>
                    <header>
                        <img src="http://localhost/poptech/sito/images/testImg.jpg" alt="Descrizione Immagine" />
                        <h2>Product Name</h2>
                    </header>
                    <main>
                        Descrizione Descrizione Descrizione Descrizione Descrizione
                        <a href="" class="button" title="Vedi prodotto {nome prodotto}">Scopri di più</a>
                    </main>
                </article>

            <?php } ?>
        </div>

	</main>

    <?php include "includes/footer.php"; ?>
	
</body>
</html>