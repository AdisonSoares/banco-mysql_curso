/*Abrir o mycli pelo terminal - mycli -u adison -p digitar a senha*/
/*MODELAGEM LÓGICA E FÍSICA*/
/*AUTORRELACIONAMENTO*/
/*UM CURSO TEM UM PRÉREQUISITO, PARA NÃO TER PRÉREQUISITO DE PRÉREQUISITO USA-SE O AUTORELACIONAMENTO*/

/*BANCO DE DADOS*/
CREATE DATABASE AULA_AUTORELACIONAMENTO;

/*ATILIZANDO BANCO*/
USE AULA_AUTORELACIONAMENTO;

/*TABELA CURSOS*/
CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	ID_PREREQUISITO INT,
	NOME VARCHAR(30),
	HORAS INT,
	VALOR FLOAT(10,2)
);

/*CHAVE ESTRANGEIRA*/
ALTER TABLE CURSOS 
ADD CONSTRAINT FK_PREREQUISITO
FOREIGN KEY(ID_PREREQUISITO)
REFERENCES CURSOS(IDCURSO);

/*INSERINDO DADOS*/
INSERT INTO CURSOS VALUES(NULL, NULL, 'BD RELACIONAL',20, 400.00);
INSERT INTO CURSOS VALUES(NULL, 1, 'POWER BI', 40, 800.00);
INSERT INTO CURSOS VALUES(NULL, 2, 'RELATORIOS AVANCADOS', 20, 600.00);
INSERT INTO CURSOS VALUES(NULL, NULL, 'LOGICA PROGRAMACAO', 20, 400.00);
INSERT INTO CURSOS VALUES(NULL, 4, 'RUBY', 30, 500.00);

/*CONSULTANDO OS CURSOS*/
SELECT * FROM CURSOS;

/*CONSULTANDO OS CURSOS E DEFININDO TRATAMENTO*/
SELECT NOME, VALOR, HORAS, IFNULL(ID_PREREQUISITO,"SEM REQUISITO") REQUISITO
FROM CURSOS;

/*FAZER UMA CONSULTA QUE MOSTRE OS PRÉREQUISITOS*/
SELECT C.NOME AS CURSO,
       C.VALOR AS VALOR, 
       C.HORAS AS CARGA, 
       IFNULL(P.NOME,"---") AS PREREQUISITO
FROM CURSOS C
INNER JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQUISITO;

/*FAZER UMA CONSULTA QUE MOSTRE OS PRÉREQUISITOS MOSTRANDO OS QUE NÃO TEM PREREQUISITO*/
SELECT C.NOME AS CURSO,
       C.VALOR AS VALOR, 
       C.HORAS AS CARGA, 
       IFNULL(P.NOME,"---") AS PREREQUISITO
FROM CURSOS C 
LEFT JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQUISITO;