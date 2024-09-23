-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: gamma_delta
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
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `id_diagnostico` varchar(100) NOT NULL,
  `id_pacientes` varchar(100) DEFAULT NULL,
  `id_profesionales` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_diagnostico`),
  KEY `diagnostico_pacientes_FK` (`id_pacientes`),
  KEY `diagnostico_profesionales_FK` (`id_profesionales`),
  CONSTRAINT `diagnostico_pacientes_FK` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`),
  CONSTRAINT `diagnostico_profesionales_FK` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES ('100','P02','R01',NULL),('101','P03','EC1',NULL),('102','P04','EC1',NULL),('103','P04','R01',NULL);
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('E01','roberta','aguila','administracion'),('E02','dario','armas','administracion');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informes`
--

DROP TABLE IF EXISTS `informes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informes` (
  `id_informe` varchar(100) NOT NULL,
  `id_diagnostico` varchar(100) DEFAULT NULL,
  `id_profesionales` varchar(100) DEFAULT NULL,
  `fecha_informe` date DEFAULT NULL,
  PRIMARY KEY (`id_informe`),
  KEY `informes_diagnostico_FK` (`id_diagnostico`),
  KEY `informes_profesionales_FK` (`id_profesionales`),
  CONSTRAINT `informes_diagnostico_FK` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnostico` (`id_diagnostico`),
  CONSTRAINT `informes_profesionales_FK` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informes`
--

LOCK TABLES `informes` WRITE;
/*!40000 ALTER TABLE `informes` DISABLE KEYS */;
INSERT INTO `informes` VALUES ('IN01','100','R01',NULL),('IN02','101','EC1',NULL),('IN03','102','EC1',NULL),('IN04','102','R01',NULL);
/*!40000 ALTER TABLE `informes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id_pacientes` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pacientes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES ('P01','roberto','nuñez',NULL),('P02','marta','perez',NULL),('P03','estefania','marquez',NULL),('P04','jorge','bordon',NULL);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practica_realizada`
--

DROP TABLE IF EXISTS `practica_realizada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practica_realizada` (
  `id_prac_real` varchar(100) NOT NULL,
  `id_profesionales` varchar(100) DEFAULT NULL,
  `diag_por_imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_prac_real`),
  KEY `practica_realizada_profesionales_FK` (`id_profesionales`),
  CONSTRAINT `practica_realizada_profesionales_FK` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practica_realizada`
--

LOCK TABLES `practica_realizada` WRITE;
/*!40000 ALTER TABLE `practica_realizada` DISABLE KEYS */;
INSERT INTO `practica_realizada` VALUES ('ECE1','EC1','ecografia de cadera'),('ECE2','EC1','ecografia por embarazo'),('RR1','R01','radiografia de rodilla'),('RR2','TE1','radiografia de rodilla');
/*!40000 ALTER TABLE `practica_realizada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesionales`
--

DROP TABLE IF EXISTS `profesionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesionales` (
  `id_profesionales` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `matricula` int(11) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_profesionales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesionales`
--

LOCK TABLES `profesionales` WRITE;
/*!40000 ALTER TABLE `profesionales` DISABLE KEYS */;
INSERT INTO `profesionales` VALUES ('EC1','manuel','baristo',4666,'ecografista'),('R01','hugo','almada',5222,'radiologo'),('TE1','alexandra','marines',8453,'tec_radiologo'),('TO1','roberto','armas',7894,'tec_tomografia');
/*!40000 ALTER TABLE `profesionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id_sala` varchar(100) NOT NULL,
  `tipo_sala` varchar(255) DEFAULT NULL,
  `disponibilidad` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_sala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES ('ECO1','ecografia','si'),('ECO2','ecografia','si'),('RAD1','radiografia','si'),('TOMO1','tomografia','no');
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id_turno` varchar(100) NOT NULL,
  `id_pacientes` varchar(100) DEFAULT NULL,
  `id_profesionales` varchar(100) DEFAULT NULL,
  `id_prac_real` varchar(100) DEFAULT NULL,
  `id_sala` varchar(100) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `turnos_pacientes_FK` (`id_pacientes`),
  KEY `turnos_profesionales_FK` (`id_profesionales`),
  KEY `turnos_sala_FK` (`id_sala`),
  KEY `turnos_practica_realizada_FK` (`id_prac_real`),
  CONSTRAINT `turnos_pacientes_FK` FOREIGN KEY (`id_pacientes`) REFERENCES `pacientes` (`id_pacientes`),
  CONSTRAINT `turnos_practica_realizada_FK` FOREIGN KEY (`id_prac_real`) REFERENCES `practica_realizada` (`id_prac_real`),
  CONSTRAINT `turnos_profesionales_FK` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id_profesionales`),
  CONSTRAINT `turnos_sala_FK` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES ('T01','P02','EC1','ECE1','RAD1',NULL),('T02','P03','EC1','ECE2','ECO1',NULL),('T03','P04','TE1','RR2','ECO2','2021-06-06 14:00:00'),('T04','P04','R01','RR1','RAD1','2021-06-05 13:00:00');
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gamma_delta'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-23 19:20:02
