<?php

class DatabaseConnection {
    private $connection;

    public function __construct()
    {
        require_once('env.php');
        $connection = mysqli_connect($hostname_cone, $username_cone, $password_cone, $database_cone);

        if (!$connection) {
            die("Failed ". mysqli_connect_error());
        }
        $this->connection = $connection;
        echo "La conexion a la base de datos fue exitosa.";
    }
    public function get_instance()
    {
        return $this->connection;
    }
} 
?>
