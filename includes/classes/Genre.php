<?php
	class Genre {
		private $con;
		private $id;

		public function __construct($con,$id){
			$this->con =$con;
			$this->id=$id;
		}
		public function getName(){
			$genreQuery = mysqli_query($this->con,"SELECT * FROM genres WHERE id='$this->id'");
			$genre = mysqli_fetch_array($genreQuery);
			return $genre['name'];
		}

		public function getId(){
			return $this->id;
		}

		public function getSongIds(){
			$query=mysqli_query($this->con,"SELECT id FROM songs WHERE genre='$this->id'ORDER BY plays DESC");
			$array = array();
			while ($row=mysqli_fetch_array($query)){
				array_push($array, $row['id']);
			}
			return $array;
		}

	} 
 ?>