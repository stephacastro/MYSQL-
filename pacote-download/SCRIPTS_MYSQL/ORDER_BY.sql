/* ORDER BY */

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1, 'JOAO');
INSERT INTO ALUNOS VALUES(1, 'MARIA');
INSERT INTO ALUNOS VALUES(2, 'ZOE');
INSERT INTO ALUNOS VALUES(2, 'ANDRE');
INSERT INTO ALUNOS VALUES(3, 'CLARA');
INSERT INTO ALUNOS VALUES(1, 'CLARA');
INSERT INTO ALUNOS VALUES(4, 'MAFRA');
INSERT INTO ALUNOS VALUES(5, 'JANAINA');
INSERT INTO ALUNOS VALUES(1, 'JANAINA');
INSERT INTO ALUNOS VALUES(3, 'MARCELO');
INSERT INTO ALUNOS VALUES(4, 'GIOVANE');
INSERT INTO ALUNOS VALUES(5, 'ANTONIO');
INSERT INTO ALUNOS VALUES(6, 'ANA');
INSERT INTO ALUNOS VALUES(6, 'VIVIANE');

/* ORDENANDO PELO NOME DA COLUNA*/
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
|      4 | GIOVANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

/* PODE ORDENAR POR 2 OPÇÕES, NOME DA COLUNA E NUMRO DA COLUNA (O NUMERO DA COLUNA É A ORDEM DA TABELA)*/

/* ORDENANDO PELO NUMERO DA COLUNA */
SELECT * FROM ALUNOS
ORDER BY 1;

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
|      4 | GIOVANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 2;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANA     |
|      2 | ANDRE   |
|      5 | ANTONIO |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | GIOVANE |
|      5 | JANAINA |
|      1 | JANAINA |
|      1 | JOAO    |
|      4 | MAFRA   |
|      3 | MARCELO |
|      1 | MARIA   |
|      6 | VIVIANE |
|      2 | ZOE     |
+--------+---------+

/* ORDENANDO POR MAIS DE UMA COLUNA */

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
|      4 | GIOVANE |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 1,2;

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
|      4 | GIOVANE |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

/* MESCLANDO ORDER BAY COM PROJEÇÃO */

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
| GIOVANE |
| MAFRA   |
| ANTONIO |
| JANAINA |
| ANA     |
| VIVIANE |
+---------+

/* ORDER BY DESC / ASC */

SELECT * FROM ALUNOS
ORDER BY 1 ASC;

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
|      4 | GIOVANE |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

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
|      4 | GIOVANE |
|      3 | CLARA   |
|      3 | MARCELO |
|      2 | ZOE     |
|      2 | ANDRE   |
|      1 | JOAO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
+--------+---------+
 
SELECT CLIENTE.NOME, CLIENTE.SEXO, IFNULL(CLIENTE.EMAIL, 'CLIENTE SEM EMAIL') AS 'E-MAIL', 
	   TELEFONE.TIPO, TELEFONE.NUMERO, 
	   ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.ESTADO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
	INNER JOIN ENDERECO 
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	ORDER BY 1;

+---------+------+--------------------+------+-----------+------------+----------------+--------+
| NOME    | SEXO | E-MAIL             | TIPO | NUMERO    | BAIRRO     | CIDADE         | ESTADO |
+---------+------+--------------------+------+-----------+------------+----------------+--------+
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 89766554  | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 77455786  | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@GMAIL.COM      | CEL  | 369894521 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@GMAIL.COM      | CEL  | 119590452 | JARDINS    | SAO PAULO      | SP     |
| ANDRE   | M    | ANDRE@GLOBO.COM    | CEL  | 99656675  | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM    | RES  | 68976565  | CASCADURA  | B. HORIZONTE   | MG     |
| ANTONIO | M    | ANTONIO@UOL.COM    | COM  | 88679978  | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@IG.COM     | CEL  | 89966809  | CENTRO     | CURITIBA       | PR     |
| CARLOS  | M    | CARLOS@OUTLOOK.COM | CEL  | 578596442 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOS@OUTLOOK.COM | COM  | 359600245 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 89955665  | LAPA       | SAO PAULO      | SP     |
| DANIELE | F    | DANIELE@GMAIL.COM  | COM  | 88687979  | COPACABANA | RIO DE JANEIRO | RJ     |
| ELAINE  | F    | ELAINE@GLOBO.COM   | CEL  | 99655768  | BOM RETIRO | CURITIBA       | PR     |
| FLAVIO  | M    | FLAVIO@IG.COM      | CEL  | 33567765  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOÃO    | M    | JOAO@IG.COM        | CEL  | 879451365 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOÃO    | M    | JOAO@IG.COM        | COM  | 325474214 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOÃO    | M    | JOAO@IG.COM        | RES  | 245789933 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | COM  | 44522578  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | RES  | 77755785  | CENTRO     | RIO DE JANEIRO | RJ     |
| JOSE    | M    | JORGE@HOTMAIL.COM  | RES  | 355478956 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@HOTMAIL.COM  | RES  | 387654153 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@HOTMAIL.COM  | CEL  | 125478963 | CENTRO     | VITORIA        | ES     |
| KARLA   | F    | KARLA@GMAIL.COM    | CEL  | 88668786  | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM    | COM  | 55689654  | CENTRO     | RIO DE JANEIRO | RJ     |
| LORENA  | F    | CLIENTE SEM EMAIL  | COM  | 88965676  | CENTRO     | VITORIA        | ES     |
| MARIANA | F    | CLIENTE SEM EMAIL  | CEL  | 88241490  | JANDIRA    | BAHIA          | BA     |
+---------+------+--------------------+------+-----------+------------+----------------+--------+

/* DELIMITADOR */

/* ; É O DELIMITADOR DO COMANDO EM SQL 
	TODO COMANDO PRECISA DE ; PARA SER EXECUTADO
*/


/* TROCANDO MEU DELIMITADOR PARA PROGRAMAR */

DELIMITER $
STATUS

DELIMITER ;