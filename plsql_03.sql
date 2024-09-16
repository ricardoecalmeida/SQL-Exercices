/* RICARDO ALMEIDA - SQL - CESAE DIGITAL 2023/2024 */

/* CRIAÇÃO DA BASE DE DADOS */

CREATE DATABASE concurso_ricardo;

/* CRIAÇÃO DE TABELAS */

CREATE TABLE concurso_pastelaria(
    data_prova DATE,
    hora TIME,
    chefe INT,
    nome VARCHAR(50),
    bolo VARCHAR(50),
    assistentes INT,
    tema VARCHAR(50),
    sabor VARCHAR(50),
	PRIMARY KEY (data_prova, hora, chefe)
    );

/* INSERTS */

INSERT INTO concurso_pastelaria (
data_prova, hora, chefe, nome, bolo, assistentes, tema, sabor) VALUES
('2020-09-14', '12:23', 56, 'Bourdain', 'Bolo Brigadeiro Gourmet', 2, 'Aniversário', 'Limão'),
('2021-05-03', '17:00', 71, 'Ramsay', 'Mousse de Chocolate Branco e Framboesas', 3, 'Casamento', 'Chocolate'),
('2021-05-03', '14:43', 81, 'Oliver', 'Pavlova de Laranja', 0, 'Casamento', 'Laranja'),
('2021-05-24', '16:55', 23, 'Batali', 'Bolo Húmido de Baunilha e Limão', 2, 'Halloween', 'Baunilha'),
('2021-05-24', '18:09', 81, 'Oliver', 'Merengue de Tiramisú e Limoncello', 4, 'Aniversário', 'Chocolate'),
('2021-05-24', '15:38', 44, 'Flay', 'Mousse de Baunilha', 3, 'Casamento', 'Baunilha'),
('2023-02-15', '18:12', 56, 'Bourdain', 'Brigadeiro Ferrero', 1, 'Aniversário', 'Chocolate'
);

/* EXERCÍCIOS: VIEWS */

CREATE VIEW Ex_5a AS
SELECT *
FROM concurso_pastelaria
WHERE sabor LIKE '%Chocolate%';

CREATE VIEW Ex_5b AS
SELECT COUNT(bolo) AS 'Mousses propostas'
FROM concurso_pastelaria
WHERE bolo LIKE '%Mousse%';

/* EXERCÍCIOS: PROCEDURES */

DELIMITER //
CREATE PROCEDURE proc_quantidade_bolos_chefe (IN quantidade_bolos_chefe VARCHAR(50))
BEGIN
SELECT COUNT(nome) AS 'Quantidade de bolos de determinado chefe'
FROM concurso_pastelaria
WHERE nome = quantidade_bolos_chefe;
END //
DELIMITER ;

CALL proc_quantidade_bolos_chefe('Oliver')

DELIMITER //
CREATE PROCEDURE proc_bolos_data (IN bolos_data VARCHAR(50))
BEGIN
SELECT bolo AS 'Bolos propostos em determinada data'
FROM concurso_pastelaria
WHERE data_prova = bolos_data;
END //
DELIMITER ;

CALL proc_bolos_data('2021-05-24')

DELIMITER //
CREATE PROCEDURE proc_bolos_tema (IN bolos_tema VARCHAR(50))
BEGIN
SELECT COUNT(tema) AS 'Bolos propostos para determinado tema'
FROM concurso_pastelaria
WHERE tema = bolos_tema;
END //
DELIMITER ;

CALL proc_bolos_tema('Aniversário')

DELIMITER //
CREATE PROCEDURE proc_ultimas_receitas (IN nome_chefe VARCHAR(50))
BEGIN
SELECT bolo AS 'Últimas 3 receitas de determinado chefe'
FROM concurso_pastelaria
WHERE chefe = nome_chefe
ORDER BY data_prova
LIMIT 3;
END //
DELIMITER ;

CALL proc_ultimas_receitas('56')