# SQL - Data Query Language - ESEMPI

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## 4.10 [DQL - Interrogazione: SELECT e FROM](410_sql_dql_select_from.md)

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
## 4.20 [DQL - Interrogazione: Funzioni single-row](420_sql_dql_funzioni_single_row.md)

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
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
