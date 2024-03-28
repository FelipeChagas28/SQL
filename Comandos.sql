/* modelagem basica */

/* Entidade = Tabelas //// Campos = Atributos */


cliente

nome - caracter(30)
cpf - numerico(11)
email - Caracter (30)
telefone - caracter(30)
endereco - caracter(30)
sexo - caracter(1)

/* processos de modelagem */

/* fase 1 e 2 - AD adm de dados */

Modelagem conceitual - Rascunho, ver oq o cliente quer
modelagem logica - programa de modelagem

/* Fase 3 - DBA / AD */

modelagem fisica - scripts de banco

/* iniciando a modelagem fisica */

/* criando uma DATABASE */

create DATABASE projeto;

/* conectando-se ao banco */

USE projeto;

/* criando a tabela de clientes */

create table cliente(
	nome VARCHAR(30),
	sexo CHAR(1),
	email VARCHAR(30),
	cpf int(11),
	telefone VARCHAR(30),
	endereco VARCHAR(100)

);

/*8 verificando as tabelas do banco */

show tables;

/* Descobrindo qual a estrutura de uma tabela */

DESC cliente;


/* Trocando as informacoes na tabela */

insert into cliente values('Felipe', 'M', 'felipe@gmail.com', 183294290, '159023854', 
'Rua fernando de zap da silva - Rio Branco - AC');

insert into cliente values('Raquel', 'F', 'raquel@gmail.com', 474624290, '159009874', 
'Rua fernando da silva - Minas gerais - MG'),
						  ('Clodoalda', 'F', 'Clodoalda@gmail.com', 1098765432, '12836787',
						  'Farinha de trigo - sao paulo - SP');

insert into cliente(nome, sexo, email, cpf, telefone, endereco) values ('ricardo', 'M', 'ricardo@hotmail.com', 
1234567891, '3029480239', 'Belford roxo - RJ');

insert into cliente(nome, sexo, telefone, cpf) values('Tabata', 'F', '8237468639', 1324567891);

/* usando o comando SELECT */

SELECT now ();

SELECT 'Felipe'; /* ele vai me mostrar 'Felipe' so */

/* ALIAS DE COLUNAS */

SELECT nome, sexo, email from cliente;

/* Mostrando os dados do cliente so que trocando o titulo da tabela de nome para cliente */

SELECT nome as cliente, sexo, email from cliente;

SELECT nome as cliente, sexo, email, endereco from cliente;

SELECT nome as cliente, sexo, cpf, email, endereco from cliente;

/* Trzer a tabela inteira */

SELECT * from cliente;

/* para filtrar e mostrar apenas uma coluna use WHERE */

SELECT nome, sexo from cliente
WHERE sexo = 'M';

/* Pegando o caracter coringa, utilizando o "like %" */


/* o "%" significa, qualquer coisa antes e dps procura a palavra rj no final */
SELECT nome, sexo, endereco from cliente
WHERE endereco like '%RJ';

/* o "%" significa, o coringa precisa estar no come;o da frase, ai qualquer coisa dps */
SELECT nome, sexo, endereco from cliente
WHERE endereco like 'Belford roxo%';

/* o "%" significa, qualquer coisa antes e apalvra no meio e qualquer coisa dps*/


SELECT nome, sexo, endereco from cliente
WHERE endereco like '%sao paulo%';

/* Operadores logicos */

/* Usando o "OR", apenas uma condicao precisa ser verdadeira */

SELECT nome, sexo, endereco from cliente
WHERE sexo ='M' or endereco like '%RJ';

/* Usando o "AND", as duas precisam ser verdadeiras */

SELECT nome, sexo, endereco from cliente
WHERE sexo = 'M' and endereco like '%RJ';

/* Mostrando todos que possuem o email "Null" */

SELECT nome, sexo, email
from cliente
WHERE email is Null;

/* Mostrando todos que NAO possuem o email "Null" */

SELECT nome, sexo, email
from cliente
WHERE email is not Null;

/* Usando UPDATE com WHERE */

UPDATE cliente
set email = 'felipe@gmail.com'
WHERE nome ='Felipe'

/* se vc nao usar o WHERE ele vai atualizar TODOS os emails, cuidado! */

/* --------------------------------- */

SELECT * email
from cliente