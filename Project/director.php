<?php

include("connect.php");

$query = "Select movie_direction.directorid, movie_direction.movieid, director.D_fname, director.D_lname, movie.movie_name 
		  from director, movie, movie_direction 
		  where director.director_id = movie_direction.directorid and movie.movie_id = movie_direction.movieid";
		
$result = $mysqli->query($query);

if($result){
	echo "<table border = '2'>";
    echo "<tr><td> Director ID</td> <td>Movie ID</td> <td>Director First Name</td> <td>Director Last Name</td> <td>Movie Name</td><tr>";
	while($new_row = $result->fetch_assoc()){
		echo  "<tr> <td>{$new_row['DirectorId']}</td> <td>{$new_row['MovieID']}</td> <td>{$new_row['D_Fname']}</td> <td>{$new_row['D_Lname']}</td> <td>{$new_row['Movie_name']}</td> <tr>";
	}
	echo "</table>";
}
else{
	echo "Failed Query! Go Back";
}
$result->close();


?>