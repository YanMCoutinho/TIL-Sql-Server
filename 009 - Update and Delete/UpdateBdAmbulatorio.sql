USE bdAmbulatorio

DELETE FROM tbPaciente
WHERE idPaciente = 105

SELECT * FROM tbPaciente


DELETE FROM tbConsulta
WHERE idConsulta = 4

SELECT * FROM tbConsulta


DELETE FROM tbDoencas
WHERE idDoencas = 3

SELECT * FROM tbDoencas


UPDATE tbEspecialidade
SET descricaoEspecialidade = 'Ortopedista' 
WHERE idEspecialidade = 20

SELECT * FROM tbEspecialidade


UPDATE tbMedico
SET nomeMedico = 'Dr. Carlos Jobim Silva' 
WHERE nomeMedico = 'Dr. Carlos Jobim'

SELECT * FROM tbMedico


UPDATE tbMedico
SET nomeMedico = 'Dra. Joana Souza Silva' 
WHERE idMedico = 203

SELECT * FROM tbMedico


UPDATE tbAmbulatorio 
SET andarAmbulatorio = 10 
WHERE andarAmbulatorio = 1

SELECT * FROM tbAmbulatorio

