-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 12, 2023 alle 15:22
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 7.4.29

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
-- Struttura della tabella `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `inPrimaPagina` tinyint(1) NOT NULL,
  `keywords` varchar(500) NOT NULL,
  `descrizione` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`ID`, `nome`, `inPrimaPagina`, `keywords`, `descrizione`) VALUES
(1, 'Manga', 0, 'fumetti giapponesi,  manga fumetti, manga giapponesi, manga in giapponese, manga inglese, mang ain inglese, manga italiano, manga in italiano', 'Entra nel mondo dei fumetti Giapponesi, a partire dai classici alle nuove uscite.\r\nManga tradotti in Italiano, Inglese e in lingua originale.\r\nVieni a scoprire il nostro negozio di Padova!'),
(2, 'Fumetti', 1, 'fumetti, fumetti rari, fumetti usati, fumetti anni 90, fumetti anni 80, fumetti anni 2000', 'Dai classici agli ultimi numeri dei fumetti Italiani ed esteri!\r\nArticoli vintage rari e ultime uscite.\r\nScopri i fumetti del nostro negozio di Padova!'),
(3, 'Videogiochi', 0, 'videogiochi, console, gaming, gaming padova, videogiochi padova, sigma cast, creation center, crystal box, phantom cube', 'Entra nel mondo dei videogiochi, dai classici alle nuove uscite per tutte le console.\r\nNel nostro negozio di Padova trovi nuovo e usato testato e garantito.'),
(5, 'Abbigliamento', 1, 'berretti, tshirt, t-shirt, magliette, cappelli, felpe, apparel', 'Magliette, cappelli, felpe e molto di pi&ugrave;! Articoli originali e molto altro!\r\nScopri i prodotti abbigliamento del nostro negozio di Padova!'),
(6, 'Giochi da Tavolo', 0, 'giochi in scatola, espansioni giochi, big box, giochi da tavolo padova, boardgames, boardgames padova', 'Dai classici agli ultimi giochi da tavolo.\r\nEspansioni per giochi, edizioni speciali, special packs e molto altro!\r\nScopri i prodotti del nostro negozio di Padova!');

-- --------------------------------------------------------

--
-- Struttura della tabella `faq`
--

CREATE TABLE `faq` (
  `ID` int(10) UNSIGNED NOT NULL,
  `domanda` text NOT NULL,
  `risposta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `faq`
--

INSERT INTO `faq` (`ID`, `domanda`, `risposta`) VALUES
(1, 'Quanto ci mettono ad arrivare gli ordini dal Giappone?', 'Gli ordini dal Giappone impiegano circa una settimana ad arrivare nella nostra sede.'),
(2, 'É possibile ordinare articoli personalizzati?', 'Certo! Potete comunicarci il vostro ordine usando il modulo nella pagina contatti con la vostra richiesta.'),
(3, 'Vendete solo prodotti originali?', 'Certo teniamo cura di non vendere mai prodotti contraffatti.');

-- --------------------------------------------------------

--
-- Struttura della tabella `marca`
--

