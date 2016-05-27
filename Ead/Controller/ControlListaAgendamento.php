<?php

namespace Controller;

use Model\ModelAlunosAgendados as Agendamento;

/**
 * Description of ControlListaAgendamento
 *
 * @author Felipe
 */
class ControlListaAgendamento {

    private $objAlunosAgendados;

    public function __construct() {
        $this->objAlunosAgendados = new Agendamento();

        $this->getDataForm();
        $this->showDataForm();
    }

    private function getDataForm() {
        $this->objAlunosAgendados->setId(!empty($_GET["id"]) ? $_GET["id"] : null);

        return;
    }

    private function showDataForm() {

        if (!$this->objAlunosAgendados->selectOne()) {
            $this->json = null;
            return;
        }

        $aluno = $this->objAlunosAgendados->getAluno();
        $data = $this->objAlunosAgendados->getData();
        $hora = $this->objAlunosAgendados->getHora();
        $setor = $this->objAlunosAgendados->getSetor();

        foreach ($aluno as $key => $value) {
            $this->json[$key]["Aluno"] = $value;
            $this->json[$key]["Data"] = $data[$key];
            $this->json[$key]["Hora"] = $hora[$key];
            $this->json[$key]["Setor"] = $setor[$key];
        }

        return;
    }

}
