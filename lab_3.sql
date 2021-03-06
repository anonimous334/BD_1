CREATE TABLE COMPANII
(
ID_COMPANIE NUMBER(2) PRIMARY KEY,
DENUMIRE VARCHAR2(10),
LOCALITATE_SEDIU VARCHAR2(10),
NUME_CEO VARCHAR2(20)
);


CREATE TABLE FILIALE
(
ID_COMPANIE NUMBER(2),
ID_FILIALA NUMBER(1),
DENUMIRE VARCHAR2(10),
LOCALITATE VARCHAR2(10),
NR_ANGAJATI NUMBER(4),
CONSTRAINT PK_FILIALE PRIMARY KEY (ID_COMPANIE, ID_FILIALA),
CONSTRAINT FK_FILIALE_COMPANY FOREIGN KEY (ID_COMPANIE)
REFERENCES COMPANII(ID_COMPANIE)
);


CREATE TABLE SALARIATI
(
MATRICOL NUMBER(6) PRIMARY KEY,
NUME VARCHAR2(10),
PRENUME VARCHAR2(10),
ID_COMPANIE NUMBER(2),
ID_FILIALA NUMBER(1),
SALARIU NUMBER(7, 2),
CONSTRAINT FK_SALARIATI_FILIALE FOREIGN KEY (ID_COMPANIE, ID_FILIALA)
REFERENCES FILIALE(ID_COMPANIE, ID_FILIALA)
);

-- COMENTARIU

INSERT INTO COMPANII (ID_COMPANIE, DENUMIRE, LOCALITATE_SEDIU, NUME_CEO) 
VALUES (1, 'COMPANIE 1', 'BUCURESTI', 'POPESCU');

INSERT INTO COMPANII (ID_COMPANIE, DENUMIRE, LOCALITATE_SEDIU, NUME_CEO) 
VALUES (2, 'COMPANIE 2', 'CONSTANTA', 'POPESCU');

INSERT INTO FILIALE (ID_COMPANIE, ID_FILIALA, DENUMIRE, LOCALITATE, NR_ANGAJATI)
VALUES(1, 1, 'F1 C1', 'PLOIESTI', 10);
INSERT INTO FILIALE (ID_COMPANIE, ID_FILIALA, DENUMIRE, LOCALITATE, NR_ANGAJATI)
VALUES(1, 2, 'F2 C1', 'CLUJ', 4);
INSERT INTO FILIALE (ID_COMPANIE, ID_FILIALA, DENUMIRE, LOCALITATE, NR_ANGAJATI)
VALUES(2, 1, 'F1 C2', 'IASI', 5);

INSERT INTO SALARIATI (MATRICOL, NUME, PRENUME, ID_COMPANIE, ID_FILIALA, SALARIU)
VALUES(1, 'N1', 'P1', 1, 1, 1000);
INSERT INTO SALARIATI (MATRICOL, NUME, PRENUME, ID_COMPANIE, ID_FILIALA, SALARIU)
VALUES(2, 'N2', 'P2', 1, 2, 1050);
INSERT INTO SALARIATI (MATRICOL, NUME, PRENUME, ID_COMPANIE, ID_FILIALA, SALARIU)
VALUES(3, 'N3', 'P3', 2, 1, 2000);
INSERT INTO SALARIATI (MATRICOL, NUME, PRENUME, ID_COMPANIE, ID_FILIALA, SALARIU)
VALUES(4, 'N4', 'P4', 1, 1, 1600);


--- COMENZI SELECT
SELECT * FROM SALARIATI WHERE ID_COMPANIE=1;

SELECT * FROM SALARIATI WHERE ID_COMPANIE=2;

SELECT * FROM SALARIATI WHERE ID_COMPANIE=&COMP;

SELECT * FROM FILIALE WHERE LOCALITATE = '&&LOC';


SELECT DENUMIRE, LOCALITATE, NR_ANGAJATI FROM FILIALE
WHERE LOCALITATE = '&LOC';


DROP TABLE SALARIATI;

DROP TABLE FILIALE;

DROP TABLE COMPANII;

UNDEFINE LOC