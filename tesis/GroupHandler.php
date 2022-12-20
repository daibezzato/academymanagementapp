<?php

include_once "../databaseConnection.php";


class GroupHandlerErrorTypes {
}

class GroupHandler
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

    public function create( string $name, string $description ) {
        $sentencia = $this->connection->prepare("CALL create_group('$name','$description');");
        $sentencia->execute();
    }

    public function disable_group(string $groupId) {
        $sentencia = $this->connection->prepare("CALL delete_group($groupId);");
        $sentencia->execute();
    }

    public function restore_group(string $groupId) {
        $sentencia = $this->connection->prepare("CALL restore_group($groupId);");
        $sentencia->execute();
    }

}