CREATE TABLE `marca` (
  `ID` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `marca`
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
-- Struttura della tabella `prodotto`
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
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`ID`, `nome`, `immagine`, `keywords`, `descrizione`, `origine`, `marca`, `modello`, `dimensione`, `peso`, `categoria`, `prezzo`) VALUES
(1, 'AvantPop - Craft your Art', 'uploads/test11676197879.jpg', 'avantpop, giochi da tavolo avantpop, giochi da tavolo, board games, board games avantpop, arte, movimento artistico', 'Porta l\'arte sempre con te con il nuovo gioco targato AvantPop.\r\nMettiti nei panni del tuo artista preferito: dai colore alla tua festa!\r\nConsigliato da 10 anni in su.', 'Italia', 3, '16068', '29.7 x 5.3 x 29.7 cm', '900 gr', 6, '20.00'),
(2, 'BotBaz - The Robot Wars', 'uploads/test21676198167.jpg', 'botbaz, giochi da tavolo botbaz, giochi da tavolo, board games, board games botbaz, robot, combattimento robot', 'Distruggi i tuoi amici e nemici in questo gioco! I giocatori prendono il controllo dei loro robot personalizzati e si sfidano in un\'epica battaglia nell\'arena. Ogni giocatore inizia con un robot standard, ma può aggiornare e modificare il proprio robot con varie armi, armature e abilità speciali nel corso del gioco. \r\n\r\nL\'obiettivo del gioco è essere l\'ultimo robot in piedi nell\'arena, usando strategia, astuzia e riflessi pronti per sconfiggere gli avversari.', 'Inghilterra', 5, '22018', '29.7 x 5.3 x 29.7 cm', '800 gr', 6, '25.00'),
(3, 'Vivante - Play with your Style!', 'uploads/test31676198534.jpg', 'vivante, giochi da tavolo vivante, giochi da tavolo, board games, board games vivante, style, stile, moda, design', 'L\'obiettivo del gioco è guadagnare la massima fama e fortuna impressionando i giudici e vincendo i premi di moda. I giocatori si alternano nella scelta di nuovi materiali e accessori, nella creazione di modelli e nella realizzazione di sfilate per presentare il proprio lavoro. I punti si guadagnano se si hanno i progetti migliori, attirando l\'attenzione dei giudici e dei media!\r\n\r\nSe siete appassionati di moda, stile o semplicemente di giochi fantastici, Vivante - Design your Style! sarà sicuramente un successo per voi e per i vostri amici.', 'Francia', 6, '34512', '29.7 x 5.3 x 29.7 cm', '700 gr', 6, '30.00'),
(4, 'Zeexy - The Alien Invasion', 'uploads/test41676198778.jpg', 'zeexy, giochi da tavolo zeexy, giochi da tavolo, board games, board games zeexy, ufo, aliens, alieni', 'Salva il mondo assieme ai tuoi amici!\r\n\r\nA turno i giocatori muovono i loro personaggi, raccolgono risorse, potenziano armi e difese e combattono gli alieni. La partita si vince se si riesce a respingere l\'invasione aliena e a salvare l\'umanità, oppure se si riesce a sopravvivere fino alla fine della partita e a garantire un\'evacuazione sicura per tutti i giocatori.\r\n\r\nRiuscirai a sopravvivere fino alla fine della partita?', 'Italia', 4, '26787', '29.7 x 5.3 x 29.7 cm', '700 gr', 6, '30.00'),
(5, 'Swank It - Il pi&ugrave; ricco sei tu!', 'uploads/test51676199062.jpg', 'swankab, giochi da tavolo swankab, giochi da tavolo, board games, board games swankab, deluxe, luxury, lusso, ricchezza', 'Finalmente il gioco da tavolo in cui puoi diventare miliardario: fai attenzione a come spenderai i tuoi soldi!\r\n\r\nL\'obiettivo del gioco è avere la maggior fama, fortuna e stile alla fine del gioco, facendo investimenti intelligenti, acquisendo beni di alto livello e partecipando agli eventi più esclusivi. A turno, i giocatori effettuano investimenti, acquisiscono beni e partecipano a eventi, cercando di superare gli avversari e di vivere la Swank Life. I punti vengono guadagnati per avere più ricchezza, beni e fama, oltre che per aver completato varie sfide e missioni nel corso del gioco.\r\n\r\nCompra o sarai comprato!', 'Inghilterra', 2, '24121', '29.7 x 5.3 x 29.7 cm', '800 gr', 6, '25.00'),
(6, 'AvantPop - Design your Game', 'uploads/test61676204085.jpg', 'avantpop, videogiochi avantpop, videogiochi, gaming, videogames avantpop, console videogiochi, creation center', 'In questo gioco, i giocatori possono creare e progettare i propri giochi. I giocatori hanno accesso a una serie di strumenti e risorse che possono utilizzare per creare giochi personalizzati con meccaniche di gioco, livelli e grafica unici. \r\n\r\nPossono poi condividere le loro creazioni con altri giocatori e giocare ai giochi realizzati da altri giocatori. Il gioco è caratterizzato da un\'interfaccia facile da usare, da strumenti di progettazione intuitivi e da un\'ampia comunità per la condivisione e la scoperta di nuovi contenuti. \r\n\r\nDai sfogo alla tua creatività e crea la tua avventura!', 'Italia', 3, '16069', '18.8 x 13.6 x 1.4 cm', '110 gr', 3, '20.00'),
(7, 'BotBaz - The Robot Wars: Game Edition', 'uploads/test71676204196.jpg', 'botbaz, videogiochi botbaz, videogiochi, gaming, videogames botbaz, console videogiochi, sigma cast', 'BotBaz - The Robot Wars: Game Edition è un videogioco di strategia in cui i giocatori costruiscono, personalizzano e controllano una squadra di robot per competere contro le squadre di altri giocatori in battaglie frenetiche e piene di azione. \r\n\r\nIl gioco si svolge in un mondo futuristico in cui i robot sono diventati parte integrante della vita quotidiana e i giocatori devono progettare i loro robot per essere i migliori combattenti nell\'arena. \r\n\r\nRiuscirai ad essere il migliore?', 'Inghilterra', 5, '22019', '18.8 x 13.6 x 1.4 cm', '110 gr', 3, '50.00'),
(8, 'Vivante - Design your Style!', 'uploads/test81676211466.jpg', 'vivante, videogiochi vivante, videogiochi, gaming, videogames vivante, console videogiochi, creation center', 'Crea il tuo stile!\r\n\r\nIn questo gioco, i giocatori possono creare e personalizzare i propri personaggi, scegliendo tra una vasta gamma di abiti, accessori e acconciature.\r\nPossono poi partecipare a sfilate ed eventi per mostrare i loro modelli e competere con altri giocatori per vedere chi ha lo stile migliore. \r\n\r\nCompeti con gli altri e dimostra di avere la stoffa del talento!', 'Francia', 6, '34513', '18.8 x 13.6 x 1.4 cm', '120 gr', 3, '50.00'),
(9, 'Zeexy - Save the World', 'uploads/test91676211506.jpg', 'zeexy, videogiochi zeexy, videogiochi, gaming, videogames zeexy, console videogiochi, crystal box', 'Il gioco si svolge in un mondo fantastico pieno di creature mitiche e magia, e i giocatori devono usare le loro abilità e conoscenze per superare ostacoli impegnativi e sconfiggere potenti nemici.\r\n\r\nCon combattimenti frenetici, enigmi emozionanti e una trama profonda e avvincente, Zeexy - Save the World è un\'esperienza di gioco emozionante e coinvolgente per giocatori di tutte le età.\r\n\r\nÉ il tuo momento: diventa l\'eroe che il mondo ha sempre sognato!', 'Italia', 3, '26788', '18.8 x 13.6 x 1.4 cm', '110 gr', 3, '60.00'),
(10, 'Swank It - The Video Game', 'uploads/test101676211542.jpg', 'swankab, videogiochi swankab, videogiochi, gaming, videogames swankab, console videogiochi, phantom cube', 'Swank It - The Video Game è un gioco di simulazione in cui i giocatori competono tra loro per costruire l\'impero economico più grande e di maggior successo, acquisendo e gestendo proprietà legate a tutti i settori, dalle banche alle industrie, dal cinema all\'arte e anche istituzioni pubbliche. \r\n\r\nGrazie a un\'abile strategia commerciale, i giocatori devono massimizzare i profitti e minimizzare le spese per diventare il magnate della moda per eccellenza. \r\n\r\nDimostra di essere l\'imprenditore migliore contro gli altri giocatori! Comprali tutti!', 'Inghilterra', 2, '24122', '18.8 x 13.6 x 1.4 cm', '120 gr', 3, '60.00');

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione`
--

CREATE TABLE `recensione` (
  `ID` int(11) UNSIGNED NOT NULL,
  `prodotto` int(10) UNSIGNED NOT NULL,
  `utente` int(10) UNSIGNED NOT NULL,
  `contenuto` text DEFAULT NULL,
  `punteggio` decimal(2,1) UNSIGNED NOT NULL DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
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
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`ID`, `nome`, `username`, `email`, `password`, `admin`) VALUES
(1, 'User', 'user', 'user@user.com', '$2y$10$ae/uFTI3KInYS3n8sBXVmuUw33/ex8VoLzt73dnWGJlN2Pa.K8s9y', 0),
(2, 'Admin', 'admin', 'admin@admin.com', '$2y$10$SFYKM6V9lhS7eWRuiRqWZu6IV43mEfcSGyVUhPM3GzRO9vWxQhwfG', 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `marca` (`marca`),
  ADD KEY `categoria` (`categoria`);

--
-- Indici per le tabelle `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `utente` (`utente`),
  ADD KEY `prodotto` (`prodotto`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `faq`
--
ALTER TABLE `faq`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `marca`
--
ALTER TABLE `marca`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `recensione`
--
ALTER TABLE `recensione`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
