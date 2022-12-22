<?php

include_once "../DatabaseConnection.php";

class SubjectHandlerErrorTypes {
}

class SubjectHandler {
    private $connection;

    public function __construct() {
        $this->connection = (new DatabaseConnection())->get_instance();
    }

    public function get_connection() {
        return $this->connection;
    }

    public function create_subject( string $name , int $careerId ) {
        $sentencia = $this->connection->prepare("CALL create_subject('$name', $careerId );");
        $sentencia->execute();
    }

    public function get_Subject(int $subjectId) {
        $sentencia = $this->connection->prepare("CALL get_subject($subjectId);");
        $sentencia->execute();
    }

    public function get_all_subjects() {
        $sentencia = $this->connection->prepare("CALL get_all_subjects();");
        $sentencia->execute();
    }

    public function update_Subject(int $subjectId, string $name ,int $careerId , bool $isDeleted) {
        $isDeletedAsInt = (int) $isDeleted;
        $sentencia = $this->connection->prepare("CALL create_user( $subjectId, '$name', $careerId, $isDeletedAsInt);");
        $sentencia->execute();
    }

    public function get_attendance_information_for_subject(int $subjectId ) {
        try {
            $sentencia = $this->connection->prepare("CALL get_attendance_information_for_subject($subjectId);");
            $sentencia->execute();
            $result = $sentencia->get_result();

            while ($test = $result->fetch_object()) {
                echo "<br>";
                print("Username: ".$test->username."\n");
                print("idUser: ".$test->idUser."\n");
                print("Has Attended: ".$test->attendance."\n");
                print("Date: ".$test->date."\n");
            }
        } catch(mysqli_sql_exception $e) {
            echo "<br>";
            echo "Hubo un problema" ."<br>";
            echo $e->getMessage();
        }
    }
}
?>    
    
    