CREATE DATABASE db0325Exercicios
GO

USE db0325Exercicios
GO

--Exercicio Create

CREATE TABLE tbProfessor (
	codProfessor INT PRIMARY KEY IDENTITY(1,1)
	,nomeProfessor NVARCHAR(300) NOT NULL
)
GO

CREATE TABLE tbHorario (
	codHorario INT PRIMARY KEY IDENTITY(1,1)
	,descHorario NVARCHAR(280) NOT NULL
)
GO

CREATE TABLE tbTipoPlano (
	codTipoPlano INT PRIMARY KEY IDENTITY(1,1)
	,descTipoPlano NVARCHAR(280) NOT NULL
)
GO

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno NVARCHAR(300) NOT NULL
	,rgAluno VARCHAR(9) NOT NULL
	,cpfAluno VARCHAR(11) NOT NULL
)
GO



CREATE TABLE tbFoneAluno (
	codFoneAluno INT PRIMARY KEY IDENTITY(1,1)
	,numFoneAluno VARCHAR(11) NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno) NOT NULL
)
GO

CREATE TABLE tbFoneProfessor (
	codFoneProfessor INT PRIMARY KEY IDENTITY(1,1)
	,numFoneProfessor VARCHAR(11) NOT NULL
	,codProfessor INT FOREIGN KEY REFERENCES tbProfessor(codProfessor) NOT NULL
)
GO

CREATE TABLE tbModalidade (
	codModalidade INT PRIMARY KEY IDENTITY(1,1)
	,nomeModalidade NVARCHAR(100) NOT NULL
	,codProfessor INT FOREIGN KEY REFERENCES tbProfessor(codProfessor) NOT NULL
	,codHorario INT FOREIGN KEY REFERENCES tbHorario(codHorario) NOT NULL
)
GO

CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno) NOT NULL
	,codTipoPlano INT FOREIGN KEY REFERENCES tbTipoPlano(codTipoPlano) NOT NULL
	,codModalidade INT FOREIGN KEY REFERENCES tbModalidade(codModalidade) NOT NULL
	,dataMatricula DATE NOT NULL
)
GO

--CREATES E INSERTS

CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente NVARCHAR(200) NOT NULL
	,cpfCliente VARCHAR(11) NOT NULL
	,emailCliente NVARCHAR(100) NOT NULL
	,sexoCliente CHAR(1) NOT NULL
	,dtNascCliente DATE NOT NULL
)
GO

CREATE TABLE tbFabricante (
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante NVARCHAR(300) NOT NULL
)
GO

CREATE TABLE tbFornecedor (
	codFornecedor INT PRIMARY KEY IDENTITY(1,1)
	,nomeFornecedor NVARCHAR(300) NOT NULL
	,contatoFornecedor NVARCHAR(300) NOT NULL
)
GO

CREATE TABLE tbVenda (
	codVenda INT PRIMARY KEY IDENTITY(1,1)
	,dataVenda DATE NOT NULL
	,valorTotalVenda MONEY NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente) NOT NULL
)
GO

CREATE TABLE tbProduto (
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	,descProduto NVARCHAR(280) NOT NULL
	,valorProduto MONEY NOT NULL
	,qtdProduto INT NOT NULL
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante) NOT NULL
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor) NOT NULL
)
GO

CREATE TABLE tbItemVenda (
	codItemVenda INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda) NOT NULL
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto) NOT NULL
	,qtdItemVenda INT NOT NULL
	,subTotalItemVenda INT NOT NULL
)
GO

-- INSERTS 

INSERT INTO tbCliente(nomeCliente, cpfCliente, emailCliente, sexoCliente, dtNascCliente) VALUES
('Armando José Santana', '12345678900', 'armandoJsantan@outlook.com.br', 'm', '19610221')
,('Sheila Carvalho Leal', '45678909823', 'scarvalho@ig.com.br', 'f', '19780913')
,('Carlos Henrique Souza', '76598278299', 'carlosh@outlook.com', 'm', '19810908')
,('Maria Aparecida Souza', '87365309899', 'mariamaria@etec.sp.gov.br', 'f', '19620707')
,('Adriana Nogueira Silva', '10000000001', 'drica19@terra.com.br', 'f', '19770409')
,('Paulo Henrique Silva', '87390123111', 'ph2021@uol.com.br', 'm', '19870202')
GO

INSERT INTO tbFabricante(nomeFabricante) VALUES
('Unilever')
,('P&G')
,('Bunge')
GO

INSERT INTO tbFornecedor(nomeFornecedor, contatoFornecedor) VALUES
('Atacadão', 'Carlos Santos')
,('Assai', 'Maria Stella')
,('Roldão', 'Paulo César')
GO

INSERT INTO tbProduto(descProduto, valorProduto, qtdProduto, codFabricante, codFornecedor) VALUES
('Amaciante Downy', 5.76, 1500, 2, 1)
,('Amaciante Confort', 5.45, 2300, 1, 1)
,('Sabão em Pó OMO', 5.99, 1280, 1, 2)
,('Margarina Qually', 4.76, 2500, 3, 1)
,('Salsicha Hot-dog Sadia', 6.78, 2900, 3, 2)
,('Mortadela Perdigão', 2.50, 1200, 3, 3)
,('Hamburger Sadia', 9.89, 1600, 3, 1)
,('Fralda Pampers', 36.00, 340, 2, 3)
,('Xampu Seda', 5.89, 800, 1, 2)
,('Condicionador Seda', 6.50, 700, 1, 3)
GO

INSERT INTO tbVenda(dataVenda, valorTotalVenda, codCliente) VALUES
('20210201', 4500, 1)
,('20210203', 3400, 1)
,('20210310', 2100, 2)
,('20210315', 2700, 3)
,('20210317', 560, 3)
,('20210306', 1200, 4)
,('20210307', 3500, 5)
,('20210209', 3400, 1)
,('20210320', 4000, 2)
GO

INSERT INTO tbItemVenda(codVenda, codProduto, qtdItemVenda, subTotalItemVenda) VALUES
(1, 1, 200, 1500)
,(1, 2, 300, 3000)
,(2, 4, 120, 1400)
,(2, 2, 200, 1000)
,(2, 3, 130, 1000)
,(3, 5, 200, 2100)
,(4, 4, 120, 1000)
,(4, 5, 450, 700)
,(5, 5, 200, 560)
,(6, 7, 200, 600)
,(6, 6, 300, 600)
,(8, 1, 300, 2500)
,(8, 2, 200, 1000)
,(8, 6, 250, 1700)
,(9, 5, 200, 1700)
,(10, 4, 1000, 4000)