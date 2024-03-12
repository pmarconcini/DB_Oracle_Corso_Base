# SQL - Data Query Language - ESEMPI

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## 4.10 [DQL - Interrogazione: SELECT e FROM](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/410_sql_dql_select_from.md)

    SELECT
    	sysdate data,      /* ⇒ esposto valore non derivato dalla tabella */
    	i.deptno,          /* ⇒ è necessario specificare l'alias di tabella perché
              il nome di colonna è presente in entrambe le tabelle coinvolte */
    	i.empno, /* ⇒ nome della colonna mantenuta, valore del campo non variato */
    	i.ename Nome,  /* ⇒ alias di colonna considerato comunque maiuscolo, valore 
                      del	 campo non variato*/
    	INITCAP(i.ename) "Nome Dip",  /* ⇒ alias di colonna come specificato tra 
                         virgolette, valore del campo variato (funzione) */
    	i.ename || i.empno,  /* ⇒ alias corrispondente al calcolo (da evitare perché
                          causa l'allargamento della colonna in output, valore 
                          variato (concatenamento) */
    	(i.sal * 14 + comm) * (1 - 0.40) netto_annuo,  /* ⇒ operazioni secondo le 
                                                     regole dell'algebra */
    	(select count(*) from emp) tot_dip, /* ⇒ valore ottenuto da una subquery */
    	 d.*          /* ⇒ l'asterisco indica di considerare tutti i campi della 
                     tabella (o vista) */
    FROM emp i, dept d
    WHERE i.deptno = d.deptno AND i.job     = 'SALESMAN';


-----------------------------------
## 4.20 [DQL - Interrogazione: Funzioni single-row](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/420_sql_dql_funzioni_single_row.md)

    SELECT i.sal,
        ABS(i.sal) F1,             --valore assoluto
        MOD(i.sal, 600) F2,         --resto della divisione (modale)
        POWER(i.sal, 2) F3,         --elevamento a potenza (anche i.sal^2)
        ROUND(i.sal) F4,         --arrotondamento all'intero
        ROUND(i.sal, -2) F5,         --arrotondamento alle centinaia
        ROUND(i.sal, 2) F6,         --arrotondamento ai centesimi
        SIGN(i.sal) F7,         --segno (0:0, 1:positivo, -1:negativo)
        SQRT(i.sal) F8,         --radice quadrata
        TRUNC(i.sal) F9,         --troncamento all'intero
        TRUNC(i.sal, 2) F10,         --troncamento alle centinaia
        TRUNC(i.sal, -2) F11         --troncamento ai centesimi
    FROM emp i
    WHERE empno = 7698;

-----------------------------------

    SELECT i.ename,
    	CHR(50) F1,            --carattere corrispondente al dato codice ascii
    	INITCAP(i.ename) F2,    --Iniziale delle parole maiuscola e resto minuscolo
    	LOWER(i.ename) F3,        --tutto minuscolo
    	LPAD(i.ename, 6, 'X') F4,    --riempimento (o taglio) con X a sinistra 
    					--per arrivare a 6 byte
    	LTRIM(i.ename) F5,        --eliminazione dei blank a sinistra
    	REPLACE(i.ename, 'IN', 'OR') F6, --sostituzione di ogni occorrenza IN con OR
    	RPAD(i.ename, 6, 'X') F7,    --riempimento (o taglio) con X a destra 
    				    --per arrivare a 6 byte
    	RTRIM(i.ename) F8,        --eliminazione dei blank a destra
    	SUBSTR(i.ename, 2, 3) F9,    --estrazione dal carattere 2 di 3 byte
    	SUBSTR(i.ename, -2) F10,    --estrazione di 2 caratteri dal fondo
    	TRANSLATE(i.ename, 'KANGI', 'CORQ') F11,--sostituzione di ogni carattere con 
    			    --il corrispondente per posizione (nullo, in assenza)
    	TRIM(i.ename) F12,        --eliminazione dei blank a destra e sinistra
    	UPPER(i.ename) F13        --tutto maiuscolo
    FROM emp i
    WHERE ename= 'KING';

-----------------------------------

    SELECT i.ename,
    	ASCII(i.ename) F1,        --codice ascii del primo carattere del testo
    	INSTR(i.ename, 'N') F2,  --posizione della prima occorrenza di N nel testo.
    	INSTR(i.ename, 'Q') F3,    --0 in assenza di occorrenze di Q nel testo.
    	INSTR('CANNONE', 'N', 5) F4,--posizione della prima occorrenza di N nel
                                -- testo a partire dal byte 5
    	INSTR('CANNONE', 'N', 1, 2) F5, --posizione della seconda occorrenza di N 
                                  --nel testo a partire dal byte 1
    	INSTR('CANNONE', 'N', -1) F6,--posiz. dell'ultima occorrenza di N nel testo
    	LENGTH(i.ename) F7        --lunghezza del testo
    FROM emp i
    WHERE ename= 'KING';

