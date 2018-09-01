-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_ecommerce
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `tb_addresses`
--

DROP TABLE IF EXISTS `tb_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_addresses` (
  `idaddress` int(11) NOT NULL AUTO_INCREMENT,
  `idperson` int(11) NOT NULL,
  `desaddress` varchar(128) NOT NULL,
  `descomplement` varchar(32) DEFAULT NULL,
  `descity` varchar(32) NOT NULL,
  `desstate` varchar(32) NOT NULL,
  `descountry` varchar(32) NOT NULL,
  `deszipcode` char(8) NOT NULL,
  `desdistrict` varchar(32) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idaddress`),
  KEY `fk_addresses_persons_idx` (`idperson`),
  CONSTRAINT `fk_addresses_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_addresses`
--

LOCK TABLES `tb_addresses` WRITE;
/*!40000 ALTER TABLE `tb_addresses` DISABLE KEYS */;
INSERT INTO `tb_addresses` VALUES (1,1,'reetetttt','fff','rrrr','rrrr','rrrr','dgfger','rrrrr','2018-08-31 23:55:37'),(2,1,'Rua Beija Flor','310A','jANDIRA','São Paulo','Brasil','06624-15','JARDIM NOSSA DE FATIMA','2018-09-01 00:40:52'),(3,1,'Rua Armando José Araújo','','Jandira','SP','Brasil','06624150','Jardim Nossa Senhora de FÃ¡tima','2018-09-01 01:02:33'),(4,1,'Rua Beija Flor, 310A, 310A, 310A, 310A','310A','jANDIRA','São Paulo','Brasil','06624-15','Jardim Nossa Senhora de FÃ¡tima','2018-09-01 01:03:00'),(5,1,'Rua Beija-Flôr','','Jandira','SP','Brasil','06624155','Jardim Nossa Senhora de FÃ¡tima','2018-09-01 01:30:08'),(6,1,'Rua Beija-Flôr','','Jandira','SP','Brasil','06624155','Jardim Nossa Senhora de FÃ¡tima','2018-09-01 01:31:30'),(7,1,'Avenida Morumbi','até 1000 - lado par','São Paulo','SP','Brasil','0560601','Morumbi','2018-09-01 03:18:11');
/*!40000 ALTER TABLE `tb_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carts`
--

DROP TABLE IF EXISTS `tb_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_carts` (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `dessessionid` varchar(64) NOT NULL,
  `iduser` int(11) DEFAULT NULL,
  `deszipcode` char(8) DEFAULT NULL,
  `vlfreight` decimal(10,2) DEFAULT NULL,
  `nrdays` int(11) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcart`),
  KEY `FK_carts_users_idx` (`iduser`),
  CONSTRAINT `fk_carts_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carts`
--

