<?php

class DatabaseConnection
{
    private $connection;

    public function __construct()
    {
        $server_name = "localhost";
        $user_name = "root";
        $password = "admin";
        $database = "isftdb";
        $connection = mysqli_connect($server_name, $user_name, $password, $database);

        if (!$connection) {
            die("Failed ". mysqli_connect_error());
        }
        $this->connection = $connection;
        echo "Connection established successfully";
    }
    public function get_instance()
    {
        return $this->connection;
    }
};
?>
