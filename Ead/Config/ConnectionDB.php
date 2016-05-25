<?php

namespace config;

/**
 * Classe de conexão com o banco de dados.
 * Atributos:
 *
 * Gera a query de INSERT
 * Gera a query de UPDATE
 * Gara a query de DELETE
 * Gera a query de SELECT, com criação da condição da query
 * Registra o log de todas as querys executadas
 * junto com o nome do usuário logado no sistema.
 */
class ConnectionDB {

    private static $instance;
    private $endereco = ENDERECO_BANCO; // Endereço do banco de dados
    private $user = USUARIO; // Nome do usuário
    private $senha = SENHA; // Senha de acesso
    private $banco = NOME_BANCO; // Nome do banco de dados
    private $sgdb = SGDB; // Tipo de SGDB ha ser usado para a conexão.
    private $query; // Query para ser executado.
    public $conn; // Variável de conexão ao banco

    private function __construct() {
        $this->connection(); // Inicia a Conexão
    }

    public static function getConnection() {
        if (!isset(self::$instance)) {
            self::$instance = new self ();
        }
        return self::$instance;
    }

    function connection() {

        // Se já existir a conexão, retorna verdadeiro
        if (isset($this->conn) && is_object($this->conn)) {
            $this->conn->set_charset('utf8');
            return true;
        }

        if ($this->sgdb == "mysql" || $this->sgdb == "") {

            $this->conexao_mysql();
        }

        if ($this->sgdb == "postgres") {

            $this->conexao_pg();
        }
    }

    private function conexao_mysql() {

        // Faz a conexão bom Banco de Dados
        $this->conn = new \mysqli($this->endereco, $this->user, $this->senha, $this->banco);

        // Verifica se foi realiza a conexão com o banco de dados
        if ($this->conn->connect_errno) {
            die("ERRO: Não foi possível realizar a conexão ao banco de dados!");
        }
    }

    private function close_connection() {
        if ($this->sgdb == "mysql" || $this->sgdb == "") {
            $this->conn->close();
        }

        if ($this->sgdb == "postgres") {

            pg_close($this->conn);
        }

        return;
    }

    public function getIdConection() {
        $this->connection(); // Recheca a conexão

        return $this->conn;
    }

    public function setQuery($query) {
        $this->query = $query;
    }

    public function execut_query($type_query = null, $log = false) {
        $this->connection();

        if ($this->sgdb == "mysql") {
            return $this->execut_query_mysql($type_query, $log);
        }

        return;
    }

    private function execut_query_mysql($type_query = null, $log = false) {
        $result = $this->conn->query($this->query);

        if (empty($type_query) && $result && $result->num_rows > 0) {
            return $this->resultQuery($result);
        }

        if ($type_query == "simplex" && $result->num_rows > 0) {
            return $result->fetch_assoc();
        }

        if ($type_query == "insert" && $result) {

            // Em caso de êxito a query é registrada.
            if (is_numeric($this->conn->insert_id)) {
                $this->salvaLog($this->conn->insert_id); // Sempre salva o INSERT em caso de sucesso
            }

            return $this->conn->insert_id;
        }

        if ($type_query == "update" && $result) {


            return true;
        }

        if ($type_query == "delete" && $result) {

            $this->queryLog = $this->query;

            return true;
        }

        // Se o tipo resource, retorna o $result
        if ($type_query == "resource" && $result) {
            return $result;
        }

        return false;
    }

    public function select_columns($table_name) {
        $this->connection();

        $sql = "SHOW COLUMNS FROM $table_name ";

        $result = mysql_query($sql, $this->conn);

        if ($result) {

            $flag = 0;

            if (mysql_num_rows($result) > 0) {

                while ($row = mysql_fetch_assoc($result)) {

                    if ($row ['Key'] != 'PRI' and $flag == 0) {

                        $flag = 1;
                    }

                    $columns [$flag] = $row ['Field'];

                    $flag ++;
                }
            }
        }

        $this->close_connection();

        return $columns;
    }

