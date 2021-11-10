/* EXERCICIO DE DML - MANIPULAÇÃO DE DADOS */

/* INSERINDO OS DADOS DA MINHA TABELA */

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

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',8);
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


/* CADASTRE TELEFONES PARA OS CLIENTES */

INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',8);
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

DESC CLIENTE;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

DESC TELEFONE;
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

DESC ENDERECO;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

/* RELATÓRIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDEREÇO TAMBÉM)*/

SELECT CLIENTE.IDCLIENTE, CLIENTE.NOME, CLIENTE.SEXO, CLIENTE.EMAIL, CLIENTE.CPF, 
	   TELEFONE.TIPO, TELEFONE.NUMERO, 
	   ENDERECO.RUA, ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.ESTADO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE;

+-----------+---------+------+--------------------+-----------+------+-----------+--------------------+------------+----------------+--------+
| IDCLIENTE | NOME    | SEXO | EMAIL              | CPF       | TIPO | NUMERO    | RUA                | BAIRRO     | CIDADE         | ESTADO |
+-----------+---------+------+--------------------+-----------+------+-----------+--------------------+------------+----------------+--------+
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM  | 478633680 | CEL  | 125478963 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM  | 478633680 | RES  | 387654153 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |
|         1 | JOÃO    | M    | JOAO@IG.COM        | 458633641 | CEL  | 879451365 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | CARLOS  | M    | CARLOS@OUTLOOK.COM | 447485155 | COM  | 359600245 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |
|         1 | JOÃO    | M    | JOAO@IG.COM        | 458633641 | RES  | 245789933 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |
|         3 | ANA     | F    | ANA@GMAIL.COM      | 458600642 | CEL  | 119590452 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |
|         3 | ANA     | F    | ANA@GMAIL.COM      | 458600642 | CEL  | 369894521 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |
|         1 | JOÃO    | M    | JOAO@IG.COM        | 458633641 | COM  | 325474214 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM  | 478633680 | RES  | 355478956 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |
|         2 | CARLOS  | M    | CARLOS@OUTLOOK.COM | 447485155 | CEL  | 578596442 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM    | 7687567   | RES  | 68976565  | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM    | 7687567   | CEL  | 99656675  | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM      | 4657765   | CEL  | 33567765  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | KARLA   | M    | KARLA@GMAIL.COM    | 545676778 | CEL  | 88668786  | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | KARLA   | M    | KARLA@GMAIL.COM    | 545676778 | COM  | 55689654  | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM  | 43536789  | COM  | 88687979  | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |
|        13 | LORENA  | M    | NULL               | 774557887 | COM  | 88965676  | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |
|        15 | ANTONIO | F    | ANTONIO@IG.COM     | 12436767  | CEL  | 89966809  | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM    | 3423565   | COM  | 88679978  | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM   | 32567763  | CEL  | 99655768  | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |
|        18 | CARMEM  | M    | CARMEM@IG.COM      | 787832213 | RES  | 89955665  | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM  | 88556942  | RES  | 77455786  | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM  | 88556942  | RES  | 89766554  | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | JOICE   | F    | JOICE@GMAIL.COM    | 55412256  | RES  | 77755785  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | JOICE   | F    | JOICE@GMAIL.COM    | 55412256  | COM  | 44522578  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |
+-----------+---------+------+--------------------+-----------+------+-----------+--------------------+------------+----------------+--------+

/* RELATORIO DE HOMENS */

SELECT CLIENTE.IDCLIENTE, CLIENTE.NOME, CLIENTE.SEXO, CLIENTE.EMAIL, CLIENTE.CPF, 
	   TELEFONE.TIPO, TELEFONE.NUMERO, 
	   ENDERECO.RUA, ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.ESTADO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE 
WHERE SEXO = 'M';

