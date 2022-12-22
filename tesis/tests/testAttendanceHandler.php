<?php 
include_once "../DatabaseConnection.php";
include_once "../AttendanceHandler.php";

$instancia = new AttendanceHandler();
$instancia->get_connection();

$classDate = '2022-04-25';

#$instancia->create_attendance(2, 17, $classDate, true);
#$instancia->get_attendance(1);
$instancia->update_attendance(1, 2, 16, '2022-03-18', true);
?>