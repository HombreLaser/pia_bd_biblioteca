-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Library
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add city',7,'add_city'),(26,'Can change city',7,'change_city'),(27,'Can delete city',7,'delete_city'),(28,'Can view city',7,'view_city'),(29,'Can add editor',8,'add_editor'),(30,'Can change editor',8,'change_editor'),(31,'Can delete editor',8,'delete_editor'),(32,'Can view editor',8,'view_editor'),(33,'Can add address',9,'add_address'),(34,'Can change address',9,'change_address'),(35,'Can delete address',9,'delete_address'),(36,'Can view address',9,'view_address'),(37,'Can add book',10,'add_book'),(38,'Can change book',10,'change_book'),(39,'Can delete book',10,'delete_book'),(40,'Can view book',10,'view_book'),(41,'Can add postal code',11,'add_postalcode'),(42,'Can change postal code',11,'change_postalcode'),(43,'Can delete postal code',11,'delete_postalcode'),(44,'Can view postal code',11,'view_postalcode'),(45,'Can add author',12,'add_author'),(46,'Can change author',12,'change_author'),(47,'Can delete author',12,'delete_author'),(48,'Can view author',12,'view_author'),(49,'Can add street',13,'add_street'),(50,'Can change street',13,'change_street'),(51,'Can delete street',13,'delete_street'),(52,'Can view street',13,'view_street');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$lTM8qMqlESvwaPwnWDpW6B$Zcz7SP+gHWftXgX1valLgc8NjrQHMTLDoqBsfdA5Kd4=','2021-05-14 21:10:20.268384',1,'luis','','','luis.martinezvg@uanl.edu.mx',1,1,'2021-05-14 20:58:49.012659');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_address`
--

DROP TABLE IF EXISTS `catalogue_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `postal_code_id` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_address_city_id_995a3e6c_fk_catalogue_city_id` (`city_id`),
  KEY `catalogue_address_street_id_9e04d58f_fk_catalogue_street_id` (`street_id`),
  KEY `catalogue_address_postal_code_id_26894ade_fk` (`postal_code_id`),
  CONSTRAINT `catalogue_address_city_id_995a3e6c_fk_catalogue_city_id` FOREIGN KEY (`city_id`) REFERENCES `catalogue_city` (`id`),
  CONSTRAINT `catalogue_address_postal_code_id_26894ade_fk` FOREIGN KEY (`postal_code_id`) REFERENCES `catalogue_postalcode` (`code`),
  CONSTRAINT `catalogue_address_street_id_9e04d58f_fk_catalogue_street_id` FOREIGN KEY (`street_id`) REFERENCES `catalogue_street` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_address`
--