LOCK TABLES `tb_carts` WRITE;
/*!40000 ALTER TABLE `tb_carts` DISABLE KEYS */;
INSERT INTO `tb_carts` VALUES (1,'n5nrktct7h0fhl7qjnq05dm0av',1,NULL,NULL,NULL,'2018-08-04 22:13:47'),(2,'ioq04qnn0ntm88aav43hmlvjhf',NULL,NULL,NULL,NULL,'2018-08-05 18:52:07'),(3,'nunu338uc6itpp1vrcestnfa8f',NULL,NULL,40.00,1,'2018-08-11 16:11:50'),(4,'suanggh606cccudo00tfeectcp',NULL,NULL,40.00,1,'2018-08-11 21:56:00'),(5,'8tjod511aaf13u7r7o7c0kq6at',NULL,NULL,0.00,0,'2018-08-11 21:59:41'),(6,'89624q80mq42su1thb52s1v504',NULL,NULL,36.60,1,'2018-08-13 22:55:02'),(7,'o1o6oimhhck67p4pvf2cvhmpua',NULL,NULL,NULL,NULL,'2018-08-13 23:03:10'),(8,'4oo5vps4l3qistvmkr4r6v5no4',NULL,NULL,32.40,1,'2018-08-15 01:06:36'),(9,'avkp4svj494r2eus9i7lgf2t8j',NULL,NULL,32.40,1,'2018-08-15 01:14:56'),(10,'upemid5pkjn8kr103vu5s2vkll',NULL,NULL,NULL,NULL,'2018-08-16 23:15:36'),(11,'pllu6g9tfd0garhprp3085cjni',1,NULL,36.60,1,'2018-08-19 18:50:09'),(12,'pgvp70iedtrs0inetnfaf8u84h',NULL,NULL,32.40,1,'2018-08-20 23:42:06'),(13,'5q4j4d028joqt840k1358ghoe2',NULL,NULL,32.40,1,'2018-08-24 23:30:54'),(14,'f7h1a59b4lrpl9dp1g3kamt33a',NULL,NULL,32.40,1,'2018-08-26 17:55:31'),(15,'ekp4um91he5t9edahclv4v6sj1',NULL,NULL,NULL,NULL,'2018-08-26 18:30:58'),(16,'9bj1pkdvv8q89b8gsk9ci6rcbd',NULL,NULL,32.40,1,'2018-08-26 18:32:22'),(17,'kpphvhb5hb50b09ktgm65mvile',NULL,'0560601',0.00,0,'2018-08-31 23:41:37');
/*!40000 ALTER TABLE `tb_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cartsproducts`
--

DROP TABLE IF EXISTS `tb_cartsproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cartsproducts` (
  `idcartproduct` int(11) NOT NULL AUTO_INCREMENT,
  `idcart` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  `dtremoved` datetime DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcartproduct`),
  KEY `FK_cartsproducts_carts_idx` (`idcart`),
  KEY `FK_cartsproducts_products_idx` (`idproduct`),
  CONSTRAINT `fk_cartsproducts_carts` FOREIGN KEY (`idcart`) REFERENCES `tb_carts` (`idcart`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartsproducts_products` FOREIGN KEY (`idproduct`) REFERENCES `tb_products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cartsproducts`
--

LOCK TABLES `tb_cartsproducts` WRITE;
/*!40000 ALTER TABLE `tb_cartsproducts` DISABLE KEYS */;
INSERT INTO `tb_cartsproducts` VALUES (1,2,18,'2018-08-05 15:55:42','2018-08-05 18:52:07'),(2,2,17,'0000-00-00 00:00:00','2018-08-05 18:54:30'),(3,2,17,'2018-08-05 16:15:06','2018-08-05 19:12:58'),(4,2,17,'2018-08-05 16:15:11','2018-08-05 19:13:10'),(5,2,17,'2018-08-05 16:15:14','2018-08-05 19:13:16'),(6,2,17,'2018-08-05 16:15:53','2018-08-05 19:13:19'),(7,2,17,'2018-08-05 16:16:21','2018-08-05 19:13:30'),(8,2,17,'2018-08-05 16:16:22','2018-08-05 19:13:56'),(9,2,17,'2018-08-05 16:16:29','2018-08-05 19:14:00'),(10,2,17,'2018-08-05 16:27:02','2018-08-05 19:14:00'),(11,2,17,'2018-08-05 16:27:02','2018-08-05 19:14:03'),(12,2,17,'2018-08-05 16:27:02','2018-08-05 19:14:10'),(13,2,17,'2018-08-05 16:27:02','2018-08-05 19:14:10'),(14,2,17,'2018-08-05 16:27:02','2018-08-05 19:14:10'),(15,2,17,'2018-08-05 16:27:02','2018-08-05 19:15:17'),(16,2,17,'2018-08-05 16:27:02','2018-08-05 19:16:04'),(17,2,17,'2018-08-05 16:27:02','2018-08-05 19:16:16'),(18,2,17,'2018-08-05 16:27:02','2018-08-05 19:16:33'),(19,2,17,'2018-08-05 16:27:02','2018-08-05 19:16:33'),(20,2,17,'2018-08-05 16:27:02','2018-08-05 19:26:02'),(21,2,17,'2018-08-05 16:27:02','2018-08-05 19:26:11'),(22,2,17,'2018-08-05 16:27:02','2018-08-05 19:26:16'),(23,2,17,'2018-08-05 16:27:02','2018-08-05 19:26:20'),(24,2,17,'2018-08-05 16:27:02','2018-08-05 19:26:24'),(25,2,17,'2018-08-05 16:27:02','2018-08-05 19:26:43'),(26,2,17,'2018-08-05 16:27:02','2018-08-05 19:26:47'),(27,2,17,'2018-08-05 16:27:02','2018-08-05 19:26:51'),(28,2,18,'2018-08-05 16:34:59','2018-08-05 19:27:44'),(29,2,18,'2018-08-05 16:34:59','2018-08-05 19:34:48'),(30,2,18,'2018-08-05 16:34:59','2018-08-05 19:34:48'),(31,2,18,'2018-08-05 16:34:59','2018-08-05 19:34:48'),(32,2,18,'2018-08-05 16:34:59','2018-08-05 19:34:48'),(33,2,18,'2018-08-05 16:34:59','2018-08-05 19:34:48'),(34,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:12'),(35,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:13'),(36,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:13'),(37,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:13'),(38,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:13'),(39,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:13'),(40,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:13'),(41,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:13'),(42,2,18,'2018-08-05 16:36:24','2018-08-05 19:35:28'),(43,3,18,'2018-08-11 13:12:03','2018-08-11 16:11:50'),(44,3,18,'2018-08-11 16:05:21','2018-08-11 16:12:00'),(45,3,18,'2018-08-11 17:07:02','2018-08-11 16:12:36'),(46,3,16,'2018-08-11 13:17:24','2018-08-11 16:16:53'),(47,3,18,'2018-08-11 17:07:03','2018-08-11 18:27:10'),(48,3,18,'2018-08-11 17:07:33','2018-08-11 19:05:13'),(49,3,18,'2018-08-11 17:07:33','2018-08-11 19:05:18'),(50,3,18,'2018-08-11 17:07:34','2018-08-11 20:06:53'),(51,3,18,'2018-08-11 17:07:34','2018-08-11 20:06:56'),(52,3,18,'2018-08-11 17:07:34','2018-08-11 20:06:57'),(53,3,18,'2018-08-11 17:07:34','2018-08-11 20:06:58'),(54,3,18,'2018-08-11 17:07:34','2018-08-11 20:06:58'),(55,3,18,'2018-08-11 17:07:34','2018-08-11 20:06:59'),(56,3,18,'2018-08-11 17:07:34','2018-08-11 20:06:59'),(57,3,18,'2018-08-11 17:07:35','2018-08-11 20:06:59'),(58,3,18,'2018-08-11 17:07:35','2018-08-11 20:06:59'),(59,3,18,'2018-08-11 17:07:35','2018-08-11 20:06:59'),(60,3,18,'2018-08-11 17:07:35','2018-08-11 20:06:59'),(61,3,18,'2018-08-11 17:07:36','2018-08-11 20:07:00'),(62,3,18,'2018-08-11 17:07:36','2018-08-11 20:07:00'),(63,3,18,'2018-08-11 17:07:45','2018-08-11 20:07:00'),(64,3,18,'2018-08-11 17:07:45','2018-08-11 20:07:00'),(65,3,18,'2018-08-11 17:14:45','2018-08-11 20:07:00'),(66,3,18,'2018-08-11 17:15:18','2018-08-11 20:07:00'),(67,3,18,'2018-08-11 17:15:22','2018-08-11 20:07:00'),(68,3,18,'2018-08-11 17:16:54','2018-08-11 20:07:00'),(69,3,18,'2018-08-11 17:16:54','2018-08-11 20:07:05'),(70,3,18,'2018-08-11 17:16:54','2018-08-11 20:07:07'),(71,3,18,'2018-08-11 17:16:54','2018-08-11 20:14:37'),(72,3,18,'2018-08-11 17:16:54','2018-08-11 20:14:42'),(73,3,18,'2018-08-11 17:16:54','2018-08-11 20:15:25'),(74,3,17,'2018-08-11 17:20:34','2018-08-11 20:17:19'),(75,3,17,'2018-08-11 17:20:39','2018-08-11 20:17:23'),(76,3,17,'2018-08-11 17:20:45','2018-08-11 20:17:28'),(77,3,17,'2018-08-11 18:54:08','2018-08-11 20:17:36'),(78,3,17,'2018-08-11 18:54:08','2018-08-11 20:18:55'),(79,3,18,'2018-08-11 17:20:30','2018-08-11 20:19:35'),(80,3,17,'2018-08-11 18:54:08','2018-08-11 20:48:27'),(81,3,17,'2018-08-11 18:54:08','2018-08-11 20:54:35'),(82,3,18,NULL,'2018-08-11 21:54:00'),(83,3,18,NULL,'2018-08-11 21:54:20'),(84,3,18,NULL,'2018-08-11 21:54:26'),(85,3,18,NULL,'2018-08-11 21:54:41'),(86,3,18,NULL,'2018-08-11 21:55:42'),(87,4,18,NULL,'2018-08-11 21:56:28'),(88,4,18,NULL,'2018-08-11 21:56:31'),(89,4,18,NULL,'2018-08-11 21:56:31'),(90,5,18,NULL,'2018-08-11 21:59:41'),(91,5,18,NULL,'2018-08-11 22:15:47'),(92,5,18,NULL,'2018-08-11 22:16:06'),(93,5,18,NULL,'2018-08-11 22:16:12'),(94,5,18,NULL,'2018-08-11 22:16:45'),(95,5,18,NULL,'2018-08-11 22:16:50'),(96,6,15,'2018-08-13 20:03:33','2018-08-13 22:55:03'),(97,6,15,'2018-08-13 20:03:33','2018-08-13 22:56:18'),(98,6,15,'2018-08-13 20:03:33','2018-08-13 22:56:23'),(99,6,15,'2018-08-13 20:03:33','2018-08-13 22:56:29'),(100,6,18,'2018-08-13 20:01:24','2018-08-13 22:57:28'),(101,6,18,'2018-08-13 20:01:24','2018-08-13 22:57:28'),(102,6,18,'2018-08-13 20:01:24','2018-08-13 22:57:28'),(103,6,18,'2018-08-13 20:01:25','2018-08-13 22:57:28'),(104,6,18,'2018-08-13 20:01:25','2018-08-13 22:57:28'),(105,6,18,'2018-08-13 20:01:25','2018-08-13 22:57:28'),(106,6,18,'2018-08-13 20:01:25','2018-08-13 22:57:28'),(107,6,18,'2018-08-13 20:01:25','2018-08-13 22:57:28'),(108,6,18,'2018-08-13 20:01:25','2018-08-13 22:57:28'),(109,6,18,'2018-08-13 20:01:25','2018-08-13 22:57:28'),(110,6,18,'2018-08-13 20:01:25','2018-08-13 22:57:28'),(111,6,18,'2018-08-13 20:01:26','2018-08-13 22:57:28'),(112,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:28'),(113,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:28'),(114,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:28'),(115,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:28'),(116,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(117,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(118,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(119,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(120,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(121,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(122,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(123,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(124,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(125,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(126,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(127,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(128,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(129,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(130,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(131,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(132,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(133,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:29'),(134,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(135,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(136,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(137,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(138,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(139,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(140,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(141,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(142,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(143,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(144,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(145,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(146,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(147,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(148,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(149,6,18,'2018-08-13 20:01:34','2018-08-13 22:57:30'),(150,6,18,'2018-08-13 20:01:34','2018-08-13 23:01:21'),(151,6,18,NULL,'2018-08-13 23:03:43'),(152,6,18,NULL,'2018-08-13 23:04:07'),(153,6,18,NULL,'2018-08-13 23:04:24'),(154,6,18,NULL,'2018-08-13 23:04:30'),(155,6,18,NULL,'2018-08-13 23:04:36'),(156,8,18,NULL,'2018-08-15 01:06:36'),(157,9,18,NULL,'2018-08-15 01:18:22'),(158,10,15,NULL,'2018-08-16 23:19:06'),(159,10,15,NULL,'2018-08-16 23:19:15'),(160,10,17,NULL,'2018-08-17 16:35:56'),(161,10,18,NULL,'2018-08-17 23:38:45'),(162,11,18,'2018-08-19 16:20:28','2018-08-19 19:20:18'),(163,11,18,'2018-08-19 16:31:14','2018-08-19 19:30:49'),(164,11,18,'2018-08-19 16:54:15','2018-08-19 19:53:04'),(165,11,19,'2018-08-19 16:54:17','2018-08-19 19:53:44'),(166,11,18,'2018-08-19 16:55:54','2018-08-19 19:55:08'),(167,11,18,'2018-08-19 16:56:32','2018-08-19 19:56:02'),(168,11,17,'2018-08-19 16:58:04','2018-08-19 19:56:43'),(169,11,18,NULL,'2018-08-19 19:58:28'),(170,11,18,NULL,'2018-08-19 20:04:26'),(171,11,19,NULL,'2018-08-19 22:05:15'),(172,12,18,'2018-08-20 21:30:46','2018-08-21 00:25:27'),(173,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:08'),(174,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:10'),(175,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:11'),(176,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:13'),(177,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:14'),(178,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:15'),(179,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:17'),(180,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:19'),(181,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:21'),(182,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:23'),(183,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:24'),(184,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:26'),(185,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:28'),(186,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:31'),(187,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:35'),(188,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:37'),(189,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:38'),(190,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:39'),(191,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:39'),(192,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:39'),(193,12,18,'2018-08-20 21:30:46','2018-08-21 00:30:40'),(194,13,18,'2018-08-24 20:31:01','2018-08-24 23:30:54'),(195,13,18,'2018-08-24 21:55:27','2018-08-24 23:32:05'),(196,13,18,'2018-08-24 21:55:27','2018-08-25 00:53:56'),(197,13,18,'2018-08-24 21:55:27','2018-08-25 00:54:00'),(198,13,18,'2018-08-24 21:55:27','2018-08-25 00:54:06'),(199,13,18,'2018-08-24 21:56:22','2018-08-25 00:55:43'),(200,13,17,'2018-08-24 21:56:03','2018-08-25 00:55:55'),(201,13,18,NULL,'2018-08-25 00:56:30'),(202,13,18,NULL,'2018-08-25 00:56:35'),(203,13,18,NULL,'2018-08-25 00:56:37'),(204,13,18,NULL,'2018-08-25 00:56:38'),(205,13,18,NULL,'2018-08-25 00:56:39'),(206,13,18,NULL,'2018-08-25 00:56:40'),(207,13,18,NULL,'2018-08-25 00:56:40'),(208,13,18,NULL,'2018-08-25 00:56:40'),(209,13,18,NULL,'2018-08-25 00:56:41'),(210,13,18,NULL,'2018-08-25 00:56:42'),(211,13,18,NULL,'2018-08-25 00:56:42'),(212,13,18,NULL,'2018-08-25 00:56:42'),(213,13,18,NULL,'2018-08-25 00:56:42'),(214,14,18,'2018-08-26 16:31:01','2018-08-26 17:55:31'),(215,15,18,NULL,'2018-08-26 18:30:58'),(216,15,17,NULL,'2018-08-26 18:31:07'),(217,14,18,'2018-08-26 16:31:01','2018-08-26 18:31:32'),(218,16,18,NULL,'2018-08-26 18:32:22'),(219,14,18,'2018-08-26 16:31:01','2018-08-26 18:58:53'),(220,14,18,'2018-08-26 16:31:01','2018-08-26 19:11:02'),(221,14,18,'2018-08-26 16:31:01','2018-08-26 19:11:04'),(222,14,18,'2018-08-26 16:31:01','2018-08-26 19:11:05'),(223,14,18,'2018-08-26 16:31:01','2018-08-26 19:11:06'),(224,14,18,'2018-08-26 16:31:01','2018-08-26 19:11:07'),(225,14,18,'2018-08-26 16:31:01','2018-08-26 19:11:07'),(226,14,18,'2018-08-26 16:31:01','2018-08-26 19:11:08'),(227,14,18,'2018-08-26 16:31:01','2018-08-26 19:11:08'),(228,14,17,NULL,'2018-08-26 19:30:48'),(229,17,17,'2018-08-31 22:15:16','2018-08-31 23:42:22'),(230,17,18,NULL,'2018-09-01 01:17:19'),(231,17,18,NULL,'2018-09-01 01:24:18'),(232,17,18,NULL,'2018-09-01 01:24:21'),(233,17,18,NULL,'2018-09-01 01:24:22'),(234,17,18,NULL,'2018-09-01 01:24:23'),(235,17,18,NULL,'2018-09-01 01:24:24'),(236,17,18,NULL,'2018-09-01 01:24:24'),(237,17,18,NULL,'2018-09-01 01:24:25'),(238,17,18,NULL,'2018-09-01 01:24:26'),(239,17,18,NULL,'2018-09-01 01:24:26'),(240,17,18,NULL,'2018-09-01 01:24:27'),(241,17,18,NULL,'2018-09-01 01:24:31'),(242,17,15,NULL,'2018-09-01 01:30:43'),(243,17,15,NULL,'2018-09-01 01:30:50'),(244,17,15,NULL,'2018-09-01 01:30:51'),(245,17,15,NULL,'2018-09-01 01:30:51'),(246,17,15,NULL,'2018-09-01 01:30:56'),(247,17,15,NULL,'2018-09-01 01:30:58'),(248,17,15,NULL,'2018-09-01 01:30:59'),(249,17,15,NULL,'2018-09-01 01:30:59'),(250,17,15,NULL,'2018-09-01 01:30:59');
/*!40000 ALTER TABLE `tb_cartsproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categories`
--

DROP TABLE IF EXISTS `tb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categories` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `descategory` varchar(32) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categories`
--

LOCK TABLES `tb_categories` WRITE;
/*!40000 ALTER TABLE `tb_categories` DISABLE KEYS */;
INSERT INTO `tb_categories` VALUES (3,'Bolos','2018-06-09 23:53:49'),(4,'Doces','2018-06-10 00:15:09'),(5,'Salgados','2018-06-10 00:15:17');
/*!40000 ALTER TABLE `tb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_orders`
--

DROP TABLE IF EXISTS `tb_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_orders` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `idcart` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idstatus` int(11) NOT NULL,
  `vltotal` decimal(10,2) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idorder`),
  KEY `FK_orders_carts_idx` (`idcart`),
  KEY `FK_orders_users_idx` (`iduser`),
  KEY `fk_orders_ordersstatus_idx` (`idstatus`),
  CONSTRAINT `fk_orders_carts` FOREIGN KEY (`idcart`) REFERENCES `tb_carts` (`idcart`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_ordersstatus` FOREIGN KEY (`idstatus`) REFERENCES `tb_ordersstatus` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orders`
--

LOCK TABLES `tb_orders` WRITE;
/*!40000 ALTER TABLE `tb_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ordersstatus`
--

DROP TABLE IF EXISTS `tb_ordersstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ordersstatus` (
  `idstatus` int(11) NOT NULL AUTO_INCREMENT,
  `desstatus` varchar(32) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ordersstatus`
--

LOCK TABLES `tb_ordersstatus` WRITE;
/*!40000 ALTER TABLE `tb_ordersstatus` DISABLE KEYS */;
INSERT INTO `tb_ordersstatus` VALUES (1,'Em Aberto','2017-03-13 03:00:00'),(2,'Aguardando Pagamento','2017-03-13 03:00:00'),(3,'Pago','2017-03-13 03:00:00'),(4,'Entregue','2017-03-13 03:00:00');
/*!40000 ALTER TABLE `tb_ordersstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_persons`
--

DROP TABLE IF EXISTS `tb_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_persons` (
  `idperson` int(11) NOT NULL AUTO_INCREMENT,
  `desperson` varchar(64) NOT NULL,
  `desemail` varchar(128) DEFAULT NULL,
  `nrphone` bigint(20) DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idperson`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_persons`
--

LOCK TABLES `tb_persons` WRITE;
/*!40000 ALTER TABLE `tb_persons` DISABLE KEYS */;
INSERT INTO `tb_persons` VALUES (1,'Administrador','admin@casadedonabrasilina.com.br',2147483647,'2017-03-01 03:00:00'),(7,'Suporte','suporte@casadedonabrasilina.com.br',1112345678,'2017-03-15 16:10:27'),(9,'Wellington','',11912345678,'2018-05-05 19:07:59'),(10,'Wellington Sampaio','',11912345678,'2018-05-06 15:49:21'),(14,'Well Sampaio','wellington.victalino@gmail.com',0,'2018-08-15 03:35:08'),(16,'Marcos ','m-rsantos@hotmail.com',9,'2018-08-16 23:57:27'),(33,'Elita Sampaio','letovictalino@hotmail.com',42062433,'2018-08-25 04:13:17');
/*!40000 ALTER TABLE `tb_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_products`
--

DROP TABLE IF EXISTS `tb_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_products` (
  `idproduct` int(11) NOT NULL AUTO_INCREMENT,
  `desproduct` varchar(64) NOT NULL,
  `vlprice` decimal(10,2) NOT NULL,
  `vlfilling` varchar(20) NOT NULL,
  `vlweight` decimal(10,2) NOT NULL,
  `desurl` varchar(128) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_products`
--

LOCK TABLES `tb_products` WRITE;
/*!40000 ALTER TABLE `tb_products` DISABLE KEYS */;
INSERT INTO `tb_products` VALUES (15,'Doce Thor',1.50,'',2.00,'doce-thor','2018-07-08 16:43:01'),(16,'Doce Escudo CapitÃ£o AmÃ©rica',1.50,'',2.00,'doce_escudo_capitao_america','2018-07-08 17:21:40'),(17,'Doce Concha Diamante',1.50,'',2.00,'doce_concha_diamante','2018-07-08 17:22:09'),(18,'Doce Capacete do Homem de Ferro',1.50,'',2.00,'Doce_Capacete_do_Homem_de_Ferro','2018-07-08 17:22:29'),(19,'Bolo  BÃ­blia Aberta',1.50,'',2.00,'bolo-biblia','2018-07-08 17:24:58');
/*!40000 ALTER TABLE `tb_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_productscategories`
--

DROP TABLE IF EXISTS `tb_productscategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_productscategories` (
  `idcategory` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  PRIMARY KEY (`idcategory`,`idproduct`),
  KEY `fk_productscategories_products_idx` (`idproduct`),
  CONSTRAINT `fk_productscategories_categories` FOREIGN KEY (`idcategory`) REFERENCES `tb_categories` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productscategories_products` FOREIGN KEY (`idproduct`) REFERENCES `tb_products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productscategories`
--

LOCK TABLES `tb_productscategories` WRITE;
/*!40000 ALTER TABLE `tb_productscategories` DISABLE KEYS */;
INSERT INTO `tb_productscategories` VALUES (3,15),(3,19),(4,15),(4,16),(4,17),(4,18);
/*!40000 ALTER TABLE `tb_productscategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `idperson` int(11) NOT NULL,
  `deslogin` varchar(64) NOT NULL,
  `despassword` varchar(256) NOT NULL,
  `inadmin` tinyint(4) NOT NULL DEFAULT '0',
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iduser`),
  KEY `FK_users_persons_idx` (`idperson`),
  CONSTRAINT `fk_users_persons` FOREIGN KEY (`idperson`) REFERENCES `tb_persons` (`idperson`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` VALUES (1,1,'admin','$2y$12$YlooCyNvyTji8bPRcrfNfOKnVMmZA9ViM2A3IpFjmrpIbp5ovNmga',1,'2017-03-13 03:00:00'),(7,7,'suporte','$2y$12$HFjgUm/mk1RzTy4ZkJaZBe0Mc/BA2hQyoUckvm.lFa6TesjtNpiMe',1,'2017-03-15 16:10:27'),(9,9,'wellington','$2y$12$uwitLHDpBKQnEZQ3M8tpSeYzlH8HxDo3nuIlBsSNWTR1m77Gplmhq',1,'2018-05-05 19:07:59'),(10,10,'well','$2y$12$bBOL/1Y5te3svt3VPFCnuulkWJuOjHu41EN9mvUVa03P12.DhsiKq',1,'2018-05-06 15:49:21'),(11,14,'wellington.victalino@gmail.com','$2y$12$5FwfRcWwaDTFk1YglWA50uye5bwqmR4jYEH1/g7Jthgdv5cBpk4re',0,'2018-08-15 03:35:09'),(13,16,'Marcos39','$2y$12$TVVWPbEVfAOjoNOkLdh0Fu2RwMBVZ4WuDJLCjus5FWtugbvEz3qha',1,'2018-08-16 23:57:27'),(30,33,'letovictalino@hotmail.com','$2y$12$VUux.cOiOMAkYpSieMuBren3LJNVtknoI18vpMsE0k139ZDxgNebC',0,'2018-08-25 04:13:18');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userslogs`
--

DROP TABLE IF EXISTS `tb_userslogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_userslogs` (
  `idlog` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `deslog` varchar(128) NOT NULL,
  `desip` varchar(45) NOT NULL,
  `desuseragent` varchar(128) NOT NULL,
  `dessessionid` varchar(64) NOT NULL,
  `desurl` varchar(128) NOT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idlog`),
  KEY `fk_userslogs_users_idx` (`iduser`),
  CONSTRAINT `fk_userslogs_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userslogs`
--

LOCK TABLES `tb_userslogs` WRITE;
/*!40000 ALTER TABLE `tb_userslogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_userslogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userspasswordsrecoveries`
--

DROP TABLE IF EXISTS `tb_userspasswordsrecoveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_userspasswordsrecoveries` (
  `idrecovery` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `desip` varchar(45) NOT NULL,
  `dtrecovery` datetime DEFAULT NULL,
  `dtregister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idrecovery`),
  KEY `fk_userspasswordsrecoveries_users_idx` (`iduser`),
  CONSTRAINT `fk_userspasswordsrecoveries_users` FOREIGN KEY (`iduser`) REFERENCES `tb_users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userspasswordsrecoveries`
--

LOCK TABLES `tb_userspasswordsrecoveries` WRITE;
/*!40000 ALTER TABLE `tb_userspasswordsrecoveries` DISABLE KEYS */;
INSERT INTO `tb_userspasswordsrecoveries` VALUES (1,7,'127.0.0.1',NULL,'2017-03-15 16:10:59'),(2,7,'127.0.0.1','2017-03-15 13:33:45','2017-03-15 16:11:18'),(3,7,'127.0.0.1','2017-03-15 13:37:35','2017-03-15 16:37:12'),(4,9,'127.0.0.1',NULL,'2018-05-05 19:11:12'),(5,9,'127.0.0.1',NULL,'2018-05-05 19:11:24'),(6,9,'127.0.0.1',NULL,'2018-05-05 19:14:23'),(7,9,'127.0.0.1',NULL,'2018-05-05 19:19:29'),(8,9,'127.0.0.1',NULL,'2018-05-05 19:21:11'),(9,9,'127.0.0.1',NULL,'2018-05-05 19:21:14'),(10,9,'127.0.0.1',NULL,'2018-05-05 19:35:32'),(11,9,'127.0.0.1',NULL,'2018-05-06 14:43:53'),(12,9,'127.0.0.1',NULL,'2018-05-06 14:45:33'),(13,9,'127.0.0.1',NULL,'2018-05-06 14:58:04'),(14,9,'127.0.0.1',NULL,'2018-05-06 15:19:01'),(15,9,'127.0.0.1',NULL,'2018-05-06 15:34:15'),(16,9,'127.0.0.1',NULL,'2018-05-06 15:36:34'),(17,9,'127.0.0.1',NULL,'2018-05-06 15:39:42'),(18,9,'127.0.0.1',NULL,'2018-05-06 15:42:27'),(19,9,'127.0.0.1',NULL,'2018-05-06 15:44:39'),(20,10,'127.0.0.1',NULL,'2018-05-06 15:50:25'),(21,10,'127.0.0.1',NULL,'2018-05-06 15:52:15'),(22,10,'127.0.0.1',NULL,'2018-05-06 16:09:55'),(23,10,'127.0.0.1',NULL,'2018-05-12 15:18:05'),(24,10,'127.0.0.1',NULL,'2018-05-12 15:30:07'),(25,10,'127.0.0.1',NULL,'2018-05-12 17:19:49'),(26,10,'127.0.0.1',NULL,'2018-05-12 17:29:26'),(27,10,'127.0.0.1',NULL,'2018-05-12 17:39:42'),(28,10,'127.0.0.1',NULL,'2018-05-12 19:36:23'),(29,10,'127.0.0.1',NULL,'2018-05-14 23:30:34'),(30,10,'127.0.0.1',NULL,'2018-05-14 23:30:52'),(31,10,'127.0.0.1',NULL,'2018-05-15 10:22:49'),(32,10,'127.0.0.1',NULL,'2018-05-18 02:58:43'),(33,10,'127.0.0.1',NULL,'2018-05-18 03:04:27'),(34,10,'127.0.0.1',NULL,'2018-07-06 00:28:53'),(35,10,'127.0.0.1',NULL,'2018-07-07 00:38:13'),(36,10,'127.0.0.1',NULL,'2018-07-08 17:17:23'),(37,10,'127.0.0.1',NULL,'2018-08-19 16:16:35'),(38,10,'127.0.0.1',NULL,'2018-08-19 16:27:12'),(39,10,'127.0.0.1',NULL,'2018-08-19 17:05:42'),(40,10,'127.0.0.1',NULL,'2018-08-19 17:08:07'),(41,10,'127.0.0.1',NULL,'2018-08-19 17:08:58'),(42,10,'127.0.0.1','2018-08-19 14:22:44','2018-08-19 17:22:13'),(43,11,'127.0.0.1','2018-08-24 22:29:05','2018-08-25 01:25:59'),(44,11,'127.0.0.1','2018-08-24 22:33:42','2018-08-25 01:33:11'),(45,9,'127.0.0.1','2018-08-25 01:00:11','2018-08-25 03:58:09');
/*!40000 ALTER TABLE `tb_userspasswordsrecoveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_ecommerce'
--

--
-- Dumping routines for database 'db_ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_addresses_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addresses_save`(
pidaddress int(11), 
pidperson int(11),
pdesaddress varchar(128),
pdescomplement varchar(32),
pdescity varchar(32),
pdesstate varchar(32),
pdescountry varchar(32),
pdeszipcode char(8),
pdesdistrict varchar(32)
)
BEGIN

	IF pidaddress > 0 THEN
		
		UPDATE tb_addresses
        SET
			idperson = pidperson,
            desaddress = pdesaddress,
            descomplement = pdescomplement,
            descity = pdescity,
            desstate = pdesstate,
            descountry = pdescountry,
            deszipcode = pdeszipcode, 
            desdistrict = pdesdistrict
		WHERE idaddress = pidaddress;
        
    ELSE
		
		INSERT INTO tb_addresses (idperson, desaddress, descomplement, descity, desstate, descountry, deszipcode, desdistrict)
        VALUES(pidperson, pdesaddress, pdescomplement, pdescity, pdesstate, pdescountry, pdeszipcode, pdesdistrict);
        
        SET pidaddress = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_addresses WHERE idaddress = pidaddress;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carts_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carts_save`(
pidcart INT,
pdessessionid VARCHAR(64),
piduser INT,
pdeszipcode CHAR(8),
pvlfreight DECIMAL(10,2),
pnrdays INT
)
BEGIN

    IF pidcart > 0 THEN
        
        UPDATE tb_carts
        SET
            dessessionid = pdessessionid,
            iduser = piduser,
            deszipcode = pdeszipcode,
            vlfreight = pvlfreight,
            nrdays = pnrdays
        WHERE idcart = pidcart;
        
    ELSE
        
        INSERT INTO tb_carts (dessessionid, iduser, deszipcode, vlfreight, nrdays)
        VALUES(pdessessionid, piduser, pdeszipcode, pvlfreight, pnrdays);
        
        SET pidcart = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_carts WHERE idcart = pidcart;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categories_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categories_save`(
pidcategory INT,
pdescategory VARCHAR(64)
)
BEGIN
	
	IF pidcategory > 0 THEN
		
		UPDATE tb_categories
        SET descategory = pdescategory
        WHERE idcategory = pidcategory;
        
    ELSE
		
		INSERT INTO tb_categories (descategory) VALUES(pdescategory);
        
        SET pidcategory = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_categories WHERE idcategory = pidcategory;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_products_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_products_save`(IN `pidproduct` INT(11), IN `pdesproduct` VARCHAR(64), IN `pvlprice` DECIMAL(10,2), IN `pvlfilling` VARCHAR(20), IN `pvlweight` DECIMAL(10,2), IN `pdesurl` VARCHAR(128))
BEGIN
	
	IF pidproduct > 0 THEN
		
		UPDATE tb_products
        SET 
			desproduct = pdesproduct,
            vlprice = pvlprice,
            vlfilling = pvlfilling,
            vlweight = pvlweight,
            desurl = pdesurl
        WHERE idproduct = pidproduct;
        
    ELSE
		
		INSERT INTO tb_products (desproduct, vlprice, vlfilling, vlweight, desurl) 
        VALUES(pdesproduct, pvlprice, pvlfilling, pvlweight, pdesurl);
        
        SET pidproduct = LAST_INSERT_ID();
        
    END IF;
    
    SELECT * FROM tb_products WHERE idproduct = pidproduct;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_userspasswordsrecoveries_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_userspasswordsrecoveries_create`(`piduser` INT, `pdesip` VARCHAR(45))
BEGIN
	
	INSERT INTO tb_userspasswordsrecoveries (iduser, desip)
    VALUES(piduser, pdesip);
    
    SELECT * FROM tb_userspasswordsrecoveries
    WHERE idrecovery = LAST_INSERT_ID();
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usersupdate_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usersupdate_save`(`piduser` INT, `pdesperson` VARCHAR(64), `pdeslogin` VARCHAR(64), `pdespassword` VARCHAR(256), `pdesemail` VARCHAR(128), `pnrphone` BIGINT, `pinadmin` TINYINT)
BEGIN
	
    DECLARE vidperson INT;
    
	SELECT idperson INTO vidperson
    FROM tb_users
    WHERE iduser = piduser;
    
    UPDATE tb_persons
    SET 
		desperson = pdesperson,
        desemail = pdesemail,
        nrphone = pnrphone
	WHERE idperson = vidperson;
    
    UPDATE tb_users
    SET
		deslogin = pdeslogin,
        despassword = pdespassword,
        inadmin = pinadmin
	WHERE iduser = piduser;
    
    SELECT * FROM tb_users a INNER JOIN tb_persons b USING(idperson) WHERE a.iduser = piduser;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_delete`(`piduser` INT)
BEGIN
	
    DECLARE vidperson INT;
    
	SELECT idperson INTO vidperson
    FROM tb_users
    WHERE iduser = piduser;
    
    DELETE FROM tb_users WHERE iduser = piduser;
    DELETE FROM tb_persons WHERE idperson = vidperson;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users_save`(`pdesperson` VARCHAR(64), `pdeslogin` VARCHAR(64), `pdespassword` VARCHAR(256), `pdesemail` VARCHAR(128), `pnrphone` BIGINT, `pinadmin` TINYINT)
BEGIN
	
    DECLARE vidperson INT;
    
	INSERT INTO tb_persons (desperson, desemail, nrphone)
    VALUES(pdesperson, pdesemail, pnrphone);
    
    SET vidperson = LAST_INSERT_ID();
    
    INSERT INTO tb_users (idperson, deslogin, despassword, inadmin)
    VALUES(vidperson, pdeslogin, pdespassword, pinadmin);
    
    SELECT * FROM tb_users a INNER JOIN tb_persons b USING(idperson) WHERE a.iduser = LAST_INSERT_ID();
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-01  0:21:54
