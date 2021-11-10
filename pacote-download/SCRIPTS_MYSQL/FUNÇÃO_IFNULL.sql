/* FUNÇÃO IFNULL - UM BLOCO DE PROGRAMAÇÃO QUE RETORNA ALGUMA COISA */

/* nome, email, numero, estado */

SELECT CLIENTE.NOME, CLIENTE.EMAIL, ENDERECO.ESTADO, TELEFONE.NUMERO
FROM CLIENTE 
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+---------+--------------------+--------+-----------+
| NOME    | EMAIL              | ESTADO | NUMERO    |
+---------+--------------------+--------+-----------+
| JORGE   | JORGE@HOTMAIL.COM  | ES     | 125478963 |
| JORGE   | JORGE@HOTMAIL.COM  | ES     | 387654153 |
| JOÃO    | JOAO@IG.COM        | RJ     | 879451365 |
| CARLOS  | CARLOS@OUTLOOK.COM | RJ     | 359600245 |
| JOÃO    | JOAO@IG.COM        | RJ     | 245789933 |
| ANA     | ANA@GMAIL.COM      | SP     | 119590452 |
| ANA     | ANA@GMAIL.COM      | SP     | 369894521 |
| JOÃO    | JOAO@IG.COM        | RJ     | 325474214 |
| JORGE   | JORGE@HOTMAIL.COM  | ES     | 355478956 |
| CARLOS  | CARLOS@OUTLOOK.COM | RJ     | 578596442 |
| ANDRE   | ANDRE@GLOBO.COM    | MG     | 68976565  |
| ANDRE   | ANDRE@GLOBO.COM    | MG     | 99656675  |
| FLAVIO  | FLAVIO@IG.COM      | RJ     | 33567765  |
| KARLA   | KARLA@GMAIL.COM    | RJ     | 88668786  |
| KARLA   | KARLA@GMAIL.COM    | RJ     | 55689654  |
| DANIELE | DANIELE@GMAIL.COM  | RJ     | 88687979  |
| LORENA  | NULL               | ES     | 88965676  |
| ANTONIO | ANTONIO@IG.COM     | PR     | 89966809  |
| ANTONIO | ANTONIO@UOL.COM    | SP     | 88679978  |
| ELAINE  | ELAINE@GLOBO.COM   | PR     | 99655768  |
| CARMEM  | CARMEM@IG.COM      | SP     | 89955665  |
| ADRIANA | ADRIANA@GMAIL.COM  | RJ     | 77455786  |
| ADRIANA | ADRIANA@GMAIL.COM  | RJ     | 89766554  |
| JOICE   | JOICE@GMAIL.COM    | RJ     | 77755785  |
| JOICE   | JOICE@GMAIL.COM    | RJ     | 44522578  |
+---------+--------------------+--------+-----------+ 

INSERT INTO CLIENTE VALUES(NULL, 'MARIANA', 'F', NULL, '23478596'); 
INSERT INTO ENDERECO VALUES(NULL, 'RUA MALTA', 'JANDIRA', 'BAHIA', 'BA', 21);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '88241490', 21);


SELECT  CLIENTE.NOME, 
		IFNULL(CLIENTE.EMAIL, 'NÃO TEM EMAIL'), AS 
		ENDERECO.ESTADO, 
		TELEFONE.NUMERO
