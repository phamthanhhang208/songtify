<?php
if (isset($_POST['loginButton'])){
	//login button was press
	$username=$_POST['loginUsername'];
	$password=$_POST['loginPassword'];

	$result = $account ->login($username,$password);

	if($result==true) {
		$_SESSION ['UserLoggedIn'] = $username;
		header("Location: index.php");
	}
}
?>