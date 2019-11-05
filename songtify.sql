-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2019 at 06:33 PM
-- Server version: 5.7.24-log
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `songtify`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `artworkPath` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`, `artist`, `genre`, `artworkPath`) VALUES
(1, 'Lover', 6, 1, 'assets/images/artwork/Lover.jpg'),
(2, 'Easy - Single', 9, 1, 'assets/images/artwork/easy.jpg'),
(3, 'No.6 Collaborations Project ', 8, 1, 'assets/images/artwork/no6.png'),
(4, 'IT\'z ICY', 2, 4, 'assets/images/artwork/icy.jpg'),
(5, 'Shawn Mendes', 10, 1, 'assets/images/artwork/shawn.jpg'),
(6, 'Map of the Soul: Persona', 3, 4, 'assets/images/artwork/persona.jpg'),
(7, 'KILL THIS LOVE -EP', 5, 4, 'assets/images/artwork/killthislove.png'),
(8, '&TWICE', 1, 4, 'assets/images/artwork/twice2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`) VALUES
(1, 'TWICE'),
(2, 'ITZY'),
(3, 'BTS'),
(4, 'GFRIEND'),
(5, 'BlackPink'),
(6, 'Taylor Swift'),
(7, 'Ariana Grande'),
(8, 'Ed Sheeran'),
(9, 'Camila Cabello'),
(10, 'Shawn Mendes');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'International Pop'),
(2, 'Dance/Electronic'),
(3, 'Hip-hop/Rap'),
(4, 'K-Pop'),
(5, 'R & B'),
(6, 'Rock'),
(7, 'Classical'),
(8, 'Jazz'),
(9, 'Country'),
(10, 'Folk/Acoustic');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `owner`, `dateCreated`) VALUES
(2, 'loco', 'donkey', '2019-10-28 00:00:00'),
(3, 'hello', 'donkey', '2019-10-28 00:00:00'),
(5, 'jjjj', 'donkey', '2019-10-28 00:00:00'),
(6, 'awesome', 'user1', '2019-10-28 00:00:00'),
(7, 'Yay', 'user1', '2019-10-28 00:00:00'),
(8, 'eh', 'user1', '2019-10-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `playlistsongs`
--

CREATE TABLE `playlistsongs` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `playlistId` int(11) NOT NULL,
  `playlistOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlistsongs`
--

INSERT INTO `playlistsongs` (`id`, `songId`, `playlistId`, `playlistOrder`) VALUES
(4, 28, 2, 2),
(5, 56, 6, 1),
(6, 3, 6, 2),
(7, 1, 7, 1),
(8, 13, 7, 2),
(10, 43, 6, 3),
(12, 15, 6, 4),
(13, 5, 6, 5),
(14, 59, 8, 1),
(15, 1, 5, 1),
(16, 45, 2, 3),
(17, 1, 3, 1),
(18, 8, 5, 2),
(19, 10, 2, 4),
(20, 7, 3, 2),
(21, 7, 2, 5),
(22, 8, 2, 6),
(23, 1, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `duration` varchar(8) NOT NULL,
  `path` varchar(500) NOT NULL,
  `albumOrder` int(11) NOT NULL,
  `plays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `artist`, `album`, `genre`, `duration`, `path`, `albumOrder`, `plays`) VALUES
(1, 'I Forgot That You Existed', 6, 1, 1, '2:50', 'assets/music/I Forgot That You Existed - Taylor Swift.mp3', 1, 30),
(2, 'Fake & True', 1, 8, 4, '3:39', 'assets/music/Fake True - Twice.mp3', 1, 3),
(3, 'Breakthrough', 1, 8, 4, '03:37', 'assets/music/Breakthrough - Twice.mp3', 2, 8),
(4, 'Happy Happy', 1, 8, 4, '3:27', 'assets/music/Happy Happy - Twice.mp3', 4, 4),
(5, 'Easy', 9, 2, 1, '3:16', 'assets/music/Easy - Camila Cabello.mp3', 3, 6),
(6, 'Ddu Ddu Ddu', 5, 7, 4, '3:21', 'assets/music/Ddu-Du Ddu-Du Remix_ - BlackPink.mp3', 1, 9),
(7, 'Dont Know What To Do', 5, 7, 4, '3:21', 'assets/music/Don_t Know What To Do - BlackPink.mp3', 2, 6),
(8, 'Hope Not', 5, 7, 4, '3:11', 'assets/music/Hope Not - BlackPink.mp3', 3, 15),
(9, 'Kick It', 5, 7, 4, '3	:11', 'assets/music/Kick It - BlackPink.mp3', 4, 9),
(10, 'Kill This Love', 5, 7, 4, '3:09', 'assets/music/Kill This Love - BlackPink.mp3', 5, 8),
(11, 'Cruel Summer', 6, 1, 1, '2:58', 'assets/music/02.-Cruel-Summer.mp3', 2, 12),
(12, 'Lover', 6, 1, 1, '3:41', 'assets/music/03.-Lover.mp3', 3, 11),
(13, 'The Man', 6, 1, 1, '3:10', 'assets/music/04.-The-Man.mp3', 4, 36),
(14, 'The Archer', 6, 1, 1, '3:31', 'assets/music/05.-The-Archer.mp3', 5, 12),
(15, 'I Think We Know', 6, 1, 1, '2:53', 'assets/music/06.-I-Think-He-Knows.mp3', 6, 5),
(16, 'Miss Americana', 6, 1, 1, '3:54', 'assets/music/07.-Miss-Americana.mp3', 7, 2),
(17, 'Paper Heart', 6, 1, 1, '3:42', 'assets/music/08.-Paper-Hearts.mp3', 8, 3),
(18, 'Cornelia Street', 6, 1, 1, '4:48', 'assets/music/09.-Cornelia-Street.mp3', 9, 3),
(19, 'Dead By A Thousand Cut', 6, 1, 1, '3:18', 'assets/music/10.-Death-By-A-Thousand-Cuts.mp3', 10, 3),
(20, 'London Boy', 6, 1, 1, '3:10', 'assets/music/11.-London-Boy.mp3', 11, 3),
(21, 'Soon You\"ll get better', 6, 1, 1, '3:21', 'assets/music/12.-Soon-You_ll-Get-Better.mp3', 12, 3),
(22, 'False God', 6, 1, 1, '3:20', 'assets/music/13.-False-God.mp3', 13, 12),
(23, 'You Need To Calm Down', 6, 1, 1, '2:51', 'assets/music/14.-You-Need-To-Calm-Down.mp3', 14, 1),
(24, 'Afterglow', 6, 1, 1, '3:43', 'assets/music/15.-Afterglow.mp3', 15, 2),
(25, 'ME', 6, 1, 1, '3:13', 'assets/music/16.-ME-feat.-Brendon-Urie-of-Panic-At-The-Disco.mp3', 16, 2),
(26, 'Its Nice To Have A Friend', 6, 1, 1, '2:30', 'assets/music/17.-Its-Nice-To-Have-A-Friend.mp3', 17, 1),
(28, 'BeautifulPeople', 8, 3, 8, '3:18', 'assets/music/01.-Beautiful-People-feat.-Khalid.mp3', 1, 3),
(29, 'Soul of the Border', 8, 3, 8, '3:24', 'assets/music/02.-South-of-the-Border-feat.-Camila-Cabello-Cardi-B.mp3', 2, 0),
(30, 'Cross Me', 8, 3, 8, '3:26', 'assets/music/03.-Cross-Me.mp3', 3, 1),
(31, 'Take ME back to London ', 8, 3, 8, '3:09', 'assets/music/04.-Take-Me-Back-To-London.mp3', 4, 0),
(32, 'Best Part Of ME', 8, 3, 8, '4:03', 'assets/music/05.-Best-Part-Of-Me.mp3', 5, 0),
(33, 'I dont Care ', 8, 3, 8, '3:40', 'assets/music/06.-I-Dont-Care.mp3', 6, 2),
(34, 'Antisocial', 8, 3, 8, '2:41', 'assets/music/07.-Antisocial.mp3', 7, 0),
(35, 'Remember The Name ', 8, 3, 8, '3:27', 'assets/music/08.-Remember-The-Name.mp3', 8, 1),
(36, 'Feels', 8, 3, 8, '2:30', 'assets/music/09.-Feels.mp3', 9, 1),
(37, 'Put It All On ME', 8, 3, 8, '3:17', 'assets/music/10.-Put-It-All-On-Me.mp3', 10, 3),
(38, 'Nothing On You ', 8, 3, 8, '3:20', 'assets/music/11.-Nothing-On-You.mp3', 11, 4),
(39, '1000 Nights ', 8, 3, 8, '3:32', 'assets/music/13.-1000-Nights.mp3', 13, 1),
(40, 'Way to break my heart ', 8, 3, 8, '3:10', 'assets/music/14.-Way-To-Break-My-Heart.mp3', 14, 1),
(41, 'Blow', 8, 3, 8, '3:31', 'assets/music/15.-Blow.mp3', 15, 1),
(42, 'I dont want your Money', 8, 3, 8, '3:24', 'assets/music/16-Ed-Sheeran-I-Dont-Want-Your-Money-feat.-H.E.R..mp3', 16, 3),
(43, 'Senorita', 10, 5, 1, '3:10', 'assets/music/1-Señorita.mp3', 1, 0),
(44, 'Lost In Japan', 10, 5, 1, '3:20', 'assets/music/2-Lost-In-Japan.mp3', 2, 2),
(45, 'If I Cant Have You', 10, 5, 1, '3:11', 'assets/music/3-If-I-Cant-Have-You.mp3', 3, 3),
(46, 'In My Blood', 10, 5, 1, '3:31', 'assets/music/4-In-My-Blood.mp3', 4, 2),
(47, 'Fallin All In You', 10, 5, 1, '3:55', 'assets/music/5-Fallin-All-In-You.mp3', 5, 5),
(48, 'Where Were You In The Morning', 10, 5, 1, '3:20', 'assets/music/6-Where-Were-You-In-The-Morning_.mp3', 6, 4),
(49, 'Nervous', 10, 5, 1, '2:44', 'assets/music/7-Nervous.mp3', 7, 0),
(50, 'Like To Be You', 10, 5, 1, '2:39', 'assets/music/8-Like-To-Be-You.mp3', 8, 4),
(51, 'Particular Taste', 10, 5, 1, '2:55', 'assets/music/9-Particular-Taste.mp3', 9, 3),
(52, 'Because I Had You', 10, 5, 1, '2:22', 'assets/music/10-Because-I-Had-You.mp3', 10, 4),
(53, 'Why', 10, 5, 1, '3:58', 'assets/music/10-Because-I-Had-You.mp3', 11, 3),
(54, 'Youth', 10, 5, 1, '3:10', 'assets/music/12-Youth.mp3', 12, 2),
(55, 'Perfectly Wrong', 10, 5, 1, '3:32', 'assets/music/13-Perfectly-Wrong.mp3', 13, 7),
(56, 'Mutual', 10, 5, 1, '2:28', 'assets/music/14-Mutual.mp3', 14, 20),
(57, 'Queen', 10, 5, 1, '3:24', 'assets/music/15-Queen.mp3', 15, 0),
(58, 'When-Youre-Ready', 10, 5, 1, '2:49', 'assets/music/16-When-Youre-Ready.mp3', 16, 2),
(59, 'Boy with Luv', 3, 6, 4, '3:52', 'assets/music/Boy With Luv.m4a', 1, 3),
(60, 'Dionysus', 3, 6, 4, '4:18', 'assets/music/Dionysus.m4a', 2, 7),
(61, 'HOME', 3, 6, 4, '3:55', 'assets/music/HOME.m4a', 3, 1),
(62, 'Jamais Vu', 3, 6, 4, '3:47', 'assets/music/Jamais Vu.m4a', 4, 4),
(63, 'Make It Right', 3, 6, 4, '3:53', 'assets/music/Make It Righ.m4a', 5, 0),
(64, 'Mikrokosmos ', 3, 6, 4, '3:39', 'assets/music/Mikrokosmos.m4a', 6, 0),
(65, 'Persona', 3, 6, 4, '2:53', 'assets/music/PERSONA.m4a', 7, 2),
(66, 'ICY', 2, 4, 4, '3:11', 'assets/music/Icy - ITZY.mp3', 1, 62),
(67, 'Cherry', 2, 4, 4, '3:10', 'assets/music/Cherry-Itzy.mp3', 2, 27),
(68, 'Dalla Dalla DallaskRemix', 2, 4, 4, '3:10', 'assets/music/DallaDallaDallaskRemix-Itzy.mp3', 3, 8),
(69, 'ITz Summer', 2, 4, 4, '3:17', 'assets/music/ITz Summer-Itzy.mp3', 4, 2),
(70, 'Want It (ImadRoyalRemix)-Itzy', 2, 4, 4, '3:27', 'assets/music/Want It (ImadRoyalRemix)-Itzy.mp3', 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(100) NOT NULL,
  `signUpDate` datetime NOT NULL,
  `profilePic` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `password`, `signUpDate`, `profilePic`) VALUES
(3, 'user1', 'Bart', 'Simpson', 'Bartsimpson@example.com', 'e10adc3949ba59abbe56e057f20f883e', '2019-10-17 00:00:00', 'assets/images/profile-pics/profilepic1.png'),
(4, 'donkey', 'Gordon', 'Ramsay', 'Gordonramsay1@hellkitchen.com', 'e10adc3949ba59abbe56e057f20f883e', '2019-10-17 00:00:00', 'assets/images/profile-pics/profilepic1.png'),
(5, 'ThanhPhanPhu', 'Thanh', 'Phan', 'Thanhpp@example.com', '25d55ad283aa400af464c76d713c07ad', '2019-10-17 00:00:00', 'assets/images/profile-pics/profilepic1.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlistsongs`
--
ALTER TABLE `playlistsongs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `playlistsongs`
--
ALTER TABLE `playlistsongs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
