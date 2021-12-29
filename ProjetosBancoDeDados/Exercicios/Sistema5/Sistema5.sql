/*SOBRE A CARDINALIDADE
Quem define a cardinalidade é a regra de negócio.
A definição de cada valor do algarismo é da seguinte forma:
- Primeiro algarismo, define a obrigatoriedade:
--1) Obrigado a ter
--0) Não obrigado a ter
- Segundo algarismo, define a cardinalidade:
--1) Máximo um elemento
--N) Mais de um elemento.*/

/*SOBRE O COMANDO ENUM
Esse comando configura um domínio que mostra uma opção de escolhas
que não podem ser modificadas, esse comando só existe no mysql.*/

/*SOBRE A CHAVE ESTRANGEIRA - FK
A chave estrangeira é a chave primaria de uma tabela que se conecta
a outra tabela para fazer referencia entre registros.
A chave estrangeira para ser definida vai depender da regra de negocios
e da cardinalidade da conexao entre tabelas.*/

/*SOBRE A REGRA DA CHAVE ESTRANGEIRA DE ACORDO COM A CARDINALIDADE
Em relacionamentos 1 x 1 a chave estrangeira fica na tabela mais fraca.
Em relacionamentos 1 x n ficará sempre na cardinalidade N.
*/

/*SOBRE A DEFINIÇÃO DE TABELA FORTE E FRACA
Inicialmente quem define isso é a regra de negócio, é preciso comparar as  tabelas 
que estão ligadas/relacionadas para ver qual delas é mais complexa e menos complexa,
a tabela mais complexa é a forte e a menos complexa é a mais fraca.
É preciso analisar o foco do negócio e dar mais importância a ele.*/

/*REGRA DE NEGÓCIOS:
-ENDEREÇO OBRIGATORIO E SOMENTE UM.
-TELEFONE NÃO OBRIGATORIO CADASTRO DE MAIS DE UM É OPCIONAL.*/

/*CRIANDO UM NOVO BANCO DE DADOS*/
CREATE DATABASE COMERCIO;

/*CONECTANDO AO BANCO CRIADO*/
USE COMERCIO;

/*CONSULTAR SE EXISTEM OUTROS BANCOS DE DADOS*/
SHOW DATABASES;

/*COMANDO PARA APAGAR UMA TABELA*/
DROP TABLE CLIENTE;

/********************************************************************************************************/

/*CRIANDO AS TABELAS DE ACORDO COM A MODELAGEM LÓGICA PARA A FÍSICA*/
/*TABELA CLIENTE*/
CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    SEXO ENUM('M', 'F') NOT NULL,
    EMAIL VARCHAR(30) UNIQUE,
    CPF VARCHAR(15) UNIQUE
);

/*INSERINDO DADOS NA TABELA CLIENTE*/
/*TABELA CLIENTE, COMO O ID É AUTO INCREMENTADO É NECESSÁRIOS APENAS DECLARAR COMO NULL*/
INSERT INTO CLIENTE VALUES(NULL,'GILSON','M','GILSON@GMAIL.COM','54685299720');
INSERT INTO CLIENTE VALUES(NULL,'FERNANDO','M','FERNANDO@GMAIL.COM','12385299720');
INSERT INTO CLIENTE VALUES(NULL,'MARIA','F','MARIA@GMAIL.COM','45685299720');
INSERT INTO CLIENTE VALUES(NULL,'CAROL','F',NULL,'78985299720');
INSERT INTO CLIENTE VALUES(NULL,'JOEL','M','JOEL@GMAIL.COM','14785299720');
INSERT INTO CLIENTE VALUES(NULL,'GABRIELA','F','GABRILEA@GMAIL.COM','25885299720');

/*CONSULTAR OS DADOS INSERIDOS*/
SELECT * FROM CLIENTE;

/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-----------+----------+------+--------------------+-------------+
| IDCLIENTE | NOME     | SEXO | EMAIL              | CPF         |
+-----------+----------+------+--------------------+-------------+
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | 54685299720 |
|         2 | FERNANDO | M    | FERNANDO@GMAIL.COM | 12385299720 |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | 45685299720 |
|         4 | CAROL    | F    | NULL               | 78985299720 |
|         5 | JOEL     | M    | JOEL@GMAIL.COM     | 14785299720 |
|         6 | GABRIELA | F    | GABRILEA@GMAIL.COM | 25885299720 |
+-----------+----------+------+--------------------+-------------+


/********************************************************************************************************/

/*TABELA ENDEREÇO - CARDINALIDADE 1x1 (C/ UNIQUE NA FK)*/
CREATE TABLE ENDERECO(
    IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    ID_CLIENTE INT UNIQUE,

    FOREIGN KEY(ID_CLIENTE)
    REFERENCES CLIENTE(IDCLIENTE)
); 

/*CONSULTAR A DESCRIÇÃO DOS DADOS NO TERMINAL*/
DESC ENDERECO;

/*INSERINDO DADOS NA TABELA ENDEREÇO DO CLIENTE*/
/*TABELA ENDEREÇO, COMO O ID É AUTO INCREMENTADO É NECESSÁRIOS APENAS DECLARAR COMO NULL,
 COMO É DO TIPO UNIQUE CADA ID_CLIENTE TERÁ APENAS UM ENDEREÇO, NAO PODENDO SER NULL.*/
INSERT INTO ENDERECO VALUES(NULL,'Praça Barão ','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'Avenida Braga','CENTRO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'Praça Floriano','CENTRO','RIO DE JANEIRO','RJ',3);
INSERT INTO ENDERECO VALUES(NULL,'Avenida Agache','CENTRO','RIO DE JANEIRO','RJ',4);
INSERT INTO ENDERECO VALUES(NULL,'Avenida Barroso','CENTRO','RIO DE JANEIRO','RJ',5);
INSERT INTO ENDERECO VALUES(NULL,'Avenida Sílvio ','CENTRO','RIO DE JANEIRO','RJ',6);

/*CONSULTAR OS DADOS DA TABELA ENDEREÇO DO CLIENTE*/
SELECT * FROM ENDERECO;

/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+------------+-----------------+--------+----------------+--------+------------+
| IDENDERECO | RUA             | BAIRRO | CIDADE         | ESTADO | ID_CLIENTE |
+------------+-----------------+--------+----------------+--------+------------+
|          1 | Praça Barão     | CENTRO | RIO DE JANEIRO | RJ     |          1 |
|          2 | Avenida Braga   | CENTRO | RIO DE JANEIRO | RJ     |          2 |
|          3 | Praça Floriano  | CENTRO | RIO DE JANEIRO | RJ     |          3 |
|          4 | Avenida Agache  | CENTRO | RIO DE JANEIRO | RJ     |          4 |
|          5 | Avenida Barroso | CENTRO | RIO DE JANEIRO | RJ     |          5 |
|          6 | Avenida Sílvio  | CENTRO | RIO DE JANEIRO | RJ     |          6 |
+------------+-----------------+--------+----------------+--------+------------+


/********************************************************************************************************/

/*TABELA TELEFONE - CARDINALIDADE 1xN (S/ UNIQUE NA FK)*/
CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
    NUMERO VARCHAR(15) NOT NULL,
    ID_CLIENTE INT,

    FOREIGN KEY(ID_CLIENTE)
    REFERENCES CLIENTE(IDCLIENTE)
);

/*CONSULTAR A DESCRIÇÃO DOS DADOS NO TERMINAL*/
DESC TELEFONE;

/*INSERINDO DADOS NA TABELA TELEFONE DO CLIENTE*/
/*TABELA TELEFONE, COMO O ID É AUTO INCREMENTADO É NECESSÁRIOS APENAS DECLARAR COMO NULL,
 COMO NÃO É DO TIPO UNIQUE CADA ID_CLIENTE PODERÁ TER MAIS DE UM TELEFONE*/
 INSERT INTO TELEFONE VALUES(NULL, 'RES', 45853033,1);
 INSERT INTO TELEFONE VALUES(NULL, 'COM', 35853033,1);
 INSERT INTO TELEFONE VALUES(NULL, 'CEL', 921678801,2);
 INSERT INTO TELEFONE VALUES(NULL, 'RES', 25853033,3);
 INSERT INTO TELEFONE VALUES(NULL, 'RES', 85853033,3);
 INSERT INTO TELEFONE VALUES(NULL, 'CEL', 971406822,2);
 INSERT INTO TELEFONE VALUES(NULL, 'COM', 34853033,2);
 INSERT INTO TELEFONE VALUES(NULL, 'RES', 40853033,2);
 INSERT INTO TELEFONE VALUES(NULL, 'RES', 41853033,3);
 INSERT INTO TELEFONE VALUES(NULL, 'CEL', 990891200,1);
 INSERT INTO TELEFONE VALUES(NULL, 'RES', 51853033,1);

