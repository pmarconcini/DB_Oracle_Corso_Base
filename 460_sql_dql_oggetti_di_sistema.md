# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

-----------------------------------
## DESCRIZIONE DEGLI OGGETTI

Tramite l’istruzione DESC /<oggetto> è possibile ottenere le relative informazioni. L’istruzione espone informazioni diverse a seconda del client utilizzato.

	DESC dept;
  	     
Output in APEX:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/8e149bef-ce34-4dd7-b938-072bd4792084)


Output in Oracle SQL Developer:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/a2a2d599-01aa-4547-ba09-74073311e129)



	DESC emp;
  	 
Output in APEX:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/2183a2ce-6110-43b4-adff-3fecbda4f49b)


Output in Oracle SQL Developer:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/ff431788-1d87-46cd-ae73-58506f2a6388)



Ogni software dotato di interfaccia grafica ha, generalmente, una combinazione di tasti per ottenere a video tutte le informazioni legate a un oggeto. 

Nell’esempio seguente la finestra PopUp visualizzata in Oracle SQL Developer dopo aver posizionato il cursore in prossimità del nome dell’oggetto e premuto la combinazione di tasti Shift + F4.

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/fc884ed0-764b-4e79-b2a8-6b102fcae7c6)

 

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

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/e30750d6-750d-4a8f-baa8-850d830f6941)


-----------------------------------

Il valore del campo ROWID è unico e specifico per ogni singolo record del database e può essere utilizzato anche come criterio di ricerca. 
 
Esempio:

	SELECT ROWNUM, e.ROWID, e.ename, d.ROWID, d.loc
	FROM emp e, dept d
	WHERE e.deptno = d.deptno
	AND e.rowid = 'AAAR/dAAHAAAAFlAAJ';

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/fd2d12b8-6a3b-43a7-930d-b25bab278990)



-----------------------------------
## QUERIES GERARCHICHE

Una forma più evoluta di self join è quella utilizzata per definire le queries gerarchiche; in particolare è possibile stabilire sia il punto di partenza (la radice, tramite START WITH) della gerarchia che la regola di connessione tra righe (CONNECT BY). 
Sono disponibili delle funzioni peculiari, alcune delle quali visibili nella query di esempio seguente (tra quelle non utilizzate può essere utile la funzione CONNECT_BY_ROOT /<campo> che restituisce il valore della radice per ogni riga (nel caso dell’esempio sarebbe sempre un dato della riga relativa a KING, essendoci una unica radice). 

Esempio: 

	SELECT ename Impiegato, empno, mgr,  CONNECT_BY_ISLEAF Foglia,
	LEVEL, SYS_CONNECT_BY_PATH(ename, '/') "Path"
	FROM emp
	--WHERE LEVEL <= 5 and deptno = 10
	START WITH empno = 7839
	CONNECT BY PRIOR empno = mgr AND LEVEL <= 5 and deptno = 10
	--ORDER BY LEVEL, Impiegato, Foglia;

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/1963b188-8296-4580-a345-20c21540a98b)


-----------------------------------

Nella clausola ORDER BY è possibile inserire la parola chiave SIBLINGS che fa sì che i criteri seguenti siano considerati a parità di livello all’interno del singolo ramo, come nell’esempio seguente:

Esempio: 

	SELECT ename Impiegato, empno, mgr,  CONNECT_BY_ISLEAF Foglia,
		LEVEL, SYS_CONNECT_BY_PATH(ename, '/') "Path"
	FROM emp
	START WITH mgr IS NULL
	CONNECT BY PRIOR empno = mgr
	ORDER SIBLINGS BY ename;


Output:

IMPIEGATO  EMPNO MGR FOGLIA LEVEL      PATH

KING       7839         0     1     /KING 

BLAKE      7698 7839    0     2     /KING/BLAKE 

ALLEN      7499 7698    1     3     /KING/BLAKE/ALLEN 

JAMES      7900 7698    1     3     /KING/BLAKE/JAMES 

MARTIN     7654 7698    1     3     /KING/BLAKE/MARTIN

TURNER     7844 7698    1     3     /KING/BLAKE/TURNER 

WARD       7521 7698    1     3     /KING/BLAKE/WARD 

CLARK      7782 7839    0     2     /KING/CLARK

MILLER     7934 7782    1     3     /KING/CLARK/MILLER

[…]


-----------------------------------
NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
