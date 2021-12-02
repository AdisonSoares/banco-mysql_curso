/*Sobre a cardinalidade
Quem define a cardinalidade é a regra de negócio.
Como é definido cada valor do algarismo é da seguinte forma:
- Primeiro algarismo, define a obrigatoriedade:
--1) Obrigado a ter
--0) Não obrigado a ter
- Segundo algarismo, define a cardinalidade:
--1) Máximo um elemento
--N) Mais de um elemento.

-Sobre o comando enum, esse comando configura um domínio que mostra uma opção de escolhas
que não podem ser modificadas, esse comando só existe no mysql.*/

/*REGRA DE NEGÓCIOS:
-ENDEREÇO OBRIGATORIO E SOMENTE UM.
-TELEFONE NÃO OBRIGATORIO CADASTRO DE MAIS DE UM É OPCIONAL.*/

/*CRIANDO UM NOVO BANCO DE DADOS*/
CREATE DATABASE COMERCIO;

/*CONECTANDO AO BANCO CRIADO*/
USE COMERCIO;

/*CONSULTAR SE EXISTEM OUTROS BANCOS DE DADOS*/
SHOW DATABASES;

/*CRIANDO AS TABELAS DE ACORDO COM A MODELAGEM LÓGICA PARA A FÍSICA*/
/*TABELA CLIENTE*/
CREATE TABLE CLIENTE(
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    SEXO ENUM('M', 'F') NOT NULL,
    EMAIL VARCHAR(30) UNIQUE,
    CPF VARCHAR(15) UNIQUE
);

/*TABELA ENDEREÇO*/
CREATE TABLE ENDERECO(
    ID_ENDERECO INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL
); 

/*TABELA TELEFONE*/
CREATE TABLE TELEFONE(
    ID_TELEFONE INT PRIMARY KEY AUTO INCREMENT,
    TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
    NUMERO VARCHAR(15) NOT NULL UNIQUE
);