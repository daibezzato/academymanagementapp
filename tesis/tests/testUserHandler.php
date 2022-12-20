<?php 

include_once "../databaseConnection.php";
include_once "../UserHandler.php";

$instancia = new UserHandler();
$instancia->getConnection();

#$username = 'tiburoncin';
#$password = 'uhahahpass';

#$instancia->createUser($username, $password);

#$instancia->disable_user(9);

#$instancia->restore_user(9);

?>