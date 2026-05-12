USE trabalhopratico;

INSERT INTO utilizador (nome, apelido, email, telemovel) VALUES 
('João', 'Silva', 'joao.silva@exemplo.com', '912345678'),
('Maria', 'Santos', 'maria.santos@exemplo.com', '965432109'),
('Pedro', 'Almeida', 'pedro.almeida@exemplo.com', '933221144'),
('Ana', 'Costa', 'ana.costa@exemplo.com', NULL),
('Sofia', 'Martins', 'sofia.martins@exemplo.com', '911888777'),
('Rui', 'Ferreira', 'rui.ferreira@exemplo.com', '915556667'),
('Carla', 'Oliveira', 'carla.oliveira@exemplo.com', '922334455'),
('Tiago', 'Rodrigues', 'tiago.rodrigues@exemplo.com', NULL),
('Beatriz', 'Gomes', 'beatriz.gomes@exemplo.com', '966998877'),
('Manuel', 'Lopes', 'manuel.lopes@exemplo.com', '910001122'),
('Lucas', 'Mendes', 'lucas.mendes@exemplo.com', '933445566'),
('Inês', 'Pereira', 'ines.pereira@exemplo.com', '919876543'),
('Gonçalo', 'Nunes', 'goncalo.nunes@exemplo.com', NULL),
('Mariana', 'Carvalho', 'mariana.carvalho@exemplo.com', '961231234'),
('Diogo', 'Ribeiro', 'diogo.ribeiro@exemplo.com', '917654321');

INSERT INTO cidade (nome, pais, classificacao_geral, classificacao_pontos_turisticos, classificacao_gastronomia, classificacao_paisagens, classificacao_alojamentos) VALUES 
('Lisboa', 'Portugal', 4.5, 4.8, 4.7, 4.6, 4.2),
('Porto', 'Portugal', 4.7, 4.6, 4.9, 4.5, 4.4),
('Paris', 'França', 4.4, 4.9, 4.5, 4.3, 3.9),
('Londres', 'Reino Unido', 4.3, 4.8, 4.0, 4.1, 3.8),
('Roma', 'Itália', 4.6, 5.0, 4.9, 4.7, 4.0),
('Nova Iorque', 'EUA', 4.2, 4.7, 4.6, 3.8, 3.5);

INSERT INTO ponto_de_interesse (nome, rua, cidade_id) VALUES 
('Torre de Belém', 'Av. Brasília', 1),
('Mosteiro dos Jerónimos', 'Praça do Império', 1),
('Livraria Lello', 'Rua das Carmelitas',  2),
('Ponte Luís I', 'Ribeira', 2),
('Torre Eiffel', 'Champ de Mars', 3),
('Museu do Louvre', 'Rue de Rivoli', 3),
('Big Ben', 'Westminster', 4),
('London Eye', 'Riverside Building', 4),
('Coliseu de Roma', 'Piazza del Colosseo', 5),
('Fontana di Trevi', 'Piazza di Trevi', 5),
('Estátua da Liberdade', 'Liberty Island', 6),
('Central Park', 'Manhattan', 6);

INSERT INTO avaliacao (data_avaliacao, comentario, nota_geral, nota_pontos_turisticos, nota_gastronomia, nota_paisagens, nota_alojamentos, utilizador_id, cidade_id, ponto_interesse_id) VALUES

