/* OPERADORES LÓGICOS 
OR -> PARA QUE A SAIDA SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDIÇÃO SEJA VERDADEIRA
AND -> PARA QUE A SAIDA SEJA VERDADEIRA, TODAS AS CONDIÇÕES PRECISAM SER VERDADEIRAS 
*/

/*OR - OU */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE 
WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ';
