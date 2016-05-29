-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: bdagenda
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agendamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alunos_id` int(11) NOT NULL,
  `setores_horarios_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agendamento_alunos1_idx` (`alunos_id`),
  KEY `fk_agendamento_setores_horarios1_idx` (`setores_horarios_id`),
  CONSTRAINT `fk_agendamento_alunos1` FOREIGN KEY (`alunos_id`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_setores_horarios1` FOREIGN KEY (`setores_horarios_id`) REFERENCES `setores_horarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,1,2,'2016-05-27',1,'2016-05-26 19:57:27','2016-05-26 19:57:27'),(2,1,4,'2016-05-24',1,'2016-05-26 19:57:27','2016-05-26 19:57:27'),(3,1,3,'2016-05-27',1,'2016-05-26 20:22:27','2016-05-26 20:22:27'),(4,1,2,'2016-05-27',1,'2016-05-27 11:45:05','2016-05-27 20:09:59'),(5,1,2,'2016-05-28',1,'2016-05-28 12:58:05','2016-05-28 12:58:05'),(6,1,4,'2016-05-29',1,'2016-05-28 14:50:07','2016-05-28 14:50:07'),(7,1,6,'2016-05-29',1,'2016-05-28 14:50:07','2016-05-28 14:50:07'),(8,1,2,'2016-05-29',1,'2016-05-28 18:01:43','2016-05-28 18:01:43'),(9,1,4,'2016-05-11',1,'2016-05-28 18:58:06','2016-05-28 18:58:06'),(10,1,6,'2016-05-11',1,'2016-05-28 18:58:25','2016-05-28 18:58:25'),(11,1,7,'2016-05-30',1,'2016-05-28 19:31:17','2016-05-28 19:31:17'),(12,3,3,'2016-05-17',1,'2016-05-28 19:31:53','2016-05-28 19:31:53'),(13,3,7,'2016-05-18',1,'2016-05-28 19:32:24','2016-05-28 19:32:24'),(14,1,7,'2016-05-26',1,'2016-05-28 19:35:30','2016-05-28 19:35:30'),(15,1,3,'2016-05-24',1,'2016-05-28 19:47:36','2016-05-28 19:47:36'),(16,1,3,'2016-05-31',1,'2016-05-28 19:49:12','2016-05-28 19:49:12'),(17,1,7,'2016-05-27',1,'2016-05-28 20:29:15','2016-05-28 20:29:15'),(18,1,6,'2016-05-25',1,'2016-05-28 20:42:48','2016-05-28 20:42:48'),(19,1,7,'2016-05-13',1,'2016-05-28 20:44:10','2016-05-28 20:44:10'),(20,1,6,'2016-05-13',1,'2016-05-28 20:45:04','2016-05-28 20:45:04'),(21,1,3,'2016-05-11',1,'2016-05-28 20:45:37','2016-05-28 20:45:37'),(22,1,7,'2016-05-17',1,'2016-05-28 20:49:53','2016-05-28 20:49:53'),(23,1,3,'2016-05-04',1,'2016-05-28 20:56:05','2016-05-28 20:56:05'),(24,1,3,'2016-05-18',1,'2016-05-28 20:57:00','2016-05-28 20:57:00'),(25,1,3,'2016-05-19',1,'2016-05-28 20:57:07','2016-05-28 20:57:07'),(26,1,7,'2016-05-14',1,'2016-05-28 20:57:22','2016-05-28 20:57:22'),(27,1,7,'2016-05-06',1,'2016-05-28 20:58:53','2016-05-28 20:58:53'),(28,1,6,'2016-05-06',1,'2016-05-28 20:58:56','2016-05-28 20:58:56'),(29,1,5,'2016-05-16',1,'2016-05-29 12:28:02','2016-05-29 12:28:02'),(30,1,7,'2016-05-10',1,'2016-05-29 15:27:00','2016-05-29 15:27:00'),(31,1,7,'2016-05-05',1,'2016-05-29 15:57:33','2016-05-29 15:57:33');
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(100) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Tel` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(10) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alunos_tbllogin_idx` (`login_id`),
  CONSTRAINT `fk_alunos_tbllogin` FOREIGN KEY (`login_id`) REFERENCES `tbllogin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,1,'1234567','Valeria Silva','1234567','val@gmail','123','2016-05-26 19:54:30','2016-05-26 19:54:30'),(3,2,'3454354','joao','123123','asd@asd','123','2016-05-28 19:30:27','2016-05-28 19:30:27');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `alunos_agendados`
--

