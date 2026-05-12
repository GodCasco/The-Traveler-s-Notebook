USE trabalhopratico;

DROP ROLE IF EXISTS 'papel_gestor', 'papel_moderador', 'papel_utilizador';
CREATE ROLE 'papel_gestor', 'papel_moderador', 'papel_utilizador';

-- --- A) PERMISSÕES DO GESTOR DE CONTEÚDOS ---
-- Requisitos: RM1 (Inserir/Gerir Cidades e Pontos)
GRANT SELECT, INSERT, UPDATE, DELETE ON trabalhopratico.cidade TO 'papel_gestor';
GRANT SELECT, INSERT, UPDATE, DELETE ON trabalhopratico.ponto_de_interesse TO 'papel_gestor';

GRANT SELECT ON v_moderador_feed_completo TO 'papel_moderador';

-- Ver utilizadores e avaliações (Leitura apenas)
GRANT SELECT ON trabalhopratico.utilizador TO 'papel_gestor';
GRANT SELECT ON trabalhopratico.avaliacao TO 'papel_gestor';

-- Executar Procedimentos de Gestão
GRANT EXECUTE ON PROCEDURE trabalhopratico.InserirCidade TO 'papel_gestor';
GRANT EXECUTE ON PROCEDURE trabalhopratico.InserirPontoInteresse TO 'papel_gestor';


-- --- B) PERMISSÕES DO MODERADOR ---
-- Requisitos: RM4 (Eliminar avaliações tóxicas)
GRANT SELECT ON trabalhopratico.* TO 'papel_moderador'; -- Pode ler tudo para analisar

-- Permissões de Eliminação de Reviews
GRANT DELETE ON trabalhopratico.avaliacao TO 'papel_moderador';
GRANT EXECUTE ON PROCEDURE trabalhopratico.ApagarAvaliacao TO 'papel_moderador';


-- --- C) PERMISSÕES DO UTILIZADOR REGISTADO ---
-- Requisitos: RC4 (Inserir Reviews), RM2 (Ver Reviews), RM3 (Gerir Conta)
GRANT SELECT ON trabalhopratico.cidade TO 'papel_utilizador';
GRANT SELECT ON trabalhopratico.ponto_de_interesse TO 'papel_utilizador';
GRANT SELECT ON trabalhopratico.avaliacao TO 'papel_utilizador';
GRANT SELECT ON trabalhopratico.utilizador TO 'papel_utilizador'; -- Ver o próprio perfil

-- Permissões de Escrita (Apenas inserir reviews)
GRANT INSERT ON trabalhopratico.avaliacao TO 'papel_utilizador';

-- Executar Procedimentos de Utilizador
GRANT EXECUTE ON PROCEDURE trabalhopratico.RankingPontosPorCidade TO 'papel_utilizador';
GRANT EXECUTE ON PROCEDURE trabalhopratico.ListarReviewsDestino TO 'papel_utilizador';
GRANT EXECUTE ON PROCEDURE trabalhopratico.ApagarUtilizador TO 'papel_utilizador';
GRANT EXECUTE ON PROCEDURE trabalhopratico.CriarUtilizador TO 'papel_utilizador';

-- =================================================================================
-- 3. CRIAÇÃO DE UTILIZADORES E ATRIBUIÇÃO DE PAPÉIS
-- =================================================================================

-- Criar utilizador "Gestor" (ex: Ivo)
DROP USER IF EXISTS 'gestor_ivo'@'localhost';
CREATE USER 'gestor_ivo'@'localhost' IDENTIFIED BY 'senha_forte_gestor';
GRANT 'papel_gestor' TO 'gestor_ivo'@'localhost';

-- Criar utilizador "Moderador" (ex: Vasco)
DROP USER IF EXISTS 'mod_vasco'@'localhost';
CREATE USER 'mod_vasco'@'localhost' IDENTIFIED BY 'senha_moderador';
GRANT 'papel_moderador' TO 'mod_vasco'@'localhost';

-- Criar utilizador "Cliente Normal" (ex: João)
DROP USER IF EXISTS 'user_joao'@'localhost';
CREATE USER 'user_joao'@'localhost' IDENTIFIED BY 'senha_cliente';
GRANT 'papel_utilizador' TO 'user_joao'@'localhost';

-- Ativar os papéis por defeito
SET DEFAULT ROLE ALL TO 'gestor_ivo'@'localhost';
SET DEFAULT ROLE ALL TO 'mod_vasco'@'localhost';
SET DEFAULT ROLE ALL TO 'user_joao'@'localhost';
