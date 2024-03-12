# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

-----------------------------------
## DESCRIZIONE DEGLI OGGETTI

Tramite l’istruzione DESC \<oggetto> è possibile ottenere le relative informazioni. L’istruzione espone informazioni diverse a seconda del client utilizzato.

    DESC dept;
  	     
Output in APEX:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/80d6230c-f57d-4f1c-826c-253ce1505b5a)


Output in Oracle SQL Developer:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/cdf31513-6e2a-46d8-a8aa-760d39f3e122)

-----------------------------------

  	DESC emp;
  	 
Output in APEX:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/348c32f6-1de9-4e83-8799-77a63127a428)


Output in Oracle SQL Developer:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/56954437-e6a7-4144-a249-a0452111f050)


Ogni software dotato di interfaccia grafica ha, generalmente, una combinazione di tasti per ottenere a video tutte le informazioni legate a un oggetto. Nell’esempio seguente la finestra PopUp visualizzata in Oracle SQL Developer dopo aver posizionato il cursore in prossimità del nome dell’oggetto e premuto la combinazione di tasti Shift + F4.
 
![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/ae612f7a-8cc1-461d-a964-b413bf27be47)


-----------------------------------
## TABELLA FITTIZIA DUAL

E’ una tabella non esistente monoriga e senza colonne definite. In alcuni contesti è estremamente utile (v. esempio relativo all’operatore EXISTS nel paragrafo delle subqueries)
 
Esempio:

  	SELECT SYSDATE C1, CURRENT_TIMESTAMP C2, POWER (10, 2) C3, 10 * 10 C4, USER C5
  	FROM DUAL;

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/593664b6-df1e-42a7-b89f-86f597075e02)


-----------------------------------
## PSEUDOCOLONNE

Sono colonne fittizie i cui dati sono ottenuti da funzioni di sistema e sono coerenti con il singolo record. Le più frequentemente utilizzate sono:

*	LEVEL: definisce la distanza dalla radice nelle queries gerarchiche (v. successivo)
*	SEQUENCE: utilizza l’oggetto contatore (v. relativo capitolo)
*	ROWNUM: indica l’ordine di selezione dei record (attenzione, non l’ordine di esposizione!)
*	ROWID: indica l’indirizzo del record

 
Esempio:

  	SELECT ROWNUM, e.ROWID, e.ename, d.ROWID, d.loc
  	FROM emp e, dept d
  	WHERE e.deptno = d.deptno
  	ORDER BY ENAME;

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/dc2aca04-06ac-4434-ac56-2dc1192dadb8)

-----------------------------------

Il valore del campo ROWID è unico e specifico per ogni singolo record del database e può essere utilizzato anche come criterio di ricerca. 
 
Esempio:

	SELECT ROWNUM, e.ROWID, e.ename, d.ROWID, d.loc
	FROM emp e, dept d
	WHERE e.deptno = d.deptno
	AND e.rowid = 'AAAR/dAAHAAAAFlAAJ';

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/9bf85112-1bb8-419e-bb14-62fd081ccd74)


    
-----------------------------------
NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

