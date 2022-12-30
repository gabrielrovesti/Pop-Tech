# PopTech
Web Technologies Project at University of Padua, 2022/2023 taught by Prof. Gaggi

## Indicazione collegamento Tecweb disponibile al link:

https://docs.google.com/document/d/1ujVBFSKjLlNxy4Gqv3hF6krkaI-_Z7zm/edit 

## Documentazione disponibile su Google Drive al link:

https://drive.google.com/drive/folders/1FS94n1iyw7iEUqW0HgsJ9iBf5w9uaIvi?usp=sharing

## Mockup Figma disponibile al link:

https://www.figma.com/file/VKGBmJToHccll3PvxvOG05/TechWeb?node-id=0%3A1&t=BvfcF5MTfd44gOxZ-0

## Come installare il progetto in localhost

Scaricare un programma per la creazione del server locale

- [XAMPP Server](https://www.apachefriends.org/download.html)
- [WAMP Server](https://www.wampserver.com/en/download-wampserver-64bits/)

_meglio utilizzare PHP 8_

### Clonare la repository 

Scaricare la repository via zip o clonare con

`git clone https://github.com/gabrielrovesti/PopTech`

nella cartella poptech nel localhost (solitamente in una cartella chiamata "htdocs" dentro la cartella "xampp")
 
### Usare il progetto

Aprire il browser e andare su [http://localhost/poptech](http://localhost/poptech)

_have fun_

### Eventuali errori & Troubleshooting

- (Windows) XAMPP non si chiude e dà come errore "Eaccess Exception"
-- https://stackoverflow.com/questions/32839132/xampp-access-violation-at-address-005abeffe

- #1045 - Access denied for user 'root'@'localhost' (using password: YES)
-- Mettere password vuota nel file "connection.php" per l'utente "root"

- Non si vedono le modifiche in browser
-- Cancellare cache e cookie e ricaricare la pagina
