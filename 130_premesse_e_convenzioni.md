# Note introduttive

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## PREMESSE
I contenuti non sono esaustivi della tecnologia e sono finalizzati a rendere autonomo in tempi rapidi uno sviluppatore che debba operare su DB Oracle, con la consapevolezza che le possibilità offerte dal prodotto sono molto più vaste, sebbene applicabili spesso in contesti particolari e non frequenti.

Si fa riferimento spesso a funzionalità e istruzioni che in alcune realtà lavorative sono tipicamente gestite direttamente dai DBA, ma delle quali è comunque importante avere nozione.

Ove possibile l’argomento è trattato attraverso l’analisi diretta di un esempio di codice. Al momento dell’installazione NON sono presenti le canoniche tabelle di esempio di Oracle: la tabella EMP (contenente 14 record) e la tabella DEPT (5 record), legate da un vincolo di integrità referenziale (il campo interessato si chiama DEPTNO in entrambe le tabelle.


-----------------------------------
## CONVENZIONI
I contenuti sono editi nel rispetto degli standard e delle convenzioni previste dalla Oracle in ossequio, a sua volta, degli standard internazionali.

SQL:2008 - ANSI/ISO/IEC:
https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/SQL-Standards.html#GUID-BCCCFF75-D2A4-43AD-8CAF-C3C97D92AC63

Proprio in virtù di questi standard i contenuti relativi a SQL sono facilmente adattabili all’utilizzo in database diversi. 

La scrittura del codice è la medesima per qualsiasi Client tipicamente utilizzato in ambito Oracle (SQL+, Oracle SQL Developer, APEX, TOAD, etc). In caso di utilizzo della versione web di APEX è necessario registrarsi sul sito apex.oracle.com e fare richiesta di un workspace.

Le convenzioni lessicali previste da Oracle sono:
•	Parole chiave e funzioni maiuscole 
•	Nomi degli oggetti minuscoli
•	Per agevolare la lettura delle queries e del codice si invita a scrivere ogni clausola (SELECT, FROM, …) in una riga diversa, ma non c’è alcun vincolo al riguardo.
•	Case sensitivity: Oracle non è sensibile alla differenza tra maiuscole e minuscole nelle parole chiave, lo è per quanto riguarda il riferimento agli oggetti (che, però, considera sempre maiuscoli se non racchiusi tra doppi apici), mentre è case sensitive per quanto riguarda il dato.
•	L’istruzione deve concludersi con un punto e virgola (molti client ignorano l’errore se è presente un’unica istruzione)
•	I testi devono essere racchiusi tra apici singoli (‘testo’); per specificare come testo l’apice singolo lo si deve scrivere due volte (oppure “quotare” tramite l’apposita funzione).
•	Naming convention: generalmente le regole sono indicate a livello di standard aziendale o di progetto. Un uso frequente è quello di utilizzare come prefisso l’indicazione del tipo di oggetto, seguito dal contesto e da una parte descrivente l’utilizzo/utilità.

Rif: https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/Lexical-Conventions.html#GUID-D9AEB31A-8584-4066-85D0-AF6EFA609381


-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
