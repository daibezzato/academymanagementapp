<?php

include_once "../DatabaseConnection.php";

class UserHandlerErrorTypes {
    const ERR_GET_USER = 84;
    const ERR_UPDATE_USER = 85;
    const ERR_DELETE_USER = 86;
    const ERR_INVALID_ID = 87;
    const ERR_INVALID_USER_PASSWORD = 88;
    const ERR_CREATE_USER = 89;
}

class UserHandler {
    private $connection;

    public function __construct() {
        $this->connection = (new DatabaseConnection())->get_instance();
    }

    public function get_connection() {
        return $this->connection;
    }

    public function create_user(string $username, string $passwordHash, string $salt) {
        $sentencia = $this->connection->prepare("CALL create_user('$username','$passwordHash','$salt');");
        $sentencia->execute();
    }

    public function get_user(int $userId) {
        $sentencia = $this->connection->prepare("CALL get_user($userId);");
        $sentencia->execute();
    }

    public function get_all_users() {
        $sentencia = $this->connection->prepare("CALL get_all_users();");
        $sentencia->execute();
    }

    public function update_user(int $userId, string $username, string $passwordHash, string $salt, bool $isDeleted) {
        $sentencia = $this->connection->prepare("CALL update_user($userId, '$username','$passwordHash', '$salt', $isDeleted);");
        $sentencia->execute();
    }

    public function delete_user(int $userId) {
        $sentencia = $this->connection->prepare("CALL delete_user($userId);");
        $sentencia->execute();
    }
}
?>