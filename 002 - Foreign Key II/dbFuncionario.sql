CREATE DATABASE bdFuncionario

USE bdFuncionario

CREATE TABLE tbFuncionario (
	idFuncionario INT PRIMARY KEY IDENTITY(1,1)
	,nomeFuncionario NVARCHAR(50)
	,dtNastFuncionario DATE
	,logFuncionario VARCHAR(50)
	,numLog INT
	,uFFuncionario VARCHAR(50)
	,bairroFuncionario nvarchar(60)
);

CREATE TABLE tbFone (
	idFone INT PRIMARY KEY IDENTITY(1,1)
	,descriFone NVARCHAR(250)
	,idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(idFuncionario)
);

CREATE TABLE tbCor (
	idCor INT PRIMARY KEY IDENTITY(1,1)
	,descricaoCor nvarchar(250)
);

CREATE TABLE tbModelo (
	idModelo INT PRIMARY KEY IDENTITY(1,1)
	,marcaModelo nvarchar(30)
	,anoModelo date
	,descriModelo nvarchar(250)
);


CREATE TABLE tbVeiculo (
	idVeiculo INT PRIMARY KEY IDENTITY(1,1)
	,diaVeiculo VARCHAR(2)
	,horaVeiculo time
	,placaVeiculo VARCHAR(10)
	,idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(idFuncionario)
	,idModelo INT FOREIGN KEY REFERENCES tbModelo(idModelo)
	,idCor INT FOREIGN KEY REFERENCES tbCor(idCor)
);