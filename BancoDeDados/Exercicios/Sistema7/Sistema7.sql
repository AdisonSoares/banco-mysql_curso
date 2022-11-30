/*Abrir o workbanch pelo terminal - mysql -u adison -p digitar a senha*/
/*Abrir o mycli pelo terminal - mycli -u adison -p digitar a senha*/

/*PARA FAZER AS JUNÇÕES DE TABELAS O MAIS INDICADO É ESCOLHER COMO TABELA
BASE A QUE MAIS TEM CONEXÕES, COMO NO EXEMPLO DO BANCO COMERCIO A TABELA
CLIENTE TEM DUAS CONEXÕES A MELHOR PRA USAR COMO BASE É ELA, E COLOCAR
NAS CONDIÇÃO ON A TABELA DE ORIGEM, NO CASO A TABELA IDCLIENTE*/

/*O banco de dados será o Comercio*/
USE COMERCIO;

/*EXIBIR AS TABELAS*/
SHOW TABLES;
+--------------------+
| Tables_in_COMERCIO |
+--------------------+
| CLIENTE            |
| ENDERECO           |
| TELEFONE           |
+--------------------+
3 rows in set (0,01 sec)

/*DESCRIÇÃO DAS TABELAS*/
mysql> DESC CLIENTE; 
+-----------+---------------+------+-----+---------+----------------+  
| Field     | Type          | Null | Key | Default | Extra          |  
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int           | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(30)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
mysql> DESC ENDERECO; 
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int         | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int         | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
mysql> DESC TELEFONE;
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                     | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(15)             | NO   |     | NULL    |                |
| ID_CLIENTE | int                     | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

/*Projeçao nome, email, numero, estado*/
SELECT C.NOME, C.EMAIL, T.NUMERO, E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE;
+----------+--------------------+-----------+--------+
| NOME     | EMAIL              | NUMERO    | ESTADO |
+----------+--------------------+-----------+--------+
| GILSON   | GILSON@GMAIL.COM   | 45853033  | RJ     |
| GILSON   | GILSON@GMAIL.COM   | 35853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM | 921678801 | RJ     |
| MARIA    | MARIA@GMAIL.COM    | 25853033  | RJ     |
| MARIA    | MARIA@GMAIL.COM    | 85853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM | 971406822 | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM | 34853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM | 40853033  | RJ     |
| MARIA    | MARIA@GMAIL.COM    | 41853033  | RJ     |
| GILSON   | GILSON@GMAIL.COM   | 990891200 | RJ     |
| GILSON   | GILSON@GMAIL.COM   | 51853033  | RJ     |
| FLAVIO   | FLAVIO@IG.COM      | 68976565  | MG     |
| FLAVIO   | FLAVIO@IG.COM      | 99656675  | MG     |
| GIOVANA  | NULL               | 33567765  | RJ     |
| GIOVANA  | NULL               | 88668786  | RJ     |
| GIOVANA  | NULL               | 55689654  | RJ     |
| KARLA    | KARLA@GMAIL.COM    | 88687979  | RJ     |
| DANIELE  | DANIELE@GMAIL.COM  | 88965676  | ES     |
| EDUARDO  | NULL               | 89966809  | PR     |
| ANTONIA  | ANTONIO@IG.COM     | 88679978  | SP     |
| ANTONIO  | ANTONIO@UOL.COM    | 99655768  | PR     |
| ELAINE   | ELAINE@GLOBO.COM   | 89955665  | SP     |
| CARMEM   | CARMEM@IG.COM      | 77455786  | RJ     |
| CARMEM   | CARMEM@IG.COM      | 89766554  | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM  | 77755785  | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM  | 44522578  | RJ     |
| JOICE    | JOICE@GMAIL.COM    | 44522578  | RJ     |
| JOEL     | JOEL@GMAIL.COM     | 51853145  | RJ     |
+----------+--------------------+-----------+--------+
28 rows in set (0,01 sec)

