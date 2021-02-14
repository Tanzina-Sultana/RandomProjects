<?php 
  session_start(); 

  if (!isset($_SESSION['success'])) {
  	$_SESSION['msg'] = "Something went Wrong. Please make sure to enter your firstname again.";
  	header('location: travel.php');
  }
  if (isset($_GET['logout'])) {
  	session_destroy();
  	unset($_SESSION['success']);
  	header("location: travel.php");
  }
?>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="header">
	<h2>Home Page</h2>
</div>
<div class="content">
  	<!-- notification message -->
  	<?php if (isset($_SESSION['success'])) : ?>
      <div class="error success" >
      	<h3>
          <?php 
          	echo $_SESSION['success']; 
          	unset($_SESSION['success']);
          ?>
      	</h3>
      </div>
  	<?php endif ?>

	<!-- After user submits profile data -->
    <?php  if (isset($_SESSION['userid'])) : ?>
    	<p> <a href="index.php?logout='1'" style="color: red;">logout</a> </p>
		
    <?php endif ?>
	
	
</div>
		
</body>
</html>