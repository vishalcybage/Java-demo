-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2021 at 03:35 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`) VALUES
(1, 'vishal@gmail.com', '1234'),
(2, 'vibhavari@gmail.com', '1234'),
(3, 'vaishnavi@gmail.com', '1234'),
(4, 'yogiraj@gmail.com', '1234'),
(5, 'divya@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE `citizen` (
  `ct_id` int(255) NOT NULL,
  `ct_name` varchar(255) NOT NULL,
  `ct_email` varchar(255) NOT NULL,
  `ct_mobile` varchar(255) NOT NULL,
  `ct_aadhaar` varchar(255) NOT NULL,
  `ct_address` varchar(255) NOT NULL,
  `ct_gender` varchar(50) NOT NULL,
  `ct_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `citizen`
--

INSERT INTO `citizen` (`ct_id`, `ct_name`, `ct_email`, `ct_mobile`, `ct_aadhaar`, `ct_address`, `ct_gender`, `ct_password`) VALUES
(1, 'Raj', 'raj@gmail.com', '9876543210', '123456789012', 'Pune', 'Male', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `cp_id` int(255) NOT NULL,
  `cp_details` varchar(255) NOT NULL,
  `reg_date` varchar(255) NOT NULL,
  `process_date` varchar(255) NOT NULL,
  `close_date` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `tentative_date` varchar(255) NOT NULL,
  `dept_id` int(255) NOT NULL,
  `ct_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`cp_id`, `cp_details`, `reg_date`, `process_date`, `close_date`, `status`, `tentative_date`, `dept_id`, `ct_id`) VALUES
(1, 'Water Pressure low', '07/10/2021', '08/10/2021', '', 'Processing', '10/10/2021', 1, 1),
(2, 'Internet not Working', '05/10/2021', '06/10/2021', '07/10/2021', 'Closed', '08/10/2021', 2, 1),
(3, 'Fire at Garage', '04/10/2021', '', '', 'Filed', '07/10/2021', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(255) NOT NULL,
  `dept_name` varchar(255) NOT NULL,
  `head` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `head`, `email`, `password`, `admin_id`) VALUES
(1, 'Water', 'A K Roy', 'roy@gmail.com', '1234', 3),
(2, 'IT', 'S T Rathod', 'rathod@gmail.com', '1234', 2),
(3, 'Fire', 'Neeta', 'neeta@gmail.com', '1234', 2);

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE `reminder` (
  `rm_id` int(255) NOT NULL,
  `rm_date` varchar(255) NOT NULL,
  `cp_id` int(255) NOT NULL,
  `ct_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reminder`
--

INSERT INTO `reminder` (`rm_id`, `rm_date`, `cp_id`, `ct_id`) VALUES
(1, '08/10/2021', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `citizen`
--
ALTER TABLE `citizen`
  ADD PRIMARY KEY (`ct_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`cp_id`),
  ADD KEY `ct_id` (`ct_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`rm_id`),
  ADD KEY `cp_id` (`cp_id`),
  ADD KEY `ct_id` (`ct_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `citizen`
--
ALTER TABLE `citizen`
  MODIFY `ct_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `cp_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reminder`
--
ALTER TABLE `reminder`
  MODIFY `rm_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`ct_id`) REFERENCES `citizen` (`ct_id`),
  ADD CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `reminder`
--
ALTER TABLE `reminder`
  ADD CONSTRAINT `reminder_ibfk_1` FOREIGN KEY (`cp_id`) REFERENCES `complaints` (`cp_id`),
  ADD CONSTRAINT `reminder_ibfk_2` FOREIGN KEY (`ct_id`) REFERENCES `citizen` (`ct_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
