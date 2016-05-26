<?php

namespace Config;

// INICIA A VARIÁVEL DE SESSÃO DOS SISTEMA
// ----------------------------------------------------------------------------------------
session_start();

// Configuração do Banco de Dados
// ----------------------------------------------------------------------------------------
define("ENDERECO_BANCO", "localhost"); // Endereço do banco de dados
define("USUARIO", "root"); // Nome do usuário
define("SENHA", "7410"); // Senha de acesso ao banco de dados
define("NOME_BANCO", "bdagenda"); // Endereço do banco de dados
define("SGDB", "mysql");

require_once 'ConnectionDB.php';
require_once '../Model/ModelAlunos.php';
require_once '../Model/ModelAlunosAgendados.php';
require_once '../Model/ModelProdutos.php';
