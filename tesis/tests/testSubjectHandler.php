<?php 
include_once "../DatabaseConnection.php";
include_once "../SubjectHandler.php";

$instancia = new SubjectHandler();
$instancia->get_connection();

$name = 'pedagogia';
$careerId = 7;
#$instancia->create_subject($name, $careerId);

$instancia->get_attendance_information_for_subject(2);
?>