
/*Abrir o workbanch pelo terminal - mysql -u adison -p digitar a senha*/
/*Abrir o mycli pelo terminal - mycli -u adison -p digitar a senha*/
/*Exercicio de DML*/

/*PARA FAZER AS JUNÇÕES DE TABELAS O MAIS INDICADO É ESCOLHER COMO TABELA
BASE A QUE MAIS TEM CONEXÕES, COMO NO EXEMPLO DO BANCO COMERCIO A TABELA
CLIENTE TEM DUAS CONEXÕES A MELHOR PRA USAR COMO BASE É ELA, E COLOCAR
NAS CONDIÇÃO ON A TABELA DE ORIGEM, NO CASO A TABELA IDCLIENTE*/

/*O banco de dados será o Comercio*/
USE COMERCIO;

/*Conferir as tabelas do banco*/
SHOW TABLES;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+--------------------+
| Tables_in_COMERCIO |
+--------------------+
| CLIENTE            |
| ENDERECO           |
| PRODUTO            |
| TELEFONE           |
+--------------------+

/*Verificar os clientes da tabela*/
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
|         7 | PAULA    | F    | NULL               | 45853033    |
+-----------+----------+------+--------------------+-------------+

/* EXERCICIOS DML */

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/*Verificar os clientes da tabela*/
SELECT * FROM CLIENTE;
+-----------+----------+------+--------------------+-------------+
| IDCLIENTE | NOME     | SEXO | EMAIL              | CPF         |
+-----------+----------+------+--------------------+-------------+
|         1 | GILSON   | M    | GILSON@GMAIL.COM   | 54685299720 |
|         2 | FERNANDO | M    | FERNANDO@GMAIL.COM | 12385299720 |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | 45685299720 |
|         4 | CAROL    | F    | NULL               | 78985299720 |
|         5 | JOEL     | M    | JOEL@GMAIL.COM     | 14785299720 |
|         6 | GABRIELA | F    | GABRILEA@GMAIL.COM | 25885299720 |
|         7 | PAULA    | F    | NULL               | 45853033    |
|         9 | FLAVIO   | M    | FLAVIO@IG.COM      | 4657765     |
|        10 | ANDRE    | M    | ANDRE@GLOBO.COM    | 7687567     |
|        11 | GIOVANA  | F    | NULL               | 0876655     |
|        12 | KARLA    | M    | KARLA@GMAIL.COM    | 545676778   |
|        13 | DANIELE  | M    | DANIELE@GMAIL.COM  | 43536789    |
|        14 | LORENA   | M    | NULL               | 774557887   |
|        15 | EDUARDO  | M    | NULL               | 54376457    |
|        16 | ANTONIO  | F    | ANTONIO@IG.COM     | 12436767    |
|        17 | ANTONIO  | M    | ANTONIO@UOL.COM    | 3423565     |
|        18 | ELAINE   | M    | ELAINE@GLOBO.COM   | 32567763    |
|        19 | CARMEM   | M    | CARMEM@IG.COM      | 787832213   |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | 88556942    |
|        21 | JOICE    | F    | JOICE@GMAIL.COM    | 55412256    |
+-----------+----------+------+--------------------+-------------+
20 rows in set (0,00 sec)

/*Verificar os endereços da Endereco*/
SELECT * FROM ENDERECO;
+------------+------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA              | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+------------------+----------+----------------+--------+------------+
|          1 | Praça Barão      | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          2 | Avenida Braga    | CENTRO   | RIO DE JANEIRO | RJ     |          2 |
|          3 | Praça Floriano   | CENTRO   | RIO DE JANEIRO | RJ     |          3 |
|          4 | Avenida Agache   | CENTRO   | RIO DE JANEIRO | RJ     |          4 |
|          5 | Avenida Barroso  | CENTRO   | RIO DE JANEIRO | RJ     |          5 |
|          6 | Avenida Sílvio   | CENTRO   | RIO DE JANEIRO | RJ     |          6 |
|          7 | RUA JOAQUIM      | ALVORADA | NITEROI        | RJ     |          7 |
+------------+------------------+----------+----------------+--------+------------+
7 rows in set (0,00 sec)


