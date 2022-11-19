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
        <p>Ti trovi in: <span lang="en">Home</span> > Prodotti</p> 
    </nav>    
   
	<main id="content">
       
        <?php for($i=0;$i<5;$i++){ ?>

        <h3 class="categoryTitle">Categoria</h3> <a href="categoria.php" title="Vedi tutti {categoria}" class="button">Vedi Tutti</a>

        <div class="productsRow">

            <?php for($j=0;$j<5;$j++){ ?>

                <article>
                    <header>
                        <img src="http://localhost/PromoTech-Graphics/sito/images/testImg.jpg" alt="Descrizione Immagine" />
                        <h4>Product Name</h4>
                    </header>
                    <main>
                        Descrizione Descrizione Descrizione Descrizione Descrizione
                        <a href="" class="button" title="Vedi prodotto {nome prodotto}">Scopri di più</a>
                    </main>
                </article>

            <?php } ?>
        </div>

        <?php } ?>
	</main>

    <?php include "includes/footer.php"; ?>
	
</body>
</html>