/*NO RELATÓRIO É EXIBIDO NULL NO EMAIL, PARA NÃO MOSTRAR
ISSO É PRECISO USAR UMA FUNÇÃO "IF NULL".*/
SELECT C.NOME,
       IFNULL(C.EMAIL,'SEM EMAIL'), 
       T.NUMERO, 
       E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE;
+----------+---------------------------------+-----------+--------+
| NOME     | IFNULL(C.EMAIL,'VAI SE LASCAR') | NUMERO    | ESTADO |
+----------+---------------------------------+-----------+--------+
| GILSON   | GILSON@GMAIL.COM                | 45853033  | RJ     |
| GILSON   | GILSON@GMAIL.COM                | 35853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM              | 921678801 | RJ     |
| MARIA    | MARIA@GMAIL.COM                 | 25853033  | RJ     |
| MARIA    | MARIA@GMAIL.COM                 | 85853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM              | 971406822 | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM              | 34853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM              | 40853033  | RJ     |
| MARIA    | MARIA@GMAIL.COM                 | 41853033  | RJ     |
| GILSON   | GILSON@GMAIL.COM                | 990891200 | RJ     |
| GILSON   | GILSON@GMAIL.COM                | 51853033  | RJ     |
| FLAVIO   | FLAVIO@IG.COM                   | 68976565  | MG     |
| FLAVIO   | FLAVIO@IG.COM                   | 99656675  | MG     |
| GIOVANA  | VAI SE LASCAR                   | 33567765  | RJ     |
| GIOVANA  | VAI SE LASCAR                   | 88668786  | RJ     |
| GIOVANA  | VAI SE LASCAR                   | 55689654  | RJ     |
| KARLA    | KARLA@GMAIL.COM                 | 88687979  | RJ     |
| DANIELE  | DANIELE@GMAIL.COM               | 88965676  | ES     |
| EDUARDO  | VAI SE LASCAR                   | 89966809  | PR     |
| ANTONIA  | ANTONIO@IG.COM                  | 88679978  | SP     |
| ANTONIO  | ANTONIO@UOL.COM                 | 99655768  | PR     |
| ELAINE   | ELAINE@GLOBO.COM                | 89955665  | SP     |
| CARMEM   | CARMEM@IG.COM                   | 77455786  | RJ     |
| CARMEM   | CARMEM@IG.COM                   | 89766554  | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM               | 77755785  | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM               | 44522578  | RJ     |	
| JOICE    | JOICE@GMAIL.COM                 | 44522578  | RJ     |
| JOEL     | JOEL@GMAIL.COM                  | 51853145  | RJ     |
+----------+---------------------------------+-----------+--------+
28 rows in set (0,00 sec)

/*USANDO ALIAS PARA RESOLVER A PROJEÇÃO DO IFNULL.*/
SELECT C.NOME,
       IFNULL(C.EMAIL,'SEM EMAIL') AS "E-MAIL", 
       T.NUMERO, 
       E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE;

