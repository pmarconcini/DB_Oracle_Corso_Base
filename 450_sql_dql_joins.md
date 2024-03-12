# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

-----------------------------------
## JOINS

Per JOIN si intende una query che collega i dati di due o più tabelle; in particolare, oltre alle tabelle che utilizziamo nelle clausole SELECT, WHERE, GROUP BY, HAVING e ORDER BY, è necessario "coinvolgere" tutte le tabelle intermedie che le collegano: l'effetto è che saranno necessarie un numero di join minore di uno rispetto al numero di tabelle considerate.

Nelle ultime versioni Oracle si è adeguata allo standard ANSI e quindi è possibile utilizzare la clausola ON per specificare la relazione.


-----------------------------------
### SIMPLE (o INNER) JOIN

Per la “simple (o inner) join” il collegamento specificando tutti i campi coinvolti nella clausola WHERE collegando logicamente le espressioni necessarie tramite l’operatore logico AND. Per esempio, date due tabelle T1 e T2 in relazione tramite i campi A e B (NB: non necessariamente i campi devono avere lo stesso nome sulle tabelle coinvolte), il risultato sarà la presenza nella clausola WHERE della doppia espressione T1.A = T2.A AND T1.B = T2.B al netto di eventuali condizioni di filtro.

Record non coinvolti dalla relazione (dipartimenti senza dipendenti, nel db di esempio) saranno esclusi dalla query.

NB: nel caso della simple join con standard ANSI la parola chiave INNER si può omettere.


Esempio standard Oracle:

    SELECT count(*) k        
    --conta 14 record, cioè gli impiegati associati a un dipartimento
    FROM emp i, dept d
    WHERE i.deptno = d.deptno;

Esempio standard ANSI:

    SELECT COUNT(*) k        
    --conta 14 record, cioè gli impiegati associati a un dipartimento
    FROM dept d INNER JOIN emp i
    ON i.deptno = d.deptno;


-----------------------------------
### NATURAL JOIN

E’ una join in cui la relazione tra i campi della tabella è automaticamente interpretata da Oracle in base a nome e tipo di dato.

Esempio:

    SELECT COUNT(*) k                
	    --conta 14 record, cioè gli impiegati associati a un dipartimento
	FROM dept d NATURAL JOIN emp i;  
	    --per la join viene automaticamente considerato l’unico campo 
	    --presente in entrambe le tabelle: DEPTNO


-----------------------------------
### LEFT O RIGHT OUTER JOIN

L'OUTER JOIN è una join in cui viene forzata la restituzione dei record di una tabella NON collegati all’altra. Il nome LEFT o RIGHT deriva dalla posizione della tabella forzata nella clausola FROM, cioè quella in cui manca il record per completare la join. La parola chiave OUTER si può omettere.

Esempio RIGHT JOIN standard Oracle:

	SELECT COUNT(*) k    
	    --conta 15 record, cioè i 14 impiegati associati e il dipartimento vuoto
	FROM emp i, dept d
	WHERE i.deptno (+) = d.deptno;


Esempio RIGHT JOIN standard ANSI:
 
	SELECT COUNT(*) k
	--conta 15 record, cioè i 14 impiegati associati e il dipartimento vuoto
	FROM dept d RIGHT JOIN emp i
	ON i.deptno = d.deptno;


Esempio LEFT JOIN standard ANSI:
 
	SELECT COUNT(*) k
	   --conta 15 record, cioè i 14 impiegati associati e il dipartimento vuoto
	FROM emp d LEFT JOIN dept i
	ON i.deptno = d.deptno;


In alcuni DBMS esiste, secondo standard ANSI, anche la FULL OUTER JOIN che forza la restituzione dei record non legati di entrambe le tabelle.

Esempio FULL OUTER JOIN:

	SELECT COUNT(*) k
	--conta 15 record, cioè i 14 impiegati associati e il dipartimento vuoto
	FROM dept d FULL JOIN emp i
	ON i.deptno = d.deptno;

NB: se potesse esistere ed esistesse un impiegato non associato ad alcun dipartimento, il conteggio sarebbe di 16 record


-----------------------------------
### SELF JOIN

E’ una join che mette in relazione uno o più campi di una tabella con uno o più campi della tabella stessa, come nell’esempio seguente. Di fatto è una INNER o OUTER JOIN tra una tabella e la replica di se stessa (tramite alias)
 
Esempio:

    SELECT i.ename NOME, i.empno MATRICOLA, i2.ename NOME_SUP, 
	       i2.empno MATRICOLA_SUP
	FROM emp i, emp i2
	WHERE i.mgr = i2.empno  (+);

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/243e0926-49ac-42df-90a2-d8a727d686cb)

NB: Nel caso specifico è necessario specificare anche la outer join per far apparire tutti e 14 gli impiegati perchè KING non ha un diretto superiore.


-----------------------------------
### PRODOTTO CARTESIANO

E’ considerato una NON-JOIN (o NON EQUIJOIN, in contrasto con le EQUIJOIN che presentano una uguaglianza di confronto) perchè non esiste una relazione di uguaglianza tra i campi delle due tabelle, pur essendoci un legame logico (spesso esplicato nella clausola WHERE). All’atto pratico il prodotto cartesiano produce l’incrocio di tutti i record delle tabelle coinvolte (nel database di esempio 14 impiegati per 5 dipartimenti per un totale di 70 record). L’esempio classico di utilizzo corretto è l’incrocio tra salari e livelli salariali come da codice seguente.
 
Esempio:

	SELECT i.ename, i.sal, s.losal, s.hisal, s.grade
	FROM emp i, salgrade s
	WHERE i.sal BETWEEN s.losal AND s.hisal;

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/8d13319c-2b63-4d59-a49c-d7e9951afaa3)

La query produce correttamente 14 record (gli impiegati), purchè gli scaglioni corrispondenti ai livelli siano continui e non sovrapposti.

-----------------------------------
NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
