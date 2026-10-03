/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: ojs_db
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-ubu2204

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
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint(6) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES
(8,'es_ES','familyName','Holguín'),
(8,'es_ES','givenName','Carmen'),
(9,'es_ES','familyName','Mendoza'),
(9,'es_ES','givenName','Gonzalo'),
(10,'es_ES','familyName','Bravo'),
(10,'es_ES','givenName','Xavier'),
(11,'es_ES','familyName','Villacreses'),
(11,'es_ES','givenName','Diana'),
(12,'es_ES','familyName','Lucas'),
(12,'es_ES','givenName','Jorge'),
(13,'es_ES','familyName','Anchundia'),
(13,'es_ES','givenName','Teresa'),
(14,'es_ES','familyName','Gómez'),
(14,'es_ES','givenName','María'),
(15,'es_ES','familyName','Pinargote'),
(15,'es_ES','givenName','Nelson'),
(16,'es_ES','familyName','Delgado'),
(16,'es_ES','givenName','Fabiola'),
(17,'es_ES','familyName','Cedeño'),
(17,'es_ES','givenName','Jorge'),
(18,'es_ES','familyName','Vera'),
(18,'es_ES','givenName','Andrea'),
(19,'es_ES','familyName','Alarcón'),
(19,'es_ES','givenName','Roberto'),
(20,'es_ES','familyName','Moreira'),
(20,'es_ES','givenName','Pedro'),
(21,'es_ES','familyName','Solórzano'),
(21,'es_ES','givenName','Patricia');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_publication_id` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES
(8,'carmen.holguin@utm.edu.ec',1,8,0.00,14),
(9,'gonzalo.mendoza@utm.edu.ec',1,9,0.00,14),
(10,'xavier.bravo@utm.edu.ec',1,10,0.00,14),
(11,'diana.villacreses@utm.edu.ec',1,11,0.00,14),
(12,'jorge.lucas@utm.edu.ec',1,12,0.00,14),
(13,'teresa.anchundia@utm.edu.ec',1,13,0.00,14),
(14,'maria.gomez@utm.edu.ec',1,14,0.00,14),
(15,'nelson.pinargote@utm.edu.ec',1,15,0.00,14),
(16,'fabiola.delgado@utm.edu.ec',1,16,0.00,14),
(17,'jorge.cedeno@utm.edu.ec',1,17,0.00,14),
(18,'andrea.vera@utm.edu.ec',1,18,0.00,14),
(19,'roberto.alarcon@utm.edu.ec',1,19,0.00,14),
(20,'pedro.moreira@utm.edu.ec',1,20,0.00,14),
(21,'patricia.solorzano@utm.edu.ec',1,21,0.00,14);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL DEFAULT 0,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES
(5,'submissionAgency',1048588,1),
(10,'submissionAgency',1048588,3),
(15,'submissionAgency',1048588,4),
(20,'submissionAgency',1048588,5),
(25,'submissionAgency',1048588,6),
(30,'submissionAgency',1048588,7),
(100,'submissionAgency',1048588,8),
(95,'submissionAgency',1048588,9),
(90,'submissionAgency',1048588,10),
(85,'submissionAgency',1048588,11),
(80,'submissionAgency',1048588,12),
(75,'submissionAgency',1048588,13),
(70,'submissionAgency',1048588,14),
(65,'submissionAgency',1048588,15),
(60,'submissionAgency',1048588,16),
(55,'submissionAgency',1048588,17),
(50,'submissionAgency',1048588,18),
(45,'submissionAgency',1048588,19),
(40,'submissionAgency',1048588,20),
(35,'submissionAgency',1048588,21),
(3,'submissionDiscipline',1048588,1),
(8,'submissionDiscipline',1048588,3),
(13,'submissionDiscipline',1048588,4),
(18,'submissionDiscipline',1048588,5),
(23,'submissionDiscipline',1048588,6),
(28,'submissionDiscipline',1048588,7),
(98,'submissionDiscipline',1048588,8),
(93,'submissionDiscipline',1048588,9),
(88,'submissionDiscipline',1048588,10),
(83,'submissionDiscipline',1048588,11),
(78,'submissionDiscipline',1048588,12),
(73,'submissionDiscipline',1048588,13),
(68,'submissionDiscipline',1048588,14),
(63,'submissionDiscipline',1048588,15),
(58,'submissionDiscipline',1048588,16),
(53,'submissionDiscipline',1048588,17),
(48,'submissionDiscipline',1048588,18),
(43,'submissionDiscipline',1048588,19),
(38,'submissionDiscipline',1048588,20),
(33,'submissionDiscipline',1048588,21),
(1,'submissionKeyword',1048588,1),
(6,'submissionKeyword',1048588,3),
(11,'submissionKeyword',1048588,4),
(16,'submissionKeyword',1048588,5),
(21,'submissionKeyword',1048588,6),
(26,'submissionKeyword',1048588,7),
(96,'submissionKeyword',1048588,8),
(91,'submissionKeyword',1048588,9),
(86,'submissionKeyword',1048588,10),
(81,'submissionKeyword',1048588,11),
(76,'submissionKeyword',1048588,12),
(71,'submissionKeyword',1048588,13),
(66,'submissionKeyword',1048588,14),
(61,'submissionKeyword',1048588,15),
(56,'submissionKeyword',1048588,16),
(51,'submissionKeyword',1048588,17),
(46,'submissionKeyword',1048588,18),
(41,'submissionKeyword',1048588,19),
(36,'submissionKeyword',1048588,20),
(31,'submissionKeyword',1048588,21),
(4,'submissionLanguage',1048588,1),
(9,'submissionLanguage',1048588,3),
(14,'submissionLanguage',1048588,4),
(19,'submissionLanguage',1048588,5),
(24,'submissionLanguage',1048588,6),
(29,'submissionLanguage',1048588,7),
(99,'submissionLanguage',1048588,8),
(94,'submissionLanguage',1048588,9),
(89,'submissionLanguage',1048588,10),
(84,'submissionLanguage',1048588,11),
(79,'submissionLanguage',1048588,12),
(74,'submissionLanguage',1048588,13),
(69,'submissionLanguage',1048588,14),
(64,'submissionLanguage',1048588,15),
(59,'submissionLanguage',1048588,16),
(54,'submissionLanguage',1048588,17),
(49,'submissionLanguage',1048588,18),
(44,'submissionLanguage',1048588,19),
(39,'submissionLanguage',1048588,20),
(34,'submissionLanguage',1048588,21),
(2,'submissionSubject',1048588,1),
(7,'submissionSubject',1048588,3),
(12,'submissionSubject',1048588,4),
(17,'submissionSubject',1048588,5),
(22,'submissionSubject',1048588,6),
(27,'submissionSubject',1048588,7),
(97,'submissionSubject',1048588,8),
(92,'submissionSubject',1048588,9),
(87,'submissionSubject',1048588,10),
(82,'submissionSubject',1048588,11),
(77,'submissionSubject',1048588,12),
(72,'submissionSubject',1048588,13),
(67,'submissionSubject',1048588,14),
(62,'submissionSubject',1048588,15),
(57,'submissionSubject',1048588,16),
(52,'submissionSubject',1048588,17),
(47,'submissionSubject',1048588,18),
(42,'submissionSubject',1048588,19),
(37,'submissionSubject',1048588,20),
(32,'submissionSubject',1048588,21);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_issue_orders`
--

LOCK TABLES `custom_issue_orders` WRITE;
/*!40000 ALTER TABLE `custom_issue_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_issue_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_section_orders`
--

DROP TABLE IF EXISTS `custom_section_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_section_orders`
--

LOCK TABLES `custom_section_orders` WRITE;
/*!40000 ALTER TABLE `custom_section_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_section_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES
(4,17,5,3,1,2,2,'2026-01-28 11:00:00'),
(5,19,0,3,0,2,1,'2026-10-02 23:30:35'),
(6,20,0,1,0,2,9,'2026-10-02 23:30:35'),
(7,19,0,4,0,2,7,'2026-10-03 00:31:06');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint(6) NOT NULL DEFAULT 0,
  `can_edit` smallint(6) NOT NULL DEFAULT 0,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES
(1,'NOTIFICATION',0,1,NULL,NULL,NULL),
(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),
(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),
(4,'PASSWORD_RESET',0,1,NULL,NULL,NULL),
(5,'USER_REGISTER',0,1,NULL,NULL,NULL),
(6,'USER_VALIDATE',0,1,NULL,NULL,NULL),
(7,'REVIEWER_REGISTER',0,1,NULL,NULL,NULL),
(8,'PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),
(9,'LOCKSS_EXISTING_ARCHIVE',0,1,NULL,NULL,NULL),
(10,'LOCKSS_NEW_ARCHIVE',0,1,NULL,NULL,NULL),
(11,'SUBMISSION_ACK',1,1,NULL,65536,1),
(12,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,1),
(13,'EDITOR_ASSIGN',1,1,16,16,1),
(14,'REVIEW_CANCEL',1,1,16,4096,3),
(15,'REVIEW_REINSTATE',1,1,16,4096,3),
(16,'REVIEW_REQUEST',1,1,16,4096,3),
(17,'REVIEW_REQUEST_SUBSEQUENT',1,1,16,4096,3),
(18,'REVIEW_REQUEST_ONECLICK',1,1,16,4096,3),
(19,'REVIEW_REQUEST_ONECLICK_SUBSEQUENT',1,1,16,4096,3),
(20,'REVIEW_REQUEST_ATTACHED',0,1,16,4096,3),
(21,'REVIEW_REQUEST_ATTACHED_SUBSEQUENT',0,1,16,4096,3),
(22,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096,3),
(23,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),
(24,'REVIEW_CONFIRM',1,1,4096,16,3),
(25,'REVIEW_DECLINE',1,1,4096,16,3),
(26,'REVIEW_ACK',1,1,16,4096,3),
(27,'REVIEW_REMIND',0,1,16,4096,3),
(28,'REVIEW_REMIND_AUTO',0,1,NULL,4096,3),
(29,'REVIEW_REMIND_ONECLICK',0,1,16,4096,3),
(30,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),
(31,'EDITOR_DECISION_ACCEPT',0,1,16,65536,3),
(32,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536,3),
(33,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536,5),
(34,'EDITOR_DECISION_REVISIONS',0,1,16,65536,3),
(35,'EDITOR_DECISION_RESUBMIT',0,1,16,65536,3),
(36,'EDITOR_DECISION_DECLINE',0,1,16,65536,3),
(37,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,1),
(38,'EDITOR_RECOMMENDATION',0,1,16,16,3),
(39,'COPYEDIT_REQUEST',1,1,16,4097,4),
(40,'LAYOUT_REQUEST',1,1,16,4097,5),
(41,'LAYOUT_COMPLETE',1,1,4097,16,5),
(42,'EMAIL_LINK',0,1,1048576,NULL,NULL),
(43,'SUBSCRIPTION_NOTIFY',0,1,NULL,1048576,NULL),
(44,'OPEN_ACCESS_NOTIFY',0,1,NULL,1048576,NULL),
(45,'SUBSCRIPTION_BEFORE_EXPIRY',0,1,NULL,1048576,NULL),
(46,'SUBSCRIPTION_AFTER_EXPIRY',0,1,NULL,1048576,NULL),
(47,'SUBSCRIPTION_AFTER_EXPIRY_LAST',0,1,NULL,1048576,NULL),
(48,'SUBSCRIPTION_PURCHASE_INDL',0,1,NULL,2097152,NULL),
(49,'SUBSCRIPTION_PURCHASE_INSTL',0,1,NULL,2097152,NULL),
(50,'SUBSCRIPTION_RENEW_INDL',0,1,NULL,2097152,NULL),
(51,'SUBSCRIPTION_RENEW_INSTL',0,1,NULL,2097152,NULL),
(52,'CITATION_EDITOR_AUTHOR_QUERY',0,1,NULL,NULL,4),
(53,'REVISED_VERSION_NOTIFY',0,1,NULL,16,3),
(54,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),
(55,'ANNOUNCEMENT',0,1,16,1048576,NULL),
(56,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL,NULL),
(57,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL,NULL),
(58,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL),
(59,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES
('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),
('ANNOUNCEMENT','es_ES','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisite nuestro site para leer el <a href=\"{$url}\">anuncio completo</a>.','Se mandará este email tras la creación de un nuevo anuncio.'),
('CITATION_EDITOR_AUTHOR_QUERY','en_US','Citation Editing','{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n','This email allows copyeditors to request additional information about references from authors.'),
('CITATION_EDITOR_AUTHOR_QUERY','es_ES','Edición de citas','{$authorFirstName},<br />\n<br />\nPor favor, ¿podría usted verificar o proporcionarnos la cita adecuada para la siguiente referencia de su artículo, {$submissionTitle}?:<br />\n<br />\n{$rawCitation}<br />\n<br />\n¡Gracias!<br />\n<br />\n{$userFirstName}<br />\nCorrector/a de estilo, {$contextName}<br />\n','Este correo electrónico permite a los correctores/as de estilo solicitar información adicional acerca de las referencias de los autores/as.'),
('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}','This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('COPYEDIT_REQUEST','es_ES','Petición de corrección','{$participantName}:<br />\n<br />\nMe gustaría pedirle que llevara a cabo la corrección de &quot;{$submissionTitle}&quot; para {$contextName}. Para hacerlo debería seguir los pasos siguientes:<br />\n1. Haga clic en la URL del envío que encontrará al final de este correo.<br />\n2. Abra todos los archivos disponibles en \"Archivos borradores\" y haga la corrección, añadiendo todos los comentarios que necesite en \"Discusiones de corrección\".<br />\n3. Guarde los archivos corregidos y cárguelos en el panel \"Corregidos\".<br />\n4. Notifique al editor/a que los archivos están listos y que el proceso de producción puede empezar.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL del envío: {$submissionUrl}<br />\nNombre de usuario/a: {$participantUsername}','Este correo es enviado por un/a Editor/a de Sección a un/a corrector/a de un envío para pedirles que comiencen un proceso de corrección. Le proporciona información sobre en el envío y cómo acceder a él.'),
('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),
('EDITOR_ASSIGN','es_ES','Asignación editorial','{$editorialContactName}:<br />\n<br />\nSe le ha asignado el envío, &quot;{$submissionTitle},&quot; a {$contextName} para que lo revise en el proceso editorial como Editor/a de Sección.<br />\n<br />\nURL del envío: {$submissionUrl}<br />\nUsuario/a: {$editorUsername}<br />\n<br />\nGracias.','Este correo notifica al / a la Editor/a de Sección de que les ha asignado la tarea de supervisar un envío a través del proceso editorial. Proporciona información sobre el envío y cómo acceder a la revista.'),
('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),
('EDITOR_DECISION_ACCEPT','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Aceptar el envío','Este correo electrónico del editor/a o editor/a de sección para el autor/a le notifica que la decisión final es aceptar su envío .'),
('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),
('EDITOR_DECISION_DECLINE','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Rechazar el envío','Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica sobre la decisión final de \"rechazar\" su envío.'),
('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the editor declines their submission initially, before the review stage'),
('EDITOR_DECISION_INITIAL_DECLINE','es_ES','Decisión del editor/a','\n			{$authorName}:<br />\n<br />\nHemos llegado a una decisión sobre su envío a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Rechazar el envío','Este correo electrónico se envía al autor/a si el editor/a rechaza su envío inicialmente, antes de la fase de revisión'),
('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review','This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),
('EDITOR_DECISION_RESUBMIT','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Volver a enviar a revisión','Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica sobre la decisión final de volver a revisar su envío.'),
('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required','This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),
('EDITOR_DECISION_REVISIONS','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Necesita revisiones','Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica que la decisión final respecto a su envío es que \"necesita revisiones\".'),
('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos llegado a una decisión respecto a su envío {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Enviar a revisión<br />\n<br />\nEnlace: {$submissionUrl}','Este correo electrónico del editor/a, o del editor/a de sección, notifica al autor/a que su envío se traslada a un revisor/a externo.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nLa edición de su envío, &quot;{$submissionTitle},&quot; se ha completado. Ahora lo enviaremos a producción.<br />\n<br />\nSubmission URL: {$submissionUrl}','Este correo electrónico del editor/a, o del editor/a de sección, notifica al autor/a que su envío se traslada a producción.'),
('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),
('EDITOR_RECOMMENDATION','es_ES','Recomendación del editor/a','{$editors}:<br />\n<br />\nLa recomendación respecto al envío a {$contextName}, &quot;{$submissionTitle}&quot; es: {$recommendation}','Este correo electrónico del editor/a o editor/a de sección que aconseja para los editores/as o editores/as de sección que toman las decisiones les notifica sobre la recomendación final respecto al envío.'),
('EMAIL_LINK','en_US','Article of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),
('EMAIL_LINK','es_ES','Artículo interesante','He pensado que le podría interesar ver el artículo &quot;{$submissionTitle}&quot; de {$authorName}, publicado en el vol. {$volume}, nº {$number} ({$year}) de {$contextName} en &quot;{$articleUrl}&quot;.','Esta plantilla de correo proporciona a un/a lector/a registrado/a la oportunidad de enviar información sobre un artículo a alguien a quien le podría interesar. Está disponible a través de las Herramientas de Lectura y debe ser activado por el/la Gestor/a de la Revista en las Administración de Herramientas de Lectura.'),
('LAYOUT_COMPLETE','en_US','Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}','This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),
('LAYOUT_COMPLETE','es_ES','Galeradas completadas','{$editorialContactName}:<br />\n<br />\nYa han sido preparadas las galeradas para el manuscrito &quot;{$submissionTitle},&quot; para {$contextName} y están listas para corregir.<br />\n<br />\nSi tiene cualquier pregunta, no dude en contactar con nosotros/as.<br />\n<br />\n{$participantName}','Este correo electrónico es enviado por el/la Editor/a de Maquetación al / a la Editor/a de Sección notificándole que el proceso de maquetación ha finalizado.'),
('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.','This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('LAYOUT_REQUEST','es_ES','Solicitud de galeradas','{$participantName}:<br />\n<br />\n\nEl envío &quot;{$submissionTitle}&quot; a {$contextName} ahora necesita que prepare las galeradas siguiendo los siguientes pasos.<br />\n1. Haga click en la URL del envío que hay a continuación.<br />\n2. Entre a la revista con su usuario y utilice los ficheros preparados para publicación para crear las galeradas de acuerdo a los estándares de la revista.<br />\n3. Suba las galeradas a la sección de ficheros de galerada.<br />\n4. Notifique al Editor de que las galeradas están subidas y listas.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de envío: {$submissionUrl}<br />\nUsuario: {$participantUsername}<br />\n<br />\nSi no puede llevar a cabo este trabajo en este momento o tiene cualquier pregunta, póngase en contacto con nosotros/as. Gracias por su contribución a la revista.','Este correo electrónico es enviado por el/ la Editor/a de Sección al / a la Editor/a de Maquetación notificándole que se les ha asignado la tarea de editar la maquetación de un envío. Le proporciona información sobre el envío y cómo acceder a él.'),
('LOCKSS_EXISTING_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),
('LOCKSS_EXISTING_ARCHIVE','es_ES','Petición de archivado para {$contextName}','Estimado/a [Bibliotecaria/o Universitaria/o]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, es una revista en la que un miembro de su Facultad/Universidad, [nombre de la persona], colabora como [cargo que desempeña]. La revista está intentando crear un archivo LOCKSS (Lots of Copies Keep Stuff Safe) con esta y otras bibliotecas universitarias.<br />\n<br />\n[Breve descripción de la revista]<br />\n<br />\nLa URL para el Manifiesto Editorial LOCKSS para nuestra revista es: {$contextUrl}/gateway/lockss<br />\n<br />\nEntendemos que ya está participando en LOCKSS. Si podemos proporcionarle metadatos adicionales para registrar nuestra revista con su versión de LOCKSS, estaremos encantados/as de hacerlo.<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo solicita al / a la administrador/a de un archivo LOCKSS que tenga en cuenta esta revista para incluirla en su archivo. Proporciona la URL del Manifiesto Editorial LOCKSS de la revista.'),
('LOCKSS_NEW_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),
('LOCKSS_NEW_ARCHIVE','es_ES','Petición de archivado para {$contextName}','Estimado/a [Bibliotecario/a Universitario/a]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, es una revista en la que un miembro de su Facultad/Universidad, [nombre de la persona], colabora como [cargo que desempeña]. La revista está intentando crear un archivo LOCKSS (Lots of Copies Keep Stuff Safe) con esta y otras bibliotecas universitarias.<br />\n<br />\n[Breve descripción de la revista]<br />\n<br />\nEl programa LOCKSS &amp;lt;http://lockss.org/&amp;gt;, una iniciativa internacional de bibliotecas y editoriales, es un ejemplo vivo de un repositorio de preservación y archivo distribuido, a continuación le mostramos más detalles. El software, que funciona en ordenadores personales normales es gratuito; el sistema se conecta fácilmente; necesitando muy poco mantenimiento.<br />\n<br />\nPara contribuir al archivado de nuestra revista, le invitamos a convertirse en miembro de la comunidad LOCKSS, y así ayudar a recopilar y preservar títulos producidos en nuestra facultad y por otras entidades académicas de todo el mundo. Para hacerlo le rogamos que alguna persona de su biblioteca visite el sitio de LOCKSS para saber cómo funciona este sistema. Espero recibir pronto noticias suyas en el sentido de que proporcionará el apoyo para poder archivar esta revista.<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo solicita al / a la destinatario/a participar en la iniciativa LOCKSS e incluir esta revista en el archivo. Le proporciona información sobre la iniciativa LOCKSS y cómo participar.'),
('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.','This email template is used to notify a journal manager contact that a manual payment was requested.'),
('MANUAL_PAYMENT_NOTIFICATION','es_ES','Notificación de pago manual','Un pago manual necesita ser procesado para la revista  {$contextName} y el usuario {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nEl ítem pagado es &quot;{$itemName}&quot;.<br />\nEl precio es {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nEste correo ha sido generado por el módulo de Pago Manual de Open Journal Systems.','Este correo electrónico se usa para notificar al gestor/a de la revista de que se ha solicitado un pago manual.'),
('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),
('NOTIFICATION','es_ES','Nueva notificación desde {$siteTitle}','Tiene una nueva notificación desde {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nEnlace: {$url}<br />\n<br />\n{$principalContactSignature}','El correo electrónico se envía a usuarios/as registrados que hayan seleccionado recibir este tipo de notificación.'),
('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),
('NOTIFICATION_CENTER_DEFAULT','es_ES','Mensaje sobre {$contextName}','Introduzca su mensaje.','Mensaje (en blanco) por defecto usado en el Notification Center Message Listbuilder.'),
('OPEN_ACCESS_NOTIFY','en_US','Issue Now Open Access','Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),
('OPEN_ACCESS_NOTIFY','es_ES','Ahora el número es de acceso libre','Lectores:<br />\n<br />\n	{$contextName} acaba de hacer disponible de forma acceso libre el siguiente número. Los invitamos a revisar la Tabla de Contenido aquí y después visite nuestra página Web  ({$contextUrl}) para consultar los artículos que sean de su interés.<br />\n<br />\n	Gracias por mantener el interés en nuestro trabajo,<br />\n	{$editorialContactSignature}','Este correo electrónico se envía a los lectores/as registrados que han pedido recibir notificaciones por email cuando un número se vuelve de acceso libre.'),
('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),
('ORCID_COLLECT_AUTHOR_ID','es_ES','ORCID de envío','Estimado/a {$authorName},\n<br/>\nSe le ha añadido como coautor/a de un artículo para {$contextName}. <br/>\nPara confirmar su autoría, añada su identificador ORCID a este envío mediante el siguiente enlace.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registrar o conectar su identificador ORCID</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Puede encontrar más información sobre ORCID en {$contextName}</a><br/>\n<br/>\nSi tiene cualquier pregunta no dude en contactarme.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Esta plantilla de correo electrónico se utiliza para recopilar los identificadores ORCID de los autores/as.'),
('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),
('ORCID_REQUEST_AUTHOR_AUTHORIZATION','es_ES','Solicitando acceso de registro ORCID','Estimado/a {$authorName},<br>\n<br>\nUsted ha sido incluido como autor en la presentación del manuscrito \"{$submissionTitle}\" a {$contextName}.\n<br>\n<br>\nPermítanos agregar su identificación ORCID a este envío y también agregar el mismo a su perfil ORCID en la publicación.<br>\nVisite el enlace al sitio web oficial de ORCID, inicie sesión con su perfil y autorice el acceso siguiendo las instrucciones.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registre o conecte su ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">Más acerca de ORCID en{$contextName}</a><br/>\n<br>\nSi tiene alguna pregunta, por favor póngase en contacto conmigo.<br>\n<br>\n{$principalContactSignature}<br>\n','Esta plantilla de correo electrónico se utiliza para solicitar acceso de registro ORCID a los autores/as.'),
('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),
('PASSWORD_RESET','es_ES','Cambio de contraseña','Su contraseña en {$siteTitle} se ha cambiado sin problema. Por favor, guarde en lugar seguro su nombre de usuaria/o y contraseña, ya que son necesarios para trabajar con la revista.<br />\n<br />\nNombre de usuaria/o: {$username}<br />\nContraseña: {$password}<br />\n<br />\n{$principalContactSignature}','Este correo se envía a un/a usuario/a registrado/a una vez han cambiado su contraseña siguiendo el procedimiento descrito en el correo-e PASSWORD_RESET_CONFIRM.'),
('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PASSWORD_RESET_CONFIRM','es_ES','Confirmación de cambio de contraseña','Hemos recibido una petición para cambiar su contraseña en {$siteTitle}.<br />\n<br />\nSi no hizo usted esta petición ignore este correo-e y su contraseña no cambiará. Si desea cambiar su contraseña pinche en el enlace que le mostramos a continuación.<br />\n<br />\nCambiar mi contraseña: {$url}<br />\n<br />\n{$principalContactSignature}','Este correo se envía a un/a usuario/a registrado/a cuando indican que han olvidado su contraseña o que no se pueden identificar. Proporciona una URL para que cambien su contraseña.'),
('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),
('PAYPAL_INVESTIGATE_PAYMENT','es_ES','Actividad inusual de PayPal','Open Journal Systems ha detectado una actividad inusual relacionada con el soporte de pago por PayPal de la revista {$contextName}. Esta actividad podría requerir una investigación más detallada o una intervención manual<br />\n                       <br />\nEste correo electrónico ha sido generado por el módulo de PayPal de Open Journal Systems.<br />\n<br />\nInformación completa de envío para la solicitud:<br />\n{$postInfo}<br />\n<br />\nInformación adicional (si se proporciona):<br />\n{$additionalInfo}<br />\n<br />\nVariables de servidor:<br />\n{$serverVars}<br />\n','Esta plantilla de correo es usada para notificar al contacto principal de la revista de que el plugin de PayPal ha detectado actividad sospechosa o actividad que requiere de intervención manual.'),
('PUBLISH_NOTIFY','en_US','New Issue Published','Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),
('PUBLISH_NOTIFY','es_ES','Nuevo número publicado','Estimados/as lectores/as:<br />\n<br />\n{$contextName} acaba de publicar su último número en {$contextUrl}. A continuación le mostramos la tabla de contenidos, después puede visitar nuestro sitio web para consultar los artículos que sean de su interés.<br />\n<br />\nGracias por mantener el interés en nuestro trabajo,<br />\n{$editorialContactSignature}','Este correo se envía a lectores/as registrados/as a través del enlace \"Notificar a usuarios/as\" en la página principal de los editores/as. Notifica a los/as lectores/as de la aparición de un nuevo número y les invita a visitar la revista en la URL proporcionada.'),
('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('REVIEWER_REGISTER','es_ES','Revisor para {$contextName}','A la vista de su trayectoria profesional, su nombre ha sido propuesto para figurar como revisor potencial en el sistema de gestión electrónica de artículos de la revista {$contextName}, sin que ello implique ningún compromiso por su parte y pudiendo dejar de formar parte de esta lista cuando lo desee. Únicamente nos posibilita poder enviarle artículos para una eventual revisión por su parte. En caso de estar conforme con actuar como revisor para la revista, podrá recibir solicitudes de revisión de artículos, y aceptar o rechazar dichas solicitudes en su momento.<br />\n<br />\nA continuación le enviamos un nombre de usuario/a y contraseña con los que podrá acceder al sistema de gestión de envíos de la revista, donde además podrá indicarnos los temas que le son de interés como revisor.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nAgradecidos por su atención, reciba un cordial saludo,<br />\n{$principalContactSignature}','Este email se envía a los nuevos revisores para darles la bienvenida al sistema y proporcionarles sus datos de acceso.'),
('REVIEW_ACK','en_US','Article Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_ACK','es_ES','Acuse de recibo de revisión de artículo','{$reviewerName}:<br />\n<br />\nGracias por completar la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Apreciamos su contribución a la calidad de los trabajos que publicamos.','Este correo enviado por el/la Editor/a de Sección para confirmar la recepción de una revisión completada y agradecer al / a la revisor/a su contribución.'),
('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CANCEL','es_ES','Petición de revisión cancelada','{$reviewerName}:<br />\n<br />\nHemos decidido cancelar nuestra petición para que revisara el envío &quot;{$submissionTitle},&quot; para {$contextName}. Lamentamos las molestias que hayamos podido causarle y esperamos poder volver a contactar con usted en el futuro para que nos ayude en el proceso de revisión.<br />\n<br />\nSi tiene cualquier pregunta, no dude en contactar con nosotros/as.','Este correo del / de la Editor/a de Sección a un/a Revisor/a que tiene la revisión de un envío en progreso para notificarles que la revisión se ha cancelado.'),
('REVIEW_CONFIRM','en_US','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),
('REVIEW_CONFIRM','es_ES','Acepto la revisión','Editores/as:<br />\n<br />\nTengo la capacidad y deseo revisar el envío &quot;{$submissionTitle},&quot; para {$contextName}. Gracias por acordarse de mí, es mi intención tener la revisión completa en el plazo indicado: {$reviewDueDate}, a ser posible antes.<br />\n<br />\n{$reviewerName}','Este correo es enviado por un/a revisor/a al / a la Editor/a de Sección en respuesta a una petición de revisión para notificarle que ha aceptado la petición y que será completada antes de la fecha especificada.'),
('REVIEW_DECLINE','en_US','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),
('REVIEW_DECLINE','es_ES','Rechazo la revisión','Editores/as:<br />\n<br />\nMe temo que en este momento no voy a poder revisar el envío &quot;{$submissionTitle},&quot; para {$contextName}. Gracias por pensar en mí, espero que vuelvan a contar conmigo en futuras ocasiones.<br />\n<br />\n{$reviewerName}','Este correo es enviado por un/a revisor/a al / a la Editor/a de Sección en respuesta a una petición de revisión para notificarle que rechaza la petición de revisión.'),
('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.'),
('REVIEW_REINSTATE','es_ES','Solicitud de revisión restablecida','{$reviewerName}:<br />\n<br />\nNos gustaría restablecer la solicitud que le hicimos para revisar el envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperamos que nos pueda ayudar en este proceso de revisión de la revista.<br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme.','Este correo electrónico lo envía el editor/a de sección a un revisor/a con alguna revisión en curso para notificarle que una revisión cancelada ha sido restablecida.'),
('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND','es_ES','Recordatorio de envío de revisión','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, esperamos nos la mande en cuanto la tenga lista.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contraseña para la revista puede pinchar en el siguiente enlace para cambiar su contraseña (se la enviaremos por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado por el/la Editor/a de Sección para recordar a un/a revisor/a que ya debe entregar su revisión.'),
('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO','es_ES','Recordatorio automático de revisión de envío','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, y se ha generado automáticamente este correo-e al haberse superado dicha fecha. Aún estaríamos encantados de recibirla una vez la tenga lista.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contraseña para la revista puede pinchar en el siguiente enlace para cambiar su contraseña (se la enviaremos por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado automáticamente cuando se supera la fecha de entrega de un/a revisor/a (véase Opciones de Revisión en Configuración de la revista, paso 2). Las tareas planificadas deben estar activadas y configuradas (ver fichero de configuración del sitio).'),
('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK','es_ES','Recordatorio automático de revisión de envío','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, y se ha generado automáticamente este correo-e al haberse superado dicha fecha. Aún estaríamos encantados de recibirla una vez la tenga lista.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico se envía automáticamente cuando transcurre la fecha de vencimiento del revisor (consulte Opciones de revisión en Configuración > Flujo de trabajo> Revisar) y cuando se habilita el acceso de revisor con un clic. Las tareas programadas deben estar habilitadas y configuradas (consulte el archivo de configuración del sitio).'),
('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_ONECLICK','es_ES','Recordatorio de envío de revisión','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, esperamos nos la mande en cuanto la tenga lista.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado por el/la Editor/a de Sección para recordar a un/a revisor/a que ya debe entregar su revisión.'),
('REVIEW_REQUEST','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un excelente revisor/a del manuscrito, &quot;{$submissionTitle},&quot; que ha sido enviado a {$contextName}. A continuación encontrará el resumen del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, inicie sesión en la página web de la revista antes del {$responseDueDate} para indicarnos si llevará a cabo o no la revisión, así como para tener acceso al envío y para registrar su revisión y recomendación. La dirección es {$contextUrl}<br />\n<br />\nLa revisión propiamente dicha debería estar lista el {$reviewDueDate}.<br />\n<br />\nSi no recuerda su nombre de usuaria/o y contraseña, puede utilizar este enlace para restablecer su contraseña (esta le será enviada por correo electrónico junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar nuestra solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico del editor/a de sección se dirige a un revisor/a para solicitarle que acepte o rechace la tarea de revisión de un envío. El correo proporciona información sobre el envío, como el título y el resumen, el plazo de revisión y cómo acceder al envío propiamente dicho. Este mensaje se usa cuando se selecciona el proceso de revisión estándar en Gestión > Ajustes > Flujo de trabajo > Revisión. (Si no consulte REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ATTACHED','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ATTACHED','es_ES','Petición de revisión de artículo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un/a excelente revisor/a del manuscrito &quot;{$submissionTitle},&quot;. A continuación encontrará un extracto del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros. A continuación le mostramos las Normas de Revisión de esta revista y adjunto a este correo-e recibirá el envío. Debería enviarme por correo-e su revisión del envío, así como su recomendación antes del {$reviewDueDate}.<br />\n<br />\nLe ruego me conteste a este correo-e antes del {$responseDueDate} y me comunique si puede y quiere hacer la revisión.<br />\n<br />\nGracias por tener en cuenta esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nNormas de Revisión<br />\n<br />\n{$reviewGuidelines}<br />\n','Este correo electrónico del editor/a de sección se dirige a un revisor/a para solicitarle que acepte o rechace la tarea de revisión de un envío. El correo incluye el envío como adjunto. Este mensaje se usa cuando se selecciona el proceso de revisión de adjunto de correo en Gestión > Ajustes > Flujo de trabajo > Revisión. (Si no consulte REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nLas normas de revisión de esta revista se pueden ver a continuación. Además, el artículo se adjunta en este correo electrónico. Debería enviarnos su revisión del envío, junto con su recomendación, antes del {$reviewDueDate}.<br />\n<br />\nPor favor, responda a este correo electrónico antes del {$responseDueDate} e indíquenos si puede y desea realizar esta revisión.<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nNormas de revisión<br />\n<br />\n{$reviewGuidelines}<br />\n','El editor de sección envía este correo electrónico a un revisor para pedirle si acepta o rechaza la tarea de revisión de un artículo en segunda ronda. Este incluye el envío como adjunto. Este mensaje se usa cuando se selecciona el proceso de revisión de archivos adjuntos por correo electrónico en el paso 2 de la configuración de la revista. (Por lo demás, vea SOLICITUD_DE_REVISIÓN_POSTERIOR.)'),
('REVIEW_REQUEST_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK','es_ES','Petición de revisión de artículo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un/a excelente revisor/a del manuscrito &quot;{$submissionTitle},&quot; que ha sido enviado a {$contextName}. A continuación encontrará un extracto del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, identifíquese en la revista antes de {$responseDueDate} para decirnos si hará o no la revisión, así como para tener acceso al envío y para registrar su revisión y recomendación.<br />\n<br />\nLa revisión propiamente dicha debe estar lista para el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por tener en cuenta nuestra solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo del / de la Editor/a de Sección a un/a revisor/a le solicita que acepte o rechace la revisión de un envío. Proporciona información sobre el envío como el título y el resumen, el plazo de revisión, y cómo acceder al envío propiamente dicho. Este mensaje se usa cuando se selecciona el Proceso de Envío Estándar en la configuración de la revista, paso 2, y está activado el acceso a la revisión en un click.'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nInicie sesión en el sitio web de la revista antes del {$responseDueDate} para indicar si llevará a cabo la revisión o no, además de para obtener acceso al envío y registrar su revisión y recomendación.<br />\n<br />\nLa fecha límite para entregar la revisión es el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico del editor/a de sección a un revisor/a solicita que el revisor/a acepte o rechace la tarea de revisar un envío para una ronda de revisión adicional. Además, proporciona información sobre el envío como el título, el resumen, la fecha de entrega de la revisión y cómo obtener acceso al propio envío. Este mensaje se usa cuando se selecciona el proceso de revisión estándar en el paso 2 de la configuración de la revista y cuando se habilita el acceso al revisor/a con un solo clic.'),
('REVIEW_REQUEST_REMIND_AUTO','en_US','Article Review Request Reminder','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO','es_ES','Recordatorio de solicitud de revisión de artículo','{$reviewerName}:<br />\nLe recordamos nuestra petición acerca de la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos tener esta revisión como muy tarde el {$responseDueDate}, por lo cual este correo electrónico se ha generado automáticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del envío se ha insertado a continuación. Creemos que sería un excelente revisor para este artículo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la página web de la revista para indicar si realizará o no la revisión, y en caso afirmativo para acceder al envío y registrar su revisión y su recomendación. El sitio web es {$contextUrl}<br />\n<br />\nLa fecha límite para la revisión es el {$reviewDueDate}.<br />\n<br />\nSi no dispone de un nombre de usuario/a y contraseña para el sitio web de la revista, puede hacer clic en este enlace para restablecer su contraseña (se la enviaremos junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta petición.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico se envía automáticamente cuando transcurre la fecha de entrega del revisor/a (vea las opciones de revisión en el paso 2 de la configuración de la revista) y se deshabilita el acceso al revisor/a con un solo clic. Las tareas planificadas se deben habilitar y configurar (vea el archivo de configuración del sitio).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\nLe recordamos nuestra petición acerca de la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos tener esta revisión como muy tarde el {$responseDueDate}, por lo cual este correo electrónico se ha generado automáticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del envío se ha insertado a continuación. Creemos que sería un excelente revisor para este artículo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la página web de la revista para indicar si realizará o no la revisión, y en caso afirmativo para acceder al envío y registrar su revisión y su recomendación. <br />\n<br />\nLa fecha límite para la revisión es el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta petición.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico se envía automáticamente cuando transcurre la fecha de entrega del revisor/a (vea las opciones de revisión en el paso 2 de la configuración de la revista) y se habilita el acceso al revisor/a con un solo clic. Las tareas planificadas se deben habilitar y configurar (vea el archivo de configuración del sitio).'),
('REVIEW_REQUEST_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVIEW_REQUEST_SUBSEQUENT','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nInicie sesión en el sitio web de la revista antes del {$responseDueDate} para indicar si llevará a cabo la revisión o no, además de para obtener acceso al envío y registrar su revisión y recomendación. El sitio web es {$contextUrl}<br />\n<br />\nLa fecha límite para entregar la revisión es el {$reviewDueDate}.<br />\n<br />\nSi no dispone de un nombre de usuario/a y contraseña para el sitio web de la revista, puede hacer clic en este enlace para restablecer su contraseña (se la enviaremos junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico del editor/a de sección a un revisor/a solicita que el revisor/a acepte o rechace la tarea de revisar un envío para una ronda de revisión adicional. Además, proporciona información sobre el envío como el título, el resumen, la fecha de entrega de la revisión y cómo obtener acceso al propio envío. Este mensaje se usa cuando se selecciona el proceso de revisión estándar en Gestión > Ajustes > Flujo de trabajo > Revisión. (Por lo demás, vea REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVISED_VERSION_NOTIFY','en_US','Revised Version Uploaded','Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),
('REVISED_VERSION_NOTIFY','es_ES','Versión revisada cargada','Editores/as:<br />\n<br />\nEl autor {$authorName} ha cargado un versión revisada de &quot;{$submissionTitle}&quot;.<br />\n<br />\nURL del envío: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico se envía de forma automática al editor/a asignado cuando el autor/a carga una versión revisada de un artículo.'),
('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),
('STATISTICS_REPORT_NOTIFICATION','es_ES','Actividad editorial por {$month}, {$year}','\n{$name}, <br />\n<br />\nEl informe de estado de su revista de {$month}, {$year} ya está disponible. Las estadísticas clave de este mes son las siguientes.<br />\n<ul>\n	<li>Nuevos envíos este mes: {$newSubmissions}</li>\n	<li>Envíos rechazados este mes: {$declinedSubmissions}</li>\n	<li>Envíos aceptados este mes: {$acceptedSubmissions}</li>\n	<li>Envíos totales en el sistema: {$totalSubmissions}</li>\n</ul>\nInicie sesión en la revista para obtener más detalles sobre las <a href=\"{$editorialStatsLink}\">tendencias editoriales</a> y las <a href=\"{$publicationStatsLink}\">estadísticas de artículos publicados</a>. Se adjunta una copia completa del informe correspondiente a este mes .<br />\n<br />\nSaludos cordiales,<br />\n{$principalContactSignature}','Este correo electrónico es enviado mensualmente y de manera automática a los editores y administradores de publicaciones para suministrarles una visión general de la publicación.'),
('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when they complete the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),
('SUBMISSION_ACK','es_ES','Acuse de recibo del envío','{$authorName}:<br />\n<br />\nGracias por enviar el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. Con el sistema de gestión de publicaciones en línea que utilizamos podrá seguir el progreso a través del proceso editorial tras iniciar sesión en el sitio web de la publicación:<br />\n<br />\nURL del manuscrito: {$submissionUrl}<br />\nNombre de usuario/a: {$authorUsername}<br />\n<br />\nSi tiene alguna duda puede ponerse en contacto conmigo. Gracias por elegir esta editorial para mostrar su trabajo.<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico, si está activado, se envía automáticamente a un autor/a cuando completa el proceso de envío de un manuscrito a la editorial. Proporciona información sobre el seguimiento del envío en el proceso y agradece al autor/a el envío.'),
('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),
('SUBMISSION_ACK_NOT_USER','es_ES','Acuse de recibo del envío','Hola,<br />\n<br />\n{$submitterName} ha enviado el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. <br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme. Le agradecemos que haya elegido esta revista para dar a conocer su obra.<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico, si está activado, se envía automáticamente a los autores/as que no son usuarios/as del OJS especificado durante el proceso de envío.'),
('SUBSCRIPTION_AFTER_EXPIRY','en_US','Subscription Expired','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY','es_ES','Subscripción expirada','{$subscriberName}:<br />\n<br />\n	Su subscripción a {$contextName} ha expirado.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para renovar su suscripción entre en la página web de la revista.  Puede acceder al sistema con su nombre de usuario, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo electrónico notifica al suscriptor que su subscripción ha expirado.  También proporciona la dirección URL de la revista con las instrucciones para acceder a la misma.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST','en_US','Subscription Expired - Final Reminder','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST','es_ES','Suscripción expirada - Último recordatorio','{$subscriberName}:<br />\n<br />\n	Su suscripción a {$contextName} ha expirado.<br />\n	Tenga en cuenta que este es el último correo que recibirá para recordárselo.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para renovar su suscripción entre en la página web de la revista.  Puede acceder al sistema con su nombre de usuario/a, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo electrónico notifica al suscriptor que su subscripción ha expirado.  También proporciona la dirección URL de la revista con las instrucciones para acceder a la misma.'),
('SUBSCRIPTION_BEFORE_EXPIRY','en_US','Notice of Subscription Expiry','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_BEFORE_EXPIRY','es_ES','Notificación de expiración de suscripción','{$subscriberName}:<br />\n<br />\n	Su suscripción a {$contextName} está a punto de expirar.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para asegurarse de que continúa teniendo acceso a la revista entre en la página web de la revista y renueve su suscripción.  Puede acceder al sistema con su nombre de usuario/a, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo electrónico notifica al suscriptor que su subscripción va a expirar pronto.  También proporciona la dirección URL de la revista e instrucciones para acceder a la misma.'),
('SUBSCRIPTION_NOTIFY','en_US','Subscription Notification','{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_NOTIFY','es_ES','Notificación de suscripción','{$subscriberName}:<br />\n<br />\nAcaba de registrarse como suscriptor/a en nuestro sistema de gestión de revistas online para la revista {$contextName}, a continuación le mostramos los datos de su suscripción:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPara acceder al contenido exclusivo para suscriptores/as, simplemente tiene que identificarse con su nombre de usuaria/o, &quot;{$username}&quot;.<br />\n<br />\nUna vez se haya identificado en el sistema puede cambiar los detalles de su perfil y su contraseña en cualquier momento.<br />\n<br />\nTenga en cuenta que si se trata de una suscripción institucional no es necesario que los/as usuarios/as de su institución se identifiquen, ya que las peticiones de contenido bajo suscripción serán autentificadas automáticamente por el sistema.<br />\n<br />\nSi tiene cualquier pregunta no dude en contactar con nosotros/as.<br />\n<br />\n{$subscriptionContactSignature}','Este correo electrónico notifica a un/a lector/a registrado/a que el/la Gestor/a les ha creado una suscripción. Proporciona la URL de la revista junto con instrucciones para acceder a ella.'),
('SUBSCRIPTION_PURCHASE_INDL','en_US','Subscription Purchase: Individual','An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INDL','es_ES','Compra de suscripción: Individual','Se ha adquirido en línea una suscripción individual para {$contextName} con los detalles siguientes:<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción, use la siguiente URL.<br />\n<br />\nURL de la suscripción: {$subscriptionUrl}<br />\n','Este correo electrónico notifica al administrador/a de suscripciones que una suscripción individual ha sido adquirida en línea. Proporciona un resumen de la información sobre la suscripción y un enlace de acceso rápido a la suscripción adquirida.'),
('SUBSCRIPTION_PURCHASE_INSTL','en_US','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INSTL','es_ES','Compra de suscripción: Institucional','Se ha adquirido en línea una suscripción institucional para {$contextName} con los siguientes detalles. Para activar la suscripción, use el enlace proporcionado y configure el estado de la suscripción como \'Activo\'.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nInstitución:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos de IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción, use el siguiente enlace.<br />\n<br />\nEnlace de la suscripción: {$subscriptionUrl}<br />\n','Este correo electrónico notifica al administrador/a de suscripciones que una suscripción institucional ha sido adquirida en línea. Proporciona información resumida sobre la suscripción y un enlace de acceso rápido a la suscripción adquirida.'),
('SUBSCRIPTION_RENEW_INDL','en_US','Subscription Renewal: Individual','An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INDL','es_ES','Renovación de suscripción: Individual','Una suscripción individual ha sido renovada en línea para {$contextName} con los siguientes detalles.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripción: {$subscriptionUrl}<br />\n','Este correo notifica al administrador/a de suscripciones que una suscripción individual se ha renovado en línea. Proporciona información resumida sobre la suscripción y  un enlace de acceso rápido a la suscripción renovada.'),
('SUBSCRIPTION_RENEW_INSTL','en_US','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INSTL','es_ES','Renovación de suscripción: Institucional','Se ha renovado en línea una suscripción institucional para {$contextName} con los detalles siguientes.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nInstitución:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripción: {$subscriptionUrl}<br />\n','Este correo en línea notifica al administrador/a de suscripciones que una suscripción institucional ha sido renovada en línea. Proporciona información resumida de la suscripción y un enlace de acceso rápido a la suscripción renovada.'),
('USER_REGISTER','en_US','Journal Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_REGISTER','es_ES','Nuevo registro de usuaria/o','{$userFullName}<br />\n<br />\nSe ha registrado con éxito como usuario/a en {$contextName}. En este correo se incluyen su nombre de usuario/a y contraseña, datos necesarios para realizar cualquier tarea relacionada con la revista a través de la página web. En cualquier momento puede solicitar que se le elimine de la lista de usuarios/as de la revista contactándome.<br />\n<br />\nNombre de usuario/a: {$username}<br />\nContraseña: {$password}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo se envía a un/a usuario/a que se acaba de registrar para darle la bienvenida al sistema y proporcionarle sus datos de acceso.'),
('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),
('USER_VALIDATE','es_ES','Activación de cuenta','Estimado/a {$userFullName}<br />\n<br />\nHa creado una cuenta de usuario/a en {$contextName}, pero antes de poder utilizarla debe validar su correo electrónico. Para ello, simplemente haga clic en el siguiente enlace:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo electrónico se envía a los usuarios/as recién registrados para que validen su cuenta de correo.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  KEY `email_settings_email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(1,'contexts/1/submissions/8/8-proof-article.pdf','application/pdf'),
(2,'contexts/1/submissions/8/proof-article-8.pdf','application/pdf'),
(3,'contexts/1/submissions/9/proof-article-9.pdf','application/pdf'),
(4,'contexts/1/submissions/10/proof-article-10.pdf','application/pdf'),
(5,'contexts/1/submissions/11/proof-article-11.pdf','application/pdf'),
(6,'contexts/1/submissions/12/proof-article-12.pdf','application/pdf'),
(7,'contexts/1/submissions/13/proof-article-13.pdf','application/pdf'),
(8,'contexts/1/submissions/14/proof-article-14.pdf','application/pdf'),
(9,'contexts/1/submissions/15/proof-article-15.pdf','application/pdf'),
(10,'contexts/1/submissions/16/proof-article-16.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES
(1,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),
(2,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(3,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string'),
(4,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd'),
(5,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),
(6,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),
(7,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),
(8,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),
(9,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),
(10,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),
(11,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),
(12,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.Author[]'),
(13,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),
(14,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),
(15,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.ArticleGalley','xml::schema(plugins/importexport/native/native.xsd)'),
(16,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.ArticleGalley[]'),
(17,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),
(18,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),
(19,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(20,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),
(21,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(22,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),
(23,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(24,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(25,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(26,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(27,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.article.ArticleGalley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES
(1,1,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),
(2,2,0,'DOAJ XML export','plugins.importexport.doaj.filter.DOAJXmlFilter',0,0,0),
(3,3,0,'DOAJ JSON export','plugins.importexport.doaj.filter.DOAJJsonFilter',0,0,0),
(4,4,0,'ArticlePubMedXmlFilter','plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter',0,0,0),
(5,5,0,'Native XML submission export','plugins.importexport.native.filter.ArticleNativeXmlFilter',0,0,0),
(6,6,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlArticleFilter',0,0,0),
(7,7,0,'Native XML issue export','plugins.importexport.native.filter.IssueNativeXmlFilter',0,0,0),
(8,8,0,'Native XML issue import','plugins.importexport.native.filter.NativeXmlIssueFilter',0,0,0),
(9,9,0,'Native XML issue galley export','plugins.importexport.native.filter.IssueGalleyNativeXmlFilter',0,0,0),
(10,10,0,'Native XML issue galley import','plugins.importexport.native.filter.NativeXmlIssueGalleyFilter',0,0,0),
(11,11,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),
(12,12,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),
(13,14,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArticleFileFilter',0,0,0),
(14,13,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),
(15,15,0,'Native XML representation export','plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter',0,0,0),
(16,16,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlArticleGalleyFilter',0,0,0),
(17,17,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),
(18,18,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),
(19,19,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),
(20,20,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),
(21,21,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),
(22,22,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0),
(23,23,0,'Crossref XML issue export','plugins.importexport.crossref.filter.IssueCrossrefXmlFilter',0,0,0),
(24,24,0,'Crossref XML issue export','plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter',0,0,0),
(25,25,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),
(26,26,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),
(27,27,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES
(1,'en_US','name','Article Text','string'),
(1,'es_ES','name','Texto del artículo','string'),
(2,'en_US','name','Research Instrument','string'),
(2,'es_ES','name','Instrumento de investigación','string'),
(3,'en_US','name','Research Materials','string'),
(3,'es_ES','name','Materiales de investigación','string'),
(4,'en_US','name','Research Results','string'),
(4,'es_ES','name','Resultados de la investigación','string'),
(5,'en_US','name','Transcripts','string'),
(5,'es_ES','name','Transcripciones','string'),
(6,'en_US','name','Data Analysis','string'),
(6,'es_ES','name','Análisis de datos','string'),
(7,'en_US','name','Data Set','string'),
(7,'es_ES','name','Conjunto de datos','string'),
(8,'en_US','name','Source Texts','string'),
(8,'es_ES','name','Textos fuente','string'),
(9,'en_US','name','Multimedia','string'),
(9,'es_ES','name','Multimedia','string'),
(10,'en_US','name','Image','string'),
(10,'es_ES','name','Imagen','string'),
(11,'en_US','name','HTML Stylesheet','string'),
(11,'es_ES','name','Hoja de estilo HTML','string'),
(12,'en_US','name','Other','string'),
(12,'es_ES','name','Otro','string'),
(13,'en_US','name','Article Text','string'),
(13,'es_ES','name','Texto del artículo','string'),
(14,'en_US','name','Research Instrument','string'),
(14,'es_ES','name','Instrumento de investigación','string'),
(15,'en_US','name','Research Materials','string'),
(15,'es_ES','name','Materiales de investigación','string'),
(16,'en_US','name','Research Results','string'),
(16,'es_ES','name','Resultados de la investigación','string'),
(17,'en_US','name','Transcripts','string'),
(17,'es_ES','name','Transcripciones','string'),
(18,'en_US','name','Data Analysis','string'),
(18,'es_ES','name','Análisis de datos','string'),
(19,'en_US','name','Data Set','string'),
(19,'es_ES','name','Conjunto de datos','string'),
(20,'en_US','name','Source Texts','string'),
(20,'es_ES','name','Textos fuente','string'),
(21,'en_US','name','Multimedia','string'),
(21,'es_ES','name','Multimedia','string'),
(22,'en_US','name','Image','string'),
(22,'es_ES','name','Imagen','string'),
(23,'en_US','name','HTML Stylesheet','string'),
(23,'es_ES','name','Hoja de estilo HTML','string'),
(24,'en_US','name','Other','string'),
(24,'es_ES','name','Otro','string'),
(25,'en_US','name','Article Text','string'),
(25,'es_ES','name','Texto del artículo','string'),
(26,'en_US','name','Research Instrument','string'),
(26,'es_ES','name','Instrumento de investigación','string'),
(27,'en_US','name','Research Materials','string'),
(27,'es_ES','name','Materiales de investigación','string'),
(28,'en_US','name','Research Results','string'),
(28,'es_ES','name','Resultados de la investigación','string'),
(29,'en_US','name','Transcripts','string'),
(29,'es_ES','name','Transcripciones','string'),
(30,'en_US','name','Data Analysis','string'),
(30,'es_ES','name','Análisis de datos','string'),
(31,'en_US','name','Data Set','string'),
(31,'es_ES','name','Conjunto de datos','string'),
(32,'en_US','name','Source Texts','string'),
(32,'es_ES','name','Textos fuente','string'),
(33,'en_US','name','Multimedia','string'),
(33,'es_ES','name','Multimedia','string'),
(34,'en_US','name','Image','string'),
(34,'es_ES','name','Imagen','string'),
(35,'en_US','name','HTML Stylesheet','string'),
(35,'es_ES','name','Hoja de estilo HTML','string'),
(36,'en_US','name','Other','string'),
(36,'es_ES','name','Otro','string'),
(37,'en_US','name','Article Text','string'),
(37,'es_ES','name','Texto del artículo','string'),
(38,'en_US','name','Research Instrument','string'),
(38,'es_ES','name','Instrumento de investigación','string'),
(39,'en_US','name','Research Materials','string'),
(39,'es_ES','name','Materiales de investigación','string'),
(40,'en_US','name','Research Results','string'),
(40,'es_ES','name','Resultados de la investigación','string'),
(41,'en_US','name','Transcripts','string'),
(41,'es_ES','name','Transcripciones','string'),
(42,'en_US','name','Data Analysis','string'),
(42,'es_ES','name','Análisis de datos','string'),
(43,'en_US','name','Data Set','string'),
(43,'es_ES','name','Conjunto de datos','string'),
(44,'en_US','name','Source Texts','string'),
(44,'es_ES','name','Textos fuente','string'),
(45,'en_US','name','Multimedia','string'),
(45,'es_ES','name','Multimedia','string'),
(46,'en_US','name','Image','string'),
(46,'es_ES','name','Imagen','string'),
(47,'en_US','name','HTML Stylesheet','string'),
(47,'es_ES','name','Hoja de estilo HTML','string'),
(48,'en_US','name','Other','string'),
(48,'es_ES','name','Otro','string'),
(49,'en_US','name','Article Text','string'),
(49,'es_ES','name','Texto del artículo','string'),
(50,'en_US','name','Research Instrument','string'),
(50,'es_ES','name','Instrumento de investigación','string'),
(51,'en_US','name','Research Materials','string'),
(51,'es_ES','name','Materiales de investigación','string'),
(52,'en_US','name','Research Results','string'),
(52,'es_ES','name','Resultados de la investigación','string'),
(53,'en_US','name','Transcripts','string'),
(53,'es_ES','name','Transcripciones','string'),
(54,'en_US','name','Data Analysis','string'),
(54,'es_ES','name','Análisis de datos','string'),
(55,'en_US','name','Data Set','string'),
(55,'es_ES','name','Conjunto de datos','string'),
(56,'en_US','name','Source Texts','string'),
(56,'es_ES','name','Textos fuente','string'),
(57,'en_US','name','Multimedia','string'),
(57,'es_ES','name','Multimedia','string'),
(58,'en_US','name','Image','string'),
(58,'es_ES','name','Imagen','string'),
(59,'en_US','name','HTML Stylesheet','string'),
(59,'es_ES','name','Hoja de estilo HTML','string'),
(60,'en_US','name','Other','string'),
(60,'es_ES','name','Otro','string'),
(61,'en_US','name','Article Text','string'),
(61,'es_ES','name','Texto del artículo','string'),
(62,'en_US','name','Research Instrument','string'),
(62,'es_ES','name','Instrumento de investigación','string'),
(63,'en_US','name','Research Materials','string'),
(63,'es_ES','name','Materiales de investigación','string'),
(64,'en_US','name','Research Results','string'),
(64,'es_ES','name','Resultados de la investigación','string'),
(65,'en_US','name','Transcripts','string'),
(65,'es_ES','name','Transcripciones','string'),
(66,'en_US','name','Data Analysis','string'),
(66,'es_ES','name','Análisis de datos','string'),
(67,'en_US','name','Data Set','string'),
(67,'es_ES','name','Conjunto de datos','string'),
(68,'en_US','name','Source Texts','string'),
(68,'es_ES','name','Textos fuente','string'),
(69,'en_US','name','Multimedia','string'),
(69,'es_ES','name','Multimedia','string'),
(70,'en_US','name','Image','string'),
(70,'es_ES','name','Imagen','string'),
(71,'en_US','name','HTML Stylesheet','string'),
(71,'es_ES','name','Hoja de estilo HTML','string'),
(72,'en_US','name','Other','string'),
(72,'es_ES','name','Otro','string'),
(73,'en_US','name','Article Text','string'),
(73,'es_ES','name','Texto del artículo','string'),
(74,'en_US','name','Research Instrument','string'),
(74,'es_ES','name','Instrumento de investigación','string'),
(75,'en_US','name','Research Materials','string'),
(75,'es_ES','name','Materiales de investigación','string'),
(76,'en_US','name','Research Results','string'),
(76,'es_ES','name','Resultados de la investigación','string'),
(77,'en_US','name','Transcripts','string'),
(77,'es_ES','name','Transcripciones','string'),
(78,'en_US','name','Data Analysis','string'),
(78,'es_ES','name','Análisis de datos','string'),
(79,'en_US','name','Data Set','string'),
(79,'es_ES','name','Conjunto de datos','string'),
(80,'en_US','name','Source Texts','string'),
(80,'es_ES','name','Textos fuente','string'),
(81,'en_US','name','Multimedia','string'),
(81,'es_ES','name','Multimedia','string'),
(82,'en_US','name','Image','string'),
(82,'es_ES','name','Imagen','string'),
(83,'en_US','name','HTML Stylesheet','string'),
(83,'es_ES','name','Hoja de estilo HTML','string'),
(84,'en_US','name','Other','string'),
(84,'es_ES','name','Otro','string'),
(85,'en_US','name','Article Text','string'),
(85,'es_ES','name','Texto del artículo','string'),
(86,'en_US','name','Research Instrument','string'),
(86,'es_ES','name','Instrumento de investigación','string'),
(87,'en_US','name','Research Materials','string'),
(87,'es_ES','name','Materiales de investigación','string'),
(88,'en_US','name','Research Results','string'),
(88,'es_ES','name','Resultados de la investigación','string'),
(89,'en_US','name','Transcripts','string'),
(89,'es_ES','name','Transcripciones','string'),
(90,'en_US','name','Data Analysis','string'),
(90,'es_ES','name','Análisis de datos','string'),
(91,'en_US','name','Data Set','string'),
(91,'es_ES','name','Conjunto de datos','string'),
(92,'en_US','name','Source Texts','string'),
(92,'es_ES','name','Textos fuente','string'),
(93,'en_US','name','Multimedia','string'),
(93,'es_ES','name','Multimedia','string'),
(94,'en_US','name','Image','string'),
(94,'es_ES','name','Imagen','string'),
(95,'en_US','name','HTML Stylesheet','string'),
(95,'es_ES','name','Hoja de estilo HTML','string'),
(96,'en_US','name','Other','string'),
(96,'es_ES','name','Otro','string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES
(1,1,0,1,1,0,0,'SUBMISSION'),
(2,1,1,1,3,0,1,'RESEARCHINSTRUMENT'),
(3,1,2,1,3,0,1,'RESEARCHMATERIALS'),
(4,1,3,1,3,0,1,'RESEARCHRESULTS'),
(5,1,4,1,3,0,1,'TRANSCRIPTS'),
(6,1,5,1,3,0,1,'DATAANALYSIS'),
(7,1,6,1,3,0,1,'DATASET'),
(8,1,7,1,3,0,1,'SOURCETEXTS'),
(9,1,8,1,1,1,1,'MULTIMEDIA'),
(10,1,9,1,2,1,0,'IMAGE'),
(11,1,10,1,1,1,0,'STYLE'),
(12,1,11,1,3,0,1,'OTHER'),
(13,2,0,1,1,0,0,'SUBMISSION'),
(14,2,1,1,3,0,1,'RESEARCHINSTRUMENT'),
(15,2,2,1,3,0,1,'RESEARCHMATERIALS'),
(16,2,3,1,3,0,1,'RESEARCHRESULTS'),
(17,2,4,1,3,0,1,'TRANSCRIPTS'),
(18,2,5,1,3,0,1,'DATAANALYSIS'),
(19,2,6,1,3,0,1,'DATASET'),
(20,2,7,1,3,0,1,'SOURCETEXTS'),
(21,2,8,1,1,1,1,'MULTIMEDIA'),
(22,2,9,1,2,1,0,'IMAGE'),
(23,2,10,1,1,1,0,'STYLE'),
(24,2,11,1,3,0,1,'OTHER'),
(25,3,0,1,1,0,0,'SUBMISSION'),
(26,3,1,1,3,0,1,'RESEARCHINSTRUMENT'),
(27,3,2,1,3,0,1,'RESEARCHMATERIALS'),
(28,3,3,1,3,0,1,'RESEARCHRESULTS'),
(29,3,4,1,3,0,1,'TRANSCRIPTS'),
(30,3,5,1,3,0,1,'DATAANALYSIS'),
(31,3,6,1,3,0,1,'DATASET'),
(32,3,7,1,3,0,1,'SOURCETEXTS'),
(33,3,8,1,1,1,1,'MULTIMEDIA'),
(34,3,9,1,2,1,0,'IMAGE'),
(35,3,10,1,1,1,0,'STYLE'),
(36,3,11,1,3,0,1,'OTHER'),
(37,4,0,1,1,0,0,'SUBMISSION'),
(38,4,1,1,3,0,1,'RESEARCHINSTRUMENT'),
(39,4,2,1,3,0,1,'RESEARCHMATERIALS'),
(40,4,3,1,3,0,1,'RESEARCHRESULTS'),
(41,4,4,1,3,0,1,'TRANSCRIPTS'),
(42,4,5,1,3,0,1,'DATAANALYSIS'),
(43,4,6,1,3,0,1,'DATASET'),
(44,4,7,1,3,0,1,'SOURCETEXTS'),
(45,4,8,1,1,1,1,'MULTIMEDIA'),
(46,4,9,1,2,1,0,'IMAGE'),
(47,4,10,1,1,1,0,'STYLE'),
(48,4,11,1,3,0,1,'OTHER'),
(49,5,0,1,1,0,0,'SUBMISSION'),
(50,5,1,1,3,0,1,'RESEARCHINSTRUMENT'),
(51,5,2,1,3,0,1,'RESEARCHMATERIALS'),
(52,5,3,1,3,0,1,'RESEARCHRESULTS'),
(53,5,4,1,3,0,1,'TRANSCRIPTS'),
(54,5,5,1,3,0,1,'DATAANALYSIS'),
(55,5,6,1,3,0,1,'DATASET'),
(56,5,7,1,3,0,1,'SOURCETEXTS'),
(57,5,8,1,1,1,1,'MULTIMEDIA'),
(58,5,9,1,2,1,0,'IMAGE'),
(59,5,10,1,1,1,0,'STYLE'),
(60,5,11,1,3,0,1,'OTHER'),
(61,6,0,1,1,0,0,'SUBMISSION'),
(62,6,1,1,3,0,1,'RESEARCHINSTRUMENT'),
(63,6,2,1,3,0,1,'RESEARCHMATERIALS'),
(64,6,3,1,3,0,1,'RESEARCHRESULTS'),
(65,6,4,1,3,0,1,'TRANSCRIPTS'),
(66,6,5,1,3,0,1,'DATAANALYSIS'),
(67,6,6,1,3,0,1,'DATASET'),
(68,6,7,1,3,0,1,'SOURCETEXTS'),
(69,6,8,1,1,1,1,'MULTIMEDIA'),
(70,6,9,1,2,1,0,'IMAGE'),
(71,6,10,1,1,1,0,'STYLE'),
(72,6,11,1,3,0,1,'OTHER'),
(73,7,0,1,1,0,0,'SUBMISSION'),
(74,7,1,1,3,0,1,'RESEARCHINSTRUMENT'),
(75,7,2,1,3,0,1,'RESEARCHMATERIALS'),
(76,7,3,1,3,0,1,'RESEARCHRESULTS'),
(77,7,4,1,3,0,1,'TRANSCRIPTS'),
(78,7,5,1,3,0,1,'DATAANALYSIS'),
(79,7,6,1,3,0,1,'DATASET'),
(80,7,7,1,3,0,1,'SOURCETEXTS'),
(81,7,8,1,1,1,1,'MULTIMEDIA'),
(82,7,9,1,2,1,0,'IMAGE'),
(83,7,10,1,1,1,0,'STYLE'),
(84,7,11,1,3,0,1,'OTHER'),
(85,8,0,1,1,0,0,'SUBMISSION'),
(86,8,1,1,3,0,1,'RESEARCHINSTRUMENT'),
(87,8,2,1,3,0,1,'RESEARCHMATERIALS'),
(88,8,3,1,3,0,1,'RESEARCHRESULTS'),
(89,8,4,1,3,0,1,'TRANSCRIPTS'),
(90,8,5,1,3,0,1,'DATAANALYSIS'),
(91,8,6,1,3,0,1,'DATASET'),
(92,8,7,1,3,0,1,'SOURCETEXTS'),
(93,8,8,1,1,1,1,'MULTIMEDIA'),
(94,8,9,1,2,1,0,'IMAGE'),
(95,8,10,1,1,1,0,'STYLE'),
(96,8,11,1,3,0,1,'OTHER');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscription_ip`
--

DROP TABLE IF EXISTS `institutional_subscription_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscription_ip`
--

LOCK TABLES `institutional_subscription_ip` WRITE;
/*!40000 ALTER TABLE `institutional_subscription_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscription_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscriptions`
--

DROP TABLE IF EXISTS `institutional_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscriptions`
--

LOCK TABLES `institutional_subscriptions` WRITE;
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_files`
--

LOCK TABLES `issue_files` WRITE;
/*!40000 ALTER TABLE `issue_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galley_settings`
--

DROP TABLE IF EXISTS `issue_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galley_settings`
--

LOCK TABLES `issue_galley_settings` WRITE;
/*!40000 ALTER TABLE `issue_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galleys`
--

DROP TABLE IF EXISTS `issue_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`),
  KEY `issue_galleys_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galleys`
--

LOCK TABLES `issue_galleys` WRITE;
/*!40000 ALTER TABLE `issue_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_settings`
--

DROP TABLE IF EXISTS `issue_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
INSERT INTO `issue_settings` VALUES
(4,'es_ES','description','Número inaugural dedicado al estudio de los sectores productivos, dinámicas territoriales y patrimonio cultural regional.','string'),
(4,'es_ES','title','Vol. 1 Núm. 1 (2025): Fundamentos y Perspectivas del Desarrollo Regional','string'),
(5,'es_ES','description','Edición semestral enfocada en la transformación digital, entornos de aprendizaje virtual y gestión editorial en educación superior.','string'),
(5,'es_ES','title','Vol. 1 Núm. 2 (2025): Innovación Educativa y Tecnologías Emergentes','string'),
(6,'es_ES','description','Número actual de Revista Ceibo con investigaciones sobre ecosistemas tropicales, agroindustria circular y modelos de ciencia abierta.','string'),
(6,'es_ES','title','Vol. 2 Núm. 1 (2026): Sostenibilidad, Biodiversidad y Políticas Editoriales','string'),
(7,'es_ES','description','<p>Número en preparación para las prácticas de maquetación, asignación y publicación de galeradas de los estudiantes del Posgrado en Aplicaciones Informáticas para la Gestión Editorial - UTM.</p>','string'),
(7,'es_ES','title','Vol. 2 Núm. 2 (2026): Tecnologías Emergentes, Inteligencia Artificial y Gestión Editorial','string');
/*!40000 ALTER TABLE `issue_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` smallint(6) NOT NULL DEFAULT 0,
  `current` smallint(6) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` smallint(6) NOT NULL DEFAULT 1,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` smallint(6) NOT NULL DEFAULT 0,
  `show_number` smallint(6) NOT NULL DEFAULT 0,
  `show_year` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 0,
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`),
  KEY `issues_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES
(4,1,1,'1',2025,1,0,'2025-06-30 00:00:00',NULL,NULL,1,NULL,1,1,1,1,NULL,NULL,NULL),
(5,1,1,'2',2025,1,0,'2025-12-15 00:00:00',NULL,NULL,1,NULL,1,1,1,1,NULL,NULL,NULL),
(6,1,2,'1',2026,1,1,'2026-03-15 00:00:00',NULL,NULL,1,NULL,1,1,1,1,NULL,NULL,NULL),
(7,1,2,'2',2026,0,0,NULL,NULL,'2026-10-03 00:31:06',1,NULL,1,1,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_views`
--

DROP TABLE IF EXISTS `item_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_views`
--

LOCK TABLES `item_views` WRITE;
/*!40000 ALTER TABLE `item_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES
(1,'','agencies','request','string'),
(1,'','citations','request','string'),
(1,'','contactEmail','jperez@utm.edu.ec','string'),
(1,'','contactName','Dr. Juan Pérez','string'),
(1,'','copyrightYearBasis','issue',NULL),
(1,'','coverage','enable','string'),
(1,'','defaultReviewMode','2',NULL),
(1,'','disableSubmissions','0',NULL),
(1,'','disciplines','request','string'),
(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost:8080/index.php/revista_ceibo\">Revista Ceibo</a>',NULL),
(1,'','enableOai','1',NULL),
(1,'','itemsPerPage','25',NULL),
(1,'','keywords','request','string'),
(1,'','membershipFee','0',NULL),
(1,'','numPageLinks','10',NULL),
(1,'','numWeeksPerResponse','4',NULL),
(1,'','numWeeksPerReview','4',NULL),
(1,'','publicationFee','0',NULL),
(1,'','purchaseArticleFee','0',NULL),
(1,'','rights','enable','string'),
(1,'','source','enable','string'),
(1,'','supportedFormLocales','[\"es_ES\"]',NULL),
(1,'','supportedLocales','[\"en_US\",\"es_ES\"]',NULL),
(1,'','supportedSubmissionLocales','[\"es_ES\"]',NULL),
(1,'','supportEmail','soporte.editorial@utm.edu.ec','string'),
(1,'','supportName','Soporte Técnico Editorial - UTM','string'),
(1,'','themePluginPath','default',NULL),
(1,'','type','enable','string'),
(1,'en_US','acronym',NULL,NULL),
(1,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/index.php/index/login\">log in</a> and begin the five-step process.',NULL),
(1,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),
(1,'en_US','description','Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.',NULL),
(1,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(1,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),
(1,'en_US','name','Ceibo Journal',NULL),
(1,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),
(1,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),
(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),
(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),
(1,'es_ES','about','<div class=\"journal-about-content\">\n<h3>Presentación</h3>\n<p>La <strong>Revista Ceibo</strong> es una publicación científica multidisciplinaria arbitrada de acceso abierto diamante, editada por la Universidad Técnica de Manabí (Portoviejo, Ecuador). Su periodicidad es semestral y su misión primordial es difundir contribuciones científicas inéditas y originales que aporten a la solución de problemáticas regionales y globales en el marco del desarrollo sostenible.</p>\n\n<h3>Enfoque y Alcance</h3>\n<p>La revista recibe manuscritos en las siguientes áreas de conocimiento:</p>\n<ul>\n  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo agroecológico, conservación del bosque seco tropical, biodiversidad, gestión de cuencas hidrográficas y resiliencia climática.</li>\n  <li><strong>Educación, Humanidades y Tecnologías del Aprendizaje:</strong> Innovación pedagógica, competencias digitales docentes, entornos virtuales y preservación de la memoria cultural.</li>\n  <li><strong>Ingeniería, Energía y Desarrollo Territorial:</strong> Tecnologías de la información, modelado ambiental, bioeconomía y cadenas de valor agroindustriales.</li>\n</ul>\n\n<h3>Proceso de Evaluación por Pares (Peer Review)</h3>\n<p>Todos los artículos postulados son sometidos a un riguroso proceso de revisión bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>, asegurando el anonimato estricto tanto de autores como de evaluadores:</p>\n<ol>\n  <li><strong>Filtro editorial preliminar:</strong> El Comité Editorial verifica la afinidad temática, originalidad, formato IMRyD y porcentaje de similitud mediante software antiplagio (máximo 10% de coincidencia excluida bibliografía). Plazo: 7 a 10 días.</li>\n  <li><strong>Ronda 1 de evaluación:</strong> El manuscrito es remitido a mínimo dos especialistas externos (pares ciegos), quienes valoran originalidad, rigor metodológico y pertinencia mediante un formulario estructurado de evaluación cuantitativa y cualitativa. Plazo: 4 a 6 semanas.</li>\n  <li><strong>Ronda 2 de revisión:</strong> En caso de que se soliciten modificaciones mayores o menores, el autor dispone de 15 a 30 días para remitir la versión corregida junto a una carta de respuesta punto por punto. El evaluador valida la incorporación de las sugerencias antes del dictamen final.</li>\n  <li><strong>Dictamen final:</strong> Las decisiones posibles son: Aceptar envío, Publicable con modificaciones, Reenviar para revisión (Ronda 2) o Rechazar. El Editor en Jefe emite la resolución motivada.</li>\n</ol>\n\n<h3>Política sobre el Uso de Inteligencia Artificial (IA) en la Publicación</h3>\n<p>En concordancia con las directrices del Committee on Publication Ethics (COPE) y la World Association of Medical Editors (WAME), la Revista Ceibo establece las siguientes normas respecto a la Inteligencia Artificial generativa y Modelos de Lenguaje de Gran Escala (LLMs):</p>\n<ul>\n  <li><strong>Autoría y responsabilidad:</strong> Las herramientas de IA no cumplen los requisitos de autoría, pues no pueden asumir responsabilidad legal, ética ni intelectual por los contenidos. Por ende, la IA no puede figurar como autor ni coautor de ningún envío. Toda la responsabilidad recae en los autores humanos.</li>\n  <li><strong>Declaración de uso:</strong> Los autores deben declarar de forma explícita y transparente en la sección de Metodología o en los Agradecimientos el empleo de herramientas de IA (nombre del software, versión y propósito específico, por ejemplo: corrección estilística, traducción, análisis de código o síntesis preliminar).</li>\n  <li><strong>Confidencialidad en la evaluación por pares:</strong> Los revisores y editores tienen estrictamente prohibido cargar manuscritos inéditos, datos no publicados o comentarios editoriales en plataformas públicas de IA generativa, ya que esto vulnera los acuerdos de confidencialidad y los derechos de propiedad intelectual de los autores.</li>\n  <li><strong>Detección de similitud y texto generado por IA:</strong> La revista aplica herramientas automatizadas de control de originalidad (Turnitin / iThenticate). No obstante, los informes de detección de IA se interpretan como indicios orientativos sujetos a revisión crítica humana, reconociendo las limitaciones de los modelos de detección y evitando falsos positivos.</li>\n</ul>\n\n<h3>Política de Acceso Abierto Diamante</h3>\n<p>La Revista Ceibo suscribe los principios de la Iniciativa de Acceso Abierto de Budapest (BOAI). Todo el contenido publicado se distribuye de forma inmediata y gratuita, sin periodo de embargo ni cobro de tarifas por procesamiento de artículos (APC - Article Processing Charges) o por envío (Submission Charges). El financiamiento institucional integral corre a cargo de la Universidad Técnica de Manabí.</p>\n<p>Los artículos se publican bajo licencia internacional <strong>Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)</strong>.</p>\n\n<h3>Preservación Digital e Interoperabilidad</h3>\n<p>Esta revista garantiza la preservación permanente y la máxima difusión de sus contenidos científicos mediante:</p>\n<ul>\n  <li><strong>Protocolo de interoperabilidad OAI-PMH:</strong> Exposición abierta de metadatos bajo el estándar Dublin Core en el punto de acceso público de la revista.</li>\n  <li><strong>Preservación digital:</strong> Integración en PKP Preservation Network (PKP PN), además de esquemas de archivado distribuido LOCKSS y CLOCKSS.</li>\n  <li><strong>Identificadores persistentes y citación:</strong> Compatibilidad con esquemas DOI, identificadores ORCID de autores y generación automatizada de formatos de citación bibliográfica normalizada (APA, Chicago, Harvard).</li>\n</ul>\n</div>','string'),
(1,'es_ES','acronym','RC',NULL),
(1,'es_ES','authorGuidelines','<h3>Directrices para Autores</h3><p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p><ul><li><strong>Estructura:</strong> Esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li><li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias.</li><li><strong>Resumen y palabras clave:</strong> Hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li><li><strong>Citas y referencias:</strong> Aplicación de normas APA (7ma edición) con DOI activo en todas las fuentes digitales.</li></ul>','string'),
(1,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost:8080/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.',NULL),
(1,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>',NULL),
(1,'es_ES','competingInterests','<p>Los autores, revisores y editores deben declarar explícitamente cualquier conflicto de intereses potencial que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>','string'),
(1,'es_ES','contactAffiliation','Universidad Técnica de Manabí','string'),
(1,'es_ES','contactTitle','Director / Editor en Jefe y Gestor de Revista','string'),
(1,'es_ES','description','Revista multidisciplinaria de investigación científica, educación y desarrollo regional de la Universidad Técnica de Manabí.',NULL),
(1,'es_ES','editorialTeam','<h3>Equipo Editorial</h3><p><strong>Director / Editor en Jefe y Gestor de Revista:</strong> Dr. Juan Pérez (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editora de Sección - Ciencias Agrarias y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor de Sección - Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p><hr><h3>Comité Científico Internacional</h3><ul><li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li><li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li><li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li><li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li><li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li><li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li></ul>','string'),
(1,'es_ES','focusScope','<p>La Revista Ceibo recibe contribuciones científicas en las siguientes áreas temáticas:</p><ul><li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales y mitigación de cambio climático.</li><li><strong>Educación, Pedagogía e Innovación Curricular:</strong> Mediación tecnológica, inclusión educativa y gestión de la calidad en educación superior.</li><li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y gestión editorial.</li></ul>','string'),
(1,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(1,'es_ES','licenseTerms','<p>La Revista Ceibo publica todos sus contenidos bajo licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. No aplica cargos por procesamiento de artículos (APC) ni por postulación.</p>','string'),
(1,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>',NULL),
(1,'es_ES','name','Revista Ceibo',NULL),
(1,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.',NULL),
(1,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>',NULL),
(1,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.',NULL),
(1,'es_ES','reviewGuidelines','<h3>Guía para Evaluadores/as por Pares</h3><p>La evaluación se realiza mediante formulario estructurado valorando:</p><ul><li>Originalidad y aporte al conocimiento</li><li>Rigor del diseño metodológico y reproducibilidad</li><li>Claridad en la presentación de resultados y validez de las conclusiones</li><li>Cumplimiento de estándares éticos y citación adecuada</li></ul>','string'),
(1,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor\\/a).\"},{\"order\":2,\"content\":\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\"},{\"order\":3,\"content\":\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\"},{\"order\":4,\"content\":\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\\\"http:\\/\\/localhost:8080\\/index.php\\/revista_ceibo\\/about\\/submissions#authorGuidelines\\\" target=\\\"_new\\\">Directrices del autor\\/a<\\/a>, que aparecen en Acerca de la revista.\"}]',NULL),
(2,'','agencies','request','string'),
(2,'','citations','request','string'),
(2,'','contactEmail','jperez@utm.edu.ec','string'),
(2,'','contactName','Dr. Juan Pérez','string'),
(2,'','copyrightYearBasis','issue',NULL),
(2,'','coverage','enable','string'),
(2,'','defaultReviewMode','2',NULL),
(2,'','disableSubmissions','0',NULL),
(2,'','disciplines','request','string'),
(2,'','emailSignature','<p>Cordialmente,<br /><strong>Equipo Editorial - Revista de Ciencias Agropecuarias y Ambientales</strong><br />Universidad Técnica de Manabí</p>','string'),
(2,'','enableOai','1',NULL),
(2,'','itemsPerPage','25',NULL),
(2,'','keywords','request','string'),
(2,'','membershipFee','0',NULL),
(2,'','numPageLinks','10',NULL),
(2,'','numWeeksPerResponse','4',NULL),
(2,'','numWeeksPerReview','4',NULL),
(2,'','publicationFee','0',NULL),
(2,'','purchaseArticleFee','0',NULL),
(2,'','rights','enable','string'),
(2,'','source','enable','string'),
(2,'','supportedFormLocales','[\"es_ES\"]',NULL),
(2,'','supportedLocales','[\"en_US\",\"es_ES\"]',NULL),
(2,'','supportedSubmissionLocales','[\"es_ES\"]',NULL),
(2,'','supportEmail','soporte.editorial@utm.edu.ec','string'),
(2,'','supportName','Soporte Técnico Editorial - UTM','string'),
(2,'','themePluginPath','default',NULL),
(2,'','type','enable','string'),
(2,'en_US','acronym',NULL,NULL),
(2,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/index.php/index/login\">log in</a> and begin the five-step process.',NULL),
(2,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),
(2,'en_US','description','Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.',NULL),
(2,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(2,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),
(2,'en_US','name','Ceibo Journal',NULL),
(2,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),
(2,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),
(2,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),
(2,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),
(2,'es_ES','about','<div class=\"journal-about-content\">\n<h3>Presentación</h3>\n<p>La <strong>Revista Ceibo</strong> es una publicación científica multidisciplinaria arbitrada de acceso abierto diamante, editada por la Universidad Técnica de Manabí (Portoviejo, Ecuador). Su periodicidad es semestral y su misión primordial es difundir contribuciones científicas inéditas y originales que aporten a la solución de problemáticas regionales y globales en el marco del desarrollo sostenible.</p>\n\n<h3>Enfoque y Alcance</h3>\n<p>La revista recibe manuscritos en las siguientes áreas de conocimiento:</p>\n<ul>\n  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo agroecológico, conservación del bosque seco tropical, biodiversidad, gestión de cuencas hidrográficas y resiliencia climática.</li>\n  <li><strong>Educación, Humanidades y Tecnologías del Aprendizaje:</strong> Innovación pedagógica, competencias digitales docentes, entornos virtuales y preservación de la memoria cultural.</li>\n  <li><strong>Ingeniería, Energía y Desarrollo Territorial:</strong> Tecnologías de la información, modelado ambiental, bioeconomía y cadenas de valor agroindustriales.</li>\n</ul>\n\n<h3>Proceso de Evaluación por Pares (Peer Review)</h3>\n<p>Todos los artículos postulados son sometidos a un riguroso proceso de revisión bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>, asegurando el anonimato estricto tanto de autores como de evaluadores:</p>\n<ol>\n  <li><strong>Filtro editorial preliminar:</strong> El Comité Editorial verifica la afinidad temática, originalidad, formato IMRyD y porcentaje de similitud mediante software antiplagio (máximo 10% de coincidencia excluida bibliografía). Plazo: 7 a 10 días.</li>\n  <li><strong>Ronda 1 de evaluación:</strong> El manuscrito es remitido a mínimo dos especialistas externos (pares ciegos), quienes valoran originalidad, rigor metodológico y pertinencia mediante un formulario estructurado de evaluación cuantitativa y cualitativa. Plazo: 4 a 6 semanas.</li>\n  <li><strong>Ronda 2 de revisión:</strong> En caso de que se soliciten modificaciones mayores o menores, el autor dispone de 15 a 30 días para remitir la versión corregida junto a una carta de respuesta punto por punto. El evaluador valida la incorporación de las sugerencias antes del dictamen final.</li>\n  <li><strong>Dictamen final:</strong> Las decisiones posibles son: Aceptar envío, Publicable con modificaciones, Reenviar para revisión (Ronda 2) o Rechazar. El Editor en Jefe emite la resolución motivada.</li>\n</ol>\n\n<h3>Política sobre el Uso de Inteligencia Artificial (IA) en la Publicación</h3>\n<p>En concordancia con las directrices del Committee on Publication Ethics (COPE) y la World Association of Medical Editors (WAME), la Revista Ceibo establece las siguientes normas respecto a la Inteligencia Artificial generativa y Modelos de Lenguaje de Gran Escala (LLMs):</p>\n<ul>\n  <li><strong>Autoría y responsabilidad:</strong> Las herramientas de IA no cumplen los requisitos de autoría, pues no pueden asumir responsabilidad legal, ética ni intelectual por los contenidos. Por ende, la IA no puede figurar como autor ni coautor de ningún envío. Toda la responsabilidad recae en los autores humanos.</li>\n  <li><strong>Declaración de uso:</strong> Los autores deben declarar de forma explícita y transparente en la sección de Metodología o en los Agradecimientos el empleo de herramientas de IA (nombre del software, versión y propósito específico, por ejemplo: corrección estilística, traducción, análisis de código o síntesis preliminar).</li>\n  <li><strong>Confidencialidad en la evaluación por pares:</strong> Los revisores y editores tienen estrictamente prohibido cargar manuscritos inéditos, datos no publicados o comentarios editoriales en plataformas públicas de IA generativa, ya que esto vulnera los acuerdos de confidencialidad y los derechos de propiedad intelectual de los autores.</li>\n  <li><strong>Detección de similitud y texto generado por IA:</strong> La revista aplica herramientas automatizadas de control de originalidad (Turnitin / iThenticate). No obstante, los informes de detección de IA se interpretan como indicios orientativos sujetos a revisión crítica humana, reconociendo las limitaciones de los modelos de detección y evitando falsos positivos.</li>\n</ul>\n\n<h3>Política de Acceso Abierto Diamante</h3>\n<p>La Revista Ceibo suscribe los principios de la Iniciativa de Acceso Abierto de Budapest (BOAI). Todo el contenido publicado se distribuye de forma inmediata y gratuita, sin periodo de embargo ni cobro de tarifas por procesamiento de artículos (APC - Article Processing Charges) o por envío (Submission Charges). El financiamiento institucional integral corre a cargo de la Universidad Técnica de Manabí.</p>\n<p>Los artículos se publican bajo licencia internacional <strong>Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)</strong>.</p>\n\n<h3>Preservación Digital e Interoperabilidad</h3>\n<p>Esta revista garantiza la preservación permanente y la máxima difusión de sus contenidos científicos mediante:</p>\n<ul>\n  <li><strong>Protocolo de interoperabilidad OAI-PMH:</strong> Exposición abierta de metadatos bajo el estándar Dublin Core en el punto de acceso público de la revista.</li>\n  <li><strong>Preservación digital:</strong> Integración en PKP Preservation Network (PKP PN), además de esquemas de archivado distribuido LOCKSS y CLOCKSS.</li>\n  <li><strong>Identificadores persistentes y citación:</strong> Compatibilidad con esquemas DOI, identificadores ORCID de autores y generación automatizada de formatos de citación bibliográfica normalizada (APA, Chicago, Harvard).</li>\n</ul>\n</div>','string'),
(2,'es_ES','acronym','RCAA','string'),
(2,'es_ES','authorGuidelines','<h3>Directrices para Autores</h3><p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p><ul><li><strong>Estructura:</strong> Esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li><li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias.</li><li><strong>Resumen y palabras clave:</strong> Hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li><li><strong>Citas y referencias:</strong> Aplicación de normas APA (7ma edición) con DOI activo en todas las fuentes digitales.</li></ul>','string'),
(2,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost:8080/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.',NULL),
(2,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>',NULL),
(2,'es_ES','competingInterests','<p>Los autores, revisores y editores deben declarar explícitamente cualquier conflicto de intereses potencial que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>','string'),
(2,'es_ES','contactAffiliation','Universidad Técnica de Manabí','string'),
(2,'es_ES','contactEmail','estudiante2@utm.edu.ec','string'),
(2,'es_ES','contactName','Estudiante 2','string'),
(2,'es_ES','contactTitle','Director / Editor en Jefe y Gestor de Revista','string'),
(2,'es_ES','description','Publicación científica dedicada a la investigación en agronomía, zootecnia, medicina veterinaria, agroindustria y sostenibilidad ambiental.','string'),
(2,'es_ES','editorialTeam','<h3>Equipo Editorial</h3><p><strong>Director / Editor en Jefe y Gestor de Revista:</strong> Dr. Juan Pérez (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editora de Sección - Ciencias Agrarias y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor de Sección - Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p><hr><h3>Comité Científico Internacional</h3><ul><li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li><li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li><li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li><li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li><li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li><li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li></ul>','string'),
(2,'es_ES','focusScope','<p>La Revista Ceibo recibe contribuciones científicas en las siguientes áreas temáticas:</p><ul><li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales y mitigación de cambio climático.</li><li><strong>Educación, Pedagogía e Innovación Curricular:</strong> Mediación tecnológica, inclusión educativa y gestión de la calidad en educación superior.</li><li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y gestión editorial.</li></ul>','string'),
(2,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(2,'es_ES','licenseTerms','<p>La Revista Ceibo publica todos sus contenidos bajo licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. No aplica cargos por procesamiento de artículos (APC) ni por postulación.</p>','string'),
(2,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>',NULL),
(2,'es_ES','name','Revista de Ciencias Agropecuarias y Ambientales','string'),
(2,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.',NULL),
(2,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>',NULL),
(2,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.',NULL),
(2,'es_ES','reviewGuidelines','<h3>Guía para Evaluadores/as por Pares</h3><p>La evaluación se realiza mediante formulario estructurado valorando:</p><ul><li>Originalidad y aporte al conocimiento</li><li>Rigor del diseño metodológico y reproducibilidad</li><li>Claridad en la presentación de resultados y validez de las conclusiones</li><li>Cumplimiento de estándares éticos y citación adecuada</li></ul>','string'),
(2,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor\\/a).\"},{\"order\":2,\"content\":\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\"},{\"order\":3,\"content\":\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\"},{\"order\":4,\"content\":\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\\\"http:\\/\\/localhost:8080\\/index.php\\/revista_ceibo\\/about\\/submissions#authorGuidelines\\\" target=\\\"_new\\\">Directrices del autor\\/a<\\/a>, que aparecen en Acerca de la revista.\"}]',NULL),
(2,'es_ES','supportEmail','soporte.editorial@utm.edu.ec','string'),
(2,'es_ES','supportName','Soporte Técnico Editorial UTM','string'),
(3,'','agencies','request','string'),
(3,'','citations','request','string'),
(3,'','contactEmail','jperez@utm.edu.ec','string'),
(3,'','contactName','Dr. Juan Pérez','string'),
(3,'','copyrightYearBasis','issue',NULL),
(3,'','coverage','enable','string'),
(3,'','defaultReviewMode','2',NULL),
(3,'','disableSubmissions','0',NULL),
(3,'','disciplines','request','string'),
(3,'','emailSignature','<p>Cordialmente,<br /><strong>Equipo Editorial - Revista de Educación, Sociedad y Tecnología</strong><br />Universidad Técnica de Manabí</p>','string'),
(3,'','enableOai','1',NULL),
(3,'','itemsPerPage','25',NULL),
(3,'','keywords','request','string'),
(3,'','membershipFee','0',NULL),
(3,'','numPageLinks','10',NULL),
(3,'','numWeeksPerResponse','4',NULL),
(3,'','numWeeksPerReview','4',NULL),
(3,'','publicationFee','0',NULL),
(3,'','purchaseArticleFee','0',NULL),
(3,'','rights','enable','string'),
(3,'','source','enable','string'),
(3,'','supportedFormLocales','[\"es_ES\"]',NULL),
(3,'','supportedLocales','[\"en_US\",\"es_ES\"]',NULL),
(3,'','supportedSubmissionLocales','[\"es_ES\"]',NULL),
(3,'','supportEmail','soporte.editorial@utm.edu.ec','string'),
(3,'','supportName','Soporte Técnico Editorial - UTM','string'),
(3,'','themePluginPath','default',NULL),
(3,'','type','enable','string'),
(3,'en_US','acronym',NULL,NULL),
(3,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/index.php/index/login\">log in</a> and begin the five-step process.',NULL),
(3,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),
(3,'en_US','description','Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.',NULL),
(3,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(3,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),
(3,'en_US','name','Ceibo Journal',NULL),
(3,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),
(3,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),
(3,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),
(3,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),
(3,'es_ES','about','<div class=\"journal-about-content\">\n<h3>Presentación</h3>\n<p>La <strong>Revista Ceibo</strong> es una publicación científica multidisciplinaria arbitrada de acceso abierto diamante, editada por la Universidad Técnica de Manabí (Portoviejo, Ecuador). Su periodicidad es semestral y su misión primordial es difundir contribuciones científicas inéditas y originales que aporten a la solución de problemáticas regionales y globales en el marco del desarrollo sostenible.</p>\n\n<h3>Enfoque y Alcance</h3>\n<p>La revista recibe manuscritos en las siguientes áreas de conocimiento:</p>\n<ul>\n  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo agroecológico, conservación del bosque seco tropical, biodiversidad, gestión de cuencas hidrográficas y resiliencia climática.</li>\n  <li><strong>Educación, Humanidades y Tecnologías del Aprendizaje:</strong> Innovación pedagógica, competencias digitales docentes, entornos virtuales y preservación de la memoria cultural.</li>\n  <li><strong>Ingeniería, Energía y Desarrollo Territorial:</strong> Tecnologías de la información, modelado ambiental, bioeconomía y cadenas de valor agroindustriales.</li>\n</ul>\n\n<h3>Proceso de Evaluación por Pares (Peer Review)</h3>\n<p>Todos los artículos postulados son sometidos a un riguroso proceso de revisión bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>, asegurando el anonimato estricto tanto de autores como de evaluadores:</p>\n<ol>\n  <li><strong>Filtro editorial preliminar:</strong> El Comité Editorial verifica la afinidad temática, originalidad, formato IMRyD y porcentaje de similitud mediante software antiplagio (máximo 10% de coincidencia excluida bibliografía). Plazo: 7 a 10 días.</li>\n  <li><strong>Ronda 1 de evaluación:</strong> El manuscrito es remitido a mínimo dos especialistas externos (pares ciegos), quienes valoran originalidad, rigor metodológico y pertinencia mediante un formulario estructurado de evaluación cuantitativa y cualitativa. Plazo: 4 a 6 semanas.</li>\n  <li><strong>Ronda 2 de revisión:</strong> En caso de que se soliciten modificaciones mayores o menores, el autor dispone de 15 a 30 días para remitir la versión corregida junto a una carta de respuesta punto por punto. El evaluador valida la incorporación de las sugerencias antes del dictamen final.</li>\n  <li><strong>Dictamen final:</strong> Las decisiones posibles son: Aceptar envío, Publicable con modificaciones, Reenviar para revisión (Ronda 2) o Rechazar. El Editor en Jefe emite la resolución motivada.</li>\n</ol>\n\n<h3>Política sobre el Uso de Inteligencia Artificial (IA) en la Publicación</h3>\n<p>En concordancia con las directrices del Committee on Publication Ethics (COPE) y la World Association of Medical Editors (WAME), la Revista Ceibo establece las siguientes normas respecto a la Inteligencia Artificial generativa y Modelos de Lenguaje de Gran Escala (LLMs):</p>\n<ul>\n  <li><strong>Autoría y responsabilidad:</strong> Las herramientas de IA no cumplen los requisitos de autoría, pues no pueden asumir responsabilidad legal, ética ni intelectual por los contenidos. Por ende, la IA no puede figurar como autor ni coautor de ningún envío. Toda la responsabilidad recae en los autores humanos.</li>\n  <li><strong>Declaración de uso:</strong> Los autores deben declarar de forma explícita y transparente en la sección de Metodología o en los Agradecimientos el empleo de herramientas de IA (nombre del software, versión y propósito específico, por ejemplo: corrección estilística, traducción, análisis de código o síntesis preliminar).</li>\n  <li><strong>Confidencialidad en la evaluación por pares:</strong> Los revisores y editores tienen estrictamente prohibido cargar manuscritos inéditos, datos no publicados o comentarios editoriales en plataformas públicas de IA generativa, ya que esto vulnera los acuerdos de confidencialidad y los derechos de propiedad intelectual de los autores.</li>\n  <li><strong>Detección de similitud y texto generado por IA:</strong> La revista aplica herramientas automatizadas de control de originalidad (Turnitin / iThenticate). No obstante, los informes de detección de IA se interpretan como indicios orientativos sujetos a revisión crítica humana, reconociendo las limitaciones de los modelos de detección y evitando falsos positivos.</li>\n</ul>\n\n<h3>Política de Acceso Abierto Diamante</h3>\n<p>La Revista Ceibo suscribe los principios de la Iniciativa de Acceso Abierto de Budapest (BOAI). Todo el contenido publicado se distribuye de forma inmediata y gratuita, sin periodo de embargo ni cobro de tarifas por procesamiento de artículos (APC - Article Processing Charges) o por envío (Submission Charges). El financiamiento institucional integral corre a cargo de la Universidad Técnica de Manabí.</p>\n<p>Los artículos se publican bajo licencia internacional <strong>Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)</strong>.</p>\n\n<h3>Preservación Digital e Interoperabilidad</h3>\n<p>Esta revista garantiza la preservación permanente y la máxima difusión de sus contenidos científicos mediante:</p>\n<ul>\n  <li><strong>Protocolo de interoperabilidad OAI-PMH:</strong> Exposición abierta de metadatos bajo el estándar Dublin Core en el punto de acceso público de la revista.</li>\n  <li><strong>Preservación digital:</strong> Integración en PKP Preservation Network (PKP PN), además de esquemas de archivado distribuido LOCKSS y CLOCKSS.</li>\n  <li><strong>Identificadores persistentes y citación:</strong> Compatibilidad con esquemas DOI, identificadores ORCID de autores y generación automatizada de formatos de citación bibliográfica normalizada (APA, Chicago, Harvard).</li>\n</ul>\n</div>','string'),
(3,'es_ES','acronym','REST','string'),
(3,'es_ES','authorGuidelines','<h3>Directrices para Autores</h3><p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p><ul><li><strong>Estructura:</strong> Esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li><li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias.</li><li><strong>Resumen y palabras clave:</strong> Hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li><li><strong>Citas y referencias:</strong> Aplicación de normas APA (7ma edición) con DOI activo en todas las fuentes digitales.</li></ul>','string'),
(3,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost:8080/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.',NULL),
(3,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>',NULL),
(3,'es_ES','competingInterests','<p>Los autores, revisores y editores deben declarar explícitamente cualquier conflicto de intereses potencial que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>','string'),
(3,'es_ES','contactAffiliation','Universidad Técnica de Manabí','string'),
(3,'es_ES','contactEmail','estudiante3@utm.edu.ec','string'),
(3,'es_ES','contactName','Estudiante 3','string'),
(3,'es_ES','contactTitle','Director / Editor en Jefe y Gestor de Revista','string'),
(3,'es_ES','description','Espacio de difusión académica para la investigación pedagógica, innovación en el aula, gestión del conocimiento y tecnologías educativas.','string'),
(3,'es_ES','editorialTeam','<h3>Equipo Editorial</h3><p><strong>Director / Editor en Jefe y Gestor de Revista:</strong> Dr. Juan Pérez (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editora de Sección - Ciencias Agrarias y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor de Sección - Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p><hr><h3>Comité Científico Internacional</h3><ul><li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li><li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li><li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li><li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li><li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li><li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li></ul>','string'),
(3,'es_ES','focusScope','<p>La Revista Ceibo recibe contribuciones científicas en las siguientes áreas temáticas:</p><ul><li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales y mitigación de cambio climático.</li><li><strong>Educación, Pedagogía e Innovación Curricular:</strong> Mediación tecnológica, inclusión educativa y gestión de la calidad en educación superior.</li><li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y gestión editorial.</li></ul>','string'),
(3,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(3,'es_ES','licenseTerms','<p>La Revista Ceibo publica todos sus contenidos bajo licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. No aplica cargos por procesamiento de artículos (APC) ni por postulación.</p>','string'),
(3,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>',NULL),
(3,'es_ES','name','Revista de Educación, Sociedad y Tecnología','string'),
(3,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.',NULL),
(3,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>',NULL),
(3,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.',NULL),
(3,'es_ES','reviewGuidelines','<h3>Guía para Evaluadores/as por Pares</h3><p>La evaluación se realiza mediante formulario estructurado valorando:</p><ul><li>Originalidad y aporte al conocimiento</li><li>Rigor del diseño metodológico y reproducibilidad</li><li>Claridad en la presentación de resultados y validez de las conclusiones</li><li>Cumplimiento de estándares éticos y citación adecuada</li></ul>','string'),
(3,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor\\/a).\"},{\"order\":2,\"content\":\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\"},{\"order\":3,\"content\":\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\"},{\"order\":4,\"content\":\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\\\"http:\\/\\/localhost:8080\\/index.php\\/revista_ceibo\\/about\\/submissions#authorGuidelines\\\" target=\\\"_new\\\">Directrices del autor\\/a<\\/a>, que aparecen en Acerca de la revista.\"}]',NULL),
(3,'es_ES','supportEmail','soporte.editorial@utm.edu.ec','string'),
(3,'es_ES','supportName','Soporte Técnico Editorial UTM','string'),
(4,'','agencies','request','string'),
(4,'','citations','request','string'),
(4,'','contactEmail','jperez@utm.edu.ec','string'),
(4,'','contactName','Dr. Juan Pérez','string'),
(4,'','copyrightYearBasis','issue',NULL),
(4,'','coverage','enable','string'),
(4,'','defaultReviewMode','2',NULL),
(4,'','disableSubmissions','0',NULL),
(4,'','disciplines','request','string'),
(4,'','emailSignature','<p>Cordialmente,<br /><strong>Equipo Editorial - Revista de Ciencias de la Salud y Biomédicas</strong><br />Universidad Técnica de Manabí</p>','string'),
(4,'','enableOai','1',NULL),
(4,'','itemsPerPage','25',NULL),
(4,'','keywords','request','string'),
(4,'','membershipFee','0',NULL),
(4,'','numPageLinks','10',NULL),
(4,'','numWeeksPerResponse','4',NULL),
(4,'','numWeeksPerReview','4',NULL),
(4,'','publicationFee','0',NULL),
(4,'','purchaseArticleFee','0',NULL),
(4,'','rights','enable','string'),
(4,'','source','enable','string'),
(4,'','supportedFormLocales','[\"es_ES\"]',NULL),
(4,'','supportedLocales','[\"en_US\",\"es_ES\"]',NULL),
(4,'','supportedSubmissionLocales','[\"es_ES\"]',NULL),
(4,'','supportEmail','soporte.editorial@utm.edu.ec','string'),
(4,'','supportName','Soporte Técnico Editorial - UTM','string'),
(4,'','themePluginPath','default',NULL),
(4,'','type','enable','string'),
(4,'en_US','acronym',NULL,NULL),
(4,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/index.php/index/login\">log in</a> and begin the five-step process.',NULL),
(4,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),
(4,'en_US','description','Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.',NULL),
(4,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(4,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),
(4,'en_US','name','Ceibo Journal',NULL),
(4,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),
(4,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),
(4,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),
(4,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),
(4,'es_ES','about','<div class=\"journal-about-content\">\n<h3>Presentación</h3>\n<p>La <strong>Revista Ceibo</strong> es una publicación científica multidisciplinaria arbitrada de acceso abierto diamante, editada por la Universidad Técnica de Manabí (Portoviejo, Ecuador). Su periodicidad es semestral y su misión primordial es difundir contribuciones científicas inéditas y originales que aporten a la solución de problemáticas regionales y globales en el marco del desarrollo sostenible.</p>\n\n<h3>Enfoque y Alcance</h3>\n<p>La revista recibe manuscritos en las siguientes áreas de conocimiento:</p>\n<ul>\n  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo agroecológico, conservación del bosque seco tropical, biodiversidad, gestión de cuencas hidrográficas y resiliencia climática.</li>\n  <li><strong>Educación, Humanidades y Tecnologías del Aprendizaje:</strong> Innovación pedagógica, competencias digitales docentes, entornos virtuales y preservación de la memoria cultural.</li>\n  <li><strong>Ingeniería, Energía y Desarrollo Territorial:</strong> Tecnologías de la información, modelado ambiental, bioeconomía y cadenas de valor agroindustriales.</li>\n</ul>\n\n<h3>Proceso de Evaluación por Pares (Peer Review)</h3>\n<p>Todos los artículos postulados son sometidos a un riguroso proceso de revisión bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>, asegurando el anonimato estricto tanto de autores como de evaluadores:</p>\n<ol>\n  <li><strong>Filtro editorial preliminar:</strong> El Comité Editorial verifica la afinidad temática, originalidad, formato IMRyD y porcentaje de similitud mediante software antiplagio (máximo 10% de coincidencia excluida bibliografía). Plazo: 7 a 10 días.</li>\n  <li><strong>Ronda 1 de evaluación:</strong> El manuscrito es remitido a mínimo dos especialistas externos (pares ciegos), quienes valoran originalidad, rigor metodológico y pertinencia mediante un formulario estructurado de evaluación cuantitativa y cualitativa. Plazo: 4 a 6 semanas.</li>\n  <li><strong>Ronda 2 de revisión:</strong> En caso de que se soliciten modificaciones mayores o menores, el autor dispone de 15 a 30 días para remitir la versión corregida junto a una carta de respuesta punto por punto. El evaluador valida la incorporación de las sugerencias antes del dictamen final.</li>\n  <li><strong>Dictamen final:</strong> Las decisiones posibles son: Aceptar envío, Publicable con modificaciones, Reenviar para revisión (Ronda 2) o Rechazar. El Editor en Jefe emite la resolución motivada.</li>\n</ol>\n\n<h3>Política sobre el Uso de Inteligencia Artificial (IA) en la Publicación</h3>\n<p>En concordancia con las directrices del Committee on Publication Ethics (COPE) y la World Association of Medical Editors (WAME), la Revista Ceibo establece las siguientes normas respecto a la Inteligencia Artificial generativa y Modelos de Lenguaje de Gran Escala (LLMs):</p>\n<ul>\n  <li><strong>Autoría y responsabilidad:</strong> Las herramientas de IA no cumplen los requisitos de autoría, pues no pueden asumir responsabilidad legal, ética ni intelectual por los contenidos. Por ende, la IA no puede figurar como autor ni coautor de ningún envío. Toda la responsabilidad recae en los autores humanos.</li>\n  <li><strong>Declaración de uso:</strong> Los autores deben declarar de forma explícita y transparente en la sección de Metodología o en los Agradecimientos el empleo de herramientas de IA (nombre del software, versión y propósito específico, por ejemplo: corrección estilística, traducción, análisis de código o síntesis preliminar).</li>\n  <li><strong>Confidencialidad en la evaluación por pares:</strong> Los revisores y editores tienen estrictamente prohibido cargar manuscritos inéditos, datos no publicados o comentarios editoriales en plataformas públicas de IA generativa, ya que esto vulnera los acuerdos de confidencialidad y los derechos de propiedad intelectual de los autores.</li>\n  <li><strong>Detección de similitud y texto generado por IA:</strong> La revista aplica herramientas automatizadas de control de originalidad (Turnitin / iThenticate). No obstante, los informes de detección de IA se interpretan como indicios orientativos sujetos a revisión crítica humana, reconociendo las limitaciones de los modelos de detección y evitando falsos positivos.</li>\n</ul>\n\n<h3>Política de Acceso Abierto Diamante</h3>\n<p>La Revista Ceibo suscribe los principios de la Iniciativa de Acceso Abierto de Budapest (BOAI). Todo el contenido publicado se distribuye de forma inmediata y gratuita, sin periodo de embargo ni cobro de tarifas por procesamiento de artículos (APC - Article Processing Charges) o por envío (Submission Charges). El financiamiento institucional integral corre a cargo de la Universidad Técnica de Manabí.</p>\n<p>Los artículos se publican bajo licencia internacional <strong>Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)</strong>.</p>\n\n<h3>Preservación Digital e Interoperabilidad</h3>\n<p>Esta revista garantiza la preservación permanente y la máxima difusión de sus contenidos científicos mediante:</p>\n<ul>\n  <li><strong>Protocolo de interoperabilidad OAI-PMH:</strong> Exposición abierta de metadatos bajo el estándar Dublin Core en el punto de acceso público de la revista.</li>\n  <li><strong>Preservación digital:</strong> Integración en PKP Preservation Network (PKP PN), además de esquemas de archivado distribuido LOCKSS y CLOCKSS.</li>\n  <li><strong>Identificadores persistentes y citación:</strong> Compatibilidad con esquemas DOI, identificadores ORCID de autores y generación automatizada de formatos de citación bibliográfica normalizada (APA, Chicago, Harvard).</li>\n</ul>\n</div>','string'),
(4,'es_ES','acronym','RCSB','string'),
(4,'es_ES','authorGuidelines','<h3>Directrices para Autores</h3><p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p><ul><li><strong>Estructura:</strong> Esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li><li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias.</li><li><strong>Resumen y palabras clave:</strong> Hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li><li><strong>Citas y referencias:</strong> Aplicación de normas APA (7ma edición) con DOI activo en todas las fuentes digitales.</li></ul>','string'),
(4,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost:8080/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.',NULL),
(4,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>',NULL),
(4,'es_ES','competingInterests','<p>Los autores, revisores y editores deben declarar explícitamente cualquier conflicto de intereses potencial que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>','string'),
(4,'es_ES','contactAffiliation','Universidad Técnica de Manabí','string'),
(4,'es_ES','contactEmail','estudiante4@utm.edu.ec','string'),
(4,'es_ES','contactName','Estudiante 4','string'),
(4,'es_ES','contactTitle','Director / Editor en Jefe y Gestor de Revista','string'),
(4,'es_ES','description','Órgano de divulgación científica en medicina clínica, enfermería, salud pública, nutrición, epidemiología y ciencias biomédicas.','string'),
(4,'es_ES','editorialTeam','<h3>Equipo Editorial</h3><p><strong>Director / Editor en Jefe y Gestor de Revista:</strong> Dr. Juan Pérez (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editora de Sección - Ciencias Agrarias y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor de Sección - Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p><hr><h3>Comité Científico Internacional</h3><ul><li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li><li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li><li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li><li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li><li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li><li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li></ul>','string'),
(4,'es_ES','focusScope','<p>La Revista Ceibo recibe contribuciones científicas en las siguientes áreas temáticas:</p><ul><li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales y mitigación de cambio climático.</li><li><strong>Educación, Pedagogía e Innovación Curricular:</strong> Mediación tecnológica, inclusión educativa y gestión de la calidad en educación superior.</li><li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y gestión editorial.</li></ul>','string'),
(4,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(4,'es_ES','licenseTerms','<p>La Revista Ceibo publica todos sus contenidos bajo licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. No aplica cargos por procesamiento de artículos (APC) ni por postulación.</p>','string'),
(4,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>',NULL),
(4,'es_ES','name','Revista de Ciencias de la Salud y Biomédicas','string'),
(4,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.',NULL),
(4,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>',NULL),
(4,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.',NULL),
(4,'es_ES','reviewGuidelines','<h3>Guía para Evaluadores/as por Pares</h3><p>La evaluación se realiza mediante formulario estructurado valorando:</p><ul><li>Originalidad y aporte al conocimiento</li><li>Rigor del diseño metodológico y reproducibilidad</li><li>Claridad en la presentación de resultados y validez de las conclusiones</li><li>Cumplimiento de estándares éticos y citación adecuada</li></ul>','string'),
(4,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor\\/a).\"},{\"order\":2,\"content\":\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\"},{\"order\":3,\"content\":\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\"},{\"order\":4,\"content\":\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\\\"http:\\/\\/localhost:8080\\/index.php\\/revista_ceibo\\/about\\/submissions#authorGuidelines\\\" target=\\\"_new\\\">Directrices del autor\\/a<\\/a>, que aparecen en Acerca de la revista.\"}]',NULL),
(4,'es_ES','supportEmail','soporte.editorial@utm.edu.ec','string'),
(4,'es_ES','supportName','Soporte Técnico Editorial UTM','string'),
(5,'','agencies','request','string'),
(5,'','citations','request','string'),
(5,'','contactEmail','jperez@utm.edu.ec','string'),
(5,'','contactName','Dr. Juan Pérez','string'),
(5,'','copyrightYearBasis','issue',NULL),
(5,'','coverage','enable','string'),
(5,'','defaultReviewMode','2',NULL),
(5,'','disableSubmissions','0',NULL),
(5,'','disciplines','request','string'),
(5,'','emailSignature','<p>Cordialmente,<br /><strong>Equipo Editorial - Revista de Ingeniería, Industria y Desarrollo</strong><br />Universidad Técnica de Manabí</p>','string'),
(5,'','enableOai','1',NULL),
(5,'','itemsPerPage','25',NULL),
(5,'','keywords','request','string'),
(5,'','membershipFee','0',NULL),
(5,'','numPageLinks','10',NULL),
(5,'','numWeeksPerResponse','4',NULL),
(5,'','numWeeksPerReview','4',NULL),
(5,'','publicationFee','0',NULL),
(5,'','purchaseArticleFee','0',NULL),
(5,'','rights','enable','string'),
(5,'','source','enable','string'),
(5,'','supportedFormLocales','[\"es_ES\"]',NULL),
(5,'','supportedLocales','[\"en_US\",\"es_ES\"]',NULL),
(5,'','supportedSubmissionLocales','[\"es_ES\"]',NULL),
(5,'','supportEmail','soporte.editorial@utm.edu.ec','string'),
(5,'','supportName','Soporte Técnico Editorial - UTM','string'),
(5,'','themePluginPath','default',NULL),
(5,'','type','enable','string'),
(5,'en_US','acronym',NULL,NULL),
(5,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/index.php/index/login\">log in</a> and begin the five-step process.',NULL),
(5,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),
(5,'en_US','description','Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.',NULL),
(5,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(5,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),
(5,'en_US','name','Ceibo Journal',NULL),
(5,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),
(5,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),
(5,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),
(5,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),
(5,'es_ES','about','<div class=\"journal-about-content\">\n<h3>Presentación</h3>\n<p>La <strong>Revista Ceibo</strong> es una publicación científica multidisciplinaria arbitrada de acceso abierto diamante, editada por la Universidad Técnica de Manabí (Portoviejo, Ecuador). Su periodicidad es semestral y su misión primordial es difundir contribuciones científicas inéditas y originales que aporten a la solución de problemáticas regionales y globales en el marco del desarrollo sostenible.</p>\n\n<h3>Enfoque y Alcance</h3>\n<p>La revista recibe manuscritos en las siguientes áreas de conocimiento:</p>\n<ul>\n  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo agroecológico, conservación del bosque seco tropical, biodiversidad, gestión de cuencas hidrográficas y resiliencia climática.</li>\n  <li><strong>Educación, Humanidades y Tecnologías del Aprendizaje:</strong> Innovación pedagógica, competencias digitales docentes, entornos virtuales y preservación de la memoria cultural.</li>\n  <li><strong>Ingeniería, Energía y Desarrollo Territorial:</strong> Tecnologías de la información, modelado ambiental, bioeconomía y cadenas de valor agroindustriales.</li>\n</ul>\n\n<h3>Proceso de Evaluación por Pares (Peer Review)</h3>\n<p>Todos los artículos postulados son sometidos a un riguroso proceso de revisión bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>, asegurando el anonimato estricto tanto de autores como de evaluadores:</p>\n<ol>\n  <li><strong>Filtro editorial preliminar:</strong> El Comité Editorial verifica la afinidad temática, originalidad, formato IMRyD y porcentaje de similitud mediante software antiplagio (máximo 10% de coincidencia excluida bibliografía). Plazo: 7 a 10 días.</li>\n  <li><strong>Ronda 1 de evaluación:</strong> El manuscrito es remitido a mínimo dos especialistas externos (pares ciegos), quienes valoran originalidad, rigor metodológico y pertinencia mediante un formulario estructurado de evaluación cuantitativa y cualitativa. Plazo: 4 a 6 semanas.</li>\n  <li><strong>Ronda 2 de revisión:</strong> En caso de que se soliciten modificaciones mayores o menores, el autor dispone de 15 a 30 días para remitir la versión corregida junto a una carta de respuesta punto por punto. El evaluador valida la incorporación de las sugerencias antes del dictamen final.</li>\n  <li><strong>Dictamen final:</strong> Las decisiones posibles son: Aceptar envío, Publicable con modificaciones, Reenviar para revisión (Ronda 2) o Rechazar. El Editor en Jefe emite la resolución motivada.</li>\n</ol>\n\n<h3>Política sobre el Uso de Inteligencia Artificial (IA) en la Publicación</h3>\n<p>En concordancia con las directrices del Committee on Publication Ethics (COPE) y la World Association of Medical Editors (WAME), la Revista Ceibo establece las siguientes normas respecto a la Inteligencia Artificial generativa y Modelos de Lenguaje de Gran Escala (LLMs):</p>\n<ul>\n  <li><strong>Autoría y responsabilidad:</strong> Las herramientas de IA no cumplen los requisitos de autoría, pues no pueden asumir responsabilidad legal, ética ni intelectual por los contenidos. Por ende, la IA no puede figurar como autor ni coautor de ningún envío. Toda la responsabilidad recae en los autores humanos.</li>\n  <li><strong>Declaración de uso:</strong> Los autores deben declarar de forma explícita y transparente en la sección de Metodología o en los Agradecimientos el empleo de herramientas de IA (nombre del software, versión y propósito específico, por ejemplo: corrección estilística, traducción, análisis de código o síntesis preliminar).</li>\n  <li><strong>Confidencialidad en la evaluación por pares:</strong> Los revisores y editores tienen estrictamente prohibido cargar manuscritos inéditos, datos no publicados o comentarios editoriales en plataformas públicas de IA generativa, ya que esto vulnera los acuerdos de confidencialidad y los derechos de propiedad intelectual de los autores.</li>\n  <li><strong>Detección de similitud y texto generado por IA:</strong> La revista aplica herramientas automatizadas de control de originalidad (Turnitin / iThenticate). No obstante, los informes de detección de IA se interpretan como indicios orientativos sujetos a revisión crítica humana, reconociendo las limitaciones de los modelos de detección y evitando falsos positivos.</li>\n</ul>\n\n<h3>Política de Acceso Abierto Diamante</h3>\n<p>La Revista Ceibo suscribe los principios de la Iniciativa de Acceso Abierto de Budapest (BOAI). Todo el contenido publicado se distribuye de forma inmediata y gratuita, sin periodo de embargo ni cobro de tarifas por procesamiento de artículos (APC - Article Processing Charges) o por envío (Submission Charges). El financiamiento institucional integral corre a cargo de la Universidad Técnica de Manabí.</p>\n<p>Los artículos se publican bajo licencia internacional <strong>Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)</strong>.</p>\n\n<h3>Preservación Digital e Interoperabilidad</h3>\n<p>Esta revista garantiza la preservación permanente y la máxima difusión de sus contenidos científicos mediante:</p>\n<ul>\n  <li><strong>Protocolo de interoperabilidad OAI-PMH:</strong> Exposición abierta de metadatos bajo el estándar Dublin Core en el punto de acceso público de la revista.</li>\n  <li><strong>Preservación digital:</strong> Integración en PKP Preservation Network (PKP PN), además de esquemas de archivado distribuido LOCKSS y CLOCKSS.</li>\n  <li><strong>Identificadores persistentes y citación:</strong> Compatibilidad con esquemas DOI, identificadores ORCID de autores y generación automatizada de formatos de citación bibliográfica normalizada (APA, Chicago, Harvard).</li>\n</ul>\n</div>','string'),
(5,'es_ES','acronym','RIID','string'),
(5,'es_ES','authorGuidelines','<h3>Directrices para Autores</h3><p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p><ul><li><strong>Estructura:</strong> Esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li><li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias.</li><li><strong>Resumen y palabras clave:</strong> Hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li><li><strong>Citas y referencias:</strong> Aplicación de normas APA (7ma edición) con DOI activo en todas las fuentes digitales.</li></ul>','string'),
(5,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost:8080/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.',NULL),
(5,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>',NULL),
(5,'es_ES','competingInterests','<p>Los autores, revisores y editores deben declarar explícitamente cualquier conflicto de intereses potencial que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>','string'),
(5,'es_ES','contactAffiliation','Universidad Técnica de Manabí','string'),
(5,'es_ES','contactEmail','estudiante5@utm.edu.ec','string'),
(5,'es_ES','contactName','Estudiante 5','string'),
(5,'es_ES','contactTitle','Director / Editor en Jefe y Gestor de Revista','string'),
(5,'es_ES','description','Publicación orientada a avances en ingeniería civil, eléctrica, mecánica, química, procesos industriales e infraestructura.','string'),
(5,'es_ES','editorialTeam','<h3>Equipo Editorial</h3><p><strong>Director / Editor en Jefe y Gestor de Revista:</strong> Dr. Juan Pérez (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editora de Sección - Ciencias Agrarias y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor de Sección - Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p><hr><h3>Comité Científico Internacional</h3><ul><li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li><li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li><li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li><li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li><li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li><li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li></ul>','string'),
(5,'es_ES','focusScope','<p>La Revista Ceibo recibe contribuciones científicas en las siguientes áreas temáticas:</p><ul><li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales y mitigación de cambio climático.</li><li><strong>Educación, Pedagogía e Innovación Curricular:</strong> Mediación tecnológica, inclusión educativa y gestión de la calidad en educación superior.</li><li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y gestión editorial.</li></ul>','string'),
(5,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(5,'es_ES','licenseTerms','<p>La Revista Ceibo publica todos sus contenidos bajo licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. No aplica cargos por procesamiento de artículos (APC) ni por postulación.</p>','string'),
(5,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>',NULL),
(5,'es_ES','name','Revista de Ingeniería, Industria y Desarrollo','string'),
(5,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.',NULL),
(5,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>',NULL),
(5,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.',NULL),
(5,'es_ES','reviewGuidelines','<h3>Guía para Evaluadores/as por Pares</h3><p>La evaluación se realiza mediante formulario estructurado valorando:</p><ul><li>Originalidad y aporte al conocimiento</li><li>Rigor del diseño metodológico y reproducibilidad</li><li>Claridad en la presentación de resultados y validez de las conclusiones</li><li>Cumplimiento de estándares éticos y citación adecuada</li></ul>','string'),
(5,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor\\/a).\"},{\"order\":2,\"content\":\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\"},{\"order\":3,\"content\":\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\"},{\"order\":4,\"content\":\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\\\"http:\\/\\/localhost:8080\\/index.php\\/revista_ceibo\\/about\\/submissions#authorGuidelines\\\" target=\\\"_new\\\">Directrices del autor\\/a<\\/a>, que aparecen en Acerca de la revista.\"}]',NULL),
(5,'es_ES','supportEmail','soporte.editorial@utm.edu.ec','string'),
(5,'es_ES','supportName','Soporte Técnico Editorial UTM','string'),
(6,'','agencies','request','string'),
(6,'','citations','request','string'),
(6,'','contactEmail','jperez@utm.edu.ec','string'),
(6,'','contactName','Dr. Juan Pérez','string'),
(6,'','copyrightYearBasis','issue',NULL),
(6,'','coverage','enable','string'),
(6,'','defaultReviewMode','2',NULL),
(6,'','disableSubmissions','0',NULL),
(6,'','disciplines','request','string'),
(6,'','emailSignature','<p>Cordialmente,<br /><strong>Equipo Editorial - Revista de Ciencias Económicas y Administrativas</strong><br />Universidad Técnica de Manabí</p>','string'),
(6,'','enableOai','1',NULL),
(6,'','itemsPerPage','25',NULL),
(6,'','keywords','request','string'),
(6,'','membershipFee','0',NULL),
(6,'','numPageLinks','10',NULL),
(6,'','numWeeksPerResponse','4',NULL),
(6,'','numWeeksPerReview','4',NULL),
(6,'','publicationFee','0',NULL),
(6,'','purchaseArticleFee','0',NULL),
(6,'','rights','enable','string'),
(6,'','source','enable','string'),
(6,'','supportedFormLocales','[\"es_ES\"]',NULL),
(6,'','supportedLocales','[\"en_US\",\"es_ES\"]',NULL),
(6,'','supportedSubmissionLocales','[\"es_ES\"]',NULL),
(6,'','supportEmail','soporte.editorial@utm.edu.ec','string'),
(6,'','supportName','Soporte Técnico Editorial - UTM','string'),
(6,'','themePluginPath','default',NULL),
(6,'','type','enable','string'),
(6,'en_US','acronym',NULL,NULL),
(6,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/index.php/index/login\">log in</a> and begin the five-step process.',NULL),
(6,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),
(6,'en_US','description','Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.',NULL),
(6,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(6,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),
(6,'en_US','name','Ceibo Journal',NULL),
(6,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),
(6,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),
(6,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),
(6,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),
(6,'es_ES','about','<div class=\"journal-about-content\">\n<h3>Presentación</h3>\n<p>La <strong>Revista Ceibo</strong> es una publicación científica multidisciplinaria arbitrada de acceso abierto diamante, editada por la Universidad Técnica de Manabí (Portoviejo, Ecuador). Su periodicidad es semestral y su misión primordial es difundir contribuciones científicas inéditas y originales que aporten a la solución de problemáticas regionales y globales en el marco del desarrollo sostenible.</p>\n\n<h3>Enfoque y Alcance</h3>\n<p>La revista recibe manuscritos en las siguientes áreas de conocimiento:</p>\n<ul>\n  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo agroecológico, conservación del bosque seco tropical, biodiversidad, gestión de cuencas hidrográficas y resiliencia climática.</li>\n  <li><strong>Educación, Humanidades y Tecnologías del Aprendizaje:</strong> Innovación pedagógica, competencias digitales docentes, entornos virtuales y preservación de la memoria cultural.</li>\n  <li><strong>Ingeniería, Energía y Desarrollo Territorial:</strong> Tecnologías de la información, modelado ambiental, bioeconomía y cadenas de valor agroindustriales.</li>\n</ul>\n\n<h3>Proceso de Evaluación por Pares (Peer Review)</h3>\n<p>Todos los artículos postulados son sometidos a un riguroso proceso de revisión bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>, asegurando el anonimato estricto tanto de autores como de evaluadores:</p>\n<ol>\n  <li><strong>Filtro editorial preliminar:</strong> El Comité Editorial verifica la afinidad temática, originalidad, formato IMRyD y porcentaje de similitud mediante software antiplagio (máximo 10% de coincidencia excluida bibliografía). Plazo: 7 a 10 días.</li>\n  <li><strong>Ronda 1 de evaluación:</strong> El manuscrito es remitido a mínimo dos especialistas externos (pares ciegos), quienes valoran originalidad, rigor metodológico y pertinencia mediante un formulario estructurado de evaluación cuantitativa y cualitativa. Plazo: 4 a 6 semanas.</li>\n  <li><strong>Ronda 2 de revisión:</strong> En caso de que se soliciten modificaciones mayores o menores, el autor dispone de 15 a 30 días para remitir la versión corregida junto a una carta de respuesta punto por punto. El evaluador valida la incorporación de las sugerencias antes del dictamen final.</li>\n  <li><strong>Dictamen final:</strong> Las decisiones posibles son: Aceptar envío, Publicable con modificaciones, Reenviar para revisión (Ronda 2) o Rechazar. El Editor en Jefe emite la resolución motivada.</li>\n</ol>\n\n<h3>Política sobre el Uso de Inteligencia Artificial (IA) en la Publicación</h3>\n<p>En concordancia con las directrices del Committee on Publication Ethics (COPE) y la World Association of Medical Editors (WAME), la Revista Ceibo establece las siguientes normas respecto a la Inteligencia Artificial generativa y Modelos de Lenguaje de Gran Escala (LLMs):</p>\n<ul>\n  <li><strong>Autoría y responsabilidad:</strong> Las herramientas de IA no cumplen los requisitos de autoría, pues no pueden asumir responsabilidad legal, ética ni intelectual por los contenidos. Por ende, la IA no puede figurar como autor ni coautor de ningún envío. Toda la responsabilidad recae en los autores humanos.</li>\n  <li><strong>Declaración de uso:</strong> Los autores deben declarar de forma explícita y transparente en la sección de Metodología o en los Agradecimientos el empleo de herramientas de IA (nombre del software, versión y propósito específico, por ejemplo: corrección estilística, traducción, análisis de código o síntesis preliminar).</li>\n  <li><strong>Confidencialidad en la evaluación por pares:</strong> Los revisores y editores tienen estrictamente prohibido cargar manuscritos inéditos, datos no publicados o comentarios editoriales en plataformas públicas de IA generativa, ya que esto vulnera los acuerdos de confidencialidad y los derechos de propiedad intelectual de los autores.</li>\n  <li><strong>Detección de similitud y texto generado por IA:</strong> La revista aplica herramientas automatizadas de control de originalidad (Turnitin / iThenticate). No obstante, los informes de detección de IA se interpretan como indicios orientativos sujetos a revisión crítica humana, reconociendo las limitaciones de los modelos de detección y evitando falsos positivos.</li>\n</ul>\n\n<h3>Política de Acceso Abierto Diamante</h3>\n<p>La Revista Ceibo suscribe los principios de la Iniciativa de Acceso Abierto de Budapest (BOAI). Todo el contenido publicado se distribuye de forma inmediata y gratuita, sin periodo de embargo ni cobro de tarifas por procesamiento de artículos (APC - Article Processing Charges) o por envío (Submission Charges). El financiamiento institucional integral corre a cargo de la Universidad Técnica de Manabí.</p>\n<p>Los artículos se publican bajo licencia internacional <strong>Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)</strong>.</p>\n\n<h3>Preservación Digital e Interoperabilidad</h3>\n<p>Esta revista garantiza la preservación permanente y la máxima difusión de sus contenidos científicos mediante:</p>\n<ul>\n  <li><strong>Protocolo de interoperabilidad OAI-PMH:</strong> Exposición abierta de metadatos bajo el estándar Dublin Core en el punto de acceso público de la revista.</li>\n  <li><strong>Preservación digital:</strong> Integración en PKP Preservation Network (PKP PN), además de esquemas de archivado distribuido LOCKSS y CLOCKSS.</li>\n  <li><strong>Identificadores persistentes y citación:</strong> Compatibilidad con esquemas DOI, identificadores ORCID de autores y generación automatizada de formatos de citación bibliográfica normalizada (APA, Chicago, Harvard).</li>\n</ul>\n</div>','string'),
(6,'es_ES','acronym','RCEA','string'),
(6,'es_ES','authorGuidelines','<h3>Directrices para Autores</h3><p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p><ul><li><strong>Estructura:</strong> Esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li><li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias.</li><li><strong>Resumen y palabras clave:</strong> Hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li><li><strong>Citas y referencias:</strong> Aplicación de normas APA (7ma edición) con DOI activo en todas las fuentes digitales.</li></ul>','string'),
(6,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost:8080/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.',NULL),
(6,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>',NULL),
(6,'es_ES','competingInterests','<p>Los autores, revisores y editores deben declarar explícitamente cualquier conflicto de intereses potencial que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>','string'),
(6,'es_ES','contactAffiliation','Universidad Técnica de Manabí','string'),
(6,'es_ES','contactEmail','estudiante6@utm.edu.ec','string'),
(6,'es_ES','contactName','Estudiante 6','string'),
(6,'es_ES','contactTitle','Director / Editor en Jefe y Gestor de Revista','string'),
(6,'es_ES','description','Investigaciones teóricas y aplicadas en economía, contabilidad y auditoría, finanzas, administración y desarrollo empresarial.','string'),
(6,'es_ES','editorialTeam','<h3>Equipo Editorial</h3><p><strong>Director / Editor en Jefe y Gestor de Revista:</strong> Dr. Juan Pérez (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editora de Sección - Ciencias Agrarias y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor de Sección - Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p><hr><h3>Comité Científico Internacional</h3><ul><li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li><li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li><li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li><li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li><li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li><li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li></ul>','string'),
(6,'es_ES','focusScope','<p>La Revista Ceibo recibe contribuciones científicas en las siguientes áreas temáticas:</p><ul><li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales y mitigación de cambio climático.</li><li><strong>Educación, Pedagogía e Innovación Curricular:</strong> Mediación tecnológica, inclusión educativa y gestión de la calidad en educación superior.</li><li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y gestión editorial.</li></ul>','string'),
(6,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(6,'es_ES','licenseTerms','<p>La Revista Ceibo publica todos sus contenidos bajo licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. No aplica cargos por procesamiento de artículos (APC) ni por postulación.</p>','string'),
(6,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>',NULL),
(6,'es_ES','name','Revista de Ciencias Económicas y Administrativas','string'),
(6,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.',NULL),
(6,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>',NULL),
(6,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.',NULL),
(6,'es_ES','reviewGuidelines','<h3>Guía para Evaluadores/as por Pares</h3><p>La evaluación se realiza mediante formulario estructurado valorando:</p><ul><li>Originalidad y aporte al conocimiento</li><li>Rigor del diseño metodológico y reproducibilidad</li><li>Claridad en la presentación de resultados y validez de las conclusiones</li><li>Cumplimiento de estándares éticos y citación adecuada</li></ul>','string'),
(6,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor\\/a).\"},{\"order\":2,\"content\":\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\"},{\"order\":3,\"content\":\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\"},{\"order\":4,\"content\":\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\\\"http:\\/\\/localhost:8080\\/index.php\\/revista_ceibo\\/about\\/submissions#authorGuidelines\\\" target=\\\"_new\\\">Directrices del autor\\/a<\\/a>, que aparecen en Acerca de la revista.\"}]',NULL),
(6,'es_ES','supportEmail','soporte.editorial@utm.edu.ec','string'),
(6,'es_ES','supportName','Soporte Técnico Editorial UTM','string'),
(7,'','agencies','request','string'),
(7,'','citations','request','string'),
(7,'','contactEmail','jperez@utm.edu.ec','string'),
(7,'','contactName','Dr. Juan Pérez','string'),
(7,'','copyrightYearBasis','issue',NULL),
(7,'','coverage','enable','string'),
(7,'','defaultReviewMode','2',NULL),
(7,'','disableSubmissions','0',NULL),
(7,'','disciplines','request','string'),
(7,'','emailSignature','<p>Cordialmente,<br /><strong>Equipo Editorial - Revista de Ciencias Sociales y Humanidades</strong><br />Universidad Técnica de Manabí</p>','string'),
(7,'','enableOai','1',NULL),
(7,'','itemsPerPage','25',NULL),
(7,'','keywords','request','string'),
(7,'','membershipFee','0',NULL),
(7,'','numPageLinks','10',NULL),
(7,'','numWeeksPerResponse','4',NULL),
(7,'','numWeeksPerReview','4',NULL),
(7,'','publicationFee','0',NULL),
(7,'','purchaseArticleFee','0',NULL),
(7,'','rights','enable','string'),
(7,'','source','enable','string'),
(7,'','supportedFormLocales','[\"es_ES\"]',NULL),
(7,'','supportedLocales','[\"en_US\",\"es_ES\"]',NULL),
(7,'','supportedSubmissionLocales','[\"es_ES\"]',NULL),
(7,'','supportEmail','soporte.editorial@utm.edu.ec','string'),
(7,'','supportName','Soporte Técnico Editorial - UTM','string'),
(7,'','themePluginPath','default',NULL),
(7,'','type','enable','string'),
(7,'en_US','acronym',NULL,NULL),
(7,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/index.php/index/login\">log in</a> and begin the five-step process.',NULL),
(7,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),
(7,'en_US','description','Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.',NULL),
(7,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(7,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),
(7,'en_US','name','Ceibo Journal',NULL),
(7,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),
(7,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),
(7,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),
(7,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),
(7,'es_ES','about','<div class=\"journal-about-content\">\n<h3>Presentación</h3>\n<p>La <strong>Revista Ceibo</strong> es una publicación científica multidisciplinaria arbitrada de acceso abierto diamante, editada por la Universidad Técnica de Manabí (Portoviejo, Ecuador). Su periodicidad es semestral y su misión primordial es difundir contribuciones científicas inéditas y originales que aporten a la solución de problemáticas regionales y globales en el marco del desarrollo sostenible.</p>\n\n<h3>Enfoque y Alcance</h3>\n<p>La revista recibe manuscritos en las siguientes áreas de conocimiento:</p>\n<ul>\n  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo agroecológico, conservación del bosque seco tropical, biodiversidad, gestión de cuencas hidrográficas y resiliencia climática.</li>\n  <li><strong>Educación, Humanidades y Tecnologías del Aprendizaje:</strong> Innovación pedagógica, competencias digitales docentes, entornos virtuales y preservación de la memoria cultural.</li>\n  <li><strong>Ingeniería, Energía y Desarrollo Territorial:</strong> Tecnologías de la información, modelado ambiental, bioeconomía y cadenas de valor agroindustriales.</li>\n</ul>\n\n<h3>Proceso de Evaluación por Pares (Peer Review)</h3>\n<p>Todos los artículos postulados son sometidos a un riguroso proceso de revisión bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>, asegurando el anonimato estricto tanto de autores como de evaluadores:</p>\n<ol>\n  <li><strong>Filtro editorial preliminar:</strong> El Comité Editorial verifica la afinidad temática, originalidad, formato IMRyD y porcentaje de similitud mediante software antiplagio (máximo 10% de coincidencia excluida bibliografía). Plazo: 7 a 10 días.</li>\n  <li><strong>Ronda 1 de evaluación:</strong> El manuscrito es remitido a mínimo dos especialistas externos (pares ciegos), quienes valoran originalidad, rigor metodológico y pertinencia mediante un formulario estructurado de evaluación cuantitativa y cualitativa. Plazo: 4 a 6 semanas.</li>\n  <li><strong>Ronda 2 de revisión:</strong> En caso de que se soliciten modificaciones mayores o menores, el autor dispone de 15 a 30 días para remitir la versión corregida junto a una carta de respuesta punto por punto. El evaluador valida la incorporación de las sugerencias antes del dictamen final.</li>\n  <li><strong>Dictamen final:</strong> Las decisiones posibles son: Aceptar envío, Publicable con modificaciones, Reenviar para revisión (Ronda 2) o Rechazar. El Editor en Jefe emite la resolución motivada.</li>\n</ol>\n\n<h3>Política sobre el Uso de Inteligencia Artificial (IA) en la Publicación</h3>\n<p>En concordancia con las directrices del Committee on Publication Ethics (COPE) y la World Association of Medical Editors (WAME), la Revista Ceibo establece las siguientes normas respecto a la Inteligencia Artificial generativa y Modelos de Lenguaje de Gran Escala (LLMs):</p>\n<ul>\n  <li><strong>Autoría y responsabilidad:</strong> Las herramientas de IA no cumplen los requisitos de autoría, pues no pueden asumir responsabilidad legal, ética ni intelectual por los contenidos. Por ende, la IA no puede figurar como autor ni coautor de ningún envío. Toda la responsabilidad recae en los autores humanos.</li>\n  <li><strong>Declaración de uso:</strong> Los autores deben declarar de forma explícita y transparente en la sección de Metodología o en los Agradecimientos el empleo de herramientas de IA (nombre del software, versión y propósito específico, por ejemplo: corrección estilística, traducción, análisis de código o síntesis preliminar).</li>\n  <li><strong>Confidencialidad en la evaluación por pares:</strong> Los revisores y editores tienen estrictamente prohibido cargar manuscritos inéditos, datos no publicados o comentarios editoriales en plataformas públicas de IA generativa, ya que esto vulnera los acuerdos de confidencialidad y los derechos de propiedad intelectual de los autores.</li>\n  <li><strong>Detección de similitud y texto generado por IA:</strong> La revista aplica herramientas automatizadas de control de originalidad (Turnitin / iThenticate). No obstante, los informes de detección de IA se interpretan como indicios orientativos sujetos a revisión crítica humana, reconociendo las limitaciones de los modelos de detección y evitando falsos positivos.</li>\n</ul>\n\n<h3>Política de Acceso Abierto Diamante</h3>\n<p>La Revista Ceibo suscribe los principios de la Iniciativa de Acceso Abierto de Budapest (BOAI). Todo el contenido publicado se distribuye de forma inmediata y gratuita, sin periodo de embargo ni cobro de tarifas por procesamiento de artículos (APC - Article Processing Charges) o por envío (Submission Charges). El financiamiento institucional integral corre a cargo de la Universidad Técnica de Manabí.</p>\n<p>Los artículos se publican bajo licencia internacional <strong>Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)</strong>.</p>\n\n<h3>Preservación Digital e Interoperabilidad</h3>\n<p>Esta revista garantiza la preservación permanente y la máxima difusión de sus contenidos científicos mediante:</p>\n<ul>\n  <li><strong>Protocolo de interoperabilidad OAI-PMH:</strong> Exposición abierta de metadatos bajo el estándar Dublin Core en el punto de acceso público de la revista.</li>\n  <li><strong>Preservación digital:</strong> Integración en PKP Preservation Network (PKP PN), además de esquemas de archivado distribuido LOCKSS y CLOCKSS.</li>\n  <li><strong>Identificadores persistentes y citación:</strong> Compatibilidad con esquemas DOI, identificadores ORCID de autores y generación automatizada de formatos de citación bibliográfica normalizada (APA, Chicago, Harvard).</li>\n</ul>\n</div>','string'),
(7,'es_ES','acronym','RCSH','string'),
(7,'es_ES','authorGuidelines','<h3>Directrices para Autores</h3><p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p><ul><li><strong>Estructura:</strong> Esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li><li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias.</li><li><strong>Resumen y palabras clave:</strong> Hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li><li><strong>Citas y referencias:</strong> Aplicación de normas APA (7ma edición) con DOI activo en todas las fuentes digitales.</li></ul>','string'),
(7,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost:8080/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.',NULL),
(7,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>',NULL),
(7,'es_ES','competingInterests','<p>Los autores, revisores y editores deben declarar explícitamente cualquier conflicto de intereses potencial que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>','string'),
(7,'es_ES','contactAffiliation','Universidad Técnica de Manabí','string'),
(7,'es_ES','contactEmail','estudiante7@utm.edu.ec','string'),
(7,'es_ES','contactName','Estudiante 7','string'),
(7,'es_ES','contactTitle','Director / Editor en Jefe y Gestor de Revista','string'),
(7,'es_ES','description','Difusión de estudios en sociología, ciencias políticas, derecho, historia, filosofía, comunicación social, arte y cultura.','string'),
(7,'es_ES','editorialTeam','<h3>Equipo Editorial</h3><p><strong>Director / Editor en Jefe y Gestor de Revista:</strong> Dr. Juan Pérez (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editora de Sección - Ciencias Agrarias y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor de Sección - Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p><hr><h3>Comité Científico Internacional</h3><ul><li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li><li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li><li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li><li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li><li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li><li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li></ul>','string'),
(7,'es_ES','focusScope','<p>La Revista Ceibo recibe contribuciones científicas en las siguientes áreas temáticas:</p><ul><li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales y mitigación de cambio climático.</li><li><strong>Educación, Pedagogía e Innovación Curricular:</strong> Mediación tecnológica, inclusión educativa y gestión de la calidad en educación superior.</li><li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y gestión editorial.</li></ul>','string'),
(7,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(7,'es_ES','licenseTerms','<p>La Revista Ceibo publica todos sus contenidos bajo licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. No aplica cargos por procesamiento de artículos (APC) ni por postulación.</p>','string'),
(7,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>',NULL),
(7,'es_ES','name','Revista de Ciencias Sociales y Humanidades','string'),
(7,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.',NULL),
(7,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>',NULL),
(7,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.',NULL),
(7,'es_ES','reviewGuidelines','<h3>Guía para Evaluadores/as por Pares</h3><p>La evaluación se realiza mediante formulario estructurado valorando:</p><ul><li>Originalidad y aporte al conocimiento</li><li>Rigor del diseño metodológico y reproducibilidad</li><li>Claridad en la presentación de resultados y validez de las conclusiones</li><li>Cumplimiento de estándares éticos y citación adecuada</li></ul>','string'),
(7,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor\\/a).\"},{\"order\":2,\"content\":\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\"},{\"order\":3,\"content\":\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\"},{\"order\":4,\"content\":\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\\\"http:\\/\\/localhost:8080\\/index.php\\/revista_ceibo\\/about\\/submissions#authorGuidelines\\\" target=\\\"_new\\\">Directrices del autor\\/a<\\/a>, que aparecen en Acerca de la revista.\"}]',NULL),
(7,'es_ES','supportEmail','soporte.editorial@utm.edu.ec','string'),
(7,'es_ES','supportName','Soporte Técnico Editorial UTM','string'),
(8,'','agencies','request','string'),
(8,'','citations','request','string'),
(8,'','contactEmail','jperez@utm.edu.ec','string'),
(8,'','contactName','Dr. Juan Pérez','string'),
(8,'','copyrightYearBasis','issue',NULL),
(8,'','coverage','enable','string'),
(8,'','defaultReviewMode','2',NULL),
(8,'','disableSubmissions','0',NULL),
(8,'','disciplines','request','string'),
(8,'','emailSignature','<p>Cordialmente,<br /><strong>Equipo Editorial - Revista de Informática y Tecnologías Computacionales</strong><br />Universidad Técnica de Manabí</p>','string'),
(8,'','enableOai','1',NULL),
(8,'','itemsPerPage','25',NULL),
(8,'','keywords','request','string'),
(8,'','membershipFee','0',NULL),
(8,'','numPageLinks','10',NULL),
(8,'','numWeeksPerResponse','4',NULL),
(8,'','numWeeksPerReview','4',NULL),
(8,'','publicationFee','0',NULL),
(8,'','purchaseArticleFee','0',NULL),
(8,'','rights','enable','string'),
(8,'','source','enable','string'),
(8,'','supportedFormLocales','[\"es_ES\"]',NULL),
(8,'','supportedLocales','[\"en_US\",\"es_ES\"]',NULL),
(8,'','supportedSubmissionLocales','[\"es_ES\"]',NULL),
(8,'','supportEmail','soporte.editorial@utm.edu.ec','string'),
(8,'','supportName','Soporte Técnico Editorial - UTM','string'),
(8,'','themePluginPath','default',NULL),
(8,'','type','enable','string'),
(8,'en_US','acronym',NULL,NULL),
(8,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost:8080/index.php/index/login\">log in</a> and begin the five-step process.',NULL),
(8,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),
(8,'en_US','description','Multidisciplinary scientific research journal of the Universidad Tecnica de Manabi.',NULL),
(8,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(8,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),
(8,'en_US','name','Ceibo Journal',NULL),
(8,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.',NULL),
(8,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),
(8,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),
(8,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]',NULL),
(8,'es_ES','about','<div class=\"journal-about-content\">\n<h3>Presentación</h3>\n<p>La <strong>Revista Ceibo</strong> es una publicación científica multidisciplinaria arbitrada de acceso abierto diamante, editada por la Universidad Técnica de Manabí (Portoviejo, Ecuador). Su periodicidad es semestral y su misión primordial es difundir contribuciones científicas inéditas y originales que aporten a la solución de problemáticas regionales y globales en el marco del desarrollo sostenible.</p>\n\n<h3>Enfoque y Alcance</h3>\n<p>La revista recibe manuscritos en las siguientes áreas de conocimiento:</p>\n<ul>\n  <li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo agroecológico, conservación del bosque seco tropical, biodiversidad, gestión de cuencas hidrográficas y resiliencia climática.</li>\n  <li><strong>Educación, Humanidades y Tecnologías del Aprendizaje:</strong> Innovación pedagógica, competencias digitales docentes, entornos virtuales y preservación de la memoria cultural.</li>\n  <li><strong>Ingeniería, Energía y Desarrollo Territorial:</strong> Tecnologías de la información, modelado ambiental, bioeconomía y cadenas de valor agroindustriales.</li>\n</ul>\n\n<h3>Proceso de Evaluación por Pares (Peer Review)</h3>\n<p>Todos los artículos postulados son sometidos a un riguroso proceso de revisión bajo la modalidad de <strong>doble ciego (double-blind peer review)</strong>, asegurando el anonimato estricto tanto de autores como de evaluadores:</p>\n<ol>\n  <li><strong>Filtro editorial preliminar:</strong> El Comité Editorial verifica la afinidad temática, originalidad, formato IMRyD y porcentaje de similitud mediante software antiplagio (máximo 10% de coincidencia excluida bibliografía). Plazo: 7 a 10 días.</li>\n  <li><strong>Ronda 1 de evaluación:</strong> El manuscrito es remitido a mínimo dos especialistas externos (pares ciegos), quienes valoran originalidad, rigor metodológico y pertinencia mediante un formulario estructurado de evaluación cuantitativa y cualitativa. Plazo: 4 a 6 semanas.</li>\n  <li><strong>Ronda 2 de revisión:</strong> En caso de que se soliciten modificaciones mayores o menores, el autor dispone de 15 a 30 días para remitir la versión corregida junto a una carta de respuesta punto por punto. El evaluador valida la incorporación de las sugerencias antes del dictamen final.</li>\n  <li><strong>Dictamen final:</strong> Las decisiones posibles son: Aceptar envío, Publicable con modificaciones, Reenviar para revisión (Ronda 2) o Rechazar. El Editor en Jefe emite la resolución motivada.</li>\n</ol>\n\n<h3>Política sobre el Uso de Inteligencia Artificial (IA) en la Publicación</h3>\n<p>En concordancia con las directrices del Committee on Publication Ethics (COPE) y la World Association of Medical Editors (WAME), la Revista Ceibo establece las siguientes normas respecto a la Inteligencia Artificial generativa y Modelos de Lenguaje de Gran Escala (LLMs):</p>\n<ul>\n  <li><strong>Autoría y responsabilidad:</strong> Las herramientas de IA no cumplen los requisitos de autoría, pues no pueden asumir responsabilidad legal, ética ni intelectual por los contenidos. Por ende, la IA no puede figurar como autor ni coautor de ningún envío. Toda la responsabilidad recae en los autores humanos.</li>\n  <li><strong>Declaración de uso:</strong> Los autores deben declarar de forma explícita y transparente en la sección de Metodología o en los Agradecimientos el empleo de herramientas de IA (nombre del software, versión y propósito específico, por ejemplo: corrección estilística, traducción, análisis de código o síntesis preliminar).</li>\n  <li><strong>Confidencialidad en la evaluación por pares:</strong> Los revisores y editores tienen estrictamente prohibido cargar manuscritos inéditos, datos no publicados o comentarios editoriales en plataformas públicas de IA generativa, ya que esto vulnera los acuerdos de confidencialidad y los derechos de propiedad intelectual de los autores.</li>\n  <li><strong>Detección de similitud y texto generado por IA:</strong> La revista aplica herramientas automatizadas de control de originalidad (Turnitin / iThenticate). No obstante, los informes de detección de IA se interpretan como indicios orientativos sujetos a revisión crítica humana, reconociendo las limitaciones de los modelos de detección y evitando falsos positivos.</li>\n</ul>\n\n<h3>Política de Acceso Abierto Diamante</h3>\n<p>La Revista Ceibo suscribe los principios de la Iniciativa de Acceso Abierto de Budapest (BOAI). Todo el contenido publicado se distribuye de forma inmediata y gratuita, sin periodo de embargo ni cobro de tarifas por procesamiento de artículos (APC - Article Processing Charges) o por envío (Submission Charges). El financiamiento institucional integral corre a cargo de la Universidad Técnica de Manabí.</p>\n<p>Los artículos se publican bajo licencia internacional <strong>Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)</strong>.</p>\n\n<h3>Preservación Digital e Interoperabilidad</h3>\n<p>Esta revista garantiza la preservación permanente y la máxima difusión de sus contenidos científicos mediante:</p>\n<ul>\n  <li><strong>Protocolo de interoperabilidad OAI-PMH:</strong> Exposición abierta de metadatos bajo el estándar Dublin Core en el punto de acceso público de la revista.</li>\n  <li><strong>Preservación digital:</strong> Integración en PKP Preservation Network (PKP PN), además de esquemas de archivado distribuido LOCKSS y CLOCKSS.</li>\n  <li><strong>Identificadores persistentes y citación:</strong> Compatibilidad con esquemas DOI, identificadores ORCID de autores y generación automatizada de formatos de citación bibliográfica normalizada (APA, Chicago, Harvard).</li>\n</ul>\n</div>','string'),
(8,'es_ES','acronym','RITC','string'),
(8,'es_ES','authorGuidelines','<h3>Directrices para Autores</h3><p>Los manuscritos postulados deben cumplir los siguientes requisitos formales:</p><ul><li><strong>Estructura:</strong> Esquema IMRyD (Introducción, Metodología, Resultados y Discusión) en formato digital DOCX.</li><li><strong>Extensión:</strong> Entre 5.000 y 8.000 palabras incluyendo referencias.</li><li><strong>Resumen y palabras clave:</strong> Hasta 250 palabras en español e inglés, con 4 a 6 palabras clave normalizadas en tesauros internacionales (UNESCO).</li><li><strong>Citas y referencias:</strong> Aplicación de normas APA (7ma edición) con DOI activo en todas las fuentes digitales.</li></ul>','string'),
(8,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://localhost:8080/index.php/revista_ceibo/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://localhost:8080/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.',NULL),
(8,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>',NULL),
(8,'es_ES','competingInterests','<p>Los autores, revisores y editores deben declarar explícitamente cualquier conflicto de intereses potencial que pudiera condicionar la objetividad del manuscrito o de su proceso de evaluación.</p>','string'),
(8,'es_ES','contactAffiliation','Universidad Técnica de Manabí','string'),
(8,'es_ES','contactEmail','estudiante8@utm.edu.ec','string'),
(8,'es_ES','contactName','Estudiante 8','string'),
(8,'es_ES','contactTitle','Director / Editor en Jefe y Gestor de Revista','string'),
(8,'es_ES','description','Investigaciones en inteligencia artificial, desarrollo de software, ciberseguridad, telemática, ciencia de datos y sistemas computacionales.','string'),
(8,'es_ES','editorialTeam','<h3>Equipo Editorial</h3><p><strong>Director / Editor en Jefe y Gestor de Revista:</strong> Dr. Juan Pérez (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor Ejecutivo:</strong> Dr. Carlos Zambrano (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Gestora Editorial:</strong> Dra. Sofía Mendoza (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editora de Sección - Ciencias Agrarias y Ambientales:</strong> MSc. Elena Morales (Universidad Técnica de Manabí, Ecuador)</p><p><strong>Editor de Sección - Educación y Tecnologías:</strong> Dr. Roberto Alarcón (Universidad Técnica de Manabí, Ecuador)</p><hr><h3>Comité Científico Internacional</h3><ul><li><strong>Dra. Laura Restrepo:</strong> Universidad Nacional de Colombia (Bogotá, Colombia)</li><li><strong>Dr. Manuel Gómez de la Torre:</strong> Universidad de Salamanca (Salamanca, España)</li><li><strong>Dra. Beatriz Silva:</strong> Universidade de São Paulo (São Paulo, Brasil)</li><li><strong>Dr. Andrés Cárdenas:</strong> Universidad Nacional Autónoma de México (Ciudad de México, México)</li><li><strong>Dr. Fernando Castro:</strong> Universidad de Buenos Aires (Buenos Aires, Argentina)</li><li><strong>Dr. Nelson Pinargote:</strong> Universidad Técnica de Manabí (Portoviejo, Ecuador)</li></ul>','string'),
(8,'es_ES','focusScope','<p>La Revista Ceibo recibe contribuciones científicas en las siguientes áreas temáticas:</p><ul><li><strong>Ciencias Agrícolas, Ambientales y Recursos Naturales:</strong> Manejo de suelos, cuencas hidrográficas, conservación de ecosistemas tropicales y mitigación de cambio climático.</li><li><strong>Educación, Pedagogía e Innovación Curricular:</strong> Mediación tecnológica, inclusión educativa y gestión de la calidad en educación superior.</li><li><strong>Tecnologías de la Información y Gestión del Conocimiento:</strong> Inteligencia artificial aplicada, repositorios institucionales, ciencia abierta y gestión editorial.</li></ul>','string'),
(8,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),
(8,'es_ES','licenseTerms','<p>La Revista Ceibo publica todos sus contenidos bajo licencia <strong>Creative Commons Atribución-NoComercial 4.0 Internacional (CC BY-NC 4.0)</strong>. No aplica cargos por procesamiento de artículos (APC) ni por postulación.</p>','string'),
(8,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidades de preservación y restauración. <a href=\"https://lockss.org/\">Saber más...</a>',NULL),
(8,'es_ES','name','Revista de Informática y Tecnologías Computacionales','string'),
(8,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.',NULL),
(8,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>',NULL),
(8,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://localhost:8080/index.php/revista_ceibo/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://localhost:8080/index.php/revista_ceibo/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.',NULL),
(8,'es_ES','reviewGuidelines','<h3>Guía para Evaluadores/as por Pares</h3><p>La evaluación se realiza mediante formulario estructurado valorando:</p><ul><li>Originalidad y aporte al conocimiento</li><li>Rigor del diseño metodológico y reproducibilidad</li><li>Claridad en la presentación de resultados y validez de las conclusiones</li><li>Cumplimiento de estándares éticos y citación adecuada</li></ul>','string'),
(8,'es_ES','submissionChecklist','[{\"order\":1,\"content\":\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor\\/a).\"},{\"order\":2,\"content\":\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\"},{\"order\":3,\"content\":\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\"},{\"order\":4,\"content\":\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\"},{\"order\":5,\"content\":\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\\\"http:\\/\\/localhost:8080\\/index.php\\/revista_ceibo\\/about\\/submissions#authorGuidelines\\\" target=\\\"_new\\\">Directrices del autor\\/a<\\/a>, que aparecen en Acerca de la revista.\"}]',NULL),
(8,'es_ES','supportEmail','soporte.editorial@utm.edu.ec','string'),
(8,'es_ES','supportName','Soporte Técnico Editorial UTM','string');
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES
(1,'revista_ceibo',1.00,'es_ES',1),
(2,'agropecuaria',2.00,'es_ES',1),
(3,'educacion',3.00,'es_ES',1),
(4,'salud',4.00,'es_ES',1),
(5,'ingenieria',5.00,'es_ES',1),
(6,'economia',6.00,'es_ES',1),
(7,'sociales',7.00,'es_ES',1),
(8,'informatica',8.00,'es_ES',1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` smallint(6) DEFAULT 0,
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_description_settings`
--

LOCK TABLES `metadata_description_settings` WRITE;
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_descriptions`
--

LOCK TABLES `metadata_descriptions` WRITE;
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0,
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES
(1,1,1,0,0),
(2,1,2,0,1),
(3,1,3,0,2),
(4,1,4,3,0),
(5,1,5,3,1),
(6,1,6,3,2),
(7,1,7,3,3),
(8,2,8,0,0),
(9,2,9,0,1),
(10,2,10,0,2),
(11,2,11,10,0),
(12,2,12,10,1),
(13,2,13,10,2),
(14,2,14,10,3),
(15,3,15,0,0),
(16,3,16,0,1),
(17,3,17,0,2),
(18,3,18,0,3),
(19,3,19,18,0),
(20,3,20,18,1),
(21,3,21,18,2),
(22,3,22,18,3),
(23,3,23,18,4),
(24,4,25,0,0),
(25,4,26,0,1),
(26,4,27,0,2),
(27,4,28,27,0),
(28,4,29,27,1),
(29,4,30,27,2),
(30,4,31,27,3),
(31,5,32,0,0),
(32,5,33,0,1),
(33,5,34,0,2),
(34,5,35,0,3),
(35,5,36,35,0),
(36,5,37,35,1),
(37,5,38,35,2),
(38,5,39,35,3),
(39,5,40,35,4),
(40,6,42,0,0),
(41,6,43,0,1),
(42,6,44,0,2),
(43,6,45,44,0),
(44,6,46,44,1),
(45,6,47,44,2),
(46,6,48,44,3),
(47,7,49,0,0),
(48,7,50,0,1),
(49,7,51,0,2),
(50,7,52,0,3),
(51,7,53,52,0),
(52,7,54,52,1),
(53,7,55,52,2),
(54,7,56,52,3),
(55,7,57,52,4),
(56,8,59,0,0),
(57,8,60,0,1),
(58,8,61,0,2),
(59,8,62,61,0),
(60,8,63,61,1),
(61,8,64,61,2),
(62,8,65,61,3),
(63,9,66,0,0),
(64,9,67,0,1),
(65,9,68,0,2),
(66,9,69,0,3),
(67,9,70,69,0),
(68,9,71,69,1),
(69,9,72,69,2),
(70,9,73,69,3),
(71,9,74,69,4),
(72,10,76,0,0),
(73,10,77,0,1),
(74,10,78,0,2),
(75,10,79,78,0),
(76,10,80,78,1),
(77,10,81,78,2),
(78,10,82,78,3),
(79,11,83,0,0),
(80,11,84,0,1),
(81,11,85,0,2),
(82,11,86,0,3),
(83,11,87,86,0),
(84,11,88,86,1),
(85,11,89,86,2),
(86,11,90,86,3),
(87,11,91,86,4),
(88,12,93,0,0),
(89,12,94,0,1),
(90,12,95,0,2),
(91,12,96,95,0),
(92,12,97,95,1),
(93,12,98,95,2),
(94,12,99,95,3),
(95,13,100,0,0),
(96,13,101,0,1),
(97,13,102,0,2),
(98,13,103,0,3),
(99,13,104,103,0),
(100,13,105,103,1),
(101,13,106,103,2),
(102,13,107,103,3),
(103,13,108,103,4),
(104,14,110,0,0),
(105,14,111,0,1),
(106,14,112,0,2),
(107,14,113,112,0),
(108,14,114,112,1),
(109,14,115,112,2),
(110,14,116,112,3),
(111,15,117,0,0),
(112,15,118,0,1),
(113,15,119,0,2),
(114,15,120,0,3),
(115,15,121,120,0),
(116,15,122,120,1),
(117,15,123,120,2),
(118,15,124,120,3),
(119,15,125,120,4),
(120,16,127,0,0),
(121,16,128,0,1),
(122,16,129,0,2),
(123,16,130,129,0),
(124,16,131,129,1),
(125,16,132,129,2),
(126,16,133,129,3),
(127,17,134,0,0),
(128,17,135,0,1),
(129,17,136,0,2),
(130,17,137,0,3),
(131,17,138,137,0),
(132,17,139,137,1),
(133,17,140,137,2),
(134,17,141,137,3),
(135,17,142,137,4);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES
(1,'','titleLocaleKey','navigation.register','string'),
(2,'','titleLocaleKey','navigation.login','string'),
(3,'','titleLocaleKey','{$loggedInUsername}','string'),
(4,'','titleLocaleKey','navigation.dashboard','string'),
(5,'','titleLocaleKey','common.viewProfile','string'),
(6,'','titleLocaleKey','navigation.admin','string'),
(7,'','titleLocaleKey','user.logOut','string'),
(8,'','titleLocaleKey','navigation.register','string'),
(9,'','titleLocaleKey','navigation.login','string'),
(10,'','titleLocaleKey','{$loggedInUsername}','string'),
(11,'','titleLocaleKey','navigation.dashboard','string'),
(12,'','titleLocaleKey','common.viewProfile','string'),
(13,'','titleLocaleKey','navigation.admin','string'),
(14,'','titleLocaleKey','user.logOut','string'),
(15,'','titleLocaleKey','navigation.current','string'),
(16,'','titleLocaleKey','navigation.archives','string'),
(17,'','titleLocaleKey','manager.announcements','string'),
(18,'','titleLocaleKey','navigation.about','string'),
(19,'','titleLocaleKey','about.aboutContext','string'),
(20,'','titleLocaleKey','about.submissions','string'),
(21,'','titleLocaleKey','about.editorialTeam','string'),
(22,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(23,'','titleLocaleKey','about.contact','string'),
(24,'','titleLocaleKey','common.search','string'),
(25,'','titleLocaleKey','navigation.register','string'),
(26,'','titleLocaleKey','navigation.login','string'),
(27,'','titleLocaleKey','{$loggedInUsername}','string'),
(28,'','titleLocaleKey','navigation.dashboard','string'),
(29,'','titleLocaleKey','common.viewProfile','string'),
(30,'','titleLocaleKey','navigation.admin','string'),
(31,'','titleLocaleKey','user.logOut','string'),
(32,'','titleLocaleKey','navigation.current','string'),
(33,'','titleLocaleKey','navigation.archives','string'),
(34,'','titleLocaleKey','manager.announcements','string'),
(35,'','titleLocaleKey','navigation.about','string'),
(36,'','titleLocaleKey','about.aboutContext','string'),
(37,'','titleLocaleKey','about.submissions','string'),
(38,'','titleLocaleKey','about.editorialTeam','string'),
(39,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(40,'','titleLocaleKey','about.contact','string'),
(41,'','titleLocaleKey','common.search','string'),
(42,'','titleLocaleKey','navigation.register','string'),
(43,'','titleLocaleKey','navigation.login','string'),
(44,'','titleLocaleKey','{$loggedInUsername}','string'),
(45,'','titleLocaleKey','navigation.dashboard','string'),
(46,'','titleLocaleKey','common.viewProfile','string'),
(47,'','titleLocaleKey','navigation.admin','string'),
(48,'','titleLocaleKey','user.logOut','string'),
(49,'','titleLocaleKey','navigation.current','string'),
(50,'','titleLocaleKey','navigation.archives','string'),
(51,'','titleLocaleKey','manager.announcements','string'),
(52,'','titleLocaleKey','navigation.about','string'),
(53,'','titleLocaleKey','about.aboutContext','string'),
(54,'','titleLocaleKey','about.submissions','string'),
(55,'','titleLocaleKey','about.editorialTeam','string'),
(56,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(57,'','titleLocaleKey','about.contact','string'),
(58,'','titleLocaleKey','common.search','string'),
(59,'','titleLocaleKey','navigation.register','string'),
(60,'','titleLocaleKey','navigation.login','string'),
(61,'','titleLocaleKey','{$loggedInUsername}','string'),
(62,'','titleLocaleKey','navigation.dashboard','string'),
(63,'','titleLocaleKey','common.viewProfile','string'),
(64,'','titleLocaleKey','navigation.admin','string'),
(65,'','titleLocaleKey','user.logOut','string'),
(66,'','titleLocaleKey','navigation.current','string'),
(67,'','titleLocaleKey','navigation.archives','string'),
(68,'','titleLocaleKey','manager.announcements','string'),
(69,'','titleLocaleKey','navigation.about','string'),
(70,'','titleLocaleKey','about.aboutContext','string'),
(71,'','titleLocaleKey','about.submissions','string'),
(72,'','titleLocaleKey','about.editorialTeam','string'),
(73,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(74,'','titleLocaleKey','about.contact','string'),
(75,'','titleLocaleKey','common.search','string'),
(76,'','titleLocaleKey','navigation.register','string'),
(77,'','titleLocaleKey','navigation.login','string'),
(78,'','titleLocaleKey','{$loggedInUsername}','string'),
(79,'','titleLocaleKey','navigation.dashboard','string'),
(80,'','titleLocaleKey','common.viewProfile','string'),
(81,'','titleLocaleKey','navigation.admin','string'),
(82,'','titleLocaleKey','user.logOut','string'),
(83,'','titleLocaleKey','navigation.current','string'),
(84,'','titleLocaleKey','navigation.archives','string'),
(85,'','titleLocaleKey','manager.announcements','string'),
(86,'','titleLocaleKey','navigation.about','string'),
(87,'','titleLocaleKey','about.aboutContext','string'),
(88,'','titleLocaleKey','about.submissions','string'),
(89,'','titleLocaleKey','about.editorialTeam','string'),
(90,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(91,'','titleLocaleKey','about.contact','string'),
(92,'','titleLocaleKey','common.search','string'),
(93,'','titleLocaleKey','navigation.register','string'),
(94,'','titleLocaleKey','navigation.login','string'),
(95,'','titleLocaleKey','{$loggedInUsername}','string'),
(96,'','titleLocaleKey','navigation.dashboard','string'),
(97,'','titleLocaleKey','common.viewProfile','string'),
(98,'','titleLocaleKey','navigation.admin','string'),
(99,'','titleLocaleKey','user.logOut','string'),
(100,'','titleLocaleKey','navigation.current','string'),
(101,'','titleLocaleKey','navigation.archives','string'),
(102,'','titleLocaleKey','manager.announcements','string'),
(103,'','titleLocaleKey','navigation.about','string'),
(104,'','titleLocaleKey','about.aboutContext','string'),
(105,'','titleLocaleKey','about.submissions','string'),
(106,'','titleLocaleKey','about.editorialTeam','string'),
(107,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(108,'','titleLocaleKey','about.contact','string'),
(109,'','titleLocaleKey','common.search','string'),
(110,'','titleLocaleKey','navigation.register','string'),
(111,'','titleLocaleKey','navigation.login','string'),
(112,'','titleLocaleKey','{$loggedInUsername}','string'),
(113,'','titleLocaleKey','navigation.dashboard','string'),
(114,'','titleLocaleKey','common.viewProfile','string'),
(115,'','titleLocaleKey','navigation.admin','string'),
(116,'','titleLocaleKey','user.logOut','string'),
(117,'','titleLocaleKey','navigation.current','string'),
(118,'','titleLocaleKey','navigation.archives','string'),
(119,'','titleLocaleKey','manager.announcements','string'),
(120,'','titleLocaleKey','navigation.about','string'),
(121,'','titleLocaleKey','about.aboutContext','string'),
(122,'','titleLocaleKey','about.submissions','string'),
(123,'','titleLocaleKey','about.editorialTeam','string'),
(124,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(125,'','titleLocaleKey','about.contact','string'),
(126,'','titleLocaleKey','common.search','string'),
(127,'','titleLocaleKey','navigation.register','string'),
(128,'','titleLocaleKey','navigation.login','string'),
(129,'','titleLocaleKey','{$loggedInUsername}','string'),
(130,'','titleLocaleKey','navigation.dashboard','string'),
(131,'','titleLocaleKey','common.viewProfile','string'),
(132,'','titleLocaleKey','navigation.admin','string'),
(133,'','titleLocaleKey','user.logOut','string'),
(134,'','titleLocaleKey','navigation.current','string'),
(135,'','titleLocaleKey','navigation.archives','string'),
(136,'','titleLocaleKey','manager.announcements','string'),
(137,'','titleLocaleKey','navigation.about','string'),
(138,'','titleLocaleKey','about.aboutContext','string'),
(139,'','titleLocaleKey','about.submissions','string'),
(140,'','titleLocaleKey','about.editorialTeam','string'),
(141,'','titleLocaleKey','manager.setup.privacyStatement','string'),
(142,'','titleLocaleKey','about.contact','string'),
(143,'','titleLocaleKey','common.search','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES
(1,0,NULL,'NMI_TYPE_USER_REGISTER'),
(2,0,NULL,'NMI_TYPE_USER_LOGIN'),
(3,0,NULL,'NMI_TYPE_USER_DASHBOARD'),
(4,0,NULL,'NMI_TYPE_USER_DASHBOARD'),
(5,0,NULL,'NMI_TYPE_USER_PROFILE'),
(6,0,NULL,'NMI_TYPE_ADMINISTRATION'),
(7,0,NULL,'NMI_TYPE_USER_LOGOUT'),
(8,1,NULL,'NMI_TYPE_USER_REGISTER'),
(9,1,NULL,'NMI_TYPE_USER_LOGIN'),
(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),
(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),
(12,1,NULL,'NMI_TYPE_USER_PROFILE'),
(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),
(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),
(15,1,NULL,'NMI_TYPE_CURRENT'),
(16,1,NULL,'NMI_TYPE_ARCHIVES'),
(17,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(18,1,NULL,'NMI_TYPE_ABOUT'),
(19,1,NULL,'NMI_TYPE_ABOUT'),
(20,1,NULL,'NMI_TYPE_SUBMISSIONS'),
(21,1,NULL,'NMI_TYPE_EDITORIAL_TEAM'),
(22,1,NULL,'NMI_TYPE_PRIVACY'),
(23,1,NULL,'NMI_TYPE_CONTACT'),
(24,1,NULL,'NMI_TYPE_SEARCH'),
(25,2,NULL,'NMI_TYPE_USER_REGISTER'),
(26,2,NULL,'NMI_TYPE_USER_LOGIN'),
(27,2,NULL,'NMI_TYPE_USER_DASHBOARD'),
(28,2,NULL,'NMI_TYPE_USER_DASHBOARD'),
(29,2,NULL,'NMI_TYPE_USER_PROFILE'),
(30,2,NULL,'NMI_TYPE_ADMINISTRATION'),
(31,2,NULL,'NMI_TYPE_USER_LOGOUT'),
(32,2,NULL,'NMI_TYPE_CURRENT'),
(33,2,NULL,'NMI_TYPE_ARCHIVES'),
(34,2,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(35,2,NULL,'NMI_TYPE_ABOUT'),
(36,2,NULL,'NMI_TYPE_ABOUT'),
(37,2,NULL,'NMI_TYPE_SUBMISSIONS'),
(38,2,NULL,'NMI_TYPE_EDITORIAL_TEAM'),
(39,2,NULL,'NMI_TYPE_PRIVACY'),
(40,2,NULL,'NMI_TYPE_CONTACT'),
(41,2,NULL,'NMI_TYPE_SEARCH'),
(42,3,NULL,'NMI_TYPE_USER_REGISTER'),
(43,3,NULL,'NMI_TYPE_USER_LOGIN'),
(44,3,NULL,'NMI_TYPE_USER_DASHBOARD'),
(45,3,NULL,'NMI_TYPE_USER_DASHBOARD'),
(46,3,NULL,'NMI_TYPE_USER_PROFILE'),
(47,3,NULL,'NMI_TYPE_ADMINISTRATION'),
(48,3,NULL,'NMI_TYPE_USER_LOGOUT'),
(49,3,NULL,'NMI_TYPE_CURRENT'),
(50,3,NULL,'NMI_TYPE_ARCHIVES'),
(51,3,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(52,3,NULL,'NMI_TYPE_ABOUT'),
(53,3,NULL,'NMI_TYPE_ABOUT'),
(54,3,NULL,'NMI_TYPE_SUBMISSIONS'),
(55,3,NULL,'NMI_TYPE_EDITORIAL_TEAM'),
(56,3,NULL,'NMI_TYPE_PRIVACY'),
(57,3,NULL,'NMI_TYPE_CONTACT'),
(58,3,NULL,'NMI_TYPE_SEARCH'),
(59,4,NULL,'NMI_TYPE_USER_REGISTER'),
(60,4,NULL,'NMI_TYPE_USER_LOGIN'),
(61,4,NULL,'NMI_TYPE_USER_DASHBOARD'),
(62,4,NULL,'NMI_TYPE_USER_DASHBOARD'),
(63,4,NULL,'NMI_TYPE_USER_PROFILE'),
(64,4,NULL,'NMI_TYPE_ADMINISTRATION'),
(65,4,NULL,'NMI_TYPE_USER_LOGOUT'),
(66,4,NULL,'NMI_TYPE_CURRENT'),
(67,4,NULL,'NMI_TYPE_ARCHIVES'),
(68,4,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(69,4,NULL,'NMI_TYPE_ABOUT'),
(70,4,NULL,'NMI_TYPE_ABOUT'),
(71,4,NULL,'NMI_TYPE_SUBMISSIONS'),
(72,4,NULL,'NMI_TYPE_EDITORIAL_TEAM'),
(73,4,NULL,'NMI_TYPE_PRIVACY'),
(74,4,NULL,'NMI_TYPE_CONTACT'),
(75,4,NULL,'NMI_TYPE_SEARCH'),
(76,5,NULL,'NMI_TYPE_USER_REGISTER'),
(77,5,NULL,'NMI_TYPE_USER_LOGIN'),
(78,5,NULL,'NMI_TYPE_USER_DASHBOARD'),
(79,5,NULL,'NMI_TYPE_USER_DASHBOARD'),
(80,5,NULL,'NMI_TYPE_USER_PROFILE'),
(81,5,NULL,'NMI_TYPE_ADMINISTRATION'),
(82,5,NULL,'NMI_TYPE_USER_LOGOUT'),
(83,5,NULL,'NMI_TYPE_CURRENT'),
(84,5,NULL,'NMI_TYPE_ARCHIVES'),
(85,5,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(86,5,NULL,'NMI_TYPE_ABOUT'),
(87,5,NULL,'NMI_TYPE_ABOUT'),
(88,5,NULL,'NMI_TYPE_SUBMISSIONS'),
(89,5,NULL,'NMI_TYPE_EDITORIAL_TEAM'),
(90,5,NULL,'NMI_TYPE_PRIVACY'),
(91,5,NULL,'NMI_TYPE_CONTACT'),
(92,5,NULL,'NMI_TYPE_SEARCH'),
(93,6,NULL,'NMI_TYPE_USER_REGISTER'),
(94,6,NULL,'NMI_TYPE_USER_LOGIN'),
(95,6,NULL,'NMI_TYPE_USER_DASHBOARD'),
(96,6,NULL,'NMI_TYPE_USER_DASHBOARD'),
(97,6,NULL,'NMI_TYPE_USER_PROFILE'),
(98,6,NULL,'NMI_TYPE_ADMINISTRATION'),
(99,6,NULL,'NMI_TYPE_USER_LOGOUT'),
(100,6,NULL,'NMI_TYPE_CURRENT'),
(101,6,NULL,'NMI_TYPE_ARCHIVES'),
(102,6,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(103,6,NULL,'NMI_TYPE_ABOUT'),
(104,6,NULL,'NMI_TYPE_ABOUT'),
(105,6,NULL,'NMI_TYPE_SUBMISSIONS'),
(106,6,NULL,'NMI_TYPE_EDITORIAL_TEAM'),
(107,6,NULL,'NMI_TYPE_PRIVACY'),
(108,6,NULL,'NMI_TYPE_CONTACT'),
(109,6,NULL,'NMI_TYPE_SEARCH'),
(110,7,NULL,'NMI_TYPE_USER_REGISTER'),
(111,7,NULL,'NMI_TYPE_USER_LOGIN'),
(112,7,NULL,'NMI_TYPE_USER_DASHBOARD'),
(113,7,NULL,'NMI_TYPE_USER_DASHBOARD'),
(114,7,NULL,'NMI_TYPE_USER_PROFILE'),
(115,7,NULL,'NMI_TYPE_ADMINISTRATION'),
(116,7,NULL,'NMI_TYPE_USER_LOGOUT'),
(117,7,NULL,'NMI_TYPE_CURRENT'),
(118,7,NULL,'NMI_TYPE_ARCHIVES'),
(119,7,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(120,7,NULL,'NMI_TYPE_ABOUT'),
(121,7,NULL,'NMI_TYPE_ABOUT'),
(122,7,NULL,'NMI_TYPE_SUBMISSIONS'),
(123,7,NULL,'NMI_TYPE_EDITORIAL_TEAM'),
(124,7,NULL,'NMI_TYPE_PRIVACY'),
(125,7,NULL,'NMI_TYPE_CONTACT'),
(126,7,NULL,'NMI_TYPE_SEARCH'),
(127,8,NULL,'NMI_TYPE_USER_REGISTER'),
(128,8,NULL,'NMI_TYPE_USER_LOGIN'),
(129,8,NULL,'NMI_TYPE_USER_DASHBOARD'),
(130,8,NULL,'NMI_TYPE_USER_DASHBOARD'),
(131,8,NULL,'NMI_TYPE_USER_PROFILE'),
(132,8,NULL,'NMI_TYPE_ADMINISTRATION'),
(133,8,NULL,'NMI_TYPE_USER_LOGOUT'),
(134,8,NULL,'NMI_TYPE_CURRENT'),
(135,8,NULL,'NMI_TYPE_ARCHIVES'),
(136,8,NULL,'NMI_TYPE_ANNOUNCEMENTS'),
(137,8,NULL,'NMI_TYPE_ABOUT'),
(138,8,NULL,'NMI_TYPE_ABOUT'),
(139,8,NULL,'NMI_TYPE_SUBMISSIONS'),
(140,8,NULL,'NMI_TYPE_EDITORIAL_TEAM'),
(141,8,NULL,'NMI_TYPE_PRIVACY'),
(142,8,NULL,'NMI_TYPE_CONTACT'),
(143,8,NULL,'NMI_TYPE_SEARCH');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES
(1,0,'user','User Navigation Menu'),
(2,1,'user','User Navigation Menu'),
(3,1,'primary','Primary Navigation Menu'),
(4,2,'user','User Navigation Menu'),
(5,2,'primary','Primary Navigation Menu'),
(6,3,'user','User Navigation Menu'),
(7,3,'primary','Primary Navigation Menu'),
(8,4,'user','User Navigation Menu'),
(9,4,'primary','Primary Navigation Menu'),
(10,5,'user','User Navigation Menu'),
(11,5,'primary','Primary Navigation Menu'),
(12,6,'user','User Navigation Menu'),
(13,6,'primary','Primary Navigation Menu'),
(14,7,'user','User Navigation Menu'),
(15,7,'primary','Primary Navigation Menu'),
(16,8,'user','User Navigation Menu'),
(17,8,'primary','Primary Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES
(1,1048586,1,2,'2026-10-03 00:31:06','2026-10-03 00:31:06','Informe de Similitud y Detección de IA (Turnitin / iThenticate) - Unidad 5','<p><strong>REPORTE EDITORIAL DE ORIGINALIDAD Y DETECCIÓN DE IA (Turnitin / iThenticate)</strong></p><p><strong>Manuscrito ID:</strong> 18 - <em>Impacto del cambio climático en los cultivos de maíz y café en la cuenca del río Portoviejo</em></p><p><strong>Fecha de escaneo:</strong> 2026-03-01 | <strong>Filtros aplicados:</strong> Excluir bibliografía: SÍ; Excluir citas directas (&lt; 10 palabras): SÍ</p><hr/><h4>1. Resumen de Similitud Textual</h4><p><strong>Índice global de coincidencia:</strong> <span style=\"color: #27ae60; font-weight: bold;\">13%</span> (Dentro del umbral institucional máximo del 15%).</p><ul><li><strong>5.2% - Repositorio Institucional UTM (Tesis de posgrado 2024):</strong> Coincidencia concentrada en la delimitación geográfica y pluviométrica de la cuenca del río Portoviejo. Se clasifica como contextualización regional legítima sin intencionalidad de plagio.</li><li><strong>4.1% - Informes climatológicos oficiales (INAMHI / MAATE):</strong> Datos tabulares y definiciones normativas debidamente referenciadas con citas entrecomilladas en formato APA 7ma edición.</li><li><strong>3.7% - Fraseología metodológica recurrente:</strong> Descripciones de modelos de regresión y protocolos estándar de muestreo edafológico.</li></ul><hr/><h4>2. Detección de Asistencia de Inteligencia Artificial (IA Generativa)</h4><p><strong>Probabilidad calculada por clasificador heurístico:</strong> <span style=\"color: #e67e22; font-weight: bold;\">18%</span></p><ul><li><strong>Zonas marcadas:</strong> Párrafos 2 y 3 del marco conceptual (síntesis de literatura científica internacional sobre resiliencia agronómica).</li><li><strong>Declaración de los autores:</strong> En la sección metodológica, los autores declaran formalmente el empleo de Claude 3.5 Sonnet para asistencia estilística, mejora de fluidez en redacción académica y traducción de resúmenes al inglés, asumiendo la autoría y responsabilidad intelectual total de las ideas y datos.</li><li><strong>Dictamen técnico de IA:</strong> No se detectan citas ficticias ni alucinaciones bibliográficas. La estructura conceptual corresponde a datos empíricos de campo verificables.</li></ul><hr/><h4>3. Consigna de Práctica y Proyecto Integrador:</h4><p>El estudiante (en rol de Editor de Sección o Editor en Jefe) debe evaluar críticamente este informe, ponderar el uso ético declarado frente a los riesgos de falsos positivos, y registrar la decisión editorial de continuar con la ronda de revisión por pares o formular observaciones al autor.</p>'),
(2,1048586,2,2,'2026-10-03 00:31:06','2026-10-03 00:31:06','Control de Similitud Inicial - Pre-revisión (Unidad 1 y 2)','<p><strong>CONTROL DE RECEPCIÓN Y SIMILITUD INICIAL</strong></p><p><strong>Manuscrito:</strong> <em>Inteligencia artificial aplicada a la revisión por pares: oportunidades y dilemas éticos</em></p><p><strong>Índice de similitud inicial:</strong> 8% (Excelente originalidad).</p><p><strong>Detección de IA:</strong> 12% (Bajo, dentro de los márgenes normales de redacción formal técnica).</p><p><strong>Estado:</strong> Envío listo en fase de recepción para que el estudiante practique la asignación de editor de sección y la redacción del mensaje inicial al autor con asistencia de IA.</p>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint(6) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_list`
--

LOCK TABLES `notification_mail_list` WRITE;
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES
('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"classes.tasks.SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),
('acronplugin',0,'enabled','1','bool'),
('citationstylelanguageplugin',1,'enabled','1','bool'),
('citationstylelanguageplugin',1,'primaryCitationStyle','apa','string'),
('citationstylelanguageplugin',2,'enabled','1','bool'),
('citationstylelanguageplugin',2,'primaryCitationStyle','apa','string'),
('citationstylelanguageplugin',3,'enabled','1','bool'),
('citationstylelanguageplugin',3,'primaryCitationStyle','apa','string'),
('citationstylelanguageplugin',4,'enabled','1','bool'),
('citationstylelanguageplugin',4,'primaryCitationStyle','apa','string'),
('citationstylelanguageplugin',5,'enabled','1','bool'),
('citationstylelanguageplugin',5,'primaryCitationStyle','apa','string'),
('citationstylelanguageplugin',6,'enabled','1','bool'),
('citationstylelanguageplugin',6,'primaryCitationStyle','apa','string'),
('citationstylelanguageplugin',7,'enabled','1','bool'),
('citationstylelanguageplugin',7,'primaryCitationStyle','apa','string'),
('citationstylelanguageplugin',8,'enabled','1','bool'),
('citationstylelanguageplugin',8,'primaryCitationStyle','apa','string'),
('defaultthemeplugin',0,'enabled','1','bool'),
('defaultthemeplugin',1,'enabled','1','bool'),
('defaultthemeplugin',2,'enabled','1','bool'),
('defaultthemeplugin',3,'enabled','1','bool'),
('defaultthemeplugin',4,'enabled','1','bool'),
('defaultthemeplugin',5,'enabled','1','bool'),
('defaultthemeplugin',6,'enabled','1','bool'),
('defaultthemeplugin',7,'enabled','1','bool'),
('defaultthemeplugin',8,'enabled','1','bool'),
('developedbyblockplugin',0,'enabled','0','bool'),
('developedbyblockplugin',0,'seq','0','int'),
('developedbyblockplugin',1,'enabled','0','bool'),
('developedbyblockplugin',1,'seq','0','int'),
('developedbyblockplugin',2,'enabled','0','bool'),
('developedbyblockplugin',2,'seq','0','int'),
('developedbyblockplugin',3,'enabled','0','bool'),
('developedbyblockplugin',3,'seq','0','int'),
('developedbyblockplugin',4,'enabled','0','bool'),
('developedbyblockplugin',4,'seq','0','int'),
('developedbyblockplugin',5,'enabled','0','bool'),
('developedbyblockplugin',5,'seq','0','int'),
('developedbyblockplugin',6,'enabled','0','bool'),
('developedbyblockplugin',6,'seq','0','int'),
('developedbyblockplugin',7,'enabled','0','bool'),
('developedbyblockplugin',7,'seq','0','int'),
('developedbyblockplugin',8,'enabled','0','bool'),
('developedbyblockplugin',8,'seq','0','int'),
('dublincoremetaplugin',1,'enabled','1','bool'),
('dublincoremetaplugin',2,'enabled','1','bool'),
('dublincoremetaplugin',3,'enabled','1','bool'),
('dublincoremetaplugin',4,'enabled','1','bool'),
('dublincoremetaplugin',5,'enabled','1','bool'),
('dublincoremetaplugin',6,'enabled','1','bool'),
('dublincoremetaplugin',7,'enabled','1','bool'),
('dublincoremetaplugin',8,'enabled','1','bool'),
('googlescholarplugin',1,'enabled','1','bool'),
('googlescholarplugin',2,'enabled','1','bool'),
('googlescholarplugin',3,'enabled','1','bool'),
('googlescholarplugin',4,'enabled','1','bool'),
('googlescholarplugin',5,'enabled','1','bool'),
('googlescholarplugin',6,'enabled','1','bool'),
('googlescholarplugin',7,'enabled','1','bool'),
('googlescholarplugin',8,'enabled','1','bool'),
('htmlarticlegalleyplugin',1,'enabled','1','bool'),
('htmlarticlegalleyplugin',2,'enabled','1','bool'),
('htmlarticlegalleyplugin',3,'enabled','1','bool'),
('htmlarticlegalleyplugin',4,'enabled','1','bool'),
('htmlarticlegalleyplugin',5,'enabled','1','bool'),
('htmlarticlegalleyplugin',6,'enabled','1','bool'),
('htmlarticlegalleyplugin',7,'enabled','1','bool'),
('htmlarticlegalleyplugin',8,'enabled','1','bool'),
('informationblockplugin',1,'enabled','1','bool'),
('informationblockplugin',1,'seq','7','int'),
('informationblockplugin',2,'enabled','1','bool'),
('informationblockplugin',2,'seq','7','int'),
('informationblockplugin',3,'enabled','1','bool'),
('informationblockplugin',3,'seq','7','int'),
('informationblockplugin',4,'enabled','1','bool'),
('informationblockplugin',4,'seq','7','int'),
('informationblockplugin',5,'enabled','1','bool'),
('informationblockplugin',5,'seq','7','int'),
('informationblockplugin',6,'enabled','1','bool'),
('informationblockplugin',6,'seq','7','int'),
('informationblockplugin',7,'enabled','1','bool'),
('informationblockplugin',7,'seq','7','int'),
('informationblockplugin',8,'enabled','1','bool'),
('informationblockplugin',8,'seq','7','int'),
('languagetoggleblockplugin',0,'enabled','1','bool'),
('languagetoggleblockplugin',0,'seq','4','int'),
('languagetoggleblockplugin',1,'enabled','1','bool'),
('languagetoggleblockplugin',1,'seq','4','int'),
('languagetoggleblockplugin',2,'enabled','1','bool'),
('languagetoggleblockplugin',2,'seq','4','int'),
('languagetoggleblockplugin',3,'enabled','1','bool'),
('languagetoggleblockplugin',3,'seq','4','int'),
('languagetoggleblockplugin',4,'enabled','1','bool'),
('languagetoggleblockplugin',4,'seq','4','int'),
('languagetoggleblockplugin',5,'enabled','1','bool'),
('languagetoggleblockplugin',5,'seq','4','int'),
('languagetoggleblockplugin',6,'enabled','1','bool'),
('languagetoggleblockplugin',6,'seq','4','int'),
('languagetoggleblockplugin',7,'enabled','1','bool'),
('languagetoggleblockplugin',7,'seq','4','int'),
('languagetoggleblockplugin',8,'enabled','1','bool'),
('languagetoggleblockplugin',8,'seq','4','int'),
('lensgalleyplugin',1,'enabled','1','bool'),
('lensgalleyplugin',2,'enabled','1','bool'),
('lensgalleyplugin',3,'enabled','1','bool'),
('lensgalleyplugin',4,'enabled','1','bool'),
('lensgalleyplugin',5,'enabled','1','bool'),
('lensgalleyplugin',6,'enabled','1','bool'),
('lensgalleyplugin',7,'enabled','1','bool'),
('lensgalleyplugin',8,'enabled','1','bool'),
('orcidprofileplugin',1,'enabled','1','bool'),
('orcidprofileplugin',2,'enabled','1','bool'),
('orcidprofileplugin',3,'enabled','1','bool'),
('orcidprofileplugin',4,'enabled','1','bool'),
('orcidprofileplugin',5,'enabled','1','bool'),
('orcidprofileplugin',6,'enabled','1','bool'),
('orcidprofileplugin',7,'enabled','1','bool'),
('orcidprofileplugin',8,'enabled','1','bool'),
('pdfjsviewerplugin',1,'enabled','1','bool'),
('pdfjsviewerplugin',2,'enabled','1','bool'),
('pdfjsviewerplugin',3,'enabled','1','bool'),
('pdfjsviewerplugin',4,'enabled','1','bool'),
('pdfjsviewerplugin',5,'enabled','1','bool'),
('pdfjsviewerplugin',6,'enabled','1','bool'),
('pdfjsviewerplugin',7,'enabled','1','bool'),
('pdfjsviewerplugin',8,'enabled','1','bool'),
('resolverplugin',1,'enabled','1','bool'),
('resolverplugin',2,'enabled','1','bool'),
('resolverplugin',3,'enabled','1','bool'),
('resolverplugin',4,'enabled','1','bool'),
('resolverplugin',5,'enabled','1','bool'),
('resolverplugin',6,'enabled','1','bool'),
('resolverplugin',7,'enabled','1','bool'),
('resolverplugin',8,'enabled','1','bool'),
('subscriptionblockplugin',1,'enabled','1','bool'),
('subscriptionblockplugin',1,'seq','2','int'),
('subscriptionblockplugin',2,'enabled','1','bool'),
('subscriptionblockplugin',2,'seq','2','int'),
('subscriptionblockplugin',3,'enabled','1','bool'),
('subscriptionblockplugin',3,'seq','2','int'),
('subscriptionblockplugin',4,'enabled','1','bool'),
('subscriptionblockplugin',4,'seq','2','int'),
('subscriptionblockplugin',5,'enabled','1','bool'),
('subscriptionblockplugin',5,'seq','2','int'),
('subscriptionblockplugin',6,'enabled','1','bool'),
('subscriptionblockplugin',6,'seq','2','int'),
('subscriptionblockplugin',7,'enabled','1','bool'),
('subscriptionblockplugin',7,'seq','2','int'),
('subscriptionblockplugin',8,'enabled','1','bool'),
('subscriptionblockplugin',8,'seq','2','int'),
('tinymceplugin',0,'enabled','1','bool'),
('tinymceplugin',1,'enabled','1','bool'),
('tinymceplugin',2,'enabled','1','bool'),
('tinymceplugin',3,'enabled','1','bool'),
('tinymceplugin',4,'enabled','1','bool'),
('tinymceplugin',5,'enabled','1','bool'),
('tinymceplugin',6,'enabled','1','bool'),
('tinymceplugin',7,'enabled','1','bool'),
('tinymceplugin',8,'enabled','1','bool'),
('usageeventplugin',0,'enabled','1','bool'),
('usageeventplugin',0,'uniqueSiteId','6ac03c4a23321','string'),
('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),
('usagestatsplugin',0,'chartType','bar','string'),
('usagestatsplugin',0,'createLogFiles','1','bool'),
('usagestatsplugin',0,'datasetMaxCount','4','string'),
('usagestatsplugin',0,'enabled','1','bool'),
('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),
('webfeedplugin',1,'displayItems','1','bool'),
('webfeedplugin',1,'displayPage','homepage','string'),
('webfeedplugin',1,'enabled','1','bool'),
('webfeedplugin',2,'displayItems','1','bool'),
('webfeedplugin',2,'displayPage','homepage','string'),
('webfeedplugin',2,'enabled','1','bool'),
('webfeedplugin',3,'displayItems','1','bool'),
('webfeedplugin',3,'displayPage','homepage','string'),
('webfeedplugin',3,'enabled','1','bool'),
('webfeedplugin',4,'displayItems','1','bool'),
('webfeedplugin',4,'displayPage','homepage','string'),
('webfeedplugin',4,'enabled','1','bool'),
('webfeedplugin',5,'displayItems','1','bool'),
('webfeedplugin',5,'displayPage','homepage','string'),
('webfeedplugin',5,'enabled','1','bool'),
('webfeedplugin',6,'displayItems','1','bool'),
('webfeedplugin',6,'displayPage','homepage','string'),
('webfeedplugin',6,'enabled','1','bool'),
('webfeedplugin',7,'displayItems','1','bool'),
('webfeedplugin',7,'displayPage','homepage','string'),
('webfeedplugin',7,'enabled','1','bool'),
('webfeedplugin',8,'displayItems','1','bool'),
('webfeedplugin',8,'displayPage','homepage','string'),
('webfeedplugin',8,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galley_settings`
--

DROP TABLE IF EXISTS `publication_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galley_settings`
--

LOCK TABLES `publication_galley_settings` WRITE;
/*!40000 ALTER TABLE `publication_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galleys`
--

DROP TABLE IF EXISTS `publication_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES
(2,'es_ES',8,'PDF',1,1.00,NULL,1,NULL),
(3,'es_ES',9,'PDF',2,1.00,NULL,1,NULL),
(4,'es_ES',10,'PDF',3,1.00,NULL,1,NULL),
(5,'es_ES',11,'PDF',4,1.00,NULL,1,NULL),
(6,'es_ES',12,'PDF',5,1.00,NULL,1,NULL),
(7,'es_ES',13,'PDF',6,1.00,NULL,1,NULL),
(8,'es_ES',14,'PDF',7,1.00,NULL,1,NULL),
(9,'es_ES',15,'PDF',8,1.00,NULL,1,NULL),
(10,'es_ES',16,'PDF',9,1.00,NULL,1,NULL);
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_publication_id` (`publication_id`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES
(8,'','issueId','4'),
(8,'','pages','1-14'),
(8,'es_ES','abstract','Investigación empírica que examina la articulación de los pequeños productores de plátano y cacao en la provincia de Manabí, identificando cuellos de botella en la logística intermedia y proponiendo modelos de asociatividad sustentable.'),
(8,'es_ES','title','Desarrollo territorial y cadenas de valor agroalimentarias en la costa ecuatoriana'),
(9,'','issueId','4'),
(9,'','pages','15-28'),
(9,'es_ES','abstract','Estudio etnográfico que documenta saberes ancestrales en la alfarería tradicional y gastronomía montuvia, proponiendo lineamientos para la salvaguardia patrimonial comunitaria.'),
(9,'es_ES','title','Patrimonio cultural inmaterial y memoria oral en comunidades rurales de Manabí'),
(10,'','issueId','4'),
(10,'','pages','29-42'),
(10,'es_ES','abstract','Evaluación hidrológica de la microcuenca alta del río Chico frente a oscilaciones de precipitación, modelando escenarios de recarga de acuíferos y mitigación de inundaciones.'),
(10,'es_ES','title','Gestión de recursos hídricos superficiales y resiliencia ante eventos hidroclimáticos extremos'),
(11,'','issueId','5'),
(11,'','pages','1-16'),
(11,'es_ES','abstract','Experimento cuasiexperimental implementado en cuatro instituciones fiscales para medir la motivación y el rendimiento académico en álgebra mediante plataformas interactivas gamificadas.'),
(11,'es_ES','title','Estrategias de gamificación aplicadas a la enseñanza de matemáticas en el bachillerato'),
(12,'','issueId','5'),
(12,'','pages','17-31'),
(12,'es_ES','abstract','Diagnóstico sobre los niveles de dominio en diseño instruccional digital en el cuerpo docente universitario, planteando programas de capacitación continua basados en marcos internacionales.'),
(12,'es_ES','title','Competencias digitales docentes y entornos virtuales en la educación superior pública'),
(13,'','issueId','5'),
(13,'','pages','32-45'),
(13,'es_ES','abstract','Revisión sobre la adopción de recursos educativos abiertos y simuladores clínicos virtuales en facultades de ciencias de la salud en el contexto postpandemia.'),
(13,'es_ES','title','Ecosistemas de aprendizaje abierto y plataformas colaborativas en la formación médica'),
(14,'','issueId','6'),
(14,'','pages','1-18'),
(14,'es_ES','abstract','Este trabajo analiza la flora y fauna representativa de los remanentes de bosque seco tropical en la región central de Manabí, proponiendo estrategias de conservación comunitaria y corredores biológicos.'),
(14,'es_ES','title','Biodiversidad y conservación del bosque seco tropical en la provincia de Manabí'),
(15,'','issueId','6'),
(15,'','pages','19-33'),
(15,'es_ES','abstract','Monitoreo cuantitativo de microplásticos suspendidos en el estuario del río Chone y su correlación con la bioacumulación en especies bentónicas de interés pesquero y ambiental.'),
(15,'es_ES','title','Microplásticos en ecosistemas estuarinos y su impacto en comunidades de macroinvertebrados'),
(16,'','issueId','6'),
(16,'','pages','34-48'),
(16,'es_ES','abstract','Propuesta de valorización de la cascarilla de cacao para la elaboración de bioinsumos agrícolas y absorbentes industriales, evaluando viabilidad técnica, ambiental y financiera.'),
(16,'es_ES','title','Economía circular y aprovechamiento de biomasa residual en la agroindustria cacaotera'),
(17,'es_ES','abstract','Aplicación de ecuaciones universales de pérdida de suelo (RUSLE) integradas con sistemas de información geográfica para identificar zonas de alta vulnerabilidad a la degradación hídrica.'),
(17,'es_ES','title','Modelado predictivo de erosión hídrica en suelos agrícolas de la cuenca media del río Carrizal'),
(18,'es_ES','abstract','Evaluación de series temporales de precipitación y temperatura (2010-2025) y su correlación con el rendimiento agronómico en pequeños y medianos productores agrícolas de la provincia de Manabí.'),
(18,'es_ES','title','Impacto del cambio climático en los cultivos de maíz y café en la cuenca del río Portoviejo'),
(19,'es_ES','abstract','Se revisan las tendencias actuales de indización, interoperabilidad con OAI-PMH y sostenibilidad de las revistas científicas gestionadas con Open Journal Systems en instituciones de educación superior.'),
(19,'es_ES','title','Gestión editorial universitaria y políticas de acceso abierto en América Latina'),
(20,'es_ES','abstract','Estudio exploratorio sobre la viabilidad técnica y económica del uso de contratos inteligentes para el préstamo interbibliotecario en centros de educación básica.'),
(20,'es_ES','title','Análisis preliminar de tecnologías blockchain aplicadas a sistemas de bibliotecas escolares'),
(21,'es_ES','abstract','Un análisis crítico sobre el rol de los modelos de lenguaje de gran escala en la redacción, síntesis y dictamen de manuscritos científicos, proponiendo directrices éticas para evaluadores y comités editoriales.'),
(21,'es_ES','title','Inteligencia artificial aplicada a la revisión por pares: oportunidades y dilemas éticos');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_status` bigint(20) DEFAULT 0,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES
(8,0,'2025-06-30',NULL,NULL,8,1,0.00,8,3,NULL,1),
(9,0,'2025-06-30',NULL,NULL,9,1,0.00,9,3,NULL,1),
(10,0,'2025-06-30',NULL,NULL,10,1,0.00,10,3,NULL,1),
(11,0,'2025-12-15',NULL,NULL,11,1,0.00,11,3,NULL,1),
(12,0,'2025-12-15',NULL,NULL,12,1,0.00,12,3,NULL,1),
(13,0,'2025-12-15',NULL,NULL,13,1,0.00,13,3,NULL,1),
(14,0,'2026-03-15',NULL,NULL,14,1,0.00,14,3,NULL,1),
(15,0,'2026-03-15',NULL,NULL,15,1,0.00,15,3,NULL,1),
(16,0,'2026-03-15',NULL,NULL,16,1,0.00,16,3,NULL,1),
(17,0,NULL,NULL,NULL,17,1,0.00,17,1,NULL,1),
(18,0,NULL,NULL,NULL,18,1,0.00,18,1,NULL,1),
(19,0,NULL,NULL,NULL,19,1,0.00,19,1,NULL,1),
(20,0,NULL,NULL,NULL,20,1,0.00,20,4,NULL,1),
(21,0,NULL,NULL,NULL,21,1,0.00,21,1,NULL,1);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES
(1,1048585,18,3,1.00,'2026-10-03 00:31:06','2026-10-03 00:31:06',0),
(2,1048585,21,1,1.00,'2026-10-03 00:31:06','2026-10-03 00:31:06',0);
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
INSERT INTO `query_participants` VALUES
(1,2),
(1,4),
(2,2);
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES
(5,17,5,NULL,2,'2026-01-10 10:00:00',NULL,'2026-01-11 15:30:00','2026-01-25 18:00:00',NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,5,3,1,1,1,2,0),
(6,17,5,NULL,1,'2026-02-15 09:00:00',NULL,'2026-02-16 11:00:00','2026-03-01 16:30:00',NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,6,3,1,2,1,2,0),
(7,18,8,NULL,1,'2026-03-01 10:00:00',NULL,'2026-03-02 12:00:00','2026-03-20 17:00:00',NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,7,3,1,1,1,2,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
INSERT INTO `review_form_element_settings` VALUES
(3,'es_ES','possibleResponses','[{\"content\":\"Excelente (Aporte novedoso y relevante)\"},{\"content\":\"Bueno (Contribución pertinente con sustento adecuado)\"},{\"content\":\"Regular (Aporte limitado)\"},{\"content\":\"Deficiente (Sin novedad científica)\"}]','object'),
(3,'es_ES','question','Originalidad y pertinencia científica:','string'),
(4,'es_ES','possibleResponses','[{\"content\":\"Excelente (Metodología reproducible y robusta)\"},{\"content\":\"Bueno (Diseño adecuado con detalles menores a precisar)\"},{\"content\":\"Regular (Deficiencias metodológicas subsanables)\"},{\"content\":\"Deficiente (Metodología no válida)\"}]','object'),
(4,'es_ES','question','Rigor metodológico y diseño experimental:','string'),
(5,'es_ES','possibleResponses','[{\"content\":\"Excelente\"},{\"content\":\"Bueno\"},{\"content\":\"Aceptable\"},{\"content\":\"Deficiente\"}]','object'),
(5,'es_ES','question','Claridad en la exposición, figuras y tablas:','string'),
(6,'es_ES','question','Comentarios constructivos y observaciones específicas para los autores:','string'),
(7,'es_ES','question','Comentarios confidenciales dirigidos exclusivamente al Comité Editorial:','string');
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
INSERT INTO `review_form_elements` VALUES
(3,2,1.00,5,1,1),
(4,2,2.00,5,1,1),
(5,2,3.00,5,1,1),
(6,2,4.00,3,1,1),
(7,2,5.00,3,0,1);
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
INSERT INTO `review_form_responses` VALUES
(3,5,'string','Bueno (Contribución pertinente con sustento adecuado)'),
(4,5,'string','Regular (Deficiencias metodológicas subsanables)'),
(5,5,'string','Bueno'),
(6,5,'string','El trabajo es valioso y de gran pertinencia para la cuenca del Carrizal. No obstante, se requiere detallar mejor la calibración de los factores R y K en la metodología y actualizar la cartografía de pendientes a una escala más precisa.'),
(7,5,'string','El manuscrito tiene potencial pero amerita una segunda revisión tras corregir la calibración metodológica.'),
(3,6,'string','Excelente (Aporte novedoso y relevante)'),
(4,6,'string','Excelente (Metodología reproducible y robusta)'),
(5,6,'string','Excelente'),
(6,6,'string','Los autores atendieron satisfactoriamente todas las observaciones de la primera ronda. La calibración de los factores RUSLE quedó rigurosamente sustentada y las nuevas figuras cartográficas aportan gran claridad.'),
(7,6,'string','El artículo está listo para ser aceptado en su versión revisada.'),
(3,7,'string','Excelente (Aporte novedoso y relevante)'),
(4,7,'string','Bueno (Diseño adecuado con detalles menores a precisar)'),
(5,7,'string','Bueno'),
(6,7,'string','Investigación muy pertinente para la realidad agropecuaria de Portoviejo. Se recomienda armonizar las conclusiones con los intervalos de confianza reportados en las tablas 2 y 4.'),
(7,7,'string','Aceptable con mejoras mínimas de redacción en conclusiones.');
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
INSERT INTO `review_form_settings` VALUES
(2,'es_ES','description','Formulario oficial para el dictamen y evaluación de calidad científica, originalidad y rigor metodológico de manuscritos postulados a Revista Ceibo.','string'),
(2,'es_ES','title','Formulario Oficial de Arbitraje por Pares Ciegos - Revista Ceibo','string');
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
INSERT INTO `review_forms` VALUES
(2,256,1,1.00,1);
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
INSERT INTO `review_rounds` VALUES
(5,17,3,1,NULL,5),
(6,17,3,2,NULL,5),
(7,18,3,1,NULL,5);
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES
('classes.tasks.SubscriptionExpiryReminder','2026-10-02 23:16:20'),
('lib.pkp.classes.task.ReviewReminder','2026-10-02 23:16:20'),
('lib.pkp.classes.task.StatisticsReport','2026-10-02 23:16:20'),
('plugins.generic.usageStats.UsageStatsLoader','2026-10-02 23:16:20'),
('plugins.importexport.crossref.CrossrefInfoSender','2026-10-02 23:16:20'),
('plugins.importexport.datacite.DataciteInfoSender','2026-10-02 23:16:20'),
('plugins.importexport.doaj.DOAJInfoSender','2026-10-02 23:16:20');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES
(1,'es_ES','abbrev','ART','string'),
(1,'es_ES','policy','Política de sección por defecto','string'),
(1,'es_ES','title','Artículos','string'),
(2,'es_ES','abbrev','ART','string'),
(2,'es_ES','policy','Sección principal para artículos de investigación científica arbitrados por pares.','string'),
(2,'es_ES','title','Artículos Originales','string'),
(3,'es_ES','abbrev','ART','string'),
(3,'es_ES','policy','Sección principal para artículos de investigación científica arbitrados por pares.','string'),
(3,'es_ES','title','Artículos Originales','string'),
(4,'es_ES','abbrev','ART','string'),
(4,'es_ES','policy','Sección principal para artículos de investigación científica arbitrados por pares.','string'),
(4,'es_ES','title','Artículos Originales','string'),
(5,'es_ES','abbrev','ART','string'),
(5,'es_ES','policy','Sección principal para artículos de investigación científica arbitrados por pares.','string'),
(5,'es_ES','title','Artículos Originales','string'),
(6,'es_ES','abbrev','ART','string'),
(6,'es_ES','policy','Sección principal para artículos de investigación científica arbitrados por pares.','string'),
(6,'es_ES','title','Artículos Originales','string'),
(7,'es_ES','abbrev','ART','string'),
(7,'es_ES','policy','Sección principal para artículos de investigación científica arbitrados por pares.','string'),
(7,'es_ES','title','Artículos Originales','string'),
(8,'es_ES','abbrev','ART','string'),
(8,'es_ES','policy','Sección principal para artículos de investigación científica arbitrados por pares.','string'),
(8,'es_ES','title','Artículos Originales','string'),
(9,'es_ES','abbrev','ART','string'),
(9,'es_ES','policy','Sección principal para artículos de investigación científica arbitrados por pares.','string'),
(9,'es_ES','title','Artículos Originales','string');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `meta_indexed` smallint(6) NOT NULL DEFAULT 0,
  `meta_reviewed` smallint(6) NOT NULL DEFAULT 1,
  `abstracts_not_required` smallint(6) NOT NULL DEFAULT 0,
  `hide_title` smallint(6) NOT NULL DEFAULT 0,
  `hide_author` smallint(6) NOT NULL DEFAULT 0,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES
(1,1,0,0.00,0,1,1,0,0,0,0,0),
(3,2,NULL,0.00,0,1,1,0,0,0,0,0),
(4,3,NULL,0.00,0,1,1,0,0,0,0,0),
(5,4,NULL,0.00,0,1,1,0,0,0,0,0),
(6,5,NULL,0.00,0,1,1,0,0,0,0,0),
(7,6,NULL,0.00,0,1,1,0,0,0,0,0),
(8,7,NULL,0.00,0,1,1,0,0,0,0,0),
(9,8,NULL,0.00,0,1,1,0,0,0,0,0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` smallint(6) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('02isg8068l6qqot6vo9q08ujic',NULL,'192.168.65.1','curl/8.7.1',1790995715,1790995715,0,'','localhost'),
('0ek8uftjnc8rspl7armuq8fl0o',NULL,'192.168.65.1','curl/8.7.1',1790988279,1790988279,0,'','localhost'),
('0gf6jl57jifoa7rmfo0rn01a1h',NULL,'192.168.65.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0',1790988713,1790988713,0,'csrf|a:2:{s:9:\"timestamp\";i:1790988713;s:5:\"token\";s:32:\"eca1bcd1048d20918c293d7df220dea0\";}','localhost'),
('0jmir351fmjh69oiiphjav5mo5',NULL,'192.168.65.1','curl/8.7.1',1790995706,1790995706,0,'','localhost'),
('181jn8g3dd0huiojsp0m1tp6uf',NULL,'192.168.65.1','curl/8.7.1',1790987078,1790987078,0,'','localhost'),
('1pjti3lapm18pkv6d6k8l8v6hd',NULL,'192.168.65.1','curl/8.7.1',1790988564,1790988564,0,'csrf|a:2:{s:9:\"timestamp\";i:1790988564;s:5:\"token\";s:32:\"8c292ffbdddbd9b26de3a9f2955dad33\";}','localhost'),
('244e64am8t6s7fv7l1g0ev21rm',NULL,'192.168.65.1','curl/8.7.1',1790988269,1790988269,0,'','localhost'),
('36o9r7f8jslf5126d0ks79t31t',NULL,'192.168.65.1','curl/8.7.1',1790983866,1790983866,0,'','localhost'),
('3crvcc0ouf7l5lmmhjtpj4qo11',NULL,'192.168.65.1','curl/8.7.1',1790987478,1790987478,0,'','localhost'),
('3g35c9g35j3glgtnsfn30ih6fh',NULL,'192.168.65.1','curl/8.7.1',1790983921,1790983921,0,'','localhost'),
('3tng480ucva8qn52e2a54276k7',NULL,'192.168.65.1','curl/8.7.1',1790990004,1790990004,0,'','localhost'),
('49h029uihcbo225qqjut7cbt4t',NULL,'192.168.65.1','curl/8.7.1',1790986928,1790986928,0,'','localhost'),
('52ichmgjn8b9dar1chn4ks36m1',NULL,'192.168.65.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0',1790983228,1790983228,0,'csrf|a:2:{s:9:\"timestamp\";i:1790983228;s:5:\"token\";s:32:\"e7dde85efc199bb0c81ae0645f6017b5\";}','localhost'),
('52ldb884k767rjg2vovlssvug4',NULL,'192.168.65.1','curl/8.7.1',1790990008,1790990008,0,'','localhost'),
('6rp8mskektnfceknsr4h8hkvkk',NULL,'192.168.65.1','curl/8.7.1',1790988583,1790988583,0,'csrf|a:2:{s:9:\"timestamp\";i:1790988583;s:5:\"token\";s:32:\"4faba29009841cb8f35e66862aef1a3b\";}','localhost'),
('7aipti5k55sk0k5dcbslnh4g89',2,'192.168.65.1','curl/8.7.1',1790988608,1790988608,0,'userId|i:2;username|s:6:\"jperez\";csrf|a:2:{s:9:\"timestamp\";i:1790988608;s:5:\"token\";s:32:\"9945edbcdace0d6d965e929db49aee6d\";}','localhost'),
('80sah85hitqhu266oob4genf2k',NULL,'192.168.65.1','curl/8.7.1',1790988269,1790988269,0,'','localhost'),
('87sg0rbkjg0krsgt5311lpmk4v',NULL,'192.168.65.1','curl/8.7.1',1790986911,1790986911,0,'','localhost'),
('8r3vvud4kkn63c3quofrm7k6bh',NULL,'192.168.65.1','curl/8.7.1',1790986971,1790986971,0,'','localhost'),
('95mvb80celon6cpnt3q0uip43a',NULL,'192.168.65.1','curl/8.7.1',1790986908,1790986908,0,'','localhost'),
('9nfb2vjuifqm07ue6kls38l6dp',NULL,'192.168.65.1','curl/8.7.1',1790986954,1790986954,0,'','localhost'),
('ad9qht3efcsjbj05cg583907dk',NULL,'192.168.65.1','curl/8.7.1',1790987297,1790987297,0,'','localhost'),
('al715hqpdm3o0a7tke63h7blpu',NULL,'192.168.65.1','curl/8.7.1',1790988280,1790988280,0,'','localhost'),
('bb946874eegcq3qv7nfvv63v0g',NULL,'192.168.65.1','curl/8.7.1',1790986989,1790986989,0,'','localhost'),
('bldfe4im47dhb5j4brcuglj8c1',NULL,'192.168.65.1','curl/8.7.1',1790986921,1790986921,0,'','localhost'),
('cn0uhjh2ebb7ornt5gi7op6rk3',NULL,'192.168.65.1','curl/8.7.1',1790983927,1790983927,0,'','localhost'),
('cvcshq8nf7lv0kvmljur9p3q4g',NULL,'192.168.65.1','curl/8.7.1',1790989927,1790989927,0,'','test-codespace-8080.app.github.dev'),
('dbrvnrqjpgkboeg1gcqqkselec',NULL,'192.168.65.1','curl/8.7.1',1790986992,1790986992,0,'','localhost'),
('dkdupl9sv3vu2inbv358d8shpn',NULL,'192.168.65.1','curl/8.7.1',1790983931,1790983931,0,'','localhost'),
('e3bn5dgnfdtv9e9otsd8u8m9m5',NULL,'192.168.65.1','curl/8.7.1',1790989977,1790989977,0,'','localhost'),
('e43rdci8ivg4mi24l70dgkm3e6',NULL,'192.168.65.1','curl/8.7.1',1790983854,1790983854,0,'','localhost'),
('e50i4mfunejgs1uie1pfm6rb98',NULL,'192.168.65.1','curl/8.7.1',1790989929,1790989929,0,'','test-codespace-8080.app.github.dev'),
('ebaim16m8r03r9sc98ag7r0oju',NULL,'192.168.65.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0',1790983280,1790983280,0,'','localhost'),
('edpggntegj7juksro5cspmqsim',NULL,'192.168.65.1','curl/8.7.1',1790987079,1790987079,0,'','localhost'),
('ek2vqjlr77oaln9bm95etqk9no',NULL,'192.168.65.1','curl/8.7.1',1790986925,1790986925,0,'','localhost'),
('eme8ahvnv26ht3obnj7pnq5uk3',NULL,'192.168.65.1','curl/8.7.1',1790988616,1790988616,0,'csrf|a:2:{s:9:\"timestamp\";i:1790988616;s:5:\"token\";s:32:\"e1e206af1cf8297a15b847fac61a0021\";}','localhost'),
('fr9iad49khj22a49l34891ncjh',NULL,'192.168.65.1','curl/8.7.1',1790995715,1790995715,0,'','localhost'),
('h875ma3qbsud1po6j1q81ei1dj',NULL,'192.168.65.1','curl/8.7.1',1790989997,1790989997,0,'','test-codespace-8080.app.github.dev'),
('h9qt3k4dbmh5ui41ub2varl072',NULL,'192.168.65.1','curl/8.7.1',1790983556,1790983556,0,'','localhost'),
('ha11v705no551lquk1oqla15s2',NULL,'192.168.65.1','curl/8.7.1',1790989931,1790989931,0,'','test-codespace-8080.app.github.dev'),
('hfdsc3ti9jfb3gdenl41jqg2hd',NULL,'192.168.65.1','curl/8.7.1',1790995715,1790995715,0,'','localhost'),
('hor306l1gibtrni6kmvkbtj7vg',NULL,'192.168.65.1','curl/8.7.1',1790987722,1790987722,0,'','localhost'),
('i4f7j7jqf9724muf6sjc1klcfv',NULL,'192.168.65.1','curl/8.7.1',1790988275,1790988275,0,'','localhost'),
('iummg6mbqu9j7mv5vunoshl072',NULL,'192.168.65.1','curl/8.7.1',1790989999,1790989999,0,'','localhost'),
('j91cj2jo9vhh9hgvs667n2ku81',NULL,'192.168.65.1','curl/8.7.1',1790988034,1790988034,0,'','localhost'),
('jbnfvd2impa7h501m2al75n2mn',NULL,'192.168.65.1','curl/8.7.1',1790988050,1790988050,0,'','localhost'),
('jdbquuofgfbcm8la45bf2fe2ec',NULL,'192.168.65.1','curl/8.7.1',1790983861,1790983861,0,'','localhost'),
('jgdni95jd8icm1hidqafu6cvjp',2,'192.168.65.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/27.0.1 Safari/605.1.15',1790982972,1790988816,1,'csrf|a:2:{s:9:\"timestamp\";i:1790988816;s:5:\"token\";s:32:\"a54021700a0de75a9c66e08c6afe2c08\";}username|s:6:\"jperez\";userId|i:2;','localhost'),
('k4blpi7qqcgmfbu5rmi8hogs9q',NULL,'192.168.65.1','curl/8.7.1',1790983871,1790983871,0,'','localhost'),
('kthlb2epskkk41ef24255kbn49',NULL,'192.168.65.1','curl/8.7.1',1790987776,1790987776,0,'','localhost'),
('lacvjb9o6jtpaq906mcfel1tnk',NULL,'192.168.65.1','curl/8.7.1',1790988275,1790988275,0,'','localhost'),
('ncrh5gdt03eigmdktr22nsavgi',NULL,'192.168.65.1','curl/8.7.1',1790983560,1790983560,0,'','localhost'),
('nkljh4j9g71oo8bk020u6fspao',NULL,'192.168.65.1','curl/8.7.1',1790987734,1790987734,0,'','localhost'),
('nlvm9d591jfbeqosbf48uh9ack',NULL,'192.168.65.1','curl/8.7.1',1790995715,1790995715,0,'','localhost'),
('nq4fq3hc45t96ei3bn9c0qao4s',NULL,'192.168.65.1','curl/8.7.1',1790995715,1790995715,0,'','localhost'),
('oabk225qnikd2c30vkeqfr80h3',NULL,'192.168.65.1','curl/8.7.1',1790990145,1790990145,0,'','localhost'),
('opio5m8oedg1i3kmqnr9dsrcvh',NULL,'192.168.65.1','curl/8.7.1',1790988158,1790988158,0,'','localhost'),
('osqtimahjb9s6c3fmpstrr22oj',NULL,'192.168.65.1','curl/8.7.1',1790983853,1790983853,0,'','localhost'),
('ouf15vmv5576g9b7re07a0gvgo',NULL,'192.168.65.1','curl/8.7.1',1790995699,1790995699,0,'','localhost'),
('p6cm91sk5f8v6qbdvm6blc6o25',NULL,'192.168.65.1','curl/8.7.1',1790988063,1790988063,0,'','localhost'),
('pesvba7lmicu8v8e9uqnaq0te9',NULL,'192.168.65.1','curl/8.7.1',1790994326,1790994326,0,'','localhost'),
('pjkdgq41kculb67tlv26ej9o2o',NULL,'192.168.65.1','curl/8.7.1',1790987887,1790987887,0,'','localhost'),
('q39ddv1gbffqoacqrj5kqvg6vb',NULL,'192.168.65.1','curl/8.7.1',1790989987,1790989987,0,'','test-codespace-8080.app.github.dev'),
('q45gpld1ubmbf1opnuomunu2bo',NULL,'192.168.65.1','curl/8.7.1',1790988154,1790988154,0,'','localhost'),
('r7v8l22vodpnk5bgmi3a6i8gg4',NULL,'192.168.65.1','curl/8.7.1',1790990011,1790990011,0,'','test-codespace-8080.app.github.dev'),
('rcp3nl9j95e2kou7liq20fgihl',NULL,'192.168.65.1','curl/8.7.1',1790983511,1790983511,0,'','localhost'),
('rsi1oqsa90ls9n38gqruj71vf4',NULL,'192.168.65.1','curl/8.7.1',1790986957,1790986957,0,'','localhost'),
('rtfkmf3lp0orm1gmcog2gc6llj',NULL,'192.168.65.1','curl/8.7.1',1790995715,1790995715,0,'','localhost'),
('rvo9f2emlris5g97u5m2d6faen',NULL,'192.168.65.1','curl/8.7.1',1790988045,1790988045,0,'','localhost'),
('s0at4osuga1i4vmb2nu75ki113',NULL,'192.168.65.1','curl/8.7.1',1790995715,1790995715,0,'','localhost'),
('sqlpurtnogvq375jf05ku0tu8f',NULL,'192.168.65.1','curl/8.7.1',1790988569,1790988569,0,'csrf|a:2:{s:9:\"timestamp\";i:1790988569;s:5:\"token\";s:32:\"dca1c10a82ee55ca0fc9367cb3ad2767\";}','localhost'),
('sraut3kp2g8k6t3da45v50i402',NULL,'192.168.65.1','curl/8.7.1',1790995715,1790995715,0,'','localhost'),
('stctfqfrnke4omoicpt8r4u5kj',NULL,'192.168.65.1','curl/8.7.1',1790990004,1790990004,0,'','localhost'),
('tm2f7e9u7dpsiqje1u9t8ph7mk',NULL,'192.168.65.1','curl/8.7.1',1790989982,1790989982,0,'','localhost'),
('tn9pt44b4okh1hjohqsfvei7h4',NULL,'192.168.65.1','curl/8.7.1',1790987482,1790987482,0,'','localhost'),
('u2v9eqghqva3k1euulp3p59o09',NULL,'192.168.65.1','curl/8.7.1',1790987882,1790987882,0,'','localhost'),
('v08vsfh1iuitmp59ptfeq2irgj',NULL,'192.168.65.1','curl/8.7.1',1790987293,1790987293,0,'','localhost'),
('vfugtng7tgu91i4fhs4b7fbaaq',NULL,'192.168.65.1','curl/8.7.1',1790989984,1790989984,0,'','test-codespace-8080.app.github.dev');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES
(0,'es_ES',6,'[\"en_US\",\"es_ES\"]','[\"en_US\",\"es_ES\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES
('contactEmail','es_ES','jorge.parraga@utm.edu.ec'),
('contactName','en_US','Open Journal Systems'),
('contactName','es_ES','Open Journal Systems'),
('intro','es_ES','<p>Plataforma para la formación y práctica editorial de los estudiantes del Posgrado en Aplicaciones Informáticas para la Gestión Editorial de la Universidad Técnica de Manabí.</p>'),
('themePluginPath','','default'),
('title','en_US','Scientific Journals Portal - UTM Postgraduate'),
('title','es_ES','Portal de Revistas Científicas - UTM Posgrado');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES
(13,8,14,6,'2026-10-02 23:30:34',0,0),
(14,8,3,2,'2026-10-02 23:30:34',0,0),
(15,9,14,6,'2026-10-02 23:30:34',0,0),
(16,9,3,2,'2026-10-02 23:30:34',0,0),
(17,10,14,6,'2026-10-02 23:30:34',0,0),
(18,10,3,2,'2026-10-02 23:30:34',0,0),
(19,11,14,6,'2026-10-02 23:30:34',0,0),
(20,11,3,2,'2026-10-02 23:30:34',0,0),
(21,12,14,6,'2026-10-02 23:30:35',0,0),
(22,12,3,2,'2026-10-02 23:30:35',0,0),
(23,13,14,6,'2026-10-02 23:30:35',0,0),
(24,13,3,2,'2026-10-02 23:30:35',0,0),
(25,14,14,6,'2026-10-02 23:30:35',0,0),
(26,14,3,2,'2026-10-02 23:30:35',0,0),
(27,15,14,6,'2026-10-02 23:30:35',0,0),
(28,15,3,2,'2026-10-02 23:30:35',0,0),
(29,16,14,6,'2026-10-02 23:30:35',0,0),
(30,16,3,2,'2026-10-02 23:30:35',0,0),
(31,17,14,6,'2026-10-02 23:30:35',0,0),
(32,17,3,2,'2026-10-02 23:30:35',0,0),
(33,18,14,6,'2026-10-02 23:30:35',0,0),
(34,18,3,2,'2026-10-02 23:30:35',0,0),
(35,19,14,6,'2026-10-02 23:30:35',0,0),
(36,19,3,2,'2026-10-02 23:30:35',0,0),
(37,20,14,6,'2026-10-02 23:30:35',0,0),
(38,20,3,2,'2026-10-02 23:30:35',0,0),
(39,21,14,6,'2026-10-02 23:30:35',0,0);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subeditor_submission_group` (
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  KEY `submission_file_revisions_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES
(1,'es_ES','name','Articulo_8.pdf','string'),
(2,'es_ES','name','Articulo_9.pdf','string'),
(3,'es_ES','name','Articulo_10.pdf','string'),
(4,'es_ES','name','Articulo_11.pdf','string'),
(5,'es_ES','name','Articulo_12.pdf','string'),
(6,'es_ES','name','Articulo_13.pdf','string'),
(7,'es_ES','name','Articulo_14.pdf','string'),
(8,'es_ES','name','Articulo_15.pdf','string'),
(9,'es_ES','name','Articulo_16.pdf','string');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `source_submission_file_id` bigint(20) DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES
(1,8,2,NULL,1,10,NULL,NULL,1,'2026-10-03 00:40:29','2026-10-03 00:43:34',2,521,2),
(2,9,3,NULL,1,10,NULL,NULL,1,'2026-10-03 00:43:34','2026-10-03 00:43:34',2,521,3),
(3,10,4,NULL,1,10,NULL,NULL,1,'2026-10-03 00:43:34','2026-10-03 00:43:34',2,521,4),
(4,11,5,NULL,1,10,NULL,NULL,1,'2026-10-03 00:43:34','2026-10-03 00:43:34',2,521,5),
(5,12,6,NULL,1,10,NULL,NULL,1,'2026-10-03 00:43:34','2026-10-03 00:43:34',2,521,6),
(6,13,7,NULL,1,10,NULL,NULL,1,'2026-10-03 00:43:34','2026-10-03 00:43:34',2,521,7),
(7,14,8,NULL,1,10,NULL,NULL,1,'2026-10-03 00:43:34','2026-10-03 00:43:34',2,521,8),
(8,15,9,NULL,1,10,NULL,NULL,1,'2026-10-03 00:43:34','2026-10-03 00:43:34',2,521,9),
(9,16,10,NULL,1,10,NULL,NULL,1,'2026-10-03 00:43:34','2026-10-03 00:43:34',2,521,10);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES
(239,'2010-2025'),
(202,'abierto'),
(340,'abiertos'),
(288,'absorbentes'),
(384,'académico'),
(201,'acceso'),
(209,'actuales'),
(406,'acuíferos'),
(337,'adopción'),
(247,'agrícolas'),
(434,'agroalimentarias'),
(280,'agroindustria'),
(243,'agronómico'),
(196,'alarcón'),
(421,'alfarería'),
(385,'álgebra'),
(270,'alta'),
(291,'ambiental'),
(203,'américa'),
(148,'análisis'),
(319,'analiza'),
(420,'ancestrales'),
(331,'anchundia'),
(223,'andrea'),
(394,'ante'),
(259,'aplicación'),
(140,'aplicada'),
(177,'aplicadas'),
(332,'aprendizaje'),
(277,'aprovechamiento'),
(440,'articulación'),
(139,'artificial'),
(447,'asociatividad'),
(376,'bachillerato'),
(368,'basados'),
(194,'básica'),
(307,'bentónicas'),
(179,'bibliotecas'),
(305,'bioacumulación'),
(312,'biodiversidad'),
(287,'bioinsumos'),
(329,'biológicos'),
(278,'biomasa'),
(176,'blockchain'),
(314,'bosque'),
(444,'botella'),
(390,'bravo'),
(285,'cacao'),
(281,'cacaotera'),
(432,'cadenas'),
(230,'café'),
(226,'cambio'),
(366,'capacitación'),
(428,'carmen'),
(258,'carrizal'),
(284,'cascarilla'),
(251,'cedeño'),
(325,'central'),
(192,'centros'),
(400,'chico'),
(304,'chone'),
(345,'ciencias'),
(216,'científicas'),
(164,'científicos'),
(276,'circular'),
(227,'climático'),
(342,'clínicos'),
(334,'colaborativas'),
(170,'comités'),
(350,'competencias'),
(298,'comunidades'),
(327,'comunitaria'),
(212,'con'),
(313,'conservación'),
(347,'contexto'),
(367,'continua'),
(188,'contratos'),
(328,'corredores'),
(241,'correlación'),
(435,'costa'),
(149,'crítico'),
(301,'cuantitativo'),
(378,'cuasiexperimental'),
(380,'cuatro'),
(443,'cuellos'),
(231,'cuenca'),
(361,'cuerpo'),
(228,'cultivos'),
(412,'cultural'),
(153,'de'),
(272,'degradación'),
(186,'del'),
(274,'delgado'),
(430,'desarrollo'),
(355,'diagnóstico'),
(371,'diana'),
(162,'dictamen'),
(360,'digital'),
(351,'digitales'),
(146,'dilemas'),
(166,'directrices'),
(358,'diseño'),
(362,'docente'),
(352,'docentes'),
(418,'documenta'),
(357,'dominio'),
(275,'economía'),
(185,'económica'),
(296,'ecosistemas'),
(260,'ecuaciones'),
(436,'ecuatoriana'),
(198,'editorial'),
(171,'editoriales'),
(193,'educación'),
(339,'educativos'),
(151,'el'),
(286,'elaboración'),
(438,'empírica'),
(159,'en'),
(374,'enseñanza'),
(353,'entornos'),
(254,'erosión'),
(158,'escala'),
(404,'escenarios'),
(180,'escolares'),
(306,'especies'),
(317,'este'),
(326,'estrategias'),
(297,'estuarinos'),
(303,'estuario'),
(181,'estudio'),
(167,'éticas'),
(147,'éticos'),
(417,'etnográfico'),
(234,'evaluación'),
(169,'evaluadores'),
(290,'evaluando'),
(395,'eventos'),
(439,'examina'),
(377,'experimento'),
(182,'exploratorio'),
(397,'extremos'),
(273,'fabiola'),
(344,'facultades'),
(321,'fauna'),
(292,'financiera'),
(381,'fiscales'),
(320,'flora'),
(335,'formación'),
(401,'frente'),
(373,'gamificación'),
(388,'gamificadas'),
(423,'gastronomía'),
(267,'geográfica'),
(197,'gestión'),
(217,'gestionadas'),
(311,'gómez'),
(409,'gonzalo'),
(157,'gran'),
(255,'hídrica'),
(391,'hídricos'),
(396,'hidroclimáticos'),
(398,'hidrológica'),
(429,'holguín'),
(442,'identificando'),
(268,'identificar'),
(225,'impacto'),
(379,'implementado'),
(210,'indización'),
(289,'industriales'),
(266,'información'),
(413,'inmaterial'),
(221,'instituciones'),
(359,'instruccional'),
(265,'integradas'),
(138,'inteligencia'),
(189,'inteligentes'),
(387,'interactivas'),
(191,'interbibliotecario'),
(308,'interés'),
(446,'intermedia'),
(370,'internacionales'),
(211,'interoperabilidad'),
(408,'inundaciones'),
(437,'investigación'),
(250,'jorge'),
(219,'journal'),
(141,'la'),
(207,'las'),
(204,'latina'),
(156,'lenguaje'),
(425,'lineamientos'),
(445,'logística'),
(154,'los'),
(349,'lucas'),
(299,'macroinvertebrados'),
(229,'maíz'),
(249,'manabí'),
(163,'manuscritos'),
(369,'marcos'),
(310,'maría'),
(375,'matemáticas'),
(257,'media'),
(245,'medianos'),
(386,'mediante'),
(336,'médica'),
(382,'medir'),
(414,'memoria'),
(410,'mendoza'),
(399,'microcuenca'),
(295,'microplásticos'),
(407,'mitigación'),
(252,'modelado'),
(403,'modelando'),
(155,'modelos'),
(300,'monitoreo'),
(424,'montuvia'),
(173,'moreira'),
(383,'motivación'),
(293,'nelson'),
(356,'niveles'),
(213,'oai-pmh'),
(218,'open'),
(145,'oportunidades'),
(415,'oral'),
(402,'oscilaciones'),
(168,'para'),
(144,'pares'),
(136,'patricia'),
(427,'patrimonial'),
(411,'patrimonio'),
(172,'pedro'),
(244,'pequeños'),
(262,'pérdida'),
(309,'pesquero'),
(294,'pinargote'),
(364,'planteando'),
(333,'plataformas'),
(441,'plátano'),
(200,'políticas'),
(143,'por'),
(233,'portoviejo'),
(348,'postpandemia'),
(237,'precipitación'),
(253,'predictivo'),
(174,'preliminar'),
(190,'préstamo'),
(246,'productores'),
(365,'programas'),
(165,'proponiendo'),
(282,'propuesta'),
(248,'provincia'),
(354,'pública'),
(405,'recarga'),
(338,'recursos'),
(160,'redacción'),
(324,'región'),
(323,'remanentes'),
(242,'rendimiento'),
(322,'representativa'),
(279,'residual'),
(393,'resiliencia'),
(206,'revisan'),
(142,'revisión'),
(215,'revistas'),
(232,'río'),
(195,'roberto'),
(152,'rol'),
(416,'rurales'),
(264,'rusle'),
(419,'saberes'),
(346,'salud'),
(426,'salvaguardia'),
(205,'se'),
(315,'seco'),
(235,'series'),
(341,'simuladores'),
(161,'síntesis'),
(178,'sistemas'),
(150,'sobre'),
(137,'solórzano'),
(214,'sostenibilidad'),
(240,'su'),
(263,'suelo'),
(256,'suelos'),
(392,'superficiales'),
(222,'superior'),
(302,'suspendidos'),
(448,'sustentable'),
(220,'systems'),
(184,'técnica'),
(175,'tecnologías'),
(238,'temperatura'),
(236,'temporales'),
(208,'tendencias'),
(330,'teresa'),
(431,'territorial'),
(318,'trabajo'),
(422,'tradicional'),
(316,'tropical'),
(261,'universales'),
(199,'universitaria'),
(363,'universitario'),
(187,'uso'),
(433,'valor'),
(283,'valorización'),
(224,'vera'),
(183,'viabilidad'),
(372,'villacreses'),
(343,'virtuales'),
(271,'vulnerabilidad'),
(389,'xavier'),
(269,'zonas');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.',
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES
(41,136,0),
(41,137,1),
(42,138,0),
(42,139,1),
(42,140,2),
(42,141,3),
(43,141,14),
(51,141,3),
(66,141,11),
(67,141,20),
(74,141,9),
(75,141,21),
(82,141,7),
(83,141,4),
(83,141,9),
(91,141,14),
(98,141,7),
(99,141,3),
(99,141,15),
(106,141,7),
(107,141,2),
(107,141,16),
(114,141,6),
(122,141,4),
(123,141,9),
(131,141,3),
(139,141,6),
(139,141,14),
(146,141,7),
(147,141,3),
(147,141,13),
(147,141,22),
(42,142,4),
(107,142,0),
(42,143,5),
(42,144,6),
(42,145,7),
(42,146,8),
(42,147,9),
(43,148,0),
(50,148,0),
(43,149,1),
(43,150,2),
(51,150,2),
(107,150,1),
(115,150,1),
(43,151,3),
(51,151,13),
(67,151,11),
(91,151,6),
(107,151,19),
(115,151,11),
(122,151,9),
(123,151,11),
(43,152,4),
(43,153,5),
(43,153,8),
(43,153,10),
(43,153,18),
(50,153,2),
(50,153,7),
(51,153,9),
(51,153,18),
(58,153,4),
(59,153,5),
(59,153,11),
(59,153,22),
(66,153,7),
(67,153,1),
(67,153,4),
(67,153,19),
(67,153,22),
(74,153,2),
(74,153,8),
(75,153,1),
(75,153,4),
(75,153,6),
(75,153,12),
(75,153,18),
(82,153,3),
(83,153,1),
(83,153,3),
(83,153,6),
(83,153,11),
(90,153,8),
(91,153,2),
(91,153,19),
(98,153,9),
(99,153,7),
(99,153,10),
(99,153,18),
(99,153,22),
(106,153,1),
(107,153,4),
(107,153,13),
(107,153,15),
(115,153,4),
(115,153,17),
(122,153,1),
(122,153,6),
(130,153,1),
(131,153,2),
(131,153,11),
(131,153,15),
(131,153,17),
(131,153,20),
(138,153,8),
(146,153,3),
(147,153,5),
(147,153,9),
(147,153,15),
(147,153,19),
(147,153,27),
(43,154,6),
(66,154,5),
(99,154,8),
(115,154,2),
(147,154,6),
(43,155,7),
(147,155,26),
(43,156,9),
(43,157,11),
(43,158,12),
(43,159,13),
(51,159,16),
(58,159,7),
(59,159,20),
(66,159,4),
(66,159,10),
(67,159,14),
(74,159,5),
(82,159,6),
(90,159,1),
(90,159,6),
(91,159,5),
(91,159,16),
(98,159,6),
(99,159,14),
(106,159,6),
(107,159,11),
(107,159,18),
(114,159,5),
(115,159,6),
(115,159,10),
(115,159,21),
(122,159,8),
(123,159,3),
(123,159,14),
(138,159,5),
(139,159,5),
(146,159,6),
(147,159,12),
(147,159,21),
(43,160,15),
(43,161,16),
(43,162,17),
(43,163,19),
(43,164,20),
(43,165,21),
(99,165,20),
(139,165,11),
(147,165,25),
(43,166,22),
(43,167,23),
(43,168,24),
(51,168,12),
(75,168,15),
(83,168,8),
(123,168,7),
(139,168,13),
(43,169,25),
(43,170,26),
(43,171,27),
(49,172,0),
(49,173,1),
(50,174,1),
(50,175,3),
(50,176,4),
(50,177,5),
(122,177,3),
(50,178,6),
(75,178,11),
(50,179,8),
(50,180,9),
(51,181,0),
(139,181,0),
(51,182,1),
(51,183,4),
(83,183,17),
(51,184,5),
(83,184,18),
(51,185,6),
(51,186,7),
(66,186,1),
(66,186,13),
(74,186,12),
(91,186,8),
(98,186,2),
(131,186,6),
(51,187,8),
(51,188,10),
(51,189,11),
(51,190,14),
(51,191,15),
(51,192,17),
(51,193,19),
(59,193,23),
(114,193,7),
(51,194,20),
(57,195,0),
(57,196,1),
(58,197,0),
(130,197,0),
(58,198,1),
(58,199,2),
(58,200,3),
(58,201,5),
(58,202,6),
(106,202,3),
(58,203,8),
(58,204,9),
(59,205,0),
(59,206,1),
(59,207,2),
(59,207,12),
(59,208,3),
(59,209,4),
(59,210,6),
(59,211,7),
(59,212,8),
(59,212,16),
(67,212,10),
(75,212,10),
(91,212,13),
(59,213,9),
(59,214,10),
(59,215,13),
(59,216,14),
(59,217,15),
(59,218,17),
(59,219,18),
(59,220,19),
(59,221,21),
(123,221,5),
(59,222,24),
(114,222,8),
(65,223,0),
(65,224,1),
(66,225,0),
(90,225,5),
(66,226,2),
(66,227,3),
(66,228,6),
(66,229,8),
(66,230,9),
(66,231,12),
(74,231,10),
(66,232,14),
(74,232,13),
(91,232,9),
(131,232,7),
(66,233,15),
(67,234,0),
(131,234,0),
(67,235,2),
(67,236,3),
(67,237,5),
(131,237,12),
(67,238,6),
(67,239,7),
(67,240,8),
(90,240,4),
(91,240,11),
(67,241,9),
(91,241,12),
(67,242,12),
(123,242,12),
(67,243,13),
(67,244,15),
(147,244,7),
(67,245,16),
(67,246,17),
(147,246,8),
(67,247,18),
(74,247,7),
(83,247,13),
(67,248,21),
(98,248,8),
(147,248,14),
(67,249,23),
(98,249,10),
(99,249,19),
(138,249,9),
(147,249,16),
(73,250,0),
(113,250,0),
(73,251,1),
(74,252,0),
(74,253,1),
(74,254,3),
(74,255,4),
(75,255,23),
(74,256,6),
(74,257,11),
(74,258,14),
(75,259,0),
(75,260,2),
(75,261,3),
(75,262,5),
(75,263,7),
(75,264,8),
(75,265,9),
(75,266,13),
(75,267,14),
(75,268,16),
(75,269,17),
(75,270,19),
(131,270,5),
(75,271,20),
(75,272,22),
(81,273,0),
(81,274,1),
(82,275,0),
(82,276,1),
(82,277,2),
(82,278,4),
(82,279,5),
(82,280,8),
(82,281,9),
(83,282,0),
(83,283,2),
(83,284,5),
(83,285,7),
(147,285,11),
(83,286,10),
(83,287,12),
(83,288,14),
(83,289,15),
(83,290,16),
(83,291,19),
(91,291,22),
(83,292,20),
(89,293,0),
(89,294,1),
(90,295,0),
(91,295,3),
(90,296,2),
(106,296,0),
(90,297,3),
(90,298,7),
(138,298,6),
(90,299,9),
(91,300,0),
(91,301,1),
(91,302,4),
(91,303,7),
(91,304,10),
(91,305,15),
(91,306,17),
(91,307,18),
(91,308,20),
(91,309,21),
(97,310,0),
(97,311,1),
(98,312,0),
(98,313,1),
(99,313,23),
(98,314,3),
(99,314,11),
(98,315,4),
(99,315,12),
(98,316,5),
(99,316,13),
(99,317,0),
(99,318,1),
(99,319,2),
(99,320,4),
(99,321,5),
(99,322,6),
(99,323,9),
(99,324,16),
(99,325,17),
(99,326,21),
(122,326,0),
(99,327,24),
(139,327,17),
(99,328,25),
(99,329,26),
(105,330,0),
(105,331,1),
(106,332,2),
(106,333,4),
(123,333,17),
(106,334,5),
(106,335,8),
(106,336,9),
(107,337,3),
(107,338,5),
(130,338,2),
(107,339,6),
(107,340,7),
(107,341,8),
(107,342,9),
(107,343,10),
(114,343,4),
(107,344,12),
(107,345,14),
(107,346,17),
(107,347,20),
(107,348,21),
(113,349,1),
(114,350,0),
(114,351,1),
(114,352,2),
(114,353,3),
(114,354,9),
(115,355,0),
(115,356,3),
(115,357,5),
(115,358,7),
(115,359,8),
(115,360,9),
(115,361,12),
(115,362,13),
(115,363,14),
(115,364,15),
(115,365,16),
(115,366,18),
(115,367,19),
(115,368,20),
(115,369,22),
(115,370,23),
(121,371,0),
(121,372,1),
(122,373,2),
(122,374,5),
(122,375,7),
(122,376,10),
(123,377,0),
(123,378,1),
(123,379,2),
(123,380,4),
(123,381,6),
(123,382,8),
(123,383,10),
(123,384,13),
(123,385,15),
(123,386,16),
(123,387,18),
(123,388,19),
(129,389,0),
(129,390,1),
(130,391,3),
(130,392,4),
(130,393,5),
(130,394,6),
(130,395,7),
(130,396,8),
(130,397,9),
(131,398,1),
(131,399,4),
(131,400,8),
(131,401,9),
(131,402,10),
(131,403,13),
(131,404,14),
(131,405,16),
(131,406,18),
(131,407,19),
(131,408,21),
(137,409,0),
(137,410,1),
(138,411,0),
(138,412,1),
(138,413,2),
(138,414,3),
(138,415,4),
(138,416,7),
(139,417,1),
(139,418,2),
(139,419,3),
(139,420,4),
(139,421,7),
(139,422,8),
(139,423,9),
(139,424,10),
(139,425,12),
(139,426,15),
(139,427,16),
(145,428,0),
(145,429,1),
(146,430,0),
(146,431,1),
(146,432,2),
(146,433,4),
(146,434,5),
(146,435,8),
(146,436,9),
(147,437,0),
(147,438,1),
(147,439,2),
(147,440,4),
(147,441,10),
(147,442,17),
(147,443,18),
(147,444,20),
(147,445,23),
(147,446,24),
(147,447,28),
(147,448,29);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_object_submission` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES
(41,21,1,0),
(42,21,2,0),
(43,21,4,0),
(44,21,16,0),
(45,21,17,0),
(46,21,8,0),
(47,21,32,0),
(48,21,64,0),
(49,20,1,0),
(50,20,2,0),
(51,20,4,0),
(52,20,16,0),
(53,20,17,0),
(54,20,8,0),
(55,20,32,0),
(56,20,64,0),
(57,19,1,0),
(58,19,2,0),
(59,19,4,0),
(60,19,16,0),
(61,19,17,0),
(62,19,8,0),
(63,19,32,0),
(64,19,64,0),
(65,18,1,0),
(66,18,2,0),
(67,18,4,0),
(68,18,16,0),
(69,18,17,0),
(70,18,8,0),
(71,18,32,0),
(72,18,64,0),
(73,17,1,0),
(74,17,2,0),
(75,17,4,0),
(76,17,16,0),
(77,17,17,0),
(78,17,8,0),
(79,17,32,0),
(80,17,64,0),
(81,16,1,0),
(82,16,2,0),
(83,16,4,0),
(84,16,16,0),
(85,16,17,0),
(86,16,8,0),
(87,16,32,0),
(88,16,64,0),
(89,15,1,0),
(90,15,2,0),
(91,15,4,0),
(92,15,16,0),
(93,15,17,0),
(94,15,8,0),
(95,15,32,0),
(96,15,64,0),
(97,14,1,0),
(98,14,2,0),
(99,14,4,0),
(100,14,16,0),
(101,14,17,0),
(102,14,8,0),
(103,14,32,0),
(104,14,64,0),
(105,13,1,0),
(106,13,2,0),
(107,13,4,0),
(108,13,16,0),
(109,13,17,0),
(110,13,8,0),
(111,13,32,0),
(112,13,64,0),
(113,12,1,0),
(114,12,2,0),
(115,12,4,0),
(116,12,16,0),
(117,12,17,0),
(118,12,8,0),
(119,12,32,0),
(120,12,64,0),
(121,11,1,0),
(122,11,2,0),
(123,11,4,0),
(124,11,16,0),
(125,11,17,0),
(126,11,8,0),
(127,11,32,0),
(128,11,64,0),
(129,10,1,0),
(130,10,2,0),
(131,10,4,0),
(132,10,16,0),
(133,10,17,0),
(134,10,8,0),
(135,10,32,0),
(136,10,64,0),
(137,9,1,0),
(138,9,2,0),
(139,9,4,0),
(140,9,16,0),
(141,9,17,0),
(142,9,8,0),
(143,9,32,0),
(144,9,64,0),
(145,8,1,0),
(146,8,2,0),
(147,8,4,0),
(148,8,16,0),
(149,8,17,0),
(150,8,8,0),
(151,8,32,0),
(152,8,64,0);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_tombstones`
--

LOCK TABLES `submission_tombstones` WRITE;
/*!40000 ALTER TABLE `submission_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` smallint(6) NOT NULL DEFAULT 1,
  `work_type` smallint(6) DEFAULT 0,
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES
(8,1,8,'2026-10-02 23:30:34','2025-06-30 00:00:00',NULL,5,'es_ES',3,0,0),
(9,1,9,'2026-10-02 23:30:34','2025-06-30 00:00:00',NULL,5,'es_ES',3,0,0),
(10,1,10,'2026-10-02 23:30:34','2025-06-30 00:00:00',NULL,5,'es_ES',3,0,0),
(11,1,11,'2026-10-02 23:30:34','2025-12-15 00:00:00',NULL,5,'es_ES',3,0,0),
(12,1,12,'2026-10-02 23:30:34','2025-12-15 00:00:00',NULL,5,'es_ES',3,0,0),
(13,1,13,'2026-10-02 23:30:35','2025-12-15 00:00:00',NULL,5,'es_ES',3,0,0),
(14,1,14,'2026-10-02 23:30:35','2026-03-15 00:00:00',NULL,5,'es_ES',3,0,0),
(15,1,15,'2026-10-02 23:30:35','2026-03-15 00:00:00',NULL,5,'es_ES',3,0,0),
(16,1,16,'2026-10-02 23:30:35','2026-03-15 00:00:00',NULL,5,'es_ES',3,0,0),
(17,1,17,'2026-10-02 23:30:35','2026-10-02 23:30:35',NULL,3,'es_ES',1,0,0),
(18,1,18,'2026-10-02 23:30:35','2026-10-02 23:30:35',NULL,3,'es_ES',1,0,0),
(19,1,19,'2026-10-02 23:30:35','2026-10-02 23:30:35',NULL,5,'es_ES',1,0,0),
(20,1,20,'2026-10-02 23:30:35','2026-10-02 23:30:35',NULL,1,'es_ES',4,0,0),
(21,1,21,'2026-10-02 23:30:35','2026-10-02 23:30:35',NULL,1,'es_ES',1,0,0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_type_settings`
--

LOCK TABLES `subscription_type_settings` WRITE;
/*!40000 ALTER TABLE `subscription_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` smallint(6) NOT NULL DEFAULT 0,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` smallint(6) NOT NULL DEFAULT 0,
  `membership` smallint(6) NOT NULL DEFAULT 0,
  `disable_public_display` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_types`
--

LOCK TABLES `subscription_types` WRITE;
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT 1,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_temporary_records`
--

LOCK TABLES `usage_stats_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES
(1,'en_US','name','##default.groups.name.siteAdmin##','string'),
(1,'es_ES','name','Administrador/a del sitio','string'),
(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),
(2,'','nameLocaleKey','default.groups.name.manager','string'),
(2,'en_US','abbrev','JM','string'),
(2,'en_US','name','Journal manager','string'),
(2,'es_ES','abbrev','GR','string'),
(2,'es_ES','name','Gestor/a de la revista','string'),
(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),
(3,'','nameLocaleKey','default.groups.name.editor','string'),
(3,'en_US','abbrev','JE','string'),
(3,'en_US','name','Journal editor','string'),
(3,'es_ES','abbrev','ER','string'),
(3,'es_ES','name','Editor/a de la revista','string'),
(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),
(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),
(4,'en_US','abbrev','ProdE','string'),
(4,'en_US','name','Production editor','string'),
(4,'es_ES','abbrev','CoProd','string'),
(4,'es_ES','name','Coordinador/a de producción','string'),
(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),
(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),
(5,'en_US','abbrev','SecE','string'),
(5,'en_US','name','Section editor','string'),
(5,'es_ES','abbrev','ESec','string'),
(5,'es_ES','name','Editor/a de sección','string'),
(6,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),
(6,'','nameLocaleKey','default.groups.name.guestEditor','string'),
(6,'en_US','abbrev','GE','string'),
(6,'en_US','name','Guest editor','string'),
(6,'es_ES','abbrev','EI','string'),
(6,'es_ES','name','Editor/a invitado/a','string'),
(7,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),
(7,'','nameLocaleKey','default.groups.name.copyeditor','string'),
(7,'en_US','abbrev','CE','string'),
(7,'en_US','name','Copyeditor','string'),
(7,'es_ES','abbrev','CE','string'),
(7,'es_ES','name','Corrector/a de estilo','string'),
(8,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),
(8,'','nameLocaleKey','default.groups.name.designer','string'),
(8,'en_US','abbrev','Design','string'),
(8,'en_US','name','Designer','string'),
(8,'es_ES','abbrev','Diseño','string'),
(8,'es_ES','name','Diseñador/a','string'),
(9,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),
(9,'','nameLocaleKey','default.groups.name.funding','string'),
(9,'en_US','abbrev','FC','string'),
(9,'en_US','name','Funding coordinator','string'),
(9,'es_ES','abbrev','CF','string'),
(9,'es_ES','name','Coordinador/a de financiación','string'),
(10,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),
(10,'','nameLocaleKey','default.groups.name.indexer','string'),
(10,'en_US','abbrev','IND','string'),
(10,'en_US','name','Indexer','string'),
(10,'es_ES','abbrev','DOC','string'),
(10,'es_ES','name','Documentalista','string'),
(11,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),
(11,'','nameLocaleKey','default.groups.name.layoutEditor','string'),
(11,'en_US','abbrev','LE','string'),
(11,'en_US','name','Layout Editor','string'),
(11,'es_ES','abbrev','MAQ','string'),
(11,'es_ES','name','Maquetador/a','string'),
(12,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),
(12,'','nameLocaleKey','default.groups.name.marketing','string'),
(12,'en_US','abbrev','MS','string'),
(12,'en_US','name','Marketing and sales coordinator','string'),
(12,'es_ES','abbrev','MV','string'),
(12,'es_ES','name','Coordinador/a de marketing y ventas','string'),
(13,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),
(13,'','nameLocaleKey','default.groups.name.proofreader','string'),
(13,'en_US','abbrev','PR','string'),
(13,'en_US','name','Proofreader','string'),
(13,'es_ES','abbrev','CP','string'),
(13,'es_ES','name','Corrector/a de pruebas','string'),
(14,'','abbrevLocaleKey','default.groups.abbrev.author','string'),
(14,'','nameLocaleKey','default.groups.name.author','string'),
(14,'en_US','abbrev','AU','string'),
(14,'en_US','name','Author','string'),
(14,'es_ES','abbrev','AU','string'),
(14,'es_ES','name','Autor/a','string'),
(15,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),
(15,'','nameLocaleKey','default.groups.name.translator','string'),
(15,'en_US','abbrev','Trans','string'),
(15,'en_US','name','Translator','string'),
(15,'es_ES','abbrev','Trad','string'),
(15,'es_ES','name','Traductor/a','string'),
(16,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),
(16,'','nameLocaleKey','default.groups.name.externalReviewer','string'),
(16,'en_US','abbrev','R','string'),
(16,'en_US','name','Reviewer','string'),
(16,'es_ES','abbrev','R','string'),
(16,'es_ES','name','Revisor/a','string'),
(17,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),
(17,'','nameLocaleKey','default.groups.name.reader','string'),
(17,'en_US','abbrev','Read','string'),
(17,'en_US','name','Reader','string'),
(17,'es_ES','abbrev','Lect','string'),
(17,'es_ES','name','Lector/a','string'),
(18,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),
(18,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),
(18,'en_US','abbrev','SubM','string'),
(18,'en_US','name','Subscription Manager','string'),
(18,'es_ES','abbrev','GSus','string'),
(18,'es_ES','name','Gestor/a de suscripción','string'),
(19,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),
(19,'','nameLocaleKey','default.groups.name.manager','string'),
(19,'en_US','abbrev','JM','string'),
(19,'en_US','name','Journal manager','string'),
(19,'es_ES','abbrev','GR','string'),
(19,'es_ES','name','Gestor/a de la revista','string'),
(20,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),
(20,'','nameLocaleKey','default.groups.name.editor','string'),
(20,'en_US','abbrev','JE','string'),
(20,'en_US','name','Journal editor','string'),
(20,'es_ES','abbrev','ER','string'),
(20,'es_ES','name','Editor/a de la revista','string'),
(21,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),
(21,'','nameLocaleKey','default.groups.name.productionEditor','string'),
(21,'en_US','abbrev','ProdE','string'),
(21,'en_US','name','Production editor','string'),
(21,'es_ES','abbrev','CoProd','string'),
(21,'es_ES','name','Coordinador/a de producción','string'),
(22,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),
(22,'','nameLocaleKey','default.groups.name.sectionEditor','string'),
(22,'en_US','abbrev','SecE','string'),
(22,'en_US','name','Section editor','string'),
(22,'es_ES','abbrev','ESec','string'),
(22,'es_ES','name','Editor/a de sección','string'),
(23,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),
(23,'','nameLocaleKey','default.groups.name.guestEditor','string'),
(23,'en_US','abbrev','GE','string'),
(23,'en_US','name','Guest editor','string'),
(23,'es_ES','abbrev','EI','string'),
(23,'es_ES','name','Editor/a invitado/a','string'),
(24,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),
(24,'','nameLocaleKey','default.groups.name.copyeditor','string'),
(24,'en_US','abbrev','CE','string'),
(24,'en_US','name','Copyeditor','string'),
(24,'es_ES','abbrev','CE','string'),
(24,'es_ES','name','Corrector/a de estilo','string'),
(25,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),
(25,'','nameLocaleKey','default.groups.name.designer','string'),
(25,'en_US','abbrev','Design','string'),
(25,'en_US','name','Designer','string'),
(25,'es_ES','abbrev','Diseño','string'),
(25,'es_ES','name','Diseñador/a','string'),
(26,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),
(26,'','nameLocaleKey','default.groups.name.funding','string'),
(26,'en_US','abbrev','FC','string'),
(26,'en_US','name','Funding coordinator','string'),
(26,'es_ES','abbrev','CF','string'),
(26,'es_ES','name','Coordinador/a de financiación','string'),
(27,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),
(27,'','nameLocaleKey','default.groups.name.indexer','string'),
(27,'en_US','abbrev','IND','string'),
(27,'en_US','name','Indexer','string'),
(27,'es_ES','abbrev','DOC','string'),
(27,'es_ES','name','Documentalista','string'),
(28,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),
(28,'','nameLocaleKey','default.groups.name.layoutEditor','string'),
(28,'en_US','abbrev','LE','string'),
(28,'en_US','name','Layout Editor','string'),
(28,'es_ES','abbrev','MAQ','string'),
(28,'es_ES','name','Maquetador/a','string'),
(29,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),
(29,'','nameLocaleKey','default.groups.name.marketing','string'),
(29,'en_US','abbrev','MS','string'),
(29,'en_US','name','Marketing and sales coordinator','string'),
(29,'es_ES','abbrev','MV','string'),
(29,'es_ES','name','Coordinador/a de marketing y ventas','string'),
(30,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),
(30,'','nameLocaleKey','default.groups.name.proofreader','string'),
(30,'en_US','abbrev','PR','string'),
(30,'en_US','name','Proofreader','string'),
(30,'es_ES','abbrev','CP','string'),
(30,'es_ES','name','Corrector/a de pruebas','string'),
(31,'','abbrevLocaleKey','default.groups.abbrev.author','string'),
(31,'','nameLocaleKey','default.groups.name.author','string'),
(31,'en_US','abbrev','AU','string'),
(31,'en_US','name','Author','string'),
(31,'es_ES','abbrev','AU','string'),
(31,'es_ES','name','Autor/a','string'),
(32,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),
(32,'','nameLocaleKey','default.groups.name.translator','string'),
(32,'en_US','abbrev','Trans','string'),
(32,'en_US','name','Translator','string'),
(32,'es_ES','abbrev','Trad','string'),
(32,'es_ES','name','Traductor/a','string'),
(33,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),
(33,'','nameLocaleKey','default.groups.name.externalReviewer','string'),
(33,'en_US','abbrev','R','string'),
(33,'en_US','name','Reviewer','string'),
(33,'es_ES','abbrev','R','string'),
(33,'es_ES','name','Revisor/a','string'),
(34,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),
(34,'','nameLocaleKey','default.groups.name.reader','string'),
(34,'en_US','abbrev','Read','string'),
(34,'en_US','name','Reader','string'),
(34,'es_ES','abbrev','Lect','string'),
(34,'es_ES','name','Lector/a','string'),
(35,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),
(35,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),
(35,'en_US','abbrev','SubM','string'),
(35,'en_US','name','Subscription Manager','string'),
(35,'es_ES','abbrev','GSus','string'),
(35,'es_ES','name','Gestor/a de suscripción','string'),
(36,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),
(36,'','nameLocaleKey','default.groups.name.manager','string'),
(36,'en_US','abbrev','JM','string'),
(36,'en_US','name','Journal manager','string'),
(36,'es_ES','abbrev','GR','string'),
(36,'es_ES','name','Gestor/a de la revista','string'),
(37,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),
(37,'','nameLocaleKey','default.groups.name.editor','string'),
(37,'en_US','abbrev','JE','string'),
(37,'en_US','name','Journal editor','string'),
(37,'es_ES','abbrev','ER','string'),
(37,'es_ES','name','Editor/a de la revista','string'),
(38,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),
(38,'','nameLocaleKey','default.groups.name.productionEditor','string'),
(38,'en_US','abbrev','ProdE','string'),
(38,'en_US','name','Production editor','string'),
(38,'es_ES','abbrev','CoProd','string'),
(38,'es_ES','name','Coordinador/a de producción','string'),
(39,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),
(39,'','nameLocaleKey','default.groups.name.sectionEditor','string'),
(39,'en_US','abbrev','SecE','string'),
(39,'en_US','name','Section editor','string'),
(39,'es_ES','abbrev','ESec','string'),
(39,'es_ES','name','Editor/a de sección','string'),
(40,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),
(40,'','nameLocaleKey','default.groups.name.guestEditor','string'),
(40,'en_US','abbrev','GE','string'),
(40,'en_US','name','Guest editor','string'),
(40,'es_ES','abbrev','EI','string'),
(40,'es_ES','name','Editor/a invitado/a','string'),
(41,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),
(41,'','nameLocaleKey','default.groups.name.copyeditor','string'),
(41,'en_US','abbrev','CE','string'),
(41,'en_US','name','Copyeditor','string'),
(41,'es_ES','abbrev','CE','string'),
(41,'es_ES','name','Corrector/a de estilo','string'),
(42,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),
(42,'','nameLocaleKey','default.groups.name.designer','string'),
(42,'en_US','abbrev','Design','string'),
(42,'en_US','name','Designer','string'),
(42,'es_ES','abbrev','Diseño','string'),
(42,'es_ES','name','Diseñador/a','string'),
(43,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),
(43,'','nameLocaleKey','default.groups.name.funding','string'),
(43,'en_US','abbrev','FC','string'),
(43,'en_US','name','Funding coordinator','string'),
(43,'es_ES','abbrev','CF','string'),
(43,'es_ES','name','Coordinador/a de financiación','string'),
(44,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),
(44,'','nameLocaleKey','default.groups.name.indexer','string'),
(44,'en_US','abbrev','IND','string'),
(44,'en_US','name','Indexer','string'),
(44,'es_ES','abbrev','DOC','string'),
(44,'es_ES','name','Documentalista','string'),
(45,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),
(45,'','nameLocaleKey','default.groups.name.layoutEditor','string'),
(45,'en_US','abbrev','LE','string'),
(45,'en_US','name','Layout Editor','string'),
(45,'es_ES','abbrev','MAQ','string'),
(45,'es_ES','name','Maquetador/a','string'),
(46,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),
(46,'','nameLocaleKey','default.groups.name.marketing','string'),
(46,'en_US','abbrev','MS','string'),
(46,'en_US','name','Marketing and sales coordinator','string'),
(46,'es_ES','abbrev','MV','string'),
(46,'es_ES','name','Coordinador/a de marketing y ventas','string'),
(47,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),
(47,'','nameLocaleKey','default.groups.name.proofreader','string'),
(47,'en_US','abbrev','PR','string'),
(47,'en_US','name','Proofreader','string'),
(47,'es_ES','abbrev','CP','string'),
(47,'es_ES','name','Corrector/a de pruebas','string'),
(48,'','abbrevLocaleKey','default.groups.abbrev.author','string'),
(48,'','nameLocaleKey','default.groups.name.author','string'),
(48,'en_US','abbrev','AU','string'),
(48,'en_US','name','Author','string'),
(48,'es_ES','abbrev','AU','string'),
(48,'es_ES','name','Autor/a','string'),
(49,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),
(49,'','nameLocaleKey','default.groups.name.translator','string'),
(49,'en_US','abbrev','Trans','string'),
(49,'en_US','name','Translator','string'),
(49,'es_ES','abbrev','Trad','string'),
(49,'es_ES','name','Traductor/a','string'),
(50,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),
(50,'','nameLocaleKey','default.groups.name.externalReviewer','string'),
(50,'en_US','abbrev','R','string'),
(50,'en_US','name','Reviewer','string'),
(50,'es_ES','abbrev','R','string'),
(50,'es_ES','name','Revisor/a','string'),
(51,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),
(51,'','nameLocaleKey','default.groups.name.reader','string'),
(51,'en_US','abbrev','Read','string'),
(51,'en_US','name','Reader','string'),
(51,'es_ES','abbrev','Lect','string'),
(51,'es_ES','name','Lector/a','string'),
(52,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),
(52,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),
(52,'en_US','abbrev','SubM','string'),
(52,'en_US','name','Subscription Manager','string'),
(52,'es_ES','abbrev','GSus','string'),
(52,'es_ES','name','Gestor/a de suscripción','string'),
(53,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),
(53,'','nameLocaleKey','default.groups.name.manager','string'),
(53,'en_US','abbrev','JM','string'),
(53,'en_US','name','Journal manager','string'),
(53,'es_ES','abbrev','GR','string'),
(53,'es_ES','name','Gestor/a de la revista','string'),
(54,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),
(54,'','nameLocaleKey','default.groups.name.editor','string'),
(54,'en_US','abbrev','JE','string'),
(54,'en_US','name','Journal editor','string'),
(54,'es_ES','abbrev','ER','string'),
(54,'es_ES','name','Editor/a de la revista','string'),
(55,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),
(55,'','nameLocaleKey','default.groups.name.productionEditor','string'),
(55,'en_US','abbrev','ProdE','string'),
(55,'en_US','name','Production editor','string'),
(55,'es_ES','abbrev','CoProd','string'),
(55,'es_ES','name','Coordinador/a de producción','string'),
(56,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),
(56,'','nameLocaleKey','default.groups.name.sectionEditor','string'),
(56,'en_US','abbrev','SecE','string'),
(56,'en_US','name','Section editor','string'),
(56,'es_ES','abbrev','ESec','string'),
(56,'es_ES','name','Editor/a de sección','string'),
(57,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),
(57,'','nameLocaleKey','default.groups.name.guestEditor','string'),
(57,'en_US','abbrev','GE','string'),
(57,'en_US','name','Guest editor','string'),
(57,'es_ES','abbrev','EI','string'),
(57,'es_ES','name','Editor/a invitado/a','string'),
(58,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),
(58,'','nameLocaleKey','default.groups.name.copyeditor','string'),
(58,'en_US','abbrev','CE','string'),
(58,'en_US','name','Copyeditor','string'),
(58,'es_ES','abbrev','CE','string'),
(58,'es_ES','name','Corrector/a de estilo','string'),
(59,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),
(59,'','nameLocaleKey','default.groups.name.designer','string'),
(59,'en_US','abbrev','Design','string'),
(59,'en_US','name','Designer','string'),
(59,'es_ES','abbrev','Diseño','string'),
(59,'es_ES','name','Diseñador/a','string'),
(60,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),
(60,'','nameLocaleKey','default.groups.name.funding','string'),
(60,'en_US','abbrev','FC','string'),
(60,'en_US','name','Funding coordinator','string'),
(60,'es_ES','abbrev','CF','string'),
(60,'es_ES','name','Coordinador/a de financiación','string'),
(61,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),
(61,'','nameLocaleKey','default.groups.name.indexer','string'),
(61,'en_US','abbrev','IND','string'),
(61,'en_US','name','Indexer','string'),
(61,'es_ES','abbrev','DOC','string'),
(61,'es_ES','name','Documentalista','string'),
(62,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),
(62,'','nameLocaleKey','default.groups.name.layoutEditor','string'),
(62,'en_US','abbrev','LE','string'),
(62,'en_US','name','Layout Editor','string'),
(62,'es_ES','abbrev','MAQ','string'),
(62,'es_ES','name','Maquetador/a','string'),
(63,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),
(63,'','nameLocaleKey','default.groups.name.marketing','string'),
(63,'en_US','abbrev','MS','string'),
(63,'en_US','name','Marketing and sales coordinator','string'),
(63,'es_ES','abbrev','MV','string'),
(63,'es_ES','name','Coordinador/a de marketing y ventas','string'),
(64,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),
(64,'','nameLocaleKey','default.groups.name.proofreader','string'),
(64,'en_US','abbrev','PR','string'),
(64,'en_US','name','Proofreader','string'),
(64,'es_ES','abbrev','CP','string'),
(64,'es_ES','name','Corrector/a de pruebas','string'),
(65,'','abbrevLocaleKey','default.groups.abbrev.author','string'),
(65,'','nameLocaleKey','default.groups.name.author','string'),
(65,'en_US','abbrev','AU','string'),
(65,'en_US','name','Author','string'),
(65,'es_ES','abbrev','AU','string'),
(65,'es_ES','name','Autor/a','string'),
(66,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),
(66,'','nameLocaleKey','default.groups.name.translator','string'),
(66,'en_US','abbrev','Trans','string'),
(66,'en_US','name','Translator','string'),
(66,'es_ES','abbrev','Trad','string'),
(66,'es_ES','name','Traductor/a','string'),
(67,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),
(67,'','nameLocaleKey','default.groups.name.externalReviewer','string'),
(67,'en_US','abbrev','R','string'),
(67,'en_US','name','Reviewer','string'),
(67,'es_ES','abbrev','R','string'),
(67,'es_ES','name','Revisor/a','string'),
(68,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),
(68,'','nameLocaleKey','default.groups.name.reader','string'),
(68,'en_US','abbrev','Read','string'),
(68,'en_US','name','Reader','string'),
(68,'es_ES','abbrev','Lect','string'),
(68,'es_ES','name','Lector/a','string'),
(69,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),
(69,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),
(69,'en_US','abbrev','SubM','string'),
(69,'en_US','name','Subscription Manager','string'),
(69,'es_ES','abbrev','GSus','string'),
(69,'es_ES','name','Gestor/a de suscripción','string'),
(70,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),
(70,'','nameLocaleKey','default.groups.name.manager','string'),
(70,'en_US','abbrev','JM','string'),
(70,'en_US','name','Journal manager','string'),
(70,'es_ES','abbrev','GR','string'),
(70,'es_ES','name','Gestor/a de la revista','string'),
(71,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),
(71,'','nameLocaleKey','default.groups.name.editor','string'),
(71,'en_US','abbrev','JE','string'),
(71,'en_US','name','Journal editor','string'),
(71,'es_ES','abbrev','ER','string'),
(71,'es_ES','name','Editor/a de la revista','string'),
(72,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),
(72,'','nameLocaleKey','default.groups.name.productionEditor','string'),
(72,'en_US','abbrev','ProdE','string'),
(72,'en_US','name','Production editor','string'),
(72,'es_ES','abbrev','CoProd','string'),
(72,'es_ES','name','Coordinador/a de producción','string'),
(73,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),
(73,'','nameLocaleKey','default.groups.name.sectionEditor','string'),
(73,'en_US','abbrev','SecE','string'),
(73,'en_US','name','Section editor','string'),
(73,'es_ES','abbrev','ESec','string'),
(73,'es_ES','name','Editor/a de sección','string'),
(74,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),
(74,'','nameLocaleKey','default.groups.name.guestEditor','string'),
(74,'en_US','abbrev','GE','string'),
(74,'en_US','name','Guest editor','string'),
(74,'es_ES','abbrev','EI','string'),
(74,'es_ES','name','Editor/a invitado/a','string'),
(75,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),
(75,'','nameLocaleKey','default.groups.name.copyeditor','string'),
(75,'en_US','abbrev','CE','string'),
(75,'en_US','name','Copyeditor','string'),
(75,'es_ES','abbrev','CE','string'),
(75,'es_ES','name','Corrector/a de estilo','string'),
(76,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),
(76,'','nameLocaleKey','default.groups.name.designer','string'),
(76,'en_US','abbrev','Design','string'),
(76,'en_US','name','Designer','string'),
(76,'es_ES','abbrev','Diseño','string'),
(76,'es_ES','name','Diseñador/a','string'),
(77,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),
(77,'','nameLocaleKey','default.groups.name.funding','string'),
(77,'en_US','abbrev','FC','string'),
(77,'en_US','name','Funding coordinator','string'),
(77,'es_ES','abbrev','CF','string'),
(77,'es_ES','name','Coordinador/a de financiación','string'),
(78,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),
(78,'','nameLocaleKey','default.groups.name.indexer','string'),
(78,'en_US','abbrev','IND','string'),
(78,'en_US','name','Indexer','string'),
(78,'es_ES','abbrev','DOC','string'),
(78,'es_ES','name','Documentalista','string'),
(79,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),
(79,'','nameLocaleKey','default.groups.name.layoutEditor','string'),
(79,'en_US','abbrev','LE','string'),
(79,'en_US','name','Layout Editor','string'),
(79,'es_ES','abbrev','MAQ','string'),
(79,'es_ES','name','Maquetador/a','string'),
(80,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),
(80,'','nameLocaleKey','default.groups.name.marketing','string'),
(80,'en_US','abbrev','MS','string'),
(80,'en_US','name','Marketing and sales coordinator','string'),
(80,'es_ES','abbrev','MV','string'),
(80,'es_ES','name','Coordinador/a de marketing y ventas','string'),
(81,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),
(81,'','nameLocaleKey','default.groups.name.proofreader','string'),
(81,'en_US','abbrev','PR','string'),
(81,'en_US','name','Proofreader','string'),
(81,'es_ES','abbrev','CP','string'),
(81,'es_ES','name','Corrector/a de pruebas','string'),
(82,'','abbrevLocaleKey','default.groups.abbrev.author','string'),
(82,'','nameLocaleKey','default.groups.name.author','string'),
(82,'en_US','abbrev','AU','string'),
(82,'en_US','name','Author','string'),
(82,'es_ES','abbrev','AU','string'),
(82,'es_ES','name','Autor/a','string'),
(83,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),
(83,'','nameLocaleKey','default.groups.name.translator','string'),
(83,'en_US','abbrev','Trans','string'),
(83,'en_US','name','Translator','string'),
(83,'es_ES','abbrev','Trad','string'),
(83,'es_ES','name','Traductor/a','string'),
(84,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),
(84,'','nameLocaleKey','default.groups.name.externalReviewer','string'),
(84,'en_US','abbrev','R','string'),
(84,'en_US','name','Reviewer','string'),
(84,'es_ES','abbrev','R','string'),
(84,'es_ES','name','Revisor/a','string'),
(85,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),
(85,'','nameLocaleKey','default.groups.name.reader','string'),
(85,'en_US','abbrev','Read','string'),
(85,'en_US','name','Reader','string'),
(85,'es_ES','abbrev','Lect','string'),
(85,'es_ES','name','Lector/a','string'),
(86,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),
(86,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),
(86,'en_US','abbrev','SubM','string'),
(86,'en_US','name','Subscription Manager','string'),
(86,'es_ES','abbrev','GSus','string'),
(86,'es_ES','name','Gestor/a de suscripción','string'),
(87,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),
(87,'','nameLocaleKey','default.groups.name.manager','string'),
(87,'en_US','abbrev','JM','string'),
(87,'en_US','name','Journal manager','string'),
(87,'es_ES','abbrev','GR','string'),
(87,'es_ES','name','Gestor/a de la revista','string'),
(88,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),
(88,'','nameLocaleKey','default.groups.name.editor','string'),
(88,'en_US','abbrev','JE','string'),
(88,'en_US','name','Journal editor','string'),
(88,'es_ES','abbrev','ER','string'),
(88,'es_ES','name','Editor/a de la revista','string'),
(89,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),
(89,'','nameLocaleKey','default.groups.name.productionEditor','string'),
(89,'en_US','abbrev','ProdE','string'),
(89,'en_US','name','Production editor','string'),
(89,'es_ES','abbrev','CoProd','string'),
(89,'es_ES','name','Coordinador/a de producción','string'),
(90,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),
(90,'','nameLocaleKey','default.groups.name.sectionEditor','string'),
(90,'en_US','abbrev','SecE','string'),
(90,'en_US','name','Section editor','string'),
(90,'es_ES','abbrev','ESec','string'),
(90,'es_ES','name','Editor/a de sección','string'),
(91,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),
(91,'','nameLocaleKey','default.groups.name.guestEditor','string'),
(91,'en_US','abbrev','GE','string'),
(91,'en_US','name','Guest editor','string'),
(91,'es_ES','abbrev','EI','string'),
(91,'es_ES','name','Editor/a invitado/a','string'),
(92,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),
(92,'','nameLocaleKey','default.groups.name.copyeditor','string'),
(92,'en_US','abbrev','CE','string'),
(92,'en_US','name','Copyeditor','string'),
(92,'es_ES','abbrev','CE','string'),
(92,'es_ES','name','Corrector/a de estilo','string'),
(93,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),
(93,'','nameLocaleKey','default.groups.name.designer','string'),
(93,'en_US','abbrev','Design','string'),
(93,'en_US','name','Designer','string'),
(93,'es_ES','abbrev','Diseño','string'),
(93,'es_ES','name','Diseñador/a','string'),
(94,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),
(94,'','nameLocaleKey','default.groups.name.funding','string'),
(94,'en_US','abbrev','FC','string'),
(94,'en_US','name','Funding coordinator','string'),
(94,'es_ES','abbrev','CF','string'),
(94,'es_ES','name','Coordinador/a de financiación','string'),
(95,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),
(95,'','nameLocaleKey','default.groups.name.indexer','string'),
(95,'en_US','abbrev','IND','string'),
(95,'en_US','name','Indexer','string'),
(95,'es_ES','abbrev','DOC','string'),
(95,'es_ES','name','Documentalista','string'),
(96,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),
(96,'','nameLocaleKey','default.groups.name.layoutEditor','string'),
(96,'en_US','abbrev','LE','string'),
(96,'en_US','name','Layout Editor','string'),
(96,'es_ES','abbrev','MAQ','string'),
(96,'es_ES','name','Maquetador/a','string'),
(97,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),
(97,'','nameLocaleKey','default.groups.name.marketing','string'),
(97,'en_US','abbrev','MS','string'),
(97,'en_US','name','Marketing and sales coordinator','string'),
(97,'es_ES','abbrev','MV','string'),
(97,'es_ES','name','Coordinador/a de marketing y ventas','string'),
(98,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),
(98,'','nameLocaleKey','default.groups.name.proofreader','string'),
(98,'en_US','abbrev','PR','string'),
(98,'en_US','name','Proofreader','string'),
(98,'es_ES','abbrev','CP','string'),
(98,'es_ES','name','Corrector/a de pruebas','string'),
(99,'','abbrevLocaleKey','default.groups.abbrev.author','string'),
(99,'','nameLocaleKey','default.groups.name.author','string'),
(99,'en_US','abbrev','AU','string'),
(99,'en_US','name','Author','string'),
(99,'es_ES','abbrev','AU','string'),
(99,'es_ES','name','Autor/a','string'),
(100,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),
(100,'','nameLocaleKey','default.groups.name.translator','string'),
(100,'en_US','abbrev','Trans','string'),
(100,'en_US','name','Translator','string'),
(100,'es_ES','abbrev','Trad','string'),
(100,'es_ES','name','Traductor/a','string'),
(101,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),
(101,'','nameLocaleKey','default.groups.name.externalReviewer','string'),
(101,'en_US','abbrev','R','string'),
(101,'en_US','name','Reviewer','string'),
(101,'es_ES','abbrev','R','string'),
(101,'es_ES','name','Revisor/a','string'),
(102,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),
(102,'','nameLocaleKey','default.groups.name.reader','string'),
(102,'en_US','abbrev','Read','string'),
(102,'en_US','name','Reader','string'),
(102,'es_ES','abbrev','Lect','string'),
(102,'es_ES','name','Lector/a','string'),
(103,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),
(103,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),
(103,'en_US','abbrev','SubM','string'),
(103,'en_US','name','Subscription Manager','string'),
(103,'es_ES','abbrev','GSus','string'),
(103,'es_ES','name','Gestor/a de suscripción','string'),
(104,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),
(104,'','nameLocaleKey','default.groups.name.manager','string'),
(104,'en_US','abbrev','JM','string'),
(104,'en_US','name','Journal manager','string'),
(104,'es_ES','abbrev','GR','string'),
(104,'es_ES','name','Gestor/a de la revista','string'),
(105,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),
(105,'','nameLocaleKey','default.groups.name.editor','string'),
(105,'en_US','abbrev','JE','string'),
(105,'en_US','name','Journal editor','string'),
(105,'es_ES','abbrev','ER','string'),
(105,'es_ES','name','Editor/a de la revista','string'),
(106,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),
(106,'','nameLocaleKey','default.groups.name.productionEditor','string'),
(106,'en_US','abbrev','ProdE','string'),
(106,'en_US','name','Production editor','string'),
(106,'es_ES','abbrev','CoProd','string'),
(106,'es_ES','name','Coordinador/a de producción','string'),
(107,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),
(107,'','nameLocaleKey','default.groups.name.sectionEditor','string'),
(107,'en_US','abbrev','SecE','string'),
(107,'en_US','name','Section editor','string'),
(107,'es_ES','abbrev','ESec','string'),
(107,'es_ES','name','Editor/a de sección','string'),
(108,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),
(108,'','nameLocaleKey','default.groups.name.guestEditor','string'),
(108,'en_US','abbrev','GE','string'),
(108,'en_US','name','Guest editor','string'),
(108,'es_ES','abbrev','EI','string'),
(108,'es_ES','name','Editor/a invitado/a','string'),
(109,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),
(109,'','nameLocaleKey','default.groups.name.copyeditor','string'),
(109,'en_US','abbrev','CE','string'),
(109,'en_US','name','Copyeditor','string'),
(109,'es_ES','abbrev','CE','string'),
(109,'es_ES','name','Corrector/a de estilo','string'),
(110,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),
(110,'','nameLocaleKey','default.groups.name.designer','string'),
(110,'en_US','abbrev','Design','string'),
(110,'en_US','name','Designer','string'),
(110,'es_ES','abbrev','Diseño','string'),
(110,'es_ES','name','Diseñador/a','string'),
(111,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),
(111,'','nameLocaleKey','default.groups.name.funding','string'),
(111,'en_US','abbrev','FC','string'),
(111,'en_US','name','Funding coordinator','string'),
(111,'es_ES','abbrev','CF','string'),
(111,'es_ES','name','Coordinador/a de financiación','string'),
(112,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),
(112,'','nameLocaleKey','default.groups.name.indexer','string'),
(112,'en_US','abbrev','IND','string'),
(112,'en_US','name','Indexer','string'),
(112,'es_ES','abbrev','DOC','string'),
(112,'es_ES','name','Documentalista','string'),
(113,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),
(113,'','nameLocaleKey','default.groups.name.layoutEditor','string'),
(113,'en_US','abbrev','LE','string'),
(113,'en_US','name','Layout Editor','string'),
(113,'es_ES','abbrev','MAQ','string'),
(113,'es_ES','name','Maquetador/a','string'),
(114,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),
(114,'','nameLocaleKey','default.groups.name.marketing','string'),
(114,'en_US','abbrev','MS','string'),
(114,'en_US','name','Marketing and sales coordinator','string'),
(114,'es_ES','abbrev','MV','string'),
(114,'es_ES','name','Coordinador/a de marketing y ventas','string'),
(115,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),
(115,'','nameLocaleKey','default.groups.name.proofreader','string'),
(115,'en_US','abbrev','PR','string'),
(115,'en_US','name','Proofreader','string'),
(115,'es_ES','abbrev','CP','string'),
(115,'es_ES','name','Corrector/a de pruebas','string'),
(116,'','abbrevLocaleKey','default.groups.abbrev.author','string'),
(116,'','nameLocaleKey','default.groups.name.author','string'),
(116,'en_US','abbrev','AU','string'),
(116,'en_US','name','Author','string'),
(116,'es_ES','abbrev','AU','string'),
(116,'es_ES','name','Autor/a','string'),
(117,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),
(117,'','nameLocaleKey','default.groups.name.translator','string'),
(117,'en_US','abbrev','Trans','string'),
(117,'en_US','name','Translator','string'),
(117,'es_ES','abbrev','Trad','string'),
(117,'es_ES','name','Traductor/a','string'),
(118,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),
(118,'','nameLocaleKey','default.groups.name.externalReviewer','string'),
(118,'en_US','abbrev','R','string'),
(118,'en_US','name','Reviewer','string'),
(118,'es_ES','abbrev','R','string'),
(118,'es_ES','name','Revisor/a','string'),
(119,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),
(119,'','nameLocaleKey','default.groups.name.reader','string'),
(119,'en_US','abbrev','Read','string'),
(119,'en_US','name','Reader','string'),
(119,'es_ES','abbrev','Lect','string'),
(119,'es_ES','name','Lector/a','string'),
(120,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),
(120,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),
(120,'en_US','abbrev','SubM','string'),
(120,'en_US','name','Subscription Manager','string'),
(120,'es_ES','abbrev','GSus','string'),
(120,'es_ES','name','Gestor/a de suscripción','string'),
(121,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),
(121,'','nameLocaleKey','default.groups.name.manager','string'),
(121,'en_US','abbrev','JM','string'),
(121,'en_US','name','Journal manager','string'),
(121,'es_ES','abbrev','GR','string'),
(121,'es_ES','name','Gestor/a de la revista','string'),
(122,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),
(122,'','nameLocaleKey','default.groups.name.editor','string'),
(122,'en_US','abbrev','JE','string'),
(122,'en_US','name','Journal editor','string'),
(122,'es_ES','abbrev','ER','string'),
(122,'es_ES','name','Editor/a de la revista','string'),
(123,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),
(123,'','nameLocaleKey','default.groups.name.productionEditor','string'),
(123,'en_US','abbrev','ProdE','string'),
(123,'en_US','name','Production editor','string'),
(123,'es_ES','abbrev','CoProd','string'),
(123,'es_ES','name','Coordinador/a de producción','string'),
(124,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),
(124,'','nameLocaleKey','default.groups.name.sectionEditor','string'),
(124,'en_US','abbrev','SecE','string'),
(124,'en_US','name','Section editor','string'),
(124,'es_ES','abbrev','ESec','string'),
(124,'es_ES','name','Editor/a de sección','string'),
(125,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),
(125,'','nameLocaleKey','default.groups.name.guestEditor','string'),
(125,'en_US','abbrev','GE','string'),
(125,'en_US','name','Guest editor','string'),
(125,'es_ES','abbrev','EI','string'),
(125,'es_ES','name','Editor/a invitado/a','string'),
(126,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),
(126,'','nameLocaleKey','default.groups.name.copyeditor','string'),
(126,'en_US','abbrev','CE','string'),
(126,'en_US','name','Copyeditor','string'),
(126,'es_ES','abbrev','CE','string'),
(126,'es_ES','name','Corrector/a de estilo','string'),
(127,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),
(127,'','nameLocaleKey','default.groups.name.designer','string'),
(127,'en_US','abbrev','Design','string'),
(127,'en_US','name','Designer','string'),
(127,'es_ES','abbrev','Diseño','string'),
(127,'es_ES','name','Diseñador/a','string'),
(128,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),
(128,'','nameLocaleKey','default.groups.name.funding','string'),
(128,'en_US','abbrev','FC','string'),
(128,'en_US','name','Funding coordinator','string'),
(128,'es_ES','abbrev','CF','string'),
(128,'es_ES','name','Coordinador/a de financiación','string'),
(129,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),
(129,'','nameLocaleKey','default.groups.name.indexer','string'),
(129,'en_US','abbrev','IND','string'),
(129,'en_US','name','Indexer','string'),
(129,'es_ES','abbrev','DOC','string'),
(129,'es_ES','name','Documentalista','string'),
(130,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),
(130,'','nameLocaleKey','default.groups.name.layoutEditor','string'),
(130,'en_US','abbrev','LE','string'),
(130,'en_US','name','Layout Editor','string'),
(130,'es_ES','abbrev','MAQ','string'),
(130,'es_ES','name','Maquetador/a','string'),
(131,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),
(131,'','nameLocaleKey','default.groups.name.marketing','string'),
(131,'en_US','abbrev','MS','string'),
(131,'en_US','name','Marketing and sales coordinator','string'),
(131,'es_ES','abbrev','MV','string'),
(131,'es_ES','name','Coordinador/a de marketing y ventas','string'),
(132,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),
(132,'','nameLocaleKey','default.groups.name.proofreader','string'),
(132,'en_US','abbrev','PR','string'),
(132,'en_US','name','Proofreader','string'),
(132,'es_ES','abbrev','CP','string'),
(132,'es_ES','name','Corrector/a de pruebas','string'),
(133,'','abbrevLocaleKey','default.groups.abbrev.author','string'),
(133,'','nameLocaleKey','default.groups.name.author','string'),
(133,'en_US','abbrev','AU','string'),
(133,'en_US','name','Author','string'),
(133,'es_ES','abbrev','AU','string'),
(133,'es_ES','name','Autor/a','string'),
(134,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),
(134,'','nameLocaleKey','default.groups.name.translator','string'),
(134,'en_US','abbrev','Trans','string'),
(134,'en_US','name','Translator','string'),
(134,'es_ES','abbrev','Trad','string'),
(134,'es_ES','name','Traductor/a','string'),
(135,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),
(135,'','nameLocaleKey','default.groups.name.externalReviewer','string'),
(135,'en_US','abbrev','R','string'),
(135,'en_US','name','Reviewer','string'),
(135,'es_ES','abbrev','R','string'),
(135,'es_ES','name','Revisor/a','string'),
(136,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),
(136,'','nameLocaleKey','default.groups.name.reader','string'),
(136,'en_US','abbrev','Read','string'),
(136,'en_US','name','Reader','string'),
(136,'es_ES','abbrev','Lect','string'),
(136,'es_ES','name','Lector/a','string'),
(137,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),
(137,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),
(137,'en_US','abbrev','SubM','string'),
(137,'en_US','name','Subscription Manager','string'),
(137,'es_ES','abbrev','GSus','string'),
(137,'es_ES','name','Gestor/a de suscripción','string');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES
(1,3,1),
(1,3,3),
(1,3,4),
(1,3,5),
(1,4,4),
(1,4,5),
(1,5,1),
(1,5,3),
(1,5,4),
(1,5,5),
(1,6,1),
(1,6,3),
(1,6,4),
(1,6,5),
(1,7,4),
(1,8,5),
(1,9,1),
(1,9,3),
(1,10,5),
(1,11,5),
(1,12,4),
(1,13,5),
(1,14,1),
(1,14,3),
(1,14,4),
(1,14,5),
(1,15,1),
(1,15,3),
(1,15,4),
(1,15,5),
(1,16,3),
(2,20,1),
(2,20,3),
(2,20,4),
(2,20,5),
(2,21,4),
(2,21,5),
(2,22,1),
(2,22,3),
(2,22,4),
(2,22,5),
(2,23,1),
(2,23,3),
(2,23,4),
(2,23,5),
(2,24,4),
(2,25,5),
(2,26,1),
(2,26,3),
(2,27,5),
(2,28,5),
(2,29,4),
(2,30,5),
(2,31,1),
(2,31,3),
(2,31,4),
(2,31,5),
(2,32,1),
(2,32,3),
(2,32,4),
(2,32,5),
(2,33,3),
(3,37,1),
(3,37,3),
(3,37,4),
(3,37,5),
(3,38,4),
(3,38,5),
(3,39,1),
(3,39,3),
(3,39,4),
(3,39,5),
(3,40,1),
(3,40,3),
(3,40,4),
(3,40,5),
(3,41,4),
(3,42,5),
(3,43,1),
(3,43,3),
(3,44,5),
(3,45,5),
(3,46,4),
(3,47,5),
(3,48,1),
(3,48,3),
(3,48,4),
(3,48,5),
(3,49,1),
(3,49,3),
(3,49,4),
(3,49,5),
(3,50,3),
(4,54,1),
(4,54,3),
(4,54,4),
(4,54,5),
(4,55,4),
(4,55,5),
(4,56,1),
(4,56,3),
(4,56,4),
(4,56,5),
(4,57,1),
(4,57,3),
(4,57,4),
(4,57,5),
(4,58,4),
(4,59,5),
(4,60,1),
(4,60,3),
(4,61,5),
(4,62,5),
(4,63,4),
(4,64,5),
(4,65,1),
(4,65,3),
(4,65,4),
(4,65,5),
(4,66,1),
(4,66,3),
(4,66,4),
(4,66,5),
(4,67,3),
(5,71,1),
(5,71,3),
(5,71,4),
(5,71,5),
(5,72,4),
(5,72,5),
(5,73,1),
(5,73,3),
(5,73,4),
(5,73,5),
(5,74,1),
(5,74,3),
(5,74,4),
(5,74,5),
(5,75,4),
(5,76,5),
(5,77,1),
(5,77,3),
(5,78,5),
(5,79,5),
(5,80,4),
(5,81,5),
(5,82,1),
(5,82,3),
(5,82,4),
(5,82,5),
(5,83,1),
(5,83,3),
(5,83,4),
(5,83,5),
(5,84,3),
(6,88,1),
(6,88,3),
(6,88,4),
(6,88,5),
(6,89,4),
(6,89,5),
(6,90,1),
(6,90,3),
(6,90,4),
(6,90,5),
(6,91,1),
(6,91,3),
(6,91,4),
(6,91,5),
(6,92,4),
(6,93,5),
(6,94,1),
(6,94,3),
(6,95,5),
(6,96,5),
(6,97,4),
(6,98,5),
(6,99,1),
(6,99,3),
(6,99,4),
(6,99,5),
(6,100,1),
(6,100,3),
(6,100,4),
(6,100,5),
(6,101,3),
(7,105,1),
(7,105,3),
(7,105,4),
(7,105,5),
(7,106,4),
(7,106,5),
(7,107,1),
(7,107,3),
(7,107,4),
(7,107,5),
(7,108,1),
(7,108,3),
(7,108,4),
(7,108,5),
(7,109,4),
(7,110,5),
(7,111,1),
(7,111,3),
(7,112,5),
(7,113,5),
(7,114,4),
(7,115,5),
(7,116,1),
(7,116,3),
(7,116,4),
(7,116,5),
(7,117,1),
(7,117,3),
(7,117,4),
(7,117,5),
(7,118,3),
(8,122,1),
(8,122,3),
(8,122,4),
(8,122,5),
(8,123,4),
(8,123,5),
(8,124,1),
(8,124,3),
(8,124,4),
(8,124,5),
(8,125,1),
(8,125,3),
(8,125,4),
(8,125,5),
(8,126,4),
(8,127,5),
(8,128,1),
(8,128,3),
(8,129,5),
(8,130,5),
(8,131,4),
(8,132,5),
(8,133,1),
(8,133,3),
(8,133,4),
(8,133,5),
(8,134,1),
(8,134,3),
(8,134,4),
(8,134,5),
(8,135,3);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES
(1,0,1,1,0,0,0),
(2,1,16,1,0,0,1),
(3,1,16,1,0,0,1),
(4,1,16,1,0,0,1),
(5,1,17,1,0,0,1),
(6,1,17,1,0,0,0),
(7,1,4097,1,0,0,0),
(8,1,4097,1,0,0,0),
(9,1,4097,1,0,0,0),
(10,1,4097,1,0,0,0),
(11,1,4097,1,0,0,0),
(12,1,4097,1,0,0,0),
(13,1,4097,1,0,0,0),
(14,1,65536,1,0,1,0),
(15,1,65536,1,0,0,0),
(16,1,4096,1,0,1,0),
(17,1,1048576,1,0,1,0),
(18,1,2097152,1,0,0,0),
(19,2,16,1,0,0,1),
(20,2,16,1,0,0,1),
(21,2,16,1,0,0,1),
(22,2,17,1,0,0,1),
(23,2,17,1,0,0,0),
(24,2,4097,1,0,0,0),
(25,2,4097,1,0,0,0),
(26,2,4097,1,0,0,0),
(27,2,4097,1,0,0,0),
(28,2,4097,1,0,0,0),
(29,2,4097,1,0,0,0),
(30,2,4097,1,0,0,0),
(31,2,65536,1,0,1,0),
(32,2,65536,1,0,0,0),
(33,2,4096,1,0,1,0),
(34,2,1048576,1,0,1,0),
(35,2,2097152,1,0,0,0),
(36,3,16,1,0,0,1),
(37,3,16,1,0,0,1),
(38,3,16,1,0,0,1),
(39,3,17,1,0,0,1),
(40,3,17,1,0,0,0),
(41,3,4097,1,0,0,0),
(42,3,4097,1,0,0,0),
(43,3,4097,1,0,0,0),
(44,3,4097,1,0,0,0),
(45,3,4097,1,0,0,0),
(46,3,4097,1,0,0,0),
(47,3,4097,1,0,0,0),
(48,3,65536,1,0,1,0),
(49,3,65536,1,0,0,0),
(50,3,4096,1,0,1,0),
(51,3,1048576,1,0,1,0),
(52,3,2097152,1,0,0,0),
(53,4,16,1,0,0,1),
(54,4,16,1,0,0,1),
(55,4,16,1,0,0,1),
(56,4,17,1,0,0,1),
(57,4,17,1,0,0,0),
(58,4,4097,1,0,0,0),
(59,4,4097,1,0,0,0),
(60,4,4097,1,0,0,0),
(61,4,4097,1,0,0,0),
(62,4,4097,1,0,0,0),
(63,4,4097,1,0,0,0),
(64,4,4097,1,0,0,0),
(65,4,65536,1,0,1,0),
(66,4,65536,1,0,0,0),
(67,4,4096,1,0,1,0),
(68,4,1048576,1,0,1,0),
(69,4,2097152,1,0,0,0),
(70,5,16,1,0,0,1),
(71,5,16,1,0,0,1),
(72,5,16,1,0,0,1),
(73,5,17,1,0,0,1),
(74,5,17,1,0,0,0),
(75,5,4097,1,0,0,0),
(76,5,4097,1,0,0,0),
(77,5,4097,1,0,0,0),
(78,5,4097,1,0,0,0),
(79,5,4097,1,0,0,0),
(80,5,4097,1,0,0,0),
(81,5,4097,1,0,0,0),
(82,5,65536,1,0,1,0),
(83,5,65536,1,0,0,0),
(84,5,4096,1,0,1,0),
(85,5,1048576,1,0,1,0),
(86,5,2097152,1,0,0,0),
(87,6,16,1,0,0,1),
(88,6,16,1,0,0,1),
(89,6,16,1,0,0,1),
(90,6,17,1,0,0,1),
(91,6,17,1,0,0,0),
(92,6,4097,1,0,0,0),
(93,6,4097,1,0,0,0),
(94,6,4097,1,0,0,0),
(95,6,4097,1,0,0,0),
(96,6,4097,1,0,0,0),
(97,6,4097,1,0,0,0),
(98,6,4097,1,0,0,0),
(99,6,65536,1,0,1,0),
(100,6,65536,1,0,0,0),
(101,6,4096,1,0,1,0),
(102,6,1048576,1,0,1,0),
(103,6,2097152,1,0,0,0),
(104,7,16,1,0,0,1),
(105,7,16,1,0,0,1),
(106,7,16,1,0,0,1),
(107,7,17,1,0,0,1),
(108,7,17,1,0,0,0),
(109,7,4097,1,0,0,0),
(110,7,4097,1,0,0,0),
(111,7,4097,1,0,0,0),
(112,7,4097,1,0,0,0),
(113,7,4097,1,0,0,0),
(114,7,4097,1,0,0,0),
(115,7,4097,1,0,0,0),
(116,7,65536,1,0,1,0),
(117,7,65536,1,0,0,0),
(118,7,4096,1,0,1,0),
(119,7,1048576,1,0,1,0),
(120,7,2097152,1,0,0,0),
(121,8,16,1,0,0,1),
(122,8,16,1,0,0,1),
(123,8,16,1,0,0,1),
(124,8,17,1,0,0,1),
(125,8,17,1,0,0,0),
(126,8,4097,1,0,0,0),
(127,8,4097,1,0,0,0),
(128,8,4097,1,0,0,0),
(129,8,4097,1,0,0,0),
(130,8,4097,1,0,0,0),
(131,8,4097,1,0,0,0),
(132,8,4097,1,0,0,0),
(133,8,65536,1,0,1,0),
(134,8,65536,1,0,0,0),
(135,8,4096,1,0,1,0),
(136,8,1048576,1,0,1,0),
(137,8,2097152,1,0,0,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES
(1,'es_ES','familyName',0,0,'admin','string'),
(1,'es_ES','givenName',0,0,'admin','string'),
(2,'','country',0,0,'EC','string'),
(2,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí','string'),
(2,'es_ES','biography',0,0,'<p>Doctor en Ciencias de la Información y Gestión Editorial. Editor en Jefe y Gestor de Revista Ceibo de la Universidad Técnica de Manabí.</p>','string'),
(2,'es_ES','familyName',0,0,'Pérez','string'),
(2,'es_ES','givenName',0,0,'Juan','string'),
(2,'es_ES','preferredPublicName',0,0,'Dr. Juan Pérez','string'),
(3,'es_ES','familyName',0,0,'Mendoza','string'),
(3,'es_ES','givenName',0,0,'Sofía','string'),
(4,'es_ES','familyName',0,0,'Morales','string'),
(4,'es_ES','givenName',0,0,'Elena','string'),
(5,'es_ES','familyName',0,0,'Castro','string'),
(5,'es_ES','givenName',0,0,'Fernando','string'),
(6,'es_ES','familyName',0,0,'Gómez','string'),
(6,'es_ES','givenName',0,0,'María','string'),
(7,'es_ES','familyName',0,0,'Pérez','string'),
(7,'es_ES','givenName',0,0,'Juan','string'),
(8,'es_ES','familyName',0,0,'Silva','string'),
(8,'es_ES','givenName',0,0,'Beatriz','string'),
(9,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí','string'),
(9,'es_ES','familyName',0,0,'Mendoza','string'),
(9,'es_ES','givenName',0,0,'Sofía','string'),
(10,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí','string'),
(10,'es_ES','familyName',0,0,'Morales','string'),
(10,'es_ES','givenName',0,0,'Elena','string'),
(11,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí','string'),
(11,'es_ES','familyName',0,0,'Alarcón','string'),
(11,'es_ES','givenName',0,0,'Roberto','string'),
(12,'es_ES','affiliation',0,0,'Universidad de Salamanca','string'),
(12,'es_ES','familyName',0,0,'Gómez de la Torre','string'),
(12,'es_ES','givenName',0,0,'Manuel','string'),
(13,'es_ES','affiliation',0,0,'Universidad Nacional de Colombia','string'),
(13,'es_ES','familyName',0,0,'Restrepo','string'),
(13,'es_ES','givenName',0,0,'Laura','string'),
(14,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí','string'),
(14,'es_ES','familyName',0,0,'Barreiro','string'),
(14,'es_ES','givenName',0,0,'Juan','string'),
(15,'','country',0,0,'EC','string'),
(15,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí - Posgrado en Gestión Editorial','string'),
(15,'es_ES','biography',0,0,'<p>Estudiante del Posgrado en Aplicaciones Informáticas para la Gestión Editorial. Gestor/a editorial de práctica.</p>','string'),
(15,'es_ES','familyName',0,0,'1','string'),
(15,'es_ES','givenName',0,0,'Estudiante','string'),
(15,'es_ES','preferredPublicName',0,0,'Estudiante 1','string'),
(16,'','country',0,0,'EC','string'),
(16,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí - Posgrado en Gestión Editorial','string'),
(16,'es_ES','biography',0,0,'<p>Estudiante del Posgrado en Aplicaciones Informáticas para la Gestión Editorial. Gestor/a editorial de práctica.</p>','string'),
(16,'es_ES','familyName',0,0,'2','string'),
(16,'es_ES','givenName',0,0,'Estudiante','string'),
(16,'es_ES','preferredPublicName',0,0,'Estudiante 2','string'),
(17,'','country',0,0,'EC','string'),
(17,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí - Posgrado en Gestión Editorial','string'),
(17,'es_ES','biography',0,0,'<p>Estudiante del Posgrado en Aplicaciones Informáticas para la Gestión Editorial. Gestor/a editorial de práctica.</p>','string'),
(17,'es_ES','familyName',0,0,'3','string'),
(17,'es_ES','givenName',0,0,'Estudiante','string'),
(17,'es_ES','preferredPublicName',0,0,'Estudiante 3','string'),
(18,'','country',0,0,'EC','string'),
(18,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí - Posgrado en Gestión Editorial','string'),
(18,'es_ES','biography',0,0,'<p>Estudiante del Posgrado en Aplicaciones Informáticas para la Gestión Editorial. Gestor/a editorial de práctica.</p>','string'),
(18,'es_ES','familyName',0,0,'4','string'),
(18,'es_ES','givenName',0,0,'Estudiante','string'),
(18,'es_ES','preferredPublicName',0,0,'Estudiante 4','string'),
(19,'','country',0,0,'EC','string'),
(19,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí - Posgrado en Gestión Editorial','string'),
(19,'es_ES','biography',0,0,'<p>Estudiante del Posgrado en Aplicaciones Informáticas para la Gestión Editorial. Gestor/a editorial de práctica.</p>','string'),
(19,'es_ES','familyName',0,0,'5','string'),
(19,'es_ES','givenName',0,0,'Estudiante','string'),
(19,'es_ES','preferredPublicName',0,0,'Estudiante 5','string'),
(20,'','country',0,0,'EC','string'),
(20,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí - Posgrado en Gestión Editorial','string'),
(20,'es_ES','biography',0,0,'<p>Estudiante del Posgrado en Aplicaciones Informáticas para la Gestión Editorial. Gestor/a editorial de práctica.</p>','string'),
(20,'es_ES','familyName',0,0,'6','string'),
(20,'es_ES','givenName',0,0,'Estudiante','string'),
(20,'es_ES','preferredPublicName',0,0,'Estudiante 6','string'),
(21,'','country',0,0,'EC','string'),
(21,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí - Posgrado en Gestión Editorial','string'),
(21,'es_ES','biography',0,0,'<p>Estudiante del Posgrado en Aplicaciones Informáticas para la Gestión Editorial. Gestor/a editorial de práctica.</p>','string'),
(21,'es_ES','familyName',0,0,'7','string'),
(21,'es_ES','givenName',0,0,'Estudiante','string'),
(21,'es_ES','preferredPublicName',0,0,'Estudiante 7','string'),
(22,'','country',0,0,'EC','string'),
(22,'es_ES','affiliation',0,0,'Universidad Técnica de Manabí - Posgrado en Gestión Editorial','string'),
(22,'es_ES','biography',0,0,'<p>Estudiante del Posgrado en Aplicaciones Informáticas para la Gestión Editorial. Gestor/a editorial de práctica.</p>','string'),
(22,'es_ES','familyName',0,0,'8','string'),
(22,'es_ES','givenName',0,0,'Estudiante','string'),
(22,'es_ES','preferredPublicName',0,0,'Estudiante 8','string');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES
(1,1),
(2,1),
(2,2),
(2,3),
(2,9),
(2,15),
(3,1),
(3,2),
(3,15),
(5,4),
(5,10),
(5,11),
(5,15),
(14,6),
(14,14),
(14,16),
(14,17),
(14,18),
(14,19),
(14,20),
(14,21),
(14,22),
(16,5),
(16,8),
(16,12),
(16,13),
(16,16),
(16,17),
(16,18),
(16,19),
(16,20),
(16,21),
(16,22),
(17,7),
(17,15),
(17,16),
(17,17),
(17,18),
(17,19),
(17,20),
(17,21),
(17,22),
(19,1),
(19,2),
(19,16),
(20,1),
(20,2),
(20,16),
(22,16),
(31,15),
(31,17),
(31,18),
(31,19),
(31,20),
(31,21),
(31,22),
(33,15),
(33,17),
(33,18),
(33,19),
(33,20),
(33,21),
(33,22),
(34,15),
(34,16),
(34,17),
(34,18),
(34,19),
(34,20),
(34,21),
(34,22),
(36,1),
(36,2),
(36,17),
(37,1),
(37,2),
(37,17),
(39,17),
(48,15),
(48,16),
(48,18),
(48,19),
(48,20),
(48,21),
(48,22),
(50,15),
(50,16),
(50,18),
(50,19),
(50,20),
(50,21),
(50,22),
(51,15),
(51,16),
(51,17),
(51,18),
(51,19),
(51,20),
(51,21),
(51,22),
(53,1),
(53,2),
(53,18),
(54,1),
(54,2),
(54,18),
(56,18),
(65,15),
(65,16),
(65,17),
(65,19),
(65,20),
(65,21),
(65,22),
(67,15),
(67,16),
(67,17),
(67,19),
(67,20),
(67,21),
(67,22),
(68,15),
(68,16),
(68,17),
(68,18),
(68,19),
(68,20),
(68,21),
(68,22),
(70,1),
(70,2),
(70,19),
(71,1),
(71,2),
(71,19),
(73,19),
(82,15),
(82,16),
(82,17),
(82,18),
(82,20),
(82,21),
(82,22),
(84,15),
(84,16),
(84,17),
(84,18),
(84,20),
(84,21),
(84,22),
(85,15),
(85,16),
(85,17),
(85,18),
(85,19),
(85,20),
(85,21),
(85,22),
(87,1),
(87,2),
(87,20),
(88,1),
(88,2),
(88,20),
(90,20),
(99,15),
(99,16),
(99,17),
(99,18),
(99,19),
(99,21),
(99,22),
(101,15),
(101,16),
(101,17),
(101,18),
(101,19),
(101,21),
(101,22),
(102,15),
(102,16),
(102,17),
(102,18),
(102,19),
(102,20),
(102,21),
(102,22),
(104,1),
(104,2),
(104,21),
(105,1),
(105,2),
(105,21),
(107,21),
(116,15),
(116,16),
(116,17),
(116,18),
(116,19),
(116,20),
(116,22),
(118,15),
(118,16),
(118,17),
(118,18),
(118,19),
(118,20),
(118,22),
(119,15),
(119,16),
(119,17),
(119,18),
(119,19),
(119,20),
(119,21),
(119,22),
(121,1),
(121,2),
(121,22),
(122,1),
(122,2),
(122,22),
(124,22),
(133,15),
(133,16),
(133,17),
(133,18),
(133,19),
(133,20),
(133,21),
(135,15),
(135,16),
(135,17),
(135,18),
(135,19),
(135,20),
(135,21),
(136,15),
(136,16),
(136,17),
(136,18),
(136,19),
(136,20),
(136,21),
(136,22);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','jorge.parraga@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-10-02 23:16:12',NULL,'2026-10-02 23:16:29',0,NULL,NULL,0,NULL,1),
(2,'jperez','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','jperez@utm.edu.ec',NULL,NULL,NULL,NULL,'EC','',NULL,NULL,'2026-10-02 23:23:12',NULL,'2026-10-03 00:51:31',0,NULL,NULL,0,NULL,0),
(3,'gestor_ceibo','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','gestor.ceibo@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-10-02 23:24:16',NULL,'2026-10-02 23:24:16',0,NULL,NULL,0,NULL,0),
(4,'seccion_ceibo','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','seccion.ceibo@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-10-02 23:24:16',NULL,'2026-10-02 23:24:16',0,NULL,NULL,0,NULL,0),
(5,'revisor_ceibo','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','revisor.ceibo@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-10-02 23:24:16',NULL,'2026-10-02 23:24:16',0,NULL,NULL,0,NULL,0),
(6,'autor_ceibo','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','autor.ceibo@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-10-02 23:24:16',NULL,'2026-10-02 23:24:16',0,NULL,NULL,0,NULL,0),
(7,'lector_ceibo','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','lector.ceibo@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-10-02 23:24:16',NULL,'2026-10-02 23:24:16',0,NULL,NULL,0,NULL,0),
(8,'revisor2_ceibo','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','revisor2.ceibo@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-10-02 23:30:34',NULL,'2026-10-02 23:30:34',0,NULL,NULL,0,NULL,0),
(9,'smendoza','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','smendoza@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 00:46:50',NULL,'2026-10-03 00:46:50',NULL,NULL,NULL,0,NULL,NULL),
(10,'emorales','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','emorales@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 00:46:50',NULL,'2026-10-03 00:46:50',NULL,NULL,NULL,0,NULL,NULL),
(11,'ralarcon','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','ralarcon@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 00:46:50',NULL,'2026-10-03 00:46:50',NULL,NULL,NULL,0,NULL,NULL),
(12,'mgomez','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','mgomez@usal.es',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 00:46:50',NULL,'2026-10-03 00:46:50',NULL,NULL,NULL,0,NULL,NULL),
(13,'lrestrepo','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','lrestrepo@unal.edu.co',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 00:46:50',NULL,'2026-10-03 00:46:50',NULL,NULL,NULL,0,NULL,NULL),
(14,'jbarreiro','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','jbarreiro@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 00:46:50',NULL,'2026-10-03 00:46:50',NULL,NULL,NULL,0,NULL,NULL),
(15,'estudiante1','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','estudiante1@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 02:46:31',NULL,'2026-10-03 02:46:31',NULL,NULL,NULL,0,NULL,NULL),
(16,'estudiante2','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','estudiante2@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 02:46:31',NULL,'2026-10-03 02:46:31',NULL,NULL,NULL,0,NULL,NULL),
(17,'estudiante3','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','estudiante3@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 02:46:31',NULL,'2026-10-03 02:46:31',NULL,NULL,NULL,0,NULL,NULL),
(18,'estudiante4','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','estudiante4@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 02:46:31',NULL,'2026-10-03 02:46:31',NULL,NULL,NULL,0,NULL,NULL),
(19,'estudiante5','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','estudiante5@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 02:46:31',NULL,'2026-10-03 02:46:31',NULL,NULL,NULL,0,NULL,NULL),
(20,'estudiante6','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','estudiante6@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 02:46:31',NULL,'2026-10-03 02:46:31',NULL,NULL,NULL,0,NULL,NULL),
(21,'estudiante7','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','estudiante7@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 02:46:32',NULL,'2026-10-03 02:46:32',NULL,NULL,NULL,0,NULL,NULL),
(22,'estudiante8','$2y$10$/8hDnuHX1F6SPbgHuXXOw.rQtoLIm7f.5vsrTdAtt95kuxvE3hW/u','estudiante8@utm.edu.ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-10-03 02:46:32',NULL,'2026-10-03 02:46:32',NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.metadata','dc11','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),
(1,1,0,0,'2026-10-02 23:16:12',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.blocks','information','InformationBlockPlugin',1,0),
(1,0,1,0,'2026-10-02 23:16:12',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.gateways','resolver','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),
(1,0,1,0,'2026-10-02 23:16:12',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','driver','DRIVERPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),
(1,0,1,0,'2026-10-02 23:16:12',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),
(1,2,0,0,'2026-10-02 23:16:12',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),
(1,2,0,0,'2026-10-02 23:16:12',1,'plugins.generic','acron','AcronPlugin',1,1),
(1,2,0,0,'2026-10-02 23:16:12',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','usageEvent','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),
(1,1,0,0,'2026-10-02 23:16:12',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),
(1,1,2,22,'2026-10-02 23:16:12',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),
(0,1,0,0,'2026-10-02 23:16:12',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),
(1,1,0,0,'2026-10-02 23:16:12',1,'plugins.importexport','doaj','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.importexport','pubmed','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.importexport','native','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.importexport','users','',0,0),
(2,1,0,0,'2026-10-02 23:16:12',1,'plugins.importexport','crossref','',0,0),
(2,0,0,0,'2026-10-02 23:16:12',1,'plugins.importexport','datacite','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.oaiMetadataFormats','marc','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.oaiMetadataFormats','dc','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.oaiMetadataFormats','marcxml','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.paymethod','manual','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.paymethod','paypal','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),
(2,0,0,0,'2026-10-02 23:16:12',1,'plugins.reports','reviewReport','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.reports','views','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.reports','articles','',0,0),
(1,1,0,0,'2026-10-02 23:16:12',1,'plugins.reports','counterReport','',0,0),
(1,0,0,0,'2026-10-02 23:16:12',1,'plugins.themes','default','DefaultThemePlugin',1,0),
(3,3,0,8,'2026-10-02 23:16:11',1,'core','ojs2','',0,1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-03  2:48:59