LOCK TABLES `catalogue_address` WRITE;
/*!40000 ALTER TABLE `catalogue_address` DISABLE KEYS */;
INSERT INTO `catalogue_address` VALUES (1,6548,1,'01002',1),(2,1745,2,'45874',2),(3,5,3,'69857',3);
/*!40000 ALTER TABLE `catalogue_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_author`
--

DROP TABLE IF EXISTS `catalogue_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_author`
--

LOCK TABLES `catalogue_author` WRITE;
/*!40000 ALTER TABLE `catalogue_author` DISABLE KEYS */;
INSERT INTO `catalogue_author` VALUES (1,'Frank Herbert','USA','frank-herbert-800044l_4CnmNxV.jpg'),(2,'Cormac McCarthy','USA','Cormac_McCarthy.jpg'),(3,'Roger Nimier','Francia','roger_nimier.png'),(4,'Philip K. Dick','USA','4764-Philip-Dick.jpg'),(5,'Ray Bradbury','USA','ray_bradbury.jpg');
/*!40000 ALTER TABLE `catalogue_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_book`
--

DROP TABLE IF EXISTS `catalogue_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_book` (
  `isbn` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `country` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `catalogue_book_author_id_3495ca49_fk_catalogue_author_id` (`author_id`),
  KEY `catalogue_book_editor_id_5bd5bf56_fk_catalogue_editor_id` (`editor_id`),
  CONSTRAINT `catalogue_book_author_id_3495ca49_fk_catalogue_author_id` FOREIGN KEY (`author_id`) REFERENCES `catalogue_author` (`id`),
  CONSTRAINT `catalogue_book_editor_id_5bd5bf56_fk_catalogue_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `catalogue_editor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_book`
--

LOCK TABLES `catalogue_book` WRITE;
/*!40000 ALTER TABLE `catalogue_book` DISABLE KEYS */;
INSERT INTO `catalogue_book` VALUES ('0307762521','Blood Meridian',1985,'USA','Western','blood_meridian.jpg',2,2,'Una impresionante e imaginativa fábula moral acerca de la naturaleza de la violencia y la justicia.\r\nLas autoridades mexicanas y del estado de Texas organizan una expedición paramilitar para acabar con el mayor número posible de indios. Es el Grupo Glanton, y tienen como líder espiritual al juez Holden, un ser violento y cruel. Nunca duerme, viola y asesina niños de ambos sexos y afirma que nunca morirá. Todo cambia cuando los carniceros de Glanton dejan de asesinar indios y empiezan a exterminar a los mexicanos que les pagan. Se instaura así la ley de la selva, el terreno moral donde la figura del juez se convierte en una especie de dios arbitrario.'),('0739412531','All the Pretty Horses',1992,'USA','Western','all_the_pretty_horses.jpg',2,2,'All the Pretty Horses tells of young John Grady Cole, the last of a long line of Texas ranchers. Across the border Mexico beckons -beautiful and desolate, rugged and cruelly civilized. With two companions, he sets off an idyllic, sometimes comic adventure, to a place where dreams are paid for in blood.'),('0879978597','Ubik',1969,'USA','Ciencia Ficción','ubik.jpg',4,4,'Glen Runciter está muerto. ¿O lo están todos los demás? Lo que es seguro es que alguien ha muerto en una explosión organizada por los competidores de Runciter. De hecho, sus empleados asisten a un funeral. Pero durante el duelo comienzan a recibir mensajes desconcertantes, e incluso morbosos, de su jefe. Y el mundo a su alrededor comienza a desmoronarse de un modo que sugiere que a ellos tampoco les queda mucho tiempo.\r\nEsta mordaz comedia metafísica de muerte y salvación (que podrá llevar en un cómodo envase) es un tour de force de amenaza paranoica y comedia absurda, en el cual los muertos ofrecen consejos comerciales, compran su siguiente reencarnación y corren el riesgo continuo de volver a morir.'),('112145156X','Dune',1965,'USA','Ciencia Ficción','Dune-Frank_Herbert_1965_First_edition.jpg',1,1,'En el desértico planeta Arrakis, el agua es el bien más preciado y llorar a los muertos, el símbolo de máxima prodigalidad. Pero algo hace de Arrakis una pieza estratégica para los intereses del Emperador, las Grandes Casas y la Cofradía, los tres grandes poderes de la galaxia. Arrakis es el único origen conocido de la melange, preciosa especia y uno de los bienes más codiciados del universo.\r\nAl duque Leto Atreides se le asigna el gobierno de este mundo inhóspito, habitado por los indómitos Fremen y monstruosos gusanos de arena de centenares de metros de longitud. Sin embargo, cuando la familia es traicionada, su hijo y heredero, Paul, emprenderá un viaje hacia un destino más grande del que jamás hubiese podido soñar.'),('2070369862','Le Hussard Bleu',1950,'Francia','Romance','le_hussard_bleu.jpg',3,3,'Set in Germany in 1945–1946, it tells the story of ten French hussars who operate in the French occupation army right after World War II. The perspective shifts between several different people. At the centre are the ambivalent François Sanders and his companion François Saint-Anne—the title character—who unknowingly share the same German mistress.'),('8445000969','Crónicas Marcianas',1950,'USA','Ciencia Ficción','crónicas_marcianas.jpg',5,4,'Crónicas Marcianas es una serie de relatos del escritor Ray Bradbury. Los relatos carecen de una línea argumental lineal fija, pero la referencia contextual y temporal es la misma en todos ellos: narra la llegada a Marte y la colonización del planeta por parte de los humanos.');
/*!40000 ALTER TABLE `catalogue_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_city`
--

DROP TABLE IF EXISTS `catalogue_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_city`
--

LOCK TABLES `catalogue_city` WRITE;
/*!40000 ALTER TABLE `catalogue_city` DISABLE KEYS */;
INSERT INTO `catalogue_city` VALUES (1,'Massachussetts'),(2,'New York'),(3,'París');
/*!40000 ALTER TABLE `catalogue_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_editor`
--

DROP TABLE IF EXISTS `catalogue_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_editor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_editor_address_id_0efde3d9_fk_catalogue_address_id` (`address_id`),
  CONSTRAINT `catalogue_editor_address_id_0efde3d9_fk_catalogue_address_id` FOREIGN KEY (`address_id`) REFERENCES `catalogue_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_editor`
--

LOCK TABLES `catalogue_editor` WRITE;
/*!40000 ALTER TABLE `catalogue_editor` DISABLE KEYS */;
INSERT INTO `catalogue_editor` VALUES (1,'Chilton Company','USA',1),(2,'Random House','USA',2),(3,'Éditions Gaston Gallimard','Francia',3),(4,'Doubleday Publishing','USA',2);
/*!40000 ALTER TABLE `catalogue_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_postalcode`
--

DROP TABLE IF EXISTS `catalogue_postalcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_postalcode` (
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_postalcode`
--

LOCK TABLES `catalogue_postalcode` WRITE;
/*!40000 ALTER TABLE `catalogue_postalcode` DISABLE KEYS */;
INSERT INTO `catalogue_postalcode` VALUES ('01002'),('10019'),('45874'),('69857');
/*!40000 ALTER TABLE `catalogue_postalcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_street`
--

DROP TABLE IF EXISTS `catalogue_street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_street` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_street`
--

LOCK TABLES `catalogue_street` WRITE;
/*!40000 ALTER TABLE `catalogue_street` DISABLE KEYS */;
INSERT INTO `catalogue_street` VALUES (1,'HIghland'),(2,'Broadway'),(3,'Gaston Gallimard');
/*!40000 ALTER TABLE `catalogue_street` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-05-14 21:16:48.937576','1','Massachussetts',1,'[{\"added\": {}}]',7,1),(2,'2021-05-14 21:17:17.922944','1','HIghland',1,'[{\"added\": {}}]',13,1),(3,'2021-05-14 21:20:44.387986','01002','01002',1,'[{\"added\": {}}]',11,1),(4,'2021-05-14 21:21:11.189954','1','Calle: HIghland\nCiudad: Massachussetts\nNúmero: 6548',1,'[{\"added\": {}}]',9,1),(5,'2021-05-14 21:21:31.065434','1','Chilton Company',1,'[{\"added\": {}}]',8,1),(6,'2021-05-14 21:22:42.505752','1','Nombre:Frank Herbert\nPaís:USA\n',1,'[{\"added\": {}}]',12,1),(7,'2021-05-14 21:24:53.130402','112145156X','Dune',1,'[{\"added\": {}}]',10,1),(8,'2021-05-14 21:51:19.661572','112145156X','Dune',2,'[{\"changed\": {\"fields\": [\"Cover\"]}}]',10,1),(9,'2021-05-14 21:52:16.739186','112145156X','Dune',2,'[{\"changed\": {\"fields\": [\"Cover\"]}}]',10,1),(10,'2021-05-15 01:01:43.979644','2','Nombre:Cormac McCarthy\nPaís:USA\n',1,'[{\"added\": {}}]',12,1),(11,'2021-05-15 01:02:46.483321','2','Broadway',1,'[{\"added\": {}}]',13,1),(12,'2021-05-15 01:02:55.065449','2','New York',1,'[{\"added\": {}}]',7,1),(13,'2021-05-15 01:03:23.641478','45874','45874',1,'[{\"added\": {}}]',11,1),(14,'2021-05-15 01:03:48.219217','2','Calle: Broadway\nCiudad: New York\nNúmero: 1745',1,'[{\"added\": {}}]',9,1),(15,'2021-05-15 01:04:04.549729','2','Random House',1,'[{\"added\": {}}]',8,1),(16,'2021-05-15 01:05:58.126143','0307762521','Blood Meridian',1,'[{\"added\": {}}]',10,1),(17,'2021-05-15 01:43:55.253998','0307762521','Blood Meridian',2,'[{\"changed\": {\"fields\": [\"Summary\"]}}]',10,1),(18,'2021-05-15 01:44:45.203214','112145156X','Dune',2,'[{\"changed\": {\"fields\": [\"Summary\"]}}]',10,1),(19,'2021-05-15 03:32:48.280460','0739412531','All the Pretty Horses',1,'[{\"added\": {}}]',10,1),(20,'2021-05-15 03:35:19.204659','3','Nombre:Roger Nimier\nPaís:Francia\n',1,'[{\"added\": {}}]',12,1),(21,'2021-05-15 03:36:27.336822','3','Gaston Gallimard',1,'[{\"added\": {}}]',13,1),(22,'2021-05-15 03:36:34.211736','3','París',1,'[{\"added\": {}}]',7,1),(23,'2021-05-15 03:36:48.237991','69857','69857',1,'[{\"added\": {}}]',11,1),(24,'2021-05-15 03:37:06.640350','3','Calle: Gaston Gallimard\nCiudad: París\nNúmero: 5',1,'[{\"added\": {}}]',9,1),(25,'2021-05-15 03:37:34.648588','3','Éditions Gaston Gallimard',1,'[{\"added\": {}}]',8,1),(26,'2021-05-15 03:39:23.401725','2070369862','Le Hussard Bleu',1,'[{\"added\": {}}]',10,1),(27,'2021-05-15 17:46:08.826454','10019','10019',1,'[{\"added\": {}}]',11,1),(28,'2021-05-15 17:46:34.502955','4','Calle: Broadway\nCiudad: New York\nNúmero: 1745',1,'[{\"added\": {}}]',9,1),(29,'2021-05-15 17:46:56.024498','4','Calle: Broadway\nCiudad: New York\nNúmero: 1745',3,'',9,1),(30,'2021-05-15 17:47:16.055627','4','Doubleday Publishing',1,'[{\"added\": {}}]',8,1),(31,'2021-05-15 17:47:29.996911','4','Nombre:Philip K. Dick\nPaís:USA\n',1,'[{\"added\": {}}]',12,1),(32,'2021-05-15 17:49:21.277703','0879978597','Ubik',1,'[{\"added\": {}}]',10,1),(33,'2021-05-15 17:51:53.935447','5','Nombre:Ray Bradbury\nPaís:USA\n',1,'[{\"added\": {}}]',12,1),(34,'2021-05-15 17:53:39.412133','8445000969','Crónicas Marcianas',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'catalogue','address'),(12,'catalogue','author'),(10,'catalogue','book'),(7,'catalogue','city'),(8,'catalogue','editor'),(11,'catalogue','postalcode'),(13,'catalogue','street'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-05-14 20:10:36.223654'),(2,'auth','0001_initial','2021-05-14 20:10:36.861663'),(3,'admin','0001_initial','2021-05-14 20:10:37.023268'),(4,'admin','0002_logentry_remove_auto_add','2021-05-14 20:10:37.039322'),(5,'admin','0003_logentry_add_action_flag_choices','2021-05-14 20:10:37.053145'),(6,'contenttypes','0002_remove_content_type_name','2021-05-14 20:10:37.130326'),(7,'auth','0002_alter_permission_name_max_length','2021-05-14 20:10:37.199402'),(8,'auth','0003_alter_user_email_max_length','2021-05-14 20:10:37.215118'),(9,'auth','0004_alter_user_username_opts','2021-05-14 20:10:37.230718'),(10,'auth','0005_alter_user_last_login_null','2021-05-14 20:10:37.285383'),(11,'auth','0006_require_contenttypes_0002','2021-05-14 20:10:37.288437'),(12,'auth','0007_alter_validators_add_error_messages','2021-05-14 20:10:37.297108'),(13,'auth','0008_alter_user_username_max_length','2021-05-14 20:10:37.310660'),(14,'auth','0009_alter_user_last_name_max_length','2021-05-14 20:10:37.323262'),(15,'auth','0010_alter_group_name_max_length','2021-05-14 20:10:37.338222'),(16,'auth','0011_update_proxy_permissions','2021-05-14 20:10:37.357053'),(17,'auth','0012_alter_user_first_name_max_length','2021-05-14 20:10:37.371890'),(18,'sessions','0001_initial','2021-05-14 20:10:37.411872'),(19,'catalogue','0001_initial','2021-05-14 20:38:56.703118'),(20,'catalogue','0002_alter_postalcode_code','2021-05-14 21:20:12.526308'),(21,'catalogue','0003_book_summary','2021-05-15 01:42:32.412501');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('84a5rv6hdxuuq4c61vb94tfvgt3u99ka','.eJxVjMsOwiAUBf-FtSFQWgSX7vsN5D64UjU0Ke3K-O_apAvdnpk5L5VgW0vaWl7SxOqirDr9bgj0yHUHfId6mzXNdV0m1LuiD9r0OHN-Xg_376BAK9-aKIrzrjMeA_Qw2I6diIC1Aj5GE4PLfbTO4zlmJCEeLGFA8QDBZFbvD-_pOMY:1lhf4e:2Qjp78vcWuoIqmiP2JVZGwsJwunvAaM386hufYAwewI','2021-05-28 21:10:20.272877');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-15 19:16:55
