<?php

namespace Controller;

use Model\ModelAlunos as Alunos;

class ControlLogin {

    private $objAlunos;
    public $json;

    public function __construct() {
        $this->objAlunos = new Alunos();

        $this->getDataForm();
        $this->showDataForm();
    }

    private function getDataForm() {
        $this->objAlunos->setEmail(!empty($_GET["email"]) ? $_GET["email"] : null);
        $this->objAlunos->setSenha(!empty($_GET["senha"]) ? $_GET["senha"] : null);

        return;
    }

    private function showDataForm() {

        if (!$this->objAlunos->selectOne()) {
            $this->json['id'] = false;
            return;
        }

        $this->json['id'] = $this->objAlunos->getId();
        $this->json['Nome'] = $this->objAlunos->getNome();

        return;
    }

}
