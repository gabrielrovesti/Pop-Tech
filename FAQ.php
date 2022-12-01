<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <title>FAQ - Pop Tech</title>
    <meta name="description" content="Domande Frequenti | PopTech">
    <meta name="keywords" content="PopTech, videogiochi, negozio videogiochi, gaming, manga, fumetti, giochi da tavolo, faq, domande, tempi consegna">
    <meta name="author" content="PopTech">
        <!-- Includi i link ai file di stile CSS e script Javascript -->
        <?php include "includes/inports.php"; ?>
</head>
<body>

    <a href="#content" class="srOnly">Vai al contenuto</a>
	
    <?php include "includes/header.php"; ?>
    <?php include "includes/menu.php"; ?>

    <nav id="breadcrumbs" aria-label="breadcrumb">
        <p>Ti trovi in: <abbr title="Frequently Asked Questions" lang="en">FAQ</abbr></p> 
    </nav>

    <main id="content">
        <h1><abbr title="Frequently Asked Questions" lang="en">FAQ</abbr></h1>
        <?php for($i=0;$i<5;$i++){ ?>
            <details>
                <summary>Details</summary>
                Something small enough to escape casual notice.
            </details>
        <?php } ?>
            
    </main>

    <?php include "includes/footer.php"; ?>
</body>
</html>