-- MySQL Script generated by MySQL Workbench
-- Mon May 23 16:57:37 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bdagenda
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdagenda
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdagenda` DEFAULT CHARACTER SET latin1 ;
USE `bdagenda` ;

-- -----------------------------------------------------
-- Table `bdagenda`.`tbllogin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdagenda`.`tbllogin` (
  `id` INT(100) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  `created` DATETIME NOT NULL,
  `updated` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdagenda`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdagenda`.`alunos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login_id` INT(100) NOT NULL,
  `CPF` BIGINT(20) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Tel` VARCHAR(15) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Senha` VARCHAR(10) NULL DEFAULT NULL,
  `created` DATETIME NOT NULL,
  `updated` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_alunos_tbllogin_idx` (`login_id` ASC),
  CONSTRAINT `fk_alunos_tbllogin`
    FOREIGN KEY (`login_id`)
    REFERENCES `bdagenda`.`tbllogin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdagenda`.`horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdagenda`.`horarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Status` INT(11) NOT NULL,
  `created` DATETIME NOT NULL,
  `updated` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdagenda`.`agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdagenda`.`agendamento` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `alunos_id` INT(11) NOT NULL,
  `horarios_id` INT(11) NOT NULL,
  `status` TINYINT(4) NOT NULL DEFAULT '1',
  `created` DATETIME NOT NULL,
  `updated` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agendamento_alunos1_idx` (`alunos_id` ASC),
  INDEX `fk_agendamento_horarios1_idx` (`horarios_id` ASC),
  CONSTRAINT `fk_agendamento_alunos1`
    FOREIGN KEY (`alunos_id`)
    REFERENCES `bdagenda`.`alunos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_horarios1`
    FOREIGN KEY (`horarios_id`)
    REFERENCES `bdagenda`.`horarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bdagenda`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdagenda`.`produtos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NULL DEFAULT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `url_video` VARCHAR(45) NULL DEFAULT NULL,
  `created` DATETIME NOT NULL,
  `updated` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `bdagenda` ;

-- -----------------------------------------------------
-- Placeholder table for view `bdagenda`.`alunos_agendados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdagenda`.`alunos_agendados` (`id` INT, `CPF` INT, `Nome` INT, `Tel` INT, `Senha` INT, `email` INT, `Data` INT, `Hora` INT);

-- -----------------------------------------------------
-- View `bdagenda`.`alunos_agendados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdagenda`.`alunos_agendados`;
USE `bdagenda`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bdagenda`.`alunos_agendados` AS select `a`.`id` AS `id`,`a`.`CPF` AS `CPF`,`a`.`Nome` AS `Nome`,`a`.`Tel` AS `Tel`,`a`.`Senha` AS `Senha`,`a`.`Email` AS `email`,`h`.`Data` AS `Data`,`h`.`Hora` AS `Hora` from ((`bdagenda`.`alunos` `a` left join `bdagenda`.`agendamento` `ag` on((`a`.`id` = `ag`.`alunos_id`))) left join `bdagenda`.`horarios` `h` on((`h`.`id` = `ag`.`horarios_id`))) where (`h`.`Status` = 1);
USE `bdagenda`;

DELIMITER $$
USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`tbllogin_BEFORE_INSERT`
BEFORE INSERT ON `bdagenda`.`tbllogin`
FOR EACH ROW
BEGIN
set new.created = now();
    set new.updated = new.created;
END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`tbllogin_BEFORE_UPDATE`
BEFORE UPDATE ON `bdagenda`.`tbllogin`
FOR EACH ROW
BEGIN
	set new.updated = now();

END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`alunos_BEFORE_INSERT`
BEFORE INSERT ON `bdagenda`.`alunos`
FOR EACH ROW
BEGIN
set new.created = now();
    set new.updated = new.created;
END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`alunos_BEFORE_UPDATE`
BEFORE UPDATE ON `bdagenda`.`alunos`
FOR EACH ROW
BEGIN
	set new.updated = now();

END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`horarios_BEFORE_INSERT`
BEFORE INSERT ON `bdagenda`.`horarios`
FOR EACH ROW
BEGIN
set new.created = now();
    set new.updated = new.created;
END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`horarios_BEFORE_UPDATE`
BEFORE UPDATE ON `bdagenda`.`horarios`
FOR EACH ROW
BEGIN
	set new.updated = now();

END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`agendamento_BEFORE_INSERT`
BEFORE INSERT ON `bdagenda`.`agendamento`
FOR EACH ROW
BEGIN
set new.created = now();
    set new.updated = new.created;
END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`agendamento_BEFORE_UPDATE`
BEFORE UPDATE ON `bdagenda`.`agendamento`
FOR EACH ROW
BEGIN
	set new.updated = now();
END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`produtos_BEFORE_INSERT`
BEFORE INSERT ON `bdagenda`.`produtos`
FOR EACH ROW
BEGIN
set new.created = now();
    set new.updated = new.created;
END$$

USE `bdagenda`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `bdagenda`.`produtos_BEFORE_UPDATE`
BEFORE UPDATE ON `bdagenda`.`produtos`
FOR EACH ROW
BEGIN
	set new.updated = now();

END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;