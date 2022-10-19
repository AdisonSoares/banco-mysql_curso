/*Abrir o workbanch pelo terminal - mysql -u adison -p digitar a senha*/
/*Abrir o mycli pelo terminal - mycli -u adison -p digitar a senha*/
/*MODELAGEM BÁSICA - ENTIDADE = TABELA
**CAMPOS = ATRIBUTOS*/
/*OBS - ATALHO PARA O BRMODELO ORGANIZAR OS DADOS CTRL+O*/
Cliente
NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)

/*PROCESSOS DE MODELAGEM*/
/*FASE 01 E 02 - AD ADM DE DADOS*/
MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/*FASE 03 - DBA OU ADM DE DADOS*/
MODELAGEM FÍSICA - SCRIPTS DE BANCO

/*INICIANDO A MODELAGEM FÍSICA*/
/*CRIANDO O BANCO DE DADOS*/
CREATE DATABASE EXEMPLO;
CREATE DATABASE PROJETO;

/*CONECTANDO-SE AO BANCO*/
USE PROJETO;

/*CRIANDO A TABELA DE CLIENTES*/
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
    SEXO CHAR(1),
	EMAIL VARCHAR(30),
    CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
		
);

/*SINTAXE BÁSICA DE INSERÇÃO - INSERT INTO TABELA....*/

/*VERIFICANDO AS TABELAS DO BANCO*/
SHOW TABLES;

/*DESCOBRINDO A ESTRUTURA DE UMA TABELA*/
DESC CLIENTE;

/*INSERINDO DADOS OMITINDO COLUNAS - FORMA 01*/
INSERT  INTO CLIENTE VALUES('JOAO', 'M', 'JOAO@GMAIL.COM', 988638273, '22923110', 
'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT  INTO CLIENTE VALUES('CELIA', 'F', 'CELIA@GMAIL.COM', 541521456,	'25078869', 
'RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT  INTO CLIENTE VALUES('JORGE', 'M', NULL, 885755896, '54748895',
'OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/*INSERINDO DADOS COLOCANDO COLUNAS - FORMA 02*/
INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF)VALUES('LILIAN', 'F',
'SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ', '947785696', 887774856);

