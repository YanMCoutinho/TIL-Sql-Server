CREATE DATABASE db0311Fixacao
GO

USE db0311Fixacao
GO

--SLIDE 12

CREATE TABLE tbCarro (
	idCarro INT PRIMARY KEY IDENTITY(1,1)
	,marcaCarro NVARCHAR(50) NOT NULL
	,modeloCarro NVARCHAR(100) NOT NULL
	,anoCarro DATE NOT NULL
	,corCarro NVARCHAR(100) NOT NULL
	,valorCarro MONEY NOT NULL
	,portaCarro INT NOT NULL
	,combustivelCarro NVARCHAR(100) NOT NULL
);
GO

INSERT INTO tbCarro(marcaCarro, modeloCarro, anoCarro, corCarro, valorCarro, portaCarro, combustivelCarro) VALUES
('Fiat', 'Uno', '20100101', 'branco', 30600, 2, 'flex') 
,('Fiat', 'Palio', '20100101', 'prata', 35500, 2, 'flex')
,('Fiat', 'Uno', '20080101', 'prata', 29600, 4, 'GNV')
,('Fiat', 'Stilo', '20100101', 'verde', 42600, 4, 'flex')
,('Fiat', 'Uno', '20080101', 'preto', 44900, 4, 'flex')
,('Fiat', 'Punto', '20090101', 'branco', 25500, 4, 'flex')
,('Fiat', 'Uno', '20080101', 'branco', 23000, 2, 'flex')
,('Fiat', 'Palio', '20070101', 'prata', 26000, 2, 'flex')
GO

SELECT CAST(valorCarro*1.10 AS DECIMAL(38,2)) AS 'Novo Valor' FROM tbCarro
GO

SELECT COUNT(*) AS 'Quantidade de Uno´s' FROM tbCarro WHERE modeloCarro = 'Uno'
GO

SELECT COUNT(*) AS 'Quantidade de carros de 4 portas' FROM tbCarro WHERE portaCarro = 4
GO

SELECT 'Fazem: ' + CAST(DATEDIFF(DAY,'15/01/2010','05/10/2020') AS VARCHAR) + ' dias, ' AS 'Dias'
,CAST(DATEDIFF(MONTH, '15/01/2010','05/10/2020') AS VARCHAR) + ' meses' AS 'Meses'
,'ou ' + CAST(DATEDIFF(YEAR, '15/01/2010','05/10/2020') AS VARCHAR) + ' anos.' AS 'Anos'
GO

-- SLIDE 13

CREATE TABLE tbPessoa (
	idPessoa INT PRIMARY KEY IDENTITY(1,1)
	,nomePessoa NVARCHAR(250) NOT NULL
	,profissaoPessoa NVARCHAR(250) NOT NULL
	,nascPessoa DATE NOT NULL
	,sexoPessoa VARCHAR(1) NOT NULL
	,pesoPessoa FLOAT NOT NULL
	,alturaPessoa FLOAT NOT NULL 
	,paisPessoa NVARCHAR(200) NOT NULL
)
GO

INSERT INTO tbPessoa (nomePessoa,profissaoPessoa,nascPessoa,sexoPessoa,pesoPessoa,alturaPessoa,paisPessoa) VALUES
('Caio', 'Professor', '19840102', 'M', 78.50, 1.83, 'BRASIL')
,('Felipe', 'Empresário', '19840102', 'M', 78.50, 1.83, 'Afeganistão')
,('Alfredo', 'Juiz', '19920304', 'M', 85.3, 1.86, 'BRASIL')
,('Alessandra', 'Diretora', '19850503', 'F', 73.40, 1.76, 'Brasil')
,('Márcio', 'Professor', '19840102', 'M', 78.50, 1.83, 'BRASIL')
,('Pablo', 'Juiz', '19920304', 'M', 82.50, 1.85, 'Angola')
,('Andiara', 'Professora', '19850503', 'F', 75.30, 1.76, 'BRASIL')
,('Gustavo', 'Marceneiro', '19900604', 'M', 80.30, 1.90, 'Inglaterra')
,('José Fernando', 'Professor', '19840102', 'M', 78.50, 1.83, 'BRASIL')
,('Augusto', 'Contador', '19920304', 'M', 82.50, 1.85, 'Canadá')
,('Luciana', 'Advogado', '19850503', 'F', 75.30, 1.76, 'Brasil')
,('Celso', 'Professor', '19900604', 'M', 80.30, 1.90, 'France')
,('Paulo', 'Padeiro', '19450304', 'M', 99.90, 1.87, 'Suíça')
GO

