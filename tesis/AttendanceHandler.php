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

    public function create_attendance( int $subjectId ,int $userId , string $classDate , bool $isPresent ) {
        $sentencia = $this->connection->prepare("CALL create_career($subjectId, $userId, '$classDate', $isPresent );");
        $sentencia->execute();
    }

    public function get_attendance(int $attendanceId) {
        $sentencia = $this->connection->prepare("CALL get_attendance($attendanceId);");
        $sentencia->execute();
    }

    public function get_all_attendances() {
        $sentencia = $this->connection->prepare("CALL get_all_attendance();");
        $sentencia->execute();
    }

    public function update_attendance(int $attendanceId, int $subjectId ,int $userId , string $classDate , bool $isPresent) {
        $sentencia = $this->connection->prepare("CALL create_user($attendanceId, $subjectId, $userId, '$classDate', $isPresent);");
        $sentencia->execute();
    }
}
?>