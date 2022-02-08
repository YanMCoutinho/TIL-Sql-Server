CREATE DATABASE dbLoja

USE dbLoja

CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente NVARCHAR(100)
	,cpfCliente VARCHAR(9) UNIQUE
	,emailCliente VARCHAR(70)
	,sexoCliente VARCHAR(9)
	,dataNascCliente DATE
);

CREATE TABLE tbFabricante (
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante NVARCHAR(100)
);

CREATE TABLE tbFornecedor (
	codFornecedor INT PRIMARY KEY IDENTITY(1,1)
	,nomeFornecedor NVARCHAR(100)
	,contatoFornecedor VARCHAR(9)
);

CREATE TABLE tbProduto (
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	,descricaoProduto NVARCHAR(250)
	,valorProduto MONEY
	,quantidadeProduto INT
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
);

CREATE TABLE tbVenda (
	codVenda INT PRIMARY KEY IDENTITY(1,1)
	,dataVenda DATE
	,valorTotal MONEY
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
);

CREATE TABLE tbItemVenda (
	codItemVenda INT PRIMARY KEY IDENTITY(1,1)
	,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,qtdItemVenda INT
	,subTotalItemVenda MONEY	
);