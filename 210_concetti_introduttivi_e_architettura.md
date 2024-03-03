# Concetti generali e RDBMS

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## CONCETTI INTRODUTTIVI E ARCHITETTURA

-----------------------------------
### DEFINIZIONI E ACRONIMI
* RDBMS: Relational Database Management System, sistema di gestione di database relazionali.
* ERD: Entity Relationship Diagram, è una tecnica di rappresentazione grafica delle informazioni relative alle entità dell’architettura e delle relazioni tra le stesse.
* Relational Model: è il modello di rappresentazione dell’implementazione del database, considerando gli aspetti tecnici (formati, relazioni, vincoli); in sostanza ERD corrisponde è la rappresentazione astratta e RM è il modello tecnico.
* SQL: Structured Query Language, linguaggio di interrogazione strutturato.
* PL/SQL: Procedural Language [extension of] SQL, linguaggio procedurale estensione di SQL.
* DQL: Data Query Language, è il linguaggio che comprende le istruzioni per l’interrogazione della base dati; spesso è considerato parte integrante di DML (come nel caso della presente documentazione e di quella ufficiale Oracle). 
* DML: Data Manipulation Language, è il linguaggio che comprende l’insieme delle istruzioni utilizzata per la “manipolazione” del dato finalizzata alla estrazione e/o all’inserimento/aggiornamento/eliminazione e per la gestione dello stato delle variazioni.
* DDL: Data Definition Language, è il linguaggio che comprende l’insieme delle istruzioni necessarie alla definizione delle caratteristiche degli oggetti.
* DCL: Data Control Language, è il linguaggio che comprende l’insieme delle istruzioni necessarie alla gestione della capacità operativa.
* TCL: Transaction Control Language, è il linguaggio che comprende l’insieme delle istruzioni necessarie alla gestione delle transazioni.

-----------------------------------
### ARCHITETTURA, UTENTI/SCHEMA E RUOLI/PERMESSI
* Un server Oracle è costituito da due tipologie di strutture, il database e l’istanza. Il database è costituito dai file fisici in cui sono memorizzati i dati mentre l’istanza è l’insieme delle aree di memoria e dei processi di background necessari ad accedere ai dati.     
* I dati del database risiedono in Tablespace, contenitori logici a cui sono associati uno o più file fisici.
* Ogni database è multi-utente, ovvero più utenti possono collegarsi contemporaneamente al database.
* L’utente ha, generalmente, uno scopo funzionale e non è associato/associabile ad una persona fisica; ciò significa, all’atto pratico, che più client (persone fisiche o meno che siano) utilizzano il medesimo Utente del database.
* Ad ogni utilizzo (connessione) di un Utente è associata una specifica sessione con “vita” e risorse specifiche.
* Ad ogni utente (al momento della creazione) viene associato uno schema omonimo (un insieme logico di oggetti) a cui verranno automaticamente associati gli oggetti creati dall’utente stesso. Gli oggetti risiederanno logicamente nella TABLESPACE impostata all’atto della creazione dell’utente (o successivamente variata).
* Gli oggetti di utilizzo più comune (ed esaminati nel corso) sono:
  *   Tabelle
  *   Indici
  *   Constraints
  *   Viste
  *   Sequenze
  *   Types
  *   Sinonimi
  *   Procedure
  *   Funzioni
  *   Packages
  *   Triggers
  *   Database Links 
* L’identificativo completo dell’oggetto è <database>.<schema>.<oggetto>, ma si possono omettere le informazioni qualora coincidano con quelle locali; ciò significa che un utente può riferirsi a una propria tabella omettendo le prime due informazioni, mentre dovrà necessariamente specificare maggiori informazioni per accedere a risorse di altri schemi (di cui non è proprietario o owner quindi) purchè abbia i privilegi necessari all’utilizzo. 
* L’uso di sinonimi permette di ovviare alla regola appena descritta.
* Ogni tipo di oggetto ha delle peculiarità operative la cui capacità di utilizzo è detta “Privilegio” 
* E’ possibile raggruppare i privilegi in insiemi funzionali detti Ruoli, a loro volta associabili agli Utenti.
* Il proprietario degli oggetti può condividere la disponibilità dei relativi privilegi con altri utenti garantendone i privilegi (direttamente all’utente o indirettamente tramite Ruoli).
* Oltre ai privilegi sugli oggetti (specifici per il singolo oggetto) esistono i privilegi di sistema (trasversali rispetto agli Schema e relativi a singole tipologie di oggetti); dai privilegi di sistema (che possono essere concessi solo da utenti amministratori) derivano gerarchicamente i privilegi sugli oggetti.
* Tutti gli utenti sono automaticamente associati al ruolo PUBLIC, quindi garantire un privilegio a tale ruolo significa garantirlo a tutti gli utenti del database.


Per una più completa trattazione dei privilegi si rimanda alla documentazione ufficiale di Oracle


Per una più completa trattazione dell’architettura di Oracle si rimanda ai seguenti link:

https://www.oracletutorial.com/oracle-administration/oracle-database-architecture/




-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
