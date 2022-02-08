SELECT MAX(numPaginas) AS 'Maior Número de Páginas' FROM tbLivro
	GO

SELECT MIN(numPaginas) AS 'Menor Número de Páginas' FROM tbLivro
	GO

SELECT AVG(numPaginas) AS 'Média de páginas dos livros' FROM tbLivro
	GO

SELECT SUM(numPaginas) AS 'Soma de todas as páginas dos livros que começam com código 1' FROM tbLivro WHERE codEditora = 1
	GO

SELECT SUM(numPaginas) AS 'Soma de todas as páginas dos livros que começam com a letra A' FROM tbLivro WHERE LOWER(nomeLivro) LIKE 'a%'
	GO

SELECT AVG(numPaginas) AS 'Média de páginas dos livros do autor de código 3' FROM tbLivro WHERE codAutor = 3
	GO

SELECT COUNT(numPaginas) AS 'Quantidade de livros da editora de código 4' FROM tbLivro WHERE codEditora = 4
	GO

SELECT AVG(numPaginas) AS 'Média das quantidade de páginas dos livros que contém "Estrela" em seu nome' FROM tbLivro WHERE LOWER(nomeLivro) LIKE '%estrela%'
	GO

SELECT COUNT(numPaginas) AS 'Quantidade de livros que contém "Poema" em seu nome' FROM tbLivro WHERE LOWER(nomeLivro) LIKE '%poema%'
	GO

SELECT COUNT(numPaginas) AS 'Quantidade de livros', nomeGenero AS 'Gênero' FROM tbLivro
	INNER JOIN tbGenero on tbLivro.codGenero = tbGenero.codGenero
		GROUP BY nomeGenero
			GO

SELECT SUM(numPaginas) AS 'Quantidade de páginas escritas', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		GROUP BY nomeAutor
			GO

SELECT AVG(numPaginas) AS 'Média de páginas escritas', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		GROUP BY nomeAutor
			ORDER BY nomeAutor ASC
				GO

SELECT COUNT(numPaginas) AS 'Quantidade de livros', nomeEditora AS 'Editora' FROM tbLivro
	INNER JOIN tbEditora on tbLivro.codEditora = tbEditora.codEditora
		GROUP BY nomeEditora
			ORDER BY nomeEditora DESC
				GO

SELECT SUM(numPaginas) AS 'Quantidade de páginas escritas', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		WHERE LOWER(nomeAutor) LIKE 'c%'
			GROUP BY nomeAutor
				GO

SELECT COUNT(numPaginas) AS 'Quantidade de páginas escritas', nomeAutor AS 'Autor' FROM tbLivro
	INNER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		WHERE LOWER(nomeAutor) LIKE 'machado de assis' or LOWER(nomeAutor) LIKE 'cora coralina' or LOWER(nomeAutor) LIKE 'clarice lispector'
			GROUP BY nomeAutor
				GO

SELECT SUM(numPaginas) AS 'Total de Páginas', nomeEditora AS 'Editora' FROM tbLivro
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
		WHERE LOWER(nomeAutor) NOT LIKE 'érico veríssimo'
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

SELECT 'Ática' AS 'Editora', nomeLivro AS 'Livro' FROM tbLivro
	INNER JOIN tbEditora on tbLivro.codEditora = tbEditora.codEditora
			GO

SELECT COUNT(nomeAutor) AS 'Quantidade de autores que não tem livros cadastrados' FROM tbLivro
	FULL OUTER JOIN tbAutor on tbLivro.codAutor = tbAutor.codAutor
		WHERE codLivro IS NULL
			GO

SELECT nomeGenero AS 'Gênero que não possui livro' FROM tbLivro
	FULL OUTER JOIN tbGenero on tbLivro.codGenero = tbGenero.codGenero
		WHERE codLivro IS NULL
			GO