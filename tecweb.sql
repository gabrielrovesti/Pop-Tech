-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 11, 2023 at 03:13 PM
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
(3, 'Videogiochi', 0, 'xbox, xbox one, xbox series x, xbox series s, nintendo, switch, nintendo switch, play station, play station 4, play station 5, fifa 23, the last of us, stray cuphead, sonic, splatoon', 'Entra nel mondo dei videogiochi, dai classici alle nuove uscite per tutte le console.\r\nNel nostro negozio di Padova trovi nuovo e usato testato e garantito.'),
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
(1, 66, 1, 'Gioco molto avvincente. Un classico gioco da tavolo per passare ore con amici.', '4.5'),
(2, 79, 1, 'Classico e semplice ma troppo legato al caso per giocatori più esperti.', '2.0'),
(3, 96, 1, '', '0.0');

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
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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

--
-- Constraints for table `recensione`
--
ALTER TABLE `recensione`
  ADD CONSTRAINT `prodotto` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
