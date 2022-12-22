<?php

include_once "../DatabaseConnection.php";

class UserInformationHandlerErrorTypes {
    #invalid email
    #invalid birthdate
}

class UserInformationHandler {
    private $connection;

    public function __construct() {
        $this->connection = (new DatabaseConnection())->get_instance();
    }

    public function get_connection() {
        return $this->connection;
    }

    public function create_user_information(int $userId ,string $name ,string $surname ,string $documentNumber , string $birthdate, string $email ) {
        $sentencia = $this->connection->prepare("CALL create_user( $userId, '$name','$surname','$documentNumber', '$birthdate', '$email');");
        $sentencia->execute();
    }

    public function get_user_information(int $userId) {
        $sentencia = $this->connection->prepare("CALL get_user_information($userId);");
        $sentencia->execute();
    }

    public function get_all_users_information() {
        $sentencia = $this->connection->prepare("CALL get_all_users_information();");
        $sentencia->execute();
    }

    public function update_user_information(int $userId ,string $name ,string $surname ,string $documentNumber , string $birthdate, string $email) {
        $sentencia = $this->connection->prepare("CALL update_user_information( $userId, '$name','$surname','$documentNumber', '$birthdate', '$email');");
        $sentencia->execute();
    }
}
?>