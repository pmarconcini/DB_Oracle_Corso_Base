# SQL - Data Query Language (DML di interrogazione)

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

-----------------------------------
## Clausole WHERE e ORDER BY

Tramite la clausola opzionale GROUP BY è possibile aggregare record, al solito secondo il valore presente nei campi o elaborazioni dello stesso, stabilendo l’ordine logico di aggregazione. 
In presenza di raggruppamenti nella clausola SELECT è possibile fare riferimento esclusivamente agli stessi criteri di aggregazione utilizzati nella GROUP BY e/o a eventuali valori ottenuti da funzioni aggregate. 
Discorso analogo per la clausola ORDER BY, ma senza vincoli nell’ordine di utilizzo.

La clausola opzionale HAVING può essere presente solo in presenza della clausola GROUP BY ed è una clausola di filtro dei raggruppamenti; ne consegue che in essa si possono usare esclusivamente funzioni aggregate applicate ai criteri di raggruppamento e gli operatori logici e di confronto già visti nel caso della clausola WHERE.

Esempio:

    SELECT d.loc,
    	CASE i.job WHEN 'PRESIDENT' THEN 'Capi' 
                WHEN 'MANAGER' THEN 'Capi' ELSE 'Schiavi' END ruolo,
    	AVG (i.sal) F1,         --media del gruppo
    	COUNT (d.loc) F2,         --conteggio dei record con valore per gruppo
    	COUNT (*) F3,         --conteggio dei record per gruppo
    	COUNT (i.sal) F4,         --conteggio dei record con valore per gruppo
    	MAX (i.sal) F5,         --massimo
    	MIN (i.sal) F6,         --minimo
    	SUM (i.sal) F7         --sommatoria
    FROM emp i, dept d
    WHERE i.deptno (+)= d.deptno 
    --outer join per forzare l'utilizzo dei record di dept senza emp collegati
    GROUP BY d.loc,
    		CASE i.job WHEN 'PRESIDENT' THEN 'Capi' 
                        WHEN 'MANAGER' THEN 'Capi' ELSE 'Schiavi' END
    HAVING MAX (NVL(i.sal,0)) < 5000 and COUNT(i.sal) BETWEEN 0 AND 4
    ORDER BY ruolo, AVG(i.sal) DESC, d.loc
    

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/dea79305-dc86-4fdd-8d8a-12ea4177edcb)

-----------------------------------

E’ possibile utilizzare le funzioni aggregate anche senza raggruppamenti (quindi senza la clausola GROUP BY) purché nella SELECT siano esposti solo dati aggregati.

Esempio:

    SELECT
        COUNT(*) F1,               --conteggio generale (record)
        COUNT(DISTINCT d.loc) F2,  
         --la parola chiave DISTINCT permette di ignorare i valori ripetuti 
         -– ma non può essere utilizzata in presenza di dati di tipo CLOB
        COUNT(d.loc) F3,           
        --conteggio dei record con valore non nullo di un campo
        AVG (i.sal) F4             --media generale
    FROM emp i, dept d
    WHERE i.deptno (+)= d.deptno --outer join per forzare l'utilizzo dei record di dept senza emp collegati
    ;
    

Output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/69d172e3-1fc6-46c7-812d-22f93ec2b33e)


-----------------------------------

NB: per una trattazione completa si rimanda alla documentazione ufficiale

-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)