/*CONSULTAR OS DADOS NA TABELA TELEFONE DO CLIENTE*/
SELECT * FROM TELEFONE;

/*COPIA DA IMAGEM DO MYSQL CLIENT*/
| IDTELEFONE | TIPO | NUMERO    | ID_CLIENTE |
+------------+------+-----------+------------+
|          1 | RES  | 45853033  |          1 |
|          2 | COM  | 35853033  |          1 |
|          3 | CEL  | 921678801 |          2 |
|          4 | RES  | 25853033  |          3 |
|          5 | RES  | 85853033  |          3 |
|          6 | CEL  | 971406822 |          2 |
|          7 | COM  | 34853033  |          2 |
|          8 | RES  | 40853033  |          2 |
|          9 | RES  | 41853033  |          3 |
|         10 | CEL  | 990891200 |          1 |
|         11 | RES  | 51853033  |          1 |
+------------+------+-----------+------------+

/* SELEÇÃO, PROJEÇÃO E JUNÇÃO*/
/*PROJEÇÃO -> É TUDO QUE VOCÊ QUER VER NA TELA*/

/*PROJETANDO UMA COLUNA NOW - DATA ATUAL (PROGRAMAR TABELA)*/
SELECT NOW() AS DATA_ATUAL;

/*PROJETANDO UMA COLUNA DE SOMA (PROGRAMAR TABELA)*/
SELECT 2+2 AS SOMA;

/*MOSTRAR COLUNAS DE PROGRAMAÇÃO E VINDOS DE UMA TABELA - MISTURAR*/
SELECT 2+2 AS SOMA, NOME, NOW() FROM CLIENTE;

/*PROJETANDO DADOS E CONSULTANDO A TABELA - O QUE QUER MOSTRAR NA TELA*/
SELECT NOME, SEXO, TIPO, TELEFONE, BAIRRO

/*SELEÇÃO - FILTRAGEM, A CLÁUSULA DE SELEÇÃO É O WHERE*/
SELECT NOME, SEXO, EMAIL /*-> PROJEÇÃO*/
FROM CLIENTE /*-> ORIGEM*/
WHERE SEXO = 'F'; /*-> SELEÇÃO*/

/*OUTRO EXEMPLO*/
SELECT NUMERO /*--> PROJEÇÃO*/
FROM TELEFONE /*--> ORIGEM*/
WHERE TIPO = 'CEL'; /*--> SELEÇÃO*/

/*JUNÇÃO DE DUAS OU MAIS TABELAS - JOIN*/
SELECT NOME, EMAIL, IDCLIENTE /*--> PROJEÇÃO*/
FROM CLIENTE; /*--> ORIGEM*/

+----------+--------------------+-----------+
| NOME     | EMAIL              | IDCLIENTE |
+----------+--------------------+-----------+
| GILSON   | GILSON@GMAIL.COM   |         1 |
| FERNANDO | FERNANDO@GMAIL.COM |         2 |
| MARIA    | MARIA@GMAIL.COM    |         3 |
| CAROL    | NULL               |         4 |
| JOEL     | JOEL@GMAIL.COM     |         5 |
| GABRIELA | GABRILEA@GMAIL.COM |         6 |
+----------+--------------------+-----------+

SELECT ID_CLIENTE, BAIRRO, CIDADE /*--> PROJEÇÃO*/
FROM ENDEREÇO; /*--> ORIGEM*/
+------------+--------+----------------+
| ID_CLIENTE | BAIRRO | CIDADE         |
+------------+--------+----------------+
|          1 | CENTRO | RIO DE JANEIRO |
|          2 | CENTRO | RIO DE JANEIRO |
|          3 | CENTRO | RIO DE JANEIRO |
|          4 | CENTRO | RIO DE JANEIRO |
|          5 | CENTRO | RIO DE JANEIRO |
|          6 | CENTRO | RIO DE JANEIRO |
+------------+--------+----------------+

