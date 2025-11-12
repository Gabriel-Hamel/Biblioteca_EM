-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

drop database GEM;
Create database GEM;
Use GEM;

CREATE TABLE autor (
cod_autor INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_autor VARCHAR(400)
);

CREATE TABLE editora (
cod_editora INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_editora VARCHAR(100)
);

CREATE TABLE genero (
cod_genero INTEGER PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(50)
);

CREATE TABLE livro (
cod_livro INTEGER PRIMARY KEY AUTO_INCREMENT,
qtd_estoque INTEGER,
nome VARCHAR(400),
preco DECIMAL(10,2),
cod_editora INTEGER,
FOREIGN KEY(cod_editora) REFERENCES editora (cod_editora)
);

CREATE TABLE compra (
cod_compra INTEGER PRIMARY KEY AUTO_INCREMENT,
valor_total DECIMAL(10,2),
data_compra DATE,
cod_pagamento INTEGER,
cod_usuario INTEGER
);

CREATE TABLE forma_pagamento (
cod_pagamento INTEGER PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(50)
);

CREATE TABLE usuario (
cod_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(400),
cpf VARCHAR(20),
email VARCHAR(100),
senha VARCHAR(25)
);

CREATE TABLE admin (
cod_admin INTEGER PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(50),
cod_usuario INTEGER,
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE autor_livro (
cod_autor INTEGER,
cod_livro INTEGER,
FOREIGN KEY(cod_autor) REFERENCES autor (cod_autor),
FOREIGN KEY(cod_livro) REFERENCES livro (cod_livro)
);

CREATE TABLE genero_livro (
cod_livro INTEGER,
cod_genero INTEGER,
FOREIGN KEY(cod_livro) REFERENCES livro (cod_livro),
FOREIGN KEY(cod_genero) REFERENCES genero (cod_genero)
);

CREATE TABLE compra_livro (
cod_livro INTEGER,
cod_compra INTEGER,
FOREIGN KEY(cod_livro) REFERENCES livro (cod_livro),
FOREIGN KEY(cod_compra) REFERENCES compra (cod_compra)
);

ALTER TABLE compra ADD FOREIGN KEY(cod_pagamento) REFERENCES forma_pagamento (cod_pagamento);
ALTER TABLE compra ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);



INSERT INTO usuario(nome_usuario, cpf, email, senha) VALUES("Gabriel Hamel","059.870.141-90", "gabrielhamel2004@gmail.com", "Gabriel2004"), ("Robbins Jun","905.738.069-26", "junko_robbins@gmail.com", "Junko123"), ("Carol Neal","364.798.169-94", "carola_neal@gmail.com", "CaraiN2"), ("Daryl Whilsk","806.644.869-40", "darell_wilks@gmail.com", "DaddyWhisky"), ("Liam Hemsworth", "586.725.129-28","liam_hemsworth@gmail.com","GaleHawthorne"), ("Daniel Radcliffe","847.943.479-10", "daniel_radcliffe@gmail.com", "HarryPotter2"), ("MJ","059.504.756-89", "maria2005@gmail.com", "MariaHelenaHamel"), ("KitKat","250.379.570-60","kit_harington@gmail.com","Chocolate123"), ("Joel and Ellie","414.002.970-60","joel_kinnaman@gmail.com","EllieNJoel"), ("Nathan Drake","379.051.690-22","nathan_hindmarsh@gmail.com", "Uncharted");

INSERT INTO admin(descricao, cod_usuario) VALUES("Dono", 1), ("Sub-Dona", 7), ("Organizador", 3);

INSERT INTO autor(nome_autor) VALUES("Rick Riordan"), ("JK Rowling"), ("Holly Black"), ("Casey McQuiston"), ("Alice Oseman"), ("James Dashner"), ("C.S Lewis"), ("Suzanne Collins"), ("Scott Cawthon"), ("Adam Silvera");

INSERT INTO editora(nome_editora) VALUES("Intrinseca"), ("Rocco"), ("Galera"), ("Seguinte"), ("Plataforma 21"), ("WMF Martins Fontes");

