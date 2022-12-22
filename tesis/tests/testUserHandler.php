<?php 

include_once "../DatabaseConnection.php";
include_once "../UserHandler.php";

$instancia = new UserHandler();
$instancia->get_connection();

#$username = 'tiburoncin';
#$password = 'uhahahpass';

#$instancia->create_user($username, $password);

#$instancia->disable_user(9);

#$instancia->restore_user(9);

?>