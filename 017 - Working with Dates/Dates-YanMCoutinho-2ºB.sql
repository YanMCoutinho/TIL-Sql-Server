CREATE DATABASE dbDates0429
GO

USE dbDates0429
GO

SELECT DATEDIFF(DAY, '03/04/2020', '05/06/2020') AS 'Dias de atraso da fatura'

SELECT DATEDIFF(YEAR, '14/07/1981', GETDATE()) AS 'Idade do Cliente'

SELECT CONVERT(VARCHAR,DATEADD(DAY, 30, '04/04/2021'), 103) AS 'Data de Vencimento da Fatura'

SELECT CONVERT(VARCHAR,DATEADD(DAY, 90, '28/04/2021'), 103) AS 'Próxima dose da vacina de Covid AstraZeneca'

SELECT CONVERT(VARCHAR,DATEADD(MONTH, 72, '28/04/2021'), 103) AS 'Data da ultima prestação do veículo'

SELECT CONVERT(VARCHAR,DATEADD(YEAR, 75, '09/02/1986'), 103) AS 'Possível data que o cometa Halley passará novamente pela terra'

SELECT DATEDIFF(DAY, '10/10/2004', GETDATE()) AS 'Dias,', DATEDIFF(MONTH, '10/10/2004', GETDATE()) AS 'Meses e'
, DATEDIFF(YEAR, '10/10/2004', GETDATE()) AS 'Anos que estou vivo'
GO