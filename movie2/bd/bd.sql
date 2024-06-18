-- Drop do banco de dados "movie" se existir
DROP DATABASE IF EXISTS movie;

-- Criação do banco de dados chamado "movie"
CREATE DATABASE movie;

USE movie;

CREATE TABLE usuario (
id int AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(120),
email VARCHAR(120),
senha VARCHAR(120)
);

CREATE TABLE senhaadm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    senha VARCHAR(120)
);

CREATE TABLE adm (
id int AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(120),
email VARCHAR(120),
senha_adm VARCHAR(120)
);

CREATE TABLE generos (
id int AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(120)
);

CREATE TABLE filmes (
id int AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(120),
imagem VARCHAR(120),
genero INT,
video VARCHAR(120),
FOREIGN KEY (genero) REFERENCES generos(id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB;

INSERT INTO generos (nome) VALUES
('Ação'),
('Comédia'),
('Drama'),
('Ficção Científica'),
('Terror'),
('Romance'),
('Animação'),
('Documentário'),
('Fantasia');

INSERT INTO adm (nome, senha_adm)
VALUES ('tiago', '$2y$10$bJ0ZKj8eOI1u.r3HWae2EOGsq2SbufwIfFqGPrB9EuqRWawkeUDAe');





