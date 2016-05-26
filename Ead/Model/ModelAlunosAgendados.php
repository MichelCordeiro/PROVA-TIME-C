<?php

namespace Model;

class ModelAlunosAgendados {

    private $cnnObj;
    private $id;
    private $setor;
    private $descricao;
    private $hora;

    function __construct() {
        $this->cnnObj = \config\ConnectionDB::getConnection();
    }

    public function getId() {
        return $this->id;
    }

    public function getSetor() {
        return $this->setor;
    }

    public function getDescricao() {
        return $this->descricao;
    }

    public function getHora() {
        return $this->hora;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function setSetor($setor) {
        $this->setor = $setor;
    }

    public function setDescricao($descricao) {
        $this->descricao = $descricao;
    }

    public function setHora($hora) {
        $this->hora = $hora;
    }

    public function selectOne() {

        $id = $this->getId();

        if (!$id)
            return false;

        $sql = "SELECT * FROM bdagenda.alunos_agendados where id = $id;";

        $this->cnnObj->setQuery($sql);
        $result = $this->cnnObj->execut_query();

        if ($result) {

            $this->setDescricao($result["descricao"]);
            $this->setSetor($result["setor"]);
            $this->setHora($result["Hora"]);

            return true;
        }
        return false;
    }

}
