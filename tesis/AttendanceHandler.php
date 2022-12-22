<?php

include_once "../DatabaseConnection.php";

class AttendanceHandlerErrorTypes {
}

class AttendanceHandler {
    private $connection;

    public function __construct() {
        $this->connection = (new DatabaseConnection())->get_instance();
    }

    public function get_connection() {
        return $this->connection;
    }

    public function create_attendance(int $subjectId ,int $userId , string $classDate , bool $isPresent) {
        try {
            $isPresentAsInt = (int) $isPresent;
            $sentencia = $this->connection->prepare("CALL create_attendance($subjectId, $userId, '$classDate',  $isPresentAsInt);");
            $sentencia->execute();
            echo "<br>";
            echo "La asistencia fue cargada correctamente";

        } catch(mysqli_sql_exception $e) {
            echo "<br>";
            echo "Hubo un problema" ."<br>";
            echo $e->getMessage();
        }
    }

    public function get_attendance(int $attendanceId) {
        try {
            $sentencia = $this->connection->prepare("CALL get_attendance($attendanceId);");
            $sentencia->execute();
            $result = $sentencia->get_result();
            while ($test = $result->fetch_object()) {
                echo "<br>";
                print("Date: ".$test->date."\n");
                print("User ID: ".$test->user_idUser."\n");
            }
        } catch(mysqli_sql_exception $e) {
            echo "<br>";
            echo "Hubo un problema" ."<br>";
            echo $e->getMessage();
        }
    }

    public function get_all_attendances() {
        $sentencia = $this->connection->prepare("CALL get_all_attendance();");
        $sentencia->execute();
    }

    public function update_attendance(int $attendanceId, int $subjectId ,int $userId , string $classDate , bool $isPresent) {
        $isPresentAsInt = (int) $isPresent;
        $sentencia = $this->connection->prepare("CALL update_attendance($attendanceId, $subjectId, $userId, '$classDate', $isPresentAsInt);");
        $sentencia->execute();
    }
}
?>