-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: mysql    Database: 
-- ------------------------------------------------------
-- Server version	5.6.30-0ubuntu0.15.10.1

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
-- Current Database: `dbprefixgoeshere_almanac`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_almanac` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_almanac`;

--
-- Table structure for table `almanac_binding`
--

DROP TABLE IF EXISTS `almanac_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_binding` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `servicePHID` varbinary(64) NOT NULL,
  `devicePHID` varbinary(64) NOT NULL,
  `interfacePHID` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_service` (`servicePHID`,`interfacePHID`),
  KEY `key_device` (`devicePHID`),
  KEY `key_interface` (`interfacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_binding`
--

LOCK TABLES `almanac_binding` WRITE;
/*!40000 ALTER TABLE `almanac_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_bindingtransaction`
--

DROP TABLE IF EXISTS `almanac_bindingtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_bindingtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_bindingtransaction`
--

LOCK TABLES `almanac_bindingtransaction` WRITE;
/*!40000 ALTER TABLE `almanac_bindingtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_bindingtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_device`
--

DROP TABLE IF EXISTS `almanac_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `nameIndex` binary(12) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `isBoundToClusterService` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`nameIndex`),
  KEY `key_nametext` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_device`
--

LOCK TABLES `almanac_device` WRITE;
/*!40000 ALTER TABLE `almanac_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_devicename_ngrams`
--

DROP TABLE IF EXISTS `almanac_devicename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_devicename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_devicename_ngrams`
--

LOCK TABLES `almanac_devicename_ngrams` WRITE;
/*!40000 ALTER TABLE `almanac_devicename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_devicename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_devicetransaction`
--

DROP TABLE IF EXISTS `almanac_devicetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_devicetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_devicetransaction`
--

LOCK TABLES `almanac_devicetransaction` WRITE;
/*!40000 ALTER TABLE `almanac_devicetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_devicetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_interface`
--

DROP TABLE IF EXISTS `almanac_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_interface` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `devicePHID` varbinary(64) NOT NULL,
  `networkPHID` varbinary(64) NOT NULL,
  `address` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `port` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_location` (`networkPHID`,`address`,`port`),
  KEY `key_device` (`devicePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_interface`
--

LOCK TABLES `almanac_interface` WRITE;
/*!40000 ALTER TABLE `almanac_interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_namespace`
--

DROP TABLE IF EXISTS `almanac_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_namespace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `nameIndex` binary(12) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_nameindex` (`nameIndex`),
  KEY `key_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_namespace`
--

LOCK TABLES `almanac_namespace` WRITE;
/*!40000 ALTER TABLE `almanac_namespace` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_namespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_namespacename_ngrams`
--

DROP TABLE IF EXISTS `almanac_namespacename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_namespacename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_namespacename_ngrams`
--

LOCK TABLES `almanac_namespacename_ngrams` WRITE;
/*!40000 ALTER TABLE `almanac_namespacename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_namespacename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_namespacetransaction`
--

DROP TABLE IF EXISTS `almanac_namespacetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_namespacetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_namespacetransaction`
--

LOCK TABLES `almanac_namespacetransaction` WRITE;
/*!40000 ALTER TABLE `almanac_namespacetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_namespacetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_network`
--

DROP TABLE IF EXISTS `almanac_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_network` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_network`
--

LOCK TABLES `almanac_network` WRITE;
/*!40000 ALTER TABLE `almanac_network` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_networkname_ngrams`
--

DROP TABLE IF EXISTS `almanac_networkname_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_networkname_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_networkname_ngrams`
--

LOCK TABLES `almanac_networkname_ngrams` WRITE;
/*!40000 ALTER TABLE `almanac_networkname_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_networkname_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_networktransaction`
--

DROP TABLE IF EXISTS `almanac_networktransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_networktransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_networktransaction`
--

LOCK TABLES `almanac_networktransaction` WRITE;
/*!40000 ALTER TABLE `almanac_networktransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_networktransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_property`
--

DROP TABLE IF EXISTS `almanac_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldName` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `fieldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_property`
--

LOCK TABLES `almanac_property` WRITE;
/*!40000 ALTER TABLE `almanac_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_service`
--

DROP TABLE IF EXISTS `almanac_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `nameIndex` binary(12) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `serviceType` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`nameIndex`),
  KEY `key_nametext` (`name`),
  KEY `key_servicetype` (`serviceType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_service`
--

LOCK TABLES `almanac_service` WRITE;
/*!40000 ALTER TABLE `almanac_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_servicename_ngrams`
--

DROP TABLE IF EXISTS `almanac_servicename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_servicename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_servicename_ngrams`
--

LOCK TABLES `almanac_servicename_ngrams` WRITE;
/*!40000 ALTER TABLE `almanac_servicename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_servicename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almanac_servicetransaction`
--

DROP TABLE IF EXISTS `almanac_servicetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almanac_servicetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almanac_servicetransaction`
--

LOCK TABLES `almanac_servicetransaction` WRITE;
/*!40000 ALTER TABLE `almanac_servicetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `almanac_servicetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_audit`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_audit`;

--
-- Table structure for table `audit_transaction`
--

DROP TABLE IF EXISTS `audit_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_transaction`
--

LOCK TABLES `audit_transaction` WRITE;
/*!40000 ALTER TABLE `audit_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_transaction_comment`
--

DROP TABLE IF EXISTS `audit_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `commitPHID` varbinary(64) DEFAULT NULL,
  `pathID` int(10) unsigned DEFAULT NULL,
  `isNewFile` tinyint(1) NOT NULL,
  `lineNumber` int(10) unsigned NOT NULL,
  `lineLength` int(10) unsigned NOT NULL,
  `fixedState` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `hasReplies` tinyint(1) NOT NULL,
  `replyToCommentPHID` varbinary(64) DEFAULT NULL,
  `legacyCommentID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  KEY `key_path` (`pathID`),
  KEY `key_draft` (`authorPHID`,`transactionPHID`),
  KEY `key_commit` (`commitPHID`),
  KEY `key_legacy` (`legacyCommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_transaction_comment`
--

LOCK TABLES `audit_transaction_comment` WRITE;
/*!40000 ALTER TABLE `audit_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_auth`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_auth` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_auth`;

--
-- Table structure for table `auth_factorconfig`
--

DROP TABLE IF EXISTS `auth_factorconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_factorconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `factorKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `factorName` longtext COLLATE utf8mb4_bin NOT NULL,
  `factorSecret` longtext COLLATE utf8mb4_bin NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_user` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_factorconfig`
--

LOCK TABLES `auth_factorconfig` WRITE;
/*!40000 ALTER TABLE `auth_factorconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_factorconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_providerconfig`
--

DROP TABLE IF EXISTS `auth_providerconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_providerconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `providerClass` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `providerType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `providerDomain` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `isEnabled` tinyint(1) NOT NULL,
  `shouldAllowLogin` tinyint(1) NOT NULL,
  `shouldAllowRegistration` tinyint(1) NOT NULL,
  `shouldAllowLink` tinyint(1) NOT NULL,
  `shouldAllowUnlink` tinyint(1) NOT NULL,
  `shouldTrustEmails` tinyint(1) NOT NULL DEFAULT '0',
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `shouldAutoLogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_provider` (`providerType`,`providerDomain`),
  KEY `key_class` (`providerClass`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_providerconfig`
--

LOCK TABLES `auth_providerconfig` WRITE;
/*!40000 ALTER TABLE `auth_providerconfig` DISABLE KEYS */;
INSERT INTO `auth_providerconfig` VALUES (1,'PHID-AUTH-xwyiqplbuw2ru5imydlm','PhabricatorPasswordAuthProvider','password','self',1,1,1,1,1,0,'[]',1468279000,1468279000,0),(2,'PHID-AUTH-mmaqw4acmxqguibmalqz','PhabricatorLDAPAuthProvider','ldap','self',1,1,1,1,1,1,'{\"ldap:port\":\"389\",\"ldap:version\":\"3\",\"ldap:host\":\"\",\"ldap:dn\":\"\",\"ldap:search-attribute\":\"\",\"ldap:anoynmous-username\":\"\",\"ldap:anonymous-password\":\"\",\"ldap:username-attribute\":\"\",\"ldap:realname-attributes\":[],\"ldap:activedirectory-domain\":\"\"}',1468279016,1468279016,0);
/*!40000 ALTER TABLE `auth_providerconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_providerconfigtransaction`
--

DROP TABLE IF EXISTS `auth_providerconfigtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_providerconfigtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_providerconfigtransaction`
--

LOCK TABLES `auth_providerconfigtransaction` WRITE;
/*!40000 ALTER TABLE `auth_providerconfigtransaction` DISABLE KEYS */;
INSERT INTO `auth_providerconfigtransaction` VALUES (1,'PHID-XACT-AUTH-pxdifntwcl2aabl','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:trustEmails','0','1','[]','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(2,'PHID-XACT-AUTH-bet6kmgg2ilzmvb','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:host\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(3,'PHID-XACT-AUTH-grlmbjl3hplii4t','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','389','\"389\"','{\"auth:property\":\"ldap:port\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(4,'PHID-XACT-AUTH-guu3qyfqdzzrg4r','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:dn\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(5,'PHID-XACT-AUTH-bbbyytlilult7je','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:search-attribute\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(6,'PHID-XACT-AUTH-yivg546gvpjwyfx','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:anoynmous-username\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(7,'PHID-XACT-AUTH-gzfhwg3w3nwecuh','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:anonymous-password\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(8,'PHID-XACT-AUTH-s3afrq5jy7eos6e','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:username-attribute\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(9,'PHID-XACT-AUTH-r56mmexuljzt3fb','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','null','[]','{\"auth:property\":\"ldap:realname-attributes\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(10,'PHID-XACT-AUTH-q5a66iahibkpsol','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','3','\"3\"','{\"auth:property\":\"ldap:version\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016),(11,'PHID-XACT-AUTH-hxjhttxwt2cengw','PHID-USER-ljditzls25waa24hvicf','PHID-AUTH-mmaqw4acmxqguibmalqz','public','PHID-USER-ljditzls25waa24hvicf',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:activedirectory-domain\"}','{\"source\":\"web\",\"params\":[]}',1468279016,1468279016);
/*!40000 ALTER TABLE `auth_providerconfigtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sshkey`
--

DROP TABLE IF EXISTS `auth_sshkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sshkey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `keyType` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `keyBody` longtext COLLATE utf8mb4_bin NOT NULL,
  `keyComment` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `keyIndex` binary(12) NOT NULL,
  `isTrusted` tinyint(1) NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_activeunique` (`keyIndex`,`isActive`),
  KEY `key_object` (`objectPHID`),
  KEY `key_active` (`isActive`,`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sshkey`
--

LOCK TABLES `auth_sshkey` WRITE;
/*!40000 ALTER TABLE `auth_sshkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sshkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sshkeytransaction`
--

DROP TABLE IF EXISTS `auth_sshkeytransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sshkeytransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sshkeytransaction`
--

LOCK TABLES `auth_sshkeytransaction` WRITE;
/*!40000 ALTER TABLE `auth_sshkeytransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sshkeytransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_temporarytoken`
--

DROP TABLE IF EXISTS `auth_temporarytoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_temporarytoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tokenResource` varbinary(64) NOT NULL,
  `tokenType` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `tokenExpires` int(10) unsigned NOT NULL,
  `tokenCode` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `userPHID` varbinary(64) DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_token` (`tokenResource`,`tokenType`,`tokenCode`),
  KEY `key_expires` (`tokenExpires`),
  KEY `key_user` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_temporarytoken`
--

LOCK TABLES `auth_temporarytoken` WRITE;
/*!40000 ALTER TABLE `auth_temporarytoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_temporarytoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_badges`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_badges` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_badges`;

--
-- Table structure for table `badges_award`
--

DROP TABLE IF EXISTS `badges_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `badgePHID` varbinary(64) NOT NULL,
  `recipientPHID` varbinary(64) NOT NULL,
  `awarderPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_badge` (`badgePHID`,`recipientPHID`),
  KEY `key_recipient` (`recipientPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_award`
--

LOCK TABLES `badges_award` WRITE;
/*!40000 ALTER TABLE `badges_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_badge`
--

DROP TABLE IF EXISTS `badges_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_badge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flavor` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `quality` int(10) unsigned NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_creator` (`creatorPHID`,`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_badge`
--

LOCK TABLES `badges_badge` WRITE;
/*!40000 ALTER TABLE `badges_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_badgename_ngrams`
--

DROP TABLE IF EXISTS `badges_badgename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_badgename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_badgename_ngrams`
--

LOCK TABLES `badges_badgename_ngrams` WRITE;
/*!40000 ALTER TABLE `badges_badgename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_badgename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_transaction`
--

DROP TABLE IF EXISTS `badges_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_transaction`
--

LOCK TABLES `badges_transaction` WRITE;
/*!40000 ALTER TABLE `badges_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_transaction_comment`
--

DROP TABLE IF EXISTS `badges_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_transaction_comment`
--

LOCK TABLES `badges_transaction_comment` WRITE;
/*!40000 ALTER TABLE `badges_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_cache`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_cache` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_cache`;

--
-- Table structure for table `cache_general`
--

DROP TABLE IF EXISTS `cache_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_general` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cacheKeyHash` binary(12) NOT NULL,
  `cacheKey` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `cacheFormat` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `cacheData` longblob NOT NULL,
  `cacheCreated` int(10) unsigned NOT NULL,
  `cacheExpires` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_cacheKeyHash` (`cacheKeyHash`),
  KEY `key_cacheCreated` (`cacheCreated`),
  KEY `key_ttl` (`cacheExpires`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_general`
--

LOCK TABLES `cache_general` WRITE;
/*!40000 ALTER TABLE `cache_general` DISABLE KEYS */;
INSERT INTO `cache_general` VALUES (1,'K3VntSub8LL2','phabricator.setup.issue-keys','raw','[]',1468279028,NULL),(2,'72WC2iN478Rq','phabricator:celerity:/res/defaultX/phabricator/9fb86c85/rsrc/css/phui/ph-_Q2HxHcpwaJ2','deflate','½W[‹Û8~ß_a(e:¬g&ÍÚP(´Ë.,}hYú,[Ç±:²ed9—\róß+ù9¾¦CëòÛw.ZeqA‘<rrV$):P8Z«ÛÕ0q	pø²¼H‰ŞàÂ{E‘p¡6QÀ¥ä‰·ÎNVÎ%–Øøİó³]ı­Öî£Ÿ`±§isÔ}ÊN¯+\ZB_æ¤&] µ«†\0VG*c”Auo!ÓëÜ¯>š»O%Êéà¹NvòËÏ\'”½‡øƒığ\rö¬ÿ6şµ¾C`}…}Á°0—¿“€3µò–úê_À iˆ­/PÀƒİ~ÛÅÌÎqš£ü:&ã4^EYÌÓß.²f½óê2À<Æ.&„¦û2ØÖFÊrnM\Z/Uêİ\'ã7«ŞÉ(ƒzy\\rË6çWÙ6e–¦Uıl‡Ü5ˆĞĞ±¡äÙ‡¯G;7î”-#—*kbÈ_”ØşåPÅRÙ^uf„õÏ¯İ%r‡\'˜¦õò%bKA$ı#%2öBÌÂwkÇyk!¥‰Šáã]Ø9%ĞÅt7àÇYªki%G-0¥˜&¸»å&LŠìf8ÍİöÉn^¸©ÃÎòD¯Ãİf!~@(Ò©Up,h\rTQ“&Àh\nåÚ•=¾Ñc2SIyêíæ4üßÓËú}P¢‘zhyiè@©ª“Ìo­™«ÃCĞpPş5ulÛ‘iå‡!¼ˆŠ\\¢0¦Œ\\ê¶\\Ö–¶\'¿ùôéóîóŸƒzõØ‚sVB	Õkp¨íÌªôRB 5ÔduW•î„<#F•º/pn¢¡)¬8P‘x½OÎ9ÌftPuÓHG§JÇÛÀÔhr\r¡\Z®äUÖ×2â–n~º†¾;™ÜQ¯ºfèlS–š•|[eÖH³U\Z WÛĞQàlèH.µ˜E}»0Ef\rĞ­hn²Ñ)¶¢ú02,¤¢âS†BóŒáóÈXq5¼W»êqäfx}¿¶wïíµëØ+÷q¶ö7&Ş¶Ë;	¨}…¨|ÑÄÓÜnHş:vÜ\n\nEÉtMBbOî¶J?+7éqî¹ææé¸À/æ‡f¼›ĞAÂI*9!¸,¸:Ô~ïar>g÷ØŒÇ›§?v$h^-ZäŞæÿ3B­£Ê™C…Twöò‹¥×šQ­mÔ¿˜Ô·ZÜ\r0¬Í\\Q iÄ»}±4|³<N‚SPwRĞäBdòÜ–Í[ÏCC‚Ên¨îÓÚÜâ™ˆv*éY5eB©}Œs”âC—bj1®ZÛ¥jr¸Üo§UÏÕ“Ñ¿mÔc!3ÅÌÔÔÉ)±Ş <,=ÔD¬ ¤uG»<Ó×Ÿ',1468278923,NULL),(3,'jqGiSRxR47wu','phabricator:celerity:/res/defaultX/phabricator/9cda225e/rsrc/css/phui/ph-CvkVoep5eSUo','raw','.diviner-document-section .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif;color:#000}.phui-document-view .phui-header-tall .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup h1.remarkup-header,.phui-document-view .phabricator-remarkup h2.remarkup-header,.phui-document-view .phabricator-remarkup h3.remarkup-header,.phui-document-view .phabricator-remarkup h4.remarkup-header,.phui-document-view .phabricator-remarkup h5.remarkup-header,.phui-document-view .phabricator-remarkup h6.remarkup-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup .remarkup-header{margin-bottom:8px}.phui-document-view .phabricator-remarkup h2.remarkup-header{padding:0 24px 8px 0;margin:32px 0 4px}',1468278924,NULL),(4,'uWI8flh81QkH','phabricator:celerity:/res/defaultX/phabricator/c7ccd872/rsrc/css/font/fo-SF0zGSJG3FtM','deflate','­–Ín£0€ïû+õ@#mƒméaû\0û•fR$\'DÆÙ6ªúîIZE«dm\\8 lóøfÄ#v[¿D©áí|µiía•ı–¾Ëz§W{gïs}¾{–ÊµzXpyÍjƒª€Ü\r!9¼zp[iû|Ì‘Û!äxZ:Xï­t?¡ó‹9“ıºkÛ×Å·ïŸvn#ı}Æ€Yv;ØúÃ²Å«T.dƒ‚•‘Ô—±¼<.Ü‚ÔĞa\näãJAŠŠ«H„÷W	ŞíáoK+ÃÑT±”şÏúnœ8¯‡lñp”îÚõ³_mÇ{šêıÁÂyæı1MÒJ6„\"7=·^ÚVœkE…®©8‰ƒ¦Z‰Úh¦Bö‚1UĞªl°bù‰~£…Æã z†©vîNµ³iPi¬u`Çª³&àæÄLs˜I‡æÉ@‡ÊáˆLór¨5U’ªˆ%Lµ’HQ°ELşD\'K)kJA|9â|#çë•ª¡´nL¨HGhT¿LÊ7‡™†PNˆ5‚pšŸÀéPt,ÆŸ/ôN#\r-Jú¸ $ºÊ+¡€	¯íÒØ§)ô_qÏmô/',1468278924,NULL),(5,'xADEf8DXjH1U','phabricator:celerity:/res/defaultX/phabricator/8bdb2835/rsrc/css/font/fo-OX41jDHSf522','deflate','­’Knƒ0\0÷=E¥,RSó­,šå	’ƒ‘1MPÕ»(eÅDağÃš±¬9qYê‡¿Æ¯K!ÚÄú(­ã0ºb‘ŸuÂ¤È~µn&¥TÇZ¥I£Ä(¬Iu¦Š´T$ó3ŸaF‰ê¶¼iT%ˆšô~xzì+Jm?Œô¾+7ûéyzxV½·ğÒq2Ì²ÂR·ZöË¬’†œqßóL”WÉ¹7g~,bŸ…®®©aI°Ä˜1ä	_ëY¼V\rşwIAÅq\Z¡‰¢şÌwÓjNÖm°ìï“qc~‚„\0½=¾r\\…y#@­4¹öˆ,£ĞppíÆÿ¬÷•™ú4Æ$[ã¤¡‹4 ¦Š{ûô zã-S¢ã`¹Ò',1468278924,NULL),(6,'xRfi5L5jPg1U','phabricator:celerity:/res/defaultX/phabricator/027ba77e/rsrc/css/applica-IUMXSXz0yWmq','deflate','­“ËnÃ E%R¶Á\ZqºsİÁfb£Ø`Q{Uåß[µ‹”„,@Ù¡\r÷VË¸Y²8#é&ëŒü®ZFİÛëÕ2këÈŒn#î/Cğ›3_·ãÛ^P	\n¯Õ?’Ñá’I¡GÚ3ˆ(E6¬¥¢‰8M&DI \"H7m˜Ià\'%#Ê]îf˜hèûÌm7?Ã%ø³ğ—Ã?­ù=OÜMPÉÙû¡‘™d²VÇäÏX=†&ßˆç¼y’¢§×ìI0®dÊdÒCšK| …6ï¢4İ7#ß«KW¥@)Q³|\'ÊØ‰ªë7',1468278924,NULL),(7,'fxrlGttkyWmS','phabricator:celerity:/res/defaultX/phabricator/4e7e9bde/core.pkg.css;def-RshTOcp1EFWm','deflate','ìıi“êH’0\nŸ_‘·Çúí©!ó ‰slîIHì‹ØáyÆÓ.6$€cõß¯6@+IªékoWV)ÂÃÃ#ÂÃÃÃŞ/ï¢vzõwÑ{Å÷£şnéïºö®‚ï*ô®Âï*ò®¢ïjãİv¤wÙrŒwY“tÑ•¼wû×-a8Zôî©ïøÎ=Ï2\Zœ£hæwà‡Í‰¢f*Á\'ŞrDÉùüîq¼.ıŒ¿~–®s¶+}¿}HÊ}¸6\'D¿7§ÊÏ;”\0®#¹î»ÀÙf™ï‚à X¢ô.ÊfˆÌ‰s~Ê–é}¸ŞE—¾›æœş#zâKš¢zÉ£ßƒşõŸºæ>ŠšÒï7¸úÓ“ÎŞ§kŠù]—dï÷ ›ÁÓ“äxšÀéÉÏ²/Ğ,A@»JßA\0øk¦uŞÒÅßù`\0¢BßAØ>¿ım&)–ô¶èşíışñm%ñoSI9êœ“~<»ˆàÉ€ó¬àOGÒORˆÑÛH:J{¿\'Óß]Ît?\\ÉÑä¢æHBØ»ïºçüÈuïÇÑÔB:~ğš¨}—^ğœ°WëhŠßÿUÆƒşGĞ\r~¯yQí°‡œ¸;º^D½V@Y·üËwWp‚¡ı=,Ç9÷V3Õ\0/™*%ÏÄ$	HĞ4MÄ†}ş]…ÒOà	÷óÃ°®ÖÑÓ5SJbÜ7Q,‡‹ú=¦šå|ÿWnP$ôC8:nğÕ¶4Ó“œß¹ïjˆüÏ|Í ï’‚ÿ=œ†¢æÚ:wùÍÿß¿ñG÷òÓ¶\\-**kçfV°Œï¸}şáD~ò5ÑS¿ÃPğQ§Aøù÷o¾æ©âÑ	É®‰£a¾ÅPãº0€‡ÅÂ\'oßlõ¨}cd~œ4ÉO#†”-‰ß99èÏÏ ˜\'ÄüË_~ÜˆşCĞ%Î	f¡§ş®:?lÀ\0±ô`ó<[¸ÑªøÆ8ê–©§úËñn€±\'½ı_ša[Ç™^\0]³¿‡³ìßï©ßß\Z\07\0÷Éò]ÕDQ2ÿvÒÜã­•°IQ~K·ç•@‹>&\0£Ïw˜Ñ·t—€Fó6dY.ÿÆı|”(.ÚG•4¢OÉ‘F 	4~X!wó.ßoúû·à…ğº>`Y¹Y°•€Bq\'#’tÊ\rÒ@(”úqıĞ‚yzş‡üöüáªœĞ\0xŠ¿Äsû7à„ğwEßÃæ{´o;–2Õr$Bæğ¶<0ÒÄEş÷o{éÂ[œ#~È–pt“ı†øû7Q:i‚Nfw.åYÎ1¥ˆ‡S»ò¥g)Š.½\'@‚eêî“•!M\ZÁ”ÿH¦ş¿¼ı¡VŠHçÚó4CŠø¡;Ê‡t\nÚÌ¿ÒNy@‚Hš,KNP2`Íòäß*g*R°¦KØª¥kÖ‡)ùÁ³¨Á2Â~§¹Á8»s4µÏƒ-?F0Ø¿$Säœ‘»Ä˜—Öæø`=}xjü{¾—!O’5]/œ£Á»1¿Ê¼{PŞäN7å•‘ €cí&òO)UâN”~4h«!‚Q	X[0ß2ÏL+À:ØuD·ªV@±ã‡Í™R¦Ù^¢Ã)é÷ÁPíŸsÌpÙ8ëAË÷ÁŠÖ-.{Ş¾Ár\n†ŞıH|œ»¼V¶\"yÙ×i@ÁØìÃ‰°)ı<?zÁ ™‰SÔA³İ08ÍŒ:{/Ğ™­:!wæµ¤[v vIÎ÷¨‘¥Yv£º—Â~ÿ¶xN´ßó$3WğÜ”V¹cĞ®Êà[öU Ùİ¦r40ú{eUè³ª™ö‹75È–§Éáçpñg¨ÔŒ:•ˆeê„¼& pŠş ˜\0E·ø\0Å£uPÆõœcÄlÜL=ä®!ïæ<ÔÌ‚ã•´í]l‰—CÀ;Ü£î¥`ÀrÁA¨b=¦.Ì]™3…K4clMØ§§[0Ñ?d‡3Rl¯Œ¤\"!\\…%]Åîì(!ò­nÄs6èW°!cdë’—âxàíµèXv°gåF†!ë¾x3öÁB1\n&İ‡|Ôõ`úI’MÇRˆÌ³,İÓì’ `¹˜ñqà÷ødóÎ}K8ÿíRûMâå=Ã\n$·ğ€ÄES_ãÜ`£¾9ºá	JÒÖ‹¼‘|\\òÔ->Ì?H:^¶K†ìü#8w?«pÆ:©ÿı{„C,hfHı’³aÈ÷ßI+hH|×Lûèı¯púÿÇ_Ü#ohŞ_şëçCùHä6¨‰|ó7”|ª‰o÷\ZÑÖü=Ü¿–¥8Î¿yÖ[,À¿\'’Í{Rõ·DxôÕ\0ŸÜá¡ *şHT‚™r—À“\r;:=ÜÈáTCA-8Ò¤e‚Á\ZŒÅáÙÆw8ûvTq>ºaıÛX…q@»ÔŸoDÿH¤¹»¤çHzÀÉNÉ‘)œöÁô†š˜J¸®h™¿w°Å!\0á&ŠÀ?çüôÃ/‚I%ß“ª¿¥Ğ¹”Î†ø\r—şóK~¾6‚3Ağ(2ø[q†E6¾ãX eïß Û„ùW„DZ£Iğwµ–÷ yÇå?”ô#>¢¼6ë¿ÁùLÛpËÌÀ9‰“á,zù³æ3te¹Ï^ÜºS8Ñfº`,›PŞ¸i—òßÿ×íûı„Ï`­|çô€[ı[rÈúø-f€Súãc¯z†y”ú4šÛéÈ¼!†!†µ~¿3§ho|O)¨\"ÖZÍ§~|ƒç€ßòD›8şÃs‚}#^ØÀ7Ğ½£\Z/‡4¾©\'?¿¼\n$Iâ%!‡Cn\0ßàßâ#™„n~æ:a0Ü(!#Ğ\"ZşklÃq|‚a2W3(¦Ÿ=Ù}¾‚NT%¿ÉD‹û%Ì\n‹ì…2?_o¤P5­Ê•-]9E\"•ñ­»ÆâU¸Ï;–0PÉúvvc·\r_>yU¬\n?\'©¼büîg¾\'·~Á¹*dé¿ù9Ô¬¼áa¤ÀJÉ¡Š.’n*»Æcïf…Œ´ú.­°‰ÜæÂm 8Q£ÂEUyJ›Wğu·ÉšMôŸŸ«a›(Š·î¢kt1ãÎ?¬ oØıOÕ·¥çŒ‚ò.Q¹AÓs…Ó6îüG¨û‡ãF4¹œâ-Ü„Å[øêÜJöhœjâ$^”én­%ôŒ†»¬oÜ÷H¸ş™¨ÁokÈÀ¾äŒô3İ¯üÅF¾ğÛ·àÀ\'y?åàÈê}4Ñ¿\'J%Ù‚f·xGrë_H;ôÑùª·Guï25.É®å%êîÓŞ¯ákh¢¨K™V±Î±PŞ¡¤“ñûíÜp‡×IGÂöÿŒ~Ä®ìÈS<?íìóÜ&ìmb¥ö˜é¡£i1Ègµ\Zñ…‡t)z`z\0à÷ÊSl(Ì†‹(3iRó>½æ‘ª1-!xL’¤Á»ôj«Uí¡ùöG{	énCÙ„šf«´Á»¾»TF\'ŞM“/Ñ6[¡BœÿÛ{A°»PK°%§×ÿn´«ä†Û]F²­¨œ•ùY8,ßŠ\0•ô›L2…ã«ˆ¯øî\'øs½è¨l$Ä“!®Šë†z×·*Ä¢ÚÍTC·Î½e@„;ÃÏôrŒ·\\–ÅÚáîÀp¯ÎkJŠ¦ÉŞÌé7ˆµo`j†\'ó)Ù¯Ê\0~ÒH©aî··Ÿ@	æT(süKËdP^&—l‰©A~˜>â>ê’ëŞFìnáP<æ|.²e”;áÄ¸?y2WJxrÇu-µÆQô=şÿòÛ+ «MŸw®”_¼Ö\\ÅBÏu ùR&(…EÇ8F)¸M’‡A@£t	çq‘5ÇÍllÑ Ş<–L¼å^¿ĞD,)üÌ’\ZÈH@±À§B®ğ3_/µkÅ;e%î¹·•.wÏ¨H†bZD‰º ’6KçXnx¥ÑŠ£q‰ÜÖWÖxnû35øåË^˜ÜIS’û*Î	ïqŠÛKæœ‚æ7XAu,C\n§ö‡àİ*]oÅèÕÏªscÜÓDüÌÃÏ€øˆ,R6\'OŠÊ–åİp1·O‹Dß‘h‡h$ÿÜ_‘êHËE9¥ìc¡ƒwQ$Ñä•Z#”\"•à\0!ñ!ı-99šYÕ¼\0áÆ¢!ÿOC5î-ªÿó‹u‹7š!Û‰®ĞÃÙñV{¹;ñ… 0’ÑËH¡‰ÉM¹\ZL™— gP}X…¸ÁÜõ„£ì”ºıæ‰ï•¯Ô»hòÉÒM5\\õgÉuInÌ+êîù¬~‚ ûkÜ÷¾RË ’S=Š¢ŸØÄä”²—ŠEÀÍ&œ×Õ€òzhñÆyHA·\\I,è>¢­ÇVûQQoè7°ğ§B…¥N¬½yÀáNœ¦s¼¦kŞåã®§/NŠWƒ	o5³·U`Ö:-  -qáÆ’|J¿»“ğ#\\©ñZ–!\ZEÕ÷ÑÑÿMä<î{ôµn›J\0Ş•\ZÈ»¶$ÇSè·‹şÍ*½PÂHøÏ„\"6ÁŸÖ‚™ @ø ½2«ÎtÎC[@„˜Ë–%Ém»©mgd_1ævÙÓ7«)*º>	+tÕŞ”fÒÈÖê“z}âQ¥ksš‚¦êvİÓN‡ëĞ´†)Ş¨=»5ÒŸY™ÑCYñ¦tßì’s&®l}O±£B\"‘ÚÜì¸E·=ß°ÔÔwğÆŠ4ˆš|v\\d4@(d_GF\r1ä·`1èÄ#Ç®tĞB#¢˜´o/é‘BÅéd¼9ó\ZKì†ğÕÅö*ÌF-¢1[,ÇÓ>Jmºİÿø­‚ö·qş‡\"¿]$‡QFóÆiyÙö÷Ğ|·f7F§Ó_±¨ğ>[(»=³ö»=f²˜ßÓ¶š*]eM\\iÖZ}¡gl®«YÏ˜³êğJÚ:İRëc]Ù*ç°qkV#½I­5…ˆV\Z·-M=vì3ç‘¤Ô‡\"a\'zïL_Ù¹J»/ÄÓ¢U÷+\0²ßÖVØÆ×±fD²7] ´³ï)Šò•Cp[¤ÿXcğ|	Ì\rû@émnëÖ$¥ù´.ÀöÊÁnÛ)[Ÿš[/ãïw’‘ÑBs\0±C(šdO§U&k©-6–¦2»\"Š=ÍMÿüØ‚Dã9¾hBPÑØÃªV\0à&t¯ã9ùšå&}…º‚à÷#ùrVg±õR‘”+ãL­°ÍĞX·DŠ¾Û²Ÿ“ªEëöÄB6!ÑİT6>tçô$·¬™¨ÎDrtÁ®\\wtoâÖ4v?R‚`œ·ì“˜ö%À»ïã^&}$ÛInfò‹OŒ@Â¼y;‚á›ûûÃàq™¼|¾Aî[|u\Z·ùYës(îgE>y^&\r¡!aàƒP©ãfh¥~axëF²òÅÁº/Ë†ìa«€=¥İ§„û„jŸ‘ì½’wŸÎÂğ”Ïö)W\'º×¬Z2h´bî¼5²xŒyH<ÑĞè®+a¡‹Ä[¨=MØ]A®¾)\r\n×p¥j„¢­å[)&¯Ü	ŞÏs¶\ZH¤åp’^D¸?<J{ŸËôPºÍw¾P!4%ı™9IÇÇé·xóÈ•–õ£«ŒNø÷ârœ\"œ?B/²dp\Z@ÕèİÊõÛ¥eøk0Œç›7RV5Â\"a{ïYjÌ–lm/ŒÒ¶\r%öqiØ‘õö£¸‹–)!şµÕ¢qšy¢è‚Ÿ«ğàôñ<‡¸#…{}îÔ]^¦ŠÛÄJ÷h‰>\'tNÙ\"DŸÿ9‘bÃïûDNT‰¶ù%9qØKäDÇqº¯\\‰!y$ÀAí´xÇ¹D:ˆg›à°kCæÂ¬CbFuÕ~\r¥7€02@“d,OÂ€&DÔÒ§i¦§\0îœğiÂjâÂ¿@®D\0½İqO¬Ú­µ5 ù+¥‘“v‹é*ÓqY°«\\ÛxØ˜·Úº\n\Z§‰€¾2E™lG†Ş”÷;~Ù(›+Náç}¦wózV[\Z1Ø\rfK”0¯ÄÚ$ëäãæî”$iÈœöÔ^¿wà½j¦Ø9Û©#öÌ*DwP”D.p(,SôGb0Š„NZgæûÙ‘5(ê·ô`=Ü«UÓw¥dRüH,Xc÷{ ±W½e=ÆèNçG|aßÅ”¬¤Ä<æ½ôİÃºxë1v<`²¦ìU–\Z‘³àİTÿ¶•»cF—Ó„d8¥_)qoÊ	T±ğyaD€K =¶­&ú ƒt¤Èƒô†xÂÃĞ¿V—yûöx’8ä\\³ò¹(Ã\"W²‡	MçğŒf4c>l;ÒG¨{\r“`k¤ô¥{¬ó¼Uå!T!gz‰©^&6%´‹N–8Ô%EÎ¾K¥p–¸w…+mGHÕfas§]RCåäÓÅäÕ¨å»]t>±øÈ)¼<~ÜL—x;Wm™Õ@2¯gä`¬Ã£ù¿ë¥.¡ş¾\r%Ç©Ç¥ä“­€Kª‘,äĞ3$³ËìÊÃz*y$2KÔ^(iÄc”ò’Vµ·ªº@jêk(§Ä’IyñPú»›:?@W®[H‹ ¬´0(ƒçqxÓ9^Òï$‰GîÊÓ›\rIÂ(›Mñí…[–Ï|n\ndCpê§”Rbı{)m_î{æŠ?éïÃ1åír­Í\Z,ÁiVAŒß³W&ZÉ‰9xplÿZ%Ğ?€½Ä¹Ç»·Øçi‘0$C)ÊJg0Ï#~Ç;ŞGKÚú÷ïßoƒ=øè+Hj0C\"/óÔÕJÊñ¹Rx}À}w+@…Ó_Æ\'R¿ı¼É¹·u¯ƒŒ®ª¸*r‹ë÷’IøVÖØS	=²)~Â}Ì§úK“¡\'€+»òRcŸ\"½BcÊ?vƒô÷	Š‘×bpØbË\nBGåépÔIüYbâœ{lH—·»~…Û•ÌÒxùU®/á$”l åèíI#KÁ#‹´\rÚ5Dí¾¿<ÎpdäHlƒS¶X¿¿2¸%õŞ€rØ±·PáDPVæÉÉ n\"øÁ³(Ş GİÓnpûI©FŸã>Á¦T“w·û\0Ş‹İ|œ$ç_Gßr ÅYğUx^p˜»ƒªÁO\\>K74¯+‘­ò³\"œó3g—•Ò* ¸‡æ7Ù|_>ÏåRœ«XÚKı-Š®		SŞwÙ ĞÃ»|šØ@5=h/nı…æSÂNÛÛNyëÎ7T2Ş²r¨,ß·¿ø5X˜Tw0oa(¡§º×…‚Ê?ÒíT²¦È>AÊe¨Ò\n±kø§Ó¹q3Ô¼¸U«-\n3÷ØïPÂ’HWåàB••„¬xRNP%aòó¸húğ\nQ±Á”qÍRÆÒO=xØï… ¬gëëİÈ#\0½ˆ@¶½W:*¾=›$´’âi2#¯ğöL£ñ¡änüòZÓÙJ9OÓœø5–e;wTs\\·ZÂ‰qE\"Mî›ks¶öovPå\n‰ëlKæ‚3	y“sFKPH,Ú¨NF-D•\nRUréü`†Ï»»‰ÜìÓÆdf†ÉM¹Ìr«ê\"¨ĞĞ›\nş,İÜ>R!À²gK<;PH^ïÿL·R\"ñÊš.Eš‘„Á#ñ¥J¶Pf#È,¤¼”›ÖñâE@Qk|¡Ü½l\"tEÎU¥\0_^2ç#*.çì¸K,™¦²şé˜$Šw/±L<ü„tB-^øo¤hJ´İ†Ufğ¤bò)Ç%qB­ñÍwˆİ´’p<‰øš›ûi‘çáBts÷|KŒ\ZÊfvvèÃX?&EÄ²Í>­è~>PùRíhÑ–”Ìˆ‰}¤3‘ÇJ\"±/·&\Z‘k<û2ŒA•èîEŞ¿P?z™«ÿ)m3îwXAvùœZ¬ŸãZEè4‹í—Ñä­*€Ppê\nÇ_2Şİ_©J\'N?JÙób!®ĞSŸÚbù\0Gç,ne§\noßŒ ¢ú‰#ïUeÂ€gqôÉû‡\nÌÅ%u¥ğæÀ+Ä%\nÕèDÿ9*?³{@Qò,11I–ÑÜ&U’/Ó^ Í|Ó„=t\\	äØİøE8é‘®”oÅ×0Ëzn<z˜Ù¤¥†Ô”îŞq¬ÃÊ†î#\"cøy;òÄX®h>W”’Ûûœ®#ÃÛ+X…_*ƒGd‡<ãEòR—£/i]hR¹›Uúñkø’´6»ŸYuYi\n£¨V³Ä`âõ~˜ÑåÓ3ï“hˆÒs#¯¶¬Zïµö=+øšAh’¦h:×K$\Z$ğ£D¢Ê\\q¾ÖãûÛxcÎ…úy\"ıÈ	DåÍ\"î¶²à7ÓŠ™|Rá±÷[R,ô¯}Ë‹<Ÿ9Ô–óüÂ\ZˆmZ?É‹¢ò=„ÂË²¦5¼nç°Ç%LÉ»|ïËK¥C&…|æ/ÿõ3hèÙ¾ÿ-_l¼•²NNÉ­[ñIğ	4uJ[@:ÿ–‹û[t<ı~ãzñö£w½QèN–˜’9RxTîÿ„1óş&ÿÛÑNœpÉaWê2$İĞÎ)Šñ}‹ï™•sŠÃÏ?}Ï”\"È]ùG@„9V÷ŞµÁÑ<j- †[æÿı2 èENÖ’ñf|â_Ã1ùš\0Ï_è~Ğ]V\0r‡İ0©ä=öÖò(¹\r²ª~É‹ÄÑRôì•^8\nØuÄ›ú“õ]5Uq¥dÊ:ªÌAª&{ùÃµŠÀRzÕ(é\rå§vå5Ê/²2eîác‹nêù\Z‘}H‰®:\Z•È*ègÊà=«òŠË¤Lk“Û¦ªHş9+Ì_eèe|D¦[?ã±\n-¶æª.*KoÆòUÂÀ®Bê(İÌ:Ë-!’ĞÛ/+pxrË7NÏ†á»IHe¥Õ‚éT¥j¯Ç„}ÆáúÓ›#ğo·ÎŒ•*9­08Ód¨ß=µlÜğB üV\"ÚÜ\0ÄVEçß¸÷ªIÀ®Ê×‘ıø«„È^V”…®ªDğ³àSùLñ[²\ræX`ÙØŒw²},iIÎŠrÊÜg+\\p³õ£pTáP?sàÉY$½0\nyÌÁ¬4p‹óIÌ¨òé˜QÙŞí¿K_’Èown\\$c¯<¹ËÎ‰gÕ ÔnÕJİ$g ¼WìyåM5^ûV{vT2÷ÅVÔW\ZPÓÈÎ¯4¢øZ[QÉ’Î”3–p.Kâ-l{f×‰9wõõ¼ú3¾-~‹Ã.e.üÀ’j¼õğ²ÁÉ™BWÅmò%¾ V–Õ§¢t°Ş¥›Œ®×ÊÌ|2cö-ZŞå›•¿,âËK–iÅ½•9CÓ/ßÿ2´LN°şò¾‰ğÊİîTA2¿¦°õTÂ=ŠÁØU÷XM•¸O‘»ãdéC)µHúê!E5¾ÖÁçó¹NrÁ±à.W9\nÈ]A†(^ĞÂÃ.€êìİàK¸¿Æ;ÑG¼Å\'¾”,ş¹Ûkx§[\n,Ù6~æú]F‘;µ|	`\"JÜaÆfU|\'FînımîËé1©Ò\n¯Ä±Hi‡‚Cäo_B¨J.}‚ÒİúËíF.I´×šÍÖHˆÆ\'qÉÈjq«PƒEåuÈ å¦„<Ù;>Ô„E®ªf˜ÙãÃ‘Â{[ñYWÓå²à#ÿõ§àƒEöğ¨T‰&¶\n´i…Š<.-ÈDçÇâ5C™µi”½Ló‚rÂk‚Ù7O=\Zü[˜—ìáÙˆ5_ç›I\\ãÉ–yK‘“f¾X`wG‹»!æS°og87Ÿ3­bûm[~	•6®Š4KUÍªßâ\ZUûkü¶ØBÑŞ®(5ŞA?+\ZËd·v2¢YÚÎ*ÉëöLá”:<ÇEÊ¶«EÉÓŠË|.KŞ‹V¨›rYä]tv*–zË›)çŒKJnJ\nŞ8%ê§ôud4»Ö¶ö’,§êÒ¨¸A¦vÏü^Y\nù%û€l_Øn*4t}„Bˆ\"Q¦b|ÿ~âœlC†ä9šP©.†¢Î¡õ\\¸\"\\c;ø  z«ãÆ‹+•äG:¢tÚw¨¨|¤»2Âw¹V\r†á{ª¹ÆgıK\"_¿ÚbÕh¾‘»¹Cú:5m¸›²I¼ç„È`w®*~ÓĞ¤\"kç«fµÊ‰–±T•«}Ê˜£>\rupØ Åw&Eİœ(I˜Œ§‡?—ü¦2áº€\n™0 áˆ–aı4{FæÚ“Ãx”—/ñåP2á~òGëó6:|0:B)†òÑŒÏ³Y|$XB$<¯ó~¢`ğ¤NY˜¦[\n8üÉÑGBÃŸ[‡¸FøóriMÊ‚_D–Ñ?uAZ~ïÂ‡aƒ¸rd´@T&g¸²üäì6¥†Ô¸÷…1{\n²´{I£\"àÒ%ªú%à(‡âì£ZbNU×	MŒÿÂ¿P$Jå+¿6›o–U-%ú\\5½Y-–6x‹\"˜»EJíñû”úJ<õe\"¯á{¸ÔÇs>8&»RŞ@25Š\0¢€–q•—a%ÒåS`e¹Ï[&d:(\'»\n×òaï™‚ÁG ÇÅ|!\Z¯“ugÂêf¾§Späê`àsDsï¨ÿE¼`M¨rm%“şÿ\\­°GÕ9_‰{)Ê(5Ó=NK+9G)üI:ÜÄÿš±I2âBYÛ LØ•ì\ran7ğ¯•.m÷T\ZU–9Ü”{çU%c—™52ÊyPæl	Kõcê½ÔXr§ö¤h$tIbNÀÏØíÅ¶l¥BK%àü¤Ë1šØË$]ó-“tş~Ô*+KÃ9R¥$¥ß?ş²Š’j®ğ‘Ğ&Éç´0Ïri„ègc*!n”\rÁB¡Ğ¿p?˜s)­ôæ37À@È$Hª(›ˆ,§Ëü£8qòµØ†à3i(	7˜Ê“²Ê*kâ5¿è?V#êFjÑ¦ÜRÊùqn©}fÛp3é¬8ÅW¢òVIøèŸh]«MB±§v‘l$í·\'*/·š>#7ÇÆO¡„õßjñŸ<ÄLLó_\"E™‡úQCıÃğ26ù9GOÎ…]\0±Ê(¯6&9©D Üô2arQö62ãIrâ~‚ÔÏò5 aáOy#t’8ıçsòàÇØØS8oÏı‚¯¤Ñ”KJ²¬¢Ï•FgE¡?xÁ\'&ës,i7òÒ`ZéZ¢ä\n–qúK¦Ñªˆ.Ñ÷´c4„4O1M·ù$ˆJ~R¥M=oYšf´¿¡ düğƒYˆœ·ÿıû>(¯ş–â€·?“G¹áM]-¾—WOg‹“cSîa’Ò9˜¿õÈ¼õ/CÉÔ­¿¼ÿ…Šò¯snğ±pm`ˆ·ÑÂó53,¦\n¯BÁ?ˆ)ôUL_m.ç;™»x\rPÎŠ©‘Ä”ÌË©E³³‡HPL\"…ÿVî‚U‘W$+—DS,ïÈƒAW!W‘Î\\œ³´%Ú‘D‰ğ«œ@6AÛ‘~Vô®b¡•Ã·3†öÏIÓT¸§M{pİ›Œ†ó“,^åëHi¼ÒTı*ı<ïé>»ï\n‹ßg{t ñÄ,j.Ë/ÿK±á>Á„	}:TÉ€WÀ*Ï%Uğ¨?êGÁI„·ğN1^áGfeÇQ^áBê–;8ë8IĞBƒ—¯B|\nôh‡aÑ£üÍÏ\0<…LÔa¼\0Æ±Îütô¢j‘I}ä×>uÓë0|:Äz’ñéşô	¬£™†–F8ÚšÓòT\" ÿJ{™0hà©h\\E\Zh¼8Ï#YAæB½üƒŠzyğ¯¶W¨WX ™PBQ<äÕAK&@Z¬Š¼€KëêZøÜ½mLÃ\\©ÔôŠ4%®<÷ª*˜çf)EK¤Î¢ÚH‡îı¯‚=ƒ §aŸÁ†ŸÀbgaÃØ— #Ï 7\nĞÓd¡Ï€£Ï€£à`\Z:şğÆ3à…}\0¾ûş”\0„‹ÃÑò¤ŒN~œ\Zã«½œ{EÑ6&³pŠQ>bi³ÒIá3äŞşı{˜Â.`Tš~¿ìxş¬vº—¥¹QA}¿ı2ÉçƒÅ˜¢ÁS! U+Ô*ŞÇĞ‘lıÇz/€*	·óËĞs¸ÆãõËĞâ,®aN©p-qÎ]zä€KQÑåÑ¾íXçKü#mUäÍªªEîÚ2e…êÛºn$î“Ñ­x:\'÷#€rè£ie GÉâJ\r¯KÛ\0”·Ÿ;xt,ŠK]%Lû…–ÎÁVàµY?}“\"<t¿É~\nJo¦@©!‘b}ÛSğGsoZ~ÊÌ6ã)÷Zåç¨É\\•\\<\r%y‹Í}I¤ëWª}š\ZÔÓå¼P7:¾ç4<O»l†‰ˆ¢ï~%íë g*ú‰˜b†0=çÒÓc~ˆï%²ó“¸ĞŞà““œC¿Ğ¦\n³1eTD>m³3ï­&áeËÌV_ mê«ñºìœï—ª\'$.­\\µÙ¡Àûí÷TµÙeûé?õä(Ú%d¢u¦i_rC“»ƒJ®\ZéôÉ÷ tÆCy×WáP\"3Áy™©èGZèqVö¨Ü—ÃƒÓÅãÊåqãœ?#œ’ÀA¦:\r<ïrXA×ÊpÈó)ÕãßJº®Ù®æ–ø<V´-|pšŒ?ª|h>¯YmüyİX!™³ÏyZ1š£	¶%Ñeo±5«Délói›Ü‡hjvÿB2Ê(ÂÆyZ¯7Õ_ÊÓ¢İr*‹=èĞ ½˜HÍİÖ:Ï»‹.&Híãy³ô§¬İ:…	«ñÅ $„®#» lJŸÚëµ0CğM¿·²Î\"Óa7íqëkÊ`7ó8Šiıİ1Ïûû½ÏÒ~Õ¯ëÓõêÀ&Ü9m‰_×Ñ7Q¼GŞj¢ìºôÙÓÆ´ÛÚ™–li¬œX n¬¼¥qÚ¯ø%ìX>×è\ZÜØ4ÁÑuûƒ«\0yf‰m…åŒÚnu„ŸzhA®&41&›¶Ö×»Äv9ËÙ Ó³İÛ={BÚmxr<`X—F8„$l¼Ì\\™\\ıÓd‡\\Fß¿újw©ïqªåÏa£Evk“şLĞ—.ï,´Ñq²¾6ÏCÛ˜·Ú½®((GoÎDkJ­-ÖšX¯uI|ÓÙ¡İ.	cg‚ŞÊîêàF¬#àÑY9.ÜÎ¤·¬Ô\Z‘„¤ò–-“İŞ´EuÅöH\Z5¶+Pn\n(ºeõ§W”Y÷Æ{`©œ$Téw{d2Ç\ZÈ	ÛKê¢*¹Ê[ ms¡RQïv¯- 5ä«ÖCÏÍÃ˜Áú@]û2Ä]G,F\'j±7,MÍfmc>MÛMİB8’‡ˆ<ÜÑµúffúp.\\•\Z¥ùx{wÖééBš/ğqîÊ£‚Jºµáìá•[5ælóí.´s|‘@··­v¦™*µp`eS_0ÀÄ§ä	Ò?u¯Õv×#²Ò\ZGƒÛbà²ÃËšß\"Å#+W›Q§3D³ÀL^³&‰R›\'u‡Dëur©­kÇá½æNàê…<<ç¼\'ª})„øgêRïk,¡,öfæ¦$%‚Ü‚íÜ-£ÀJË( bçN·\ZE\".—!2Å\"÷É\nËÜGŠ/ êT’o1<¼½Øjä(“2¼©Á”pò,RFù}Ed‡”­Ÿ²ú<Î\\ZBÉšÑÜ.è÷¨Oe˜”†•Hß„çít*PÊ[ó6Îi÷‚·»y¨\0(ƒšÒBqn(fÄ*\n¤V¸UIÜÅòøÛï·”éÌ+qzû÷ï²æÜDï¿¦pT{û÷¾ÏIóö¢¨ºƒç‚ûˆ´šV¾İTc÷øYË òWIvºÒwá-eò\"›ğ.e/õš›F‰Z4ÎVöıæ¥ùÌTö0g—˜6º³ÎT¤ŠD	ùÉ_vø#JZ¥ªºKÑUˆÜ½Sr&qsÅ¡w°¿Cp#à°øoE(aö×”#LÑ[\'òØ¹³HÊà—Hv¤¾8ôP<Gp/±ÍÎ7TP§í^ÊTÅJŒÏ–@p®L~¿hS@òF7cªÈññgîpY(Œgp’~¦½¢*ËÆCÿ¼hÂú+r¢¤·,¹°¾-ŠGlr u}³!¿ë!Õhä¬LãĞ¼\'ÎÄ’	]4¸Î»Häïèwz–ïr—¼yrw~/%kŠ.ÜÌó¥bÒÜÌòò}şÔ\n¬*XMô…³WäÓ1Ÿï/”î7 ß€L×c“ğPqG’Ì#´Ó)É4ø‘²î>\'Wµwëÿ(€Àg Y?*ù_¹›t7à/&;Lû#–¸†?YgÀ„ocqËàÇ\nX¸cİt¯«ÃªOÅ´‡¶ˆ;kèp”LAúˆ#1¼¢¥T³WÉfe¤ï#ºÄ9aÑª{èÔö}sr/é*Ê2˜òE2Cœˆ¿ù€o	»|š6”¥RéÈ“+ÛÕ\nÎšéEèÌo¯ùğ…YYÙ©ÌL©(H>åÅ2<õÛ-è]Â‡Óä¸\Z}©f•W”×ù%å{Ê\rNÀš$¹ù0°Ìƒ¬p¹?Â‘¬Ğ<Ê+KÙ{sâ‰ùş+ñN?\rÆw×[ğ ‹Q|‰XÙãE½^Ş¼ú¢!ñuy«*ÿ‘{P­âF$¨7UğÜ}R-2ğHûë”>hÚõı3„-}’zål^&Ì-êâ0Ÿúë¦oobçá‡‰ŞKĞoFï_)\\âT[ÒzŠ‘…\\ëx¼-ZhŞ†\0?<UŠâÚ¤\næŒÕs2Ü£Å8‡J>JŞì9J·œkÔáıÿss8rÂ¸–%ï­ŸéãLi‘KRä¬=Ë/-r»hTB6^Z‚OJğú±¼-) ™¢¦X¥ENI‘“fã‰¸šå\\Â¼®ëH²ä„[ø[¾vöu’ÿö1¼Ñ¦w¯ÄÛF>FiIÂm!)v`¿E¸V%İ.`®™ÑAO¿;AÅ{ê\\%Ş~/ô¡øh_òÈ)<2o´ÿW@¸fqr\nÅ¶Àâ#£øÈÍ\\{¡ˆ©”-\ZE-\0Uì”.€—ÔÑ¸R ·9ı¯8€—B¸{áÉeÕ½|K\nğK1Tuı!Å	¡:]¤­!‰ehÅG÷Ş7\0*éß¾8gÄâ#³øèNCÊè¾/Î#ÓJ\r&×@uÌû‰F‡‹J€z…G\'áÑ@\\L±‹Ÿƒäb…ûr!„K È<§gëÜ§n$Œ©?LéÜ6ÍG%HŸŠ”QŠR„šHq³*Tqİ­ÀBy·X¾È?\\¨øˆ/>*·{§*Öh `‘&nql]55ïŠîcË7Šƒäj·|ñ­óx‹Ş>Tğ|b{ênçÑÇQ°$öaäléf”„ºKí)	0SG3ËÃ	åıy¾Yš¾àïÎ¿šáO^ÎÌËŞy‘½\\3ó€ş“½{ XÕXöí/`¸·è¸%4‰ÃÇ|H§ ’[ê%}õ[V+‘§c4&tFt¯(óVìQJëşæôiyÒ¤£p\Z¡2¢\Z‰¸t9«×±H+kC$bc–ç8Œr×åHŒª‘ˆUShæp’F\":«„8Ä”~Ä=Sv¡Èìd¯\"gŸDØËâ‘ÖÖÈ:§Dç¬ª³4BXñ¦ö,”<ß* •µĞ#õÄ#ÃYá~¦\0-€—1ä\0S–Gà0ÏAhö¤õS‘šîÒ0Ä\Z=C\0°»dèEıˆ6Eê}ÓRñŞHí7CnhÖ\Z¢Å…Á†šºÛ2ë/ººj¥ñ‹é‘ÛÛ‡=ªÎŒÙŠŞía}IØ»ÃNOl@®c©V—®xš\Zç)°êŒá,™“±ˆÁW¸E{ÂDÒ‚¹\0ö\'\ZùW£¦­ñco^[kİ\"ZívOaûW?8d\Z(¸9€¶ÙÄ¤ñJáv;–\ZA=ÁgÂ¸«xØì¡.Öö	Öh+û¡<f³öØ³¦k§6•tÖEgîÒ·Mi¦SJ=t+\nÅëoøŠ‹Q½ƒt¡šÊiGÖdòx\Z¯»ıúÂšÊ—¾×\'œÍ¡ï´v0½Âwh­\rĞ> MPhq™tE%¥‘áÈ[¼OÕG{ >ÔÏ³öÁÇ „²œîìJÁr áµB~“êø˜°Ö:\\w«ñ]ÓP’7\0ŠŞ£€D×ÃÚîÒ›Š¡á×Õ¸Ô=ám}§MIÌÂjV¤:o1}Õ\'/äŠTNÃ™ÒÚôíxšï·ÌºW§÷g·Mö)r·]g\nÔ¸¸\0ØĞå<:PcúšÖ««wÆÖu7˜øü]$X\nıÒ3èÑ²¸šZÄ,t®»:4Ñ\'¼\rFÈ°&œëœ úeßJäŠ‹Â| v¶¸£«íi…ICt÷ÚºÓ?ñÕu2„¦Bm©mxÖÌIÈñæ@9KÖÖl(c‰[¨kÿìÁZm»œx­…5w°ƒD_ÛŒCyØÚà½\Z&Õæ²Ğmpf †l\n“y“m®¬Áv£6†Úà´8áë-ŞD­Õai×ít!e51õiw\ri¤¹èµËGĞé~X3ùÚ\ZÏv’BJƒ…1tÛB×]º{jY[Lš×\r{¬ÛêTlgHôI»Îêü9uG#®ÖSë}¹I±óYÚhmOm«-ÖÙb9öQjÓíşÇo•ìü‡b†˜¶³\0ÍÖM^>íg£ùjÀ)à\ng˜ƒ×9\\Ï[’nJ“ö^\Z7§ø¬…°~ı0çöÒ‰œŸ-S™N[İÕÙ©‚¨ŠGÓ=2AÚPßº]ğdÛ4v¡v\Zcû×el3Ú‰ĞV?Nºº9ó²Øsû$¬Eş°íf]¸,6ÂBé±6qÒÖièğËÕ­©ëé®Ù›aî‚‡Ïãö g×vØ:‚“¹Ëb£}Ï3öÎfäŞ…¼.P­&°Kh<Üp¼i¬NâvñófŠ³‹îa6›Ïğñn#œØ~bÈo	m’èÓˆB`W|àÍYjÅ¹‡#æÊ“Ò^oÄÉŞTÀL\rÎ³MGikÂøÌy¯‘m‚¤`½{ÅÇ+Üßû4K®Gs\nkiÖRî/¤£ãÈÄÌë¶µÖaÚkÚöÔÕkoC´3Üï6ãqëÜêuXù<Q:ûÆ@\"pcÛ¼0(¯ŒzÄä:\0Zz›bò´mOFìh»ÀvÅWäõáØ<úÂÜG×Œu¾X$Õ²½éš¯:ó =˜å:íÌ·ØRA\\¶Ol¶}T5úŞô/\0s9lK’›Rı‰İÃğn¯}[™¶}j0>\\-‡Ö˜\"ÛĞ²ŞC¤9¶¼ÀÊÚk][»“E°t¿Õ\"\0İğ=Ó8hİ”Ù	,¨½CŒZ`³o6Æú°å×q ñ«ºœt—ÁN³º{¾\"q:=;Ãh}p/{Yém‰ı¨yÑ0ÁqÛ®_gÍÕAZêÕ@\Z=OÙZÀl¼±ÙqÕk¬–®º†³É ×çÔ.ªKŠ£Áµ.o™ö\Z™­YÏr–cqÃMg,ºæÜW¡ëŠFØ™‘¤]MwŞ	;y¦ÀÔ/N’J«ÁğÉ¼ïy§p-doº@igßSå?,}èjéï™ÔÒ÷,†¦YY\\\\kWZu}Ö†3¦»\Z‘ı~o!¶µ;ã‰YMëá+v„3í²ƒ3Xd—™Ôµsfh¸RgÊwkCR´-Xû-ìbŠá^\'ó“ÙóÑ¶EÇ~]Ÿ/ tZÕ\ZÃVë\nWÃŸèæò\'s>¥k;¡×Ùj¾¢§}sA^vû‘6\0\0Ší£òšÃ0ãÔ&æNW­Ñ$˜qû1Şl—<Cm‰pĞ1Ñ+ò,}ki\rÇ£yaì‰ÔX.½aUˆ<Y1ZcìdØ\Zk\ZO	,éR\rô·Í³Ë­—.¡×%şªŒu–WzíÚ¤vd³-í†.¬€‡µtvé5Ám\Z9 sf#.6mëm²†ö@¯6é“mfu8c¦Ô^+8„jJÏm:¯w‚óÆë.¸QoCµ\rêúø[°îóÈfŞ±-£ëõ¹1XxXÀ\0NS8 +¼á‘\\·Æƒ¶(t‰À-–oô%>„63\nÂ…3Ø³\'6õåó¯#ØÜö\0ìIÀEµæ¹‚›úîz±‘IërX_Ö Ò4×{v{¼8ƒ]ßŸÕ•EmwÌñQûÍn×^w‚ŠÔÄÔ45GãÉXµDG”IJc:µ[ğ“Şd ã$¸çPï°[ºî.ë0CØÈ\\’}üÚÅªGØíîªº|tG\"6şÖ[ÉÛCÏÀm¨êcoçØ¹\nÍÀPäŒH`ïÈ`“•÷ö´…´w¬Ávgˆ¨}8­@7õ*ØªM»Ğ†êÔä‘6Ş¬!U¸ Ñsú6¿0uŒ­ŠOœä+èC´Ñ³¾°ƒÃÿPËØœ>–1Şt¢ÜÃ=\r7–İK·;áòXÓ¶ÍĞäÊ	fœpAÒê*ğTh[½ËHâl¦=Gº&=ófĞ¾Ë°,t^Mf\n¨Ïl~Ñ,…×il½Ó˜5/“Ó˜?ò|8#CÂ?bã+ûW·á×M¼~Q/`í,8­îÅ5¦úºqİ9ãÑÎ;vÉÁAS§»ÃÑyÅ,}Û,€«=S¹z°éK &ÈƒAgz˜ı\nğØ!¶:‰Jß@5f¹>w0|¸1ä¼[©‹qŸ×çµö1bë«…>¥ê0Ëk“…×·:áí¸6_Ã\0Ù¥\Z‡F@O\r£œ—]¨„Ö­¹2İ¶ûB£“g‹œ-|Ê\'\Z\\˜ã¦6`	ˆ?rqC\0aù\"<§ı]ƒ=O¬8Â­#K|w½¯÷.Ã¶IìPæà–W“uúõÃt\ng/™l…8Ò]g‹–r$”£mÌw«=0;\\{KG“±6Ş„Øùú:¯Sç³Ÿ¹í~Û®œÃ˜Tmë®¸3L¶e<*}[¢ä3\nÖÙZ+1ê2{š·Y¦±ò¶}oÏuÍñÙñ~báä\0è2=e«¹Š\"ûŞHT/.ëšˆq¢I½çF^Í‚áW/Ò|Qc¿®H-Ü¸ì,¤ØënuñÈİEìl¦[_Ùí:­µqFÖZwzÁpÉÂá™ôÀÖ¥ã]©zåÃó%#xGØVOÚöe_èXé‘…ÁµÖëœäm H6µå•·êk\0ïNÆ0xÖŞ¸NX}aŒ¥3Ã\n aí=‘£áı¾OÈàp5k(o€¨FËÌ¤ôyƒ™.iTZµj“®Ó”¾i£UÇ\r¿1Ÿ³à¬­K°ez·ô;Êö8Mµî›õŞZ!hâÜœ;¸aH²;ü+@ş±Xzgû`GXÁB=ÕĞ!¶?³Ëñ\\@Ø‚\'éÃ„eˆ¹pdZÂQ¤VTp¸e×ÁFq^‚S:\\÷—î¢7Ú.e†u}ßíö\'º=ì­z3<ÔpŞÀ»¶|´.\r¡:&ìù¨€aW5[€-C“+l *Î[PSÚ-W¶¸–­6XªAH­u‡4ŒM$à›£âÒWj7h\\›½5_\0P÷T›Ÿ‡È‘vU@³lË„ÀÒ‹ÖœX\"ÇÙæ*­€­©Æı+ôàı‘\"ƒİ!û¬°‡ìÑ„º®†¢,ã+#‘ ´d‰Õ$¶W‰çH»ßœrw…‘ı®J4†ï8A@FèÎlÕ¿¶áÖş¼W$ÔóiôrŞ0KBóY ³Ùo÷Ø%{\ZÇŒv»Ö€ï\rÌpP_+Ê‚…;KRk^aÁu½C#;Ùã.Åœì&ê÷­¾H¶»WmOĞ—Éş¸\"\'ú†Ø7Qõ¢ÙüÚğçV«~©ï7ğ¦³_.t’Á»¼8ğrNÀôªİÕ€>§Y+¢€×ÈRã`!íáZsÛôf]–)ôî–Î´¯çãÂAV¥İêĞC˜Ó¹EÎhÔ¦$¶lµicTaië2~YÙ”Y³+óŒ7‚9m¦6eï\Z(\rÎ¶WcsÕWêáàÁê¬Gn$TqíÌòô¢˜ v\\’ÁÉ¹±^·—IsZC§ºCïdvÖ]»»UsÒ¨á’íñ§5ŠèDwÔb\rËU\rq\'·Ñ:ÎÌb/×vè‹tÄÔiBœz<AÕDGB{Ròœ2‡<©‹ºŞ:(1í,hf3:÷&ƒ-Ë-ıe}xZs†¸\n¿R»$8@	ñÚk6:Œ·o5—\'uB_-ÔÀ\r„®£Ë)ÌBêÌÒRG®ë5­^:~wHU~mD\rö¼Vp6©dè?;0ô;\0@‹iö\\¯Ÿ6\0ØZ GĞêmtß²ƒê3T­OiİîâØ”¦KÊ%/µ@à:!Â²E—Ö¹«Ù›iÿªğaªRÖÆ@F›éêº¦˜í»ÎW=OwÅf0ÿX{Ú_tÔ@‡çòÕ¨×Ç,Â÷®ÒDê´`opÁ¦°ª5Ç5QiZö¶Ç¶İ@n•s6Ís“tw}LµææÑšã=Yœ\nÛ’½Ñ¼U0À0ËtéÙÌöÀ±?€De°A®\'pÀzK‰­­1C\"°Ş`Ö^¨(~ÅW3åz$á¶§HêÁçgÄ”òI|qpMæ \'šqV¬61}\\ö¥‹ãnºgK pŠxâ×ÌÛlÌsĞ9#/UÛô„öÒ:hª,„Ñ›İté¹anñMoÑiwı1$bÙ—İU»JÌÁÁ6—>STm7k3Á^Ø ¶±x\rdÒV¿€LO£+k³ÚÌ\rZ8Ÿ»×58¬÷/4<WvsÁ7\ZiQÊ¶Ù:³}ÌT­åqW3¶úBBOäŠ_›ı±på&{a9—®Ëöq§q°u”M¯ß!HÄ>´l²E´(~C¯&:²º˜’<ß\0õÉÄBšüåÈï~c¿^<áZˆ¯0–8iì»‘â,1LÒıía9aÀZëäwdM5İ¦0^š ‰Lzî¦-û´›\r[|b*Ğ›b¿H5@Mƒl+ãÃÒö‘æ¬]ïñ“s±UŒ7h` p°lèÓzí‰×®»iÆ,÷G\n¸Îå1Iµg«Ñrl€A‚gĞà\0;¹(ºê¯†dãh[ËuFïÅÆy°$a6—òN ÙIh‡`k8Å%â2hâT™!+Œ¨V<6”/f}ÚSˆ	ºBº	÷àóëK¿ñµô­Œ;hw¹¤2ƒ?N:µc[F	¼Ã5-’<\"P‡cĞü\n›:´H\\fKRåh0ë]èØï\ZöÔàh‡š¶g¬uXo‰¥¶\"ô~˜›x}YÃPÛ^­«†w„²İ_Qø*‹8\"ŒÌ+êSÚF¼^®±æ\0í%]NËœ.Ú£–¾ˆ9lRvM™Ú~Õ›E³sÜÍ¤«Ãã“kÆ³‚CñÓ´söŒ\ràÍ·”FªjŸº4kˆsVVÒš¯‡ıºŠõùÙàâ6}Ÿ?0=•ÓÙÃ8£\Z¸à«ıF].¦Ç.[_;›Å‰ÀÙ	´,uKélKG¹j4ZW‘ÛµËF\rv\\Ô´«1ìPgJ^ğZçˆCÌÀp×™ÊrnÖ‹…eq­ÅJÒTµm”Öfy¤—“Õ¡ƒy9æ„ë%$”õ¤í×zÔhâha@s{æé7{ív{\\Wù‘ñ‡|ÿ‚¬©­ÊÓº1cìói±m]ùY×ËÃ^pš8ÕÔ¹B¯Õ\"ø¡W—$n½!»ã	v˜ËìN€)4XIzëjKkÛ]ÓÅu/î­Ã`y	–¹Ë²§ö¥/Ï½ıŞõ`ĞdÁ¥í‰\ZÉNíù¾3>1ìW¤ä>Ùá 	[˜lª ¾^™ŞÕé¨vO˜`#©gtG£V¬vË×^“MuW?`\"sÔˆúä´®µh›×W‡ı~ÒÜ\\÷›A¢c8.¦x^ˆœÚn3ıá¨>C`S[Îº _=H¤÷œ³TP\0lPæ™æ˜UDz7G5ºÙÏÃµãuÆTm‡šõíØÔ‡±Ø[,Øù¢(Æ1B]DmJhsËIŸ÷[{§¿Z£º11,;C€º½ÙbğF\r¦‡KÃÁ¯Ö6íã¶ËÒaÉ\n—“ß¿ˆ2İ°©ìË[™5ô„÷ê‹+uĞi@òÖª%¾Î&°(6á¤tÍæ`ÑÙi\\ q{ËYM\Zµ\ruÓ»Ú‹­Ì¨µ²hv¸BÓ¬ÁJ­9SÛ ÚUj»6îın .ÁåYê‡Áp«¬§»¹ËBbƒöÑ\Z¿ºîtƒ%ÈíÓš8Âz}RÃ®“Ú† S®í„ËğªûĞiÒÃ°­I¦Z“¶µ!¯\nà÷\\FsWìbºŞïgËnĞku×\Z_—ÂƒMs¢L|¹3-lî­·‹¥Ç«È¡O) ôıv½ß2ïÎéî §Íc»-l»-šny{lQêŒ°Vk÷š=P6Ö’è.Åõ’k£GÅ›L©`ÅhßP@öp^ynß75O®MàšgøuÕƒuqšŸ4 Øçûátæ0¢ˆI®?~ìk{\0ÚÓ„Bï×ÓŞck2\"XgZv¹+ˆPƒ†Ú]/|“\Z\0^ovÈ\ZŞQğ­Óñİë¡ÖàöNB$*8òÈƒzéÎÅÖáx@&Ä´İ€Á7.®Ó½tg3\rX¯\\§Qs–\Zí¬­Hƒy Õ[s³ÆùÃµ\'®j\r£”¥ \\‡×}o¹äwv¡§;h„×Çky†kŒĞĞúšG›ºCqußgÖ\"(JpÓÓ6Å¶iÕâ;£\0ÓÒ¡¹Í`?Z÷»»î†bÌÉNíH(·i€TšÂêJÌ‰‹B‹¡AoÜ•y¨Ù§ğÓ4{fÏšÏ—>)RHoJ¦^}Ö–„>Órãã†	VÀ´gúše[Pÿ¼áñŞ^ ©¥09Qc\r“ZMD“9º8øšØÓ¾]-Mt1\ZÇ ÉZ\0®^½³qSCƒÖeW;a3´´ˆ½¾×–{z\'Î ¡ÒÜv†¤ŠÏ´õµ˜·×åëxy±¥)5¥Æ¬7ÜúŞuE!ls¹ tn?×¬>Ùôds²³¡JÂ˜uŒÊ[u‚İO´n@n‚’<XÇE¶ÇŒ–ÜÛõ[µíÁlØİ^Ko(×µS\r˜„‰ví;ëùFÚ«¯°Eµ\\ïŠ¹ˆwËƒıÂÁ°¦7\\NÙ#¸hûŞ¼½šw1‘v\'™¥µ×1ú{º\'w©£nÚû!ËÒc6Ø†;{‚\r\0!ËÖÄ„v@}p\Zòƒşe{A—¤Å‹¦h6Qû„.µı‚Rj«-·ù“(vÉëy\'¯½E—\"Ù2G^ÜÑÌno¤·zÇ¯ñøz\'L•`¬©ÁyFp»EwO[Œ2$´ápA@g!h eâ5Óa8gã³uÿ$ dÕÕÁœÇä³¤,^!kÛÚ$Îv\\Æ?v·LŸœ\'~KYÓ@6&Qv9]÷Ñy×g7‚ÕF6än±iÕ;H].ĞŠ:+#Û;+¶q]\Z½æAñ¡ºDñ¶e¬QšÏL:¹T}İ‡€oì›Måè.1:²²BZfÀ˜:¤Ò™á\r±bÛ*:\\Ã3ä06X‰Ê¼Px,Yµ.NmS&€tF[whĞÓº­GÓ¡¹>=TñIg}¨ÃË>¸ZÜÀ¡\ZÍ¹“Av‚s?_,ùP§¤Ö¥½8è€\"ˆêÀ–1š ¼åÑ&Mkyp[‡&`›)ò^}ÅíÖ£14öÑñ¡6{‚ÛúÂ1It³:Î–À¶Ñ²Vµ`ÁìUzN,úcıÂmdK¨_©…t¹P;`£`Øjí`Æ×«œÇÒEÜWƒ39AÕu¸`†S³Fn]í\\_Y0®¤‡&G‰ŸU‰ÕQR N_Pôæá8.1ºCğ\\V¨¬í`&OT!‘a&2C.á›q„Ü’rş~Dayë\\åµxsZ|¸¼#.T4˜MbRáJâL¥§‹ZEn­Şb²† LÙÊ¤Ô(q¹~¤q6Á^ˆ›Ÿû\ZtîèªéPLqàÑ‡{Y;ãã3¹:KG¾äG{ a¶G˜-{ó¼TºÒØ›‘%\'Š¾Çÿ\'Q/3€âTñnÆ.˜Í} w·ñ{d§20·¤ayW®BùÈo¬–\'aÜût¸ˆ°®\n–Õ.Éñ$Rê7¨„ˆéhÀq¨­$8l6€w!ÌmÅğVR£<ë`>*C\Zª+4ïû‹¿W¾yãn9ËŞç n¦ëq†¿²\nI@ºR¼nÁê*0š<Îå²6&I©_v3m‡\Z2ZŞÓò¢ü»•¯ª0K‚àİØ4S@,Î¼YQ#”»*‹²WW vsÍ%­|P!,e¡†{ÉuKÑJŞUÌùfIò=Œè\'Àn,PC„SÉÌEÓ-åãŞ¥ŒÃ&AñŞnÜSpïÆK±ÀS²¡]\n2âş=‡eRıæÚNh³oHæñO‘±Ût(hc±ŒMîg5T\n>t§´N‚\"!‘‡fKyºë¯ãíi®Í¶­şv¶íî¦—º±„ıLŞhãmoƒN{÷:œ“ƒíb\rhãîg«ÍEBéıxÛİŸ¶Êş2›5g½°¬1;në§\Z‰AxRÇÇc­y6MşP“û×¦ì‰Íz3k6v­Ác÷œŸô@vo€Šºâ>uènJÙÔúG\r3å½£vú¸Y­û—3&îš…kÔ@mé\Z\\ÿĞYodRòÂ>œİãt¿ƒêµİ€\ry_{j ©1~Ó«w\Z“NWÃy“ß@ë¶Xwó\ZßÛËpõ§çëöºÎx³æ¹î†z5_´öµoj<Bqµ®yÔº?Ï£•Ï²ŞgF9æÎì›£hıJöæÃãğb´[†1èq½9ìÕ6¬¸±l¿ØæhAÏÄà†V½V»X MÌ¥q@PGPıjzóËˆëÔ8¤··jPFšÖØ–ìÔô>Ã¨t¡&.jğNMj1JŞl®+²m[LF­úØ7 vp8õõå¢Õj7Îüù|à\ZhÓ\rÿ¥úù¸¼—ş13Á1bM5Ö—ær¯z3œÙ”b5zÇFÃ˜¸¶>.\0«±ìÎDLnÛØŠÙÆt’kh¶±FÁnÏ}Nàû{{Ø<©àÎX‘¢yİÖ/Ètº°\0Ë÷Ù­ãé¨ÑU(³9İµø¶	@ón=è”¥îŒ«Ş®.:FÌöv¬øú¹¿Ôé‘±Ã\0èÓÍ}jnè± aç)ŠÍÅô@Mq\0ózm\ZÚÌØ\nS}8ìL†¼Õed3@Ô4Ã¼ö\rdgIÃlÿTwİÆhF\0°¢‰ã1wç[Dîi­N§xãHèGeWƒjíÅ¼N´¥äYİ%ÌÆ¸WÉÉiw•bº[¾ÎìugLëÚö*“Ãd;ç4JÙ1’‡(uóÈtø]³é^¦³^ß®ûëK­b<e›¶·¡j1n´¦S¢7±èÎ†\0\n‚.kØ9ÄzM´`Ögk\n+)„É¶®Î–w¼?#¤6`HŒ `W›¡³i-ÍÁÅy—9±c·µ\"Z\'EÜ\\Dª0ó»ğ²İ9)¬³iì…L6$Á“üz-vFÚŒ­·1Ÿ\0‘m.ü6ÏÚÇïÏ6>ÕFZ‡¹á£ká‚ôY!š~Ëœ3ç>Ğ±Æœší!±©iğqŠmb6˜ÖB£{è­üæXÁ›“*­ßm O<uxóB.®$‰M\nÖ×Áê­½-48gØ±ÆRîláâiq0‚aæC\Z¶Ú 5¼ ”¡ê5ÔØHÚaFÒ¨Éy*K4‘Ğo’Øà¥Öš2&’â×ñæ¥;Ò†„ Î¡¦õÊŸ;|S)+/\0à˜uG«-¿€\ryB|¶7RÎüò„Œš-œijé·À)9¥&àª\'oíº=\"°íÒÍé¨­NëóÓ¦yn	ÄÂhô`„pæ¢áƒ³#N1¤u\Zm„õÎ»¥ä3Á„¶ó3”åwvVÃÙrá…œ¡…øúy‡t„½SšV:1­æü<9fWmfî9—Æpqs²C_i$<•˜6á´Mpt®“L@HAf|¯¶\\tÏ bIÇ9Ùó†@ÀÄÜ±SmŞ0Ğº¯Yd»?ÑU½Áçk§Ë.üı@äØ\rs‚±cËmXİ£Ó\'æÇ	ÕÄ¡/ºÚz0œÅú^€K£	3°HËåÅ…¦£œü¡×œóÊ8øtiY\'X#öJ«ÛŠİœÕç#zMrŸğõºÒÌqˆLq0¦ .)k&çøm{ÕèLXC	©_à6|h˜;ÒŒ…º+ä\nûÚPF\0¨~BOÒfSCd¤>•Y\n;Œär­æHëŒ³Ç©ìv—ÆÎävÀŠ1Pæ®¼™àóÓ	!% \rlğíõ|mµwg‚9\0]\r;l,ü2áÄtd@f×ñóÙ3\'Çñ’3®*Ñš:Ì‘5ö¤§×haj«\'¨³œ¸â½6wÌñ¨ûû¥+ŒìùfÇŸ—2¸Ä7W-¿ËN½Š“—±rÅUs­7NÍ“5°Z+u<8!‡Ö¯Qm¨ã/Ïm½ãø¦à\'kH×x½)/.›=ßôyC9Ó×Z©˜Mœ‘ÅöÄiô0VMá/«¹TÔÕv¼9´ z2m*j÷Ä©#~Õ5ÏÓ‹\'O×Ã@Bzû©2ôZ21ëÃ| \Zj<W3›Šh®:õs“ÀöÆ‰Ò´M«>‰ˆ7}GiŸ÷SêîÎmøõËÈº\ncºµêÆÓU÷È²Gğ°	fz@wĞê½Fk¶&·|@Û™I*#«ä®³4	‡^»Üh UêÂ3`,»u²G×»ã½Ğ´åõ^ZÎÊü³‘³VkDòÊDo!§#ƒ¶gjëæ|NˆLãÜj[{e$\0Ì‘¨-6çZÓ+¸b»(ªš:ÈÈ“£«WuJêtûÔ­âéê\"ëË“ÂÔµ£z:¡İEã²¶ö ÚÁQÜ§°¶ëÔzM¦ë¹3y!“Êâ¼Û°ˆ¿@ôzİ\\(z¸¬µZµº«ÂŠ|õøE0ØMgÈOc¼?mN¨ÎÌÏê•‘ˆéºŒ³?P;kéëáJŞ,W2Ñİ\r:]š×D?m:(mZ“ÑZ€fÓCÀK‘:nÜÆÅÁ5Ê´át‰Lg-û§g*­ı±ãÌdƒ‡ÈYÈ3‡\\Ó Öb}€¶&S_@Tvµ_Ñú¢¾`ãnXÖÇXRt“½J8\'dwª#n/,›Rw0»øõÃ¡ÛÊëì8Ÿ }¨­Ş®µÅÏüªMÙncZœŸ]„hó€6İ+çf“•;[`´¢§²ôvgòÙq/;¯3Ù†Ct\'µ­vb/€­0œ‘ÇÑ£éÉãĞ3aBê#Ü;³œ9NxEB°Ù?/×‡6·ğfFÉ2÷}Õ[pZWÖ\\Q(1¯O«=bW¼ï§¼ÿŒR8ü‹eê—·8lÒgŠoÿf¸¥ÕÎ’şR	Ï÷¿½\nßâ%~©RXØ‘\"•W¨ı\n\n‰¶}şíçŸ~v†ŞF-ˆ\"BCEê\nö5$üĞÉá’^„ôjÏ™k½^o&ë©ÏáßóïÏ©wõ\\½Ï¾WÁz;ıı3|óÏ^Å£ª|Ùç4¬²>|ÖvYßší\"İËú\\Eƒ<íªp©Â+ßªñ­Â³l<Ÿ½¯\ZÇ*Z|6–em6wÑóÙüz6÷óm½:G^][e}xV×_Ø=ü2‰\Z<Íõ!qÄ<zÚÙB4ÙáYW3¶ûËğp:jµ&Ÿ°«ê²‰¶dÜê›ğö ‡£9¼çS4\r¦GCÔnÓ‡›5Uçá«ŠÖtÄñ–Ô\\Ùëu]pæ3ê£ãĞ¼3Š7(¦/ûNù[¡¡ãbWAj¡÷\'Š¯Öu±êô™Í`ÄªkKÀW=ë(™ŞŠ<K¿æİšlŒ–.éÕ;^Û]Ğ%¬I¬Åµ¦lÇÑ3µW£•-ÑÎÙ“=AçÍ™îTnm‹OO”ÍÊ]±îv²ì»t8µ\\¥7ô–‡ÉwicŞ!Œ+tL5Ö¿ÌU¿;¬ïÆ”÷Í‹>døéy¦‰gq%‚\"mMZØ«Éæ`ˆ?;|AÖñ€º—Ãl1%—UÂ†Ùb#^¬Ô\Ztö‡ğ	b<ğ—êª-b:m_šÜ³MiBãõz­Õ17‹á]¢5¢ÏšZ«kÊÑTüq[Õ\Zğ©İÔHlÓ¯<êï*-¦üØ;ƒzgKyÛXS»63à{s¤Û]æLz—Ğ9}wív¸zoX~Ï¼p”a±£-?èŠB¥œàÄ6áFšŞeºÛ¹ Qh§ßå÷A?ÑŞºvšîy‹–¾b2´:ë ä”uäæ¬FÌg£`#66¸sìv£_¯oùÃ…=«K¡»	şt)lf3ëäº°wÒ@± £¶û0±ò÷îT8å`9ƒöuÎtİ…½—Z‡î†Z*„`(}%(KQz«^{‡©İ™]P;¶GÎ|òà)ä\n©ÁÛI™!`½Fõ1-øİQ:†ÕlÌ´§gu-ËµĞ]_”KP¾œXn´t[-–ƒcfõÏ¸¯Q„ä/ú:š®}spÆ¬ÅB0g.sm“ÌqÓÇ‘0ÁgÈƒA´9ßZÚÁÙË³Äm£6åˆõp3\\LÆ0y(­V·~0=—<­–ˆÿkËë³ÑÕ6mõm½œ‚Áá\Z?Ë×ºƒéè§l‚fÀIèÏmEBÈqÛY³ºgê6Ñ#}´»½Co4\\¨½K[ ÇÓóhl›`°ŒuÜçŞeèvG3†RêZ­«Ä8)½İŞìj¬wé6sÔ9º}±	½;†Ù‚hÊ^x«m÷\\c•şğ,_xƒ@òL ƒõ~yt–ŞÀ–û9×äÀ˜İ¥O =Çê7Àõ±_úI\n;ü¸‰ÇşH1ø|\"§h@÷=v5k€ôg8¶·fıób:cmÜõ/šGÜ…i	I³}R ÀÑÌpw>3mù+—h)“ë¸J_›;Ëïõ\Z•Ä©‘eõYee¹ÓÙbé›Ç‹0ë{Wç$}çüÈú¤ŞDù“5ç`8ÿ,R.:OÌIœ»Û•?‘+Ÿ¾®§óß¶Ø¤z¤p–CòŠŸÚ#óèLÁühsgky%O}àâÚKTqÉ…¯œ×#êÈ‰{Üœ[­ëÃØÆ\\\ry’ 	¢Û‡ÄfOSµUA!–ÖjHøÊ£[3ºîG$u^1—+A[3¦êy§ìãyÒmÁÃQ\Z·5\r;!	ìA^i\0Àµ>pjB­>¿ÔœZo6€OG›‹\"|YL§Vï55B3\0£Gl\0dL2C‚]X-–ìÏV@Ë\räpg¶»ô˜ıé^[¬­)MNéÉÚE\'2‹3ÒÕ„„f[›µcÏÅÚ¶ÙlBßâÏµfp„0‘Z\râ&î_q 5WW¨où!¶­÷­(›\Z/£±™İâDaí‘uĞNóŠ©xmxv£zs	)G°ƒAïÍ×åiÍ9–ª5ÌR¯Nˆ{`täEÉ˜üü¼î@@Ş-¶CÆ§}l¼å¨«Hë­ƒ6ØwV]ı ³¨>œèúâ8X¹+×:Â–^AzÔ\'rë@©Ï&µŞI‚*n\\q\0)‹DOìé°Ú•æpÙî÷‚xjƒ„*îêƒ‚ƒ+ßİÕìa7š³ÁIÅêlë@ıÉ˜ÎœÀ[*ı]oÆ\n“î†±Ì‹ÑÀWõ®…m††Kìç‹­‡ô{L°y\\¬—Ó£«|®V§Q^¸ìÉ=ã1íî°í±«q‡	~p:€ÕY¹½³w!$r‡ê(s¥:§&Ş¿4Ü‰;g}†[w»cc‹9Á¬íoš>!Ò\"inX¯éªãõ@š±Á™€A§äìöÙc¤MNãĞfL\nı‰g¥±Ö,^›^¨şŒ´.æ›ú—ı†X•mí¦›+eì™ùŒÁÛüUï©-Q=×ãS“Q¶˜!ë­ÎªÅ/G]wv5‡›.VôTEkÛ‹yŸ4õŞEEÒÃ\0f&ús‡ŞrKÎı	¹nj\\Ûvğ?Ó­5İl¢“EË; š@É—»NÊ›xİË~ësÍNš0*é²IX\r98İé´iÕ–´vGõáŒİóqídŸ1;Ö%¦³ß(pj+³¡J\r—šL÷%´:¢®+]Vúp>\\4h°áÂ}ÚÍÕÍLc\Zt³KĞ¸ÓÌ©™†ŠD_µi *æ¡5ä<gëÉD-<\r©oÛnk½ºÖZ05µ†ê°Ûk†Ùâİ€™h1à\rÕ Vûeé/ôşUhNØ¡n–ƒ`oéMq;›HÁÏ3¿9ã@[Ó¥8êRi=Ì.+\ZôÑ˜ èÅé®‡YÀ©Ü€%ºÌBR\0QÚ­W+¥í\\˜c{‚êxPfQŸmškÏŸ¹{}1Ó¡L:»Ë¬ÖçÑàt@Ùıq½ãÖöúPS¤öI7azµùË¢{3€¶Ä\0|ª­®\"J-©»©™<tÙ©g/öİQZíSÁ¦\0mûÇ\rtÔQ²‰İm‹7ÛQ›NéØü˜\\ö[šJ®9£Ù+gïÑÂØáÅ2IîLÛ›‰¯œF+_–±óù¤¬‰ã“FËĞñĞÙ.æj“\"lD\Zª§,vÌ¼úX·ÕM€¤:JdUyL´MªV¯í¹5J÷¹ËP™°R\"{öI1iAx£`ƒîL	\\Vš“)SG	À`»— 6qÔš˜­CPV=”Õ|‹\rx¢[\'.ë¨Z-ˆqh“jwË«t¯¥¯Öa&[ƒÁø2”EzC\\mQŒÚ}ö‡ÇÙnp`$.¦ë®N¾N¬§\\My6cn©ö±QçlEOAaÊ8”¨´ÀÙZ‚íT :t–\r˜XÒ¢æ!—~0üpÑ?Ù]¹=:î\'şuvôfCÂ$ê0p¡‡§«°y]>xMc7\Z:œˆuEc¤Ã\rØ?÷õ™!\Z9Û£“ØœuèÒ%¶ a¨È€1¦×@G½4½³A·I	­ÏÂ\n~ ¶âdlO¸:±.¶#Ñ¢j½Ãò*£ãÙò Ó°¶¦8Ğ¥å‚Ú\nÙì­$ùäØ–-8®?¼ÂµË4¢Ù‚Â,²=´g®ìb}mT\'Ñ¯mvÇæj/i¦Aá„íî \'íé“<ãkª7-›ÇÙê‚¯`eã÷Qn4SˆUM©×g‚Q4jÍÚjjwüî†`„Õ\\ j	ƒ+úèmAâW¼·=Õ$™•‰¾^¤\\mKªÖ•Ú\Z\\ŸLÈÆlX‰>8˜¨ö°a‡İ\ri~?\Z!ıõ•Z¹Œ¿Ô€Í¬h¯É·Fy;Ï—@¼w™\ZX‹”©Ù‡¾Gˆœåã™Ñ35ÿ¤„¶`zÂN ñ-÷×Œ°Ñ‡ÛØoÎ8h	g¢aÀ0¼.šÖ\Z˜¡õázGµõ~cŞ\0³…Ñ6ì^¾îÎØîj´Ğ; ·3Ç”7Ğ%q¸­­cC¤=ŸˆPmØî,;fVºÑ@ñëœo%ñ,è›•¸Álneü Õæyª7RW]Ä`ZÆqSÃ<¬¹r|nq1¥®p•`Ïíƒ®bˆŒ:	²|XNiË½^Vş×Zókb\n®ˆK×&¡HíÉmwÖpÃØ¢0!óÇàï××ãjŒö»c½6\'/[TU——Y€*ÒY\"í•ƒİÙ5šæ\Zø“¡ã\0lûöÉºÓÃ¡.¶.K¯ìôÊv¾éÁ¾+ô½Ø²Í\Z«&Æ9sĞ™ã#•$\\ïŠw:ı^mÈkCORÒ~Xã½KË£Õk;¨´ºI/¼ı±ÉZÄÖ\0ïZ‚¼lOFí]ÀUœ£°ƒCb¶²Ş´&qn_\nÎÙÀvÜîÜ¥¾y²=4!°/ö´ó-ÏªÚiRò^Ó]OóhŒ§³Õµ¯Aıƒ=æı‰O‰•¶@­½ìËŠâEf´\\ÎÄ‰2½ĞZ¿©ì}”ê:v£s8©Ë®¾šƒ¶ŞA‡>|X`ÍEh4WıÓ¸\"Ì·–ê`rw¦Q“³’Ï‘˜M=f¡\\¨&Ü>O¢áâ¢îúx£¶T©N\Z£-½?Îj(ëc¥eŸFıÁ¥©d§¹×<Ÿ¹şV“fÑÑ÷\\ ÕosÎC=uˆît­ö,ÌqO¾¼ê8Zß@Üét=k®j[É?À–›9?æ°î »O¯‹†ŠuÚmÏ &Põ@f¬û”|+ävåñMCc\0kÅÏ«f¿!áÇiœ;ÍV]İ_v´ÕF³éYZÀÀ^Á°íSë2÷LÏCF¼Xàãy:&g¤4Æ¡Ã¥)êìÆÃÄy3ª)âĞ®ué×=j>•3/s‰úm¶Ö2-”éAš	ÎI_œvˆÌ#àÔÈ\'X \"Fmt©{BO¼\rÚ—ºÓ;t–Zßöû>	K ×¿øË^°ÌÀ“è-ÇöpÎ€€‰íÄ+¹:ÚÛ–cî—ØĞfgÆ[ 4´¸ÊÇePR§Iœ·ÃSs(\0|¯×]ÁszÍ¬àš˜îº~%Æ²ËªC£ŞëõêÔb™Cùd	¡Ù­oa|EA[õV0:8y’N½Q¯§y\nµ½ÌfuÙÚ]kÛ-–{’ØO@oÒäº\0]¢F°6ãŠ„‘d_Ä$ì:Ç\Z‡\r­ƒş\"N0`Í±Aoí›\'g;0<iS;©«Ş©ŞòãV5…Zrø3©Ùˆ/m“Ö½G¦wM,JšWşşMäœ0?®b¥õÜw{ĞÈš24¦‰ŠI©²Ô…å¢¸ÓÏá} à£dÈ¨Ğ\rh&İ3§™±^¾`Ÿ[Qğãÿg¨ğOÌ‘Èæ1¹*%wïYö[ES©*÷LY÷ñÍ¾qOâÀ¿ØğGˆ¶“3¨¢Ÿt±ÔHù–2&eõŒ<ìES\ZSï3Ñ•ıŒ±«² n¦,ˆ£TŞq0J(±%®ŞhfTA ¥¡Şa½FÖˆRO(=r¡ßn&ŞjP)‡m,²•‹^&IËSèÁP™¿ƒ@h¶,wljŞZûaD›nz$J>¦:ı¸ı~küöjf ŒU-T˜éÒÙòÁÙ¶>	Óf‡˜¿—r%ÎÔx1el”_¯¤zL“÷+%MçÒm}eõÅÍŞì“\Z©©Y5½“.¥#?¢°¾%Îig…»‘eqîäğ‚¢’Wá@€|aÍdá%©V¢™–‰J¢/“)+\nU›¡/C*’±ÄõâÁšŸ{ÓLûèİÓ“¥Ò5çsñEqfµGr[”zCp*[è–Rª8\nåéN®YsŞ[rî¼›Di¢»bn2Y¾Ï\"<åz¦›„C~”äL³«Cyy(êe¸ß£¨É¹”ÙbĞêÕòJ“·„‚ù<P·Ôd¹ŒâYÂ&©JÌı?k6\nÒ|±%.txøXŒ ©–æ×ÌÌ†O@eí­“	Tœ-éÎÑ$MÑô-eQœÂ<…¬0YC¦Ÿ~ÊB·äiæ’9l«áNuKÂÖÈñ(÷Ù#¯y.§åK}~¾®EÇ²„Íşå<’ ÅìyL.$—ä;úkìî_Ş¾†fzy…ÄÃ¿Ê_¿Øàó\\[‘Â+‹ö«İŒİ¿r)ªâ	ùûW\0½}‚Añ¾ó’l9a\nƒ$Hşÿ–A\0ûË$¥¡é—ïLğ™ğ%×2¤\'¢ÍŸ8åâtº%d-©r<.ûÆMÚMM‚|Ş¿†w“Œı\Z’—™XDåš½SèÁ>áH)Ï›·ŒßV†¿¸Q%<÷6Tù„¼é¥ü`/I[QbâÌ¾gã*îNQÒ«0—D’ó*ü^ºğÓTvg×\\öÚ‡°qüûª´Vİ·4X¸|/¿AÊÕÍåˆ¥ÏSig]<íš›‘fñÔ‚K-ÈhSûôÈ{Q¾sE\Z»$Hô°Ë”ÙD1–±\0–İ·\n¦’ÅcÁWˆÿı09CÊ\'ÕÍJ¡ŸçÕûb“á‹lúÑt“`®É[¶ö²Y™?m&§<I,›B™ÿR:ËbMÒÃÕ÷f:ªü¨d=¼DÛì^ğ‡aFÄËP9m\"İM\\¶…ÈI6LÏóôíK÷Ÿªqª}rÒäô`)¹åŠ§ÔQ\"w2‹jE>šr2 nFÇUòşrQê*—li¿êH1u?Ö}ˆÇDi÷\rr¿\0ò©@ö„ˆQ÷Š†äºaşàcSŒ1ú\\Bn<Ù0ğ$Mvê0˜šTxÎ;:ØS:åò„GxE_ã\0’ø¥¦gõãhññ‰b0®/ÒûŒTQ¡J%Û@Z/T¦§»í·ÀÛGî,×vŒÚÑt’”«Ÿ¢Ÿ­~Cû9€lç²z­×ˆgÚ×ZŒÆ,=À_îïéaÄP>á|ïŸ0F.ÏUG’³îÜ<	â¡6,ËSÃuÄ™ÌÎ\rÓş\nûb’D0b0a¤‰ïGÛ–!€YP•joÒRMË(lFÉf^²{Gyã¾†xDç¨DÜ<\nt±ŒÜ`¥›‚óD<¾¶cÉš.Åî?ó’P(á½AxÕ.—Ş¸_Wê~¢€®,|>G\"—™<#šÂÙô‘ùª(µ?Qñ}~\nøe¹ }1å#s@9mJZ¯PNí¼”öºÎ?_³€r¸ï<¿øDF\0.êù>­­Š\'ıS\0KDÃñÇ¯tm^½İùd®<íÑ]óğ¤OŸ±â\nŞí1eëú‹ƒ\\¤qB\"$ášeÁ™^ƒ*s¶~t3ò1ôéMJ\rSİ —MõX|…Ş%J¿×)i9‡\\ù6üq:9`ñ¶ë¡œ†S7ÈpNJüô\n?7¯2á«ª&W)Î6˜Â\"­%GJòé+º‚›^Ü.²ÛI¹¤J4¾iàRôv5Q2¹SICy]ÔíB0+e<ôıqh­7àWõQU;Û×;SäÈœ‘³d*GÌ:-¬„\Z¯·øÚ~w%­G[M6m%T5í*UŸì­ŸÉ_Ğ¾4²÷yòcn‹¡R™X4x¶j_’¤s¸£™ÇëUJÌlñØãø-ªôó•\nQ~ÖôA¿,£±¬%ñ–yÊ…ÉËÕÿ™\"Yæ¨1šœr,ŸŒ8ÎI’›Y\r]É\'œ¹`…Ïg@ˆM(Šgç\0M‚<Î“\':õıÌ…CE¤50ów„(ñG%Bâ¤†Œ•€hH¨À7J@c— b’(Ê%@¸‰\"pBw-ÛD£«â<€›_áJÕ5ï’íŠ ÊrÙ@á‚pbJx^şØV_§)‚5x2m³ë$353‘ËËä=ãú¤pÚşO\\nT£\\İá€ßxRæúèÉbuõ\'”øD™d?‹²÷=¾e´{æ¡>ã‚…VîL3btŞ\'¥+çàÆÍb)Qa}2âé|ÓéñhµhœfnFHhÉs¾	pÍt{oÿ—fØ–ãq¦³Gø¯éG¤ŸP>Ü¾ÙÆKó5,ûÂ”á \ZÒÏÜMÏ\'3ãI›Y^üÅ¹Pıº$’¥$H²Œ~±…yò>Vß}	…†Ô”fĞ¯‚R<ëé)\'Ê(5ÿfZ¹[„WWîó9‘tòıWÇ!©_:•uÂë—€r^f~f¯7Ós«Öå§-¾İew|¥*¬›ƒ~JNx2şDuA—¸@hÔõV Ü H(Ş¶ôÆ° lY^nFf¶ÎüÜJØY†¬ÑÖPbt—¼°J¿NIuùáz•Ö1Ú_œ[…?08ñ¬æl5Ø£ˆÑ¦$ÄrŒÇyÇÂêª,øÆíÉãºè&~ı´XF»¯M¤°È½ .8Ïã5h*\'EŠ÷òÂ|‘4Ş§€›dÜÍ9s²L)Ä7ÍPnª§`«ËE‡êóMsÔÒ›eğ­Ì·›ˆQ®`şhÿİİ*òuŸãiÊ3!…?µ/”)«°»=LfIz¥`øóYKåÇ¨‡4ÄöµÆ>¼s*wìÒıÆ&İ_„êÂÁÈ@„R`³Q¸ú¿EÁÉs×ì:ü·LápÖFòïÕf‰Ø\0Ãğg­	ºåJ‘fz(% ’•Õ“Ü´i‡ú¢‘½æø•4Ñw.LÙ³ıuüKi8 Õ^2*°¢ÁáØøªÆåQ„_\'¡KZ~]êêòt‘\"µíJ´ù aØ±ŞÕH{Û´åu9\ZÒ ÏBK‹[¨\rÁXÎ¥=ºØÀ¶³¹êûî¯u[gdlªĞu±M+RtysØ‚úN§±h„ßùÕØÌp­ÛQ\ZA_l»ÍîÙóPOï2êhA‘->·ÇáÜ\r[ô¹ÛÚ@ƒ\rŒæh8ó•á85ÜG\Zpµ,p´³.£¡t©äw‡(“No¿İÙ³)½¹ã#Sc2ëYbgê5ü$Â\"<0…ëÀh^¶ü<ïÑÁ•¸®İË`Ô×À«´BÍZñ‚ú»\\z»íCú Ÿx¼lÛ›ÆfÕ;‰k¶ÙÕº\Zıœ/€f×P±C4—æQ¸ÜÇbÇCÀIj3şàJ‡TÓã#úÓ²^ÇæXËÎÌcBÓãjzXU\n?vÄI\0ƒño/NA+//h9Û®6»`,~u>\nW;ûq‰ñhp4Ş7/\\87Æ¶›;qê|˜:ß°c\ZÌËÎ•à—†G-Æ	\Zã7nÈX\\†;ÚÓ€½ö˜Ñ,¢OH—F5<›ÓŸ½.vNûSzx.vÑEG»½?34»éáu§áÍVèUl3m–)xzŞøExãıè²]1@0\'<Ôtƒq¸­9–k7ƒç#‹‡	…‡P—RG›ÕÈúq ÅçÊ~S=˜+Ğv5mFÓëvâqúQ€§*oŒôÙ\"˜7á\Z¢P›[±akƒ„óteıÑµëvÊ9¤ï¸5b‚™x¶TfD/ÓùB{Àæ¼ô¶ÁœMÁÛÇğè—á\r®îT3šÓÓöòº{¶Ğ™Ú<„kİ?…ëh¬÷èé.*—^ûáû4OÑy#Ä£«M®˜¿D™vÈáp 	wîœWÀ\nj±„¯&õ©Ñó5Ú“g¾ƒÑÅîP¤á³C¥\r,´#¸FÎÄ!Fb|a×Ğ´ê““z¶íåáB«@íT_¯Æ4ê9d&+›Ì¬>™ãcáÊâW“lö6şzß7py}…›`ÎDŠé6º:\' JPÕ¦ÚQÈyÖNí•7Ù3³!‰µ-ûÒğÇ—në4$·M¨:şè²ÇZ3Ÿ>jÎL_*|mËò€uÚWvgì¶î±›ç½ÈlhwÔïŠİé!AX+[x+Zó® ]Ú£%©°skÊ	Í0~Ûy4ã¢§I]ëÍ[«v×Ú“Ó¶H¶5ô´‡}ì/N®ÙÛ«gh¨86ä˜}G,ı%ĞSÎ,n6{‹ËÒÒÇWšQÔ“L@JŸ0nÀÏ¦À|êì\'úyÜ]{Ø¢{^2û¯‡ª½@g-T!gkpìÉú–ÙÒölh.pÄ\"ëÎôŒ¨M]55öÚ2&Ä\\AdºI):7­„c¯IÁV&œ?jû\rMg\\b¶]PÜ\nŞ3#<^Â )“M{ácÇ5á¼½¡®,·6ò$¯O[Jg®’ ‚Ì´™4`n¸5¶N“×í†1€ùCg9BzmûJŠÔ¨w€§n\'ùì¶¼ Ğ¤#A½ıØñxá<`=í·|gz”VØ\0u±¯l;ˆ©»kş 1¶×¹ŒÂ“~³áoÚ×	ÖP&ştC´&MLœ;ÜØé±%nĞ/ÉEäŸRÀ?¥€JT\n˜şÉRÀ´õO)à¿_\n@ AÃTƒdç–ôÄ®øi»5$|¦Õ\":g–İioCXÅškVoè“Má“¬O‚BÁ‚n÷;|GZ‹§yÓÛ{Â¾¾8xŞb¯0BÙ\\&~Gb›”¯u6Èª…·=†™\rFMzç6êÖ~-wûô\ZêÀj<\\Š—E³¯Ğ‹^Ûª0±».¿?ñGó©5x™\Z7§ÄÛl1¤˜½ÁXìƒ×®¶İPİU½ßkˆzFì5¼q6\0vµE/K\Zôn°õĞ·i	w³÷æÊeğ#²YsËÖìÆcX¤¥3]7<SjËôĞ9\\»zİ°ˆ=št¶ç¡Oñ‡=æ’cŒ±Óıly^tÙ.·\"¼ëH´ºP{xT\r—jyå¹`¡x‹ŒóÌO@^8Œz57œÚÔŸuí<›g$Úf‹åxÚG©M·ûù.ª²b3˜Æ_“ëéWÊpê¦üãGå0ê5a$+šH-i“¼Lÿ¹Işƒl’¯nrÙÍŒÍç€Æu¦€Ğ²1\rğŒi5ˆÆ³,8â4œ!ş\0½ÁåÑfÀxÃÍñÕùºìèşvÖœ}\nğïíÂ¹´Õ†ñ&Ù²[Á˜«b»yY¶›\'>S6Æ_Y´ÕSğü\Zl~—ÍG\ZaÍWÌhn ı×6/r¸è1C€õ¿²>Ù\\ğvŸÂ‹ænLëpL{¶h,÷S³Ğ—¼ŠL@‡l|#`³BwÛ…Nc®Ÿ#·Ò÷ã=}f÷‹ë´E¶†s’f¯ôy:ï‘ìnç:\\L©Q ¯Œí\r^0†#0XG‘~ÀÛ¶3ğèÏáá\r+Ü„¡Ñ…[“\0·j\'\ZàûüÊI­hNyÛõT\rßO`Õ6ug»f•`Sİx\\Âµ\\Óá‰F½[Æ[\0Äİ‘!X’!‰şF	Ğô×#zÓ‡m²¥i­Án¬€ÙœœL¶¬Ô\'Z\0‘3[Ì¨\r¨:—©²[ìíÌ®ÚôÈæ„Íœï—ÍúD×Si¹ğnoB‚5áÄN`í:àÕ^Ó=Ó_é\0¹=SKœéˆ„ XÎIY×YºŞ5$EÇ-V[Gj7-ØÜc³Y}‰®hy\\›©;%†Ìj¼¸:&?å`Ğ`mlÁ;r~Âİ!¾`4ÍotÇÌ¨|Â’zŞ2}œø My(¡ÔZÇ}mäÁ™®ÓN’\nÕ>­òb©øºÿÇ©hoùSNSÒFñÏÓÔ?ÌFñÿ÷§©ëµ6pÀœ/ÓÅ¨Íj_;M>gø_:Mş?¡S­:ıÑÑœ…FÁv1Ü/[Ó}÷¦ŠğşN:Uf4±ê!Ûî:ÕùÚgTpšj#mìDÌe°5QÜ³©@gKd°š5ê4¦3\Z\rÊçáX˜hwÒ†Çí¡AlÀÕWmØx`Fq‡šÉêüX‡IÆÍ$xâ×çÏ_uRåÔD@†Ò3,NW†¶ÕêÚ(Bõ8bÏO&±7d}1ƒ<ÄÊbd¶¥ÖE\\mGÒZ`ÒÑh1|¬4¬DôP¶ÏŞ¢İjàÁğw›®Øwª\nC†KSätŠ»v»ã‘#ÙP\07Ú_‰³ŠmbÃ÷Vc|˜™Òì|=|6ğé6Ñ’kuG1ÛÏş^tx?î|ñjğŸçncÿ<ïü	ç¯\\¾rŞaÿŞçİ´ÅîˆlÛÊy\'7mşÿÔyGöe0LWLŒ§ÉyÇê5ºwÔ\rt[+GX`-X ¼ú±Ëìİ•×Ÿnö7úõ)qi›ˆ°7ÇbM2t*ØOÔínKµéİ¬3\\éŞåz:Z-XÙZ>*u¡«qZ‰\\è½^ÏQ)›g2u™!ØR|Ÿ¥ä–İ#×MÑê\'”Iï*¹JW”¶ç\r^Ÿ0¦ÏŒí¡ræGŠºĞ‰4|³4ú3şêèóa_în÷G]I¨oZ] ÍĞ=ğ´ë˜ë#_G2µP4¡.÷NÉ.òššª¶0—Æí–©ÈĞgNRµËrJŒ`”«7ë{z¢É[››—î„^Ü\ZÒÙZµÌò—· „ş¹ƒüó ô§„n;ÁyxıSBx/¬şyúSBMr-GœÚ\'!£ŒZƒšÓ8W³…{¨-@òdØê±2e¦¨Cl	†’DÅíıt©à4í±ÁÁ¨¡ÚCâĞY)ÛÅ´Z›ş…ÒÉÃptgJéï\r×gÙõ¾M_\" €ÆxGôğ¥²·»}—åææ€ê\r·šËÓ»îfĞ´Ö~{Îi››ê›Öj£m»TıÔŞM/*¾Âä¦=uq»ÖSXèîG:*MÙ\ZM®Ùãe§£é’nÎ–t_kÆ’j²‚IÃÚ¦\r²§UW³—£Ñ‚§Áé©©SMeÁƒ¶ÆzmZ“MmjêİîŠÚOÕÄA n‚Y—nÙõOä0Ø¸ª¤ëŸúìä½ïf­/ÙÔÈyûvbŠ\\‘2ºé¢•+>É,Ì•¬+\"RÇ\r5\n8P /@	Ó\"Ÿ´”gZ ü2À¢UP®Vp ı·ÄË[q´2OL+]…®/„aI5MGQ|9èˆ$ŞÜLÊ#»¼æã9ïİ‚$…_nöî&OiØĞa6.›Ù[2¹ónC¡5qğá×qr›T·Ë†ã{‡eC ¢v\n½\"?DK8Fvònìc	–.…bğ‚|°¶t•´‡Ï#òU>Òú³?¼gÏ¢X™ş)ÆÄW2o8Õ·ø]ĞÑ`°ÏY€·¤Ù÷øÙLı^ªù3m¬HÈ²J)×—„E¶W <IÅp£ÔÄ¾ùZœ¸™{7Õæ)9?TÈ½ğl¥jŞ*&kõwâæ˜ı£,ğN	—JÁL^$ùBŠı<i®ÆkzF;Ù#nq£sN³/6ñ-^ˆ’—l#P¹ßI\ZX¸\\Å{è¾x«*ñË®€ßsóTÉÆ,¡OÖHp>Æ(gb©æ+Äñ­Jã\">ò™\'ùéÄ´ASÑ¢Ï¥Ğ9’6Ua”¯\'‰Z>ÀÜ³å÷h,±\ZdUÄŠ›¿Õã¸œ‰?€üVb˜õÔrHGş(:â½ÒŸãWÜéR;Ó‘/ñãLpK![®¦x‡SX(y~ñ¼Şm²æÁ¼WÖ\nö{ár—`†n½¥ó:Y·\0KÑàG>$jiÃŸáq¼üÆX†j5 9Â(<?Óùšek©01ğÇŞA(œ…à=ÆcÃ­\n:H%È¤eì>ïR\Z%Œ¤ åû™±]2#Ÿ ]AßÛSNÜ]/ìü@ˆÎynÛ„,Š_é÷¯V-¸\nC\rF^EÃõËTr=‘1©!5¾\nâ—ú’ª\\Ú…1{Q“e)œbÙîğ’(_†ñKıI×.íÏ5\0°Q)ßÜ¶[ÃâÃx‘•1«E«\'\0Ò|«×+‘ñŠ…Ştí!‰\0qJ§/U,{:*Ğ+ä7“r‚\nÇˆ’pœË$7ö.ŸÒµóÂ|êİ­*gGã÷Ì.ı*?©ó[qeÅlÌÿ¸ú¯îÍ71—ƒ=^Ö¥sÙ¦VHŠö%`ß99:Pzîº…@M…ÛVİ©&ÿ 2uEõ”²&[¢D-”ÊjôĞ”Õ-ŠnÓ¸gã@EÓuøó‘\Zî…\Zi*âõVŸE“Ì\"#tÉúÛûßf’bIo‹nêãÛJâß¦’rÔ9\'ıxv1xK8/¬Ú‘ô“jxŞFÒQúÛûıû;áhœşî»ı‡+9Z:F„¼J±RRÕù2Üö#1àC3EM±Gè[”¬ŒÂ$hÖs$éYŞ¬[™·Ò§qtÈûlzdÊJù‰øs;(%:¥œTÒfğÖ¬h7Ôy¼xz$ Ã™¥9hš[>p¯J¶øZé¹2R8€”Éc&î«‰?\"v”	j}VÁåcÿg1.(œJàsÿCÀŸioŠ:L!˜å‚üÊ7ÜSˆâé#Ÿ<,¬böŞóÍìÎ¢‰Ûú-¬Sğ1Ì£t.ÖJĞX° ¦Px‚øä¸ºŒj$¡(K±V¦İ\'QÖÃ˜q¸3Õ2ò¡Ân­%Nìg\0“|POã½#£¨IÒÙ•ãŸÊxW­š(.ÉG0˜óMI–uW<ë•¶é°Œè>”¥1lîÁkHØ jŠó“6\rJ“¦óÆñû¢séõdY~û×f³)4¥·ô—tô?Ítƒ±ı\0“8*`>ê$ˆf2GrÈ¯˜QBøO\'6£hÑ]ÿ’E—Lil|·sû$E³SÚ	˜†$…+©¾ÓÖX°´\\£Æ¾qAZØ¡å‡ázÍ¶6ÉÑ©½\Zv;®²Ù4ax·egış’YÌµ”©I—=ì×ToÃ9ó‚Ö7q lºËûÈÀÎğÎ¤}fûÀr¼»ıu]såµd×64Ôñ®\\«ÕYË\'ZšÇîùój´:Fw†´ÎÌ÷³#kPÔo¥Ûd¼ğÉîZœ{·•Vˆ³ô”xHÏ9AÓ¡®-¾C\nÙUÄN¨ù}¥rI—«ó>á|O˜CuTÄW9N)\'ÿxi¶”Éš/ìOÈÉmÁJĞ„bÇïí•‡åÎÅŸ.2ºÒm8—¾â•\ZÕbşB\n®Fr€*Oü^B¶=èöQNßÑ%¹rKo:R¡Åÿ`‹÷¤<å9®“\0«À=Àj…|óHVHFòœ|ÖÃ’Û·>¯J“»<Íòı ÀŸDéOÜ=nÿ`{©8Øùi3ÚÈMûWÏä$QèÉâ®ÿ‡ÇğÙ@½&ägF»™½ÎÑàİ˜å­ZŠ\'è”¡KÚ>›[ğ~Oö\Z3Ë¶ÿ^xrëuôè•2n¢Ì¥\'*PÅ~/ŠÌyüJ´JYü+Q†Ûó#ò}šÈ™iJ)(Ì€\"]J{ø0òOñEŠÜËW©•¡_sĞj%*éğ²O.93H½x!øëŸ™ÙJRfêeÖÎ&z—)±«Çóæşı–,áI•[‘;½âÇ·[÷r\rz%´OğËCM)\"sØäG;}ûÿ¤ıÂÆ‹İo™i•1è¨Ğºgé-èM[åƒûCe&‡z)Èeó{}–eZ(/Yµ˜bÃ˜çl¦„‹$Kµ˜l©¬Um\'\Z£\'UJZKu£03^j¾Ü¬#;_^Şğü„Ê­9÷#æ1•¶˜Ñ~†¢ïñÿßÀßÒæteìqSó3s\0x­Z´éŞíß~f™¾ŞùmÜå´˜˜2¤0Šj5Ë–G	É¼Êî !¥ú˜Æ©~£¬,‘Xò„m?‡>î JşáJKf^EOeıèª=qÊã&®½Â»ŸåpJ«i¦leé¯4ş€’¬YÁ0¬Ur­”F³Z—”@‰çÔ,hdEò,Jh\nT°†+6ü’K	íd\'ä,Y³	’z¢ºŠÔXe\Z³òTW7—S¸˜í¥!,’³.+§slBì”c¦CwÜ?_Dé‹îû]Ñ“9ó˜ì/OÖOæİ³)Ä{~$—-¢.Î_X,Yúë@•ñ\"Vz¤¿idJ©K%Ó Q	”\"“¹Sº¥/ÕB?Í¹r[7~÷‡¬Ù®æO¯gBÍ\0ÌïM%7\\Y¼fq=AÉˆ˜ûòËôt©àsúÊ	\0€›r;ìõ+íd•‚7ËÁ7¨Œ•TWÍ¶ÃÓÉí&È°NyC•§åÉJJV„Ïë÷tÚÈ?ævHDÿ°7·Cm‡6ÿé¸şÿm·Ã:®?s´€ÑuˆLw3İ)À¸ÅÆî€s±Å.†—á¼-5šÓÀ˜zÅ]ñ¯=l}\nï:®³ğğª¶‡‹%´ƒŒZ±£ù‘ìµ{î„ëtß‡syÍqıùŞßÇqİâxs:^·Î·û6­vª×\'ş°vv	’ÜoÛ2¾u»Ävmüáf‰61ÇÆ°×^Óö†˜oÙ&Ew%¼­èõOÜQ¡Ÿ ë×ëŠ¼(ÜÁUJ»ßâ­ûö\'uñõ”•&İÙ}¥L–M™:À>Û<^ƒVy*ÈÙ‘%6Œ)¬{â™\\íH¿˜óŒİå‚ïÖÑKî ‚O}óÂ×ÏÔîö²×_á¨ù™ìµT­7Îíçj¾âÔø0ãÊU†nÒdãµF€>ï\rXª…+´]–6±Ï—¿)ÎŠRÉÃ—éæŠ”òÊ( ”Ø\\âS•n¯üæ2­½»ià®3ÑU`©¶®D!÷rÃ™{ÈçPÓx¤Ğ{Aoñ¬ñÊto•®A¯@PÉLã‹”\ZÅd\'L8Şh”Ôèá9‰İ’¡~\rÒLí¹º¾æ©`D‰<ŸÖ•9÷LÊ/ôQĞ¯4€\"¯7\0ÿJXã³>;K?P•úšrı“Ø/¾Tõ{|¡júãº´rÂ4*Æ>±\rÎi»Ø][^œqçh|0yİŸ…âÌÈâ>¥¢ÊOèwxåÌ ‹àKÛÀb|PNoÎEÍV¨…°9ó¦û¯–*¯Eªjoe°oüÀÍb::|ºéäë%‚E©–7.ûD¹1¥ò­£<¿^Bîü¾òÌzï¦\"I8ˆ—L‰—zNİüå½K_€ñö-œûŸ1Áh(c…`×ÎèT86”¨h£¬‡YútË<—èCñXÌÔÉ%ä{RÓr8S‘Ê*K\rL‚ §•/<dùe•o‰¥ŸTVI2ËêŞ>©ëî/e5o6ÁOjòú±´·ôòª±MYå‡ueå“fé’WVù–uúIe;T¿•T9¤É—ÍÉGUYs*F’AìSRƒTJé‰!8õ´z†+€ù±—u¼Äı©8G.ïŸ6–ªj$cPÕÏ@€{ÚŠÈ9¥ô¯<šåŒ$òªÔ’Æ>©ñğ$©ìĞe7(\"ş|\rNNÁ›æñ©Ûéˆ_{j +j~ª\ZŒa4R6c¯,Ê°È=¿•,A2îsçÆ(›<Î•MÅ3¾€t’„Éø—+ª}†‡ñ(_ÆDÃT³™=;QX\0£PÎ»Lü}@«–?=½¾)8ßŞÎï	–•Nv¿„dzÙy‡óYlˆû5hE¼ƒè–&³•§Ã‰,±G©P<b½lÑ[ÕÑ*‹\'òGâì™L±\\îİÒsès?‹Çïj•@igñJíãó¼ü¶P£ñ»<öıñàKmec?«ì·‹·UfûU+âÖ›Xë™iæÅİÌÉª(ü†&şŠj¹^Il’Œ>ƒ“\Z2VBşbô›äŞ¾‹œ«È¿ò<n.üG	³([EÂx6À7MŞ¹’)f_İŞzĞ»÷øs¢Uµ´P+ü!‚%ïŞìOÒï3.8ùÓErGwË#½ÁK7Z¢X+˜½W]jº#xjº7²G²ÖhûÄÂíu©Ïj‘;¦ú\'Ú‹XTĞ–„wúéUó{U‘J³–ç¶(‘·Lòï§)¨RÍ[U±Àğ*õïå@„`ê{a’äJû§–‚I*”@òîÃ<\ZüÃ+ÅoÅğDâş²‰RFÌHì»Ÿ‡œK¯ˆ‘&q!z©¥ÇâÆ”ˆS¯ö¬Ò~âhRBâÏ‚ì¥\rİŠ^©ş|´! ¯jpşåyÿŞŸ“#tŞ‹Úmÿw·V*Å¦¨hÚì\n±E{¨ø*©-¶w)p’ôzh¨òŠ{ÎÁŒ0º§…cu4ÌĞö)×òwĞÇÑş—ŠwÉ+`ÉÎ·@Ø*à™ûš*İPÆ*ç-w%æ-p*¨Xô9-Œ¼$f=š(ğ½âşR!‡İÌu£İ0:Ed·®”eãÅTµ=p,2Š”Ò)çøŸCªÜíª­¶3“—;š‚\ZñáaÊNù¹d*~	ğ]üô®/­^DRS)CW.B§ÔÓEøÉ_7údÜ¾0dHùÕA¸æªè›„MüYP9?¿’Nƒ^¸ ı¬ñì…]:·˜y	J3ìR+‚¯‘*ì9ôL4™H>M¸ÃCT-ø>G·to¨\\…ió¼™ŒA&T4ƒı¼v1²iõÆùĞE‰ç£èZÒµ×®í~eÌnF!ã‡Ú£ğcrQ›÷—Tt‹ÖÒÑÎb°M»s¼)ì¹³ØcWï´Šê”0˜Áİt\0şz;²…8Âìè.èa&…O®ˆZ‰ÿ–c’I\\=ïŒ`¤-}ƒï£O4xÆ=tS\\Ş0R—~ÁW7e¸\Z‚×ËŠl#÷8i*÷4iPÏjø’f³O“Æ³îw—·G‚Cşy‚Dşq‚…“İônhä\'x8e\Z&Ïkçn˜^$¨\'¸ğ¹È»7dòÏlòtÊÂTD#û4A$û0Áâ.<ªFæaÒ~æYX9V¿‡‹…s$î]3í£÷¿B¯âÿøKøğ/ÿ•yds®Z’ç‹Á©ÛÓ©âq¹ äeî‘,A5÷¬¬/IûÜ£ø8›{(œ–oõèäŸ¸ç…V¥|±haÏDíFùñ¬½d¼Ã‰v.şÔ*»;¾q†+ä‚)EGÊ·ÿ¦¨d/hwÿ9Wş„¹’²Ö(=Ú?\"ğ§µI÷Û0Âæ\0w§£Ì`èo?>ëúµ\Z_ŸàÅˆ7Úÿ·pŞ‡¾G\0ê¾?@¦Ç¸ıZMë×êıZciºk×pï\nœsŠÀ…WpœmMp¦ eÔ`‰|\0Ü—Ü÷(:YÉÂ+yñX~%/‹ğÉËÛR¬(Rú\"Y–eˆV5/Ñ’·…Zò*Y®%o¢E[òü¶tKIX^%YÆÉ›êÅÇŒ{½¤\"SàĞ;ØÀß!¸~ÖÑ§S ?~mG+ìıfı­ñ¥Åı9°?	Îïij†“ÙÊ3JUöAcù¯Ÿ™{¯L0£°ÕÿİÌl‰gT,¼üÌ(òù3Š,4¹I-ç¸áöf8Üå£ÿ)ä‚CË½\'ÂsÃİZô$ñ‹’i†,_	EÊfŞ.ñËŸ·yîÆob ;†Z¡Øp{úÅ†h¼=6ğ ^ ôšJÜ½[ÉK–ƒ³Çãó=š:ä\"Hjpî‘œ»4Xx“3û¸Uw?¢OU0J^—ú~Ãı	´ê29É8İìGnóîñı2õèÛíc´¶KÏ^Ş´³Ñ%jb@q+ù±7­›p‹ğ¥ãz¼½\\?{ô¸kQ¥3—:7~¿Ò²ô^ï›k;á•pÄĞÜ²¸ÒxÕ¥øëÀu+èÏÏ´\\¸G{Ô	¿†êúC\nö=ãV\r}ÄFgÕÜ€\'è·Zğ#®aô1¯…„Ñ,¨0¶H8%¾ó’ÆÊ/œ\Z¹\\»/d’ÉX\0FÍô»Z&Å”².äÉÆ_P§4æEõF¹½qìJš\\SQùÿÉ‘~(à¢9¥n#KºDa^V º*Ÿ$<Jò5ü8d£“g\Z‹zÁ\0>>•1ˆJb¢å0¬‚XØä6GJõö&wÒ”t­[èLû|şµÛ¼	–©ğoÁƒ“úöñ†ş­¢­4Ô·o¹ØƒeY_‡’›rc*Ú}”¸[İ&Q|3uşÈ~Ä>©´`©F5S³İØĞ°:ì\"gÚÆÓà_!D>4dŠiµY*UY°{4µŒM \n¡x+	ª\nÅáÍŠ!UßÒä}½Ùr¬*Gª_Xà±tqf/;€·´Á’3;B^²cû‘ä!}¿ı†‚|†mAEç›*ãªt½ÔÕâ¯&İõjõŠ€„å_å±\"3¡Xó›œ‘gñOò*›’R2—İVìÅıAÊî\rnºš[.#0ß±´“Eá9Ÿ]êï…qÆ/.^¯MÄ¿JO¦åŸ4Dås6š¡wû¸šì¯5t;\nTôğgÕ¤E~ûò’~È%š_Ü\\>£İQPãÛı¿Ğ½çAZËçÍß¥»_Ã¯ôñ+=ŒØËsÊÃ\ná¿ŠÔK“A¿A.B’…UúîÖ\ZôõÆ+4Â7?KÂ\ne®iÃÔsåvÕe›Ğ¯#RmÚ©jÂß‡Ÿ•Çrªf;ğ-Xí9DJ¢âıi¼¼³tso%¾Ø_ÛÃ^YO¸{¸ ª÷¯Ä€!@ê÷e¨ÏFà—Ø•”(ÿ.ÏUp(H}Ù‰£®ôíï9Ò½È‡7{Òî‹ó?ñ›.¿ƒ¹	ãï©ºÀ”nEU±\r>CC:Ûœ)¦f[æm_îÃW#;Ùã¯\nf/À¾¡ñ+]ø#”,_bwS¬$w1µÖçNå°•ÇÜ(æóüo§Aµx\\}Ş|\n¾¨¹üøòNõjj²?«¥§Òa\nO6€ŒPõù¤y€•RŞŸÒ«<qÿn½|u¿Øİ²¦J\'ûKÇï/1€ğgÑ—5²#üR>ÀŸŸ«ÙrˆOàâ_Ò)=9¡}‘ïş,0àÛeY~bı+gjF¬í+¥Í[pdxU©ïX¿ÒZ\\ó+mUwíg|äÿgtö·ÿŸ{éÙúºoÅ\"?¿Ş/OÁoÀïú×Ôe*ğ;–û*ö2*ÁßF<láÉÀï0üü}£ñ×\'JıŸê×•ØÅäşù´ò³²·¼ÊñNaV^ ˜fz©`€¯\\d¤·ÿ¯Ó¸·ÎÏ_„Ş—ÛzX&¼¾òÂº!ƒ°iÁ²ùÓ•o†»¡MdƒójáœZ4•v#º,^>•^0¤îÖş@¤\\zÕŒ—Ç/uï&n?­V¡ÕO®xS7%Ñ5i(+6nšTàGîõE÷«²´CÉeÔ-?`©<Ó\0¾>;^Jğ„ıö<Å¯6›ç®UcP°xZ¥D½_pSÈ’¹<ºSÊñì“ƒşf§Ó\rÅ¾¾ù{û<äª¯dÕDFù…W“ <‚bÚ¿&7öI78/¼^Õ*¯²ğ»KIÊ»*¯RQš,oûŞhìg}£_ÜèÓñ€ËÔ/Ï2ş\n˜\'©\\S9è³q\0c]m\"ñ¦&ºµìÈ—¼¸% ş&•/=KQt©âª@´„c¤IJnØëòk­”†@…€‡£ã§6<pih…‡çJÊFgOŒ¿ÏY†ÙÈ™_BèoO·“?ÔñÇêˆ<\nyj“*Õ×ı¥EßbÏÄª×‘ü™\rPz®HÓ&öæ¿ÛÕ©”¥ÖNíåùX%éªÌûÆ-@¸A‘Pì¡¡™ªäh^{¥ŒIóëkyN¯ô¸ıBiã½\'V×Ãòv¢ƒ¥êFnë©Ú¨’í$ô-Igç/$¸ñ]{Ş‹Šıº0	KÍƒá/ÊÇ´V\r<“«±<t—/ÅßÍnÍ2YíyÊÆTË«µ\'Dz1ûÍRîNÇ?‹”LÁ­*˜#÷+í^ÿVW^öÎ-•M.&]-Dtşä\'ã–ÍBZÈşEˆá<r¬=çskëÌiÿÕùp‡×Vq™ğ\"Ü—Øòßë\n+ˆ?	ëlìÛú¤Iš¢é…iûíàtwIÇñÙK—8rŠ«Z\'=÷ƒ;qše\0(‹½òáoÃË™3¼?¶ìpß’´ï@e„ºçĞòç”?–ó†$Ò9od¼ŞT)ç\r·MrV€;z!K°9“`oEëœÛe´Q[”r·ÕÀ+KîHB‚×ÈÆ°Ë·ÇÃ3Ó§‹==ºTo ¹€Ùb›ÖØŞ®7\'ĞI®K(4Ã‘Ó`2cè)«ôØ¡°§I²Ïæ¶…qğÁğ‘Ã¯–ºà®î /¬÷2ÓšM¾%Jd¹ÖaÑ„Ï8Óê î¦Q·NãlˆÙ·‘Ş†Z‹+­]V¢©!p°…©Æ)íÚµŞ©¼ëë1œã‡ÉØ\Zw¦µ5°ò¡ı¢aºü‘wÙtŠœÏúº¶1»[•\Z6Ğşjpæ¦ã“9ßÌ4–ïŒåœ5‹­×ê­\r%”#ØÓ4œ~HüêÏ/€7¸Œ××Úø\nï}ßêæéxb‰×êã^éq[zÒkI5Ø w§í€àZŠ<\"ØZ–vV{AÑ¿ÑØ]5ªuñi“¥1Êê§ŒİÛÇ%{©-.Àw(ÀÂu@Î©ù¼u°{Ì°§Ó3ÜÏÔUçŒM¹\Z]÷Û§eC¯b´iÎj;jÎ†èR 4F· Å¥Çômfäô»ÀÄ_õñõÀ&­9õ\Z’æ\n.\\äÔ´c]>ùì†î:Ùî[œŠf!­3óıìÈ\ZõÛ[4×Ÿ¤$yºFËojãuéè>‚7š©…BÖ{p¥$Ëæ½X.Xh6¸UIr¿G’¼tôğ‚ÙWªÍ¢ï,ëâ?™Ì\"™4)/‚Iç°ËV	hY¦IË¶Ÿk6^êcØRÒè¯ø×N÷Pi\nºÄ9ñÇ’\0/´º¿dóTb†ÿµ”JÉ7Mr£´s¥ÓÆ˜q ï<¢ıx|:jû{äåRˆ¥u¥¯Ğs}ÊG¹(3æø?*0/Û*¹0¶w.4ó×KîÂ$Hy1èeYÎ¿?eôÓHaøó•ıó+F!H´à.—ŸˆÒ?µcK¢Æ•Y#35$‘Q¢ù©&dË1¾í\0šHÀ?Æ Ÿq²{°½ìû³›£ÉŸŞzq(E\"GĞŠë¯T-Æ£ù´Ny ºRs\"~ÜLü? Êí C×üœ¨HÂ’…àp~@‰~¼bé&}‹)V¨\Zò9Rãä;0P¹|	è­Déù “†ºb˜âh_	Í£Õú¸Äl¢åûw5+§MÅ?z‹}â&ú×”î-gj‘AW”*@o/¢ñ¥„§dâÍB…ä¬¶#}¤2ÈçvØŸ©½à5Öœâ–ik*ó}F¦Bæ†%	·uSß¶¨XDÉj‚×£ùÌá·ø®%W×%½pYıY­§„ºÕHQ\"E«¯ÈÊŸÅĞÂ%sş±T3”û,n³÷UÃäˆÄ‚\"ºá_ªØÜ/U[ä=¿â¤31ZÄèhõÇİ^Zi›àØ×·Ñm[5ê“+:<c¶qO;…ßÚÛşˆÒm‚Üõu¿œ¶p‘-É§ø’DR VÑÔòDTóN¢0æF F¼×ÀµE–Dèx­ŸgcÏ9 µ¶Aí4m‘¤Bt>Q³e¾6ivùĞ´O÷ÕŸË)w•ïœ}]Œ=œI†rçj…SO¹fÁšâcó’ó—mı‰_v\nÏà¹†‡£±<Ë’vµ¸¹œÜğs€^o9‘o·A…Âì\rVá–°$­W9	6Ë5w>2ÙÍn{!Ÿ~!h³‘‘õn0¾$<İÒ@TD«,¬)œ˜Ç6×©8õÙ4’`!*A£ìN¶h‹˜¥Gêî sñM\0Şo¿À7ø-RL~$‘pòğâ@–ïÜWOåßÉÍºÌXG¹±¢\Z©tæyîà†—EE£ŠÛeEqñ÷<`\'“P&›­+wjÉ¤ğJ¡–¤í*\0‰³vå€dRy=€ÜÒwïİ¢ì]9 ™”^ qB­ˆ8ŸVD&ÉÖÄ-±VHœW+$“lë$I\'V€gËÁÈ¤{À¸%é*\0‰stå€dw¥	T/ÆÊ…³€‹(Ä	·\n•ã‚\\ıÌµÁD4ËFò£\Z=,Î¯xê—Ì/,üÉÏ¯èaH²<ÊæWĞhq~…Ë7¡»†â¶d«šÊ¦¸jJ¼,ş\"Ä*’f=jI›°æİ 7œ++“\Z#\nÎûDn[øbíÏw–ô‘<¬òjégÑº#_¤°‰•ºÜ‹¸ºö4’ø¼Î}{ş¤\'Çäé=`.úôÍÉ\'\"Ã¤†”gC’,?7FÏ¡0cO\ZLy€”·øz¹Ìóóm{p”C¹òÉşët¸²«\0äx/t6Ş“^\\Ø½\Zó’(y–€‹‚\0ßhÌs\r\0l<oö9ù~¡h9±%‡ağ5b•,å$çùfS*ô=ŞÁ_]ØëoùõòÓº)òÂİrƒ\Z2Z$y¦Ùçtü…¢å$oòM¤!½Fò¯’¥”ä™œ€Ø|VùT	9\'İÒÜäÅ;Yä%8e& Â³&ŸSğ‹Ë	İà1^#ôWˆQJäLŠÃoß_^¥M‘˜€!~…ÄŸîKåş8}_§ÃW¨ËÛ¯\0.HæùŒp÷AhJw;‘‚„^ÒìsòıBÑrbã\r‘×ˆıU²”’ü–ò.;:¼:Œ	h+J²˜?{@\"`÷¨‡PC„‘§>\'â—K–S8y‘G\"åÓ,t;>Å½ºpŞÅ:	—ó5	AéNíF°âªÊ4ûœˆ¿P´bS„\Z\0WqÂù£d©˜Ş/ …¾‡	ª_\'²ÎŠ}\\aS”\"*İEëL’ëÒ&ŸSğ‹+¾@ø×ıb”{(\'	bÙr~i7È©äÑC.è„`	‘ğ‘Q´8¨©ö>å	_)XNa\r^æ/S¢|\ZCáO¡ÇQhéÅÓÑ½ğ?È\rIêIÀ;:úÃúdä/‘ÖsÆìİ¯g/‘¨=áïVÓ&mı’K¤¬íBœâõGYSs*£á½Å3¿™?%ıó‰ôË¥ÿøÜûµ9’…%æÏ\'f.\'û]ßQ¢ZƒÃŸüZGÃŸ»®¢ş|ÖF!l.ú_T0Tâ›bøğ\'A$åŸNI™üÈİUeør¶ìt`©Ÿ9¯®B‚Ë~tpwÒÉ¼Š|HÿÛœq^D5îê)‰œşyØÏÛ‰lİÓî2)/šr/ÓJwš/š×Ú¿›Éä†#ëñ0Oy\n04‰:uwl«\n³ûL´ŠÊ­”7_ŒÃ›6‘‘l†\ZŒšz?áF–…ÌGY¥õçqÚJ±yë§\0Š:¯A9¸=¾8ªÅùcŠá\\sYÛª#N:zEŠ¬gVtU“‹gşš·ü—¨bé8í¤zû\ZÀƒÃ%†¤·¤çÃë/0ÒŞşï7]+´’²´Ê®€çù³_k-øçßóÒ…‚Ï¦o‰ßbæe]#;+À¦½½Ší¥gƒ3M†úÄuşÅ\'fáşıø[¥<±ÇxÖŞ+ÛB*ÒÂ=^xiBÖÏæQÊ~¬höÀÉçœ\nr?èbøıBçQDæ´â~Ÿ®—¹¯Ï¶÷¥‘/ˆ?•—ğY”QùñyWşJ•Ä(C	Å‡CêŸE¥²†àÅ?ŞÛ2Ğ¨‹@•µØú÷1Ëp¼{¾ô¬\0”7S¹En™²àş3Z„2\'$\"¬Ìš~ùş7&øBø’kÒß~¸uëäÖSrEmò0€5„º©üBrLNwë!¨è.‘ş\n¹á×o’åı?§ÿ@¾5¾¿ı›øWM’µóÿïÖÒ[èEÀyÿö7Éà¥`G?,;™ùo¿½—b\0H şKø–,CÿO¡ñèqUƒ2Ş\0%ˆûõËÛ«jA9“Pì—šó¼’Ö<ç(e(ú€İ“rü¯©÷NœŒóÑVPîo¿•E ˆw—DÄHY-$Óü–†(=ëS“ş÷o2÷¡+iƒopòŸddv~à†r¾´`hÏ\0Î) dDáôC8yˆ¤\"ÉC4ıMÊşÍWì„£ˆ@Í\0ƒ’STPVÑ9×½õ6±÷ış—ÿ-\0ğ—¨€qt5¡´\0ˆ3û•–€â’y’t+´º+-Ç¥‚#½ã•@’†¼ğpSò}¼¯h¢—8ºR9,~/kºQúß{jpÈwéÿ¥íÏšEÖtQøşüŠeŸÙ¶İmT-æ©ÛÙABˆYÜ1ƒ˜g¡²ıßŠEFd¢¬Õİç«ª¬Œ€×ŞÙw_¥¡Ÿ4«oİ5,ªx•Ä{\'yK­øïmX,Öèƒâ·\"Èâ×Ë×g5ø:iÖù°N~#+Òrş`’ºš²h‘U¢\'£,¬çæ«Œ‡Ÿ3üŞ¯*^%ÿà˜¾]lïúŒÃ<“,Âºúÿœñl	ğŒÿpF_|°M[¹Áêû¶yœÒ”¿¢ù`·m«éãLÕ?«·\"«äî*ùP¯pTZzÕm•àƒ£^÷ge«„Á³§Ôî‡wòe¢Ş·?¯–ŸL-–eU6şxßú‘¯Vƒ|pÈc2Vß°D”»«,ƒ`ŸJ&x‹ VÙùàŠ±Ê‡\"|ÅÏñêÕT!ä7²õ)B>X¤iı*XåTäƒA×ñ%ÉS¹¼è»÷ùz½×\\àUÕúØ?Ş/Şã:ÍÇ4¿íZ%ˆ>ÄÉ]¬´»F~è’·ÖŞÃÏfä«’„~°HÚ/FnÕb¡O½ñ°„æyûBönH×¨>xåÍ¢¾{ókTÄWªw»»JG~¥k_6úJvº>æUBú‡L­¾ÿ`™ÅÃ\rËo¢\\\rı—Gß}ê“—¬ô¶³ïwsıÁR‹(öÕ×¯¿­”}}P§~?´/Ôúäº°ôÓUË‚=½·şóÁ»ë£}°–<†t•âƒ¹úì}°V¤ßFó½evÍà¾êöto’Éo)ñ/Âï)Ÿl÷0«B‘O§)¬ÿ|ÄµK¸½*VØËEn×ÿğSQı†ÆıapVßpXíİªªÃüg³«U}ŠO%Ò¾lCø¥C¿¡Ã¡/#ô;ºæ	ßv”¬ ŸÓ6¶Õk]£ßé^j{âĞ=/¹\\#û`—7ïíwtÄ“·§ñwtäWöû\rİÓ¦\ra÷~çkRú©Q¢êwdlã·U·ˆIÚ®²4îıÚuñÀı_{ò‚òiûÜU‡_İ±WK@_©^N+%[÷ä+Í+×ƒ@ŸZoÑ=ßY÷OU³Zğƒ³ŞÑ^¥xê ª¨‡nu\"â®¾\'¿0æ*ÁÓÌ-²×¦İªÇAĞÏ¦ú¹û~Túo8ˆøà 8}1E¼“‡îªÏGøÏxáÅÀ}ğI8¯¿?_ÿÙ-÷ªGA~°É#ñùvIÎ	ûÚÉ¾Mİ2^ï&	ê×rà©‹Ü<,ƒõxšüàvaj5&±O&(^xäSù¸q®SŸBø¦îÖ$¿S½by’zÆı¾ø ı4´U]¿]Ìş\"á@ºO#ò¸Ø|•ÂûJñ–#\\%ó¿šá?ÇUšàÍ:g„Ÿ1À2K«ÿüæ4}>^+K}pU?¥ıã¦Šw·a•~\ZF?|øú¿#ıd£‡‡÷ôvU}R¬”…«æÂ~Äıİ×-ÿªb ğoŒ·Nó4gÉPxİËà˜\"\"{ÅYõ%½”¸ùª~ è/I¬uSB¹?Ò /{•æ©†Ò2[\\ÉòwSàiÿŸ£}V©zé#½úVó*aø¥uéê@ĞONj«:YO\Z~jÙ¥UŞo\ZOğÏP¿Ê‹ĞèS!‹Ô¯(ıtƒñü*Á31øO™&¾·/¨È/Ÿú]¿¨oÂ¶JBÿ$eÑWÆ>]-é~İUŠöÊWyúéù´Hå¡×GÿéF‡á7Ç¡]7øôó$A°>~îëxC\'U»Ê^î3¾óÕP.zºÇLzôXX÷™N^¬×\"Õ/½-ûF÷ÊwsñodëºÄ%¾½Ò$î3Èÿš¼{ùaj…øuoÖÒˆ/\Z»–B|ÙäŠóÊ[î†šÚ%Ò]5^nğL?uÙ*÷¸Ï€,Í_ÈŒ÷dŸ6\r£Çé^«D_İçîU\"Ñ{¦šç,~eíÇÚÀjó|èé¸Ÿzñ§’^-ğÑ?¯†Uéò?Ú-àz\rOV¾%:?íºêE+?]²zşZæ‘àîÖ…ÒÇŸÁöãÌ´<]åÿƒµ;÷û’C”/NÔü¢âgná¥ô?˜»tÇ ä›Š	ß‘\Zßı›õ>Irı9¬*\rßıBR­“xOûŞ¦Yøq@É*¡ÿÔ®KûŞ»_#úävoİE÷ÃOÇx=K|šÙa]‡O\'ÿ\r!®\'¬ä\'¢ßÌFğÁnqU-qÅ{Zá7ÔØ/Ô«dÏ\0`±˜«ÎBğôÿ—ïô/P@~¥Z×hõ•æ•B\rè¯T/5iğÌ5<Òöåz×>Íì\"ıwùx²Zæ™¸ZŞíì?†İ:?_J~×YoÜÅ!çÇâë\ZM}w7Wi>¸ícéçËèşñ!«: |.Ø„ñçšß[xQ$«r~pá\' æk©Å¿},å½°á÷xt]+…?Å/¨ˆº9ùÚ¯Z7(áSÙ=ÀBî*†ü¹8êíâÜ¬fÄCú©Œ»ş›¢}(æ¯Ãñ½Ô§z[¸yq®¼ò>s%ÉÛ®ò5š§gø°Z¿]²ƒ¯”¯]øğƒ–õÏb•$ú‘cí“ªó_ğiô\\AÒş•ùîã\'ô´VÑâ×®Öñä£¡ÏÃvUkE_ßï\\Z%{†Cš¿¡‡×©>xgézıX¶zAõô‹e†İÒ_oúÿa¥«Œ\Z=³\Z^Yfäº%‰¼ç8®ËZôÁ\'ÉoLDô\\Şù½%‰ÙÓG:ka¹Á{íÃO<Ê7âWZ~‚S¾Q¯Zø‰RùFúÂÁO°Ê;ñË¶b_©^7ÿJö¢uÄ÷Ö½hÖ#}\0ÂWI>¸(wëWOËÃuYo°û´éŞƒı¿Şüx¾Zò	nyk‡Ÿø–f¨úßŒmğ•êõØ>ó‹T®r2ü¯¼Ì\ZÃOäÊ[½\rëü›kıõÁ÷bÏã=\r²‰ÀOË3‡¸Jƒ}§©Ãõ\\üÄ³tÅ+@üD£DíãÒ°u’O%²«Ÿğ“Ø-ÂzUëÃOĞÉç	øë=óé¹»®á\'ääâÇÖ¹5Ê©^”Z‘®#Œ`ä9×ë\nùe¦—iË™í/¿Gvì#GøgXÔı7nùñ*\Z¾×üãÍê@<¡-›qßï¹{¸«”OóÕ®8‚ÿ„Ç²ĞZt?Ñ-Cù%¾ıã3\0^bğÇfÆÕ’äS2ß×ıVi>˜ğ±à·úş×UU²g.uxœõõvcâ*Ù3´¼ß}°bØºëğ@ø	€©‡ûı¡öÒpÕÃOL‘>fàEV~â\\~P½\\‚Ÿ˜—.IÃUÔŒş´ ³ÎCOäËcùê‘^<’!í’õî>ñ/mµÈÜê¡Ÿ‹;7?X ô§Åß\'»`”\\%©İŸ8˜Ÿè×Mèóñ+[ú„Æ$}‘ã«O[ÖuèêûçªO¹Ä,ë#|ÊØ\\øÂ@<Ñ-¤i·¾°?ñ-Ïû>W×à\'¾å“jm%\n~b\\Úî7NüDº|Á®’=ATé+&Â¾Á~óAâWºu.bZòp	1_0ÃÎòNóŠ°,ãÿfşÄ³|…ù¬~F`_Öa~GÿL|­Ò=c±ª¨×Üğïò~±ä/¹‡÷tÈsX_È\róQË÷<ÄOu¬ü\'óQÃ/ÒŸ*y)ûO8M8´ßVA—ßWÉŸÉ-o½U|\Z<®5ÿ–uºU…ûDÕ´‹éùæü¦åú÷Ÿš°üî<Ş×_çğÛ¤\\ëUÇò‰Ài‡ÉÅ÷Úª_¬®ÁOlÎô=éšµ«Åã-awõ=ùíõkY\'ÿ2×ÕÂ£ó>¯}Í•¹y¸/’\\0üBù\"?¡:ï¤Åã†àWµ>ñ:_I_Uûí¼Ñ–C¶©ÿ²^d…öeÅO°êûúôºL=ñ:D¯„÷	Ú™«¡¼ßé“\'tçƒr•äƒ	o?0*ßßS?ŞÿîKô÷6½€ÂOäÎãºãu;L|fğİTÿ¹%yÒºŸmÜºkè˜øŒ<Ûµ*ÓO8»îü<<‹ØxÃ+ó÷„ê|ıf¬¨~™å|µEOÌÎ;ÅïªÂÑÄ2;¿E‘ÁOÏÒu.|\"y¾¾rôp/¤/ıÒó¸d{½/,4¥e°s…ŸP·\\ø\']UèäÌÅ°Ê^OOĞ¦·¾ª?Q<]6¯¦0á\'„\'ª†öõì|‚uyâUç¤îzSØœ—ïŸ1íûô›[¹ëu1|BuºáEî€ú\\ïy×€©OP²Ÿ¤ãzÛÈ§Ë»ªZPœq5r}bp¦0õÖğÁmX¶ë!ìS»qøXá[å©\'òæ]İü&§S_±]?vë¼äø\'ç\'úWÂD÷É~^šùÉ¡zYüô€úß¦ç˜)	Ãü‘XUDOÜÎ˜aõ=ôïôC›-‘è\"}Ÿ;Ş|VÓïğÒó%³ü¢µÏuëÇAü‹=ôıº8<¡=]¾¡‚Ÿ˜Ï]Œ¿éÔ“«6x……Ÿ0G2o]#=a<+•öÃ—$ÈÇrø÷¼ÌP.ÒÔvi¿>bşS.ÛGé—•µEèƒá>»º|?Á@³›TëcıÁ¶ï+ÂkOüOÁêêüDÿ¼SüfŒİÏTÛÃÔ…Cı;Ü/üD}¡^%{F‹Ôûiµº¢\r?¡@A\Z¯j§\'\n¨NÃ`ù_½]y‚€~P½ŠÿŸ `	5Ö³šOÔÏµªŠÕeEø	öÉ5¸ëZê‰ñ‰ÜUó÷Dø<—²Viah’®§©ŸÚ]õË\0Ÿ®®Ö\'è	îñ_8¥OXÏãıêäyŒà…É‹%4ØÃ¾‘ü†½ÏÇáºé_~WÑ3 ıù{O/hè«oë+O¿Zèëğ-Êìİ[ºJşÜ@Ø®®‹Â÷9=/6œÁŞÓI\nÇÔ-ûu02ì}ÆkC¼ÂGÁŞ³<ÎNôÖ—{á\'*ë-¬ƒ¹ó\'ëêíFÊu2äÙbĞÃõ•XØG¿~ô±çùí˜¦ÄØWâÇF·ï¨í÷ç?moûñæı®õš¿®AßÓz¥ô‡õ¢<ñ¥üÛT¬Õğ¸ïïEyòKù¢\ZÓµö¿o\\/O})ÿ¶±NF?]‰õDºÿ‰Ô	Âu\0>üÄv]»èíòòU\ZÿéÿGáb‡oiš÷‡CõëÃ î[¾¨êúøçaûBg>‘bŸn^Yõ«Jø	ûî!µ¡·\n¤Ÿ\0²ï)Ã¢^ß»?ñdñoínğcQsõõ‡hÌT¤—–ïË}­í=Ïå¯<L÷Ò¶–áz÷œ-h_û÷OÈYÓ¬¾%áÁâ¼~›¦¥ÂÛ*ø	~¢Ïº°üæ4½A&_î²Ÿ€´G±ï¢ñ¥à:Ó?QjIÚ-#¸ªj?jïŒó8r•ìƒ÷ßÊ\\¥xnÿwÛG2¤^e¾OøYş81r}‚©µ·dõoæ‰5û$ú\r¯=1g^U¬f1ÃÏDšï?NCr¿@~Ş5ĞĞ{Õ%şÄ™õëşòK¶ğpå?“Yírø#Yî\'ŒìmÔ^m·ƒŸØ±ÇvuÑBÇæ0_õÍŸ°±‡ì¼óÖzŸİg¦$Zu\0\01ßÍ}î×—­ÂO~™_8¤OhØ6tZ&f=ûõÄ†ùş¢Ş»U×õ‰\r[HŠ·€/6+ÀOtØB¤_ëÜşˆ-dn®ººŸ[üßôñ$æ¿A†×Ó=O˜Ø\Zíåòî\'Jì“j}ú8±·OV	ë¡U=¿Ì.<!b«uÀOxX8‡Të‹è%úL<ü¯^´ç3¤mŸ…B7[§ÏIè¾ÜÃ?bKÌô’~€YGõ<lda©hÍwGx°wŠ×Z\nybÁ>Ò/ë§… O,Ø“jMW#O$˜—¾ŠèQ¸¦\',­nIµ\n	G°G¶*q0òùk‹È\0Ö%a~±$aóıIš¯7ôƒƒŠĞ-kwõl\rú9çî˜\rÖkú\\û,ËĞïƒğ-?³JùPtÉ‹?i‡Â[ƒ\',´}u\ryb¿íîÖòÄ}uÉ\"]ZzC¾–wBØ¯.-ê|~Dß«ö‰üÊf·_xv•æÔ¾ØG`òÑoWÏƒR·¨V÷‰#ğçfÛÕ}%ÈIöîB¿]µÈMV,áSûR6àÏŒìÀ¾Ÿs¸J|zDmï­X„<Ñdc¸¾9ù[u\r\'¬X,Ö°êÁ!OH×ÛŞŒîÓ}$>İ²‹ÃrİgC¯/d/<.äó4£GO>€­«tÄıŒüZİËŞS_*[æ£ZÕûÈçõ…l”‚<‘^_	WuÆëU†Ãú.ä	ôzµ|==‹<Á^Ÿû3½úéª/€<±\\?vÙ¬2ûÆ5-GçÖë4ŸŠ£]w`\'ˆëMd^Iñ¼õFôê8ä	àJªş»ÒöV!–ÈÎ5¦î Àw’>Ê‚gP4xÓê\Z‚şÀ°§Ãªm~b³fÿk£¿Æœ«¥>X£ªû´|lHê^pÈ¹õHÍ¿8\0yb·Â[ıØB]·Î\ZŸ{ö;ç?±oÃüñğô[á\'¬ëI‡®î“EÛıùpOúõÀyâ¾%µj^liGp°\'¼Vøãë«åÑïå¡µò_a²ßKcOÅ¿pòŸ§¡¯~°rúçÇÉék4ìûq#ê×½ŸßéÈotCùšòóP€ÔÏæGêfUÍ=qd_ÈV=|ä	$[‚Š«¿êX<doQN¹LøŸ~¾î‚<±c~¾@E ±%n~OtûëKÅÈ:–TCûvPèzãŸØ°dßxåÇãîE^ybÃ~\"ë5¼bÖ\'(ì%º^A¸î®<QbŸ„«D_·ŒÇ­ë}O:¼=n_‰<codó«VJ¿áüëóçNà¤äÒ<½¿Bá#O4Ø{õë¦Ó_è>dñ¥û•2|¬½®Ó=Ïjjİ |q¨ òÄµaœ>TöºmzbÀòí·\r~ÕêÎMä	[]ÀC¸¯8~½¢ˆ<_Ğß\rÆô…Êyb½ª ¬²C•i¶–zA8¯o„¿‰:Ÿ¯xqtëWmä‰øš–Êvjùi•ìswwä¶ëÍûDf·ëG©\"Äg6¿]^®åU\'Ök±««ç\"O×g•KÏëš/DëCûäñ«ü,L¸ÌÆú†ä	üz<sW9ò‰úÂ!¨^ïÄœQ¸÷õ<q_ŸXü7”Âê×è¯OÒwtó:íÏÿ÷ÎÖiÑŸhßÌë´ØsĞƒ¡[Ç[ ?qªNî*	ñƒäqzÌªà=q_¢õÆ|Æ\r«öö	õúØ¼»¾¤‚îÏT/>öLWÃı¾Jğye®×ğ4¡ÔÈ2!«’ñóµ´Å¡’¨oĞˆÇÉ«KYÈø««øÈç‘L?Nvy>`~¤a½ŞvêÓÿ\nV¥á	÷ŠŞ0²ï§¢¯Ò}½½ê«<_u[Ãâr%C¹Şä\'{¤·WËÆÈÿõØêã­S<áúã%£ãÀÀ~Ğ­sÒ,ØbÏSağÙ‹ú>—R>Î(óVÏôEhèºî…)xâ»·KÖOFĞ®ÇÍÌıã^±U\"ô\'¢?WgôóT¦°}¬Ö­’|ğNœö¹»^És­®öÛÿb\'ò„nMõòªX•®/à­tİô<1[(ªÇ	ı¾ÿ\"7ğ„nı€À½±\'„ë§30×\'ı	Ñòòtİ;}\"°Ş×äˆñÇf¶¦î‰Æú8wúñª­ò—§d!Ÿg3-{¾Î¾OpÖâ,ØÃÇz¤Ãò\rá=/?­şªåvù»e¯Û°ÿédC÷\rï–ï=aJkäß«~ºQùc¶><é‡¿½¥ù~úZ°~¼#òÄÅåºUüÁŸëMzúRKG~úì·¾­–ı„EO¾vb€°1]œæUNré¯¿ñ\"Ÿ¸°®të/Ëáßi¼ï4Æ¯V±OÊß|øÁÊİ=”ùü×¯Wş}Ü[QßşóyGÔòãóf-è??®Şûóñôç«ÇŞN0j—¸ıß ?Şş}^RúĞçsåo7Òı‡ë?ù•7o?ıhÛ´.Öû£eÖ³io?^øÙœÇü-Õ¼·çAóıf‘¿V/?ü~·Ö/—“¬İ`òíz±árÈÿ\\lùıÏª»ıL³D²ó[\nàÑĞç9/4ô×Çy\\‹iÓà?X[x ’ôGŞù¡nÿy|ì_íª¨ÿçÆíRÿíí¿½•^Fíÿ†ÿı³Iı³È¼×ıo4„ñ¿¿·çõËîõ»êå«Ï¿ö¦ş‡]C~Óµ¥òßôíÇÛ•Î}¾\\éİóİ«_û·„!ÿ³ş¡¿éßRùoú÷ãíJÿ>_®ôïùîÕ‹·şE‹@-.{›ŞA\\ş?ë$ôG‘¶mÕ®3ê›8üÛŸğğ/]ışª{õ¦zñbõéî=¯	úrè¿Ğ9ø?_uîùê×Î}¼ùµsï/VŸ¾uîqÇ_Ï¦¸eú±µÿñøH÷´ŒÒ2íÃ<”šÛ¾7ë_ «ş¢¿¥ø?ÿÏÛç²pÚÅéşñÖXèıµÎäï	C/	Pœ~#YêıèğJÕ¯ìkí¯h¾| Z«{EÀ¾V»òúKË¬¯ÄŠ@ˆ•÷?*ıµÂßUöº¢Ÿn.ıgà¶Ù_ßLç/$håqóû_ß.ëü…ìíîÕ¿~¹	õÁãj÷µû\nPTíXñ$\n	2D_ˆæÇ¾®W®Â>ıú­¥½aù¤Q\ZÇĞÕ~=I–(òè_Hºì³×ï÷ÌşB±„i\\}MˆûñÑ2cŸƒ¸í…¿<R?:D0ùÉ˜VyØ?‰¨ÃÜà¢÷cÌñexûA»¥©\rµNû˜Ùí+CøìüÛ]¦8şÇûĞ?Ñÿåş\\÷·•¿_şøÇßzĞ\\ùOş]É\'“şTúíR×{ÕíÏwwöãÉµË!½\0>Š>o”tƒtèşı¼‡v©ñŸï®î£îÇUí‹ó\nıú¾Tüøó6pÈ2f?‹?ıO\Zú÷/­yâ_?É‘Ë¿ô¯_ı~ı÷Iù\'òµâ7Öşµâİv·ã°¿«øûE˜Ïê>nÁüX×{œÔ÷Ç÷üJğõ²Ï7T/MÙÿmÅo\';ümíoT¯\'úUÍ—xş+Õ?ïû\\eŠõo½#…P®<ÿëoFõËw_ûi–áç,´ôÁßÛ¤ã—L»p‘†´¬›>¶‚üñºğ[k~[øÅt~Æ–[àÿñ¸8ÁÖnœÿzğ3X#1’$Ù/Òô­/”f½xsó_Ç±ÒûãZùg¸û·UŸ€÷¿¾?ûraıÇ¶Sâ›øWê}DÊkkûåöØg4ş¼Œzê¹üíˆ¼ìá+ÆxÑ²–û…ÃÃ(B#ÿËÕ¶ï}_™‚Ç»ÇÆØ¯¯­#>.òş?^ÌÿjßV\ZøÇjùïÅÖ»ÿã÷GÏr·^Âøÿëkcğ­ÍÈÒ‰¯õßâ£¯w›>DbÍzUÑº&úµ¥ÔÇ°şÏÇã3ı®Â•Aû¼ùGµıÂÒÿ“ÚÖ§êÛ%ÒŸªøK>3Om˜¿­hräcfß¦÷MS=~x¡P;Po<=´z©ú©.êGUÿráßñ/ôàŒ÷.¾‰Ş·ÿ~ZŒßTåC—üµ\"N?h~Ç\rŸWqTñmôÿgBÿúĞO^ô™	ıûÄ;àÏP_ÔäÇ`¾±$õ·Sö»‰ÁŞFæÉßŸ½ŸGú»¶üã\r©yø‰ìİøÛ•èo$ü7êğ9îo&}ÍÁxõã¾õ/jõ›/şáİÿÂïÁà¯>ÿ·¸ğïÊïÁ[§×ÂËÿZ5ß¾w†z\Zà€ƒ úûZß]ı_úö- ı›â¯»öß¯åw=sC7úÆë‘/øµcßR¿/ıº_ÿíJ~Ó­‚ÏÁ—:Ş×VşüXÁùf»Ş=òïÊUg¿şúS»½Ğ¯6ô\'ó7´knÀïğ_èÑ¿¢ã^{X—Ëÿo-Œ«ğ†ğ¿ÿøüñVèıC}¿Òşëcm.¼*_Hn_-ña>†´ñ?Náşï?>ÿƒiS7ÿ£[´ÑWşêlüãg.zvı}¹úuííåˆşÌ‰/¡Ï5¾ÿGòS©ş¥¾ØßÑ·ÿ·¾ÿ×/qÚ‡á[I¿¼‹ÈÇg¨­·5»oÎ0ôæç|-û~îĞæÿöˆ[ÿãíW°.ãÿ|…@`¤æFV\'HÜÇ³üsÒŒdgÄwÿm¶ÌåñwÄùÚáñkä»³y\nKÆÂAI¢‰ªX–{aGæç·\"ÕÀwmvˆãøÿş¿ÿıkc>.ö~ÿëÏùë«O7•şâ¨ıã÷}¥^™õïÖ¾‚`/|‹ßZmê{%ß‹îµjÿÇEÃü\\ãüûÉ¶oîÁmàÂŸÖsµúÅë/Ù·Ÿ²?}ó­!¿ú%Ä#¨û%2ø×+û¹Óiùìô÷ÏßÂ·#•Ú¿–*>—Ÿ‰ÿJ¿şÙ\'o‡qäÁû›QùÈ…¼«ú€ş²å— ÷­å$ñãÁ‡1zätş®YÓO÷×K#ö1‹/\nÈß1å—şã÷œÿuJ>¸ø½gè‰g?Mõª	ûÎ•/ûû*güù•>íóğ¯¯„·¼ÙW ×v5w¶6?wëıƒ_égÌ¾jŞ?Ü¿~Öøßqÿ\Zo¼ÍÁŸßfúıofå½ªÇd ÿ‚¬üf~Tô–æùhÜÃü¼sä;Ï/ófBşúU«—ÕÇO+ü½’´üQşİÒBĞÿúÏ\'˜å\rÅò?Ÿ÷&¾w‡~ÈıÛÏoQ÷gg‰e&^à×/=æâù%„Xéããá?Şp>ïßÆàÿ’,¾3íŠÓüENä{6ò¿©ü¯¶äÓÓı¹?%Úçk¶ãú‘ÏÆ‰x,Eé§Gµş¹ïr¸ZO°ÕŸ·wÖçïó\ZlµšÅóì“÷”øwK¼Ğ ïŠ°>¼ÛùµÓöLÈüX<ı^éãê„¿†âíd¢ÿü–¤_qSŞÊşóÛ%u¿f\nÿ…BOPŞ¯\"ÿ	Óûÿ½s;ô&xø\"åï‚¾°âƒıŞmÆO‹®öKìÂŸØï\0D?Ş®à	>_®\0ï^½ø¯Ğ_ö‘çù4¯Ÿ–è¡6¾Añ¾‡ßÖ`¿ã·Õ1şƒ\"ÿ€è±<öİ.ÿ²0ñıíÏŠâç.~kîOó;ÚüóyZ.nJüõø¸¥*õ_yû_}×/\Zı­ëºê6ıâÖ•úÓ=é^Qşê¼R?Fö#èıÅ~~jªW~ Šı0$o?¿/=ÅèçÕÄµ|¢0<£ü_Q¿ø¾@óºÑ_\rÜ»÷[ÿ\\s\'v4ÿ„çg¥¾¦É>iÖ\n5+JvÉö¹üıá£2×{`É\'}ğòãt»Öÿ\r¿ŒòLÄ~‡Ô~ôšFh‚fÿs=-ü“µ[mÊwÇs­ò©²Ñ}¤G‘¾šŞ¶ımÔõhÏ_‹ä?‚øGk^Šîá*6ù›v#~\n»Ş<Ïxê]²–ÎN­[ÿpûÖûG~Ê.ıÊ,ÿ|üï±‰å7¶´¿b·~­â=)û“Ë§®”ú\0v­,3Åx­ü\0{­ 0¾â¾V\n~äü)÷-Y¿RîøúµÔ7ğ×J©x›oéó•bà±_~Ã‘­ü€‚ıZğ*l}XÖúGQÔï:·Ğ¯‚ _Xí-½÷Ï÷[{–½Ãï	ï(ˆğ\0ûšöûÜ°¢åê6|ğå3Cùµ¢\nÑĞÿ‹~Ë&ÂÿDğÿõ\\³ûˆÌßapÿx¸¿´üıòEônšw?|“¦åÓk{W!k>[=şıÏŸÓ³¿~çıº7ëÒ=îúHÓÿ<Vhà>»ğu„ö(—ZØ|]şih>vøØxş›”Úª¶ù}£¿{ÿª†[rmßaÅ¿Õöëy§ƒõÑ_tÙÇ|‰NáŸ–‰UÒO[b~±ÛoÌ/.ÌGHóáµ|ñ¨/Ññ:*ê[ùµ‰/R§ßR¾5ïcóM5ôol¿{r¿’½ÒşÆÕı/yZÖ1šß÷Ï|UÑºš}”{{t{»Á$x»{±ş.-?ĞHàoö·Ù¸·Ğó5še5°öÜ »vøÈ²<½Xùd|EÍ½Wó\\züòH¾¤}†>Ø™ú9RZñï^T÷Ë˜á³	¯§X=Uï×$ú·”pW·å-:îşúÿbí…£ë(ÑûÚËVÖ7#ü ØÚÁ²ËOäcqF¾1{Sœ0où9fvu+e$Ñ›{%:‚İLC}‘ÅÌMh6\\Z5Â9…]·ç®¹t‰­F„/½éªâi¼Ş»Fè\ZtM}6zUgË¸U£«x®\Z9ÁÛº3wÊFS9•aî^úå‘<”NH€èõnéúör×\"V£Û;Lƒe–!ÚØÛ4IZáº÷2÷9\nuXª¢‡‰¥¶÷\"×J\'v¼kPµÉ©6Ó·ÜI#ÕR—øMˆQ°y\Z×SW‚ÓùmF8Ñ*(£c§î™Á``J¦ogOlL:D»ÆI¹aA‹¤3rä\"ˆì,v¼2Úı{kØ{Ü´5>nZñØ÷û“.§ÊŞ¾póåPBà\">T²R]:IêÆÁ ½ëÔ$)Î…”çÂÜ-\0Ú`ò­C\\›!§ÍØ³2‰HtæœÉæ†åù*ÕÅì:N^ ¥îvp©ï#­»ĞIË<]1¯àÂ½}ïhË­SÔ\n\"ˆ²ƒH2MûD_Yï”!wD×Oõ|—ŠrlnÇ‚\0Å\ngx.ZæÑÅºË…Ë\Z=å¨5 7îûY1–C’{1J.½Ü:IsikföB1<9çŠ9íĞ\ra\nB¾Ï1Pkä Ø\n’½âÍDF¶1¯á›±\ruiŸyŸ!Ï[t’¦£6ıÉ–‡˜Å…ÄœğBÜ¡Ê`G”Ê9ï#âŞ \Z¼ô¤6¥²êi;éç¤4/7£å›©ÀJÎ`kä¨ç8î’hH:lğ°3…§²©ŠT›Iwj™›%gY‘{š>‡ç Æo\0\\’oÁ‘ŒÈ8LØrPvš–¯Ç†Éê]¸â2Å¹w¾±û]É*ŠÍ8°-oˆ ó˜®R É±k,àÈî~¼¦9®À7[<\'Øô¬uéµC1˜¬D<Ûu‡€Ö‡˜k®‡m[éÀNÄ*·-\0éfCO›’A\'Æ¸·çÒãyç³wìâñ©Ê[ÆdÀÌË¡gC‚‚ØàP\'†ºpş¬‰¾ybP*ªúsa²Ò|ŸïÁŒ]€+ÈíG°É+H-ïôTzA—Éíœ§F..¦·êyù;ÙÍ` \')ß£³V)õ¥¢p6\"ˆ³‹K²ÆƒhkD„)qîªóM¬ÎM¸9ÙhÖ~Pq°QƒäéŠ^¦r[fşPŠ:¼h6l+naŒ9\rU<Zi,\0#Ö²•y‹åº™663úÛ^ãì;m/rèâ]nQ¬4í¤ÌmkØïÆ`”„Ï&ğ«ô™vº¾Qö˜zÕšÌ˜›út	Oİ›L»Zí»5î!wú±¥ÈòôV^?È9€÷°DË!>šÍ¡aMi\nº>Ş†ëNßú7ÊæYMöı!‡Æ\rlú\0#›2-1c„qR,rÎ Då;Úá~º5D›°}·OÚã%G­æ|”‰Á%î’`ö¢wRÓSš¨U›¯áÛåNØsÀ§Ív—–ÚÔ	ts…ııÌŸ+Y·w6w¤öÌ¨—m;Õè26âlîÇÍÀÜ0¦pÛú†”‹ĞWÛÆ4Œn²ó©;îa+oğĞ>xopö´´’:_¡º.`—¿ùÆ¤M£ê¥\Z×Î1–.gåyN—ÁO7€gHŞ‹Ê\\ªüF{á“¡Æ>Ëçı%8:}À@‡V& ?{4ö²ñ.r\n±6CÇ&Çw¹û!¡­Eÿu˜á=f3³€m#Ş¡Á¶|Ì[ŒBU¨_–f…O¢.ÑÙ>Ï4*ï4ÄÕ1r=½‹}œg¹¾‘¢„1^¶Ü	3Î§âÅ¸Ñ·&³å4~£öŒb¨6g‡tQ:µ1¹³jœLCrö‡\\tlÜ9n/óWX¼_X	d8ç€¦V4ZŸ¥ŒYßV=‰=·OñIÌÛÂ	8Ú§¢òNÅáÌ!Xåaz×lNXzD™)ÀÆşæ¼«´rWlT&ZœÎ¡`¯·W®+v×`¸\Z‰gA*B·sÆ[7UgËÉ÷MZ”¾	fûc{:ŞÇM‹°0™”ç5	Èõñv¼†àµÖ(EÙ²‘ÙúÙ¹‰»ùh@œzŞóH‘ïÒX,\Zk›…wí¨o]Öq•ÛØ\',ll\r•1C=s\"~L3ª„Ä]_näâxæÌÜ0E¯C±ÊºÔ°‹±‘÷³»³2ò‚dHÊ\'n½¸¹¼Ô[ÖrYTztØxhfİKÀ‡N)V°¦©äi?t‹\r˜&VÛ4ãÍ$™R…`{×ßhÅØ>Æ.6Âe;LÛº2<¢8³ıÑĞ®:>ZÍ^BénÙ*âÖIA9£\\xÅ™w»ÃáØx/ó¥+|¤ü\n;-›G[èm\')\"EõÈe;M‰ÇöÃ¢=\r„V¤y£\n!½1ÔP7¥?c¿½2ã(#‚J ©fwàÂûšÚ°yÔà­Õ+<ošóP²† c¤Øä±0t®¡Ûv>æ;[ë±;V\Zlp™#£IÙZdçÌŒÖ^la’ŒMä\'^cÜ‚·®ùÕ‡Kxç#“f0/8›s§İ±®.¼®H|Ÿ„›®\\vØÇò×ĞÑO¤µ¿ŒáRV”JêÌVDN±³ØhÄò´q¯rp«Ø$DG”ûÛ^\n\nær£ûÀİ)ïRÍ›\Zsâ”¡.`U¼pep­y©h¦E%*l•ŠLg;ş!û®ÜZ§_øçÒMİaf\r6óí Éù\"ª£Ş]¹S\nëâ¡.!ºÕáEB„Øí‡\rtÙİ,B0…‡?\0äÖÂ¿Xs¢hÇ%!?ªái¾v7\0²ä´ÕU%3¥İyi—F²çczˆ¼…J5õ¼3	Ù¬<¡Gzù¯›äÀ(G-’}üprÌ¤j=‡¹í:55ôŠ”\nkÏ-wâà\0èóå¹†1{[¤˜¢µƒ·‹ã†u«Sæiõ.vÔïeI]\rša2*$¡†zCÃ2w	‡Jîš&m‚>¸a¦2[Ë·ĞMÏ‹¸œDí+¨ËÄ¾ßñhÀÑ0Æ³ÓÎËb©Z†fÓUL‹Ú+ËF‹i˜*˜¶Ã¢6\\RÛƒ@G‡’ÁiCc­£÷ÇPK/·úî\0³$¹™Á%8‹l­º(¤ÑÄÇY†e0cs636¼ÌÖyb…ÓNè¹Ú\n<ôN4İ÷š}ıØu¶y´€û­™å“åË8²1r:Ğ¿äx\rß§m>ZL‘tjšÖ\'{æ¥f{†Õ4·&·ç]ª›»„Eì©Å%‹J®Ny3ç¾·å&^”¢°¹ix‡oÇ¬³ÙQÉy*X#Ód¬\"€tíLSgj+1ÖªSÄQ™ñŞ’œta›Å^N–áx<bt’x1–;SƒiZ-³¿{÷rG3ı\r4;ŠÚ\"\"p«l±¢ê.Ÿá]wÛtú²¥q|éW£½÷Kˆ8ÃÂÕSH„$Ò8{˜P@œûKß1ÓËĞÎ(6›—€!R‚¡ì¼=ÛÛ¢F,şãâÕ5êÑªnˆÈLkªmÑ94\"(y\0Ú»+NÖ´<&Ü¥Ù^1Ó°ûİufÎJEô)t>×WF¶ˆPÀš¥ÃR\\[^û`Ó68’37Qø(‡;UP}¶ÉØ¶í,ìfœa¶wµm\\„¼Ó¬++Â™\'•RÚ\'~Z‚N±Ô9xµ\nnyİ¸Â[•¯ÜÄ¢“û‹OÒ÷LonÙ.”œîApé]¸s­P.+\rÒ¤;J–äĞôï*GÜƒ^UhÜ@—KÙáF„W9C[u=S °‡“˜o•(BÏÒÂÁ“b+m†¶¼p¶=¬TN<.w\0%É ò@MÂíÀK2OVL·{Õ^ŠxÃ@–YO½×z‡”ìFMºğÒ]LJŠèt;.ÍE»io\'­o½X®›ûâ“àÌí®yÊ\rŒÍ§EÕ\"mÜû¥]¯xFáÌäw¶¯4ĞòÉ8¤2ª@·véck#~€©•E=Ë3\'¯)ô`®6D+U\"ü¹ÈÆÎ­´ï©İ->)nUÓÀ\\uB(^&1ï¾|¼·\ncˆP¶3\n,ÁÍV‡AòdÔY\"%èîò…Ù °@\\\Zvè’;¹)úYÉdRÜ®SFÃ¾+4§Àf–$Û-U7æ)ô·ÙEb7WÀ`;dÙöÇÔ„ÂP*]ú1oJºÄØ-•\\@¨%ˆ¤°°éÈ{>¡G×àâÂú¡¿_ƒfg&Ü¢~«Ú8tPĞĞ—J,E¦8§X<x¦(âç‚M9Lğä(í«Nˆ®ª–GÓe8œ:daâ+ìûp&Ù9\"9}føìšîÑòÜêi—‡Q›wS0T[Æ”.=€èQ›¨ïi±íQÎv·Ù’‡~ºÇïàÙ­ÊÒ+ˆ½dów¶q2Ìk­²!€ı<Éæâ¦‡6&gëàÜßè·%q…/£ÙY¬ñ¬)Ì¾£¶mş±Ô`2ñìù !fR8£O=µñb\n…%joë5Ğ[Á¥ƒ{¸2ILne‹ÓÍˆ\\s³[t±ğ‚yk:áÀpš>hïã®Y“Œ«Bœ˜€ÙÔ5c¢tmïÅÍQ©^G»Ëqßöu\"={âQ<£éXÌR+äÁw;Ù¶A’)¿´çC-ìõ&”]¿’á_\"jCm¬xwMÏ&Hj¶DB´\r¡SÉ\\\Z°7dºØÌrÛéØ¬+À50¸äPåvsô·Vr‚Ø³2¥ë—,Û•Cº†OqÓ¡¢–èPw×{%„z‰¥\\zYô¸=œš3ƒt‹æfÛMEšg9q‹~¨§%ü:’P±2,æº6cxñ€Í–:›LO ãUAµÑ‡8`¶ÖÉvæ3jÚmyŒ\Z¢„suĞÙş AØñ)0C)ºŞü î\0ôæ—©Xó†Å)Î¥Ú\ZO”ğƒzµ 4[Â×Ğç¼İQ”Ã”ÊÄqò»ô™¹f>NvfQíØ‚p0¢ù¨X$şÕ„ 7éõjø4Iwvá£\0dT„¾5cç*Ti%é¸k¥D’Ê\n`ß[n@É¤ŒeX.õ¹Î\'“¨öË–9ŒèÖò{Wm’šß’%‹‡›fH1Eğ]1E1O\0ÖBy`•^µçUJ•P?Ñ’WÕ\nGlXT<º›¼š>ÑÈ‹ÏgÍâÃ‰¸3­âÆÅ(Ã>+ãPÚmTrJà˜s’«å¯­0%Uóæ¨HhX\"ÊQJ½†\"\'ú[·½\n¨A‰i‰s{„[¨ìvP¶]tÈ“\'ŞÖv»½©È[<-î\ZØò°(Ju=Ë^nşÖÜîYo³4Š!Ò>j—šzAñd\\Tïö2³áNFO],9{%Í‡M=q)ïB¨º|H2İ½˜öx}/R¶t¾\'-‰\"\0öÛk9.FİX´Ÿ\rwˆO×iÑ–Xåg’Wª©„ySA$h«!:.nÄ°™—¨ *h‘¤ñà;‚Ÿ†HQ$‹\\¡&>	%ĞO)v)¸q‹Dˆƒ._»ßF‰V¤+\0‡j–>³Ş4`«‡ä=ô«O¦{7`7©¿\r‰C=m Â9ePN4)ÍT]»õ|¼¿n1Y5öh7®lNmÛKzmgŞ-)ĞF^=ªp}9MrËŸñÒ¤@ÑÄĞ1|‚{íÙh¼¹’#Dr‹Ê+£]]‡ÌÃäJ¬µP€ã‡-Üí´F§!uĞ2;œi.av(ü%Mˆò¯œp‡íêw†w‹ÂÈ\r&S(-˜pêíö{½næ%h}f	Î‹ñD•ŠkÆyânææÌNp,…Én5¼»ƒ›‚@7Ô€¤GK¯ÙS!İ¡c%grİİ…JÏ‚KŸ|&ƒ¬Ô\nw¡=y\Z\\İ5ÃÃR‹<-¡¶eÒ3ø\ZÍ”×ˆÅc8cCâÅXœ}™/ì‘8Üë{ŸlÔ±µı]ëØáÈÛŠ´.ä5 ÅÛ‘ˆ¯‹ƒ¤Ø2ƒ·Ë@J4{¨ÏiÍ˜v¡õuªSÙ¶!!±§fœg=İmêÁx¦xš°Å\0pºÜ–Ö±ƒ_í—@Çx\0án“d†ÙGQ‚=aj÷_O]\Z«}yÚ$Feñ¬{šÊ¾ÙfFµeÚH×İdŞmÃ0\\´ÇŸ7³\ZÁüi@\"”p[‹—˜¢iŠ½»W¥›ŞaNÓĞ#-í.•p(tÃ×=-:Ê˜2¦÷] Gz{WÖmb’\nYì©/ù»;‚ì”:Ï¶6µã\\³§Á€Š2ĞÈ˜<&clA™\\¢Í-î‹¹¶G·½ÙuŠÍğˆù?ŞYK¯XW	›ÎLB!Ø¦P0ÑDfõ•èàašnğÉäË§\0Kò+i×¥“¡\Z¼N88¨“oÃÎæÑ‡†Ñ&÷¸¤à. ÀÑk\Zl\nı»–uÍ´ëöJôîéébÃ\'ßLqy‹¢>{øH:ÜíEšÓfÓpİ6ê9jGğâÁíçvœ¯N¯İ!ì†ßbr7P¿N±z…ÈØğ7Bğ}ouí!«/ŠMøKö‹G‰… Æi¼/Z;?\0ÍÜRºZKB§Â|*÷i},¦ûÃ&„nÂéáÎ$ ŞÌ8èÖ}/^	ìÈÌPöAÕ†\"7ˆ‚Ho1K×ãÅ¡DW”q‡íqœª:úVKlÀX\nìÈg]êt}Ú”yv«Ë|G7¨NıC´E%\Z±%»s­²cñV†…9G„™ÔX‹Ô¢8÷ö\0:ÆŞß[@ppyËJ\0Æ$!òJ«şb}ı\"§X.…*¸Ä%™‹·$ÊëïU1ÑäÜ¡¡½ûŸ]\ZmSònO§awØÈ5=Fá0ô¶C#ï)›³Äíäìîw`Ÿ”X#Éª\"”{Äy\Z§@ÓĞ’Œ×´ÓŞÑ6R¯Ÿ5}âR#‹7Q–]s•ï„8Áwê$mçV’nŠø<é\r:é”\"“wòBR]|á™É{ÙL“n…™ğ Nà›\"Æ†Ná{\nm?p£½ª•¿øI\\!ÅÖ[Ş\Z&”@8ö\\-¹5ª-\\¯b¢ò™rÛ‹7ÎvØ$]ìˆLÊ=ohoØ€}wîÈpàDı)Ÿ•^Á´³¬,ï]—á{›åqpî•ÅÆ*›Ã&•°wrŞ¼z>í¶¥Aû[e}ØKpAÀûqjt:Ü>í\nÑ,íÓ6?ô“:7§dŠÄ\'B.Rµß-¤4­3nj¹¦½¹Mµ˜z²…\\Ú%ÚØ”÷PÌ`]S«ıHÜFƒ—¶%†±àf)My»Ü”­œ²y ƒ5c®`DO	Úœf) )7Q+tqo”ù°ùæYº;”,²í8\"ô\\4KrèĞIq¹…àÍY´~~¼ú2:Øİ’]qh[\nkoAÑmÆå	˜ùİË³é‹¶Œa\0\0jÁ@âO‡¢;şŠÃÀÔşbûÅÛ	©«ì…-ù>ÁŸF\'¦ÁÜY¾å G{¤´½ÍÁµ”À%á¹ŸÒsušo˜›â÷‚`ú+´ŠEÖ8ÀË·Ë{ÚPlµ²-ÑÚí4{Ñ øˆr<ËÑğ~Üâ„Ú†ŠÜÜeˆãü—måÜöG»%ÄÎacòüğR¹µ%!\0S2ûùšV\'Fo^˜iq¥É±–v6wÏÂU0`ˆ%x?ßüÕUp³™rW¬lú¼øsÙ¢o3äKY:w‘ıho¢gãn\'@äwå[\Zm‡×^ªÚ9ÀÃùléDË¸Ã™iÌMˆ¤NÛ¸³¥En”òPÒ4Íá)Ü½\0E¡r1ª[sÜ‘ÊŞ®ƒgõ~\nøHÙm0=Ü•G>òökô3~Šˆ°He(<Ê§KÄv‹ tó%Ãw_øKøo)=¡ê„_i8E”=—aqˆá¨B68OÍÕ\'\0´‹mÁ¼è^4IpJE\nLŸO5¤EÖçŞl‚Eõ1—ı´›Æ¼—ÈÁe×>ÈªˆÃÙğ°1¶|ÓGSÔ®yæ¹7*0ÍHÛÄI‘Å²TUˆ8c”£v^1¥×·Èñ¢^G†•Ï-BË­‰†:=’â¢…Š€VPÓËşr›TïJT±:YG\0`72‰]ÂuzÇ—1_Ş)®O7š’¶Ô\0hğ²xÕ(¸Õ9|ãıËş\"Jù‘än`Øaç8]dZE±Ms´Ê‚‹ìÇ ¬÷—1Ö¦àÄS	‡$=D¼\r§š¹L}´›ÂQ=x\'\0 ÏôÂ³ùÅ•YD[m:wTÍÓÍweË_Æt°[º*¾”‘n	[˜£r|ëC5x6v¥†s\ZA‰î$…à}µi0µ£|Şs|X+â-‚äWÀ˜äÁË<¿½\\€ÅeÉbÔ\0Nl¥l*4;†ØRU|\0\'>dîà(Jfñ±1Ù†zŒÔÀ˜…2¶Q²Ø¿R¥ĞFs£1LÕÆ\r×8©¸¿7.†*‡ü4iU<ª1ƒhT„ôDºÛ\nãGÒör§p[ì.2x¿Ó3áJx¢î»è1%Ö-.š†¤–UÛÊêµëĞéıÛ”; (sJ†*Çìè´[ÊI¬éÎÌ¹¡NÖ½ª.…±«ïãVç\n6ğ,5pnÛÈõ˜#ˆ%0İ4Uw_³è•\'r¢dl,¸—¬Å§‘ê[‰ÙÛ’¢yDû@«±M†MóEo+Â1DÆ6]”\"ïÂŒœ–š$¸İ°Gw™À\"Ùê‚)ÚZt¶0ø\\Œë)İ™ã6ßy-ÓîR•oŞ¶	/ufê´;NÄöÖé½9›Æ~\\wªSƒ½^È4«“ª2Ü½£gVP% ‚HëE¶ggQ™Ö‰É£c_êê¶9ç£Ñ›cÇŞ÷Äu`ø†*Ñú¾åÎ‹\n±,X,ÔÙw¼{õˆ¹âÚM¸ã¬\Z±ZaÔØô\"±	»Q·¿ê1#ûÔü-OˆÊ–¤æ`1„‘BGñ&<œq0‰­“²ği	ú,‹[J52Af¼=\nlK°H¿Õ\\‡îwX¼Å®É…À-‰¶²gœ çt\06¸î«z;¶y¯ƒ.ÇÌ%.¿Jû²ÜµyuÜCıU¿“×~Ä\"ù²“,¯ƒÆvÏi†{,\Zßndït	Ï»#&>ÆÑéåL²H“ƒƒ—±n,âY¶!‘à§pRª6ôÎlåœs£‡\'º¯äóÊÓ[‰­Ç(BÆˆß`KC{>:Ãı%•ˆ]#ày63bÑó9pV\\$¯qŸö½­«İD[¾íög‚	ªK—½ÔÅÂª?Û&0H„ÁÈC;ô†™»	A£›û–LDÂÓ6‹;[‚È æ\\ï{ˆ‚äONX¤€¿ÏSÀQ˜»³G…&šD¤^l3rJÊâKÚäŒ ±Po¿-X^ïCÂ¾åÈíBÈ×JfˆÅ*.æGTûŠÀì‡?âŠ{8A|Öñ°“¶\Z¾©˜İ$$Wa3Jî$¿+ƒ	mM@’óK½WmÏß\\ğ‘ØÀâ%¨™y\"ßâd˜¹e~xÉ!œ|>šˆÌ˜3BîëÃ>.SÊ CdÂùÀr2•Âô…Îï4¬móàû …gßÂ’V¬ÃNnDË¢˜Èiµã½ô¼b§M©%º+ch`ã7Äµ\\qšô:nNœû-¬°àq«<Ş1¾©Eùílïãî§$Üog¦(Iø†Á`Ù4aH:)·»²T¤©	—±ª£„<ÏZÉCgÙÒL®Ç¡hş(ëÏ©µ˜\\¾wÑ‘¶,ín£ƒWÿ¦Õ]Œ±!à™º•íçìMåÑ¨4a˜J:¥Ç4éû€Ôé[hğCù™ê=3ÚÃÈí¹\Z9‡Iîs|lSøaV&¨A\0©+’-P‰Ÿ‘öŞ;Cqœ½n…-¹¨³å…8¡¤\Zİõ  Ï#ÓæóLÄ\rG0é\'Ğ!Í¢Ùm{\\·ÆÎoõİ-3hâ(æœ£˜,Ú!.ËÑú`ræ‰ÀGêçŒ¹Ct$öÜ•WŸä)ÜÕJgƒ-ÌX‚g²âË½$°ÚÒe,`vN¡,*ÂåêÃ¾ºóTÈ°9“˜ˆn¬E§Åßé9öL~GIµa±‡Ï=qğîJI°á°×«Ñã>²û½rŒ†¨à´mY9e…8\0œÔ¦FÅ‹9@Q”0É2ÂIëÙSTáèl¤«=ÕdÙâ˜mÈîhÅÜÄe7ëvˆÃ¼A‘HJ3kSÚ¶%qÃ‰R\"±ãÀîk¦–ë¦bÜTÕæØ-¿îNØÑéJ?g‘Ü—€Ä^pÒ«€Ô´\Z\\”\Z4ã\0b&riPvoh{r–.g1•ëi”y;oaì¹qÏÇ\n-ëz¼j›YÆ@<nq¯Ÿ¨±3àÆ—™¿ÎØH§R\n\n’K#™•¥*o¢¦ˆc|äE£ˆYªÁã½~Ã4÷†O°ŸPWæ*£N~ò2ÙƒÔ~Û.T6‹nÄ0Ğéælëe<WŒr	äc,µ·{\\FaªR,±pÅ1a‘p<\"Àù~É9ß‡ı¦·Æl8ğ2¨sV©õ¶¥Zİ*‰òÖyokó>àêÔÊ’„kšh-]ÏtÚÇ·ú¢\09\r<&FS¦.ÈxfJM}\nù=Qúˆ^î	õŒñÒ4•ê~a,ötÚÏåúéÜÀ‘!}šÿ£W™„ª½s*Oï	NïÁ!æ\"é\riÓ0ŞN›.®Ç¡\0»ã9mğGñ–@…w7 Óaq?‡œ#ñ‹Ø\0\n X´­YÏ÷jø¬mCçn¶-å×Æ¥*°[èìóó0xyJW»è¬ÇFÁF,\",Fq»ã½,‚\Z\ZQ±X ºÓİ‘ƒqìÁ\r1\0>?r˜4Òà¶q*”„!ªk©\\dØ.´Ñ6	w3‰Ì¶‚İukvĞÀUbªöª\nnr«y49µñu˜¦.A\Z*tt—Vîãj7† Å#×J¢%]	Ümhß?dg¬&øSzÆà½§£é¥¼ab\"¥=ÈÌ¾Cóê¼(ı‹<ä²ªÂƒ¹Äù$Z‰Q5äZ¦Èö~Ú§îîvG-4l$Rr\\¥óäè¤[åv7Óã82ñOİâôÏ’€Ó‡À¾êA¢rí!1GáfÃ\rÁ!BSé:KZ%³qÏ•ZÜ¸Y³\"FÖ2†a\nK3Ô¹İ‹\0İº4‘õ¤ÉTÅîKPµéÛbº.‹,³+|4ŠŒfôd.yH¤5\0\nQÌ£×Õ#UeKğõÄÔMœ|ò¿qòév¢[ƒŞà\'=á\0?ê<ƒoÍ	9>W8Ô=ƒ¹›Ìh5|Ü\"Ä™ÑO‚/qe×·MyÙ£Òí8e:\rwNM—XYÎÁÛ¬ÊD»;o-QƒŒ\Z\Z7ÚÆÍElgŒé¼öÀÕMÆ[Ğm²–°	k\'ş4H’b\0ÄD4î+Qt¢1¡ëëQÀÅ¾Á]>!€a´‡RšÍ…²,ªE•P›Iõ6°âZ„s—–ó£zÛºqµi#Lûğó\0UÓr6ŸÇšY¼Œ ó¥Ù î­w¾›ìÅ	`\"Øº×$EÛ}Ä)íw;w¤@š›ùn®ğJ ÛBgº¤O-w:ºÌ!mhíƒé(ÎÔ.H§8— ¿ÓwÇ>|37Qêúâ¿æs&§Ì â²‹)ÌÎnrr@Ì\r\Zw‡¡…¥w_h®Îop:XŞ\"asáqääfVí	¨89°¸X.#´D1·{NOˆÈ>Úrädå\r#ÍhódbÁ,Ô¶­´Ğ]ØŠ2ÿfy]7ı’2m<Z®]]Ü/ı\"—^KûÅ^Ò&I0\r­²(‰³iß)êääXŒ[Ø¨YX´ü9ã–Ö[º–Lªy’Ò=LÃy§¸•.ş|œ¹¬mc`Ãc@,1\\¦°AwĞÜ(7¶ê8Æté“ĞY»qš¿M»GŒ+y&\\J£”3µ\r¨E+&Ç¸Ië³iìæF%÷¼Ap„R|1Â6u¶éÎ{ı*î+±jš,+÷ÚÑt™á¡ˆzæùXÜ‚º§¾ßŸ6Ä…‡›ˆ„0z°zh}½§äZŞDbn”ìêmĞ±fuÙÙWr:ª—ûuÒoPŒ6|y¡ÀÖÂú™5õIñ’l;˜8gÀM§öµx©Ë>àİÃˆCï®ésD†oñìLŞõl_GÓú}‹eGws‚î~ã\"5ÏwL¸ÄtÓM‹£ÅÇ`ÚH´9Š!«Î´¿ÅÀ$?ÇQ¾Úúlirb6èŒ˜¥®œ”¼°—–—ó,NÃŒíê…*ëiÃİª^}€¬$÷DFFeBxÈjl\'y›Œ—pZÂ7¾aê_šWĞÔœ1Kh¾\0óãaêBù¦ğH_JWEP{\0Yt@ ×Şq\0†Á—À[C¾}£aG/s\0[áocë\r0d6j*ØÆf½k=!wRµO*uG&œ9U$‰Àf‹Ú¸…õŞğ‘yò¸°X»nYf1q½oT!Ól?.Á]Íô\Z<·W‰˜œ°€††9ÉİŒè\nÛJuàK´\0õ%ï£(¡ù0åº[°×FşRú¾ç[È‰S@„Î1ÁÙõt”5\0õ‡3A<ÓÇÛ+VZ:8ef‚îì©…iRÌ6gJÛÒ¸¶3íÒ¢lÜGœowÑÆŒ©íW\"—Ø«§Ûv;Ò¿œ‘BÑK±İa,!ˆNùÌŒë=·GÚöZ†yHá|»O&ºPïºXÌ#VB{i-3»<»t\"r$4´í\0×­Æsîï”ä\08ÔşvQA©ØRımwdÜNrÎ¸îì!6¦LÈK˜Öº0p•y\Z,=í–È\\VcÎ˜Ì´…İ;‚Ğvpo»ZálœËå°py˜Ïç’œÇf\n¡`7\"@,‚\rlNíbi¶?B÷ ıÉòìY‚>XO-Ãwreª‡¹oh|ö{Î¢+2zUÎõÖ…¸J¹ ·Âh¨‡­W;¨qèMSºdÑ˜{¶«ª#e1d”ìS­îé2)ƒN#”Læ‚R™¬FÆfÂ{¥a4\'1m`ì ½Gú5Şàpš)\\5-8±Xl‘rt„í¨ƒB\Z6-ŒÙV$\"9ÙUg¬®ÙğHö¢44Ì—Znóä|d–èebäZ‰ıJò´³Pé2h2s`(Ç±¼‚+İÕ0©Ä“´8zÂ}À©¬t\rÚ¢¸åg‰ª”k4/®x÷–ñÑüÅG¯µÁ3±¦Mã&È<yª°l}Á·?[€+[M&‡’¾CÁÙ–š²?×çìOû¹ ff>¨&_¸ƒ]óbŸ²µÚééÈx=û¾¿ï}Ë«9+¸Æ‡m»sëÕ“yÔ€¯øTä‹ÍTB“R*ËfĞÈPf7RU7¿ïÆ‚d’ÌS{.vMH_;5B„#LÔCß#È99Ñr^ŠÒei\"U¤í+ºÚV‡İ)Q?ãYRŠn(Ÿ/eç|™Õ°!‹@‡\0ó²¸éıí~¶¯NÄ¨Îì†FvÂ~€…GĞôeÚ¢QqÆv=t&“«î¨-~¿ÒĞaç]×€ş.i£òÈua;gıu>2Õ×\r0\'£dœÃ9˜HN‘›I.”\0_‚õH¿³î|-Ù¼<Q\0_4üPİ(Ğy{Öi	›Î¸D†>D,ÌÙHèO3¢éO,Ì ¡\'„]çî¶ÁK¯.·¼MGLY§»’¨éù–À³r6»I¹Æ\\Õ~:j´ËÎ„²½ãŞŸÛ¸áÚ%¾Şhìˆ±ev(O—]‡	‹€å±=M‚	N Q&‡-z5Ÿœ‡ePÁç)Hİo®ÑÍ¢(´Æ¥AŸçóLàû˜1O-z)?Ü#¨—ø†»È­iø±·&2äTlŠCöLÈ\\œ/¾E„òc€B„œGÜ]²xC®}\ZH¦nj8¢uRĞr„i]Bw|$‰ïFNÅ;˜è5ØmÌO¹jWS°D%`ÛBŠº»¶i¼‰$X¬æv7ä)w¥;V³•WG–ó÷Lu>ÛCp£H¢1# 4qÑ›Ë^ T\\“—DÚÛüÁ³ÕM{ 	>M‹Üóz¨„÷YÍdu‰¯<ß×É¾ÉGT™ĞVÚƒàğ•¢Xj>‰Iç\0µD(FZ÷=^VÁ)íõ°4M‡#óÛË„jÅ¹a‘®|Û`\'}¨,R7768XQ5›œÀ2º)Kˆ)\0år$Şù58Ænî^³m%’97âé,ñŞ$İvÂXpsÚvmÎiÂïÒ	6rÊ<£º¾o6ŞÆĞ6½½rŠÄ‚[ÂŒG<:òZ«mHÔ²}Ú.æíÉi­×	5ûÅc5.ûy¾lE±iÆñ°¦½‚MRëMWLtÈq’J ©6àÜJ—#Œ(Öüê^BÉİä5µö¿w¡…Hç}DTurıL†ÙªvC´›7àĞèàu	8œêbÌ,pfu7&àín4ŒØÀ§{l×[âSVE|{„Õs?OÌú?ÿOñ¸Uùÿz\\÷Î;×-ƒüÛã`‘çnäôæ¶MÂÿÿÿ÷?~!~’ó_*ô nÃ·Íš}›QP×·ÿëÿ»\Z%ì±‡øØÕ(’üë»\Zç·]¸ƒ‚(àÏ4UfS²ÙªB*ºÜ~	š·ébK]\\õƒY»-\' º?æâç#!ÒM0À&b™‰ŠÖà\"ÅÕtúàâz»kÍÊõ µ¿HÖ90ÛMÀ’WÙ‘íã0ŞğHGÇ“\ZÀzïûq[DG\n¿÷å8ø¸x~7Fğ~\\.Y§™s/¦7İ‘³Lu91ÓL3ëô’+˜K^—ÅÎï{ÿ8|9W+2#J¢æc1Sç.³ìD\r Í‰ı¢8w¸s¶šK“9%^ø[pW¶STáÎ·.´E®ãCR®\n:Ëè”„``i<:>vo9jìœ9¦(5JJrn	²\róàL6Û±›%ªHŠİv÷‚ƒí³IŸrş~ö•¸h[Y´ïnË±ÙíÆ™8}‹v\r‚‹s¯ÇR¸‰¼sgC’H*†öwâĞë\ZhÑƒ4…pG0ö¨¡ßÓ—]yÆk3òõ\"sãÓ±Æ\"£–w¾ß¸,œy½å»Ó±›Ò«{ÊZ[Õ5¶—SÓĞX ±¹²&‰Mbc§’¹b’¡Ø“ÕİõtÜ±í[\rğÎî°ÇIrè5<ö1.ÚÇÌ%-£é\0–ÁAdÛ´Û*û®ÖS¾=œÛœ×¸–»á$ÿdô6>[×³°™fÈ,³k¢ÜˆºåO5³\"Vr\"|_4+DâÉ©)áq6æ†ååœç{Û	\03Lñ°—(¢é3İu$ümG€wÔAF=ãt×w ¬hiö·¦˜¥]oË7Ÿ‰¦)Å¸ñk«™Å:Ûb¡å¸;¯n0Ï)èã	õªd,Î®Ù¢¥M’`É™iãQÕu3*²Ò±Ì«;S‹3^j¤~âmö(U§	]<a,Çƒ11/ï*mÅ”û•Õt»›Zofq© C l\'R…&‚õ\"¯HBÇ«éi[s¤G:\Z\"Ãú¡c\rwL±¸Æ:4Ïû)õTWÁ%Ù„4» çİ‡mÓšJM°çíx£¬¹û]¡K(”…°Ğ%îŸØDØÑ“ÂİüáXÒ§3\Z @BO*\Z—†`_‘‚Úê\n\"0ø‹¤lVÙ“çC³cÀ-k0wn[^GR#êÎËMl|=xkf	fÙzù¬ô›Ë},[‚ŒFŞÜæe=›&èñ:aÎ±(Úª£¦{¾‚÷\"»x(@¨á	åjíx9i„[‹Wú&gNK.ù1¡¡‰¯Åhpnk •×é0<i(9PT\"9jÖ4°š<L˜ö[ğ¬©\ZÒ*¹ß\rÆÆÑvL1»ĞIî/·Êª4ş~šı1\ZÕ{zÕÂúØ‘dL‹9R	Â\nv±i³¿×b`z“Õ-¹NŠm’˜šÚ»ÇQÈH3(­hwÇ¿g•jßŠ·Î¥IË ©i‡Æ|%‰KD\"¤æx³½;™ÖˆÂ´%JÇéâIN°¢±ÒXœ%ÑtbhÒÏ%ËpˆÍÌäL•!êy,öî\04p‰ù @(§=“ÓvT<|a<¯ŒHÛ‰GæÛ®b¯¡HdªfîUGÓOz!ºÇ?O]¹ÌØÀáÛËC¼³Æ1ÒøºVdàx_81nÄ2©ô}üÜ¾9¦`9Ü4hgŸm¸İ\\5FÔRÇí¢¥Ó£µÛ5Å¶)›,…ftéÁæ¥H¼th5õi#IEh®PnsÆÒö&X 8çqGº¤‡Êì\rSÌ…lØ²çİ6é¡ˆÇğË–%›\r9gñ`/ã«œ‚\r½9ÙÓ)?Fw~špõ®‡™[èIb.ğ\0¦HM’ÉAŞ¨PYâ*Å \"=¸ÙŸƒù’È‹!ÈaÏ†•Šº—îˆÀ[‰•åµáa‚yW¿ŒËø	êŞ„ìüÖˆ7;±™©(¡,3³Q«öO÷Ñ¥á! G]SÍÔ|¹¿¦Õ5¿ÊA½8ÓI½2;í\néè\"Ÿº-*m·ŞÆ!Šíà­ïç=9øF	Epm\r”±Œ­p¯‹Û%Å½ĞåÔrµáË†p\"º\Z®&H[\'\r áP÷	$§UÚØI¡7õò«‘«R+îv\0%`T¡H—vÖÆCzéKÃß”È8-=ú9V3¡³.¤±ßGN|ˆÚâÖF×äJ2m| ¶ÈÜzÅm›=9	…sQF­u[4gxô#™Q&–~Œ;îlØÁB@7l øÒ×>êÛÃ.£”ì8wÍñbÌ#q“Ôf7eBNªîAÚ<vTIÇVdù	` l{¥{•¶$ŠÂu`ÀAåFj†!z—ÜSz&ÜY=Ü«½q\"^”Z2nÁö©a,Ì-ÁUØnn\"ƒÙd+ÄzNqYª\'~[á}iÈ12ë@2Ç‚?z	ñ¢<ß·©V¨\\í´2½ñv—ÄUgñó¥)=NLt(Ï\'FŠçá\0k­O]G0š“ÔÖÓÆäMWå˜Å¦f÷£¡3à!×`MC5ë3¾9£w¦xbÑ	\0¶ƒëS&L:w\n«vRIF>JF‘§YÁ#çy¼ ©ø(‡{Éˆ<¯¾74?ø\Z\ZTÌè,\\3?™©ªs“üºhÙ]İÇE§/ıâàœïµ,3U…èìTa„YÌ…E7ŠÆ+ -J\Z‰âšÈ#u²òÙ¸9p%g›îÂûÍ÷²PÁ–8!ˆ£î\\ZÜÑ1®ÅŠ«‰İ™È‡\0£:›YWÈ],tKö{ü‚)\ZYW§cbZª.ŒæÅ¨Êc@Ò¾—Š	9f†O!.v‰™$Q¸5÷rvN‡ˆÌ\nè†h6wfÓÔšæLMö^‚\rEÀ¨£uŠ¹é6j$|€Lwù8ºœ2_½Óé\Z\rLÌ£•³İ\n¢ï Sràq6¥½ÒÆ¼¯¦ Oêœ×àeÏÅ5\0C.º$|s÷Ä~pÇ)pÌr.ÏtVRœ«iÁ•3AbQ»*¥[×»ˆ¤·òv*ï*o-¢€\r$J ¬arv ’P³b†‰¾ñ5	IvR\n÷ÑF>†t\"¢ÏM#€Zqn‡.[tau×	÷fq²¦D(]\rb±Ÿ¼dp{Óá[)îv›Ç‡Òˆ³­ğw:ÑÙ‡“Ì?n¤R¬êê\Zé]ğåÆoólƒõIê¦8‹ëh&ğäê¶Ğt,#³<qUóºÏi9Š7b³»¶|hCäªLŠ#Q@ªO¼s8*X|¾zz–00u”»hÔ®ºqMÒÎ›°E6çwç‹Yõ¼vîçæxO«šİƒ÷9°Ê«8ºO^ÍSÉ9í5ˆ:¿Dà¡Ï¯êáµ¶ç!WJ²a\\\"9aN(_äÈya>Êg¤È³#°ÙR”Áñ¥{šg·í>ÉFî‚_K5€ÖPÒ‰¹O÷gDÔFC	²Ri»lŒöÆæ|ĞÂŸM¥§x©V`X¾I@9ìêâÏ#\0ÚÆ‰º2´Vğä@<l½[,İ&•vao³ğ“rî¯ãà{Qì#íZæøÃq/öb`Ğô„j»ã4îÎ UŞø@P>7d@;œ~‚\ZÇÂ}ÒCm°öÁ—\\4\rÓŸFMä¢ÄwÛ¦­÷Yz6’©çÍ•]`\\¼)êˆÕ *SR[üó%È,Ãµp¯¡ÆšÔZÜîªY&”¯-ÖY€¸ÅáO‡ÎÒÂ}º‘„}c¶C±EØš–â@€ƒ`×6¶Âµ‹’”‘áÑDê,œÍÛÈyjï»İâ[Cæt¤uv„ÎÖn£é@²µøİ|#J&šP<6hô~»¤\Z>#ú÷ÁÔ.õUKsÓ‹Ô¹î™‡—âÁ½Ç‘Ü­iš0&\"›º±!D‘ãÏpRd]nÔs\0Üİ{8™gÌ”3ŸáÃfñ;”«*à{Ñ)}_Ãè¶‚Æy{AÒ›Ş®İ<á&`ßÆ´_Wò÷†t1”jñ&>A`œ/guïÉ-PÔ›Íli«¿\Z [Ï†Ÿ×.»ÃÄ(–v¡Ûé€\Z,­t\0CğFÌ¥êg!ÊêË•«mŞ£4ÚdUŒŞ’[Ûl$3AÈíÄ‚‰›ô&Šµ¤pÚ<ºÇ*M„î´ÃÍš©bé|­:Ş¤ÕÅê£\rv&Ù‚r“‹’®çl—çŒ8êöX,6>%:ÚéëYg¨‰±CçZD[é%%õä´9{íp¹-wĞ^Ğ^Ù]êßtómŒÕ²¿âtºÓ‡“„P+6xÜ‹~ÚîT»¾Í€2*‰Æu[ëÎù18‰Fƒw›(·¸Ö›\ZË’ 6B	–Š¬lJHÛ;Q‰í<É<Ø Ã˜OÑÁ\Z\nğ,§2÷L†ãûxÜ	ä·#İ%‹ÏWîœfdw3O…‡ï5ÛŞznÒ¹w<o°}OEÓóa›£KÙ_@¦êµ[»HàR÷ˆ •Ešïµz;-®w|qû\r¼}?Ìó¹\"}–Î½³K\\Ø„Æ­ 7:ŞµmÜ™FÕ¦8”jÉŞrnÄßÔLU3î²»\\£Õ­œİS%‘‹geÜx…Ûím¶“À!:Y¼9­š‘qª3Ğ\rî\\y·S¶5§¡îÍ~\'JÌÙéöù\n@‡,{É˜ˆ<½ª·º´=ıÔ)àö4‰@v;İ%\0DH¥O‘tÄNİ‡.tT+@—“½õNºA–*ö‹µFù&m×gei¾¹…& q&&Êcö&Ş—õvpL=_Ââèì•ÕÓ­5Xçø†úR6°x+ùCB9EMfe«Ş%°NS=ç”9²c¸‘vf¬×jş…Ï6æÁ¯¶ÛÂÌ·W.¸ÈÅ«Î&³Ì]L‹b*¨Å[<-QG0â¾»óÉ’}”†P¦He·[BO ¼=b†r±uqkªÜÅ—\Z7\"³)4))†{ø™–®ß²¸´yKÚ\rÑ˜·–¹ªÁ¬í ˆÚ7œ€¹ «\'h¯•b+¦Ú/)²E¸åx¨N\\sîÄ¸`Oå¶¶†9ºfv¡:\r{cWhâj¤EnOƒ›6mTCWğ Ş,ô\\s%Ï8‰®ºw²‰Ğ\ræ´@=şNf9 ¼%œ´\0ôm£‹Ò³cÆ+zCxà9W¢½–Ø”_¸^F‰f<€š¥¥ãa	2(##\ZH®\'Z·}ÌúLâSz‚dÚô¹‘³ÜÃpB¬©,£VB=0æ[«w{m’ûS¯âD3 ÀRß:)ñ%PÁ‰Qëµï•ô.\\Äâ#¼4wftG0Ë98¨Î1©Ü½šyÒö÷šJ2ÒC‚GP_©\"Ud°xğp¬Ï\\6.¾½ªŒ3.›ò4-ëĞ’»Lœb¬ JHÁÙŞ`kh”yıVZñÏ	ƒ›†tºß\\hfö’TÈ“bßbüzÙl’\0{TÉ¥ğÖ·à£¼ˆ=&<Ü²èèY›€—K¯ÎüŒ¦£ÚÜ•£th§£«¸c™¬¦Ó8û³ÎÎnwÚÂa#Ô!K§}WÜšy©R·XÊ7,d	®ÒêIè\n7ë\0î—‘úë•r·\\XîMı|`–ğÊ_bk¸¸˜\\v×ncÙÊİî&cñí‚J‚\rÚ‹Gˆ½‚Yû»ĞÓ|]l¢JµrG&~`Ö.¨hBßŠgwñ]¥O4¹—ãû$HA=ıÔjµÚYÇ\0‚ó™…Hµƒ|}‡ãŞ-D,Ÿ­J!Û™&SwÇ$ƒ·gDBS9Û‰{+¹‹Åh³¿Z`©	oğxÿÈtROùbãL”ÛtÇï\n¸†ôÄŞ—xØEt C…gÊ&b\Zb9´ØŒI8NĞìÜY,C¼»îÎ“Õğ¦~p¹6 {ıJİ8N:ç28²¥¡œÙºrS¼“ˆ±è´¦wŸ&v=ØÅ²8ÕTB“ÙUÉZŒ!d‹o‡6‹EnÎKÖ2Î®nèÀA61#x|b…yƒDÌpºöùnË‚WìºóŠªÙ’Ëœ,qFÒ6‰¦h×hI¡§¤(ö°ç¹|–r…LãpbdÛ˜¸£~:íLõ¼\'Ï`jgJŠ‹òL-ÜNÏÅÁ/Ü•gÏı±êÆô…ÊI²üxĞŒ¯†ÊiÏl13º1jİ2wxÊ˜‡J°-µsd“ûÜ9;+&/¶¡k>ÉRÊšp{Ô{ËT‘7Á©k.¯Â%8^¦õ»CÃ·»æR×ZÎuÅtÊ€`“²Á­¾§ôñ!–ì.·ÎjÕ»n¥‰”İ“~Ïüklo.›Í!Ë7†ƒ¶XCW®[üWã¦pc²–\0•÷1HUİ¨]¢ãËÂ*šØÙ=>ß}e?Å¼•v£-ƒ 7Ë|˜FÓ¥‹*‡¶ø±»-’—YGİB¡Ã…elÔI–Íó‡âğÑ¿†\'™‹{?ö7<ôOÖŞYb\0`Ü8µğnfÂÃMİds{õZñ]«%³á:Ù»Àâ\rÃÆ”OĞéî8Ã{Ö:NĞ¾,Bsîg,“ğ–%´Ip5R¹z+G–$hh?aÉ\rñï¸aœµQö&qdÈyôŠ¸wAŞÁ~—ZÍ¾cü€¹.Æ{gÑÇfO;\\ô:Öî8X÷\0ímiw\r:’âB!¯;	ÜÂq\"gĞÆ’nACmİ,ö§aX\0§°ò®”œÏt¢Âg¿m)5£Ò¹öéÎØO0±‚Â&p%ÀÖ«¡Á‰ª”ÂeŸ-Œt™¹-®gÔµ¯ô%nã•Ş»Sx9Ú×ìàûÅ?&BK»0Æ“Ô¤z:fDêHÑ8&‡eîÀ!¢t9yòŞ²ôî$8\'i—-¾Íö&i¢ÖŠG§şH4šSB75Í÷»ì¦EzÏnİò¤G’3Š`˜\rºO*t™+‘ê0IaœÛFns‰zDHc!¤÷´®=ÒRíM¹9<˜Ÿ`ü°Èâ¾ñ¹«›†ãèxb$æMÔG5­¾dvÆêò²Ë+ë*şÌø¸Ï&Q|gIF’-R.;¿FAÖ¹«½²9gÇ+ª¶ı½—sLOé­šzîÙO¸ÂJqôÎ•ZLu9ÊìUa:ä]§&ãH‘-/ÆHÒõS×FşŒtK™Æ…D‘¿s`›¸ãÜh	LöÅ¤©Áît:Vù®½»Xx­ˆ¾\r—C2Ãyœ1ì(\nO%@K»<\nîÉ®iX)35ê`dUGTé¢šÄb.\\[K s;>£\ZT“øPô!×¨vÇhh,zÒª²—‹©ÒÒ!>a<¾d(%0ª9 ŒÕì¤ïFN+›ì15mš(ÂÚÃÍ2H¥N_†\'XeBÈ¬³¨xŞf\0zZnvº‰ÒÓöœŒp®´t…úÛ!ô|jeïD_Ò¸‹añSç®wÒœëPã\"NÔtÕ÷ò¥¿ûîU¦£°-Ü332ut({KY‰-Kr‚b5ğš`7‰`|O6·34zîBÚjD\013D¾\\‹Ìªg$—b¹y	‚ª“\Zú-ŠÈÉŒ¹øŒS³mÃ1‡E•„h’ÍöËÀ>Xj\"¥Nõ\rr‚}rõ‰:ï«¾7…¦Â›ûuïAz—fâ.‡íË,È´ªáKGÚİ•œ÷\0Ñg·ıb‡MÑølm1wU0JïMEÚ\rw:Üµì¨nÅ€ÖÂ^»ESŒÈ5˜ÄÄ¿tô€¦1kCÑÅ/ú%F·¯T¸™›Áx¾¬ÓÎLUñ¤>œ\',#šãVÔq\Z\\x0ÅN§ÓySã\0u!\00ÏI¤s˜œr·?„™fÖ\'a±ŞF\nVvİLp;n	Ò5vßu?¤GªœN’g‹©QbC´R<êı XÕ˜ÊùQ‚TDÓ¬‰€ÅLL‰wdˆçŠèûqh½ãò`Zo)uã˜M³xßgSdb¶8àÇ:ÛTD‡2èe´ØË­>]Nå	¡!¼66eW¢PiìŒ „z°®çÛè±÷œ4¢Râ&ªºŞ=›¿“1^ƒ­=r”¤UT’ÖgC\ná2‘óm ÉKš3ÄEç”|ë×v`ò‹xÉ47væfÊÒKÀä™…u³¶˜R£Ëš¾¸/,²»ãû#¥)ã&t\0Ò½ôX÷3Riäµ{yS°µÙíıF“›ìrÑ++ãGKƒˆY™Ë¹|KQ^í‘€g>ãLÛBğ”Ã‘ûùPœùsw˜2 ¯Ùø\Z…\0Ã½¸Ú|~Èp[òËcŞbµÎ\'sBJï4Q—ñª«\nMtX”h¹8š`?mxaôöTİ ×¢ıXêñŞ?³[­Óxé×‹z`k&5pÑÏÀâZ-:FÔÚØ;?ÒFÊQÄiµŒuáÌ9ó´íNØNOÉ¸?^Œ«µ¹ÎÊ0Z0°ãS{=ˆ×Y0L{Ë·[¼§ÕA¯÷Ô&·É¾é‘ƒNœÂ[n™@œÙó\\ãç7\"İl‹\nU:ù.ö\Z¢=up³á¬jßìŒ¤·éÚË5ÎQ.‚t!g\"ôŞB^uìäN—ğµÒ‚ë>S9Ä˜+íõÎ\0½lUåÈ;ïT-‡ıV>Ğ!Ãá¬³ßŸ9½ğáçCş¦J4¨ò¼‡»<Ò³¦ÄXô+ÆD/CßÚŞÒ…êÄš0­=26ŒH­9BÔ¬şF¨&LfrGTK~ô\"¹PMÑqÉPÌÜkÄw®Ğ–W^ØÆï#İ’…­q‹™D¾LÌ¹8\n»ƒ¾g¶_`0»÷ZÅë¡8²,˜ğ#­A:d$ØßÉü¾z‘oß»¬¾‚Ü¼Á\rÚËØôİ„öîR+‹\rÑóæÉË4mÉ|ØwÑW±T BÙ9î{Û’1\ZÓÔv\\\\Vâv…ÎD£ìûT„Â,Ù¾¼µ¶â@zàQ,Îì|€gôš	9–Ì‘´™‘PĞw?ÖÄ\rtåSy¼RöUZ<[0)³Áˆ¢N$î9ì[àĞßw{gP†ÃµêÎ”.…ÄT2A]¦áŞôè ÖÖfQô\\ºsíúºãVùÍP‘›Ã¦‹>ÍV¿ç½cÆ±Ì(-P·m{VÎ·iO´…O„x&®ƒ €r!tá¬:£S„SéÄâ^„3\Z€ØÜü¾÷”ƒÊg4İëğÁÜ˜jIyG™eËÓ-É-.ÑB¢aÑ+Éº‹´HGÀóÎRi{=qƒ0L{%Ó3‰Òjdà‘]!5D\n*–ŸİO mó>%ÔI«Tls¶+.Á¨¶#;FêÆMYôzÑ{7	\"€·U?Û9©å~Èæk•g:İ„®/±@¶-Œ²KÕWdéOŞö˜ $ûì¢xÚmâ‘´Äjj›í&8b±iäÍÔH‹É1M¾\"U*«‡^iÍeúN‘Ü½E\Z\0Û:E8Ó‡%†@ Îˆƒù`ŠSO‡pãÁú‰\0î‚Úé!wÅY1lxcûR96{\0ßõüºSü3Álè»T‹%ü ö|ë¸[éÙI<é^›!ç(çl\rVw”/YØìØ‘ÂDaCÈ¸8Ic-³Ïn›·xVÛÎ¢ãlà=|ñ ’Å»/kmßê™Û:-×{Ël°ÙÏÔ¥T6Z¢á¾Lø{ƒÚ8“…–G’ŠtÑQÕ›ÒŞ1DÇl¥CĞ¢è½£#Jsñ¤¤­,\Z(ÄË»Üä6“Ì™¦jÈ°€Ó19vä®º=Ø¾àÙË\\¥ÚLCDuL\nr¹‰è„l‚‰óÏÆ…^ŒšÖ[5î\0“oœTLwì1Åßµ1„º§öè~SbÄåét•KÒ’Åp6%”6Xt	£óu4.è”ss•D	«3ÚÁ-ö{0=(Q(tÊHK8Ê[Ocz»s\rŸÔ˜\rI#®æè!ê|\'\\Ê‰ó½&Ûƒ=™%äXÇ¤·è”şÌ(Ò‰¦êL8VÉp4èŒã eçË™9{\0²gó®3K&¥Ù¨a\0\"\Z·JÏ{ßÛÄ¸!#©pìú|Ö:¼\\oÛı­Pè%æUt£˜zêIbƒ=Ğ³\Z£	6#iïx^‰—@Ù¾|– ¢`ø_¯w\0î\Z?ï£„Qj&ŞÖÆ(À‹‘ê{ALèx<[:éÕÉ¦”1ã.Ä,vÅı½ ò·\0íÌ_¸_¯¶\\ñ©eÎğÑğlq!<±<iNÍúz•Kıte,Á	ºì‡Å®ÚÅ»ìµ’£[p¼ª&s÷û\"~ 3¨vAuœŒóP(IE~œ­b%ÖÆáª€@·™y/P\'äDèÙ³ ûRt Ì»¦,Ğ´ïrX÷pôS3ÆÍøàíÄQõï9s3¶ÏyœH:\"hæ¨ w\\&vŒ¦ï\n”È$Šs´¿ÊÙÆü/u‘‡\"÷•$İFÌÈ³ã1BÜÅŠÏª©–îš¤T®õ=è\\–àğ¦”ÈÉpwéQİ&t˜l$^«{ÍÓ{’’{İûMÄıE0ßê50íA}&ïá¥/Âjñ…zÑ1Û™d.3L;ÈâÃÒgfŠÍ\0Ä½áOÑQlç¸»G]ÁM¯¡6#t*¢KÑÆ[tè…t¬\0I¡‡ôÌKçn‰1\0°;)ÊXBïa©\rˆLë§CŸYò¾ã³@§hİåO‚¡\0ı\râGçV‰Æi¢¦èŠûK°½Tg§¤¤ƒãb[ìö’ˆ™`¥\0Š‡@°Á%Õ&Ç&TÛóÆà1]5çñ0ò*¤±Ä¥DäÍ‹Á(SAÙğª³Ût\Z\'Àè=šqıÑI3ı6ppÖ^‰s/+äÎíğ‰§Òj”f¤-Xîˆ4À“…ã)Àö^„5µÖ&c·ÄÑÃ#?SØºLsí••R×`nÓ#9S;Z¹HÊè#\rf—ğ&O†ayb%	İ\\¡Íù²İ’‘#ŸüìR\r]÷6y¬ yv:§TÏ¹Æoøö ³ùyµ¼»íq|³ğ7(÷İ8`šlQ°?X÷éÅDli§Ü¼ˆ·ØØßà½İ¤Lõ\r?j,¸`Bò%!\'AÒ©¨Œ#™0x”…¤3ì½{s\nò¡¹ïo½bèm•T¼2)m°|ÏZº¢…XèKÜ5XŒ½®ñ1¬§H_Ì	sØ“Îô[\r) ­°b«$x€nêÌHy6½npÿ:ìÈäV	îòP4P8¸Äíbºa  ĞÈW™Pl&r€}ˆqc	ùÊqÚembšweœÎ“HÍñbgLQˆş†V…\ZjW-2\rhXÍİ¬yøO\'à:>†:)˜ÚN‘üƒÆØèc³} ÕÉ»ÌÌ%Û]9Iñ-	Ä^\ZÕ¹½»?à`}§ùÖg8¿µG†gÌ@öh_¡QGNO‚Mê‡ÙdgÔpoÏäåØğ•w ú|(“\'÷Š/‘E€uıâtéíëJÉ.3aÜjÍò4ìÎbÎqïÙæÕf/ö…ŸüœN™êZğ©æçs‚ä+î©®‹ ,mÁûõr­õ@Ù(§¹Š©Şéîµ½y_©Á<âpwÎêŒ‹2I#¤F —ğ®ÑEEú…wS!pOä…%H…a¼1óá%H>Ç’É/Z˜*µãÖ*ô¸¾¡–O]7NM§Úbí:Œ3sİÆT6M£`@pä†\'´½\\§dÔ)(,KH…P˜™ÓgE§òaÂ¡|Q²¬Ö·.b\nÅ ³ÊµÛÑ­‚¢zT)m\ZA;f<jˆè˜‰V÷Æ—¥;à®k°JA©±É!á¦#¶\'­¼÷ŠE·ç3%ÄíSóá&úOôM×„#¶ÓpÀ’ş³*IÓÎÂ~>\ZšH>ì}‹;‡„ò\ro©, 03¤|·\nÏ2ìmÛõ\ns[EWÅíÅ(¦U~¨^ùZŞ×‘Û‘<ãœZaş²ï“EØ$:÷fÂ‹XtJyÊ\n\'Xª6€Âãşp×ë“å\"cëíÔ¨9dêØeÙZòÜ”m‡¿åŒåÛDòV‰¨cº½^C‘sHyÚàc}\"Ñ/|:ĞV”\Z·ÛmÇ\r\ZgšÕ:\'=I?İ6ò	­›r%Ë¦¥#€Šò=pQ°‘çèJ‘ æ’9UQ†Ón³¾Íyµ¸½d²Ñ+Mz6%Ê~Û¸‹ÙºîN•ˆPU¸ø{GÊFÛà¬ö*9Şï÷å÷Æ´§¼(Â,Ypï7©Âí†¦Á|Ğğ~áåÈK6Ÿå8Eh?;hÜŞ‚äR–$tN6|Aƒ-uh“h˜ù°om¼Z­7?²@š‹_£9¥R ²uØŞ%¡vó5Ø- OdƒÂesİEÛİ•NEıfÈ†€Xpd‰iÙ¥½qp8ŞEbqÊ‰uĞŠAÜì*jrá:¤•½åYÛ¹VŒZ`ğ¼¿™t\nÑ!ÁæÌ1K3/ø	ÈzĞ9CiŞ Ø¨ĞN\"à>2Û­`_ÔM²cÓÛ¢¿´¬s¾¹Ì£ØµGStlşLB3]kÏ%,K³YsG¨\ZEi)EÒ.F–ú‡m:Ì.2&S17xÃIS Ç»Éc¾ò¼Ë¸n€ÅéÁÄ§pfNÓ•[I‘Èi¬L8=¥îuªP‰\\|‹ì™È}˜Ù€ü==Üå‹ÒaPE‡·R‘s\Z,e	Peu£3ZbıÉ³àeLÜl§*Èf™”1IH;6İa$OÇ46^<©]qjkİã¶tGï×Sö$qµ7[x›Y]ª^±{DI6³K¥µ±Ï%ÜiºBñâQ_kh•Çà5+íÓ/Úõî3ˆ2…p\0#œKNueM£À\\ˆ7ËEC@^”å®CÅKëvšÂ¡cb£s3/QÍP¸n#$æbW<H£\rã(g…vâ«Şo\"\\X¾^ùÓí¶T²rP=3” @·•XmsÎ=>@A˜‡Şë©È_ñØ…`Œœ¥î,M,X¥	ieÅ‰Œ¤Íå®66R|Xo„.}˜átß‰{”»QÙE÷ä¾H‰°©.1[#m,íY\'U³Ùx 0âT_Í²F°¢6œ³„_(\0”—^4.Zàæµ=]*Â\"d³o€r?w.ŠğÙŠµàübBÑ-ÙhÒeiø­lÊ®gyêI»6™²ÁF	Doì,¦ï#à$q“»\'8‘8„©A©€w®õû®âNQ\n`üÁ+ön2	y¾y4ôJ²K £káÜ£nã\\¬…•y=aİ ìN·c²…õ¹Õ3;tni!´à+bsPîYD*Ö4ºGÂõi(UY/,z$}ìX[^ğ«å `§’uKÏUyg¯‡ñÖÀ¦\0šÉØj\"˜Ç“\"œ#¦G¼qxFVëR®)å@³Ø\"n	8l9+enÖêáŠùK¼2—UÓˆè@¨‡i+]Š×Û&\\¨$OR`!C™ÑxRôu3eÅ¦\" ´g¿«ÕD3¡¤MÓ£†SÀìp“`¾»õ.œò[¾UáÖi+îîGiÚÃ»·7iŒ€m©Ì-º“„öµ]^>Ó¤˜È0@ÔÜ„xª\0®tk]9ABG¨B.6eÍW:NHr6k‰ÑW¼Õ–-!*t° Œº±—qã´¤9¸…¼¹°±õgõ2T¤(%wQ&‘©ÁÆûáVbpS‡I³kÂHqÁÉòB”Øæ\0{rÁ £<›l§s¦cç¢ŞŞZV†Œ›Š“««øùX4Œ·kÚ\0Ö7ĞgæXo‚Ê§Ô“ÖU`e$Åw§­Ç°å“¼x¦—ë¥ÙD‹“ÏÒé¤ûp\\Êzï!W)ÙœÛÎã,a×±¡@º¦¸ÉÓ=»•1W½Jõ1\n¹İYá›‰8Zñé:ôğÙÃ€m—Ó›‚Tñï6°iâNr½¼FNİ•’¢…èÔ*÷ÅÕ<Ò©	5¸¨ÆÑÙ™ÛÜ0a©Éßö9~‰·Z»‡Ò?5Ô•æ½CP£äK^{ÖPß®”\nkR‚w‹1ÚÓÅçoNOMQ.šZ± \"²“¸¼>d— €·D*šY4¶s«R—â+˜íY¨ŒÒ€‹›ë„ÓÑö›ÚËWÆC{]¢¨=ÕÃ.2´§7F½ğ¿çBD[®çÆ¡’XNéa!°	…‰ñ;›)úwÒÈ–ãÁÑQõ{MY¬Ä—ÌÛ*=ÇëÇ6¸RÌEcoàH3Òá÷Ä¹vÃğ#rMÙQ *ê;©UŒ+LÆ•İ•€ãl8qQV(iœz6LŸcdøgpDÆc@z$*/¢!C\'š,Dş,HMq	j/;)õ4Ø7ÃÄU-´³ıĞÈ²ƒ=øÙ¢ÆÃ±x4f#—Ù\ni+àùÖ¶”TİÒ´¹Wú¼c²T¿7ÑÑ¢N=€bXŞÜ©?lóªæqİ\n›y„­^Ìîğ(xœWhTˆäW”§Ó|¤Õ9ëÒÆ4F×yï\"&lÈvBƒµÆ#H^ùóÈ0+´\'~q <Ş1†7‘Ù™4/û*t®ä0sXnš$İ5“²ñêÍf*)ëTº7â‰óæTa¹7L7öÈåÔ²\\¿ëàìt×ÆŠuı»Ğš Àõ:¬97H“¥ì|À%Bœ¨ÂØ³Ğv{[Ô€Oê¢\nòrwÉwéÎ½îWu†ÎjHbå°µ´‰­“Y­v¿§“¯ø<qmGg Wòüñ8Ğ` šÓ=ª`Ši,ŸŠ%V¼8•Á§@÷ã„Õ´àâI÷ïRB,MsœRI÷ñ$(Í2šd™;ChH4Ÿ¯JJñåh6mŸà°ûxÆÎ· Çß‘%+{¿Sär	s¢Ò?FœìMaë¦ÕÖB·¤¾W1B05©p„u;»ä§±³ĞJÌN401¸³\"ØáŞ%ÏM±QFQR.;IñHLbíª÷¹K`¤Mõğ©]VBT\ZxuRCV3i·ö—SÊÜFÜºÆf—Ø½r3ó\\•Nø-tºÉFiœËñƒQn1©ËíÀ9ü1–»;şÎƒ½ÀF±ÀFˆ÷EæR”Æ6Õvñ³ÆŠ Üàv›,[T¹f\'`/-“åòN9ä¤q×ÂÓåæî,š@\"áqîÿmîM›E–´ÑïçW”ÙØ5{Ç˜jö­Ë^³+«@€\0ñUìûŞvşûE™UÕYk/çÌÜéì¬”D„‡»‡/Gâ¡MSK6í•²Ì9…•Ø!’nÅ•-—Ëc*ÆÅÇÈ!ã	9öä¤Úy¸¨×,×5÷(pkâäÕç¯®Ç3«E±Ç³Õ˜hy:ïÄ\0{xâ,KóqµtVQæ€MIèjóü¸‹İù^ŞèÉ`ŒµáfHj EÑÁ¿dÁ\\ì4çù=Bo\\:\nròĞfo¤Ë<Âu…ŒsÌ:6\0®!0É}÷K}Š1Å†ĞªŸà§5®ÏZ¥.C Ø¢Ğ²ÊqÚG`+X˜€€ëeæik‹Y¤¯vbi´³º‘„»“‰È2ø}îÍ\rÏ[ë¤_O!6óØÊi\n)«ÑóàMî5LØÅØäŒ\0p~X®ÜT;#öÍSd€Ï 6EN›¬ç6g9Ä1¾6Ğ\"?ØœËuÒ²·½n ÓÀ€\\2\0<¥+…q^Kp×È™\0TDı\ZF·¬hVKÃ§Ï…	M7+>ŞƒôB´×î4¿Q<=ñÉU—W­Ps9&á÷@:î•¹ÌşÅ¦¶„.”\n:oyPoÕßÂºõz[MÑøşï}‘á²Šòfô½jëÙÆd«?*­u°Ê…·³…ƒ³¼,-\'±¤ºÊº²ãf>R¯Ç@×ˆóƒ«$˜za0N&Ë®šoÎ9/0\0ïHªí<dHñ#~@¦«¶!Lá¹°j{îgŒ[ÎÙ’*7gú‘§+pbn)È“¦;aÀç‘c««µy)*ÏİÑtg%¢0Û5~®Mgv\\˜.ÀP‘+Z¶ŠÓ.‡P9È‡ÈŒ/÷‘Ñ\n&ğÁ¬ìQ~Pù{ı¯4ZÔ.%u»àCë3Ğ^ªe•‰OMCàª`Lõ•\nn«NùXî¼äÌe5Em6Xk©µf¢ÔNí^OPE7I¢â3äh7¡a¯À|ÑÉ´$ƒî¢ët8\r ªpÍ§ì1Ñók\rÈpªô5İ(ËŞ	ÕÊXPUãb¯\r]ç0ô^\Z®îõæñìy² Ôu*âËµ\0›¥;á^\rò6‡€Œ²í\nÖI‰u#ÒâœÖ™\"Kİm/8¬Òn#ı<\'[¢^iceDîTˆíL=Ò#ĞG‘­*/Ø…éÍqøRçùRÈ “—‰‰çxİ°RŒ™­kØÕH¯A7ù‹]¶BåßXL8›³!›»W¡«°ô½EôN)B};ç5–t!g‹nA\0ˆBÔ*Ù÷ŠbÁû¬%­fõhfˆ\ZxÙÅF·¶Î£àe\'Bæ?p—\ZÂĞLU®øÍıĞä¿_ù\'‰ff;Ş‘<:GY…#¦£dTÒx—­d:Ø÷0åvBp?UùäºÒ¯;¸Ù÷4¬èü€PÒ¬ƒ.mWÁ`©ÛjçÖuv–•NßK8÷îåáí¶ˆj\'| ˜	0ñ[VÁi/8–`™–póôÀ$µJûô8§w:¶şÄÆv½\"~W32˜˜J+Ÿ¥ZOH·‰N \ZVÑ°¬,=ÿš.øÀ\ZÍmàa/ó—¼3ûş°]êÔ)®AU[Ì)îk|6–gˆÅŒ³ûğ©5\nÃ¢´ŸWb”Ó¹Ši*YF\rïÙ¯¾3C D‰7˜« Y8æ™aw6‰ÃE6x,ß«3‚Y—ğwš#OãQU­D÷ `şÜ‹y~ñN#eX\0ÃñQ÷DuhF£s[—Íæ\nàTä;ÅCåË\"±Ôw…#g+T\nòhfÑ§Ylªı°=FÀ®IcOšÜÅ«Wæ]0UR™6‡¶ÍÅ>‡x%ƒ?öêg+HÒ‡®ê-÷ğhªóè®Áì¦Xù1ğBsfë˜ı[êR4kœ¦e$c»ªÑ+4jWÎáÈ/Ä², }¢ˆSƒGùq{êËŒÓ½ï9sÃ@Ï|@Æìõan“? D¯Or6ú>Q~Ğx/cğL>÷àå=ëVE|²¬@ªÛ<w—$¥Ra{ü•@îv\r¦Ò£lë—»c{ğf€ƒ´ğ%¼h\"¿GêşÕõpj/ãIá‡2İ‰Ãì«­œQz¾æUÜL£€9İpv65Z,™oÎ1¨Löğ„ì!mç1¤ùÒÅ`ŞøÃµ‚İÊ¦İ+º¥>LSMc{`€$OYôPš…DóŠmÜ}GÑËV:0ˆ.h¥uÁÎ\ZƒÕ«——`×If0EÉ6ºâĞº.|q;™\0ÔsĞò\r‹0wn¾­\riİpÊ\0–,Æ=u*AN¶¸¹×D£èêĞ™;¼ÓL\rCÑK$±WÖ Ë:j¬_’SŞ^†8êÔLiXºâÒz	¨õƒäb¾‡KÍzaÄb+tÓCHkÇ<ÎÑ¬W³‚“›(–š-±!u&6ì`¹âîlègÆˆ`[d²¨¶½©7œY@I[¬™`¯vÏX „£-µsêõÂ[çkÃ1E }Ê]  Z¯ SvyC¾’ºİ´Â®\"R‘KÕø&¹e|	4Êçõ$vãh\\üD»ã1vhP5éŠ¸b–{õ™«‰Ø\"Ö+ñÙÃ0}rÍaè\0¡%ã‘EªeD¬Şj£:™lÒ2Š(	Èsyá…É˜ø¼“Ğ ‹“{ß@¡—i–\\ô$Z”9K4£5Èfjğ³c‡\nãn)Dyn¬\'=Xd¡WéíÄıcºÎ8,ò¶Ê_ÔøŞÑ¥Ö{Óœv´Qhî§\\°Üß;<FH#WÀ‚Hê-<Xô»Ã•`!(—ªFŠŠã+×1DíòYc&ËÖ—Û\\€‚a´lÚ°IœÏ0aÊ×&Õ1‚k»À&(Lh]*#¼m—øX­Ç•ÙU,â˜\ZS|tl<@\\¿¡¦‹è˜\r€ì#©Òw1×IwŠ}ñ@ŒÊÀWÁõã[Üu‡WŠ{gÑİc)U!ä¶ñhgÕƒaxZÊx=NÂ£ 2Ø|ÎÅVoeKì0|XÈÑ9ÔĞ…g7ıe+ÿ¸AÃ…ôõ<Fã•×esn°Œçr…QGãèÑVauÍG\rÏ…UWÂÌ¶ueÛÒ”*+µOWbÌğ\rè™©=\"7z©ŠôxÀ<°KšÍ Qµ:ylÆ¯Æ•b²F\Z@êâ!jq¸š_,äÔŸ}ºb±ë´á`âøL5§û‚Ÿ”‹t…¯ãUÖ®-¨S³a€Cú1²0tá`Ê}÷×)ÔÛJì§ÀìîÁGú1Éù{†–ËØQ˜œ\"Zó‘zQ\'<ÜÂÜuêkk§¦[.|qÕ–t\ZqˆG.ì4z>]CîYÀ÷¢àl•ˆÆc=®dgOuCÂŠdTŸ¶`åçnÍÏ-c;Up»ÅÅ½“)HÀÅÏµk$ñO“+—ê~©ôs}.›½Ú¯+ì­¸}Ãh(>ä°Ÿ¡²r=†y¡C¼N-‡2ÚT¹úl´‡Ñ†ç§>¸9šåÆ²ÌÛ^ÉšÆ-ä…éÜñprbßEîë”é©pxtÇ\r,m\'ÚK–ØUÇŠ¹Ïc’Q¾sw®É!å7Òo·Y¦ç”Ô‘¥×9N5¹Wà0³İ#å>uŒmHœg½<Çx4Td\\(5ÿ\0¦\0|1FºŠ¥{\ZªàòP7˜ÜõÈ2ŞÎúÿò<T›®ÅÎóıêãáª¢\'îÍ±HçÍôÖL§\ZçFñ0és1}ĞCøˆŞbK¾¨iŠØ‡QÚM´m:İD³r7ı4ìjVO[·u]İıFÔ¨(XSešp\'9ê&Åµˆà\rfñºÜ¶l‡ÛW¯YÈgª:õfÈ§z:“p\n¡è¿.Ø1Ş‹Í)hÕväyM‘å–+„‘à¸Ä.rLî€km<7Y£©åPÌ´„îbŸ¸Ëå©Ã³z‰z4ŞmZ\'çQÍT]ËAH{=Šškìéçzœqµ™bÁzú\0óúè&C±Û}¢p\0œ]qÉ¨Ë¬]ó|©à>Im/=‹‡–Ü:ÅÃEh7NlèÚ/7Á`¬¼\nø˜¦Úat•’‰ODJt]É¨m[[h4$ŠÒ hÈrÇ$œ$Ë=½»ÔØ­«‘ƒcv…QH¤AÅÍã°óJ^o½-8u?0èàCKÂÄÓœóèÇ(F€µ\\Îd¯Şná3¶S÷LÇş‚[,œoY“	•¶mî¸‘Ğõ~ÎÊÇñq>ZQU²Ÿb}iîh´G\0f\r¸æpöxtá{o°êĞ+ùÙ[!ó`ŒÕı“.´×©¼äANDûxŸ,¾rš+°-\'\\	üf\0)µ°Ãpl9Ô\'\"ìmïŞµÏS£Å	è°³Lse2×3f^*;œX-#›‡Æôl ”?hpÒq1—N\0ši.!^Wd³1&â^ú\rşğyAl°L6\nwóª*5m‘ó;¸hgc\'£]ò‚ÎwğBsm\"Zö–Er6© 6Ö)ˆî±P1/µÚ‚Ñ¥Ü†“|g}Íñ¤ŸŠ„]­ÚÔæ;äN…_Lq<›ÂÊu‰µç‰=>Ï—ÜòÃìßö¹Û1%¥1ƒÄL•“]¤2¼%Añ³¶\n-še‹Óâ‘VİÕ9\\¬’Ô½õx†SîùµŠ ,½2Î½ßˆ}şŠØ‚*;tvXÚ—\Zï{ØDIõ”“›¢hÕ²šÜ½:F1ıkrŠà6Â#\"»6—ËuiÎ†8»/S¼c	X¹LFíÁ	GÇÔ‹^?\'‡;«zrO¾°N	œÅäuÏ¯{ØÈ–iÕ]\"±™ñª¬b\r¡’Ó2±\rË@Ûãl¡:}.u™íÅb{ÉÙ/.šÉ…óY`î&01ØIì³‚ÍÜœišöúGŸ€\nËiŠïk2c!6±‰\\à`lN´ÙÕeÏ’Û©Ï§‡­†ÖqÓ9#88àĞ]µÖÇ±$ïóp¥ôå\Z\r:t$ßf7ö‘ÁX^á>TĞô Ş*{±4ö¸v|:_ef±Œ+\rw\\“a²>2£‹pxM‰^!FÖğİeÔ„‡Q‹ˆh•gĞwLË€ÂÉ7m—¦[lœ£8	Y$J§«å?¸§mÎ¬Ğ¬1&ş˜RÌ W¹ºmGßÙÕ¸Ï[Å“;r…•|$\'`ÇWq1‚ÖzÍ6àmN\rZ&R(f¼õ-H¶pZ$±Èvêõd&†Œ˜£­<\\Øö„œŠm¾îEéÉX›ÖR××FÅA6Rk¬gƒ>`«“#—Å¡E2é‰ºÙğ€N³éÉîˆÑ4ÒY]t¼Ì@RétÁ\"L¿\n†·¶?9O7få±D‘Z`»7´UÒ0‰Òh¬IzÀJMe‚ãO¦±Zµ±ù)£Â.Y@ÅÈÒ…?VQ@8¤t’¥Qì‡,­JÙt{‰ùà¤ìùä”ê®×Yîé<—#v8ê6Í?Ï4DŞ-…õÚÕN¸q·àéÈ¢G>´»ÏÑõŒ‡¹U†0çá’Ú|nyT8f\n·Ñ4¨xŞõéë:AßêibsÇYûí\0XjirPw´àP»[Z<‰½™‘;0Â0Ö0Ğ¶Å\r,4RÕ’BƒÑW¢-65²oãü‹c]‚t%Ï7.Óí£÷ó ŸR€b89¡Ë:®oàVP”ëhšö`İğË´@Ü¤}ÃîxÕ;˜én£—>M$l´ÃyÌİ‚Œî,gë¬ÇÇC¿Ü[Y]Õ‹åœÊ”Ä!•™¹Cb5›¼€ñ\Z?Ÿöt…GS!@»Ôôd1D‰¦î˜•‰Ï¶ø€Üû«Lí~Èï\0¥ºG½¥6ŒÜDz [{d¡\rÂé|Q*“²WÅÁâ~ÔïÜ6Å9¼,@F`]rút\'Úk¸ğ¡¤Ú¬aóq²Ñ`]•*\nqcŸè„ÑE€G,DNÜ9¾¡ÜÑZ §cŸ×2ëì±\"¹ë	ªAxÔÉIÛ\"l(Kz(Âj`:°‰NwÇóRT¹,Êåu6bò½fWQT.çŠ;éà-Í‘ÊğíâØ@5í¡hºœÛffkNÀ‘U¸êır,G#<g,¸4#Ä 4ÂGÑØ_<==±JË<†Qv†Ø;yZDººã5œ¬V;š»öµk£ÎïÓl\'S;šS3g_êè®·ğ–{ü2ù8SÆg‡X#q–#0öàø :’$‚a¶+ŠUÊ X#Ğ™ƒÜ\0eSá`OÑôb;YˆafÅ(DöVÖ_ƒ{½l*6ŒÖIÉÑ`ê*<ïµe?éDg<¾a®Ÿ“ìÂçâ¥â3{\nWÓAJ€À¯Bà#H“•>å˜İîé•Z!E‘»\rf¨ÅiÙ38h^1%¹!İ¨81½°cñ–¹Dˆv(>ïj0umlw?˜Î™ÅB×ØM[Q®5tŞ9}ÆcãÄ{Şv<,<Í ñ‡ÃnÁŞ~u¶“@ŞI_ìZHR6ù^¥³!9cj#\'«ÏavÀÎ÷¡÷ÍÃïªM¤Ş\n<Îh<LÊÔe¯wå¼+š?–=•ûsf†Á	–Ãñ\ny?í8˜êö,N¥¶\0dêÉª)¡gÓ]§N‘[[w‡HG0‰\\Q‰,›0£y‚}›\nü¡³ûùˆ\r¦ã¾ğ¼Û„™ÖûìÕr\Z@é9QÕÙ Ìyú(İ:™ÖüL«²­Çw[Ä$V[ğ\0¤âu;tD¦™ã!ºeŞ÷Ìà€ Œ™’>×\n*	\Z~cî`33\"y‰ñ+uäÍĞ(®\nUãAÊ\r½ƒ®¸dî>/äï\n•€“h+/æ\Zi¡ÆÙĞÎr§Ë†«’zvNäàdã6P†àC¢l&7=s›\"Ç\")ä6Bù•-wIF“ct¹`ÛíÌ<\\Œ  4Š§á²˜Ç‚IW—¡„¦§Awg;ºÀíª4Ş}Íj{<ó%Ÿº(\nÏ&À‹³Œ˜õ åäèòDİ7‘»øÏÚ¨8{[rŞ#Ò€Û{h•šR+\Zİõ;„>8-¦˜ÕÀó…\"F|§˜ñ=_¼“Âyæîsc7>\\ºDD&tmOsÅUãÙ8şZ«	ƒ6d„|R{\0£¯¾Úb‚b»Ê}X=½á\nÉ­£ì¡±Š.R¯gï‚cÙ‘amİxˆ\Z‹(	 =Æ†9_¾ƒE;İz$¦Fwt·W‡ÔÑŒzŞ\r¤w¨¿»Ş>ºÙ¤7±†Éğj\n©VFÕãågm[çKkÆq€İ\"îº>b^¸Õ[s+íz£ìÜ2‘C‹¶;êtÑ˜ù„ìÅ‰šâiv1±³A|èÔ{Äße{]#;(9<‚Ê66ãŞ™\"“J«˜»öœø|üí‘·#X„^sÃ…Ü\"Ó¾ˆóaA{\rkM×Ğ¾é% ÑÃäº­ãYŞùnlMò¸q4vkªhÓ ¶Z•:*‰¢€Æ0·0Œ×†yß.•Ji­‹?ù×‰‹cÖ-úMæìP¼d­±¸Ó¢ÌÏ½Á)ë#\n£n<Çt‡ùšˆŠ§Í{í<ÎG±¤>\0¯mîµÄÉàó=®­*vÏË%õÒÎÎ™K/U{0Àöîei	~=˜BË-ĞSÏÏ¤«³ãÒN6\n+İt‘+mó¶´\Zh¿¬›z“¯\ngÏ¿“ì’n#¦!Ğó¤V1;¾Í´^E¬2#NäBÆfY‡ã­Ü«€Z[wÅØì¹VdkÉôˆºÁ/F©\nŠ[;ºÂû°r¿ò[ï\0óï÷±qxv`÷ùq-Ïè¨:ÆŞÂOq¶AŒğèÎÔ#¦O…?ô½„8H>íµ-/³òò‹sÔe=$\Z†ÎÁÎJ˜¦zÒ\Z…ŒZåà¢‡zF%uÅ¢œJ„”Sm>“¥@ã#e9ÌZœ–¨ùáSÉoë1£çS ›ÑÒ‰Ç~	geÚ‹À»(‰äú‰„U¥[ğŠÆ:îi<İêâ¢7ÉéÙ Ú£Òª@?køÍŒµ–òrûâ¬ÍL(ßÇš$Å³‰ºŸRP>©eÄÓCUedY&šC»Ë9IºÇDG=\n\ZKKäëãNÅa†ã‰W9PI›€ü|¼Š;0Ã9:û»ZÆòfœËw`;™Ö¶\"•wF{0{ësïì)×¬«&¾ {«ûMÑ14¬Ñ˜- TÎåú\0wğäK‡kQj1ÜPÌ[™İ*“öø«İL3A@¢nı ¾ÄmÁt9š7Ë×´¶28(mBñ«¤Y„·\Z¹¥sk¸\n­_TI‰·:îÉºâÀÌŸ¬êˆ„	%š/Ú3uÍO:ÃiİØ[‡	âµ»‹DóV³àÕ#ü!,Ã”¤E7ˆº¡7œè$ÅàA—Éi\\Ÿß¼ÈÎıVóZ…˜Ä*2â†ìXF<Š{aY…°sÀUôù#ªY¡²\ZPî ®\n\\Ú›…prÉŠæû:—ÖÔgõ¦ŠÓÛ9©cMävO)Ï$S]»»;ÜdîÃ«¼\Z÷Øìl1,k†“#üMtã´›¥«5\'fGÈˆZ;¸uTyJ\'ªjUKØÇZƒT%^Áì¨Æò«“‘\rqˆ$¹£Cæè×çÇé=vGİíQÌˆC3VÕ-›`¹dĞ¦¡ä0\rÓ9èã –F¬âj°ñĞßÛs—$+W—İ¦­äm\0ÜÖ©ÄÊDFÔ=\0Ä›ûtàéóÀ/|^²;°f*K7ë|Œnˆ\\(©‚\0<P™0í\Z\ZÉ›Î\'}$÷c²ÎÍf/üESk\"kr¤RV*´a÷ºİKê	¼ÛÀLú­\0ŞdRç¶Ø^ÅHÍ¹é¥1ò¨R¡r.Àcµ5ÉÚÅ¤v¡\'^‚›5O{}s´>š+Ğğ«©T¾³)p+Ìe7ŞÇs/G zÎ^5	|‹•F¹€}Ñã€šN³âfà5Â\"M´³‰-`ZCY°Â÷ª}‹ÎÑì>ÂY&zÀVù\0•xŠÀÄª†ß³f4\'ŞA‹b°ÈËÒµt-…PÏ¢NŠFÔ4ÂB˜sf!ÆP‚±F”#‰¦‡«`×ÕæòËñq5S>\'x½æ››é-4PÌ§Ğ5@ >ÄMƒ^Ã‰\Z×æTU\Zmüd»zÖzõ\\Nè”šºÄ=º-×îİWÓ<*´”k¸h>ÏFŞéÕÒF±Jä2™d;ö-—\"—Òs™ÖÓ§N„iÌó·iƒ\\ÊsºÑ;Ÿ ¢% tˆ–»Ô4Ï×,¶£<¢Y7T½‚Å ×‰UwpÒÀ·¦@©.\0\']¼÷\'ÎNë¼¹€gÂs3îfdí`œ#_fµ·&Ïí®ggÆ+E‡wd$\\#…ÅUù˜“1îSéİ[Î%ƒ‡=b^<™íìM·\"*B¹ÑÖ ³ÂN\'‚>ÌÒ‘r”¸0RŒËñ•Íç\\w*sˆe”Ş\n£´`ĞTÇ\ZªÄehûï!(±µœôÊÁ¹Qm¥n½¨0=ñ@Tİ–>ûÑhR´µĞZîå¶¦Ó©EZÃ(¬kr€rB»Ìãé,*„Ö¤ãåi±Š€}bO±S<†\'Ïƒ„kq·£9¿ÑfWÙµUi¹\Zw5nñ.`Î…Œ«ëböPÖ×:÷üz‡Y^ƒ½NF˜RàËÁ®ïJrŒÊ¾Š\Zoì<tc@Ôr,8$Ğ«\Zc†‘	ím§ì&´â5m5jš’Júf„Ú”ÊíiIÏºaôù\n‡¯ïN˜şeQ§Aäçªc\rÌ¥…Dô:T³ÜQš¿ùb&\ZÙ^‰FäJhèñ|ÖŒÒºóîÙMÒÃ²ÚƒüÖİ2C?g>¥İg,ètØíhú˜Ü¦‡Şá½ƒJMgŞÎvAe:6qC–<ò*}T.Œˆ‡>\Zê%ZØÕ˜)î&õ½<9ôc9^¶ƒ2à I-ƒİÇ>Ş)9—6ø Ëºg\"¤Æ›š}ø@[ñ\"`hD¡f®µ‹Éé”æ1»¨n²nQ˜4i4¡Š—F‹İSõ¾¥m°œ6¼ßª„Ñ¢„¢Ëå^mâê)¤§ZêÒkó(EFX!/9^¤öj()îäº%Çp\Zp¤aÛŒ’çãs‡{rE™}Úz´²æQ<J]ëXüu*oWn]Ìì06	hnÄwÒqıÁ=uäİÎº=œ<°½Û1{I·T¹k³Ö û/ŒmJ7‚×y„UÇ†@lØ2sÁÎô ÚÚÁ¿ÒeĞ7Óùù}Âw•·\'ÌşRòÉI@DßU²Ã…ón`wçäªôĞYŞc-ˆ\"rÙ“•|÷L´ZÎızãi)Í1ßÎ÷BĞ¶[\\NğÑBãèBr¶LÎ§¢¶iñ+MâC1À÷6p„ÃÂ¹uq¢‹¹Wê.¹.³°&¢Õ)‹ªPíÀvUÊ#(µ_e¦ZGsÎÖÍ\nSÒyPIftõ®ƒR–2æg÷\"oEØR[’\r3s©õ!ÛD@á%ö\0ÊÆöu‡ô`SƒÓJå|ƒ1Î³ÚÆ/m\Z§—íÁ’6\nñ/®\r ¢%db©m[‘9çºqJ4’Üo\0†zòå±°Bâšı¡»·ÇY¾g\\q¡ªŸ©H§7aµ“±¶hˆÕ¡[ÇÍËU——@Â\rÃÄ!¢áşŠH!{•=‘Õ¾;éĞÏ.A‡€7E‚Ú1¨›X÷ÃÇ!Š”)ãøFõşùTÙœx¢;+Äœ®2LÇğä`{£æ /¬qÃªÕE\'\"ÅøN:!¹„WüL_wŸª(ó¼$ƒ=#ğˆÑ÷t®d´VsQšpÄ‚xæZü0_\'\'Fw‘\n3\ZK0œ–Âôâ6„\'T\Z¬[¶=˜«Åí©šH+,?4)¹óVw½‡é¾UÛtÑL¬Ø>öùHî¾ú€Æ(ïû+ğ0ëÓùÛ*d¾z·ÖÍŠ\'0ù´D†7êxu\'^`ª$Ÿ±!­V¡#<¹Ø·[ĞspV€ŸWÊÉVtÒ¥“g\0n]+68Á¬šïÓ5¨Ëõ„\Z!à\\İR}f@–FKUÏñ1{>fF¯½EE®®ú¸­ÕÌ‚²Ú¶=r^Zİ\Z7pñ¬q¨üxËƒ!\'F§CUgÖ¼Mµ\0.Öš1äÅ{\Z/ô)RáL>¼Ñr\nAC£&†ÆÛÌƒ¬ÚuÁÈ‘ÄÌp1:ú™¼ô«Š}á!6wM$ël¼ªÅÜ¢¼š”B2…-œçûØ†b¯D»gäÀQ ÆDô†?îşœc)g\0ğºüñ\nF U2™¥K:˜ç}· C\"¥ÇÀ6v/Å\\ã˜VsÒ8à\\%º³†V—„Î®uÏQH]¶t±³t\r›¶˜öz°<ª{½6x´hp¯Èƒ‡U}òHÚzÇïéÔY9w~¬ÛNƒ¶ô®xìË9owïŠ«hÃğƒÒ‡&i—<_\\Ô\0ğ^öC‘Õ¥xÆúœ{ÊØ¢ŞrD×˜6eöz\"Áœ7pò†šS^¸gqBªMKí„ì…TXÆ\"E4Wº ¤¤CÃL7Ê[!‚\0h´=HœÇhÆŞ(RK	„c˜»+døL›ÌöÔ³¦«£[àŠœ_´|q,“†Q\n–jÜ`;•$b®Ë×³1 “¹D£gĞ¼’ì×–ŞãT‰bŞ]Ã¶ˆ	ù¬Zq.swtØdk¯ø§)è««Û,ÚEÁc’}ES*«Å.ë¶vo\Zs¤X¨+˜›#mÃÅc’¯9 {™½=ÛÈ1ün[¥«i&ø ÒŒÖjë6ÙT½’T\'óD¢[%A`i2],#¹¬_, İ©ihY³àØ–éd ı™qk·3Â»ÌI¿Sìi\'>ŸßR;óè=£×ä~‘@î0»E«\r”ZydÏQ	†âœé©L$QWÉ ˆ·§C1áeÖ\ZnÅL£5Sˆ›gœİ½:g\"¸F^°ròÜŸ-cÆ×‘OØª¨RM;M{—È¶oúUÔŸÏ}lÄßéŸ¤İƒ	³ ¦ÉG›UÊ Ùó\0Ó£ß‰®Q‚©HÈ!Q†|¨H$ÙÙ°gÿ^®ò¤t\\-¦´äß``Â@­ˆĞ[Q\'}Š¡ËókújGK<§XKÃÈ„J÷$~Ö4kˆÔÎ´ÜÓÑÎi‰Yg_sµÜ\\z3hòy8PHz£“p‹ºBm;’$#Ä¬¦Å2ë^DÔ‹p\0EXëz’& V}Ú4€–$cãrÀ•IsÓSv8¶!TdlI}Ø…¤÷ğêê|<›F_ìşßíu‘W 7÷BX;ÔÌ±q¥uQŸî‚búë·ê¬ç,î¹å|œ†ËXwÖVuJ\'ºú#SW_Dw²İÃı”qKtíikhXèâ]¹Å†KÕóY®Hs}th	v—(Yöz“|Ğ°f¥hx:³<Ïp›¾ãbĞg“³ \\³ñÆÈJÙ@Òp‡Cj@?>¿#\'Ò¿Ìy$,AµWxåÒâº¸]Fu*®®û•ËU„ê…‰l©à;ç!ƒw3d|ÜóÆsúÒZWó®©ÆÖ{9‹>Ô/G~İj2‘P—™™¦İÙ’Mºƒ¡{¶Å·¢„Àôœe]ƒ“z§›Ôs:ç:4j$\n±‚Ò¡S=oJ4ÜqˆEèŠV%ŒÑ03“SÚa‚ yÛÌı?V»ìÿ)Á–frëvÛ²ÔjHÊ&‚êÆ@ŠˆÔ4Æ¬ö©€—DP<SH­‘UåU¦ÑğrppÊ¶;%v÷’Kä’![³…3I/%UªÜd/Z\nßT)¡Êç7®öÎUµÇI#,?äÁ§øÀc\'×CO³˜{\\KI·Gr–±ÚĞ:Nóm$èËÑµĞ\0ö„ŞîÌFñv§‹Òí¯–9Jr( #bHĞšpkáŸÈ®ØÀZÓ´H4™°ØŠİ	 ØéÖ&\"9İÌŠ–ûÁQ‡¹È’S]$Àø¬¢€L8.wW\"[Ù~À§z<ú8ª²¯t\ruš”ó•î÷ g™İñ¢9‡«EzEn<.HW%>˜dJŒ¡)¢3Ìö\rdëı®²6¯¨KÃL÷|I¨«LvÚØà‘Ü™œÙ3kÒ.Ò Ÿ€ÇRU|m°u´cqŸíÆP\0¦È“ƒïÔßFƒ:^RŠ˜n=µè†{1í”?4Å_µ îb×1^~E-)<…˜T¾\Z¤<±ºšŞ—àõ¡a³ú€ÕSiì±Yì*Vµdõ ±S7jÖËÍ\\V¬µG{N¦{c½\'šómT%#¦ĞÏgµbÄIôØå­›,Õşj»‰¶X¢ÊFÍW…2I´ §©%Æ¢ƒÌ§ùĞËô”Àw÷@Ÿ•øk_–‰6¯ÔMKº«ÉEÜAõÄa[¢Ç;îCåÑïÑÃ]¨¥e¬ªä1%!#c4Y¥°Î¦E„\"ª×SëÀåİğÆ¡÷,>R:ÑîkşÊ7\'É4Áô\Z¤-K‘óûÜH“kînş0ç‡zç3%ÈLÙFCHÙ ¿c(…Y°Æ~ŞÃ~°ˆIwÆ[5L‹.hQZµyvRœı½ŞN´‹ªÔ–¸¹zÅí(cáPPØ`|>_,D®|Û•#ÀÍ†:UÑ®TO¬K:Ù‚E1P+=¥Éo‡æ|³,g¾;·9’â³_„y«ÅÕü,¤d³jÓø+İ-ƒË4åtºµSŠƒaãé@d9U*r-¼d7ü]˜ÜiYgKÕº„tt/\ZÔUbÃ<˜sCœ\n>ÖdR²óE’RFF¦ø2O+\rRÁÂVw¯¼W0(8Iä>ºT8Ô^ŒXJn¤]€©óÖĞı¬lí¡‚!Sù;È\'­Ô3Y¯¢ú¦]QÓÛ!ØË¬Î¾9Æ]—ÆY\'ã¬g÷8¦ÉĞÅsÚs•úêf¶™rqw6¸»\0Üº´,gGÒ¡3ï÷²?#b0FŠÚE9¢&ì^àšÙnìı°Ç0oó(°òn%E!Ì‘Å\rÏ÷J*$sª.\ZNU¸ôŞàK&	ãHÁÁ7I•+;3¥ÖßîQÉeI§-~½äÕ¨jæÎ]é\\æÀª)vFØpdßÏç®bK£[ÏX€ïÑÑ§éAW@¡I’Š%‚èò¬º\\7K$	—ö$Ùìó ¦wºgißæ–èİü6àµ%·¢³ñ\0˜ÏCDA¢„<ã§X€nÒp:¥ñÅ+Oİ£½Õ$¾¨†woUE×nÜ$!—NˆJæäñbÑ{œ1½™‹ªc³A’*Â;å–;î\0+æ´øtsŠRU4;PÆ~$á‹ÊUÏ;\'c†LIp(f™J4ñ’Á°/5}™êœDeë¨ZfS/©£-‘znUå`©¶:Ôg‹ëÜ\\ {.OJŞÜôs²¬\'ã–{Ñ}¯Ì;%lÃhZó·Ì–Eİğ;R@~YZu[±V\Zqc×+NÕ\n¨_Ob™á-Ş…(A—Ë\\‚¬ÍÎ¸ä\0e8FQîrD)TŠşzß\Z{a8aÔ®	Èh\Zå¥í÷©¬:ïœÓ¼·‰»7WèbRCõâÛÛ@Y<rŞsìÎŒ?^qòjUîdğ‘˜¤	’-7“aVD)š ±‚¢¶ññ z‰\\Ú\\\Z•	y+ÉùÂ[=hÜE1°Ljéãhs„®MlC˜?ÇÏ){m“œ ®2É’Y„{Ñc¢ªşé”-~: ÖõäÎî9ò©D«“§<ó>äÊ1ò@)™ÉŒ‰‡½½4è\0L^;×—¯8ıª’ıE;_Î‰tßƒĞzØfxˆì¨–sfTºÚ!Ún\'µ2¸UUßtv+ÓŠî!\\\rT»/$˜  úH™c›•\"[İè«&ÒêM\'kPå:Rq¬ã³QEŠH·-+İËÉÀ¹àTZáDğ±;86.Üî×ÉÂ`¹_í„À;ğ–kC5iÇš\'PŒ9qa“o¼BwØÍNVL–]<à/\'_ÑS\rysÈ”ñÑ±±c\nùŠãá¹c¼š›°”³Çª§¹=eo\rA4QhşrEµÈ¹mKFBÚÒ¤x½-!Á\\äïö›oÆH;‹t­T:[õŠ8b›ğîõÛ<–—@•ûÛÖ«ˆw:-Éæ­Í¥ò]*È‰^7 $+à©Cş¨È WŒÇÁ¾lô&0>\0ÀXk`´a#—)8 [Q(à†x*X.“}àÍËÄĞ\'¨Ê« or§Ó…Šñ½¾·]B³§Ätm;ÏN¸1§ƒ{ÄüxL8Ô_NëãÀ\0y\ZVUî˜;·ÙZHªÒ-;<÷‚m›•>¤H°ñ|4O¶aãó¨(WÈÓ.ã½u5æ\" ã\0Û)ïFÈã“Krà»í¸¢;^uáz ¼úz2oËqÕe–.g@f+:úQ»¢¶ï\rí¥Uş\\xGoípâÓHC}†–”¼Ğ¶F®v7›ú‰?€‡€ë8[ì!(ˆ¶®zczÙKo; ,6rˆ\Z0xqİÌĞ¦ZH1£e%q[•ªMÉó’+8‘¹)kîu1 NĞn1E.r¯9^•ß×ÑQºš7Ô¶™òÔ5%ˆµ0í¢\'@èÍx©Àİ_\rëÄT¯‡3y;åä’Ëó)9G“ŒOY&ju03¦9‹…¡FPø—³V:|Ú\nQ¯%HÏÇ2u¸=µŒÄŸï×£îvW¿Ä;<fPü±íeÀ¸WŞú¶æLÒ,,ÛêY-£[<Ã=ˆLµm¡£ğÈ	\rÏ\nÒ}àÂÕ\"p’\r˜ÔJ2õˆ0¹c®ñ€¸†Zp—UMğ`¡ö»UÄçMF]A`PTVV1x<²œ¡4üŞãjl´î‘º¡¾²Ø·$IYÅ„§ˆÜ1Næİì3 ›ŠŠT‘ª¦vpì«jÁE@ßÁ;ÚÆÄr[\\µô9O!#’_14Èe&•‡º½ĞêéI·o˜¨h2‚§ ‡ŸÏ¦Vš[ö|v»G£,œZÑú<Vf;@;v¬¨\\.¶äq5Šİ%B½¢Ãò\"+u±´skiè5ƒÑF¤me\'eWõ65¾e.X¥Tiª`­Õz]B¨º6©zV3Tµ?&\\âíè”k<Ê¦Ğ‰\nÄ–g/IàÇŒíW(íW0­{£æ4&ÏÙØ@bfrfBkdi¯¡XÔ‹0ë–¢UBû\\ay†šüˆ@Ä7×)à­ív›N1“âÁ	nÂKâ…±™*:Úî‰2qîÉMÓhQæ>ö:»”Ïï18d|µú‡’‘$EiÉn]«ˆÖˆ1ÙZ_!2eÍ‹2•¢Y^ù´«ü||«A…J»<–@„|cÜ¬*´œƒ9—6—kòBÉ‹+>£X_lK“æ•w;ë¤`KB¢Çà”Ğ8úŒğÌ+rñ0äŞ¼‡^Ÿvİ’Ó–é>æˆNˆÔ¹?n²oö%Œ&IòÅĞÅ¶ì†Îã»…½\0™0Ëq]\'ãÒˆ(•\r°àlÈÇ+i=OçèÀóì:Œq\'UšÈ¥aÆàg ã³5†3”ŸA{[‡fGÌıi½>N¦ĞàÆzÒ¯h|zÔn–Z´ÈEfÇ·Ì`£áØb½{½å@N€úæôzrqš˜»k©Ö[²jèäÜ/ñTf¼ˆı’0Ãw\r´Díd¡ÚÈ€aÑ-™J)ZÍ¯(Ï¶qñ„8ŒèÈ1\'A\nsT¥oh©	c¯Ëä^ÍgÚ)BÎrPDÕtq™-¡)Ë{L»fkïæ·4WWëØÓC\"FüaiØõt”ïÌDÙáÄ Dî´²ƒµÃæàìé{r‹ÁÙˆ)»1sfé\'”% 0¸D0JÇVW?NÖêzØ¶-Ê&š«‰µ¢¢-\"gy>	=+jšfİ5u÷‚mG«mmö7Ìà×•öÛ$ÌÌé•£éŞo™0¦‹|Öñ´º:„ s½q<r­†&´”ç—É\ndÜåïLLğóM‰ Y@úd ´…£ÂG8‚scÃó—mû-(tAñ‚à˜’ÛÆŞ©CH<Ç±¾Új¦á&ª¶(\"(áe;¾ï	—*ÄQl¼#VˆŞ•”Éé¸tèã}VsAa6ú Õ]unİ€?Rşå.¯ÿ€0¼×èQÚg<c’ÃØUÂ+PáØÅÏ¢1@•}€¼q@#*uîÖ&)FkÂÉRM=RÓû‚î8ÛºÓ¶ÇÇ…n‹G`—IX1ÀÁT–kmİÁY’UğÁ”vZ|&GÌ+I*MçÓş21	clõU0œš@&—G˜\n,ÊÌŠí|i•G€ïÃÆ­L§]oÆÕğ{<ciÄÙ,{DzlœÍcáÆ	\râ¢udäŒª)qİ\\ÎÖk×‚×˜,0/¾¹e®£»ÍèX7 l©dÛAÖ›Ø¢|’iÔÖ4ÉlÕÜÔ;wş6Ë\'q§-‚fòœxt.àI©¬C•Èâ[?¢áºs& 9~B,˜Íp¸>ÈAÜ+o†­´õ0ØBs`ÇÒ‘êö™~sJÏ0MdFF_ø´I…ÆQ+Ò>N7Hé31+¹óËºTÉNŠ‚¸vÚ=ÆL«Õv ‘	\"\\Ì>ÁéXù|Ú©·ø‚>Ü#kO¦éi¤m˜:c†•Ü°áæÖsÉæpf¼P³öäï\\æ€|Ô`Î³Pbw$pŸKm¹(ôºVñ8kå5r«X	Söùpú#ê7œërññxüßÿûŸ|/È]=Váû>İ¢_i¼YŞ=ÿùç?ê<ªú÷AVïáßŞ´lê>ÒºúÚï¿_6E¾Ûô=L¯1úıÆ(õ½ÆØ÷ãäW£²ÎÒ°ü$¾Ûúû\\?|áü«Ö?`ûEÆïµÿç/b~¯=şI¿×ø‰¬ßkOşXÚ\'O_µ¦~&íí“Èë†işUÚï´ÿÅ¼JûEû\"Í£ŸNìwšÿdfŸ#|n\\F¡Wüˆø«¬ßiÿŞ_eıNûXÎ«¬ßiÿËyöËö;:ü‰Ÿ¾tù²ñÏ<õ;Íæ«ßiş3o}mîÃPW¯Ş¿¾yÓç×ÿˆÉçÏ¿îÂ¨ûŞûõu‘†ïşƒ9OìáÃg¢]TxC:Eæ4’_áø‡$JÉğúºñÂ0­¿ÂÈş¦ôºGZıŠí/‡hŞ÷‰Öó¯U]EûPË·ïÓíÙ7¨«!ª†÷ûGå|ÿèÒğ·\Z^‘>ª_ƒızÔ}ºšî=ŞïŞ¼ûíuè÷EÏñÿùK“Œéû~ğ†ñi¬ığ~J£ù·R@Ğÿóƒï^?~Òü¢öFnìwQw©ßíoß=ÿB_’L‡¨|?ìÍ¢á·ÏZÚ›ísúaNö«ïûÆ¢]sç5ßé[ÕCô†áA]Ôİ¯ÿAb$I²Š´ŠŞ¿åèÓè+Kß!˜ì‹g‡(|7„omè#é8ŒÑĞûhï;/LÇşIïGº\ZÂwŞoûbvÄ8êÄü†—½˜¨vıtû¼¤YûY¼ÉÇ9Ú_½¾ˆ£hÏ±Cİ­¿}dİ¯w‹/ßÚ5Ërwú¤~-¼]Ì I‹ğ#Õ»ıç×í6|÷Í§^°ÿù8{(ş»ñ¼¼‹Ú~}ÚêG;zß½\\|šÆ7Êë9iÕGÃ;èåç)\\÷ğ½ÿƒãÿõúÿ/0şŸ‰¿÷ié=¾PşRyòøé<]ğwı0Eİ{¨}ı´LÃ°ˆ>Ä»»¿„<íö­!£Ï(òÉãøÃ·&º’a}Ÿ»ßŞ£§|¨wveÏ¿&ûĞQõ•Í»ªßû]äå¿¾üûşùÁOßyÍß7Q×ïâ~²{cqøU¨ùU\n¿.¾CÆ¯Ãõ·ß#äKØ ~÷ÛO6Kı®¤¿Ëæn8Ëg­AĞ·²~Ë@\\×Ão¿+ÿ%bÒôÂÎó£ï÷û¯ï~ú»÷¿jôû}¿	©_ØüwmÍO/Ö´§¡á·/\"İ7êùyçw	úVdü+{û–Ü§Àşô0üMP¡ÿ1zİ\'†ºyë´Ï·obND>>OğÇÆß%øs=g*Lû¦ğÖ=¼àu+ûî{Ö~	Ñ¿½F™\n_ğ€}Oã;>#òw;¾$VäM|Ic¯Ééùò’©ŸĞ2ö¬ŸDû,“çw{Øx–\nU4ïÊ}úŞoo\"ç÷<î«û§_v|•éç=›Ñ/Òà•@ÜyeômĞ{ñ¤7pêSbø+D~û\nı…şO¼ğeN\n½>ñkooŒç í×¢)\r¢÷M²·|÷ƒ–/Söå¥w_§ÊßŞxL¼ºÆtù1Ïl…QŸïFùî¯Iºç¼”c1¤Ïh?–Õû¸wGúş5äıØüãû—>ş©Ç=	ı’xEü1ãOØ÷?6ğ¤]ø	 ¿ ØÿøàıÇÑ	â‚ØGÿñh†äÉ›Æó‹è§ßšXãUÑoÁ¸§Ëî×rÏO›ƒhç=Ş?’×|°³~X‹èı°6Ñk9ñ…ÉÿÍQşñëÅû=,QòF>G©Wû›C¼áãçQÙëŸù%>~NÙô{òâ“/5ÈkáFAİy/ÜÇbës÷ø@0Ğ»ç€Qøá«üı·ÅzNÏk±óãÿTùj•`6¯™¦Šë/Âİ‘«é¢çµ—ğôÃzø;¨ükhú‚Å‘†úıEÿóÒ}S‹¾Æ…øü‹ ŸÁ-ôû¤{ãPxKæ»İÓªŠºşøçYëü×Ï™xıó“\0ş¢êšæ¿\'„ùí_øúÇ»?æì·¯‹¤?£¯p˜Nl@§áE•ÇùT=8Rœ.Ñ\"õ‹x¿ıáìüŒÄwø|Áú%¤}òƒËğJ~+wy_)#ÿ>ÊÈ—”±eôKÊÄ¿2ö%eêßGÿ’ònÿ6ÒÄW¤ÿsH~Eúã$şeÀò´²?rò·ş3Wù#\\ô†ÁÿÖ(è_å	ûöÿşÎPØ_\nÁÿÎ(ø_åo©ø«6ğÄ«€Xb¶i(ì„ÂÉŸæÎÏxex¢ßßæí?ò´?Ì_Ã¸×…˜¿,ü+±.÷Ä¹îrşú2öd±/…|E™¿gÅğñ….¿PĞû *ŠÏëÏ•ë¯ÖwMıóóºëûWhõgfì{%üíÅÛ¥Š·+kopÃŸõ‹A_È—ÅöÃ¤¯ÔòªÒïùjøjÁğeæ‡ëŞ¯kPm¼Ÿ+àëKèŸÿo…©÷îÿ<—$ßæ¸ÿüíÿøzÁàoÙãß\"ú×&æoÿ¥,ºŸ\0ä?Eéµîy÷îG!ì™çş„„oW=Ş@ÛÏ‹7ÿ?s÷ÅêÄÿVş~ÆŞ÷lı®Íÿ2§Cò>»×ĞøÍ\ZÉSšŸpü×|á_ìïùÈ¿eĞŸúÎ¿8ÂŸÀF#Õ§ş—pı—}íß?õÁï3úv½¼*|]ƒzDowà>b‚Õôt^üE:¯€íù)½½KUão_bÂş?ìÿ:ßÿ_ôµ¿Ã°±)j/ÜcK?tãËÆLÿf—ù}kç¥Jú²SéõùoM>7xßGST\rıÇ¨ğ]é¿ÓùUÿãN¯zêªI¢.ªFûÅ€¿}>¸ò|?<÷» ŸÊ‡W*Ğ‡7k)¾8Ç?`é\'C~	K‘ß±×‰|şüŒİw¿<%|ÎãGµ~dŞów»¼ğO¿pù¥ğç)Bhê[!>¼]aıP7^ë¯¿¶}ÒÃhùù6Áş˜ËOL~ÅíWÛv?îÿ²ƒşÄšo›ôÑ0ì¤ú÷aW7a=W¿}â\rşS´Şšµ×4Åóås‡ñÅ;¾Ì]ßÛÏ|U#öY(ñsÃú8î?~:îçSığz¶å*w¢]ôrùuwõ¯ªí/YyeôÕû‡TowbtX}sXìåõ›]sì¿CİIÅo÷eß\"úğ\næ	4ş\"{È¿?ös+êu«ùûüËÒşã¿Ã¸>¯—šù÷²ñe/ú¯çÏ/ğ~øAáıe«?1ÚûçæÔ–óéÀÎóĞÚ›µ_Ù~°ÃBüç§(ˆBŸ~>EÚôiÿÍ) ï¾ûs¼stáÇŒı”äç9’OŞñf¹â%(}{ğé“Égª?‹åï‡İI¹ÿybëÍL|1?±õ&>bŸW~ı=Å}ë`o·È>6ìevîmŠù>òº ùt õÍa*è÷ß?9ÊëBÈ¡—™ø{İŞy¿|<j›xı«R?êÿ.+ï>’üÆØ> úTÿñ\'mà—>*¢`ˆ>rüdn(FS¡ÿoêİn)o\0Úçdñ½âöÅ?o{ºö.û30|>‡ôÍ¡Åçô£4ÿ/Ğıû0Ã¾…YĞëxĞ‡ï‡É+2¾²ñóåÌŸŠñ¬~$ñ»ğ‹×~á“DŸ¢áûåS<üşéµO\'f6¹O÷÷>ŸÂõ1†ÿ¿¿íû\\°ÛôÍµOYî÷‹Q˜>Íõ£ÒMĞì‡¯5~Š<2Ó¿ååİwûóèŸF\\?ëk©¿>aö­T/‘ïÃs“î£«üûTşõõ2êûçYá—Ã¨Ï”ùÅ‘ÙYŞ0\Z¼´ø´Ìüû‡éüÑ~­ìßOÆBïş¢5ÿÜ–Cox‰ùïû>È§ôõGÑıï\róîåÍoãÀW®òôú÷_Ü@\0½#şD¾şw*ÿÇıŸGw>¹:u¤)†úXÍ½ÌÑ—¢üóG‰šzG/ ı‹ğñ?(è7ÇÈ?ƒ$êLéï·ùÉ™ö÷rüË–ø\'9ùXÚ4iõºÂø{•ùİ“è¿Å1şUv¾{áåŠ-ş#-Ÿ8&ŞÜóÓô_`ÿ_×ß¾^zÊ¨?e{³#zï;øâ+$ñe oï‚ŞJü„,>n¼d«½œßüõj¼ÁŸĞç+öørWó«k_Ã7Ûòºè%(üq.ş(ê¯qŒıoõ8<ÏÖÿÎ÷^ñğ÷9ú|í«İ?ùy‚ü¹•ûŠ?UÄ—áË¼}ºEãó\0ı½ªñ••wkª7ke?íõz×oß¿Ãçí-/÷ø|•s¾èÿüÿ\0',1468278924,NULL),(8,'gh5esCO0id8G','phabricator:celerity:/res/defaultX/phabricator/3010e992/rsrc/externals/j-1TBv7Es48.Gb','deflate','…VÛnã6}ÏW8~0%Ø«î¾ÆáE Z,Š\0‹\0®aĞÑ¡I•¢ìfı{‡CÒ—XÎ>ÍÃ9‡C&«FåVh•¤­X%;¡\n½ËÒÖpÛ5íö*ÚvÓ-3W¥–…PÏ‹ŞğÚic«\r{áxóßÎš(¶á˜øáiæäù!ïi\Zo¥³ù4zÒ£Êú|³ª©Ë„™çfÃ•­Ói7í²•õq\r‡<.l²Ri»Ò&q;‚~\nqÛ›^rõlK0Ç¡2VUò5Q”“>ÿ™óôÂ® Eİô¬7D¨Ú2)IÚc[ò’m…6½ÆøI(aÁ! ´XÜİ_,èéçÛÛgDMjVğ‚®˜¬9*´r*×q÷µaµåfÁ·ĞK_|´­--tmÎ¢p/¹ûó„`õ‚E–2)nèõµÍÀrï=\0µ¶Cí;ˆv%³i{^Œ­¸ä£5ÌæzC-$~ù˜¿F£(e†³â5m}r&ÃÏ—™ö·á=_’DšŒÇBøøÖÒ#Ç‹©5¯h³¼¶2ûZñi—Cyeò_ÚæZY¡`ı6pí¡\Z¢#¥¤ĞÜIÛ=K]¼FÉÉw&\nJ€mk g¬~½†ê×ë[|,|½vüöºÙz=O€Äİ¾s…¨+,jqìñ;ƒÇ-uˆdµÉŞŞPá/A•^›¹ªÍ¥È_n¾Lêf¹öæK—FŞ3ƒßoÖ\Z±l,ïU&¤`–}Ú4µÍY£„“”B‡¾@kp?_¾3éx…lGueÔ;¾b„Šz”°õófz*Ä¥Ü®Ï¹>\ZísÀÉräö·åšçè¬«$ía›çùådş\0~—¿Á®ëÜ©âŠ-%¿•ïâÄugq˜i‹\'‰ŞqFë™sš{Şt{üÎÎpÚ^0$.~r~Â\'.#”íøsu”×Z–—èvHyĞ%D+2¾ÒÑgAì–ïcMgùE&¤XÊ(æ%SÏÏ9^ø+À_× ntSs˜™*ÊzËÍ^n‚wSùÿà(T…–Âè\nÿØ3,qN–œmyCºÊÁ\rÿV7y	ÜØø±ÑÛ½«\"Š9S9—ğå§Ÿn×ıÃö0B<‘È\n´µpå¢äö’\"°á’Ğ7ìÃ`]ÊÆ„°¨ãn9ğ\0È*èD)\n-ºòëôùg¿€<×:?_qXÅ1û¾ª“Q{Æ÷Äİ6“w1áVvÉ}%{’\\(ôW²WŞ_!t\0x\"~ {r£¥ŒíŒ½hu€\"º\0P¹g2ˆƒØ…ãåğhµ#Ì¬ã²Bãkot=?îÇ©ëOºá\'\'1¡ˆE-6„ŠGºàîÏâGLÃK†ãzƒQîˆŞ _×s½\'pV!!?ÍÔçø<šdàú3’ŸÏr÷í¯ßáu:¼ûÈäèıØSS‹5.Ö\Zs<¥p›h¢D¬‰-Eíè¥ƒ!Ü•ä–ÓAKÆäâ*ƒa\\fË€gG7ÍÎw«İµDeÁ8(ø\nOCü:…VŒóÔ¢ Gİ˜8¯·ÿüRç „_‰‡9¼ñöp‚ëßğ®EwÈAôt¶KÁş?',1468278924,NULL),(9,'RMExLOBCumOY','phabricator:celerity:/res/defaultX/phabricator/1bcca0f3/core.pkg.js;defa-h9OFOkqbKEw4','deflate','íıi{G’(\nï_ºû°\0³\0‘²İİ¨äcKòX\Zoc©·—â`@ H–h,9$Îo¿±fFfe”Û=g÷Ş~Ú\"*—È-2222–WíıîEq¶™×Õ|Ö¾*W«ÑyÙ¹}?Zş¦,få‡ß¼X.çK—1ÀŒñh:-—Ã³Yñ\n«÷ø{Pµ]Nç¶ìùbî—İ®/–ó­r° ˆ¯|æ§ïÊñš;°,OgĞ:~TUq8¨ª\'\\ 7-gçëH88èÜ.{‹ÍêBêWÕIg°]–ëÍrÖZj5£İœ–Ãôe´„Ê\\\nU«¯–ËÑM˜ÿ¥ıêÛ¯†-Õ\núW¿îî¢æF˜êZû‘G±XÎ×óõÍ¢ì­ç¯×ËjvN3T)Šì˜GÖ\"È\'7;/nü˜ğk8Y­sú±Z;·:s—¿©f¿ñÉZòøò¤ĞTøífLó¹•Ój6±­ÌÖåõ:Ç„üj¾LUŸ¿øópH¿q0ó³ß`½\"ÓŠYç–P¥	H©õäf3¾|š·z½^§ßÊ²¯Öëòj±†¹h­ç-,ÜZÍ¯Êõ¥\\ŒÖ­jÕšÍ×­QKÁ÷2Xğ-õt¾şÒ‚·GËóÍU9[¯:½Õ´\Z—íÇÄQ¬D}p‹áRz£ÅbzC%òcéá	Lôl<Z·	tÇc–›”ƒÊww\0ìüCN•RÜ=*³=:/\\J»,oV…àş6˜h‘Ø)´Ş”%ûâ²¶*³¦£™GKø\r`’ö¸ßØãÕ|ZŞİE	½éüœÖ[’ç‹r9Úß·_½Å|µ&êÑ¹\r+·P»ï÷‡ËêA,ë`[NWån0UPn#ƒä9«wŞS4\Z¯Ca)9*µ.ÚÒl´®ŞÃÄd™òr‹Ç)+œ~\"R3N(ÎFĞçAŒ)W+4-F»;“ÑgÛíIf9)\'­e	­,G3@w,‚˜ÎP[×Øz¹Á¶Lxİølş¡İ!´ó™|>ıWŞ¦¯´SóTñîg0[M ŠÏö÷Ãœã$Œ£“nXêğ¤óä‹ÃÃC‹N°PgÕò\n\'ì {;{;ûn¾^µæg<	íÎªÅ0¦7½Ö¿UÓ)Ğ…òêË¬­ï(@Â »†´f\ny½\0‡:mŠğ$íç£u‰¿ÌösÛÏIÌowzçåúMu¿\0í´Ùj\rİã$”ÎFWe?Şmf—4nMÅ­ûê¯!Uõ”S€µ?É´ÂAö‰¡ëåĞÍe)…cây1ZÁ,.ËÑä¦u\nÈÕ’rå„¨¨C®¬gØVó½¾¿[·ŸàÏOúØ¿mÜAíŞ‡j}Ñâ‚-8¬ozPò¤—KÇÕü}ÙªÖ­ù²…g#Ôcèşº|6­V­I¨€ˆ@g@Ûw§7üû¦Ü\0éª§Ávítx×Öã„™LLæ´×1Yöwµ®FÓê¿Êæ³ÍtZãPjÍ)³rpPU[VÔÊ ×r|t‚;ôàğ(g“ıı½W=6	\'x~Ïàp„¿¥.Ô[“=\\UùQvüĞíVUš;\"EÔ\nîiAfä“rZ®ËßÄÉôM]Bœ\0TÀ	¸ø÷¤W:BdÉ <ƒò0B£õx~•ìï‡ß=B[(è*Éq‹ëĞ‘ƒ«ÈŒt±`vbÙn?\\TÓ²ë/å»æw*£¹âBáÆww—e„\r‚Up€`Ò{hkRàJ­€6×ı£ú³®Æ+øuU^–KüÅ“\r?ï«’Rß#S\0?°­şÑ–ğ‹ÎtG-öø›šéØh§ø^Ù‰ÙÁ%üJoE®Õè@ßfn¶ş“*ı\'ï,Å7¨ùr¯(n·6áa]1‚ùvM‰ÿl­.æ›éhm8}özÆ×ÎØ°¥ı\n.ËÕfº¶¼ÄUo8¬&Ãa‘\r‡À/\r‡ÙAûàÀn¨,³^/ŸëÁMÃİÙ8ww|ät/±‘Ü3z¯ÁeV.îŞ ŞKä¨FQğ©twÇ_xDÈT?Éhì0Ü£Ói9dOiJß,+˜0\\bí.°xLzgã’hï|³ÆÓHpùá“q`0íæ,hQä8K ~êõD”îÉŞèÜRq¼—Ødº›àTÑe©FÅ0çåŠŠÆ²Ï&Ãßµ\nSß§èWÁ=öeñh7PÚJeÒ¥¡É-}Á˜Ç˜¦2D)V%\\m–¾‡ˆğÁåRß3ncîIñ^™HL£kB:$—âá}HO|îîn·ÑÓÑª,\0Ë/FË¯ÖíÃÜOÿ´€bÏ ½İ9€ÅÙœBµø°D¸‹F›õ·Ñ%Ï¦Œ!j”³3˜‘ì\0Û:)xrx$š}î³ÏmvÀèñËtÕqQÔ¨ĞZÚGÁ±j\nÃùWìaöâå-Ç4µRJ˜P¸uµY­é\n”Ó&Ìê@åQk\nû‰/\\\n¡{c¸HC©ñh³\"Nî·ÜÅZ0Ç„D½ÖŸGË\n÷ÏŠªCéÑl4½ù/€9‚ëñx	œüÏÊÖœl­^×À†æA>Ô•Ş¾wğ !m¦DÆ°öPË×\nÓÀ¡<,¤Ôèµ~f\rIˆMäàl„ô›2¨00¢`İšÌK¾Áójà­“Ôy¼³êšê\\Á¡}VAó((±æx´Ànà5`5:+§7ÜQœG?\"\\àŒÜÈd86ëDü–ˆ,‚\nEÆ\"—Ì¡\n¥Ã‰G¬Æ¯Œ*N Ár%œ¨è¤­Ÿ„ÀŒ¦°^áÚ½\Z½­ÆËj±æµƒ‰Y\0€5(—%”„…/ç«•£ü´ÈLûÄ*Ï\'²ÀÌ/æ^=ùˆ(¯aIaî¯Ji¤×zsÈŠˆs·öÖvø¨šÁÒ@uÒ¼rÜÌ7\0\Z—\Z.­ïG—%Q$¦ó¸Î«êu>î1!‡ï í“c—çqÄDµÜğä ¦à~8‡k`«/üIXáõxD³ùâqAÓ¢3“±\rÏ,GY˜Té™¥8¦gV9ƒ“rI»\'àÔMº;Ñ¤îş¾ÉÊUæ[¯ÌÁVU·ËôZy\'[¯1ğc-x¢=w	EºZ€¥™­‹€Ù¹åÓh>™k-¸œ~ü=ò]\n®VR€ëÓï»;‘šÀ•T³=¨»;_ËI{ÏÚ¾¬aµµömÈ_9XyC\"1º[[õÊœ° …Zïrõ>ğ%.¨kÆ„s®p¶Êıè\\¶–ã J¬/÷&ì6¡=pé~R£õÅpHó¦µ9©Ğ²*b<¡ŸÈ‘\nø~~i˜$¤}5î%ã”	“,¬ŒŠ»uÔJX&TšCºˆcºHÓÑâ­JBp8çÂ\"KXZä õæ\\‡zï€Tµ³¼•u aÚ²N²Ü!¥OHàûÜ¯¼•gÕM¦¹+œtò[àWıóQg‹\\1Ïö´ZÁF	g;Ç[Ìéh|ùOœvn÷Ö´KŸÓÓšë»\0]0Ü„•…ÕY³÷¥mÏGëQî[°&(sÃÉgÜÿ\'¿iÊÿ[&ú×œ^¦\0¿êÓè7ñU¶D™ıPäêBÏ<¯7)Ïª2®7-!¨­Ÿ°\0ÜG?á/ÿ“c<â®:˜,`D®µıä´÷® ®Z0KB6íÇáµi„\nûÑ÷¦¿§%‰ıøè–î“¢(ß|·ƒ&‰\n±u6&ş[8œ=ûw`¶•eÎr_³3h›^:‘+lØ[}:ím›IlŸb¶ŠãL‹gyÌÄf?	ÖAñ{?Á¯j¥L7+j¾\\½pĞ y=ÿn;§t \r3š 4Ä¾´³ˆ·Y~«BÀÛÕz¾°ïXüšGó{ïçÑªÑæ\'|ÑãQ?ızs\n—ŸÁQŒÎGf¿–„r\n×ì×µ(@åN(^È…sş¨1„?Ó½IŞ½zç9Ü7Ó5v(L±ıù‰s\ZztYM§ıXn\'À\0\nµãŠĞÙ×‹r×…+o: =¯@²}Om{Tª72}5Z/‘^?›OÊ`T©d^­~®Î/Ö_oÖëùìA\rªè¬ìüø¢(>»»[öN©~Q<&?Ì—W£é÷óÍª|‘Z¸Œ/æK˜¼Âİ­Æ—Yÿ(Ï®°ÖfáOàŠ“¡H™<éĞÀñvN¾VÇK”øul\'&ÀÍa=‚™Æ!Œ¦kù5^/§ònêg˜C…ÊíŒ&\0ß—–|Fä	Ù+j} Ò<EZ\\§Œª¤¨ªZZÁGEt¹™wÓÿ§´_ËúÙÛ+dŞcˆ\'{õÕÄm€ˆú ’‡i&I›ÁpÒ=Åaœ¤ã	®1	zš[ Tù\n÷Dq+8Ş¿ıc?ãÇ,ÿ—~¶fùÑa?càğû3ÿûñúY¹\ZgùgğcZ‘ûªöåŸAİ%îŒ,ÿjæ¿ÿìñg9~æÒ?şìs…€_håíÖ¾“Ü.ıú89ÒiùŒJ)©œú…}ÿø$_1íëÓê(µsß3œäşí–~<¯Dò€	ÕêÍ|3¾-ˆ…!Í	#\"Ô°/·L5êz>E´±ƒEv¬›¬ÍOĞù¿~v\"Isˆ~ƒ/MWÛ°¸8±§Ö˜“)VòiôD™Whä\0»Á¿\\4Ÿmhş)*m·ÛğDsè•ß:¢g:™Ó!/Íâğb4›LñÜƒ¥\0V\0&SQjÜÏ>Íò!-&•×åøëĞPYêøk€/«L%¿Îa[>æ—³Iyİ?Ì™9é‡l?‹°¡Æ÷cÎş¾ˆ\0ñc¯(²Ÿæôúê´Â0§“4×¼fr©:!g„X\n|Z¢l€¢X^Ríb~VUÔ¸\r{õ†“j©ã8Ì¯oPOà7ŠU€+A\0ºÆãmo(‰8ètE<B¸(6À3£ÎĞŠ¦ˆ/µ9r—\\‘ìŸY	¨}Ämøû¦ZÿO‚ÃéMë³–Õz7!”^•#:_Ÿÿø½@ø2cÿtÉ\ZÛÖëÌ.e±jBŠ;4~]ú`V€f¤sKx¿¦R×bÄÀÃ’Óß“àÔ\n£Î‹+ÏÅùtåQ”Ëâv¨ uÚÖ”¨Ÿ±LJiæ©ô®„3àË‹jB\nüØaœ\\ßÌ¦óÑ$:‘¹¢<ÌèV,{¹£Ï§ò}Œ¥NèõK;!YE¢œË»w0–wïĞø±¼{gH\"Ï×»w¢_5€JH´V”Jª:™Â$½9®&\'Ó‰\'Rºšt¼İ%tìòò‰-xppY—\Z`ãËK|@ZÎû¿ÌÇ„Ş÷áhŞú$(oå\\ªu†„b:•›nkCÒk¢}„ÏQ}Ù1Qx­Ø.ÜĞÎÜÙ©Ïj8µSÀ·¤Ó:®1ºt=Vÿ‰^Ä]îĞ‹sD)¥UÛ9¸âö°Tµ“ã0	ğ…eºØ+%ÌÚĞRîß³Í%´ßIzÌ£‹2¨ ®9Úk)^Kn`éÁªk¾¦°&öf¹š/]&vf’VÇœzÒ¹­%õd˜2ÍmbõÀñ£ U7{RÄöÄ-ò0QnIp9Ë”S•k9ºˆ^x\rg†ô–²X,?®NÓÏíQVs…z¨/J$ˆ©õ¼·Z_LKÜ\'wwœÂÙÄ5Ñ/ †ô·‡M½!ÂˆgœÒ0Îc1<òÌL9ùîN~ ³ôÕ\Zy¸]”®.sêv†Š#»tÒ~Ïá´ı}ş¤1Ò¶Î¤\0öö‡Ñr•ßÍ?èë|Î¹~ª•tJ­jBŠWYM\0b5©W£n¯ªójº*]jgÈht©@FG&—íÜJşCúhëv,lm/J‰`;R§8w^¢[Ô/R5ğƒJtKTî™”Ö!s[Ò8Ó]Æ-Y4 ±\'œ‚W¨HÍ•r¸}Z	˜S8!ó¬APp¾Yû’§ÓÍ2“ó™ß!ÜÈŠ[ú	İZ®ûxGÍé•ÈèË]òÍçfÁt=5é°ß—Â¢ó÷fm?‘È7µá¿·v€¾?™ã	«Nî1íÿ1U;İ•dj§Jñ:`Éw6ÒÇ©µÍù¼gÜmbg´K(nˆëê+¿ª¶\\ßu¾Û‰?˜::æ›Vs=¿ÂÏ¤—K—;ï}Jáë=Ñ<÷í. mGû(/¸àéØB^¿‡Û%ƒ·	\Z^	ÂtOù¹\0šÆs½v:v²ı-”øÍ=*è$TDô·ˆŸÓ*|¿Î—Ÿ‹MQBn82z:®ÖîÄßÃÚ1t…£*ù´<-‡££›âèşçÈÑr>_plâß\'\0˜=üÙ¹•Úé¸Må `çKèƒ9\'4~©Â“æh¾?½Lñ»;íQ0\n”:ƒO…dSpL	\'EÛ|ÜİvÁ¬h¹ïq\Z¯ªY;•{w§)Ñİ†Ilp‚-Ó6¦. j¸îËî½ğÚô´OŸ†OásıV{Ñ{{y’K•¾üİÌ#œ<óåÚ?ŒòÓ}ÎQOavOİÏ0«4KK\0=¿jwº‡½/¼Nd²ªü×9:ƒëTßıbMß>á¼@ıC± ¯8+ê–İ•cé_ë¤~9¦’¾îåF…	Ñ\'~%¸éXŠi=8h`Z-Ú42°edÛ¿¿_KJMGSésÿçé²]zp½ˆrçöÍÉ§%^$XMsíîåìËú\nA*,O}_„½W%İPÔ{Š0/×ŸÇ”s¢{¤ãªÉw¢vâÚèzÑÎ¨JñÆ8@I2–ïÁ²¼†ÃßUÔ¨Är±ŞYGpœ›Ü#ŠĞ\'°ç‡Ô=×/92C°óM‘Mü8šªÍœ¹Îp¨re®FR‘~FN—Ì+2&2@zV¯‘Iõ«A÷b\\ëÚ˜7ü±õ‰9VĞí\'³ù¬[òÕÅšH\"\'ØLå½Ö÷¨ƒ7­.ËéM²µ·Ù²l!mÀ5+<ëªà oÑ{	iÿ‘F&ƒZ±Şèhö6C‹¡÷eK8u\';¿6 ğR€\'œ1„ãJÀqÁeà€?ğ^Ğ«Pxûã™O§ä§p$oóÑdòÏšhıÿe5ÖñÈL˜^Î\n7×ƒ-_5ÏåZÇN!Âšÿà\"è£T°ÿ×¦ßS*V\"^ğ’Ùnš~,À³ßÑ{îoœRõøğUˆù÷‘œgLÃó…ÕöCá«9Â{‡ò`S‚ ¥ÏcÊ=IhèìùI‰SîÌEFc`°V4-n¸…JËÚI¤ùÔ¤Òßƒ¬ÃÖ…F¼Z‹e¹¢¥\"a6î9NoHÜ¿\"Á?®Í¸hNÏ¨uZ¡:<jßjÃ€€úï+4ˆ=EzuüRa_EtÏÌì‘»>Ê\']Jƒ”cÿEHrÖ4m\nZò<;Bk¡¨æÁ¿o¢^õ“~ŠúhÚUß6ÿcH‡Ÿ¡ä?öœVıÎ‘H\Z‡Å…….\"j®×¨¹\r¿¢ªJúßğM	_İĞš*rú*¼¬®*4†o”kãbú-ï•=ˆEIí\"xÊªä€½óñh]~/`øE2m€Óóo–Àìê;êi	SWÍ-™O!G¹œO‡šZCSµ7Ô_5Q*™8¾¤dÚTAsY£Ÿm„—å9rİK±Æ…­wî`1ÉÀã©jFÊÃ9©&¹‡9lU][‚=q‹®%’­Ÿ–§£óòşÖ…±¿×6#QZ8ßœ&Jdüè‘qRJ•L¥yV›Läv^¡ŒXüf´üÉåc\'a2§Áâ!S§y‰Öá-‡Y´+Ò¨&v½ñÊ‚ÒjÂÇeo·ªX­¿V8Ö-ËBdQ#ß–6¨}•¦\'Jo7Ÿê\' \rßÉÙş×›SË¥ù¬:_(¬tB{’ên±ñş3v3\r;Ğ·¢-ãµî„­\r¬ä\'lKdâ»– -5HXŞ<ûìÊ ÙgY–¦\"ëR›/¸µù÷kH+×wXÓ^u¹<å@”«õª-ôl“cq»M¢T-İŒGò—@-Ù‰\nõY~.WóÍr\\Z}–!>‘ãDÕü-Š+Àº\\².‹ÊèKøC\0…Fï\\¬‘©\rE¾YV¹&Æ\0k¨>şfuüåbÅn&æ›u[Aç‡Ş5HŒT¦®`´ªBí?ıü’šaÇIÚ•J8m%¸“ôÓ¼ìÖ\rãX	ñşĞ™ìÉ”ùRAÿU1İÔÈƒÚpü.ğ…ÖÍR‡\ZhW„MA‡m[»ó]I´ì.¢½ñj•u\n+pî~€õìõë¶ë—ó@z”!Šj†§¨#’B7«}÷Ë¡O_lIjÏ°=ªÁò¨°MåàD^AÛgg\"V ®ö¥=¹Ô†X!³âwCU¤Z½ßzõš-Sñq\nlªé†m¢r]Ü¹\\$/({ôÎY9Âet9îC\r˜\0NéÍ	`ÃçQ‹°§>—XÜæåøb4;/c­<Êâ‹\Z¥ç!zé¤Œ\"ÓiÉîî4‰‘Ø’ Gô¶>p›HVcõõÍ›Ñ9¾â¶³‹5qà‚…Fålòì¢šNdBÜ‚Æ%VIQ¡SØ´îX(ëS‹hkŠ2®`\'.Ê&ùbYá,ç|åÁÏLfı\r&2köÒNUÔg áVFæe„†”†¶â/gp²\0§šÅ|:Í’}ÔÔ¥q|+¿1hĞ¯)1bÉÙ²ßsêbQïuÍú’&ŸëÒ)HNÒêÙe~ş@;ıò#—¿{Wğ<xGªĞ¹å&Ş½Ã&4µàÂ¨\rÕ´;]c³r@Õ¹ñóî]~ÄPø\\ñ\0FeZ–éÉåõ$ÖCŞZs×$‚ò¡– |øøoê°¯ŒS§Ù\0ëd:X0ƒé¸#Kgl>¥ÕBÏ>m[Ò{şx£†kø	œ~¬ÚµJ¨#·¼ÑFz–Œñ™­]²k4î-oN\ZĞ–wãÓíòr!ßÏ…u±Ä‹\"%¢›Ÿ-©Øú^ùeğİrÏ\0¶ ²Ï¦H iÈ7¨=Û%şİWí{¨¢n9³.¤!$›‹.Ú¼4è¼õ%ÑMŠFTõ@É×ş>%#ª\'h@¶at|ÑánœÉîÃ‡ g(®`×s²É0ÈGãƒF%“ƒˆU´†Ku¹B³#ï‘ÈnĞÜ½¼ªI¶AÇ²}–¥Lµ3œÀÑš¹Šˆâ·è˜K²<ƒĞş¬àÀ?ş”…/®êÂß³j=E¬Í‡×ÑsÀÇUvâÜ%İ¯/–—åè£O¼Z«È÷Ê)æçC€V¡ı&9¢Ñ—Ÿø´Kùã²:¯fo<kkÿ3nŞşúıwß®×™R¿›¯gp_QÆôW6tkgß¯®¯¦{X÷Í›ŸèRıZº@˜Ÿ­ƒŠÔïg?şüº±Ç¸¯1£Hv˜ŒdªõÅ3¸˜Á¤ÁV^¡^0ÕèÜ:¶Z$/}>¿\ZU3©¾‡úÂl‚‰i%(ÖöåT$=Iõ:ôÀ—QÒl§¤	Î&g§­:\Zñlµ;}—‘X~Óõ<?üWØÄö]’®—*-‡×$ùéöl´Enø¬Ij\06AšQ±G6ëŒŞ õ[Ûp;J[Ñ^ä®;¸½¼Z“a˜3eíD›Œ]PõÜ&«{€uE­¼@VYúK2¨QàèuE`ZR®ÁW!½)¨h0êÆ¯Ğ–##S2…³‚ay7P²Œ˜æ\rpL‡´’ßÎ¦Æ`å¤®\"z0ìz)j˜A0å”M)_\0WIi\Z^HnëœõÅ|âzû=}¶#PƒÔ²³Y ?ÍP*ƒ²ñÓ¯ßd¿Hè–Ÿ¡Pµ õ¯/ŞD~„+šÊ‚çgÃÅ¨Z®ÌùÌ2Åı#:­z7ºa!áô<Q•~¢\'R²şv§	*¾,íaŠ{É¿nÆpº^—Kæ©–¨fb¦gÂö²a™N;h”!¢DGAâù­¯¸”E3—ÉÖ\r	ªm<í½ğãK”|üìgûYçàï~Ï{Ù7Ñ{Y,Õ1Ø†WşÜíÅÏ?ÿøóğÍËï_üø§7¼{°•ÍŒ„Œ„¤el&ìEæ5îİŠáş%ÆäŞ:v‹ÓèÎ%|®çŠhHË¬e¾…ık‘âÏlİEEJà‚ĞC5¦ŠG×İ>tk¿ên–Àcç$^˜æşŞQ·&Q|bzr,ìaN”­fR=Ä›ĞRhªQ†@%”iÅm0™ß–’’\'èV||6ÓG‘—.€s-ÄE4Øs•YJ /ÌÙ+>Oä#ØÍj¯(÷÷ƒ¤\'ïîlÊÓâ³ÃC·ÇÛÆEsì\"ãz¬İğ|3Zzúú‚Ÿ½şù›Åt1D×òÈßxÍ±%$vë‡Ïz+¸Ì“+]ìùŒk!Å·=†®GªíŞş~¢BàÛi{0è²Îêbı£}R‡)Û+RŸwİù\'ÍÎV¿œFœcØÆœÊH\".$íŸ7)*A¸—‹úëğ+ñ)şàfÇ£Íùzãpø\Zˆúxk»äèÃµ§d%Bw·=Eµ×Í›’AÖÔ†b‘€F‘¨C‹U)_´°È…†(Kêˆc­¦k›š$íYD{vv‰—lƒiº½Í£w Z|o	À›}ã`KƒàúE^½şñ‡Œ•(ğë«?¿øîå™±ïïa	´IØ¡SÀL´Ñçc¢ şv÷üÇïÂªËèb\'ßV(ÛCßæZ¬Mòß‚³¸Õo–ó+‘@P@–kÀ}7Ó3kÜw½…2‚İ­nfcñ#‚ßx¬@v}ùüM\rË©¸FD5	Äúu÷ˆàİGîñ*²­’šYëÊNÓñü|Fn\Zµmv0e¼öŠÖ05oLùXèïÂàL¡ı‘35È×«%À%23\né‹[@¿JÂøÅÆxñmT ”Ö’øë›¸!)JO—¶ê‚-F7˜:ù´6Ù\\SNá8\nñæ%÷‚aW‡„îºµâm)Ø‰xK–oIæ½“(ÓTçÉ”…aÖdóJ\rß­TÕãäÄÎèJb&(Î&6‘¥2«XísRÑßÑòÆj×qÓô­º\\¦`ä§¦ga†J|AÇFg‚OÒ}‘‹Øeî³/ONBéÎÀ\rí/ÕúÍw<û	oTáë½¿hÙ9Ñà¢ó/µA,nî8.ªo7Q°“‰ÆDYş1:¡¼o.¤¹«÷nô¾œV³¡*Å‘	bÀ?\\”3÷¸Jj8‹¨oüXß§]kÎézp{ÛXh)ó<a¥ã´	›çAÏuN‚DBqkuĞ@yKkS÷ìiëN\'¸çö»ÿrxx˜\'¯õX§×ûD8¬PúPL¦„Õ2ÄTzéREª‚¯“pÈ<ƒÙ€ÎÖm,…*â^uÓ\\êJ¡àÀ©SdEv@uüFÃ¬ê³ÏÔ.EGÍırÄOxÓp‘v6P£¸³/ÚÓw…r7c¯X›/¾èI÷ùKVÔGÆNªŸN\ZEã~añ¼ªô\nœ¤8Ÿ2Ø!£÷J9†Ã‹50H¦	®˜›Õö*ÓQz“úÖ”ST}ÜRØ\'Ó11ŠßFŞ“`-½‹$ƒ”Æâ>K;ò%Ë08>Ô*˜Ï!N.Cî™5Qì.…—†ÂõA“wªßıÙ«]\\ç7Ádÿ¹DİGÊ	|	¶3ÎI?k ÏèŞ„X`øgBZMóUûZòë¢}]ÈZ|‰ÿö™ÛD[c)*tS´o\Z‘a­{½ºæ‰’ç«µ›Qğ«j$ôĞÿ•H}7²¬ß¦^Îäü¿Î;\\\\ÃÎ2µ×ó…T¾ÙQùÆT®ŠÕÕî}¨&ë‹_Ş¿‹=zıC]ö¡¾ØhÁ¦˜°änm;·7Åuïfp\rÿ^{ş8À.îíA°Æ,‘¼9Ö4ò”ö¾*?øWÈóä²ªİ8ìsLˆúHYÉsf>Ş¹†šü5†‘ƒ+Ç³i™?ûH‰ğkÀ/•ãuÑ\\Ú\\¸;\\öıOæˆoıÃmÃì,9ââÙú@‚c¡— ¿şxvˆ’S&@±yã¼øë£â=\n\'äî®Îò K>M,C¿!İÔ’]¢1\\\0Gò`Ü[ÁÅr:ıúÛÉ]¹¿…åşæÊ½™/:r‰¿Joà¯„~šÓ@~bççTß¦DÙNš“ê.p\Z˜\nûûökÏ+\"Î1°‘eË™\r<ğD	Hl¯Ä^‰`­®™’ÁM˜uº~&h› \Z.	2XG!îvz…˜`“ÉX–4¯)7ı$0¹Iø–H†\0|MİeÈ§a·XÈ§Å‚dêø}wwj¦ÿî®4_yå}q˜M_š¦–úşÕùù²<‡Kâ›ù2tşÈó“ÀF!E8Ê»»(1\Z¦3k¬`\nlÆrˆ¸`R©Ë‡O‰¬¯ñ‚ÿîÏf±\0âe*^¢`Ù¹%áM±Ãé	âÒÒÆŸ•êÆ&ï§²rÛˆíîn,¤A>s[†ñÏÒïCÅq™ö KJ\\ûš`ÛjÒ¿J´ÒˆwwáF‰„Qg·ÏJñ ùD$U×ÆiäMä*òw¾^UWØ«üÛı’»¿|Nöhl‰ˆ9íÎ3ó#ÜL¨f}}órBŞÃ¼!Ó“j²WP”´¨]&gQ/Šû]ûm†^‘²·™šÌ¤í„Oœ„Ö¢ \"K<\'alb¹Ymğ®(æ¤@!V¤ºÚGJ6Æ²‚Ü1…:-1õj´ºd‹È\Z³]q€!C1Zè†AR0¸	@ ‹#5+tÖ=©!s¬Eö32iÍØÚn‰*ù·o¾ÿ.ÍÃ7Í:üø¬ãÄ…ü\nZ@)÷‘|KC®B8{(k\\v\"#µ¿ïîğßõß¯+ì·–4Ù~B<_>õî\"MtrKÅ4šÍ¬{òaaØ×šódÓòœ5İÖ¤\rqsáß³ù|M®Á§›«ÿ8_ÎÑõ-Æ4\"#6(µ¤ªøÏ„”ç(]rTÓáj½9;#AúÏåù‹ëE;û·oWŸ>iÃ¶ƒÈûÅvŞ¾=Eæ¢áÏ>cÜ|´=¸óX“œ£O`{S.ÜôaS÷z½O>nºôõ\nÎ,Ú:[Î	¿QÛƒ­G5D,÷û5n0TĞ¼õüÇïå`¿À¾˜§sz‚±R XŠÕCm\n¢¨ƒUçq•ôÏ)bš¶tÿºNô/èEAyë	i@=eóÇéün.ØÃOÖË§¨ô„Vò©\ZÂ:€¶ò§µxô„Õ9ß>b;tS(ŸÀôJå_0ÓxÏœ }´Dƒ‚iÚ£hÚĞW$&ãåè¿n¾Ük=Ÿ·~øñ\rL]¤öööt`‡æËKÃ®\rÁÙ1\0±Ùı  p½ÖËäÆø¥(s¢oäºE6¥Jô*ñ™P£$ö®éîºöàB|lX\"ú,IìòC;›Tï¸$\nC\0c(‚ÆØÇ”\0Œmo”?Ğá&Æ•=«–«5YKtn†Z\n-(.\'ƒ4SÙh…’r1Î£tUI´é]Dn]—ÆØ\n¹+iØ“#{nâ´8×â€ß–—›i×Á!‚~¯h[ïÉÛ~3Ø§{ÅîĞ|VF-ÄSa&Ê³\'ßá12g„Ú˜Îgİï~0eFç9¦¹ €8)Z±ºšã\\¬å­áïîğ;u.²á(ÂÁüGêºw°S{$¹ùş„‰(X4PRd	ÅV‰ÆY^•zj\\•-®\ZÂ\'@äùUáö\Z8´Ğ	{Eîa ,¢N’Ñ’—å&[2|?ÙÌ«”Gr³`J…pØí‰ÂÁ÷\ZgíŸû2L©s%™> hË‘¸#H°ë\"Óg_wWìüâ²¼i}‚À>!eHŒdqvãüÈìãÏOğhúD3d!‚2jõVFK®Ù$Š¡	%\rÅ)AãrXıŠsÃíVÔÔx^4GˆïúÖVoæÃÍ¬ú;ÿ‚®/)_«—€DªXG_Úğ)¾‘K\r»ƒû…ôƒ/¸k¤¡,ÑÈÜlÆ—ÖQç·ÜøsW…\'ÜßJ.\rˆİ8›L²1_è|zv1LÉşÇn?Á@v¿`ì|\nÂšÿ–\Zƒè^‘¢^µºú‰›=ÎmŒşW^8«O€µ»øoİWÔ*½tÅ#n\Z_B©…¯Éıî½¼1yÜÒN –0§öø¦­»–rñ\'ª®ô¥LAÊÓ´”Ñ3ëøD#èi9ï—4éø\0ËÔàJFÓv“L.ë]U•ØÀ-¾?™Â%o¤:íVÈÅJVrıtšZ³\rrœ™ˆ¨¿Dˆë%BpÉØßßÓà‚¾¡x!šG“ÃŞœ­B€0I!:÷:‡_Üßœ£+ş“„²÷.V*+ jïÜ¼G‹B¢ª¥¸N¼#yÉâş¾#’‹éhÌ{9gíåà`É¥@„ğ’z•¤Q[ñÔi“µ9£áÓÊÕ©9ÆÍ­ÖöŞ* &Öi˜L‰{¹Á g¯«SôtÕ¹uÙN\".“7ìG}N“\nVHØêÃ°o&IŸ6¨k,ë•fìMƒå¾)Z(}4Ëà7c¼‚rÉ‡K÷Õ›yRßåX¢+-6—&5a~*ÕŠiŠÂıè\"bh9i1Ü*ÛüIµBÁÀÄ–qd%(IÀE(åpŸ*ºÂÈuËÑ¤š÷òñE9¾<_÷¶ûûA-Ê†™°P´;t4z”_TpYÁ•Â|?Ë+Ôõ;Ê×%şË[\Z@BİÑ9VE}Ó¯~~ñd¾~ñİ‹go(bÑ–ªMJ¤ØëÄ\\«ÄÇY°ªÏ¾UjQÕK›ê¦YîÄ&Ìàºµ…M¨»77§â‚®ô\nÿut2ˆ:ÍŒCúboÏ¼v9/û\"-Ş+\n‰¡Ò!0¤Ó’¤ùÙëÒ]¨eí\0ùŒõ‚¥’:~Qµ¡KF\r¥%‘-T!_ÄH84ë®¢qøØI¡ÿ\Zõ½ìéëY„8öò9OèÉ oDaˆ\\|gÓ@Ån¤Úâ×Ü„máPèKÆ«•İ0Í±fhàÛ-’%.lGÊOHÒyŸ:–…>dEx(aô’!£ˆwuÑ¢òV2„,	îF3<i¸l$áÇ\Zì±k6ZSPsòOœ5ŒW¼·o5Hš©ÏÁqÓú>‘|Ìà5íåó„ÃÏº›BŒ$‘uTO$ÎÈ3¾ñ¡ÛÄ‡.œÖ	ï	¨äko\r=\r<]3Ç‹i¸­P)¤¼j2Kh¾¿Ïtïˆï\nº!ÅZM+šo8ù–$Ç†v $ŞÉáğÿz>GeA,\r 2ò©®*C\0|DÑ&ß¶¢€ ı­û¾\r³vXZ2™\0Pdn}©\"¨ä¹R(5h:Â\ZEøéy.ó¬Ğş»·oW 7í/ûv÷»¬ãyÖÉ©ç°BW¬ Œ\ZiÁƒ¤¤!ùÃO×Ö£ıGçy¶?ºZ2“ú	¥ş}3_ÉO(y\Z&>¥ÄsLDu¥‹ù‡X´YUÓz‰Ã™®ÀeÙˆ¥ĞŒG6¢I”>ºj­%¾\r\0ïŠyôX$Æ©è@Ğ¸hJá–nŠ,£i®ê2ÜÂ@±™ÿk¡š-ïE4nøÅªÜÀ}\n±3¿¶Êâ\"I:6ÄãîL%ùğ/”ŠÙ}SÔyïO)Ä›Ã4—OëÁı[¢mpŒ«Gwıeûš•Üú°Îu™G`\rP]\"ŞpÌV°Â­ßog¸=œ.[A–G@î¬QG`ÍíVØoËúK!Ğ·İØòx(xÏÑ$¶±Á9w(³¡µM@±NÅÏ«a§ïÒEfA¤ŸF-å+	Â¢/{«ÍtºYÌÌS…p#,\ZI{ßf¿Pê‚›ÁŠÚ´æšC›óaŠÏ*+ßù•¦¶ŸœOç‹§¹ğ›ĞOœÿõO>zæe²ìB&z?,É\\¤}|gåz~_gU]!|ò½ëLßŞ¯ÒZJ9‚[!ŸL´ˆ_‚Ñl|ÆU³–\\\'¹šıŸ¸¤Ü´•°¸›)?«NÙŒ·w¬Z8_ÌòBŞ}äí ¾i¤‚î›ƒ:¤(ŠÈ¦½hœ¡®,¬(-.E9Ô	©íMÙ3Æ¨ƒË2[Ìõê¶ÓùtXA>S	aÿ™IsKÆÏ¡âg*³\"fÙ=¾¨ö¥¤°Õùõ7İ¢¥|1XIŒè=é¦tóèd	Ô\0Ezä)Á\"9Ì¡zã¼HÇ›´kËé™RO€O35h?$…ÇâzÎDmÚµ\rb¥?ÍÍFv»Ä7Û^†‚tÉ[‘-‘ËU:¼qÚîëQë®æü‹,ˆÍi³«;<&ğÓ®êTî1œ¬I¡˜LBİß÷¶Ç¼4óÓw¤…6/Æ.Y¼¥;ÅsÓPæ.æÎºÜÎ°ÊAÖaöúRfŠQ§ë½q…=nÉT•÷ù†Nv\0iò&zwÇ¿‘²éoº;:Gö”æåû¢IVO4Ağ—öı}ú5ŸÖïkf‡öZÎp	²H¬Z.‘‰d\r óÌ?¼p3B/PKŠ«e	\"n«óhâÕV˜Ãr5–	”iúk= Ò—Ğ‹ƒêóaÀ|×nk]Ûfø4PàâİtüöíÛOŞ^vß^½½şÃüø—³·›ÃÃÑşı=æàŸÏáß?BÆÑN?§¿x»y|x8îÒŸ3ü÷ñéã1}üş>~gåş{v†IğçìXg2€ìßfoOa(¬J÷vM?QïíŒ~¢ÎŞÛ3úy†?—ô•ø>¡_Ÿ`â[ú	x\\ÑıØN¹ˆ5Å‘\0I¬Y£y8Vş2û„®ÕëJæî[\n Îô†káoœëÚ‹Ê{mI`õˆ¸C˜z|åÄª0Ì\r®v†õ²ƒ«Şøb´|Ôê«uûĞx)<ú}§Ó[‘gËîçO¯~÷\'¯WC>CC-ç0T/€ä@½\0Šü„^¤–³ş£ö—ıöñôß>úò·\'~çK”a<zûÈ%~Ú”~ûíäÓNçKÈ>şM|‹ø›*ı¶İÃ_ò¡Xmşû¦\\Ş¤Ì6ÉúvÉ{ñ@e£ä=¶¤H¶jğw»ÓÜRKw\nZ<†Ö‹¢ÅßA› }éÌ1ûYf¥ H`˜9)ÇHÜjCq^ĞÅ¾GoğÎ)¾Ü}Ğ‚Èìš]Öñş„Â´Uû–\r~£X€ÖzfI{!±@áPl…ñ\\ÙÅã£“»;G2}1v4¨…§ı„æîRä³°¿VÀM]²?gµÜ¿ã(4í‹É½KÖï\ZtÑ:q¯Ğ>Zü(ûÓúğã\0ĞäPKûûô\'ˆ¥‡Öíş=e¹^\\Fbí\'bîR±”¥ğr]PFßÃ/ï8xùZT%ÅëÄÒV!oqdWÌùxÿ!îEi@Œñ\\\\èÂQGĞ²¸V8ÈcÅFD«pRD©jzœÂ3„Â–ÙÖv!Ôw”“e‰ùÄÕğŸ÷ Mª*Æ\r•p9VuB˜ij&ÓiC˜1ÜÅ+;ï<^\'Ç\"uCN_ÆÃhÜ<USt8„1/(¶6eqcÃ^QgÄL”ûïÙIúÖh«ÃyN‡ùÛëÇcüçşùì¿??„¾ÀÄ/Jøç÷øùÊùÃÜÆàdùæùs¬	_|ƒ¾ù†?á\\àñáçà?Äô_üÿpéÃÏø}s’‰>O¥ÓöŞˆHå	Ë¡T™‹‹J^%/ÿêû\0³\nş­Åy}¶âø@\\ıŒ–SzÒACíä}íwb4ğş;E¤CÅÑ5÷%#âoŞa›»À6¡çÏ”Gÿ EÜ·\'c{HÆâéôÑëÀT–+Q¤8‡)e]ğÖ\'>‘SjS­Z\0¢Ejà»Š¢Á-}ŠïÃ°­³Õ%Ô³5ğFDÚvZÓr4Ya>ÀŞzYpğ<7CŒ–ÌRQÏ\0&÷Ñ#`¡‚l™[ŒÏU#G*¹ã0#‚Â½»ÃóõK˜G<º¾ÄP÷½[:Ó’×PÒÖ~ë[³êK\Z‘Ôã#5Ÿù0A!É©y«\Zœâ:ijå(òKâJQú\rÈ?;à<[\Z|„­ê‚ã|‘êP~-9bA®5ğö·G\\Â—›$¹øÄØOHõI@Ôsˆ®Óş`åa|”ú\rü/óååÙtş¡Ùÿv:ä\0ß\0}ÃUŒ-.hûÉ—VP~:?ßğ^qóĞÙI‹´ÎÈZBêİFëïÛqLä¼Çù€1Ş½ë.»W›Ó+Œ©*qOŒy<ü\Z_bHè5:\nCõP-„Æ_–åbXÎDÉæ—*‡\\ú°¶Ö+GÈï?]q±Y¯…Âv9<‘(È}½\'Ú¦ÎgT$ëäõœÓÍzÑÉYø²5‚Af9æÎ¸ÍÚÃ\'GÊH¢îó‚~…kx6õaP_Õ—TÓÊH—Fd-G4pÈ3Ä’¤˜åÓÒ”Úâ¡Ö‡Â‰ÖØóÎ‹+_shmˆÃƒ&ÏMÅÎ¬Ï‰wp38’¤mÚŞ~WÍLX?ŠWr»s&)Ö…H\0\"^zpšC[üûÑê’_š‰ˆüÅÍ8m%ÆhW`Í1½œ\0éŸ©ê<¼ÍÈUút¾*¿e/şBËOGçèIMÊ\0UŠ5¿áîPïèyÛ–)ŒÌ}›ò¡XŞÆİ{UÛ|{=)upèc{]¸ğÜô`’½»îêTuu;šŞ\\h=:ïkf|ªhĞÇuGÑå/n­´e·àFNcÒ²=Qcv:¢f°IÅY‡Äh¾xu¼Ö2m²ú˜xe²?&s¦ÃLcXÿ&|u3[_”H)×Ìü¯0ë¥·ïpº³ä¡æY©:=¶Ä2‡¹.gg×\0¹†¸ ŒÇfKˆçË«!GµU¯¸õI5Ñf^óYFËè*5rN£ñaç”Ñ´äÎ±¥ü¦[ 	{!\'5;r˜îc¤—”ìHMgÀå,Qf×’î|%Ë9dNa=|U×‹´bƒx÷[ ÂãáîNŠªËÊNÓy@çsX…¶X	†Tg@Gì‹=\"g…„c¦pª\rõ=Ùïô\nN±µ\0õíC’Bõ¯IT‹”µíJ;bÏ…R+sø¡N\"z—pq±{Äî\0¨Òk9Ùšæµ­Ãñ›‹è’/Õå|Á@á\r©¼´9£Çş&êÒÕU]Dp´ºêİÔ3b§GÎ\"ö†WÕ¬ºÚ\\½¸t‡I@‚›M0ŸÅí^ã¢¹GHZ)ô¡ôŠ\\„”NA2\0/—Qô¹;òù×~0Æ¿nyé¯æ›Ud°cá÷v­<^õ‹°€_KÌì¹]ÃâøÁs]N™@ĞpÈİI—\nèP{×y”pÃ«´Z‡¸R>¦a®ÖCYC€*åz×ÔÀÓ”I¹azÆµz×O o½kà5¡ ¢øšvC…n|¡*tC…¨G2Û|1ù³‡{YƒÃª¨Òß´» Ó\\¥ ¨d´œ›\Z¯óQka£iååq¸Åô	µ!dâ¶J™tŠŒÑ|ã™FiTëò×ä„2¼ôD2BœmN€êş_şÁA$JB¹røïuà¸Š\rÁ¸¹Â‹ßÈq \"[‘xÇ\\~ÏË°8¡ÛÔam!¯Ø”lÇ<¨\'9O´˜Ø¹QØ\Zÿ¡®RÙƒ¯ÑrrDç‰²:o<¯“\nİ©„^«yÌjû|¸ûÏ­±\0Yö˜`ºÆãXÿpõ­É¿UDZË®”0oE%Ït\ZªXî€æèğl|™åÇÇ)®ô$?¶|è	Åñõ‡²Í»àóZY=abòã\ZœˆÜö†ë´‡‘31\\sÌÆš„VÒÃ—s¨~ĞÄEŞ‡EÔó“¦‘Ò‰h›pû\r+¾ÇØmş1ºn?>ÌÛï{7İ	PœG;ùÑá¡ø¡læè¾ˆkŠğtt	µôğ&\r{’ÛéKs´Ü3‘+XÁ€­*2…”ĞÁ³R9ynŠH/¡÷Ó¯_¾yùçÃ—?|óò‡—oş&6I¨õÏÛr÷ÕÙ)\n›3î>Øplx¤>âåòÅh³.øø¸ÁĞÛĞ)øHÛVV±İr¢3\0äåD§/2¬Îgó%RŸm¬šƒG\'ë\r9kL5º­ls›Ôvş²Í}‹¨CÍE¼Pq°>÷t)‘£> İfÆŞÅ°v¿¨ó†#’Ø/¾‡7A¤JbĞW¿ãë@ÓĞøTK],é‰—hj\Zaxd±à¾§‘\Zğ3b¬Í	ñªÿgEfÑô›GvÃCÃ n•ƒ8[”ÃçGª‰ƒ•c\nI4 Sa­˜½vqÛÄ?Šec×õ9¹!ØTSH¨¸\Z&ÒÔ²éEwråŒÜİ½9DÁ£LÔ\'à4Œ´MÒÛesŒ8?P{/åEy½«\'\"àWI7àâ—œo Á:Ú¸ÔÍø¶©lÚ¶ÃcæÈvÿ#£îéõõ×\r»÷0/ûV§äw€_óÃo‡ëĞ4ï$å2øW÷£>ÕK°Qæ®ÇFpy¯\'kú­.¯›<(êÏß°t!¹Šbµ.0œU¹BıªÑ¢ù£0¾¦ÿVŞ ç\nd#E»G÷1’ 2í¡Ä°>s#!Ë¡R#æ&FÌæÕä¥Rª;š%œi¦\"¬ç_3$İ™‡¢ÒÎ­À4Åª\0İálßÄYg%“ÛWu›Ï0™™[M÷-91‰5@NÌ  \"ÎØeï¨\0ënü6a_Qè½¹w¶!ú„Tß9zšì“ÙwN`\'‡%ÅLÙ^¤öÀåî—hêúëµ•·©Ö5–Şuº¢“²½ÿŞîº2x¸½¿&ï6+\Z–ƒ{°%&;m<šUatàvŒS»Zoš–›r}äñŸ>ˆºoÁhš—šÖÊI-Íz»†Y«ŸÉ¼V>—G°ZFá¿}v‚ÖbâÜ\'P\n$âTcşˆg¦^Ê/FËÉb^‰?¸è1â2\n÷KãŒqÁBşÒû–»®yxzåz `­ıì²‚ß*s¦ƒjÆx,Ú€CŞèìI°vÓ–nÁíŸ®>@‚O§|\\ê´à8ŠPI\'O©ˆX6>Ùü‹ı1Ó§šÉ-¾¬Ò¡Ò\r+,@AÆ¨‘;ï½jõsu~±şšH¼#:¾˜%n—áûÜˆÕJ;\"…I!Ã©ä™2ôfy²ÌÿFúš|é¢…	\"jƒPÖG¾¾È·.­|²­D#G¯ú\Zœì„ºGòË‹Isöb>”Ë?W«ŠØÛZ†-g¼2AÌ9À$|U¨İñ]Ø#\nğ¥iÔ›0¹vK\\Àj–{&Bw&íéÀíjåšIQå‡yËWD®gÕùf‰Š\\ÏÈA:lõùì+v:ewFÄirN»cY6¨Rşä\'¯İñœ©ÌW`ø¢İvWàp,aJo3C„Fu\07$w…@	¾£(v%âÌxI|ş6	¼0}R>BŠ¤®r˜õÍ|ù3“ªN²K)BÛ¨\\\n.î®h<”\\-“‚‰w£¿ğP‚.0XãÍÜ¯€˜Å2\r‹êebõK[°æ%ÒÛĞI‘`ë­\ZJŒ®C1³¡Ô\r)Ó7$æIİ/şõ«@R×x’0õâg©oe4ìA&.;†	z¯c3¥M¹\'BI¶l=špİÃ(u·ƒÄ•(l&\r,rN˜ÈEAè(í)Ó\rÆvlrO:·¾vs)º.8·‰ÆFŞœFÒáx\"›ä¨xó‰OôÌ„–úÂÒíïó#y ğ1«»Sîí@ùšMRBè@bgŒ`ÑµI&æ\ZÅñnJQõ(jÌ-Œ³U‰/z©™ò×½p9ı¥ÏÁuaìhõ«JWn9úğØÑêıÏFjE¤È Q°ñÍìÖ6ËŠdrfzApŞÆÁ3ìtVÑ…“6ö´n$Ø…!Ñ4¤\"î9Z¢<d1eWo™I\Zù«´ špî¹µ¦§P¢¶SáÀ…p‹÷¬e\'±†éÒïs«ú[\r°M5&”)B5ñ“³§BÑ¯j\\îR…`óYÇ´¯Ñ\'úN\"uóì¦¨U	ËççÖ\"ú,1G“®ÜgÕ\\wï ’8g©™íÙµäÇæ¨}Kòc­²\"Üg\\_l¼7‡&…©Äv*¸6v»­·9Å;Mœ¢Aõ,Ø\r«Ÿk÷6C	õ@ ¨z@JÍ1—6ÃÍEpi)\rXYÚXgÍ£‡—Á…iGÁ¥œrajAå&•˜æû·Á¯På?ÓÅÈÚn{Ùr¸–L_9ÄOX)bÕB‚¨Ë¬J¯´N¤ø®œ9Á2%¯$m÷Ê˜VäKŠäûûõ†ôêŞ¹]}¨ğ-óE›°c6‹¬ßÈ_Ô™	 oÛXÏtË\'\"Á£V>â}\0Å¦×ÍËD-İÙ¦2Ê¿ïéL#¶{wW×£Ó¬ïŞ‹LÈø¦ç×Æ´ÔÁ‘)aè•‡‚ÍçFÂëÑúı1¿vé‹²ÏP\'ƒÊ9&áOŒ—†,¥3 v&ˆ-—m—Æ¯»ò§¦E…Úü´~¥ÍlZ…IÏŠ«\ZéEÁ9ÍİoMµéWïšÜ$¦åäîn¯V8Ñ?©ĞşÚñâãºîm¤»„$n5¶-tsçğ’çf\\Ú{“y•3†|Ÿ©ª4?ÑvİÉİ½˜/¯øµÍ>FÌ4u·7@Œ\'1MKUÂ[“¿íåoıvïwÿëíì¿ıtĞ¿İÃÿü?èœ!³~\0»oß¼m¿íœˆù¹ÏkÔ’şãíêÓ;øïwgÇĞXs/-‡Öå\0ÖÍfe¿Ìç—›…û^¡øRg§m¥`>¹çfJy‡òz<İLÊ—ÏWåÃË:‹Ie¼0%s:È\"ß£ƒıÅõz9Â;\'§Q¤w²ÔÇÒÑ5jäòâÙ|Tî‹|5_®ƒgÖ³\n±Ë&ÂÓÑ•Ò„È‡˜Š!é0Šd“$Ó\"iáM5)¼};Á“Ë÷r\'¹©%¤N\\ˆ1ÓÉ±‚$`¥t	ÔkÒ‚cß©5a“L¨I6tÄĞâÜõ¹Î#qîëX¤ë2‰­~6\Z_$XÚœ&5ºˆFÆD°r«àú¸šœ(m“h7\0±fKÁAĞÆÌÈİü¦âÇi´f„õïL^‡ªØG¯š …ğ0øÕT‹[¼«ôò\nn«dş(G‹St¨EûR}}Ü#gBÓs£Cñ8ïqvÌv1zOıîn½Í°ı·Y¿ª	ÿ…¶ßf$&›IŞf¢æFvÌ£=)ĞO[LQŞ\Z˜ÿz“Ä|ùÀ»Ëİ&°·Dÿ»wÅáàİ»\'k¯*øî}`¤AGn?~˜ıÄ½¾i¯ß½;q’2.sL‰\'do™Hç\'\\î2qÍ2•à£´2f.È¨>D jİ+p’ßròÿVkŠNŞ\\¢Ù©ó(\',KuÄÁIêb$G\'Ÿ«²œéo¢Ï€ôB Ú¿t»í}ø²Ød¢dç\n#µÎ’·î!uo{Säü½›÷*ZÙèBoëÆªëš¾(ã\0ÌÇÁÁºo8y«ªÛÍ:ïûSi¡$ÔpñÈHçC›CtÓé÷*có´%ğ¶gvûĞyåPá\r:ó’$Ù¦5Ğ²H€ªòë8(¢$8íĞ“É´8¬VÛ?Ópÿx´©&ÅñŸZ&k‘é^*K„íµkãJBÚê8\Z¶ÁuÓ^;™ŒájHbËN°«õª¦ºfj²ã)	ãT­½Ô½v.\\Â$ P¦—î”¯f@Zu²k±¬7’G†e9^…ça±€¢„<ÕÎCJàÜåY…dÊ¡\r«u.¦-Ô¼:Ó£	\'ÏÖ¯2\r;²cáÓ\ZfB†¥hƒ	P=tìÑh9B:n}ñR5Ü¢wwËiÆûâ½d¼çu\'…•ÈÂ´|FĞË6•G]´±iØCÑàóá-/‰v4Èn9Š„\0¦%„\'¥1GÌ µÆ^{N¶¡©||ä1aÄOhÑB3Måõùìhe„èæf:ÁÒrè1óè‘D=ƒ¢ÍÈbdç:Şïkì|»öÈï»//¡‹——OfğvŒ]ÛzÔâøE¤›¡Ú%ª—†®*ñÜõb¯“Æ™Ím|‡»Í°Ús\\¦ôd¨ÚCÅlâ¿è‹h—å”¿ªIjêHõ-)‡ªqdŸw_R[:‡æ×‘ ¹¢QMô’BÕh®@šaëe¤;y|b}°ˆ­GoWpgWl1Ï\Z°½hÛ$˜å´ãÃÇúäKåëè™Vùx|²İqş	fu>š”ş*¼êÚ×/ÉMŞŞ|.*qØ\'{ÔÔ\'§)şIdV4a°ëtD×ˆö\n6‰ÛÚÂP„[^ÎñE^Væ`æ}/d6Yü•ºU%th‰â|F¸/Jı¢›Ÿıë‹7Y óÎÅjøõ—WÉ1jÉ_)¤Œ8×rÃv¯ºõÉ\nvœdæÖ½c [M+æûê§‹Ò¿;píÇÙóòj4ûïA5–˜Âµê9Å\"Ê2Ö\0„ÊæÄN?/éf÷ø‹|´¹®¦Õ’pYn­Íh€£‚•ô­m4¢,PNG£´S9ò`PK`FzİŞS^Db¯ Í‹¢~bYM­Z¨m®ïª€bOÏº]Ñ<%ÖZ\nñúc:Ìíê=à»» ïÚú¾ŸŞ||_šM†bx•0/ÂlÙy4Â¬…s%Sn¡:ºyO°ùyp-#äh³ÓÜ´n»\\”³ZÛä¶2D÷Æ÷2|&øxšRµo³‘Ú°{“W‘[Á¯,²Ópû÷¾EßA¬tbŠEƒ÷«ì˜{G¼Ÿ˜1g´“˜m²3RÛ‚É×ık±{óÔ(šğË´ä/Œ£jÆÜœ•ê»Ä\"ø\nÕ]I|Êy§¾!}a6‘:Ú¡Ÿ.çV¥Z¿èk¶h¡Æ±Ñ]ÓªBê•aÉiº3G•ş=_VçòÓñmúMÓAöñôseÓ¿©tXìqÌù>\\•ÇZ¸\"V¯¶¦[S\\5F Ïe¤íN³ÖF0f´¢æ*]y1Q­›”DĞ‹¼YtBÖ§H+ÀºzFÿu¯õ§UÙZñë è˜¢é©¸sk(r·H›µ¸c‘äY‰<Ï”‹]vCİw^\'¯u¨KERáå>N\".ØÆ8¾‚ïˆº1ñÍP•,pïí–€±i‘(;Ï.F«.#s–ï9]Ÿ¯½Û\r\ZêR[ğMVRç3;ru6j‰§›j:!ÕP3Ü¥4¢İCÿz{o¿	MÄ\Z\Z¾¯/Q×BíÄdô\rl¿J¿C‚Nu1?vsS·B~c°€-Y>Ô\n!êœTÔß£ó¨7Qa·dõ–¢Çwc-À\r™“4Ë‹Iä6‡f6ëôĞœQÔêô‰—_æI%	u8\nYF³tIuÙ¶b‹ åé|\rWÑÂ G5Ô‘›ÕOñIÖŸ\ZBnGˆ\Zo–«ù² kÕt¢&ñ.hU:Yr ŠD$ŠˆJ\r<ù°ZÎö½cËˆ­ë”,ÈĞá¤¿	ÔR×Öô+îİ> Kb®otFC BÛ¾ÌÉ‘ñI§!º:M{`İC3İ¿eu³ìt¾¾È¶[£(JxF\r„&ÍœX¡æz¯H¯[ËŞó¦i—(¡*#ê„¾X¨âÑ¶Yş”ÕõÒ«gbçÔÍ#ÿvÁ|‹VØ²œ\n“×ó!~˜3¿˜o¦“oáôêÇÙ3ÖZsÛÔwVUYâtZœvmMê{²>nÑjK›2©¯¡sõû¦Á ˆÙhn‹EËİ4)7¾V7é\ZÕæË—k—Şª¾Éá­Q<*\n!°†>€î•	İ¯ˆxÖÕßôP•”vàj@\n®Ìj¥uRE/\r1Ôö[Òåù|ëÜ6‘;‹€L’ºåZ&Òù=â¼ÀiáØ9e„™RîG9°ÃÍx6Bµ¬¶¨¼e°Æ¢œmu¤jü|c†¢|¤âôıı=@¨ëë\n¦z‰´	÷hO¢ğ€ìJ%8eåWï†mMôóú xü¹ûrNÈèLûØj>ˆö%&[áÿLéÖOw¸¨Æ¦çÙ±~òiP*gk6b×Ù‘??\rËåRúXåò}*·\rx~yG+o”ƒ±Aæ©H®¼n%¾,Ó!WS]ç©>Mñ‹;3hØ1g~àYìšx7|2ËLl]m8Â1sP9ÊÒ\'¹~6?;Ër3I[×|óú:¾ˆzÁÍˆ$J3ÌÇ;ÎTk´üûÁEfÚª¯Gœ?Ú1ÀkgL/Œï6Ï0@Òä™zz¤×\0^âÂo¾Ñz½\\p™AVØòÅQ‘¶ü°\\j¤·[G‚B‰¡ÆÕvoq?×…âæ-¬Ğ¹\re·fç®#”u˜g1€9­àªW•wÅYmä\rË.b©?+Ğ[´iÛSÚ‘‰]ªJìq|A^ÖX¢–Z?>¼ğ|$÷Æë%j¥ßİá®˜û€›Ç¿ùí7ØŠNzÍƒ‰è¨“†5/1ï–Ú=Âi…Ó—+(0-Z«¯Nª^¤$¾W+Ä·™’X“H‚Š^¡WÃg*-l¾Gù°‘)İvN’‡¶¾‘}WÑ¨È-Ùs¸(¢\nÛÀëÈƒíd.°æ¦“òZ¨®•7)úPşI|°¤<xEUz1P¹‹Š„œ6s0ÔQáW6êA‡A”ß °³¢œÛÑLg”’çtWmäå{N€4dÖü»ùø’[\'>e¥,üØãXT%&$”‘ƒöåÄË\\£8jÊz\Z`¢£Hèe9|VÖŠáìG‘JÅ€¬ÆzXP9éÇ|‹r\\ôC¬#ÑVpÌ¸¼®3KS+Geşÿ	Mèİ9E¥â+îD<:[os…iÅM(;co˜@:W($€O>·¢öÔoÆFqK~+UÑ¥á®/yl*“õóĞÁÂ`«¨.Y“Ğ9¦ÆcP\n9%K(D¬d®BœÚhôíØqF½ËËH|gE‘4 cİŒG5ßV«õ¥Şnáù‹o¾úÓwoú/gg(½¹ÉúÓëo_¿ùêÍ‹şgù·_½şöÙ·_ığ¯/úóŸ~üî»—?ükÿ}‚Àµ/xÅÀğ=’rU\"í¨Vâ-X\Z7ò\"Í¯Å~®JQ”DÕŒO_“«êô[c\nw=½iI\Z|Œ9rqš¼ß»>îyÉÑ\n2+ìUP\n<-L7KûûŞ ^Ã|–Àÿæ‚P¯]ó¾¹ˆAØS7Ÿ¶0ú=û\ZÎq\n“ä‚òp¨”‡-àVÔ%\'GvXv\"/~^§Ç\0è|†/\'Œ•=“>`¨J²³êƒºû€¹e\\Ğè&PºvĞüñ!Ë3È;¦âns8°½£©(ï_¤İN>]RèÜ¢ åü¼åï|õ¡2ƒN{îWê\'‡ßúÈ.†[6mQ$qİŞe‚ÛŞr—‚*O‚=AI.¾—¯	èäX1®lîímóĞ-FÄ¢ĞNå?0Áìnû¿cvkTÔQbìS{EA7oòÅÚ…Q»6Í\n;ÈãmË;-Ni§PÖ3Xª`Iñ>57‹Ê IØÅìå>ÿâ%Që¸ÿ–U¹åé{Ğ¼Ù€×+òõ!-dXïPbP2Û›àèº§»Øœ‰¿tÜÖvm¹uÒcä>ÚV­İıÑyèHÖ@B¥¬Ë¢]îïGò İ/İKÔlowÆ}[¦vVÕ·ƒ„.ã–öÂ–ˆİÆ)´Y‘\'¿ÓìU\"v ,v?8€o)ükÍ¤¶fŸş%¢-bÜ\"††<))µ³9NgŒÈ1!ˆ¤Şá:0JÿÈ^g8 OX\rÿîïã¿\Zíó«e{Îãmöö8p±;¹3—‡•yû°V9É¦æZ±ÕÏcÃÉÅyGùcªşvÔÿÌ°â’3º; “é&\r/~ı}SÂ…µ¼½¥?…èÈ\';1\nXT@îì—t HÇë‹œsıNG-òùê²B3i?ÊUO‘§í¯oş­¼‰÷i¯OÜpÚçå‘1€&ébQÔß\0\\©xæë~=7Å2×æA$yáiC”åü§E |áç‰A„¥¤Øâ—””ÜâèğğPH˜&J ÉÉµÊúCyíf¯-i«a)U±T<Õyy0\'zã‰UºÉ5\ZĞÕ¼š¥T˜0Ã¯µ.¶ŒòÀÒ+r€*‚¢;P…à7c#·Óí†`¹³» FóhîÊ2¡,D`MBçO¡/ø”+êF\\¥3uYÍ—på/Xû“ä±@GK>Å.tn©#šææ=˜9LöŞ·&0*“™úï<ÇË™$Da#^±SûrÙsuèôŠ­|~÷\'M\\6MÒ°“»‰Z5)Ú¯¼“}Üğò9Ìb¤<oDÌÏÉÔôqÉ;œHÜ3C)b5ñôÜv( ÕdE‘@huŸÖXŒ:Ğ	—ŠÙ?”9;-/Fï+Tí-.–óÙº{:ZUc«Äeõ}Ïªs•eWSº´ı‡şèÔ¼â’y‘wtÈÜÂ?ÎfwidYQ?Ôg{«bñ!ä5²]`º`»¸øs†ú·…+Ô«G)¤%á¤v†ÚÔ´9ˆ¶Iq‡E2C ¿hñ?IĞ;ÚĞå—&.)”Å†A(%ÒŒQ\nl‚“Zé:Ä¬¼İø×±ñWv¢ÎËLìF•™Ç&kÑ™nÉV[b>!ß˜”_ûğÊ	 \'\rsw«H¾º\'À\0Eb(]ÀS:u° c½ı}² £”©áÙiçÕ6Rë‰÷;sæ¹ÍTÓ°QcTy“fK½gX+›Bâ£—]iƒÇ<E´n+Bò jÆb§³áA“ƒA…S®iNšˆ\rv¤+ÏXİù¬«ØQœŞ¾Tûa´‡ô|Â¾ô®d›fß%Ëã‹hêZ!·ıƒ3?>7?K¯.ª3z˜nÂ§…|lişt°NÔ9²‰¯=wã}@î)ûûOè`qãpÍÔÃ){ßGø—ê‡Í¬‡ù\0šĞ¸di|åçÑoƒ†6±eY¹T}¢HÍMC‚ÈfuoMÑ>öl¸ßÿTjá_h_q©†}ÊUí:Âx¾™’$\nHá•£««šõÊ=©ğO›*½ôy€ûòkT¥‘DtFÛÚXO®¶l£/³áét4»ÌúÃ”ô\0-Â4O“ÛÚb7í°\r÷†6\"Nİ<‹¦8X`IŒ–1µ|¦¤]>yÑ¿€3ŠªBX\n™\\GçL`2©ãoaŸÎGËÉë‹ùr=Ş¬¿ÍFç÷İáWR˜¬a\Z(“XE4ÇNĞ2{ˆÛNX¤€\r“¬¾Y;ª¦ÛÇÁã³rÿvZ­ûGù²:¿À¿›:8B\r¤#ŒK2]s©ìg½}›aúîËKÃÌG·™{Kéõ¦¡`xß¹ZóÕ­³5nûióTfh4™Ä0îh\r_˜­D¢¢5—@D«Ö©)cL Ï:ao­p°ó°7uKë6bàMò‰o¾©¤éa»³õSŠU$î¢‰JCfŒ$w¦<Ü˜¼\\¯¬ó¯ÎÏ—å9ğßŸ˜B\"˜¬ƒ¤N(†‹ùªB¨R’sıñCMÿ$eĞ³­Ó»9ˆzĞ»éş¬5h5œ…ÎÙÀ¼œgÖmdá…_àìĞ0÷UCd˜KAÖ4‘—U;ƒ6‹àëîÿ¥¹X„s‡¾ßıD­>bbkz%!§?Ï»Ÿ»ˆ¦KšØ°‘pF¸ÒcS/003~¾Š}Ö‡U¸Ğó?º0ÎK·~çNóÔÜ‚¢5ZZÊ8²\0Å’dİfIêÚ–wQD½7[\"ÙŠ\n\Z=¥]»îµˆÆ²SÍvP¢£¦Àîá¢Z‹3V÷İ—¼ôà¨~†¸íÑ`´23ëûû{ª¼.Ñ®˜æÇ>lÍ[mFØÒ‘bµÇÎÌtEK™‰V›gì~~ d\'õËÃÏZçş1Ğä¹Ó:¢n5¢Ú@Nøªh  5^XXA¼{\'Ì.&¢û.‘s×`ù0´¬OèØ5gL³mTıåñëà›ù|º®Ğ5±ı6Ø‰Ş?\Z]wa«»~oG|îCPU”Ú5ìîŸ¸zgp3~v1Z>CJ?b%ƒ \'Û7åÕj¨Ì“cç\r0È{FQ3ş¢Ø¯‚Jê~ª†Òa‡)‰ÏjœDü›é|\"TZ¼œiN×Õübè\0ûê¯”«ñLÉÃ$ËX(ui¯°N–Ç(Æsì:xì:2dic…Ï&¼\rÅ	MöWO4–ª,.F§ËjŒ¾»ºîøv+Ö É]\\éüA?œƒ_L‡ô¦È\'KÛÚÎ¾Ìr¨‚;Â¦1&¥²¿\'¹\rdvÈ4^ùùH1šB—I¼Ç½yõúÇzlØTİĞÒv¶ßñHUFxQNúù%¹Ò¢.?3!XÛfÕÂ€)wf6·§ËÍÇ—4±‚Ã~|ñòyç¶qŞÉ¼=jš7=Jaz\rø€9EQùä£ªÖ»\ZÎˆ±_w¼Z5`ˆÄ;£i_½0F\0\rPÛ\rYı½d¦óójöHJ=Êõİ°QÈm\n.D×ôÁw‡€wâÃöÈx¨ÉÈqƒ)ÂšÔÚ!ÜqÎEŒUA´cÏñqèÓß~úÅü À3à®¸@ifYMyù}5 	¯º\nVBğÒGÿ¾^\0\nKç%?!‹’{äÄŠZı¶MÜsLï‚¾ò`¶ï«ã„~‘$‚&y5<İ¬n8¶h`ñí¢CğÙ¨8qS?Ğä•üÜÑò`ÇÌƒß•_nÕÆ}Ûº›š¨}£Š<¶]D—~ïÍ“/OøoôÆˆÛ¿ªÉú¢È`éÿW–r- \rÏÑÓ¯“A:ªt…\"úâºjdb{¾åÆÛ\Z¾MìÂvG åÛÂ&ßNÈsmÕ‰>.Ê4®çpŒÃï@\rFÌæˆ«ßMIN±.¤m·»f³\r³ùi‹>\" ÎA³»5¯tÆ&uAâMEh´ƒSc\\êÜr¿ø~Şîœˆ´Vun´ÙßœEş¶Ïy¾†¬øu3ê.+üZ½%´§Îv»¿¨³Øéë.âzºé‹r1_Ö^h.ªó‹)ÊÙÊ‰?\\bu]w·5ÒT“gÜF—ïMŞÂeyc¡ği¨e³ƒˆn’—SLÌ~›aˆï¯ç:è‘S…ıÅ}C7ôIy†]Íªà’ÉàŞÕ¬*ÑGñ‘Ñì zUaÅXılk½1~‹Øßê²“]†£óQ5³Ô[P¢Yğ‰œ¯j¢¿Të–åÜ+ÿ‚ê\"ãÚÕW¤Âè»ÏÌeÜc<~éŠ1ˆsÅSBçš™‚¯ÙØEÙ¹=Ğ[<Õ¸(œ:Ë¼U“7ìáÑBÆ·¢Ÿ¾ıÓË¿>‡«	^›¾/g›ôµÈÊüø ©»Fò¹;üé™\n4èMhäf\0£ÙÍ.pÀU£\0GWahÅÅ¦ºîMdvzÌU5@#kÿ=Y„±š¹±ŒÀF.ìèè1;àïNPÄâ,ŸŸÖşµ(¿şÖ?´Rû™wRçöFÑ-ĞjŸ£(·#âœ2tÇGz¦¯jãN†‚XDBÕN®Å#gÜdİ •ú¹ÃP=#špz5+µL*¹Ä Üy\rûC“¿Ä4öˆaÚøGâ\'´¥…«¹01ó“nWF(sÍá\0\r´«í^Ñv2YòÄ,a #àâÄ¿€o¡À¼Ñ«Kg¹.m¬t¼.ña-Ì¥kÕ›İZ“§f9¥)Ë4cQ*[¼3½VW+8¢»;÷¾L¬VÖÖ‰l–?Ø%jfwÍÂYãÍ¿à6¥(š|Måc+ÎÎ½şº‹iË ¶)Jåƒ·Ölz™òF8Âd„9_Œ\\dNT€6¨íµ¬Fİòz1Â§	”<CqÑÆ˜V³Ëğjì»ˆÖä4b*t|xâÈŸ;.™¤¢q|çÔÛü00P~À©<)7Fóû*@[¬)1®Ûò,gow(c.¢wPA“¯Â;LèûU\0Ÿ&î™	Úé^õ®ÙSïê¦AËæ“Şs ©ÚÌ|t´;y˜ò74±y†TôA÷C·tM~½WPÜÃˆºê0ÉÎO@[’ìÌWÔtìöçªüp‚îº¼Z±ÕÑ¡ÅD9ı¡	Óõ2Œ¯	ø\nàğÓ2%t\Zù$èğY‰ ;Í§ƒ>N†Q¤ª]d@ºïq¶foèÑ°™º“!<	ˆ¹Û5·2¯IÖbæ}ŞV0ñılF7ÑaèEÕ–Sı¤ŞC–+ú¢ç‡°ÿ¹ònkM´§Ü#ªıª$ãô`\ZˆŒ[–<5Ÿ8•]¯‡ãZ‘Ée/LÒÙ¤3èìw<ní)Mƒ‹ò„ıûtêg9C®wàµ›]§!)N-C¾ıñtFAd¹k¥Ş%B`Ù 	© \"ÊO} câš¦XßK¼!\'„ÏpËBş~h\\]CÆó™£\0ğ»À>¾Å ‘½›ô~øÏƒ{÷„ã>º!$CİUa|©ãÔ¨4¶xØ¹ÎI‚ØL+&6şN¢9yØ€İĞËõÒ„»;ÉJí˜¸….–å15ã)–É˜»è‘Úğ(;!­¬³b	Ğ\n˜	’ˆ«Àš.|ıã²§H¦ ÿyµÎ—åM–ŠHJ|/\Z?[ëLhÔbı6Ü­á¶X¢–d9±2œšÊwüp•4Ï­”.ú•Rr½s¥š×KAEÚ~w¶şĞ»]N³ßfÄwğ¦Âöz~O‰NÆ9}}	|lŸ×3^e(ÂXë‡»ÌşH‡[6í½~ß¿lZ2\\6MM-›æİ{½KJVl~€q‹šüIßDÜ‹Jy­!ãğ\'Šë¥hhyÿŠÍëñ‰ò“ì\0‹dŸtú-\n¶:%idëÃhÕšÍ×Æé;Ôë¡ûà\"Ç˜LKòÓÂ4˜ˆùâ¦&eş¯«\"{»y|xø5©ä–3Ü·Àb,H†½ˆ3Ê;‰t„½âû%f‘(\0_­Y\n{®‡4) ¸¢E\"ÅP¹p…Ëg	Í¡õ]ß}ëQe<õ3[à÷xb9àGœœıxÖ†	êE÷(Ròc§Fb=W?Œ‡Õ8PSöV‡à¦U{G¥âá3*Êz)™{™¶É¨r¡ûûUµW‡XPÜ+îøÀ+PõàˆƒnQ¥<Sz×Ë¥(½Ô4ÇèLœVzd§x8Yğ‰Î´ò—ú£éË:‰ƒàË\ZÉŞNq5^~j:Û¢\'c]4YÎ|:‡m˜‡‚\rÒ¯_a:&ºó9Ğ¯È8õ¬å†°Òa_åşJÀäÖúCÖ§¿/äïkùû—Ø¥ Ğ‚Ñ\' èŠ­O~ø¤tv‰ZŸ¼€r´Zãï×ğ{5ßPFva4×OşiĞÖ´„´µÚ,ğí™)†ú\rt\Z´ÕÌ8â¬=L’[4\Zx—\nfÛüøş²PJç0\0dyìÚvN:5cW=Û`›û±È³+¿q^®IÊTĞúd‹k¢h²˜ê8œÔKõ\r\0Tn/².jbåû|õ‘†A\"º\Z-×î	†Œ0Nnç+-ÌTG-®åQ5®ÄĞ°(6Ÿ¯ÊæˆÎ½NIµúqö\Zˆ Ğo¨Çe€yÀZ~P/¯0´H9ùqYÁ\\Ğ	åK>¢ñ-—CQ¿şğ¦qî‡æ$2ÀÜ3‘:ùÀ\0	y“ÏœÕ3ıRNõíş¦·õ´ ÷/Ñ9LïºÛnÏàßIïºóèq\'?:„ÃÉ¸éÎz7”lœ‹¾ˆ¡@ıT]~ÓE!–7P^t_ ™›ƒ/b8©ÁA(_|LœC†@ì;ÍñÊ“{3ëhÑ9\\yÙ4EŸ‡BQÉ!‰äèzx] ;ï÷½k—r)7r#—¹%Ğˆ•ñÀ\0\r?£DE¯•vÇÒxF?‘ªîV¥MN/$û¸:aå4üê]?îÜİÉ×\r|İ¸¯ë§ÔaŸKßŞÏ…èÖD~9¶ßÿæòæ	4ì<Æ¼Î¼Ë7ÙĞWWàE½@4Ã°}ë0xQ\\‘¿H[e+>\'ê£5nu”\ZŞî¤1Ø3Ü(x&\\ó[}\'OdÌvfsº¯69¡—¥¿imvŸÊw>{ˆcùnvÀ$Y=²ÆOşî^îÌOŒ}hg‡:91o5•Íğì£ã$8Õ±*Aåh°ø@\0T©Û½G÷WF¾\nîOÉk=çÃ1>ÿŞ >§R–)iGêL¸Zµ2d_â\'†—«7óÍøBøõ&›}D_f°m7:–=¢§bc¬\Zäğ¸¨cpwwôø?iõïî`›ğ7”Œ‰qD‰A$uFBµ¬»C_Â™46—ŒV¹X,â\'GöşÀîãùº„íqâ\\~BÈçKŒ…aî¶NN&ö,Tı tT¶ É¹\"9èÅP@DX/k×C*^/¹:¹@âzsÖß>?¥Ú	éhÿ¸Ğî_ä—Äş]NÌ­wmQÉÅ›B`?îî¸‡\'Ê®q.FJ.?8/%èµàMyµ˜>™€¿½Ü,r«\0½–B4mßJ	RÌuî÷:F‹±JÀûûHõ h6š0V‘ñ±h\r‘I°wæÿnXØù\nÑ,íÎea\"°f¿&BRÍ%|¯+ì¹ÏP¯¤†¦ıÔ>Yİ\'«…“\0ö¼L\0ç€ŞG×·Ì4%ó«[WJàë7QıèÜzØjĞ¯×)Ø/Ç*¥ÙQ7Š+Vöõğ&e#¶«Ò—Èı\"®|AEÃÎ „†š÷U9’<™2ˆ{ëU\\Õá6×šê}e»úªœÊQ¡âpÈ’³[€ÆĞŒ0b›qÎí;*jU×¨Ãl¾%wB6Ä¤<–HÅéC²DÁ7LdÄ?	\rDğçg¨µPÀädá¦Ä©•X¨D¹5J2kâŒ“‹ñ­>X¸yz2/9¦G6£7-Iq²Uà‰ò½Î‘b1§Ó|àL\r &3tqZ‰€ÛñïPt†¥™øa3¤æÒ—Í&udz•£&<ò\rù$Ã—%.0ØR;øÙ2¿‰‡N]±ğX>àŸd¨C)ÆÑƒ¡\"Ê#\nŒ=âø7\'x&{ûhê6@4”*Q˜fBÒÅ;_P]Ël‰ÜT±!üÂr¶¦Õö~şkmuórok»È´2o–¿MHfÊ4áÖƒ¬ï~n•OôPM&¾ÅzzŸK\Z¹¨||µıß\r/ªõJÍ>}€{Õu$Ñb‰Ã×H¨&ÿ¡W¦84³¨ËÍÑè\'¶£Ä\'³³ˆ;ÒK‡Fú\'ô”åäêœ‰};·¦×ÇT¶šˆÀ66è•¸2±I¯kÁ5ÀÑÌ×5b&0n†,R(M‹Y	¿Gà{—ØÌş~PØ\\i>1vg;Gtq#º¸ˆFtqaG¤ğÕñéa.Ãº¸8Ñ°\"EáÓîå–ÖQÏ›ü=5è;¼Á*{…Ox	NP¥yÔï1ß°¦êŞ†•ª˜g|/‰ï5Úâ‚{Å{ÑÚrIÚB4r€Ö/Q8:ég˜ö5‘\'ı%hí,ŸCŠr<œ[\'<ƒ`TÁ7.H‚ã%³£Å“xg!ššå³à¹3ã\'ÊZÊSÒ{(ğ¾©\0væúèıoÎd(ú yµ ¤ ÷<Á|EßˆP9‡ÄVY™)‘fRQĞ¦‚\"[ˆW_Qèı]r\\÷±®}\\©“–lRÛË;ç\ZGÃ’SÒÌV\ZoÉU9¬DÊF-œtü/\'Ÿ8ÜTtöJ\\bã{Œ¹[QÙL”É\'†ÇÒ–şxâõD¸Ï¨HÍ¼\n]]˜ßz@gxrğ¹J€çÒ‡ÏOîîäçáIîÆwÒ±Ã®3/Òr^kB‡²3·¤èÛ1Œb?Ù)Ğ×v6ËJäÕD?Ÿxÿ¨’ô™OÂİ¥É€jW£sd/4é÷\'¤DÓ\'^‹ûİç?ìfUŠ}q’¯\0âÚ%áL!Ïæ On;»DèÛfVı}ãS>Ã1’cBQ³??ÙrPS]ëX¯,ŒÜÈúF±9€×mjYÕ¥Vv€Û„Šìóò}5.ƒ7â	%É+1¹n\röøb^ÍÖıy|HÑ—ãtï%ßC\"7\"òÄbA8sYGÓñfjüi77d§„[¨§8šf,ğÜ-özOIôV3kQy¸çÄııà³7z?ª¦ôŞJ»ÉÖ„Æ{×Å÷£õEïª:İ»ÎƒlõN€ÍÙ¤\\]®ç‹Œ®ƒ½ë\'Ez\ZÑWàœLN-¨ğù}îâp)S’ ™ğ†&µ˜ø9(‹àİ7qGBY•ïrc¹kIZï¤´ú}-€©&)÷ÔÓ™25iwMWc/®‘°.òBoi60ä“Y¤·½çªIÌ.xÅóÍŠäCSIĞíºÂ;sîæT2t\nÄozj{–QË\'Äü:E»û5;Ù‘¦I^‚ZrÂÈq=??ŸÂÄâ*ÕlÕ\r_çÖ	Ò]x•ô“Ã\Z_\0ÔE¶7\'<‘+|²­8Fİ:~(ˆ«vkRìÉĞ8}İ£èöu,$Iåe\'§(ˆ^k¨‘m“GcV/|pÿ·Q4I™@=ŠèûîÎÍgmeÈ@öt~İ­×£ñ)ä4øğĞ¢Şm.*+Y\'º×Æ¥®ºôD‡Ç\"ôV€ÉÙ!wÈ€e¿Ã¶¿_?ÀÁqÊ¼¬ÁqÚJ©!GÓÔQ“3xQ¹¨&îÂR¸èı—@¯¿ô0e{¥n¥Ù†\n4zLïJøó¤Ğ¬ºƒ1~¯JtŒ\r[ã|Œ¢Ã}¡Ö5v&sÌìá£8â!Vë¡ôo:d¬‰Û!p¸\ZWã\0)xl4,½]èË4&…é8c¶øÉé‚JgÁI7É­ÀÕùƒ!e¬ëK>µ‡¸6+MCîuXNK\\cLC	Ši™-Ü °l.|«ŒSr«YÇí%q¥P(l¹Eé­«Ñ\r)º–pÁAßz¬áğ¾lÍÏZ£ñz3š¶üFìeƒ ¯M_£‹åá^`{ÌJÍ49@¤ØâBFÍ2è¸0œ™àYÏªpş¨%•ârpöûê<ìîÜj‰\0£¯p€9JÒ4¢Ur±·Syp8_{€×ÄpYËçv.;şVøRÉ‰Èâ®)¶öÍQ›¼Ÿı6ÛÆJâP¨)NÉJºîëƒ!t©<#kY«©[»Ä{ú+ãıU8iÅvúÀµû\npõ¢\\êrêDÇÛ0¤¢ÀEÓ“Í@p5v©÷Œíˆƒó‘#¡^Ü;İ‡Û¬^ÃE-4Ivœw××ˆoÿì@ÉU†>;`Ï6Y/;°ä¢ lÏ¹ĞŞÚÎ~ûæûïîße\\å	~ˆ¹mÿä>äõ­¥øòH©>ÚÁ^¾\05¿­.Y5y¡ÉhyÙ½‚¤ıy¶¡Ç&$Iš ÕµX¦c‡¢«ö:øá\nÓ›Œ\"äœ£ÁB¹ÜS>±\\~ùÉ!h«å¸SÄ¸p™\nòsÅ¿•7Ï¡ëÊ÷¸î…ÊùÍ.Pï9ğ`¾‰lX‡Ûkt®:£5Ë_ÑEëß¾V	H¡ÕÈ“gGâl÷£cO´¢ïhÌƒ!Qq…¤—(kãÖ&EóšX3ÔĞ‹p]4„~É¦Ü\nùrÏ“{~|ğÒÑğÛå4W®zšC<ìA9í™ïN«6¹X%“êã•X–ş!>U’{bg˜”4Û²×—Î)§‰ç‰½Ëmaš-RŸ&sa‹ÄtH\r\"!İb}æqÔ&+ÀZ¤Ó®Wü…Jæ*s–~œ(ñlÔ=/GKHì®ÕÏ†{†å\"zCŞ‹NÈ¨’˜Ì£1>ÙèZˆ[ĞYéı‹.àpÌB#úZGı†~ó×Z½o–¬¨Ä™ˆfßJãıãÃü°÷Ç“mÇÁ`âHq2~U›ín×T©Ï}¸½k½gRã\'FØğÕâĞ¶Ág-Æ»ÇIçÂ4] DQĞÚFrZ¬ÑªV­QkgÓ´\\Ïg¸–õQñ2ƒG‘‰Û‹àKK\0Õ§c•\0×Q¯¬u¤ûeçúhRM8’+×Â›áË€8	˜/Ëµ~Øæ5j‹“€xÓ@G¾#—“ŞgæìëèDÉÉÉ\0ST÷¡AÔêş\\K¸¦}½ÂgÍ:YÉ…Ê=ø%ÜNÔ>-Ï«YGC$n\nó®\n[ÿ§+Føsÿûşê˜ù\0½å˜u#Yf©uZ²Nl?™6Émı/ïí›‡öi3‹{UïÏ¹\"oóäR6YBãÊ¤±kwG e­;¿úŒº&b´Ğ¾q.‹ËÓ×”Ğv{\\ÕÏ¹ ÏìÆZ…Ö¸ßëµ¾/W+ Û;*^q‰DİÀQr¢¦z[ê©÷)õiÜM«R%ïSìÁ«¥s¿¤%£p‘ï°†¶ä¡”êD™Ñùz÷`üä¦î•Ì¬1óICÉÁã‹œZ“Ie?Ë%ióS«›g9]³O	´³•œñµªŸ\"Z…ÜiÛ+B};!“oÚL¯‰º0‘ÏNxYhXõş¯»M\rúŠÉQ|À·é6ğW¨OÜÏâvì,mİœ7(sKÓñïğ«¯;Ôé|ä~=êhkéb!ä‘Ò\\°Ğèd\'¤ùÀíÊ„äŠ=b¿ª9b÷dzØ·…>:Š¬åñ„]1Œg ‚ÈËÁÛZsÜØæëê¬b/«ÑR™\nÿ;Z—Æç£çzœò¨°6ï«UE±~Å{\\ÑW©fO„ÙíaRøægÅŸn´8;\\WkÚ4Ä«¤ü$‘šñãÄ|TäÏÎ”M/ ôU×S>Yf/ö¯(ÍÁÜ0¼1H<SA1åÖWVÛìŞı}*4Id¾˜±îhG}mØ	Q5<åAßV–s‘&)\']¾w…’Ó|	uÁ[8ÅX¤OTò†¥ŸõÄß†—2øK¦ñ÷£nÏ¤ê¸µRÿ%¯Èo;ıîÏÉõYî]¡t¬?ğ“ÖÔEâDèwg—‘ZÃÂy]²äÂó’’ĞbÇ’†]ğBº#¨œıo4ÛâI $ÚèNÑÔ©û[úEM-øqÚ£)‡ş0›Ì»Œbu´+(§æ\ríFïE?µ>}ôo½â×sÛ.b£;÷àwAš¿ÈÿT­R=Ì½CyáóËœfÕçS‰˜?ª)\\¸à’6›¸ÃFÑº°™	œÓ‰¡7VS\"¹aE]@¸Ÿ8‡ĞQî Jk|¼•ùÑ½x×K¸õ÷\\/Klg¶ÇuHšöÿeìM¢„]¾&fÁa%ïkqú¶yòæc6*ø.ê]¿c…çd5ÒŒ™fŸ¸ª%(z˜„«jµB¬)Šì|9ÂĞ±1óÑ9Ë÷{à5ôÔ¤SºìŸÄşaíŒì8\rw0~GĞ‰ Jè0‚Î*¯@ÉgÇû|Å	Éö›¯c²ÍÆ:¹6•oQ³(hÆ~Õü ÑĞ¸lWU~äYÉú˜¢yy(£!VËºVFD-îl®(ì’×?vŞT×µˆ«ÔM5š§šÙx¶éM7>~\nÕ„\'jÌ3\"\"ûpŒ$;7ñej‘’gÎúØGR“k®Éƒù¼ÄĞÊ“’…úìA”PX¾šƒ”Ô ÆUHË¬óœ]}µ.nY#èªZ_ˆ¹!C©x¤ÍëT•\0¨Äë/¹»]6ØêÜê^ªs/Q×ó µNBëO®Ÿ]Ş\rM¼à²5dA±³ĞÅ´9IâÜàëÍĞ6èÄsµ=§­²L¡+÷¹8°rÊ.J§°DbE	{EnDGBëË3şˆ£`-9>QQ-e¡>Byıûj²Me9zD´´ší”7¤ÁZ<g£†ÅÜ~o9ö’GwòS­MÛÑxÈôOŞÛ¿8´±_ÂoÄ¥­ğôÉ½ôÍgrµ9¿x?@BÃ ~J_vçŠ6Šp¢³D§wwÁ–¾¿¡íÖ>¸ã-ËÕ¶…<úéW¤	3ºÔ±(-ıi\ZËfò¶áYô³{\"57AÕÅhVN»ÌåJı[QÿĞ®›I°>˜›¥*¬§é&HoC^tòE‚«¶DMô¹‹eu5ZŞ0ùøéÛ—Ï©İ|!¾õäãÓéÓ“[ŒOæK²\\;|2];zÿ–yG\'H]ÑPºÎş~Š¨©¦µ\'zÅ½˜ı„z>¼\"“¼E,Gk=oqı>r—á\ZkÑMË¥\n^6ñzCP:9™Rx\'øˆ‘‹àÁ	\\.F}^n\'Õh:?ïs^z˜ıæ&·•µíĞ¡“Î¡P\'U\nşP²(*ª„à]hÀõmˆÃ˜Æuìs[m÷ı}‹±‚ª]f€\ZN¡ùt2ôdxçô ñg¢è:¨‚DWH:[öj+üæá…åµ©¸|pV»Bö´&T¨­Ÿ H-½ç4yQÊ˜ªÁˆà=õ40ÛíCUw=,Ô8\"[Í7³I(oì™\Z†¨¿Æ’h@=3Ü°Œ#av7ˆ¾é—y1Q»ÄÄ±ÍÓŞ¹å¿Æf°Ù\nRë^îô»|¬bmDÎ˜Ñ…AõÔ´Nü*“&Gq‹¾.Î—8‘¤ÍØÏ6Ëi;;ˆêd€å­#	hï¼AfŠâ -Gk­¶§ì¶“Ø©3X@_Úè}6ëxõÊ®²Vv¢Vªh~Wwêí<}Ö”e¤]6Ü:Ÿu¥\Z1‘•k©fl!;¤so}\\	_Ÿ¸±“Î Wğ0T¾Å™±së•Å¡‹(ƒÎ—kç?aO|ãìÔĞYßßfï6W‹¬”C³XeıÇy¶XÎßeıÏr6¢îÃèó¬ÿE­n®N³şïæá^ûåº„ÿ>şGº`\'Î\rŠ[ÁãĞ>şäîî_şå_Ä{@¢ôûTiò!Àt˜+ywúìrêàWö#0šwj£²ºø´8\"A÷Ú¨;u•…`¢#¼ äÀ´­n|ÒÁï¿ËjQ´Û”‚·QGœqù§GÎİ]»mzø4pâ–şŒE¾sËh`EqUÅ~ş¶‘ÿ¦{ÜHYjñkºú~t]]m®8÷ rPs—¨W¡°<øFÇPô”¹ÏÏ/ìäˆs²ñ@ÊF/{æÏ² t‘ºF7¯jzá™VcÚ`GÇáß:¡‘ƒUJi\Z…õt™|/¡üo9_¹Ÿ_Ê,/`nëcüWDK¹Œ£N¿è\"”I¯9*9ûEè»JqØ\rÇ95¶‚E9œ†Vò›XS\nı^j­—„ı7y¸Qüô)™šcuç~2ew\'Ë‡[•MÌØë—€^¼Ï‘Êğhˆûá*$VÈã~³tÁuÃÌ^°¸¿Qşn\0w «Hì\\±IQa`²óéüt4U6ÒÅi£ø*)5vâhÔôKê\\B¡­ß_5á\Z*í§;W—ğ§…6ÔíØÕ7OÅu‘9Ò£W§—­{ÛZ-Ê1B=0Qu)˜†%¤¢Œ\Z‚@c8[¢W³¡iÕ‘|ËN¥½¾¦eg|ú+Íú\"1«îÄö?ÑHğ’á‚!ÜR¥¾¯¿í°bæ)²¥½5ØÀ¶ºÉ(2 Õc{™ÿñ—ĞE WCg/!NDœk×_I)F\\[ÅU(|}üñ‹“ è­%ÚôpßuV™[·àE6Š,òÈõ1ø;IŸ»\nÓk—A¥ —üäc:í—	²%5±ÇÔ›UGóêd\0$\'svoaB‹¢J2µöRÒBÌ¶Ğ©$MĞ6èt¼q1u—µ\\}”%úô\Z\\ƒ\nAŸ¶êÈS+Pœ7\'±^@Pn©º\rRp+£VµÖº BÅÅ	:{NP‹Õâ‰¾ïî¼]¾\0N2MÔ“ìtsŠPB“´€=%Èh³İ)#“3]è²÷I`øŒëCúx·Ì;Û¶4K¯ğòfã†€q¦tÓ`Hóé—t¬ôéB„,#J”yî\r“IP‘›ÌmÂÔÂ3tY´F¸êŒso\0TŠº\0å~å©ŒËÇ‡_úÉ—Îú±\'S)\rlf¨IÄ|’ŒˆSQĞÔ³€ûËruÁòb‰ÛUï¸¢Eîæš¬\Zßå]ÂbM‹R§è±ğÂGJ·HIklÅÉ‡:Û²2ì·{İ!É,Ï­Hó÷ µªF$Öxû†ãm=›æ±é}eàøÖ}»ãï`Ñc1µÙ‚´wö÷ë|$M€†Xf¨#X1Ù7Œ~O¨”Å$v*7´pR‹€ÍÔƒáÀZŞG×Ñ5†øŸÿ‘ëyìE’gófŠ6½Š¸œ +¬d%Ò4cgËùÕkz2\rMjİCÂ}óŠ‹\'\'#_şıË@ã%faqQ{0.Gº#µ4«áJÛ Lø®ÜĞ6ñ»Wä!D™$÷FK^4ƒ*Aİ+b9	İêU«—¬^Dı\\9í\rpÁ^êÍw˜(IİÎ-Ó	·¹™€\r®šmŠ—-²í³6³şñ™LEß•$Gu[ï\'°áşãRkUé9s$gí¨©“£Ì‹dg4õ#U.İ/= ¶ñØåhÇİ­†ìæÇİ·vÒ`´ÂµËA·µĞˆmï«`›54\"“xÔ£n’‘F‡³lĞôv7Ãz¶5Êfí´]¾‘œ¤ƒŞí÷÷_9^ÆW™u›V¿Â¦NİAUóÍjz3làCcsı°_×à!ÄÏwbëùÇÃğJhd,¥Á–d;8ƒEïÆ=I9ú\"JTÏ«÷È°±@ÙÒ  »îX$Œ~ãZƒìZ¦t¯w}°÷®;6FG;À÷­Îí?ZO-òûÁv¡QØü<Ø…p‡n¥B·Ô>½Oó$ÔA°†_=CHÍê=¸=qÃ7—Ø8õËÔ€/oº¢„\Z»¿û–³{ÍÒ,:Şl³,k’Ñu7•Õ‡jJ©Ş¨bÁï‹£´#¸À³}ŒQİk\Zû¹£,vªmÿä~.Rûù‡•ºÅêÜbDÙN¢‡Ä9y&ÑÃ?+}EŸ,”Bç*qgÕ¦õÅù‚ó¬bj]ãÖ¶ÙaèÖ1#ñ%“yİv‡u¥¹D-Õ¦Ø®Ô<°…Á^I_¦IGÓĞ1Òpe„Îüºh/`.qÏRÒ\r%İ`ÒMÇáP9\\Âc³*’nÓäúÓÉuç =¹ùtrÓyZ´m¡OíGã¥rO®®ó*¨ªwè{[°4±ÖdÑ¥ÎR³®@ä„Ê.½/¦ò’ÔÛ§6yY¤¶áB¥kºYÔV4½ ˆÿvLé)µ“šœôN°,v\\ëV„æ—pæ)áÌ—ê>‡eâ8Œ.4ävtº²&î›‡ıÅa¾8ê/r¶ï~å¡Ï¶æÁvùÖÒºÎí,ÆÚÏİÙè}“›I<2‚[¥¨ä‰™M¨îŠbUe·±;Gª¾½¿G÷cÈU\ràr’Š^|Éu1I4V\'ª`şSô1Ğ:¸h+EÛV*d	)«‡µçì’aæbu!\rüEl!‘ûŠè”ZQ¤Ä¡Ë~•\n£(a•pÑlèO²4ä¢8[N”Œü0W«áh=<¯×ó«¢ÔëİD½{Z]Pªˆ´0<£]éØcRy.›Êf¾b5;›k(ëHãDà†Ë­uX‹ÿ–Ëô¥(b@®½í3=3Y0‘İ£/!qPª\Zâ3ø}Ou7î§{å…¯«38ÀA§¥´fÒí–ûEJõ6Y[zRD“ï,ØRİ­š·LpÛ±ÍíÑ…¢ö\0Êy¢¹„OåAªáØ¥ùL‘]0[Ä•Âûû¥¤3 °Œ…]¸	ò£C<d’¬&ZË¸iî4ğü°*£ÕEàZº^mál¦˜\"FŒDè”¦Tó¢ŠšA.&¸gm ^‘Tmtn3ÏaâYwc9\Z_~4÷e®·Írºu~KÛÆ¡LÊ¡ÃæĞ ÔêçS•œPG‹ã[ñÚç3b1Â7O\0ÓÏÈo{&~…j-¾Õô®s*¶#ÿªš‘ÇøşÑ6wÑ M[ìâÒ5£ÂPİÔ‘å´Õ`ÃD|g*;‰Y]-6p$¼FİMgİó•0¢qSÿ]q3‚Ïñã5†\Zïw¶\'w³¾ûeN³Íº”Q\0¿k·´=^8,#azé\ZH¿8Šä%ÀË\'´šJü.‘öQ¹‚Ò/é¹u’z:+\"T1,àrôû\0ùì¶«HC¿»;b+WãI™Øú ­k€v>\r\"Gøğ‘ĞA«àiÕm\'W®‡¨)‚?¬Â{Ìi‡NŠ÷4¾c\"FLr}ù>n\'ª&ˆnhá\rŒş‘×˜-Ò–Ÿr¼PYFuƒPöçrílĞó¶L,§ÓÑ#Ä8J)	É)˜Tgg(AÇÈhİ³jZ®—e)>Úëóâï`£iAêÊriXLÚ}MóUhk5Ì\\ÅZÙ#È\\?_=\ZMŞmVëGì½iŒS½@»µYJ3ãÀhı¶Kùò¨Ø1:µˆífDR¦h—r$†Æèº}˜3p¤è¦æ¥8ÖNGğÙ‚ulnvV]£!¸Í&ô0H$\\:Lß!•UPàDrşîüL$ñé¾p‰»_Rõ‹…eÉ±e»€5U`Sz^»\0¨ê=^¬Õ¼qr˜ \'ş8¿@Sˆcu¢~#f	›]Nªõğ\n£Åf|.óÉ>\"\0l°µöqÅÁà&®(ª6ò®¶p¹¡óNm€ãL»^Àêº£%Æ$ìÂ¶ÊRï®.®®Ì\"â¬x÷zÇ1]º/~ìm¦yR„-Îš`ŞE‰×yã)&Æ?Ì£$Ón‡uJ	¯:Jï=\\d»õsMauı\\à?7¿öÄ8WÎ¿t^\\°Í°åÀvXöAS£èKnx$Ñ;4‹¯<NÅ˜†=Ş«O¡ehvÄ$êi,\r nÅãßÃß3`Ò¥{/¾«ñ¢›\nÂnı6Ã@ĞgóG2xÁò›Ö`€ÔK25ŸæW¹¨Ù\0ù\n’ş´®¦+¯S0GJ\\hˆUö=c—waåsSùg,Òv3ÕÜŠ/˜Xá²¦Â•%®ÔnÃ ` ^J‡@Ş—Ãõ|8­fåª=¾@iM>!4ò¡@^Ğ?éîÃqıµHs‹âÊràÛ1ª)dOaæÃx#X×Fa¸ÇÕÉñá‰Ö€ºğWÀÒG+#o¸P¬_ğ/ëæ¬÷n^Í´7©äƒq0^>oxæØ={N‹/z™êcb÷2¹5–…}ø¢ow¡>É¹bÖx{:ŸN²¾Å¸ìÓOIpvwÇ^;Ã-6)£¬Àz\0TëÑ´\ZG =² ¸ˆ™1”åeä£jP-2#öè?.ÖëÅêËş£ª·FÆ\r‘Cõ2¤ÅããV†kuµîZ{ÃÊZ\'\'cj¥sjåO?‡}ÂJmê2i}hİ°Ÿ8„._Ãÿ§ïÕ|6‡ş¸ô÷Ÿ‰!¯ÖİÍ4ë	sL¸(d™øÒŒÎ—Y«õÛVÖ‡?]@RÄ™{‰:ƒÊ¹-T¿Ä8_¶Ïí¶8á%Ÿ/3€ûv†H} Õå3ê÷¢¾ìÌ»»v\\9\Z_´Ú¿Ã~¶F«ÖïHÏ³uûvÖj}˜//‡WÜÒ¦Ğ/Î¼m3Ñ|œĞüg‘êMtØ”>Èşó?ÿóí,Ó~ÂW­£ßÌ×¥üèË.Ø”ı;Öœ´ŞĞÚ=pÒvÌ¹¡`ì¦Ÿ©HA{¶ÂA†˜íÑß@wkM^•İyÖW_·°gSŒñèjlú£+¸û>ÎšyÄ5jZ¾^w0Àsñ†xÏ0u:­·>Pi:ßLº›EçHto•8›\rªïï,©óCµ•×s¤ÏÚÛ¥ÖuÒ1¹ <z¿à\'ëáà\'£øŠı‰2Å8÷yk¢©|«	¸	“08¥·á\Z¯ »K´#+.ÏX;§»@a\rSiØş=ì}âaØ9]ëE\"01e,oØmëã7õúòªÁ5‘ãs«nÁ®”Ï¶9«*÷ï­1dv¾.‘à(W›;¾¥¦ñË¶9RN†”…~\0+,Ú|¾H]İ1yã˜|qø¤S2ntï´Ş‡jŞ\\¢¶áĞR„ˆ†ï÷,÷j9fáôjÍN¤\\‘\nÈ+phŠEŸ˜®eX ½z{NÖûåŞ\'ÊµCÕNÍÜÊÏ-í<±ÎÂE÷–9¤\0z‹Ô¤Ïv/ò\ZÂü+{Ağ•÷Š\"²JNI]!YñJô‘\"røX‰Ï%urE¦å|p¯)vÀGì\' _:¿§µC\ZÃ‰6šp5Ë/vØnÅ•XÙ‚”M•Li±é{Fµ\"ÿ‚¾åe\rfh6C­]ÿVgB‡v8&ƒ	*RFÙeA€IUv6¾Çˆ“6Nˆ—yºÚñ%F×ªºå=ÄÚ†(©qŞŞƒõñ;ÆíUñŞ†,ı\',@¶R€¯I›FÍ V&Ì”Qê‹ÙÄÅ¤æ\'U<O¿ÜŠ‡{­xPo?âÂ!W¢÷bÆ_ÍÎ•_È—¨ıÑ‘€;¦Œßm°Ë´±³Zq?!æİå¤<ôıf¾àCD\n‡y…¯%9µñø^GÏó–#•…ƒ|ßvús™ÀÎqVáÔBÿò÷îíÛ,Şk¼3àÔ\0£Úl¢ßÏàİ€k•ˆG•\nØÙÊ¼L4_È©©³\"»ı&; Şèœ8)¸É%á#ed¥EL‚™şp.½ ‚ˆ—î]Ñ‹ì£·Ûß=\"e?è1°¨¥¼{¼\0Êºã\Z7ÚOÕu9…#°œ¡ÛÕU3–\'†¬ıCDn›Q¾\nÜ¨lá²y|xxªö¹èÙ‚0«Däøl{©Á¸*¡êx¥¥ )àä¨Óî3ßæÇØïœ»GÂsjå„fÛlÂoI¨ûTê£“\'NACjQC%½/—xÆş­ĞW‘\rîĞz¯”ÚAçQs£®|èJšR½ëKEğ,È¾9ˆ‰Œ\nÿÓmÄh™.ÅyfM\Z€aVÌ_ºQÿöº¯‚!µ}ã½ën0ÜN~ãKŞ%o‚’7-\"d×İû\0û‚5¸ÛzÀ€äM+J};‡¶R.éa´”õ°Ëc\n8ùõÍº”ÀI|å*\'&i9ú€a\'bœÑ/{œ¤}\nÜú\\0&˜‰Ù#i›ù»„{–Fpğ±ìàÄMóøb3»Ô°OÕ\nı‡\\ipàşŒÁ»HÇOµKâ.$FP¥-ş½WqºV;`P	wóÜ1ÿÂFß¢”ƒ¿k÷q.^È)­àµ§¯²j²ğñX¥ö8¡®ÿzÍÔS|°Ë„©ı’8ñ¦æ¤Õhdçõ‘E±‘¤\Zı¹Ä·i ¹õ:nVnæ¹PÛ9©ÜL×)·º©yÂsÛÏ’™ÃÊy¾\023Òi.€ÎÅ«É3©F‰–.Ùãh|	ëÿ†Îš¾ºE)Šx•%a1m¹Â¦ŸH”•Ö{toci7ò¡Ÿ@§ş\\Ë‹Sª·H£Œ¦‚øZÉcØ=–’*í+˜â’¸}úóË6Pã˜&MB¦©£j…óâ¶^ÎÑõãŒ7IKWºÕÎrÖ¢íd\'ÎŸÛé2gûçâ¡s2HÔÛqË-ù>4º„OŠ×ÒI´Â‚#j\"Ú˜õwSGùÍ¨š¢)Ê®Y©b/°¹_q¸ûªlwÿpõ€ñ#Î¾â$Øw­Oüêóx²Oz½^öÀŞÚ†x·˜f¾cãíg´`kÿJÍÙˆL¤o,1×òwã`û5\"ˆ®ş~*—c€öÌI\nØ…KPé×¬B-,4¬ô™Ø&êÚtç@ç–øíŒ¾0öAæmĞ,u×rŒg~´|œé¬X]GÖp>CD0Ğñì\0+ß‡XÆù{¢}$\'.IçjóDzâÛÔib¥€èê”0?%0¨iyı¯Ì÷QîvnU|ÆNh‹dG>Àí\0.õûû³§…C½±^ùîlÏ‘&4lBø1X¡‡¸Uqœıë×Y}ÿüşC,Ovr¼:ÑÍh‘V	×òâˆÓĞÚîğU‚#\rŸCÍ¯f4u÷<p¯Z½æ˜\"Î@O#\'_…CyİöfÖªc’~!îBˆ,­DÓĞ%rp>4½P°:s­³Ñn*Cnnê¥Suow¼[×œ¯ÄÃKrVÚösÌg£ºÃ ,õ¥„\Z&?Í§ÕøFóß»ö¤ŠûøÍš_Îá©zA*’º¡92ıT‚v ‚Ù~;)¢nFb=Ì\Z5\0¹\r€xmËÉ×l‡{µŞ‹,o›°ñ‚<\'\Z<Ş>h‹)—,”Z°ğ¶©_/p%~I¯èµeg¯¨Ä/èÕ‡j:ÕûâC{íŒÜ<æ\Zğ³BçgGbÈÏ<xi(± ×m[‡ûû{áN•ÛÛ²\Z`lb¶¬RwDøFGîÃØŠg’Îô\'dĞ\'\Z”Ã–!>Úq™[h7Ì¿oÊåÍO¨6İÎ.²«²Lÿ\Z¹ÁZÎŸz#>1‹ô×\ræ0\"j¼ñş!g5O1ô–OªÎu÷$ŒĞ†FÕ	*ÕŒ¨L­‹×ÇX£UK!Q/ìÇİÓù{”^ß—°»„‹m»İ6V#ïdòND\'-ºŠ©?:µ“Œ©\"‘—Ï#¬‘¤ ,İ`;ìX8†Ô¢	˜§$AYVCÿ-\nÇp&±ègNF#Áj~Ï×alJ/÷ĞÛY©0V•pïûÓrÚG½sôøèBy”åCümèà+2k”2ø¶E(U›¢¹¼ªÚYFÂ•¿r½ü8nt(ò	b‚Ñc )=4ÀÁ§gT¿-Šx<f_c#â@Ÿ4\\ ô ÔÖÏN©E[]öK4 œÚFM\"náKœt‚XYHp*©6˜Ó$?¸{Æe\Zä&pËè%\Z3öŠÚ¨Â×ê†1Øç|šÄxÜ¾ÜÊa%¯Şµ!tt*aş˜t‘¡>Dƒæ¨RXIõá› Áá°\\­)`•Vñ AÍÀgÎê™[,owZÛFâuµ–PcXà¶Ğ«\0~]‹Ş5ù¸>˜õ®8·ó´òï÷½kX–ëÂ}tg(§\"¼L7PıRo45Ú@d	°¾ kp[u `ü–êLà¿¦º«ùënã%¹f““Œï£7bRšÆèúÎc³öxç©ç\'é¨gŒ›ØÿQN»2Üe«¦N	ï#|SÚª¦ğ³&_[¸®÷…ÉDTœ 9µûŒm\\}ŸŸ‘à‹*Üâ«ƒì$Ë]#8\r3¹]I·™ák\"[¥Ğ±ŸWtÖnbt/êb½c’Å_n‘äØÀØÀä(n@z“§„kƒMåÉÌê^ÖÃEfşğ}ˆ—¤U“FŒ‡MvXÅü†Qa1YÕ…hb~©agĞ[€M2?`x®Z	ÅÏ‡Hê ”b(…Ã¾zca¬ÏêÉ5eLª«:±õe°ß¦²\'Ñ”‘¬ìËxr‹/ÄÔ%lbØíİ<Õ9Ô>9ÊÈŞŠÜ5Ä£¯ıD»èqCç=N+úfwW4=õmèÜ×S_ıú	›ôUÌKñkjîzGÌÃºqıÔ™z8¾?¤ŸÏëÎ=İlp\"³™ñ8S“¼„™$À\ZïMm,ß½<?ı¹</¯IG~½¸^´³öñÛ·““Û£ü³mıpÃ6…roæßB9ïRy½ÌG«áh¹IÀs(×¨¥¨{@³ÔZO›èˆâÅuq|˜åÑ5ÄÂk\ZSˆç•\";ÌÚPó˜’Oº‡8c_³ÅÑï1:2é>ÎwØ{)1ĞÚ£/¡~öÛì\0şÊÅ5ksø¬÷?{r}ÚâÀ?àÀo;M¿Gòãë7óŸÏOwÍ41ÚÙÁ0eØÃEĞ8ê„SrZ9®İËx!Ñ9=ú¾à¿>ü—Ã¼¤fÚègğO;;€1VR]#à›¿R3£Uÿ8Sg`ú¸è–P\r;oıù¬:Çğ=ú²ı‚¸‚.ƒ¢‘,ÎË7íùÈ9V&8[¬ú_æF0R<ÕsU\r©‡¹:, -!Õnäıß®=ú¯çr—œÁ‹¡ÃTùÉŠ¢@#S]\0¸y/ß¦Nï`†~\'sW ÃáóåUÒ×Ëù‡¢¿~e¹­[ÄB®Z“yëf¾i}ÍÖ¾o4«\0uÊ/3&;NP¯³Úi\'Ó±#®Ã‘8â\0ÿ/£jŸœ81.0Ó9&	¦Û+ó%1ñDlİùr¯ç©Œ#â›qs¨ætXvûĞÎkûL}ò›7–Õ,çÃTîÆ<#*_ÏkÊÀõX6œÀ¼”ùŠ¦Ï)>È73ß!¼õEi\"Ïãqà‡Q—øºîèÊÆ®`9åùÙ¦±m7¼¾IÉ°LS2¾à½G—™÷$U·h\\Fh°#Œ<{%Ë…ptğõI&„0ÿ‘oÀõ\\~³\"$@›ÑK~4ƒ(¶ÓÉ®·8\\(ËY\'7LxMvÏdß,ğKRaN?ãÛtÀ÷CÑš<nÌ?<1u´îy½ã¤>À­ûC×”¦M¢ÄOGH0i5‰<¨´}aE\\™<ştŒÔƒÅ!“]ìn}0ÿÌˆfŸ”y]P\Zkñ¨Z}…§%ûJü\nÏL0WU®ˆÁ°Ë\\r=WI%uY»NÊ)ÜoÖó.¡®•ÇW§í¦3§SÅ<&ş%¶&\Z P‡5òÎ’…\Z¡µ+aÍ;ê+Ä&êóğûóÅh\\­o2¬€…ƒcD\r¨ğphş¡÷Éşú£„†d!‡Û*²Ñtq1jÌ\"; \0ÌW0V²j©äS.¾ÿ\nÒş¦‰Ü‹¿B.áW’¥ˆä±/Ô!W–öldÅ/r\ZæÎk°>-³à›¿:ö$P›Á0ØòÎx+#éˆ/‘}=éå‡\'Üş¢:¿ ‘õViœä£e¾,èß»»ì·gggœL²ÁÃºBïéÚ“Î¸ş1Í	fÆİ1ÌT½Â©å;¶ÎOóqî„!­ñ§ëG“ƒS<î dc¹îøÑãOÛ´•Æóÿøé%Öít:®şËY*EašÄâ\nöS`}ª€=îtÆì›õÇÁm	\\¨\\‡‹PËéhØRƒšò…BFïüî”F\0Í×íÓÆbÿÔ¹]“O{Ÿñ÷¨s;ÂĞ|´¿éæıÄ9Çw0s<X‹GŸ+bÃïöãO¥›ş1Âî¼-üˆ3pN=Î»G‡Ÿ®;~ íõ§“îªó©óh¡Óx\n(3N­¯×“öÑ£Ç½?|Ñ1¸ÑşCï‹ß?şâÓ54„`œÎÎ“öãÆÂíu·hõ¾Ÿ®ñG\\ßh€ğ¸÷8\0ñ/Ÿ u~UúãçZm[»ôàCâ9>~GF_)õçUu^MsöÃ!\';¦ô¯¥ÎİÉİ]  —lÜ­‹â?Nş?u¾±À[÷0Á ÍgäÒíaâ´d}Ìo¨x/üØÊ¡‹¯†®ã‘Ğä_d±,W«]Õ¡¸îF;©&ßÍéıUfSş½º˜o¦Vû#RÁÏgä_Ú;üxNZGøë5»ı„_a\ZîÌÁ\rúˆ®Vb¢È×ÇñˆZú«(–W.Ÿé«Q_âL­^Â™>«Ö%›ppY{“]ú—Rõl&Ÿ8ÎrÒ?¶—á%™?T»ıüb¾Zİâ$¯5Ï8¬·áÍr5_ş47×jMüq	È&ñÓ»_;£€áx:ŸéïùÙÙÊuíW¶–OpıÃ¤50¾ò\ZÓ0Ôá¦‡İ%?éB;ÿjÇëŠkìQÙævR\nÉ««¬§AE-[Pww	|µM¬càÇÃòªÓn™‚^ÿ`(§Uø>IúrT*ÛvmFSÙLSØö,Ù½ZÖìş•PÆUÅİ»R›4ÕÀg/ˆådHQô\\Sw„õ’qsé¥‡Ÿ¹;·Š¸ô³úù®4ßp]ÙP‹_¸K´E‡?º_ÃŒç¤–¦²FÒ=\"Î?±Ä¾:Me®ÀY™­¯~¥µM¼or¦0üÎY¥	®(L1³AôšO­íïóßŞ¬¼^¿æ–|+rÍĞ+€ícPÚê{\nSêûçç] ë…ƒş¯ÜTƒ´9/S\ZùÏÉ\"ºËFØpÎí|Ü3/Ú»Êô\\CíN¿õÃ¼Óñ ú‰Ôk1GÉEÂj#®±âİ‚ÍzCâÈWaxe5°œ¤ˆ`|Ú›s±„q(‹ˆP;ÂÇrùêïEÚWWôõS´$›şŸØ9~¨H[¥Ãâ<0<D E.‚=0Ã©ŒÃN*&÷‰˜æ3_ÚÊNÜéãİbÛE®Yj“A:Cv+M»ÆE”qÏ|Ä½ñHS/|œ]D_o›£Ñc!Ú>…íÅ»w¤yèH=ô‚\n…®ùoÚ¤b‚ØY#TúÉóO¢U|ğ’¸/ŒÃ¬,¾*$¥îƒ]0ÓÙ¤¸ÚìÓ Hiú¯lo¶I;‡êP<ıèG@_´Ëj6TEÑÀy‘Å³qú×	@±Gô/ëç[ä_‡ÕˆR…l^é6Û}r…ŞuÎ¯¤òyÃNnæóéºZ cíK• ê¶YÙˆ É@I–0‚!w!¢;ÎšDNcXT-iêÇÈ7tò!TOk>>-%yôgVÒ 8ÁÇ´¾«‘ßô+1­íW¨Ó»K?ò:\nªÑ~]\"nz7(=˜ùñK.wŒ1Ä“ùl4¾ˆÙµúNÛ‘x³k— !†zhïDÏ‡Í°ßœ±/nÙñÖkÔ‚ì\n“Öü@Ìˆğîq3øu‡áÔ1üxB…\nÔ5Ö–*kĞ¿\0Ö·ñ½	û«£)ôñã©ğ€KŒÛu8XNz¾<Àj%S,Ü&\nZ{×O¨q\rìOï†~ŞĞÚCÒ“¢9\0éºCùœrƒ)7Ø-x`³~~¼QCY\Z@d+‘G»,w\0İK…É˜ haÜbGãu†+`ÙU½,P§¡edÍ‘3ÙŠ\0nuf€ì…‹%ôÕ˜qYvA\rÏ/ÃVû\'l§é(‚â®ºÏr±elŸ_Û[¦{1cš\Zëîr\\ºY¨÷§ìpĞ;î²ûˆ,µko…˜ÃÁ¼ã^/¾€+İıî@1,\Záé£ç vÙ¹e^/«ós¸g×8*!İ!7Å…•8Ó¾g2ÅOÚ‚^ÑÎ´hëàQÁ®››ì´”L•¢ğùuqk…0»G\'ûûá7µba$ÑÌ>ÑrûûAüIL÷¥!AÕ†ÂYÒF\Zâ¸«—ìŠU\rŠç\"Ì‹ïÄzcˆT\nõfä–ºU9QÌğXQ:%G\rŠÄ^#\"}»ÙKõ¡~\rqİy¦ö=±qv©5\',¼¬>b`ëÚõ±B*¹öH”¿I–¿é¢\"s‹2Õà“ÉØ¨~„G¬@¼Á‘u\0\nodw\Zšªš™ô^ö Àíx{ÒEĞ”áÜádÏ$-4_Á„–²¿‚¯Üí/9©jm§].ó¬w¡?ñÇ\rş8(,¯ß»±W£F¾Ğ»–±Ü~&rbÿ \0Òué©cQ¾¶ù¸)ymp5šïìü²3Â©®¬6‘ZlpÑ¦ã%ÙîØø1k«Óàİù\\Å€ØµL«L@€’úş”Ôq¡ 0HŞ8éÍÇC\ZŒ“÷gS€\rpµ‰àöØ[«mlÆâÔÈU·ÆâÒ(ÎD¿FÛí˜^ªóÙ|‰aÔæ¿ş«øıçÌU«(p0™ñ1˜lYšm_ñ”Òcº´wk•(\\y\\íZ\Z¹®7BxT+ÿTËS3×õfÈ7pT¯yeğ¾€Ÿ2+Ö¬IuüO>¦0 ÈN	 SÍ}!èùVš/¢ Í\"h³zaiA›ßo–4—èK†hLa¬Œ¿!bQgI&ˆ³Jé­Y1X]\\¦’­İ(œnPY+ÿğ=<;éÎ	îC)[;^RG‹ğ.Â¼šœˆ‡¥;,Ìa~ØññŠUFâZòwƒXÂb_pÅ:´•Ùó¹.}1Uî³ã&øeQós;v{S´Uô	ÒÔ¢Ç†âüŠµ`µ¡~Ñ¿~[m¸ë§.°âè¯ù N©ÿ± ÑGMQqÙfÖ 0s»± ÌñÍî@¹Ì ÆÛëŸ»Û‚ş­.J9J@¤j”8äÅÀ½ˆ7}OØ¾I=\rÊ›Öóğ€œµ<:ª`y€ñóÑZî¶{‘0]yo#]ŸD”ò¼’¥+Y—ËCMbLàZ2[G?mSåG(Ä§ÚÀß`÷6pVlöŠ‰Sğ^C~®œoòÌèYÎMñÍdu\'{Å¦¹î$¨Ûµ•§PyºW,›+Oµ2â³•‘]ZîÓæÊË°²o\ZucµpMÓ©Õkk^óp²Œ¤‘iNí\ZcGxÛÏœ1(DÿP\nÂ¦E™¬j}~ëQ%Gì›»Ç½!s5_¨Èğw—3»7]ê“§<í®´´i¢.F«×˜å»š›ò¬O¿‡)ª`éÊkçN‰´nÁÓÌ‚ÏŞSWÛ^0`æ\nucõ9ğ>ÖiKıµDà—¿Z	íŒe_qöñàÀË9¥ 5º˜ş’N\r4“ë_§óôÇİ¯7¿‡/¦©ÇbŞo¹´VµjÍæëWã—bˆ“D°ãi…¥¸Ó;c^—éz¦>ÈAÅñqf«b¬‚ì$—\Zš>J}ÈNNj¦™ş=ù6>èúê†,Gv¥òLÜ3³½²vÜ—rdãœ;yâZ½É£C‘o€F}WÍ.SoÑÉ([ç_%jØ8Sacq4Ø°ª;gJ%öNJÊÔ¶¢Ss›O–µÃG\\D?‡”?¶\r?„7‘ĞzìRŠê07‚6ºêFDˆm[‹k\0ÖG—4ñ¹ˆÀî¢Å™6ÓÉqç;}.{4\Zôú<K„ğ˜0>$ª–ÖËC\0\ZZ+™\Z/æ®}†¶ÍİùtR[n•ˆèT!™ıËJŒT˜ë.şã·r²^t0X­†ÕdRzÕ—ÕEáaX·euá%ø%Â9)2Şİì\0\rP”BkMæç,\0Â5<C]óay=.V†*N·BÈ®ã‹NG#ô#î/±£É¦­M?9‡ªÇ£éõÜ;6 ‡©àòÙ|àGLÿšm¾ŒÂ`¢ôW&zä+ã÷\nFT’¼ÎYc 3Kzª„÷Ş	]omô;q1êÚ»“£ßQÛ…éâıóA6pAxÌCMl-ôĞsi®ó‘‡m¨ø†\"\n/_œÈÁ ~ZVWë›öc¶4¹x¦5Xùg’½‘£*T Æ:Ø­åÃØ0¸Ÿî¶#²ú0ZH´={ù¥äWD—\"„™¾<©·â{ I:‡ãYı(1ÊÖÁh+©…óMDköãk„– „sQ‰‡JÆCÏãP\'ª·$úÄj§!ô¼ôuD?ivGµ+-¦›Cµ¾“\ZŸÙOz¾ÈÿÌî,UÓÓößÊ›Óùh9y\r¤t=Ş¬ÛÇÙÿ†iÌàûCV£Eoq¼İU«BŞ­l)¦÷²æµôè–7¡[âu™ôU¶©È-&ŞŞ»°•6öQ¶³ê8‰ztû€Ÿ\rª|NÛ„ˆÂÒÕ#U80P.È”Â$‡”Âz<âË¢«åû€Œi\'Ğ ¬‚-gTÓãr\0ƒP;Ï¥Ô÷ÑF8¦ ›g¸ŞÍb7|¦K5*‰õr[`°õ@§Z\nnSM§óUù1mš¼\\à€qíØF…:êù\\b©?æ>pş§o†ã˜³õ\'sØße¹@,pŸ»…U§PjU´í×İİñIcTÁÁïXH÷ÎÇø0\\_ww·ş˜)\"‰µa›­ŸğE~;Ùr0¶ÒêÌëïËòf¥¯nèDÈ7Kİ­_•}N‘â&^|Ú1X’5$&9£]ÇXè8ÆÈ½cmƒ	9ÆŞ@\'\'EĞ*¡ï÷Q&pğ<\082ÄµÇÿÎD^J%È·”íFçgO•\'}Ó!v[\0‘=%Ñœq1ºAml…Tcy5©+‰+C)ŞÁåÕÃyü}„ğeù-şíC©W¯ü¡Çñfª³Ôi¾ÉQ³KA\\{§!Æ`NneÚ\01ŠÈU­§eà qŒ‚*ò¢8\\c¦8À@ê³±/Q£’Ø@ñ.F Ä19¾<)ŞKŠÄÀ”ÈUTÖX)âg34Ê.Ö&Å@ÖƒÔá8¿jJ5llš{«äv˜Ãİ\\¦‘Óìø\0ÀæêÀ[YGcGUò»»CµvıØ =5™µ³„u8ò®öE‘éa\'eJjß•# çÖÓË|öu	”¶ÔHÇ£¯—€ãÑ\n¥?	Bï\'Ã5;¯S­LQ%cµçÒ³|8¥¤¨@5É0È\n‰-Üp…~\Zn·üƒtUOb+á’r}Æä‘ˆŸ\ZÑ~¾<ÓÜqà.’¾/C.êòòÈGV67ƒ\\2MUrì\\~6ŸÂş·^jxxJyÁôõz¾DÿÜ‚´§f=aDm´ı[6ûÅÃ*èuSGmÙs•ùU»ó)y¡¤ÿ‘)DŠD?áèzJL3¦&6’rïƒ\Z’&ÌŒ`¥Ø¾,GêŠ­¼^TËr8)Ñ	úìLr³Ú,’ô‡/š`öb5}\nÙlPFiŠ¥ıœ˜r^r¢Ê4+núÔw‰¬µ/áà6Ræ_PHíÌi#îé–§M\'ïx4äÑº°Ãêâ°Ìl‚š¦{ê=D¨\'ÖÈ$icEéçÚ}\Z‘—‹&<’˜•åßø¹]^Ü<†øíƒ‡w¹Zî§÷	ú^ŠN_N#M‰â‘x~bHæ}a„»Œ¬mV¬ĞÆÈZøNõåo¾™UïïŞT¸£¶lY$‚«¬%±9vÃ¡Ñ2\"Ûm¤<´H÷MJZ/‹cİ\0y»mvNçàè÷ˆ¶\'Ârõ³‡ô×‘{ ÜKñ2jt¨lzÂ‹TçéàHÍû‡™ì ‚ÿõÜš»+1Ü`•Üjp¡ãC:“sÚ<µÌ#ÊÄğ–İ3\0ÇU0½ŠéJjPü¤’=Í\nMìÇ×ğÄÔ!L³ôóèƒïõ+å›Ã‡!Ğãóg’©K%4¡§¸I¿©c^ßƒÑ]@“ÖvéDhİW/Üˆ6ı[ÒViFy_Ê!¿Ãó›h^û¶\'!çg¹ÏDè[k^kØ¯Ê.‚$|¾Rz÷À—`¹”†ÙTÖˆ6=/Š‡@4¿šÎv\'Í˜Df®ñøhF,<†Ø<)w«lI{3@B”cçØ§!Èw4Ä‰HæªMöã?Âİ¨D§XùÃÂ@NbèbŠ{ˆ–¸u\")O_ãnƒ/|ŠwkI…BÕóËï²Ä7:<ìj]ŒC”¸n\ZIB(±)ÖQÄŠzç‚\Zş¸À9n›ŒxŸamM¢³÷OH?ç³™Í8_„ÔGê¦ äfà&*Ü%¡¹ºNí™B±u‚’piÅæ‹¤¹.æÔŠË,¥k8:U¢iLW¡,¾®Î&‰ï}èÑ;¿1šœ:û£yË–vï \0šg’ÍÅ,|\'Ëe>ê*ÖÖ\r°…M¡ıõ˜‡v6óŞÖ	£ª7›@§Åòba\"LSƒ˜ÿ${ö}°\Z:GñáE{·6ßÁ¤xMUŒ§g>ãvŸ™}µJ5Í¼m¤íïïÕV°³Û…4<U¼quêu>hæs>}<h®å|\'7É?#†V6”‰ëš*“Ñê‚ŞMº£ÕÍlÜ]Œfå4ñfN˜WØ7[J!9>şè…şæ²ÃŞ™Wœ??aIô0¾ê; aº¯CááÊå÷èûD\nû”ÜuıåsÍ5IÛš\Z†ÆË²Š“øÏ\níbA<öĞ½‘Ò×÷Nú\Zëœ¤fx=:­Íïî÷ŸD]üµ#XMUñŸÉuü&Ô¹âë³6¯-©\Z>”†Ñ‰±C8—™õ¦ÂPy¥/ğ«ñòFŒeÑ#Ns§‚@:á>f,CÆèüH„3ÙÅ§©.G{/\'Yğ\nlZ‡^3¨íTÔô¦ñ.+ ƒˆ>T&Ò>\'Oàš‘Æóï\Z¦)õÂI<3ÍğÊƒ¤Xı^~áÎ¡ŸüğDbº¥Dib1ì~¸±Ü Ì¡–å+ÈhÀ8— &öÊO£5ÌñìkØ—Ó´ğMµÙatÃò<°ô\"–Ö¬¢ÅOW\\\nex©\Z:P~á\räXP•ï•ğÉË‹¼¾hRcÃÛWtÃIlĞÀIè¤¨4Œ`]¢8Yôz´Ü@;A‘İ·VãÇìAÿÉIv±ÕfÜb£Î4Kê¿!_^FOÍB\ZÖ€aºuo&ä‘ÄZbÄú	ú´µán‘XYº^[ÁıIÚšVi–„)¨¬îç.dÚ‹óàÇËûŸ>\r\rô\n\ná+à¨¨«,2²,ÏŠ©Q°âü¸»£?µçDdV .8E‘ı6\nìš•jºú\'*§~û—¥Éˆñ•TæQG(`ğjŒ‚ulJĞ)í_ï÷÷%	öşÚeiuş*ëõ¶ÆHĞªÉ]PµÂĞE;Üb,-âI61êÕ^$¥¶!ĞóÓÕœ_GÛŠüÇ›HÓ+¡QÃ3€øƒÚ¦—=}píêûv1ÀüÖ‘Lí™8¡IÏÅQš˜èDr QIj,İ‡.üßpHû·ÍŠ.J§´9ì§ákr“—÷†p\0ÎˆË¢;J€40³òX.ät€î“2yJ|åä”	ŒNYá[èqV=Òs<´Ğîb¸*—ïËû‡)$¾Z\n	OÜ» èI8%óé$6Ãè—%Pub&ÅŠYM\\¿)ÏÄn”DSÚÈwTrA d²í8O\n¨ìT½òK.OApr•s5„¬¼5!(û»\'27Eá2sèö=`d€¶¤ƒÂyädü5¡Eß ˆ;·‚†cumµ_\'«ÇäDHÙ|ÌÄ<àtÕÂ$\'q¯tüşçİF53ÙFBÜÌéÙP.8ÉzHáàîíÁ²\Z†OÙ™İ‘¾@=”k‚<z\'aX¤¶	z·$\" ö‰[b«€ì×X_OôX®yöIİ-“6ákê¤¥A$œìÀ¹Î:È~‡ª–ÒÕO^Ş^ÈÆÕÎäHşyOßÛòürÀ$$ı…&İ…Ò±»yÄ”H=Rd¯É+<i8Õ%¤vL½ôbz¥¯êwô&ü Lµ¾é~-glÅÚ¤Ãæ4äI{VÊ·İã£NºsHòƒ	sÏZ²JAU,xŸ?ì˜ë.ºÑkcË™â:«øfîrDaGQUµÂş¢‘:Ï¹å‚æ,Ï˜ñµÖ«Üi\rØ/ÊÎ<™hÌunÉÑ)2šô¥ğ¡Œ‘ˆÉ_¾HE9şwâ5J¬ºÖëyÚœ»KÅ®ßİ54™«¤cs	<º:¶áew>›6cÚƒÑ\'œÖÆ\"×“¢Ñ+š;7‘¬ƒm[OGËôûŒ\\a­g¾¨†:®”–g‘­Ù9iÕ9÷31“;¢vÄØÃN$üüK5á3Î HÙ»K?`\ZW\n@|[\Z˜–µmˆWëkkTé­²uì!ó^fNêåµâÌO¾)ë„–Î¶¹òáƒd«<~-®3í\ZÓê˜B&BÙuNe)ıÃ:Æe3çÒVn›ÛİˆË²>$>€A1\0vùÑ×\058ĞÀ¼Û\\‰3şÄ.@—¿ËZğ] Ğ&©@­ã‚ò÷Ÿ½©>3SY´ğ«GHøÇ‚¾£2—è˜dø4®‰lò×#²d•y=©Qÿ\r”¨Iç\n›K®©ú½Z<l¯ ƒ›%ëf»Üğ8êÕ;Q&ü£ÏBpœ¢dâoÎÉ×|ÜPóUèó“ƒkO÷®»“£Şu\')Úb,ÖŒgõ{\núÓú°3¢uôØuï>æİßÆ]Ğ\nßUƒw¤˜Ê$Õ|‘¦‘x^ƒ$¯#á*TMü«\"›sGËİ«†c.¨RT,(»xcœYy•m£-!µˆÙ¢ww\\®&æ`wT|aûMDÙ ,Êµ0hŞ„¹dÇ¶­ÄÌ.óìtºYÆLcdwAØ†¥&\rPå­¢Æ‹zßSMçL4Ü¬¥™ÑOIéÕ°g–ø†â‡öºß÷úıA	’Rú{K1«{Ù“#,íÀRÜí8×ûrB‡Ş¶*6LŒq{7Ÿ¶ÿğè¢¡ìY7váSBv\0{C~Û^Ğöã\níÌÀz|®ìš‚éø\05wgº­coevMí5;\n­×“ÁNñ\"œ)ñ‡.íºq}õZIW‹‚K>jXä¢z¬ú8š¼Û¬ÖÕú´¡¸“ü\Z×¬­ñz6Z°4ÉóBOµ^w}„Yš<t>?êÓVÔ§ø€«‘‡å íDÀ‘\\ãÎÑAo1­ÏæKâMÊëÏÚÙ_ªYÖyÚ=êh|ˆ0œimYŒ·h÷áå%>¯£­\Z1º	{`‰šÏvÁõêûÊì(ã9Æ*\"Ê“ µA·I‹TŸí§‡ğ,±¯¤+¿ÿ¼ó´ˆÁÂ;±Ímuk¥Q€\'JÇXÚ­xbÏ’î*{F^va›ÀVI’å;ôõ¨¦Ošv™8wW5\'œ_Ÿ/K@ÍRNıùÒ„éğ­ìh%,É[¾ıœ[>b—§òÆÖ<ù{ğy\' (&(—_1½=xÌÃ€ià2À2Î—Ræ½´ƒx\"íŞZ\Zn¸rSìx5QD6Bâ2V…ÃÜıêj6“‰Ã‡hÍê§_Bc%¸EFwoÚ*@u&Ç{¢¢æ\"#ˆ\nïní5ì5tc§ÁK®)IöÏ“¢½ø„øe£ÁzrÎY»°¶ÉjhÔ\ró¢ùX¤Í`ÔZš|éËº»3Û›/\r–š6V×Í×W\Zeâò…¸Îk»©n< ÔÁªá6XĞS/²Û;•[¡#\nTDÈèèXàª½|ŞQ‡½˜T­¾U3™êÎ-ÒÁøªÑfËõP9n³D¡@w<Ÿn®f;„ëFÆŒñªÑv–Ñ!’¨´µ\"¢f­rùg9ç¤×‚¡u–â¦âIûæE¡/ŸûT7s>éŠ.‘á	Ğx×TË4Z¹À~vxxÀ@8ó\nzµ¹R¼“Rÿòø°kK‘(œÕÒB/HÀiNPŸŸ»xÊ8B9½L«ojœ™Åb†“²@U`U»ÑÂXŸGR@ùq3ßŒsNÂEÕÓOsÓ]ÔX	Û¯VfrÊ³ùæü5n1æŠ^5xŒ¶lÉõ“Ô¤Çîšl¸Sy¬ò}bgî!Y5Ew\'şA‚­[Ú	÷÷ïIh¼Â¿¡.y@—R…\n[ÏÏÏ§¥›»	öÌÇ qªYòsù÷MéßÍ`w¯«Ù9>2\Z¿fÔ£>uãË£ş![ÄÏÈ+›ï’é¯]?X\"™æ‡j}c¥‹%\neµ£:o$W}oÏî­&,&”	ûK¼—ÇéÅ÷£l½eÏS¯o^>o[‚’â)È6~»dÚ©!¯iß÷Ù6Ñj|Æ^Ì+–ª¸îùä\"…Ú†I_î©ÁGù¾\Z“eáœÇõ×®NÛW¿O“¡É_Oöö-‚7„®­g´		²zKZŞw‰°4á¢ş&fÜl`ÖÃÒ¤%[Â=Oò›¢h?[¤Ğ>™á½±ùí‰ 7ßãjŒ¦(7G»åãRüØ·BoÎÏÔF¸Î®ø)Ğ\nê€;ó;‡²¨—=2Dú#RĞGY¢ê_ªéÔWOuˆŒÍ°>—ŠòUĞsôEÚg¹ûÜñŠe”ë•ÅÀåLò5øªAD×nø¸Ô~N”¡Ó]¦½h\\‰_€À®Š÷©íWıÎ ˜uaËV\'\\€sF‚Òå7`\n¬ÒŸèø¸g>bô÷%ÕD;tÓ.@SxG{R}jún¼‘$éFää2ËC’Ç&7ÌÈÎ,óÙ|&g.ÛâšO+ûï˜2^;UMÍZŠ¤JbBÎ­îÁ‘ævş	XRWO4kÎYÄõ=¥nìÌ%5Ñ…İe±°ƒ•eã¥.{&İaÄ“réö`°âÀ—>X§ÜkJƒæúbçÄ*Ûs®ÉæçÙU¹!¼¬NÊr3Öyõ¥ç‘[Òç?ùÙ|	<z7º&ud¼á—ılµ9½ªHãÁŠg£Éd¸(—+Õ?Ôæ®6ÎçC3µYŸµY¦êÓS”YL¤îr<PéÙ7î”1Fñ¬tÑ¿İ.£0T²	L°î¿ğ±È6ı‹Ğ¶`LÂX¾¨Mø„à´	Q™pÜhxFe«“Ô¥@óòÌ[…Ù§²€Eğé\\ÜKA^y—ˆ\\›2;÷\\âÖ …ĞpSK^ó¿†ËOı~ş€ëş?rc©CJbÒñÿÆ>.¡Ó}3‹ùßØ1!ŞÈp4ôë›ùòê×î>PEı’´KY\r3ğ=¿^o”Ûºg	µTĞ¹F¶ìœœ‡üƒ÷^Õ·äoÂ7n¹é)ÿİ}!©“$©å\nÇ¶³ò¬d¸ãz)l©±`ÖÉo¯øf9œğÕRÌƒvÛcÚõAˆŠ6Yn;™¤bÇz\0çMéf¶¾(×Õø5\'ìÀÆûag—å\rkÏí€’R;°ÈöŠŒ‘4²ÄCg‘—¼B2\\«3tÄ“°u‹­´»Ÿ<ùƒQ„+Ì0Ï—#êİÕ.áv&:1¿¤qöê6F6\\RÒ“’KÎ¤ìÎnãqÃTÄéƒ8ïd[ç‘­L~\r°”¬Á×P3\rÇò¯¤NÑğğé©ãM¯?îo\"ÍÚH»ºI¸”V¶®…WÙ!BÇz¬ÊâÂ®4mÍOßƒ…QWF­Ğ³i¹ÏzvåA-ppì06ŒW¤›ZÑ”ªº’ŠD\"z—pjq¨àøÆ3.gmÓ¾-êÉX^´öF³“*’ô\r“ã–Ï«@Š§øW	©Ş)NGçùğCR†æ²\')É˜ÍMIdà	…­¿+ûC£Ô Şƒ¦±„1å )\\h49ŠPâ¼HôD\0‚ŠÕŠ¿xéÕ¾Ï§åH•´Cäê\0/ŸÇ ˜*“‡¹Z<Œ¢påü8şî\Zˆ/Æ>\0šªV;¦mh39ÁVyH°`½aõÅEºXªÀÌD_û³±;õ²Ò£]@L—êÅêó#Ô÷MLü¢›†ÆVÃ¡¢ÕÌªÉR½‹©˜ì»Ú\'>‚\\T$µ²\'è‚|kš7µ\0˜FˆßÑ¿ZøüºSp3ÒØ¹Ë)l)4ù¤ûsœºÂ›2²Ô?RŸ[œƒt[÷.)SöKúO˜–Ú¸¨›Û8ŒšG7Ób¬Vö\0µ¨tM]CëíûwTì­ğåİõ`”Ÿr\'®Ù?÷7Pxİ–ĞU76í”6ÊõÓ¯aO†…×O\\J÷ÈªÜwb^¥lqÃÎ5­ØJ¼Í§—)€ëyâÍ,\n0L~ct[…$Iœ!64‡Û³©Äı@õBüXQ,ó\Zïâúr\n§Ÿ“S`~lïi”RCU3Uºµ´êÕx(ßGÜUj!–\Z@Ã3jÊÓ¸€L”.´PxúQ´|šÜÑ@ò±´~’ƒÜ\r>ÉSîj Uá)Jñ;ç(Qa÷(>ª…4\'|Ï\Z8ßÃH×yÈz<¼F¦¼©™!YøãÃÙU£U9ä×\"³§Ãı…*€®T/’4y»ñF,¬Ï¢ó¼h¬ìÈ†ÁVwË„WÆ˜†\"•¦¿˜“’ŒÓj¼î²/«\rÆ¢õ‰juÀ´Hro}³(÷ŠLfõ®Œã¥÷Š:õÇôd5ùûòù“æy*r)½ÖªÆ¿~›nİH5ÿ4‚s9› ¦ÓéE\rÀ Ö7±6ó½W#€!F$7Ùıîfâ)¥Ïš—óŞÜ8QQqR´Z 5S²ş…õòLĞ½^/K	˜¹P ·EğWó¥“®ºNú,ÿ‘3)>ôò\nµôŒ$ÇXyÍƒfz‚–ÆjŠj§^ìz‡‡æy”>ÖÔğZí%-­qÈù€e†ÿšËÛ±Ìµ’ÿß2ÿòev–Z|È¬¾íÚ¯FÅ–½ººr¬”<°4‘ºÈçM c¬×Ôx,»¦¥t6tkĞ,iª‘R{°¨Çâğ®œ‹r.{ò­¡ù³7èÄE|UeèÁ…Nuù‚Kz…pŒFê¸×VMXD~;Şˆt„Ä‰âµë¦ÛIõ;x;µÅ›ï°÷Â¶0üôB|tîºİ“?ß]ëı¶:\"ì¦·ş€mC^£hÖ8]<»1³ñHƒ;è+¹©f6µ­º?âfEMm¤yL2ØÓ½Sh.÷A„/2Tu$òÂíÊijíÛ :I¶eêU]s»ëPòì¬šAqÒµÈm?S®,©@ÅLUqëé]?Mîr!ıF\"‘3·Å¯ÇVNYj·á4Õ]N†Øû\"¦Í1[\']yÚÌ¯$¤Á‹ÄÄ1ó—äÕ\'(L¼‰w€Ù¨ufB‰¡ú™Ş\Z0T²÷]ıâ€¿êâb öömk~\0âÊ­qæ5Ô‰J<¤ˆÖà²$gN®Ëá:®\r’õeÆ<Èìïï… Âi‰K;Ğ„; µïŞxd4t!u:÷,=eK$ƒÆ•!E’i%n£¾âÃ3ŒLxTDœáN÷7§«‚IÃ>ÇËj¡‡¦T,!U5ç}šbÎfîuë«Ù¦tñ:¹%–¢Zˆ&aîÒ°_Œ€L>Ã14ÍUZÅYÚÛ÷Ñ{ØÒéà\rÒ+lçÀ1…òˆf©ç²\'©¿*OµC¾ç¶pÁHî’Tß0ü¶øZgÃÎäÉ\Z¿ÏŞs¸jìCt\Zq‡\nLJf	{g‹Í:ä_¨LFr£¨åÃòj±T¤eJ05SôğO©Çè´’¥1ù>³¨›¡Ãº\"uìı}Ÿ#®2p1öê\n€Ø>ñáãÁn6«9Çc3\ZqĞ	#œ5×ã OøvÈN»Œ«|w\Z%N\"Ô=³K“[ÿäÓ(em¡Æû¿©]ÙvWËÕôƒù¯ÂhBãºrVÍ‘/iòEÊù¢Ù$l0E(º\rE¨X–È–‹^ùr±Ñ½­ğë‹Ñ¢œ¨YgŠ–«;Ù7ÕÃFÔÌ}_.×ˆoæÏ+*6’(ˆå4›àDd”VCB’5¨\Z?øno‡×¾êœ\ræXFíz]W\r×e©sà {”	ÀHrØ]ğ¶AÜ^>ºY-ÈœåMnÈš4¥L¯”%sÆÎÂ\03çƒ¨fƒ_®Ëñº‹şk>+œˆß‡’tü¤Î”©Öä/KMìù‹B¥Ğ/P`œã‰Sdqœ=RcãGì‘çQ¦Á€½åñeyÓšÄX—lœeŞY:Ç3dº Uù3òLoì9\Zœ¯ŞçRu4o-R·‡{jX÷ú`u4Y7^S°I–T`È8‘\n#Lx·­ê.P=¢a‰s˜ÿUñr¶öpÑq¹qsø²\\Í§ïËÉÊ}õƒş€\rüÊ»¨ÿ¾)—7´½ÛÍrúãœ¬•ËåÈÿ6f\"€­Œ%ğ.kü[Àâ-ºÀİŒ/»ëõbÕ€Òü\\3¤\":6màğ¡‰Æ¤1òˆŞóá9¤üb9_ÏÇóiáë“³lIn…¹í¸*p\nÜ}6Cµ½-\n[5r’6“^ódˆ˜OÑ!Ö¤²ÛÏ†§ÓúÌËMù7²k#oÍY+Ëµ©üdğ«oöÿù.ö+şÿ\0',1468278924,NULL),(10,'wAoGIn_B9hBe','phabricator:celerity:/res/defaultX/phabricator/634399e9/differential.pkg-pNxV2IffL7Gs','deflate','İ}ksÛH’à÷şÔÌ¬@„@Zš½‰½#İá–İ1ötÛ¾¶=;\Z­\"@	°Ğ²Fâ¿|Õ\0I¹ûn#î‹DÔ#«*++3+++ëõ?¦yÙ´IQŒƒw×Ée/’¶ª_ÔÉÕó2}QW«ó\"û¸*ª$\r¢‡E…ëõ¢-×å¢Í«rÜ&õUÖ†ùrüúÓoæÍ›*ÍTFøĞ^çÍô¢„´˜Óæ›¬h2Ioò«¼Ğ›(ûœ•m3;Ò<ı!»ÊKìKáçKì}ÜåE¡:¬êêªÎš†éd¬P×UœG0À6_4³‡¼y¿^­ªºÍR3‚ğ¡ÎÚu]ÜåeZİMqÈ?å\rt\'Ê›wIÓfO«µ‰n³ÛË¬†iØ³r]T~§Ùª½Gyó²L.„œ\0R¢&k_™$ÕØeU\n‘ºFŒ©sîÅó ¿W½ÕU_G¨p±^¥I›½ şè\niV´	Í)× îÆq||xHYßKoòòsu“½ÉâJĞ—4­ã0œo,@G1™‚ÿ¶¼ü>à008l¦±ÇGC0~ Ú©¢~~´Ş&°8Æò#«£Åu^¤áCZ!fè:­³Msõ\Z@s>ı®’\Z¨ú\r5y)×ÕìÑÜÏ7Ÿ“ú›ª¼Xùâ&†Õt	”E(Št3š•\Zƒ=Ù€i~¾qñ\Z>dÓX/ãpÎ©ÖŒ\'vAÀc8—>¤€kèrVÿ¶~d‡š\'!Î°³	ÃB¢*pÇö¤)Úîº]Úpœ&5º‰¨šŠúÚ8éà¤È’ÏÙï‚»m;û7uxÒíqõù7M\"µùKr÷ùò8œB[É‡:)›eVOS/—ËlÑÆÁ¢ZİsMkv\'ªÕoê€@DpKX;M¼µOTd¾¬ê1VÈóøxçßRê´ÈÊ«ö\Z¾{MV¦¿d¿®³¦S™³<?×ìjËR	\rûbêéW€ÈJ+\'\nh=q~µ¼Ãùpy½öL´«Ñ§[’vÕC*q«aÊöZÕÊ®Q­BìPç}[\'í¢ºU¬Õî¢¢SÁB‚WÉÅEoEÁBOEƒŒŞŠŒ†z\Z=Õ*„VŠv)VS_Ë‡‡‡û‘Ö\nëÉ,|ıÃ…S±º¬’:í¬.ó\"a¡} S\\mö¥uBÁ\Zã\0ÓŸ­\n`jA8m+À`^^yA–¬J—G\Z0y›İ6&Ó_Ø^Aw‰SAH½R¸Èi$Ïş+¿júç³gÓY\0æNÛûUØAFœ—k‘ËÍ*[Ä”\rãzŞàìñ0gZ&·€iı3æ™I/§ÂNl^ƒ%‰U‡:ÓšÔ BÔNL\r££PÕÅ\rã2»ûÆ%2CY0{\rÍ%&½½üŒš«còèçØt“>T°øáPÁMş¯Œo{\r*öu\Z¢¤ÓëuyóA%ËtªÏÃCâ¦$¯Ìğ;]@K/ØzTĞëŒŠuBw{\0@*²y4+|vEƒÊ ¶a<ïAñ_7ã@•úc–®”!¥`Ú\nnMÕ.ÖukYÌ…>şòŠ[ÂFş÷:«ïß%urk5 –™ùÏª¾YÕİXƒ£jMÊ´Èê±³lEÆäésktÜ#¨„º*ŠÖÈé‰?xì9ö\0ÿéãXMv9ìôgGL\nRD·/)SÌQ#!ãïyv÷®~ÜúàCú¬Çô+ÑâWí(¤ïşúêÅ\0ÄÕušù5æQ°¡&¢ÍC¬‹¹¨fÜ!È¸â?¢‚5!\ZRø­yşI¬Ë)b¹°*²V­>êô2É?[«:XLƒTDìŠòDİE(´›\'¬@ƒ©·ká,¨”½lHVPê“Æ¯ø[ õ­\rrÅñ“îÏÒpò»3¬F(x«Í®ûÿäå(tE~FßjãÎÇŠ\n´…«:Ê5\\aEi1çhEŸSEWFå×SÈ£báü²Î’c«ˆ‡*-€]& }uæœköÎùzõ¤IgHT\'İÏ¾N^\\ôå^ƒyÓ\Zp§:ÁQ\"¨o2–¸Ÿ\\>\ZTD6¶°jıª$¨Z(ÖH\r–¨p“eåv£Yäİ2>\rlpT¶`9I¥3YÊüSåO9qbZ°Ğo5ë•w…˜1„	ñ¢}áW­¨fd\r‹zpT•Ü+²—EPG–•SçÊ´aÆÎÈ¹,ªK½\\•æø{6öæÑš×—eÊ­±ºBz#IiÒûã¢VëŠÊ’áE\"3+ªî,¦=˜ö\0s€Ny\\v?e@@¹OÔD¸ğ¼•å-—ª‘ÖO³5‰µzJôn[‚†p¸\\e²ÀT_Â¯ZO®ÊªG‹i„”­«mh\nşûÖ‘·V“½(\\Ä‹;Ğê)hø›ôVpI@F İˆèı9©ûAÂu{ËHTÄ›V%jĞ²AYö;Û.5€UË6¯e«¡ªá«ÖíÔ<áWSèp{lÿ7Í9ócZT	Å´ŒÜÃ+Á¡D`+ivÌFÁçå²R‹iûËuãü\"ªĞV…[}Ş5AÎæU•MöxŒ?xŸÕŸ³zÄe€p±‘N%XlTmOll\" »UV·yÖÌpAF„Pò•ÍÓ\"i\ZN3Z;/œ¥áBİ–ôş:YejÛ†dKÚyF;Ìuxá6JŞ«’UOUgn,er*diT)u8c‘¤ZØ;İæ¥>ÇYfµü„IÎ¡uXğÕè´HŠòÛ.³(²¤şßfÕºÕöû%Zz°Oqw”ÂÑï’¼şK=é­â½¸Ê‚®ÃŞyñ¢\"Ç·}ßê¼©; ‡‡BlR0éë\"}oÙ2d3Ã§ÉÓ[{L¡i˜;İò%á––AjšŒÒûÆr¤6—¿@ÆOùm+mÁÖGÜ0,Óåğ2maÔåDèt«È0:KÎªå*è5¶\rú2/3÷Cğú4úD{ 5b®£)ìæ9ˆÃ‘s–J…Øà7š°b·>–—˜UˆÀŞ¯22½.[æíïê¼ªóö~ü9&‚³šl—È]ÊÎ4€]gcÈÕE¾f¤–bƒØD\"7+ÕĞ9ªIDã1áÔ;ÿS[¾›oòò,Få±âÙÍùAcüòjmÜA—K×ŠÚf9>–ªÏ³“cø¬	™ıÒ…-_f×Éç%Iš/9°˜ó¤˜,³,Åõ4YÕòøÀĞ0ée~Å»Û„’Èœ$éSN’ÍWU¶È`ì|Iãıv™ÿ8nü°‘Ãœ¬HikL¿OR¿SEÕ·ÓX§ğ;çC9±mÇWfj\rõeù)¦q%Rl–d¬¯7×†ğ¿°jPº`uà\\+Ñƒ×DE)q0šÛ­HH†ø@à±@&~ëüëéÃÌBO’*€ÜãO…¡¹ÇF°(GªLX×ó‡}>“ü>?‚õtgõ„ç_[œJ#íAHh&ÿ§Ÿ“bEŒ‘ÿã´M‘=äc!\r§ë&»oÆCäÁ6NHDûæôS•cL$‘¶Q[¤\r©=Š8EG†/öuæHzÛ#€ÕªÖË;ìD(­îJ™ŠÒŒ¶(X\\\'åUæ—ub\nÑ¥Ïø¬†¸ÑòCÌsÚ¹¢Î–¨>¾* —w¦ß·Ä0Ör*…¸ó ç8ë“á:çœß“Ì\"P9ø)g³ß&´&°êc³cÓpªì\ZfX4VÃZÔ÷j@ABŞNV¿9CwÿÓúv„$ì—ÑòëcTÇÛúşú‰…§ “¯Aƒ™ëSØ,ãàÁ‘•ß3#ºBà)\0.1X;‹ëq~UV5lĞ6›Mï™kÏh!ÿRÜÉê£³cÜ- ŠÀ´fwì}„<ß*w³4o½&šÙÛdlùQµgÏ<§ÍA—%Byƒ ?ã®\n·kx~3sÛ’ÂrÇ(Ò‹EVM|v>·¥„”“R°€Q³FEÑrÚÑßuUY_¼ì»\0°ªùÛ£ø_¸¡«ú”‡\'ÔĞø¹CĞğy~€…İƒg\"Y]·ÌgZıŞZÏnš–Nz±NF›šiU^\0®Ûï¹Ô”>fòQdË–ª\0K³êäÍ›Œl9ßo‚Yğ6P\ZÒ2ÿ§Á‘´p¤ª?s™Zq\\–V¹Æ,,G;•›ì ×*‡Gn/Ì“êáV:GiWz-ÿXÓÙá4Y­€Ó¢w›KSmµŠyl-®´›;Iüéï ­ÂéıwüàCô¾ÛU™s„ésª|»âÉ/(‹½ê´*m+Š(h¯Øq1-³/íûüèàŠëÕq!µj;óğĞâdÀÖqİ¸ªˆ=Cß‹-ıØ›¿Ãê­hóòüêªÎ®\0‰ïuU@ÿDê…lœÒüV*×ûW!Fe\'ĞôôKDÿî{ª¿ÈoIàâM7	Åû¶……Ã9tsz/©%iï¨ÓÏİ³qGW5†@#=Ri¶èĞL“ı*-uu‡Ól;R¢8ãğ÷[(0%ŸJÌÓR\rrP¬¡9ÛÉ?ƒŒó!†êÌŒX‚bLä†ñ@‰ÓÕº¹îƒÂ‡\n}Ğ\n:ö9Dƒ&FâïYzŠmŒ©%{ÙuJ [àR¼$l²Ù5Hf¨eİSRC‹ØáÄHÓá=`D#áCç°“è(\Z2åI[{ë\nR``¢qSõåU‡¹B¬ƒ·3ôéÃ¢wg™-Rè%I,£\r ©Û6¡ø‚X$8=ÂÆ/P³¹@·ól,“°±´ß¼y[ş‚ÒbÌş]²¯À‹Â§Ë¼nZb¥1»+[DŒkí âFS¹\Z{m?>*9°lXF‘³©¬7woH„ŒÛkqJCP`j‘\"™Ó<Ş’\"÷ì¿Nÿ™½}sşÓ~„zœ£¸QªŞ=üu™‚è*Ñ-=®<š]\"™¨³>\Z²Ug¨t•…Q ¢ŸçkÂuƒH`À.®O¼­ÖMÆÛ©³!…\0DAr5ùrîûÚÁğÂğë¶Eây|t0èzñÆq¬î¸ÀqõhåZ;LÚ}¼]e0(ìTp¹nîÙ¶}°l‘M•í0^áJÆ•ÂêŠ&~ÓA³È–±·\'ªŒí®P1ßK•ó´ACÎú¾‰ÑG\r9‹ñÃË\"%mãk=¶suœ1y°§¨ü^·@_E*ä’ù¡Z/®Åİ²—¬¤¯!%kş”¹Õb“ÃÓäuf÷ôÄ±«ëz¤KA\rÂ¨/=”å2S1ìö‘ù^šúeuguÓ?›ÜŸµòdöç‡ğÿøxĞÓOÚ(ÅÎtÖXßu³„:yQ6YÍ»Šä@÷mZjVÆãj…ª´b*$*³s„0B…ÛIª‚Ü€SPöÉS5I¸Ñş9)9Ğª$Éµoû*–ó!»]	³c£äsX¦•I\r}ÆTâ–Ÿ}±¤s¯^Œ55Qì²3…\\N -bÃÙeäàØHCAó÷\'³cnMè¹Ã&t	ä‚ŒB[9“Sn<¯LƒX®»ÀM­Çª,o4O`%ëkÙËÖí“ËĞšì[}ÃwíàÁ–Å‹kvÛ3²ºZE™u©‡¥Ñï±—ÎŞ}Kw¸ı®rÁ\"=\'\"w|6À÷”1V…·kT¤ÉÆUg^\' D¯òb,÷#¶”ÔKÈí`×´7´¿ØÜ³‡ucY,°¬FØwì€¥½c::Ês¢ JE}<Yß3g\ZÔ nÄL(`.Øô‘ÆbáD3®KÎ	˜İCì;)jw†Ì’A¿ËQqÄIZ$M¤:À³¯àZ\\õ‡{à;ªks[tU+X$Ì*êl)ßv	rŒWĞlqsY}Q³¹Dc>D^®ÖíÀÜ1„ùW¡­®®ŠìTšUÃˆT?ÌxŒa/)Ä€%_bU\\÷äûLf;56J”x…ªA0·Ê r•Ş¨}º5òç—ÀÇdømíØİ7’Ö8P¼‡Î}kÜ¾²Ímğÿ±”C›K6Ea¾Ä£ô…IğŸmê³D e¾sDc›ä™:t\Z«yÔÂ¦Ì’vh¤èˆ:˜í•`…Ç4üFahïªèEÎM0;‰ôª†ŸL‚”ˆËdv²	·İ1;Û.){sƒ£ju®ı\'´\'”i(Ø„°×ÉœÜv•Jwó‚Ï…{ÅO;®ÑÕÆ Æ ì–¸\ns…—¨%k¥Ã\Z„î‰@ugÎïÉxåmÅH†©d4í\nBÌŠœø1Æ?pÄã1Ñ»˜Æ÷tû~ST-ó|G­w…l™²ã‚ä•fÛ•©¶ö”\n•JÅcé›^™‡‡Tûìä<||äŸÇçÂ‰?gÀgmu\0óùœ3eÀMb%:¡tÄœªŒgC‰{2äU8\"Ÿ¼‘#Ra|œû\n¾BM 0Z2óË9uOz\0êµÃœ}ƒ™Q63…“<İtn}$–)bİûÃÚ—ôiW®¤*ÿ-Ÿù1	Íc™šÇ,ŸæmwI¾ša»ŠWßGÉCªÖVÕsû1íUÒT¢SÀ?™Rğ>S*ôœ“Í•‚zOénça¸ıTêtVjö\Z„ëìU\0)\"«hA!^™ °ûÚ_c\'Mm=¤]U«uAÉƒÙ}[œl5äÕ‹şÉ(KZğSt\Z2uÂ$‘’Mb—]Ö¯ÛŠo~B“”L~Ì—y‘ÿK„î”óçıGëjQ9È·mOİf;lu|È;$¦cUÒ¶¿Jƒj84‡ãw¨5ãnHç3â(ø`ûjWCô•ã«‡Ô/äç²)L!ùMn«z›Ğ5ÃßÇHúµH°Ÿš†öq¾Õr#úÒN8\'°ğ{Ê9¬ÔØT¤LYåĞvu] DËRã\0 /HüpÆïiLM=c*›ÜºÂvªåŸ:’XTŸ1XÅ³=M\"ĞíUU´ùŠ#lºï$ÂÊ<\\¨S¹Ş6lméE-·æJn%çWeü\'û4Ì”ãÀS§8÷.OÛëøäÏÇdeìÅÅäÀãàç!Kƒ¹ß‡ ©Öõ¥Ø,ôÍ0Ä\Zâ›ªíõãn¨o¨/¿d^ÊÛ¿	¬;-~e‚ğˆ?Pà<›f\0În˜&™Šƒš§Pl	Á`Î¨ıËññûÔëQ\ZNqÎüŞTÔÛÈ€\0%#%¡zDSa‘ùÆ&:†>Ø4ÔI?µcÏô(;±Í.‰ˆ“:IóªÏ[ioY‚8\'(]2x*”¤ŸÖM«íX¢&#;e×€DæÎºr˜,OöA!Ò+}–I™ìuzr~›CN¶´ë,m.›’Ñ%ó–ú’.rwÙÉ›²Ó¼á0^ú¥(ÕËˆ‘1\nù?·ş­écøÀrPL¤EMr†* »È`¾sæ•Ù’	íSqs&Ï;X,0®–KGêX×Ÿd¶.ğø¾jä®H\'·Jm@\nÊÒıÃÆ‘ÒUM¹ÕıÍ§8’¶6º~gß(él4•‡Ie‚\Z|Ä:rá„ÿæ~ŸkÛçN?U¶Nğf×¤V­ØY5+2ÕŒ{a9d“sÏ‡jÌö±D¿•£w-[¦AdÓÀä$Ü®4õAöê‚9:	wf’¦B7YİL êd±r¦LïËä6_àõçr†0ÉV®ıÕª‰İœ³›ó9¥£-ûfŞ¹‘ğ®Î–Éåôr©ö’S\rûNş¥÷\"~\nêİLù°%´ÂDºÆLÿóT3ãbòÉ%°IäOËÜñ’ sÍĞs	÷ò?Ç=U˜í¸ˆÔÄ[\nzLªsgŸÏİ­°U„ŒMn-î=÷€~_(Ö­íê.€( bì`j˜6-ÇcuZÄnÂ¢³ÒÍ„‰·¯>³íeşhvÔ›ìbMJÈ½JØbØK¹‹uİTu<9q7ÍÜò®Ê‹ËÌqÛ5Yiéæ2ˆ«Åº±ï^l,¥o´q”CÕ–Q–MšÃbS\0HæœË*½ßiÀwÜ‹~(ªÅM3æaò‡.xÓê—;·Î.	@|vÖSª›tÎ{mZ~–—3èşÊÌÃ.™Ëåî\Zu5%&Cü%ü<O\\“‘R±¨ƒ!’Qš•Zpò˜,D‘a†İ&(Æ—`ƒÍ¥Eˆ6@““s¤bk„Ç¥¼`x0xñX`·W†Ã:eb„?‘Ü‰fˆÑ²tŠÖá!õğğ@:ÊıP0aiHñ¡‘º1œz[\0«?ûòv©Ì×äy2GP§{J=¨¹Å‡Å‚$ñ»ŒshÇŞ…Á]´ëòˆ‹Iù8öõ§*RiüñqkAr›ğÆËÜÛ\\”)Wø$azËÆƒˆB¬F˜tÑV<}¼àq®™²1+’¯ŠÆêD(ntÍÙ~²Ö:ì,i9’3·ÁRJ,d,Øâ68^\'à›[Zã–“g°–âØcŠª)XÚJ«²»N™VXZFÉçš]ø‹Ä)†KëÚˆ=<TÕbáæ4İgß>Ğ¹ËÆİì“ó¹L«Ñèü¡Ï‡¾ªI°Ş–~ÅÈiCå!¨·×¼Ã\0u]¦ıˆã#VTÖ·Çj“¥ßÅ†£v‚\0\n‘©²&´QŸvJZË^·‚ì÷FŒÉ•èİƒlM›§]É,‹ËÃ2Ÿ%ë²½¸EÕæxní§Öè³ó`åÍoP‹ÿíßù¢MáèfTÄáF\'¸dâ?º]g>ŞÄ[™GyYÍÆ°|B> ƒüßDy]ÕíbİƒO 	_Új„ÚüHnÃ)^£J÷Hš?Ğ\rº\ZH&\0Ã%6wc5§Ì__Õädÿ6_ûC¤ O`Äbeï6ÿÖ7Î§·;yrÃ¥?X^U#up÷Ôa›=öXõü·tbò5½h­^´×Ùˆ”¾QµÉõÛfgx¯¸«ü‚Æ;Œ’÷îÒ5téª%«zR²/+hœz‡S<JófU$÷£q²H#ÄA8ÔKk¸ÖããAWÕ5œù)æe†ÀüÙoĞ¥7>b¬­\n9MT+ãº‡£±/V°êœ²’‹ÑĞ½Yt	{n’anöºãØµ‡M	ú5«Vîmƒ^Üõùğ-ña®‹G\'ä¤ƒô©®Ìì¹JPõSôå¿òıÚ—&qîĞiêwí9ù]È—®Ä{ìÓ¿pÜ/\nİ‰¬“¬Q½¼¼\Zİ’ˆÛ3j7Ø	¤‘¬®kXüŒ\rMf\'Œø<Á£²•m¼}OSú¯Óò}#E[A¢Åª…áÕ»ñzë+ïgõËómóBúê³j;5œcƒ–vd?ü`MiWÕà¶#+„ˆ	4¥!ºĞõ»_ÛÜÀòë€dnÔ><™|3ù±ÍËƒ>àˆÇ_2Z«åjnBÄlí]àÓËÊÌÌ¤¢8n&u\nÉÕG,¥\\}D/;2EØºrHa[©¶SÊ§k”“DØ¢# ´1ò! ¨¬m~›ÕÆÂ‰ ºC;9‹újİv<”5C{·¡qpÕkZ«cµ*pä0À		õÀ.(¡ÇÂíõØ1™öÅd;¦ğ¿MÀccX±)4·¯vb¸²Y:ë«™J¨T%†¼Ê?gxÃ4ªåªÊ¯qiÄ‚5¾kÔÚ	åg5\Z±kç1şœK6ØPŸgºÈ†Âe\0;¹ÃGd”{¤0³·m²¸ÆµÏû-ùìôĞ>¨|¹¼JN™ÌãÆª‹7ç²<(0º˜tt=µ)Ó\r1Œ7Urş^#Õ¥ƒP›š-[«mõ(èÂHÕ	çfæ¦zv8:AÜyæA„§:#s»ø×ävD\"rüPÙd‹cì«A™4W1ŒŠİ\ZB‡\\%V”2D”4Õs;…LÖ=ˆ~§‚ÛĞüøõÔŒˆÑEºèÎ\0Æ\\¤€îÂ½”#œi£V!¯ñæB9²I•n/òñ+ìÿ’/ùíú6>X$%_­ı¹ªÑb\'¾ØMÜÃÒÜjMHs{İ +İÛ»òÇ½ºç€×0Vf`hUĞë+À#ˆ;x•‘u¥gDæ@6²€†sÎ6\'³6Æ66uÚÓ-¤.á<ªÛì\"_H4­7ã mÄõÑ\\]¯ó	™à¡Öˆ>—ÈM—É(8\n–É$SV—è^•—7£-‚}ØR°‰Ë«è‚‹‘3¶í(ŠA[f×äVÇ²m\\\\IyõuÇÕÅ|la@âa*“U_Àk~t šÌš/øc0-²ĞÇµGÍmR£«:»‡¶¸à÷Óm0e>Ô3ßù—öZ|ælùx\n#•Mù]˜iO	îVx.şW—&|‹lz\\RfÎ…İØìx\n\"`ä¡Uä\ZíÙ•Ew¸™p¼ÙuDMÎèïfqe|@nÅyvÖ‡‚ÍÜ_(ÄÊÊª5÷à_¶ñ»X²\0‚¦êNÜ„2¥xÈ (;:ÎlÒf´?qĞæéø¬Ş\0õÄör.h%\"::*ùZ÷`tWXÁ3Gƒ¢$ÑC¢ìË¢XÃVS2å3¢‘Ì†´—MO)Yó>Ÿ«j¾é„ämˆ-™—»µ–³pø´YãV»t–ò eŸcc—ºfÉ7“˜tEäˆ€9#1í=7ã\"ÊdZ5ä¦»Ñ=d_á«fów­WúoÁßªùÆ\ZÕoî=kYn‡Éti˜&¾şÂëÚøE´Ï{\0Ï»ÔıœÃwJ±X×0³oeë\\7¬Å]Â¹Íj¬pzØ‘µµ\"Øé(ÿÓ`ö”u¶ª\Z¼£v?YÔUÓÔjoÚÙQª0Eé5Î€:²o\"Xü9YÄâ’PÕS¼×†<s\0	ùAø8#€ ]äoÙ}L¿ÿ_\'³“ÿ°C¼§0[cŠÀ¬Y§4‰q®œB©\0g}y‹¶ÆÆÔ›U şªF.&(‘‚¹.ø3ºôò±’_”mVaĞ+WñC¹˜ô	T\r*ˆ\Z|%é¹¼D•V@‰œfùQ fÇâ‚*uÕÃùÛæ“)‚\'ŠwRË_E\nØ€cµâ:çìFÍêgßİqåíxB¯KM:n€gš·øUÇV·¶ø|ÊÙ¬z\nÒñ,|j6bm:<<T.šZw //5­¡ç7Ë#¶ûÌº”&Ó!æçÑI\'\0ƒö†ğpÀs€Š3;I½¸vCq0©°_¦	¿d#ßX¶_ßİÏõÃtK0Ë¤KËışö²RïõNÑŞ)JÔã£¤åe™Õh>3Æ¤øÌğO¤‰#\Zk½À¤™û;ä¢0CT³íkûÓ:_Ä¬\\$ø¸ˆ;Ì\0ßš«ó[±«É?[œ‹JHÏ¼Åv¿œÊmÀ&8oƒÖŠ&z£úDîJà½.†#	ªwBmGÍı\Z¢·¹ğ–¡ƒòağ\\9£yÿ+x†çë&ö|ñ£à†S¨sgiX¨Á*ä‡‘0D¿MŒÈ‰£L·½>v:ƒÕÙ-=.1Á·&TËöA#‚çŞqt”;Şç}ø\"hH\\*şM•”YUˆ«šôÚÛ˜Cë‰_*ìès:OYŸ€ZûÚm’cf?(Ô¹>•œ¹Ï\rãŞ ´6W\rX7Œ­^†ñ5,_­²„ƒ%¡ì)à˜´Vì Q-ËÛŸ‘K{LPµ\'|XA™ªà^®¨º‚uY¬ëÈ=Nh#İ#¬Û¿@mnÕ7·¯1ÿSÂ¨ù%(lætK	ê-’ßWO\"tYÑ×şğäÖ?àç x[Tz@#f£)ÅŠ¢,ï‡ô¹ÈÚä™§¡\n›¬jH”ãÒè¥úíŸ\0ñßú°ß‚Ç{ÿö‹/¯n¬)úÂõ4‡zG½§~ÑÜä«· n8=ù¥º³†ã³b¹Ù¿ùşÆNoCÅÄ½k…óÃWgÈ-3Ë±û@9ŞbU/˜Èa¤îŠ›L‰ñFyªñ¥ÃˆãCè4+|DˆFL ‡™~ºƒ&q¤ˆ­©ÈÁ%Bã5ûê…Î´£V„Ê2E±%ÂÇÇ Ã‰Õ\r\"ª;±$¬R0oCÁVhf“9…=Ï¾À\n¹ Qu¿[ƒÃèv–¹MwTn…Úº§‚ò=:ßËë‰CdÃq¬WâW÷”œ6mÔÔ‹è2\rø0cvZöO¼º¹FË5¡Q”­ò•@B˜ŞªĞ%9¹üRLu)!®{XÎ‰Û«}µ?)&iÂÖcfkŸš}/ŸËA+FÁ0Ù3ok®Ñ²#\'­mlHB¬6İ«×]´½v/’[CyJ‹¸Ş0sé¼ããnl@ÕÌH?.ÎëÂË´_+q#¢aø>6¤^6ïZ*onåŸû~òqÙ5D–)/%×SïèhJè…»s|jÛŒ/Şâ^“dC¡u=§‡øpyâ“]Ö³®jFÎ›ö¯94şV—ÆšyšÏĞoõÍû¹KW¢“GxŞ¤­HwãIµUG\"ÓKõ$â©¬|aÖ#İÙM$¹+ÕRğ{ì	t}ÁNâDW«¸G$é°Pì–£ŸšÕ¸¬n,ö5¦æÏ‘si™­FAòuÙ”õ†|¨x$Ğ69êG@O©†!±ÏH>çx£6³†\"\\E\r¦ÇŠiÆ©V‘€vÂİÆ7ÿø—\ZN³¾¼ÍÛ=†óÚ„Á\0ãîÇººı±ªo=uwğİaÍ¯3²\'¡Ç`YÔ/gİ¾8¥ÙY—ô\rŞ¶Ò¿v\ZÀúYÀ¨$âJßß—í5Æ	|Ï‰çîl Uç‚«˜åahA\r/UnÊ»]…¼U§JØ‹Ï;÷ø(qØ–:+OØ|cÚøÈlÕ~«#±$„¦^à£îÖ\\K{ƒ­óUÍ,@Å¶½(Ikñ|æ²¯×¤çìï?È1öd–vĞ‘ñ^	9Ø3ß^Bú0ÈšÑ)wH»0 [U‚¤Ñ6³QW¤gXÔ‡{1Òµ¾|ËUº³/®/,»¤˜9J¡d³$ì˜s Çsn–GÅX¢‡Š#ıå«‘­Š¹gt{…on—0½Rû§ïuå)ìSôoXFª\n/Tõi­P¾w¡¶L Z«µVºªjmRæ«ñIš)«âø˜éëæ¾‚ÍCüÊm¥QÚyŸrÏQÄ¹d‰}m»}ê¾ònz|`‡hGT1\\?ùˆ5<…º®lr)Çm\rcˆ­IÂv>åêƒ ÄeM¼;îK’mÊË€²\r…äîâO?mM–œ¢j2+5³¥Ğ×¶TÔŞ¡Q¸\næ>ªAÔ¦zìSZ5~j<lSr&?2Z\rÙæ©ı^3Ó‰ö‘<İ<{ıŠ’Şè,œòÃº¶&³‰Ü\0¬v÷LV¯ŸüºÄïÕÅ\ZoœqC:¸ÇŸbGœë†\\U¥÷‹ÑÕŞ$O«WyÃm£ƒNGö©Nû/Bï‚Fõ”~qY*ıÀ„˜,)~±Ù(s,Ú…‹µÑŞ‰ò;ÈÎ{•â£\\­KüäùQ‰“I$ş\0ê¦ÿ…¶Ş©—-°Ñ~Sğs«í Z¤I+–4–¾(#|uÌrÖ«ÎCñ€`¤hÁŸ@õPÌÕ5‘üÃøsêL|_ÄÙ¯«»O6¶ÎY”³â^!ĞÌá†Šä…PÈøuÃm\r‰mâ÷aOİh&\"hâD‚3 ?}Ÿ>}‹y\nâ§O;ÛÃâgŸ>ñFŒÜxøq…ó è¶Hm¦{:ÆÓŞö	áˆÍuâ4i|ö\\	ØÒggP÷(Ğ4£§ñÖC/xp‡Í²$±3èH±?q2\n+D®V¶$°Ô‹¾™×N=OØuaÂÜÒYY7¢Ë„÷ñïùš«*ÔU¡¿~|õ²„†=v	²5Å’Ï	}¨rı_8äûŞ);ÿ\Z¡SáAtD\'MxîT°i¿İ}Õì¶Áğ)föB ÒÄŒÉi˜D\"€ÌŞ+e|(ÍË9¶>‘“_•\\[Ô û¨[ÒYÓêPd£4Ó¸Á#c4™§é+à³ôŠ¥VVñC¿\r‹+è½v“»ï³ÀƒmÁP3OÅİPûPÒÕäµ~ÇS/§W/Âí‘Mv\nÓ¡+ øgã¢ÓÁ³[{¸á\\Ña‹ïàSÈ(\'ãàÜe£¼½PÀqh`Úâã/¯ú T±7-£L“‚6ş\\½Ñ)TŸü+V_7¹kÍt)6—ø”86ñKõ™Û[$;NÖ+ÚCKBğgø\"6‰\'”¨â¿jXª@(yu&!T÷·l‚a¿jşHo2f9Ö™‰P7½ìi½Wäª?¨NÌæˆqØÕ­ƒgMVÎYóLÕ{sO ú[«M]\r¸ªÊ(UãqcôĞ½Qê`Ñ©úÌ6ëèØC­v‡\Z=oöG©n^ãTÃÙT]s¬\ZĞõTWÿ=ğê\"Ñ[öI\rÜb‚ïÉÒJÅè—än„—<GãŸ \'Të‹u9ƒ óù~¤Øk T°Î\"/À[øB&R“Ÿ«Î©|‡Ş¡×Rù”tëuõV×¹‚5;\ZbÍ2@S¾Ò\rQ\"¾ouï{5½BÄ×ŠsyXÆ\n÷¢¿Ê÷©ÄÇ¥fÂïó¢j<—¹0/¤q£8öww;q)Ûß_¬í÷Æ_VçG8šrËŠôTÃ\'œ¶|‘2wiGá>™¤ÒI³´Á§G5\\=\\$Ø-t¸;ÉÔe¾Ì3|:W?)Õ…€kº<Œ…2>mqy?ÁÿeŒz¬Ûƒc‰¾LlÕbÇTrpÜJÊíè©:0Ä‚°G‹?Ğ¯ú.—û-”=âÈ©Eóİ	Y3şôràm•Qƒ\ZrBG£»¼½Ñí¯Ñ:Àş0ºKš½£„|æò@»Õ•£`ú‡Àò^´ãK‡¤z³b‘âP—»ÏdÙaïLÌ;ˆAóKl\"híeË„¡#¥ôAA£)]$Ñd…v½—‹ñsÚ„†öî¢d¤÷£;CZÚóÓí*;H»ºyŸï¤8Zâ/(\n’_Oa÷Ê4çz§¬æŞú»ÀjÅP”PªãSc\r´ÅÉ<áOñbg&\"Ğ˜R¬_,„\"”Êk;’§İ¢:aV\0¢ş‰Vğzc´Uâw§±£®ì§Xh¾Ì„È‚ğ´8Â*ºÙÃğ¾ˆ}%3+Z‡fÄV®|@îĞ}îS+PxØNb8•Ë€©Ò6nËñ.;©]œ¬R6GÔşéCÄN†)Mè_½m>S°Î7øà\'wï^òõNò”ŸP^¸WS<íbCÃ‹BI×Hæï5Dá/1Ûó¼GÃŠ¸{çéããõJô§GÏ¼Ku\"õosÚ\n\'wxtğ·ìşñË…0ş›cüÑ\\çËÖñG7>Ÿ|tn…ã¾4ëË¦­ÇrZN¾k±D£Ù)5d‰»L&Ûæ‡{’2nu—`¨²O0”ˆ—\0mäcÜV?UwY}š4ü\0EÂäŠS¥94ç>«ê2ÿ~)\Z)Moü¤E?<œÁoxêô­¼wL@¬0vÎœ•3¨˜bûØnìm+zãX÷ş·0Ü\rïè·¾’>x‘|çŞÙÖÁm¢3jPå¤hÜxrssN1Ô·É÷5l˜å\Z{goµ.99Ô/Æ»ˆ÷ú–wä»/¯õ-ëô^F~“İÇŞ°¬®Ó£vBßı;?x:R“«]ôè-^İ¦7½R£4¶éá¡õü/Æ±Û%=¶Ï!\r’©Oêè¤«³©8GŞÛ?ÛjíJ¬îó~ÿBnŠ ¿ÅuÅ»\'¾­İpzKîàİ[ à35ôE¾Ó‡şÛL´|p«/Mø^vw«²¿¼’·ÜÕ§Î^ªŒ¥$ÑfÍ*Ydœc¾YmCÄ¨ü”©7Îru^}J¶Úƒs®ú’LŞÿÉËòô{¾±®¬Pğ@>6æ\\}C™n¹ÈfÇ¾ÉOu©L=b©Š,‘™é,ûH×E¾µ¡Ô¾7ãœ+@÷‚ÊÈ!:YŠ9ŞÖœ¤}BTB¬¹N=‘ûhÙ`ÃiL)õıZÚŸ»ê€q|J,ÛbÄ?»~ş2¡¤g)\'ª££¹e0Õ}Äu@W(3`#Ê	íNì¤q¿£‡à>ƒi¯‹•rÜ>…jÍ¥T°nìN{ït¹îÿ©ûÖô^âS¹úl\"/JŠ;ÑÖ	µåPk½\'›ãâÆ±C£•ğ!wLuÜ/2c8\n¿ºRÍİñ[îöz„‚‚å`@óQßMùÿÊì‹ï‚ºmC‚Q·×ìËq§ò!×^3îlõB1ó¦ÁÉuy{OC½rŞßë}rï/ÇÇüê0Ş\rä\n[Ø@e7$©à`\"?)ƒ)|Êı\n†b1®Ç:3Ïü±äÂ§7™>×›]°cÏ1ÛœœÓyz\\İšC|Ğåc®ÖóŒ¬Èjø5%nÙ}ú(\0tr\".(ŞŞŞ½Û%ı1º^Ä…¹×)\"~«U_ğ´BXW½°¬¾ç…b¨à{c*C“ªÂ¡Âª} Ò°-R/\"¼G÷ÿÙ:k‡‹õ\\EÑ®ÕšÈï¾b³ë–%åñïi6”«•W¯Á<¼ni-¼™<´­Z?Üo[Å¤@¨şÚ÷+äxúÁfÀÎµ’ær©«> – ªÁ£~ãé\Z¨ğ>¢”Ï1É‚C¿h\'kû¦­VAø=Ìät›w~Ô^U‹¯Î’M}¤üà©šZËì¾ÄkXW¥6õI«)o\\|ı×¨¾v{\0y\r›ÊLûJyë\'¦îÃ‰z£ œ\\ñ\r‹UˆÖc1ó|©SbO7ê1Å¦öË.Ò‹UE¼æï_»óìêÚ”PW¦®kŒÈlJó[·Ì±I™¦…½à}ü?ş\'G×-³¤¾\0\n‹ÇÒ‡éı·1—	MK|EÜ”8R½™Ş‡ßqMhvz?‘Šö\rçî¸ŞUf×V¹nÇóÛ¾r·y\Z\rlèÍØ@˜Ş?ûsh…›¤Â¦ßcÓq].AÎì@…ßßªÚòz²Îx@WíÑê¨|4(Ö­[»Ö¾\r\\j:ØN\'¨|Ô}Ë2>m¦æAÏHçÍ½wì‰X!åKdĞ#O¦l6şJ¢ëí)\\{\nô]d³o«-0*ìáÍ-kgÜÍGã©>¨àè;dD½ñÃDè:g7çÆ¬š_• 9ú™J.ìğI÷–›ºéÓ_v£\rÏ»[ƒ²©©ŸIé»U†m(WMi¶«heV`[Â¯Ú«<\r´\npè/ÅÇgtãçéZ¶ú«2[EBç³ß#Éõe©}LŸíG@«½Ä ~\Zïÿ\0',1468278946,NULL),(11,'I1y6hvF3Z9dt','phabricator:celerity:/res/defaultX/phabricator/bff6884b/rsrc/js/phuix/PH-6NVV3j7P2h_k','raw','JX.install(\'PHUIXIconView\',{members:{_node:null,_icon:null,_color:null,setIcon:function(icon){var\nnode=this.getNode();if(this._icon){JX.DOM.alterClass(node,this._icon,false);}this._icon=icon;JX.DOM.alterClass(node,this._icon,true);return this;},setColor:function(color){var\nnode=this.getNode();if(this._color){JX.DOM.alterClass(node,this._color,false);}this._color=color;JX.DOM.alterClass(node,this._color,true);return this;},getNode:function(){if(!this._node){var\nattrs={className:\'phui-icon-view phui-font-fa\'};this._node=JX.$N(\'span\',attrs);}return this._node;}}});',1468278946,NULL),(14,'YkrcBj.ou007','phabricator:celerity:/res/defaultX/phabricator/db7e9c40/rsrc/css/applica-ocl7uHfQ.7Dy','deflate','•TÑ®¢0ü³½EÑò´Wå?ZZ ÙÒ’¶¬ì’ûï[´U\\wCbLÚÎÌ™sæ|hjÚ0­[\n0Ê”J¶‚ô\r\"„‰Fë¦Â¯÷š®(ç}:paÄT0Ù…M—ÖH•LÀhg ÖHïM‡†«¢(R,¡\nFö²–œ‘`õ™³Ó÷t&Ş[ÈñPˆ°VÃMÓy˜AÓÏœÏ\"ƒ0§ı(0\nÃo3X.9G¦pşóRÊ^`ªŞĞÎ\0ÄY) beeÒ‘c3P8Efûìÿ©ÎE\"ÒÿÿÓFÍ\rxÏÙ¾ëEİò\'U—ĞÁ§fÆôÖ=© æö¥÷üüy>Ï7†¡1ñ£LZ÷…\\èàÄ’À˜ĞFµ¹aRèñªf¿)Œ,RêfÊ™  \ZÖÃ.\ZÀÒY/x1P€³ŒÄƒ×šÆêWy¸9¬±OB°§òN1’¼–4âù^TÓ™/ŞÅÇíñníì¼êtlÜÚëo€AŒOáF6ĞõfÚ™V{Œ¯\rñ*÷ë”mOq:•‚ód¿IFÔ;x}€¦F8Qğl¸Š¾ƒ’bø9`’Q$Ãç›®±v¨9-¼Ó9*°b„Pqo7Tİ~Új·Hï{õ*­®‰QTlRgåTªÜöîœe<†d*v}Ø‡øğÎÚ\\Š‚•OÎúnù´hvíÍd´¾.~›Imµ˜_Ü.Y¦rN}Bq[ºÓµwb=DüiÃNú“8I’Ó×',1468278958,NULL);
/*!40000 ALTER TABLE `cache_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_markupcache`
--

DROP TABLE IF EXISTS `cache_markupcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_markupcache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `cacheData` longblob NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cacheKey` (`cacheKey`),
  KEY `dateCreated` (`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_markupcache`
--

LOCK TABLES `cache_markupcache` WRITE;
/*!40000 ALTER TABLE `cache_markupcache` DISABLE KEYS */;
INSERT INTO `cache_markupcache` VALUES (1,'fo7P4TuH2YZr:oneoff@16@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-note\"><span class=\"remarkup-note-word\">NOTE:</span> Any user who can browse to this install&#039;s login page will be able to register a Phabricator account. To restrict who can register an account, configure 1Z.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:103:\"<a href=\"/config/edit/auth.email-domains/\" class=\"remarkup-link\" target=\"_blank\">auth.email-domains</a>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"9e0716c949be\"}',1468278984,1468278984),(2,'rVwVLSGl.Y9K:oneoff@16@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-warning\">Examine the table below for information on how password hashes will be stored in the database.</div>\n\n\n\n<div class=\"remarkup-note\">You can select a minimum password length by setting 1Z in configuration.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:68:\"<tt class=\"remarkup-monospaced\">account.minimum-password-length</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"9e0716c949be\"}',1468278984,1468278984),(3,'nHato9WQIj8d:oneoff@16@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:3488:\"<p>When a user types their LDAP username and password into Phabricator, Phabricator can either bind to LDAP with those credentials directly (which is simpler, but not as powerful) or bind to LDAP with anonymous credentials, then search for record matching the supplied credentials (which is more complicated, but more powerful).</p>\n\n<p>For many installs, direct binding is sufficient. However, you may want to search first if:</p>\n\n<ul class=\"remarkup-list\">\n<li class=\"remarkup-list-item\">You want users to be able to login with either their username     or their email address.</li>\n<li class=\"remarkup-list-item\">The login/username is not part of the distinguished name in     your LDAP records.</li>\n<li class=\"remarkup-list-item\">You want to restrict logins to a subset of users (like only     those in certain departments).</li>\n<li class=\"remarkup-list-item\">Your LDAP server is configured in some other way that prevents     direct binding from working correctly.</li>\n</ul>\n\n<p><strong>To bind directly</strong>, enter the LDAP attribute corresponding to the login name into the <strong>Search Attributes</strong> box below. Often, this is something like 1Z or 2Z. This is the simplest configuration, but will only work if the username is part of the distinguished name, and won&#039;t let you apply complex restrictions to logins.</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Direct Binding</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p><strong>To search first</strong>, provide an anonymous username and password below (or check the <strong>Always Search</strong> checkbox), then enter one or more search queries into this field, one per line. After binding, these queries will be used to identify the record associated with the login name the user typed.</p>\n\n<p>Searches will be tried in order until a matching record is found. Each query can be a simple attribute name (like 3Z or 4Z), which will search for a matching record, or it can be a complex query that uses the string 5Z to represent the login name.</p>\n\n<p>A common simple configuration is just an attribute name, like 6Z, which will work the same way direct binding works:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Example</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p>A slightly more complex configuration might let the user login with either their login name or email address:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Match Several Attributes</div><pre class=\"remarkup-code\">mail\nsn</pre></div>\n\n<p>If your LDAP directory is more complex, or you want to perform sophisticated filtering, you can use more complex queries. Depending on your directory structure, this example might allow users to login with either their email address or username, but only if they&#039;re in specific departments:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Complex Example</div><pre class=\"remarkup-code\">(&amp;(mail=${login})(|(departmentNumber=1)(departmentNumber=2)))\n(&amp;(sn=${login})(|(departmentNumber=1)(departmentNumber=2)))</pre></div>\n\n<p>All of the attribute names used here are just examples: your LDAP server may use different attribute names.</p>\";}s:7:\"storage\";a:6:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"2Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:40:\"<tt class=\"remarkup-monospaced\">uid</tt>\";}s:3:\"3Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"4Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:41:\"<tt class=\"remarkup-monospaced\">mail</tt>\";}s:3:\"5Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:45:\"<tt class=\"remarkup-monospaced\">${login}</tt>\";}s:3:\"6Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"9e0716c949be\"}',1468279008,1468279008),(4,'.4EOg8Xw88WD:oneoff@16@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:189:\"<p>To search for an LDAP record before authenticating, either check the <strong>Always Search</strong> checkbox or enter an anonymous username and password to use to perform the search.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"9e0716c949be\"}',1468279008,1468279008),(5,'2SwALNO6Yg70:oneoff@16@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:315:\"<p>Optionally, specify a username attribute to use to prefill usernames when registering a new account. This is purely cosmetic and does not affect the login process, but you can configure it to make sure users get the same default username as their LDAP username, so usernames remain consistent across systems.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"9e0716c949be\"}',1468279008,1468279008),(6,'H_JFmx5tn1ir:oneoff@16@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:253:\"<p>Optionally, specify one or more comma-separated attributes to use to prefill the &quot;Real Name&quot; field when registering a new account. This is purely cosmetic and does not affect the login process, but can make registration a little easier.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"9e0716c949be\"}',1468279008,1468279008);
/*!40000 ALTER TABLE `cache_markupcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_calendar`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_calendar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_calendar`;

--
-- Table structure for table `calendar_event`
--

DROP TABLE IF EXISTS `calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `dateFrom` int(10) unsigned NOT NULL,
  `dateTo` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `isCancelled` tinyint(1) NOT NULL,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `isAllDay` tinyint(1) NOT NULL,
  `icon` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `isRecurring` tinyint(1) NOT NULL,
  `recurrenceFrequency` longtext COLLATE utf8mb4_bin NOT NULL,
  `recurrenceEndDate` int(10) unsigned DEFAULT NULL,
  `instanceOfEventPHID` varbinary(64) DEFAULT NULL,
  `sequenceIndex` int(10) unsigned DEFAULT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_instance` (`instanceOfEventPHID`,`sequenceIndex`),
  KEY `userPHID_dateFrom` (`userPHID`,`dateTo`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_event`
--

LOCK TABLES `calendar_event` WRITE;
/*!40000 ALTER TABLE `calendar_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_eventinvitee`
--

DROP TABLE IF EXISTS `calendar_eventinvitee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_eventinvitee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventPHID` varbinary(64) NOT NULL,
  `inviteePHID` varbinary(64) NOT NULL,
  `inviterPHID` varbinary(64) NOT NULL,
  `status` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_event` (`eventPHID`,`inviteePHID`),
  KEY `key_invitee` (`inviteePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_eventinvitee`
--

LOCK TABLES `calendar_eventinvitee` WRITE;
/*!40000 ALTER TABLE `calendar_eventinvitee` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_eventinvitee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_eventtransaction`
--

DROP TABLE IF EXISTS `calendar_eventtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_eventtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_eventtransaction`
--

LOCK TABLES `calendar_eventtransaction` WRITE;
/*!40000 ALTER TABLE `calendar_eventtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_eventtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_eventtransaction_comment`
--

DROP TABLE IF EXISTS `calendar_eventtransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_eventtransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_eventtransaction_comment`
--

LOCK TABLES `calendar_eventtransaction_comment` WRITE;
/*!40000 ALTER TABLE `calendar_eventtransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_eventtransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_holiday`
--

DROP TABLE IF EXISTS `calendar_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_holiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `day` (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_holiday`
--

LOCK TABLES `calendar_holiday` WRITE;
/*!40000 ALTER TABLE `calendar_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_chatlog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_chatlog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_chatlog`;

--
-- Table structure for table `chatlog_channel`
--

DROP TABLE IF EXISTS `chatlog_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatlog_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `serviceType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `channelName` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_channel` (`channelName`,`serviceType`,`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatlog_channel`
--

LOCK TABLES `chatlog_channel` WRITE;
/*!40000 ALTER TABLE `chatlog_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatlog_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatlog_event`
--

DROP TABLE IF EXISTS `chatlog_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatlog_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `epoch` int(10) unsigned NOT NULL,
  `author` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `message` longtext COLLATE utf8mb4_bin NOT NULL,
  `loggedByPHID` varbinary(64) NOT NULL,
  `channelID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatlog_event`
--

LOCK TABLES `chatlog_event` WRITE;
/*!40000 ALTER TABLE `chatlog_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatlog_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_conduit`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_conduit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_conduit`;

--
-- Table structure for table `conduit_certificatetoken`
--

DROP TABLE IF EXISTS `conduit_certificatetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conduit_certificatetoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userPHID` (`userPHID`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduit_certificatetoken`
--

LOCK TABLES `conduit_certificatetoken` WRITE;
/*!40000 ALTER TABLE `conduit_certificatetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `conduit_certificatetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conduit_connectionlog`
--

DROP TABLE IF EXISTS `conduit_connectionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conduit_connectionlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `clientVersion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `clientDescription` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_created` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduit_connectionlog`
--

LOCK TABLES `conduit_connectionlog` WRITE;
/*!40000 ALTER TABLE `conduit_connectionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `conduit_connectionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conduit_methodcalllog`
--

DROP TABLE IF EXISTS `conduit_methodcalllog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conduit_methodcalllog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connectionID` bigint(20) unsigned DEFAULT NULL,
  `method` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `error` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `duration` bigint(20) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `callerPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_method` (`method`),
  KEY `key_callermethod` (`callerPHID`,`method`),
  KEY `key_date` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduit_methodcalllog`
--

LOCK TABLES `conduit_methodcalllog` WRITE;
/*!40000 ALTER TABLE `conduit_methodcalllog` DISABLE KEYS */;
/*!40000 ALTER TABLE `conduit_methodcalllog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conduit_token`
--

DROP TABLE IF EXISTS `conduit_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conduit_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `tokenType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_token` (`token`),
  KEY `key_object` (`objectPHID`,`tokenType`),
  KEY `key_expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduit_token`
--

LOCK TABLES `conduit_token` WRITE;
/*!40000 ALTER TABLE `conduit_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `conduit_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_config`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_config` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_config`;

--
-- Table structure for table `config_entry`
--

DROP TABLE IF EXISTS `config_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_entry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `namespace` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `configKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`namespace`,`configKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_entry`
--

LOCK TABLES `config_entry` WRITE;
/*!40000 ALTER TABLE `config_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_transaction`
--

DROP TABLE IF EXISTS `config_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_transaction`
--

LOCK TABLES `config_transaction` WRITE;
/*!40000 ALTER TABLE `config_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_conpherence`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_conpherence` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_conpherence`;

--
-- Table structure for table `conpherence_index`
--

DROP TABLE IF EXISTS `conpherence_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conpherence_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `threadPHID` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) NOT NULL,
  `previousTransactionPHID` varbinary(64) DEFAULT NULL,
  `corpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_transaction` (`transactionPHID`),
  UNIQUE KEY `key_previous` (`previousTransactionPHID`),
  KEY `key_thread` (`threadPHID`),
  FULLTEXT KEY `key_corpus` (`corpus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_index`
--

LOCK TABLES `conpherence_index` WRITE;
/*!40000 ALTER TABLE `conpherence_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_participant`
--

DROP TABLE IF EXISTS `conpherence_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conpherence_participant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `participantPHID` varbinary(64) NOT NULL,
  `conpherencePHID` varbinary(64) NOT NULL,
  `participationStatus` int(10) unsigned NOT NULL DEFAULT '0',
  `dateTouched` int(10) unsigned NOT NULL,
  `behindTransactionPHID` varbinary(64) NOT NULL,
  `seenMessageCount` bigint(20) unsigned NOT NULL,
  `settings` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conpherencePHID` (`conpherencePHID`,`participantPHID`),
  KEY `unreadCount` (`participantPHID`,`participationStatus`),
  KEY `participationIndex` (`participantPHID`,`dateTouched`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_participant`
--

LOCK TABLES `conpherence_participant` WRITE;
/*!40000 ALTER TABLE `conpherence_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_thread`
--

DROP TABLE IF EXISTS `conpherence_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conpherence_thread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `imagePHIDs` longtext COLLATE utf8mb4_bin NOT NULL,
  `messageCount` bigint(20) unsigned NOT NULL,
  `recentParticipantPHIDs` longtext COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `joinPolicy` varbinary(64) NOT NULL,
  `mailKey` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_thread`
--

LOCK TABLES `conpherence_thread` WRITE;
/*!40000 ALTER TABLE `conpherence_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_transaction`
--

DROP TABLE IF EXISTS `conpherence_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conpherence_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_transaction`
--

LOCK TABLES `conpherence_transaction` WRITE;
/*!40000 ALTER TABLE `conpherence_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conpherence_transaction_comment`
--

DROP TABLE IF EXISTS `conpherence_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conpherence_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `conpherencePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  UNIQUE KEY `key_draft` (`authorPHID`,`conpherencePHID`,`transactionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conpherence_transaction_comment`
--

LOCK TABLES `conpherence_transaction_comment` WRITE;
/*!40000 ALTER TABLE `conpherence_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `conpherence_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_countdown`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_countdown` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_countdown`;

--
-- Table structure for table `countdown`
--

DROP TABLE IF EXISTS `countdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countdown` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_epoch` (`epoch`),
  KEY `key_author` (`authorPHID`,`epoch`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countdown`
--

LOCK TABLES `countdown` WRITE;
/*!40000 ALTER TABLE `countdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countdown_transaction`
--

DROP TABLE IF EXISTS `countdown_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countdown_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countdown_transaction`
--

LOCK TABLES `countdown_transaction` WRITE;
/*!40000 ALTER TABLE `countdown_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countdown_transaction_comment`
--

DROP TABLE IF EXISTS `countdown_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countdown_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countdown_transaction_comment`
--

LOCK TABLES `countdown_transaction_comment` WRITE;
/*!40000 ALTER TABLE `countdown_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `countdown_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_daemon`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_daemon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_daemon`;

--
-- Table structure for table `daemon_log`
--

DROP TABLE IF EXISTS `daemon_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daemon_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `daemon` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `host` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `argv` longtext COLLATE utf8mb4_bin NOT NULL,
  `explicitArgv` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `runningAsUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `daemonID` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_daemonID` (`daemonID`),
  KEY `status` (`status`),
  KEY `dateCreated` (`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_log`
--

LOCK TABLES `daemon_log` WRITE;
/*!40000 ALTER TABLE `daemon_log` DISABLE KEYS */;
INSERT INTO `daemon_log` VALUES (1,'PhabricatorRepositoryPullLocalDaemon','9e0716c949be',29,'[]','[]',1468278905,1468279025,'run','phd','29:t3iubghh3'),(2,'PhabricatorTriggerDaemon','9e0716c949be',29,'[]','[]',1468278905,1468279025,'run','phd','29:ptsxdbtlr'),(3,'PhabricatorTaskmasterDaemon','9e0716c949be',29,'[]','[]',1468278905,1468278950,'run','phd','29:4hei7cpzo'),(4,'PhabricatorTaskmasterDaemon','9e0716c949be',29,'[]','[]',1468278947,1468278964,'exit','phd','29:vsz6dwgyi');
/*!40000 ALTER TABLE `daemon_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daemon_logevent`
--

DROP TABLE IF EXISTS `daemon_logevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daemon_logevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logID` int(10) unsigned NOT NULL,
  `logType` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `message` longtext COLLATE utf8mb4_bin NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logID` (`logID`,`epoch`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_logevent`
--

LOCK TABLES `daemon_logevent` WRITE;
/*!40000 ALTER TABLE `daemon_logevent` DISABLE KEYS */;
INSERT INTO `daemon_logevent` VALUES (1,1,'INIT','Starting process.',1468278905),(2,2,'INIT','Starting process.',1468278905),(3,3,'INIT','Starting process.',1468278905),(4,3,'STDE','[2016-07-11 23:15:44] EXCEPTION: (PhutilProxyException) Permanent failure while executing Task ID 3. {>} (PhabricatorWorkerPermanentFailureException) Unable to load object \"PHID-USER-ljditzls25waa24hvicf\" to rebuild indexes. at [<phabricator>/src/applications/search/worker/PhabricatorSearchWorker.php:76]',1468278945),(5,3,'STDE','arcanist(), phabricator(), phutil()',1468278945),(6,3,'STDE','  #0 <#2> PhabricatorSearchWorker::loadObjectForIndexing(string) called at [<phabricator>/src/applications/search/worker/PhabricatorSearchWorker.php:25]',1468278945),(7,3,'STDE','  #1 <#2> PhabricatorSearchWorker::doWork() called at [<phabricator>/src/infrastructure/daemon/workers/PhabricatorWorker.php:122]',1468278945),(8,3,'STDE','  #2 <#2> PhabricatorWorker::executeTask() called at [<phabricator>/src/infrastructure/daemon/workers/storage/PhabricatorWorkerActiveTask.php:171]',1468278945),(9,3,'STDE','  #3 <#2> PhabricatorWorkerActiveTask::executeTask() called at [<phabricator>/src/infrastructure/daemon/workers/PhabricatorTaskmasterDaemon.php:22]',1468278945),(10,3,'STDE','  #4 PhabricatorTaskmasterDaemon::run() called at [<phutil>/src/daemon/PhutilDaemon.php:184]',1468278945),(11,3,'STDE','  #5 PhutilDaemon::execute() called at [<phutil>/scripts/daemon/exec/exec_daemon.php:127]',1468278945),(12,3,'FAIL','Process exited with error 255.',1468278945),(13,3,'WAIT','Waiting to restart process.',1468278945),(14,4,'INIT','Starting process.',1468278948),(15,3,'INIT','Starting process.',1468278950),(16,4,'DONE','Process exited normally.',1468278964);
/*!40000 ALTER TABLE `daemon_logevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_dashboard`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_dashboard` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_dashboard`;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `layoutConfig` longtext COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_install`
--

DROP TABLE IF EXISTS `dashboard_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_install` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `installerPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `applicationClass` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `dashboardPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`applicationClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_install`
--

LOCK TABLES `dashboard_install` WRITE;
/*!40000 ALTER TABLE `dashboard_install` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_panel`
--

DROP TABLE IF EXISTS `dashboard_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `panelType` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_panel`
--

LOCK TABLES `dashboard_panel` WRITE;
/*!40000 ALTER TABLE `dashboard_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_paneltransaction`
--

DROP TABLE IF EXISTS `dashboard_paneltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_paneltransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_paneltransaction`
--

LOCK TABLES `dashboard_paneltransaction` WRITE;
/*!40000 ALTER TABLE `dashboard_paneltransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_paneltransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_transaction`
--

DROP TABLE IF EXISTS `dashboard_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_transaction`
--

LOCK TABLES `dashboard_transaction` WRITE;
/*!40000 ALTER TABLE `dashboard_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_differential`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_differential` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_differential`;

--
-- Table structure for table `differential_affectedpath`
--

DROP TABLE IF EXISTS `differential_affectedpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_affectedpath` (
  `repositoryID` int(10) unsigned NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `revisionID` int(10) unsigned NOT NULL,
  KEY `repositoryID` (`repositoryID`,`pathID`,`epoch`),
  KEY `revisionID` (`revisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_affectedpath`
--

LOCK TABLES `differential_affectedpath` WRITE;
/*!40000 ALTER TABLE `differential_affectedpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_affectedpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_changeset`
--

DROP TABLE IF EXISTS `differential_changeset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_changeset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diffID` int(10) unsigned NOT NULL,
  `oldFile` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `awayPaths` longtext COLLATE utf8mb4_bin,
  `changeType` int(10) unsigned NOT NULL,
  `fileType` int(10) unsigned NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin,
  `oldProperties` longtext COLLATE utf8mb4_bin,
  `newProperties` longtext COLLATE utf8mb4_bin,
  `addLines` int(10) unsigned NOT NULL,
  `delLines` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `diffID` (`diffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_changeset`
--

LOCK TABLES `differential_changeset` WRITE;
/*!40000 ALTER TABLE `differential_changeset` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_changeset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_changeset_parse_cache`
--

DROP TABLE IF EXISTS `differential_changeset_parse_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_changeset_parse_cache` (
  `id` int(10) unsigned NOT NULL,
  `cache` longblob NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dateCreated` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_changeset_parse_cache`
--

LOCK TABLES `differential_changeset_parse_cache` WRITE;
/*!40000 ALTER TABLE `differential_changeset_parse_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_changeset_parse_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_commit`
--

DROP TABLE IF EXISTS `differential_commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_commit` (
  `revisionID` int(10) unsigned NOT NULL,
  `commitPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`revisionID`,`commitPHID`),
  UNIQUE KEY `commitPHID` (`commitPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_commit`
--

LOCK TABLES `differential_commit` WRITE;
/*!40000 ALTER TABLE `differential_commit` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_customfieldnumericindex`
--

DROP TABLE IF EXISTS `differential_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_customfieldnumericindex`
--

LOCK TABLES `differential_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `differential_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_customfieldstorage`
--

DROP TABLE IF EXISTS `differential_customfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_customfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_customfieldstorage`
--

LOCK TABLES `differential_customfieldstorage` WRITE;
/*!40000 ALTER TABLE `differential_customfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_customfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_customfieldstringindex`
--

DROP TABLE IF EXISTS `differential_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_customfieldstringindex`
--

LOCK TABLES `differential_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `differential_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_diff`
--

DROP TABLE IF EXISTS `differential_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_diff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `revisionID` int(10) unsigned DEFAULT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `sourceMachine` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourcePath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceControlSystem` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceControlBaseRevision` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceControlPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lintStatus` int(10) unsigned NOT NULL,
  `unitStatus` int(10) unsigned NOT NULL,
  `lineCount` int(10) unsigned NOT NULL,
  `branch` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bookmark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `creationMethod` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `repositoryUUID` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `revisionID` (`revisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_diff`
--

LOCK TABLES `differential_diff` WRITE;
/*!40000 ALTER TABLE `differential_diff` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_diff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_diffproperty`
--

DROP TABLE IF EXISTS `differential_diffproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_diffproperty` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diffID` int(10) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `diffID` (`diffID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_diffproperty`
--

LOCK TABLES `differential_diffproperty` WRITE;
/*!40000 ALTER TABLE `differential_diffproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_diffproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_difftransaction`
--

DROP TABLE IF EXISTS `differential_difftransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_difftransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_difftransaction`
--

LOCK TABLES `differential_difftransaction` WRITE;
/*!40000 ALTER TABLE `differential_difftransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_difftransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_draft`
--

DROP TABLE IF EXISTS `differential_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `draftKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_unique` (`objectPHID`,`authorPHID`,`draftKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_draft`
--

LOCK TABLES `differential_draft` WRITE;
/*!40000 ALTER TABLE `differential_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_hiddencomment`
--

DROP TABLE IF EXISTS `differential_hiddencomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_hiddencomment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `commentID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_user` (`userPHID`,`commentID`),
  KEY `key_comment` (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_hiddencomment`
--

LOCK TABLES `differential_hiddencomment` WRITE;
/*!40000 ALTER TABLE `differential_hiddencomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_hiddencomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_hunk`
--

DROP TABLE IF EXISTS `differential_hunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_hunk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changesetID` int(10) unsigned NOT NULL,
  `changes` longtext COLLATE utf8mb4_bin,
  `oldOffset` int(10) unsigned NOT NULL,
  `oldLen` int(10) unsigned NOT NULL,
  `newOffset` int(10) unsigned NOT NULL,
  `newLen` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `changesetID` (`changesetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_hunk`
--

LOCK TABLES `differential_hunk` WRITE;
/*!40000 ALTER TABLE `differential_hunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_hunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_hunk_modern`
--

DROP TABLE IF EXISTS `differential_hunk_modern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_hunk_modern` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changesetID` int(10) unsigned NOT NULL,
  `oldOffset` int(10) unsigned NOT NULL,
  `oldLen` int(10) unsigned NOT NULL,
  `newOffset` int(10) unsigned NOT NULL,
  `newLen` int(10) unsigned NOT NULL,
  `dataType` binary(4) NOT NULL,
  `dataEncoding` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `dataFormat` binary(4) NOT NULL,
  `data` longblob NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_changeset` (`changesetID`),
  KEY `key_created` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_hunk_modern`
--

LOCK TABLES `differential_hunk_modern` WRITE;
/*!40000 ALTER TABLE `differential_hunk_modern` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_hunk_modern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_revision`
--

DROP TABLE IF EXISTS `differential_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_revision` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `originalTitle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `summary` longtext COLLATE utf8mb4_bin NOT NULL,
  `testPlan` longtext COLLATE utf8mb4_bin NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `lastReviewerPHID` varbinary(64) DEFAULT NULL,
  `lineCount` int(10) unsigned DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `attached` longtext COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(40) NOT NULL,
  `branchName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `authorPHID` (`authorPHID`,`status`),
  KEY `repositoryPHID` (`repositoryPHID`),
  KEY `key_status` (`status`,`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_revision`
--

LOCK TABLES `differential_revision` WRITE;
/*!40000 ALTER TABLE `differential_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_revisionhash`
--

DROP TABLE IF EXISTS `differential_revisionhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_revisionhash` (
  `revisionID` int(10) unsigned NOT NULL,
  `type` binary(4) NOT NULL,
  `hash` binary(40) NOT NULL,
  KEY `type` (`type`,`hash`),
  KEY `revisionID` (`revisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_revisionhash`
--

LOCK TABLES `differential_revisionhash` WRITE;
/*!40000 ALTER TABLE `differential_revisionhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_revisionhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_transaction`
--

DROP TABLE IF EXISTS `differential_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_transaction`
--

LOCK TABLES `differential_transaction` WRITE;
/*!40000 ALTER TABLE `differential_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `differential_transaction_comment`
--

DROP TABLE IF EXISTS `differential_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `differential_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `revisionPHID` varbinary(64) DEFAULT NULL,
  `changesetID` int(10) unsigned DEFAULT NULL,
  `isNewFile` tinyint(1) NOT NULL,
  `lineNumber` int(10) unsigned NOT NULL,
  `lineLength` int(10) unsigned NOT NULL,
  `fixedState` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `hasReplies` tinyint(1) NOT NULL,
  `replyToCommentPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  KEY `key_changeset` (`changesetID`),
  KEY `key_draft` (`authorPHID`,`transactionPHID`),
  KEY `key_revision` (`revisionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `differential_transaction_comment`
--

LOCK TABLES `differential_transaction_comment` WRITE;
/*!40000 ALTER TABLE `differential_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `differential_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_diviner`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_diviner` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_diviner`;

--
-- Table structure for table `diviner_liveatom`
--

DROP TABLE IF EXISTS `diviner_liveatom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diviner_liveatom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbolPHID` varbinary(64) NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `atomData` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbolPHID` (`symbolPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diviner_liveatom`
--

LOCK TABLES `diviner_liveatom` WRITE;
/*!40000 ALTER TABLE `diviner_liveatom` DISABLE KEYS */;
/*!40000 ALTER TABLE `diviner_liveatom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diviner_livebook`
--

DROP TABLE IF EXISTS `diviner_livebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diviner_livebook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `configurationData` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diviner_livebook`
--

LOCK TABLES `diviner_livebook` WRITE;
/*!40000 ALTER TABLE `diviner_livebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `diviner_livebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diviner_livebooktransaction`
--

DROP TABLE IF EXISTS `diviner_livebooktransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diviner_livebooktransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diviner_livebooktransaction`
--

LOCK TABLES `diviner_livebooktransaction` WRITE;
/*!40000 ALTER TABLE `diviner_livebooktransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `diviner_livebooktransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diviner_livesymbol`
--

DROP TABLE IF EXISTS `diviner_livesymbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diviner_livesymbol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `bookPHID` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `context` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `atomIndex` int(10) unsigned NOT NULL,
  `identityHash` binary(12) NOT NULL,
  `graphHash` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin,
  `titleSlugHash` binary(12) DEFAULT NULL,
  `groupName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `summary` longtext COLLATE utf8mb4_bin,
  `isDocumentable` tinyint(1) NOT NULL,
  `nodeHash` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identityHash` (`identityHash`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `graphHash` (`graphHash`),
  UNIQUE KEY `nodeHash` (`nodeHash`),
  KEY `key_slug` (`titleSlugHash`),
  KEY `bookPHID` (`bookPHID`,`type`,`name`(64),`context`(64),`atomIndex`),
  KEY `name` (`name`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diviner_livesymbol`
--

LOCK TABLES `diviner_livesymbol` WRITE;
/*!40000 ALTER TABLE `diviner_livesymbol` DISABLE KEYS */;
/*!40000 ALTER TABLE `diviner_livesymbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_doorkeeper`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_doorkeeper` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_doorkeeper`;

--
-- Table structure for table `doorkeeper_externalobject`
--

DROP TABLE IF EXISTS `doorkeeper_externalobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doorkeeper_externalobject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `objectKey` binary(12) NOT NULL,
  `applicationType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `applicationDomain` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `objectType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `objectID` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `objectURI` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `importerPHID` varbinary(64) DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_object` (`objectKey`),
  KEY `key_full` (`applicationType`,`applicationDomain`,`objectType`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doorkeeper_externalobject`
--

LOCK TABLES `doorkeeper_externalobject` WRITE;
/*!40000 ALTER TABLE `doorkeeper_externalobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `doorkeeper_externalobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_draft`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_draft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_draft`;

--
-- Table structure for table `draft`
--

DROP TABLE IF EXISTS `draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `draftKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `draft` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authorPHID` (`authorPHID`,`draftKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft`
--

LOCK TABLES `draft` WRITE;
/*!40000 ALTER TABLE `draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft_versioneddraft`
--

DROP TABLE IF EXISTS `draft_versioneddraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft_versioneddraft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`,`authorPHID`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft_versioneddraft`
--

LOCK TABLES `draft_versioneddraft` WRITE;
/*!40000 ALTER TABLE `draft_versioneddraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft_versioneddraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_drydock`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_drydock` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_drydock`;

--
-- Table structure for table `drydock_authorization`
--

DROP TABLE IF EXISTS `drydock_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_authorization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `blueprintPHID` varbinary(64) NOT NULL,
  `blueprintAuthorizationState` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `objectAuthorizationState` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_unique` (`objectPHID`,`blueprintPHID`),
  KEY `key_blueprint` (`blueprintPHID`,`blueprintAuthorizationState`),
  KEY `key_object` (`objectPHID`,`objectAuthorizationState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_authorization`
--

LOCK TABLES `drydock_authorization` WRITE;
/*!40000 ALTER TABLE `drydock_authorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_blueprint`
--

DROP TABLE IF EXISTS `drydock_blueprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_blueprint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `className` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `blueprintName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `details` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_blueprint`
--

LOCK TABLES `drydock_blueprint` WRITE;
/*!40000 ALTER TABLE `drydock_blueprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_blueprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_blueprintname_ngrams`
--

DROP TABLE IF EXISTS `drydock_blueprintname_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_blueprintname_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_blueprintname_ngrams`
--

LOCK TABLES `drydock_blueprintname_ngrams` WRITE;
/*!40000 ALTER TABLE `drydock_blueprintname_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_blueprintname_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_blueprinttransaction`
--

DROP TABLE IF EXISTS `drydock_blueprinttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_blueprinttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_blueprinttransaction`
--

LOCK TABLES `drydock_blueprinttransaction` WRITE;
/*!40000 ALTER TABLE `drydock_blueprinttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_blueprinttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_command`
--

DROP TABLE IF EXISTS `drydock_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `targetPHID` varbinary(64) NOT NULL,
  `command` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `isConsumed` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_target` (`targetPHID`,`isConsumed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_command`
--

LOCK TABLES `drydock_command` WRITE;
/*!40000 ALTER TABLE `drydock_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_lease`
--

DROP TABLE IF EXISTS `drydock_lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_lease` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `until` int(10) unsigned DEFAULT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `attributes` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `resourceType` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `resourcePHID` varbinary(64) DEFAULT NULL,
  `authorizingPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_resource` (`resourcePHID`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_lease`
--

LOCK TABLES `drydock_lease` WRITE;
/*!40000 ALTER TABLE `drydock_lease` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_log`
--

DROP TABLE IF EXISTS `drydock_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `epoch` int(10) unsigned NOT NULL,
  `blueprintPHID` varbinary(64) DEFAULT NULL,
  `resourcePHID` varbinary(64) DEFAULT NULL,
  `leasePHID` varbinary(64) DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `epoch` (`epoch`),
  KEY `key_blueprint` (`blueprintPHID`,`type`),
  KEY `key_resource` (`resourcePHID`,`type`),
  KEY `key_lease` (`leasePHID`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_log`
--

LOCK TABLES `drydock_log` WRITE;
/*!40000 ALTER TABLE `drydock_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_repositoryoperation`
--

DROP TABLE IF EXISTS `drydock_repositoryoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_repositoryoperation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `repositoryTarget` longblob NOT NULL,
  `operationType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `operationState` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDismissed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`),
  KEY `key_repository` (`repositoryPHID`,`operationState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_repositoryoperation`
--

LOCK TABLES `drydock_repositoryoperation` WRITE;
/*!40000 ALTER TABLE `drydock_repositoryoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_repositoryoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_resource`
--

DROP TABLE IF EXISTS `drydock_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_resource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `attributes` longtext COLLATE utf8mb4_bin NOT NULL,
  `capabilities` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `blueprintPHID` varbinary(64) NOT NULL,
  `until` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_type` (`type`,`status`),
  KEY `key_blueprint` (`blueprintPHID`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_resource`
--

LOCK TABLES `drydock_resource` WRITE;
/*!40000 ALTER TABLE `drydock_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drydock_slotlock`
--

DROP TABLE IF EXISTS `drydock_slotlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drydock_slotlock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerPHID` varbinary(64) NOT NULL,
  `lockIndex` binary(12) NOT NULL,
  `lockKey` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_lock` (`lockIndex`),
  KEY `key_owner` (`ownerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drydock_slotlock`
--

LOCK TABLES `drydock_slotlock` WRITE;
/*!40000 ALTER TABLE `drydock_slotlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `drydock_slotlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_fact`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_fact` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_fact`;

--
-- Table structure for table `fact_aggregate`
--

DROP TABLE IF EXISTS `fact_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_aggregate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `factType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `valueX` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `factType` (`factType`,`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_aggregate`
--

LOCK TABLES `fact_aggregate` WRITE;
/*!40000 ALTER TABLE `fact_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_cursor`
--

DROP TABLE IF EXISTS `fact_cursor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_cursor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `position` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_cursor`
--

LOCK TABLES `fact_cursor` WRITE;
/*!40000 ALTER TABLE `fact_cursor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_cursor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_raw`
--

DROP TABLE IF EXISTS `fact_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_raw` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `factType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `objectA` varbinary(64) NOT NULL,
  `valueX` bigint(20) NOT NULL,
  `valueY` bigint(20) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectPHID` (`objectPHID`),
  KEY `factType` (`factType`,`epoch`),
  KEY `factType_2` (`factType`,`objectA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_raw`
--

LOCK TABLES `fact_raw` WRITE;
/*!40000 ALTER TABLE `fact_raw` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_raw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_feed`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_feed` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_feed`;

--
-- Table structure for table `feed_storydata`
--

DROP TABLE IF EXISTS `feed_storydata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_storydata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `chronologicalKey` bigint(20) unsigned NOT NULL,
  `storyType` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `storyData` longtext COLLATE utf8mb4_bin NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chronologicalKey` (`chronologicalKey`),
  UNIQUE KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_storydata`
--

LOCK TABLES `feed_storydata` WRITE;
/*!40000 ALTER TABLE `feed_storydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_storydata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_storynotification`
--

DROP TABLE IF EXISTS `feed_storynotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_storynotification` (
  `userPHID` varbinary(64) NOT NULL,
  `primaryObjectPHID` varbinary(64) NOT NULL,
  `chronologicalKey` bigint(20) unsigned NOT NULL,
  `hasViewed` tinyint(1) NOT NULL,
  UNIQUE KEY `userPHID` (`userPHID`,`chronologicalKey`),
  KEY `userPHID_2` (`userPHID`,`hasViewed`,`primaryObjectPHID`),
  KEY `key_object` (`primaryObjectPHID`),
  KEY `key_chronological` (`chronologicalKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_storynotification`
--

LOCK TABLES `feed_storynotification` WRITE;
/*!40000 ALTER TABLE `feed_storynotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_storynotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_storyreference`
--

DROP TABLE IF EXISTS `feed_storyreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_storyreference` (
  `objectPHID` varbinary(64) NOT NULL,
  `chronologicalKey` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `objectPHID` (`objectPHID`,`chronologicalKey`),
  KEY `chronologicalKey` (`chronologicalKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_storyreference`
--

LOCK TABLES `feed_storyreference` WRITE;
/*!40000 ALTER TABLE `feed_storyreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_storyreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_file`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_file` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_file`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mimeType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `byteSize` bigint(20) unsigned NOT NULL,
  `storageEngine` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `storageFormat` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `storageHandle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `secretKey` binary(20) DEFAULT NULL,
  `contentHash` binary(40) DEFAULT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `ttl` int(10) unsigned DEFAULT NULL,
  `isExplicitUpload` tinyint(1) DEFAULT '1',
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `isPartial` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `authorPHID` (`authorPHID`),
  KEY `contentHash` (`contentHash`),
  KEY `key_ttl` (`ttl`),
  KEY `key_dateCreated` (`dateCreated`),
  KEY `key_partial` (`authorPHID`,`isPartial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_chunk`
--

DROP TABLE IF EXISTS `file_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_chunk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chunkHandle` binary(12) NOT NULL,
  `byteStart` bigint(20) unsigned NOT NULL,
  `byteEnd` bigint(20) unsigned NOT NULL,
  `dataFilePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_file` (`chunkHandle`,`byteStart`,`byteEnd`),
  KEY `key_data` (`dataFilePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_chunk`
--

LOCK TABLES `file_chunk` WRITE;
/*!40000 ALTER TABLE `file_chunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_imagemacro`
--

DROP TABLE IF EXISTS `file_imagemacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_imagemacro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  `audioPHID` varbinary(64) DEFAULT NULL,
  `audioBehavior` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `name` (`name`),
  KEY `key_disabled` (`isDisabled`),
  KEY `key_dateCreated` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_imagemacro`
--

LOCK TABLES `file_imagemacro` WRITE;
/*!40000 ALTER TABLE `file_imagemacro` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_imagemacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_storageblob`
--

DROP TABLE IF EXISTS `file_storageblob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_storageblob` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longblob NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_storageblob`
--

LOCK TABLES `file_storageblob` WRITE;
/*!40000 ALTER TABLE `file_storageblob` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_storageblob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_transaction`
--

DROP TABLE IF EXISTS `file_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_transaction`
--

LOCK TABLES `file_transaction` WRITE;
/*!40000 ALTER TABLE `file_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_transaction_comment`
--

DROP TABLE IF EXISTS `file_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  UNIQUE KEY `key_draft` (`authorPHID`,`transactionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_transaction_comment`
--

LOCK TABLES `file_transaction_comment` WRITE;
/*!40000 ALTER TABLE `file_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_transformedfile`
--

DROP TABLE IF EXISTS `file_transformedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_transformedfile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `originalPHID` varbinary(64) NOT NULL,
  `transform` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `transformedPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `originalPHID` (`originalPHID`,`transform`),
  KEY `transformedPHID` (`transformedPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_transformedfile`
--

LOCK TABLES `file_transformedfile` WRITE;
/*!40000 ALTER TABLE `file_transformedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_transformedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macro_transaction`
--

DROP TABLE IF EXISTS `macro_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macro_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macro_transaction`
--

LOCK TABLES `macro_transaction` WRITE;
/*!40000 ALTER TABLE `macro_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `macro_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macro_transaction_comment`
--

DROP TABLE IF EXISTS `macro_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macro_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macro_transaction_comment`
--

LOCK TABLES `macro_transaction_comment` WRITE;
/*!40000 ALTER TABLE `macro_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `macro_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_flag`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_flag` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_flag`;

--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerPHID` varbinary(64) NOT NULL,
  `type` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `reasonPHID` varbinary(64) NOT NULL,
  `color` int(10) unsigned NOT NULL,
  `note` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerPHID` (`ownerPHID`,`type`,`objectPHID`),
  KEY `objectPHID` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_fund`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_fund` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_fund`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_backer`
--

DROP TABLE IF EXISTS `fund_backer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_backer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `initiativePHID` varbinary(64) NOT NULL,
  `backerPHID` varbinary(64) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `amountAsCurrency` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_initiative` (`initiativePHID`),
  KEY `key_backer` (`backerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_backer`
--

LOCK TABLES `fund_backer` WRITE;
/*!40000 ALTER TABLE `fund_backer` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_backer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_backertransaction`
--

DROP TABLE IF EXISTS `fund_backertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_backertransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_backertransaction`
--

LOCK TABLES `fund_backertransaction` WRITE;
/*!40000 ALTER TABLE `fund_backertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_backertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiative`
--

DROP TABLE IF EXISTS `fund_initiative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_initiative` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `ownerPHID` varbinary(64) NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `merchantPHID` varbinary(64) DEFAULT NULL,
  `risks` longtext COLLATE utf8mb4_bin NOT NULL,
  `totalAsCurrency` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_status` (`status`),
  KEY `key_owner` (`ownerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiative`
--

LOCK TABLES `fund_initiative` WRITE;
/*!40000 ALTER TABLE `fund_initiative` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiativetransaction`
--

DROP TABLE IF EXISTS `fund_initiativetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_initiativetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiativetransaction`
--

LOCK TABLES `fund_initiativetransaction` WRITE;
/*!40000 ALTER TABLE `fund_initiativetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiativetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_initiativetransaction_comment`
--

DROP TABLE IF EXISTS `fund_initiativetransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_initiativetransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_initiativetransaction_comment`
--

LOCK TABLES `fund_initiativetransaction_comment` WRITE;
/*!40000 ALTER TABLE `fund_initiativetransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund_initiativetransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_harbormaster`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_harbormaster` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_harbormaster`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_build`
--

DROP TABLE IF EXISTS `harbormaster_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_build` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `buildablePHID` varbinary(64) NOT NULL,
  `buildPlanPHID` varbinary(64) NOT NULL,
  `buildStatus` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `buildGeneration` int(10) unsigned NOT NULL DEFAULT '0',
  `planAutoKey` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `buildParameters` longtext COLLATE utf8mb4_bin NOT NULL,
  `initiatorPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_planautokey` (`buildablePHID`,`planAutoKey`),
  KEY `key_buildable` (`buildablePHID`),
  KEY `key_plan` (`buildPlanPHID`),
  KEY `key_status` (`buildStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_build`
--

LOCK TABLES `harbormaster_build` WRITE;
/*!40000 ALTER TABLE `harbormaster_build` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildable`
--

DROP TABLE IF EXISTS `harbormaster_buildable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `buildablePHID` varbinary(64) NOT NULL,
  `containerPHID` varbinary(64) DEFAULT NULL,
  `buildableStatus` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isManualBuildable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_buildable` (`buildablePHID`),
  KEY `key_container` (`containerPHID`),
  KEY `key_manual` (`isManualBuildable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildable`
--

LOCK TABLES `harbormaster_buildable` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildable` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildabletransaction`
--

DROP TABLE IF EXISTS `harbormaster_buildabletransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildabletransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildabletransaction`
--

LOCK TABLES `harbormaster_buildabletransaction` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildabletransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildabletransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildartifact`
--

DROP TABLE IF EXISTS `harbormaster_buildartifact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildartifact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `artifactType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `artifactIndex` binary(12) NOT NULL,
  `artifactKey` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `artifactData` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `buildTargetPHID` varbinary(64) NOT NULL,
  `isReleased` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_artifact` (`artifactType`,`artifactIndex`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_garbagecollect` (`artifactType`,`dateCreated`),
  KEY `key_target` (`buildTargetPHID`,`artifactType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildartifact`
--

LOCK TABLES `harbormaster_buildartifact` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildartifact` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildartifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildcommand`
--

DROP TABLE IF EXISTS `harbormaster_buildcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildcommand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `targetPHID` varbinary(64) NOT NULL,
  `command` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_target` (`targetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildcommand`
--

LOCK TABLES `harbormaster_buildcommand` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildlintmessage`
--

DROP TABLE IF EXISTS `harbormaster_buildlintmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildlintmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buildTargetPHID` varbinary(64) NOT NULL,
  `path` longtext COLLATE utf8mb4_bin NOT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `characterOffset` int(10) unsigned DEFAULT NULL,
  `code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `severity` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_target` (`buildTargetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildlintmessage`
--

LOCK TABLES `harbormaster_buildlintmessage` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildlintmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildlintmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildlog`
--

DROP TABLE IF EXISTS `harbormaster_buildlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `logSource` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `logType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `live` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `buildTargetPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_buildtarget` (`buildTargetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildlog`
--

LOCK TABLES `harbormaster_buildlog` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildlogchunk`
--

DROP TABLE IF EXISTS `harbormaster_buildlogchunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildlogchunk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logID` int(10) unsigned NOT NULL,
  `encoding` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `chunk` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_log` (`logID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildlogchunk`
--

LOCK TABLES `harbormaster_buildlogchunk` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildlogchunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildlogchunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildmessage`
--

DROP TABLE IF EXISTS `harbormaster_buildmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `buildTargetPHID` varbinary(64) NOT NULL,
  `type` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `isConsumed` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_buildtarget` (`buildTargetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildmessage`
--

LOCK TABLES `harbormaster_buildmessage` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildplan`
--

DROP TABLE IF EXISTS `harbormaster_buildplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `planStatus` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `planAutoKey` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_planautokey` (`planAutoKey`),
  KEY `key_status` (`planStatus`),
  KEY `key_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildplan`
--

LOCK TABLES `harbormaster_buildplan` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildplanname_ngrams`
--

DROP TABLE IF EXISTS `harbormaster_buildplanname_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildplanname_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildplanname_ngrams`
--

LOCK TABLES `harbormaster_buildplanname_ngrams` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildplanname_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildplanname_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildplantransaction`
--

DROP TABLE IF EXISTS `harbormaster_buildplantransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildplantransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildplantransaction`
--

LOCK TABLES `harbormaster_buildplantransaction` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildplantransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildplantransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildstep`
--

DROP TABLE IF EXISTS `harbormaster_buildstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildstep` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `buildPlanPHID` varbinary(64) NOT NULL,
  `className` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `details` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `stepAutoKey` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_stepautokey` (`buildPlanPHID`,`stepAutoKey`),
  KEY `key_plan` (`buildPlanPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildstep`
--

LOCK TABLES `harbormaster_buildstep` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildsteptransaction`
--

DROP TABLE IF EXISTS `harbormaster_buildsteptransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildsteptransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildsteptransaction`
--

LOCK TABLES `harbormaster_buildsteptransaction` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildsteptransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildsteptransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildtarget`
--

DROP TABLE IF EXISTS `harbormaster_buildtarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildtarget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `buildPHID` varbinary(64) NOT NULL,
  `buildStepPHID` varbinary(64) NOT NULL,
  `className` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `details` longtext COLLATE utf8mb4_bin NOT NULL,
  `variables` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `targetStatus` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateStarted` int(10) unsigned DEFAULT NULL,
  `dateCompleted` int(10) unsigned DEFAULT NULL,
  `buildGeneration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_build` (`buildPHID`,`buildStepPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildtarget`
--

LOCK TABLES `harbormaster_buildtarget` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildtarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildtarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildtransaction`
--

DROP TABLE IF EXISTS `harbormaster_buildtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildtransaction`
--

LOCK TABLES `harbormaster_buildtransaction` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_buildunitmessage`
--

DROP TABLE IF EXISTS `harbormaster_buildunitmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_buildunitmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buildTargetPHID` varbinary(64) NOT NULL,
  `engine` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `namespace` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `result` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `duration` double DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_target` (`buildTargetPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_buildunitmessage`
--

LOCK TABLES `harbormaster_buildunitmessage` WRITE;
/*!40000 ALTER TABLE `harbormaster_buildunitmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_buildunitmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_object`
--

DROP TABLE IF EXISTS `harbormaster_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_object` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_object`
--

LOCK TABLES `harbormaster_object` WRITE;
/*!40000 ALTER TABLE `harbormaster_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harbormaster_scratchtable`
--

DROP TABLE IF EXISTS `harbormaster_scratchtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harbormaster_scratchtable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `bigData` longtext COLLATE utf8mb4_bin,
  `nonmutableData` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harbormaster_scratchtable`
--

LOCK TABLES `harbormaster_scratchtable` WRITE;
/*!40000 ALTER TABLE `harbormaster_scratchtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `harbormaster_scratchtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lisk_counter`
--

DROP TABLE IF EXISTS `lisk_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lisk_counter` (
  `counterName` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `counterValue` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`counterName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lisk_counter`
--

LOCK TABLES `lisk_counter` WRITE;
/*!40000 ALTER TABLE `lisk_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `lisk_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_herald`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_herald` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_herald`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_action`
--

DROP TABLE IF EXISTS `herald_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herald_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruleID` int(10) unsigned NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ruleID` (`ruleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_action`
--

LOCK TABLES `herald_action` WRITE;
/*!40000 ALTER TABLE `herald_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_condition`
--

DROP TABLE IF EXISTS `herald_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herald_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruleID` int(10) unsigned NOT NULL,
  `fieldName` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `fieldCondition` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `value` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ruleID` (`ruleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_condition`
--

LOCK TABLES `herald_condition` WRITE;
/*!40000 ALTER TABLE `herald_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_rule`
--

DROP TABLE IF EXISTS `herald_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herald_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `contentType` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `mustMatchAll` tinyint(1) NOT NULL,
  `configVersion` int(10) unsigned NOT NULL DEFAULT '1',
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `repetitionPolicy` int(10) unsigned DEFAULT NULL,
  `ruleType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `isDisabled` int(10) unsigned NOT NULL DEFAULT '0',
  `triggerObjectPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_trigger` (`triggerObjectPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_ruletype` (`ruleType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_rule`
--

LOCK TABLES `herald_rule` WRITE;
/*!40000 ALTER TABLE `herald_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_ruleapplied`
--

DROP TABLE IF EXISTS `herald_ruleapplied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herald_ruleapplied` (
  `ruleID` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  PRIMARY KEY (`ruleID`,`phid`),
  KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_ruleapplied`
--

LOCK TABLES `herald_ruleapplied` WRITE;
/*!40000 ALTER TABLE `herald_ruleapplied` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_ruleapplied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_ruletransaction`
--

DROP TABLE IF EXISTS `herald_ruletransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herald_ruletransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_ruletransaction`
--

LOCK TABLES `herald_ruletransaction` WRITE;
/*!40000 ALTER TABLE `herald_ruletransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_ruletransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_ruletransaction_comment`
--

DROP TABLE IF EXISTS `herald_ruletransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herald_ruletransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_ruletransaction_comment`
--

LOCK TABLES `herald_ruletransaction_comment` WRITE;
/*!40000 ALTER TABLE `herald_ruletransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_ruletransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_savedheader`
--

DROP TABLE IF EXISTS `herald_savedheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herald_savedheader` (
  `phid` varbinary(64) NOT NULL,
  `header` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_savedheader`
--

LOCK TABLES `herald_savedheader` WRITE;
/*!40000 ALTER TABLE `herald_savedheader` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_savedheader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `herald_transcript`
--

DROP TABLE IF EXISTS `herald_transcript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `herald_transcript` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `host` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `duration` double NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `dryRun` tinyint(1) NOT NULL,
  `objectTranscript` longblob NOT NULL,
  `ruleTranscripts` longblob NOT NULL,
  `conditionTranscripts` longblob NOT NULL,
  `applyTranscripts` longblob NOT NULL,
  `garbageCollected` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `objectPHID` (`objectPHID`),
  KEY `garbageCollected` (`garbageCollected`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `herald_transcript`
--

LOCK TABLES `herald_transcript` WRITE;
/*!40000 ALTER TABLE `herald_transcript` DISABLE KEYS */;
/*!40000 ALTER TABLE `herald_transcript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_legalpad`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_legalpad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_legalpad`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_document`
--

DROP TABLE IF EXISTS `legalpad_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legalpad_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `contributorCount` int(10) unsigned NOT NULL DEFAULT '0',
  `recentContributorPHIDs` longtext COLLATE utf8mb4_bin NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `versions` int(10) unsigned NOT NULL DEFAULT '0',
  `documentBodyPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `signatureType` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `preamble` longtext COLLATE utf8mb4_bin NOT NULL,
  `requireSignature` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_creator` (`creatorPHID`,`dateModified`),
  KEY `key_required` (`requireSignature`,`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_document`
--

LOCK TABLES `legalpad_document` WRITE;
/*!40000 ALTER TABLE `legalpad_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_documentbody`
--

DROP TABLE IF EXISTS `legalpad_documentbody`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legalpad_documentbody` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `documentPHID` varbinary(64) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `text` longtext COLLATE utf8mb4_bin,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_document` (`documentPHID`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_documentbody`
--

LOCK TABLES `legalpad_documentbody` WRITE;
/*!40000 ALTER TABLE `legalpad_documentbody` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_documentbody` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_documentsignature`
--

DROP TABLE IF EXISTS `legalpad_documentsignature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legalpad_documentsignature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentPHID` varbinary(64) NOT NULL,
  `documentVersion` int(10) unsigned NOT NULL DEFAULT '0',
  `signatureType` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `signerPHID` varbinary(64) DEFAULT NULL,
  `signerName` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `signerEmail` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `signatureData` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `secretKey` binary(20) NOT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `isExemption` tinyint(1) NOT NULL DEFAULT '0',
  `exemptionPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key_signer` (`signerPHID`,`dateModified`),
  KEY `secretKey` (`secretKey`),
  KEY `key_document` (`documentPHID`,`signerPHID`,`documentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_documentsignature`
--

LOCK TABLES `legalpad_documentsignature` WRITE;
/*!40000 ALTER TABLE `legalpad_documentsignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_documentsignature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_transaction`
--

DROP TABLE IF EXISTS `legalpad_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legalpad_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_transaction`
--

LOCK TABLES `legalpad_transaction` WRITE;
/*!40000 ALTER TABLE `legalpad_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalpad_transaction_comment`
--

DROP TABLE IF EXISTS `legalpad_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legalpad_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `documentID` int(10) unsigned DEFAULT NULL,
  `lineNumber` int(10) unsigned NOT NULL,
  `lineLength` int(10) unsigned NOT NULL,
  `fixedState` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `hasReplies` tinyint(1) NOT NULL,
  `replyToCommentPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  UNIQUE KEY `key_draft` (`authorPHID`,`documentID`,`transactionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalpad_transaction_comment`
--

LOCK TABLES `legalpad_transaction_comment` WRITE;
/*!40000 ALTER TABLE `legalpad_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalpad_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_maniphest`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_maniphest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_maniphest`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_customfieldnumericindex`
--

DROP TABLE IF EXISTS `maniphest_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maniphest_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_customfieldnumericindex`
--

LOCK TABLES `maniphest_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `maniphest_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_customfieldstorage`
--

DROP TABLE IF EXISTS `maniphest_customfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maniphest_customfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_customfieldstorage`
--

LOCK TABLES `maniphest_customfieldstorage` WRITE;
/*!40000 ALTER TABLE `maniphest_customfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_customfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_customfieldstringindex`
--

DROP TABLE IF EXISTS `maniphest_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maniphest_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_customfieldstringindex`
--

LOCK TABLES `maniphest_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `maniphest_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_nameindex`
--

DROP TABLE IF EXISTS `maniphest_nameindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maniphest_nameindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `indexedObjectPHID` varbinary(64) NOT NULL,
  `indexedObjectName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`indexedObjectPHID`),
  KEY `key_name` (`indexedObjectName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_nameindex`
--

LOCK TABLES `maniphest_nameindex` WRITE;
/*!40000 ALTER TABLE `maniphest_nameindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_nameindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_task`
--

DROP TABLE IF EXISTS `maniphest_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maniphest_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `status` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `originalTitle` longtext COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `ownerOrdering` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `originalEmailSource` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `subpriority` double NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `points` double DEFAULT NULL,
  `bridgedObjectPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `key_bridgedobject` (`bridgedObjectPHID`),
  KEY `priority` (`priority`,`status`),
  KEY `status` (`status`),
  KEY `ownerPHID` (`ownerPHID`,`status`),
  KEY `authorPHID` (`authorPHID`,`status`),
  KEY `ownerOrdering` (`ownerOrdering`),
  KEY `priority_2` (`priority`,`subpriority`),
  KEY `key_dateCreated` (`dateCreated`),
  KEY `key_dateModified` (`dateModified`),
  KEY `key_title` (`title`(64)),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_task`
--

LOCK TABLES `maniphest_task` WRITE;
/*!40000 ALTER TABLE `maniphest_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_transaction`
--

DROP TABLE IF EXISTS `maniphest_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maniphest_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_transaction`
--

LOCK TABLES `maniphest_transaction` WRITE;
/*!40000 ALTER TABLE `maniphest_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maniphest_transaction_comment`
--

DROP TABLE IF EXISTS `maniphest_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maniphest_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maniphest_transaction_comment`
--

LOCK TABLES `maniphest_transaction_comment` WRITE;
/*!40000 ALTER TABLE `maniphest_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `maniphest_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_meta_data`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_meta_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_meta_data`;

--
-- Table structure for table `patch_status`
--

DROP TABLE IF EXISTS `patch_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_status` (
  `patch` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `applied` int(10) unsigned NOT NULL,
  `duration` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`patch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_status`
--

LOCK TABLES `patch_status` WRITE;
/*!40000 ALTER TABLE `patch_status` DISABLE KEYS */;
INSERT INTO `patch_status` VALUES ('phabricator:000.project.sql',1466802850,NULL),('phabricator:0000.legacy.sql',1466802850,NULL),('phabricator:001.maniphest_projects.sql',1466802850,NULL),('phabricator:002.oauth.sql',1466802850,NULL),('phabricator:003.more_oauth.sql',1466802851,NULL),('phabricator:004.daemonrepos.sql',1466802851,NULL),('phabricator:005.workers.sql',1466802851,NULL),('phabricator:006.repository.sql',1466802851,NULL),('phabricator:007.daemonlog.sql',1466802851,NULL),('phabricator:008.repoopt.sql',1466802851,NULL),('phabricator:009.repo_summary.sql',1466802851,NULL),('phabricator:010.herald.sql',1466802851,NULL),('phabricator:011.badcommit.sql',1466802851,NULL),('phabricator:012.dropphidtype.sql',1466802851,NULL),('phabricator:013.commitdetail.sql',1466802851,NULL),('phabricator:014.shortcuts.sql',1466802851,NULL),('phabricator:015.preferences.sql',1466802851,NULL),('phabricator:016.userrealnameindex.sql',1466802851,NULL),('phabricator:017.sessionkeys.sql',1466802851,NULL),('phabricator:018.owners.sql',1466802851,NULL),('phabricator:019.arcprojects.sql',1466802851,NULL),('phabricator:020.pathcapital.sql',1466802851,NULL),('phabricator:021.xhpastview.sql',1466802851,NULL),('phabricator:022.differentialcommit.sql',1466802851,NULL),('phabricator:023.dxkeys.sql',1466802851,NULL),('phabricator:024.mlistkeys.sql',1466802851,NULL),('phabricator:025.commentopt.sql',1466802851,NULL),('phabricator:026.diffpropkey.sql',1466802851,NULL),('phabricator:027.metamtakeys.sql',1466802851,NULL),('phabricator:028.systemagent.sql',1466802851,NULL),('phabricator:029.cursors.sql',1466802851,NULL),('phabricator:030.imagemacro.sql',1466802851,NULL),('phabricator:031.workerrace.sql',1466802851,NULL),('phabricator:032.viewtime.sql',1466802851,NULL),('phabricator:033.privtest.sql',1466802851,NULL),('phabricator:034.savedheader.sql',1466802851,NULL),('phabricator:035.proxyimage.sql',1466802851,NULL),('phabricator:036.mailkey.sql',1466802851,NULL),('phabricator:037.setuptest.sql',1466802851,NULL),('phabricator:038.admin.sql',1466802851,NULL),('phabricator:039.userlog.sql',1466802851,NULL),('phabricator:040.transform.sql',1466802851,NULL),('phabricator:041.heraldrepetition.sql',1466802851,NULL),('phabricator:042.commentmetadata.sql',1466802852,NULL),('phabricator:043.pastebin.sql',1466802852,NULL),('phabricator:044.countdown.sql',1466802852,NULL),('phabricator:045.timezone.sql',1466802852,NULL),('phabricator:046.conduittoken.sql',1466802852,NULL),('phabricator:047.projectstatus.sql',1466802852,NULL),('phabricator:048.relationshipkeys.sql',1466802852,NULL),('phabricator:049.projectowner.sql',1466802852,NULL),('phabricator:050.taskdenormal.sql',1466802852,NULL),('phabricator:051.projectfilter.sql',1466802852,NULL),('phabricator:052.pastelanguage.sql',1466802852,NULL),('phabricator:053.feed.sql',1466802852,NULL),('phabricator:054.subscribers.sql',1466802852,NULL),('phabricator:055.add_author_to_files.sql',1466802852,NULL),('phabricator:056.slowvote.sql',1466802852,NULL),('phabricator:057.parsecache.sql',1466802852,NULL),('phabricator:058.missingkeys.sql',1466802852,NULL),('phabricator:059.engines.php',1466802852,NULL),('phabricator:060.phriction.sql',1466802852,NULL),('phabricator:061.phrictioncontent.sql',1466802852,NULL),('phabricator:062.phrictionmenu.sql',1466802852,NULL),('phabricator:063.pasteforks.sql',1466802852,NULL),('phabricator:064.subprojects.sql',1466802852,NULL),('phabricator:065.sshkeys.sql',1466802852,NULL),('phabricator:066.phrictioncontent.sql',1466802852,NULL),('phabricator:067.preferences.sql',1466802852,NULL),('phabricator:068.maniphestauxiliarystorage.sql',1466802852,NULL),('phabricator:069.heraldxscript.sql',1466802852,NULL),('phabricator:070.differentialaux.sql',1466802852,NULL),('phabricator:071.contentsource.sql',1466802852,NULL),('phabricator:072.blamerevert.sql',1466802852,NULL),('phabricator:073.reposymbols.sql',1466802852,NULL),('phabricator:074.affectedpath.sql',1466802852,NULL),('phabricator:075.revisionhash.sql',1466802852,NULL),('phabricator:076.indexedlanguages.sql',1466802852,NULL),('phabricator:077.originalemail.sql',1466802852,NULL),('phabricator:078.nametoken.sql',1466802852,NULL),('phabricator:079.nametokenindex.php',1466802852,NULL),('phabricator:080.filekeys.sql',1466802852,NULL),('phabricator:081.filekeys.php',1466802852,NULL),('phabricator:082.xactionkey.sql',1466802852,NULL),('phabricator:083.dxviewtime.sql',1466802852,NULL),('phabricator:084.pasteauthorkey.sql',1466802852,NULL),('phabricator:085.packagecommitrelationship.sql',1466802852,NULL),('phabricator:086.formeraffil.sql',1466802852,NULL),('phabricator:087.phrictiondelete.sql',1466802853,NULL),('phabricator:088.audit.sql',1466802853,NULL),('phabricator:089.projectwiki.sql',1466802853,NULL),('phabricator:090.forceuniqueprojectnames.php',1466802853,NULL),('phabricator:091.uniqueslugkey.sql',1466802853,NULL),('phabricator:092.dropgithubnotification.sql',1466802853,NULL),('phabricator:093.gitremotes.php',1466802853,NULL),('phabricator:094.phrictioncolumn.sql',1466802853,NULL),('phabricator:095.directory.sql',1466802853,NULL),('phabricator:096.filename.sql',1466802853,NULL),('phabricator:097.heraldruletypes.sql',1466802853,NULL),('phabricator:098.heraldruletypemigration.php',1466802853,NULL),('phabricator:099.drydock.sql',1466802853,NULL),('phabricator:100.projectxaction.sql',1466802853,NULL),('phabricator:101.heraldruleapplied.sql',1466802853,NULL),('phabricator:102.heraldcleanup.php',1466802853,NULL),('phabricator:103.heraldedithistory.sql',1466802853,NULL),('phabricator:104.searchkey.sql',1466802853,NULL),('phabricator:105.mimetype.sql',1466802853,NULL),('phabricator:106.chatlog.sql',1466802853,NULL),('phabricator:107.oauthserver.sql',1466802853,NULL),('phabricator:108.oauthscope.sql',1466802853,NULL),('phabricator:109.oauthclientphidkey.sql',1466802853,NULL),('phabricator:110.commitaudit.sql',1466802853,NULL),('phabricator:111.commitauditmigration.php',1466802853,NULL),('phabricator:112.oauthaccesscoderedirecturi.sql',1466802853,NULL),('phabricator:113.lastreviewer.sql',1466802853,NULL),('phabricator:114.auditrequest.sql',1466802853,NULL),('phabricator:115.prepareutf8.sql',1466802853,NULL),('phabricator:116.utf8-backup-first-expect-wait.sql',1466802855,NULL),('phabricator:117.repositorydescription.php',1466802855,NULL),('phabricator:118.auditinline.sql',1466802855,NULL),('phabricator:119.filehash.sql',1466802855,NULL),('phabricator:120.noop.sql',1466802855,NULL),('phabricator:121.drydocklog.sql',1466802855,NULL),('phabricator:122.flag.sql',1466802855,NULL),('phabricator:123.heraldrulelog.sql',1466802855,NULL),('phabricator:124.subpriority.sql',1466802855,NULL),('phabricator:125.ipv6.sql',1466802855,NULL),('phabricator:126.edges.sql',1466802855,NULL),('phabricator:127.userkeybody.sql',1466802855,NULL),('phabricator:128.phabricatorcom.sql',1466802855,NULL),('phabricator:129.savedquery.sql',1466802855,NULL),('phabricator:130.denormalrevisionquery.sql',1466802855,NULL),('phabricator:131.migraterevisionquery.php',1466802855,NULL),('phabricator:132.phame.sql',1466802855,NULL),('phabricator:133.imagemacro.sql',1466802855,NULL),('phabricator:134.emptysearch.sql',1466802855,NULL),('phabricator:135.datecommitted.sql',1466802855,NULL),('phabricator:136.sex.sql',1466802855,NULL),('phabricator:137.auditmetadata.sql',1466802855,NULL),('phabricator:138.notification.sql',1466802855,NULL),('phabricator:20121209.pholioxactions.sql',1466802856,NULL),('phabricator:20121209.xmacroadd.sql',1466802856,NULL),('phabricator:20121209.xmacromigrate.php',1466802856,NULL),('phabricator:20121209.xmacromigratekey.sql',1466802856,NULL),('phabricator:20121220.generalcache.sql',1466802856,NULL),('phabricator:20121226.config.sql',1466802856,NULL),('phabricator:20130101.confxaction.sql',1466802856,NULL),('phabricator:20130102.metamtareceivedmailmessageidhash.sql',1466802856,NULL),('phabricator:20130103.filemetadata.sql',1466802856,NULL),('phabricator:20130111.conpherence.sql',1466802856,NULL),('phabricator:20130127.altheraldtranscript.sql',1466802856,NULL),('phabricator:20130131.conpherencepics.sql',1466802857,NULL),('phabricator:20130201.revisionunsubscribed.php',1466802856,NULL),('phabricator:20130201.revisionunsubscribed.sql',1466802857,NULL),('phabricator:20130214.chatlogchannel.sql',1466802857,NULL),('phabricator:20130214.chatlogchannelid.sql',1466802857,NULL),('phabricator:20130214.token.sql',1466802857,NULL),('phabricator:20130215.phabricatorfileaddttl.sql',1466802857,NULL),('phabricator:20130217.cachettl.sql',1466802857,NULL),('phabricator:20130218.longdaemon.sql',1466802857,NULL),('phabricator:20130218.updatechannelid.php',1466802857,NULL),('phabricator:20130219.commitsummary.sql',1466802857,NULL),('phabricator:20130219.commitsummarymig.php',1466802857,NULL),('phabricator:20130222.dropchannel.sql',1466802857,NULL),('phabricator:20130226.commitkey.sql',1466802857,NULL),('phabricator:20130304.lintauthor.sql',1466802857,NULL),('phabricator:20130310.xactionmeta.sql',1466802857,NULL),('phabricator:20130317.phrictionedge.sql',1466802857,NULL),('phabricator:20130319.conpherence.sql',1466802857,NULL),('phabricator:20130319.phabricatorfileexplicitupload.sql',1466802857,NULL),('phabricator:20130320.phlux.sql',1466802857,NULL),('phabricator:20130321.token.sql',1466802857,NULL),('phabricator:20130322.phortune.sql',1466802857,NULL),('phabricator:20130323.phortunepayment.sql',1466802857,NULL),('phabricator:20130324.phortuneproduct.sql',1466802857,NULL),('phabricator:20130330.phrequent.sql',1466802857,NULL),('phabricator:20130403.conpherencecache.sql',1466802857,NULL),('phabricator:20130403.conpherencecachemig.php',1466802857,NULL),('phabricator:20130409.commitdrev.php',1466802857,NULL),('phabricator:20130417.externalaccount.sql',1466802857,NULL),('phabricator:20130423.conpherenceindices.sql',1466802857,NULL),('phabricator:20130423.phortunepaymentrevised.sql',1466802857,NULL),('phabricator:20130423.updateexternalaccount.sql',1466802857,NULL),('phabricator:20130426.search_savedquery.sql',1466802857,NULL),('phabricator:20130502.countdownrevamp1.sql',1466802857,NULL),('phabricator:20130502.countdownrevamp2.php',1466802857,NULL),('phabricator:20130502.countdownrevamp3.sql',1466802857,NULL),('phabricator:20130507.releephrqmailkey.sql',1466802857,NULL),('phabricator:20130507.releephrqmailkeypop.php',1466802857,NULL),('phabricator:20130507.releephrqsimplifycols.sql',1466802857,NULL),('phabricator:20130508.releephtransactions.sql',1466802857,NULL),('phabricator:20130508.releephtransactionsmig.php',1466802857,NULL),('phabricator:20130508.search_namedquery.sql',1466802857,NULL),('phabricator:20130513.receviedmailstatus.sql',1466802857,NULL),('phabricator:20130519.diviner.sql',1466802857,NULL),('phabricator:20130521.dropconphimages.sql',1466802857,NULL),('phabricator:20130523.maniphest_owners.sql',1466802857,NULL),('phabricator:20130524.repoxactions.sql',1466802857,NULL),('phabricator:20130529.macroauthor.sql',1466802857,NULL),('phabricator:20130529.macroauthormig.php',1466802857,NULL),('phabricator:20130530.macrodatekey.sql',1466802857,NULL),('phabricator:20130530.pastekeys.sql',1466802857,NULL),('phabricator:20130530.sessionhash.php',1466802857,NULL),('phabricator:20130531.filekeys.sql',1466802857,NULL),('phabricator:20130602.morediviner.sql',1466802858,NULL),('phabricator:20130602.namedqueries.sql',1466802858,NULL),('phabricator:20130606.userxactions.sql',1466802858,NULL),('phabricator:20130607.xaccount.sql',1466802858,NULL),('phabricator:20130611.migrateoauth.php',1466802858,NULL),('phabricator:20130611.nukeldap.php',1466802858,NULL),('phabricator:20130613.authdb.sql',1466802858,NULL),('phabricator:20130619.authconf.php',1466802858,NULL),('phabricator:20130620.diffxactions.sql',1466802858,NULL),('phabricator:20130621.diffcommentphid.sql',1466802858,NULL),('phabricator:20130621.diffcommentphidmig.php',1466802858,NULL),('phabricator:20130621.diffcommentunphid.sql',1466802858,NULL),('phabricator:20130622.doorkeeper.sql',1466802858,NULL),('phabricator:20130628.legalpadv0.sql',1466802858,NULL),('phabricator:20130701.conduitlog.sql',1466802858,NULL),('phabricator:20130703.legalpaddocdenorm.php',1466802858,NULL),('phabricator:20130703.legalpaddocdenorm.sql',1466802858,NULL),('phabricator:20130709.droptimeline.sql',1466802858,NULL),('phabricator:20130709.legalpadsignature.sql',1466802858,NULL),('phabricator:20130711.pholioimageobsolete.php',1466802858,NULL),('phabricator:20130711.pholioimageobsolete.sql',1466802858,NULL),('phabricator:20130711.pholioimageobsolete2.sql',1466802858,NULL),('phabricator:20130711.trimrealnames.php',1466802858,NULL),('phabricator:20130714.votexactions.sql',1466802858,NULL),('phabricator:20130715.votecomments.php',1466802858,NULL),('phabricator:20130715.voteedges.sql',1466802858,NULL),('phabricator:20130716.archivememberlessprojects.php',1466802858,NULL),('phabricator:20130722.pholioreplace.sql',1466802858,NULL),('phabricator:20130723.taskstarttime.sql',1466802858,NULL),('phabricator:20130726.ponderxactions.sql',1466802858,NULL),('phabricator:20130727.ponderquestionstatus.sql',1466802858,NULL),('phabricator:20130728.ponderunique.php',1466802858,NULL),('phabricator:20130728.ponderuniquekey.sql',1466802858,NULL),('phabricator:20130728.ponderxcomment.php',1466802858,NULL),('phabricator:20130731.releephcutpointidentifier.sql',1466802858,NULL),('phabricator:20130731.releephproject.sql',1466802858,NULL),('phabricator:20130731.releephrepoid.sql',1466802858,NULL),('phabricator:20130801.pastexactions.php',1466802858,NULL),('phabricator:20130801.pastexactions.sql',1466802858,NULL),('phabricator:20130802.heraldphid.sql',1466802858,NULL),('phabricator:20130802.heraldphids.php',1466802858,NULL),('phabricator:20130802.heraldphidukey.sql',1466802858,NULL),('phabricator:20130802.heraldxactions.sql',1466802858,NULL),('phabricator:20130805.pasteedges.sql',1466802858,NULL),('phabricator:20130805.pastemailkey.sql',1466802858,NULL),('phabricator:20130805.pastemailkeypop.php',1466802858,NULL),('phabricator:20130814.usercustom.sql',1466802858,NULL),('phabricator:20130820.file-mailkey-populate.php',1466802859,NULL),('phabricator:20130820.filemailkey.sql',1466802859,NULL),('phabricator:20130820.filexactions.sql',1466802859,NULL),('phabricator:20130820.releephxactions.sql',1466802858,NULL),('phabricator:20130826.divinernode.sql',1466802859,NULL),('phabricator:20130912.maniphest.1.touch.sql',1466802859,NULL),('phabricator:20130912.maniphest.2.created.sql',1466802859,NULL),('phabricator:20130912.maniphest.3.nameindex.sql',1466802859,NULL),('phabricator:20130912.maniphest.4.fillindex.php',1466802859,NULL),('phabricator:20130913.maniphest.1.migratesearch.php',1466802859,NULL),('phabricator:20130914.usercustom.sql',1466802859,NULL),('phabricator:20130915.maniphestcustom.sql',1466802859,NULL),('phabricator:20130915.maniphestmigrate.php',1466802859,NULL),('phabricator:20130915.maniphestqdrop.sql',1466802859,NULL),('phabricator:20130919.mfieldconf.php',1466802859,NULL),('phabricator:20130920.repokeyspolicy.sql',1466802859,NULL),('phabricator:20130921.mtransactions.sql',1466802859,NULL),('phabricator:20130921.xmigratemaniphest.php',1466802859,NULL),('phabricator:20130923.mrename.sql',1466802859,NULL),('phabricator:20130924.mdraftkey.sql',1466802859,NULL),('phabricator:20130925.mpolicy.sql',1466802859,NULL),('phabricator:20130925.xpolicy.sql',1466802859,NULL),('phabricator:20130926.dcustom.sql',1466802859,NULL),('phabricator:20130926.dinkeys.sql',1466802859,NULL),('phabricator:20130926.dinline.php',1466802859,NULL),('phabricator:20130927.audiomacro.sql',1466802859,NULL),('phabricator:20130929.filepolicy.sql',1466802859,NULL),('phabricator:20131004.dxedgekey.sql',1466802859,NULL),('phabricator:20131004.dxreviewers.php',1466802859,NULL),('phabricator:20131006.hdisable.sql',1466802859,NULL),('phabricator:20131010.pstorage.sql',1466802859,NULL),('phabricator:20131015.cpolicy.sql',1466802859,NULL),('phabricator:20131020.col1.sql',1466802859,NULL),('phabricator:20131020.harbormaster.sql',1466802859,NULL),('phabricator:20131020.pcustom.sql',1466802859,NULL),('phabricator:20131020.pxaction.sql',1466802859,NULL),('phabricator:20131020.pxactionmig.php',1466802859,NULL),('phabricator:20131025.repopush.sql',1466802859,NULL),('phabricator:20131026.commitstatus.sql',1466802859,NULL),('phabricator:20131030.repostatusmessage.sql',1466802859,NULL),('phabricator:20131031.vcspassword.sql',1466802859,NULL),('phabricator:20131105.buildstep.sql',1466802859,NULL),('phabricator:20131106.diffphid.1.col.sql',1466802859,NULL),('phabricator:20131106.diffphid.2.mig.php',1466802859,NULL),('phabricator:20131106.diffphid.3.key.sql',1466802859,NULL),('phabricator:20131106.nuance-v0.sql',1466802859,NULL),('phabricator:20131107.buildlog.sql',1466802859,NULL),('phabricator:20131112.userverified.1.col.sql',1466802859,NULL),('phabricator:20131112.userverified.2.mig.php',1466802859,NULL),('phabricator:20131118.ownerorder.php',1466802859,NULL),('phabricator:20131119.passphrase.sql',1466802859,NULL),('phabricator:20131120.nuancesourcetype.sql',1466802860,NULL),('phabricator:20131121.passphraseedge.sql',1466802860,NULL),('phabricator:20131121.repocredentials.1.col.sql',1466802860,NULL),('phabricator:20131121.repocredentials.2.mig.php',1466802860,NULL),('phabricator:20131122.repomirror.sql',1466802860,NULL),('phabricator:20131123.drydockblueprintpolicy.sql',1466802860,NULL),('phabricator:20131129.drydockresourceblueprint.sql',1466802860,NULL),('phabricator:20131204.pushlog.sql',1466802860,NULL),('phabricator:20131205.buildsteporder.sql',1466802860,NULL),('phabricator:20131205.buildstepordermig.php',1466802860,NULL),('phabricator:20131205.buildtargets.sql',1466802860,NULL),('phabricator:20131206.phragment.sql',1466802860,NULL),('phabricator:20131206.phragmentnull.sql',1466802860,NULL),('phabricator:20131208.phragmentsnapshot.sql',1466802860,NULL),('phabricator:20131211.phragmentedges.sql',1466802860,NULL),('phabricator:20131217.pushlogphid.1.col.sql',1466802860,NULL),('phabricator:20131217.pushlogphid.2.mig.php',1466802860,NULL),('phabricator:20131217.pushlogphid.3.key.sql',1466802860,NULL),('phabricator:20131219.pxdrop.sql',1466802860,NULL),('phabricator:20131224.harbormanual.sql',1466802860,NULL),('phabricator:20131227.heraldobject.sql',1466802860,NULL),('phabricator:20131231.dropshortcut.sql',1466802860,NULL),('phabricator:20131302.maniphestvalue.sql',1466802857,NULL),('phabricator:20140104.harbormastercmd.sql',1466802860,NULL),('phabricator:20140106.macromailkey.1.sql',1466802860,NULL),('phabricator:20140106.macromailkey.2.php',1466802860,NULL),('phabricator:20140108.ddbpname.1.sql',1466802860,NULL),('phabricator:20140108.ddbpname.2.php',1466802860,NULL),('phabricator:20140109.ddxactions.sql',1466802860,NULL),('phabricator:20140109.projectcolumnsdates.sql',1466802860,NULL),('phabricator:20140113.legalpadsig.1.sql',1466802860,NULL),('phabricator:20140113.legalpadsig.2.php',1466802860,NULL),('phabricator:20140115.auth.1.id.sql',1466802860,NULL),('phabricator:20140115.auth.2.expires.sql',1466802860,NULL),('phabricator:20140115.auth.3.unlimit.php',1466802860,NULL),('phabricator:20140115.legalpadsigkey.sql',1466802860,NULL),('phabricator:20140116.reporefcursor.sql',1466802860,NULL),('phabricator:20140126.diff.1.parentrevisionid.sql',1466802860,NULL),('phabricator:20140126.diff.2.repositoryphid.sql',1466802860,NULL),('phabricator:20140130.dash.1.board.sql',1466802860,NULL),('phabricator:20140130.dash.2.panel.sql',1466802860,NULL),('phabricator:20140130.dash.3.boardxaction.sql',1466802860,NULL),('phabricator:20140130.dash.4.panelxaction.sql',1466802860,NULL),('phabricator:20140130.mail.1.retry.sql',1466802860,NULL),('phabricator:20140130.mail.2.next.sql',1466802860,NULL),('phabricator:20140201.gc.1.mailsent.sql',1466802860,NULL),('phabricator:20140201.gc.2.mailreceived.sql',1466802860,NULL),('phabricator:20140205.cal.1.rename.sql',1466802860,NULL),('phabricator:20140205.cal.2.phid-col.sql',1466802860,NULL),('phabricator:20140205.cal.3.phid-mig.php',1466802860,NULL),('phabricator:20140205.cal.4.phid-key.sql',1466802860,NULL),('phabricator:20140210.herald.rule-condition-mig.php',1466802860,NULL),('phabricator:20140210.projcfield.1.blurb.php',1466802860,NULL),('phabricator:20140210.projcfield.2.piccol.sql',1466802860,NULL),('phabricator:20140210.projcfield.3.picmig.sql',1466802860,NULL),('phabricator:20140210.projcfield.4.memmig.sql',1466802860,NULL),('phabricator:20140210.projcfield.5.dropprofile.sql',1466802860,NULL),('phabricator:20140211.dx.1.nullablechangesetid.sql',1466802860,NULL),('phabricator:20140211.dx.2.migcommenttext.php',1466802860,NULL),('phabricator:20140211.dx.3.migsubscriptions.sql',1466802860,NULL),('phabricator:20140211.dx.999.drop.relationships.sql',1466802860,NULL),('phabricator:20140212.dx.1.armageddon.php',1466802860,NULL),('phabricator:20140214.clean.1.legacycommentid.sql',1466802860,NULL),('phabricator:20140214.clean.2.dropcomment.sql',1466802860,NULL),('phabricator:20140214.clean.3.dropinline.sql',1466802860,NULL),('phabricator:20140218.differentialdraft.sql',1466802860,NULL),('phabricator:20140218.passwords.1.extend.sql',1466802860,NULL),('phabricator:20140218.passwords.2.prefix.sql',1466802860,NULL),('phabricator:20140218.passwords.3.vcsextend.sql',1466802860,NULL),('phabricator:20140218.passwords.4.vcs.php',1466802860,NULL),('phabricator:20140223.bigutf8scratch.sql',1466802860,NULL),('phabricator:20140224.dxclean.1.datecommitted.sql',1466802860,NULL),('phabricator:20140226.dxcustom.1.fielddata.php',1466802860,NULL),('phabricator:20140226.dxcustom.99.drop.sql',1466802860,NULL),('phabricator:20140228.dxcomment.1.sql',1466802860,NULL),('phabricator:20140305.diviner.1.slugcol.sql',1466802861,NULL),('phabricator:20140305.diviner.2.slugkey.sql',1466802861,NULL),('phabricator:20140311.mdroplegacy.sql',1466802861,NULL),('phabricator:20140314.projectcolumn.1.statuscol.sql',1466802861,NULL),('phabricator:20140314.projectcolumn.2.statuskey.sql',1466802861,NULL),('phabricator:20140317.mupdatedkey.sql',1466802861,NULL),('phabricator:20140321.harbor.1.bxaction.sql',1466802861,NULL),('phabricator:20140321.mstatus.1.col.sql',1466802861,NULL),('phabricator:20140321.mstatus.2.mig.php',1466802861,NULL),('phabricator:20140323.harbor.1.renames.php',1466802861,NULL),('phabricator:20140323.harbor.2.message.sql',1466802861,NULL),('phabricator:20140325.push.1.event.sql',1466802861,NULL),('phabricator:20140325.push.2.eventphid.sql',1466802861,NULL),('phabricator:20140325.push.3.groups.php',1466802861,NULL),('phabricator:20140325.push.4.prune.sql',1466802861,NULL),('phabricator:20140326.project.1.colxaction.sql',1466802861,NULL),('phabricator:20140328.releeph.1.productxaction.sql',1466802861,NULL),('phabricator:20140330.flagtext.sql',1466802861,NULL),('phabricator:20140402.actionlog.sql',1466802861,NULL),('phabricator:20140410.accountsecret.1.sql',1466802861,NULL),('phabricator:20140410.accountsecret.2.php',1466802861,NULL),('phabricator:20140416.harbor.1.sql',1466802861,NULL),('phabricator:20140420.rel.1.objectphid.sql',1466802861,NULL),('phabricator:20140420.rel.2.objectmig.php',1466802861,NULL),('phabricator:20140421.slowvotecolumnsisclosed.sql',1466802861,NULL),('phabricator:20140423.session.1.hisec.sql',1466802861,NULL),('phabricator:20140427.mfactor.1.sql',1466802861,NULL),('phabricator:20140430.auth.1.partial.sql',1466802861,NULL),('phabricator:20140430.dash.1.paneltype.sql',1466802861,NULL),('phabricator:20140430.dash.2.edge.sql',1466802861,NULL),('phabricator:20140501.passphraselockcredential.sql',1466802861,NULL),('phabricator:20140501.remove.1.dlog.sql',1466802861,NULL),('phabricator:20140507.smstable.sql',1466802861,NULL),('phabricator:20140509.coverage.1.sql',1466802861,NULL),('phabricator:20140509.dashboardlayoutconfig.sql',1466802861,NULL),('phabricator:20140512.dparents.1.sql',1466802861,NULL),('phabricator:20140514.harbormasterbuildabletransaction.sql',1466802861,NULL),('phabricator:20140514.pholiomockclose.sql',1466802861,NULL),('phabricator:20140515.trust-emails.sql',1466802861,NULL),('phabricator:20140517.dxbinarycache.sql',1466802861,NULL),('phabricator:20140518.dxmorebinarycache.sql',1466802861,NULL),('phabricator:20140519.dashboardinstall.sql',1466802861,NULL),('phabricator:20140520.authtemptoken.sql',1466802861,NULL),('phabricator:20140521.projectslug.1.create.sql',1466802861,NULL),('phabricator:20140521.projectslug.2.mig.php',1466802861,NULL),('phabricator:20140522.projecticon.sql',1466802861,NULL),('phabricator:20140524.auth.mfa.cache.sql',1466802861,NULL),('phabricator:20140525.hunkmodern.sql',1466802861,NULL),('phabricator:20140615.pholioedit.1.sql',1466802861,NULL),('phabricator:20140615.pholioedit.2.sql',1466802861,NULL),('phabricator:20140617.daemon.explicit-argv.sql',1466802861,NULL),('phabricator:20140617.daemonlog.sql',1466802861,NULL),('phabricator:20140624.projcolor.1.sql',1466802861,NULL),('phabricator:20140624.projcolor.2.sql',1466802861,NULL),('phabricator:20140629.dasharchive.1.sql',1466802861,NULL),('phabricator:20140629.legalsig.1.sql',1466802861,NULL),('phabricator:20140629.legalsig.2.php',1466802861,NULL),('phabricator:20140701.legalexemption.1.sql',1466802861,NULL),('phabricator:20140701.legalexemption.2.sql',1466802861,NULL),('phabricator:20140703.legalcorp.1.sql',1466802861,NULL),('phabricator:20140703.legalcorp.2.sql',1466802861,NULL),('phabricator:20140703.legalcorp.3.sql',1466802861,NULL),('phabricator:20140703.legalcorp.4.sql',1466802861,NULL),('phabricator:20140703.legalcorp.5.sql',1466802861,NULL),('phabricator:20140704.harbormasterstep.1.sql',1466802861,NULL),('phabricator:20140704.harbormasterstep.2.sql',1466802861,NULL),('phabricator:20140704.legalpreamble.1.sql',1466802861,NULL),('phabricator:20140706.harbormasterdepend.1.php',1466802861,NULL),('phabricator:20140706.pedge.1.sql',1466802861,NULL),('phabricator:20140711.pnames.1.sql',1466802861,NULL),('phabricator:20140711.pnames.2.php',1466802861,NULL),('phabricator:20140711.workerpriority.sql',1466802862,NULL),('phabricator:20140712.projcoluniq.sql',1466802862,NULL),('phabricator:20140721.phortune.1.cart.sql',1466802862,NULL),('phabricator:20140721.phortune.2.purchase.sql',1466802862,NULL),('phabricator:20140721.phortune.3.charge.sql',1466802862,NULL),('phabricator:20140721.phortune.4.cartstatus.sql',1466802862,NULL),('phabricator:20140721.phortune.5.cstatusdefault.sql',1466802862,NULL),('phabricator:20140721.phortune.6.onetimecharge.sql',1466802862,NULL),('phabricator:20140721.phortune.7.nullmethod.sql',1466802862,NULL),('phabricator:20140722.appname.php',1466802862,NULL),('phabricator:20140722.audit.1.xactions.sql',1466802862,NULL),('phabricator:20140722.audit.2.comments.sql',1466802862,NULL),('phabricator:20140722.audit.3.miginlines.php',1466802862,NULL),('phabricator:20140722.audit.4.migtext.php',1466802862,NULL),('phabricator:20140722.renameauth.php',1466802862,NULL),('phabricator:20140723.apprenamexaction.sql',1466802862,NULL),('phabricator:20140725.audit.1.migxactions.php',1466802862,NULL),('phabricator:20140731.audit.1.subscribers.php',1466802862,NULL),('phabricator:20140731.cancdn.php',1466802862,NULL),('phabricator:20140731.harbormasterstepdesc.sql',1466802862,NULL),('phabricator:20140805.boardcol.1.sql',1466802862,NULL),('phabricator:20140805.boardcol.2.php',1466802862,NULL),('phabricator:20140807.harbormastertargettime.sql',1466802862,NULL),('phabricator:20140808.boardprop.1.sql',1466802862,NULL),('phabricator:20140808.boardprop.2.sql',1466802862,NULL),('phabricator:20140808.boardprop.3.php',1466802862,NULL),('phabricator:20140811.blob.1.sql',1466802862,NULL),('phabricator:20140811.blob.2.sql',1466802862,NULL),('phabricator:20140812.projkey.1.sql',1466802862,NULL),('phabricator:20140812.projkey.2.sql',1466802862,NULL),('phabricator:20140814.passphrasecredentialconduit.sql',1466802862,NULL),('phabricator:20140815.cancdncase.php',1466802862,NULL),('phabricator:20140818.harbormasterindex.1.sql',1466802862,NULL),('phabricator:20140821.harbormasterbuildgen.1.sql',1466802862,NULL),('phabricator:20140822.daemonenvhash.sql',1466802862,NULL),('phabricator:20140902.almanacdevice.1.sql',1466802862,NULL),('phabricator:20140904.macroattach.php',1466802862,NULL),('phabricator:20140911.fund.1.initiative.sql',1466802862,NULL),('phabricator:20140911.fund.2.xaction.sql',1466802862,NULL),('phabricator:20140911.fund.3.edge.sql',1466802862,NULL),('phabricator:20140911.fund.4.backer.sql',1466802862,NULL),('phabricator:20140911.fund.5.backxaction.sql',1466802862,NULL),('phabricator:20140914.betaproto.php',1466802862,NULL),('phabricator:20140917.project.canlock.sql',1466802862,NULL),('phabricator:20140918.schema.1.dropaudit.sql',1466802862,NULL),('phabricator:20140918.schema.2.dropauditinline.sql',1466802862,NULL),('phabricator:20140918.schema.3.wipecache.sql',1466802862,NULL),('phabricator:20140918.schema.4.cachetype.sql',1466802862,NULL),('phabricator:20140918.schema.5.slowvote.sql',1466802862,NULL),('phabricator:20140919.schema.01.calstatus.sql',1466802862,NULL),('phabricator:20140919.schema.02.calname.sql',1466802862,NULL),('phabricator:20140919.schema.03.dropaux.sql',1466802862,NULL),('phabricator:20140919.schema.04.droptaskproj.sql',1466802862,NULL),('phabricator:20140926.schema.01.droprelev.sql',1466802862,NULL),('phabricator:20140926.schema.02.droprelreqev.sql',1466802862,NULL),('phabricator:20140926.schema.03.dropldapinfo.sql',1466802862,NULL),('phabricator:20140926.schema.04.dropoauthinfo.sql',1466802862,NULL),('phabricator:20140926.schema.05.dropprojaffil.sql',1466802862,NULL),('phabricator:20140926.schema.06.dropsubproject.sql',1466802862,NULL),('phabricator:20140926.schema.07.droppondcom.sql',1466802862,NULL),('phabricator:20140927.schema.01.dropsearchq.sql',1466802862,NULL),('phabricator:20140927.schema.02.pholio1.sql',1466802862,NULL),('phabricator:20140927.schema.03.pholio2.sql',1466802862,NULL),('phabricator:20140927.schema.04.pholio3.sql',1466802862,NULL),('phabricator:20140927.schema.05.phragment1.sql',1466802862,NULL),('phabricator:20140927.schema.06.releeph1.sql',1466802862,NULL),('phabricator:20141001.schema.01.version.sql',1466802862,NULL),('phabricator:20141001.schema.02.taskmail.sql',1466802862,NULL),('phabricator:20141002.schema.01.liskcounter.sql',1466802862,NULL),('phabricator:20141002.schema.02.draftnull.sql',1466802862,NULL),('phabricator:20141004.currency.01.sql',1466802862,NULL),('phabricator:20141004.currency.02.sql',1466802862,NULL),('phabricator:20141004.currency.03.sql',1466802862,NULL),('phabricator:20141004.currency.04.sql',1466802862,NULL),('phabricator:20141004.currency.05.sql',1466802862,NULL),('phabricator:20141004.currency.06.sql',1466802862,NULL),('phabricator:20141004.harborliskcounter.sql',1466802862,NULL),('phabricator:20141005.phortuneproduct.sql',1466802862,NULL),('phabricator:20141006.phortunecart.sql',1466802862,NULL),('phabricator:20141006.phortunemerchant.sql',1466802863,NULL),('phabricator:20141006.phortunemerchantx.sql',1466802863,NULL),('phabricator:20141007.fundmerchant.sql',1466802863,NULL),('phabricator:20141007.fundrisks.sql',1466802863,NULL),('phabricator:20141007.fundtotal.sql',1466802863,NULL),('phabricator:20141007.phortunecartmerchant.sql',1466802863,NULL),('phabricator:20141007.phortunecharge.sql',1466802863,NULL),('phabricator:20141007.phortunepayment.sql',1466802863,NULL),('phabricator:20141007.phortuneprovider.sql',1466802863,NULL),('phabricator:20141007.phortuneproviderx.sql',1466802863,NULL),('phabricator:20141008.phortunemerchdesc.sql',1466802863,NULL),('phabricator:20141008.phortuneprovdis.sql',1466802863,NULL),('phabricator:20141008.phortunerefund.sql',1466802863,NULL),('phabricator:20141010.fundmailkey.sql',1466802863,NULL),('phabricator:20141011.phortunemerchedit.sql',1466802863,NULL),('phabricator:20141012.phortunecartxaction.sql',1466802863,NULL),('phabricator:20141013.phortunecartkey.sql',1466802863,NULL),('phabricator:20141016.almanac.device.sql',1466802863,NULL),('phabricator:20141016.almanac.dxaction.sql',1466802863,NULL),('phabricator:20141016.almanac.interface.sql',1466802863,NULL),('phabricator:20141016.almanac.network.sql',1466802863,NULL),('phabricator:20141016.almanac.nxaction.sql',1466802863,NULL),('phabricator:20141016.almanac.service.sql',1466802863,NULL),('phabricator:20141016.almanac.sxaction.sql',1466802863,NULL),('phabricator:20141017.almanac.binding.sql',1466802863,NULL),('phabricator:20141017.almanac.bxaction.sql',1466802863,NULL),('phabricator:20141025.phriction.1.xaction.sql',1466802863,NULL),('phabricator:20141025.phriction.2.xaction.sql',1466802863,NULL),('phabricator:20141025.phriction.mailkey.sql',1466802863,NULL),('phabricator:20141103.almanac.1.delprop.sql',1466802863,NULL),('phabricator:20141103.almanac.2.addprop.sql',1466802863,NULL),('phabricator:20141104.almanac.3.edge.sql',1466802863,NULL),('phabricator:20141105.ssh.1.rename.sql',1466802863,NULL),('phabricator:20141106.dropold.sql',1466802863,NULL),('phabricator:20141106.uniqdrafts.php',1466802863,NULL),('phabricator:20141107.phriction.policy.1.sql',1466802863,NULL),('phabricator:20141107.phriction.policy.2.php',1466802863,NULL),('phabricator:20141107.phriction.popkeys.php',1466802863,NULL),('phabricator:20141107.ssh.1.colname.sql',1466802863,NULL),('phabricator:20141107.ssh.2.keyhash.sql',1466802863,NULL),('phabricator:20141107.ssh.3.keyindex.sql',1466802863,NULL),('phabricator:20141107.ssh.4.keymig.php',1466802863,NULL),('phabricator:20141107.ssh.5.indexnull.sql',1466802863,NULL),('phabricator:20141107.ssh.6.indexkey.sql',1466802863,NULL),('phabricator:20141107.ssh.7.colnull.sql',1466802863,NULL),('phabricator:20141113.auditdupes.php',1466802863,NULL),('phabricator:20141118.diffxaction.sql',1466802863,NULL),('phabricator:20141119.commitpedge.sql',1466802863,NULL),('phabricator:20141119.differential.diff.policy.sql',1466802863,NULL),('phabricator:20141119.sshtrust.sql',1466802863,NULL),('phabricator:20141123.taskpriority.1.sql',1466802863,NULL),('phabricator:20141123.taskpriority.2.sql',1466802863,NULL),('phabricator:20141210.maniphestsubscribersmig.1.sql',1466802863,NULL),('phabricator:20141210.maniphestsubscribersmig.2.sql',1466802863,NULL),('phabricator:20141210.reposervice.sql',1466802863,NULL),('phabricator:20141212.conduittoken.sql',1466802863,NULL),('phabricator:20141215.almanacservicetype.sql',1466802863,NULL),('phabricator:20141217.almanacdevicelock.sql',1466802864,NULL),('phabricator:20141217.almanaclock.sql',1466802864,NULL),('phabricator:20141218.maniphestcctxn.php',1466802864,NULL),('phabricator:20141222.maniphestprojtxn.php',1466802864,NULL),('phabricator:20141223.daemonloguser.sql',1466802864,NULL),('phabricator:20141223.daemonobjectphid.sql',1466802864,NULL),('phabricator:20141230.pasteeditpolicycolumn.sql',1466802864,NULL),('phabricator:20141230.pasteeditpolicyexisting.sql',1466802864,NULL),('phabricator:20150102.policyname.php',1466802864,NULL),('phabricator:20150102.tasksubscriber.sql',1466802864,NULL),('phabricator:20150105.conpsearch.sql',1466802864,NULL),('phabricator:20150114.oauthserver.client.policy.sql',1466802864,NULL),('phabricator:20150115.applicationemails.sql',1466802864,NULL),('phabricator:20150115.trigger.1.sql',1466802864,NULL),('phabricator:20150115.trigger.2.sql',1466802864,NULL),('phabricator:20150116.maniphestapplicationemails.php',1466802864,NULL),('phabricator:20150120.maniphestdefaultauthor.php',1466802864,NULL),('phabricator:20150124.subs.1.sql',1466802864,NULL),('phabricator:20150129.pastefileapplicationemails.php',1466802864,NULL),('phabricator:20150130.phortune.1.subphid.sql',1466802864,NULL),('phabricator:20150130.phortune.2.subkey.sql',1466802864,NULL),('phabricator:20150131.phortune.1.defaultpayment.sql',1466802864,NULL),('phabricator:20150205.authprovider.autologin.sql',1466802864,NULL),('phabricator:20150205.daemonenv.sql',1466802864,NULL),('phabricator:20150209.invite.sql',1466802864,NULL),('phabricator:20150209.oauthclient.trust.sql',1466802864,NULL),('phabricator:20150210.invitephid.sql',1466802864,NULL),('phabricator:20150212.legalpad.session.1.sql',1466802864,NULL),('phabricator:20150212.legalpad.session.2.sql',1466802864,NULL),('phabricator:20150219.scratch.nonmutable.sql',1466802864,NULL),('phabricator:20150223.daemon.1.id.sql',1466802864,NULL),('phabricator:20150223.daemon.2.idlegacy.sql',1466802864,NULL),('phabricator:20150223.daemon.3.idkey.sql',1466802864,NULL),('phabricator:20150312.filechunk.1.sql',1466802864,NULL),('phabricator:20150312.filechunk.2.sql',1466802864,NULL),('phabricator:20150312.filechunk.3.sql',1466802864,NULL),('phabricator:20150317.conpherence.isroom.1.sql',1466802864,NULL),('phabricator:20150317.conpherence.isroom.2.sql',1466802864,NULL),('phabricator:20150317.conpherence.policy.sql',1466802864,NULL),('phabricator:20150410.nukeruleedit.sql',1466802864,NULL),('phabricator:20150420.invoice.1.sql',1466802864,NULL),('phabricator:20150420.invoice.2.sql',1466802864,NULL),('phabricator:20150425.isclosed.sql',1466802864,NULL),('phabricator:20150427.calendar.1.edge.sql',1466802864,NULL),('phabricator:20150427.calendar.1.xaction.sql',1466802864,NULL),('phabricator:20150427.calendar.2.xaction.sql',1466802864,NULL),('phabricator:20150428.calendar.1.iscancelled.sql',1466802864,NULL),('phabricator:20150428.calendar.1.name.sql',1466802864,NULL),('phabricator:20150429.calendar.1.invitee.sql',1466802864,NULL),('phabricator:20150430.calendar.1.policies.sql',1466802864,NULL),('phabricator:20150430.multimeter.1.sql',1466802864,NULL),('phabricator:20150430.multimeter.2.host.sql',1466802864,NULL),('phabricator:20150430.multimeter.3.viewer.sql',1466802864,NULL),('phabricator:20150430.multimeter.4.context.sql',1466802864,NULL),('phabricator:20150430.multimeter.5.label.sql',1466802864,NULL),('phabricator:20150501.calendar.1.reply.sql',1466802864,NULL),('phabricator:20150501.calendar.2.reply.php',1466802864,NULL),('phabricator:20150501.conpherencepics.sql',1466802865,NULL),('phabricator:20150503.repositorysymbols.1.sql',1466802865,NULL),('phabricator:20150503.repositorysymbols.2.php',1466802865,NULL),('phabricator:20150503.repositorysymbols.3.sql',1466802865,NULL),('phabricator:20150504.symbolsproject.1.php',1466802865,NULL),('phabricator:20150504.symbolsproject.2.sql',1466802865,NULL),('phabricator:20150506.calendarunnamedevents.1.php',1466802865,NULL),('phabricator:20150507.calendar.1.isallday.sql',1466802865,NULL),('phabricator:20150513.user.cache.1.sql',1466802865,NULL),('phabricator:20150514.calendar.status.sql',1466802865,NULL),('phabricator:20150514.phame.blog.xaction.sql',1466802865,NULL),('phabricator:20150514.user.cache.2.sql',1466802865,NULL),('phabricator:20150515.phame.post.xaction.sql',1466802865,NULL),('phabricator:20150515.project.mailkey.1.sql',1466802865,NULL),('phabricator:20150515.project.mailkey.2.php',1466802865,NULL),('phabricator:20150519.calendar.calendaricon.sql',1466802865,NULL),('phabricator:20150521.releephrepository.sql',1466802865,NULL),('phabricator:20150525.diff.hidden.1.sql',1466802865,NULL),('phabricator:20150526.owners.mailkey.1.sql',1466802865,NULL),('phabricator:20150526.owners.mailkey.2.php',1466802865,NULL),('phabricator:20150526.owners.xaction.sql',1466802865,NULL),('phabricator:20150527.calendar.recurringevents.sql',1466802865,NULL),('phabricator:20150601.spaces.1.namespace.sql',1466802865,NULL),('phabricator:20150601.spaces.2.xaction.sql',1466802865,NULL),('phabricator:20150602.mlist.1.sql',1466802865,NULL),('phabricator:20150602.mlist.2.php',1466802865,NULL),('phabricator:20150604.spaces.1.sql',1466802865,NULL),('phabricator:20150605.diviner.edges.sql',1466802865,NULL),('phabricator:20150605.diviner.editPolicy.sql',1466802865,NULL),('phabricator:20150605.diviner.xaction.sql',1466802865,NULL),('phabricator:20150606.mlist.1.php',1466802865,NULL),('phabricator:20150609.inline.sql',1466802865,NULL),('phabricator:20150609.spaces.1.pholio.sql',1466802865,NULL),('phabricator:20150609.spaces.2.maniphest.sql',1466802865,NULL),('phabricator:20150610.spaces.1.desc.sql',1466802865,NULL),('phabricator:20150610.spaces.2.edge.sql',1466802865,NULL),('phabricator:20150610.spaces.3.archive.sql',1466802865,NULL),('phabricator:20150611.spaces.1.mailxaction.sql',1466802865,NULL),('phabricator:20150611.spaces.2.appmail.sql',1466802865,NULL),('phabricator:20150616.divinerrepository.sql',1466802865,NULL),('phabricator:20150617.harbor.1.lint.sql',1466802865,NULL),('phabricator:20150617.harbor.2.unit.sql',1466802865,NULL),('phabricator:20150618.harbor.1.planauto.sql',1466802866,NULL),('phabricator:20150618.harbor.2.stepauto.sql',1466802866,NULL),('phabricator:20150618.harbor.3.buildauto.sql',1466802866,NULL),('phabricator:20150619.conpherencerooms.1.sql',1466802866,NULL),('phabricator:20150619.conpherencerooms.2.sql',1466802866,NULL),('phabricator:20150619.conpherencerooms.3.sql',1466802866,NULL),('phabricator:20150621.phrase.1.sql',1466802866,NULL),('phabricator:20150621.phrase.2.sql',1466802866,NULL),('phabricator:20150622.bulk.1.job.sql',1466802866,NULL),('phabricator:20150622.bulk.2.task.sql',1466802866,NULL),('phabricator:20150622.bulk.3.xaction.sql',1466802866,NULL),('phabricator:20150622.bulk.4.edge.sql',1466802866,NULL),('phabricator:20150622.metamta.1.phid-col.sql',1466802866,NULL),('phabricator:20150622.metamta.2.phid-mig.php',1466802866,NULL),('phabricator:20150622.metamta.3.phid-key.sql',1466802866,NULL),('phabricator:20150622.metamta.4.actor-phid-col.sql',1466802866,NULL),('phabricator:20150622.metamta.5.actor-phid-mig.php',1466802866,NULL),('phabricator:20150622.metamta.6.actor-phid-key.sql',1466802866,NULL),('phabricator:20150624.spaces.1.repo.sql',1466802866,NULL),('phabricator:20150626.spaces.1.calendar.sql',1466802866,NULL),('phabricator:20150630.herald.1.sql',1466802866,NULL),('phabricator:20150630.herald.2.sql',1466802866,NULL),('phabricator:20150701.herald.1.sql',1466802866,NULL),('phabricator:20150701.herald.2.sql',1466802866,NULL),('phabricator:20150702.spaces.1.slowvote.sql',1466802866,NULL),('phabricator:20150706.herald.1.sql',1466802866,NULL),('phabricator:20150707.herald.1.sql',1466802866,NULL),('phabricator:20150708.arcanistproject.sql',1466802866,NULL),('phabricator:20150708.herald.1.sql',1466802866,NULL),('phabricator:20150708.herald.2.sql',1466802866,NULL),('phabricator:20150708.herald.3.sql',1466802866,NULL),('phabricator:20150712.badges.1.sql',1466802866,NULL),('phabricator:20150714.spaces.countdown.1.sql',1466802866,NULL),('phabricator:20150717.herald.1.sql',1466802866,NULL),('phabricator:20150719.countdown.1.sql',1466802866,NULL),('phabricator:20150719.countdown.2.sql',1466802866,NULL),('phabricator:20150719.countdown.3.sql',1466802866,NULL),('phabricator:20150721.phurl.1.url.sql',1466802866,NULL),('phabricator:20150721.phurl.2.xaction.sql',1466802866,NULL),('phabricator:20150721.phurl.3.xactioncomment.sql',1466802866,NULL),('phabricator:20150721.phurl.4.url.sql',1466802866,NULL),('phabricator:20150721.phurl.5.edge.sql',1466802866,NULL),('phabricator:20150721.phurl.6.alias.sql',1466802866,NULL),('phabricator:20150721.phurl.7.authorphid.sql',1466802866,NULL),('phabricator:20150722.dashboard.1.sql',1466802866,NULL),('phabricator:20150722.dashboard.2.sql',1466802866,NULL),('phabricator:20150723.countdown.1.sql',1466802866,NULL),('phabricator:20150724.badges.comments.1.sql',1466802866,NULL),('phabricator:20150724.countdown.comments.1.sql',1466802866,NULL),('phabricator:20150725.badges.mailkey.1.sql',1466802866,NULL),('phabricator:20150725.badges.mailkey.2.php',1466802866,NULL),('phabricator:20150725.badges.viewpolicy.3.sql',1466802866,NULL),('phabricator:20150725.countdown.mailkey.1.sql',1466802866,NULL),('phabricator:20150725.countdown.mailkey.2.php',1466802866,NULL),('phabricator:20150725.slowvote.mailkey.1.sql',1466802866,NULL),('phabricator:20150725.slowvote.mailkey.2.php',1466802866,NULL),('phabricator:20150727.heraldaction.1.sql',1466802866,NULL),('phabricator:20150730.herald.1.sql',1466802866,NULL),('phabricator:20150730.herald.2.sql',1466802866,NULL),('phabricator:20150730.herald.3.sql',1466802866,NULL),('phabricator:20150730.herald.4.sql',1466802866,NULL),('phabricator:20150730.herald.5.sql',1466802866,NULL),('phabricator:20150730.herald.6.sql',1466802866,NULL),('phabricator:20150730.herald.7.sql',1466802866,NULL),('phabricator:20150803.herald.1.sql',1466802866,NULL),('phabricator:20150803.herald.2.sql',1466802866,NULL),('phabricator:20150804.ponder.answer.mailkey.1.sql',1466802866,NULL),('phabricator:20150804.ponder.answer.mailkey.2.php',1466802866,NULL),('phabricator:20150804.ponder.question.1.sql',1466802867,NULL),('phabricator:20150804.ponder.question.2.sql',1466802867,NULL),('phabricator:20150804.ponder.question.3.sql',1466802867,NULL),('phabricator:20150804.ponder.spaces.4.sql',1466802867,NULL),('phabricator:20150805.paste.status.1.sql',1466802867,NULL),('phabricator:20150805.paste.status.2.sql',1466802867,NULL),('phabricator:20150806.ponder.answer.1.sql',1466802867,NULL),('phabricator:20150806.ponder.editpolicy.2.sql',1466802867,NULL),('phabricator:20150806.ponder.status.1.sql',1466802867,NULL),('phabricator:20150806.ponder.status.2.sql',1466802867,NULL),('phabricator:20150806.ponder.status.3.sql',1466802867,NULL),('phabricator:20150808.ponder.vote.1.sql',1466802867,NULL),('phabricator:20150808.ponder.vote.2.sql',1466802867,NULL),('phabricator:20150812.ponder.answer.1.sql',1466802867,NULL),('phabricator:20150812.ponder.answer.2.sql',1466802867,NULL),('phabricator:20150814.harbormater.artifact.phid.sql',1466802867,NULL),('phabricator:20150815.owners.status.1.sql',1466802867,NULL),('phabricator:20150815.owners.status.2.sql',1466802867,NULL),('phabricator:20150823.nuance.queue.1.sql',1466802867,NULL),('phabricator:20150823.nuance.queue.2.sql',1466802867,NULL),('phabricator:20150823.nuance.queue.3.sql',1466802867,NULL),('phabricator:20150823.nuance.queue.4.sql',1466802867,NULL),('phabricator:20150828.ponder.wiki.1.sql',1466802867,NULL),('phabricator:20150829.ponder.dupe.1.sql',1466802867,NULL),('phabricator:20150904.herald.1.sql',1466802867,NULL),('phabricator:20150906.mailinglist.sql',1466802867,NULL),('phabricator:20150910.owners.custom.1.sql',1466802867,NULL),('phabricator:20150916.drydock.slotlocks.1.sql',1466802867,NULL),('phabricator:20150922.drydock.commands.1.sql',1466802867,NULL),('phabricator:20150923.drydock.resourceid.1.sql',1466802867,NULL),('phabricator:20150923.drydock.resourceid.2.sql',1466802867,NULL),('phabricator:20150923.drydock.resourceid.3.sql',1466802867,NULL),('phabricator:20150923.drydock.taskid.1.sql',1466802867,NULL),('phabricator:20150924.drydock.disable.1.sql',1466802867,NULL),('phabricator:20150924.drydock.status.1.sql',1466802867,NULL),('phabricator:20150928.drydock.rexpire.1.sql',1466802867,NULL),('phabricator:20150930.drydock.log.1.sql',1466802867,NULL),('phabricator:20151001.drydock.rname.1.sql',1466802867,NULL),('phabricator:20151002.dashboard.status.1.sql',1466802867,NULL),('phabricator:20151002.harbormaster.bparam.1.sql',1466802867,NULL),('phabricator:20151009.drydock.auth.1.sql',1466802867,NULL),('phabricator:20151010.drydock.auth.2.sql',1466802867,NULL),('phabricator:20151013.drydock.op.1.sql',1466802867,NULL),('phabricator:20151023.harborpolicy.1.sql',1466802867,NULL),('phabricator:20151023.harborpolicy.2.php',1466802867,NULL),('phabricator:20151023.patchduration.sql',1466802867,16373),('phabricator:20151030.harbormaster.initiator.sql',1466802867,21600),('phabricator:20151106.editengine.1.table.sql',1466802867,9430),('phabricator:20151106.editengine.2.xactions.sql',1466802867,7174),('phabricator:20151106.phame.post.mailkey.1.sql',1466802867,19922),('phabricator:20151106.phame.post.mailkey.2.php',1466802867,1343),('phabricator:20151107.phame.blog.mailkey.1.sql',1466802867,17107),('phabricator:20151107.phame.blog.mailkey.2.php',1466802867,1049),('phabricator:20151108.phame.blog.joinpolicy.sql',1466802867,16781),('phabricator:20151108.xhpast.stderr.sql',1466802867,23962),('phabricator:20151109.phame.post.comments.1.sql',1466802867,8796),('phabricator:20151109.repository.coverage.1.sql',1466802867,1058),('phabricator:20151109.xhpast.db.1.sql',1466802867,1587),('phabricator:20151109.xhpast.db.2.sql',1466802867,561),('phabricator:20151110.daemonenvhash.sql',1466802867,36237),('phabricator:20151111.phame.blog.archive.1.sql',1466802867,16500),('phabricator:20151111.phame.blog.archive.2.sql',1466802867,479),('phabricator:20151112.herald.edge.sql',1466802867,14091),('phabricator:20151116.owners.edge.sql',1466802867,11769),('phabricator:20151128.phame.blog.picture.1.sql',1466802867,15526),('phabricator:20151130.phurl.mailkey.1.sql',1466802868,10082),('phabricator:20151130.phurl.mailkey.2.php',1466802868,1190),('phabricator:20151202.versioneddraft.1.sql',1466802868,8290),('phabricator:20151207.editengine.1.sql',1466802868,76502),('phabricator:20151210.land.1.refphid.sql',1466802868,15998),('phabricator:20151210.land.2.refphid.php',1466802868,751),('phabricator:20151215.phame.1.autotitle.sql',1466802868,20074),('phabricator:20151218.key.1.keyphid.sql',1466802868,15772),('phabricator:20151218.key.2.keyphid.php',1466802868,454),('phabricator:20151219.proj.01.prislug.sql',1466802868,22082),('phabricator:20151219.proj.02.prislugkey.sql',1466802868,15591),('phabricator:20151219.proj.03.copyslug.sql',1466802868,581),('phabricator:20151219.proj.04.dropslugkey.sql',1466802868,8692),('phabricator:20151219.proj.05.dropslug.sql',1466802868,21494),('phabricator:20151219.proj.06.defaultpolicy.php',1466802868,1250),('phabricator:20151219.proj.07.viewnull.sql',1466802868,14942),('phabricator:20151219.proj.08.editnull.sql',1466802868,11831),('phabricator:20151219.proj.09.joinnull.sql',1466802868,10583),('phabricator:20151219.proj.10.subcolumns.sql',1466802868,201986),('phabricator:20151219.proj.11.subprojectphids.sql',1466802868,23604),('phabricator:20151221.search.1.version.sql',1466802868,9540),('phabricator:20151221.search.2.ownersngrams.sql',1466802868,7522),('phabricator:20151221.search.3.reindex.php',1466802868,415),('phabricator:20151223.proj.01.paths.sql',1466802868,22569),('phabricator:20151223.proj.02.depths.sql',1466802868,25408),('phabricator:20151223.proj.03.pathkey.sql',1466802868,13193),('phabricator:20151223.proj.04.keycol.sql',1466802868,27276),('phabricator:20151223.proj.05.updatekeys.php',1466802868,451),('phabricator:20151223.proj.06.uniq.sql',1466802868,11754),('phabricator:20151226.reop.1.sql',1466802868,19139),('phabricator:20151227.proj.01.materialize.sql',1466802868,535),('phabricator:20151231.proj.01.icon.php',1466802868,1991),('phabricator:20160102.badges.award.sql',1466802868,10113),('phabricator:20160110.repo.01.slug.sql',1466802868,32438),('phabricator:20160110.repo.02.slug.php',1466802868,459),('phabricator:20160111.repo.01.slugx.sql',1466802868,627),('phabricator:20160112.repo.01.uri.sql',1466802868,8500),('phabricator:20160112.repo.02.uri.index.php',1466802868,64),('phabricator:20160113.propanel.1.storage.sql',1466802868,6858),('phabricator:20160113.propanel.2.xaction.sql',1466802868,7710),('phabricator:20160119.project.1.silence.sql',1466802868,579),('phabricator:20160122.project.1.boarddefault.php',1466802868,904),('phabricator:20160124.people.1.icon.sql',1466802868,12728),('phabricator:20160124.people.2.icondefault.sql',1466802868,477),('phabricator:20160128.repo.1.pull.sql',1466802868,9886),('phabricator:20160201.revision.properties.1.sql',1468278902,210120),('phabricator:20160201.revision.properties.2.sql',1468278902,3631),('phabricator:20160202.board.1.proxy.sql',1466802868,17041),('phabricator:20160202.ipv6.1.sql',1466802868,22960),('phabricator:20160202.ipv6.2.php',1466802868,1991),('phabricator:20160206.cover.1.sql',1466802868,29137),('phabricator:20160208.task.1.sql',1466802868,32546),('phabricator:20160208.task.2.sql',1466802868,33818),('phabricator:20160208.task.3.sql',1466802868,34881),('phabricator:20160212.proj.1.sql',1466802868,28365),('phabricator:20160212.proj.2.sql',1466802868,504),('phabricator:20160215.owners.policy.1.sql',1466802868,18780),('phabricator:20160215.owners.policy.2.sql',1466802868,17029),('phabricator:20160215.owners.policy.3.sql',1466802868,432),('phabricator:20160215.owners.policy.4.sql',1466802868,361),('phabricator:20160218.callsigns.1.sql',1466802869,12331),('phabricator:20160221.almanac.1.devicen.sql',1466802869,9432),('phabricator:20160221.almanac.2.devicei.php',1466802869,1470),('phabricator:20160221.almanac.3.servicen.sql',1466802869,7845),('phabricator:20160221.almanac.4.servicei.php',1466802869,916),('phabricator:20160221.almanac.5.networkn.sql',1466802869,8044),('phabricator:20160221.almanac.6.networki.php',1466802869,903),('phabricator:20160221.almanac.7.namespacen.sql',1466802869,7463),('phabricator:20160221.almanac.8.namespace.sql',1466802869,7462),('phabricator:20160221.almanac.9.namespacex.sql',1466802869,7400),('phabricator:20160222.almanac.1.properties.php',1466802869,1750),('phabricator:20160223.almanac.1.bound.sql',1466802869,16093),('phabricator:20160223.almanac.2.lockbind.sql',1466802869,447),('phabricator:20160223.almanac.3.devicelock.sql',1466802869,19320),('phabricator:20160223.almanac.4.servicelock.sql',1466802869,23933),('phabricator:20160223.paste.fileedges.php',1466802869,654),('phabricator:20160225.almanac.1.disablebinding.sql',1466802869,24011),('phabricator:20160225.almanac.2.stype.sql',1466802869,7243),('phabricator:20160225.almanac.3.stype.php',1466802869,464),('phabricator:20160227.harbormaster.1.plann.sql',1466802869,7447),('phabricator:20160227.harbormaster.2.plani.php',1466802869,367),('phabricator:20160303.drydock.1.bluen.sql',1466802869,6561),('phabricator:20160303.drydock.2.bluei.php',1466802869,323),('phabricator:20160303.drydock.3.edge.sql',1466802869,12513),('phabricator:20160308.nuance.01.disabled.sql',1466802869,14286),('phabricator:20160308.nuance.02.cursordata.sql',1466802869,14221),('phabricator:20160308.nuance.03.sourcen.sql',1466802869,7121),('phabricator:20160308.nuance.04.sourcei.php',1466802869,1214),('phabricator:20160308.nuance.05.sourcename.sql',1466802869,10244),('phabricator:20160308.nuance.06.label.sql',1466802869,18965),('phabricator:20160308.nuance.07.itemtype.sql',1466802869,25794),('phabricator:20160308.nuance.08.itemkey.sql',1466802869,21958),('phabricator:20160308.nuance.09.itemcontainer.sql',1466802869,22612),('phabricator:20160308.nuance.10.itemkeyu.sql',1466802869,552),('phabricator:20160308.nuance.11.requestor.sql',1466802869,14556),('phabricator:20160308.nuance.12.queue.sql',1466802869,19884),('phabricator:20160316.lfs.01.token.resource.sql',1466802869,13284),('phabricator:20160316.lfs.02.token.user.sql',1466802869,15555),('phabricator:20160316.lfs.03.token.properties.sql',1466802869,16563),('phabricator:20160316.lfs.04.token.default.sql',1466802869,581),('phabricator:20160317.lfs.01.ref.sql',1466802869,8120),('phabricator:20160321.nuance.01.taskbridge.sql',1466802869,28702),('phabricator:20160322.nuance.01.itemcommand.sql',1466802869,11727),('phabricator:20160323.badgemigrate.sql',1466802869,873),('phabricator:20160329.nuance.01.requestor.sql',1466802869,1313),('phabricator:20160329.nuance.02.requestorsource.sql',1466802869,1704),('phabricator:20160329.nuance.03.requestorxaction.sql',1466802869,1686),('phabricator:20160329.nuance.04.requestorcomment.sql',1466802869,1374),('phabricator:20160330.badges.migratequality.sql',1466802869,9959),('phabricator:20160330.badges.qualityxaction.mig.sql',1466802869,2022),('phabricator:20160331.fund.comments.1.sql',1466802869,6337),('phabricator:20160404.oauth.1.xaction.sql',1466802869,6577),('phabricator:20160405.oauth.2.disable.sql',1466802869,15800),('phabricator:20160406.badges.ngrams.php',1466802869,678),('phabricator:20160406.badges.ngrams.sql',1466802869,8117),('phabricator:20160406.columns.1.php',1466802869,543),('phabricator:20160411.repo.1.version.sql',1466802869,7060),('phabricator:20160418.repouri.1.sql',1466802869,6372),('phabricator:20160418.repouri.2.sql',1466802869,13856),('phabricator:20160418.repoversion.1.sql',1466802869,15751),('phabricator:20160419.pushlog.1.sql',1466802869,25118),('phabricator:20160424.locks.1.sql',1466802869,15525),('phabricator:20160426.searchedge.sql',1466802869,15875),('phabricator:20160428.repo.1.urixaction.sql',1466802869,7234),('phabricator:20160503.repo.01.lpath.sql',1466802869,23546),('phabricator:20160503.repo.02.lpathkey.sql',1466802869,12838),('phabricator:20160503.repo.03.lpathmigrate.php',1466802869,473),('phabricator:20160503.repo.04.mirrormigrate.php',1466802869,540),('phabricator:20160503.repo.05.urimigrate.php',1466802869,355),('phabricator:20160510.repo.01.uriindex.php',1466802869,4261),('phabricator:20160513.owners.01.autoreview.sql',1466802869,17537),('phabricator:20160513.owners.02.autoreviewnone.sql',1466802869,514),('phabricator:20160516.owners.01.dominion.sql',1466802869,16006),('phabricator:20160516.owners.02.dominionstrong.sql',1466802869,563),('phabricator:20160517.oauth.01.edge.sql',1466802869,13998),('phabricator:20160518.ssh.01.activecol.sql',1466802869,15647),('phabricator:20160518.ssh.02.activeval.sql',1466802869,485),('phabricator:20160518.ssh.03.activekey.sql',1466802869,10420),('phabricator:20160519.ssh.01.xaction.sql',1466802869,9024),('phabricator:20160531.pref.01.xaction.sql',1466802869,7837),('phabricator:20160531.pref.02.datecreatecol.sql',1466802869,11848),('phabricator:20160531.pref.03.datemodcol.sql',1466802869,13814),('phabricator:20160531.pref.04.datecreateval.sql',1466802869,429),('phabricator:20160531.pref.05.datemodval.sql',1466802869,305),('phabricator:20160531.pref.06.phidcol.sql',1466802869,12896),('phabricator:20160531.pref.07.phidval.php',1466802869,679),('phabricator:20160601.user.01.cache.sql',1466802869,9294),('phabricator:20160601.user.02.copyprefs.php',1466802869,1552),('phabricator:20160601.user.03.removetime.sql',1466802869,18764),('phabricator:20160601.user.04.removetranslation.sql',1466802869,20404),('phabricator:20160601.user.05.removesex.sql',1466802869,23968),('phabricator:20160603.user.01.removedcenabled.sql',1466802869,25907),('phabricator:20160603.user.02.removedctab.sql',1466802869,20792),('phabricator:20160603.user.03.removedcvisible.sql',1466802869,22140),('phabricator:20160604.user.01.stringmailprefs.php',1466802869,683),('phabricator:20160604.user.02.removeimagecache.sql',1466802870,22776),('phabricator:20160605.user.01.prefnulluser.sql',1466802870,12931),('phabricator:20160605.user.02.prefbuiltin.sql',1466802870,13598),('phabricator:20160605.user.03.builtinunique.sql',1466802870,12068),('phabricator:20160616.phame.blog.header.1.sql',1466802870,21493),('phabricator:20160616.repo.01.oldref.sql',1466802870,9001),('phabricator:20160617.harbormaster.01.arelease.sql',1466802870,16927),('phabricator:20160618.phame.blog.subtitle.sql',1466802870,28832),('phabricator:20160620.phame.blog.parentdomain.2.sql',1466802870,32443),('phabricator:20160620.phame.blog.parentsite.1.sql',1466802870,35279),('phabricator:20160623.phame.blog.fulldomain.1.sql',1466802870,37279),('phabricator:20160623.phame.blog.fulldomain.2.sql',1466802870,500),('phabricator:20160623.phame.blog.fulldomain.3.sql',1466802870,589),('phabricator:20160706.phame.blog.parentdomain.2.sql',1468278902,78556),('phabricator:20160706.phame.blog.parentsite.1.sql',1468278903,85373),('phabricator:daemonstatus.sql',1466802856,NULL),('phabricator:daemonstatuskey.sql',1466802856,NULL),('phabricator:daemontaskarchive.sql',1466802856,NULL),('phabricator:db.almanac',1466802850,NULL),('phabricator:db.audit',1466802850,NULL),('phabricator:db.auth',1466802850,NULL),('phabricator:db.badges',1466802850,NULL),('phabricator:db.cache',1466802850,NULL),('phabricator:db.calendar',1466802850,NULL),('phabricator:db.chatlog',1466802850,NULL),('phabricator:db.conduit',1466802850,NULL),('phabricator:db.config',1466802850,NULL),('phabricator:db.conpherence',1466802850,NULL),('phabricator:db.countdown',1466802850,NULL),('phabricator:db.daemon',1466802850,NULL),('phabricator:db.dashboard',1466802850,NULL),('phabricator:db.differential',1466802850,NULL),('phabricator:db.diviner',1466802850,NULL),('phabricator:db.doorkeeper',1466802850,NULL),('phabricator:db.draft',1466802850,NULL),('phabricator:db.drydock',1466802850,NULL),('phabricator:db.fact',1466802850,NULL),('phabricator:db.feed',1466802850,NULL),('phabricator:db.file',1466802850,NULL),('phabricator:db.flag',1466802850,NULL),('phabricator:db.fund',1466802850,NULL),('phabricator:db.harbormaster',1466802850,NULL),('phabricator:db.herald',1466802850,NULL),('phabricator:db.legalpad',1466802850,NULL),('phabricator:db.maniphest',1466802850,NULL),('phabricator:db.meta_data',1466802850,NULL),('phabricator:db.metamta',1466802850,NULL),('phabricator:db.multimeter',1466802850,NULL),('phabricator:db.nuance',1466802850,NULL),('phabricator:db.oauth_server',1466802850,NULL),('phabricator:db.owners',1466802850,NULL),('phabricator:db.passphrase',1466802850,NULL),('phabricator:db.pastebin',1466802850,NULL),('phabricator:db.phame',1466802850,NULL),('phabricator:db.phlux',1466802850,NULL),('phabricator:db.pholio',1466802850,NULL),('phabricator:db.phortune',1466802850,NULL),('phabricator:db.phragment',1466802850,NULL),('phabricator:db.phrequent',1466802850,NULL),('phabricator:db.phriction',1466802850,NULL),('phabricator:db.phurl',1466802850,NULL),('phabricator:db.policy',1466802850,NULL),('phabricator:db.ponder',1466802850,NULL),('phabricator:db.project',1466802850,NULL),('phabricator:db.releeph',1466802850,NULL),('phabricator:db.repository',1466802850,NULL),('phabricator:db.search',1466802850,NULL),('phabricator:db.slowvote',1466802850,NULL),('phabricator:db.spaces',1466802850,NULL),('phabricator:db.system',1466802850,NULL),('phabricator:db.timeline',1466802850,NULL),('phabricator:db.token',1466802850,NULL),('phabricator:db.user',1466802850,NULL),('phabricator:db.worker',1466802850,NULL),('phabricator:db.xhpast',1466802850,NULL),('phabricator:db.xhpastview',1466802850,NULL),('phabricator:db.xhprof',1466802850,NULL),('phabricator:differentialbookmarks.sql',1466802856,NULL),('phabricator:draft-metadata.sql',1466802856,NULL),('phabricator:dropfileproxyimage.sql',1466802856,NULL),('phabricator:drydockresoucetype.sql',1466802856,NULL),('phabricator:drydocktaskid.sql',1466802856,NULL),('phabricator:edgetype.sql',1466802856,NULL),('phabricator:emailtable.sql',1466802855,NULL),('phabricator:emailtableport.sql',1466802855,NULL),('phabricator:emailtableremove.sql',1466802855,NULL),('phabricator:fact-raw.sql',1466802856,NULL),('phabricator:harbormasterobject.sql',1466802856,NULL),('phabricator:holidays.sql',1466802855,NULL),('phabricator:ldapinfo.sql',1466802855,NULL),('phabricator:legalpad-mailkey-populate.php',1466802858,NULL),('phabricator:legalpad-mailkey.sql',1466802858,NULL),('phabricator:liskcounters-task.sql',1466802856,NULL),('phabricator:liskcounters.php',1466802856,NULL),('phabricator:liskcounters.sql',1466802856,NULL),('phabricator:maniphestxcache.sql',1466802856,NULL),('phabricator:markupcache.sql',1466802856,NULL),('phabricator:migrate-differential-dependencies.php',1466802856,NULL),('phabricator:migrate-maniphest-dependencies.php',1466802856,NULL),('phabricator:migrate-maniphest-revisions.php',1466802856,NULL),('phabricator:migrate-project-edges.php',1466802856,NULL),('phabricator:owners-exclude.sql',1466802856,NULL),('phabricator:pastepolicy.sql',1466802856,NULL),('phabricator:phameblog.sql',1466802856,NULL),('phabricator:phamedomain.sql',1466802856,NULL),('phabricator:phameoneblog.sql',1466802856,NULL),('phabricator:phamepolicy.sql',1466802856,NULL),('phabricator:phiddrop.sql',1466802855,NULL),('phabricator:pholio.sql',1466802856,NULL),('phabricator:policy-project.sql',1466802856,NULL),('phabricator:ponder-comments.sql',1466802856,NULL),('phabricator:ponder-mailkey-populate.php',1466802856,NULL),('phabricator:ponder-mailkey.sql',1466802856,NULL),('phabricator:ponder.sql',1466802856,NULL),('phabricator:releeph.sql',1466802857,NULL),('phabricator:repository-lint.sql',1466802856,NULL),('phabricator:statustxt.sql',1466802856,NULL),('phabricator:symbolcontexts.sql',1466802856,NULL),('phabricator:testdatabase.sql',1466802855,NULL),('phabricator:threadtopic.sql',1466802855,NULL),('phabricator:userstatus.sql',1466802855,NULL),('phabricator:usertranslation.sql',1466802855,NULL),('phabricator:xhprof.sql',1466802856,NULL);
/*!40000 ALTER TABLE `patch_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_metamta`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_metamta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_metamta`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_applicationemail`
--

DROP TABLE IF EXISTS `metamta_applicationemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metamta_applicationemail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `applicationPHID` varbinary(64) NOT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configData` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_address` (`address`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_application` (`applicationPHID`),
  KEY `key_space` (`spacePHID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_applicationemail`
--

LOCK TABLES `metamta_applicationemail` WRITE;
/*!40000 ALTER TABLE `metamta_applicationemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_applicationemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_applicationemailtransaction`
--

DROP TABLE IF EXISTS `metamta_applicationemailtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metamta_applicationemailtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_applicationemailtransaction`
--

LOCK TABLES `metamta_applicationemailtransaction` WRITE;
/*!40000 ALTER TABLE `metamta_applicationemailtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_applicationemailtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_mail`
--

DROP TABLE IF EXISTS `metamta_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metamta_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `actorPHID` varbinary(64) DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `relatedPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `relatedPHID` (`relatedPHID`),
  KEY `key_created` (`dateCreated`),
  KEY `key_actorPHID` (`actorPHID`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_mail`
--

LOCK TABLES `metamta_mail` WRITE;
/*!40000 ALTER TABLE `metamta_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metamta_receivedmail`
--

DROP TABLE IF EXISTS `metamta_receivedmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metamta_receivedmail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `headers` longtext COLLATE utf8mb4_bin NOT NULL,
  `bodies` longtext COLLATE utf8mb4_bin NOT NULL,
  `attachments` longtext COLLATE utf8mb4_bin NOT NULL,
  `relatedPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_bin,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `messageIDHash` binary(12) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relatedPHID` (`relatedPHID`),
  KEY `authorPHID` (`authorPHID`),
  KEY `key_messageIDHash` (`messageIDHash`),
  KEY `key_created` (`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metamta_receivedmail`
--

LOCK TABLES `metamta_receivedmail` WRITE;
/*!40000 ALTER TABLE `metamta_receivedmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `metamta_receivedmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `providerShortName` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `providerSMSID` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `toNumber` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `fromNumber` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin NOT NULL,
  `sendStatus` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_provider` (`providerSMSID`,`providerShortName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms`
--

LOCK TABLES `sms` WRITE;
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_multimeter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_multimeter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_multimeter`;

--
-- Table structure for table `multimeter_context`
--

DROP TABLE IF EXISTS `multimeter_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimeter_context` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `nameHash` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`nameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_context`
--

LOCK TABLES `multimeter_context` WRITE;
/*!40000 ALTER TABLE `multimeter_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimeter_event`
--

DROP TABLE IF EXISTS `multimeter_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimeter_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventType` int(10) unsigned NOT NULL,
  `eventLabelID` int(10) unsigned NOT NULL,
  `resourceCost` bigint(20) NOT NULL,
  `sampleRate` int(10) unsigned NOT NULL,
  `eventContextID` int(10) unsigned NOT NULL,
  `eventHostID` int(10) unsigned NOT NULL,
  `eventViewerID` int(10) unsigned NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `requestKey` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_request` (`requestKey`),
  KEY `key_type` (`eventType`,`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_event`
--

LOCK TABLES `multimeter_event` WRITE;
/*!40000 ALTER TABLE `multimeter_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimeter_host`
--

DROP TABLE IF EXISTS `multimeter_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimeter_host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `nameHash` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`nameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_host`
--

LOCK TABLES `multimeter_host` WRITE;
/*!40000 ALTER TABLE `multimeter_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimeter_label`
--

DROP TABLE IF EXISTS `multimeter_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimeter_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `nameHash` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`nameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_label`
--

LOCK TABLES `multimeter_label` WRITE;
/*!40000 ALTER TABLE `multimeter_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimeter_viewer`
--

DROP TABLE IF EXISTS `multimeter_viewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimeter_viewer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `nameHash` binary(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`nameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimeter_viewer`
--

LOCK TABLES `multimeter_viewer` WRITE;
/*!40000 ALTER TABLE `multimeter_viewer` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimeter_viewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_nuance`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_nuance` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_nuance`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_importcursordata`
--

DROP TABLE IF EXISTS `nuance_importcursordata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_importcursordata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `sourcePHID` varbinary(64) NOT NULL,
  `cursorKey` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `cursorType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_source` (`sourcePHID`,`cursorKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_importcursordata`
--

LOCK TABLES `nuance_importcursordata` WRITE;
/*!40000 ALTER TABLE `nuance_importcursordata` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_importcursordata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_item`
--

DROP TABLE IF EXISTS `nuance_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `requestorPHID` varbinary(64) DEFAULT NULL,
  `sourcePHID` varbinary(64) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `queuePHID` varbinary(64) DEFAULT NULL,
  `itemType` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `itemKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `itemContainerKey` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_item` (`sourcePHID`,`itemKey`),
  KEY `key_source` (`sourcePHID`,`status`),
  KEY `key_owner` (`ownerPHID`,`status`),
  KEY `key_requestor` (`requestorPHID`,`status`),
  KEY `key_queue` (`queuePHID`,`status`),
  KEY `key_container` (`sourcePHID`,`itemContainerKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_item`
--

LOCK TABLES `nuance_item` WRITE;
/*!40000 ALTER TABLE `nuance_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_itemcommand`
--

DROP TABLE IF EXISTS `nuance_itemcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_itemcommand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `command` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `parameters` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_item` (`itemPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_itemcommand`
--

LOCK TABLES `nuance_itemcommand` WRITE;
/*!40000 ALTER TABLE `nuance_itemcommand` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_itemcommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_itemtransaction`
--

DROP TABLE IF EXISTS `nuance_itemtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_itemtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_itemtransaction`
--

LOCK TABLES `nuance_itemtransaction` WRITE;
/*!40000 ALTER TABLE `nuance_itemtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_itemtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_itemtransaction_comment`
--

DROP TABLE IF EXISTS `nuance_itemtransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_itemtransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_itemtransaction_comment`
--

LOCK TABLES `nuance_itemtransaction_comment` WRITE;
/*!40000 ALTER TABLE `nuance_itemtransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_itemtransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_queue`
--

DROP TABLE IF EXISTS `nuance_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_queue`
--

LOCK TABLES `nuance_queue` WRITE;
/*!40000 ALTER TABLE `nuance_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_queuetransaction`
--

DROP TABLE IF EXISTS `nuance_queuetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_queuetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_queuetransaction`
--

LOCK TABLES `nuance_queuetransaction` WRITE;
/*!40000 ALTER TABLE `nuance_queuetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_queuetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_queuetransaction_comment`
--

DROP TABLE IF EXISTS `nuance_queuetransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_queuetransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_queuetransaction_comment`
--

LOCK TABLES `nuance_queuetransaction_comment` WRITE;
/*!40000 ALTER TABLE `nuance_queuetransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_queuetransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_source`
--

DROP TABLE IF EXISTS `nuance_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_source` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `defaultQueuePHID` varbinary(64) NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_type` (`type`,`dateModified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_source`
--

LOCK TABLES `nuance_source` WRITE;
/*!40000 ALTER TABLE `nuance_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_sourcename_ngrams`
--

DROP TABLE IF EXISTS `nuance_sourcename_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_sourcename_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_sourcename_ngrams`
--

LOCK TABLES `nuance_sourcename_ngrams` WRITE;
/*!40000 ALTER TABLE `nuance_sourcename_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_sourcename_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_sourcetransaction`
--

DROP TABLE IF EXISTS `nuance_sourcetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_sourcetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_sourcetransaction`
--

LOCK TABLES `nuance_sourcetransaction` WRITE;
/*!40000 ALTER TABLE `nuance_sourcetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_sourcetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_sourcetransaction_comment`
--

DROP TABLE IF EXISTS `nuance_sourcetransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_sourcetransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_sourcetransaction_comment`
--

LOCK TABLES `nuance_sourcetransaction_comment` WRITE;
/*!40000 ALTER TABLE `nuance_sourcetransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_sourcetransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_oauth_server`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_oauth_server` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_oauth_server`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_oauthclientauthorization`
--

DROP TABLE IF EXISTS `oauth_server_oauthclientauthorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_server_oauthclientauthorization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `clientPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `scope` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `userPHID` (`userPHID`,`clientPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_oauthclientauthorization`
--

LOCK TABLES `oauth_server_oauthclientauthorization` WRITE;
/*!40000 ALTER TABLE `oauth_server_oauthclientauthorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_oauthclientauthorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_oauthserveraccesstoken`
--

DROP TABLE IF EXISTS `oauth_server_oauthserveraccesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_server_oauthserveraccesstoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `clientPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_oauthserveraccesstoken`
--

LOCK TABLES `oauth_server_oauthserveraccesstoken` WRITE;
/*!40000 ALTER TABLE `oauth_server_oauthserveraccesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_oauthserveraccesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_oauthserverauthorizationcode`
--

DROP TABLE IF EXISTS `oauth_server_oauthserverauthorizationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_server_oauthserverauthorizationcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `clientPHID` varbinary(64) NOT NULL,
  `clientSecret` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `redirectURI` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_oauthserverauthorizationcode`
--

LOCK TABLES `oauth_server_oauthserverauthorizationcode` WRITE;
/*!40000 ALTER TABLE `oauth_server_oauthserverauthorizationcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_oauthserverauthorizationcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_oauthserverclient`
--

DROP TABLE IF EXISTS `oauth_server_oauthserverclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_server_oauthserverclient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `secret` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `redirectURI` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `isTrusted` tinyint(1) NOT NULL DEFAULT '0',
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `creatorPHID` (`creatorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_oauthserverclient`
--

LOCK TABLES `oauth_server_oauthserverclient` WRITE;
/*!40000 ALTER TABLE `oauth_server_oauthserverclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_oauthserverclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_server_transaction`
--

DROP TABLE IF EXISTS `oauth_server_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_server_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_server_transaction`
--

LOCK TABLES `oauth_server_transaction` WRITE;
/*!40000 ALTER TABLE `oauth_server_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_server_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_owners`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_owners` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_owners`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_customfieldnumericindex`
--

DROP TABLE IF EXISTS `owners_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_customfieldnumericindex`
--

LOCK TABLES `owners_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `owners_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_customfieldstorage`
--

DROP TABLE IF EXISTS `owners_customfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners_customfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_customfieldstorage`
--

LOCK TABLES `owners_customfieldstorage` WRITE;
/*!40000 ALTER TABLE `owners_customfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_customfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_customfieldstringindex`
--

DROP TABLE IF EXISTS `owners_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_customfieldstringindex`
--

LOCK TABLES `owners_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `owners_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_name_ngrams`
--

DROP TABLE IF EXISTS `owners_name_ngrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners_name_ngrams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectID` int(10) unsigned NOT NULL,
  `ngram` char(3) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_object` (`objectID`),
  KEY `key_ngram` (`ngram`,`objectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_name_ngrams`
--

LOCK TABLES `owners_name_ngrams` WRITE;
/*!40000 ALTER TABLE `owners_name_ngrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_name_ngrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_owner`
--

DROP TABLE IF EXISTS `owners_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners_owner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `packageID` int(10) unsigned NOT NULL,
  `userPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packageID` (`packageID`,`userPHID`),
  KEY `userPHID` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_owner`
--

LOCK TABLES `owners_owner` WRITE;
/*!40000 ALTER TABLE `owners_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_package`
--

DROP TABLE IF EXISTS `owners_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `originalName` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `primaryOwnerPHID` varbinary(64) DEFAULT NULL,
  `auditingEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `mailKey` binary(20) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `autoReview` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `dominion` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_package`
--

LOCK TABLES `owners_package` WRITE;
/*!40000 ALTER TABLE `owners_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_packagetransaction`
--

DROP TABLE IF EXISTS `owners_packagetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners_packagetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_packagetransaction`
--

LOCK TABLES `owners_packagetransaction` WRITE;
/*!40000 ALTER TABLE `owners_packagetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_packagetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners_path`
--

DROP TABLE IF EXISTS `owners_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `packageID` int(10) unsigned NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `excluded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `packageID` (`packageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_path`
--

LOCK TABLES `owners_path` WRITE;
/*!40000 ALTER TABLE `owners_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_passphrase`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_passphrase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_passphrase`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_credential`
--

DROP TABLE IF EXISTS `passphrase_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passphrase_credential` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `credentialType` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `providesType` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `secretID` int(10) unsigned DEFAULT NULL,
  `isDestroyed` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isLocked` tinyint(1) NOT NULL,
  `allowConduit` tinyint(1) NOT NULL DEFAULT '0',
  `authorPHID` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_secret` (`secretID`),
  KEY `key_type` (`credentialType`),
  KEY `key_provides` (`providesType`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_credential`
--

LOCK TABLES `passphrase_credential` WRITE;
/*!40000 ALTER TABLE `passphrase_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_credentialtransaction`
--

DROP TABLE IF EXISTS `passphrase_credentialtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passphrase_credentialtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_credentialtransaction`
--

LOCK TABLES `passphrase_credentialtransaction` WRITE;
/*!40000 ALTER TABLE `passphrase_credentialtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_credentialtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passphrase_secret`
--

DROP TABLE IF EXISTS `passphrase_secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passphrase_secret` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `secretData` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passphrase_secret`
--

LOCK TABLES `passphrase_secret` WRITE;
/*!40000 ALTER TABLE `passphrase_secret` DISABLE KEYS */;
/*!40000 ALTER TABLE `passphrase_secret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_pastebin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_pastebin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_pastebin`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastebin_paste`
--

DROP TABLE IF EXISTS `pastebin_paste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastebin_paste` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `language` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `parentPHID` varbinary(64) DEFAULT NULL,
  `viewPolicy` varbinary(64) DEFAULT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `parentPHID` (`parentPHID`),
  KEY `authorPHID` (`authorPHID`),
  KEY `key_dateCreated` (`dateCreated`),
  KEY `key_language` (`language`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastebin_paste`
--

LOCK TABLES `pastebin_paste` WRITE;
/*!40000 ALTER TABLE `pastebin_paste` DISABLE KEYS */;
/*!40000 ALTER TABLE `pastebin_paste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastebin_pastetransaction`
--

DROP TABLE IF EXISTS `pastebin_pastetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastebin_pastetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastebin_pastetransaction`
--

LOCK TABLES `pastebin_pastetransaction` WRITE;
/*!40000 ALTER TABLE `pastebin_pastetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pastebin_pastetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastebin_pastetransaction_comment`
--

DROP TABLE IF EXISTS `pastebin_pastetransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastebin_pastetransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `lineNumber` int(10) unsigned DEFAULT NULL,
  `lineLength` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastebin_pastetransaction_comment`
--

LOCK TABLES `pastebin_pastetransaction_comment` WRITE;
/*!40000 ALTER TABLE `pastebin_pastetransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pastebin_pastetransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_phame`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_phame` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_phame`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_blog`
--

DROP TABLE IF EXISTS `phame_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phame_blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `domain` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `configData` longtext COLLATE utf8mb4_bin NOT NULL,
  `creatorPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `viewPolicy` varbinary(64) DEFAULT NULL,
  `editPolicy` varbinary(64) DEFAULT NULL,
  `mailKey` binary(20) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `headerImagePHID` varbinary(64) DEFAULT NULL,
  `subtitle` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `parentDomain` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `parentSite` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `domainFullURI` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_blog`
--

LOCK TABLES `phame_blog` WRITE;
/*!40000 ALTER TABLE `phame_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_blogtransaction`
--

DROP TABLE IF EXISTS `phame_blogtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phame_blogtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_blogtransaction`
--

LOCK TABLES `phame_blogtransaction` WRITE;
/*!40000 ALTER TABLE `phame_blogtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_blogtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_post`
--

DROP TABLE IF EXISTS `phame_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phame_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `bloggerPHID` varbinary(64) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `phameTitle` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin,
  `visibility` int(10) unsigned NOT NULL DEFAULT '0',
  `configData` longtext COLLATE utf8mb4_bin,
  `datePublished` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `blogPHID` varbinary(64) DEFAULT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `bloggerPosts` (`bloggerPHID`,`visibility`,`datePublished`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_post`
--

LOCK TABLES `phame_post` WRITE;
/*!40000 ALTER TABLE `phame_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_posttransaction`
--

DROP TABLE IF EXISTS `phame_posttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phame_posttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_posttransaction`
--

LOCK TABLES `phame_posttransaction` WRITE;
/*!40000 ALTER TABLE `phame_posttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_posttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phame_posttransaction_comment`
--

DROP TABLE IF EXISTS `phame_posttransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phame_posttransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phame_posttransaction_comment`
--

LOCK TABLES `phame_posttransaction_comment` WRITE;
/*!40000 ALTER TABLE `phame_posttransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `phame_posttransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_phlux`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_phlux` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_phlux`;

--
-- Table structure for table `phlux_transaction`
--

DROP TABLE IF EXISTS `phlux_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phlux_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phlux_transaction`
--

LOCK TABLES `phlux_transaction` WRITE;
/*!40000 ALTER TABLE `phlux_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phlux_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phlux_variable`
--

DROP TABLE IF EXISTS `phlux_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phlux_variable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `variableKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `variableValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_key` (`variableKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phlux_variable`
--

LOCK TABLES `phlux_variable` WRITE;
/*!40000 ALTER TABLE `phlux_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `phlux_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_pholio`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_pholio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_pholio`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_image`
--

DROP TABLE IF EXISTS `pholio_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pholio_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `mockID` int(10) unsigned DEFAULT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isObsolete` tinyint(1) NOT NULL DEFAULT '0',
  `replacesImagePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyPHID` (`phid`),
  KEY `mockID` (`mockID`,`isObsolete`,`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_image`
--

LOCK TABLES `pholio_image` WRITE;
/*!40000 ALTER TABLE `pholio_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_mock`
--

DROP TABLE IF EXISTS `pholio_mock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pholio_mock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `originalName` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `coverPHID` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `authorPHID` (`authorPHID`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_mock`
--

LOCK TABLES `pholio_mock` WRITE;
/*!40000 ALTER TABLE `pholio_mock` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_mock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_transaction`
--

DROP TABLE IF EXISTS `pholio_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pholio_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_transaction`
--

LOCK TABLES `pholio_transaction` WRITE;
/*!40000 ALTER TABLE `pholio_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pholio_transaction_comment`
--

DROP TABLE IF EXISTS `pholio_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pholio_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `imageID` int(10) unsigned DEFAULT NULL,
  `x` int(10) unsigned DEFAULT NULL,
  `y` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`),
  UNIQUE KEY `key_draft` (`authorPHID`,`imageID`,`transactionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pholio_transaction_comment`
--

LOCK TABLES `pholio_transaction_comment` WRITE;
/*!40000 ALTER TABLE `pholio_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pholio_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_phortune`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_phortune` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_phortune`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_account`
--

DROP TABLE IF EXISTS `phortune_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_account`
--

LOCK TABLES `phortune_account` WRITE;
/*!40000 ALTER TABLE `phortune_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_accounttransaction`
--

DROP TABLE IF EXISTS `phortune_accounttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_accounttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_accounttransaction`
--

LOCK TABLES `phortune_accounttransaction` WRITE;
/*!40000 ALTER TABLE `phortune_accounttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_accounttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_cart`
--

DROP TABLE IF EXISTS `phortune_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `cartClass` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `subscriptionPHID` varbinary(64) DEFAULT NULL,
  `isInvoice` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_account` (`accountPHID`),
  KEY `key_merchant` (`merchantPHID`),
  KEY `key_subscription` (`subscriptionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_cart`
--

LOCK TABLES `phortune_cart` WRITE;
/*!40000 ALTER TABLE `phortune_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_carttransaction`
--

DROP TABLE IF EXISTS `phortune_carttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_carttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_carttransaction`
--

LOCK TABLES `phortune_carttransaction` WRITE;
/*!40000 ALTER TABLE `phortune_carttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_carttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_charge`
--

DROP TABLE IF EXISTS `phortune_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_charge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `cartPHID` varbinary(64) NOT NULL,
  `paymentMethodPHID` varbinary(64) DEFAULT NULL,
  `amountAsCurrency` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `providerPHID` varbinary(64) NOT NULL,
  `amountRefundedAsCurrency` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `refundingPHID` varbinary(64) DEFAULT NULL,
  `refundedChargePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_cart` (`cartPHID`),
  KEY `key_account` (`accountPHID`),
  KEY `key_merchant` (`merchantPHID`),
  KEY `key_provider` (`providerPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_charge`
--

LOCK TABLES `phortune_charge` WRITE;
/*!40000 ALTER TABLE `phortune_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_merchant`
--

DROP TABLE IF EXISTS `phortune_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_merchant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_merchant`
--

LOCK TABLES `phortune_merchant` WRITE;
/*!40000 ALTER TABLE `phortune_merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_merchanttransaction`
--

DROP TABLE IF EXISTS `phortune_merchanttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_merchanttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_merchanttransaction`
--

LOCK TABLES `phortune_merchanttransaction` WRITE;
/*!40000 ALTER TABLE `phortune_merchanttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_merchanttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_paymentmethod`
--

DROP TABLE IF EXISTS `phortune_paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_paymentmethod` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `brand` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `expires` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `lastFourDigits` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `providerPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_account` (`accountPHID`,`status`),
  KEY `key_merchant` (`merchantPHID`,`accountPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_paymentmethod`
--

LOCK TABLES `phortune_paymentmethod` WRITE;
/*!40000 ALTER TABLE `phortune_paymentmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_paymentproviderconfig`
--

DROP TABLE IF EXISTS `phortune_paymentproviderconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_paymentproviderconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `providerClassKey` binary(12) NOT NULL,
  `providerClass` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isEnabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_merchant` (`merchantPHID`,`providerClassKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_paymentproviderconfig`
--

LOCK TABLES `phortune_paymentproviderconfig` WRITE;
/*!40000 ALTER TABLE `phortune_paymentproviderconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_paymentproviderconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_paymentproviderconfigtransaction`
--

DROP TABLE IF EXISTS `phortune_paymentproviderconfigtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_paymentproviderconfigtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_paymentproviderconfigtransaction`
--

LOCK TABLES `phortune_paymentproviderconfigtransaction` WRITE;
/*!40000 ALTER TABLE `phortune_paymentproviderconfigtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_paymentproviderconfigtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_product`
--

DROP TABLE IF EXISTS `phortune_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `productClassKey` binary(12) NOT NULL,
  `productClass` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `productRefKey` binary(12) NOT NULL,
  `productRef` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_product` (`productClassKey`,`productRefKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_product`
--

LOCK TABLES `phortune_product` WRITE;
/*!40000 ALTER TABLE `phortune_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_purchase`
--

DROP TABLE IF EXISTS `phortune_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_purchase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `productPHID` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `cartPHID` varbinary(64) DEFAULT NULL,
  `basePriceAsCurrency` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_cart` (`cartPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_purchase`
--

LOCK TABLES `phortune_purchase` WRITE;
/*!40000 ALTER TABLE `phortune_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phortune_subscription`
--

DROP TABLE IF EXISTS `phortune_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phortune_subscription` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `accountPHID` varbinary(64) NOT NULL,
  `merchantPHID` varbinary(64) NOT NULL,
  `triggerPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `subscriptionClassKey` binary(12) NOT NULL,
  `subscriptionClass` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `subscriptionRefKey` binary(12) NOT NULL,
  `subscriptionRef` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `defaultPaymentMethodPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_subscription` (`subscriptionClassKey`,`subscriptionRefKey`),
  KEY `key_account` (`accountPHID`),
  KEY `key_merchant` (`merchantPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phortune_subscription`
--

LOCK TABLES `phortune_subscription` WRITE;
/*!40000 ALTER TABLE `phortune_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `phortune_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_phragment`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_phragment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_phragment`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phragment_fragment`
--

DROP TABLE IF EXISTS `phragment_fragment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phragment_fragment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `path` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `latestVersionPHID` varbinary(64) DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phragment_fragment`
--

LOCK TABLES `phragment_fragment` WRITE;
/*!40000 ALTER TABLE `phragment_fragment` DISABLE KEYS */;
/*!40000 ALTER TABLE `phragment_fragment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phragment_fragmentversion`
--

DROP TABLE IF EXISTS `phragment_fragmentversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phragment_fragmentversion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `fragmentPHID` varbinary(64) NOT NULL,
  `filePHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_version` (`fragmentPHID`,`sequence`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phragment_fragmentversion`
--

LOCK TABLES `phragment_fragmentversion` WRITE;
/*!40000 ALTER TABLE `phragment_fragmentversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `phragment_fragmentversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phragment_snapshot`
--

DROP TABLE IF EXISTS `phragment_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phragment_snapshot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `primaryFragmentPHID` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`primaryFragmentPHID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phragment_snapshot`
--

LOCK TABLES `phragment_snapshot` WRITE;
/*!40000 ALTER TABLE `phragment_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `phragment_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phragment_snapshotchild`
--

DROP TABLE IF EXISTS `phragment_snapshotchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phragment_snapshotchild` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `snapshotPHID` varbinary(64) NOT NULL,
  `fragmentPHID` varbinary(64) NOT NULL,
  `fragmentVersionPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_child` (`snapshotPHID`,`fragmentPHID`,`fragmentVersionPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phragment_snapshotchild`
--

LOCK TABLES `phragment_snapshotchild` WRITE;
/*!40000 ALTER TABLE `phragment_snapshotchild` DISABLE KEYS */;
/*!40000 ALTER TABLE `phragment_snapshotchild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_phrequent`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_phrequent` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_phrequent`;

--
-- Table structure for table `phrequent_usertime`
--

DROP TABLE IF EXISTS `phrequent_usertime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phrequent_usertime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_bin,
  `dateStarted` int(10) unsigned NOT NULL,
  `dateEnded` int(10) unsigned DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phrequent_usertime`
--

LOCK TABLES `phrequent_usertime` WRITE;
/*!40000 ALTER TABLE `phrequent_usertime` DISABLE KEYS */;
/*!40000 ALTER TABLE `phrequent_usertime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_phriction`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_phriction` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_phriction`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_content`
--

DROP TABLE IF EXISTS `phriction_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phriction_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentID` int(10) unsigned NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_bin,
  `changeType` int(10) unsigned NOT NULL DEFAULT '0',
  `changeRef` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documentID` (`documentID`,`version`),
  KEY `authorPHID` (`authorPHID`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_content`
--

LOCK TABLES `phriction_content` WRITE;
/*!40000 ALTER TABLE `phriction_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_document`
--

DROP TABLE IF EXISTS `phriction_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phriction_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `contentID` int(10) unsigned DEFAULT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `depth` (`depth`,`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_document`
--

LOCK TABLES `phriction_document` WRITE;
/*!40000 ALTER TABLE `phriction_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_transaction`
--

DROP TABLE IF EXISTS `phriction_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phriction_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_transaction`
--

LOCK TABLES `phriction_transaction` WRITE;
/*!40000 ALTER TABLE `phriction_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phriction_transaction_comment`
--

DROP TABLE IF EXISTS `phriction_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phriction_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phriction_transaction_comment`
--

LOCK TABLES `phriction_transaction_comment` WRITE;
/*!40000 ALTER TABLE `phriction_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `phriction_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_phurl`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_phurl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_phurl`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phurl_url`
--

DROP TABLE IF EXISTS `phurl_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phurl_url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `longURL` longtext COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_instance` (`alias`),
  KEY `key_author` (`authorPHID`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phurl_url`
--

LOCK TABLES `phurl_url` WRITE;
/*!40000 ALTER TABLE `phurl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `phurl_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phurl_urltransaction`
--

DROP TABLE IF EXISTS `phurl_urltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phurl_urltransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phurl_urltransaction`
--

LOCK TABLES `phurl_urltransaction` WRITE;
/*!40000 ALTER TABLE `phurl_urltransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `phurl_urltransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phurl_urltransaction_comment`
--

DROP TABLE IF EXISTS `phurl_urltransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phurl_urltransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phurl_urltransaction_comment`
--

LOCK TABLES `phurl_urltransaction_comment` WRITE;
/*!40000 ALTER TABLE `phurl_urltransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `phurl_urltransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_policy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_policy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_policy`;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `rules` longtext COLLATE utf8mb4_bin NOT NULL,
  `defaultAction` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_ponder`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_ponder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_ponder`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_answer`
--

DROP TABLE IF EXISTS `ponder_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponder_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionID` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `voteCount` int(10) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `key_oneanswerperquestion` (`questionID`,`authorPHID`),
  KEY `questionID` (`questionID`),
  KEY `authorPHID` (`authorPHID`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_answer`
--

LOCK TABLES `ponder_answer` WRITE;
/*!40000 ALTER TABLE `ponder_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_answertransaction`
--

DROP TABLE IF EXISTS `ponder_answertransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponder_answertransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_answertransaction`
--

LOCK TABLES `ponder_answertransaction` WRITE;
/*!40000 ALTER TABLE `ponder_answertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_answertransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_answertransaction_comment`
--

DROP TABLE IF EXISTS `ponder_answertransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponder_answertransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_answertransaction_comment`
--

LOCK TABLES `ponder_answertransaction_comment` WRITE;
/*!40000 ALTER TABLE `ponder_answertransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_answertransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_question`
--

DROP TABLE IF EXISTS `ponder_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponder_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin,
  `answerCount` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `answerWiki` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `authorPHID` (`authorPHID`),
  KEY `status` (`status`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_question`
--

LOCK TABLES `ponder_question` WRITE;
/*!40000 ALTER TABLE `ponder_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_questiontransaction`
--

DROP TABLE IF EXISTS `ponder_questiontransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponder_questiontransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_questiontransaction`
--

LOCK TABLES `ponder_questiontransaction` WRITE;
/*!40000 ALTER TABLE `ponder_questiontransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_questiontransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponder_questiontransaction_comment`
--

DROP TABLE IF EXISTS `ponder_questiontransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponder_questiontransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponder_questiontransaction_comment`
--

LOCK TABLES `ponder_questiontransaction_comment` WRITE;
/*!40000 ALTER TABLE `ponder_questiontransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ponder_questiontransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_project`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `joinPolicy` varbinary(64) NOT NULL,
  `isMembershipLocked` tinyint(1) NOT NULL DEFAULT '0',
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `icon` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `color` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `primarySlug` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `parentProjectPHID` varbinary(64) DEFAULT NULL,
  `hasWorkboard` tinyint(1) NOT NULL,
  `hasMilestones` tinyint(1) NOT NULL,
  `hasSubprojects` tinyint(1) NOT NULL,
  `milestoneNumber` int(10) unsigned DEFAULT NULL,
  `projectPath` varbinary(64) NOT NULL,
  `projectDepth` int(10) unsigned NOT NULL,
  `projectPathKey` binary(4) NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_pathkey` (`projectPathKey`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_primaryslug` (`primarySlug`),
  UNIQUE KEY `key_milestone` (`parentProjectPHID`,`milestoneNumber`),
  KEY `key_icon` (`icon`),
  KEY `key_color` (`color`),
  KEY `key_path` (`projectPath`,`projectDepth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_column`
--

DROP TABLE IF EXISTS `project_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `projectPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `proxyPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_proxy` (`projectPHID`,`proxyPHID`),
  KEY `key_status` (`projectPHID`,`status`,`sequence`),
  KEY `key_sequence` (`projectPHID`,`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_column`
--

LOCK TABLES `project_column` WRITE;
/*!40000 ALTER TABLE `project_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_columnposition`
--

DROP TABLE IF EXISTS `project_columnposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_columnposition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `boardPHID` varbinary(64) NOT NULL,
  `columnPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `boardPHID` (`boardPHID`,`columnPHID`,`objectPHID`),
  KEY `objectPHID` (`objectPHID`,`boardPHID`),
  KEY `boardPHID_2` (`boardPHID`,`columnPHID`,`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_columnposition`
--

LOCK TABLES `project_columnposition` WRITE;
/*!40000 ALTER TABLE `project_columnposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_columnposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_columntransaction`
--

DROP TABLE IF EXISTS `project_columntransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_columntransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_columntransaction`
--

LOCK TABLES `project_columntransaction` WRITE;
/*!40000 ALTER TABLE `project_columntransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_columntransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_customfieldnumericindex`
--

DROP TABLE IF EXISTS `project_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_customfieldnumericindex`
--

LOCK TABLES `project_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `project_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_customfieldstorage`
--

DROP TABLE IF EXISTS `project_customfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_customfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_customfieldstorage`
--

LOCK TABLES `project_customfieldstorage` WRITE;
/*!40000 ALTER TABLE `project_customfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_customfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_customfieldstringindex`
--

DROP TABLE IF EXISTS `project_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_customfieldstringindex`
--

LOCK TABLES `project_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `project_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_datasourcetoken`
--

DROP TABLE IF EXISTS `project_datasourcetoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_datasourcetoken` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL,
  `token` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`,`projectID`),
  KEY `projectID` (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_datasourcetoken`
--

LOCK TABLES `project_datasourcetoken` WRITE;
/*!40000 ALTER TABLE `project_datasourcetoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_datasourcetoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_slug`
--

DROP TABLE IF EXISTS `project_slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_slug` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectPHID` varbinary(64) NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_slug` (`slug`),
  KEY `key_projectPHID` (`projectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_slug`
--

LOCK TABLES `project_slug` WRITE;
/*!40000 ALTER TABLE `project_slug` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_slug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_transaction`
--

DROP TABLE IF EXISTS `project_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_transaction`
--

LOCK TABLES `project_transaction` WRITE;
/*!40000 ALTER TABLE `project_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_releeph`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_releeph` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_releeph`;

--
-- Table structure for table `releeph_branch`
--

DROP TABLE IF EXISTS `releeph_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releeph_branch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `basename` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `releephProjectID` int(10) unsigned NOT NULL,
  `createdByUserPHID` varbinary(64) NOT NULL,
  `cutPointCommitPHID` varbinary(64) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `symbolicName` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_bin NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `releephProjectID_2` (`releephProjectID`,`basename`),
  UNIQUE KEY `releephProjectID_name` (`releephProjectID`,`name`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `releephProjectID` (`releephProjectID`,`symbolicName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releeph_branch`
--

LOCK TABLES `releeph_branch` WRITE;
/*!40000 ALTER TABLE `releeph_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `releeph_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releeph_branchtransaction`
--

DROP TABLE IF EXISTS `releeph_branchtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releeph_branchtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releeph_branchtransaction`
--

LOCK TABLES `releeph_branchtransaction` WRITE;
/*!40000 ALTER TABLE `releeph_branchtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `releeph_branchtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releeph_producttransaction`
--

DROP TABLE IF EXISTS `releeph_producttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releeph_producttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releeph_producttransaction`
--

LOCK TABLES `releeph_producttransaction` WRITE;
/*!40000 ALTER TABLE `releeph_producttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `releeph_producttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releeph_project`
--

DROP TABLE IF EXISTS `releeph_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releeph_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `trunkBranch` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `createdByUserPHID` varbinary(64) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `details` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectName` (`name`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releeph_project`
--

LOCK TABLES `releeph_project` WRITE;
/*!40000 ALTER TABLE `releeph_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `releeph_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releeph_request`
--

DROP TABLE IF EXISTS `releeph_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releeph_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `branchID` int(10) unsigned NOT NULL,
  `requestUserPHID` varbinary(64) NOT NULL,
  `requestCommitPHID` varbinary(64) DEFAULT NULL,
  `commitIdentifier` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `commitPHID` varbinary(64) DEFAULT NULL,
  `pickStatus` int(10) unsigned DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_bin NOT NULL,
  `userIntents` longtext COLLATE utf8mb4_bin,
  `inBranch` tinyint(1) NOT NULL DEFAULT '0',
  `mailKey` binary(20) NOT NULL,
  `requestedObjectPHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `requestIdentifierBranch` (`requestCommitPHID`,`branchID`),
  KEY `branchID` (`branchID`),
  KEY `key_requestedObject` (`requestedObjectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releeph_request`
--

LOCK TABLES `releeph_request` WRITE;
/*!40000 ALTER TABLE `releeph_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `releeph_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releeph_requesttransaction`
--

DROP TABLE IF EXISTS `releeph_requesttransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releeph_requesttransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releeph_requesttransaction`
--

LOCK TABLES `releeph_requesttransaction` WRITE;
/*!40000 ALTER TABLE `releeph_requesttransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `releeph_requesttransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releeph_requesttransaction_comment`
--

DROP TABLE IF EXISTS `releeph_requesttransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releeph_requesttransaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releeph_requesttransaction_comment`
--

LOCK TABLES `releeph_requesttransaction_comment` WRITE;
/*!40000 ALTER TABLE `releeph_requesttransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `releeph_requesttransaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_repository`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_repository` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_repository`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `callsign` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `versionControlSystem` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `details` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `uuid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `pushPolicy` varbinary(64) NOT NULL,
  `credentialPHID` varbinary(64) DEFAULT NULL,
  `almanacServicePHID` varbinary(64) DEFAULT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `repositorySlug` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localPath` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `callsign` (`callsign`),
  UNIQUE KEY `key_slug` (`repositorySlug`),
  UNIQUE KEY `key_local` (`localPath`),
  KEY `key_vcs` (`versionControlSystem`),
  KEY `key_name` (`name`(128)),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_auditrequest`
--

DROP TABLE IF EXISTS `repository_auditrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_auditrequest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auditorPHID` varbinary(64) NOT NULL,
  `commitPHID` varbinary(64) NOT NULL,
  `auditStatus` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `auditReasons` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_unique` (`commitPHID`,`auditorPHID`),
  KEY `commitPHID` (`commitPHID`),
  KEY `auditorPHID` (`auditorPHID`,`auditStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_auditrequest`
--

LOCK TABLES `repository_auditrequest` WRITE;
/*!40000 ALTER TABLE `repository_auditrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_auditrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_badcommit`
--

DROP TABLE IF EXISTS `repository_badcommit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_badcommit` (
  `fullCommitName` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`fullCommitName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_badcommit`
--

LOCK TABLES `repository_badcommit` WRITE;
/*!40000 ALTER TABLE `repository_badcommit` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_badcommit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_branch`
--

DROP TABLE IF EXISTS `repository_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_branch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryID` int(10) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `lintCommit` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repositoryID` (`repositoryID`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_branch`
--

LOCK TABLES `repository_branch` WRITE;
/*!40000 ALTER TABLE `repository_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commit`
--

DROP TABLE IF EXISTS `repository_commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_commit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryID` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `commitIdentifier` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `auditStatus` int(10) unsigned NOT NULL,
  `summary` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `importStatus` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `key_commit_identity` (`commitIdentifier`,`repositoryID`),
  KEY `repositoryID_2` (`repositoryID`,`epoch`),
  KEY `authorPHID` (`authorPHID`,`auditStatus`,`epoch`),
  KEY `repositoryID` (`repositoryID`,`importStatus`),
  KEY `key_epoch` (`epoch`),
  KEY `key_author` (`authorPHID`,`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commit`
--

LOCK TABLES `repository_commit` WRITE;
/*!40000 ALTER TABLE `repository_commit` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_commitdata`
--

DROP TABLE IF EXISTS `repository_commitdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_commitdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commitID` int(10) unsigned NOT NULL,
  `authorName` longtext COLLATE utf8mb4_bin NOT NULL,
  `commitMessage` longtext COLLATE utf8mb4_bin NOT NULL,
  `commitDetails` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commitID` (`commitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_commitdata`
--

LOCK TABLES `repository_commitdata` WRITE;
/*!40000 ALTER TABLE `repository_commitdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_commitdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_coverage`
--

DROP TABLE IF EXISTS `repository_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_coverage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branchID` int(10) unsigned NOT NULL,
  `commitID` int(10) unsigned NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `coverage` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_path` (`branchID`,`pathID`,`commitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_coverage`
--

LOCK TABLES `repository_coverage` WRITE;
/*!40000 ALTER TABLE `repository_coverage` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_filesystem`
--

DROP TABLE IF EXISTS `repository_filesystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_filesystem` (
  `repositoryID` int(10) unsigned NOT NULL,
  `parentID` int(10) unsigned NOT NULL,
  `svnCommit` int(10) unsigned NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `existed` tinyint(1) NOT NULL,
  `fileType` int(10) unsigned NOT NULL,
  PRIMARY KEY (`repositoryID`,`parentID`,`pathID`,`svnCommit`),
  KEY `repositoryID` (`repositoryID`,`svnCommit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_filesystem`
--

LOCK TABLES `repository_filesystem` WRITE;
/*!40000 ALTER TABLE `repository_filesystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_filesystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_gitlfsref`
--

DROP TABLE IF EXISTS `repository_gitlfsref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_gitlfsref` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `objectHash` binary(64) NOT NULL,
  `byteSize` bigint(20) unsigned NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `filePHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_hash` (`repositoryPHID`,`objectHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_gitlfsref`
--

LOCK TABLES `repository_gitlfsref` WRITE;
/*!40000 ALTER TABLE `repository_gitlfsref` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_gitlfsref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_lintmessage`
--

DROP TABLE IF EXISTS `repository_lintmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_lintmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branchID` int(10) unsigned NOT NULL,
  `path` longtext COLLATE utf8mb4_bin NOT NULL,
  `line` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `code` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `severity` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branchID` (`branchID`,`path`(64)),
  KEY `branchID_2` (`branchID`,`code`,`path`(64)),
  KEY `key_author` (`authorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_lintmessage`
--

LOCK TABLES `repository_lintmessage` WRITE;
/*!40000 ALTER TABLE `repository_lintmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_lintmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_mirror`
--

DROP TABLE IF EXISTS `repository_mirror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_mirror` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `remoteURI` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `credentialPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_mirror`
--

LOCK TABLES `repository_mirror` WRITE;
/*!40000 ALTER TABLE `repository_mirror` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_mirror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_oldref`
--

DROP TABLE IF EXISTS `repository_oldref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_oldref` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `commitIdentifier` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_repository` (`repositoryPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_oldref`
--

LOCK TABLES `repository_oldref` WRITE;
/*!40000 ALTER TABLE `repository_oldref` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_oldref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_parents`
--

DROP TABLE IF EXISTS `repository_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_parents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `childCommitID` int(10) unsigned NOT NULL,
  `parentCommitID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_child` (`childCommitID`,`parentCommitID`),
  KEY `key_parent` (`parentCommitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_parents`
--

LOCK TABLES `repository_parents` WRITE;
/*!40000 ALTER TABLE `repository_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_path`
--

DROP TABLE IF EXISTS `repository_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` longtext COLLATE utf8mb4_bin NOT NULL,
  `pathHash` binary(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pathHash` (`pathHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_path`
--

LOCK TABLES `repository_path` WRITE;
/*!40000 ALTER TABLE `repository_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_pathchange`
--

DROP TABLE IF EXISTS `repository_pathchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_pathchange` (
  `repositoryID` int(10) unsigned NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `commitID` int(10) unsigned NOT NULL,
  `targetPathID` int(10) unsigned DEFAULT NULL,
  `targetCommitID` int(10) unsigned DEFAULT NULL,
  `changeType` int(10) unsigned NOT NULL,
  `fileType` int(10) unsigned NOT NULL,
  `isDirect` tinyint(1) NOT NULL,
  `commitSequence` int(10) unsigned NOT NULL,
  PRIMARY KEY (`commitID`,`pathID`),
  KEY `repositoryID` (`repositoryID`,`pathID`,`commitSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_pathchange`
--

LOCK TABLES `repository_pathchange` WRITE;
/*!40000 ALTER TABLE `repository_pathchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_pathchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_pullevent`
--

DROP TABLE IF EXISTS `repository_pullevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_pullevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) DEFAULT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `pullerPHID` varbinary(64) DEFAULT NULL,
  `remoteAddress` varbinary(64) DEFAULT NULL,
  `remoteProtocol` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `resultType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `resultCode` int(10) unsigned NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_pullevent`
--

LOCK TABLES `repository_pullevent` WRITE;
/*!40000 ALTER TABLE `repository_pullevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_pullevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_pushevent`
--

DROP TABLE IF EXISTS `repository_pushevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_pushevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `pusherPHID` varbinary(64) NOT NULL,
  `remoteAddress` varbinary(64) DEFAULT NULL,
  `remoteProtocol` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `rejectCode` int(10) unsigned NOT NULL,
  `rejectDetails` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_pushevent`
--

LOCK TABLES `repository_pushevent` WRITE;
/*!40000 ALTER TABLE `repository_pushevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_pushevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_pushlog`
--

DROP TABLE IF EXISTS `repository_pushlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_pushlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  `pushEventPHID` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `pusherPHID` varbinary(64) NOT NULL,
  `refType` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `refNameHash` binary(12) DEFAULT NULL,
  `refNameRaw` longblob,
  `refNameEncoding` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `refOld` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `refNew` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `mergeBase` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `changeFlags` int(10) unsigned NOT NULL,
  `devicePHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_repository` (`repositoryPHID`),
  KEY `key_ref` (`repositoryPHID`,`refNew`),
  KEY `key_pusher` (`pusherPHID`),
  KEY `key_name` (`repositoryPHID`,`refNameHash`),
  KEY `key_event` (`pushEventPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_pushlog`
--

LOCK TABLES `repository_pushlog` WRITE;
/*!40000 ALTER TABLE `repository_pushlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_pushlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_refcursor`
--

DROP TABLE IF EXISTS `repository_refcursor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_refcursor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `refType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `refNameHash` binary(12) NOT NULL,
  `refNameRaw` longblob NOT NULL,
  `refNameEncoding` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `commitIdentifier` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_cursor` (`repositoryPHID`,`refType`,`refNameHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_refcursor`
--

LOCK TABLES `repository_refcursor` WRITE;
/*!40000 ALTER TABLE `repository_refcursor` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_refcursor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_statusmessage`
--

DROP TABLE IF EXISTS `repository_statusmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_statusmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryID` int(10) unsigned NOT NULL,
  `statusType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `statusCode` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `parameters` longtext COLLATE utf8mb4_bin NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repositoryID` (`repositoryID`,`statusType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_statusmessage`
--

LOCK TABLES `repository_statusmessage` WRITE;
/*!40000 ALTER TABLE `repository_statusmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_statusmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_summary`
--

DROP TABLE IF EXISTS `repository_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_summary` (
  `repositoryID` int(10) unsigned NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `lastCommitID` int(10) unsigned NOT NULL,
  `epoch` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`repositoryID`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_summary`
--

LOCK TABLES `repository_summary` WRITE;
/*!40000 ALTER TABLE `repository_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_symbol`
--

DROP TABLE IF EXISTS `repository_symbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_symbol` (
  `repositoryPHID` varbinary(64) NOT NULL,
  `symbolContext` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `symbolName` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `symbolType` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `symbolLanguage` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `pathID` int(10) unsigned NOT NULL,
  `lineNumber` int(10) unsigned NOT NULL,
  KEY `symbolName` (`symbolName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_symbol`
--

LOCK TABLES `repository_symbol` WRITE;
/*!40000 ALTER TABLE `repository_symbol` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_symbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_transaction`
--

DROP TABLE IF EXISTS `repository_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_transaction`
--

LOCK TABLES `repository_transaction` WRITE;
/*!40000 ALTER TABLE `repository_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_uri`
--

DROP TABLE IF EXISTS `repository_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `repositoryPHID` varbinary(64) NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `builtinProtocol` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `builtinIdentifier` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `ioType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `displayType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `isDisabled` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `credentialPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_builtin` (`repositoryPHID`,`builtinProtocol`,`builtinIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_uri`
--

LOCK TABLES `repository_uri` WRITE;
/*!40000 ALTER TABLE `repository_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_uriindex`
--

DROP TABLE IF EXISTS `repository_uriindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_uriindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `repositoryURI` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_repository` (`repositoryPHID`),
  KEY `key_uri` (`repositoryURI`(128))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_uriindex`
--

LOCK TABLES `repository_uriindex` WRITE;
/*!40000 ALTER TABLE `repository_uriindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_uriindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_uritransaction`
--

DROP TABLE IF EXISTS `repository_uritransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_uritransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_uritransaction`
--

LOCK TABLES `repository_uritransaction` WRITE;
/*!40000 ALTER TABLE `repository_uritransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_uritransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_vcspassword`
--

DROP TABLE IF EXISTS `repository_vcspassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_vcspassword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `passwordHash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_vcspassword`
--

LOCK TABLES `repository_vcspassword` WRITE;
/*!40000 ALTER TABLE `repository_vcspassword` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_vcspassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_workingcopyversion`
--

DROP TABLE IF EXISTS `repository_workingcopyversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_workingcopyversion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryPHID` varbinary(64) NOT NULL,
  `devicePHID` varbinary(64) NOT NULL,
  `repositoryVersion` int(10) unsigned NOT NULL,
  `isWriting` tinyint(1) NOT NULL,
  `writeProperties` longtext COLLATE utf8mb4_bin,
  `lockOwner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_workingcopy` (`repositoryPHID`,`devicePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_workingcopyversion`
--

LOCK TABLES `repository_workingcopyversion` WRITE;
/*!40000 ALTER TABLE `repository_workingcopyversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository_workingcopyversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_search`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_search` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_search`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_document`
--

DROP TABLE IF EXISTS `search_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_document` (
  `phid` varbinary(64) NOT NULL,
  `documentType` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `documentTitle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `documentCreated` int(10) unsigned NOT NULL,
  `documentModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`phid`),
  KEY `documentCreated` (`documentCreated`),
  KEY `key_type` (`documentType`,`documentCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_document`
--

LOCK TABLES `search_document` WRITE;
/*!40000 ALTER TABLE `search_document` DISABLE KEYS */;
INSERT INTO `search_document` VALUES ('PHID-USER-ljditzls25waa24hvicf','USER','superadmin (superadmin)',1468278944,1468278945);
/*!40000 ALTER TABLE `search_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_documentfield`
--

DROP TABLE IF EXISTS `search_documentfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_documentfield` (
  `phid` varbinary(64) NOT NULL,
  `phidType` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `field` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `auxPHID` varbinary(64) DEFAULT NULL,
  `corpus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  KEY `phid` (`phid`),
  FULLTEXT KEY `corpus` (`corpus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_documentfield`
--

LOCK TABLES `search_documentfield` WRITE;
/*!40000 ALTER TABLE `search_documentfield` DISABLE KEYS */;
INSERT INTO `search_documentfield` VALUES ('PHID-USER-ljditzls25waa24hvicf','USER','titl',NULL,'superadmin (superadmin)');
/*!40000 ALTER TABLE `search_documentfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_documentrelationship`
--

DROP TABLE IF EXISTS `search_documentrelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_documentrelationship` (
  `phid` varbinary(64) NOT NULL,
  `relatedPHID` varbinary(64) NOT NULL,
  `relation` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `relatedType` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `relatedTime` int(10) unsigned NOT NULL,
  KEY `phid` (`phid`),
  KEY `relatedPHID` (`relatedPHID`,`relation`),
  KEY `relation` (`relation`,`relatedPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_documentrelationship`
--

LOCK TABLES `search_documentrelationship` WRITE;
/*!40000 ALTER TABLE `search_documentrelationship` DISABLE KEYS */;
INSERT INTO `search_documentrelationship` VALUES ('PHID-USER-ljditzls25waa24hvicf','PHID-USER-ljditzls25waa24hvicf','open','USER',1468278948);
/*!40000 ALTER TABLE `search_documentrelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_editengineconfiguration`
--

DROP TABLE IF EXISTS `search_editengineconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_editengineconfiguration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `engineKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `builtinKey` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDisabled` tinyint(1) NOT NULL DEFAULT '0',
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isEdit` tinyint(1) NOT NULL,
  `createOrder` int(10) unsigned NOT NULL,
  `editOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_engine` (`engineKey`,`builtinKey`),
  KEY `key_default` (`engineKey`,`isDefault`,`isDisabled`),
  KEY `key_edit` (`engineKey`,`isEdit`,`isDisabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_editengineconfiguration`
--

LOCK TABLES `search_editengineconfiguration` WRITE;
/*!40000 ALTER TABLE `search_editengineconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_editengineconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_editengineconfigurationtransaction`
--

DROP TABLE IF EXISTS `search_editengineconfigurationtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_editengineconfigurationtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_editengineconfigurationtransaction`
--

LOCK TABLES `search_editengineconfigurationtransaction` WRITE;
/*!40000 ALTER TABLE `search_editengineconfigurationtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_editengineconfigurationtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_indexversion`
--

DROP TABLE IF EXISTS `search_indexversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_indexversion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `extensionKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `version` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_object` (`objectPHID`,`extensionKey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_indexversion`
--

LOCK TABLES `search_indexversion` WRITE;
/*!40000 ALTER TABLE `search_indexversion` DISABLE KEYS */;
INSERT INTO `search_indexversion` VALUES (1,'PHID-USER-ljditzls25waa24hvicf','fulltext','none:none');
/*!40000 ALTER TABLE `search_indexversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_namedquery`
--

DROP TABLE IF EXISTS `search_namedquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_namedquery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `engineClassName` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `queryName` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `queryKey` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `isBuiltin` tinyint(1) NOT NULL DEFAULT '0',
  `isDisabled` tinyint(1) NOT NULL DEFAULT '0',
  `sequence` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_userquery` (`userPHID`,`engineClassName`,`queryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_namedquery`
--

LOCK TABLES `search_namedquery` WRITE;
/*!40000 ALTER TABLE `search_namedquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_namedquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_profilepanelconfiguration`
--

DROP TABLE IF EXISTS `search_profilepanelconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_profilepanelconfiguration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `profilePHID` varbinary(64) NOT NULL,
  `panelKey` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `builtinKey` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `panelOrder` int(10) unsigned DEFAULT NULL,
  `visibility` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `panelProperties` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_profile` (`profilePHID`,`panelOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_profilepanelconfiguration`
--

LOCK TABLES `search_profilepanelconfiguration` WRITE;
/*!40000 ALTER TABLE `search_profilepanelconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_profilepanelconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_profilepanelconfigurationtransaction`
--

DROP TABLE IF EXISTS `search_profilepanelconfigurationtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_profilepanelconfigurationtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_profilepanelconfigurationtransaction`
--

LOCK TABLES `search_profilepanelconfigurationtransaction` WRITE;
/*!40000 ALTER TABLE `search_profilepanelconfigurationtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_profilepanelconfigurationtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_savedquery`
--

DROP TABLE IF EXISTS `search_savedquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_savedquery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `engineClassName` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `parameters` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `queryKey` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_queryKey` (`queryKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_savedquery`
--

LOCK TABLES `search_savedquery` WRITE;
/*!40000 ALTER TABLE `search_savedquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_savedquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_slowvote`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_slowvote` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_slowvote`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_choice`
--

DROP TABLE IF EXISTS `slowvote_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slowvote_choice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pollID` int(10) unsigned NOT NULL,
  `optionID` int(10) unsigned NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pollID` (`pollID`),
  KEY `authorPHID` (`authorPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_choice`
--

LOCK TABLES `slowvote_choice` WRITE;
/*!40000 ALTER TABLE `slowvote_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_option`
--

DROP TABLE IF EXISTS `slowvote_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slowvote_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pollID` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pollID` (`pollID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_option`
--

LOCK TABLES `slowvote_option` WRITE;
/*!40000 ALTER TABLE `slowvote_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_poll`
--

DROP TABLE IF EXISTS `slowvote_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slowvote_poll` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `responseVisibility` int(10) unsigned NOT NULL,
  `shuffle` int(10) unsigned NOT NULL,
  `method` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `isClosed` tinyint(1) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
  `mailKey` binary(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
  KEY `key_space` (`spacePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_poll`
--

LOCK TABLES `slowvote_poll` WRITE;
/*!40000 ALTER TABLE `slowvote_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_transaction`
--

DROP TABLE IF EXISTS `slowvote_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slowvote_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_transaction`
--

LOCK TABLES `slowvote_transaction` WRITE;
/*!40000 ALTER TABLE `slowvote_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slowvote_transaction_comment`
--

DROP TABLE IF EXISTS `slowvote_transaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slowvote_transaction_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `transactionPHID` varbinary(64) DEFAULT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_version` (`transactionPHID`,`commentVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slowvote_transaction_comment`
--

LOCK TABLES `slowvote_transaction_comment` WRITE;
/*!40000 ALTER TABLE `slowvote_transaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `slowvote_transaction_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_spaces`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_spaces` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_spaces`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces_namespace`
--

DROP TABLE IF EXISTS `spaces_namespace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spaces_namespace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `namespaceName` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `isDefaultNamespace` tinyint(1) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `isArchived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_default` (`isDefaultNamespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces_namespace`
--

LOCK TABLES `spaces_namespace` WRITE;
/*!40000 ALTER TABLE `spaces_namespace` DISABLE KEYS */;
/*!40000 ALTER TABLE `spaces_namespace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces_namespacetransaction`
--

DROP TABLE IF EXISTS `spaces_namespacetransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spaces_namespacetransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces_namespacetransaction`
--

LOCK TABLES `spaces_namespacetransaction` WRITE;
/*!40000 ALTER TABLE `spaces_namespacetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `spaces_namespacetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_system`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_system`;

--
-- Table structure for table `system_actionlog`
--

DROP TABLE IF EXISTS `system_actionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_actionlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actorHash` binary(12) NOT NULL,
  `actorIdentity` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `action` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `score` double NOT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_epoch` (`epoch`),
  KEY `key_action` (`actorHash`,`action`,`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_actionlog`
--

LOCK TABLES `system_actionlog` WRITE;
/*!40000 ALTER TABLE `system_actionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_actionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_destructionlog`
--

DROP TABLE IF EXISTS `system_destructionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_destructionlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectClass` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `rootLogID` int(10) unsigned DEFAULT NULL,
  `objectPHID` varbinary(64) DEFAULT NULL,
  `objectMonogram` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `epoch` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_epoch` (`epoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_destructionlog`
--

LOCK TABLES `system_destructionlog` WRITE;
/*!40000 ALTER TABLE `system_destructionlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_destructionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_token`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_token` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_token`;

--
-- Table structure for table `token_count`
--

DROP TABLE IF EXISTS `token_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `tokenCount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_objectPHID` (`objectPHID`),
  KEY `key_count` (`tokenCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_count`
--

LOCK TABLES `token_count` WRITE;
/*!40000 ALTER TABLE `token_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_given`
--

DROP TABLE IF EXISTS `token_given`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_given` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `tokenPHID` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_all` (`objectPHID`,`authorPHID`),
  KEY `key_author` (`authorPHID`),
  KEY `key_token` (`tokenPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_given`
--

LOCK TABLES `token_given` WRITE;
/*!40000 ALTER TABLE `token_given` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_given` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_user`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_user` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_user`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phabricator_session`
--

DROP TABLE IF EXISTS `phabricator_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phabricator_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `sessionKey` binary(40) NOT NULL,
  `sessionStart` int(10) unsigned NOT NULL,
  `sessionExpires` int(10) unsigned NOT NULL,
  `highSecurityUntil` int(10) unsigned DEFAULT NULL,
  `isPartial` tinyint(1) NOT NULL DEFAULT '0',
  `signedLegalpadDocuments` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sessionKey` (`sessionKey`),
  KEY `key_identity` (`userPHID`,`type`),
  KEY `key_expires` (`sessionExpires`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phabricator_session`
--

LOCK TABLES `phabricator_session` WRITE;
/*!40000 ALTER TABLE `phabricator_session` DISABLE KEYS */;
INSERT INTO `phabricator_session` VALUES (1,'PHID-USER-ljditzls25waa24hvicf','web','01a1f4cf8e06e11df638cd6835cfba8cc5269b26',1468278945,1470870945,NULL,0,1);
/*!40000 ALTER TABLE `phabricator_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `realName` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `passwordSalt` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `passwordHash` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `conduitCertificate` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `isSystemAgent` tinyint(1) NOT NULL DEFAULT '0',
  `isDisabled` tinyint(1) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isEmailVerified` int(10) unsigned NOT NULL,
  `isApproved` int(10) unsigned NOT NULL,
  `accountSecret` binary(64) NOT NULL,
  `isEnrolledInMultiFactor` tinyint(1) NOT NULL DEFAULT '0',
  `availabilityCache` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `availabilityCacheTTL` int(10) unsigned DEFAULT NULL,
  `isMailingList` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`),
  UNIQUE KEY `phid` (`phid`),
  KEY `realName` (`realName`),
  KEY `key_approved` (`isApproved`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'PHID-USER-ljditzls25waa24hvicf','superadmin','superadmin','6512fb381dfb46bbcaf7dbe2c938862f','bcrypt:$2y$11$UNPUH6GpI20sDK.xVO4Hge9zUvtx1Aujv5L5.y1pX7XWx2PrNX1/S',1468278944,1468278945,NULL,'n52xj6lofhebwx6qmguj4lhw3yucx63rhxvlkx3ikweumsmsvrobf543vxdu7htitzw5fqfrdt6qke6twea4fgbhjrfcbg3egejhlbhozggd5t6xidu4pt3kkiacrf2qxjfxypphko533cm4px745bp2vnzzbvlxnz73xdmjx2kekseu5s665udzqkpvwfycfbv56s7zea2h7qi4no4h3hn6lk2bjrwo4aqf3tb6u3itebxhuiglqgj3ui5mhjw',0,0,1,1,1,'aoaq7e3ga6vsgrtlb45hnchodqkvyep6cdgepor5bb4bqlkevujj6ldm56urzose',0,'{\"until\":null}',1468538148,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authinvite`
--

DROP TABLE IF EXISTS `user_authinvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authinvite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) NOT NULL,
  `emailAddress` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verificationHash` binary(12) NOT NULL,
  `acceptedByPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_address` (`emailAddress`),
  UNIQUE KEY `key_code` (`verificationHash`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authinvite`
--

LOCK TABLES `user_authinvite` WRITE;
/*!40000 ALTER TABLE `user_authinvite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_authinvite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cache`
--

DROP TABLE IF EXISTS `user_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `cacheIndex` binary(12) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `cacheData` longtext COLLATE utf8mb4_bin NOT NULL,
  `cacheType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_usercache` (`userPHID`,`cacheIndex`),
  KEY `key_cachekey` (`cacheIndex`),
  KEY `key_cachetype` (`cacheType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cache`
--

LOCK TABLES `user_cache` WRITE;
/*!40000 ALTER TABLE `user_cache` DISABLE KEYS */;
INSERT INTO `user_cache` VALUES (1,'PHID-USER-ljditzls25waa24hvicf','K_AbNYBYs5ZV','user.preferences.v1','[]','preferences'),(2,'PHID-USER-ljditzls25waa24hvicf','ShljA1NUxUbb','user.message.count.v1','0','message.count'),(3,'PHID-USER-ljditzls25waa24hvicf','rOGS6Fh944dc','user.notification.count.v1','0','notification.count'),(4,'PHID-USER-ljditzls25waa24hvicf','y_FPXujT93U3','user.profile.image.uri.v1','bBua_XG.za62,https://phab-whip.cloudron.eu/res/phabricator/e132bb6a/rsrc/image/avatar.png','user.profile');
/*!40000 ALTER TABLE `user_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_configuredcustomfieldstorage`
--

DROP TABLE IF EXISTS `user_configuredcustomfieldstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_configuredcustomfieldstorage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `fieldIndex` binary(12) NOT NULL,
  `fieldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objectPHID` (`objectPHID`,`fieldIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_configuredcustomfieldstorage`
--

LOCK TABLES `user_configuredcustomfieldstorage` WRITE;
/*!40000 ALTER TABLE `user_configuredcustomfieldstorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_configuredcustomfieldstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customfieldnumericindex`
--

DROP TABLE IF EXISTS `user_customfieldnumericindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customfieldnumericindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`),
  KEY `key_find` (`indexKey`,`indexValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customfieldnumericindex`
--

LOCK TABLES `user_customfieldnumericindex` WRITE;
/*!40000 ALTER TABLE `user_customfieldnumericindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_customfieldnumericindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_customfieldstringindex`
--

DROP TABLE IF EXISTS `user_customfieldstringindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customfieldstringindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objectPHID` varbinary(64) NOT NULL,
  `indexKey` binary(12) NOT NULL,
  `indexValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_join` (`objectPHID`,`indexKey`,`indexValue`(64)),
  KEY `key_find` (`indexKey`,`indexValue`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_customfieldstringindex`
--

LOCK TABLES `user_customfieldstringindex` WRITE;
/*!40000 ALTER TABLE `user_customfieldstringindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_customfieldstringindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_email`
--

DROP TABLE IF EXISTS `user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  `isPrimary` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `userPHID` (`userPHID`,`isPrimary`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_email`
--

LOCK TABLES `user_email` WRITE;
/*!40000 ALTER TABLE `user_email` DISABLE KEYS */;
INSERT INTO `user_email` VALUES (1,'PHID-USER-ljditzls25waa24hvicf','admin@server.test',1,1,'nmlrthukzluspx7xp5kqwjle',1468278944,1468278944);
/*!40000 ALTER TABLE `user_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_externalaccount`
--

DROP TABLE IF EXISTS `user_externalaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_externalaccount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `userPHID` varbinary(64) DEFAULT NULL,
  `accountType` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `accountDomain` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `accountSecret` longtext COLLATE utf8mb4_bin,
  `accountID` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `displayName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `realName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `emailVerified` tinyint(1) NOT NULL,
  `accountURI` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_details` (`accountType`,`accountDomain`,`accountID`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_user` (`userPHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_externalaccount`
--

LOCK TABLES `user_externalaccount` WRITE;
/*!40000 ALTER TABLE `user_externalaccount` DISABLE KEYS */;
INSERT INTO `user_externalaccount` VALUES (1,'PHID-XUSR-zxkw5ajzy3wuyjwrtfar','PHID-USER-ljditzls25waa24hvicf','password','self','salvqtg65ra67qopwxvpmbxo6knjpaws','PHID-USER-ljditzls25waa24hvicf',NULL,1468278945,1468278945,NULL,NULL,NULL,0,NULL,NULL,'[]');
/*!40000 ALTER TABLE `user_externalaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actorPHID` varbinary(64) DEFAULT NULL,
  `userPHID` varbinary(64) NOT NULL,
  `action` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `details` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `remoteAddr` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `session` binary(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actorPHID` (`actorPHID`,`dateCreated`),
  KEY `userPHID` (`userPHID`,`dateCreated`),
  KEY `action` (`action`,`dateCreated`),
  KEY `dateCreated` (`dateCreated`),
  KEY `remoteAddr` (`remoteAddr`,`dateCreated`),
  KEY `session` (`session`,`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES (1,'PHID-USER-ljditzls25waa24hvicf','PHID-USER-ljditzls25waa24hvicf','create','null','\"admin@server.test\"','{\"host\":\"9e0716c949be\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.106 Safari\\/537.36\"}',1468278944,1468278944,'172.18.0.1',NULL),(2,'PHID-USER-ljditzls25waa24hvicf','PHID-USER-ljditzls25waa24hvicf','change-password','null','null','{\"host\":\"9e0716c949be\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.106 Safari\\/537.36\"}',1468278945,1468278945,'172.18.0.1',NULL),(3,'PHID-USER-ljditzls25waa24hvicf','PHID-USER-ljditzls25waa24hvicf','admin','false','true','{\"host\":\"9e0716c949be\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.106 Safari\\/537.36\"}',1468278945,1468278945,'172.18.0.1',NULL),(4,NULL,'PHID-USER-ljditzls25waa24hvicf','login-partial','null','null','{\"session_type\":\"web\",\"host\":\"9e0716c949be\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.106 Safari\\/537.36\"}',1468278945,1468278945,'172.18.0.1','01a1f4cf8e06e11df638cd6835cfba8cc5269b26'),(5,'PHID-USER-ljditzls25waa24hvicf','PHID-USER-ljditzls25waa24hvicf','login-full','null','null','{\"host\":\"9e0716c949be\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/51.0.2704.106 Safari\\/537.36\"}',1468278945,1468278945,'172.18.0.1','01a1f4cf8e06e11df638cd6835cfba8cc5269b26');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_nametoken`
--

DROP TABLE IF EXISTS `user_nametoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_nametoken` (
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  KEY `token` (`token`(128)),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_nametoken`
--

LOCK TABLES `user_nametoken` WRITE;
/*!40000 ALTER TABLE `user_nametoken` DISABLE KEYS */;
INSERT INTO `user_nametoken` VALUES ('superadmin',1);
/*!40000 ALTER TABLE `user_nametoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) DEFAULT NULL,
  `preferences` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `phid` varbinary(64) NOT NULL,
  `builtinKey` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_builtin` (`builtinKey`),
  UNIQUE KEY `key_user` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferencestransaction`
--

DROP TABLE IF EXISTS `user_preferencestransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferencestransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferencestransaction`
--

LOCK TABLES `user_preferencestransaction` WRITE;
/*!40000 ALTER TABLE `user_preferencestransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferencestransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userPHID` varbinary(64) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `blurb` longtext COLLATE utf8mb4_bin NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `icon` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userPHID` (`userPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_transaction`
--

DROP TABLE IF EXISTS `user_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_transaction`
--

LOCK TABLES `user_transaction` WRITE;
/*!40000 ALTER TABLE `user_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_worker`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_worker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_worker`;

--
-- Table structure for table `edge`
--

DROP TABLE IF EXISTS `edge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edge` (
  `src` varbinary(64) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `dst` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`src`,`type`,`dst`),
  UNIQUE KEY `key_dst` (`dst`,`type`,`src`),
  KEY `src` (`src`,`type`,`dateCreated`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edge`
--

LOCK TABLES `edge` WRITE;
/*!40000 ALTER TABLE `edge` DISABLE KEYS */;
/*!40000 ALTER TABLE `edge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edgedata`
--

DROP TABLE IF EXISTS `edgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edgedata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edgedata`
--

LOCK TABLES `edgedata` WRITE;
/*!40000 ALTER TABLE `edgedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `edgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lisk_counter`
--

DROP TABLE IF EXISTS `lisk_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lisk_counter` (
  `counterName` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `counterValue` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`counterName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lisk_counter`
--

LOCK TABLES `lisk_counter` WRITE;
/*!40000 ALTER TABLE `lisk_counter` DISABLE KEYS */;
INSERT INTO `lisk_counter` VALUES ('worker_activetask',7);
/*!40000 ALTER TABLE `lisk_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_activetask`
--

DROP TABLE IF EXISTS `worker_activetask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_activetask` (
  `id` int(10) unsigned NOT NULL,
  `taskClass` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `leaseOwner` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `leaseExpires` int(10) unsigned DEFAULT NULL,
  `failureCount` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned DEFAULT NULL,
  `failureTime` int(10) unsigned DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  `objectPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataID` (`dataID`),
  KEY `leaseExpires` (`leaseExpires`),
  KEY `leaseOwner` (`leaseOwner`(16)),
  KEY `key_failuretime` (`failureTime`),
  KEY `taskClass` (`taskClass`),
  KEY `leaseOwner_2` (`leaseOwner`,`priority`,`id`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_activetask`
--

LOCK TABLES `worker_activetask` WRITE;
/*!40000 ALTER TABLE `worker_activetask` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_activetask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_archivetask`
--

DROP TABLE IF EXISTS `worker_archivetask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_archivetask` (
  `id` int(10) unsigned NOT NULL,
  `taskClass` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `leaseOwner` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `leaseExpires` int(10) unsigned DEFAULT NULL,
  `failureCount` int(10) unsigned NOT NULL,
  `dataID` int(10) unsigned NOT NULL,
  `result` int(10) unsigned NOT NULL,
  `duration` bigint(20) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `objectPHID` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dateCreated` (`dateCreated`),
  KEY `leaseOwner` (`leaseOwner`,`priority`,`id`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_archivetask`
--

LOCK TABLES `worker_archivetask` WRITE;
/*!40000 ALTER TABLE `worker_archivetask` DISABLE KEYS */;
INSERT INTO `worker_archivetask` VALUES (3,'PhabricatorSearchWorker','32:1468278944:9e0716c949be:39',1468286144,0,1,1,0,1468278944,1468278944,4000,NULL),(4,'PhabricatorSearchWorker','71:1468278948:9e0716c949be:1',1468286148,0,2,0,258872,1468278948,1468278948,4000,NULL),(5,'PhabricatorSearchWorker','71:1468278948:9e0716c949be:2',1468286148,0,3,0,24121,1468278948,1468278948,4000,NULL),(6,'PhabricatorApplicationTransactionPublishWorker','72:1468279001:9e0716c949be:52',1468286201,0,4,0,59001,1468279001,1468279001,1000,'PHID-AUTH-xwyiqplbuw2ru5imydlm'),(7,'PhabricatorApplicationTransactionPublishWorker','72:1468279017:9e0716c949be:68',1468286217,0,5,0,112667,1468279017,1468279017,1000,'PHID-AUTH-mmaqw4acmxqguibmalqz');
/*!40000 ALTER TABLE `worker_archivetask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_bulkjob`
--

DROP TABLE IF EXISTS `worker_bulkjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_bulkjob` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `jobTypeKey` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `parameters` longtext COLLATE utf8mb4_bin NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_type` (`jobTypeKey`),
  KEY `key_author` (`authorPHID`),
  KEY `key_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_bulkjob`
--

LOCK TABLES `worker_bulkjob` WRITE;
/*!40000 ALTER TABLE `worker_bulkjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_bulkjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_bulkjobtransaction`
--

DROP TABLE IF EXISTS `worker_bulkjobtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_bulkjobtransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `authorPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `commentPHID` varbinary(64) DEFAULT NULL,
  `commentVersion` int(10) unsigned NOT NULL,
  `transactionType` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `oldValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `newValue` longtext COLLATE utf8mb4_bin NOT NULL,
  `contentSource` longtext COLLATE utf8mb4_bin NOT NULL,
  `metadata` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_bulkjobtransaction`
--

LOCK TABLES `worker_bulkjobtransaction` WRITE;
/*!40000 ALTER TABLE `worker_bulkjobtransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_bulkjobtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_bulktask`
--

DROP TABLE IF EXISTS `worker_bulktask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_bulktask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bulkJobPHID` varbinary(64) NOT NULL,
  `objectPHID` varbinary(64) NOT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_job` (`bulkJobPHID`,`status`),
  KEY `key_object` (`objectPHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_bulktask`
--

LOCK TABLES `worker_bulktask` WRITE;
/*!40000 ALTER TABLE `worker_bulktask` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_bulktask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_taskdata`
--

DROP TABLE IF EXISTS `worker_taskdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_taskdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_taskdata`
--

LOCK TABLES `worker_taskdata` WRITE;
/*!40000 ALTER TABLE `worker_taskdata` DISABLE KEYS */;
INSERT INTO `worker_taskdata` VALUES (1,'{\"documentPHID\":\"PHID-USER-ljditzls25waa24hvicf\",\"parameters\":[]}'),(2,'{\"documentPHID\":\"PHID-USER-ljditzls25waa24hvicf\",\"parameters\":[]}'),(3,'{\"documentPHID\":\"PHID-USER-ljditzls25waa24hvicf\",\"parameters\":[]}'),(4,'{\"objectPHID\":\"PHID-AUTH-xwyiqplbuw2ru5imydlm\",\"actorPHID\":\"PHID-USER-ljditzls25waa24hvicf\",\"xactionPHIDs\":[],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}'),(5,'{\"objectPHID\":\"PHID-AUTH-mmaqw4acmxqguibmalqz\",\"actorPHID\":\"PHID-USER-ljditzls25waa24hvicf\",\"xactionPHIDs\":[\"PHID-XACT-AUTH-pxdifntwcl2aabl\",\"PHID-XACT-AUTH-bet6kmgg2ilzmvb\",\"PHID-XACT-AUTH-grlmbjl3hplii4t\",\"PHID-XACT-AUTH-guu3qyfqdzzrg4r\",\"PHID-XACT-AUTH-bbbyytlilult7je\",\"PHID-XACT-AUTH-yivg546gvpjwyfx\",\"PHID-XACT-AUTH-gzfhwg3w3nwecuh\",\"PHID-XACT-AUTH-s3afrq5jy7eos6e\",\"PHID-XACT-AUTH-r56mmexuljzt3fb\",\"PHID-XACT-AUTH-q5a66iahibkpsol\",\"PHID-XACT-AUTH-hxjhttxwt2cengw\"],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}');
/*!40000 ALTER TABLE `worker_taskdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_trigger`
--

DROP TABLE IF EXISTS `worker_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_trigger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `triggerVersion` int(10) unsigned NOT NULL,
  `clockClass` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `clockProperties` longtext COLLATE utf8mb4_bin NOT NULL,
  `actionClass` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `actionProperties` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_trigger` (`triggerVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_trigger`
--

LOCK TABLES `worker_trigger` WRITE;
/*!40000 ALTER TABLE `worker_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_triggerevent`
--

DROP TABLE IF EXISTS `worker_triggerevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_triggerevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `triggerID` int(10) unsigned NOT NULL,
  `lastEventEpoch` int(10) unsigned DEFAULT NULL,
  `nextEventEpoch` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_trigger` (`triggerID`),
  KEY `key_next` (`nextEventEpoch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_triggerevent`
--

LOCK TABLES `worker_triggerevent` WRITE;
/*!40000 ALTER TABLE `worker_triggerevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_triggerevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_xhpast`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_xhpast` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_xhpast`;

--
-- Table structure for table `xhpast_parsetree`
--

DROP TABLE IF EXISTS `xhpast_parsetree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xhpast_parsetree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorPHID` varbinary(64) DEFAULT NULL,
  `input` longtext COLLATE utf8mb4_bin NOT NULL,
  `returnCode` int(10) NOT NULL,
  `stdout` longtext COLLATE utf8mb4_bin NOT NULL,
  `stderr` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xhpast_parsetree`
--

LOCK TABLES `xhpast_parsetree` WRITE;
/*!40000 ALTER TABLE `xhpast_parsetree` DISABLE KEYS */;
/*!40000 ALTER TABLE `xhpast_parsetree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbprefixgoeshere_xhprof`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_xhprof` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_xhprof`;

--
-- Table structure for table `xhprof_sample`
--

DROP TABLE IF EXISTS `xhprof_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xhprof_sample` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filePHID` varbinary(64) NOT NULL,
  `sampleRate` int(10) unsigned NOT NULL,
  `usTotal` bigint(20) unsigned NOT NULL,
  `hostname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `requestPath` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `userPHID` varbinary(64) DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filePHID` (`filePHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xhprof_sample`
--

LOCK TABLES `xhprof_sample` WRITE;
/*!40000 ALTER TABLE `xhprof_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `xhprof_sample` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-11 23:17:29
