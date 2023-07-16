-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2023 at 05:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing1`
--

-- --------------------------------------------------------

--
-- Table structure for table `acroom`
--

CREATE TABLE `acroom` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `acroom`
--

INSERT INTO `acroom` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(6, 522, 'AC', 900, 'un book'),
(7, 122, 'AC', 800, 'un book'),
(8, 123, 'AC', 800, 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `admin_edit`
--

CREATE TABLE `admin_edit` (
  `admin_id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_edit`
--

INSERT INTO `admin_edit` (`admin_id`, `roomno`, `roomtype`) VALUES
(1, 121, 'deluxAC'),
(3, 523, 'nonAC'),
(4, 122, 'deluxAC'),
(5, 524, 'nonAC');

--
-- Triggers `admin_edit`
--
DELIMITER $$
CREATE TRIGGER `Audit_ac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'AC') THEN
            INSERT INTO acroom

    SET  
	roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	price = 900,

	status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Audit_delux` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
     IF ( NEW.roomtype = 'deluxAC') THEN
        INSERT INTO deluxacroom
           SET
    
            roomno = NEW.roomno,

            roomtype =  NEW.roomtype,

           price = 1100,

           status = 'un book';
      
            
      END IF;
   
    

    

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Audit_nonac` AFTER INSERT ON `admin_edit` FOR EACH ROW BEGIN
        
IF (NEW.roomtype = 'nonAC') THEN
            INSERT INTO nonac

    SET  
	    roomno = NEW.roomno,

    	roomtype =  NEW.roomtype,
	
	   price = 700,

	   status = 'un book';

     
      END IF;
   

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `card details`
--

CREATE TABLE `card details` (
  `id` int(11) NOT NULL,
  `cardno` bigint(20) NOT NULL,
  `cvv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card details`
--

INSERT INTO `card details` (`id`, `cardno`, `cvv`) VALUES
(2, 2222222222222222, 222),
(3, 3333333333333333, 333);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `mobile`, `address`, `message`) VALUES
(3, 'neel', 'neel@gmail.com', 1223344558, 'sarasnagar', 'food is not good'),
(4, 'jasprit', 'jasprit@gmail.com', 9889988998, 'chandan nagar', 'what is the price of AC room?'),
(5, 'harsh', 'harsh@gmail.com', 1234567899, 'burud goan', 'room pricw'),
(6, 'test test', 'test@test.com', 1234567890, 'test', 'hhh');

-- --------------------------------------------------------

--
-- Table structure for table `deluxacroom`
--

CREATE TABLE `deluxacroom` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deluxacroom`
--

INSERT INTO `deluxacroom` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(1, 101, 'deluxAC', 1500, 'un book'),
(18, 111, 'deluxAC', 1100, 'un book'),
(26, 121, 'deluxAC', 1200, 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `feedback` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `feedback`) VALUES
(1, 'yash', 'good'),
(2, 'harsh', 'excellent'),
(3, 'amrut', 'excellent'),
(4, 'raj mutha', 'excellent'),
(6, 'jasprit', 'good '),
(7, 'swaroop', 'xxxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `full_name` text NOT NULL,
  `phone` bigint(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `Total` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE `hall` (
  `id` int(11) NOT NULL,
  `hallyype` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`id`, `hallyype`, `price`, `status`) VALUES
(1, 'marriage', 10000, 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `hall_details`
--

CREATE TABLE `hall_details` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `members` int(11) NOT NULL,
  `function` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nonac`
--

CREATE TABLE `nonac` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'un book'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nonac`
--

INSERT INTO `nonac` (`id`, `roomno`, `roomtype`, `price`, `status`) VALUES
(9, 523, 'nonAC', 700, 'un book'),
(11, 122, 'Sports ', 1200, 'un book'),
(12, 122, 'ac ', 1200, 'un book');

-- --------------------------------------------------------

--
-- Table structure for table `registered_users`
--

CREATE TABLE `registered_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `resettoken` varchar(255) DEFAULT NULL,
  `resettokenexpire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room booking`
--

CREATE TABLE `room booking` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `cin` varchar(20) NOT NULL,
  `cout` varchar(20) NOT NULL,
  `members` int(11) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL,
  `no of rooms` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acroom`
--
ALTER TABLE `acroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_edit`
--
ALTER TABLE `admin_edit`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `card details`
--
ALTER TABLE `card details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deluxacroom`
--
ALTER TABLE `deluxacroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall_details`
--
ALTER TABLE `hall_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nonac`
--
ALTER TABLE `nonac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registered_users`
--
ALTER TABLE `registered_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room booking`
--
ALTER TABLE `room booking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acroom`
--
ALTER TABLE `acroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_edit`
--
ALTER TABLE `admin_edit`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `card details`
--
ALTER TABLE `card details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deluxacroom`
--
ALTER TABLE `deluxacroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `hall`
--
ALTER TABLE `hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hall_details`
--
ALTER TABLE `hall_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nonac`
--
ALTER TABLE `nonac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `registered_users`
--
ALTER TABLE `registered_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room booking`
--
ALTER TABLE `room booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
