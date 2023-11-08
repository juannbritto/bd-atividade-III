CREATE DATABASE dependente;

USE dependente;

CREATE TABLE tb_funcionarios(
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

CREATE TABLE tb_dependentes(
    idDependente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    idFuncionario INT,
    FOREIGN KEY (idFuncionario) REFERENCES tb_funcionarios(idFuncionario)
);


DELIMITER //

CREATE TRIGGER tg_exclusao_dependentes
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM tb_dependentes
    WHERE idFuncionario = OLD.idFuncionario;
END; //

DELIMITER ;

INSERT INTO tb_funcionarios(nome)
VALUES('Pedro');

INSERT INTO tb_dependentes(nome, idFuncionario)
VALUES('Julia', 1);

DELETE FROM tb_funcionarios
WHERE idFuncionario = 1;

SELECT * FROM tb_dependentes;