CREATE DATABASE produto;

USE produto;

CREATE TABLE tb_produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255),
  validade DATE
);

DELIMITER //

CREATE TRIGGER tg_validar_data_validade
BEFORE INSERT ON 

tb_produto
FOR EACH ROW
BEGIN
    IF NEW.validade < '2025-01-01' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O produto está  com a data de validade vencida';
    END IF;
END //

DELIMITER ;

INSERT INTO 
tb_produto (nome, validade) VALUES ('Leite liquido', '2024-01-01');