/*INSERINDO DADOS DE FORMA COMPACTA - FORMA 03 - SOMENTE MYSQL*/
INSERT INTO CLIENTE VALUES('ANA', 'F', 'ANA@GLOBO.COM', 85548962, '548556985',
'PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP'),('CARLA', 'F', 'CARLA@TERATI.COM', 7745828, '66587458',
'SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

/*COMANDO SELECT - SELEÇÃO-PROJEÇÃO-JUNÇÃO
SELECT FAZ PARTE DE PROJEÇÃO*/
SELECT NOW() DATA_HORA;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+---------------------+
| DATA_HORA           |
+---------------------+
| 2022-10-01 15:42:41 |
+---------------------+

SELECT 'FELIPE MAFRA';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------------+
| FELIPE MAFRA |
+--------------+
| FELIPE MAFRA |
+--------------+

SELECT 'BANCO DE DADOS';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+----------------+
| BANCO DE DADOS |
+----------------+
| BANCO DE DADOS |
+----------------+


/*ALIAS DE COLUNAS*/
SELECT NOME, SEXO, EMAIL FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+------------------+
| NOME   | SEXO | EMAIL            |
+--------+------+------------------+
| JOAO   | M    | JOAO@GMAIL.COM   |
| CELIA  | F    | CELIA@GMAIL.COM  |
| JORGE  | M    | NULL             |
| LILIAN | F    | NULL             |
| ANA    | F    | ANA@GLOBO.COM    |
| CARLA  | F    | CARLA@TERATI.COM |
+--------+------+------------------+


SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+------------------+------------------------------------------------+
| NOME   | SEXO | EMAIL            | ENDERECO                                       |
+--------+------+------------------+------------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM   | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ   |
| CELIA  | F    | CELIA@GMAIL.COM  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       |
| JORGE  | M    | NULL             | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG  |
| LILIAN | F    | NULL             | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ  |
| ANA    | F    | ANA@GLOBO.COM    | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  |
| CARLA  | F    | CARLA@TERATI.COM | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    |
+--------+------+------------------+------------------------------------------------+


SELECT EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+------------------+------+------------------------------------------------+--------+
| EMAIL            | SEXO | ENDERECO                                       | NOME   |
+------------------+------+------------------------------------------------+--------+
| JOAO@GMAIL.COM   | M    | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ   | JOAO   |
| CELIA@GMAIL.COM  | F    | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       | CELIA  |
| NULL             | M    | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG  | JORGE  |
| NULL             | F    | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ  | LILIAN |
| ANA@GLOBO.COM    | F    | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  | ANA    |
| CARLA@TERATI.COM | F    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    | CARLA  |
+------------------+------+------------------------------------------------+--------+


SELECT EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA FROM CLIENTE;/*ALIAS - PROJEÇÃO DE DADOS*/
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+------------------+------+------------------------------------------------+--------+---------------------+
| EMAIL            | SEXO | ENDERECO                                       | NOME   | DATA_HORA           |
+------------------+------+------------------------------------------------+--------+---------------------+
| JOAO@GMAIL.COM   | M    | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ   | JOAO   | 2022-10-03 17:31:05 |
| CELIA@GMAIL.COM  | F    | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       | CELIA  | 2022-10-03 17:31:05 |
| NULL             | M    | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG  | JORGE  | 2022-10-03 17:31:05 |
| NULL             | F    | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ  | LILIAN | 2022-10-03 17:31:05 |
| ANA@GLOBO.COM    | F    | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  | ANA    | 2022-10-03 17:31:05 |
| CARLA@TERATI.COM | F    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    | CARLA  | 2022-10-03 17:31:05 |
+------------------+------+------------------------------------------------+--------+---------------------+


SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;/*ALIAS - PROJEÇÃO DE DADOS*/
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+---------+------+------------------+
| CLIENTE | SEXO | EMAIL            |
+---------+------+------------------+
| JOAO    | M    | JOAO@GMAIL.COM   |
| CELIA   | F    | CELIA@GMAIL.COM  |
| JORGE   | M    | NULL             |
| LILIAN  | F    | NULL             |
| ANA     | F    | ANA@GLOBO.COM    |
| CARLA   | F    | CARLA@TERATI.COM |
+---------+------+------------------+


/*CONSULTAR A TABELA INTEIRA*/
SELECT * FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+------------------+-----------+-----------+------------------------------------------------+
| NOME   | SEXO | EMAIL            | CPF       | TELEFONE  | ENDERECO                                       |
+--------+------+------------------+-----------+-----------+------------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM   | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ   |
| CELIA  | F    | CELIA@GMAIL.COM  | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       |
| JORGE  | M    | NULL             | 885755896 | 54748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG  |
| LILIAN | F    | NULL             | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ  |
| ANA    | F    | ANA@GLOBO.COM    |  85548962 | 548556985 | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  |
| CARLA  | F    | CARLA@TERATI.COM |   7745828 | 66587458  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    |
+--------+------+------------------+-----------+-----------+------------------------------------------------+


/*FILTRANDO DADOS COM WHERE E LIKE*/
SELECT NOME, TELEFONE FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+-----------+
| NOME   | TELEFONE  |
+--------+-----------+
| JOAO   | 22923110  |
| CELIA  | 25078869  |
| JORGE  | 54748895  |
| LILIAN | 947785696 |
| ANA    | 548556985 |
| CARLA  | 66587458  |
+--------+-----------+


/*FILTRANDO
UTILIZANDO WHERE*/
SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-------+------+
| NOME  | SEXO |
+-------+------+
| JOAO  | M    |
| JORGE | M    |
+-------+------+


SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------------------------------------------------+
| NOME   | ENDERECO                                       |
+--------+------------------------------------------------+
| CELIA  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       |
| LILIAN | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ  |
| ANA    | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  |
| CARLA  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    |
+--------+------------------------------------------------+


SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';/*ESSA PESQUISA ESTÁ INCOMPLETA, PRECISAVA DO ENDEREÇO TODO*/
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Empty set (0,00 sec)


/*UTILIZANDO WHERE E LIKE*/
SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';/*ACONTECE O MESMO ERRO*/
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Empty set (0,00 sec)


/*UTILIZANDO LIKE
TRABALHA COM O CARACTER CORINGA '%' SIGNIFICA QUALQUER COISA*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+-----------------------------------------------+
| NOME   | SEXO | ENDERECO                                      |
+--------+------+-----------------------------------------------+
| JOAO   | M    | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| LILIAN | F    | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
+--------+------+-----------------------------------------------+


SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';/*O '%' INDICA O PREENCHIMENTO DE CONTEÚDO ANTES JÁ QUE O 'RJ' ESTÁ NO FINAL*/
/*COPIA DA IMAGEM DO MYSQL CLIENT*/


SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE 'OSCAR CURY%';/*O '%' PODE SER COLOCADO DEPOIS*/
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-------+------+
| NOME  | SEXO |
+-------+------+
| JORGE | M    |
+-------+------+


SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%';/*O '%' PODE SER COLOCADO ANTES E DEPOIS*/
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-------+------+------------------------------------------------+
| NOME  | SEXO | ENDERECO                                       |
+-------+------+------------------------------------------------+
| CELIA | F    | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       |
| ANA   | F    | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  |
| CARLA | F    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    |
+-------+------+------------------------------------------------+


/*FILTRANDO VALORES NULOS
IS NULL OU IS NOT NULL*/
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+-----------------------------------------------+
| NOME   | SEXO | ENDERECO                                      |
+--------+------+-----------------------------------------------+
| JORGE  | M    | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
+--------+------+-----------------------------------------------+


/*FILTRANDO VALORES NÃO NULOS
IS NULL OU IS NOT NULL*/
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-------+------+------------------------------------------------+
| NOME  | SEXO | ENDERECO                                       |
+-------+------+------------------------------------------------+
| JOAO  | M    | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ   |
| CELIA | F    | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       |
| ANA   | F    | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  |
| CARLA | F    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    |
+-------+------+------------------------------------------------+


/*UTILIZANDO UPDATE PARA ATUALIZAR DADOS QUE PODEM NÃO ESTAR PREENCHIDOS OU DESATUALIZADOS
NO EXEMPLO VAI ATUALIZAR EM TODOS OS REGISTROS NÃO APENAS NOS NULOS*/
/*CONSULTAR*/
SELECT NOME, EMAIL
FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------------------+
| NOME   | EMAIL            |
+--------+------------------+
| JOAO   | JOAO@GMAIL.COM   |
| CELIA  | CELIA@GMAIL.COM  |
| JORGE  | NULL             |
| LILIAN | NULL             |
| ANA    | ANA@GLOBO.COM    |
| CARLA  | CARLA@TERATI.COM |
+--------+------------------+


/*COMANDO UPDATE GERAL*/
UPDATE CLIENTE
SET EMAIL = 'LILIAN@GMAIL.COM';

/*CONSULTAR*/
SELECT NOME, EMAIL
FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------------------+
| NOME   | EMAIL            |
+--------+------------------+
| JOAO   | LILIAN@GMAIL.COM |
| CELIA  | LILIAN@GMAIL.COM |
| JORGE  | LILIAN@GMAIL.COM |
| LILIAN | LILIAN@GMAIL.COM |
| ANA    | LILIAN@GMAIL.COM |
| CARLA  | LILIAN@GMAIL.COM |
+--------+------------------+


/*UTILIZANDO UPDATE PARA ATUALIZAR DADOS QUE PODEM NÃO ESTAR PREENCHIDOS OU DESATUALIZADOS
NO EXEMPLO VAI ATUALIZAR SELECIONANDO AS TABELAS COM WHERE*/
/*EXISTE UMA FORMA DE VOLTAR COM UMA ATUALIZAÇÃO MAL FEITA POR MEIO DOS COMANDOS
COMMIT E ROLLBACK*/
/*CONSULTAR*/
SELECT NOME, EMAIL
FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------------------+
| NOME   | EMAIL            |
+--------+------------------+
| JOAO   | LILIAN@GMAIL.COM |
| CELIA  | LILIAN@GMAIL.COM |
| JORGE  | LILIAN@GMAIL.COM |
| LILIAN | LILIAN@GMAIL.COM |
| ANA    | LILIAN@GMAIL.COM |
| CARLA  | LILIAN@GMAIL.COM |
+--------+------------------+

/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'JOAO@GMAIL.COM'
WHERE NOME = 'JOÃO';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,02 sec)
Rows matched: 1  Changed: 1  Warnings: 0


