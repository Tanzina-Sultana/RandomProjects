<?php
session_start();
$errors = array();

$classid = '';
$assignmentname = '';
$assignmenttype = '';
$startdate = '';
$starttime = '';
$enddate = '';
$endtime = '';


// connect to the database
$db = mysqli_connect('localhost', 'root', '', 'esutms');

if (isset($_POST['assignment_data'])) {

// receive all input values from the form
  $classid = mysqli_real_escape_string($db, $_POST['classid']);
  $assignmentname = mysqli_real_escape_string($db, $_POST['assignmentname']);
  $assignmenttype = mysqli_real_escape_string($db, $_POST['assignmenttype']);
  $startdate = mysqli_real_escape_string($db, $_POST['startdate']);
  $starttime = mysqli_real_escape_string($db, $_POST['starttime']);
  $enddate = mysqli_real_escape_string($db, $_POST['enddate']);
  $endtime = mysqli_real_escape_string($db, $_POST['endtime']);
  

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array


$query = "INSERT INTO assignment (Class_ID, Assignment_name, Assignment_type, A_Start_date, A_start_time, END_date, END_time)
		      VALUES('$classid', '$assignmentname', '$assignmenttype', '$startdate', '$starttime', '$enddate', '$endtime')";
mysqli_query($db, $query);
//echo "update successful"; 
$_SESSION['success'] = "Assignment Created Successfully";
    header('location: assres.php');
}






?>
