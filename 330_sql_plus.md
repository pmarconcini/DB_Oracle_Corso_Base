# Installazione del software e utilizzo degli strumenti

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## SQL PLUS

-----------------------------------
### ESECUZIONE

E’ il client fornito nel pacchetto da Oracle. 

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/734384c4-9332-49e6-9453-42a9d6c2fc66)
 

L’applicazione è avviabile anche da riga di comando, quindi è richiamabile da qualsiasi processo batch:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/b65fe946-6696-4f81-87d6-4fcc93023d9a)

 
Nel caso in cui si voglia accedere con un’utenza con privilegi di amministrazione è necessario specificare la dicitura AS _categoria_amministrazione_. 
I dati accesso possono essere indicati come parametri nell’esecuzione dell’applicazione.

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/68121280-a16e-486b-bffe-cee1f6680afa)



-----------------------------------
### CONNESSIONE

Nel caso in cui ci si voglia connettere ad altro DB e/o utilizzare un utente diverso è possibile procedere senza dover riavviare l’applicativo tramite l’istruzione CONNECT:

 ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/7ed7f9de-81f0-4e8a-9536-8f4eecd15f01)

Si può utilizzare la forma breve CONN. 
Il riferimento che segue la chiocciola è al SID (identificativo) del database; se omesso, si intende che la connessione sia al database predefinito (che è anche l’unico nel nostro caso).



-----------------------------------
### REGOLE DI SCITTURA ED ESECUZIONE

Nel caso di comandi/istruzioni SQL Plus (quindi non contenenti SQL) il testo deve essere su una unica riga ed è eseguito nel momento dell’invio. 
Le istruzioni possono risultare case sensitive a seconda del sistema operativo.

Nel caso di elaborazione di istruzioni SQL è possibile scrivere su più righe; il codice sarà considerato concluso alla presenza del carattere di chiusura “;” (o di una riga contenente esclusivamente il carattere “/”) e sarà eseguito al primo “invio” successivo al carattere stesso. 
La presenza di una riga vuota implica il completamento della scrittura dell’istruzione ma NON la sua esecuzione. 
Le istruzioni NON sono case sensitive.

Nel caso di elaborazione di codice PL/SQL è possibile scrivere il codice su più righe; il codice sarà considerato concluso alla presenza del carattere di chiusura “/” (poiché il carattere “;” indica la chiusura della singola istruzione) ed eseguito al primo “invio” successivo al carattere stesso. Le istruzioni NON sono case sensitive. L’identificazione del codice PL/SQL è automatica.
         
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/ea654635-1616-4ba2-a99f-7020379a3b78)
SQL+ Creazione funzione 			

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/9128c861-6f77-4a88-ae7b-b5a602652180)
SQL+ Creazione procedura



-----------------------------------
### BUFFER

L’ultimo tentativo di esecuzione di comandi SQL Plus andato a buon fine o l’ultimo tentativo di esecuzione di istruzione SQL o PL/SQL è memorizzato in un apposito buffer.
È possibile:
* Visualizzare il contenuto del buffer tramite l’istruzione LIST
* Ripulire il buffer tramite l’istruzione CLEAR BUFFER
* Aggiungere del testo all’ultima riga tramite l’istruzione APPEND
* Aggiungere una nuova riga di testo tramite l’istruzione INPUT
* Eliminare l’ultima riga tramite l’istruzione DEL LAST
  
 ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/adcda51b-dd95-47a6-9c8b-6741fc6aed1b)

* Editare (o creare) un script tramite l’istruzione EDIT (o ED, nella forma breve); indicando un nome viene creato anche il corrispondente file fisico con estensione .sql
* Memorizzare il contenuto del buffer come file tramite l’istruzione SAVE _nome_del_file_
* Ricaricare nel buffer il contenuto di uno script salvato tramite START (o @ o @@)
  
 ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/b780fb6b-0602-428f-9a13-2480fb0ac852)

* Eseguire il contenuto del buffer tramite l’istruzione RUN (o R, nella forma breve, o “/”)
  
 ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/a30f054a-9e7e-4322-9660-90dbb332c61b)

