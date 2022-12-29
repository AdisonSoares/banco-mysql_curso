/*Abrir o workbanch pelo terminal - mysql -u adison -p digitar a senha*/
/*Abrir o mycli pelo terminal - mycli -u adison -p digitar a senha*/

/*BANCO DE DADOS UTILIZADO - PROJETO*/
USE PROJETO;

/*ALTERANDO TABELAS*/

/*NOVA TABELA*/
CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

/*DESCRIÇÃO DA TABELA*/
DESC TABELA;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| COLUNA1 | varchar(30) | YES  |     | NULL    |       |
| COLUNA2 | varchar(30) | YES  |     | NULL    |       |
| COLUNA3 | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0,00 sec)

/*ALTERANDO A TABELA DEPOIS DE INCLUIDA*/
/*ADICIONANDO UMA CHAVE PRIMARIA - PK*/
ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);

/*DESCRIÇÃO DA TABELA*/
DESC TABELA;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| COLUNA1 | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2 | varchar(30) | YES  |     | NULL    |       |
| COLUNA3 | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0,01 sec)

/*ADICIONANDO COLUNA SEM POSIÇÃO - POR PADRÃO QUANDO NÃO SE INFORMA A POSIÇAO ELA VAI PRA ÚLTIMO*/
ALTER TABLE TABELA
ADD COLUNA VARCHAR(30);

/*DESCRIÇÃO DA TABELA*/
DESC TABELA;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| COLUNA1 | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2 | varchar(30) | YES  |     | NULL    |       |
| COLUNA3 | varchar(30) | YES  |     | NULL    |       |
| COLUNA  | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0,00 sec)

/*ADICIONANDO COLUNA COM POSIÇÃO*/
ALTER TABLE TABELA
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

/*DESCRIÇÃO DA TABELA*/
DESC TABELA;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| COLUNA1 | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2 | varchar(30) | YES  |     | NULL    |       |
| COLUNA3 | varchar(30) | YES  |     | NULL    |       |
| COLUNA4 | varchar(30) | NO   | UNI | NULL    |       |
| COLUNA  | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0,00 sec)

/*MODIFICANDO O TIPO DE UM CAMPO*/
ALTER TABLE TABELA MODIFY COLUNA2 DATE NOT NULL;

/*DESCRIÇÃO DA TABELA*/
DESC TABELA;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| COLUNA1 | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2 | date        | NO   |     | NULL    |       |
| COLUNA3 | varchar(30) | YES  |     | NULL    |       |
| COLUNA4 | varchar(30) | NO   | UNI | NULL    |       |
| COLUNA  | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0,00 sec)

/*RENOMEANDO TABELA*/
ALTER TABLE TABELA
RENAME PESSOA;

/*EXIBIÇÃO DE TABELAS*/
SHOW TABLES;
+-------------------+
| Tables_in_PROJETO |
+-------------------+
| CLIENTE           |
| CURSOS            |
| PESSOA            |
| VENDEDORES        |
+-------------------+
4 rows in set (0,01 sec)

/*NOVA TABELA*/
CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

/*CRIANDO CHAVE ESTRANGEIRA - FOREIGN KEY*/
ALTER TABLE TIME 
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

/*DESCRIÇÃO TABELA TIME*/
DESC TIME;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDTIME    | int         | NO   | PRI | NULL    | auto_increment |
| TIME      | varchar(30) | YES  |     | NULL    |                |
| ID_PESSOA | varchar(30) | YES  | MUL | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
3 rows in set (0,00 sec)

/*CONSULTAR UMA CHAVE CRIADA NA TABELA*/
SHOW CREATE TABLE TIME;

CREATE TABLE `TIME` (
  `IDTIME` int NOT NULL AUTO_INCREMENT,
  `TIME` varchar(30) DEFAULT NULL,
  `ID_PESSOA` varchar(30) DEFAULT NULL,
  KEY `ID_PESSOA` (`ID_PESSOA`),
  PRIMARY KEY (`IDTIME`),
  FOREIGN KEY (`ID_PESSOA`) 
  REFERENCES `PESSOA` (`COLUNA1`)
) 

/*ORGANIZAÇÃO DE CHAVES, CHAVE É UMA CONSTRAINT QUE É UMA REGRA*/
/*A CHAVE PRIMARIA GARANTE QUE O REGISTRO SEJA ÚNICO*/
/*A CHAVE ESTRANGEIRA GARANTE QUE NÃO EXISTE REGISTRO EM TABELA SEM REFERÊNCIA EM OUTRA*/

