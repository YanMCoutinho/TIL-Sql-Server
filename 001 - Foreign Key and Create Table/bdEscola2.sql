CREATE DATABASE bdEscola

USE bdEscola

CREATE TABLE tbCurso (
	codCurso int PRIMARY KEY IDENTITY(1,1)
	,nomeCurso nvarchar(30)
	,cargaHoraCurso int
	,valorCurso money 
);

CREATE TABLE tbAluno (
	codAluno int PRIMARY KEY IDENTITY(1,1)
	,nomeAluno nvarchar(60)
	,dataNascAluno date
	,rgAluno smallint
	,naturalAluno nvarchar(60) 
);

CREATE TABLE tbTurma (
	codTurma int PRIMARY KEY IDENTITY(1,1)
	,nomeTurma nvarchar(30)
	,horarioTurma smalldatetime
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
);

CREATE TABLE tbMatricula (
	codMatricula int PRIMARY KEY IDENTITY(1,1)
	,dataMatricula date
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
);