/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'CELIA@GMAIL.COM'
WHERE NOME = 'CELIA';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,01 sec)
Rows matched: 1  Changed: 1  Warnings: 0


/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'JORGE@GMAIL.COM'
WHERE NOME = 'JORGE';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,00 sec)
Rows matched: 1  Changed: 1  Warnings: 0


/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'ANA@GMAIL.COM'
WHERE NOME = 'ANA';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,00 sec)
Rows matched: 1  Changed: 1  Warnings: 0


/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'CARLA@GMAIL.COM'
WHERE NOME = 'CARLA';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

/*CONSULTAR*/
SELECT NOME, EMAIL
FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------------------+
| NOME   | EMAIL            |
+--------+------------------+
| JOAO   | JOAO@GMAIL.COM   |
| CELIA  | CELIA@GMAIL.COM  |
| JORGE  | JORGE@GMAIL.COM  |
| LILIAN | LILIAN@GMAIL.COM |
| ANA    | ANA@GMAIL.COM    |
| CARLA  | CARLA@GMAIL.COM  |
+--------+------------------+


/*ANTES DE DELETAR É PRECISO CONTAR OS REGISTROS DA TABELA*/
SELECT COUNT(*) FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+

/*OBSERVAÇÃO:
--TOTAL DE REGISTROS = 6*/

/*PROBLEMA QUERO DELETAR O REGISTRO 'ANA', ANTES SELECIONO A TABELA*/
SELECT * FROM CLIENTE WHERE NOME = 'ANA';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+------+------+---------------+----------+-----------+------------------------------------------------+
| NOME | SEXO | EMAIL         | CPF      | TELEFONE  | ENDERECO                                       |
+------+------+---------------+----------+-----------+------------------------------------------------+
| ANA  | F    | ANA@GMAIL.COM | 85548962 | 548556985 | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  |
+------+------+---------------+----------+-----------+------------------------------------------------+


/*CASO SEJA MUITAS TABELAS A CONSULTA TEM QUE SER ESPECIFICA*/
SELECT COUNT(*) FROM CLIENTE
WHERE NOME = 'ANA';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+

/*OBSERVAÇÃO:
--O TOTAL DE REGISTROS DEPOIS DE DELETADO DEVERÁ SER DE 5*/

/*DELETANDO REGISTROS COM A CLAUSULA DELETE
COM WHERE O COMANDO SERÁ ESPECIFICO, NESSE CASO DELETANDO TODA A TABELA COM NOME = 'ANA' APENAS*/
DELETE FROM CLIENTE
WHERE NOME = 'ANA';

/*DEPOIS DE DELETAR É PRECISO CONTAR OS REGISTROS DA TABELA*/
SELECT COUNT(*) FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,01 sec)

/*OBSERVAÇÃO:
--TOTAL DE REGISTROS = 5*/
SELECT COUNT(*) FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+


/*DELETANDO REGISTROS COM A CLAUSULA DELETE
SEM WHERE O COMANDO SERÁ GERAL, NESSE CASO DELETANDO TODA A TABELA CLIENTE*/
DELETE FROM CLIENTE;

/*COMANDOS DE CALCULADORA NO MYSQL*/
SELECT 6-1;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-----+
| 6-1 |
+-----+
|   5 |
+-----+


/*DESCREVER A TABELA PARA SABER O TIPO DE CADA DADO*/
DESC CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| NOME     | varchar(30)  | YES  |     | NULL    |       |
| SEXO     | char(1)      | YES  |     | NULL    |       |
| EMAIL    | varchar(30)  | YES  |     | NULL    |       |
| CPF      | int          | YES  |     | NULL    |       |
| TELEFONE | varchar(30)  | YES  |     | NULL    |       |
| ENDERECO | varchar(100) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+


/*INSERINDO DADOS NA TABELA*/
INSERT INTO CLIENTE VALUES ('CARLA', 'F', 'CARLA.LOPES@GMAIL.COM', 45638854, '4575-0048', 'QNH 40, CASA 20, LOTE 03');
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,00 sec)


/*PROBLEMA: DELETAR O REGISTRO CARLA COM O EMAIL CARLA@GMAIL.COM
ANALISE DO CONTEUDO CERTO A SER DELETADO PARA NÃO HAVER ERROS*/

SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'CARLA@GMAIL.COM';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-------+------+-----------------------+----------+-----------+---------------------------------------------+
| NOME  | SEXO | EMAIL                 | CPF      | TELEFONE  | ENDERECO                                    |
+-------+------+-----------------------+----------+-----------+---------------------------------------------+
| CARLA | F    | CARLA@GMAIL.COM       |  7745828 | 66587458  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG |
| CARLA | F    | CARLA.LOPES@GMAIL.COM | 45638854 | 4575-0048 | QNH 40, CASA 20, LOTE 03                    |
+-------+------+-----------------------+----------+-----------+---------------------------------------------+


/*OBSERVAÇÃO: A CONSULTA MOSTROU OS DOIS REGISTROS DA CARLA QUE EXISTEM
QUANDO SE USA O CONECTIVO OR É MOSTRADO TODOS OS REGISTROS COM PELO MENOS UMA DAS CONDIÇÕES*/

/*USO DO DELETE DE ACORDO COM O SELECT FEITO - OBS NÃO USAR NO EXEMPLO*/

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'CARLA@GMAIL.COM';

/*OBSERVAÇÃO: O DELETE EXCLUIU OS DOIS REGISTROS DA CARLA QUE EXISTEM
QUANDO SE USA O CONECTIVO OR É DELETADO TODOS OS REGISTROS COM PELO MENOS UMA DAS CONDIÇÕES
COMO SÓ QUERIA DELETAR UM REGISTRO ERA NECESSÁRIO ESPECIFICAR*/

/*PROBLEMA: DELETAR APENAS O REGISTRO CARLA COM O EMAIL CARLA@GMAIL.COM
ANALISE DO CONTEUDO CERTO A SER DELETADO PARA NÃO HAVER ERROS*/

SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@GMAIL.COM';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-------+------+-----------------+---------+----------+---------------------------------------------+
| NOME  | SEXO | EMAIL           | CPF     | TELEFONE | ENDERECO                                    |
+-------+------+-----------------+---------+----------+---------------------------------------------+
| CARLA | F    | CARLA@GMAIL.COM | 7745828 | 66587458 | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG |
+-------+------+-----------------+---------+----------+---------------------------------------------+


/*OBSERVAÇÃO: A CONSULTA MOSTROU APENAS O REGISTROS DA CARLA COM O EMAIL = CARLA@GMAIL.COM
QUANDO SE USA O CONECTIVO AND É MOSTRADO O(S) REGISTRO(S) QUE ATENDE(M) AS DUAS CONDIÇÕES*/


/*USO DO DELETE DE ACORDO COM O SELECT FEITO */

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@GMAIL.COM';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,02 sec)


