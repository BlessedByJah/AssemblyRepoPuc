CREATE TABLE clientes (
Cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(150) UNIQUE,
telefone VARCHAR(20),
data_nascimento DATE,
endereco VARCHAR(200),
cidade VARCHAR(100),
estado CHAR(2),
data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO clientes
(nome, email, telefone, data_nascimento, endereco, cidade, estado)
VALUES
('João Silva', 'joao.silva@email.com', '19999990001', '1990-05-10', 'Rua das
Flores, 123', 'Campinas', 'SP'),
('Maria Souza', 'maria.souza@email.com', '19999990002', '1988-08-15', 'Av. Brasil,
456', 'Campinas', 'SP'),
('Carlos Pereira', 'carlos.pereira@email.com', '19999990003', '1995-03-22', 'Rua
Central, 789', 'Valinhos', 'SP'),
('Ana Oliveira', 'ana.oliveira@email.com', '19999990004', '1992-11-30', 'Rua das
Palmeiras, 321', 'Vinhedo', 'SP'),
('Pedro Santos', 'pedro.santos@email.com', '19999990005', '1985-07-12', 'Av.
Paulista, 1000', 'São Paulo', 'SP'),
('Juliana Costa', 'juliana.costa@email.com', '19999990006', '1998-01-18', 'Rua XV
de Novembro, 45', 'Curitiba', 'PR'),
('Ricardo Almeida', 'ricardo.almeida@email.com', '19999990007', '1979-09-25',
'Rua das Acácias, 88', 'Londrina', 'PR'),
('Fernanda Rocha', 'fernanda.rocha@email.com', '19999990008', '1993-06-05',
'Av. Beira Mar, 150', 'Florianópolis', 'SC'),
('Lucas Mendes', 'lucas.mendes@email.com', '19999990009', '2000-12-14', 'Rua
do Comércio, 75', 'Joinville', 'SC'),
('Patrícia Lima', 'patricia.lima@email.com', '19999990010', '1987-04-27', 'Rua
Independência, 200', 'Campinas', 'SP');
