CREATE DATABASE funcionarios;

USE funcionarios;

CREATE TABLE tb_funcionarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    Nome varchar(255),
    Departamento varchar(50)
);

INSERT INTO tb_funcionarios(Nome, Departamento)
VALUES('Joao','Administrativo'),
('Pedro', 'RH'),
('Ana', 'Administrativo');

CREATE VIEW vw_funcionarios_departamentos AS
SELECT id, Nome, Departamento
FROM tb_funcionarios
WHERE Departamento = 'Administrativo';

select * FROM vw_funcionarios_departamentos;