-- LISBOA (ID 1)
-- 5 Genéricas
('2023-10-01 10:00:00', 'Lisboa tem uma luz incrível.', 5, 5, 4, 5, 4, 1, 1, NULL),
('2023-10-02 11:00:00', 'Bons pastéis de nata, mas muito trânsito.', 4, 4, 5, 3, 3, 2, 1, NULL),
('2023-10-03 12:00:00', 'Os elétricos são giros mas cheios.', 3, 4, 4, 4, 3, 3, 1, NULL),
('2023-10-04 13:00:00', 'Alojamento demasiado caro no centro.', 2, 5, 4, 4, 1, 4, 1, NULL),
('2023-10-05 14:00:00', 'A cidade das 7 colinas cansa as pernas!', 4, 5, 4, 5, 3, 5, 1, NULL),
-- 5 Torre de Belém (ID 1)
('2023-10-06 10:00:00', 'Símbolo dos descobrimentos. Lindo.', 5, 5, 3, 5, 3, 6, 1, 1),
('2023-10-06 11:00:00', 'Vento muito forte junto ao rio.', 3, 4, 2, 4, 2, 7, 1, 1),
('2023-10-06 12:00:00', 'Não entrei, a fila era gigante.', 2, 5, 1, 4, 2, 8, 1, 1),
('2023-10-06 13:00:00', 'A vista do topo vale a escadaria.', 5, 5, 3, 5, 3, 9, 1, 1),
('2023-10-06 14:00:00', 'Arquitetura única no mundo.', 5, 5, 3, 4, 3, 10, 1, 1),
-- 5 Mosteiro dos Jerónimos (ID 2)
('2023-10-07 10:00:00', 'O claustro é de cortar a respiração.', 5, 5, 3, 4, 3, 11, 1, 2),
('2023-10-07 11:00:00', 'Igreja impressionante e grátis.', 5, 5, 3, 4, 3, 12, 1, 2),
('2023-10-07 12:00:00', 'Demasiada confusão na entrada.', 3, 4, 2, 3, 2, 13, 1, 2),
('2023-10-07 13:00:00', 'Património mundial merecido.', 5, 5, 3, 4, 3, 14, 1, 2),
('2023-10-07 14:00:00', 'Fica perto dos pastéis de Belém!', 4, 5, 5, 4, 3, 15, 1, 2),

-- PORTO (ID 2)
-- 5 Genéricas
('2023-11-01 10:00:00', 'Gente muito hospitaleira.', 5, 4, 5, 4, 4, 11, 2, NULL),
('2023-11-01 11:00:00', 'A Francesinha é obrigatória.', 5, 4, 5, 3, 3, 12, 2, NULL),
('2023-11-01 12:00:00', 'Cidade cinzenta mas charmosa.', 4, 4, 4, 4, 3, 13, 2, NULL),
('2023-11-01 13:00:00', 'Muitas obras no centro.', 2, 3, 3, 3, 2, 14, 2, NULL),
('2023-11-01 14:00:00', 'Melhor destino europeu.', 5, 5, 5, 5, 4, 15, 2, NULL),
-- 5 Livraria Lello (ID 3)
('2023-11-02 10:00:00', 'Parece o Harry Potter.', 5, 5, 2, 4, 2, 1, 2, 3),
('2023-11-02 11:00:00', 'Impossível andar lá dentro.', 2, 4, 1, 3, 1, 2, 2, 3),
('2023-11-02 12:00:00', 'Escadaria vermelha linda.', 4, 5, 2, 4, 2, 3, 2, 3),
('2023-11-02 13:00:00', 'Vale a pena comprar o bilhete online.', 4, 4, 2, 3, 2, 4, 2, 3),
('2023-11-02 14:00:00', 'Só serve para tirar fotos.', 3, 4, 1, 3, 1, 5, 2, 3),
-- 5 Ponte Luís I (ID 4)
('2023-11-04 10:00:00', 'Atravessar o tabuleiro superior é top.', 5, 5, 3, 5, 3, 6, 2, 4),
('2023-11-04 11:00:00', 'Tenho vertigens, foi difícil.', 2, 4, 1, 5, 1, 7, 2, 4),
('2023-11-04 12:00:00', 'Vista incrível para a Ribeira.', 5, 5, 4, 5, 3, 8, 2, 4),
('2023-11-04 13:00:00', 'Cuidado com o metro a passar.', 3, 3, 2, 4, 2, 9, 2, 4),
('2023-11-04 14:00:00', 'Melhor spot para fotos.', 5, 5, 3, 5, 3, 10, 2, 4),

