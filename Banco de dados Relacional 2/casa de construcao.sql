-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS db_construindo_vidas;

-- Selecionando o banco de dados
USE db_construindo_vidas;

-- Criando a tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY, 
    nome_categoria VARCHAR(100) NOT NULL,        
    descricao_categoria VARCHAR(255) NOT NULL    
);

-- Criando a tabela tb_produtos
CREATE TABLE IF NOT EXISTS tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,   
    nome_produto VARCHAR(100) NOT NULL,         
    preco DECIMAL(10,2) NOT NULL,              
    unidade VARCHAR(50) NOT NULL,               
    estoque INT NOT NULL,                        
    id_categoria INT,                           
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria) 
);

-- Inserindo categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) 
VALUES 
('Hidráulico', 'Materiais para instalação e reparos hidráulicos'),
('Elétrico', 'Materiais para instalações elétricas e manutenção'),
('Ferramentas', 'Ferramentas manuais e elétricas para construção'),
('Tintas', 'Tintas e acabamentos para construção e decoração'),
('Madeiras', 'Madeiras para construção civil e marcenaria');

-- Inserindo produtos
INSERT INTO tb_produtos (nome_produto, preco, unidade, estoque, id_categoria)
VALUES
('Tubo PVC 50mm', 10.50, 'metro', 100, 1),      
('Fio Elétrico 1.5mm', 2.80, 'metro', 500, 2),  
('Chave Inglesa 24"', 45.00, 'unidade', 200, 3), 
('Tinta Acrílica Branca 18L', 150.00, 'litro', 50, 4), 
('Madeira de Pinus 2x4', 35.00, 'metro', 80, 5), 
('Tubo PVC 75mm', 20.00, 'metro', 60, 1),      
('Fita Isolante 7mm', 5.00, 'rolo', 300, 2),  
('Martelo de 500g', 15.00, 'unidade', 120, 3);   


-- SELECT que retorna todos os produtos cujo valor seja maior que R$ 100,00
SELECT * FROM tb_produtos
WHERE preco > 100.00;

-- SELECT que retorna todos os produtos com preço entre R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 70.00 AND 150.00;

-- SELECT que retorna produtos que possuem a letra C no nome
SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

-- SELECT com INNER JOIN para unir tb_produtos e tb_categorias
SELECT p.id_produto, p.nome_produto, p.preco, p.unidade, p.estoque, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- SELECT com INNER JOIN para trazer produtos da categoria 'Hidráulico'
SELECT p.id_produto, p.nome_produto, p.preco, p.unidade, p.estoque, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Hidráulico';