/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/*Verificar os endereços da Endereco*/
SELECT * FROM ENDERECO;
+------------+--------------------+------------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO     | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+------------+----------------+--------+------------+
|          1 | Praça Barão        | CENTRO     | RIO DE JANEIRO | RJ     |          1 |
|          2 | Avenida Braga      | CENTRO     | RIO DE JANEIRO | RJ     |          2 |
|          3 | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RJ     |          3 |
|          4 | Avenida Agache     | CENTRO     | RIO DE JANEIRO | RJ     |          4 |
|          5 | Avenida Barroso    | CENTRO     | RIO DE JANEIRO | RJ     |          5 |
|          6 | Avenida Sílvio     | CENTRO     | RIO DE JANEIRO | RJ     |          6 |
|          7 | RUA JOAQUIM        | ALVORADA   | NITEROI        | RJ     |          7 |
|          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |          9 |
|          9 | RUA MAIA LACERDA   | ESTACIO    | RIO DE JANEIRO | RJ     |         10 |
|         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |
|         11 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |         12 |
|         12 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |         13 |
|         13 | RUA CASTRO ALVES   | LEBLON     | RIO DE JANEIRO | RJ     |         14 |
|         14 | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     |         15 |
|         15 | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     |         16 |
|         16 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |         17 |
|         17 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |         18 |
|         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |         19 |
|         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |         20 |
|         20 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |         21 |
+------------+--------------------+------------+----------------+--------+------------+
20 rows in set (0,00 sec)

/*Verificar os contatos da TELEFONE*/
SELECT * FROM TELEFONE;
+------------+------+-----------+------------+
| IDTELEFONE | TIPO | NUMERO    | ID_CLIENTE |
+------------+------+-----------+------------+
|          1 | RES  | 45853033  |          1 |
|          2 | COM  | 35853033  |          1 |
|          3 | CEL  | 921678801 |          2 |
|          4 | RES  | 25853033  |          3 |
|          5 | RES  | 85853033  |          3 |
|          6 | CEL  | 971406822 |          2 |
|          7 | COM  | 34853033  |          2 |
|          8 | RES  | 40853033  |          6 |
|          9 | RES  | 41853033  |          3 |
|         10 | CEL  | 990891200 |          1 |
|         11 | RES  | 51853033  |          1 |
|         12 | CEL  | 51853145  |          5 |
+------------+------+-----------+------------+
12 rows in set (0,01 sec)

/* CADASTRE TELEFONES PARA OS CLIENTES */


INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);
INSERT INTO TELEFONE VALUES(NULL,'CEL','44522578',21);

/*Verificar os contatos da TELEFONE*/
SELECT * FROM TELEFONE;
+------------+------+-----------+------------+
| IDTELEFONE | TIPO | NUMERO    | ID_CLIENTE |
+------------+------+-----------+------------+
|          1 | RES  | 45853033  |          1 |
|          2 | COM  | 35853033  |          1 |
|          3 | CEL  | 921678801 |          2 |
|          4 | RES  | 25853033  |          3 |
|          5 | RES  | 85853033  |          3 |
|          6 | CEL  | 971406822 |          2 |
|          7 | COM  | 34853033  |          2 |
|          8 | RES  | 40853033  |          6 |
|          9 | RES  | 41853033  |          3 |
|         10 | CEL  | 990891200 |          1 |
|         11 | RES  | 51853033  |          1 |
|         12 | CEL  | 51853145  |          5 |
|         13 | RES  | 68976565  |          9 |
|         14 | CEL  | 99656675  |          9 |
|         15 | CEL  | 33567765  |         11 |
|         16 | CEL  | 88668786  |         11 |
|         17 | COM  | 55689654  |         11 |
|         18 | COM  | 88687979  |         12 |
|         19 | COM  | 88965676  |         13 |
|         20 | CEL  | 89966809  |         15 |
|         21 | COM  | 88679978  |         16 |
|         22 | CEL  | 99655768  |         17 |
|         23 | RES  | 89955665  |         18 |
|         24 | RES  | 77455786  |         19 |
|         25 | RES  | 89766554  |         19 |
|         26 | RES  | 77755785  |         20 |
|         27 | COM  | 44522578  |         20 |
|         28 | CEL  | 44522578  |         21 |
+------------+------+-----------+------------+
28 rows in set (0,00 sec)

/*DESCRIÇÃO DA TABELA ENDEREÇO E CLIENTE*/
DESC CLIENTE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int           | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(30)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

