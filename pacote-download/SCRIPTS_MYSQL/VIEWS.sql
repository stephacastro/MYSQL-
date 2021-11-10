/* VIEW - É UM PONTEIRO QUE APONTA PARA A QUERY */
 
SELECT CLIENTE.NOME, CLIENTE.SEXO, CLIENTE.EMAIL, 
	   TELEFONE.TIPO, TELEFONE.NUMERO, 
	   ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.ESTADO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
	INNER JOIN ENDERECO 
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE;

+---------+------+--------------------+------+-----------+------------+----------------+--------+
| NOME    | SEXO | EMAIL              | TIPO | NUMERO    | BAIRRO     | CIDADE         | ESTADO |
+---------+------+--------------------+------+-----------+------------+----------------+--------+
| JORGE   | M    | JORGE@HOTMAIL.COM  | CEL  | 125478963 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@HOTMAIL.COM  | RES  | 387654153 | CENTRO     | VITORIA        | ES     |
| JOÃO    | M    | JOAO@IG.COM        | CEL  | 879451365 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@OUTLOOK.COM | COM  | 359600245 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOÃO    | M    | JOAO@IG.COM        | RES  | 245789933 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@GMAIL.COM      | CEL  | 119590452 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@GMAIL.COM      | CEL  | 369894521 | JARDINS    | SAO PAULO      | SP     |
| JOÃO    | M    | JOAO@IG.COM        | COM  | 325474214 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | JORGE@HOTMAIL.COM  | RES  | 355478956 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOS@OUTLOOK.COM | CEL  | 578596442 | ESTACIO    | RIO DE JANEIRO | RJ     |
| ANDRE   | M    | ANDRE@GLOBO.COM    | RES  | 68976565  | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM    | CEL  | 99656675  | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM      | CEL  | 33567765  | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM    | CEL  | 88668786  | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM    | COM  | 55689654  | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM  | COM  | 88687979  | COPACABANA | RIO DE JANEIRO | RJ     |
| LORENA  | F    | NULL               | COM  | 88965676  | CENTRO     | VITORIA        | ES     |
| ANTONIO | M    | ANTONIO@IG.COM     | CEL  | 89966809  | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@UOL.COM    | COM  | 88679978  | JARDINS    | SAO PAULO      | SP     |
| ELAINE  | F    | ELAINE@GLOBO.COM   | CEL  | 99655768  | BOM RETIRO | CURITIBA       | PR     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 89955665  | LAPA       | SAO PAULO      | SP     |
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 77455786  | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 89766554  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | RES  | 77755785  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | COM  | 44522578  | CENTRO     | RIO DE JANEIRO | RJ     |
| MARIANA | F    | NULL               | CEL  | 88241490  | JANDIRA    | BAHIA          | BA     |
+---------+------+--------------------+------+-----------+------------+----------------+--------+

/* CRIANDO UMA VIEW */

CREATE VIEW RELATORIO AS 
SELECT CLIENTE.NOME, CLIENTE.SEXO, CLIENTE.EMAIL, 
	   TELEFONE.TIPO, TELEFONE.NUMERO, 
	   ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.ESTADO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
	INNER JOIN ENDERECO 
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE;

/* CHAMANDO MINHA VIEW */

SELECT * FROM RELATORIO;