+-----------+---------+------+--------------------+-----------+------+-----------+--------------------+------------+----------------+--------+
| IDCLIENTE | NOME    | SEXO | EMAIL              | CPF       | TIPO | NUMERO    | RUA                | BAIRRO     | CIDADE         | ESTADO |
+-----------+---------+------+--------------------+-----------+------+-----------+--------------------+------------+----------------+--------+
|         1 | JOÃO    | M    | JOAO@IG.COM        | 458633641 | CEL  | 879451365 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | JOÃO    | M    | JOAO@IG.COM        | 458633641 | RES  | 245789933 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |
|         1 | JOÃO    | M    | JOAO@IG.COM        | 458633641 | COM  | 325474214 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |
|         2 | CARLOS  | M    | CARLOS@OUTLOOK.COM | 447485155 | COM  | 359600245 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |
|         2 | CARLOS  | M    | CARLOS@OUTLOOK.COM | 447485155 | CEL  | 578596442 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM  | 478633680 | CEL  | 125478963 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM  | 478633680 | RES  | 387654153 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |
|         5 | JORGE   | M    | JORGE@HOTMAIL.COM  | 478633680 | RES  | 355478956 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM      | 4657765   | CEL  | 33567765  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM    | 7687567   | RES  | 68976565  | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM    | 7687567   | CEL  | 99656675  | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM  | 43536789  | COM  | 88687979  | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |
|        13 | LORENA  | M    | NULL               | 774557887 | COM  | 88965676  | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM    | 3423565   | COM  | 88679978  | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM   | 32567763  | CEL  | 99655768  | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |
|        18 | CARMEM  | M    | CARMEM@IG.COM      | 787832213 | RES  | 89955665  | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |
+-----------+---------+------+--------------------+-----------+------+-----------+--------------------+------------+----------------+--------+

/* ENCONTREI DUAS MULHERES COM E SEXO ERRADO - VOU FAZER UM UPDATE DESSES DADOS */
 /* ID 11, 12 E 13, 17, 18*/
 
 UPDATE CLIENTE 
 SET SEXO = 'F'
 WHERE IDCLIENTE = 11;

 UPDATE CLIENTE 
 SET SEXO = 'F'
 WHERE IDCLIENTE = 12;

 UPDATE CLIENTE 
 SET SEXO = 'F'
 WHERE IDCLIENTE = 13;

 UPDATE CLIENTE 
 SET SEXO = 'F'
 WHERE IDCLIENTE = 17;

 UPDATE CLIENTE 
 SET SEXO = 'F'
 WHERE IDCLIENTE = 18;

 /* OTMIZANDO MEU UPDATE */

 /*ME CERTIFICANDO DOS REGISTROS QUE QUERO ALTERAR */

 SELECT * FROM CLIENTE 
 WHERE IDCLIENTE = 11
 OR IDCLIENTE = 12
 OR IDCLIENTE = 13
 OR IDCLIENTE = 17
 OR IDCLIENTE = 18;

 SELECT * FROM CLIENTE 
 WHERE IDCLIENTE IN (11, 12, 13, 17, 18);

UPDATE CLIENTE SET SEXO = 'F'
WHERE IDCLIENTE IN (11, 12, 13, 17, 18);


/* RELATÓRIO DE MULHETES */

SELECT CLIENTE.IDCLIENTE, CLIENTE.NOME, CLIENTE.SEXO, CLIENTE.EMAIL, CLIENTE.CPF, 
       TELEFONE.TIPO, TELEFONE.NUMERO, 
       ENDERECO.RUA, ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.ESTADO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE 
WHERE SEXO = 'F';

+-----------+---------+------+-------------------+-----------+------+-----------+--------------------+---------+----------------+--------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       | TIPO | NUMERO    | RUA                | BAIRRO  | CIDADE         | ESTADO |
+-----------+---------+------+-------------------+-----------+------+-----------+--------------------+---------+----------------+--------+
|         3 | ANA     | F    | ANA@GMAIL.COM     | 458600642 | CEL  | 119590452 | RUA PRES VARGAS    | JARDINS | SAO PAULO      | SP     |
|         3 | ANA     | F    | ANA@GMAIL.COM     | 458600642 | CEL  | 369894521 | RUA PRES VARGAS    | JARDINS | SAO PAULO      | SP     |
|        15 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767  | CEL  | 89966809  | AV CAPITAO ANTUNES | CENTRO  | CURITIBA       | PR     |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  | RES  | 77455786  | RUA GERONIMO       | CENTRO  | RIO DE JANEIRO | RJ     |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  | RES  | 89766554  | RUA GERONIMO       | CENTRO  | RIO DE JANEIRO | RJ     |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  | RES  | 77755785  | RUA GOMES FREIRE   | CENTRO  | RIO DE JANEIRO | RJ     |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  | COM  | 44522578  | RUA GOMES FREIRE   | CENTRO  | RIO DE JANEIRO | RJ     |
+-----------+---------+------+-------------------+-----------+------+-----------+--------------------+---------+----------------+--------+

UPDATE CLIENTE 
SET SEXO = 'M'
WHERE IDCLIENTE = 15;

