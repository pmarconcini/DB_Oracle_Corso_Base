# Installazione del software e utilizzo degli strumenti

[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)


-----------------------------------
## IMPORT / EXPORT

Sono strumenti che permettono di importare/esportare dati in maniera rapida. E’ considerato a tutti gli effetti uno strumento di back-up.
Per ogni tipo di operazione esiste un eseguibile specifico utilizzabile via prompt di windows.
NB: l’import non esegue la pulizia della tabella che quindi deve essere eseguita “manualmente”.

A seguire le istruzioni base e la relativa risposta a video.


-----------------------------------
###	Export

L'eseguibile è exp e prevede come parametri:

* i dati di connessione
* il nome del file di output
* l'elenco delle tabelle
* il file di log
* le indicazioni per la gestione di grant, trigger, indici e vincoli
* eventuali altri parametri
    
      exp scott/tiger@XE FILE=dati.dmp tables=DEPT, EMP, SALGRADE log=dati.log grants=n triggers=n indexes=n constraints=n

L'operazione produce il seguente output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/362abd2d-36e1-4b38-981f-25e5c028c56e)



-----------------------------------
###	Import

L'eseguibile è imp e prevede come parametri:

* i dati di connessione
* il nome del file di input
* il file di log
* le indicazioni per la gestione in caso di eventuali errori, di processo e delle statistiche
* eventuali altri parametri

      imp scott/tiger@XE FILE=dati.dmp LOG=dati_imp.log ignore=y feedback=100000 statistics=none

L'operazione prevede una pulizia preventiva delle tabelle e produce il seguente output:

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/7f6adb07-4299-46d5-a36c-f3898ebc4a5c)

![image](https://github.com/pmarconcini/DB_Oracle_Corso_Base/assets/82878995/6248ac8e-c646-40d5-9758-15278525f47d)



-----------------------------------
[Torna al SOMMARIO](https://github.com/pmarconcini/DB_Oracle_Corso_Base/blob/master/000_sommario.md)
