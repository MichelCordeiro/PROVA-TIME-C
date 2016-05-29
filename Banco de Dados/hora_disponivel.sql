-- Entrada de dados: 
-- 		id do Setor e a data desejada para agendamento		exemplo: setor_id 2 and data: 2016-05-29
--  Saída
-- 		Horarios disponiveis para a data 2016-05-29
SELECT 
    *
FROM
    horarios_disponiveis hd
WHERE
    hd.setor_id = 2
        AND id NOT IN (SELECT 
            setores_horarios_id
        FROM
            alunos_agendados aa
        WHERE
            aa.setor_id = 2
                AND aa.Data = '2016-05-29')