FROM CLIENTE 
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+---------+-----------------------------------------+--------+-----------+
| NOME    | IFNULL(CLIENTE.EMAIL, 'NÃO TEM EMAIL')  | ESTADO | NUMERO    |
+---------+-----------------------------------------+--------+-----------+
| JORGE   | JORGE@HOTMAIL.COM                       | ES     | 125478963 |
| JORGE   | JORGE@HOTMAIL.COM                       | ES     | 387654153 |
| JOÃO    | JOAO@IG.COM                             | RJ     | 879451365 |
| CARLOS  | CARLOS@OUTLOOK.COM                      | RJ     | 359600245 |
| JOÃO    | JOAO@IG.COM                             | RJ     | 245789933 |
| ANA     | ANA@GMAIL.COM                           | SP     | 119590452 |
| ANA     | ANA@GMAIL.COM                           | SP     | 369894521 |
| JOÃO    | JOAO@IG.COM                             | RJ     | 325474214 |
| JORGE   | JORGE@HOTMAIL.COM                       | ES     | 355478956 |
| CARLOS  | CARLOS@OUTLOOK.COM                      | RJ     | 578596442 |
| ANDRE   | ANDRE@GLOBO.COM                         | MG     | 68976565  |
| ANDRE   | ANDRE@GLOBO.COM                         | MG     | 99656675  |
| FLAVIO  | FLAVIO@IG.COM                           | RJ     | 33567765  |
| KARLA   | KARLA@GMAIL.COM                         | RJ     | 88668786  |
| KARLA   | KARLA@GMAIL.COM                         | RJ     | 55689654  |
| DANIELE | DANIELE@GMAIL.COM                       | RJ     | 88687979  |
| LORENA  | NÃO TEM EMAIL                           | ES     | 88965676  |
| ANTONIO | ANTONIO@IG.COM                          | PR     | 89966809  |
| ANTONIO | ANTONIO@UOL.COM                         | SP     | 88679978  |
| ELAINE  | ELAINE@GLOBO.COM                        | PR     | 99655768  |
| CARMEM  | CARMEM@IG.COM                           | SP     | 89955665  |
| ADRIANA | ADRIANA@GMAIL.COM                       | RJ     | 77455786  |
| ADRIANA | ADRIANA@GMAIL.COM                       | RJ     | 89766554  |
| JOICE   | JOICE@GMAIL.COM                         | RJ     | 77755785  |
| JOICE   | JOICE@GMAIL.COM                         | RJ     | 44522578  |
| MARIANA | NÃO TEM EMAIL                           | BA     | 88241490  |
+---------+-----------------------------------------+--------+-----------+

SELECT  CLIENTE.NOME, 
		IFNULL(CLIENTE.EMAIL, 'NÃO TEM EMAIL') AS 'E-MAIL', 
		ENDERECO.ESTADO, 
		TELEFONE.NUMERO
FROM CLIENTE 
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+---------+--------------------+--------+-----------+
| NOME    | E-MAIL             | ESTADO | NUMERO    |
+---------+--------------------+--------+-----------+
| JORGE   | JORGE@HOTMAIL.COM  | ES     | 125478963 |
| JORGE   | JORGE@HOTMAIL.COM  | ES     | 387654153 |
| JOÃO    | JOAO@IG.COM        | RJ     | 879451365 |
| CARLOS  | CARLOS@OUTLOOK.COM | RJ     | 359600245 |
| JOÃO    | JOAO@IG.COM        | RJ     | 245789933 |
| ANA     | ANA@GMAIL.COM      | SP     | 119590452 |
| ANA     | ANA@GMAIL.COM      | SP     | 369894521 |
| JOÃO    | JOAO@IG.COM        | RJ     | 325474214 |
| JORGE   | JORGE@HOTMAIL.COM  | ES     | 355478956 |
| CARLOS  | CARLOS@OUTLOOK.COM | RJ     | 578596442 |
| ANDRE   | ANDRE@GLOBO.COM    | MG     | 68976565  |
| ANDRE   | ANDRE@GLOBO.COM    | MG     | 99656675  |
| FLAVIO  | FLAVIO@IG.COM      | RJ     | 33567765  |
| KARLA   | KARLA@GMAIL.COM    | RJ     | 88668786  |
| KARLA   | KARLA@GMAIL.COM    | RJ     | 55689654  |
| DANIELE | DANIELE@GMAIL.COM  | RJ     | 88687979  |
| LORENA  | NÃO TEM EMAIL      | ES     | 88965676  |
| ANTONIO | ANTONIO@IG.COM     | PR     | 89966809  |
| ANTONIO | ANTONIO@UOL.COM    | SP     | 88679978  |
| ELAINE  | ELAINE@GLOBO.COM   | PR     | 99655768  |
| CARMEM  | CARMEM@IG.COM      | SP     | 89955665  |
| ADRIANA | ADRIANA@GMAIL.COM  | RJ     | 77455786  |
| ADRIANA | ADRIANA@GMAIL.COM  | RJ     | 89766554  |
| JOICE   | JOICE@GMAIL.COM    | RJ     | 77755785  |
| JOICE   | JOICE@GMAIL.COM    | RJ     | 44522578  |
| MARIANA | NÃO TEM EMAIL      | BA     | 88241490  |
+---------+--------------------+--------+-----------+