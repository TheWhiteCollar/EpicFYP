-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2018 at 05:31 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `epicdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `adminName` varchar(15) NOT NULL,
  `adminPassword` varchar(15) NOT NULL,
  PRIMARY KEY (`adminName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminName`, `adminPassword`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `ccaexperience`
--

CREATE TABLE IF NOT EXISTS `ccaexperience` (
  `useremail` varchar(100) NOT NULL,
  `ccaName` varchar(200) NOT NULL,
  `ccaTitle` varchar(200) NOT NULL,
  `ccaPeriodStart` date NOT NULL,
  `ccaPeriodEnd` date NOT NULL,
  `ccaDescription` varchar(2000) NOT NULL,
  PRIMARY KEY (`useremail`,`ccaName`,`ccaTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cipexperience`
--

CREATE TABLE IF NOT EXISTS `cipexperience` (
  `userEmail` varchar(100) NOT NULL,
  `cipOrganization` varchar(200) NOT NULL,
  `cipTitle` varchar(200) NOT NULL,
  `cipPeriodStart` date NOT NULL,
  `cipPeriodEnd` date NOT NULL,
  `cipDescription` varchar(2000) NOT NULL,
  PRIMARY KEY (`userEmail`,`cipOrganization`,`cipTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languageproficiency`
--

CREATE TABLE IF NOT EXISTS `languageproficiency` (
  `userEmail` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `isSpoken` tinyint(1) NOT NULL DEFAULT '0',
  `isWritten` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userEmail`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `userEmail` varchar(100) NOT NULL,
  `skillName` varchar(200) NOT NULL,
  `skillProficiency` int(11) NOT NULL,
  PRIMARY KEY (`userEmail`,`skillName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `studentEmail` varchar(50) NOT NULL,
  `studentSchool` varchar(50) NOT NULL,
  `studentFieldOfStudy` varchar(50) NOT NULL,
  `studentExpectedGraduation` date NOT NULL,
  PRIMARY KEY (`studentEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userEmail` varchar(50) NOT NULL,
  `userFirstName` varchar(50) DEFAULT NULL,
  `userLastName` varchar(50) DEFAULT NULL,
  `userPhone` int(20) DEFAULT NULL,
  `userGender` varchar(100) DEFAULT NULL,
  `userCitizenship` varchar(100) DEFAULT NULL,
  `userAge` varchar(100) DEFAULT NULL,
  `userDescription` varchar(1000) DEFAULT NULL,
  `userProfilePic` blob,
  `userInterest` varchar(1000) DEFAULT NULL,
  `userPassword` varchar(15) NOT NULL,
  `userRole` varchar(50) NOT NULL,
  PRIMARY KEY (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workexperience`
--

CREATE TABLE IF NOT EXISTS `workexperience` (
  `userEmail` varchar(100) NOT NULL,
  `workCompany` varchar(200) NOT NULL,
  `workJobTitle` varchar(200) NOT NULL,
  `workPeriodStart` date NOT NULL,
  `workPeriodEnd` date NOT NULL,
  `workDescription` varchar(2000) NOT NULL,
  PRIMARY KEY (`userEmail`,`workCompany`,`workJobTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
