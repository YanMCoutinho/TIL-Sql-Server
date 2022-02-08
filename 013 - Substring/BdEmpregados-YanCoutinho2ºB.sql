CREATE DATABASE db0304Exercicio
GO

USE db0304Exercicio
GO

--SLIDE 10

CREATE TABLE tbFuncionario (
	idFunc INT PRIMARY KEY IDENTITY(1,1)
	,nomeFunc NVARCHAR(200) NOT NULL
	,cargoFunc NVARCHAR(200) NOT NULL
	,nascFunc VARCHAR(12) NOT NULL
	,presencaFunc INT NOT NULL
	,salarioBaseFunc MONEY NOT NULL
	,avaliacaoFunc REAL NOT NULL
);
GO

INSERT INTO tbFuncionario(nomeFunc, cargoFunc, nascFunc, presencaFunc, salarioBaseFunc, avaliacaoFunc)
VALUES ('João Maria de Jesus', 'Administrativo', '07/23/78', 80.2, 10600, 8.7)
,('Felipe dos Santos', 'Técnico', '11/02/88', 90, 18200, 5.6)
,('Maria José Silva', 'Técnico', '12/23/90', 87.3, 15000, 4.5)
,('José Silva', 'Admnistrativo', '12/23/78', 60, 16200, 9.3)
,('Mário Antunes', 'RH', '02/11/77', 54.2, 8000, 7.2)
,('Paulo Roberto Silva', 'RH', '10/13/76', 87.2333, 8900, 9.9)
,('Teresa Jardim', 'RH', '01/13/80', 100, 4000, 7.7)
,('Roberto Carlos Alves', 'RH', '12/10/83', 23.64, 4000, 7.7)
,('Paulo Jardim', 'RH', '06/28/45', 34.84, 30500, 10)
,('Maria Eduarda Carvalho da Rosa', 'Administrativo', '08/30/70', 90.78, 9000, 6.6)
,('Pedro Henrique Teixeira', 'Técnico', '12/23/78', 100, 7400, 7.2)
GO

SELECT nomeFunc AS 'Nome', CAST(presencaFunc AS VARCHAR) + '%' AS 'Taxa de Presença', 'R$ ' + CAST(salarioBaseFunc AS VARCHAR) AS 'Salário Base'
FROM tbFuncionario ORDER BY presencaFunc DESC 
GO

-- Slide 11

CREATE TABLE tbDepartamento (
	idDepartamento INT PRIMARY KEY IDENTITY(1,1)
	,nomeDepto NVARCHAR(100) NOT NULL
	,numDepto TINYINT NOT NULL
	,rgGerenteDepto VARCHAR(8) NOT NULL
);
GO

INSERT INTO tbDepartamento(nomeDepto, numDepto, rgGerenteDepto) VALUES
('Contabilidade', 1, '10101010')
,('Engenharia Civil', 2, '303030')
,('Engenharia Mecânica', 3, '20202020')
GO

CREATE TABLE tbEmpregado (
	idEmpregado INT PRIMARY KEY IDENTITY(1,1)
	,nomeEmpregado NVARCHAR(200) NOT NULL
	,rgEmpregado VARCHAR(8) NOT NULL
	,cicEmpregado VARCHAR(11) NOT NULL
	,deptoEmpregado VARCHAR(1) NOT NULL
	,rgSupervisor VARCHAR(8)
	,salarioEmpregado MONEY NOT NULL
);
GO

INSERT INTO tbEmpregado(nomeEmpregado,rgEmpregado,cicEmpregado,deptoEmpregado,rgSupervisor,salarioEmpregado) VALUES
('João Luis', '10101010', '11111111111', '1', NULL, 3000)
,('Fernando', '20202020', '22222222222', '2', '10101010', 2500)
,('Ricardo', '30303030', '33333333333', '2', '10101010', 2300)
,('Jorge', '40404040', '44444444444', '2', '20202020', 4200)
,('Renato', '50505050', '55555555555', '3', '20202020', 1300)
GO

SELECT nomeEmpregado AS 'Nome', rgEmpregado AS 'RG', 
SUBSTRING(cicEmpregado, 1, 3) + '.' + SUBSTRING(cicEmpregado, 4, 3) + '.' + SUBSTRING(cicEmpregado, 7, 3) + '-' + SUBSTRING(cicEmpregado, 10, 2) AS 'CPF'
FROM tbEmpregado ORDER BY cicEmpregado


