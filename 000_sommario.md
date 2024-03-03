# Sommario

-----------------------------------
## 1. Note introduttive

1.01	Note introduttive


Audience	13
Software utilizzato	13
Oracle XE DB [Oracle DB Express Edition (XE) Release 18.4.0.0.0 (18c)]	13
Oracle SQL Developer 19.4	13
Software alternativi e/o integrativi	13
APEX [Oracle APEX Release 19.2.0.00.18]	13
Toad for Oracle Freeware	13
Riferimenti documentali	13
Premessa	14
Convenzioni	14
2.	Concetti generali e RDBMS	16
Concetti introduttivi e convenzioni	16
Definizioni e acronimi	16
Architettura, utenti/schema e ruoli/permessi	16
Modello relazionale, referenzialità, vincoli e tipi di dato	18
Modello relazionale	18
Integrità referenziale (Vincoli interrelazionali o extrarelazionali)	18
Vincoli di tabella o intrarelazionali	18
Vincoli di tupla o record	19
Tipi di dato	19
Commenti, identificazione del testo e concatenamento	20
3.	Download e installazione del software	21
Installare Oracle Express	21
Strumenti di Oracle Express Edition	24
Oracle Instance Manager	24
Assistente alla configurazione del database	24
Net Manager	37
SQL Plus	37
Import / Export	46
Loader	47
Installare Oracle SQL Developer	49
Strumenti di Oracle SQL Developer	50
Aggiungere e utilizzare una connessione dati	50
Funzioni e strumenti del foglio di lavoro SQL	52
Installare Oracle APEX (DA VERIFICARE/AGGIORNARE)	53
Creazione di un workspace APEX (DA VERIFICARE/AGGIORNARE)	56
Gestione Workspace INTERNAL (DA VERIFICARE/AGGIORNARE)	58
Oracle APEX Online (DA VERIFICARE/AGGIORNARE)	59
4.	SQL – DML di interrogazione (DQL)	60
DML - Interrogazione: SELECT e FROM	60
Formato di visualizzazione	60
DML - Interrogazione: Funzioni single-row	61
Funzioni numeriche	61
Funzioni testuali	62
Funzioni per le date	63
Funzioni varie (comparazione, conversione e altro)	64
DML - Interrogazione: WHERE e ORDER BY	64
Uso delle espressioni regolari	66
Clausola di limitazione delle righe	68
DML - Interrogazione: GROUP BY, HAVING e funzioni aggregate	70
DML - Interrogazione: Joins	71
Simple join	71
Natural join	72
Left o right outer join	72
Self join	73
Prodotto cartesiano	73
DML - Interrogazione: Pseudocolonne e oggetti sistema	74
Descrizione degli oggetti	74
Tabella fittizia DUAL	76
Pseudocolonne	76
Queries gerarchiche	77
DML - Interrogazione: operatori SET e Subqueries	78
Operatori SET	78
Subqueries e operatori IN, ANY, SOME, EXISTS e ALL	79
Inline view	81
Clausola WITH	83
DML - Interrogazione: Data Dictionary	83
DML – Interrogazione: strumenti avanzati	85
Pivoting e Unpivoting	85
Funzioni analitiche	87
Rollup, Cube e Grouping	88
Flashback	89
5.	SQL – DCL e DML di manipolazione	92
DML – Transazioni (TCL)	92
SET TRANSACTION	93
DML - Manipolazione: INSERT	93
DML - Manipolazione: UPDATE	96
DML - Manipolazione: DELETE e TRUNCATE	98
DML - Manipolazione: MERGE	99
DML – Clausola LOG ERRORS	100
DCL - Autorizzazioni	101
Utenti	101
Privilegi	102
Ruoli	103
6.	SQL – DDL (definizione senza codice)	105
DDL - Tabelle	105
Creazione	105
Modifica	109
Rename	110
Eliminazione	111
Eliminazione definitiva e ripristino	111
DDL - Viste	112
Creazione e sostituzione	113
Eliminazione	114
Viste materializzate	115
DDL - Indici	117
Creazione	118
Modifica	118
Eliminazione	119
Ottimizzazione ed analisi	119
DDL - Partizioni	119
Tabelle partizionate	120
Indici partizionati	121
DDL - Sequence	122
Creazione	122
Utilizzo	122
Modifica ed eliminazione	122
Session sequence	124
DDL - Sinonimi	124
Creazione e modifica	124
Eliminazione	126
DDL – DataBase Links	126
DDL – Directory	128
Creazione e modifica	128
Eliminazione	128
7.	PL / SQL – Elementi fondamentali	129
Concetti fondamentali	129
Struttura a blocchi	129
Struttura nidificata e Qualifier	130
Variabili e costanti	131
Bind variables	131
Assegnamenti	132
Tipi di dati	133
Tipi Riferimento	134
Sottotipi definiti dall’utente	134
Conversione dei tipi di dati	135
Visibilità (o scope)	135
Qualifier	136
Processo di esecuzione	136
Costrutti condizionali	137
Costrutto condizionale IF	137
Costrutto condizionale CASE	137
Costrutti ciclici	139
Costrutto ciclico FOR	139
Costrutto ciclico FOR – Cursore implicito	140
Costrutto ciclico LOOP	140
Costrutto ciclico LOOP – Cursore esplicito	141
For Update e Current Of	143
Costrutto ciclico WHILE	144
Tipi compositi: Collections e Variabili tipo-record	144
Collection Types	145
Array associativi (index-by tables)	145
Tabelle nidificate	146
Variable-Size Array (V-Arrays)	147
Unione di SET di dati (MULTISET)	148
Record Types	149
Ref Cursor	150
Collection multidimensionali	151
Bulk collect e cursori	152
Confronti su collection	153
Metodi delle collezioni	154
Record type nelle DML	156
Cursore FOR ALL	157
Gestione delle eccezioni	158
Identificare e intercettare gli errori	158
Propagazione e visibilità dell’errore	159
Eccezioni predefinite	160
Recuperare le informazioni d’errore	161
Associare codici errore a eccezioni	161
Personalizzare i messaggi d’errore	161
SQL dinamico	162
Native Dynamic SQL (NDS)	162
Package di sistema DBMS_SQL	164
Bulk DML con DBMS_SQL	165
Conversioni tra NDS e DBMS_SQL	165
Sottoprogrammi	167
La struttura di un sottoprogramma	167
Dichiarazione e passaggio dei parametri	168
Overloading	170
Criteri di utilizzo dei privilegi	171
Direttive di compilazione ed esecuzione	172
PRAGMA	172
8.	PL / SQL – DDL (definizione con codice)	175
DDL – Gestione dei TYPE OBJECT	175
Creare o modificare un type	175
Utilizzare un object type	176
Eliminare un OBJECT TYPE	176
DDL – Gestione delle PROCEDURE	177
Creare o modificare una procedura	177
Eliminare una procedura	177
DDL – Gestione delle FUNCTION	178
Creare o modificare una funzione	178
Eliminare una FUNZIONE	178
Opzione DETERMINISTIC	179
Opzione PIPELINED	179
Opzione PARALLEL_ENABLED (DA FARE)	180
Clausola RESULT_CACHE	180
OBJECT TYPE come risposta	181
DDL – Gestione dei TRIGGER	182
DML Trigger	183
DDL Trigger	188
Event Trigger	189
Stato dei trigger	190
Ordine di esecuzione	190
Ricompilare un Trigger	191
Compound Triggers	191
DDL – Gestione dei PACKAGE	192
Visibilità	193
Inizializzazione	197
Overloading	197
Linee guida	198
Risorse di sistema	199
Dati in formato JSON	199
DBMS_ALERT	204
DBMS_ASSERT	204
DBMS_CRYPTO	205
DBMS_DB_VERSION	206
DBMS_DLL	206
DBMS_ERRLOG	206
DBMS_RANDOM	206
DBMS_SCHEDULER	207
DBMS_SESSION (DA FARE)	210
DBMS_STATS (DA FARE)	210
OWA_UTIL	211
UTL_FILE	211
9.	Errori e soluzioni	214
Lock di tabella	214
ORA-01795: il numero massimo di espressioni in un elenco è 1000	214
ORA-12560: TNS: protocol adapter error	215
10.	Snippet	216
Trasposizione riga con separatore	216
Procedura per la gestione delle statistiche	216
Formattazione valute	217
Tabella di numeri ordinati	218
11.	Da aggiungere (eventualmente)	219
Invoking External Subprograms	220
Controlling Side Effects of PL/SQL Subprograms	223
7.4.11 Pattern matching di righe	223
7.4.12 La clausola MODEL	225
7.6.5 Le clausole APPLY e LATERAL	225
Managing the Result Cache	225
XMLTABLE	226
xmlagg	227
Overview of Product-Specific Packages	230
About the DBMS_OUTPUT Package	230
About the DBMS_PIPE Package	230
About the HTF and HTP Packages	231
About the UTL_HTTP Package	231
About the UTL_SMTP Package	231
Collegamenti utili	232
Downloads	232
Documentazione	232
Contatti	234