•	Inserire commenti su riga singola tramite l’istruzione REMARK <testo>; sono utilizzabili anche la forma breve REM o il tag “--" 
•	Inserire commenti su più righe racchiudendoli tra i tag di apertura “/*” e di chiusura “*/”
•	La cartella predefinita di salvataggio è quella in cui ci si trova al momento del lancio di SQL Plus tramite command (ie: C:\utenti\Paolo) oppure la sottodirectory BIN nel caso in cui il client sia lanciato da menù (ie: C:\OraXE\dbhomeXE\bin). E’ possibile comunque specificare un path diverso ad integrare il nome del file.



-----------------------------------
### RICERCA DEFINIZIONI

Tramite l’istruzione DESCRIBE _nome_tabella_O_vista_ è possibile ottenere le informazioni relative alla struttura dell’oggetto (nome delle colonne, nonnullità, tipo di dato); è utilizzabile anche la forma breve DESC.

  ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/9c23a49a-818f-4271-9854-a4a9ad062307)

In maniera analoga si può richiedere informazioni relative ai parametri di funzioni e procedure:

 ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/e299f2e3-381b-4071-a200-900a49d7fb9e)



-----------------------------------
### ESECUZIONE DI UNA PROCEDURA

Tramite l’istruzione EXECUTE (EXEC nella forma breve) è possibile eseguire una procedura. Non è possibile richiamare direttamente una funzione.
 
 ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/f1ffa7c5-a5fc-4bf4-90c7-ebc88acc89e5)



-----------------------------------
### ISTRUZIONI OPERATIVE E TASTI RAPIDI IN SQL PLUS

*	SHOW: Permette di visualizzare varie informazioni. 
  * SHOW ERRORS ==> restituisce informazioni relative ad eventuali errori dell’ultima compilazione di un oggetto
  * SHOW ERRORS <tipo oggetto>  <nome oggetto>  restituisce informazioni relative ad eventuali errori di compilazione dello specifico oggetto

 ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/fbd4461d-553b-45f5-b169-7a7c999a5d03)

  * SHOW USER restituisce l’utente connesso
  * SHOW ALL visualizza tutti i parametri di configurazione e gli attuali valori degli stessi
  * SHOW _nome_del_parametro_ visualizza il valore corrente di un singolo parametro
*	SET: permette di impostare molte variabili d’ambiente.
  * SET AUTOCOMMIT {ON|OFF} ==> imposta la modalità del salvataggio dei dati
  * SET DEFINE &variabile ==> imposta il valore per una variabile locale
  * SET FEEDBACK n|ON|OFF ==> imposta il numero di record esposti da una query
  * SET LINESIZE n ==> Imposta il numero di caratteri di larghezza del report video
  * SET NULL _testo_ ==> Imposta il valore da esporre in sostituzione dei valori nulli
  * SET PAGESIZE n ==> Imposta il numero di righe per ogni pagina
  * SET PAUSE ON|OFF|_testo_  ==> Imposta l’interruzione di pagina nell’esposizione a video
  * SET SERVEROUTPUT ON|OFF ==> Imposta lo stato del recepimento della messaggistica in console. 
         La scrittura avviene tramite la procedura di sistema DBMS_OUTPUT.PUT_LINE(_testo_);
*	SPOOL: Permette di avviare (SPOOL _nomefile_) o interrompere (SPOOL OFF) la scrittura su file dell’output video
*	CTRL+C: Interrompe l’esposizione dei risultati di una query
*	EXIT: Chiude il client

Per l’elenco completo delle impostazioni configurabili si rimanda alla documentazione ufficiale.


-----------------------------------
### VARIABILI DI SESSIONE (SUBSTITUTION VARIABLES)

