USE trabalhopratico;

-- RM6: Melhores Pontos de uma Cidade 
PREPARE RM6 FROM
    'SELECT 
      p.nome AS Ponto, 
      p.classificacao_media AS Media
    FROM ponto_de_interesse AS p
    JOIN cidade AS c ON p.cidade_id = c.id
    WHERE c.nome = ?
    ORDER BY Media DESC;';
    
-- RM2: Listar Reviews de um Ponto de Interesse
PREPARE RM2 FROM
    'SELECT u.nome AS Autor, a.nota_geral, a.comentario, a.data_avaliacao
    FROM avaliacao a
    JOIN utilizador u ON a.utilizador_id = u.id
    LEFT JOIN ponto_de_interesse p ON a.ponto_interesse_id = p.id
    WHERE p.nome = ?
    ORDER BY a.data_avaliacao DESC;';
    
-- RM3: Listar Reviews de uma Cidade
PREPARE RM3 FROM
    'SELECT u.nome AS Autor, a.nota_geral, a.comentario, a.data_avaliacao
    FROM avaliacao a
    JOIN utilizador u ON a.utilizador_id = u.id
    LEFT JOIN cidade c ON a.cidade_id = c.id
    WHERE c.nome = ?
    ORDER BY a.data_avaliacao DESC;';

-- RM7: Ranking Global de Cidades 
SELECT 
        c.nome AS Cidade, 
        c.pais AS Pais,
        c.classificacao_geral AS classificacao
FROM cidade c
ORDER BY classificacao DESC;

-- RM8: Ranking Global de Pontos de Interesse
SELECT 
  p.nome AS Ponto_Interesse, 
  p.rua AS Rua,
  p.classificacao_media AS Classificacao_geral
FROM ponto_de_interesse p
ORDER BY Classificacao_geral DESC;

