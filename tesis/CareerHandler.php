<?php

include_once "../databaseConnection.php";


class CareerHandlerErrorTypes {
}

class CareerHandler
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

    public function create( string $name, string $description, string $resolution ) {
        $sentencia = $this->connection->prepare("CALL create_career('$name','$description', '$resolution');");
        $sentencia->execute();
    }

    public function disable_career(string $carrerId) {
        $sentencia = $this->connection->prepare("CALL delete_career($carrerId);");
        $sentencia->execute();
    }

    public function restore_career(string $carrerId) {
        $sentencia = $this->connection->prepare("CALL restore_career($carrerId);");
        $sentencia->execute();
    }

}