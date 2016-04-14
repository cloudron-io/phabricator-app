-- MySQL dump 10.13  Distrib 5.6.27, for debian-linux-gnu (x86_64)
--
-- Host: mysql    Database: 
-- ------------------------------------------------------
-- Server version	5.6.27-0ubuntu1

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
INSERT INTO `auth_providerconfig` VALUES (1,'PHID-AUTH-yfcmdcjz4wip5ucjqbre','PhabricatorPasswordAuthProvider','password','self',1,1,1,1,1,0,'[]',1460653249,1460653249,0),(2,'PHID-AUTH-ghyzqayeis7nrysrya3h','PhabricatorLDAPAuthProvider','ldap','self',1,1,1,1,1,1,'{\"ldap:port\":\"389\",\"ldap:version\":\"3\",\"ldap:host\":\"\",\"ldap:dn\":\"\",\"ldap:search-attribute\":\"\",\"ldap:anoynmous-username\":\"superadmin\",\"ldap:anonymous-password\":\"changeme123\",\"ldap:username-attribute\":\"\",\"ldap:realname-attributes\":[],\"ldap:activedirectory-domain\":\"\"}',1460653269,1460653269,0);
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
INSERT INTO `auth_providerconfigtransaction` VALUES (1,'PHID-XACT-AUTH-hs5ur45gu5k5ypp','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:trustEmails','0','1','[]','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(2,'PHID-XACT-AUTH-boeshdwpovykdum','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:host\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(3,'PHID-XACT-AUTH-jmkp466qri7oaai','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','389','\"389\"','{\"auth:property\":\"ldap:port\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(4,'PHID-XACT-AUTH-6rmb7z6oia36nl3','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:dn\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(5,'PHID-XACT-AUTH-2gfblklhcjcsyon','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:search-attribute\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(6,'PHID-XACT-AUTH-7dbciiwdvhj7k2p','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','null','\"superadmin\"','{\"auth:property\":\"ldap:anoynmous-username\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(7,'PHID-XACT-AUTH-v6av2hlxqhnz2ls','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','null','\"changeme123\"','{\"auth:property\":\"ldap:anonymous-password\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(8,'PHID-XACT-AUTH-g3ylsphykk6yzwr','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:username-attribute\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(9,'PHID-XACT-AUTH-rew22ntnze2baks','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','null','[]','{\"auth:property\":\"ldap:realname-attributes\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(10,'PHID-XACT-AUTH-asxs2mkmez3jqll','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','3','\"3\"','{\"auth:property\":\"ldap:version\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269),(11,'PHID-XACT-AUTH-ikvicsieto7xufh','PHID-USER-qqmzvldb35airtloynr6','PHID-AUTH-ghyzqayeis7nrysrya3h','public','PHID-USER-qqmzvldb35airtloynr6',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:activedirectory-domain\"}','{\"source\":\"web\",\"params\":[]}',1460653269,1460653269);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_unique` (`keyIndex`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_object` (`objectPHID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_general`
--

LOCK TABLES `cache_general` WRITE;
/*!40000 ALTER TABLE `cache_general` DISABLE KEYS */;
INSERT INTO `cache_general` VALUES (1,'KfK8e6XQsQaP','phabricator:celerity:/res/phabricator/8bdb2835/rsrc/css/font/font-aleo.c-7fvq7wpxrde1','deflate','��Kn�0\0�=E�,RS�,���	���1MPջ(e�Da��Ú��9qY���ƯK!���(��0�b��u¤�~�n&�T�Z�I�Ğ(�Iu���T$�3�aF���iT%���~xz�+Jm?���+�7��yzxV����q2���R�Z�ˬ���q��L�Wɹ7g~,b�����aI���1�	_�Y�V\r�wIA�q\Z�����w�jN�m���q�c~��\0�=�r\\�y#@�4���,��pp��������4�$[㤡�4���{�� z�-S��`��',1460653190,NULL),(2,'RJ5XW2bhabPp','phabricator:celerity:/res/phabricator/027ba77e/rsrc/css/application/base-J__ZbJvSxL26','deflate','���n� E%R��\Z�q�s��fb��`Q{U��[����,@١\r�V˸Y��8#�&���ZF����2k�Ȍn#��/C�3_���^P	\n��?���I�G�3�(E6����8M&DI \"H7m�I�\'%#�]�f�h����m7?�%�����?���=O�MP������d�V���X=�&߈�y�����I0�d��d��C�K|��6�4�7#��KW�@)Q�|\'�؉��7',1460653190,NULL),(3,'8jiSPdMasdo9','phabricator:celerity:/res/phabricator/b9538af1/rsrc/css/phui/phui-two-co-ZfzdOBm9T1iw','deflate','�W[��8~�_a(e:�g&��P(��.,}hY�,[r��lI�e���J�(r|M�0�|�s��ū\"-	�GbF�,�����4�a~�`���̑�`<x�$I1�.AĤdY�.N�`� ��#���٭�Vk�1� ߓ�}�*N�+�$�}���t�־\ZX�L�(�Zn!������l�r	��W���1�����#���}���;��m��|Ǒ��K\n�}��E����Ԣaz������K���g�#\'����I69�<��*(R��v�7��XT��Sz) B$�W�v6*Q��p��2�>�9�M�YB(n��5�y�ʶ)�4���g;�A���-�$+F8|}��p�O�2\"T�a����c��K#��(뿿����A�7Ǘ�2(�	�iC\Z�[{�[(KT���.6\'���x�R[{p@9ꁭ�v��-waRe�1+h��Ov[�{��I��B���TH�T�s4�3�EmL�aJr\\�]�Z3�`�H��`7g���]��\Z���[Cb�T]d��f�Aナ�m�G���,\nqJ(�4c��-f&�������v��h�����50�~\n\0�j�!�[f����Zw��<J��/��fCSXq�&�z;^�s�HK�A�Cg���oӠ,4<��\Z��qP{�谈[�����frG�꺡�Myjw�m]YK �Qi�^}G��W�T���n�ۅ%2�Es���vH�%b�#5��q)�PQ|AD�G֊���լ#7�����{�}�]���#�1��v\\�I@+@��&��vK�ױם�T����$���[c��\n�^瞛mn���	Rvh׻	$>I�\'fV\rW�:�}�ܦ��=������گ)E�����I�rG%\\#�띻\\��Z���A��E}k��\0���5�\'�;ͦ��q�*�Y{x�K�2��&a�(���1�\Z ����\"=�)���-�����:\0��yv�\',%�*����No��X�l53�tr5l.��Lo2	-	2�0�É|�	',1460653190,NULL),(4,'G_.240XDkwOI','phabricator:celerity:/res/phabricator/9cda225e/rsrc/css/phui/phui-fontki-hNxQ60x.0Uyr','raw','.diviner-document-section .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif;color:#000}.phui-document-view .phui-header-tall .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup h1.remarkup-header,.phui-document-view .phabricator-remarkup h2.remarkup-header,.phui-document-view .phabricator-remarkup h3.remarkup-header,.phui-document-view .phabricator-remarkup h4.remarkup-header,.phui-document-view .phabricator-remarkup h5.remarkup-header,.phui-document-view .phabricator-remarkup h6.remarkup-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup .remarkup-header{margin-bottom:8px}.phui-document-view .phabricator-remarkup h2.remarkup-header{padding:0 24px 8px 0;margin:32px 0 4px}',1460653190,NULL),(5,'f2R.vANEu3rE','phabricator:celerity:/res/phabricator/c7ccd872/rsrc/css/font/font-lato.c-Dj4S0TLFyL2d','deflate','���n�0���+�@#m�m�a�\0��fR$\'D��6���IZE�dm\\8 l��f�#v[�D���|�i�a�����z�W{g�s}�{�ʵzXpy�j����\r!9�zp[i�|̑�!�xZ:X�t?��9���k��ŷ�vn#�}ƀYv;����ŏ�T.d����ԗ��<.܂��a\n��JA���H��W	���oK+��T�����n�8����l�p�����_m�{�����y��1M�J6�\"7�=�^�V��kE����8���Z��h�B��1UЪl�b��~���� z���v��N��iPi�u`Ǫ�&���Ls�I���@���L�r�5U���%L��HQ�EL�D\'K)kJ�A|9�|#�땪��nL�HGhT�L�7���PN�5�p����Pt,Ɵ/�N#\r-J���$��+��	���ا)��_q�m�/',1460653190,NULL),(6,'u3PGH4Dj8lX1','phabricator:celerity:/res/phabricator/3010e992/rsrc/externals/javelin/co-ILq98pGCN3DS','deflate','�V�n�6}�W8~0%ث���E�Z,�\0�\0�a�ѡI���f�{�CҗX�>͍�9�C&�F�Vh���X%;�\n�����p�5��*�v�-3W���Pϋ���ic��\r{�x��Κ(����i���!�i\Zo���4zң��|���˄��fÕ��i7�����q\r�<.l�Ri��&q;�~�\nqۛ^r�lK0���2VU�5Q���>����®�E���7D��2)I�c[�m�6���I(a�! �X��_,�����gDMjV�����9*�r*�q��a��f���K_|��--t�m΢p/���`��E�2)n�����r�=\0��C�;�v%�i{^����5��zC�-$~����F�(e���5m}r&�ϗ����=_��D���B����#ǋ�5�h���2�Z�i�Cye�_��ZY�`�6p�\Z��#����I�=K]��F��w&\nJ�mk g�~�����[|,|�v����z=O��ݾs��+,jq��;���-u�d����P�/A�^���ͥ�_n�L�f���K��F�3��o�\Z�l,�U&�`�}�4��Y����B��@kp?_�3�x�lGue�;�b���z����fz*ĥܞ�Ϲ>\Z�s��r�����謫$�a����d�\0~�����ܩ�-%������ugq�i�\'��qF�s�{�t{���p�^0$.~r~�\'.#���su��Z���vHy�%D+2����gA��cMg�E&�X�(�%S��9^�+�_� ntSs��*�z��^n�wS���(T����\n��3,�qN��my�C���\r�V7y	�����۽��\"�9S9�����n����0B<��\n��p����\"���7��`]�Ƅ���n9�\0�*�D)\n-�����g���<�:?_qX�1����Q{����6�w1�Vv�}%{�\\(�W�W�_!t\0x\"~ {r���팽hu�\"�\0P�g2��؅����h�#̬�B�kot=?�ǩ�O��\'\'1��E-6�����G�����GL�K���z�Q�ޠ_�s�\'pV!!?����<�d��3���r����u:�������SS�5.�\Zs<�p�h�D��-E�����!ܐ���AK���*�a\\fˀgG7��w���De�8(�\n�OC�:�V��Ԣ�Gݘ8�����R� �_��9����p����Ew�A�t�K��?',1460653190,NULL),(7,'YSH6x.tE1sxB','phabricator:celerity:/res/phabricator/82cefddc/core.pkg.css;-TJfpznEIJ_6A','deflate','��i��H�0\n�_�����!��sl�I�};<��c�%І$p����\nZI�T�L_{���$H�p�p}�󻠽� ���wS{��w|W�w~W�w}W\Z�-�K���K��	��[�f���t�wWyw�w�亦�SgmY5�?,VTC�?q�-��w�w��4�g���75���{�!.��X,V��ޜ��?�P|���8�<k��i��o\n� 2g��)����WM�n���ڏ��\'���Ə~��{�~j��(j��\'p]�+^�VSe�&J��~7��g�vU���7�i�^��&~௙�9S~��	}a�����(��۲����Ƿ�Ƚ�D���v����� �\'C�5�?]Q;�Foc�$�������UV{wX��pD[�~�-�A�k��#׽\'C\r��S���s���c��l�\'C�����p?�np��k=�`���q���a��#i��q���?���X[d�ު��c�ƴ�����hH�!��4=�\r���� ���n�>̓�����Ũo�ț6�7|蓚i�WnP$�?َ��2U�����J���|M����= CAu,��~���o�ɹ��LG\r�J�%3�_	�wܺ���	>y��*�a���Dd|�����ʇp�����I7�\"�Q]��b���o�rR?�92>Ϊ�#�L�%\n�Y���O��+������H������S�����?cl@��ds�,�pU|c}���R�e9�����/U�L�e\rׇ�Z�*�7�{���x�d\0�;�|WTA�߿�U甴4)�>�o�C���5ch��`��3����h& IR)�7��Dq�>��}:i�@�p7������_�>���|���\"���#u2d!q\'��D!\r�B��է��w<෗Ga�7���?�o�̱������{��o��-۔�Z�D�ӖG\0F������ ^9�����ON��0\"�\'聿ĳʋ1���s)״?ؐ)}��8 �ʗ�)˚��s�q�W��7��$�������V�H��sU]����;ʇx��̿RuV~@�|H�$��_�gͅ�ɿ�֐EL��SS�C��ga#���Nr�%p�w琴��-?B�߿DC`���F���f9=}�J�{��O�TM+���9�ʼ{����?|n�>*#~���L�#\")Ed}N�~�7h)�8���6���2�����u���?b��5�L�9�������8Yk���q�������l ��}����O��?��Y���x�lYt��Ӏ��9��1�<?{�$��F�vCgU#��@�gd�b�ͧkQ3-_�m�/��Q#;fٍ�^\n�����9�~��I�V�I+��oW��-�ʗ�R\'F{��\n}V5�~a�&�tU)�,��(5�Ne��g�:��G85� ��\0Y39œL�_�q�S�l�L-��f]��̂����^-�\r���;���`�!r������ ]Ч]�5�kH1�������d�z��5B��T�����؝Ń����M��f�~��?G�&�)�&�۴�=+70Y�E�óE��q�b��Ot�I�|�E#$��R�&�5M�U���`���q���d��~��8��R{\"qG�n��[p@bC�WY�ߨ�\"\'\'8A���:#�7��K�:Ň�q��vɀ���.�gn�\\���q���F��l����ﾤ�7$���ur�W@������������C>b�\rj�\0�L����@U����Q#ܚ���ϲd�g����7�|���X�y�������;<D����O)w	<ް������j��&}(��v�`x,�6��Z�Q9������\n6b�R�L�#��-j>\';�G���}��r��|h��w��)\0�&��?����/?�$J��UK�s-���\r����6��|��3��(�[��B	�q̗���oPB0���H�g41��\Z���������~DG�ר���7�l�-3G`EV����Ϛ��-�e?{�t�p��t���_6���h����W���~�§�V���ϭ�->d�\n�1�ǩ��qP\\]�<J}��mG�td$�a�a����)���_\nꃐ�V�_`G ��X���&��pm߈6�\rt�F�!�o���/�Q9���[�7�����F����\\� �%�����\Z[�p�`�j���\'��W�	��7�pq��Ya��P������B���+�8He|뮱x���$P��݁%�\"����W�z��s�+F�~�{��C��U�K���́f�\r(CVJ�Tt�����\Z�=�~��2�껴�&�p�\r��\"������6���/�n�5�??W�6Qo�E���E�;��b|����-=g�w��\rB���+ ۨ��Z�#��dXP�r��`n<o�O�s+٣q���xQ�KZ��3��>���C��g�O֐��|��g�_���|�o��OtJ����j���J��n�$�_0v����&=�>�e5*ʮ�%���ޯ᫫����V�ΑPޡ������t�qG����~D\\ّ�x~���I6!��B��tH�!�|V�]x��B��w!�?�\'�\\a�p��Y8�$E\n{J�٭�7b�\"m9D�6�Cه�:ntX6����D��BQ�@��V�XX��j(��[D���G8�$�:,����4��1��*��4f����A@t�}.�r�\r)aAe\0?��N���O����PF�Oo�P~�����8?MQ5�q��_Z%��w��y= ���\'�R�ēkðk)�Eߣ��!���J��sE���U�|�4_��ê�����(�	�<�x�K8����N�W����X2-�~������5��Ԣ��O!\\�g�^jKV�{[��r���	�lS�Qr�R\Z�$���4Zq��!�\\�x��5x����^�Y��+�T���%#z��(>\0�m�b@���C���q��H_��:\nD=�%�<����x%eF�d�n\"�G�>�����;D#��.O��P -t��l��ޏ̱r�����]o��m�Fh(���%�S���(��[X���/��ފ��V{�;�� 0�ʆB��O�\'�� gP}\\�;>����wJ�zs���W�]4�d��Z\rW�Y���yE��U�Bt���}�+5�(9��(���C�(	p��X�l�L�G^��X��k�#\n��l����j?�J�~~* T���D��̪\Z˩��^?����iT��LpQ���\0�G�Z\"l,����~+5���2@���<�ڿ	��~��-C��;byWW�d���l���R��r�	��R����Z��(<�lf�uw�� @��!�]����d�[��ݪ�m�3��5m\ZT�)��^�cK�O���7B�N.h\n�)���@�]�@�\Z&����J�Hgq�%yN�$ٝ��G\"�qc��z[u�\"�Ԧ�v�.{�Ŗ�fޤ�7֤NԤ�� �!B!�:2�n��[�a�(��8�l���\Zi#�A{֊��E�M\'���1�l	OY�n�||T�q ���d6@�m���U�}2��P�o��ۖǋ�yu�\r�b�a�z�;X3]o���>_��C{�����e�`^_ݩ�D��\rq�9zTk\r������}}�(�iitK�O4y\'O\r��&�y�8����\"Zh�1t<s��׾�E�>�8�Oo�#w|D��K������ƶ��5�� ��%Jۇ�,��Q9�\"�ǚ��K`�[GJ�;�&���%pv7v:v��Ԃ�x�zW�zF��@�j�x�=�VY!���H���F� \\NՓڂ��X�x+\\���P��&���M��AI��@W��~�\"_ΐ(2H)e�p4S+h3��,����ɗ�j�`96z���n�����S�LX�B9�`\ZU�;�7�4�ݏ� X�-�$\Z����l�jO	�vbe{�q��K�ə�#��_�>,�WK��7��E�aQ���1?��|V���e��\">*u���3�!+/P���|Y6e��g���}:p���gC�l��w�Rap��e���^UU-4\\1w�\Z\Z�E<$\"44���YG`��hOcvW���A�f�T�P4�{+��k��y�R|��N܋��1{i��c�H���*ց?3\'��8�m�Ғvr���	�~�W�S��G�ON�����IK�_�i�|$�HY���ܽg�9�]��]_0J_Wgzh���(�e*�m�h�n?Qk��vp���g럩���#�n���%��/��K�=�wv�{<�C��U�����\06Y�>��������%N�=-�?C��p	��h��a/��e%��d�����۷Ǔ�;�@��	�6�79��3ʩ�Q�e��R�5L|�ʋ髬H�Tey>��ez��^�7����\\�~����Eyֺ�ĀJ���9R�^��+�]R���Ş�5Y�\'M.4�,In%>�U\\�\ZH�U����up:��b��=�߷�X�}�=a7\\R�d!��iFW��x�)󏷍����Gs�����.��[U] 5�5�*�͡�x��\r�+�7-�E�@v@�h�����E�>$����]߁\'������QPtf���H��L�K�s��K���gnY��>|R>�)���@f!�&�Y���V|h�$��_�d����»��-�lZ$pt.��������ђ�����d������SH軙�n��	+!\'�W\0�wW�Tp6�e|B\rH�g�x�.�u�QWEnq�^B�oe�e�&J�3��B�/CO\0Wv��>��\n�F���OOP}���Fhf�-UtX��\'���%���7�f���[3���J�4Z~��?�%H9z���gG0����zP��/w+M�<��]���W&���P�#��/���<9DM�?x��~�\\5���OJ%}R����q\\2o�	�K|�E�\Z�&n�H�\n�\n�e�Cl��TM~�HU�q�y]�l���(�Ϝ�RVnH�c����d_�(+X\Z?�;Jq�bi/��(��C�����������}��ŭ��|J�)b��Iw��������_�\Z,��[�#ǩ�u!��t;��)�\"V�r��B�p�)97[���[��B��Y8��~�b�Ǐ)�Y����I9^�C�ϣ���+\\D��S�\rwH��n<��a[���b�w#�\0�\"��^����H\nh���Ì���3�F�����kMg+���r�K�X���Q�q�j	\'b��	/]��}���h��*WHT�g[�o�q ���G̀�@\"�F�+��A|�T藒{�3�y���:1�J��d�&5�2�*]|��7�Y��}��dϖxv���2��n�D�TM5#1�G\"�v�Pf#�,�������E@ak�|!�m�Ct�QD_N\n~2�#*.�,\r�%�LSY�OL���E�K7O�v���\rM��n���>�����8�\Z\'��@�������E�q);Q����e���� ��#0@�l�Ok�:��T�T;\\�%%D#db��L�4���ؗ[���5�}Dv��\0�\"�_�����tl3N-XAv�|�X?ǵj��\\l�lLު�r��.�q�%�3�����tf���=/�u<�T+��q� ��VV03����M�+*�8�^U&#�t�opQ\0�\\�?Gn�B�?�P\rO����3�%ϒ[^�%	�mBP��e��o�󢇎+�9�\'=ӕR`\"P|\r�������MZl�M�n E�l�>��9��7�핊LEy �R��:�8���U��%;;�C���~I�B3��=]ҏ_k�Ń���̪˲HSE��%�د��/��9\0�S�~���h�e�z����׌B�4Eӹ^ � �%U����Fs.���GN *o�_� ���f���\nI�oq����-/�T��\'.-�<��\"���D�|wL~٭9#ק�J�a�K��w�ޗ�J\"	��_��g:|ǳ}�[��x+e���[3���=�^��>��2��w�-M����=�z����w�Q��[��bp�������*��V�,�aW������$���D��J�9��g����J�{sW���6�Խ�C�4[��)s�}P�\"\'kL�����p������_t���a7�\'�����w;�AV�/y��񢖽R�G�C��hS��«�*��O�CG�9H5�x/x�XJ�\Z��KP~j�P^��\"+S����)��ڇ���Y	��~�l��*��Lʺ1�m����3��U�^��Gh��3z��\"k��ұ�f,_%�ȧ�\"PbkWn	�}Y���˗[��Z6�U\"!��V\n�Sy���b��No��[��V��Uv������6����́\\�JD�@$`Ut��}�z���|��:�ˊ��0�~�%�)#|���,�ۂ�N���)-�_�C�c�d�~�%��g>9���ð \Z�JѾ�x]���D:K�7\'��җ�$��۝��d���\'7`Y�xV\rJ�fa��Mr�{ŞW�T�U�o�Wa�%s�%_lEy�%�|Q��J3����,�L9c	hY�`ș]\'���{�������-�����K.��ւ�;g\n]U�?|�ɗ���XY�����zsl2�^+3���ٷpy�oVB��D�//����VbuU�~���4X���{�&�+w�S��\Z���S	�$�sW�c%U�N\"wߵ������WS���Z���:��ǂ�P\\=�a�ۊaC��!<��|h�����k�}D�Pt�K��{w����m�g���x\0�S˗\0Ƣ�fd�Q�w�����@����\'���IMX`�j�?l1�)ʧ)��.�:�>�O���R%��*І������X���2��0������D�o�rҹ� ���\'��Z.�V�	�NR���c%H�n�7�{\n��g�3��s�T0����gq���<�.��Y�[T���Go�--��r��������Җ=q~�g*��q-*Rn&\\-��g����˽h��#\'�N�E��b���alΜ�D7_��(Qx��DC3��\"�<���\\�k�\"KN��<w.��ҍt��@d��V>����s�X���Y;ې.���W*(�0g`�,���f:$�L�=����hq����HGM{��NO��VFj-���0|O���q�W[����7r�`O_�MESVp����.U��@*Bj�jV��J ��᧌�S���#8�z���Em� �����?�Ġ�\'�@�G���0�eX?����hc1��K`|9~D��|���Lf��g�/��C:�	*�����絬�An���)�͒8���On|D4�I:�6���K��\\�S��6Z6��+�rM?�\naˑQ}Q�\'���J����b��?�`�)����qK��K;C����,ꋳ�j�Ou0467�B�(���\Z5\'�<�-%�\\*M��JLB���-R�_�>�p�b��G��O�#���f��7ɋD�\"�0�]T�eX�t�X����֟	Y�Jǭµ|Z�{����7���+��K�bif��C��ݸ`�sD��\\��.د)�-�B	������:�+��I�f��ii%�\Z!?q���_3�qfC(k�\0�W�!�����҉�ށJ3�2�r��A�Xf�Zr>{9�R��h�^j,��yR4�D!\'�g,�\"�R��p��r�&�kH�|�$���JF�pn�R���Yåj���M�ǪA��Ұ���$PB��0���6)��w�F*�QZ���)�ǀ�$��(���,�����Q����3i(�1���_�$��k���F؍ԢM9B����R��6=1\"�8�W��V9��9>��U�6(�_N�\"��oOL\"^n5}FW�O���jџ<�L �_\Z�2��QC���2V�9�B�9��Xe\\�W���V\"lz�@�8O{\Z�Ĺ\r?A�g�\Z�ৼ[<�������W��75oA����єD���ϕfNEol��G:���X� Ҏ˥�ҵ��m5�f��U1D��iW\\-h,�b�n�I؎<Q���l�?3.��PP�x>��\"�����~ʫ��8`Tf�(7J���{y�t�O!>6�Ʃ9}������f���/T�G�u����*[_�\r��\Z�d�0Ux\n�AL��b�js9o��\r�k�rv3�8�\\^N-\Z:=D�BF8\0����\"�@V.	�Vޑ�@�]9\\E��Q:��>�hGb%¯Np��-[�Yѻ��V�ʘv?�hL�{���Ͱ�p:K=2˖�-��J��W��u���}WX�>�(�ۣ��_QsY~�\\�\r�	> ܠH�ө�\'�Vy��\'�Q?�A�c�w����?2+;\n��5�������\Z�X|�S�\'+����|�)�P_����Y�����Fܡ\'y��I���a�������\'�NF\ZZ\Z�pkN�S���+�e�!�S���y�]�E:/�d�0��T�˃��B����	S_!�NZL\0i�*�;-����s#��xB��R)�\n5%�#��\n��f)EK��΢�H�����=���a�����s3ea�ؗ�#Ϡ7\n���B�G�G��4t�3��g�3�\0|�6)\Z\nǓ���85FW{9���mLf��JD�f�Y�gȽ��� o�ϨT�~��C�Y�t/�(�\"	���ɯ/�|�_��1x*�jZ��ڢ�]�\0�P%^~z�h�~Z�����Y��E��5w�39-EE��G��m^�q���U�7��u�S`˔��u݈��[�tn�T��2�A�0�x�9�STBd�%8L���b�)(AH,sR#$Fꯧ�O��0���e�U���Q��\n1��l�h��i��;���Nlk<=�@�)��\n���1fE6�R���8��/�)�<��	�O�,\"�B�q��2���6�U]��x�K��!.�\\��Q�=��U��l�Buק���|&bz�K.!r�,����Nz���?�lwEh%b���y�g��ʭ\'h���\n�K��1����^\02�i�y��\n�Z�C.BJ����P�4�rT�đ��mQ��S�]�Q��y�j���F:��	�ӊ!��ؖ��LVI����f��u�B�*2L��Dy�	�7�_�S�&����i�^N��~g^�e����]�#�\0\'�����S\"Bב6�$,���;�\r?G��6/B��l;�>;P��~�=V�%b\\���1���6��͆\r�{�-m�m��;i�x���T��苫Nh��7\Z-ɚ�X83@]_�+�|Xs+�3.|��5��m�����7r����Wsj��n�u��T�n;�@�K���{��.V���)iu���a=\Za��P�:wpdz���=r���Jh���~������٫Ms^[9��Tǧ��ּ�,g|n��\r���^�Yz{!Z3\Zh�&�����C�����H�����7g1b=�\0����i�t\' �c�֘$D�3-���g-��/w\'R�1=q��3@�Ls0���Mr\0V�YD�A׶�F�T�!9E`k��#MPDG�aK�c,�%�ޭ�f�tS��y��X*O�౰�����L-w�������/&�Y����B��F{�V��uB-��\\�T��/\Z=[��%>\'.=i�@PqJ���5�1�־X\\��mO �]שA�aa�B-mX�֗m`�Q��{7�\r����V\'��a��Iݚ�\"�a[�oV[>�/�\0si�$B\\Iu>��m��ɕL�n]�s�{������ڋ�����[�9�	_`\na^�Խ��XBY@��e@JI\"�܍�J��b�N�\Z%���*}䤩��Bύ�%�KPR�ĳ`�\n��0&[?e��y���<���Hn�{OO�e��z֧�f�#OO��-y�۴�����<8��AM�EX\'\n�3j��P+���Vw!:��{u�\"�n%No��=�\ni,�L�J����|�����������c�#�dZ��j�!��*��I��k��E6Sʀ�5��=�-�_�\Z:qT�0g(��3m֐ŊX�y�/����N���e�*D��9����;���!���C��\"� a�3��>����F(���K&$;S_��(J��K��3�hLӆ�\0���E\'A�?ƿ�@�lS@�Vv�uO��3w�\0�t�şi7�ʲ��?/\Z������\Z�oP�E����U��F��S���#>�&Q2�Lt�p�f?i��d2=���}h���{)I�5��i�/\rMb\'���fIU�:�C_8)����8�S�Eb��J���zd��o����#%��>R�������n���P�������۽Cw��b����\\��Z��N��q�*�t��M���fr��	\\aF�rebP������g\rO����3�+:E%�\noV���&�vF��b4�}\'^ץa-IS�Hf�c�6�*f����,�J�O\\ٮV�L/�(Fa~{��/Pee�2�RQȗ|ʋex�$�Ẇ�Ñ�Z|�f�cQ�]�%�{J�gM��|X��AV�\0�.�L�f`�㖥	N�J\"��J��O�%K�c�g1�n�J����˻%W_���cU��p�+T�p(�y%�XW�\'�B���I����}�?s!���\'�\'^���IϽ\0�i��%�f}،�=qyy�J�/ϒ�S�,�Z�S�hY�Qx\0�p1�*����1�`���Y#��E�\'���e�\"�0��+UN�@ƹ>(�Vf�\'�|�o�^|9y\'�\\G(�q��Of�)�犏��:P�Q_�rǷ�@����Hd/�5��g��H~t��H����I�b�35jD-�)T9��P��o���A e3�[�:%��\"�ŉ�{��h��Q�s�8��c00\0\"�`�\"�ˣ��Kq���N���^lUW�����V�{�Fْi���\0�͛,�,>��w��FzexI�Q�(m�N�8��B�>k�)���Z^�M�m�X�����ŷ�n%}��}hA�Л���ҁ1��E��2�^�WdX�ai�Q��3���OBvI��}2������5.r�E=�+-�pD985�����v*o%�j�l�9�EΪ�A�P�6�k���qlQ�������}g�~H�/�^�������(�GS^5���j�zE�>�Uj����qJ-�Lz̚��Z%�t���p���\Z�w�6��Q�Y\Z\\��~�j?y8,ȟ&ʕF��Yɽ��^��A���U��.-�(�ʇx�+9%aQҗY�e&�q��Μ**ʼ{���@s���M\Z��0�D�\'�F\"*]���u,�z�\0��*�9��ME9�j$\"��97���Q�H?G�ǸPd���\"�cL��x�I����,��-��U��ͦ���\\�#C��\0��S����(Z\\�\"L�0�_�<9� }B	5���&��aa��U�^�OhS��>0LA�8bG&an ZX��x�*�]�f�eOA��Tn9;��x@��>_���>��k�+����m\"�����3�2��	ܕDc:0��h��J3�7���Lcc���\r~�/ju��D���������_�G�2��8Y��~�P��F���0�&���u<��;�a$M���3q��Ʈ�D��й��,C�+��R��ƚB1�<�[�r\\�\"=����1�:y:O6�A}iΤ����8�[{�^�{��hP�(��N{����؅p\n�LΣ��Pi�y��aB�vo~�`\n9��F&	�Iu=�ߨ]��S����(��\0EP@�k�Qm��MYW��zO\\��Ɓpw�ݡ���lפ�h��G^�5)�Gs��X-�8�ڛ~�>\\�9���f|��P���B�]/�#E�\rOU�i}e��ļ�S��Ӡ��Ka���:���ڕ�7C��K��\rB�w�<2\Z\\�� �AW>tG����\n����zw^c�]���fwf�V�.#|}���_[�[�q����1�/��3\Z�Dd��ƻ��Zۭ�nki.l�(ҷNۦ\\l�sn\rk�:���6�䧋&�\\���Vi� ���ha��[�#�Z��Ў��A�zjh��RIc��\0�����0�ҭ5��E��K}�k��nz0t�Ԫ��6o[�T��)[���V�׹	r��l���R��	b�1��ڝ;f/\\���j2�Զ����*���t!m�f.���t>�ǋ����5�n���vّtS�v�9��-����{���b\Z�lւ���dD�]\Z��)ҁ��gˢq�\r��;��^���\0����)�߽� ��t��F����q����r�/�>c�m�G��ޜ�����9�,9�2��Vm���8]86>�]�`o��^��Uk<��&�-��fi�N�lg8���������i�gf�,��!���vÇ֬s<a�4ʝ�V�n�@\r�홮C�e���UG�^�rP�AR�ֻ�5�<�!7���Ts%\r��ɶ%b��:j�8�7-k�ʭ��\'K���ɤui���t���Cc(���k^�(\'����6ZZ�xj#�yי���n��\'K��y����n���j�T�rgh��.��@b:��ܭ��a+q���\rPE�[л��q7\\��\ZL�>��#�tX��Q���f\"8��dɂV�>\".���o��h��ڟM���h��샘�B���L	Alb���1�F-��s�ߔմ{����;pu��i2��F�Ûp=HrG�\r��\n�N:V�6o����Rn:����擭�O�~c�:��l��5�O����PM�m��8ӰF��h�����[v����3���Đ�;�n����Ԕ�l�k���U�IRn5�1>]\\��E��ϖ(m��,�Ǔ��C-�C;��]�Mӌ$,o���Á��y����A)t�3�yM��ku��0��d�=�����M�=��P�S#�$E[�y��&��m�8[���Z4q\ZԵ����u�1j�n\0qӽ�&bw63��W���6_/��l`,���0V�\0@1Tڰ�b��Ĝٺ5��w��]�r��	����\"/\"00W�h2n�׶5kݡ���gS$����Z�QM�(�!���ޮyq���!������pr�S��Ԟlv��ȁe�/�!�-�@�	� Gt��\n�-��:Z�̑5��Ezd��>^0C�ldA5��t�ݫ�?��e��V6ܨw���um�X�8d��Z�����B.]�g\0�K�5�pI�nZ�aG�.�B��u��\nA�9���[�66�Ձ�ncZ��\0�H�A�������v��i�z�\\7 �46fw��������em�w��I�^��t����PU5Ɠ�D��DW�H��`\Z�_r��lC.ˊp�&���fvt�Y��6a!pE�[oS}��l5GѤ۴{<!��v�Z��:.�#E��{{�,�o�6E�Y�=�o������Ξљo�e�G��a¶>Dy�V�Y�Rݚ4V\'�\r��W�$�����vc��g�F#�m��/���?�26f�e�7�pw�a_��U���MY���c�irm�\'�\\�4{2<�;f�:Y��Y =���s��k3tYO�2��-n���9�m��y�1o^��	w�����Mn0�ݜ�3�4��U���o�zWG�i��moO�{��#�GU&p��Ɨu{��v	ܬ����M_1^\Z���>��a� 7�-Tk�6�.����\\�ke9pڂ�6F�<�ݣ\rf8u����N#�=��� {T���蹻m˗U\Z��Mk!�v�ߨ���$�#�ҙ�Ƥ���\'�\\��\0F��\0/ho�`.�##��c��C�����c{�}t����؃�q����L�L�,�O�eK>������o���JXoB�bs[ԩ�ņ/�������L���s��&;R<�K�����\\�1�E��0����\rX���T�c&����C���sL��a5G�%���a��4����ۯ�?��U\\,0j��e���׽ɀsۯ�.��\n��l���}���/�F�ͮ.�8<׀>غv��Go\\p�l��	�&#��w���A�d�AF~x���gi�R�mmu����{Ӊ�}�u�oSF[���fx�0�����0 �������;D��^�%_f��ޞ�hT\\�j�+�є�m�u�u�����?��%�QN��[�_y]yw�R��z#4qi.l\\�E�}� �X�@��������`��k�;\\���\0.!lɑ�qʴ�j���@�)�p�l���g t���e�[Im�F�C�7�.�Ψ��9VwQ�9;�;�ɼU��\Z��<���h�Mo���*8;iAMq�Z������`�!�6]R׷�1�oO�Cߨ��qk���b	@�smq!\'�Q\0~�S?ؑ�����BN��M\\;CN}��Ç1B��C�0���S�	���om��C��&���KZ��]:k���1꺧)����փ[n.YD]�F��m{E�t���{d_e����5���e{4�ody����6o0�8�����p�j��&j���@vz7�@����&�ږ84Q�Z�F�f�~��𶻟\\�t��#����jA����S���Kӗ��1;Jb�h\"�ц�dc�t�=�)������n�����������ϗ9�Q�n�تա�-4V��5�K�um���Y�����Y��o�48����M[+ǣ+�>�Qٱ�2?I��lt��iE�\'��~t�]��Y\r�i6���ys|����i����˝7(��q��MGх�x�M��s���lǦ��	[R�)q�sUl�\r|ı�q��/�Zs2�Ĭ�����?�v����1đ���#�!J�~��m��VsuV���Du\\G���{�LQ��,��n�-v��VS�5���F�T������k��Jv��C�]{�\04i�f.��y��%r���ALS֩A��\r(��[���lE9��\\g�_�h�ں�Tk;�d>�����x;[�6T{�go�u������	��ˮ�K��B����ėE��M�������׵�&�M�����L�[�����l_��$��\0S�E�y2����B&��hmUw�O0̴{�|n���B�<�\"�38�����6�.X8�,���|;�pǕE��qsbFy$���&K�����<V�\Z.y��v����S8��!Oq���n���9#�<U�����<��$\0��������������yWb(��j 9\r�v�G�^��\\V������2�խ�i�/��}\0l�U��6���B��˥wۀ���J�y��=c��&%3��\\��5}�-E�L���1��7vz�W���*k;[��]�D�c�\"[D���z�!�!J�-P�NM��]O���5����xr����q?������;��m��:��=YS�c��OVH\"Ӿ����a��V�\Z2�D�����b\rP}� ;�串<�9�����Rk[\n��40T�)8\\54�����۩;Kq�^Np[H���7�e[@�	�����U�o=\"\'�ؙ.O(s� 4.+�%�s����\0��^D�D1G3\\$��)��9���љj���a#�j�g}���kt�p�����PK�����VK_*ӹӴ[;u$���l��\"�#!�\0u�u�[c3���ޑTc5��W�\nz�5�Yڦf�9c7;b��	�^_�0�v7��A�=!�7�I��c�z��n7��B��\0@kE���2k��θ��yb�U��v��,���=�������m0�ަ\'�yֽ��p;J%e@]�5ľ�ki-6�A]��|xu����}�՘㞸��\Zw����VY-g�S������)�LeGiLK��n4Z7�:��V�w\\�T՛>�RJZr�Z��C���=\'���<o�K�d[˵�*J�:ʭ��D��]�K�t9a��%�0Hțiǫ����į�����Co�;�Τ�\0�S�q�+��v\nGk��m]��]�����D\Z���Ĺ�,dzM(&��ܺ(��-ٛ�I�۾����Aõ�5���2w�51[���<WW�;s�\\��=��M\\Y�����Z�S����AvJ�k�=\Z��I�⛵���b��)6�zo�uYjͨ׉ĳ�\r�T��#&�O*Q��7�mq��x8L���a;�Itb����K�U:��`4���PW��K7�k�d@&C��vs���_�*����v���G��nbh��D�/��bDQT�����Z�aW�9��`92�u}��XvG*��}����5��\r�m˰N�C���_���*H�t�f�\'�,d���3ޯC��aC���(��:����؄��4��%Do%�q��\r��5q�ѕm�f-�<�6�q��2M�#6v�\\�hO��;�sz�l�Wcd�������	\r�Ck����$!k�w��k�i\r�Mk���篣���C�iö�*\Z<nM;於ɀ�wڪ�f����0_��^+����.lS�h૽abw�[�\\NA�J�\0�v��Ηy��Xs�}md�:~�k��l�Y�R愹�(��P���5WDo%lVl=��tF�+F]z�2���=���Ѩ�Rm\n�\\݃��毋���>�8�fs�-��x#�����v\0�M��ay;o�F0F[\0�#�BK{j�Pz�ɕkRC���/CIŻ2����s;v�\Z�ً�H�GiX�#���:��Ȕ�u\Zp����c����\\6k�`Ԃ��{s\'�p�K��¨��k��ŉ�R�(y�����_��=�]��\Z���F��j�o�ե\rݣ�r�7(�Kp�W�:�th���=�ҥ���0�z�ޖjӽ�Qv�\0��42���XW�����\'qPs@��1h􍾹�\\�R����\Z����#�v�iLN۶�f}�8PM˄�-��<M��陚���j\"�И.��ћ�ā���ze���8��L7<ps�ݭ�6T�4\\b=f��#�H��xxmu���\Z��]wD*�\\�,P���M�MVWK�Q3j¸������4WKBc�ИEO��3)�!�yW*�Y\'�Ô@�:te�(Ɂu\\`��1Ғ��A���!�;��p厤�z���\02Uo{�؊��\"+���C1�nypX��џ�pG�s��]t֋���Ybh}�v����K=j�V��Èa�	�o������Ukj@{�><���ົ�+��C0��uFW�aIɵ����Yzd�qݳ�١+�l鼭�nm�V�^�p�wZ׫q�f��d���eN��e�@�myD��ђ$��R�@��k��f��Խ3��-TS����e��5��ܑE�L�i{�ޮ�ç�ƙ�Q�̗�I�Y�6t��-ov�-�_n[�.R��+��.��r/r�i�Vz�y�=�.R�e��f�K����iH#���&��t��I&M�gL]R��O�X3��Q�=b1�_���Qx\"����v�P�t�;gd��mƳ!�:=R�iws�ë��\0K\\ǡ\Z�LسNv�s�X\rM�X��ֵ�<j���В0������MsutZ�&wd��!pn}��7�>�����s�;��6Ht�>�W���2�5�zA,��n%��ߨ�x�R{`+c�z	�ehOn7\r�Lī����r�*�`��fF��9ڽ��`���X��Q\\ \n�_t4bY66�C�\\���`&�R!�_&D.9���B���a�TμT9T&��o�b0���	?*�� ��Tn?�t�q^B$q��P\r�̤�(�$����^�1����w��(�NQ�·�[;�3�:�E��G!��Ec-{s����8��%\'��G��\"3��D�N�.��} w��{��20I����Y�|��V�a��t$�����.ɜ�$��7�dӑs��]q �l��BH؊���}��i���WP�k���^��M��t��J<��lxe��v�x%Q�*0���2�	�_��6A\r	-�a�a���WU��c�vO�) e����]����+K<Xs	_��\\+��x^t�R��w�����E�n��	��K\njp*񷠲�)$�g�8l]�-ូ}�9\'Z����:S��y��9�0��7ǲ�}]4N��ݡA�dl�0�����7�5��	4_I�}wt���u�k\rv�]o?������V���#�t>8�т��C[�0_o�\"J&��ἓ���9�e��iW?�H���:v:�j͋apǚ4�5%Wh��Q��[\r�H�p`5����3��xCT��\r��co{<R�68��!l�;��z3�^0a��l�~j+Ggǎ/Ⱥc������f�=Tﮩ�lHc��W|I��\r��z�1��Tܗ7�-����h��q���7ov��n{��7oڷ�Hg@�����ڹ\r�a�C(�65��&�e�����1ON�3�(Z�����4�Ꝗ��zRo���-#lM�¯�1^��ّY�ծ&Hq2\0�敶v3��u�vk,2��[7(�FM�lGvkz\r�aT�RS5�x�&�&%m���JY��L��V}��P�?�z�j�ju\Z�r�M�+\rt�wNb�rZ]O+���\Z�ksuP�}�=�[�l6��FC�:��9-����Lj�:غ���yFn����:��X��Q�{}M\n�mW�\"���L�cv�Of�FO�!�t��:\0-zu�S���oZ�v�j14:��2���J���f�G7�����\'��Q�+����\r�[SW����i�Qw:�́ !�*����m�� 3w\r\Zf��4�s�eU�LX���9 �t�ez<Gs@�\'B;��\ZT�,u�#���a4&��@N������i,�������n�=NwV��}[t�n��]n?�n{��Ԩ�w���Z��F���n�\ZBL\Z�ٌ�OM��%������v�6��-؛��̈2a0�ۑ��=����$F�#����v��j�¢�>3��&ZgY�^OD��6���U�{�{�\Z[K�:oI�#��F��9S�`��\\z��N}Λo=�����C7�0&B4���h_@���b�쌈mM�OcP�h}���c�5\'2�؞MPnu��x�¹ˁ���ly#I�l�����f���i2�N5�rn`�ˣ!��bD�f4GW�����[A��8n���M�\n��\r68�����({u�y���!�}��}��p�.ה���\0���zLg�o`K�����:#�f��Zy-pFΨ)��K;�n�	lw�4c6�(���m^Z<��}!셠�#��c3i��#a��~%zm������e��^��h�Z�~!{d\"�v�#�%a��f���Vsq����:7�Cc���͘�\'w���awp|��m y��ղwS<m���y&���������=�$;�����+���=f���l�g;����;�bq��XMhڲ�n���_l���4�phb��:�k�go�6�<�?][�Y%6��V�l5���؁�~���g|��nt�4B|�8�PP��T�����n�φ͑�ԯp>6��m��zk���HB\0�~F��v[C$�>�\n;��>r�H�3�)���%�̥�ϊ1	������!E�l���rku��}z*vܚ�u���X��͞+���kLO����5��\'F?��V�������j�[��ܷO\'�;�~l-�{���:hz=f��Q��N���qn�͡�Z+��9��A��@]ou�h]�3x�8�#��iMiy�������:�Z�,�,wg�B���nrw]w����w����YSVzgVs�q�]]�r��\"�?��ے�yߟ�#�3�H�ؚєcݭ_�v�ϔ�n[�HA���r�r�q0Pw�Në_�损Э��8��{\'�9�ǭO����_�7Z�\r���a�침�%��wWaӛI��#��=xL$�N��zor����9�k�^��wq r�j�IN�j�	dw%p��\ru�\\,�ݸ�:��A�@�DԖ[�u��\r\\3=U�M\rd���֔�2#�u�s�V��l}���Yn�Փr>��e�1 ��Q�gK������v�u��R\"��e�eo7��ͦ�:S�hUk�juG�e�2�sK��mw��O|0k��P���(��HtI�iۇ#�7\'�����j-���ۣ9UF��҆9oxh>;������i\\m\\�lH�V��t6�wn���:���\\�0x����4�q�1tb#ԇhk:�xDaև��/�)6�u�U}�5!Y3���c�hJ���2f��)���W?��#O����3�����[;�­;���������A����|i6���kz&9~o��.]l�w������DoZ۩g�\nXr����e�z2\\ix&LIm���5�)\'��	6����������1����}_uW\0\\G�֍1�\'�%J���j�����)�?u�?Q��ih׷(��ko�dLHRf�Q�c�������P�_���P�h��B�e]~����F��Q���P���	>4Ar����xu�[�^o�������/�w�\\�ϾW�z;��3|��^ţ�|��4��>|�vYߚ�⸗��j�cW�K^�~T�o�e���}�<V��gsY��g��l<���3�Ϸ�*������𬮷���5`5x6_h#ℹ����h�%������|>�j}U:c7	�%mȤ50��Q�G���0l��>\rQ��\0n���o\nz�\\�1˙bsmm6\r����O��OW@u/(ޠ��cq���\r\rz2Rs	m0�=���*�uw��ǌ�1y|�7O��ɋ�rΩi�Voi���P��v��]1���Zlk�tm�8W�5Z�M��==4p�n��^a��z�Tޮ�5�즫��DG3ӑ��iu\\�\\��]B�A��Le��B�z��~BY���j�67��U�\"�P��i�\n�5�|�g�/�:���8_��UW�A���˵�]<�&<��]ݡzJ���:�6M��8��z���\Z���.u��U��U�d�ޤ��\r��i�$��Mք����{�3�H�a���΄�kl�}�=��|�Dwz��^�|�����=��u�e�C�h�K[�&3�qÞp%��OlSv�j�vo��U\n�z���\'ڟA�nӹ���ʓ�6�L�:(9cl�9����߈�-n�z����;�xe.ʊ�mǼ7[����<;��G�	Ph+�L����eV>���s[�{��:��coK�d���A%(S���~g�)���YR{�O�=����\Z���i�=G�z�\Z`����4�Y�a�.ʆ\'V����W�|�?���x�Z��\\pO��[��m<�x�����%o̝��C�O�n�a�^�<�D��̕埽\\S�5j3�،���t��w��j��G�u��`�迎�i���ҡ������S08���V�1\r���A�8���I9�\Zcs^w\r�\"����vWr�GK����dv���p�O�ާN���ҿ���xަ���Q�\n��r0z*#�=��>i,ݹZ�֛��lB4e-���w�1�`t����\0 y!��氺M�+Wk`�Ò\\�m��6z+�@��9h��S�����i����b��L�Pܗ������Cd0Ǳ�9\\��9c��~pU]j�,\rsB���<�纳�ڳ��v��<2�#��7�~��UH�\Z�怑צ3�/W�y���{��\"1�O�O�M�;����3%H�j� ���٭�ј\\{�m3[\\����!�%��\Z�7��\'{v���^�Ս<��c�P�!��|ٌ�+xr{^�ԁ_l\0c[c=�H�&��\0:�MQ,�Qx�X����{�n�I�v��eݾ�ڜ�a�~���!��^��Ԥ����\r�\0rr\0n��]�k�ŵf���!|>��B��r63�x����}b �=\"���b��|\r�_���k�}!}��cˍ9��=�8�Tb�x3 ���6F�����k6�P�kq�Z�?BH�qz�n8P���Ԃw���f����!�X���La��yTϐ\rs�!�x~[�ZsN(���I�ͭ��y�ڦ*5�TnC����`|�Q����B@�/w]]�gl�c��@�ꭣ:<t�=�(1�6�j��4\\_��:��VCSz<�R�H)SW���Y���N\\�S	\0)�D��鏱ڭ\r!��uw8�¹����2�=g_[2��x��\'��mX\ZL\'����J��s����mӸ�\r|]��v�;�a�ܹȠ߮����jvr�����4���yh��No����Q��?�]�쮝�Ž\"�G5�}���&>�6���`�6���&��}�l�!�il��(��P�3����������]�?�C�	��B\\��F59uv�sҼv�{l�][`���mo�~h/�m��ݴ����h397���%��]���x�i��f��U�\\EV;�r�ǧM�UP�t1�=��M�X�!ϗ���4U�c����k�ֆn6������k��B�-�N�����X�f�M5I�D����l�4k+�{��h���v�.����b�{��p���B�V���\nZ�P��km�-4�p`�>��v��t��Ф�.���\n�@�ho(�Ʊ5b]{�\\ȭH-]��:Nk���Z053G��:�v{��|f��Đ=5�ZVMd��7�9e΄�]\r�\r��5��|*�;<G̽朳\01j�V¸Gm��0z���\'}��W��u�>�r|�贗��~�^���>u����e�����q��sЖsI���3���2��(s8m����k��9kL�w]�n�6��0\0��뛀RKd�lk]af�Z˃Kw�M{��)@��i�4�l@Bo�b��n\\g#�S�7!W}�g�c�i��Z{B01ft5\r����v����ړ$�r9+\0c��t��t:vw˅ҤGʹ/	�S�\0�<��jH@R]y\0���4!:U�����u$O�	�}�,��GqI�c���\\���Y������~m�61K��\Z\r��(�z&��D�N\\7cP1[=g�&��)�S�~K[o��\\2���u�C�tG�Ң�J�T���7�9Ɓ���u�Xo}�4b3ck�ص�Ǝ�\Zu�����gm��8��c_����Q�.�nSS\\�\\�zŏF�-g�\'uƧ�Ի�O�|DD���|�|6�IG����#�����e}���6�%�[#�tiۋ]{��-ڠNL�\r��@�/�n�|�kRB0����0�XS�N�f�̀��X0�Z���I�d~�\\�<�m(�4q�dG�L6�kQ:�c�e��npm�pG�h� 0�쌬�#9�@�I�ũ����>�+�ݠp�r��.��Y�q5��W��|}�װ��(;��ĺ��m�?h���ך����z�-����Щ���m�%�����\\%F\"x�:��<:��ZO�p}:%�j{ˈ��������~Ds��ln��i{;@���z��4tj��w=��י��H��Ox乄��0��}C��������y�[�`��ڈe\Z���-�B4t�F�e��\0s�>�쩎6h,\Z�r�Ի��9H���껽L��Zd�Ƅr��� 6��4l�tS��:��r���7P�v\0;Q���v-l1�]�$7lu8�ꏕu��-���a.�\\���\Zb��IC���FOօ�2�t\\�hӹ]�ޞS[��`j�����&!�����t7pCߡ0!q�.�6��z�z�� �;TQV�y��\n�]!�����՛ƞ\Zz>�����x��9��.��+�����n��Í�#���в���(���^�c�$��w��~mĩ#W\ZQ�aT��k˥�[ǯ��l�I/����F�66\0�[���Lǝ��U���#b�1�&�N_��E��\"����v\0mi�;6!p �����(.��b��~�Y��C�Of��m�B��5Ἡ���\"#�Zg5�d�9	��j5���J���|�P�g[���z�zR�f�q�5����\\��ƍ`��ZRG㸔zs���k�r���m/�+Մ;��N4l_@\\�o�v�\"�I}���O�$m\"���x0�65��6��s�۩��%�ځ����m,8���6ћm�����ٓ�][�3�m��um\'Zc����j��&,6�md����r�P�nǥ���x��ˌu��n�ܭ]���m�\\3�˺9h��i�E��n�UW�=mv��|v�0p��0ly�̼.\\�u�1\'��t�M�9)Np�xm\n\Z�u1a1���b8�o]�c�ZL@��I�m�^�͍CKyv�}֖�=\"q�87�ҙ���Q[M����ֵn��ݕ��v��G����>���os�,���5��s�gb{�F���n�6+[h��K�]�4��I�UP�b�I\\v�ss�\\��[�z�^�50�M�FL$�QFz���ש�2F���|�W����&���atxq$�z�^�O�h{���ug��]o�\\H�0�%H�s�\n�\Z�Xm�E�$�/&a��8ni\r�rWa�l�\r���<ۻ����YY����E���Ԋ�/�A��\\Yh���=4�kba������ok>4S6�z�=hhMӄ�īXY���ra����>�Q�\ndX(�6g�YՈ���܊��?�l&��6��U� :״�*�JU�\'���h��}��ņ?��h8�Ɋ*�i�~K���l6)�g�a/�\nИ�ɟ��ب�g�]�q3eA����QB�-q��Q5���z��ڰ�#�4��� �-1�V�J9lC`��\\�2N�B�ʆ�;D�f˒��歵F�醠GR��c�3�ߏ��[�W�e�j�����ֲ��I�;�����#�6�D�)c���|�գ1y�R�t.�WV_�l2�� �Oj�H����.�#?���%�ig���e�v�\r�~Qѭp @��f���,0!�e�҂��Ô���̀�З!��������{S\r���3���>���qf�Gޑ$T>�!8�N{�d�*�By&���D֜7��w�(��W�rC�S�r�2a�?�Sb��U�P^��x�2���G�ʤ��l1h�jy��$�a>EU�5-��<;�q�s�Ϛ\r�4_-�\r>|Ë���?3��	���uL@EjIw�&i���lJQ.�t���L?� ����i�O9o��N��k�xO��� =�n�>?_ׂmZ>�F	����\"v�<��eϤ��\n�������^^���_�_l�y\Z���E��nF�_��YA��@o�xR��(�v�y ���%���#N�����{��Lx�c����O$�(�oɰ��T9�}#�vSD�O�����s��CS�2˃�\\��zD��9Rʅ�3��-㷕a�/nT1�M�*�+8����%i+̙���Da��)L��������gU�4�^��5�X�!,d��*�U�-\r.��H�����Q��y*��]s3�,�Zp�nj�y\"/��q�Ȱ�	�v�r#�h!�2���V�T�x,�� G?V��~�R��)���d�\"��(�$�k2I$_F���f|��2���R*�4IW��tT��Q�zxil�{��^v���&��%ⲿ-�N�Az�D�B�P��TQxƩ��I�����+�RG���,��hJ�:W��/l�E��^�y���C���X�!�b��7��ȧٓAk�W��E�	R�#�b������\r�3x��)��s�������)��<�+�\Z�/�4MՏ���\'���>�3H���\n�P*��z�2=]��o��,T\\�j\'Î��~�~�z��s\0��e�Z�#Q��Z�,=�_���a�P>�|�0F6�[�~f5�\'A4պi�J��X�U}�a� Eݯ��0&IH�!�	\"M|?Y�h�>̂\"�T{��2��,ð%�y��&�\Z���<G%��a���e�&+��\'���lSR51r�����	�\r«v�����R�te���9�����Ȧ��WE������S�/��1(��iS�z����Ki����5(����OAd࢞����xB�x\\��\Z�?~��l����\'��Gw�Ó>}Ɗ+xC�ǔ��/Nrq��!Bb�Y��5��ai\'\'#C�ޤ��a��>�2R���WƻD��:\"%-�+߆��\"N\',�v=��p��I��^���*�\n��ar��l�),�Zr��(���+ȱ9���\"���+@�D�\'���)���o�Ћ{�4M_<���|��~A�R?�#�خ�I�T�/ßQ�Kcn��U�e9�JY�-y־��~�R!�C�>Жe�ԋ($F�\\8�\\���!�I��S�����R3��*���\"/��9�\"g�����&?<���g.T* %�I �\0R� r\'9Bdņ���h�(�5J@�s�� `� H%@��\"pB_,�D�+�<��W�����5�^�����Ea�\'��%�MeB�ɻn��Oh߫Q���(\\1�_���$Y�ӑ����`�~��{\0���/��*�r�v!�r?)]i�7�.�D��Ɍ����j�8�N�Ґ���H�t{o���[��������M?* �d�~���_�נ�$�R���h����2���e�_����%�E^�$�-�˓��~�K(4Ħ�d2��s#�H�&9AA���7�̩�_]��i\"�����C\\�t\"*����tL��޿�#�V��O[|��o�.�J+T��������9���&����i	V ܠH(��J��d�n�\"3>yڊ�Y6�{��J���!V�����zu�#��09I�?09U���K�aHcC�#�e�SauU|#y��H�_�	WIt�X|\n���u]�W��r�o���q7/��!3�}\nHDr�no��eJ!�����F��.(���c|�l����V�[\"b�k@?��w��|���H;�����\r?�$�i���K�T�^i\0�|�R��硢�}������\\�����a\Z�`22��l��_��/�Ga���=��-�6���L���,`��5^31T=AmTBQYG��i<����W�D���(�-e���/剀k�V�5\r�&����Q%*�\"�&�����b�T���	��ւ���N��JZ���n��=Z��Ri��j!�����M;��x�׺ Cq��	Z;�������q:o�e#�έW�v�������xB�i����^[/)�������4���Q���Z[h����b��<����{��X.�	���u|%���y��v{k>��w|x}�O�}S�μ���X������_&�:���wn��*x�(��Ȯ_��K�6�=�k~�3���]g�خ�ga�4{j�1~?K���@���y����sp;mox�O#��r���d�Aoc,�Ug�)��j�CXQx\n��ę���,�~���[h5߭�{.n}9�7+��q���ip<94�l@zۙu�{a\rj\\� ٟߠC}�ӊ���K����M����d,��=�M�%�����<�`\\\Z�����z�m�f�7�G��rye�=t�?x�E�f�=���4��\Z�	��?6�<-o�\"��a|ݭۀO�Kj:�<$k�a;M����`Bf�ԣ��v=��~�yH�\"ZI�o����ֳ�7�^7�׉��xx�p�X�/}�	��Z�i�Z[$����Ʒ�7�˗`|\'�qۧ�˨�����:[,�<�.����i6���_�7���S͐�g��m�-�;�8�׺w��D�ӳ}X.����i��qz�GO��0o��;�Á8�}Yk���v����J/���@N��F�#�K��ǌ��TO��c�o�ɕ�@��M��ŲV�+�\0�s}r�aX�Qw�Q{��H�����>�o~3�f�m�67�	�@�{�������terQ��sg�N����:�umx�k�u��&�mo|=`��G�T{��d��c8������;g�X��Ahoig<�	��!���;x\'���^;�)3s��� ��e<gu���HM�/Z�N�<���@vT��G,ώ�?(h$��\rۇ�2\\y+�/_�h��ו�Mnt[V��B\'�!7���}�j��i�c��e�>�5|3�R�%:o�29߀�D�w�m�G�GL����.����Cen-}J,dD�������?�{��oe�yy��P��C�wK�]Ç�X#O� ��t�Yz�iC�G��+kө�]�����]($� s��]�\r��Ǎ���4��a��]��~Ǻ�5����e>k���4�P�0�]�CX8�·ם�$���@]Ȼ.bhΆ;�m;h�F�����k�So�%Z�&&,lvb��?ݗ䈢�O)��R�?��?*��d)`�����/ �	A.<��d�pfkn�i���j�C��ެ�%��l.T�?�Ȧ��H�#A�`^�]�+n���\\�P_]wy��CB�^�^Wd����u�Ⱥ�w�v{>7�Ө�����sh|���h%\\�́LOMzc)���9��̝̣6�uʫ��N��&u��\'�\0���ݖ��~C�s���0�z]��p�f��q���q{ɷ�B�m��l7쪯����Vyqe�6\r�;R=v��ޖ�4LbL����e�Q��9�T�`��0_]�=�Ǯ	�6���]�ĚI�8�_(�r��b�!�30X�AV���m����ϻ�z���n��j2�Զ��|�TY��F���Ge8uE��r���㔊vM�V��I^g��$�A6�W7��fF�@e�3�o����xFc5��/8�<�#����Ѧ�x���Ս���j�nޜ�}����Zک�h�lY-��Ӽ�:�3��)�//;��~�7�G�c�0�����,�@�m^�h�o�\0���f�ds}��\n/��h��9�[��:̌�?��Mh�㰷��ol��~��h.��sb��ar�/�ay����hA�̍��}���ɂ@G�5�łэ��M��s8��p��]\'���ذ�M\Z_�\r	���i����XNl�4��63%x?�����݆��M���q\r�rM��|pL����\0�;c�J0d�$[�G�ی�mWuȖ�������r:�1�h8t���|9���b_g�~y�����c��SpqX5�c�����=:\r�	��k{��ꄏWgC�\ro���B��vW x޴������.�\Zn���:�T�yl�����+tMK��\\�k1j�\'˛mp3u��\'g��˶�z�ޤ=\\y�0%�^�tY��\'>�P.Jȵ��P�Cgix�봎��LuΛ��\\ɞ���q*�[���ԟ�Q��4��Q���i�v\0ǭ-�3��l9�0��NS����NS��O�T�N?#t�`���]���������\"���N�=�����\0w��b�1\r�?Mu�v&ؚ��Ő��)���9�6fs\Z��\r6J�ф��Wgځ\'���BGl�����9`N�ǚ�I��T�ɶ5���ԫ/������*s��t����&�,��?vP��ā�-\rb\rn��r#2x$��ٖ\\�[Wa��e��\'�����aEb�삒uq��V��\0��������W��\"g3ܱ:]�sȖ���F\\l+[���x��������Gw��T�۲�ٺ֯������q�W��<��s��y�O8�|�\n����>��g-fO\\`��S�;1�Y�����;�\'�A>]b2��;�H���༣lA����8�<c�<��O����[������CqP�׎��c\"�D]���D��wT��ϻ���^o�ق��b����6�����m���h.Q�9-��JjY}r��qn���DG�	����Ӷ�\'�H>���7��=�L��*�]�9w���h �v������׷��i�}��\Z�WG���U�.���,O҆�)�\'��)��k��\Z1���Ռ�([o��T�v&�0��)���5���b۫_ނ�y���σПvJv�������^<X�� �����F\n9t�Bz��5�q�oFP�����gd֞M�.�#�̈$k��f+�i��F\r�\Z��Z��v��\\)�<��Ho.�ۃ��x�9t��R\0dP��>��Vo�0��R��Nu8z��{����,�m�3m�Zo�]���;��U��#��vfn��2���XC�S��\rs:��l<[������QM_QM���\0�h˰@��k�j<^r48;75�)/9�R�c�#s�����[S�ْ�z#�8\nC�L1��+��	=#�G5�S���[�ݬ�-���B\r���S芔��M��\\��I�oj`��c]29j�Q�ɇ}J�����<�\n\0�}�r�r����)\\ߊ��yb�Qp�0�z!NH*�f:��s�~GD!q3)=�W輗D�	\"�����!>MOi����5\n�\r*[B�y����8���H����-۴��F��A�\0�������O����d�W��K��]��&�����y�fʇ�����Y��	1�ra�|%c &��{���%�e��,i�=zv�p�^��3��8re�R�.q׋Nk�@y� ��\\�3�X>�3N6�����P!�3�I�L*Ƌ�	!q��Q\n��-�`�/�����<��ʩZ�9��H�9/���/�m��\r���$\r,X��=�\\�7�������N�lM�d��\Z1����Lt�|�(�Ri��ga\'�.Bǜhl�T���s��s�(�N�/���뉂�y�l�=\Z���Y[\"q�z��3���\na����Z��YEϻW�`���\\j+:q%��1n)r˵��p\n%�/��K�5潲����׻��3t���(��xA~$!���|��҆?�\'�x����j@�pqa~�#�7��R�1���A(�B����V��\"�B�gB��2w�w)b�N��L}.��\'HW�o��\'��%9ϗ�s�Z�6!	��\0df���UKc��PC��W�p\\�4�\\O$Ll��������*���Ea�^EEP%IH,�ND��0~�?�ڥ��\06*�d��M.�`X��Z�z ͷ*0p��X�MS�%��RŲAH��x����bR.�O��P �g9��DN�_?\r�k��Ի�*k�g���6�*O�����b6\n}T��W��D�e��4�R���t}	�wV\n��=t�cg�3�a��О�?H�L]Q=��ɖ(����<�euK����?6T4]��?��^���	^�h�Y4�u�7BͿ��m.ʦ���>��E�m&�\'��ӏ�W�35�ɐu��]Q;��J�m,�Ŀ�߿���j�8����\"Aȫ#V�1�:_�~(|�������ĳ�hH�f][�erJʼ�>��ީ鑟&+���OrP��H99��M��Q�n��x��H�Ks�4�|�^����B����; �C��c&�)����/D���X�s��F�Ÿ�a*�����)*-y��y�6�s���#��*��z�P����m-���\"�����7�/�) >9n+��*�U�b�L�O�~;��TL=,i�+�K?g(z\Z��EEM�`��T�j�DqI>��\\%Y>�]��ձM�8��,\rZs�V���\rb�j8O���h�S��.�A/\n���K�&I�ۿ6�M�)�����������N��!A4�[7�C~�n������D�^j���&zdl9c���3 )��Ѯ@�40\")\\�����3����\Z5��+�-��8�u�m���A�ϝ���u��	��3V��l�Z~��xӣAMq���X\"h}�����0�i����N;f\0�&k�7��UGڈp�@#\r�I�Z�1=���́����SxIHk��a~bt���t���>�]�����B`��,��Ez���tmѥQ��Bv�C��+�K�\\��	�{��� ��qJ9�/�K��L�ha�xBNn�W��;~o�<Pt.\"r�ѕnù�\n�du�C����B5�Ty*��&���y�?��=iKy�8�)p�oZ!m���U<_����$�y�G�Ui�Y�#�\'�t	��UH:*TH����R��D��L���$��A�����9|6Q��ܙ����>�1��QI�<��3����es��o�^c-���O�^��^)���\\���=�?�Vᤇ\'C��d���	(����!\"��b_��Գ���9h�ӎt\\�\'���^�X{��ϊ�[%��2�2ԯ�>���2傣j>IT��{ [Dy�*�$E��=Nn��5ѕ�>�/5���a����-����V%!�bwV��2�ڋ²*�ML��X>�=T�\Zr����\\���i�,�@yɪ��|�A�K��F��Umǚ�\'UJZKOu�@/5_n���G�7<OP�5�|D<�҈1܉P�=���[����=n<~f�ת����p�gF0����o�.���E�QT�Y�<J�H�Uv	F����i��5x\Z	O��s8�C�_Z���d�U�T�N�Rз�<n���+��Y���jHf���J�(���Z%�3i4�u21����aACk�g�?���UY�ᗬAJ�N�ΒE1��->��*�PT�y*Ob��j���&%��A���V�8G��v�4f:t���E��0�߹<����L����3�%?҆�E���/,���k@� V�[�>��I�&��A�S���YL��$��K��O��$�&�����U�Q������������(��ü,s�/��P~)�.�N_�\0\0�(��^��NV��X�Ae,���l���N��<�\r>��d()Y7=�\'�	�����$�z�m�������z���~�Gg�������^&-&�[-f9��=x��&�+~~wx�Q�Sx�㛁G7�3Z�h�d܊<����dn��h��f�8Z0�k�wx����}<�M�3���r��[��s�>�F�ۨG��aב��#v#h��4Ct�6��Ά���b�4)�\'�Y�2�wfO2-{Y����Uf��\\��m�ɟ��SV��@vg��2Y�H���6�נU�\nr�X�-`�s鞱%W;��ι�E~f�w���w�Ϻ��Nvy��gjw{�]�p��Lv	[�����s5_�|�C�*C�4�x��!��{�j�\nm��������YQ*y�%.=)��	J��%�I���o\0�ڻD�pA	��J�u%\n�����=���#��z�g�W�I�t�yrx��i0�/Rj\\�%�`��0���K�~\r��ܹ���*`D�<�֕���/�aЯ4�\"�7\0�JX�>;K?P���r����T�{t����㢳r�4*�>���i���][^�8׵U�\'^�g�xƒ1�\\O�/?���3�,�/mw��A9�95[��b�D�]-U^�T���`\'���b8|����łE��7*�D�2��<1]<��}�\\�\"I�8����K=O�Q\ro��^�/�x���gL0��H!X��s�.%*�0]`��<�2���P_<2ur���4m֐Ų�b!�i�/�^Y�$��ʲ-�FY�$�ߓ���ZV3��}R��N��͸r�W�l��*?��++�USݲ�I��\'��@�VRU`�&WF����jW�.$�اC�OR�H7H���գ�U>�����%nDE\Z���HP����9BU?}�i+A\Z�2��G���D^�Z��\'5�z��E������)x�<>u;�kW�%bY)�/BU�9�Q̦��	�緒%H��}.�$����l)���C\'�������gX��reL4�њٳc��8��y�����j�����+���mr~���tV�%$�����;��b,ܯA+���4��<����I��=J�r�Y��e�ت�VX<�?b�ɘ�rIkKϡ�a�,��U��,��ٗڙ�y�5h�(F�wy�����$���~V�Ao���߫VDқH�\ZX����ɪ(���b:nI���>�V2��(2�!6�}XG�7��x�9x�\\���6�	��\0� 4~爆�}���5�w���X�\Ze�����w�����+K�t��%	��7x�FKk���K�;��Ƚ�\rܑ�F{�\'n�K}?��1��?�^D�����x ��O��߫�T��<�E	��e��p?MA�jު��W�/����مcP(��Y\n&�P:��s;�����ъ�D����RF̈-���jK���&v�y�������S���\Z~�Q2ğE�K��;�X��I��Td�������{>�\\�В5���Z�����i��+pf�U�����^�$MB\rU^q�Z��ç���j0W\'�l��y-}���x�1}�l�R���T��pP9��+o�S����ia�%1��D����\n9,1�\rw����vJ�RN��S��T���(RJ?����r�����/{2x%8�?¬��22�s	)~	�]���/�^DR$���s+�S��Ƌ\"�c�_�7�d޾0eH��A���7?���r~~%�:�pA�Y��\r<�t��y	JխR+��\r?T���3QYB�4�Q�\\���ҽ�ru��y3�L�h�y�b�������F�/����]��ʜ%F�ڣ�c|Q��t�5������Ϟ��M;�}J�v��Y챫��HTEuJ�n:�M�l��×9�z�Ʉq�+�?��dMV�;#�iK_����N�~����ԥ���I��2�\"K�=���=�Բ\Z����Ӹ������er�q�?���?�����^�F�q��]�aҸ�v.���\"F��<ƅ�E�M��?���?��y(S�1���������뙇q��gA�H\r�,��wհN��\n����/�ÿ�W��:N`I�{,��nW�Ŋ�Q����G���ܳ��(r���l�j�Փ�∬�Z���?�s-�5���;�I� ��S@���8�0W�S\n��o�Mѽ^����V�ZIG+k�����Z���>M��3���(��\0�ۏݼ}�����8�Q��6��-����@������_�i�Z�_k,=��-����\Z�«�\n18ֲ�&X�3j�X>\0�K�{�dᕼx,����E��e�+�����e�U�EK��E�PK^�˵�M�hK�\'K�t˫��8~S����k��TL	z�;7\"��<�9����Vp���k�<�o�/-�ρ�Ip~O�f@�f�Q*\"������{e����ff�=�\"��gFy�O<Qd��Mj9�\r����p���W���-��?�\r����I�%d��+��xD�(�>.�˟	����ˎ��V 6$/��\0������^C�����0%ɟ�0�y4?�C��%^T�s�hߥ���GR��?U�(y]\n�{��h�er �yJ�G�{|O@�}K>�k�6��`��\r/Qc�����0�>����z��\\?{��kQ��:7ƾҲ�^�c���p�М{|��%���k�ߟ�i�p���|\r�����{zR\r}��E�g��\'hI-�0���B�hT[$ ��(1��F6��Y2�aE^�y�I1��y��T�)�yQ�Qno�����ET�ErC?� ��S�6�C�(�e⩫2�I��x@���l��Lca/���q�2Qq4��U��$4R��7س*���O%��3������)�o��������[E[i�o�r1����%`5��T��(q�J�(���|d�?b�TZ�T�\Z̩�ZNdhX��3m�i�D>�bj(�j�T��\n`�8h�@B�V���C������f����~`I���ř��\0��/H��yɎ�GJ��P�=�\r�ۂ��7U�U�z���_�(t׫�+B	�;|��̈́\"�o6rF��?ȫlJJ����b�^\\џ\rHٽA��Ir�����,�H��,M/�3~q��x��~(=!�?i��i6�л�\0\\=�5�*z���h�߾��2A���7������Q����_�����t�w����+}�JC��|��?e࿊�KD��_� !I��*}��}�1��%���ϒ�B�k� �[�]u�&��T�@v�*�w�!�gE�6�*j���=�Ha��\0�=a��Uo�����E���Ygy,QS�rl�`2˗�%\n�A�R����=���HbO�}��b���D��;�.�x��r��0��!^,�RԖy�r���$5���2��4~�d$˗���)�v]��Eک��������cP-�V힂/*	?��)��@�F��j� �B�\r #�|N4�`�@���*?��^�:�_�nYS����I�K��Yt\rM��ԃ���\Z�������7OC_���vYb�H��\Z�)�J��͗�_�D;֯���J[�]�D�X����������A��f��[��O��{J��;��5uo	���:�L�J�Ɍ-<Q�����7\Z}�?�~]�]4�?�V~`V���W9�)����a��������>#��gpsž�p~�\"��j�҂2�M��\r�U�d�MQ��;�mZBs�W�4��yed�T�����ɂrA3�ԽD�~Z�B�ߦ�.%��@Vl$J�L�y�TW^��T��\'��IRڕ�9e����R$��\"~��<w����%��*%��G@v��)�|�>i��?o�V:\'O�V��\"�C��[�WMh/�_x%����\nӮ,Qd�O����M�Zyk�߽7R�Uɇ��dy��F#��d��8B�RT�>LC�>Kr�+`�dM�Mφ܋Ԣ�i�ܬ��m���_���kʲ&Vh��?����2��.��Ji�Qx�~j.�F1x8�DH�l �����e����#���t;�C��Щ��Z5�R}�^Z�-r�zʟY���sEzl\"���	k1gIY6��^��ި��n�\r��\"g�PD[us�+e���X_���㕦��74k{�@���W�N�����h䶞��*�N�H\'y%�8!�C�4�y/*���Z�\"M��i�\Zx&�ay��._\nu�ܚe��󼆩�bO����Q�}�<,R2U��`:dۯ,�{�WX!]y�G�T�*����<�s���[6Ug!m�!s�Hg���=�3��W��>���2!�E�/�����0���I�����������C��k��QL��O����YU�헅9O��G7�����GI�[v�oq�r�2��`c�s�K/C��2^o*��^����!��%О{z)����`Mk��k�� ��~��CF��� ���Q��LF��`|�-��Q�Ñf�\0f	Zb�ޜBg�.��G���M��ό�M��0v-�����t��z������� s���Z�A�c�M���[]��6���n\\,1:���r#syá�È45�?SY�S�ջ5`��<�\"F�8����tX6�;q0�͐�E�ԶFo�P�:X/�lr6۹�0�=�1��a��F1������{Æ�ů\0�߼�p����V����Z}�8��0u[��!}vGO�-�����lK��Sk¼������*�5\Z��J��m04F��Ѭm5��i�\\kK����0�j�h�~{��h�=�M.&�����\Z]�:�UCoWb�m�k{�j�G��Q�8AN����X�=�So=�7\0����t�o��M�(�t�s�<N4��1[b���d��p��^�-��\'�?�����h��:���j����^�1Nhy/��˙�#U�G.��`a�j��\nF���O&�G&#ɋ`���U��,Ӆ�e��5/�1h)��׌��k	�{�4yMd��c�/�-�&�����-���*:a��R�q}f��;�@>?������bi�B�+�\\��%\n������\n�˶J6������DD���\0�@�9��Lt�}��²��D(d�s���S�3\n��\n~2A	�c���N�%�	iT����\0?�/|ƴ�!��C���?��\"�/E\"7�y�_�Z���i���n���X�H�?�JΟ�<MT�6�B�Y�\0�D^�t�E�	+�\n�̣QJ��_��(=\nd�;WLSC+�p�>�+�h�V�̩^SQ�ޢE;_�5�f�YUN.���3X���3^���~���k4 ���J�T�;ݤ���/5�誓=#��A���}e>kv۴�.���n�?��t��\Z��H�U���a1�n	eޣu��|\' ��?xxK���b��txl��܂��To�9h��q�n�s��BwE�Oo��Y�M8�en{��cbDwr?���j���$��KrCa������CD5�C����Ęs���:�h��ĵ�H��S{�s�Z$)ݣG�,��M;��V>,��ݯ*	}�n(�8��w7����\nǐrĂy���%6������s1�D\"y�#�f��[ܭ�s�^o9���]�J�pmW��*��È�z�嚻���^Ɉ=��O=���Hd	�/�8I(��`���/������!�=�B�,x�7�.I�Ɓ��H)�37q!a�������\0���8\nL^�������39���u�*��J�G��Np{S�rH��(���ۙd*�LU��E&}U\n�8eUH��*$���$I]U�3W�d�Y=�Dɤ\n �\\R9�SIR��(�TH&��H�J�\0#ʤ���I����$�*\0��S�d�V�į^#����\0Q��M*G*�\\���\"$ǲYł�������~	}a�O�� ��(�/��\"}�7��!Y�UMe�;5EN~b2	��8�KP�na�?t����ČH�}\n\"�-|�v���;K���\rx���hn�/R��J����?M}\ZE|^�=Ҍ�c���\r�~�f�pabC̳!Q����ѳ(��ؓS.�-�^.���lO<��([N�>� �\n@�c�Bg�=�����cND0�p���d�9�����>�_(Z>�\"��0��`uXʇ��M���hva�Or��ɺ)p�ݔ�\ZZ�L������y�k\"\r�!�갔y&�v �9\'%)^��$p\"�2��Q�Y��G�����aο6�_��AΤ�K�����a\n���@h�2ď�ܗ����}}�2����\n��d�φv���x7�(H�%�>�_(Z>�x����갔y��-;<��:���V%!��}�������\0#O}>�_.Y>��bȋ<�k#RN�\0��`���)�Ѕ�^ ։��?���\0���n4+��L����Vl�P`+N8tX*ț�x��� 9�+��$�Y��-l�RC@Żh�I�\\����b�\n���x��`�{(+�B�r~i7ȩ|�}�C*�`�d�Q�8���>�	_)X>�\Z���;^�r2���B��\0�⋧�{����%�4�cf|�F���_\"m�������D���_Ϛ8��J.��Qz�eÚ����7���q?���˥�8��\Z�d���H�9a����%�58�ɯu4���*\Z��gmB�r���EC%�Y!�~bDR���t��Ǐ�UU�z/g�NGz��s�*(�Ї\0w��̫Щ��;�ETsA����@�����<�rk)w���o)qky���1Kn:�#��\0�SwO���O����ܖ�y���i�	��#�P֔�	74E,d��*�?�V���X?P��yu��e�㋳Z�ChM�e,������M(��R�UM.��k��_B���?6��h�ՇDk��=���K�/0�����7M-����ʮ�繣_k�����˅���7�ē v�E�Ȓcش�U��4��v�M}���bG��Y����c)O�1���ʶ�\n}p��]���3:Jُ��8y�]�Q�]�_�<�H�Z����2�����4���#	* ?>��C�r0�PB��!�g�RYC�p��mhT���Z�	����e8�=WxV\0�񂩼\Z�����pJ,�����������S��ñ��[�E���+�0Ґ8�G�_����6Xͩ���D�s �_���������~~�;6�(���_��[`�Ϻ��7Q�DG>L�|��o���b��Ϣ��a����?����U\r0�H(�r���U5������K͹nIk�}�-����x�O������I�c�\Z�&���������zfK�a��(�u�V�>��z�N?��H�!?D�����%^U� �@j��o����:N�����_��\0�_���Q��`T J7WZ�J��Y��������ڶ[Z\0�r�SG�{�񾢉FT����轤jz�{<z�*��ۖ��2ͤL�[��瑥E��H��)-�GlQ�����{X%�%L?2�Ϫ���K;�3�t�(/�Db������]Z(!��X��DL(�x��_�\\Z<���7��c�Q��Z���xY�1����XQ$&�d���1�񌴪21ٰ�mzq��3�RZ�--~�J��\Z�y)-ST ߁���洱ؐ���Q�������ҵ���dh�`��B��(}�����$!w&#��})9C1U�M�U�52���\n�2�ʧ�I�h�PJ�PL �LWY$a.}���{Sg��c+<��b]y�x�C���R��X]�ٲp�K��Ge��\r�t%�1����ɕ�Xp�7��0ޞˊ!�b�FZV*��pG���R�t�h�--���ٕ���b���ҵ�`�J��$㋞��Y���M=�V���1)j_��\\�$�/E�L�^a�X*��\n�\'T\'\Z�Z�� ��Z햏>�+CZZ\"&.������DA͌f�هs<�U�@�F	�<-��$��%����E�`��$Z���?�.+$&9�u����I��ᔾ�)�bON)�C�m���\"B�D�J�T���C��=+��z����v��j^���r�\\\0E�Q<9I�Ųb1���۳r���}��Y9,M~O�%{�It����E�	G��g�b��m��j��4��Q�<P�ؓ����ǖ��Ǫ&��KUNkL+�\ZP�L��р���,��YMiŘ���ӥ%d�/ЕND�����X�0K$ۜ��l�)�8\Z�U^c���O(�S��VLQL;�Ȗ�|\r>9/T\\L\'������69�e������Ǝ�t�j���b����a��b����R&ʪZ�g��ի*��c7��^�;�{Т�������y_��A�����0G�|��	zY��vl\r�ӣ;�d$���{c��%0ꅏ���0�	��n��G�g�W,?\"{?���\rR��M���-�E�a��J�m{��x�����G5��<Hc=�s���t��������x�,y窢�KN���0H	��Ѵ/��W�olt��.��\r�O��J�=��I����G�9����ğo��Wg^�K�} {�Y$�^��pP>��CkX���{�be��bȏ�Δ��Z���/7�R�r�P��<Hh?�����,I�����^�v�2��<u�2}��^ Gݮ�P�7�.�� A��R��g���衩��E>m�A��.s�:XR��A�;���8	�[>��S�H�����h�~2�a�Oݙǳ�����c�a�%� {�o����ӛǗH�s96\\�\'wګ��/�-{�{e���ٰ,щ\'�W�D�����ˆ��ף\n#���P�e��冉1<�w�����T^�Շ��`�{��!��{���\'�m�r9� ѣ���\n$\Z}��r#�#k_��gB�����?z!=X��3L���e���t��p\r=��O�����<y��7�,m�\\���4��پ\\9���b�Y;ן���3������rҼ3w��/H�\'c� �����\\��A�a�$�0��������!��f/]��]/�\"z�vc�D7�7�x8Ji���rX�[���n��+�@��jXwvs���+na�/��Oԃd��i�Ac�������\0�F�T��\"i^	T�z�z)I�>�p	���C{S��n,�5���`�>pս���|�����2��HQ�w9C46�ln�ܹ�~��0��7à���};�p;A2��;�!]Ku���(�~����a�d�^P��{쁑+�v�>ȟ��?;C=댛���M��8/��E0?N�s�7��qsg\\/e��J����C4�ex�Z_Y��#�k޾s�E�~�I��k�%���O����W��A���Fh�&Ng����QY�v6(��ǃ�[v�A�ޭ(��\n����N7��rl�����n������\"�\n�AFu��ƅW�9GI���������BE8���ך�飧�pV�r����{<��+)���\'�A��(�\'����*7�}��^w${�;�w/�ug�;R{���E�����,�e��z�Ӎ�?:��?,ك[^����r*�⋹��^�m���x�����2j�ȕk=���ɴ~|�\\��1na�aO�Q,}q�{�I��X��Y�����(NvI�5L�&D�a5p?q��N�>܃N���������l�{�ɕ����!��RwB-�F0ү�0�F>�t�l��~x�\\���=F�ݎ��[�_9�s��o\'���\\r��2�]�A�^}e���\'�r,4�]�=�����?����|e8Xr���۹� ͝	/~��?�������r	�5�� Y�ڕ�DwV�3}�\0��lۋ���A� �ȿ����$��\\ީ^	�=�%�|{��t�y�G�\\��.���\")��n�ɒn�\rN�v�S����w�v��h���t�q0�Uh���@�J�����B|���ey���O}��g�a�m�]��/D�n�M��E�Ƿ��1Ϗ���F5t��,��h�{��fp��Q���{�\'|� �n��{LKhw.�f��,7�W<������9��gy���y`�0_���P� ]�%Q:�{��-���-�O����0�Z�����\'s����C%/�~�������}��ný��uI\0�u,�A�ۣj�N�<�~<�~/	�g�12m�E9���e������⭶�ӓ�\"���T�A� 4(zx�ѹ��s��(��N0��d�����>=���0��A.�>Q���=T�F\Z]r龪���<�����\\i�2�3�|Y/2@����z;��S=^�N�j����&)���J��Н;� ɝ	�w���{���W-Q�}z	�{��%1�0�&�\"����+<Di��gG�f��&�<�Nw\r��Σ?=���6F�J��P�7�/�G��*��=�1;7����zo�[�/Qdp�y ����@�����<�/}鹤�˝�*?��a�p����A�>z�\\���գx��7��S�G��A3{������y�\\�ă6�Hǎ���؜��{��������7���6�:y�\"v@�����k��(����p�F��;(Zz(�y�s�18����3Cf�ٰ��oRݵ/\'|�<�#on�拘:L>b�޿�y��=����D=�d�f>T/k�{��2<�cv*϶�K,`P������r��et�h��޾�������Y~�����rC~gF�E1�zhOC��������90ɬW�X���\\�y����\\��_�A��q�s\\���ݔ�~1<cf�/�K����Z����<��{0P�{��\\���v\"<D��2۲O\'��s��b���P�E��e����@ԃd���z�OO��\nd��t�Q@�o[�_�pt��S���{�չ\Z�Q��sL�h�X��>a\'�J}XJ�GT=§?�\Z���P�S��T��z�O�&�ԃ{�Fi빼\\<����8B�\r��4޾8��MH�x ���ޡ����T���J/��a���B��A���l�\\6���y��l�F�}���#�ƛ�V��+|lܙ�r��1|�����#�Z/b�=�JuM�8L�<�u\n�>��M����7����^c�ėݞQ۷�>o{sK�5\\��t���6֋��C��R�pI�����|������>.O>��F�Q�)1H7ߐ:�=��{l�1w�i�i���w�N=�Oa���2����{��e����	�2�G���yqR\"(�2�l!e�1��{\0��v���x2�K�k�j��o���4��v��cm�8�9�л�u;����κ�h_��=��t\Z|K��Ag�>-SWa=~�{�Yn�OF�2��+��]�=o����Lߣ�<?�fpPԾ!�n�s��q�����;,)�����I��\r~^�r^�>�v\rV��fz�����cΌ$\Z�b�o�4Ӽ\\S�?@~n�,���qfŰ��c�:N�2�����2��{�u�^}n�ر���[���5v8h�����޹����>R�\Z\0=@���˘��c+��_�i\r�cC�na��_=6�4;���=6�#����X��a���fr�� ֑�=h�}b`~1�7��y��{z�����x�\r%�F5�|=N�z�� A�����B����avc_B�/��-@r�{��|џ�g�³.�z0<Oo[�\r��:��%��Y���/�X��ݑv�x-��v����X��jHV#=��_��(HH�\0��K!�H�\0�D��C =�:�@z\0X�ف�b����?�蝃\"[�S}�n\rzs9�����kz;��c�,,�\Z��|s(r���o׏ded�AH�/}<`Cz�ץ����Az�W�u�#�c���NH����(\r���=�`oȯ�ы�giޡ��+�>���<@�.6��(�N��>����dWppn�٠�@z4YԹO�˽�Ed;�v� ��fe�1|aң�������;Tl�4@z,X�i�rЂCzH��ی�M��z��v<l�!=���Ņ��ft��:HG��+��cu/GO>T֭G2(����@6JAz��#���^�]%��@�۬���Y�{�}���u��m��r�e3��=����\\O�i�G6l� =��e^���u%zu\r����x�� ���\\g_\0<���(/z��4��3&}ǰ��n�Y����G�s�ԝ5�����I��[�������e���Z���a�x�f��%p�{����(�S���ӡC���v�/�I1�!=�/�U��v����t�P�{������P�G��si��\'�_S>Hxge���J�!�;��S�>~��L7z�+�הo��f�\\B7�b�Ǒ=�\rZ�H$뜊�9hX����w���M�;f��T��u~�-�m#=t�K��zQ�p�{l�;���?�_ą��N����Y{P�;%:\\�=l��(�7�A��O��L7����٫�\"�8v%��_5P�����ߘ�_� =��~�\n���h�[���St����R��/g��t�]M�n�/.DzXf��Ed�֙�������/7�6x����/�}}��􀯋�[g����^�\'���b?\n� =������|�����Bh#=��*���A����=��2;�J!ޢ�Y�r(���X�N���� �+g���:�\ZvD�S����q�t��ݭ��H��<�9�G}���gDz;�H��z��_Q\n����7��y��#��v��0-����`���I��|o��_�^��A��r{����q_��μ�\r����z�?�>RAF�G�����l�A��{,#{��^�^P#݂�w�W��H\"����=����e[����ەL�7��r{��X����|������ý�+F�v+� ���ۃ�J�J��*;��+��.���ׯ����u���������%����0�w�aNzǂu���\n�Od/�{;J��Qf��P�\'���*��]��{�7#=��2��$�\Z$B?}\\ѷ[���rZ7Hr����f�zN�����[��r��B&��:�n�\'y����Y|�h����Qӱ��[��v��~u��t����]�������s߼��_�ҝ^���?ߺT�E�u��Q�e�������������G���А/��U�����������w�^<��S�����/��U������������w�^\\��~ک��o/�M��\r�#�,Ɇ����w���P�_��$/^>}^�:����_���W��_}������^>���i���+z��?w�<�������c���]���ݺ�d�/�����ks��8��Y�߮�����0���^�8u%��x��W��W4\r$Cul��j^?�ح��Ll觉x�^��\n���uE�������\'������	��2�}\"�&\n��)m�;�%�Pr�w�$�6�D61��Qs���=? lb��n9��40J�:8���HȠ>���ۨoI?Qtސ�&oSc�A|\"����Nrq���8���=����1L�>ݮ���\\v�N�R$C�^V�B������&���?n���D��)٣�e�Le���C6�<���=�~(}�@x����oy���Ά2�}�V�8o��t�/��oI�\Z�t��\\�理�A����׉C�9��u3GA�|�͇4�}�¨�C}n�9e����<V|e���,���*~���WwO�v�u_n���y �	3�]%R�g�Q�ӊ�_;���+��~U�=�ܯT�\'�d��n��!�dV�}]��*��*�{z���~X��!�^nw��/.g	x��_{�e����b�����%�-�\r�G~Lv�;k#l4\Zq��i,7������8��{�s ߻�����\'�~z��]��)�$\0~�^ݼ~1s�؇T�н�}�D��s�~:#/G��1^���r�8�v�1�0��>��w���_��#�Ygy\\���S��\"��~��2�PO;��߆���W䷗���cj���J�*\Z:o�������j��)x���*���������Ľ�Nmë���M�>��S��7�捿��=/�oMԵ��N����V]�{U�\\�+�����w�ow��m\\8�M9|Q����$�>\r�+nxKۧ���o��n�`����x����	� $�}2�,I�tɾZ�:3=�Ut��﫾|��!9��І��>��~�7�0/��\'�=dK\\����A�>��wC������������#x�F�oT�d���׵�ȶ,��ެ�Oc{�]R����~-_�L�u���\Z�<��(�ץ_��oW�Űn��?q�wϷ,;�~?�x�]W�n􋙲Cf�n��n�6��`L~A;d|����5��V��{i���m-�?���mk�4۽|���x�DFvO�z�t��vx�/�os����?�~���|=�#��V�66�}�~跴�~�_?������繧f~-h��L�	�w��ɗ~:/�$��[������@��E��\\@��\'c�v��^���#�����+���_�/�	��,�\n��݄��7_�=~�^~�/1,�����R����C^ݨR�]`v�xNEK��X?\n�kY[�|Ȯ���������������<�z3S���Ы�����s��V�m����*y.��$�n�;	��+��g۫y� \r,�\"m��Һ��|�h�����#����\\=�_������s3����z�H�������q�Yx�o�C�F|R*���MDPݐ�-P���}*��}~����P]�#?^j����Ͳnt/�¾w��o}Ł����l�8�w��\r�-}�˃��_��U,����/B��#��\Z{d\0j�;cbCS�qX�-���@_u���x�O�\Zo\\����J���bUnU]���b�+���{�.��Ƒ����ٸ��Ex��\Z��`�{��Z������\\�)���ܺx�o���W�m�į���	|l�}K10���o�[F�mc�o���X��A������ݞ���;�!2�K���ƿ��[��}!.�Z��f>\r7����]��g����uu�~o�us����»���,�B��\nDv\\��)��=�G_�E�+�\\���n���-=�l�k�?�2}�B�|�y˿���?7n���v��S�+^��3>R��ꗘ���W����8������ݫ��@?3�%��^�4�El<A������ge|=�\Z���?`�{=��O�o?\n��C|��\r��?��A�ݙ)���fx��⛯L�GC�A¡_ک�f�\'���S�2�����l���3{�p?��7I��D�wEr��v��o����C\r��+�F����<�Ƽ����{�{_j��,��)����Q�I�7���`@�v3����/��FvɁ�d=/_nr�̻�0_Hu}���GM!Aq\rǀ?h���<�C���5���۱O�R��-w%�\n?I%�ot�/`�ێ�:Yez��M��֭�!�ϋ������S5�g,��*n��O���(uZ\r�>b�\n��W��G�@�{`�S����@��s�\'0�@�����@�;��s�\'\\�@�;4�s�\'�����$ɯ����O�v���y�,��֙k?G���-�16�s���f��/�0�cE6d�������D������\r����?��vKn\'\n��w��1y��n�w�ֲ�˟�>�P?�s˔t��n ��r��=��q�PK��xLA�N\0^��?L�����Ǒ_Ľ��ם~�\n~U2_�E���K)=��\r�{>ɲ�<x����=b4�v=���rs@>�wW�nm<hw���F)=n��]|�|:�x�޿n��,�I`o�g�W�����(ңN�1�ϝ��%_U4,f/宏��-��5?X��[>�л��4�vu_CNbC�\\;`�{t��>q�!�1w��?���r	��?��;;�=���Eu����Ϯ��<�.6��O��\'�<����ߏ<0_4ݿ昿yhR�#�7�QV*q��,�L�����\'�t���̗�\r�H\'�緹ĻKa��c�k�=4�ɖW�|�v�ڇ��AZx��y�.#ט�����[��g�`��lK ��Ǒ�4ӣ艇C�T�Àj�@�B8�n\"�\\m�?ϡ����q�F��r�W��`�Ĥyt�,��dؓc\\�4p�B7tGm�0Z �����h9l�P�Ul�S⑘�\0����\n�@YQ�,��X	��L��,V��0s\"p��Z�7�mQ/���\"4q�f���́i��5;��8Yh�єdܲ>�R5r\'Y%R������\"oW�.������XZ���B�n��*ز�7nv�҃bLi|p��R�w�&�Q\0�M�:n%���1-��\rd}{L\'K��OYp��u٘]�0%?�7�YA�Ǵ-@Ч���\0	���$�)XV��:�=۟O�,9�Za`k���p�P�IbW����(�nI�k��i�\r�2S�U{;�~���(�����\Z�p�=�u�WCsF��M�p����d���\\`�;����&�/��tE*�0٦��[��oI�<y�1:G���s��F��6�/#I��8\\p�5~�	�	��EIcb�aOo�%���̋�����(�\"4��|�C5�+U�����6�f:sY-��D���\\���R��RAԚ���9*��	ғz<�����8?eM-,�}(!�\\�gu��ϧ���%ո��2�η��+�U:_�t6R���\n+�F�H09\n�pD��C�St҈ՋdM����2C����[&_ϖ�\0�X�r�,z��5,�[� �D�X�f�,l��y:O��,\r���m4[���LDZ�����G+,v�vL��w�Z@iy������Rܺ����0cj�w�ZָS�כ`q:j�Ҙo���،%�tZ�rZ�jy	�$37���})�K\rwڅ��?�|H��5ܕ�m�j�E�	`lv!����g#��01T�{]��Z�}��G���⽁yp\"�~��n�\'j|t4�ͺ����q�O\\�F��\\��VI�`�9�),��2���$�]fi�5C��M&~ډ���NL��h�)С<�K6�F����;�PU��k��֌Xt<+i}�@���j\Z�1V�q>v��@�\\^�zd�&]��#k�_��4tv���w�m ��Ey����t>���dƦU7|��K])�	�*0qJ�\"=l��8U�Tk����.@cN2�x3�ʖ~�과E�N����Ȭ�:�1����^\\�Be���Cd�=U����u%���\\��<��}��љj���5\0<w�s�+Κ+�q*-N��f�\'��tç�&ҭwf\Zh�&:k���ڦ?Zr0��\Zs�$�X���<l��8%�نT�G1�*\"�ǳ���y;Y1��yq��j#�hJ^�h�`�[�6W�f��pMO�-cL��Dg#����4�0o���Z�\'#/q+�.�?����_h�,�R�|0�n��H��v��G��~��cݕf��V���Q6�ETޔ�[;;+G\n5�Y��-ďg\\��\r\Z���bX+����t��)�f�\0�;^N!Wb�@�\r%#N�*��w8zfoW\'������O�q)��yH�Щ����ًsk~pB�l�1W�B-�u���M�s��y�[h�8U0ɀH�h�	Ͳ���X�+V���z�b���Z�xpϋ5�$4�\r�x�[6�HP��걞)@h\nz^��[7BXM7V��̘��	���O�B��3?#��|��;�ź=��x:��=v����X&I@h9ax\'�^s?�Г�)l��C��ViL��E\nVv\"nU�9$E�Ұ���s���Nr�V_�B�L�C`��nG�\nn�]��6���.�Y^���ѩ]:(���V�S��AB�H�������l/�s#	��z��^�	y#{5�\n/�Ax���8�(�a�;j%��iZ�l�N�,j�`i�M!������ur��P�Z2�ݘͽt-�l�:��.?���\n�B�pN��\'ӥ\ru��:\"������x��1ů\r`�\'�7NЮ����.}ҩ�ڤ�7�&k6�ڙ����O��rg1��\'��9�:6�&^�	���Q[n\Z��T�Cm���!������Fs�3KV�7qdٝ��t��t��\n�J��sl������f�L5;v�Ac�|fqD#Gku�M5�̍\r�S}UGP��G�їU�)�I�/��|S�j��\\�?ʫ�sX0�r�6S�\0�|*xMKZd��f�b\'_��ʦ���n\"\"����R�ti֞[|;��n?�!$u&t�<���:b�LK�|��b��=J0lolEF����� �xqV�d�(\\��3��3�6M��6��\\\\NZ2$CC�� �	�Yx�ʐ��T��;S�M|�0��vbl[!��[�Nj2�����g�p��L�Z\r9K�\\�&L�m�IN�;�+�f!���mբK��é*lW�a�.��`�M6�f��q�F`�!�,�6!�-�D�+�wj�\'�X�ة�OT��\Z��r���L��4A��쥻�>��u�D�ڟ{iB�H;Y�/�*�\r�\\��حk�ZB0��uy��}�شP� X��C3���iP��.TT�}���(�.�9��Z�3v�r�$,%3�r��g�\\v��^v�ء�T\nr�#���s*��d�t�|�����-�vRW��h\\R�9g��V*U�!\'�38(�TG,�b�����=lV�JsϗG8|4V����G��x-0�9#\'��L%wi�5\0G��aV��B;	B��<���\Z��p�UEpU��v��U�sng�e���t����>���\Z^m�2K	��q9]�~��0nq�,�p���Z6�/§�j>����X4YW��N���\'\r��L��F���V�T�Jڞ �E�b�d��]��G����cv�b�K{l\Z�h\"�äH�eh&[��δ�2��Zy�n����8)���eR�E�-�]M�X*���t�:k��qL7��(�e�0Y��̌���lo���ĭ0\0V�5`;G+|���UH����V|�	݅|wkL	�	�v���4��Մ�����v2�$�9����M�ʗ>�V,��,<9�5?Ͷ�O$;/&���\0�����*\n���6\0mS<*��,�Z�E��ֆ�Q{j�E�JN�Ŋ�[+�+-��i��C��j����� CȻΌ�h	L��dfdj��g�ͳ[[rg?�N�\n�H�e�STØ��ոN�F4�4=��b��:�K-���z\Z8Ztn�L\rF�֢�����&t/���3+�kt�J�ٌ���n�E�8����?�w��԰��p�ڇ�f���_���#e�Q��+��h����G�D��q�=:\"�$=a.Z��Ѣ��%g�]a��mPM�]h���%Q���\0����P�iL`=#T�����8�\"|O�vig�\\��Ҹ�bX�ۍK,�fks��+	>St���PtB��E�\'X��ܺ�~L=�|E��3��M;Qp\0bE�p�ج_�SJ�9��_�Fqk8�ۅ��tw��<�]�*�fQ�����W\0�j��r�$�1>�8v����w���O\"�K��Ko���\";��h��l�;���6{0��{����;�Yr�DZ�q�x\r~��f�n�Ѵ�FArnt����k��\Z�)���Ŋh��j�ss�n;�$r[0ծ�����&-��@L/�G�:͸�ި�Va<w�2ߛ�J�/��E�|�=`3޽�X�e�+����\0��B9�-�p� ��ʴ�?[([�D��ɞ� u��h�33.�����է]��Q�LQ�R2p�(cn;S�]����) ��:C�\r�w�����j���g8J�3�����-vZ��dڌf��eǝ�4f4��V�i�KH7�Y\r����`�5���+ ~ί����C��8�Zg�!J!���`{q�DN�Gt�<�w�?�(�9�dK����k�*\ni�������fؐ�ٜ�!�̹$.f\Z��}3�6�B.\'.�n��9>�ڞ�E�u���rg���1�P��|`b\0�����8��n�f�7d$#�d�4s��J0bL��o�x==+�\Z���9S&5�l=��n�\Z�Rݨ.a ��`~ޖ��|�3Vg�~��!Ԙ�,i)#�C�u�,��s�q%Q���|e�O�Þ-yQ�2h����M�\"t̊�[�v~��U�;�N��lH˖�g��,N�y����J\"W	��-��-Δ枔rp�����P/`[wflB�D`�s��m�7;9��bB9��,v�����O�*��?�E�;%Ke���ᝠ�;�\Z�fᬝ�:\ZM�R�H�����fZ0��T�Zj\r��qqqFY���	U���=ъ�N\0����^�F�)	o�gNU�%OJ(,\"����Y��<Y���{�U��+h�DP<A6�xd��(̧�%Kf���`��hcm]����fj�[� ���,8�����P��zڇ�t��[�U��3�K���6�UGU$���6�T06���Ѳ�\"+E�!�\\i:��4h6�δ�P��TgY3�H\Z�dSF�Y��`�S㘟�-HnylQ�j���,h�\rr,�z�NB<5;�\r��^�\0�iL���a���3�z<�R�\Z�{��L�s�(�$$/t�q^@[����l��Hr���f��I�d���f�#0�֪\'�Ոk�UW	I5;/�\"�x$�p=!m�q!�q�X�H�Uu`\r���i�v�Q\r�Ί5O� ���F,?�k*\\���	���2�6�lj��a�CbpLI�i�\"6���.I:L�@G���g�,�k��pD9�׮&妦�d:gITM�kq�4o\Zg�j���� |+_Xc�L�,\0h�����W����(��SEׄ�����^��a�Lxy�1��Fќ9�-&�<\\Xվs�v�z`2:��a��Q)�ݴ�\r��GZW9�Ķ��|�����ĶK�&�#Yꢸqwi��]�Ċ\r�e���/g�1R�B	#���Q;�\'��0>gz�\Z��ے�q�M��HH�>�#Zٮ��쯢�����6��X[G[��N��3vy�vN��U\'�R�g^��p�r�S��FFh7�K	���������e0x/�+��t�zqXe���T33a�x�h���|G-�g\0Zf�jƕ�����)\ZG\\0�= >^K����l�H�o��,��{l%ns�7k\r5}Ʊ��\r�a���T{Tc���(G�z�\ZG٨֮��:�ɑjGs�\"O�������1���Wp, �G�!h��F|p��<ՙ\0��X��P��ϽeR��rud�Y��:�bA-;�_:)�	��sP�(,Q�z��#�[,�>�t�gV�*�<�6�>̒��}�i���9��z\n��L�=y���<���u�H�F���R�!�֞���U5+9�-(\04�h>�(jؔ\0�2\Z�1�Ђͮ�qhә�\ZX��f6�0�(\0�2Ha1����:GY�tO�k��g��6��Q@	ԺZZ�[mÚ���~u.�|ݎ+	�q��p=��#�n������	v\\�c��J����|�D]ŗ�>.�X/�J�l\Z),�$�#&�h:�U�)� ����%f��*j!BXCV��h���h܉cK�Ň�BN����R�9^���iJk��,��\'�2�|::+d�ꙇi>@�)o��g���7�N��x%�&Τ���AB��Mɵ\0N��^�qf7Y�r�V�V���,+�<�D �N!��/��ؘN���t<Asc[�ޟ\n�ɣv�\r2��]����s�d���{�\n�U�V��M��������)$\Z�!Jv��5�Y��]��j�$�/�Pb��R��gr�w����{(�u�8n� �tR�s�u\n��WW$�s�n��d�{�FY �,v�h������h�a�s���f�:u�&������a���XY�����y3n&a�Z�4ѝ�\\Kա��sI�$�Ҝ\\�wv��g���Op�q���>.�Έ�1з\Z$U^�����x��4��t,ތK�6虼�}{�,𭈛\Z6[����VSx��8������	�^(n�KZxl��2�\'��f_n`aי(���4i:A���ӷS!Z�������:��\Z�I��y��#H�EGq<���uX!�\"ބ�P;�0�&ŹԐg�:T8���)#�c�)���	�S��4S��F\":wId��UV��h�&ݎD�3s5M���[��z�Z��X���#� ���\'{�,�-���Q�w�ޔ�p�<ṻY�I�ʼt�z�ۓ�ESW2�b�����Eqo��b;=�W5G�+R�X^:�qv.GK3f�to��`B2�2���fT,�c|.����m*�9͗PH����c*��H,��yOy�a���`���0B��Ҝۨ�_�����-g��3fRx`I#W>.y������a�R�B�:�t҄c2�	!Bcq�=3�Lц�����V�rq.�Ձ���K���\Z�YT\'��4�P�l��BlI�ljhŖݸ&\n;ٹ˩ݶ{\rT�#L0	¯0g��Z��.d;�4\'o�ɩ=�����;�����?_�WK�(եυ����V5�bd��W\'L�a���-��\Z�ZT�cU���\"����C��;�T�R�ȯO�3��-�$���#����5/��hZa{�QCyɗى��f�-�q�\'�y�猃�xgh���h�ɉR�\Z�d{޸���{\"��dIc��cRqk��K�WJ��n��dW�j}�Y��V��]�9��m�/\0t�+���ؤ���zkLa\"�4�����XY����@��%��s�r�K��Z�j�7b���\\т*d:�l05����r���j:���NU�@�!�l��(��I����#Xޢ�1�:�)o��J��YI\n�ض3��vcf�l����i�^t�����=5;�\"#��].�\Z-��j�$XY2N��4a�]����I��I�GgI���14����DY#��g�0�s�G*���3ȉ A#so�( E�mŝ��A@J��K�H�Q:osAP�a��FJXH9P0:�Jym6��d|�Vn\0.D�D�uT�6-9\Z�\'�Z�\"[KE�n����9(FN����u��aAHt���V�¬ܜ�ia]e1�\"&�&+E�ŰT:Wg��`�[p.9uZG�Ė�\r��66J\Z�ү�69o(b%�0e�(��gpc�d����:���5������OI��w�YC\0M�aE�\Z�!�(s�H�>�jc�\02�b#B�QgX9;`����Z[e��-4�i��w1\Z��\"h?��b�\0�X�\ZD�6N]_�\'\ntUg_w��QjO@`7#��s���;��ɧ����hbI�ף3S�J�	V�v�����wڞ��86E�E�^�s��p�:O�����5�\"�1��)n�\"����%@HkK1�h|\r׸rX\r?��̐�$�v��D3�1��G�(�v\'�,����=�J~5%��qB��|���VКm��EZ��9��9)��K���dI���l��2KY2��h��0�0NՆ�X���f�l/Q{�O�����6(L��7%US�MM�4�r�� d2��K^��:��I\'u�g�����l��g0���}V��M�����G�?�8l�����=����˧=nԯ��{v�s��������~�Ѕ8����®#�Ҵ���h5��+��jd�)����e�VkMv�m6xr6�\\ \'\n&\n\'CG���>9m��J��x���\Zִ���I�Wn���L�&��.h�x<�+έ]��E�NM�Nݹ�ئ@@0�}!J�Q,w[�Lm��P��C�m)1D��Y��S`��(eǲ�5}h�Q��3�ؒ3�Rx?\"��S�Z\\��4�,���rJ��5\'k�D���h�9I�V����r�<�Ɲ#�gz@gͭg�R&�\Z�#�����al�@&�l��hS�`:nG����O���h�x�\0ErĆ�Rz�b$�VIe	���]G�[L�6�%0;O���҂�4�<���m��X���L(�&\Z{}�O\0w�&�Twj(&R�����u)�`�9%K8I\'?���L�����vR��;?��a���*�ـ�{k�hY�q�;�: o\'9�u�!K��Q����.ױ�u>�5n:�o	�=�\nI��B�&bmk����\'S�b��,�2�P��&<�)g2��I��5��!C8\r�F�@��N��b�w��Y}�>��ˬՉ��r�#F^���KNZ�`�pxB��1չ=	��]�*Y���r���W�t��F6J�ؒ�$)������=�=V�B�l7u�1Q|�:����]����I��^�pH(u	��/OښM�p���d�B�������ģJO�������to��dK[N��M�g$UTg���;T!ΛX\Z��A��l�\0,\ZU����?�H:�M���l�\\��ؚ�Em���O��*���f��0>n��T��[Yg�ee֌:�t[��F��Rl~�\'�ؙ�Lo�*��Н�N\'K�S�xA�~�H�\'gcf�\n�JVi\'��>�N�١J�\r�&ќ��]�+iL�������.贔z&S<F3o���++��-���C�f-j\'�52���m�.�4:��&�$w�����n �AKZPԁ3m�!��E��0�*hAF�&9�qSO��8�/�58s�mg,2�A�O`���xұT32�doE�{�e�N�Q6��	0wǤ�ZyqX��$���,LY�F�T�%�>o�u(T���K/�6�aU�jQ\'�d��\\�X�aJr���&�)\0tg)r�t�D�8F��&n�c����Қ�K�2c8�t�1����x�K�2	��a��>��4���9���h,	ϯb����L�[��\"W��%�Qp�.@����0�[aZ :q(����=��QnLэ@��8uM�6��ϰ�1��/yxN�x��1M���S\r\n6!z0Hp.=��Ӛ:��P���M��7�H<a��8KVӥ�\'v�l�(=|�M�iQ�d,\ZK�� =�m��,��S���+y�;t���N�w��Lb���Y����̨٬�jA3��A���N	��2�`k��:3�3r��ҍ��&�^�l��T���Ԏ#���`	dd��fnu��6��Ė�\n�E��b���D#F�:��7���F��3Nˑ;S�\\�Y���\n%��s8@#��t�򜌄O\"r9;p-�h(U�Sp��Kf�	�	��A�@U�\"}p��tJ�$sdӅ:R0+�;��kC�7ڤB<3_)�p��Q�Z�bT�\0/jGȈ\"Mq癖�F�Lt?!�C:u�#d��b�Md��b7�t�c<�`S)5�9%f�\Z�.!�5��1����h���������SL)R�_�#���XI�@a~Y\n.��q�$���p� ��X3���REc�L��N݊���մ�?� {���e�����YMQj	q�yP�ۺJ�|�g�p� ����+�ܘ����B�Z�\'�%�V�\\\Z��!hl�u��;��Z�����.Lm�K��T�6�����yS�j��,:V�q�NF�5�[�[::��B�s渊�^��JD͐{\Z�6��(8,���Ժ��ѡ�U\n�����F�\\��{�w��OD��T�\"a�)U�_��ǉ@��u�u=FX\"�F\'��I�\n��S���\00[([�YX�.�$�$\r�8<��r�i��/�v4����m��\r�\"x1W!��f`���<��^��9��܈W���v�x�oBE؉.8g���0���,-}����)\Z�\"J�1`�;ۡv������6g��d����*�M#H\'漳y�J3�i��gG�<b�VU~�9y,��M5�Ύ���+��c�r\"��(6�$�\'G�vW��iv�.��(ѻ}��I�j\'���hr�zI$�НGF8����Kq!��c��!� �1�E�.9صF�Y�lA�E��ǲ�l��^��|B@f2�,\'0�̎����fd�IqK՜k�8&���c���F�x�6�7��}!o�M�����jT\"�2�d�M6|�IXv��֪��՞-��;oV�����[*�m��I�8K�m%�W�V턇\0�=�����!p籝T�,�ÀV:s/�B�wU�- 6�v���\r=�Ω��uV�k;�׮�%H�ǚ�pb���9H�~\'b|� ���vv�1��L�U\nKP��t��FqA,-�g�S�Tk`�U�9�=>@�9o���܆�9���F�$>�L[R�EԚK�d�.�y�o��!\'$ۯD���-�vC(0����Z�`���eu�&=�:�&9:����l��뺳��A��t�c�5�n����YlR�\Z�|	��L�媞R$a�(ܵi�U*�lI��ǵ��M���h#�1&����~�!yUri7����ܤԆR�Yvk�7�Yb��\Z]-�]K����\0j�5$�3~�Ĥ��~Nk�h��űUp��3p[��z�m���/6�2�f/����^��\\�B��&oVGɃR?���������|�G�m�4�4R7�8�]۠My�R�e�m*�4G,%U)���Rj�n�&e%fD�즘\"��Xɪ��;�k�D]����~���$��t�d�\"8&��-��a5��G��E�.������h�J4��A�p���$�NX��������%J��c.X��r�. Iܴ�	?^�l��>\Z&w\\ie��4L��Ƕx0�n��ZN֨1��߬�w���X���J�_�B�t�@��X�Fǆ>�0P��a�r!��f��u�-.���[�*�`�ܝ,�`�R^U\n�/�uI����l\"o֭�ަ3���ٸ���h��\n���@��-:=Q�E:6�	�,d2�P��6��*��^t*��r>� ��a2w�tr����w\ny��Z@h��i~�Q�{옒_Lmׄj������9��f��B3de�\\�9�;��$M�P8M&>�����2��LW���O��x)��	����<ua�a[QH�#���H�n��v\\�m?/����D��]:�ef�9��v�Q&����-�\r��V���\n,{>��S(��T����Ө��g搈!1>���)Ia��𓦵E/;n�)��v���P^uC�>�Z�v~y����k�l���&�2�kv�P�\\<q�4��$�e�-��{P�Db��u.bN:,�v�Q��T!~A����js8΋�U�(ܨ#\r=���S��.��?D�0JVT�9��t�;�ؘ�T�ݏ��|���[���bwf��R���ț\0,7����vbu�fI�\0r�z���q���=W�T�L��[��U2�Ĉ��H��S�8p��L��_�4���p輠����+k:�Q�r�	:�%[5M�i��c���dU�ħD��\r���|�gi�8��A�e#M!KFO��f�2Z�+&4�K���� ;�@��I������ZRy��S���ğ�*�a55���88�ʀs�Jl�!��<��]�D��dҔ�S��fA��Ζ>��X��,����l�{�jkT�5���&M��(�=�@���E��h`��q�otB�(Y\'S�p\'TxҔ9��hI�a��+\\-F9���َ�Nu�\'���O2TE��D�d=/(��I ��l���q��8@�d��<� h>�k��E�k�ԕֱ��¥�ajba�F�!��C��?�P�\'�+�T��:ʼ?w5VZ�9\Z3�����&65�D��R4n�0�]���]]�`U���b�*�D2��m�S����-�#�O�}� �Eq�f{�a�����D�hpf0�ݸ�§s��HԂ`��7�SL��\n�SqVu9�wqF�b���	�Y�<��2Y����	ۅv\r����f���\'�W�Kp�.|���W����:ÄV��^��6���bSݣf.�ėv���G��z�i晤��s��\'�+ț��Ԧ\Z�8v��̥6�#n��ʭ\n�4�����Вw��qjjgL�̥q�H�,��F����Gg�ZިXG�fp�$0��l�jk��5���3�۲���ӹ�Q�2�	\r�R���E��Q�tRNc����i͢; ���\n�5R�����xu�E,��n��1oM�(�����\\��¡����[�F�\"uh��#!��c���,�}:�754[�\"9%��ay��q�u��!���	���Δ�|54}f��8�̫��y��V+#�����2�ܸ\Z�G#��:\'H!�n��d�����u@�R�\rT+�ƾ}�QO\n�,�d��I�b)L��)d}���F�[�T�ҮB����4�Ν؛��i�|^�>]C��hn�!7\"�lha�[{��°�XnF�f�9{w��v�$G��ةy4Xӓ`�a�n������j���\'϶p�:�\Zn�3tX�3Q�3��l�n�-xtR�sM�͊!\r\"��%HRk�ڝ�Α����Y�a��!��K�s09�HS�(\r���u�D��E,95\\�τh7���h���p���jQ���+_�Jg�o�~�T¶������M��:Ė<&a�A-���δ���Ԯ*IK�s3��/i�pH��N�*���e�=	E�t�\Z�lJ�٦�N=lGmv���\'��.\n�g�\'���D�H��fj�����Cu%n����*�`�C�INe�h[�M�;}	u|U�b~A��\\T\'��KkMw��O��q�`��2B:�-\']�n��@��8���]�燭/�>?mKh�\Z���u�� �0M���4��+�*���8�\'{IrS���ӎ/�m�r��@�[E�QҠ\\`�r)��l��d��m-y�ɖ�m-���^��;������9.��ͱ����l#�j��d�t6N4�8ݗ�Nfu�Ay���	h5s��p�y��Y�X�/$��ib��v��E7�m(I)H_�aU`�tJ�Q��()B�cy���@U=��yґ7l=c퉠B~�_Գq �.k.rA��G�t\\��1c,~I�a��t<1��d=7�m4R4��qr��F��[O��W��1[e��؂�O��2յ6��.�Kd?���x��K�!)��yk.,�vs�7k�e#_���SK��%����\\h��V\"�z�ݼ+@��aC�6�Rp��Ž�WGz�\0�F`�yܦOSlQf8s�+S�}����IKđ�#��dx���1Y,m��[�-�������O�=�!��-;Aw����EC*H�J�3�Xd�I%��	q$��a�]��v�ֳV�Iz#�����đ���f�8����\r�p��K�`䴥���z躆0�%F9#�3\"�˚E}�TQ>��,pWͣ��՞n�Ӊ�<�I[w��w�N�(��:y2OW�Ih�����L�c��w���VL�륾m��^�4�fb3�4@�R���u�9k���X�jp�\ZɖB��b�M�8W+�*�1&qO4�h[�R���Y�j[�\ncVc��p�ja�I+�q3_�lsR-��-�d#Q�Eض3�kG�\ZG�qOE8c�*����bl����*篶����HXP:!n�l��G�J�sC���_����0U�L�9w*,\\�TA�X#PMe=Z����m�ٷb�:�Z�0k���^	IC�����mP�x�\r��fm��1.��\r˰��ǭ�k#-W4b����F�/�����cs�GԊY�g�c�W���/�v�P-�	-�ƚ)��q�-:f�?��rT���\rr>���*�<�tʱ:�G3�D@��ň��V75B���Nr��.wF)���(w�].8K`L��Jz$\'i�W�Yp,9j�Û�2vp��췼��W󍏡�\0��C�,l�G��=��`%\n��]{�w��3u3��*�C!v�ŉI$�B�G�Ɖ����#7��u\n�t@�/}N\'E��$�p�v�B61��$�.\n\"�k�H%�	k�l�c\n�Eؠd#���I������VW�J����m��B�u�2` ���K6��՟��f���)\r�n����\r�]\".no6���Q�Z���)N����w76S�.@{�ڝ����������\n��Y���֙�-��2�TE�eFR\\+#m\nִ�RP�f-b��h��)�ES�0����B2�����K\\�#�,�Գ:�X��(b��|���Cb&��D9�]�Z�N�������ۚ��Vb�8�]�����̀wl���\\�-bQ�ܜ����0���Y�[2�F݋0�LXR8y�W(�ċ��H�q�ܭ���b�S�ڙX����0����H�A�~k�Gkm��SL��_G۫�62�j�!%k�&�w�f��]iLwy7+��.	֖:���L\"�$���f�c^=(X�l*%��1��r��o�5��+:v�8�x��[A����{�Q��3�+gD�G�4��f��H������h5:��pA~6��,�/�Y�U���ꠞ�|1��2Q��c�w[Gݓ�mD�kgq��qĂ��Ϊs��,��6�\\&9/�U�@��E)�����j==��\0�i���\"�o���?Ye�ƌQw���:gV�y�ƕ+��O4X��j��KtN��i��G�m)h�=o�hn�_x\\�����\Z����91��T�M�Ќ�7AT�\\�鼝��!��+\"��1ϓ�P��.dK�|��Чtɷ��\n%�Υ��8#X�W[�_`����ZW��5*��&^i��zܱ/0C�\r,�:��5Fk��%�LյAP%�,{\\��X�@70�-�����Ȥ\rA��σ,745c�\r\Z���\0cn\n���4mPR\\vZ�~l�2B(~�LҢ�,et2�I�\Zٺ��bf%z�W��9�UM�e�!�	f�\nF��T��4Qf�6FVz��\n�vl�%n3ؕY���C����R+ZU׸��G��!��#������N�η�Z�sh����N$�9���Q�8M��r���H�7�9j\\a�J6�B:��<�Ԋ�[#c�.��gIh��*���f�Qʳn��4���F3��u`�%�-�b��=\"p\')��b�WB�����B���Ɗ��R\\�wͤU���qH���������jw�h���z:�4��6\n#J2��N�i\ZT�4ꌮ튔�k�R�7(\r����F�Gs{�Wf��֦�����h���(����m�b5\rO��Rk�E�3L�>_H�b��|RU�i���E�\n��&�Fc�Ս�%2w�8%l��P��8+O{��M@�^مt�jhi����v4��<������s�2���a�I�-Wͩn{�3ꠚd7¹W�PN�����i�0�&Qe���Y�@]���Z#�:f&p���z�\r�60Z�ǅkNhL���=Չ��ض���V]��|��E��ȁ��̹A�$b��/3Rq�q}W�m��q^�S�>FvgËН�	��w��]c���6�|�=DBL��~۹��W�sl���\Z|x�K\'FYn��Q���|��0!�\0(qvUkǆ��0GU������x��#��O�-o�G���*���s֦���=u�e\r*ֱȞ�L��>2X��i+��#,���c�Lr�b�����D�5=H���M�\\�(�;��9�a6�I�v�2^�Цj�q�)��>Fwv�Z-uw��\Z�Z�S(�:(���A!.@���qNp�������P�\nӚDy&�nd��F��2�	Y��D�1�\'fѭ\rt�zLŖ�ToR��&&A&�\n�:�r̤G�Et��X�PY��BG��z�0\"V`#�nu��z�]��E���Y�sLe��L\'�#w�jz��N��@���<�`�Aҩ����Ey9rL���B3Ǯ��.����X�Eg�E�d1{���Q.6�(�㼌M+��̎r�h�����u��vQѢǪ���Lrx��f�]qV=)\\\r0؊D8S��iu�co%ˣ����,�g�%r�#�#�VU�5�&\rW�{�B���a��6,��-��5GG�4P��C�^N���ᗵ�(捉|/���9ڪJ�S3X�RQ��L%����<�`m��[(�P�fX�~�3���1����C��l�RK�m�2шٌ8a��N<�a�=�ɽ���J4K<K�`�I�1X#*�Bw���BIM�5%=x�:j�R�k�b:Ѯ�`F$���L���<�X	#�S٦ţ�iJ �`�j��B���	�Qb؍!�ºd�+����P�\0��8�Q��|�c���>t6��^t҈`���f�JZ��vh��a��L�#��Gje��)��	�)T.�i3���R=J�b�̏S�ȟ���7�]>�m]8\n�y����0֩>JXK+�����0��SU��0ؙ�u�1��CS�f���1�̭�N=\ZX�m��=�q-­�s��W�>swuɢ�B�b�9g����aVe���ww��x6OAR�}>e��A��ڍ�da%���̎�L�\"���Q��Kȃ�\\��2����2^��6�0��(�g\'�9?	H��#�.td���E㒬���:��E�kОդ�z꺲RK`�Z�e49�u���(ɶ�#a�H�Em4�1M[|^�T��4:�X���Z+>g�(͚�i��Ϧ)����\n��1i�<�L���51 ;�r�X���1@&�:_������� r�bf�@�%y����f�Mpv/I�h����%E�����?o���f�����lZ�K�/wr>�\"�����1:L�bC��01 �l=+���/����3}����o� Q�����m��W}G�O�_�}���I��j�?����U�q�#�}�L�e�?���+�QE�\n}���|����g�v�{����^���t��{���M˹�[I�_\\��o/e�ݣ�8���o��q{{�E�r[��oOy��/���(�4��Q@���xu��CZ����>�4�p����k���%�	\r���/��^� �T_��� �/�~��{X�E���4���ַb(�������|��O�\r����dC�3o?8�݉�\"ɚ�Y��B:PտB�[y��÷��Wv��]o����n^rl<f�B�(�@&���[>��П��R���?����zo���m����?a��/��������C��U�X���nd�����%\'���t�|O�,��r���Ejчj.������x��䧋���Mi�o�>��s�$)>�Eyߴ�(����o����?R}7O܀5i��U0v\"�x�;������!�C雞g�-�\0�\r�(���F��l�(�!��=��yJ�F>���¯��RCI_>�����*���<���{��\\,x�`ȃ��pe��$�_��ا�~H+����ZClW������ S�v܇���oc��dZ\Z�o�*p2=�?K��Nz05zi�;���`,�F���|䖞{F�wr�1��SV�{֍a�[���W��\\wƥ����I��u|Έ��^vY����J�(��e����!���ï��$egO����k��.<?�z����b�����	�O��Z�گT�٫izIf�%�#��zl��煉�K��ك��Lw���M��uߋ&������f+�����{\'�Lۻ�����f-ܟ�QZ4���-W����㞼Z�7�Ĳ����s���䪛��4L��Ҡm}̀�uY��#p���Sy�ʟ��M��N�]�Qr�)�.�饯���v+ҙ����?_�֧{���!��ۢ_��>V3X܏�K>����� ��u\'n�|!��Sݙ���B��5^�uI�������>��|u[���t_��T���].�-9~m���������|U�@?�����?�^��;UrM�����Ռ<׌��jF�k&�s5c�5������;^��UM|��?���U��\r���l�?2�W[�gv�o4���V��l�b�u��;Ma�����V��m�oM�<p�Wb�~�����\'B�/u盽R\\�߿>���j��f�-�ۃ�Uv�e�8�n�����-�<ț���_��i.�&�i��[���������~V~��V��b�v��s<�1T�Y{�~�էFoȳ��s3�ôܦt���1\r��)?�o1��k��	����w7}�_��䣎��O��c��o��ߪ���oU�gf_ȿT��������_�c����}����wOщ�[��U��x��?+��[ev��b$��|�����fco��G\Z�r���-����+3�{���^��^����_���>���B��[ʵO��6�ݛ~��F������\'һ\"��O�	\na�ԏ��o�8��?�ʻabtfX���nu�%/�����y?ڹzIυ\"=~ܓ|��v\\�w�08���?��ׅn�l&q�ٙ_�����L�W�����[�f�ܓhC=�R�z��8΋.}��Y���^�����~��2��:ާ�c��K��k/��\0�����σ��1��W��_4������ݲ�!���^������v��_O�/��#InEWU��p�G�7���zdk=M�ˏ����x�]C癷i�ަ%�f�{�����7�@^�\"Q�U��2��NWw�~��X�����z<�}�B�TןNͱ���e��x.���`.��ov�S�pۗ���Q�p������s����3���׳�˟�4���g�_h���p�sz�������f�|q�B����(���p0v�i��P@C(�_��\'���}Y嵂���ካP��R��2y��+Y���6�E�_\0�+�,1�n=�G�-��w�y�=��l�\r��w>����z���\nz��[�B�]W�����y��zz~����ݮ|�W����\0D�P�?~�����6�G��bi�Ѧ�u��`��)�!������m��ݍ�\"�pH� ���G��W�}��°�ftk�kXL�#��m2޺�u8��a\\��W� އ_w�}��zi�����0z���~������^|�w����X��$}x�k�����_��ΧB��Xc/y~Q�?���@c_��G��z���QD�}�U��u9��o��ܔ|�y~\0_��������kم�}������?[���������&7�˖^\\eD�~����g���5���ˏ���U.�����F����ON����N��I�\"���]��y(���V�4鬇���$>��	F�f$��c�~��L;��8���_��ݵI��a|�2�����l��;�/�F\\g�~��=&>��)�7��o�돏��GQF�\\�u~Ng����K�ne���\rA���޲��\\����������`�����x>����p,�Wf_���u�}��r��$eq�ֿ���G7{x�Go�>\0��h�� ��~���{ �����h�X��y���|��T��/Kݾ����d?���~��{v��/.n���',1460653190,NULL),(8,'NzpaV0in7VA4','phabricator:celerity:/res/phabricator/e5484f37/core.pkg.js;-SFcBZePY3SkX','deflate','��iwG�0�~�_��ef\"�{\0��ڒ<���X�e���@�,�X$rH<��ƚ��Rn�<s�}�\"*��-2222�W���Eq�����|־*W��yٹ}?Z��,f�߽X.�K�1���h:-�óY�\n���{P��]N���b�ݮ/���r� ��}����;�,�Og�:~TUq8��\'\\�7-g��H88��.{���B�W�Ig�]���r�Zj3�ݜ���e���\\\nU�����M�����ۯ�-�\n�W����F��Z��G�X����͢����jvN3T)��G�\"�\'7;�/n���k8Y�s��Z�;�:s���f���Z����T��fL��j6������:Ǆ�j�L�U����pH�q0��a��\"ӊY�P��	H���f3�|��z�^��������j���h��-,�Zͯ���\\�֭j՚�׭QK��2X�-��t���҂�G���U9[�:�մ\Z����Q�D}p��Rz��bzC%�c��	L�l<Z�	t�c������ww\0��CN�R�=*�=:/\\J�,oV���6�h��)�ޔ%�Ⲷ*����GK�\r`�������|Z��E	�����[��r9�߷_��|�&�ѹ\r+�P����ˏ�A,�`[NW�n0UPn#��9�w�S4\Z�Ca)9*�.��l���Î�d��r��)+�~\"R3N(�F��A�)W+�4-F�;��g��If9)\'�e	�,G3@w,���P[��z���Lx��l���!��|>�Wަ��S�T��g0[M�����Ü�$���nX������C�N�Pg��\n\'� {;{;�~�^��g<	�Ϊ�0�7�ֿU�)Ѕ�ꫬ��(@� ���f\ny�\0�:m��$��u����s��I�owz���Mu�\0��j\r��$��FWe�?�mf�4nMŭ��o!U��S��?���A��������e)�c�y1Z�,.���u\n�Ւr儨�C���g�V�󽾿[����O�ؿm�A�އj}��-8��ozP���K���}٪֭���g#�c���|6�V�I���@g@�w�7����\0骧�v�tx���ㄙLL��1Y�w��F������tZ�Pj�)�rpPU�[V�� �r|t�;���(g����W;6	\'x~��p���.�[�=\\U�Qv���VU�;\"E�\n�iAf�rZ������M]B�\0T�	����W�:Bd� <��0B��x~�����=B[(�*�q��Б��Ȍt�`vb�n?\\TӲ��/��w*���B��ww�e�\r�Up�`�{hkR�J��6��������+�uU^��K�œ\r?㮝R�#S\0?���і���tG-�����؝h��^ى��%�JoE���@�fn���*��,�7��r�(n�6�a]1��vM��j�.��hm8}�yƏ��ذ��\n.��f�����Uo8�&�a�\r��/\r��A���n�,�^/���M�ݝ�8ww|�t/���3z��eV.�ޠ�K�FQ�tw�_xD�T?�h�0���i9dOiJ�,+�0\\b�.�xLzg�h�|���Hp��q`0��,hQ�8K�~���D������Rq���d���T�e�F�0��������&�ߵ\nSߧ�W�=�e�h7P�Jeҥ��-}��ǘ�2D)V%\\m�������R�3nc�I�^�HL�kB:$����}�HO|��n����Ѫ,\0�/F˯����O���b� ��9��ٜB����D��F����%Ϧ�!j��3���\0�:)xrx$�}��mv�����t�qQԨ�Z�G��j\n��W�a���-�4�RJ�P�u�Y��\n��&��@�Qk\n��/\\\n�{c�HC��h�\"N���Z0ǄD��_F�\n�ϊ�C��l4��o�9���x	�������l�^�����A>ԕ޾w�!m�Dư�P��\n���<,���~a\rI�M��l���2�00�`ݚ�K���j୓�y����\\��}VA�((��x��n�5`5:+�7�Q�G?\"\\���Ȏd86�D���,�\nE�\"�̡\n�ÉG��o�*N��r%����������^��ڽ\Z����j�浃�Y\0�5(�%���/竕����L��*�\'���/�^=��(�aIa�Ji��zs�Ȋ�s���v�����@u��r��7\0\Z�\Z.�F�%Q$���Ϋ�u>�1!�� �c��q�D���� ��~8�k`��/�IX��xD���qAӢ3��\r�,GY�T陥8�gV9��rI�\'��M�;Ѥ�����U�[���VU���Zy\'[�1�c-x�=w	E��Z������ٹ��h>��k-��~�=�]\n�VR����;����T�=��;_�I{�ھ�a���m�_9�XyC\"1�[[�ʜ� �Z�r�>�%.�kƄs�p����\\��㍐ J�/�&�6�=p�~R���pH�9�в*b<��ȑ\n�~~i�$�}5�%�	�,����u�JX&T�C��c�H���JBp8��\"KXZ���\\�z�T����u�aڲN��!�OH��ܯ��g�M��+�t�[�W��Qg�\\1���Z�F	g;�[��h|�O�vn�״K�ӎӚ�\0]0܄����Y����m�G�Q�[�&(s��g��\'�i��G&���^�\0����w�U�D��P��B�<�7)Ϫ2�7-!����\0�G?�/��c<�:�,`D��������Z0�KB6����i�\n������%�������(�|��&�\n��u6&�;8��=�w`��e�r_�3h�^:�+l�[}:�m�Il�b���L�gy��Of?�A�{?���j�L7+j�\\�p� y=�~;�t \r3���4ľ����Y~�B���z���X��G�{�����\'|��Q?�fs\n����Q��Gf���r\n��א�(�@�N(^ȅs��1��нI޽z�9�7�5v(L����s\ZztYM��Xn\'�\0\n�����׋rׅ+o:�=�@�}Om{T�72}5Z/�^?�O�`T�d^�~��/��l����A\r������(>��[�N�~Q<&�?ΗW���ͪ|�Z��/�K���ݭƗY�(Ϯ��f�O����H�<����vN�V�K��ul\'&��a=���!��k�5^/��n�g�C���&\0ߗ�|F�	�+�j}��<EZ\\������ZZ�GEt���w����_����+d�c�\'{���m���# ��i&I��p�=�a���	��1	z�[�T�\n�Dq+8޿�S?�Ǟ,��~��f��a?c���3����Y�\Zg�g�cZ������A�%�,�j�_~���ǜ�??s���B��/��vk�In��~}����F���	N�B��|�����iu�ڹ�Nr�vK?�W\"y��j�f�_���jؗ[�\Zu=�\"����\";�M��gHh���	?;��9D��Aȗ��m�?\\���Gk��+�4z��+4r���_���64����mx�9��o�3����fqx1�M�x��R\0+\0��(5�g�f�����r��uh�,u�5��U���L�-���٤���̜�C��E�P��1g_D���WيOsz}uZa���I�k^3�T���3�\n,>-Q�G@Q�,/�v1?O+�*j܆=�z�I������7�\'�;�*��� \0]��7�Dt�\"!\\�FϙQghES����K��@��Ϭԍ>�@�6�}S-��\'�����Y˃j=��J������A |�����d�m�uf��X5!�\Z��\0}0+@3ҹ�?��S�k1b�a�����ɉ?pj�Q�ŕ��|��(�eq;��:mkJ��X&���T�W�p��E5!~H�0��of��h�	��\\Qft+�����S�>�R\'������\"Q΍��;˻wOh�X޽3$����;ѯ�@%$Z+J%��La��W���D�)]M:^��:vy��<8��K\r����%> �G���O�cB��p4o}��r.�:CB1��M��!�5�>�稾온?���n�	g���g5���)�[��FW�]���D/�.w��9��RϪ�\\�@{X���q���2]�fmh)���f���%=��ETP�mǵ�%7��`U�5_SX{�\\͗.�?�G3I�cN=��֒z2L��6��z��QЪ�=)b{�\ny�(��	���eJ��ʵ�D/��3CzKY,�ǟ�\0����(��B=�%�ԇz�[-�/�%;N�l��PC��æ�a�3Ni�yf���|w\'?�Y�z\r�<�.JW�9u;Cő]:�	��p��>��\0�i[gR\0{���\n�����u>�\\?�J:�V5!ū���&\0��ԫQ�W�y5]�.�3d4�T �#��vn��!}�u;���D��S��;/�-��\Z�A%:�%�	�LJ�9�-�F��.�,\Z�ؓN�+T$��J9\\π>�\n�)��y� (8߬}���f��y���nd�-��n-�}����Jd��.��s�����t��Ka��{���H����[;@ߟ���U\'�\0��������n�J25�S�x�d�;������|ފ3\n�6�3�%7�u��_U[�o�:���L�͈\0���_a�g�Kǥ˝��>����h��vж�}�\\�tl!��Ë������\r�a���\\�M�^;;G��J��t*\"�[��i��Fg��\r��Ŧ(!7=Wkw���a���Q�|Z����ч�MqtH�s�h9��86�������J��tܦrP�����\Z�T�Is4ߟ^��ݝ��FJ����B����)8����m>��;G�`V��8�Wլ�ʽ�Ӕ��nC�$68��iS�5\\��	�^����Gm	zڧOç�~��臽�<ɥJ_�n�N��r�\rF�i���>稧0���g�U��%��_�;���^\'2YU����u��~��o�p^����XЋW\n�u��ʱ�o�uR�SI_�r������܀t,Ŵ40�m\Z؁2����߯%	��#������tY�.��^D��s�f��S��\0���vw�r�U}� ���/�ޫ�n(�=E��k	���c�9	�=R�q��;Q;qmt�hgT��xc����ˊ���Y^Â�o�*jTb�X�,�#8�Mn��E���C����!����&�MU�f�\\g8T�2W#�H?#�K� =��Ȥ�ՠ�\r1�u�̃������+����|�-��bM$�l�r�^����V���&G���lY��6�\Z��uUp��轄��H#�A�Xot4{������%����	�_Px)���q%��2p�x/�U(���̧S�S8���h2�gM������β��\Z�xd&L/g����������r����a�p�Q*X��k��)+�Gx�l7M?����=w�7N�z|x�*���H�3�a����jG\n����ჽCyH�)�?���1�$4tv����)w�\"�10X+��7�B�e�$�|jR��A�a��#^�Ų\\�R��0���N�7$�_����f\\4�g�:-�P�o��@@��\ZĞ\"=�:~����\0�gf��]�.�Aʱ��G$9k�6-y���PT���߷Q���I?E}4�o��5����P�{N�~�H$����B5�k�܆_�U%�?�M	_�К*r�*���*4�o�k�b�-�=�EI�\"xʪ䀽��h]� `�E2m���o����;�i	SW͍-�O!G��O��ZCS�7�_5Q*�8��d�TAsY��m���9r�K�ƅ�w�`1���jF��9�&��9lU�][�=q���%���������������6#QZ8ߜ&Jd��qRJ�L�yV�L�v^��X�f��Ɏ�c\'a2���!S�y���-�Y�+Ҩ&v�����j��eo��X��Q8�-�BdQ#ߖ6�}��\'Jo7��\'�\r����כS˥��:_(�tB{��n���3v3\r;з�-�\r��\'lKd⻖�-5HX�<��� �gY��\"�R�/����kH+�wX�^u�<�@����-�l�cq�M�T-݌G��@-�ى\n�Y~)W��r\\Z}�!>��D��-�+��\\�.���K�C\0�F�\\���\rE�YV�&��\0k�>�fu��b�n&�u[A��5H�T��`��B�?��a�IڕJ8m%���Ӽ��\r�X	��Й�ɔ�RA�U1��ȃ�p�.����R�\ZhW�MA�m[��]�I��.���j�u\n+p�~��������@z�!�j���#�B7�}�ˡO_lIjϰ=���M��D�^A�gg\"V ���=�ԆX!��wCU�Z��z��-S�q\nl����m�r]ܹ\\$/({��Y9�et9�C\r�\0N��	`��Q���>�X����b4;/c�<��\Z��!z餌\"�i���4��ؒ�G��>p�HVc��͛�9�ⶳ�5q���F�l�좚NdB܂�%VIQ�Sش�X(�S�hk�2�`\'.�&�bY��,�|���Lf�W\r&2k��NU�g �VF�e������/gp�\0���|:��}�ԥq|+�1hЯ)1b�ٲ�s�bQ�u���&���)HN���e�~�H;��#��{W�<xG�й�&޽�&4��¨\rմ;]�c�r@չ���]~ĎP�\\�\0FeZ������$�C�Zs׏$�� |���o���S��\0�d�:X0��#K�gl>��B�>m[�{�x��k�	��~�ڵJ�#���Fz���]�k4�-oN\Z��w����r!�υu�ċ\"%���-���^�e��r�\0� �ϦH�i�7�=�%����{��n9�.�!$��.ڼ4��%�M�FT�@���>%#�\'h@��at|ю�n���Ç�g(�`�s��0�G�F�%���U��Ku�B�#��n�ܽ��I�Aǲ}��L�3��њ�����K�<������?���/����߳j=E�����s��Uv��%��/�����O�Z����)��C�V��&9������K�Ӳ:�fo<kk�3n�����߭��R���gp_�Q��76tkg?�����{X�͛��R��Z�@�������g?��Ǹ�1�Hv��d���3�����V^�^0���:�Z$/{>�\ZU3�����l���i%(���T$=I�:����Q�l��	�&g��:\Z�l�;}��X~��<?�W���]���*-��$����l��En��Ij\06A��Q�G6�ޠ�[�p;J[�^�;���Z�a�3e�D��]P��&�{�uE��@VY�K2�Q��uE�`ZR��W!�)�h0��oЖ##�S2���ay7P����\rpL���ߏΦ�`央\"z0�z)j�A0�M)_\0WIi\Z^Hn����|�z�}�#P�Բ�Y ?�P*����O��d�H����P����/�D~�+�ʂ�g�ŨZ����2��#:�z7�a!��<Q�~��\'R��v�	*�,�a�{ɿn�p�^�K橖�fb�g���a�N;h�!�DGA�������E3���\r	�m<���+�|����g�Y���~ϝ{ٍ7�{Y,�1؆W����/�������^���7��{��������el&�E�5�݊��%���:v���Ν%|��hHˬe���k����l�EEJ���C5��G��>t�k��n��c��$^����Q�&Q|bzr,�aN��fR=ě�Rh�Q�@%�i�m0�ߖ��\'�V||6�G��.�s-ĐE4�s�YJ� /��+>O�#��j�(����\'���l����C����Es�\"�z���|3Zz���������t1D׎���xͱ%$v��z+�̓+]���k!�ŷ=��G����~��B��i{0��Ξ�b��}R�)�+R�w��\'��V��F�c�Ɯ�H\".$�7)*A������+�)��fǣ��z�p�\Z��xk���õ�d%Bw�=E��͎��A��Ԇb��F��C�U)_���ȅ�(K�c��k��$�YD{vv��l�i��ͣw����Z|�o	��{�`K���E^���ǌ�(��뿼��叙���a	�I��S�L���c���v���~ƪ��b\'�V(�C��Z�M�߂���o��+�@P@�k�}7�3k�w��2���nfc�#��x�@�v}��M\r˩�FD5	��m����G��*����Y��N���|Fn\Z�mv0e����05oL�X����L���35�׫%��%23\n�[@�J����x�mT �֒��۸!)JO����-F7�:��6�\\SN�8\n��%��aW���m)؉xK�oI潓(�T�ɔ�a֍d�J\r߭T������Jb&(�&6��2�X�sR�����j�q����\\�`䞧�ga�J|A�Fg�O�}���e/ONB���\r����w:�oT�뽿hَ9���/�A,n�8.�o7Q����DY�1:��o.����n���V��*ő	b�?\\�3��Jj8��o�Xߧ]k��zp{ېXh)�<a��	��A�uN�DBqku�@yKkS��i�N\'�����rxx�\'���X���D8�P�PL���2�Tz�RE����p�<�ـ��m,�*�^u�\\�J����SdEv@u�F�����.EG��r�O�x�p�v6P����/��w�r7c�X����I��KV�G�N��N�\ZE�~a��\n���8�2�!��J9�Ë50H�	������*�Qz��ΔST�}�R�\'�11��Fޓ`-��$�����>K;�%�08>�*��!N.C�5Q�.�����A�w�?�ū]\\�7�d��D�G�	|	�3�I?k ��ބX`�gBZM�U�Z��}]�Z|�����D[c)*tS�o\Z�a�{��扒���Q�j$����H}7��ߦ^����Ώ�;\\\\��2���T��Q��T���Վ�}�&�_߿�=z�C]����h�����nm;�7�u�fp\r�^{�8�.��A��,��9�4���*?�W��䲪�8�sL��HY�sf>޹����\r���+ǳi���H��k�/��u�\\�\\�;\\��O�o��m��,9����@�c�����tv��S&@�y��y��G�)zN��]��A�|�X�~C��$�Dc$�\0�>�������t�=����r���W��|ёK�5Pz�{%�Ӝ�3;?��6e �vҜTwp�����T�߷_{^�t���([Όh��\'J@�`{} �J\\\0ku͔n�|���3A�4\0=�pI��:\nq��+��L�괤yM��\"��M�wD2�k�n,C>\r�ź@>-$�P�ﻻS3�ww����(��l��4�����ϗ�9\\�x�Η��G��6\n(�Q��E��0�Y3`S`3�C��J]>xJd}�x,��1�\r/S���u(	o���NO��6��T76y8�����F�lwwc!\r�y��2���~*�˴�]R�����V��U��F���7J$�8�}V��\'\"��6N#o\"W�������^���_����s�GcKD�iw����fB5뛛���\r阞T�����E�29��xQ��o3�t����d&�h\'|:�� �Y�9	c���j�wE1�$\r\n�\"��>R��q0��)<�i��W��%[D�И�!��B�0���M\0�Y�Y���I\r�c-���Ik��v�@�HT!`ȿ{���iv�i��o��`\'.�W�J���[\Zr��CY��=�}w�����~]a�����z���wi�ː[z,��thf�ːþ�М\'����&h�������kr\r>�\\����r��o1��A�%U�&�<G�ꐣ�W���	�)�_\\/���}���I��@��w�(����)�0\r�����u�ǚ�}ۛr�����}�qӥ�Wp�`���rtN���l=�!�`�ߗ�q�����?� (���l<�Ӄ���R�jSE�:���N��l����u���xA��(\n�[OH�)�?N�ps�~�^>E��\'��O��!\0����8�ţ\'������	褛Bi���W*����{��%\ZL�Eӆ�\"1/G�}��^�����Oo`2�\"������\0�8�0_^�vm�Ȏ���?0\0�C�^�@ 0�/E��}#��-�)U�W�τ\Z%��pMw׵o�c���gIb��٤z�%QC4�>�`l{���671f��Y�\\��Z�s�0��PhAq9��ʞ@+���q��J�M�\"r�4�V�]�HÞ�s�Ź�a���,H��{E�zO����>}(�+v��2j!�\n3Q�=�����9#��t>���(3:��4���IЊ����b-o\rw�ߩs�\rG��?�T/н�����+ ��`�\'tHD����\"K�(&�\nH�0���S�lq�>\"ϯ\n�����H�+r�aYu����|(7�j��h���.`^�<���S*��nO�w��8k�ܗ	�`J�+���EX��A�]�>���b���M��	)Cb$���@f~�G�\'�!��Q��2Zr�&QM(i(�H	\Z���W�n�������8B|׷���x�0nf���t}I��Z��$R�:�҆O�\\j�=�/��|�]#\re�F��f3��~4�b8��Ɵ�r(<��vPri@����d���B�ӳ�a\nL�o8�p�	��c�S����D�������ܬ�qn�`�����Y}�����辦V�+q���J-|C�ot��u���v����p8��7mݵ��?Qu}�/e\nR�����Y�\'\ZAO�y��I�X���\0W2����drY着�n���<�.y#�Ah�B�(V����Ԛm���<��@D�%B\\�(�K�����\0�\r�k�<���h�I\nѹ�9�����X�� ��w�RYQ{��=ZU-ōp��K���\\LGc��9k/K.\"��ԫ$��ڊ�N���\r_�V�N��1nn���V1�N�dJ��\r={]����έ�vzq��a?�p�T�B�V�}3I�4�A]cY�4co\Z,�M�B�Y���K>\\���̓�6(�]i��,0���S�p�fPLSF�GCs�x��I��P���O�\n&��#+AIr\0.B�(��<P�F�[�&ռ��/���������jQ4̄��ݡ�ѣ�����~�����Y^���Q�.�_��\0�α*�~�ˋ�!����_<{C�TmR� ��^\'�Z%>΂U}���R��^�T7�̒p\'6a׭-lB݅��9t�W����A�if�{{��y�i�^QH��!���$�φX��B�,;h��_`�,���¨\r]2j(-�l�\nY��\"F¡Yw-(���N\n�ר��c�H_�\"|�����yBOqx#\nC���8�*&p#���&l�\n@_�0^���i�5C�nq��(qa�8R~B���Ա�+�!+�C	��E������!dIp7��I�e#	?�`�]�њ����a���}�A�tL}����q��c�i/�\'~��b$���z\"qF���&8t�Nx�L@%_{k��i��9^L�m�J!��U�	�XB��}��{G|Wp�})�jZ�|�ɷ$96�%�N��7�9*bi\0}���KuU��#�6���o��m���{�Ғ��@�\"s�KA%ϕBY�A��(�O�s�g��޽}���iՇ��?t`ϳNN=��ba�H$� \r�~���?:ϳ���b���O(���:H~B��0�)%�c\"�+]�?Ģͪ\n$��H��p.��F,%�f<r��H���Uk}(�m\0xẈ�\"1N}@��ES\n��ttSdMsU������_��lq���� ��p�/V��S����UIұ) wg*ɇ|�T��{\nL!����� xZ��m�c\\X=���׬�ևu�ˤ8B\0k���c��n��x;����t�z��<rg�:k�h��~[�_\n�8��Ɩ�C�{�&��\rιC�\r�بm2\0���p*~^;}g�.2\"�4j)_K}�[m����bf�*�a�H��6��R�VԦ5�ڜS|VY��o4����|:_<�E��܄~�����3/�e2���aI�\"���;+���:��\nᓐ�Xg��~��R��\n�d�E��4��f�4�����:��$���%妭�����H�Yu�f���d���:`���#o�M#t����!�@QD6�E�=peaEiq)ʡNHmobȮ�1F\\��b�W��Χ�\n�٘J���L�[2~�w8S�1��q��E���/%��ί��-勁�JbD�IG0����G\'K�(�#O��a�{�@�E:ޤ][NτȐz|��A�� �(<׃t&j�ިm+�i�h6��%��>�2ĠKފl�\\������v_��Xw5�_dAl��H��Xݹ�1��vU�r��dM\n�dz����=楙��#-t�y1v��-�)��`���2w1wF��vv�U���ԗ��0P�:]�+�q;H��|��7t�H�7ѻ;���M���9��4/�=H�z�	��t���ӯ���~_� 0;��r�K�Eb��r�L$k\0�g�ᕘ��z|���XR\\-Kq�X�G������LX�L�_����&XT�w�v[��6ç)�����o�~�������������ǿ����&��>��xG<����������K����������!}|	g��{v�I���Xg2���foOa(�J�vM?Q���~����3�y�?����>�_�`�[�	x\\���N��5ő\0I�Y�y8V�*���Վ�J��[\n���k�o��ڋ�{mI`���C�z|�Ī0�\r��v��������b�|���u��x)<����ȳe��W��׫!����sH�@r�^\0E~F/R�Y�Q��~��?�o}����N���0�}�?�@J��v�i��d��&���M�~���G�P�6�}S.oRf�d}G��x��Q��R$[5���in��;-C�E���M��r��,�RP$0̜��@$n��8/h�bߣ�x�_�>hA�v�.�xFaڪ}���Q��F@k=��=���X�p(��x������ݝ#��;\Z�B�Ӆ~Fsw)�YX�_+�.ٟ�Z��q��ŉ��މ%�ˆ]�N�+�O�?ʾ´>�8�49���>�	b�u�OY�W��XD����T,e)�\\�������;^�UI�:���U�[�s>��;BQc\Zc<�p��,$��X���*�Q������e�5�]���dYb>q5���=H��\n�qAC%\\��G�f�Z���t�fw����;��ɱHݐӗ��0\Z7O��] a���MYA�ذW�1��{v��u#��p��a�����9�>;����/0���?�H9<���,�>�5��o�Ϸ��\'��<>�����O���/��>�����ѷ\'����T:mT�p�J�ٹ���U��0��?�Z��g+�����h9�\'4�N����gF���PD:T]s_2\"�6���lz�L�x���Q�}{2��d,�N�ݱ�Le�E�s�R�o}��	9��1ժ Z�α�(Z�ҧ�>k�z1[mPB=�QC\0oD�m�5-G���쭗�s��9�hy�,�`r=*Ȗ�u��\\5r�\"��;3\"(�ѻ;<_��yģ{�Ku߻�3-y\r%m���5���I=>Y�����J��)�V�R�(�\"��߀��γ���Hت.8�����ג#D�Zo{�u |�I��O���T�D�8��:���Q�G����:_^�M���o���A�\r�7\\���B���|e���\r�0���H댬%���m����D�{��ݻ�{�9���ى1��_�K��Ea����И�˲\\˙(��Z��K��:a�ȸ����*.6��N�.��g!�o�O�D�����d���s�Y�1*Y\"_�F��$�\\�Y{P��H	I��}^�s	�&>�����jX��H����i�ޒ�����	��]����9�6�A�N�1�@\"DxGv�m@m��龎	�G1Inw�\Z��P	�C�ANsh�0Z]�k2\n��m���*��\"�� ���\"U����\0�C��W�w�_������I��@��7��=c�2����o3B4���;���{����b��!5N�h���E�w�]���n=���G�}͌O\r��(��խ����|�ȉK�q@���1j�N�C��5�8�����L�\r��L��dδ��	���nf�I/嚙�\rf�4��Nw��0�<+���0�07�)���\Z �7���l	�ny5����z�>�&��k>�h]�F.�i->�L2ڔ�9֣��t�4aO�JGN1�}������3.��Hr$�p�걪�[��\Z�f�K�p;���;)�n);M���=����\'���L���G�̳��q�N±Q����f1���?L�vi���\r�[�HkR��~����?�}>0�sk	\0@�=�\nj�Nx�Z%�=kOj�Pp�_	�L[��p ��j-:�9z�_f��q���ǖ\0�P�H?�J�w����Zi����\'\"C�J�U���E���yQ �5��Gyv�<v S����+����u��a�~߻�Nz7�G�;���8$k��ǂk�-zt	�����S�%xv��d�3�i�1a�\n���Bm1�V�8���?�U��^�|��//�/���/���(���\'����_9�1�U�N���\Z��,��y�ň�,z7O�;�:�i�2�p�Dg	�3ʉ��pX���K<���-:\Z�dg�#wN��Ȗ�Im�8�ʴ�k��%��xڝ;F��c��I����O��1�VU�)�%�C��R��3�:�44V�Nq$�\'���F�.���F~#Z�xow)vDaG�.|�xB���T�r�+,b~4E���sa~,���(Ȇ+g�N���0�7��0\"Il�͡z�@����m��zr���*�a�m��Z���͘EP�g��1s���������m�=�ٱ}��_�8|�`m�	�ͥ�^O��[]�6y�ҟ���-Cr��Y���Á�+|�-J��0�$}4���=dP ���=W���I5���|��\'�r�|���O�E	�TwO`4��gqX�K�$ݙi���έ�4��@���lߍ�ao}�Wu��첼�X�\"m}В���JFQ���;��}[�\0�IvV� ��ǒbne������h��!)��;�j�a�]��u����v��ᢼ�>F�w�\rˌ�I`�0�d��\0�A����vW�M�2��<�����-���C�Z9]>�ޮac��g2���E�W�(����N�ZL�$\0J�D�M������b��,������e��Kႅ�%��mxxzcx��s��첢�*s&j�q,Z\rC����vK�n�E�8w ���\r>\0�Xp<(O0��\'L9�<S�wǥ�8�����p\0��<#�y���M�3�\Z�+�\"�U�_��7Dj}<���(b�e�#V��*\\\Z��%��J�S]�T�w00{����0���5eQ�!�>���E�ui���$�*z֨����=�_^�B\Z@��\\��ZU��r4�*�	�*�9�è�W���Q��(M���ɵkH�����,L�	�L�b��je;����y�WDWtg��f�����:�����n:e���qN�c�6�R��\'�����W����v7�p,aJo3C��\'7$\'��@	��(v%��xI|�6	�0}R�B���B���|���N�K)�Bۨ\\\n.�h<�\\-�������P�.0X��ܯ\0_���2\r�\nIb5[��%���؝H�����%FJ+1���\r)ӷ$�Aӏ/���@��x�0���	gqhEl�)�O�U^bu�M�\'�~I��5����(u��ĝ�(l���,1�N��E�t(�)�vlrO:��vs)b۝�\'c�gN#�p<�Mb@���\'zf�!J}a����i x�����)�uG�|ՙ\')j p2�<h���9�Fi��R|^�\Zs�tn�Wj���+\\N�rp]8Z��ҕ[�>|+�@z�g�u\'2H4Ot�skK�$�Q�S��Q%�t~�\nc�����`�D7z���h���t�]�~%i�o҂������ޢJ�v��	nӞ��$�#v�=b�b�5�?5\0�dP�`\"�%\"T{�=�*~]��p�*|\0{��:6vD��;��ͳ��Vy&,��[����Fr�UsA��H�\\��zzf:�gגe��Q���!�j�G���>8x�ԦG��v*�6v���9�mK��A�,�\r��k+5C	u]� ��%����K���\"����,m�.o��Î��´�`�RN�\"��r�JL�������_�bdm�6ez-��r���RĪ�P�Y���L�H�];8s�eJ^#H\\�N������\r�սs��P�S�%�a�lY����3@�:��.͖OD�G�|��\0�m�)�%�Z��Me�C�әF\Zm���G�Y�=�4�OOm.ƴ���)a虄���F��\n����Kv�İ�3�\'���?1^\Z��Bؙ̀`|\\�]\Z��ʟ�fh���e�6�i=0x\"}\\�H/\n�i�~xk��H?���&1�,\'ww{��I���׎�n/h#�%� $q��m��;��<7���+n̛��1��LU�����z�����|yů^�1b����\Z�_��hZ\Z���*��m/���{������O��m1����F���gt�}{���m�m�D��|^렖��oW���`8;����\0i9�.�fh�#�e>��,��\nŗ:;m+��=7S�;����fR�|�\"o�^��X�H*�)���A��/8��\\�(b-Y���躺�\\���|T�|5_���γ\n��&�����҄ȇ��!�0�d�$�\"i��M5)�};����r\'��%�N\\�1�ɱ��$`���k������I&�$:bhq��\\�8�u,�u��V?�/,mNS����F�D�r������(m�h7\0��O�A����l��\nS���4jl��c&�CUlMܫ&����<���Te��*���B�*�?��r��AѾT��{��Lhznt(�=�f.F�)��ݭ���6��W5���ی��o3���Lԩ�Ȏy�\'��`�p�[�Q�i6��.ww��^�t�����w��ۻw�9�����a�3����>~���Iʸ�1%���H\"��p���}4�T�K��ʘ����U��^��D����ZSt���G�@� ��@.ՠ��Դu$G\'�����o�π�B���׿t��m�}Y��Q�3�M���{H��ޤ*��㽊V6��ۺ�ͺ��HN��qp�.d�\'oUu��Qg�m���1�*�U!�m1�M�߫�-�̖��\n���Cg]��tJ\"I�Mk�e�\0U��qPDI\ZqڡE���8�V�?�p�x��&��Z&k��^*K��k�JB��8\Z��u�^;��a��8�29�֫��4$����R�ڹp	��@�N\\�W@fP��i�\nȮŲbiO���7^������\\T;)�3�\'�\nɔC#\ZV�\\L[�yu\nD&�*�H\Zv e��=��ʄK�*�j�أ�r�t&���mc�)6D��6,�ӌ��{�x��+�5�|F��6�G�#��i�CѤ�a�,/�v4�n9��\0��%�\'�1G�ڡ���^{N���||�1a�Oh�B3M����he���f�:��r�1��D�=����bd�:�j�|�����//����Of�v�]�y��8����%�g�.����b�Y�(��6��݊fX�9.GsA2��f3�_�EFB�r�_�$5u����4�W*�ϻ/�-�Cs��H0�\\OѨ&Z{S5�+�f�z�0�X[rq����ѹx��Yր���\\�yQN;><q�OA�T��N�g���\'���aR�I�o��Z`Ԕ���iM��E�b���d��DeE�N�@����_�����m�룉�[VαE^T�`�y/�5Y���T%��uh���|F�/J�۞��7Y�3��j����W��0j��(���J�r�v����\nv�`��=c WM+��꧞�ҿ;p����j4��A5�­�9�T�2V\0�:��M?/�b���|������pYn��\\������m4�,N�F簪N�ȃA%��3b4B?Oa���KԉĲ�Z���U�UŞ\"�u��xJ���t+q���{�vwA���y?����4��l�Hh#A��<�G��¹�)�P��<\'��<��r��[nZ7����6y_�Q��_	>���F��l�6l�{G��\";���Q����%�X4x�ʎ��g���3F;���!;#�-�|ݿ�7O��	k�L��8�f��Y��K,��Pە����wZ�2����$\Z�HP���R�P�1[�P���i� �����U�F�X/�s���6���X��se��pX�b��>\\��Z�\"V���[�[5&��e��N��F0f���*]y0Q���P�r\'\rD�	Q�\"E�����׽֟Wekŏ��b���╦5�\0�Nm��:��#d�<S&v�\rU�y��ҡ.	��7�6��`c7Ѿ#9�͛f�Jx��ovK�#մH��g�U��9�����7���u�-�ަG\n+��Ι�9���M5��f�n�R\ZQ����_��\"b\r\r�ח��\n�rb2��_��!A	\'������!�J�1GX��,j�uN*j�`O*Qo��n��-Eo��X��2\'h�W�N4�٬�Cw~�U�/��0O\ZI��!PȮ��K�ʶ#��V-7�k��=�ɠ�ܬ}�/���r�8��x�\\͗٪��5��pA���ڔ�3 \"QDTj�ɇUr���[FlE�cAfy\'��������_q�\0=+r}{8�O�X~����eN�O:\rAbi�����-k�e���E��\Z=y��3Z 4i��\n]M�{]@zݽ�=O�v��2�M苅\Zm���?Y[/�z&@�l8r�̷(�-˩0y=��9��f:�N/a�~�=c�5�M}gU�%N��i�֤�\'������)��\Z���o\Z����X��M3��o�ku��Qm�|�v�қ������i��^�P���g]�MUIi�	��	4���hV�Q\'5��Ce?\0�%]�Ϸ�m���!�Z�e\"\'$/��4v~�`���Q��p3��P+�-\Z�F��(g[�\Z��ߘ��)�8}O������UB\"m�Vٓ(< �R	NY�ջaS��>(�Vl[!g�?����Ҿ�c`�x�_)������<;���@>���@�s�F�:�#�a��CJˣX�O��/�h�r06V.ɕ7Эėe:�j��| է)~pg\r;�<�]�/r���s��\rjd*�x�\"���ggYn&i�o^_��Q/���#Pi±c���9�ف*��?8�\0[a)iN�h�\0��-�0��<�8�?j|_~\r�%.�����U��d�-_�A�h��z��FzK�u$(�jxP��K]X�\r�B�6@��v����tR�a��<\0�v��^S�g��7,�����?o9ҦmO��iG&v���a��y0\0���k�2����e������~w��b�n���`+*�5G\"��N\nּļ[j��NO\\�X��l�h��:iz���^�p�fJBf!	*Bz�N������_�T�9I��Fn�}E�\"�Z;�ᢈ*tn�f ���0�NN��Zy����K��TT��q����H�i3C=\r~e�tD�\r;+ʹmp��tF)yN\'q�f@^��HCfͿ��/�u�SV����f�*1a �l��G(\'^.��\Z�QS��\0EBG�᫲Vg?\n�&�c5��\Z��I��s\\��bt���c��u�U�\Z9*��OhB��)*_�s\'\n�pٻ���D�͠���I7��F�s�bg���s+ZO�f<pѠ��uQ�\\\Z���ǖ�1Y?�+V���	���cP\n9K(D�d���B��h���q�F���H|gE�4�c=�F5�U����l���o����o�/gg(�������^���͋�g�w_����w_���/�������?�k�]���/x��(�rU\"�VW�-�y���\\�CW��(J�jx��rq!4W��c���|6�iI\Z|�9\0c��߻>�9��\n2+�O\n<-L7K��� ^�|����P�]��A�S7��0���q���b�7�-�V�%\'Gv�Xv\"/~^���\0�|�/\'���j>`�J��ꃺ���e\\���&P�v���!�3Ȼ��nsT����(�_��N.]R�ܢX�����|��2�N{�7�\'G��.�[6mQ$q��e���p�bCN�=AI.L��	��X1�l��m��	+��H�?0����bvkT�Qb�S{EA��n��څQ�6�\n���m���,Ni�P�3X�`I�>57�� I���>��%Q���U���{м���+�*!-dq��PbP2ۛ�躧�؜	#t��vm�u�c���V����y�H�@���ˢ]��G򁞠ݯ�K�l�ow�}[�vVշ�Db������)�Y�\'���U\"�,v?8�o)�]ͤ�f��%�-b�\"��q�()|�9�X��1!����:0J��\\g8 OX\r����\Z���e{>����������\\BTAoo���hj��<6�\\�w�?���gG���!9��:in��R���7%\\(Q��kpQ�qS�~|���E���NrI�t���9�����r�\"��.+�b���\\uy�����ʛHp�v��\r�]>Q�2\0h�.E�\r���g��փqS�sm�D��6DY�Z�~~�Ju���RR�\0�KJJnqtxx($L�%.���ǖ���v�ז��հ��X*���;�����Ī��\Z��j^�	�R*L���Z[Fy��9@A��B𛱑��vC���]P�y4we�P��\n�&��Зz�#t#�ҙ���K��	��Y�X��%�b:��Mss��&{�[獈�L�w���L����)|��:tzŉփ<?���&.�&i���D���W�I}o8��z�f1R��7\"��dj����N$�����	zn;Џj2HRH �zOk,F�KŃ�ʜ�����v���l�=���U���gչʲ�)]�~�Ctj^qɺH��I9�\0n�g��4����:=�U���\Z�.<W�]\\09C���?�գҒ�\rRG�Cmj�Dۤ�C��!��_�x��$�m��K���b�8[\'�(6�I��r�r�n��ظ+;Q�e&<���� Z�8@�d�-х�oLʯ�]������;�U$_���\"�.�����d���Ot��!5<;��Fj�3�+c_�<�9�j\Zv#j��c#g�l��k�cSC|��+m𘧈�mEHTB�X��C\'<hr0nb��5�I���t��;�u;���ۗj>�Cΐ�\'z`�zO�M�o�_��E4�����������W�=L7a��B>����M\'���מ��> �����\'�N������ᔽ�#���Ku��%�x`l硉�G��W�q�6h�[���H�\'\nF��#��Uw�tc�F���O������jا\\ծ#���)I��^9�걪Y�ܓ\n?��K��/�FU\Z�ADg�������j�6�*�NG�K�d]�iz�����mm��v؆{���n�ES,�$F˘Z>S�.�<�F��_�OEU!,�L��s&����񷰃O�����|�o�?�f�����+)L�0\r�I�\"�C\'h��=�m\',�`����fAި�nC�����iy�������n��5����\\R\Zf8���[J�1\r�{ͽ��0�n=��/H��2��$�itDkx��f%���bY-�NM�by��Bx;�������[Z����\0�O|�M%M۝��R��x\"�M�2W$�2����zeݘ}~�,ρ��(���ad]#�51\\�WB�����j�g)�~�m���Aԃ�M�K�ʠ��iv:gC�r2�Y�K�%�����C�W\r`.EX�D�]28T��,���;���b��x�����]�J`!��~�w?wq7�4�a#�p�E�:�n��U�>��������K�~�N��[�Ђ��5NZJ7�\0Œd�fI�ؖw�.�6[\"ي\n=E�=�(òS�vP��������Z��U��1���̑+Ys�U�\r�8���ű3�\\��Pfb����H!\'�I���s�ݪ`lE4a���Ԍ�O��5�;�*\Z(\\͓V��	Ӊ��EK��5X>�)��9���lUpy`�J�f>���tMlp�u\"��F�]شY|DG�7�CPUH~�:tw�OM�3��>�-�!��ǒAГ���j5T&Ʊ��=��G\nQ�7A%�U�\0�C�����-N\">�t>�,^�4G��j��t�|�7�ո���a�=�-���UX��+��u<��\n\r����eކb�%�+�K7��e5FZ]w��k����6��ʠ�-��R(��r�h�@ʖ�k-`�l��u���2��@���{��K\'\\\r�jء+?U)QH6I�x\r�\'�^��c�m���Z��v�G)���p���e.a��06�J�fAé��pB`������4��sz|��9��E�����O6��\0瘋�N�׻f�Ѯ�h���K���>�ϻ�8j�\'�{��jyրf�*b�\"�K����!�nG�[�G��y5{$�e�.n؂h�6�9\"e������;Y��F�!xd<����a�h�n[����ڱc,��O�<��/�u�g��W�\\Ͳ�&��j$\n=�\\:�Q<�s��}�싥��+�)�G������Ľ��.�+f��:�1N���h�W�������.��������Pc��-v̌��P��V\r��O���7�c�Et���9�����H	�XzqR𡚬/�����R~T:��v��u�/H��ID�\\W��kϷ�x%Ç& �]��h�|e�Q�����1{N���z��B���x���H�Cü�qۻ)�i)օ��v�l�a6?mc�G��9�`v������bG����a�	�a�K�[����۝��ʣ��Í6;����6����7�?UF�e-�ߪ�����n�Wu�#}�Ŗ|@�5]�s.���s�Eu~1E�Y9�G�Kl�\"�+�.�F4j������˛�,o,>\r�lv�MR�rZ���3w���\\=rz����b��>)��;��\0C\\2Yϻ:0�!�U-�(22����*���m�7�	�N�Bv���pt>�f�\ZbJ4�\0>Is櫚<Cҳ��^!TA֮�\"FG|f.���K��A�C(�� �l|���.���v��>��E��Y歚t���2�Z��ݟ_��9�o���C9ۤ�VV��I�ϑ���TH��T�A�n�7�nv��s���\0G�V�g��Ŧ��Mdvz�U5@�����Cw�\Z��ё%2t������Y>?;l�[�P~�G�Њ�g�����(�@�{��,\\�x{s��Ч)���Y};bIL;��<:p�u�T�K��B��h�iլ��X?��p��3��Y����#�ic���则�4l\\!�54����{E;(dɓ�D9���Q\0����F�.�峴w��x��ÐW�K)�\n;7�&�MMhJ�#�}�\"W�Pg>y��QpDww�3|aX6n�,���K��њ��Ɩ�IA/�&�\'S��{}s��AmS���Z���2q�p��3�����\0mP;kY����b�O(���=1�f����w��i�T����Q\0>Z\\2IO�p̩7��``P��RyRF���!��XS�`ݨ�y� ����\\D���&_#1w.!���1\0>M�s�ӽ�]?��ԭ��=�\'���@S�����hw�0�?�$�}Y�S���59�^Aa\n#B�;0�$;?mIr,_Sw��_���=\n���j�VF��$��#L�K�0�!�+��OĔ<�i�C/�X�g%b�4��8u:^��v����Iؚ��G�f�N��$ �m��ʼ&����Q[����]6���[t,{ZN�#��Yt�\"����ʻ�5�\r�2���R��[i 2nY��|�Tv�ތkE&��&Ig�.Ǡ��󸵧4\r.(~��?�A����ށ�nv�^��8�\n�.��?��宕z���}�����(\"�q�y�h�b}W�_�>�-��1�qu\r�g�����d�cjD�i�G�]�?��G��膐u/�᠎S��P�a�:\'	b3���x�?Es�����; �	ww��\Z�1q],�cj�S,�1w�=#5�Qv\">=ZYg;$0�0<$�H�!5]��GhO�LA�� k�/˛,@��_4~�֙� ��m�[�m��&,ɢ`e85����*i�[)]�+��z�J5�����%�� �!��w��\nf�ψ��M�����ݍs��\n��>�g��P���%vq��2\r�l:-�{��ٴd�l��Z6ͻ�z�&��\0!���b]��yQ�>{�G��Z#��O��K��R�����\'�=�>��[uJ�ևѪ5����v2��1B��E�1\r�:֧�e0��MM���VE�v����R�����b,HL=����;�tzU�O���G�O�,h=�C�\\�\"��f�P�p�Ke	���]�}�Qe�[��xb9�G����tֆ	�E�(R�c\'Db�\0W?��8�R�V�}�U{*���K)�s)��p���r���U�W�P�+��@)P���cdQ��<Sz�˥(�Դ��L�VzC��5Y�����W����:�����ސ�Lq\r^~j:֢Oc]*Y�|:�m���\r҇_a�8���Y��I�@ƩǤ�JGi��+�[�Y��������_c�B~BJ��!�>����%Z��>y�h��߯��j���� �૟��>�mhik�Y��2S���4a��q�Y{{$7f4�.̶���e���a�\0���tj<Ʈz>�6�c��U~Ƽ\Z]�����=��D�d1��7/��\0��^d]T(8������;�D:u5Z��+#a�(��W*Z��.[\\ˣj\\=��aPB>_��=�y��j���5A��P��\0���^^a(�r�Ӳ���ʗ|D�[.��*~��M���Id��g>\"u���&�9�g�����:�Mo�iA�$^�3��u�ݞ����u���N~t��-pӝ�n(�8}C9�������B,n����@37_�p�Z��P����8\n��w��\'�f�Ѣs��xi�>�0�uC����@���{�.�Rn �F.sK�+�1\Z~F��^+�?��~\"U�!�ʝ�^H�quj�ջ~ݹ�����q_�O��>���_\nQ���h6l���˛\'а���:�.V�dC_]��������EqE�*El������ָ�Qjx���H�p���p���<�u0ۙ�YP��T�^z��F����)���!����d��\Z?y��_x�3/ <1�-���ļմ2ó����T�Z�産��P�n�a�*�?%�A�b#�xF�{�f�LJY��ݧ�jq�ɐ}��^���7��כl�}�����X��^��qiP��٢\Z�����C��տ��m��P26��%�T	5���g��\\.02�b���c���{��ffǉs�	!�/1v���:9�ؽP1�[�Pق�%g��PC�a��]�dx=���䲈[��Y��8��j\'����B�|y�_�wY81�޵E�o\nA������(�ƹظ�༊���7��b\Z�P��r�ȭ��Z\nѴ}\'%H�ֹ��Eź��[ Ճ���e>\"XE�¢D&����G�Mag)D��:3��u����I��𽮰��B�(����S�Lxd՛��]L�S2�zc�[�2Ӕ��n])���Du��s�a�y@C|]�C���fG�(tX��Û�\r��bH_\"����\r;�V�W���d� �WqU4�T\\k��m���)Gq�g�EsH�f���;a�5�L�wT\Zժ�Q��|K2�lHH),,����P��e�H�ʇ���$�j�����*�M�++�-$��rk�d��;\'��[}�p�.�d:_r�DFoZ\" ��d��)��Gz�#�aN����\Z@Mf��d��-ޡhK3��f2Hͥ/�M\Z��*GMx��I�/K\\`��v�8�e~�&\Zb=@�|�?�P�R��CE�G{��jN�L��>60�m�h6�T�0̈́��7��:��\n�*i\'�bC��lM�6�����\n������v�de�,3��̔i­\'Y���*�衚L|���0>�$~4rQ��j��^T�Zv �$H(Wb�9�������Nl;��_f���J���L����͹ Z㢷���m��c�PMD���Q��v�V�v.������3i�|�ΒM�..`Dш..���	=�eX\'\Z��(|�}��Ҕ��{\n���S�����W������Q�WG����\r��mX��Y����^�-.�W��)��� Ds\ro����~��a_y�_l��/�n�M�ͽ\n��T��l/�\0�Y���OuW�oz��lE{���s�k5ny��h�N��$�߹u�\'�}�^�%���ڷ�����&5ĺ�Pq�qy+�0%����[���J�G�B�I��r2���ME����%6�4�[��D#zb�m�O\'^���G���|\nSΜ�:Ó�1<�>|~rw\'?Or7���v�X���Z:��%�6ߎa��ɎH����YVZ��$�&����{ꔤ�|�$M�#T�\Z�S8yI���C��Ep����~J�/N�@\\��#�)�F\\��qo.���U����p�������O�^S�:֘\nc�&M���vZV)��`�6����|_����sBI\Z�9�C`�/��l����8�q��׉�g���IY��\n��,ǣ�x35����S�-ԁSDG3��hG��$z����<Is��~���USzI��dkB������wU��]�A�\Z�c�E6)W���\"��N��I��F�l�\n����>�ӡ�]\\�j)eJ�\0�/hϤ?e�h&���P�.7�����NJ_�ג�j�rO=�)SQ�v�t5��\Z	/Εf+4�Ez�zΠ�ȂW<߬\"@^�0�D��+�8�hN�@�@<x����ƴ|B��S�[d]��i��%�%\',�����)L,�R�0O�u�d)1+��;\0�K�]RZ�F1��u�fs\'r�Mv+�����q��`�q-�=�\Za�{����$����T\0��k���mr��:v��6\n��Yw�ί���z4� U�Z��9A5����8wU��zWĹz�59;d�n������7����MN5��M��(5与:jrK.����nQ��l��]��\\l���1[!�F@�����Uw��/1��q�ack��\"?���ԺFqd���SG<��j=�>�mC��5�Nqe�����F��ۅ��bbQ����1z�o�1��~�q�t���\n\\�1,O�Z���y�{j��4�^���5�4|�4�#��!�ͅo��I�b5ko�$�\n�-�(�u5�!��.8�����ߗ��Yk4^oFӖ߈�����b�kt�<�l�Y]�&(�ȨY�\Z�3s<�Y5��~�R\\n��P_��Ý[� `�P GI�F��J.\nt*�s��J�X�j���e��\n_��4��5E������m���\0�:Д����9B��3������\"�K���b���_��V٦\\��W/ʥ� �Nt�v~z \n\\tH1�w0Pc�z�H؎�889�Ž#q�}P���5\\�B�dǹpw}�ؙ����\\e��v˒��K.:�����3���wo~���]�eQ������O�C^�Z�/��ţ��P��꒕�������+H�Й�gzl��	R]��@53`:v�pjߨ3��0�9�(B�9\Z,��=���W����Z�9E�����(����y]W��u/T;�-y��7���M�p{���DnG�־V	H��5c^G�l�� �;ъ��1�D��^��Շ[�`�kby�P�)@/�u�}�5�Fp+��=O���m�KG�o��\\��iz��7f�;���fL���aY��8I;�,Dl�]_:�v%>�R,��i�H}��-,�!5��t��\Z&��L\0k���^�*���Y�q�ĳQ��-!��ZT3<?:���4 ��\ny/:!�J�<?_���\Zv8��n nAw�����/��<<��QǍ����E/��%��q� �ٷ�x��0?���d��B0�8R	��0�f��5U�sn�Z���H~6|��\0�m�ڊ����y�L����{�#��?Uk�Z��4-���PeMK���Q$�϶�\"��@���G���Fk)�2���T�)ʵ�@[�2 ����e��ۼ�Qm1�7\rt�{��>ξ)�N���U7EE\ZD��/帄k�7K \\p֬���\\(\0�܃O����D���uԉ0ঀc᪰]{�b�?�/��祈��[��6�e�Z�%k{���a�����Ѿyh�6��W���+�6O.e��/�L\Z�vw\ZQֺ��(�k\"Z�癷<}M	m��U��\"��	�n�/g�v���^�r������H�\r�\'j������UR�\\��ݴ*U��Z:�KZ2\n9�jhKJ�N�i��w�A�a��^��\ZƑ�ӓ<��w3�P���\\��:�*�Y!pF��s�9��@;�G��G�Ѩ��)�U�k��\"Է2������s�섗��U����4Ѡ���|�np����,n����\r��92�4���C��G�ף���.B)ͅ��NvB����LH�؝󫚿qOA���y�*��ZO���y*���5G0�q���*v����@��=gRp=N-RX��ժ�������hS�\'����0 &|��/�G7Zǅ>����\Z�UR~�H�x(b>*r�fgʎ���P���)�,��N��`nh�F$�q��)�+�mv��>�$2_�X+��^$섨���o+˹H����N�;��i����-����\'�/���z�I�K�%�x�Q�^��:Z�g�W&����z���G�:��10iM��(N�ev�_5,��%K.</)	-v,i�/Ԩ�8�ٳD�����큎M��\'�_�ӂ��rr���ܹ�(VG��r�`��n��A�S��GA��+~3��\"6�s~���<+�*��;�� 6��T}>������.i��;l����9\r��5%�[�V�����f�����[ɑ݋�q��Oz��b��vfKS��i�Vƒ\"J��EaV��o;�oe�S���;VxNV3!�(�i&���Z����I��V+Ě��Η#b�3��|�^COM�?>�=���q,\Z�`:���A�t��*�@�g��|�	�����#���:�6�oQ�(h�~9���hD��f\\��*?�d}LѼ<��{\\]+#��>6W�vI�k��%��Z�U��S��G<���?�jB�{0���8F��v�2���3gW�c��5���|^bh��I�B}� J(,_�6j�*�e�-̮ǾZ��tU��/��!C�����T����/���]6E���^�s/Q��NB�O��]�\r\r*^(����ٞb�O�$AZ��fht�ڞ�VY�Е�\\�e6�;L�%�Y�1�/��#���:E-.�������f4}������j��ݐk!���rWt����AR\r���Q���Q�(��qh��1�8����7&��7���V�t���\0	\rK��)}ٝ+�(����M[����[3����,W���_=�&��zPǢ���i,�Q�ۆg�����U�Y9�2�+�oE�C�l&��`n:������ �\ruz��	��7��.���hy�����^>�\"t��ԓ;�O�;NOn1>�/�r���t��IX�� uEC�:��)���֞��N`�3����L�������3��X��hZ.5�M�y������ɔ�;�G�\\N���p� ��r;�F��y��r���77�%��0�e�:�R���E�7Pm��w�׷��b\Zױ�m����\r,�\n�v�j8����лH�Ӄ�_d�����^]!�l�٫���צ���Y�\n�ӚP��~�\"�����\rD)c�#��A��l�}T���P��l5��&Y���gj��\ZK�i�M��pO�-��u~\Z��_����6O{��\Z��f+H�Cx�ӣ����9cBD�S�:�L��-zq8_�D�6c?�,��� �s�u\0���$0��[�)򨏴��ڞ��\nLb��`�D�_լ㽯(;�ZىZ���]�]��aYS��v�Hp�W֕j�DRT������b̽�q%|}��N:�\\��P�g�nO���.�:_�����=�=&�ة�3l���m�Y�(�f�����l�������l���<��-�Y��<[�\\�f�/��� �����\0�WZ���s��V�84a?�����1�O�~�*M��L����qr�S���~�h�!�\r)ꂫ�p��k��L�yT�	�����Ӷz(�I��.�E�nP\n�Fqs��u:ww�����=IX�3 ��-���U{��F���q�d��o���uu����g8����=��^�έ��]=��QP�>2���#^��\Z�Fe6z�3/x����5�w\n���i5�\rvtج\Z9X���QLJ������������涞1��@���8���.By���Cj�_�N����p�Sc+X�Eh%��5����\Zq@�q\0�K����9��v�Svw�|�U�Č�Y	���������Bb�<�7K\\7����������xw�	����ɘ&;��OGSe#]2��Rc\'�FM���%���UN�b�~�su	�fCݎ]}�$�X\\�czuz���j��բ�!d����iXB*ʨa x\04��%Z�q5�V�g��T�;�kZv	�N�Y߃A$f�}���g\Z	^2���[����M�w��6���Fe�MF1�(\\ۃȌ�x��OSx5t��D,�v�������ոU\\�����8	B��Z�M�]g�ٹu^�h���\"�\\��c�������vT\nz�O>��~� YRUK�Yu4�N@r�Q�&�(�$S�h/%-�l�J�m�N�SwY���GY�O��5��i�.*�E0�q�%��$�ݖ�� �1�2jUk�\"T\\��cM�T�\'����v�,8�4QO���)B	YL��� �y�v��L�t�~��3N����2�l��,��˛�FP�M��_ѱҧ��(Q�7L&AEn2�	?nP��e�\Z�3ν}\0P)�k���2.~�\'_:�ǞL�4���&�Irx2\"~LEAS�\n\0�/��ˋ%\"U����k�j|C�w	�5-H����g)�\"y$��7&�tl�ʰ��u�$�<�N �߃Ԫ�X��7���l�Ǧ��A��[�펿�E���f���߯�4rb���`�d�0�=�Rz��9�t���I-�W4S�ky]CD�@�c|�GB��u�I�͛)�l�*�r�����Hӌ�-�W���44�u	��+.���|��/��8���E	�����Ҭ�+!l�0�rCX���^��e��E,y�v�u��Il�s/�W�^�zy�s�Kt4D��1�7�a�$u;�L\'D��f6�j��)�ȶ�����g21}W��m������?JMQ��̑����BL�2{.Fw��ԏT�t����c�w�w�\Z>��w��I��\n�.=�ւ\"0 �A���m:�ЈL�Q�6�IF\Z\Z��A��������](��{�v�Fr�z����\\x_e�mZ�\n�B8uU�7��Ͱ�M�Q���z|]�;�?߉��W�+�1��[�����$��(Q=��#?J��-dK���[`�0��k\r�k�ҽ���bܻ���3��߷:��h=�ȗ��B��y���J�n�}z��I��`9�z����{p{�\'n.�qꗩ\0;_�tE	5v�g����]�����m�eMr ���P-P)�U,�}bq�������1�{Mc�u��N����Ej?���R�X�[�5!�I��8\'�d\"z8P�g��蓅R�\\%⬚�����8_p�UL�k���6;�z\"&c���d2��4���������p\"�)���4�h\Z:F\Z��_�����!�YJ���L��8*�K�clV��C�m�\\:���\'7�Nn:O��-����8�T�i���5p�AU�}�b�&֚,�t��Yj��ܑP�š�Ŵ�Q^�z�AH�&׉�6\\�tM7�ڊ��ߎ�!=�vR���	�Ŏk݊�C��<%��J�簬S�х��юNW��}�ⰿ8�G��Q���ݯ�!����< �.�ZZҹ�!�X��;�or3�GFp���<1�	ս@�����6v�H�ї����~��\\NRqy/#�.&����d`@��a�>Z�m�h�J�!!��b���<�]�#�\\*ģ���-$&]�R+�8tٯR%���!:��B�I�gˉ���j5�����z~U��z����wO��J14�+{L*�e�S��W�fgs\r�i��p��k��r��Eȵ�}�g&&�{�2$JBUC|��)����tϠ��uu8贔�L��r�H��&kKO�h�[��U�	n;��=�P�@9��S4g,EC�\Z�]����E\\)��X�I*0�X؅� ?:�C&�j򨅱�;��N���r1Z]����v�f�)b�H�NiJ5�!���b�{��I�F�6�&�u7����Gs_�z��,�[練=aʤ:l�B��x>U�	u�8�o�}>##|�0����g�W�v��[M�:�b;�y��ms�\rҴ�..]S0*,�MYN[\rv0L�����h�U��bG�k��tf�=_	c�6��7#���?^c�~�h{x7K�_�4۬K���vK���2������#^�|B����i�+(����[�(��ñ\"B�r\0.G���n��4���#ֹr5�Đ��Һh�� r�	�\n�V�vr�z���\"��*�ǜ�p�x���8�(�f�$ח��v�j�������y���\"m)�)��eT7�N�n��1o��r:-0B�������Iuv�t���=���zY��x�>/�^\06������Ť��H�4_�f�V��U�u�=�,���գ���f�~��ː�8��[ː�t03��o��������X���n�A$e�vY!Gbh��ۇ9SG�n�a^�c�t�-X��fg�5\Z��LaB�D¥��RYe\0N�(�����D��7���%5P�XX�5�XS6����������Z��!7�	z⏀�4�8\n%�7b����Z�0j6#Yt�	|D\0� ak�㊃�M\\Q�h�]l�rC��\0GPv���uGK��ׅm���9\\]\\]�E�?X���c�t^���L��&[�5������S6L��GI6���6�^u��{��v������n�q���0�;&`�3��샦Fї��H�=vh_y��1\r{�W�B���I��X\Z@݊�_��3`ҥ{/���\n/n�6�@�g�G�2x���`����K2�5��W���\0�\Z�����+�S0GJ\\h�P�=c�wa�sS�,�v3�܊/�XᲦ%��nà` ^J�@ޗ��|8�f�=�@iM>!�4�@^�?���q��H�s���rH�1�)dOa��x#X�Fa������ր��W��G+#o�P�_�/���n^ʹ7��q0^>ox��={N�/z��cb�2�5��}��ow�>ɹb�x{:�N��Ÿ��OIpvw�^;�-6)���z\0T�Ѵ\ZG =� ���1��e䣏jP-2#��?/��������F�\r�C�2����V�ku���Z{��Z\'\'cj�sj�Ͽ|�}�Jm�2i}hݰ�8�._������|6�����_�!����4�	sL�(d��Ҍ�WY���Vև?]@Rę�{�:�ʹ-T��8_���8�%��2��v�H} ��3������̻�v\\9\Z_���~�F��Hϳu�v�j}�//�W�Ҧ�/���m3�|�Ё�g��Mtؔ>������,�~�W����ץ���.ؔ�;֜����=p�v���`즟�HA{��A�����@wkM^��y�W_��gS���jl��+��>��yĞ5jZ�^w0�s��x�0u:���>�Pi:�L��E�Hto��8�\r���IP������&hs��R/��)Cy�nK�������<�ϫf��])�ms~�\'��[#�|�\\S�S�.w�vM�mS��<�(�\0VP��|���_���\\qx�S2n4��j�L���xI��׳��嘅�����\npD* ���).@}b��a�\\���)Y�O�{�(�\nU;5s#?���u.��L!�[�M}����\0��_����W�}LrJ�\n��W���q��:|.�oW2��k�H�[\0>bG0��a�=��F��Ԅ�����v)����l��PJ�K��.ڼ������yͯ��ߪLH���d�%\n�v�˂����k*��am\Z]/�t��K�.Tu�z�\r�M���yzj�{���W�{V����\0�J�&m\n5�Z1�0{PF�/f���\0V9���r+�-[���~�-W��b�^����̗��Б�;���-�˴��Zq?!��\Z�<��f��CD��y��%9���^�G˝�#���|�v�s���q��B������,�k�/�T\0��l����ݞ�k��G���B$���.�@����\\5�pr���;���C\"6 �k�t����Tm3���azH��l{\0���*��x�� )�b���3����G^�sj����zO�>:���.�5L��r���*a��ጬ�B�t_��g��)ջ>�;�G�웃x���7݆���Kq�Y�`��Vn����k�`Hm�x������7Aɛ��MgK4��{`_�w[w������?�!H���ޕR����|�系[\n6��ͺ��9|�(\'&i9��aR�����yq���)�����0k m���1�p�P�������_lf�\Z�Z��+u�g���1x����6)\\C��ŷ�*N�j*�j�;�_W�[2�wM��K�J:�Vp�Z�WO�Y�x�R\n{\\@��f�)��e��vE8Ss�j4���Ȣ�8R���R�$��z7+7�\\��n��K��<��g�L�a�,_\0r�4@����T��DK��q4���wCgM_ݢE�J������a�҃O$�J�2���7����G�S}��EN	�S�QDR!l-\0�c1�\ZˉH��\0K1)�>��e�q�mv�I/��L՝���r��p�g�IZ�ҭv��e\';q��N��8Z?C��� =Ro�+7���7���)VG\'�\n_����hc��1L巣j�f�d�����~�	�����Ə8���`ߵ>���9�>��z�{k��b���\rw[�т��5g�񐮩���o�A�{�m�4��y��\\��3wKf�A<�_�B\0��А�gb���kӝ�[�3�B����?��]�1��9��q6��RmY��q�@ǳ�|b��7�����$����_�N��(D�P��wtx�)�A-�����|u�~e�V�g쀴Hv���B��?{ZP(���Ԑ����i��&��z[�ٿ~����Ͽ�?��d\'ǫ،i�p+.~aH)	M�іl��\n)J�<��j~=�����{��5Ǔ`W�z\Z9�\"��7�U�_���P��k���h��D,����Ug�u6�Le��M=4�~�B���u�z����c��J{�>n�lTW��~tP�����\Z�h�{��^4q��@ӻ9�#U.HE�B7�!G%�J�D0�o\'A��H��Y� ��i7�-��c��{т�]2\\���D�[a~��r�B�.���W���^\Zv��J��^}��S�/>�W�n����c�?{ t�y̐�y��&Pc=�۶(���*��e5���lU��h�}�\\G��$�!�OȠO4 �-C|��2��,n�ߔ˛�Qe��]d9Ve\r���5r���/�F|b�W��aD�x��C��j^B���\\�)�\r��T�Q�Z���6��B�^؏�;���(<�/aw	��6��k�F��䍄NZtRp	j\'��RE\";/�GX#IAY��vةl�E0OI��\n���;:��L\n�Ϝ�F��2��ø�^�3��5�P`�*����崏:��)�х6�(ˇ�� ���d\n�(e�m�P�6E�qx5����+�z�q��P�ă��0t���]Q��(��}����tn�Lp�Ѓ0K�8UN����%NmG#��p�%N:A�$�\08�T���i��=�2\rr8�e�\n�{EmT�Km��S6Mb<n_�\n�0�F���:��0�	���P�~ysD!���h�M��pX�֔?��*H�t����3g�L�-V�;--#�jʫ!$p[hQ�_�ŢwM�������v��Q���w\r�r]����T�����@ꍦF����t\rnk����R݃	��Tw5�`�m�$׬�o��m�F�\0j�/�]�yl��<�\Z��$�Q�b���iW��l��)�}��!`J[�z��g�\0��Pb2\'hN�>cU���g$�\"�\n��� ;�r�N�LnW�kf���N%t��\\��ى�X�d�[$960.l#9��[#���%a־�<�Y��z�����q��4�i������0�� �yPM̯5��s���qA��U+����iC�R�p�Wo(����R=���IuU\'����T�$�2��}On����M�Z������C ��\'G�S�����h!n��<�iE��������z�_?as��y)~M�]/��yX7��:�0��ǂ��yݹ��\rD63�gj����X�)��廗秿���5�¯׋v�>~�vrr{���fئP���;(g��/��j8Z.G�\Z��5j	���0�,���&:�xq]�G�ct��*��y$���6�<���a��׬gq�%F� ����{�$Z{����~��_�8SXx����?�r}���?��o;M��@���7�_�Ow�41���0e��EO8�SrZ9���x!�9�<�\n��>��ü�f��g�O;;�1NN]#�ۿ٠��J�\0��b�k\"��U��E_�_pW�eP�2��y��o=�\0��1��g�U�����F��z�B�qx���:m	�&���p��=���.X��e�OV�]\0\Z����{�~4uz�0�7�:�����p(�����X�?����+���h�\"r՚�[7�M��h���m�Y�S~�1�q�z��N8��]�|i�Đ�U���ĉqAy���1I0�^i�\'(y��\'b���y=Oe��h��C\rP0���ۇv^�g�߼��f9��r7�!P�z^S�\0�ǲ��\0��W4}N�A����/Ju��6����u�@U6^l�)���lm���MJ�e����=�̼\'a�r�E�2B�!��#U.����O2!�9��|����\0ڌ^�D��Nv����CY�:�yd�k�{&�v��X\n�\ns0h��Π����ma���{�u��� �n���4m� ~:B�)H�I�=��+����c��(��`w��g�8@4����\"��X�G��k<�(�?P�Wxfrp��rE��]��J*����sRN�~��w	u���<8�:m7�9u�*�	4�/�5�\0����w�,��]	k�P_!6O�/�ߟ/F�j}�a,<�< j@	l�5�����d!�Z*��tq1j�\"; \0�W0V�j��S.��\n����܋�B.�W�����ԟV��ld�/r\Z��c�>-��ۿ9�$P�����x+#����}=��\'���:�����Vi��c�,�߻���ggg�L��úB����θ�1�	f��1�T=����;��O�q�!���G��S<�dc�����O۴������%��t�:���Y*Ea���\n�S`}��=�t��O����m	\\�\\��P��h�R����BF��F\0�����b�ӹ]�O{����s;°l������9Fw0s<X�G�+b����O���1�����3pN=λG���;~��������h��x\n(3N��ד�ѣǽ?~�1���c�/��\Z\ZB0Ng�I�qc���[��z_H�O���#��\n4@x�{������:_F����V��.=��x�ςߓ�SJ�yU�WӜ}0�Ɏ)�+G�suqw�%w�8Ə��G�o,�T�=L0H���z�8-Y����>�r�ީ��x$4��X,��jWu(C\'���N���szE�ٔ�.曩����A�����N\'?����z�.�D�;sp��>���J����8QK�r����3}5�K���K8�gպd.ko�K�R�^���YN�����\"�$�j��_�W�[�����6�Y��˟��Z��?-�$~�q�kg0O�3�=?;[�Ρ�����	����W�Qc\Z�:�����\']h�_�x]q�;)��NJ!yu��4��e��.����i�u�xX^u�-S����\n�\'I_�Je�N��h*�i\n۞%��W˚�¿ʸ��{W\Z�^5��^9�C=�ԝ�B�d�Tz��g�έ�\"�ܬ~�+�7\\W6����m���װ#��9����QT���O,��NS���gV�C뫁_im)�sTh�~S�l��Sk����7+�ׯ��%�z\\3���}J�C}OaJ}���d�p�����j���#��eJ��99@Dw�\09ι��{�E;�cW9��k���~��b:�T�#�\Za-�(�HXm$B�U�Y�Y�qH9x�*����T�O{sa.6����>e�jG�8?�A��H��↼~��d��3;Fi�tH�����=�f�3�q���I����>�|�K[ى;}�Kd��u\" Km2H�o�.�i׸h\"�7iꅏ�kA��ms$r,Dۧ��x��4��^P��-?��M�TL;r�I?y�I��^�qx���O���=S��]:�W���)M�3㑋c�6i�P*����v�Q͆�(\Z8��c`6nA�:(���e�b��밠\Zq@���+�f�O�л���T>o؝�|>]Wt�|�Tݖ!+Q$(�F0�.Dt�y@��a\n��%M}����N>��i���&�$����H\Z��w5�~%毵��\nuz7p�G^GA5zAo�;�MdS #~ɥ���ex2���1�V?�i;�a�cm�4�P���p��ߜ�/n���kԂ�\n���@̈��q3�m���1�xB�\n�5֖�*kп\0�w�	���)�����K��t8XNz�<�j%S,�&\nZ{�O�q\r�O�~���Cғ��9\0�C��r�)7�-�x`�~~��HCY\Z@d�+�7�,w\0�K��ɘ�ha�bG�u�+`�U�,P��ed͑�3ي\0nuf����$�՞�qY�dD\r�/�V�\'l��(��⮺�rqEl�_�[�{1c�\Z��r\\�Y����p�;��,�ko��Á��^/��+���@1,\Z�����vٹ�]/��s�g�8*!�!7Ņ�8Ӿg2�Oڂ^�δh��Q1�;-%S�(|~C�Z!�����~�M�XI4�A/���~��}iHP��p��с��8��%{�bU��������|��n�@N3<V`��c�Q�\"�׈H�n�R}�_C\\�E��}Ol�]j��/��غv}��J�=�o��o����!Lu��d����+opd�B�ٝ��j�f&�W�=p�\0����E4e�#w8�3ID�W0����kw�KN��G�i�@<�]c�G�q�?\n���n����/��e,������?�E\'�t��Dz�X��m>fF^\\��;���p�+k�M�\\���EI�;6~\n���xw�WD1 v-�*���?%u\\ �6Nz������`\\m\"����j[��85rխg���4�3ѯ�v;�ן�|6_�\0FD����.����J`&�:Ӄ-�@��2�RzL��n�����]K#��F�j�jyj������5ϱ��SfŚ5�������)d�y/���1��J�E�WmV/,-h��͒�2\0�`�p\0�)���7D�i�\"�qV)�5+���T������\r*k�����g\'�9��}�q#ek�K�h�E�W��t���9�;>V��H\\K�nKX���Xg�2{>ץs�y����	~Y��܎��m}�4��q��8�bF-Xm�_uů�V������m>��BD�,H�3T\\��5���n,(��_|���A.3H������߶���R��\Z%y1p/�M��oR��C���<< ��d-�N��*X G�|����^$LW��H���#�<�d�J���P��������O�T�\n�)��_6�7ؽ\r���b�<����+�<sz�sS|3�@��^�i�;	�vm�)T�����S��A�led��{Ŵ��2��F�X-\\��tj�ښ�<�,#id�S�����3��g\n�?T�piQ&�Z��zT����qo�\\�*2�����M���)O�+-mڇ����5f���<���a�*X�r�ڹ�A\"�[�t����ʹ��B�X}��u�R-���VB;c�W܀}`<8��cN)H�.����S�����#�q������i�X��[.�U�Z��������b�$�xZDa)���x��]���rPq|�٪�?;��ĥ�%��G����i�O~�M��>|�!ˑ]�<�L�do�,�����8�J݄7VO��P�[�Q�W���[t2\\C���W��6��q\ZlX���3\n�{	\'%ej[ѩ��\'�Z跉��~)~l\"So\"a�إ�anmtՍ�۶�\0��.i�s�~�#i��G���>�=\Z\r:��%BxLQI��!\0\r��L�s�>C���|:)�-�JĿ�cP^��#�£�������V��E5��^�euQx��mY]xc	>E�pN��7G7;�B��Z��9K\'�p\r�P�|X^�˅���ӭ�������Q�����G�h2�ik�OΡ*��h:E=��\rFa*�|6���	ӿ�c�/�0�(�������B����s��̒�*�wBD�[�^\\��6��`\\��!\n����l��</𘇚�Z�P��G��6��rS(�|q\"B�y	X]�oڏ��@���`U�_H�F��P�z��`�����:~��>����h!���嗒_I4]�D8f�\Z�ފ�&Y��g�� �([����7���-Z�8�E%&=��|�ޒ�[�����z������n���n��Nj@|Fd?��N �W0�3�TMO�+oN�����S߬����Ә����F�:��X��V��[�RL�e�k��-oB� �9.�2�lS�[L��wa+m�lg��`��\"�?T�H��T����NDboFl���n�5��y.�~��6�1��W���,���ڱY��Qt���؃O�+�!^��p�,�g.!cW���J������;>�`�!8�����a�;�����֓�\"�\"Q��A��1�@�ߎﳧ%���z�����Y�K:���Rw��?߀S���\Z:��$��O:r�$��q��{��r��;6�NN��-	���2�C��\0w�o&2@*A��l7:�8{�7�i����lI��3.��R�3����j,�&u%qe(ūջ�z�*�����,�ſ}(���O?�8�JuvC�:ͷjv)�k�t:���*��z��j��Ӎ��1\n_�3�p����I��z�D-Abm�c�g[���x/)�O\"QYcy����(�X�mXw�_��|�1(�\Z�i����a�m��ȃHXv|\0`su�-����z���!�Z�~l�v�����B�:IT�\"�ȅ����2%5#������{�|�M	�Z�9� \"�,-ƣJ4<�=��Z��04=4�pz.=ˇSJ�\nT�C��Xt\rW�m�v�?H���$�\Z.\"��Ǔ���w0�	�l�ݵ��i�E]^��ʆ��%�X�P%ǜ�g�)�|ˮ���烹�N_Ý\Z�M��������/���\r��I�U8�e?\0@P�W�Χ�S��G��)n�^�#%14d���`ɽjH�܍`+��e9R�b��*ك�UM�B6�=QZ��S?X3t��%�|@�u�.6d���\0Ls�A�#�\\	�ǵU��V�D��$-����cY~?rAo-�.���b�ZV�1}�	��/O�p�F�S�x��F\"$)�>B�%��+�E׾S}��of�����qu� �AZD`�e-˱n�)l��������0�ˊeq����u;G_\"ޜ���_GP�6.�Wƨ���	W,R-��[�c*;�f���� ��]����V��9�Ӿ�eQ&�@tT����)A��S�b�{r\\�\'Ԧ_�S�|\'��/�b��CN���C��% �/${�`;hjM�u~WǼ����&��҉ҹ�^�m����Ҍ�C~��wѼ�mOBn*}<�\\^kد�.�$���Z��`c���T�6�%��C �_Mg�����BWƒ�f~��ع|�i�9�]�U����jo��OpG(��A��0l���Y��e�W�_����:��\'�YĕG���Q��K9�Ԃ��u(ZL�eaCo( �)�	��z�����9�4�amM�`w��dpj>���{�E���gn\n�(]~`~�]\"ы��TZ)�V\'(	�7l�H�bbN���R����Q%��t��k�l�ح�?\ZM��	 �a�?N��`i�}�<�l\nd�;Q.�Qng��n�})�<�1��졽33To6�N�\\�z@�\"�I��`4t��^�ffm��I�Z�+�|��>3�,j�j�y!�H��߫�`g�{6<x�:y�,���}��7�|�x�\\���m,�FL�l(��ֵ&���Ļ���l�]�f�4�J���W��8J�Gf��}�e��/2�(.>~ƒ�=z�w@�t:�B��Я��)�����k��Q�5�}d�b�«H&Ict�_����B���^�Nk�[�����v\"�*�3����M����v���>UÇI0�v�2��*��uu5^ވ!$z;i�T$!ܧ��e�Иp&��4��(��$�^��æ�T��Ny��Hoʱ\0�2��Be\"�b���@+��!x�\'\\k����)��U����ɯ $�ZJ���[�\rJ���e9Q��� bR`��<Z�Ͼ�-p9M���LM�\rF7,ϷJ/�@X��7�F�5�ШP�����׻@��(Q#.H���E^_4�(�\n�+�X$6h��URT\ZF�.Q�*:Zn����o�[��\0�����$o�j3n1��g�%�ߒ�&��*�\rk�0ݺ���F��0b����pI�,]��\0{�$mM�4K�TV�o2�E�y�c�{��B�\'��9|\ruu4�O��Y1�\'rV�ww������\n���(��GAPkN��L��\'��41��:4꿡�<&ƸXǦ]����v_�`�_�͍V�^9ak��ݨ�\\�T+t{_��m ��\"Hd��Q�eNj=?]�)�q���wm���0��+C\0�?�mz��Ѯ�o��l�Ԟ����\\����<#\'\0��6��p�B�\r��}۬ĠtJ��~\Z�&7Y��vy/a�t,���F��*���	��^�(���WNN������)��8Ǻ\nuꇫr����B⋠���Ľ���S2�Nb��xYU�fR���������L�\"G�&��|G%�G&ێ��N��kbD��7��(W�TC8�[^��{\"sS�� 3�n�FhK:(�G�_Z�\r��s[P!h8V�U�d�hKN����L�N�P�Gb5�J�o���i�*�m���<��\r傓�����!�#����I����t&ȣ70����M�[�%��א\0�=�[d���z�G:O;f����Fޕ�NZ\ZD9��[����F\']M��9�	ٸڙ�?��{c[�_���/Ȥ+HZ v%���(GJ�5y�\'\r�ڣ����^L/ �U�⎞���7���-�t���3iFJ��{0�Iw�&~4!�YR)��%��sݥ8����Aw�U\'k3w9�u�(F��a�\0���rAs�g��Z�Uϴ��eg�L4f���΍��M�R��0��\r��/M����;�\Z%V]��<m�ݥb���\ZG\Z��Uұ�]��Ϧ|��e��Bnu֐��n�~#���j��L\nWΛ�Llb�ڤ1�����	?�ZM��{�)�^���J�+?���r{\r�9}m\r��UN����H��V�Y����a����6W�t�l�ǯ�u�]c�C��e\"���T\\?�c\\6s�� �aᶹmЍh�,�Cr���D��|��p�x^�\r<Ȼ͕���v�p���j��\n�h�\n�:.(��uqQ��3�Y5��C�̧�0�;*s��yS�O��&3�2V�ӓ\Zui�@��dS�����j��̫���\n�,�Y�n���(�9�Qݏ\re�?�R\'^�����⚏j�\n]|`Rbp����uwrԻ�DR6[�%}��@?bZvF�����u�<�[7�Cy��z�ԡ<Su��ovƥ~�؞�5H�h\"�_5��^� \"Y�yCv��	��F��by@������k�r�`� D����r��?{�a���eG��(����y��ζn1�̳��f�Q�J>a�Nh�7@�}�=�v�Ιh�Y)J3�=	^Wҫa�,q��o�u7�A��$����b:V/� �\'GX�_�xq����Ul� !��n>m��џK�W�����rS������w�uPhg��m�`�L�C�yw�m;g���hj��/b\r��v��L��g��Ս뫓>��\\�Q�� �c\r����.�T�ӆ�Nj������h�ڻ4&���:x�yz�9fi�й8�O[Q���Fe���fp�>G���b:Z�͗(ך��?����V���{�Qw�a��ڲ�U��㥋�e�UID7��*�ңQ����@���̎2�2ܡ\"�-��dp��H��~z���J�r��睧E��؉mn�[+�2�8Q:ƚ��h�{����3r2w�����J�,ߡoF5�ȴ��Ĺ������|Yj�r�ϗ&*�o��`G+aI����������8�7���߃�;A1�������cL��q��2�dȠ�i���p㯒�b?��\"�)��Z\r��W�l��L>DkV?�J�-2�{�P��3��-�����\n]�k��� É\\S��\'E{�	��F!���0�ojam��9O�j�0/�q=O�Fӣ�u�졻;����`�icu�q}�Q&l_�뼶���J�I\Zn�=�\"���jP}C���m<S`\\���;�����j&SݹE:_5|y�/�Y�P�;�O7W��f#vEw��h\n;˨�H�Z	�ڒ���\\�E�9�`�@}Cx��xҾ�@뇗�}��9�tE���h�k��Y\Z�\\`?;<<` �y���\\)�I�?~���-E�a��\n��\0�9A3|���5*��$�\'���83��&e����v���.^<���+�f�狁��c�榻���_���/f���k�b��jp�kْ�\'�I������~�����B�j������4�	���Ih��?+.y@�yR�\n[��ϧ���	��Ǡq�l�K��M韒`w���9��7Nԣ>u㫣�!K��	��鯋}[?X\"��j}c����ܳ�:o$W}o��&,&�	�K������l�e�S�on^>o[���)�6~�cک~i����/�j|�]�+������\"���I_��G��\Z������7�N�W��q��=I��-�7���g���		��<Z�F����4��&f�l�`��Ҥ/$[½��3�([��>�ά����7?�j��(7GS	��R���B�����ή�)�\n�o8�{����=2D�#R�GY��_���WOu�쯰� �>R�st��g����V��Z���L�5��AD�n����~N���]��h\\�_����w|��W�� �ua�V\'\\�sF���7`\n�ҟ���g�>b��%�D;�J-@SxG{R]�n��$�F��/�C��&7��Ύ,��|&g.���O+����2^;զL�Z���b0��E�=8���?K�\Z{f��o�x�&��ԍ�|��!꡻��w��l��eG�;�ZR�V�������{MiP�^��ܓ�lbB�5ي:�*�#����IYnf��:\'��<r�@��\'?�/a�G�Fפ��7�󲟭6�Wi<x{�l4��r��������|h�6�F�T]�^����]�*�1�\"�Ɲ^ޯ�(��.�\n�e\'�J6�U��>v�������	B���\0���׍m���qu��h^�yC�1����>�?�{)�+�%�kSf�kA���\Znj�k�7p����p��Gn�\"uHIB:�?ا�n�of1�;&���~};_^������_r�v)�a����r[�,��\n:�Ȗ=��3����o�މ��\\0��-7=忻/$u��s ճ\\��vV���w\\�\"�-5���:���,��Z���nE�>Q�&�m\'�T�X��������\Z��ē�x?�첼a�PRj6��^�1�F�i��1r6��BH��`u��d�_Ѣ5��c��!0�p����rD]B���%��D\'��4���&��F�	#rCrə�=�k_����m�\"ބ�8}\'��l��a6��ï��5��j��X��T��Y<>=���U��M�Y@iW7	���ֵh;�S蠍UY\\�������;`�0�Ĩ�z6-��Y��L<������tS+�RU�@R�HD�N-�x���m��E=��h���h�bRB��a�`��yH��(�*!��;���<~H��\\�$%��)�L\0<!���weh�\Z�{�T\"�0�|��V8J�7��h@P�Z�/]��7�����v�\\���Ser�V낇Q�����]���,��j5��hچ6��l���\0��V_\\����\n�L�%�?�S/+=��t�^�>?B}����/��`h()*�Pͬ�,�{]��α�}�fEER+{�ީ��yS�i@���ϯ��6#�}[���(������L��׏\\(��A��{��)��%�\'LKm\\ԉ�M��N5ʣ�i1V+{\0�ZT�&���3����;*�V���z0�O����[(�nK���vJ���װ\'[��\'.�{dU�;1�R�a�Vl%�������<1����J��bt[�$I�64�۳�Ď�@�B�XQ��\Z���r\n����^/X`~�l�i��RCU3U�����x(?D�Uj!�\Z@�3j���L�.�Px�Q�|���@�~���\r>�S�j U�)J�;�(Qa�(>��4\'|�\Z8ߝ�H�y�z<��F����!��Ð�U�U9��\"�����*��T/�4yS�F,����h��Ȇ��Vw˄��\"��������j��[/�\rƢuj}W��Hro}�(��L�殌���:���d5������y*r)�֪ƿ~�n��H5�4�s9�����E\r���7�6�W#��!F$7���f�;)�Ϛ����8���R�Z\\)S�����Lн^/K	��P �E�W󥓏��N�,�\"�J<}��j�I���S��-�[��N1�������(}����KZZ���#�-�9�c�k%������Yj�!���k�[���:ʱRv��z�D�\"70���^S�욖��ЭA���FJ����ûr.�A��ɷF9{���U0T��:��.�Q`�1\Z��^[5a��x#�\'�׮�n\'�����o�O�����8�q[��vO.nwA���ꈰ�������\n�Y�t��~���#\rN�xx��䦚�Զ���c�m$���1�`��N�]����PՑ ��+���o��$ٖ�W	�V�z�Cɳ�j�I�\"�E�L���3Uŭ�w�4�˅x��D���\\�K9e�݆�Twv9b6�l�t�i3�:�ho/��_�gT7�0�n$�\'d�֙�5��gz7j�P��w���F��\'?�7ж�� ���\'a^C���C�h\rrDs���\r}���2cd���BPa���ĥ�G���wo<2\Z����{����Ź�ʐ\"ɴ�Q_���%<*\"�a�����U����\0��e���GOS*��*��?;�@1g3w����lS�P��KQ-D�0wiد�@F@&��\Z��*��,m����=l�t���s��ByD��sٓ�ߔ��!�s[���`�\nwI�omX܏�ag�d��g�9\\5��!�F�Ƹ�C&%�����f�/T&���Q��ay�X�*�2%��):���c������YT���a]��:���ϑ@M�|{u@l����`��\n�՜��8聁�A?��7��\'��:d�]�{�;�\'�٥�-��i���P���ծl��������Na4�q]9��ۖ4�\"�|��l6�\"���6,Kd��-�|�0��V���hQNԬ3�KLΝ��a#j�/�kD�7���N����Mp\"2J�!!�\ZT�|��Ák_u�s,�v���	��k�����9p�=�`$��.x� �+ݬd��&7dM�R&*�Wʒ9c�á��A���',1460653191,NULL),(9,'C6QWXn6eXZ6q','phabricator:celerity:/res/phabricator/bff6884b/rsrc/js/phuix/PHUIXIconVi-UeZHu22VtQbm','raw','JX.install(\'PHUIXIconView\',{members:{_node:null,_icon:null,_color:null,setIcon:function(icon){var\nnode=this.getNode();if(this._icon){JX.DOM.alterClass(node,this._icon,false);}this._icon=icon;JX.DOM.alterClass(node,this._icon,true);return this;},setColor:function(color){var\nnode=this.getNode();if(this._color){JX.DOM.alterClass(node,this._color,false);}this._color=color;JX.DOM.alterClass(node,this._color,true);return this;},getNode:function(){if(!this._node){var\nattrs={className:\'phui-icon-view phui-font-fa\'};this._node=JX.$N(\'span\',attrs);}return this._node;}}});',1460653227,NULL),(10,'4JkVb4QRPhF8','phabricator:celerity:/res/phabricator/d0cd0df6/differential.pkg.js;-kTAjUcZTYeTu','deflate','�}�s�F����+��<�(�����$��N������}[�� aA\0�������@QN�^��\"��3���������?�yٴIQ�����e�/���_����2}YW���\"{�)�$\r��e������ͫr�&�Uֆ��j��?�/�q�7o�4S�}�Λ预���滬h2Io���(���m3;�<�6��K�K��+�}��E�:l��Κ��d�P�U\\D0�6_6���y��l���R3����m]��eZ�Nq�?�\rt\'ʛ���͞Vk�d7�Y\r\rҰg�(\"��N�M���F��yU&�BN\0)Q���M�j첪\n�H]#��9�b�y�߫�ꪯ#TXl7i�f/�?�B�mBs�5��q�S�קқ��X]gco����M�8�;�IL@����\'�8�C\'�i����#�H�v���_\0��	,�����h�΋4�O+�}@�u�i��hΧ��MRU��&o!%�ڡ�=����cRQ��e�/�cXM�@Y��Hw0�Y9�1ؓ\rh���;��}6���2�j��xb<�s�C\n��.g���ǑAvx��y�+1�0\\ $��GqlO����ۥ\r7�iR�ء��:������N�,���!8�۶�W�\'�W�$R��$���/��)������Ye�4�j�ʖm,��]0״fw����D�����{�DE櫪c�<�O�y��N���j��}r���de�K��6k�1:��ͯ�����/&oȀ��r��t�W�;��׋���I��#u�Q�c��L�j���V��kT�P$;�y��I��nTE�k����T���Urq�[Q��S� ��\"�����FO5�C�\n�����4���f�����Hk��d>��J���\\VI�v���y���>�).�6���:�`�q���6p� ��`0/�Ƽ� K���$\r���n\Z��l���Ʃ $�^)\\�4�g���\05���ٴE����n�v���Vs�ɖ1eø�78{<�#̙��\r`Z��yf��@���`Qb֊�ت�u��3��QS��b�q��~ᒙ�-���f�~��\0���c����t��U�����M���yo�-{]�R�h��z[^�S�2������)�,3�Z�v�:#�b���!\0��l.�:�]� ���m�[����8Pe���+}H������AS�Ŷ�c-����_^sK����f���I��X\rE �ef����WEu;���ߒ2-�z�,\\�2y��\Z�*��:&°{�{�}�_����.������I\'C���Ee��3j!d�#�n����!�>��>��3�J��U;\n��{�r\0�f���g~��Ntl��h��b.�w2�����`K���A��s�r��A2l��U�O�:�J������ ���<�x\n-��	+�`�=�p�T�^6$-(�I�7�-��ֆy���A��gi8��V#��fc���r�\"?�o�q�cE���UG#�\Z�����s���ϩ�+���)�Q�p~Yg�5ϱU�C�����.п:s�5{�|�yҤ3$����g/���E_�%0��8��x�5��&c����AEdc���oJ���b��`�\n7YV.�\r�\"op��i`����I*��R�*ʉӂ�~�Y��+Č-L�M�iU5#�Xԃ���^��,�:����<W�\r3vF�eQ]�%�0��߳�7�ּ�*Sn��� RE�����V����%ËDfVT�YL0�� \Z��e�(���������R�\"��i�&�VO�^�=b�B�w��L��K�Y��UY��h1���w�\rM��:�V��j����aq�C=���\n#	���?&5p?HX�7�DE�iU��(3�e³MSX���Z�\Z�\Z�j��N�~5���G\0�9g~L�j�\"�����{x%�#�l%�N��(8��\\Uj� mZ�1�/�\n�U���]�La�7U�d������Y�1�G\\�T��F���.��du�g���dFH\0%Q�|Q$M�iFk�拾�4\\���\'�]\'�L�b���lI�=oa�a���P�n���!�X���s�̭��L��9�*��g,0�T{篛��G9���߀0)�9W�����IQ~�e�E����ڶڄ�B�R�)�R8�m����c�\'�U�w	WY�u؛#/~ITB���+]�7uG����A�U\n&}[�o-c�lF`�4yzk�)4\rs�[�$�3<`��2HM�Qڡ�q�XN�����!��q�\r#�����e�^�-�zࣜݑ��Fg�Y�\\�����A_�%`�n�B�F?�h�Fv4��<q8r�Rɡ�FV�����\nػMF��U˼��:�꼽��_O��`Ŭ&�%r�r�3\r`��Xru�ϙ�﨧�� vQ���J5t�j�xL8��\0Ֆ������Qy�x~}qǘ��Z;�P��ҵ���_OO������>kgBf��Sa˗�:���$I� s��U����&�:C�&�ʯxw�P��$}�I������/i\\@���.�Ǎ�wr��)m���I�w�����v\Z�>\'p�|(\'�-��P����,?�8�D�͒��������\0�V\rJ��kE z�(%�Fs`�	��	�\"��o}d�c�!}<�Yh�IR�{|�7�{�a�r�ʄu\r9��ׇ�3���$XO�VOx�1�ũ4�f��1)�Y���?N�u�C>�p����f<Dl�D�oN?T9��(0�Di;���Eڐڣ��Qtd�b_g���=X�jͱ�#9�N���궔�(�h���:)�2���{P8�.}�\'`5ĝ�b���u�B��uY\0��̀a�}Kc-�R�;r���8���s��#ɜ!�s�r6��B[`�>5;6���c�����jX��N\r(H����7g����l��c�$��3Z~}���y[��S?��d�\Z4��.0���*��X�=3�+D�����\\�󫲪a�~���zO]{F�7��NV�\r��)P�5s�c�#��^���y�5���&+`ˏ�=�x�9m�,��wU�]��ۖ�GF�.�YQ4���ܖRNJ�F�\ZE�oG�Ue}�o�8ª�o��ᆾ��<t<�&��-����[�#,�=���|�g>�����zvӴt��8mj�U�\0<��o�Ԕ>f�Qd���\0K���͛�l9�o�Y�S�4�U�)^\'��v��e>h�qY^X�w��y~��1Tn�׀^�dtv\Z����1#TlLf��[��E\\��]Mg��d�N��\\�j�M��`kq�=��M����	�w_����n61d��ϩ�͆\'��,v��N���(��]�-�bZf�ڷ�%��׫�Bj�v�����)��pS{��!Z��7���[�����U�]�.�(�����8���T��B��N��駈���T�ߐ�#ěn�m�s���._RK��I�-��9f㎮j) �Fz��lѡ�&�MZ������Dq���WP`Jn����\Z�XCs��1B�ՙ��\Z�0����m��\n}�\n:�9D�&F��Y��SK���@����yI:�d�k��P˺����ǉ�:��z�0�F2���a\'!�Q4dʓ������D��ʫ\'r�Xo��ՇE-��2[��+�XF@S�mB��H8�pz��/P�Y��y6�I�Y�o��T���b�^����§��nZb�G1{,[D���w��FSy{m?<(9�j�XF�����7�oH��۵���(0�H��i�NoH�{�_/~MO�zs��~�_>��.P�(U���LAt���>W�.�L�Y\r٪3T���(���5�A$0`ק�T�&�����B\0� ���|���`�\ra��m�\"�<<8ty�8�w���zO��Z;L�}���`Pة�r�ܱm\r� `�\"�*�+`��+��M���f=�-�`NT�\\�b~�*�i�������\Zr㇗EJ���zl/��8g�`_Q��m�>�T�)�]�]��Თ���!%k���Տb����u���=�cW;��H��\Z�Q_z(�e�b��#�4�����6�?[�������ᨧ��Q�������f	u�.�l��w Ɂ�\n�Ԭ���\nU1h�THTf�	a�\n��*T�� 6��/�$�F�Ǥ�HL@��$#Ծ�Xλ�fS$xΎ���a�V&5�S�[~�Œν~9��D9���r9���1?d�Y��c#\r�ߜ�N�5����%�2\nm�LN��B2\rb�\Z�r\07��N���<M����e/{w�Of,Ck�o�\roܵ�[kv�3���D�u���������}Ow��WYp�Hω�!�\r�=eL�U��\Zi@�qՙ���U^�����:p	���������{�n�*���۠����wL\'\'yND����1�{�B�\Zč�	̂Mi,6N4�䜀�=ľ�b�vg��)T��G��e�dA��L0���U�����6�EW���!�A�l��V�m� �q͖ח�\'5�+4�3A��f��C������^H�j���1�%���K����nA��d�Sc��@�W�\Zs�,\"W�ڧ[#~	|L��֎�\ry#i��{�ܷ�*���K9�i�dS�K<J_�_�٦>KZ�;G�9�IΑ�C7���G-�`�,i�F�����~W	V�yL�����ڀ^t����H�j��$H��Lfg�p�-�����778�6�B{B��2�M���mW�t�8/�\\�Wl��Z��ij��n逫8�(q�Z�V:�A�T�����W�VQ�d�JFӮ Ĭ�i�Oc��G<��i<qO��7EՒ1�x�z�XȖ);�)H^i6Q�]�Z`�`O�P�1�T<���y|L���.�yz!��c|�V0���8S�!V�CJG̩�x6��\'C^刃��;9\"�ǹ��+��%3���Q����W;��7���i�i3S8��]��Gb�\"�{X��>�ʕTB�c��3\"\"& �y,3@��Ӽm�.�W�\"lW���(yH���*�z�?��J��@t\n�\'S\n�gJ��s��R�O��	!��<��J��J�^�p�ݠ\n Ed=FP�W&(���x����n�Ͷ�����lǾ-NO�\Z��e�d�%-�):\r�:a�H�&��.kϷm�7?�IJ&?�˼��%Bw�����u��d�۶\'�n�Glu|��;$��cUҶ?K��j84��w�5�nH�3�(xo�jWC��㫇�/���)L!�Mn�z��5�?�H��H�����q��r#��N8\'����sX���H��vʡ�j]�D�R�\0�$~8�4���1�Mn]a;��OI,����ف&����*�|Ê�F�waeG.ԩ\\o;������[s%���2��}\Zf�q�S�{���:>��)Y{q1y��\0�q��!K��߇������,��0��\Z⛪���P�8P_}ʖ���~Xw0Z��)���y6�\0��0M25O�����Q����9��ף4����#����J8$FJB�:�\"�Mt)��i�=�~jǞ�Qvb��$\"~L�$ͫ>o��e	✠t��P�~�6��c����\r\\�;��a�<��\\H��Y&d����i�ul9�Ү���lJF�L�[�K���e\'o�N�#yꗢT/; F�(xx����W���=g�A1�5y|����V ?���3�̖�Hh���3y��b�q�Z�8RǺ�$�u����U#wE:�UjRP�n6���jʭn>ő��x�y�%�;�FIg���<�H*���Љ\'�7��B�>�Se�ovMjuъ�U�\"�Q͸�C69���ƜaK�[9zײ�h\ZD6\rL���JSd�.�����L�T�&��	T�,�CΔ�]���K�~�\\�F �ʵ��4��s~}1�t�e_�;7~��Ur9���E����TþS�齈���z;G>l	�0��1ӿ�<�̸�|EEr	,D�����w�$�\\3�\\�=���qOf;.\"5������w+l!c�[�{�=��ź�]�T��L\rӦ�x�s�N��MXtV��0���\'c������:���D�r���R�r[7UO���D3�|��rq�9n�&#+-�\\�]��6�݋��T�6t��2ʲIsXl\n\0ɜsY�w�\Z���o�jy݌y�<d��޴z��.�3�K�����&]�^�������2�K�j�xH����!�~�g��H��X���(�J-8yL��0�n�K����\"D���R�5c��R^<<�x,��+�a��21ȟH�{�4�xY:E��z||$�~(��4���HݎN�-�՟}�i����y2GP�{J=��Ǉł$��sh�ޅ�]���I�8���*Ri��aoAr������\\�)W�$az�ƃ���F��h�O/x�k�l��:���Bs����;KZ�����m����\r���	��ָ�d���8���j\n��Ҫ�S��V�Q��G�8�p	c]��Ǫ�Q�\"ܜ����:wٸ�}v1�i5\Z�?���W5	�O�_1r\ZF��dy��5�0@]�i?�P��թ��d�ױ᨝0�Bd��	mԧ���rЭ �½cr%��A��ͿӮ�����aO�ϒm�.nP�9�[��-���[�c����w�hS8�q��.��/�nי�71�V&�I�GV�1,���� �w�_ޮ��]n�q�$��@磶\Z�6?��0�c�ר�=��Ogt���	�p	��][�)��g599����!RЍ�\r0b�rp����۝<���,���:�{����l�F�{:1��^�V/�u6\"�oT�Fr��y��W\\��~A��\r�wi\r]zՒM=�G٧\r4N��)�y�)���8Y�� �%ǈ5\\��ᨫ�\Z��s�2C`��w��;1�V��&��q����+XOuNY��h��,:��=7�07����u�M	�5�6�m�^�����-�a��G\'䤃�����JP�S����:�&q��i��9�]�W�Ļ�ӿp��-݉���Q���\Zݐ��3j7�	��l�5,�	F�&��|��QY���6޾�)�W�i��U@��J�N�I}�]p�\"�ޗ��$����!4t�z;o��UX��8��h�16�L��e��N#ʖ)�3�W�0���c3�ԯ�ep?�%�}h�>����������ᱭ��b�à�ݐ����U�3ϝϋb�����p�\rZ\n��܅E�]�JFmEM1��ԹK�~���a�Kg>p��ޣ�-�\'��濫\0t^�K���K����:�[u�EU>]�$��T��|\\BdKw�8�B�.��&���aߑ��5�X��c<�W!t�&4�zqG�`yo6b\0:�\"�!i�� gIS�}Ԭk������jT��ߎ�ғ4,�������\Z����\ZM�8ȋ���X%OLflc�f�ۍ*�6_�q���jA<��0�ܶ -Gے-c�s��%�H �v�:fy��m��\Z��7\\g|D�C=cQ��1�?iH�\Zy\"}9``�����f�j�i���P��i�(�Gq�顺��R-�\r*�}o���,2��}��NW�(8	V�8mV��y��ף=KݛR����d���O��!�x�5y\\1ۙ��\")����xh�\0$·�1��\Z\0�9}4^x���!h��>�=jn��]�����	XX3У�@�>�upi��G�v���0R�k��\"��H{Jp��q͹4�=DvI`xJyE`��p�C1(����>T��bt`CT=�ff눚����.�+�l�\Z����Z�U\"ȹ��-6Е~}U#s�.µ��9Yw#�Q�;k�FY����aW|,��d�Ȩ�s��L)Z/���;�����)<���yO�)ǽ]ˣ���Kt\Z��G�3G<R���(��,���L��h$�!A�3!��O#���1qg=z��9�uI<�\Z�\\a��,9�oΉ8�T��d��h7�b��G��t����]���S|7�1�S�Gطn�bJ��=��HwOC����!��ki�ɴ�k�&����C1�/z��a�s0)�b]����s�H��	�6��b��aG��L�2�u�W��M�३�ɲ����Ȱ��:Q�W�w�u�����e,g�U=ŋV���1�¯�t�h@��b����:����{�-��SH`�ع8�qhW��:\08��[�56��Q\Z��\ZM�X��B�\\�}L_�9�_��bV��M�����,�O bP|Ԩ�+����%*:@�9&r�u����OP\n�U��\0��Ofj<Q��K-�(`����]�_/+�}���g�㚻-5�+��i���[���(���yB��a��ӈu���X�ju�܎Դ��#\'G0����R��1|F�<��D���x��kV�ޱ\\��!�T�Q����o�@��:����f�l�%�eҥ�~wsY�7d�h����A���j4BA|�\0f�\'�D�!v�\"b�̅:3�!��\0���i�/�%V.|��f�ϟ����/��//D���b;�_��6�I���A8��D�>�}�h�p$A�cz=R��(���|<�g�h�\n���{���>�ς�q<���u�Q��{\r�0X���.�ƌ��9�s�£�IuvC�L0x��j���p����䎻�E�\Z�����cS�eV⪦��v��m=;K��P�)۠\0Pk_��q�{�:�ɏ3���%�f��ʫ���8�B�kQ�p��1�}�&�;jQ���G��T�IdVP�*ڔ+j��]�z ��kG�����\'r�[@���k���pj~\n�9nQ�z���Փ��ݞ�?�&�\Z��|ð�+��0��N�K��E�ϦM�y\Z�8�����-�^��x���������x�~B���-���ފP��7��u��	�\r�\'�T��[e|x)WM���1_(x��M��p�kZ���rP�����}4�U���&�A���&S��Q��D<��8`�N��@�f�0�o	p��1�59�Ah�8_�ԙv�0BY����)|x��X�1�	����*Չ{��v�\Zl�f6�S�����,��\Z�[��|��rM��=�o�\\��\"��o�\\����i��^F|�7�T�؋�w�뺈\Z-���P.���	`z�U�KS��-���RB|ɰ�HV;�jk&i��c�NDj2�EE|�ͺ��6ϼ��F�#�!imcC�����{�f�5������3���2����MN͌�d#��˴��pCta<9�~�ީ5-��qn����r�xl�,S^I\\��^\Z�~�w��Զ!^\0��&ɆB�����oHY�R���,��;�T�@�[�bj�V�)����s��D\'�>�I[��Ɠj��D��ꍾ���u�Y�t�C��TO\Z��\'���/	\\\\m�������~�T�~l����ט�??EΥ�6�Em�eC���/�-�a�b��{MS�U�TC58d$s��YC���c�4�T�Ȋ�:�n�7\0�R�i��7y{�p�7q@����n���O�|�uX���I�1X�K�Y7�O iv�%}������8�~0*��ҷwe���uo9�\r�j�\\p���!-����My���׳�T	{����$0�JGFs�	�oL�o4u$�����2n͵�7�:�P�|����v%i-^�\0���y��o�q�7�e�td�WGb��̷�>�ftc��c��*A�h��>+�+һ �ý��Z_>�媐��\'�e��]R̜�P�Yv4��97ˣb,�Cő����V�3��	7�K�^���7���)�7,#U����V(_P[&P��Z+]U�6)���$͔Uq|]��ms�G�f�!�ζ҂(�<�x����\\�ď�ן�>u�7o޳��#��{�\Z�B]W	��Y���㶆1��$a?�r�AⲦ��%�>�e@OهB�Sv��Z&KNQ5���\Z��R�{D*���(\\��� jW�>)�\ZW5�)9��ȡ�l1��q��Tf:�>����`�_Q��]9S~���dv��\n����;���X�(nHG�8�S�h����a�ڛ�i�*o8�jt���!�i�E@�ʨ��\".K����1���!v;e�E��pa�6�;Q~��y@�R|���u�߀#�-�\"��@�����;����q6��o��-p�T�4iŒ��e����Y�zfx(@\r�-���\n�Y��?��m\\�.��`����9˓br��\r�ƻˮ\n��-�������Þ��M���	Mf@~�\0 ?|�\n��}�\r����1��k�AR���B����C�{$� 6�	��ى��?�̣Q\nܣ@ӌ�\n�[���J4˒�^� u��ĵu(�\ru��P��R/�fJJ�<a{�\rn��Jge��|.6^�|(f�F�P9����?_��2�@�%�zeK>\'����~r�/ ��rl�LI���4�S��I�v�T��ç �K�H_x3&We�\0nL0{�8�!�4/���DN~UrmQ��nIGdM��C���L����d�����ҳ�ZY��X)��z!=>Lr\'���C�<m�ڇ��0��%�rz�2�j�Qa:t\'��\\t:x�qk7�+z#l�p�a�d|��l������8\rL{@���u�J@ �F�e�iR�Ɵ�7:�����f ��y�^�投�&��>3c{�d���vC{hI��B�&�U@R\rK%��$����!�M0�7P������,g�:3��&�W������\\U�{Չ�1��u����2k��z�`�	Tk����SUY\"wj<�z0J,z1>���f[{���P����(��k�j8� U�<�t=�����H��}R����T��߂R1�%��U����	���b]�� �|�)�\Z�B����|!G	���\'�\n�T�E�еT~A����z��\\����f�)_�(ߕ���^!�k��ю?�?Tɞ���R3��yQ�^h<��0/�q�8�ww?q)��_����_�V�G8�rϊ�T���\'���|�2wi���}2I�9�(fi�oaj�z�H0�[�pw����|�g���~��tye|k��n��	�0�z��6}� ت�#S��:r+)\r��;Ru`�a����]�[(6S���3�f|�j��<jaP#PN��ht����9���O�ۤ��>�g�$/�[]9	�\n,�E��8>�tHʡG�)u��n���a�4��P���yQ��A:tG4�ҽMVh��{��07��A8��e�.��HFz?�H�BK{~�]�QҮn��;)��VD���̿;\rd��S���2͹�)���>�ƑZ1���x��Xmq2O�S��٣ɂH4�����P�rB��-i��N������m��C�i��m�/s!� <-��\n�5�0|hH\\_�̊֡�+�;tߣ����N�2`���ے�������*esD�>D�d�҄����s�b�/Pr��>-]��$Oi0�\0�{5��.�14�(�t��d��wI���=�{4���w�><Y��yz�̋T\'�z��6��pr�G���\\��9��:_��?����s+>�ò�)��|�b�F�Sj�w�L�ͷw$e��.�Pe�`(/\'\0��Ǹ�~�n��E���	��*N��М�������h�4���@4k��ӷ�~fb��s欜A���vco[����6����xD�Cm��~���>��h[��ΩA���q{������\'߷�a��락ն�����K⽾�a��S`}��z����_gw�7,��E�N��`�G\0O��q���ū۴��Tj����6=>�ޣMC�\\b�%=��!\r��O�褫���5�c4��j�J���dk� ��uŻr���pzC���[ q�35�E��Ӈ���=��K�׆�]�*�l��/��qq���W*c%I�G�Y�I��odV�1L<eꍳ��W��������$����9���++͎��9W�PA�[.��i��5��Q*S�X�\"K�_f`:�>�5C�om(���8���\0н�2�G�D�+W��5\'i���_�SO侢5ذC\Z�D�C}�����:`�˶�Ϯ��L(�Y�Ʌ���dnLuq��؈rB�;i���\'��`��b��G#�O�Z3d)�����;�E���=~|��T�>����N�uBm9�Z\\�游v���h�|��߹s,�(��r8J4Wt�o��C�\n\n���G}7��+�/��\r\r$�4�rܩ|ȵ׌;[�P̼ipr�G��P���z߀��)�O�A�B�6P�\rI*8��o�`\n�r�FA�,��63�α�ҧ7���f��s�6\'�t�^\'W7�t�����k���~M�{v��\'\n\0������w�vI���Aag��u���j���g\0��U/,��y�*�ޘ�Ф�p��j��4lK������v����b=�@Q�k�&�Ļ��<v˒���4��ʀ��`^��^�LZ�V�o���bR T��r<}o3G`�ZIs��UKP�`�Q��t\n\rTxQJ��d��_���}�V� ���?fr���;o�j/��ŃWgɦ�>R��TM�ev��5��R���Ք7����kT�N�=���Me�}���S�%?�QN����*D뱘y�ҩG�����b�\n�e�bS�����Ⱦd�P�Π��2Ep]c�\\�P�߸e^��H�4-�����?9bj�%�(,K�w_�\\&4.�YkS�D�fz~�5����D*�7�����j�0�R�������M��cz36�w��ZA.�����t\\�K�3;P��W��<g��3�U{�:*\r�u�֮�oA����	�tŲ�om��i�y�3�y�gv�D���)2�7<v;%���=�.�ٷՖ�	���5�����TTp�2�^�a\"t���cVͯJ���G�n\"v��{�M���/{�ц�ݭ��A���Ϥ��*�6����4�U�2+�-���U�\'Z8	���c�3����\r-{�U��\"���o�G�����>���#��^b���\0',1460653227,NULL);
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
INSERT INTO `cache_markupcache` VALUES (1,'fo7P4TuH2YZr:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-note\"><span class=\"remarkup-note-word\">NOTE:</span> Any user who can browse to this install&#039;s login page will be able to register a Phabricator account. To restrict who can register an account, configure 1Z.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:103:\"<a href=\"/config/edit/auth.email-domains/\" class=\"remarkup-link\" target=\"_blank\">auth.email-domains</a>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabtest\"}',1460653245,1460653245),(2,'rVwVLSGl.Y9K:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-warning\">Examine the table below for information on how password hashes will be stored in the database.</div>\n\n\n\n<div class=\"remarkup-note\">You can select a minimum password length by setting 1Z in configuration.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:68:\"<tt class=\"remarkup-monospaced\">account.minimum-password-length</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabtest\"}',1460653245,1460653245),(3,'nHato9WQIj8d:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:3488:\"<p>When a user types their LDAP username and password into Phabricator, Phabricator can either bind to LDAP with those credentials directly (which is simpler, but not as powerful) or bind to LDAP with anonymous credentials, then search for record matching the supplied credentials (which is more complicated, but more powerful).</p>\n\n<p>For many installs, direct binding is sufficient. However, you may want to search first if:</p>\n\n<ul class=\"remarkup-list\">\n<li class=\"remarkup-list-item\">You want users to be able to login with either their username     or their email address.</li>\n<li class=\"remarkup-list-item\">The login/username is not part of the distinguished name in     your LDAP records.</li>\n<li class=\"remarkup-list-item\">You want to restrict logins to a subset of users (like only     those in certain departments).</li>\n<li class=\"remarkup-list-item\">Your LDAP server is configured in some other way that prevents     direct binding from working correctly.</li>\n</ul>\n\n<p><strong>To bind directly</strong>, enter the LDAP attribute corresponding to the login name into the <strong>Search Attributes</strong> box below. Often, this is something like 1Z or 2Z. This is the simplest configuration, but will only work if the username is part of the distinguished name, and won&#039;t let you apply complex restrictions to logins.</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Direct Binding</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p><strong>To search first</strong>, provide an anonymous username and password below (or check the <strong>Always Search</strong> checkbox), then enter one or more search queries into this field, one per line. After binding, these queries will be used to identify the record associated with the login name the user typed.</p>\n\n<p>Searches will be tried in order until a matching record is found. Each query can be a simple attribute name (like 3Z or 4Z), which will search for a matching record, or it can be a complex query that uses the string 5Z to represent the login name.</p>\n\n<p>A common simple configuration is just an attribute name, like 6Z, which will work the same way direct binding works:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Example</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p>A slightly more complex configuration might let the user login with either their login name or email address:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Match Several Attributes</div><pre class=\"remarkup-code\">mail\nsn</pre></div>\n\n<p>If your LDAP directory is more complex, or you want to perform sophisticated filtering, you can use more complex queries. Depending on your directory structure, this example might allow users to login with either their email address or username, but only if they&#039;re in specific departments:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Complex Example</div><pre class=\"remarkup-code\">(&amp;(mail=${login})(|(departmentNumber=1)(departmentNumber=2)))\n(&amp;(sn=${login})(|(departmentNumber=1)(departmentNumber=2)))</pre></div>\n\n<p>All of the attribute names used here are just examples: your LDAP server may use different attribute names.</p>\";}s:7:\"storage\";a:6:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"2Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:40:\"<tt class=\"remarkup-monospaced\">uid</tt>\";}s:3:\"3Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"4Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:41:\"<tt class=\"remarkup-monospaced\">mail</tt>\";}s:3:\"5Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:45:\"<tt class=\"remarkup-monospaced\">${login}</tt>\";}s:3:\"6Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabtest\"}',1460653260,1460653260),(4,'.4EOg8Xw88WD:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:189:\"<p>To search for an LDAP record before authenticating, either check the <strong>Always Search</strong> checkbox or enter an anonymous username and password to use to perform the search.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabtest\"}',1460653260,1460653260),(5,'2SwALNO6Yg70:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:315:\"<p>Optionally, specify a username attribute to use to prefill usernames when registering a new account. This is purely cosmetic and does not affect the login process, but you can configure it to make sure users get the same default username as their LDAP username, so usernames remain consistent across systems.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabtest\"}',1460653260,1460653260),(6,'H_JFmx5tn1ir:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:253:\"<p>Optionally, specify one or more comma-separated attributes to use to prefill the &quot;Real Name&quot; field when registering a new account. This is purely cosmetic and does not affect the login process, but can make registration a little easier.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabtest\"}',1460653260,1460653260);
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
  KEY `key_space` (`spacePHID`),
  KEY `key_epoch` (`epoch`),
  KEY `key_author` (`authorPHID`,`epoch`)
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
INSERT INTO `daemon_log` VALUES (1,'PhabricatorRepositoryPullLocalDaemon','phabtest',30,'[]','[]',1460653175,1460653284,'exit','phd','30:rsfgtywxs'),(2,'PhabricatorTriggerDaemon','phabtest',30,'[]','[]',1460653175,1460653284,'exit','phd','30:4ebumpa26'),(3,'PhabricatorTaskmasterDaemon','phabtest',30,'[]','[]',1460653175,1460653284,'exit','phd','30:vnuwfs6q4'),(4,'PhabricatorTaskmasterDaemon','phabtest',30,'[]','[]',1460653252,1460653269,'exit','phd','30:vlu3bw2we');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_logevent`
--

LOCK TABLES `daemon_logevent` WRITE;
/*!40000 ALTER TABLE `daemon_logevent` DISABLE KEYS */;
INSERT INTO `daemon_logevent` VALUES (1,1,'INIT','Starting process.',1460653175),(2,2,'INIT','Starting process.',1460653175),(3,3,'INIT','Starting process.',1460653175),(4,3,'STDE','[2016-04-14 17:00:50] EXCEPTION: (PhutilProxyException) Permanent failure while executing Task ID 6. {>} (PhabricatorWorkerPermanentFailureException) Task has no transaction PHIDs! at [<phabricator>/src/applications/transactions/worker/PhabricatorApplicationTransactionPublishWorker.php:87]\narcanist(), phabricator(), phutil()\n  #0 <#2> PhabricatorApplicationTransactionPublishWorker::loadTransactions(PhabricatorAuthProviderConfig) called at [<phabricator>/src/applications/transactions/worker/PhabricatorApplicationTransactionPublishWorker.php:19]\n  #1 <#2> PhabricatorApplicationTransactionPublishWorker::doWork() called at [<phabricator>/src/infrastructure/daemon/workers/PhabricatorWorker.php:122]\n  #2 <#2> PhabricatorWorker::executeTask() called at [<phabricator>/src/infrastructure/daemon/workers/storage/PhabricatorWorkerActiveTask.php:171]\n  #3 <#2> PhabricatorWorkerActiveTask::executeTask() called at [<phabricator>/src/infrastructure/daemon/workers/PhabricatorTaskmasterDaemon.php:22]\n  #4 PhabricatorTaskmasterDaemon::run() called at [<phutil>/src/daemon/PhutilDaemon.php:183]\n  #5 PhutilDaemon::execute() called at [<phutil>/scripts/daemon/exec/exec_daemon.php:125]',1460653250),(5,3,'FAIL','Process exited with error 255',1460653250),(6,3,'WAIT','Waiting to restart process.',1460653250),(7,4,'INIT','Starting process.',1460653253),(8,3,'INIT','Starting process.',1460653255),(9,4,'DONE','Process exited normally.',1460653269),(10,1,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1460653284),(11,2,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1460653284),(12,3,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1460653284),(13,1,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1460653284),(14,2,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1460653284),(15,3,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1460653284),(16,3,'DONE','Process exited normally.',1460653284),(17,1,'DONE','Process exited normally.',1460653284),(18,2,'DONE','Process exited normally.',1460653284);
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
INSERT INTO `patch_status` VALUES ('phabricator:000.project.sql',1453226118,NULL),('phabricator:0000.legacy.sql',1453226118,NULL),('phabricator:001.maniphest_projects.sql',1453226118,NULL),('phabricator:002.oauth.sql',1453226118,NULL),('phabricator:003.more_oauth.sql',1453226118,NULL),('phabricator:004.daemonrepos.sql',1453226118,NULL),('phabricator:005.workers.sql',1453226118,NULL),('phabricator:006.repository.sql',1453226118,NULL),('phabricator:007.daemonlog.sql',1453226118,NULL),('phabricator:008.repoopt.sql',1453226118,NULL),('phabricator:009.repo_summary.sql',1453226118,NULL),('phabricator:010.herald.sql',1453226118,NULL),('phabricator:011.badcommit.sql',1453226118,NULL),('phabricator:012.dropphidtype.sql',1453226118,NULL),('phabricator:013.commitdetail.sql',1453226118,NULL),('phabricator:014.shortcuts.sql',1453226118,NULL),('phabricator:015.preferences.sql',1453226118,NULL),('phabricator:016.userrealnameindex.sql',1453226118,NULL),('phabricator:017.sessionkeys.sql',1453226118,NULL),('phabricator:018.owners.sql',1453226118,NULL),('phabricator:019.arcprojects.sql',1453226118,NULL),('phabricator:020.pathcapital.sql',1453226118,NULL),('phabricator:021.xhpastview.sql',1453226118,NULL),('phabricator:022.differentialcommit.sql',1453226118,NULL),('phabricator:023.dxkeys.sql',1453226118,NULL),('phabricator:024.mlistkeys.sql',1453226118,NULL),('phabricator:025.commentopt.sql',1453226118,NULL),('phabricator:026.diffpropkey.sql',1453226118,NULL),('phabricator:027.metamtakeys.sql',1453226118,NULL),('phabricator:028.systemagent.sql',1453226118,NULL),('phabricator:029.cursors.sql',1453226118,NULL),('phabricator:030.imagemacro.sql',1453226118,NULL),('phabricator:031.workerrace.sql',1453226118,NULL),('phabricator:032.viewtime.sql',1453226118,NULL),('phabricator:033.privtest.sql',1453226118,NULL),('phabricator:034.savedheader.sql',1453226118,NULL),('phabricator:035.proxyimage.sql',1453226118,NULL),('phabricator:036.mailkey.sql',1453226119,NULL),('phabricator:037.setuptest.sql',1453226119,NULL),('phabricator:038.admin.sql',1453226119,NULL),('phabricator:039.userlog.sql',1453226119,NULL),('phabricator:040.transform.sql',1453226119,NULL),('phabricator:041.heraldrepetition.sql',1453226119,NULL),('phabricator:042.commentmetadata.sql',1453226119,NULL),('phabricator:043.pastebin.sql',1453226119,NULL),('phabricator:044.countdown.sql',1453226119,NULL),('phabricator:045.timezone.sql',1453226119,NULL),('phabricator:046.conduittoken.sql',1453226119,NULL),('phabricator:047.projectstatus.sql',1453226119,NULL),('phabricator:048.relationshipkeys.sql',1453226119,NULL),('phabricator:049.projectowner.sql',1453226119,NULL),('phabricator:050.taskdenormal.sql',1453226119,NULL),('phabricator:051.projectfilter.sql',1453226119,NULL),('phabricator:052.pastelanguage.sql',1453226119,NULL),('phabricator:053.feed.sql',1453226119,NULL),('phabricator:054.subscribers.sql',1453226119,NULL),('phabricator:055.add_author_to_files.sql',1453226119,NULL),('phabricator:056.slowvote.sql',1453226119,NULL),('phabricator:057.parsecache.sql',1453226119,NULL),('phabricator:058.missingkeys.sql',1453226119,NULL),('phabricator:059.engines.php',1453226120,NULL),('phabricator:060.phriction.sql',1453226120,NULL),('phabricator:061.phrictioncontent.sql',1453226120,NULL),('phabricator:062.phrictionmenu.sql',1453226120,NULL),('phabricator:063.pasteforks.sql',1453226120,NULL),('phabricator:064.subprojects.sql',1453226120,NULL),('phabricator:065.sshkeys.sql',1453226120,NULL),('phabricator:066.phrictioncontent.sql',1453226120,NULL),('phabricator:067.preferences.sql',1453226120,NULL),('phabricator:068.maniphestauxiliarystorage.sql',1453226120,NULL),('phabricator:069.heraldxscript.sql',1453226120,NULL),('phabricator:070.differentialaux.sql',1453226120,NULL),('phabricator:071.contentsource.sql',1453226120,NULL),('phabricator:072.blamerevert.sql',1453226120,NULL),('phabricator:073.reposymbols.sql',1453226120,NULL),('phabricator:074.affectedpath.sql',1453226120,NULL),('phabricator:075.revisionhash.sql',1453226120,NULL),('phabricator:076.indexedlanguages.sql',1453226120,NULL),('phabricator:077.originalemail.sql',1453226120,NULL),('phabricator:078.nametoken.sql',1453226120,NULL),('phabricator:079.nametokenindex.php',1453226120,NULL),('phabricator:080.filekeys.sql',1453226120,NULL),('phabricator:081.filekeys.php',1453226120,NULL),('phabricator:082.xactionkey.sql',1453226120,NULL),('phabricator:083.dxviewtime.sql',1453226120,NULL),('phabricator:084.pasteauthorkey.sql',1453226120,NULL),('phabricator:085.packagecommitrelationship.sql',1453226120,NULL),('phabricator:086.formeraffil.sql',1453226120,NULL),('phabricator:087.phrictiondelete.sql',1453226120,NULL),('phabricator:088.audit.sql',1453226120,NULL),('phabricator:089.projectwiki.sql',1453226120,NULL),('phabricator:090.forceuniqueprojectnames.php',1453226120,NULL),('phabricator:091.uniqueslugkey.sql',1453226120,NULL),('phabricator:092.dropgithubnotification.sql',1453226120,NULL),('phabricator:093.gitremotes.php',1453226120,NULL),('phabricator:094.phrictioncolumn.sql',1453226120,NULL),('phabricator:095.directory.sql',1453226120,NULL),('phabricator:096.filename.sql',1453226120,NULL),('phabricator:097.heraldruletypes.sql',1453226120,NULL),('phabricator:098.heraldruletypemigration.php',1453226120,NULL),('phabricator:099.drydock.sql',1453226120,NULL),('phabricator:100.projectxaction.sql',1453226120,NULL),('phabricator:101.heraldruleapplied.sql',1453226120,NULL),('phabricator:102.heraldcleanup.php',1453226120,NULL),('phabricator:103.heraldedithistory.sql',1453226120,NULL),('phabricator:104.searchkey.sql',1453226120,NULL),('phabricator:105.mimetype.sql',1453226120,NULL),('phabricator:106.chatlog.sql',1453226120,NULL),('phabricator:107.oauthserver.sql',1453226120,NULL),('phabricator:108.oauthscope.sql',1453226120,NULL),('phabricator:109.oauthclientphidkey.sql',1453226120,NULL),('phabricator:110.commitaudit.sql',1453226121,NULL),('phabricator:111.commitauditmigration.php',1453226121,NULL),('phabricator:112.oauthaccesscoderedirecturi.sql',1453226121,NULL),('phabricator:113.lastreviewer.sql',1453226121,NULL),('phabricator:114.auditrequest.sql',1453226121,NULL),('phabricator:115.prepareutf8.sql',1453226121,NULL),('phabricator:116.utf8-backup-first-expect-wait.sql',1453226122,NULL),('phabricator:117.repositorydescription.php',1453226122,NULL),('phabricator:118.auditinline.sql',1453226122,NULL),('phabricator:119.filehash.sql',1453226123,NULL),('phabricator:120.noop.sql',1453226123,NULL),('phabricator:121.drydocklog.sql',1453226123,NULL),('phabricator:122.flag.sql',1453226123,NULL),('phabricator:123.heraldrulelog.sql',1453226123,NULL),('phabricator:124.subpriority.sql',1453226123,NULL),('phabricator:125.ipv6.sql',1453226123,NULL),('phabricator:126.edges.sql',1453226123,NULL),('phabricator:127.userkeybody.sql',1453226123,NULL),('phabricator:128.phabricatorcom.sql',1453226123,NULL),('phabricator:129.savedquery.sql',1453226123,NULL),('phabricator:130.denormalrevisionquery.sql',1453226123,NULL),('phabricator:131.migraterevisionquery.php',1453226123,NULL),('phabricator:132.phame.sql',1453226123,NULL),('phabricator:133.imagemacro.sql',1453226123,NULL),('phabricator:134.emptysearch.sql',1453226123,NULL),('phabricator:135.datecommitted.sql',1453226123,NULL),('phabricator:136.sex.sql',1453226123,NULL),('phabricator:137.auditmetadata.sql',1453226123,NULL),('phabricator:138.notification.sql',1453226123,NULL),('phabricator:20121209.pholioxactions.sql',1453226124,NULL),('phabricator:20121209.xmacroadd.sql',1453226124,NULL),('phabricator:20121209.xmacromigrate.php',1453226124,NULL),('phabricator:20121209.xmacromigratekey.sql',1453226124,NULL),('phabricator:20121220.generalcache.sql',1453226124,NULL),('phabricator:20121226.config.sql',1453226124,NULL),('phabricator:20130101.confxaction.sql',1453226124,NULL),('phabricator:20130102.metamtareceivedmailmessageidhash.sql',1453226124,NULL),('phabricator:20130103.filemetadata.sql',1453226124,NULL),('phabricator:20130111.conpherence.sql',1453226124,NULL),('phabricator:20130127.altheraldtranscript.sql',1453226124,NULL),('phabricator:20130131.conpherencepics.sql',1453226124,NULL),('phabricator:20130201.revisionunsubscribed.php',1453226124,NULL),('phabricator:20130201.revisionunsubscribed.sql',1453226124,NULL),('phabricator:20130214.chatlogchannel.sql',1453226124,NULL),('phabricator:20130214.chatlogchannelid.sql',1453226124,NULL),('phabricator:20130214.token.sql',1453226124,NULL),('phabricator:20130215.phabricatorfileaddttl.sql',1453226124,NULL),('phabricator:20130217.cachettl.sql',1453226124,NULL),('phabricator:20130218.longdaemon.sql',1453226124,NULL),('phabricator:20130218.updatechannelid.php',1453226124,NULL),('phabricator:20130219.commitsummary.sql',1453226124,NULL),('phabricator:20130219.commitsummarymig.php',1453226124,NULL),('phabricator:20130222.dropchannel.sql',1453226124,NULL),('phabricator:20130226.commitkey.sql',1453226124,NULL),('phabricator:20130304.lintauthor.sql',1453226124,NULL),('phabricator:20130310.xactionmeta.sql',1453226124,NULL),('phabricator:20130317.phrictionedge.sql',1453226124,NULL),('phabricator:20130319.conpherence.sql',1453226124,NULL),('phabricator:20130319.phabricatorfileexplicitupload.sql',1453226124,NULL),('phabricator:20130320.phlux.sql',1453226124,NULL),('phabricator:20130321.token.sql',1453226124,NULL),('phabricator:20130322.phortune.sql',1453226124,NULL),('phabricator:20130323.phortunepayment.sql',1453226124,NULL),('phabricator:20130324.phortuneproduct.sql',1453226124,NULL),('phabricator:20130330.phrequent.sql',1453226124,NULL),('phabricator:20130403.conpherencecache.sql',1453226124,NULL),('phabricator:20130403.conpherencecachemig.php',1453226124,NULL),('phabricator:20130409.commitdrev.php',1453226124,NULL),('phabricator:20130417.externalaccount.sql',1453226124,NULL),('phabricator:20130423.conpherenceindices.sql',1453226125,NULL),('phabricator:20130423.phortunepaymentrevised.sql',1453226125,NULL),('phabricator:20130423.updateexternalaccount.sql',1453226124,NULL),('phabricator:20130426.search_savedquery.sql',1453226125,NULL),('phabricator:20130502.countdownrevamp1.sql',1453226125,NULL),('phabricator:20130502.countdownrevamp2.php',1453226125,NULL),('phabricator:20130502.countdownrevamp3.sql',1453226125,NULL),('phabricator:20130507.releephrqmailkey.sql',1453226125,NULL),('phabricator:20130507.releephrqmailkeypop.php',1453226125,NULL),('phabricator:20130507.releephrqsimplifycols.sql',1453226125,NULL),('phabricator:20130508.releephtransactions.sql',1453226125,NULL),('phabricator:20130508.releephtransactionsmig.php',1453226125,NULL),('phabricator:20130508.search_namedquery.sql',1453226125,NULL),('phabricator:20130513.receviedmailstatus.sql',1453226125,NULL),('phabricator:20130519.diviner.sql',1453226125,NULL),('phabricator:20130521.dropconphimages.sql',1453226125,NULL),('phabricator:20130523.maniphest_owners.sql',1453226125,NULL),('phabricator:20130524.repoxactions.sql',1453226125,NULL),('phabricator:20130529.macroauthor.sql',1453226125,NULL),('phabricator:20130529.macroauthormig.php',1453226125,NULL),('phabricator:20130530.macrodatekey.sql',1453226125,NULL),('phabricator:20130530.pastekeys.sql',1453226125,NULL),('phabricator:20130530.sessionhash.php',1453226125,NULL),('phabricator:20130531.filekeys.sql',1453226125,NULL),('phabricator:20130602.morediviner.sql',1453226125,NULL),('phabricator:20130602.namedqueries.sql',1453226125,NULL),('phabricator:20130606.userxactions.sql',1453226125,NULL),('phabricator:20130607.xaccount.sql',1453226125,NULL),('phabricator:20130611.migrateoauth.php',1453226125,NULL),('phabricator:20130611.nukeldap.php',1453226125,NULL),('phabricator:20130613.authdb.sql',1453226125,NULL),('phabricator:20130619.authconf.php',1453226125,NULL),('phabricator:20130620.diffxactions.sql',1453226125,NULL),('phabricator:20130621.diffcommentphid.sql',1453226125,NULL),('phabricator:20130621.diffcommentphidmig.php',1453226125,NULL),('phabricator:20130621.diffcommentunphid.sql',1453226125,NULL),('phabricator:20130622.doorkeeper.sql',1453226125,NULL),('phabricator:20130628.legalpadv0.sql',1453226125,NULL),('phabricator:20130701.conduitlog.sql',1453226125,NULL),('phabricator:20130703.legalpaddocdenorm.php',1453226125,NULL),('phabricator:20130703.legalpaddocdenorm.sql',1453226125,NULL),('phabricator:20130709.droptimeline.sql',1453226125,NULL),('phabricator:20130709.legalpadsignature.sql',1453226125,NULL),('phabricator:20130711.pholioimageobsolete.php',1453226126,NULL),('phabricator:20130711.pholioimageobsolete.sql',1453226126,NULL),('phabricator:20130711.pholioimageobsolete2.sql',1453226126,NULL),('phabricator:20130711.trimrealnames.php',1453226125,NULL),('phabricator:20130714.votexactions.sql',1453226125,NULL),('phabricator:20130715.votecomments.php',1453226125,NULL),('phabricator:20130715.voteedges.sql',1453226125,NULL),('phabricator:20130716.archivememberlessprojects.php',1453226126,NULL),('phabricator:20130722.pholioreplace.sql',1453226126,NULL),('phabricator:20130723.taskstarttime.sql',1453226126,NULL),('phabricator:20130726.ponderxactions.sql',1453226126,NULL),('phabricator:20130727.ponderquestionstatus.sql',1453226126,NULL),('phabricator:20130728.ponderunique.php',1453226126,NULL),('phabricator:20130728.ponderuniquekey.sql',1453226126,NULL),('phabricator:20130728.ponderxcomment.php',1453226126,NULL),('phabricator:20130731.releephcutpointidentifier.sql',1453226126,NULL),('phabricator:20130731.releephproject.sql',1453226126,NULL),('phabricator:20130731.releephrepoid.sql',1453226126,NULL),('phabricator:20130801.pastexactions.php',1453226126,NULL),('phabricator:20130801.pastexactions.sql',1453226126,NULL),('phabricator:20130802.heraldphid.sql',1453226126,NULL),('phabricator:20130802.heraldphids.php',1453226126,NULL),('phabricator:20130802.heraldphidukey.sql',1453226126,NULL),('phabricator:20130802.heraldxactions.sql',1453226126,NULL),('phabricator:20130805.pasteedges.sql',1453226126,NULL),('phabricator:20130805.pastemailkey.sql',1453226126,NULL),('phabricator:20130805.pastemailkeypop.php',1453226126,NULL),('phabricator:20130814.usercustom.sql',1453226126,NULL),('phabricator:20130820.file-mailkey-populate.php',1453226126,NULL),('phabricator:20130820.filemailkey.sql',1453226126,NULL),('phabricator:20130820.filexactions.sql',1453226126,NULL),('phabricator:20130820.releephxactions.sql',1453226126,NULL),('phabricator:20130826.divinernode.sql',1453226126,NULL),('phabricator:20130912.maniphest.1.touch.sql',1453226126,NULL),('phabricator:20130912.maniphest.2.created.sql',1453226126,NULL),('phabricator:20130912.maniphest.3.nameindex.sql',1453226126,NULL),('phabricator:20130912.maniphest.4.fillindex.php',1453226126,NULL),('phabricator:20130913.maniphest.1.migratesearch.php',1453226126,NULL),('phabricator:20130914.usercustom.sql',1453226126,NULL),('phabricator:20130915.maniphestcustom.sql',1453226126,NULL),('phabricator:20130915.maniphestmigrate.php',1453226126,NULL),('phabricator:20130915.maniphestqdrop.sql',1453226126,NULL),('phabricator:20130919.mfieldconf.php',1453226126,NULL),('phabricator:20130920.repokeyspolicy.sql',1453226126,NULL),('phabricator:20130921.mtransactions.sql',1453226126,NULL),('phabricator:20130921.xmigratemaniphest.php',1453226126,NULL),('phabricator:20130923.mrename.sql',1453226126,NULL),('phabricator:20130924.mdraftkey.sql',1453226126,NULL),('phabricator:20130925.mpolicy.sql',1453226126,NULL),('phabricator:20130925.xpolicy.sql',1453226126,NULL),('phabricator:20130926.dcustom.sql',1453226126,NULL),('phabricator:20130926.dinkeys.sql',1453226126,NULL),('phabricator:20130926.dinline.php',1453226126,NULL),('phabricator:20130927.audiomacro.sql',1453226126,NULL),('phabricator:20130929.filepolicy.sql',1453226126,NULL),('phabricator:20131004.dxedgekey.sql',1453226126,NULL),('phabricator:20131004.dxreviewers.php',1453226126,NULL),('phabricator:20131006.hdisable.sql',1453226126,NULL),('phabricator:20131010.pstorage.sql',1453226126,NULL),('phabricator:20131015.cpolicy.sql',1453226126,NULL),('phabricator:20131020.col1.sql',1453226126,NULL),('phabricator:20131020.harbormaster.sql',1453226126,NULL),('phabricator:20131020.pcustom.sql',1453226126,NULL),('phabricator:20131020.pxaction.sql',1453226126,NULL),('phabricator:20131020.pxactionmig.php',1453226126,NULL),('phabricator:20131025.repopush.sql',1453226127,NULL),('phabricator:20131026.commitstatus.sql',1453226127,NULL),('phabricator:20131030.repostatusmessage.sql',1453226127,NULL),('phabricator:20131031.vcspassword.sql',1453226127,NULL),('phabricator:20131105.buildstep.sql',1453226127,NULL),('phabricator:20131106.diffphid.1.col.sql',1453226127,NULL),('phabricator:20131106.diffphid.2.mig.php',1453226127,NULL),('phabricator:20131106.diffphid.3.key.sql',1453226127,NULL),('phabricator:20131106.nuance-v0.sql',1453226127,NULL),('phabricator:20131107.buildlog.sql',1453226127,NULL),('phabricator:20131112.userverified.1.col.sql',1453226127,NULL),('phabricator:20131112.userverified.2.mig.php',1453226127,NULL),('phabricator:20131118.ownerorder.php',1453226127,NULL),('phabricator:20131119.passphrase.sql',1453226127,NULL),('phabricator:20131120.nuancesourcetype.sql',1453226127,NULL),('phabricator:20131121.passphraseedge.sql',1453226127,NULL),('phabricator:20131121.repocredentials.1.col.sql',1453226127,NULL),('phabricator:20131121.repocredentials.2.mig.php',1453226127,NULL),('phabricator:20131122.repomirror.sql',1453226127,NULL),('phabricator:20131123.drydockblueprintpolicy.sql',1453226127,NULL),('phabricator:20131129.drydockresourceblueprint.sql',1453226127,NULL),('phabricator:20131204.pushlog.sql',1453226127,NULL),('phabricator:20131205.buildsteporder.sql',1453226127,NULL),('phabricator:20131205.buildstepordermig.php',1453226127,NULL),('phabricator:20131205.buildtargets.sql',1453226127,NULL),('phabricator:20131206.phragment.sql',1453226127,NULL),('phabricator:20131206.phragmentnull.sql',1453226127,NULL),('phabricator:20131208.phragmentsnapshot.sql',1453226127,NULL),('phabricator:20131211.phragmentedges.sql',1453226127,NULL),('phabricator:20131217.pushlogphid.1.col.sql',1453226127,NULL),('phabricator:20131217.pushlogphid.2.mig.php',1453226127,NULL),('phabricator:20131217.pushlogphid.3.key.sql',1453226127,NULL),('phabricator:20131219.pxdrop.sql',1453226127,NULL),('phabricator:20131224.harbormanual.sql',1453226127,NULL),('phabricator:20131227.heraldobject.sql',1453226127,NULL),('phabricator:20131231.dropshortcut.sql',1453226127,NULL),('phabricator:20131302.maniphestvalue.sql',1453226124,NULL),('phabricator:20140104.harbormastercmd.sql',1453226127,NULL),('phabricator:20140106.macromailkey.1.sql',1453226127,NULL),('phabricator:20140106.macromailkey.2.php',1453226127,NULL),('phabricator:20140108.ddbpname.1.sql',1453226127,NULL),('phabricator:20140108.ddbpname.2.php',1453226127,NULL),('phabricator:20140109.ddxactions.sql',1453226127,NULL),('phabricator:20140109.projectcolumnsdates.sql',1453226127,NULL),('phabricator:20140113.legalpadsig.1.sql',1453226127,NULL),('phabricator:20140113.legalpadsig.2.php',1453226127,NULL),('phabricator:20140115.auth.1.id.sql',1453226128,NULL),('phabricator:20140115.auth.2.expires.sql',1453226128,NULL),('phabricator:20140115.auth.3.unlimit.php',1453226128,NULL),('phabricator:20140115.legalpadsigkey.sql',1453226128,NULL),('phabricator:20140116.reporefcursor.sql',1453226128,NULL),('phabricator:20140126.diff.1.parentrevisionid.sql',1453226128,NULL),('phabricator:20140126.diff.2.repositoryphid.sql',1453226128,NULL),('phabricator:20140130.dash.1.board.sql',1453226128,NULL),('phabricator:20140130.dash.2.panel.sql',1453226128,NULL),('phabricator:20140130.dash.3.boardxaction.sql',1453226128,NULL),('phabricator:20140130.dash.4.panelxaction.sql',1453226128,NULL),('phabricator:20140130.mail.1.retry.sql',1453226128,NULL),('phabricator:20140130.mail.2.next.sql',1453226128,NULL),('phabricator:20140201.gc.1.mailsent.sql',1453226128,NULL),('phabricator:20140201.gc.2.mailreceived.sql',1453226128,NULL),('phabricator:20140205.cal.1.rename.sql',1453226128,NULL),('phabricator:20140205.cal.2.phid-col.sql',1453226128,NULL),('phabricator:20140205.cal.3.phid-mig.php',1453226128,NULL),('phabricator:20140205.cal.4.phid-key.sql',1453226128,NULL),('phabricator:20140210.herald.rule-condition-mig.php',1453226128,NULL),('phabricator:20140210.projcfield.1.blurb.php',1453226128,NULL),('phabricator:20140210.projcfield.2.piccol.sql',1453226128,NULL),('phabricator:20140210.projcfield.3.picmig.sql',1453226128,NULL),('phabricator:20140210.projcfield.4.memmig.sql',1453226128,NULL),('phabricator:20140210.projcfield.5.dropprofile.sql',1453226128,NULL),('phabricator:20140211.dx.1.nullablechangesetid.sql',1453226128,NULL),('phabricator:20140211.dx.2.migcommenttext.php',1453226128,NULL),('phabricator:20140211.dx.3.migsubscriptions.sql',1453226128,NULL),('phabricator:20140211.dx.999.drop.relationships.sql',1453226128,NULL),('phabricator:20140212.dx.1.armageddon.php',1453226128,NULL),('phabricator:20140214.clean.1.legacycommentid.sql',1453226128,NULL),('phabricator:20140214.clean.2.dropcomment.sql',1453226128,NULL),('phabricator:20140214.clean.3.dropinline.sql',1453226128,NULL),('phabricator:20140218.differentialdraft.sql',1453226128,NULL),('phabricator:20140218.passwords.1.extend.sql',1453226128,NULL),('phabricator:20140218.passwords.2.prefix.sql',1453226128,NULL),('phabricator:20140218.passwords.3.vcsextend.sql',1453226128,NULL),('phabricator:20140218.passwords.4.vcs.php',1453226128,NULL),('phabricator:20140223.bigutf8scratch.sql',1453226128,NULL),('phabricator:20140224.dxclean.1.datecommitted.sql',1453226128,NULL),('phabricator:20140226.dxcustom.1.fielddata.php',1453226128,NULL),('phabricator:20140226.dxcustom.99.drop.sql',1453226128,NULL),('phabricator:20140228.dxcomment.1.sql',1453226128,NULL),('phabricator:20140305.diviner.1.slugcol.sql',1453226128,NULL),('phabricator:20140305.diviner.2.slugkey.sql',1453226128,NULL),('phabricator:20140311.mdroplegacy.sql',1453226128,NULL),('phabricator:20140314.projectcolumn.1.statuscol.sql',1453226128,NULL),('phabricator:20140314.projectcolumn.2.statuskey.sql',1453226128,NULL),('phabricator:20140317.mupdatedkey.sql',1453226128,NULL),('phabricator:20140321.harbor.1.bxaction.sql',1453226128,NULL),('phabricator:20140321.mstatus.1.col.sql',1453226128,NULL),('phabricator:20140321.mstatus.2.mig.php',1453226128,NULL),('phabricator:20140323.harbor.1.renames.php',1453226128,NULL),('phabricator:20140323.harbor.2.message.sql',1453226128,NULL),('phabricator:20140325.push.1.event.sql',1453226128,NULL),('phabricator:20140325.push.2.eventphid.sql',1453226128,NULL),('phabricator:20140325.push.3.groups.php',1453226128,NULL),('phabricator:20140325.push.4.prune.sql',1453226128,NULL),('phabricator:20140326.project.1.colxaction.sql',1453226128,NULL),('phabricator:20140328.releeph.1.productxaction.sql',1453226128,NULL),('phabricator:20140330.flagtext.sql',1453226128,NULL),('phabricator:20140402.actionlog.sql',1453226128,NULL),('phabricator:20140410.accountsecret.1.sql',1453226128,NULL),('phabricator:20140410.accountsecret.2.php',1453226128,NULL),('phabricator:20140416.harbor.1.sql',1453226128,NULL),('phabricator:20140420.rel.1.objectphid.sql',1453226128,NULL),('phabricator:20140420.rel.2.objectmig.php',1453226128,NULL),('phabricator:20140421.slowvotecolumnsisclosed.sql',1453226128,NULL),('phabricator:20140423.session.1.hisec.sql',1453226128,NULL),('phabricator:20140427.mfactor.1.sql',1453226128,NULL),('phabricator:20140430.auth.1.partial.sql',1453226128,NULL),('phabricator:20140430.dash.1.paneltype.sql',1453226128,NULL),('phabricator:20140430.dash.2.edge.sql',1453226128,NULL),('phabricator:20140501.passphraselockcredential.sql',1453226128,NULL),('phabricator:20140501.remove.1.dlog.sql',1453226128,NULL),('phabricator:20140507.smstable.sql',1453226128,NULL),('phabricator:20140509.coverage.1.sql',1453226128,NULL),('phabricator:20140509.dashboardlayoutconfig.sql',1453226128,NULL),('phabricator:20140512.dparents.1.sql',1453226128,NULL),('phabricator:20140514.harbormasterbuildabletransaction.sql',1453226128,NULL),('phabricator:20140514.pholiomockclose.sql',1453226129,NULL),('phabricator:20140515.trust-emails.sql',1453226129,NULL),('phabricator:20140517.dxbinarycache.sql',1453226129,NULL),('phabricator:20140518.dxmorebinarycache.sql',1453226129,NULL),('phabricator:20140519.dashboardinstall.sql',1453226129,NULL),('phabricator:20140520.authtemptoken.sql',1453226129,NULL),('phabricator:20140521.projectslug.1.create.sql',1453226129,NULL),('phabricator:20140521.projectslug.2.mig.php',1453226129,NULL),('phabricator:20140522.projecticon.sql',1453226129,NULL),('phabricator:20140524.auth.mfa.cache.sql',1453226129,NULL),('phabricator:20140525.hunkmodern.sql',1453226129,NULL),('phabricator:20140615.pholioedit.1.sql',1453226129,NULL),('phabricator:20140615.pholioedit.2.sql',1453226129,NULL),('phabricator:20140617.daemon.explicit-argv.sql',1453226129,NULL),('phabricator:20140617.daemonlog.sql',1453226129,NULL),('phabricator:20140624.projcolor.1.sql',1453226129,NULL),('phabricator:20140624.projcolor.2.sql',1453226129,NULL),('phabricator:20140629.dasharchive.1.sql',1453226129,NULL),('phabricator:20140629.legalsig.1.sql',1453226129,NULL),('phabricator:20140629.legalsig.2.php',1453226129,NULL),('phabricator:20140701.legalexemption.1.sql',1453226129,NULL),('phabricator:20140701.legalexemption.2.sql',1453226129,NULL),('phabricator:20140703.legalcorp.1.sql',1453226129,NULL),('phabricator:20140703.legalcorp.2.sql',1453226129,NULL),('phabricator:20140703.legalcorp.3.sql',1453226129,NULL),('phabricator:20140703.legalcorp.4.sql',1453226129,NULL),('phabricator:20140703.legalcorp.5.sql',1453226129,NULL),('phabricator:20140704.harbormasterstep.1.sql',1453226129,NULL),('phabricator:20140704.harbormasterstep.2.sql',1453226129,NULL),('phabricator:20140704.legalpreamble.1.sql',1453226129,NULL),('phabricator:20140706.harbormasterdepend.1.php',1453226129,NULL),('phabricator:20140706.pedge.1.sql',1453226129,NULL),('phabricator:20140711.pnames.1.sql',1453226129,NULL),('phabricator:20140711.pnames.2.php',1453226129,NULL),('phabricator:20140711.workerpriority.sql',1453226129,NULL),('phabricator:20140712.projcoluniq.sql',1453226129,NULL),('phabricator:20140721.phortune.1.cart.sql',1453226129,NULL),('phabricator:20140721.phortune.2.purchase.sql',1453226129,NULL),('phabricator:20140721.phortune.3.charge.sql',1453226129,NULL),('phabricator:20140721.phortune.4.cartstatus.sql',1453226129,NULL),('phabricator:20140721.phortune.5.cstatusdefault.sql',1453226129,NULL),('phabricator:20140721.phortune.6.onetimecharge.sql',1453226129,NULL),('phabricator:20140721.phortune.7.nullmethod.sql',1453226129,NULL),('phabricator:20140722.appname.php',1453226129,NULL),('phabricator:20140722.audit.1.xactions.sql',1453226129,NULL),('phabricator:20140722.audit.2.comments.sql',1453226129,NULL),('phabricator:20140722.audit.3.miginlines.php',1453226129,NULL),('phabricator:20140722.audit.4.migtext.php',1453226129,NULL),('phabricator:20140722.renameauth.php',1453226129,NULL),('phabricator:20140723.apprenamexaction.sql',1453226129,NULL),('phabricator:20140725.audit.1.migxactions.php',1453226129,NULL),('phabricator:20140731.audit.1.subscribers.php',1453226129,NULL),('phabricator:20140731.cancdn.php',1453226129,NULL),('phabricator:20140731.harbormasterstepdesc.sql',1453226129,NULL),('phabricator:20140805.boardcol.1.sql',1453226129,NULL),('phabricator:20140805.boardcol.2.php',1453226129,NULL),('phabricator:20140807.harbormastertargettime.sql',1453226129,NULL),('phabricator:20140808.boardprop.1.sql',1453226129,NULL),('phabricator:20140808.boardprop.2.sql',1453226129,NULL),('phabricator:20140808.boardprop.3.php',1453226129,NULL),('phabricator:20140811.blob.1.sql',1453226129,NULL),('phabricator:20140811.blob.2.sql',1453226129,NULL),('phabricator:20140812.projkey.1.sql',1453226129,NULL),('phabricator:20140812.projkey.2.sql',1453226129,NULL),('phabricator:20140814.passphrasecredentialconduit.sql',1453226129,NULL),('phabricator:20140815.cancdncase.php',1453226129,NULL),('phabricator:20140818.harbormasterindex.1.sql',1453226129,NULL),('phabricator:20140821.harbormasterbuildgen.1.sql',1453226129,NULL),('phabricator:20140822.daemonenvhash.sql',1453226129,NULL),('phabricator:20140902.almanacdevice.1.sql',1453226129,NULL),('phabricator:20140904.macroattach.php',1453226129,NULL),('phabricator:20140911.fund.1.initiative.sql',1453226129,NULL),('phabricator:20140911.fund.2.xaction.sql',1453226129,NULL),('phabricator:20140911.fund.3.edge.sql',1453226129,NULL),('phabricator:20140911.fund.4.backer.sql',1453226129,NULL),('phabricator:20140911.fund.5.backxaction.sql',1453226129,NULL),('phabricator:20140914.betaproto.php',1453226129,NULL),('phabricator:20140917.project.canlock.sql',1453226129,NULL),('phabricator:20140918.schema.1.dropaudit.sql',1453226129,NULL),('phabricator:20140918.schema.2.dropauditinline.sql',1453226129,NULL),('phabricator:20140918.schema.3.wipecache.sql',1453226129,NULL),('phabricator:20140918.schema.4.cachetype.sql',1453226129,NULL),('phabricator:20140918.schema.5.slowvote.sql',1453226129,NULL),('phabricator:20140919.schema.01.calstatus.sql',1453226129,NULL),('phabricator:20140919.schema.02.calname.sql',1453226129,NULL),('phabricator:20140919.schema.03.dropaux.sql',1453226129,NULL),('phabricator:20140919.schema.04.droptaskproj.sql',1453226129,NULL),('phabricator:20140926.schema.01.droprelev.sql',1453226129,NULL),('phabricator:20140926.schema.02.droprelreqev.sql',1453226129,NULL),('phabricator:20140926.schema.03.dropldapinfo.sql',1453226129,NULL),('phabricator:20140926.schema.04.dropoauthinfo.sql',1453226129,NULL),('phabricator:20140926.schema.05.dropprojaffil.sql',1453226129,NULL),('phabricator:20140926.schema.06.dropsubproject.sql',1453226129,NULL),('phabricator:20140926.schema.07.droppondcom.sql',1453226129,NULL),('phabricator:20140927.schema.01.dropsearchq.sql',1453226129,NULL),('phabricator:20140927.schema.02.pholio1.sql',1453226129,NULL),('phabricator:20140927.schema.03.pholio2.sql',1453226129,NULL),('phabricator:20140927.schema.04.pholio3.sql',1453226129,NULL),('phabricator:20140927.schema.05.phragment1.sql',1453226130,NULL),('phabricator:20140927.schema.06.releeph1.sql',1453226130,NULL),('phabricator:20141001.schema.01.version.sql',1453226130,NULL),('phabricator:20141001.schema.02.taskmail.sql',1453226130,NULL),('phabricator:20141002.schema.01.liskcounter.sql',1453226130,NULL),('phabricator:20141002.schema.02.draftnull.sql',1453226130,NULL),('phabricator:20141004.currency.01.sql',1453226130,NULL),('phabricator:20141004.currency.02.sql',1453226130,NULL),('phabricator:20141004.currency.03.sql',1453226130,NULL),('phabricator:20141004.currency.04.sql',1453226130,NULL),('phabricator:20141004.currency.05.sql',1453226130,NULL),('phabricator:20141004.currency.06.sql',1453226130,NULL),('phabricator:20141004.harborliskcounter.sql',1453226130,NULL),('phabricator:20141005.phortuneproduct.sql',1453226130,NULL),('phabricator:20141006.phortunecart.sql',1453226130,NULL),('phabricator:20141006.phortunemerchant.sql',1453226130,NULL),('phabricator:20141006.phortunemerchantx.sql',1453226130,NULL),('phabricator:20141007.fundmerchant.sql',1453226130,NULL),('phabricator:20141007.fundrisks.sql',1453226130,NULL),('phabricator:20141007.fundtotal.sql',1453226130,NULL),('phabricator:20141007.phortunecartmerchant.sql',1453226130,NULL),('phabricator:20141007.phortunecharge.sql',1453226130,NULL),('phabricator:20141007.phortunepayment.sql',1453226130,NULL),('phabricator:20141007.phortuneprovider.sql',1453226130,NULL),('phabricator:20141007.phortuneproviderx.sql',1453226130,NULL),('phabricator:20141008.phortunemerchdesc.sql',1453226130,NULL),('phabricator:20141008.phortuneprovdis.sql',1453226130,NULL),('phabricator:20141008.phortunerefund.sql',1453226130,NULL),('phabricator:20141010.fundmailkey.sql',1453226130,NULL),('phabricator:20141011.phortunemerchedit.sql',1453226130,NULL),('phabricator:20141012.phortunecartxaction.sql',1453226130,NULL),('phabricator:20141013.phortunecartkey.sql',1453226130,NULL),('phabricator:20141016.almanac.device.sql',1453226130,NULL),('phabricator:20141016.almanac.dxaction.sql',1453226130,NULL),('phabricator:20141016.almanac.interface.sql',1453226130,NULL),('phabricator:20141016.almanac.network.sql',1453226130,NULL),('phabricator:20141016.almanac.nxaction.sql',1453226130,NULL),('phabricator:20141016.almanac.service.sql',1453226130,NULL),('phabricator:20141016.almanac.sxaction.sql',1453226130,NULL),('phabricator:20141017.almanac.binding.sql',1453226130,NULL),('phabricator:20141017.almanac.bxaction.sql',1453226130,NULL),('phabricator:20141025.phriction.1.xaction.sql',1453226130,NULL),('phabricator:20141025.phriction.2.xaction.sql',1453226130,NULL),('phabricator:20141025.phriction.mailkey.sql',1453226130,NULL),('phabricator:20141103.almanac.1.delprop.sql',1453226130,NULL),('phabricator:20141103.almanac.2.addprop.sql',1453226131,NULL),('phabricator:20141104.almanac.3.edge.sql',1453226131,NULL),('phabricator:20141105.ssh.1.rename.sql',1453226131,NULL),('phabricator:20141106.dropold.sql',1453226131,NULL),('phabricator:20141106.uniqdrafts.php',1453226131,NULL),('phabricator:20141107.phriction.policy.1.sql',1453226131,NULL),('phabricator:20141107.phriction.policy.2.php',1453226131,NULL),('phabricator:20141107.phriction.popkeys.php',1453226131,NULL),('phabricator:20141107.ssh.1.colname.sql',1453226131,NULL),('phabricator:20141107.ssh.2.keyhash.sql',1453226131,NULL),('phabricator:20141107.ssh.3.keyindex.sql',1453226131,NULL),('phabricator:20141107.ssh.4.keymig.php',1453226131,NULL),('phabricator:20141107.ssh.5.indexnull.sql',1453226131,NULL),('phabricator:20141107.ssh.6.indexkey.sql',1453226131,NULL),('phabricator:20141107.ssh.7.colnull.sql',1453226131,NULL),('phabricator:20141113.auditdupes.php',1453226131,NULL),('phabricator:20141118.diffxaction.sql',1453226131,NULL),('phabricator:20141119.commitpedge.sql',1453226131,NULL),('phabricator:20141119.differential.diff.policy.sql',1453226131,NULL),('phabricator:20141119.sshtrust.sql',1453226131,NULL),('phabricator:20141123.taskpriority.1.sql',1453226131,NULL),('phabricator:20141123.taskpriority.2.sql',1453226131,NULL),('phabricator:20141210.maniphestsubscribersmig.1.sql',1453226131,NULL),('phabricator:20141210.maniphestsubscribersmig.2.sql',1453226131,NULL),('phabricator:20141210.reposervice.sql',1453226131,NULL),('phabricator:20141212.conduittoken.sql',1453226131,NULL),('phabricator:20141215.almanacservicetype.sql',1453226131,NULL),('phabricator:20141217.almanacdevicelock.sql',1453226131,NULL),('phabricator:20141217.almanaclock.sql',1453226131,NULL),('phabricator:20141218.maniphestcctxn.php',1453226131,NULL),('phabricator:20141222.maniphestprojtxn.php',1453226131,NULL),('phabricator:20141223.daemonloguser.sql',1453226131,NULL),('phabricator:20141223.daemonobjectphid.sql',1453226131,NULL),('phabricator:20141230.pasteeditpolicycolumn.sql',1453226131,NULL),('phabricator:20141230.pasteeditpolicyexisting.sql',1453226131,NULL),('phabricator:20150102.policyname.php',1453226131,NULL),('phabricator:20150102.tasksubscriber.sql',1453226131,NULL),('phabricator:20150105.conpsearch.sql',1453226131,NULL),('phabricator:20150114.oauthserver.client.policy.sql',1453226131,NULL),('phabricator:20150115.applicationemails.sql',1453226131,NULL),('phabricator:20150115.trigger.1.sql',1453226131,NULL),('phabricator:20150115.trigger.2.sql',1453226131,NULL),('phabricator:20150116.maniphestapplicationemails.php',1453226131,NULL),('phabricator:20150120.maniphestdefaultauthor.php',1453226131,NULL),('phabricator:20150124.subs.1.sql',1453226131,NULL),('phabricator:20150129.pastefileapplicationemails.php',1453226131,NULL),('phabricator:20150130.phortune.1.subphid.sql',1453226131,NULL),('phabricator:20150130.phortune.2.subkey.sql',1453226131,NULL),('phabricator:20150131.phortune.1.defaultpayment.sql',1453226131,NULL),('phabricator:20150205.authprovider.autologin.sql',1453226131,NULL),('phabricator:20150205.daemonenv.sql',1453226131,NULL),('phabricator:20150209.invite.sql',1453226131,NULL),('phabricator:20150209.oauthclient.trust.sql',1453226131,NULL),('phabricator:20150210.invitephid.sql',1453226131,NULL),('phabricator:20150212.legalpad.session.1.sql',1453226131,NULL),('phabricator:20150212.legalpad.session.2.sql',1453226131,NULL),('phabricator:20150219.scratch.nonmutable.sql',1453226131,NULL),('phabricator:20150223.daemon.1.id.sql',1453226131,NULL),('phabricator:20150223.daemon.2.idlegacy.sql',1453226131,NULL),('phabricator:20150223.daemon.3.idkey.sql',1453226131,NULL),('phabricator:20150312.filechunk.1.sql',1453226131,NULL),('phabricator:20150312.filechunk.2.sql',1453226131,NULL),('phabricator:20150312.filechunk.3.sql',1453226131,NULL),('phabricator:20150317.conpherence.isroom.1.sql',1453226131,NULL),('phabricator:20150317.conpherence.isroom.2.sql',1453226131,NULL),('phabricator:20150317.conpherence.policy.sql',1453226131,NULL),('phabricator:20150410.nukeruleedit.sql',1453226131,NULL),('phabricator:20150420.invoice.1.sql',1453226131,NULL),('phabricator:20150420.invoice.2.sql',1453226131,NULL),('phabricator:20150425.isclosed.sql',1453226131,NULL),('phabricator:20150427.calendar.1.edge.sql',1453226131,NULL),('phabricator:20150427.calendar.1.xaction.sql',1453226131,NULL),('phabricator:20150427.calendar.2.xaction.sql',1453226131,NULL),('phabricator:20150428.calendar.1.iscancelled.sql',1453226131,NULL),('phabricator:20150428.calendar.1.name.sql',1453226131,NULL),('phabricator:20150429.calendar.1.invitee.sql',1453226131,NULL),('phabricator:20150430.calendar.1.policies.sql',1453226132,NULL),('phabricator:20150430.multimeter.1.sql',1453226132,NULL),('phabricator:20150430.multimeter.2.host.sql',1453226132,NULL),('phabricator:20150430.multimeter.3.viewer.sql',1453226132,NULL),('phabricator:20150430.multimeter.4.context.sql',1453226132,NULL),('phabricator:20150430.multimeter.5.label.sql',1453226132,NULL),('phabricator:20150501.calendar.1.reply.sql',1453226132,NULL),('phabricator:20150501.calendar.2.reply.php',1453226132,NULL),('phabricator:20150501.conpherencepics.sql',1453226132,NULL),('phabricator:20150503.repositorysymbols.1.sql',1453226132,NULL),('phabricator:20150503.repositorysymbols.2.php',1453226132,NULL),('phabricator:20150503.repositorysymbols.3.sql',1453226132,NULL),('phabricator:20150504.symbolsproject.1.php',1453226132,NULL),('phabricator:20150504.symbolsproject.2.sql',1453226132,NULL),('phabricator:20150506.calendarunnamedevents.1.php',1453226132,NULL),('phabricator:20150507.calendar.1.isallday.sql',1453226132,NULL),('phabricator:20150513.user.cache.1.sql',1453226132,NULL),('phabricator:20150514.calendar.status.sql',1453226132,NULL),('phabricator:20150514.phame.blog.xaction.sql',1453226132,NULL),('phabricator:20150514.user.cache.2.sql',1453226132,NULL),('phabricator:20150515.phame.post.xaction.sql',1453226132,NULL),('phabricator:20150515.project.mailkey.1.sql',1453226132,NULL),('phabricator:20150515.project.mailkey.2.php',1453226132,NULL),('phabricator:20150519.calendar.calendaricon.sql',1453226132,NULL),('phabricator:20150521.releephrepository.sql',1453226132,NULL),('phabricator:20150525.diff.hidden.1.sql',1453226132,NULL),('phabricator:20150526.owners.mailkey.1.sql',1453226132,NULL),('phabricator:20150526.owners.mailkey.2.php',1453226132,NULL),('phabricator:20150526.owners.xaction.sql',1453226132,NULL),('phabricator:20150527.calendar.recurringevents.sql',1453226132,NULL),('phabricator:20150601.spaces.1.namespace.sql',1453226132,NULL),('phabricator:20150601.spaces.2.xaction.sql',1453226132,NULL),('phabricator:20150602.mlist.1.sql',1453226132,NULL),('phabricator:20150602.mlist.2.php',1453226132,NULL),('phabricator:20150604.spaces.1.sql',1453226132,NULL),('phabricator:20150605.diviner.edges.sql',1453226132,NULL),('phabricator:20150605.diviner.editPolicy.sql',1453226132,NULL),('phabricator:20150605.diviner.xaction.sql',1453226132,NULL),('phabricator:20150606.mlist.1.php',1453226132,NULL),('phabricator:20150609.inline.sql',1453226132,NULL),('phabricator:20150609.spaces.1.pholio.sql',1453226132,NULL),('phabricator:20150609.spaces.2.maniphest.sql',1453226132,NULL),('phabricator:20150610.spaces.1.desc.sql',1453226132,NULL),('phabricator:20150610.spaces.2.edge.sql',1453226132,NULL),('phabricator:20150610.spaces.3.archive.sql',1453226132,NULL),('phabricator:20150611.spaces.1.mailxaction.sql',1453226132,NULL),('phabricator:20150611.spaces.2.appmail.sql',1453226132,NULL),('phabricator:20150616.divinerrepository.sql',1453226132,NULL),('phabricator:20150617.harbor.1.lint.sql',1453226132,NULL),('phabricator:20150617.harbor.2.unit.sql',1453226132,NULL),('phabricator:20150618.harbor.1.planauto.sql',1453226132,NULL),('phabricator:20150618.harbor.2.stepauto.sql',1453226132,NULL),('phabricator:20150618.harbor.3.buildauto.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.1.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.2.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.3.sql',1453226132,NULL),('phabricator:20150621.phrase.1.sql',1453226132,NULL),('phabricator:20150621.phrase.2.sql',1453226132,NULL),('phabricator:20150622.bulk.1.job.sql',1453226132,NULL),('phabricator:20150622.bulk.2.task.sql',1453226132,NULL),('phabricator:20150622.bulk.3.xaction.sql',1453226132,NULL),('phabricator:20150622.bulk.4.edge.sql',1453226132,NULL),('phabricator:20150622.metamta.1.phid-col.sql',1453226132,NULL),('phabricator:20150622.metamta.2.phid-mig.php',1453226132,NULL),('phabricator:20150622.metamta.3.phid-key.sql',1453226132,NULL),('phabricator:20150622.metamta.4.actor-phid-col.sql',1453226132,NULL),('phabricator:20150622.metamta.5.actor-phid-mig.php',1453226132,NULL),('phabricator:20150622.metamta.6.actor-phid-key.sql',1453226132,NULL),('phabricator:20150624.spaces.1.repo.sql',1453226132,NULL),('phabricator:20150626.spaces.1.calendar.sql',1453226132,NULL),('phabricator:20150630.herald.1.sql',1453226132,NULL),('phabricator:20150630.herald.2.sql',1453226132,NULL),('phabricator:20150701.herald.1.sql',1453226132,NULL),('phabricator:20150701.herald.2.sql',1453226132,NULL),('phabricator:20150702.spaces.1.slowvote.sql',1453226133,NULL),('phabricator:20150706.herald.1.sql',1453226133,NULL),('phabricator:20150707.herald.1.sql',1453226133,NULL),('phabricator:20150708.arcanistproject.sql',1453226133,NULL),('phabricator:20150708.herald.1.sql',1453226133,NULL),('phabricator:20150708.herald.2.sql',1453226133,NULL),('phabricator:20150708.herald.3.sql',1453226133,NULL),('phabricator:20150712.badges.1.sql',1453226133,NULL),('phabricator:20150714.spaces.countdown.1.sql',1453226133,NULL),('phabricator:20150717.herald.1.sql',1453226133,NULL),('phabricator:20150719.countdown.1.sql',1453226133,NULL),('phabricator:20150719.countdown.2.sql',1453226133,NULL),('phabricator:20150719.countdown.3.sql',1453226133,NULL),('phabricator:20150721.phurl.1.url.sql',1453226133,NULL),('phabricator:20150721.phurl.2.xaction.sql',1453226133,NULL),('phabricator:20150721.phurl.3.xactioncomment.sql',1453226133,NULL),('phabricator:20150721.phurl.4.url.sql',1453226133,NULL),('phabricator:20150721.phurl.5.edge.sql',1453226133,NULL),('phabricator:20150721.phurl.6.alias.sql',1453226133,NULL),('phabricator:20150721.phurl.7.authorphid.sql',1453226133,NULL),('phabricator:20150722.dashboard.1.sql',1453226133,NULL),('phabricator:20150722.dashboard.2.sql',1453226133,NULL),('phabricator:20150723.countdown.1.sql',1453226133,NULL),('phabricator:20150724.badges.comments.1.sql',1453226133,NULL),('phabricator:20150724.countdown.comments.1.sql',1453226133,NULL),('phabricator:20150725.badges.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.badges.mailkey.2.php',1453226133,NULL),('phabricator:20150725.badges.viewpolicy.3.sql',1453226133,NULL),('phabricator:20150725.countdown.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.countdown.mailkey.2.php',1453226133,NULL),('phabricator:20150725.slowvote.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.slowvote.mailkey.2.php',1453226133,NULL),('phabricator:20150727.heraldaction.1.sql',1453226133,NULL),('phabricator:20150730.herald.1.sql',1453226133,NULL),('phabricator:20150730.herald.2.sql',1453226133,NULL),('phabricator:20150730.herald.3.sql',1453226133,NULL),('phabricator:20150730.herald.4.sql',1453226133,NULL),('phabricator:20150730.herald.5.sql',1453226133,NULL),('phabricator:20150730.herald.6.sql',1453226133,NULL),('phabricator:20150730.herald.7.sql',1453226133,NULL),('phabricator:20150803.herald.1.sql',1453226133,NULL),('phabricator:20150803.herald.2.sql',1453226133,NULL),('phabricator:20150804.ponder.answer.mailkey.1.sql',1453226133,NULL),('phabricator:20150804.ponder.answer.mailkey.2.php',1453226133,NULL),('phabricator:20150804.ponder.question.1.sql',1453226133,NULL),('phabricator:20150804.ponder.question.2.sql',1453226133,NULL),('phabricator:20150804.ponder.question.3.sql',1453226133,NULL),('phabricator:20150804.ponder.spaces.4.sql',1453226133,NULL),('phabricator:20150805.paste.status.1.sql',1453226133,NULL),('phabricator:20150805.paste.status.2.sql',1453226133,NULL),('phabricator:20150806.ponder.answer.1.sql',1453226133,NULL),('phabricator:20150806.ponder.editpolicy.2.sql',1453226133,NULL),('phabricator:20150806.ponder.status.1.sql',1453226133,NULL),('phabricator:20150806.ponder.status.2.sql',1453226133,NULL),('phabricator:20150806.ponder.status.3.sql',1453226133,NULL),('phabricator:20150808.ponder.vote.1.sql',1453226133,NULL),('phabricator:20150808.ponder.vote.2.sql',1453226133,NULL),('phabricator:20150812.ponder.answer.1.sql',1453226133,NULL),('phabricator:20150812.ponder.answer.2.sql',1453226133,NULL),('phabricator:20150814.harbormater.artifact.phid.sql',1453226133,NULL),('phabricator:20150815.owners.status.1.sql',1453226133,NULL),('phabricator:20150815.owners.status.2.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.1.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.2.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.3.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.4.sql',1453226133,NULL),('phabricator:20150828.ponder.wiki.1.sql',1453226133,NULL),('phabricator:20150829.ponder.dupe.1.sql',1453226133,NULL),('phabricator:20150904.herald.1.sql',1453226133,NULL),('phabricator:20150906.mailinglist.sql',1453226133,NULL),('phabricator:20150910.owners.custom.1.sql',1453226133,NULL),('phabricator:20150916.drydock.slotlocks.1.sql',1453226133,NULL),('phabricator:20150922.drydock.commands.1.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.1.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.2.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.3.sql',1453226133,NULL),('phabricator:20150923.drydock.taskid.1.sql',1453226133,NULL),('phabricator:20150924.drydock.disable.1.sql',1453226133,NULL),('phabricator:20150924.drydock.status.1.sql',1453226133,NULL),('phabricator:20150928.drydock.rexpire.1.sql',1453226133,NULL),('phabricator:20150930.drydock.log.1.sql',1453226134,NULL),('phabricator:20151001.drydock.rname.1.sql',1453226134,NULL),('phabricator:20151002.dashboard.status.1.sql',1453226134,NULL),('phabricator:20151002.harbormaster.bparam.1.sql',1453226134,NULL),('phabricator:20151009.drydock.auth.1.sql',1453226134,NULL),('phabricator:20151010.drydock.auth.2.sql',1453226134,NULL),('phabricator:20151013.drydock.op.1.sql',1453226134,NULL),('phabricator:20151023.harborpolicy.1.sql',1453226134,NULL),('phabricator:20151023.harborpolicy.2.php',1453226134,NULL),('phabricator:20151023.patchduration.sql',1453226134,14142),('phabricator:20151030.harbormaster.initiator.sql',1453226134,35726),('phabricator:20151106.editengine.1.table.sql',1453226134,8030),('phabricator:20151106.editengine.2.xactions.sql',1453226134,7392),('phabricator:20151106.phame.post.mailkey.1.sql',1453226134,18595),('phabricator:20151106.phame.post.mailkey.2.php',1453226134,1616),('phabricator:20151107.phame.blog.mailkey.1.sql',1453226134,19832),('phabricator:20151107.phame.blog.mailkey.2.php',1453226134,1389),('phabricator:20151108.phame.blog.joinpolicy.sql',1453226134,16415),('phabricator:20151108.xhpast.stderr.sql',1453226134,24424),('phabricator:20151109.phame.post.comments.1.sql',1453226134,8007),('phabricator:20151109.repository.coverage.1.sql',1453226134,1405),('phabricator:20151109.xhpast.db.1.sql',1453226134,1559),('phabricator:20151109.xhpast.db.2.sql',1453226134,599),('phabricator:20151110.daemonenvhash.sql',1453226134,39904),('phabricator:20151111.phame.blog.archive.1.sql',1453226134,15720),('phabricator:20151111.phame.blog.archive.2.sql',1453226134,534),('phabricator:20151112.herald.edge.sql',1453226134,13618),('phabricator:20151116.owners.edge.sql',1453226134,13570),('phabricator:20151128.phame.blog.picture.1.sql',1453226134,15964),('phabricator:20151130.phurl.mailkey.1.sql',1453226134,10402),('phabricator:20151130.phurl.mailkey.2.php',1453226134,1457),('phabricator:20151202.versioneddraft.1.sql',1453226134,8923),('phabricator:20151207.editengine.1.sql',1453226134,76111),('phabricator:20151210.land.1.refphid.sql',1453226134,19463),('phabricator:20151210.land.2.refphid.php',1453226134,833),('phabricator:20151215.phame.1.autotitle.sql',1453226134,21510),('phabricator:20151218.key.1.keyphid.sql',1453226134,14834),('phabricator:20151218.key.2.keyphid.php',1453226134,429),('phabricator:20151219.proj.01.prislug.sql',1453226134,21059),('phabricator:20151219.proj.02.prislugkey.sql',1453226134,16233),('phabricator:20151219.proj.03.copyslug.sql',1453226134,474),('phabricator:20151219.proj.04.dropslugkey.sql',1453226134,7782),('phabricator:20151219.proj.05.dropslug.sql',1453226134,20865),('phabricator:20151219.proj.06.defaultpolicy.php',1453226134,1358),('phabricator:20151219.proj.07.viewnull.sql',1453226134,16753),('phabricator:20151219.proj.08.editnull.sql',1453226134,13683),('phabricator:20151219.proj.09.joinnull.sql',1453226134,10924),('phabricator:20151219.proj.10.subcolumns.sql',1453226134,129879),('phabricator:20151219.proj.11.subprojectphids.sql',1453226135,26586),('phabricator:20151221.search.1.version.sql',1453226135,14029),('phabricator:20151221.search.2.ownersngrams.sql',1453226135,7390),('phabricator:20151221.search.3.reindex.php',1453226135,436),('phabricator:20151223.proj.01.paths.sql',1453226135,22387),('phabricator:20151223.proj.02.depths.sql',1453226135,28069),('phabricator:20151223.proj.03.pathkey.sql',1453226135,12562),('phabricator:20151223.proj.04.keycol.sql',1453226135,24719),('phabricator:20151223.proj.05.updatekeys.php',1453226135,463),('phabricator:20151223.proj.06.uniq.sql',1453226135,12857),('phabricator:20151226.reop.1.sql',1453226135,19351),('phabricator:20151227.proj.01.materialize.sql',1453226135,697),('phabricator:20151231.proj.01.icon.php',1453226135,3273),('phabricator:20160102.badges.award.sql',1460653169,28851),('phabricator:20160110.repo.01.slug.sql',1453226135,31556),('phabricator:20160110.repo.02.slug.php',1453226135,461),('phabricator:20160111.repo.01.slugx.sql',1453226135,745),('phabricator:20160112.repo.01.uri.sql',1453226135,7698),('phabricator:20160112.repo.02.uri.index.php',1453226135,437),('phabricator:20160113.propanel.1.storage.sql',1453226135,6273),('phabricator:20160113.propanel.2.xaction.sql',1453226135,7608),('phabricator:20160119.project.1.silence.sql',1460653169,2940),('phabricator:20160122.project.1.boarddefault.php',1460653169,8772),('phabricator:20160124.people.1.icon.sql',1460653169,63227),('phabricator:20160124.people.2.icondefault.sql',1460653169,2535),('phabricator:20160128.repo.1.pull.sql',1460653169,23829),('phabricator:20160202.board.1.proxy.sql',1460653169,58085),('phabricator:20160202.ipv6.1.sql',1460653169,128186),('phabricator:20160202.ipv6.2.php',1460653169,12281),('phabricator:20160206.cover.1.sql',1460653169,114248),('phabricator:20160208.task.1.sql',1460653169,109046),('phabricator:20160208.task.2.sql',1460653170,111324),('phabricator:20160208.task.3.sql',1460653170,97594),('phabricator:20160212.proj.1.sql',1460653170,84891),('phabricator:20160212.proj.2.sql',1460653170,1331),('phabricator:20160215.owners.policy.1.sql',1460653170,44212),('phabricator:20160215.owners.policy.2.sql',1460653170,44138),('phabricator:20160215.owners.policy.3.sql',1460653170,1449),('phabricator:20160215.owners.policy.4.sql',1460653170,1481),('phabricator:20160218.callsigns.1.sql',1460653170,77389),('phabricator:20160221.almanac.1.devicen.sql',1460653170,23888),('phabricator:20160221.almanac.2.devicei.php',1460653170,4374),('phabricator:20160221.almanac.3.servicen.sql',1460653170,25244),('phabricator:20160221.almanac.4.servicei.php',1460653170,2351),('phabricator:20160221.almanac.5.networkn.sql',1460653170,27635),('phabricator:20160221.almanac.6.networki.php',1460653170,2022),('phabricator:20160221.almanac.7.namespacen.sql',1460653170,26017),('phabricator:20160221.almanac.8.namespace.sql',1460653170,30275),('phabricator:20160221.almanac.9.namespacex.sql',1460653170,30884),('phabricator:20160222.almanac.1.properties.php',1460653170,13907),('phabricator:20160223.almanac.1.bound.sql',1460653170,56488),('phabricator:20160223.almanac.2.lockbind.sql',1460653170,1291),('phabricator:20160223.almanac.3.devicelock.sql',1460653170,55174),('phabricator:20160223.almanac.4.servicelock.sql',1460653170,71362),('phabricator:20160223.paste.fileedges.php',1460653171,10785),('phabricator:20160225.almanac.1.disablebinding.sql',1460653171,67378),('phabricator:20160225.almanac.2.stype.sql',1460653171,9026),('phabricator:20160225.almanac.3.stype.php',1460653171,1519),('phabricator:20160227.harbormaster.1.plann.sql',1460653171,28235),('phabricator:20160227.harbormaster.2.plani.php',1460653171,7500),('phabricator:20160303.drydock.1.bluen.sql',1460653171,26880),('phabricator:20160303.drydock.2.bluei.php',1460653171,10935),('phabricator:20160303.drydock.3.edge.sql',1460653171,64980),('phabricator:20160308.nuance.01.disabled.sql',1460653171,55987),('phabricator:20160308.nuance.02.cursordata.sql',1460653171,32896),('phabricator:20160308.nuance.03.sourcen.sql',1460653171,43693),('phabricator:20160308.nuance.04.sourcei.php',1460653171,3414),('phabricator:20160308.nuance.05.sourcename.sql',1460653171,73276),('phabricator:20160308.nuance.06.label.sql',1460653171,79843),('phabricator:20160308.nuance.07.itemtype.sql',1460653171,84715),('phabricator:20160308.nuance.08.itemkey.sql',1460653171,92712),('phabricator:20160308.nuance.09.itemcontainer.sql',1460653171,107668),('phabricator:20160308.nuance.10.itemkeyu.sql',1460653171,1478),('phabricator:20160308.nuance.11.requestor.sql',1460653172,83477),('phabricator:20160308.nuance.12.queue.sql',1460653172,89754),('phabricator:20160316.lfs.01.token.resource.sql',1460653172,8673),('phabricator:20160316.lfs.02.token.user.sql',1460653172,64044),('phabricator:20160316.lfs.03.token.properties.sql',1460653172,63014),('phabricator:20160316.lfs.04.token.default.sql',1460653172,2385),('phabricator:20160317.lfs.01.ref.sql',1460653172,28213),('phabricator:20160321.nuance.01.taskbridge.sql',1460653172,125616),('phabricator:20160322.nuance.01.itemcommand.sql',1460653172,31437),('phabricator:20160323.badgemigrate.sql',1460653172,1893),('phabricator:20160329.nuance.01.requestor.sql',1460653172,13056),('phabricator:20160329.nuance.02.requestorsource.sql',1460653172,20392),('phabricator:20160329.nuance.03.requestorxaction.sql',1460653172,16983),('phabricator:20160329.nuance.04.requestorcomment.sql',1460653172,14028),('phabricator:20160330.badges.migratequality.sql',1460653172,80028),('phabricator:20160330.badges.qualityxaction.mig.sql',1460653172,6547),('phabricator:20160331.fund.comments.1.sql',1460653172,42527),('phabricator:20160404.oauth.1.xaction.sql',1460653172,32049),('phabricator:20160405.oauth.2.disable.sql',1460653172,64763),('phabricator:20160406.badges.ngrams.php',1460653172,4520),('phabricator:20160406.badges.ngrams.sql',1460653172,37248),('phabricator:20160406.columns.1.php',1460653172,12903),('phabricator:daemonstatus.sql',1453226123,NULL),('phabricator:daemonstatuskey.sql',1453226123,NULL),('phabricator:daemontaskarchive.sql',1453226124,NULL),('phabricator:db.almanac',1453226117,NULL),('phabricator:db.audit',1453226117,NULL),('phabricator:db.auth',1453226117,NULL),('phabricator:db.badges',1453226117,NULL),('phabricator:db.cache',1453226117,NULL),('phabricator:db.calendar',1453226117,NULL),('phabricator:db.chatlog',1453226117,NULL),('phabricator:db.conduit',1453226117,NULL),('phabricator:db.config',1453226117,NULL),('phabricator:db.conpherence',1453226117,NULL),('phabricator:db.countdown',1453226117,NULL),('phabricator:db.daemon',1453226117,NULL),('phabricator:db.dashboard',1453226117,NULL),('phabricator:db.differential',1453226117,NULL),('phabricator:db.diviner',1453226117,NULL),('phabricator:db.doorkeeper',1453226117,NULL),('phabricator:db.draft',1453226117,NULL),('phabricator:db.drydock',1453226117,NULL),('phabricator:db.fact',1453226117,NULL),('phabricator:db.feed',1453226117,NULL),('phabricator:db.file',1453226117,NULL),('phabricator:db.flag',1453226117,NULL),('phabricator:db.fund',1453226117,NULL),('phabricator:db.harbormaster',1453226117,NULL),('phabricator:db.herald',1453226117,NULL),('phabricator:db.legalpad',1453226117,NULL),('phabricator:db.maniphest',1453226117,NULL),('phabricator:db.meta_data',1453226117,NULL),('phabricator:db.metamta',1453226117,NULL),('phabricator:db.multimeter',1453226117,NULL),('phabricator:db.nuance',1453226117,NULL),('phabricator:db.oauth_server',1453226117,NULL),('phabricator:db.owners',1453226117,NULL),('phabricator:db.passphrase',1453226117,NULL),('phabricator:db.pastebin',1453226117,NULL),('phabricator:db.phame',1453226117,NULL),('phabricator:db.phlux',1453226117,NULL),('phabricator:db.pholio',1453226117,NULL),('phabricator:db.phortune',1453226117,NULL),('phabricator:db.phragment',1453226117,NULL),('phabricator:db.phrequent',1453226117,NULL),('phabricator:db.phriction',1453226117,NULL),('phabricator:db.phurl',1453226117,NULL),('phabricator:db.policy',1453226117,NULL),('phabricator:db.ponder',1453226117,NULL),('phabricator:db.project',1453226117,NULL),('phabricator:db.releeph',1453226117,NULL),('phabricator:db.repository',1453226117,NULL),('phabricator:db.search',1453226117,NULL),('phabricator:db.slowvote',1453226117,NULL),('phabricator:db.spaces',1453226117,NULL),('phabricator:db.system',1453226117,NULL),('phabricator:db.timeline',1453226117,NULL),('phabricator:db.token',1453226117,NULL),('phabricator:db.user',1453226117,NULL),('phabricator:db.worker',1453226117,NULL),('phabricator:db.xhpast',1453226117,NULL),('phabricator:db.xhpastview',1453226117,NULL),('phabricator:db.xhprof',1453226117,NULL),('phabricator:differentialbookmarks.sql',1453226123,NULL),('phabricator:draft-metadata.sql',1453226123,NULL),('phabricator:dropfileproxyimage.sql',1453226124,NULL),('phabricator:drydockresoucetype.sql',1453226124,NULL),('phabricator:drydocktaskid.sql',1453226124,NULL),('phabricator:edgetype.sql',1453226123,NULL),('phabricator:emailtable.sql',1453226123,NULL),('phabricator:emailtableport.sql',1453226123,NULL),('phabricator:emailtableremove.sql',1453226123,NULL),('phabricator:fact-raw.sql',1453226123,NULL),('phabricator:harbormasterobject.sql',1453226123,NULL),('phabricator:holidays.sql',1453226123,NULL),('phabricator:ldapinfo.sql',1453226123,NULL),('phabricator:legalpad-mailkey-populate.php',1453226125,NULL),('phabricator:legalpad-mailkey.sql',1453226125,NULL),('phabricator:liskcounters-task.sql',1453226124,NULL),('phabricator:liskcounters.php',1453226124,NULL),('phabricator:liskcounters.sql',1453226124,NULL),('phabricator:maniphestxcache.sql',1453226123,NULL),('phabricator:markupcache.sql',1453226123,NULL),('phabricator:migrate-differential-dependencies.php',1453226123,NULL),('phabricator:migrate-maniphest-dependencies.php',1453226123,NULL),('phabricator:migrate-maniphest-revisions.php',1453226123,NULL),('phabricator:migrate-project-edges.php',1453226123,NULL),('phabricator:owners-exclude.sql',1453226124,NULL),('phabricator:pastepolicy.sql',1453226123,NULL),('phabricator:phameblog.sql',1453226123,NULL),('phabricator:phamedomain.sql',1453226123,NULL),('phabricator:phameoneblog.sql',1453226123,NULL),('phabricator:phamepolicy.sql',1453226123,NULL),('phabricator:phiddrop.sql',1453226123,NULL),('phabricator:pholio.sql',1453226124,NULL),('phabricator:policy-project.sql',1453226123,NULL),('phabricator:ponder-comments.sql',1453226123,NULL),('phabricator:ponder-mailkey-populate.php',1453226123,NULL),('phabricator:ponder-mailkey.sql',1453226123,NULL),('phabricator:ponder.sql',1453226123,NULL),('phabricator:releeph.sql',1453226124,NULL),('phabricator:repository-lint.sql',1453226124,NULL),('phabricator:statustxt.sql',1453226124,NULL),('phabricator:symbolcontexts.sql',1453226123,NULL),('phabricator:testdatabase.sql',1453226123,NULL),('phabricator:threadtopic.sql',1453226123,NULL),('phabricator:userstatus.sql',1453226123,NULL),('phabricator:usertranslation.sql',1453226123,NULL),('phabricator:xhprof.sql',1453226123,NULL);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `callsign` (`callsign`),
  UNIQUE KEY `key_slug` (`repositorySlug`),
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
-- Current Database: `dbprefixgoeshere_search`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbprefixgoeshere_search` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `dbprefixgoeshere_search`;

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
  KEY `documentCreated` (`documentCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_document`
--

LOCK TABLES `search_document` WRITE;
/*!40000 ALTER TABLE `search_document` DISABLE KEYS */;
INSERT INTO `search_document` VALUES ('PHID-USER-qqmzvldb35airtloynr6','USER','superadmin (superadmin)',1460653226,1460653227);
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
INSERT INTO `search_documentfield` VALUES ('PHID-USER-qqmzvldb35airtloynr6','USER','titl',NULL,'superadmin (superadmin)');
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
INSERT INTO `search_documentrelationship` VALUES ('PHID-USER-qqmzvldb35airtloynr6','PHID-USER-qqmzvldb35airtloynr6','open','USER',1460653227);
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
INSERT INTO `search_indexversion` VALUES (1,'PHID-USER-qqmzvldb35airtloynr6','fulltext','none:none');
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
INSERT INTO `phabricator_session` VALUES (1,'PHID-USER-qqmzvldb35airtloynr6','web','f067d237e8b583db12b1e4104d41a16ebe625235',1460653227,1463245227,NULL,0,1);
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
  `sex` varchar(4) COLLATE utf8mb4_bin DEFAULT NULL,
  `translation` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `passwordSalt` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `passwordHash` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `profileImagePHID` varbinary(64) DEFAULT NULL,
  `consoleEnabled` tinyint(1) NOT NULL,
  `consoleVisible` tinyint(1) NOT NULL,
  `consoleTab` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `conduitCertificate` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `isSystemAgent` tinyint(1) NOT NULL DEFAULT '0',
  `isDisabled` tinyint(1) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `timezoneIdentifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `isEmailVerified` int(10) unsigned NOT NULL,
  `isApproved` int(10) unsigned NOT NULL,
  `accountSecret` binary(64) NOT NULL,
  `isEnrolledInMultiFactor` tinyint(1) NOT NULL DEFAULT '0',
  `profileImageCache` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
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
INSERT INTO `user` VALUES (1,'PHID-USER-qqmzvldb35airtloynr6','superadmin','superadmin',NULL,NULL,'79ab0c7dd686c99963f395c0e9c0fb91','bcrypt:$2y$11$EvLX5kNl/N1J/yxcwYmACOIRuw3A7FfjMcahZRaDIj8pfcLZrZC3S',1460653226,1460653227,NULL,0,0,'','xnz3lm6t2uedpneheivsslrzi2b3z5sxtl4vdtnsx6ssbn32ixkojobqkpp6lx33rlctwyg7pjymmhuxxp3nhkbp7oibvbpxcadz6udkdjqc2excd6dzj7lc4fpb3rcpsnvvsiv44lj36ye2z4tpwu4h5fo2ouy3z5de3pmvxfc26ey75zpl74ajteghaortyfpc7x3yvut36wpmwvijkfsdykhw4ll64pbtlwz2a2pvlha7jyryju4uerjpnq4',0,0,1,'',1,1,'jmaowgim5ltrjw45wrrevnzqbppc744a5vdigufdtuf4dkbymmqjvmjtqtq3kzrg',0,'x3hVxWVcmUD_,https://phabtest-hing.cloudron.me/res/phabricator/e132bb6a/rsrc/image/avatar.png','{\"until\":null}',1460912427,0);
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
INSERT INTO `user_email` VALUES (1,'PHID-USER-qqmzvldb35airtloynr6','admin@server.test',1,1,'5qkbw5bsp5ecchtc63oh73cp',1460653226,1460653226);
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
INSERT INTO `user_externalaccount` VALUES (1,'PHID-XUSR-ypx2wnp676gal5sznvgf','PHID-USER-qqmzvldb35airtloynr6','password','self','j6cxmzteddwew5f66oa7kssnq53lxaa3','PHID-USER-qqmzvldb35airtloynr6',NULL,1460653227,1460653227,NULL,NULL,NULL,0,NULL,NULL,'[]');
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
INSERT INTO `user_log` VALUES (1,'PHID-USER-qqmzvldb35airtloynr6','PHID-USER-qqmzvldb35airtloynr6','create','null','\"admin@server.test\"','{\"host\":\"phabtest\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/49.0.2623.112 Safari\\/537.36\"}',1460653226,1460653226,'172.17.0.1',NULL),(2,'PHID-USER-qqmzvldb35airtloynr6','PHID-USER-qqmzvldb35airtloynr6','change-password','null','null','{\"host\":\"phabtest\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/49.0.2623.112 Safari\\/537.36\"}',1460653227,1460653227,'172.17.0.1',NULL),(3,'PHID-USER-qqmzvldb35airtloynr6','PHID-USER-qqmzvldb35airtloynr6','admin','false','true','{\"host\":\"phabtest\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/49.0.2623.112 Safari\\/537.36\"}',1460653227,1460653227,'172.17.0.1',NULL),(4,NULL,'PHID-USER-qqmzvldb35airtloynr6','login-partial','null','null','{\"session_type\":\"web\",\"host\":\"phabtest\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/49.0.2623.112 Safari\\/537.36\"}',1460653227,1460653227,'172.17.0.1','f067d237e8b583db12b1e4104d41a16ebe625235'),(5,'PHID-USER-qqmzvldb35airtloynr6','PHID-USER-qqmzvldb35airtloynr6','login-full','null','null','{\"host\":\"phabtest\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/49.0.2623.112 Safari\\/537.36\"}',1460653227,1460653227,'172.17.0.1','f067d237e8b583db12b1e4104d41a16ebe625235');
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
  `userPHID` varbinary(64) NOT NULL,
  `preferences` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userPHID` (`userPHID`)
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
INSERT INTO `worker_archivetask` VALUES (3,'PhabricatorSearchWorker','33:1460653227:phabtest:52',1460660427,0,1,0,302249,1460653227,1460653227,4000,NULL),(4,'PhabricatorSearchWorker','33:1460653227:phabtest:53',1460660427,0,2,0,6211,1460653227,1460653227,4000,NULL),(5,'PhabricatorSearchWorker','33:1460653227:phabtest:54',1460660427,0,3,0,5439,1460653227,1460653227,4000,NULL),(6,'PhabricatorApplicationTransactionPublishWorker','33:1460653250:phabtest:77',1460660450,0,4,1,0,1460653250,1460653250,1000,'PHID-AUTH-yfcmdcjz4wip5ucjqbre'),(7,'PhabricatorApplicationTransactionPublishWorker','73:1460653270:phabtest:16',1460660470,0,5,0,103391,1460653270,1460653270,1000,'PHID-AUTH-ghyzqayeis7nrysrya3h');
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
INSERT INTO `worker_taskdata` VALUES (1,'{\"documentPHID\":\"PHID-USER-qqmzvldb35airtloynr6\",\"parameters\":[]}'),(2,'{\"documentPHID\":\"PHID-USER-qqmzvldb35airtloynr6\",\"parameters\":[]}'),(3,'{\"documentPHID\":\"PHID-USER-qqmzvldb35airtloynr6\",\"parameters\":[]}'),(4,'{\"objectPHID\":\"PHID-AUTH-yfcmdcjz4wip5ucjqbre\",\"actorPHID\":\"PHID-USER-qqmzvldb35airtloynr6\",\"xactionPHIDs\":[],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}'),(5,'{\"objectPHID\":\"PHID-AUTH-ghyzqayeis7nrysrya3h\",\"actorPHID\":\"PHID-USER-qqmzvldb35airtloynr6\",\"xactionPHIDs\":[\"PHID-XACT-AUTH-hs5ur45gu5k5ypp\",\"PHID-XACT-AUTH-boeshdwpovykdum\",\"PHID-XACT-AUTH-jmkp466qri7oaai\",\"PHID-XACT-AUTH-6rmb7z6oia36nl3\",\"PHID-XACT-AUTH-2gfblklhcjcsyon\",\"PHID-XACT-AUTH-7dbciiwdvhj7k2p\",\"PHID-XACT-AUTH-v6av2hlxqhnz2ls\",\"PHID-XACT-AUTH-g3ylsphykk6yzwr\",\"PHID-XACT-AUTH-rew22ntnze2baks\",\"PHID-XACT-AUTH-asxs2mkmez3jqll\",\"PHID-XACT-AUTH-ikvicsieto7xufh\"],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}');
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

-- Dump completed on 2016-04-14 17:01:41