/*PROJETAR NOME, SEXO, BAIRRO, CIDADE - UNIFICAR A CHAVE PRIMARIA COM A CHAVE ESTRANGEIRA*/
SELECT NOME, SEXO, BAIRRO, CIDADE /*--> PROJEÇÃO*/
FROM CLIENTE, ENDERECO /*--> ORIGEM*/
WHERE IDCLIENTE = ID_CLIENTE; /*--> JUNÇÃO*/

+----------+------+--------+----------------+
| NOME     | SEXO | BAIRRO | CIDADE         |
+----------+------+--------+----------------+
| GILSON   | M    | CENTRO | RIO DE JANEIRO |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO |
| MARIA    | F    | CENTRO | RIO DE JANEIRO |
| CAROL    | F    | CENTRO | RIO DE JANEIRO |
| JOEL     | M    | CENTRO | RIO DE JANEIRO |
| GABRIELA | F    | CENTRO | RIO DE JANEIRO |
+----------+------+--------+----------------+

/*FAZENDO COM FILTRO*/
SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE /*--> TABELA VERDADE*/
AND SEXO = 'F'; /*--> TABELA VERDADE*/
+----------+------+--------+----------------+
| NOME     | SEXO | BAIRRO | CIDADE         |
+----------+------+--------+----------------+
| MARIA    | F    | CENTRO | RIO DE JANEIRO |
| CAROL    | F    | CENTRO | RIO DE JANEIRO |
| GABRIELA | F    | CENTRO | RIO DE JANEIRO |
+----------+------+--------+----------------+

/*CLAUSULA JOIN*/
SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;
+----------+------+--------+----------------+
| NOME     | SEXO | BAIRRO | CIDADE         |
+----------+------+--------+----------------+
| GILSON   | M    | CENTRO | RIO DE JANEIRO |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO |
| MARIA    | F    | CENTRO | RIO DE JANEIRO |
| CAROL    | F    | CENTRO | RIO DE JANEIRO |
| JOEL     | M    | CENTRO | RIO DE JANEIRO |
| GABRIELA | F    | CENTRO | RIO DE JANEIRO |
+----------+------+--------+----------------+

/*FAZENDO COM FILTRO - QUERY COMPLETA*/
SELECT NOME, SEXO, BAIRRO, CIDADE /*--> PROJEÇÃO*/
FROM CLIENTE /*--> ORIGEM*/
    INNER JOIN ENDERECO /*--> JUNÇÃO*/
    ON IDCLIENTE = ID_CLIENTE /*--> CONDIÇAO*/
WHERE SEXO = 'F'; /*--> SELEÇAO*/
+----------+------+--------+----------------+
| NOME     | SEXO | BAIRRO | CIDADE         |
+----------+------+--------+----------------+
| MARIA    | F    | CENTRO | RIO DE JANEIRO |
| CAROL    | F    | CENTRO | RIO DE JANEIRO |
| GABRIELA | F    | CENTRO | RIO DE JANEIRO |
+----------+------+--------+----------------+

/*CONSULTA NOME, SEXO, EMAIL, TIPO, NUMERO*/
SELECT NOME, SEXO, EMAIL, TIPO, NUMERO /*--> PROJEÇÃO*/
FROM CLIENTE /*--> ORIGEM*/
    INNER JOIN TELEFONE /*--> JUNÇÃO*/
    ON IDCLIENTE = ID_CLIENTE; /*--> CONDIÇAO*/
+----------+------+--------------------+------+-----------+
| NOME     | SEXO | EMAIL              | TIPO | NUMERO    |
+----------+------+--------------------+------+-----------+
| GILSON   | M    | GILSON@GMAIL.COM   | RES  | 45853033  |
| GILSON   | M    | GILSON@GMAIL.COM   | COM  | 35853033  |
| GILSON   | M    | GILSON@GMAIL.COM   | CEL  | 990891200 |
| GILSON   | M    | GILSON@GMAIL.COM   | RES  | 51853033  |
| FERNANDO | M    | FERNANDO@GMAIL.COM | CEL  | 921678801 |
| FERNANDO | M    | FERNANDO@GMAIL.COM | CEL  | 971406822 |
| FERNANDO | M    | FERNANDO@GMAIL.COM | COM  | 34853033  |
| FERNANDO | M    | FERNANDO@GMAIL.COM | RES  | 40853033  |
| MARIA    | F    | MARIA@GMAIL.COM    | RES  | 25853033  |
| MARIA    | F    | MARIA@GMAIL.COM    | RES  | 85853033  |
| MARIA    | F    | MARIA@GMAIL.COM    | RES  | 41853033  |
+----------+------+--------------------+------+-----------+

