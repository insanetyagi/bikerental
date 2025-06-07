<?php
// DB credentials.
define('DB_HOST','db'); // IMPORTANT → use 'db' here
define('DB_USER','bikerentaluser'); // from docker-compose.yml
define('DB_PASS','bikerentalpass'); // from docker-compose.yml
define('DB_NAME','bikerental');

// Establish database connection.
try
{
$dbh = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
}
catch (PDOException $e)
{
exit("Error: " . $e->getMessage());
}
?>
