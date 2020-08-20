-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: movies
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES UTF8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `Actor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Actor_Fname` varchar(25) DEFAULT NULL,
  `Actor_Lname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Actor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Josh','Brolin'),(2,'Robert','DowneyJr.'),(3,'Leaonardo','DiCaprio'),(4,'Rose','DeWitt'),(5,'Daniel','Craig'),(6,'Donnie','Yen'),(7,'Johnny','Depp'),(8,'Louise','Leplee'),(9,'Tae-sik','Cha'),(10,'Rick','Blaine'),(11,'Ilsa','Lund'),(12,'Harrison','Ford'),(13,'Karen','Allen'),(14,'Tom','Holland');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `Director_Id` int(11) NOT NULL AUTO_INCREMENT,
  `D_Fname` varchar(25) DEFAULT NULL,
  `D_Lname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Director_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Anthony','Russo'),(2,'Joe','Russo'),(3,'James','Cameron'),(4,'Marc','Forster'),(5,'Wilson','Yip'),(6,'Joachim','Ronning'),(7,'Espen','Sandberg'),(8,'Olivier','Dahan'),(9,'Lee','Jeong-beom'),(10,'Michael','Curtiz'),(11,'Steven','Spielberg'),(12,'Jon','Watts');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `Movie_Id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(70) DEFAULT NULL,
  `Release_Year` varchar(4) DEFAULT NULL,
  `Language` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Movie_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Avengers Endgame','2019','English'),(2,'Titanic','1997','English'),(3,'Quantum of Solace','2008','English'),(4,'IP Man','2008','Mandarin'),(6,'Pirates of the Caribbean: Dead Men Tell No Tales','2017','English'),(7,'La Vie en rose','2007','French'),(9,'Casablanca','1942','English'),(10,'Indiana Jones and the Raiders of the Lost Ark','1981','English'),(11,'The Man from Nowhere','2010','Korean'),(13,'SpiderMan Far From Home','2019','English');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_cast` (
  `Act_Id` int(11) DEFAULT NULL,
  `MovieID` int(11) DEFAULT NULL,
  KEY `Act_Id` (`Act_Id`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`Act_Id`) REFERENCES `actor` (`Actor_ID`),
  CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`Movie_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_cast`
--

LOCK TABLES `movie_cast` WRITE;
/*!40000 ALTER TABLE `movie_cast` DISABLE KEYS */;
INSERT INTO `movie_cast` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,4),(7,6),(8,7),(9,11),(10,9),(11,9),(12,10),(13,10),(14,13);
/*!40000 ALTER TABLE `movie_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_direction`
--

DROP TABLE IF EXISTS `movie_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_direction` (
  `MovieID` int(11) DEFAULT NULL,
  `DirectorId` int(11) DEFAULT NULL,
  KEY `MovieID` (`MovieID`),
  KEY `DirectorId` (`DirectorId`),
  CONSTRAINT `movie_direction_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`Movie_Id`),
  CONSTRAINT `movie_direction_ibfk_2` FOREIGN KEY (`DirectorId`) REFERENCES `director` (`Director_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_direction`
--

LOCK TABLES `movie_direction` WRITE;
/*!40000 ALTER TABLE `movie_direction` DISABLE KEYS */;
INSERT INTO `movie_direction` VALUES (1,1),(2,1),(3,2),(4,3),(6,6),(7,6),(9,11),(10,9),(11,10),(13,12);
/*!40000 ALTER TABLE `movie_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Name` varchar(20) DEFAULT NULL,
  `pass` varchar(70) DEFAULT NULL,
  `Email` varchar(40) NOT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `User_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Dhvanil','1630937c3d00b4f4b153599d93469963','dhvanil123@gmail.com','Shah','Sunny'),('Dhvanil','6199031a5f810c809d20cd3bb2562f0f','dhvanilshah@gmail.com','Shah','Sunnyx');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-17 16:49:03
