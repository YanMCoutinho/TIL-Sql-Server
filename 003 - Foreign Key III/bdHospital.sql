CREATE DATABASE dbHospital

USE dbHospital

CREATE TABLE tbPaciente (
	codPaciente INT PRIMARY KEY IDENTITY(1,1)
	,nomePaciente NVARCHAR(100)
	,convenio VARCHAR(30)
	,rgPaciente INT UNIQUE
);

CREATE TABLE tbMedico (
	codMedico INT PRIMARY KEY IDENTITY(1,1)
	,nomeMedico NVARCHAR(100)
	,crnMedico NVARCHAR(50)
	,rgMedico INT UNIQUE
);

CREATE TABLE tbTelefone (
	codTelefone INT PRIMARY KEY IDENTITY(1,1)
	,numeroTel NVARCHAR(9)
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
);

CREATE TABLE tbEndereco (
	codEndereco INT PRIMARY KEY IDENTITY(1,1)
	,logradouro NVARCHAR(90)
	,numero NVARCHAR(20)
	,cep NVARCHAR(8)
	,bairro NVARCHAR(100)
	,cidade NVARCHAR(50)
	,estado NVARCHAR(30)
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
);

CREATE TABLE tbConsulta (
	codConsulta INT PRIMARY KEY IDENTITY(1,1)
	,dataConsulta date
	,horaConsulta time
	,codPaciente INT FOREIGN KEY REFERENCES tbPaciente(codPaciente)
	,codMedico INT FOREIGN KEY REFERENCES tbMedico(codMedico)
);


