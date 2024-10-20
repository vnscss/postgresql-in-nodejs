-- Remover o banco de dados existente (se necessário)
DROP DATABASE IF EXISTS informatica;

-- Criar um novo banco de dados
CREATE DATABASE informatica;

-- Conectar-se ao banco de dados criado
\c informatica;

-- Criar tabela 'users'
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    sector TEXT,
    permissions TEXT NOT NULL
);

-- Criar tabela 'projetos'
CREATE TABLE IF NOT EXISTS projetos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    eixo TEXT
);

-- Criar tabela 'transactionHistory'
CREATE TABLE IF NOT EXISTS transactionHistory (
    id SERIAL PRIMARY KEY,
    historico JSONB
);

-- Criar tabela 'equipamento' com as chaves estrangeiras corretas
CREATE TABLE IF NOT EXISTS equipamento (
    id SERIAL PRIMARY KEY,
    projetos_id INT REFERENCES projetos(id),  -- Referência correta
    users_id INT REFERENCES users(id),        -- Referência correta
    status TEXT,
    nome TEXT NOT NULL,
    modelo TEXT,
    local TEXT NOT NULL,
    nota_fiscal TEXT,
    data_inscrição DATE NOT NULL,
    estado TEXT NOT NULL,
    transactionHistory_id INT REFERENCES transactionHistory(id)  -- Referência correta
);

-- Criar tabela 'emprestimo' com as chaves estrangeiras corretas
CREATE TABLE IF NOT EXISTS emprestimo (
    id SERIAL PRIMARY KEY,
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    equipamento_id INT REFERENCES equipamento(id),  -- Referência correta
    projetos_id INT REFERENCES projetos(id),        -- Referência correta
    users_id INT REFERENCES users(id)               -- Referência correta
);

-- Inserindo 5 usuários na tabela 'users'
INSERT INTO users (username, password, sector, permissions)
VALUES 
('joao_silva', 'senha123', 'Engenharia', 'admin'),
('maria_oliveira', 'senha456', 'Design', 'usuario'),
('pedro_santos', 'senha789', 'RH', 'admin'),
('ana_costa', 'senhaabc', 'TI', 'usuario'),
('lucas_martins', 'senha1234', 'Marketing', 'admin');

-- Inserindo 5 projetos na tabela 'projetos'
INSERT INTO projetos (nome, eixo)
VALUES 
('Projeto Sustentabilidade', 'Eixo Ambiental'),
('Projeto Inclusão Digital', 'Eixo Tecnológico'),
('Projeto Educação 4.0', 'Eixo Educacional'),
('Projeto Saúde e Bem-estar', 'Eixo Social'),
('Projeto Crescimento Urbano', 'Eixo Econômico');

-- Inserindo 5 transações na tabela 'transactionHistory'
INSERT INTO transactionHistory (historico)
VALUES 
('{"status": "iniciado", "data": "2024-10-01"}'),
('{"status": "em progresso", "data": "2024-10-10"}'),
('{"status": "concluído", "data": "2024-10-15"}'),
('{"status": "revisão", "data": "2024-10-18"}'),
('{"status": "cancelado", "data": "2024-10-19"}');

-- Inserindo 5 equipamentos na tabela 'equipamento'
INSERT INTO equipamento (projetos_id, users_id, status, nome, modelo, local, nota_fiscal, data_inscrição, estado, transactionHistory_id)
VALUES 
(1, 1, 'ativo', 'Notebook', 'Dell Inspiron', 'Sala TI', 'NF1001', '2024-10-20', 'novo', 1),
(2, 2, 'inativo', 'Projetor', 'BenQ MX532', 'Auditório', 'NF1002', '2024-10-19', 'usado', 2),
(3, 3, 'manutenção', 'Impressora', 'HP LaserJet', 'Sala RH', 'NF1003', '2024-10-18', 'danificado', 3),
(4, 4, 'ativo', 'Scanner', 'Epson V39', 'Sala Design', 'NF1004', '2024-10-17', 'novo', 4),
(5, 5, 'desativado', 'Tablet', 'Samsung Galaxy Tab', 'Sala Marketing', 'NF1005', '2024-10-16', 'antigo', 5);

-- Inserindo 5 empréstimos na tabela 'emprestimo'
INSERT INTO emprestimo (data_inicial, data_final, equipamento_id, projetos_id, users_id)
VALUES 
('2024-10-21', '2024-10-25', 1, 1, 1),
('2024-10-22', '2024-10-26', 2, 2, 2),
('2024-10-23', '2024-10-27', 3, 3, 3),
('2024-10-24', '2024-10-28', 4, 4, 4),
('2024-10-25', '2024-10-29', 5, 5, 5);
