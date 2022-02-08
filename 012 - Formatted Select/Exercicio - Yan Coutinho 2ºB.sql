CREATE DATABASE db0225Exercicio
GO

USE db0225Exercicio
GO

-- SLIDE 15

CREATE TABLE Carro (
	Placa NVARCHAR(9) PRIMARY KEY NOT NULL
	,Marca NVARCHAR(100) NOT NULL
	,Modelo NVARCHAR(100) NOT NULL
	,Cor NVARCHAR(100) NOT NULL
	,Ano SMALLINT NOT NULL
);
GO

CREATE TABLE Cliente (
	Nome NVARCHAR(200) PRIMARY KEY NOT NULL
	,Logradouro NVARCHAR(200) NOT NULL
	,Nº INT NOT NULL
	,Bairro NVARCHAR(200) NOT NULL
	,Telefone VARCHAR(10) NOT NULL
	,Carro NVARCHAR(9) FOREIGN KEY REFERENCES Carro(Placa) NOT NULL
);
GO

INSERT INTO Carro(Placa, Marca, Modelo, Cor, Ano) 
VALUES ('AFT-9087', 'VW', 'Gol', 'Preto', 2007)
,('DXO-9876', 'Ford', 'Ka', 'Azul', 2000)
,('EGT-4631', 'Renault', 'Clio', 'Verde', 2004)
,('LKM-7380', 'Fiat', 'Palio', 'Prata', 1997)
,('BCD-7521', 'Ford', 'Fiesta', 'Preto', 1999)
GO

UPDATE Carro SET Ano = 2009 WHERE Placa = 'AFT-9087'
GO

INSERT INTO Cliente(Nome, Logradouro, Nº, Bairro, Telefone, Carro) 
VALUES ('João Alves', 'R. Pereira Barreto', 1258, 'Jd. Oliveiras', '2154-9658', 'DXO-9876')
,('Ana Maria', 'R. 7 de Setembro', 259, 'Centro', '9658-8541', 'LKM-7380')
,('Clara Oliveira', 'Av. Nações Unidas', 10254, 'Pinheiros', '2458-9658', 'EGT-4631')
,('José Simões', 'R. XV de Novembro', 36, 'Água Branca', '7895-2459', 'BCD-7521')
,('Paula Rocha', 'R. Anhaia', 548, 'Barra Funda', '6958-2548', 'AFT-9087')
GO

UPDATE Cliente SET Telefone = '9658-8541' WHERE Nome = 'Ana Maria'
GO

-- SELECT'S DO SLIDE 15

SELECT Cliente.Nome, Cliente.Logradouro, Cliente.Telefone, Carro.Marca, Carro.Modelo, Carro.Cor, Carro.Ano FROM Cliente, Carro
WHERE Cliente.Carro = Carro.Placa
GO

SELECT Cliente.Nome, Carro.Modelo, Carro.Placa FROM Cliente, Carro
WHERE Cliente.Carro = Carro.Placa AND Carro.Ano > 2000
GO

-- SLIDE 16

CREATE TABLE tbFuncionario (
	idFunc INT PRIMARY KEY IDENTITY(1,1)
	,nomeFunc NVARCHAR(200) NOT NULL
	,cargoFunc NVARCHAR(200) NOT NULL
	,nascFunc VARCHAR(12) NOT NULL
	,presencaFunc INT NOT NULL
	,salarioBaseFunc MONEY NOT NULL
	,avaliacaoFunc REAL NOT NULL
);
GO

INSERT INTO tbFuncionario(nomeFunc, cargoFunc, nascFunc, presencaFunc, salarioBaseFunc, avaliacaoFunc)
VALUES ('João Maria de Jesus', 'Administrativo', '07/23/78', 80.2, 10600, 8.7)
,('Felipe dos Santos', 'Técnico', '11/02/88', 90, 18200, 5.6)
,('Maria José Silva', 'Técnico', '12/23/90', 87.3, 15000, 4.5)
,('José Silva', 'Admnistrativo', '12/23/78', 60, 16200, 9.3)
,('Mário Antunes', 'RH', '02/11/77', 54.2, 8000, 7.2)
,('Paulo Roberto Silva', 'RH', '10/13/76', 87.2333, 8900, 9.9)
,('Teresa Jardim', 'RH', '01/13/80', 100, 4000, 7.7)
,('Roberto Carlos Alves', 'RH', '12/10/83', 23.64, 4000, 7.7)
,('Paulo Jardim', 'RH', '06/28/45', 34.84, 30500, 10)
,('Maria Eduarda Carvalho da Rosa', 'Administrativo', '08/30/70', 90.78, 9000, 6.6)
,('Pedro Henrique Teixeira', 'Técnico', '12/23/78', 100, 7400, 7.2)
GO

ALTER TABLE tbFuncionario ADD telFuncionario VARCHAR(10) NULL
GO

-- SELECT SLIDE 16

SELECT 
nomeFunc AS 'Nome', 
cargoFunc AS 'Cargo', 
nascFunc AS 'Nascimento', 
presencaFunc AS 'Taxa de Presença', 
salarioBaseFunc AS 'Salário Base', 
avaliacaoFunc  AS 'Avaliação' 
FROM tbFuncionario 
WHERE avaliacaoFunc < 6.0
GO

SELECT 
nomeFunc AS 'Nome', 
cargoFunc AS 'Cargo', 
nascFunc AS 'Nascimento', 
presencaFunc AS 'Taxa de Presença', 
salarioBaseFunc AS 'Salário Base', 
avaliacaoFunc  AS 'Avaliação' 
FROM tbFuncionario 
WHERE avaliacaoFunc > 7 AND cargoFunc = 'RH'
GO

--SLIDE 17

CREATE TABLE tbGasto (
	idGasto INT PRIMARY KEY IDENTITY(1,1)
	,tipoGasto NVARCHAR(200) NOT NULL
	,valorGasto MONEY NOT NULL
	,formaPgGasto NVARCHAR(100) NOT NULL
);
GO

INSERT INTO tbGasto(tipoGasto, valorGasto, formaPgGasto)
VALUES ('Mercado', 85.00, 'Cartão')
,('Remédio', 48.00, 'Dinheiro')
,('Celular', 149.00, 'Cartão')
,('Lanches', 35.00, 'Cheque')
,('Livros', 65.00, 'Cheque')
,('Passagem', 430.00, 'Cartão')
,('Aluguel', 650.00, 'Dinheiro')
,('Teatro', 50.00, 'Cartão')
,('Roupas', 220.00, 'Cartão')
GO

SELECT tipoGasto AS 'Tipo', valorGasto AS 'Valor', formaPgGasto AS 'Forma de pagamento' FROM tbGasto
WHERE formaPgGasto = 'Cartão'
GO

UPDATE tbGasto SET valorGasto = 250.00 WHERE valorGasto = 220.00

SELECT * FROM tbGasto