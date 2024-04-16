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
insert into cliente values(NULL, 'Eduarda', 'F', NULL, '95323358');

desc endereco;

insert into endereco values(NULL, 'Rua flamengo','Caxias','Bangu','RJ', 32);

insert into endereco values(NULL, 'Rua faria','balde','Belo horizonte','MG', 2);
insert into endereco values(NULL, 'Rua fernando','Lima','Sao Paulo','SP', 5);
insert into endereco values(NULL, 'Rua Bernaldo','baixada','Rio de Janeiro','RJ', 1);
insert into endereco values(NULL, 'Rua castilho','Trombone','Uberaba','MG', 3);
insert into endereco values(NULL, 'Rua do ferro','castor','Vitoria','ES', 6);
insert into endereco values(NULL, 'Rua montanha','monte','Bauru','SP', 4);

desc telefone;

insert into telefone values(NULL, 'RES','78902347',3);
insert into telefone values(NULL, 'CEL','90852345',5);
insert into telefone values(NULL, 'COM','63454234',3);
insert into telefone values(NULL, 'CEL','07895398',2);
insert into telefone values(NULL, 'CEL','20356783',2);
insert into telefone values(NULL, 'COM','90903465',4);
insert into telefone values(NULL, 'RES','45364355',1);
insert into telefone values(NULL, 'RES','23947858',2);

SELECT * FROM telefone;

/* SELECAO E PROJECAO */

SELECT nome, sexo, email -- PROJECAO
from cliente -- ORIGEM
where sexo = 'F'; -- SELECAO

/* NO SQL A PROJECAO E SEMPRE GARANTIDA, MAS A PROJECAO NAO */
/* WHERE (FILTRO), VAI DEPENDER SE VC QUER FILTRAR OU NAO */

/*juncao -> JOIN*/

SELECT NOME, SEXO, BAIRRO, CIDADE -- PROJECAO
FROM cliente -- ORIGEM
	INNER JOIN endereco -- JUNCAO
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; -- SELECAO

SELECT nome, sexo, email, tipo, numero
from cliente
	INNER JOIN telefone
	on IDCLIENTE = ID_CLIENTE
where tipo = "COM";

/* trazer NOME, SEXO, BAIRRO, CIDADE, TIPO E NUMERO */

SELECT cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero
from cliente
	INNER JOIN telefone
	on cliente.IDCLIENTE = telefone.ID_CLIENTE
	INNER JOIN endereco
	on cliente.IDCLIENTE = endereco.ID_CLIENTE;
	

/* OUTRO JEITO DE FAZER A PONTERAMENTO */

SELECT C.nome, C.sexo, E.bairro, E.cidade, T.tipo, T.numero
from cliente C 
	INNER JOIN telefone T
	on C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN endereco E
	on C.IDCLIENTE = E.ID_CLIENTE;

	-- SO DE COLOCAR O C NA FRENTE, VC JA DA O NOME PRA VARIAVEL -- 










/*


	DML - DATA MANIPULATION LANGUAGE
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCL - TRANSACTION CONTROL LANGUAGE


*/





/* COMANDOS DML */

insert into cliente values(NULL, "Clara", "M", null, "23847964");
insert into endereco values(NULL, "Bastao", "palmeira", "Rio de Janeiro", "RJ", 9);

/* FILTROS */

SELECT * from cliente
	where sexo = "M";

/* UPDATE */

SELECT * from cliente
	where IDCLIENTE = 9;

UPDATE cliente
	set sexo = "F"
	where IDCLIENTE = 9;

/* DELETE */

insert into cliente values(null, "xxx", "f", null, "xxx");

SELECT * from cliente
	where IDCLIENTE = 10;

DELETE from cliente
	where IDCLIENTE = 10;




/* DDL - DATA DEFINITION LANGUAGE */

CREATE table produto(
	IDPRODUTO INT PRIMARY KEY auto_increment,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */

/* ALTERNANDO O NOME DE UMA COL*/

ALTER TABLE produto
change preco valor_unitario int NOT null; -- MUDANDO O NOME DE PRECO PRA VALOR UNITARIO

alter table produto
change valor_unitario valor_unitario int not null;

desc produto;

/* MODIFY - ALTERANDO O TIPO*/

alter table produto
MODIFY valor_unitario VARCHAR(50) not null;

/* ADICIONANDO COLUNAS*/

alter table produto
add peso float(10,2) not null;

/* APAGANDO UMA COLUNA*/

alter table produto
drop column peso;


/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

alter table produto
add column peso float(10,2) not null
after NOME_PRODUTO;


alter table produto
drop column peso;

alter table produto
add column peso float(10,2) not null
first;