<!DOCTYPE html>
<html lang="it">
    <head>
        <meta charset="utf-8">
        <title>Registrati - Pop Tech</title>
        <meta name="description" content="Registrati | PopTech">
        <meta name="keywords" content="PopTech, videogiochi, fumetti, giochi da tavolo, accedi, login">
        <meta name="author" content="PopTech">

        <!-- Includi i link ai file di stile CSS e script Javascript -->
        <?php require_once("includes/inports.php"); ?>

    </head>
    <body id="chiSiamo">

        <a href="#content" class="srOnly">Vai al contenuto</a>

        <?php require_once("includes/header.php"); ?>
        <?php require_once("includes/menu.php"); ?>
       
        <nav id="breadcrumbs" aria-label="Percorso" >
        <p>Ti trovi in: Accedi</p> 
        </nav>  

        <main id="content">
            <form action="/" method="POST" id="inputForm">
                <fieldset>
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" placeholder="Inserisci la tua email"  required="required" aria-required="true" data-msg-required="Per favore, inserisci il tuo indirizzo e-mail" data-msg-invalid="Formato e-mail non corretto">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" placeholder="Inserisci la tua password" required="required" aria-required="true" data-msg-required="Per favore, inserisci la tua password" data-msg-invalid="Formato password non corretto">
                    <label for="password_new">Ripeti password</label>
                    <input type="password_new" name="password_new" id="password_new" placeholder="Ripeti password" required="required" aria-required="true" data-msg-required="Per favore, ripeti la password" data-msg-invalid="La password ripetuta è diversa dalla precedente">
                </fieldset>
            <input type="submit" name="Registrati" value="Registrati">
            <label><input type="checkbox" checked="checked" name="Ricordami">Ricordami</label>
        </form>
        <p>Sei già registrato? <a href="accedi.php">Accedi</a>!</p>
        </main>
        <?php require_once("includes/footer.php");?>
    </body>
</html>