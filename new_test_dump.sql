-- MySQL dump 10.13  Distrib 8.0.12, for osx10.13 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `armor`
--

DROP TABLE IF EXISTS `armor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `armor` (
  `age` int(11) NOT NULL,
  `year_of_manufacture` int(11) NOT NULL,
  `resistence` int(11) NOT NULL,
  `serial_no` int(11) NOT NULL,
  PRIMARY KEY (`serial_no`),
  CONSTRAINT `armor_ibfk_1` FOREIGN KEY (`serial_no`) REFERENCES `equipment` (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor`
--

LOCK TABLES `armor` WRITE;
/*!40000 ALTER TABLE `armor` DISABLE KEYS */;
INSERT INTO `armor` VALUES (2,2016,99,1),(4,2014,97,2),(5,2013,90,3),(2,2016,90,4),(1,2018,100,5);
/*!40000 ALTER TABLE `armor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armory`
--

DROP TABLE IF EXISTS `armory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `armory` (
  `armoury_no` int(11) NOT NULL,
  `required_security_clearance` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `serial_no` int(11) NOT NULL,
  `officer_id` int(11) NOT NULL,
  PRIMARY KEY (`armoury_no`),
  KEY `serial_no` (`serial_no`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `armory_ibfk_1` FOREIGN KEY (`serial_no`) REFERENCES `equipment` (`serial_no`),
  CONSTRAINT `armory_ibfk_2` FOREIGN KEY (`officer_id`) REFERENCES `engineer` (`officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armory`
--

LOCK TABLES `armory` WRITE;
/*!40000 ALTER TABLE `armory` DISABLE KEYS */;
INSERT INTO `armory` VALUES (1,'LEVEL 2','CHENNAI',1,101),(2,'LEVEL 3','DELHI',2,102),(3,'LEVEL 1','MUMBAI',3,103),(4,'LEVEL 2','KOLKATA',4,104),(5,'LEVEL 3','BANGALORE',5,105);
/*!40000 ALTER TABLE `armory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrack_maintainer`
--

DROP TABLE IF EXISTS `barrack_maintainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `barrack_maintainer` (
  `emp_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  KEY `emp_id` (`emp_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `barrack_maintainer_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `maintainer` (`emp_id`),
  CONSTRAINT `barrack_maintainer_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `barracks` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrack_maintainer`
--

LOCK TABLES `barrack_maintainer` WRITE;
/*!40000 ALTER TABLE `barrack_maintainer` DISABLE KEYS */;
/*!40000 ALTER TABLE `barrack_maintainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barracks`
--

DROP TABLE IF EXISTS `barracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `barracks` (
  `b_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `incharge` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `officer_id` int(11) NOT NULL,
  PRIMARY KEY (`b_id`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `barracks_ibfk_1` FOREIGN KEY (`officer_id`) REFERENCES `officer` (`officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barracks`
--

LOCK TABLES `barracks` WRITE;
/*!40000 ALTER TABLE `barracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `barracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `training_name` varchar(100) NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `officer_personal_number` int(11) NOT NULL,
  `officer_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`officer_id`) REFERENCES `officer` (`officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'jumping','2001-02-12','2011-02-12',987636,102),(2,'climbing','2001-03-12','2011-03-12',1001,101),(3,'shooting','2001-04-12','2011-04-12',1002,105),(4,'running','2012-04-12','2024-04-12',1001,104),(5,'swimming','2012-05-12','2024-05-12',1004,103);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `division` (
  `div_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `responsibilities` varchar(100) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  PRIMARY KEY (`div_id`),
  KEY `inventory_id` (`inventory_id`),
  CONSTRAINT `division_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `rations` (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (3666,'Rick','Paratrooper',4),(4456,'Fidel','Paratrooper',1),(5432,'Weston','Medic',5),(6666,'Chet','Sniper',3),(6969,'Vaughn','Food supply',2);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `engineer` (
  `name` varchar(100) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `officer_id` int(11) NOT NULL,
  PRIMARY KEY (`officer_id`),
  CONSTRAINT `engineer_ibfk_1` FOREIGN KEY (`officer_id`) REFERENCES `officer` (`officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer`
--

LOCK TABLES `engineer` WRITE;
/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` VALUES ('John','Hunting',101),('Panther','Building',102),('Richard','Bomb Squad',103),('Stephan','Electrical',104),('Manuel','Hunting',105);
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equipment` (
  `serial_no` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `required_licence` varchar(5) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,2,'YES','GUN'),(2,4,'YES','GUN'),(3,3,'YES','GUN'),(4,7,'YES','GUN'),(5,1,'YES','GUN');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_maintenance`
--

DROP TABLE IF EXISTS `equipment_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equipment_maintenance` (
  `incharge` varchar(100) NOT NULL,
  `serial_no` int(11) NOT NULL,
  `officer_id` int(11) NOT NULL,
  PRIMARY KEY (`serial_no`,`officer_id`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `equipment_maintenance_ibfk_1` FOREIGN KEY (`serial_no`) REFERENCES `equipment` (`serial_no`),
  CONSTRAINT `equipment_maintenance_ibfk_2` FOREIGN KEY (`officer_id`) REFERENCES `engineer` (`officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_maintenance`
--

LOCK TABLES `equipment_maintenance` WRITE;
/*!40000 ALTER TABLE `equipment_maintenance` DISABLE KEYS */;
INSERT INTO `equipment_maintenance` VALUES ('JOHN',1,101),('PANTHER',2,102),('RICHARD',3,103),('STEPHAN',4,104),('MANUEL',5,105);
/*!40000 ALTER TABLE `equipment_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainer`
--

DROP TABLE IF EXISTS `maintainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `maintainer` (
  `emp_id` int(11) NOT NULL,
  `emp_type` varchar(20) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainer`
--

LOCK TABLES `maintainer` WRITE;
/*!40000 ALTER TABLE `maintainer` DISABLE KEYS */;
INSERT INTO `maintainer` VALUES (1,'Janitor'),(2,'Sweeper'),(3,'Toilet-cleaner'),(4,'Iron Man'),(5,'Nanny');
/*!40000 ALTER TABLE `maintainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `officer` (
  `officer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `personal_number` int(11) NOT NULL,
  `officer_rank` varchar(100) NOT NULL,
  `vehicle_reg_no` int(11) NOT NULL,
  `soldier_id` int(11) NOT NULL,
  PRIMARY KEY (`officer_id`),
  KEY `vehicle_reg_no` (`vehicle_reg_no`),
  KEY `soldier_id` (`soldier_id`),
  CONSTRAINT `officer_ibfk_1` FOREIGN KEY (`vehicle_reg_no`) REFERENCES `vehicle` (`reg_no`),
  CONSTRAINT `officer_ibfk_2` FOREIGN KEY (`soldier_id`) REFERENCES `soldier` (`soldier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer`
--

LOCK TABLES `officer` WRITE;
/*!40000 ALTER TABLE `officer` DISABLE KEYS */;
INSERT INTO `officer` VALUES (101,'John',987636,'Captain',1003,2),(102,'Panther',873948,'Lieutenant',1001,1),(103,'Richard',789384,'Major',1002,5),(104,'Stephan',982432,'Major General',1001,4),(105,'Manuel',78934,'Colnel',1004,3);
/*!40000 ALTER TABLE `officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rations`
--

DROP TABLE IF EXISTS `rations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rations` (
  `inventory_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rations`
--

LOCK TABLES `rations` WRITE;
/*!40000 ALTER TABLE `rations` DISABLE KEYS */;
INSERT INTO `rations` VALUES (1,'FOOD','BREAD',1000,'Bread is a staple food prepared from a dough of flour and water, usually by baking. Throughout recorded history it has been a prominent food in large parts of the world and is one of the oldest man-made foods, having been of significant importance since the dawn of agriculture.'),(2,'DRINKS','INSTANT COFFEE MIX',1000,'Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species.'),(3,'FOOD','Pocket Sandwich',2000,'A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein two or more pieces of bread serve as a container or wrapper for another food type.'),(4,'DRINKS','WATER',100000,'Essential and It is vital for all known forms of life, even though it provides no calories or organic nutrients. Wikipedia'),(5,'FOOD','BISCUITS',1000,'Biscuit is a term used for a variety of primarily flour-based baked food products.');
/*!40000 ALTER TABLE `rations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soldier`
--

DROP TABLE IF EXISTS `soldier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `soldier` (
  `soldier_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `soldier_rank` varchar(100) NOT NULL,
  `bloodtype` varchar(100) NOT NULL,
  `recruitmentdate` varchar(20) NOT NULL,
  `personal_number` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  PRIMARY KEY (`soldier_id`),
  KEY `instructor_id` (`instructor_id`),
  CONSTRAINT `soldier_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `division` (`div_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soldier`
--

LOCK TABLES `soldier` WRITE;
/*!40000 ALTER TABLE `soldier` DISABLE KEYS */;
INSERT INTO `soldier` VALUES (1,'Tom B. Erichsen','Skagen',30,46,'Commander','B+','01/02/2008',62,4456),(2,'Sam','sung',23,42,'Lieutenant','A+','03/05/2009',32,5432),(3,'Brad','pitt',46,52,'General','O+','02/04/2006',34,6666),(4,'Pitt','Bull',69,82,'Major','O+','23/01/2007',41,6969),(5,'Bruce','Wayne',99,99,'Captain','B+','27/05/2016',36,3666);
/*!40000 ALTER TABLE `soldier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soldier_in_barrack`
--

DROP TABLE IF EXISTS `soldier_in_barrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `soldier_in_barrack` (
  `soldier_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  KEY `soldier_id` (`soldier_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `soldier_in_barrack_ibfk_1` FOREIGN KEY (`soldier_id`) REFERENCES `soldier` (`soldier_id`),
  CONSTRAINT `soldier_in_barrack_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `barracks` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soldier_in_barrack`
--

LOCK TABLES `soldier_in_barrack` WRITE;
/*!40000 ALTER TABLE `soldier_in_barrack` DISABLE KEYS */;
/*!40000 ALTER TABLE `soldier_in_barrack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soldiers_courses`
--

DROP TABLE IF EXISTS `soldiers_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `soldiers_courses` (
  `course_id` int(11) NOT NULL,
  `soldier_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`soldier_id`),
  KEY `soldier_id` (`soldier_id`),
  CONSTRAINT `soldiers_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `soldiers_courses_ibfk_2` FOREIGN KEY (`soldier_id`) REFERENCES `soldier` (`soldier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soldiers_courses`
--

LOCK TABLES `soldiers_courses` WRITE;
/*!40000 ALTER TABLE `soldiers_courses` DISABLE KEYS */;
INSERT INTO `soldiers_courses` VALUES (2,1),(3,1),(1,2),(2,2),(5,3),(4,4),(1,5),(3,5);
/*!40000 ALTER TABLE `soldiers_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicle` (
  `reg_no` int(11) NOT NULL,
  `officer_personal_number` int(11) NOT NULL,
  `vehicle_number` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `weight` int(11) NOT NULL,
  `soldier_id` int(11) NOT NULL,
  PRIMARY KEY (`reg_no`),
  KEY `soldier_id` (`soldier_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`soldier_id`) REFERENCES `soldier` (`soldier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1001,873948,2,'Battle Tank',99000,1),(1002,789384,1,'Humvee',10100,5),(1003,987636,3,'Desert Patrol Vehicle',20000,2),(1004,789334,4,'Light Strike Vehicle',10500,3),(1005,982432,5,'M970',30100,4);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon`
--

DROP TABLE IF EXISTS `weapon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `weapon` (
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `reload_time` int(11) NOT NULL,
  `firing_rate` float NOT NULL,
  `damage` int(11) NOT NULL,
  `serial_no` int(11) NOT NULL,
  PRIMARY KEY (`serial_no`),
  CONSTRAINT `fk` FOREIGN KEY (`serial_no`) REFERENCES `equipment` (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon`
--

LOCK TABLES `weapon` WRITE;
/*!40000 ALTER TABLE `weapon` DISABLE KEYS */;
INSERT INTO `weapon` VALUES ('AK47','RIFLE',3,600,36,1),('M4A4','RIFLE',2,650,31,2),('MP7','SUBMACHINE',2,700,25,3),('M249','HEAVY',6,800,40,4),('P250','PISTOL',2,400,15,5);
/*!40000 ALTER TABLE `weapon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-27  9:07:20
