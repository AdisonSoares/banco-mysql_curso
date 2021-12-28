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
