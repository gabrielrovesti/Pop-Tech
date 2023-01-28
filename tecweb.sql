-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 28, 2023 alle 15:54
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.0.25

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `categoria`
--

INSERT INTO `categoria` (`ID`, `nome`, `inPrimaPagina`, `keywords`, `descrizione`) VALUES
(1, 'Manga', 0, 'fumetti giapponesi, dragon ball fumetti, fumetti one piece, manga one piece, one piece, dragon ball, dragonball, manga dragonball, manga pokemon, manga pok&eacute;mon, fumetti pokemon, fumetti pok&eacute;mon, doraemon, fumetti doraemon, manga doraemon, sailor moon, manga sailor moon, fumetti sailor moon, manga italiano, manga in italiano', 'Entra nel mondo dei fumetti Giapponesi, a partire dai classici come Dragon Ball e Sailor Moon alla lunghissima saga di One Piece.\r\nManga tradotti in Italiano, Inglese e in lingua originale.\r\nVieni a scoprire il nostro negozio di Padova!'),
(2, 'Fumetti', 1, 'topolino, topolino classico, fumetti, fumetti rari, fumetti usati, fumetti zerocalcare, zerocalcare, scott pilgrim, fumetti scott pilgrim, topolino anni 90, topolino anni 80, topolino anni 2000', 'Dai classici numeri di Topolino agli ultimi numeri dei fumetti Italiani ed esteri!\r\nArticoli vintage rari e ultime uscite.\r\nScopri i prodotti abbigliamento del nostro negozio di Padova!'),
(3, 'Videogiochi', 0, 'xbox, xbox one, xbox series x, xbox series s, nintendo, switch, nintendo switch, play station, play station 4, play station 5, fifa 23, the last of us, stray cuphead, sonic, splatoon', 'Entra nel mondo dei videogiochi, dai classici alle nuove uscite per tutte le console.\r\nNel nostro negozio di Padova trovi nuovo e usato testato e garantito.'),
(4, 'Action Figures', 1, 'marvel, funko, funkopop, dc comics, action figures, miniature, statuette, super eroi, statuette super eroi, pokemon, pok&eacute;mon, action figure marvel, action figure dc comics, batman, spiderman, unipd', 'Dalle classiche action figure di anime, manga e super eroi ai divertenti Funko Pop. Scopri i prodotti del nostro negozio di Padova!'),
(5, 'Abbigliamento', 1, 'berretti, tshirt, t-shirt, magliette, cappelli, magliette pok&eacute;mon, magliette pokemon, cappelli dragon ball, dr who, doctor who, star wars, magliette star wars, felpa pokemon', 'Magliette, cappelli, felpe e molto di pi&ugrave;! Articoli originali Pok&eacute;mon, Dragon Ball, Marvel, Doctor Who, Star Wars o molto altro!\r\nScopri i prodotti abbigliamento del nostro negozio di Padova!'),
(6, 'Giochi da Tavolo', 0, 'settelers, catan, giochi in scatola, cranium, twister, dixit, trivial persuit, jenga, espansioni giochi, big box, giochi da tavolo padova, boardgames, boardgames padova', 'Dai classici come Monopoly e Twister agli ultimi giochi da tavolo.\r\nEspansioni per giochi, edizioni speciali, special packs e molto altro!\r\nScopri i prodotti del nostro negozio di Padova!');

-- --------------------------------------------------------

--
-- Struttura della tabella `faq`
--

