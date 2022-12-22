<?php

include_once "../DatabaseConnection.php";

class ActionHandlerErrorTypes {
}

class ActionHandler {
    private $connection;

    public function __construct() {
        $this->connection = (new DatabaseConnection())->get_instance();
    }

    public function get_connection() {
        return $this->connection;
    }

    public function create_action( string $name, string $description) {
        $sentencia = $this->connection->prepare("CALL create_career('$name','$description');");
        $sentencia->execute();
    }

    public function get_action(int $actionId) {
        $sentencia = $this->connection->prepare("CALL get_action($actionId);");
        $sentencia->execute();
    }

    public function get_all_actions() {
        $sentencia = $this->connection->prepare("CALL get_all_actions();");
        $sentencia->execute();
    }

    public function update_action(int $actionId, string $name, string $description, bool $isDeleted) {
        $sentencia = $this->connection->prepare("CALL create_user($actionId, '$name','$description', $isDeleted);");
        $sentencia->execute();
    }

    public function delete_action(int $actionId) {
        $sentencia = $this->connection->prepare("CALL delete_action($actionId);");
        $sentencia->execute();
    }
}
?>