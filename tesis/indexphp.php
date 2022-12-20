<html>
 <head>
  <title>Prueba de PHP</title>
 </head>
 <body>
 <?php echo '<p>Hola Mundo</p>'; ?>
 <?php

$server_name = "localhost";

$user_name = "root";

$password = "admin";

$connection = mysqli_connect($server_name, $user_name, $password);

// Checking the  connection
if (!$connection) {
  die("Failed ". mysqli_connect_error());
}
echo "Connection established successfully";
?>

 </body>
</html>