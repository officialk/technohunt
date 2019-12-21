-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2019 at 04:15 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `round` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
,`correct` int(11)
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
  `isLoggedIn` tinyint(1) NOT NULL,
  `memberNames` text NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `teamName`, `isAlive`, `isLoggedIn`, `memberNames`, `password`) VALUES
(1, 'team1', 0, 0, '', '643124'),
(2, 'team2', 0, 0, '', '622984'),
(3, 'team3', 0, 0, '', '322198'),
(4, 'team4', 0, 0, '', '657656'),
(5, 'team5', 0, 0, '', '435854'),
(6, 'team6', 0, 0, '', '618035'),
(7, 'team7', 0, 0, '', '512002'),
(8, 'team8', 0, 0, '', '435887'),
(9, 'team9', 0, 0, '', '222587'),
(10, 'team10', 0, 0, '', '027133'),
(11, 'team11', 0, 0, '', '866884'),
(12, 'team12', 0, 0, '', '948734'),
(13, 'team13', 0, 0, '', '148294'),
(14, 'team14', 0, 0, '', '943268'),
(15, 'team15', 0, 0, '', '613411'),
(16, 'team16', 0, 0, '', '623803'),
(17, 'team17', 0, 0, '', '771882'),
(18, 'team18', 0, 0, '', '473048'),
(19, 'team19', 0, 0, '', '655887'),
(20, 'team20', 0, 0, '', '875374'),
(21, 'team21', 0, 0, '', '857173'),
(22, 'team22', 0, 0, '', '680814'),
(23, 'team23', 0, 0, '', '666634'),
(24, 'team24', 0, 0, '', '588518'),
(25, 'team25', 0, 0, '', '770678'),
(26, 'team26', 0, 0, '', '155416'),
(27, 'team27', 0, 0, '', '408218'),
(28, 'team28', 0, 0, '', '662883'),
(29, 'team29', 0, 0, '', '377175'),
(30, 'team30', 0, 0, '', '322641'),
(31, 'team31', 0, 0, '', '674469'),
(32, 'team32', 0, 0, '', '689628'),
(33, 'team33', 0, 0, '', '875258'),
(34, 'team34', 0, 0, '', '830583'),
(35, 'team35', 0, 0, '', '519801'),
(36, 'team36', 0, 0, '', '244718'),
(37, 'team37', 0, 0, '', '427527'),
(38, 'team38', 0, 0, '', '136262'),
(39, 'team39', 0, 0, '', '591253'),
(40, 'team40', 0, 0, '', '332546'),
(41, 'team41', 0, 0, '', '551434'),
(42, 'team42', 0, 0, '', '303458'),
(43, 'team43', 0, 0, '', '458607'),
(44, 'team44', 0, 0, '', '245408'),
(45, 'team45', 0, 0, '', '180418'),
(46, 'team46', 0, 0, '', '715775'),
(47, 'team47', 0, 0, '', '485101'),
(48, 'team48', 0, 0, '', '306715'),
(49, 'team49', 0, 0, '', '222134'),
(50, 'team50', 0, 0, '', '451893'),
(51, 'team51', 0, 0, '', '854648'),
(52, 'team52', 0, 0, '', '400417'),
(53, 'team53', 0, 0, '', '018532'),
(54, 'team54', 0, 0, '', '631232'),
(55, 'team55', 0, 0, '', '056865'),
(56, 'team56', 0, 0, '', '923114'),
(57, 'team57', 0, 0, '', '673215'),
(58, 'team58', 0, 0, '', '218057'),
(59, 'team59', 0, 0, '', '566483'),
(60, 'team60', 0, 0, '', '474236'),
(61, 'team61', 0, 0, '', '611288'),
(62, 'team62', 0, 0, '', '148046'),
(63, 'team63', 0, 0, '', '323299'),
(64, 'team64', 0, 0, '', '191260'),
(65, 'team65', 0, 0, '', '476424'),
(66, 'team66', 0, 0, '', '859884'),
(67, 'team67', 0, 0, '', '358180'),
(68, 'team68', 0, 0, '', '751841'),
(69, 'team69', 0, 0, '', '683113'),
(70, 'team70', 0, 0, '', '125777'),
(71, 'team71', 0, 0, '', '288184'),
(72, 'team72', 0, 0, '', '344146'),
(73, 'team73', 0, 0, '', '672679'),
(74, 'team74', 0, 0, '', '842692'),
(75, 'team75', 0, 0, '', '066201'),
(76, 'team76', 0, 0, '', '647954'),
(77, 'team77', 0, 0, '', '731227'),
(78, 'team78', 0, 0, '', '552048'),
(79, 'team79', 0, 0, '', '271428'),
(80, 'team80', 0, 0, '', '429245'),
(81, 'team81', 0, 0, '', '657752'),
(82, 'team82', 0, 0, '', '828277'),
(83, 'team83', 0, 0, '', '246166'),
(84, 'team84', 0, 0, '', '830559'),
(85, 'team85', 0, 0, '', '712813'),
(86, 'team86', 0, 0, '', '991120'),
(87, 'team87', 0, 0, '', '987543'),
(88, 'team88', 0, 0, '', '715318'),
(89, 'team89', 0, 0, '', '432815'),
(90, 'team90', 0, 0, '', '484345'),
(91, 'team91', 0, 0, '', '322144'),
(92, 'team92', 0, 0, '', '791167'),
(93, 'team93', 0, 0, '', '811277'),
(94, 'team94', 0, 0, '', '263101'),
(95, 'team95', 0, 0, '', '086383'),
(96, 'team96', 0, 0, '', '287056'),
(97, 'team97', 0, 0, '', '237554'),
(98, 'team98', 0, 0, '', '759465'),
(99, 'team99', 0, 0, '', '071263'),
(100, 'team100', 0, 0, '', '275883'),
(101, 'team101', 0, 0, '', '783555'),
(102, 'team102', 0, 0, '', '862817'),
(103, 'team103', 0, 0, '', '788212'),
(104, 'team104', 0, 0, '', '348353'),
(105, 'team105', 0, 0, '', '692884'),
(106, 'team106', 0, 0, '', '721878'),
(107, 'team107', 0, 0, '', '579357'),
(108, 'team108', 0, 0, '', '264293'),
(109, 'team109', 0, 0, '', '705861'),
(110, 'team110', 0, 0, '', '813446'),
(111, 'team111', 0, 0, '', '137969'),
(112, 'team112', 0, 0, '', '513783'),
(113, 'team113', 0, 0, '', '101684'),
(114, 'team114', 0, 0, '', '969391'),
(115, 'team115', 0, 0, '', '478536'),
(116, 'team116', 0, 0, '', '763151'),
(117, 'team117', 0, 0, '', '868753'),
(118, 'team118', 0, 0, '', '691181'),
(119, 'team119', 0, 0, '', '372969'),
(120, 'team120', 0, 0, '', '504300'),
(121, 'team121', 0, 0, '', '847557'),
(122, 'team122', 0, 0, '', '841370'),
(123, 'team123', 0, 0, '', '755284'),
(124, 'team124', 0, 0, '', '105447'),
(125, 'team125', 0, 0, '', '513252'),
(126, 'team126', 0, 0, '', '840863'),
(127, 'team127', 0, 0, '', '470384'),
(128, 'team128', 0, 0, '', '925109'),
(129, 'team129', 0, 0, '', '147613'),
(130, 'team130', 0, 0, '', '046913'),
(131, 'team131', 0, 0, '', '346484'),
(132, 'team132', 0, 0, '', '160140'),
(133, 'team133', 0, 0, '', '136942'),
(134, 'team134', 0, 0, '', '118882'),
(135, 'team135', 0, 0, '', '520991'),
(136, 'team136', 0, 0, '', '436462'),
(137, 'team137', 0, 0, '', '728685'),
(138, 'team138', 0, 0, '', '663087'),
(139, 'team139', 0, 0, '', '126826'),
(140, 'team140', 0, 0, '', '902647'),
(141, 'team141', 0, 0, '', '895379'),
(142, 'team142', 0, 0, '', '656768'),
(143, 'team143', 0, 0, '', '842592'),
(144, 'team144', 0, 0, '', '766577'),
(145, 'team145', 0, 0, '', '082732'),
(146, 'team146', 0, 0, '', '754264'),
(147, 'team147', 0, 0, '', '742365'),
(148, 'team148', 0, 0, '', '052738'),
(149, 'team149', 0, 0, '', '099621'),
(150, 'team150', 0, 0, '', '947470'),
(151, 'team151', 0, 0, '', '919462'),
(152, 'team152', 0, 0, '', '225061'),
(153, 'team153', 0, 0, '', '665918'),
(154, 'team154', 0, 0, '', '200863'),
(155, 'team155', 0, 0, '', '178375'),
(156, 'team156', 0, 0, '', '665537'),
(157, 'team157', 0, 0, '', '643546'),
(158, 'team158', 0, 0, '', '055213'),
(159, 'team159', 0, 0, '', '928647'),
(160, 'team160', 0, 0, '', '185252'),
(161, 'team161', 0, 0, '', '358673'),
(162, 'team162', 0, 0, '', '683433'),
(163, 'team163', 0, 0, '', '595763'),
(164, 'team164', 0, 0, '', '662817'),
(165, 'team165', 0, 0, '', '147661'),
(166, 'team166', 0, 0, '', '448952'),
(167, 'team167', 0, 0, '', '897767'),
(168, 'team168', 0, 0, '', '157156'),
(169, 'team169', 0, 0, '', '592013'),
(170, 'team170', 0, 0, '', '524137'),
(171, 'team171', 0, 0, '', '242537'),
(172, 'team172', 0, 0, '', '886121'),
(173, 'team173', 0, 0, '', '155842'),
(174, 'team174', 0, 0, '', '570701'),
(175, 'team175', 0, 0, '', '736082'),
(176, 'team176', 0, 0, '', '418925'),
(177, 'team177', 0, 0, '', '582511'),
(178, 'team178', 0, 0, '', '643127'),
(179, 'team179', 0, 0, '', '733782'),
(180, 'team180', 0, 0, '', '745709'),
(181, 'team181', 0, 0, '', '213215'),
(182, 'team182', 0, 0, '', '548903'),
(183, 'team183', 0, 0, '', '766349'),
(184, 'team184', 0, 0, '', '235576'),
(185, 'team185', 0, 0, '', '186512'),
(186, 'team186', 0, 0, '', '854294'),
(187, 'team187', 0, 0, '', '679116'),
(188, 'team188', 0, 0, '', '705234'),
(189, 'team189', 0, 0, '', '555508'),
(190, 'team190', 0, 0, '', '556884'),
(191, 'team191', 0, 0, '', '611783'),
(192, 'team192', 0, 0, '', '814361'),
(193, 'team193', 0, 0, '', '666782'),
(194, 'team194', 0, 0, '', '704944'),
(195, 'team195', 0, 0, '', '226416'),
(196, 'team196', 0, 0, '', '487164'),
(197, 'team197', 0, 0, '', '266866'),
(198, 'team198', 0, 0, '', '802462'),
(199, 'team199', 0, 0, '', '654541'),
(200, 'team200', 0, 0, '', '541237');

-- --------------------------------------------------------

--
-- Structure for view `round1answers`
--
DROP TABLE IF EXISTS `round1answers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `round1answers`  AS  select `question`.`id` AS `qid`,`options`.`id` AS `correct`,`answers`.`answerGiven` AS `answer`,`teams`.`id` AS `team` from (((`teams` join `answers`) join `question`) join `options`) where ((`teams`.`id` = `answers`.`teamID`) and (`question`.`id` = `answers`.`questionID`) and (`answers`.`answerGiven` = `options`.`id`) and (`options`.`isAnswer` = 1) and (`options`.`questionId` = `question`.`id`)) order by `teams`.`id` ;

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
