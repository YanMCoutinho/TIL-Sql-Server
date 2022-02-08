SELECT MAX(numPaginas) AS 'Maior N�mero de P�ginas' FROM tbLivro
	GO

SELECT MIN(numPaginas) AS 'Menor N�mero de P�ginas' FROM tbLivro
	GO

SELECT AVG(numPaginas) AS 'M�dia de p�ginas dos livros' FROM tbLivro
	GO

SELECT SUM(numPaginas) AS 'Soma de todas as p�ginas dos livros que come�am com c�digo 1' FROM tbLivro WHERE codEditora = 1
	GO

SELECT SUM(numPaginas) AS 'Soma de todas as p�ginas dos livros que come�am com a letra A' FROM tbLivro WHERE LOWER(nomeLivro) LIKE 'a%'
	GO

SELECT AVG(numPaginas) AS 'M�dia de p�ginas dos livros do autor de c�digo 3' FROM tbLivro WHERE codAutor = 3
	GO

SELECT COUNT(numPaginas) AS 'Quantidade de livros da editora de c�digo 4' FROM tbLivro WHERE codEditora = 4
	GO

SELECT AVG(numPaginas) AS 'M�dia das quantidade de p�ginas dos livros que cont�m "Estrela" em seu nome' FROM tbLivro WHERE LOWER(nomeLivro) LIKE '%estrela%'
	GO

SELECT COUNT(numPaginas) AS 'Quantidade de livros que cont�m "Poema" em seu nome' FROM tbLivro WHERE LOWER(nomeLivro) LIKE '%poema%'
	GO

SELECT COUNT(numPaginas) AS 'Quantidade de livros', nomeGenero AS 'G�nero' FROM tbLivro
	INNER JOIN tbGenero on tbLivro.codGenero = tbGenero.codGenero
		GROUP BY nomeGenero
			GO

SELECT SUM(numPaginas) AS 'Quantidade de p�ginas escritas', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		GROUP BY nomeAutor
			GO

SELECT AVG(numPaginas) AS 'M�dia de p�ginas escritas', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		GROUP BY nomeAutor
			ORDER BY nomeAutor ASC
				GO

SELECT COUNT(numPaginas) AS 'Quantidade de livros', nomeEditora AS 'Editora' FROM tbLivro
	INNER JOIN tbEditora on tbLivro.codEditora = tbEditora.codEditora
		GROUP BY nomeEditora
			ORDER BY nomeEditora DESC
				GO

SELECT SUM(numPaginas) AS 'Quantidade de p�ginas escritas', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		WHERE LOWER(nomeAutor) LIKE 'c%'
			GROUP BY nomeAutor
				GO

SELECT COUNT(numPaginas) AS 'Quantidade de p�ginas escritas', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		WHERE LOWER(nomeAutor) LIKE 'machado de assis' or LOWER(nomeAutor) LIKE 'cora coralina' or LOWER(nomeAutor) LIKE 'clarice lispector'
			GROUP BY nomeAutor
				GO

SELECT SUM(numPaginas) AS 'Total de P�ginas', nomeEditora AS 'Editora' FROM tbLivro
	INNER JOIN tbEditora on tbLivro.codEditora = tbEditora.codEditora
		WHERE numPaginas <= 500 AND numPaginas >= 200
			GROUP BY nomeEditora
				GO

SELECT nomeLivro AS 'Livro', nomeEditora AS 'Editora', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbEditora on tbLivro.codEditora = tbEditora.codEditora
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		GO

SELECT nomeLivro AS 'Livro', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		WHERE LOWER(nomeAutor) LIKE 'cia das letras'
			GO

SELECT nomeLivro AS 'Livro', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		WHERE LOWER(nomeAutor) NOT LIKE '�rico ver�ssimo'
			GO

SELECT nomeAutor AS 'Autor', nomeLivro AS 'Livro' FROM tbLivro
	RIGHT JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		GO

SELECT nomeAutor AS 'Autor', nomeLivro AS 'Livro' FROM tbLivro
	LEFT JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		GO

SELECT nomeAutor AS 'Autor', nomeLivro AS 'Livro' FROM tbLivro
	FULL OUTER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		GO

SELECT '�tica' AS 'Editora', nomeLivro AS 'Livro' FROM tbLivro
	INNER JOIN tbEditora on tbLivro.codEditora = tbEditora.codEditora
			GO

SELECT COUNT(nomeAutor) AS 'Quantidade de autores que n�o tem livros cadastrados' FROM tbLivro
	FULL OUTER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		WHERE codLivro IS NULL
			GO

SELECT nomeGenero AS 'G�nero que n�o possui livro' FROM tbLivro
	FULL OUTER JOIN tbGenero on tbLivro.codGenero = tbGenero.codGenero
		WHERE codLivro IS NULL
			GO