<?php include("includes/includedFiles.php"); ?>



<div class="tracklistContainer borderBottom">
	<h1 class="topsongs" style="text-align: center;padding-top:37px;">TOP SONGS</h1>
	<ul class="tracklist">

		<?php 
		$songsQuery = mysqli_query($con,"SELECT * FROM songs ORDER BY plays DESC LIMIT 5 ");

		$songIdArray = array();
		
		$i=1;
		while ($row = mysqli_fetch_array($songsQuery)) {

			if($i>15){
				break;
			}

			array_push($songIdArray,$row['id']);

			$albumSong = new Song($con, $row['id']);
			$albumArtist = $albumSong ->getArtist();
			
			echo "<li class='tracklistRow' >
				<div class='trackCount'> 
					<img class='play'src='assets/images/icons/play-white.png' onclick='setTrack(\"". $albumSong->getId()."\",tempPlaylist,true)'>
					<img class='pause' src='assets/images/icons/pause-icon.png' style='display: none;'>
					<span class='trackNumber'>$i </span>
				</div>

				<div class='trackInfo'>
					<span class='trackName'>" .$albumSong->getTitle(). "</span>
					<span class='artistName' value='" . $albumArtist -> getId() ."' >" .$albumArtist->getName(). "</span>

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

<nav class="optionsMenu">
	<input type="hidden" class ="songId">
	<input type="hidden" class="artistId">
	<?php echo Playlist::getPlaylistDropdown($con,$UserLoggedIn->getUsername() ); ?>
	<div class="item" onclick="ViewArtist(this)" > View Artist </div>

</nav>


<h1 class="pageHeadingBig" style="text-align: center;">DISCOVER</h1>
<div class="gridViewContainer borderBottom">
	<?php
		$albumQuery =mysqli_query($con,"SELECT * FROM albums ORDER BY RAND() LIMIT 5");
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

<div class="genreContainer">
	<h1 style="text-align: center;">GENRE</h1>
	<?php 
	$genresQuery = mysqli_query($con,"SELECT * FROM genres ");

		while ($row = mysqli_fetch_array($genresQuery)) {

			echo "<div class='genreRow'>
					<div class = 'genreName' role='link' onclick='openPage(\"genre.php?id=" .$row['id'] . "\")'>
						<span id='genreid'>
						"
						.$row['name'] .
						"
						</span>
					</div>
				</div> ";
		}
	 ?>
</div>


