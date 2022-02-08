CREATE DATABASE dbGroupOrderBy
	GO

USE dbGroupOrderBy
	GO

--Import the data

SELECT ufPessoa AS 'Unidades Federativas', COUNT(idPessoa) AS 'Quantidade de Registros' FROM tbPessoa GROUP BY ufPessoa
	GO

SELECT ufPessoa AS 'Unidades Federativas', SUM(idadePessoa) AS 'Soma das Idades' FROM tbPessoa 
	GROUP BY ufPessoa
		GO

SELECT ufPessoa AS 'Unidades Federativas', AVG(idadePessoa) AS 'Média das Idades' FROM tbPessoa 
	GROUP BY ufPessoa 
		ORDER BY ufPessoa DESC
			GO

SELECT ufPessoa AS 'Unidades Federativas', MIN(idadePessoa) AS 'Menor Idade', MAX(idadePessoa) AS 'Maior Idade'
	FROM tbPessoa 
		GROUP BY ufPessoa 
			ORDER BY ufPessoa ASC
				GO

SELECT sexoPessoa AS 'Sexo', COUNT(sexoPessoa) AS 'Quantidade de cadastros deste sexo', ufPessoa AS 'Unidades Federativas'
	FROM tbPessoa 
		GROUP BY ufPessoa, sexoPessoa
			ORDER BY COUNT(sexoPessoa) DESC
				GO