CREATE TABLE `faq` (
  `ID` int(10) UNSIGNED NOT NULL,
  `domanda` text NOT NULL,
  `risposta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `marca`
--

INSERT INTO `marca` (`ID`, `nome`) VALUES
(1, 'Funko'),
(2, 'Faithvhk'),
(3, 'McFarlane'),
(4, 'Neca'),
(5, 'Star Comics'),
(6, 'Edizioni BD'),
(7, 'Mondadori'),
(8, 'Walt Disney'),
(9, 'Panini Comics'),
(10, 'Bao Publishing'),
(11, 'Rizzoli Lizard'),
(12, 'Nintendo'),
(13, 'EA Sports'),
(14, 'Sega'),
(15, 'Naughty Dog'),
(16, 'Studio MDHR'),
(17, 'Lam8bit'),
(18, 'Capslab'),
(19, 'Pokémon'),
(20, 'Star Wars'),
(21, 'Funny Apparel'),
(22, 'Doctor Who'),
(23, 'Hasbro'),
(24, 'Asmodee'),
(25, 'Giochi Uniti');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`ID`, `nome`, `immagine`, `keywords`, `descrizione`, `origine`, `marca`, `modello`, `dimensione`, `peso`, `categoria`, `prezzo`) VALUES
(1, '[en]Funko Pop Spiderman[/en] 593 [en]Marvel[/en]: Anniversario 80 anni', 'uploads/spiderman-funko-pop.jpg', 'spiderman, spider man, marvel, funko, funko pop, anniversario marvel, marvel 80 anni', 'Da [en]Marvel[/en], [en]Spider Man[/en] come prima apparizione.\r\nDai un\'occhiata alle altre figure [en]Marvel[/en] di [en]Funko[/en] e collezionali tutte\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '46952', '&lrm;6.35 x 6.35 x 9.53 _cm|centimetri_', '136_g|grammi_', 4, '20.00'),
(2, '[en]Funko Pop Games[/en] 598 - [en]Pokemon[/en] [ja]Pikachu[/ja] Arrabbiato', 'uploads/pikachu-funko-pop.jpg', 'funko, funko pop, pok&eacute;mon, pokemon, pikachu, funko pop pikachu, funko pop 598, grumpy pikachu', '[en]Funko Pop Games[/en] 598 [en]Pokemon[/en] [ja]Pikachu[/ja] Arrabbiato .\r\nGuarda le altre figure Funko dedicate a questa collezione. \r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '65043', '&lrm;6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '17.90'),
(3, '[en]Funko Pop[/en] 123 - Unipd [en]Collection[/en] Ombretta Gaggi', 'uploads/ombretta-gaggi-funko-pop.png', 'unipd, tecnologie web, web development, universit&agrave; degli studi di padova, professore, professoressa, edizione limitata', '[en]Funko Pop[/en] 123 Collezione Unipd. \r\nStatuina della Professoressa Ombretta Gaggi.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10123', '&lrm;6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(4, '[en]Funko Pop[/en] 124 - Unipd [en]Students Collection[/en] Gabriel Rovesti', 'uploads/gabriel-rovesti-funko-pop.png', 'unipd, tecnologie web, web development, universit&agrave; degli studi di padova, studente, edizione limitata', '[en]Funko Pop[/en] 124 Collezione Unipd [en]Students[/en] . \r\nStatuina dello studente Gabriel Rovesti.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10124', '&lrm;6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(5, '[en]Funko Pop[/en] 125 - Unipd [en]Students Collection[/en] Erica Cavaliere', 'uploads/erica-cavaliere-funko-pop.png', 'unipd, tecnologie web, web development, universit&agrave; degli studi di padova, studente, studentessa, edizione limitata', '[en]Funko Pop[/en] 125 Collezione Unipd [en]Students[/en].\r\nStatuina della studente Erica Cavaliere.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10125', '&lrm;6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(6, '[en]Funko Pop[/en] 126 - Unipd [en]Students Collection[/en] Giulio Moretto', 'uploads/giulio-moretto-funko-pop.png', 'unipd, tecnologie web, web development, universit&agrave; degli studi di padova, studente, edizione limitata', '[en]Funko Pop[/en] 126 Collezione Unipd [en]Students[/en].\r\nStatuina dello studente Giulio Moretto.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10125', '&lrm;6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(7, '[en]One Piece[/en] Figura [ja]Anime[/ja] [en]Luffy &amp; Shanks[/en]', 'uploads/one-piece-luffy-shanks.jpg', 'one piece, luffy, shanks, action figure one piece, statuina one piece, straw hat, cappello di paglia', '[en]Action Figure[/en] tratta dall\'[ja]anime[/ja] [en]One Piece[/en] dei personaggi [en]Luffy & Shanks[/en] mentre [en]Shanks[/en] dona il suo cappello a [en]Luffy[/en].', 'Cina', 2, 'OPLS12', 'Altezza 18_cm|centimetri_', '150_g|grammi_', 4, '19.99'),
(8, 'Statuina [en]Batman Multiverse Three Jokers[/en]', 'uploads/batman-action-figure.jpg', 'batman, batman multiverse, dc comics, action figure, statuina, originale', 'Figura in scala da 7 pollici incredibilmente dettagliata basata sul multiverso DC.\r\nProgettato con [en]Ultra Articulation[en] con fino a 22 parti mobili per una gamma completa di posa e gioco.\r\nBatman è basato sul suo look in Batman: Three Jokers Comics.\r\nBatman include un lanciatore e una base.', 'Cina', 3, 'TM30137', '&lrm;5.08 x 2.54 x 17.78 _cm|centimetri_', '310_g|grammi_', 4, '29.99'),
(10, 'Ritorno al Futuro [en]Doc Brown Ultimate 7 Action Figure[/en]', 'uploads/doc-brown-action-figure.jpg', 'back to the future, ritorno al futuro, doc brown, action figure, action figure doc brown', 'Figura in scala del personaggio [en]Doc Brown[/en] nell\'anno 1955. \r\nCon disegni chiavi inglese e due tipi di orologio.', 'Cina', 4, '53614', '&lrm;27.51 x 15.9 x 6.5  _cm|centimetri_', '308.44_g|grammi_', 4, '44.50'),
(11, 'La saga del gran demone Piccolo. [en]Dragon Ball full color[/en] (Vol. 3)', 'uploads/dragon-ball-manga.jpg', 'fumetti dragon ball, dragon ball, dragonball, manga dragon ball, manga dragonball, akira toryama, star comics, dragon ball italiano, manga italiani', 'Un\'edizione completamente a colori del capolavoro del maestro [ja]Toriyama[/ja]! \r\nUna pubblicazione divisa per saghe, lanciata in Giappone dalla casa editrice [ja]Shueisha[/ja], ora finalmente disponibile anche per i lettori italiani!', 'Giappone', 5, '8822611438', '11.2 x 1.5 x 17.1 _cm|centimetri_', '280_g|grammi_', 1, '6.56'),
(12, '[en]One piece[/en]. [en]New edition[/en] (Vol. 30)', 'uploads/one-piece-manga.jpg', 'one piece, manga one piece, one piece volume 30, one piece 30, one piece italiano', '[en]Big Mom[/en], una temibile ed estremamente affamata signora della guerra pirata, si abbatte su [en]Luffy[/en] e il suo equipaggio in cerca di torta nuziale e vendetta. \r\n[en]Luffy[/en] si scontra con il figlio goloso [ja]Katakuri[/ja] mentre l\'equipaggio di Cappello di paglia combatte per proteggere la loro nave e le loro vite.', 'Giappone', 5, '8864202161', '11.4 x 1.7 x 17 _cm|centimetri_', '240_g|grammi_', 1, '4.30'),
(13, '[ja]Pok&eacute;mon[/ja]. La grande avventura (Vol. 1)', 'uploads/pokemon-manga.jpg', 'manga pokemon, fumetti pokemon, manga pok&eacute;mon, fumetti pok&eacute;mon, la grande avventura volume 1, la grande avventura vol 1, pokemon italiano, pok&eacute;mon italiano', 'Nella regione di [ja]Kanto[/ja] il giovane allenatore Rosso lascia la sua casa per completare il [en]Pokédex[/en], battere gli otto capopalestra, vincere le loro medaglie e conquistarsi il diritto di sfidare la Lega [ja]Pokémon[/ja]. \r\nSulla sua strada troverà però un acerrimo rivale e il terribile [en]Team Rocket[/en], l\'organizzazione malvagia che non si fa scrupoli a usare i mostriciattoli tascabili per raggiungere i suoi obbiettivi criminali.', 'Giappone', 6, '8868837854', '17.2 x 3.2 x 12.5 _cm|centimetri_', '620_g|grammi_', 1, '9.40'),
(14, 'Io sono [ja]Doraemon[/ja]', 'uploads/doraemon-manga.jpg', 'doraemon, manga classici, star comics, storie doraemon, doraemon italiano, fumetti doraemon', '[ja]Doraemon[/ja] è un grosso gatto robot amante delle brioschine ai fagioli arrivato dal futuro per aiutare su [ja]Nobita[/ja], un ragazzino pigro, poco studioso e totalmente negato per lo sport, spesso vittima delle angherie dei compagni [ja]Gian[/ja] e [ja]Suneo[/ja]. \r\nPer fortuna ora c\'è [ja]Doraemon[/ja] a tirarlo fuori dai guai, e ad assicurarsi che [ja]Nobita[/ja] impari la lezione.', 'Giappone', 5, '8804672889', '&lrm;  19.5 x 2.4 x 29.3 _cm|centimetri_', '1.02 _kg|kilogrammi_', 1, '19.00'),
(15, '[en]Dragon Ball[/en]. [en]Ultimate edition[/en] (Vol. 1)', 'uploads/dragon-ball-ultimate-manga.jpg', 'fumetti dragon ball, dragon ball, dragonball, manga dragon ball, manga dragonball, akira toryama, star comics, dragon ball italiano, manga italiani', 'Ecco la [en]Dragon Ball Ultimate Edition[/en], lussuosissima riedizione della fondamentale opera del maestro [ja]Toriyama[/ja] che, con i testi recentemente aggiornati, riprende il formato e la grafica della \"leggendaria\" [en]Perfect Edition[/ja].\r\nL\'edizione proporrà anche le pagine a colori originali realizzate in occasione della prima pubblicazione in Giappone su rivista, per regalare a vecchi e nuovi lettori un\'esperienza di lettura il più fedele possibile all\'originale giapponese!', 'Giappone', 5, '8822632648', '15 x 2.3 x 21 _cm|centimetri_', '520_g|grammi_', 1, '14.25'),
(16, '[en]Dragon Ball[/en]. [en]Evergreen edition[/en] (Vol. 18)', 'uploads/dragon-ball-evergreen-manga.jpg', 'fumetti dragon ball, dragon ball, dragonball, manga dragon ball, manga dragonball, akira toryama, star comics, dragon ball italiano, manga italiani', 'In questo numero, mentre il giovane figlio di [ja]Goku[/ja], dotato di poteri straordinari, inizia a sottoporsi ad allenamenti speciali, i nemici giunti dallo spazio ripartono alla carica...', 'Giappone', 5, '8864204741', '17.5 x 1.4 x 11.5 _cm|centimetri_', '140_g|grammi_', 1, '4.08'),
(17, '[en]One Piece[/en]. [en]New edition[/en] (Vol. 42)', 'uploads/one-piece-manga-vol-42.jpg', 'one piece, manga one piece, one piece volume 42, one piece 42, one piece italiano', 'Mentre [en]Franky[/en] se la cava egregiamente sconfiggendo [ja]Fukuro[/ja], [en]Chopper[/en] ingoia una [en]Rumble Ball[/en] di troppo, trasformandosi in una mostruosa creatura. \r\nNel frattempo, [ja]Spandam[/ja] aziona inavvertitamente il golden lumacofono', 'Giappone', 5, '8864202285', '11.3 x 1.5 x 17.5 _cm|centimetri_', '181_g|grammi_', 1, '4.08'),
(18, '[en]One Piece[/en]. [en]New edition[/en] (Vol. 3)', 'uploads/one-piece-manga-vol-3.jpg', 'one piece, manga one piece, one piece volume 3, one piece 3, one piece italiano', 'Nuova edizione del terzo volumetto della serie del pirata con il cappello di paglia. Le vecchie avventure di [en]Luffy[/en] e la sua ciurma in viaggio per i sette mari.', 'Giappone', 5, '8864201890', '17.1 x 1.1 x 10.3 _cm|centimetri_', '100_g|grammi_', 1, '4.30'),
(19, '[en]One Piece[/en]. [en]New edition[/en] (Vol. 4)', 'uploads/one-piece-manga-vol-4.jpg', 'one piece, manga one piece, one piece volume 4, one piece 4, one piece italiano', 'Nuova edizione del quarto volumetto della serie del pirata con il cappello di paglia. Le vecchie avventure di [en]Luffy[/en] e la sua ciurma in viaggio per i sette mari.', 'Giappone', 5, '8864201904', '17.1 x 1.1 x 10.3 _cm|centimetri_', '120_g|grammi_', 1, '4.30'),
(20, '[en]Pretty Guardian Sailor Moon[/en]. [en]New edition[/en]. (Vol. 9)', 'uploads/sailor-moon-manga.jpg', 'sailor moon, manga, manga sailor moon, sailor moon italiano, star comics', 'Il macabro tendone del [en]Dead Moon Circus[/en] campeggia sulla città e minaccia di farla sprofondare in un incubo senza risveglio. \r\n[ja]Usagi[/ja] e [ja]Chibiusa[/ja] cadono vittime del potere del nemico e non saranno le sole a sperimentarne gli effetti \"distorcenti\". \r\n[ja]Mamoru[/ja], dal canto suo, si sente sempre più debole..', 'Giappone', 5, '8822610504', '1.4 x 2 x 17.2 _cm|centimetri_', '120_g|grammi_', 1, '4.46'),
(21, 'Le grandi storie di Topolino 1979', 'uploads/grandi-storie-topolino.jpg', 'topolino, storie di topolino, raccolta topolino, topolino anni 70, topolino vintage', 'Milano, Mondadori, 1979, cartonato editoriale con copertina illustrata a colori, pagine 204 completamente illustrato da fumetti a colori. Prima edizione.', 'Italia', 7, 'B00GC4J9AK', '&lrm;  19.5 x 2.4 x 29.3 _cm|centimetri_', '2.14 _kg|kilogrammi_', 2, '28.30'),
(22, 'Topolino N. 2242', 'uploads/topolino-2242.jpg', 'topolino 2242, topolino anni 90, topolino 1998, topolino fumetto, walt disney', 'Edizione del 1998, usato in buone condizioni. Costa e copertina logorate e pagine ingiallite.', 'Italia', 8, '5000089455953', '&lrm;  19.5 x 2.4 x 29.3 _cm|centimetri_', '120_g|grammi_', 2, '3.37'),
(23, 'Trilogia di Topolino. 3 grandi storie del 1938 - 1940', 'uploads/trilogia-topolino.jpg', 'trilogia topolino, storie di topolino, raccolta topolino, topolino anni 60, topolino anni 30, topolino anni 40, topolino vintage', 'Milano, Mondadori, 1969, ottavo cartonato originale con copertina illustrata a colori, 220 pagine completamente illustrato a colori e da fumetti. A cura di Mario Gentilini.', 'Italia', 8, '2567704350711', '&lrm;  19.5 x 2.4 x 29.3 _cm|centimetri_', '1.2 _kg|kilogrammi_', 2, '18.00'),
(24, 'Topolino Giornale 673/734 59 Numeri. Anno 1948.', 'uploads/topolino-giornale.jpg', 'topolino, topolino anni 40, topolino 1948, giornale topolino, topolino antico, fumetti antichi', 'Topolino Giornale 673/734, anno 1948, mancano i numeri 721 e 724.\r\n59 numeri in totale, tutti in condizioni ottime.', 'Italia', 7, '2565666162731', '&lrm;27.51 x 15.9 x 6.5  _cm|centimetri_', '75_g|grammi_', 2, '499.99'),
(25, 'Viaggio In Italia con Topolino 2 luoghi E Volti D&#039;italia nelle pi&ugrave; Belle Storie A Fumetti', 'uploads/topolino-viaggio-in-italia.jpg', 'raccolta topolino, storie italiane, stroria italia, edizione speciale topolino, raccolte disney, walt disney', 'L\'Italia torna ad essere il paese dove i personaggi Disney hanno vissuto indimenticabili avventure! In questo nuovo topo libro da collezione sono raccolte quattro belle storie che vedono Paperi e Topi incontrare o calarsi nei panni di personaggi storici del calibro di Leonardo da Vinci e Leopardi, oppure occuparsi di monumenti famosi come in Zio Papero e la Torre di Pisa di Giorgio Pezzi e Giorgio Cavazzano.', 'Italia', 10, 'B079JVKCVS', '20 x 15.8 x 2.6 _cm|centimetri_', '370_g|grammi_', 2, '14.90'),
(26, 'Topolino: Le pi&ugrave; belle storie mitologiche. Edizione illustrata', 'uploads/topolino-mitologia.jpg', 'raccolta topolino, le pi&ugrave; belle storie, storie mitologiche, edizione speciale topolino, raccolte disney, walt disney', 'Una divertente selezione delle più belle storie a fumetti a tema mitologico con protagonisti i personaggi [en]Disney[/en].', 'Italia', 8, '8852224343', '20 x 15.8 x 2.6 _cm|centimetri_', '380_g|grammi_', 2, '9.40'),
(27, 'Topolino 1718. Ottobre 1988', 'uploads/topolino-1718.jpg', 'topolino 1718, topolino anni 80, topolino 1988, topolino fumetto, walt disney', 'Topolino numero 1718 dell\'anno 1988. Usato in buone condizioni.', 'Italia', 8, '2560035415180', '&lrm;  19.5 x 2.4 x 29.3 _cm|centimetri_', '120_g|grammi_', 2, '9.99'),
(28, 'Zerocalcare. Ogni maledetto luned&igrave; su due.', 'uploads/zerocalcare-lunedi.jpg', 'zerocalcare, fumetti zerocalcare, fumetti italiani, bao publishing', 'Questo libro è stato la prima raccolta di storie del blog di Zerocalcare, ma negli anni è diventato molto di più, e ora è considerato una parte fondamentale del suo catalogo.\r\nLa lunga storia a colori che punteggia i capitoli della raccolta è stata la prima presa di coscienza lunga sul percorso, umano, politico e artistico, dell\'autore nella sua età adulta.', 'Italia', 10, '8832737094', '25 x 2.6 x 17.6 _cm|centimetri_', '790_g|grammi_', 2, '19.00'),
(29, '[en]Scott Pilgrim[/en]. Una vita niente male (Vol. 1)', 'uploads/scott-pilgrim-vol-1.jpg', 'scott pilgrim, scott pilgrim volume 1, scott pilgrim una vita niente male', 'Primo volume della [en]graphic novel[/en] \"[en]Scott Pilgrim[/en]\". \r\nLa vita di [en]Scott Pilgrim[/en] è davvero niente male. \r\nHa ventitré anni, suona in una [en]band[/en], si sveglia all\'ora che gli pare e ultimamente esce anche con una tipa carina che praticamente gli muore dietro.', 'Canada', 11, '8817040843', '12 x 1 x 18 _cm|centimetri_', '259_g|grammi_', 2, '9.40'),
(30, '[en]Scott Pilgrim[/en] contro il mondo (Vol. 2)', 'uploads/scott-pilgrim-vol-2.jpg', 'scott pilgrim, scott pilgrim volume 2, scott pilgrim vs the worlds, scott pilgrim contro il mondo', 'Maledetti siano gli ex. Quelli che ti sei dimenticato e quelli che chissà che fine hanno fatto. \r\nQuelli che ancora non si rassegnano e quelli che non gliene importa niente. \r\nQuelli che soffrono come cani e quelli che tornano per seminare il caos.', 'Canada', 11, '881704086X', '12 x 1 x 18 _cm|centimetri_', '540_g|grammi_', 2, '9.40'),
(32, 'FIFA 23 [en]Standard Edition[/en] per [en]Play Station[/en] 5', 'uploads/fifa-23-ps5.jpg', 'fifa, fifa 23, ps5, playstation 5, play station 5, FIFA football, gioco calcio, EA sports', 'Porta in campo il gioco più bello del mondo, con la tecnologia [en]HyperMotion[/en] 2 che offre ancora più realismo di gioco.\r\n[en]FIFA World Cup[/en] maschile e femminile, aggiunta di squadre di club femminili, funzioni [en]cross-play[/en] e altro ancora.', 'Italia', 13, 'B0B6CK6RBN', '&lrm;17.1 x 13.6 x 1.3 cm _cm|centimetri_', '70_g|grammi_', 3, '49.90'),
(33, 'FIFA 23 [en]Standard Edition[/en] per [en]XBox Series[/en] X|S', 'uploads/fifa-23-xbox.jpg', 'fifa, fifa 23, xbox, xbox x, xbox s, xbox series x, xbox series s, FIFA football, gioco calcio, EA sports', 'Porta in campo il gioco più bello del mondo, con la tecnologia [en]HyperMotion[/en] 2 che offre ancora più realismo di gioco.\r\n[en]FIFA World Cup[/en] maschile e femminile, aggiunta di squadre di club femminili, funzioni [en]cross-play[/en] e altro ancora.', 'Italia', 13, 'B0B6CK6RBN', '&lrm;17.1 x 13.6 x 1.3 cm _cm|centimetri_', '70_g|grammi_', 3, '49.90'),
(45, '[en]The Last of Us[/en] Parte I - [en]Remake[/en] per [en]Play Station[/en] 5', 'uploads/last-of-us-1-ps5.jpg', 'last of us, last of us parte 1, tlou, ps5, playstation 5, play station 5,  naughty dog, esclusivo play station', 'Grafica migliorata:[en]The Last of Us[/en] è stato completamente adattato usando le ultime tecnologie di [en]Naughty Dog[/en], per migliorare ogni aspetto visivo. \r\nL\'esperienza di gioco originale, pur rimasta fedele nella struttura, è stata arricchita con effetti di luce realistici, ambientazioni più dettagliate e scenari rivisitati', 'USA', 15, 'B0B3X2N4PR', '17.1 x 13.6 x 1.5 _cm|centimetri_', '80_g|grammi_', 3, '55.99'),
(49, '[ja]Pokemon[/ja] Felpa con Cappuccio per Ragazzi [en]Pokeball[/en]', 'uploads/felpa-pokemon.jpg', 'pokemon, pok&egrave;mon, felpa, felpa pokemon,felpa pok&eacute;mon,  pikachu, berretto pikachi, felpa pikachu', 'La felpa grigio scuro dei [en]Pokemon[/en] vede riprodotta una pokeball al centro della maglia costituita interamente da [en]silhouette[/en] di [ja]Pikachu[/ja].\r\n65% Poliestere, 35% Cotone.\r\nCon cappuccio e tasche accoglienti, la felpa dei [en]Pokemon[/en] ha tutte le carte in regola per farlo diventare allenatore.', 'Cina', 19, 'B07R821NLQ', 'Taglie dai 4 ai 12 anni', '330_g|grammi_', 5, '27.95'),
(50, '[en]Pokemon[/en] Berretto [en]Baseball[/en] [ja]Pikachu[/ja] numero 25 Ufficiale Nero', 'uploads/berretto-pikachu.jpg', 'pokemon, pok&egrave;mon, cappello, cappello pokemon,cappello pok&eacute;mon, berretto pokemon, berretto pok&eacute;mon, pikachu, berretto pikachu, cappello pikachu', 'Prodotto con licenza ufficiale. Taglia unica\r\nBerretto da [en]baseball[/en] di qualità', 'Cina', 19, '&lrm;BA221131POK', 'Taglia unica', '90_g|grammi_', 5, '19.55'),
(53, '[en]Star Wars[/en] Leia [en]Don&#039;t Call Me Princess[/en] Maglietta', 'uploads/maglietta-leia.jpg', 'star wars, leia, princess leia, principessa leia, magliette star wars, t-shirt star wars, tshirt star wars, guerre stellari', 'Tinta unita: 100% Cotone; Grigio Cenere: 90% Cotone, 10% Poliestere; Altri Toni: 50% Cotone, 50% Poliestere', 'Cina', 20, '616DD0HT2BD', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '19.99'),
(54, '[en]Star Wars[/en] C3-PO e RD-2D [en]Droids Of Vader&#039;s Shadow[/en] Maglietta', 'uploads/maglietta-c3po-r2d2.jpg', 'star wars, maglietta star wars, tshirt star wars, t-shirt star wars, c3po, r2d2, droidi star wars', 'Tinta unita: 100% Cotone; Grigio Cenere: 90% Cotone, 10% Poliestere; Altri Toni: 50% Cotone, 50% Poliestere', 'Cina', 20, '8BWQCXYTGN9', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '19.99'),
(55, 'Maglietta sviluppatore HTML CSS. Tag [en]Style[/en]', 'uploads/maglietta-style.jpg', 'web developer, css, web, maglietta html, html, abbigliamento developer, sviluppatore web, slivuppatore, programmatore', 'Questo design di stile è perfetto per qualsiasi sviluppatore web o programmatore.\r\nFa un grande regalo per lo sviluppatore web nella tua vita.', 'Cina', 21, 'PB98QX77RKG', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '16.99'),
(56, 'Maglietta Uomo [en]Doctor Who[/en] logo anni 70', 'uploads/maglietta-drwho-1.jpg', 'tshirt dr who, t-shirt dr who, maglietta dr who, doctor who, logo vintage, vintage doctor who, vintage dr who', 'Maglietta da uomo a manica corta. Con logo colorato nello stile anni 70. \r\nLicenza ufficiale BBC.', 'Cina', 22, 'B07DN3RBX4', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '240_g|grammi_', 5, '29.77'),
(57, 'Maglietta Donna [en]Doctor Who Weeping Angels[/en]', 'uploads/maglietta-drwho-2.jpg', 'tshirt dr who, t-shirt dr who, maglietta dr who, doctor who, weeping angels', 'Maglietta da uomo a manica corta. Con statua [en]Weeping Angel[/en]. \r\nLicenza ufficiale [en]BC[/en].', 'Cina', 22, 'B01C0RFLQI', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '101_g|grammi_', 5, '17.59'),
(58, 'Maglietta con logo HTML 5', 'uploads/maglietta-html5.jpg', 'web developer, html5, web, maglietta html, html, abbigliamento developer, sviluppatore web, slivuppatore, programmatore', 'Maglietta unisex a manica corta.\r\nCon logo a scudo HTML 5', 'Cina', 21, 'B08LG1GT9C', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '107_g|grammi_', 5, '22.31'),
(59, '[en]Twister[/en] Gioco in Scatola versione 2020 in Italiano', 'uploads/twister.jpg', 'twister, giochi in scatola, classico, in piedi, movimento, giochi per adulti, giochi per adolescenti, giochi per bambini', 'Ricordi quando giocavi a Twister da bambino? Proprio come nel Twister classico, in questo gioco per bambini da 6 anni in su l\'ultimo giocatore che rimane in piedi vince', 'USA', 23, '315-98831456', '26.67 x 4.13 x 26.67 _cm|centimetri_', '600_g|grammi_', 6, '14.99'),
(61, 'Cranium edizione Italiana', 'uploads/cranium.jpg', 'giochi da tavolo, cranium, giochi per adolescenti, giochi per adulti, gioco in scatola', 'I giocatori possono dare dimostrazione del proprio talento.\r\nSono previsti gioco di parole, schizzi a mano libera, attività di investigazione, recitazione e altro ancora', 'USA', 23, '&lrm;C1939103', '22.7 x 2.3 x 22.7 _cm|centimetri_', '1.4 _kg|kilogrammi_', 6, '29.49'),
(62, '[en]Trivial Pursuit[/en] Decennio: 2010 - 2020', 'uploads/trivial-pursuit.jpg', 'giochi in scatola, trivial, anni 2010, anni 2020, big box, giochi da tavolo padova, boardgames, boardgames padova', 'Dimostra quanto riesci a ricordare! Le domande all\'interno di questa versione del gioco [en]Trivial Pursuit[/en] riflettono la cultura e le tendenze che hanno spopolato dal 2010 al 2020', 'USA', 23, 'B092ZXG72X', '6.3 x 26.7 x 26.7 _cm|centimetri_', '1.24 _kg|kilogrammi_', 6, '34.99'),
(63, '[en]Dobble[/en] - Divertente Gioco da Tavolo per Tutta la Famiglia', 'uploads/dobble.jpg', 'giochi da tavolo, dobble, giochi per adolescenti, giochi per adulti, gioco in scatola, giochi per famiglia, giochi amici, giochi per tutti', 'Dobble è un gioco di colpo d\'occhio e velocità: per vincere dovrete essere i più rapidi a trovare l\'unico simbolo in comune tra le carte svelate (ce n\'è sempre uno!)', 'Francia', 24, '&lrm;LPP01USASM', '21.91 x 4.13 x 9.21 _cm|centimetri_', '300_g|grammi_', 6, '14.88'),
(64, 'Dixit - Gioco da Tavolo di Immaginazione e Fantasia', 'uploads/dixit.jpg', 'giochi da tavolo, dixit, giochi per adolescenti, giochi per adulti, gioco in scatola, giochi per famiglia, giochi amici, giochi per tutti', 'Un affascinante gioco di carte e narrazione per stimolare immaginazione e fantasia: da giocare in famiglia e con gli amici.\r\nDixit si rivela essere un gioco sorprendente, conviviale e divertente, capace di coinvolgere giocatori di ogni età.', 'Francia', 24, '&lrm;LIBDIX01IT', '28 x 28 x 6 _cm|centimetri_', '10_g|grammi_', 6, '24.90'),
(65, 'Passa la Bomba, Gioco di Divertimento', 'uploads/passa-la-bomba.jpg', 'passa la bomba, giochi in scatola, classico,  giochi per adulti, giochi per adolescenti, giochi parole', 'Gioco di parole\r\n110 carte da gioco\r\nUn dado speciale\r\nBomba elettronica (richiede 2 batterie ministilo AAA 1,5V non incluse)\r\nVersione Italiana', 'Italia', 25, 'GU034/2', '24 x 17 x 8 _cm|centimetri_', '2 _kg|kilogrammi_', 6, '21.56'),
(66, 'Catan [en]Big Box[/en] edizione Italiana', 'uploads/catan.jpg', 'settelers, catan, giochi in scatola, settlers of cata, big box, giochi da tavolo padova, boardgames, boardgames padova', 'Consigliato: da 10 anni in su\r\nLingua: italiano\r\nLa big box di Catan ti dà subito la possibilità di giocare fino a 6 giocatori\r\nContiene anche Catan gioco di dadi\r\nContiene ottimi espansioni e ottimi scenari\r\nNumero di giocatori: da 3 a 6', 'USA', 25, '&lrm;GU712', '32 x 46 x 10  _cm|centimetri_', '2.62 _kg|kilogrammi_', 6, '59.06'),
(67, 'I Pilastri della Terra [en]Ken Follett[/en], edizione Italiana', 'uploads/pilastri-della-terra.jpg', 'ken follett, giochi in scatola, settlers of cata, big box, giochi da tavolo padova, boardgames, giochi uniti, boardgames padova', 'Da giocare in due fino a quattro giocatori\r\nAdatto per bambini con età superiore di 12 anni', 'USA', 25, '&lrm;MFG4119', '29.79 x 29.69 x 7.39 _cm|centimetri_', '1.06 _kg|kilogrammi_', 6, '31.42'),
(79, 'Jenga Classico', 'uploads/jenga.jpg', 'jenga, hasbro, giochi in scatola, giochi per bambini, giochi per tutti, giochi per famiglia, giochi di abiit&agrave;', 'Fai in modo di evitare che la torre crolli; ciò richiede abilità, strategia e fortuna\r\nJenga Classico è un gioco intramontabile: divertente, non elaborato', 'USA', 23, '&lrm;A2120EU4', '&lrm;8 x 12 x 28.6 _cm|centimetri_', '780_g|grammi_', 6, '15.90'),
(87, '[en]STRAY[/en] per [en]Play Station[/en] 4', 'uploads/stray-ps4.jpg', 'stray, indie games, giochi indie, ps4, play station 4, playstation 4', 'Stray è un accattivante viaggio in compagnia di un felino che, con naturale curiosità, diventa protagonista di tanti momenti variegati, che vanno dalla risoluzione di enigmi piuttosto semplici a sequenze stealth, passando per fasi molto più movimentate.', 'USA', 17, 'B0BDZP6DNJ', '&lrm;  17 x 13 x 2 _cm|centimetri_', '50_g|grammi_', 3, '34.90'),
(88, 'Leggende di Andor: Eroi Oscuri, Espansione per Le Leggende di Andor', 'uploads/andor.jpg', 'espansione gioco, espansione andor, leggende di andor, espansione leggende di andor, giochi di carte, giochi in scatola fantasy, gioco in scatola fantasy', 'Adatto per attività di gruppo. La tematica del gioco è di espansione, Gioco per gruppi di 5 o 6 persone. Permette di sviluppare le capacità cognitive', 'USA', 25, '&lrm;GU623', '29.7 x 15.1 x 4.5 cm _cm|centimetri_', '499_g|grammi_', 6, '19.90'),
(89, '[en]Cuphead[/en] per Nintendo [en]Switch[/en]', 'uploads/cuphead-switch.jpg', 'switch, nintendo, nintendo switch, cuphead, edizione fisica, run and gun, espansione Cuphead, DLC cuphead, edizione speciale', 'L\'edizione fisica comprende:\r\nEspansione \"[en]The Delicious Last Course[/en]\"\r\nUna tessera \"[en]Cuphead Club Membership[/en]\" numerata singolarmente, ricorda le tessere dei [en]club[/en] che si ricevevano per posta degli anni 30\r\nSei strisce di fumetti da collezione, scritte e illustrate con amore dal team di Studio MDHR.\r\nUna stupenda copertina reversibile disegnata a mano', 'Canada', 16, 'B0BHTW4JRW', '10.21 x 0.79 x 16.99 _cm|centimetri_', '50_g|grammi_', 3, '42.32'),
(90, '[en]Cuphead[/en] per per [en]Play Station[/en] 4', 'uploads/cuphead-ps4.jpg', 'playstation 4, play station 4, ps4, cuphead, edizione fisica, run and gun, espansione Cuphead, DLC cuphead, edizione speciale', 'L\'edizione fisica comprende:\r\nEspansione \"[en]The Delicious Last Course[/en]\"\r\nUna tessera \"[en]Cuphead Club Membership[/en]\" numerata singolarmente, ricorda le tessere dei [en]club[/en] che si ricevevano per posta degli anni 30\r\nSei strisce di fumetti da collezione, scritte e illustrate con amore dal team di Studio MDHR.\r\nUna stupenda copertina reversibile disegnata a mano', 'Canada', 16, 'B0BHTMF8LV', '17.1 x 13.6 x 1.7 _cm|centimetri_', '90_g|grammi_', 3, '49.99'),
(91, '[en]Cuphead[/en] per per [en]XBox One[/en]', 'uploads/cuphead-xbox.jpg', 'xbox, xbox one, cuphead, edizione fisica, run and gun, espansione Cuphead, DLC cuphead, edizione speciale', 'L\'edizione fisica comprende:\r\nEspansione \"[en]The Delicious Last Course[/en]\"\r\nUna tessera \"[en]Cuphead Club Membership[/en]\" numerata singolarmente, ricorda le tessere dei [en]club[/en] che si ricevevano per posta degli anni 30\r\nSei strisce di fumetti da collezione, scritte e illustrate con amore dal team di Studio MDHR.\r\nUna stupenda copertina reversibile disegnata a mano', 'Canada', 16, 'B0BHHTJR53', '&lrm; 17.1 x 13.6 x 1.4 _cm|centimetri_', '80_g|grammi_', 3, '45.99'),
(92, '[en]Sonic Frontiers[/en] per Nintendo [en]Switch[/en]', 'uploads/sonic-switch.jpg', 'sonic, sonic switch, sega, sonic nintendo switch, sonic frontiers', 'Scopri il nuovo [en]platforming[/en] a zona aperta: Sfreccia attraverso cinque isole ultraterrene piene di lussureggianti foreste, spumeggianti cascate e torridi paesaggi desertici e molto altro, ognuna con le sue sfide a piattaforme e i suoi segreti da scoprire.', 'Giappone', 14, 'B0BC9VZMTQ', '17 x 10.5 x 1.2 _cm|centimetri_', '50_g|grammi_', 3, '34.99'),
(93, '[en]Sonic Frontiers[/en] per [en]Play Station[/en] 4', 'uploads/sonic-ps4.jpg', 'sonic, sonic play station 4, sega, sonic play station 4, sonic ps4, sonic frontiers', 'Scopri il nuovo [en]platforming[/en] a zona aperta: Sfreccia attraverso cinque isole ultraterrene piene di lussureggianti foreste, spumeggianti cascate e torridi paesaggi desertici e molto altro, ognuna con le sue sfide a piattaforme e i suoi segreti da scoprire.', 'Giappone', 14, 'B0BC9VZMTQ', '17 x 13.6 x 1.5 _cm|centimetri_', '80_g|grammi_', 3, '29.99'),
(94, '[en]Splatoon[/en] 3 per Nintendo [en]Switch[/en]', 'uploads/splatoon-3.jpg', 'splatoon, splatoon 3, nintendo, nintendo switch, switch', 'In questo nuovo capitolo della serie [en]Splatoon[/en], i giocatori si lasceranno Coloropoli alle spalle per trasferirsi in una nuova area: Splattonia. \r\n[en]Splatoon[/en] 3 introduce diverse novità, come l\'anti, motivo: personaggio sul lato', 'USA', 18, 'CL-DBZ-1-GO3', '17 x 10.5 x 1.2 _cm|centimetri_', '100_g|grammi_', 3, '19.99'),
(95, 'Ritorno al Futuro [en]Marty Mcfly Ultimate 7 Action Figure[/en]', 'uploads/marty-mcfly-action-figure.jpg', 'back to the future, ritorno al futuro, marty mc fly, action figure, action figure marty mcfly', 'Figura in scala del personaggio [en]Marty McFly[/en] nell\'anno 1985. \r\nCon chitarra elettrica, [en]skateboard[/en], videocamera, occhiali da sole e zaino.', 'Cina', 4, '53600', '7.19 x 5.13 x 18.01 _cm|centimetri_', '272,6_g|grammi_', 4, '44.50'),
(96, '[ja]Muten Roshi[/ja] [en]Trucker cap Dragon Ball[/en] Z', 'uploads/dragon-ball-berretto-1.jpg', 'dragonball, dragon ball, cappello, cappellodragon ball,cappello dragonball, berretto dragon ball, berretto dragonball, muten roshi', 'Cappello da baseball con licenza ufficiale [en]Dragon Ball[/en] Z\r\nToppa Super [ja]Saiyan Goku[/ja] sul davanti, motivo: personaggio sul lato', 'USA', 18, 'CL-DBZ-1-GO3', 'Taglia Unica', '100_g|grammi_', 5, '19.99'),
(97, '[ja]Saiyan Goku[/ja] [en]Trucker cap Dragon Ball[/en] Z', 'uploads/dragon-ball-berretto-2.jpg', 'dragonball, dragon ball, cappello, cappellodragon ball,cappello dragonball, berretto dragon ball, berretto dragonball, goku', 'Cappello da baseball con licenza ufficiale [en]Dragon Ball[/en] Z\r\nToppa [ja]Muten Roshi[/ja] sul davanti, motivo: personaggio sul lato', 'USA', 18, 'CL-DBZ-2-GO3', 'Taglia unica', '100_g|grammi_', 5, '19.99'),
(98, 'Funko Pop 122 - Unipd Collection Andrea Simion', 'uploads/andrea-simion-funko-pop.png', 'unipd, laboratorio, tecnico, universit&agrave; degli studi di padova, edizione limitata', '[en]Funko Pop[/en] 122 Collezione Unipd. \r\nStatuina del tecnico Andrea Simion.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10122', '&lrm;6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(99, 'Funko Pop 127 - Unipd Collection Mirko Franco', 'uploads/mirko-franco-funko-pop.png', 'unipd, tecnologie web, web development, dottorando, universit&agrave; degli studi di padova, edizione limitata', '[en]Funko Pop[/en] 127 Collezione Unipd. \r\nStatuina del dottorando Mirko Franco.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10127', '&lrm;6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `recensione`
--

INSERT INTO `recensione` (`ID`, `prodotto`, `utente`, `contenuto`, `punteggio`) VALUES
(1, 66, 1, 'Gioco molto avvincente. Un classico gioco da tavolo per passare ore con amici.', '4.5'),
(2, 79, 1, 'Classico e semplice ma troppo legato al caso per giocatori più esperti.', '2.0'),
(3, 96, 1, '', '0.0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `faq`
--
ALTER TABLE `faq`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `marca`
--
ALTER TABLE `marca`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT per la tabella `recensione`
--
ALTER TABLE `recensione`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `recensione`
--
ALTER TABLE `recensione`
  ADD CONSTRAINT `prodotto` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
