USE trabalhopratico;

DELIMITER //

-- Inserir Cidade (RM1)
DROP PROCEDURE IF EXISTS InserirCidade //
CREATE PROCEDURE InserirCidade(IN p_nome VARCHAR(100), IN p_pais VARCHAR(100))
BEGIN
    INSERT INTO cidade (nome, pais) VALUES (p_nome, p_pais);
END //

-- Inserir Ponto de Interesse (RM1 - Com validação de cidade e SEM TIPO)
DROP PROCEDURE IF EXISTS InserirPontoInteresse //
CREATE PROCEDURE InserirPontoInteresse(
    IN p_nome VARCHAR(150), 
    IN p_rua VARCHAR(200), 
    IN p_cidade_nome VARCHAR(100)
)
BEGIN
    DECLARE v_cidade_id INT;
    SELECT id INTO v_cidade_id FROM cidade WHERE nome = p_cidade_nome LIMIT 1;
    
    IF v_cidade_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Cidade não encontrada.';
    ELSE
        INSERT INTO ponto_de_interesse (nome, rua, cidade_id) 
        VALUES (p_nome, p_rua, v_cidade_id);
    END IF;
END //

-- Apagar Utilizador (RM4)
DROP PROCEDURE IF EXISTS ApagarUtilizador //
CREATE PROCEDURE ApagarUtilizador(IN p_email VARCHAR(150))
BEGIN
    DELETE FROM utilizador WHERE email = p_email;
END //

-- Criar Utilizador (Auxiliar)
DROP PROCEDURE IF EXISTS CriarUtilizador //
CREATE PROCEDURE CriarUtilizador(
    IN p_nome VARCHAR(100), IN p_apelido VARCHAR(100), IN p_email VARCHAR(150), IN p_telemovel VARCHAR(20)
)
BEGIN
    IF EXISTS (SELECT 1 FROM utilizador WHERE email = p_email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Email já registado.';
    ELSE
        INSERT INTO utilizador (nome, apelido, email, telemovel) VALUES (p_nome, p_apelido, p_email, p_telemovel);
    END IF;
END //

DELIMITER ;

-- RM5: Apagar uma Avaliação (Moderador)
PREPARE RM5 FROM
    'DELETE FROM avaliacao WHERE id = ?;';

SET GLOBAL event_scheduler = ON;

DELIMITER //

DROP EVENT IF EXISTS evt_atualizar_rankings_diario //

CREATE EVENT evt_atualizar_rankings_diario
ON SCHEDULE EVERY 1 DAY
STARTS '2025-01-01 23:59:59'
DO
BEGIN
    -- Atualizar médias das CIDADES
    UPDATE cidade c
    INNER JOIN (
        SELECT cidade_id, AVG(nota_geral) as media_calculada
        FROM avaliacao
        WHERE cidade_id IS NOT NULL
        GROUP BY cidade_id
    ) a ON c.id = a.cidade_id
    SET c.classificacao_geral = ROUND(a.media_calculada, 1);

    -- Atualizar médias dos PONTOS DE INTERESSE
    UPDATE ponto_de_interesse p
    INNER JOIN (
        SELECT ponto_interesse_id, AVG(nota_geral) as media_calculada
        FROM avaliacao
        WHERE ponto_interesse_id IS NOT NULL
        GROUP BY ponto_interesse_id
    ) a ON p.id = a.ponto_interesse_id
    SET p.classificacao_media = ROUND(a.media_calculada, 1);
END //

DELIMITER ;

CREATE OR REPLACE VIEW v_gestor_estatistica_cidades AS
SELECT c.id, c.nome AS Cidade, c.pais, COUNT(DISTINCT p.id) AS Pontos, COUNT(DISTINCT a.id) AS Reviews, COALESCE(ROUND(AVG(a.nota_geral), 1), 0) AS Media
FROM cidade c LEFT JOIN ponto_de_interesse p ON c.id = p.cidade_id LEFT JOIN avaliacao a ON (c.id = a.cidade_id OR p.id = a.ponto_interesse_id)
GROUP BY c.id;

CREATE OR REPLACE VIEW v_gestor_pontos_criticos AS
SELECT p.id, p.nome, c.nome AS Cidade, COUNT(a.id) AS Reviews, COALESCE(ROUND(AVG(a.nota_geral), 1), 0) AS Media
FROM ponto_de_interesse p JOIN cidade c ON p.cidade_id = c.id LEFT JOIN avaliacao a ON p.id = a.ponto_interesse_id
GROUP BY p.id HAVING Media < 3.0 OR Reviews = 0;

CREATE OR REPLACE VIEW v_moderador_feed_completo AS
SELECT a.id, a.data_avaliacao, u.nome AS Autor, u.email, 
    CASE WHEN a.cidade_id IS NOT NULL THEN c.nome ELSE p.nome END AS Destino, 
    a.nota_geral, a.comentario
FROM avaliacao a JOIN utilizador u
ON a.utilizador_id = u.id LEFT JOIN cidade c
ON a.cidade_id = c.id LEFT JOIN ponto_de_interesse p
ON a.ponto_interesse_id = p.id;

CREATE OR REPLACE VIEW v_moderador_alertas AS
SELECT * FROM v_moderador_feed_completo WHERE nota_geral <= 2 ORDER BY data_avaliacao DESC;

CREATE OR REPLACE VIEW v_utilizador_top_pontos AS
SELECT p.nome, c.nome AS Cidade, COALESCE(ROUND(AVG(a.nota_geral), 1), 0) AS Classificacao
FROM ponto_de_interesse p JOIN cidade c ON p.cidade_id = c.id LEFT JOIN avaliacao a ON p.id = a.ponto_interesse_id
GROUP BY p.id ORDER BY Classificacao DESC;

CREATE OR REPLACE VIEW v_utilizador_reviews_recentes AS
SELECT u.nome AS User, a.nota_geral, a.comentario, a.data_avaliacao, 
    CASE WHEN a.cidade_id IS NOT NULL THEN c.nome ELSE p.nome END AS Local
FROM avaliacao a JOIN utilizador u ON a.utilizador_id = u.id LEFT JOIN cidade c ON a.cidade_id = c.id LEFT JOIN ponto_de_interesse p ON a.ponto_interesse_id = p.id
ORDER BY a.data_avaliacao DESC LIMIT 50;