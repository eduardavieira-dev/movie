-- Drop do banco de dados "movie" se existir
DROP DATABASE IF EXISTS movie;

-- Criação do banco de dados chamado "movie"
CREATE DATABASE movie;

-- Uso do banco de dados "movie"
USE movie;

-- Criação da tabela "usuarios" para armazenar informações dos usuários
CREATE TABLE usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,      -- Chave primária auto-incrementada para identificação única do usuário
    nome_usuario VARCHAR(50) NOT NULL UNIQUE,      -- Nome de usuário, deve ser único e não nulo
    email VARCHAR(100) NOT NULL UNIQUE,            -- Email do usuário, deve ser único e não nulo
    senha VARCHAR(255) NOT NULL,                   -- Senha do usuário, não nula
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Data de criação do usuário, padrão é a hora atual
);

-- Criação da tabela "admins" para armazenar informações dos administradores
CREATE TABLE admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,        -- Chave primária auto-incrementada para identificação única do administrador
    nome_usuario VARCHAR(50) NOT NULL UNIQUE,      -- Nome de usuário do administrador, deve ser único e não nulo
    email VARCHAR(100) NOT NULL UNIQUE,            -- Email do administrador, deve ser único e não nulo
    senha VARCHAR(255) NOT NULL,                   -- Senha do administrador, não nula
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Data de criação do administrador, padrão é a hora atual
);

-- Criação da tabela "categorias" para armazenar as categorias dos vídeos
CREATE TABLE categorias (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,    -- Chave primária auto-incrementada para identificação única da categoria
    nome_categoria VARCHAR(50) NOT NULL UNIQUE     -- Nome da categoria, deve ser único e não nulo
);

-- Criação da tabela "videos" para armazenar os vídeos
CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,        -- Chave primária auto-incrementada para identificação única do vídeo
    titulo VARCHAR(255) NOT NULL,                  -- Título do vídeo, não nulo
    descricao TEXT,                                -- Descrição do vídeo
    dados_video LONGBLOB NOT NULL,                 -- Dados binários do vídeo, não nulo
    tipo_video ENUM('filme', 'serie', 'videoclipe') NOT NULL,  -- Tipo do vídeo, pode ser 'filme', 'serie' ou 'videoclipe', não nulo
    categoria_id INT,                              -- Chave estrangeira referenciando a categoria do vídeo
    carregado_por INT,                             -- Chave estrangeira referenciando o administrador que fez o upload
    carregado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de upload do vídeo, padrão é a hora atual
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id),  -- Definição da chave estrangeira para a tabela "categorias"
    FOREIGN KEY (carregado_por) REFERENCES admins(admin_id)          -- Definição da chave estrangeira para a tabela "admins"
);

-- Inserção de dados na tabela "usuarios"
INSERT INTO usuarios (nome_usuario, email, senha)
VALUES 
('user1', 'user1@example.com', 'senha1'),  -- Inserção do usuário 1
('user2', 'user2@example.com', 'senha2'),  -- Inserção do usuário 2
('user3', 'user3@example.com', 'senha3');  -- Inserção do usuário 3

-- Inserção de dados na tabela "admins"
INSERT INTO admins (nome_usuario, email, senha)
VALUES 
('admin1','admin1@example.com', 'senha1' ),  -- Inserção do administrador 1
('admin2', 'admin2@example.com', 'senha2');  -- Inserção do administrador 2

-- Inserção de dados na tabela "categorias"
INSERT INTO categorias (nome_categoria)
VALUES 
('Ação'),           -- Inserção da categoria "Ação"
('Comédia'),        -- Inserção da categoria "Comédia"
('Drama'),          -- Inserção da categoria "Drama"
('Música'),         -- Inserção da categoria "Música"
('Documentário');   -- Inserção da categoria "Documentário"