/*OBSERVAÇÃO: O DELETE EXCLUIU O REGISTRO DA CARLA COM EMAIL = CARLA@GMAIL.COM
QUANDO SE USA O CONECTIVO AND É DELETADO TODOS OS REGISTROS QUE ATENDEM AS CONDIÇÕES
DELETANDO UM REGISTRO ESPECIFICO*/

/*CONSULTAR DADOS COMPLETOS DA TABELA*/
SELECT * FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+-----------------------+-----------+-----------+-----------------------------------------------+
| NOME   | SEXO | EMAIL                 | CPF       | TELEFONE  | ENDERECO                                      |
+--------+------+-----------------------+-----------+-----------+-----------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM        | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | CELIA@GMAIL.COM       | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE  | M    | JORGE@GMAIL.COM       | 885755896 | 54748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | LILIAN@GMAIL.COM      | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
| CARLA  | F    | CARLA.LOPES@GMAIL.COM |  45638854 | 4575-0048 | QNH 40, CASA 20, LOTE 03                      |
+--------+------+-----------------------+-----------+-----------+-----------------------------------------------+


/*COLOCANDO MAIS DADOS NO BANCO - SOBRESCREVENDO*/
UPDATE CLIENTE
SET TELEFONE = '997865421'
WHERE NOME = 'JOAO';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Query OK, 1 row affected (0,00 sec)
Rows matched: 1  Changed: 1  Warnings: 0


/*CONSULTAR DADOS COMPLETOS DA TABELA*/
SELECT * FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+-----------------------+-----------+-----------+-----------------------------------------------+
| NOME   | SEXO | EMAIL                 | CPF       | TELEFONE  | ENDERECO                                      |
+--------+------+-----------------------+-----------+-----------+-----------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM        | 988638273 | 997865421 | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | CELIA@GMAIL.COM       | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE  | M    | JORGE@GMAIL.COM       | 885755896 | 54748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | LILIAN@GMAIL.COM      | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
| CARLA  | F    | CARLA.LOPES@GMAIL.COM |  45638854 | 4575-0048 | QNH 40, CASA 20, LOTE 03                      |
+--------+------+-----------------------+-----------+-----------+-----------------------------------------------+


/*Abrir o workbanch pelo terminal - mysql -u adison -p - digitar a senha*/

/*PRIMEIRA FORMA NORMAL
 REGRAS:

 1 - TODO CAMPO VETORIZADO VAI SE TORNAR OUTRA TABELA QUE PRECISAM SER DO
 MESMO TIPO OU MESMA FAMILIA COMO DADOS NUMERICOS OU STRINGS.

 2 - TODO CAMPO MULTIVALORADO VAI SE TORNAR OUTRA TABELA OU QUANDO O CAMPO
 FOR DIVISIVEL, NÃO É UM VETOR POR TER ELEMENTOS DE TIPOS VARIADOS.

 3 - TODA A TABELA NECESSITA DE PELO MENOS UM CAMPO QUE INDENTIFIQUE TODO O REGISTRO
 COMO SENDO UNICO, OU SEJA, PRECISA DE UMA CHAVE PRIMARIA OU PRIMARY KEY.

 OBSERVACAO:
  -  QUANDO SE FAZ MODELAGEM DE NÉGOCIOS SE VALORIZA O PROCEDIMENTO INTERIOR
 DE CRIAÇÃO DE PROCESSOS E NÃO APROVEITAMENTO NO CASO DE PROCEDIMENTOS, PARA SE DEFINIR
 UMA CHAVE PRIMARIA O MAIS RECOMENDADO É CRIAR UM PRÓPRIO E NÃO APROVEITAR, COMO NO CASO
 DO CPF.
  -  EXISTEM DOIS TIPOS DE CHAVES PRIMARIAS AS NATURAIS (COMO O CPF) E AS ARTIFICIAIS (CRIADAS)
 
 */
