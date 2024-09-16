/* RICARDO ALMEIDA - SQL - CESAE DIGITAL 2023/2024 */

/* CRIAÇÃO DA BASE DE DADOS */

CREATE DATABASE campeonato_ricardo;

/* CRIAÇÃO DE TABELAS */

CREATE TABLE bola(
    id_bola INT AUTO_INCREMENT,
    id_equipa INT,
    fabricante VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_bola)
    );

CREATE TABLE equipa(
    id_equipa INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cidade VARCHAR(50),
    diretor VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_equipa)
    );
 
CREATE TABLE experiencia(
    id_experiencia INT AUTO_INCREMENT,
    id_equipa INT,
    id_treinador INT,
    id_escalao INT,
    anos INT DEFAULT 0,
    PRIMARY KEY (id_experiencia)
    );

CREATE TABLE treinador(
    id_treinador INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT,
    telefone INT,
    PRIMARY KEY (id_treinador)
    );

CREATE TABLE escalao(
    id_escalao INT AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_escalao)
    );

ALTER TABLE bola 
ADD FOREIGN KEY (id_equipa) REFERENCES equipa(id_equipa);

ALTER TABLE experiencia
ADD FOREIGN KEY (id_equipa) REFERENCES equipa(id_equipa),
ADD FOREIGN KEY (id_treinador) REFERENCES treinador(id_treinador),
ADD FOREIGN KEY (id_escalao) REFERENCES escalao(id_escalao);

/* INSERTS */

INSERT INTO treinador (nome, idade, telefone)
VALUES
('António', 34, 922424561),
('Barbosa', 45, 965552936),
('Tavares', 48, 933332267),
('Joaquim', 57, 918638465),
('Alberto', 33, 966785309),
('Duarte', 54, 912773446);

INSERT INTO equipa (nome, cidade, diretor)
VALUES
('Académico', 'Porto', 'Mário'),
('Universitário', 'Coimbra', 'João'),
('Juventude', 'Braga', 'Silva'),
('Tigres', 'Espinho', 'Cardoso');

INSERT INTO bola (id_equipa, fabricante)
VALUES
(1, 'Adidas'),
(1, 'Reebok'),
(1, 'Adidas'),
(2, 'Adidas'),
(2, 'Olimpic'),
(2, 'Nike'),
(3, 'Reebok'),
(3, 'Olimpic');

INSERT INTO escalao (descricao)
VALUES
('iniciados'),
('juvenis'),
('juniores'),
('seniores');

INSERT INTO experiencia (id_equipa, id_treinador, id_escalao, anos)
VALUES
(1, 1, 3, 10),
(1, 1, 4, 5),
(1, 2, 1, 2),
(1, 2, 3, 3),
(1, 2, 2, 4),
(2, 3, 3, 15),
(4, 5, 2, 12);

/* EXERCÍCIOS */

/* a. Mostrar o id, o nome e a idade dos treinadores com menos de 40 anos de idade */
CREATE VIEW Ex_a AS
SELECT id_treinador, nome, idade
FROM treinador
WHERE idade < 40;

/*b. Mostrar todos os dados da tabela Experiencia relativos aos treinadores que treinaram juniores ou que tenham mais do que 10 anos de experiência */
CREATE VIEW Ex_b AS
SELECT e.id_experiencia AS 'ID',e.id_equipa AS 'Equipa',e.id_treinador AS 'Treinador',e.id_escalao AS 'Escalão',e.anos AS 'Anos'
FROM experiencia AS e
JOIN treinador AS t
ON e.id_treinador = t.id_treinador
WHERE e.id_escalao IN ('3') OR e.anos > 10;

/* c. Mostrar todos os dados dos treinadores com idade pertencente ao intervalo [45, 53] e por ordem decrescente da idade */
CREATE VIEW Ex_c AS
SELECT *
FROM treinador
WHERE idade BETWEEN 45 AND 53
ORDER BY idade DESC;

/* d. Mostrar todos os dados dos treinadores cujo nome começa pela letra A */
CREATE VIEW Ex_d AS
3

/* e. Mostrar o número total de equipas no campeonato e chamar a essa agregação ‘Total de Equipas’ */
CREATE VIEW Ex_e AS
SELECT COUNT(equipa.id_equipa) AS 'Total de equipas'
FROM equipa;

/* f. Mostrar o total de treinadores com idade superior a 40 anos e calcular a média desse agrupamento */
CREATE VIEW Ex_f AS
SELECT COUNT(*) AS 'Treinadores com mais de 40 anos', ROUND(AVG(idade),0) as 'Média de idade'
FROM treinador
WHERE idade > 40;

/* g. Mostrar a idade do treinador mais velho */
CREATE VIEW Ex_g AS
SELECT MAX(idade)
FROM treinador;

/* ALTERNATIVA:
SELECT t.idade
FROM treinador AS t
ORDER BY idade DESC
LIMIT 1
*/

/* h. Mostrar o id das equipas que utilizam bolas do fabricante Adidas */
CREATE VIEW Ex_h AS
SELECT e.id_equipa
FROM equipa AS e
JOIN bola AS b
ON b.id_equipa = e.id_equipa
WHERE b.fabricante = 'Adidas';

/* i. Mostrar o resultado da alínea anterior, mas sem repetições */
CREATE VIEW Ex_h AS
SELECT DISTINCT e.id_equipa
FROM equipa AS e
JOIN bola AS b
ON b.id_equipa = e.id_equipa
WHERE b.fabricante = 'Adidas';

/* j. Mostrar a media das idades dos treinadores de juvenis */
CREATE VIEW Ex_j AS
SELECT ROUND(AVG(t.idade),0) AS 'Média de idade'
FROM treinador AS t
JOIN experiencia AS exp
ON exp.id_treinador = t.id_treinador
JOIN escalao AS esc
ON esc.id_escalao = exp.id_escalao
WHERE esc.id_escalao = 2;

/* k. Mostrar os nomes e os telefones dos treinadores e os nomes das equipas por eles treinadas */
CREATE VIEW Ex_k AS
SELECT DISTINCT t.nome AS 'Treinador',t.telefone,eq.nome AS 'Equipa'
FROM treinador AS t
JOIN experiencia AS exp
ON exp.id_treinador = t.id_treinador
JOIN equipa AS eq
ON exp.id_equipa = eq.id_equipa;

/* l. Mostrar todos os dados da equipa do Académico e o nome dos respetivos treinadores */
CREATE VIEW Ex_l AS
SELECT DISTINCT eq.*, t.nome AS 'Treinador'
FROM treinador AS t
JOIN experiencia AS exp
ON exp.id_treinador = t.id_treinador
JOIN equipa AS eq
ON exp.id_equipa = eq.id_equipa
WHERE eq.nome ='Académico';

/* m. Mostrar a idade do treinador mais velho do Académico */
CREATE VIEW Ex_m AS
SELECT MAX(idade) AS 'Idade do treinador mais velho do Académico'
FROM treinador AS t
JOIN experiencia AS exp
ON exp.id_treinador = t.id_treinador
JOIN equipa AS eq
ON exp.id_equipa = eq.id_equipa
WHERE eq.nome ='Académico';

/* n. Mostrar o total de anos de experiência do treinador António do Académico */
CREATE VIEW Ex_n AS
SELECT SUM(exp.anos) AS 'Anos de experiência do António do Académico'
FROM treinador AS t
JOIN experiencia AS exp
ON exp.id_treinador = t.id_treinador
JOIN equipa AS eq
ON exp.id_equipa = eq.id_equipa
WHERE eq.nome = 'Académico' AND t.nome = 'António';