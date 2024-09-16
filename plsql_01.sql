/* RICARDO ALMEIDA - SQL - CESAE DIGITAL 2023/2024 */

/* CRIAÇÃO DA BASE DE DADOS */

CREATE DATABASE loja_ricardo;

/* CRIAÇÃO DE TABELAS */

CREATE TABLE Cliente(
   id_cliente int AUTO_INCREMENT PRIMARY KEY,
   nome varchar(50),
   cidade varchar(40),
   data_inscricao date,
   pontos int
);

CREATE TABLE Venda(
   id_venda int AUTO_INCREMENT PRIMARY KEY,
   data_venda date,
   desconto float,
   id_cliente int,
   FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Produto(
   id_produto int AUTO_INCREMENT PRIMARY KEY,
   descricao varchar(50),
   preco float,
   stock int
);

CREATE TABLE Linha_Venda(
   id_linhavenda int AUTO_INCREMENT PRIMARY KEY,
   id_venda int,
   id_produto int,
   quantidade int,
   FOREIGN KEY (id_venda) REFERENCES Venda(id_venda),
   FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
 );

/* Adicionar um atributo:
ALTER TABLE Venda ADD data_venda date;
*/

/* INSERTS */

/* Inserir clientes */
 INSERT INTO Cliente (nome, cidade, data_inscricao, pontos) VALUES
('Ana', 'Maia', '2018-03-11', 123), 
('Bruno', 'Porto', '2006-06-22', 5347), 
('Miguel', 'Porto', '2010-07-26', 1789), 
('Maria', 'Valbom', '2006-05-21', 3234), 
('Joana', 'Maia', '2011-08-7', 678), 
('Anabela', 'Ermesinde', '2012-03-21', 864), 
('Manuel', 'Gaia', '2019-06-22', 1123), 
('Bruna', 'Porto', '2020-07-15', 1589), 
('Joana', 'Gaia', '2021-04-14', 324), 
('Raquel', 'Maia', '2019-01-21', 1899), 
('Vitor', 'Gaia', '2020-09-29', 127);

/* Inserir produtos */
INSERT INTO Produto (descricao, preco, stock) VALUES 
('Martelo', 5.99, 23), 
('Parafuso', 0.99, 241), 
('Prego', 0.2, 147),
('Rosca', 0.3, 0), 
('Berbequim', 35.99, 15), 
('Torneira', 20.99, 11), 
('Lampada', 1.5, 0), 
('Broca', 2.6, 60), 
('Extensão', 10.5, 0), 
('Tripla', 5.5, 16), 
('Pincel', 3.99, 34), 
('Calha', 2.99, 0);

/* Inserir vendas */
INSERT INTO Venda (id_cliente, data_venda, desconto) VALUES
(1, '2021-03-29', 0.05), 
(1, '2021-03-31', 0.20), 
(2, '2021-05-03', 0), 
(4, '2021-05-21', 0), 
(1, '2021-06-15', 0.1), 
(5, '2021-06-05', 0), 
(4, '2021-08-11', 0.05), 
(3, '2021-09-03', 0.25), 
(5, '2021-10-23', 0.5), 
(7, '2021-11-04', 0), 
(6, '2021-11-05', 0.5);

/* Inserir tabela intermédia linha_venda */
INSERT INTO linha_venda (id_venda, id_produto, quantidade) VALUES
(1, 1, 2), 
(1, 3, 10), 
(2, 2, 20), 
(3, 5, 2), 
(4, 8, 5), 
(5, 10, 2), 
(5, 11, 10), 
(6, 6, 20), 
(7, 3, 120), 
(7, 1, 5), 
(7, 7, 2), 
(8, 3, 10), 
(9, 2, 80), 
(9, 3, 50), 
(9, 1, 3), 
(9, 8, 2), 
(10, 9, 10), 
(10, 2, 50), 
(10, 3, 70), 
(11, 5, 1);

/* Inserir novos clientes */
INSERT INTO Cliente (nome, cidade, data_inscricao, pontos) VALUES
('Miguel', 'Loures', '2023-12-15', 100),
('Paula', 'Portimão', '2022-07-01', 150),
('Jorge', 'Bragança', '2019-01-27', 200);

/* Inserir novos produtos */
INSERT INTO Produto (descricao, preco, stock) VALUES
('Porca', 0.00, 0),
('Tomada', 0.00, 0),
('Lata tinta', 0.00, 0),
('Fita métrica', 0.00, 0),
('Chave fendas', 0.00, 0);

/* EXERCÍCIOS */

/* Actualizar valor de pontos do cliente 3 */
UPDATE cliente
SET pontos = 2789
WHERE id_cliente = 3;

/* Actualizar stock do produto 'berbequim' para 13 */
UPDATE Produto
SET stock = 13
WHERE descricao='Berbequim';

/* Actualizar o nome e os pontos */
UPDATE cliente
SET nome='Vitorino', pontos = 327
WHERE id_cliente = 11;

/* Eliminar produto cuja descrição seja 'calha' */
DELETE FROM Produto
WHERE descricao='Calha';

/* Ver toda a informação de todos os clientes */
SELECT *
FROM cliente;

/* Ver todas as cidades dos clientes (sem duplicados) */
SELECT DISTINCT cidade
FROM cliente;

/* Ver a descrição, preço, preço com IVA (23%) de todos os produtos e chame ao último atributo ‘Preço + IVA’ */
SELECT descricao, preco, ROUND(preco*1.23,2) AS 'Preço + IVA'
FROM produto;

/*  Ver todos os clientes que se inscreveram entre ‘2000-01-01’ e ‘2009-01-01’ e com mais de 1000 pontos */
SELECT *
FROM cliente
WHERE data_inscricao BETWEEN '2000-01-01' AND '2009-01-01' AND pontos > 1000;

/* Ver produtos com stock igual a 0, 15 e 60 */
SELECT *
FROM produto
WHERE stock IN ('0','15','60');

/*  Ver todos os clientes cujo nome contenha ‘ana’, ordenado por ordem descendente pelo id_cliente */
SELECT *
FROM cliente
WHERE nome LIKE '%ana%'
ORDER BY id_cliente DESC;

/* Ver todos os clientes cujo nome seja composto no total por 5 caracteres sendo o último um ‘a’ */
SELECT *
FROM cliente
WHERE nome LIKE '____a';

/* Ver todos os produtos cuja descrição comece por ‘P’ ou ‘T’ ou termine em CA’ */
SELECT *
FROM produto
WHERE descricao REGEXP '^p|^t|ca$';

/* Ver apenas o 6º,7º,8º cliente com mais pontos */
SELECT *
FROM cliente
ORDER BY pontos DESC
LIMIT 5,3;

/* Ver as cidades que tenham mais de 1 cliente */
SELECT cidade,COUNT(cidade)
FROM cliente
GROUP BY cidade
HAVING COUNT(cidade) > 1;

/* Ver quais as vendas que não foi aplicado nenhum desconto */
SELECT *
FROM venda
WHERE desconto = 0;

/* Ver o top 3 produtos mais caros */
SELECT *
FROM produto
ORDER BY preco DESC
LIMIT 3;

/* Ver todas as vendas que tiveram um desconto superior a 10% */
SELECT *
FROM venda
WHERE desconto > .11;

/* Ver todos os id_vendas, Nomes de cliente e Localidade de cliente */
SELECT v.id_venda, c.nome, c.cidade
FROM cliente AS c
JOIN venda AS v
ON c.id_cliente = v.id_cliente;

/* Ver todos as descrições e preço unitário de produtos da venda 9 */
SELECT p.descricao, p.preco
FROM produto AS p
JOIN linha_venda AS lv
ON p.id_produto = lv.id_produto
JOIN venda AS v
ON lv.id_venda = v.id_venda
WHERE v.id_venda = 9;

/* Ver todas as descrições, preço unitário e quantidade da venda 10 */
SELECT p.descricao, p.preco, lv.quantidade
FROM produto AS p
JOIN linha_venda AS lv
ON p.id_produto = lv.id_produto
JOIN venda AS v
ON lv.id_venda = v.id_venda
WHERE v.id_venda = 10;

/* Ver exatamente os mesmos atributos que o ponto anterior, acrescentando uma coluna chamada ‘Total por Produto’ que multiplica o preço unitário e quantidade */
SELECT p.descricao, p.preco, lv.quantidade, ROUND(p.preco*lv.quantidade,2) AS 'Total por produto'
FROM produto AS p
JOIN linha_venda AS lv
ON p.id_produto = lv.id_produto
JOIN venda AS v
ON lv.id_venda = v.id_venda
WHERE v.id_venda = 10;

/* Ver todos os produtos vendidos entre 2021-05-01 e 2021-08-01 */
SELECT p.*
FROM produto AS p
JOIN linha_venda AS lv
ON p.id_produto = lv.id_produto
JOIN venda AS v
ON lv.id_venda = v.id_venda
WHERE v.data_venda BETWEEN '2021-05-01' AND '2021-08-01';

/* Ver o total faturado em cada venda, sem desconto aplicado (ter atenção ao group by) */
SELECT v.id_venda,ROUND(SUM(p.preco * lv.quantidade),2) AS 'Total Facturado'
FROM produto AS p
JOIN linha_venda AS lv
ON p.id_produto = lv.id_produto
JOIN venda AS v
ON lv.id_venda = v.id_venda
WHERE v.desconto = 0
GROUP BY v.id_venda;

/* Ver quais os produtos vendidos a clientes de ‘Gaia’ */
SELECT *
FROM cliente AS c
JOIN venda AS v
ON c.id_cliente = v.id_cliente
JOIN linha_venda AS lv
ON v.id_venda = lv.id_venda
JOIN produto AS p
ON lv.id_produto = p.id_produto
WHERE c.cidade='Gaia';