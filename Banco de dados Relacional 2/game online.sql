-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS db_generation_game_online;

-- Selecionando o banco de dados
USE db_generation_game_online;

-- Criando a tabela classes
CREATE TABLE IF NOT EXISTS tb_classes (
    id_class INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL,               
    descricao VARCHAR(255) NOT NULL          
);

-- Criandado a tabela de personagens
CREATE TABLE IF NOT EXISTS tb_personagens (
    id_personagem INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL,                    
    poder_ataque INT NOT NULL,                   
    poder_defesa INT NOT NULL,                   
    nivel INT NOT NULL,                           
    id_classe INT NOT NULL,                      
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_class) 
);

-- Inserindo os registros na tabela de classes
INSERT INTO tb_classes (nome, descricao) VALUES
('Princesa', 'Graciosas e estratégica'),
('Sereia', 'Criaturas aquáticas com canto hipnotizante'),
('Bruxa', 'Usuárias de feitiços poderosos e poções'),
('Vampira', 'Seres ágeis com habilidades noturnas'),
('Fada', 'Pequenas criaturas mágicas e protetoras');

-- Inserindo os registros na tabela de personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, id_classe) VALUES
('Aurora', 2200, 1800, 18, 1), 
('Ariel', 2500, 1600, 20, 2), 
('Ursula', 2700, 1500, 22, 3),
('Bella', 3000, 1700, 25, 4), 
('Tinker Bell', 2000, 1900, 15, 5),  
('Morgana', 2600, 1400, 19, 3), 
('Moana', 2400, 1800, 16, 1), 
('Yara', 2300, 1500, 17, 2);  


-- Selecionando personagens com poder de ataque maior que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- Selecionando personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Selecionando personagens cujo nome contém a letra "C"
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- Fazendo um INNER JOIN para unir tb_personagens e tb_classes
SELECT p.nome AS Personagem, c.nome AS Classe, p.poder_ataque AS 'Poder de Ataque', 
       p.poder_defesa AS 'Poder de Defesa', p.nivel AS Nível
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_class;

-- Fazendo um INNER JOIN para listar apenas os personagens da classe "Bruxa"
SELECT p.nome AS Personagem, c.nome AS Classe, p.poder_ataque AS 'Poder de Ataque', 
       p.poder_defesa AS 'Poder de Defesa', p.nivel AS Nível
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_class
WHERE c.nome = 'Bruxa';