+----------+--------------------+-----------+--------+
| NOME     | E-MAIL              | NUMERO    | ESTADO|
+----------+--------------------+-----------+--------+
| GILSON   | GILSON@GMAIL.COM   | 45853033  | RJ     |
| GILSON   | GILSON@GMAIL.COM   | 35853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM | 921678801 | RJ     |
| MARIA    | MARIA@GMAIL.COM    | 25853033  | RJ     |
| MARIA    | MARIA@GMAIL.COM    | 85853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM | 971406822 | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM | 34853033  | RJ     |
| FERNANDO | FERNANDO@GMAIL.COM | 40853033  | RJ     |
| MARIA    | MARIA@GMAIL.COM    | 41853033  | RJ     |
| GILSON   | GILSON@GMAIL.COM   | 990891200 | RJ     |
| GILSON   | GILSON@GMAIL.COM   | 51853033  | RJ     |
| FLAVIO   | FLAVIO@IG.COM      | 68976565  | MG     |
| FLAVIO   | FLAVIO@IG.COM      | 99656675  | MG     |
| GIOVANA  | SEM EMAIL          | 33567765  | RJ     |
| GIOVANA  | SEM EMAIL          | 88668786  | RJ     |
| GIOVANA  | SEM EMAIL          | 55689654  | RJ     |
| KARLA    | KARLA@GMAIL.COM    | 88687979  | RJ     |
| DANIELE  | DANIELE@GMAIL.COM  | 88965676  | ES     |
| EDUARDO  | SEM EMAIL          | 89966809  | PR     |
| ANTONIA  | ANTONIO@IG.COM     | 88679978  | SP     |
| ANTONIO  | ANTONIO@UOL.COM    | 99655768  | PR     |
| ELAINE   | ELAINE@GLOBO.COM   | 89955665  | SP     |
| CARMEM   | CARMEM@IG.COM      | 77455786  | RJ     |
| CARMEM   | CARMEM@IG.COM      | 89766554  | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM  | 77755785  | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM  | 44522578  | RJ     |
| JOICE    | JOICE@GMAIL.COM    | 44522578  | RJ     |
| JOEL     | JOEL@GMAIL.COM     | 51853145  | RJ     |
+----------+--------------------+-----------+--------+
28 rows in set (0,00 sec)

/*QUERY COMPLETA*/
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
	ON C.IDCLIENTE = E.ID_CLIENTE;

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

/*EXISTE UMA FORMA DE LIDAR COM A ROTINA DE USO DE CÓDIGOS
POR MEIO DE UMA VIEW, ELA SERVE COMO UM PONTEIRO QUE APONTA 
PARA A QUERY*/

CREATE VIEW RELATORIO AS 
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
	ON C.IDCLIENTE = E.ID_CLIENTE;

Query OK, 0 rows affected (0,01 sec)

/*USANDO A VIEW PARA CHAMAR O SELECT*/
SELECT * FROM RELATORIO;

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


/*NÃO EXISTE UMA VISUALIZAÇÃO DE VIEWS COMO SHOW TABLES OU SHOW DATABASES,
AS VIEWS NÃO DUPLICAM OS DADOS NO BANCO, SÃO BASICAMENTE UMA TALBELA VIRTUAL.
MAS AS VIEWS SÃO EXIBIDAS COM O COMANDO SHOW TABLES.*/
SHOW TABLES;
+--------------------+
| Tables_in_COMERCIO |
+--------------------+
| CLIENTE            |
| ENDERECO           |
| PRODUTO            |
| RELATORIO <-       |
| TELEFONE           |
+--------------------+
5 rows in set (0,00 sec)

/*APAGANDO UMA VIEW, ELA É APAGADA DA MESMA DORMA QUE SE APAGA
UMA TABELA.*/
DROP VIEW RELATORIO;
Query OK, 0 rows affected (0,02 sec)

SHOW TABLES;
+--------------------+
| Tables_in_COMERCIO |
+--------------------+
| CLIENTE            |
| ENDERECO           |
| PRODUTO            |
| TELEFONE           |
+--------------------+
4 rows in set (0,04 sec)


/*CRIANDO UMA VIEW INSERINDO UM SUFIXO*/
CREATE VIEW V_RELATORIO AS 
SELECT C.IDCLIENTE, 
	   C.NOME,
	   C.SEXO, 
	   IFNULL(C.EMAIL,'*********')AS "E-MAIL", 
	   T.TIPO, 
	   T.NUMERO, 
	   E.BAIRRO, 
	   E.CIDADE, 
	   E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE;
Query OK, 0 rows affected (0,01 sec)	

SHOW TABLES;
+--------------------+
| Tables_in_COMERCIO |
+--------------------+
| CLIENTE            |
| ENDERECO           |
| PRODUTO            |
| TELEFONE           |
| V_RELATORIO <-     |
+--------------------+
5 rows in set (0,00 sec)

