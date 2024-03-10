# Sommario

-----------------------------------
## 1. Note introduttive

1.10 [Note introduttive](https://github.com/pmarconcini/DB_Oracle_Corso_Base/edit/master/110_note_introduttive.md)
- Audience
- Software utilizzati

1.20 [Risorse documentali](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/120_risorse_documentali)

1.30 [Premesse e convenzioni](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/130_premesse_e_convenzioni.md) 

-----------------------------------
## 2. Concetti generali e RDBMS

2.10 [Concetti introduttivi e architettura](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/210_concetti_introduttivi_e_architettura.md)

2.20 [Modello relazionale, referenzialità, vincoli e tipi di dato](https://github.com/pmarconcini/DB_Oracle_Corso_Base/edit/master/220_modello_relazionale_referenzialita_vincoli_tipi.md)

-----------------------------------
## 3.	Installazione del software e utilizzo degli strumenti

3.10 [Installare Oracle Express](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/310_installare_oracle_express.md)

3.20 [Strumenti di Oracle Express Edition](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/320_strumenti_oracle_express.md)

3.30 [SQL Plus](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/330_sql_plus.md)

3.40 [Import / Export](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/340_import_export.md)

3.50 [Loader](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/350_loader.md)

3.60 [Oracle SQL Developer](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/360_sql_developer.md)

3.70 Installare Oracle APEX (DA FARE)

3.80 Gestione di un workspace APEX (DA FARE)

3.90 Oracle APEX Online (DA FARE)

-----------------------------------
## 4.	SQL - Data Query Language (DML di interrogazione)

4.10 [DQL - Interrogazione: SELECT e FROM](410_sql_dql_select_from.md)

4.20 DQL - Interrogazione: Funzioni single-row
  Funzioni numeriche
  Funzioni testuali
  Funzioni per le date
  Funzioni varie (comparazione, conversione e altro)
4.30 DQL - Interrogazione: WHERE e ORDER BY
  Uso delle espressioni regolari
  Clausola di limitazione delle righe

4.40 DQL - Interrogazione: GROUP BY, HAVING e funzioni aggregate

4.50 DQL - Interrogazione: Joins
  Simple join
  Natural join
  Left o right outer join
  Self join
  Prodotto cartesiano

4.60 DQL - Interrogazione: Pseudocolonne e oggetti sistema
  Descrizione degli oggetti
  Tabella fittizia DUAL
  Pseudocolonne
  Queries gerarchiche

4.70 DQL - Interrogazione: operatori SET e Subqueries
  Operatori SET
  Subqueries e operatori IN, ANY, SOME, EXISTS e ALL
  Inline view
  Clausola WITH
4.80 DQL - Interrogazione: Data Dictionary

4.90 DQL – Interrogazione: strumenti avanzati
  Pivoting e Unpivoting
  Funzioni analitiche
  Rollup, Cube e Grouping
  Flashback

5.	SQL – TCL, DCL e DML di manipolazione
DML – Transazioni (TCL)
  SET TRANSACTION
DML - Manipolazione: INSERT
DML - Manipolazione: UPDATE
DML - Manipolazione: DELETE e TRUNCATE
DML - Manipolazione: MERGE
DML – Clausola LOG ERRORS
DCL - Autorizzazioni
  Utenti
  Privilegi
  Ruoli

6.	SQL – DDL (definizione senza codice)
DDL - Tabelle
  Creazione
  Modifica
  Rename
  Eliminazione
  Eliminazione definitiva e ripristino
DDL - Viste
  Creazione e sostituzione
  Eliminazione
  Viste materializzate
DDL - Indici
  Creazione
  Modifica
  Eliminazione
  Ottimizzazione ed analisi
DDL - Partizioni
  Tabelle partizionate
  Indici partizionati
DDL - Sequence
  Creazione
  Utilizzo
  Modifica ed eliminazione
  Session sequence
DDL - Sinonimi
  Creazione e modifica
  Eliminazione
DDL – DataBase Links
DDL – Directory
  Creazione e modifica
  Eliminazione

7.	PL / SQL – Elementi fondamentali
Concetti fondamentali
  Struttura a blocchi
  Struttura nidificata e Qualifier
  Variabili e costanti
  Bind variables
  Assegnamenti
  Tipi di dati
  Tipi Riferimento
  Sottotipi definiti dall’utente
  Conversione dei tipi di dati
  Visibilità (o scope)
  Qualifier
  Processo di esecuzione
Costrutti condizionali
  Costrutto condizionale IF
  Costrutto condizionale CASE
Costrutti ciclici
  Costrutto ciclico FOR
  Costrutto ciclico FOR – Cursore implicito
  Costrutto ciclico LOOP
  Costrutto ciclico LOOP – Cursore esplicito
  For Update e Current Of
  Costrutto ciclico WHILE
Tipi compositi: Collections e Variabili tipo-record
  Collection Types
  Array associativi (index-by tables)
  Tabelle nidificate
  Variable-Size Array (V-Arrays)
  Unione di SET di dati (MULTISET)
  Record Types
  Ref Cursor
  Collection multidimensionali
  Bulk collect e cursori
  Confronti su collection
  Metodi delle collezioni
  Record type nelle DML
  Cursore FOR ALL
Gestione delle eccezioni
  Identificare e intercettare gli errori
  Propagazione e visibilità dell’errore
  Eccezioni predefinite
  Recuperare le informazioni d’errore
  Associare codici errore a eccezioni
  Personalizzare i messaggi d’errore
SQL dinamico
  Native Dynamic SQL (NDS)
  Package di sistema DBMS_SQL
  Bulk DML con DBMS_SQL
  Conversioni tra NDS e DBMS_SQL
  Sottoprogrammi
  La struttura di un sottoprogramma
  Dichiarazione e passaggio dei parametri
  Overloading
  Criteri di utilizzo dei privilegi
  Direttive di compilazione ed esecuzione
  PRAGMA

8.	PL / SQL – DDL (definizione con codice)
DDL – Gestione dei TYPE OBJECT
  Creare o modificare un type
  Utilizzare un object type
  Eliminare un OBJECT TYPE
DDL – Gestione delle PROCEDURE
  Creare o modificare una procedura
  Eliminare una procedura
DDL – Gestione delle FUNCTION
  Creare o modificare una funzione
  Eliminare una FUNZIONE
  Opzione DETERMINISTIC
  Opzione PIPELINED
  Opzione PARALLEL_ENABLED (DA FARE)
  Clausola RESULT_CACHE
  OBJECT TYPE come risposta
DDL – Gestione dei TRIGGER
  DML Trigger
  DDL Trigger
  Event Trigger
  Stato dei trigger
  Ordine di esecuzione
  Ricompilare un Trigger
  Compound Triggers
DDL – Gestione dei PACKAGE
  Visibilità
  Inizializzazione
  Overloading
  Linee guida
Risorse di sistema
  Dati in formato JSON
  DBMS_ALERT
  DBMS_ASSERT
  DBMS_CRYPTO
  DBMS_DB_VERSION
  DBMS_DLL
  DBMS_ERRLOG
  DBMS_RANDOM
  DBMS_SCHEDULER
  DBMS_SESSION (DA FARE)
  DBMS_STATS (DA FARE)
  OWA_UTIL
  UTL_FILE