+-----------+---------+------+-------------------+-----------+------+-----------+--------------------+------------+----------------+--------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       | TIPO | NUMERO    | RUA                | BAIRRO     | CIDADE         | ESTADO |
+-----------+---------+------+-------------------+-----------+------+-----------+--------------------+------------+----------------+--------+
|         3 | ANA     | F    | ANA@GMAIL.COM     | 458600642 | CEL  | 119590452 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |
|         3 | ANA     | F    | ANA@GMAIL.COM     | 458600642 | CEL  | 369894521 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 | CEL  | 88668786  | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 | COM  | 55689654  | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  | COM  | 88687979  | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |
|        13 | LORENA  | F    | NULL              | 774557887 | COM  | 88965676  | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  | CEL  | 99655768  | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 | RES  | 89955665  | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  | RES  | 77455786  | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  | RES  | 89766554  | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  | RES  | 77755785  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  | COM  | 44522578  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |
+-----------+---------+------+-------------------+-----------+------+-----------+--------------------+------------+----------------+--------+


/* QUANTIDADE DE HOMENS E MULHERES */

SELECT COUNT(*) AS QUANTIDADE, SEXO 
FROM CLIENTE  
GROUP BY SEXO;

+------------+------+
| QUANTIDADE | SEXO |
+------------+------+
|          8 | M    |
|         12 | F    |
+------------+------+

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NÃO TENHAM CELULAR */

SELECT CLIENTE.IDCLIENTE, CLIENTE.EMAIL, ENDERECO.ESTADO, ENDERECO.BAIRRO, TELEFONE.NUMERO, CLIENTE.NOME, CLIENTE.SEXO,
	   TELEFONE.TIPO
FROM CLIENTE 
	INNER JOIN ENDERECO 
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE 
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'RJ' 
AND CIDADE = 'RIO DE JANEIRO'
AND BAIRRO = 'CENTRO'
AND (TIPO = 'RES' OR TIPO = 'COM');

+-----------+-------------------+--------+--------+----------+---------+------+------+
| IDCLIENTE | EMAIL             | ESTADO | BAIRRO | NUMERO   | NOME    | SEXO | TIPO |
+-----------+-------------------+--------+--------+----------+---------+------+------+
|        11 | KARLA@GMAIL.COM   | RJ     | CENTRO | 55689654 | KARLA   | F    | COM  |
|        19 | ADRIANA@GMAIL.COM | RJ     | CENTRO | 77455786 | ADRIANA | F    | RES  |
|        19 | ADRIANA@GMAIL.COM | RJ     | CENTRO | 89766554 | ADRIANA | F    | RES  |
|        20 | JOICE@GMAIL.COM   | RJ     | CENTRO | 77755785 | JOICE   | F    | RES  |
|        20 | JOICE@GMAIL.COM   | RJ     | CENTRO | 44522578 | JOICE   | F    | COM  |
+-----------+-------------------+--------+--------+----------+---------+------+------+

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO 
PARA O PROGRAMADOR */ 

DESC ENDERECO;
SELECT * FROM ENDERECO;
SELECT * FROM TELEFONE;

SELECT CLIENTE.NOME, CLIENTE.EMAIL, TELEFONE.NUMERO, TELEFONE.TIPO, ENDERECO.ESTADO /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
	INNER JOIN TELEFONE /* JUNÇÃO */
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE /* JUNÇÃO - CONDIÇÃO */
	INNER JOIN ENDERECO /* JUNÇÃO */
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE /* JUNÇÃO - CONDIÇÃO */
WHERE TIPO = 'CEL' /* SELEÇÃO */
AND ESTADO = 'RJ'; /* SELEÇÃO */

+--------+--------------------+-----------+------+--------+
| NOME   | EMAIL              | NUMERO    | TIPO | ESTADO |
+--------+--------------------+-----------+------+--------+
| JOÃO   | JOAO@IG.COM        | 879451365 | CEL  | RJ     |
| CARLOS | CARLOS@OUTLOOK.COM | 578596442 | CEL  | RJ     |
| FLAVIO | FLAVIO@IG.COM      | 33567765  | CEL  | RJ     |
| KARLA  | KARLA@GMAIL.COM    | 88668786  | CEL  | RJ     |
+--------+--------------------+-----------+------+--------+

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA 
O PROGRAMADOR */

SELECT CLIENTE.NOME, CLIENTE.EMAIL, ENDERECO.ESTADO, TELEFONE.NUMERO AS CELULAR 
FROM CLIENTE 
	INNER JOIN ENDERECO 
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE 
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'SP'
AND TIPO = 'CEL';

+------+---------------+--------+-----------+
| NOME | EMAIL         | ESTADO | CELULAR   |
+------+---------------+--------+-----------+
| ANA  | ANA@GMAIL.COM | SP     | 119590452 |
| ANA  | ANA@GMAIL.COM | SP     | 369894521 |
+------+---------------+--------+-----------+
