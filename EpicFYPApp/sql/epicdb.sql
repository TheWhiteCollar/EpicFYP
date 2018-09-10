-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2018 at 02:20 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";


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
  `adminPassword` varchar(30) NOT NULL,
  PRIMARY KEY (`adminName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminName`, `adminPassword`) VALUES
('admin1', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `countryinternship`
--

CREATE TABLE IF NOT EXISTS `countryinternship` (
  `countryName` varchar(100) NOT NULL,
  `countryContinent` varchar(100) NOT NULL,
  PRIMARY KEY (`countryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countryinternship`
--

INSERT INTO `countryinternship` (`countryName`, `countryContinent`) VALUES
('Canada', 'America'),
('Czech Republic', 'Europe'),
('New Zealand', 'Australia'),
('Myanmar', 'Asia'),
('Thailand', 'Asia');

-- --------------------------------------------------------

--
-- Table structure for table `countrytrip`
--

CREATE TABLE IF NOT EXISTS `countrytrip` (
  `countryTripName` varchar(100) NOT NULL,
  PRIMARY KEY (`countryTripName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countrytrip`
--

INSERT INTO `countrytrip` (`countryTripName`) VALUES
('Malaysia'),
('Singapore');

-- --------------------------------------------------------

--
-- Table structure for table `fieldofstudy`
--

CREATE TABLE IF NOT EXISTS `fieldofstudy` (
  `fieldOfStudyName` varchar(200) NOT NULL,
  PRIMARY KEY (`fieldOfStudyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldofstudy`
--

INSERT INTO `fieldofstudy` (`fieldOfStudyName`) VALUES
('Accountancy'),
('Arts & Social Sciences'),
('Business'),
('Computing'),
('Dentistry'),
('Design & Environment'),
('Engineering'),
('History'),
('Hospitality & Tourism'),
('Law'),
('Medicine'),
('Music'),
('Science'),
('Others');


-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE IF NOT EXISTS `interest` (
  `interestName` varchar(50) NOT NULL,
  PRIMARY KEY (`interestName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`interestName`) VALUES
('Academic & Business'),
('Nature & Culture'),
('Service & Social Innovation');

-- --------------------------------------------------------

--
-- Table structure for table `internship`
--

CREATE TABLE IF NOT EXISTS `internship` (
  `internshipID` int(11) NOT NULL AUTO_INCREMENT,
  `internshipName` varchar(100) NOT NULL,
  `internshipApproval` varchar(100) NOT NULL DEFAULT '',
  `internshipFieldOfStudy` varchar(500) NOT NULL,
  `internshipDescription` varchar(1000) NOT NULL,
  `internshipStart` date NOT NULL,
  `internshipEnd` date NOT NULL,
  `internshipPay` decimal(13,2) NOT NULL,
  `internshipSupervisor` varchar(100) NOT NULL DEFAULT '',
  `internshipSupervisorEmail` varchar(100) NOT NULL DEFAULT '',
  `internshipVacancy` int(100) NOT NULL DEFAULT '0',
  `internshipPartnerID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`internshipID`),
  KEY `internshippartnerid` (`internshipPartnerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `internship`
--

INSERT INTO `internship` (`internshipID`, `internshipName`, `internshipApproval`, `internshipFieldOfStudy`, `internshipDescription`, `internshipStart`, `internshipEnd`, `internshipPay`, `internshipSupervisor`, `internshipSupervisorEmail`, `internshipVacancy`, `internshipPartnerID`) VALUES
(1, 'Data Analytics Intern', 'pending', 'Business, Accountancy', 'This intern position is within the Business Intelligence Department and will support the team with data analysis, model development, data visualizations and decision support for various departments.', '2018-11-11', '2019-11-11', '1000.00', 'Tommy Lau', 'tommy.lau@xwy.com', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `internshipstudent`
--

CREATE TABLE IF NOT EXISTS `internshipstudent` (
  `internshipID` int(11) NOT NULL,
  `internshipUserEmail` varchar(50) CHARACTER SET utf8 NOT NULL,
  `internshipStudentStatus` varchar(100) NOT NULL,
  `internshipStudentContinent` varchar(100) NOT NULL,
  PRIMARY KEY (`internshipID`,`internshipUserEmail`),
  KEY `internshipUserEmail` (`internshipUserEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internshipstudent`
--

INSERT INTO `internshipstudent` (`internshipID`, `internshipUserEmail`, `internshipStudentStatus`, `internshipStudentContinent`) VALUES
(1, 'mediani.2015@sis.smu.edu.sg', 'approved', 'Asia'),
(1, 'rachael.low.2015@sis.smu.edu.sg', 'applied', 'Asia');

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE IF NOT EXISTS `partner` (
  `partnerID` int(11) NOT NULL AUTO_INCREMENT,
  `partnerName` varchar(100) NOT NULL,
  `partnerCountry` varchar(100) NOT NULL,
  `partnerState` varchar(100) NOT NULL,
  `partnerDescription` varchar(1000) NOT NULL,
  `partnerPassword` varchar(50) NOT NULL,
  `partnerPicture` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`partnerID`),
  KEY `partnercountry` (`partnerCountry`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`partnerID`, `partnerName`, `partnerCountry`, `partnerState`, `partnerDescription`, `partnerPassword`, `partnerPicture`) VALUES
(1, 'CC Pte Ltd', 'Myanmar', 'Shan', 'Here are CC Pte Ltd, we believe that only the best should be given to our customers.', 'test', '');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `paymentMode` varchar(100) NOT NULL,
  `paymentType` varchar(100) NOT NULL,
  `paymentRefund` double DEFAULT NULL,
  PRIMARY KEY (`paymentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `paymentMode`, `paymentType`, `paymentRefund`) VALUES
(1, 'Visa', 'deposit', 0),
(2, 'Mastercard', 'full amount', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE IF NOT EXISTS `trip` (
  `tripID` int(11) NOT NULL AUTO_INCREMENT,
  `tripTitle` varchar(100) NOT NULL,
  `tripPrice` double NOT NULL DEFAULT '0',
  `tripItinerary` varchar(100) NOT NULL DEFAULT '',
  `tripDescription` varchar(1000) NOT NULL,
  `tripCountry` varchar(100) NOT NULL,
  `tripState` varchar(100) NOT NULL,
  `tripStart` date DEFAULT NULL,
  `tripEnd` date DEFAULT NULL,
  `tripDuration` int(11) NOT NULL DEFAULT '0',
  `tripActivation` int(3) NOT NULL DEFAULT '0',
  `tripInterest` varchar(500) NOT NULL,
  `tripTotalSignUp` int(11) DEFAULT '0',
  `tripPromo` varchar(100) DEFAULT NULL,
  `tripPromoPercentage` double DEFAULT '0',
  PRIMARY KEY (`tripID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`tripID`, `tripTitle`, `tripPrice`, `tripItinerary`, `tripDescription`, `tripCountry`, `tripState`, `tripStart`, `tripEnd`, `tripDuration`, `tripActivation`, `tripInterest`, `tripTotalSignUp`, `tripPromo`, `tripPromoPercentage`) VALUES
(1, 'Trip to Myanmar Oceans', 500, '', 'The beautiful Lake Inle will wait for no one. Enjoy the beauty before global warming mars it''s beauty forever.', 'Myanmar', 'Shan', '2018-08-20', '2018-09-20', 30, 3, 'Nature and Culture, Academic and Business', 0, '20OFF', 0.2),
(2, ' Grad Trip', 300, '', 'Come join us at the amazing grad trip around Malaysia!', 'Malaysia', 'Johor', '2018-08-20', '2018-09-20', 30, 4, 'Academic and Business', 0, NULL, NULL),
(3, ' Winter Study Trip Customised', 100, '', 'This Winter Study Trip in SIngapore will just be amazing! Imagine WINTER in SINGAPORE. You must not miss this once in a life time opportunity!', 'Singapore', 'Singapore', '2018-08-20', '2018-09-20', 30, 4, 'Nature and Culture', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tripstudent`
--

CREATE TABLE IF NOT EXISTS `tripstudent` (
  `tripUserEmail` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tripStudentPayment` double NOT NULL,
  `tripStudentStatus` varchar(100) NOT NULL,
  `tripStudentReview` varchar(500) NOT NULL,
  `tripStudentRating` int(1) NOT NULL,
  `tripID` int(11) NOT NULL,
  PRIMARY KEY (`tripUserEmail`,`tripID`),
  KEY `tripUserEmail` (`tripUserEmail`),
  KEY `tripID` (`tripID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tripstudent`
--

INSERT INTO `tripstudent` (`tripUserEmail`, `tripStudentPayment`, `tripStudentStatus`, `tripStudentReview`, `tripStudentRating`, `tripID`) VALUES
('mediani.2015@sis.smu.edu.sg', 100.1, 'pending deposit payment', 'This is an excellent trip. I loved everything about it.', 2, 2),
('rachael.low.2015@sis.smu.edu.sg', 202.90, 'trip confirmed', '', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userEmail` varchar(50) NOT NULL,
  `userFirstName` varchar(50) NOT NULL,
  `userLastName` varchar(50) NOT NULL,
  `userPhone` int(15) NOT NULL,
  `userGender` varchar(1) NOT NULL,
  `userCitizenship` varchar(100) NOT NULL,
  `userDOB` year(4) NOT NULL,
  `userProfilePic` varchar(100) NOT NULL,
  `userInterest` varchar(1000) DEFAULT NULL,
  `userPassword` varchar(50) NOT NULL,
  `userOccupation` varchar(100) NOT NULL,
  `userResume` varchar(100) NOT NULL DEFAULT '',
  `userIsEmailConfirm` varchar(10) NOT NULL DEFAULT 'pending',
  `userHighestEducation` varchar(100) NOT NULL,
  `userFieldOfStudy` varchar(1000) DEFAULT NULL,
  `userDescription` varchar(500) DEFAULT NULL,
  `userSchool` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userEmail`, `userFirstName`, `userLastName`, `userPhone`, `userGender`, `userCitizenship`, `userDOB`, `userProfilePic`, `userInterest`, `userPassword`, `userOccupation`, `userResume`, `userIsEmailConfirm`, `userHighestEducation`, `userFieldOfStudy`, `userDescription`, `userSchool`) VALUES
('mediani.2015@sis.smu.edu.sg', 'Mediani', 'Law', 83036983, 'F', 'Singapore PR', 1996, '', 'Service & Social Innovation, Academic & Business', '1234', 'Student', '', 'pending', 'Bachelor Degree', 'Law', NULL, 'SMU'),
('rachael.low.2015@sis.smu.edu.sg', 'Rachael', 'Low', 91234567, 'M', 'Algerian', 1995, '', 'Academic & Business', 'fyp1234', 'Student', '', 'confirmed', 'ITE', 'History', NULL, 'NTU'),
('xiuwen.yeo@gmail.com', 'Xiu Wen', 'Yeo', 98769876, 'F', 'Singaporean', 1994, '', 'Nature & Culture', '1234', 'Student', '', 'pending', 'Postgraduate Diploma', 'Computing', NULL, 'SMU'),
('yijing.oon.2015@smu.edu.sg', 'Yi Jing', 'Oon', 98766789, 'F', 'Singapore PR', 1993, '', 'Nature & Culture, Service & Social Innovation', 'oonyijing', 'Student', '', 'confirmed', 'Masters/Doctorate', 'Computing', NULL, 'NTU');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `internshippartner_fk` FOREIGN KEY (`internshipPartnerID`) REFERENCES `partner` (`partnerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `internshipstudent`
--
ALTER TABLE `internshipstudent`
  ADD CONSTRAINT `internshipstudent_fk2` FOREIGN KEY (`internshipUserEmail`) REFERENCES `user` (`userEmail`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `internshipstudent_fk1` FOREIGN KEY (`internshipID`) REFERENCES `internship` (`internshipID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tripstudent`
--
ALTER TABLE `tripstudent`
  ADD CONSTRAINT `tripstudent_fk1` FOREIGN KEY (`tripUserEmail`) REFERENCES `user` (`userEmail`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tripstudent_fk2` FOREIGN KEY (`tripID`) REFERENCES `trip` (`tripID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `partner`
--
ALTER TABLE `partner`
  ADD CONSTRAINT `partner_fk1` FOREIGN KEY (`partnerCountry`) REFERENCES `countryinternship` (`countryName`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
