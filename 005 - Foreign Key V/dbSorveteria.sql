CREATE DATABASE dbSorveteria

USE dbSorveteria

CREATE TABLE tbFornecedor (
	codFornecedor INT PRIMARY KEY IDENTITY(1,1)
	,nomeFornecedor NVARCHAR(60)
	,contato VARCHAR(25)
);

CREATE TABLE tbFuncionario (
	codFuncionario INT PRIMARY KEY IDENTITY(1,1)
	,nomeFuncionario NVARCHAR(100)
	,cpfFuncionario VARCHAR(11)
	,dataNascFuncionario DATE
	,ruaFuncionario NVARCHAR(70)
	,numeroFuncionario VARCHAR(11)
	,bairroFuncionario NVARCHAR(100)
	,cidadeFuncionario NVARCHAR(50)
);

CREATE TABLE tbSorvete (
	codSorvete INT PRIMARY KEY IDENTITY(1,1)
	,nomeSorvete NVARCHAR(40)
	,valorSorvete MONEY
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
);

CREATE TABLE tbOrdemServico (
	codOrdServ INT PRIMARY KEY IDENTITY(1,1)
	,observacaoOrdServ NVARCHAR(250)
	,codFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(codFuncionario)
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)

);

