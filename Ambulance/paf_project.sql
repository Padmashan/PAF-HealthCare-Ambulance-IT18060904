-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 02:10 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paf_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_Id` int(11) NOT NULL,
  `Admin_Name` varchar(50) NOT NULL,
  `Admin_Contact` int(11) NOT NULL,
  `Admin_Mail` varchar(50) NOT NULL,
  `Admin_Address` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_service`
--

CREATE TABLE `ambulance_service` (
  `Amb_ID` int(11) NOT NULL,
  `H_ID` int(10) NOT NULL,
  `Admin_Id` int(10) NOT NULL,
  `Amb_No` varchar(10) NOT NULL,
  `Amb_Cont` int(15) NOT NULL,
  `Driver_Name` varchar(50) NOT NULL,
  `Ride_Date` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ambulance_service`
--

INSERT INTO `ambulance_service` (`Amb_ID`, `H_ID`, `Admin_Id`, `Amb_No`, `Amb_Cont`, `Driver_Name`, `Ride_Date`) VALUES
(123145729, 4, 4, 'ggg4444', 676, 'ffefe', '2020-02-02'),
(123145728, 6, 6, 'hhh666', 66, 'hhhhh', '2020-02-02'),
(123145725, 2, 3, 'ABC1234', 711461785, 'Kamal', '2020-10-01'),
(123145713, 1, 1, 'HHG5586', 77852645, 'Chamath', '2020-08-20'),
(123145714, 1, 1, 'HGG5586', 756669536, 'Induwara', '2020-05-20'),
(123145715, 2, 5, 'HAS5586', 756669545, 'Induwara', '2020-05-20'),
(123145716, 2, 1, 'MVW5585', 719568753, 'Gihan', '2020-04-25'),
(123145717, 2, 1, 'OKJ5585', 71956882, 'Gihan', '2020-04-25'),
(123145718, 2, 3, 'RCK5585', 71956877, 'Rajitha', '2020-08-25'),
(123145719, 1, 1, 'ESC5586', 71156286, 'Sampath', '2020-08-25'),
(123145720, 1, 2, 'WPS5542', 723568271, 'Priyankara', '2020-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `Appointment_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Doctor_Id` int(11) NOT NULL,
  `Doctor_spec` varchar(50) NOT NULL,
  `Hosp_Id` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Doctor_ID` int(11) NOT NULL,
  `D_Name` varchar(100) NOT NULL,
  `D_Type` varchar(100) NOT NULL,
  `D_Contact_Number` int(11) NOT NULL,
  `D_Address` varchar(100) NOT NULL,
  `D_Email` varchar(50) NOT NULL,
  `Hospital_ID` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `H_ID` int(10) NOT NULL,
  `H_name` varchar(50) NOT NULL,
  `H_contactNumber` int(10) NOT NULL,
  `H_address` varchar(50) NOT NULL,
  `H_email` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `Payment_Id` int(11) NOT NULL,
  `Ammount` double NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Doctor_Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_Id` int(11) NOT NULL,
  `User_First_Name` varchar(30) NOT NULL,
  `User_Last_Name` varchar(30) NOT NULL,
  `User_Address` varchar(50) NOT NULL,
  `User_Contact_Number` int(10) NOT NULL,
  `User_DOB` date NOT NULL,
  `User_Age` int(11) NOT NULL,
  `User_Email` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_Id`);

--
-- Indexes for table `ambulance_service`
--
ALTER TABLE `ambulance_service`
  ADD PRIMARY KEY (`Amb_ID`),
  ADD UNIQUE KEY `Amb_No` (`Amb_No`),
  ADD UNIQUE KEY `Amb_Cont` (`Amb_Cont`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`Appointment_Id`),
  ADD KEY `Hosp_Id` (`Hosp_Id`),
  ADD KEY `User_Id` (`User_Id`),
  ADD KEY `Doctor_Id` (`Doctor_Id`),
  ADD KEY `Doctor_spec` (`Doctor_spec`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doctor_ID`),
  ADD KEY `Hospital_ID` (`Hospital_ID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`H_ID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`Payment_Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_Id`),
  ADD UNIQUE KEY `Contact_Number` (`User_Contact_Number`),
  ADD UNIQUE KEY `User_Email` (`User_Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ambulance_service`
--
ALTER TABLE `ambulance_service`
  MODIFY `Amb_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123145730;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `Appointment_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `Doctor_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `H_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `Payment_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
