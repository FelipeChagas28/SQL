-- Primeira forma normal
 /*
 
1 - Todo campo VETORIZADO se tornara outra tabela
 
[amarelo, azul, verde]
 
2 - Todo Campo multivalorado se tornara outra tabela.
Quando o campo for divisivel 
 
3 - Toda tabela necessita de pelo menos um campo que identifique todo o registro como
sendo unico.
isso e oq chamamos de chave primaria (PRIMARY KEY)
 
 
 Chave natural: CPF, nome, email etc...
 Chave artificial: IDs
 
 */
 
 
CREATE DATABASE comercio;

use comercio;

show DATABASES;

CREATE TABLE cliente(
	IDCLIENTE Int PRIMARY KEY auto_increment, -- auto_increment para gerar um id novo sempre
	nome VARCHAR(30) NOT NULL, -- NOT NULL para tornar obrigatorio o preenchimento deste campo
	sexo ENUM('M','F') NOT NULL, -- ENUM ira colocar um caixa com a opcao de escolher entre M e F
	email VARCHAR(50) UNIQUE, -- Unique deixa o campo unico, nao vai poder ter email igual
	CPF VARCHAR(15) Unique
);


CREATE TABLE endereco(

	IDENDERECO Int PRIMARY KEY auto_increment,
	rua VARCHAR(30) NOT NULL,
	bairro VARCHAR(30) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	ID_CLIENTE INT Unique, -- UNIQUE = 1x1
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES cliente(IDCLIENTE)
);

CREATE TABLE telefone(

	IDTELEFONE Int PRIMARY KEY auto_increment,
	tipo ENUM('RES','COM','CEL'),
	numero VARCHAR(10) NOT NULL,
	ID_CLIENTE INT, -- 1xN = sem UNIQUE
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES cliente(IDCLIENTE)
);

/* 

FOREIGN KEY

A chave estrangeira e a chave primaria de uma tabela que vai ate a outra tabela
para fazer referencia entre registros

- Em relacionamento 1 x 1 a chave estrangeira fica na tabela MAIS FRACA

- Em relacionamento 1x n a chave estrangeira ficara sempre na cardinalidade N

*/

use comercio;

/* Para ver a ordem das variaveis */
desc cliente;


/* Mesmo com o auto_increment, vc precisa colocar null */
insert into cliente values(NULL, 'Joao', 'M', 'Joao@gmail.com', '90238457');
insert into cliente values(NULL, 'Felipe', NULL, 'felipe@gmail.com', '92538457');
insert into cliente values(NULL, 'Pedro', 'M', 'pedro@gmail.com', '90231247');
insert into cliente values(NULL, 'Roberta', 'F', 'roberta@gmail.com', '52338457');
insert into cliente values(NULL, 'Carla', 'F', 'carla@gmail.com', '90223457');
insert into cliente values(NULL, 'Maria', 'F', 'maria@gmail.com', '90123456');
insert into cliente values(NULL, 'Bianca', 'F', 'NULL', '95323456');
