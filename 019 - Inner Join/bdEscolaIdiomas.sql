CREATE DATABASE dbEscolaIdiomas
	GO

USE dbEscolaIdiomas
	GO

CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(50) NOT NULL
	,cargaHorariaCurso INT NOT NULL
	,valorCurso MONEY NOT NULL
)

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(300) NOT NULL
	,dataNascAluno DATE NOT NULL
	,rgAluno VARCHAR(12) NOT NULL
	,naturalidadeAluno VARCHAR(3) NOT NULL 
)
	GO

CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,nomeTurma VARCHAR(50) NOT NULL
	,horarioTurma DATETIME NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso) NOT NULL
)
	GO

CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dataMatricula DATE NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno) NOT NULL
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma) NOT NULL
)
	GO

INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno) VALUES 
('Paulo Santos', '2000-03-10', '82.282.122-0', 'SP')
,('Maria da Gloria', '1999-10-03', '45.233.123-0', 'SP')
,('Pedro Nogueira da Silva', '1998-04-04', '23.533.211-9', 'SP')
,('Gilson Barros Silva', '1995-09-09', '34.221.111-x', 'PE')
,('Mariana Barbosa Santos', '2001-10-10', '54.222.122-9', 'RJ')
,('Alessandro Pereira', '2003-10-11', '24.402.454-9', 'ES')
,('Aline Melo', '2001-10-08', '88.365.012-3', 'RJ')
	GO

INSERT INTO tbCurso(nomeCurso, cargaHorariaCurso, valorCurso) VALUES
('Inglês', 2000, 356)
,('Alemão', 3000, 478)
,('Espanhol', 4000, 500)
	GO

INSERT INTO tbTurma(nomeTurma, horarioTurma, codCurso) VALUES
('1|A', '1900-01-01 12:00:00', 1)
,('1|C', '1900-01-01 18:00:00', 3)
,('1|B', '1900-01-01 18:00:00', 1)
,('1AA', '1900-01-01 19:00:00', 2)
	GO

INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma) VALUES 
('2015-10-03', 1, 1)
,('2014-05-04', 2, 1)
,('2014-05-04', 2, 4)
,('2012-05-03', 3, 2)
,('2016-03-03', 1, 3)
,('2015-05-07', 4, 2)
,('2015-07-05', 4, 3)
	GO

--SELECTS

SELECT COUNT(nomeAluno) AS 'Quantidade de Alunos que fizeram matricula em maio de 2016' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
		WHERE dataMatricula BETWEEN '2016-05-01' AND '2016-05-31'
			GO

SELECT nomeAluno AS 'Alunos', nomeTurma AS 'Turma' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
		ORDER BY nomeAluno ASC
			GO

SELECT nomeCurso AS 'Cursos', horarioTurma AS 'Horário das Turmas' FROM tbTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso
		GO

SELECT COUNT(nomeAluno) AS 'Quantidade de alunos', naturalidadeAluno AS 'Estado' FROM tbAluno
		GROUP BY naturalidadeAluno
			GO

SELECT nomeAluno AS 'Alunos', CONVERT(VARCHAR, dataMatricula,  103) AS 'Data de Matricula' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
		GO

SELECT nomeAluno AS 'Alunos', nomeCurso AS 'Curso' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso
		WHERE nomeAluno LIKE 'A%' AND nomeCurso LIKE 'Inglês'
			GO

SELECT COUNT(codAluno) AS 'Quantidade de Alunos que fizeram matricula em 2016' FROM tbMatricula
		WHERE dataMatricula BETWEEN '2016-01-01' AND '2016-12-31'
			GO

SELECT nomeAluno AS 'Alunos', nomeCurso AS 'Curso' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso
			GO

SELECT COUNT(nomeAluno) AS 'Quantidade de alunos', nomeCurso AS 'Curso' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso on tbTurma.codCurso = tbCurso.codCurso
		GROUP BY nomeCurso
			GO

SELECT COUNT(nomeAluno) AS 'Quantidade de alunos', nomeTurma AS 'Nome da Turma' FROM tbAluno
	INNER JOIN tbMatricula on tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma on tbMatricula.codTurma = tbTurma.codTurma
		GROUP BY nomeTurma
			GO