/*CRIANDO NOVA TABELA*/
CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

/*INSERINDO DADOS*/
INSERT INTO JOGADOR VALUES(NULL, 'VINICIUS');
INSERT INTO TIMES VALUES(NULL, 'BRASIL',1);

/*EXIBIÇÃO DA TABELA JOGADOR*/
SELECT * FROM JOGADOR;
+-----------+----------+
| IDJOGADOR | NOME     |
+-----------+----------+
|         1 | VINICIUS |
+-----------+----------+
1 row in set (0,00 sec)

/*EXIBIÇÃO DA TABELA TIMES*/
SELECT * FROM TIMES;
+--------+----------+------------+
| IDTIME | NOMETIME | ID_JOGADOR |
+--------+----------+------------+
|      1 | BRASIL   |          1 |
+--------+----------+------------+
1 row in set (0,00 sec)

/*CONSULTAR UMA CHAVE CRIADA NA TABELA*/
SHOW CREATE TABLE JOGADOR;
---------------------------------------------------------------------------------+
| JOGADOR | CREATE TABLE `JOGADOR` (
  `IDJOGADOR` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IDJOGADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
---------------------------------------------------------------------------------+

/*CONSULTAR UMA CHAVE CRIADA NA TABELA*/
SHOW CREATE TABLE TIMES;
----------------------------------------------------------------------------------------+
| TIMES | CREATE TABLE `TIMES` (
  `IDTIME` int NOT NULL AUTO_INCREMENT,
  `NOMETIME` varchar(30) DEFAULT NULL,
  `ID_JOGADOR` int DEFAULT NULL,
  PRIMARY KEY (`IDTIME`),
  KEY `ID_JOGADOR` (`ID_JOGADOR`),
 /*-->*/ CONSTRAINT `TIMES_ibfk_1` FOREIGN KEY (`ID_JOGADOR`) REFERENCES `JOGADOR` (`IDJOGADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
----------------------------------------------------------------------------------------+

/*QUANDO SE FAZ UMA CONSULTA DAS CHAVES GERADAS EM DETERMINADA TABELA A EXIBIÇÃO MOSTRA
TAMBÉM A CONSTRAINT, NO CASO DA TABELA TIME O NOME DA CONSTRAINT É `TIMES_ibfk_1`,
QUAND SE CRIA UMA CHAVE DENTRO DA TABELA O BANCO CRIA UM NOME PARA A CONSTRAINT,
NÃO É UMA BOA PRÁTICA, O MELHOR É PRIMEIRO CRIAR A TABELA E DEPOIS CRIA AS 
CHAVES CONSTRAINTS POR FORA DA TABELA, ISSO ACONTECE PARA SE ATRIBUIR NOMES PARA
AS CONSTRAINTS QUANDO SE CRIA FORA DA TABELA, ISSO É IMPORTANTE POIS ESTÁ RELACIONADO
COM DICIONÁRIO DE DADOS.
A VIEW, PROCEDURES, CHAVES E OUTROS ELEMENTOS PODEM SER EXIBIDAS POR MEIO DO DICIONÁRIO DE DADOS
POR ISSO É IMPORTANTE NOMEAR DE FORMA DESCRITIVA AS CHAVES*/


/*ORGANIZANDO CHAVES E AÇÕES DE CONSTRAINTS*/
/*CRIAÇÃO DE TABELA*/
CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT 
);

/*CRIANDO REGRAS/CONSTRAINTS POR FORA*/
/*FK_TABELA-ORIGEM_TABELA-DESTINO*/
ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE (IDCLIENTE);

/*DESCRIÇÃO DE TABELAS*/
DESC CLIENTE; 
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| IDCLIENTE | int         | NO   | PRI | NULL    |       |
| NOME      | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0,00 sec)

DESC TELEFONE;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| IDTELEFONE | int         | YES  |     | NULL    |       |
| TIPO       | char(3)     | NO   |     | NULL    |       |
| NUMERO     | varchar(10) | NO   |     | NULL    |       |
| ID_CLIENTE | int         | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0,00 sec)

/*CONSULTADO CHAVES/CONSTRAINTS CRIADAS*/
SHOW CREATE TABLE CLIENTE;
+---------+--------------------------------------------------------+
| CLIENTE | CREATE TABLE `CLIENTE` (
  `IDCLIENTE` int NOT NULL,
  `NOME` varchar(30) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------+--------------------------------------------------------+
1 row in set (0,00 sec)

SHOW CREATE TABLE TELEFONE;
+----------+------------------------------------------------------------------------------------+
| TELEFONE | CREATE TABLE `TELEFONE` (
  `IDTELEFONE` int DEFAULT NULL,
  `TIPO` char(3) NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `ID_CLIENTE` int DEFAULT NULL,
  KEY `FK_CLIENTE_TELEFONE` (`ID_CLIENTE`),
  CONSTRAINT `FK_CLIENTE_TELEFONE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `CLIENTE` (`IDCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+------------------------------------------------------------------------------------+

/*DICIONÁRIO DE DADOS*/
/*NELAS ESTÃO OS METADADOS, DADOS DOS DADOS, SÃO INFORMAÇÕES
SOBRE TABELAS, ALGO QUE OS DEFINE EM POUCAS PALAVRAS.
OS BANCOS DE DADOS *information_schema, *mysql e *performance_schema,
PERTENCEM AO DICIONÁRIO DE DADOS, QUALQUER OBJETO ARMAZENADO EM QUALQUER
BANCO DE DADOS ESTÁ EM DICIONÁRIO.*/
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| COMERCIO           |
| EXERCICIO          |
| LIVRARIA           |
| PROJETO            |
| SISTEMA1           |
|-information_schema |
|-mysql              |
|-performance_schema |
| sys                |
| test               |
+--------------------+
10 rows in set (0,01 sec)

/*COMANDOS PARA CONSULTAS NO DICIONÁRIO DE DADOS - BUSCA DE CONSTRAINTS*/
USE INFORMATION_SCHEMA;

/*VERIFICAR A DATABASE/BANCO DE DADOS ATUAL*/
STATUS
--------------
mysql  Ver 8.0.31-0ubuntu0.22.04.1 for Linux on x86_64 ((Ubuntu))

Connection id:		9
Current database:	information_schema   <--------
Current user:		adison@localhost
SSL:			Not in use
Current pager:		less
Using outfile:		''
Using delimiter:	;
Server version:		8.0.31-0ubuntu0.22.04.1 (Ubuntu)
Protocol version:	10
Connection:		Localhost via UNIX socket
Server characterset:	utf8mb4
Db     characterset:	utf8mb3
Client characterset:	utf8mb4
Conn.  characterset:	utf8mb4
UNIX socket:		/var/run/mysqld/mysqld.sock
Binary data as:		Hexadecimal
Uptime:			2 hours 53 min 45 sec

Threads: 2  Questions: 141  Slow queries: 0  Opens: 183  Flush tables: 3  Open tables: 97  Queries per second avg: 0.013
--------------

/*CONSULTAR TABELAS*/
SHOW TABLES;
+---------------------------------------+
| Tables_in_information_schema          |
+---------------------------------------+
| ADMINISTRABLE_ROLE_AUTHORIZATIONS     |
| APPLICABLE_ROLES                      |
| CHARACTER_SETS                        |
| CHECK_CONSTRAINTS                     |
| COLLATIONS                            |
| COLLATION_CHARACTER_SET_APPLICABILITY |
| COLUMNS                               |
| COLUMNS_EXTENSIONS                    |
| COLUMN_PRIVILEGES                     |
| COLUMN_STATISTICS                     |
| ENABLED_ROLES                         |
| ENGINES                               |
| EVENTS                                |
| FILES                                 |
| INNODB_BUFFER_PAGE                    |
| INNODB_BUFFER_PAGE_LRU                |
| INNODB_BUFFER_POOL_STATS              |
| INNODB_CACHED_INDEXES                 |
| INNODB_CMP                            |
| INNODB_CMPMEM                         |
| INNODB_CMPMEM_RESET                   |
| INNODB_CMP_PER_INDEX                  |
| INNODB_CMP_PER_INDEX_RESET            |
| INNODB_CMP_RESET                      |
| INNODB_COLUMNS                        |
| INNODB_DATAFILES                      |
| INNODB_FIELDS                         |
| INNODB_FOREIGN                        |
| INNODB_FOREIGN_COLS                   |
| INNODB_FT_BEING_DELETED               |
| INNODB_FT_CONFIG                      |
| INNODB_FT_DEFAULT_STOPWORD            |
| INNODB_FT_DELETED                     |
| INNODB_FT_INDEX_CACHE                 |
| INNODB_FT_INDEX_TABLE                 |
| INNODB_INDEXES                        |
| INNODB_METRICS                        |
| INNODB_SESSION_TEMP_TABLESPACES       |
| INNODB_TABLES                         |
| INNODB_TABLESPACES                    |
| INNODB_TABLESPACES_BRIEF              |
| INNODB_TABLESTATS                     |
| INNODB_TEMP_TABLE_INFO                |
| INNODB_TRX                            |
| INNODB_VIRTUAL                        |
| KEYWORDS                              |
| KEY_COLUMN_USAGE                      |
| OPTIMIZER_TRACE                       |
| PARAMETERS                            |
| PARTITIONS                            |
| PLUGINS                               |
| PROCESSLIST                           |
| PROFILING                             |
| REFERENTIAL_CONSTRAINTS               |
| RESOURCE_GROUPS                       |
| ROLE_COLUMN_GRANTS                    |
| ROLE_ROUTINE_GRANTS                   |
| ROLE_TABLE_GRANTS                     |
| ROUTINES                              |
| SCHEMATA                              |
| SCHEMATA_EXTENSIONS                   |
| SCHEMA_PRIVILEGES                     |
| STATISTICS                            |
| ST_GEOMETRY_COLUMNS                   |
| ST_SPATIAL_REFERENCE_SYSTEMS          |
| ST_UNITS_OF_MEASURE                   |
| TABLES                                |
| TABLESPACES                           |
| TABLESPACES_EXTENSIONS                |
| TABLES_EXTENSIONS                     |
| TABLE_CONSTRAINTS   <----             |
| TABLE_CONSTRAINTS_EXTENSIONS          |
| TABLE_PRIVILEGES                      |
| TRIGGERS                              |
| USER_ATTRIBUTES                       |
| USER_PRIVILEGES                       |
| VIEWS                                 |
| VIEW_ROUTINE_USAGE                    |
| VIEW_TABLE_USAGE                      |
+---------------------------------------+
79 rows in set (0,00 sec)

/*DESCRIÇÃO DA TABELA*/
DESC TABLE_CONSTRAINTS;
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(64) | NO   |     | NULL    |       |
| CONSTRAINT_SCHEMA  | varchar(64) | NO   |     | NULL    |       |
|-CONSTRAINT_NAME    | varchar(64) | YES  |     | NULL    |       |
| TABLE_SCHEMA       | varchar(64) | NO   |     | NULL    |       |
|-TABLE_NAME         | varchar(64) | NO   |     | NULL    |       |
|-CONSTRAINT_TYPE    | varchar(11) | NO   |     |         |       |
| ENFORCED           | varchar(3)  | NO   |     |         |       |
+--------------------+-------------+------+-----+---------+-------+
7 rows in set (0,00 sec)

/*SELECINANDO AS TABELAS PARA CONSULTA*/
SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS;	   

+--------------------+------------------------------------------------------+-------------+
| BANCO              | TABELA                                               | TIPO        |
+--------------------+------------------------------------------------------+-------------+
| COMERCIO           | CLIENTE                                              | UNIQUE      |
| COMERCIO           | CLIENTE                                              | UNIQUE      |
| COMERCIO           | CLIENTE                                              | PRIMARY KEY |
| COMERCIO           | ENDERECO                                             | UNIQUE      |
| COMERCIO           | ENDERECO                                             | PRIMARY KEY |
| COMERCIO           | ENDERECO                                             | FOREIGN KEY |
| COMERCIO           | PRODUTO                                              | PRIMARY KEY |
| COMERCIO           | TELEFONE                                             | PRIMARY KEY |
| COMERCIO           | TELEFONE                                             | FOREIGN KEY |
| PROJETO            | CLIENTE                                              | PRIMARY KEY |
| PROJETO            | CURSOS                                               | PRIMARY KEY |
| PROJETO            | JOGADOR                                              | PRIMARY KEY |
| PROJETO            | PESSOA                                               | UNIQUE      |
| PROJETO            | PESSOA                                               | PRIMARY KEY |
| PROJETO            | TELEFONE                                             | FOREIGN KEY |
| PROJETO            | TIME                                                 | PRIMARY KEY |
| PROJETO            | TIME                                                 | FOREIGN KEY |
| PROJETO            | TIMES                                                | PRIMARY KEY |
| PROJETO            | TIMES                                                | FOREIGN KEY |
| PROJETO            | VENDEDORES                                           | PRIMARY KEY |
| SISTEMA1           | CLIENTE                                              | PRIMARY KEY |
| SISTEMA1           | POSSUI                                               | FOREIGN KEY |
| SISTEMA1           | POSSUI                                               | FOREIGN KEY |
| SISTEMA1           | TELEFONE                                             | PRIMARY KEY |
| mysql              | columns_priv                                         | PRIMARY KEY |
| mysql              | component                                            | PRIMARY KEY |
| mysql              | db                                                   | PRIMARY KEY |
| mysql              | default_roles                                        | PRIMARY KEY |
| mysql              | engine_cost                                          | PRIMARY KEY |
| mysql              | func                                                 | PRIMARY KEY |
| mysql              | global_grants                                        | PRIMARY KEY |
| mysql              | gtid_executed                                        | PRIMARY KEY |
| mysql              | help_category                                        | UNIQUE      |
| mysql              | help_category                                        | PRIMARY KEY |
| mysql              | help_keyword                                         | UNIQUE      |
| mysql              | help_keyword                                         | PRIMARY KEY |
| mysql              | help_relation                                        | PRIMARY KEY |
| mysql              | help_topic                                           | UNIQUE      |
| mysql              | help_topic                                           | PRIMARY KEY |
| mysql              | innodb_index_stats                                   | PRIMARY KEY |
| mysql              | innodb_table_stats                                   | PRIMARY KEY |
| mysql              | password_history                                     | PRIMARY KEY |
| mysql              | plugin                                               | PRIMARY KEY |
| mysql              | procs_priv                                           | PRIMARY KEY |
| mysql              | proxies_priv                                         | PRIMARY KEY |
| mysql              | replication_asynchronous_connection_failover         | PRIMARY KEY |
| mysql              | replication_asynchronous_connection_failover_managed | PRIMARY KEY |
| mysql              | replication_group_configuration_version              | PRIMARY KEY |
| mysql              | replication_group_member_actions                     | PRIMARY KEY |
| mysql              | role_edges                                           | PRIMARY KEY |
| mysql              | server_cost                                          | PRIMARY KEY |
| mysql              | servers                                              | PRIMARY KEY |
| mysql              | slave_master_info                                    | PRIMARY KEY |
| mysql              | slave_relay_log_info                                 | PRIMARY KEY |
| mysql              | slave_worker_info                                    | PRIMARY KEY |
| mysql              | tables_priv                                          | PRIMARY KEY |
| mysql              | time_zone                                            | PRIMARY KEY |
| mysql              | time_zone_leap_second                                | PRIMARY KEY |
| mysql              | time_zone_name                                       | PRIMARY KEY |
| mysql              | time_zone_transition                                 | PRIMARY KEY |
| mysql              | time_zone_transition_type                            | PRIMARY KEY |
| mysql              | user                                                 | PRIMARY KEY |
| performance_schema | accounts                                             | UNIQUE      |
| performance_schema | cond_instances                                       | PRIMARY KEY |
| performance_schema | data_locks                                           | PRIMARY KEY |
| performance_schema | error_log                                            | PRIMARY KEY |
| performance_schema | events_errors_summary_by_account_by_error            | UNIQUE      |
| performance_schema | events_errors_summary_by_host_by_error               | UNIQUE      |
| performance_schema | events_errors_summary_by_thread_by_error             | UNIQUE      |
| performance_schema | events_errors_summary_by_user_by_error               | UNIQUE      |
| performance_schema | events_errors_summary_global_by_error                | UNIQUE      |
| performance_schema | events_stages_current                                | PRIMARY KEY |
| performance_schema | events_stages_history                                | PRIMARY KEY |
| performance_schema | events_stages_summary_by_account_by_event_name       | UNIQUE      |
| performance_schema | events_stages_summary_by_host_by_event_name          | UNIQUE      |
| performance_schema | events_stages_summary_by_thread_by_event_name        | PRIMARY KEY |
| performance_schema | events_stages_summary_by_user_by_event_name          | UNIQUE      |
| performance_schema | events_stages_summary_global_by_event_name           | PRIMARY KEY |
| performance_schema | events_statements_current                            | PRIMARY KEY |
| performance_schema | events_statements_histogram_by_digest                | UNIQUE      |
| performance_schema | events_statements_histogram_global                   | PRIMARY KEY |
| performance_schema | events_statements_history                            | PRIMARY KEY |
| performance_schema | events_statements_summary_by_account_by_event_name   | UNIQUE      |
| performance_schema | events_statements_summary_by_digest                  | UNIQUE      |
| performance_schema | events_statements_summary_by_host_by_event_name      | UNIQUE      |
| performance_schema | events_statements_summary_by_program                 | PRIMARY KEY |
| performance_schema | events_statements_summary_by_thread_by_event_name    | PRIMARY KEY |
| performance_schema | events_statements_summary_by_user_by_event_name      | UNIQUE      |
| performance_schema | events_statements_summary_global_by_event_name       | PRIMARY KEY |
| performance_schema | events_transactions_current                          | PRIMARY KEY |
| performance_schema | events_transactions_history                          | PRIMARY KEY |
| performance_schema | events_transactions_summary_by_account_by_event_name | UNIQUE      |
| performance_schema | events_transactions_summary_by_host_by_event_name    | UNIQUE      |
| performance_schema | events_transactions_summary_by_thread_by_event_name  | PRIMARY KEY |
| performance_schema | events_transactions_summary_by_user_by_event_name    | UNIQUE      |
| performance_schema | events_transactions_summary_global_by_event_name     | PRIMARY KEY |
| performance_schema | events_waits_current                                 | PRIMARY KEY |
| performance_schema | events_waits_history                                 | PRIMARY KEY |
| performance_schema | events_waits_summary_by_account_by_event_name        | UNIQUE      |
| performance_schema | events_waits_summary_by_host_by_event_name           | UNIQUE      |
| performance_schema | events_waits_summary_by_instance                     | PRIMARY KEY |
| performance_schema | events_waits_summary_by_thread_by_event_name         | PRIMARY KEY |
| performance_schema | events_waits_summary_by_user_by_event_name           | UNIQUE      |
| performance_schema | events_waits_summary_global_by_event_name            | PRIMARY KEY |
| performance_schema | file_instances                                       | PRIMARY KEY |
| performance_schema | file_summary_by_event_name                           | PRIMARY KEY |
| performance_schema | file_summary_by_instance                             | PRIMARY KEY |
| performance_schema | global_status                                        | PRIMARY KEY |
| performance_schema | global_variables                                     | PRIMARY KEY |
| performance_schema | host_cache                                           | PRIMARY KEY |
| performance_schema | hosts                                                | UNIQUE      |
| performance_schema | memory_summary_by_account_by_event_name              | UNIQUE      |
| performance_schema | memory_summary_by_host_by_event_name                 | UNIQUE      |
| performance_schema | memory_summary_by_thread_by_event_name               | PRIMARY KEY |
| performance_schema | memory_summary_by_user_by_event_name                 | UNIQUE      |
| performance_schema | memory_summary_global_by_event_name                  | PRIMARY KEY |
| performance_schema | metadata_locks                                       | PRIMARY KEY |
| performance_schema | mutex_instances                                      | PRIMARY KEY |
| performance_schema | objects_summary_global_by_type                       | UNIQUE      |
| performance_schema | persisted_variables                                  | PRIMARY KEY |
| performance_schema | prepared_statements_instances                        | UNIQUE      |
| performance_schema | prepared_statements_instances                        | PRIMARY KEY |
| performance_schema | processlist                                          | PRIMARY KEY |
| performance_schema | replication_applier_configuration                    | PRIMARY KEY |
| performance_schema | replication_applier_status                           | PRIMARY KEY |
| performance_schema | replication_applier_status_by_coordinator            | PRIMARY KEY |
| performance_schema | replication_applier_status_by_worker                 | PRIMARY KEY |
| performance_schema | replication_connection_configuration                 | PRIMARY KEY |
| performance_schema | replication_connection_status                        | PRIMARY KEY |
| performance_schema | rwlock_instances                                     | PRIMARY KEY |
| performance_schema | session_account_connect_attrs                        | PRIMARY KEY |
| performance_schema | session_connect_attrs                                | PRIMARY KEY |
| performance_schema | session_status                                       | PRIMARY KEY |
| performance_schema | session_variables                                    | PRIMARY KEY |
| performance_schema | setup_actors                                         | PRIMARY KEY |
| performance_schema | setup_consumers                                      | PRIMARY KEY |
| performance_schema | setup_instruments                                    | PRIMARY KEY |
| performance_schema | setup_objects                                        | UNIQUE      |
| performance_schema | setup_threads                                        | PRIMARY KEY |
| performance_schema | socket_instances                                     | PRIMARY KEY |
| performance_schema | socket_summary_by_event_name                         | PRIMARY KEY |
| performance_schema | socket_summary_by_instance                           | PRIMARY KEY |
| performance_schema | status_by_account                                    | UNIQUE      |
| performance_schema | status_by_host                                       | UNIQUE      |
| performance_schema | status_by_thread                                     | PRIMARY KEY |
| performance_schema | status_by_user                                       | UNIQUE      |
| performance_schema | table_handles                                        | PRIMARY KEY |
| performance_schema | table_io_waits_summary_by_index_usage                | UNIQUE      |
| performance_schema | table_io_waits_summary_by_table                      | UNIQUE      |
| performance_schema | table_lock_waits_summary_by_table                    | UNIQUE      |
| performance_schema | threads                                              | PRIMARY KEY |
| performance_schema | user_defined_functions                               | PRIMARY KEY |
| performance_schema | user_variables_by_thread                             | PRIMARY KEY |
| performance_schema | users                                                | UNIQUE      |
| performance_schema | variables_by_thread                                  | PRIMARY KEY |
| sys                | sys_config                                           | PRIMARY KEY |
| test               | users                                                | PRIMARY KEY |
+--------------------+------------------------------------------------------+-------------+
157 rows in set (0,03 sec)

/*FILTRANDO A CONSTRAINT DE UM BANCO ESPECÍFICO*/
SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'PROJETO';
+---------+------------+-------------+
| BANCO   | TABELA     | TIPO        |
+---------+------------+-------------+
| PROJETO | CLIENTE    | PRIMARY KEY |
| PROJETO | CURSOS     | PRIMARY KEY |
| PROJETO | JOGADOR    | PRIMARY KEY |
| PROJETO | PESSOA     | UNIQUE      |
| PROJETO | PESSOA     | PRIMARY KEY |
| PROJETO | TELEFONE   | FOREIGN KEY |
| PROJETO | TIME       | PRIMARY KEY |
| PROJETO | TIME       | FOREIGN KEY |
| PROJETO | TIMES      | PRIMARY KEY |
| PROJETO | TIMES      | FOREIGN KEY |
| PROJETO | VENDEDORES | PRIMARY KEY |
+---------+------------+-------------+
11 rows in set (0,01 sec)

/*FILTRANDO A CONSTRAINT DE UM BANCO ESPECÍFICO COM NOME*/
SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS "NOME REGRA",
	   CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'PROJETO';
+---------+------------+---------------------+-------------+
| BANCO   | TABELA     | NOME REGRA          | TIPO        |
+---------+------------+---------------------+-------------+
| PROJETO | CLIENTE    | PRIMARY             | PRIMARY KEY |
| PROJETO | CURSOS     | PRIMARY             | PRIMARY KEY |
| PROJETO | JOGADOR    | PRIMARY             | PRIMARY KEY |
| PROJETO | PESSOA     | COLUNA4             | UNIQUE      |
| PROJETO | PESSOA     | PRIMARY             | PRIMARY KEY |
| PROJETO | TELEFONE   | FK_CLIENTE_TELEFONE | FOREIGN KEY |
| PROJETO | TIME       | PRIMARY             | PRIMARY KEY |
| PROJETO | TIME       | TIME_ibfk_1         | FOREIGN KEY |
| PROJETO | TIMES      | PRIMARY             | PRIMARY KEY |
| PROJETO | TIMES      | TIMES_ibfk_1        | FOREIGN KEY |
| PROJETO | VENDEDORES | PRIMARY             | PRIMARY KEY |
+---------+------------+---------------------+-------------+
11 rows in set (0,00 sec)

/*APAGANDO CONSTRAINTS PELO NOME - PRECISSA ESTAR LOGADO NO BANCO QUE SE DESEJA MODIFICAR/DROPAR*/
USE PROJETO;
ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

/*REFAZENDO A CHAVE ESTRANGEIRA*/
ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE (IDCLIENTE);