DESC ENDERECO;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
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

DESC TELEFONE;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                     | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(15)             | NO   |     | NULL    |                |
| ID_CLIENTE | int                     | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

/*RELATÓRIO GERAL DE TODOS OS CLIENTES(ENDEREÇO E TELEFONE)*/
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.CPF, C.EMAIL, 
	E.RUA, E.BAIRRO, E.CIDADE,
	T.TIPO, T.NUMERO
FROM CLIENTE C	
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE 
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;   
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
| IDCLIENTE | NOME     | SEXO | CPF         | EMAIL              | RUA                | BAIRRO     | CIDADE         | TIPO | NUMERO    |
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | RES  | 45853033  |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | COM  | 35853033  |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | CEL  | 990891200 |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | RES  | 51853033  |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | CEL  | 921678801 |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | CEL  | 971406822 |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | COM  | 34853033  |
|         3 | MARIA    | F    | 45685299720 | MARIA@GMAIL.COM    | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 25853033  |
|         3 | MARIA    | F    | 45685299720 | MARIA@GMAIL.COM    | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 85853033  |
|         3 | MARIA    | F    | 45685299720 | MARIA@GMAIL.COM    | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 41853033  |
|         5 | JOEL     | M    | 14785299720 | JOEL@GMAIL.COM     | Avenida Barroso    | CENTRO     | RIO DE JANEIRO | CEL  | 51853145  |
|         6 | GABRIELA | F    | 25885299720 | GABRILEA@GMAIL.COM | Avenida Sílvio     | CENTRO     | RIO DE JANEIRO | RES  | 40853033  |
|         9 | FLAVIO   | M    | 4657765     | FLAVIO@IG.COM      | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | RES  | 68976565  |
|         9 | FLAVIO   | M    | 4657765     | FLAVIO@IG.COM      | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | CEL  | 99656675  |
|        11 | GIOVANA  | F    | 0876655     | NULL               | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | CEL  | 33567765  |
|        11 | GIOVANA  | F    | 0876655     | NULL               | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | CEL  | 88668786  |
|        11 | GIOVANA  | F    | 0876655     | NULL               | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | COM  | 55689654  |
|        12 | KARLA    | M    | 545676778   | KARLA@GMAIL.COM    | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | COM  | 88687979  |
|        13 | DANIELE  | M    | 43536789    | DANIELE@GMAIL.COM  | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | COM  | 88965676  |
|        15 | EDUARDO  | M    | 54376457    | NULL               | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | CEL  | 89966809  |
|        16 | ANTONIO  | F    | 12436767    | ANTONIO@IG.COM     | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | COM  | 88679978  |
|        17 | ANTONIO  | M    | 3423565     | ANTONIO@UOL.COM    | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | CEL  | 99655768  |
|        18 | ELAINE   | M    | 32567763    | ELAINE@GLOBO.COM   | RUA DA LAPA        | LAPA       | SAO PAULO      | RES  | 89955665  |
|        19 | CARMEM   | M    | 787832213   | CARMEM@IG.COM      | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RES  | 77455786  |
|        19 | CARMEM   | M    | 787832213   | CARMEM@IG.COM      | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RES  | 89766554  |
|        20 | ADRIANA  | F    | 88556942    | ADRIANA@GMAIL.COM  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RES  | 77755785  |
|        20 | ADRIANA  | F    | 88556942    | ADRIANA@GMAIL.COM  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | COM  | 44522578  |
|        21 | JOICE    | F    | 55412256    | JOICE@GMAIL.COM    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | CEL  | 44522578  |
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
28 rows in set (0,00 sec)

/*RELATÓRIO DE HOMENS*/
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.CPF, C.EMAIL,
	E.RUA, E.BAIRRO, E.CIDADE,
	T.TIPO, T.NUMERO
