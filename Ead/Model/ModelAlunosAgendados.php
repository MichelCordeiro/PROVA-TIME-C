<?php

namespace Model;

class ModelAlunosAgendados {

    private $cnnObj;
    private $id;
    private $aluno;
    private $setor;
    private $data;
    private $hora;

    function __construct() {
        $this->cnnObj = \config\ConnectionDB::getConnection();
    }

    public function getId() {
        return $this->id;
    }

    public function getAluno() {
        return $this->aluno;
    }

    public function getSetor() {
        return $this->setor;
    }

    public function getData() {
        return $this->data;
    }

    public function getHora() {
        return $this->hora;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function setAluno($aluno) {
        $this->aluno = $aluno;
    }

    public function setSetor($setor) {
        $this->setor = $setor;
    }

    public function setData($data) {
        $this->data = $data;
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
            $this->setAluno($result["Aluno"]);
            $this->setSetor($result["Setor"]);
            $this->setHora($result["Hora"]);
            $this->setData($result["Data"]);
            return true;
        }
        return false;
    }

}
