-- Feito por Yan e Simone

CREATE DATABASE dbEstoque
	GO

USE dbEstoque
	GO

CREATE TABLE tbFabricante (
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante NVARCHAR(100) NOT NULL
)
	GO

CREATE TABLE tbFornecedor (
	codFornecedor INT PRIMARY KEY IDENTITY(1,1)
	,nomeFornecedor NVARCHAR(100) NOT NULL
	,contatoFornecedor NVARCHAR(100) NOT NULL 
)
	GO

CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente NVARCHAR(100) NOT NULL
	,cpfCliente VARCHAR(11) NOT NULL 
	,emailCliente NVARCHAR(50) NOT NULL  
	,sexoCliente VARCHAR(1) NOT NULL 
	,dataNascimentoCliente DATE NOT NULL 
)
	GO

CREATE TABLE tbVenda (
	codVenda INT PRIMARY KEY IDENTITY(1,1)
	,dataVenda DATE NOT NULL
	,valorTotalVenda MONEY NOT NULL 
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente) NOT NULL 
)
	GO

CREATE TABLE tbProduto (
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	,descricaoProduto NVARCHAR(100) NOT NULL
	,valorProduto MONEY NOT NULL 
	,quantidadeProduto INT NOT NULL 
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante) NOT NULL
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor) NOT NULL 
)
	GO

CREATE TABLE tbItensVenda (
	codItensVenda INT PRIMARY KEY IDENTITY(1,1)
	,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda) NOT NULL 
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto) NOT NULL 
	,quantidadeItensVenda INT NOT NULL
	,subTotalItensVenda MONEY NOT NULL 	
)
	GO


INSERT INTO tbFabricante (nomeFabricante) VALUES
('Unilever')
,('P&G')
,('Bunge')
	GO

INSERT INTO tbFornecedor (nomeFornecedor, contatoFornecedor) VALUES
('Atacad�o', 'Carlos Santos')
,('Assai','Maria Stella')
,('Rold�o','Paulo C�sar')
	GO

INSERT INTO tbCliente (nomeCliente, cpfCliente, emailCliente, sexoCliente, dataNascimentoCliente) VALUES
('Armando Jos� Santana', '12345678900', 'armandojsantana@outlook.com', 'm', '1961-02-21')
,('Sheila Carvalho Leal','45678909823','scarvalho@ig.com.br','f','1978-09-13')
,('Carlos Henrique Souza','76598278299','chenrique@ig.com.br','m','1981-09-08')
,('Maria Aparecida Souza','87365309899','mapdasouza@outlook.com','f','1962-07-07')
,('Adriana Nogueira Silva','76354309388','drica1977@ig.com.br','f','1977-04-09')
,('Paulo Henrique Silva','87390123111','phsilva80@hotmail.com','m','1987-02-02')
	GO

INSERT INTO tbProduto (descricaoProduto, valorProduto, quantidadeProduto, codFabricante, codFornecedor) VALUES
('Amaciante Downy', 5.76, 1500, 2, 1)
,('Amaciante Comfort', 5.45, 2300, 1, 1)
,('Sab�o em p� OMO', 5.99, 1280, 1, 2)
,('Margarina Qualy', 4.76, 2500, 3, 1)
,('Salsicha Hot Dog Sadia', 6.78, 2900, 3, 2)
,('Mortadela Perdig�o', 2.50, 1200, 3, 3)
,('Hamburguer Sadia', 9.89, 1600, 3, 1)
,('Fralda Pampers', 36.00, 340, 2, 3)
,('Xampu Seda', 5.89, 800, 1, 2)
,('Condicionador Seda', 6.50, 700, 1, 3)
	GO

INSERT INTO tbVenda(dataVenda, valorTotalVenda, codCliente) VALUES 
('2014-02-01', 4500, 1)
,('2014-02-03', 3400, 1)
,('2014-02-10', 2100, 2)
,('2014-02-15', 2700, 3)
,('2014-03-17', 560, 3)
,('2014-04-09', 1200, 4)
,('2014-05-07', 3500, 5)
,('2014-05-07', 3400, 1)
,('2014-05-05', 4000, 2)
	GO

INSERT INTO tbItensVenda(codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda) VALUES 
(1, 1, 200, 4500)
,(1, 2, 300, 3000)
,(2, 4, 120, 1400)
,(2, 2, 200, 1000)
,(2, 3, 130, 1000)
,(3, 5, 200, 2100)
,(4, 4, 120, 1000)
,(4, 5, 450, 700)
,(1, 2, 300, 3000)
,(5, 5, 300, 3000)
,(6, 7, 200, 600)
,(6, 6, 300, 600)
,(8, 1, 300, 2500)
,(8, 2, 200, 1000)
,(9, 6, 250, 1700)
,(9, 5, 200, 1700)
,(9, 4, 1000, 4000)
	GO



