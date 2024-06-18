-- Drop do banco de dados "movie" se existir
DROP DATABASE IF EXISTS movie;

-- Criação do banco de dados chamado "movie"
CREATE DATABASE movie;

USE movie;

CREATE TABLE login (
id int AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(120),
email VARCHAR(120),
senha VARCHAR(120)
);

CREATE TABLE login_adm (
id int AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(120),
email VARCHAR(120),
senha_adm VARCHAR(120)
);