    public function generation_string_condition($data_form, $name_table) {
        $columns = $this->select_columns($name_table);

        if (!empty($data_form)) {

            foreach ($data_form as $chave => $valor) {

                /**
                 * Verifica se o nome da coluna existe.
                 */
                $key = array_search($chave, $columns);

                if (!empty($key)) {

                    if (!empty($valor) or $valor === 0) {

                        /**
                         * Retorna a informação da coluna selectada.
                         */
                        $infoColuna = $this->infor_column_table($name_table, $chave);

                        /**
                         * Gera a string de condição.
                         */
                        $this->string_condition($name_table, $infoColuna, $chave, $valor);
                    }
                }
            }

            $this->string_data();

            /**
             * Cancela todo o processo de geração da STRING de SELECT.
             */
            if (empty($this->stringCondicao)) {
                return false;
            }

            /**
             * Pega a quantidade de colunas.
             */
            $totalColunas = sizeof($this->stringCondicao);

            /**
             * Retira a "," do final do array.
             */
            $newStringSelect = array_slice($this->stringCondicao, 0, $totalColunas - 1);

            $stringSql = null;

            /**
             * Transforma o array em uma string ex:
             * update tabela set coluna01 = 'valor01' , coluna02 = 'valor02'
             */
            for ($i = 0; $i < sizeof($newStringSelect); $i ++) {

                // Contruir a string das colunas
                $stringSql .= $newStringSelect [$i];
            }
        } else {

            return false;
        }

        // IM_CONDIÇÃO#

        return $stringSql;
    }

    public function infor_column_table($name_table, $colunas = '*') {
        $this->connection();

        $result = mysql_query('SELECT ' . $colunas . ' FROM ' . $name_table, $this->conn);

        $i = 0;
        while ($i < mysql_num_fields($result)) {

            $meta = mysql_fetch_field($result, $i);

            if (!$meta) {

                return false;
            }

            $i ++;
        }

        $this->close_connection();

        return $meta;
    }

    private function string_condition($name_table, $infoColuna, $chave, $valor) {
        $valor = addslashes($valor);

        if ($infoColuna->type == "string") {

            // Gera as linhas da coluna
            $this->stringCondicao [] = $name_table . "." . $chave . " LIKE '%" . $valor . "%'";
            $this->stringCondicao [] = " AND ";
            return;
        }

        if ($infoColuna->type == "blob") {

            // Gera as linhas da coluna
            $this->stringCondicao [] = $name_table . "." . $chave . " LIKE '%" . $valor . "%'";
            $this->stringCondicao [] = " AND ";
            return;
        }

        if ($infoColuna->type == "year" || $infoColuna->type == "datetime") {

            $this->stringCondicaoDataColuna [] = $name_table . "." . $chave;
            $this->stringCondicaoDataValor [] = $valor;

            return;
        } else {

            $this->stringCondicao [] = $name_table . "." . $chave . " = '" . $valor . "'";
            $this->stringCondicao [] = " AND ";

            return;
        }

        return;
    }

    private function string_data() {
        if (!empty($this->stringCondicaoDataColuna) and ! empty($this->stringCondicaoDataValor)) {

            /**
             * Inseri a configuração da data.
             */
            $this->stringCondicao [] = $this->stringCondicaoDataColuna [0] . " BETWEEN ('" . $this->stringCondicaoDataValor [0] . "') and ('" . $this->stringCondicaoDataValor [1] . "')";
            $this->stringCondicao [] = " AND ";
            $this->stringCondicao [] = $this->stringCondicaoDataColuna [1] . " BETWEEN ('" . $this->stringCondicaoDataValor [0] . "') and ('" . $this->stringCondicaoDataValor [1] . "')";
            $this->stringCondicao [] = " AND ";
        }

        return;
    }

    private function resultQuery($result) {
        $list = null;
        $i = 0;

        if ($this->sgdb == "mysql" || $this->sgdb == "") {

            while ($dados = $result->fetch_assoc()) {

                foreach ($dados as $key => $value) {

                    if ($value !== '' and $value != null) {
                        $list [$key] [$i] = $value;
                    }
                }
                $i ++;
            }
        }

        if ($this->sgdb == "postgres") {

            while ($dados = pg_fetch_assoc($result)) {

                foreach ($dados as $key => $value) {

                    if (!empty($value)) {

                        $list [$key] [$i] = $value;
                    }
                }

                $i ++;
            }
        }

        return $list;
    }

    public function insert($request, $table_name, $chavePrimaria, $caseSensitive = null) {
        $this->caseSensitive = $caseSensitive;

        if ($this->sgdb == "mysql" || $this->sgdb == "") {

            $this->setQuery($this->generatorQueryinsert($request, $table_name, $chavePrimaria));
            return $this->execut_query("insert");
        }

        if ($this->sgdb == "postgres") {

            $this->insert_pg();
        }
    }