FROM CLIENTE C	
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE	
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE	
WHERE SEXO = 'M';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
| IDCLIENTE | NOME     | SEXO | CPF         | EMAIL              | RUA                | BAIRRO     | CIDADE         | TIPO | NUMERO    |
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | RES  | 45853033  |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | COM  | 35853033  |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | CEL  | 990891200 |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | RES  | 51853033  |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | CEL  | 921678801 |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | CEL  | 971406822 |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | COM  | 34853033  |
|         5 | JOEL     | M    | 14785299720 | JOEL@GMAIL.COM     | Avenida Barroso    | CENTRO     | RIO DE JANEIRO | CEL  | 51853145  |
|         9 | FLAVIO   | M    | 4657765     | FLAVIO@IG.COM      | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | RES  | 68976565  |
|         9 | FLAVIO   | M    | 4657765     | FLAVIO@IG.COM      | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | CEL  | 99656675  |
|        12 | KARLA    | M    | 545676778   | KARLA@GMAIL.COM    | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | COM  | 88687979  |
|        13 | DANIELE  | M    | 43536789    | DANIELE@GMAIL.COM  | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | COM  | 88965676  |
|        15 | EDUARDO  | M    | 54376457    | NULL               | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | CEL  | 89966809  |
|        17 | ANTONIO  | M    | 3423565     | ANTONIO@UOL.COM    | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | CEL  | 99655768  |
|        18 | ELAINE   | M    | 32567763    | ELAINE@GLOBO.COM   | RUA DA LAPA        | LAPA       | SAO PAULO      | RES  | 89955665  |
|        19 | CARMEM   | M    | 787832213   | CARMEM@IG.COM      | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RES  | 77455786  |
|        19 | CARMEM   | M    | 787832213   | CARMEM@IG.COM      | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RES  | 89766554  |
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
17 rows in set (0,00 sec)

/*CORREÇÃO DOS ERROS - KARLA, DANIELE, ELAINE E CARMEM SEXO = M*/

/------------------------/
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 12
OR IDCLIENTE = 13
OR IDCLIENTE = 18
OR IDCLIENTE = 19;
/------------------------/
SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (12, 13, 18, 19);
/------------------------/

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE IN (12, 13, 18, 19);

/*OU*/

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 12
OR IDCLIENTE = 13
OR IDCLIENTE = 18
OR IDCLIENTE = 19;

/*RELATÓRIO DE HOMENS DEPOIS DA CORREÇÃO*/
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.CPF, C.EMAIL,
	E.RUA, E.BAIRRO, E.CIDADE,
	T.TIPO, T.NUMERO
FROM CLIENTE C	
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE	
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE	
WHERE SEXO = 'M';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
| IDCLIENTE | NOME     | SEXO | CPF         | EMAIL              | RUA                | BAIRRO     | CIDADE         | TIPO | NUMERO    |
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | RES  | 45853033  |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | COM  | 35853033  |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | CEL  | 990891200 |
|         1 | GILSON   | M    | 54685299720 | GILSON@GMAIL.COM   | Praça Barão        | CENTRO     | RIO DE JANEIRO | RES  | 51853033  |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | CEL  | 921678801 |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | CEL  | 971406822 |
|         2 | FERNANDO | M    | 12385299720 | FERNANDO@GMAIL.COM | Avenida Braga      | CENTRO     | RIO DE JANEIRO | COM  | 34853033  |
|         5 | JOEL     | M    | 14785299720 | JOEL@GMAIL.COM     | Avenida Barroso    | CENTRO     | RIO DE JANEIRO | CEL  | 51853145  |
|         9 | FLAVIO   | M    | 4657765     | FLAVIO@IG.COM      | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | RES  | 68976565  |
|         9 | FLAVIO   | M    | 4657765     | FLAVIO@IG.COM      | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | CEL  | 99656675  |
|        15 | EDUARDO  | M    | 54376457    | NULL               | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | CEL  | 89966809  |
|        17 | ANTONIO  | M    | 3423565     | ANTONIO@UOL.COM    | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | CEL  | 99655768  |
+-----------+----------+------+-------------+--------------------+--------------------+------------+----------------+------+-----------+
12 rows in set (0,00 sec)

/*RELATÓRIO DE MULHERES*/
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
	E.RUA, E.BAIRRO, E.CIDADE,
	T.TIPO, T.NUMERO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE	
