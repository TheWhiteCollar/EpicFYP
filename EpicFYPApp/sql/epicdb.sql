-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 29, 2018 at 08:44 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epicdb2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminName` varchar(15) NOT NULL,
  `adminPassword` varchar(15) NOT NULL,
  PRIMARY KEY (`adminName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminName`, `adminPassword`) VALUES
('admin1', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `attraction`
--

DROP TABLE IF EXISTS `attraction`;
CREATE TABLE IF NOT EXISTS `attraction` (
  `attractionID` int(11) NOT NULL AUTO_INCREMENT,
  `attractionName` varchar(100) NOT NULL,
  `attractionCountry` varchar(100) NOT NULL,
  `attractionState` varchar(100) NOT NULL,
  `attractionDescription` varchar(1000) NOT NULL,
  `attractionPicture` varchar(100) NOT NULL DEFAULT '',
  `attractionPriceCheap` decimal(13,2) NOT NULL DEFAULT 0.0,
  `attractionPriceEx` decimal(13,2) NOT NULL DEFAULT 0.0,
  PRIMARY KEY (`attractionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attraction`
--

INSERT INTO `attraction` (`attractionID`, `attractionName`, `attractionCountry`, `attractionState`, `attractionDescription`, `attractionPicture`, `attractionPriceCheap`, `attractionPriceEx`) VALUES
(1, 'Inle Lake', 'Myanmar', 'Shan', 'Large lake & cultural destination with quaint floating villages, monasteries & handicrafts', '', '100.00', '2000.00'),
(2, 'Shwedagon Pagoda', 'Myanmar', 'Yangon', 'The Shwedagon Pagoda, officially named Shwedagon Zedi Daw and also known as the Great Dagon Pagoda and the Golden Pagoda, is a gilded stupa located in Yangon, Myanmar.', '', '99.00', '4000.00');

-- --------------------------------------------------------

--
-- Table structure for table `fieldofstudy`
--

DROP TABLE IF EXISTS `fieldofstudy`;
CREATE TABLE IF NOT EXISTS `fieldofstudy` (
  `fieldOfStudyID` int(11) NOT NULL AUTO_INCREMENT,
  `fieldOfStudyName` varchar(200) NOT NULL,
  PRIMARY KEY (`fieldOfStudyID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldofstudy`
--

INSERT INTO `fieldofstudy` (`fieldOfStudyID`, `fieldOfStudyName`) VALUES
(1, 'Computing'),
(2, 'History'),
(3, 'Business'),
(4, 'Law'),
(5, 'Arts & Social Sciences'),
(6, 'Business'),
(7, 'Science'),
(8, 'Accountancy'),
(9, 'Dentistry'),
(10, 'Design & Environment'),
(11, 'Engineering'),
(12, 'Medicine'),
(13, 'Music'),
(24, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
CREATE TABLE IF NOT EXISTS `interest` (
  `interestID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `interestName` varchar(200) NOT NULL,
  PRIMARY KEY (`interestID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`interestID`, `interestName`) VALUES
(1, 'Nature and Culture'),
(2, 'Academic and Business'),
(3, 'Service & Social Innovation');

-- --------------------------------------------------------

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
CREATE TABLE IF NOT EXISTS `internship` (
  `internshipID` int(11) NOT NULL AUTO_INCREMENT,
  `internshipName` varchar(100) NOT NULL,
  `internshipApproval` varchar(100) NOT NULL DEFAULT '',
  `internshipCategory` int(11) NOT NULL,
  `internshipDescription` varchar(1000) NOT NULL,
  `internshipStart` date NOT NULL,
  `internshipEnd` date NOT NULL,
  `internshipPay` decimal(13,2) NOT NULL,
  `internshipSupervisor` varchar(100) NOT NULL DEFAULT '',
  `internshipSupervisorEmail` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`internshipID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `internship`
--

INSERT INTO `internship` (`internshipID`, `internshipName`, `internshipApproval`, `internshipCategory`, `internshipDescription`, `internshipStart`, `internshipEnd`, `internshipPay`, `internshipSupervisor`, `internshipSupervisorEmail`) VALUES
(1, 'Data Analytics Intern', 'pending', 1, 'This intern position is within the Business Intelligence Department and will support the team with data analysis, model development, data visualizations and decision support for various departments.', '2018-11-11', '2019-11-11', '1000.00', 'Tommy Lau', 'tommy.lau@xwy.com');



-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
CREATE TABLE IF NOT EXISTS `partner` (
  `partnerID` int(11) NOT NULL AUTO_INCREMENT,
  `partnerName` varchar(100) NOT NULL,
  `partnerCountry` varchar(100) NOT NULL,
  `partnerState` varchar(100) NOT NULL,
  `partnerDescription` varchar(1000) NOT NULL,
  `partnerPassword` varchar(50) NOT NULL,
  `partnerPicture` varchar(100) NOT NULL DEFAULT '',
  `partnerPriceCheap` decimal(13,2) NOT NULL DEFAULT 0.0,
  `partnerPriceEx` decimal(13,2) NOT NULL DEFAULT 0.0,
  PRIMARY KEY (`partnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`partnerID`, `partnerName`, `partnerCountry`, `partnerState`, `partnerDescription`, `partnerPassword`, `partnerPicture`, `partnerPriceCheap`, `partnerPriceEx`) VALUES
(1, 'CC Pte Ltd', 'Myanmar', 'Shan', 'Here are CC Pte Ltd, we believe that only the best should be given to our customers.', 'test' ,'', '100.00', '1000.00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `paymentMode` varchar(100) NOT NULL,
  `paymentType` varchar(100) NOT NULL,
  `paymentRefund` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `paymentMode`, `paymentType`, `paymentRefund`) VALUES
(1, 'Visa', 'deposit', '0.00'),
(2, 'Mastercard', 'full amount', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
CREATE TABLE IF NOT EXISTS `trip` (
  `tripID` int(11) NOT NULL AUTO_INCREMENT,
  `tripTitle` varchar(100) NOT NULL,
  `tripPrice` decimal(13,2) NOT NULL,
  `tripItinerary` varchar(100) NOT NULL DEFAULT '',
  `tripDescription` varchar(1000) NOT NULL,
  `tripCountry` varchar(100) NOT NULL,
  `tripState` varchar(100) NOT NULL,
  `tripStart` date,
  `tripEnd` date,
  `tripDuration` int(11) NOT NULL,
  `tripActivation` int(3) NOT NULL,
  `tripCategoryInterest` int(3) NOT NULL,
  `tripCountryState` varchar(200) DEFAULT NULL,
  `tripProposedBy` varchar(100) DEFAULT NULL,
  `tripNoOfInterested` int(11) DEFAULT NULL,
  `tripTotalSignUp` int(11) DEFAULT NULL,
  `tripEstimatedPrice` decimal(13,2) DEFAULT NULL,
  `tripCustomizeApproval` varchar(100) DEFAULT NULL,
  `tripPromo` varchar(100) DEFAULT NULL,
  `tripPromoPercentage` decimal(3,2) DEFAULT NULL,
  `tripAttraction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tripID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`tripID`, `tripTitle`, `tripPrice`, `tripItinerary`, `tripDescription`, `tripCountry`, `tripState`, `tripStart`, `tripEnd`, `tripDuration`, `tripActivation`, `tripCategoryInterest`, `tripCountryState`, `tripProposedBy`, `tripNoOfInterested`, `tripTotalSignUp`, `tripEstimatedPrice`,`tripCustomizeApproval`,`tripPromo`,`tripPromoPercentage`,`tripAttraction`) VALUES
(1,'Trip to Myanmar Oceans',500.00,NULL,'The beautiful Lake Inle will wait for no one. Enjoy the beauty before global warming mars it\'s beauty forever.','Myanmar','Shan','2018-08-20','2018-09-20',30,3,'3',NULL,NULL,NULL,NULL,NULL,NULL,'20OFF',0.20,NULL),
(2,' Grad Trip',300.00,NULL,'Come join us at the amazing grad trip around Malaysia!','Malaysia','Johor','2018-08-20','2018-09-20',30,4,'1,3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,' Winter Study Trip Customised',100.00,NULL,'This Winter Study Trip in SIngapore will just be amazing! Imagine WINTER in SINGAPORE. You must not miss this once in a life time opportunity!','Singapore','Singapore','2018-08-20','2018-09-20',30,4,'2','Singapore','xiuwen.yeo@gmail.com',8,4,150.00,'approved',NULL,NULL,'1,2');


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userFirstName` varchar(50) NOT NULL,
  `userLastName` varchar(50) NOT NULL,
  `userPhone` int(15) NOT NULL,
  `userGender` varchar(1) NOT NULL,
  `userCitizenship` varchar(100) NOT NULL,
  `userDOB` date,
  `userProfilePic` varchar(100) NOT NULL DEFAULT '',
  `userInterest` varchar(1000) DEFAULT NULL,
  `userPassword` varchar(50) NOT NULL,
  `userOccupation` varchar(100) NOT NULL,
  `userResume` varchar(100) NOT NULL DEFAULT '',
  `userIsEmailConfirm` varchar(10) DEFAULT NULL,
  `userHighestEducation` varchar(100) NOT NULL,
  `userFieldOfStudy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userEmail`, `userFirstName`, `userLastName`, `userPhone`, `userGender`, `userCitizenship`, `userDOB`, `userProfilePic`, `userInterest`, `userPassword`, `userOccupation`, `userResume`, `userIsEmailConfirm`, `userHighestEducation`, `userFieldOfStudy`) VALUES
(1,'mediani.2015@sis.smu.edu.sg','Mediani','Law',83036983,'F','Singapore PR','1900-09-08',NULL,'1,2','1234','Student','','pending','Bachelor Degree','1'),
(2,'rachael.low.2015@sis.smu.edu.sg','Rachael','Low',91234567,'M','Algerian','1894-05-04',NULL,'3','fyp1234','Student','','confirmed','ITE','3'),
(3,'xiuwen.yeo@gmail.com','Xiu Wen','Yeo',98769876,'F','Singaporean','1996-09-09',NULL,'2','1234','Student','','pending','Postgraduate Diploma','2'),
(4,'yijing.oon.2015@smu.edu.sg','Yi Jing','Oon',98766789,'F','Singapore PR','1995-10-24',NULL,'1,2,3','oonyijing','Student','','confirmed','Masters/Doctorate','3,4');


-- --------------------------------------------------------

--
-- Table structure for table `tripstudent`
--

DROP TABLE IF EXISTS `tripstudent`;
CREATE TABLE IF NOT EXISTS `tripstudent` (
  `tripStudentID` int(11) NOT NULL AUTO_INCREMENT,
  `tripID` int(11) NOT NULL,
  `tripUserEmail` varchar(50) NOT NULL,
  `tripStudentPayment` int(11) NOT NULL,
  `tripStudentStatus` varchar(100) NOT NULL DEFAULT '',
  `tripStudentReview` varchar(500) DEFAULT NULL,
  `tripStudentRating` int(1) DEFAULT NULL,
  PRIMARY KEY (`tripStudentID`),
  CONSTRAINT `tripstudent_ibfk_1` FOREIGN KEY (`tripID`) REFERENCES `trip` (`tripID`),
  CONSTRAINT `tripstudent_ibfk_2` FOREIGN KEY (`tripUserEmail`) REFERENCES `user` (`userEmail`),
  CONSTRAINT `tripstudent_ibfk_3` FOREIGN KEY (`tripStudentPayment`) REFERENCES `payment` (`paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tripstudent`
--

INSERT INTO `tripStudent` (`tripStudentID`,`tripID`, `tripUserEmail`, `tripStudentPayment`, `tripStudentStatus`, `tripStudentReview`, `tripStudentRating`) VALUES
(1,1,'rachael.low.2015@sis.smu.edu.sg',2,'pending deposit payment','',''),
(2,3,'yijing.oon.2015@smu.edu.sg',1,'trip confirmed','This is an excellent trip. I loved everything about it.',5);

-- --------------------------------------------------------
--
-- Table structure for table `internshipstudent`
--

DROP TABLE IF EXISTS `internshipstudent`;
CREATE TABLE IF NOT EXISTS `internshipstudent` (
  `internshipStudentID` int(11) NOT NULL AUTO_INCREMENT,
  `internshipID` int(11) NOT NULL,
  `internshipUserEmail` varchar(50) NOT NULL,
  `internshipStudentStatus` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`internshipStudentID`),
  CONSTRAINT `internshipstudent_ibfk_1` FOREIGN KEY (`internshipID`) REFERENCES `internship` (`internshipID`),
  CONSTRAINT `internshipstudent_ibfk_2` FOREIGN KEY (`internshipUserEmail`) REFERENCES `user` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Dumping data for table `internshipstudent`
--

INSERT INTO `internshipstudent` (`internshipStudentID`,`internshipID`, `internshipUserEmail`, `internshipStudentStatus`) VALUES
(1,1, 'rachael.low.2015@sis.smu.edu.sg', 'applied'),
(2,1, 'xiuwen.yeo@gmail.com', 'approved');

-- --------------------------------------------------------
--
-- Table structure for table `country`
--
 CREATE TABLE `country` (
  `countryName` varchar(15) NOT NULL,
  PRIMARY KEY (`countryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 --
-- Dumping data for table `country`
--
 INSERT INTO `country` (`countryName`) VALUES
('Singapore');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
