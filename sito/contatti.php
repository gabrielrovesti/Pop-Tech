 <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />


    <title>Contatti</title>
        <meta name="description" content="Contatti | PopTech">
        <meta name="keywords" content="PopTech, videogiochi, manga, giochi da tavolo, storia">
        <meta name="author" content="PopTech">

   
<meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="styles/style.css" media="handheld,screen"  /> 
        <link rel="stylesheet" href="styles/mobile.css" media="screen and (max-width: 600px), only screen and (max-device-width: 600px)" />
        <link rel="stylesheet" href="styles/print.css" media="print" />
        
        <link rel="shortcut icon" href="../images/favicon.ico">
</head>
<body>
	
    <?php include "includes/header.php"; ?>
    <?php include "includes/menu.php"; ?>

     <nav id="breadcrumbs">
        <p>Ti trovi in: <span lang="en">Home</span> > Contatti</p> 
    </nav>





    <main id="content">
            <h1>Contatti</h1>

            <h2>Modulo Richieste</h2>


                <label for="Nome">Nome</label><br>
                <input type="text" id="Nome" name="Nome" placeholder="Nome">
                
                <label for="Cognome">Cognome</label><br>
                <input type="text" id="Cognome" name="Cognome" placeholder="Cognome">
               
                <label for="E-mail">E-mail</label><br>
                <input type="text" id="E-mail" name="E-mail" placeholder="E-mail">
                
                <label for="Telefono">Telefono</label><br>
                <input type="text" id="Telefono" name="Telefono" placeholder="Telefono">
               
                <label for="Messaggio">Messaggio</label><br>
                <textarea id="Messaggio" name="Messaggio">Inserisci qui il tuo testo...</textarea><br>



                <!-- CI VA IL SPAN LANG NELLE ETICHETTE?-->
                <input type="checkbox" id="privacypolicy" name="privacy" value="privacy"><label for="privacypolicy"> Privacy Policy</label><br>

                <!-- Bottoni-->
                <a href="" class="button" title="Bottone Invia">Invia</a>
                <a href="" class="button" title="Bottone Reset">Reset</a>
                
               



                <h2>Dove Siamo</h2>

                <p>
                    Via Gattamelata 123 Padova (PD)
                </p>
                <!-- Bottoni-->
                <!-- CI VA IL SPAN LANG NEI BOTTONI?-->
                <a href="" class="button" title="Bottone Google Maps">Google Maps</a>
                <!-- CI VA IL SPAN LANG NEI BOTTONI?-->
                <a href="" class="button" title="Bottone Apple Maps">Apple Maps</a>




                 <h2>Chiamaci</h2>

                <p>
                    049 123456
                </p>


                 <h2>Scrivici</h2>
                <p>
                    info@comics.it
                </p>

                <h2>Orari</h2>
                <p>
                    LUN 9 - 13
                    MAR 9 - 13
                    MER 9 - 13
                </p>
              
                
                
                <!--DA CAMBIARE IMMAGINE!!!!!!!!!!-->
                <img src="images/chisiamo2.png" class="img-right" alt="Mappa Geografica">
    
                 
            
            


        </main>




    <?php include "includes/footer.php"; ?>
</body>
</html>