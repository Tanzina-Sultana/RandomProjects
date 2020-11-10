<?php 
	session_start();
	// connect to database
	$conn = mysqli_connect("localhost", "root", "", "complete-job-php");

	if (!$conn) {
		die("Error connecting to database: " . mysqli_connect_error());
	}
    // define global constants
	define ('ROOT_PATH', realpath(dirname(__FILE__)));
	define('BASE_URL', 'http://localhost/complete-job-php/');
?>