+---------+------+--------------------+------+-----------+------------+----------------+--------+
| NOME    | SEXO | EMAIL              | TIPO | NUMERO    | BAIRRO     | CIDADE         | ESTADO |
+---------+------+--------------------+------+-----------+------------+----------------+--------+
| JORGE   | M    | JORGE@HOTMAIL.COM  | CEL  | 125478963 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@HOTMAIL.COM  | RES  | 387654153 | CENTRO     | VITORIA        | ES     |
| JOÃO    | M    | JOAO@IG.COM        | CEL  | 879451365 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@OUTLOOK.COM | COM  | 359600245 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOÃO    | M    | JOAO@IG.COM        | RES  | 245789933 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@GMAIL.COM      | CEL  | 119590452 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@GMAIL.COM      | CEL  | 369894521 | JARDINS    | SAO PAULO      | SP     |
| JOÃO    | M    | JOAO@IG.COM        | COM  | 325474214 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | JORGE@HOTMAIL.COM  | RES  | 355478956 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOS@OUTLOOK.COM | CEL  | 578596442 | ESTACIO    | RIO DE JANEIRO | RJ     |
| ANDRE   | M    | ANDRE@GLOBO.COM    | RES  | 68976565  | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM    | CEL  | 99656675  | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM      | CEL  | 33567765  | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM    | CEL  | 88668786  | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM    | COM  | 55689654  | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM  | COM  | 88687979  | COPACABANA | RIO DE JANEIRO | RJ     |
| LORENA  | F    | NULL               | COM  | 88965676  | CENTRO     | VITORIA        | ES     |
| ANTONIO | M    | ANTONIO@IG.COM     | CEL  | 89966809  | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@UOL.COM    | COM  | 88679978  | JARDINS    | SAO PAULO      | SP     |
| ELAINE  | F    | ELAINE@GLOBO.COM   | CEL  | 99655768  | BOM RETIRO | CURITIBA       | PR     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 89955665  | LAPA       | SAO PAULO      | SP     |
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 77455786  | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 89766554  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | RES  | 77755785  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | COM  | 44522578  | CENTRO     | RIO DE JANEIRO | RJ     |
| MARIANA | F    | NULL               | CEL  | 88241490  | JANDIRA    | BAHIA          | BA     |
+---------+------+--------------------+------+-----------+------------+----------------+--------+

/* LOCALIZANDO MINHAS VIEWS NO BANDO DE DADOS */

/* AS VIEWS SÃO MOSTRADAS JUNTO COM AS TABELAS */

SHOW TABLES;

/* APAGANDO UMA VIEW */

DROP VIEW RELATORIO;

/* CRIANDO NOVAMENTE UMA VIEW E COLOCANDO UM PREFIXO DE IDENTIFICAÇÃO */

CREATE VIEW V_RELATORIO AS 
SELECT CLIENTE.NOME, CLIENTE.SEXO, IFNULL(CLIENTE.EMAIL, 'CLIENTE SEM EMAIL') AS 'E-MAIL', 
	   TELEFONE.TIPO, TELEFONE.NUMERO, 
	   ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.ESTADO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
	INNER JOIN ENDERECO 
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE;

SHOW TABLES;

+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| telefone           |
| v_relatorio        |
+--------------------+

SELECT NOME, NUMERO, ESTADO 
FROM V_RELATORIO;

+---------+-----------+--------+
| NOME    | NUMERO    | ESTADO |
+---------+-----------+--------+
| JORGE   | 125478963 | ES     |
| JORGE   | 387654153 | ES     |
| JOÃO    | 879451365 | RJ     |
| CARLOS  | 359600245 | RJ     |
| JOÃO    | 245789933 | RJ     |
| ANA     | 119590452 | SP     |
| ANA     | 369894521 | SP     |
| JOÃO    | 325474214 | RJ     |
| JORGE   | 355478956 | ES     |
| CARLOS  | 578596442 | RJ     |
| ANDRE   | 68976565  | MG     |
| ANDRE   | 99656675  | MG     |
| FLAVIO  | 33567765  | RJ     |
| KARLA   | 88668786  | RJ     |
| KARLA   | 55689654  | RJ     |
| DANIELE | 88687979  | RJ     |
| LORENA  | 88965676  | ES     |
| ANTONIO | 89966809  | PR     |
| ANTONIO | 88679978  | SP     |
| ELAINE  | 99655768  | PR     |
| CARMEM  | 89955665  | SP     |
| ADRIANA | 77455786  | RJ     |
| ADRIANA | 89766554  | RJ     |
| JOICE   | 77755785  | RJ     |
| JOICE   | 44522578  | RJ     |
| MARIANA | 88241490  | BA     |
+---------+-----------+--------+