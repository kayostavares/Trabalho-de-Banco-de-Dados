-- Criação do banco de dados
CREATE DATABASE SistemaJogos;
USE SistemaJogos;

-- Tabela País
CREATE TABLE Pais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    linguagem VARCHAR(50) NOT NULL
);

-- Tabela Moeda
CREATE TABLE Moeda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor FLOAT NOT NULL
);

-- Tabela Usuário
CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    data_criacao DATE NOT NULL,
    pontuacao INT,
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES Pais(id)
);

-- Tabela Estatísticas
CREATE TABLE Estatisticas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    trofeus INT NOT NULL,
    tempo_jogo INT NOT NULL,
    pontuacao INT NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

-- Tabela Biblioteca
CREATE TABLE Biblioteca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

-- Tabela Jogo
CREATE TABLE Jogo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    data_lancamento DATE,
    desenvolvedor VARCHAR(100) NOT NULL
);

-- Tabela DLC
CREATE TABLE DLC (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco FLOAT NOT NULL,
    data_lancamento DATE,
    id_jogo INT,
    FOREIGN KEY (id_jogo) REFERENCES Jogo(id)
);

-- Tabela Conquista
CREATE TABLE Conquista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    id_jogo INT,
    FOREIGN KEY (id_jogo) REFERENCES Jogo(id)
);

-- Tabela Compra
CREATE TABLE Compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor_compra FLOAT NOT NULL,
    data_compra DATE NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

-- Tabela Assinatura
CREATE TABLE Assinatura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    preco FLOAT NOT NULL,
    duracao_meses INT NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

-- Tabela Avaliação
CREATE TABLE Avaliacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    notas INT NOT NULL,
    comentario TEXT,
    data DATE,
    id_jogo INT,
    FOREIGN KEY (id_jogo) REFERENCES Jogo(id)
);

-- Tabela Amigos (relacionamento entre usuários)
CREATE TABLE Amigos (
    id_usuario1 INT,
    id_usuario2 INT,
    status VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_usuario1, id_usuario2),
    FOREIGN KEY (id_usuario1) REFERENCES Usuario(id),
    FOREIGN KEY (id_usuario2) REFERENCES Usuario(id)
);

-- Populando tabela País
INSERT INTO Pais (nome, linguagem) VALUES ('Brasil', 'Português');
INSERT INTO Pais (nome, linguagem) VALUES ('Estados Unidos', 'Inglês');
INSERT INTO Pais (nome, linguagem) VALUES ('Japão', 'Japonês');
INSERT INTO Pais (nome, linguagem) VALUES ('Alemanha', 'Alemão');
INSERT INTO Pais (nome, linguagem) VALUES ('França', 'Francês');
INSERT INTO Pais (nome, linguagem) VALUES ('Itália', 'Italiano');
INSERT INTO Pais (nome, linguagem) VALUES ('China', 'Chinês');
INSERT INTO Pais (nome, linguagem) VALUES ('Canadá', 'Inglês e Francês');
INSERT INTO Pais (nome, linguagem) VALUES ('Austrália', 'Inglês');
INSERT INTO Pais (nome, linguagem) VALUES ('Índia', 'Hindi e Inglês');

-- Populando tabela Moeda
INSERT INTO Moeda (nome, valor) VALUES ('Real', 1.0);
INSERT INTO Moeda (nome, valor) VALUES ('Dólar Americano', 5.0);
INSERT INTO Moeda (nome, valor) VALUES ('Iene', 0.05);
INSERT INTO Moeda (nome, valor) VALUES ('Euro', 6.0);
INSERT INTO Moeda (nome, valor) VALUES ('Libra Esterlina', 7.0);
INSERT INTO Moeda (nome, valor) VALUES ('Dólar Canadense', 4.0);
INSERT INTO Moeda (nome, valor) VALUES ('Yuan', 0.8);
INSERT INTO Moeda (nome, valor) VALUES ('Rupia', 0.07);
INSERT INTO Moeda (nome, valor) VALUES ('Dólar Australiano', 3.5);
INSERT INTO Moeda (nome, valor) VALUES ('Rupia Indiana', 0.07);

-- Populando tabela Usuário
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('Ana Silva', 'ana@example.com', 'senha123', '2024-01-01', 1500, 1);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('John Doe', 'john@example.com', 'senha456', '2024-01-02', 2000, 2);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('Yuki Tanaka', 'yuki@example.com', 'senha789', '2024-01-03', 2500, 3);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('Hans Müller', 'hans@example.com', 'senha101', '2024-01-04', 1800, 4);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('Marie Dubois', 'marie@example.com', 'senha102', '2024-01-05', 2200, 5);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('Mario Rossi', 'mario@example.com', 'senha103', '2024-01-06', 2400, 6);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('Wei Zhang', 'wei@example.com', 'senha104', '2024-01-07', 1700, 7);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('David Trudeau', 'david@example.com', 'senha105', '2024-01-08', 2600, 8);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('Liam Smith', 'liam@example.com', 'senha106', '2024-01-09', 1900, 9);
INSERT INTO Usuario (nome, email, senha, data_criacao, pontuacao, id_pais) VALUES ('Raj Kumar', 'raj@example.com', 'senha107', '2024-01-10', 2300, 10);

