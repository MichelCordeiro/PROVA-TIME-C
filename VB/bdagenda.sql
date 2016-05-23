-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Mai 23, 2016 as 03:49 PM
-- Versão do Servidor: 5.5.8
-- Versão do PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `bdagenda`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE IF NOT EXISTS `alunos` (
  `CPF` bigint(20) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Tel` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`CPF`, `Nome`, `Tel`, `Email`, `Senha`) VALUES
(12346, 'tatilonroberto', '988888534', 'tatat', NULL),
(1234567890, 'Wagner Magalhaes', '9898174201', 'Wagner@ceuma.edu.br', NULL),
(2147483647, 'Tatilon Roberto L de Souza', '32232540', 'tatilon@roberto', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `horarios`
--

CREATE TABLE IF NOT EXISTS `horarios` (
  `Data` date NOT NULL,
  `Hora` varchar(5) NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`Data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `horarios`
--

INSERT INTO `horarios` (`Data`, `Hora`, `Status`) VALUES
('0000-00-00', '', 0),
('2016-05-11', '', 0),
('2016-05-17', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbllogin`
--

CREATE TABLE IF NOT EXISTS `tbllogin` (
  `idusuario` int(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbllogin`
--

INSERT INTO `tbllogin` (`idusuario`, `usuario`, `senha`) VALUES
(1, 'admin', 'admin');
