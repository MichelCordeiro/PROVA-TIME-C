<?php

require_once "../Config/config.php";
require_once "../Controller/ControlLogin.php";

$data = new \Controller\ControlLogin();

header("Content-type: application/json; charset=utf-8");
echo json_encode($data->json);

exit();
