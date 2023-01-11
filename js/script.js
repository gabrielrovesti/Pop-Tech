// Mostra o nascondi il menu mobile
// usato dal menu "hamburgher"
function toggleMobileMenu(){
    document.querySelector("nav#menu").classList.toggle("show");
}

var checks = {};

//Aggiungi l'evento onBlur agli elementi del form
function addFieldsEvent(){

    let inputs    = document.getElementsByTagName('input');
    let selects   = document.getElementsByTagName('select');
    let textareas = document.getElementsByTagName('textarea');

    for (i = 0; i < inputs.length; i++) {
       inputs.item(i).addEventListener('blur',validateField);
    } 

    for (i = 0; i < selects.length; i++) {
        selects.item(i).addEventListener('blur',validateField);
    }

    for (i = 0; i < textareas.length; i++) {
        textareas.item(i).addEventListener('blur',validateField);
    }
    
}

//Validazione javascript dei form prima dell'invio
function validateField(event){

    let name = event.target.getAttribute('name');
    let value = event.target.value; //cerca nell'array dei controlli se esiste una regola per quel campo

    if(checks[name]){

        if(!checks[name].condition(value)){  //non passa il test

            if(event.target.nextSibling){ //Togli il tag p di errore se già presente
              if(event.target.nextSibling.tagName == 'P')
                event.target.nextSibling.remove();
            }

            if(event.target.getAttribute('aria-alert')){//Togli aria-alert se già presente
                event.target.setAttribute('aria-label','');
            }

            //Crea tag <p> con il messaggio di errore
            let newElement = document.createElement('p');
            newElement.classList.add('formError');
            newElement.innerHTML = checks[name].message;

            //Classe di stile con errore
            event.target.classList.add('fieldError');

            //Inserisci il messaggio errore
            event.target.parentNode.insertBefore(newElement, event.target.nextSibling);

            event.target.parentNode.querySelector('input[type=submit]').setAttribute('disabled','disabled');


        }else{
            //Controllo passato
            if(event.target.nextSibling){ //Togli il tag p di errore se già presente
                if(event.target.nextSibling.tagName == 'P')
                  event.target.nextSibling.remove();
            }
            event.target.classList.remove('fieldError'); //Togli classe di errore dal campo

            event.target.parentNode.querySelector('input[type=submit]').removeAttribute('disabled');
        }
    }
}

function setContattiChecks(){

    checks = {
        nome:{
            message:"Inserire un nome lungo almeno 2 caratteri.",
            condition: function(str){
                return str.length>2;
            }
        },
        telefono:{
            message:"Inserire un numero di telefono valido composto da solo cifre numeriche.",
            condition: function(str){
                let expr = /^[0-9]+$/;
                return expr.test(str);
            }
        },
        email:{
            message:"Inserire un indirizzo email valido.",
            condition: function(str){
                let expr = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return expr.test(str.toLowerCase());
            }
        },
        messaggio:{
            message:"Inserire un messaggio di almeno 10 caratteri.",
            condition: function(str){
                return str.length>=10;
            }
        },
        privacy:{
            message:'Per cortesia accettare la <span lang="en">Privacy Policy</span> per spedire il messaggio.',
            condition: function(str){
                return document.querySelector('input[name=privacy]').checked == true;
            }
        },
    }

}

// Admin checks

function setAdminLoginChecks(){

    checks = {
        email:{
            message:"Inserire un indirizzo email valido.",
            condition: function(str){
                let expr = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return expr.test(str.toLowerCase());
            }
        },
        password:{
            message:"Inserire una password di almeno 5 caratteri.",
            condition: function(str){
                return str.length>=5;
            }
        }
    }

}

function setAdminProdottoChecks(){
   
    checks = {
        nome:{
            message:"Inserire un nome con almeno 5 caratteri.",
            condition: function(str){
                return str.length>=5;
            }
        },
        categoria:{
            message:"Selezionare una categoria.",
            condition: function(str){
                return str!=0;
            }
        },
        origine:{
            message:"Inserire una nazione di originea.",
            condition: function(str){
                return str.length>0;
            }
        },
        marca:{
            message:"Selezionare una marca.",
            condition: function(str){
                return str!=0;
            }
        },
        modello:{
            message:"Inserire un modello.",
            condition: function(str){
                return str.length>0;
            }
        },
        descrizione:{
            message:"Inserire una descrizione con almeno 10 caratteri.",
            condition: function(str){
                return str.length>=10;
            }
        },
        dimensione:{
            message:"Inserire una dimensione con almeno 2 caratteri.",
            condition: function(str){
                return str.length>=2;
            }
        },
        peso:{
            message:"Inserire un peso con almeno 2 caratteri.",
            condition: function(str){
                return str.length>=2;
            }
        },
        prezzo:{
            message:"Inserire un prezzo numerico maggiore di zero.",
            condition: function(str){
                return (!isNaN(parseFloat(str))) && parseFloat(str)>0;
            }
        }
        //immagine controllata da PHP quando avviene l'umpoad
    };
}

