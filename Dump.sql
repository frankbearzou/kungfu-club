-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: KungFuClub
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `active`
--

DROP TABLE IF EXISTS `active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active` (
  `active_num` int(11) NOT NULL,
  `stu_num` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  PRIMARY KEY (`active_num`),
  KEY `stu_num` (`stu_num`),
  CONSTRAINT `active_ibfk_1` FOREIGN KEY (`stu_num`) REFERENCES `student` (`stu_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active`
--

LOCK TABLES `active` WRITE;
/*!40000 ALTER TABLE `active` DISABLE KEYS */;
INSERT INTO `active` VALUES (1,1,1,'2017-03-07'),(2,2,1,'2016-09-01'),(3,3,1,'2015-01-11'),(4,4,1,'2014-09-10'),(5,5,1,'2015-09-20'),(6,6,1,'2015-08-10'),(7,7,1,'2014-07-20'),(8,8,1,'2015-08-11'),(9,9,0,'2015-08-23'),(10,10,1,'2015-09-30'),(11,11,1,'2015-09-29'),(12,12,1,'2015-11-29'),(13,13,1,'2006-11-29'),(14,14,0,'2006-12-29'),(15,15,1,'2007-01-05'),(16,25,0,'2006-11-29');
/*!40000 ALTER TABLE `active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `attendance_num` int(11) NOT NULL AUTO_INCREMENT,
  `stu_num` int(11) DEFAULT NULL,
  `class_level` int(11) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  PRIMARY KEY (`attendance_num`),
  KEY `stu_num` (`stu_num`),
  KEY `class_level` (`class_level`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`stu_num`) REFERENCES `student` (`stu_num`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`class_level`) REFERENCES `class` (`class_level`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,1,'2016-01-02'),(2,2,1,'2016-01-02'),(4,3,2,'2016-01-02'),(5,4,4,'2016-01-02'),(6,5,3,'2016-01-02'),(7,6,4,'2016-01-02'),(8,7,5,'2016-01-02'),(9,8,6,'2016-01-02'),(10,9,6,'2016-01-02'),(11,10,7,'2016-01-02'),(12,11,8,'2016-01-02'),(13,12,9,'2016-01-02'),(14,13,10,'2016-01-02'),(15,14,10,'2016-01-02'),(16,15,10,'2016-01-02'),(17,25,10,'2016-01-02');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_level` int(11) NOT NULL,
  `class_time` time DEFAULT NULL,
  `class_day` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`class_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'10:30:00','Monday'),(2,'10:30:00','Tuesday'),(3,'10:30:00','Wednesday'),(4,'10:30:00','Thursday'),(5,'10:30:00','Friday'),(6,'10:30:00','Saturday'),(7,'10:30:00','Sunday'),(8,'16:30:00','Monday'),(9,'16:30:00','Tuesday'),(10,'16:30:00','Wednesday');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `ins_num` int(11) NOT NULL AUTO_INCREMENT,
  `ins_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ins_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Han');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `pay_num` int(11) NOT NULL AUTO_INCREMENT,
  `stu_num` int(11) NOT NULL,
  `paytype_num` int(11) DEFAULT NULL,
  `pay_date_start` date DEFAULT NULL,
  `pay_date_end` date DEFAULT NULL,
  PRIMARY KEY (`pay_num`,`stu_num`),
  KEY `stu_num` (`stu_num`),
  KEY `paytype_num` (`paytype_num`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`stu_num`) REFERENCES `student` (`stu_num`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`paytype_num`) REFERENCES `payment_type` (`paytype_num`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'2014-09-10','2015-09-10'),(2,2,1,'2016-09-10','2017-09-10'),(3,3,1,'2015-09-10','2016-09-10'),(4,4,1,'2014-09-10','2015-09-10'),(5,5,1,'2015-09-20','2016-09-10'),(6,6,1,'2015-09-20','2016-09-10'),(7,7,1,'2014-09-20','2015-09-10'),(8,8,1,'2015-09-20','2016-09-10'),(9,9,1,'2015-09-20','2016-09-10'),(10,10,1,'2015-09-30','2016-09-10'),(11,11,1,'2015-09-29','2016-09-10'),(12,12,1,'2015-11-29','2016-09-10'),(13,13,1,'2006-11-29','2016-09-10'),(14,14,1,'2006-12-29','2016-09-10'),(15,15,1,'2007-01-05','2016-09-10'),(16,25,1,'2006-11-29','2016-09-10'),(17,1,1,'2015-09-10','2017-09-10'),(18,3,1,'2016-09-10','2017-09-10'),(19,3,2,'2016-09-10','2017-09-10'),(20,3,3,'2016-09-10','2017-09-10'),(21,2,2,'2016-09-10','2017-09-10'),(22,2,3,'2016-09-10','2017-09-10'),(23,4,1,'2015-09-10','2017-09-10'),(24,4,2,'2016-09-10','2017-09-10'),(25,4,3,'2016-09-10','2017-09-10'),(26,5,1,'2016-09-10','2017-09-10'),(27,5,2,'2016-09-10','2017-09-10'),(28,5,3,'2016-09-10','2017-09-10'),(29,6,1,'2016-09-10','2017-09-10'),(30,6,2,'2016-09-10','2017-09-10'),(31,6,3,'2016-09-10','2017-09-10'),(32,7,1,'2016-09-10','2017-09-10'),(33,7,2,'2016-09-10','2017-09-10'),(34,7,3,'2016-09-10','2017-09-10'),(35,8,1,'2016-09-10','2017-09-10'),(36,8,2,'2016-09-10','2017-09-10'),(37,8,3,'2016-09-10','2017-09-10'),(38,9,1,'2016-09-10','2017-09-10'),(39,9,2,'2016-09-10','2017-09-10'),(40,9,3,'2016-09-10','2017-09-10'),(41,10,1,'2016-09-10','2017-09-10'),(42,10,2,'2016-09-10','2017-09-10'),(43,10,3,'2016-09-10','2017-09-10'),(44,11,1,'2016-09-10','2017-09-10'),(45,11,2,'2016-09-10','2017-09-10'),(46,11,3,'2016-09-10','2017-09-10'),(47,12,1,'2016-09-10','2017-09-10'),(48,12,2,'2016-09-10','2017-09-10'),(49,12,3,'2016-09-10','2017-09-10'),(50,13,1,'2016-09-10','2017-09-10'),(51,13,2,'2016-09-10','2017-09-10'),(52,13,3,'2016-09-10','2017-09-10'),(53,14,1,'2016-09-10','2017-09-10'),(54,14,2,'2016-09-10','2017-09-10'),(55,14,3,'2016-09-10','2017-09-10'),(56,15,1,'2016-09-10','2017-09-10'),(57,15,2,'2016-09-10','2017-09-10'),(58,15,3,'2016-09-10','2017-09-10'),(59,25,1,'2016-09-10','2017-09-10'),(60,25,2,'2016-09-10','2017-09-10'),(61,25,3,'2016-09-10','2017-09-10');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_type` (
  `paytype_num` int(11) NOT NULL AUTO_INCREMENT,
  `paytype_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`paytype_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'membership'),(2,'tests'),(3,'purchasing products');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progress` (
  `stu_num` int(11) NOT NULL,
  `rank_num` int(11) NOT NULL,
  `pro_date` date DEFAULT NULL,
  PRIMARY KEY (`stu_num`,`rank_num`),
  KEY `rank_num` (`rank_num`),
  CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`stu_num`) REFERENCES `student` (`stu_num`),
  CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`rank_num`) REFERENCES `rank` (`rank_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (1,1,'2017-03-07'),(2,1,'2016-09-01'),(3,1,'2014-01-01'),(3,2,'2015-01-11'),(4,1,'2010-01-11'),(4,2,'2011-01-11'),(4,3,'2012-01-11'),(4,4,'2011-01-11'),(5,1,'2015-01-11'),(5,2,'2015-01-11'),(5,3,'2015-09-20'),(6,1,'2010-01-11'),(6,2,'2011-01-11'),(6,3,'2012-01-11'),(6,4,'2015-01-11'),(7,1,'2010-01-11'),(7,2,'2011-01-11'),(7,3,'2012-01-11'),(7,4,'2015-01-11'),(7,5,'2016-01-11'),(8,1,'2010-01-11'),(8,2,'2011-01-11'),(8,3,'2012-01-11'),(8,4,'2015-01-11'),(8,5,'2016-01-11'),(8,6,'2017-01-11'),(9,1,'2010-01-11'),(9,2,'2011-01-11'),(9,3,'2012-01-11'),(9,4,'2015-01-11'),(9,5,'2016-01-11'),(9,6,'2017-01-11'),(10,1,'2010-01-11'),(10,2,'2011-01-11'),(10,3,'2012-01-11'),(10,4,'2014-01-11'),(10,5,'2015-01-11'),(10,6,'2016-01-11'),(10,7,'2017-01-11'),(11,1,'2010-01-11'),(11,2,'2011-01-11'),(11,3,'2012-01-11'),(11,4,'2013-01-11'),(11,5,'2014-01-11'),(11,6,'2015-01-11'),(11,7,'2016-01-11'),(11,8,'2017-01-11'),(12,1,'2006-01-11'),(12,2,'2007-01-11'),(12,3,'2008-01-11'),(12,4,'2009-01-11'),(12,5,'2010-01-11'),(12,6,'2011-01-11'),(12,7,'2012-01-11'),(12,8,'2013-01-11'),(12,9,'2014-01-11'),(13,1,'2006-01-11'),(13,2,'2007-01-11'),(13,3,'2008-01-11'),(13,4,'2009-01-11'),(13,5,'2010-01-11'),(13,6,'2011-01-11'),(13,7,'2012-01-11'),(13,8,'2013-01-11'),(13,9,'2014-01-11'),(13,10,'2015-01-11'),(14,1,'2006-01-11'),(14,2,'2007-01-11'),(14,3,'2008-01-11'),(14,4,'2009-01-11'),(14,5,'2010-01-11'),(14,6,'2011-01-11'),(14,7,'2012-01-11'),(14,8,'2013-01-11'),(14,9,'2014-01-11'),(14,10,'2015-01-11'),(15,1,'2006-01-11'),(15,2,'2007-01-11'),(15,3,'2008-01-11'),(15,4,'2009-01-11'),(15,5,'2010-01-11'),(15,6,'2011-01-11'),(15,7,'2012-01-11'),(15,8,'2013-01-11'),(15,9,'2014-01-11'),(15,10,'2015-01-11'),(25,1,'2006-01-11'),(25,2,'2007-01-11'),(25,3,'2008-01-11'),(25,4,'2009-01-11'),(25,5,'2010-01-11'),(25,6,'2011-01-11'),(25,7,'2012-01-11'),(25,8,'2013-01-11'),(25,9,'2014-01-11'),(25,10,'2015-01-11');
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `rank_num` int(11) NOT NULL,
  `rank_name` varchar(30) DEFAULT NULL,
  `belt_color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rank_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (1,'white belt','white'),(2,'yellow belt','yellow'),(3,'yellow-green belt','yellow-green'),(4,'green belt','green'),(5,'green-blue belt','green-blue'),(6,'blue belt','blue'),(7,'blue-red belt','blue-red'),(8,'red belt','red'),(9,'red-black belt','red-black'),(10,'black belt','black');
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirement` (
  `requirement_num` int(11) NOT NULL AUTO_INCREMENT,
  `requirement_content` varchar(100) DEFAULT NULL,
  `rank_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`requirement_num`),
  KEY `rank_num` (`rank_num`),
  CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`rank_num`) REFERENCES `rank` (`rank_num`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (1,'has no previous knowledge',1),(2,'pass the level two promotion test',2),(3,'have white belt',2),(4,'have yellow belt',3),(5,'pass the level three promotion test',3),(6,'pass the level four promotion test',4),(7,'have yellow belt',4),(8,'begin to grow and develop',4),(9,'pass the level five promotion test',5),(10,'have green belt',5),(11,'pass the level six promotion test',6),(12,'have green belt',6),(13,'learn basic kick skill',6),(14,'pass the level seven promotion test',7),(15,'have blue belt',7),(16,'pass the level eight promotion test',8),(17,'have blue belt',8),(18,'demonstrate TKD tenents',8),(19,'pass the level nine promotion test',9),(20,'have red belt',9),(21,'pass the level ten promotion test',10),(22,'have red belt',10),(23,'maturity and proficiency in taekwondo',10);
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `stu_num` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(50) DEFAULT NULL,
  `stu_dob` date DEFAULT NULL,
  `stu_joinschool` date DEFAULT NULL,
  `stu_phone` varchar(30) DEFAULT NULL,
  `stu_email` varchar(30) DEFAULT NULL,
  `stu_address` varchar(50) DEFAULT NULL,
  `stu_is_student` tinyint(1) DEFAULT NULL,
  `stu_is_active` tinyint(1) DEFAULT NULL,
  `stu_current_rank` int(11) DEFAULT NULL,
  `stu_mother_num` int(11) DEFAULT NULL,
  `stu_father_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`stu_num`),
  KEY `stu_current_rank` (`stu_current_rank`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`stu_current_rank`) REFERENCES `rank` (`rank_num`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'John','1990-03-18','2017-03-07','2261234567','abc@uwindsor.ca','99 Randolph Ave, Windsor, ON',1,1,1,NULL,NULL),(2,'Mary','1991-04-08','2016-09-01','2269154672','Mary110@uwindsor.ca','99 Rankin Ave, Windsor, ON',1,1,1,NULL,NULL),(3,'Anna','1996-10-03','2015-01-11','2269264673','Anna102@uwindsor.ca','550 Randoloh Ave, Windsor, ON',1,1,2,NULL,NULL),(4,'Lily','1993-03-27','2014-09-10','2269374674','Lily@uwindsor.ca','445 Randoloh Ave, Windsor, ON',1,1,4,NULL,NULL),(5,'Emily','1993-02-27','2015-09-20','2269484675','Emily@uwindsor.ca','446 Randoloh Ave, Windsor, ON',1,1,3,NULL,NULL),(6,'Annie','1992-05-15','2015-08-10','2269334654','Annie@uwindsor.ca','227 Randoloh Ave, Windsor, ON',1,1,4,NULL,NULL),(7,'Angela','1991-08-27','2014-07-20','2269254654','Angela@uwindsor.ca','226 Randoloh Ave, Windsor, ON',1,1,5,NULL,NULL),(8,'Amy','1992-05-16','2015-08-11','2269384754','Amy@uwindsor.ca','215 Randoloh Ave, Windsor, ON',0,1,6,NULL,NULL),(9,'Penny','1993-07-27','2015-08-23','2264564754','Penny@uwindsor.ca','289 Randoloh Ave, Windsor, ON',1,0,6,NULL,NULL),(10,'Sheldon','1992-05-30','2015-09-30','2269345654','Sheldon@uwindsor.ca','555 Randoloh Ave, Windsor, ON',1,1,7,NULL,NULL),(11,'Phebe','1991-04-28','2015-09-29','2269367894','Phebe@uwindsor.ca','489 Randoloh Ave, Windsor, ON',1,1,8,NULL,NULL),(12,'Monica','1990-09-28','2015-11-29','2269300004','Monica@uwindsor.ca','123 Randoloh Ave, Windsor, ON',1,1,9,NULL,NULL),(13,'Nicole','1990-06-28','2006-11-29','2269311104','Nicole@uwindsor.ca','123 Bridge Ave, Windsor, ON',1,1,10,NULL,NULL),(14,'Frank','1988-06-28','2006-12-29','2269333104','Frank@uwindsor.ca','133 Bridge Ave, Windsor, ON',0,0,10,NULL,NULL),(15,'Leo','1996-10-03','2007-01-05','22692222204','Leo@uwindsor.ca','445 Randolph Ave, Windsor, ON',1,1,10,NULL,NULL),(25,'Chloe','1990-06-28','2006-11-29','2269311104','Chloe@uwindsor.ca','123 Bridge Ave, Windsor, ON',0,0,10,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-08 12:30:48
