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
            $this->json['status'] = false;
            return;
        }

        $this->json['status'] = true;

        $hora = $this->objAlunosAgendados->getHora();
        $descicao = $this->objAlunosAgendados->getDescricao();
        $setor = $this->objAlunosAgendados->getSetor();

        foreach ($hora as $key => $value) {
            $this->json['data'][$key]["hora"] = $value;
            $this->json['data'][$key]["descricao"] = $descicao[$key];
            $this->json['data'][$key]["setor"] = $setor[$key];
        }

        return;
    }

}
