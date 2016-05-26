<?php

require_once "../Config/config.php";
require_once "../Controller/ControlListaAgendamento.php";

$data = new \Controller\ControlListaAgendamento();

header("Content-type: application/json; charset=utf-8");
echo json_encode($data->json);

exit();