-----------------------------------

    SELECT i.hiredate,
        ADD_MONTHS(i.hiredate, -2) F1, --addizione o sottrazione del numero di mesi
        CURRENT_DATE F2,         --data corrente della sessione di Oracle
        CURRENT_TIMESTAMP F3,     --timestamp corrente della sessione di Oracle
        LAST_DAY(i.hiredate) F4,   --ultimo giorno del mese
        LOCALTIMESTAMP F5,         --timestamp locale
        MONTHS_BETWEEN(i.hiredate, sysdate) F6,    --numero di mesi tra due date
        ROUND(i.hiredate) F7,        --arrotondamento della data
        ROUND(i.hiredate + 0.6) F8, --arrotondamento della data
        SYSDATE F9,                --data di sistema
        SYSTIMESTAMP F10,         --timestamp di sistema
        TO_CHAR(i.hiredate, 'DD/MM/RRRR HH24:MI:SS/ssss') F11,--format in testo
        TO_CHAR(i.hiredate, 'DAY D MONTH RR') F12,    --formattazione in testo
        TRUNC(i.hiredate) F13,        --troncamento della data
        EXTRACT(YEAR FROM i.hiredate) F14, --Estrazione dell'anno
        EXTRACT(MONTH FROM i.hiredate) F15, --Estrazione del mese
        EXTRACT(DAY FROM i.hiredate) F16 --Estrazione del giorno
    FROM emp i
    WHERE ename = 'KING';

-----------------------------------

    SELECT i.sal,
    	i.comm,
    	i.job,
    	NVL(i.comm, 1000) F1,                 --Sostituzione del nullo
    	GREATEST(NVL(i.comm, 1000), i.sal, 500) F2,     --il maggiore
    	LEAST(NVL(i.comm, 1000), i.sal, 500) F3,         --il minore
    	DECODE(i.job, 'PRESIDENT', 'CAPO', 'MANAGER', 'CAPETTO', 'SCHIAVO') F4,
    	--(deprecata) dato il primo parametro, verifiche per
    	-- uguaglianza (test|valore) con elemento finale jolly facoltativo
    	CASE i.job WHEN 'PRESIDENT' THEN 'CAPO' WHEN 'MANAGER' THEN 'CAPETTO' 
      ELSE 'SCHIAVO' END F5,            --scrittura analoga alla DECODE
    	CASE WHEN i.sal > 2000 THEN 'RICCO' ELSE 'POVERO' END F6,
    	--CASE con espressione di verifica
    	TO_DATE ('27092016', 'DDMMYYYY') F7,         --conversione in data
    	TO_NUMBER('02,780') F8,
    --conversione in numero (il carattere predefinito 
    -- per i decimali è il punto, ma dipende dalla configurazione del database)
    – formattare aggiungendo , '999999D99999', 'NLS_NUMERIC_CHARACTERS = '',.''')
    	TO_CHAR (i.sal, 'U99G999D99MI') F9,         --formattazione dei numeri
    	COALESCE(i.comm, NULL, NULL, 1000) F10,     --Sostituzione del nullo 
                                          -- fino al primo non nullo dell'elenco
    	TO_CLOB(i.ename) F11,                --conversione in clob
    	NVL2(i.comm, 'Se NON nullo', 'Se nullo') F12     --verifica se nullo
    FROM emp i
    WHERE ENAME = 'KING';

-----------------------------------

    SELECT DATE'2022-11-26' CONV_INDATA, TIMESTAMP'2022-11-26 18:23:59.999' CONV_IN_TIMESTAMP  FROM DUAL;

-----------------------------------
## 4.30 [DQL - Interrogazione: WHERE e ORDER BY](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/430_sql_dql_where_e_order_by.md)

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

-----------------------------------

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

-----------------------------------

    SELECT ename, sal
    FROM   emp
    ORDER BY sal DESC
    --FETCH FIRST 11 ROWS ONLY --prime 11 righe
    --FETCH FIRST 2 ROWS WITH TIES --prime 2 righe più eventuali pareggi
    --FETCH FIRST 20 PERCENT ROWS ONLY; --primo 20% dei record
    --OFFSET 4 ROWS FETCH NEXT 5 ROWS ONLY; --dopo i primi 4 record, 5 record
    ;

-----------------------------------

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
    

-----------------------------------
## 4.40 [DQL - Interrogazione: GROUP BY, HAVING e funzioni aggregate](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/440_sql_dql_having_group_by.md)