WHERE SEXO = 'F';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+----------+------+--------------------+-------------+--------------------+------------+----------------+------+----------+
| IDCLIENTE | NOME     | SEXO | EMAIL              | CPF         | RUA                | BAIRRO     | CIDADE         | TIPO | NUMERO   |
+-----------+----------+------+--------------------+-------------+--------------------+------------+----------------+------+----------+
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | 45685299720 | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 25853033 |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | 45685299720 | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 85853033 |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | 45685299720 | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 41853033 |
|         6 | GABRIELA | F    | GABRILEA@GMAIL.COM | 25885299720 | Avenida Sílvio     | CENTRO     | RIO DE JANEIRO | RES  | 40853033 |
|        11 | GIOVANA  | F    | NULL               | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | CEL  | 33567765 |
|        11 | GIOVANA  | F    | NULL               | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | CEL  | 88668786 |
|        11 | GIOVANA  | F    | NULL               | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | COM  | 55689654 |
|        12 | KARLA    | F    | KARLA@GMAIL.COM    | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | COM  | 88687979 |
|        13 | DANIELE  | F    | DANIELE@GMAIL.COM  | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | COM  | 88965676 |
|        16 | ANTONIO  | F    | ANTONIO@IG.COM     | 12436767    | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | COM  | 88679978 |
|        18 | ELAINE   | F    | ELAINE@GLOBO.COM   | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | RES  | 89955665 |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RES  | 77455786 |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RES  | 89766554 |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RES  | 77755785 |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | COM  | 44522578 |
|        21 | JOICE    | F    | JOICE@GMAIL.COM    | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | CEL  | 44522578 |
+-----------+----------+------+--------------------+-------------+--------------------+------------+----------------+------+----------+
16 rows in set (0,00 sec)

/*CORREÇÃO DOS ERROS - ANTONIO = F*/
UPDATE CLIENTE
SET SEXO = 'M'
WHERE IDCLIENTE = 16;

/*RELATÓRIO DE MULHERES DEPOIS DA CORREÇÃO*/
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF,
	E.RUA, E.BAIRRO, E.CIDADE,
	T.TIPO, T.NUMERO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE	
WHERE SEXO = 'F';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+----------+------+--------------------+-------------+--------------------+------------+----------------+------+----------+
| IDCLIENTE | NOME     | SEXO | EMAIL              | CPF         | RUA                | BAIRRO     | CIDADE         | TIPO | NUMERO   |
+-----------+----------+------+--------------------+-------------+--------------------+------------+----------------+------+----------+
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | 45685299720 | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 25853033 |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | 45685299720 | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 85853033 |
|         3 | MARIA    | F    | MARIA@GMAIL.COM    | 45685299720 | Praça Floriano     | CENTRO     | RIO DE JANEIRO | RES  | 41853033 |
|         6 | GABRIELA | F    | GABRILEA@GMAIL.COM | 25885299720 | Avenida Sílvio     | CENTRO     | RIO DE JANEIRO | RES  | 40853033 |
|        11 | GIOVANA  | F    | NULL               | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | CEL  | 33567765 |
|        11 | GIOVANA  | F    | NULL               | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | CEL  | 88668786 |
|        11 | GIOVANA  | F    | NULL               | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | COM  | 55689654 |
|        12 | KARLA    | F    | KARLA@GMAIL.COM    | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | COM  | 88687979 |
|        13 | DANIELE  | F    | DANIELE@GMAIL.COM  | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | COM  | 88965676 |
|        18 | ELAINE   | F    | ELAINE@GLOBO.COM   | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | RES  | 89955665 |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RES  | 77455786 |
|        19 | CARMEM   | F    | CARMEM@IG.COM      | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RES  | 89766554 |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RES  | 77755785 |
|        20 | ADRIANA  | F    | ADRIANA@GMAIL.COM  | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | COM  | 44522578 |
|        21 | JOICE    | F    | JOICE@GMAIL.COM    | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | CEL  | 44522578 |
+-----------+----------+------+--------------------+-------------+--------------------+------------+----------------+------+----------+
15 rows in set (0,00 sec)

/*QUANTIDADE DE HOMENS E MULHERES*/
SELECT SEXO, COUNT(*)
FROM CLIENTE
GROUP BY SEXO;
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+------+----------+
| SEXO | COUNT(*) |
+------+----------+
| M    |        9 |
| F    |       11 |
+------+----------+
2 rows in set (0,05 sec)

