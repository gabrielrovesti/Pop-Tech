drop table if exists Marca;
drop table if exists Categoria;
drop table if exists Prodotto;
drop table if exists Utenti;
drop table if exists Recensioni;
drop table if exists FAQ;



create table Marca (
	ID int not null,
    nome varchar(100) not null,
    PRIMARY KEY (ID)
);


create table Categoria (
    ID int not null,
    nome varchar(100) not null,
    inPrimaPagina bool not null,
    PRIMARY KEY (ID)
);


create table Prodotto (
    ID int not null,
    nome varchar(100) not null,
    immagine varchar(100) not null,
    altimmagine varchar(100) not null,
    descrizione varchar (300) not null,
    origine varchar (50) not null,
    marca_prod int not null,
    modello varchar (100) not null,
    dimensione varchar(60) not null,
    peso decimal (4,2) not null,
    categoria_prod int not null,
	prezzo decimal(4,2) not null,
	CHECK(prezzo >= 0),
	CHECK(peso >= 0),
    PRIMARY KEY (ID),
	FOREIGN KEY (marca_prod) REFERENCES Marca(ID),
	FOREIGN KEY (categoria_prod) REFERENCES Categoria(ID)
);


create table Utenti (
	ID int not null,
    nome varchar (100) not null,
    email varchar(100) not null,
	password varchar(50) not null,
	admin bool not null,
    PRIMARY KEY (ID)
);


create table Recensioni (
	ID int not null,
    prod int not null,
    utente int not null,
    contenuto varchar (100) not null,
    punteggio decimal (4,2) not null,
    PRIMARY KEY (ID),
	FOREIGN KEY (prod) REFERENCES Prodotto(ID),
	FOREIGN KEY (utente) REFERENCES Utenti(ID)
);



create table FAQ (
    ID int not null,
    domanda varchar(300) not null,
    risposta varchar (500) not null,
    PRIMARY KEY (ID)
);



-- POPOLAMENTO TABELLE ---------------------------------------------------------

insert into Marca (ID,nome) values
(1,'Ciccio pasticcio Pop');


insert into Categoria (ID, nome, inPrimaPagina) values
(1,'Funko Poppino Tattico', false);


insert into Prodotto (ID, nome, immagine, altimmagine, descrizione, origine, marca_prod, modello, dimensione, peso, categoria_prod, prezzo) values
(1, 'Funko Pop 1', 'Funko1.jpg', 'Funko1alt.jpg', 'Bello!', 'Sri Lanka', 1, 'Ak-47', '2', 11.00 , 1, 10.00),
(2, 'Funko Pop 2', 'Funko2.jpg', 'Funko2alt.jpg', 'Bello!', 'Guatemala', 1, 'Cecchino no scope headshot babyyy', '2', 11.00 , 1, 11.00);


insert into Utenti (ID,nome,email,password,admin) values
(1,'Leonidasss','leonidas.sonoStupido@tiBoccio.it','voleeeeevi',false);


insert into Recensioni (ID, prod, utente, contenuto, punteggio) values
(1,1,1,'Acquistalo oppure ti uccido', 10.00);



insert into FAQ (ID,domanda,risposta) values
(1, 'Quanto mi scammate da 1 a 10?', 'Solo UN PO');