-- PARIS (ID 3)
-- 5 Genéricas
('2023-09-01 10:00:00', 'Cidade do amor, muito romântica.', 5, 5, 5, 5, 4, 1, 3, NULL),
('2023-09-01 11:00:00', 'O metro é sujo e confuso.', 2, 3, 3, 2, 2, 2, 3, NULL),
('2023-09-01 12:00:00', 'Comida excelente mas cara.', 4, 4, 5, 4, 3, 3, 3, NULL),
('2023-09-01 13:00:00', 'Ninguém fala inglês aqui.', 3, 4, 4, 4, 2, 4, 3, NULL),
('2023-09-01 14:00:00', 'Arquitetura linda em cada esquina.', 5, 5, 4, 5, 4, 5, 3, NULL),
-- 5 Torre Eiffel (ID 5)
('2023-09-02 10:00:00', 'À noite quando pisca é mágica.', 5, 5, 3, 5, 3, 6, 3, 5),
('2023-09-02 11:00:00', 'Muitos vendedores chatos em baixo.', 2, 3, 2, 3, 2, 7, 3, 5),
('2023-09-02 12:00:00', 'Subir de elevador é caro.', 3, 4, 2, 5, 2, 8, 3, 5),
('2023-09-02 13:00:00', 'Fiz piquenique no relvado, adorei.', 5, 5, 4, 5, 3, 9, 3, 5),
('2023-09-02 14:00:00', 'Vista sobre toda a cidade.', 5, 5, 3, 5, 3, 10, 3, 5),
-- 5 Museu do Louvre (ID 6)
('2023-09-03 10:00:00', 'A Mona Lisa é minúscula.', 3, 4, 2, 3, 2, 11, 3, 6),
('2023-09-03 11:00:00', 'Precisa de 2 dias para ver tudo.', 5, 5, 3, 3, 3, 12, 3, 6),
('2023-09-03 12:00:00', 'Pirâmide de vidro é icónica.', 4, 5, 2, 4, 2, 13, 3, 6),
('2023-09-03 13:00:00', 'Perdi-me nas salas do Egito.', 4, 5, 2, 3, 2, 14, 3, 6),
('2023-09-03 14:00:00', 'Muita gente, muito calor.', 3, 4, 2, 2, 2, 15, 3, 6),

-- LONDRES (ID 4)
-- 5 Genéricas
('2023-12-01 10:00:00', 'Os museus são quase todos grátis!', 5, 5, 3, 4, 4, 1, 4, NULL),
('2023-12-01 11:00:00', 'Chove todos os dias.', 2, 3, 3, 2, 3, 2, 4, NULL),
('2023-12-01 12:00:00', 'Fish and chips é muito gorduroso.', 3, 4, 3, 3, 3, 3, 4, NULL),
('2023-12-01 13:00:00', 'Transportes muito caros.', 2, 4, 3, 3, 2, 4, 4, NULL),
('2023-12-01 14:00:00', 'Adorei os autocarros vermelhos.', 4, 4, 3, 4, 3, 5, 4, NULL),
-- 5 Big Ben (ID 7)
('2023-12-02 10:00:00', 'Finalmente sem andaimes!', 5, 5, 2, 4, 2, 6, 4, 7),
('2023-12-02 11:00:00', 'É só um relógio, nada de especial.', 3, 3, 1, 3, 1, 7, 4, 7),
('2023-12-02 12:00:00', 'Fica junto ao parlamento, zona linda.', 5, 5, 3, 5, 3, 8, 4, 7),
('2023-12-02 13:00:00', 'Brilha ao sol, muito dourado.', 4, 4, 2, 4, 2, 9, 4, 7),
('2023-12-02 14:00:00', 'Não dá para visitar por dentro.', 3, 3, 1, 3, 1, 10, 4, 7),
-- 5 London Eye (ID 8)
('2023-12-03 10:00:00', 'Vistas incríveis sobre o Tamisa.', 5, 5, 2, 5, 2, 11, 4, 8),
('2023-12-03 11:00:00', 'Muito caro para 30 minutos.', 3, 4, 1, 4, 2, 12, 4, 8),
('2023-12-03 12:00:00', 'Anda muito devagar, dá sono.', 2, 3, 1, 3, 1, 13, 4, 8),
('2023-12-03 13:00:00', 'Recomendo ir ao pôr do sol.', 5, 5, 2, 5, 2, 14, 4, 8),
('2023-12-03 14:00:00', 'Comprem bilhete rápido para evitar filas.', 4, 4, 2, 4, 2, 15, 4, 8),

