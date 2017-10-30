CREATE DATABASE  IF NOT EXISTS `university` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `university`;
-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Class` (
  `classNumber` varchar(8) NOT NULL DEFAULT '',
  `facId` varchar(6) NOT NULL,
  `schedule` varchar(8) DEFAULT NULL,
  `room` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`classNumber`),
  UNIQUE KEY `Class_schedule_room_uk` (`schedule`,`room`),
  KEY `Class_facId_fk` (`facId`),
  CONSTRAINT `Class_facId_fk` FOREIGN KEY (`facId`) REFERENCES `Faculty` (`facId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
INSERT INTO `Class` VALUES ('ART103A','F101','MWF9','H221'),('CSC201A','F105','TuThF10','M110'),('CSC203A','F105','MThF12','M110'),('HST205A','F115','MWF11','H221'),('MTH101B','F110','MTuTh9','H225'),('MTH103C','F110','MWF11','H225');
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enroll`
--

DROP TABLE IF EXISTS `Enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enroll` (
  `stuId` varchar(6) NOT NULL DEFAULT '',
  `classNumber` varchar(8) NOT NULL DEFAULT '',
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`classNumber`,`stuId`),
  KEY `Enroll_stuId_fk` (`stuId`),
  CONSTRAINT `Enroll_classNumber_fk` FOREIGN KEY (`classNumber`) REFERENCES `Class` (`classNumber`) ON DELETE CASCADE,
  CONSTRAINT `Enroll_stuId_fk` FOREIGN KEY (`stuId`) REFERENCES `Student` (`stuId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enroll`
--

LOCK TABLES `Enroll` WRITE;
/*!40000 ALTER TABLE `Enroll` DISABLE KEYS */;
INSERT INTO `Enroll` VALUES ('S1001','ART103A','A'),('S1002','ART103A','D'),('S1010','ART103A',NULL),('S1002','CSC201A','F'),('S1020','CSC201A','B'),('S1001','HST205A','C'),('S1020','MTH101B','A'),('S1002','MTH103C','B'),('S1010','MTH103C',NULL);
/*!40000 ALTER TABLE `Enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `facId` varchar(6) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL,
  `department` varchar(20) DEFAULT NULL,
  `rank` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`facId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES ('F101','Adams','Art','Professor'),('F105','Tanaka','CSC','Instructor'),('F110','Byrne','Math','Assistant'),('F115','Smith','History','Associate'),('F221','Smith','CSC','Professor');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `stuId` varchar(6) NOT NULL DEFAULT '',
  `lastName` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `major` varchar(10) DEFAULT NULL,
  `credits` int(11) DEFAULT '0',
  PRIMARY KEY (`stuId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('S1001','Smith','Tom','History',90),('S1002','Chin','Ann','Math',36),('S1005','Lee','Perry','History',3),('S1010','Burns','Edward','Art',63),('S1013','McCarthy','Owen','Math',0),('S1015','Jones','Mary','Math',42),('S1020','Rivera','Jane','CSC',15);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-28 15:03:41
