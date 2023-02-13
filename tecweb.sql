-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 13, 2023 at 10:20 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poptech`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `inPrimaPagina` tinyint(1) NOT NULL,
  `keywords` varchar(500) NOT NULL,
  `descrizione` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`ID`, `nome`, `inPrimaPagina`, `keywords`, `descrizione`) VALUES
(1, 'Manga', 0, 'fumetti giapponesi,  manga fumetti, manga giapponesi, manga in giapponese, manga inglese, mang ain inglese, manga italiano, manga in italiano', 'Entra nel mondo dei fumetti Giapponesi, a partire dai classici alle nuove uscite.\r\nManga tradotti in Italiano, Inglese e in lingua originale.\r\nVieni a scoprire il nostro negozio di Padova!'),
(2, 'Fumetti', 1, 'fumetti, fumetti rari, fumetti usati, fumetti anni 90, fumetti anni 80, fumetti anni 2000', 'Dai classici agli ultimi numeri dei fumetti Italiani ed esteri!\r\nArticoli vintage rari e ultime uscite.\r\nScopri i fumetti del nostro negozio di Padova!'),
(3, 'Videogiochi', 0, 'videogiochi, console, gaming, gaming padova, videogiochi padova, sigma cast, creation center, crystal box, phantom cube', 'Entra nel mondo dei videogiochi, dai classici alle nuove uscite per tutte le console.\r\nNel nostro negozio di Padova trovi nuovo e usato testato e garantito.'),
(5, 'Abbigliamento', 1, 'berretti, tshirt, t-shirt, magliette, cappelli, felpe, apparel', 'Magliette, cappelli, felpe e molto di pi&ugrave;! Articoli originali e molto altro!\r\nScopri i prodotti abbigliamento del nostro negozio di Padova!'),
(6, 'Giochi da Tavolo', 0, 'giochi in scatola, espansioni giochi, big box, giochi da tavolo padova, boardgames, boardgames padova', 'Dai classici agli ultimi giochi da tavolo.\r\nEspansioni per giochi, edizioni speciali, special packs e molto altro!\r\nScopri i prodotti del nostro negozio di Padova!');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `ID` int(10) UNSIGNED NOT NULL,
  `domanda` text NOT NULL,
  `risposta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`ID`, `domanda`, `risposta`) VALUES
(1, 'Quanto ci mettono ad arrivare gli ordini dal Giappone?', 'Gli ordini dal Giappone impiegano circa una settimana ad arrivare nella nostra sede.'),
(2, 'É possibile ordinare articoli personalizzati?', 'Certo! Potete comunicarci il vostro ordine usando il modulo nella pagina contatti con la vostra richiesta.'),
(3, 'Vendete solo prodotti originali?', 'Certo teniamo cura di non vendere mai prodotti contraffatti.');

-- --------------------------------------------------------

--
-- Table structure for table `marca`
--

