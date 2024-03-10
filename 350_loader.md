# Installazione del software e utilizzo degli strumenti

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## LOADER

E’ uno strumento da utilizzare tramite linea di comando (eseguibile sqlldr) che permette il caricamento di dati da file “con separatore” (CSV) o a “larghezza fissa” (TXT). 
In entrambi i casi è necessaria la presenza di un Control file (estensione .ctl) contenente le specifiche tecniche del flusso di origine e delle tabelle di destinazione.
Si utilizzano istruzioni come le seguenti (sono identiche se non per il riferimento a file diversi):

    sqlldr scott/tiger@XE control=dbocb_350_csv.ctl data=dbocb_350_csv.csv bad=dbocb_350_csv.bad log=dbocb_350_csv.log

    sqlldr scott/tiger@XE control=dbocb_350_txt.ctl data=dbocb_350_txt.txt bad=dbocb_350_txt.bad log=dbocb_350_txt.log

A seguire il dettaglio dei file utilizzati nei due esempi.


-----------------------------------
### File con separatore (o a lunghezza variabile)

Esempio di file di dati [dbocb_350_csv.csv](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/dbocb_350_csv.csv):

    "n";"t";"d";
    "123.45";"aaaaa";"01/01/2001";
    "456";"bbbbbbbbb";"02/02/2002";
    "7";"ccc";"";
    "8989,89";"";"04/04/2004";
    "";"eeeeeee";"05/05/2005";

NB: l'intestazione potrebbe essere assente o occupare più righe, l'identificatore di valore potrebbe essere diverso o non esserci, il separatore potrebbe essere diverso e il formato della data potrebbe essere diverso, in conformità delle scelte applicate dal fornitore del file

-----------------------------------

Esempio di file di controllo [dbocb_350_csv.ctl](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/dbocb_350_csv.ctl):

    OPTIONS (errors = 1, skip=1)
    LOAD DATA
    
    INTO TABLE SCOTT.PROVA
    TRUNCATE
    FIELDS TERMINATED BY ';' Optionally enclosed by '"'
    (
    N "to_number(:N    ,'9999999999D9999','NLS_NUMERIC_CHARACTERS='',.''')",
    T,
    D "to_date(:D,'dd/mm/yyyy')"
    )

NB: l'intestazione potrebbe essere assente o occupare più righe, l'identificatore di valore potrebbe essere diverso o non esserci, il separatore potrebbe essere diverso e il formato della data potrebbe essere diverso, in conformità delle scelte applicate dal fornitore del file


-----------------------------------
### File a lunghezza fissa

Esempio di file di dati  [dbocb_350_txt.txt](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/dbocb_350_txt.txt):

    n            t              d
    741          qwerty         10/02/2020
    852          asdfgh         11/02/2020
    963          zxcvbn         12/02/2020

NB: l'intestazione potrebbe essere assente o occupare più righe, non è presente l'identificatore di valore, non è presente il separatore perchè ogni campo ha una dimensione definita e il formato della data potrebbe essere diverso, in conformità delle scelte applicate dal fornitore del file

-----------------------------------

Esempio di file di controllo [dbocb_350_txt.ctl](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/dbocb_350_txt.ctl):

    options (errors = 0,skip=1)
    LOAD DATA
    into table scott.prova
    truncate
    (
      N	   position(1 : 13) "to_number(:N    ,'9999999999D9999','NLS_NUMERIC_CHARACTERS='',.''')",
      T	   position(14 : 28),
      D    position(29 : 38) "to_date(:D,'dd/mm/yyyy')"
    )

NB: l'intestazione potrebbe essere assente o occupare più righe, non è presente l'identificatore di valore, non è presente il separatore perchè ogni campo ha una dimensione definita e il formato della data potrebbe essere diverso, in conformità delle scelte applicate dal fornitore del file

-----------------------------------

NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

