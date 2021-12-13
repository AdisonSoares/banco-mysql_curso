/*Modelagem Física - Scripts de Banco*/
/*Criando o banco de dados:*/
CREATE DATABASE LIVRARIA;

/*Conectando-se ao banco de dados:*/
USE LIVRARIA;

/*Criando a tabela de dados:*/
CREATE TABLE LIVROS(
	UF_DA_EDITORA VARCHAR(2),
	ANO_DA_PUBLICACAO VARCHAR(4),
	VALOR_DO_LIVRO FLOAT(10),
	NUMERO_DE_PAGINAS VARCHAR(10),
	SEXO_DO_AUTOR VARCHAR(10),
	NOME_DO_AUTOR VARCHAR (30),
	NOME_DO_LIVRO VARCHAR(30),
	NOME_DA_EDITORA VARCHAR(30)
);

/*Verificando os bancos de dados salvos*/
SHOW DATABASES;

/*Consultar a tabela*/
SHOW TABLES;

/*Consultar a tabela de dados conectado*/
STATUS

/*Inserindo dados:*/
INSERT INTO LIVROS(NOME_DO_LIVRO, NOME_DO_AUTOR, SEXO_DO_AUTOR, NUMERO_DE_PAGINAS,
NOME_DA_EDITORA, VALOR_DO_LIVRO, UF_DA_EDITORA, ANO_DA_PUBLICACAO)VALUES('Cavaleiro Real',
'Ana Claudia', 'Feminino', '465', 'Atlas', 49.9, 'RJ', '2009');

INSERT INTO LIVROS(NOME_DO_LIVRO, NOME_DO_AUTOR, SEXO_DO_AUTOR, NUMERO_DE_PAGINAS,
NOME_DA_EDITORA, VALOR_DO_LIVRO, UF_DA_EDITORA, ANO_DA_PUBLICACAO)VALUES('SQL para Leigos',
'João Nunes', 'Masculino', '450', 'Addison', 98, 'SP', '2018'),('Receitas Caseiras',
'Celia Tavares', 'Feminino', '210', 'Atlas', 45, 'RJ', '2008');

INSERT INTO LIVROS(NOME_DO_LIVRO, NOME_DO_AUTOR, SEXO_DO_AUTOR, NUMERO_DE_PAGINAS,
NOME_DA_EDITORA, VALOR_DO_LIVRO, UF_DA_EDITORA, ANO_DA_PUBLICACAO)VALUES('Pessoas Efetivas',
'Eduardo Santos', 'Masculino', '390', 'Beta', 78.99, 'RJ', '2018'),('Hábitos Saudáveis',
'Eduardo Santos', 'Masculino', '630', 'Beta', 150.98, 'RJ', '2019'),('A Casa Marrom',
'Hermes Macedo', 'Masculino', '250', 'Bubba', 60, 'MG', '2016'),('Estacio Querido',
'Geraldo Franciso', 'Masculino', '310', 'Insignia', 100, 'ES', '2015'),('Pra sempre amiga',
'Leda Silva', 'Feminino', '510', 'Insignia', 78.98, 'ES', '2011'),('Copas Inesqueciveis',
'Marco Alcântara', 'Masculino', '200', 'Larson', 130.98, 'RS', '2018'),('O poder da mente',
'Clara Mafra', 'Feminino', '120', 'Continental', 56.58, 'RS', '2017');

/*Consultas/Queries:*/
/*Tabela inteira*/
SELECT * FROM LIVROS;

/*Nome do livro e nome da editora*/
SELECT NOME_DO_LIVRO, NOME_DA_EDITORA FROM LIVROS;

/*Nome e UF dos livros por autores masculinos*/
SELECT NOME_DO_LIVRO,UF_DA_EDITORA FROM LIVROS
WHERE SEXO_DO_AUTOR = 'Masculino';

/*Nome e paginas dos livros por autores femininos*/
SELECT NOME_DO_LIVRO,NUMERO_DE_PAGINAS FROM LIVROS
WHERE SEXO_DO_AUTOR = 'Feminino';

/*Valores dos livros da editora de SP*/
SELECT VALOR_DO_LIVRO FROM LIVROS
WHERE UF_DA_EDITORA = 'SP';

/*Autores masculinos com livros publicados em SP ou RJ*/
SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, UF_DA_EDITORA  FROM LIVROS
WHERE (UF_DA_EDITORA = 'SP') OR (UF_DA_EDITORA = 'RJ') AND (SEXO_DO_AUTOR = 'Masculino');


/*Antes precisa conectar ao banco com a tabela cliente
**Use Projeto;*/
/*Operadores Lógicos*/
/* OR - OU*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F' OR ENDERECO LIKE '%RJ';
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';

/* AND - E*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'M' AND ENDERECO LIKE '%RJ';
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';


/*Count(*), Group By, Performance com operadores lógicos*/
/*Contando os registros de uma tabela*/
SELECT COUNT(*) AS "Quantindade de registros da tabela" FROM CLIENTE;

/*Operador Group By*/
SELECT SEXO, COUNT(*)FROM CLIENTE GROUP BY SEXO;


/*Performance em operadores lógicos*/
/*1 milhão de registros
**Para contar: Select count(*) from CLIENTE;

**Select sexo, count(*) from Cliente;

**Select cidade, count(*) from Cliente group by cidade;

**Condição
**Sexo = F
**Cidade = Rio de Janeiro

**Situação tratada com  OU/OR
**70% mulheres = Sexo = F
**30% mora no Rio de Janeiro
**Select nome, sexo, endereco from Cliente where sexo = 'F' OR cidade = 'Rio de Janeiro';

**Situação tratada com  E/AND
**30% mora no Rio de Janeiro
**70% mulheres = Sexo = F
**Select nome, sexo, endereco from Cliente where cidade = 'Rio de Janeiro' AND sexo = 'F';

*/







