-- MySQL dump 10.16  Distrib 10.3.9-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: augus
-- ------------------------------------------------------
-- Server version	10.3.9-MariaDB

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `carID` varchar(20) NOT NULL,
  `carType` varchar(20) DEFAULT NULL,
  `routeID` varchar(20) DEFAULT NULL,
  `carProDate` date DEFAULT NULL,
  `carBuyDate` date DEFAULT NULL,
  `carCapacity` int(11) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`carID`),
  KEY `routeID` (`routeID`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`routeID`) REFERENCES `role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `cityID` varchar(20) NOT NULL,
  `cityName` varchar(20) DEFAULT NULL,
  `provinceName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cityID`),
  KEY `provinceName` (`provinceName`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`provinceName`) REFERENCES `province` (`provinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cityarea`
--

DROP TABLE IF EXISTS `cityarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cityarea` (
  `areaID` varchar(20) NOT NULL,
  `areaName` varchar(20) DEFAULT NULL,
  `cityID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`areaID`),
  KEY `cityID` (`cityID`),
  CONSTRAINT `cityarea_ibfk_1` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cityarea`
--

LOCK TABLES `cityarea` WRITE;
/*!40000 ALTER TABLE `cityarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `cityarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `cuID` varchar(20) NOT NULL,
  `customerName` varchar(20) DEFAULT NULL,
  `customerPsd` varchar(20) DEFAULT NULL,
  `customerSex` char(10) DEFAULT NULL,
  `Brithday` date DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  `roleID` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cuID`),
  KEY `roleID` (`roleID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryplace`
--

DROP TABLE IF EXISTS `deliveryplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveryplace` (
  `dePID` varchar(20) NOT NULL,
  `dePName` varchar(20) DEFAULT NULL,
  `provinceID` varchar(20) DEFAULT NULL,
  `cityID` varchar(20) DEFAULT NULL,
  `mgID` varchar(20) DEFAULT NULL,
  `dePTel` varchar(20) DEFAULT NULL,
  `dePAddr` varchar(100) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dePID`),
  KEY `provinceID` (`provinceID`),
  KEY `cityID` (`cityID`),
  KEY `mgID` (`mgID`),
  CONSTRAINT `deliveryplace_ibfk_1` FOREIGN KEY (`provinceID`) REFERENCES `province` (`provinceID`),
  CONSTRAINT `deliveryplace_ibfk_2` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`),
  CONSTRAINT `deliveryplace_ibfk_3` FOREIGN KEY (`mgID`) REFERENCES `manager` (`mgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryplace`
--

LOCK TABLES `deliveryplace` WRITE;
/*!40000 ALTER TABLE `deliveryplace` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryrange`
--

DROP TABLE IF EXISTS `deliveryrange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveryrange` (
  `rangeID` varchar(20) NOT NULL,
  `dePID` varchar(20) DEFAULT NULL,
  `areaID` varchar(20) DEFAULT NULL,
  `rangeName` varchar(20) DEFAULT NULL,
  `deliveryPrice` decimal(20,0) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rangeID`),
  KEY `dePID` (`dePID`),
  CONSTRAINT `deliveryrange_ibfk_1` FOREIGN KEY (`dePID`) REFERENCES `province` (`provinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryrange`
--

LOCK TABLES `deliveryrange` WRITE;
/*!40000 ALTER TABLE `deliveryrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryreceipt`
--

DROP TABLE IF EXISTS `deliveryreceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveryreceipt` (
  `deliveryReceiptID` varchar(20) NOT NULL,
  `startCity` varchar(20) DEFAULT NULL,
  `endCity` varchar(20) DEFAULT NULL,
  `midCity` varchar(20) DEFAULT NULL,
  `makeDate` date DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`deliveryReceiptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryreceipt`
--

LOCK TABLES `deliveryreceipt` WRITE;
/*!40000 ALTER TABLE `deliveryreceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryreceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `mgID` varchar(20) NOT NULL,
  `managerName` varchar(20) DEFAULT NULL,
  `managerPsd` varchar(20) DEFAULT NULL,
  `managerSex` char(10) DEFAULT NULL,
  `managerStatus` int(11) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mgID`),
  KEY `role` (`role`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderID` varchar(20) NOT NULL,
  `postPName` varchar(20) DEFAULT NULL,
  `postPTel` varchar(20) DEFAULT NULL,
  `postPAddr` varchar(50) DEFAULT NULL,
  `getPName` varchar(20) DEFAULT NULL,
  `getPTel` varchar(20) DEFAULT NULL,
  `getPAddr` varchar(50) DEFAULT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `goodsWeight` int(11) DEFAULT NULL,
  `orderType` varchar(10) DEFAULT NULL,
  `orderState` varchar(20) DEFAULT NULL,
  `transportPrice` decimal(20,0) DEFAULT NULL,
  `deliceryPrice` decimal(20,0) DEFAULT NULL,
  `totalPrice` varchar(20) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `provinceID` varchar(20) NOT NULL,
  `provinceName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`provinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleID` varchar(20) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  `Comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `routeID` varchar(20) NOT NULL,
  `routeName` varchar(20) DEFAULT NULL,
  `startProvice` varchar(20) DEFAULT NULL,
  `startCity` varchar(20) DEFAULT NULL,
  `endProwince` varchar(20) DEFAULT NULL,
  `endCity` varchar(20) DEFAULT NULL,
  `midProwince` varchar(20) DEFAULT NULL,
  `midCity` varchar(20) DEFAULT NULL,
  `transportPrice` decimal(20,0) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`routeID`),
  KEY `startCity` (`startCity`),
  KEY `endCity` (`endCity`),
  KEY `midCity` (`midCity`),
  KEY `startProvice` (`startProvice`),
  KEY `endProwince` (`endProwince`),
  KEY `midProwince` (`midProwince`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`startCity`) REFERENCES `city` (`cityID`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`endCity`) REFERENCES `city` (`cityID`),
  CONSTRAINT `route_ibfk_3` FOREIGN KEY (`midCity`) REFERENCES `city` (`cityID`),
  CONSTRAINT `route_ibfk_4` FOREIGN KEY (`startProvice`) REFERENCES `province` (`provinceID`),
  CONSTRAINT `route_ibfk_5` FOREIGN KEY (`endProwince`) REFERENCES `province` (`provinceID`),
  CONSTRAINT `route_ibfk_6` FOREIGN KEY (`midProwince`) REFERENCES `province` (`provinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-21 19:38:05
