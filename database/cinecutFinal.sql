-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinecut
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `accion`
--

DROP TABLE IF EXISTS `accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accion` (
  `id_accion` int NOT NULL AUTO_INCREMENT,
  `nivel_violencia` varchar(10) NOT NULL,
  `id_genero` int NOT NULL,
  `sub_genero` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_accion`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `accion_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accion`
--

LOCK TABLES `accion` WRITE;
/*!40000 ALTER TABLE `accion` DISABLE KEYS */;
INSERT INTO `accion` (`id_accion`, `nivel_violencia`, `id_genero`, `sub_genero`) VALUES (1,'5',1,NULL),(2,'5',4,NULL),(3,'7',5,NULL),(4,'8',8,NULL),(5,'4',11,NULL),(6,'2',14,NULL),(7,'2',17,NULL);
/*!40000 ALTER TABLE `accion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `id_personalidad` int NOT NULL,
  `origen` varchar(50) NOT NULL,
  `arquetipo` varchar(50) NOT NULL,
  KEY `id_personalidad` (`id_personalidad`),
  CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`id_personalidad`) REFERENCES `personalidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` (`id_personalidad`, `origen`, `arquetipo`) VALUES (21,'Cine','Villano'),(22,'Television','Personaje de apoyo'),(23,'Modelaje','Romantico'),(24,'Modelaje','Loco'),(25,'Telvision','Personaje de apoyo'),(26,'Stand Ups','Comico'),(27,'Streaming','Nerd'),(28,'Casting','Egocentrico'),(29,'Cine','Temeroso'),(30,'Peliculas B','Villano');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `critico`
--

DROP TABLE IF EXISTS `critico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `critico` (
  `id_usuario` int DEFAULT NULL,
  `alter_ego` varchar(50) NOT NULL,
  PRIMARY KEY (`alter_ego`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `critico_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critico`
--

LOCK TABLES `critico` WRITE;
/*!40000 ALTER TABLE `critico` DISABLE KEYS */;
INSERT INTO `critico` (`id_usuario`, `alter_ego`) VALUES (1,'Peter'),(2,'Sandy'),(3,'Roxx'),(4,'Luca'),(5,'Steve');
/*!40000 ALTER TABLE `critico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `id_personalidad` int NOT NULL,
  `genero_principal` varchar(50) NOT NULL,
  `estilo` varchar(50) NOT NULL,
  `pelicula_reconocida` varchar(50) NOT NULL,
  KEY `id_personalidad` (`id_personalidad`),
  CONSTRAINT `director_ibfk_1` FOREIGN KEY (`id_personalidad`) REFERENCES `personalidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` (`id_personalidad`, `genero_principal`, `estilo`, `pelicula_reconocida`) VALUES (11,'Animadas','Stop Motion','The Night Before Christmas'),(12,'Acción','Peleas mano a mano','Karate Kid'),(13,'Suspenso','Ambientación','A Quiet Place'),(14,'Acción/Drama','Diálogos','Kill Bill'),(15,'Comedia','Drama Juvenil','This is the end'),(16,'Ciencia Ficción','Espacio','Star Wars'),(17,'Romantica','Amor','Me After You'),(18,'Terror','Dramática, atmosférica','The Shining'),(19,'Animadas','CGI','Spiderverse'),(20,'Musical','Bailes','Cats');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drama`
--

DROP TABLE IF EXISTS `drama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drama` (
  `id_drama` int NOT NULL AUTO_INCREMENT,
  `soundtrack` varchar(30) NOT NULL,
  `id_genero` int NOT NULL,
  `sub_genero` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_drama`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `drama_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drama`
--

