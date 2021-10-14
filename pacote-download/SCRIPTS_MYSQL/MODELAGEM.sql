/* M0DELAGEM DE BANCO DE DADOS 
      1° FORMA NORMAL */
	  
1 - TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA 

VETORES [AMARELO, AZUL, LARANJA, VERDE] -> VETOR DE CORES 
[KA, FIESTA, UNO, CIVIC] -> VETOR DE CARROS 

2 - TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA. QUANDO O CAMPO FOR DIVISÍVEL

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE TODO O REGISTRO COMO SENDO UNICO.
ISSO É O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY 

4 - CHAVE PRIMARIA IDENTIFICA UM REGISTRO INTEIRO(LINHA) COMO SENDO UNICO 

5 - CHAVE NATURAL - ELA PERTENCE AO REGISTRO 

6 - CHAVE ARTIFICIAL - ELA É CRIADA  


MODELAGEM CONCEITUAL - CRIEI NO BR MODELO 
MODELAGEM LÓGICA - CRIEI NO BR MODELO
MODELAGEM FISICA - SCRIPT 

/* AUTO_INCREMENTE - AUTO INCRIMENTAR, EU NÃO DIGO UM NÚMERO, VAI SER SEQUENCIAL E QUEM CUIDA É O BANCO (CHAVE PRIMARIA NUMERICA
QUEM CUIDA É O BANCO, ISSO É UMA BOA PRATICA)
NOT NULL - EU DIGO PARA O BANCO QUE ESSA COLUNA NÃO PODE SER NULA, OU SEJA, É UM REGISTRO OBRIGATÓRIO
ENUM - CONJUNTO ENUMERADO, UM DOMINIO QUE TEM INFORMAÇÕES FIXAS, EU DEFINO O DOMINIO (ENUM SÓ EXISTE NO MYSQL)
UNIQUE - O REGISTRO NÃO PODE SE REPETIR, ELE É UNICO */


/* CRIANDO MINHA MODELAGEM FISICA - SCRIPT */
CREATE DATABASE COMERCIO;

USE COMERCIO; 

/* APAGANDO TABELA */

DROP TABLE CLIENTE;
DROP TABLE ENDEREÇO; 
DROP TABLE TELEFONE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE	
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

ENDEREÇO OBRIGATORIO - CADASTRO DE SOMENTE UM

TELEFONE NÃO OBRIGATORIO - PODE CADASTRAR MAIS DE UM

/* CHAVE ESTRANGEIRA - É A CHAVE PRIMARIA DE UMA TABELA QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO DE 1 X N A CHAVE ESTRANGEIRA FICA NA CARDINALIDADE N */

* COMANDO PARA VER A DESCRIÇÃO DE UMA TABELA, EM QUAL FORMATO ELA FOI CRIADA 

DESC CLIENTE;

* INSERINDO DADOS NA TABELA 

INSERT INTO CLIENTE VALUES(NULL, 'JOÃO', 'M', 'JOAO@IG.COM' ,'458633641');
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'M', 'CARLOS@OUTLOOK.COM' ,'447485155');
INSERT INTO CLIENTE VALUES(NULL, 'ANA', 'F', 'ANA@GMAIL.COM' ,'458600642');
INSERT INTO CLIENTE VALUES(NULL, 'CLARA', 'F', NULL,'888633648');
INSERT INTO CLIENTE VALUES(NULL, 'JORGE', 'M', 'JORGE@HOTMAIL.COM' ,'478633680');
INSERT INTO CLIENTE VALUES(NULL, 'CELIA', 'F', 'CELIA@GMAIL.COM' ,'458633630');

SELECT * FROM CLIENTE;

+-----------+--------+------+--------------------+-----------+
| IDCLIENTE | NOME   | SEXO | EMAIL              | CPF       |
+-----------+--------+------+--------------------+-----------+
|         1 | JOÃO   | M    | JOAO@IG.COM        | 458633641 |
|         2 | CARLOS | M    | CARLOS@OUTLOOK.COM | 447485155 |
|         3 | ANA    | F    | ANA@GMAIL.COM      | 458600642 |
|         4 | CLARA  | F    | NULL               | 888633648 |
|         5 | JORGE  | M    | JORGE@HOTMAIL.COM  | 478633680 |
|         6 | CELIA  | F    | CELIA@GMAIL.COM    | 458633630 |
+-----------+--------+------+--------------------+-----------+


DESC ENDERECO;

INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'B. HORIZONTE', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL, 'RUA CAPITAO HERMES', 'CENTRO', 'RIO DE JANEIRO', 'RJ', 1);
INSERT INTO ENDERECO VALUES(NULL, 'RUA PRES VARGAS', 'JARDINS', 'SAO PAULO', 'SP', 3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA ALFANDEGA', 'ESTACIO', 'RIO DE JANEIRO', 'RJ', 2);
INSERT INTO ENDERECO VALUES(NULL, 'RUA DO OUVIDOR', 'FLAMENGO', 'RIO DE JANEIRO', 'RJ', 6);
INSERT INTO ENDERECO VALUES(NULL, 'RUA URUGUAIANA', 'CENTRO', 'VITORIA', 'ES', 5);

SELECT * FROM ENDERECO;

+------------+--------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+----------+----------------+--------+------------+
|          1 | RUA ANTONIO SA     | CENTRO   | B. HORIZONTE   | MG     |          4 |
|          2 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          3 | RUA PRES VARGAS    | JARDINS  | SAO PAULO      | SP     |          3 |
|          4 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |          2 |
|          5 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |          6 |
|          6 | RUA URUGUAIANA     | CENTRO   | VITORIA        | ES     |          5 |
+------------+--------------------+----------+----------------+--------+------------+

/* EM RELACIONAMENTO 1X1 A CHAVE ESTRANGEIRA NÃO SE REPETE */

DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL, 'CEL', '125478963', 5);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '387654153', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '879451365', 1);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '359600245', 2);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '245789933', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '119590452', 3);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '369894521', 3);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '325474214', 1);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '355478956', 5);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '578596442', 2);

SELECT * FROM TELEFONE; 

+------------+------+-----------+------------+
| IDTELEFONE | TIPO | NUMERO    | ID_CLIENTE |
+------------+------+-----------+------------+
|          1 | CEL  | 125478963 |          5 |
|          2 | RES  | 387654153 |          5 |
|          3 | CEL  | 879451365 |          1 |
|          4 | COM  | 359600245 |          2 |
|          5 | RES  | 245789933 |          1 |
|          6 | CEL  | 119590452 |          3 |
|          7 | CEL  | 369894521 |          3 |
|          8 | COM  | 325474214 |          1 |
|          9 | RES  | 355478956 |          5 |
|         10 | CEL  | 578596442 |          2 |
+------------+------+-----------+------------+