/* SELEÇAO ,  PROJEÇÃO, JUNÇÃO */

/* PROJEÇÃO -> É TUDO QUE VOCÊ QUER VER NA TELA (TUDO QUE VAI SER MOSTRADO NA TELA) */
/* PROJETANDO UMA CALUNA QUE TRAS DATA E HORA DANDO UM APELIDO PARA A COLUNA */
SELECT NOW() AS DATA_ATUAL;



/* SELEÇÃO -> FILTRAR, É UM SUBCONJUNO DE UM CONJUNTO TOTAL DE REGISTROS DE UMA TABELA 
A CLAUSULA DE SELEÇÃO É O WHERE*/
SELECT NOME, SEXO, EMAIL /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELEÇÃO */

SELECT NUMERO /* PROJEÇÃO */
FROM TELEFONE /* ORIGEM */
WHERE TIPO = 'CEL'; /* SELEÇÃO */



/* JUNÇÃO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE; 

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+--------+--------------------+-----------+
| NOME   | EMAIL              | IDCLIENTE |
+--------+--------------------+-----------+
| JOÃO   | JOAO@IG.COM        |         1 |
| CARLOS | CARLOS@OUTLOOK.COM |         2 |
| ANA    | ANA@GMAIL.COM      |         3 |
| CLARA  | NULL               |         4 |
| JORGE  | JORGE@HOTMAIL.COM  |         5 |
| CELIA  | CELIA@GMAIL.COM    |         6 |
+--------+--------------------+-----------+

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | B. HORIZONTE   |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+


/* JUNÇÃO COM WHERE FUNCIONA - MAS NÃO É RECOMENDADO */
/* NOME, SEXO, BAIRRO, CIDADE */
SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOÃO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDINS  | SAO PAULO      |
| CLARA | F    | CENTRO   | B. HORIZONTE   |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+

/* UTILIZANDO O JOIN */
/* INNER COMBINA AS TABELAS */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
INNER JOIN ENDERECO /* SELEÇÃO */
ON IDCLIENTE = ID_CLIENTE; 

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOÃO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+


SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /* JUNÇÃO */
	ON IDCLIENTE = ID_CLIENTE /* CONDIÇÃO QUE JUNTA UMA TABELA NA OUTRA */
WHERE SEXO = 'F'; /* SELEÇÃO */

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDINS  | SAO PAULO      |
| CLARA | F    | CENTRO   | B. HORIZONTE   |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+

/* OUTRO EXEMPLO DE JOIN */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE 
ON IDCLIENTE = ID_CLIENTE;

+--------+------+--------------------+------+-----------+
| NOME   | SEXO | EMAIL              | TIPO | NUMERO    |
+--------+------+--------------------+------+-----------+
| JOÃO   | M    | JOAO@IG.COM        | CEL  | 879451365 |
| JOÃO   | M    | JOAO@IG.COM        | RES  | 245789933 |
| JOÃO   | M    | JOAO@IG.COM        | COM  | 325474214 |
| CARLOS | M    | CARLOS@OUTLOOK.COM | COM  | 359600245 |
| CARLOS | M    | CARLOS@OUTLOOK.COM | CEL  | 578596442 |
| ANA    | F    | ANA@GMAIL.COM      | CEL  | 119590452 |
| ANA    | F    | ANA@GMAIL.COM      | CEL  | 369894521 |
| JORGE  | M    | JORGE@HOTMAIL.COM  | CEL  | 125478963 |
| JORGE  | M    | JORGE@HOTMAIL.COM  | RES  | 387654153 |
| JORGE  | M    | JORGE@HOTMAIL.COM  | RES  | 355478956 |
+--------+------+--------------------+------+-----------+


/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

/* QUANDO DER AMBIGUIDADE PONTERAMOS AS TABELAS */
SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+------+-----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO    |
+--------+------+---------+----------------+------+-----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 125478963 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 387654153 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 879451365 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 359600245 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 245789933 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 119590452 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 369894521 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 325474214 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 355478956 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 578596442 |
+--------+------+---------+----------------+------+-----------+


/* OUTRA FORMA DE ESCREVER */
/* DANDO ALIAS (APELIDO) PARA AS TABELAS */

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+----------------+------+-----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO    |
+--------+------+---------+----------------+------+-----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 125478963 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 387654153 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 879451365 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 359600245 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 245789933 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 119590452 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 369894521 |
| JOÃO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 325474214 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 355478956 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 578596442 |
+--------+------+---------+----------------+------+-----------+