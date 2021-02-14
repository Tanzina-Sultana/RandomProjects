<?php 
  session_start(); 


?>

<!DOCTYPE html>
<html>
<head>
	<title>Assignment Table</title>
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
            $_SESSION['proceed'] = "proceed";

          ?>
      	</h3>
      </div>
  	<?php endif ?>

	<!-- After user submits profile data -->
    <?php  if (isset($_SESSION['proceed'])) : ?>
    	<p> <a href="result.php" style="color: red;">Go to assignment page</a> </p>
		
    <?php endif ?>
	
	
</div>
		
</body>
</html>