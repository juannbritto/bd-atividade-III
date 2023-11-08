CREATE DATABASE RH;

USE RH;

CREATE TABLE tb_funcionarios(
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    Cargo VARCHAR(255)
);

CREATE TABLE tb_funcionarios_demitidos(
    idDemitido INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cargo VARCHAR(255)    
);

DELIMITER //

CREATE TRIGGER tg_registro_exclusao
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO tb_funcionarios_demitidos (idDemitido, nome, cargo)
    VALUES (OLD.idFuncionario, OLD.nome, OLD.cargo);
END; //

DELIMITER ;

INSERT INTO tb_funcionarios(nome, cargo)
VALUES('Joao', 'Gerente');

DELETE FROM tb_funcionarios
WHERE idFuncionario = 1;

SELECT * FROM tb_funcionarios_demitidos;


