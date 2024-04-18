create database exe_comercio;

use exe_comercio;

show database;

create table cliente(
	IDCliente int primary key auto_increment,
	nome varchar(30) not null,
	sexo enum("F","M") not null,
	email varchar(50) unique,
	cpf varchar(15) unique
);

create table endereco(
	IDEndereco int primary key auto_increment,
	rua varchar(50) not null,
	bairro varchar(30) not null,
	cidade varchar(30) not null,
	estado varchar(2),
	ID_Cliente int unique,
	foreign key (ID_Cliente)
	references cliente(IDCliente)
);

create table telefone(
	IDTelefone int primary key auto_increment,
	tipo enum("COM","RES","CEL"),
	numero varchar(10) not null,
	ID_Cliente int unique,
	foreign key(ID_Cliente)
	references cliente(IDCliente)
);

-- Inserindo dados dos clientes

insert into cliente values(null, "Felipe", "M", "felipe@gmail.com", "09237684");
insert into cliente values(null, "afssda", "F", "sadfad", "234423");
insert into cliente values(null, "qewqwe", "F", "adfgah", "532234123");
insert into cliente values(null, "fd\srg", "F", "ehrgerg", "67542354");
insert into cliente values(null, "aegr", "F", "egwrergwef", "354346346");
insert into cliente values(null, "qwe", "M", "jryrthjy", "6343642346");
insert into cliente values(null, "rtyh", "M", "erthergh", "235523235");
insert into cliente values(null, "dfgwer", "M", "rththe", "412341");
insert into cliente values(null, "sdrfgh", "M", "yjrtrth", "635364");
insert into cliente values(null, "rthds", "M", "herterfg", "1234124");
insert into cliente values(null, "sgfhed", "F", "Frthrtherthe", "1234556");
insert into cliente values(null, "fgsd", "F", "erthsdf", "235723");
insert into cliente values(null, "fgds", "F", "wergdf", "7890789");
insert into cliente values(null, "gfdsxc", "F", "rthzfd", "5678856");
insert into cliente values(null, "zfgd", "M", "rthjsgdf", "890789");
insert into cliente values(null, "awert", "M", "fgadafg", "56780678");
insert into cliente values(null, "gsaef", "F", "dfhsdvqwef", "23512345");
insert into cliente values(null, "sfgd", "M", "srghfsdv", "24132135");
insert into cliente values(null, "gsera", "F", "etrhsdf", "2342434");
insert into cliente values(null, "gfdsaa", "M", "hfdfgaasdf", "3456345");
insert into cliente values(null, "rwe", "M", "hstgdsfga", "52235235");

-- Inserindo dados dos enderecos

insert into endereco values(null, "owrguh", "Centro", "Rio de Janeiro", "RJ", 1);
insert into endereco values(null, "jwepfojk", "egwrw", "Sao Paulo", "SP", 2);
insert into endereco values(null, "fweqwf", "qfewfg", "wfhegoui", "RJ", 3);
insert into endereco values(null, "wefwef", "Centro", "Rio de Janeiro", "RJ", 4);
insert into endereco values(null, "asdasf", "ergerg", "Sao", "SP", 5);
insert into endereco values(null, "ehrgerg", "Centro", "Sao Paulo", "SP", 6);
insert into endereco values(null, "rqqwrasd", "Centro", "Rio", "RJ", 7);
insert into endereco values(null, "fwdeqef", "dfssdf", "asddas", "SD", 8);
insert into endereco values(null, "wfewfae", "fsdfsde", "eqwqwesfd", "SQ", 9);
insert into endereco values(null, "fwedsawef", "Centro", "Rio de Janeiro", "RJ", 10);
insert into endereco values(null, "3e5rghertgh", "shrgsg", "gafdafgd", "SF", 11);
insert into endereco values(null, "egrqwdf", "Centro", "SP", "SP", 12);
insert into endereco values(null, "sdfqef", "geregr", "lehr", "Sy", 13);
insert into endereco values(null, "ethsrg", "egregr", "geregr", "SL", 14);
insert into endereco values(null, "er5ghwef", "hrtger", "egrger", "GE", 15);
insert into endereco values(null, "ethwef", "Centro", "Rio de janeiro", "RJ", 16);
insert into endereco values(null, "qefsdfvafsd", "gsfagafs", "gsfsgf", "ER", 17);
insert into endereco values(null, "dbfafsdqwr", "Centro", "hsfzdb", "OI", 18);
insert into endereco values(null, "ethfwegef", "Cklej;rgh", "erghjgf", "RJ", 19);
insert into endereco values(null, "herwef", "Centro", "Rio de janeiro", "RJ", 20);
insert into endereco values(null, "erthwdrfg", "rgrfgw", "gfssfgd", "SP", 21);

-- Inserindo dados do Telefone

insert into telefone values(null, "RES", "12345", 1);
insert into telefone values(null, "RES", "2341152", 2);
insert into telefone values(null, "COM", "6234563", 3);
insert into telefone values(null, "COM", "54323452", 4);
insert into telefone values(null, "COM", "4355342", 5);
insert into telefone values(null, "CEL", "54323", 6);
insert into telefone values(null, "CEL", "134413", 7);
insert into telefone values(null, "CEL", "3422345", 8);
insert into telefone values(null, "CEL", "234132", 9);
insert into telefone values(null, "CEL", "64323", 10);
insert into telefone values(null, "COM", "234364", 11);
insert into telefone values(null, "RES", "423245334", 12);
insert into telefone values(null, "RES", "23423435", 13);
insert into telefone values(null, "RES", "534534", 14);
insert into telefone values(null, "CEL", "534345", 15);
insert into telefone values(null, "CEL", "345534", 16);
insert into telefone values(null, "CEL", "1234134", 17);
insert into telefone values(null, "CEL", "234234", 18);
insert into telefone values(null, "CEL", "34566", 19);
insert into telefone values(null, "CEL", "6342345", 20);
insert into telefone values(null, "CEL", "578675", 21);



-- RELATORIO GERAL DE TODOS OS CLIENTES

select C.nome, C.sexo, C.email, C.cpf, E.rua, E.bairro, E.cidade, E.estado, T.numero, T.tipo
from cliente C 
	INNER JOIN telefone T
	on C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN endereco E
	on C.IDCLIENTE = E.ID_CLIENTE;



-- RELATÓRIO GERAL DE HOMENS

select C.nome, C.sexo, C.email, C.cpf, E.rua, E.bairro, E.cidade, E.estado, T.numero, T.tipo
from cliente C 
	INNER JOIN telefone T
	on C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN endereco E
	on C.IDCLIENTE = E.ID_CLIENTE

	where C.sexo = "M";



-- RELATÓRIO GERAL DE MULHERES

select C.nome, C.sexo, C.email, C.cpf, E.rua, E.bairro, E.cidade, E.estado, T.numero, T.tipo
from cliente C 
	INNER JOIN telefone T
	on C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN endereco E
	on C.IDCLIENTE = E.ID_CLIENTE

	where C.sexo = "F";



-- QUANTIDADE DE HOMENS E MULHERES

select count(*) from cliente
	group by sexo



-- IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RJ E NÃO TENHAM CELULAR

select C.IDCLIENTE, C.email, C.sexo from cliente C
	INNER JOIN endereco E
	on C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN telefone T
	on C.IDCLIENTE = T.ID_CLIENTE

	where C.sexo = "F" and E.bairro = "Centro" and E.estado = "RJ" and T.tipo = "COM" or T.tipo = "RES";