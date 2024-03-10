# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


NB: spesso viene utilizzata la sigla DQL (data query language) per identificare l’insieme delle istruzioni di interrogazione, cioè una parte delle istruzioni DML. 

-----------------------------------
## Funzioni Single-Row

Sono funzioni che vengono elaborate per ogni singola riga (un set di dati in ingresso, un dato in uscita). Possono essere utilizzate anche le funzioni utente o quelle contenute nei package, se pubbliche. 
Seguono esempi di utilizzo delle funzioni incontrate frequentemente.

-----------------------------------
### FUNZIONI NUMERICHE

Restituiscono un valore numerico:

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

NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
