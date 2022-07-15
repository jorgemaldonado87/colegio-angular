-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: colegio
-- ------------------------------------------------------
-- Server version	5.7.38-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clases_id` int(11) NOT NULL,
  `matriculas_id` int(11) NOT NULL,
  `profesores_id` int(11) NOT NULL,
  `presente` tinyint(4) DEFAULT NULL,
  `n_mesa` int(11) DEFAULT NULL,
  `sala_id` int(11) NOT NULL,
  `periodos_id` int(11) NOT NULL,
  `cursos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`clases_id`,`matriculas_id`,`profesores_id`,`sala_id`,`periodos_id`,`cursos_id`),
  KEY `fk_asistencia_clases1_idx` (`clases_id`),
  KEY `fk_asistencia_matriculas1_idx` (`matriculas_id`),
  KEY `fk_asistencia_profesores1_idx` (`profesores_id`),
  KEY `fk_asistencia_sala1_idx` (`sala_id`),
  KEY `fk_asistencia_periodos1_idx` (`periodos_id`),
  KEY `fk_asistencia_cursos1_idx` (`cursos_id`),
  CONSTRAINT `fk_asistencia_clases1` FOREIGN KEY (`clases_id`) REFERENCES `clases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistencia_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistencia_matriculas1` FOREIGN KEY (`matriculas_id`) REFERENCES `matriculas_alumnos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistencia_periodos1` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistencia_profesores1` FOREIGN KEY (`profesores_id`) REFERENCES `profesores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistencia_sala1` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clases`
--

DROP TABLE IF EXISTS `clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_semana` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `materias_id` int(11) NOT NULL,
  `cursos_id` int(11) NOT NULL,
  `colegios_id` int(11) NOT NULL,
  `periodos_id` int(11) NOT NULL,
  `profesores_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`materias_id`,`cursos_id`,`colegios_id`,`periodos_id`,`profesores_id`),
  KEY `fk_clases_materias1_idx` (`materias_id`),
  KEY `fk_clases_cursos1_idx` (`cursos_id`),
  KEY `fk_clases_colegios1_idx` (`colegios_id`),
  KEY `fk_clases_periodos1_idx` (`periodos_id`),
  KEY `fk_clases_profesores1_idx` (`profesores_id`),
  CONSTRAINT `fk_clases_colegios1` FOREIGN KEY (`colegios_id`) REFERENCES `colegios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clases_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clases_materias1` FOREIGN KEY (`materias_id`) REFERENCES `materias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clases_periodos1` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clases_profesores1` FOREIGN KEY (`profesores_id`) REFERENCES `profesores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clases`
--

LOCK TABLES `clases` WRITE;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colegios`
--

DROP TABLE IF EXISTS `colegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colegios` (
  `id` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `nombre_corto` varchar(45) DEFAULT NULL,
  `tipos_colegios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`tipos_colegios_id`),
  KEY `fk_colegios_tipos_colegios1_idx` (`tipos_colegios_id`),
  CONSTRAINT `fk_colegios_tipos_colegios1` FOREIGN KEY (`tipos_colegios_id`) REFERENCES `tipos_colegios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colegios`
--

