CREATE DATABASE produto_venda;

USE produto_venda;

CREATE TABLE produtos (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    estoque INT
);


CREATE TABLE venda_produto(
	idVenda INT AUTO_INCREMENT PRIMARY KEY,
    idProduto INT,
    quantidade INT,
    FOREIGN KEY (idProduto) REFERENCES produtos(idProduto)    
);

DELIMITER //

CREATE TRIGGER tg_atualizar_estoque_produto
AFTER INSERT ON venda_produto
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET estoque = estoque - NEW.quantidade
    WHERE idProduto = NEW.idProduto;
END; //

DELIMITER ;

INSERT INTO produtos(nome, estoque)
VALUES('Vassoura', 100);

INSERT INTO venda_produto(idProduto, quantidade)
VALUES(1, 90);

SELECT * FROM produtos;