E’ possibile rendere una DML interattiva al momento dell’esecuzione utilizzando le variabili di sessione. L’identificativo varia a seconda del client: il mondo Oracle (SQL+, APEX, etc) utilizzano il carattere “&” mentre, per esempio, in Toad si usa il carattere “:”. Nel caso di testi la & deve trovarsi all’interno degli apici singoli.
Per ogni variabile di sessione viene chiesto un valore PRIMA dell’effettiva elaborazione.
Nel mondo Oracle le variabili di sessione con doppio carattere “&” mantengono il valore impostato anche nelle successive elaborazioni.
Nell’immagine successiva si può notare che la variabile &&var_persistente viene richiesta esclusivamente alla prima elaborazione e il suo valore rimarrà lo stesso per ogni successivo utilizzo nella sessione. 
 
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/ab1f31c9-c0e8-4ea0-a555-139d7e13df5f)
 Variabili di sessione

Per cambiarne il valore occorre specificare l’apposita istruzione visibile nella seconda immagine: DEFINE _variabile_ = _valore_ 

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/67b57d2a-0f54-46d8-b88a-7354438f8ac2)
 Variabile persistente

Il fatto che il carattere “&” identifichi le variabili di sessione fa si che ne debba essere evitato l’utilizzo nel codice. Perchè il client non si interrompa in presenza di “&” nell’elaborazione di uno script si deve specificare in apertura dello stesso l’istruzione “SET DEFINE OFF”.

Utilizzando l’istruzione “SET VERIFY OFF” è possibile disattivare la visualizzazione di verifica che mostra il codice prima e dopo la sostituzione.



-----------------------------------
### ISTRUZIONI AMMINISTRATIVE SQL PLUS
*	CREATE|DROP USER
Permette di creare una nuova utenza e, contestualmente, stabilirne le caratteristiche. Viene creato l’omonimo schema, che non contiene alcun oggetto; in fase di eliminazione dell’utente vengono eliminati a cascata anche tutti gli oggetti di cui è proprietario.
 
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/f221777e-8953-4085-a11f-79c639aab44a)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/4f51f12f-6732-4ed4-91b9-c5bd85d55c65)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/e25d1cca-e7fb-4d3b-b228-1cc464bd5a13)
 Creazione o eliminazione delle utenze

*	GRANT|REVOKE privilegi (di SISTEMA)
Permette a un amministratore di aggiungere o togliere privilegi a utenti o ruoli

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/1c66a124-3854-40c3-948d-2fea04ad5c43)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/4a62876a-7b26-4b6a-9e96-3825862a097f)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/a4ab3b45-1471-4c4f-94e4-21dc522bfd0d)
Creazione e revoca dei privilegi

*	CREATE|DROP ROLE
Permette di creare o eliminare un ruolo; è possibile “grantare” i privilegi al ruolo e il ruolo all’utente, che ne erediterà tutti i privilegi.

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/39c712b0-fc9e-439d-88d7-c7f7b8793318)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/3a595c22-bafe-49c8-aca3-125eba5cd7af)
Creazione, eliminazione, revoca e associazione dei ruoli

*	ALTER <utente>
Permette di modificare alcune delle impostazioni legate all’utente, per esempio la quota di spazio di archiviazione disponibile. Senza spazio disponibile è, per esempio, impossibile inserire dati nel database.
E’ possibile destinare spazio illimitato tramite l’apposito privilegio UNLIMITED TABLESPACE

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/a8b34ecc-902b-4513-b8b6-e79cf475e5f7)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/004f9042-3505-46bf-91ea-927cb85fffa6)
Gestione delle Quote

*	GRANT/REVOKE privilegi (operativi, sugli oggetti)
Permette di impostare i privilegi operativi (DML, DCL, esecuzione, etc) su singoli oggetti verso singoli utenti o verso tutti.

NB: per poter esaminare e verificare le istruzioni successive è necessario predisporre lo schema di esempio tramite lo script allegato:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/50412086-ec6a-4e2a-9b7c-c1b168464911)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/8a48165a-885c-4082-befb-ec5ed6231b9b)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/4d189a75-d629-43a1-9864-1b784344337c)
Predisposizione schema

L’owner (proprietario) dell’oggetto è colui che lo crea ed ha automaticamente su di esso tutti i privilegi operativi, che può concedere ad altri.
Un utente SYSDBA ha la possibilità di gestire comunque i privilegi su oggetti di cui non è owner, così come chi li riceve con la clausola WITH GRANT OPTION.
   





-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
