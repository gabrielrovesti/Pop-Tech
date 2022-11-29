<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">

    <title>Contatti - Pop Tech</title>
        <meta name="description" content="Contatti | PopTech">
        <meta name="keywords" content="PopTech, videogiochi, manga, giochi da tavolo, storia">
        <meta name="author" content="PopTech">

        <!-- Includi i link ai file di stile CSS e script Javascript -->
        <?php include "includes/inports.php"; ?>
        
</head>
<body>

    <a href="#content" class="srOnly">Vai al contenuto</a>
	
    <?php include "includes/header.php"; ?>
    <?php include "includes/menu.php"; ?>

    <nav id="breadcrumbs" aria-label="breadcrumb">
        <p>Ti trovi in: Contatti</p> 
    </nav>

    <main id="content">

            <h1>Contatti</h1>

            <div id="contatti">

                <div>          

                    <h2>Modulo Richieste</h2>

                    <form action="/" method="POST">

                        <label for="Nome">Nome</label>
                        <input type="text" id="Nome" name="Nome" placeholder="Nome">
                        
                        <label for="Cognome">Cognome</label>
                        <input type="text" id="Cognome" name="Cognome" placeholder="Cognome">
                    
                        <!-- types email & tel? -->
                        <label for="E-mail"><span lang="en">E-mail</span></label>
                        <input type="text" id="E-mail" name="E-mail" placeholder="E-mail">
                        
                        <label for="Telefono">Telefono</label>
                        <input type="text" id="Telefono" name="Telefono" placeholder="Telefono">
                    
                        <label for="Messaggio">Messaggio</label>
                        <textarea id="Messaggio" name="Messaggio" placeholder="Inserisci qui il tuo messaggio"></textarea>

                        <!-- CI VA IL SPAN LANG NELLE ETICHETTE?-->
                        <label for="privacypolicy"><input type="checkbox" id="privacypolicy" name="privacy" value="privacy">Accetta la nostra <span lang="en">Privacy Policy</span></label>

                        <!-- Bottoni -->
                        <a href="" class="button" title="Bottone Invia">Invia</a>
                        <a href="" class="button" title="Bottone Reset">Cancella</a>
                    </form>
                </div>
                <div>
                    <h2>Dove Siamo</h2>
                    <p>
                        Via Gattamelata 123 Padova <abbr title="Padova">PD</abbr>
                    </p>
                    <!-- Bottoni-->
                    <a href="" class="button" title="Bottone Google Maps"><span lang="en">Google Maps</span></a>            
                    <a href="" class="button" title="Bottone Apple Maps"><span lang="en">Apple Maps</span></a>

                    <h2>Chiamaci</h2>
                    <a href="tel:+39049123456">049 123456</a>

                    <h2>Scrivici</h2>
                    <a href="mailto:info@comics.it">info@comics.it</a>

                    <h2>Orari</h2>
                    
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th scope="col">Mattina</th>
                                <th scope="col">Pomeriggio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Lunedì</th>
                                <td data-title="Mattina"><time datetime="10:00">10:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th scope="row">Martedì</th>
                                <td data-title="Mattina"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th scope="row">Mercoledì</th>
                                <td data-title="Mattina"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th scope="row">Giovedì</th>
                                <td data-title="Mattina"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th scope="row">Venerdì</th>
                                <td data-title="Mattina"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio"><time datetime="15:00">15:00</time> - <time datetime="19:00">19:00</time></td>
                            </tr>
                            <tr>
                                <th scope="row">Sabato</th>
                                <td data-title="Mattina"><time datetime="09:00">9:00</time> - <time datetime="13:00">13:00</time></td>
                                <td data-title="Pomeriggio">Chiuso</td>
                            </tr>
                            <tr>
                                <th scope="row">Domenica</th>
                                <td colspan="2" data-title="Mattina e Pomeriggio">Chiuso</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <figure>
                    <img src="images/chisiamo2.png" class="img-right" alt="Mappa Geografica">
                    <figcaption>Test</figcaption>
                </figure>
            </div>
        </main>
    <?php include "includes/footer.php"; ?>
</body>
</html>