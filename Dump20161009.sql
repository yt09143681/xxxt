-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: facility
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `保养记录`
--

DROP TABLE IF EXISTS `保养记录`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养记录` (
  `id保养记录` int(11) NOT NULL AUTO_INCREMENT,
  `设备号` int(11) DEFAULT NULL,
  `设备id` int(11) DEFAULT NULL,
  `保养人` varchar(45) DEFAULT NULL,
  `保养日期` varchar(45) DEFAULT NULL,
  `保养周期` varchar(45) DEFAULT NULL,
  `保养班组` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id保养记录`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养记录`
--

LOCK TABLES `保养记录` WRITE;
/*!40000 ALTER TABLE `保养记录` DISABLE KEYS */;
INSERT INTO `保养记录` VALUES (1,123,2,'张三','2016年4月2日','年检','第6组');
/*!40000 ALTER TABLE `保养记录` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `保养项目`
--

DROP TABLE IF EXISTS `保养项目`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养项目` (
  `id保养项目` int(11) NOT NULL AUTO_INCREMENT,
  `设备类别id` int(11) DEFAULT NULL,
  `项目内容` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id保养项目`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养项目`
--

LOCK TABLES `保养项目` WRITE;
/*!40000 ALTER TABLE `保养项目` DISABLE KEYS */;
INSERT INTO `保养项目` VALUES (1,2,'电缆固定情况'),(2,2,'电机接线盒固定情况'),(3,2,'扭矩开关'),(4,2,'电机电位器滑环有无损坏'),(5,2,'启停按钮固定工作情况'),(6,2,'提升电机提耙时限位开关动作情况');
/*!40000 ALTER TABLE `保养项目` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `维修记录`
--

DROP TABLE IF EXISTS `维修记录`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `维修记录` (
  `id保养项目记录` int(11) NOT NULL AUTO_INCREMENT,
  `保养项目id` int(11) DEFAULT NULL,
  `完成情况` varchar(45) DEFAULT NULL,
  `所需配件id` int(11) DEFAULT NULL,
  `配件数量` int(11) DEFAULT NULL,
  `设备id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id保养项目记录`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `维修记录`
--

LOCK TABLES `维修记录` WRITE;
/*!40000 ALTER TABLE `维修记录` DISABLE KEYS */;
INSERT INTO `维修记录` VALUES (1,1,'完好',NULL,NULL,1),(2,2,'维修',1,1,1),(3,3,'完好',NULL,NULL,1),(4,4,'维修',2,1,1),(5,5,'完好',NULL,NULL,1),(6,6,'完好',NULL,NULL,1);
/*!40000 ALTER TABLE `维修记录` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备`
--

DROP TABLE IF EXISTS `设备`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备` (
  `id设备` int(11) NOT NULL,
  `设备类别id` int(11) DEFAULT NULL,
  `设备号` varchar(45) DEFAULT NULL,
  `设备名称` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id设备`),
  KEY `FK1_idx` (`设备类别id`),
  CONSTRAINT `FK1` FOREIGN KEY (`设备类别id`) REFERENCES `设备类别` (`id设备类别`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备`
--

LOCK TABLES `设备` WRITE;
/*!40000 ALTER TABLE `设备` DISABLE KEYS */;
INSERT INTO `设备` VALUES (1,2,'123','A8浓缩机');
/*!40000 ALTER TABLE `设备` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备类别`
--

DROP TABLE IF EXISTS `设备类别`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备类别` (
  `id设备类别` int(11) NOT NULL,
  `类别名称` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id设备类别`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备类别`
--

LOCK TABLES `设备类别` WRITE;
/*!40000 ALTER TABLE `设备类别` DISABLE KEYS */;
INSERT INTO `设备类别` VALUES (1,'变频器'),(2,'浓缩机');
/*!40000 ALTER TABLE `设备类别` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `配件`
--

DROP TABLE IF EXISTS `配件`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `配件` (
  `id配件` int(11) NOT NULL,
  `配件名称` varchar(45) DEFAULT NULL,
  `剩余数量` int(11) DEFAULT NULL,
  PRIMARY KEY (`id配件`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `配件`
--

LOCK TABLES `配件` WRITE;
/*!40000 ALTER TABLE `配件` DISABLE KEYS */;
INSERT INTO `配件` VALUES (1,'电机接线盒',50),(2,'滑环',30);
/*!40000 ALTER TABLE `配件` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-09 20:30:16
