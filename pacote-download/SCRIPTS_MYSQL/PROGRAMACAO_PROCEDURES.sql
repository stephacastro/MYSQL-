/* STORED PROCEDURES (BLOCOS DE PROGRAMAÇÃO ARMAZENADOS NO BANCO )*/

/* ALTERAR O DELIMITER É NECESSÁRIO PARA QUE O BANCO NÃO PARE NO MEIO
DA LEITURA DE UMA PROCEDURE */
DELIMITER $

/* SITAXE DA PROCEDURE */
CREATE PROCEDURE NOME()
BEGIN 

	QUALQUER PROGRAMAÇÃO;

END 
$


CREATE PROCEDURE NOME_EMPRESA()
BEGIN

	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$

/* CHAMANDO UMA PROCEDURE */

CALL NOME_EMPRESA()$

/* MUDANDO O DELIMITER E CHAMANDO A PROCEDURE */

DELIMITER ;
CALL NOME_EMPRESA();

/* PROCEDURE COM PARAMETROS */

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN

	SELECT NUMERO1 + NUMERO2 AS CONTA;

END 
$

CALL CONTA(100, 50)$

+-------+
| CONTA |
+-------+
|   150 |
+-------+