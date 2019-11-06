<?php 
include("includes/includedFiles.php");
 ?>

 <div class="entityInfo"> 
 	<div class="userInfo">
 		<h1> <?php echo $UserLoggedIn-> getFirstAndLastName(); ?> </h1>
 		
 	</div>
 </div>

 <div class="buttonItems">
 	<button class="button" onclick="openPage('updateDetails.php')">USER DETAILS</button>
 	<button class="button" onclick="logout()">LOGOUT</button>
 	
 </div>