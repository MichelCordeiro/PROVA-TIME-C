<?php

namespace Model;

class ModelAlunosAgendados {

    private $cnnObj;
    private $id;
    private $hora;

    function __construct() {
        $this->cnnObj = \config\ConnectionDB::getConnection();
    }

    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function getHora() {
        return $this->hora;
    }

    public function setHora($hora) {
        $this->hora = $hora;
    }

    public function selectOne() {

        $sql = "SELECT distinct id, Nome, Email FROM alunos where Email = '$email' and Senha = '$senha';";

        $this->cnnObj->setQuery($sql);
        $result = $this->cnnObj->execut_query("simplex");

        if ($result) {
            $this->setHora($result["Nome"]);
            return true;
        }
        return false;
    }

}
