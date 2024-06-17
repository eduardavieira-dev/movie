-- Drop do banco de dados "movie" se existir
DROP DATABASE IF EXISTS movie;

-- Criação do banco de dados chamado "movie"
CREATE DATABASE movie;

USE movie;

CREATE TABLE RA (
    cod_ra int AUTO_INCREMENT PRIMARY KEY,
    RA VARCHAR(120),
    nome_funcionario VARCHAR(120)
);

CREATE TABLE login_adm (
cod_adm int AUTO_INCREMENT PRIMARY KEY,
senha_adm Varchar(120),
isOf boolean DEFAULT true,
cod_ra int,
FOREIGN KEY (cod_ra) REFERENCES RA(cod_ra)
);

CREATE TABLE usuario (
    id int AUTO_INCREMENT PRIMARY KEY,
    nome Varchar(120),
    email Varchar(120),
    senha Varchar(120),
    isOf boolean DEFAULT false 
);


INSERT INTO RA (RA, nome_funcionario) VALUES 
('RA123', 'João Silva'),
('RA456', 'Maria Oliveira'),
('RA789', 'Pedro Souza'),
('RA101', 'Ana Santos'),
('RA202', 'Carlos Pereira');

INSERT INTO login_adm (cod_ra, senha_adm) VALUES 
(1, 'senha'),
(2, 'senha'),
(3, 'senha'),
(4, 'senha'),
(5, 'senha');

