<?php 

include_once "../databaseConnection.php";
include_once "../UserHandler.php";

$instancia = new UserHandler();
$instancia->getConnection();

$instancia->createUser();

?>