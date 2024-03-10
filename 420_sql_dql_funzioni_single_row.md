# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


NB: spesso viene utilizzata la sigla DQL (data query language) per identificare l’insieme delle istruzioni di interrogazione, cioè una parte delle istruzioni DML. 

-----------------------------------
## Funzioni Single-Row

Sono funzioni che vengono elaborate per ogni singola riga (un set di dati in ingresso, un dato in uscita). Possono essere utilizzate anche le funzioni utente o quelle contenute nei package, se pubbliche. 
Seguono esempi di utilizzo delle funzioni incontrate frequentemente.

-----------------------------------
### FUNZIONI NUMERICHE

Che restituiscono un valore numerico:

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

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/bfd3b8fe-c6af-4c05-87ad-e207b9045bc5)


-----------------------------------
### FUNZIONI TESTUALI

Che restituiscono un valore testuale:

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

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/146f58d8-369c-4709-8e13-51d20a3e852e)

-----------------------------------

Che restituiscono un valore numeerico:

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

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/36036739-60c6-4dd0-b875-17f03cdee2a1)


-----------------------------------
### FUNZIONI PER LE DATE

Che restituiscono varie tipologie di valori:

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

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/7a7c13df-a4f7-410c-a8b2-4f0ed2955225)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/54fc5437-e5d6-471b-ab9b-a6e9af3314ef)
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/69b80ec0-32c1-4911-80c5-eb278d6a7328)



-----------------------------------
### FUNZIONI VARIE (COMPARAZIONE, CONVERSIONE E ALTRO)

Che restituiscono varie tipologie di valori:

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

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/60290880-203c-4462-b954-5762c1e182e8)



Nelle versioni più recenti di Oracle è possibile utilizzare altre due funzioni di conversione rapida da testo a data: DATE’yyyy-mm-dd’ per convertire in data senza orario e TIMESTAMP’yyyy-mm-dd hh24:mi:ss.sss’ (eventualmente senza indicare i millisecondi) per convertire in data con orario. Il dato da convertire deve essere un valore esplicito, aspetto che ne limita l’utilizzo a casi in cui è necessario un valore costante o all’interno di istruzioni strutturate tramite SQL dinamico.

    SELECT DATE'2022-11-26' CONV_INDATA, TIMESTAMP'2022-11-26 18:23:59.999' CONV_IN_TIMESTAMP  FROM DUAL;

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/3e1707b5-6e76-4302-ba98-9cea95a5b557)

-----------------------------------

NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
