<?php

include_once "../databaseConnection.php";


class UserHandlerErrorTypes
{
    const ERR_GET_USER = 84;
    const ERR_UPDATE_USER = 85;
    const ERR_DELETE_USER = 86;
    const ERR_INVALID_ID = 87;
    const ERR_INVALID_USER_PASSWORD = 88;
    const ERR_CREATE_USER = 89;
}

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

    public function createUser(string $username, string $password) {

        $name = $this->getName(5);
        $surname = $this->getName(8);
        $document = rand(39000000, 97000000);
        $mail = "$name $surname @gmail.com";

        $sentencia = $this->connection->prepare("CALL create_user('$username','$password', '$name', '$surname', '$document', '2011-4-22', '$mail', 'play');");

        // llamar al procedimiento almacenado
        $sentencia->execute();
    }

    public function disable_user(int $userId) {
        $sentencia = $this->connection->prepare("CALL delete_user($userId);");
        $sentencia->execute();
    }

    public function restore_user(int $userId) {
        $sentencia = $this->connection->prepare("CALL restore_user($userId);");
        $sentencia->execute();
    }



    #this is provisory for testing
public function getName($n) {
	$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	$randomString = '';

	for ($i = 0; $i < $n; $i++) {
		$index = rand(0, strlen($characters) - 1);
		$randomString .= $characters[$index];
	}
	return $randomString;
}


}
?>