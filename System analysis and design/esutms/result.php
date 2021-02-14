<!DOCTYPE html>
<html>
<head>
<title>Assignment Table</title>
<style>
table {
border-collapse: collapse;
width: 100%;
color: #588c7e;
font-family: monospace;
font-size: 18px;
text-align: left;
}
th {
background-color: #588c7e;
color: white;
}
tr:nth-child(even) {background-color: #f2f2f2}
</style>
</head>
<body>
	<h2>Assignment table</h2>
<table>
<tr>
<th>Assignment_ID</th>
<th>Class_ID</th>
<th>Assignment_Name</th>
<th>Assignment_type</th>
<th>A_Start_date</th>
<th>A_Start_time</th> 
<th>END_date</th>
<th>END_time</th>
</tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "esutms");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT * FROM assignment";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {
echo "<tr><td>" . $row["Assignment_ID"]. "</td><td>" . $row["Class_ID"] . "</td><td>"
. $row["Assignment_name"]. "</td><td>" . $row["Assignment_type"]. "</td><td>" . $row["A_Start_date"]. "</td><td>" . $row["A_start_time"] . "</td>><td>" . $row["END_date"] . "</td>><td>" . $row["END_time"] . "</td>></tr>" ;
}
echo "</table>";
} else { echo "0 results"; }
$conn->close();
?>
<p> <a href="HomePage.php"> Back to Homepage </a> </p>

</table>
</body>
</html>