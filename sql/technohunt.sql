-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2019 at 10:29 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

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
drop table if exists answers,question,options,teams,round;
drop view if exists round1answers,teamlist;
-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `teamID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `answerGiven` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `content` varchar(100) NOT NULL,
  `isAnswer` tinyint(1) NOT NULL,
  `questionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `round` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `round`
--

CREATE TABLE `round` (
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
CREATE TABLE `round1answers` (
`qid` int(11)
,`correct` int(11)
,`answer` int(11)
,`team` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `teamlist`
-- (See below for the actual view)
--
CREATE TABLE `teamlist` (
`name` varchar(30)
,`pass` varchar(20)
,`players` text
,`stat` tinyint(1)
,`points` decimal(32,0)
,`round` int(11)
,`leftWindow` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `teamName` varchar(30) NOT NULL,
  `isAlive` tinyint(1) NOT NULL,
  `isLoggedIn` tinyint(1) NOT NULL,
  `memberNames` text NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `round1answers`
--
DROP TABLE IF EXISTS `round1answers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `round1answers`  AS  select `question`.`id` AS `qid`,`options`.`id` AS `correct`,`answers`.`answerGiven` AS `answer`,`teams`.`id` AS `team` from (((`teams` join `answers`) join `question`) join `options`) where ((`teams`.`id` = `answers`.`teamID`) and (`question`.`id` = `answers`.`questionID`) and (`answers`.`answerGiven` = `options`.`id`) and (`options`.`isAnswer` = 1) and (`options`.`questionId` = `question`.`id`)) order by `teams`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `teamlist`
--
DROP TABLE IF EXISTS `teamlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teamlist`  AS  select `teams`.`teamName` AS `name`,`teams`.`password` AS `pass`,`teams`.`memberNames` AS `players`,`teams`.`isAlive` AS `stat`,sum(`round`.`points`) AS `points`,max(`round`.`round`) AS `round`,sum(`round`.`leftWindow`) AS `leftWindow` from (`round` join `teams`) where (`teams`.`id` = `round`.`teamId`) group by `round`.`teamId` order by points ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
