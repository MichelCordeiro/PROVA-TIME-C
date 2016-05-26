<?php

namespace Model;

class ModelAlunos {

    private $cnnObj;
    private $id;
    private $Nome;
    private $Email;
    private $Senha;

    function __construct() {
        $this->cnnObj = \config\ConnectionDB::getConnection();
    }

    public function getId() {
        return $this->id;
    }

    public function getNome() {
        return $this->Nome;
    }

    public function getEmail() {
        return $this->Email;
    }

    public function getSenha() {
        return $this->Senha;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function setNome($Nome) {
        $this->Nome = $Nome;
    }

    public function setEmail($Email) {
        $this->Email = $Email;
    }

    public function setSenha($Senha) {
        $this->Senha = $Senha;
    }

    public function isArray() {
        return array(
            'id' => $this->getId(),
            'Nome' => $this->getNome(),
            'Email' => $this->getEmail(),
            'Senha' => $this->getSenha()
        );
    }

    public function selectOne() {

        if (!$this->getEmail() or ! $this->getSenha())
            return false;

        $email = $this->getEmail();
        $senha = $this->getSenha();

        $sql = "SELECT distinct id, Nome, Email FROM alunos where Email = '$email' and Senha = '$senha';";

        $this->cnnObj->setQuery($sql);
        $result = $this->cnnObj->execut_query("simplex");

        if ($result) {
            $this->setId($result["id"]);
            $this->setNome($result["Nome"]);

            return true;
        }
        return false;
    }

}
