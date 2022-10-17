/*Abrir o workbanch pelo terminal - mysql -u adison -p - digitar a senha*/
/*Abrir o mycli pelo terminal - mycli -u adison -p - "digitar a senha"*/
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
	NOME_DO_AUTOR VARCHAR(30),
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
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+---------------+-------------------+----------------+-------------------+---------------+------------------+---------------------+-----------------+
| UF_DA_EDITORA | ANO_DA_PUBLICACAO | VALOR_DO_LIVRO | NUMERO_DE_PAGINAS | SEXO_DO_AUTOR | NOME_DO_AUTOR    | NOME_DO_LIVRO       | NOME_DA_EDITORA |
+---------------+-------------------+----------------+-------------------+---------------+------------------+---------------------+-----------------+
| RJ            | 2009              |           49.9 | 465               | Feminino      | Ana Claudia      | Cavaleiro Real      | Atlas           |
| SP            | 2018              |             98 | 450               | Masculino     | João Nunes       | SQL para Leigos     | Addison         |
| RJ            | 2008              |             45 | 210               | Feminino      | Celia Tavares    | Receitas Caseiras   | Atlas           |
| RJ            | 2018              |          78.99 | 390               | Masculino     | Eduardo Santos   | Pessoas Efetivas    | Beta            |
| RJ            | 2019              |         150.98 | 630               | Masculino     | Eduardo Santos   | Hábitos Saudáveis   | Beta            |
| MG            | 2016              |             60 | 250               | Masculino     | Hermes Macedo    | A Casa Marrom       | Bubba           |
| ES            | 2015              |            100 | 310               | Masculino     | Geraldo Franciso | Estacio Querido     | Insignia        |
| ES            | 2011              |          78.98 | 510               | Feminino      | Leda Silva       | Pra sempre amiga    | Insignia        |
| RS            | 2018              |         130.98 | 200               | Masculino     | Marco Alcântara  | Copas Inesqueciveis | Larson          |
| RS            | 2017              |          56.58 | 120               | Feminino      | Clara Mafra      | O poder da mente    | Continental     |
+---------------+-------------------+----------------+-------------------+---------------+------------------+---------------------+-----------------+


/*Nome do livro e nome da editora*/
SELECT NOME_DO_LIVRO, NOME_DA_EDITORA FROM LIVROS;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+---------------------+-----------------+
| NOME_DO_LIVRO       | NOME_DA_EDITORA |
+---------------------+-----------------+
| Cavaleiro Real      | Atlas           |
| SQL para Leigos     | Addison         |
| Receitas Caseiras   | Atlas           |
| Pessoas Efetivas    | Beta            |
| Hábitos Saudáveis   | Beta            |
| A Casa Marrom       | Bubba           |
| Estacio Querido     | Insignia        |
| Pra sempre amiga    | Insignia        |
| Copas Inesqueciveis | Larson          |
| O poder da mente    | Continental     |
+---------------------+-----------------+


/*Nome e UF dos livros por autores masculinos*/
SELECT NOME_DO_LIVRO,UF_DA_EDITORA FROM LIVROS
WHERE SEXO_DO_AUTOR = 'Masculino';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+---------------------+---------------+
| NOME_DO_LIVRO       | UF_DA_EDITORA |
+---------------------+---------------+
| SQL para Leigos     | SP            |
| Pessoas Efetivas    | RJ            |
| Hábitos Saudáveis   | RJ            |
| A Casa Marrom       | MG            |
| Estacio Querido     | ES            |
| Copas Inesqueciveis | RS            |
+---------------------+---------------+


/*Nome e paginas dos livros por autores femininos*/
SELECT NOME_DO_LIVRO,NUMERO_DE_PAGINAS FROM LIVROS
WHERE SEXO_DO_AUTOR = 'Feminino';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+-------------------+-------------------+
| NOME_DO_LIVRO     | NUMERO_DE_PAGINAS |
+-------------------+-------------------+
| Cavaleiro Real    | 465               |
| Receitas Caseiras | 210               |
| Pra sempre amiga  | 510               |
| O poder da mente  | 120               |
+-------------------+-------------------+


/*Valores dos livros da editora de SP*/
SELECT VALOR_DO_LIVRO FROM LIVROS
WHERE UF_DA_EDITORA = 'SP';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+----------------+
| VALOR_DO_LIVRO |
+----------------+
|             98 |
+----------------+


/*Autores masculinos com livros publicados em SP ou RJ*/
SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, UF_DA_EDITORA  FROM LIVROS
WHERE (UF_DA_EDITORA = 'SP') OR (UF_DA_EDITORA = 'RJ') AND (SEXO_DO_AUTOR = 'Masculino');
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+----------------+---------------+---------------+
| NOME_DO_AUTOR  | SEXO_DO_AUTOR | UF_DA_EDITORA |
+----------------+---------------+---------------+
| João Nunes     | Masculino     | SP            |
| Eduardo Santos | Masculino     | RJ            |
| Eduardo Santos | Masculino     | RJ            |
+----------------+---------------+---------------+


/*Antes precisa conectar ao banco com a tabela cliente
**Use Projeto;*/
/*Operadores Lógicos*/
/* OR - OU*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F' OR ENDERECO LIKE '%RJ';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+------------------------------------------------+
| NOME   | SEXO | ENDERECO                                       |
+--------+------+------------------------------------------------+
| JOAO   | M    | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ   |
| CELIA  | F    | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       |
| LILIAN | F    | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ  |
| ANA    | F    | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  |
| CARLA  | F    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    |
+--------+------+------------------------------------------------+


SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+--------+------+------------------------------------------------+
| NOME   | SEXO | ENDERECO                                       |
+--------+------+------------------------------------------------+
| CELIA  | F    | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ       |
| LILIAN | F    | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ  |
| ANA    | F    | PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP  |
| CARLA  | F    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG    |
+--------+------+------------------------------------------------+


/* AND - E*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'M' AND ENDERECO LIKE '%RJ';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+------+------+----------------------------------------------+
| NOME | SEXO | ENDERECO                                     |
+------+------+----------------------------------------------+
| JOAO | M    | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ |
+------+------+----------------------------------------------+


SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
Empty set (0,00 sec)


/*Count(*), Group By, Performance com operadores lógicos*/
/*Contando os registros de uma tabela*/
SELECT COUNT(*) AS "Quantindade de registros da tabela" FROM CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+------------------------------------+
| Quantindade de registros da tabela |
+------------------------------------+
|                                  6 |
+------------------------------------+


/*Operador Group By*/
SELECT SEXO, COUNT(*)FROM CLIENTE GROUP BY SEXO;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/
+------+----------+
| SEXO | COUNT(*) |
+------+----------+
| M    |        2 |
| F    |        4 |
+------+----------+


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







