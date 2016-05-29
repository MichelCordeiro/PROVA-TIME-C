CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `horarios_disponiveis` AS
    SELECT 
        `sh`.`id` AS `id`,
        `s`.`id` AS `setor_id`,
        `s`.`nome` AS `setor`,
        `h`.`Hora` AS `hora`,
        `h`.`Status` AS `status`
    FROM
        ((`setores_horarios` `sh`
        LEFT JOIN `setores` `s` ON ((`s`.`id` = `sh`.`setores_id`)))
        LEFT JOIN `horarios` `h` ON ((`h`.`id` = `sh`.`horarios_id`)))
    WHERE
        (`h`.`Status` = 1)