-----------------------------------

    SELECT d.loc,
    	CASE i.job WHEN 'PRESIDENT' THEN 'Capi' 
                WHEN 'MANAGER' THEN 'Capi' ELSE 'Schiavi' END ruolo,
    	AVG (i.sal) F1,         --media del gruppo
    	COUNT (d.loc) F2,         --conteggio dei record con valore per gruppo
    	COUNT (*) F3,         --conteggio dei record per gruppo
    	COUNT (i.sal) F4,         --conteggio dei record con valore per gruppo
    	MAX (i.sal) F5,         --massimo
    	MIN (i.sal) F6,         --minimo
    	SUM (i.sal) F7         --sommatoria
    FROM emp i, dept d
    WHERE i.deptno (+)= d.deptno 
    --outer join per forzare l'utilizzo dei record di dept senza emp collegati
    GROUP BY d.loc,
    		CASE i.job WHEN 'PRESIDENT' THEN 'Capi' 
                        WHEN 'MANAGER' THEN 'Capi' ELSE 'Schiavi' END
    HAVING MAX (NVL(i.sal,0)) < 5000 and COUNT(i.sal) BETWEEN 0 AND 4
    ORDER BY ruolo, AVG(i.sal) DESC, d.loc
    
-----------------------------------

    SELECT
        COUNT(*) F1,               --conteggio generale (record)
        COUNT(DISTINCT d.loc) F2,  
         --la parola chiave DISTINCT permette di ignorare i valori ripetuti 
         -– ma non può essere utilizzata in presenza di dati di tipo CLOB
        COUNT(d.loc) F3,           
        --conteggio dei record con valore non nullo di un campo
        AVG (i.sal) F4             --media generale
    FROM emp i, dept d
    WHERE i.deptno (+)= d.deptno --outer join per forzare l'utilizzo dei record di dept senza emp collegati
    ;

    
-----------------------------------
## 4.50 [DQL - Interrogazione: Joins](https://github.com/pmarconcini/DB_Oracle_Corso_Base/edit/master/450_sql_dql_joins.md)

-----------------------------------

    SELECT count(*) k        
    --conta 14 record, cioè gli impiegati associati a un dipartimento
    FROM emp i, dept d
    WHERE i.deptno = d.deptno;

-----------------------------------

    SELECT COUNT(*) k        
    --conta 14 record, cioè gli impiegati associati a un dipartimento
    FROM dept d INNER JOIN emp i
    ON i.deptno = d.deptno;

-----------------------------------

    SELECT COUNT(*) k                
	    --conta 14 record, cioè gli impiegati associati a un dipartimento
	FROM dept d NATURAL JOIN emp i;  
	    --per la join viene automaticamente considerato l’unico campo 
	    --presente in entrambe le tabelle: DEPTNO


-----------------------------------
	SELECT COUNT(*) k    
	    --conta 15 record, cioè i 14 impiegati associati e il dipartimento vuoto
	FROM emp i, dept d
	WHERE i.deptno (+) = d.deptno;


-----------------------------------

	SELECT COUNT(*) k
	--conta 15 record, cioè i 14 impiegati associati e il dipartimento vuoto
	FROM dept d RIGHT JOIN emp i
	ON i.deptno = d.deptno;


-----------------------------------

	SELECT COUNT(*) k
	   --conta 15 record, cioè i 14 impiegati associati e il dipartimento vuoto
	FROM emp d LEFT JOIN dept i
	ON i.deptno = d.deptno;


-----------------------------------

	SELECT COUNT(*) k
	--conta 15 record, cioè i 14 impiegati associati e il dipartimento vuoto
	FROM dept d FULL JOIN emp i
	ON i.deptno = d.deptno;


-----------------------------------

    SELECT i.ename NOME, i.empno MATRICOLA, i2.ename NOME_SUP, 
	       i2.empno MATRICOLA_SUP
	FROM emp i, emp i2
	WHERE i.mgr = i2.empno  (+);


-----------------------------------

 	SELECT i.ename, i.sal, s.losal, s.hisal, s.grade
	FROM emp i, salgrade s
	WHERE i.sal BETWEEN s.losal AND s.hisal;

-----------------------------------

   	SELECT SYSDATE C1, CURRENT_TIMESTAMP C2, POWER (10, 2) C3, 10 * 10 C4, USER C5
  	FROM DUAL;

-----------------------------------

 	SELECT ROWNUM, e.ROWID, e.ename, d.ROWID, d.loc
	FROM emp e, dept d
	WHERE e.deptno = d.deptno
	AND e.rowid = 'AAAR/dAAHAAAAFlAAJ';

-----------------------------------




-----------------------------------

-----------------------------------

-----------------------------------



-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
