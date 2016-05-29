CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `alunos_agendados` AS
    SELECT 
        `a`.`id` AS `id`,
        `s`.`id` AS `setor_id`,
        `sh`.`id` AS `setores_horarios_id`,
        `a`.`Nome` AS `Aluno`,
        `s`.`nome` AS `Setor`,
        `ag`.`data` AS `Data`,
        `h`.`Hora` AS `Hora`
    FROM
        ((((`alunos` `a`
        LEFT JOIN `agendamento` `ag` ON ((`a`.`id` = `ag`.`alunos_id`)))
        LEFT JOIN `setores_horarios` `sh` ON ((`sh`.`id` = `ag`.`setores_horarios_id`)))
        LEFT JOIN `horarios` `h` ON ((`h`.`id` = `sh`.`horarios_id`)))
        LEFT JOIN `setores` `s` ON ((`s`.`id` = `sh`.`setores_id`)))
    WHERE
        (`ag`.`status` = 1)