--TRIGGER 1
CREATE TRIGGER tgReduzirQtdProduto ON tbItensVenda INSTEAD OF UPDATE AS
	BEGIN
		DECLARE 
			@quantidade	INT, 
			@id INT, 
			@codProduto INT,
			@codVenda INT,
			@subtotal MONEY, 
			@quantidadeArmazenada INT, 
			@nomeProduto NVARCHAR(100)

			SET @quantidade = (SELECT quantidadeItensVenda FROM INSERTED)
			SET @codProduto = (SELECT codProduto FROM INSERTED)
			SET @codVenda = (SELECT codVenda FROM INSERTED)
			SET @subtotal = (SELECT subTotalItensVenda FROM INSERTED)
			SET @quantidadeArmazenada = (SELECT quantidadeProduto FROM tbProduto WHERE codProduto = @codProduto)
			SET @nomeProduto = (SELECT descricaoProduto FROM tbProduto WHERE codProduto = @codProduto)

�		IF (@quantidade < @quantidadeArmazenada)
			BEGIN
				UPDATE tbProduto SET quantidadeProduto = @quantidadeArmazenada - @quantidade WHERE codProduto = @codProduto
				
				INSERT tbItensVenda(codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda) VALUES 
					(@codVenda, @codProduto, @quantidade, @subtotal)
			END

		ELSE 
			BEGIN
				PRINT 'N�o h� essa quantidade de ' + @nomeProduto + ' para executar a venda'
			END
	END
		GO


--TRIGGER 2
CREATE TRIGGER tgAumentarQtdProduto ON tbProduto INSTEAD OF UPDATE AS
	BEGIN
		DECLARE 
			@cod INT
			SELECT @cod = codProduto FROM INSERTED
		
		IF UPDATE(codProduto) RAISERROR('N�o � poss�vel alterar o codProduto', 16, -1)


		IF UPDATE(descricaoProduto)
			BEGIN
				DECLARE
					@desc NVARCHAR(100)

				SELECT @desc = descricaoProduto FROM INSERTED
				UPDATE tbProduto SET descricaoProduto = @desc WHERE codProduto = @cod
			END


		IF UPDATE(valorProduto)
			BEGIN
				DECLARE
					@valor MONEY

				SELECT @valor = valorProduto FROM INSERTED
				UPDATE tbProduto SET valorProduto = @valor WHERE codProduto = @cod
			END


		IF UPDATE(quantidadeProduto)
			BEGIN
				DECLARE
					@quantidade INT,
					@quantidadeArmazenada INT

				SELECT @quantidade = quantidadeProduto FROM INSERTED
				SELECT @quantidadeArmazenada = quantidadeProduto FROM tbProduto WHERE codProduto = @cod

				UPDATE tbProduto SET quantidadeProduto = (@quantidade + @quantidadeArmazenada) WHERE codProduto = @cod
			END


		IF UPDATE(codFabricante)
			BEGIN
				DECLARE
					@codFabricante INT

				SELECT @codFabricante = codFabricante FROM INSERTED
				UPDATE tbProduto SET codFabricante = @codFabricante WHERE codProduto = @cod
			END


		IF UPDATE(codFornecedor)
			BEGIN
				DECLARE
					@codFornecedor INT

				SELECT @codFornecedor = codFornecedor FROM INSERTED
				UPDATE tbProduto SET codFornecedor = @codFornecedor WHERE codProduto = @cod
			END

	END
		GO


--TRIGGER 3
CREATE TRIGGER tgFornecedorInserido ON tbFornecedor AFTER INSERT AS
	BEGIN
		PRINT 'Um fornecedor foi inserido com sucesso!'
	END
		GO


--TRIGGER 4
CREATE TRIGGER tgFabricanteInserido ON tbFabricante AFTER INSERT AS
	BEGIN
		PRINT 'Um fabricante foi inserido com sucesso!'
	END
		GO


-- TRIGGER 5
CREATE TRIGGER tgDarParabens ON tbCliente FOR INSERT AS
	BEGIN
		DECLARE
			@dataNasc DATE

			SET @dataNasc = (SELECT dataNascimentoCliente FROM INSERTED)
			
�		IF (DAY(@dataNasc) = DAY(GETDATE()) AND MONTH(@dataNasc) = MONTH(GETDATE()))
			BEGIN
				PRINT 'Parab�ns!! Hoje voc� est� realizando ' + CAST( (YEAR(GETDATE()) - YEAR(@dataNasc) ) AS NVARCHAR) + ' anos de vida!!'
			END
	END
		GO