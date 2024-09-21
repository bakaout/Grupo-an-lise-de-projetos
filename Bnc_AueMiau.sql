drop database if exists db_auemiau;
create database if not exists db_auemiau;
use db_auemiau;

CREATE TABLE Tutor (
    IdTutor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    Senha VARCHAR(30)
);

CREATE TABLE Pet (
    IdPet INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Tipo ENUM('Gato', 'Cachorro') NOT NULL,
    Sexo ENUM('F','M'),
    Raca VARCHAR(50),
    DataNasc DATE,
    IdTutor INT,
    FOREIGN KEY (IdTutor) REFERENCES Tutor(IdTutor)
);

CREATE TABLE Unidade (
    IdUnidade INT PRIMARY KEY AUTO_INCREMENT,
    Fantasia VARCHAR(100) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    Cep	NUMERIC(11) NOT NULL,
    Telefone NUMERIC(15),
    Numero INT,
    Complemento VARCHAR(100)
);

CREATE TABLE Servico (
    IdServico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(100),
    Preco DECIMAL(5, 2) NOT NULL
);

CREATE TABLE Hora_Func (
	IdHora_Func	INT PRIMARY KEY AUTO_INCREMENT,
	Hora_Func DATETIME NOT NULL,
	Disponivel ENUM('Sim', 'Não') NOT NULL
);

CREATE TABLE Agendamento (
    IdAgendamento INT PRIMARY KEY AUTO_INCREMENT,
    IdPet INT NOT NULL,
    IdTutor INT NOT NULL,
    IdUnidade INT NOT NULL,
    IdHora_Func INT NOT NULL,
    FOREIGN KEY (IdPet) REFERENCES Pet(IdPet),
    FOREIGN KEY (IdTutor) REFERENCES Tutor(IdTutor),
    FOREIGN KEY (IdUnidade) REFERENCES Unidade(IdUnidade),
    FOREIGN KEY (IdHora_Func) REFERENCES Hora_Func(IdHora_Func)
);

CREATE TABLE Pagamento (
	IdPagamento INT PRIMARY KEY AUTO_INCREMENT,
	IdAgendamento INT,
	FormaPagamento ENUM('Cartão', 'Dinheiro') NOT NULL,
	Valor DECIMAL(5,2),
	FOREIGN KEY (IdAgendamento) REFERENCES Agendamento(IdAgendamento)
);

CREATE TABLE Agendamento_Servico (
	IdAgendamento_Servico INT PRIMARY KEY,
    IdAgendamento INT,
    IdServico INT,
    FOREIGN KEY (IdAgendamento) REFERENCES Agendamento(IdAgendamento),
    FOREIGN KEY (IdServico) REFERENCES Servico(IdServico)
);

INSERT INTO Tutor (Nome, Telefone, Email) VALUES
('Adriana','11987654321','adriana@email.com'),
('Bernardo','21908765432','bernardo@email.com'),
('Carina','11912345678','carina@email.com'),
('Daniel','11976543212','daniel@email.com'),
('Eduardo','11934567890','eduardo@email.com');

INSERT INTO Pet (Nome, Tipo, Sexo, Raca, DataNasc, IdTutor) VALUES
('Thor', 'Cachorro', 'M', 'Lhasa Apso', '2015-07-21', 3),
('Luna', 'Cachorro','F', 'SRD', NULL, 5),
('Garfield', 'Gato','M', 'Maine Coon', NULL, 1),
('Agatha', 'Gato','F', 'Persian', '2021-02-12', 3),
('Scooby', 'Cachorro','M', 'Pinscher', '2022-04-24', 4);

INSERT INTO Unidade (Fantasia, Endereco, Cep, Telefone, Numero, Complemento) VALUES
('Au&Miau - Paulista', 'Av. Paulista', 012343334, '11908768945', 45, NULL);

INSERT INTO Hora_Func (Hora_Func, Disponivel) VALUES
('2024-09-01 10:00:00', 'Sim'),
('2024-09-01 10:15:00', 'Sim'),
('2024-09-01 10:30:00', 'Sim'),
('2024-09-01 10:45:00', 'Sim'),
('2024-09-01 11:00:00', 'Sim'),
('2024-09-01 11:15:00', 'Sim'),
('2024-09-01 11:30:00', 'Sim'),
('2024-09-01 11:45:00', 'Sim'),
('2024-09-01 12:00:00', 'Sim'),
('2024-09-01 12:15:00', 'Sim'),
('2024-09-01 12:30:00', 'Sim'),
('2024-09-01 12:45:00', 'Sim'),
('2024-09-01 13:00:00', 'Sim'),
('2024-09-01 13:15:00', 'Sim'),
('2024-09-01 13:30:00', 'Sim'),
('2024-09-01 13:45:00', 'Sim'),
('2024-09-01 14:00:00', 'Sim'),
('2024-09-01 14:15:00', 'Sim'),
('2024-09-01 14:30:00', 'Sim'),
('2024-09-01 14:45:00', 'Sim'),
('2024-09-01 15:00:00', 'Sim'),
('2024-09-01 15:15:00', 'Sim'),
('2024-09-01 15:30:00', 'Sim'),
('2024-09-01 15:45:00', 'Sim'),
('2024-09-01 16:00:00', 'Sim'),
('2024-09-01 16:15:00', 'Sim'),
('2024-09-01 16:30:00', 'Sim'),
('2024-09-01 16:45:00', 'Sim'),
('2024-09-01 17:00:00', 'Sim');

INSERT INTO Servico (Nome, Descricao, Preco) VALUES
('Banho Simples - P', 'Banho Simples para Cachorros de Porte Pequeno', 50.00),
('Banho Simples - M', 'Banho Simples para Cachorros de Porte Médio', 70.00),
('Banho Simples - G', 'Banho Simples para Cachorros de Porte Grande', 120.00),
('Banho Simples - Gatos', 'Banho Simples para Gatos', 50.00),
('Banho Premium - P', 'Banho Premium para Cachorros de Porte Pequeno', 70.00),
('Banho Premium - M', 'Banho Premium para Cachorros de Porte Médio', 90.00),
('Banho Premium - G', 'Banho Premium para Cachorros de Porte Grande', 150.00),
('Banho Premium - Gatos', 'Banho Premium para Gatos', 70.00),
('Tosa - P', 'Tosa para Cachorros de Porte Pequeno', 80.00),
('Tosa - M', 'Tosa para Cachorros de Porte Médio', 100.00),
('Tosa - G', 'Tosa para Cachorros de Porte Grande', 130.00),
('Tosa - Gatos', 'Tosa para Gatos', 80.00),
('Adicional', 'Serviço Adicional para seu Pet', 50.00);

INSERT INTO Agendamento (IdPet, IdTutor, IdUnidade, IdHora_Func) VALUES
(2, 5, 1, 1),
(3, 1, 1, 3),
(5, 4, 1, 5),
(1, 3, 1, 9),
(5, 4, 1, 12);

INSERT INTO Pagamento (IdAgendamento, FormaPagamento, Valor) VALUES
(1, 'Cartão', 50.00),
(2, 'Dinheiro', 50.00),
(3, 'Dinheiro', 120.00),
(4, 'Cartão', 70.00),
(5, 'Cartão', 70.00);

-- INSERT INTO Agendamento_Servico (IdAgendamento, IdServico) VALUES 
-- (1, 1),
-- (2, 4),
-- (3, 3),
-- (4, 2),
-- (5, 2);

select * from tutor;
select * from pet;
select * from unidade;
select * from servico;
select * from hora_func;
select * from agendamento;
select * from pagamento;
select * from agendamento_servico;