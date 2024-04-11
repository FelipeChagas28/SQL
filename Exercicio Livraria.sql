livraria

CREATE DATABASE livraria;

use Livraria;

CREATE TABLE Livros (

nome_livro varchar(50),
nome_autor varchar(50),
sexo_autor char(1),
num_pagina varchar(4),
nome_editora varchar(50),
vlr_livro float(5,2),
uf_editora char(2),
ano_publi char(4)

);

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('Cavaleiro Real', 'Ana claudia', 'F', '465', 'Atlas', 49.9, 'RJ', '2009');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('SQL para leigos', 'Joao Nunes', 'M', '450', 'Addison', 98, 'SP', '2018');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('Receitas Caseiras', 'Celia Tavares', 'F', '210', 'Atlas', 45, 'RJ', '2008');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('Pessoas Efetivas', 'Eduardo Santos', 'M', '390', 'Beta', 78.99, 'RJ', '2018');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('Habitos Saudaveis', 'Eduardo Santos', 'M', '630', 'Beta', 150.98, 'RJ', '2019');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('A casa Marrom', 'Hermes Macedo', 'M', '250', 'Bubba', 60, 'MG', '2016');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('Estacio Querido', 'Geraldo Francisco', 'M', '310', 'Insignia', 100, 'ES', '2011');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('Para Sempre Amigas', 'Leda Silva', 'F', '510', 'Insignia', 78.98, 'ES', '2011');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('Copas Inesqueciveis', 'Marco alvantara', 'M', '200', 'larson', 130.98, 'RS', '2018');

INSERT into Livros(nome_livro, nome_autor, sexo_autor, num_pagina, nome_editora, vlr_livro,
uf_editora, ano_publi) VALUES('O poder da mente', 'Clara Mafra', 'F', '120', 'Continental', 56.58, 'RS', '2017');

/* Trazer todos os dados. */

SELECT * from livros;

/* Trazer o nome do livro e o nome da editora */

SELECT nome_livro, nome_editora from livros;


/*Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino. */

SELECT nome_livro, uf_editora from livros
WHERE sexo_autor = 'M';

/*Trazer o nome do livro e o número de páginas dos livros publicados 
por autores do sexo feminino. */

SELECT nome_livro, num_pagina from livros
WHERE sexo_autor = 'F';

/*Trazer os valores dos livros das editoras de São Paulo. */

SELECT vlr_livro from livros
WHERE uf_editora ='SP';

/*Trazer os dados dos autores do sexo masculino que tiveram livros publicados por 
São Paulo ou Rio de Janeiro (Questão Desafio). */

select nome_autor, sexo_autor from livros
WHERE sexo_autor = 'M'
AND uf_editora = 'SP' or uf_editora LIKE 'RJ';

/* utilizando esse comando, vc pega uma coluna e agrupa as linhas em conjunto com os resultados */


SELECT sexo_autor, count(*) FROM livros 
GROUP BY sexo_autor;