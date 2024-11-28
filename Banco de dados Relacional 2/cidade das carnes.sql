-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS cidade_das_carnes;

-- Selecionando o banco de dados
USE cidade_das_carnes;

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
    peso DECIMAL(10,2) NOT NULL,                 
    validade DATE NOT NULL,                    
    id_categoria INT,                            
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria) 
);

-- Inserindo categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) 
VALUES 
('Carnes', 'Produtos de carne bovina, suína'),
('Aves', 'Frangos, perus e outros com temperos naturais'),
('Frutas', 'Frutas como abacaxi, laranja, manga e melancia'),
('Verduras', 'Alimentos frescos como alface, rúcula, espinafre'),
('Legumes', 'Produtos como cenoura, batata, abóbora e beterraba');

-- Inserindo produtos
INSERT INTO tb_produtos (nome_produto, preco, peso, validade, id_categoria)
VALUES
('Maminha Bovina', 140.00, 1.5, '2024-12-31', 1),  
('Peito de Frango Temperado', 22.00, 1.0, '2024-12-25', 2),  
('Melancia', 7.00, 2.0, '2024-11-20', 3),    
('Espinafre Orgânico', 5.00, 0.5, '2024-11-18', 4),     
('Cenoura Fresca', 4.00, 1.0, '2025-05-01', 5), 
('Picanha Bovina', 180.00, 2.5, '2024-12-31', 1),  
('Frango Assado Temperado', 25.00, 2.0, '2025-01-15', 2), 
('Abóbora Japonesa', 9.00, 2.0, '2024-12-01', 5);         

-- SELECT que retorna todos os produtos cujo valor seja maior que R$ 50,00
SELECT * FROM tb_produtos
WHERE preco > 50.00;

-- SELECT que retorna todos os produtos com preço entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 50.00 AND 150.00;

-- SELECT que retorna produtos que possuem a letra C no nome
SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

-- SELECT com INNER JOIN para unir tb_produtos e tb_categorias
SELECT p.id_produto, p.nome_produto, p.preco, p.peso, p.validade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- SELECT com INNER JOIN para trazer produtos da categoria 'Carnes'
SELECT p.id_produto, p.nome_produto, p.preco, p.peso, p.validade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Carnes';

-- SELECT com INNER JOIN para trazer produtos da categoria 'Frutas'
SELECT p.id_produto, p.nome_produto, p.preco, p.peso, p.validade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Frutas';