SELECT CAST(AVG(pesoPessoa) AS DECIMAL(38,2)) AS 'Média dos pesos' FROM tbPessoa
GO

SELECT CAST(AVG(alturaPessoa) AS DECIMAL(38,2)) AS 'Média das alturas' FROM tbPessoa
GO

SELECT COUNT(idPessoa) AS 'Quantidade de Brasileiros' FROM tbPessoa WHERE LOWER(paisPessoa) = 'brasil'
GO

SELECT COUNT(paisPessoa) AS 'Quantidade de Brasileiros Professores Entrevistados' FROM tbPessoa 
WHERE LOWER(paisPessoa) = 'brasil' AND LOWER(SUBSTRING(profissaoPessoa, 1, 9)) = 'professor'
GO

SELECT nomePessoa AS 'Nome', 
CONVERT(VARCHAR(20), nascPessoa, 103) AS 'Data de Nascimento'
, DATEDIFF(YEAR,	nascPessoa, GETDATE()) AS 'Idade'
, profissaoPessoa AS 'Profissão' 
FROM tbPessoa
GO

-- Slide 14

CREATE TABLE tbVenda (
	idVendedor INT PRIMARY KEY IDENTITY(1,1)
	,VendaVendedor NVARCHAR(200) NOT NULL
	,VendaData DATE NOT NULL
	,produtoVenda NVARCHAR(200) NOT NULL
	,precoUniVenda MONEY NOT NULL
	,qtdProdVenda INT NOT NULL
	,totalVenda MONEY NOT NULL
)
GO

INSERT INTO tbVenda(VendaVendedor,VendaData,produtoVenda,precoUniVenda,qtdProdVenda, totalVenda) VALUES
('Luciano', '20150105', 'Produto A', 50, 1, 50)
,('Rafael', '20150105', 'Produto A', 50, 2, 100)
,('Renata', '20150105', 'Produto A', 50, 3, 150)
,('Luciano', '20150105', 'Produto B', 30, 2, 60)
,('Rafael', '20150105', 'Produto B', 30, 5, 150)
,('Renata', '20150105', 'Produto B', 30, 4, 120)
,('Luciano', '20150106', 'Produto A', 50, 6, 300)
,('Rafael', '20150106', 'Produto A', 50, 2, 100)
,('Renata', '20150106', 'Produto A', 50, 9, 450)
,('Luciano', '20150106', 'Produto B', 30, 6, 180)
,('Rafael', '20150106', 'Produto B', 30, 8, 240)
,('Renata', '20150106', 'Produto B', 30, 4, 120)
GO

SELECT SUM(qtdProdVenda) AS 'Quantidades de Produtos Vendidos em 05/01/2015' FROM tbVenda 
WHERE CONVERT(VARCHAR(20), VendaData, 103) = '05/01/2015'
GO

SELECT COUNT(produtoVenda) AS 'Quantidades de Produtos B Vendidos em 06/01/2015' FROM tbVenda 
WHERE CONVERT(VARCHAR(20), VendaData, 103) = '06/01/2015' AND LOWER(produtoVenda) = 'produto b'
GO

SELECT AVG(totalVenda) AS 'Média dos Valores Vendidos' FROM tbVenda
GO

SELECT CAST(((SUM(totalVenda)*1.20)*0.97) AS DECIMAL(38,2)) AS 'Estimativa do Valor da Receita' FROM tbVenda
GO

SELECT DATEDIFF(DAY, '06/01/2015', GETDATE()) AS 'Diferença em Dias, '
, DATEDIFF(MONTH, '06/01/2015', GETDATE()) AS 'Meses e '
,DATEDIFF(YEAR, '06/01/2015', GETDATE()) AS 'Anos ' 
GO