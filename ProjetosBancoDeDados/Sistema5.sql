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

/*CRIANDO UM NOVO BANCO DE DADOS*/
CREATE DATABASE COMERCIO;

/*CONECTANDO AO BANCO CRIADO*/
USE COMERCIO;

/*CONSULTAR SE EXISTEM OUTROS BANCOS DE DADOS*/
SHOW DATABASES;

/*CRIANDO AS TABELAS DE ACORDO COM A MODELAGEM LÓGICA PARA A FÍSICA*/
CREATE TABLE CLIENTE(
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    SEXO ENUM('M', 'F') NOT NULL,
    EMAIL VARCHAR(30) UNIQUE,
    CPF VARCHAR(15) UNIQUE
);