DROP TABLE IF EXISTS `alunos_agendados`;
/*!50001 DROP VIEW IF EXISTS `alunos_agendados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `alunos_agendados` AS SELECT 
 1 AS `id`,
 1 AS `setor_id`,
 1 AS `setores_horarios_id`,
 1 AS `Aluno`,
 1 AS `Setor`,
 1 AS `Data`,
 1 AS `Hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Hora` time NOT NULL,
  `Status` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,'12:30:00',1,'2016-05-26 19:13:45','2016-05-26 19:13:45'),(2,'08:30:00',1,'2016-05-26 19:18:19','2016-05-26 19:18:32'),(3,'14:30:00',1,'2016-05-26 19:18:53','2016-05-26 19:18:53'),(4,'19:30:00',1,'2016-05-26 19:19:42','2016-05-27 20:28:55'),(5,'10:00:00',1,'2016-05-28 13:03:47','2016-05-28 13:03:47');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `horarios_disponiveis`
--

DROP TABLE IF EXISTS `horarios_disponiveis`;
/*!50001 DROP VIEW IF EXISTS `horarios_disponiveis`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `horarios_disponiveis` AS SELECT 
 1 AS `id`,
 1 AS `setor_id`,
 1 AS `setor`,
 1 AS `hora`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `descricao` text,
  `url_video` varchar(45) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setores`
--

DROP TABLE IF EXISTS `setores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setores`
--

LOCK TABLES `setores` WRITE;
/*!40000 ALTER TABLE `setores` DISABLE KEYS */;
INSERT INTO `setores` VALUES (1,'Financeiro','2016-05-26 19:55:13','2016-05-27 20:59:53'),(2,'Acadêmico','2016-05-26 19:55:13','2016-05-27 20:59:53'),(3,'Administrativo','2016-05-26 19:55:13','2016-05-27 20:59:53'),(4,'Jurídico','2016-05-26 19:55:13','2016-05-27 20:59:53'),(5,'Docente','2016-05-28 15:50:34','2016-05-28 15:50:34');
/*!40000 ALTER TABLE `setores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setores_horarios`
--

DROP TABLE IF EXISTS `setores_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setores_horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horarios_id` int(11) NOT NULL,
  `setores_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_setores_horarios_horarios1_idx` (`horarios_id`),
  KEY `fk_setores_horarios_setores1_idx` (`setores_id`),
  CONSTRAINT `fk_setores_horarios_horarios1` FOREIGN KEY (`horarios_id`) REFERENCES `horarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_setores_horarios_setores1` FOREIGN KEY (`setores_id`) REFERENCES `setores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setores_horarios`
--

LOCK TABLES `setores_horarios` WRITE;
/*!40000 ALTER TABLE `setores_horarios` DISABLE KEYS */;
INSERT INTO `setores_horarios` VALUES (1,1,2,'2016-05-26 19:56:19','2016-05-26 19:56:19'),(2,3,4,'2016-05-26 19:56:19','2016-05-26 19:56:19'),(3,2,1,'2016-05-26 19:56:19','2016-05-26 19:56:19'),(4,4,3,'2016-05-26 19:56:19','2016-05-26 19:56:19'),(5,5,2,'2016-05-28 13:04:09','2016-05-28 13:04:09'),(6,3,3,'2016-05-28 14:46:06','2016-05-28 14:46:06'),(7,2,3,'2016-05-28 14:46:15','2016-05-28 14:46:15');
/*!40000 ALTER TABLE `setores_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllogin`
--

DROP TABLE IF EXISTS `tbllogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllogin` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllogin`
--

LOCK TABLES `tbllogin` WRITE;
/*!40000 ALTER TABLE `tbllogin` DISABLE KEYS */;
INSERT INTO `tbllogin` VALUES (1,'valeria','12345','2016-05-26 19:53:01','2016-05-26 19:53:01'),(2,'joao','123','2016-05-28 19:30:10','2016-05-28 19:30:10');
/*!40000 ALTER TABLE `tbllogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `alunos_agendados`
--

/*!50001 DROP VIEW IF EXISTS `alunos_agendados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alunos_agendados` AS select `a`.`id` AS `id`,`s`.`id` AS `setor_id`,`sh`.`id` AS `setores_horarios_id`,`a`.`Nome` AS `Aluno`,`s`.`nome` AS `Setor`,`ag`.`data` AS `Data`,`h`.`Hora` AS `Hora` from ((((`alunos` `a` left join `agendamento` `ag` on((`a`.`id` = `ag`.`alunos_id`))) left join `setores_horarios` `sh` on((`sh`.`id` = `ag`.`setores_horarios_id`))) left join `horarios` `h` on((`h`.`id` = `sh`.`horarios_id`))) left join `setores` `s` on((`s`.`id` = `sh`.`setores_id`))) where (`ag`.`status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `horarios_disponiveis`
--

/*!50001 DROP VIEW IF EXISTS `horarios_disponiveis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `horarios_disponiveis` AS select `sh`.`id` AS `id`,`s`.`id` AS `setor_id`,`s`.`nome` AS `setor`,`h`.`Hora` AS `hora`,`h`.`Status` AS `status` from ((`setores_horarios` `sh` left join `setores` `s` on((`s`.`id` = `sh`.`setores_id`))) left join `horarios` `h` on((`h`.`id` = `sh`.`horarios_id`))) where (`h`.`Status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-29 19:13:50