-- Populando tabela Estatísticas
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (10, 50, 1500, 1);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (12, 60, 2000, 2);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (15, 70, 2500, 3);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (8, 45, 1800, 4);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (11, 55, 2200, 5);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (14, 65, 2400, 6);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (7, 40, 1700, 7);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (16, 75, 2600, 8);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (9, 50, 1900, 9);
INSERT INTO Estatisticas (trofeus, tempo_jogo, pontuacao, id_usuario) VALUES (13, 60, 2300, 10);

-- Populando tabela Biblioteca
INSERT INTO Biblioteca (id_usuario) VALUES (1);
INSERT INTO Biblioteca (id_usuario) VALUES (2);
INSERT INTO Biblioteca (id_usuario) VALUES (3);
INSERT INTO Biblioteca (id_usuario) VALUES (4);
INSERT INTO Biblioteca (id_usuario) VALUES (5);
INSERT INTO Biblioteca (id_usuario) VALUES (6);
INSERT INTO Biblioteca (id_usuario) VALUES (7);
INSERT INTO Biblioteca (id_usuario) VALUES (8);
INSERT INTO Biblioteca (id_usuario) VALUES (9);
INSERT INTO Biblioteca (id_usuario) VALUES (10);

-- Populando tabela Jogo
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('Cyberpunk 2077', 'RPG', 'PC', '2020-12-10', 'CD Projekt');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('Minecraft', 'Aventura', 'Multiplataforma', '2011-11-18', 'Mojang Studios');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('The Witcher 3', 'RPG', 'Multiplataforma', '2015-05-19', 'CD Projekt');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('FIFA 22', 'Esportes', 'Multiplataforma', '2021-10-01', 'EA Sports');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('Call of Duty: Warzone', 'FPS', 'Multiplataforma', '2020-03-10', 'Infinity Ward');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('Among Us', 'Party', 'Multiplataforma', '2018-06-15', 'InnerSloth');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('Hades', 'Roguelike', 'PC', '2020-09-17', 'Supergiant Games');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('GTA V', 'Ação', 'Multiplataforma', '2013-09-17', 'Rockstar Games');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('Fortnite', 'Battle Royale', 'Multiplataforma', '2017-07-25', 'Epic Games');
INSERT INTO Jogo (nome, genero, plataforma, data_lancamento, desenvolvedor) VALUES ('League of Legends', 'MOBA', 'PC', '2009-10-27', 'Riot Games');


iNSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('Godzilla', 'Aventura', '10.99', '2020-12-10', 22);
iNSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('Modo historia', 'viva e aprenda', '99.99', '2011-11-18', 14);
INSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('The Witcher 3: Blood and Wine', 'Expansão de The Witcher 3', 14.99, '2016-05-31', 3);
INSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('FIFA 22: Ultimate Team', 'Modo Ultimate Team de FIFA 22', 29.99, '2021-10-01', 4);
INSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('Call of Duty: Warzone - Pacific', 'Novo mapa em Call of Duty: Warzone', 0.00, '2021-12-08', 5);
INSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('Among Us: Airship Map', 'Novo mapa em Among Us', 3.99, '2021-03-31', 6);
INSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('Hades: Post-Launch Update', 'Atualização pós-lançamento de Hades', 0.00, '2021-12-15', 7);
INSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('GTA V: Online Heists', 'Atualização de golpes em GTA Online', 9.99, '2015-03-10', 8);
INSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('Fortnite: Chapter 2 Season 8', 'Nova temporada de Fortnite', 0.00, '2021-09-13', 9);
INSERT INTO DLC (nome, descricao, preco, data_lancamento, id_jogo) VALUES ('League of Legends: Arcane Skins', 'Skins da série Arcane em League of Legends', 10.99, '2021-11-06', 10);

-- Populando tabela Conquista
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Vencedor da Missão Principal', 'Complete todas as missões principais', 1);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Construtor Experiente', 'Construa uma casa completa', 2);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Caçador de Monstros', 'Derrote todos os chefes', 3);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Campeão da Liga', 'Ganhe a liga em Ultimate Team', 4);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Sobrevivente da Zona de Guerra', 'Sobreviva por 30 minutos', 5);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Detetive Espacial', 'Descubra o impostor 3 vezes seguidas', 6);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Deus da Morte', 'Complete o jogo sem morrer', 7);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Mestre do Crime', 'Complete todos os golpes', 8);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Rei da Ilha', 'Ganhe 10 partidas seguidas', 9);
INSERT INTO Conquista (nome, descricao, id_jogo) VALUES ('Invocador Supremo', 'Suba ao nível 30', 10);

