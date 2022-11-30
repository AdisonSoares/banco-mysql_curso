/*Abrir o workbanch pelo terminal - mysql -u adison -p digitar a senha*/
/*Abrir o mycli pelo terminal - mycli -u adison -p digitar a senha*/

/*PARA FAZER AS JUNÇÕES DE TABELAS O MAIS INDICADO É ESCOLHER COMO TABELA
BASE A QUE MAIS TEM CONEXÕES, COMO NO EXEMPLO DO BANCO COMERCIO A TABELA
CLIENTE TEM DUAS CONEXÕES A MELHOR PRA USAR COMO BASE É ELA, E COLOCAR
NAS CONDIÇÃO ON A TABELA DE ORIGEM, NO CASO A TABELA IDCLIENTE*/

/*O banco de dados será o Comercio*/
USE COMERCIO;

/*COMANDO ORDER BY - ORDENA POR*/
/*A ÚNICA FORMA DE ORDENAR UMA TABELA É UTILIZANDO
O COMANDO ORDER BY. SEM ELE, O RESULTADO É ALEATÓRIO.*/
CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1, 'JOAO');
INSERT INTO ALUNOS VALUES(1, 'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2, 'ANDRE');
INSERT INTO ALUNOS VALUES(3, 'CLARA');
INSERT INTO ALUNOS VALUES(1, 'CLARA');
INSERT INTO ALUNOS VALUES(4, 'MAFRA');
INSERT INTO ALUNOS VALUES(5, 'JANAINA');
INSERT INTO ALUNOS VALUES(1, 'JANAINA');
INSERT INTO ALUNOS VALUES(3, 'MARCELO');
INSERT INTO ALUNOS VALUES(4, 'GIOVANA');
INSERT INTO ALUNOS VALUES(5, 'ANTONIO');
INSERT INTO ALUNOS VALUES(6, 'ANA');
INSERT INTO ALUNOS VALUES(6, 'VIVIANE');

SELECT * FROM ALUNOS;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | MAFRA   |
|      5 | JANAINA |
|      1 | JANAINA |
|      3 | MARCELO |
|      4 | GIOVANA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+
14 rows in set (0,00 sec)


/*USANDO O ORDER BY*/
SELECT * FROM ALUNOS
ORDER BY NUMERO;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANA |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+
14 rows in set (0,01 sec)

SELECT * FROM ALUNOS
ORDER BY 1; --> PRIMEIRA COLUNA
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANA |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+
14 rows in set (0,00 sec)

SELECT * FROM ALUNOS
ORDER BY 2; --> SEGUNDA COLUNA
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANA     |
|      2 | ANDRE   |
|      5 | ANTONIO |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | GIOVANA |
|      5 | JANAINA |
|      1 | JANAINA |
|      1 | JOAO    |
|      4 | MAFRA   |
|      3 | MARCELO |
|      1 | MARIA   |
|      6 | VIVIANE |
|      2 | ZOE     |
+--------+---------+
14 rows in set (0,00 sec)


/*ORDENANDO POR MAIS DE UMA COLUNA*/
SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GIOVANA |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+
14 rows in set (0,00 sec)

SELECT * FROM ALUNOS
ORDER BY 1, 2;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOAO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GIOVANA |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+
14 rows in set (0,00 sec)

/*MESCLANDO ORDER BY COM PROJEÇÃO*/
SELECT NOME FROM ALUNOS
ORDER BY 1, 2;
ERROR 1054 (42S22): Unknown column '2' in 'order clause'
/*NÃO É POSSÍVEL PROJETAR POIS É VERIFICADO DE CIMA PARA BAIXO
POIS PRECISA BATER O ÍNDICE COM A PROJEÇÃO*/

SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;
+---------+
| NOME    |
+---------+
| CLARA   |
| JANAINA |
| JOAO    |
| MARIA   |
| ANDRE   |
| ZOE     |
| CLARA   |
| MARCELO |
| GIOVANA |
| MAFRA   |
| ANTONIO |
| JANAINA |
| ANA     |
| VIVIANE |
+---------+
14 rows in set (0,00 sec)

/*ORDER BY DESC(DESCENDENTE) / ASC(ASCENDENTE, CRESCENTE)*/
SELECT * FROM ALUNOS
ORDER BY 1 ASC; /*ASC É PADRÃO CASO TIRE VAI NA ORDEM ASCENDENTE*/
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANA |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+
14 rows in set (0,00 sec)

SELECT * FROM ALUNOS
ORDER BY 1 DESC;
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANA     |
|      6 | VIVIANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      4 | MAFRA   |
|      4 | GIOVANA |
|      3 | CLARA   |
|      3 | MARCELO |
|      2 | ZOE     |
|      2 | ANDRE   |
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
+--------+---------+
14 rows in set (0,00 sec)

SELECT * FROM ALUNOS
ORDER BY 1, 2 DESC;
/*PRIMEIRA COLUNA FOI PADRÃO A SEGUNDA FEZ O DESC*/
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | MARIA   |
|      1 | JOAO    |
|      1 | JANAINA |
|      1 | CLARA   |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | MARCELO |
|      3 | CLARA   |
|      4 | MAFRA   |
|      4 | GIOVANA |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | VIVIANE |
|      6 | ANA     |
+--------+---------+
14 rows in set (0,00 sec)

SELECT * FROM ALUNOS
ORDER BY 1 DESC, 2 DESC;
/*AMBAS AS COLUNAS COMO DESC*/
+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | VIVIANE |
|      6 | ANA     |
|      5 | JANAINA |
|      5 | ANTONIO |
|      4 | MAFRA   |
|      4 | GIOVANA |
|      3 | MARCELO |
|      3 | CLARA   |
|      2 | ZOE     |
|      2 | ANDRE   |
|      1 | MARIA   |
|      1 | JOAO    |
|      1 | JANAINA |
|      1 | CLARA   |
+--------+---------+
14 rows in set (0,00 sec)

/*APLICAR ORDER BY COM JOIN - NO EXEMPLO PELO ÍNDICE 1, C.IDCLIENTE*/
SELECT C.IDCLIENTE, 
	   C.NOME,
	   C.SEXO, 
	   C.EMAIL, 
	   T.TIPO, 
	   T.NUMERO, 
	   E.BAIRRO, 
	   E.CIDADE, 
	   E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;
+-----------+----------+------+--------------------+------+-----------+------------+----------------+--------+
| IDCLIENTE | NOME     | SEXO | EMAIL              | TIPO | NUMERO    | BAIRRO     | CIDADE         | ESTADO |
+-----------+----------+------+--------------------+------+-----------+------------+----------------+--------+
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | RES  | 45853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | COM  | 35853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | CEL  | 990891200 | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | RES  | 51853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | FERNANDO | M    | FERNANDO@GMAIL.COM | CEL  | 921678801 | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | FERNANDO | M    | FERNANDO@GMAIL.COM | CEL  | 971406822 | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | FERNANDO | M    | FERNANDO@GMAIL.COM | COM  | 34853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 25853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 85853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 41853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         5 | JOEL     | M    | JOEL@GMAIL.COM     | CEL  | 51853145  | CENTRO     | RIO DE JANEIRO | RJ     |
|         6 | GABRIELA | F    | GABRILEA@GMAIL.COM | RES  | 40853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         9 | FLAVIO   | M    | FLAVIO@IG.COM      | RES  | 68976565  | CASCADURA  | B. HORIZONTE   | MG     |
|         9 | FLAVIO   | M    | FLAVIO@IG.COM      | CEL  | 99656675  | CASCADURA  | B. HORIZONTE   | MG     |
|        11 | GIOVANA  | F    | NULL               | CEL  | 33567765  | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA  | F    | NULL               | CEL  | 88668786  | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA  | F    | NULL               | COM  | 55689654  | CENTRO     | RIO DE JANEIRO | RJ     |
|        12 | KARLA    | F    | KARLA@GMAIL.COM    | COM  | 88687979  | COPACABANA | RIO DE JANEIRO | RJ     |
|        13 | DANIELE  | F    | DANIELE@GMAIL.COM  | COM  | 88965676  | CENTRO     | VITORIA        | ES     |
|        15 | EDUARDO  | M    | NULL               | CEL  | 89966809  | CENTRO     | CURITIBA       | PR     |
|        16 | ANTONIO  | M    | ANTONIO@IG.COM     | COM  | 88679978  | JARDINS    | SAO PAULO      | SP     |
|        17 | ANTONIO  | M    | ANTONIO@UOL.COM    | CEL  | 99655768  | BOM RETIRO | CURITIBA       | PR     |
|        18 | ELAINE   | F    | ELAINE@GLOBO.COM   | RES  | 89955665  | LAPA       | SAO PAULO      | SP     |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | RES  | 77455786  | CENTRO     | RIO DE JANEIRO | RJ     |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | RES  | 89766554  | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | RES  | 77755785  | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | COM  | 44522578  | CENTRO     | RIO DE JANEIRO | RJ     |
|        21 | JOICE    | F    | JOICE@GMAIL.COM    | CEL  | 44522578  | CENTRO     | RIO DE JANEIRO | RJ     |
+-----------+----------+------+--------------------+------+-----------+------------+----------------+--------+
28 rows in set (0,00 sec)

/*ORDENANDO A VIEW*/
SELECT * FROM V_RELATORIO
ORDER BY 1;
+-----------+----------+------+--------------------+------+-----------+------------+----------------+--------+
| IDCLIENTE | NOME     | SEXO | E-MAIL             | TIPO | NUMERO    | BAIRRO     | CIDADE         | ESTADO |
+-----------+----------+------+--------------------+------+-----------+------------+----------------+--------+
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | RES  | 45853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | COM  | 35853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | CEL  | 990891200 | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | RES  | 51853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | FERNANDO | M    | FERNANDO@GMAIL.COM | CEL  | 921678801 | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | FERNANDO | M    | FERNANDO@GMAIL.COM | CEL  | 971406822 | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | FERNANDO | M    | FERNANDO@GMAIL.COM | COM  | 34853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 25853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 85853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 41853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         5 | JOEL     | M    | JOEL@GMAIL.COM     | CEL  | 51853145  | CENTRO     | RIO DE JANEIRO | RJ     |
|         6 | GABRIELA | F    | GABRILEA@GMAIL.COM | RES  | 40853033  | CENTRO     | RIO DE JANEIRO | RJ     |
|         9 | FLAVIO   | M    | FLAVIO@IG.COM      | RES  | 68976565  | CASCADURA  | B. HORIZONTE   | MG     |
|         9 | FLAVIO   | M    | FLAVIO@IG.COM      | CEL  | 99656675  | CASCADURA  | B. HORIZONTE   | MG     |
|        11 | GIOVANA  | F    | *********          | CEL  | 33567765  | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA  | F    | *********          | CEL  | 88668786  | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA  | F    | *********          | COM  | 55689654  | CENTRO     | RIO DE JANEIRO | RJ     |
|        12 | KARLA    | F    | KARLA@GMAIL.COM    | COM  | 88687979  | COPACABANA | RIO DE JANEIRO | RJ     |
|        13 | DANIELE  | F    | DANIELE@GMAIL.COM  | COM  | 88965676  | CENTRO     | VITORIA        | ES     |
|        15 | EDUARDO  | M    | *********          | CEL  | 89966809  | CENTRO     | CURITIBA       | PR     |
|        16 | ANTONIO  | M    | ANTONIO@IG.COM     | COM  | 88679978  | JARDINS    | SAO PAULO      | SP     |
|        17 | ANTONIO  | M    | ANTONIO@UOL.COM    | CEL  | 99655768  | BOM RETIRO | CURITIBA       | PR     |
|        18 | ELAINE   | F    | ELAINE@GLOBO.COM   | RES  | 89955665  | LAPA       | SAO PAULO      | SP     |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | RES  | 77455786  | CENTRO     | RIO DE JANEIRO | RJ     |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | RES  | 89766554  | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | RES  | 77755785  | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | COM  | 44522578  | CENTRO     | RIO DE JANEIRO | RJ     |
|        21 | JOICE    | F    | JOICE@GMAIL.COM    | CEL  | 44522578  | CENTRO     | RIO DE JANEIRO | RJ     |
+-----------+----------+------+--------------------+------+-----------+------------+----------------+--------+
28 rows in set (0,00 sec)
