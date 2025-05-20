-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: basededatospadel
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auditoria_jugadores`
--

DROP TABLE IF EXISTS `auditoria_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_jugadores` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `cod_jugador` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `accion` varchar(45) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `mensaje` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `cod_ciudad` int NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(45) DEFAULT NULL,
  `estacion_anio` varchar(45) DEFAULT NULL,
  `altura_nivel_mar` int DEFAULT NULL,
  `humedad` int DEFAULT NULL,
  `temperatura_media` int DEFAULT NULL,
  PRIMARY KEY (`cod_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `cod_equipo` int NOT NULL,
  `temporada` date DEFAULT NULL,
  `cod_jugador1` int NOT NULL,
  `cod_jugador2` int NOT NULL,
  PRIMARY KEY (`cod_equipo`),
  KEY `fk_equipos_jugador1` (`cod_jugador1`),
  KEY `fk_equipos_jugador2` (`cod_jugador2`),
  CONSTRAINT `fk_equipos_jugador1` FOREIGN KEY (`cod_jugador1`) REFERENCES `jugadores` (`cod_jugador`),
  CONSTRAINT `fk_equipos_jugador2` FOREIGN KEY (`cod_jugador2`) REFERENCES `jugadores` (`cod_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `cod_jugador` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `edad` tinyint DEFAULT NULL,
  `DNI` varchar(45) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `lugar_residencia` varchar(45) DEFAULT NULL,
  `ranking` tinyint DEFAULT NULL,
  `M/F` varchar(5) NOT NULL,
  `pro/novel` varchar(5) NOT NULL,
  `posicion_pista` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_jugador_insert` AFTER INSERT ON `jugadores` FOR EACH ROW begin
   -- Insertar un registro en la tabla de auditoría
   insert into auditoria_jugadores (cod_jugador, nombre, accion, mensaje)
   values(
       new.cod_jugador,
       new.nombre,
       'INSERT',
       CONCAT('Nuevo jugador registrado: ', new.nombre, ' (ID: ', new.cod_jugador, ')')
   );
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `cod_partido` int NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `tipodePartido` varchar(45) DEFAULT NULL,
  `cod_torneos_partidos` int NOT NULL,
  `equipo_local` int NOT NULL,
  `equipo_visitante` int NOT NULL,
  `ganador` int NOT NULL,
  PRIMARY KEY (`cod_partido`),
  KEY `fk_partidos_equipo1` (`equipo_local`),
  KEY `fk_partidos_equipo2` (`equipo_visitante`),
  KEY `fk_ganador_partidos` (`ganador`),
  CONSTRAINT `fk_ganador_partidos` FOREIGN KEY (`ganador`) REFERENCES `equipos` (`cod_equipo`),
  CONSTRAINT `fk_partidos_equipo1` FOREIGN KEY (`equipo_local`) REFERENCES `equipos` (`cod_equipo`),
  CONSTRAINT `fk_partidos_equipo2` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipos` (`cod_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `torneos`
--

DROP TABLE IF EXISTS `torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneos` (
  `cod_torneo` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `cod_ciudad` int NOT NULL,
  PRIMARY KEY (`cod_torneo`),
  KEY `fk_torneos_ciudad` (`cod_ciudad`),
  CONSTRAINT `fk_torneos_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fecha_torneo_comprobar` BEFORE UPDATE ON `torneos` FOR EACH ROW BEGIN
    
    IF NEW.fecha < CURDATE() THEN
        SET NEW.fecha = CURDATE();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_rank_masc`
--

DROP TABLE IF EXISTS `vista_rank_masc`;
/*!50001 DROP VIEW IF EXISTS `vista_rank_masc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_rank_masc` AS SELECT 
 1 AS `nombre`,
 1 AS `ranking`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_resumen_partidos`
--

DROP TABLE IF EXISTS `vista_resumen_partidos`;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_partidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resumen_partidos` AS SELECT 
 1 AS `cod_partido`,
 1 AS `fecha_hora_partido`,
 1 AS `ciudad`,
 1 AS `fecha_torneo`,
 1 AS `equipo_local_id`,
 1 AS `jugador_local_1`,
 1 AS `jugador_local_2`,
 1 AS `equipo_visitante_id`,
 1 AS `jugador_visitante_1`,
 1 AS `jugador_visitante_2`,
 1 AS `cod_equipo_ganador`,
 1 AS `equipo_ganador`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_rank_masc`
--

/*!50001 DROP VIEW IF EXISTS `vista_rank_masc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_rank_masc` AS select `j`.`nombre` AS `nombre`,`j`.`ranking` AS `ranking` from `jugadores` `j` where (`j`.`M/F` = 'M') order by `j`.`ranking` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_resumen_partidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_resumen_partidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resumen_partidos` AS select `p`.`cod_partido` AS `cod_partido`,`p`.`fecha_hora` AS `fecha_hora_partido`,`c`.`ciudad` AS `ciudad`,`t`.`fecha` AS `fecha_torneo`,`el`.`cod_equipo` AS `equipo_local_id`,`jl1`.`nombre` AS `jugador_local_1`,`jl2`.`nombre` AS `jugador_local_2`,`ev`.`cod_equipo` AS `equipo_visitante_id`,`jv1`.`nombre` AS `jugador_visitante_1`,`jv2`.`nombre` AS `jugador_visitante_2`,`p`.`ganador` AS `cod_equipo_ganador`,(case when (`p`.`ganador` = `el`.`cod_equipo`) then 'Equipo Local' when (`p`.`ganador` = `ev`.`cod_equipo`) then 'Equipo Visitante' else 'Desconocido' end) AS `equipo_ganador` from ((((((((`partidos` `p` join `torneos` `t` on((`p`.`cod_torneos_partidos` = `t`.`cod_torneo`))) join `ciudad` `c` on((`t`.`cod_ciudad` = `c`.`cod_ciudad`))) join `equipos` `el` on((`p`.`equipo_local` = `el`.`cod_equipo`))) join `jugadores` `jl1` on((`el`.`cod_jugador1` = `jl1`.`cod_jugador`))) join `jugadores` `jl2` on((`el`.`cod_jugador2` = `jl2`.`cod_jugador`))) join `equipos` `ev` on((`p`.`equipo_visitante` = `ev`.`cod_equipo`))) join `jugadores` `jv1` on((`ev`.`cod_jugador1` = `jv1`.`cod_jugador`))) join `jugadores` `jv2` on((`ev`.`cod_jugador2` = `jv2`.`cod_jugador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-20 19:26:01
