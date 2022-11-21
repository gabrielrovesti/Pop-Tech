<html>
    <head>
        <meta charset="utf-8">
        <title>Chi siamo</title>
        <meta name="description" content="Chi Siamo | PopTech">
        <meta name="keywords" content="PopTech, videogiochi, manga, giochi da tavolo, storia">
        <meta name="author" content="PopTech">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../styles/style.css" media="screen">
        <link rel="stylesheet" href="../styles/print.css" media="print">
        <link rel="stylesheet" href="../styles/mobile.css" media="screen and (max-width: 480px)">
        <link rel="shortcut icon" href="../images/favicon.ico">
    </head>
    <body>
        <header>
            <!-- Include PHP header file-->
            <?php include 'includes/header.php'; ?>
        </header>
        <nav id="menu">
            <!-- Include PHP menu file-->
            <?php include 'includes/menu.php'; ?>
        </nav>
       
        <main>

        <h1>Chi siamo</h1>

        <section class="container">
            <div class="left-half">
                <article>
                    <img src="images/chisiamo1.png" class="image" alt="Storia dell'azienda">
                </article>
            </div>

            <div class="right-half">
                <article>
                    <h2>Storia e Dove Siamo</h2>
                <p>
                    La nostra azienda nasce nel 2001, da un gruppo di amici colleghi di università.
                    Ben presto, si è capito che oltre al comune interesse per l'informatica, c'era molto di più
                    che ci univa: la passione per i videogiochi, i manga, i giochi da tavolo e la storia.
                    Intuendo le potenzialità di Internet, abbiamo deciso di creare un sito web per condividere
                    le nostre passioni con il resto del mondo. Così è nata PopTech, che oggi è diventata un
                    punto di riferimento per gli appassionati del settore, sia in Italia che all'estero.
                </p>
    
                <p>
                    I tempi cambiano, ma la nostra passione rimane la stessa. Per questo, abbiamo deciso di
                    ampliare progressivamente la nostra offerta, così come i nostri interessi, per venire incontro
                    ad un pubblico sempre più vasto e variegato.
                </p>
    
                <p>
                    Ci troviamo a Padova, in via Trieste 12, in un palazzo storico del 1900.
                    La nostra sede è situata al primo piano, e si affaccia su una delle vie più
                    importanti della città, vicino alla stazione e raggiungibile con ogni mezzo.
                    Nel corso del tempo, abbiamo affrontato diversi
                    cambiamenti ed espansioni e, a seguito dell'ultima ristrutturazione nel 2015,
                    abbiamo incluso anche un laboratorio di videogiochi, dove poter testare i
                    nostri prodotti prima di metterli in vendita.
                </p> 
                </article>
            </div>
        </section>

        <section class="container">
            <div class="left-half">
                <article>
                    <h2>Il nostro <span lang="en">staff</span></h2>
                    <p>
                        Per noi, il lavoro è un gioco e la passione è il nostro motore.
                        Per questo, abbiamo scelto di lavorare in un ambiente giovane e dinamico,
                        dove il contatto con le persone e lo scambio di consigli, opinioni e idee
                        è alla base della nostra idea di lavoro.
                        Le persone contano per noi, e per questo abbiamo creato un team di
                        professionisti altamente qualificati, che si occupano di ogni aspetto
                        della nostra attività.
                    </p>
                </article>
            </div>

            <div class="right-half">
                <article>
                    <img src="images/chisiamo2.png" class="image" alt="Luogo dell'azienda">
                </article>
            </div>
        </section>
            
        </main>
        <footer>
            <!-- Include PHP footer file-->
            <?php 
                include ('includes/footer.php');
            ?>
        </footer>
    </body>
</html>