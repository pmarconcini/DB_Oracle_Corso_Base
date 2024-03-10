# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


NB: spesso viene utilizzata la sigla DQL (data query language) per identificare l’insieme delle istruzioni di interrogazione, cioè una parte delle istruzioni DML. 

-----------------------------------
## Clausole SELECT e FROM

La clausola SELECT stabilisce le regole dell’output ottenuto dall’interrogazione.
La clausola FROM stabilisce l’origine dei dati.
In entrambi i casi le informazioni devono essere separate da virgola e possono essere identificate da un alias per evitare riferimenti ambigui nei nomi (che devono essere necessariamente unici).

Esempio:

    SELECT
    	sysdate data,      /* ⇒ esposto valore non derivato dalla tabella */
    	i.deptno,          /* ⇒ è necessario specificare l'alias di tabella perché il nome di colonna 
                         è presente in entrambe le tabelle coinvolte */
    	i.empno, /* ⇒ nome della colonna mantenuta, valore del campo non variato */
    	i.ename Nome,  /* ⇒ alias di colonna considerato comunque maiuscolo, valore del	 
                         campo non variato*/
    	INITCAP(i.ename) "Nome Dip",  /* ⇒ alias di colonna come specificato tra virgolette, valore 
                         del campo variato (funzione) */
    	i.ename || i.empno,  /* ⇒ alias corrispondente al calcolo (da evitare perché causa l'allargamento 
                         della colonna in output, valore variato (concatenamento) */
    	(i.sal * 14 + comm) * (1 - 0.40) netto_annuo,  /* ⇒ operazioni secondo le regole dell'algebra */
    	(select count(*) from emp) tot_dip, /* ⇒ valore ottenuto da una subquery */
    	 d.*          /* ⇒ l'asterisco indica di considerare tutti i campi della tabella (o vista) */
    FROM emp i, dept d
    WHERE i.deptno = d.deptno AND i.job     = 'SALESMAN';

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/1a0b20e4-037d-47bf-8d1b-97bee003a094)


-----------------------------------

NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
