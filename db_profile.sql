-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2019 at 02:03 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_profile`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'jakarta'),
(2, 'bandung');

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`id`, `name`) VALUES
(1, 'renang'),
(2, 'mancing'),
(3, 'game'),
(4, 'gibah'),
(5, 'programming');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(30) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` int(11) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `address` text,
  `last_education` enum('sd','smp','sma','s1') DEFAULT NULL,
  `religion` enum('islam','kristen','katholik') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `date_of_birth`, `place_of_birth`, `phone_number`, `address`, `last_education`, `religion`) VALUES
(1, 'Lucinta', '1992-07-12', 1, '8111', 'jakarta', 's1', 'kristen'),
(2, 'satrio', '2001-07-21', 2, '8222', 'bandung', 'sma', 'islam'),
(3, 'syahrini', '1989-01-01', 1, '8333', 'jakarta', 's1', 'islam');

-- --------------------------------------------------------

--
-- Table structure for table `user_hobbies`
--

CREATE TABLE `user_hobbies` (
  `biodata_id` int(11) NOT NULL,
  `hobby_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_hobbies`
--

INSERT INTO `user_hobbies` (`biodata_id`, `hobby_id`) VALUES
(1, 1),
(1, 3),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_coba`
-- (See below for the actual view)
--
CREATE TABLE `vw_coba` (
`id` int(11)
,`full_name` varchar(30)
,`user_place_of_birth_id` int(11)
,`name` varchar(30)
,`date_of_birth` date
,`phone_number` varchar(30)
,`last_education` enum('sd','smp','sma','s1')
,`religion` enum('islam','kristen','katholik')
);

-- --------------------------------------------------------

--
-- Structure for view `vw_coba`
--
DROP TABLE IF EXISTS `vw_coba`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_coba`  AS  select `users`.`id` AS `id`,`users`.`full_name` AS `full_name`,`users`.`place_of_birth` AS `user_place_of_birth_id`,`cities`.`name` AS `name`,`users`.`date_of_birth` AS `date_of_birth`,`users`.`phone_number` AS `phone_number`,`users`.`last_education` AS `last_education`,`users`.`religion` AS `religion` from (`cities` join `users`) where (`cities`.`id` = `users`.`place_of_birth`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_placeofbirth` (`place_of_birth`);

--
-- Indexes for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  ADD PRIMARY KEY (`biodata_id`,`hobby_id`),
  ADD KEY `fk_hobby` (`hobby_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_placeofbirth` FOREIGN KEY (`place_of_birth`) REFERENCES `cities` (`id`);

--
-- Constraints for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  ADD CONSTRAINT `fk_biodata` FOREIGN KEY (`biodata_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_hobby` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
