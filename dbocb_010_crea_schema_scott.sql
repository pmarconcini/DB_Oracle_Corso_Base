connect sys/manager as sysdba

CREATE USER scott IDENTIFIED BY tiger;

CREATE USER scott_app IDENTIFIED BY app;

GRANT create session TO scott;
GRANT create table TO scott;
GRANT create view TO scott;
GRANT create any trigger TO scott;
GRANT create any procedure TO scott;
GRANT create sequence TO scott;
GRANT create synonym TO scott;

GRANT create session TO scott_app;
GRANT create synonym TO scott_app;

CREATE ROLE operatore;

CREATE USER scott_ro IDENTIFIED BY ro;

GRANT create session TO operatore;

GRANT operatore TO scott_ro;

ALTER USER scott QUOTA 100M ON users;
ALTER USER scott_app QUOTA 100M ON users;
ALTER USER scott_ro QUOTA 100M ON users;
 
GRANT UNLIMITED TABLESPACE TO scott;

-- --------------------------------------
connect scott/tiger

START dbocb_020_crea_oggetti_scott.sql

-- --------------------------------------
connect scott/tiger

GRANT SELECT ON prova TO scott_app WITH GRANT OPTION;

GRANT EXECUTE ON pr_prova_ins TO scott_app;

connect scott_app/app

GRANT SELECT ON scott.prova TO scott_ro;

connect sys/manager as sysdba

GRANT ALL ON scott.prova TO scott_ro;

-- --------------------------------------
connect scott_app/app

insert into scott.prova values (1, 'AAA', sysdate);

execute scott.pr_prova_ins (2);

select * from scott.prova;

-- --------------------------------------
