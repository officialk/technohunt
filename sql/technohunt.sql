-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2019 at 03:59 PM
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
CREATE DATABASE IF NOT EXISTS `technohunt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `technohunt`;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