/*IDS E EMAIL DAS MULHERES*/
SELECT IDCLIENTE, EMAIL, NOME, BAIRRO, ESTADO
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+--------------------+----------+------------+--------+
| IDCLIENTE | EMAIL              | NOME     | BAIRRO     | ESTADO |
+-----------+--------------------+----------+------------+--------+
|         3 | MARIA@GMAIL.COM    | MARIA    | CENTRO     | RJ     |
|         4 | NULL               | CAROL    | CENTRO     | RJ     |
|         6 | GABRILEA@GMAIL.COM | GABRIELA | CENTRO     | RJ     |
|         7 | NULL               | PAULA    | ALVORADA   | RJ     |
|        11 | NULL               | GIOVANA  | CENTRO     | RJ     |
|        12 | KARLA@GMAIL.COM    | KARLA    | COPACABANA | RJ     |
|        13 | DANIELE@GMAIL.COM  | DANIELE  | CENTRO     | ES     |
|        18 | ELAINE@GLOBO.COM   | ELAINE   | LAPA       | SP     |
|        19 | CARMEM@IG.COM      | CARMEM   | CENTRO     | RJ     |
|        20 | ADRIANA@GMAIL.COM  | ADRIANA  | CENTRO     | RJ     |
|        21 | JOICE@GMAIL.COM    | JOICE    | CENTRO     | RJ     |
+-----------+--------------------+----------+------------+--------+
11 rows in set (0,01 sec)

/*IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO*/
SELECT C.IDCLIENTE, C.EMAIL, C.NOME, E.BAIRRO, E.ESTADO, T.TIPO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F'
AND E.BAIRRO = 'CENTRO'
AND E.CIDADE = 'RIO DE JANEIRO';
/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+--------------------+----------+--------+--------+------+
| IDCLIENTE | EMAIL              | NOME     | BAIRRO | ESTADO | TIPO |
+-----------+--------------------+----------+--------+--------+------+
|         3 | MARIA@GMAIL.COM    | MARIA    | CENTRO | RJ     | RES  |
|         3 | MARIA@GMAIL.COM    | MARIA    | CENTRO | RJ     | RES  |
|         3 | MARIA@GMAIL.COM    | MARIA    | CENTRO | RJ     | RES  |
|         6 | GABRILEA@GMAIL.COM | GABRIELA | CENTRO | RJ     | RES  |
|        11 | NULL               | GIOVANA  | CENTRO | RJ     | CEL  |
|        11 | NULL               | GIOVANA  | CENTRO | RJ     | CEL  |
|        11 | NULL               | GIOVANA  | CENTRO | RJ     | COM  |
|        19 | CARMEM@IG.COM      | CARMEM   | CENTRO | RJ     | RES  |
|        19 | CARMEM@IG.COM      | CARMEM   | CENTRO | RJ     | RES  |
|        20 | ADRIANA@GMAIL.COM  | ADRIANA  | CENTRO | RJ     | RES  |
|        20 | ADRIANA@GMAIL.COM  | ADRIANA  | CENTRO | RJ     | COM  |
|        21 | JOICE@GMAIL.COM    | JOICE    | CENTRO | RJ     | CEL  |
+-----------+--------------------+----------+--------+--------+------+
12 rows in set (0,00 sec)

/*IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NÃO TENHAM CELULAR*/
SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F'
AND E.BAIRRO = 'CENTRO'
AND E.CIDADE = 'RIO DE JANEIRO'
AND T.TIPO = 'RES' OR T.TIPO = 'COM';

/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+--------------------+----------+------+------------+----------------+------+
| IDCLIENTE | EMAIL              | NOME     | SEXO | BAIRRO     | CIDADE         | TIPO |
+-----------+--------------------+----------+------+------------+----------------+------+
|         1 | GILSON@GMAIL.COM   | GILSON   | M    | CENTRO     | RIO DE JANEIRO | COM  |
|         3 | MARIA@GMAIL.COM    | MARIA    | F    | CENTRO     | RIO DE JANEIRO | RES  |
|         3 | MARIA@GMAIL.COM    | MARIA    | F    | CENTRO     | RIO DE JANEIRO | RES  |
|         2 | FERNANDO@GMAIL.COM | FERNANDO | M    | CENTRO     | RIO DE JANEIRO | COM  |
|         6 | GABRILEA@GMAIL.COM | GABRIELA | F    | CENTRO     | RIO DE JANEIRO | RES  |
|         3 | MARIA@GMAIL.COM    | MARIA    | F    | CENTRO     | RIO DE JANEIRO | RES  |
|        11 | NULL               | GIOVANA  | F    | CENTRO     | RIO DE JANEIRO | COM  |
|        12 | KARLA@GMAIL.COM    | KARLA    | F    | COPACABANA | RIO DE JANEIRO | COM  |
|        13 | DANIELE@GMAIL.COM  | DANIELE  | F    | CENTRO     | VITORIA        | COM  |
|        16 | ANTONIO@IG.COM     | ANTONIO  | M    | JARDINS    | SAO PAULO      | COM  |
|        19 | CARMEM@IG.COM      | CARMEM   | F    | CENTRO     | RIO DE JANEIRO | RES  |
|        19 | CARMEM@IG.COM      | CARMEM   | F    | CENTRO     | RIO DE JANEIRO | RES  |
|        20 | ADRIANA@GMAIL.COM  | ADRIANA  | F    | CENTRO     | RIO DE JANEIRO | RES  |
|        20 | ADRIANA@GMAIL.COM  | ADRIANA  | F    | CENTRO     | RIO DE JANEIRO | COM  |
+-----------+--------------------+----------+------+------------+----------------+------+
14 rows in set (0,00 sec)

