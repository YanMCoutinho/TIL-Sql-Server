CREATE DATABASE bdEscolaIdiomas
	GO

USE bdEscolaIdiomas
	GO

CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(50) NOT NULL
	,cargaHorariaCurso INT NOT NULL
	,valorCurso MONEY NOT NULL
)
	GO

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
,('1|B', '1900-01-01 18:00:00', 1)
,('1AA', '1900-01-01 19:00:00', 2)
	GO

INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma) VALUES 
('2015-03-10', 1, 1)
,('2014-04-05', 2, 1)
,('2012-03-05', 3, 2)
,('2016-03-03', 1, 3)
,('2015-07-05', 4, 2)
,('2015-05-07', 4, 2)
,('2015-06-06', 5, 1)
,('2015-05-05', 5, 3)
	GO

--CREATE VIEW nomedaview AS SELECT dado,dado,dado, FROM tabela

CREATE VIEW vwPrecoBaixo AS 
	SELECT codCurso AS 'Código do Curso', nomeCurso AS 'Nome do Curso', valorCurso AS 'Valor do Curso' 
	FROM tbCurso
		WHERE valorCurso < 400
			GO

SELECT * FROM vwPrecoBaixo
	GO

CREATE VIEW vwCursoCargaHoraria AS 
	SELECT nomeCurso AS 'Curso', cargaHorariaCurso AS 'Carga Horária' FROM tbCurso
		GO

SELECT * FROM vwCursoCargaHoraria
	GO

CREATE VIEW vwAlunosPorTurma AS
	SELECT tbCurso.nomeCurso AS 'Nome do Curso', COUNT(tbAluno.codAluno) AS 'Quantidade de alunos' FROM tbAluno
		INNER JOIN tbMatricula on tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma on tbTurma.codTurma = tbMatricula.codTurma 
		INNER JOIN tbCurso on tbCurso.codCurso = tbTurma.codCurso
			GROUP BY nomeCurso
				GO

SELECT * FROM vwAlunosPorTurma
	GO

CREATE VIEW vwMaiorTurma AS
	SELECT  MAX([Nome do Curso]) AS 'Nome da Maior Turma', MAX([Quantidade de alunos]) AS 'Maior quantidade de Alunos' FROM vwAlunosPorTurma
		GO

SELECT * FROM vwMaiorTurma
	GO

DROP VIEW vwAlunosPorTurma
	GO

ALTER VIEW vwPrecoBaixo AS
	SELECT codCurso AS 'Código do Curso', nomeCurso AS 'Nome do Curso', valorCurso AS 'Valor do Curso'
	,cargaHorariaCurso AS 'Carga Horária do Curso' 
		FROM tbCurso
			WHERE valorCurso < 400
				GO

SELECT * FROM vwPrecoBaixo
	GO