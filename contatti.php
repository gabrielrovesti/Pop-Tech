<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">

    <title>Contatti - Pop Tech</title>
    <meta name="description" content="Contatti | PopTech">
    <meta name="keywords" content="PopTech, videogiochi, negozio videogiochi, gaming, manga, fumetti, giochi da tavolo, indirizzo, telefono, contattaci, contatti">
    <meta name="author" content="PopTech">

    <!-- Includi i link ai file di stile CSS e script Javascript -->
    <?php include "includes/inports.php"; ?>
        
</head>
<body>

    <a href="#content" class="srOnly">Vai al contenuto</a>
	
    <?php include "includes/header.php"; ?>
    <?php include "includes/menu.php"; ?>

    <nav id="breadcrumbs" aria-label="Percorso" role="navigation">
        <p>Ti trovi in: Contatti</p> 
    </nav>

    <main id="content">

            <h1>Contatti</h1>

            <div id="contatti">

                <div>          

                    <h2>Modulo Richieste</h2>

                    <form action="/" method="POST">

                        <label for="Nome">Nome</label>
                        <input type="text" id="Nome" name="Nome" placeholder="Nome" required="required" aria-required="true" data-msg-required="Per favore, inserisci il tuo nome" data-msg-invalid="Formato testo non corretto">
                        
                        <label for="Cognome">Cognome</label>
                        <input type="text" id="Cognome" name="Cognome" placeholder="Cognome" required="required" aria-required="true" data-msg-required="Per favore, inserisci il tuo cognome" data-msg-invalid="Formato testo non corretto">
                    
                        <!-- types email & tel? -->
                        <label for="E-mail"><span lang="en">E-mail</span></label>
                        <input type="email" id="E-mail" name="E-mail" placeholder="E-mail" required="required" aria-required="true" data-msg-required="Per favore, inserisci la tua casella di posta" data-msg-invalid="Formato non corretto">
                        
                        <label for="Telefono">Telefono</label>
                        <input type="tel" id="Telefono" name="Telefono" placeholder="Telefono" required="required" aria-required="true" data-msg-required="Per favore, inserisci il tuo numero di telefono" data-msg-invalid="Formato telefono non corretto">
                    
                        <label for="Messaggio">Messaggio</label>
                        <textarea id="Messaggio" name="Messaggio" placeholder="Inserisci qui il tuo messaggio" required="required" aria-required="true" data-msg-required="Per favore, inserisci il tuo messaggio" data-msg-invalid="Formato testo non corretto"></textarea>

                        <!-- CI VA IL SPAN LANG NELLE ETICHETTE?-->
                        <label for="privacypolicy"><input type="checkbox" id="privacypolicy" name="privacy" value="privacy">Accetta la nostra <span lang="en">Privacy Policy</span></label>

                        <!-- Bottoni -->
                        <a href="" class="button" title="Bottone Invia" tabindex=1>Invia</a>
                        <a href="" class="button" title="Bottone Reset" tabindex=2>Cancella</a>
                    </form>
                </div>
                <div>
                    <h2>Dove Siamo</h2>
                    <p>
                        Via Gattamelata 123 Padova <abbr title="Padova">PD</abbr>
                    </p>
                    <!-- Bottoni-->
                    <a href="" class="button" title="Bottone Google Maps" tabindex=3><span lang="en">Google Maps</span></a>            
                    <a href="" class="button" title="Bottone Apple Maps" tabindex=4><span lang="en">Apple Maps</span></a>

                    <h2>Chiamaci</h2>
                    <a href="tel:+39049123456" tabindex=5>049 123456</a>

                    <h2>Scrivici</h2>
                    <a href="mailto:info@comics.it" tabindex=6>info@comics.it</a>

                    <h2>Orari</h2>
                    
                    <table summary="Nella Tabella viene fornito in modo dettagliato gli orari di apertura e di chiusura del negozio. Ogni riga indica il giorno e gli orari di apertura e di chiusura di mattina e di pomeriggio">
                        <thead>
                            <tr>
                                <th></th>
                                <th id="p1" scope="col" axis="periodo">Mattina</th>
                                <th id="p2" scope="col" axis="periodo">Pomeriggio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th id="g1" scope="row" axis="giorno">Lunedì</th>
                                <td data-title="Mattina" headers="p1 g1"><time datetime="10:00">10:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio" headers="p2 g1"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th id="g2" scope="row" axis="giorno">Martedì</th>
                                <td data-title="Mattina" headers="p1 g2"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio" headers="p2 g2"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th id="g3" scope="row" axis="giorno">Mercoledì</th>
                                <td data-title="Mattina" headers="p1 g3"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio" headers="p2 g3"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th id="g4" scope="row" axis="giorno">Giovedì</th>
                                <td data-title="Mattina" headers="p1 g4"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio" headers="p2 g4"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th id="g5" scope="row" axis="giorno">Venerdì</th>
                                <td data-title="Mattina" headers="p1 g5"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio" headers="p2 g5"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th id="g6" scope="row" axis="giorno">Sabato</th>
                                <td data-title="Mattina" headers="p1 g6"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio" headers="p2 g6">Chiuso</td>
                            </tr>
                            <tr>
                                <th id="g7" scope="row" axis="giorno">Domenica</th>
                                <td colspan="2" data-title="Mattina e Pomeriggio">Chiuso</td>  <!--qui come metto gli headers? -->
                            </tr>
                        </tbody>
                    </table>
                </div>
                <figure>
                    <img src="images/chisiamo2.png" alt="Posizione dell'azienda in una mappa geografica">
                    <figcaption>Test</figcaption>
                </figure>
            </div>
        </main>
    <?php include "includes/footer.php"; ?>
</body>
</html>