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

/*CRIANDO AS TABELAS DE ACORDO COM A MODELAGEM LÓGICA PARA A FÍSICA*/
/*TABELA CLIENTE*/
CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    SEXO ENUM('M', 'F') NOT NULL,
    EMAIL VARCHAR(30) UNIQUE,
    CPF VARCHAR(15) UNIQUE
);

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

/*TABELA TELEFONE - CARDINALIDADE 1xN (S/ UNIQUE NA FK)*/
CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
    NUMERO VARCHAR(15) NOT NULL,
    ID_CLIENTE INT,
    FOREIGN KEY(ID_CLIENTE)
    REFERENCES CLIENTE(IDCLIENTE)
);