/*O USO DE VIEWS AJUDA NA OTIMIZAÇÃO DE OUTRAS QUERYS EM CIMA
DA QUERY APONTADA.*/
SELECT NOME, NUMERO, ESTADO
FROM V_RELATORIO;
+----------+-----------+--------+
| NOME     | NUMERO    | ESTADO |
+----------+-----------+--------+
| GILSON   | 45853033  | RJ     |
| GILSON   | 35853033  | RJ     |
| GILSON   | 990891200 | RJ     |
| GILSON   | 51853033  | RJ     |
| FERNANDO | 921678801 | RJ     |
| FERNANDO | 971406822 | RJ     |
| FERNANDO | 34853033  | RJ     |
| MARIA    | 25853033  | RJ     |
| MARIA    | 85853033  | RJ     |
| MARIA    | 41853033  | RJ     |
| JOEL     | 51853145  | RJ     |
| GABRIELA | 40853033  | RJ     |
| FLAVIO   | 68976565  | MG     |
| FLAVIO   | 99656675  | MG     |
| GIOVANA  | 33567765  | RJ     |
| GIOVANA  | 88668786  | RJ     |
| GIOVANA  | 55689654  | RJ     |
| KARLA    | 88687979  | RJ     |
| DANIELE  | 88965676  | ES     |
| EDUARDO  | 89966809  | PR     |
| ANTONIO  | 88679978  | SP     |
| ANTONIO  | 99655768  | PR     |
| ELAINE   | 89955665  | SP     |
| CARMEM   | 77455786  | RJ     |
| CARMEM   | 89766554  | RJ     |
| ADRIANA  | 77755785  | RJ     |
| ADRIANA  | 44522578  | RJ     |
| JOICE    | 44522578  | RJ     |
+----------+-----------+--------+
28 rows in set (0,00 sec)


/*OPERÃÇÕES DE SQL COM VIEWS*/
/*UPDATE, INSERT E DELETE - DML*/
INSERT INTO V_RELATORIO VALUES(
 	'ANDREIA','F', 'ANDREIA@GMAIL.COM', 'CEL','873547864', 'CENTRO', 'VITORIA', 'ES');
ERROR 1394 (HY000): Can not insert into join view 'COMERCIO.V_RELATORIO' without fields list
/*NÃO É POSSÍVEL INSERIR OU DELETAR TENDO UM JOIN NA VIEW, MAS É POSSÍVEL FAZER UPDATE.*/
/*QUANDO A VIEW NÃO TEM JOIN É POSSÍVEL FAZER UM INSERT E UM UPDATE.*/

/*É POSSÍVEL FAZER QUALQUER SELECT EM UMA VIEW*/
SELECT * FROM V_RELATORIO
WHERE SEXO = 'F';
+-----------+----------+------+--------------------+------+----------+------------+----------------+--------+
| IDCLIENTE | NOME     | SEXO | E-MAIL             | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+-----------+----------+------+--------------------+------+----------+------------+----------------+--------+
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 25853033 | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 85853033 | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | RES  | 41853033 | CENTRO     | RIO DE JANEIRO | RJ     |
|         6 | GABRIELA | F    | GABRILEA@GMAIL.COM | RES  | 40853033 | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA  | F    | *********          | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA  | F    | *********          | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | GIOVANA  | F    | *********          | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
|        12 | KARLA    | F    | KARLA@GMAIL.COM    | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
|        13 | DANIELE  | F    | DANIELE@GMAIL.COM  | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
|        18 | ELAINE   | F    | ELAINE@GLOBO.COM   | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
|        21 | JOICE    | F    | JOICE@GMAIL.COM    | CEL  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
+-----------+----------+------+--------------------+------+----------+------------+----------------+--------+
15 rows in set (0,00 sec)


