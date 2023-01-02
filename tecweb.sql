-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 02, 2023 at 09:31 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

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
  `inPrimaPagina` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`ID`, `nome`, `inPrimaPagina`) VALUES
(1, 'Manga', 0),
(2, 'Fumetti', 1),
(3, 'Videogiochi', 0),
(4, 'Action Figures', 1),
(5, 'Apparel', 1),
(6, 'Giochi da Tavolo', 0);

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
(1, 'Quanto ci mettono ad arrivare gli ordini dal Giappone?', 'Gli ordini dal Giappone impiegano circa una settimana ad arrivare nella nostra sede'),
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
-- Table structure for table `prodotto`
--

CREATE TABLE `prodotto` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(400) NOT NULL,
  `immagine` varchar(300) NOT NULL,
  `altImmagine` varchar(500) DEFAULT NULL,
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

INSERT INTO `prodotto` (`ID`, `nome`, `immagine`, `altImmagine`, `descrizione`, `origine`, `marca`, `modello`, `dimensione`, `peso`, `categoria`, `prezzo`) VALUES
(1, '[en]Funko Pop[/en] 593 [en]Marvel[/en]: Anniversario 80 anni', 'uploads/spiderman-funko-pop.jpg', NULL, 'Da [en]marvel[/en], [en]Spider Man[/en] come prima apparizione.\r\nDai un\'occhiata alle altre figure [en]Marvel[/en] di [en]Funko[/en] e collezionali tutte\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '46952', '‎6.35 x 6.35 x 9.53 _cm|centimetri_', '136_g|grammi_', 4, '20.00'),
(2, '[en]Funko Pop Games[/en] 598 - [en]Pokemon[/en] [ja]Pikachu[/ja] Arrabbiato', 'uploads/pikachu-funko-pop.jpg', NULL, '[en]Funko Pop Games[/en] 598 [en]Pokemon[/en] [ja]Pikachu[/ja] Arrabbiato .\r\nGuarda le altre figure Funko dedicate a questa collezione. \r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '65043', '‎6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '17.90'),
(3, '[en]Funko Pop[/en] 123 - Unipd [en]Collection[/en] Ombretta Gaggi', 'uploads/ombretta-gaggi-funko-pop.png', NULL, '[en]Funko Pop[/en] 123 Collezione Unipd. \r\nStatuina della Professoressa Ombretta Gaggi.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10123', '‎6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(4, '[en]Funko Pop[/en] 124 - Unipd [en]Students Collection[/en] Gabriel Rovesti', 'uploads/gabriel-rovesti-funko-pop.png', NULL, '[en]Funko Pop[/en] 124 Collezione Unipd [en]Students[/en] . \r\nStatuina dello studente Gabriel Rovesti.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10124', '‎6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(5, '[en]Funko Pop[/en] 125 - Unipd [en]Students Collection[/en] Erica Cavaliere', 'uploads/erica-cavaliere-funko-pop.png', NULL, '[en]Funko Pop[/en] 125 Collezione Unipd [en]Students[/en].\r\nStatuina della studente Erica Cavaliere.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10125', '‎6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(6, '[en]Funko Pop[/en] 126 - Unipd [en]Students Collection[/en] Giulio Moretto', 'uploads/giulio-moretto-funko-pop.png', NULL, '[en]Funko Pop[/en] 126 Collezione Unipd [en]Students[/en].\r\nStatuina dello studente Giulio Moretto.\r\n[en]Funko POP[/en] è il vincitore del premio [en]Toy of the Year[/en] e [en]People\'s Choice[/en] 2018', 'Giappone', 1, '10125', '‎6 x 5.5 x 9.5 _cm|centimetri_', '102_g|grammi_', 4, '20.00'),
(7, '[en]One Piece[/en] Figura [ja]Anime[/ja] [en]Luffy & Shanks[/en]', 'uploads/one-piece-luffy-shanks.jpg', NULL, '[en]Action Figure[/en] tratta dall\'[ja]anime[/ja] [en]One Piece[/en] dei personaggi [en]Luffy & Shanks[/en] mentre [en]Shanks[/en] dona il suo cappello a [en]Luffy[/en].', 'Cina', 2, 'OPLS12', 'Altezza 18_cm|centimetri_', '150_g|grammi_', 4, '19.99'),
(8, 'Statuina [en]Batman Multiverse Three Jokers[/en]', 'uploads/batman-action-figure.jpg', NULL, 'Figura in scala da 7 pollici incredibilmente dettagliata basata sul multiverso DC.\r\nProgettato con Ultra Articulation con fino a 22 parti mobili per una gamma completa di posa e gioco.\r\nBatman è basato sul suo look in Batman: Three Jokers Comics.\r\nBatman include un lanciatore e una base.', 'Cina', 3, 'TM30137', '‎5.08 x 2.54 x 17.78 _cm|centimetri_', '310_g|grammi_', 4, '29.99'),
(10, 'Ritorno al Futuro [en]Doc Brown Ultimate 7 Action Figure[/en]', 'uploads/doc-brown-action-figure.jpg', NULL, 'Figura in scala del personaggio [en]Doc Brown[/en] nell\'anno 1955. \r\nCon disegni chiavi inglese e due tipi di orologio.', 'Cina', 4, '53614', '‎27.51 x 15.9 x 6.5  _cm|centimetri_', '308.44_g|grammi_', 4, '44.50'),
(11, 'La saga del gran demone Piccolo. [en]Dragon Ball full color[/en] (Vol. 3)', 'uploads/dragon-ball-manga.jpg', NULL, 'Un\'edizione completamente a colori del capolavoro del maestro [ja]Toriyama[/ja]! \r\nUna pubblicazione divisa per saghe, lanciata in Giappone dalla casa editrice [ja]Shueisha[/ja], ora finalmente disponibile anche per i lettori italiani!', 'Giappone', 5, '8822611438', '11.2 x 1.5 x 17.1 _cm|centimetri_', '280_g|grammi_', 1, '6.56'),
(12, '[en]One piece[/en]. [en]New edition[/en] (Vol. 30)', 'uploads/one-piece-manga.jpg', NULL, '[en]Big Mom[/en], una temibile ed estremamente affamata signora della guerra pirata, si abbatte su [en]Luffy[/en] e il suo equipaggio in cerca di torta nuziale e vendetta. \r\n[en]Luffy[/en] si scontra con il figlio goloso [ja]Katakuri[/ja] mentre l\'equipaggio di Cappello di paglia combatte per proteggere la loro nave e le loro vite.', 'Giappone', 5, '8864202161', '11.4 x 1.7 x 17 _cm|centimetri_', '240_g|grammi_', 1, '4.30'),
(13, '[ja]Pokémon[/ja]. La grande avventura (Vol. 1)', 'uploads/pokemon-manga.jpg', NULL, 'Nella regione di [ja]Kanto[/ja] il giovane allenatore Rosso lascia la sua casa per completare il [en]Pokédex[/en], battere gli otto capopalestra, vincere le loro medaglie e conquistarsi il diritto di sfidare la Lega [ja]Pokémon[/ja]. \r\nSulla sua strada troverà però un acerrimo rivale e il terribile [en]Team Rocket[/en], l\'organizzazione malvagia che non si fa scrupoli a usare i mostriciattoli tascabili per raggiungere i suoi obbiettivi criminali.', 'Giappone', 6, '8868837854', '17.2 x 3.2 x 12.5 _cm|centimetri_', '620_g|grammi_', 1, '9.40'),
(14, 'Io sono [ja]Doraemon[/ja]', 'uploads/doraemon-manga.jpg', NULL, '[ja]Doraemon[/ja] è un grosso gatto robot amante delle brioschine ai fagioli arrivato dal futuro per aiutare su [ja]Nobita[/ja], un ragazzino pigro, poco studioso e totalmente negato per lo sport, spesso vittima delle angherie dei compagni [ja]Gian[/ja] e [ja]Suneo[/ja]. \r\nPer fortuna ora c\'è [ja]Doraemon[/ja] a tirarlo fuori dai guai, e ad assicurarsi che [ja]Nobita[/ja] impari la lezione.', 'Giappone', 5, '8804672889', '‎  19.5 x 2.4 x 29.3 _cm|centimetri_', '1.02 _kg|kilogrammi_', 1, '19.00'),
(15, '[en]Dragon Ball[/en]. [en]Ultimate edition[/en] (Vol. 1)', 'uploads/dragon-ball-ultimate-manga.jpg', NULL, 'Ecco la [en]Dragon Ball Ultimate Edition[/en], lussuosissima riedizione della fondamentale opera del maestro [ja]Toriyama[/ja] che, con i testi recentemente aggiornati, riprende il formato e la grafica della \"leggendaria\" [en]Perfect Edition[/ja].\r\nL\'edizione proporrà anche le pagine a colori originali realizzate in occasione della prima pubblicazione in Giappone su rivista, per regalare a vecchi e nuovi lettori un\'esperienza di lettura il più fedele possibile all\'originale giapponese!', 'Giappone', 5, '8822632648', '15 x 2.3 x 21 _cm|centimetri_', '520_g|grammi_', 1, '14.25'),
(16, '[en]Dragon Ball[/en]. [en]Evergreen edition[/en] (Vol. 18)', 'uploads/dragon-ball-evergreen-manga.jpg', NULL, 'In questo numero, mentre il giovane figlio di [ja]Goku[/ja], dotato di poteri straordinari, inizia a sottoporsi ad allenamenti speciali, i nemici giunti dallo spazio ripartono alla carica...', 'Giappone', 5, '8864204741', '17.5 x 1.4 x 11.5 _cm|centimetri_', '140_g|grammi_', 1, '4.08'),
(17, '[en]One piece[/en]. [en]New edition[/en] (Vol. 42)', 'uploads/one-piece-manga-vol-42.jpg', NULL, 'Mentre [en]Franky[/en] se la cava egregiamente sconfiggendo [ja]Fukuro[/ja], [en]Chopper[/en] ingoia una [en]Rumble Ball[/en] di troppo, trasformandosi in una mostruosa creatura. \r\nNel frattempo, [ja]Spandam[/ja] aziona inavvertitamente il golden lumacofono', 'Giappone', 5, '8864202285', '11.3 x 1.5 x 17.5 _cm|centimetri_', '181_g|grammi_', 1, '4.08'),
(18, '[en]One piece[/en]. [en]New edition[/en] (Vol. 3)', 'uploads/one-piece-manga-vol-3.jpg', NULL, 'Nuova edizione del terzo volumetto della serie del pirata con il capello di paglia. Le vecchie avventure di [en]Luffy[/en] e la sua ciurma in viaggio per i sette mari.', 'Giappone', 5, '8864201890', '17.1 x 1.1 x 10.3 _cm|centimetri_', '100_g|grammi_', 1, '4.30'),
(19, '[en]One piece[/en]. [en]New edition[/en] (Vol. 4)', 'uploads/one-piece-manga-vol-4.jpg', NULL, 'Nuova edizione del quarto volumetto della serie del pirata con il capello di paglia. Le vecchie avventure di [en]Luffy[/en] e la sua ciurma in viaggio per i sette mari.', 'Giappone', 5, '8864201904', '17.1 x 1.1 x 10.3 _cm|centimetri_', '120_g|grammi_', 1, '4.30'),
(20, '[en]Pretty guardian Sailor Moon[/en]. [en]New edition[/en]. (Vol. 9)', 'uploads/sailor-moon-manga.jpg', NULL, 'Il macabro tendone del [en]Dead Moon Circus[/en] campeggia sulla città e minaccia di farla sprofondare in un incubo senza risveglio. \r\n[ja]Usagi[/ja] e [ja]Chibiusa[/ja] cadono vittime del potere del nemico e non saranno le sole a sperimentarne gli effetti \"distorcenti\". \r\n[ja]Mamoru[/ja], dal canto suo, si sente sempre più debole..', 'Giappone', 5, '8822610504', '1.4 x 2 x 17.2 _cm|centimetri_', '120_g|grammi_', 1, '4.46'),
(21, 'Le grandi storie di Topolino 1979', 'uploads/grandi-storie-topolino.jpg', NULL, 'Milano, Mondadori, 1979, cartonato editoriale con copertina illustrata a colori, pagine 204 completamente illustrato da fumetti a colori. Prima edizione.', 'Italia', 7, 'B00GC4J9AK', '‎  19.5 x 2.4 x 29.3 _cm|centimetri_', '2.14 _kg|kilogrammi_', 2, '28.30'),
(22, 'Topolino N. 2242', 'uploads/topolino-2242.jpg', NULL, 'Edizione del 1998, usato in buone condizioni. Costa e copertina logorate e pagine ingiallite.', 'Italia', 8, '5000089455953', '‎  19.5 x 2.4 x 29.3 _cm|centimetri_', '120_g|grammi_', 2, '3.37'),
(23, 'Trilogia di Topolino. 3 grandi storie del 1938 - 1940', 'uploads/trilogia-topolino.jpg', NULL, 'Milano, Mondadori, 1969, ottavo cartonato originale con copertina illustrata a colori, 220 pagine completamente illustrato a colori e da fumetti. A cura di Mario Gentilini.', 'Italia', 8, '2567704350711', '‎  19.5 x 2.4 x 29.3 _cm|centimetri_', '1.2 _kg|kilogrammi_', 2, '18.00'),
(24, 'Topolino Giornale 673/734 59 Numeri. Anno 1948.', 'uploads/topolino-giornale.jpg', NULL, 'Topolino Giornale 673/734, anno 1948, mancano i numeri 721 e 724.\r\n59 numeri in totale, tutti in condizioni ottime.', 'Italia', 7, '2565666162731', '‎27.51 x 15.9 x 6.5  _cm|centimetri_', '75_g|grammi_', 2, '499.99'),
(25, 'Viaggio In Italia con Topolino 2 luoghi E Volti D\'italia nelle più Belle Storie A Fumetti', 'uploads/topolino-viaggio-in-italia.jpg', NULL, 'L’italia torna ad essere il paese dove i personaggi Disney hanno vissuto indimenticabili avventure! In questo nuovo to po libro da collezione sono raccolte quattro belle storie che vedono Paperi e topi incontrare o calarsi nei panni di personaggi storici del calibro di Leonardo da Vinci e Leopardi, oppure occuparsi di monumenti famosi come in Zio papero e la Torre di Pisa di Giorgio pezzi e Giorgio Cavazzano.', 'Italia', 10, 'B079JVKCVS', '20 x 15.8 x 2.6 _cm|centimetri_', '370_g|grammi_', 2, '14.90'),
(26, 'Topolino: Le più belle storie mitologiche. Edizione illustrata', 'uploads/topolino-mitologia.jpg', NULL, 'Una divertente selezione delle più belle storie a fumetti a tema mitologico con protagonisti i personaggi [en]Disney[/en].', 'Italia', 10, '8852224343', '20 x 15.8 x 2.6 _cm|centimetri_', '380_g|grammi_', 2, '9.40'),
(27, 'Topolino 1718. Ottoble 1988', 'uploads/topolino-1718.jpg', NULL, 'Topolino numero 1718 dell\'anno 1988. Usato in buone condizioni.', 'Italia', 8, '2560035415180', '‎  19.5 x 2.4 x 29.3 _cm|centimetri_', '120_g|grammi_', 2, '9.99'),
(28, 'Zerocalcare. Ogni maledetto lunedì su due.', 'uploads/zerocalcare-lunedi.jpg', NULL, 'Questo libro è stato la prima raccolta di storie del blog di Zerocalcare, ma negli anni è diventato molto di più, e ora è considerato una parte fondamentale del suo catalogo.\r\nLa lunga storia a colori che punteggia i capitoli della raccolta è stata la prima presa di coscienza lunga sul percorso, umano, politico e artistico, dell’autore nella sua età adulta.', 'Italia', 10, '8832737094', '25 x 2.6 x 17.6 _cm|centimetri_', '790_g|grammi_', 2, '19.00'),
(29, '[en]Scott Pilgrim[/en]. Una vita niente male (Vol. 1)', 'uploads/scott-pilgrim-vol-1.jpg', NULL, 'Primo volume della graphic novel \"[en]Scott pilgrim[/en]\". \r\nLa vita di [en]Scott pilgrim[/en] è davvero niente male. \r\nHa ventitré anni, suona in una [en]band[/en], si sveglia all\'ora che gli pare e ultimamente esce anche con una tipa carina che praticamente gli muore dietro.', 'Canada', 11, '8817040843', '12 x 1 x 18 _cm|centimetri_', '259_g|grammi_', 2, '9.40'),
(30, '[en]Scott Pilgrim[/en] conro il mondo (Vol. 2)', 'uploads/scott-pilgrim-vol-2.jpg', NULL, 'Maledetti siano gli ex. Quelli che ti sei dimenticato e quelli che chissà che fine hanno fatto. \r\nQuelli che ancora non si rassegnano e quelli che non gliene importa niente. \r\nQuelli che soffrono come cani e quelli che tornano per seminare il caos.', 'Canada', 11, '881704086X', '12 x 1 x 18 _cm|centimetri_', '540_g|grammi_', 2, '9.40'),
(32, 'FIFA 23 [en]Standard Edition[/en] per [en]Play Station[/en] 5', 'uploads/fifa-23-ps5.jpg', NULL, 'Porta in campo il gioco più bello del mondo, con la tecnologia [en]HyperMotion[/en] 2 che offre ancora più realismo di gioco.\r\n[en]FIFA World Cup[/en] maschile e femminile, l\'aggiunta di squadre di club femminili, funzioni [en]cross-play[/en] e altro ancora.', 'Italia', 13, 'B0B6CK6RBN', '‎17.1 x 13.6 x 1.3 cm _cm|centimetri_', '70_g|grammi_', 3, '49.90'),
(33, 'FIFA 23 [en]Standard Edition[/en] per [en]XBox Series[/en] X|S', 'uploads/fifa-23-xbox.jpg', NULL, 'Porta in campo il gioco più bello del mondo, con la tecnologia [en]HyperMotion[/en] 2 che offre ancora più realismo di gioco.\r\n[en]FIFA World Cup[/en] maschile e femminile, l\'aggiunta di squadre di club femminili, funzioni [en]cross-play[/en] e altro ancora.', 'Italia', 13, 'B0B6CK6RBN', '‎17.1 x 13.6 x 1.3 cm _cm|centimetri_', '70_g|grammi_', 3, '49.90'),
(45, 'The Last of Us Parte I - [en]Remake[/en] per [en]Play Station[/en] 5', 'uploads/last-of-us-1-ps5.jpg', NULL, 'Grafica migliorata:[en]The Last of Us[/en] è stato completamente adattato usando le ultime tecnologie di [en]Naughty Dog[/en], per migliorare ogni aspetto visivo. \r\nL\'esperienza di gioco originale, pur rimasta fedele nella struttura, è stata arricchita con effetti di luce realistici, ambientazioni più dettagliate e scenari rivisita', 'USA', 15, 'B0B3X2N4PR', '17.1 x 13.6 x 1.5 _cm|centimetri_', '80_g|grammi_', 3, '55.99'),
(49, '[ja]Pokemon[/ja] Felpe con Cappuccio per Ragazzi [en]Pokeball[/en]', 'uploads/felpa-pokemon.jpg', NULL, 'La felpa grigio scuro dei [en]Pokemon[en] vede riprodotta una poketball al centro della maglia costituita interamente da silhouette di [ja]Pikachu[/ja].\r\n65% Poliestere, 35% Cotone.\r\nCon cappuccio e tasche accoglienti, la felpa dei Pokemon ha tutte le carte in regola per farlo diventare allenatore.', 'Cina', 19, 'B07R821NLQ', 'Taglie dai 4 ai 12 anni', '330_g|grammi_', 5, '27.95'),
(50, '[en]Pokemon[/en] Berretto [en]Baseball[/en] [ja]Pikachu[/ja] numero 25 Ufficiale Nero', 'uploads/berretto-pikachu.jpg', NULL, 'Prodotto con licenza ufficiale. Taglia unica\r\nBerretto da [en]baseball[/en] di qualità', 'Cina', 19, '‎BA221131POK', 'Taglia unica', '90_g|grammi_', 5, '19.55'),
(53, '[en]Star Wars[/en] Leia [en]Don\'t Call Me Princess[/en] Maglietta', 'uploads/maglietta-leia.jpg', NULL, 'Tinta unita: 100% Cotone; Grigio Cenere: 90% Cotone, 10% Poliestere; Altri Toni: 50% Cotone, 50% Poliestere', 'Cina', 20, '616DD0HT2BD', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '19.99'),
(54, '[en]Star Wars[/en] C3-PO e RD-2D [en]Droids Of Vader\'s Shadow[/en] Maglietta', 'uploads/maglietta-c3po-r2d2.jpg', NULL, 'Tinta unita: 100% Cotone; Grigio Cenere: 90% Cotone, 10% Poliestere; Altri Toni: 50% Cotone, 50% Poliestere', 'Cina', 20, '8BWQCXYTGN9', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '19.99'),
(55, 'Maglietta sviluppatore HTML CSS. Tag [en]Style[/en]', 'uploads/maglietta-style.jpg', NULL, 'Questo design di stile è perfetto per qualsiasi sviluppatore web o programmatore.\r\nFa un grande regalo per lo sviluppatore web nella tua vita.', 'Cina', 21, 'PB98QX77RKG', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '136.08_g|grammi_', 5, '16.99'),
(56, 'Maglietta Uomo [en]Doctor Who[/en] logo anni 70', 'uploads/maglietta-drwho-1.jpg', NULL, 'Maglietta da uomo a manica corta. Con logo colorato nello stile anni 70. \r\nLicenza ufficiale BBC.', 'Cina', 22, 'B07DN3RBX4', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '240_g|grammi_', 5, '29.77'),
(57, 'Maglietta Donna [en]Doctor Who Weeping Angels[/en]', 'uploads/maglietta-drwho-2.jpg', NULL, 'Maglietta da uomo a manica corta. Con statua [en]Weeping Angel[/en]. \r\nLicenza ufficiale BBC.', 'Cina', 22, 'B01C0RFLQI', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '101_g|grammi_', 5, '17.59'),
(58, 'Maglietta con logo HTML 5', 'uploads/maglietta-html5.jpg', NULL, 'Maglietta unisex a manica corta.\r\nCon logo a scudo HTML 5', 'Cina', 21, 'B08LG1GT9C', 'Taglie _S|[en]Small[/en]_, _M|[en]Medium[/en]_, _L|[en]Large[/en]_, _XL|[en]Extra Large[/en]_, _XXL|[en]Extra Extra Large[/en]_, _2XL|Due [en]Extra Large[/en]_, _4XL|Tre [en]Extra Large[/en]_', '107_g|grammi_', 5, '22.31'),
(59, '[en]Twister[/en] Gioco in Scatola versione 2020 in Italiano', 'uploads/twister.jpg', NULL, 'Ricordi quando giocavi a twister da bambino? Proprio come nel Twister classico, in questo gioco per bambini da 6 anni in su l’ultimo giocatore che rimane in piedi vince', 'USA', 23, '315-98831456', '26.67 x 4.13 x 26.67 _cm|centimetri_', '600_g|grammi_', 6, '14.99'),
(61, 'Cranium edizione Italiana', 'uploads/cranium.jpg', NULL, 'I giocatori possono dare dimostrazione del proprio talento.\r\nSono previsti gioco di parole, schizzi a mano libera, attività di investigazione, recitazione e altro ancora', 'USA', 23, '‎C1939103', '22.7 x 2.3 x 22.7 _cm|centimetri_', '1.4 _kg|kilogrammi_', 6, '29.49'),
(62, '[en]Trivial Pursuit[/en] Decennio: 2010 - 2020', 'uploads/trivial-pursuit.jpg', NULL, 'Dimostra quanto riesci a ricordare! Le domande all\'interno di questa versione del gioco Trivial Pursuit riflettono la cultura e le tendenze che hanno spopolato dal 2010 al 2020', 'USA', 23, 'B092ZXG72X', '6.3 x 26.7 x 26.7 _cm|centimetri_', '1.24 _kg|kilogrammi_', 6, '34.99'),
(63, '[en]Dobble[/en] - Divertente Gioco da Tavolo per Tutta la Famiglia', 'uploads/dobble.jpg', NULL, 'Dobble è un gioco di colpo d\'occhio e velocità: per vincere dovrete essere i più rapidi a trovare l\'unico simbolo in comune tra le carte svelate (ce n’è sempre uno!)', 'Francia', 24, '‎LPP01USASM', '21.91 x 4.13 x 9.21 _cm|centimetri_', '300_g|grammi_', 6, '14.88'),
(64, 'Dixit - Gioco da Tavolo di Immaginazione e Fantasia', 'uploads/dixit.jpg', NULL, 'Un affascinante gioco di carte e narrazione per stimolare immaginazione e fantasia: da giocare in famiglia e con gli amici.\r\nDixit si rivela essere un gioco sorprendente, conviviale e divertente, capace di coinvolgere giocatori di ogni età.', 'Francia', 24, '‎LIBDIX01IT', '28 x 28 x 6 _cm|centimetri_', '10_g|grammi_', 6, '24.90'),
(65, 'Passa la Bomba, Gioco di Divertimento', 'uploads/passa-la-bomba.jpg', NULL, 'Gioco di parole\r\n110 carte da gioco\r\nUn dado speciale\r\nBomba elettronica (richiede 2 batterie ministilo AAA 1,5V non incluse)\r\nVersione Italiana', 'Italia', 25, 'GU034/2', '24 x 17 x 8 _cm|centimetri_', '2 _kg|kilogrammi_', 6, '21.56'),
(66, 'Catan [en]Big Box[/en] edizione Italiana', 'uploads/catan.jpg', NULL, 'Consigliato: da 10 anni in su\r\nLingua: italiano\r\nLa big box di Catan ti dà subito la possibilità di giocare fino a 6 giocatori\r\nContiene anche Catan gioco di dadi\r\nContiene ottimi espansioni e ottimi scenari\r\nNumero di giocatori: da 3 a 6', 'USA', 25, '‎GU712', '32 x 46 x 10  _cm|centimetri_', '2.62 _kg|kilogrammi_', 6, '59.06'),
(67, 'I Pilastri delle Terra [en]Ken Follet[/en], edizione Italiana', 'uploads/pilastri-della-terra.jpg', NULL, 'Da giocare in due fino a quattro giocatori\r\nAdatto per bambini con età superiore di 12 anni', 'USA', 25, '‎MFG4119', '29.79 x 29.69 x 7.39 _cm|centimetri_', '1.06 _kg|kilogrammi_', 6, '31.42'),
(79, 'Jenga Classico', 'uploads/jenga.jpg', NULL, 'Fai in modo di evitare che la torre crolli; ciò richiede abilità, strategia e fortuna\r\nJenga Classico è un gioco intramontabile: divertente, non elaborato', 'USA', 23, '‎A2120EU4', '‎8 x 12 x 28.6 _cm|centimetri_', '780_g|grammi_', 6, '15.90'),
(87, '[en]STRAY[/en] per [en]Play Station[/en] 4', 'uploads/stray-ps4.jpg', NULL, 'Stray è un accattivante viaggio in compagnia di un felino che, con naturale curiosità, diventa protagonista di tanti momenti variegati, che vanno dalla risoluzione di enigmi piuttosto semplici a sequenze stealth, passando per fasi molto più movimentate.', 'USA', 17, 'B0BDZP6DNJ', '‎  17 x 13 x 2 _cm|centimetri_', '50_g|grammi_', 3, '34.90'),
(88, 'Leggende di Andor: Eroi Oscuri, Espansione per Le Leggende di Andor', 'uploads/andor.jpg', NULL, 'Adatto per attività di gruppo. La tematica del gioco è di espansione, Gioco per gruppi di 5 o 6 persone. Permette di sviluppare le capacità cognitive', 'USA', 25, '‎GU623', '29.7 x 15.1 x 4.5 cm _cm|centimetri_', '499_g|grammi_', 6, '19.90'),
(89, '[en]Cuphead[/en] per Nintendo [en]Switch[/en]', 'uploads/cuphead-switch.jpg', '', 'L’edizione fisica comprende:\r\nEspansione \"[en]The Delicious Last Course[/en]\"\r\nUna tessera \"[en]Cuphead Club Membership[/en]\" numerata singolarmente, ricorda le tessere dei club che si ricevevano per posta degli anni 30\r\nSei strisce di fumetti da collezione, scritte e illustrate con amore dal team di Studio MDHR.\r\nUna stupenda copertina reversibile disegnata a mano', 'Canada', 16, 'B0BHTW4JRW', '10.21 x 0.79 x 16.99 _cm|centimetri_', '50_g|grammi_', 3, '42.32'),
(90, '[en]Cuphead[/en] per per [en]Play Station[/en] 4', 'uploads/cuphead-ps4.jpg', '', 'L’edizione fisica comprende:\r\nEspansione \"[en]The Delicious Last Course[/en]\"\r\nUna tessera \"[en]Cuphead Club Membership[/en]\" numerata singolarmente, ricorda le tessere dei club che si ricevevano per posta degli anni 30\r\nSei strisce di fumetti da collezione, scritte e illustrate con amore dal team di Studio MDHR.\r\nUna stupenda copertina reversibile disegnata a mano', 'Canada', 16, 'B0BHTMF8LV', '17.1 x 13.6 x 1.7 _cm|centimetri_', '90_g|grammi_', 3, '49.99'),
(91, '[en]Cuphead[/en] per per [en]XBox One[/en]', 'uploads/cuphead-xbox.jpg', '', 'L’edizione fisica comprende:\r\nEspansione \"[en]The Delicious Last Course[/en]\"\r\nUna tessera \"[en]Cuphead Club Membership[/en]\" numerata singolarmente, ricorda le tessere dei club che si ricevevano per posta degli anni 30\r\nSei strisce di fumetti da collezione, scritte e illustrate con amore dal team di Studio MDHR.\r\nUna stupenda copertina reversibile disegnata a mano', 'Canada', 16, 'B0BHHTJR53', '&lrm; 17.1 x 13.6 x 1.4 _cm|centimetri_', '80_g|grammi_', 3, '45.99'),
(92, '[en]Sonic Frontiers[/en] per Nintendo [en]Switch[/en]', 'uploads/sonic-switch.jpg', '', 'Scopri il nuovo platforming a zona aperta: Sfreccia attraverso cinque isole ultraterrene piene di lussureggianti foreste, spumeggianti cascate e torridi paesaggi desertici e molto altro, ognuna con le sue sfide a piattaforme e i suoi segreti da scoprire.', 'Giappone', 14, 'B0BC9VZMTQ', '17 x 10.5 x 1.2 _cm|centimetri_', '50_g|grammi_', 3, '34.99'),
(93, '[en]Sonic Frontiers[/en] per [en]Play Station[/en] 4', 'uploads/sonic-ps4.jpg', '', 'Scopri il nuovo platforming a zona aperta: Sfreccia attraverso cinque isole ultraterrene piene di lussureggianti foreste, spumeggianti cascate e torridi paesaggi desertici e molto altro, ognuna con le sue sfide a piattaforme e i suoi segreti da scoprire.', 'Giappone', 14, 'B0BC9VZMTQ', '17 x 13.6 x 1.5 _cm|centimetri_', '80_g|grammi_', 3, '29.99'),
(94, '[en]Splatoon[/en] 3 per Nintendo [en]Switch[/en]', 'uploads/splatoon-3.jpg', '', 'In questo nuovo capitolo della serie [en]Splatoon[/en], i giocatori si lasceranno Coloropoli alle spalle per trasferirsi in una nuova area: Splattonia. \r\n[en]Splatoon[/en] 3 introduce diverse novità, come l’arma a forma di arco, opzioni di personalizzazione e nuove possibilità di movimento, da sfruttare nelle mischie mollusche 4 contro 4.', 'Giappone', 12, 'B08X849HXF', '16.9 x 10.4 x 1 _cm|centimetri_', '50_g|grammi_', 3, '47.99'),
(95, 'Ritorno al Futuro [en]Marty Mcfly Ultimate 7 Action Figure[/en]', 'uploads/marty-mcfly-action-figure.jpg', '', 'Figura in scala del personaggio [en]Marty McFly[/en] nell\'anno 1985. \r\nCon chitarra elettrica, [en]skateboard[/en], videocamera, occhiali da sole e zaino.', 'Cina', 4, '53600', '7.19 x 5.13 x 18.01 _cm|centimetri_', '272,6_g|grammi_', 4, '44.50'),
(96, '[ja]Muten Roshi[/ja] [en]Trucker cap Dragon Ball[/en] Z', 'uploads/dragon-ball-berretto-11672694709.jpg', '', 'Cappello da baseball con licenza ufficiale [en]Dragon Ball[/en] Z\nToppa Super [ja]Saiyan Goku[/ja] sul davanti, motivo: personaggio sul lato ', 'USA', 18, 'CL-DBZ-1-GO3', 'Taglia Unica', '100_g|grammi_', 5, '19.99'),
(97, '[ja]Saiyan Goku[/ja] [en]Trucker cap Dragon Ball[/en] Z', 'uploads/dragon-ball-berretto-21672694827.jpg', '', 'Cappello da baseball con licenza ufficiale [en]Dragon Ball[/en] Z\nToppa [ja]Muten Roshi[/ja] sul davanti, motivo: personaggio sul lato ', 'USA', 18, 'CL-DBZ-2-GO3', 'Taglia unica', '100_g|grammi_', 5, '19.99');

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

-- --------------------------------------------------------

--
-- Table structure for table `utente`
--

CREATE TABLE `utente` (
  `ID` int(10) UNSIGNED NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utente`
--

INSERT INTO `utente` (`ID`, `nome`, `email`, `password`, `admin`) VALUES
(1, 'User', 'user@user.com', '$2y$10$ae/uFTI3KInYS3n8sBXVmuUw33/ex8VoLzt73dnWGJlN2Pa.K8s9y', 0),
(2, 'Admin', 'admin@admin.com', '$2y$10$SFYKM6V9lhS7eWRuiRqWZu6IV43mEfcSGyVUhPM3GzRO9vWxQhwfG', 1);

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
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `recensione`
--
ALTER TABLE `recensione`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utente`
--
ALTER TABLE `utente`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
