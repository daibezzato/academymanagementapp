<?php

include_once "../databaseConnection.php";

class UserHandler
{
    private $connection;

    public function __construct()
    {
        $this->connection = (new DatabaseConnection())->getInstance();
    }

    public function getConnection()
    {
        return $this->connection;
    }

    public function createUser() {

        #string $username, string $password
        echo "HOLA SOY LA CONEXION";
        echo($this->connection->client_info);
        $sentencia = $this->connection->prepare("CALL create_user('ladai', 'unamejorpass', 'Dai', 'Bez', '365894368', '2011-4-23', 'ladai@gmail.com', 'xbox');");

        // llamar al procedimiento almacenado
        $sentencia->execute();

        #print "El procedimiento devolvió $valor_devuleto\n";

    }
}
?>