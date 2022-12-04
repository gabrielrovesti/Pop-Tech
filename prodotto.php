<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="utf-8">
	<title>{prodotto} - Pop Tech</title>
    <meta name="description" content=" {prodotto} | PopTech">
    <meta name="keywords" content="PopTech, videogiochi, negozio videogiochi, gaming, manga, fumetti, giochi da tavolo">
    <meta name="author" content="PopTech">
    <!-- Includi i link ai file di stile CSS e script Javascript -->
    <?php include "includes/inports.php"; ?>
</head>
<body id="prodotto">
    <a href="#content" class="srOnly">Vai al contenuto</a>
    <?php include "includes/header.php"; ?>
    <?php include "includes/menu.php"; ?>
    <nav id="breadcrumbs" aria-label="Percorso"  >
        <p>Ti trovi in: Prodotti > Ryu Gogo <span lang="en">limited Edition</span> 2020</p> 
    </nav>

    <!--Modificare il "main" con PHP in modo che diventa dimanica e adatta per tutti i prodotti che andremo a inserire nella pagina-->
	<main id="content">
        <figure><img src="images/RuyGoGo.png" alt="Nome Prodotto"></figure>
        <div>
            <h1>Ryu Gogo<span lang="en"> Limited Edition </span>2020</h1>
            <dl class="prodotto">
                <dt id="descrizione"></dt><dd>Un'iconica statuina Funko Pop! Ryu Gogo Edizione Limitata</dd>
                <dt id="prezzo"></dt><dd>50.00 €</dd>
                <dt id="categoria">Categoria</dt><dd><span lang="en">Action Figure</span></dd>
                <dt id="origine">Origine</dt><dd>Giappone</dd>
                <dt id="marca">Marca</dt><dd><span lang="en">Funko Pop</span></dd>
                <dt id="modello">Modello</dt><dd>RYU2020L</dd>
                <dt id="dimensioni">Dimensioni</dt><dd>10 <abbr title="Centimetri">cm</abbr> &times; 10 <abbr title="Centimetri">cm</abbr> &times; 10 <abbr title="Centimetri">cm</abbr></dd>
                <dt id="peso">Peso</dt><dd>10<abbr title="Grammi">g</abbr></dd><!--stessa cosa per i grammi-->
            </dl>
        </div>
	</main>
    <?php include "includes/footer.php"; ?>
</body>
</html>