-- Populando tabela Compra
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (59.99, '2024-01-15', 1);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (49.99, '2024-01-16', 2);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (39.99, '2024-01-17', 3);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (29.99, '2024-01-18', 4);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (19.99, '2024-01-19', 5);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (9.99, '2024-01-20', 6);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (59.99, '2024-01-21', 7);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (49.99, '2024-01-22', 8);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (39.99, '2024-01-23', 9);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (29.99, '2024-01-24', 10);

-- Populando tabela Assinatura
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 1);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 2);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 3);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 4);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 5);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 6);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 7);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 8);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 9);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 10);

-- Populando tabela Avaliação
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (9, 'Excelente jogo!', '2024-02-01', 1);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (8, 'Muito divertido', '2024-02-02', 2);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (10, 'Obra-prima', '2024-02-03', 3);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (7, 'Bom, mas poderia ser melhor', '2024-02-04', 4);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (8, 'Gostei bastante', '2024-02-05', 5);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (6, 'É ok', '2024-02-06', 6);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (9, 'Fantástico!', '2024-02-07', 7);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (10, 'Perfeito!', '2024-02-08', 8);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (9, 'Altamente recomendado', '2024-02-09', 9);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (8, 'Divertido e envolvente', '2024-02-10', 10);

-- Continuando a população da tabela Amigos
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (7, 8, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (8, 9, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (9, 10, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (1, 3, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (2, 4, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (3, 5, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (4, 6, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (5, 7, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (6, 8, 'Confirmado');
INSERT INTO Amigos (id_usuario1, id_usuario2, status) VALUES (7, 9, 'Confirmado');

-- Continuando a população da tabela Biblioteca
INSERT INTO Biblioteca (id_usuario) VALUES (10);

-- Atualizando registros para todos os dados de compra, assinatura e avaliação
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (49.99, '2024-01-25', 2);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (39.99, '2024-01-26', 3);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (29.99, '2024-01-27', 4);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (19.99, '2024-01-28', 5);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (59.99, '2024-01-29', 6);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (49.99, '2024-01-30', 7);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (39.99, '2024-01-31', 8);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (29.99, '2024-02-01', 9);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (19.99, '2024-02-02', 10);
INSERT INTO Compra (valor_compra, data_compra, id_usuario) VALUES (9.99, '2024-02-03', 1);


INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 2);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 3);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 4);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 5);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 6);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 7);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 8);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 9);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Anual', 99.99, 12, 10);
INSERT INTO Assinatura (tipo, preco, duracao_meses, id_usuario) VALUES ('Mensal', 9.99, 1, 1);


INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (10, 'Perfeito!', '2024-02-08', 6);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (9, 'Altamente recomendado', '2024-02-09', 7);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (8, 'Divertido e envolvente', '2024-02-10', 8);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (7, 'Bom, mas poderia ser melhor', '2024-02-11', 9);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (8, 'Gostei bastante', '2024-02-12', 10);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (10, 'Excelente!', '2024-02-13', 1);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (9, 'Muito bom!', '2024-02-14', 2);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (8, 'Divertido', '2024-02-15', 3);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (7, 'Gostei', '2024-02-16', 4);
INSERT INTO Avaliacao (notas, comentario, data, id_jogo) VALUES (6, 'Ok', '2024-02-17', 5);


-- Consulta para listar todos os dados dos usuários, incluindo país, estatísticas, e detalhes das compras:

SELECT u.id AS ID_Usuario, u.nome AS Nome_Usuario, u.email, u.data_criacao, u.pontuacao,
       p.nome AS Pais, p.linguagem, 
       e.trofeus, e.tempo_jogo, e.pontuacao AS Pontuacao_Estatisticas,
       c.valor_compra, c.data_compra
FROM Usuario u
JOIN Pais p ON u.id_pais = p.id
JOIN Estatisticas e ON u.id = e.id_usuario
LEFT JOIN Compra c ON u.id = c.id_usuario;

-- Consulta para listar todos os jogos comprados por cada usuário, incluindo os detalhes dos jogos e as assinaturas dos usuários:

SELECT u.nome AS Usuario, c.data_compra, c.valor_compra,
       j.nome AS Jogo, j.genero, j.plataforma, j.data_lancamento, j.desenvolvedor,
       a.tipo AS Tipo_Assinatura, a.preco AS Preco_Assinatura, a.duracao_meses
FROM Usuario u
JOIN Compra c ON u.id = c.id_usuario
JOIN Biblioteca b ON u.id = b.id_usuario
JOIN Jogo j ON b.id = j.id
LEFT JOIN Assinatura a ON u.id = a.id_usuario;

-- Consulta para mostrar as avaliações dos jogos, incluindo os dados dos usuários que fizeram as avaliações e as conquistas dos jogos:

SELECT u.nome AS Usuario, j.nome AS Jogo, a.notas, a.comentario, a.data,
       c.nome AS Conquista, c.descricao
FROM Usuario u
JOIN Avaliacao a ON u.id = a.id_jogo
JOIN Jogo j ON a.id_jogo = j.id
LEFT JOIN Conquista c ON j.id = c.id_jogo;
