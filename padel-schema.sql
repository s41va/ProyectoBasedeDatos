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

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `cod_partido` int NOT NULL,
  `fecha/hora` datetime DEFAULT NULL,
  `Masc/Fem` varchar(45) DEFAULT NULL,
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
  `ciudad` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estacion_anio` varchar(45) DEFAULT NULL,
  `altura_nivel_mar` int DEFAULT NULL,
  `humedad` int DEFAULT NULL,
  `temperatura_media` int DEFAULT NULL,
  PRIMARY KEY (`cod_torneo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
 1 AS `ciudad`,
 1 AS `fecha_hora`,
 1 AS `tipo_partido`,
 1 AS `jugador1_equipo_local`,
 1 AS `jugador2_equipo_local`,
 1 AS `jugador1_equipo_visitante`,
 1 AS `jugador2_equipo_visitante`*/;
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
/*!50001 VIEW `vista_resumen_partidos` AS select `p`.`cod_partido` AS `cod_partido`,`t`.`ciudad` AS `ciudad`,`p`.`fecha/hora` AS `fecha_hora`,`p`.`Masc/Fem` AS `tipo_partido`,`j1`.`nombre` AS `jugador1_equipo_local`,`j2`.`nombre` AS `jugador2_equipo_local`,`j3`.`nombre` AS `jugador1_equipo_visitante`,`j4`.`nombre` AS `jugador2_equipo_visitante` from (((((((`partidos` `p` join `torneos` `t` on((`p`.`cod_torneos_partidos` = `t`.`cod_torneo`))) join `equipos` `e1` on((`p`.`equipo_local` = `e1`.`cod_equipo`))) join `equipos` `e2` on((`p`.`equipo_visitante` = `e2`.`cod_equipo`))) join `jugadores` `j1` on((`e1`.`cod_jugador1` = `j1`.`cod_jugador`))) join `jugadores` `j2` on((`e1`.`cod_jugador2` = `j2`.`cod_jugador`))) join `jugadores` `j3` on((`e2`.`cod_jugador1` = `j3`.`cod_jugador`))) join `jugadores` `j4` on((`e2`.`cod_jugador2` = `j4`.`cod_jugador`))) order by `p`.`fecha/hora` */;
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

-- Dump completed on 2025-03-27 18:35:59
