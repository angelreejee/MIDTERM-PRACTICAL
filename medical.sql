-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 19, 2025 at 08:22 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointmentId` int NOT NULL,
  `doctorsId` int NOT NULL,
  `patientID` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `room` int NOT NULL,
  PRIMARY KEY (`appointmentId`),
  KEY `doctorsId` (`doctorsId`),
  KEY `appointment_ibfk_3` (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentId`, `doctorsId`, `patientID`, `date`, `time`, `room`) VALUES
(122, 344, 122, '2025-09-19', '15:30:00', 1),
(123, 345, 123, '2025-09-20', '13:30:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `billId` int NOT NULL,
  `patientId` int NOT NULL,
  `amount` int NOT NULL,
  `paymentStatus` varchar(255) NOT NULL,
  `paymentDate` date NOT NULL,
  `staffId` int NOT NULL,
  KEY `patientId` (`patientId`),
  KEY `billing_ibfk_2` (`staffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billId`, `patientId`, `amount`, `paymentStatus`, `paymentDate`, `staffId`) VALUES
(222, 122, 1500, 'fully paid', '2025-09-19', 778),
(223, 123, 200, 'fully paid', '2025-09-20', 777);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `doctorsId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`doctorsId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctorsId`, `name`, `lastname`, `specialization`, `email`) VALUES
(344, 'Keila', 'Benliro', 'orthopedic', 'keila@gmail.com'),
(345, 'Nicole', 'Tenizo', 'orthopedic', 'Nicole@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patientstable`
--

DROP TABLE IF EXISTS `patientstable`;
CREATE TABLE IF NOT EXISTS `patientstable` (
  `patientId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mi` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dateofbirth` date NOT NULL,
  `mobile` int NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `appointmentId` int NOT NULL,
  PRIMARY KEY (`patientId`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patientstable`
--

INSERT INTO `patientstable` (`patientId`, `name`, `lastname`, `mi`, `age`, `gender`, `address`, `dateofbirth`, `mobile`, `diagnosis`, `appointmentId`) VALUES
(122, 'gayle ', 'gallarda', 'M', 21, 'female', 'Guimaras', '2015-02-04', 335656773, 'scoliosis', 344),
(123, 'Keith', 'Gaquit', 'J', 19, 'Male', 'Guimaras', '2025-08-22', 274878785, 'scoliosis', 345);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffId` int NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `mobile` int NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`staffId`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffId`, `fullname`, `mobile`, `email`, `password`) VALUES
(777, 'Olive Marie Bola', 4556677, 'olive@gmail.com', '12345'),
(778, 'Jizza Ignacio', 278437889, 'jizza@gmail.com', '123456');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doctorsId`) REFERENCES `doctors` (`doctorsId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`appointmentId`) REFERENCES `patientstable` (`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`patientID`) REFERENCES `patientstable` (`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patientstable` (`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
