CREATE DATABASE notificacao;

USE notificacao;

CREATE TABLE pedidos(
	idPedidos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO pedidos(nome)
VALUES('Açai'),
('Coxinha'),
('Pizza');

CREATE TABLE status_pedido(
	idStatus INT PRIMARY KEY AUTO_INCREMENT,
    status_pedido VARCHAR(50),
    idPedidos INT,
    FOREIGN KEY (idPedidos) REFERENCES pedidos(idPedidos)
);

INSERT INTO status_pedido(status_pedido, idPedidos)
VALUES('Entregue', 1),
('Pendente', 2),
('Pendente', 3);

CREATE DATABASE notificacao;

USE notificacao;

CREATE TABLE pedidos(
	idPedidos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO pedidos(nome)
VALUES('Açai'),
('Coxinha'),
('Pizza');

CREATE TABLE status_pedido(
	idStatus INT PRIMARY KEY AUTO_INCREMENT,
    status_pedido VARCHAR(50),
    idPedidos INT,
    FOREIGN KEY (idPedidos) REFERENCES pedidos(idPedidos)
);

INSERT INTO status_pedido(status_pedido, idPedidos)
VALUES('Entregue', 1),
('Pendente', 2),
('Pendente', 3);

CREATE DATABASE notificacao;

USE notificacao;

CREATE TABLE pedidos(
	idPedidos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO pedidos(nome)
VALUES('Açai'),
('Coxinha'),
('Pizza');

CREATE TABLE status_pedido(
	idStatus INT PRIMARY KEY AUTO_INCREMENT,
    status_pedido VARCHAR(50),
    idPedidos INT,
    FOREIGN KEY (idPedidos) REFERENCES pedidos(idPedidos)
);

INSERT INTO status_pedido(status_pedido, idPedidos)
VALUES('Entregue', 1),
('Pendente', 2),
('Pendente', 3);

CREATE VIEW vw_pedidos_pendentes AS
SELECT p.idPedidos, p.nome AS 'Nome do Pedido', sp.status_pedido AS 'Status do Pedido'
FROM pedidos p
JOIN status_pedido sp ON p.idPedidos = sp.idPedidos
WHERE sp.status_pedido = 'Pendente';

SELECT * FROM vw_pedidos_pendentes;