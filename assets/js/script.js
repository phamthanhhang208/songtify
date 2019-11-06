var currentlyPlaying =[];
var currentPlaylist=[];
var shufflePlaylist=[];
var tempPlaylist=[];
var audioElement;
var mouseDown = false;
var currentIndex =0;
var repeat = false;
var shuffle = false;
var UserLoggedIn;
var timer;


$(document).click(function(click){
	var target = $(click.target);

	if(!target.hasClass("item") && !target.hasClass("optionButton")){
		hideOptionsMenu();
	}
});


$(document).click(function(click){
	var target = $(click.target);
	 play = true;

	//setTrack(songId,tempPlaylist,play);
});

$(document).mousemove(function(event){
	var target = $(event.target);
	if(!target.hasClass("item") && !target.hasClass("optionButton")){
		hideOptionsMenu();
	}
});



$(window).scroll(function(){
	hideOptionsMenu();
});


$(document).on("change","select.playlist", function(){
	var select =$(this);
	var playlistId = select.val();
	var songId = select.prevAll(".songId").val();
	var artistId = select.prev(".artistId").val();


	$.post("includes/handlers/ajax/checkDuplicateSong.php", { playlistId: playlistId, songId: songId})
    .done(function(numRows) {
 
        if(numRows != 0) {
            alert("This song already exists in this playlist!");
            return;
        }
    
	$.post("includes/handlers/ajax/addToPlaylist.php",{playlistId: playlistId, songId: songId})
	.done(function(error){
		if(error !=""){
			alert(error);
			return;
		}
		else{
			alert("Added successfully");
		}

			});
	
		});

	hideOptionsMenu();
	select.val("");
});


function logout(){
	$.post("includes/handlers/ajax/logout.php", function(){
		location.reload();
	});
}

window.addEventListener("popstate", function() {
  var url = location.href;
  openPagePushState(url);
})

function openPagePushState(url){

	if(timer!=null){
		clearTimeout(timer);
	}

	if (url.indexOf("?")==-1){
		url = url + "?";
	}

	var encodedUrl = encodeURI(url+"&UserLoggedIn="+UserLoggedIn);
	
	//console.log(encodedUrl);
	
	$("#mainContent").load(encodedUrl);
	$("body").scrollTop(0);
	//history.pushState(null,null,url);
}

function openPage(url) {
  openPagePushState(url);
  history.pushState(null, null, url);
}


function hideOptionsMenu(){
	var menu = $(".optionsMenu");
	if(menu.css("display") != "none"){
		menu.css("display","none");
	}
}


function showOptionsMenu(button){
	var songId = $(button).prevAll(".songId").val();
	var artistId =$(button).prevAll(".artistId").val()
	var menu = $(".optionsMenu");
	var menuWidth = menu.width();
	menu.find(".songId").val(songId);
	menu.find(".artistId").val(artistId);


	var scrollTop = $(window).scrollTop();
	var elementOffset = $(button).offset().top;

	var top = elementOffset - scrollTop;
	var left = $(button).position().left;

	menu.css({"top": top + "px", "left":left - menuWidth + "px", "display":"inline"});
}

function ViewArtist(button){
	var artistId = $(button).prevAll(".artistId").val();
	openPage("artist.php?id=" + artistId);
}

//function PlayMusic(button){
//	var songId = $(button).prevAll(".songId").val();
	//console.log(songId);
//	setTrack(songId,tempPlaylist,true);
	
//	}


function formatTime(seconds){
	var time = Math.round(seconds);
	var minutes = Math.floor(time / 60);
	var seconds = time - (minutes * 60);

	var extraZero = (seconds < 10) ? "0" : "";
	return minutes + ":" + extraZero +seconds;
}

function updateTimeProgressBar(audio){
	$(".progressTime.current").text(formatTime(audio.currentTime));
	$(".progressTime.remaining").text(formatTime(audio.duration - audio.currentTime));

	var progress = audio.currentTime / audio.duration * 100;
	$(".playbackBar .progress").css("width", progress + "%"); 
}

function updateVolumeProgressBar(audio){
	var volume = audio.volume * 100;
	$(".volumeBar .progress").css ("width",volume + "%");
}

function Audio(){
	this.currentlyPlaying;
	this.audio = document.createElement('audio');

	this.audio.addEventListener("ended",function(){
		nextSong();
	});
	
	this.audio.addEventListener("canplay", function(){
		var duration = formatTime(this.duration);
		$(".progressTime.remaining").text(duration);
		});
	this.audio.addEventListener("timeupdate",function(){
		if(this.duration){
			updateTimeProgressBar(this);
		}
	});

	this.audio.addEventListener("volumechange",function(){
		updateVolumeProgressBar(this);
	});

	this.setTrack=function(track){
		this.currentlyPlaying =track;
		this.audio.src =track.path;
	}
	this.play = function(){
		this.audio.play();
	}
	this.pause = function(){
		this.audio.pause();
	}
	this.setTime = function(seconds){
		this.audio.currentTime = seconds;
	}
}

function playFirstSong(){
	setTrack(tempPlaylist[0],tempPlaylist,true);
}

function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}


function createPlaylist(){
	var popup = document.getElementById('name').value//prompt("Give your playlist a name");
	if(popup != ""){
		$.post("includes/handlers/ajax/createPlaylist.php", {name: popup, username: UserLoggedIn})
		.done(function(error){
			if(error=""){
				alert(error);
				return;
			}

			openPage("yourMusic.php");
		});
	}
}

function deletePlaylist(playlistId){
	var promt = confirm("Are you sure you want to delete this playlist?");
	if (prompt){

		$.post("includes/handlers/ajax/deletePlaylist.php", {playlistId : playlistId})
		.done(function(error){
			if(error=""){
				alert(error);
				return;
			}

			openPage("yourMusic.php");
		});

	}
}

function removeFromPlaylist(button,playlistId){
	var songId = $(button).prevAll(".songId").val();

	$.post("includes/handlers/ajax/removeFromPlaylist.php", {playlistId : playlistId, songId: songId})
		.done(function(error){
			if(error=""){
				alert(error);
				return;
			}

			openPage("playlist.php?id="+playlistId);
		});

	}




function updateEmail(emailClass){
	var emailValue =$("." +emailClass).val();

	$.post("includes/handlers/ajax/updateEmail.php",{email : emailValue, username: UserLoggedIn})
	.done(function(response){
		$("." +emailClass).nextAll(".message").text(response);
	});
}


function updatePassword(oldPasswordClass,newPasswordClass1,newPasswordClass2){
	var oldPassword = $("." +oldPasswordClass).val();
	var newPassword1 = $("." +newPasswordClass1).val();
	var newPassword2 = $("." +newPasswordClass2).val();

	$.post("includes/handlers/ajax/updatePassword.php",
		{oldPassword : oldPassword, newPassword1: newPassword1, newPassword2: newPassword2, username: UserLoggedIn})
	.done(function(response){
		$("." +oldPasswordClass).nextAll(".message").text(response);
	});
}

