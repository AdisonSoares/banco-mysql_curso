/*Abrir o workbanch pelo terminal - mysql -u adison -p - digitar a senha*/
/*Abrir o mycli pelo terminal - mycli -u adison -p - "digitar a senha"*/

/*Criando o banco de dados - Modelagem Física - Scripts de Banco*/

/*Criando o Banco de Dados*/
CREATE DATABASE SISTEMA1;

/*Conectando-se ao banco de dados*/
USE SISTEMA1;

/*Criando a tabela de dados*/
CREATE TABLE CLIENTE(
	CPF VARCHAR(11)PRIMARY KEY,
	EMAIL VARCHAR(30),
	SEXO VARCHAR(10),
	NOME VARCHAR(30),
	ANO_NASCIMENTO VARCHAR(4),
	CIDADE VARCHAR(10),
	LOGRADOURO VARCHAR(10),
	CEP VARCHAR(10)
);
CREATE TABLE TELEFONE(
	FIXO VARCHAR(10) PRIMARY KEY,
	CELULAR VARCHAR(10)
);

/*Tabela Associativa*/
CREATE TABLE POSSUI(
	FIXO VARCHAR(10),
	CPF VARCHAR(10),
	FOREIGN KEY(FIXO) REFERENCES TELEFONE(FIXO),
	FOREIGN KEY(CPF) REFERENCES CLIENTE(CPF)
);


