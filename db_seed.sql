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
INSERT INTO `cache_general` VALUES (1,'K3VntSub8LL2','phabricator.setup.issue-keys','raw','[]',1468279028,NULL),(2,'72WC2iN478Rq','phabricator:celerity:/res/defaultX/phabricator/9fb86c85/rsrc/css/phui/ph-_Q2HxHcpwaJ2','deflate','�W[��8~�_a(e:�g&��P(��.,}hY�,[Ǳ:�ed9�\r��+�9��C���w.ZeqA�<rrV$):P8Z���0q	p���H����{E�p�6Q��䉷�NV�%�����]���`��is�}�N�+\ZB_�&]�����\0VG*c�Auo!���ܯ>��O%���Nv���\'���������\r���6���C`}�}��0�����3�����_� i��/P���~����q����:&��4^EY���.�f���2�<�.&���2��F�rnM\Z/U��\'�7����(�zy\\r�6�W�6e���U�l��5��б������G;7�-#�*kb�_����P�R�^uf��ϯ�%r�\'����%bK�A$�#%2�B��wk�yk!�����]�9%��t7��Y�ki%G-0��&���&L��f8����n^�����D���f!~@(ҩUp,�h\rTQ�&�h\n�ڕ=��c2�SIy���4�����}P��zhyi�@����o����C�pP�5ulۑi�!����\\�0��\\�\\֖�\'�������z��؂sVB	�kp�����RB 5�duW���<#F��/pn��)�8P�x�O�9�ftPu�HG�J����hr\r��\Z��U��2�n~���;��Q��f�lS���|[e�H�U\Z�W��Q�l�H.���E}�0Ef\rЭhn��)���02,���S�B����Xq5�W��q�fx}��w����+�q��7&޶�;	�}��|����nH�:v�\n\nE�tMBbO�J?+7�q����/�f���A�I*9!�,�:�~�ar>g�،Ǜ�?v$h^-Z����3B�����C�T�w��ךQ�mԿ�ԷZ�\r0��\\Q�iĻ}��4|�<N�SPwR��B�d�ܖ�[��CC��n�������v*�Y5eB�}�s��C�bj1�Zۥjr���o�U�Փѿm�c!3�����)�� <,=�D���uG�<�ן',1468278923,NULL),(3,'jqGiSRxR47wu','phabricator:celerity:/res/defaultX/phabricator/9cda225e/rsrc/css/phui/ph-CvkVoep5eSUo','raw','.diviner-document-section .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif;color:#000}.phui-document-view .phui-header-tall .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup h1.remarkup-header,.phui-document-view .phabricator-remarkup h2.remarkup-header,.phui-document-view .phabricator-remarkup h3.remarkup-header,.phui-document-view .phabricator-remarkup h4.remarkup-header,.phui-document-view .phabricator-remarkup h5.remarkup-header,.phui-document-view .phabricator-remarkup h6.remarkup-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup .remarkup-header{margin-bottom:8px}.phui-document-view .phabricator-remarkup h2.remarkup-header{padding:0 24px 8px 0;margin:32px 0 4px}',1468278924,NULL),(4,'uWI8flh81QkH','phabricator:celerity:/res/defaultX/phabricator/c7ccd872/rsrc/css/font/fo-SF0zGSJG3FtM','deflate','���n�0���+�@#m�m�a�\0��fR$\'D��6���IZE�dm\\8 l��f�#v[�D���|�i�a�����z�W{g�s}�{�ʵzXpy�j����\r!9�zp[i�|̑�!�xZ:X�t?��9���k��ŷ�vn#�}ƀYv;����ŏ�T.d����ԗ��<.܂��a\n��JA���H��W	���oK+��T�����n�8����l�p�����_m�{�����y��1M�J6�\"7�=�^�V��kE����8���Z��h�B��1UЪl�b��~���� z���v��N��iPi�u`Ǫ�&���Ls�I���@���L�r�5U���%L��HQ�EL�D\'K)kJ�A|9�|#�땪��nL�HGhT�L�7���PN�5�p����Pt,Ɵ/�N#\r-J���$��+��	���ا)��_q�m�/',1468278924,NULL),(5,'xADEf8DXjH1U','phabricator:celerity:/res/defaultX/phabricator/8bdb2835/rsrc/css/font/fo-OX41jDHSf522','deflate','��Kn�0\0�=E�,RS�,���	���1MPջ(e�Da��Ú��9qY���ƯK!���(��0�b��u¤�~�n&�T�Z�I�Ğ(�Iu���T$�3�aF���iT%���~xz�+Jm?���+�7��yzxV����q2���R�Z�ˬ���q��L�Wɹ7g~,b�����aI���1�	_�Y�V\r�wIA�q\Z�����w�jN�m���q�c~��\0�=�r\\�y#@�4���,��pp��������4�$[㤡�4���{�� z�-S��`��',1468278924,NULL),(6,'xRfi5L5jPg1U','phabricator:celerity:/res/defaultX/phabricator/027ba77e/rsrc/css/applica-IUMXSXz0yWmq','deflate','���n� E%R��\Z�q�s��fb��`Q{U��[����,@١\r�V˸Y��8#�&���ZF����2k�Ȍn#��/C�3_���^P	\n��?���I�G�3�(E6����8M&DI \"H7m�I�\'%#�]�f�h����m7?�%�����?���=O�MP������d�V���X=�&߈�y�����I0�d��d��C�K|��6�4�7#��KW�@)Q�|\'�؉��7',1468278924,NULL),(7,'fxrlGttkyWmS','phabricator:celerity:/res/defaultX/phabricator/4e7e9bde/core.pkg.css;def-RshTOcp1EFWm','deflate','��i��H�0\n�_�����!��sl�IH���y��.�6$��c�߯6@+I����koWV�)���#�����/�vz�w�{����n������*����*��j��v�w�r�wY�tѕ�w���-a8Z������=�2\Z��h�w��͉�f*�\'�rD����q�.���~��s�+}�}H�}�6\'D�7���;�\0�#���ٞf��� X��.�f�̉s~ʖ�}��E�����#z�K��zɣ߃�����>����7���ӓ���k��]�d�����ӓ�x����ϲ/�,A@�J�A\0�k�u�����`\0�B�A�>��m&)���������m%�oSI9꜓~<���ɀ��OG�OR���H:J{�\'���]�t?\\�����HBػ����u����B:~�}�^�W�h���Uƃ�G�\r~�yQ���;�^D�V@Y����wWp���=,�9�V3�\0/�*%��$	H�4MĆ}�]��O��	��ð����5SJ�b�7Q,���=���|�WnP$�C8:n�ն4ӓ�߹�j���|͠���=�����:w���߿�G��Ӷ\\-**k�fV���}��D~�5�S��P�Q��A���o����	����a��P�0����\'o�l��}cd~�4�O#��-��99��Ϡ�\'���_~ܐ���C�%�	f����:?l�\0��`�<[�Ѫ��8�������n��\'��_�a[�Ǚ^\0]����������\Z\07\0���]�DQ2�v��㭕�IQ~K��玞�@�>&\0��w�ѷt��F�6dY.���|�(.�G�4�OɑF�	4~X!w�.߁o������>`Y�Y���Bq\'#�t�\r�@(��q�Ђyz������᪜�\0x���s��7���wE���{�o;�2�r$B���<0��E��o{��[�#~Ȗpt�������7Q:i�Nf�w.�Y�1����S��g)�.�\'@�e����!M\Z���H������V�H���4C����;ʇt\n�̿�Ny@�H�,KNP2`����*g*R��Kت�kև)�����2�~���8�s4�σ-?F0ؿ$S���Ę����`=}xj�{��!O�5]/����1�ʼ{P��N7�����c�&�O)U�N�~4h�!��Q	X[0��2�L+�:�uD��V@��͙R��^��)���P��s�p�8�A�����-.{޾�r\n���H�|���V�\"y��i@���É�)�<?z� ��S�A��08͌:{/���:!w浤[v vI������Yv����~��xN���$3W�ܔV�cЮ��[�U �ݦr40�{eU質���75Ȗ����p�g�Ԍ:���eꄼ&�p�� �\0E��\0ţuP���c�l�L=�!��<��̂���]l��C�;ܣ�`�r�A�b=�.�]�3�K4clMا�[0�?d�3Rl���\"!\\�%]���(!�n�s6�W�!cd뒗�x���Xv�g�F�!�x�3��B1\n&݇|��`�I�M��R�̳,����`���q���d��}K�8��R�M��=�\n$����ES_��`��9��	J�����|\\��->�?H:^�K���#8w?�p�:���{�C,hfH���a����I+hH|�L����p���_�#oh�_���C�H�6��|�7�|��o��\Z���=ܿ��8οy�[,��\'��{R��Dx��\0��� *�HT��r���\r;:=܏��TCA-8Ҥe���\Z������w8�vTq>�a��X�q@�ԟoD�H�����Hz��Nɑ)�����J��h��w��!\0�&��?����/��I%ߓ���й�Ά�\r���K~�6�3A�(2�[q�E6��X e�ߠۄ�W�DZ�I�w���� y��?��#>��6����L�p���9���,z���3te��^ܺS8�f�`,�P޸i����������`�|��[�[r���-f��S��c�z��y��4�ێ�ȼ!�!��~�3�ho|O)�\"�Zͧ~��|����D�8��s�}#^��7н�\Z/�4��\'?��\n$I�%!�Cn\0��ߞ�#��n�~�:a0�(!#�\"Z�kl�q|�a2W3(��=�}��NT%��D��%�\n��2?_o�P5�ʕ-]9E\"����U��;�0�P��vvc�\r_>yU�\n?\'��b��g�\'�~��*d���9Ԭ��a��J���.�n*��c���f����.������m�8Q��EUyJ�W�u�ɚM����a�(���k�t1��?��o��Oշ�猂�.Q�A��s��6��G����F4���-܄�[���J�h�j�$^��n�%􌆻�o��H�����ok�����3ݯ��F��۷��\'y?����}�4ѿ\'�J%قf�xGr�_H;�������Gu�25.ɮ�%���ޯ�kh��K�V�αPޡ������p��IG����~����S<?����&�mb������i1�g�\Z�t)z`z\0���Sl(̆�(3iR�>���1-!�xL�����j�U����G{	�nCل��f������T�F\'�M�/�6[�B���{A��PK�%���n����]F������Y8,ߊ\0���L2������\'��s��l$ē!���z׷*Ģ��TC�νe@�;���r���\\�������p��kJ������7��o`j�\'�)ٯ�\0~�H�a�@	�T(s�K�dP^&�l��A~�>�>���F�n�P<�|.�e�;�ĸ?y2WJ�xr�u-��Q�=����+��M�w��_��\\�B�u��R&(�E�8F)�M��A@�t	�q�5��llѠ�<�L��^��D,)�̒\Z�H@����B��3_/�k�;e%�.wϨH�bZD�� �6K�Xnx�ъ�q���W�xn�35����^��IS��*�	�q��K朂�7XAu,C\n������*]�o���Ϫsc��D���π��,�R6\'O�ʖ�ݎp1�O�Dߑh�h$��_��H�E9��c��wQ$��Z#�\"��\0!�!�-9�9�Yռ\0���!�OC5�-���u�7�!ۉ�����V{�;�� 0���H���M�\ZL�� gP}X�������씺��Իh���M5\\�g�uIn�+����~���k���Rˠ�S=���������E��&��Հ�zh��yHA�\\I,�>���V�QQo�7��B��N��y��N��s��k��㮧/N��W�	o5��U`�:-��-q�ƒ|J����#\\��Z�!\ZE�����M�<�{��n�J\0ޕ\ZȻ�$�S����*�PH�τ\"6��ւ��@����2��t�C[@��˖%�m��mgd�_1�v��7�)*�>	+t�ޔf����z}�Q�k�s����v��N��д�)ި=�5ҝ�Y��CY�t��s&�l}O���B\"����E�=߰��w�Ɗ4��|v\\d4@(d_GF�\r1�`1��#Ǯt�B#���o/�B���d�9�\ZK�����*�F-�1[,��>Jm��������q��\"�]$�QF��iy����|�f7F��_����>[(�=���=f���Ӷ�*]eM\\i��Z}�gl��YϘ���J�:�R�c]�*�qkV#��I�5��V\Z�-M=v�3瑤ԇ\"a\'z�L_ٹJ�/�ӢU�+\0���V��ױfD�7]����)���Cp[��Xc�|	�\r�@�mn��$���.����n�)[��[/��w���Bs\0��C(�dO�U&k�-6��2�\"�=�M��؂D��9�hBP��êV\0�&t��9���&}�����#�rVg��R��+�L����X�D��۲���E���B6!��T6>t��$�����Drt���\\wto��4v?R�`��쓘�%������^&}$�Inf�O�@¼�y�;�����Ý�q��|�A�[|u\Z��Y�s(�gE>y�^&\r�!a��P��fh�~ax�F������/ˆ�a��=�ݧ���j�����w�������)W\'�׬Z2h�b�5�x�yH<���+a���[�=M�]A��)\r\n�p�j����[)&��	��s�\ZH��p�^D�?<J{���P��w�P!4%��9I���x�ȕ�����N���r�\"�?B/�dp\Z@�����ۥe�k0�珛7RV5�\"a{�Yj��lm/�Ҷ\r%�qiؑ������)!��բq�y�肟�����<��#�{}��]^����J�h�>\'tN�\"D��9�b���DNT����%9q�K�D�q��\\�!y$�A�xǹD:�g��kC�¬CbFu�~\r�7�02@�d,O&D�ҧi��\0���i�j�¿@�D\0��qO�ڭ�5��+���v��*�qY��\\ہxؘ�ں\n\Z����2E�lG�ޔ�;~�(�+N��}�w�zV[\Z1�\rfK�0���$�����$iȜ��^�w��j��9۩#��*DwP�D.p(,S��Gb0��NZg��ّ5(��`=��U�w�dR�H,Xc�{ �W�e=��N�G|a�Ŕ���<���Ð�x�1v<`���U�\Z����T����cF�ӄd8�_)qo�	T��yaD�K�=��&� �t�ȃ�x��пV�y��x�8��\\��(�\"W��	M���f4c>l;�G�{\r�`k���{��U�!T!gz��^&6%����N�8�%EξK�p��w�+mGH�fas�]RC���Ş�ը�]t>���)�<~�L�x;Wm��@2�g�`�ã���.���\r%ǩǥ䓝��K��,��3$���ʞ�z*y$2K�^(i�c��V����@j�k(�ĒIy�P���:?@W�[H������0(��qx�9^��$��G���ӛ\rI�(�M���[��|n\ndCp���Rb��{)m_�{�?���1��r��\Z,�iVA��߳W&�Zɉ9xpl�Z%�?��Ĺǻ���i�0$C)��Jg0�#~�;�GK�����o�=��+Hj0C\"/���J��Rx}�}w+@��_�\'R���ɹ�u������*r����I�V��S	=�)~�}�̧�K���\'�+��Rc�\"�Bc�?v���	���bp؍b�\nBG��p�I�Yb�{lH���~�ە��x�U�/�$�l ���I#K�#��\r�5D�<�p�d�Hl�S�X��2�%�ހr���P�DPV��� n\"���(� G��np�I�F��>��T�w��\0ދ�|�$�_G�r �Y�Ux^p�������O\\>K7�4�+���\"���3g���*����7�|_>��R��X�K�-��		S��w٠�û|��@5=h/n���S�N��Ny��7T2޲r�,߷��5X�Tw0oa(���ׅ��?��T���>A�e��\n�k��ӹq3Լ�U�-\n3���P��HW��B�����xRNP%a��h��\nQ���q�R��O=x�����g����#\0��@��W:*�=�$���i2#���L���n��Z��J9OӜ�5�e;wTs\\�ZqE\"M�ks��ovP�\n��lK悍3	y�sFKPH,ڨNF-��D�\nRUr��`�ϻ������df��M��r��\"��Л\n�,��>R!��gK<;PH^��L�R\"�ʚ.E����#�J�Pf#�,�������E@Qk�|�ܽl\"tE�U�\0_^2�#*.���K,�����$�w/�L<���tB-^�o�hJ�݆Uf�b�)��%qB���w�ݴ�p<�����i���Bts�|K�\Z�fvv��X?�&EĲ�>���~>P�R�hі��̈�}��3��J�\"�/�&\Z�k<�2�A���E޿P?z���)m3�wXAv��Z���ZE�4�����*�Pp�\n�_2�ݏ_�J\'N?J��b!��S��b�\0G�,ne�\noߌ����#�Uegq����\n��%u����+�%\n��D�9*?�{@Q�,11�I���&U�/�^ �|ӝ�=t\\	����E8鑮�o��0�zn<z�٤��Ԕ��q��ʆ�#\"�c�y;��X�h>W������#���+X�_*�Gd�<�E�R��/i]hR��U��k����6��YuYi\n��V��`��~����3�h�ҏs#���Z��=+��Ah��h:�K$\Z$�D��\\q�����xc΅�y\"��	D��\"�7ӊ�|R���[R,��}ˋ<�9Ԗ���\Z�mZ?ɋ��=�����5�n��%Lɻ|��K�C&�|�/��3h�پ�-_l���NNɭ[�I�	4uJ[@:����[t<�~�z����w�Q�N���9RxT���1���&���N�p�aW�2$���)��}�s���?}��\"�]�G@�9V�����<j- �[���2��EN֒�f|�_�1��\0�_�~�]V\0r��0��=���(�\r��~ɋ��R���^8\n؎uě���]5Uq�d�:��A�&{�õ��Rz�(�\r�v�5�/�2e��c�n��\Z�}H��:\Z��*�g��=��ˤLk�ۦ�H�9+�_e�e|D�[?��\n-��.*Ko��U���B�(��:�-!���/+pxr�7Nφ�IHe�Ղ�T�j�Ǆ}���ӛ#�o�Ό�*9�08�d��=�l��B �V\"��\0�VE�߸��I���ב�����^V����D��S�L�[�\r�X`���w�},iIΊr��g+\\p���pT�P?s��Y$�0\ny���4p��Į��Q���K_��own\\$c�<��Ήgՠ�n�J�$g��W�y�M5^�V{vT2��V�W\ZP��ί4��Z[QɒΔ3�p.K�-l{f׉9w����3�-~��.e.����j����əBW�m�%� V�է�t�ޥ������|2c�-Z�囕�,��K�iŽ�9C�/��2�LN���������TA2����T�=���U�XM��O���d�C)�H��!E5�����Nr���.W9\n�]A�(^���.�����K���;�G��\'��,���kx�[\n,�6~��]F�;�|	`\"J�a�fU|\'�F�n�m���1���\n�ıHi��C�o_B�J.}������F.I��ך��H���\'q��jq��P�E�u� 妄<�;>�ԄE��f���Ñ�{[�YW���#�����E��T�&�\n�i��<.-�D���5C��i��L�r�k��7O=\Z�[����و5_�I\\�ɖyK��f��X`wG��!�S�og�87�3�b�m[~	�6��4KUͪ��\ZU�k���B�ޮ(5�A?+\Z�d�v2�Y��*���L�:<�Eʍ��E�ӊ�|.KދV��rY�]tv*�z˛)�KJnJ\n�8%��ud4�ֶ��,��Ҩ�A�v��^Y\n�%��l_��n*4t}�B�\"Q�b|�~�lC��9�P�.��Ρ�\\�\"\\c;������z��Ƌ+���G:�t�w��|��2�w�V\r��{���g�K\"_��bՍh����C�:5m���I���`w�*~�Ф\"k�f�ʉ��T��}ʘ�>\rup�� �w&Eݜ(I����?���2ၺ�\n�0 ሖa�4{F�ړ�x��/���P2�~�G��6:|0:B)��ьϳY|$XB$<��~�`�NY��[\n8���GBß[��F��riM�ʂ_D���?uAZ~�a��rd�@T&g������6��Ը��1{\n��{I�\"�Ҏ%���%�(���ZbNU�	M��¿P$J�+�6�o�U�-%�\\5�Y-�6x�\"��EJ�����J<�e\"��{���s>8&�R�@25�\0���q��a%��S`e��[&d:(\'�\n��a�G ���|!\Z��ug��f��Sp��`�sDs���E�`M�r�m%���\\��G�9_�{)�(5�=NK+9G)�I:�����I2�BY� Lؕ�\ran�7�.m�T\ZU�9ܔ{�U%c��52�yP�l	K�c��Xr���h$tIbN����Ŷl�BK%����1���$]�-�t�~�*+K�9R�$��?����j���&��0�ri��gc*!�n�\r�B���p?�s�)���37�@�$H�(��,����8q�؆�3i(	7�����*k�5��?V#�FjѦ�R��qn�}f�p3�8�W��VI���h]�MB��v�l$�\'*/��>#7��O����j�<�LL�_\"E����QC���26�9GO΅]\0��(�6&9�D ��2arQ��62�Ir�~����5 a�Oy#�t�8��s�����S8o�����єKJ���ϕFgE�?x�\'�&�s,i7��`Z�Z��\n��q�K�Ѫ�.���c4�4O1M��$�J~R�M=oY�f����d���Y������>(���‷?�G��M]-��WOg��cS�a��9���ȼ�/C�ԭ������sn�pm`�����53�,�\n�B�?�)�UL_m.�;��x\rPΊ��Ĕ�˩E���HPL\"��V�U�W$+�DS,�ȃAW�!W��\\����%ڑD���@6Aۑ~V��b��÷3���I�T��M{p�����,^���Hi��T�*�<��>��\n��g{t ��,j.�/�K��>��	}:TɀW�*�%U�?�G�I���N1^�Gfe�Q^�B�;8�8I�B���B|\n�h�aѣ���\0<�L�a�\0Ʊ��t��j�I}��>u��0|:�z�����	�����F8ښ��T\" �J{�0�h�h\\E�\Zh�8�#YA�B����zy�W�WX��PBQ<��AK&@Z����K��Z���m�L�\\���4%�<��*��f)EK��΢�H������=���a������bga�ؗ�#Ϡ7\n��d�π�π��`\Z:���3��}\0����\0������N~�\Z㫽�{E�6&�p�Q>bi��I�3����{��.`T�~��x��v����QA}��2���Ř��S! U+�*��Бl��z/�*	����s�������,�aN�p-q�]z��KQ��Ѿ�X�K�#mU�ͪ�E��2e��ۺn$�ѭx:\'�#�r�ie G��J\r�Kۏ\0���;xt,�K]%L������V��Y?}�\"<t��~\nJo�@�!�b}�S�GsoZ~��6�)�Z���\\�\\<\r�%y��}I��W�}�\Z���P7:��4<O�l�����~%�� g*���b�0=���c~��%�󁓸������C�Ц\n��1eTD>m�3��&�e��V_ m����\'$.�\\�١����T��e��?��(�ڞ%d�u�i_rC���J�\Z�����t�Cy�W�P\"3�y���GZ�qV��ܗ�������q�?#����A�:\r<�rXA��p��)���J��ٮ��<V�-|p���?�|h>�Ym�y�X!���yZ1��	�%�eo�5�D�l�i�܏��hjv�B�2�(��yZ�7�_�Ӣ�r*�=�� ��H���:ϻ�.&H��y������:�	��Š$��#� lJ���0C�M����\"�a7�q��k�`7�8�i��1������~կ�����&�9m��_��7Q�G�j�����ƴ�ڙ��l�i��X�n���qگ�%�X>��\Z��4��u���\0yf�m���nu��zhA�&41&���׻�v9�٠ӳ��={B�mxr<`X�F8�$l��\\�\\��d�\\F߿�jw��q���a�Evk��LЗ.�,��q��6�C����ڽ�((Go�DkJ�-��X�uI|�١�.	cg������F�#��Y9.������\Z����-��޴Eu���H\Z5�+�Pn\n(�e��W�Y��{`��$T�w{d2�\Z�	�K�*��[ ms�RQ�v�-�5��C��Ø��@]�2��]G,F\'j�7,M�fmc>�M�M�B8���<�ѵ�ff�p.\\�\Z��x{w���B�/�q�ʣ�J����ᕝ[5�l��.�s|�@���v���*�p`eS_0�ħ�	�?u��v�#��\ZG��b��˝��\"�#+W�Q�3D��L^�&�R��\'u�D�ur��k���N��<<�\'�}�)��g�R�k,�,�f�$%�܂��-��J�(�b�N�\ZE\".�!2�\"��\n��G�/��T�o1<���j�(�2����p�,RF�}Ed������<�\\ZBɚ��.���Oe����H߄��t�*P�[�6�i����y�\0(���Bqn(f�*�\n�V�UI������﷔��+qz�����D��pT{����I������������V��Tc��Yˠ�WIv��w�-e�\"��.e/���F�Z4�V�����T�0g��6���T��D	��_v�#JZ���K�U�ܽSr&qsšw���Cp#��oE(a�ה#L�[\'�ع��Hʏ��Hv��8�P<Gp/��ΐ7TP��^�T�J�ϖ@p�L~��hS@�F�7c����g�pY(�gp�~���*��C��h��+r���,���-�Glr u�}�!��!�h�L�м\'�Ē	�]4�λH���wz��r��yrw~/%k�.���b�����}��\n�*XM��W��1��/��7�߀L�c��PqG��#��)�4����>\'W�w���(��g�Y?*�_��t7�/&;L�#���?Yg��ocq���\nX�c�t���êOŴ���;k�p�LA��#1���T��W�fe��#��9aѪ{���}sr/��*�2��E2C�����o	�|��6��R�ȓ�+��\nΚ�E��o�����YY٩�L�(H>��2<��-�]��\Z}�f�W���%�{�\rN��$��0�̃�p���?��<�+K�{s���+�N?\r�w�[�� �Q|�X��E�^����!�uy�*��{P��F�$�7�U��}R-2�H��>h���3���-}�z�l^&�-��0���oob�ᇉ�K�oF�_)\\�T[�z���\\�x�-Zhކ\0?<U��ڤ\n��s2ܣ�8�J>J��9J��k����ss8r¸�%ﭟ��Li�KR��=�/-r�hTB6^Z�OJ����-)����X�ENI��f�����\\¼��H��[�[�v�u���1�Ѧw���F>FiI�m!)v`�E�V%�.`���AO�;A�{�\\%�~/���h_��)<2o��W@�fqr\nŶ��#����\\{�����-\ZE-\0U�.�����R��9��8��B�{��eս|K\n�K1Tu�!�	�:]��!�eh�G��7\0*�߾8g��#���N�C��/�#�J\r&�@u���F���J�z�G\'��@\\L�����b��r!�K �<�g�ܧn$��?L��6�G%H���Q��R��Hq�*Tq���By�X��?\\���/>*�{�*�h�`�&nql]55��c�7���j��|��x��>T�|b{�n���Q�$�a�l�f���K�)	0SG3��	��y�Y����ο��O^����y��\\3�����{ �X�X��/�`���%4���|H���[�%}�[V+��c4&tFt�(�V�QJ�����i�y����p\Z�2�\Z��t9�ױH+kC$bc��8�r��H����USh�p�F\":��8Ĕ~��=Sv���d�\"g�D������:�D瞬��4BX���,�<�* ���#��#�Y�~�\0-���1�\0S�G�0�A�h���S����0�\Z=C\0��d�E��6E�}�R��H�7Cnh�\Z�Ņ������2�/��j����ۇ=�Όي��a}Iػ�NOl@�c�V��x�\Z�)���,�����W�E{�D�҂�\0�\'\Z�W����co^[k�\"Z�vOa�W?8d\Z(�9���Ĥ�J�v;�\ZA=�g�¸�x��.��	�h+��<f��س�k�6�t�Eg�ҷMi�SJ=t+\n��o���Q��t���iG�d�x\Z����ʗ��\'�͡�v0��wh�\r�>�MPhq�tE%����[�O�G{�>�ϳ��� �����J�r �B~������:\\w��]�P�7\0�ޣ�D����ҁ�����Վ���=�m}�MI��jV�:o1}�\'/�TNÙ����x��̺W��g�M�)r�]g\nԸ�\0���<:Pc������w��u7����]$X\n���3��ю���Z�,t��:4�\'�\rFȰ&�� �e�J䊋�| v�����i�ICt�ںӞ�?��u2��Bm�mx��I���@9K��l(c�[�k���Zm��x��5w��D_یCy���\Z&���mpf �l\n�y�m���v�6�����8��-�D��ai��t!e51�iw\ri����G��~X3��\Z�v�BJ��1t�B�]�{jY[L��\r{���TlgH�I�Ύ��9uG#��S�}�I��Y�hmOm�-��b9��Qj����o����b����\0��M^>�g��j�)�\ng���9\\�[�nJ��^\Z7�����~�0��҉��-S�N[��٩���G�=2A�P��]�d�4�v�v\Zc��el3ډ�V?�N��9����s�$�E���f]�,6�B�6q��i���խ���ٛa����g�v�:����b�}�3��f�ޅ�.P�&�Kh<�p�i�N�v��f����a6����n#��~b�o	m��ӈB`W|��YjŹ�#�ʓ��^o���T�L\rγMGik���y��m��`�{��+���4K�Gs\nki�R�/������붵�a�k����koC��3��6�q���uX�<Q:��@\"pcۼ0(��z��:\0Zz�b�mOF�h��v�W����<���G׌u�X$ղ����:�=���:�̷�RA\\�Ol�}T5���/\0s9lK��R�����n�}[��}j0>\\-�֘\"�в�C�9�����k][��E�t��\"\0��=�8hݔ�	,��C�Z`�o6�����q��񫺜t���N��{��\"q:�=;�h}p/{Y�m����y�0�qۮ_g��A�Z��@\Z=O�Z�l����q�k�������ɠ���.�K����.o���\Z��Y�r�cq�Mg,���W��F����]Mw�	;y���/N�J����ɼ�y�p-do�@ig�S�?�,}�j�����,��YY\\\\kWZu}ֆ3��\Z��~o!���;�YM��+v�3�3Xd��Եsfh�Rg�wkCR�-X�-�b��^\'���ѶE�~]�/�tZ�\Z�V�\nWß���\'s>�k;����j���}sA^v��6\0\0����0��&�NW��$�q�1�l�<Cm�p�1�+�,}ki\rǣya��X.�aU�<Y1Zc�d�\Zk\ZO	,�R\r��ͳ˭�.��%���u�Wz���vd�-�.����tv�5�m\Z�9�sf#.6m�m���@��6�mfu8c��^+8�jJ�m:�w�����.�QoC�\r���[����fޱ-����1XxX�\0NS�8 +��\\�ƃ�(t��-�o��%>�63\n3س\'6���#���\0��I�E�������z��I�rX_� �4�{v{�8�]ߟՕEm�w��Q��n�^w�����45G��X�DG�IJc:�[��d ��$��P�[��.�0C��\\�}����G��|�tG\"6��[��C��m��co�ع\n��P�H`��`�������w��vg��}8��@7�*؎�M�І���6ެ!U� �s�6�0u���O��+��C�ѳ�����P�؜>�1�t���=\r7��K�;��XӶ����	f�pA��*�Th[��H�l�=G�&=�fо˰,t^Mf\n��l~�,��il�Ә5/�Ә?�|8#C�?b�+�W���M�~Q/`�,8���5���q�9���;v��AS����y�,}�,��=S�z��K &ȃAgz��\n��!�:�J�@5f�>w0|�1�[��q�����1b��>��0�k���׷:��6_�\0٥\Z�F�@O�\r���]��֭�2ݶ�B��g��-|�\'\Z\\��6`	�?rqC\0a�\"<��]�=O�8��#K|w���.öI�P���W�u���t\ng/�l�8�]g��r$��m�w�=0;\\{KG��6ބ���:�S����~۞����Tm뮸3L�e<*}[��3\n���Z�+1�2{��Y���}�o�u����~b��\0�2=�e���\"��HT/.뚈q�I��F�^���W/�|�Qc��H-ܸ�,���nu���E�l�[_��:��qF�Zwz�p�����֥�]�z���%#xG��VO��e_�X��������m H�6�啷�k\0�N�0x�޸NX}a��3�\n a�=�����Oȝ�p5k(o����Fˁ̤�y��.iTZ�j��Ӕ�i�U�\r�1�����K�ez��;��8M����Z!h�ܜ;�aH�;�+@��X�zg�`GX�B=��!�?���\\@؂\'�Äe��pdZ�Q�VTp�e��Fq^�S:\\���7�.e�u�}���\'�=�z�3<�p�����|�.\r�:&����aW5[�-C�+l�*΍[PS�-W����6X�AH�u�4�M$�����Wj7h\\��5_\0P�T���ȑvU@�l˄�ҋ֜X\"���*������+����\"�ݞ!�����ф����,�+#� �d��$�W��H�ߜrw����J4��8A@F��lտ�����W$��i�r�0KB�Y���o��%{\Zǌv�ր�\r�pP_+ʂ�;KRk^a�u��C#;��.Ŝ�&����H��WmOЗ���\"\'���7Q�������V�~��7�_.t����8�rN����Հ>�Y+�����R�`!��Z�s��f]�)���δ����AV����C�ӹE�hԦ$�l�ic�Tai��2~Y��Y�+�7�9m�6e�\Z(\rζWcs�W�����Gn$Tq��̎�����v\\��ɹ�^��IsZC��C�dv�]��UsҨ���5��Dw�b\r�U\rq\'��с:��b/�v�t��iB�z<A�DGB{R�2�<�����:(1�,hf3:�&�-�-�e}xZs��\n�R�$8@	��k6:��o5�\'uB_-��\r����)�B����RG��5�^:~wHU~mD\r��Vp6�d�?;0�;\0@�i�\\��6\0�Z G��mt߲��3T�Oi���ؔ�K�%/�@�:!²E�ֹ�ٛi����a�R��@F��꺦�펻�W=Ow�f0��X{�_t�@���ը�ǁ,����D�`op����5�5QiZ��Ƕ�@n�s6�s�tw}L������=Y�\nے�ѼU0�0�t������?�De�A�\'p�zK���1C\"��`�^�(~�W3�z$ᶧH���gĔ�I|qpM��\'�qV�61}\\����n�gK�p�x�����l�s�9#/U����:h�,����t�an�Mo�iw�1�$bٗ�U�J���6��>STm7k3�^ؠ��x�\rd�V��LO��+k���\rZ8���58��/4<Wvs�7\ZiQʶ�:�}�T��qW3��BBO�_���p�&{a9����q�q�u�M��!H�>�l�E�(~C�&:����<�\0���B�����~c�^<�Z��0�8i����,1L���a9a�Z��wdM5ݦ0^� �Lz�-����\r[|b*��b�H5@�M�l+������]��s��U�7h`�p�l��z�׮�i�,�G\n���1I�g���rl�A�g��\0;�(�ꯆd�h[�uF���y�$a6��N �Ih�`k8�%�2h��T�!+���V�<6�/f}�S�	�B�	����K������;hw��2�?N:�c[F	��5-�<\"P�c��\n�:�H\\fKR��h0�]���\Z���h���g�uXo���\"�~��x}Y�P�^�����w���_Q�*�8\"��+�S�F�^���\0�%]N˜�.ڣ���9lRvM���~՞�E�s�ͤ���kƳ�C��Ӵs��\r�ͷ�F�j��4k�sVVҚ����������6}�?0=���Î8��\Z���F].��.[_;�ŉ��	�,uK�lKG�j4ZW�۵�F\rv\\�Դ�1�PgJ^��Z�C̞�pי�rn�֋�eq��J�T�m��fy���ա�y9��%$�����z�h�ha@s{�遏7{�v{\\W����|������Ӻ1c��i�m]�Y���^p�8�ԹB��\"��W�$n�!��	v���N�)4XIz�jKk�]��u/��`y	��˲���/Ͻ���`�d���\Z�N���3�>1�W��>��	[�l� �^����vO�`#�gtG��V�v��^�MuW?`\"sԈ�䴮�h��W��~��\\���A�c8.�x^���n3��>C`S[΁� _=H����TP\0lP��UDz7G5���õ�u�Tm���������[,����(�1B]DmJhs�I��[{��Z��11,;C�����b�F\r��K����6����a�\n��߿�2ݰ���[�5����+uАi@�֪%��&�(6�t��`��i\\�q{�YM\Z�\ruӻڋ�̨��hv�B���J��9S� �Uj�6��n .��Y��p������Bb���\Z���t�%Ȟ�Ӛ8�z}Rî��� S������i�ð��I��Z���!�\n��\\FsW�b���g�n�ku�\Z_�Ms�L|�3-l��ǫȡO) ��v��2����c�-l�-�ny{lQꌰVk��=P6֒�.���k�GśL�`�h�P@�p^yn�75O�M��g�uՃuq��4 ����t�0��I�?~�k{\0�ӄB����ck2\"XgZv�+�P���]�/|�\Z\0^ov�\Z�Q��������NB$*8�ȃz�����x@&Ĵ݀�7.�ӽtg3\rX�\\��Qs�\Z�H��y �[s����õ\'�j\r��� \\��}o��wv��;h���ky�k�����G��Cqu�g�\"(Jp��6Ŷi��;��\0�ҡ��`?Z����b��N�H(�i�T���J̉�B��Aoܕy�٧��4{fϚ�ϗ>)RHoJ��^}֖�>�r��	V��g��e[P�����^���09Qc\r�ZMD�9�8���ӎ�]-Mt1\ZǠ��Z\0�^��qSC���eW;a3������ז{z\'Π���v���ϴ�������xy��)5�Ƭ7���uE!ls� tn?׬>���ds���Ju���[u��O�n@n��<X�E�ǌ�����[���l��^Ko(׵S\r����v�;��Fګ��E�\\����w˃������7\\N�#�h�޼��w1��v\'�����1�{�\'w��n��!��c6؆;{�\r\0!��Ąv@}p\Z��e{A��ŋ�h6Q��.���Rj�-���(v��y\'��E�\"�2G^���no��zǯ��z\'L�`���yFp�EwO[�2$��pA@g!�h�e�5�a8g�u�$�d��������,^!k��$�v\\�?v�L��\'~KY�@6&Qv9]��y�g7��F6�n�i�;H].Њ:+#�;+�q]\Z��A�D�e�Q��L:�T}ݐ��o�M��.1:��BZf��:�ҙ�\r�b�*:\\�3�06X�ʼ�Px,Y��.NmS&�tF[wh�Ӻ��G���>=T�Ig}���>�Z���\Z͎��Av�s?_,�P��֥�8�\"����1�����&Mkyp[�&`��)�^}��֣�14����6{����1It�:Ζ��ѲV�`��UzN,�c��mdK�_��t�P;`�`�j�`�׫���EܝW�39A�u�`�S�Fn]�\\_Y0���&G��U��QR N_P���8.1�C�\\V���`&OT!�a&2C.�q�ܒr��~Day�\\�xsZ|��#.T4�MbR�J�L���ZEn��b���L�ʤ�(q�~�q6�^�����\Zt���PLq�ч{Y;��3�:KG��G{ a�G�-{�T���؛�%\'����\'Q/3��T�n�.��} w��{d�20��ayW�B��o��\'a��t����\n��.��$R�7����h�q��$8l6�w!�m��VR�<�`>*C\Z�+4����W�y�n9���n��q���\nI@�R�n��*0�<��6&I�_v3m�\Z2Z��������0K���؞4S@,μYQ#��*��WW vs�%�|P!,e��{�uK�J�U��fI�=��\'�n�,PC�S��E��-��ޥ��&A��n�Sp���K��S��]\n2��=�eR���Nh�oH��O���t(hc��M�g5T\n>t��N�\"!��fKy�����i�Ͷ��v������L�h�mo�N{�:����b\rh��g��EB��x�ݟ���2�5g���1;n�\Z�AxRǎ�c�y6M�P��צ��z3k6v��c�����@vo����>u�nJ���G\r3彣v��Y���3&��k�@m�\Z\\��YodR��>���t����݀\ry_{j �1~ӫw\Z�NW�y��@랶Xw�\Z��ːp�������x�枹�z5_���oj<Bq��yԺ?ϣ�ϲ�gF9�����h�J�����b�[�1�q�9��6���l���hA����V�V�X M̥q@PGP�jz�ˈ��8���jPF���ؖ���>èt�&.j��NMj�1J�l�+��m[�LF���7�vp8����j7���|��\Zh�\r��������13�1bM5֗�r�z3�ٔb5z�FØ���>.\0����DLn�؊��t��kh��F��n�}N��{{�<���X��y��/�t��\0��٭���U(�9ݵ��	@�n=蔥ޮ�.:F��v������鑱�\0���}jn� a�)����@Mq\0�zm\Z���\nS}8�L���ed3@�4ü�\rdg�I�l�Tw��hF\0����1w�[D�i�N�x�H�GeW�j�żN���Y�%�ƸW��iw�b�[�΁�ugL���*���d;�4J�1��(u��t�]��^��^߮��K�b<e����j1n��S�7��Ά\0\n�.k�9�zM�`�gk\n+)�ɶ�Ζw�?�#�6`H� `W���i-���y�9�c��\"Z\'E�\\�D�0���9)��i��L�6$���z-vFڌ��1�\0�m.�6�����6>�FZ���k��Y!�~˜3�>бƜ���!��i�q�mb�6��B�{���X���*���m O<ux��B�.�$��M�\n���ꭽ-48�gر�R�l��iq0�a�C\Z�ڠ5� ���5��H�aFҨ�y*K4��o���֚2&�����;҆�� Ρ����ʟ;|S)+/\0��uG��-��\ryB|�7R��򄌚-�ij��)9�&�\'o�=\"����騭N��Ӧyn	��h�`�p�����#N1�u\Zm��λ��3����3��wvV��r�������y�t��S�V:1���<9�fWmf�9��pqs��C_i$<��6�Mpt��L@HAf|��\\t� bIǍ9��@��ܱSm�0к�Yd�?ѐU���k��.��@��\rs��c�mXݣ�\'��	����/��z0���^�K�	3�H��Ņ�����ל��8�tiY\'�X#�J�ۊݜ��#zMr������q�Lq0��.)k&��m{��LXC	�_�6|h�;����+�\n��PF\0�~BO�fSCd�>�Y\n;��r��H댳���v����v��1P殼����	!%�\rl���|m�wg�9\0]\r;l,�2��td@�f����3\'��3�*њ:̑5����haj�\'������6w�����+���fǟ�2��7W-��N�����r�Us�7N͓5�Z+u<8!�֯Qm��/�m�����\'kH�x�)/.�=��yC9��Z��M����ĝi�0VM�/���T��v�9� z2m*j�ĩ#~�5�Ӌ\'�O��@Bz��2�Z21��|�\Zj<W3��h�:�s���ƉҴM�>��7}Gi��S���m���Ⱥ\nc�����U�ȲG�	fz@w��Fk�&�|@ۙI*#�䮳4	�^��ܐh U��3`,�u�G׻�д��^Z������VkD��Do�!�#��gj��|N�L��j[{e$\0̑�-6�Z�+�b�(���:ȝȓ��WuJ�t������\"�˓�Ե�z:��E㲶� ��Q������zM��3y!���۰���@�z�\\�(z���Z���|���E0�Mg�Oc�?mN����ꕑ�麌�?P;k���J�,W2��\r:]��D?m:(mZ��Z�f�C�K�:n����5ʁ��t�Lg-��g*�����d���Y�3�\\� �b}��&S_@Tv�_�����`�nX��XRt��J8\'dw��#n/,�Rw0���������8��}��ޮ�����M��ncZ��]�h�6�+�f��;[`�����vg��q/;�3��Ct\'��vb/��0����ѣ����3aB�#�;��9NxEB���?/ׇ6���fF�2�}�[p�ZW�\\Q�(1�O�=bW������R8��eꗷ8l�g�o�f����Β�R	����\n��%~�RXؑ\"�W��\n\n��}���~v��F-�\"BCE�\n�5$����^��jϙk�^o&������ϩw�\\�ϾW�z;��3|��^ţ�|��4��>|�vYߚ�\"���\\E�<�p��+ߏ��³l<���\Z�*Z|6�em6w�����z6��m�:G^][e}xV�_�=�2�\Z<���!q�<z��B4��YW3����p:j��&����겉�d���� ��9��S4\r�GC�nӇ�5U�᫊��t���\\��u��]p�3��м3�7(�/�N�[���bWAj��\'����u�����`ĪkK�W=�(�ފ<K��ݚ�l��.��;^�]�%�I�ŵ�l��3�W��-��ٓ=A����Tn�m��OO���]��v��t8�\\�7�����wic�!�+tL5ֿ�U�;��Ɣ��͋>d��y��gq%�\"mMZث��`�?;|A�񀺗�l1%�U�b#^��\Zt���	b<���-b:m_�ܳMiB��z��17��]�5�ϚZ�k��T�q[�\Z���Hl��<��*-����;�zgK�y�XS�63�{s��]�Lz���9}w�v��zoX~��p�a��-?�B����6�F��e�۹�Qh����A?���v��y����b2�:��u��F�g�`#66�s�v�_��o�Å=�K��	�t)lf3����w�@�����0����T8�`9��u�t݅��Z��Z*�`(}%(KQz�^{���ݙ]P;�G�|��)�\n���I��!`�F�1-��Q:��l̴�gu-˵�]_�KP��Xn�t[-��cf�ϸ�Q��/�:��}spƬ�B0g.sm��q���0�gȃA�9�Z���˳�m�6��p3\\L�0y(�V�~0=�<����k�����6m�m�����\Z?�׺����l�f�I��mEB�q�Y��g�6�#}����Co4\\��K[����hl�`��u���e�vG3�R�Z���8)����j�w�6s�9�}�	�;�قh�^x�m�\\c���,_x�@�L���~y�t������9����ݥO�=��7���_�I\n;�����H1�|\"�h@�=v5k��g8��f��b:cm���/�G�܅i�	I�}R ���pw>3m�+�h)��J_�;���\Z�ĩ�e�Yee���b靛ǋ0�{W�$}�������D��5�`8�,R.:O�I��ە?�+�����߶��z�p�C��#��L���hsgky%O}���KTqɅ���#�ȉ{�ܜ[�����\\\ry��	�ۇ��fOS�UA!��jH�ʎ�[3��G$u^1�+A[3��y���y�m��Q�\Z�5\r;!�	�A^i\0��>pjB�>�ԜZo6�OG��\"|YL�V�55B3\0�Gl\0dL2C�]X-���V@�\r�pg������^[��)MN���E\'2�3�Մ�f[��c��ڶ�lB��ϵfp�0�Z\r�&�_q�5WW�o�!����(�\Z/�����Da�u�N��xmxv��zs	�)G��A�͍��i�9��5�R�N��{`t�Eɘ����@@�-�CƧ}l�娫H뭃6�wV]� ��>����8X��+�:^Az�\'r�@�ϐ&��I��*n\\q\0)�DO�鍰ڕ��p����xj��*�ꃎ��+����a7���I��l�@�ɘΜ�[*�]o�\n�̋��W���m��K�狭��{L��y\\��ӣ�|�V�Q^���=�1����q�	~p:��Y���w!$r��(s�:�&޿4܉;g}�[w�cc�9���o�>!�\"inX����@�����A�����c�MN��fL\n���g���,^�^����.�������X�m�+e������U�-Q=��S�Q��!�Ϊ�/G]wv5��.V�TEkۋy�4��EE��\0f&�s��rK���	�nj\\�v�?��5�l��E�; �@ɗ���Nʛx��~�s�N�0*鲁IX\r98��iՖ�vG����q�d�1;�%���(pj+��J\r��L�%�:��+]V�p>\\4h���}����Lc\Zt�Kи�̩���D_�i *�5�<g�ɍD-<\r�o�nk���Z05�����k���݀�h1��\rՠV�e�/��UhN��n��`o�Mq;�H��3�9�@[ӥ8�Ri=�.+\Z�ј���鮇�Y��܀%��BR\0QڭW+��\\�c{��xPfQ�m�kϟ�{}1Ӑ�L:�ˬ����t@��q�����PS��I7az��ˢ{3���\0|���\"J-�����<t�٩g/��QZ�S��\0m��\rt�Q���m�7�Q��N����\\�[�J�9��+g������2I�Lۛ���F+_�������㓍F�����.�j�\"lD\Z���,v����X�ՐM��:JdUyL�M�V��5J���P��R\"{�I1iAx�`��L	\\V��)SG	�`���6qԚ��CP�V=��|�\rx�[\'.��Z-��qh�jw˫t����a&[���2�EzC\\mQ��}�����n�p`$.��N�N��\\My6cn���Q�lEOAa�8�����Z��T :t�\r�XҢ�!�~0�p�?�]�=:�\'�uv�fC�$�0p�����y]>xMc7\Z:��uEc��\r�?���!�\Z9ۣ�؜u��%��a�Ȁ1��@G��4��A�I�	���\n~ ��dlO�:��.�#Ѣj���*����Ӱ��8Х��\n��$��ؖ-8�?�µ�4�ق�,�=�g��b}mT\'��mv��j/i�A����\'��<�k�7-���ꂯ`e��Qn4S�UM��g�Q4j��jjw��`��\\ j	�+��mA�W��=�$����^�\\m�K�֕�\Z\\�LȎ�lX�>8����a��\ri~?\Z!���Z���Ԁͬh���Fy;ϗ@�w�\ZX�������G�����35����`z�N �-�׌�ч��o�8h	g�a�0�.��\Z����zG��~c�\0���6�^�����j��; �3ǔ7�%q���cC�=��Pm��,;fV��@���o%�,蛕��lne�����y�7RW]�`Z�qS�<��r|nq1��p�`�탍�b��:	�|XNi˽^V���Z�kb\n��K�&�H���mw�p�آ0!�ǎ�����j���c�6\'/[TU��Y��*�Y\"����5��\Z�����\0l�����á.�.K����v�����+���ز��\Z�&�9sЙ�#�$\\�w:�^m�kCOR�~X�Kˣ�k;���I/����Z��\0�Z��lOF�]�U����Cb��޴&qn_\n���v��ܥ�y�=4!�/���-Ϫ�iR�^�]O�h���յ�A��=����O���@���ˊ�Ef�\\�ĉ2��Z���}��:v�s8�ˮ�����A�>|X`�Eh4W�Ӹ\"̷��`rw�Q������M=f�\\�&�>O�����x��T�N\Z�-�?�j(�c�e�F����d���<���V�f���\\ �os�C=u��t��,�qO���8Z�@��t=k�j[��?���9?�� �O����u�m� &P�@f���|�+�v��MCc\0kŞϫf�!��i�;�V]�_v��F���YZ��^���S�2�L�CF�X��y:&g�4ơå)�����y3��)�Юu��=j>�3/s���m��2-��A�	�I_�v��#���\'X�\"Fmt�{BO�\rڗ��;t�Z����>	K�׿��^�����-��p΀����+�:��۝�c��fg�[�4����ePR�I���Ss(\0|��]�szͬ����~%Ʋ˪C������b�C�d	�٭oa|EA[�V0:8y�N�Q��y\n���fu��]k�-�{��O@o���\0]�F�6����d_�$�:�\Z�\r���\"N0`�ͱAo힛\'g;0<iS;��ީ���V5�Zr�3�و/m�ֽG�wM,J�W��M�0?�b���w{�Ț24���I����墸���} �dȨ�\rh&�3���^�`�[Q���g��O����1�*%w�Y�[ES�*�LY��;qO�����G���3����t��H��2&e��<�ES\ZS��3������� n�,��T�q0J(�%��hfTA� ���a�FֈRO(=r��n&�jP)�m,���^&I�S��P���@h�,wlj�Z�aD�nz$J�>�:���~k��jf��U-T������ٶ>	�f����r%��x1el�_��zL��+%M��m}e�����\Z��Y5��.�#?���%�ig���eq������W�@�|a�d�%�V����J�/�)+\nU��/C*��������{�L���ӓ��5�s�Eqf�Gr�[�zCp*�[�R�8\n��N�Ys�[rDi��bn2Y��\"<�z���C~��L��Cyy(�e�ߣ���ɹ��b����J�����<P��d���Y�&��J��?k6\n�|�%.tx�X� �����̆O@e�	T�-���$M��-eQ��<���0YC��~�B��i�9�l��NuK����(��#�y.��K}~��Eǲ����<����yL.$��;�k��_޾�fzy��ÿ�_����\\[��+���݌ݿr)��	��W\0�}�A��l9a\n�$H���A\0�ˏ$����L��%�2�\'�͟8��t�%d-�r<.��M�MM�|�޿�w����\Z���XD嚽S��>�H)������V����Q%<�6T�����`/I[Qb�̾g�*�NQҫ0�D��*�^����Tvg�\\�ڇ��q����Vݷ4X�|/�A���刎��Sig]<횛�f�ԂK-�hS���{Q��sE\Z�$H���˔�D1��\0�ݷ\n���c�W���09C�\'��J�����b��l��t�`��[���Y�?m&�<I,�B��R:�bM����f:���d=�D��^��aF�ˎP9m\"�M\\���I6L�����K����q�}r���`)�劧�Q\"w2�jE>�r2�nF�U��rQ�*��li��H1u?�}��Di�\rr�\0�@���Q�����a��cS�1�\\Bn<�0�$Mv�0��Tx�;:�S:��GxE_�\0�����g��h��b0�/���TQ�J%�@Z/T������G�,�v���t�������~C�9�l�z���g��Z��,=�_���a�P>�|�0F.�UG����<	�6,�S�uę���\rӎ�\n��b�D0b0a���Gۖ!�YP�jo�RM�(lF�f^�{Gy㾆xD��D�<\nt���`����D<��cɚ.��?�P(�Ax�.�޸_W�~���,|>G\"��<#�������(�?Q�}~\n�e� }1�#s@9mJZ�PN����?_��r��<��DF\0.��>���\'�S\0�K�D��ǯt�m^���d�<��]��O���\n��1e����\\�qB\"$�e��^�*s�~t3�1��MJ\rS���M�X�|��%J��)i9�\\�6�q:9`�로�S7�pNJ��\n?7�2᫐�&W)�6��\"�%GJ���+���^�.��I��J4�i�R�v5Q2�SICy]��B0+e<��qh�7�W�QU;��;S�Ȝ��d*G�:-��\Z����~w%�G[M6m%T5�*U�쭟�_��4��y�cn��R�X4x�j_��s�����UJ�l����-���\nQ~��A�,����%�yʅ�����\"Y�1��r,��8�I��Y\r]ɐ\'��`��g@�M(�g�\0M�<Γ\':��̅CE�5�0�w�(�G%B⤆���hH��7J@c�� b�(�%@��\"pBw-�D���<��_�J�5�� �r�@��pbJx^��V_�)�5x2m��$353����=���p��O\\nT�\\���xR����bu�\'��D��d?���=�e�{�>ゅV�L3bt�\'�+�����b)Qa}2��|���h�h�fnFHh�s�	p�t{o��fؖ�q��G���G��P>����K�5,��\Z���M�\'3�I�Y^�ŹP��$��$H��~��y�>V�}	��Ԕ�fЯ�R�<��)\'�(5�fZ�[�WW��9�t��W�!�_:�u�뗀r^f~f�7Ӂs���-�ݏ�ew|�*���~JNx2�DuA��@h��V ܠH(޶�ư�lY^nFf����J�Y����Pbt����J�NIu��z��1�_�[�?08��l5أ�Ѧ$�r��y���,������&~��XF��M��Ƚ .8��5h*\'E����|�4ާ��d��9s�L)�7�Pn��`��E���Ms�қe�̷��Q�`�h���*�u��i�3!�?�/�)���=LfIz�`��YK�Ǩ�4����>�s*w����&�_�����@�R`�Q���E��s��:��L�p�F���f��\0��g�	��J�fz(%���Փܴi���������4�w.Lٳ�u�Ki8 �^2*����������Q�_\'�KZ~]���t�\"��J���aر��H{���u9\ZҠ�BK�[�\r�XΥ=����������u[gdl���u�M+Rtysؐ��N���h������p��Q\ZA_l�����PO�2�hA�->����\r[����@�\r��h8��85�G\Zp�,p��.��t��w�(�No��ٳ)���#Sc2�Ybg�5�$�\"<0���h^��<���������`�����B��Z���\\z��C���x��lۛ�f�;�k��պ\Z��/�f�P�C4��Q���b�C�Ij3��J�T��#�Ӳ�^��X���cB��jzXU\n?v�I\0��o/NA�+//h9ۮ6�`,~u>\nW;�q��hp4�7/\\87Ɲ��;q�|�:߰c\Z��Ε���G-�	\Z�7n�X\\�;�������,�OH�F5<����.vN�Szx.v�EG��?�34���u���V�Ul3m�)xz��Ex���]1@0\'<�t�q��9�k7��#��	��P�RG����q Ŏ�ʍ~S=�+�v5mF��v�q�Q��*o���\"�7�\Z�P�[��ak���te�ѵ�v�9��5b��x�TfD/��B{�������M������\r��T3�����{�Й�<�k�?��h����.*�^���4O�y#ģ�M���D�v��p 	w�W�\nj���&����5ړg���Ő�P��C�\r,�#�F��!Fb|a�дꓓz����B�@�T_��4�9d&+�̬>��c���W�l�6�z�7py}��`�D��6�:\' JPզ�Q�y��N�7�3�!��-���Ǘn�4$�M�:���Z3�>j�L_*|m��u�Wvg������lhw����!AX+[x+Z�]ڣ%��sk�	�0~�y4���I]��[�v�ړӶH�5���}�/N��۫gh�86��}G,�%�S�,n6{�����W�QԓL@J�0n�Ϧ�|��\'�y�]{آ{^2�������@g-T!gkp�������lh.p�\"����M]55��2&�\\Ad�I):7��c�I�V&��?j�\rMg\\b�]P�\n�3#�<^ )�M{�c�5�����,�6�$�O[Jg�� �̴�4`n�5�N���1��Cg9Bzm�J�Ԩw��n\'����� Ф#A����x�<`=�|gz��V�\0u��l;���k��1�׹�~��o��	�P&�tC�&ML�;���%n�/�E�R�?��JT\n���R���O)�_\n@ A�T�d��ĝ��i�5$|��\":g���ioCXŚkVo�MᓬO�B��n�;|GZ��y��{¾�8x�b�0B�\\&~Gb���u6Ȫ��=��\rFMz�6��~-w��\Z���j<\\��E����^۪0��.�?�G�5x�\Z7�ĝ�l1�����X�׮��P�U��k�zF�5�q6\0v�E/K\Z�n����i	w����e�#�Ys˞���cX��3]7<Sj���9\\�zݰ�=�t��O�=�c����ly^t�.�\"��H��P{xT\r��jy�`�x����O@^8�z57��ԟu�<�g$�f��x�G�M���.��b3��_���W��p���G�0�5a$+��H-i��L��I��l��nr�͌���u��в1\r��i5�Ƴ,8�4�!�\0����f�x���Ս�����v֜}\n���¹�Ն�&ٲ[���b�yY��\'>S6�_Y��S��\Zl~��G\Za�W̎hn ��6/r��1C����>�\\�v��nL�pL{�h,�S�З��L@��l|#`�BwۅNc��#����=}f���E��s�f��y:��n��:\\L�Q ���\r^0�#0XG�~�۶3�����\r+܄�х[�\0�j\'\Z������I�hNy��T\r�O`�6ug�f�`S�x\\µ\\��F�[�[\0�ݑ!X�!��F	���#z��m��i��n��ٜ�L���\'Z\0���3[̨\r�:���[��̮���������D�Si��noB�5��N`�:��^�=�_�\0�=SK�鈄 X�IY�Y��5$E�-V[G�j7-��c�Y}��hy\\��;�%��j��:&?�`�`ml�;r~��!�`4�ot�̨|z�2}���My(��Z�}m������N�\n�>���b����ǩho�SNS�F����?�F�������6p��/�Ũ�j_;M�>g�_:M��?�S�:��ќ�F�v1�/[�}������N:Uf4��!��:���gTp�j#m�D�e�5Qܳ�@gKd��5�4�3\Z�\r���X�hw҆�퍡Al��Wm�x`Fq������X�Iƞ�$x����_uR��D@��3,NW�����(B�8b�O&�7d}1�<��bd����E\\mG�Z`��h1|�4��D�P��ޢ�j���w���w�\nC�KS�t��v��#�P\07�_���mb��Vc|����|=|6��6ђkuG1����^tx?�|�j��nc�<��	睯\\�r�a���ݴ��l��y\'�7m���yG�e0LWL���y��5��w�\rt[+GX`-X �����ݕןn�7���)qi���7�bM2t*�O��nK��ݬ3\\���z:Z-X�Z>*u��qZ�\\菽^�Q)��g2u�!�R|����#�M��\'�I�*�JW���\r^�0�ό�r��G���Љ�4|�4�3����a_�n�G]I�oZ]���=���#_G2�P4�.�N�.�򚚪�0������gNR����rJ�`��7�{z��[����^�\Zҝ�Z��򗷠������ ���n;�yx�SBx/��y�SBMr-G��\'!��Z���8W���{�-@�d��2e��Cl	��D���t��4������C��Y)�ŴZ������p�tgJ���\r�g���M_\"���xG�𥲷�}�����\r���ӻ�f���~{�i����j�m�T���M/*���=uq��SX���G:*M�\ZM���e���nΖt_kƒj��I�ڦ\r��UW���т��驩SMe����zmZ�Mmj����O��A�n�Y�n��O�0���������f�/���y�vb�\\�2�颎�+>�,̕�+\"R�\r5\n8P�/@	�\"���gZ �2��UP�Vp �����[q�2OL+�]��/�aI5MGQ|9�$��L�#����9�݂$��_n��&��Oi��a6�.���[2��nC�5q���qr�T����{�eC �v\n�\"?DK8Fv�n�c�	�.�b��|��t����#�U>����?�gϢX��)��W2o8շ�]��`��Y������ٝL�^��3m�HȲJ)ח�E�W�<I�p�����Z�����{7��)9?TȽ�l�j�*&k�w����,�N	�J�L^$�B��<i��kzF;�#nq�sN�/6�-^���l#P��I\ZX�\\�{�x�*�ˮ��s�T��,�O�Hp>�(gb��+��J�\">�\'��ĴASс�ϥ�9�6Ua��\'�Z>�ܳ��h,�\ZdUĊ���㸜�?��Vb���rHG�(:�ҟ�W��R;ӑ/��LpK!�[��x�SX(y~��m����W�\n�{�r�`�n���:Y��\0K��G>$jiß�q���X�j5�9�(<?���ek�01���A(���=�cí\n:H%��e�>�R\Z%�� ����]2#� ]A��SN�]/��@��ynۄ,�_����V-��\nC\rF^E���Tr=�1�!5�\n����\\��1{Q�e)�b���(�_��K�I�.��5\0�Q)�ܶ[���x��1�E�\'\0�|��+���t�!�\0qJ�/U,{:*�+�7�r��\nǈ�p��$7�.���ҵ��|�ݭ*gG���.�*?��[qe�l��������71��=^֥s٦VH��%`�99:Pz@M��V��&� 2uE���&[�D-��j����-�n��g�@E�u��\Z�\Zi*����V�E��\"#t�����f�bIo�n���J�ߦ�r�9\'�xv1xK�8/�ڑ��jx�F�Q�����;�h������+9Z:F��J�RR��2��#1�C3EM�G�[����$h�s$�Yެ[��ҧqt��lzd�J���s;(%:��T�f�֬h7�y�x�z$�Ù�9h�[>p�J��Z��2R8���c&��?\"v�	j}�V��c�g1.(�J�s�C��io�:L!����7�S���#�<,�b����������-�S�1̣t.�J�X� �Px�����j$�(K�V��\'Q���q�3�2��n�%N�g\0�|PO㞽#��I�ٕ��xW��(.�G0��MI�uW<��������>��1l��kH� j��6\rJ�������s��dY~��f�)4����t�?�t���\0�8*`>�$�f2Grȯ�QB�O\'6�h�]���E�Lil|�s�$E�S�	��$�+����X��\\�ƾqAZء����z��6�ѩ�\Zv;���4ax�eg����Y̵��I�=��To�9���7q l��������Τ}f��r���u]s�d�64��\\��Y�\'Z�����j�:Fw������#kP�o��d����Z�{��V����x�H�9Aӡ�-�C\n�U�N��}�rI���>�|O�CuT�W9N)\'�xi��ɚ/�O��m�JЄb��핇��ş.2��m8���\Z�b�B\n�Fr�*O�^B�=���QN��%�rKo:R���`���<�9��\0��=�j�|�HVHF�|�Ò۷>�J��<������D�O��=n�`{�8��i3��M�W��$Q��������@�&�gF������ݘ��Z�\'蔡K�>�[�~O�\Z3˶�^xr�u��2n�̥\'*P�~/��y�J�JY�+Q���#�}�și�J)�(̀\"]J{�0�O�E���W���_s�j%*��O.93H�x!����JRf�e֐�&z�)��������,�I�[�;��Ƿ[�r\rz%�O��CM)\"s��G;}�����Ƌ�o�i�1�кg�-�M[���Ce&�z)�e�{}��eZ(/Y��bØ�l���$K��l��Um\'\Z�\'UJZKu�03^j�ܬ#;_^����ʭ9�#�1����~����������te�qS�3s\0x�Z�����~f����m�崘�2�0�j5˖G	ɼ�� !����Ʃ~��,�X�m?�>� J��JKf^EOe��=q��&��»��pJ�i�le�4����Y�0�Ur��F�Z��@��ԍ,hdE�,Jh\nT��+6��K	�d\'�,Y�	��z����Xe\Z��TW7�S���!,��.+�slB�c�Cw�?_D���]ѓ9��/O�O�ݳ)��{~$�-�.�_X,Y��@��\"Vz���idJ�K%� Q	�\"��S��/�B?͹r[7~����ٮ�O�gB�\0��M%7\\Y�fq=AɈ�����t��s��	\0��r;��+�d��7��7���TWͶ����&ȰNyC����JJV�����t��?�vHD��7�Cm�6����m��:�?s���u�Lw3�)�����s��.����-5����z�]��=l}\n�:���𪶇�%���Z�����{��t��sy�q������q��xs:^�η�6�v��\'��vv	��o�2�u��vm��f�61�ư�^����o�&Ew%����O�Q�� ��늼(��UJ�����\'u����&���}�L�M�:�>�<^�Vy*�ّ%6�)�{�\\�H���������K��O}���������_�����T�7���j����0��U�n�d�F�>�\rX��+�]��6�ϗ�)ΊR�×�抔��(���\\�S�n���2���i��3�U`���D!�rÙ{��P�x��{Ao���to��A�@�P�L㋔\Z�d\'L8�h����9�ݒ�~\r��L���`D�<�֕9�L�/�QЯ4�\"�7\0�JX�>;K?P���r����/�T�{|��j�㺴r�4*�>�\r�i���][^�q��h|0yݟ�����>����O�wx�� ��K��b|PNo�E�V���9�����*�E�joe�o���b::|����%�E��7.�D�1��<�^B�����z�\"I�8��L��z�N���K_���-���1�h(c�`���T86��h���Y�t�<��C�X���%�{R�r8S��*K\rL����/�<d�e�o���TVI2���>���/e5o6�Oj�������MY�ue�f�WV��u�Ie;T��T9�ɗ��GUYs*F�A�SR�TJ��!8��z�+����u����8G.�6��j$c�P��@�{ڊ�9���<��$�Ԓ�>���$���e7(\"�|\rNN������_{j +j~�\Z�a4�R6c�,ʰ�=��,A2�s��(�<ΕM�3��t�����+�}���(_�D�T��=;QX\0��P�λL�}@��?=��)8����	��Nv��dzٞy��Yl��5hE���&���É,��G�P�<b�l�[��*�\'�G��L�\\���s�s?���j�@i�g�J�����P��<����Kmec?�췋�Uf�U+�֛X��i����ɪ(��&��j�^Il��>��\Z2VB�b���޾���ȿ��<n.�G	�([E�x6�7M޹�)f_��zл��s�U��P+�!��%���O��3.8��ErGw�#���K7Z�X+��W]j�#xj�7�G��h�����u��j�;��\'ڋXTН��w��U�{U�J���(���L��)�R�[U���*���@�`�{a��J����I*��@���<\Z�Î+��o��D����RF�H컟��K���&q!z�������S����~�hRB�ς�\r݊^��|�! �jp��y�ޟ�#tދ�m��w�V*Ŧ�h��\n�E{��*�-�w)p��zh��{���0����cu4���)��w������w�+`�η@�*�����*�P�*�-w%�-p*�X�9-��$f=�(���R!���u��0:Ed����e��T�=p,2���)���C����3��;��\Z��a�N��d*~	�]���/�^DRS)�CW.B��ӍE��_7�dܾ0dH��A��蛄M�YP9?��N�^�������]:��y	J3�R+���*��9�L4�H>M��CT-�>G�to�\\��i󼙌A&T4���v1�i����E����Zҵ׮�~e�nF!�ڣ�crQ���Tt����Ξb�M��s�)����cW�����0���t\0�z;��8���.�a&�O��Z���c�I\\=�`�-}�O4x�=tS\\�0R�~�W7e�\Z����l#�8i*�4iP�j��f�O�Ƴ�w��G�C�y�D�q�����nh�\'x8e\Z&��k�n�^$��\'��Ȼ7d��l�t��TD#�4A$�0��.<�F�a�~�YX9V����s$�]3���B����K��/��yds�Z���������q���e�,A5���/I�ܣ�8�{(��o��䟸��V�|�ha�D�F��d�Év.��*�;�q�+䂐)EGʷ���d/hw�9W�������(=�?\"�I��0��\0w��̞`�o?>���\Z_����7���pއ�G\0�?@�Ǹ�ZM����Zci�k�p�\n�s���Wp�mMp� e�`�|\0ܗ��(:Y��+y�X~%/�����R�(R�\"Y�e�V5/ђ��Z�*Y�%o�E[���tKIX^%Y�ɛ��ǌ{��\"S��;���!�~���S ?~mG+��f�������9�?	��ij����3JU�Ac����{�L0������l��gT,���(���3�,4�I-���f8���)�C��\'�s��Z��$�i�,�_	E�fޝ.�˟�y��ob ;�Z��p{�ņh�=6�^ ��Jܽ[�K�������=�:��\"Hjp�4Xx�3��Uw?�OU0J^��~��	��29��8��Gn����2����c��K�^޴��%jb@q+��7��p����z��\\?{��kQ�3�:7~�Ҳ�^�k;�p��ܲ��xե���u+��ϴ\\�G{�	����C\n�=�V\r}�F�g�܀\'�Z�#�a�1����,�0�H8%����/�\Z�\\�/d��X\0F���Z&Ŕ�.���_P��4�E�F��q�J�\\SQ��ɑ~(࢏9�n#K�Da^V ��*�$<J�5�8d��g\Z�z�\0>�>�1�Jb��0��X��6GJ��&wҔ�t�[��L�|��ۼ	���o����������4Էo�؃eY_���rc*�}��[�&Q|3u��~�>��`�F5S����а:�\"�g����_!D>4d�i�Y*UY�{4��M \n�x+	�\n��͊!U����}��r�*G�_X�tqf/;�����3;B^�c���!}����|�mAE�*�t����&��j�����_�\"3�X󛍜�g�O�*��R2��V����A��\rn��[.#0߱��E�9�]��q�/.^�MĿJO��4D�s6��w����5t;\nT��gդE~��~�%��_�\\>��QP����н�AZ���ߥ�_ï��+=���s��\nῊ�K�A��A.B���U���\Z���+�4�7?K�\ne�i��s�v�e�Я#Rmکj������r�f;�-X�9DJ���i���tso%��_��^YO�{� ���Ā!@��e��F��ؕ�(�.�U�p(H}ى�����9ҽȇ7{���?�.���	�����nEU�\r>CC:ۜ)�f[�m_��W#;��\nf/����+]�#�,_bwS�$�w1���N尕��(���o�A�x\\}�|\n������N�jj�?����a\n�O6��P���y���Rޟҫ<q�n�|u��ݲ�J\'�K��/1��gї5�#�R>����ٞr�O��_�)=9�}���,0��eY~b�+gjF��+��[pdxU��X��Z\\�+mUw��g|��gt����{����o�\"?���/O�o�����e*�;��*�2*��F<l�ɍ��0��}���\'J���ו�������������NaV^ ��fz�`��\\d����Ӹ���_�ޗ�zX&���º!��i���ӕo���Md��j�Z4�v#�,^>�^0����@�\\zՌ��/u�&n?�V��O�xS7%�5i(+6n�T�G��E����C�e�-?`�<��\0�>;^J����<ů6��UcP�xZ�D�_pSȒ�<�S������f��\rž��{�<��d�DF��W��<�bڿ&7�I78/�^�*���KI��*�RQ�,o��h�g}�_������/�2�\n�\'�\\S9�q\0c]m\"�&���ȗ��%��&�/=KQt��@��c�IJn���k���@�����6<pih���J�FgO���Y��ș_B�oO��?����<�\nyj�*����E�b�Īב��\rPz�H�&��������N���X%鍪���-@�A�P졡���h^�{��I��kyN����Bi�\'V���v����Fn�ڨ��$��-Ig�/$���]{ދ���0	K̓�/�ǴV\r<���<t�/���n�2Y�y��T���\'Dz1��R�N�?��L��*��#�+�^�V�W^��-�M.&]-Dt��\'��BZȁ�E��<r�=�sk��i���p��Vq���\"ܗ����\n+�?	�l����I����i���twI���K�8r��Z�\'=��;q�e\0(�����o�˙�3�?��p����@e������?��$�9od��T)�\r�MrV�;z!K�9�`oE��e�Q[�r���+K�HB���ư˷��3���==�To����b���ޮ7\'�I�K(4Ñ�`2c�)��ء��I��涅q���ï������/��2ӚM�%Jd��aф�8���Q�N�l�ٞ��ކZ�+�]V��!p����)�ڵީ���1����\Zw��5����a���w��t������1�[�\Z6��jp��9��4����5���ꐭ\r%�#؍�4�~H���/�7������\n�}����xb�����^�q[z�kI5� w���Z�<\"�Z�vV{A����]5�u�i��1�������%{�-.�w(��u@Ω��u�{̰��3܎��U�M�\Z]�ۧeC�b�i�j;�jΆ��R�4F���ť��mf�����_����&�9�\Z��\n.\\�Դc]>���:��[��f!�3����\Z��[4ן�$y�F�oj�u��>�7���B�{p�$��X.Xh6�UIr�G��t����W�͢�,��?��\"�4)/�I��V	hY�I˶�k6^�c�R����N�Pi\n��9�ǒ\0/���d�Tb����J�7Mr��s����q �<��x�|:j�{��R��u���s}�G�(3��?*0/�*�0�w.4��K���$H�y1�eYο?e��Ha�����+F!H��.����?�cK�ƕY#35$�Q���&d�1��\0�H���?� �q�{�������ɟ�zq(E\"GЊ�T-ƣ��Ny �Rs\"�~�L�?��� C����H��p~@�~�b�&}�)V�\Z�9R��;0P�|	�D�� ���b��h_	ͣ����l���w5+��M�?z�}�&�ה�-gj�AW�*@o/���d��B�䬶#}�2���v؟���5֜��i�k*��}F�B�%	�uS�߶�XD�j�ף�����%W�%��pY�Y�����HQ\"E���ʟ���%s��T3��,n���U��Ă\"��_����/�U[�=��31Z��h���^Zi���׷�m[5�+:<c�qO;�������m���u���p�-ɧ��DR�V����DT�N�0�F F����E�D�x��gc�9 ��A��4m��Bt>Q�e�6i�v�дO�՟�)w��}]�=�I�r�j�SO�f���c���m��_v\n������<��v����܍�s�^o9�o�A���\rVᖰ$�W9	6�5w>2��n{!�~!h����n0�$<��@TD�,�)���6��8��4�`!*A��N�h���G�� s�M\0�o��7�-RL~$�p���@���WO���ͺ�XG���\Z�t�y����EE��ۍeEq��<`\'�P&��+wjɤ�J����*\0��v�dRy=���w�ݢ�]9 ��^ qB��8�VD&���-�VH�W+$�l�$I\'V�g��Ȥ{��%�*\0�st�dw�	T/��ʅ���(�	�\n���\\�̵�D4�F�\Z=,ίx��/,��ϯ�aH�<��W�hq~��7����d��ʦ�jJ�,�\"�*�f=�jI����ݠ7�++��\Z#�\n��Dn[�b���w���<��j�gѺ#_�����܋���4����}{��\'���=`.����\'\"ä��gC�,?7Fϡ0cO\ZLy����z����m{p�C�����t����\0�x�/t6ޓ^\\ؽ\Z�(�y����\0�h�s\r\0l<o�9�~�h9�%�a�5b�,�$��fS*�=��_�]��o���Ӻ)���r�\Z2Z$y���t����$o�M�!�F򯒥�䙜��|V�T	9\'�����;Y�%8e&�³&�S���	��1^#�W�QJ�L��o�_^��M���!~�ď��K��8}_��W��ۯ\0.H���p�AhJw;���^��s��B�rb�\r�׈�U������.;:��:�	h+J��?{�@\"`���PC����>\'�K�S8y�G�\"��,t;>Ž�p��:	��5	A�N�F����4����P�bS�\Z\0Wq���d���/����	�_�\'�Ί}\\aS�\"*�E�L���&�S��+�@���b�{(\'	b�r~i7ȩ��C.�`	���Q�8���>�	_)XNa\r^�/S�|\ZC�O��Qh���ѽ�?�\rI�I���;:���d�/��s����g/��=��V�&m��K���B���GYSs*���3���?%���˥�����9���%��\'f.\'�]�Q�Z�ß�ZGß����|�F!l.�_T0T�b��\'A$��NI����Ue�r��t`��9��B���~tpw�ɼ�|H�ۜq^D5��)���y��ۉl���2)/�r/�Jw�/��ڿ���#��0Oy\n04�:uwl�\n��L��ʭ��7_�Û�6��l�\Z��z?�F����GY���q�J�y�\0��:��A9�=�8���c��\\sY۪#N:zE��gVtU��g������b鏍8�z�\Z���%�������/0�����7]+����ʮ����_k-����҅�Ϧo���b�e]#;+������g�3M���u�Ŏ\'f����[��<��x��+�B*��=^xiB���Q�~�h����\n�r?�b��B�QD��~�����϶���/�?���Y�Q��yW�J��(C	ŇC�E�����?��2Ш�@�����1�p�{���\0�7S�En�����3Z�2\'$\"���~��7&�B��k��~��u���SrEm�0�5����BrLNw�!��.��\n���o���?��@�5�����WM�������[�E�y��7��`G?,;��o���b\0H �K��,C�O���qU�2�\0%����۫jA9�P엚��<�(e(��ݓr����N����VP�o��E��w�D�HY-$����(=�S���o2��+i�op�ddv~���r��`h�\0��) �dD��C8y��\"�C4�M���W����@�\0��STPV�9׽�6������-\0𗨀qt5��\0�3������y�t+��+-ǥ�#��@����pS�}��h��8�R9,~/k�Q���{jp�w����ϚE�tQ����e�ٶ�mT-�ێ�AB�Y�1��g�����EFd����竪������w_���4�o�5,�x��{\'yK���mX,��⏷\"������g5�:i���N~#+�r��`����h�U�\'�,������3�ޯ*^%����]l����<�,º����l	���pF_�|�M[�����y�Ҕ���`�m���L�?��\"���*�P�pTZz�m����^�ge�������w�e�޷?���L-�eU6��x����V�|p�c2V��D���,�`�J&x� V�����ʇ\"|�����T!�7��)B>X�i�*X�T�A��%�S�����z��\\�U���?�/��:��4��Z%�>��]���F�~蒷�����f䫒�~�H�/Fn�b�O���y��B�nHר>x�͢�{�kT�W�w��JG~�k_6��Jv�>��UB��L���`���\r�o�\\\r��G�}ꓗ�����ws��R�(��ׯ���}}P�~?�/��亰��U˂=������룏}��<�t�⃹��}�V��F�ev����to��o)�/��)�l�0�B��O�)��|ĵK��*V��En����SQ����apV�pX�ݪ���g��U}�O%ҾlC��C��á/#�;��	�v�� ��6��k]����^j{���=/�\\#�`�7��wtē���wt�W��\r�Ӧ\ra�~�kR��Q��wdl�U��Iڮ�4��ڏu���_{��i��U��_ݱWK@_�^N+%[��+�+׃@�Zo�=�Y��OU�Z���ޏ�^�x꠪��nu\"���\'�0�*���-�צݪ�A�Ϧ���~T�o8���8}1E�����G��x���}�I8��?_��-��GA~��#��vIΏ	��ɾM�2^�&	��r�ੋ�<,��x����va�j5&�O&(^x�S��q�S�B�����$�S�by�z���� �4�U]�]��\"�@�O#��|���J�#\\%��?�U���:g��1�2K����4}>^+K}pU?��㦊w�a�~\ZF?|���#�d�����vU}R������~����-���b��o��N�4g�Px����\"\"{�Y�%�����~��/I�uSB�?� /{�橆�2[\\��wS�i����}V��z�#��V�*a��u��@�ONj�:Y�O\Z~j٥U�o\ZO��P�ʋ��S!�ԯ(�t���*�31�O�&��/��/��]��o¶JB�$e�W�>]-�~�U���Wy�����H��G��F��7ǡ]7���$A�>~��xC�\'U��^�3���P.z�ǏLz�X�X���N^��\"�/�-�F��ws�od��%���$�3����{�aj��uo�҈/\Z��B|������[����%�]5^n�L?u�*��π,�_Ȍ�d�6\r���^�D_���U\"�{���,~e����j�|�選�z񏧒^-��?��U��?�-��z\rOV�%:?��E+?]�z�Z���օ�ǟ���̴<]����;���C�/N����gnᥞ�?��t� 䛊	ߑ\Z����>Ir�9�*\r��BR��xO�ަY�q@�*��ԮK�ގ�_#��vo�E��O�x=K|��a]�O\'�\r!�\'��\'���F��nqU-q�{Z�7��/ԫd�\0`����B������/P@~�Z�h���B\r�T/5i��5<���z�>��\"��w�x�Z晸Z���?��:?_J~�Yo��Ş!����\ZM}w7Wi>��c������!�: |.؄���[�xQ$�r~p�\'��k�ſ},彰��xt]+�?�/���9���Z7(�S�=�B�*���8���ܬf�C�������}(���ԧz[�yq����>s%�ۮ�5��g��Z�]�����]������b�$��c퓪�_�i�\\A��������\'��V��׮��䣡��vUkE_���\\Z%{�C����ש>xg�z�X�zA���e���_o��a����\Z=�\Z^Yf亞%���8��Z��\'�oLD�\\���%����G:ka��{��O<�7�WZ~�S�Q�Z��R�F���O��;�˶b_�^7�J��u��ֽh�#}\0�WI>�(w�WO��uYo����ރ����x�Z�	ny�k����f��ߌm����>��T�r2����\Z�O��[�\r���k����b��=\r���O�3��J�}����\\�ĳt�+@�D�D��Ұu�O%������-�zU��O���	��=�鹻��\'����ֹ5ʏ�^�Z��#�`�9��\n�e��i���/�G�v�#G�gX��7n��*\Z������@<�-��q��{���O�ծ8���ǲ�Zt?�-C�%���3\0^b��f�Ւ�S2���Vi>������U�U�g.ux���vc�*�3���}�bغ��@�	��������p��OL�>f�EV~�\\~P�\\����.I�U�������CO��c��^<�!���>�/m���ꐡ��;7?X� ��ŝ�\'�`�\\%�ݟ8����M���+[���$}��O[�u����O��,�#|��\\��@<�-��i���?�-��>W׏�\'��jm%\n~b\\��7N�D�|���=AT�+&¾�~�A�W�u.bZ�p	1_0���N��,��f�ĳ|���~F`_�a~G�L|��=c���ׁ����~��/���t�sX_��\r�Q��<�Ou���\'�Q�/ҟ*y)�O8M8��VA��Wɟ�-o�U|\Z<�5��u�U��Dմ��������������<��_��ۤ\\�U���i����ڪ_����Ol��=隵����-aw�=���kY\'�2�����>�}͕�y��/�\\0�B�\"�?�:����W�>�:_I_U��іC����^d��e�O������L=�:D���	ڙ�����\'t�r��	o?0*��S?���K��6���O����u;L|f��T��%y����mܺk����<۵*�O8����<�<��x�+����|�f����~��|�EO��;����2;�E��O��u.|\"y��r��p�/�/���d{�/,4�e�s��P�\\�\']U���Ű�^OOЦ����?Q<]6��0�\'�\'�����|�uy�U���zS�؜��1�����[��u1|Bu��E��\\�y�׀�OP����z�ȧ˻�Z�P�q5r}bp�0����mX��!�S�q�X�[�\'��]��&�S_�]?v���\'�\'�W�D��~^��ɡzY���ߦ瞘�)	���XUDO�Θa�=���C�-��\"}�;�|V�����%�����u��A��=���8<�=]�������]���ԓ�6x����0�G2o]#=a<+��×$��r����P.��vi�>b�S.�G�闕�E��>��|?�@��T�c����+�kO�O����D��S�f���T��ԅC�;�/�D}�^%{F���i���\r?�@A\Z�j�\'\n�N�`�_��]y��~P�����`	5ֳ�O�ϵ���eE�	��5��Z���U��D�<��Vi�ah�������]�˞\0����\'�	��_8�OX�����y���ɋ%4�þ��������_~W�3���{O/h�o�+O�Z���-���[�J��@خ���9=/6����I\n��-�u02�}�kC��G���<�N�֗{�\'*�-�����\'���F�u2��b����X�G�~����혦��W��F�����?mo���������A��z����<���T�����Ey�K��\Zӵ��o\\/O})���NF?]��D����	�u\0>��v]�����U\Z���G�b�oi���C��� �[������a�Bg>�b�n^Y��J�	��!���\n���\0��)â^߻?�d�o�n�cQs���h̏T�����}��=��<L�Ҷ��z��-h_��O�YӬ�%����~�����*�	~�Ϻ���4�A&_���G����:�?QjI�-#��j?j��8r���ߏ�\\�xn�w�G2�^e�O�Y�81r}�����d�o�5�$�\r�=1g^U�f1��D��?NCr�@~�5��{�%�ę����K��p�?�Y�r�#Y�\'��m�^m���ر�v�u�B��0_�͟������z��g�$Zu\0�\01��}�ח��O~�_8�Oh�6tZ&f=��Ć���޻U���\r[H����/6+�Ot�B��_�����-dn����[����$�A���=O��\Z����\'J�j}��8��OV	��U=��.<!b�u�OxX8��T��%�L�<��^��3�m���B7[��I���?�bK����~�YG�<lda�h�wG�x�w��Z\nyb�>�/맅 O,ؓjMW#O$�����Q����\',�nI�\n	G��G�*q0���k��\0�%a~�$a��I��7􃃊�-kw�l\r�9���\r�k�\\�,����-?�J�Ptɋ�?�i��[���\',�}u�\ryb������}u�\"]ZzC��wB�د.-�|~D߫����f�_xv��Ծ�G`��oW�σ�R��V��#��f��}%�I��B�]��MV,�S�R6�ό����s�J|zDm�X�<�dc��9�[u\r�\'�X,ְ��!OH��ތ��}$>ݲ��r�gC��/d/<.��4�GO>���tď����Z���S_*[�Z������l��<�^_	Wu��U���.�	�z�|==�<�^��3����/�<�\\?v٬2��5-�G���4���]w`�\'��Md^I���F��8�	�J�����V!���5�� �w�>��gP4x��\Z�����êm~b�f�k��Ɯ��>X����|lH�^p���HͿ8\0yb��[��B]��\Z�{�;��?�o�����[�\'��I���E���pO���y⾞%��j^liG�p�\'�V������塵�_a��KcOſp����~�r�����k4��q#�׽����otC����P����G�fU�=qd_�V=|�	$[�����X<doQN�L��~��<�c~��@E���%n~Ot��K��:�TC�vP�z�ذd�x����E^yb�~�\"�5�b�\'(�%�^A��<Qb���D_��ǭ�}O:�=n_��<�cod��VJ������N����<��B�#O4�{����_�>d����2|����=�jj� |q� �ā�a�>T��mzb�����\r~���M�	[]�C���8~���<_���\r���yb�����C�i��zA�8�o���:���xqt�Wm�����vj�i��sww����Df��G�\"�g6�]^��U�\'�k����\"O��g�K��/D�C����,�L������	�z<sW9���!�^���Q����<q_�X�7���מ�O�wt�:������iџh����sЃ�[�[ ?�q�N�*	��qz̪�=q_���|�\r���	��ؼ�������T/>�L�W���J�y�e���4���2!��������oЈ�ɞ�KY�������L?Nvy>`~�a��v���\nV��	���0�梨��}���<_u[��r%C���\'{��W��������S<����%����~Эs�,�b�Sa�ً�>�R>�(�V��Eh���)x��K�OF�Ю�����^�U\"�\'�?Wg��T��}�֭�|�N����^�s�����b\'�nM��X��/�t��<1[(��	���\"7��n�����\'��30�\'�	���t�;}\"�������f�����8w���d!�g3-�{�ξOp��,����z����\r�=/?����v��e�۰��dC�\r���=aJk�߫~�Q�c�><釿���~�Z�~�#��ŏ�U����Mz�RKG~�췾����EO�vb���1]��UNr���\"����t�/���i��4ƯV��O��|����=���ׯW�}�[Q���yG����f-�??���������N0j���ߠ?��}^R���s�o7����?���7o?�h��.���eֳio?^�ٜ��-ռ��A��f��V/?�~��/����`��z��r��\\l��Ϫ��L�D��[\n����9/4���y\\�i���?X[x ��G���n�y|�_�����R����^F������I������o4�񿿷��������Ͽ����]C~ӵ������ە�}�\\���ݫ_���!�������R�o����J�>_�����Ջ��E�@-.{��A\\�?�$�G��mծ3�8�۟��/]���{��z�b���=�	�r��9��?_u�����}���s�/V��u�q�_Ϧ�e������H�����2��<��۾7�_ ������?����p�������X������	C/	P�~#Y����Jկ�k�h�|�Z�{E��V���K�ˬ��Ċ@���?*����U����n.�g��_�L�/$�h�q��_�.������տ~�	���j���\nPT�X�$\n	2D�_��Ǿ�W��>�����a���Q\Z���~=I�(��_H�������B��i\\}M����2c���텿�<R?:�D0�ɘVy�?�������c��ex�A���\r�N����+C����]�8����?����\\����_����z�\\�O�]�\'��T��R׏�{���ww��ɵ�!�\0>�>o�t�t�����v������U��\n���T���6p�2f�?�?�O\Z��/�y�_?ɑ˿��_�~��I�\'��7�����v�㰿���E���>n��X�{�������J����7�T/M��m�o\';�m�oT�\'�U��x�+�?��\\e��o�#�P�<��oF��w_�i���,��������L�p�����>�����[k~[��t~Ɩ�[���8��n��z�3X#1�$�/���/��f�xs�_Ǳ���Z�g���U�����?�ra�ǶS��W�}Dʏkk����g4���z��툼��+�xѲ�����(B#��ն�}_��ǻ��د���#>.��?^��j�V\Z��j���ֻ���G�r�^����kc���҉���⣯w�>Db�zUѺ&�����ǰ����3��A���G�������֧��%ҟ��K>3Om���hr�cfߦ�MS=~x�P;Po<=�z���.�GU�r���/����.�������~Z��T�C���\"N?h~�\r�WqT�m��gB���O^��	���;��P_���`��$��S�����F��ߟ��G�����\r�y������ە�o$�7��9�o&}��x���/j��/��������>��������[�����Z5��w�z\Z��� ��Z�]�_��-���⯻�߯�w=sC7���/��c�R�/��_��J~ӭ����:��V��X��f��=���Ug���S��Я6�\'�7�kn���_�ѿ��^{X���o-���������V��C}����cm.�*_�Hn_-�a>����?N���?>��iS7��[��W���l��g.zv�}��u����̉/��5���G�S�������������/qڇ�[I�����g���5�o�0���|-�~������[���W�.��|�@`��FV\'H����sҌdgďw��m����w�����k仳y\nK��AI���X�{aG��\"��wmv��������kc>.�~�����O7������}�^���־�`/|��Zm�{%ߋ�j��E��\\���ɶo��m���s����/ٷ���?}�!��%�#��%2��+���i����ϐ�·#�ڿ�*>����J���\'o�q����Q�ȅ������� ���$����1z�t��Y�O��K#�1�/�\n��1嗁�����uJ>���g��g?M��	�Ε/��*g���>�������W���v5w�6?w���_��ǵ�j�?ܿ~���q�\Zo�����f��of彪�d ����f~T����h����s�;�/�fB��U����O+�����Q���B����\'��\r��?��&�w�~����oQ�gg�e&^��/=���%�X����?�p>������,�3���EN�{6򿐩���������?%���k�����Ə�x,E�G����r��ZO�՟�w����\Zl��������wK�� ���>������L��X<�^��ꄿ������d�����_qS�����%u�f\n��BOPޯ\"�	����s;�&x�\"������m�O���K���\0D?ޮ�	>_�\0��^����_����4����6�A���`���1��\"���<��.��0���ϊ��.~k�O�;���y�Z.nJ������*�_y�_}�/\Z����6��֕��=�^Q��R?F�#���~~j�W~ ��0$o?�/�=����ĵ|�0<��_Q���@��_\r���[�\\s\'v4���g����>i�\n5+Jv������2�{`�\'�}���t���\r���L�~��~��Fh�f�s=-���[m�w�s�����}�G����޶�m��h�_��?��Gk^���*6��v#~\n��<�x�]���N�[��p���G~�.��,�|�ﱉ�7���b�~��=)��˧���\0v�,3�x��\0{� 0��V\n~��)�-Y�R�����7��J�x�o��b�_~Ñ�����Z�*l}X��GQ��:�Я��_X�-����[{�����	�(��\0����܏����6|��3C���\n����~�&��D���\\�����ap�x������E�n�w?|����k{W!k>[=��ϟӳ�~���7��=��H��<Vh�>��u��(�Z�|]��ih>v��x���ڪ��}��{���[rm�aſ���y����ў_t��|�N៖�U��O[b~��o��/.�GH��|��/��:*�[���/R��R�5�c�M5�ol�{r��������/yZ�1����|UѺ�}�{{t{��$x�{��.-?ЏH�o��ٸ���5�e5��� �v�Ȳ<�X�d|EͽW�\\z��H��}��>ؙ�9RZ��^T�˘�	��X=U��$���pW���-:����b텣�(����V�7#� ������O�cqF�1{S�0o�9fv�u+e$ћ{%:��LC}���Mh6\\Z5�9�]�箹t��F�/���i�޻F�\ZtM}6zUg˸U��x�\Z9�۝�3w�FS9�a�^��<�NH���n���r�\"V��;L�e�!���4IZ���2��9\nuX�������\"�J\'v�kP�ɩ6ӷ�I#�R��M�Q�y\Z�SW����mF8�*(�c���``J�ogOl�L:D��I�aA��3r�\"��,v�2��{k�{ܴ5>nZ�����.��޾p��PB�\">T�R�]:I�������$)΅����-\0�`�C\\�!����2��Ht��������*����:N^ ��vp��#���I�<]1��½}�h˭S�\n\"���H2M�D_Y�!wD�O�|��rlnǂ\0�\ngx.Z��ź˅�\Z=�5�7��Y1�C�{1J.��:Isikf�B1<9�9��\ra\nB��1Pk��\n����DF�1�᝛�\r�ui�y�!�[t���6�ɖ��Ņ�Ĝ�Bܡ�`G��9�#�ޠ\Z���6����i;��4/7�囩�J�`k���8�hH:l�3�����T�Iwj��%gY�{�>���o\0\\�o����8L�rPv���ǆ��]��2Źw���]�*��8�-o���R���k,���~��9��7[<\'����u��C1��D<�u��և�k��m[��N�*�-\0�fCO��A\'������y�w����[�d��ˡgC�����P\'��p����ybP*��sa��|����]�+��G��+H-��TzA����F..����y�;��`� \')ߣ�V)���p6\"���K�ƃhk�D�)q��M��M�9�h�~Pq�Q���^�r[f�P�:�h6l+na�9\rU<Zi,\0#ֲ�y�庙663��^��;m/r��]nQ�4��mk��Ɲ`���&��v��Q��z՚̘��t	O��L�Z��5�!�w������V�^?�9���D�!>�͡aMi\n�>ކ�N��7��YM��!��\rl�\0#�2-1c�qR,r΍�D�;��~�5D��}�O��%G��|���%�`��wR�S��U�����N�s����v����	ts���̟+Y�w6w���̨�m;��26��l�����0���p������W��4�n��;�a+o��>xop�����:_��.`���ƤM��\Z��1�.g�yN���O7�gHދ�\\��F{���>���%8:}�@�V& ?{4���.r\n�6C�&�w��!��E�u��=f3��m#ޡ��|�[�BU��_�f�O�.��>�4*�4��1r=��}�g�����1^��	3Χ���ѷ&��4~���b�6g�tQ:�1���j�LCr��\\tl�9n/�WX�_X	d8���V4Z���Y�V=�=�O��I���	8ڧ��N���!X�az�lNXzD�)���漫�rWlT&Z���`��W�+v�`�\Z�gA*B�s�[7Ug���MZ��	f�c{:��M��0���5	���v����(Eٲ���ٹ���h@�z��H����X,\Zk��w�o]�q���\',ll\r�1C=s\"~L3���]_n��x���0E�C���԰�������2�dH�\'n�����[֐rYTzt�xhf�K��N)V����i?t�\r�&V�4��$�R�`{�ߝh��>�.6�e;Lۺ2<��8���Ю:>Z��^B�n�*��IA9�\\xřw����x/�+|��\n;-�G[�m\')�\"E���e;M����â=\r�V�y�\n!�1�P7�?c���2�(#�J��fw������y���+<o��P����c����0t����v>�;[���;V\Zlp�#��I�Zd�̌�^la��M�\'^c�������Kx�#�f0/8�s�ݱ��.��H|����\\v������O�����RV�J��VDN���h���q�rp��$DG���^\n\n�r����)�R͛\Zs���.`U�pep�y��h�E%*l���Lg;�!���Z�_���M�af\r�6�� ��\"���]�S\n��.!���EB���\rt��,B0��?\0����Xs�h�%!?��i�v7\0����U%3��yi�F��cz���J5��3	٬<�Gz�����(G-�}�pr̤j=���:55�\nk�-w��\0��幆1{[���������u�S�i�.v��eI]\r�a2*$��zC�2w	�J�&m�>�a�2[�˷�Mώ���D�+��ľ��h���0Ƴ���b�Z�f�UL��+�F�i�*��â6\\Rۃ@G���iCc�����PK/���\0�$���%8�l��(����Y�e0cs636���yb��N��\n<�N4���}��u�y���������8�1r:���x\r��m>ZL�tj��\'{�f{��4�&��]����E��%�J�Ny3羷�&^�����ix�o����Q�y*�X#�d�\"�t�LSgj+1��SčQ��ޒ�ta��^N��x<bt�x1�;S�iZ-��{�rG3�\r4;��\"\"p�l���.��]w�t���q|�W���K�8���SH�$�8{�P��@��K�1����(6���!R���=�ۢF,����5�с�n��Lk�mэ94\"(y\0ڻ+Nִ<&ܥ�^1Ӱ��uf�JE�)t>�WF��P�����R\\[^��`�68�37�Q��(�;UP}�����,�f��a�w�m\\����++��\'�R�\'~Z�N��9x�\nnyݸ�[��������O��L�on�.���Ap�]�s�P.+\rҤ;J��Н��*G܃^Uh�@�K��F�W9C[u=S������o�(B�����b+m���p�=�TN<.w\0%� �@M���K2OVL�{�^�x�@�YO��z���FM���]LJ��t;.�E�io\'�o�X�������y�\r�ͧE�\"m����]�xF����w��4���8��2�@�v�ck#~���E=�3\'�)�`�6D+U�\"���Ɓέ���->)nU��\\u�B(^&1�|��\nc�P�3\n,�͎V�A�d�Y\"%���٠�@\\\Zv�;�)�Y�dRܮSFþ+4��f��$�-U7�)���Eb7W�`;d���Ԅ�P*]�1oJ���-�\\@�%������{>�G������_�fg&ܢ~��8tP�ЗJ,E�8�X<x��(��M9�L��(�N����G�e8�:da�+��p&�9\"9}f�������i���Q�wS0T[Ɣ.=��Q����i��Q�v�ْ�~����٭��+��d�w�q2�k��!��<��⦇6&g������%q�/��Y��)����m����`2��� !fR8�O=��b\n�%jo�5�[���{�2ILne��͈\\s�[t���yk:��p��>h�㍮Y�����B�����5c�tm���Q�^G��q��u�\"={�Q<��X̎R+��w;ٶ�A�)���C-��&�]����_\"jCm�xwM�&Hj�DB�\r�S�\\\Z�7d���r��؏�+�50���P�vs��Vr�س2��,۝�C��Oqӡ���Pw�{%�z��\\zY���=��3�t��f�ME�g9q�~��%�:�P�2,�6c�x�͖:�LO��UA�ч8`���v�3j��my�\Z��su��� A��)0C)��� �\0����X��)Υ�\ZO���z��4[�����Q�Ô��q����f>NvfQ���p0���X$�Մ 7��j�4Iwv�\0dT��5c�*Ti%�k�D��\n`�[n@ɤ�eX.���\'������9����{Wm��ߒ%���fH1E�]1E1O\0�By`�^��UJ�P?ђW�\nGlXT<�����>�ȋ�g��É��3����(�>+�P�mTrJ���s�����0%U���HhX\"�QJ��\"\'�[��\n�A�i�s{�[��vP�]tȐ�\'��v����[<-�\Z��(Ju=�^n����Y�o�4�!�>j��z�A�d\\T��2��NF�O],9{%͇M=q)�B��|H2����x}/R�t�\'-�\"\0��k9.F�X��\rw�O�i��X�g�W���ySA$h�!:.nİ��� *h������;���H�Q$�\\�&>	%�O)v)�q�D��._��F��V�+\0�j�>��4�`���=��O�{7`7��\r�C=m��9ePN4)�T]��|��n1Y5�h7�lNm�Kzmg�-)�F^=�p}9Mr˟�Ҥ@���1|�{��h���#Dr��+�]]����J��P���-��F�!u�2;�i.av(�%M��p���w�w���\r&S(-�p���{�n�%h}f	΋�D��k�y�n���Np,���n5�����@7Ԁ�GK��S!ݡc%gr�݅JςK�|&���\nw��=y\Z�\\�5��R�<-��e�3�\Z��׈�c8cC��X�}�/�8��{�lԱ��]����ۊ�.�5 �ۑ������2���@J4{��i͘v��u�Sٶ!!��f�g=��m���x�x���\0p��ܖֱ�_�@�x\0�n�d��GQ�=aj�_O]\Z�}y�$�Fe�{�ʐ��fF�e�H��d�m�0\\���7��\Z��i@\"��p[����i���W���aN���#-�.�p�(tÁ�=-:ʘ2��]�Gz{W�mb�\nY�/��;��:϶6��\\�����2�Ș<&clA�\\��-��G���u������?�YK�XW	��LB!ئP0�Df����a�n���˧\0K�+iץ��\Z��N88����o���ч��&����.���k\Zl\n���uʹ��J����b�\'�Lqy��>{��H:��E��f�p�6�9jG�����v��N��!��br7P��N�z����7B�}ou�!�/�M��K��G�� �i�/Z;?\0��R�ZKB�|*�i},���&�n����$ ��8��}�/^	���P�A��\"7��Ho1K��š�DW�q��q��:�VKl�X\n��g]�t}ڔyv��|G7�N�C�E%\Z�%�s��c�V��9G���X�Ԣ8��\0:���[@ppy�J\0�$!�J��b}�\"��X.�*��%���$���U1��ܡ����]\ZmS�nO�aw��5=F�0��C#�)�������w`��X#ɪ\"�{�y\Z�@�В�״���6R��5�}�R#��7�Q�]s��8�w�$m�V�n��<�\r:�\"�w�BR]|ᙐ�{�L�n���� N��\"ƆN��{\nm?p�������I\\!��[�\Z&�@8�\\-�5�-\\�b��rۋ7�v�$]�Lʝ=oho؀�}w��p�D�)��^����,�]��{���qp���*�Í&��wr޼z>�A�[e�}�KpA��qjt:�>�\n�,��6?��:7��d��\'B.R��-�4�3�nj����M��z��\\�%�ؔ�P�`]S��H�F���%���f)My�ܔ���y �5c�`DO	ڜf)�)7Q+tq�o�����Y�;�,��8\"�\\4Kr��Iq����Y�~~��2:�ݒ]qh[\nkoA�m��	����˳����a\0\0j�@�O��;������b���	���-��>��F\'���Y�� G{���������%ṟ�su�o�����`�+��E�8�˷�{�Pl��-���4{Ѡ��r<ˍ��~��چ���e�����m���G�%��ac���R��%!\0S2���V\'Fo^�iq�ɱ�v�6w��U0`��%x?���Up��rW�l���s٢o3�KY:w��ho�g�n\'@�w�[\Zm��^��9���l�D˸Ùi�M��N�۸��En��P�4��)ܽ\0E�r1�[sܑ�ޮ�g�~\n�H��m0=ܕG>��k�3~���He(<ʧK�v� t�%�w_�K�o)=��_i8E�=�aq��B68O��\'\0��m���^4IpJE\nL�O5�E����l��E�1����Ƽ���e�>Ȫ����1�|�GSԮy�7*0�H��I�ŲTU�8c��v^1�׷��^G���-B˭��:=�⢅��VP���r�T�JT��:YG\0`72�]�uz��1_�)�O7���ԍ\0h�x�(��9|����\"J���n`�a�8]dZE�Ms�ʂ��Ǡ���1֦��S	�$=D�\r���L}���Q=x\'\0���³�ŕYD[m:�wT���we�_�t�[��*���n	[��r|�C5x6v��s\ZA��$��}�i0��|�s|X+�-��W�����<��\\��e�b�\0Nl�l*4;��RU|\0\'�>d��(Jf��1نz�����2�Q�ؿR��Fs�1L��\r�8���7.�*��4iU<�1�hT��D��\n�G��r�p[�.2x��3�Jx����1%�-.����U�������۔;�(sJ�*���[�I���̹�Nֽ�.�����V�\n6�,5pn����#�%0�4Uw_��\'r�dl,���ŧ��[��ے�yD�@��M�M��Eo+�1D�6]�\"����$�ݰGw��\"��)�Zt�0�\\��)ݙ�6�y-��R�o޶	/uf��;N����9����~\\w�S��^��4���2ܽ�gVP% �H�E�ggQ�։ɣc_��9�ћc����u`���*������\n�,X,��w�{������M��\Z�Za���\"�	�Q���1#���-O�ʖ��`1��BG��&<�q0�����i	�,�[J52Af�=\nlK�H��\\��wX�ŮɅ�-���g� �t\06��z;�y��.��%.�J��ܵyu�C�U���~�\"�����,���v�i�{,\Z�nd�t	ϻ#&>����L�H�����n,�Y�!����pR�6��l�s��\'�������[���(Bƈ�`KC{>:��%��]#�y63b��9pV\\$�q�����ݍD[���g��	�K������?�&0H���C;􆙻	A����LD��6�;[�ȝ��\\�{���ONX����S�Q���G�&��D�^l3rJʁ�K�� �Po�-X^�C¾���B��Jf��*.�GT����?�{8A|����\Z����$$Wa3J�$�+��	mM@��K�Wm��\\����%��y\"��d��e~x��!�|�>��̘3B���>.S� Cd���r2�����4�m��� �g�V��NnDˢ��i�����b�M�%�+ch`��7ĵ\\q��:nN��-���q�<�1��E��l����$�og�(I���`�4a�H:)���T��	�����<�Z�Cg��L��ǡh�(�ϩ��\\�wё��,�n���W���]��!��������M�Ѩ4a�J:��4������[�h�C���=3�����\Z9�I�s|lS�aV&�A\0�+�-P�����;Cq���n�-����8��\Z�� ��#���L�\rG0�\'�!͐��m{\\���o��-3h�(朣�,�!.���`r����G����Ct$��ܕW��)��Jg�-�X�g��˽$���e,`vN�,*���þ��TȰ9���n�E����9�L~GI�a���=q��JI��׫��>����r����mY9e�8\0�ԦFŋ9@Q�0�2�I��ST��l��=�d��m��h���e7�v�Á�A�HJ3�kS��%qÉR\"����k���b�T���-��N���J?g�ܗ��^pҫ�Դ\Z\\�\Z4�\0b&riPvoh{r�.g1��i�y;oa�q��\n-�z�j�Y�@<nq����3�Ɨ����H�R\n\n�K#���*o���c|�E��Y���~�4��O��PW�*�N~�2ك�~�.T6�n�0���l�e<W�r	�c,��{\\Fa�R,�p�1a�p<\"��~�9߇����l8�2�sV����Z�*���yok�>���ʒ�k�h-]�t�ڝ����\09\r<&FS�.�xfJM}\n�=Q��^�	���ҁ4��~a,�t��������!}����W����s*O�	N��!�\"�\ri�0�N�.�ǡ\0��9m�G�@�w7��aq?��#�؞\0\n X��Y��j��mC�n�-��ƥ*�[����0xyJW���F�F,\",Fq���,�\Z\ZQ�X���ݑ�q��\r1\0>?r�4��q*��!�k�\\d�.��6	w3�̶��ukv��Ub���\nnr�y49���u��.A\Z*tt�V��j�7���#�J�%�]	�mh�?dg�&�Sz�ཧ�饼ab\"�=�̾C��(��<䲪���$Z�Q5�Z���~ڧ���vG-�4l$Rr\\�����[�v7��82�O���ϒ�Ӈ���A�r�!1G�f���\r�!BS�:K�Z%�qϕZܸY�\"F�2�a\nK3ԍ�݋\0ݺ4����T��KP���b�.�,��+|4��f�d.yH�5\0\nQ����#UeK�����M�|��q��v�[���\'=�\0?�<�o�	9>W8�=����h5|�\"ę�O�/qe׷My٣��8e�:\rwNM�XY��۬�D�;o-Q��\Z\Z7���Elg����ՎM�[�m���	k\'�4�H�b\0�D4�+Qt�1���Q�ž�]>!�a��R�ͅ�,�E�P�I�6���Z�s���z��q�i#L���\0U�r6�ǚY����٠�w����	`\"غ�$E�}�)�w;w�@���n��J �Bg��O-�w:��!mh힃�(��.H�8����wǍ>�|37Q����s&�� ⲋ)��nrr@�\r\Zw����w_h��op:X�\"as�q��fV�	�89���X.#�D1�{NO��>�r�d�\r#�h�db�,Զ���]؊2�fy]7���2�m<Z�]]ܞ/�\"�^K��^�&I0\r��(��i�)���X�[بYX��9��[��L�y��=L�y���.�|���m�c`�c@,1\\��Aw��(7��8�t��Y�q��M�G�+y&\\J��3�\r�E+&ǸI�i��F%��A�p�R|1�6u����{�*�+�j�,+���t�ᡈz��X܂���ߟ6ą����0z�zh}���Z�Dbn���mбfu��Wr:���u�oP�6�|y������5�I�l;��8g�M����x���>��ÈC��sD�o��L��l_G��}�eGws��~�\"5�wL��t�M����`ڝH�9�!�δ���$?�Q���lirb6茘����������,NÌ��*�i�ݪ^}��$�DFFeBx�jl\'y���pZ�7�a�_�W�Ԝ1Kh�\0��a�B���H_J�WEP{\0Yt@ ��q\0����[C��}�aG/s\0[�oc�\r0d6j*��f�k=!wR��O*uG&�9U$���f�ڸ����y򸝰�X�nY�f1q�oT!�l?�.�]��\Z<�W��������9�݌�\n�Ju�K�\0�%�(��0�[��F�R���[ȉS@��1���t�5\0��3A<���+VZ:8ef��쩅iR�6gJ�Ҹ�3�Ңl�G�ow�ƌ��W\"�ث��v;ҿ��B�K��a,!�N�����=�G��Z�yH�|�O&�P�X�#VB{i-3�<�t\"r$4��\0׭�s���\08��vQA��R�mwd�Nr�����!6�L�K�ֺ0p�y\Z,=��\\VcΘ̴��;��vpo�Z�l���py��璜�f\n�`7\"@,�\rlN�bi��?B������Y�>XO-�wre���oh|�{�΢+2zU��օ�J����h���W;�q�MS�dј{����#e1d��S����2)�N#�L�R��F�f�{�a4\'1m`� �G�5��p�)\\5-8�Xl�rt���B�\Z��6-�ٞV$\"9�Ug����H��44̗Zn��|d��eb�Z��J�P�2h2s`(Ǳ��+��0�ē�8z�}���t\rڢ��g���k4/��x������G���3��M�&�<y���l}��?�[�+[M&���C�ٖ��?���O���ff>�&_��]�b�������x=����}��9+�Ƈm�s��ՓyԀ��T���TB�R*��f��Pf7RU7��Ƃd��S{.v�MH_;5B�#L�C�#�99�r^��ei\"U��+��V��)Q?�YR�n(�/e�|�հ!�@�\0����~��NĨ��Fv�~��G��eڢQq�v=t�&���-~���a�]׀�.i���u�a;g�u>2��\r0\'�d��9�HN���I.�\0_��H���|-ټ<Q\0_4�P�(�y{�i	�θD�>D,��H�O3��O,̠�\'�]���K�.��MGL�Y���������r6�I���\\�~:j���΄���ޟ����%��h숱ev(O�]�	����=M�	N Q&��-z5���eP��)H�o��͢(�ƥA���L���1O-z)?܏#�����ȭi���&2�Tl�C�L�\\�/�E��c�B��G�]�xC���}\ZH�nj8��uR�r�i]Bw|�$��FN�;��5�m�O�jWS�D%`�B����i��$X��v7��)w�;V��WG���Lu>�Cp�H�1# 4qћ�^�T\\���D������M{�	>M���z���Y�du��<��ɾ�GT��Vڃ��Xj>�I�\0�D(FZ�=^V�)����4M�#���˄�jŹ�a��|�`\'}�,R7768XQ�5���2�)K�)\0��r$��58�n�^�m%�97��,��$�v�Xps�vmΞi���	6r�<���o6���6���r�Ă[G<:�Z�mHԲ}�.���i��	5���c5.�y�lE�i�����MR�MWLt�q�J �6��J�#�(���^B���5�����w��H�}DTur�L�٪vC����7����u	8��b�,pfu7&��n4����{l�[�SVE|{��s?O��?�O�U��z\\���;�-����`��n�����M�����?~!~���_*� n÷͚�}�QP׷����\Z%챇���(���\Z�]����(��4UfS�٪B*��~	���bK]\\��Y�-\' �?���#!�M0�&b�����\"��t���z��k��� ��H�90�M��Wّ��0ށ�HGǓ\Z�z��q[DG\n���8��x~7F�~\\.Y��s/�7ݑ�Lu91�L3���+�K^����{�8|9W+2#J��c1S�.��D\r�͉��8w�s��K�9%^�[pW�ST�η.�E��CR�\n�:�蔄``i<:>vo9j�9�(5JJrn	�\r��L6۱�%�H��v����I�r�~���h[Y��n˱��ƙ8}�v\r���s��R���sgC�H*��w���\Zhу4�pG0����ӗ]y�k3��\"s�ӱ�\"��w�߸,�y��ӱ���{�Z[�5��S���X ����&�Mbc���b��ؓ���t܏���[\r����Ir�5<�1.���%-��\0��Ad۴�*��֝S�=�ۜ׸����$��d�6>[׳��f�,�k�܈��O5�\"Vr\"|_4+D���)�q6����{�	\03L�(��3�u$�mG�w�AF=�t�w �hi�����]o�7���)Ÿ�k���:�b��;�n0�)��	��d,ή٢�M�`əi��Q�u3*�ұ�̍��;S�3^j�~�m�(U�	]<a�,ǃ11/�*mŔ���t��Zo�fq��C l\'R�&���\"�HBǫ�i[s�G:\Z\"����c\rwL���:4��)�TW�%ل4�����mӚJM���x����]�K(����%���D�ѓ����Xҧ3\Z� @BO*\Z��`_����\n\"0���lVٓ�C�c�-k0wn[^GR#���Ml|=xkf	f�z������},[��F���e=�&��:aα(ڪ��{���\"�x(@��	�j�x9i�[�W�&gNK.�1�����h�pnk ���0<i(9PT\"9j�4��<L��[�\Z�*��\r���vL1��I�/�ʪ4�~��1\Z�{z���ؑdL�9R	�\nv�i���b`z��-�N�m���ڻ�Q�H3(�hwǍ�g�jߊ�ΥIˠ�i��|%�KD\"��x��;�ֈ´%Jǎ��IN����X�%�tbh��%�p�����L�!�y,��\04p�� @(�=��vT<|a<��HۉG�ۮb��Hd�f�UG�Oz!��?O]�������C���1���Vd�x_8�1n�2��}�ܾ9�`9�4hg�m��\\5F�R��ӣ��5Ŷ)�,�ft���H�th5�i#IEh�Pns����&X�8�qG�����\rS̅lز��6顈����%�\r9g�`/㫜�\r�9��)?Fw~�p����[�I�b.�\0�HM��AިPY�*Š\"=�ٟ���ȋ!�aφ������[����a�yW����	�ބ��ֈ7;���(�,3�Q���O�ѥ�! G]S��|�����5��A�8�I�2;�\n��\"��-*m���!�����=9�F	Epm\r����p���%Ž���r��ˆp\"�\Z�&H[\'\r �P�	$�U��I�7�򫑫R+�v\0%`T�H�v��Cz�K�ߔ�8�-=��9V3��.���GN|����F��J2m|����z�m�=9	��sQF�u[4gx�#�Q&�~�;�l��B@7l����>���.���8w��b�#q��f7eBN��A�<vTI�Vd�	`�l{�{���$��u`�A�Fj�!z��Sz&�Y=���q\"^�Z2n���a,�-�U�nn\"��d+�zNqY�\'~[�}i�12�@2ǂ?z	�<߷�V�\\�2��v��Ug��)=NLt�(�\'F���\0k�O]G0�������MW���f���3�!�`MC5�3�9�w�xb�	\0���S&L:w\n�vRIF>JF��Y�#�y����(�{Ɉ<��74?�\Z\ZT��,\\3?���s���h�]��E�/������,3U���Ta�Y̅E7��+�-J\Z���#u��ٸ9p%g��������P���8!����\\Z��1�Ŋ��ݙȇ\0�:�YW�],tK�{��)\ZYW�cbZ�.��Ũ�c@Ҿ��	9f�O!.v��$Q�5�rvN����\n�h6wf�Ԛ�LM�^�\rE���u����6j$|�Lw�8��2_���\Z\rḶ���\n��� Sr�q6���Ƽ���O���e���5\0C.�$|s��~p�)p�r.�tVR��i����3AbQ�*�[׻����v*�*o-��\r$J��arv �P�b����5	IvR\n��F>�t\"��M#�Zqn�.[tau�	�fq��D(]\rb���dp{��[)�v�Ǉ҈���w:�ه��?n�R���\Z�]���o�l��I��8��h&����t,#�<qU��i9�7�b���|hC�L�#Q@�O�s8*X|�zz�00u��hԮ�qM�Λ�E6�w�Y��v����xO��݃�9�ʫ8�O^�S�9�5�:�D�Ϟ������!WJ�a\\\"9aN(_��ya>�g�ȳ#��R���{�g��>�F_K5��P҉�O�gD�FC	�Ri�l����|�M��x�V`X�I@9����#\0�Ɖ�2�V��@<l�[,�&�vao��r���{Q�#�Z���q/�b`��j��4�ΠU��@P>7d@;�~�\Z��}ҍCm����\\4\rӟFM���wۦ��Yz6���͕]`\\�)��� *SR[��%�,õp��ƚ�Zܝ�Y&��-�Y����O����}���}c�C�Eؚ��@��`�6�µ�����ў�D�,����yj���[C�t�uv���n��@����|#J&�P<6h�~���\Z>#����.�UKsӋԹ�������ܭi�0&\"���!�D���pRd]n�s\0��{8�g̔3���f�;��*�{�)}_�趂�y{A���ޮ�<�&`�ƴ_W���t�1�j�&>A`�/gu��-��Pԛ�li��\Z [φ��.���(�v���\Z,�t\0C�F̥�g!��˕�mޣ4�dU�ޒ[�l$3A�������&���p�<��*M���͚�b�|��:ޤ���\rv&قr�����l�猐8��X,6>%:���Yg���C�ZD[�%%��9{��p�-w�^�^�]��t�m�ղ��t�Ӈ��P+6x܋~��T��̀2*��u[����18�F�w�(���֛\Z˒�6B	����lJH�;Q��<�<ؠÎ�O��\Z\n�,�2�L���x�	�#�%��W��fdw3O���5��znҹw<o�}OE��a��K�_@��[�H�R�� �E��z;-�w|q��\r�}?��\"}�ν�K\\؄ƭ 7:޵mܙFզ8�j��rn���LU3\\�����S%��ge�x����m���!:Y��9���q�3�\r�\\y�S�5����~�\'J�����\n@�,�{ɘ�<�����=��)��4�@v;��%\0DH�O�t�N݇.t�T+@����N�A�*���F�&m�gei���& q&�&�c�&ޗ�vpL=_�����ӭ5X����R��6�x+��CB9EMfe��%�NS=��9�c��vf��j���6������̷W.������&��]L�b*��[<-QG0�⾻��ɒ}��P�He�[BO ��=b�r�uqk��ŗ\Z7\"�)4)�)�{��������yK�\rј��������7�����\'h��b+��/)�E��x�N\\s�ĸ`O嶶�9�fv�:\r{cWh�j�EnO���6m�TCW��,�\\s%�8���w����\r�@=�Nf9 �%��\0��m��Ҟ�c�+zCx��9W����ؔ_�^F�f<�����a	2(##\ZH�\'Z��}��L�Sz�d�������pB��,�VB=0�[��w{m��S���D3 ���R�:)�%P��Q뵝��.\\��#�4wftG0�98��1�ܽ�y�����J2�C�GP_�\"Ud�x�p��\\6.����3.��4-�В�L�b� JH���`kh�y�VZ��	���t��\\hf��Tȓb�b�z�l�\0{T���ַࣼ�=&<ܲ��Y���K���������ܕ�th����c����8����nw��a#�!K�}W��y�R�X�7,d	���I�\n7�\0��r�\\X�M�|`���_bk�����\\v�nc����&c��J�\rڋG���Y����|]l�J�rG&~`�.�hBߊgw�]�O4����$HA=��j��Y�\0���H��|}���-D,��J!��&S�w�$��gDBS9���{+����h��Z`�	o�x��tRO�b�L�۝t��\n������x�Et��C�g�&b\Zb9�،I8N���Y,C���Γ��~p�6 {�J�8N:�28����ٺrS����账�w�&v=�Ų8�TB��U��Z�!d�o�6�En�K�2ήn��A61#x|b�y�D�p���n˂W����˜,qF�6���h�hI���(����|�r�L�pbdۘ��~:�L��\'ρ`jgJ���L-�N����/ܕg�������I��xЌ���i�l13�1j�2wxʘ��J�-�sd���9;+&/��k>�Rʚp{�{�T�7��k.��%8^���C÷��R�Z�u�tʀ`��������!��.��j��n���ݓ~��klo.��!�7���XCW�[�W�pc��\0��1HUݝ�]����*���=>�}e?�ż�v�-� 7�|�Fӥ�*�����-��YG�B�Åel�I��������\'��{?�7<�O��Yb\0`�8��nf��M�ds{��Z�]�%��:َ���\r�ƔO���8�{�:N��,Bs�g,��%�Ip5R�z+G�$hh?a�\r��a��Q�&qd�y�wA��~�Z͍�c���.�{g��fO�;\\�:��8X�\0�miw\r:��B!�;	��q\"g�ƒnACm�,��aX\0��򮔜�t��g�m)5�ҹ����O�0���&p%�֫�������e��-�t��-�gԵ��%n���Sx9ڞ�����?&BK�0Ɠ�Ԥz:fD�H�8&�e��!�t9y�޲��$8\'i�-���&i���G��H4�SB75����Ez�n�ݝ�G�3�`�\r��O*t�+��0Ia��Fns��zDH�c!����=�R�M�9<��`����񹫛���xb$�M�G5��d�v����+�*�����&Q|gIF�-R.;�FAֹ���9g�+������sLO魚z��O��Jq�ΕZLu9��Ua:�]�&�H�-/�H��S׏F��tK�ƅD��s`����h	L�Ť���t:V����Xx���\r�C�2�y��1�(\nO%@K�<\n�ɮiX)35�`dUGT颚�b.\\[K�s;>�\ZT��P�!מ�v�hh,zҪ�������!>a<��d(%0�9 �����FN+���15m�(���2�H�N_�\'X�eBȬ��x�f\0zZnv�������p��t���!�|je�D_Ҹ�a�S�w���P�\"N�t�����U���-�332ut({KY�-Kr�b5�`7�`|O6�34z�B�jD\013D�\\�̎�g$�b�y	���\Z�-���Ɍ���S�m�1�E��h������>�Xj\"�N�\rr�}r��:﫾7���u�Az��f�.���,ȴ��KG�ݕ��\0�g��b�M��lm1wU0J�ME�\rw:ܵ�nŝ���^�ES��5��Ŀt�1kC��/�%F��T����x����LU�>�\',#��V�q\Z\\x0�N��yS�\0u!\00�I�s��r�?��f�\'a��F\nVv�Lp;n	�5v�u?�G��N��g��QbC�R<���X՘��Q�TDӬ����LL�wd����qh���`Zo)u�M�x�gSdb�8��:�TD�2�e��˭>]N�	�!�66e�W�Pi� �z�������4�R�&���=���1^��=r��UT��gC\n�2��m �K�3�E�|��v`�x�47v�f��K�䙅u���R�˚���/,����#�)�&t\0ҽ�X��3Ri�{yS�����F���r�++�GK��Y�˹|KQ^푀g>�L�B�Ñ��P��sw�2 ���\Z�\0ý��|~�p[��c��b��\'sBJ�4Q��\nMtX�h�8�`?m�xa��T��ע�X���?�[��x�׋z`k&5�p����Z-:F���;?�F�Q�i��u��9��N�NO��?^������0Z0��S�{=��Y0L{˷[���A���&�ɾ�鑃N���[n�@���\\��7\"�l�\nU:�.�\Z�=up��j�쌤����5�Q.�t!g\"��B^u��N��҂�>S9Ę+���\0�lU��;�T�-��V>�!�ᬳߟ9����C��J4�����<ҳ��X�+�D/C���҅���0�=26�H�9BԬ�F�&Lfr�GTK~�\"�PM�q�P��kĎw�ЖW^���#ݒ��q��D�L̹8\n���g�_`0��Z��8�,��#�A:d$�����z�o߻���ܼ�\rځ���݄��R+�\r�����4m�|�w�W�T B�9�{�ے1\Z��v\\\\V�v��D���T��,پ����@z�Q,��|�g��	9�̑���P�w?��\rt�Sy�R�UZ<[0)����N$�9�[���w{gP�õ�Δ.��T2A]����� ��fQ�\\�s����V��P��æ�>�V��cƱ�(-P�m{V���iO���O�x&����r!t�:��S�S���^�3\Z����������g4����ܘjIyG�e��-�-.�B�a�+ɺ��HG���Ri{=q�0�L{%�3��jd��]!�5D\n*���O�m�>%�I�Tls�+.���#;�F��MY�z�{7	\"��U?�9��~��k��g�:݄�/�@�-��K�Wd�O��� $��x�m⑴�jj��&8�b�i���H��1M�\"U*��^i�e�N�ܽE\Z\0�:E8��%�@ �����`�SO�p����\0��過�!�w�Y1lxc�R96{\0�����S��3�l�T�%���|��[��I<�^�!�(�l\rVw�/Y��ؑ�DaCȸ8Ic-��n���x�V�΢�l�=|� �Ż/km���:-�{�l���ԥT6Z��L�{��8���G��t�Q՛��1D�l�C������#Js񤤭,\Z(�˻��6�̙�jȰ��19v䮺=ؾ���\\��LCDuL\nr���l����ƅ^���[5�\0�o�TLw�1�ߵ1�����~Sbč��t��KҒ�p6%�6Xt	��u4.��ss�D	�3��-�{0=(Q(t�HK8�[Ocz�s�\r�Ԙ\rI#���!�|\'\\ʉ�&ۃ=�%�X������(҉��L8V�p4�� e���9{\0�g�3K&�٨�a\0\"\Z�J�{��ĸ!#�p��|֝:�\\o���P�%�Ut��z�I�b�=г\Z�	6#i�x^��@پ�|� �`��_�w\0�\Z?���Qj&���(����{AL�x<[:���ɦ�1�.�,v�����\0��_�_��\\�e����lq!<�<iN��z�K�te,�	��Ů�Ż���[p���&s��\"~�3�vAu���P�(IE~��b%��᪀@��y/P\'�D�ٳ �R�t�̻�,д�rX�p�S3������Q��9s3��y�H:\"h� w\\&v���\n��$�s������/u���\"��$�F�ȳ�1B�ŊϪ����T��=�\\�����pw�Q�&t�l$^�{��{��{��M����E0��50�A}&��/�j��z�1ۙd.3L;����gf��\0Ľ�O�Ql縻G]�M��6#t*�K��[t�t�\0I����K�n�1\0�;)�XB�a�\r�L�C�Y��@�h��O��\0�\r�G�V��i����K��Tg�����b[�����`�\0��@���%�&�&T����1]5��0�*��ĥD�͋�(SA���t\Z\'��=�q��I3�6pp�^�s/+�������j�f�-X��4����)��^�5��&c����#?SغLs핕R�`�n�#�9S;Z�H��#\rf��&O�ayb%	�\\����ݒ��#���R\r]�6y��yv:��T���o�� ���y����q|��7(��8`�lQ�?X���Dli�ܼ����ߝ�ݤL�\r?j,�`B�%!\'Aҩ��#�0x���3�{s\n���o�b�m�T�2)m�|�Z���X�K�5X����1��H_�	sؓ��[\r) ��b�$x�n��Hy6�np�:���V	��P4P8���b�a����W�Pl&r�}�qc	��q�emb�we�ΓH��bgLQ���V�\ZjW-2\r�hX�ݬy�O\'�:>�:)��N������c�}�Սɻ��%�]9I�-	�^\Zչ��?�`}���g8��G�g�@�h_�QGNO�M��dg�po�����w��|(�\'��/�E�u��t���J�.3a�j��4���b�q����f/�����N��Z����s��+��,m���r��@�(������y_��<�pw�ꌋ2I#�F���сEE��wS!p�O�%H�a�1��%H>ǒ�/Z�*���*������O]7NM��b�:�3s��T6M�`@p��\'��\\�d�)(,KH�P��ӏgE��a¡|Q��ַ.b\nŠ�ʵ�ѭ��zT)m\ZA;f<j�蘉�V�Ɨ�;��k�JA���!�#�\'����E��3%��S��&�O�M��#��p�����*I���~>\Z�H>�}�;���\ro�,�03�|�\n�2�m���\ns[EW����(�U�~�^�Z�בۑ<�Za����E�$:�fXtJy�\n\'X�6����p���\"c��Ԩ9d���e�Z�ܔm�����D�V��c��^C��sHy��c}\"�/|:�V�\Z��m�\r�\Zg��:\'=I?�6�	��r%˦�#���=pQ����J�� �9UQ��n���y���d���+Mz6%�~۸�ٺ�N��PU��{G�F���*9�����ƴ��(�,Yp�7��톦�|��~���K6��8Eh?;h�ލ��R�$tN6|A�-uh�h���om�Z�7?�@��_�9�R �u��%�v�5�-�Od��es�E�ݕNE�fȆ�Xpd�i٥�qp8�EbqʉuЊA��*jr�:����Y۹V�Z`𼿙t\n�!���1K3/�	�z�9Ci� ب�N\"�>2ۭ`_�M�c�ۢ���s��̣صGStl�LB3]k�%,K�YsG�\Z�Ei)�E�.F���m:��.2&S17x�IS�ǻ�c��˸n��Ő��ħpfNӕ[I��i�L8=��u�P�\\|����}����==���aPE��R�s\Z,e	Peu�3Zb�ɳ�eL�l�*�f��1I�H;6�a$O�46^<�]qjk��tG��S�$q�7[x�Y]�^��{DI6�K����%�i�B��Q_kh���5+��/���3�2�p\0#�KNueM��\\�7�EC@^��C�K��v�¡cb��s3/Q�P�n#$�bW<H�\r�(g�v��ޝo\"\\X�^���T�rP=3�� @��Xms�=>@A�����_���`����,�M,X�	ieŉ����66R|Xo�.}��t߉{��Q�E��H���.1[#m,�Y\'U��x�0�T_ͲF��6���_(\0��^4.Z��=]*�\"d�o�r?w.���ي���bB�-�h�ei���lʮgy�I�6���F	Do�,���#�$q��\'8�8��A��w�����NQ\n`��+�n2	y�y4�J�K��k�ܣn�\\���y=a� �N�c�����3;tni!���+bsP��YD*�4�G��i(UY/,z$}�X[^���`��uK�Uyg�������\0���j\"�Ǔ\"�#�G�qxFV�R�)�@��\"n	8l9+en����K�2�Uӈ�@��i+�]��ې&\\�$OR`!C��xR�u3eŦ\"��g���D3��Mӣ��S��p�`���.��[�U��i+��Gi�û�7i��m�̏-�����]^�>Ӥ��0@��܄x�\0�tk�]9ABG�B.6e�W:NHr6k��W�Ֆ-!*t������q���9�������g�2T�(%wQ&�������VbpS�I�k�Hq�ɍ�B���\0{r���<�l�s�c���ZV����������X4��k�\0�7�g�Xo�ʧԓ�U`e$�w����哼x����فD�������p�\\�z�!W�)ٜ���,aױ�@������=��1W�J�1\n��Yᛉ8Z��:���Àm�ӛ�T����6�i�Nr��FNݕ�����*���<ҩ	5�����ٙ��0�a�Ɂ��9~��Z���?5���CP��K^{�P߮�\nkR�w�1����oNOMQ.�Z���\"�����>�d����D*�Y4�s�R��+��Y��Ҁ���������W�C{]��=��.2��7F���BD[��ơ�XN�a!�	���;�)�wҎȝ����Q�{MY�ė��*=���6�R�Eco�H�3���Ĺ�v��#rMٞQ�*�;�U��+L��ݕ��l8qQV(i�z6L�cd�g�pD�c@z$*/�!C\'�,D�,HMq	j/;)�4�7��U-����Ȳ�=�٢���x4f#��\ni+������T���Ҵ�W��c�T�7�ѢN=��bXގܩ?l��q�\n�y��^���(x�WhT��W���|��9����4F�y�\"&lȞvB���#H^���0+�\'~q�<��1���7�ٙ4/�*t��0sXn�$�5�����f*)�T�7����Ta�7L7�����\\����t�Ɗu��К���:�97H���|�%B���س��v{[ԀO�\n�rw�w�ν�Wu��jHb厰�����Y�v�����<qmGg W���8�`���=��`�i,��%V�8���@��մ��I��RB,Ms�RI��$(�2�d�;ChH4��JJ��h6m���x�η���ߑ�%+{�S�r	s��?F��Ma���B���W1B05�p�u;�䧱��J�N401��\"���%�M�QFQR.;I�HLb���K`�M��]V�BT\ZxuRCV3i���S��Fܺ�f�ؽr3�\\�N�-t��Fi���Qn1������9�1��;�΃��F��F���E�R��6�v�Ɗ���v�,[T�f\'`/-���N9䞤q�����,�@\"�q��m�M�E�����W���5{ǘj���^�+�@�\0�U���v��E�U�Yk/����쬔D����/�G�MSK6핲�9���!�nŕ-��c*����!�	9���y���,�5�(pk��������3�E�ǳ՘hy:��\0{x�,K�q�tVQ�MI�j������^���`���fHj�E���d�\\�4��=Bo\\:\nr��fo��<�u��s�:6\0�!0�}�K}�1ņЪ���5��Z�.C�آв�q�G`+X����e�ik�Y��vbi����������2�}��\r�[��_O!��6���i\n)�����M�5L�����\0p~X��T�;#��Sd�Ϡ6EN���6g9�1�6�\"?؜ˏuҲ��n����\\2\0<�+�q^Kp�ș\0TD�\ZF��hVKçυ	M7+>ރ�B���4�Q<=��U�W�Ps9&��@:���Ŧ��.�\n:oyPo��º��z[M����}��ᲊ�f��j���d�?*�u�ʅ������,-\'���ʺ��f>R��@���$�za0N&ˮ�o�9/0\0�H��<dH�#~@���!LṰj{�g�[�ْ*7g���+pbn)ȓ�;a���c���y)*���tg%�0�5~�Mgv\\�.�P�+�Z���.�P9ȇȌ�/����\n&����Q�~P�{��4Z�.%u��C�3�^��e��OMC�`L��\nn�N�X���e5Em6Xk��f��N�^O�P�E7I��3�h7�a��|�ɴ$����t8\r �pͧ�1���k\r�p��5�(���	��XPU�b�\r]�0�^\Z�������y���u*�˵�\0���;�^\r�6�����\n�I�u#��֙\"K�m/8���n#�<\'[�^iceD�T��L=�#�G��*�/����q�R��R� �����xݰR���k��H�A7��]�B��XL8��!��W������E�N)B}�;�5�t!g�nA\0�B�*���b���%�f�hf�\Zx��F��Σ�e\'B�?p�\Z��LU����Џ䁿_�\'�ff;ޑ<:GY�#��dT�x��d:��0�vBp?U��ү;����4����P����.mW��`��j��uv��N�K8������j\'|��	0�[V�i/8�`��p���$�J��8�w��:����v�\"~W32��J+��ZOH��N�\ZVѰ�,=��.��\Z�m�a/�3���]��)�AU[�)�k|6�g�Ō���5\nâ��Wb�ӹ��i�*YF\r�ٯ�3C�D�7�� �Y8�aw6���E6x,�߫3�Y��w�#O�QU�D� `�܏�y~�N#eX\0��Q�DuhF�s[���\n�T�;�C��\"���w�#g+�T\n�hfѧYl���=F��IcO��ūW�]0UR�6����>�x%�?��g+H҇��-��h������X�1�Bsf��[�R4k��e$c���+4jW����/Ĳ, }��S�G�q{�ˌӽ�9s�@�|@���an�? D�O�r6�>Q~�x/c�L>���=�VE|��@��<�w�$�Ra{��@�v\r�ңl���c{�f����%�h\"�G�����pj/�I�2���쫭�Qz��U�L��9�pv65Z,�o�1�L����!m�1�����`��õ��ʦ�+��>LSMc{`�$OY�P��D�m�}G��V:0�.h�u��\Z�ի��`�If0E�6��к.|q;��\0�s��\r�0wn��\ri�p�\0�,�=u*AN����D���Й;��L\rC�K�$�W֠�:j�_�S�^�8��LiX���z	����b��K�za�b+t�CHk�<�ѬW�����(��-�!u&6�`���l�gƈ`[d�����7�Y@I[��`�v�X���-�s��[�k�1E }ʞ] �Z��SvyC���ݴ��\"R�K��&�e|�	4���$v�h\\�D��1vhP5��b�{������\"�+���0}r�a�\0�%㎑E�eD��j�:�l�2�(	�sy��ɘ���� ��{�@��i��\\�$Z�9K4�5�fj�c�\n�n)Dyn�\'=Xd�W����c���8,��_���ѥ�{Ӝv�Qh�\\���;<FH#W��H�-<X���Õ`�!(��F���+�1D��Yc&�֗�\\��a��lڰ�I��0a��&�1�k��&(Lh]*#�m��X�Ǖ�U,�\ZS|tl<@\\�����\r���#��w1��Iw�}�@���W���[܍u�W�{g��c)U!��hgՏ�axZ�x=N£ 2�|��VoeK��0|X��9�Ѕg7�e+��AÅ��<F��esn���r�QG���Vau͐G\r��UW�̶ue�Ҕ*+�OWb��\r�虩=\"7z���x�<�K�͠Q�:yl���ƕb�F\Z@��!jq��_,�ԟ}�b���`��L5������t���U֮-�S�a�C�1�0t�`�}��)��J�����G�1��{������Q��\"�Z�zQ\'<���u�kk��[.|qՖt\Zq��G.�4z>]C�Y����l���c=�dgOu�CdT��`��n��-c;Up�����)H����k$�O�+��~��s}.���گ+쭸�}�h(>䰟��r=�y�C�N-�2�T��l��ц�>�9��Ʋ��^ɚ�-����prb�E���pxt�\r,m\'�K��UǊ��c�Q�sw��!�7�o�Y���ԑ��9N5�W�0��#�>u�mH�g�<�x�4Td\\(5�\0�\0|1F���{\Z���P7�����2������<T��������᪢\'�ͱH����L�\Z�F�0�s1}�C���bK��i�؇Q�M��m:�D�r7�4�jVO[�u]��FԨ(XS�e�p\'9�&ŵ��\rf�ܶl��W�Y�g��:�fȧz:�p\n���.�1ދ�)h�v�yM��+����.rL�km<�7Y���P̴��b����óz�z4�mZ\'�Q�T]�AH{=��k���z�q��b�z�\0���&C��}�p\0�]qɨˬ]�|��>Im/=����:��Eh7�Nl��/7�`��\n����at���ODJt]ɨm[[h4$�Ҡh�r�$�$�=���ح���cv�QH�A����J^o�-8u?0��CK��Ӝ���(F��\\�d��n�3�S�L���[,�oY�	��m��~����q>ZQU��b}i�h�G\0f\r��p�xt�{o���+��[!�`����.�ש��AND�x�,��r�+�-\'\\�	�f\0)���pl9�\'\"��m�޵�S���	谳Lse2�3f^*;��X-#�����l ��?hp�q1�N\0�i.!^Wd�1&�^�\r��yAl�L6\nw��*5m��;�hgc\'�]��w�Bsm\"Z��Er6��6�)��P1/�ڂѥ�܆�|g}�񍤟��]����;�N��_Lq<���u���=>ϗ��������1%�1���L����]�2�%A�\n-�e���V��9\\�����x�S�����,�2ν߈}��؂*;tvXڗ\Z�{�DI������hղ�ܽ:F1�kr��6�#\"�6��uiΆ8�/S�c�	X��LF��	G�ԋ^?\'�;�zr�O��N	���uϯ{�Ȗi�]\"���b\r���2�\r�@��l�:}.u���b{��/.�Ʌ�Y`�&01�I���ܜi���G��\n��i��k2c!6��\\�`lN���eϒ۩ϧ����q�9�#88��]��Ǳ$��p���\Z�\r:t$�f7���X^�>T����*{�4��v|:_ef��+\rw\\�a�>2��pxM�^!F����eԄ�Q��h�g�wLˀ��7m��[l��8	�Y$J���?��mΏ�Ь1&��R��W���mG��ո�[œ;r��|$\'`�Wq1��z�6�mN\rZ&R(f��-H�pZ$��v��d&�����<\\�����m��E��X��R��F�A6Rk�g�>`��#�šE2鉺���N����э4�Y]t��@R�t�\"L�\n���?9�O7f�D�Z`�7�U�0��h�Iz�JMe��O��Z���)��.Y@��҅?V�Q@8��t��Q�,�J�t{���������Y��<�#v8�6�?�4D�-����ՁN�q���ȢG>��������U�0����|nyT8f\n��4�x����:A��ibs�Y��\0XjirPw��P�[Z<����;0�0�0ж�\r,4RՒB��W�-65�o���c]�t%�7.���� �R�b89��:�o�V��P��h��`��˴@ܤ}��x�;��n��>M$l��y�݂��,g���C��[Y]Ջ�ʔ�!���Cb5����\Z?��t�GS!@���d1D���϶�����L�~��\0��G��6��Dz�[{d�\r��|Q*��W���~���6ō9�,@F`]r�t\'�k��ڬa�q��`]�*\nqc����E�G,DN�9����Z��c��2��\"��	�Ax��I�\"l(�Kz(�j`:��Nw��RT�,ʞ�u6b�fWQT.�;��-͑�����@5�h���f�fkN��U���r,G#<g,�4#Ġ4�G��_<==�J�<�Qv���;yZD���5��V;����k����l\'S;��S3g_�����{�2�8S��g�X#q��#0����:�$�a�+�U� X#����\0eS�`O��b;Y��af�(D�V�_�{�l*6��I��`�*<���e?��Dg<�a���������3{\nW�AJ���B��#H��>������Z!E��\rf��i�38h^1%�!ݨ81���c�D�v(>�j0umlw?�Ι�B׎�M[Q�5tށ9}�c��{�v<,�<� ��n�ޝ~u��@ސI_�ZHR6�^��!9cj#\'��av���������M���\n<�h<L��e�w�+�?�=��sf��	���\ny?�8���,N��\0d�ɪ)�g�]�N�[[w�HG0�\\Q�,�0��y�}�\n������\r����ۄ������r\Z@�9Q�� �y�(�:���L����w[�$V[�\0��u;tD����!�e����� ���>�\n*	\Z~c�`33\"y��+u���(�\nU�A�\r����d�>/䏞�\n���h+/�\Zi�����r�ˆ��zvN���d�6P��C�l&7=s�\"�\")�6B��-wIF�ct�`���<\\�  4����ǂIW������Awg;���4�}�j�{<�%��(\n�&������ ����D�7����ڨ8{[r�#Ҁ�{h��R+\Z��;�>8-�����\"F|���=_���y��s�c7>\\�DD&tmOs�U��8�Z�	�6d��|R{\0����b�b��}X=���\nɭ������.R�g�cّam�x�\Z�(	�=Ɔ9_��E�;�z$��Fwt�W���ьz�\r�w����>�٤7����j\n�VF���gm[�Kk�q��\"�>�b^��[s+�z���2�C��;�tј���ŉ��iv1��A|��{���e{]#;(9<��66�ޙ\"�J�������|�푷#X�^sÅ�\"Ӿ��aA{\rkM�о�% ��亭�Y��nlM�q4vk�h� �Z�:*�����0�0�׆y�.�Ji��?�׉�c�-�M��P���d����Ӣ�Ͻ�)�#\n�n<�t��������{�<�G��>\0�m�����=��*v��%���ΙK/U{0���ei	~=�B�-�SρϤ����N6\n+�t�+m�\Zh���z��\ng�����n#�!���V1;���^E�2#N�B�fY��ܫ�Z[w���Vdk����/F�\n�[;����r��[�\0����qxv`���q-��ύ�:���Oq�A�����#�O�?���8H>�-/���s�e=$\Z����J���z�\Z��Z�ࢇz�F%uŢ�J��Sm>��@��#e9��Z�����S�o�1��S ��҉�~	geڋ��(�����U�[���:�i<���7��٠�ڣҏ�@?k�͌���r����L(�ǚ$ų���RP>�e��CUe�dY&�C��9I��DG=\n\ZKK���N�a��W9PI���|��;0�9:��Z��f��w`�;�ֶ\"�wF�{0{�s��)׬�&��{��M�14�ј-�T���\0w��K�kQj1�P�[��*�����L3A@�n� ��m�t9�7�״�28(mB񍫤Y��\Z��sk�\n�_TI��:�ɺ��̟�ꈄ	%�/�3u�O:�i��[�	⵻�D�V���#�!,Ô�E7���7��$��A��i\\�ߝ����V�Z���*2��XF<�{aY����s�U��#�Y���\ZP\n\\ڛ�pr����:���g������9��cM�vO)��$S]���;�d�ë�\Z���l1,k���#��Mt㴛��5\'fGȈZ;�uTyJ\'��jUK��Z�T%^����򫓑\rq�$��C������=vG��Q̈C3V�-�`�dЦ��0\r�9�㠖F��j�����s�$+W�ݦ��m\0�֩��DF�=\0ě�t����/|^�;�f*K7�|�n�\\(��\0<P�0�\Z\Zɛ�\'}$�c���f�/�ESk\"kr�RV*�a���K�	���L��\0�dR��^�H͹�1�R�r.�c�5����v�\'^��5O{}s�>�+��T��)p+�e7��s/G z�^5�	|��F���}�〚N��f�5�\"M���-`ZCY����}����>�Y&z�V��\0�x��Ī�߳f4\'�A�b������t-��PϢN�F�4�B��sf!ƁP����F�#����`������q5S>\'x�曛�-4P����5@ >�M�^É\Z��TU\Zm�d��z�z�\\N����=�-���W�<*��k�h>�F����F��J�2�d;�-�\"��s��ӧN�i��i�\\�s��;� �%�t����4��,��<�Y7T��� ׉Uwp����@�.\0\']��\'�N뼹�g�s3�fd�`��#_f��&��gg�+E�wd$\\#��U���1�S��[�%��=b^<���M��\"*B��֠���N\'�>�ґr��0R���͞�\\w*s�e��\n��`�T�\Z��eh��!(�������Qm�n��0=�@Tݖ>��hR���Z�嶦өEZ�(�kr�rB����,*�ց���i���}bO�S<�\'σ�kq��9��fWٵU�i�\Zw5n�.`΅���b�P��׏:��z��Y^��NF�R�����Jr�ʾ�\Zo�<tc@�r,8$��\Zc��	�m���&��5m5j��J�f�ڔ��iIϺa��\n���N��eQ�A��c\r̥�D�:T��Q���b&\Z�^�F�Jh��|֌Һ���M�òڃ���2C?g>��g,�t��h��������JMg��vAe:6qC��<�*}T.���>\Z�%Z�Ր�)�&��<9�c9�^��2�I-���>�)9�6� ��g\"����}�@[�\"�`hD�f������1��n�nQ�4i4���F��S���m��6�ߪ�Ѣ����^��m��)��Z��k�(EFX!/9^��j()��%�p\Zp�aی���s�{rE�}�z���Q<J]�X�u*oWn]��06	hn�w�q��=u��κ=�<����1{I�T�k�֠�/�mJ7��y�Uǆ@l�2�s��� �����e�7���}�w��\'��R��I@D�U�Å�n`w����Y�c-�\"rٓ�|�L�Z��z�i)�1���BЏ�[\\N��B��Br�LΧ��i�+M�C1��6p��¹uq���W�.�.��&�՞)��P��vU�#(��_e�ZGs����\nS�yPIft���R�2�g�\"oE�؍R[�\r3s��!�D@�%�\0���u��`S��J�|�1����/m\Z�����6\n�/�\r �%db�m[�9�qJ4��o\0�z�屰B������Y�g\\q����H�7�a����h�ա[���U��@�\r��!�����H!{�=���;���.A��7E��1��X���!��)��F���Tٜx�;+Ĝ�2L���`{�� /�qê�E\'\"��N:!��W�L_w��(��$�=#����t��d�VsQ�pĂx�Z�0_\'\'Fw�\n3�\ZK0�����6�\'T\Z�[�=����H+,?4)��Vw���U�t�L��>��H����(��+�0�ӎ��*d�z��͊\'0���D��7�xu\'^`�$��!�V�#<���[�spV��W��Vtҥ�g\0n]+68������5����\Z!��\\�R}f@�FKU��1{>fF��EE���������ڶ=r^Z�\Z7p�q��x˃!\'F�CUgּM�\0.��1��{\Z/�)R�L>��r\nAC�&���̃��u�ȑ��p1:������}�!6wM$�l���ܢ���B2�-���؆b�D��g��Q��D��?���c)g\0���\nF�U2��K:��}��C\"���6v/�\\��Vs�8�\\%���V����u�QH]�t��t\r����z�<�{�6x�hp�ȃ�U�}�H�z����Y9w~��N����x��9ow���h���҇&i�<_\\��\0�^�C�եx����{�آ�rDט6e��z\"���7p�S^�gq�B�MK��TX�\"E4W� ���C�L7�[!�\0h��=H��h��(RK	��c��+d�L���Գ���[���_�|q,��Q\n�j�`�;�$b��׳1���D�gм��ז��T�b�]ö�	��Zq.��swt�dk���)諫��,�E�c�}ES*��.�v�o\Zs�X�+��#m��c��9 {��=��1�n[��i&� Ҍ�j�6�T��T\'�D�[%A`i2],#��_, ݐ�ihY��ؖ�d ��qk�3»̏I�S�i\'>��R;��=���~�@�0�E�\r�Zyd�Q	���L$QW� ���C1�e�\Zn�L�5S���g�ݽ:g\"�F^�r�ܟ-c�בOت�RM;M{�ȶo�Uԟ�}l����݃	����G�U�ʠ��\0ӣ�߉�Q��H�!Q�|�H$�ٰg�^��t\\�-����``�@���[Q\'}����k�jGK<�XK���J�$~�4k��������i��Y�g_s��\\z3h�y8PHz��p��Bm;�$�#����2�^Dԍ�p\0EX�z�&�V}�4��$c�r��Is�Sv8�!TdlI}؅�����|<�F_����u�W�7�BX;�̱q�uQ�b����,��|���Xw�VuJ\'��#SW_Dw�����qKt�ikhX��]�ņK��Y�Hs}th	v�(Y�z�|аf�hx:�<�p���b�g�� \\����J�@Ҟp�Cj@?>�#\'���y$,A�Wx��⺸]Fu*�����U�ꐅ�l��;�!�w3d�|���s���ZW��֎{9�>�/G~�j2�P�������M���{�ŷ�����e]��z���s:�:4j$\n��ҡS=oJ4�q�E�V%��03�S�a��y���?V���)��fr���v۲�jH�&���@���4Ƭ����DP<SH��U�U���rppʶ;%v��K�![��3I/%U��d/Z\n�T)���7���U��I#,?�����c\'��CO��{\\KI�Gr����:N�m$��ѵ�\0�����F�v����9Jr( #bHКpk��Ȯ��Z���H4��؊�	 ���&�\"9�̊���Q��ȒS]$�����L8.wW\"[�~��z<�8���t\ru����� g���9��EzEn<.HW%>�dJ���)�3��\rd����6��K�L�|I��L�v����ܙ��3k�.Ҡ���RU|m�u�cq���P\0�ȓ����F�:^R��n=��{1�?4�_���b�1^~�E-)<��T�\Z�<��������a����Si�Y�*V�d� �S7j���\\V��G{N�{c�\'��mT%#���g�b�I���孛,��j���X��F��W�2I����%Ƣ�̧������w��@���k_��6��MK���E�A��a[��;�C�����]��e���1%!#�c4Y��ΦE�\"���S�����ơ�,>�R:��k��7\'�4���\Z�-K����H�k�n�0�z�3%�L�FCH�٠�c(�Y��~��~��Iw�[5L�.hQZ��yvR����N���Ԗ����z��(�c��PP�`|>_,D�|ە#�͆:UѮTO�K:قE1P+=��o��|�,g�;�9��_�y�����,�d��j��+�-��4�t��S��a��@d9U*r-�d7�]��iYgKՐ��tt/\Z�Ub�<�sC�\n>�dR��E�RFF��2O+\rR��Vw���W0(8I�>�T8�^�XJn�]���֏����l��!S�;�\'���3Y����]Qӏ�!�ˬξ9�]��Y\'�g�8����s�s���f���rqw6��\0ܺ�,g�Gҡ3���?#b0F��E9�&�^���n����0o�(��n%E!̑�\r��J*$s��.\ZNU����K&	�H��7I�+;3����Q�eI�-~��Ս�j��]�\\���)vF�pd���bK�[�X���ѧ�AW@�I��%���\\7K$	��$��� �w��gi������6�%����\0��CDA��<�X�n�p:���+Oݣ��$���woUE�n�$!�N�J���b�{�1����c�A�*;�;�\0+��t�s�RU4;P�~$��U�;\'c�LIp(f�J4���/5}���De먝ZfS/��-�znU�`��:�g���\\�{.OJ���s��\'�{�}��;%l�hZ��̖E��;R@~YZu[��V\Zqc�+N�\n�_Ob��-��(A��\\���θ�\0e8FQ�rD)T��z�\Z{a�8aԮ	�h\Z������:�Ӽ���7W�bRC����@Y<r�s�Ό?^q�jU��d𑘤	�-7�aVD)�������� z�\\�\\\Z�	�y+���[=h�E1�Lj��hs��MlC�?Ǎ�){m�����2ɒY�{�c����-~:������9�D�����<�>��1�@)�Ɍ����4�\0L^;ח�8����E;_Ήt߃�z�fx�쨖sfT��!�n\'�2�UU��tv+ӊ�!\\\rT�/$� ��H�c��\"[��&��M\'kP�:Rq��QE�H�-+������TZ�D�;86.�����`�_��;�kC5iǚ\'P�9qa�o�Bw��NVL�]<�/\'_�S\rysȔ�ѱ�c\n����c������Ǫ��=eo\r�A4Qh�rE�ȹmKFB���x�-!�\\����o�H;�t�T:[��8b�����<��@���֫�w:-��ͥ�]*ȉ^7�$+���C��ȠW����l�&0>\0�Xk`��a#�)8�[Q(��x*X.�}�����\'�ʫ�or��Ӆ�񽾷]B���tm;�N�1��{��xL8�_N���\0y\ZV�U�;��ZH��-;<��m��>�H��|4O�a��(W��.�u5�\" �\0�)�F��Kr������;^u�z���z2o�q�e�.g@�f+:�Q����\r�U�\\xGo�p��HC}����жF�v7���?����8[�!(���zcz�Ko; ,6�r�\Z0xq��ЦZH��1�e%q[���M��+8��)k�u1�N�n1E.r�9^�ߎ��Q��7�����5%��0�\'@��x���_\r��T��3y;����)9G��OY&ju03�9���FP���V:|�\nQ�%H��2u�=��ā��ף�vW��;<fP���e��W����L�,,��Y-�[<�=�L��m����	\r�\n�}���\"p�\r�ԞJ2��0�c�񀸆Zp�UM�`���U��MF]A`PTVV1x<���4���jl�����ط$IYń���1N���3����T���vp�j��E@��;���r[\\��9O!#�_14�e&�������I�o��h2�����ϦV�[�|v�G�,�Z��<Vf;@;v��\\.��q5��%B�����\"+u��ski��5��F�me\'eW�65�e.X��T�i�`��z]B��6�zV3T�?�&\\����k<��Љ\nĖg/I�ǌ�W(�W0�{��4&����@bfrfBkdi��Xԋ0떢UB�\\�ay����@�7�)��v�N1���	n�Kⅱ�*:����2q��M�hQ�>�:����18d|�����$Ei�n]��ֈ1�Z_!2e͋�2��Y^����||�A�J�<�@�|c܍�*���9��6�k�Bɋ+>�X_lK��w;�`KB�����8����+r�0�޼�^�vݒӖ�>�N�Թ?n�o�%�&I���Ŷ��㻅�\0�0�q�]\'�҈(�\r��l��+i=O�����:�q\'U�ȥaƐ�g��5�3��A{[�fG��i�>N����zүh|z�n�Z��EfǷ�`���b�{��@N������zrq���k���[�j���/�Tf����0Ðw\r�D�d��Ȁa�-�J)Zͯ(϶q�8���1\'A\nsT�oh�	c���^��g�)B�rPD�tq�-�)�{L�fk���4WW���C\"F�ai��t���D��� D�������{r��و)�1sf�\'�%�0�D0J�VW?N��zض-�&�������-\"gy>	=+�j�f�5u��mG�mm�7��ו��$��镣��o�0��|��:� s��q<r��&�����\nd���LL��M� Y@�d ����G8�sc��m��-(tA������ީCH<Ǳ��j��&��(\"(�e;��	�*�Ql�#V�ޕ���t��}Vs�Aa6� �]un݀?R��.���0���Q�g<c�Í؝U�+P�����1@�}��q@#*u��&)Fk��RM=R�����8ۺӏ���ǅn�G`�IX1��T�kmݎ�Y�U���vZ|&G�+I*M���21	c�l�U0��@&�G�\n,�̊�|i�G���ƭL�]o�՞�{<ci��,�{Dzl��c��	\r�ud����)q�\\��kׂט,0/��e�����X7�l�d�A֛آ�|�i��4�l���;w�6˞\'q�-�f�xt.�I���C�����[?��s& 9�~B,��p�>�A�+o����0�Bs`�ґ����~sJ�0MdFF_��I��Q+�>N7H�31+��˺T�N���v�=ƁL��v���	\"\\�>��X�|ک���>�#kO��i�m��:c��ܰ����s��pf�P����\\�|�`γPbw$p�Km�(��V�8k�5r�X	S��p�#�7��r��x�����|/�]=V��>ݢ_i�Y�=���?�<���A�V���޴l�>Һ���_6E���=L�1���(�������W��������$����\\?|����?`�E����/b~�=�I�מ����kO�X�\'O_��~&����i�U����żJ�E�\"ͣ�N�w��df�#|n\\F�W������i��_e�N�XΫ��i��y���;:����t����<�;���i�3o}m��PW��޿�y����������¨����u�����9O���g�]TxC:E�4�_���$J������0��������GZ���/�h�����U]E�P˷����7��!����G�|����\Z^�>�_��z�}���=��޼��u��E����K����~���i���~J����R@����^?~����Fn�wQw���o�=�B_�L��|?�͢��Zڛ�s�aN������]s�5��[�C��A]�ݯ�Ab$I����޿����+K�!�썋g�(|7�om�#�8����h�;/L��I�G�\Z�w�o�bvď8��������v�t���Y�Y���9�_����hϱCݭ�}dݯw�/��5�rw��~-�]� I��#�����힁6|�ͧ^���8{(��񼼎��~}��G;z߽\\|��7��9i�G�;���)\\���������/0�����i�=�P�Ry���<]�w�0Eݐ{�}��Lð�>Ļ���<���!��(����÷&��a}������|�wveϿ&��Q��ͻ���]�忾�����O�y��7Q���~�{cq�U��U\n�.�CƯ����#�Kؠ~��O6K��������n8�g�Aз�~�@\\��o�+�%b����������~����j��}�	�_��wm�O/ִ���/\"�7��y�w	�Vd�+{��ܧ���0�MP��1�z�\'��y�ϷobND>>O����%�s=g*L����=��u�+��{�~	ѿ�F�\n_��}O�;>#�w;�$V�M|Ic����򍒩��2����D�,��w{�x�\nU4��}��oo\"��<��_v|���=��/���@�ye�m�{�7p�Sb�+D~�\n���O��eN\n�>�ko�o����ע)\r��M��|���/S��w_����xL���t�1��l�Q��F���I�缔c1��h?����wG��5�������>���=	��xE�1�O��?6�]�	����������	���G��h��ɛ��觍ߚX�U�o������r�O���h�=�?��|��~X����6�k9����Q�����=,Q�F>G�W���C����Q���%>~N��{��/5�k�FA�y/��b�s���@0л�Q������zN�k����T�j�`6�����/�����絗���z�;��kh��ő���E���}S��ƅ������-���{�PxK��Ӫ������Y���ϙx��\0�����\'����_��ǻ?�췯��?���p�Nl@��E���T=8R�.я\"��x�������w�|��%��}���J~+wy_)#�>�ȗ��e�K�Ŀ�2�%e��G���n�6��W���sH~E��$�e��?r��3W�#\\�����(�_�	�����P�_\n���(�_�o����6�ī�Xb�i(���ɟ���xex�����?�?�_øׅ��,�+�.�Ĺ�r��2�d�/�|E��g���.�P�� *���ϕ��wM�����Wh�gf�{%���ۥ��+kopß��A_ȗ��ä������j�j��e��ޯkPm��+��K��o�����<�$�������z��o���\"��&�o��,��\0�?E��y��G!�����oW=�@�ϋ7�?s�����V�~���l����2�C�>�����\Z�S��p��|�_���ȿeП�ο8��F#է��p��}��?���3�v��*|]�zDow�>b����t^�E:����)��KU�o_b��?��:���_���ð�)j/�cK?t���L�f��}k�J��S���oM�>7x�GST\r�Ǩ�]����U��N�z�I�.��F�ŀ�}>��|?<�����ʇW*Ї7k)�8�?`�\'C~	K�߱׉|����w�<%|��G�~d��w���O�p����)Bh�[!>�]a�P7^�믿�}��h��6����OL~��W�v?�����Ěo���0���aW7a=W�}�\r�S�ޚ��4���s���;��]���|U#�Y�(�s��8�?~:��S��z��*w�]�r�uw����/Yye����TowbtX}sX����]s�C�I�o�e�\"��\n�	4�\"{ȿ?�s+�u��������ø>�������e/����/�~�A��e�?1������������ڛ��_��~��B��(�B�~>E��i��)��s�st�ǌ�����9�O��f��%(}{�鏓�g�?����I���yb��L|1?��&>b�W~�=�}�`o��>6�ev�m��>� �t���a*���?9��B�����{��y�|<j�x��R?���.+�>����> �T��\'m��>*�`�>r�dn(FS��o��n)o\0��d���ŝ?o{��.�30|>��͡����4�/���0þ�Y��xЇ�ɏ+�2�����̟��~$����~�D�����S<���O\'f6�O��>���1�������\\���͵OY���Q�>�����M�쇯�5~�<2ӿ���w���F\\?�k��>a��T/���s���T���2���Y�èϔ�ő�Y�0\Z�����������~���O�B���5�ܖCox����>ȧ��G���\r����o��W�����_�@\0�#�D��w*����Gw>�:u�)��Xͽ�ї���G��zG/ ����?(�7��?�$�L���ə���r�˖�\'9�X�4i����{��ݓ��1�Uv�{���-�#-�8&�����_`�_��߾^zʨ?e{��#z�;��+$�e�oޞJ��,>n��d�������j�����+��rW�k_Í7����%(�q.�(�q��o�8<������^���9�|��?�y�������?Uė�˼}�E��\0����wk�7ke?��z�o߿���-/��|�s�����\0',1468278924,NULL),(8,'gh5esCO0id8G','phabricator:celerity:/res/defaultX/phabricator/3010e992/rsrc/externals/j-1TBv7Es48.Gb','deflate','�V�n�6}�W8~0%ث���E�Z,�\0�\0�a�ѡI���f�{�CҗX�>͍�9�C&�F�Vh���X%;�\n�����p�5��*�v�-3W���Pϋ���ic��\r{�x��Κ(����i���!�i\Zo���4zң��|���˄��fÕ��i7�����q\r�<.l�Ri��&q;�~�\nqۛ^r�lK0���2VU�5Q���>����®�E���7D��2)I�c[�m�6���I(a�! �X��_,�����gDMjV�����9*�r*�q��a��f���K_|��--t�m΢p/���`��E�2)n�����r�=\0��C�;�v%�i{^����5��zC�-$~����F�(e���5m}r&�ϗ����=_��D���B����#ǋ�5�h���2�Z�i�Cye�_��ZY�`�6p�\Z��#����I�=K]��F��w&\nJ�mk g�~�����[|,|�v����z=O��ݾs��+,jq��;���-u�d����P�/A�^���ͥ�_n�L�f���K��F�3��o�\Z�l,�U&�`�}�4��Y����B��@kp?_�3�x�lGue�;�b���z����fz*ĥܞ�Ϲ>\Z�s��r�����謫$�a����d�\0~�����ܩ�-%������ugq�i�\'��qF�s�{�t{���p�^0$.~r~�\'.#���su��Z���vHy�%D+2����gA��cMg�E&�X�(�%S��9^�+�_� ntSs��*�z��^n�wS���(T����\n��3,�qN��my�C���\r�V7y	�����۽��\"�9S9�����n����0B<��\n��p����\"���7��`]�Ƅ���n9�\0�*�D)\n-�����g���<�:?_qX�1����Q{����6�w1�Vv�}%{�\\(�W�W�_!t\0x\"~ {r���팽hu�\"�\0P�g2��؅����h�#̬�B�kot=?�ǩ�O��\'\'1��E-6�����G�����GL�K���z�Q�ޠ_�s�\'pV!!?����<�d��3���r����u:�������SS�5.�\Zs<�p�h�D��-E�����!ܐ���AK���*�a\\fˀgG7��w���De�8(�\n�OC�:�V��Ԣ�Gݘ8�����R� �_��9����p����Ew�A�t�K��?',1468278924,NULL),(9,'RMExLOBCumOY','phabricator:celerity:/res/defaultX/phabricator/1bcca0f3/core.pkg.js;defa-h9OFOkqbKEw4','deflate','��i{G�(\n�_���\0�\0������cK�X\Zoc����`@�H�h,9$�o��fFfe���=g���~�\"*��-2222�W���Eq�����|־*W��yٹ}?Z��,f�߼X.�K�1���h:-�óY�\n���{P��]N���b�ݮ/���r� ��|����;�,�Og�:~TUq8��\'\\�7-g��H88��.{���B�W�Ig�]���r�Zj5�ݜ���e���\\\nU�����M�����ۯ�-�\n�W����F��Z��G�X����͢����jvN3T)��G�\"�\'7;�/n���k8Y�s��Z�;�:s���f���Z����T��fL��j6������:Ǆ�j�L�U����pH�q0��`��\"ӊY�P��	H���f3�|��z�^��������j���h��-,�Zͯ���\\�֭j՚�׭QK��2X�-��t���҂�G���U9[�:�մ\Z����Q�D}p��Rz��bzC%�c��	L�l<Z�	t�c������ww\0��CN�R�=*�=:/\\J�,oV���6�h��)�ޔ%�Ⲷ*����GK�\r`�������|Z��E	�����[��r9�߷_��|�&�ѹ\r+�P����ˏ�A,�`[NW�n0UPn#��9�w�S4\Z�Ca)9*�.��l���Î�d��r��)+�~\"R3N(�F��A�)W+�4-F�;��g��If9)\'�e	�,G3@w,���P[��z���Lx��l���!��|>�Wަ��S�T��g0[M�����Ü�$���nX������C�N�Pg��\n\'� {;{;�n�^��g<	�Ϊ�0�7�ֿU�)Ѕ��ˬ��(@� ���f\ny�\0�:m��$��u����s��I�owz���Mu�\0��j\r��$��FWe�?�mf�4nMŭ��!U��S��?���A��������e)�c�y1Z�,.���u\n�Ւr儨�C���g�V�󽾿[����O�ؿm�A�އj}��-8��ozP���K���}٪֭���g#�c���|6�V�I���@g@�w�7����\0骧�v�tx���ㄙLL��1Y�w��F������tZ�Pj�)�rpPU�[V�� �r|t�;���(g����W=6	\'x~��p���.�[�=\\U�Qv���VU�;\"E�\n�iAf�rZ������M]B�\0T�	����W�:Bd� <��0B��x~�����=B[(�*�q��Б��Ȍt�`vb�n?\\TӲ��/��w*���B��ww�e�\r�Up�`�{hkR�J��6��������+�uU^��K�œ\r?㮝R�#S\0?���і���tG-�����؝h��^ى��%�JoE���@�fn���*�\'�,�7��r�(n�6�a]1��vM��l�.��hm8}�zƏ��ذ��\n.��f�����Uo8�&�a�\r��/\r��A���n�,�^/���M�ݝ�8ww|�t/���3z��eV.�ޠ�K�FQ�tw�_xD�T?�h�0���i9dOiJ�,+�0\\b�.�xLzg�h�|���Hp��q`0��,hQ�8K�~���D������Rq���d���T�e�F�0��������&�ߵ\nSߧ�W�=�e�h7P�Jeҥ��-}��ǘ�2D)V%\\m�������R�3nc�I�^�HL�kB:$����}�HO|��n����Ѫ,\0�/F˯����O���b� ��9��ٜB����D��F����%Ϧ�!j��3���\0�:)xrx$�}��mv�����t�qQԨ�Z�G��j\n��W�a���-�4�RJ�P�u�Y��\n��&��@�Qk\n��/\\\n�{c�HC��h�\"N���Z0ǄD�֟G�\n�ϊ�C��l4��/�9���x	�������l�^�����A>ԕ޾w�!m�Dư�P��\n���<,���~f\rI�M��l���2�00�`ݚ�K���j୓�y����\\��}VA�((��x��n�5`5:+�7�Q�G?\"\\���Ȏd86�D���,�\nE�\"�̡\n�ÉG�Ư�*N��r%����������^��ڽ\Z����j�浃�Y\0�5(�%���/竕����L��*�\'���/�^=��(�aIa�Ji��zs�Ȋ�s���v�����@u��r��7\0\Z�\Z.��G�%Q$���Ϋ�u>�1!�� �c��q�D���� ��~8�k`��/�IX��xD���qAӢ3��\r�,GY�T陥8�gV9��rI�\'��M�;Ѥ�����U�[���VU���Zy\'[�1�c-x�=w	E��Z������ٹ��h>��k-��~�=�]\n�VR����;����T�=��;_�I{�ھ�a���m�_9�XyC\"1�[[�ʜ� �Z�r�>�%.�kƄs�p����\\��㍐ J�/�&�6�=p�~R���pH�9�в*b<��ȑ\n�~~i�$�}5�%�	�,����u�JX&T�C��c�H���JBp8��\"KXZ���\\�z�T����u�aڲN��!�OH��ܯ��g�M��+�t�[�W��Qg�\\1���Z�F	g;�[��h|�O�vn�ִK�ӎӚ�\0]0܄����Y����m�G�Q�[�&(s��g��\'�i��[&�ל^�\0����7�U�D��P��B�<�7)Ϫ2�7-!����\0�G?�/��c<�:�,`D��������Z0�KB6����i�\n������%�������(�|��&�\n��u6&�[8��=�w`��e�r_�3h�^:�+l�[}:�m�Il�b���L�gy�ďf?	�A�{?���j�L7+j�\\�p� y=�n;�t \r3���4ľ����Y~�B���z���X��G�{������\'|��Q?�zs\n����Q��Gf���r\n��א�(�@�N(^ȅs��1�?ӽI޽z�9�7�5v(L����s\ZztYM��Xn\'�\0\n�����׋rׅ+o:�=�@�}Om{T�72}5Z/�^?�O�`T�d^�~��/�_o����A\r������(>��[�N�~Q<&�?̗W����ͪ|�Z��/�K���ݭƗY�(Ϯ��f�O����H�<����vN�V�K��ul\'&��a=���!��k�5^/��n�g�C���&\0ߗ�|F�	�+�j}��<EZ\\������ZZ�GEt���w����_����+d�c�\'{���m��� ��i&I��p�=�a���	��1	z�[�T�\n�Dq+8޿�c?�Ǟ,��~��f��a?c���3����Y�\Zg�g�cZ������A�%�,�j����g�9~��?��s��_h��־��.��89�i��J)����}��$_1����(�s�3����~<�D�	���|3��-��!�	#\"԰/�L5�z>E����Ev����O����~v\"Is�~��/MW۰�8���֘�)V�i�D�Wh�\0���\\4�mh�)*m���Ds��:�g:��!/���b4�L�܃�\0V\0&SQj��>��!-&������PY��k�/�L%���a[>揗�Iy�?̙9�l?�����c����\0�c�(�������0��4׼fr�:!g�X\n|Z�l���X^R�b~�V�UԸ\r{����j��8̯oPO�7�U�+A\0���mo(�8�tE<B�(6���3��Њ��/�9r�\\����Y	�}ām���Z�O���M볖�z7!�^�#:_����@�2c�t�\Z����.e�jB�;4~]�`V�f�sKx��R�b��Ò�ߓ��\n�΋+���t�Q���v��u�֔���LJi����3�ˋjB\n���a�\\�̦��$:���<��V,{��ϧ�}��N��K;!YE��˻w0�w�����{gH\"�׻w�_5�JH�V�J�:��$�9�&\'Ӊ\'R��t��%t���-xppY�\Z`���K|@Z������Ǆ���h��$(o�\\�u��b:��nkC�k�}��Q}�1Qx��.�������j8��S���Ӎ:�1�t=V��^�]�ЋsD)��U�9����T���0	��e��+%���R�߳�%��Iẓ�2���9ڎk)^Kn`���k���&�f��/]&v�f�Vǜzҹ�%�d�2�mb���U7{R���-�0QnIp9˔S�k9��^x\rg����X,�?�N���QVs�z�/J$�����Z�_LK�\'ww����5�/�����M�!g��0�c1<��L9��N~ ���\Zy�]��.s�v��#�t�~���}��1Ҷ��\0����r���?��|ι~��tJ�jB�WYM\0b5�W�n���j�*]jg�ht�@FG&���J�C�h�v,lm/J�`;R�8w^�[�/R5��JtKT�!s[��8�]�-Y4 �\'��W�H͕r��}Z	�S8!�APp�Y�����2����!�Ȋ[�	�Z��xG������]���f�t=5�ߗ¢��fm?��7�ῷv��?��	�N�1��1U;���dj�J�:`ɐw6�ǩ�����g�mbg�K(n���+���\\�u�ۉ?�::�Vs=��Ϥ��K�;�}J��=�<��.�mG�(/����B^���%���	\Z^	�tO��\0��s�v:v���-���=*�$TD�����*|�������MQBn82z:���ā���1t��*��<-����������r>_pl��\'\0�=�ٹ����M�`�K��9\'4~��h�?�L�;�Q�0\n�:�O�d��SpL	\'E�|��v���h��q\Z��Y;�{w�)�݆Ilp�-�6�. j���������O��O�s�V{�{{y�K�����#�<���?��Ӑ�}�QOavO��0�4KK\0=�jw���/�Nd����9:��T��bM�>�@�C���8+�ݕc�_��~9�����F��	�\'~%��X�i=8h`Z-�42�edۿ�_KJMGS�s���]zp��r����ɧ%^$XMs������\nA*,O}_��W%�P�{�0/��ǔs�{���w�v���z���J��8@I2��������UԨ�r��YGp���#��\'���=�/92C��M�M�8���͜��p�re�FR�~FN��+2&2@zV��I��A�b\\���7����9V��\'���[��ŚH\"\'�L������7�.��M����ٲl!m�5�+<��� o�{	i��F&�Z���h�6C���eK8u\';�6��R�\'�1��J�q�e��?�^ЫPx��O��p$o��d�Ϛh���e5���L�^�\n7׃-_5��Z�N!��\"�T��צ�S*V\"^���n�~,����{�o�R���U�����gL���Վ�C�9�{��`S� ��c�=Ih���I�S��EFc`�V4-n��J��I�����߃��օF�Z�e���\"a6�9�NoHܿ\"�?��͸hNϨuZ��:<j�j�����+4�=Ezu�Ra_Et��쑻>�\']J��c�E�Hr�4m\nZ�<;Bk������o�^��~��h�U�6�cH����?��V���H\Z�Ņ�.\"j�ר�\r���J���M	_�К*r�*���*4�o�k�b�-�=�EI�\"xʪ䀽��h]~/`�E2m���o����;�i	SW͍-�O!G��O��ZCS�7�_5Q*�8��d�TAsY��m���9r�K�ƅ�w�`1���jF��9�&��9lU�][�=q���%���������������6#QZ8ߜ&Jd��qRJ�L�yV�L�v^��X�f��Ɏ�c\'a2���!S�y���-�Y�+Ҩ&v�����j��eo��X��V8�-�BdQ#ߖ6�}��\'Jo7��\'�\r����כS˥��:_(�tB{��n���3v3\r;з�-�\r��\'lKd⻖�-5HX�<��� �gY��\"�R�/����kH+�wX�^u�<�@����-�l�cq�M�T-݌G��@-�ى\n�Y~.W��r\\Z}�!>��D��-�+��\\�.���K�C\0�F�\\���\rE�YV�&��\0k�>�fu��b�n&�u[A��5H�T��`��B�?����a�IڕJ8m%���Ӽ��\r�X	��Й�ɔ�RA�U1��ȃ�p�.����R�\ZhW�MA�m[��]�I��.���j�u\n+p�~��������@z�!�j���#�B7�}�ˡO_lIjϰ=���M��D�^A�gg\"V ���=�ԆX!��wCU�Z��z��-S�q\nl����m�r]ܹ\\$/({��Y9�et9�C\r�\0N��	`��Q���>�X����b4;/c�<��\Z��!z餌\"�i���4��ؒ�G��>p�HVc��͛�9�ⶳ�5q���F�l�좚NdB܂�%VIQ�Sش�X(�S�hk�2�`\'.�&�bY��,�|���Lf�\r&2k��NU�g �VF�e������/gp�\0���|:��}�ԥq|+�1hЯ)1b�ٲ�s�bQ�u���&���)HN���e�~�@;��#��{W�<xG�й�&޽�&4��¨\rմ;]�c�r@չ���]~ĎP�\\�\0FeZ������$�C�Zs׏$�� |���o���S��\0�d�:X0��#K�gl>��B�>m[�{�x��k�	��~�ڵJ�#���Fz���]�k4�-oN\Z��w����r!�υu�ċ\"%���-���^�e��r�\0� �ϦH�i�7�=�%��W�{��n9�.�!$��.ڼ4��%�M�FT�@���>%#�\'h@��at|ю�n���Ç�g(�`�s��0�G�F�%���U��Ku�B�#��n�ܽ��I�Aǲ}��L�3��њ�����K�<������?���/����߳j=E�����s��Uv��%��/�����O�Z����)��C�V��&9������K��:�fo<kk�3n����w߮��R���gp_�Q��W6tkg߯����{X�͛��R��Z�@�������g?����Ǹ�1�Hv��d���3�����V^�^0���:�Z$/}>�\ZU3�����l���i%(���T$=I�:����Q�l��	�&g��:\Z�l�;}��X~��<?�W���]���*-��$����l��En��Ij\06A��Q�G6�ޠ�[�p;J[�^�;���Z�a�3e�D��]P��&�{�uE��@VY�K2�Q��uE�`ZR��W!�)�h0�ƯЖ##�S2���ay7P����\rpL���ߏΦ�`央\"z0�z)j�A0�M)_\0WIi\Z^Hn����|�z�=}�#P�Բ�Y ?�P*���ӏ��d�H����P����/�D~�+�ʂ�g�ŨZ����2��#:�z7�a!��<Q�~��\'R��v�	*�,�a�{ɿn�p�^�K橖�fb�g���a�N;h�!�DGA�������E3���\r	�m<���K�|����g�Y���~ϝ{ٍ7�{Y,�1؆W�����?�������_���7��{��������el&�E�5�݊��%���:v���Ν%|��hHˬe���k����l�EEJ���C5��G��>t�k��n��c��$^����Q�&Q|bzr,�aN��fR=ě�Rh�Q�@%�i�m0�ߖ��\'�V||6�G��.�s-ĐE4�s�YJ� /��+>O�#��j�(����\'���l����C����Es�\"�z���|3Zz���������t1D׎���xͱ%$v��z+�̓+]���k!�ŷ=��G����~��B��i{0��Ξ�b��}R�)�+R�w��\'��V��F�c�Ɯ�H\".$�7)*A������+�)��fǣ��z�p�\Z��xk���õ�d%Bw�=E��͎��A��Ԇb��F��C�U)_���ȅ�(K�c��k��$�YD{vv��l�i��ͣw����Z|�o	��}�`K���E^��񇌕(��?��������a	�I��S�L���c���v����ª��b\'�V(�C��Z�M�߂���o��+�@P@�k�}7�3k�w��2���nfc�#��x�@�v}��M\r˩�FD5	��u����G��*����Y��N���|Fn\Z�mv0e����05oL�X����L���35�׫%��%23\n�[@�J����x�mT �֒�뛸!)JO����-F7�:��6�\\SN�8\n��%��aW���m)؉xK�oI潓(�T�ɔ�a֍d�J\r߭T������Jb&(�&6��2�X�sR�����j�q����\\�`䞧�ga�J|A�Fg�O�}���e/ONB���\r�/���w<�	oT�뽿hَ9���/�A,n�8.�o7Q����DY�1:��o.����n���V��*ő	b�?\\�3��Jj8��o�Xߧ]k��zp{ېXh)�<a��	��A�uN�DBqku�@yKkS��i�N\'�����rxx�\'���X���D8�P�PL���2�Tz�RE����p�<�ـ��m,�*�^u�\\�J����SdEv@u�F�����.EG��r�O�x�p�v6P����/��w�r7c�X�/��I��KV�G�N��N�\ZE�~a��\n���8�2�!��J9�Ë50H�	������*�Qz��֔ST�}�R�\'�11��Fޓ`-��$�����>K;�%�08>�*��!N.C�5Q�.�����A�w���٫]\\�7�d��D�G�	|	�3�I?k ��ބX`�gBZM�U�Z��}]�Z|�����D[c)*tS�o\Z�a�{��扒���Q�j$����H}7��ߦ^����Ώ�;\\\\��2���T��Q��T���Վ�}�&�_޿�=z�C]����h�����nm;�7�u�fp\r�^{�8�.��A��,��9�4���*?�W��䲪�8�sL��HY�sf>޹����5���+ǳi�?�H��k�/��u�\\�\\�;\\��O�o��m��,9����@�c�����xv��S&@�y㼎���=\n\'���K>M,C�!���]�1\\\0G�`�[��r:����]������ʽ�/:r��J�o௄~��@~b��TߦD�N���.p\Z�\n���k�+\"��1��e˙\r<�D	Hl��^�`�����M�u�~&h��\Z.	2XG!�vz��`��X��4�)7�$0�I��H�\0|Mݍeȧa�Xȧ��d��}wwj���4_y�}q�M_���������<�K��2t����F!E8ʻ�(1\Z�3k�`\nl�r��`R�ˇO��������f��\0�e*^�`ٹ%�M���	���Ɵ���&���rۈ���n,�A>s[�����C�q���KJ�\\��`�jҿJ�҈ww�F��Qg��J� �D$U��i�M�*�w�^UWث������|N�hl��9�Ξ3�#�L�f}}�rB�ü!ӓj�WP���]&gQ/��]�m�^�����̤�O��֢�\"K<\'alb�Ym�(搤�@!V���GJ�6Ʋ��1�:-1�j��d��\Z�]q�!C1Z��AR0�	@� �#5+t�=�!s�E�32i���n�*��o��.͎�7�:�����ą�\nZ@)��|KC�B8{(k\\v\"#�������߯+췖4�~B�<_>��\"MtrK��4�ͬ{�aa����d��5�֤\rqs�߳�|M������8_���-�4\"#6(����τ��(]rT��j�9;#A������E;���oW�>iö����v޾=E���>c�|�=���X���O`{S.��aS�z�O>n���\n�,�:[��	�Qۃ�G5D,��5n0Tм�����`������sz���R X��Cm\n���U�q���)b���t��N�/�EAy�	i@=e����n.��O�˧��V�\Z�:�����x��9ߞ>b;�tS(�����J�_0�xϜ�}�D��iڣh��W$&���n��k=��~��\rL]����t`���Kî\r��1\0���� p�������(s�o��E6�J�*�P�$�������B|lX\"�,I��C;�T��$\nC\0c(���ǔ\0�mo�?��&��=���5YKtn�Z\n-(.\'�4S�h��r1Σt�UI��]Dn]���\n�+iؓ#{n�8��ߏ���i��!�~�h[���~3ا{���|VF-�Sa&ʳ\'��12g�ژ�g��~0eF�9��� �8)Z����\\������;u.��(���G���w�S�{$�����(X4PRd	�V��Y^�zj\\�-�\Z�\'@��U��\Z8��	{E�a ,�N�ђ��&[�2|��?�̫�Gr�`J�p������\Zg��2L�s%�>��hˑ�#H��\"�g_wW��Ⲽi}��>!eH�dqv������O�h�D3d!�2j�VFK��$��	%\r�)A�rX���s��V��x^4G���֐Vo��ͬ�;���/)_����D�XG_��)��K\r������/�k��,�Ȟ�lƗ֏Q���sW�\'�ߎJ.\r��8�L�1_�|zv1L����n?�@v�`�|\n��\Z��^��^�����=�m��W^8�O����o�W�*�t�#n\Z_B�������1y��N���0�������r�\'����LA�Ӵ��3��D#�i9�4��\0���JF�v�L.�]U���-�?���%o�:�V��JVr�t�Z�\rr�����D��%Bp���������x�!�G��ޜ�B�0I!:�:�_�ߜ�+�����.V*+ j�ܼG�B����N�#y����#���h�{9g���`ɥ@��z��Q[��i��9����թ9�ͭ���* &�i�L�{���g��S�tչu�N�\".�7�G}N�\nVH��ðo&I�6�k,�f�M��)Z(}4��7c��rɇK�՛yR��X�+-6�&5a~*��i����\"bh�9i1�*��I�B��Ėqd%(I�E(�p�*���u�Ѥ�����E9�<�_�����A-ʁ���P�;t4z�_TpY���|?�+��;��%��[\Z@B��9VE}ӯ~~�d�~�݋go(b�і�MJ�����\\���Y��ϝ�UjQ�K�ꦐY��&�ີ�M���77�₮�\n�ut2�:͌C��boϼv9/�\"-�+\n���!0�����ِ��]��e�\0������:~Q��KF\r�%��-T!_�H84��q��I��\Z�����Y�8���9O�� oDa�\\|g�@�n����܄m�P�Kƫ��0ͱfh��-��%.lG�OH�y�:��>dEx(a��!��wuѢ�V2�,	�F3<i�l$��\Z�k6ZSPs�O�5�W���o5H�����q���>��|��5����Ϻ�B�$�uTO$��3�����.��	�	��ko\r=\r<]3ǋi��P)��j2�Kh���t��\n��!�ZM+�o8��$ǆv�$�����z>GeA,\r�2���*C\0|D�&߶�� ����\r��v�XZ2�\0Pdn}�\"��R(5h:�\ZE��y.������oW��7�/��v����y�ɩ�BW� �\Zi����!��O�֣�G�y�?�Z2��	��}3_�O(y\Z&>��sLDu����X�YU��z�Ù��eو�ЌG6�I�>�j�%�\r\0�y�X$Ʃ�@иhJᖝ�n�,�i��2��@���k���-��E4n�Ū��}\n�3����\"I:6���L%���/���}S�y�O�)Đ�Á4�O���[�mp��Gw�e�������u�G`\rP]\"�p�V�­�og�=��.[��A�G@�QG`��V�o��K!�����x(xρ�$���9w(���M@�N�ϫa���EfA��F-�+	¢/{��t��Y��S�p#,\ZI{�f�Pꂛ��ڴ�C��a��*+��������O狧���O���O>z�e��B&z?,�\\�}|g�z~_gU]!|��L�ޯ�ZJ9�[!�L��_����l|��U��\\\'������ܴ����)?�Nٌ�w��Z8_��B�}��i�����:�(�Ȧ�h���,�(-.E9�	��M�3ƨ��2[�����tXA>S	a��IsK�ϡ�g*�\"f�=����������7ݢ�|1�XI��=��t��d	�\0Ez�)��\"�9̡z��HǛ�k��RO�O35h?$���z��Dm��\rb�?��Fv��7�^��t�[�-��U:�q���Q����,��i��;<&�Ӯ�T�1��I��LB����Ǽ4��w���6/�.Y��;�s�P�.�������A�a���R�f�Q��q�=n�T����Nv\0i�&zwǿ���o�;:G������IVO4A���}�5���kf��Z�p	�H�Z.���d\r���?�p3B�/PK��e	\"n��h��V��r5�	�i�k=�җ�����a�|�nk]�f�4P���t����O�^v�^����������������=������?B��N?��x�y|x8�ҟ3�����1}���>~g��{v�I���Xg2���foOa(�J�vM?Q���~����3�y�?����>�_�`�[�	x\\���N��5ő\0I�Y�y8V�2���Վ�J��[\n���k�o��ڋ�{mI`���C�z|�Ī0�\r��v��������b�|��u��x)<�}��[�g���O�~�\'�WC>CC-�0T/��@�\0���^������������>��\'�~�K�a<z��%~ځ�~����N�K�>�M|���*����_��Xm���\\ޤ�6���v�{�@e��=��H�j�w���RKw\nZ<�֋���A� }��1�Yf��H`�9)ǁH�jCq^АžGo��)��}Ђ��]����´U��\r~��X���zfI{!��@�Pl��\\��㣓�;G2}1v4�������R䳰�V�M]�?g�ܿ�(4�ɽK��\Zt�:q��>Z�(�����\0��PK���\'������=e�^\\Fb�\'b�R����r]P�F���/�8x�ZT%����V!oqdW��x�!�E�i@��\\\\��QGв��V8�c�FD��pRD�jz��3���v!�w��e������ M�*�\r�p9VuB�ij�&�iC�1��+;�<^\'�\"uCN_��h�<USt�8�1/(�6eqc�^Qg�L����I�֍h��yN�����c������??����/J�����������d���s�	_|����?�\\�����?��_���p����}s���>O���ވH�	ˡT����J^%/���\0�\n���y}���@\\����Sz�AC��}�wb4��;E�C��5�%#�o�a���6��ϔ�G�� Eܷ\'c{H�������T�+Q�8�)e]��\'�>��SjS�Z\0�Ej�����-}��ð���%Գ5�FD��vZ�r4Ya>��zYp�<7�C���RQ�\0&��#`��l�[��U#G*��0#�������K�G<���P��[:Ӓ�P��~�[��K\Z����#�5��0A!ɩy�\Z��:ij�(��K�JQ�\r�?�;�<[\Z|�����|���P�~-9bA�5���G\\�$����OH�I@Ԏs����`�a|��\r�/����t����v:�\0�\0}�U�-.h�ɗVP~:?��^q���I����ZB��F���qL����1޽�.�W��+��*qO�y<�\Z_bH�5:\nC��P-�ƞ_��bX�D��*�\\����+G��?]q�Y���v9�<�(�}�\'ڦ�gT$������z���Y��5�Af9�θ���\'G�H����~��kx6�aP_��T��H�Fd-G4p�3Ē����Ҟ��������΋+_shm�Ã&�M�ά��wp38��m��~W�LX?�Wr�s&)��H\0\"^zp�C[����_������8m%�hW�`�1��\0靟��<���U�t�*�e/�B�OG��IM�\0U�5���P��yۖ)�̐}��X���{U�|{=)up�c{]����`�����Tuu;��\\h=:�kf|�h��uG��/n��e��FNcҝ�=�Qcv:�f�I�Y��h�xu��2m���xe�?&s��LcX�&|u3[_�H�)����0���p��䡁�Y�:=��2��.gg�\0��� ��fK��˫!G�U���I5�f^�YF��*5rN��a�Ѵ�α����[�	{!\'5;r��c����HMg��,Qf���|%�9�dNa=|U׋�b�x��[� ���N����N�y@�s�X��X	�Tg@G�=\"g����c�p�\r�=���\n�N��\0��C�B��IT����J;bυR+�s��N\"z�pq�{��\0��k9ٚ浭���/��|�@��\r���9���&���U]Dp�����3b�G�\"��Wլ��\\��t�I@��M0���^㢹GHZ)���\\��NA2\0/�Q��;���~0ƿny��Ud�c��v�<^����_K��]����s]N�@�p��I�\n�P{�y�pë�Z���R>��a��CYC�*�z���ӔI�azƵz�O�o�k�5�����vC�n|�*tC��G2�|1����{Y�ê��ߴ���\\���d���\Z��Qka�i��q���	��!d��J�t���|�FiT����2��D2B�mN���_��A$JB�r���uช\r�����q�\"[�x�\\~�˰8���am!�ؔl�<�\'9O��ع�Q�\Z���Rك��rr�D牲:o<���\nݩ�^�y�j�|��ϭ�\0Y��`���X�p��ɿUDZˮ�0oE%ρt\Z�X����l|����)��$?�|�	������ͻ��ZY=ab��\Z������봇�31\\s�ƚ�V�×s�~��EއE����҉h�p�\r+���m�1�n?>���{7�	P�G�;�����l�辈k��tt	���&\r{���Ks��3�+X���*2�����R9yn�H/��ӏ�_�y��×?|��o�&6I����r���)\n�3�>�plx�>����h�.�������)�H�VV��r�3\0��D�/2��g�%R�m���G\'�\r9kL5��ls��v���}��C�E�Pq�>�t)��>��f�ޞ��v���#��/��7A�Jb�W���@���TK],鉗hj\Zaxd�ྦྷ�\Z�3b��	��gEf���Gv�C� n��8[���G����c\nI4�Sa���vq��?�ec��9�!�TSH��\Z&�Բ�Ewr��ݽ9D��L�\'�4��M��es�8?P�{/�Ey��\'\"�WI7�◜o��:ڸ�����lڶ�c��v�#������\r��0/�V��w�_��o���4�$�2�W��>�K�Q��Fpy�\'k��.��<(��߰t��!��b�.0�U�B��Ѣ��0����Vޠ�\nd#E�G�1� 2�İ>s#!ˡR#�&F����R�;�%�i�\"��_3$ݙ���έ�4��\0���lߍ�Yg%��Wu��0��[�M�-91�5@N� �\"��e嗀�\0�n�6a_Q轹w�!��T�9z���wN`\'�%�L�^�����h��뵕���5��u����������2x����&�6+\Z��{��%&;m<�Uat�v��S�Zo����r}���>��o�h�����I-�z���Y��ɼV>�G�ZF��}v��b��\'P\n$�Tc���g�^�/F��b^�?��1�2\n�K�q�B������yxz�z�`��첂�*s��j�x,ڀC���I�vӖn�ퟮ>@�O�|\\��8��PI\'O��X6>ٝ����1����-��ҡ��\r+,@Aƨ�;��j�su~���H��#:��%n���܈�J;�\"�I!é�2��fy���F��|颅	\"j�P�G��ȷ.�|���D#G��\Z��섺G�ˋIs�b>���?W����Z��-g�2A�9��$|U���]�#\n��iԛ0�v�K\\�j�{&Bw&����j�IQ�y�WD�g��f��\\��A:l���+v:ewF�irN�cY6�R��\'����W`���vW�p,aJo3C�Fu\07$w��@	��(v%��xI|�6	�0}R>B���r���|�3��N�K)�Bۨ\\\n.�h<�\\-���w���P�.0X��ܯ���2\r��eb�K[��%���I�`�\ZJ��C1���\r)�7$�I�/���@R�x�0���g�oe4�A&.;�	z�c3�M�\'BI�l=�p��(u��ĕ�(l�&\r,r�N��EA�(�)�\r�vlrO:��vs)�.8���FޜF��x\"��x�O�̄�������#y��1��S��@��MRB�@bg�`ѵI&�\Z��nJQ�(j�-��U�/z���׽p9����ua�h��JWn9��������FjE��� Q�����6ˊdr�fzA�p���3�tV���6��n$؅!э4�\"�9Z�<d1eWo�I\Z�����p��P��S����p���e\'�����s����[\r�M5&�)B5񓳧Bѯj\\�R�`�Y����\'�N\"u�즨U�	����\"�,1G����g�\\w� �8g�����ٵ���}K�c��\"�g\\_l�7�&���v*�6v���9�;M��A�,�\r��k�6C	�@� �z@J�1��6��Epi)\rXY�Xg͐�����iG���rajA�&�������P�?����n{�r��L_9�OX)b�B��ˬJ��N����9�2%�$m�ʘV�K��������޹]}��-�E��c6����_ԙ	 o��X�t�\'\"��V>�}\0Ŧׁ��D-�٦2ʿ��L#��{wWףӬ�ދL�����ƴ���)a蕇���F������1�v鋲�P�\'��9&�O���,�3 v&�-�m�����E����~��lZ�Iϊ�\Z�E�9��oM��W��$�����n�V8�?��������m���$n5�-ts���f\\�{��y�3�|���4?�vݞ�ݽ�/����>F�4u�7@�\'1MKU�[����o�v�w�����tп����?�!�~\0��o�ߞ�m�휈���kԒ�����;��wg��Xs/-���\0��fe��痛��^��Rg�m�`>��fJy��z<�Lʗ�W���:�Ie�0%s:�\"ߣ����z9�;\'�Q�w������5j����|T�|5_��gֳ\n��&�����҄ȇ��!�0�d�$�\"i��M5)�};����r\'��%�N\\�1�ɱ��$`�t	�k҂cߩ5�a�L�I6t�������#q��X��2��~6\Z_$X��&5���F�D�r������(m�h7\0�fK�A���������i�f���L^���G�����0��T��[����\n�n�d�(G�St��E�R}}�#gB�s�C�8�qv�v1zO��n�Ͱ��Y��	����f$&�I��f���Fṿ=)�O[LQ�\Z��z��|�����&��D��w���ݻ\'k�*��}`�AGn?~��Ľ�i��߽;q�2.sL�\'do�H�\'\\�2q�2����2f.Ȩ>D�j�+p��r��Vk�N�\\�٩�(\',�Ku��I�b$G\'�����o�π�B���ڿt��}����d�d�\n#�Β��!uo{S������*Z��Bo�ƪ뚾(�\0������o8y���͏:��Si�$�p��H�C�Ct���*c�%�gv��y�P�\r:�$٦5вH����8(�$�8�Гɴ�8�V�?�p�x��&��Z&k��^*K��k�JB��8\Z��u�^;���j�Hb�N������fj��)	�T��Խv.\\�$ P������f@Z�u��k��7��G�e9^��a����<��CJ���Y�dʡ\r�u.�-Լ:ӣ	\'�֯2\r;��c��\ZfB��h�	P=t��h9B:n}�R5��ww�i���d��u\'���´|F��6�G]��i�C����-/�v4�n9��\0��%�\'�1G�����^{N���||�1a�Oh�B3M����he���f�:��r�1��D�=����bd�:��k�|�����//����Of�v�]�z���E����%����*���b��ƙ�m|��Ͱ�s\\���d��C�l��h�唿�Ij�H�-)���qd�w_R[:��ב ����QM��B�h�@�a�e�;y|b}���GoWpgWl1�\Z��h�$�����Ǐ��K����V�x|��q�	fu>���*����/�M��|.*q�\'{��\'�)�IdV4a��tD׈�\n6�ۏ��P�[^��E^V�`�}/d6Y���U%�th��|F�/J������7Y����j���W�1j�_)��8�r�v����\nv�d�ֽc [M+��꧞�ҿ;p�����j4��A5��µ�9�\"�2�\0����N?/�f���|������pYn��h������m4�,PNG��S9�`PK`Fz��S^Db�����~bYM�Z��m�婢bOϺ]�<%�Z\n��c:���=��� ������||_�M�bx�0/�l�y4�¬�s%Sn�:�yO��yp-#�h��ܴn�\\��Z��2D���2|&�x�R�o��ڰ{�W�[��,��p���E�A��tb�E�����{G���1g���m�3Rۂ���k�{��(��˴�/��j�ܜ���\"�\n�]I|�y��!}a6�:ڡ�.�V�Z��k�h�Ʊ�]ӪB�a�i�3�G��=_V����m�M�A���seӿ�tX�q��>\\��Z�\"V���[S\\5F��e��N��F0f���*]y1Q���DЋ�YtB֧H+��zF�u���U�Z��蘢驸sk�(r�H����c��Y�<ϔ�]vC�w^\'�u�KER��>N\".��8��1��P�,p����i�(;�.F�.#s��9]����\r\Z�R[�M�VR�3;ru6j���j:!�P3ܞ�4��C�z{o�	M�\Z\Z��/Q�B��d�\rl�J�C�Nu1?vsS�B�~c���-Y>�\n!��T�ߣ�7Qa�d����wc-�\r��4ˋI�6�f6��МQ���_�I%	u8\nYF�tIuٶb����|\rW� G5ԑ��O�I֟\ZBnG�\Zo���� k�t�&�.hU:Y�r��D$��J\r<��Z���cˈ���,����	�R���+��>�Kb�otF�C B۾�ɑ�I�!�:M{`�C3ݿeu��t��ȶ[�(�JxF\r�&͜X���z�H�[���i�(�*#ꄾX��ѶY����ҫgb��͞#�v�|�Vز�\n���!~�3��o��o�����3�Zs��wVUY�tZ�vmM�{�>n�jK�2���s���� ��hn�E��4)7�V7�\Z��˗k�ު���Q<*\n!���>��	ݯ�x����P��v��j�@\n�́j�uRE/\r1���[���|��6�;��L����Z&��=��i��9e��R�G9����x6B�����e�Ƣ�mu�j�|c��|�����=@���\n�z���	�hO����J%8e�W�mM����x���rN��L��j>��%�&�[��L��Ow��Ʀ�ٱ~�i�P*g�k6b�ّ??\r��R�X��}*�\rx~yG+o���A�H���n%�,�!WS]��>M�;3h�1g~�Y�x7|2��Ll�]m8�1sP9��\'�~6?;�r3I[�|��:���z�͈$�J�3�ǝ;�Tk����Efڪ�G�?�1�kgL/��6�0@���zz��\0^��o��z�\\�p�AV���Q�����\\j��[G�B����voq?ׅ��-�й\re�f�#��u�g1��9���W�w�Ym�\r�.b�?+�[��i�Sڑ�]�J�q|A^�X���Z?�>��|$���%j���������ǿ��7؊Nz̓�訓�5/1��=�i���+(0-Z��N�^�$�W+ķ���X�H���^�W�g*-�l�G���)�vN�����}WѨ�-َs�(�\n����ȃ�d.�榓�Z���7)�P�I|��<xEUz�1P�����6s0�Q�W6�A�A�� �����сLg���tWm��{N�4d������[\'�>e�,���XT%&$��������\\�8j�z\Z`��H�e9|V֊��G�Jŀ��zXP9��|��r\\�C�#�Vp̸��3KS+Ge��	M��9E��+�D�<:[os�i�M(;co�@:W(�$�O>����o�FqK~+Uѥ�/�yl*������`��.Y��9��cP\n9%K(D�d���B��h���q�F���H|gE�4�c݌G5�V����n���o���wo�/gg(������o_���͋�g��_���ٷ_��/���~�?�k�}���/x���=�rU\"�V�-X\Z7�\"ͯ�~��JQ�DՌO_����[c\nw=�iI\Z|�9rq��߻>�y��\n2+�UP\n<-L7K��� ^�|����P�]��A�S7��0�=�\Z�q\n���p����-�V�%\'Gv�Xv\"/~^���\0�|�/\'��=�>`�J��ꃺ���e\\���&P�v���!�3�;��ns8����(�_��N>]R�ܢ �����|��2�N{�W�\'����.�[6mQ$q��e���r��*O�=AI.���	��X1�l��m�Ѝ-FĢ�N�?0��n��cvkT�Qb�S{EA7o��څQ�6�\n;��mˁ;-Ni�P�3X�`I�>57�� I����>��%Q���U���{м���+��!-dX�PbP2ۛ�躧�؜��t��vm�u�c�>�V����y�H�@B��ˢ]��G򁞠�/�K�l�ow�}[�vVշ��.������)�Y�\'���U\"v�,v?8�o)�kͤ�f��%�-b�\"��<))��9Ng��1!����:0J��^g8 OX\r����\Z���e{��m��8p�;�3����y��V9ɏ��Z���c���yG�c��v��̰�3�;���&\r/~�}S����?���\';1\nXT@�읗t�H�닜s�NG-���B3i?�UO���o�����i�O�p���1�&�bQ��\0\\�x��~=7�2��A$y�iC����E |���A����◔������PH�&J �ɵ��Cy�f�-i�a)U�T<�yy0\'z�U��5\Z�ռ��T�0ï�.�����+r�*��;P��7c#���`����F�h��2�,D`MB�O�/��+�F\\�3uY͗p�/X���@GK>�.tn�#���=�9L�޷&0*����<�˙$Da#^�S�r�su���|~�\'M\\6MҰ���Z5)گ��}���9�b�<�oD�����q�;�H�3C)b5���v(��d�E�@hu��X�:�	���?�9;-/F�+T�-.��ٺ{:ZUc��e�}Ϫs�eWS������Լ�y��wt���?�fwidYQ?�g{�b�!�5�]`�`���s����+��G)�%���v��Դ9��Iq�E2C �h�?I�;���&.)�ņA(%ҌQ\nl��Z�:Ĭ���ױ�Wv���L�F���&kљn�V[b>!ߘ�_���	 \'\rsw�H��\'�\0Eb(]�S:u� c��}�������i��6R랉�;s��TӰQcTy�fK�gX+�B⣗]i��<E�n+B�j�b���A��A�S��iN��\rv�+�X�����Q�޾T�a���|¾��d�f�%��h�Z!���3?>7?K�.�3z�n���|li�t�N�9���=w�}@�)���O�`q�p����){�G����ͬ��\0��иdi|���o��6�eY��T}�H�MC��fuoM�>�l���Tj�_h_q��}�U�:�x���$\nHᕣ�����=��O�*��y���kT��DtF��XO���l�/���t4���Ô�\0-�4O���b7�\r��6\"N�<��8X`I��1�|��]>y��ѿ�3���BX\n�\\G�L`2��oa��G����r=ެ��F����WR��a\Z(�XE4�N�2�{��NX��\r���Y�;������r�vZ���G��:����:8B\r�#�K2]s��g���}�a���K��G��{K����`x߹Z�խ�5n�i�Tfh4��0��h\r_��D��5��@D�֩)cL �:ao�p��7uK�6b�M�o����a���S�U$JCf�$w�<ܘ�\\����ϗ�9����B\"����N(����B�R�s��CM�$eЁ��ӻ9�zл����5h5��������g�md�_���0�UCd�KA�4��U;�6�������X�s����D�>bbkz%!�?ϻ����K�ذ�pF��cS/003~��}ևU���?�0�K�~�N��܂�5ZZ�8�\0Œd�fI�ږwQD�7[\"ي\n\Z=��]��ƲS�vP��������Z�3V�������~����`�23���{��.Ѯ���>l�[mF�ґb����tEK��V�g�~~ �d\'����Z��1���:�n5��@N��h��5^XXA�{\'�.&��.�s�`�0��O��5gL�mT�������|���5��6؉�?\Z]wa���~oG|�CPU���5��zgp3~v1Z>CJ?b�%��\'�7���j�̓c�\r0�{FQ3���د�J�~���a�)��j�D���|\"TZ��iN���b�\0�ꯔ��L��$�X(ui��N��(�s�:x�:2dic��&�\rō	M�WO4��,.F��j������v+� �]\\���A?��_L����\'K��ξ�r��;�¦1&����\'�\rdv�4^��H1�B�I���y���zl�T����v���HUFxQN��%�Ң.?3!X�f���)wf6����Ǘ4���~|��y�q�ɼ=j�7=Jaz\r��9EQ�䣪ֻ\ZΈ�_w�Z�5`��;�i_�0F\0\rP�\rY��d����j�HJ=��ݰQ�m\n.D���w��w�����x���q�)��!�q�E�UA�c��q���~�����3ஸ@ifYMy�}5 	��\nVB����G��^\0\nK�%?!��{�ĊZ��M�sL�`���~�$�&y5<ݬn8�h`��C�٨8qS?�������`�̃��_�n��}�����}��<�]D�~�͓/O�o��ƈ�������`��W�r-�\r��Ӎ��A:�t�\"��jdb{����\Z�M��vG�����&�N�smՉ>.�4��p���@\r�F�����MI�N�.�m��f�\r��i�>\" ��A��5�t�&uA�MEh��Sc\\��r��~���Vun��ߜE��ώy����u3�.+�Z�%���v�������.��z���r1_�^h.��)��ʉ?\\bu]w�5�T��g�F��M��eyc��i�e���n���SL�~�a���:�S���}C7�Iy�]�������Ձ�*�G���zUa�X�lk�1~������]���Q5��[P�Y�����j���T����+���\"���W�����e�c<~�1�s�SB皙����Eٹ=�[<ո(�:˼U��7���BƷ�����˿>��	^��/g������� ��F�;�鍙\n4�Mh�f\0���.p��U�\0GWah��Ŧ��Mdvz�U5@#k�=Y�������F.���1;��NP��,������(���?�R��wR��F��-�j��(�#��2t�Gz��j�N��XDB�N��#g�dݠ����P=#��pz5+�L*�ď ��y\r�C���4��a��G�\'������01�nWF(s��\0\r���^�v2Y��,a #��Ŀ�o���ѫKg�.m�t�.���a-̥k՝��Z��f9�)�4cQ*[�3�VW+8��;��L�V�֍�l�?�%jfw��Y�Ϳ�6�(�|M�c+�ν���iˠ�)J僷�lz��F8�d�9_�\\dNT�6��F��z1§	�<Cq�ƘV���j컈��4b*t|x���;.���q|����00P~��<)7F��*@[�)1����,g�ow(c.�wPA����;L��U\0��&�	��^����S��A��ލs����̏|t�;y��74�y�T�A�C�tM~�WP�È��0��O@[���W�t����p��Z�Ձѡ�D9��	��2��	�\n���2%t\Z�$��Y��;ͧ�>N��Q��]d@��q�fo�Ѱ���!<	���5�2�I�b�}�V0��lF7�a�E՞�S���C�+��燰���nkM���#���$��`\Z��[�<5�8�]���Z��e/L�٤3��w<n�)M�����t��g9C�w൛]��!)N-C���tFAd�k��%B`� 	��\"�O}�c����X�K�!\'��p�B�~h\\]C��\0��>�� ����~�σ{���>�!$C�Ua|��Ԩ4�xع�I��L+&6�N��9y؀������҄�;�J�호�.��15�)�ɘ�螑��(;!���b	�\n�	������.|�㲧H���y��Η�M��HJ|�/\Z?[�Lh�b�6ܭ�X��d9�2���w�p�4ϭ�.���Rr�s���KAE�~w���Ё�]N��f�w���z~O�N�9}}	|l��3^e(�X����H��[6��~߿lZ2\\6MM-���{�KJVl~�q���I�D܋Jy�!��\'��hhy�������\0�d�t�-\n�:%id��h՚����;������\"ǘLK���4����&e���\"{�y|x�5��3ܷ�b,H���3�;�t����%f�(�\0_�Y\n{��4) ��E\"�P�p��g	͡�]�}�Qe�<�3[��xb9�G����xֆ	�E�(R�c�Fb=W?���8PS�V���U{G���3*�z)�{��ɨr���U�W�XP�+���+P����nQ��<Sz�˥(��4��L�Vzd�x8Y���������:����\Z�ސNq5^~j:ۢ\'c]4Y�|:�m���\rү_a:&��9Я�8��冰�a_��J����C֧�/��k���إ�Ђ�\'�芭O~��tv��Z����r�Z����{5�PFv�a4�O�i�ִ����,��)��\rt\Z���8�=L�[4\Zx�\nf�����PJ�0\0dy��vN:5cW=�`���ȳ+�q^��I�T��d�k�h���8��K�\r\0Tn/�.jb���|���A\"��\Z-��	��0Nn�+-�TG-��Q5���а(6�����νNI��q�\Z� �o��e�y�Z~P/�0�H9�qY�\\�	�K>��-�CQ���q��$2���3�:��\0	y�Ϝ�3�RN������� �/�9L��n���I���q\'?:������z7�l�����@�T]~�E!�7P^t_����/b8��A(_|L�C�@�;��ʓ{3�h�9\\y�4E��BQ�!���zx]�;���k�r)7�r#��%Ј���\0\r?�DE��v��xF?���V�MN/$��:a�4��]?������\r|ݸ���a�K��υ��D~9������	4�<Ƽμ�7��WW�E�@4ð}�0xQ\\��H[e+>\'�5nu�\Z��1�3�(x&\\�[}\'Od�vfs��69����imv��w>{�c�nv�$Y=��O��^��O�}hg�:91o5�����$8ձ*A�h��@\0T�۽G�WF�\n�O�k=��1>�ޠ>�R�)iG�L�Z�2d_�\'���7���B��&�}D_f�m7:�=��bc�\Z��cpww���?i���`��7����qD�A$uFB���C_46��V�X,�\'G���������q�\\~B��K��a�NN&�,T� tT��ɹ\"9��P@DX/k�C*^/�:�@�zs��>?��	�h����_����]ṊwmQ�śB�`?���\'ʮq.FJ.?8/%��My��>�����,r�\0��B4m�J	R�u��:F��J���H��h6��0V��h\r�I�w��nX��\n�,��ea\"�f�&BR�%|�+���P������>Y�\'���\0��L\0��G���4%��[WJ��7Q���z�j���)�/�*��Q7�+V���&e#��җ��\"�|AE�� ����U9�<�2�{�U\\��6ך�}e�����Q��p���[��Ќ�0b�q��;*�jUר�l�%wB6Ĥ�<�H��C�D�7Ld�?	\rD��g��P��d�ĩ�X�D�5J2k❌���>X�yz2�/9�G6�7-�Iq�U����Αb1��|�L\r�&3tqZ�����Pt����a3��җ�&udz��&<�\r�$×%.0�R;��2���N]��X>��d�C)�у�\"�#\n�=��7\'x&{�h�6@4�*Q�fB��;_P�]�l��T�!��r�����~�kmu�rok�ȴ2o��MHf�4�����~n�O�PM&��zz�K�\Z��||���\r/��J�>�}�{�u�$�b���H�&��W�84������\'���\'���;�K�F�\'����꜉�};����T����66蕸2�I�k�5����5b&0n�,R(M�Y	�G�{����~P�\\i>1vg;Gtq#���FtqaG�����a.ú�8Ѱ\"E�����Q���=5�;��*{�Ox�	NP�y��1�߰��ކ���g|/��5��{�{��rI�B4r��/Q8:�g��5�\'�%h�,�C�r<��[\'<�`T�7�.H��%��œxg!����3�\'�Z�S�{(�\0v����o�d(��y� ����<�|E߈P9��VY�)�fRQ���\"�[�W_Q��]r\\���}\\����lR��;�\ZGÒS��V\Zo�U9��D�F-�t�/\'�8�Tt�J\\b�{��[Q�L��\'��Җ�x��D�ϨHͼ\n]]��z@gxr�J��҇�O�����I��wұî3/�r^kB��3����1�b?�)��v6�J���D?�x�����O�ݥ��jW�sd/4��\'�D�\'^����?�fU�}q��\0��%�L!���On;�D��fV�}�S>�1�cBQ�??�rPS]�X�,����F�9��mjYեVv�ۄ����}5.�7�	%�+1�n\r��b^���y|Hї�t�%�C�\"7\"��bA8sY�G��fj�i77d��[��8�f,��-��zOI�V3kQy������7z?����J��ք�{�����E�:ݻ΃l�N��٤\\]�狌����\'Ez\ZѝW��LN-���}��p)S� ���&���9(���7qGBY��rc�kIZ老�}-��&)��ә25iwMWc/���.�Boi60�Y�����I�.x��͊�CSI���;�s��T2t\n�ozj{�Q�\'��:E��5;ّ�I^�Zr��q=??����*�l�\r_��	�]x����\Z_\0�E�7\'<�+|��8F�:~(��vkR�ɏ�8}ݣ��u,$I�e\'�(�^k��m�GcV/|p��Q4I�@=������gme�@�t~��ף�)�4��Т�m.*+Y\'��ƥ���D��\"�V���!wȀe�ö��_?��qʼ��q�J�!G��Q�3xQ���&�R����@���0e{�n�ن\n4zL�J��Ь��1~�Jt�\r[�|���}���5v&s���8�!�V��o:d��ہ!p�\ZW��\0)xl4,�]��4&��8�c����Jg�I7������!e��K>���6+MC�uXNK\\cLC	�i�-ܠ�l.|��Sr�Y��%q�P(l�E魫�\r)���p�A�z���l��Z��z3���F�e���M_����^`{�J�49@���BF�2�0���YϪp��%��r�p���<���j�\0��p�9J�4�Ur��Syp8_�{����pY��v.;�V�Rɉ��)���Q����6��J�P�)N�J��랃!t�<#kY��[��{�+��U8i�v����\np��\\�r�D��0���E���@p5v��������#�^�;݇۬^�E-4Iv�w�׈�o��@�U�>;`�6Y/;���lϹ����~������e\\�	~��m��>������H�>��^�\05��.Y5y��hyٽ���y���&$I� յ�X�c�����:��\nӛ�\"䜣�B��S>�\\~��!h�帐Sĸp�\n��sſ�7ϡ��������.P�9�`���lX��kt�:�5�_�E�߾V	H����gG�l����cO���h̃!Qq���(k��&E�X3�Ћp]4�~ɦ�\n�rϓ{~|������4W�z�C<�A9퍙�N�6�X%���X��!>U�{bg��4۲ח�)��牽�ma�-R�&sa��tH\r\"!�b}��q�&+�Z�ӮW��J�*s�~�(�l�=/GKH����{��\"�zCދNȨ����1>��Z�[�Y���.�p�B#�ZG��~��Z�o���ā��f�J�������Ǔm��`�Hq2~U��n�T��}��k��gR�\'F����ж�g-ƻ�I��4] DQ��FrZ�ѪV�QkgӴ\\�g���Q�2�G�����KK\0էc�\0�Q��u��e��hRM8�+��ˀ8	��/˵~��5�j���x�@G�#���g����D���\0�ST��A���\\�K��}��g�:YɅ�=�%�N�>-ϫYGC$n\n��\n[��+F�s������\0��u#Yf�uZ�Nl?�6�m�/�훇�i3�{U�Ϲ\"o��R6YB�ʤ�kwG�e�;����&b�оq.���ה�v{\\�Ϲ ����Z�ָ�뵾/W+��;*^q�D��Qr��z[��)�i��M�R%�S����s��%�p�ﰆ�䡔�D���z�`����̬1�IC��㋜Z�Ie?�%i�S���g�9]�O	���������\"Z��i�+B};!�o�L���0��NxYhX����M\r���Q|���6�W�O���v�,mݐ�7(sK����;��|�~=�hk�b!��\\���d\'�����ʄ�=b��9b�dzط�>:����]1��g������Zs�����b/��R�\n�;Z����z��6�UE�~�{\\�W�fO���aR��gş�n��8;\\Wk��4ī��$�����|T��ΔM/��U�S>Yf/��(���0�1�H<SA1��WV����}*4Id����hG}m�	Q5<�A�V�s�&)\']��w���|	u�[8�X�OT򆥟��߆�2�K����nϤ긵R�%��o;�����Y�]�t�?����E��D�wg��Z��y]�����bǒ�]�B��#���o4��I�$��N�ԩ�[�EM-�qڣ)��0�̝��bu�+(��\r�F�E?�>}�o���s�.b�;��wA����T�R=̽Cy��˜f��S��?�)\\���6���FѺ��	�Ӑ��7VS\"�aE]@��8��Q� J�k|���ѽx�K���\\/Klg��uH���e�M��]�&f�a%�kq��y��c6*�.�]�c��d5Ҍ�f���%(z���j�B�)��|9�б1��9��{�5�ԤS�����a��8\rw0�~GЉ J�0��*�@�g��|�	����c���:�6�oQ�(h�~����иlWU~�Y����yy(�!V˺VFD-�l�(��?v�T׵���M5���ُx��M7>~\nՄ\'j�3\"\"�p�$;7�ej��g���GR�k�Ƀ����ʓ����A�PX����� �UHˬ�]�}�.nY#�Z_���!C�x���T�\0���/��]6����^�s/Q��NB�O��]�\rM���5dA���Ŵ9I������6��s�=���L�+��8�r�.J��DbE	{EnDGB��3���`-9>QQ-e�>By��j�Me9zD����7��Z<g����~o9��Gw�S�M��x��O�ۏ�8��_�oĥ���ɽ��gr�9��x?@B��~J_v�6�p��D�ww�������>��-����<��W��	3�Ա(-�i\Z�f��Y��{\"57A��hVN���J�[Q�Ю�I�>����*���&HoC�^t�E���DM���eu5Z�0���ۗϩ݁|!������ӓ[�O�K�\\;|2];z��yG\'H]�P���~�����\'zŽ���z>�\"��E,Gk=oq�>r��\Zk�M˥\n^6�zCP:9�Rx\'������	\\.�F}^n\'�h:?�s^�z���&����С�ΡP\'U\n�P��(*���]h��m�Ø�u�s[m��}����]f�\ZN��t2�dx�� �g��:��DWH:[�j+���嵩�|pV�B��&T����H-��4yQʘ����=�40��CUw=,�8�\"[�7�I(o�\Z���ƒh@=3���#av�7���y1Q��ı��޹��f��\nR�^���|�bmDΘхA�ԴN�*�&Gq��.Η8�����6�i;;��d��#	h�Af�� -Gk�����ة3X@_��}6�x�ʮ�Vv�V�h~Ww��<}֔e�]6�:�u�\Z1��k�fl!;�so}\\	_����� W�0T�ř�s�š�(�Ηk�?aO|�����Y��f�6W���C�Xe��y�X��e��r6�������E��n�N�����^����>�G�`\'�\r�[���>����_��_�{@���Ti�!�t�+yw��r��W�#�0�wj�����8\"A�ڨ;u��`�#������n|����jQ�����QG�q��G���]�mz�4p����E�s�h`EqU�~�����{�HYj�k���~t]]m�8� rPs���W��<�F�P����ώ/��s��@�F/{�ϲ�t��F7�jz�Vc�`G���:���UJi\Z��t�|/��o9_��_�,/`n�c�WDK���N��\"�I�9*9�E��Jq�\r�95��E9��V�XS\n��^j����7y�Q��)��cu�~2ew\'ˇ[�M��뗀�^�ϑ��h���*$V��~�t�u��^���Q�n\0�w� �H�\\�IQa`����t4U6��i��*)5v�h��K�\\B���_5�\Z*�;W���6����7O��u�9ңW����{�Z-�1B=0Qu)��%���\Z�@c8[�W��iՑ|�N����eg|�+��\"1����?�H��!�R�����b��)���5�����(2 �c{����E WCg/!ND�k�_I)F\\�[�U(|}�� �%��p�uV��[��E�6�,���1�;I��\n�k�A�����c:�	��%5��ԍ�UG��d\0$\'svoaB��J2����R�B̶Щ$M�6�t�q1u��\\}�%��\Z\\�\nA����S+P�7\'�^@Pn��\rRp+�V�ֺ B��	:{NP��≾��]�\0N2Mԓ�ts�PB���=%�h���)�#�3]��I`���C�x��;۶4K���fㆀq�t�`H��t���B�,#J�y�\r�IP���m���3tY�F��so\0T��\0�~婌�Ǉ_�ɗ���\'S)\rlf�I�|����SQ�Գ���ru��b��U︢E�暬\Zߐ�]�bM�R����GJ�HIklōɇ:۲2�{�!�,ϭH�� ��F$�x���m=���}e���}���`�c1�ق�w���|$M��Xf�#X1�7�~O����$v�*7�pR���ԃ��Z�G��5������y�E�g�f�6���� +�d%�4cg���kz2\rMj�C�}�\'\'#_���@�%faqQ{0.G�#�4��J� L����6�W�!D�$�FK^4�*A�+b9	��U���^D��\\9�\rp�^��w�(I��-�	����\r��m��-��6���LEߕ$Gu[�\'����RkU�9s$g���̞�dg4�#U.�/=�����h�ݭ�����ݷv�`�µ�A����m��`�54\"�xԣ�n��F��l��v7�z�5�fힴ]���������_9^�W�u�V�¦N�AU��jz3l�Ccs��_���!��wb�����Jhd,���d;8�E��=I9�\"JTϫ�ȏ��@�Ҡ ��X$�~�Z��Z�t�w}���;6FG;�����?ZO-���v�Q��<؅p�n�B��>�O�$�A��_=CH��=�=q�7��8�����/o���\Z�����{͞�,:�l�,k��u7�Շj�J�ިb�����#���}�Q�k\Z���,v�m��~.R��������bD�N���9y&�Á?+}E�,�B�*qg�������bj]����a��1#�%�y�v�u��D-զخ�<���^I_�IG��1�pe����h/�`�.q�R�\r%�`�M��P9\\�c�*�n�����u�=��tr�yZ�m�O�G�rO����*��w�{[�4��dѥ��R��@䎄�.�/�������6yY���B�k�Y�V4����vL�)�����N�,v\\�V��p�)�̗�>�e��8�.4�vt��&����a�8�/�r��~������v��Һ���,������}��I<2�[��䉙M���bUe��;G�����G�c�U\r�r��^|�u1I4V\'�`�S�1�:�h+E�V*d	)�����a�bu!\r�El!����ZQ�ġ�~�\n�(a�p�l�O�4�8[N���0W��h=<�������D�{Z]P���0<�]��cRy.���f�b5;�k(�H�D��˭uX������(b@���3=3Y0�ݣ/�!qP�\Z�3�}Ou7�{兯�38�A���f���EJ�6Y[zRD��,�Rݭ��Lp۱��х��\0�y�����O��A��إ�L��]0[ĕ�������3 ���]�	�C<d��&�Z˸i�4����*��E�Z�^m�l��\"F�D蔦T�����A.&�gm�^�Tmtn3�a�Ywc9\Z_~4�e���r�u~K�ơLʡ��Џ ���S��PG��[���3b1�7O\0���o{&~�j-����s*�#��������6w�� M[���5��P�ԑ��`�D|g*;�Y]-6p$�F�Mg��0�qS�]q3����5�\Z�w��\'�w���eN�ͺ�Q\0�k��=^8,#az�\ZH�8��%��\'��J�.��Q��ҏ/�u��z:+\"T1,�r��\0�춫HC��;b�+W�I��� �k�v>\r\"G���A��i�m\'W����)�?��{�i�N��4��c�\"�FLr}�>n\'�&�nh�\r���ט-Җ�r�PYFu�P��r�l��L,���#�8J)	�)�Tgg(A��hݳjZ��e)>�����`�iA��riXL�}�M�Uhk5�\\�Z�#�\\?_=\ZM�mV�G�i�S�@��YJ3��h��K���1:����fDR�h�r$���}�3p���8�NG�قulnvV]�!��&�0H$\\:L�!�UP�D�r���L$��p���_R���eɱe��5U`Sz^�\0��=^�ռqr��\'�8�@S�cu�~#f	�]N���\n��f|.��>\"\0l����q���&�(�6��p���Nm��L�^�ꏺ�%�$�¶�R��.���\"��x�z�1]�/~�m�yR�-Κ`�E��y�)&�?̣$�n�uJ	�:J�=\\d��sMau�\\�?7����8Wοt^\\������vX�AS��Knx$�;4��<NŘ�=ޫO�ehv�$�i,\r�n�����3`ҥ{/���\n�n�6�@�g�G�2x���`����K2�5��W���\0�\n�����+�S0GJ\\h�U�=c�wa�sS�g,�v3�܊/�XᲦ%��nà` ^J�@ޗ��|8�f�=�@iM>!�4�@^�?���q��H�s���r��1�)dOa��x#X�Fa������ր��W��G+#o�P�_�/���n^ʹ7��q0^>ox��={N�/z��cb�2�5��}��ow�>ɹb�x{:�N��Ÿ��OIpvw�^;�-6)���z\0T�Ѵ\ZG =� ���1��e䣏jP-2#��?.���������F�\r�C�2����V�ku���Z{��Z\'\'cj�sj�O?�}�Jm�2i}hݰ�8�._������|6�������!����4�	sL�(d��ҌΗY���Vև?]@Rę�{�:�ʹ-T��8_���8�%�/3��v�H} ��3������̻�v\\9\Z_�ڿ�~�F���Hϳu�v�j}�//�W�Ҧ�/���m3�|�Ё�g��Mtؔ>���?���,�~�W����ץ���.ؔ�;֜����=p�v���`즟�HA{��A�����@wkM^��y�W_��gS���jl��+��>��yĞ5jZ�^w0�s��x�0u:���>�Pi:�L��E�Hto��8�\r���,��C���s������u�1��<z��\'���\'�����2�8�yk��|�	�	�08����\Z���K�#+.�X;����@�a\rSi؏�=�}�a�9]�E\"01e,o�m��7����5��s�n���϶9�*��1dv�.��(W�;����˶9RN����~\0+,�|�H]�1y��|q��S2nt�އj�\\����R�����,�j9f��j�N�\\�\n�+ph��E���eX �z{N����\'ʵC�N����-�<���E��9�\0z�Ԥ�v/�\Z��+{A���\"�JNI]!Y�J���\"r�X��%urE��|p�)v�G�\' _:���C\ZÉ6��p5�/v�nŕXق�M�Li��{F�\"�����e\rfh�6C�]�VgB�v8&�	*RF�eA�IUv6�ǈ�6�N��y���%F����=�چ(�q�ރ���;��U�ކ,�\',@�R��I�F͠V&��Q���Ť�\'�U<O�܊�{�xPo?��!W��b�_�Ε_ȗ��ё�;���m�˴��Zq?!���<��f��CD�\n�y��%9���^�Gϝ�#���|�v�s���qV��B������,�k�3��\0��l����ݞ�k��G�\n����L4_����\"��&; ��8)���%�#ed�EL���p.������]ы죷��=\"e?�1����{�\0ʺ�\Z7�O�u9�#�����U3�\'���CD�n�Q�\nܨl��y|xx����ق0�D��l{����*��x�� )����3����G��sj�f�l�oI��T꣓\'NACjQC%�/�x����W�\r��z���A�Qs��|�J�R��KE��,Ⱦ9���\n��m�h�.�yfM\Z�aV�_�Q������!�}��n0�N~�K�%o��7�-�\"d���\0��5��z���M+J};��R.�a�����c\n8��ͺ��I|�*\'&i9��a\'b����/{��}\n��\\0&���#i�����{�Fp����M��b3�԰O�\n��\\ip�����H�O�K�.$FP�-��Wq�V;`P	w��1��Fߢ���k�q.^�)�������j���X��8���z��S|�˄���8���hd���E���\Z��ķi���:nVn�P�9��L�)���y�s�ϒ���y�\023�i.��ū�3�F��.��h|	���Κ��E)�x�%a1m����H���{t��oci7�@��\\ˋS��H�����Z�c�=��*�+�Ⓒ}���6P��&MB���j���^����7IKW���r֢�d\'Ο��2g����s2H���q�-�>�4��O���I�#j\"ژ�wSG�ͨ��)ʮ�Y�b/��_q���lw�p���#ξ�$�w�O���x�Oz�^���چx��f�c��g�`k�J�وL�o,1��w�`�5�\"���~*�c���I\n؅KP��׬B-,4����&��t�@��팾0�A�m�,u�r�g~��|���X]G�p>CD0���\0+߇�X��{��}$\'.I�j�Dz���ib����0�?%0�iy�����Q�vnU|�Nh�dG>��\0.������C���^��l��&4lB�1X���Uq����Y�}����C,Ovr�:с�h�V	���������U�#\r��Cͯf4u�<p�Z��\"�@O#\'_�Cy��f֪c�~!�B�,�D��%rp>4�P�:s���n*Cnn�Su�ow�[�����KrV��s�g��à,���\Z&?ͧ��F�߻�������_���z�A*���92�T�v ��~;)�nFb=�\Z5\0�\r�xm���l�{�ދ,�o���<\'\Z<�>h�)�,�Z��_/p%~I��eg���/�Շj:���C{����<�\Z�B�gGb��<xi(�� �m[���{�N��۲\Z`lb��RwD�FG��؊g����\'d�\'\Z�Ö!>�q�[h7̿o���O�6��.���L��\Z��ZΟz#>1���\r�0\"j���!g�5O1��O��u�$�ІF�	*Ռ�L����X�UK!Q/�����{�^ߗ����m��6V#�d�ND\'-���?:����\"����#����,�`;�X8�Ԣ	��$AYVC�-\n�p&��gNF#�j~���alJ/����Y�0V�p���r�G�s���By��C�m���+2k�2��E(U�������Y�F�r��8nt(�	b��c )=4���gT�-�x<f_c#�@�4\\ � ���N��E[]�K4 �ڎFM\"n�K�t�XYHp*�6��$?�{�e\Z�&p���%\Z3��ڨ���1��|��xܾ��a��%�޵!tt*a��t��>D��RXI�� ��\\�)`���V�A��g��[,owZ�F�u��PcX�Ы\0~]��5��>���8������kX���}tg(�\"�L7P�Ro45�@d	���kp[u��`���L࿦����n�%�f����7bR�����c��x���\'�g����QN�2�e��N	�#|Sڪ��&_[�����DT��9���m\\}�����*�⫃�$�]#8\r3�]I����k\"[�б�Wt�nbt/�b�c��_n��������(n�@z���k�M����^��Ef��}���U�F��MvX���Qa1YՅhb~�agО[�M�2?`x�Z	�χH� �b(�þzca�ώ���5eL��:��e�ߦ�\'є����xr�/��%lb����<�9�>9��ފܐ5ģ��D��qC�=N+�fwW4=�m���S_��	��U�K�kj�zG�úq�ԙz8�?�����=�lp\"���8S����$�\Z�Mm,߽<?��</�IG~��^����۷��ۣ��m�p�6�ro��B9�Ry��G��h�I�s(ר��{@��ZO����uq|���5��k\ZS��\";��P�O��8c_�����1:2�>�w�{)1�ڣ/��~���\0���5ks����?�{r}���?��o;M�G���7��Ow�41���0e��E�8�SrZ9���x!�9=���>��ü�f��g�O;;�1VR]#���R�3�U�8Sg`���P\r;o���:��=������.����,��7����9V&8[��_�F0R<�s�U\r���:,�-!�n����=���r������T�Ɋ�@#S]\0�y/ߏ�N�`�~\'sW ����U�������~e��[�B�Z�y�f�i}���o4�\0u�/3&;NP���i\'ӱ�#�Ñ8�\0�/�j��81.0�9&	��+��%�1�Dl��r�穌#��qs��tXv���k�L}�7��,��T��<#*_�k���X6���������)>�73�!��Ei\"��q��Q��������`9��٦�m7��IɰLS2��G���$U��h\\Fh�#�<{%˅pt��I&�0��o���\\~�\"$@��K~4�(��ɮ�8\\(�Y\'7�LxMv�d�,�K�RaN?��t��Cњ<n�?<1�u���y���>���Cה�M��OGH0i5�<��}aE\\�<�t�ԃ�!�]�n}0���f��y]P\Zk�Z}��%�J�\n�L0WU������\\r=WI%uY�N�)�o��.�����W��3�S�<�&�%�&\Z�P�5�Β�\Z��+a�;�+�&������h\\�o2����c�D\r��ph���������d!��*��tq1j�\"; \0�W0V�j��S.��\n����܋�B.�W�����/�!W��ld�/r\Z��k�>-����:�$P��0���x+#��/�}=��\'���:����Vi��e�,�߻��ggg�L��úB����θ�1�	f��1�T�©�;��O�q�!���G��S<�dc�����O۴������%��t�:���Y*Ea���\n�S`}��=�t�쏛���m	\\�\\��P��h�R����BF��F\0�����b�Թ]�O{����s;��|������9�w0s<X�G�+b����O���1����-��3pN=λG���;~��������h��x\n(3N��ד�ѣǽ?|�1���C��?���54�`��Γ�����u�h������G\\�h���8\0�/� �u~U���Zm[���C�9>~GF_)��Uu^Ms��!\';��������] ��lܭ��?N�?u���[�0� �g���a�d}�o�x/��ʡ�������_d�,W�]ա���F;�&����UfS����o�V�#R��g�_�;��xNZG��5���_a\Z���\r���Vb�����Z��(�W.��Q_�L�^>��%�ppY{�]��R�l&�8�r�?���%�?T���b�Z��$�5�8����r5_�47�jM�q	�&�ӏ�_;���x:�������u�W��Op�ä50��\Z�0�ᦇ�%?�B;�j��k�Q��vR\nɫ���AE-[Pww	|�M�c�����n��^�`(�U�>I�rT*�vmFS�LS��,��Z����P�U�ݻR�4��g/��dHQ�\\Sw���qs饇��;��������4�p]�P�_�K�E�?�_Î�礖��F�=\"�?�ľ:Me��Y���~��M�or�0��Y�	�(�L1�A��O�����ެ�^��|+r��+��cP��{\nS����] 녃���T��9�/S\Z���\"��F؁p��|�3/����\\C�N��ü������k1G�E�j#���݂�z�C��Waxe5����`|ڛs���q(��P;��r���E�WW��S�$����9~�H[���<0<D�E.�=0Ý���N*&����3_��N����b�E�Yj�A:Cv+M��E�q�|Ľ�HS/|�]D_o���c!�>��Żw�y�H=�\n�����oڤb��Y�#T���O�U|�/���,�*$�]0�٤���ӏ�Hi���lo�I;��P<��G@_�ˍj6TE��y���q��	@�G�/��[�_�ՈR�l^�6�}r��uί��y�Nn���Z�c�K���Yو �@I�0�!w!�;��DNcXT-i�Ǟ�7t�!TOk>>-%y�gVҠ8�Ǵ�����+1��W�ӻ�K?�:\n��~]\"nz7(=���K.�w�1ē�l4��ٵ�Nۑx�k��!�zh�DχͰߜ�/n���kԂ�\n���@̈��q3�u���1�xB�\n�5֖�*kп\0ַ�	���)�����K��u8XNz�<�j%S,�&\nZ{�O�q\r�O�~���Cғ��9\0�C��r�)7�-�x`�~~�QCY\Z@d�+�G�,w\0�K��ɘ�ha�bG�u�+`�U�,P��ed͑�3ي\0nuf����%�՞�qYvA\r�/�V�\'l��(��⮺�r�el�_�[�{1c�\Z��r\\�Y����p�;��,�ko������^/��+���@1,\Z�����vٹe^/��s�g�8*!�!7Ņ�8Ӿg2�Oڂ^�δh��Q����촔L����uqk�0�G\'���7�ba$��>�r��A�IL��!AՆ�Y�F\Z⸫�쁊U\r��\"̋��zc�T\n�f䖺U9Q��X�Q:�%G\r��^#\"}��K��~\rq�y��=�qv�5\',��>b`����B*��H��I���\"s�2����ب~�G�@���u\0\nodw\Z�����^�� ��x{�EД���d�$-4_���������/9�jm�].�w��?��\r�8(,�߻�W�F�л���~&rb���\0�u�cQ����)ymp5�����3©��6�ZlpѦ�%����1�k�����\\ŀصL�L@������q��0H�8���C\Z���gS�\rp�����[�ml����U������(�D�F��^���|�a��������U�(p0��1�lY�m_���c��wk�(\\y\\�Z\Z��7BxT+�T�S3��f�7pT�y�e𾀟2+֬Iu�O>�0��N	 S�}!���V�/� �\"h�zaiA��o�4��K�hLa���!bQgI&��J�Y1X]\\�����(�nPY+���=<;��	�C�)[;^RG��.¼�����;,�a~���UF�Z�w�X�b_�p�:����.}1�U��&�eQ�s;v{S�U�	�ԢǍ�����`��~��~[m��.�����N��� �GMQq�f� 0s����̞���@�� ��럻ۂ��.J9J@�j�8�����7}OؾI=\rʛ������<:�`y����Z�{�0]yo#]�D��򼒥+Y��CMbL�Z2[G�?mS�G(ħ�����`�6pVl���S�^C~��o���Y�M��du\'{Ŧ��$�۵��Py�W,�+O�2ⳕ�]Z����˰�o\Zuc�pMө�kk^�p����iN�\ZcGx�Ϝ�1(D�P\n¦E��j}~�Q%G웻ǽ!s5_���w�3�7]ꓧ<��i�.F�ט廚��O��)�`��k�N��n��̂��SW�^0`�\nuc�9�>�iK��D���Z	�e_q�����ˏ9� 5�����N\r4��_����ݯ7��/���b�o��V�j���W�b��D��i����;c^��z�>�A��qf�b���$�\Z�>J}�NNj���=�6>���,Gv��L�3�����v��rd�;y�Z�ɣC�o�F}W�.So��(�[�_%j�8Sacq4ذ�;gJ%�NJ�Զ�Ss�O���G\\D?��?�\r?�7��z�R��07�6��FD�m[�k\0�G�4����ř6��q��;}.{4\Z��<K��0>$����C\0\ZZ+�\Z/�}�����tR[n����T!�����J�T��.��㷏r�^t0X���dRz՗�E�aX�eu�%�%�9)2���\0\rP�BkM��,�\0�5<C]�ay=.V�*N�BȮ�NG#�#�/��ɐ��M?9��ǣ���;6 �����|�GL���m���`��W&z�+��\nFT���Yc 3Kz����	]om�;q1������Q������A6pA�x�CMl-��si��m����\"\n�/_��� ~ZVW��c�4�x�5X�g����*T��:ح���0����#��0ZH�={���WD�\"���<���{�I:��Y�(1���h+���MDk��k�� ��sQ��J�C��P\'��$��j�!����uD?ivG�+-��C���\Z��Oz�����,U����ʛ��h9y\r�t=ެ�����i���CV�Eoq��U�Bޭl)������7�[��u��U���-&�޻��6�Q��ꎐ8�zt���\r�|Nۄ�����#U80P.Ȕ�$���z<�ˢ�����i\'� ��-gT��r\0�P;ϥ����F8���g���b7|�K5*��r[`��@��Z\nnSM���U�1m��\\��q��F�:��\\b�?�>p���o��㘳�\'s��e�@�,p���U�PjU������IcT���XH����0\\_ww���)\"��a����E~;�r0��������f��n�D�7Kݭ_�}N��&^|�1X�5$&9�]�X�8�Ƚcm�	9��@\'\'E�*���Q&p�<\082ĵ���D^J%ȷ��F�gO�\'}�!�v[\0�=%��q1���Aml�Tcy5�+�+C)����Ýy�}��e�-��C�W�����f���i��Q�KA\\{�!�`Nne�\01��U��e�q��*�8\\c�8�@곱/Q���@�.F��19�<)�K�����UT�X)�g34�.�&�@փ��8�jJ5ll�{��v���\\�����\0����[YGcGU�C�v�ؠ�=5�����u8��E���a\'eJj�ߕ# ����|�u	���H�ǣ�����\n�?	B�\'�5;��S�LQ%c��ҳ|8���@5�0�\n�-�p�~\Zn���tU�Ob+�r}�䑈�\Z�~�<��q�.��/C.����GV67�\\2�MUr�\\~6����^jxxJy���z�D�܂��f=aDm��[6���*�uSGm�s���U��)y����)D�D?��zJL3�&6�r�\Z�&��`�ؾ,Gꊭ�^T�r8)�	��Lr��,��/��`�b5}\n�lPFi�����r^r��4+n��w����/��6R�_PH���i#�閧M\'�x4�Ѻ�����l���{�=D�\'��$icE���}\Z���&<�����ߏ��]^�<���탇w�Z��	�^�N_�N#M���x�~bH�}a����mV����Z�N��o��U���T����lY$�����%�9vá�2\"�m��<�H��MJZ/�c�\0y�mvN������\'�r����ב{��K�2jt�lz��T���H����젂���ܚ�+1�`��jp��C:�s�<��#��𞎖�3\0�U0���JjP���=�\nM������!�L�������+�Ç!����g��K%4���I��c^߃�]@��v�Dh�W/܈6��[�ViFy_�!����h^��\'!�g��D�[k^kد�.�$|�Rz���`����Tֈ6�=/��@4���v\'��Df���hF,<��<)w�lI{3@B�c�ا!��w4��H�M��?�ݨD�X����@Nb�b�{���u\")O_�n�/|�wkI�B�����7:<�j�]�C��n\ZIB�(�)�QĊz�\Z���9n��x�amM���OH?糙�8_��G� ��f�&*�%���N�B�u��pi�拤�.�Ԋ�,�k8:U�iLW�,���&���}��;�1��:��y��v�\0�g���,|\'�e>�*��\r���M������v6��֝	��7�@���ba\"LS���${�}�\Z:G��E{�6���xMU��g>�v��}�J5ͼ�m�����V��ۅ�4<U��qu�u�>h�s>}<h��|\'7�?#�V6���*����M����l�]�f�4�fN��W�7[J!9>�������W�??aI�0��; a��C�������D\n���u��s�5Iۚ\Z��˲����\n�bA<�н����N�\Z뜤fx=:������D]��#XMU��u�&���끳6�-�\Z>��щ�C8�����Py�/���F�e�#Ns��@:�>�f,C���H�3�ŧ�.G{/\'Y��\nlZ�^3��T������.+ ��>T&�>\'O������\Z�)���I<3��ʃ�X�^~�Ρ���Db��Dib1�~��ܠ̎����+�h�8� &��O�5���k��Ӵ��M�ِat��<��\"�֬��OW\\�\nex�\Z:P~�\r�XP�����ˋ��hRc���Wt�Il��I褨4�`]�8Y�z��@;A�ݷV���A��Iv��f�b��4K�!_^FO�B\Zրa�uo&��Zb��	����n�XY�^[���IښVi��)����.dڋ������>\r\r�\n\n�+ਨ�,2�,ϊ�Q������?��DdV .8E��6\n쁚�j��\'*�~���Ɉ�T�QG�(`�j��ulJ�)�_���%	���eiu�*���Ə�HЍ��]P���E;�b,-�I61��^$��!���՜_Gۊ�ǛH�+�Q�3���ڦ�=}p���v1����L�8�I��Q���Dr QIj,��.��pH��͊.J��9��kr����p\0Έˢ;J�40��X.�t����2yJ|��	�NY�[�qV=�s<���b�*�����)$�Z\n	Oܻ��I8%��$6�荗%Pu�b&ŊYM\\�)��n�DS��wTrA�d��8O\n��T���K.OAp�r�s5���5!(��\'27E�2s��=`d�����y�d�5�Eߠ�;���cum�_\'���DH��|��<�t��$�\'q�t���ݝF53�FB����P.8�zH������\Z�O��ݑ�@=�k�<z\'aX��	z�$\" ��[b����X_O�X�y�I�-�6�kꤥA$�����:�~�����O^��^�����H�yO����r�$$��&݅���yĔH�=Rd��+<i8�%�vL��bz���w�&��L���~-gl�ڤ��4�I{Vʷ��N�sH�	s�Z�JAU,x�?��.��kc�˙�:���f�rDaGQU�����:Ϲ��,Ϙ�֫�i\r�/��<�h�un���)2����������_�HE9�w�5J����y���KŮ��5�4���cs	<�:��ew>�6cڃ�\'�֏�\"ד��+�;�7���m[OG����\\a�g���:���g���9i�9��31�;�v���N$��K5�3� HٻK?`\ZW\n@|[\Z���m�W�kkT魲u�!�^fN����O�)넖ζ���d�<~-�3�\Z��B&B�uNe)��:�e3��Vn��݈˲>$>�A1\0v���\058�����\\�3��.@���Z�]��Ў&�@�������>3SY��GH�ǂ��2��d�4��l��#�d�y=�Q�\r��I�\n�K�����Z<l� ��%�f���8��;Q&���Bp��d�o���|�P�U����kO������u\')�b,֌g�{\n����3�u��u�>����]Н\n�U�w���$�|���x^�$�#�*TM��\"�sG�ݫ�c.�RT,(�xc�Yy�m�-!��٢ww\\�&�`wT|a�MD� ,ʵ0�hބ�dǶ���.��t�Y�LcdwA؆�&\rP孢Ƌz�SM�L4�ܬ��ўOI�հg����������A	�R�{K1�{ٓ#,��R��8��rB�޶*6L��q{7����菢��Y7v�SBv\0{C~۞^�����\n���z|�욂��\05wg��coevM�5;\n��ד�N�\"�)�.�q}�ZIW��K>jX�z��8��۬��������\Z׬��z6Z�4���BO��^w�}�Y�<t>?��Vԧ�������D��\\���Ao1���K�M�����_�Y�y�=�h|�0�imY��h���%>���\Z1�	�{`����v������(�9�*\"ʓ��A�I�T���,���+�����;��muk�Q�\'J�X��xbϒ�*{F^va��VI��;����O�v��8wW5\'�_��/K@�RN��҄���h%,�[����[>b������<�{�y\' (&(�_1�=x�Ài�2�2ΗR潴�x\"��Z\Zn�rS�x5QD6B�2V�����j6��Çh��_Bc%�EFwo�*@�u&�{���\"#�\n�n�5�5tc���K�)I�ϓ�����e��zr�Y����jh�\r���X��`�Z�|����3ۛ/\r��6V���W\Ze���k��n<�����6X�S/��;�[�#\nTD���X���|�Q���T��U3���-�����f��P9n�D�@w<�n�f;��Fƌ���v��!����\"�f�r�g9�ׂ�u����I��E�/��T7s>�.��	�x�T��4Z��~vxx�@8�\nz��R��R����kK�(���B/H�iNP���x��8B9�L��oj���b���@U`U���X�GR@��q3ߌsN�E��Os�]�X	ۯVfr������5n1�^5x��l���Ԥ��l�Sy��}bg�!Y5Ew\'�A��[�	���Ih�¿�.y@��R�\n[��ϧ���	��Ǡq�Y�s��M���`w���9>2\Z�fԣ>u�ˣ�![���+���]?X\"��j}c��%�\ne��:o$W}o��&,&�	�K�������l�e�S��o^>o[���)�6~�dک!�i���6�j|�^�+������\"���I_��G��\Z�e����׮N�W�O���_O��-�7���g���		�zKZ�w����4��&f�l�`��Ҥ%[�=O�h?[��>�ά����7��j��(7G���R�طBo���F�ή�)�\n�;�;����=2D�#R�GY��_���WOu��Ͱ>���U�s�E�g����e�����L�5��AD�n����~N���]��h\\�_�������W�� �ua�V\'\\�sF���7`\n�ҟ���g�>b��%�D;t�.@SxG{R}j�n��$�F��2�C��&7��Ύ,��|&g.��O+���2^;UM�Z��JbBέ����v�	XRWO4k��Y��=�n��%5х�e����e�.{&�aēr��`����>X���kJ���b��*�s�����U�!��N�r3�y���[��?��|	<z7�&ud�᝗�l�9��H���g��d�(�+�?��6��C3�Y��Y���S�YL��r<P��7�1F�tѿ�.�0T�	L����6��ж`L�X��M���	Q�p�hxFe���ԥ@���[��٧��E��\\�KA^y��\\�2;�\\�����pSK^��O�~����?rc�CJb����>.��}3����1!��p4�������>PE���KY\r3�=�^o�ۺg	�TйF�쁜�������^շ�o�7n��)��}!��$����\nǶ��d���z)l��`��o��f9���R̃v�c��A��6Yn;��b�z\0�M�f��(���5\'�����ag��\rk�퀒R;������4��Cg����B2\\�3tē�u�������<��Q�+̏0ϗ#���.�v&:1��q��6F6\\Rғ�KΤ��n�q�T��8�d[瑭L~\r����׎P3\r�򯤏N�����M�?�o\"��H��I��V���W�!�B�z���®4m�O���QWF�гi���zv�A-pp�06�W��Zє����D\"z�pjq����3.gmӾ-��X^��F��*��\r��ϫ@���W	��)NG���CR��\')ɘ�MId�	���+�C�Ԡރ���1�)\\h49�P�H�D\0��Պ�x�վ�ϧ�H��C��\0/�� �*���Z<��p��8��\Z�/�>\0��V;��mh39��VyH�`�a��E�X���D_���;��ң]@L�����#��ML�����Vá��̪�R�������\'>�\\T$��\'�|k�7�\0�F����Z���Sp3�؁��)l)4���s��2��?R�[��t[�.)S�K�O��ڸ��۝8��G7�b�V�\0��tM]C����wT�����`��r\'��?�7Pxݖ�U76�6����aO���O\\J�Ȫ�wb^�lq��5��J�ͧ�)���y��,\n0L~ct[�$I�!64�۳�Ď�@�B�XQ,�\Z���r\n����S`~�l�i��RCU3U�����x(�G�Uj!�\Z@�3j�Ӹ�L�.�Px�Q�|���@�~���\r>�S�j U�)J�;�(Qa�(>��4\'|�\Z8ߝ�H�y�z<��F����!Y��Ð�U�U9��\"�����*��T/�4y��F,����h��Ȇ��Vw˄WƘ�\"��������j��/�\rƢ��ju��Hro}�(��Lf������:���d5������y*r)�֪ƿ~�n��H5�4�s9�����E\r���7�6�W#��!F$7���f�)�Ϛ����8QQqR�Z�5S�����Lн^/K	��P �E�W󥓏��N�,��3)�>��\n��$�Xy̓fz���j�j�^�z����y�>���Z�%-�q���e�����۱̵���2��ev�Z|����گFŖ����r���<��4����M�c���x,����t6tk�,i��R{����𮜋r.{����7��E|Ue���Nu��Kz�p�F��VMXD~;ވt�ĉ���I�;x;�ś���¶0��B|t�ݓ?�]����:\"즷��mC^�h�8]<�1��H�;��+��f6���?�fEMm�yL2�ӽSh.�A�/2Tu$����ij�۠:I�e�U]s��P�쬚Aqҵ�m?S�,�@�LUq��]?M�r!�F\"�3�ů�VNYj��4՝]N���\"��1[\']y�̯$�����1���\'(L��w�٨ufB����ލ\Z0T��]�‿��b���mk�~\0�ʭ�q�5ԉJ<����$gN���:�\r��e�<���i�K;Џ�; ���xd4t!u:�,=eK$�ƕ!E�i%n����3��LxTD��N�7���I�>��j�����T,!U5�}��b�f�u�٦t�:�%��Z�&a�Ұ_����L>�14��UZ�Yڐ���{����\r�+l��1��f��\'��*O�C��p�H�T�0���Zg����\Z���s�j�Ct�\Z�q�\nLJf	{g��:�_�LFr�����j�T�eJ05S��O��贒�1�>����ú\"u��}�#�2p1��\n��>����n6�9�c3\Zq�	#�5���O�v�N���|w\Z%N\"�=�K�[���(em�����]�vW�������hB�rV͑/i�E�����$l0E(�\rE�X�Ȗ�^�r�ѽ���Ѣ��Yg����;�7��F��}_.׈o��+*6��(��4��Dd�VCB�5�\Z?�no�׾�\r�XF�z]W\r�e�s� {�	�Hr�]�A�^>�Y-Ȝ�MnȚ4�L��%s���\03烨f�_��񺋞�k>+�����t��Ώ����/KM���B��/P`��Sdq�=Rc�G��Q������ey���X�l��e�Y:�3d� U�3�Lo�9\Z����Ru4o-R��{jX��`u4Y7^S�I�T`�8�\n#Lx���.P=�a�s��U�r���p�q�qs���\\ͧ��ɏ�}����\r�ʻ���)�7����r�㜬�����6f\"���%�.k�[��-��݌/���bՀ��\\3�\":6m��Ɓ�1����9��b9_���i�듳lIn���*p\n�}6C��-\n[5r�6�^�d��O�!֤��φ�����M��7��k�#o�Y+˵��d�o���.�+��\0',1468278924,NULL),(10,'wAoGIn_B9hBe','phabricator:celerity:/res/defaultX/phabricator/634399e9/differential.pkg-pNxV2IffL7Gs','deflate','�}ks�H�����̬@�@Z����#���1�t۾�=;\Z�\"@	�вF��|�\0I��n#�D�#�*++3+++��?�yٴIQ��w��e�/���_����2}QW��\"��*�$\r��E�����-��ͫr�&�Uֆ�r���o��͛*�TF��^��������曬h2Io���(���m3;�<�!��K�K��K�}��E�:���Κ��d�P�U�G0�6_4���y�^����R3����u]��eZ�Mq�?�\rt\'ʛwI�fO���n��ˬ�iسr]�T~�٪��Gy�L.��\0R�&k_�$��eU\n��F��s���W��U_G�p�^�I�����\niV�	�)נ��q||xHY�Ko��su�����JЗ4��0�o,@G1�������>�0�08l���GC�0~ �ک�~~��&�8��#���u^��CZ!f�:��Ms�\Z@s>����\Z��\r5y)������7������X��&��t	�E(�t3��\Z�=ـi~�q�\Z>d�X/�pΩ֌�\'vA�c8�>��k�rV��~d��\'!ΰ�	�B�*p���)��]�p�&5��������8��Ȓ����m;�7ux��q��7M\"��Kr���8�B[ɇ:)�eVOS/��l����Z�sMkv\'��o�@DpKX;M��OTd���1V���x���R��ʫ�\Z���{MV��d����S��<?��j�R	\r�b��W��J+\'\nh=q~����py��L���ѧ[��v�C*q�a��Z�ʮQ�B�P�}[\'�U��S�B�W��EoE�BOE��ފ���z\Z=��*�V�v)VS_�������\n��,|�ÅS����:�.��\"a�}�S\\m���uB�\Z�\0ӟ�\n`jA8m+�`^^�yA��J�G\Z0y��6&�_�^Aw�SAH��R��i$��+�j��g�Y\0�N��U�AF��k���*[Ĕ\r�z����0gZ&��i�3�I/���Nl^�%�U�:Ӛ� B�NL\r��P��\r�2���%2CY0{\r�%&������c����t�>T���P�M���o{\r*�u\Z�����uy�A%�t���C�$���;]@K/�zT���uBw{\0@*�y4+|vE����a<�A�_7�@��c���!�`�\nnM�.�ukY̅>��[�F��:���%urk5� ���Ϫ�Y��X��jMʴ�걳lE���skt�#���*����?x�9�\0���XMv9��g�GL\nRD�/)S̞Q#!��yv���~����C����+��W�(������\0��u����5�Q��&��C����f�!ȸ��?��5!\ZR��y�I��)b��*�V�>���2�?[�:XL�TD���D�E(��\'�@���k�,���lHVP�Ư�[���\rr������p�3�F(x�ͮ����(tE~F�j��Ǌ\n����:�5\\aEi1�hE�SEWF��S��b���Β�c���*-�]&�}u�k���z��IgHT\'�Ͼ�N^\\��^�y��\Zp��:�Q\"�o2���\\>\ZTD6��j���$�Z(�H\r��p�e�v��Y�ݍ2>\rlpT�`9I�3Y��S�O9qbZ��o5�w��1�	�}�W��fd\r�zpT��+��EPG��S��ʴa��ȹ,�K�\\���{6��њחeʭ��Bz#Ii����V���ʒ�E\"3+��,�=��\0s�Ny\\v?e@@�O�D����-����O�5��zJ�n[��p�\\e��T_¯ZO�ʪG�i����mh\n��֑�V��(\\��;��)h���VpI@F�݈��9���A�u{�HTěV%jЍ�AY�;�.5�U�6�e���ឫ���<�WS�p{l�7�9�cZT	�����+��D`+iv�F���R�i��u��\"��V�[}�5A��U�M�x�?x�՟�z�e�p��N%XlTmOll\" �UV�y��pAF�P����\"i\ZN3Z;/����B����:Yej��dK��yF;�ux�6Jޫ��UOU�gn,er*diT)u8c���Z�;��>�Yf���I�ΡuX���H���.�(�����fպ���%Z��z�Oqw����K=���ʂ���y��\"��}����;���BlR0��\"}o�2d3ç��[{L�i�;��%�����Aj�������r�6��@�O�m�+m��G�0,���2ma��D�t��0:KΪ�*�5�\r�2/3�C��4��D{�5b��)��9�Ñs�J���7��b�>���U��ޯ22�.[���꼪��~�9&����l��]��4�]gc��E�f���b��D\"7+��9�ID�1��;�S[��o��,F�����Ac��jm�A�K׊�f9>���ϳ�c���	��Ҏ�-_f���%I�/9���,�,��4Y�����0�e~Żۄ�Ȝ$�SN��WU��`�|I��v��8n���Ü�HikL�OR�SEշ�X���;�C9�m�Wfj\r�e�)�q%Rl�d���7׆�jP�`u�\\+у�DE)q0���HH��@��@&~������BO�*���O����F��(G�LXא�}>���>?��tg���_[�J#�AHh&����b�E����M�=�c!\r��&�o�C��6NHD���S���cL$��Q[�\r�=�8EG�/�u�Hz�#�ժ��;��D(��J���Ҍ�(X\\\'�U�ub\nѥ�������C�sڹ�Ζ�>�*��w�߷�0�r*��� �8돓�:�ߓ�\"P9�)g��&�&��c�c�p��\ZfX4V�Z��j@AB�NV�9Cw���v�$잗���c�T����������� ��A���S�,�������3#�B�)\0.1X;��q~UV5l�6�M�k�h!�R��ꣳ�c�- ���fw�}�<�*w�4o�&���dl�Q�g�<��A�%By��?�\n�kx~3sےr�(ҋEVM|v>�����R��Q�FE�r���uUY_���\0����ۣ�_�������\'����C��y~��݃g\"Y]����gZ��Z�n��Nz�NF��iU^\0����Ԕ>f�Qd˖�\0K���͛�l9�o�Y�6P\Z�2�����p��?s�Zq\\�V��,,G�;�����*��Gn/����V:GiWz-�X���4Y��ӝ�w�KSm��yl-���;I������w��C���U�s��s�|���/(���*m+�(h�؎q1-�/��������q!�j;����d��q����=Cߋ-�؛���h����ή\0��uU@�D�l���V*��W!Fe\'���KD��{���oI��M7	������9tsz�/�%i�����qGW5�@#=Ri����L��*-uu��l;R�8���[(0%�J��R\rrP��9��?���!��̌X�b�L��@��պ��\n}�\n:�9D�&F��Yz�m��%{�uJ [�R�$�l�ٍ5��Hf�e�SRC����H���=`D#�C簓�(\Z2�I[{�\nR``�qS��U��B���3��âwg�-R�%I,�\r���6���X$8=��/P��@��l,����߼y[���b��]����§˼nZb�1�+[D���k��FS�\Z{m?>*9�lXF�����7woH���kqJCP`j�\"��<�ޒ\"��N����}s��~�z�����Q��=�u���*�-�=�<�]\"���>\Z�Ug�t��Q ���k�u�H`�.�O���M�۩�!�\0DAr5�r��������E�y|t0�z��q���q���h�Z;L�}�]e0(�Tp�n�ٶ}�l�M��0^�Jƕ��&~�A�Ȗ��\'����P1�K��AC�����G\r9����\"%m�k=�su�1y����^�@_E*���Z/��ݲ����!%k����b����uf��ı���z�KA\r¨/=��2S1����^��eugu�?�ܟ��d�����x��O�(��t�X�u��:yQ6Yͻ��@�mZjV��j���b*$*�s��0B��I��܀SP��S5I���9)�9Ъ$��o�*��!�]	��c��sX��I\r}�T▟}��s�^�55Q�3�\\N -b��e���HCA��\'�cnM��&t	䂌B[9�Sn<��L�X���M�Ǫ,o4O`%�k�����К�[}�w����ŋkv�3��ZE�u���������}Kw���r��\"=\'\"w|6���1V��kT���Ug^\' D��b,�#��ԁK��`״7����ܳ�ucY�,��F�w쀥�c::�s� JE}<�Y�3g\Z� n�L(`.����b�D3�K�	��C�;)jw�̞�A��Qq�IZ$M�:����Z\\��{�;�ks[tU+X$�*�l)�v	r�W�lqsY}Q��Dc>D^�����1��W������T�UÈT?�x�a/)Ā%_bU\\���Lf;56J�x��A0�� r�ި}�5����d�m��ݐ7��8P���}kܾ��m����C�K6Ea�ģ�I��m�D�e�sD�c���:t\Z�y���̒vh��:���`���4�Fah��E�M0;�����L����dv�	��1;�.){s��ju��\'�\'�i(؄��Ɂ��v�Jw��υ{�O;���ՐƠ����\n�s���%k�Ð\Z��@ug���x�m�H��d4�\nB̊��1�?p��1ѻ���t�~ST-�|�G�w��l������fە����\n�J�c�^���T���<||���?g�gmu\0����3e�Mb%:�tĜ��gC�{2�U�8\"����#Ra|��\n�BM 0Z2��9uOz\0��Ü}���Q�63��<�tn}$�)b���ڗ�iW��*�-��1	�c���,��mwI��a��W�G�C��V�s�1�U�T�S�?�R�>S*���͕��z�O�n�a��T�tVj�\Z���U\0)\"�hA!^�����_c\'Mm=�]U�uAɝ�َ}[��l5�Ջ��(KZ�St\Z2u�$��Mb�]֞�ۊo~B��L~̗y��K�����G�jQ9��mO��f;lu|��;$��cUҶ�J��j84��w�5�nH�3�(�`�jWC��㫇�/���)L!�Mn�z��5���H��H�����q��r#��N8\'��{�9����T�LY��vu]�D�R�\0�/H�p��iLM=c*�ܺ�v��:�XT�1Xų=M\"��UU���#l���$�ʎ<\\�S��6lm�E-��Jn%�We�\'�4̔��S�8�.O������de��������!K��߇������,��0ď\Z⛪���n�o�/�d^���	�;-~e���?P�<�f\0�n�&�����Pl	�`Ψ�������Q\ZNq���T��Ȁ\0%#%��zDSa���&:�>�4ԞI?�cϞ�(;��.���:I��[ioY�8\'(]�2x*����M��X�&#;e׀D�κr�,O�A!�+}�I��uzr~�CN���,m.���%���.rw�ɛ�Ӽ�0^���(����1\n�?����c��rPL�EMr�*��ȏ`�s�ْ	�Sqs&�;X,0��KG�Xןd�.���j�H\'�Jm@\n�����Ƒ�UM���ͧ8��6��~g�(�l4���Ie�\Z|�:r���~�k��N?U�N�fפV��Y5+2Ռ{a9d�sχj���D���w-[��Ad���$ܮ4��A��9:	w�f��B7Y�L��d�r�L���6_���r�0�V��ժ�ݜ���9��-�f޹��Ζ���r����S\r�N����\"~\n��L��%��D��L��T3�b��%�I��O���s��s	��?�=U����[\nzL�sg��ݭ�U��Mn-�=��~_(֭��.�(�b�`j�6-�c�uZ�n¢��̈́���>��e�hvԛ�bMJȽJ�b�K��u�Tu<9q7����ʋ��q�5Yi��2��ź��^l,�o�q�CՖQ�M��bS\0H��*��i�w܋~(��M3�a��.x���;��.	@|v�S��t�{mZ~��3�����.�����\Zu5%&C�%�<�O\\��R���!�Q��Zp�,D�a��&(��`���E�6@��s�bk����`x0x�X`�W��:eb�?����f�Ѳt���!���@:��P0aiH񡑺1�z[\0�?��v����y2GP�{J=��Ňł$�sh�ޅ�]���I�8���*Ri��qkAr������\\�)W�$az�ƃ�B�F�t�V<}��q���1+�����D(nt��~��:�,i9��3��RJ,d,��68^\'��[Z㖓g����c��)X�J���N�VXZF��]���)�K�ڈ=<T�b��4�g�>й�����L�����χ��I�ޖ~��iC��!��׼�\0u]����#VTַ�j���ņ�v�\0\n���&�Q�vJZ�^����F�ɕ���lM��]��,��Þ2�%벽�E��xn����`��oP������M��fT��F\'�d�?�]g>��[�GyY�ư|B> ���Dy]��bݎ�O 	_���j���Hn��)^�J��H�?��\r�\ZH&\0�%6wc5��__��d�6_�C��O`�be�6��7Χ�;yrå?X^U#up��a�=��X����tb�5�h�^��و��Q����fgx������;�����5t��%�zR��/+h�z�S<J�fU$��q�H#�A8�K�k����AW�5��)�e����oХ7>b��\n9MT+㺇��/V��Ꜳ���нYt	{n�an���ص�M	�5�V�m�^�����-�a��G\'䤃�����JP�S����ڗ&q��i�w�9�]ȗ��{�ӿp��/\n݉���Q���\Zݒ��3j7�	����kX��\rMf\'��<�����m�}OS����}#E[A�Ū��ջ�z�+�g���m�B��j;5�c��vd?�`MiW��#+��	4�!����_�����dn�><���|3���˃>���_2Z��jnB�l�]�����̤�8n&u\n��G,�\\}D/;2EغrHa[��Sʧk��Dآ# �1�!���m~�����C;9��j�v<�5C{��qp�kZ�c�*p�0�		��.(�����1���d;��M�ccX�)4��vb���Y:����J�T%���?gx�4��ʯqiĂ5�k��	�g5\Z�k�1��K6�P�g�Ȇ�e\0;��Gd�{�0���m��Ƶ��-����>�|��JN���ƪ�7�<(0��tt=�)�\r1�7Ur�^#ե�P��-[��m�(��H�	�f�zv8:�A�y�A��:#s����vD\"r�P�d�c�A�4W1����\ZB�\\%V�2D�4�s;�L�=�~�������Ԍ��E���\0�\\���½�#�i�V!���B�9�I�n/��+���/���6>X$%_�����b\'��M����jMHs�{ݠ+�ۻ�ǽ���0�Vf`hU��+�#�;x��u�gD�@6���s�6\'�6�66u��-�.�<���\"_H4�7�m���\\]��	��ֈ>��M��(8\n��$SV��^��7�-�}�R��˫肋�3��(�A[f��Vǲm\\\\Iy�u���|la@�a*�U_�k~t��̚/�c0-��ǵG�mR��:�������m0e�>�3����Z|�l�x\n#�M�]�iO	�Vx.�W�&|�lz\\�Rf΅���x\n\"`�U�\Z���Ew��p��uDM���fqe|@n�y�vև���_(��ʪ5��_��X�\0���N܄2�x� (;:Ξl�f�?q������\0���r.h%\"::*�Z��`tWX�3G��$�C��ˢX�VS2�3��̆��MO�)�Y�>��j���m�-������p��Y�V�t��e�cc���f�7��tE䈀9#1�=7�\"�dZ5䦻�=d_�f�w�W�o�ߪ��\Z�o����=kYn��t�i�&������E��{�\0ϻ����wJ�X�0�oe�\\7���]¹�j�pzؑ��\"��(��`��u��\Z��v?Y�U��jo��Q�0E�5΀:�o\"X�9Y��P�S�׆<s\0	�A��8#��]�o�}L��_\'����C���0[c���Y�4�q��B�\0g}y����ԛU ��F.&(���.�3����_�m�Va�+W�C���	T\r*�\Z|%鹼D�V@���f�Q f���*u�����)�\'�wR�_E\n؀c��:��F��g��q��xB�KM:n��g���U�V���|�٬z\n��,|j6bm:<<T.�Zw //5���7�#��̺�&�!���I\'\0����p�s��3;I��vCq0��_�	�d#���X�_��ύ��tK0ˤK�����R��N��)J�㣤�e��h>3Ƥ���O��#\Zk�����;�0CT��k��:_��\\$���;�\0ߚ��[���?[��JHϼ�v���m�&8o��֊&z���D�J�.�#	�wBmG��\Z���𖡃�a�\\�9�y�+x���&�|���S�sg�iX��*䇍�0D�M�ȉ��L��>v:���-=.1��&T���A#���qt�;��}�\"hH\\*���M��YU�����ۘC�_*��s:OY��Z��m�cf?(Թ>����\r�ޠ�6W\rX7��^��5,_����%���)���V� Q-�۟�K{LP�\'�|XA���^����uY���=Nh#�#�ۿ�@mn�7��1�S���%(l�tK	�-��WO\"tY������?�� x[Tz@#f�)Ŋ�,�����䙧�\n��jH�������\0����߂�{����/�n�)���4�zG��~��䫷�n8=�������b������NoC�Ľk���Wg�-3�˱�@9�bU/��a�L��Fy��È�C�4+|D�FL���~���&q������%B�5��δ�V��2�E�%��� É�\r\"�;�$�R�0oC��Vhf�9�=Ͼ�\n� Qu�[���v��MwTn�ں���=:���Cd�q�W�W���6m�ԋ�2�\r�0cvZ�O���F�5�Q���@B����%9���RLu)!�{XΉ۫}�?)&i��cfk��}/��A+F�0�3ok�Ѳ#\'�mlHB�6ݫ�]��v/�[CyJ���0s���nl�@��H?.���˴_+q#�a�>6�^6�Z*on��~��q�5D�)/%�S��hJ腻s|jی/��^�dC�u=���py�]ֳ�jF�����94�V�ƚy���o����KW��Gxޤ�Hw�I�UG\"�K�$⩬|a�#��M$�+�R�{�	t}�N�DW��G$�P얣��ո�n,�5��ώ�si��FA�uِ����|�x$�69�G@O���!��H>�x�6��\"\\E\r�ǊiƩV��v���7���\ZN�����=��ڄ�\0���Ǻ����o=uw��aͯ3�\'��`Y�/�g��8��Y��\r޶ҿv\Z��Y��$�J�ߗ�5�	|ω��l�U炫��ahA\r/Unʻ]���U�J؋Ϗ;��(qؖ:�+O�|c���l�~�#�$��^���\\K{���U�,@����(Ik�|沯פ���?��1�d�vБ�^	9�3�^B�0Ț�)wH�0 [U���6��QW�gXԇ{1ҵ�|�U��/�/,���9J�d�$�s��sn�G�X���#�嫑���gt{�on�0�R���u�)�S�oXF�\n/T�i�P�w��L�Z��V��jmR���I�)������澏�͎C��m�Q�y�r��QĹd�}�m�}��n�z|`�hGT1\\?��5<���l�r)�m\rc��I�v>�� �eM�;�K�m�ˀ��\r����O?mM���j2+�5���׶T�ޡQ�\n�>��AԦz�SZ5~j<lSr&?2�Z\r���^3Ӊ��<�<{�����,��ú�&���\0�v�LV��������\Zo�qC:�ǁ�bG��\\U�������$O�Wy�m��NG��N�/B�F��~qY*����,�)~���(s,�����މ�;��{���\\�K���Q��I$�\0����ީ��-��ю~S�s���Z�I+�4��(#�|u�r֫�C�`�h��@��P̍�5����s�L|_�ٯ��O6��Y���^!��ᆊ�P��uÝm\r�m��aO�h�&\"h�D�3 ?}��>}�y\n�O;���g�>�F��x�q��� �Hm�{:����	��u�4i|�\\	��ggP�(�4����C/xp�Ͳ$�3�H��?q2\n+D��V�$�ԋ���N=O؞ua����YY7�˄�������*�U��~|�����=v	�5Œ�	}�r��_8���);�\Z�S�AtD\'Mx�T�i��}����)f�B ��Č�i�D\"���+e|(��9�>��_�\\[� ��[�Y��Pd�4Ӹ�#c4���+��VV�C�\r�+���v�����m�P3O��P�P���~�S/�W/��Mv\nӡ+��g�����[{��\\�a���S�(�\'���e���P�qh`���/���T�7-�L��6�\\��)T��+V_7�k�t)6���86�K���[$;N�+�CKB�g�\"6�\'���jX�@(yu&!T���l�a��j�Ho2f9֙��P7���i���W�?�N���q�խ�gMV�Y�L�{sO��[�M]\r����(U�qc�нQ�`����6���C�v�\Z=o�G�n^�T�فT]s�\Z��TW�=��\"�[�I\r�b����J���n��<G� \'T��u9����~��k T��\"/�[�B&�R���Ω|�ޡ�R��t�u��V׹�5;\Zb�2@S��\rQ\"�ou�{5�B�׊syX�\n�������ǥf����j<��0/�q�8�ww;q)��_�����_�V�G8�rˊ�T���\'��|�2wiG�>���I����G5\\=\\$�-t�;�ԏe��3|:W?)Յ�k�<��2>mqy?��e�z���c��Ll�b�Trp���J����:0Ă�G�?Я�.��-�=�ȩE��	Y3��r�m�Q�\Z�rBG�������:��0�K����|��@�Օ�`����^���K��z�b��P���d�a�L�;�A�K�l\"h�e���#��AA�)]$�d�v����s������d���;CZ����*;H��y��8�Z�/(\n��_Oa��4�z��������j�P�P��Sc\r���<�O�bg�&\"ИR�_,�\"��k;��ݢ:aV\0���V�zc�U�w�����Xh���Ȃ�8�*�ِ���}%3+Z�f�V�|@��}��S+Px�Nb8�ˀ��6n��.;�]��R6G���C�N�)M�_�m>S��7��\'w��^��N��P^�WS<�bCËBI�H��5�D�/�1��GÊ�{�����J��Gϼ�Ku\"��os�\n\'wxt����˅0���c��\\����G7>�|tn�ま4�˦��rZN�k�D��)5d��L&��{�2nu�`��O0���\0m�c�V?UwY}�4�\0E��S�94�>��2�~)\Z)Mo��E?<��ox����wL@�0vΜ�3��b��n�m+z�X���0�\r�跾�>x�|�����m�3jP�h�xrssN1Է��5l��\Z{go�.99Ԟ/ƻ����w�/��-��^F~���ް��ӣvB��;?x:R��]��-^ݦ�7�R�4�����/���%=��!\r��O�褫��8G��?۝j�J���~��Bn� ��uŻ\'���pzK���[ ��35�E��Ӈ��L�|p�/M�^vw����������է�^���$��f�*Yd�c��YmCĨ���7�ru^}J�ڃs���L������{����P�@>6�\\}C�n��f����Ou�L=b��,����,�H�E���Ծ7�+@����!:Y��9�֜�}BTB��N=��h�`�iL)��Z����q|J,�b�?�~�2��g)\'�����e0�}�u@W(3`#�	�N�q�����>�i���r��>�j͐�T�n�N{�t�������^�S��l\"/J�;��	��Pk�\'���ƱC���!wLu�/2c8\n���R���[��z����`@�Q�M����mC��Q����q��!�^3�l�B1���uy{OC�r���}r�/����0�\r�\n[�@e7$��`\"?)�)|��\n�b1��:3����§7�>׏�]�c�1ۜ��yz�\\ݚC|��c����j�5%n�}��(\0tr\".(��޽�%�1�^�����)\"~�U_���BXW�����b��{c*C��¡ª} Ұ-R/\"�G���:k���\\EѮ՚��b��%���i6���W��<�ni-��<��Z?�o[Ť@����+�x��f��ε��r��> �����~��\Z��>���1ɂC�h\'k���VA�=��t�w�~�^U��ΒM}��ਗ਼Z����kXW�6�I�)o\\|�ר��v{\0y\r��L�Jy�\'��Éz� �\\�\r�U��c1�|�SbO7�1Ŧ��.ҋUE���_������P�W��k��lJ�[���I�����}�?�\'G�-���\0\n��҇���1�	M�K|Eܔ8R��އ�qMhvz?���\r���U�f�V�n��۾r�y\Z�\rl���@��?�sh���¦�c�q].A��@��ߪ��z��x@W���|4(֭[�־\r\\j:�N\'�|�}�2>m���A�H�ͽw��X!�Kd�#O�l6�J���)\\{\n�]d�o�-0*���-k�g��G�>���;dD���D�:g7�Ƭ�_� 9���J.��I������_v��\rϻ[�����I�U�m(WM�i��heV`[¯ګ<\r��\np�/��gt���Z���2[EB��#���e�}L��G@��� ~\Z��\0',1468278946,NULL),(11,'I1y6hvF3Z9dt','phabricator:celerity:/res/defaultX/phabricator/bff6884b/rsrc/js/phuix/PH-6NVV3j7P2h_k','raw','JX.install(\'PHUIXIconView\',{members:{_node:null,_icon:null,_color:null,setIcon:function(icon){var\nnode=this.getNode();if(this._icon){JX.DOM.alterClass(node,this._icon,false);}this._icon=icon;JX.DOM.alterClass(node,this._icon,true);return this;},setColor:function(color){var\nnode=this.getNode();if(this._color){JX.DOM.alterClass(node,this._color,false);}this._color=color;JX.DOM.alterClass(node,this._color,true);return this;},getNode:function(){if(!this._node){var\nattrs={className:\'phui-icon-view phui-font-fa\'};this._node=JX.$N(\'span\',attrs);}return this._node;}}});',1468278946,NULL),(14,'YkrcBj.ou007','phabricator:celerity:/res/defaultX/phabricator/db7e9c40/rsrc/css/applica-ocl7uHfQ.7Dy','deflate','�TѮ�0����E��W�?ZZ��Ғ�����[�U\\wCbL��̙s�|hj�0�[\n0��J���\r\"��F�¯���(�}�:pa�T0مM��H�L�hg��H�M����(R,�\nF�����`�����t&�[��P��V�M�y�A�Ϝ�\"�0��(0\n�o3X.9G��p��R�^`����\0�Y)�beeґc3P8Ef�����E\"����F�\rx�پ�E��\'U����f���=� ������y>��7��1�LZ��\\��Ē���F��aR��f�)�,R�fʙ��\Z���.\Z��Y/x1�P���ăך��Wy�9��OB���N1���4��^Tә/�����n�����tl���o�A�O�F6��f��V{��\r�*��mOq:���d�IF�;x}��F8Q�l�����b�9`�Q$����v��9-��9*�b�Pqo7T�~�j�H�{�*���QTlRg�T����e<�d*v}؇����\\���O��n��hv��d��.~�Im��_�.Y�rN}Bq[�ӵwb=D�i�N��8I���',1468278958,NULL);
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
