<?php

	$mysqli = new mysqli('localhost', 'rob', 'password', 'movies');
	if($mysqli->connect_error){
		die("Connection failed: " .$mysqli->connect_error);
	}
?>