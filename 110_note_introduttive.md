# Note introduttive

-----------------------------------
## AUDIENCE
I contenuti sono rivolti a un pubblico con competenze informatiche tecniche di base, non necessariamente con esperienza in ambito base dati.

-----------------------------------
## SOFTWARE UTILIZZATO

-----------------------------------
### ORACLE XE DB
Il software è scaricabile dal sito della Oracle, previa autenticazione gratuita.

https://www.oracle.com/database/technologies/appdev/xe.html

La versione di riferimento per contenuti e immagini è "Oracle Database 21c Express Edition for Windows x64".


-----------------------------------
### ORACLE SQL DEVELOPER 
Il software è scaricabile dal sito della Oracle, previa autenticazione gratuita.

https://www.oracle.com/tools/downloads/sqldev-downloads.html

SOFTWARE ALTERNATIVI E/O INTEGRATIVI
APEX [ORACLE APEX RELEASE 19.2.0.00.18]
Il software è scaricabile dal sito della Oracle, previa autenticazione gratuita.
http://www.oracle.com/technetwork/developer-tools/apex/downloads/index.html

TOAD FOR ORACLE FREEWARE
http://www.softpedia.com/get/Internet/Servers/Database-Utils/TOAD-for-Oracle-Freeware.shtml

RIFERIMENTI DOCUMENTALI
SQL - Documentazione ufficiale Oracle [Oracle® Database SQL Language Reference 19c]:
https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/#Oracle%C2%AE-Database

PL/SQL - Documentazione ufficiale Oracle [Oracle® Database SQL Language Reference 19c]:
https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/index.html#Oracle%C2%AE-Database

SQL*Plus:
https://docs.oracle.com/en/database/oracle/oracle-database/21/sqpug/index.html#SQL*Plus%C2%AE



APEX - Documentazione ufficiale Oracle [Getting started]:
http://www.oracle.com/technetwork/developer-tools/apex/application-express/apex-getting-started-1863613.html

APEX - Documentazione ufficiale Oracle [Apex 5.1.1]
http://www.oracle.com/technetwork/developer-tools/apex/documentation/index.html

PREMESSA
I contenuti non sono esaustivi della tecnologia e sono finalizzati a rendere autonomo in tempi rapidi uno sviluppatore che debba operare su DB Oracle, con la consapevolezza che le possibilità offerte dal prodotto sono molto più vaste, sebbene applicabili spesso in contesti particolari e non frequenti.

Si fa riferimento spesso a funzionalità e istruzioni che in alcune realtà lavorative sono tipicamente gestite direttamente dai DBA, ma delle quali è comunque importante avere nozione.

Ove possibile l’argomento è trattato attraverso l’analisi diretta di un esempio di codice. Al momento dell’installazione NON sono presenti le canoniche tabelle di esempio di Oracle: la tabella EMP (contenente 14 record) e la tabella DEPT (5 record), legate da un vincolo di integrità referenziale (il campo interessato si chiama DEPTNO in entrambe le tabelle.

CONVENZIONI
I contenuti sono editi nel rispetto degli standard e delle convenzioni previste dalla Oracle in ossequio, a sua volta, degli standard internazionali.

 	SQL:2008 - ANSI/ISO/IEC:
https://docs.oracle.com/cd/E11882_01/server.112/e41084/intro002.htm#SQLRF50933

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

Rif: https://docs.oracle.com/cd/E11882_01/server.112/e41084/intro004.htm#SQLRF50937



[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
