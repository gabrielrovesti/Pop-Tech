 <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />


    <title>FAQ - Pop Tech</title>
        <meta name="description" content="FAQ | PopTech">
        <meta name="keywords" content="PopTech, videogiochi, manga, giochi da tavolo, storia">
        <meta name="author" content="PopTech">

   
<meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="styles/style.css" media="handheld,screen"  /> 
        <link rel="stylesheet" href="styles/mobile.css" media="screen and (max-width: 600px), only screen and (max-device-width: 600px)" />
        <link rel="stylesheet" href="styles/print.css" media="print" />
        
        <link rel="shortcut icon" href="../images/favicon.ico">
</head>
<body>

    <a href="#content" class="srOnly">Vai al contenuto</a>
	
    <?php include "includes/header.php"; ?>
    <?php include "includes/menu.php"; ?>

     <nav id="breadcrumbs">
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