    private function insert_pg($request, $table_name) {
        return pg_copy_from($this->conn, $table_name, $request);
    }

    public function update($request, $table_name, $chavePrimaria = null, $condicao = null, $caseSensitive = false) {
        $this->caseSensitive = $caseSensitive;

        if ($this->sgdb == "mysql" || $this->sgdb == "") {

            $this->setQuery($this->generatorQueryUpdate($request, $table_name, $chavePrimaria));

            return $this->execut_query("update");
        }

        if ($this->sgdb == "postgres") {

            return $this->update_pg($request, $table_name, $condicao);
        }
    }

    private function update_pg($request, $table_name, $condicao) {
        return pg_update($this->conn, $table_name, $request, $condicao);
    }

    private function generatorQueryinsert($request, $table_name, $chavePrimaria) {
        $i = 0;

        // recebe os dados do fomulário//-----------------------
        foreach ($request as $key => $value) {

            /**
             * Verifica se o valor esta nulo, caso esteja, não é incluído na string de insert.
             */
            if (!empty($key) and ! empty($value)) {

                if ($chavePrimaria != $key) {

                    $string_columns [$i] = $key;
                    $string_value [$i] = "'" . @addslashes($value) . "'";
                }
            }

            $i ++;
        }

        /**
         * Pega todos os elementos do array e inseri em uma string.
         */
        $string_columns = implode(',', $string_columns);

        /**
         * Values string query.
         */
        $string_value = implode(',', $string_value);

        if (empty($this->caseSensitive)) {

            $string_value = strtoupper($string_value);

            $buscar = array(
                "ç",
                "á",
                "ó",
                "é",
                "ã",
                "õ",
                "ẽ",
                "â",
                "ô"
            );
            $subs = array(
                "Ç",
                "Á",
                "Ó",
                "É",
                "Ã",
                "Õ",
                "Ẽ",
                "Â",
                "Ô"
            );

            $string_value = str_replace($buscar, $subs, $string_value);
        }

        /**
         * String sql full.
         */
        $query = "INSERT INTO " . $table_name . " (" . $string_columns . ") VALUES (" . $string_value . ")";

        $this->queryLog = "INSERT INTO $table_name ( $chavePrimaria, $string_columns) VALUES ([ID],$string_value) ";

        return $query;
    }

    public function generatorQueryUpdate($request, $table_name, $chavePrimaria) {
        $string_update = array();
        $condition = null;
        $i = 0;

        foreach ($request as $key => $value) {

            // Define o campo que vai ser utilizado como condição para o update
            if ($chavePrimaria == $key and ! empty($key) and ( $value !== '') and ( $value !== null)) {

                $value = addslashes($value);

                if (empty($this->caseSensitive)) {
                    $value = strtoupper($value);
                }

                $condition = $key . " = '" . $value . "'";
            } else {

                if (($value !== '') and ( $value !== null)) {
                    $value = addslashes($value);

                    if (empty($this->caseSensitive)) {
                        $value = strtoupper($value);
                    }
                    $string_update [$i] = $key . " = '" . $value . "'";
                }
            }

            $i ++;
        }

        if (empty($this->caseSensitive)) {

            $buscar = array(
                "ç",
                "á",
                "ó",
                "é",
                "ã",
                "õ",
                "ẽ",
                "â",
                "ô"
            );
            $subs = array(
                "Ç",
                "Á",
                "Ó",
                "É",
                "Ã",
                "Õ",
                "Ẽ",
                "Â",
                "Ô"
            );

            $string_update = str_replace($buscar, $subs, $string_update);
        }

        /**
         * Pega todos os elementos do array e inseri em uma string.
         */
        $string_update = implode(',', $string_update);

        if (empty($condition)) {
            return null;
        }

        // Concatena toda a string
        $sql = "UPDATE " . $table_name . " SET " . $string_update . " WHERE " . $condition;

        $this->queryLog = "UPDATE " . $table_name . " SET " . $string_update . " WHERE " . $condition;

        return $sql;
    }

    public function geraSelect($dados, $nomeTabela) {
        if (empty($dados)) {
            return "SELECT * FROM " . $nomeTabela;
        }

        $condicao = $this->generation_string_condition($dados, $nomeTabela);
        return "SELECT * FROM " . $nomeTabela . " WHERE " . $condicao;
    }

    function __destruct() {
        $this->close_connection();
    }

}
