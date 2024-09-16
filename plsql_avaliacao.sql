plsql_avaliacao/* RICARDO ALMEIDA - SQL - CESAE DIGITAL 2023/2024 */

/* CRIAÇÃO DA BASE DE DADOS */

CREATE DATABASE biblioteca_ricardo
 
/* CRIAÇÃO DE TABELAS */
 
CREATE TABLE editora(
id_editora INT AUTO_INCREMENT,
nome_editora VARCHAR(50),
PRIMARY KEY (id_editora)
);
CREATE TABLE autor(
id_autor INT AUTO_INCREMENT,
nome_autor VARCHAR(50),
pais VARCHAR(50),
PRIMARY KEY (id_autor)
);
CREATE TABLE genero(
id_genero INT AUTO_INCREMENT,
genero VARCHAR(50),
PRIMARY KEY (id_genero)
);
CREATE TABLE cliente(
id_cliente INT AUTO_INCREMENT,
nome VARCHAR(60),
email VARCHAR(60),
contacto INT,
PRIMARY KEY (id_cliente)
);
CREATE TABLE livro(
id_livro INT AUTO_INCREMENT,
titulo VARCHAR(50),
id_editora INT,
id_autor INT,
id_genero INT,
PRIMARY KEY (id_livro),
FOREIGN KEY (id_editora) REFERENCES editora(id_editora),
FOREIGN KEY (id_autor) REFERENCES autor(id_autor),
FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
);
CREATE TABLE emprestimo(
id_emprestimo INT AUTO_INCREMENT,
data_devolucao DATE,
data_emprestimo DATE,
id_cliente INT,
id_livro INT,
PRIMARY KEY (id_emprestimo),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);
 
/* INSERTS */
 
INSERT INTO editora (nome_editora) VALUES
('Porto Editora'),
('LeYa'),
('Planeta'),
('Editorial Presença'),
('Gradiva'),
('Plátano Editora'),
('Edições Piaget'),
('Grupo Lidel'),
('Livros do Brasil'),
('Sextante Editora'),
('Pergaminho');
 
INSERT INTO autor (nome_autor, pais) VALUES
('Frank Herbert','EUA'),
('Olga Ravn','Dinamarca'),
('Richard Morgan','EUA'),
('Daniel Silva','EUA'),
('José Rodrigues dos Santos','Portugal'),
('Stephen King','EUA'),
('Joana Marques','Portugal'),
('Ricardo Araújo Pereira','Portugal'),
('Juliet Marillier','Alemanha'),
('Chloe Gong','França'),
('TJ Klune','França'),
('David Costa','Brasil'),
('V.E. Schwab','Alemanha');
 
INSERT INTO genero (genero) VALUES
('Fantasia'),
('Ficção Científica'),
('Crónicas'),
('Contos'),
('Biografias'),
('Poesia'),
('Romance'),
('Policial e Thiller'),
('Humor'),
('Literatura'),
('Monografias');
 
INSERT INTO livro (titulo, id_editora, id_autor, id_genero) VALUES
('Leão Da Insanidade',9,6,2),
('Vigarista Com Pecados',4,13,9),
('Companheiros Do Rio',6,10,11),
('Cobras De Vento',4,7,9),
('Árvores E Guardiões',4,11,2),
('Agentes E Cães',9,3,6),
('Influenciar Com Vigor',3,2,4),
('Conquista Sem Pecado',9,3,10),
('Chorando Na Tecnologia',4,5,1),
('Prepare-Se Para As Minas',7,11,4),
('Sacerdote Dos Perdidos',4,10,7),
('Chuvas De Desejo',6,10,4),
('Estrangeiros De Tristeza',3,10,9),
('Estranhos De Amanhã',6,5,1),
('Cobras E Defensores',10,9,4),
('Ratos E Descendentes',6,11,7),
('União Das Paliçadas',5,1,6),
('Visão Com Asas',11,4,3),
('Ainda Respirando Nas Profundezas',7,4,10),
('Sons Na Minha Esposa',7,5,11),
('Herói Sem Glória',4,12,4),
('Falcão Do Vento',1,11,10),
('Meninas Da Nação',8,11,5),
('Guardiões Do Mundo',9,4,8),
('Assassinos E Inimigos',1,7,8),
('Humanos E Fantasmas',10,12,3),
('Amaldiçoar Com Força',3,4,10),
('Clímax Sem Fé',3,13,7),
('Protegido Pelo Caçador',3,1,6),
('Prepare-Se Para O Universo',2,3,3);
 
INSERT INTO cliente (nome, email, contacto) VALUES
('Miguel Antunes','mantunes187@gmail.com','912456789'),
('Armindo Guterres','armindo.1963@live.com.pt','921568793'),
('Rita Rodrigues','ritinha111@gmail.com','963184687'),
('Larissa Ventura','lariss_ventura@hotmail.com','963215897'),
('Roberto Fragoso','robfrag@yahoo.com','928649873'),
('Adélia Custódio','adeliaamcustodio@hotmail.com','913254893'),
('Sofia Velasquez','velasquez.sof333@live.com.pt','916588731'),
('Delfim Pestana','pestanas1978@gmail.com','936544486'),
('Vânia Quaresma','vania.quaresma.77@yahoo.com','926888369'),
('Maria Pardo','pardo_maria@hotmail.com','913654879'),
('Wilson Guimarães','wwwilsonnn1994@gmail.com','963211548'),
('Nilton Godinho','nilton_god_@hotmail.com','923345869'),
('Clara Dantas','clarinha2000_1@live.com.pt','915487358'),
('Emanuel Rocha','emanuelonrocks@gmail.com','962144487'),
('Mark Raposo','markfoxx@hotmail.com','935587694'),
('Tiago Pacheco','tigas_pacheco@yahoo.com','916687943'),
('Raquel Caldas','caldas.raquel2001@live.com.pt','923648776'),
('Miriam Figueiras','miri_figueiras4321@hotmail.com','913478282'),
('Carlos Teixeira','carlosjrteixeira@gmail.com','963188413');
 
INSERT INTO emprestimo (data_devolucao, data_emprestimo, id_cliente, id_livro) VALUES
('2022-01-06','2020-12-09',19,18),
('2021-08-22','2019-06-07',7,23),
('2022-04-19','2021-07-14',11,10),
('2021-11-02','2019-04-20',4,13),
('2022-05-26','2019-10-31',13,22),
(NULL,'2021-09-24',13,25),
('2022-04-17','2022-02-06',2,25),
('2022-06-06','2022-05-25',17,10),
('2022-06-24','2021-01-30',1,20),
('2021-06-06','2020-03-28',10,2),
(NULL,'2021-11-28',5,6),
(NULL,'2021-04-21',16,29),
(NULL,'2021-02-07',14,2),
(NULL,'2020-10-24',10,30),
('2022-07-26','2022-01-08',17,3),
(NULL,'2020-04-16',13,23),
('2022-07-03','2019-08-18',16,25),
('2021-09-06','2019-12-25',19,13),
(NULL,'2021-02-27',9,12),
('2021-06-22','2019-12-18',7,14),
(NULL,'2021-01-28',4,3),
('2021-08-24','2020-06-14',13,21),
('2022-04-26','2021-12-17',8,7),
('2022-05-14','2019-11-07',6,3),
(NULL,'2019-11-03',1,25),
('2021-03-27','2020-02-05',14,15),
('2020-06-05','2020-06-04',10,16),
('2020-12-28','2020-11-27',13,18),
('2022-01-21','2019-11-24',7,12),
('2021-12-25','2019-12-01',3,23);
 
/* EXERCÍCIOS: VIEWS */
 
CREATE VIEW Ex_4a AS
SELECT nome AS 'Nome do cliente'
FROM cliente
WHERE email LIKE '%@gmail%' AND (contacto LIKE '91%' OR contacto LIKE '96%');
 
CREATE VIEW Ex_4b AS
SELECT id_emprestimo AS 'ID empréstimo (não devolvidos)', DATEDIFF (CURDATE(), emprestimo.data_emprestimo) AS 'Dias'
FROM emprestimo
WHERE data_devolucao IS NULL
 
CREATE VIEW Ex_4c AS
SELECT YEAR(data_emprestimo) AS 'Ano', COUNT(id_emprestimo) AS 'Total de empréstimos'
FROM emprestimo
GROUP BY ano;

CREATE VIEW Ex_4d AS
SELECT e.nome_editora AS 'Editora', COUNT(l.id_livro) AS 'Número de livros'
FROM editora AS e
JOIN livro AS l
ON e.id_editora = l.id_editora
GROUP BY e.nome_editora
HAVING COUNT(l.id_livro) > 3
ORDER BY COUNT(l.id_livro) DESC;

CREATE VIEW Ex_4e AS
SELECT g.genero AS 'Género Literário', COUNT(l.id_livro) AS 'Número de livros'
FROM genero AS g
LEFT JOIN livro AS l
ON g.id_genero = l.id_genero
GROUP BY g.genero;

CREATE VIEW Ex_4f AS
SELECT e.nome_editora AS 'Editora', GROUP_CONCAT(g.genero) AS 'Géneros literários disponíveis'
FROM editora AS e
JOIN livro AS l
ON e.id_editora = l.id_editora
JOIN genero AS g
ON l.id_genero = g.id_genero
GROUP BY e.nome_editora;

CREATE VIEW Ex_4g AS
SELECT a.nome_autor AS 'Autor', COUNT(e.id_emprestimo) AS 'Número de empréstimos'
FROM autor AS a
JOIN livro AS l
ON a.id_autor = l.id_autor
JOIN emprestimo AS e
ON l.id_livro = e.id_livro
WHERE a.pais != 'EUA'
GROUP BY a.nome_autor
LIMIT 3;

CREATE VIEW Ex_4h AS
SELECT l.titulo AS 'Título', c.nome AS 'Cliente', c.email AS 'Email', e.data_emprestimo AS 'Data de empréstimo'
FROM emprestimo AS e
JOIN livro AS l
ON e.id_livro = l.id_livro
JOIN cliente AS c
ON e.id_cliente = c.id_cliente
WHERE e.data_devolucao IS NULL AND YEAR(e.data_emprestimo) < 2021
ORDER BY e.data_emprestimo ASC;

/* EXERCÍCIOS: PROCEDURES */
 
DELIMITER //
CREATE PROCEDURE Ex_5a_email (IN in_email VARCHAR(50))
BEGIN
SELECT nome AS 'Clientes registados com determinado email'
FROM cliente
WHERE email LIKE CONCAT('%',in_email,'%');
END //
DELIMITER ;

CALL Ex_5a_email ('hotmail')

DELIMITER //
CREATE PROCEDURE Ex_5b_paisautor (IN in_nomeautor VARCHAR(50), IN in_paisautor VARCHAR(50))
BEGIN
SELECT l.titulo AS 'Título de livro de determinado autor de determinado país'
FROM livro AS l
JOIN autor AS a
ON l.id_autor = a.id_autor
WHERE a.nome_autor = in_nomeautor AND a.pais = in_paisautor;
END //
DELIMITER ;

CALL Ex_5b_paisautor ('TJ Klune', 'França')

DELIMITER //
CREATE PROCEDURE Ex_5c_livrosgenero (IN in_nomegenero VARCHAR(50))
BEGIN
SELECT COUNT(*) AS 'Total de livros de determinado género'
FROM livro AS l
JOIN genero AS g
ON l.id_genero = g.id_genero
WHERE g.genero = in_nomegenero;
END //
DELIMITER ;

CALL Ex_5c_livrosgenero ('Fantasia')

DELIMITER //
CREATE PROCEDURE Ex_5d_autordisponiveis (IN in_nomeautor VARCHAR(50))
BEGIN
SELECT DISTINCT l.titulo AS 'Livros disponíveis de determinado autor'
FROM autor AS a
JOIN livro AS l
ON a.id_autor = l.id_autor
LEFT JOIN emprestimo AS e
ON l.id_livro = e.id_livro
WHERE a.nome_autor = in_nomeautor AND (e.data_devolucao IS NOT NULL OR e.id_emprestimo IS NULL);
END //
DELIMITER ;

CALL Ex_5d_autordisponiveis ('V.E. Schwab')