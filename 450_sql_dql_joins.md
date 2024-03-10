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

NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
