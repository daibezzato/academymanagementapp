<?php

include_once "../DatabaseConnection.php";


class GroupHandlerErrorTypes {
}

class GroupHandler
{
    private $connection;

    public function __construct()
    {
        $this->connection = (new DatabaseConnection())->get_instance();
    }

    public function getConnection()
    {
        return $this->connection;
    }

    public function create_group( string $name, string $description ) {
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