INSERT INTO livro(qtd_estoque, nome, preco, cod_editora) VALUES (886, "Percy Jackson e o Ladrao de Raios", 47.30, 1), (615, "Harry Potter E A Crianca Amaldicoada", 47.90, 2), (523, "O principe cruel: O Povo do Ar", 31.74, 3), (432, "Vermelho, branco e sangue azul", 34.89, 4), (654, "Heartstopper: Dois garotos, um encontro", 38.90, 4), (734, "Maze Runner: correr ou morrer", 32.90, 5), (5483, "As cronicas de Narnia", 49.90, 6), (658, "Jogos Vorazes", 43.90, 2), (721, "Five nights at Freddys Olhos Prateados", 32.90, 1), (25, "Os Dois Morrem No Final", 45.90, 1), (234, "Harry Potter e a Pedra Filosofal", 23.49, 2), (644, "Harry Potter e a Camara Secreta", 51.14, 2), (478, "Percy Jackson e o Mar de Monstros", 43.31, 1), (374, "Maze Runner: prova de fogo", 41.07, 5), (872, "Five Nights at Freddys Os Distorcidos", 23.94, 1), (815, "Five Nights at Freddys a Ultima Porta", 30.90, 1);

INSERT INTO genero(descricao) VALUES("Fantasia"), ("Ficcao Cientifica"), ("Terror"), ("Literatura"), ("Juvenil"), ("Romance"), ("Distopica"), ("Acao");

INSERT INTO genero_livro(cod_livro, cod_genero) VALUES(1, 1), (1, 2), (1, 4), (1, 5), (2, 2), (2, 4), (3, 1), (3, 2),(3, 3), (3, 4), (4, 6), (4, 5), (5, 2), (5, 5), (5, 6), (6, 2), (6, 4), (6, 7), (7, 1), (7, 2), (7, 5), (8, 1), (8, 2), (8,5), (8, 7), (8, 8), (9, 2), (9, 3), (9, 4), (9,5), (10, 2), (10, 4), (10, 5), (10, 6), (11, 2), (11, 4), (12, 2), (12, 4), (13, 1), (13, 2), (13, 4), (13, 5), (14, 2), (14, 4), (14, 7), (15, 2), (15, 3), (15, 4), (15, 5);

INSERT INTO autor_livro(cod_autor, cod_livro) VALUES(1,1), (1,13), (2,2), (2,11), (2,12), (3,3), (4,4), (5, 5), (6,6), (6,14), (7,7), (8,8), (9,9), (9,15), (10, 10);

INSERT INTO  forma_pagamento(descricao) VALUES("Debito"), ("Credito"), ("Cheque"), ("PIX"), ("Boleto Bancario"), ("Transferencia Bancaria");

INSERT INTO compra(valor_total, data_compra, cod_pagamento, cod_usuario) VALUES(93.80, '2015-04-21', 2, 3), (31.74, '2016-05-10', 6, 4), (73.97, '2017-02-04', 3, 5), (122.53, '2018-06-28', 2, 2), (119.60, '2019-03-07', 1, 1), (56.84, '2020-01-02', 5, 2);

INSERT INTO compra_livro(cod_livro, cod_compra) VALUES(7, 1), (8,1), (3, 2), (6, 3), (14, 3), (2, 4), (11, 4), (12, 4), (4, 5), (5, 5), (10, 5), (9, 6), (15, 6);

select * from usuario;
select * from admin;
select * from autor;
select * from editora;
select * from livro;
select * from genero;
select * from genero_livro;
select * from autor_livro;
select * from forma_pagamento;
select * from compra;
select * from compra_livro;

select descricao, nome_usuario, email from admin left join usuario on usuario.cod_usuario=admin.cod_usuario;

select nome_autor, nome from autor left join autor_livro on autor.cod_autor=autor_livro.cod_autor left join livro on livro.cod_livro=autor_livro.cod_livro;

select valor_total, nome_usuario, descricao from compra left join forma_pagamento on forma_pagamento.cod_pagamento=compra.cod_compra left join usuario on usuario.cod_usuario=compra.cod_usuario;