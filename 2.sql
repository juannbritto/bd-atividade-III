CREATE DATABASE Banco;

USE Banco;

CREATE TABLE contas(
	id_conta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    Saldo DECIMAL(10,2)
);

CREATE TABLE transacoes(
	id_transacao INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(20),
    valor Decimal(10,2),
    id_conta INT,
    FOREIGN KEY (id_conta) REFERENCES contas(id_conta)
);

DELIMITER //

CREATE TRIGGER tg_atualizar_saldo_conta
AFTER INSERT ON transacoes
FOR EACH ROW
BEGIN
    UPDATE contas
    IF tipo = 'Entrada' THEN saldo = saldo + valor 
    WHERE id_livro = NEW.id_livro;
END; //

DELIMITER ;