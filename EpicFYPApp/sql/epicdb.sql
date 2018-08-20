-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 14, 2018 at 06:07 AM
-- Server version: 5.6.39
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epicdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminName` varchar(15) NOT NULL,
  `adminPassword` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminName`, `adminPassword`) VALUES
('admin1', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `ccaexperience`
--

CREATE TABLE `ccaexperience` (
  `useremail` varchar(100) NOT NULL,
  `ccaName` varchar(200) NOT NULL,
  `ccaTitle` varchar(200) NOT NULL,
  `ccaPeriodStart` date NOT NULL,
  `ccaPeriodEnd` date NOT NULL,
  `ccaDescription` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cipexperience`
--

CREATE TABLE `cipexperience` (
  `userEmail` varchar(100) NOT NULL,
  `cipOrganization` varchar(200) NOT NULL,
  `cipTitle` varchar(200) NOT NULL,
  `cipPeriodStart` date NOT NULL,
  `cipPeriodEnd` date NOT NULL,
  `cipDescription` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languageproficiency`
--

CREATE TABLE `languageproficiency` (
  `userEmail` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `isSpoken` tinyint(1) NOT NULL DEFAULT '0',
  `isWritten` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `userEmail` varchar(100) NOT NULL,
  `skillName` varchar(200) NOT NULL,
  `skillProficiency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentEmail` varchar(50) NOT NULL,
  `studentSchool` varchar(50) NOT NULL,
  `studentFieldOfStudy` varchar(50) NOT NULL,
  `studentExpectedGraduation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `tripID` varchar(100) NOT NULL,
  `programme` varchar(100) NOT NULL,
  `price` varchar(200) NOT NULL,
  `ratings` int(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `tripStart` date NOT NULL,
  `tripEnd` date NOT NULL,
  `tripDuration` int(200) NOT NULL,
  `activation` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`tripID`, `programme`, `price`, `ratings`, `country`, `tripStart`, `tripEnd`, `tripDuration`, `activation`) VALUES
('3', ' Winter Study Trip', '1234', 5, 'Singapore', '2018-08-20', '2018-09-09', 20, 4);
INSERT INTO `trip` (`tripID`, `programme`, `price`, `ratings`, `country`, `tripStart`, `tripEnd`, `tripDuration`, `activation`) VALUES
('2', ' Grad Trip', '324', 5, 'Malaysia', '2018-08-20', '2018-09-09', 20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tripstudent`
--

CREATE TABLE `tripstudent` (
  `tripID` varchar(100) NOT NULL,
  `studentEmail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tripstudent`
--

INSERT INTO `tripstudent` (`tripID`, `studentEmail`) VALUES
('3', 'mediani.2015@sis.smu.edu.sg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userEmail` varchar(50) NOT NULL,
  `userFirstName` varchar(50) NOT NULL,
  `userLastName` varchar(50) NOT NULL,
  `userPhone` int(20) NOT NULL,
  `userGender` varchar(100) DEFAULT NULL,
  `userCitizenship` varchar(100) DEFAULT NULL,
  `userAge` int(3) DEFAULT NULL,
  `userDescription` varchar(1000) DEFAULT NULL,
  `userProfilePic` blob,
  `userInterest` varchar(1000) DEFAULT NULL,
  `userPassword` varchar(15) NOT NULL,
  `userRole` varchar(50) NOT NULL,
  `userOccupation` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userEmail`, `userFirstName`, `userLastName`, `userPhone`, `userGender`, `userCitizenship`, `userAge`, `userDescription`, `userProfilePic`, `userInterest`, `userPassword`, `userRole`, `userOccupation`) VALUES
('mediani.2015@sis.smu.edu.sg', 'Mediani', 'Law', 83036983, NULL, NULL, NULL, NULL, NULL, NULL, '1234', 'member', 'Student'),
('rachael.low.2015@sis.smu.edu.sg', 'Rachael', 'Low', 91234567, NULL, NULL, NULL, NULL, NULL, NULL, 'fyp1234', 'member', 'Student'),
('xiuwen.yeo@gmail.com', 'Xiu Wen', 'Yeo', 98769876, 'Female', NULL, NULL, NULL, NULL, NULL, '1234', 'member', 'Student'),
('yijing.oon.2015@smu.edu.sg', 'Yi Jing', 'Oon', 98766789, 'Female', 'Singapore PR', 24, NULL, NULL, NULL, 'oonyijing', 'user', '');

-- --------------------------------------------------------

--
-- Table structure for table `workexperience`
--

CREATE TABLE `workexperience` (
  `userEmail` varchar(100) NOT NULL,
  `workCompany` varchar(200) NOT NULL,
  `workJobTitle` varchar(200) NOT NULL,
  `workPeriodStart` date NOT NULL,
  `workPeriodEnd` date NOT NULL,
  `workDescription` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminName`);

--
-- Indexes for table `ccaexperience`
--
ALTER TABLE `ccaexperience`
  ADD PRIMARY KEY (`useremail`,`ccaName`,`ccaTitle`);

--
-- Indexes for table `cipexperience`
--
ALTER TABLE `cipexperience`
  ADD PRIMARY KEY (`userEmail`,`cipOrganization`,`cipTitle`);

--
-- Indexes for table `languageproficiency`
--
ALTER TABLE `languageproficiency`
  ADD PRIMARY KEY (`userEmail`,`language`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`userEmail`,`skillName`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentEmail`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`tripID`);

--
-- Indexes for table `tripstudent`
--
ALTER TABLE `tripstudent`
  ADD PRIMARY KEY (`tripID`,`studentEmail`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userEmail`);

--
-- Indexes for table `workexperience`
--
ALTER TABLE `workexperience`
  ADD PRIMARY KEY (`userEmail`,`workCompany`,`workJobTitle`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tripstudent`
--
ALTER TABLE `tripstudent`
  ADD CONSTRAINT `tripstudent_ibfk_1` FOREIGN KEY (`tripID`) REFERENCES `trip` (`tripID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
