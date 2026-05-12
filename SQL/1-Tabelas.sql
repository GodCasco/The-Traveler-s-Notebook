DROP DATABASE IF EXISTS trabalhopratico;
CREATE DATABASE trabalhopratico;
USE trabalhopratico;

CREATE TABLE utilizador (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    apelido VARCHAR(45) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telemovel VARCHAR(17)
);

CREATE TABLE cidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    classificacao_geral DECIMAL(3, 2),
    classificacao_pontos_turisticos DECIMAL(3, 2),
    classificacao_gastronomia DECIMAL(3, 2),
    classificacao_paisagens DECIMAL(3, 2),
    classificacao_alojamentos DECIMAL(3, 2)
);

CREATE TABLE ponto_de_interesse (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    rua VARCHAR(75),
    classificacao_media DECIMAL(3, 2),
    cidade_id INT NOT NULL,
    FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE avaliacao(
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_avaliacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    comentario VARCHAR(500),
    nota_geral INT NOT NULL CHECK (nota_geral BETWEEN 0 AND 5),
    nota_pontos_turisticos INT CHECK (nota_pontos_turisticos BETWEEN 0 AND 5),
    nota_gastronomia INT CHECK (nota_gastronomia BETWEEN 0 AND 5),
    nota_paisagens INT CHECK (nota_paisagens BETWEEN 0 AND 5),
    nota_alojamentos INT CHECK (nota_alojamentos BETWEEN 0 AND 5),
    utilizador_id INT NOT NULL,
    cidade_id INT,
    ponto_interesse_id INT,
    FOREIGN KEY (utilizador_id) REFERENCES utilizador(id) ON DELETE CASCADE,
    FOREIGN KEY (cidade_id) REFERENCES cidade(id),
    FOREIGN KEY (ponto_interesse_id) REFERENCES ponto_de_interesse(id),
    CONSTRAINT chk_origem_avaliacao CHECK (cidade_id IS NOT NULL OR ponto_interesse_id IS NOT NULL)
);

CREATE INDEX idx_cidade_nome    ON cidade(nome);
CREATE INDEX idx_ponto_nome     ON ponto_de_interesse(nome);
CREATE INDEX idx_avaliacao_data ON avaliacao(data_avaliacao);
CREATE INDEX idx_avaliacao_nota ON avaliacao(nota_geral);