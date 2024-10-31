-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2024 at 11:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proteindb`
--

-- --------------------------------------------------------

--
-- Table structure for table `binding_table`
--

CREATE TABLE `binding_table` (
  `allele` varchar(70) NOT NULL,
  `mer` varchar(20) NOT NULL,
  `binding_prediction` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `protein`
--

CREATE TABLE `protein` (
  `protein_id` varchar(50) NOT NULL,
  `header` varchar(500) DEFAULT NULL,
  `protein_name` varchar(500) DEFAULT NULL,
  `organism_type` varchar(255) DEFAULT NULL,
  `sequence` text DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `protein_9_mer`
--

CREATE TABLE `protein_9_mer` (
  `mer` char(9) DEFAULT NULL,
  `protein_id` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binding_table`
--
ALTER TABLE `binding_table`
  ADD PRIMARY KEY (`mer`);

--
-- Indexes for table `protein`
--
ALTER TABLE `protein`
  ADD PRIMARY KEY (`protein_id`);

--
-- Indexes for table `protein_9_mer`
--
ALTER TABLE `protein_9_mer`
  ADD KEY `protein_id` (`protein_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `protein`
--
ALTER TABLE `protein`
  ADD CONSTRAINT `protein_ibfk_1` FOREIGN KEY (`protein_id`) REFERENCES `binding_table` (`mer`);

--
-- Constraints for table `protein_9_mer`
--
ALTER TABLE `protein_9_mer`
  ADD CONSTRAINT `protein_9_mer_ibfk_1` FOREIGN KEY (`protein_id`) REFERENCES `protein` (`protein_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
