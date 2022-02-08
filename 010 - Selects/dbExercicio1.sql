CREATE DATABASE dbExercicio1

USE dbExercicio1


CREATE TABLE tbFunc (
	codFunc INT PRIMARY KEY IDENTITY(1,1)
	,nomeFunc VARCHAR(100)
	,Uf VARCHAR(2)
	,idadeFunc INT
	,qtdFilhos INT
);


CREATE TABLE tbFuncional (
	codFuncional INT PRIMARY KEY IDENTITY(1,1)
	,cargo VARCHAR(100)
	,salario MONEY
	,tempoEmpresa INT
	,tempoCargo INT
	,sindicalizado BINARY
	,codFunc INT FOREIGN KEY REFERENCES tbFunc(codFunc)
);

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Domenica Santos', 'SP', 20, 0)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Jonas Santos', 'SP', 20, 0)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Conrad Santos', 'RJ', 300, 0)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Domenica Drummond', 'RN', 50, 0)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Pedro Malacoi', 'SP', 6, 0)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Dom Silva', 'SP', 77, 0)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('TIO SAM', 'PI', 88, 0)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Jorge Cleiton Maia', 'SP', 99, 0)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Arnica Santos', 'SP', 300, 4320)

INSERT INTO tbFunc(nomeFunc, Uf, idadeFunc, qtdFilhos)
VALUES ('Sr. Armenio Braga Borba', 'SP', 100, 0)

SELECT * FROM tbFunc


INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Chanfrador', 10.20, 10, 20, 1, 1)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Maquinista', 0.2, 10, 20, 1, 2)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Operador de Caixa', 0.2, 10, 20, 1, 3)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Extrutor de sopro', 0.2, 10, 20, 1, 4)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Duteiro', 0.2, 10, 20, 1, 5)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Flanelinha', 11110.2, 1, 200, 0, 6)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Streamer', 3350.2, 10, 20, 1, 7)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Co-Operador de caixa', 10000.2, 100, 2, 0, 8)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Sub Operador de caixa', 2.50, 10, 1, 1, 9)

INSERT INTO tbFuncional(cargo, salario, tempoEmpresa, tempoCargo, sindicalizado, codFunc)
VALUES ('Gerente', 20, 10, 2, 0, 10)

SELECT * FROM tbFuncional



SELECT SUM(codFunc) AS 'Soma dos Códigos dos Funcionários' FROM tbFunc​ 

SELECT SUM(idadeFunc) AS 'Soma das Idades dos Funcionários' FROM tbFunc

SELECT SUM(qtdFilhos) AS 'Soma da Quantidade de Filhos dos Funcionários' FROM tbFunc

SELECT SUM(salario) AS 'Soma do Salário dos Funcionários' FROM tbFuncional

SELECT SUM(tempoEmpresa) AS 'Soma do Tempo de Empresa dos Funcionários' FROM tbFuncional

SELECT SUM(tempoCargo) AS 'Soma do Tempo de Salário dos Funcionários' FROM tbFuncional 



SELECT MAX(codFunc) AS 'Maior Código entre os Funcionários' FROM tbFunc

SELECT MIN(codFunc) AS 'Menor Código entre os Funcionários' FROM tbFunc

SELECT MAX(idadeFunc) AS 'Maior Idade entre os Funcionários' FROM tbFunc

SELECT MIN(idadeFunc) AS 'Menor Idade entre os Funcionários' FROM tbFunc

SELECT MAX(qtdFilhos) AS 'Maior Quantidade de Filhos entre os Funcionários' FROM tbFunc

SELECT MIN(qtdFilhos) AS 'Menor Quantidade de Filhos entre os Funcionários' FROM tbFunc

SELECT MAX(salario) AS 'Maior Salário entre os Funcionários' FROM tbFuncional

SELECT MIN(salario) AS 'Menor Salário entre os Funcionários' FROM tbFuncional

SELECT MAX(tempoEmpresa) AS 'Maior Tempo de Empresa entre os Funcionários' FROM tbFuncional

SELECT MIN(tempoEmpresa) AS 'Menor Tempo de Empresa entre os Funcionários' FROM tbFuncional

SELECT MAX(tempoCargo) AS 'Maior Tempo de Cargo entre os Funcionários' FROM tbFuncional

SELECT MIN(tempoCargo) AS 'Menor Tempo de Cargo entre os Funcionários' FROM tbFuncional



SELECT AVG(idadeFunc) AS 'Média da Idade dos Funcionários' FROM tbFunc

SELECT AVG(qtdFilhos) AS 'Média da Quantidade de Filhos dos Funcionários' FROM tbFunc

SELECT AVG(salario) AS 'Média dos Salários dos Funcionários' FROM tbFuncional

SELECT AVG(tempoEmpresa) AS 'Média do Tempo de Empresa dos Funcionários' FROM tbFuncional

SELECT AVG(tempoCargo) AS 'Média do Tempo de Cargo dos Funcionários' FROM tbFuncional



SELECT COUNT(salario) AS 'Quantidade de Funcionários que ganham mais de R$800' FROM tbFuncional WHERE salario > 800

SELECT COUNT(salario) AS 'Quantidade de Funcionários que ganham mais de R$1000' FROM tbFuncional WHERE salario > 1000

SELECT COUNT(salario) AS 'Quantidade de Funcionários que ganham menos de R$400' FROM tbFuncional WHERE salario < 400

SELECT COUNT(salario) AS 'Quantidade de Funcionários que ganham menos de R$2000' FROM tbFuncional WHERE salario < 2000

SELECT COUNT(salario) AS 'Quantidade de Funcionários que ganham mais de R$8000' FROM tbFuncional WHERE salario > 8000

SELECT COUNT(salario) AS 'Quantidade de Funcionários que ganham menos de R$1000' FROM tbFuncional WHERE salario < 1000
