-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: film
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `ActorID` int NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Nationality` varchar(20) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ActorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1001,'Hritik Roshan','1974-01-10','Indian','Male'),(1002,'Deepika Padukone','1986-01-05','Indian','Female'),(1003,'Ranbir Kapoor','1982-09-28','Indian','Male'),(1004,'Aamir Khan','1965-03-14','Indian','Male'),(1005,'Priyanka Chopra','1982-07-18','Indian','Female'),(1006,'John Abraham','1972-12-17','Indian','Male'),(1007,'Rishab Shetty','1983-07-07','Indian','Male'),(1008,'Leonardo DiCaprio','1974-11-11','American','Male'),(1009,'Kate Winslet','1975-10-05','British','Female'),(1010,'Park Seo-joon','1988-12-16','South Korean','Male');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acts_in`
--

DROP TABLE IF EXISTS `acts_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acts_in` (
  `M_id` int NOT NULL,
  `A_id` int NOT NULL,
  PRIMARY KEY (`M_id`,`A_id`),
  KEY `acts_in_A_id_fk` (`A_id`),
  CONSTRAINT `acts_in_A_id_fk` FOREIGN KEY (`A_id`) REFERENCES `actors` (`ActorID`),
  CONSTRAINT `acts_in_M_id_fk` FOREIGN KEY (`M_id`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acts_in`
--

LOCK TABLES `acts_in` WRITE;
/*!40000 ALTER TABLE `acts_in` DISABLE KEYS */;
INSERT INTO `acts_in` VALUES (1,1002),(5,1002),(1,1003),(5,1003),(2,1004),(7,1005),(7,1006),(3,1007),(4,1008),(6,1010);
/*!40000 ALTER TABLE `acts_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boxoffice_record`
--

DROP TABLE IF EXISTS `boxoffice_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boxoffice_record` (
  `BID` int NOT NULL,
  `Earnings_IN_Crores` int DEFAULT NULL,
  `M_id` int DEFAULT NULL,
  PRIMARY KEY (`BID`),
  KEY `BoxOffice_Record_M_id_fk` (`M_id`),
  CONSTRAINT `BoxOffice_Record_M_id_fk` FOREIGN KEY (`M_id`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxoffice_record`
--

LOCK TABLES `boxoffice_record` WRITE;
/*!40000 ALTER TABLE `boxoffice_record` DISABLE KEYS */;
INSERT INTO `boxoffice_record` VALUES (11,320,1),(12,460,2),(13,450,3),(14,3893,4),(15,137,5),(16,2186,6),(17,101,7);
/*!40000 ALTER TABLE `boxoffice_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `determines`
--

DROP TABLE IF EXISTS `determines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `determines` (
  `R_id` int NOT NULL,
  `Box_id` int NOT NULL,
  PRIMARY KEY (`R_id`,`Box_id`),
  KEY `determines_Box_id_fk` (`Box_id`),
  CONSTRAINT `determines_Box_id_fk` FOREIGN KEY (`Box_id`) REFERENCES `boxoffice_record` (`BID`),
  CONSTRAINT `determines_R_id_fk` FOREIGN KEY (`R_id`) REFERENCES `review` (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `determines`
--

LOCK TABLES `determines` WRITE;
/*!40000 ALTER TABLE `determines` DISABLE KEYS */;
INSERT INTO `determines` VALUES (101,11),(102,12),(103,13),(104,14),(105,15),(106,16),(107,17);
/*!40000 ALTER TABLE `determines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `DirectorID` int NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Experience_IN_years` int DEFAULT NULL,
  `M_id` int DEFAULT NULL,
  PRIMARY KEY (`DirectorID`),
  KEY `director_M_id_fk` (`M_id`),
  CONSTRAINT `director_M_id_fk` FOREIGN KEY (`M_id`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (51,'Ayan Mukerji',14,1),(52,'Rajkumar Hirani',20,2),(53,'Rishab Shetty',7,3),(54,'Christopher Nolan',25,4),(55,'Imtiaz Ali',18,5),(56,'Bong Joon-ho',23,6),(57,'Tarun Mansukhani',15,7);
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finances`
--

DROP TABLE IF EXISTS `finances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finances` (
  `M_id` int NOT NULL,
  `Prod_id` int NOT NULL,
  PRIMARY KEY (`M_id`,`Prod_id`),
  KEY `finanaces_Prod_id_fk` (`Prod_id`),
  CONSTRAINT `finanaces_M_id_fk` FOREIGN KEY (`M_id`) REFERENCES `movie` (`MovieID`),
  CONSTRAINT `finanaces_Prod_id_fk` FOREIGN KEY (`Prod_id`) REFERENCES `producer` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finances`
--

LOCK TABLES `finances` WRITE;
/*!40000 ALTER TABLE `finances` DISABLE KEYS */;
INSERT INTO `finances` VALUES (1,201),(7,201),(2,202),(3,203),(4,204),(4,205),(5,206),(6,207),(6,208),(6,209);
/*!40000 ALTER TABLE `finances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `MovieID` int NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Genre` varchar(20) DEFAULT NULL,
  `Language` varchar(20) DEFAULT NULL,
  `Budget_IN_Crores` int DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `R_id` int DEFAULT NULL,
  PRIMARY KEY (`MovieID`),
  KEY `movie_R_id_fk` (`R_id`),
  CONSTRAINT `movie_R_id_fk` FOREIGN KEY (`R_id`) REFERENCES `review` (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Yeh Jawaani Hai Deewani','Romcom','Hindi',40,'2013-05-31',101),(2,'3 Idiots','Drama','Hindi',55,'2009-12-25',102),(3,'Kantara','Thriller','Kannada',16,'2022-09-30',103),(4,'Inception','Sci-Fi','English',752,'2010-07-16',104),(5,'Tamasha','Romcom','Hindi',87,'2015-11-27',105),(6,'Parasite','Drama','Korean',128,'2019-05-30',106),(7,'Dostana','Romcom','Hindi',40,'2008-11-14',107);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `PID` int NOT NULL,
  `Pname` varchar(20) DEFAULT NULL,
  `Exp_IN_Years` int DEFAULT NULL,
  `ProductionHouse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (201,'Karan Johar',20,'Dharma Productions'),(202,'Vidhu Vinod Chopra',38,'Vinod Chopra Films'),(203,'Vijay Kiragandur',9,'Hombale Films'),(204,'Emma Thomas',25,'Warner Bros. Pictures'),(205,'Christopher Nolan',25,'Warner Bros. Pictures'),(206,'Sajid Nadiadwala',31,'Nadiadwala Grandson Entertainment'),(207,'Kwak Sin-ae',15,'Barunson E&A'),(208,'Bong Joon Ho',9,'Barunson E&A'),(209,'Moon Yang Kwan',3,'Barunson E&A');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ReviewID` int NOT NULL,
  `Rating` float DEFAULT NULL,
  `ReviewText` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (101,7.2,'Blockbuster'),(102,8.4,'Blockbuster'),(103,8.2,'Blockbuster'),(104,8.8,'Super Hit'),(105,7.3,'Semi Hit'),(106,8.5,'Super Hit'),(107,6.4,'Hit');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-11 11:17:56
