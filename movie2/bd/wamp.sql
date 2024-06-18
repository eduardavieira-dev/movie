-- Drop do banco de dados "movie" se existir
DROP DATABASE IF EXISTS movie;

-- Criação do banco de dados chamado "movie"
CREATE DATABASE movie;

USE movie;

-- Criação da tabela "usuario"
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120),
    email VARCHAR(120),
    senha VARCHAR(120)
);

-- Criação da tabela "adm"
CREATE TABLE adm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120),
    email VARCHAR(120),
    senha_adm VARCHAR(120)
);

-- Criação da tabela "generos"
CREATE TABLE generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120)
);

-- Criação da tabela "filmes" sem chave estrangeira
CREATE TABLE filmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120),
    imagem VARCHAR(120),
    genero INT,
    video VARCHAR(120)
);

-- Inserção de dados na tabela "generos"
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


-- Adição da chave estrangeira na tabela "filmes"
ALTER TABLE filmes
ADD CONSTRAINT fk_genero
FOREIGN KEY (genero) REFERENCES generos(id) ON DELETE SET NULL ON UPDATE CASCADE;
