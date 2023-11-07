CREATE DATABASE estoque;

USE estoque;

CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL
);

INSERT INTO produtos(nome, quantidade)
VALUES('Sabão', 2),
('Detergente', 3),
('Escova', 6),
('Saco', 1),
('Água Sanitaria', 10);

CREATE VIEW vw_estoque_insuficiente AS
SELECT id, nome, quantidade
FROM produtos 
WHERE quantidade < 5;

SELECT * FROM vw_estoque_insuficiente;
