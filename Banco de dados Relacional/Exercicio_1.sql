CREATE DATABASE banco_de_dados_RH;
USE banco_de_dados_RH;

CREATE TABLE colaboradores(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    data_admissao DATE,
    salario DECIMAL(6,2),
    PRIMARY KEY(id)
);

INSERT INTO colaboradores(nome, cargo, data_admissao, salario)
VALUES 
    ("Raquel", "Back-End", "2023-02-18", 2000),
    ("João", "Front-End", "2022-05-19", 1000),
    ("Maria", "Full Stack", "2024-03-20", 1500),
    ("Augusto", "Dados", "2020-07-06", 6000);

SELECT * FROM colaboradores WHERE salario > 2000;
SELECT * FROM colaboradores WHERE salario < 2000;

SELECT * FROM colaboradores;

SELECT * FROM colaboradores WHERE id = 1;
                    
           