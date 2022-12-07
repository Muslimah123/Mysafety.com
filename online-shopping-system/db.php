<?php

$servername = "us-cdbr-east-06.cleardb.net";
$username = "b15aea1f32da82";
$password = "9f2a3aae";
$db = "heroku_8a6e96110881af4";

// Create connection
$con = mysqli_connect($servername, $username, $password,$db);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}


?>