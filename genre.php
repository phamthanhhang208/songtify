<?php include("includes/includedFiles.php"); 

if(isset($_GET['id'])){
	$genreId=$_GET['id'];
}
else{
	header("Location: index.php");
}

$genre = new Genre($con,$genreId);

?>

<div class="entityInfo borderBottom">
	<div class="centerSection">
		<div class="artistInfo">
			<h1 class="artistName"><?php echo $genre->getName(); ?></h1>
			<div class="headerButtons">
				<button class="button green" onclick="playFirstSong()">PLAY</button>
				
			</div>
			
		</div>
	</div>
	
</div>

<div class="tracklistContainer borderBottom">
	<h2>SONGS</h2>
	<ul class="tracklist">

		<?php 
		$songIdArray = $genre->getSongIds();
		$i=1;
		foreach ($songIdArray as $songId) {

			if($i>5){
				break;
			}

			$albumSong = new Song($con, $songId);
			$albumArtist = $albumSong ->getArtist();
			echo "<li class='tracklistRow'>
				<div class='trackCount'> 
					<img class='play'src='assets/images/icons/play-white.png' onclick='setTrack(\"". $albumSong->getId()."\",tempPlaylist,true) ' >
					<span class='trackNumber'>$i </span>
				</div>

				<div class='trackInfo'>
					<span class='trackName'>" .$albumSong->getTitle(), "</span>
					<span class='artistName'>" .$albumArtist->getName(), "</span>
				</div>
				<div class='trackOptions'>
					<input type='hidden' class='artistId' value='" . $albumArtist -> getId() ."' >
					<input type='hidden' class='songId' value='" . $albumSong -> getId() ."' >
					<img class='optionButton' src='assets/images/icons/more.png' onclick='showOptionsMenu(this)' > 
				</div>

				<div class='trackDuration'>
					<span class='duration'>" .$albumSong->getDuration() ." </span>
				</div>
				
			 </li>";
			 $i++;
		}
		?>
		<script>
			var tempSongIds = '<?php echo json_encode($songIdArray); ?>';
			tempPlaylist = JSON.parse(tempSongIds);
		</script>
	</ul>
</div>

<div class="gridViewContainer">
	<h2>ALBUMS</h2>
	<?php
		$albumQuery =mysqli_query($con,"SELECT * FROM albums WHERE genre='$genreId' ");
		while ($row =mysqli_fetch_array($albumQuery)) {
			echo "<div class='gridViewItem'>
				<span role='link' onclick='openPage(\"album.php?id=". $row['id'].  "\")'>
					<img src='" . $row['artworkPath'].   "'>
					<div class='gridViewInfo'>". $row['title'].  "
					</div>
				</span>
			</div>  ";
		}
	?>	
</div>

<nav class="optionsMenu">
	<input type="hidden" class ="songId">
	<input type="hidden" class="artistId">
	<?php echo Playlist::getPlaylistDropdown($con,$UserLoggedIn->getUsername() ); ?>
	<div class="item" onclick="ViewArtist(this)" > View Artist </div>

</nav>

