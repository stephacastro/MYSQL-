/* FAZENDO A MODELAGEM BÁSICO DE UM BANCO */

TABELA TESTE2 

NOME - CARACTER(30)
HOBBIE - CARACTER(30)
IDADE - NUMÉRICO(3)
COR - CARACTER(10)

/* CRIANDO A MODEGALEM NO BR MODELO */

MODELAGEM LÓGICA 

/* CRIANDO A MODELAGEM FISICA - SCRIPTS DE BANCO DE DADOS */

/* CRIANDO UM BANCO DE DADOS */

CREATE DATABASE TESTE2;

/* ME CONECTANDO AO BANDO DE DADOS */

USE TESTE2;

/* CRIANDO A TABELA TESTE2 */

CREATE TABLE TESTE2(
	NOME VARCHAR(30),
	HOBBIE VARCHAR(30),
	IDADE INT(3),
	COR VARCHAR(10)
);

/* VERIFICANDO AS TABELAS DO BANCO DE DADOS */

SHOW TABLES;

/* VERIFICANDO A ESTRUTURA DA MINHA TABELA */

DESC TESTE2;