LOCK TABLES `colegios` WRITE;
/*!40000 ALTER TABLE `colegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `colegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `nombre_corto` varchar(45) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `colegios_id` int(11) NOT NULL,
  `niveles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`colegios_id`,`niveles_id`),
  KEY `fk_cursos_colegios_idx` (`colegios_id`),
  KEY `fk_cursos_niveles1_idx` (`niveles_id`),
  CONSTRAINT `fk_cursos_colegios` FOREIGN KEY (`colegios_id`) REFERENCES `colegios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_niveles1` FOREIGN KEY (`niveles_id`) REFERENCES `niveles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `colegios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`colegios_id`),
  KEY `fk_materias_colegios1_idx` (`colegios_id`),
  CONSTRAINT `fk_materias_colegios1` FOREIGN KEY (`colegios_id`) REFERENCES `colegios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas_alumnos`
--

DROP TABLE IF EXISTS `matriculas_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculas_alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `periodos_id` int(11) NOT NULL,
  `cursos_id` int(11) NOT NULL,
  `colegios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`usuarios_id`,`periodos_id`,`cursos_id`,`colegios_id`),
  KEY `fk_matriculas_usuarios1_idx` (`usuarios_id`),
  KEY `fk_matriculas_periodos1_idx` (`periodos_id`),
  KEY `fk_matriculas_cursos1_idx` (`cursos_id`),
  KEY `fk_matriculas_colegios1_idx` (`colegios_id`),
  CONSTRAINT `fk_matriculas_colegios1` FOREIGN KEY (`colegios_id`) REFERENCES `colegios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matriculas_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matriculas_periodos1` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matriculas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas_alumnos`
--

LOCK TABLES `matriculas_alumnos` WRITE;
/*!40000 ALTER TABLE `matriculas_alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `matriculas_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `agno` varchar(45) DEFAULT NULL,
  `colegios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`colegios_id`),
  KEY `fk_periodos_colegios1_idx` (`colegios_id`),
  CONSTRAINT `fk_periodos_colegios1` FOREIGN KEY (`colegios_id`) REFERENCES `colegios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(11) NOT NULL,
  `colegios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`usuarios_id`,`colegios_id`),
  KEY `fk_profesores_usuarios1_idx` (`usuarios_id`),
  KEY `fk_profesores_colegios1_idx` (`colegios_id`),
  CONSTRAINT `fk_profesores_colegios1` FOREIGN KEY (`colegios_id`) REFERENCES `colegios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesores_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sala` varchar(45) DEFAULT NULL,
  `n_mesas` int(11) DEFAULT NULL,
  `horizontal` int(11) DEFAULT NULL,
  `vertical` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_colegios`
--

DROP TABLE IF EXISTS `tipos_colegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_colegios` (
  `id` int(11) NOT NULL,
  `tipo_colegio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_colegios`
--

LOCK TABLES `tipos_colegios` WRITE;
/*!40000 ALTER TABLE `tipos_colegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_colegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_usuarios`
--

DROP TABLE IF EXISTS `tipos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_usuarios`
--

LOCK TABLES `tipos_usuarios` WRITE;
/*!40000 ALTER TABLE `tipos_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` varchar(10) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `creado_en` datetime DEFAULT NULL,
  `actualizado_en` datetime DEFAULT NULL,
  `eliminado_en` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'18779670-9','HECTOR  ALFREDO','MALDONADO INZULZA','hminzulza@gmail.com','$2y$10$inpLLZ/IwIjUCqJAV2ZlYOoJ4BYirxG7EETOHjDjcSrai0bet4flW','2022-07-09 04:23:59','2022-07-09 04:23:59',NULL),(4,'13669251-8','RAUL SAUDT','JARA ABARZUA','rauljaraabaruza@santamarta.cl','$2y$10$xKJxf9PZmPtpECAbrHpbRO9gbPK0wKGcTyH88VCaixmfzb87xE6XW','2022-07-09 04:25:38','2022-07-09 04:25:38',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_has_tipos_usuarios`
--

DROP TABLE IF EXISTS `usuarios_has_tipos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_has_tipos_usuarios` (
  `usuarios_id` int(11) NOT NULL,
  `tipos_usuarios_id` int(11) NOT NULL,
  PRIMARY KEY (`usuarios_id`,`tipos_usuarios_id`),
  KEY `fk_usuarios_has_tipos_usuarios_tipos_usuarios1_idx` (`tipos_usuarios_id`),
  KEY `fk_usuarios_has_tipos_usuarios_usuarios1_idx` (`usuarios_id`),
  CONSTRAINT `fk_usuarios_has_tipos_usuarios_tipos_usuarios1` FOREIGN KEY (`tipos_usuarios_id`) REFERENCES `tipos_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_tipos_usuarios_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_has_tipos_usuarios`
--

LOCK TABLES `usuarios_has_tipos_usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios_has_tipos_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_has_tipos_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 17:32:10
