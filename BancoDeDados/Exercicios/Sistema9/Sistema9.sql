/*Abrir o workbanch pelo terminal - mysql -u adison -p digitar a senha*/
/*Abrir o mycli pelo terminal - mycli -u adison -p digitar a senha*/

/*O ; SERVE COMO DELIMITADOR, QUANDO SE TERMINA DE ESCREVER O COMANDO
O SISTEMA SQL ESPERA ATÉ FINALIZAR COM ; E EXECUTA O QUE ESTÁ DO PONTO
PARA CIMA, ALGUNS COMANDOS NÃO PRECISAM DE ; POIS NÃO SÃO COMANDOS SQL
COMO EXEMPLO O COMANDO STATUS POIS É UM COMANDO DE INFRAESTRUTURA.*/

/*PARA SE PROGRAMAR EM MYSQL É PRECISO MUDAR O DELIMITADOR.
PARA MUDAR O DELIMITADOR É PRECISO CRIAR UMA PROCEDURE COM O 
COMANDO DELIMITER + O LIMITADOR.*/

/*MUDAR O DELIMITER É PRECISO POIS PARA SE FINALIZAR OS COMANDOS PROGRAMADOS
É PRECISO COLOCAR ; E SE O COMPILADOR VER ESSE SINAL NO FINAL ELE ACABA O PROGRAMA
SENDO QUE É PRECISO CONTINUAR ELA E FINALIZAR COM $*/

/*AO ABRIR E FECHAR O BANCO O DELIMITER VOLTA AO PADRÃO.*/

/*ANTES DO COMANDO DELIMITER*/
STATUS
Connection id:		8
Current database:	
Current user:		adison@localhost
SSL:			Not in use
Current pager:		less
Using outfile:		''
Using delimiter: ->	; /*DELIMITADOR ATUAL*/
Server version:		8.0.31-0ubuntu0.22.04.1 (Ubuntu)
Protocol version:	10
Connection:		Localhost via UNIX socket
Server characterset:	utf8mb4
Db     characterset:	utf8mb4
Client characterset:	utf8mb4
Conn.  characterset:	utf8mb4
UNIX socket:		/var/run/mysqld/mysqld.sock
Binary data as:		Hexadecimal
Uptime:	->		35 min 35 sec /*TEMPO EM QUE O BANCO ESTÁ ÍNTEGRO*/

/*TESTANDO UMA QUERY*/
mysql> SELECT * FROM V_RELATORIO;
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

/*DEPOIS DO COMANDO DELIMITER*/
DELIMITER $

STATUS
Connection id:		8
Current database:	COMERCIO
Current user:		adison@localhost
SSL:			Not in use
Current pager:		less
Using outfile:		''
Using delimiter: ->	$
Server version:		8.0.31-0ubuntu0.22.04.1 (Ubuntu)
Protocol version:	10
Connection:		Localhost via UNIX socket
Server characterset:	utf8mb4
Db     characterset:	utf8mb4
Client characterset:	utf8mb4
Conn.  characterset:	utf8mb4
UNIX socket:		/var/run/mysqld/mysqld.sock
Binary data as:		Hexadecimal
Uptime:			1 hour 1 min 31 sec


/*TESTANDO UMA QUERY*/
mysql> SELECT * FROM V_RELATORIO$
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

/*PROGRAMAÇÃO EM BANCO DE DADOS COM STORED PROCEDURES, PROCEDIMENTOS ARMAZENADOS.*/
DELIMITER $

/*SINTAXE BÁSICA*/
CREATE PROCEDURE NOME()
BEGIN

	QUALQUER PROGRAMA/INSERT/DELETE ETC;

END
$	

/*CRIANDO UMA PROCEDURE SEM PARÂMETROS*/
DELIMITER $
CREATE PROCEDURE NOME_EMPRESA()
BEGIN

	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$	

/*CHAMANDO UMA PROCEDURE, POR MEIO DO NOME, O OUTRO COMANDO É PARA DESFAZER O DELIMITER*/
CALL NOME_EMPRESA()$

mysql> CALL NOME_EMPRESA()$
+------------------------+
| EMPRESA                |
+------------------------+
| UNIVERSIDADE DOS DADOS |
+------------------------+
1 row in set (0,01 sec)


DELIMITER ;

CALL NOME_EMPRESA();

mysql> CALL NOME_EMPRESA();
+------------------------+
| EMPRESA                |
+------------------------+
| UNIVERSIDADE DOS DADOS |
+------------------------+
1 row in set (0,00 sec)

/*APAGAR UMA PROCEDURE*/
DROP PROCEDURE NOME_PROCEDURE;

/*PROCEDURES COM PARÂMETROS*/
DELIMITER $
CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN

	SELECT NUMERO1 + NUMERO2 AS CONTA;

END
$
DELIMITER ;	

/*CHAMANDO A PROCEDURE PASSANDO OS PARÂMETROS*/
CALL CONTA(100,50);

mysql> CALL CONTA(100,50);
+-------+
| CONTA |
+-------+
|   150 |
+-------+
1 row in set (0,00 sec)
