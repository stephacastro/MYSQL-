/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES LÓGICOS */

/* CONTANDO OS REGISTROS DE UMA TABELA */

SELECT COUNT(*) FROM CLIENTE;

SELECT COUNT(*) AS "Quantidade de Registros na Tab. Cliente" FROM CLIENTE;

/* OPERADOR GROUP BY */

SELECT SEXO, COUNT(*)
FROM CLIENTE
GROUP BY SEXO;

/* PERFORMANCE EM OPERADORES LÓGICOS */

/* 1 MILHÃO DE REGISTROS

PARA CONTAR
SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*) FROM CLIENTE
GROUP BY CIDADE;

CONDIÇÃO
SEXO = F
CIDADE = RIO DE JANEIRO 

SITUAÇÃO - TESTANTO COM OU / OR
70% MULHERES = SEXO = F 
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO ENDERECO
FROM CLIENTE
WHERE SEXO = 'F'
OR CIDADE = 'RIO DE JANEIRO';

SITUACAO - TRATANDO COM E / AND
70% MULHERES = SEXO F 
30% MORA BI RUI DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CIDADE = 'RIO DE JANEIRO'
AND SEXO = 'F'

*/