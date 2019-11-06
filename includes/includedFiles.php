<?php
if(isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
	include("includes/config.php");
	include("includes/classes/User.php");
	include("includes/classes/Artist.php");
	include("includes/classes/Album.php");
	include("includes/classes/Song.php");
	include("includes/classes/Playlist.php");
	include("includes/classes/Genre.php");

	if(isset($_GET['UserLoggedIn'])){
		$UserLoggedIn = new User ($con,$_GET['UserLoggedIn']);
	}

}
else {
	include("includes/header.php");
	include("includes/footer.php");

	$url = $_SERVER['REQUEST_URI'];
	echo "<script>openPage('$url')</script>";
	exit();
}
?>