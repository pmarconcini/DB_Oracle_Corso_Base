# Concetti generali e RDBMS

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## MODELLO RELAZIONALE, REFERENZIALITÀ, VINCOLI E TIPI DI DATO


-----------------------------------
### MODELLO RELAZIONALE
Il modello relazionale consente al progettista di database di creare una rappresentazione consistente e logica dell'informazione. La consistenza è ottenuta inserendo nel progetto del database appropriati vincoli, normalmente chiamati schema logico. [wiki]

La tabella (o relazione) è l’elemento fondamentale del database.

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/861852b4-fa57-40d1-b7db-63565492fb88)


-----------------------------------
### INTEGRITÀ REFERENZIALE (VINCOLI INTERRELAZIONALI O EXTRARELAZIONALI)
Nell'ambito dei RDBMS, l'integrità referenziale è un vincolo di integrità di tipo interculturale ovvero una proprietà dei dati che, se soddisfatta, richiede che ogni parametro di un campo (riga) di una relazione (tabella) esista come valore di un altro attributo in un'altra (o nella stessa) relazione [wiki]


-----------------------------------
### VINCOLI DI TABELLA O INTRARELAZIONALI
I vincoli il cui soddisfacimento è definito per singole relazioni (tabelle). Sono:
*	Unicità: il set di valori (una o più campi, anche nulli) deve essere unico a livello di tabella (quindi specifico di un unico record)
*	Chiave primaria: identificativo univoco del record, implica l’unicità e la nonnullità (v. Vincoli di tupla)


-----------------------------------
### VINCOLI DI TUPLA O RECORD
Sono vincoli che possono essere valutati su ciascuna tupla indipendentemente dalle altre. Sono:
*	Vincolo di dominio o Check: definito con riferimento a singoli valori della riga
*	Nonnullità: un dato attributo non può assumere il valore nullo
*	Valore di default: viene assegnato automaticamente all'atto della creazione di una nuova tupla nel caso in cui non ne sia stato indicato uno (in genere è associato a un vincolo di nonnullità). 


-----------------------------------
### TIPI DI DATO
Per una più completa trattazione dei tipi di dato in SQL si rimanda a: 

https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/Data-Types.html#GUID-A3C0D836-BADB-44E5-A5D4-265BA5968483

In Oracle è possibile definire dei tipi di dato (user defined, che possono essere semplici o complessi) sia come oggetto all’interno del DB che come specifica nel codice; la trattazione dei due casi è prevista in seguito ma, vedremo, nella definizione è comunque necessario fare riferimento alle tipologie di dati native (built-in) di Oracle.
NB: la dimensione massima e, talvolta, l’usabilità stessa delle tipologie può variare a seconda del contesto di utilizzo (dichiarazione di variabili nel codice o definizione di campi di tabella).

Esistono anche delle tipologie di derivazione “esterna” ad Oracle (detti supplied type) come, ad esempio, XML, Geodati, vari formati media, etc.
Le tipologie più frequentemente utilizzate in SQL sono:
*	VARCHAR2(n): testo a dimensione variabile (massimo 4000 byte a livello di tabella).
*	NUMBER(n[,d]): numero composto al massimo da n caratteri (virgola compresa) di cui d decimali.
*	DATE: data e ora. A differenza del mondo Microsoft, la data non è una conversione di un conteggio numerico da una data topica.
*	CLOB (character long object): testo di grande dimensione
*	BLOB (binary long object): file binario
*	BFILE (binary file): locatore di file non memorizzato in tabella


-----------------------------------
### COMMENTI, IDENTIFICAZIONE DEL TESTO E CONCATENAMENTO
Ciò che segue è valido sia per il contesto SQL che per quello PL/SQL
*	Commenti monoriga: doppio meno, seguito dal commento. Ciò che precede l’identificatore non è considerato commento.
*	Commento multiriga: tutto ciò che è compreso tra l’identificatore di apertura /* e quello di chiusura */
*	Un eventuale testo deve essere racchiuso tra apici singoli (il tasto condiviso con il punto interrogativo nella tastiera italiana, generalmente convertito in apostrofo da MS Word). Nel caso in cui il testo debba contenere effettivamente l’apice singolo, è necessario specificarlo due volte. Una valida alternativa è l’utilizzo della “citazione” (“quote”, in inglese) che prevede di racchiudere il testo tra il tag di apertura q’( e quello di chiusura )’, senza necessità di raddoppiare l’apice singolo. Esempio di confronto tra le modalità:
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/7814b1ba-90bc-4810-b39c-4a60c8416bb1)

 
*	Il concatenamento si può eseguire tramite l’identificatore || (due volte il carattere pipe) o con l’apposita (e poco usata) funzione CONCAT


-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