/*CONSULTA NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO - JOIN DE TRÊS TABELAS*/
SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
    INNER JOIN ENDERECO
    ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
    INNER JOIN TELEFONE
    ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;
+----------+------+--------+----------------+------+-----------+
| GILSON   | M    | CENTRO | RIO DE JANEIRO | RES  | 45853033  |
| GILSON   | M    | CENTRO | RIO DE JANEIRO | COM  | 35853033  |
| GILSON   | M    | CENTRO | RIO DE JANEIRO | CEL  | 990891200 |
| GILSON   | M    | CENTRO | RIO DE JANEIRO | RES  | 51853033  |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO | CEL  | 921678801 |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO | CEL  | 971406822 |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO | COM  | 34853033  |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO | RES  | 40853033  |
| MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  | 25853033  |
| MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  | 85853033  |
| MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  | 41853033  |
+----------+------+--------+----------------+------+-----------+

/*CONSULTA NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO - JOIN DE TRÊS TABELAS OUTRA FORMA COM PONTEIRAMENTO*/
SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE;
+----------+------+--------+----------------+------+-----------+
| NOME     | SEXO | BAIRRO | CIDADE         | TIPO | NUMERO    |
+----------+------+--------+----------------+------+-----------+
| GILSON   | M    | CENTRO | RIO DE JANEIRO | RES  | 45853033  |
| GILSON   | M    | CENTRO | RIO DE JANEIRO | COM  | 35853033  |
| GILSON   | M    | CENTRO | RIO DE JANEIRO | CEL  | 990891200 |
| GILSON   | M    | CENTRO | RIO DE JANEIRO | RES  | 51853033  |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO | CEL  | 921678801 |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO | CEL  | 971406822 |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO | COM  | 34853033  |
| FERNANDO | M    | CENTRO | RIO DE JANEIRO | RES  | 40853033  |
| MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  | 25853033  |
| MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  | 85853033  |
| MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  | 41853033  |
+----------+------+--------+----------------+------+-----------+    

/********************************************************************************************************/

/*O MYSQL SE DIVIDE EM LINGUAGENS:
-DML: DATA MANIPULATION LANGUAGE 
-DDL: DATA DEFINITION LANGUAGE
-DCL: DATA CONTROL LANGUAGE
-TCL: TRANSACTION CONTROL LANGUAGE*/        


/*COMANDOS DE DML*/
/*INSERT*/

INSERT INTO CLIENTE VALUES(NULL, 'PAULA', 'M', NULL,'45853033')
INSERT INTO ENDERECO VALUES(NULL, 'RUA JOAQUIM', 'ALVORADA', NITEROI,'RJ',7);
SELECT * FROM CLIENTE;

/*FILTROS*/

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/*UPDATE*/
/*CONSULTA*/
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

/*UPDATE - ATUALIZAÇÃO*/
UPDATA CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/*DELETE*/

INSERT INTO CLIENTE VALUES(NULL, 'YYYYY', 'M', NULL,'000000')

/*CONSULTAR*/
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

/*DELETAR*/
DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/********************************************************************************************************/

/*COMANDOS DE DDL - TEM RELAÇÃO COM O TIPO DE DADO*/
/*CRIAÇÃO DE TABELA - CREATE*/
CREATE TABLE PRODUTO(
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME_PRODUTO VARCHAR(30) NOT NULL,
    PRECO INT,
    FRETE FLOAT(10,2) NOT NULL
);

/*ALTER TABLE*/
/*ALTERANDO O NOME DE UMA COLUNA - CHANGE*/
ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*ALTERAR O TIPO PARA NÃO NULO*/
ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/*MODIFY - PARECIDO COM O CHANGE*/
/*ALTERAR O TIPO*/
ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*ADICIONANDO COLUNAS*/

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*APAGANDO UMA COLUNA*/
ALTER TABLE PRODUTO
DROP COLUMN PESO;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*ADICIONANDO UMA COLUNA EM ORGEM ESPECIFICA*/
ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*APAGANDO UMA COLUNA*/
ALTER TABLE PRODUTO
DROP COLUMN PESO;

/*ADICIONANDO UMA COLUNA COMO PRIMEIRA*/
ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| PESO           | float(10,2) | NO   |     | NULL    |                |
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/********************************************************************************************************/