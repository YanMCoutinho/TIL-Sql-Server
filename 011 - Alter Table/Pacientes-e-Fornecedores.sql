CREATE DATABASE db0218Exercicio1
GO

USE db0218Exercicio1
GO

--tabela 1 Paciente do slide 10

CREATE TABLE tbPaciente (
	idPaciente INT PRIMARY KEY IDENTITY(1,1) NOT NULL 
	,cpfPaciente BIGINT NOT NULL UNIQUE
	,nomePaciente NVARCHAR(200) NOT NULL
	,ruaPaciente NVARCHAR(200) NOT NULL
	,numRuaPaciente INT NOT NULL
	,bairroPaciente NVARCHAR(200) NOT NULL
	,telefonePaciente VARCHAR(11)
	,idadePaciente INT NOT NULL
);
GO

INSERT INTO tbPaciente(cpfPaciente, nomePaciente, ruaPaciente, numRuaPaciente, bairroPaciente, telefonePaciente, idadePaciente)
VALUES (35454562890, 'José Rubens', 'Campos Salles', 2750, 'Centro', '21450998', 56), 
(29865439810, 'Ana Claudia', 'Sete de Setembro', 178, 'Centro', '97382764', 12),
(82176534800, 'Marcos Aurélio', 'Timóteo Penteado', 236, 'Vila Galvão', '68172651', 26)
GO

INSERT INTO tbPaciente(cpfPaciente, nomePaciente, ruaPaciente, numRuaPaciente, bairroPaciente, idadePaciente)
VALUES (12386758770, 'Maria Rita', 'Castello Branco', 7765, 'Vila Rosália', 19)
GO

INSERT INTO tbPaciente(cpfPaciente, nomePaciente, ruaPaciente, numRuaPaciente, bairroPaciente, telefonePaciente, idadePaciente)
VALUES (92173458910, 'Joana de Souza', 'XV de Novembro', 298, 'Centro', '2127651', 70)
GO

SELECT * FROM tbPaciente
GO

UPDATE tbPaciente SET telefonePaciente = '98345621' WHERE nomePaciente = 'Maria Rita'
GO

SELECT * FROM tbPaciente
GO

--tabela 2 Fornecedor do slide 11

CREATE TABLE tbFornecedor (
	idFornecedor INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,nomeFornecedor NVARCHAR(200) NOT NULL
	,logFornecedor NVARCHAR(200) NOT NULL
	,numFornecedor INT NOT NULL CHECK(numFornecedor>0)
	,complFornecedor NVARCHAR(50) NOT NULL
	,cidadeFornecedor NVARCHAR(100) NOT NULL
);
GO

INSERT INTO tbFornecedor(nomeFornecedor, logFornecedor, numFornecedor, complFornecedor, cidadeFornecedor) 
VALUES ('LG', 'Rod. Bandeirante', 7000, 'Km70', 'Itapeva'),
('Asus', 'Av. Nações Unidas', 10206, 'Sala 225', 'São Paulo'),
('AMD', 'Av. Nações Unidas', 10206, 'Sala 1095', 'São Paulo'),
('Leadership', 'Av. Nações Unidas', 10206, 'Sala 87', 'São Paulo'),
('Inno', 'Av. Nações Unidas', 10206, 'Sala 34', 'São Paulo')
GO

SELECT * FROM tbFornecedor
GO

ALTER TABLE tbFornecedor ADD telFornecedor VARCHAR(08) NULL
GO

SELECT * FROM tbFornecedor
GO