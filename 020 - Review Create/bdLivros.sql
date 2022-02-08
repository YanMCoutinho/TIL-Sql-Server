CREATE DATABASE dbLivraria
	GO

USE dbLivraria
	GO

CREATE TABLE tbAutor (
	codAutor INT PRIMARY KEY IDENTITY(1,1)
	,nomeAutor NVARCHAR(200) NOT NULL
)
	GO

CREATE TABLE tbEditora (
	codEditora INT PRIMARY KEY IDENTITY(1,1)
	,nomeEditora NVARCHAR(200) NOT NULL
)
	GO

CREATE TABLE tbGenero (
	codGenero INT PRIMARY KEY IDENTITY(1,1)
	,nomeGenero NVARCHAR(100) NOT NULL
)
	GO

CREATE TABLE tbLivro (
	codLivro INT PRIMARY KEY IDENTITY(1,1)
	,nomeLivro NVARCHAR(100) NOT NULL
	,numPaginas INT NOT NULL
	,codGenero INT FOREIGN KEY REFERENCES tbGenero(codGenero) NOT NULL
	,codAutor INT FOREIGN KEY REFERENCES tbAutor(codAutor) NOT NULL
	,codEditora INT FOREIGN KEY REFERENCES tbEditora(codEditora) NOT NULL	 
)
	GO

INSERT INTO tbGenero(nomeGenero) VALUES 
	('Ficção')
	,('Romance')
	,('Tragédia') 
		GO

INSERT INTO tbEditora(nomeEditora) VALUES
	('Melhoramentos')
	,('Globo')
	,('Àtica')
	,('Companhia das Letras')
	,('Abril')
		GO

INSERT INTO tbAutor(nomeAutor) VALUES
	('Chico Buarque')
	,('Jorge Amado')
	,('J.K. Rowling')
	,('William Shakespeare')
	,('Monteiro Lobato')
	,('Cora Coralina')
	,('Clarice Lispector')
		GO

INSERT INTO tbLivro(nomeLivro, numPaginas, codGenero, codEditora, codAutor) VALUES
	('Budapeste', 176, 2, 4, 1)
	,('O Bicho-da-Seda', 454, 2, 4, 1)
	,('Gabriela, Cravo e Canela', 214, 1, 2, 2)
	,('Reinações de Narizinho', 143, 2, 2, 5)
	,('Romeu e Julieta', 421, 1, 3, 4)
	,('O Irmão Alemão', 478, 1, 4, 1)
	,('Terras do Sem-Fim', 125, 1, 3, 2)
	,('Animais Fantásticos e Onde Habitam', 267, 2, 4, 3)
		GO