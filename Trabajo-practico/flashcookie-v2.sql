-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: flashcookie.v2
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
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `ID_Artista` varchar(5) NOT NULL,
  `Num_Orden` varchar(5) DEFAULT NULL,
  `Seudonimo` varchar(50) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Artista`),
  KEY `artistas_ventas_FK` (`Num_Orden`),
  CONSTRAINT `artistas_ventas_FK` FOREIGN KEY (`Num_Orden`) REFERENCES `ventas` (`Num_Orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES ('ar-01','no-01','Pulpix','puldesings@gmail.com'),('ar-02','no-02','ArtMonk','artmonkdesings@gmail.com'),('ar-03','no-03','ParkMotion','motionparkds@gmail.com'),('ar-04','no-04','ReduxArt','reduartds@gmail.com'),('ar_05','no-05','ImpalaDesings','impdisenos@gmail.com');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_Cliente` varchar(5) NOT NULL,
  `Num_Orden` varchar(5) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Fecha_Conexion` date DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `clientes_ventas_FK` (`Num_Orden`),
  CONSTRAINT `clientes_ventas_FK` FOREIGN KEY (`Num_Orden`) REFERENCES `ventas` (`Num_Orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('cl-01','no-01','Ramiro','Lopez','rami.lopez@gmail.com','2024-02-06'),('cl-02','no-02','Felix','Bulox','felibu@gmail.com','2024-02-10'),('cl-03','no-03','Agustina','Gonzales','gonagu@gmail.com','2022-05-15'),('cl-04','no-04','Fernando','Blanco','ferblanc@gmail.com','2024-05-20'),('cl-05','no-05','Fernando','Blanco','ferblanc@gmail.com','2023-10-22');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color.prenda`
--

DROP TABLE IF EXISTS `color.prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color.prenda` (
  `ID_Color` varchar(5) NOT NULL,
  `ID_Prenda` varchar(5) DEFAULT NULL,
  `Nombre_Color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Color`),
  KEY `color_prenda_prendas_FK` (`ID_Prenda`),
  CONSTRAINT `color_prenda_prendas_FK` FOREIGN KEY (`ID_Prenda`) REFERENCES `prendas` (`ID_Prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color.prenda`
--

LOCK TABLES `color.prenda` WRITE;
/*!40000 ALTER TABLE `color.prenda` DISABLE KEYS */;
INSERT INTO `color.prenda` VALUES ('A-100','RO','azul francia'),('N-300','B','negro mate'),('R-200','R','rojo carmesi'),('V-400','BT','verde cazador');
/*!40000 ALTER TABLE `color.prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `ID_Detalle_Pedido` varchar(5) NOT NULL,
  `ID_Pedido` varchar(5) DEFAULT NULL,
  `ID_Producto` varchar(5) DEFAULT NULL,
  `Cantidad` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Pedido`),
  KEY `detalle_pedido_pedido_FK` (`ID_Pedido`),
  KEY `detalle_pedido_productos_FK` (`ID_Producto`),
  CONSTRAINT `detalle_pedido_pedido_FK` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`),
  CONSTRAINT `detalle_pedido_productos_FK` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES ('dp-01','pd-01','bu-01','1'),('dp-02','pd-02','re-02','2'),('dp-03','pd-03','re-02','2'),('dp-04','pd-04','bo-04','4'),('dp-05','pd-05','bu-02','5');
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disenos`
--

DROP TABLE IF EXISTS `disenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disenos` (
  `ID_Diseno` varchar(5) NOT NULL,
  `ID_Artista` varchar(5) DEFAULT NULL,
  `Etiquetas` varchar(255) DEFAULT NULL,
  `Diseno` varchar(255) DEFAULT NULL,
  `Fecha_Publicacion` date DEFAULT NULL,
  PRIMARY KEY (`ID_Diseno`),
  KEY `disenos_artistas_FK` (`ID_Artista`),
  CONSTRAINT `disenos_artistas_FK` FOREIGN KEY (`ID_Artista`) REFERENCES `artistas` (`ID_Artista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disenos`
--

LOCK TABLES `disenos` WRITE;
/*!40000 ALTER TABLE `disenos` DISABLE KEYS */;
INSERT INTO `disenos` VALUES ('di-01','ar-01','mario bross','MarioKart','2024-01-06'),('di-02','ar-02','simpsons','Bart','2024-06-03'),('di-03','ar-03','retro','Console','2024-02-03'),('di-04','ar-04','wine','CatWine','2023-01-06'),('di-05','ar_05','wine','CatWine','2023-01-29');
/*!40000 ALTER TABLE `disenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `ID_Pedido` varchar(5) NOT NULL,
  `ID_Cliente` varchar(5) DEFAULT NULL,
  `Fecha_Creacion` date DEFAULT NULL,
  `Estado_Pedido` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Pedido`),
  KEY `pedido_clientes_FK` (`ID_Cliente`),
  CONSTRAINT `pedido_clientes_FK` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES ('pd-01','cl-01','2024-08-06','Pendiente'),('pd-02','cl-02','2024-10-08','Procesando'),('pd-03','cl-03','2024-08-08','Enviado'),('pd-04','cl-04','2024-03-08','Enviado'),('pd-05','cl-05','2024-08-08','Pendiente');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prendas`
--

DROP TABLE IF EXISTS `prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prendas` (
  `ID_Prenda` varchar(5) NOT NULL,
  `Nombre_Prenda` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prendas`
--

LOCK TABLES `prendas` WRITE;
/*!40000 ALTER TABLE `prendas` DISABLE KEYS */;
INSERT INTO `prendas` VALUES ('B','Buzo'),('BT','Bolsa Tela'),('R','Remera unix'),('RO','Remera OV');
/*!40000 ALTER TABLE `prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_Producto` varchar(5) NOT NULL,
  `ID_Prenda` varchar(5) DEFAULT NULL,
  `ID_Color` varchar(5) DEFAULT NULL,
  `ID_Talle` varchar(5) DEFAULT NULL,
  `ID_Diseno` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `productos_color_prenda_FK` (`ID_Color`),
  KEY `productos_talle_prenda_FK` (`ID_Talle`),
  KEY `productos_prendas_FK` (`ID_Prenda`),
  KEY `productos_disenos_FK` (`ID_Diseno`),
  CONSTRAINT `productos_color_prenda_FK` FOREIGN KEY (`ID_Color`) REFERENCES `color.prenda` (`ID_Color`),
  CONSTRAINT `productos_disenos_FK` FOREIGN KEY (`ID_Diseno`) REFERENCES `disenos` (`ID_Diseno`),
  CONSTRAINT `productos_prendas_FK` FOREIGN KEY (`ID_Prenda`) REFERENCES `prendas` (`ID_Prenda`),
  CONSTRAINT `productos_talle_prenda_FK` FOREIGN KEY (`ID_Talle`) REFERENCES `talle.prenda` (`ID_Talle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('bo-04','BT','V-400','X-i4','di-03'),('bu-01','B','N-300','L-i1','di-01'),('bu-02','B','R-200','M-i3','di-05'),('re-02','R','R-200','S-i2','di-02'),('ro-03','RO','A-100','M-i3','di-04');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talle.prenda`
--

DROP TABLE IF EXISTS `talle.prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talle.prenda` (
  `ID_Talle` varchar(5) NOT NULL,
  `ID_Prenda` varchar(5) DEFAULT NULL,
  `Nombre_Talle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Talle`),
  KEY `talle_prenda_prendas_FK` (`ID_Prenda`),
  CONSTRAINT `talle_prenda_prendas_FK` FOREIGN KEY (`ID_Prenda`) REFERENCES `prendas` (`ID_Prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talle.prenda`
--

LOCK TABLES `talle.prenda` WRITE;
/*!40000 ALTER TABLE `talle.prenda` DISABLE KEYS */;
INSERT INTO `talle.prenda` VALUES ('L-i1','B','L'),('M-i3','RO','M'),('S-i2','R','S'),('X-i4','BT','estandar');
/*!40000 ALTER TABLE `talle.prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `Num_Orden` varchar(5) NOT NULL,
  `ID_Cliente` varchar(5) DEFAULT NULL,
  `ID_Artista` varchar(5) DEFAULT NULL,
  `ID_Detalle_Pedido` varchar(5) DEFAULT NULL,
  `Fecha_Venta` date DEFAULT NULL,
  PRIMARY KEY (`Num_Orden`),
  KEY `ventas_clientes_FK` (`ID_Cliente`),
  KEY `ventas_artistas_FK` (`ID_Artista`),
  KEY `ventas_detalle_pedido_FK` (`ID_Detalle_Pedido`),
  CONSTRAINT `ventas_artistas_FK` FOREIGN KEY (`ID_Artista`) REFERENCES `artistas` (`ID_Artista`),
  CONSTRAINT `ventas_clientes_FK` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  CONSTRAINT `ventas_detalle_pedido_FK` FOREIGN KEY (`ID_Detalle_Pedido`) REFERENCES `detalle_pedido` (`ID_Detalle_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'flashcookie.v2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-07 12:36:38
