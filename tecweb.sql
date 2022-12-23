DROP TABLE IF EXISTS `recensione`;
DROP TABLE IF EXISTS `prodotto`;
DROP TABLE IF EXISTS `marca`;
DROP TABLE IF EXISTS `categoria`;
DROP TABLE IF EXISTS `utente`;
DROP TABLE IF EXISTS `faq`;

-- Tabella Marca

CREATE TABLE `marca` (
  `ID` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `marca` 
    ADD PRIMARY KEY (`ID`);

ALTER TABLE `marca`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

-- Tabella Categoria

CREATE TABLE `categoria` (
  `ID` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` varchar(100) NOT NULL,
  `inPrimaPagina` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `categoria`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;


-- Tabella Prodotto

CREATE TABLE `prodotto` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `immagine` varchar(300) NOT NULL,
  `altImmagine` varchar(500) NOT NULL,
  `descrizione` text NOT NULL,
  `origine` varchar(100) NOT NULL,
  `marca` int(10) UNSIGNED NOT NULL,
  `modello` varchar(100) NOT NULL,
  `dimensione` varchar(100) NULL,
  `peso` varchar(100) DEFAULT NULL,
  `categoria` int(10) UNSIGNED NOT NULL,
  `prezzo` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `marca` (`marca`),
  ADD KEY `categoria` (`categoria`);

ALTER TABLE `prodotto`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `prodotto`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;


-- Tabella Utente

CREATE TABLE `utente` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `utente`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `utente`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


-- Tabella recensione

CREATE TABLE `recensione` (
  `ID` int(11) UNSIGNED NOT NULL,
  `prodotto` int(10) UNSIGNED NOT NULL,
  `utente` int(10) UNSIGNED NOT NULL,
  `contenuto` text NOT NULL,
  `punteggio` decimal(2,1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `recensione`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `utente` (`utente`),
  ADD KEY `prodotto` (`prodotto`);

ALTER TABLE `recensione`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `recensione`
  ADD CONSTRAINT `prodotto` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Tabella FAQ

CREATE TABLE `faq` (
  `ID` int(10) UNSIGNED NOT NULL,
  `domanda` text NOT NULL,
  `risposta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `faq`  
    ADD PRIMARY KEY (`ID`);

ALTER TABLE `faq`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


-- POPOLAMENTO TABELLE ---------------------------------------------------------


INSERT INTO marca (ID,nome) VALUES 
(1,'Funko Pop'),
(2,'Ubisoft'),
(3,'Toei Animations');


INSERT INTO categoria (ID, nome, descrizione, inPrimaPagina) VALUES 
(1,'Action Figure', 'Giocattoli', false),
(2,'Apparel', 'Abbigliamento', true),
(3,'Videogiochi', 'Gaming', true);


INSERT INTO prodotto (ID, nome, immagine, altimmagine, descrizione, origine, marca, modello, dimensione, peso, categoria, prezzo) VALUES
(1, '[en]Funko Pop[/en] 1', 'Funko1.jpg', 'Action figure di personaggio seduto', 'Descrizone test', 'Giappone', 1, 'FP001', '10 _ cm|centimetri_ x 10_ cm|centimetri_ x 10_ cm|centimetri_', '20_gr|grammi_' , 1, 10.00),
(2, '[en]Funko Pop[/en] 2', 'Funko1.jpg', 'Action figure di personaggio seduto', 'Descrizone test', 'Giappone', 1, 'FP001', '10_ cm|centimetri_ x 10_ cm|centimetri_ x 10_ cm|centimetri_', '20_gr|grammi_' , 1, 15.00),

(3, '[en]Far Cry[/en] 6 per [en]XBox one[/en]', 'farcry6.jpg', 'Custodia del gioco per XBOX One', 'Descrizone test', 'Francia', 2, 'UB001', NULL, NULL , 2, 60.00),
(4, '[en]Prince of Persia: The Sands of Time[/en] per [en]XBox one[/en]', 'prince.jpg', 'Custodia del gioco per XBOX One', 'Descrizone test', 'Francia', 2, 'UB002', NULL, NULL , 2, 60.00),

(5, '[ja]Goku[/ja] [en]T-shirt[/en] XL', 'goku.jpg', 'T-shirt Rossa con logo in giapponese in alto a destra', 'Descrizone test', 'Cina', 3, 'APP001', '_XL|[en]Extra Large[/en]_', NULL , 2, 30.00);


INSERT INTO utente (ID,nome,email,password,admin) VALUES
(1,'User','user@user.com','$2y$10$6H4I0IvKUEzsHS6A.86gke6vxY9dncY92PwmuvZaQQ.hvZEvxF9Dq',false),
(2,'Admin','admin@admin.com','$2y$10$SFYKM6V9lhS7eWRuiRqWZu6IV43mEfcSGyVUhPM3GzRO9vWxQhwfG',true);


INSERT INTO recensione (ID, prodotto, utente, contenuto, punteggio) VALUES
(1,1,1,'Bellissimo, lo ho preso come regalo', 4.5),
(2,4,1,'Gameplay poco accattivante, non lo consiglio', 2.0);



INSERT INTO faq (ID,domanda,risposta) VALUES
(1, 'Quanto ci mettono ad arrivare gli ordini dal Giappone?', 'Gli ordini dal Giappone impiegano circa una settimana ad arrivare nella nostra sede'),
(2, 'É possibile ordinare articoli personalizzati?', 'Certo! Potete comunicarci il vostro ordine usando il modulo nella pagina contatti con la vostra richiesta.');