<html>
<?php
include 'connect.php';

$new_user = trim($_POST['new_user']);
$new_pass = trim($_POST['new_pass']);
$email = trim($_POST['email']);
$fname = trim($_POST['fname']);
$lname = trim($_POST['lname']);


// Check that fields are not empty 
if( empty($new_user) ||  empty($new_pass)  || 
     empty($email)   ||  empty($fname)     ||  
	 empty($lname)) {
	   
	   echo "Please go back and fill in all the fields <br />" ;
	   
}


else{
	// Mysql connection
	//$mysqli = new mysqli('localhost', 'root', 'shah123', 'movies');
	
	// Checking if a user name already exists or not
	$query = "Select * from users where  User_Id = '".$new_user."' ";
	$result = $mysqli->query($query);
	
	// If user name exists
	if($result->num_rows){
		echo "Sorry, a user with that User_id already exits! <br />";
		echo "Enter a different user_id! <br />";
	}
	
	// Close connection
	$result->close();
	
	// Create a new connection 
	$mysqli2 = new mysqli('localhost', 'root', 'shah123', 'movies');
	
	// Check if email already exists or not
	$query2 = "Select * from users where  Email = '".$email."' ";
	$result2 = $mysqli2->query($query2);
	
	// If email exists 
	if($result2->num_rows){
		echo "Sorry, a user with that email already exits! <br />";
		echo "Enter a different email! <br />";
	}	
	
		
	// If both email and username are unique
	else{
		
		// Create a password hash
		$hash = md5($new_pass);
		
		// Add user information into the database 
		$query = "Insert into users values (
		'".$fname."', '".$hash."', '".$email."', '".$lname."', '".$new_user."')";
		$result2 = $mysqli->query($query);
		echo "User added. Click to go back to login page";
			echo " <a href = 'index.html'> GO BACK! </a>";

	}
	
	// Close database connection 
	$result2->close();
	
}

?>


