-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;

-- Selecionando o banco de dados
USE db_pizzaria_legal;

-- Criando a tabela categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL, 
    descricao VARCHAR(255) NOT NULL
);

-- Criando a tabela pizzas
CREATE TABLE IF NOT EXISTS tb_pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL, 
    ingredientes VARCHAR(255) NOT NULL, 
    preco DECIMAL(10, 2) NOT NULL, 
    tamanho VARCHAR(20) NOT NULL, 
    id_categoria INT NOT NULL, 
	borda_recheada BOOLEAN DEFAULT FALSE,      
    tipo_borda VARCHAR(50) DEFAULT NULL,     
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserindo os registros na tabela de categorias
INSERT INTO tb_categorias (nome, descricao) VALUES
('Clássica', 'Sabores tradicionais e adorados por todos'),
('Tradicional', 'Uma seleção de sabores que combinam com qualquer momento'),
('Especial', 'Pizza com sabores diferentes'),
('Vegetariana', 'Pizza amiga dos animais'),
('Doce', 'Pizza doce, feita especialmente para você');

-- Inserindo os registros na tabela de pizzas
INSERT INTO tb_pizzas (nome, ingredientes, preco, tamanho, id_categoria, borda_recheada, tipo_borda) VALUES
('Mussarela', 'Mussarela, molho de tomate', 35.00, 'Média', 1, FALSE, NULL), 
('Marguerita', 'Mussarela, tomate, manjericão', 38.00, 'Média', 1, FALSE, NULL), 
('Calabresa', 'Mussarela, calabresa, cebola, orégano', 38.00, 'Média', 1, FALSE, NULL), 
('Quatro Queijos', 'Mussarela, provolone, parmesão, gorgonzola', 55.00, 'Grande', 2, TRUE, 'Cheddar'), 
('Frango com Catupiry', 'Mussarela, frango desfiado, catupiry', 45.00, 'Média', 2, TRUE, 'Catupiry'),
('Portuguesa', 'Mussarela, presunto, ovos, cebola, pimentão, azeitona', 50.00, 'Grande', 2, FALSE, NULL), 
('Americana', 'Mussarela, presunto, bacon, ovos', 55.00, 'Grande', 3, FALSE, NULL), 
('Carne de Sol', 'Mussarela, carne de sol, queijo coalho, cebola', 60.00, 'Grande', 2, TRUE, 'Catupiry'), 
('Abobrinha', 'Abobrinha grelhada, alho, azeite', 40.00, 'Média', 4, FALSE, NULL), 
('Milho', 'Milho', 40.00, 'Média', 4, FALSE, NULL), 
('Chocolate', 'Chocolate ao leite, granulado', 42.00, 'Pequena', 5, TRUE, 'Chocolate'), 
('Chocolate com Morango', 'Chocolate ao leite, morangos frescos', 45.00, 'Média', 5, TRUE, 'Chocolate'), 
('Banana com Doce de Leite', 'Banana, doce de leite, canela', 50.00, 'Média', 5, TRUE, 'Chocolate');



-- Selecionando pizzas cujo preço seja maior que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- Selecionando pizzas cujo preço esteja entre R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- Selecionando pizzas que tenham a letra "M" no nome
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- Realizando INNER JOIN entre tb_pizzas e tb_categorias
SELECT 
    p.nome AS Nome_da_Pizza, 
    c.nome AS Categoria, 
    p.preco AS Preço, 
    p.tipo_borda AS Borda_Recheada
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- Realizando INNER JOIN entre tb_pizzas e tb_categorias para listar apenas pizzas doces
SELECT 
    p.nome AS Nome_da_Pizza, 
    c.nome AS Categoria, 
    p.preco AS Preço, 
    p.tipo_borda AS Borda_Recheada
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome = 'Doce';


