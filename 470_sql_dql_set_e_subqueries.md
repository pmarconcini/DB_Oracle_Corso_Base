# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

-----------------------------------
## OPERATORI SET

Sono operatori che permettono di combinare il risultato di 2 o più queries; le colonne delle singole queries devono coincidere per numero, ordine e tipo di dato. L’alias di colonna proposto è quello utilizzato nella prima query.

Gli operatori utilizzabili sono:

*	UNION: i record presenti nella prima e nella seconda, NON ripetuti se presenti in entrambe
*	UNION ALL: i record presenti nella prima e nella seconda, ripetuti se presenti in entrambe
*	MINUS: i record della prima query assenti nella seconda
*	INTERSECT: i record comuni ad entrambe le query


Esempio:

	SELECT ename impiegato, empno matricola, deptno sede
	FROM emp
	WHERE deptno = 20
	UNION ALL
	SELECT ename, empno, deptno
	FROM emp
	WHERE ename like 'J%';


Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/4620a8f9-124a-42ea-b1a1-3efe10a2ea79)

-----------------------------------
## SUBQUERIES E OPERATORI IN, ANY, SOME, EXISTS E ALL

Una subquery è una query annidata all’interno di un’altra query, detta parent (tale rapporto gerarchico può essere riproposto per più livelli); deve essere racchiusa tra parentesi tonde e può essere utilizzata in tutte le clausole e, in caso di necessità, può fare riferimento ai campi della query parent specificandone gli alias di tabella. 
Con gli stessi criteri le subqueries possono essere utilizzate anche nelle DML di manipolazione dati. 

Alcuni operatori utilizzabili nella clausola WHERE utilizzano subqueries: 

*	IN (verificata se il valore è uno di quelli dell’elenco; non soggetto alla limitazione dei 1000 valori che genera l’eccezione ORA-01795)
*	/<operatore di confronto> ANY (condizione rispettata rispetto ad almeno uno dei valori)
*	EXISTS (esistenza di almeno un valore)
*	/<operatore di confronto> ALL (condizione rispettata rispetto a tutti i valori)

NB: SOME ha esattamente lo stesso utilizzo di ANY e restituisce lo stesso risultato. Di fatto sono interscambiabili.

Il valore restituito da una subquery per ogni record può essere sia un dato semplice (quindi una unica colonna) che complesso (quindi sottoforma di riga); in questo secondo caso esistono dei limiti nella modalità di utilizzo:

*	Nella clausola SELECT è necessario convertire i dati tramite l’utilizzo di oggetti TYPE (v. il paragrafo ad essi dedicato)
*	Nella condizione IN le due parti del confronto devono avere lo stesso numero di colonne, corrispondenti per tipo di dato
*	Non è possibile utilizzare dati complessi con gli operatori ANY, ALL e SOME.

-----------------------------------

Esempio operatore IN:

    SELECT empno, ename, mgr,
      --non è necessario l'alias perchè non c'è ambiguità con le subqueries
      (SELECT ename FROM emp WHERE empno = e.mgr) MANAGER, 
      --nella condizione si fa riferimento all'alias della parent
      sal - (SELECT AVG(sal) FROM emp) DELTA_SAL_MEDIO, 
      --nessuna neccessità di legarsi alla parent
      sal - (SELECT AVG(sal) FROM emp WHERE deptno = e.deptno) DELTA_SAL_MEDIO_SEDE 
      --neccessità di legarsi alla parent
    FROM emp e
    WHERE deptno IN (SELECT deptno FROM dept WHERE loc IN ('NEW YORK', 'DALLAS'))
    order by DELTA_SAL_MEDIO DESC;
    
Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/77f823ef-dbe3-41b9-9b92-118169195929)


-----------------------------------

Esempio operatore EXISTS:

	SELECT deptno, count(*) k, AVG (sal) media, 
	       SUM(sal) somma, MAX(sal) massimo, MIN(sal) minimo
	FROM emp x
	WHERE EXISTS (SELECT 1 FROM emp WHERE x.deptno = deptno 
	      AND job IN ('SALESMAN', 'ANALYST'))
	GROUP BY deptno


Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/fec932ca-73f2-4336-9486-eba3ee3a22f6)


-----------------------------------

Esempio operatore ALL:

	SELECT ename, job, sal
	FROM emp e
	WHERE sal > ALL (SELECT avg(sal)  FROM emp sq WHERE sq.job = e.job
	                 UNION
	                 SELECT avg(sal)  FROM emp sq WHERE sq.deptno = e.deptno
	                 );		 

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/18356ac8-a9f0-4f7e-8a3a-a068773882dd)

-----------------------------------

Esempio operatore ANY:                                                                                                              

	SELECT ename, job, sal
	FROM emp e
	WHERE sal > ANY (SELECT avg(sal)  FROM emp sq WHERE sq.job = e.job
	                 UNION
	                 SELECT avg(sal)  FROM emp sq WHERE sq.deptno = e.deptno
	                 );


Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/11166753-2aeb-457d-a358-3093db91aeaa)

-----------------------------------

Esempio di utilizzo nella clausola FROM:

	SELECT empno, ename, e.deptno, sal, media, sal - media delta_sal
	FROM emp e, (SELECT deptno, AVG (sal) media FROM emp GROUP BY deptno) sq1
	WHERE e.deptno = sq1.deptno
	ORDER BY delta_sal DESC;

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/005f9bd3-dbf2-4939-93c5-a8c24130234d)


-----------------------------------
## INLINE VIEW
Una particolare forma di subquery è la Inline View, in cui il recordset ottenuto dalla query è oggetto a sua volta di query e si trova, sempre racchiuso tra parentesi e identificato tramite alias, nella clausola FROM.
Nell’esempio seguente la query più interna serve per ordinare i dati, la seconda per associare l’ordinale grazie al ROWNUM e la terza per filtrare (è il meccanismo utilizzato per ottenere un set posizionato di record prima della versione 12.1 di Oracle).

Esempio:

	SELECT *
	FROM (
	    SELECT ename, sal, rownum ordine
    	FROM (    
	           SELECT ename, sal
	           FROM emp
	           ORDER BY sal DESC
	           ) iv
	     ) iv_ordinata
	WHERE ordine BETWEEN 4 and 11;   


Output:

 ![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/d7370771-a4b8-4e6e-9bf2-d410d1cdca03)


-----------------------------------
## CLAUSOLA WITH

Una alternativa alla vista inline è l’utilizzo della clausola WITH in cui si deve definire prima della clausola select SELECT la query necessaria per stabilire i dati che faranno da “bacino” nella DML. 
E’ preferibile all’utilizzo della vista inline soprattutto nei casi in cui sia necessario accedere più volte al contenuto di una data tabella.

Esempio:

	WITH dept_medie AS (
	  SELECT deptno, AVG(sal) sal_medio
	  FROM   emp
	  GROUP BY deptno)
	SELECT e.ename,       e.sal,       e.deptno,       
	       dm.sal_medio,       dm.sal_medio - e.sal sal_diff
	FROM   emp e,       dept_medie dm
	WHERE  e.deptno = dm.deptno
	ORDER BY e.ename;


Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/ed76fe99-efa8-4b1d-a2bb-d12b4bc7afb0)



-----------------------------------
NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
