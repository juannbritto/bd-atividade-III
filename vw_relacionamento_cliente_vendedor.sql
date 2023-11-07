CREATE DATABASE relacionamento;

USE relacionamento;

CREATE TABLE relacionamento(
	idRelacionamento INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255)
);

INSERT INTO relacionamento(tipo)
VALUES('Parente'),
('Sem Parentesco');

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idRelacionamento INT,
    FOREIGN KEY (idRelacionamento) REFERENCES relacionamento(idRelacionamento)
);

INSERT INTO cliente(nome, idRelacionamento)
VALUES('Joao',1);

CREATE TABLE vendedor(
	idVendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

INSERT INTO vendedor(nome, idCliente)
VALUES ('Pedro', 1);

CREATE VIEW vw_relacionamento_cliente_vendedor AS
SELECT cliente.idCliente, cliente.nome AS 'Nome do Cliente', vendedor.idVendedor, vendedor.nome AS 'Nome Vendedor', relacionamento.idRelacionamento, relacionamento.tipo AS 'Tipo do Relacionamento'
FROM cliente
INNER JOIN vendedor ON cliente.idCliente = vendedor.idCliente
INNER JOIN relacionamento ON cliente.idRelacionamento = vendedor.idVendedor
ORDER BY cliente.idCliente;

SELECT * FROM vw_relacionamento_cliente_vendedor;


