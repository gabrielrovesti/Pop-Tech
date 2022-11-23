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
        <p>Ti trovi in: Ryu Gogo <span lang="en">limited Edition</span> 2020</p> 
    </nav>

    <!--modificare il main con php in modo che diventa dimanica e adatta per tutti i prodotti che andremo a inserire nella pagina-->
	<main id="content">
        <h1>Ryu Gogo limited Edition 2020</h1>
        <img src="images/RuyGoGo.png" alt="Nome Prodotto" />
        <dl>
            <dd id="descrizione">Ut enim ex repellendus aut eum fugit culpa. Eos a quia nisi nostrum. Omnis sit id quam deserunt harum. Hic magni sapiente distinctio quo et. Sint numquam rem quia in aut praesentium. Assumenda atque neque ipsum nisi nobis.</dd>
            <dd id="prezzo">50,00 €</dd> <!--per € ci vuole una particolare combinazione di lettere?-->
            <dt>Categoria</dt><dd>Action Figure</dd>
            <dt>Origine</dt><dd>Giappone</dd>
            <dt>Marca</dt><dd>Funko Pop</dd>
            <dt>Modello</dt><dd>RYU2020L</dd>
            <dt>Dimensioni</dt><dd>10cm x 10 cm x 10cm</dd> <!--come faccio in modo che la x venga letta per?-->
            <dt>Peso</dt><dd>10g</dd><!--stessa cosa per i grammi-->
        </dl>
	</main>

    <?php include "includes/footer.php"; ?>
	
</body>
</html>