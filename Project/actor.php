<?php

include("connect.php");

$query = "Select movie_cast.act_Id, movie_cast.movieid, actor.Actor_fname, actor.actor_lname, movie.movie_name 
		  from movie_cast, movie, actor 
		  where movie_cast.act_id = actor.actor_id and movie_cast.movieid = movie.movie_id";
		
$result = $mysqli->query($query);

if($result){
	echo "<table border = '2'>";
    echo "<tr><td> Actor ID</td> <td>Movie ID</td> <td>Actor First Name</td> <td>Actor Last Name</td> <td>Movie Name</td><tr>";

	while($new_row = $result->fetch_assoc()){
		echo  "<tr> <td>{$new_row['act_Id']}</td> <td>{$new_row['movieid']}</td> <td>{$new_row['Actor_fname']}</td> <td>{$new_row['actor_lname']}</td> <td>{$new_row['movie_name']}</td> <tr>";
	}
	echo "</table>";
}
else{
	echo "Failed Query! Go Back";
}
$result->close();
 
?>