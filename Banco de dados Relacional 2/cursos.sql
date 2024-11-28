-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;

-- Selecionando o banco de dados
USE db_curso_da_minha_vida;

-- Criando a tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,  
    nome_categoria VARCHAR(100) NOT NULL,        
    descricao_categoria VARCHAR(255) NOT NULL    
);

-- Criando a tabela tb_cursos
CREATE TABLE IF NOT EXISTS tb_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,    
    nome_curso VARCHAR(100) NOT NULL,         
    preco DECIMAL(10,2) NOT NULL,           
    duracao INT NOT NULL,                 
    carga_horaria INT NOT NULL,                
    id_categoria INT,                         
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria) 
);

-- Inserindo categorias
INSERT INTO tb_categorias (nome_categoria, descricao_categoria) 
VALUES 
('Programação', 'Cursos relacionados a linguagens de programação e desenvolvimento de software'),
('Design', 'Cursos sobre design gráfico, web design e UX/UI'),
('Marketing Digital', 'Cursos sobre estratégias de marketing digital e mídias sociais'),
('Gestão de Projetos', 'Cursos sobre gerenciamento e organização de projetos'),
('Análise de Dados', 'Cursos sobre análise de dados e ciência de dados');

-- Inserindo cursos
INSERT INTO tb_cursos (nome_curso, preco, duracao, carga_horaria, id_categoria)
VALUES
('Curso de Java para Iniciantes', 450.00, 40, 60, 1),     
('Curso de Design Gráfico', 350.00, 30, 40, 2),           
('Curso de Marketing para Iniciantes', 500.00, 20, 30, 3), 
('Curso de Gestão de Projetos Ágeis', 600.00, 50, 80, 4),  
('Curso de Introdução a Data Science', 550.00, 45, 70, 5),
('Curso de Desenvolvimento Web', 700.00, 60, 100, 1),     
('Curso de UX/UI Design', 650.00, 40, 60, 2),            
('Curso de SEO e Estratégias de Marketing', 800.00, 35, 50, 3); 


-- SELECT que retorna todos os cursos cujo valor seja maior que R$ 500,00
SELECT * FROM tb_cursos
WHERE preco > 500.00;

-- SELECT que retorna todos os cursos com preço entre R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos
WHERE preco BETWEEN 600.00 AND 1000.00;

-- SELECT que retorna cursos que possuem a letra J no nome
SELECT * FROM tb_cursos
WHERE nome_curso LIKE '%J%';

-- SELECT com INNER JOIN para unir tb_cursos e tb_categorias
SELECT c.id_curso, c.nome_curso, c.preco, c.duracao, c.carga_horaria, cat.nome_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria;

-- SELECT com INNER JOIN para trazer cursos da categoria 'Programação'
SELECT c.id_curso, c.nome_curso, c.preco, c.duracao, c.carga_horaria, cat.nome_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria
WHERE cat.nome_categoria = 'Programação';
