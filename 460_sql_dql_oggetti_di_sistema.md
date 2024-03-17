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
## 





-----------------------------------
NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
