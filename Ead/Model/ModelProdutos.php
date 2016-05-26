<?php

namespace Model;

class ModelProdutos {

    private $cnnObj;

    function __construct() {
        $this->cnnObj = \config\ConnectionDB::getConnection();
    }

}
