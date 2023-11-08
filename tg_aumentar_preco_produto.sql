CREATE DATABASE produto_preco;

USE produto_preco;

CREATE TABLE produto_preco (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255),
  preco double
);

DELIMITER //

CREATE TRIGGER tg_aumentar_preco_produto
AFTER INSERT ON produto_preco
FOR EACH ROW
BEGIN
   UPDATE produto_preco SET preco = preco * 1.10;
END; //

DELIMITER ;

INSERT INTO produto_preco(nome, preco)
VALUES ('Escova', 100);

UPDATE produto_preco
SET preco = 200
WHERE id = 2;

SELECT * FROM produto_preco
WHERE id = 2;