-- ROMA (ID 5)
-- 5 Genéricas
('2023-08-01 10:00:00', 'Um museu a céu aberto.', 5, 5, 4, 5, 4, 1, 5, NULL),
('2023-08-01 11:00:00', 'As pizzas e pastas são divinais.', 5, 5, 5, 4, 3, 2, 5, NULL),
('2023-08-01 12:00:00', 'Trânsito caótico e perigoso.', 2, 4, 3, 3, 2, 3, 5, NULL),
('2023-08-01 13:00:00', 'Muito lixo nas ruas.', 2, 4, 4, 2, 2, 4, 5, NULL),
('2023-08-01 14:00:00', 'Gelados italianos são os melhores.', 5, 4, 5, 4, 3, 5, 5, NULL),
-- 5 Coliseu de Roma (ID 9)
('2023-08-02 10:00:00', 'Sentimo-nos na época dos gladiadores.', 5, 5, 3, 4, 3, 6, 5, 9),
('2023-08-02 11:00:00', 'Está a cair aos bocados, literalmente.', 4, 5, 2, 4, 2, 7, 5, 9),
('2023-08-02 12:00:00', 'Muitos vendedores de água ilegais.', 3, 4, 2, 3, 2, 8, 5, 9),
('2023-08-02 13:00:00', 'Visita aos subterrâneos vale a pena.', 5, 5, 2, 3, 2, 9, 5, 9),
('2023-08-02 14:00:00', 'Grandioso e imponente.', 5, 5, 3, 4, 3, 10, 5, 9),
-- 5 Fontana di Trevi (ID 10)
('2023-08-03 10:00:00', 'Atirei a moeda para voltar.', 5, 5, 2, 4, 2, 11, 5, 10),
('2023-08-03 11:00:00', 'Multidão insuportável.', 2, 5, 2, 3, 2, 12, 5, 10),
('2023-08-03 12:00:00', 'É mais bonita à noite.', 5, 5, 3, 5, 3, 13, 5, 10),
('2023-08-03 13:00:00', 'Difícil tirar foto sem ninguém.', 3, 5, 2, 4, 2, 14, 5, 10),
('2023-08-03 14:00:00', 'A água é azul turquesa.', 4, 5, 2, 5, 2, 15, 5, 10),

-- NOVA IORQUE (ID 6)
-- 5 Genéricas
('2023-07-01 10:00:00', 'A cidade que nunca dorme.', 5, 5, 4, 3, 4, 1, 6, NULL),
('2023-07-01 11:00:00', 'Muito suja e ratos no metro.', 2, 4, 3, 2, 2, 2, 6, NULL),
('2023-07-01 12:00:00', 'Pizza de 1 dólar é a melhor.', 4, 4, 5, 3, 3, 3, 6, NULL),
('2023-07-01 13:00:00', 'Senti-me num filme.', 5, 5, 4, 5, 4, 4, 6, NULL),
('2023-07-01 14:00:00', 'Tudo é caro, gorjetas obrigatórias.', 3, 4, 4, 3, 2, 5, 6, NULL),
-- 5 Estátua da Liberdade (ID 11)
('2023-07-02 10:00:00', 'Símbolo da liberdade.', 5, 5, 2, 5, 2, 6, 6, 11),
('2023-07-02 11:00:00', 'É mais pequena do que pensava.', 3, 4, 1, 4, 2, 7, 6, 11),
('2023-07-02 12:00:00', 'O barco abana muito.', 2, 4, 2, 4, 2, 8, 6, 11),
('2023-07-02 13:00:00', 'Vista linda para Manhattan.', 5, 5, 2, 5, 2, 9, 6, 11),
('2023-07-02 14:00:00', 'Tem de se reservar meses antes.', 3, 4, 1, 3, 2, 10, 6, 11),
-- 5 Central Park (ID 12)
('2023-07-03 10:00:00', 'O pulmão da cidade.', 5, 5, 3, 5, 3, 11, 6, 12),
('2023-07-03 11:00:00', 'Vi um esquilo!', 4, 4, 2, 4, 2, 12, 6, 12),
('2023-07-03 12:00:00', 'Ótimo para correr.', 5, 4, 2, 5, 2, 13, 6, 12),
('2023-07-03 13:00:00', 'Muito grande, perdi-me.', 4, 4, 2, 4, 2, 14, 6, 12),
('2023-07-03 14:00:00', 'Contrastes entre verde e arranha-céus.', 5, 5, 2, 5, 2, 15, 6, 12);