CREATE DATABASE produtos_caros;

USE produtos_caros;

CREATE TABLE produtos_caros(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco double NOT NULL
);

INSERT INTO produtos_caros(nome, preco)
VALUES('Colar', 1000),
('Anel', 2000),
('Brinco', 5000),
('Pulseira', 50);

CREATE VIEW vw_produtos_caros AS
SELECT nome, preco
FROM produtos_caros
WHERE preco > 100;

SELECT * FROM vw_produtos_caros;