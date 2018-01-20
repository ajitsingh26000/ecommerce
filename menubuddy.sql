-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: menubuddy
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.10.1

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
-- Table structure for table `cafeteria`
--

DROP TABLE IF EXISTS `cafeteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cafeteria` (
  `cafeteriaId` int(11) NOT NULL AUTO_INCREMENT,
  `cafName` varchar(50) DEFAULT NULL,
  `sellerId` varchar(30) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  `imgURI` varchar(300) DEFAULT NULL,
  `breakFastTime` varchar(15) DEFAULT NULL,
  `lunchTime` varchar(15) DEFAULT NULL,
  `teaTime` varchar(15) DEFAULT NULL,
  `dinnertime` varchar(15) DEFAULT NULL,
  `openingTime` varchar(15) DEFAULT NULL,
  `contactNumber` varchar(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cafeteriaId`),
  KEY `sellerId` (`sellerId`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `cafeteria_ibfk_1` FOREIGN KEY (`sellerId`) REFERENCES `seller` (`sellerId`) ON DELETE CASCADE,
  CONSTRAINT `cafeteria_ibfk_2` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafeteria`
--

LOCK TABLES `cafeteria` WRITE;
/*!40000 ALTER TABLE `cafeteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `cafeteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `combo` (
  `comboId` int(11) NOT NULL AUTO_INCREMENT,
  `cafeteriaId` int(11) DEFAULT NULL,
  `comboName` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`comboId`),
  KEY `cafeteriaId` (`cafeteriaId`),
  CONSTRAINT `combo_ibfk_1` FOREIGN KEY (`cafeteriaId`) REFERENCES `cafeteria` (`cafeteriaId`),
  CONSTRAINT `combo_ibfk_2` FOREIGN KEY (`cafeteriaId`) REFERENCES `cafeteria` (`cafeteriaId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combolist`
--

DROP TABLE IF EXISTS `combolist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `combolist` (
  `comboId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  KEY `comboId` (`comboId`),
  KEY `itemId` (`itemId`),
  CONSTRAINT `combolist_ibfk_1` FOREIGN KEY (`comboId`) REFERENCES `combo` (`comboId`) ON DELETE CASCADE,
  CONSTRAINT `combolist_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `item` (`ItemId`) ON DELETE CASCADE,
  CONSTRAINT `combolist_ibfk_3` FOREIGN KEY (`comboId`) REFERENCES `combo` (`comboId`),
  CONSTRAINT `combolist_ibfk_4` FOREIGN KEY (`itemId`) REFERENCES `item` (`ItemId`),
  CONSTRAINT `combolist_ibfk_5` FOREIGN KEY (`comboId`) REFERENCES `combo` (`comboId`) ON DELETE CASCADE,
  CONSTRAINT `combolist_ibfk_6` FOREIGN KEY (`itemId`) REFERENCES `item` (`ItemId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combolist`
--

LOCK TABLES `combolist` WRITE;
/*!40000 ALTER TABLE `combolist` DISABLE KEYS */;
/*!40000 ALTER TABLE `combolist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combomenulist`
--

DROP TABLE IF EXISTS `combomenulist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `combomenulist` (
  `menuId` int(11) DEFAULT NULL,
  `comboId` int(11) DEFAULT NULL,
  KEY `menuId` (`menuId`),
  KEY `comboId` (`comboId`),
  CONSTRAINT `combomenulist_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`MenuId`) ON DELETE CASCADE,
  CONSTRAINT `combomenulist_ibfk_2` FOREIGN KEY (`comboId`) REFERENCES `combo` (`comboId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combomenulist`
--

LOCK TABLES `combomenulist` WRITE;
/*!40000 ALTER TABLE `combomenulist` DISABLE KEYS */;
/*!40000 ALTER TABLE `combomenulist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `imgURI` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`companyId`),
  KEY `search` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (8,'AA','Sector-3','Shanghai','/hclru'),(9,'AB','Sector-3','Lagos','/hclru'),(10,'AC','Sector-3','Istanbul','/hclru'),(11,'AD','Sector-3','Karachi','/hclru'),(12,'AE','Sector-3','Mumbai','/hclru'),(13,'AF','Sector-3','Moscow','/hclru'),(14,'BA','Sector-3','Beijing','/hclru'),(15,'BB','Sector-3','Guangzhou','/hclru'),(16,'BC','Sector-3','Delhi','/hclru'),(17,'BD','Sector-3','Lahore','/hclru'),(18,'BE','Sector-3','Shenzhen','/hclru'),(19,'BF','Sector-3','Seoul','/hclru'),(20,'CA','Sector-3','Jakarta','/hclru'),(21,'CB','Sector-3','Tianjin','/hclru'),(22,'CC','Sector-3','Chennai','/hclru'),(23,'CD','Sector-3','Tokyo','/hclru'),(24,'CE','Sector-3','Cairo','/hclru'),(25,'CF','Sector-3','Dhaka','/hclru'),(26,'DA','Sector-3','Mexico City','/hclru'),(27,'DB','Sector-3','Kinshasa','/hclru'),(28,'DC','Sector-3','Bangalore','/hclru'),(29,'DD','Sector-3','New York','/hclru'),(30,'DE','Sector-3','London','/hclru'),(31,'DF','Sector-3','Bangkok','/hclru'),(32,'AA','Sector-3','Shanghai','/hclru'),(33,'AB','Sector-3','Lagos','/hclru'),(34,'AC','Sector-3','Istanbul','/hclru'),(35,'AD','Sector-3','Karachi','/hclru'),(36,'AE','Sector-3','Mumbai','/hclru'),(37,'AF','Sector-3','Moscow','/hclru'),(38,'BA','Sector-3','Beijing','/hclru'),(39,'BB','Sector-3','Guangzhou','/hclru'),(40,'BC','Sector-3','Delhi','/hclru'),(41,'BD','Sector-3','Lahore','/hclru'),(42,'BE','Sector-3','Shenzhen','/hclru'),(43,'BF','Sector-3','Seoul','/hclru'),(44,'CA','Sector-3','Jakarta','/hclru'),(45,'CB','Sector-3','Tianjin','/hclru'),(46,'CC','Sector-3','Chennai','/hclru'),(47,'CD','Sector-3','Tokyo','/hclru'),(48,'CE','Sector-3','Cairo','/hclru'),(49,'CF','Sector-3','Dhaka','/hclru'),(50,'DA','Sector-3','Mexico City','/hclru'),(51,'DB','Sector-3','Kinshasa','/hclru'),(52,'DC','Sector-3','Bangalore','/hclru'),(53,'DD','Sector-3','New York','/hclru'),(54,'DE','Sector-3','London','/hclru'),(55,'DF','Sector-3','Bangkok','/hclru'),(56,'AA','Sector-3','Shanghai','/hclru'),(57,'AB','Sector-3','Lagos','/hclru'),(58,'AC','Sector-3','Istanbul','/hclru'),(59,'AD','Sector-3','Karachi','/hclru'),(60,'AE','Sector-3','Mumbai','/hclru'),(61,'AF','Sector-3','Moscow','/hclru'),(62,'BA','Sector-3','Beijing','/hclru'),(63,'BB','Sector-3','Guangzhou','/hclru'),(64,'BC','Sector-3','Delhi','/hclru'),(65,'BD','Sector-3','Lahore','/hclru'),(66,'BE','Sector-3','Shenzhen','/hclru'),(67,'BF','Sector-3','Seoul','/hclru'),(68,'CA','Sector-3','Jakarta','/hclru'),(69,'CB','Sector-3','Tianjin','/hclru'),(70,'CC','Sector-3','Chennai','/hclru'),(71,'CD','Sector-3','Tokyo','/hclru'),(72,'CE','Sector-3','Cairo','/hclru'),(73,'CF','Sector-3','Dhaka','/hclru'),(74,'DA','Sector-3','Mexico City','/hclru'),(75,'DB','Sector-3','Kinshasa','/hclru'),(76,'DC','Sector-3','Bangalore','/hclru'),(77,'DD','Sector-3','New York','/hclru'),(78,'DE','Sector-3','London','/hclru'),(79,'DF','Sector-3','Bangkok','/hclru'),(80,'AA','Sector-3','Shanghai','/hclru'),(81,'AB','Sector-3','Lagos','/hclru'),(82,'AC','Sector-3','Istanbul','/hclru'),(83,'AD','Sector-3','Karachi','/hclru'),(84,'AE','Sector-3','Mumbai','/hclru'),(85,'AF','Sector-3','Moscow','/hclru'),(86,'BA','Sector-3','Beijing','/hclru'),(87,'BB','Sector-3','Guangzhou','/hclru'),(88,'BC','Sector-3','Delhi','/hclru'),(89,'BD','Sector-3','Lahore','/hclru'),(90,'BE','Sector-3','Shenzhen','/hclru'),(91,'BF','Sector-3','Seoul','/hclru');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `cafeteriaId` int(11) DEFAULT NULL,
  `ItemId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `itemType` varchar(20) DEFAULT NULL,
  `qtrPrice` int(11) DEFAULT NULL,
  `halfPrice` int(11) DEFAULT NULL,
  `fullPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`ItemId`),
  KEY `cafeteriaId` (`cafeteriaId`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`cafeteriaId`) REFERENCES `cafeteria` (`cafeteriaId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemlist`
--

DROP TABLE IF EXISTS `itemlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemlist` (
  `menuId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  KEY `menuId` (`menuId`),
  KEY `itemId` (`itemId`),
  CONSTRAINT `itemlist_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`MenuId`),
  CONSTRAINT `itemlist_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `item` (`ItemId`),
  CONSTRAINT `itemlist_ibfk_3` FOREIGN KEY (`menuId`) REFERENCES `menu` (`MenuId`) ON DELETE CASCADE,
  CONSTRAINT `itemlist_ibfk_4` FOREIGN KEY (`itemId`) REFERENCES `item` (`ItemId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemlist`
--

LOCK TABLES `itemlist` WRITE;
/*!40000 ALTER TABLE `itemlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `MenuId` int(11) NOT NULL AUTO_INCREMENT,
  `CafeteriaId` int(11) DEFAULT NULL,
  `MenuType` varchar(30) DEFAULT NULL,
  `days` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MenuId`),
  KEY `CafeteriaId` (`CafeteriaId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`CafeteriaId`) REFERENCES `cafeteria` (`cafeteriaId`),
  CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`CafeteriaId`) REFERENCES `cafeteria` (`cafeteriaId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `sellerId` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `contactNo` varchar(10) DEFAULT NULL,
  `imageURI` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `speciality` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sellerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-20 17:20:22
