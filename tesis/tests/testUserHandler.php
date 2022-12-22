<?php 

include_once "../DatabaseConnection.php";
include_once "../UserHandler.php";
include_once "../Helpers.php";

$instancia = new UserHandler();
$helperInstance = new Helper();
$instancia->get_connection();

$username = 'tiburoncin';
$password = 'uhahahpass';
$salt = $helperInstance->getName(8);

$instancia->create_user($username, $password, $salt);



#$instancia->disable_user(9);

#$instancia->restore_user(9);

?>