<!DOCTYPE html>
<html>

<?php
include 'connect.php';

$user = trim($_POST['username']);
$pass = trim($_POST['password']);



if(empty($user) || empty($pass)){
	echo "Please fill in all the fields <br/>";
	echo "<a href = 'index.html'>GO BACK! </a>";

}
else{
	
	// Get a mysql connection 
	//$mysqli = new mysqli('localhost', 'root', 'shah123', 'movies');
	
	// Checking to see if a user name is valid or not 
	$query = "Select * from users where user_id = '".$user."' ";
	$result = $mysqli->query($query);
	
	// If user name is valid
	if($result->num_rows){
		
		// Check if the password matches
		$row = $result->fetch_assoc();
		$hash = md5($pass);
		if( $hash == $row['pass'] ) {
			echo "Welcome '".$user."' <br />";	


			$new_query = "Select * from movie";
			$new_result = $mysqli->query($new_query);
			if($new_result){
				
				echo "<table border = '2'>";
				echo "<tr><td> Movie Id</td> <td>Movie Name</td> <td>Release Year</td><td>Language</td><tr>";
				while($new_row = $new_result->fetch_assoc()){
					echo   "<tr><td>{$new_row['Movie_Id']}</td><td>{$new_row['movie_name']}</td><td>{$new_row['Release_Year']}</td><td>{$new_row['Language']}</td><tr>";
				}
				echo "</table>";
				echo "<a href= 'insert.html'>Insert a New movie</a> <br />";
				echo "<a href = 'director.php'>See Directors </a> <br />";
				echo "<a href = 'actor.php'> See Actors </a> <br />";


			}
			$new_result->close();
		}
		
		// If the password is wrong
		else{
			echo "Wrong Password!!! <br/> Go back and Enter Password again! <br />";	 
		 
		}
	}
	
	// If user name is invalid 
	else{
		echo "Wrong Username! Try again!";
	}
	
	// Close connection
	$result->close();
}
?>

</html>
