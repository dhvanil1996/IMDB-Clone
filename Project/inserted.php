<?php
include ("connect.php");


// Get movie name, director name, and actor name
$mname = trim($_POST['MName']);
$myear = trim($_POST['MYear']);
$mlanguage = trim($_POST['MLang']);
$dfname = trim($_POST['DFname']);
$dlname = trim($_POST['DLname']);
$afname = trim($_POST['AFname']);
$alname = trim($_POST['ALname']);
 

// If any of the fields are empty
if(empty($mname) || empty($myear) || empty($mlanguage)
	|| empty($dfname) || empty($dlname) || empty ($afname) || empty($alname) ){
	echo "Please fill in all the fields";
}
// Else
else{
	
	// Check if movie already exists in database or not
	$query = " Select * from movie where movie_name = '".$mname."' ";
	
	// Query 
	$result = $mysqli->query($query);
	
	// If movie exists
	if($result->num_rows){
		echo "That movie already exists in table. Please enter a unique movie! <br /> OR ";
	}
	//Else
	else{
		
		
		//Insert movie into database 
		$new_query = "Insert into movie values ( default , '".$mname."' ,'".$myear."' ,'".$mlanguage."') ";	
		//Query
		$new_result = $mysqli->query($new_query);
		echo "Movie inserted successfully! <br/>";
	

		
		// Check if director name already exists in director table
		$director_check_query = "Select * from director where d_fname = '".$dfname."' and d_lname = '".$dlname."' ";
		//Query
		$director_result = $mysqli->query($director_check_query);
		// If director name already exists 
		if($director_result->num_rows){
			//Update movie_director table
			$movie_direction_query = "Insert into movie_direction values (
			(select Movie_Id from movie where movie_name = '".$mname."'),
			(select director_id from director where d_fname = '".$dfname."' and d_lname = '".$dlname."') )";
			//Query
			$movie_direction_result = $mysqli->query($movie_direction_query);
		}else{
			//Add new director and update movie_direction table;
			$director_name_insert = "Insert into director values (
			default, '".$dfname."', '".$dlname."')";
			
			//Query 
			$director_name_query = $mysqli->query($director_name_insert);
			
			//Add director to movie_direction table
			$director_add = "Insert into movie_direction values (
			(select Movie_Id from movie where movie_name = '".$mname."'),
			(select director_id from director where d_fname = '".$dfname."' and d_lname = '".$dlname."')
			)";
			
			//Query
			$director_add_result = $mysqli->query($director_add);
		}
		
		//Check if actor already exists in actor table
		$actor_check_query = "Select * from actor where Actor_Fname = '".$afname."' and Actor_Lname = '".$alname."' ";
		//Query
		$actor_check_result = $mysqli->query($actor_check_query);
		//If actor already exist, update movie_cast table
		if($actor_check_query->num_rows){
			$movie_cast_query = "Insert into movie_cast values (
			(select Actor_Id from actor where Actor_Fname = '".$afname."' and Actor_Lname = '".$alname."'),
			(select Movie_Id from movie where movie_name = '".$mname."'))";
			
			//Query
			$movie_cast_result = $mysqli->query($movie_cast_query);
		}
		// Else add new actor, and update movie_cast table
		else{
			$actor_add_query = "Insert into actor values (
			default, '".$afname."', '".$alname."')";
			$actor_add_result = $mysqli->query($actor_add_query);
			
			// Add new actor and movie in movie_cast
			
			$movie_cast_update_query = "Insert into movie_cast values (
			(select Actor_Id from actor where Actor_Fname = '".$afname."' and Actor_Lname = '".$alname."'),
			(select Movie_Id from movie where movie_name = '".$mname."')
			)";
			// Query
			$movie_cast_update_query_result = $mysqli->query($movie_cast_update_query); 
			
			
		}
		$result->close();
		$new_result->close();
		$director_result->close();
		$director_add_result->close();
		$movie_direction_result->close();
		$director_name_query->close();
		$movie_cast_result->close();
		$movie_cast_update_query_result->close();
		
		
		
	}
	
		echo "<a href = 'members.php'>Click to go back to members page</a>";
	

}



?>