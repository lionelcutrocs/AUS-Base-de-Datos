-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sist-multas
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB

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
-- Table structure for table `auto_multa`
--

DROP TABLE IF EXISTS `auto_multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_multa` (
  `id_multa` varchar(100) NOT NULL,
  `id_auto` varchar(100) DEFAULT NULL,
  `id_ubi` varchar(100) DEFAULT NULL,
  `id_razon` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_multa`),
  KEY `auto_multa_autos_FK` (`id_auto`),
  KEY `auto_multa_ubicacion_FK` (`id_ubi`),
  KEY `auto_multa_detalle_deuda_FK` (`id_razon`),
  CONSTRAINT `auto_multa_autos_FK` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id-auto`),
  CONSTRAINT `auto_multa_detalle_deuda_FK` FOREIGN KEY (`id_razon`) REFERENCES `detalle.deuda` (`id_razon`),
  CONSTRAINT `auto_multa_ubicacion_FK` FOREIGN KEY (`id_ubi`) REFERENCES `ubicacion` (`id-ubi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_multa`
--

LOCK TABLES `auto_multa` WRITE;
/*!40000 ALTER TABLE `auto_multa` DISABLE KEYS */;
INSERT INTO `auto_multa` VALUES ('MUL-01','AT-01','UB-01','R-01','pendiente'),('MUL-02','AT-02','UB-02','R-02','pendiente'),('MUL-03','AT-03','UB-03','R-03','pendiente'),('MUL-04','AT-04','UB-04','R-04','pendiente');
/*!40000 ALTER TABLE `auto_multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autos`
--

DROP TABLE IF EXISTS `autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autos` (
  `id-auto` varchar(100) NOT NULL,
  `patente` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id-auto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autos`
--

LOCK TABLES `autos` WRITE;
/*!40000 ALTER TABLE `autos` DISABLE KEYS */;
INSERT INTO `autos` VALUES ('AT-01','AE 456 EW','cronos','negro'),('AT-02','AE 789 WV','onix','gris'),('AT-03','AE 963 RG','tracker','azul'),('AT-04','AE 123 JK','cruze','bordo');
/*!40000 ALTER TABLE `autos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corralon`
--

DROP TABLE IF EXISTS `corralon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corralon` (
  `id_aucorr` varchar(100) NOT NULL,
  `id_autosec` varchar(100) DEFAULT NULL,
  `id_auto` varchar(100) DEFAULT NULL,
  `ingreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_aucorr`),
  KEY `corralon_corralon_sector_FK` (`id_autosec`),
  KEY `corralon_autos_FK` (`id_auto`),
  CONSTRAINT `corralon_autos_FK` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id-auto`),
  CONSTRAINT `corralon_corralon_sector_FK` FOREIGN KEY (`id_autosec`) REFERENCES `corralon.sector` (`id-autosec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corralon`
--

LOCK TABLES `corralon` WRITE;
/*!40000 ALTER TABLE `corralon` DISABLE KEYS */;
INSERT INTO `corralon` VALUES ('AC-01','SEC-01','AT-01','2024-09-15 14:20:00'),('AC-02','SEC-02','AT-02','2024-08-10 13:44:00'),('AC-03','SEC-03','AT-03','2024-08-05 12:33:00'),('AC-04','SEC-04','AT-04','2024-05-16 09:46:00');
/*!40000 ALTER TABLE `corralon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corralon.sector`
--

DROP TABLE IF EXISTS `corralon.sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corralon.sector` (
  `id-autosec` varchar(100) NOT NULL,
  `sector` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id-autosec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corralon.sector`
--

LOCK TABLES `corralon.sector` WRITE;
/*!40000 ALTER TABLE `corralon.sector` DISABLE KEYS */;
INSERT INTO `corralon.sector` VALUES ('SEC-01',1,1),('SEC-02',2,5),('SEC-03',2,6),('SEC-04',3,10);
/*!40000 ALTER TABLE `corralon.sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle.deuda`
--

DROP TABLE IF EXISTS `detalle.deuda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle.deuda` (
  `id_razon` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor_multa` int(11) DEFAULT NULL,
  `dias_canon` int(11) DEFAULT NULL,
  `valor_canon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_razon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle.deuda`
--

LOCK TABLES `detalle.deuda` WRITE;
/*!40000 ALTER TABLE `detalle.deuda` DISABLE KEYS */;
INSERT INTO `detalle.deuda` VALUES ('R-01','no pago est medido',20000,2,10000),('R-02','sobre linea amarilla',25000,1,5000),('R-03','sobre est particular',50000,3,15000),('R-04','no pago est medido',20000,5,25000);
/*!40000 ALTER TABLE `detalle.deuda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `id-multa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `persona_auto_multa_FK` (`id-multa`),
  CONSTRAINT `persona_auto_multa_FK` FOREIGN KEY (`id-multa`) REFERENCES `auto_multa` (`id_multa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (16159753,'sofia','lopez','MUL-04'),(23698412,'morena','gonzales','MUL-03'),(25789741,'luciano','gomez','MUL-02'),(45789632,'fernando','perez','MUL-01');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `id-ubi` varchar(100) NOT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `altura` int(11) DEFAULT NULL,
  `dia-hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id-ubi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES ('UB-01','pellegrini',900,'2024-09-15 14:05:00'),('UB-02','pellegrini',200,'2024-08-10 13:34:44'),('UB-03','pellegrini',301,'2024-08-05 12:23:00'),('UB-04','bv oroño',1200,'2024-05-16 09:36:45');
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sist-multas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-24 17:37:16
