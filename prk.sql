-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2017 at 09:37 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prk`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `restaurant_id`, `user_id`, `rating`, `comment`) VALUES
(1, 1, 1, 5, 'Delicious.'),
(2, 1, 2, 4, 'Yummy, maknyus.'),
(3, 1, 3, 2, 'The foods here are disgusting.'),
(4, 2, 2, 4, 'Cozy place and nice food.');

-- --------------------------------------------------------

--
-- Table structure for table `malls`
--

CREATE TABLE `malls` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `malls`
--

INSERT INTO `malls` (`id`, `name`, `address`) VALUES
(1, 'Grand Indonesia', 'Jalan M.H. Thamrin No.1, Kebon Melati, Tanah Abang, Kb. Melati, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10310'),
(2, 'Central Park', 'Jalan Letjen S. Parman Kav. 28, Jakarta Barat, Daerah Khusus Ibukota Jakarta 11470'),
(3, 'Pondok Indah Mall', 'Jalan Metro Pondok Indah Kav IV/TA, Pondok Pinang, Kebayoran Lama, RT.1/RW.16, RT.1/RW.16, Pd. Pinang, Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12310\r\n'),
(4, 'Senayan City', 'Jl. Asia Afrika No.Lot 19, RT.1/RW.3, Gelora, Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10270'),
(5, 'Gandaria City', 'Jalan Sultan Iskandar Muda, RT. 10 / RW. 6, Kebayoran Lama Utara, RT.10/RW.6, Kby. Lama Utara, Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12240');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mall_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `mall_id`) VALUES
(1, 'Fook Yew', 1),
(2, 'Sushi Tei', 1),
(3, 'Marugame Udon', 1),
(4, 'Carl''s Jr.', 2),
(5, 'The Duck King', 2),
(6, 'Kitchenette', 2),
(8, 'Kafe Betawi', 3),
(9, 'Pepper Lunch', 3),
(11, 'KFC', 4),
(13, 'Wendy''s', 4),
(15, 'Rocky', 5),
(17, 'Kwetiau 79', 5),
(19, 'Kemuning', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`) VALUES
(1, 'john@gmail.com', 'john123', 'John Doe'),
(2, 'Susan', 'susan123', 'Susan Doe'),
(3, 'bob@mail.com', 'bob123', 'Bob Smith');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `malls`
--
ALTER TABLE `malls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mall_id` (`mall_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `malls`
--
ALTER TABLE `malls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`mall_id`) REFERENCES `malls` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
