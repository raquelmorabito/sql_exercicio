-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;

-- Selecionando o banco de dados
USE db_farmacia_bem_estar;

-- Criando a tabela categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria VARCHAR(255) NOT NULL
);

-- Criando a tabela produtos
CREATE TABLE IF NOT EXISTS tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    localizacao VARCHAR(255) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- Inserindo os registros na tabela de categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria)
VALUES
('Analgésicos', 'Medicamentos usados para aliviar dor'),
('Anti-inflamatórios', 'Medicamentos para reduzir inflamação'),
('Antipiréticos', 'Medicamentos para baixar a febre'),
('Antibióticos', 'Medicamentos usados para tratar infecções bacterianas'),
('Fitoterápicos', 'Medicamentos de origem vegetal com propriedades terapêuticas');

-- Inserindo os produtos na tabela de produtos
INSERT INTO tb_produtos (nome_produto, preco, localizacao, id_categoria)
VALUES
('Paracetamol 500mg', 10.00, 100, 1),  -- Categoria: Analgésicos
('Ibuprofeno 400mg', 15.00, 150, 2),  -- Categoria: Anti-inflamatórios
('Dipirona 1g', 12.00, 200, 1),      -- Categoria: Analgésicos
('Amoxicilina 500mg', 20.00, 120, 4), -- Categoria: Antibióticos
('Azitromicina 500mg', 35.00, 80, 4), -- Categoria: Antibióticos
('Vitamina C 500mg', 30.00, 120, 5),  -- Categoria: Fitoterápicos
('Ômega 3', 45.00, 150, 5),          -- Categoria: Fitoterápicos
('Paracetamol 500mg Genérico', 8.00, 200, 1); -- Categoria: Analgésicos


--  Selecionando todos os produtos cujo valor seja maior que R$ 50,00
SELECT * FROM tb_produtos
WHERE preco > 50.00;

-- Selecionando todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 5.00 AND 60.00;

-- Selecionando todos os produtos cujo nome contenha a letra 'C' (utilizando LIKE)
SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

-- Selecionando todos os produtos, unindo a tabela tb_produtos com a tabela tb_categorias
SELECT p.id_produto, p.nome_produto, p.preco, p.localizacao, c.nome_categoria, c.descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- Selecionando todos os produtos que pertencem à categoria 'Fitoterápicos'
SELECT p.id_produto, p.nome_produto, p.preco, p.localizacao, c.nome_categoria, c.descricao_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Fitoterápicos';