/*IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NÃO TENHAM CELULAR*/
SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F'
AND E.BAIRRO = 'CENTRO'
AND E.CIDADE = 'RIO DE JANEIRO'
AND (T.TIPO = 'RES' OR T.TIPO = 'COM');

/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+-----------+--------------------+----------+------+--------+----------------+------+
| IDCLIENTE | EMAIL              | NOME     | SEXO | BAIRRO | CIDADE         | TIPO |
+-----------+--------------------+----------+------+--------+----------------+------+
|         3 | MARIA@GMAIL.COM    | MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  |
|         3 | MARIA@GMAIL.COM    | MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  |
|         3 | MARIA@GMAIL.COM    | MARIA    | F    | CENTRO | RIO DE JANEIRO | RES  |
|         6 | GABRILEA@GMAIL.COM | GABRIELA | F    | CENTRO | RIO DE JANEIRO | RES  |
|        11 | NULL               | GIOVANA  | F    | CENTRO | RIO DE JANEIRO | COM  |
|        19 | CARMEM@IG.COM      | CARMEM   | F    | CENTRO | RIO DE JANEIRO | RES  |
|        19 | CARMEM@IG.COM      | CARMEM   | F    | CENTRO | RIO DE JANEIRO | RES  |
|        20 | ADRIANA@GMAIL.COM  | ADRIANA  | F    | CENTRO | RIO DE JANEIRO | RES  |
|        20 | ADRIANA@GMAIL.COM  | ADRIANA  | F    | CENTRO | RIO DE JANEIRO | COM  |
+-----------+--------------------+----------+------+--------+----------------+------+
9 rows in set (0,00 sec)

/*As querys estão parcialmente corretas pois podem haver pessoas com telefone
residencial e celular que podem ser incluídas nessa query*/


/*PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU  UM RELATÓRIO COM O NOME,
EMAIL E TELEFONE CELULAR DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO
VOCÊ TERÁ QUE PASSAR UMA QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR*/

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE TIPO = 'CEL'	
AND ESTADO = 'RJ';

/*COPIA DA IMAGEM DO MYSQL CLIENT*/ 
+----------+--------------------+-----------+
| NOME     | EMAIL              | CELULAR   |
+----------+--------------------+-----------+
| GILSON   | GILSON@GMAIL.COM   | 990891200 |
| FERNANDO | FERNANDO@GMAIL.COM | 921678801 |
| FERNANDO | FERNANDO@GMAIL.COM | 971406822 |
| JOEL     | JOEL@GMAIL.COM     | 51853145  |
| GIOVANA  | NULL               | 33567765  |
| GIOVANA  | NULL               | 88668786  |
| JOICE    | JOICE@GMAIL.COM    | 44522578  |
+----------+--------------------+-----------+
7 rows in set (0,00 sec)

/*PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RALATÓRIO 
COM NOME, EMAIL E TELEFONE CELULAR DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATÓRIO PARA O PROGRAMADOR.*/

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
		INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'SP';	

+---------+------------------+----------+
| NOME    | EMAIL            | CELULAR  |
+---------+------------------+----------+
| ELAINE  | ELAINE@GLOBO.COM | 89955665 |
+---------+------------------+----------+
1 rows in set (0,00 sec)