CREATE TABLE `marca` (
  `ID` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marca`
--

INSERT INTO `marca` (`ID`, `nome`) VALUES
(1, 'Fizzbuzz'),
(2, 'Swankab'),
(3, 'Avantpop'),
(4, 'Zeexy'),
(5, 'BotBaz'),
(6, 'Vivante Style');

-- --------------------------------------------------------

--
-- Table structure for table `prodotto`
--

CREATE TABLE `prodotto` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(400) NOT NULL,
  `immagine` varchar(300) NOT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `descrizione` text NOT NULL,
  `origine` varchar(100) NOT NULL,
  `marca` int(10) UNSIGNED NOT NULL,
  `modello` varchar(100) NOT NULL,
  `dimensione` varchar(200) DEFAULT NULL,
  `peso` varchar(100) DEFAULT NULL,
  `categoria` int(10) UNSIGNED NOT NULL,
  `prezzo` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prodotto`
--

INSERT INTO `prodotto` (`ID`, `nome`, `immagine`, `keywords`, `descrizione`, `origine`, `marca`, `modello`, `dimensione`, `peso`, `categoria`, `prezzo`) VALUES
(1, 'AvantPop - Craft your Art', 'uploads/board-anvantpop.jpg', 'avantpop, giochi da tavolo avantpop, giochi da tavolo, board games, board games avantpop, arte, movimento artistico', 'Porta l\'arte sempre con te con il nuovo gioco targato AvantPop.\r\nMettiti nei panni del tuo artista preferito: dai colore alla tua festa!\r\nConsigliato da 10 anni in su.', 'Italia', 3, '16068', '29.7 x 5.3 x 29.7 cm', '900 gr', 6, '20.00'),
(2, 'BotBaz - The Robot Wars', 'uploads/board-bot.jpg', 'botbaz, giochi da tavolo botbaz, giochi da tavolo, board games, board games botbaz, robot, combattimento robot', 'Distruggi i tuoi amici e nemici in questo gioco! I giocatori prendono il controllo dei loro robot personalizzati e si sfidano in un\'epica battaglia nell\'arena. Ogni giocatore inizia con un robot standard, ma può aggiornare e modificare il proprio robot con varie armi, armature e abilità speciali nel corso del gioco. \r\n\r\nL\'obiettivo del gioco è essere l\'ultimo robot in piedi nell\'arena, usando strategia, astuzia e riflessi pronti per sconfiggere gli avversari.', 'Inghilterra', 5, '22018', '29.7 x 5.3 x 29.7 cm', '800 gr', 6, '25.00'),
(3, 'Vivante - Play with your Style!', 'uploads/board-vivante.jpg', 'vivante, giochi da tavolo vivante, giochi da tavolo, board games, board games vivante, style, stile, moda, design', 'L\'obiettivo del gioco è guadagnare la massima fama e fortuna impressionando i giudici e vincendo i premi di moda. I giocatori si alternano nella scelta di nuovi materiali e accessori, nella creazione di modelli e nella realizzazione di sfilate per presentare il proprio lavoro. I punti si guadagnano se si hanno i progetti migliori, attirando l\'attenzione dei giudici e dei media!\r\n\r\nSe siete appassionati di moda, stile o semplicemente di giochi fantastici, Vivante - Design your Style! sarà sicuramente un successo per voi e per i vostri amici.', 'Francia', 6, '34512', '29.7 x 5.3 x 29.7 cm', '700 gr', 6, '30.00'),
(4, 'Zeexy - The Alien Invasion', 'uploads/board-alien.jpg', 'zeexy, giochi da tavolo zeexy, giochi da tavolo, board games, board games zeexy, ufo, aliens, alieni', 'Salva il mondo assieme ai tuoi amici!\r\n\r\nA turno i giocatori muovono i loro personaggi, raccolgono risorse, potenziano armi e difese e combattono gli alieni. La partita si vince se si riesce a respingere l\'invasione aliena e a salvare l\'umanità, oppure se si riesce a sopravvivere fino alla fine della partita e a garantire un\'evacuazione sicura per tutti i giocatori.\r\n\r\nRiuscirai a sopravvivere fino alla fine della partita?', 'Italia', 4, '26787', '29.7 x 5.3 x 29.7 cm', '700 gr', 6, '30.00'),
(5, 'Swank It - Il pi&ugrave; ricco sei tu!', 'uploads/board-swank.jpg', 'swankab, giochi da tavolo swankab, giochi da tavolo, board games, board games swankab, deluxe, luxury, lusso, ricchezza', 'Finalmente il gioco da tavolo in cui puoi diventare miliardario: fai attenzione a come spenderai i tuoi soldi!\r\n\r\nL\'obiettivo del gioco è avere la maggior fama, fortuna e stile alla fine del gioco, facendo investimenti intelligenti, acquisendo beni di alto livello e partecipando agli eventi più esclusivi. A turno, i giocatori effettuano investimenti, acquisiscono beni e partecipano a eventi, cercando di superare gli avversari e di vivere la Swank Life. I punti vengono guadagnati per avere più ricchezza, beni e fama, oltre che per aver completato varie sfide e missioni nel corso del gioco.\r\n\r\nCompra o sarai comprato!', 'Inghilterra', 2, '24121', '29.7 x 5.3 x 29.7 cm', '800 gr', 6, '25.00'),
(6, 'AvantPop - Design your Game', 'uploads/avantpop-VG.jpg', 'avantpop, videogiochi avantpop, videogiochi, gaming, videogames avantpop, console videogiochi, creation center', 'In questo gioco, i giocatori possono creare e progettare i propri giochi. I giocatori hanno accesso a una serie di strumenti e risorse che possono utilizzare per creare giochi personalizzati con meccaniche di gioco, livelli e grafica unici. \r\n\r\nPossono poi condividere le loro creazioni con altri giocatori e giocare ai giochi realizzati da altri giocatori. Il gioco è caratterizzato da un\'interfaccia facile da usare, da strumenti di progettazione intuitivi e da un\'ampia comunità per la condivisione e la scoperta di nuovi contenuti. \r\n\r\nDai sfogo alla tua creatività e crea la tua avventura!', 'Italia', 3, '16069', '18.8 x 13.6 x 1.4 cm', '110 gr', 3, '20.00'),
(7, 'BotBaz - The Robot Wars: Game Edition', 'uploads/botbaz-game.jpg', 'botbaz, videogiochi botbaz, videogiochi, gaming, videogames botbaz, console videogiochi, sigma cast', 'BotBaz - The Robot Wars: Game Edition è un videogioco di strategia in cui i giocatori costruiscono, personalizzano e controllano una squadra di robot per competere contro le squadre di altri giocatori in battaglie frenetiche e piene di azione. \r\n\r\nIl gioco si svolge in un mondo futuristico in cui i robot sono diventati parte integrante della vita quotidiana e i giocatori devono progettare i loro robot per essere i migliori combattenti nell\'arena. \r\n\r\nRiuscirai ad essere il migliore?', 'Inghilterra', 5, '22019', '18.8 x 13.6 x 1.4 cm', '110 gr', 3, '50.00'),
(8, 'Vivante - Design your Style!', 'uploads/vivante-style.jpg', 'vivante, videogiochi vivante, videogiochi, gaming, videogames vivante, console videogiochi, creation center', 'Crea il tuo stile!\r\n\r\nIn questo gioco, i giocatori possono creare e personalizzare i propri personaggi, scegliendo tra una vasta gamma di abiti, accessori e acconciature.\r\nPossono poi partecipare a sfilate ed eventi per mostrare i loro modelli e competere con altri giocatori per vedere chi ha lo stile migliore. \r\n\r\nCompeti con gli altri e dimostra di avere la stoffa del talento!', 'Francia', 6, '34513', '18.8 x 13.6 x 1.4 cm', '120 gr', 3, '50.00'),
(9, 'Zeexy - Save the World', 'uploads/save-the-world.jpg', 'zeexy, videogiochi zeexy, videogiochi, gaming, videogames zeexy, console videogiochi, crystal box', 'Il gioco si svolge in un mondo fantastico pieno di creature mitiche e magia, e i giocatori devono usare le loro abilità e conoscenze per superare ostacoli impegnativi e sconfiggere potenti nemici.\r\n\r\nCon combattimenti frenetici, enigmi emozionanti e una trama profonda e avvincente, Zeexy - Save the World è un\'esperienza di gioco emozionante e coinvolgente per giocatori di tutte le età.\r\n\r\nÉ il tuo momento: diventa l\'eroe che il mondo ha sempre sognato!', 'Italia', 3, '26788', '18.8 x 13.6 x 1.4 cm', '110 gr', 3, '60.00'),
(10, 'Swank It - The Video Game', 'uploads/swankit-vg.jpg', 'swankab, videogiochi swankab, videogiochi, gaming, videogames swankab, console videogiochi, phantom cube', 'Swank It - The Video Game è un gioco di simulazione in cui i giocatori competono tra loro per costruire l\'impero economico più grande e di maggior successo, acquisendo e gestendo proprietà legate a tutti i settori, dalle banche alle industrie, dal cinema all\'arte e anche istituzioni pubbliche. \r\n\r\nGrazie a un\'abile strategia commerciale, i giocatori devono massimizzare i profitti e minimizzare le spese per diventare il magnate della moda per eccellenza. \r\n\r\nDimostra di essere l\'imprenditore migliore contro gli altri giocatori! Comprali tutti!', 'Inghilterra', 2, '24122', '18.8 x 13.6 x 1.4 cm', '120 gr', 3, '60.00'),
(11, 'Il tesoro del pirata Zero (volume 1)', 'uploads/manga-pirata1.jpg', 'pirati, Zero, pirata Zero, il tesoro del pirata Zero, manga', 'Ci sono diverse storie e racconti sui pirati, ma se c\'è una leggenda che ha sempre affascinato Jack è il tesoro nascosto dal primo pirata della storia, il pirata Zero. Jack affronterà insieme alla sua ciurma tutti i pericoli che il mare nasconde per riuscire a trovare il tesoro.', 'Giappone', 4, '12300', '12 x 7 x 1', '90 gr', 1, '4.99'),
(12, 'Il tesoro del pirata Zero (volume 2)', 'uploads/manga-pirata2.jpg', 'pirati, Zero, pirata Zero, il tesoro del pirata Zero, manga', 'Seguendo il consiglio dell\'anziana dell\'isola Blu, Jack seguirà una nuova rotta. Dovrà trovare gli ingredienti giusti per creare una pozione e aiutare il suo nuovo amico Kiko per salvarlo dalla maledizione del tesoro di Barbagrigia.', 'Giappone', 4, '12400', '12 x 7 x 1', '90 gr', 1, '4.99'),
(13, 'La doppia vita di Nicola', 'uploads/manga-nicola.jpg', 'la seconda vita di Nicola, manga, musica, scuola', 'Per qualsiasi attività organizzata dalla scuola, Nicola trova sempre il modo di partecipare e di dare il suo contributo, riuscendo a raggiungere il massimo dei risultati. Nonostante gli impegni, trova anche il tempo per suonare con il suo gruppo e di coltivare la sua passione per la musica.', 'Giappone', 1, '21345', '15 x 7.5 x 1.2', '95 gr', 1, '5.00'),
(14, 'La futura Guardiana (volume 6)', 'uploads/manga-guardiana.jpg', 'la futura guardiana, Cho, frammenti del potere, manga', 'Ora che Cho ha imparato a dominare i quattro elementi della Terra, dovrà seguire l\'ultima lezione che il nonno ha riservato per lei per diventare una Guardiana. Ma i nemici e i ladri non stanno mai fermi e i Frammenti del potere hanno bisogno di più protezione.', 'Giappone', 2, '567324', '15 x 7.5 x 2', '150 gr', 1, '9.99'),
(15, 'La casa errante di Flow', 'uploads/manga-flow.jpg', 'la casa errante di Flow, la casa errante, Flow, manga', 'Giulia è una semplice ragazza che gestisce il negozio di vestiti del papà. Un giorno finisce nei guai per colpa di un soldato, ma viene salvata dal mago Flow.', 'Giappone', 2, '553465', '15 x 7.5 x 1.2', '90 gr', 1, '4.99'),
(16, 'Pixi il folletto', 'uploads/comic-pixi.jpg', 'Pixi il folletto, Pixi, folletto, vacanze, fumetti', 'Nel bosco, i folletti vivono nascosti, aiutano gli animali e curano le piante, senza mai farsi scoprire dagli uomini. Invece Pixi è un folletto un po\' dispettoso ed è riuscito a fare amicizia con Sara, una ragazza che passerà le vacanze estive con gli zii.', 'Regno Unito', 4, '120937', '18 x 11 x 1.8', '130 gr', 2, '5.50'),
(17, 'Detective Jaret', 'uploads/comic-detective.jpg', 'detective Jaret, detective, Jaret, fumetti', 'Il super cattivo Boss Zanna si è liberato dalla trappola di ghiaccio in cui era stato rinchiuso. Ora è deciso a riprendersi il potere e toccherà al Detective Jaret insieme alla sua squadra a fermarlo.', 'Italia', 5, '345782', '18 x 12 x 1.1', '80 gr', 2, '3.00'),
(18, 'Io sono Lord', 'uploads/comic-lord.jpg', 'io sono lord, lord, trilogia, anni 70, anni 80, fumetti', 'La trilogia di fumetti più famosa che ha accompagnato tutti i giovani degli anni 70 e 80, ora in un unico volume.', 'Stati Uniti', 1, '207394', '17.5 x 10 x 3 cm', '200 gr', 2, '20.00'),
(19, 'Rincorrere un pallone', 'uploads/comic-pallone.jpg', 'rincorrere un pallone, Mirtilla, calcio, fumetti', 'Per Mirtilla, il sogno di diventare calciatrice non si è mai spento. Insieme alla sua squadra, si impegnerà per poter partecipare ai mondiali femminili di calcio.', 'Italia', 3, '457789', '17 x 13 x 0.5', '70 gr', 2, '2.99'),
(20, 'Non ti scordar di noi', 'uploads/comic-scordar.jpg', 'Non ti scordar di noi, fumetti a colori, fumetti', 'La storia di un gruppo di amici con i loro primi amori. Il fumetto che ha fatto breccia nei cuori dei giovani, ora i disegni sono a colori per festeggiare la sua decima edizione.', 'Italia', 3, '978846', '16 x 12.5 x 1.2', '85 gr', 2, '5.00'),
(21, 'Swankab - Maglietta', 'uploads/tshirt-swankab.jpg', 'swankab, tshirt swankab, maglietta swankab, tshirt, maglietta, maglietta gaming, tshirt gaming', 'Maglietta bianca 100% in cotone con logo di Swankab nero su sfondo azzurro.\r\nProdotto originale con licenza Sigma [en]Gaming[/en] e Avantpop.', 'Cina', 3, 'SKT12', 'aglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '25.00'),
(22, 'Sigma [en]Cast[/en] - Maglietta', 'uploads/tshirt-sigma.jpg', 'console sigma cast, sigma cast, tshirt sigma, maglietta sigma, tshirt, maglietta, maglietta gaming, tshirt gaming', 'Maglietta 100% in cotone bianca con logo di Sigma [en]Cast[/en] viola su sfondo bianco.\r\nProdotto originale con licenza Sigma [en]Cast[/en] e Avantpop.', 'Cina', 3, 'AS100', 'aglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '27.50'),
(23, '[en]Fizzbuzz[/en] - Maglietta', 'uploads/tshirt-fizzbuzz.jpg', 'fizzbuzz, tshirt fizzbuzz, maglietta fizzbuzz, tshirt, maglietta, maglietta gaming, tshirt gaming', 'Maglietta bianca 100% in cotone con logo di Fizzbuzz blu scuro su sfondo rosso.\r\nProdotto originale con licenza Fizzbuzz.', 'Giapppone', 1, 'FIZZT33', 'aglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '23.99'),
(24, '[en]Phantom Cube[/en] - Maglietta', 'uploads/tshirt-cube.jpg', 'phantom cube, tshirt phantom cube, maglietta phantom cube, tshirt, maglietta, maglietta gaming, tshirt gaming', 'Maglietta bianca 100% in cotone con logo di [en]Phantom Cube[/en] nero su sfondo grigio.\r\nProdotto originale con licenza [en]Phantom Cube[/en] e Avantpop.', 'Giappone', 3, 'AVPH002', 'aglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '23.99'),
(25, '[en]Crystal Box[/en] - Maglietta', 'uploads/tshirt-crystal.jpg', 'crystal box, tshirt crystal box, maglietta crystal box, tshirt, maglietta, maglietta gaming, tshirt gaming', 'Maglietta bianca 100% in cotone con logo di [en]Crystal Box[/en] nero su sfondo grigio.\r\nProdotto originale con licenza [en]Crystal Box[/en] e Zeexy.', 'Cina', 4, 'ZTCB736', 'aglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '177_g|grammi_', 5, '22.00');

-- --------------------------------------------------------

--
-- Table structure for table `recensione`
--

CREATE TABLE `recensione` (
  `ID` int(11) UNSIGNED NOT NULL,
  `prodotto` int(10) UNSIGNED NOT NULL,
  `utente` int(10) UNSIGNED NOT NULL,
  `contenuto` text,
  `punteggio` decimal(2,1) UNSIGNED NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recensione`
--

INSERT INTO `recensione` (`ID`, `prodotto`, `utente`, `contenuto`, `punteggio`) VALUES
(1, 1, 1, 'Molto bello e intessante! Le possibilità sono infinite!', '4.5'),
(2, 5, 1, 'Difficile da imparare ma molto divertente una volta preso il ritmo del gioco.', '2.5'),
(3, 4, 1, '', '0.0');

-- --------------------------------------------------------

--
-- Table structure for table `utente`
--

CREATE TABLE `utente` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utente`
--

INSERT INTO `utente` (`ID`, `nome`, `username`, `email`, `password`, `admin`) VALUES
(1, 'User', 'user', 'user@user.com', '$2y$10$ae/uFTI3KInYS3n8sBXVmuUw33/ex8VoLzt73dnWGJlN2Pa.K8s9y', 0),
(2, 'Admin', 'admin', 'admin@admin.com', '$2y$10$SFYKM6V9lhS7eWRuiRqWZu6IV43mEfcSGyVUhPM3GzRO9vWxQhwfG', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `marca` (`marca`),
  ADD KEY `categoria` (`categoria`);

--
-- Indexes for table `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `utente` (`utente`),
  ADD KEY `prodotto` (`prodotto`);

--
-- Indexes for table `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `recensione`
--
ALTER TABLE `recensione`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `utente`
--
ALTER TABLE `utente`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prodotto`
--
ALTER TABLE `prodotto`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
