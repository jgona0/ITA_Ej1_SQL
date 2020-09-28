-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `BRAND`
--

DROP TABLE IF EXISTS `BRAND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BRAND` (
  `id_brand` int NOT NULL,
  `de_name` varchar(45) DEFAULT NULL,
  `id_suplier` int NOT NULL,
  PRIMARY KEY (`id_brand`),
  KEY `fk_BRAND_SUPPLIER1_idx` (`id_suplier`),
  CONSTRAINT `fk_BRAND_SUPPLIER1` FOREIGN KEY (`id_suplier`) REFERENCES `SUPPLIER` (`id_suplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRAND`
--

LOCK TABLES `BRAND` WRITE;
/*!40000 ALTER TABLE `BRAND` DISABLE KEYS */;
INSERT INTO `BRAND` VALUES (1,'Carrera',1),(2,'Rayban',1),(3,'Hawkers',2),(4,'Vogue',3);
/*!40000 ALTER TABLE `BRAND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COSTUMER`
--

DROP TABLE IF EXISTS `COSTUMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COSTUMER` (
  `id_costumer` int NOT NULL,
  `de_name` varchar(45) DEFAULT NULL,
  `de_adress` varchar(45) DEFAULT NULL,
  `de_telf` int DEFAULT NULL,
  `de_email` varchar(45) DEFAULT NULL,
  `date_register` datetime DEFAULT NULL,
  `id_costumer_refere` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_costumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COSTUMER`
--

LOCK TABLES `COSTUMER` WRITE;
/*!40000 ALTER TABLE `COSTUMER` DISABLE KEYS */;
INSERT INTO `COSTUMER` VALUES (1,'Paco','Prim',656789876,'paco@paco.es','2020-10-01 00:00:00',NULL),(2,'Pedro','Balmes',23462389,'pedro@pedro.es','2020-10-02 00:00:00',NULL),(3,'Ana','Diagonal',9876535,'ana@ana.es','2020-10-03 00:00:00','2');
/*!40000 ALTER TABLE `COSTUMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE` (
  `id_employee` int NOT NULL,
  `de_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES (1,'Maria'),(2,'Juan'),(3,'Sara');
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GLASS`
--

DROP TABLE IF EXISTS `GLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GLASS` (
  `id_glass` int NOT NULL,
  `id_brand` int NOT NULL,
  `de_grad_left` double DEFAULT NULL,
  `de_grad_right` double DEFAULT NULL,
  `de_mont_type` varchar(45) DEFAULT NULL,
  `de_mont_colour` varchar(45) DEFAULT NULL,
  `de_color_left` varchar(45) DEFAULT NULL,
  `de_color_right` varchar(45) DEFAULT NULL,
  `m_price` double DEFAULT NULL,
  `id_costumer` int NOT NULL,
  `id_employee` int NOT NULL,
  PRIMARY KEY (`id_glass`),
  KEY `fk_GLASS_BRAND1_idx` (`id_brand`),
  KEY `fk_GLASS_COSTUMER1_idx` (`id_costumer`),
  KEY `fk_GLASS_EMPLOYEE1_idx` (`id_employee`),
  CONSTRAINT `fk_GLASS_BRAND1` FOREIGN KEY (`id_brand`) REFERENCES `BRAND` (`id_brand`),
  CONSTRAINT `fk_GLASS_COSTUMER1` FOREIGN KEY (`id_costumer`) REFERENCES `COSTUMER` (`id_costumer`),
  CONSTRAINT `fk_GLASS_EMPLOYEE1` FOREIGN KEY (`id_employee`) REFERENCES `EMPLOYEE` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GLASS`
--

LOCK TABLES `GLASS` WRITE;
/*!40000 ALTER TABLE `GLASS` DISABLE KEYS */;
INSERT INTO `GLASS` VALUES (1,1,1,2,'Aire','Azul','Blanco','Blanco',100,1,2),(2,1,2,1,'Pasta','Rojo','Blanco','Blanco',200,1,1),(3,2,8,8,'Tope','Amarillo','Negro','Negro',300,2,3);
/*!40000 ALTER TABLE `GLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER` (
  `id_suplier` int NOT NULL,
  `de_name` varchar(45) DEFAULT NULL,
  `de_adress` varchar(45) DEFAULT NULL,
  `de_adr_num` varchar(45) DEFAULT NULL,
  `de_adr_floor` varchar(45) DEFAULT NULL,
  `de_adr_door` varchar(45) DEFAULT NULL,
  `de_city` varchar(45) DEFAULT NULL,
  `de_cp` int DEFAULT NULL,
  `de_country` varchar(45) DEFAULT NULL,
  `de_telf` int DEFAULT NULL,
  `de_fax` int DEFAULT NULL,
  `de_nif` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_suplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER`
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES (1,'Sup1','Balmes','10','2','4','Barcelona',8019,'Spain',666555444,444555666,'1234567B'),(2,'Sup2','Llull','12','1','5','Barcelona',8020,'Spain',111222333,222333444,'1234432C'),(3,'Sup3','Gran Via','30','5','4','Barcelona',8045,'Spain',4445566,99887665,'9887654D');
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-28 11:23:09
