# Installazione e utilizzo di Oracle Sql Developer

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## INSTALLARE ORACLE SQL DEVELOPER

Dopo essersi registrati al portale Oracle andare nella pagina di download dedicata al prodotto:

https://www.oracle.com/tools/downloads/sqldev-downloads.html

1.	Scaricare il file zippato
2.	Decomprimere il file facendo si che il path completo non contenga spazi 
(ie. D:\sqldeveloper-19.4.0.354.1759-x64)
3.	Lanciare l’eseguibile di setup (ie. D:\sqldeveloper-19.4.0.354.1759-x64\sqldeveloper\sqldeveloper.exe)
4.	Procedere premendo No all’importazione di configurazioni precedenti:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/1e910090-d340-4595-b300-ab8014840785)

5.	Terminata l’autoconfigurazione, l’applicazione è disponibile:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/a4b52b86-2f42-4fec-8058-d8d460da269f)


-----------------------------------
## STRUMENTI DI ORACLE SQL DEVELOPER

-----------------------------------
### Aggiungere e utilizzare una connessione dati

1.	Selezionare l’apposito bottone nell’area di navigazione:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/6d00ca77-fb5e-4c45-a5e9-89c5f921b238)

2.	Nella finestra di dialogo impostare un nome identificativo, inserire l’utenza e la relativa password e indicare il database a cui si vuole accedere:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/33e18df9-61d4-410e-bd22-4c2d4b670b97)

3.	La nuova connessione è ora presente nel menù di navigazione:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/b529ca9e-b26a-4270-a529-0b3e2b97265b)

4.	Per creare un nuovo foglio di lavoro SQL è necessario selezionare l’apposito bottone (o premere Alt+F10) e quindi scegliere quale connessione utilizzare tra quelle disponibili:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/a92b7616-a846-4350-b9ee-9131e0961386)



-----------------------------------
### Funzioni e strumenti del foglio di lavoro SQL

A seguire una serie di informazioni pratiche su quanto evidenziato nell’immagine seguente:

*	Le istruzioni devono essere scritte nel “foglio di lavoro” e, se presenti in numero superiore a uno, ognuna deve essere corredata del carattere di fine istruzione. 
*	L’esecuzione della singola istruzione attiva (quella in cui si trova il cursore) avviene tramite la prima icona della barra degli strumenti (oppure con shift+invio): se l’istruzione è di tipo “select” l’output sarà restituito nella scheda “Risultato query” altrimenti nella scheda “Output script”.
*	L’esecuzione di uno script (una o più istruzioni selezionate o tutte quelle presenti, in assenza di una selezione) avviene tramite il secondo bottone (oppure con F5): l’output sarà restituito nella scheda “Output script”, nella stessa forma già vista in SQL Plus.
*	Per valutare modalità e tempi di elaborazione di una query è possibile utilizzare il terzo bottone (oppure il tasto F10) che esegue l’istruzione fornendo le informazioni richieste nella apposita scheda “Explain plan”.
*	Il sesto bottone (oppure il tasto F11) per mette di eseguire la COMMIT della transazione
*	Il settimo bottone (oppure il tasto F12) permette di eseguire il ROLLBACK della transazione
*	Il nono bottone (oppure la combinazione Ctrl+D) pulisce il foglio di lavoro
*	Il decimo bottone (oppure il tasto F8) attiva la scheda “Cronologia SQL”
*	Per attivare ed utilizzare la scheda “Output DBMS” (ovvero la console per la messaggistica da codice) è necessario prima selezionare la scheda stessa dal menù “Visualizza” e poi premere sul bottone “+”
*	Per eseguire rapidamente l’istruzione DESC su un oggetto è possibile utilizzare la combinazione di tasti Shift+F4

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/b1b20669-5208-48d6-ac98-58a61ae9b73f)


-----------------------------------

NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
