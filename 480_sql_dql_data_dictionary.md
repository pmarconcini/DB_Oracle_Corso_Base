# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

-----------------------------------
## DATA DICTIONARY

E’ possibile avere informazioni sulle caratteristiche e sull’utilizzo degli oggetti del database disponibili tramite delle viste di sistema; la “visibilità” delle informazioni dipende dai privilegi garantiti all’utente che esegue la ricerca.
L’elenco e la descrizione delle tabelle (aggiornate in tempo reale dal RDBMS) disponibili è ottenibile tramite una ricerca sul Data Dictionary, che è a sua volta una tabella; il prefisso delle tabelle chiarisce (generalmente) l’ambito della ricerca: USER_ per gli oggetti di proprietà dell’utente, ALL_ per gli oggetti su cui l’utente ha privilegi anche se non di sua proprietà, DBA_ per tutti gli oggetti presenti nel database (sono tabelle ad accesso limitato), V$ e GV$ (le cosiddette viste dinamiche, anch’esse ad accesso limitato) per le informazioni variabili e CDB per gli oggetti contenuti nel “database contenitore” in una particolare configurazione del database, a partire dalla versione 12c.

Segue un elenco di viste di più frequente utilizzo (il commento indica il contesto delle informazioni restituite).

	SELECT * FROM dict; -- contenuto del Data Dictionary
 
-----------------------------------
### VISTE INFORMATIVE SULLE DEFINIZIONI DEGLI OGGETTI

	SELECT * FROM cat; 	--elenco di SEQUENCE/TABLE/VIEW di proprietà dell'utente (corrisponde alla vista di sistema USER_CATALOG)

	SELECT * FROM USER_OBJECTS;	--Anagrafica degli oggetti (tutti i tipi)

	SELECT * FROM USER_TABLES;	--Anagrafica delle tabelle

	SELECT * FROM USER_CONS_COLUMNS;	--Legame Vincoli-Colonne

	SELECT * FROM USER_CONSTRAINTS;	--Anagrafica dei vincoli

	SELECT * FROM USER_TAB_COLS;	--Anagrafica delle colonne

	SELECT * FROM USER_UNUSED_COL_TABS; --Conteggio colonne unused per tabella

	SELECT * FROM USER_VIEWS;		--Anagrafica delle viste

	SELECT * FROM USER_INDEXES;	--Anagrafica degli indici

	SELECT * FROM USER_SYNONYMS;	--Anagrafica dei sinonimi

	SELECT * FROM USER_PROCEDURES;	--Anagrafica delle procedure/funzioni/packages

	SELECT * FROM USER_DB_LINKS;	--Anagrafica dei DB link

	SELECT * FROM USER_TYPES;		--Anagrafica dei Type

	SELECT * FROM USER_TRIGGERS;	--Anagrafica dei trigger

	SELECT * FROM USER_LIBRARIES;	--Anagrafica delle librerie


-----------------------------------
### VISTE INFORMATIVE SUI DATI DI SISTEMA

	SELECT * FROM USER_ROLE_PRIVS;	--Ruoli associati all'utente

	SELECT * FROM USER_TAB_PRIVS;   --Privilegi sulle tabelle associati all'utente

	SELECT * FROM USER_COL_PRIVS;	--Privilegi su specifiche colonne

	SELECT * FROM USER_RESOURCE_LIMITS; --Riepilogo dei limiti delle risorse disponibili

	SELECT * FROM USER_USERS;		--Stato dell'utenza

	SELECT * FROM USER_SYS_PRIVS;	--Privilegi associati all'utente

	SELECT * FROM ALL_DIRECTORIES; --Directory disponibili per scrittura di files

	SELECT * FROM USER_TAB_COL_STATISTICS;	--Statistiche del contenuto delle colonne

	SELECT * FROM USER_ERRORS;     --Errori nel codice associati alla compilazione di oggetti

	SELECT * FROM USER_SOURCE;     --Codice degli oggetti

	SELECT * FROM USER_DEPENDENCIES;		--Legami di dipendenza tra oggetti

	SELECT * FROM USER_JOBS;			--Cruscotto jobs

	SELECT * FROM USER_TABLESPACES;		--Anagrafica dei tablespaces

	SELECT * FROM USER_SNAPSHOTS;  --Anagrafica degli snapshot (viste materializzate)

	SELECT * FROM USER_TAB_PARTITIONS;	--Anagrafica delle partizioni (tabelle partizionate)

	SELECT * FROM USER_PART_INDEXES;		--Anagrafica delle partizioni (indici partizionati)

	SELECT * FROM GLOBAL_NAME;			--Nome del db

	SELECT * FROM NLS_DATABASE_PARAMETERS;	--Parametri a livello di db

	SELECT * FROM NLS_INSTANCE_PARAMETERS;	--Parametri a livello di istanza

	SELECT * FROM NLS_SESSION_PARAMETERS;	--Parametri di sessione

	SELECT * FROM INDEX_STATS;		--Statistiche relative agli indici

	SELECT * FROM RESOURCE_COST;		--Risorse in uso di sessione

	SELECT * FROM ALL_SNAPSHOT_REFRESH_TIMES;	--Info relative agli snapshot

	SELECT * FROM V$VERSION;			--Info sulla versione di Oracle

	SELECT * FROM V$OPTION;			--Opzioni dell'istanza

	SELECT * FROM V$SYSTEM_PARAMETER;         --Parametri attuali dell’istanza

	SELECT * FROM V$PARAMETER;                --Parametri attuali della sessione


-----------------------------------
NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

