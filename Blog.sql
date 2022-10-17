-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-server
-- Generation Time: Aug 19, 2022 at 08:02 AM
-- Server version: 8.0.19
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `comment` varchar(400) DEFAULT NULL,
  `replies` bit(1) DEFAULT NULL,
  `username` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment`, `replies`, `username`) VALUES
(3, 1, 1, 'sujeet\'s comment2', b'0', 'tiwarivaibhav0'),
(6, 32, 1, 'tiwarivaibhav0 comment', b'0', 'tiwarivaibhav0'),
(9, 1, 1, 'fwfwf', b'0', 'tiwarivaibhav0'),
(13, 29, 1, 'hthth', b'0', 'tiwarivaibhav0'),
(14, 29, 1, 'y5yh', b'0', 'tiwarivaibhav0'),
(15, 29, 1, 'hhhh', b'0', 'tiwarivaibhav0'),
(16, 29, 1, 'yjyjyj', b'0', 'tiwarivaibhav0'),
(18, 38, 1, 'tiwarivaibhav0 comment', b'0', 'tiwarivaibhav0'),
(19, 5, 1, 'tiwarivaibhav0 comment', b'0', 'tiwarivaibhav0'),
(22, 29, 6, 'rtrtr', b'0', 'akashsoni'),
(23, 41, 1, '45465', b'0', 'Kushal99'),
(24, 45, 1, 'Nice one', b'0', 'Kushal99');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `img_id` int NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `file`, `type`, `size`) VALUES
(11, 'PC .jpeg', 'image/jpeg', '104707'),
(12, 'startafoodblog.jpg', 'image/jpeg', '89675');

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `details` text,
  `post_date` timestamp NULL DEFAULT NULL,
  `comments` int DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `status` enum('pending','approved','restricted') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`post_id`, `user_id`, `image`, `details`, `post_date`, `comments`, `username`, `title`, `status`) VALUES
(45, 1, 'PC .jpeg', 'There is a growing preference for PC gaming among India’s gaming community, according to a study conducted by HP. According to the HP India Gaming Landscape Report 2021, 89 per cent of respondents believe that a personal computer (PC) offers a better gaming experience than a smartphone. Furthermore, 37 per cent of mobile gamers are inclined towards migrating to a PC for gaming.', '2022-08-19 07:25:16', 1, 'Kushal99', 'PC gaming in India', 'approved'),
(46, 8, 'startafoodblog.jpg', 'Starting a food blog isn’t an easy task, but as long as you’re passionate about food and enjoy spending time cooking, it can be a piece of cake. All you need is some dedication, interest, and a little bit of guidance.\r\n\r\nThere are many aspects to becoming a food blogger, so it might feel overwhelming when you’re first starting. But don’t worry, that’s why this guide is divided into nine comprehensive steps that are easy to digest and follow.', '2022-08-19 07:48:48', 0, 'SumitTheKiller', 'How to start a blog', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `user_id` int UNSIGNED NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(60) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `city` varchar(60) NOT NULL,
  `country` varchar(60) DEFAULT NULL,
  `pin` int NOT NULL,
  `password` varchar(60) NOT NULL,
  `user_type` enum('user','admin','author') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `picture` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `fname`, `lname`, `email`, `username`, `mobile`, `city`, `country`, `pin`, `password`, `user_type`, `picture`) VALUES
(1, 'Kushal', 'Tewari', 'Kushal@gmail.com', 'Kushal99', '1234567890', 'Lucknow', 'India', 226010, '12345', 'author', 'https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png'),
(4, 'admin', '1', 'admin@gmail.com', 'admin', '455555555', 'Lucknow', 'India', 226016, 'admin', 'admin', NULL),
(8, 'Sumit', 'Gangwar', 'Sumit@gmail.com', 'SumitTheKiller', '7894561230', 'Meerut', 'India', 123456, '123', 'author', 'https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `img_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `post_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
