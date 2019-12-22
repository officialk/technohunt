-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2019 at 08:56 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `technohunt`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `teamID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `answerGiven` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `content` varchar(100) NOT NULL,
  `isAnswer` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `questionId`, `content`, `isAnswer`) VALUES
(1, 1, '4', 0),
(2, 1, '2', 1),
(3, 1, '1', 0),
(4, 1, '8', 0),
(5, 2, 'Security', 0),
(6, 2, 'Privacy', 0),
(7, 2, 'Maintenance', 0),
(8, 2, 'All of the above', 1),
(9, 3, '13', 0),
(10, 3, '14', 0),
(11, 3, '15', 0),
(12, 3, '16', 1),
(13, 4, 'Captain America', 1),
(14, 4, 'Captain Marvel', 0),
(15, 4, 'Iron Man', 0),
(16, 4, 'Hulk', 0),
(17, 5, 'Captain America', 0),
(18, 5, 'Captain Marvel', 0),
(19, 5, 'Iron Man', 1),
(20, 5, 'Hulk', 0),
(21, 6, '$', 0),
(22, 6, '/', 0),
(23, 6, '#', 1),
(24, 6, '<', 0),
(25, 7, 'Ironman', 0),
(26, 7, 'Avengers', 0),
(27, 7, 'Avengers: Endgame', 1),
(28, 7, 'Captain America: The First Avenger', 0),
(29, 8, 'Natasha Romanoff', 0),
(30, 8, 'Okoye', 0),
(31, 8, 'Gamora', 0),
(32, 8, 'Carol Danvers', 1),
(33, 9, 'Vibranium', 0),
(34, 9, 'Space Stone', 1),
(35, 9, 'Soul Stone', 0),
(36, 9, 'Jarvis', 0),
(37, 10, 'Bucky Barnes', 0),
(38, 10, 'Steve Rogers', 1),
(39, 10, 'Nick Fury', 0),
(40, 10, 'Sam Wilson', 0),
(41, 11, 'Iron Man', 0),
(42, 11, 'Captain America', 0),
(43, 11, 'Black Widow', 1),
(44, 11, 'Ant-Man', 0),
(45, 12, 'Nebula', 0),
(46, 12, 'Morgan', 1),
(47, 12, 'Pepper', 0),
(48, 12, 'Dyne', 0),
(49, 13, '20', 0),
(50, 13, '21', 0),
(51, 13, '22', 0),
(52, 13, '23', 1),
(53, 14, 'Mjolnir', 0),
(54, 14, 'Storm Breaker', 1),
(55, 14, 'Tesseract', 0),
(56, 14, 'Infinity Gauntlet', 0),
(57, 15, 'Quill', 0),
(58, 15, 'Gamora', 0),
(59, 15, 'Groot', 1),
(60, 15, 'Nebula', 0),
(61, 16, 'Black Widow', 0),
(62, 16, 'Red Skull', 1),
(63, 16, 'Ivan Vanko', 0),
(64, 16, 'Arnim Zola', 0),
(65, 17, 'Kree', 1),
(66, 17, 'Chittauri', 0),
(67, 17, 'Skrull', 0),
(68, 17, 'Xandarian', 0),
(69, 18, 'Burritos', 0),
(70, 18, 'Pizza', 0),
(71, 18, 'Fondue', 0),
(72, 18, 'Shawarma', 1),
(73, 19, 'Rocket Raccoon', 1),
(74, 19, 'Bucky Barnes', 0),
(75, 19, 'Loki', 0),
(76, 19, 'Bruce Banner', 0),
(77, 20, 'Function', 0),
(78, 20, 'Operator', 1),
(79, 20, 'Macro', 0),
(80, 20, 'None of these', 0),
(81, 21, 'Donkey Kong', 0),
(82, 21, 'Galaga', 1),
(83, 21, 'Pac-Man', 0),
(84, 21, 'Space Invaders', 0),
(85, 22, 'Star-Queen', 0),
(86, 22, 'Jane Quill', 0),
(87, 22, 'Meredith Quill', 1),
(88, 22, 'Joan Quill', 0),
(89, 23, 'James \'Rhodey\' Rhodes', 0),
(90, 23, 'Pepper Potts', 0),
(91, 23, 'President Ellis', 0),
(92, 23, 'Happy Hogan', 1),
(93, 24, 'About 50 years', 0),
(94, 24, 'About 100 years', 0),
(95, 24, 'About 70 years', 1),
(96, 24, 'About 60 years', 0),
(97, 25, 'Dr. Johan Schmidt', 0),
(98, 25, 'Dr. Abraham Erskine', 1),
(99, 25, 'Dr. Eli Wiesel', 0),
(100, 25, 'Dr. Arnim Zola', 0),
(101, 26, 'The Pillagers', 0),
(102, 26, 'The Ravagers', 1),
(103, 26, 'The Reavers', 0),
(104, 26, 'The Grievers', 0),
(105, 27, 'Happy Hogan', 0),
(106, 27, 'Drax', 0),
(107, 27, 'Thanos', 1),
(108, 27, 'Lady Sif', 0),
(109, 28, 'Tony Stark', 0),
(110, 28, 'Nick Fury', 0),
(111, 28, 'Happy Hogan', 1),
(112, 28, 'Captain America', 0),
(113, 29, 'ceil(1.66)', 1),
(114, 29, 'floor(1.66)', 0),
(115, 29, 'roundto(1.66)', 0),
(116, 29, 'roundup(1.66)', 0),
(117, 30, 'T4R', 0),
(118, 30, 'T4G', 1),
(119, 30, 'G5T', 0),
(120, 30, 'R5G', 0),
(121, 31, '4800', 0),
(122, 31, '2400', 0),
(123, 31, '3600', 1),
(124, 31, '2000', 0),
(125, 32, '5km', 0),
(126, 32, '6km', 0),
(127, 32, '12km', 0),
(128, 32, '13km', 1),
(129, 33, 'America, Albania', 0),
(130, 33, 'Neutron, Narrative ', 0),
(131, 33, 'Mjolnir, Millier', 1),
(132, 33, 'Sakaaran, Scepter', 0),
(133, 34, 'Captain America <= Thanos', 0),
(134, 34, 'Star-Lord > Captain America', 1),
(135, 34, 'Gamora < Vision', 0),
(136, 34, 'Captain Marvel > Vision', 0),
(137, 35, '65 years', 0),
(138, 35, '90 years', 0),
(139, 35, '81 years', 0),
(140, 35, '87 years', 1),
(141, 36, 'Brother', 1),
(142, 36, 'Nephew', 0),
(143, 36, 'Uncle', 0),
(144, 36, 'Son-in-law', 0),
(145, 37, '>=, >, =, <=', 1),
(146, 37, '>=, >=, =, <=', 0),
(147, 37, '>, >=, <, <=', 0),
(148, 37, '>, >, >=, =', 0),
(149, 38, 'H is the daughter of B', 0),
(150, 38, 'G is the only child of his parents', 0),
(151, 38, 'P is the father of G', 1),
(152, 38, 'T has no sister', 0),
(153, 39, '5.5m towards west', 0),
(154, 39, '3.5m towards north', 0),
(155, 39, '7m towards east', 0),
(156, 39, '3.5m towards south', 1),
(157, 40, 'mp er bj', 0),
(158, 40, 'tk vs fg', 1),
(159, 40, 'vs da mp', 0),
(160, 40, 'wi tk vs', 0);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `title`, `content`, `points`) VALUES
(1, 'In gcc, how many bytes does an int take?', '', 1),
(2, 'What does OOP assure?', '', 1),
(3, 'How much is num?', 'char x[num]=\"avengers:endgame\";', 1),
(4, 'Who was titled the First Avenger in the MCU?', '', 1),
(5, 'Which Avenger does not have superpowers?', '', 1),
(6, 'What symbol is used for a preprocessor directive?', '', 1),
(7, 'Which was the highest-grossing movie in the MCU?', '', 1),
(8, 'What is Captain Marvel\'s real name?', '', 1),
(9, 'What is the Tesseract also called?', '', 1),
(10, 'What is Captain America\'s real name?', '', 1),
(11, 'Which one of these heroes died before the end battle?', '', 1),
(12, 'What is the name of Tony Stark\'s daughter?', '', 1),
(13, 'How many movies are there in the MCU Infinity Saga?', '', 1),
(14, 'Forged in the heart of a dying star, what is the name of Thor\'s Weapon?', '', 1),
(15, 'Who is made of Wood In the MCU', '', 1),
(16, 'Who said it?', '\"Arrogance may not be a uniquely American trait, but I must say, you do it better than anyone.\"', 1),
(17, 'What race is Ronan the Accuser?', '', 1),
(18, 'What kind of food does Tony Stark suggest the Avengers eat after saving New York in \'The Avengers\'?', '', 1),
(19, 'Who said it?', '\"I didn\'t ask to be torn apart and put back together over and over and turned into some little monster!\"', 1),
(20, 'What is sizeof() in C?', '', 1),
(21, 'What classic video game does Tony Stark catch someone playing on the S.H.I.E.L.D. heli-carrier in \'The Avengers\'?', '', 1),
(22, 'What was the name of Star-Lord\'s mother?', '', 1),
(23, 'Which of these characters DID NOT wear an Iron Man suit in \'Iron Man 3\'?', '', 1),
(24, 'For how long was Captain America asleep before being thawed from a deep freeze?', '', 1),
(25, 'Name this character, who developed the super soldier serum in \'Captain America.\'', '', 1),
(26, 'What was the name of the group of mercenaries who raised Star-Lord?', '', 1),
(27, 'Which character from the following have been recast in the MCU?', '', 1),
(28, 'Which character in the MCU has acted as well as directed one of the movies in MCU?', '', 1),
(29, 'How would you round off a value from 1.66 to 2.0?', '', 1),
(30, 'How is the word \'GREAT\' coded in the given language?', '\'Too clever is dumb\' is coded as \'S1I B3D O2T R5C\'; \'You are your choices\' is coded as \'E2A R3Y U2Y S6C\'; \'Good things take time\' is coded as \'S5T E3T D3G E3T\'; \'Keep calm and solve\' is coded as \'D2A P3K E4S M3C\'.', 1),
(31, 'Solve the Problem', 'Each month, starting from the beginning of the year, from her monthly allowance, Pooja pays 20% towards college fees. From the remaining amount she keeps aside 20% in her personal fund for a travel trip and 30% for sundry expenses. At the end of the year, if the total amount in her travel fund was Rs. 28,800, how much did she keep aside each month for sundry expenses?', 1),
(32, 'Solve the Problem', 'Sohit went in his car to meet his friend Mohit. He drove 30 km towards North and reaches point A. He then drove 40 km toward West to reach point B. He then turned to South and covered 8 km to reach point C further he turned to East and moved 26 km and reaches points D. Finally, he turned right and drove 10 km to the point E and then turned left to travel 19 km to his friend Mohit.', 1),
(33, 'As per the given coding scheme, the code for which of the following pairs of words will be the same? ', '\'treated Patient for money\' is coded as tA7 fO3 pI7 mN5\' \'student letting false stories\' is coded as\'fL5 lT7 sD7 sR7\' \'mending the display screens\' is coded as \'sE7 tH3 dP7 mD7\' \'changes for doing job\' is coded as \'jO3 fO3 dI5 cN7\' (All the given codes comprise of two English alphabets and a number).', 1),
(34, 'which of the following conclusions is definitely false?', 'If the expressions \"Wanda <= Vision < Thanos > Gamora <= Captain America; Star-Lord <= Gamora <= Captain Marvel\" are true', 1),
(35, 'Solve The Problem', 'Wanda\'s age six years ago was equal to twice of Peter\'s age four years ago. Natasha is nine years elder to Peter and also nine years younger to Wanda. What is the sum of present ages of Wanda, Peter and Natasha?', 1),
(36, 'Introducing a boy, a girl said, \"He is the son of the daughter of the father of my uncle\". How is the boy related to the girl?', '', 1),
(37, 'Solve The Problem', 'Which of the following should be placed respectively (in the same order from left to right) in order to complete the given expression in such a manner that both \'S > P\' as well as \'A <= E\' definitely hold true?', 1),
(38, 'If G is the son of H, H is the daughter of T, B is the brother of T and P is married to H, then which of the following statements is definitely true?', '', 1),
(39, 'Solve The Problem', 'Gamora starts from point F, walks 6m to the north and reaches Point E. She then takes a right turn and walks 5m. She again takes a right turn, walks for 10m and reaches point G. She finally takes a right turn and walks 8m and stops at point D. Nebula, who is standing at point M which is 7m to the west of point F walks 7m towards the south, takes a left turn and walks for 7m. She finally takes a left turn and after walking for 3.5m stops at point S. How far and in which direction is Nebula\'s final position with respect to point F?', 1),
(40, 'What may be the possible code for \'soon with lyrics\' in the given code language?', '\'new series launching soon\' is coded as \'tk nh mp er\' \'launching fresh adventure series\' is coded as \'er lo nh wi\' \'rebuilt status coming soon\' is coded as \'bj yu tk fg\' \'coming with fresh results\' is coded as \'fg wi yu da\' (All codes are two letter codes only)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `round`
--

DROP TABLE IF EXISTS `round`;
CREATE TABLE IF NOT EXISTS `round` (
  `teamId` int(11) NOT NULL,
  `round` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `leftWindow` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `round1answers`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `round1answers`;
CREATE TABLE IF NOT EXISTS `round1answers` (
`qid` int(11)
,`pts` int(11)
,`answer` int(11)
,`team` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `teamdet`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `teamdet`;
CREATE TABLE IF NOT EXISTS `teamdet` (
`name` varchar(30)
,`pass` varchar(20)
,`stat` tinyint(1)
,`players` text
,`points` decimal(32,0)
,`round` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `teamlist`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `teamlist`;
CREATE TABLE IF NOT EXISTS `teamlist` (
`tid` int(11)
,`name` varchar(30)
,`pass` varchar(20)
,`players` text
,`stat` tinyint(1)
,`points` decimal(32,0)
,`round` bigint(11)
,`leftWindow` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(30) NOT NULL,
  `isAlive` tinyint(1) NOT NULL,
  `isLoggedIn` varchar(40) NOT NULL,
  `memberNames` text NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `teamName`, `isAlive`, `isLoggedIn`, `memberNames`, `password`) VALUES
(1, 'team1', 1, '::1', 'Karthik Koppaka,Shubham Shirpurkar', '643124'),
(2, 'team2', 1, '::1', '', '622984'),
(3, 'team3', 1, '::1', '', '322198'),
(4, 'team4', 1, '::1', '', '657656'),
(5, 'team5', 1, '::1', '', '435854'),
(6, 'team6', 1, '::1', '', '618035'),
(7, 'team7', 1, '::1', '', '512002'),
(8, 'team8', 1, '::1', '', '435887'),
(9, 'team9', 1, '::1', '', '222587'),
(10, 'team10', 1, '::1', '', '027133'),
(11, 'team11', 1, '::1', '', '866884'),
(12, 'team12', 1, '::1', '', '948734'),
(13, 'team13', 1, '::1', '', '148294'),
(14, 'team14', 1, '::1', '', '943268'),
(15, 'team15', 1, '::1', '', '613411'),
(16, 'team16', 1, '::1', '', '623803'),
(17, 'team17', 1, '::1', '', '771882'),
(18, 'team18', 1, '::1', '', '473048'),
(19, 'team19', 1, '::1', '', '655887'),
(20, 'team20', 1, '::1', '', '875374'),
(21, 'team21', 1, '::1', '', '857173'),
(22, 'team22', 1, '::1', '', '680814'),
(23, 'team23', 1, '::1', '', '666634'),
(24, 'team24', 1, '::1', '', '588518'),
(25, 'team25', 1, '::1', '', '770678'),
(26, 'team26', 1, '::1', '', '155416'),
(27, 'team27', 1, '::1', '', '408218'),
(28, 'team28', 1, '::1', '', '662883'),
(29, 'team29', 1, '::1', '', '377175'),
(30, 'team30', 1, '::1', '', '322641'),
(31, 'team31', 1, '::1', '', '674469'),
(32, 'team32', 1, '::1', '', '689628'),
(33, 'team33', 1, '::1', '', '875258'),
(34, 'team34', 1, '::1', '', '830583'),
(35, 'team35', 1, '::1', '', '519801'),
(36, 'team36', 1, '::1', '', '244718'),
(37, 'team37', 1, '::1', '', '427527'),
(38, 'team38', 1, '::1', '', '136262'),
(39, 'team39', 1, '::1', '', '591253'),
(40, 'team40', 1, '::1', '', '332546'),
(41, 'team41', 1, '::1', '', '551434'),
(42, 'team42', 1, '::1', '', '303458'),
(43, 'team43', 1, '::1', '', '458607'),
(44, 'team44', 1, '::1', '', '245408'),
(45, 'team45', 1, '::1', '', '180418'),
(46, 'team46', 1, '::1', '', '715775'),
(47, 'team47', 1, '::1', '', '485101'),
(48, 'team48', 1, '::1', '', '306715'),
(49, 'team49', 1, '::1', '', '222134'),
(50, 'team50', 1, '::1', '', '451893'),
(51, 'team51', 1, '::1', '', '854648'),
(52, 'team52', 1, '::1', '', '400417'),
(53, 'team53', 1, '::1', '', '018532'),
(54, 'team54', 1, '::1', '', '631232'),
(55, 'team55', 1, '::1', '', '056865'),
(56, 'team56', 1, '::1', '', '923114'),
(57, 'team57', 1, '::1', '', '673215'),
(58, 'team58', 1, '::1', '', '218057'),
(59, 'team59', 1, '::1', '', '566483'),
(60, 'team60', 1, '::1', '', '474236'),
(61, 'team61', 1, '::1', '', '611288'),
(62, 'team62', 1, '::1', '', '148046'),
(63, 'team63', 1, '::1', '', '323299'),
(64, 'team64', 1, '::1', '', '191260'),
(65, 'team65', 1, '::1', '', '476424'),
(66, 'team66', 1, '::1', '', '859884'),
(67, 'team67', 1, '::1', '', '358180'),
(68, 'team68', 1, '::1', '', '751841'),
(69, 'team69', 1, '::1', '', '683113'),
(70, 'team70', 1, '::1', '', '125777'),
(71, 'team71', 1, '::1', '', '288184'),
(72, 'team72', 1, '::1', '', '344146'),
(73, 'team73', 1, '::1', '', '672679'),
(74, 'team74', 1, '::1', '', '842692'),
(75, 'team75', 1, '::1', '', '066201'),
(76, 'team76', 1, '::1', '', '647954'),
(77, 'team77', 1, '::1', '', '731227'),
(78, 'team78', 1, '::1', '', '552048'),
(79, 'team79', 1, '::1', '', '271428'),
(80, 'team80', 1, '::1', '', '429245'),
(81, 'team81', 1, '::1', '', '657752'),
(82, 'team82', 1, '::1', '', '828277'),
(83, 'team83', 1, '::1', '', '246166'),
(84, 'team84', 1, '::1', '', '830559'),
(85, 'team85', 1, '::1', '', '712813'),
(86, 'team86', 1, '::1', '', '991120'),
(87, 'team87', 1, '::1', '', '987543'),
(88, 'team88', 1, '::1', '', '715318'),
(89, 'team89', 1, '::1', '', '432815'),
(90, 'team90', 1, '::1', '', '484345'),
(91, 'team91', 1, '::1', '', '322144'),
(92, 'team92', 1, '::1', '', '791167'),
(93, 'team93', 1, '::1', '', '811277'),
(94, 'team94', 1, '::1', '', '263101'),
(95, 'team95', 1, '::1', '', '086383'),
(96, 'team96', 1, '::1', '', '287056'),
(97, 'team97', 1, '::1', '', '237554'),
(98, 'team98', 1, '::1', '', '759465'),
(99, 'team99', 1, '::1', '', '071263'),
(100, 'team100', 1, '::1', '', '275883'),
(101, 'team101', 1, '::1', '', '783555'),
(102, 'team102', 1, '::1', '', '862817'),
(103, 'team103', 1, '::1', '', '788212'),
(104, 'team104', 1, '::1', '', '348353'),
(105, 'team105', 1, '::1', '', '692884'),
(106, 'team106', 1, '::1', '', '721878'),
(107, 'team107', 1, '::1', '', '579357'),
(108, 'team108', 1, '::1', '', '264293'),
(109, 'team109', 1, '::1', '', '705861'),
(110, 'team110', 1, '::1', '', '813446'),
(111, 'team111', 1, '::1', '', '137969'),
(112, 'team112', 1, '::1', '', '513783'),
(113, 'team113', 1, '::1', '', '101684'),
(114, 'team114', 1, '::1', '', '969391'),
(115, 'team115', 1, '::1', '', '478536'),
(116, 'team116', 1, '::1', '', '763151'),
(117, 'team117', 1, '::1', '', '868753'),
(118, 'team118', 1, '::1', '', '691181'),
(119, 'team119', 1, '::1', '', '372969'),
(120, 'team120', 1, '::1', '', '504300'),
(121, 'team121', 1, '::1', '', '847557'),
(122, 'team122', 1, '::1', '', '841370'),
(123, 'team123', 1, '::1', '', '755284'),
(124, 'team124', 1, '::1', '', '105447'),
(125, 'team125', 1, '::1', '', '513252'),
(126, 'team126', 1, '::1', '', '840863'),
(127, 'team127', 1, '::1', '', '470384'),
(128, 'team128', 1, '::1', '', '925109'),
(129, 'team129', 1, '::1', '', '147613'),
(130, 'team130', 1, '::1', '', '046913'),
(131, 'team131', 1, '::1', '', '346484'),
(132, 'team132', 1, '::1', '', '160140'),
(133, 'team133', 1, '::1', '', '136942'),
(134, 'team134', 1, '::1', '', '118882'),
(135, 'team135', 1, '::1', '', '520991'),
(136, 'team136', 1, '::1', '', '436462'),
(137, 'team137', 1, '::1', '', '728685'),
(138, 'team138', 1, '::1', '', '663087'),
(139, 'team139', 1, '::1', '', '126826'),
(140, 'team140', 1, '::1', '', '902647'),
(141, 'team141', 1, '::1', '', '895379'),
(142, 'team142', 1, '::1', '', '656768'),
(143, 'team143', 1, '::1', '', '842592'),
(144, 'team144', 1, '::1', '', '766577'),
(145, 'team145', 1, '::1', '', '082732'),
(146, 'team146', 1, '::1', '', '754264'),
(147, 'team147', 1, '::1', '', '742365'),
(148, 'team148', 1, '::1', '', '052738'),
(149, 'team149', 1, '::1', '', '099621'),
(150, 'team150', 1, '::1', '', '947470'),
(151, 'team151', 1, '::1', '', '919462'),
(152, 'team152', 1, '::1', '', '225061'),
(153, 'team153', 1, '::1', '', '665918'),
(154, 'team154', 1, '::1', '', '200863'),
(155, 'team155', 1, '::1', '', '178375'),
(156, 'team156', 1, '::1', '', '665537'),
(157, 'team157', 1, '::1', '', '643546'),
(158, 'team158', 1, '::1', '', '055213'),
(159, 'team159', 1, '::1', '', '928647'),
(160, 'team160', 1, '::1', '', '185252'),
(161, 'team161', 1, '::1', '', '358673'),
(162, 'team162', 1, '::1', '', '683433'),
(163, 'team163', 1, '::1', '', '595763'),
(164, 'team164', 1, '::1', '', '662817'),
(165, 'team165', 1, '::1', '', '147661'),
(166, 'team166', 1, '::1', '', '448952'),
(167, 'team167', 1, '::1', '', '897767'),
(168, 'team168', 1, '::1', '', '157156'),
(169, 'team169', 1, '::1', '', '592013'),
(170, 'team170', 1, '::1', '', '524137'),
(171, 'team171', 1, '::1', '', '242537'),
(172, 'team172', 1, '::1', '', '886121'),
(173, 'team173', 1, '::1', '', '155842'),
(174, 'team174', 1, '::1', '', '570701'),
(175, 'team175', 1, '::1', '', '736082'),
(176, 'team176', 1, '::1', '', '418925'),
(177, 'team177', 1, '::1', '', '582511'),
(178, 'team178', 1, '::1', '', '643127'),
(179, 'team179', 1, '::1', '', '733782'),
(180, 'team180', 1, '::1', '', '745709'),
(181, 'team181', 1, '::1', '', '213215'),
(182, 'team182', 1, '::1', '', '548903'),
(183, 'team183', 1, '::1', '', '766349'),
(184, 'team184', 1, '::1', '', '235576'),
(185, 'team185', 1, '::1', '', '186512'),
(186, 'team186', 1, '::1', '', '854294'),
(187, 'team187', 1, '::1', '', '679116'),
(188, 'team188', 1, '::1', '', '705234'),
(189, 'team189', 1, '::1', '', '555508'),
(190, 'team190', 1, '::1', '', '556884'),
(191, 'team191', 1, '::1', '', '611783'),
(192, 'team192', 1, '::1', '', '814361'),
(193, 'team193', 1, '::1', '', '666782'),
(194, 'team194', 1, '::1', '', '704944'),
(195, 'team195', 1, '::1', '', '226416'),
(196, 'team196', 1, '::1', '', '487164'),
(197, 'team197', 1, '::1', '', '266866'),
(198, 'team198', 1, '::1', '', '802462'),
(199, 'team199', 1, '::1', '', '654541'),
(200, 'team200', 1, '::1', '', '541237');

-- --------------------------------------------------------

--
-- Structure for view `round1answers`
--
DROP TABLE IF EXISTS `round1answers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `round1answers`  AS  select `question`.`id` AS `qid`,`question`.`points` AS `pts`,`answers`.`answerGiven` AS `answer`,`teams`.`id` AS `team` from (((`teams` join `answers`) join `question`) join `options`) where ((`teams`.`id` = `answers`.`teamID`) and (`question`.`id` = `answers`.`questionID`) and (`answers`.`answerGiven` = `options`.`id`) and (`options`.`isAnswer` = 1) and (`options`.`questionId` = `question`.`id`)) order by `teams`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `teamdet`
--
DROP TABLE IF EXISTS `teamdet`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teamdet`  AS  select `teams`.`teamName` AS `name`,`teams`.`password` AS `pass`,`teams`.`isAlive` AS `stat`,(select coalesce(`teamlist`.`players`,'') from `teamlist` where (`teamlist`.`tid` = `teams`.`id`)) AS `players`,(select coalesce(`teamlist`.`points`,0) from `teamlist` where (`teamlist`.`tid` = `teams`.`id`)) AS `points`,(select coalesce(`teamlist`.`round`,0) from `teamlist` where (`teamlist`.`tid` = `teams`.`id`)) AS `round` from `teams` order by (select coalesce(`teamlist`.`round`,0) from `teamlist` where (`teamlist`.`tid` = `teams`.`id`)),(select coalesce(`teamlist`.`points`,0) from `teamlist` where (`teamlist`.`tid` = `teams`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `teamlist`
--
DROP TABLE IF EXISTS `teamlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teamlist`  AS  select `teams`.`id` AS `tid`,`teams`.`teamName` AS `name`,`teams`.`password` AS `pass`,`teams`.`memberNames` AS `players`,`teams`.`isAlive` AS `stat`,coalesce(sum(`round`.`points`),0) AS `points`,coalesce(max(`round`.`round`),0) AS `round`,coalesce(sum(`round`.`leftWindow`),0) AS `leftWindow` from (`round` join `teams`) where (`teams`.`id` = `round`.`teamId`) group by `round`.`teamId` order by sum(`round`.`points`) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
