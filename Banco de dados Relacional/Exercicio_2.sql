CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE produto(
    id BIGINT AUTO_INCREMENT,
    produto VARCHAR(255),
    preco DECIMAL(6,2),
    marca VARCHAR(225),
    quantidade int,
    PRIMARY KEY (id)
);

INSERT INTO produto(produto, preco, marca, quantidade)
VALUES 
    ("Molho de tomate", 5.00, "Tarantela", 10),
    ("Macarrão", 6.50, "Adria", 20),
    ("Queijo Parmesão", 10.00, "Faixa Azul", 50),
    ("Salsicha", 7.00, "Sadia", 100),
    ("Manjericão", 5.00, "Orgânico", 10),
    ("Alho", 6.50, "Orgânico", 20),
    ("Cebola", 10.00, "Orgânico", 70),
    ("Tomate", 7.00, "Orgânico", 60);


SELECT * FROM produto WHERE preco > 500;
SELECT * FROM produto WHERE preco < 500;

SELECT * FROM produto;

UPDATE produto SET preco = 10 WHERE id = 5;