function setAdminCategoriaMarcaChecks(){
    checks = {
        nome:{
            message:"Inserire un nome con almeno due caratteri.",
            condition: function(str){
                return str.length>=2;
            }
        },
        keywords:{
            message:"Inserire delle keywords.",
            condition: function(str){
                return str.length>=2;
            }
        },
        descrizione:{
            message:"Inserire una descrizione di almeno 50 caratteri.",
            condition: function(str){
                return str.length>=50;
            }
        }
    };
}

function setAdminUtenteChecks(){
    checks = {
        nome:{
            message:"Inserire un nome con almeno due caratteri.",
            condition: function(str){
                return str.length>=2;
            }
        },
        password:{
            message:"Inserire una password con almeno quattro caratteri.",
            condition: function(str){
                return str.length>=4;
            }
        },
        email:{
            message:"Inserire un indirizzo email valido.",
            condition: function(str){
                let expr = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return expr.test(str.toLowerCase());
            }
        }
    };
}

function setAdminFAQChecks(){
    checks = {
        domanda:{
            message:"Inserire una domanda con almeno dieci caratteri.",
            condition: function(str){
                return str.length>=10;
            }
        },
        risposta:{
            message:"Inserire una risposta con almeno dieci caratteri.",
            condition: function(str){
                return str.length>=10;
            }
        }
    };
}

// User Checks

function setUserLoginChecks(){

    checks = {
        email:{
            message:"Inserire un indirizzo email valido.",
            condition: function(str){
                let expr = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return expr.test(str.toLowerCase());
            }
        },
        password:{
            message:"Inserire una password di almeno 4 caratteri.",
            condition: function(str){
                return str.length>=4;
            }
        }
    }

}

function setUserProfiloChecks(){
    checks = {
        nome:{
            message:"Inserire un nome con almeno due caratteri.",
            condition: function(str){
                return str.length>=2;
            }
        },
        password:{
            message:"Inserire una password con almeno quattro caratteri.",
            condition: function(str){
                return str.length>=4;
            }
        },
        email:{
            message:"Inserire un indirizzo email valido.",
            condition: function(str){
                let expr = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return expr.test(str.toLowerCase());
            }
        }
    };
}

function setUserRecensioneChecks(){
    checks = {
        contenuto:{
            message:"Inserire il contenuto della recesione, con almeno 10 caratteri.",
            condition: function(str){
                return str.length>=10;
            }
        }
    };
}

function setUserRegistrazioneChecks(){
    checks = {
        nome:{
            message:"Inserire un nome con almeno due caratteri.",
            condition: function(str){
                return str.length>=2;
            }
        },
        password:{
            message:"Inserire una password con almeno quattro caratteri.",
            condition: function(str){
                return str.length>=4;
            }
        },
        password:{
            message:"Inserire una password con almeno quattro caratteri.",
            condition: function(str){
                return str.length>=4;
            }
        },
        passwordConfirm:{
            message:"Le password inserite non combaciano.",
            condition: function(str){
                return str == document.getElementById('password').value;
            }
        },
        email:{
            message:"Inserire un indirizzo email valido.",
            condition: function(str){
                let expr = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return expr.test(str.toLowerCase());
            }
        }
    };
}


//Aggiungi listener per evento scroll
//per il pulsante "torna in cima alla pagina"
function addScrollEventListener(){
    window.addEventListener("scroll",toggleUpButton)
}

//Mostra o nascondi il pulsante "torna in cima alla pagina"
//in base alla posizione di scroll
function toggleUpButton(){

    let button = document.getElementById('goUpButtton');
    let scrollPos = window.scrollY || window.scrollTop || document.getElementsByTagName("html")[0].scrollTop;
    
    let body = document.body; 
    let html = document.documentElement;

    let bodyHeight = Math.max( body.scrollHeight, body.offsetHeight, 
        html.clientHeight, html.scrollHeight, html.offsetHeight );

    if(scrollPos>bodyHeight/6){
        button.classList.add('show');
    }else{
        button.classList.remove('show');
    }

}