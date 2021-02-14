<?php?>

<!DOCTYPE HTML> 
<html>
<head>
  <title>Create Assignment</title>
</head>
<body> 
<h2>Creat new assignment</h2>

 <form action = "conn.php" method = "POST">

  <table> 
  	
   <tr>
    <td>Class ID :</td>
    <?php 
    $conn = mysqli_connect("localhost", "root", "", "esutms");
    $resultset = $conn->query("SELECT ClassID FROM class"); 
    ?>
    <td><select name = "classid">
    <?php
    while($rows = $resultset->fetch_assoc())
    {
      $ClassID = $rows['ClassID'];
      echo"<option value='$ClassID'>$ClassID</option>";
    }

    ?>
    </select>

   </tr>
   <tr>
    <td>Assignment Name :</td>
    <td><input type = "text" name = "assignmentname" required></td>
   </tr>
   <tr>
    <td><label for = "assignmenttype">Assignment type :</label></td>
    <td><input list = "assignmenttype" name = "assignmenttype" required></td>
    	<datalist id = "assignmenttype">
    		<option value = "Classwork">
    		<option value = "Homewrok">
    		
      </datalist>	 
    
   </tr>
   
   <tr>
    <td>Start Date :</td>
    <td><input type ="date" name ="startdate" required></td>
   </tr> 
   <tr>
    <td>Start time :</td>
    <td><input type ="time" name ="starttime" required></td>
   </tr>
   <tr>
    <td>End Date :</td>
    <td><input type = "date" name = "enddate" required></td>
   </tr>
   <tr>
    <td>End time :</td>
    <td><input type = "time" name = "endtime" required></td>
   </tr>
   
   <td><input type = "submit"  name = "assignment_data" style="display:block;margin:0 auto" a href = button onClick="location.href='result.php'" ></td>
  </table>
 </form>
 
</body>
</html>