LOCK TABLES `drama` WRITE;
/*!40000 ALTER TABLE `drama` DISABLE KEYS */;
INSERT INTO `drama` (`id_drama`, `soundtrack`, `id_genero`, `sub_genero`) VALUES (1,'leemon tree',2,NULL),(2,'yummy',6,NULL),(3,'What is love',9,NULL),(4,'BACK IN BLACK',12,NULL),(5,'Macarena',15,NULL),(6,'Dirty paws',18,NULL);
/*!40000 ALTER TABLE `drama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `popularidad` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` (`id`, `popularidad`) VALUES (1,'5'),(2,'5'),(3,'5'),(4,'5'),(5,'5'),(6,'5'),(7,'5'),(8,'5'),(9,'5'),(10,'5'),(11,'5'),(12,'5'),(13,'5'),(14,'5'),(15,'5'),(16,'5'),(17,'5'),(18,'5'),(19,'5');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guionista`
--

DROP TABLE IF EXISTS `guionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guionista` (
  `id_personalidad` int NOT NULL,
  `guion_reconocido` varchar(50) NOT NULL,
  `genero` varchar(30) NOT NULL,
  PRIMARY KEY (`id_personalidad`),
  CONSTRAINT `guionista_ibfk_1` FOREIGN KEY (`id_personalidad`) REFERENCES `personalidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guionista`
--

LOCK TABLES `guionista` WRITE;
/*!40000 ALTER TABLE `guionista` DISABLE KEYS */;
INSERT INTO `guionista` (`id_personalidad`, `guion_reconocido`, `genero`) VALUES (1,'Avatar','Ciencia Ficción'),(2,'La la Land','Musicales'),(3,'The Fly','Suspenso'),(4,'Scarface','Acción'),(5,'Pineapple Express','Comedia'),(6,'500 Days of Summer','Romantica'),(7,'Alien','Ciencia Ficción, Suspenso'),(8,'Superbad','Comedia'),(9,'Alita','Ciencia Ficción, Acción'),(10,'Coraline','Animada');
/*!40000 ALTER TABLE `guionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participa`
--

DROP TABLE IF EXISTS `participa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participa` (
  `id_personalidad` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int NOT NULL,
  `rol` varchar(25) NOT NULL,
  KEY `id_personalidad` (`id_personalidad`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `participa_ibfk_1` FOREIGN KEY (`id_personalidad`) REFERENCES `personalidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participa_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participa`
--

LOCK TABLES `participa` WRITE;
/*!40000 ALTER TABLE `participa` DISABLE KEYS */;
INSERT INTO `participa` (`id_personalidad`, `id_pelicula`, `rol`) VALUES (1,1,'Guionista'),(2,2,'Guionista'),(3,3,'Guionista'),(4,4,'Guionista'),(5,5,'Guionista'),(6,6,'Guionista'),(7,7,'Guionista'),(8,8,'Guionista'),(9,9,'Guionista'),(10,10,'Guionista'),(10,11,'Guionista'),(9,12,'Guionista'),(8,13,'Guionista'),(7,14,'Guionista'),(6,15,'Guionista'),(11,1,'Director'),(12,2,'Director'),(13,3,'Director'),(14,4,'Director'),(15,5,'Director'),(16,6,'Director'),(17,7,'Director'),(18,8,'Director'),(19,9,'Director'),(20,10,'Director'),(20,11,'Director'),(19,12,'Director'),(18,13,'Director'),(17,14,'Director'),(16,15,'Director'),(21,1,'Actor'),(22,2,'Actor'),(23,3,'Actor'),(24,4,'Actor'),(25,5,'Actor'),(26,6,'Actor'),(27,7,'Actor'),(28,8,'Actor'),(29,9,'Actor'),(30,10,'Actor'),(30,11,'Actor'),(29,12,'Actor'),(28,13,'Actor'),(27,14,'Actor'),(26,15,'Actor');
/*!40000 ALTER TABLE `participa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_estreno` date NOT NULL,
  `nombre_p` varchar(50) NOT NULL,
  `ranking_estable` tinyint DEFAULT NULL,
  `sinopsis` varchar(1000) NOT NULL,
  `ranking_caliente` tinyint DEFAULT NULL,
  `casa_productora` varchar(50) NOT NULL,
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` (`id`, `fecha_estreno`, `nombre_p`, `ranking_estable`, `sinopsis`, `ranking_caliente`, `casa_productora`, `id_genero`) VALUES (1,'1982-11-11','Blade Runner',8,'En un futuro sombrío y lluvioso, un expolicía vuelve al servicio para buscar y destruir a un grupo de androides que fingen ser humanos para, integrados en la sociedad, encontrar a su creador y matarlo',3,'The Ladd Company',1),(2,'1977-12-23','Star Wars IV',7,'La nave en la que viaja la princesa Leia es capturada por las tropas imperiales al mando del temible Darth Vader. Antes de ser atrapada, Leia consigue introducir un mensaje en su robot R2-D2, quien acompañado de su inseparable C-3PO logra escapar.',4,'LucasFilm',2),(3,'1999-09-08','American Beauty',6,'La visión de un joven núbil inspira a un esposo a aprovechar su última oportunidad para lograr la verdadera felicidad.',5,'DreamWorks',3),(4,'2003-10-03','Lost in Translation',5,'Un actor de mediana edad que está en Tokio para grabar un comercial conoce a la joven esposa de un fotógrafo de famosos.',3,'American Zoetrope',4),(5,'1998-03-06','The big Lebowski',9,'Un desempleado es confundido por unos matones con el millonario Jeff Lebowski, quien se llama igual que él y a cuya esposa han secuestrado. Cuando acude a casa del millonario para quejarse, éste decide contratarlo para rescatar a su esposa a cambio de una recompensa.',4,'Polygram Filmed Entertainment',5),(6,'2003-12-24','Irreversible',10,'El amante de una mujer y su ex novio toman la justicia en sus manos después de que ella se convierte en la víctima de un violador.',5,'Les Cinémas de la Zone',6),(7,'2015-03-24','It follows',10,'Jay, una joven de 18 años, tiene una experiencia sexual con su novio en la parte trasera del auto, tras la cual su novio la ata a una silla y le explica que le ha transmitido una maldición que se propaga mediante el sexo.',1,'Animal Kingdom',7),(8,'2017-11-09','Newness',6,'En Los Ángeles, dos millennials que navegan en una cultura impulsada por los medios sociales comienzan una relación que empuja los límites emocionales y físicos.',2,'fsdf',8),(9,'2000-09-08','Dancing in the dark',7,'Una trabajadora inmigrante empieza a vivir en un mundo de fantasía musical cuando un desorden genético afecta su visión.',3,'Canal',9),(10,'2009-04-04','Mary and Max',8,'Una solitaria chica (Toni Collette) australiana y un anciano (Philip Seymour Hoffman) judío desarrollan en Nueva York una singular amistad a través de cartas.',4,'Melodrama',10),(11,'2001-06-20','Ghost World',9,'Enid y Rebecca han terminado la escuela secundaria y no saben cómo pasar el tiempo. Atraídas por los personajes extravagantes, Enid concierta una cieta a ciegas con el autor del anuncio más lamentable de los que encuentran en el periódico local.',4,' ‎United Artists',11),(12,'2010-11-10','Chico y rita',9,'Un pianista cubano es herido por una cantante apasionada, provocando un romance apasionado a lo largo de seis décadas.',4,' ‎Magic Light Pictures',12),(13,'2014-01-31','Her',10,'En Los Ángeles, un escritor desanimado desarrolla una especial relación amorosa con el sistema operativo de su computadora, una intuitiva y sensible entidad llamada Samantha.',5,' Annapurna Pictures',13),(14,'2018-02-15','Lady Bird',7,'Marion McPherson, una enfermera de California, trabaja incansablemente para sustentar a su familia desde que su esposo quedó desempleado. Marion tiene problemas con su hija adolescente, de inclinaciones artísticas y temperamento fuerte.',6,'‎Scott Rudin Productions',14),(15,'2018-10-04','La casa de jack',5,'Un seguimiento durante doce años a Jack, un asesino en serie que mata mujeres y está obsesionado con la perfección. Su historia transcurre en paralelo a la de Estados Unidos durante las décadas de 1970 y 1980.',7,'Zentropa',15);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalidad`
--

DROP TABLE IF EXISTS `personalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `edad` int DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalidad`
--

LOCK TABLES `personalidad` WRITE;
/*!40000 ALTER TABLE `personalidad` DISABLE KEYS */;
INSERT INTO `personalidad` (`id`, `nombre`, `apellidos`, `sexo`, `edad`, `fecha_nacimiento`) VALUES (1,'Josiah','Sykes','2',NULL,'1997-04-14'),(2,'Denton','Rice','1',NULL,'2003-05-21'),(3,'Nolan','Hernandez','2',NULL,'2001-07-18'),(4,'Avye','Austin','1',NULL,'1987-04-17'),(5,'Keane','Henry','1',NULL,'1996-02-28'),(6,'Aubrey','Hutchinson','2',NULL,'2065-11-15'),(7,'Ethan','Morse','1',NULL,'1977-03-14'),(8,'Urielle','West','2',NULL,'2000-02-17'),(9,'Christine','Green','1',NULL,'1988-08-31'),(10,'Rebekah','Thornton','1',NULL,'1999-11-02'),(11,'Beau','Mccullough','2',NULL,'2002-02-02'),(12,'Magee','Prince','1',NULL,'1993-07-14'),(13,'Grace','Kelly','1',NULL,'1978-01-12'),(14,'Kirk','Francis','1',NULL,'1995-09-09'),(15,'Octavia','Vinson','2',NULL,'1994-08-10'),(16,'Allen','Hester','2',NULL,'2044-05-18'),(17,'Sacha','Macias','2',NULL,'1986-07-15'),(18,'Kadeem','Jones','2',NULL,'1972-01-28'),(19,'John','Forbes','1',NULL,'1992-09-08'),(20,'Cruz','Hull','2',NULL,'1984-02-14'),(21,'Nichole','Knight','2',NULL,'1997-09-09'),(22,'Ila','Frederick','2',NULL,'1988-02-27'),(23,'Kelly','Howard','2',NULL,'1998-04-14'),(24,'Ross','Montoya','1',NULL,'1977-12-25'),(25,'Burke','Avery','2',NULL,'1984-02-27'),(26,'Holmes','Thompson','1',NULL,'1976-07-22'),(27,'Charissa','Clements','2',NULL,'2005-05-05'),(28,'Caryn','Glover','1',NULL,'2007-07-07'),(29,'Lenore','Heath','1',NULL,'1993-02-22'),(30,'Bree','Trujillo','2',NULL,'2044-10-31');
/*!40000 ALTER TABLE `personalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntua_caliente`
--

DROP TABLE IF EXISTS `puntua_caliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntua_caliente` (
  `id_pelicula` int NOT NULL,
  `alter_ego` varchar(50) NOT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  `calificacion` tinyint NOT NULL,
  KEY `alter_ego` (`alter_ego`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `puntua_caliente_ibfk_1` FOREIGN KEY (`alter_ego`) REFERENCES `critico` (`alter_ego`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `puntua_caliente_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntua_caliente`
--

LOCK TABLES `puntua_caliente` WRITE;
/*!40000 ALTER TABLE `puntua_caliente` DISABLE KEYS */;
INSERT INTO `puntua_caliente` (`id_pelicula`, `alter_ego`, `comentarios`, `calificacion`) VALUES (1,'Peter','Excelente pelicula, gran historia y desarrollo',5),(2,'Peter','Podria ser mejor',2),(3,'Peter','Horrible',5),(4,'Peter','Podria ser mejor',2),(5,'Peter','gran historia y desarrollo',4),(6,'Peter','Excelente pelicula, gran historia y desarrollo',5),(7,'Peter','Esta pasable',3),(8,'Peter','Horrible',1),(9,'Peter','Podria ser mejor',2),(10,'Peter','gran historia y desarrollo',4),(11,'Peter','Excelente pelicula, gran historia y desarrollo',5),(12,'Peter','Esta pasable',3),(13,'Peter','Horrible',1),(2,'Sandy','Excelente pelicula, gran historia y desarrollo',5),(4,'Sandy','Podria ser mejor',2),(6,'Sandy','Horrible',5),(8,'Sandy','Podria ser mejor',2),(10,'Sandy','gran historia y desarrollo',4),(12,'Sandy','Excelente pelicula, gran historia y desarrollo',5),(1,'Sandy','Esta pasable',3),(3,'Sandy','Horrible',1),(5,'Sandy','Podria ser mejor',2),(7,'Sandy','gran historia y desarrollo',4),(9,'Sandy','Excelente pelicula, gran historia y desarrollo',5),(11,'Sandy','Esta pasable',3),(13,'Sandy','Horrible',1),(3,'Roxx','Excelente pelicula, gran historia y desarrollo',5),(1,'Roxx','Podria ser mejor',2),(5,'Roxx','Horrible',5),(7,'Roxx','Podria ser mejor',2),(13,'Roxx','gran historia y desarrollo',4),(12,'Roxx','Excelente pelicula, gran historia y desarrollo',5),(11,'Roxx','Esta pasable',3),(8,'Roxx','Horrible',1),(9,'Roxx','Podria ser mejor',2),(10,'Roxx','gran historia y desarrollo',4),(2,'Roxx','Excelente pelicula, gran historia y desarrollo',5),(4,'Roxx','Esta pasable',3),(6,'Roxx','Horrible',1),(13,'Luca','Excelente pelicula, gran historia y desarrollo',5),(12,'Luca','Podria ser mejor',2),(11,'Luca','Horrible',5),(10,'Luca','Podria ser mejor',2),(9,'Luca','gran historia y desarrollo',4),(8,'Luca','Excelente pelicula, gran historia y desarrollo',5),(7,'Luca','Esta pasable',3),(6,'Luca','Horrible',1),(5,'Luca','Podria ser mejor',2),(4,'Luca','gran historia y desarrollo',4),(3,'Luca','Excelente pelicula, gran historia y desarrollo',5),(2,'Luca','Esta pasable',3),(1,'Luca','Horrible',1),(11,'Steve','Excelente pelicula, gran historia y desarrollo',5),(5,'Steve','Podria ser mejor',2),(1,'Steve','Horrible',5),(10,'Steve','Podria ser mejor',2),(4,'Steve','gran historia y desarrollo',4),(9,'Steve','Excelente pelicula, gran historia y desarrollo',5),(2,'Steve','Esta pasable',3),(3,'Steve','Horrible',1),(7,'Steve','Podria ser mejor',2),(6,'Steve','gran historia y desarrollo',4),(8,'Steve','Excelente pelicula, gran historia y desarrollo',5),(13,'Steve','Esta pasable',3),(12,'Steve','Horrible',1),(12,'Steve','Horrible',1),(12,'Steve','',1),(2,'Peter','Malisisisisisisissisisisisisma',2);
/*!40000 ALTER TABLE `puntua_caliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntua_estable`
--

DROP TABLE IF EXISTS `puntua_estable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntua_estable` (
  `id_pelicula` int NOT NULL,
  `id_usuario` int NOT NULL,
  `calificacion` tinyint NOT NULL,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `puntua_estable_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `puntua_estable_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntua_estable`
--

LOCK TABLES `puntua_estable` WRITE;
/*!40000 ALTER TABLE `puntua_estable` DISABLE KEYS */;
INSERT INTO `puntua_estable` (`id_pelicula`, `id_usuario`, `calificacion`) VALUES (1,6,6),(2,7,8),(3,8,10),(4,9,7),(5,10,3),(15,11,8),(12,12,10),(13,13,5),(14,14,2),(6,15,4),(7,16,9),(8,17,4),(9,18,6),(10,19,1),(11,20,7),(1,1,7),(2,1,7),(3,1,7),(4,1,7),(5,1,7),(6,1,7),(1,2,25),(1,2,24);
/*!40000 ALTER TABLE `puntua_estable` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `aumenta_resenias` BEFORE INSERT ON `puntua_estable` FOR EACH ROW BEGIN	
    
	declare resenias int;
    select no_reseñas from usuario where usuario.id = new.id_usuario into resenias;
    update usuario set no_reseñas= resenias + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `terror`
--

DROP TABLE IF EXISTS `terror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terror` (
  `id_terror` int NOT NULL AUTO_INCREMENT,
  `origen_antagonista` varchar(50) NOT NULL,
  `id_genero` int NOT NULL,
  `sub_genero` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_terror`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `terror_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terror`
--

LOCK TABLES `terror` WRITE;
/*!40000 ALTER TABLE `terror` DISABLE KEYS */;
INSERT INTO `terror` (`id_terror`, `origen_antagonista`, `id_genero`, `sub_genero`) VALUES (1,'Monstruo',3,NULL),(2,'Fantasma',7,NULL),(3,'Monstruo',10,NULL),(4,'Asesino',13,NULL),(5,'Monstruo',16,NULL),(6,'Asesino',19,NULL);
/*!40000 ALTER TABLE `terror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `edad` int DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `no_reseñas` int DEFAULT '0',
  `correo` varchar(50) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `contrasenia` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `telefono`, `edad`, `fecha_nacimiento`, `no_reseñas`, `correo`, `tipo`, `contrasenia`) VALUES (1,'Tyler','Bishop','450-289-0463',NULL,'1985-07-14',0,'fulanito@gmail.com','admin','defecto'),(2,'Wayne','Best','764-589-1389',NULL,'1997-02-15',0,'fulanito@gmail.com','admin','defecto'),(3,'Cynthia','Marquez','997-205-3606',NULL,'1983-08-21',0,'fulanito@gmail.com','admin','defecto'),(4,'Byron','Melendez','632-157-5156',NULL,'2003-07-21',0,'fulanito@gmail.com','admin','admin'),(5,'Baker','Lucas','256-772-6889',NULL,'1977-06-22',0,'fulanito@gmail.com','usuario','defecto'),(6,'Helen','Heath','323-900-6879',NULL,'1975-10-04',0,'fulanito@gmail.com','usuario','defecto'),(7,'Dominic','Gross','765-441-3555',NULL,'2065-08-15',0,'fulanito@gmail.com','usuario','defecto'),(8,'Skyler','Cervantes','662-688-9132',NULL,'1975-02-22',0,'fulanito@gmail.com','usuario','defecto'),(9,'Lynn','Haney','561-198-6423',NULL,'2002-05-24',0,'fulanito@gmail.com','usuario','defecto'),(10,'Allen','Santana','220-182-0703',NULL,'1985-05-21',0,'fulanito@gmail.com','usuario','defecto'),(11,'Chase','Macias','110-956-0866',NULL,'1992-12-21',0,'fulanito@gmail.com','usuario','defecto'),(12,'Cruz','Tucker','792-125-8268',NULL,'1988-08-08',0,'fulanito@gmail.com','usuario','defecto'),(13,'Aquila','Coleman','701-926-3528',NULL,'2000-01-01',0,'fulanito@gmail.com','usuario','defecto'),(14,'Portia','Key','101-309-7285',NULL,'2001-09-15',0,'fulanito@gmail.com','usuario','defecto'),(15,'Zelda','Hyde','820-526-2686',NULL,'2037-10-31',0,'fulanito@gmail.com','usuario','defecto'),(16,'Aidan','Gould','173-257-4667',NULL,'1997-10-22',0,'fulanito@gmail.com','usuario','defecto'),(17,'McKenzie','Battle','425-723-8636',NULL,'1999-08-31',0,'fulanito@gmail.com','usuario','defecto'),(18,'Rowan','Hodges','881-394-7819',NULL,'1984-08-12',0,'fulanito@gmail.com','usuario','defecto'),(19,'Neville','Mccall','502-325-8056',NULL,'2055-11-17',0,'fulanito@gmail.com','usuario','defecto'),(20,'Isaac','Clark','810-326-4601',NULL,'2001-04-17',0,'fulanito@gmail.com','usuario','defecto'),(21,'Jose','martinez','4754221',21,'1998-08-08',0,'jg@gmail.com','usuario','contrasena'),(22,'ola','sdasd','4654',23,'1996-08-08',0,'fulanito@gmail.com','admin','ola');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `usuario_trigger` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
    declare age int;
    
    SELECT FLOOR( (curdate() - new.fecha_nacimiento ) / 10000 ) into age;
    
    SET new.edad = age;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `alter_ego` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN	
	declare resenias int;
    select no_reseñas from usuario where usuario.id = new.id into resenias;
    if resenias > 30 then
		insert into critico(id_usuario,alter_ego) values (new.id,concat(new.id,"Temporal"));
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'cinecut'
--

--
-- Dumping routines for database 'cinecut'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_personalidad_actor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_personalidad_actor`(
idper INT, nom VARCHAR(25), ap VARCHAR(25),sexo varchar(10), nacim date, orig varchar(30), arq varchar(30))
BEGIN
	UPDATE personalidad
	set nombre=nom, apellido=ap, sexo=sexo, fecha_nacimiento=nacim
	WHERE id=idper;
	UPDATE actor
	set origen=orig, arquetipo=arq
	WHERE id=idusr;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_personalidad_guionista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_personalidad_guionista`(
idper INT, nom VARCHAR(25), ap VARCHAR(25),sexo varchar(10), nacim DATE, guiR varchar(30), genero varchar(30))
BEGIN
	UPDATE personalidad
	set nombre=nom, apellidos=ap, sexo=sexo, fecha_nacimiento=nacim
	WHERE id=idper;
	UPDATE guionista
	set guion_reconocido=guiR, genero=genero
	WHERE id_personalidad=idper;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_usuario`(
idusr INT, nom VARCHAR(25), ap VARCHAR(25), tel varchar(15), ego varchar(50))
BEGIN
	UPDATE usuario
	set nombre=nom, apellido=ap, telefono=tel
	WHERE id=idusr;
	UPDATE critico
	set alter_ego=ego
	WHERE id=idusr;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_personalidad_actor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_personalidad_actor`(
nom VARCHAR(25), ap VARCHAR(25), sexo varchar(20), nacim date, orig varchar(30), arq varchar(30))
BEGIN
	INSERT INTO personalidad(nombre, apellidos, sexo,fecha_nacimiento) VALUES (nom, ap, sexo, nacim);
	INSERT INTO actor(id_personalidad, origen, arquetipo)
	VALUES(LAST_INSERT_ID(), orig, arq);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_personalidad_director` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_personalidad_director`(
nom VARCHAR(25), ap VARCHAR(25), sexo varchar(20), nacim date, genP varchar(30), est varchar(30), peliR varchar(30))
BEGIN
	INSERT INTO personalidad(nombre, apellidos, sexo,fecha_nacimiento)
	VALUES(nom, ap, sexo, nacim);
	INSERT INTO director(id_personalidad, genero_principal, estilo, pelicula_reconocida)
	VALUES(LAST_INSERT_ID(), genP, est, peliR);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_personalidad_guionista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_personalidad_guionista`(
nom VARCHAR(25), ap VARCHAR(25), sexo varchar(20), nacim date, gen varchar(30), gui varchar(30))
BEGIN
	INSERT INTO personalidad(nombre, apellidos, sexo,fecha_nacimiento)
	VALUES(nom, ap, sexo, nacim);
	INSERT INTO guionista(id_personalidad, guion_reconocido, genero)
	VALUES(LAST_INSERT_ID(), gen, gui);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_usuario`(
nom VARCHAR(25), ap VARCHAR(25), tel varchar(15), ego varchar(50))
BEGIN
	INSERT INTO usuario(nombre, apellido, telefono)
	VALUES(nom, ap, tel);
	INSERT INTO critico(id_usuario, alter_ego)
	VALUES(LAST_INSERT_ID(), ego);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_usuario`(
idusr INT)
BEGIN
	delete from critico
	WHERE id=idusr;
	delete from usuario
	WHERE id=idusr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserta_genero_accion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserta_genero_accion`(
popu varchar(10),violencia varchar(10))
BEGIN
	insert into genero(popularidad)
	values(popu);
    insert into accion(nivel_violencia,id_genero)
	values(violencia,last_insert_id());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserta_genero_drama` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserta_genero_drama`(
popu varchar(10),soundtrack varchar(30))
BEGIN
	insert into genero(popularidad)
	values(popu);
    insert into drama(soundtrack,id_genero)
	values(soundtrack,last_insert_id());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserta_genero_terror` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserta_genero_terror`(
popu varchar(10),origen varchar(50))
BEGIN
	insert into genero(popularidad)
	values(popu);
    insert into terror(origen_antagonista,id_genero)
	values(origen,last_insert_id());
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

-- Dump completed on 2020-05-29  8:41:50
