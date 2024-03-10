# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

-----------------------------------
## Clausole WHERE e ORDER BY

La clausola opzionale WHERE ha il duplice scopo di filtrare i singoli record e di indicare la relazione tra tabelle. 

* Le espressioni utilizzate a tale scopo sono tipicamente costituite da due valori intervallati da un operatore di confronto, ma sono comunque presenti alcune eccezioni.
* I valori possono essere dati presenti nel record, elaborazione degli stessi, costanti o risultati di subquery.
* Le espressioni sono logicamente legate tra loro dagli operatori AND e OR e dall’uso delle parentesi tonde secondo la logica applicata in matematica. In assenza di parentesi l’operatore AND è considerato prima dell’operatore OR.
* L’operatore NOT nega la verifica dell’espressione (attenzione, le espressioni “a = 1” e “NOT a = 1” NON sono complementari perchè entrambe escludono i casi in cui “a” è nullo).
* L’operatore di confronto IN è abitualmente utilizzato con elenchi definiti e statici di valori semplici (costituiti da una singola colonna), che non possono però eccedere una numericità ben definita (nell’attuale versione di Oracle si tratta di 1000 valori); l’eccezione generata è la ORA-01795. 
NB: l’eccezione NON si verifica nel caso di utilizzo con una subquery. Gli operatori di confronto IN, ALL, ANY, SOME, EXISTS saranno affrontati nel paragrafo destinato alle subqueries. In tutti questi casi il confronto avviene con un elenco (anche vuoto) di dati.

La clausola opzionale ORDER BY permette di stabilire l’ordine di esposizione dei record elencando i criteri per priorità; i criteri seguono le stesse regole dell’esposizione nella clausola SELECT e quindi possono essere valori presenti in campi, elaborazioni di essi, subqueries, gli alias utilizzati o la posizione della colonne nella SELECT e, per ognuno, è possibile stabilire:

* la cardinalità aggiungendo la sigla ASC (valore predefinito e quindi in genere omesso) per l’ordine crescente o DESC per l’ordine decrescente, secondo la logica del dato stesso (alfabetico per i testi, dimensioni per i numeri e temporale per le date)
* il posizionamento dei campi nulli indicando NULLS FIRST o NULLS LAST (che è il valore predefinito e si può quindi omettere)

Nel caso in cui siano eseguiti dei raggruppamenti secondo le modalità specificate nei paragrafi seguenti, nella clausola ORDER BY possono essere specificati solo i raggruppamenti stessi (o loro elaborazioni). 


Esempio:

    SELECT i.ename, i.deptno, i.sal, i.comm, i.sal * 12 + nvl(i.comm, 0) annuo, 
    i.mgr, i.hiredate, d.loc
    FROM emp i, dept d
    WHERE i.deptno = d.deptno                 --condizione di JOIN
    	AND (                   --l'uso delle parentesi rende alternative le coppie 
                             --di condizioni seguenti
    	d.LOC = 'DALLAS' AND i.sal > 1000
    	OR
    	d.LOC LIKE '%O%' AND i.sal > 1250 --LIKE confronta testi con caratteri 
                                       -- jolly % e _
    	)
    	AND mgr IS NOT NULL       --verifica del NULLO (alternativa è la scrittura 
                               --NVL(mgr, 0) = 0 per esempio
    	AND i.sal + NVL(i.comm, 0) BETWEEN 1000 AND 3000--BETWEEN permette di 
                     --verificare l'appartenenza di un valore rispetto a un range
    	AND i.hiredate >= TO_DATE('01071981', 'ddmmyyyy') --è necessario convertire 
                                                       -- in data
    ORDER BY annuo desc,         --riferimento all'alias di colonna
    	1, --prima colonna della SELECT in ordine crescente (anche senza ASC)
    	i.empno NULLS FIRST; --campo non usato in SELECT con NULLI prima
    
Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/a4587a03-ed34-4aa2-8d04-bfcbb6e4a5bd)

-----------------------------------
### USO DELLE ESPRESSIONI REGOLARI
Oracle ha implementato l’utilizzo delle espressioni regolari secondo le specifiche POSIX, Extended Regular Expression (ERE) specification. In particolare REGEXP_LIKE è utilizzabile in maniera specifiche della clausola di filtro dei dati (WHERE).

Le funzioni disponibili sono le seguenti:

*	REGEXP_LIKE (\<espressione>, \<pattern> [, \<case sensitivity> ] )
*	REGEXP_REPLACE (\<espressione>, \<pattern> [, \<nuovo testo> [, \<posizione iniziale> [, \<iesima occorrenza> [, \<case sensitivity> ] ] ] ] )
*	REGEXP_INSTR (\<espressione>, \<pattern> [, \<posizione iniziale> [, \<iesima occorrenza> [, \<ritorno 0:match, 1:post match> [, \<case sensitivity> ] ] ] ] ] )
*	REGEXP_SUBSTR (\<espressione>, \<pattern> [, \<posizione iniziale> [, \<iesima occorrenza> [, \<case sensitivity> ] ] ] ] )

Segue un prospetto delle combinazioni di caratteri speciali usabili nel pattern (i valori sono combinabili).

Valore ==>	Descrizione:

* ^ ==>	Inizio testo/riga
* $ ==>	Fine testo/riga
* \* ==>	Zero o più occorrenze
* \+ ==>	Una o più occorrenze
* ? ==>	Zero o una occorrenza
* | ==>	Valori alternativi
* \[\] ==>	Uno tra i singoli valori racchiusi. Range impostabile collegando due valori con -
* [^ ] ==>	Nessuno tra i singoli valori racchiusi
* ( ) ==>	Per raggruppare una espressione
* [: :] ==>	Classe di caratteri (v. elenco a seguire)
* {m} ==>	Numero di occorrenza dell’elemento che precede
* {m,} ==>	Numero minimo di occorrenza dell’elemento che precede
* {m,n} ==>	Numero di occorrenza compreso tra m e n dell’elemento che precede


Dettaglio delle principali classi di caratteri:

*	[:alnum:] Tutti caratteri alfanumerici
*	[:alpha:] Tutti caratteri alfabetici
*	[:blank:] Tutti caratteri vuoti
*	[:cntrl:] Tutti caratteri di controllo (non stampati)
*	[:digit:] Tutti caratteri numerici
*	[:graph:] Tutti i caratteri compresi in [:punct:], [:upper:], [:lower:] e [:digit:]
*	[:lower:] Tutti i caratteri alfabetici minuscoli 
*	[:print:] Tutti i caratteri stampabili 
*	[:punct:] Tutti i caratteri non stampabili 
*	[:space:] Tutti spazi 
*	[:upper:] Tutti i caratteri alfabetici maiuscoli
*	[:xdigit:] Tutti i caratteri esadecimali

Segue il prospetto relativo al parametro utilizzato per indicare la case sensitivity:

Valore ==>	Descrizione

* 'c' ==>	Case sensitive
* 'i' ==>	NON Case sensitive
* 'n' ==>	Abilita l’identificazione della nuova linea con il carattere “.”
* 'm' ==>	L’espressione è multilinea e i caratteri ^ e $ si riferiscono ad ogni linea.
* 'x' ==>	I blank sono ignorati

Esempio:

    SELECT ename,
    REGEXP_REPLACE (ename, '([aeiou])','1', 1, 1, 'i') F1,
    	--sostituzione della prima occorrenza di una vocale con 1
    	REGEXP_INSTR (ename, '[a-c]', 1, 2, 0, 'i') F2,
    –-ricerca della posizi. della seconda occorrenza di una lettera tra a, b e c
    	REGEXP_INSTR ('ABCD1234efgh', '([[:lower:]])', 1, 2, 0, 'c') F3, 
    --ricerca la posiz. della seconda occorrenza di un caratt. Alfab. minuscolo
    	REGEXP_SUBSTR('..Z-ABCD12-34567YYY', '([[:alnum:]]){3,4}', 1, 2) F4, 	 
    --ricerca considerando solo gli alfanumerici
    	REGEXP_SUBSTR('Testo1, Testo2, Testo3', '[^,]+', 1, 2, 'i') F5 	 
    --selezione del testo
    FROM emp
    --WHERE REGEXP_LIKE (ename, 'AR')             --corrispondente a like %AR%
    --WHERE REGEXP_LIKE (ename, 'N$')             --che termina con il testo
    --WHERE REGEXP_LIKE (ename, '^K')             --che inizia con il testo
    --WHERE REGEXP_LIKE (ename, '(AN|EN|IN|ON)')  
    --che contiente uno dei valori alternativi
    --WHERE REGEXP_LIKE (ename, '[AEIOU]N')       
    --che contiente uno dei valori alternativi seguito da N
    --WHERE REGEXP_LIKE (ename, '([cln])\1', 'i') 
    --che contiente uno doppia C/N/L, non case sensitive
    --WHERE REGEXP_LIKE (ename, '[cln]{2}', 'i')  
    --che contiente uno doppia C/N/L, non case sensitive
    WHERE REGEXP_LIKE (ename, '[AE]')
    ;


Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/800e6e93-f815-45a7-aae6-84f0cb6be688)



-----------------------------------
### CLAUSOLA DI LIMITAZIONE DELLE RIGHE

Dalle ultime versioni di Oracle (12.1 e seguenti) è possibile limitare il numero di righe selezionate utilizzando una apposita clausola applicata all’ordinamento (TOP-N Queries). 

Esempio:

    SELECT ename, sal
    FROM   emp
    ORDER BY sal DESC
    --FETCH FIRST 11 ROWS ONLY --prime 11 righe
    --FETCH FIRST 2 ROWS WITH TIES --prime 2 righe più eventuali pareggi
    --FETCH FIRST 20 PERCENT ROWS ONLY; --primo 20% dei record
    --OFFSET 4 ROWS FETCH NEXT 5 ROWS ONLY; --dopo i primi 4 record, 5 record
    ;

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/8e2d68e9-0765-4c18-9964-151bc5aa8081)

-----------------------------------

Nelle versioni precedenti di Oracle l’unica possibilità è utilizzare una query di selezione e ordinamento innestata su cui poi applicare il filtro di paginazione sul ROWNUMBER prodotto.

Esempio:

    SELECT x2.*
    FROM (
        SELECT ROWNUM ord, x1.*
        FROM (
                SELECT rownum n, ename, sal
                FROM   emp
                ORDER BY sal DESC
               ) x1
        ) x2
    WHERE ord > 7
    ;

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/480adade-e022-498e-a187-2506949952a3)



-----------------------------------

NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
