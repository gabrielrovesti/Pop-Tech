<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="utf-8" />
    
	<title>{prodotto} - Pop Tech</title>
	
    <meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
    
    <!-- Includi i link ai file di stile CSS e script Javascript -->
    <?php include "includes/inports.php"; ?>

</head>
<body id="homePage">

    <a href="#content" class="srOnly">Vai al contenuto</a>
	
    <?php include "includes/header.php"; ?>
    <?php include "includes/menu.php"; ?>
   
    <nav id="breadcrumbs">
        <p>Ti trovi in: <span lang="en">Home</span> > Prodotti</p> 
    </nav>    
   
	<main id="content">

        <h1>I Nostri Prodotti</h1>
       
        <?php for($i=0;$i<5;$i++){ ?>

        <h2 class="categoryTitle">Categoria</h2> <a href="categoria.php" title="Vedi tutti {categoria}" class="button">Vedi Tutti</a>

        <div class="productsRow">

            <?php for($j=0;$j<5;$j++){ ?>

                <article>
                    <header>
                        <img src="http://localhost/poptech/sito/images/testImg.jpg" alt="Descrizione Immagine" />
                        <h3>Product Name</h3>
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