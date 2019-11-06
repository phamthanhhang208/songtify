<?php 
include("includes/includedFiles.php");
?>

<div class="playlistsContainer"> 
	<div class="gridViewContainer">
		<h2>PLAYLISTS</h2>
		<div class="buttonItems">
			<button class="button green" onclick="openForm()">NEW PLAYLIST </button>
			
		</div>
		
	</div>
</div>

<div class="form-popup" id="myForm">
  <form action="yourMusic.php" class="form-container" method="POST">

    <h2>Give your playlist a name</h2>
    <input id="name" type="text" placeholder="My playlist" name="name" required>

    <button type="submit" class="button" style="float:right" name="createButton" onclick="createPlaylist()">Create</button>
    <button type="button" class="button cancel" onclick="closeForm()">Cancel</button>
  </form>
</div>



<?php 
	$username = $UserLoggedIn->getUsername();
	$playlistQuery = mysqli_query($con,"SELECT * FROM playlists WHERE owner ='$username' ");
	if (mysqli_num_rows($playlistQuery)==0){
		echo"<span class='noResult'> You don't have any playlists yet. </span>";
	}
	while ($row=mysqli_fetch_array($playlistQuery)){
		$playlist = new Playlist($con,$row);

		echo "<div class='gridViewItem' role='link' tabindex='0' onclick='openPage(\"playlist.php?id=" . $playlist->getId(). "\")'>
					<div class='playlistImage'> 
					<img src='assets/images/icons/playlist.png'>
					</div>
					<div class='gridViewInfo'>".$playlist -> getName() .  "
					</div>
				
			</div> ";
	}
 ?>