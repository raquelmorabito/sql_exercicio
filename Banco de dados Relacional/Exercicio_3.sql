CREATE DATABASE escola;
USE escola;

CREATE TABLE alunos(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    matricula INT UNIQUE,
    turma VARCHAR(225),
    nota DECIMAL(6.2),
    PRIMARY KEY (id)
);

INSERT INTO alunos(nome, matricula, turma, nota)
VALUES 
    ("Maria", 1040, "1ºA", 10),
    ("João", 1041, "5ºB", 6),
    ("Pedro", 1042, "9ºC", 5),
    ("Ana", 1043, "2ºA", 8),
    ("Carlos", 1044, "3ºB", 7),
    ("Fernanda", 1045, "4ºC", 9),
    ("Rafael", 1046, "5ºA", 6.5),
    ("Beatriz", 1047, "6ºB", 8),
    ("Lucas", 1048, "7ºC", 7);

SELECT * FROM alunos WHERE nota > 7;
SELECT * FROM alunos WHERE nota < 7;

SELECT * FROM alunos;

UPDATE alunos SET nota = 10 WHERE id = 5;
