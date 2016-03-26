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
INSERT INTO `auth_providerconfig` VALUES (1,'PHID-AUTH-yl5ljr3wjx5aehvbhb5f','PhabricatorPasswordAuthProvider','password','self',1,1,1,1,1,0,'[]',1458950072,1458950072,0),(2,'PHID-AUTH-2nepldfmps6nbfb2zhvw','PhabricatorLDAPAuthProvider','ldap','self',1,1,1,1,1,1,'{\"ldap:port\":\"389\",\"ldap:version\":\"3\",\"ldap:host\":\"\",\"ldap:dn\":\"\",\"ldap:search-attribute\":\"\",\"ldap:anoynmous-username\":\"superadmin\",\"ldap:anonymous-password\":\"changeme123\",\"ldap:username-attribute\":\"\",\"ldap:realname-attributes\":[],\"ldap:activedirectory-domain\":\"\"}',1458950094,1458950094,0);
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
INSERT INTO `auth_providerconfigtransaction` VALUES (1,'PHID-XACT-AUTH-vledkhmneylb3vu','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:trustEmails','0','1','[]','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(2,'PHID-XACT-AUTH-mktyewcsppvg7zs','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:host\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(3,'PHID-XACT-AUTH-np6tgbo4hyar3y2','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','389','\"389\"','{\"auth:property\":\"ldap:port\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(4,'PHID-XACT-AUTH-cvtmuvzev3uptel','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:dn\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(5,'PHID-XACT-AUTH-pecooyxfg74se45','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:search-attribute\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(6,'PHID-XACT-AUTH-fvseyi52a55zst3','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','null','\"superadmin\"','{\"auth:property\":\"ldap:anoynmous-username\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(7,'PHID-XACT-AUTH-2htcheor4n73fi7','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','null','\"changeme123\"','{\"auth:property\":\"ldap:anonymous-password\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(8,'PHID-XACT-AUTH-uldyufm3aegn64w','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:username-attribute\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(9,'PHID-XACT-AUTH-d4ppt42im4szrqr','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','null','[]','{\"auth:property\":\"ldap:realname-attributes\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(10,'PHID-XACT-AUTH-tonp726ca6a63yl','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','3','\"3\"','{\"auth:property\":\"ldap:version\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094),(11,'PHID-XACT-AUTH-3iswqcaap7nsz2d','PHID-USER-iamfox6yiijet2aeucts','PHID-AUTH-2nepldfmps6nbfb2zhvw','public','PHID-USER-iamfox6yiijet2aeucts',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:activedirectory-domain\"}','{\"source\":\"web\",\"params\":[]}',1458950094,1458950094);
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
-- Table structure for table `badges_badge`
--

DROP TABLE IF EXISTS `badges_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_badge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `flavor` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `quality` varchar(255) COLLATE utf8mb4_bin NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_general`
--

LOCK TABLES `cache_general` WRITE;
/*!40000 ALTER TABLE `cache_general` DISABLE KEYS */;
INSERT INTO `cache_general` VALUES (1,'KfK8e6XQsQaP','phabricator:celerity:/res/phabricator/8bdb2835/rsrc/css/font/font-aleo.c-7fvq7wpxrde1','deflate','­’Knƒ0\0÷=E¥,RSó­,šå	’ƒ‘1MPÕ»(eÅDağÃš±¬9qYê‡¿Æ¯K!ÚÄú(­ã0ºb‘ŸuÂ¤È~µn&¥TÇZ¥I£Ä(¬Iu¦Š´T$ó3ŸaF‰ê¶¼iT%ˆšô~xzì+Jm?Œô¾+7ûéyzxV½·ğÒq2Ì²ÂR·ZöË¬’†œqßóL”WÉ¹7g~,bŸ…®®©aI°Ä˜1ä	_ëY¼V\rşwIAÅq\Z¡‰¢şÌwÓjNÖm°ìï“qc~‚„\0½=¾r\\…y#@­4¹öˆ,£ĞppíÆÿ¬÷•™ú4Æ$[ã¤¡‹4 ¦Š{ûô zã-S¢ã`¹Ò',1458950020,NULL),(2,'f2R.vANEu3rE','phabricator:celerity:/res/phabricator/c7ccd872/rsrc/css/font/font-lato.c-Dj4S0TLFyL2d','deflate','­–Ín£0€ïû+õ@#mƒméaû\0û•fR$\'DÆÙ6ªúîIZE«dm\\8 lóøfÄ#v[¿D©áí|µiía•ı–¾Ëz§W{gïs}¾{–ÊµzXpyÍjƒª€Ü\r!9¼zp[iû|Ì‘Û!äxZ:Xï­t?¡ó‹9“ıºkÛ×Å·ïŸvn#ı}Æ€Yv;ØúÃ²Å«T.dƒ‚•‘Ô—±¼<.Ü‚ÔĞa\näãJAŠŠ«H„÷W	ŞíáoK+ÃÑT±”şÏúnœ8¯‡lñp”îÚõ³_mÇ{šêıÁÂyæı1MÒJ6„\"7=·^ÚVœkE…®©8‰ƒ¦Z‰Úh¦Bö‚1UĞªl°bù‰~£…Æã z†©vîNµ³iPi¬u`Çª³&àæÄLs˜I‡æÉ@‡ÊáˆLór¨5U’ªˆ%Lµ’HQ°ELşD\'K)kJA|9â|#çë•ª¡´nL¨HGhT¿LÊ7‡™†PNˆ5‚pšŸÀéPt,ÆŸ/ôN#\r-Jú¸ $ºÊ+¡€	¯íÒØ§)ô_qÏmô/',1458950020,NULL),(3,'G_.240XDkwOI','phabricator:celerity:/res/phabricator/9cda225e/rsrc/css/phui/phui-fontki-hNxQ60x.0Uyr','raw','.diviner-document-section .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif;color:#000}.phui-document-view .phui-header-tall .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup h1.remarkup-header,.phui-document-view .phabricator-remarkup h2.remarkup-header,.phui-document-view .phabricator-remarkup h3.remarkup-header,.phui-document-view .phabricator-remarkup h4.remarkup-header,.phui-document-view .phabricator-remarkup h5.remarkup-header,.phui-document-view .phabricator-remarkup h6.remarkup-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup .remarkup-header{margin-bottom:8px}.phui-document-view .phabricator-remarkup h2.remarkup-header{padding:0 24px 8px 0;margin:32px 0 4px}',1458950020,NULL),(4,'u3PGH4Dj8lX1','phabricator:celerity:/res/phabricator/3010e992/rsrc/externals/javelin/co-ILq98pGCN3DS','deflate','…VÛnã6}ÏW8~0%Ø«î¾ÆáE Z,Š\0‹\0®aĞÑ¡I•¢ìfı{‡CÒ—XÎ>ÍÃ9‡C&«FåVh•¤­X%;¡\n½ËÒÖpÛ5íö*ÚvÓ-3W¥–…PÏ‹ŞğÚic«\r{áxóßÎš(¶á˜øáiæäù!ïi\Zo¥³ù4zÒ£Êú|³ª©Ë„™çfÃ•­Ói7í²•õq\r‡<.l²Ri»Ò&q;‚~\nqÛ›^rõlK0Ç¡2VUò5Q”“>ÿ™óôÂ® Eİô¬7D¨Ú2)IÚc[ò’m…6½ÆøI(aÁ! ´XÜİ_,èéçÛÛgDMjVğ‚®˜¬9*´r*×q÷µaµåfÁ·ĞK_|´­--tmÎ¢p/¹ûó„`õ‚E–2)nèõµÍÀrï=\0µ¶Cí;ˆv%³i{^Œ­¸ä£5ÌæzC-$~ù˜¿F£(e†³â5m}r&ÃÏ—™ö·á=_’DšŒÇBøøÖÒ#Ç‹©5¯h³¼¶2ûZñi—Cyeò_ÚæZY¡`ı6pí¡\Z¢#¥¤ĞÜIÛ=K]¼FÉÉw&\nJ€mk g¬~½†ê×ë[|,|½vüöºÙz=O€Äİ¾s…¨+,jqìñ;ƒÇ-uˆdµÉŞŞPá/A•^›¹ªÍ¥È_n¾Lêf¹öæK—FŞ3ƒßoÖ\Z±l,ïU&¤`–}Ú4µÍY£„“”B‡¾@kp?_¾3éx…lGueÔ;¾b„Šz”°õófz*Ä¥Ü®Ï¹>\ZísÀÉräö·åšçè¬«$ía›çùådş\0~—¿Á®ëÜ©âŠ-%¿•ïâÄugq˜i‹\'‰ŞqFë™sš{Şt{üÎÎpÚ^0$.~r~Â\'.#”íøsu”×Z–—èvHyĞ%D+2¾ÒÑgAì–ïcMgùE&¤XÊ(æ%SÏÏ9^ø+À_× ntSs˜™*ÊzËÍ^n‚wSùÿà(T…–Âè\nÿØ3,qN–œmyCºÊÁ\rÿV7y	ÜØø±ÑÛ½«\"Š9S9—ğå§Ÿn×ıÃö0B<‘È\n´µpå¢äö’\"°á’Ğ7ìÃ`]ÊÆ„°¨ãn9ğ\0È*èD)\n-ºòëôùg¿€<×:?_qXÅ1û¾ª“Q{Æ÷Äİ6“w1áVvÉ}%{’\\(ôW²WŞ_!t\0x\"~ {r£¥ŒíŒ½hu€\"º\0P¹g2ˆƒØ…ãåğhµ#Ì¬ã²Bãkot=?îÇ©ëOºá\'\'1¡ˆE-6„ŠGºàîÏâGLÃK†ãzƒQîˆŞ _×s½\'pV!!?ÍÔçø<šdàú3’ŸÏr÷í¯ßáu:¼ûÈäèıØSS‹5.Ö\Zs<¥p›h¢D¬‰-Eíè¥ƒ!Ü•ä–ÓAKÆäâ*ƒa\\fË€gG7ÍÎw«İµDeÁ8(ø\nOCü:…VŒóÔ¢ Gİ˜8¯·ÿüRç „_‰‡9¼ñöp‚ëßğ®EwÈAôt¶KÁş?',1458950020,NULL),(5,'RJ5XW2bhabPp','phabricator:celerity:/res/phabricator/027ba77e/rsrc/css/application/base-J__ZbJvSxL26','deflate','­“ËnÃ E%R¶Á\ZqºsİÁfb£Ø`Q{Uåß[µ‹”„,@Ù¡\r÷VË¸Y²8#é&ëŒü®ZFİÛëÕ2këÈŒn#î/Cğ›3_·ãÛ^P	\n¯Õ?’Ñá’I¡GÚ3ˆ(E6¬¥¢‰8M&DI \"H7m˜Ià\'%#Ê]îf˜hèûÌm7?Ã%ø³ğ—Ã?­ù=OÜMPÉÙû¡‘™d²VÇäÏX=†&ßˆç¼y’¢§×ìI0®dÊdÒCšK| …6ï¢4İ7#ß«KW¥@)Q³|\'ÊØ‰ªë7',1458950020,NULL),(6,'Wj0aC_wJ.613','phabricator:celerity:/res/phabricator/a93de192/core.pkg.css;-IXiPkFP_yhFA','deflate','ìıi“êH’0\nŸ_‘·Çúí©!ó ‰slîIˆ};<ÏØcÚ%Ğ†$p¬şûÕ\nZIòTõL_{»²ò$H¾p¦p}Ôó» ½î» ¼Ÿ´wS{×Ôw|W w~Ww}W\Zï–-¾K¦­¿Kª¨	è¾[ïœfò‡ãÉtÅwWyw…wîäº¦ñSgmY5¾?,VTCö?q¦-ˆöwàw—å4ñgôõƒ75µñ{ò!.÷áX,VüıŞœªË?ïP|¸¶è8ï<k¹ªi¼óªo\nâ» 2gÖş)™†ûá¸WMünø˜³Úğ‰\'ª²âÆ~÷û{Ò~jªó(jˆ¿\'p]å§+^ÜVSeã»&Jîï~7ı§gÑvUÕâ7®iı^³õ&~à¯™Ö9S~çü	}aëòö·¹(›âÛ²÷·÷ûÇ·µÈ½ÍDù¤±vúñüªû ü\'CÖ5ı?]Q;‹Focñ$şíışı°UV{wXÃùpD[•~ª-òAï¾k®ı#×½\'C\rÆñƒSõ»¨s¢ğƒcùƒl›\'Cøş¯îÿp?ünpÕık=ü`…ıÉqÃÑûaú£#i¦÷qıîğ¶?µ¿åX[d£Şª†âcâÆ´ğ¥øùhHü!óÇ4=ˆ\rëò»¥Ÿ şöç‡nŞ>Ì“«©†˜šÅ¨o‚È›6ö7|è“šiÿWnP$ôƒ?ÙÿÕ2UÃíßÙïJ€üÏ|M¿ï¢€ÿ= CAu,½~éÿ÷oÜÉ¹ş´LG\r‹Jê%3Ó_	úwÜºü°Ã	>yªà*ßaÈÿ¨Dd|şı›§ºÊ‡p²ƒáÖÄI7Ş\"¨Q]ÀƒbÁ“·o–rR?ü92>Îªè¥#‚L”%\nßYÉïÏO¿˜+úƒù—¿üHı¯‰¬íS¡«ü®Ø?cl@±ôds—,ÜpU|c}µÓĞRıe9ÇÇØßş/U·LÛe\r×‡®Zß*û7ä{ê÷·x€d\0€;±|WTAß¿Uç”´4)¨>Âoé¶CğìÉ5cháÇ`øù3ü–îĞh& IR)ø7öç£DqÑ>ª¤}:iš@ã‡p7÷úø¡¿ó_¸>¯ûà|–•£\"Ÿ­ø#u2d!q\'¡ÜD!\r„B©·Õ§ÓËw<à·—Ga€7¿ø›?øo¶Ì±ÿ¼ƒş¡è{Ğüoö-Û”¦ZDÀÓ–G\0Fš¸Àışí ^9“µ…ÉäONü¯0\"¡\'è¿Ä³Ê‹1³œís)×´?Ø)}„¬8 íÊ—®)Ëšøñ—©sğqŒW†à7©û$ÿ“ş¿¼ı¡VŠHçÚsU]ù®ú;Ê‡xöÛÌ¿RuV~@‚|Hª$‰¶_ÒgÍ…áÉ¿çÖEL—°SSÍCôüga#¼©ıNrü%pöwç´Ïı-?BĞß¿DC`í½F˜—Öf9=}¸Jü{¾—O’TM+áí“Î9¿Ê¼{Œ¼Á?|nÊ>*#~ÛÜûLä#\")Ed}N”~ï7h)Á8ù³â³6Ÿß2ÏÓÇÚßu§ª–?b§‹5ÄL³9¼›•Óïı©8YkÁ²ñqÖü–ïü­™l ö¼}ÓıåäO½ó?ùĞYçğşxï¯lYt³¯Ó€ü¹9„ì³1ı<?{ş$ş§FÍvCgU#ìì½@Ãgd–bÜÍ§kQ3-_ìmÛ/œïQ#;fÙê^\nûıÛŞç9á~ïÓI†VğI+ìÉoWäğ-ûÊ—ìR\'F{¯¬\n}V5Ó~añ¦&ÙtU)ø,şÌ(5ÃNe¦Âg™:¯ñG85ş ˜\0Y39Å“Lµ_ÆqíSÈlœL-à®ïf]—å•Ì‚£•ë·í^-‘\r–ƒÏ;œ“æ¦`À!rş‚àŠù ]Ğ§]‰5økH1–ÊÒäæú‡d³zŠí5B€¡TÄ«°¤«ØÅƒœôâÁM€ˆfı~ù²?G–&º)&¯Û´ü=+70Y÷EèÃ³Eÿ˜qğb€‘OtÒIÓ|òE#$ÇRˆ&Ì5MÍU­’ `¹˜ñ˜qà÷èdóÎ~‹8ÿíR{\"qGònú’[p@bCÒWYÇß¨“\"\'\'8A‰šÏ:#‘7”K:Å‡ùqÇËvÉ€øç.ıgnş\\Çõ¿qˆäÕF¿äl˜äû‡ï¾¤å7$¼«†urÿW@şÿñçÄéªû—ÿúùC>b¹\rjâ\0×Là’Ï@UáíşâQ#Üš¿û—Ï²dÛgÃşÂù7×|‹ø÷X²y«şâã“;<DÅ©ƒŠO)w	<Ş°ÃÓÃıˆjş‘&}(ãÅvØ`x,Î6ÍZÉQ9Àùäõ“¹\n6bìR’Lı#–æî’-j>\';ÇG¦€ì}ò†š˜r°®|h™¿w°Å)\0á&ŠÀ?çüôÃ/?“$J¾ÇUK¡s-¥†è\r›şóË6æÿ|ü3ÿ(ø[‘ÂB	ßqÌ—²÷oPB0ÿŠHËg41ş\Z°ÀòÄïØü‡’~DG”×¨ş÷Î7Ÿlƒ-3G`EV‚³èåÏšÏĞ-”e?{‘t§p¢ÍtÇÇÚ_6¼‘h—òßÿWòı¿~úÂ§¿V¾³šÏ­ş->dı\nü1ÀÇ©ıñqP\\]Ë<J}öÍmG¾td$ˆa†a­ßïÌ)ÜßÓ_\nêƒµVó©_`G ×àXà·üÑ&ÿpmßˆ6ğ\rtî¨FË!oêÉÏ/¯Q9‘Ïá[À7ø·§øˆF¡äÑÏ\\ç †%Ã´ˆ‚ÿ\Z[ÁpŸ`ÓjÅô³\'»ÏWĞ	«ä7™pq¿„Ya‘½Pæçëª¦•B¹²¥+§8He|ë®±xîóÅ$P²¾İ%Ì\"™Ñàå“WÅzğsË+Fï~æ{’ôC÷ÏUûKÿÍïÌfå\r(CVJTt¡ô¨ì\Z=Ú~ø™2Òê»´Â&œp‹\r¶\"¡†…‹ªò”6ÿ®à/ênã5ë??WÃ6QoİE×ÜĞEŒ;ÿ°b|ƒîª¾-=g”w±Ê\rB€œ+ Û¨óZì#˜dXPærŠ·`n<oÁO s+Ù£qª‰“xQ¦KZ‹Ç3œî²>¼±ßCáúg¬OÖåƒ÷|ñégº_ù‹|á·oşOtJş‘Õıj¢•J²Ínñ$é_0vè£óÁ¨&=ë>Şe5*Ê®å%êîÓŞ¯á««‚ ‰™V±Î‘PŞ¡¤ãùûíÜt×qG‚öÿŒ~D\\Ù‘§x~ÚÙçI6!¬ÔBÂ”tHæ!ƒ|V«]xˆ×B¡¦w!Á?Ä\'Ì\\ap»øY8ÿ$E\n{JùÙ­À7b¬\"m9D·6÷CÙ‡Æ:ntX6äóÑÜDÕÂBQİ@•öV…XX»™j(éÜ[D°Ø¦G8â$¹:,‹µ®°4àí1œ*§Æ4f‡ş”¿A@t }.êrÌ\r)aAe\0?é¤NÖ÷¹O ø‡—PF¢Oo³P~›õé½ìö8?MQ5Ñq’»_Z%×ÏwáÌy= Œû“\'´R‚Ä“kÃ°k)ÙEß£ÿ¿!¿½ºJş¼sEÆËÍUÈ|¹4_êÀÃª °èØÇ(å	‘<îx¥K8‹¤ÚN†W…“šğX2-¼~¡‰ˆùÿÌ5ÙÔ¢«İO!\\ág¾^jKVã{[Éàr§«Ì	lSíQrˆR\Z‹$÷“¯4ZqÚÉ!‘\\Şxö€5xÅÿÏÊ^ìY•ã+ÖTóÅí%#z¢Ñ(>\0ñŠmêb@Ú–CöÃqÙà²H_ı¬:\nD=%Š<üˆĞx%eFğ¤¨dšn\"•GÜ>¤ää„;D#şç.O‡ÚP -täôl…ŞÌ±r¦ô‚¹©‰Î]o±„m«Fh(ñ„„%„SşŸº(¨ì[Xÿçë/©¶ŞŠÔñV{¹;Ñ… 0»Ê†BâËOÅ\'™— gP}\\ô;>íºüÉõwJÍzs…÷ÊWÊ]4ød©Z\rWùY¢ÏÍyEİ—U™Bt§±Æ}ï+5ö(9¨¡(ú‰™Cî¼(	p‰ XÜlşLñG^Œ˜X×Ék¦#\n…ãl¸õ¸şj?ÉJ‚~~* T‹ËàDòöÌª\ZË©šê^?îª×ò×iT¼òLpQ•½€\0³GşZ\"l,ñ§ô»û~+5º©À2@£¨Í<ÙÚ¿	¬Ë~¿Ö-CöÁ;byWWädæƒlşãùR¡—rğ	ş™RÄÖÿÓZ¶§(<èlfíuw¶à  @íë!É]§©îædŸ[·İª¯m×3”ç5m\ZTè)ıİ^ŠcK­Oëõ©7BåN.h\nš)»Ãí@Û]¶@³\Z&»ãÎüJÔHgq–%yN$ÙÑ£G\"íqcêŠz[u¬\"‰Ô¦àvÏ.{Å–¡fŞ¤‹7Ö¤NÔ¤‹í ã!B!‡:2în‰·[Ëaï(œˆ8õl ‹î\Zi#²A{ÖŠËäE˜M\'Û°¨1Ál	OYînü||TÃq æËÕd6@©m¯÷¿UŒ}2ÏÿPÃo‡¿Û–Ç‹Æyuİ\rĞb¿a¶z·;X3]o¤ñ>_ÊûC{ãõúíÃeÄ`^_İ©ŠDôä\rq£9zTk\rø¾¾½­ç}}Á(£iitK©O4y\'O\rœÅ&­y8õ§µÖ\"ZhÒ1t<s™‰×¾ŒE¹>ƒ8ÓOoä½#w|D­ºK˜şƒºÆ¶†5Ãñ û³%JÛ‡¾,ËÿQ9É\"ıÇšƒçK`¡[GJë°;§&ÊÍ %pv7v:vÙøÔ‚¦x¿zWóŠzF±È@æj¹xœ=VY!¥¶ØHšÊìFˆ \\NÕ“Ú‚åX®x+\\ÑØÃP’à&”ˆ×M¾¦AI¤¯@Wàÿ~„\"_Î(2H)eÁp4S+h3°¿,‘¢ïæÉ—¸jÑ`96zŒ‡ènıºóº¢SÖLXçB9º`\ZU®;º7‘4İ” Xç-û$\Zûàöİló¡jO	ƒvbe{şqñ‰îK˜É™¸#¼¹_¢>,ÄWKñË7àä¼E·aQ›Ÿ•1?‡â|Vä“×éeÒà\">*uÜ†3“!+/Pœ¬ä|Y6eëgìéØ}:pŸŒÚgCöl¼âwŸRap§Åeû”«^UU-4\\1wŞ\Z\Z±E<$\"44¼¾ˆYG`õşhOcvW«¥Aáf¥TP4Ÿ{+Åä•kûyÎR|‰´NÜ‹÷‡1{iïãc™H·ùÎ*Ö?3\'éè8ım¹Ò’vr”‚á	ÿ~éWSˆóGàON¨š½¤ìIKî¡šÀ_ıi¼|$îHYÕ‹üÜ½g©9]²µ]_0J_Wgzhşƒı(î™e*‡mµhœn?QkÁÏvpÙÀûgëŸ©Ãèğ#ºn‹Ôá%‰/ßKß=Ìwv™{<ŞC²¢U÷Ÿ¡Îİ\06YÍ>ƒÊ§›§¸%N¹=-Ú?CÛæp	´çh¢a/¼úe%ˆÇd„şµºÌÛ·Ç“Ø;ç@”‘	Ø6Â79œÅ3Ê©ŒQe‹Râ5L|îÊ‹é«¬Hí”Tey>Ğâez‰©^Æ7µ¶¸\\¹~–¸©ÄEyÖºŸÄ€Jœ»Î9Rµ^ı³+û]RıĞÓÅä5Yå\'M.4ò,In%>„U\\«\ZHæUìâçÏup:ú—b½Ô=Àß·¡X¢}Ü=a7\\Rd!öÖiFW´Öxë)ó·°½€ÙGs”æÂùÍ.‡Ú[U] 5õ5Ø*¢Í¡¼x°ß\r +Ï7-¤EĞ@v@ÚhÏãğæ¦Eí>$áóğÑ]ß\'Œ²ù×ßşQPtfœèğHÁ©L½KûsìßKÇöå¾gnYãş>|R>¤)‡µ¬@f!‡&¥Y­õ£V|hñ$²Å_«dª°÷»Â»øî-²lZ$pt.§²ÒÌóˆßñöÑ’¶şıû÷d²Ãşøò¢âSHè»™Òn§Ü	+!\'‚W\0ÜwW°Tp6øe|B\rH¼gx².¢uQWEnqı^B„oee¯&JÙ3îó„Bè/CO\0Wvå¥Æ>ˆô\nFş±¤OOP}üóFhfû-UtXŞ\'Õ…Ÿ%†ƒñ´7¡f£ÙÊ[3¾ÂíJ¨4Z~•ë‹?ó%H9z»û§gG0ÅÈÂŸzP»ï/w+Mõ<±Å]Êæ÷W&·¤ŞPû#²Á/œÊÊ<9DMø?xÅ‚~Ò\\5³ØOJ%}RŒı›Òq\\2o÷	¼K|œEû\Zİ&nîH‘\n¾\nÏeıClâTM~ìHUºq¤y]‰l•§Š(ÅÏœ‰RVnHŸcâšßd_ğ(+X\Z?—;Jq®bi/õ·(ºÆC˜òŸ¼Ë…ŞåÓØí÷ª}ÿíÅ­¿Ğ|JØ)b›ì”Iw¾¡¢şä‹ïÛ_ô\Z,ÕÌ[ #Ç©îu!¿òt;•¬)¼\"Vùrª´Bäpù)97[¹»€[µÚBûˆY8ÏÀ~‡b¦Ç)èYÌØüıI9^ùCÀÏ£¢éÃ+\\DıÅSö\rwH™Ën<õàa[‚²şb¯w#\0ô\"Ùö^é¨ğöŒH\nhÅÅÓÃŒ¼ÂÛ3F‡’»ıÁkMg+åü·râKØX–íÜQÍqİj	\'bÄı	/]ß‹}°µ·h³ƒ*WHTÇg[ëoœq ‰œ‹GÌ€Š@\"ÑF±+õŸA|—Tè—’{¿3ôyŞİø:Ş£SW†ŸaRS*³ŸÉªã‹gô*Gˆ.o\nø³tÿûHÅŞÉ?ñì\\\"y}í3õK‰P,©š*Oâ=\0‰TßÙB™½\"³Öò‚pZ\rŒ…­ù\"ˆ|7oÑXG}|9)øÉ¡@¨¸â³drj2MeC1QîîGŞ<ÍÚ¢/ø7ÔEÅÎÑºYvUû¤bü)\"õå@±œXØ‘D#–psË#-!{£ØÏê-¾z.#şìÔA6±Šˆe›}Z;VCü| ò¥Úáº.)!\Z!ŸûHŸxB¿‚Üˆd$ÃÜšh¸H®ñìË øK¬*¸yÿBığe®ş§c›ñ{Á\nâÍç£õÀú9®UàbûecòV¹Ã?˜ù£/·ÊGpT¥3«Äì‘²Ğã©3[±¼£ı\0	w»‚%JŒ·oº_Qù%–÷ª2A¤¡(ìÛ}Œbtå:bp¹à‚kxèÿ•ŸÙ= (œ–\\‹¼(Ihn‚*‡/Ó/ğ|Óì˜=Ô`1äh{{Nz¦+ÅDæø\ZfYûúG3›¸Ø›âİ†>\n2VÙĞ}fÄs?oí›4œŠòB|ëšS‡äqx{«àK¥×vvÊ3¶ş/u9ü’V—f •;Ã¤¿Öˆ\'Š³û™Õ¨e‘¦0Šj5K.º_ï‡ŞO=ó§(ı87ÃÑjËjş^kß5ı¯„&iŠ¦s½$@¢A?J$ªÌ-èk=¾¿6æ\\Œ\'\"Ğœ@TŞœ¿ rq&+~3ÌˆÉÇ’P™ßâbÛû[^ä©ò€O¼^Êy~a\rD–‡@dÙó9#×§ğJj{š’wùŞ——JÇ*	øÌ_şëg:ÂÇ³}ÿ[7Îßx+eœ\\3£Ãâ=_bÔ“Óëù2€êwş-p³èø=ázÑö£wÕRàôüØbpZåöÿÁªş*ıËVÏ,ÍaWêØÁŸœÀ>%®›ÖËJ9İâg“Ÿ¾\nl\nJ=€sVáF?4Â÷s¯z[óÃ)óÒ}Pø\"\'ko–Ø§€ø×pŒ¿ÆÀów¾_t—€Üa7ˆÿ\'º½µÜ½;·AVÕ/y»Ãñ¢–½uÀGËC»hS²ÂÛ¨*®ïOùCG•ÅH5Àx/8ÀXJõ\ZF\0LP~jªP^£ü®+Sæ·±èLœ¯š¤ÔÙå„sšİ£›†Ü²\"?SvÌY5ZT&e1ß`UÅÜÎ×ıêP†ÀGhö3z©å\"±êÂ\"³ô¶-_%ÁÈ§Î.Pb¿Wn]É}YãóÀËt¾±Z6`V\"R••V\næXy”ªÙb~ÖNï¦À[´?Wø¨Uv¨äxÓÆÛÍ6õ»«”Í\\2ßJd¡@$‘Utş}¯z‡Ö©|š¿:Ù² 3•~&&ä)#|‹÷ÍÏ,›Û‚AP¶…)-‰._C™Wd…ge¶~8&˜êg~9+§—C» \ZÌŠÑFûx]İ¥¼D:ºK¶7\'ëïÒ—‡èòßÛ„‹d“\'·jYšxV\rJmå[Kåıé•oªñ*Ø·Ú«°Ã’¹€•/¶¢¼Ò€’F¾¨¡~¥™\0Å×Ú\nK–t¦œ±´,\nI€åÌ®qîê=êyõg|[øÅuÍ\\\"‚%7ÕxkÁí„3¯®*ìŸVŠÛäK|×G¬,ÿFEi½‹96^Ù•™eæì[¸¼Ë7+!zY\"õ——ÖMÃŒz+±ºª]¿ÿed\Z,oşå=xâ•»ª‚d|\rLaë©„{ü¹«î±’*q\'‘»?\\ÅĞRjqè«)Bk|­ƒÏğsdısÄ](®ä0tnÅ0„a`î†u>´@Éïø_‚ı5Ú‰>¢}(:\"¦dñÏ½ƒ{âR`ñ¶ñ3×ïbŒÜ!ãK\0cQâ32©â;ŠOaÌï|pZAjŠÈnõñ¤&,°U5ƒ¨ï¶\\-\nåÓAO—Ë‚aŸ‚÷§õàa©eahÃtMlzëO,EMx™Íd˜ÙFuırük¢À7W9éÜ[³æágÕˆ”3—Ä°«ñ„I\'éÒKò±$xw¸›>ûÆ³Æ™uòùt*n`¡ñ³8Pi¡PùQÕ¬ò-ªQÅÑ£·ÅŠVcE9åúYÑH\nHÚÉik¡8çÏ3Hê¸)7=®^ü³sTæséå^´B#’BÇÎ¢ËN±Ô[ŞØ6gÿP¢Ì/ø””(<Òw¨¡éwrójDÃ_.vÕ½F‘%§øu;—B~é\n;ÛW ²ş	Ì5>ÕaH»Tü×ßÏ¬mH][å+5šPŞ3°Cˆkt•©²ÊÊxP`´¸Òë¤£¦=`Šj§\'\\+£¿–ëq`¾§!j|Ö¿8*ê«-V]Úå¹ßÈ§oüÒæ§)Ëº{¼ğv—ªâ‰N u5_5«øŒõZ¥\n\\ÍğSÆ¨ò©Ïtâe›ÉDjı¢6HELÂÓÓŸKŒPô½~ Î£|&@0£eX?¬¹™c1å¤ßK`|9&E°Ÿ|ÀáúLf‡óg‡/ÅğC:Ñ	*‹‹ˆˆçµ¬ÏA®©ŸÔ)‹÷’8´ÃÁOn|D4øI:Ä6‚ŸçKƒññ\\ğSæE6Z6ş©;¼ò«.ˆ?Â–#£ú¢‚OœùÁ•xÿ\'gz(6ÄÆ½(ŒÁØS¥İ‹c¡—v,†TÕ/GYÔgÕb‹Ÿê\01hlŸü…BQ*_ù5jNŒ[Jø¹<üšÖ•6˜„#Ë]t¤ö¿è}JáÅşæ2¡ïë=îâã9çÌ1oÃ‰\ZE\0ad¼¨ÊË°béò)°²»Æç­?²”\n¸[…kù´€÷,’Ñ…q¢‡É1V «—ÌÅçÌ|O‡gÏ»†ÁÀçˆh/	â|G\\0xSX[7„¢ÿ?73èQu~«Wè	’ŠÍtÓÒJÎİB~â7ñ¿fŒâl‰PÖ|’¹Ä{C÷ı\rük¥cÖ½•ven#å>f•ƒ’1ÌÚÁäü\0sæn¥îæÑè½ÔX|‹ó¤h(t‰BNÀÏ˜–EæV¥BK%à<ÑåMä+‘®ù–IH|?j••Œ¤áÜP¥$¥ß?ş²–NÕ\\á#›,$Uƒœ¥¡fŸÍI „89aÎJ“ŒX+ñÂTÎÅ£´Ò›ãS®ŸIQQ6?YN—9ø‡Ñ¢Ä<Ñ­õgÒ&P·,• $–Jº‰×¼{ÿX°©E›r®(çÇ¹¥öÙmzbuXqŠ¯Då­ràÃs|¬ç«\n—PˆéœÚE²!yßØP¼ÜjúŒ$îyŸB	ê¿Õ¢?yˆ™àÈ¿4e~Ö	£†şú‡áeÌÆsîŠ œ\0b•±^m>H}[‰@°ée‚äb<ímh8çKü©Ÿåk@Ä‚ŸòFlñ,²ÚÏçÃƒ?Ü;#×¼Éñz¼’FS^ñ²\n?WÚEA¼±%Öé*ŸcáƒH;Z•†„J×D‡·ÕŒëZìö‹VÅ%	¿§İ{!´ ±xŠiºÍ\'¡@òD•¶FL2xşÌ¸CAQÿáùTã‹œ\"{øşû<(¯ş–â€I šé£Ü(QWïåÕÓ™D…øØ”{§ûôé·Z`şe$\Zšù—÷¿Pan^Öñ?.ª|l}ñ6\\xjø’¥/ÀTáU(ø1…¾Šé«Í¥m[}ÊÌİ\0¼(g7ÓˆƒÓååÔ¢¡ÓC$(d™ğßÊ½„*dá’@måy„ß•SÀUÄ¥H+íc‰v$V\"üêÇıMĞ²ÅŸ½«Xhåğ­Œ-øó¡Æ”¿§Ôypİ›§³Ô…³lùÚb\Z¯ô¨~uü\\÷éNİw…E€ï³‚¿=:;5—å×Í¥Ø°ŸàÂ\rŠ„>ªxÂ+`•\'¥)xÒõC§Õ8NYp§èO/ÿ#³²£p‘p!ÄœùœÈ«‰ÅW!>z²‚øÊanÏg\0Âğ	õE/€±M5>½°Zhõz§Oô:>›®¨º?}ëd¤¡¥·æ´<È¿Ò^Æ™ÿV8SêÏ‘§^¤óÂLVs¡^şAE½<øWÛ+Ô+,ĞŒ³}˜NyuÒbH‹U¡£ji]M\rCÈ2Ì•J‘W¨™(ñ6¹WUÀ<7K)ZButÕF:ˆ	tïtèt \0=\rø6üv˜ï)Æ¾y½Q€ú8ú8Z\0¦¡ãŸo<^˜Ñà»{J	ĞP¸8LWÌè$àÇ©1ºÚËômc2\'–T3F±Pé=fb\\ù	roÿş=È…å3*U»_v<BÛ~V;İË<\n¡Hbè{òëË$ŸCôcj\n©ZVñ>‡¶hi×(htTIĞ˜_†¨$\"ÇvV®ğB,ñ5Í]SäŒDKQQuùÑ¾e›—kQ\"mä\r¡ª…öXeÅàd%6bŸ¼ğ;a5¸·h€)Œ,^|^êÕY_l	Â“?t¿\n~\nJ[šÔ‰‘Âê)ø“q0L/e™ñ†z­òsÔ$¶B0»ƒ1‚4ºê:éjZºÇöÎ9 ²w\ZÁªLO+Pz¤É³¥BÆoŒY‘\r.Á?i0Î¨ñmJ \0¹‹oABäÓ6áÈ¾Ğj¹³Ì–ò…¡M}Õ_×Ê<âıRõxˆK+Wq`xO~¿AU8Û·PAõ©A{)i»&Ÿ	„˜û’kƒÜÅH¬Ÿn¤“ƒŞã}éÅØ]uY…CÉFç7ò¢;]¡ÇÙ\r±r³ZôEŞÇ=Àã\Z4p)øf<€Lu\ZxŞå ‚¦–á‚Rª\\¾?5MµÕ)qıªh[Ô9ÿˆùC~T¹|^³Údõóº‘–,g4ò´bH£1¶%;“°…Uò]¶ù´¡èÇÃj1Eİ¿­Š“41Q¶*BÂëMå—²U©IÆ°ãry\0m\Z¤—S±¹ß™—EoÙÃx±sºl—ÃÁìˆuÀI£0~=¹ê”ˆĞu¤Í,	‹â\'çÎfÃÏ|;è¯Í‹Ğî2ÛÎ¤ÏTy¸Ÿ»,EÕÁ~‰†½ÃÁch¿i·Íùv³aîwKÛÀo›®àNš(Ş§w=•÷=úâªÚiíFK²&4Ö\0ÎP××îJ?ÖÜŠöŒ_jt\rnl›àøv€½á‡Üm{…íøÕœÚí4„›¹hAn4Õ§Û:ĞzÄ¶}9ÆŞ¢³‹Õ;}kJZxz:bXFX„$,¼Î™Ş¼ót\\Ç&7¸Úz­pªå-`½EöjÓÁœ×Vg/Õñiº¹5/#ËŸÛcvtú=—u–Ş^ˆÖŒZ;¬	4±şàæø¶»G{=Æ.½ååıÍÆYŒXÇ2À¡ó>rZ:İ	Hï±5&	QáLK\"{ıY‹êéËİ‰ÔkLO£ì5ÓÌnh{ÓŸ€•|QyĞµ­±Ñ>Õ@pHNØZ¡ğHÑ‘gØéK…r‰z¯wk­/İÔ>zi\'´\0Ö‡ÊÆ“8x,ì»òp9>SË¸ehj>ïè‹É|Öij&Â¢4B¤Ñ®Õ·sĞFş&×(ÕÃ;û‹FÏ–âb‰Ï‰KO\Z7TœÒ­-knÌÂ¬µ/×éA{Ût×ujĞzoX˜¡PK–·õe˜z”4EçŞhCµıí„¬ÕÆIgw¸êrR·æµHaØ–ä›Õ–çD3À\\Ú0‰WRO¦u›Dëur%­[×æÜægëáª¡µöâ0?1:EırÎ{\ZÆ˜B˜>uÓô5–PÖ0£¾O‰ I’»¹Xi®TìÜéV£t4v Ì4•\"|Tèk‘²İ~	JJ”xæŞ_®òMY²õSf$ŸGÓJËYKŒäçq÷ôlY†I©/|ú25oêñô^Ş‚7“M[¨¿İ-ÄƒiÔ”\"ƒu¡ :£Vµ‚b>mwp¢£o¿\'±ç+RëVâôöïßÃÜà‘áı—Á.joÿÁ÷ùĞ¼ıßŸè:îàYÿ<æ<âI¦õ7‰v%Ø3¼p+}çN*}\\tÅ/²é˜R&7¯Yú—hÖl1ø×ÒĞí¢²‡9Ó¶´İ–i³†,VDŒÏÙ}Ò0Z˜³ç.óV!rwpÈYU…¬‡ŞÁşÁ\rŸâ¿¡™S¾E‡ĞéãÎ6B™<„_2!Ù™úâÔX@Qê/à^bŞ›Ş@Ç™6(P.:	ş)0şı¢e#˜’·‹KìqBß¹Ÿ¹£` À	û,şL;ÖT–¦şyÑ˜õW$‡HoÖX|ç™,ŠGf uš˜!ß5<Ÿj4ô÷ğÉ8°‰RRdmvóVöùkŞÇµé9ì5ïõ\Z_¿ŞKIª¬‰ßØ|©hhË®|Ÿ?5$ªŠ°‘úÂI)´%Æ1Ÿø,kî—hß€L×#«â@¾px[=0õ(I¹ö‘2?Ç·}wòĞëù3Ğô•ü¯ÜRºÛ€³¾¥]ÚJ<Ë‚Ÿ¬?YÌ‹K‘¸¥³¼mú,Ü6“Nà\nóÂ•+ƒªOÅ´‡n‡=ûkèx\r^üˆÜÇ_Ñ)*Yçx³Ê\\iıà5‘µƒH‰UW™©í;ñ“.\\)H˜r)D2SË´ù°V1»,˜âçe©TjÜxâÊvµ‚¿_z‘GaóÛk~\'|*+;•¡”ŠB¾äS^,ÃS¿%¡½b>œ$œâK5«\\Â£/A(ßS8>k¥æÃF/²Âk7\0vùf’7·,YpâñıW¢:~\ZA,	JZÖ=‹QtUàE-\\Ş‘¸úZ v—x«*„{$ â…CÈ+	Ç*8>©Ú¤]>Ê4í=ı™ÓGÌ–>ÉAñ\n6/L*î˜O]>Ów-‘ÿéÃÊë%è‰“ÊûW\n—øe–´bd×:’EËÂÛ\0à‡«ˆa0TÁœ½sA{´àŸÏ‚¨ïU/â?éèŞş.A…±A¸H^©rKÈÄ*ÎõAÑ´2S=‰/”äóÈ~ãõâ#°øÈÉ»æ\n8B¡£ü|2+N±<W|TÄ×ŠŠø:—;¾\n–4w\"xá­q.@<«ÅGò£ƒ ÔDŠ`î§EH.8ûg˜©Q#\Zh±N¡Ê¡8ö‡U~;Ü½Ô)›Ş*Ö)ydQ.Ngİ{ D³¸ìŒ’»ÅæƒQ#Á\\u^Š+¾H-wê& °P¾¸@ôb«ºR|T¤½Ø¶ªİ#.úÈ–L‹|7X%\0 lŞdñgñÙ¼Ûe5Ò+ÀK\n¨Di›w*Å¼‚õYN	Ö§ÔòJnzn[ÅØìÔ.¾½w+Ùèóî;@B@¸„Ş´Çd”Œa<0,\"ğ8½”¡÷ğÃç¸\"Ã«HÓúŒÙœ÷‚°ƒØ¯%ï“	´g¥E®q‘«/ê™^i‘„#ÊÁ©¡´—à´Sy+IOTCPe³´È9.rVM_\\Š„B´i_ƒd6c‹’h\'Æ·|íìë8ïôCšÏxQ÷Jüÿc˜ë\'8…ä E!7’°ñŠ¨YÌU#Ô+j÷‰„ ¨Â0(P+Ç®‘SjI,¹ĞÇÕÔ\\Õú(	~s?P¤„ÓLÕ(–“·Ò\ZÍÒøñx÷3V3øÉ‹ÀùcAş4Q®4z@ÿÎJî=LÄ÷‚Pôˆçùö—GpÑ$ÚhÉ˜DÁQ>Ä³_É)	d’¾Ìú-«0Éc8\'tæTQQæ­Ø£Ô…ÀšSõ}<˜h‚ 8ä‡Á\"=I5Qér,Ö¯c‘Ö#HDV1Ïqçn*Ê‘W#iÍĞÌ¹)DxŒ\npˆFú9÷lÆ…\"ó/`½	]YbÆÅ#­H’4VdY-liü«â•o6iı[ä¢zÄş¤˜*\\ Eñİ2!`Ê„	üæ9Èá˜}\0éJ¨AüŸ´01Ç\0ì­Úô²~B›Œ\0õa*x¬\ZÇ;2	sÑÂRgÇ#UÙïÚ6ã-{šª¥rËÙ‰=XÇªÌõùšŞôQ}EXûã^™L-@n±Vo6xé—°îNà®$\ZÓ‰€Á7¸E»üTšÑ¼±g\Z{7½¦nğSQÛ¨KÍ$ZN_f7Ï?ÿê(¸=‚–ÑÄÄÉZf÷{†\ZÀ6z†/ …±7á¸=@=¬ãŒŞ‘#i\nÌç‰kÎ6vm&òè¼‡Î•gâ\\f”rì5ÖŠéæŞrW–ãzéA5…UOŒÑÖÉÓy²é\rêKs&]î€°·ÇİÚÃô\Zß£µ@{€:E¡åuÚ”Ç.„S grU€úH»Ì;GƒÊ´{óSÈ‘„72IxMªëaüFí²½Ê5UEIN(ú€\"];jûknÊºŠßÖ{âZ_6„»óì%¶—fë¸&•E«=P<òJ®Iù<šË­íÀjçÅa×ŞôëôáâtÈEî7ãÛ\\†\ZWÇÚ,èz)ªmxªÚàOë+£u\'æm?œzÜÄ_\nƒ­Ü×é‡Ğ®¼¼ê`Ü^jlo}l‚G¸[Œà‘ÑàBØ·Aºò¡;·È\røÅPèîpF×»ó\ZGèîw4»3¶*wáëÛtÍøÚJİrŒ3\\í¡|ÍÑ\'\"»T6ŞÅ…ÕÚn5u[KsacG‘¾uÚ6åbsk˜X[H|Ôá¥\rµÉ&?]4™æÚî¶Jc¡\röDS®ŞÂàAÔZ]†vœn’×SC›õ6J\ZË~0=–€9—n­É|/Ê¤8\\ê3^³LtÓƒ¡«~ Vµå´yÛ2§º¥ŒHÙ²GÄ€´êÌ¸ÎMso<fk}¥>š´N{¡õÖîÜ1{áb/W“Ù\0¥¶½ŞüVÉÀ(ö i4s	ĞLİà¤óa>^¬‡¬®ñvûèv·Ë¤›â´s\'Í>o!ŒW?.Øƒx&Óg³D÷4f&#ŠìÒÀì€L‘4°€^<[£=hˆ\'ØáÌöÚ–·ïh§ÏgMÙ^øîå™Ì¥sæ7wÜõó®Æ_—[~)÷‹¸hó<røõæÔ”ÍlßìÏ1gÉÁ—IgØ·jû-lÀéÂa°ñ¡ïê{;v÷JŞ–¨Zã™4mYÎĞ7K{0uzøe;Ã™eï8Ÿ/æød¿åÏL?3Kd‰·øIhD&°>tµfã	s¤éPîl¶Âtï\0j0lÏtâ/ómWî¨:ÒöÚ—ƒJv’‚µŞ\rŸ¬qïàÑ¹/(¬¥š+i°O¶-s·×Q[ÇY¿iY3Tnı-=YÒöè°ßN&­K«ße¤ËTî\ZCa„À]óÚF9yÜ\'¦·!ĞÒ:”ÀsP!Ï»ÎtÌŒwKl?•=YÚOÍ“Ç/<tÓ6/W“¤Z–;;@‹uwá·Ó‘TçnİÅ[ÉˆÃˆín€*úÀİ‚Şh_»áŠdgÔ`jõ1¼7§ÛÀ’g\ZN7Á¡\r&K´ª÷q­®°|ƒøÎF„Öşl=hµ@Ó½eÄTÚ4%fJøê`ãØ‰6jyuœ#hü¦¬¦İÓu¸WÍŞ«£€@œO“aßÄ.0ZŞ„ëA’û;â0n`nWĞ\rpÒ±ê·ys}äÅ–rÓ‘Fß•w&0Ÿl-`~Z÷ëÕÑ†gk®¡À|:ìX¥‡j¢l«p­Ç™†5¢ÆFkŞ7íÕDØ²SŞHÇ±ğè¶&†„Şv£öXÔô¥¦Œg{÷Œ]ƒo×¯:N’r«Áñébàºç`-d¶DiûĞ—eù?,}èjéÚ©¥ïšmšf$ay«İhÅdXÍÛ½õ˜úK¡coœ9GÌkj_sÈ¨Ë_h‡^0À${íi]í·/m\ZîÔ…òœ\ZÑ&)ÚâÍÃv0YwnÓÅÙÂ¬Åx×¢‰Ó ®-VGP<¯kQ«uˆ›îM5s¸³±˜Ñµ½Ú¦‡·ùz±¦gcI^÷‡±:\0Š Ò†Å0c•&æÌÖ­ñÔ§¸Ãïò–C^ HØè„èOüy¹2G“q‹¼¶­©ØXë½eˆ<›\"1Ş`ÌtÔ\Zj*GñéP\rôvÍ‹ÃnV¡ÕEî&O4†“ûÚ¤öd³#îG,ƒÇxqè\rÁn	\ZM9¢‹öVXn!îÖÑ:8d¬¡ß,Ò#;íõñ‚bg#CàªÉ}§3ì^İş.[··²áF½Õ¶¨­k+`èíÀºÇ!ÛE×2õÇ×úpéb>8ÏXâˆ¬ñ†Kú|pÓš;‚HtÑ·®3ÖVøÚÎ)ç/`ßš¶±© ­¬w›ÈĞbw\0\0hä@ª6ÇÈ\rÜÖ÷·«…L[×ãæº‘¦±90»ÓÕîŞ¼./k¼kLN¢0hözÖ¦ëW¤¦†ª\n¨1L\'Š5$º‚DRüÓ¨ı’›öG`rYV„û6\r6³£ëÎª·	™€+r€ßzx›êVg«9Š&İ¦İã	ˆ­·s×ÒîØ×qY)ÚÄİÛCf¡À|s´)rÎúC`íI“•Ö¬…töŒÎôx{„(8’-_¶õ!Ê[¶¢ÎzĞ–êÖ¤±:Ùn …¿\"&Ñ·.¶¸¶ëS\'d8K7\ZÑFh£o~a‡ÿ¡–±1{,c¼i‡;¸‹\rû*®¯z×^oÊÊä0g«M“kÛ§8Ùç‚¤Ù“áß1û×±ÈZíÎéôÜC‡^›a Ëz:—AmnqËÎpÅÏÙncçÎÛyó:=O¸×†dDx\'lrƒaïæ4œÑ¦‰×¯Ê¬]x»Õ»:úLÛ4n{{2Ş»§9<ª2ãto4¾¬Û+Ä¶KàfÍ¶îoú\"ˆñÒpØİøöa\r¸Ì[Ÿ¹o¡Z{µ¹t1|´5ä²_+ËÉ€Ó,µñ0bç)…è¥h0Ã©Ó¥×w\ZáîÙWŸÀ\0Ù£\ZÇFŸ@Ïİm[¾¬zĞàmZy¶ëøF\r&/&9™ø”Î4¸4&MuÈ,>!oìàº40ÂôxA{ûs™aŒ[\'†zÎæPï_GƒØ£í£s\\İÆÔ³È_\\_d²dŠgIg}š/[ò‰O–¾Ø¯Àüxë¯lUÂ:xb›Û¢N].6|aw‡]g¶¶G`:TÔ³f/0Ù‘ÚàIX\"%](o´.æšèŞˆq¯-2çE‡i7ÖînÀr…¦Ú39LMœ½vŸcÚm«9²,yîXP®ãˆ~¦I­ïÇİ~ÍàıéW®âbQ¯.‹-\\¿îM¤˜Û~}uÉıUèng;OŞï»­~A6jovÅpÑÄá¹ôÁÖµëŞ¨>zã‚óe›wO°5Ù­¾¸Hß5—Ò\'»2ºğÃ[­ß=K;_:ok«gÖ7\0Ş›Nt`îó¬ƒ~›2ÚRŸˆ—6Ãƒ„yp–†‡!uıÃÕ¼u¤Ü!¢4ö*-ù2“<àôölE£âºU›^q¦´m¯»8®{ÅÜ§ş¡Ç/±r’MŞ’èıÊëÊ»`7•ºgÔû™ ‰Ksaãº.JÎè¬\0ùÇbÊüİgKå\\CGØáÂ¬&p	aK¤S¦M,øS»ÅŸjMù‡[fão—8¡ãípí-ûãİJj36rz½ÁtIwFıuÈ±º‹º\0ÎéØiß‘Næõ¨\"T×€]å1ìf F°$hz#ı\rTÁÙIjŠûÕZÄ–7À´”C5±µé’º¾Œy|{’úFí‡[³¿§K\0êk‹Ë9Ñğ#ŸúÁDğ½l-ˆršooâ\ZØÚp2è3|>œˆ2ÜÚä€á5R·õHıe|k‹$­âL5‰İMäXÒ\Z4gìÒYcä §Q×=M°Í÷¶Ü:pëp9È\"êz4z½lÛ+Bõ »=ìØ#û*Ûï÷­!×-Û£a}#ËKî®HµyƒyÇ±6¸Ìô€;Tûl5Qûth\r²Ó»©‚¾N§59Õ¶Ä¡‰*WÕâ6º·0[õkı°…·İıäºt ³™ÕÕ†W¦×\nXÕ\\š¾ŒÙÁPGéŒ6¼$»¦;ï1,H¡ğ04µvÇvûÎ%EÜ¯}¤}¾´È9ZtƒÄV­­o¡±Â¯¬I]Â¯këˆ¶7ÌÚ¸à\rŸF íÌ¢¬}¥Áùî¦ooÚZ9]X™÷É­ˆÊµ\'ùIš]e£ÔN+Ò?97ö£Ûî:mÎjèL³é½ÄÌ›ã[o¿nN5\\´\\î¼Aè[Œn:Š.ìÅËn*ØP×›ÌÕd;6}OØ’:O‰sŸ#¨š`‹h_là#•Gàˆ#e~Y×š“q%fİ%İŞ/ıépÇ°+oU7¬!Ì­•	QB¸õ›nÛ=´š«³2¥o&ªã:B6€ŞceŠò\'f)Mufh±+ÕµšZ¯]¯7ò¥*¯6¦†‡-^+x­T²ôŠèÚƒ\0 Iƒ4s©×Ï[\0l-‘höw\rz`š²N\rÚTm@©½ŞòÔg+Ê!¯5_à:#üªEë×Ö¥§ZÛÙà&“ğq¦PæVGÆÛÙú¶¡Ú»={[¬û®æMŸşOXg6Xv_‡ÒM¯×\'¾,ÂõoâTì¶`wxÀ&¿®5\'5AnšÖ®ÏtdİBîäeûb—&éì˜b.\ZÍ“Á7\'2!Ğ?vDk«ºk‚a¦İ£çsË\'Şäá¹Á!wì¯D¦¶Át‘ÀúÃyg© ø\r_ÏåÛ‰„;®,*G›3Ê#ñåeÈ6Yš_€®`ˆÄEæ±ÚÔğpÉ¯¶³í]LÂ)fèyŠÛ´Øvk\\üÎÙyå©Ú¶ÏwVæQU$ ô®Ğ¶˜m^èÆßö—İNÏ»CQ$VÉiPµ›Ø>ÚØöº×æ²¢îç¶¿—¨nMNc|™´5è`»¯Ò§µ¹]o:Í_.½ÛÕW\Z^ÈûïK•4)y×l]˜f(æê´¯é;m)¢grÍmŒÁ„¿±Ó¿Zˆ·Uç´WYØÙò¶?è$b[Ù\"Z·¥×S\rY_\rQZlútj\"Mîzòåw¯qØ¬\0pLÄ“Û¦0mû±l¯0LÔ¼İq5mƒµÖÙìÉš¢{M~²2@™ömG8/Ch?µºøÔ¡%\n6…~k €êÛÙ‘\'Ç•å!Íy§Şç¦—ZÛR0N§¡LÁáª¡éíĞïLİNİYŠóöêp¢€ÛBšTgŞ¸é-ÛÚˆMpmÔ?ÀN¯²¦xëÙ8éÄÎtyB™Ó¡qYù,‰ŸƒÍ•´—\0ˆEö\"Ú%Úˆ9šá\"q6Ha&Ï‘5FÎT«…ÀGIW£>ëËÄ]£CÍ€ûğåõ¥ßø‡ZúfÆ¯´·ZúR™Î¦İÚ©#¡ŞeÇI	¨ã°­ÓÜ\Z›Ù´@ö¤\Z«ñpŞ¿ÒWpĞÓ­™ÎÒ65ëÌó¸Ù+uMhGü¸0ğúª†¡ ¶»™7Âöî	yw¸¡ğMp„7Ô£Ô­p»ñlbŒ\0Z+ºæŸ–Y]vÆ-mÏØ ¬š·k‡ugl—Íîi?o6‡Ooƒ9Çğ6=ÁÏ³îÅÕ·€»ØQ*©(êÚ¬!öE^ëHk±\rê\n6àæÃ«Óô<îØî+¬Æ÷ÄíÖ¸ã_¶Êj9;õ˜úÆŞ.ÏÎL1 e*;JcZ\"8¦Èu£Ñº	„Ğ©]·Š¿ã²¤ªŞôQ—ºPÒ’kÔº\'jwì9!¯æy³\\š&ÛZ®EUQ:ÖQnmW\'z5íR]Ú§Ë	Ëßv(Ñ†ABŞL;^M§Ç&~…Æ4wzx³ßét&uXœÚŞˆ\\‘\rµS8ZÓçmër^îZ7n>Ø&Ò¨ïŸ&Î5e!ÓkB1	näÖE‘İlÉŞdN‚İöuö¦À\Z®E­õÔ•¹ë­‰Ùòvæq¸ºúËÜa˜sç:îáàx<0l2àÊr•dfÖâĞ‚\'²#PR_›îqĞ€ML2ß¬\r÷fw«ÏO±±Ø×{ã­ËRkF½N$ílÈ¦²¯1¡}R‰úô¼©µh‹ÓÖÇÃaÚÜŞÛ¡N¢8-gx^\n¬Òé´£q}À†ºZ\0u^º¹@X{%£\02Z Äµ›FèıUéæ@¸Œ6¶ÛPµ=jÔwC;\'B¹d#Š¢ÚÎ¸Í×Ô¢ø»šÈÉ u°Ë‘9®ëSİÇ²;R	¨×ï“­6¾Ç¨áìxmØømËX†uÚõB<®şzöWAbı£6“<ig!s½†ñ~b¥\rˆîF1…×ÙöÅ&ì”î Ù.!z+Ù4n`5¯‰ã®lû7k9§å9µ‘—ã—iúˆ5±±3æJD{rmßÁãpĞóeÃ¸\Z#+í8íäÍl¿pHhĞZãÖ·½&a°Y¾sŞ\'X«OkØmZ»ÀdHµ=İ4:Oû¶µTÑàqkÚ1·äM¼¾ÓV5³œm‡ùªç÷ZÙ·&·Õ–paÃ˜ªG_í\r[¸›İrår\nrPòPí°Ûv¾Ì»wÆš3ìk#ãÔéğ»^„f;Îš˜”2\'ÌõFÁ½†j\rå­¹\"z+a³b;èIv§3Ê_1êÒÓe9^Öî‘=ŒFÍ•jS¸æêDİ4]œgğ÷ÁÅa4›ÛmAÀDÇ<7µ\0hB¦ËÛy0‚1ÚXZrØˆPÃ†ÒÛL®\\“\Zn~J*Ş•ñİõœÛ±ÖàÎ^DDÊ?òHÃzé-„ÖñtD¦Ä¬Ó€Û¼§_»wíÍç*°Y;ö\0£5Ş›; ‡_ª7Fõ\\›íÈ,NÜ”\ZFÉ+¿n‡şjÅí1ìJÏöĞ¯O6ÒWÛ|C¨.m˜èÅ•Ã ½@A\\‚Û¾ºÕ)¦C+&×ïy˜&.Ín‡‡ñfĞÛ÷¶TÛ˜î•®ˆ²ÛxE¥‘Á¯oÄ‚¸Ê´¸7ô\'=‰ƒš\n?A£oôÍÅär…ôgÔxæÖç‘´[NcrÚ¶ı0ë[ÇjZ&4¸l9¼àijÅOÏÔDÅÄVQ…Æt.Ş”&´­íÖ+]GÀÉogºá›[ïní¶¡\"§áë1ë=¿YGZÀGîÀÃk«½æĞHnîº#RÁçêfZ\rÌ=hÒm²ºZâŒšQÆí<÷¶¦¦¹Z\Z{X¨æ€Æ,zº½Œ˜ùH!‡¡Ï»úPáÌ:Á¦Z×¡+;EI¬ãÓo‘–ÔßZµİÁ,ØÙ]‡+w$ÕÕs\r˜©zØ›ÅV<(¯°Y1÷Š¹wËƒÃÒş”0†;ZÍ˜¸ìxî¢³^ô0°-îÏCë·«t_êQó¶²íFCOîÆ„¬ZSÚõáyÄ\r×İ]‘&\'‚ÑD­3ºRKJ®­wìFàÎ‚Ğ#[ŒëİÎ]	dKçmmtkã¶jôú‡½Óº^Ã7{~&ûsM\r/s‚İ/{ÚlË#B–$t—Â˜Z^3ì6ko=¦îy”l¡š2\\p˜´o¯(³\r¯‘å,gºNÛ;õví>½4ÎÜ2g¾lL¢Ìj¶ ‹Çly³ƒlÉırÛªw‘º\\¡5u‘Ç–{‘»Lã¶ÒûÍ£ìAu‘â,Sß 4+\\Ú]èìPõMC\Z~h6a”¥{ÄøÄH2i\Z>cê’rw~‚·Äšé(èhMŒúí‹1şJ”uxŒÂÑ„Ì%µ;h‡2\0¤;Ş9#cˆ7\rl3\r	Õñè‘‚O»›c^\rÀõXâ:ÕhfÂu²ëŸ[¸ÅjhJÇ:%¶®åQd^P†–„Ñå®N?mš«£Ó:6¹#Ó´\rsëkv¿÷õ‘~€ô®u˜3ÜÑ–¶A¢Ûõi¾v–¹®ùæ Ğb9˜hWv+™|ıF-Åë•Ú[ÃÖKh/@{r»iÀe\"^…ıe=¼STÙf43jäÎ±Ğîí•eO\\ÀJ¬âQpş¢£Ë²±Ñ‚çrem3Y\niú2‘ réÌô$¾’¤œüıÃræ¥Ê¡2ñ§|xãƒAT4˜MÑQáå†™L%_û\'p3	\"‰3Ô‡jHf&aD‰7ø#-®ş-öBTè4øÜW¿s\'GIÇtŠÂj><ßrØé÷–yÈÕ9(ò%?‚°¹ø©(~j¡Ø›ë>\0½•F–-9Qô=ú?é˜¥Şv2FpÁlî¹{´ßCD•IRbå½Ì\nåC—¶Z~£Ş§#Yu°¬vI®ƒ\'q@¿A%ƒ˜uÅìŠCŸfÃS‚¸VLoåh”çÔËŒHCuD¿‚ê^#Wö÷Ê7ol2à/çûTâ	å¯+«G¶+Å+‰zWßäp6—“0N¹ü\n°Äµ	jHhygÓ\r³ËV¾ªÂ,ñZô°{ÒL±(¯dE@îª@,ÌÍ\\XâÁšKÉø\n œçZI\rçÄó¢ã”¢¿«0€GX0gÇ/JwSşO€%^RPC€S©º•ÕLù#‰<SÆaãèzo	÷äí“Î9ÑR,ğ”lÔ™B…Ìƒ¨Ïa„yB¿9–Øìë¢qúSdìÚX$c“‡y\rı½­Ñ¾ ˆ@\'Hà ùJší»£Ûdw^¨ó]k°›ïzûÙµ®xş0—¶êd×ùÇ óÁ¹äpw„Ú:‡ùz{Qú0Ùõç|¸ÎçÍy?(«ÏO»ú¹F\"\'Ö±ÓéTk^ƒ;Ö¤Á­)¹B³ŞÀŒš…İjğDÂ„«ágÍ—y_Æ¢Â…n¸G{Ûã‘’·µÁIÅé`+İn×›Áõ‚	ûæPfõ#P[9:;8v|AÖ”´´ç4;ì¡zwMí¶`C\ZÃ·¾âKjmo°í×»i·§â¾¼Ém¡M_].GûEë$ˆ¿y³ËmwÛûg¼yóĞ¾íG:º5œ\\ÕÎm`kB±µ©¹Ôf0.ãµÇ0îoyrÂ^˜¶@Ñúì/F§ÑUï´t}Ğ“zsÔ¯makZ~µŒñ’^ğˆÎÌz­v5AšXˆ“€ 6¯´µ›á.®c¶[c‘AÔŞºAé5j:Ü`;²[#Ğkğ£ºĞ•š:¨1Æ»5±5Á(i»½­UÊ²,e:·êO‡:şáÔÓVËV«Ó¸p—ËmŠ_i C7¼pë—ÓêzZy§ÌøÇˆ\rÕØ\\›«ƒzì›íÑÜ¢d³Ñ?5\ZúÔqÕÍi	˜Uo.`RëÔÁÖí]4Î3rÍ·æØÕ™İeÀòÜà`šgÜëkR0n»ú™Í–&`z³s\0~27z2ùs¶ {&×1\0hÑ«û2•½~Ó:µóUÃˆ¡ÑÙM”!W¿V\Z=Ö7\0=ºy¥ÏÍ-=áEŒb]Y¶Øh¼xP•mÀ¸İšº:×wüLºÓg	Ù.xPUU7n™¹kĞ038×§1\0,«ÂdÂÂ½ÅÎÑ¥sŞ(Óã9šB?ÚIŞ× Zg¹¨1~Vw£1é×rzŞßÄhÜMOcAæ¶×guuw“Èîqº[°*%ïÛ¢‹ÈuãÔîrûÁvÛ»Î¦F½¾Û6×ZÅ|0Ê4-wKÕbÒhÍfDjÒİ-1d]Õ¦°3¶‰Í†hÁŞ|ÀÔdF”	ƒiİ¬%í9o¶@HuØ&1‚€	nGö¶Ã·T½ö™™8­5Ñ:ËÂöz\"úPıˆµ1¯¯:İ³ÌØÛÖØZJÔyKÉm6Bw¬Î™zó@˜æÒëpŒuêsŞ|ëQ¤u\\èºá¯È€1¢éµŒEû2\0ºĞ6ãfgDlk*|\ZƒB‡8øCë“5ßèûk¯9‘ñÆöl‚r«ëuÆ[ÈÎ]d]„PfËI\"d“¥üõu4ûw\rO“9vª1”s[¸p^\r™h·#\Z6; 9º\"”®h5TßŠÚmÅq“u†h\"W`Ğ$m°Á‰­\r¥OEÙ«ãÍko¬AìcMí#}…»t¹¦\\VÀ-0ï×c:[~\0[òŒxL,_¸Õ7[8-ĞÔÊk3rFMÁu_ÚYukL`»¤³qG™ÕçmóÒâ‰¥ŞèÃa/İùg[˜aHë<Yã^ö+Ñkûm5Ä?(K}÷b¯GóÕÒöÙ#ñ´Ëé.	k/7»Œxn·š‹Ëô4ßÔ¹q`\ZÃ…ímÆŒ<¹CğLlw»c€ãKlûÉKmÏ­­–½ˆ˜âikLœÎ0±÷ÌL]4t´î©&ÙLUd]\\ñÅÆî1Kï0XfÛ>ÃØ©å4ÌŞÉ‹ÓÇjBƒĞ–=u3Íüb×Ç¥Ñ„Û°@«ÕÕfX[>{#·¹àä‰ÿéÚ2Ï*±A¬µZ·d«9¯/Æô›ä>ã›-t£Û§â3Åá„‚z¤¤\Z¬íu¬u£6tphD¤~…;ğ±aÌXmcÔ[#7ˆ8ÔF@õ3z·Û\Z\"!õ™ÄPØq,õ‘[ı¸@Zœ95Hy¿¿.1f.u|VŒI€¼p¤í_œÏ)`‹ïn—[«³¿í#ĞS±ãÖÄ¯SvHÌÆ:Ômö\\¿\\\\czš¬Xı¦­™İ>1útµ\ZÍÏ,åuWSGØ¢·æ¾}:iŞaåğck±İs—•®ğíÔ‘@Óë13wâäu\"ßpÅØhsólÍÖZ™ÏÈñŒ\rjTêz«KGëÚÁ{ÄÙÑ5NkJËëöÀ5=N—/t×1×\nfd¹;³\Z=øu“C¸ëºk¬de½›l-ˆÎš²Ò;³Ê˜[÷ŒËìê\n—óí8‘şa&Ü–DÌûş4iF*ÇÖŒ¦,ënıÒ$°ƒ~¦TuÛªÏ@ââMÏ–;—ÃŒƒº³w\Z^ı:6oü„n­ÇÉlİ;1Ì	<n}J÷Çtøz¿ÑšoÈç‹eÏE¥-)ä¾»2›ŞLzìˆh!EìÁs`\"9u²O×{“ß´¤ÍA\\öÚä½‹‘óVkLròTëL »+S¦o¨›æbAíÆ¥Õ9µò˜Ú\'¢¶Üb¬cÎnàšé¡¨znj {&Ï¶¦Ü”q¬Ós?°Š×gë«¤­Îr»®”óí-×y\0Ñ.â.8[‚µ}·Öo¶{®3—–)//û-ƒx»)Do6ÍÕ™¢G«Z«U«;\n,K—yŸ[útÀl»_~šàƒYsÖ†êíÅE¹µE¢K:NÛ>©½9´Íh-mWk‰èí‡İÍ©2¢·]”6ÌéxÃCóÙÑç¥¼@¶Nãjã*eCêh¶Â|¦³‘¼sƒ5äÖáÔµç†Á#ä„,¥9ŒC¡¡>D[Ó™Ç#\n³>lFh}YßL±I¯¬ê¬	ÉšÁÜDGS²·D•1{àWM±7œ_½úñ†ĞyŠu÷¬GĞ	ÔGfßÚánİ¡,ŸGw°--,.Bt8@äK³ÉHİ0^Ó3Éñ{»×uéb;×½ÛîO\rİ&zÓÚN=3WÀ’ÛW^.ËœĞ“áJ“À3aJjcÜ½0¬1M9YDO°1¸¬6Çw–ğnY$”eîûª»à:µnŒ±<¡,Qb^ŸV{D®xßNyÿ©‹ş‰â_LC»¾EŞXCxû· cB’äR½ˆÚGã%8ßÿö^(œ„rüR¥ °-†*¯@ûå,ëòÛÏ?ıì0\n¼ZE†ŠÔ\r¨Hğ¡	’£½Æ«³hßêõz3ş[O}ş^^xI½«çê}ö½\nÖ3ØéïŸá›ö*UåË>§a•õá³¶ËúÖìÇ½¬ÏUc»*\\ªğÊ÷£j~«ğ,›Ïgï«æ±j,>›Ë²¶?£gãùŒ¾Ñ~¾­WiäÕµUÖ‡gu½¥ÕÇ¯“¨Á³ùB\'Ì¥gİD“-÷T}w¸çó±Vë«Ò»Iğ¸.h‹@&­ï¢8ZÀV7„aSo÷iˆÚop³¦h|SĞóæŠYÎ›kk³i °½÷Ï|z}|ºª{AñÕH‹SŞoh¸Ğ“‘šKhƒ©ì©çMWY®»ƒöv8f”Éãë¾y\rwM^D—ÛpNMC¶zK5„…ê]·ãŒ¯èŠ6$Öb[3¦kkÇ¹Ò¯Ñòhúçìé Ëv‹Ìö\n{ÀvÀÕ£§òví¬g7]\rœ%:š™ÜŸLû«ãšäz´¾èú\rºg*ã]Š×Õ÷ÊÂÆUµ¹Ùe®\na-€mN[WØ­IÆğà‹?{|IÖqt¯ÇùrF®ºŠˆ²Å„¼X®5Dèâñ6áÄdèêÕSZÄlÖ¹¶iòÀ4Å)×ëµV×Ø.GGt©æ˜¾¨J­®Ê\'Cö&EmÀçNS%±mo²&tğ|¬/İ›¸œqGâ`ëİu&¤]cCí;í!×çÛ\'ºÓk_H÷Úç»~àlœî	W®“-ÃÚD^Úò0™ñö„+¡P¶b›²cUëµ{»¯RhwĞã~?Ñşºu›Îe‡Wl´ieÔAÉcKÍyXÌÇşF¬oqûÔë…¿î\0ßqÇ+sQV|o;æ½ÙŠßÎçæÙö`÷8¢M€b@[é`bíœ%(³òÑ´‡Û¢İs–ÖAl{[j%¼.Ú(A™²Ü_÷;{Léî/Ì’Ú3}rî‘GW&×H\rŞMûí9ÖkÔ\0Sıß=¥aXÍÂkvQ6<±Úğ½ÍU¾úåûş‰ÕfÇ+§ÕbXˆĞçæà‚{*EˆŞR¦oãÙÆ3†Ì\\.ycî´o²}Úp[ ›÷ÚäQ\':¬g®,ÿìåšÂ®Q›±Äf´-§˜½äV«W?\Z®C×CDÿu¤M«½Õ”m­çŸ‚ÁÑ¿H·ºiè§,‚æÀ™,\0uMBÈi×›óºkhÑ\'=´·»’#w<Z*ık‡§\'³Ëhì†[²ô>u:Œ–—şuäôÆó6¥•RWˆ%p–ûûƒÑSîÑöIcéÎÕ\"´ŞÜŸf¢)ké®w½K‘£‹tåt\0É7‡ÕmÚ]¹Z[–äBm#Ç¶Ñ[yÚ·ÍAÜœºğu€$¿ÇOÛhîO´ƒ/gr†úã¾l‡ÏG=Õ\"ƒ9Ìùà²œÍ‹\'÷ƒ«êRcgi˜BT-ä	p<×½×µ¼µC´äé±y .ˆ½éõû­BâÔØ4Œ¼6Ù|¹r/ÍÓ•ŸÜ›}‰}òÏd}Zo¢ÜÙ\\4ĞŸ)AòUãˆ‰·\'ÎníÆäÚ£o›ÙâÊuLf).Éß€Õˆ¼áçÎØ8Ù³“Oöb®näy\0\\k…Ê¹ôäËfLXáÀ“Ûór§übÛ\ZëG4AôĞ‰ØhŠb¡ÂËÄÊ\\OŞ³tkNB·Ã˜¤.ëöõFĞæ¼\rSõ«´—ôZğh\\§&UÅÎˆm\0“\0p«í\Z_«/®5»ÖŸáóÉÆ‚\0_—³™ÙÅûM•Pu@ï[\0™íÁ,ÍCæk åør¸=ß_ûíÃén[nÌMÎèéÆA§ƒ·Å›ñÍ¶1j§¾.µ]³Ù„Ú\\‹»ÔšşÂ@j5ˆÓ›¸wÃ:Ô\\ß ¼ãFØ®>0û d¨œ„9Äjï—g\nëŒÍ£z†l˜“\rÙíÀóÛÕš+pBÙ¼åOz—ln@¿­ÎÖ6uP©a¦r²¼D<\0ã\'ˆúà—Múğ~¹ëê>`“KİòToÕá¡»îiG‰AµÑTÓ–§áúÂŞØÖ	6µÚšÒã0•ZGJ™ºº8­õÏ\"D@ğLvºàšJ\0H™$zffHŒÕnmi¯»ÃÎP„}}Ø•qpí9ûÚ’9îÇÆ?©˜İm›ÀºĞ`:aı3\'°ÇVò`ßŸ3ü´·m›ÆUoàëzÏÄ¶#İ!‹åÎEıv°8\\nV³“£=¶V§Q¿ÈCÛmwzÀv&Ê§øÑîfwíô/î•É=ª¡íÕ=7ñÁµáLãµÙM¯7Ñw˜íSí`ÛôHcË¸MG™l†âœñÏmtFÎ¯à€—Ü¶¸íşiÚNH~°5â\"76ªÉ©³+5˜“æµÛÜc3ïzØ2\0£0­ıl{£ôC{1oãî¦õ•– G›É¹Ù–w˜.i­îºÅ­ÆCM³÷5›­ÚŒà*²Ú±–‹>>mjı«‚Ú¤‹í¹à-lzÇ²y¾¦ä¦©²ËÆ‡Ü\\¶6t³‰N—-÷ˆ¨<%]ûÎ:o)wêö®‡ÇÚ43mÂ¨¨I:&b5äh÷f³¦Y[ÑØ×GsæÀu\'µ³uÁtìTÛİÃV¦€sGj´R=ŸÜWĞú„:x]k£ÅhÙ Á†Sôy¿P¶sµİ ›}X„&İşpAÍUT ŠE{CA6­ëÚ;çBnEjéªH}×qZ›õ­Ö‚©™9R€ÕÙ´Û;¼ç3Õ%†ì©¡èÔú°j\"ƒ¥6¸ñÍ)s&”íjèoà-­)ìæSÑßá9bî5çœİ\0ˆQk¶Æ=j+nÆ€Ñc>éS½Ú½Í¨;÷9•ã³D§½e@÷›õZîØ×ö©3E5Ü/³¬Ï·ÍëÍƒ¶œ«ÈH\"í}Ÿi¯7—ñğ|D™Ãi³g7ÖæX“ÅÎY3`zu¸ë²w›´u…øL]ß”Z\"3g[38è\n33×Z\\º+·lÚ£üMÚ\rN[è¤¡dz»nwã:»ùœÒ¶¸	¹êË–8cN37ÖÚ‚‰1£«iì…¶¶SO>×$a—ËYÇ§[•– Ó±»[.”&EXˆ8RÎ}IèÚğæa½VC2\0’êÊÀ—U¥	Ñ1¨Z½v`7(=`¯#yÊˆMˆì[gyÜ>ŠKÂûtwFà’ÜœÎÚu”\0t¦wõk\'µ‰Y\ZÕh`İGÕ3Ÿ\':uâºƒŠÙ‚è9‹6©ÎhO1œB÷[Úz³äç’9N®s@R¤;Â•ÕVZ §ÒŞè4¿ÁÍ1Œ…å¬ÛÆzë³§›[“Ç®Õ6vTçÔ¨³<¶¦g ?kÛ” ·ÀùFû‚íŒ\'\Zt‘t˜šâ²æ\"×+~4\ZÜh98[=©3>¦Şm~rç#Â ê0p¥Gç›ä³yM:ºM}?Ù¬€õ},ë£-8¸´¹.éİ\Z9? KƒØ^4èÚ#v n¨ĞubBo€®º}qv#æÃ^“šê€eüHì„éÄš²ub7#l\\îÆ‚IÕúÇÕMB\'ó+äBçQmC± ‰«%;²d²Ù_‹ÒÙ3-‹·otƒkC†;ªD³„™dgdÍÉÁê¸N¢-NİîOÍõ^Ñí…–³_v¾x Ï‚ÿŒ«)îp¼jæë+¾†å­7@Ùñ\\&Ö5\rl‹ıAÛŸE½Ö¬­gV×ëm‰6¿^ğ„N­`pM_\0m«.Iü†÷wçš(11ğÀ›Ô‘­íàÑiEÕzbG…ëÓ)ÙUÛ[F¤6&(}lÔeö#š;ŒÇÈ`s£ÖNÛÛŠÏfÖKtpP¥¡S£Ü½ë‰ Ş¿Ît¬EJÔ|‚À#Ï%Öt€É\\ïªw–‡|‡7\\~Ï“xß’›6¿ÕF,Ó8l/<8lñ¢¡Ã<0º-›æ˜£õÑfOu´AcÑ\0–ó¥Ş¶ÌAºíuVßíej¼Ôº »7&”;ÔD±Ù¥a#¤³˜\nPmÔé®–{n¯5½â·¸Ø‰Â…×¶ka‹YìZ\'¹a«ÃqT¬¬{ˆŞné§m\rs±æÚöØåÕ{üM\Z‚}g\06z².´•É˜—¤ãjF›ÎíºööœÚZÜSƒw\\¼5	YìîÎN§»ú…	‰;uyï°¹ÖtĞ›hµyİ¡Š²ºÎkÜTî\né¬uìÍ÷¨Ş4öÔĞó™mŸ†`Ç³ÎŞÈ™u¡u]¹]§—w‹mnñ¬„–eo7ÀD10Ö^€ö+$á¸7¼Ûôk#N¹Òˆ£\Zç^[.­Ü:~¥ıhdÓMzé.€€M7¶±xßâ¥Ug:îì}®bŸø=Üóıˆqg5‘uºøŠ·/:¶áNwè¬´hKÓİ±	¡ \r€_ì8FqÑîX{g÷›Îút\Z\'}2›¯o\Z­	çM-|ÖqÔ:«$ËÎIhW«¹0•gWZ4åƒ‡R=ÛjtgeÕÓÖÂ6{è8€K¬¹Œôæzpl7n„\0s­Õ’:\ZÇ¥Ô›«ÔtØ^K—£@Ìgn{)_©&Ü¹Lu¢aûâ²îxx£¶ã±Nêã}8-xj$i¹eÇƒáµ©d·yP]Ÿ;ŞNç.ÑÕ¬/ÕomcÁA}µ‰Şl£ôMÌvÎ´îÚê@GœÙl3o®k;Ñ\Z®7ÄVÛ7a±!n#ûGo–Ë†‚u;.m-– ÆSu_f¬{”t[ÈänírM]mæš¹\\ÖÍACÄO³.2¼t›­ºr¸îi³ƒæ³‹¸„¼†aËÓgæuá\Z®‹Œ9¡À§ËlBÎIq‚CÇkSĞ˜­‹	‹fœCÀ¡}ë:¨ûÔbÊNbmõ:0ln$ZÊ³£8çí³¶<ï‰C¦À¹1”Î°DŒÚjbïŒ¯x´®u»ì®Ô>·<—@põñ—\\#˜ƒgÁ]M¬Ñœ>Û7r}¾øcou[¶qXÙBC_Úî¥¡åM:­\Z€2»Mâ²›#àúıŞ\Z^Ğ›ö\Z®Ù€álê7b\"9Œ2Òëı~¿N-\'1’Î&ä›½úÖæ\'7AàÕu\r£ÃËˆ³ ñh×õššg @ÛÛŞ®¯;«gîzãåê@‡)è.AšœCW GÔÆj»€,b$9P}1	»-°ÆqKkà–»\nSX`lØß8—æÙŞ\ruWÜÖÎÊº®·¼(‚UM¦V,~Áj>æÊBÛ¤uï¡é]Ó\\æ•¿Xûğ¡™²™ÖsßíACkÊÀ˜&,&^ÅÊR8”c”>‡÷€’U ÃB	Ğ´9«ÎªF¤—/ØçVüxÀÿ(üc3A$´yŒ¯\nÑ9¸¦õVÑTªÊ=‰×=x}E³oì“õ/6ü mEÃ™NVTÑO›õ»Xj¤œd³IY=#{ÑT€ÆTLşL´ÅFe?#ìª,ˆ›)â0íuŒŠm‰«§7¤Œ*¨!¤4Ô;¬×†5©§¹¹Ğo‰‰·âWÊamå¢€—q‚ïz0T6ÌßA \n4[–„65o­ı0¢M7=’Š‡Sü~$¿ß\Z¿½š´(cU(]¼Xş€|°–¥O‚üÛæïe…‘µy%ZLå×æ+®Éû‹•â¦s™À¾²ú¢f“I…€}R#EšUäw)ù…õ\r(q>H;+Ü,‹´“oÀõ‹Šn…ò…5“…g	)-•D_¦,¬0Tm„¾©8Œ%®ÖüØ›jX\'÷9-•÷9Ÿ&0Œ3«>ò$¡òIÁ©tÚ£$ÛUqÊ3±<\\%²æ¼I–ï¼›Di¾’”ÒŠğ”ëE	øQœ3Í®†òòTÄ£—á~>¢V&Tf‹A«WË+M&¹ó)ª’¬i¹ÔäÙ³P•˜ûÖl¤ùj‰làğğá³^TL-Hı™¡†O@eí­c*RKºs4IS4dSŠr¡§¤ˆ5`úé,”D O3—xÊñx[\rvª$?\\#Ç{Â´lé¹t›/õùùºlÓò6Jø—ıÈÏ±äA\\H.[x&=ÍWØİ¿¼}\rÍôò\nÿ*ıbƒÏÓ€….¯,Ú¯v3rÿÊeÏŠò÷¯\0zûÆû“â~çDÉ´ƒÌqüÿ-\0ö—qrL]Õ®ßÛşgÂSŸˆ6\"ÉE™~K†µT¤Êñ¸`î‰´›\"‚|úà¿†wÏıš’—™XDåš½Ğ#‚}Ì‘R.Ÿ	6o¿­q£Šyn2Uù\\Áé¥ü`/I[aÎäÌ¾%\n+îNaúì —Ä÷0‡öGğ½<«â§Yö\nÎ®¹Äºa!ãø÷Ui­ºoi°pù^@ÊÕÍ¥¯\n¥ÏSig]<íš›‘fñÔ‚K-ÈpSûôÈyQ¾sE†½8Hø°Ë”ÙD–‘\0–İ·\n¦’ÅcÁW9úûa°º˜Ï÷›•B?Où÷Å&ƒÙäFé&Á\\“I\"ù2ªÌŸ6ãS(”‘P¦À¿”RY¤Iz¸ú&¦£ŠÏJÖÃKc›İş0Ìpğ²3T>6¡.—ım!t’\rÒs„ ‚‚‡Òı§ŠÂ3NµONš¬æ/%§\\ñ”:JäNfa­ĞGSŠ\'ÔÉè¸JŞaC.J]%ğâÍ#íW*¦îÇºá+í¾AÎ@>ÈbXã½¢„.:NÚ8ÅÁc?—7oxœÁ;uLóÆöÅ”N¹æ!^á×(À€(|©§iª~->>QFõyŸAºŸ\rUX(…RÉ6Ö•éé’ıxûÈe¡âÚP;vœ\röSô³Õ´ŸÈv.«×zˆÒ¾Öb8gé	şrÿHC†ò	ç{ÿ„1²yÎ¨Ø¢ô3«H<	¢©ÖMÓU‚uÄ\Z®êSë)ê~…ı†1IBLiâûÉ²D›÷aA¥Ú›´”„d†Í(ÙÌKvï0!à×Gç9*!7„,#7Yéfxÿ<Í¯e›’ª‰‘;ÅÏ¼$Hxo^µË¥7î×•ºŸ( +ßÅ‡Ï‘È%MÏˆ¦pF6}d¾*JíOT|ŸŸ~Y.H_ŒAùÈPN›’Ö+”v^J{]çŸ¯Y@9Øwß\0|\n\"#\0õ|ŸÖWÅBÿÀãR\'Öpüñ+G`›Wow>¡•§=ºkôé3V\\ÁÂ=¦l]q’‹csÍ²àL¯A•ØK;9ùúô&¥lSİö¡—‘z$O¾2Ş%J¿×)i9‡\\ù6üq:9`ñ¶ë¡œ†S7ÈpNJüô\n?GW™ğUHÕ“«eLa‘Ö’#%Gùô]AÍ/nÙí¤\\R%\Z?Q—ç5OÉõß}#‡^Üc¾ iúâş“=ä³}ö\Z°—úy¡ÇvLz¥Ò¬xşŒ:_’s•­\Z.ËiUÊºlñÈ³ö-¬ôó•\naÒô¶,s¯¤^D!É0\nåÂÁåêÿL\rYæH\Z.¨œ(Ÿt7¶H”šYMTÉ”Çy¹ |Ï) À&9³4\0„Dg6ùá	O7?s¡²P)AMyŠ ‘;É\"+6$¬DCDy®QÂŸ»A*\0ÂM‹ÂøbÙ~ ‚^‰æAğ\0Ü„¸\"GôG]u¯Ù®ğ‚$•M.\"+<¡·,gh*š¯¼LŞu» ğèíBû^ru‡}FáŠı:şPä$ÉâŸÄ‡¿×Cö³(Ş0†¶~y¨ÏØW¡•;·9”ûIéJë.¸‘˜t!%:–Of¼=V‹Æévb•†¦&—DÂh¦Û{û¿Tİ2m×?ïG|\rşkúQé\'#ğóo–ş½e_ ùp–\n¦X¥Ec¥ß\'”ñ¤Í,ı\"-T¿.	µ(ò¢$¡_lá_¼ôK_B¡!6Å\'“Eœ«©G\"ğ4É	’ŠÍß¿fNÍıêÊ}Nq\'ßuâú¥QY\'¸ğG® cÊĞgöş-Ùµj]~ÚâÛı|Sv	UZ¡ÂüÖï§hG·ÏATà5‘õ¥=MK°áEBéø«¥WZ•\0%Óts™1ğÉÓVÌÎ²ùßvUb¿\r±J¿Nç}ÏM×«c¡ı…ÉI*üÉ‰¨šµ_ÒC\Z\"	 .ë\n««²àÉ“Ç}F\"7ı´H¸J¢«ÆâShÿ¬ë²¼â7•Eü»y)<™íS@\"’w{Ãœ,S\nñMÕåD7âouA¹7 ÜãgHo–ş·r0ß£\\úÑôÿ»Ûıçë>>GÚ¹”`<lm(øÉè%a LÛU…]ò0¦’ôJÀàç³–ÊÏ?]€ík|¸—TœèÈç\"ül¿3Ğ\0“‘¥ÀfÃDÿ\"ô)>\n£gçîÿtøo™@·ÕfòïÕf‰Ø\0Ãğg­ñšéˆ¡ê	zh ŠÊ*8uOã¡whdõğ¿’\'\"üÎF1l)k~¸M~)O¤X«¶¬ip4ÑÇgn*Qyá6ql–W»¤²…\\M Hu·,n¨vª÷TÒÚµ\0uu[G4è1ĞÊd—Jƒ×Wñ€.·°eooÚ¡·Çk½Ö™ŠËw@MèĞ²ØÎ5D¿¾Óy«/Áwn½¶s\\íuå†_Æ:N³wh8¨¯õÚÊxI‘-ö?·–§ÑÜZô¥×ÚBÃ=\rŒ[h4÷äÑ¸ŒTÜ~Ç*p·Lp¼7¯ã+!÷¨øwÈÓnÿ°Û[ó½½ãÃë3}:ï›BwæMTü,À<4øÛPo^wWü2YĞá¸o½ëpã×WÁ›¸FíFvıúû\\z·ïy]óû 9•¼î:ÛÆvİ?¦ÙS{1ğû¹XÍ®\0B—h¯Í½ÏÅƒ€³Øi{Ã}\ZQM—ÇÇ\'Ëz›c`©¯28û0Oñ˜¶PÓÂŠÂSøe¸\'Î<èÏgyöëÜ8xuİB«ùn½İûs‰pëË‰¿YÁÜ¿ˆK„OƒãÉ¡yeÚĞÛÎ¬ÓÜkPã‚Éşüıê3ŸVLo´ı_\Z·ØŸ\'hâÏß¤E #`yíioB/æÖoçáøãÒ¨†gµ\'ôÖcn«6³ ½=ºŒ–Ë+³ì¡ãıÁ›,Ú4³èÑm§áÍ×èMè´ı±Y¥àix“áMãënİ|š\\rPÓñç!YsÛiúÏÇ&2 ¥Œ·ë±å÷ãÌC²ÑJ2~3Í§h·ux½éöºÑ¼NtíÄÃ3…ÓÇÚ|éÓM°†(Ôb×LcÔÚ\"ıoŒ7¾õ¼ñ^¾ã;iÛ>%^F-¥=¦G×Ùb©>àùt¯ÜO³)x‡ı2¼áÍÇj†4=ë¬n[¸oñİ™ÅAˆ¿Ö½s°&ZŸíÃréµ¼OóÓ<zêô†y+´İ	8Äñ¸íË\ZXC-†ğ´ã´Ş\'UzÑ§Ærj/ö0ºÑ]ŠÔ=f$w€¥z7È…#ÄxKL®Ìšµ@mzV.–µ:^i¨ë“Û\rÃÚºkŒÚÓµEúf^Ÿ.ğ	cğ›A6û[osè¸´¹ÁMp°hªİkô4–Gä& (M¥+“‹\Z­;kwzhÏG$Ö1­kÃ›\\{­óˆÜ5¡h{ãëkÍ=ú¤Úsm%sµÃæ\rèÜ˜½¾ß9#Äj^B{K;ãAOèÍöñüFŞÁ;Á\\ôxõÚ¯H™Y˜3–oÆ.ã9«}õDjjÑZwzæœu²£¢ç-8\Zèà`yvŒşA¹@#Ù¶ oØ>t•áÊ[}ùÂàF³¿¼®Lmr£Û²r–H:Á¹ùXÌìÃT»Nû[[ö.«öa¯á›Q—ê,Ñy•Éùœx\'²¾kïhk>2–8b’MwvÁÔ¶®*skéSb!#İ¤d×ü©ßƒD+ãÏCÈw¼†ªµb¾[Rì\Z>´Ç\ZyºQ=¦ÛÎÒÃNÂ>º]Y›NmìŠî€ô·”îB!A™«\rî:mÀìh?nì0Ğí&§Y\r}sÇîjŒô;Ö¨qÿÏœ®/óYCluE iW„ú‡‰írÂºÀáv>ì¸îì$Ù­>°êÂ@ŞuCs6ÜQmcØAc‡0\nOÍ†·íÜ¦XCz³-Ñš61aa³»Ï”øé¾$GEJÿ”ş)üQ)`ö\'K³Ö?¥€ÿ~)\0xMrá‘İ$+‡3[s³NkDxíV‹è^z®÷fı-qdds¡šı‘G6½¥G2	Bóš5èr]q#œM÷àò‡úòèºËƒÜòö:õº\"Ó¤<Í¯³EÖ-¼ã¶Ûóá¸IïFİ<l¤Ş€CãsXOF+áºldzjÒKá§VÏágîD`µ¯S^e”°wš­6©#F8à­§î¶To]ô‚6˜oG\r€YïĞëŠ‡†ƒ6;Üûè•=´ˆÛK¾}pòmã\'d»aW}µ7ÜO&°Ê‹+{¶i¸†Ø‘ºè±{¼õ¶ô¦acz<íî.#âÌ!§úcf‡ùê²ì1=vM¸·±`ö Îè¤è*\'ÖLòÆ±şBq—{×{\rYœÁ¢òp°ò4nn»8µ÷GŞÕÕËl^p˜/W“Ù\0¥¶½Şç»\\ ÊŠì4\Zï•_=*Ã©+zğ•ƒ°Ì„§T´kµú¥Mò:ûç&ù²I¾ºÉe73r¼X\0*Û|ËôÅPÔÇ3\Z«a8ŸMÁçÑñ†è¯6}Æl¯nÌ·UWóvóæÜï“ĞÒNE›dËjùs®æuÕi9N™yÙQÎşó›¿ax=z¼«„¹X·÷¬?fÁ2xmó\"GË~{0ŞW6Ã\'›ëŞşSx!íFcÌißôÕafôıñ%oBÛ‡½åo|c`»F÷»¥Fûs¬Ÿ»Ö“}aËÛ¬E¶F’fnôe¶è“Ìş\0M:ZÎ¨±/Œn<èÏmÏŸÃ1è¯…“@?àí:xôçğğÇ†lÂĞøÊnH€]7OS•À‡ğşÃrb+¤)w·™)Áû)¬xş¦nï6Œìoªk°–k\Z<åƒcÂ¸Ÿ¤d@Ü{W‚!Û$1ØÊ>šŞfLo»Â¨C¶Tµ5Üoı0_ÓéDÀ¡‹=¶çË9µû:“÷Ëƒ­^˜u‡[,¿‚‹ÃªYƒèf&®–îÑiàMˆ7§\\ƒØóŒU\'|¼:ºoxk\r wj…·»Áó¦}–7u†®÷tQÖp“„•Ö‰§:Íc6Ø|^_¡kZšÔæÊ^cˆQ{=YŞlƒ›±0¨3¶äˆ=¹8ãÎ_¶UÕkô&íñàÊ{„)Ùô¢¥ËÚÖ?ñÙ@‡rQB®µN‡Ú:KÃ]§uœ$eªsŞœ¤åJö4ïSáŞò§œ¦ş¤âŸ§©˜âÿïOS·8nmaŸ9_gËq‡Q¿vš\ZÎğ¿tš\ZÿB§Zuú¡ãıíbtXµf‡Ş<MáıtªíñÔ¬l¸ëTiPşiªƒt°3±ÀÖTv.†]L¡ÕÌq·1›Ó€l°YPºŒ&üT½:Ó<élu:bC¶¾îÀ6ÏsŠ=ÖtLR§:L¶­ù\\„§^}qt½u V™C¤Ë}İd5yd™­ş±ƒ\"TŸ%ÜlikpKÖ—s‘Á#A¬Í¶äÒ–Øº\nëİXÜ(CL<é­vŸÈ\rs(ƒe”¬‹»ì´\Z§xÔ½ı¶\'„½¢ÀîĞ9›áÕéºä˜C¶À7â¢`[™ØrıõÄ›ç†8¿ÜÎÀŸ=ºC´¤Zİ–ÎÖµ~E§^Ş;_¼\ZüçyçŸÛØ?Ï;Âyç+W€¯œw˜¿÷yg?k1{âÊ\0»ÎŸrŞ‰áÍZ„÷?uŞ‘<	òé“Y|Ş±GZîçe½ÏÄ	ææ	·~êµ÷§ŞÚÌ¶–ŠƒúŒ¸v„?¡&ê\Zåï\'Ên¿£:ô~Ş­5÷z;ŸÌ,ïL{ĞM?¯¶&n¿o+ÈÎFs‰ºÎlÉÇPRËê“›¦`öˆs”H÷&:rOw—-^Ÿ¶\r¯=±FòQ\\œ¼>îAgbtVñíJÌ¹›­-F©·;-uD¾¾mõ€N›îƒç}×Øœ¸:º”¨¥¬òu©¦Hfy’6ÔL±ø…8é´4HAF^û,ÖˆqÇ¾®fÄFÙz³~ §ª´3±…qíMé¥Ï­!ÍosØ^ıòôÏƒĞ?w„ş´ƒP²\\F·?å ô€÷âÁêŸ¡?õ Ô$7RÈy C|Ò{À¸5¬Ù£~3Zx€:<$MG­>C ³öl\nu‰ÑfF$1X³Dç0[É8M»Œ0j(Öˆ8v×ònOµ[­íàJiäq´Dzs¹ŞtÇc˜Í¡C_— ƒúdOôñ•|°z‡aÆêvªÃÑûŞvØ¶6^g	.h‹iÛÖz«îzTıÜÙÏ®\n¾Áä¶3sp«Ö—–èÆ\Z*Î˜\ZMn˜ÓefãÙŠnÎWt_júŠj2Ç6øDÃX†2çõ`_³Vãñ’£ÁÙ¹©QMyÉ–Ê¸™Ómmfh½Şš:Ì–<ÕÄQ¢Î`Š™×^ÙõOèéØ8Š¨iŸúìäİïf­o‰/wjè]œœ˜BW¤Œ…nº¨mæJO²ExSsexëŠÉQCN>èPÇ´Ğ\'-å™V\0¿°èC•”«åHçLáúVœ­ÌÃŒ‚«‡±ÕqBRQ7ÓaşCö;\"\n‰›Iyè‘×|¼Bç½$ŠO¹ïåfïñizJû®®QøÓlPÙâÎ»\rÖÄÀ‡_G…5®nÙ¦åOÇ5rÊ@õxE~&\níäÈÇ ½\n,]\nEïú|4±t•´‡Ï#4S>ø³?¼gÏBg÷Lˆù”cä+1¹½ß3v/Y.ëfI;ïÑ³û¸„öRÍŸÙøWÅ‘+«”òu‰»^tZ{Ê“ä\0É°@MàšŸ¡Åò±¯˜qp²qVç\'€\nÙ\0‘LªfR1^œH‰õ²P0%l)3~GÄFìçYuTNÕ‚ÀÎñ¦D2ÎyÉ¾ØÄ·x!n[¼o@å&i`ÁúîÁä¢½©Ä¬”äït*g£h‚Ğ\'Ôˆqö?F(g¢{æ+D—J#õ=;™p:æDcƒ¦âÕ„ŸK=sD!tŠ|©T\'_OÔ|È³gËïÑX&._5ÈªØ‰ƒÕã|œ‰€üV«—õÔrHÎ*zŞ½ÒŸ\0ãWüçR[Ñ‰+qÜŒqK![®¦x‡SX(y~ñ¼^B¬y0ï•µü\r¿ŞEŸ¡›\'·€D)]Çò#	ù~\0~äƒt–6ü>!ÇËï„e¨VJ†#ˆó3‘¿Y¶–\nˆï8öB‚÷p¶*˜]Ù ?\"ı•¹û¼Ka“ t‚˜ïg:ès	E>Aºb|“§¬°?9®/Éy¾ÔœsÕò·	I¾ 3Óï_­Z\Z†\ZŒ¼Š†ãÚ¦!çz\"abCl|Ä/õ%U¹´7,\nc0ö**‚*Ib@bÙîp¢ ‚_†ñKıI×.íÇ6\0°Q)ß$Û­nrAÃÊ(„Õ¢Õ\0i¾Uã–ÈxÅBošúD€(ÉĞ—*–½BÆ+v6“r!}\nç†’\0‘>ËáE\'rúıúi ];/Ì§Ş%UYÃ?¿gŞ°éWy¢ÎoÅ•³Qè£ê?¾º7\'b.+ø{¼¤‰—²M­¦ëKÀ¾³Re ï¡›;Ã œ± p–„öŒÿA*dêŠê)íL¶D‰(•gç¡,(«[\"%äˆ?ü±q ¢é‚şüùHVöB‡4•NXğzG«Ï¢q®‹¿šhşíıosQ6Å·e/õñm-ro3Q>i¬~<¿êœ©ùO†¬TíŠÚYT:ocñ$şíışı°UV{wüİşÃm5	B^±RQÕù2ØöC1àC5U6Gè$UFCâ7ëÚ¢ø,“SRæ­ôi¯ğNMü4Y)?’ƒR¬DÊÉA%múoŠv%Ç‹ç¨GJÄ ğXšƒ¦¹å÷ªô/ ²Ç¤Ü1ú£D+0qOñ‡ø#d‡~™ ‚Ö×ÇÊŸ£|4ú,Æ\rS	|öø3íMQiÉûTÎK¯p°áÏùtVY`Ô{Ï€²¿|v(nkI\'ÿcÙßŸè\\p¿1AøL¡ğ8\0ñÉq[a¨vPá­\nğkeÚ}÷ÛQ…8˜¦bêùØ`Ië_‰\\úÀ8CÑÓ@g/ÂÈ(jâkåø§r°U«&ŠKòıå’(Éò±íŠgı¯mz,¤Ç¹OeiĞš{´šÇÄlTÃy¢ÍF0EƒŸÒ´wézQÀ¾ğß\\Â7I’ŞşµÙlòMñ-ı%îO5n?À8p\n˜	¢™Üº¡ò+vüÓì&ZôR“¿d7Ñ#cËßïIÑÌŒv¦IáòT¬ï5Ñ—-Õ¨‰§_‘vlÙ§Æ±¯;nsŒmr|î¬G½®#o·MŞï˜ù`°bæfûÖòËÔÄë˜\rjŠ»eíÅAëÛ­0ä·=„aNdhÍæxwÚ¹0`5Y½Á¦®:ÒF4€[\ZixOªÕêŒé-ÕeÜe=^ŸÂKBZk/ó£SÔo¥Ûd­ğÉîZ¤½d¥+=e®/Ò³¶ßt k‹.v²Sj~_©\\Òåê¼O8ßæPñUSÊÉ^š-eò8F;Årr›¿T¾Øñ{{å¢s‘‹Œ®tÎ%Tx%«ÃBµ¾ª ÊSQ7…mÏC¸ıA”ïI[Ês ÇñM{|Ó\niãt ¬âùÚü¬‡%¡Ì“>ú¯J“<Íı?i¤KŒ®BÒ‰P¡Bò´/·—Š\'ÂÄf\"G„¯$&ÉÂÈÅ=øÏá³‰zMäÎÌ–XğöIçœˆ©äJŠçÙ”I”ê4</­^ã,ÙæßO’N‡^)ãÄÚ¹\\öšÂü<M?ŸÖà¤G\'C©\\Á±Ş	(ö¨·Ÿ²ğb_îå«´³©9hµËtXÖ\'w…¤^¼W{ÌÒÏŠ”[%¹ä2õ2Ä¯±>¥‡ï2å‚“j>GTÌı{ ZDi*«$Eîã=N.¯ËÑ•Ğ>Á/5¥ÏËa“Ÿíô%ú“öÓF%!¥bwıU†¬2vÊ‹Â²*½LL”ŞX>š=TÆ\Zr¨—®Ş\\š¶×i´,µ@yÉªÅÙ—|™AÄKµ˜E§¬UmÇŠ—\'UJZKOu£@/5_n‘¥×Gê7<OP¹5ç|D<¦Ò†1ÜˆPô=úÿø[Ú­Œ=.<~fäè×ª…»åİnìgF.ÏôõÎo£.§å»”A…QT«Y¶<J¸HæUv	Fú¤½€i”Ã5x\ZÉOØös8àC•_Zğ®´dæUøTÒNRP·æ¡<.´ÊÑ+¼ûY§´šjHf–‘şJã(ñšÅÃZ%·3i4«U21”ˆ¦’aACcŒg‰?‹š‚QY±á—ŒAJÆN²Î’E1›ƒ->çÆ\Z PT¦x*Ïa”¸jÂÅô&%ÈğA‘œ‘Vù8G¦·vÉ4f:tÇıóE”¾/¾_¹<¡™±¿L¬ŸĞİ3ã$?²†–Ÿ‡÷Ï/,–ìøk@•\r VšZí>§¡E¢&–AÈS¦¹™YL_Í$y£K•¹Os•$ë&ÄïşĞUËQâ™àõ— €ù½©ø¢(‹÷Ãº,sÀ/™ãP~\'.åNßÜ\0\0èˆƒ^¿ÒNV·–à½Ae,¨¤ºl«–œN’İ<çí=–$()Y6=¯&Òù\0ÿ˜»şÃ$îzêmşÓáûÿÛîzÿtø~æFgãÛ™íÛíÙ^&-&r£[-f9º=xì¨ñ‚&Ô+n~wxQëSxĞá›G7¥3Z®h¿dÜŠ´ÇÀ˜dn½ËhÏßf‡8Z0ÈkßwxíÏáı}¾M–3öÃrë’\\[©µs½>õFµÛ¨Gäa×‘ğÓ#v#hëö4Ctˆ6İÎ†¶¶ÄbÇ4)º\'âYÛ2¨wfO2-{Y¿İÖäUf\\âımİÉŸÔıÑSVş™@vg÷•2YæH¦°Ï6× U\nræX±)`Êqé°%W;¼ÙÎyÑEnfşwóäÆW¹ÇºŒ§>vyáëgjw{Ù[®pÔüLv	[ªVøælßs5_q|XCå*C‰4Ùx­‡! Ï{–já\nm—¥ªóåÅYQ*y¸%=)ç†ò	J‰Í%®IéöÊ/\0ÓÚ»D÷ğ@	oÔJµu%\n¹—Î\\ç=‡šÆ#…Şz‹gW¦I«ô°yrx€Ši0/Rj[’%˜`¾Ñ0ĞÃãK²~\rÒÜ¹ºê*`D‰<ŸÖ•Ù÷¹/ôaĞ¯4€\"¯7\0ÿJXã³>;K?P•úšrı›¾Tõ{t¡¨Úã³rÌ4*æ>6±Íi²råÇ{Öum•ó‰×ùY(1d\r×ÓiïËOèwxåÌ ‹àKÛÀbtPNoÎEÍV …°X#Ñ}GWK•×\"Uµ€·2Ø	?p²şŸn:ùz±`QªåÊ>Qî„L©|ë(ÏKw~_yf—¨HR3â%$ñRÏÓiTÃ›¿¼“æ0Ş¾´ÿ§2RVpíœK…@‰Š6Ì˜u=O·Ì±±>Ô…L\\\"»\'5M›5d±¬²ØÀDzZùêËC¦WV9É¤ü¤²l‹¢QV7Iä÷¤®s¸–ÕLLkŸÔä´Sio3ÜåU#Óø²Ê#ùÊÊgÕÔD·¬r’fùIe+P¿•TX¤É•Ñä£ª¤Ú³I öéPù“T:Ò\rCpêiõ(|•#t/ëx‰Q‘F®ïŸ6”ªj$cPÕO_€{ÚJ¾xåÑ,g$‘W¥–4öI‡CFe‡@(»A°àçkpr\nŞ4OİN‡üÚU|‰XVŠğ‹PÃy³™n%A‚öù­d	’)pŸË8	£lr8[FŠ%öwşĞ‰\"&á_F¬`aöV,Æ¡\\\rR´föìXa<z@y\Zì2ñ÷­Zşıôôú\n$ÿ|›œßc,+}Õ~	É<ô²=óç³÷kĞŠ°á-Mf+O\'ì…c[R cR¡yüzÙ0¶ª£UOäØg2&±\\ÎÚÒsès?‹Çïj•@i$‹gnö¥fæy^~\rZ(ŠÑø]ûşxğ%‰¶²±ŸUfĞÅÛ¿*ë÷ª‘ô&Òº„ö•yq7s²*\n¿¥¼¬˜[â#£Ï`Å†„•1ˆL|ˆ\rnßÖQü\rä_9C|5ü#Ù‡MD‚°0À7ß9¢!d_%oxÍïİ{ô9ÖªFÉî?Ä³¿äÄş$ı>ãÉ’?]ÄwtIşåì\r^ºÑÅZÁì¥¸êRäà)rodãvd­Ñ÷‰…ÛëR×Ï\"wL-ôO´‘*¨ ;-7îôÓ«æ÷ª\"•f-ÏmQB=o™ä%ÜOSP¥š·ªbáUêßËğ>é»AráJ»y–‚‰+”Î@üîÃ8éÜÃ+¢¿bd´\"<‘¸¿l¢”3bÃìç¡ÚÒ+¢D¤‰=q^jé±¸ñ%âÔ«=+FƒŸøk”ñgÁéÒ†nEçÎ6ü|û X®jrşåyÿŞŸGà1´dÿw·V*Å¦\'¨hÚíï\nœùm•nk¢n¹×\'I“ĞCC•WÜ³–àğ)B?i®\ZÌÕI7Û\'^ËßA\'ë_*ŞÅLŸ%Ûß|a«”À3÷5Uº¡0\ZTÎé<êJÄ[àTl®ğsZyIÌz4Qà{Åı¥BKÌuÃİ0<Ed·®”e£ÅTµ=p,2Š”Ò)çøŸCªÜíª­¶3ÄË^	ø(+e§ŒŒü\\BŠ_|×?½ëK«‘É ¥áÜÊEè”zºñ¢ÿòWæ\r…>™·/LR~u¬¹ªñ£ş,¨œŸ_I§A/\\Ğ~ÖxöBÏ.bhY39±“åò‚Ïó×>Å×ºÅ%—lK¾Gõ)Mëû=,ü5‘ƒ•?üBCÅúÃæ ŒáZIÿ-GqqdN-oÙ­§Í&ıï92mıN&*¯ë©ÿ«“²ÀkeÖ–{7•{\Z7¨eÕ%q³Ù§qãÙ‡1\n÷‹ D|‹qÈ?‘È?±°³$A#÷8ÆÃ.;®k\\^Õ‘`Rx£RxãÂå¢&ÈäŸÇØäÇè<4/©(zöiŒHöaŒÅ§>ªëzæaÜ~æYP9Ò©½‹…µEö]5¬“û¿ßÊÿøKğğ/ÿ•yd±˜åæşÆUu±âqäM]ò2÷H÷— ’{VÖÅCîQt6È=uVÍ·z²óO‘µùB«b¾X¸°ıg‚z\"¸æA4|Şa‡˜\râ?u§‚Ê.ânÃp“\r˜R(Ÿ¿ı7EJzAUöOZùh%ù©QzNz„O±¢;Ÿû4By\0wÌ`èo?>tóöµ\Z_ãzXGm„ÿ[@÷#€:ïéÇn¿VÓüµz¿ÖXzÜÕ[0ƒ÷Óğ%5À…Wbp¬eùM°/ft\n±|\0Ü—Ü÷0bRÉÂ+yñX~%/‹ğÉËd)V)}/Ë2D«š‹–hÉ‹d¡–¼Š—kÉ›pÑ–<O–né–W‰—qü¦z1Gq¬)ÿ|zø;7\"ÁÏ?ääË_[Áá\n{OL[ó ¿5¾´¸?ö\'Áù==š1›yF©ˆüÁoì/ÿõ3s‰	°´ú¿›™Í3v3‰„—Ÿ™“x>ˆ‘…Æ×Rå78%V(À]>ú_¡vÃÒÄÿzç†ÿJZÑ‹2\nÂ •ÒW<\"e”w—èåÏ„n‚İøMğeÇàv ’“a€ÆÛc÷ëùB¯!GİKJ~˜’äÏh,:šŸï!éø’/*ş¹G´ïÒ`áMî=©î|„Ÿª`”¼.ô=Áı	´ê29ñ<%—ñ	İ=¾\' S¾%Ãµm›Zö>%Qu…7RñmtRòã`˜‰pŸ¸UGnWøWëgw•”xauK+jçKÅÎJ3½{½oe÷k!Csî±nÙH¸fúıù™–—:Á×@÷ù¡‹ş¾§ÿL‡ÜDâ¯®æø<AKjÁXkáÇ¼JF³ ‚@\rI|çD)ˆß]85²¹v_Èn‘1§\n+òªÍkw­~Š)eıqã¿ gL©‹êrãÍÈ//¾ó+¢ò-ú“røAáÇœ†¬‘ºD.+Oİ;€O²®Äò5ü8d#&g\Z{Á\0>Á“±.‰#Cå0¬‚X%\"¡‘R%¨ÁU9D È\'	\\›	¬O•Ğ¿Lùóœ•·7Äàß*ÚJCÍÆ-ò±(ónù:”\\°Ê”OHñ½Äw%!¢HÍùÈ~’¨4¨F5˜SµœÈj«:gÚÆÓÖ´_ˆ|¸ºÔP¤Õf©|IÀî1¥2V(„â\r¬$Ğc¸#…ûR.Ì#ğ[zx_o¶Ü›¥Ê+åW\0–+]œùPVië$gÃ¼dô#%ÈC(úü‚|†mAEO†*K•t½Ô=Í¯LéÕêaÙÊ½gÊµC›‹Hó›\rCgñOòªúÒa.»ˆ©²WôgRvoèj’ü*`¾ci‹õ0êl>ãÍßãŒ“Q´8^#Ä¿JOÈòOš¢rš\r)ô~Wûk\r%GŠş¬\"Zä·//é‡LPâööÅÍå³±{!dõ·¢àº÷<Te9İü]ºûÅ9üJ¿ÒÃ½<yøOø¯\"õQ è×1È…CÒ…Êãˆ%­A_oL7}I#xó³$FKæš6H‡Un¤Z¶	ı:\"Õ%ÑŸÊÿqÈğYÑ¶M»ŠÚoşjÏ!R­?@{Oi@{Õ[EdéÃ©~ê³ÎşòX:¢¦ßäØÊÁd–/ŸÂ,¾¥â:ıi{hY/òa™´û\"©Åşå×‰Üûwì]X+0İ/åúU>ÙŸ¡!^,ÖRÔ–yÇÅúğ”Ğ¾/Æø«2Ğ°4~¥d$Ë—Ø=}*‹™u¾H;•ÓV+ ˜Îï¿}ª%Ñê£İSğE%áÇ—7…W¨ĞHıY-=ÄRh|²dä—Ï‰æõ¬¨ş”^å÷ïÖËWgñ‹İ-kª”Ø_:é~‰|€?‹>x¡ÉŞ—zğşü\\£õ”C|ÿ’úæÉaè‹|÷Ï`>ß.Kò©:YCÕ#ÅZéØ¼ùÒù«úƒhÇú•Ö¢š_i«ºkŸ(+0àB¿á?£³¸ıÿ<ˆ×Ğ\\Øy+ù	üõ~O	~~‡Ğ¿¦î-ß±Ü÷@‡–©P	>™ñ …\'Ê÷ßaøùûFã¯Oôç!>Õ¯+±‹†ûçÓÊÌÊŞ>ğ*Ç;…YyŸ0lÕpSAÌ^ÑÔg¤·ÿn®Ø·ÎÏ_„\\M[ZP&¸)rƒºƒ°\nY²éŞÒ•b+ì»MKhîòjáœ2•. ¯Œ,Şó”êòS×X ñJ.»bÆ:ı—º—ˆÛO«U(ĞãÛÔÔ¥Dx#ÈŠDi™IÙ—êÊKİFÊòœÄ÷>Iz°Ry §l{:^Ê(ƒıö<îş¯6›ç®UsP¸„Z¥D“^ğÈsyTš”ÃÌ\'-úıçmÕJ\'8‰|óWäyÈUwKñª	í%ò¯Ä—º<ò[r¨‹ì°òYIKºÁºÁM¦ZykĞñ#Y{É¦G¸(M–·}o4òMÆ/Êò)E…<àÃ4´ë³„a¿æI&ÇT\nêlü²H-Zb;ÈsiZ¡lqK(@ıL*_º¦,kb…V^0ùS¨IŠ/³ëòk­”†n„€‡ƒÖ§æ2p©KøÃI$Šæe£JÇvÖ—,Ãlä,!ô·§ÛÉêøcu„NE…4•q•ê›õÒ¢o‘GUÕëtœ¬|†©ô¹\"=6‘òİ„µ˜\0¢,³nj/ÏÇXHoTevÏ	·\0áEB‘3„j(¢­º9î•²ÛÌs¬¯ÈûóñJÓ@òšµ½` a}•HF)ÍJ	êFnë©Ú¨âí$t’£¯ˆóæ\'|@SŸ÷¢b¿.a©%nÁm¿|NkÕÀ3ÉáÊ3ÀfpùRÜĞŒàÖ,“ÕçˆKµü0{2H/æaNŒÒîãøça‘’©B¸UÓñ¯~e¡İë¿ÂÀ\nA½ÊË>ÂP¥²\0ÁÅ,…H´ŸƒüdŞ²i)¿1˜ƒGn¨ç|îaØœ9í¿J÷yxm—		/Â}‰-ÿ°®08ø“°ÎÆ,HÖ\'MÒMÿ(mtì·üÓİ5ä ^£ˆbÚ.röÌªZ¹¼,fô#LÎ÷è&1¸œù€ğ(ÁócËö- ÎúTFÖz¹)Nùc¹:H\"«CÂëMå—ru°»8Öşq¹ÚbO/%¶ì¯iuzmuÜD™ÜïTpÈH¢3„àT²1êqÉèÒŒO³å=ª8Òì\ZÀ,¡C«Cì`Õ›Sè,ÕEšãÈy8·é#÷™ IrÀÆ®…±ğQ÷n›[¯4Şßœá€ßd®6›\\K!ÈtÌã²	_ğv«‹:ÛFİ<Ú‹¥#FgÑAú[nd.o8´q‘¦FÀÑâg*+wj·z·lñ§QÄh§sÒÕ6ÀÚƒË†áp\'Îæ³r¹h›ÚÖèíjÔ@ëá…MÎÆb;Wf²G0†µ7¶Ù(#¦6Q–`¶voØ°»ø ñ›·¸îğ:ÙÜj“|àµC«¯çÓ™¦nk€»=¤Ïîèi¿%Ö`ÜŸwC‚mÉÒ˜`jM˜·Ú^xY%¼FcS©ÖÕ£\r†Æ(³7šµ­&Ø9­˜km)³>¾#æoCrA-­£Õoú\Zm¶G»ÉÅ„ú‚b_°[£ë^ç¼jbèíJŒ·ÍymÏSÍùÂ3\n\'È	Ãá´¼öÛ«=¶=`ê­øf`ÓÖ™œû\rQµ	—rnšÇ‰&=fKŒö]›ìô€NRu¿…´ş$•ÂÓ5Z~S­óPG÷á¿Q\r5²ŞËø€#ÆÙïÅrA³Ay*óÄƒ¹¨Ç«T›E7U0ÒD22é^“Î½•­âe™.$-Û~®Ùx©AKq? ¿fT,à_K8İC¥Ék\"kGK|ù_h9ğ4ÉÆK¯Äÿké(ÅßTÑ	Óe•’ë3c_ŞyDEùñv÷tÖ÷ˆ±¥Kë<J_¡çú”(Q8f,ßT`^¶U²ALâ\\HÙ&\"ªß \"HÍùßg¢Óícøóµ–ıóç%B!ë°à„–Š0G[˜-¤í“	JxXØªüt\Zˆ.gHH£2UwÌ0\0øñÇxá3¦u–}b–¸oüé­¹})¹­HıJÕb”—Oë”ÇÊ*Õ&Ç’èGb8ÿUrşÌ¸æi¢\"OD‚Íz\0%ªğŠ¥÷-ŠõV¡UÈ§qŒòƒÀ@%?øĞ¤DéQ “)·bš¢ Wñ˜‡«õq_ÙDË·ö$¨fNõšŠ*ô-úØùò¯)5[Îª¢pr	_¸¬œ‰fY=ıŸñÊÜ–—NIş\ZÍHñ´´4öN7©˜b¹Á‹CM%ºêdÏˆd†l\"èq_™OAœŠ,¹K.iì…ÛãÏj=¨l>ñÔulLQÑŠÎ\n„Å¥%”y}¨êò €„Æşàá1È²F,)¢ü¥\ZˆÅşÒá±EŞµM»S½EŒOæ qÚÄµºõÏaİu½>½¡£fé7á¼—¹í±³Œ‰İ!Èı@V«Y˜’Äl/É\r…Ñ*Ú>şÕ¼QSoËcÎmàê2;Dèd£]æ×>\"µNí}Î1k‘¤LtQ³$®6íÎZù—Ow¿ªŒŞ¹»¡|œØìëbÓLV…;+CÊ}æ\r/X—`ØlëO|’SxúÏÅ Îl‰äYJ´›Aânq·ŠÏz½åXªK®g\nWvÙ+¥Âµ]I~ \0r#Šü–kî.\"dÒ$%#öB>»ßf##‘%0¾$â$ñĞ¡*‚Y¼NÄc{‡TÀël>º°à‘ß(»$-\ZfÇ#¥ÌÏÜÄ…„áîß“_àüj\n?â(0yxQ<Çwö+¿§yä¨.3×a’°F*/rŸ;8ÁíMÑÊ!¹Bl¢(.ülg2SdÓşäÎ™\\@)Ôâü? QúŸLN $Pñ\",L”’É\rô\0eæ)€ˆóä@d²õ<@$z\n@¢=9 ™¬= q^¢Œ(-QF&WÑF’í§\0$Jö“’É\0”¿z	Œ nN.”\\D!ÊÜS¨©ìsõ3züˆËf~ò³\Z>,ÒWDú%ô…?yú\n€ÄË£Œ¾üF‹ô<,ß„îz„dÉV5•Í•Ó9IøEˆÉTdßy¨â„AÍ»…mşĞUV&3B £ö)ˆOÓº¿€Àç;KúäÔ\rxµø³hn‘/RØÄJíõïÅ?M}\ZE|^ç¾=ÒŒcò¶ø\r®~úfç3\ZabCÌ³!QâıŸ„Ñ³(ŒÁØ“S.å-¾^.óü’lO<²([Nì¿>É »\n@–c¹Bg£=éÀ…İËcND0ÏpçádŒ9¶€çÍ>¾_(Z>Ø\"†Ã0øÚ`uXÊ‡œãšM±Ğ÷hva¯OuåÉº)püİ”ƒ\ZZòL³ÏÇñŠ–y“k\"\rñµ!ÿê°”y&¹Øv ï¼9\'%ù2òâ$p\"œ2ÒâQşY“ÏGğ‹ËºÁaÎ¿6Ğ_ŒÒAÎäJKñöÃõ°a>ÉÔÓ@h¿2ÄŸÜ—Êıññ}}¾2º‘¼ı\nà‚dO-ußø¦x7Ü(Hè%Í>¾_(Z>ØxƒäµÁşê°”y’;+;<¼:ŒñÇV%!öà}„Çîÿ †\0#O}>ˆ_.Y>ÚÏbÈ‹<úk#RNŞ\0°`¡ÛÑ)îĞ…ó^ Ö‰¸”?¨‰€\0Š÷Ñn4+®ªL³ÏñŠVlŠP`+N8tX*È›åx´Ğ÷ Óí+£Œ¸Y±-lŠRC@Å»hÉ–[ÚäóübÁ\nÏ„xîµşÊ`”{(+òBÙr~i7È©|ä}ÑC*è„`ñdQ´8©©ö>å	_)X>Â\Zü¼Ì;^‰r2†‚ŸBÃ\0Èâ‹§£{á’Ô%’4…cf|òFõéÈ_\"mìö³ö¼½D¢„·_Ïš8´óJ.‘²Q®ÈeÃš¢©Œ†7‰åØq?úç„ôË¥ÿ8íı\Zd©°ÄHã9aæ’;ßõ%ª58øÉ¯u4ø¹ë*\ZÁÏgmBÆrÁ¡ÿEC%¾Y!†~bDRŞééÜvùÇŒÚU–z/§İMGzú™s³*(øĞ‡\0w¯™Ì«Ğ©ó¿Í;æETsAÑî±—â¨áŸ\'”ü¼Ğø<í¿’rk)wû¬ôo)qky­ı»1Kn:²#’§\0ó°SwO³ª³OÁ„«¨Ü–èyóÅ´i²	­î#»PÖ”û	74E,dıÉ*­?œVŠÍûX?PôœyuÊÁeÆã‹³Z¤ChMÈe,«¶üéìM(²®RáUM.–÷kîë_B Š¥?6â´×hòÕ‡Dk‹Í=“ìÉKè/0ÒŞşï7M-´’²´Ê®€ç‰x_kÍÿçßóË…‚ÏÈ7ÇÄ“ vÙE×È’cØ´ûU±½4å´ñv³M}âËşbGŠ„Y¸ÿş–c)Oì1µ÷Ê¶\n}p•]šÙñ3:JÙÍÃ8y¬]ÁQî]¿_è<ŠH¬ZÜïÓõ2÷õÙö¾4óñ§ã#	* ?>ïÊC©r0ÊPBáá!úgRYC¼pÂïmhT€ ÊZì	ıû˜Œe8Ş=ñrV\0Êñ‚©¼\Z¥i¶ÿÏpJ,‹°««ÚõûßÚşÂSÿöÃ±ùğ¨[·E§’+ê0Ò8Gë¶_¤îóÑ6XÍ© ÂØDús ä_¿‰¦ûÿœÿù†~~û;6ñ¯ª(©—ÿ_ÒÒ[`ëÏºÿö7QçDG>LË|™ùo¿½—b€ Ï¢ø¯aà™’ı?…ÆÃÇU\r0ŒH(ürƒåíU5‡‚€ÄóôKÍ¹nIk®}£-‹Õ±ıxïO™Äô—äÆI“cŠ\Zÿ&±šœ¾ûÿÇÿ‰zfK¾a¨ÿ(çuúVê>è’‰zøN?„ã‡Hú!?DÓÑø¡ä%^Uß Å@jú”oü²²Æ:NÒÛØ÷û_ş·\0À_ÂúÉQùÒ`T J7WZŠJˆÆYÔÌÀ®´•òÏÚ¶[Z\0‰rƒSGÉ{ôñ¾¢‰FTâäˆå°è½¤jzé{<zï*şéÛ–ÅÒ2Í¤Lé[öÁç‘¥E¸¨H¨¿)-ÀGlQ÷·‰¸Ä{X%°%L?2–Ïª´K;•3ÅtÕ(/ÆDb™ÏÜıå]Z(!ŸôX­´DL(²xŸá¨_¦\\Z<¦×ö7ÅòcšQüÅZú½ÏxY‚1Íğ”XQ$&Ûd…Ò÷1ÙñŒ´ª21Ù°¶mzqôÑ3¬RZœ--~²JÇ¥\Zœy)-ST ß•’æ´±Øš¨ÈQ¸´¦˜­ä³üÒµÅôùdh¥` ˜B‚É(}“„¤±¥$!w&#„¢})9C1UœMí¤‹Uô52¥ª¦\nÂ2ÅÊ§ŠIähó¦PJ©PL ¾LWY$a.}çî¯Ë{Sgšåc+<Şûb]y™xšC÷œÒR¼œX]´Ù²pÌKÂØGeïÁ\r­t%Á1‰¨®¿É•îXpÂ7‚0ŞËŠ!©bÑFZV*¦•pGÄì²Rt©hß--‡¥ËÙ•¨áébû“ãªÒµ´`ó±¦JßÇ$ã‹¢‘YÊæÉM=ÊVºó“Ê1)j_óÙ\\Ç$å/E×L·^a¥X*ïì\n¶\'T\'\Z¼Zº³ ‰ÃZí–>“+CZZ\"&.·‚¼‘˜´DAÍŒf„Ù‡s<±U@ñF	Š<-‰¦$„ç%²¶‰ÒE`‰Ğ$ZÁÓ?—.+$&9‰uÜçïŒêIö±á”¾)ÌbON)«Cøm³”Ÿ\"BÂDìJÄT‡”CÔ=+ºz”€îÓv¶Íj^ÂÙr•\\\0E’Q<9IæÅ²b1¹„ÒÛ³r„¶}¡ñY9,M~OÊ%{ÚIt¢À•ÕE›	G‘ÌgÅb²ámÓñ—‰j—’4ÊûQ¾<P¾Ø“Š’ÉŞÇ–îñ¨˜Çª&¶¤KUNkL+—\ZPºL•èÑ€®çó,é¾ßYMiÅ˜²¢€Ó¥%dê–/Ğ•ND£ñ ÏÒ÷XŠ0K$Ûœ¿ölÕ)•8\ZÍU^c£ âO(¨S¬VLQL;šÈ–Ê|\r>9/T\\L\'âµüµxıáø\'îR‰‹É$ĞH†éd–î¤k«¬!—wïüÕ(/ğ\"V\r¡ü<ÅÔcû$`–‡1äÿmî?›Õ²uaô{ÿŠŠ{cÇ{:XµğzÅ‰x±ä\0y}Ãƒ°ÂS±ÿûE†L)eU­î³ïéêU•	cú1‡›s¼1AôÂõÂGwc{˜‚xÛ„Wq7Ìğ£Ñ3Õ+–‘½ŸQTö‹©^Ñ&izÍş\"à0Ò{%rÉ¶=Ha<R\\ƒwƒdæ£\Zş~¤±h†9Ã~óº‰èzııÉhz{<T–¼sUQùÅ%§ÃÍl¤„{ÅhÚ[ÿ+Ò76ºXx—IÏÅ\'yg¥ÀT÷$öî÷ç#êÿAÁ@âOŒ7LÓ«3¯ŒŒü¥sL>½â,’|/yz8(Hê!ˆ5¬JHı=r±²iz1äÇAgJÆ_-ùĞÿï—›q©z¹t¨^k$´zçNÕsR–¤ŞàzRp/e»^_tºóO™¾Š‹Ph/£n×N(Õ›A~ ~a)SÄ³sû‚jôĞÔWã\"Ÿ6Û 	õa—9Œß?,©?Îî Å}ÊøUœ„ê-Ÿìâ©\\$àğì÷f´m?Ù°Â§îÌãYÖğüéwÖ1Ê0ô’l½ôŞ¿·ÃAWÎéÍãK$İ¹.Ş‡“;íÕíê—Ö–=Ñ½²İtü‰lX–èÄÑ+I¢÷NşcğîeÃä\0ñëÑ…_tv(„ø²ËwrÃÄî;CUYçé*/İêÃOy0È=zïùá‹=côì“ù¶s¹kèÑ|Î_>Ô|¹‘ğ‘µ/gƒİ3¡ŞÑßäâ½,pïˆ&åàî2ï}p:Kp¸†ÕË§`Bnúy¼èå›I–6e.î|xSšxïl_®ıAn1ï¬ëÏGNØQÍ‹ŠûØÂK9iŞ™;ÖÏ¤Æ“ˆ±oŠgûfxÌA®ïå Ğ0õ’d˜Äèõ{æöıæAB³—®]ÿ®Ã½q»1l¢›ö›a<¥´ŞÔl9,Ã­ŞÈ¿B·ìá€•…| úb5¬;»¹IÒù·°ÂÔØ\'êA²Şè4æ ±`õö×NñR\0Y£Gªa‰f‘4¯ªE=R½”¤Vk¸„íãá¡½©Ùn7Ï\Zòòd°L¸êŞ?ö÷‡v>ÌÖCÉg™u}¤¿(Ö»œ÷Ã×!\Zz67iîÜv?úy˜İ?î›aPØıí¾ù]¸ Ü‡öß.¥:ûör”÷B?ØÏşè°T²?ø/¨ˆwÙì=öÀH†Šİ»ŠGäOûÎŸ¡uÆÍ`DÜ¦zaœO‚ö\"˜§ã¹Ô›xë¸¹3®Œƒ2Şb%Şõsï!šŞ2¼h­/,më‘òµ	oß9ğ¢Y¿Gƒ$Î{Œµğ’Ü|Á§N‚\\úÅ+õï ïæã#´wZ§³këèù¨,B;”ZÎãÁñ-;Ñ YïV”~x…õSİy§zz9¶zAÕ[‚Q·ÂzlwıÎ?‘mş £:}TãÂ+İŠ‡£$ÑÏãğ^sî|â}¡\"œşxçkMâôÑÓK8«c¹ÒxmÃ=å‰ø•‡{pÊõ ö€{”Êéu÷`•ñË¾bT¯;‰?’½èñÜ»İº3Ò©=Hrç¢PO_Qô–‹é2Üa½×éÆ…ıï?ŞŸ–ìÁ-¯cípo9•IñÅÜZT¯ç¶gtP<ÈÉp^y5†{äÊ5ÙiødZ?>x.Öû·0È°\'÷(–>†8Hƒ=Ó¤öp,îñ,yô\nĞ÷h\'»¤×\Z&y\"Ã°\Z¸‡Ÿ¸zd§ƒRîA\'owÅWÔÇÓC}X6Â=ääJñşMÛå}©;¡ùÃ#é×zB#ŸVº[¶ğÓj?<|.ôzì#ünGiñÄ-ï¯œò¹æ÷7ƒÑC[.9doá.î e¯¾²á\ràï“p9\Zò.àİRÆşíopçƒ_¾2,9êwæíÜoæÎ„—¿Á÷ŸOuÉúXjy¹„ëš[p¬wíJã¢;+Ú™>„{\0LZ¶íEìùö †{Lä_VàETîq.ïT/„àó’{¾=ˆzÑ:Ã<Ô#_.ÇW—Xpg‘”~î\r·Ç¿dI·ç§};Ü©MkpĞ‡;_»`t4HşRº÷8˜ôÃ*´ÇÂ| ~¥K{hŒWD!>HĞë²<Gß÷§>qç³Ï°õ¶Ç.àÂ\n¢G·\\‚¦ùğÁ\"Üã[úÌ˜ƒçGpoy£\Z:‰‚{ŒK–a´Á=Òå38HÖƒ¨üWL„=Á¾høL7Ìå=¦%´;ó3ôp–Í+ÀŞYÆüâ~Ã³<Â|	ß<°‡s˜¯èûpÁ(h®÷Å’(rÃ=Şå–‚ñSìáé§õåŒôh˜{-ÏqˆuÏ|“¹×ğ	Cú¡’—{¿‡ÓØeöt\nÚı>HŞ·Œá^İùÔº$\0Š:–ù ÀíQ5Y§zŒ_?n¿—„ñ³ñ¿6öÓ¢ÓAÃ²Gàdå{pñV[òéÉà	Ücsªç k\r\Z=<ÇèÜîä9ømCQ\'s2‡ÅBÑysŸ‰cez˜zú‹ Œ[Ÿ(_„Ñàªs#.¹t_ÕÚãuI_UÛƒv®´qÙ™o¾¬ }YqV½Oï©¯s\'zµy{ĞN“”Ei|%OzèÎräÎ„õ;Fåù=ùşş«–¨ç>½€Â=rç’xÆo|ıÕï¿¢4{ó³£u3}İoG§»÷tçÑ‡ŸÈÓm£|¥şz¨ÎÑsÕ£vŠn•ÃÁõ˜ÅWUa½7Ñ­Î—(2¸‡ğ<saäy |eèõpÒ—‚¾‡ô\\ÒQåÎB•[Ã0W¸‡òèqÇ?ş @½c.ÊAöêQ<VæÆğ©Ü£xò aÂ=„ÇIÊìõê¼u.qâAç\r¤cGúpWzlÎË÷½Bô‹ÂRãîåëtxöP¼|; ßÎ{^à5`ò\r”lzşy¸o£Şä-=ç<è¹öœÊöáÜ™!³ãlØ…íñ7©îÚ—¾Aê‘77qóEL&±]ï_ë¼äø„óşÕf¢m²G3ª—µÀ½T|ë1;•gÛá%0(ˆzÜÎÙìä9ÔƒwŠ2:O´Û}o_\nÜ|Ãïpéyˆ,¿èmn}¹!¿3£Ë¢Ş=´\'‡!TpéyûŠñ‹Aõ˜dÖ+t,ÜÃx.Á¼a‰ÔÃx.ZÊ/Ê‡ Èı8ü9.SÆİnÊr¿1³ß—Ù%Îôéd­ÛôVy‡Ï_Á=¨Ñ½dx®ïl{;¢èñ?™mYƒ§pş¹Q|1Çú[¨í¢êì2ı\n÷÷h êA²Şèv½é\'ƒ\'Úp²|wP:õ( Ô·­î¯t8ºÒƒ€Ş©^ùÿ=Èê\\á¨fú9&I4x¬÷`Ÿ°Q¥>,¥zŒ£ª¿áÓe\rÒôn¨ç‡©zŒOªÚe=À\'O“áêÁ=æ£´‡õ\\Ş.qgÃö^¡ÁöDò\Zo_ÛÃ&¤A<|UQïĞÙfó‚ƒŞ\n*‹äé|¥—ñƒ…Ş°O^f¡×ş yÿa6x.\nÆÛò¼øà6z#É>ûz\\ƒ‘aãÍ_+cë>\n6îÌr¹ÔĞ>î…{TÖÕ‘L­±óŠu¥º&t&CÈ:…nŸÄÂ&úØèå›çëıI/ˆ±GâË‡nÏ¨íÛóŸ·½¿¹¥Æ\Z®ùñºõÓÒwëEyâ¡üu)†j¸¤Ë{Q~ôP>JÎşPÿoŸ\0—\'Ê_#†É¨Ş”¤›oHËàÃ=¶ë˜;×4ßƒ4foÿ;v§Ë§0Íía™|~xÄ=Å‹ò2MßÁ?ï„Ù™Ù#ÅŞÌ¼8)”p{¶2ÛÒÀ=€ìùCJ;J‡¿]{<™û¥ŞµŞ5_ß·Fs	E\Z~|»ñí±¶[œËxè]Òºfßc{Ø‡ëgİƒË´¯íûrv:\r¾%z÷ 3^Ÿ–©«°?Á=ú,·ã\'£é\n™|ù•\rÜÒ.Å·ÆCÁa¦ïQjŸw38(jßj7Æ¹\\Ï8HvçıÛ–ƒıçÿzv	†¤ƒÌ÷?/W9/PZ»«_X3=Öìè^ë1gF\rF1í·@ši^®)Ò ?7	TFòBˆ÷8³bØ^î±d\'fCOaûİÜÜ=Œì:k¯>·ƒ{ìØåsá­ßCÇ\Z;´Í{ØØeïÜxkxÌz)q\r€ fêáeÌÅğ±•ıÆ/Íƒ´‡†İ±¡U·0ÃÑ¯fšxÏM×Ö‘D×_|¬\0÷è°Ğòs39s{ëÈôÈ4uß>10¿ãHÌ¼B†‡Ã==LìŠF{y¼û†{£\Z^¾\'v½ğd ?MÒæet¡‡ˆ\r^Ô÷ğ0»±/¡ÖŞ‹ó ¹Ø=FV¾èOï3øYáY—ƒB=§·‰­¿ü†\rîbÏô’ŞÁ¬_Qõ—t,åÙîH»Q¼–RH»‡_†oAz,XO5$«‘	fø¯ü\0zC	$¤G€ùIí%ƒp¤G€]¢Uá‹‹!fJ =\0,÷ìÀ~±xöéù‰wôÎA‘­Ç©>x·½¹œM~ÌZÃ5½}Æ±m–}ÏR¾9¹÷ÂƒDà·ëG²22ı ¤Çƒ…—¾°!=öëÒï|HÁ =î+÷ºÍ‘û±Q†Cq\'¤Ç~å~”†ÍÅû\\°7äWĞèEÇ³ƒ4ïPûâ`GD_ oùz”~\'ÀoÛ~W‚ôH²+88·ÍlPO =š,êÜ§ìåŞ€ß\"²{»€pÌz³ˆ²Â¾°éÑdg{øãtä*6h\Z =,ê4V9hÁ!=¤ëúmFş¦‹îO=Î];¶Ùãõ@öÂâBŞn3ºŒäl¤#ŞôÙè±º—£\'*ëÖ#”ûHóz ¥ =Òë‘pPfôX¯Ø.‡¿@z ×mÖÂáğ,Òƒ½Ş¾Ïìäºoúƒ¶\0Òc¹Ş¿²döÆUuG®§Ã4o‚#6`Äuİ2¯vqŞº½ºé\\^R<mcb‰ôp®³¯?\0IŞm”½ST\ZÕà‚¾cØırP7÷Ø¬Æ|ìô£Ï9XêÎ\ZIZøñåƒ¤ü‡ôÈ­KhşÅå\0Hİ²ëôò	­måù0k¼}³ù¸ù=Móıáô©pëêéĞ¡Â…×I»ïó¤vÌ÷Õ—@†ªyñI;ÒÃÁz:x¨ğ½õÁòèsyh¨ü#Lö¹4Öş“¿ß¯)$¼³²ÿı~¥ùÍ}ï©J¿ı|¦=Ñ•ñkÊ·K|3h.¡›A1×ãÈÈ-|¤’uNÅÑ4,zÙÕË‰»ÿn†Ã&H3Ãa*ÒƒÆ:¿ùè6‡Š‘:æ%ev½(t¸ó=6ìì‰WŞç/âÂH\r{\'E†kxÅ¬=(ì®À6Wz”Øá Ñã\'ãn¦ÏA‡ëãìÕm‘H»’]î¯\Z(ıÚ…GğÇoÌû/_HC¿}…ÂGz4Ø­Îôu×©ºû^|A©?RÚ—³×aºş®¦L·ì—\n\"=,³]ÿ\"²‡uSëLÈkvŒë~Éà—›H<ÀCzÜ—ë¾>QDzÀ×Åõ×­³ÿBäôX¯ÄŠ“àÂP±…^çõDø…×ÙC¾ÜÎĞM_!´‘ñUu•]ôT÷Ó ÙÛ×İ\rwï\r™\r_¥ŠoÑü¬{9WAz¬W§WïDz×•³ândv\r;¢á©íyçü¸:CÆîVcøƒ¤~]éƒÙ£¾pJ‡Ñƒ3\"½n¤Ç}½añ¯(…ÁÖzô×é\rİ<Lûâ»àl˜ı@{C0Óbı¤[e>Œ·@Ş¯qJ/Fî 	ñNr¹=fpãõ¸¯ÑpgŞü†A}ÛC½îï© #ı#Õ‹ÆúĞxR¶í ÁÛ=–‘=\\C¯B/¨‘nAwÆ;æ«ë‹ùB$‘OĞˆËÍƒGYHü²­ÁS|äíJ¦÷›]^9†=ÌL,ßN‡ûN¾Ù_Öànèá^Î#{»}îíêíA[¥|¥Yb•Éå•ñp—{öğëWÇÆHÿº|êcSôpıËõ’_ÈøwØ;İ0\'½cÁ:}şE…Ö\'²õ½¥Üï(3ïôE(è]şBôø.OÏ½á‚‘ÚuI™\\\\~\r¡ˆ¾®èÛ­Lvv9­$¹ğÎãmû?3u=\'‚ùtaÿĞ­şO¹p~!“Ù_·ß“¼şHÓYwÍÕ,¾t´¿û€‚~Üï¨éØÕõ­q;érJ¿ºÄbºQFÎ.ßtå‰SüÉè¹o^ßş¯kéN/ıoøŸo]*ú\"ÿºÕı¿(È²İŞúóúeşú]òòÕ‹ç#ƒÉshÈCë*ÿblïo÷ör`tı»W/Ç×©æo|èãë*ÿb|ïoÆ÷ör`|ı»W/®ãsB?íÔXæ·Ã&ü÷	ıùY–dÃŒzİÿë;üüi¨Ï¯òWo’/Ÿ¾¯Oñorè/şãû«Áõ¯>îşæóàn/Ÿ^wù4ıGß=öïŸ»^Còo~ìø±_Øß.BMÏnİú²äˆ~Jñßÿïµ¹ÀnœLï¬Ío×ÎBÿõc˜Éo	C/	Pœº’tõŞ<Põ«\röXû+š‡’¡º6Øcµ¯jìV}h&6ôÓD¼¯ôs…_Uöº¢iöşìŒşàÇ“êüDrÑà×„ÍO™å>‘]şø”¶ïà’‡x(¹Ö;E’]{\"›Ùò‰¨¹|ëğ61ès[·õw\Z¥pWO‚P$dPŸHòàmÔ·¤ˆŸ(:oÈw“·©±qÓ >]sŠå\n\'¹¸ÃïGxô‰ä\nşNDÚ¦[ŸˆnWû\\l.»~§e)’!‡i/+{¡ıc`\nûÁ_ïáø·ÿC¢ÿü”ìQÿ²ò[¦²?~Zè!öüYÉI?”¾f ¼ÜHêï·¼b÷lgC™Ì>g+vœ·ôgºå—ù¿Ğ·¤‰]:‰Yæ?.ußsHCß oxWñå¿ëÄ!İœ]şƒº™£ >ôæC\Zô¾IaÔı¡>·úœ2ùyQşD+¾²öçŠy–çìg?gmë«»§l»Çº/·Wıñ<Ï™é®)Õ³Î¨ÿiÅ×¯Zû•êõB¿ªùqîWªï“Ó\r2Åp[7ôÜŞ†?~2«í¾.öa•á~•ï=½pàs?,ÿün/·»İà—³„<ú×…¯½ù²ğ‹å|K1zIYüí’åÁ†Ò#?&»ìµ6\Z¸‡İô4–‹›ßù…Eóãg{ß½ï9ï]‚~ZõóÜx?={È®|ÿ‹x\0¿R¯n^¿˜¹rìCªCèŞã>s\"ÔË¹o?‘—#|Å/zvg¹On;ê˜yocX‚Ë»ËÇb¯úŞ÷¬³¿<®Îıñ©ìs‘áa¿ÿ~Q¨§ûşoCcê+òÛK{ûç1µße†L¥W\r\n§W×§NXæŞ[oï9ÑÿÛH¬æßŸ™vúªÂé{Ëåù^íOLıïÔ6¼hO9Oß„ñC>eAãÉk:ùë_ØóŠÿÖD]+¸¨zh0ğoÕE¾WõË…¿âdèÙñqóıvŞÆ…ßtÆUŞx÷Qò}\ZêWÜğ–9¶Ïrÿ8ûÿŞöİôÁNêñ:ßí—Ş7@>Êûd^Y’üé’}µ0Øufzş~«èvKßW}ùvcCr`?|¡$İ}Êà{ıløoÔa^¢¾OJ}ÈÄ¸Lõ%=ğ³´ıdßâ›;øÙêòVşyIêÿjL¾Cõ*Ø\ZÙ–åü¼Ö›±ÿilO.íOŠ¿Úß¯å«‘é¶îüÂ|]\"Ÿö<øºôëqıíJ¾Ö-ø\'Îÿîù–eÇßïg\ZOºëêê~1öoÈì×­÷ÒíÕ}Ô¡lÌ/h‡Ì€/sxÿ¼ÆYıÒğê3€/m7±¿­¥ÿç·¿mmã›f»—os/›ÈHÂîÉT/’îÑÏö%pümn—öÿóÇÛïĞ™¯‡ä4º -ıÏÆÆ·\\Ôı–\ròÁùëg³ÿ‘_ºB÷ŒÍ¯íßœÉwöM\r>¹ØOÇh—Üš«ıŸ<µ»âÀÜ¶È½™–ázjwİËïÆÈ-iü{Ù[bÈKêğ‹çú¯ë¯`\Z»]>&°?ü\r³Ğ*h2vºûß|¹öøµ{ù‘¿üÅ°ôşò¯#˜Kùò·yu£JÑvÙ¥â9-%îbQHü(T¯EdmóY »®û¿ÿ÷?;sOw{ûç{óøêÍL¥>{I¯ÆJ¾RëÏ†ZA°¶Å‹¶»z«ä¹X¤“ì»}î$ÌÇ\Z¯ Èm¯æÁƒ4°p‹´á7KëvûòõCüíC<ğC›×|¶Käbr}ô~½²ƒöã~ĞÏÍŒ~ŞÃëE#Ù®Š·hâwÆõgá]?Q­+HñI©Ü£!7AuC¾·@½;í÷©DŞöù­ç#ìç}¨.’/5Ö}ÉŞfY7ºeaß»só·¾âÀ‡Yıãk6œÿ;ËŞ†şƒ¾éåA}õÌ‚/Çû*DüÖJá¡ıãqp\r“=2\05Äƒ¡²¡)ø8¬[ƒ–sï` ¯º÷MÿñQ¼?Ã*~7®kğıi¥_Ğ±*·ª.‹üÂÆøbŞ+ºôè¯{ç.ºæÆ‘—°åÇÙ¸ê‹ŸExœÜ\Zàïå{ù›Z… ÿú«Ç®\\A+ÿÆüÜºx½oòëÏWûm°Ä¯¬Äë	|lé²}K10ÆËÃo—ËGîmcğoíÅÓXÈûAƒ¿˜üİ¼™µ;ø!2ĞKŸÇĞÆ¿ÛÈ[¸â}!.§]ÿf>\r7÷¼ïñ»]Õ_sø½ş×uuŞ~oşus«éÌÌÂ»EÀŸ,ñB‚Ü\nDv\\¾¸)õ¡=ÖG_ŞÏJŸ+½Üş£‡tÜÏ¢ëå=Åäl’kÙ?Ÿò4}şB¡“öyË¿¡Ôş?7n‡®ïvù­SĞ+^Øï¦3>œ]Üíê—P…ïØWx¡÷·ğ·—x…şİ«¿¯@?3ì%¨ó¦^ß4ÑEl<!ïíş§#×ge|=Á£?`ºœ†=ëåOçÏo?\nŠC|êî‡\róí·?ûLB–İ™)¶õã}xIÔâ›¯LûGCõAÂ¡_Ú©ƒfÓ\'“÷ÙSê½2ºœÉ½¢ül©’ï3{÷p?éÏ7IõÊD±wErıùvÖo£‡‡C\r¼.ŒFšŸAŸ<x¸òâ½Ó\nîAï}©áû#v‚§ø76ÏG¡>$ÉŞh†\n?*ƒ!ÛÍdÖŸû>?¼T¦Ù%5f’õ¼|¹à)3ï~àÃ|!}ÔõA{5…PÅı5ş í»òlxUşS×èRÏnÇ^<íK-/·Ü•pBü$•ˆ¾ÑÕb¼`œn;¢ëd•ééO6åS[·F>„€>/òŸ—¿.øëO}ÔŸ!VŸ«¸EN?1çSĞs Ô5p\ZüÅ\Z(xÇd\r\0%áYïùOå\"êå.À¬Ï¥0Z¥^ÀbbÜÅî¯ÏŸà^ïˆ­ÏŸÀ[ÃÓ24>’$¿\Z\\G?P‚>±Ú5÷ç-áDç[g®ı•v,·°ÇØ\\Ïµß¤SšÙ¾ìÃˆÙÚæhşcÈşÁÿ«?X»{Ô7´Ú·‹ÚÿÔóÛå¹(t?ÌßmŠôäÍÚº)Ş![Ëv.şúCıÜÎ-ÒÕ6ºa7òË3÷XúÇ¹B-½Âã1e:9€ƒy<Bş05÷o’ïßL~÷\Z”6_wúÙ*øUÉ|=Ínèß/¥ôp|¢7Œîıù$ËîKğàUÂÎ÷ˆA,ÑÛ­íÃÎËÍùdzÜ]‘»µñ İÉ¯v¼ô¸A>wñE|óé´ã©{ÿº“²¸æ†½Y`ŸÉ^Iÿ»RÔ£HF†R>wîŠ¢|UÑ°˜½”»>ª¯—ï[×´aéónù`ÀCïü\röÓ(ÚÕe|\r9tˆ\rİrí|€îÑ‘ŞúÄ‘7†ÀÄÜ­šşœæòË%hâÿxôbîìL~ôpì²Õ}šó>»ªò4»Ø W?5ÿñŸ8òà/ç?òÀx|Ñtÿšcşrä¡aH	ØßlFY©Ä!€Ú²<„3Ù7W«C¾ŸTÓ¥ª/3_¢7l#,Ÿßæï.…æe®q÷ĞÄO&[f\\AòÚ¥kŠÏiáÎçu»Œ\\cvtĞVF[l•3€ƒ=³-E€ JG†ÓL¢\'Pñªõ‘á º‰”pµ•rü<‡fBŞ.,Çu=Ë^¥k€“æÑq²H;aOpaÒÀÉ\nİĞµ=cÀhH>xªÎ£\rä°EC9V±%O‰Gb²¢\nâ*deE²hÖc%”3m‚³X‘SÀÌ‰ÀÅj¡ŞÈ¶E½Ø–n‹ĞÄ!šg¤†7¦YFÖìTŸãd¡­GS’qËú¨KÕÈd•H1ZX0LãkÏ‹¼Y\\q»dWÈr3\\,Vb}he†Ÿ1ºEO«`ËŞ¸ÙÙKŠ1¥ñÁ…vHÍßå›`G´6•ë¸•,ØÛêÆ´t÷c4õí1,qÂ?eÁaª×ecvåÂ”üÔŞf½Ón´\0AŸÚÎ‹$lßŸG’¨§`YMÎêÈö0l>±²äk…­\rïsÂIBÍZ$‰]­Öæ£`ºQ$-¯m¦)7œËL½VííXûõ:˜’£0”f2\"ØŠrh\\À¹wöÔÖíZ\\A@Í¯6	°ÂYB‹“IvªsYï¤fV³›x¿X‡Ó©ÔÂd›f„Gow¿%‘òläµÇè1;‡gÌu×¡fTLÚ¾Œ$-~âpÁíf@Ôø&ä\'4ra$yˆ90‡=½]—è:Ø2/öO~rÊ¢Ø‹ĞÀ’ò9Õ°?®TÑÒW‡0Û\0›éÌeµÜWÅÒçsÅâ¶Jé2KQkbjÖæ¨xFC$HOêñL°ªkºKŒ\nàü”5µ°´ö¡„HÀrŸÕín?Ÿ:ÂV—Tãf\Z„Ë;ß*–¯Vè|EÒØHÏoªs*¬\Z	\\\"Áä(dÃÑB±?LÑI#T/’5^îÊÙšxŞn™|=[ŠS\0cÕÈ¹{ÂÊ³èi^Ö°´§nƒ<bqšÑ²°½óçé<•\Z²,4b´#·ÑlMDg´¶2iEºcT*3w­°,Ø¥Û1\0˜Şék!\0¥åIkÏØ+&KqëÎkÃŒ©%ŞÉkYãN_o‚Åé¨eKc¾‘3Œ¦c3–”ÓiqÊiAªå%p’ÌÜjö¥`.5Üi\nKÿló!%Ó3ÔpW®¶	p4«qµ\'€±Ù…xR`®?ŸŒdºÂÄP3ìte{,Ìköõ2¹òNŠ÷æÁ‰Ğúé^dº!Ÿ¨ñÑÑ6ëvúÚ·ÇU~<qá\ZeZr¹ÂZ%Y‚aæH¦°<Ê –f“Dv™¥í.Ô=.,7™øi\'g\";1^£UZ¤@‡:ğÄ.ÙDÕ3ÆZˆïXBUaØ›¯aB8[3bÑñ¬¤mô¥­Ç³ãªiÆXÇùØÑ«qrx­ê	¥›teÏX¬!]ÓĞÙ½»_bş±ZÜÁ¶E€Œ#åc|J¶»\nĞùÔ_N’›Vİğ…¯/u¥À&h#¨ÀÄ)ÁŠô°GãT™R­•nf®º\09ÉãÍ`*[úA«Ïò…:1G£S,\"³\nëÄ\ZÄxÓœ7{q-•]\Zg‘9÷T™ÖŠÖ•´s	t3óØîö1¿Ggªµv;×\0ğÜ±#Îe®8k®\0Æ©´8é‹šŸ0\ZÒyŸ:šH·Ş™i ¥z˜è¬!ørj›şhÉÁüqkÌ1“c*Şò°©wã”¤gR9Å|«ˆtèÏ¢sçídÅ,wçÅ1«°£)yÅŸ¢-‚©[n/Ú\\‰šyÃ5=U¶Œ1ÂhgSÓL[À¼qX·skyŒ¼Ä­`dºÀgü¨óÿ¡±³\0KÉóÁD»]Ö\"ñÂ\nØÕ>A²çúY¶uWš­\'[Œ÷“FÙQyS®níì¬(Ô0g™Î¶?q‘r¬6hÈ*ÒŠa­°NÌFÓ1gˆ§p›qlîx9…\\‰e‘6”Œ8a«h6ßáè™¼]t3“Ó‡b?•Æ¥8æ!½C§šÆ6[g/Î­ùÁ	å\Z°],Ç\\)µ˜ÖåŞG6¥ÏµË–çeo¡5âTÁ$\"-£EG$4Ëf³cå®XMâOë±Š“k ãÁ=/Ö´’Ğ0Ü6`¸ÓâY0oÙp#A1~ªÇzr¤\0¡)èy1^oİU`5İX1ˆ3cF$î&ˆj*?±1ÏüŒ4ó=SïëöØvOàé4(÷Ø‰6Ç+cA˜$¡å„áœzÍyüBOş!§°”ÎYŠZ¥1İ\'F)XÙ‰¸UUç9JÃòNÎÉR«;ÉX}i\n2‰}Fº¡;Bl(¸%w7ÛDš[»HgyQNG§vé  Pz®Z)NíV€s	y\"åº–ş1Ûw³½THJ`Ì$tÊëABz!\'äQ@ŒìÕ+¼|á5ë‹ã0£K„1îD¨•¬î§iM³Ñ:mR°¨Åƒq¤6u„|îkrxZx~ÖÉ…jBÑjÉŒwc6÷Òµ@¨³ùêÌ¸» üğS.˜+ğ\n…Â9E[oœ<L—r4Ô1rêˆàzŞª¾rã1ÎÆ¿6€1Ì\'fÜ8A»Â ÛºôI§šk“RŞ›¬ÙP4kgVŞò÷>yèÂNÈÅ@:Sœ`ç@ë Øšx•\'ğNSØGm¹i`zSÑµÉ·3\\„ä¦Z¬÷û\ZÍÕÎ,Y¹ŞÄ‘dwJÓñ2ˆÓÚ*´*©SĞÏ±Ù²ò\'Ó›Á2ÕìØ­ó™Å\\­Õ16Õx376X˜NõUuA)\Z	F_Ví¦L\'	œ\n¼`†óMQª%šsÕş(¯fÎaÁ\0Ë­ÚLx<rğ©à5-i‘•:B˜qŠ|5Ú+›ÚÎ»‰ˆ Z.îKİÓ¥Y{nñí»ıÀÓ¶†Ô™Ğ¥òà:„7êˆ=è3-ñò%î‹Åºö(Á°½±>R:ƒàãÅYQ’•¢p†Ï<.ˆsÎPhÛ4‹ÛlÖsq9iÈaŠƒˆn$fá•*C¶kSÙpïLİ6ñ];ÀvÚ‰±m…(&n:U¨ÉxS¬‹c¾ŸmÂıl25j5ä,%s…š0É¶\'9}îì®°š…È‚ç·U‹.\r0w§ª°]i‡)»d¿—‚56Ùh›}º>ÄAA†³Ú„´¶X‰¯ŒÜ©9èc…c§º>Q‘“cjˆo6ËYgÏ3±ÇúÓİR²—î&úÜ×‰Mkî¥	é\"ìds¼Ì«¼7r13´b·®‰Ch	ÁÓ×åAÆöQcÓBQ‚`µÆÍNj¦A‰»P9P	÷¡—;£pºç\\Ê\'jÕÎØ•JÈs’°”Ì´Ë97ŸmrØYÚzÙ	db‡bĞR)ÈZŒlº:Î©T“ùÒ±óMzJ\\@*’V´XÛI])d£qHáæœE¦[©Tı]†œğÎà S±ôŠµ®scÓ\'ö°Y¬*Í=_áğ	_ÒX.¶G]wãµÀXçŒœl\n3•Ü=|¤ÇÖ\0@¹z{„Ymr\ní$)‡ón_PTˆj¨n¬ÂõVYÁaT%ÚmêVÎ¹­–Åj^ÓUv6öúˆBvkxµuË,%h–?Äåtm4úqºÃ¸ÅQ² ÃÁóG{hÙÈ¾ŸV«ùXßKÄcÑdu\\ñ[;ñ2^4d62áfÙú&[ASQ+ah{‚hÍŠı’í:wN	j#ØŠgŒÙÉ‹I.í±i £ˆL“\"At\Z”¡p˜lıù.:ÓBÊ,*kå‘»1‚2\\Zâ¤8‚†—Iñb·üv5Yb©¸^JÓiê¬PZHÇ-0İPş¢à–MÃdZ03²*B³½-|œ/O·Â\0XI×€íI¬ğ)XjV!aLŞJN{Xñù&tòÜ­1%„\'$ÚıÛÓpBW‚F×K¯ÛÉø’çÀv§7$(_Bø4[±\\ä†³ğäŒÖü4Ûâ#T<‘ì¼˜xÊr€Ê2wÇ+Òª(d¯#Û\0X´Mğ¨L\n²X(j­¦ZrGí©m+9•+¶n­®´Ü¦İFQ,«ÉŠögÔÊƒ!ï:32¢%0˜#’™‘©¥K~ÜI 6ÏnmÉı´;1*°f< —áNQ\rcbBèVã:‘Ñ<NĞôØÊ‹™²êz,µH&+ëiàhÑ¹q25Z‹2:TkG·›Ğq¼È3<\0VÌ¬Àó*®ÑÕ*Õf3Ò\'Sl»UQâºBşÈß™›SÃX`b8Àa\0kN›‘‚‡c|m;gD”‘Gm“S®¬Æ{¢ÍdÄ^ÆÓ¡m*Æ\nôèˆÈ“ô„¹h	ÛG‹rNT”œ	3t…-\"¶A5óv¡Ågdf¬–`DÉ[§S Cq§1õŒPÑãr<RNãH‹ğ=Ø¥œésé7JãÚSˆa)n7.±¤š­ÍI²¯$øLÑÁjCÑ	¢œ`U$¬rëÂ;ø1õ¸ó‘Î c7íDÁˆ‰ÃÉc³F|ÉZL)×æ¾N|½ÅI¬-à´oúÒİéNòHw±«,4›EY²–·fä^ˆ«ÌkË‰“tÄøLãØ\rÈ¶Ş&\Z>‰D.EÆ.½j‹ìht¢YÌ#?°Mï¨¾Úì\rÀP—«î]Ô²fâîÀfÉi¥OÄ1â5øqLl„B›Y»GÓÉ¹ÑHV:³¯ÅCJ k`Ä§ÌÒó+¢	&ª±ÏÍ]»íÌ’ÈmÁ|T»ê.ßG[h›´„ê1½èZê4ãB{£¦Zm„ñÜÍË|oº+İW¼È\\òåö€Íx÷r`%–¯|Ÿó[ÜcåH·„Ã‚h¯£*Óşl¡lA=‚\'{ZƒÔÂ¢¥ÎÌ¸\0ËsˆTŸtå¯Gµ3EµJÉÀ±O0 Œ¹íL	w#\Z\0k:§€ğVë‘6,dcÜÁb·w«-j2á(Ï¸F4çóz¶Øi	²“i3šu»—wFÒ˜ÑÛZy§¼S,!İÈg5K(rJ€uÖp Ã\'®€ø9¿¦3t¶_Jáãâku‡(…pÈÏS€íÅ9yÑ\r„òŞéÿ`¢lWäØ“-Uâg*[¬ª(¤Ù~âRl¼Ü¢[K˜aCfsÎ†¸2çv¸˜iH{ŒöÍ¬Ûô¹œ¸ »‘VçøPk{v‰Öµ—[Ë\nŒ×ÇŒBYw„òA€‰XÂŸãË»=ÀÇnšuŞ‘Œœ’‰ÓÌ™+=Àˆ19\Z;¼aÌâõô¬,j€ßsçL™Ô¨³õÔªs¸ùklKu£º„Ãƒùy[góµÏXmPûÛ‡PcHO°¤¥Œl-Ö	Ô³XÔ:ÌõÆ•D9crğ•5?!{¶äE-Ê \r\n¬Chƒ7QŠĞ1+JoÚùYÒV¹ï´C:á:³!-[nŸ¡N²8äe>Vş*‰\\%\ZpŒS´4—÷¶8S˜{RÊ\rÀùæ>bšC½€}lİ™±	½>¹Ï·ŞìxäìwŠ	åø6²Ø	b:ŞÚ>‰ª(ngüŒ/åî”,••ÇÏG„w‚RÀïtj š…³vÎêh4EVHq\"wJ&›iÁ,×Ryj©5\\î[ÄÅÅeéFr\'PTigˆîöD+.8Ì&k;,zµ\Z¹¤$¼-Ÿ9U‘W”<)¡°ˆ`¦.”cg¹fód\"î¹V1SK¬ ÍY@ñÙ8â‘ÕN¢0Ÿ–\'–,™\rª‚¡2£µMt¹»_›©µoiƒ¬ÇÛŠŠ³²@à`ìC¼{ÖNêZ:B!§êiJÓEÇoÁTE\ZÌ¸s,õ&O(Ú<W|mT‘ x²Ú¤RÁØ GRGËZŠ¬µ†|r¥é<l»Ó Ù¸f8ÓÚCQNSeÍ€\"iHZMQg5v‚õNc~¶t ¹å±Eu8(«iÃ² ¡7`ÈY°Äê;	ñÔì˜7`Æ{-ğt¦E01óO‡E0ÎàëñJ	jlï1»3ìÎá¢“¼ĞÇymG³©\'Î#É™b[;˜Aî&5’Ù¢ëgD˜IÀ[«$V#®‘Vy\\%$ÕXì¼d`È‹Èã‘ÃõX„´-Æ…è.ÄÅb‘{\"1VMÔ5ˆŠ¦§¹ÚyF5è;+Ö<­‚SÓ±üh®©p)û&”V2Ë°Û¸³©!N†q‰Á1%M¦•NˆØhÏË»\\$é0uõ¶{\0­²°®ÕÃÂå_»š”›šÒ“éœ%Q5™;®ÅùÓ¼iœ=«±fÜÖã‚ğ­|E`Í2å²\08 o~àÎÚ^•²š£¨N]êNšNRzb‡ıq2áå±~Äüµ3EsæÀ2´˜´ópaUûÎıÛêÉè€ßò‡%F¥ÔvÓÎ7øBi]eälBÛ\nd¶ó•>.ÆÊÛ.I›ôd©‹âÆİm¤ÅôvÁ+6€—M\'~¿L|œÆH%{%ŒŒ&FílŸ8ÃøœékDb@oK\ZÇq68#!Íú”he»ŞJ²¿ŠÂNÖv¾wØ.cmm=Ú;VÎØåÛ9·W”K¹Bœyqg ÃiË•GNq¦\Za¡uÜ .%,¢r^úòVÊÒ–Áà½0¯d£Ó!ëÅa•uÆs>SÍÌ„	°3â£±g·óµ\\Bœh™Í«1WŞ\Z2–§hqÁ€÷t€øx\r,ILf¶³M#©¼Åv²XŠ>ì±•¸ÍAß8¬a4ÔôÇ –7\0‡;hwPíQÁjb£±7ê}kd£Z»JÚë¤&GªÍÅŠ<©:zÄ\Z&šÎÇœ ^Á±€,}|‡ »ñÁÃóTg<Zc¥CAˆv{<÷–Iá›ËÕ‘©fÅBë\\Šµìé¤\'œ÷ÏAµ£°DÅëªn±Üû(ÓéY=F¨üò¼Úˆú80Kª“÷i§¯ãSäP¦ë) b39„öäQ;0ğ€z\nÖ¼\"‘\ZbK5‡[{†oWÕ¬<ä¶ \0Ğp¢ùŒ¢¨e`S$Ëh¸ÇÈC6»:Ç¡MgÊOj`5ÊšÙLÃ(£\0PË …Åx6rDZêeYl¼Ò=q®²ÅæÚ¼:œG%Pëji	Ğnµ\rkŞ:jûÕ¹Tòu;®$4>ÄYÊÂõ|»\\pºÅÖ£j’¦&ØYpi&*yXÎÂÖóÙ:u_2Èú¸¨b½d+E³i¤°¬“˜\0¢=èÀVT‰¦ì‚´÷b—l˜‘Ovœª¨…a\rY9£—æóZ q\'ZŒQ,e¬NÖ\n91rºîHQæx¡·ë¦)­Å‚³Lr´Êòéè¬«g¦ù\0½¦¼u.åj~Şd([8u¸›ã•¤š8“F–ÓŠ	26%×8Ù;{MÇ™İd1Ë[Õ[e7³³¬°ó˜;…€¾Äcc:Ù²‹ÓñÍme/x*\0\'ÚM7Èd~vEˆ:èÇrÌá“%*^îI+LWY[{6‘²rKHêNX\0§hp¼‡(ÙIh’fÔ€gY®t¡ú«=“d¾œB‰Q›‡J±rPŸÉ-#xÜ‘\'Ìì= @Œ×µã¸…‚`ÒI]NÌÕfÔ)¸:_m\\‘ÜÏ}HüºÅV“Mî\Zmd²Ø­¢qH@0;;`²æ£©¿„µ[ÌÕ²>´šmêÔ=›¼>£{?‡\"ŸceÎ\"HãçÍ¸™„™kíÒDwâs-U‡³Î%!Ğ’œKsr}ŞÙQuN\\b>ÁÉÆqr:\Zø¸4;#JÆ@ßjTyqV@/\'tãÙ[Ò\'Ó±dx3,YÛ gòZöí³À·\"njØlul–[MáM+ã\\/8CÈfco\'({¡l¸¥.iá±]ãËT€CœXÊ›}¹…]g¢œÏçÓ¤é=$·gOßN…h«F–GGëè–kŒ+&šÏæ¹’ 1Åñ¼3º××a…T‹x6BMìØÂìšçRCiêPáêò§Œ`S¤\0ƒãr$&OIØfÓL	š‰èÜ%‘\ZV\rXÑ‡£…›t;92ÌÌÕ|4]KSoe/ëejAGci[ÔŒ¤‚Üƒ?ìI²¶<Ì·³¢ŞG	ß)zS®ÂÕò„çîf%&ÉR(óÒ=\0oèùnOÎM]È\0‹²óûËBÅ½E›‹í<ô`_Õq®HÁcy!èüÇuxØ1¸-Í˜­Ó½MŠ‚	É\\Êh;£›Q±”ñ¹ÈOó#·©ìæ4_B!QÊBêJŒ©ì\"±˜ªç=å©‡M3+ƒÊ‚;À	ŞJsn£fÄ~ÅOgk·œåÎL˜Iá%IŒ\\ù`¸äQ¤ÆÆsØ‡µJ¤\nñëÓHÉd&@„ulÄöÌl2EÖ®sĞ³\ZSXùÈÅ¹\0V~DèGÖ,ÛcjtXìfQ@ÓlB¡³©&±%-²©¡[vãš(ìdç.§vÛî5P¡0Á$¿Âœ´Çk%Ş»£¶v¸íT`Òœ¼]&§öD–ÚÃNï|_8ÎÏS’2ü|q^-E£T—>Ê{\0;\ZZ\rÔ(Š‘}6^05‡À/·L|(÷k\0jQaÔUizŠºÆÂoî¨SKÁ#¿>mÏÌ w¶,’LfÆt>X˜Ë×¼ìï£i…íMG\rå%_f\'\"dÖ›±¶àÆ	ŸìçE¸Ÿ3¦â¡M{ó£\'\'J]k´.íyãbÂjï‰$OÄ’}$å&IÅ­ù.q\\)\"œ»ÙJ’=\\«õf]\"[ÙweLæ@¸Ú·i¾X\0Ğ®Lr+c“ŠGÚƒê­1]„‰”Òğs’NÂ`em¦Ú­f”PêÎÉ—¶Ê	D.™B\\kñ«9Şˆ	&NsEªé˜³ÁÔ”:¯c.lË	ÚVªé¸ct;UyÉc†,³)j¢ØR\'	2;›{`y‹ÇÈê8§¼UC+E\0¦f%)XcÛÎˆ*Û™³izRL´š¦5nxÑZ`>óF¸öÔìPŠŒÄæv¹`k´„ö¨İ“t`eÉ8)ÚÒ„Utä6ö®&†\'éN%‰V—ÇĞ\0wºeH~ŸQÂ”ÎÅ:q¨,*#àÏ \'‚Ì½½£€E¶w.€J)©Ö.5#	Fé¼ÍAQ ‡9ôJL)aa å@Áè¼û*åµÙ\\:“ñ9Z¹¸É•ÖQAÛ´ähpT0,Èjí‹l-…º­8¾&ç 9Í¾f*×u°Î†!ÑZ­\n³rs2¦…u•Å$ˆ˜´›¬ÃRaè\\I\'ƒmslÁ¹älÔiI[@6œ7ÛØ(iK¿\"Ûä¼¡ˆ•ÌWÂl”Ùs 4»ŸÁEŒI’Ñ&¢ëüÎ×Ø6„â–›z?M$qz.Üåf\r4u†=qÔj$†Ì¢TÌQ\"-Kø¸ªiÈ`‹PqFaåì€ËŠ^km•)··Ğ`¦­7ßıÅh¼6Š ı`Î‹™30c]k	ŒÛ8qt}AŸ(ĞU}İY—§FA¨=İŒpšÏ!ç£ï„¦\'ŸNØC:G ‰%‘_ÎLQl*?$dXñÚ±’\n6ßi{²f\nàØ‘yzmÎ\rGÃ	ê<U‹K\ZØ“Ö‹”Æ´G§¸ŠÔbê¼–\0!­9,Å@£ñ5\\ãÊ`5ü(c3C†’tvØygÍÔÇ¸†Á¢\0Úà°XËW3÷4+ùÕ””6Æ	\rnó1Ã[Ak¶Ëi=BLæT×ç¤t€ª.YXæS%9#¬v³W[È,eÉ¨²£12Ã¨Ã8\rTNc‘ÂJšu³½Dí¡C>ÑÆz°ÛŸÚ 0ı\Zß”TM759Ó ÊÍ#ƒÉŒK<w,xêäk\'Ô•ƒejNV [R³3ŸÁ4\n»¿öYùÛ7‰ÿıÿ^2!éÿHâ°ù–›×»FôØúö¿.Ÿnô¸Q¿¶ÃïÙÎù/øOüŸ|\"î¿Cú­BâÌ¾Âê.»ÈJÓúŸ?ş Õ¤Ë_¬tG«‘e§d»»—=Z­5Ù¶ÙàÉÙˆsœ(˜(œ¥N¸¶Nøä´¯+M|ŞãUnkXÓú\nSÎ÷\'É_¹Í\"_3µšì§º ­ãñœ¯8·vÉjm:5e;uç2Œb›Á ö…(1F±Ümí3µÉ3C1\0Ês·¥ÄMÈgéÒ;NoÀ£”Ë¦Öô¡GxàÎtbKÎ<JáUüˆ0sO±jq‡ZĞè³ŒÎ&Ë)ÄËóÖœ¬½ÁoÓ£ÈóæH$m[Išcn\0Ë=òÀo\ZwTé5·ÉK™kÜ,0ƒ¯GG‡±å™\0²MÃ£MMƒ9è¸¹ãfW¶“£ <…ò–¢!âÉ2KéUŠ‘ÈZ%•$Î®v%n1ZØ|–Àì<Ev–[H®Ò€ò*f¶qhªc]oÏK0¡Àšhìõe>ÜÉšRÜ©¡˜Ha¼ßûîb×¹›Ê¦ ƒæ”,á$ü`×Ç3íËÖ†§\ZÛIE7ïülÚ†ÀVG«@gbî­m£e9dÇ‘ïğê€¼ädDÖÙ‡,q’Gaƒ’»\\Çr×ùtÖ¸ét¿%\0÷ *$Á§šˆµ­MTj²^Lu‹\np²DË\0BF›ğ`8§œÉ(\'~`Ö†á4Ğ\Z…yk;‘\Z‹‰ŞWdgõ‰úhŠ7.³V\'şbÈÕy•z/9iƒuÂá	İ\nÆTç,ô$d¼_@v)ªd5Ş:Ë-¯s@^Á·zĞÕÆÙ(UcKŞ“ü¥\nòª¦B÷,OôX…\ni²İtÔıÆDñÉêˆ:C$.w¡º;\'I{ÕÂ!¡Ô%T?°¾<ik6¥Â©K“IÉ›–Ó“rJÚ*=e:\Z\\^\"zÓ½éç“-m9Å‚7eŸ‘TQùÊîxP…8obiddf,Cu°³°hTÑc|~†Wş#éT6524³ÍreNck¾´A\n£S<Ñ~«t\nÒ›-ƒÃø¸ÓsP9†neA—•Y3êìÒm‘ênLJ±ù8Ÿ”bg†C0½É«ÈFCwÒ:qœ,qbLiã™úE X#qŸœ™\r+ø*Y¥Ì>ú4;±f‡*¡7<›Ds\Z˜Ÿwy”¯¤1Ñ2¦:jRL<&» ÓRê™LñÍ¼¹7?xt®¬|¶·DÎ;¨Vuš!´¨è×tÈØâ°¶»äÓè¼&›<“Ü`ÊV§«:»ä,iAQÎ´½†X„Ó\\KÃüª a›ä8ÄM=Ùªãl¿„ÖàÌ…·±È=>Ñ†«+ZàIÇRÍÈ´’½%îe¸g\Z–‰ƒ:	FÙ˜\'\'ÀÜ“\ZkåÅaUæ’8§³0dqSµ–(ú¼%×¡P¸š/¼¤×ÚXK„1TM.¨Et“I¢sÕb©†)É	>4V#˜¤§0\0Ğ¥È)Ó©Åâ]²š¸M1ËS¾#ªö2;Hk&/MËŒáPÓmÆ@¢bkã/%Ë$Dç‡]_øH^Ò£jç€–£±$8<¿Š¥Gò2Œ£nu‹\\	ft–<€FÁ©º\\\0ã‹ÂpTo!„ièÄ¡D.¢ö@ÒG¹1E7-7ãÔ5íNØdJW<Ã\Z˜Æì4¾äá9]ã©nÇ41ÊN.L5(Ø„èÁ Á¹Xô¢NkêpBiŠ24åWŞ\\\"ñ„­—ã,YM—¢ŸØY²m¢ôğ96i¦EÉ’±h,?¬ƒ@ô0N´Í7³\\8îOÉjN®äÙîĞé2V8­Ş	ª3‰¹ƒˆ\'gubXŸ3£f³Ú«Ì*Ÿ;%<.ËŒƒ­ÍFëÌèÎÈõ\nJ7æZš8àzY³9³Sa{S;èöÿ‚%‘u¶š¹Õm¬Ú0B[+H¡‹Ug\rXŒ\rêxÒ.ÜÔ·:SÏ8-GîLµrIgõ&w+”ÜÖÌáT\0 Ó¡Ês2>‰ÈåìÀµ¤£¡T©OÁ‰&/™I\'&,¿ÉUŠôÁ…2Ò)’Ì‘MêHÁ¬ î|¸BÜ®\r)ßh“\nñÌ|¥TÂCGj1¨‹yP}¼¨!#Št4ÅgZ\Z3Ñı„´éÔ9¹Ÿ‹İş5‘©\'š‹İdÓ±\ZŒñƒM¥<ÔÔæ|”˜ij°º„”ÖtBÇëŸ£	ï;²Vàj:ÖNU0¥H9¡0¸bKc%-¤…ùe)¸„jÆÕ’G¢Ã-˜s‚äÎbÍÌGSK3ñ§;u+VRplcWÓ¦şÌƒìy{Û—Ş\"§Gg5E]¨%`Ä¡.äAÁnë\n<(íò0MèÃ‚p†óJ`ÌO®<sc\Z(âÇjM”ŸH–ÌÃâZEsi„¶‡ E°Q×{ìï€FjI\"’–*»0µq.í¦S™Û°¦Öú3çMª9Ö²èXåÆQP;qÖ\\oeoéè@yÎ™ã*¶÷z‘ã\"+5Cîi$Ûlf. à°dR†RëjNH¼F‡RV),V“#p*rseËïmÜA\Z>\0R!‹ „e§Tz|Åv\'Í×UÖõa‰Ğ¤\')+$ŠNUg×Àl lÑfaå»`’\\’4 âğ@~°Ê¦·¾”ÚuĞädw·¹.6¬ŠàÅ\\…<Ê›;_óøÒcxUnæ C(s#^MÖ.Ûéâı¾	a\'ºàœ*ÃT\0–v³´ôQzFŒf¦hh‹(eDÆ€…ïl‡ÚÉB„²ªv8ØœÅï]D\ns¬·«Ìs6H œ˜óÎæ9ì+yÌä§wòˆÉZU-øéæä±¬B7Õh;;’\Zº¯<TKåÊ‰8D´&£Øl’ÄŸIÚ]Õk\"¤Ù½»dLÀ¢DïöS&‰ªXpÂ‡£Éië%XCwáÆ~/Å…\0ÇÕîV„Ø‚~ÄD‰S¸ä`×\Z©f™³½UKË³YO4{#àò	}p˜Éˆ³œÀT2;švK›‘)\'9Ä-Us®y3à˜¸öÆÙfr\ZåãiÚØŞÜ6÷…¼7AZ6nRªQ‰0øÊ,’YP€6Ùğá&aÙÍÆZ«¢SJW{¶˜rî¼YS?X–ko©l·õ†&©ã,‰·•4_[µ0ö¼KøFÃc:‡ÀÇvR‘²|ZèÌ,¼t-ßUqH¶€ØxÛfn7ôÔ;§.bÖ!Xir|¬í@^»Bh– }k¶Â‰ÙBRœæ û9œˆñ‰ƒ‚Ø;êÚÙMÇX&2W),a@õ&sĞ]ì×\ZÅ±´ÜyNU8tS­-Våç8öXø\0	æ¼Íæòr®ç¤êË\Z}’øT2lIA$Qk.-“q»äç!¿İ†œl¿‰ÚB·´Ú\r¡ÀDª³Ããjƒ….B–ÕÑ›ô<ê|›ädè¨ŸCš³Ej¯ëÎÎgİ/ÓqŒY×0ºçf±I)jLó%:2I–«zH‘t„Y£p×¦MW©lT³%±2T×Æ#f(6¹OL¢9Œ°Æ˜P‡C,vúÉ†äUÉ¥İd\0ÂÆós“R:H¥fÙ­-ß¬;feˆqJktµLw-)N2\n¨\r×ØÎøJpx“¢Bøû9­a¢\rÇVÁAÏÀmmë·ÕVZ¾ØXÊ›¼„r\ZBzu>s™\n	ºc˜¼Y%Jığf#GÚÏk£óAP·ÓäÓHİtâ(vmƒ6åuàK™;–•¶©üÉÒ±”T¥<¨K©Õºš”•˜µ³›bŠ4c%«\"`FzìĞ®”u-FVÄ/ûq²\Z“L×ÓÑ’!Šà˜lOˆ¶4‡Õ\\l:‹…»x—Øn¢…+ÑP–Ãe\nö’ğ;a±–ã\nÊf6Ï“#”(µ\"¹`MËº€$qÓN\'üxM/°i\nrøh˜Ü1p¥•3Ó 0-ÚÛâÁ»%f@k9Y£Æ˜‹³VVÜ?VcÙcZ*}\n\rÒ=g\0	\Zb‘úÄÃ@åB‡‘Ë1„TÃ›mÇ×å¶¸ ïn=ª¨‚Õsw²°S‚ÅJyU){¼È×%Mrf²‰¼Y·Æz›Îğ’›¯fãNjç£İ*`\"s\0©2l·èôDáéØ(\'<OP°ÉÀBÉÛP÷«PšzÑ©¤fÊù(‚Èf,†ÉÜ	ÒÉN&kß)äM³k¡¥V§ùaFyî±cJ~1µ]ªığë“/BçhÊ˜•“cÍ•½suç<îŒ†“4]Bá4™øtŠº:+Ë(Æ2]h¾\"\"<YŠã¥¼Š\'|F@æÎóÔ…!†mE!=lv#±»…jÛq…·ı¼Ø*{³¹ªvé8–™‰çtöÛIHF™ ¿ËRg·,7?bJ¼[NŠ[*°ìLøÀÂO¡D#SbvÎN£ö+bœ™C\"†Äø|ôr6¦$…™:üÂOšÖ½ì¸¦\0ºÛÑÌnByÕ¹¿‰úHkiÛùåí24’N®³}bì¶š¨Ë4[¬Ù‰BysñHÄ‰Òø~’L—·:ïAQ‰9R,×¹ˆ9é°$ÚõG9vbP…øyŠêªS¨-Ìá88/:W™£p£4ôØ¶RNu\"»ô·+ş•Â(YQEæÌÎÓMïd¬cc2S)v?r÷ó‰«SlÍbG‹İ™•®KµÎN#o°ÜÄ®GÎcÛ‰ÕÍš%a€ÈUê1 [\0“Æşk÷\\aSU3¥rn¹WÉt#C\"9Â‹NuãÀUÎ2Aj;|	Ò0~³Ã¡ó‚Ş/Z’R¬¬éøFİËÉ&èl–lÕ4u§ıe0#?WUAŸIN7&fó	 3>œ¥ùâHê—4…,=µš›-Ëh=®˜Ğ/ñ\n^;‚ìLe>\')_\\kK„cÎfkIåI ÖN}\nX”Ê\n¨L‡ÕÔÜ;Çcààø*Îõ*±=‡ŒÆSğ|òv…\'yn“ISvNá~š\r§;[ú8Fb¡®³(6«_j²Mï•ª¬QÅ×ä²<š4A³C töH¬Å:×£5fÄÕ¾Ñ	¢dLÂPáISæDÄ.£%}†I@ N W¬pµå\0/sLg;:;Õ™ŸT¼ó\nèr>ÉPE–µõ¼ ØS\'\\²ù›Ç³ãL\0Í“I7ğTƒ ù¼®™Êy¯iSWZÇZ6—B†©‰…Í\ZÉ‡,zÍnşDB˜®tSå#ë(óşÜÕXiñähÌ rÚ;›ØÔfÀJÑ¸åÂv².vuÁ‚Um‹q«”É„¶¶aHN=È‚W`c·Hp>åöÁ‚TÅ¡›í½‡AŠâ²³5£!À™ÁÌvã\nŸÎ¼#Q‚å‚ßLO1%F¬+NÅYÕmä„ŞÅm‹µ†Ê\'dfÙòl4ŞÊld{W”\'lÚ5Xb«8šÉ«ÓRŸä^/ÁéºğYtZpËs^m:šêZQb{-sÛLš«B‹Muš¹ä>`_ÚUg8pu2ëu§™g’jÏåÚœ¬ o6*R›jÈãØÅ®2—Úd¸±N(·*,Ò¬ÊòjCKŞuvÇ©©1\r2—Æq#³d3u²~jy£bašÁy“À<³éªQ¬ªÖøÖÎX\0oËªÛŸNç¾G­zÈ0\'4lpK±SÁjGmÓI9ñÆ––§5‹î€ÔŞ».(ĞÖHÉSã	Ôù±´k»M?Ç¼55¢`(²sDs‹‡š\'nuH%‹Ô ]7„ĞÆíîo²¬öé|zÜÔĞl‘‹ä”Ø+‡å-Ç×‰Z‡`@v†\'äÎg;SòÕĞô™Iã82¯¶W\\æ‰³[­<Œ8¢sËÔsãj¬O,Şëœ …„»u“eOwtZÖ9J6P­pûöÕF=)´²(’=¢³&ñŠ¥0e4¦õÊv…fl€R	J»\nYß3Ò;w.``oŠ*§Íóy‹út\rM[pF ¹‡ÜˆH°¡…ùníu®Ãzşa¹a›æìİ­\0ÛuQ^c§æÑ`MO‚†9»Q·Û6;?0«•f(nŸ<ÛÂEèŒKh¼sÎ.¸©ÏĞaíÏDaÎLT³I»y·àÑIQÎ5Q6+†4ˆd— I­YkwÖ:GFZj‚fy†ÁŠ†Ä\nˆ.ÙÎuÀläÌ\"M•¢40ò×y!›±äÔp_<¢İ¤f£}èÇF ÃÅ¶2ªE1;¯|á+ı¿]ú|R	ÛbÚBdÇs4Yvë[ò˜„MµŒVd::Ó\"ön@R»ª$-1ÏÍüÊ¿¤1Â!yÇ;±«tŠß—u÷$ÒÙj$³	(™g›–c8õ°\r´ÙéoŸl»ÿÎ^º(üCœ‰käÊæ™\"¹¦›©ÉâÚwÕ•¸F¶²«ÈƒÁ£ÊÁ&9•%S m7=ïô%ÔñU9‹ùM\0GrQœv.­5İ¹g?±‚nÄƒ	Ëé(¶œt±v¸EÎ¹¯ãÔ†ww¡zœ¶¾Wøü´-¡9k,‚f×é‚ƒ8ÃD4ÙcËK Ğhw¬\0«tŒvĞâtì%ÉMÙƒ²N;¾¶aÊAÇµll#DDIƒFp‘Ê¥„F²¡N“ı.¶-´ä\'[\n ¼¶µlÃ+zUV<ïlĞƒ.kç¸à¾Z4Çf®WÇ³«- J“iÓÙ8Ñãt_\n;™Õí\räŸ\' mÔÌÕ~ÂYHç¥wngébr¼ |*§‰1ÎÛy˜İŒ¶¡$¥ }å‡UaœÒ)ÑF9zf ¤må­FoUõ¸zæIGŞ°ôŒµ\'‚\nùÍ~QÏÆ´»¬¹È5np™Óqµ†gÆŒ±ø%½‡=¶ÓñÄ<“õÜ`¶ÑHÑÔÆÉ±ãAo=…\'3\\AVtÇl•í_cB>iÊT×Úxk»”“.‘ıœÊÓã1O|.™F„ ¤à–æ}¬¹°ÚÍuŞ¬e–|]ZÎNL-UäR¤–,\0‡s¡íBZ‰ë­vó®\0ª‡\rµÚ$KÁ•÷F^é=r\0\Z]Lçq›>M±E™áÌÁ®L9÷†Úª\'-G&H³“uàÑÒSÆd±8´B[lm·ŒÚ\Z‚šN.<%\nô<†|_t·ìİ	äbZN\r© \r0*İÎ|b‘ı&•dÜ¢\'Ä‘Àv‡‘t}\nÛE[ÏZ‰ƒ$é-ŒœæÓNßGö§›õâ€û›*6pÂÅ.‰C‚‘Ó–ÊóÆ\n„£ë¡ë\ZÂh—åŒ0Îˆ€/kõ™SEù?³À]5Z#¤W{ºO\'Şò<&mİÕ\"ŞÍ:%£löèäÉt<]q&¡íov^n2Ã…ÖŞ©›s@[1¯—ú¶!FzQxÓÄ›‰ÍtCĞ\0±K]\n\nÖ¡ç¬uŸ?.ÜbiªÁQj$[\n™‹q7]â\\­«ÔÇ˜Ä=Ñ¸£m!<K™¦îf«m	*Œ	_ZXËÂ]˜ª……&­xÆÍ|1²ÍIµÀ;·°’DU¬aÛÎ¤¯ejÆ=áŒ-«€w;S‹±Q7ß—«œ¿ÚvªS#aAé„¸!O°ir…*åÏ\ryZÂc~µûÓÂTõ2çÜ©°pÕRAc@5•õh§ö†¶%gßŠ­ëlj‘Â¬õøz%$\rEòSTŞZ°{´Ayã6ü6›´Ù¦Æ¸ÌŠ·6,Ãª\n·B®´\\ÑˆÉ®²Önµ¾¨Âª\"Í9Q+f]sŒU_Aşv¿ÛCµ¤\'´˜\Zk¦ÌÎÇ½×¶è˜]HşŠÊQ1²N4PÈù Š†«Xò|Ó)ÇêÜÍÜ—#¦ÖZİÔ½ÖB<:ÉMĞ»Ü¥LrJ¢Üáw¹à,1ë+é‘œ¤ã^åfÁ±ä¨Yto&ËØÁµb²ßò2_Í7>†ÒS\0”Ï[E²°9Ü÷ö‚•(@wíŞÀ’ÏÔÍÈÚª…ØM\'&‘(\n\r\'N:ZÜ˜V×)°Ó¿ô8ÉV“P2ÀÉÚM\nMØÄ”Ê’`»(ˆX¯#•ì\'¬E²¥)Hôaƒ’v&m{*º:oÔ[E\\a+YD¦gO·qt·gPYKÔYpÊ€ˆ†\"T$.-Ø :W\ns›‰6;,§4»]z6´v‰¸0¸½Ù|úÆFAjµš#¤Ç¦8İŠf4îŞyÜØLÕº\0í%kwÆ>¤Ösg4WĞ,+\0šCd¢Zgn·’Ë¤kR!”Iq­Œ´)XÓÂJu¼cB‘›µˆ©‚¢q§0MqdÃÄâÆ\nÉÀv\n¶c/q˜²SÏêÜcYV£ˆ]~òÌîÆ‰™¼ƒå¸v}k‰:nö#\nÄbŞokÊâZ‰)à(wñZ*k7vÜ±Ù¶{s±·ˆEérs*–ßÃpºÚgÙnÉĞGt/Â,2aIáä•^¡Ô/Nv#Æõr·f|X&‹NÙjgbZ·Ã`Šf¢#%û­=­µ‰ÚN1éªm¯ªÚÈäª™‡”¬…V˜°Ş…›M¬Nw¥1İåİ¬˜z»$X[êlb8¦3‰<’OG›Yyõ `5²©”Èr¨Æ cJt\\SÈ•£¿˜Öœ¦®èØqâpã9s n}”×s~lï!FiO(ÏlHÄ®œmEÓ¨Ò˜»#Ao˜K.d~š¢ÕèRgÀq`øÙœ³|¾Œf…W	<Ò«ƒz–óÅlJ8ÊDí~™[ÜmuO¶-®Å-îÇ–®;«ÎÕ¦³\\×Ûœr™ä¼lW1M¥tªjz,o«õôğcÄÃ¦]Ö‹D §¾5^Ó;şdq”Õ\Z3Dİ=²›ëœaXaæW®ÀJ>Ñ`#\Z¨Ú.Ñ9q´§igÿ=¶¥0 aö¼1£¹é~áq!šÖ\npjs8æ3çÄXŠS•g4±×B3†ÏŞQQsIˆ¦óvÖ2‡¤š¯dˆ¶Æ<O¶Bq»-mòq‹OBŸÒ]$ß:Ğf*”;—2\"âŒ`Í^m1Àz&ªk]«3Ô¨tšxa¤•.hêqÇ¾À96°dê8¸Ö\\­9®–0U×A”,(²ìq\r6cÉİÀœ¶8pÄZÜN#“6)\"?²tÜĞXÔŒ-P6h0—Œ¹)4Ş&Òt´AIqÙi\ntø±9Ë¡0øi2I‹¦³”ÑÉl\'kdë†6Š™Y”èÉ^qÎæ¨SV5—5†p\'˜	*İ3SÁo:ÓD™UÛYéc+DÚ±1:”t¸Í`WfM ÛÏÏ^©Wl\0ª*K­h-T]ãæ‚Ç‡„>Ä¢ÓŸgŸÏ:%;ß\Z„jÍÏ¡MÊ;Æ;‘„æ GÑâ4)g˜Ë\ZSœ\"ßèç¨q…‘+Ù,°\néx‚3ğR+vnQŒŒ%»p—Ÿ%¡aÆªÄ\ZÚš]F)Ïº‰ÓŒcÍ#Ö9—ô·èŠ…³óöˆÀ¤ˆ§‹±_	N ,rq\'»\Z+J>JqÅß5“NTEÌn,Ç Ù—Ï‡W0®vÛ7ªİ ‰Ò6êé˜³Ò,>Û(Œ(ÉDF:!§idP	Ó¨3º¶+RFK¬©J•ß 4\\œ†®Íí}^˜½2[›¢çk^ 7£Õ~gH¢ìîÎ·ŠÕ4<µšJ­MuÏ0û|!¹‹İ~nğIUY§ıv|,J+ÔšĞ=NT7æ–ÈÜ•â”°%†BaÃã¬<mì¹ˆ6¥{eÒÁª¡Y¤-Î2VÛ!ĞP¼Z`òœòÚƒ7ÊÏµË6N¤n„i\'‘·\\5§ºíeÎ¨ƒj\"İç\Z\\¡B9ÙæFÆ¦õÂ<šDE”ÕÒç\"Td%uYpjœWè˜™À¡æ*ë¥C6|¼ÚÀhµ®9¡1Vb÷T\'®bÛÎ†k[umózÕÎ#\\z2ç’\\ˆé³z¼pPÌHÅíÆõ]a¶™3ÄyeNYútÙ	/Bw†&d²\nŞ-°*w}²›gØˆòñö	1‰¶ûmçK{\\íÎ±¡Ozkğáq.e¹MTjGy¬Ó:tzPğõÒÂ„”K ÄÙU­~>ÃUQ’tf:ã5opÖ?-·T¼M(ÇO«ŒÚšÏY›j+Ó÷Ô…–U4¨HXÇ\"{\Z´2\rÄúÈ`í2§­¬\"X°øJŠ‰3Éa‹Ù†fê•Öô Õ×B6iru¢hîÔFç¨‡Ùt\'ÅÛ¹çÊüyéB›ªéÆ§ürûİÙ¥jµÔİ\r¾GjÔkáN¡Hë L…¸\0uÊÇ9Áur2Ìö.,“›C”*Lkå™P»‘i\ZFÊ\'dQ\\Çˆ˜E·\n4ĞÙfè1[ªS½Imw›˜™*Äê¼Ë1“m,Ñ9®bÑCeN11—ë…ÃˆXT|¸Õ™&êÅvÍëİÂ_bgUÎ1•¹3hÜ]«éQ˜²;Md¢!CL(ó`‚å¹3bJ§b²:pååÈ1½Æ&Í»6æº¸ºª\nc¥…¹“ÄìE|¶\'fG¹ØH”£Èó269¬´Î2;Ê9£Á–âBÀV×éÓÚEE‹«Â¢â3Éá\r”šÕvÅYõ¤p5À`+áLİ^l¦Õ½•,6–‹³œí–ÈñBŒ@˜SZU)Ô8š4\\Í^ì=ÉÎ_–ƒ†aÛ°0*s´àBÖu\ZĞ@!óÍz9µ÷‡†_Ö:Ğ¢˜7&ò½LÆ¢çh«*IOaÌ`aÈJEÑ33•œšò²ó\\ƒµwn¡xŒB›aİú­Î´Â3Ç`âv†å²³½K-]r´=ËD#f3â„IZ<;	kòÄ‡Õö¼\'÷²Úb*Ñ,ñ,9$2€í\'õÆ`¨ğFİ™Rc(%5]rÔ”ôàıqrè,¨ùJİ®U‹éD»ªƒ‘È›S3ÅÒºò|c%Œ¬:Le›2§)‚õª)L)#ƒÇ& ŸND‰a7\Z„ˆ\në’É®¬ššCããHF]n¬òIvîû8ĞÙrnxÑI#‚9\'{¬ša+iUúÚ¡­:‡e.3•¿àÎ¯©•-«Ç¦R&”¦P¹¤§ÍD“ƒÖKõ(a‹M2?N…#&ö0v|ÜÈwùC´uá(Hç±ªëcÂX§ú(a-­´ò\"ØóÖÂğêNUV.À`g\Z\\×qÆ`K]L9šµÒÆ2·Î;õh`ù¶m d:ötÇ=´·®Îy2^QûÌİÕ%‹šÁ‹Eæ\\œé‹R¨K‡Y•!W´ûšßİe‚âÙ<I1dJôù”Í·ÕÒk7“…•tV73;Š3u4‹ÈD‰óC,!\Zs•·Ë,nâwÊx}Ú˜Ãt¯s¢Ÿ´çü $ yò|ºĞı‘åEŒK²²#ë$‰®m@{V“Öê©ëÊJa,5j”—Ñäp¨Ö³kö£$Û²„áş!µÑ,Ç4m-ğy±S	:XÒèXbMoËûj­øœ‘£4kÒ¦q£<›.¤Ø\np~*4¶SşÅ¤Ñó°3\rÖjÖÄ€ìÈÊÙb1ÂnÇ\0˜È2è|ßÓ’Rã‚dÈùŠ™i©—ä/L/×›…6ÁÙ½$=£©¯Wl—9—¿şû¿ÿ¼a–¿›‰‡³i]/¾ÜÉùHŠ’~‡GCÄè01Š\rcÃÄ8üØ³õ¬ø¢Ë×¾| şª×Ïô¡Ø/*¿õ{€üEí×?“G¶¥‡_õÅ>QÙ÷ú¯&}ˆş«yÿ@ïçæWÇáÄ_öı3ù—]ÿLşeÏ¯äFYI|+ôıöËóíÖ£ËŸÛ­ï9Æ>§«zq£óÓ¥×ï™n7-çn%Upıùw¿½”íStîãüîf¾õc [ÄííåİËmÁï¿=åi{¿ä7/ô¢Ìß³o÷÷RCĞ½ xu“õCZøáŞô>İ4òpÙø½ÊkŞïû%ì	\rïŸ/†^ä øT_œöÃ /é~¾›{XôE÷¼4¼ÛÖ·b(³ÀíÆøŸ–|ÑÑOõ\räşı¸dC©3o?8¶İ‰ó\"Éš×Yê¾ÎB:PÕ¿B½[yÓóÃ·”´Wv¿Ó]oÁÿöé©n^rl<fÒBñ‡(ø@&­ëÃ[>‹ËĞŸÓİR°¼í?Îíâ–ûzoşõmÿãöÿ?aüŸ/¯ÖşĞõççØCæ¨ûUëX©êªınd¶üëú÷%\'¡õå¬tÌ|Oí,Ïàr¿ışEjÑ‡j.Ééò¤ôé²ßxä¾Ğä§‹õ»ÙMiİo‚>õsœ$)>¦Eyß´Ê(÷ÇàÓoú¡ô?R}7OÜ€5iøîU0v\"ºxÊ;š¯óĞÇ!ãCé›gû-Õ\0ô\r(×úïªFÏïlÈ(ô!ı¢=ºüyJ°F>ö­Â¯çè²RCI_>ı–«à*êóÉ<õšñ{Á‹\\,x•`Èƒ‚øpeüÃ$“_ÔéØ§±~H+ø˜ÙçZClW—ôİŞûñ S†vÜ‡‚·¤ocúºdZ\Z¡oŞ*p2=²?KÄëNz05ziú;•üø`,üFù‹Ş|ä–{F¢wrâ1‰ÖSVÖ{ÖaÊ[²­§W¯ò\\wÆ¥æËÖøI‘×u|Îˆ¤§^vY—¨ÿ¢JË(şî„e·‘†ß!ßËôÃ¯îÿ$egOıéé¡ó–kò¿ş.<?³z‰ş‰bÿãç÷Ö	âO‚èZİÚ¯TÙÙ«izIfû%ñ#‹¥zlÿ¸ç…‰’K¸¿Ùƒ®ÒLw¿»ŞMä÷uß‹&½¥ùë‰åÿf+ÿøĞõğ{\'–LÛ»Š‘ùæşf-ÜŸÛQZ4¿Öò-W¯²‘ıºo›òşÃÍ9±l3¹~û?æ(¹ê¨ÿ/\rÓ}»4l[3áüíá]–éæ\\eıÿÀ”Ş¸ó\'ìsÓ8±“<g|Ñè\'7ªÏÆ6H}mÿ!ïø›œ¼&+}¬f°¸Ç—t5_ğb¿ÿñu\'nÿ|!_¯3ĞYÁ»¼¾«Ÿ5^ûuÉ‹ù³ıøhİÿÊ|u[şùçëz_†ëTŞÛé=\"â§-9~m¿¤×áıøéê|UÅ@?¯¦øïˆy?÷^¼†;IÍ\\Ù§zşÕŒ<×ŒıçjFŸk&şs5cÏ5“ÿ¹šñçš;^øUM|¨ú?¸†£Ußñ·í‰—ıl“?2øW[ågfËo4ƒÿ­VĞßlåb•uÿû;Ma¿Ù‚ÿVğßmåoMñ»<p1\'bP~Á¶¿Õö\'Bâ£/uç›Q\\ŒÓ¿>ëíŸí´Ÿj‰GÏy‹“üöào•]{Ù)Î¦ç¿®mÿD‹=òf¾kÅıxšË§	únÚaøæÆ_¬R”w3õßo±Äï7“ñWV¬Òİ*şnŒ$<¾ì†_iõ©Ñ›òìÿÜLú0-·)¬äoLÃ‡xŞc†ÅÏ±Ü[ˆè÷Úûz>Æ¡ûÕJßş×%bø¨ãşùãÓşøèÏÿ-~ü[•şŞÂü­ÊÿŒÂìù—jº¹#ß¾½a=÷#|J<˜¶o±•ÿ?÷î)xğkÿ¾êŞÏ£ƒ<ÿgåŞw«Ìn¢ñSã2š/zü{{áßlìïí‘ÿH£_î³…_°eF~wOı_ÒëßŞkÿ7õûË=8ÜÑÇ(w^è±u\r¹öãÙİ&¸{ÓOõÜ~³›ÁöÓşDzWä–ùÉ6A!ì—úñ²ümÚÿÇSy7LŒÎ+Ó0Ñ­N¶äEVŞ’O?b!ï\'/W/é¹P¤çÁ{îïöÙ‹ü.G?PøçSÿºĞmÍ$N=;³ãÓ>5øÈøjø^S_RŸß,•{kè¯‡XÊ_OˆÇyÑ¥/š|6K‘wÛK]ş|Õİo^FxYÇû´~ÌÂ|é?uíåóà÷ôÜùy=>ÿJRİô‹æ_µİ¢[vı/ä³‚}İË¾“zûáTíuùë÷ÅÖ|$Éí¢èªÊßòaÿèûÿR]l­§ixùñr\0xİÏºkè¸ñ6ØÛ4¢Ä×Œuo÷_¶ûvˆŸ7\0ÇETv•f·à·ÃÏß¶ßl2Ö#ûCÜûÿÄ¨J_áœĞœÓõç‡CmìÿÄt{™í<›>\"e<˜‹¡ñ›]è”@0Üöå¤èv<Ü{´ÿø?Á\\½ğºúÌïnã\"ıqùó…ş“ãıLõ­}¿œ=qN§¹b«Şc}€T˜×Ã£k{ÿÑÿ÷\'ñÏ^\n¢P$õS±ÃĞOs?ÿÒ‰ıZß?!^wìË*¯\\`ıîxW\\…ÒgÙÏ•É[­_ÉòïE·I.ºÿ‚÷{X‰g‰ÙwëA>boQ†½«¸ÏìCõn°a7¸Ş¿ßùÜÖ3Óë±˜X\'èı¿_lå¹Vt]‰¿Wì›şç%êéùmR{8\"üw»òí^å\'f{Ã÷üB­ÿøEø3·CÛ,ì¸×³ŠQ¤eüG›úÖqÊƒö¦,†œÛëv~CŸ]¶v7ö‹`xƒ	}B^–ıÙú_M÷a3Ã>›YĞ­=è¯a1y<ş¶ÉxëÆ×áÌ/‡qñ^\rƒx|İµ÷!ô#ê¥á÷º—‡Ãà²úÕâ^¶¿~w zñEŞeøOöûcÙKÀş‘ôá]¯åŞ_Ú–a×;ŸREPÜ_P‡½äùEMÿØ—o}Õ¿»ıe‹ëu[Gı\0öyTWÉ÷×åî¾UşsSşñ}dçùŸ{ÁŠ^Tæ¢õß¯eºöaæwˆÃ¬êül?Nö;púö›Üü5/[zq•Áû¹Ò«¯ŸI÷¿×Ì·ë/?îràÃV¹ìúïO8wèñúú?9ù¯Ë_5ıV\'YŠdÈ»7w]£ç¡ü÷O[±Ó¤³®Fú“øøè\'”÷›‘DşMúıS‘/ çÆâì€±\'w×&õã[„ñİË¼[÷#ô?²1şİî¾¸~·pÅø‘Û÷˜xø‚¦¨ßèş¿½®?>ƒEùsQÖù9E¯Ø,‰»•>~Ös\r©½)ª»eq? ¹j«û£+¼ò_WSãÁşè­Ï›íñ|ªùáİGsãáXş¯Ì¾\n…ŸëâûPÿå$f™ÿHÊâ}ï÷CnöğpŞŞ}À[Ñòà}9Êı4Å½÷@<;„×uë¿ x±Ğßó\Zo]ùv÷©be_–º}¦ôãÃÉ~Ô”¡ıüYöìÎ#ïDÜúÿÿ\0',1458950020,NULL),(7,'zAUrafOGk5TD','phabricator:celerity:/res/phabricator/7d8faf57/core.pkg.js;-_jyjmzP4fyLA','deflate','íıiwG’0Œ~ï_ºûef\"å¥{\0•üÚ’<–ÆÛXêeÅÁ€@‘,ĞX$rH<¿ıÆš™•Rn÷<sî½}Ú\"*—È-2222–WëıáEq¶™×Õ|Ö¾*W«ÑyÙ¹}?Zş®,få‡ß½X.çK—1ÀŒñh:-—Ã³Yñ\n«÷ø{Pµ]Nç¶ìùbî—İ®/–ó­r° ˆ¯}æ§ïÊñš;°,OgĞ:~TUq8¨ª\'\\ 7-gçëH88èÜ.{‹ÍêBêWÕIg°]–ëÍrÖZj3£İœ–Ãôe´„Ê\\\nU«¯—ËÑM˜ÿ•ıêÛ¯†-Õ\núW¿îî¢æF˜êZû‰G±XÎ×óõÍ¢ì­ç¯×ËjvN3T)Šì˜GÖ\"È\'7;/nü˜ğk8Y­sú±Z;·:s—¿«f¿óÉZòøò¤ĞTøífLó¹•Ój6±­ÌÖåõ:Ç„üj¾LUŸ¿øËpH¿q0ó³ßa½\"ÓŠYç–P¥	H©õäf3¾|š·z½^§ßÊ²¯×ëòj±†¹h­ç-,ÜZÍ¯Êõ¥\\ŒÖ­jÕšÍ×­QKÁ÷2Xğ-õt¾şÒ‚·GËóÍU9[¯:½Õ´\Z—íÇÄQ¬D}p‹áRz£ÅbzC%òcéá	Lôl<Z·	tÇc–›”ƒÊww\0ìüCN•RÜ=*³=:/\\J»,oV…àş6˜h‘Ø)´Ş”%ûâ²¶*³¦£™GKø\r`’ö¸ßØãÕ|ZŞİE	½éüœÖ[’ç‹r9Úß·_½Å|µ&êÑ¹\r+·P»ï÷‡ËêA,ë`[NWån0UPn#ƒä9«wŞS4\Z¯Ca)9*µ.ÚÒl´®ŞÃÄd™òr‹Ç)+œ~\"R3N(ÎFĞçAŒ)W+4-F»;“ÑgÛíIf9)\'­e	­,G3@w,‚˜ÎP[×Øz¹Á¶Lxİølş¡İ!´ó™|>ıWŞ¦¯´SóTñîg0[M ŠÏö÷Ãœã$Œ£“nXêğ¤óä‹ÃÃC‹N°PgÕò\n\'ì {;{;û~¾^µæg<	íÎªÅ0¦7½Ö¿UÓ)Ğ…òê«¬­ï(@Â »†´f\ny½\0‡:mŠğ$íç£u‰¿ÌösÛÏIÌowzçåúMu¿\0í´Ùj\rİã$”ÎFWe?Şmf—4nMÅ­ûêo!Uõ”S€µ?É´ÂAö‰¡ëåĞÍe)…cây1ZÁ,.ËÑä¦u\nÈÕ’rå„¨¨C®¬gØVó½¾¿[·ŸàÏOúØ¿mÜAíŞ‡j}Ñâ‚-8¬ozPò¤—KÇÕü}ÙªÖ­ù²…g#Ôcèşº|6­V­I¨€ˆ@g@Ûw§7üû¦Ü\0éª§Ávítx×Öã„™LLæ´×1Yöwµ®FÓê¿Ëæ³ÍtZãPjÍ)³rpPU[VÔÊ ×r|t‚;ôàğ(g“ıı½W;6	\'x~Ïàp„¿¥.Ô[“=\\UùQvüĞíVUš;\"EÔ\nîiAfä“rZ®ËßÅÉôM]Bœ\0TÀ	¸ø÷¤W:BdÉ <ƒò0B£õx~•ìï‡ß=B[(è*Éq‹ëĞ‘ƒ«ÈŒt±`vbÙn?\\TÓ²ë/å»æw*£¹âBáÆww—e„\r‚Up€`Ò{hkRàJ­€6×ı£ú³®Æ+øuU^–KüÅ“\r?ï«’Rß#S\0?°­şÑ–ğ‹ÎtG-öø›šéØh§ø^Ù‰ÙÁ%üJoE®Õè@ßfn¶ş‹*ıï,Å7¨ùr¯(n·6áa]1‚ùvM‰ÿj­.æ›éhm8}öyÆ×ÎØ°¥ı\n.ËÕfº¶¼ÄUo8¬&Ãa‘\r‡À/\r‡ÙAûàÀn¨,³^/ŸëÁMÃİÙ8ww|ät/±‘Ü3z¯ÁeV.îŞ ŞKä¨FQğ©twÇ_xDÈT?Éhì0Ü£Ói9dOiJß,+˜0\\bí.°xLzgã’hï|³ÆÓHpùá“q`0íæ,hQä8K ~êõD”îÉŞèÜRq¼—Ødº›àTÑe©FÅ0çåŠŠÆ²Ï&Ãßµ\nSß§èWÁ=öeñh7PÚJeÒ¥¡É-}Á˜Ç˜¦2D)V%\\m–¾‡ˆğÁåRß3ncîIñ^™HL£kB:$—âá}HO|îîn·ÑÓÑª,\0Ë/FË¯×íÃÜOÿ¼€bÏ ½İ9€ÅÙœBµø°D¸‹F›õ·Ñ%Ï¦Œ!j”³3˜‘ì\0Û:)xrx$š}î³ÏmvÀèñËtÕqQÔ¨ĞZÚGÁ±j\nÃùWìaöâå-Ç4µRJ˜P¸uµY­é\n”Ó&Ìê@åQk\nû‰/\\\n¡{c¸HC©ñh³\"Nî·ÜÅZ0Ç„D½Ö_FË\n÷ÏŠªCéÑl4½ùo€9‚ëñx	œüÏÊÖœl­^×À†æA>Ô•Ş¾wğ !m¦DÆ°öPË×\nÓÀ¡<,¤Ôèµ~a\rIˆMäàl„ô›2¨00¢`İšÌK¾Áójà­“Ôy¼³êšê\\Á¡}VAó((±æx´Ànà5`5:+§7ÜQœG?\"\\àŒÜÈd86ëDü–ˆ,‚\nEÆ\"—Ì¡\n¥Ã‰G¬ÆoŒ*N Ár%œ¨è¤­Ÿ…ÀŒ¦°^áÚ½\Z½­ÆËj±æµƒ‰Y\0€5(—%”„…/ç«•£ü´ÈLûÄ*Ï\'²ÀÌ/æ^=ùˆ(¯aIaî¯Ji¤×zsÈŠˆs·öÖvø¨šÁÒ@uÒ¼rÜÌ7\0\Z—\Z.­F—%Q$¦ó¸Î«êu>î1!‡ï í“c—çqÄDµÜğä ¦à~8‡k`«/üIXáõxD³ùâqAÓ¢3“±\rÏ,GY˜Té™¥8¦gV9ƒ“rI»\'àÔMº;Ñ¤îş¾ÉÊUæ[¯ÌÁVU·ËôZy\'[¯1ğc-x¢=w	EºZ€¥™­‹€Ù¹åÓh>™k-¸œ~ü=ò]\n®VR€ëÓï»;‘šÀ•T³=¨»;_ËI{ÏÚ¾¬aµµömÈ_9XyC\"1º[[õÊœ° …Zïrõ>ğ%.¨kÆ„s®p¶Êıè\\¶–ã J¬/÷&ì6¡=pé~R£õÅpHó¦µ9©Ğ²*b<¡ŸÈ‘\nø~~i˜$¤}5î%ã”	“,¬ŒŠ»uÔJX&TšCºˆcºHÓÑâ­JBp8çÂ\"KXZä õæ\\‡zï€Tµ³¼•u aÚ²N²Ü!¥OHàûÜ¯¼•gÕM¦¹+œtò[àWıóQg‹\\1Ïö´ZÁF	g;Ç[Ìéh|ùOœvn÷×´KŸÓÓšë»\0]0Ü„•…ÕY³÷¥mÏGëQî[°&(sÃÉgÜÿ\'¿iÊÿG&ú·œ^¦\0¿éÓèwñU¶D™ıPäêBÏ<¯7)Ïª2®7-!¨­Ÿ±\0ÜG?á/ÿ“c<â®:˜,`D®µıä´÷® ®Z0KB6íÇáµi„\nûÑ÷¦¿§%‰ıøè–î“¢(ß|·ƒ&‰\n±u6&ş;8œ=ûw`¶•eÎr_³3h›^:‘+lØ[}:ím›IlŸb¶ŠãL‹gyÌÄOf?ÖAñ{?Á¯j¥L7+j¾\\½pĞ y=ÿ~;§t \r3š 4Ä¾´³ˆ·Y~«BÀÛÕz¾°ïXüšGó{ï—ÑªÑæ\'|ÑãQ?ıfs\n—ŸÁQŒÎGf¿–„r\n×ì×µ(@åN(^È…sş¨1„¿Ğ½IŞ½zç9Ü7Ó5v(L±ıù™s\ZztYM§ıXn\'À\0\nµãŠĞÙ×‹r×…+o: =¯@²}Om{Tª72}5Z/‘^?›OÊ`T©d^­~©Î/ÖßlÖëùìA\rªè¬ìüø¢(>»»[öN©~Q<&?Î—W£éóÍª|‘Z¸Œ/æK˜¼Âİ­Æ—Yÿ(Ï®°ÖfáOàŠ“¡H™<éĞÀñvN¾VÇK”øul\'&ÀÍa=‚™Æ!Œ¦kù5^/§ònêg˜C…ÊíŒ&\0ß—–|Fä	Ù+j} Ò<EZ\\§Œª¤¨ªZZÁGEt¹™wÓÿ§´_ËúÙÛ+dŞcˆ\'{õÕÄm€ˆú# ’‡i&I›ÁpÒ=Åaœ¤ã	®1	zš[ Tù\n÷Dq+8Ş¿ıS?ãÇ,ÿ—~¶fùÑa?càğû3ÿûñûY¹\ZgùgğcZ‘ûªöåŸAİ%îŒ,ÿjæ_~öø³Çœ??séö¹BÀ/´òvkßIn—‚~}œ‹é´üF¥”Ô	NıB†¾|’¯˜öõiu”Ú¹ïNrÿvK?W\"yÀ„jõf¾_ÈÄÂæ„jØ—[¦\Zu=Ÿ\"ÚÇØÁ\";ÖMÖægHh‡üß	?;‘¤9D¿AÈ—¦«mØ?\\œØÓGkÌÉ+ù4z¢Ì+4r€İà_®šÏ64ÿ¶Ûmx¢9ôÊoÑ3Ìé„fqx1šM¦xîÁR\0+\0©(5îgŸfù“ÊërüŒuh¨,uü5À—U¦’ßLç°-óÇËÙ¤¼îæÌœôC¶‡EØPãû1g_D€ø±WÙŠOsz}uZa˜‰ÓIšk^3¹Tƒ3Â\n,>-Q¶G@QŠ,/©v1?O+Ï*jÜ†=ÇzÃIµ‚Ôñæ×7¨\'ğ;Å*À• \0]ãñ‹¶7”Dtº\"!\\àFÏ™QghESÄƒÚ¹K®È@öŠÏ¬Ô>â@6ü}S-ÿ\'Ááô¦õYËƒj=‡›J¯Ê¯ÏúA |•±ˆÿºdmëuf—²X5!Å\Z¿®\0}0+@3Ò¹¥?¼ßS©k1bàaÉéïÉ‰?pj…QçÅ•çâ|ºò(Êeq;ÔĞ:mkJÔÏX&¥´óTúWÂpåE5!~Hì0Î®ofÓùh’	È\\Qft+–½ÜÑçSù>ÆR\'ôú¥¬\"QÎåİ;Ë»wOhüXŞ½3$‘çëİ;Ñ¯š@%$Z+J%ÕLa‰ŞW“‚éDŠ)]M:^ƒî:vyùÄ<8¸¬K\r°Àñå%> ­GçıßOæcBïûp4o}”·r.Õ:CB1ÊM·µ!é5Ñ>Âç¨¾ì˜¨?¼Öìnè	gîìŒÔg5ƒÇÚ)à[ÒéFW]º«ÿD/â.wèÅ9¢”RÏªí\\ñ@{XªÚÉq˜øÂ2]ì•fmh)÷ïÙf‰Úï%=æÑETP×mÇµ¯%7°ô`UŒ5_SX{³\\Í—.“?»G3I«cN=éÜÖ’z2L™æ6±zàøQĞª›=)b{â–\ny˜(·¤	¸œ…eJ‰©ÊµİD/¼†3CzKY,–ÇŸ×\0§éç€ö(«¹B=Ô%ÄÔ‡zŞ[-Ç/¦%î“»;NálâšèPCúÛÃ¦ŞaÄ3Niç±yf¦œ|w\'?Yúz\r‡<Ü.JW—9u;CÅ‘]:é	¿çpÚş>ÿ\0Òi[gR\0{ûãè\n¹Êïçôu>ç\\?ÕJ:¥V5!Å«‰‚¬&\0±šÔ«Q·WÕy5]‰.µ3d4ºT £#“Ëvn¥ÿ!}´u;¶¶¥D°©Sœ;/Ñ-ê©\ZøA%:†%ª	÷LJë9†-é‰FŠé.ã–,\ZØ“NÁ+T$æJ9\\Ï€>­\nÌ)œyÖ (8ß¬}ÉÓéf™ÉyŠÌïndÅ-ı„n-×}¼£æôJdôå.ùæs³àºštØïKaÑù{³¶ŸHä›Úğß[;@ßŸÌñU\'†\0÷˜öÿ˜ªÀn‹J25ˆS¥x°dÈ;éãÔÚæÇ|ŞŠ3\nî6±3Ú%7Äuõ•_U[®oŠ:ßíÄLóÍˆ\0«¹_a‚gÒKÇ¥ËŠ÷>¥ğõhûvĞ¶£}”\\ğtl!¯ßÃ‹í‰ÁÎÛ\r¯aº§ü\\€Mã¹^;;GÙşJüæt*\"ú[ÄÏi¾ßFg‡Ë\rÇÏÅ¦(!7=WkwâÀïaíºÂQ•|Z–ÃÑ‡ÑMqtHÿsäh9Ÿ¯86ñï€ÌşìÜJí‚ÆtÜ¦rP°ó•¿ô‰Áœ\Z¿TáIs4ßŸ^¦øİö¨FJÁ§ŒB²‰ÇÇ)8¦„“¢m>îî;Gƒ`V´Ü8WÕ¬Ê½»Ó”€ènC†$68Á–iS5\\÷å	÷^øˆ‰Gm	zÚ§OÃ§ğ¹~«½è‡½½<É¥J_şnæNùríŸ\rFùiÈÀ‹>ç¨§0»§îg˜Uš¥%€_µ;İÃŞ^\'2YUşëÁuªï~±¦oŸp^ ş¡‚XĞ‹W\nœuËîÊ±ôoÇuR¿SI_÷r£ÂÀŒè¿Ü€t,Å´40­m\ZØ2²íßß¯%	¥¦#‰©ô¹ótY.½¸^D¹ÇsûfäS†¯\0¬¦¹vw‰röU}… ƒ§¾/ÂŞ«ˆn(ê=E˜—k	‰‡ÏcÊ9	Ñ=R‡qÕä;Q;qmt½hgT¥…xc ¤™ŠËŠŒ÷àY^Ã‚áo„*jTb¹Xï,#8ÎMn¿EèØóCêë‰™!Øù¦È&şMUÏfÎ\\g8T¹2W#©H?#§Kæ =«×È¤úÕ û\r1®uíÌƒ›ş‰ØúÄ+èö“Ù|Ö-ùêbM$Œl¦r‰^ëÔÁ›V—åô&GÙÚÛlY¶6à\ZÈuUp·è½„´ÿH#“A­Xot4{›¡ÅĞû²%œº“	‹_Px)ÀÎÂq%à¸à2pÀx/èU(¼ıéÌ§SòS8’·ùh2ùgM´‚şÿ†‰Î²ˆ\Zëxd&L/g…›ëÁ–€¯š€çr­ã§aÍpôQ*XƒÿkÓï)+¯GxÉl7M?àÙïè=wÈ7N©z|x‚*ÄüûHÎ3¦a†ÆùÂjG\nû¡ğÕáƒ½CyH°)Á?Òç1å$4tvÏü¤Ä)wæ\"£10X+šŒ7ÜB¥eí$Ò|jRéïAÖaëÂ#^­Å²\\ÑR‘‚0÷œN§7$î_‘à×Ïf\\4§gÔ:-ÏPµoµá@@ı÷\ZÄ\"=ƒ:~©°¯¢\0ºgföÈ]å“.¥AÊ±ÿ¢G$9kš6-y¡µPTóàÀß·Q¯úI?E}4íªo›ÿ5¤‡ÃÏPòˆƒ{N«~çˆH$ÃâÂB5×kÔÜ†_ÑU%ı?ğM	_İĞš*rú*¼¬®*4†o”kãbú-ï•=ˆEIí\"xÊªä€½óñh]ş `øE2m€Óóo–Àìê;êi	SWÍ-™O!G¹œO‡šZCSµ7Ô_5Q*™8¾¤dÚTAsY£Ÿm„—å9rİK±Æ…­wî`1ÉÀã©jFÊÃ9©&¹‡9lU][‚=q‹®%’­Ÿ–§£óòşÖ…±¿×6#QZ8ßœ&Jdüè‘qRJ•L¥yV›Läv^¡ŒXüf´üÉåc\'a2§Áâ!S§y‰Öá-‡Y´+Ò¨&v½ñÊ‚ÒjÂÇeo·ªX­¿Q8Ö-ËBdQ#ß–6¨}•¦\'Jo7Ÿê\' \rßÉÙş×›SË¥ù¬:_(¬tB{’ên±ñş3v3\r;Ğ·¢-ãµî„­\r¬ä\'lKdâ»– -5HXŞ<ûìÊ ÙgY–¦\"ëR›/¸µù÷kH+×wXÓ^u¹<å@”«õª-ôl“cq»M¢T-İŒGò—@-Ù‰\nõY~)WóÍr\\Z}–!>‘ãDÕü-Š+Àº\\².‹ÊèKøC\0…Fï\\¬‘©\rE¾YV¹&Æ\0k¨>şfuüåbÅn&æ›u[Aç‡Ş5HŒT¦®`´ªBí?ÿò’šaÇIÚ•J8m%¸“ôÓ¼ìÖ\rãX	ñşĞ™ìÉ”ùRAÿU1İÔÈƒÚpü.ğ…ÖÍR‡\ZhW„MA‡m[»ó]I´ì.¢½ñj•u\n+pî~€õìõë¶ë—ó@z”!Šj†§¨#’B7«}÷Ë¡O_lIjÏ°=ªÁò¨°MåàD^AÛgg\"V ®ö¥=¹Ô†X!³âwCU¤Z½ßzõš-Sñq\nlªé†m¢r]Ü¹\\$/({ôÎY9Âet9îC\r˜\0NéÍ	`ÃçQ‹°§>—XÜæåøb4;/c­<Êâ‹\Z¥ç!zé¤Œ\"ÓiÉîî4‰‘Ø’ Gô¶>p›HVcõÍÍ›Ñ9¾â¶³‹5qà‚…Fålòì¢šNdBÜ‚Æ%VIQ¡SØ´îX(ëS‹hkŠ2®`\'.Ê&ùbYá,ç|åÁÏLfıW\r&2köÒNUÔg áVFæe„†”†¶â/gp²\0§šÅ|:Í’}ÔÔ¥q|+¿1hĞ¯)1bÉÙ²ßsêbQïuÍú’&ŸëÒ)HNÒêÙe~şH;ıò#—¿{Wğ<xGªĞ¹å&Ş½Ã&4µàÂ¨\rÕ´;]c³r@Õ¹ñóî]~ÄPø\\ñ\0FeZ–éÉåõ$ÖCŞZs×$‚ò¡– |øøoê°¯ŒS§Ù\0ëd:X0ƒé¸#Kgl>¥ÕBÏ>m[Ò{şx£†kø	œ~¬ÚµJ¨#·¼ÑFz–Œñ™­]²k4î-oN\ZĞ–wãÓíòr!ßÏ…u±Ä‹\"%¢›Ÿ-©Øú^ùeğİrÏ\0¶ ²Ï¦H iÈ7¨=Û%şÃ×í{¨¢n9³.¤!$›‹.Ú¼4è¼õ%ÑMŠFTõ@É×ş>%#ª\'h@¶at|ÑánœÉîÃ‡ g(®`×s²É0ÈGãƒF%“ƒˆU´Ku¹B³#ï‘ÈnĞÜ½¼ªI¶AÇ²}–¥Lµ3œÀÑš¹Šˆâ·è˜K²<ƒĞş¬àÀ?ş”…/®êÂß³j=E¬Í‡×ÑsÀÇUvâÜ%İ¯/–—åè£O¼Z«È÷Ê)æçC€V¡ı&9¢Ñ—Ÿø´KùÓ²:¯fo<kkÿ3nŞşöÃ÷ß­×™R¿›¯gp_QÆô76tkg?¬®¯¦{X÷Í›ŸéRıZº@˜Ÿ­ƒŠÔïg?ıòº±Ç¸¯1£Hv˜ŒdªõÅ3¸˜Á¤ÁV^¡^0ÕèÜ:¶Z$/{>¿\ZU3©¾‡úÂl‚‰i%(ÖöåT$=Iõ:ôÀ—QÒl§¤	Î&g§­:\Zñlµ;}—‘X~Óõ<?üWØÄö]’®—*-‡×$ùéöl´Enø¬Ij\06AšQ±G6ëŒŞ õ[Ûp;J[Ñ^ä®;¸½¼Z“a˜3eíD›Œ]PõÜ&«{€uE­¼@VYúK2¨QàèuE`ZR®ÁW!½)¨h0êÆoĞ–##S2…³‚ay7P²Œ˜æ\rpL‡´’ßÎ¦Æ`å¤®\"z0ìz)j˜A0å”M)_\0WIi\Z^HnëœõÅ|âzû}¶#PƒÔ²³Y ?ÍP*ƒ²ñóO¯ßd¿Hè–Ÿ¡Pµ õ¯/ŞD~„+šÊ‚çgÃÅ¨Z®ÌùÌ2Åı#:­z7ºa!áô<Q•~¢\'R²şv§	*¾,íaŠ{É¿nÆpº^—Kæ©–¨fb¦gÂö²a™N;h”!¢DGAâù­¯¸”E3—ÉÖ\r	ªm<í½ğã+”|üìgûYçàï~Ï{Ù7Ñ{Y,Õ1Ø†WşÜíÅ/¿üôËğÍË^üôç7¼{°•ÍŒ„Œ„¤el&ìEæ5îİŠáş%ÆäŞ:v‹ÓèÎ%|®çŠhHË¬e¾ƒık‘âÏlİEEJà‚ĞC5¦ŠG×İ>tk¿ên–Àcç$^˜æşŞQ·&Q|bzr,ìaN”­fR=Ä›ĞRhªQ†@%”iÅm0™ß–’’\'èV||6ÓG‘—.€s-ÄE4Øs•YJ /ÌÙ+>Oä#ØÍj¯(÷÷ƒ¤\'ïîlÊÓâ³ÃC·ÇÛÆEsì\"ãz¬İğ|3Zzúú‚Ÿ½şåÛÅt1D×òÈßxÍ±%$vë‡Ïz+¸Ì“+]ìùŒk!Å·=†®GªíŞş~¢BàÛi{0è²Îêbı£}R‡)Û+RŸwİù\'ÍÎV¿œFœcØÆœÊH\".$íŸ7)*A¸—‹úëğ+ñ)şàfÇ£Íùzãpø\Zˆúxk»äèÃµ§d%Bw·=Eµ×Í›’AÖÔ†b‘€F‘¨C‹U)_´°È…†(Kêˆc­¦k›š$íYD{vv‰—lƒiº½Í£w Z|o	À›{ã`KƒàúE^½şéÇŒ•(ğëë¿¼øşå™±ïïa	´IØ¡SÀL´Ñçc¢ şv÷ü§~ÆªËèb\'ßV(ÛCßæZ¬Mòß‚³¸Õo—ó+‘@P@–kÀ}7Ó3kÜw½…2‚İ­nfcñ#‚ßx¬@v}ùüM\rË©¸FD5	Äúm÷ˆàİGîñ*²­’šYëÊNÓñü|Fn\Zµmv0e¼öŠÖ05oLùXèïÂàL¡ı‘35È×«%À%23\né‹[@¿JÂøÅÆxñmT ”Ö’øëÛ¸!)JO—¶ê‚-F7˜:ù´6Ù\\SNá8\nñæ%÷‚aW‡„îºµæm)Ø‰xK–oIæ½“(ÓTçÉ”…aÖdóJ\rß­TÕãäÄÎèJb&(Î&6‘¥2«XísRÑßÑòÆj×qÓô­º\\¦`ä§¦ga†J|AÇFg‚OÒ}‘‹Øeî³/ONBéÎÀ\rí¯ÕúÍw:ûoTáë½¿hÙ9Ñà¢ó/µA,nî8.ªo7Q°“‰ÆDYş1:¡¼o.¤¹«÷nô¾œV³¡*Å‘	bÀ?\\”3÷¸Jj8‹¨oüXß§]kÎézp{ÛXh)ó<a¥ã´	›çAÏuN‚DBqkuĞ@yKkS÷ìiëN\'¸çö»ÿrxx˜\'¯õX§×ûD8¬PúPL¦„Õ2ÄTzéREª‚¯“pÈ<ƒÙ€ÎÖm,…*â^uÓ\\êJ¡àÀ©SdEv@uüFÃ¬ê³ÏÔ.EGÍırÄOxÓp‘v6P£¸³/ÚÓw…r7c¯X›¯¾èI÷ùKVÔGÆNªŸN\ZEã~añ¼ªô\nœ¤8Ÿ2Ø!£÷J9†Ã‹50H¦	®˜›Õö*ÓQz“úÎ”ST}ÜRØ\'Ó11ŠßFŞ“`-½‹$ƒ”Æâ>K;ò%Ë08>Ô*˜Ï!N.Cî™5Qì.…—†ÂõA“wª?üÅ«]\\ç7Ádÿ¥DİGÊ	|	¶3ÎI?k ÏèŞ„X`øgBZMóUûZòë¢}]ÈZ|…ÿö™ÛD[c)*tS´o\Z‘a­{½ºæ‰’ç«µ›Qğ«j$ôĞÿ•H}7²¬ß¦^Îäü¿Î;\\\\ÃÎ2µ×ó…T¾ÙQùÆT®ŠÕÕî}¨&ë‹_ß¿‹=zıC]ö¡¾ØhÁ¦˜°änm;·7Åuïfp\rÿ^{ş8À.îíA°Æ,‘¼9Ö4ò”ö¾*?øWÈóä²ªİ8ìsLˆúHYÉsf>Ş¹†šü\r†‘ƒ+Ç³i™¿øH‰ğkÀ/•ãuÑ\\Ú\\¸;\\öıOæˆoıÃmÃì,9ââÙú@‚c¡— ¿ıtvˆ’S&@±yÿÁyñ×GÅ)zNÈİ]åA—|šX†~Cº©$»Dc$¸\0>äÁ¸·‚‹åtú=ô·“»rÿ–ûWîÍ|Ñ‘Kü5Pzü{%ôÓœò3;?§ú6e ÊvÒœTwpñà€ÓÀTØß·_{^ét([ÎŒhà\'J@ò`{} öJ\\\0kuÍ”nÂ|¨Óõ3AÛ4\0=ĞpIÁ:\nq·Ó+Ä›LÆê´¤yM¹é¿\"ÉMÂwD2àkên,C>\r»Åº@>-$»PÇï»»S3ıww¥ùÊë(ï‹ÃlúÒ4µÔ÷¯ÏÏ—å9\\ºxßÎ—¡óGŸ6\n(ÂQŞİE‰Ñ0Y3`S`3–CÄ“J]>xJd}x,ˆü1‹\r/SñËÎu(	oŠíàNO—–6ş¢T76y8ı•£ØF„lwwc!\ròy˜Û2Œ¾~*Ë´ÿ]R‚äÚ×ÛV“şU¢•Fœ¸»7J$Œ8»}VŠÉ\'\"©º6N#o\"W‘ğõªººÀ^åßî_Üıås²GcKDÌiwöœ™áfB5ë››—òæ\ré˜T“½‚¢¤Eí29‹ÊxQÜÚo3ôŠt½ÍÔd&İh\'|:àœ ´Yâ9	c“ÈÍjƒwE1‡$\r\n±\"ÕÕ>R‚´q0–ä)<Ği‰©W£Õ%[DĞ˜íŠ!ŠÑB÷0’‚ÁM\0‚Y©Y¡³îI\r™c-²Ÿ‘IkÆÖv«@ÀHT!`È¿{óÃ÷iv¾iÖáoÄÿ`\'.äWĞJ¹ä[\ZrÂÙCYã²©=ø}w‡ÿö¨ÿ~]a¿µ¤Éözäùê©wi¢Ë[z,¦ÑthfİËÃ¾ÆĞœ\'›–ç¬é¶&hø‹›ÿÍçkr\r>İ\\ÍøÇùr®o1¦±A©%UÅ&¤<Géê£šWëÍÙ	Ò)Ï_\\/ÚÙ¾}»úôI¶ô@îØwè(¶óöí)ú0\röãæ£íÁuœÇšä}Û›rá¦›º×ë}òqÓ¥¯Wp`ÑÖÙrtNøÚl=ª!²`¹ß—¨qƒ¡‚æ­ç?ı (ûöÅl<ÓƒŒ•ÁR¬jSE¬:«¤N£Ğl´¥û×u¢‡àxA÷¤(\nÊ[OHê)›?NçpsÁ~²^>E• \'´’OÕÖ!\0°°•‡8­Å£\'¬ÎùöôÛ	è¤›Bi„ü¦W*ÿŠ™Æ{æí£%\ZLÓEÓ†¾\"1/Gÿ}óÕ^ëù¼õãOo`2è\"µ··§ƒø\0³8ü0_^Âvm®ÈˆÍî?0\0Cèµ^¾@ 0Æ/E‘˜}#Ğ-²)U¢W‰Ï„\Z%±·pMw×µoâcûÃÑgIb—ÛÙ¤zÀ%QC4Æ>¦`l{£ü671f¨èYµ\\­ÉZ¢së0ÔÚPhAq9¤™Ê@+””‹q¥ë¬J¢Mï\"rëº4ÆVÈ]™HÃÙs§Å¹øa´¼Ü,H»ô{EÛzOŞö›Á>}(Ø+v€à³2j!\n3Q=ù®©9#ÔÆt>ëşğ£‰(3:Ïñ4Í¬ÀIĞŠĞÕçb-o\rw‡ß©s‘\rG–à?êT/Ğ½ƒ¸€Ü+ ÉÍ`ğ\'tHDÁ¢’\"Kà(&°\nHô0ÎòªĞSãªlqÕ>\"Ï¯\n·×À¡…HØ+rÇaYu’Œ–¼|(7Ùj”á“hôüÉ.`^¥<º›S*„ÃnO¾wÔÀ8kÿÜ—	€`J+ÉôñEXÄA‚]™>ûº»bç—åMëö	)Cb$‹³ç¯@f~‚GÓ\'š!¼Q«·2ZrÍ&QM(i(æH	\Z—ÃêWìœn·¢¦Æó¢ù»8B|×·†´âxó0nfÕßùt}I¹øZ½„$RÅ:úÒ†Oñˆ\\jØ=Ü/¤÷|Á]#\re‰Föäf3¾´~4ˆb8¿åÆŸ»r(<áşvPri@üëÆÙd’ùBçÓ³‹a\nLöo8îpû	²ûcçSÖø·ÔDÿóŠõªÕÕÏÜ¬èqnó`ô¿áğÂY}¬İÅÿÀè¾¦Vé¥+qÓØøJ-|CîotïåuŒÉã–vµ„Á¨p8µÇ7mİµ”‹?Qu} /e\nR¦¥ŒYÇ\'\ZAOËy¿¤IÇX¦æø\0W2šş°›drYïªªÄnñıÉ<ğ.y#ÕAh·Bî(V²’ë§ÓÔšmãÌ<˜è@Dı%B\\¿(‚KÆşşö\0ô\rÅkÑ<šöæh„I\nÑ¹×9üâşæXñŸÌ ”½w±RYQ{çæ=ZU-ÅpâÉK÷÷‘\\LGcŞË9k/K.\"„—Ô«$•ˆÚŠ§N›¬Í\r_˜V®NÈ1nnµ¶÷V1±NÃdJÜË\r={]¢§«Î­Ëvzq™¼a?ê›pšT°BÂV†}3Iú4°A]cY¯4co\Z,÷MÑBé£Y¿ã”K>\\º¯ŞÌ“ú6(Ç]i±¹,0©ÁóS‘p¨fPLSFèGCsxôÈI‹á†PéØæOª\n&¶Œ#+AIr\0.B¡(‡û<PÑF®[&Õ¼”/Êñåéüº´İßjQ4Ì„…¢İ¡£Ñ£ü¢‚Ëò~ ¨îäøY^¡®ßQ¾.ñ_ŞÒ\0êÎ±*ê›~ıË‹¯!óõ‹ï_<{CóŒ¶TmRò …Ä^\'æZ%>Î‚U}îô­R‹ª^ÚT7…Ì’p\'6a×­-lBİ…¼¹9t¥Wø¯£“AÔifÒ{{æµËyÙiñ^QH•!†$ÍÏ†X—îBí,;hÈ_`¬,•Ôñ‹Â¨\r]2j(-éŒl¡\nYğø\"FÂ¡Yw-(ÃÇN\nı×¨ïıcïH_Ï\"|À´—ÏyBOqx#\nCäâë8›*&p#Õ¿æ&l‡\n@_Ú0^­¨ì†i5Cßnq”Ä(qa£8R~B’ÎûÔ±ü+ô!+ÂC	£—E¼«‹•·’!dIp7šáIÃe#	?Ö`]³Ñš‚š“â¬a¼êä½}«AÒtL}ëœÖ÷qŒäc¯i/Ÿ\'~Öİb$‰¬£z\"qFñİ&8tá´Nx‡L@%_{kÀèiàéš9^LÃm…J!õàU“	ìXBóı}ş {G|WpĞ})ÖjZÑ|ÃÉ·$96´%ñN‡ÿ7ó9*bi\0}‘ÿKuUéà#Š6ù¶éoİ÷m˜õ´{ÄÒ’ÉØ@€\"sëKA%Ï•BY¨AÓÖ(ÂOÏs™g…öŞ½}»ê½iÕ‡´»?t`Ï³NN=‡ºbaÔH$ \rÉ~º¶í?:Ï³ıÑÕb™ÔO(õï›ù:H~BÉÓ0ñ)%c\"ª+]Ì?Ä¢Íª\n$˜ÖHÎÌp.‹ÈF,%€f<r °H¢ôÑUk}(ñm\0xWÌ£Ç\"1N}@‚ÆES\n·ìttSdMsU—áşŠÍü_èÕlq°Èèü ¢¡pÃ/VåîSˆùµUIÒ±) wg*É‡|¡TÌî›¢Î{\nL!†Ü¤¹Ü xZîßmƒc\\X=ºë¯Ú×¬äÖ‡u®Ë¤8B\0k€êñ†c¶‚nıîx;ÃíñätÙzô²<rg:kæh·Â~[Ö_\n8¸íÆ–ÇCÁ{Œ&±\rÎ¹C™\r…Ø¨m2\0ú«…p*~^;}g.2\"ı4j)_K}Ù[m¦ëÔÍbf*„aÑHÚû6û…RÜVÔ¦5×ÚœS|VYùÎo4Å´ıä|:_<ÍE€ïÜ„~âü¯òÑ3/“e2ÑãøaIæ\"õèã;+×óû:«ê\ná“ï¥Xgúö~“ÖRÊÜ\nùd¢Eüú4„Œfã4®ú˜µä:ÉÕ$èÿÄ%å¦­„€ÅİÌHùYuÊf¼¸ódÕÂù:`–òî#oõM#tÇøØÔ!İ@QD6íEã=peaEiq)Ê¡NHmobÈ®˜1F\\–Ùb®W·Î§Ã\nòÙ˜Jû·ÈLš[2~­w8S™1Ëîq¤ğEõ¸°/%…­Î¯¿é-å‹ÄJbDïIG0¥«¸˜G\'K (Ò#O©ÌaÕ{¤@çE:Ş¤][NÏ„Èz|š©Aûá Á(<×ƒt&jÓŞ¨m+ıi†h6²Û%¾Ù>ğ2Ä KŞŠl‰\\®ÒáõˆÓv_ÂXw5ç_dAlàH›İXİ¹à1ŸvU§rádM\nÅdzêş¾·=æ¥™Ÿ¾#-t´y1vÉâ-İ)ë` ˜†2w1wFĞåvv€U²³÷Ô—êÌ0PŒ:]ï+ìq;H¦ª|¸Ï7t²H“7Ñ»;ş”MÓİÑ9²§4/ß=H²z¢	‚¿t°ïïÓ¯¹ø´~_ã 0;´×r†KEbĞr‰L$k\0gşá•˜€›z|Á€âXR\\-KqãXG¯¶Â–«±LXğ LÓ_ë•¾„&XTŸwæ»v[ëÚ6Ã§)€ïş£ã·oß~òöúğ°ûöúèìíõÏàÇ¿œ½İ&ğï—˜ƒ>‡ÿxG<ıœşıâíæñáá¸KÎğßÇ¢Çôñå!}|	gåş{v†IğçìXg2€ìßfoOa(¬J÷vM?QïíŒ~¢ÎŞÛ3úy†?—ô•ø>¡_Ÿ`â[ú	x\\ÑıØN¹ˆ5Å‘\0I¬Y£y8Vş*û„®ÕëJæî[\n Îô†káoœëÚ‹Ê{mI`õˆ¸C˜z|åÄª0Ì\r®v†õ²ƒ«Şøb´|ÔêëuûĞx)<ú²Óé­È³e÷ó§Wø³×«!Ÿ¡¡sHª@r ^\0E~F/RËYÿQû«~ûø?ûo}õû“ƒN¿óÊ0½}ä?í@J¿ıvòi§ódÿ§&¾ÅüM•~ßîá¯GùP¬6ÿ}S.oRf›d}G»ä½x ²QòŒ…ÛR$[5ø»İin©¥;-CëEÑâï M¾ræ˜ı,³RP$0Ìœ”ã@$nµ¡8/hÈbß£·xç_î>hAävÍ.ëxFaÚª}Ë¿ÎQ¬¿F@k=³¤=ŒÆX p(¶Âx®ìâñÑÉİ#™¾;\ZÔBÓ…~Fsw)òYX„_+à¦.ÙŸ³ZîßqšöÅ‰ƒäŞ‰%ëË†]´NÜ+´O€?Ê¾Â´>ü8À49ÔÒş>ı	bé¡u»OY®W—‘XDû‰˜»T,e)¼\\”§‘ã÷ğË;^¾UIñ:±„´UÈ[Ùs>Şˆ;BQc\Zc<ºpÔ´,$®òXñ‘ã*œQªš§ğ¡°e¶5„]õİådYb>q5üçß=H“ª\n†qAC%\\ÕGfšZ£ÉÄtÚfwñÊÆÎ;‡×É±HİÓ—ñÀ0\Z7O•Ä] aÌŠ­MYAÜØ°WÔ1åş{v’¾u#ÚêpÓaşöúñÿ9ƒ>;ÅïÏáŸ/0ñ‹şù?ÿH9<ƒÛœ,ß>5áï‹oñÏ·ßò\'ü<>üüüçO˜şâ‹/ù—>üŒÿğ×Ñ·\'™øàóT:mïˆTp°J•Ù¹¸¨äUòò¯¾0«à?ÑZœ×g+ÄÕØÏh9¥\'4ÔNŞ×şğgFïÿ·PD:T]s_2\"ş6á¶¹lzşLùxäøâQÄ}{2¶‡d,Nßİ±±Le¹EŠs˜RÖo}òè	9¥Ö1Õª Z¤Î±«(ZÜÒ§ø>kĞz1[mPB=»QC\0oDä¨m§5-G“¶àì­—ÏsÃÑ9ÄhyÀ,õ`r=*È–¹uÁø\\5r¤\"°;3\"(ÜÑ»;<_¿‚yÄ£{àKuß»¥3-y\r%mí÷¾5«¾¤I=>Yó™’œš·J¡Á)î¨“¦VRÑ(¿\"®¥ß€üó¸Î³¥Á×HØª.8Îç©åè×’#DáZo{Äu |¹I’‹OŒı„TŸDí8‡è:½à¶QÆG©ßÀÿ:_^Mçšıo§ÃÁAğ\rĞ7\\ÅØâB¶Ÿ|eå§óó\rï0´HëŒ¬%¤Ñm´ş¾ÇDÎ{œãİ»î²{µ9½ªÖÙ‰1‹‡_ãK…½Ea¨ÖªƒĞ˜óË²\\Ë™(×üZ¥KÎÖ:aåÈ¸âõ‡£*.6ë¢NØ.§“g!¹o£OàDÚÔùŒŠd¼sºY¯1*Y\"_´F°È$Ç\\·Y{PàäH	I´Ğ}^Ğï °s	Ï&>¼öê£ÚájX©ÒH‚«å¸üiÒŞ’Úâ…Ö§Á	Èì]çÀ•¯9­6àAåNñ1ë³@\"DxGv´m@mÁÑï«™	İG1InwÎ\ZÅó P	 CÄANshÿ0Z]òk2\nØãmÃØë*¬ù\"¦‰ ¯óó\"U„·¹\0¹CŸÎWåwì©_èõéè½¥I Ü@•æ7Üê=cÛ2…‘©±o3B4ôõÊ;Àøœ{¯ª™¯bÏæ!5Nıh¯‚›E²w×]ª®n=§›­Gç}ÍŒO\rì¸î(ºüÕ­•¶Ìà|ˆÈ‰Kúq@š‡Ã1jÅN‡CÔş5©8ëÍ¯×LÆ\r’¯LáÇdÎ´–é	ëØÂ„¯nfë‹I/åš™ÿ\rf½4ãöNw–¼0Ğ<+§µ€0æ07Â)àìì\Z ×7ƒñØl	ñny5äÈõ¡z·>©&ÚÌk>¯h]¥F.Ái->ìL2Ú”Ü9Ö£”ßt³4aOã¤JGN1Ã}Œô’’©éˆ3.í½óHr$’p¾ê±ªÚ[¤ç\Z¹fËKŠp;‚»;)ªn);MçÅ=òßö\'ÁêLæˆı­GäÌ³‰ğqÌNÂ±QÀ—ÆÇf1Âğñ?LÌviÔù\rÚ[æ¡HkR¡­~è•ù¯?·}>0–sk	\0@–=Ş\njÏNx Z%Ø=kOjµPp±_	İL[Ñ÷p İó™j-: 9zÓ_fùñqŠäÇ–\0PH?ËJ¯wÁ‡ÍóZiŒìü¸\'\"C±J‰U…ñÀE»®–yQ ²5¢×Gyvä<v Sü€’¶+¸ŸñÑuûñaŞ~ß»éNz7G;ùÑá¡8$kC:ĞµŞ5¤çèÑ‚aÈ}zt¼”ÚÑ£¯%}vÓ°3ğ¬i ;a«\n»™âGm1Ë`’`§šİ?ÒSUïçŸ^¿|óò//†/üöå/ßü‡¨©£\"(;îÜÍi9İ1Ã_ámÂºèê6¸àôÅˆ-z7O°;:ŸiÛ²±p#¡DgÂ3Ê‰î	qXÏæK<¤¶ñk-ºã§dg #·OÇ\0Éæ´ImçBÕÏ´§k^ƒ%¬¡øÜ;–\"c0‘¨S±™±P±\n©±ƒVii•%ÊM…ŒÒ±ñ¨³„:Ğ44VòNñ!$õ§“ 	0<2bpßS6GT¿ñïbSìˆ3Â.ÿ] ñ‰Œ÷äW©&ä~WBY6DÿhŠÑñçÂ„şX6hQ¸\rWÎBœ(ŠæaÂp\0Sa®F’6Ø.›ƒöøò‘ï¯İ(@qõäNş*é—UÅ2ø+µ©›1³ <Ğ¶ÃcæPCÿ+Ã )¯ñÛÆAz˜ÛcûÈ÷¿Ô#qøè!aÛ˜\'\Z›ëá½>Aé·:mòE¥?Çw f`†ätw³*—Ã)WøR=Z”rKaÜC™úhúoå\rú0È @ö1w•{.;Ão“’4%†õùOjå©ùÁ	Ÿº•H©îÃ,h¾G¦Ïâ°—Iº3Ø\n/¤[iŠ\rT•»ÃÙ¾‰#ÂŞÿ¶¯êÖ3ÙeyƒQ}Eîú %gIŒ•‘¢Ğ!xÉwÄ!z¹Ro\0L“,®Ø@ ù%ÅğÊ*Š!ìË+Ü/Ñ=\"MDR³·Õ#ÃÒ»¸ö+ê8©úïí.Ş×ÃEÉ?}Œ&ï6+\Z–ƒ“ÅX±ÉN›ƒæÇ=¸$¯í®Ö›¦%d\\y<Á§ë[0ºså‡¦µrZ}f½]ÃÆPÇÏd^+Ÿ‹È¯–Q8U6ßƒ µ˜¸+H\0”‰È›˜?bw`)ÙÿÅh9YÌ+±ğVÉ¹Ë(Ü/œÂùKÒ<wÛğğôÆğÀ»çZûÙe•…UæŒ!Ô0ãXô†¼ïÙ7Rí¾(İ‚+\'qî@\nO§|.\0*±àÈP`H\'O˜rÔy>¦ØAîëéqv5\"ƒâ\0&ÿŞxF*´óJM%¤›x{5²WbOÜ«V¿ WªoˆÔúÈhã‹9PÄvJ#G¬(Ó	V¸(4HOL3•\"©º°©Hï``ö,\'[Ãa¤¯É; êÌ\"¢6Fd}äËá‹|ëÒÊ\'kI|Uô¬ñUIó¹{$¿¼ …t.æÓI¹üKµªˆ?¬åh VÆ+–UbÅsÂ‡Q…ïUß‡=¢Qšúñ“k×€óå‰­Ù\"˜˜Ü™´í¦ÛÕÊvÒÓÛó–¯ˆNéÎªóÍŸ¦Ÿ‘ËtAçóÙûİtÊ\ZˆããœvÇ<ÍmP¥üÙO^»ã9D™¯@•W»ínpáXÂ”Şf†nHN\\-€|GQìJÄ™ñ’øümxaú¤l…Iİ…0ëÛùò&Ud—R …¶Q¹\\Ü]1Ğx()¸Z&/å¡]6`°Æ›¹_¾äÇ‹e\Ze’\nÄ\n%¶\n`ÍK¤·¡Ù;‘`ëJŒÔWbfC©R¦oIJ#‚¦_üë× ©ñ$a\Zë¥ÎöĞŠØ¼S&.¤‚	ªÆÄŠ×›rOnı’lÙkTJ¿%†Qên‰;1QØ•4Yv80‘‹ÂêPÚSŒíØätn}íæRÄ¶;GPÆêÏœFÒáx\"›Ä€x‰OôÌF”úÂÒíïó#Ağúñ1«»S€ë@ù*6OR2Ô@àdÌzĞX;sHre7¥øĞ\Z5æÆißÆ®ÔLùkW¸œşòåàºÀ<´úU¥+·}øV,ƒôfcÏÈ³ëNd¸èçÖ6–*rI<®£°§¼\'ŒËJØéü F±±Ñ4u#Á.‰nôqÏÑå!‹é(»úÿJÒÈß¤}÷Ï•ç«½J”¨í9Ü¦=kÙI¬!Æîò{ÄÅju\\t\0¶É ÆÁDÂLD¨&–ÿ{*UüºÆåá.Uø\0ö0ŸulXìˆ>Ñw©›g7E­òLX>?·Ñg‰9\nÜä>«æŒt‘Ä¹8KõôÌthÏ®%Ë¶™£ö-ÉC‚Õ3pŸ9p}pğö©MÏÃ‰íTpm&ìv[osŠà–8EƒêY6°V?Ö[j†j½<A(ÔÙKB©#—6ÃÍEpi)\rXYÚø…Ş£‡—Á…iGÁ¥œ*EjAå&•˜æû·ÁSPå¿ĞÅÈZ£mÊôZ2}å a¥ˆU	2 .³ş)-š:‘â»vpæË”¼F¸Ú«XÑ+©Èíï×Ò«{çvõ¡Â§¸K1ÂÙ,²~#Qg&€¼unc­š-ŸˆZùˆ÷+%RôLµtg›Ê(‡¾§34Úîİ]\\N³¾{piŠ¤Ú\\Œi©ƒ=\"SÂ0Ğ3	…ÏÍ„%Ö\Zòû£˜ìÒa/hOŞ-\"	b¼4d)…˜±3aù¸l»4İ•?5-*ÌĞæ§õË(mfÓz`úDÎú¸ª‘^œÓÜığÖT+‘~´­ÉMbÚYNîîöj…ı“úí¯/>Rİ^ĞFºKpAHâVcÛB7w/ynÆ¥½Ü˜7Q9cÈ÷™ªJóm×5´İİûÇùòŠ_½ìcÄLSwû7BÙãÑ´4~²½}ÜñÛ^şöÑï÷şğÿ¼ıÏı·Ÿú·Ûbø_ÿÍM3ëÙè¸ûöøíÉÛöÛÎ‰Ôù¼ÖA-é?ß®>½ƒÿşÀpví5ÉÒrh]`ÍĞHöË|~¹Y¸ïŠ/uvÚV\næ“{n¦”w(¯ÇÓÍ¤|ù|E~Ë½¬Ó±è‘TÆSB1§ƒ,ò=:Ø_pæ¹¤QìZ²ÑGËÑuuµ¹âÅ³ù¨Üùj¾\\Ïgb—M\n„§£*¥	‘?0CÒaÉ&I>¦EÒÃ›jRxûv‚\'—ïåNrSKH*¸c¦“c=IÀJ=Æ+¨×˜×aop5a“L¨I6tÄĞâÜõ¹Î#qîëX¤ë2‰­~6\Z_$XÚœ¦‚/t<Œ‰`åVÁ/ôq59QÚ&Ğn\0¢§Ÿ‚ƒ  Œ™‘1‡0¦âÇiÔİ„ÕÇL^‡ªØ®¸WMP\rÁ?x <…©ÊÂ-ŞUúGy…nDU2”£\r\rºÅƒ¢}©ÖË÷Å™ĞôÜèP<Î{œ]Í\\ŒŞSH$¿»[o3lÿm–Ã¯jÂ¡í·‰ÉßfÒ£·™¨S¹‘óhO\nô<Áúá”·æã£ÓlÈŞ]îî0ı?éøß½+ïŞ=Y{M·wïìs\0#\rº¦ùéÃìgîõM{}üîİ‰“”q™cJ<!K’D:?ár—‰ûh–©—¥•1sÁ¡£ª&Ñ½\'‰ğ-\'6µ¦èäÍ%>šƒBA8a\\ªi1\'©‘ë*HN>We9ÓßDŸé…@;%¯èvÛ[7û²Ød¢dgÜ›ZgÉ[÷º·½qUşŞÍÇ{­lt¡·u3œuMİ‘Ü‹æãà`]ÈÚNŞªêvó£ÎÀ[3cc*-T\"Œ°BºÚb ›N¿W[8<™-·8³Û‡ÎÎX…7èD’d›Ö@Ë\"ªÊ¯ã ˆ’4â´CÛìi qX­¶¦áşñhSMŠ)â?	´\"L:Ö\"\'Ò½T–†<Ùk×Æ•„´Ôq4lƒë¦½v2ğq0erëY­W5İ/S“]iHycí¥îµsá&2¸t¯€Ì |=Ò\n¬]‹eÅæœŞÉ%o¼.EÒ	Š%ä¹¨vRç\0€ÈB($ShX­s1m¡æÕ=M˜¸­´\"iØ”÷œÒ+2,EL¨€ªQcFËÒ™pë‹ßá¦Øe¸»Û°XN3Şï%ã=g¨ƒ¬DvÓòA/ÛT=ĞÆ¦aE“ÎP²¼$ØÑd »å(~\08š–”ÆÑo‡>Ö\Z{í9Ù†¦òñüÅ„?¡EÍ4•×ç³3 •¢w˜›uêHË, ÇdÌ£G9öŠ6#‹‘ëx¨±óíNØ#¿ì¾¼„.^^>™Á?Ø1vÖçQ‹#2nF„j—¨Ÿ:ßÂs×WˆıhóüÛøw+šaµç¸\rÉP§‡šÍÄÑ™-Ë)U“<ÔÔ‘ê[RÒT¯©È>ï¾¤¶tÍ®#a­r=E£šh÷MÕh®@šaëe¤Ãx|b­ÊÅ)È£·«Gçâ[&fY®—\"YsuæE9íøğÄ±£>ÙRù::AU>Ÿlw\\€†I&¥¿	kñSêwä&÷5	6u8ì‹=jº“¸¿B•Eì:]Ñ×Ó_¼~Mâòã_¶…®&ªOlY9ÇyQ™ƒ]˜ç½×déWêR•T¾×¡%î‡ó¡¾(Å‹n{ö¯/ŞdÎ8«½ß×^%#äÃ¨%£2â5UgÈ\rÛ=êÖ\'+,Øq‚Q˜[÷Œ\\5­˜ï«Ÿz.JÿîÀµŸfÏË«ÑìÕX`\n·ªç\\!ËXlê|7ı¼¤‹İã/òÑæºšV#HÂe¹µ†t\nVÒ·¶Ñˆ²@8Y\ZÃª:#•fÎœÑı<…q ¼R€6{,ñ\'ËjjÕbp°V}V{ŠxÖíŠâ)qÖRˆ?ĞÁÄahWïØİyÖÖçıôæãëÒl2³¡\"¡Ù²ÿòh…WçJ¦ÜButóœ`óóàVFÈÑfŸl¹iİX±_”³ZÛä‡2DõÆ÷2|%øxšRµo³‘Ú°-wì\'ék‹ìÀ3Üş½ïFÑwP#+—˜bÑàı*;æï\'fÌí$fÛ‡ìŒÔ¶`òuÿZìŞ<5Š&¬Á2-8Æûâ¨š13g…ú.±¾BmW’^†bŞi…OÈD_˜K¤<“¸\"A]Î?¬J5BÑÇlQBƒ½º¦UƒÔëÂ’XıM\Z	b#¼¬Îå§cÛô›¦ƒ¢ÒÏ•Mÿa¤Âa1‹1çûpUşkáŠXµÚš^lMoÕ˜0>—‘¶;ÍJÁ˜Ñr—«tåÁD•n\Z‚jË4E\'D}Š±ş««gÔ_÷Z^•­?ŠŠ)\ZNŠšÖˆB‘:y´	¹‡ëøHuÈóL™Øe7T}çuòJ‡ºT$^ŞèÛ$â‚mŒFûä¬7oš¡*Yà×Ö¿Ù-)¢TÓ\"Qv]ŒV]Fæ,ßsª>ß(z·Ô¥¶}›)¬¤Ê;gväæl´O7ÕtBš¡f¸=KiD¹‡şõÖÊ~!Šˆ54|__¢®+„Ê‰ÈèØ~~‡%œ êb~ìæ¦n„ *ıÆa[²|¨BÔ-8©¨©‚}ªD½‰\n»%«·½½c~gÈœ YL\\	:Ñxf³Nû‰V¾ğòÃ<i$¡\n‡@!»^.©*ÛVŒhc[´Üœ¯á&Zô¨&ƒ:r³ö)¾ÈúSCÈ\rBàãÍr5_d«®ŠNÔ$şÃ­F\'kSTÏ€ˆDQ©\'VÉÙ¾Ÿwl±}€™å9œ4ã7çëÊš~Å½ûô±Èõíá€ŞµbùáÂsDhÛ—9yf<é4„‹¥iŒ{h¦û·¬m–Î×ÙvkôäQÏhĞ¤™+t:YïuéuG“÷<iÚ%JhÊˆ6¡/jx´m–ÿdm½ôê™`\0u³áÈ™O0ß¢¶,§Âäõ|ÌæÌ/æ›éä;8½„…úiöŒ•ÖÜ6õUM–8§][“ú¬[”ÚÒÃ¦Lêkè-ö¾i0b6šÛbÑr7Í@J¿¯ÕMªFµùòåÚ¥·JoòàgôŠB¬§¡ {eBõ+\"uí7=T%¥]\'¸Z\'Ğ€‚+s YéGÔĞKC•ı\0¤Ã–ty>ß:·MäÎ\" „¤jy€§–‰Tœ¼ÀCÓØy ‚™RîG9°ÃÍx6B­¬¶h¼]°Æ¢œmU¤jü|c†¢{¤âôıı=@¨êë\n¦za	‰´‰_eO¢ğ€ìJ%8eåWï†MMôóú xü¹ûZ±m…œiÿ€şZ¸vJû’.‚É_â¥të§;\\4cÓóìX\n¿ù4G(†•³Î5±ëì™˜_†åò)},bù>•Û<¿<£•7ÊÁØ¨¹T$WŞ@·_–é«i®óTŸ¦øÁ4ì˜³>ğ,vM¼¾Èe&¶Î®6²‘9¨#è‹\\?›Ÿe¹™¤­k¾y}G_D½àfÄ»@¥	Çfˆégª4Zşıà€BMl…¥¤9Qğ£¼v¶ôÂønó#>Lş¨‘~ù5€—¸ğ›o´^/WE#\\f¶|q˜A£-¿ë—\Zé-ÁÖ‘ Pb¨BİSÜ/uaE[4Ìƒ\nÛp\0QvÛavî:ÒI‡yó8\0˜ÓÚ	®zMyWœµFŞ°ì\"–ú³ş¼åH›¶=¹µ§™Ø¥ªÃLòçeÀ\0PÓ£¬AüËèÃÏ—Aro¼^¢Rúİ~àŠ¹¸yü›ß~ƒ­¨¤×‰ˆŠ:)Xóón©İ#œR8=q¹bş²Q¢µêê¤éE:â{µÂÃ~˜)	…$¨é:e0|¦ÒÈæ{”ƒ•Rmç$yhë¹Ñ÷Šœjí8‡‹\"ªĞ¹\rœ<˜ĞNæÃ8\0<Å:ªkåMŠ>”,)ÿSQ•G˜\n4î¢\"!§ÍõD4ø•zĞaå7ì¬(ç¶Á9f Ó¥ä9ÄU›yù \r™5ÿ~>¾äÖI OY)?z›«Ä„„²1rĞ¡œx¹ ƒkGMYOLt	]J†¯ÊZ1œı(ôšØÕXk\0*\'}àVÎqQ‹~ˆÑa$Ú\n—×uVijä¨Ìÿ?¡	½;§¨T|åÏ(0 Âeï²r­·6ƒÂç0İÜ¿\Z‘ÎŠİ&ã“Ï­h=õ›ñÀÅ…Ú’×EÕsi¸ëËc[ÊÇdı<ô¯0XÅ\ZªKV$Ô#A)ät,¡±’uºJxqj£Ñ·cÇA\Zí./w ñ9DÒ€õ©\Z=Ô|W­Ös”\nx³…ç/¾ıúÏß¿é¿œ¡ôæ&ÿùÏ¯¿{ıæë7/úŸåß}ıú»gß}ıã¿¾è?Îşéûï_şø¯ı#t	×¾àãHÊU‰´£Z]ñ·4näEš_sf]•¢(‰ªáÁúÊEˆĞ\\P§‘Ï[óÙô¦%iğ1æPŒIhò~ïúP¸_ä$G+È¬°W>)ğ´0Ü,íïgxƒx\róYOü».@½vÍûæR aOİ|ÚÂè~ì8Ç)îƒ‹2À~ÅSş¶€KXQ—œÙAbÙ‰¼øyy@zœ` ó.¼œ0Vö«ù€¡z(ÉÎ\Z¨êîæ–qu@BK ›@éÚM@óÇ‡,Ï ï’Š»ÍñMöŒ¦ ¼‘r;¹tI¡s‹¢®òó–¿óÕ‡Ê:í¹ß¨ŸOä#»nÙp´E‘Äu{—}n{Ã]Š9	ö%¹€%¾& “cÅ¸Z°¹w¶·ÍC\'¬âƒbV”ÿÀ³‹çÿ‰Ù­QQGMˆ±Oeì…»mÈ_hf,DíÚ4+ì·-G\"³``8¥BYÏ`©‚%ÅûÔÜ,*ƒ$ac„ûü«—DãşGVå\"l”§ïAófw\0r\\¯È¿x„´D”»wB‰AÉlo‚£ëîbs& TĞqKXÛµåÖI!óc[µv÷_Dç¡#Yñ¿.‹v¹¿Éz‚v¿v/Q³A¾İ÷m™ÚYUß“…[Ú[\":v§ĞfmDœHüN°W‰`H²Øıà\0¾¥xvM4“Úb˜}ú—ˆ¶ˆñ^ˆ\ZF$£¤t²æÀc1\"Ç„ Fz‡ëHÀT(ı#s\rœá€<a5ü»¿ÿjø²#¬–íùØ¾ÿg#1º“;s	yxP±¼½QNò£©¹VlôóØprqŞQş˜ªÿŸõ?3,‡xäŒîè¤¹IÃK…_ß”p¡D%o¯ÁEiÆM!úñÉNŒ»;É%(Òñú\"ç\\‡ÇËA‹|¾º¬ĞŠEÚrÕQ@ä©ú››+o\"Á}Úé7œvùDydË\0 IºXõ7\0W*ùº[ÆMñJÌµùcI^xÚe9ÿi_øùå\n(ÕÕæ\nKI±Ä/))¹ÅÑáá¡0M:”Y“keîÇòÚÍ^[\nÒVÃRªb¨xªóï`&NôÆ«t“k´Ÿ«y\'$J©0a†_k]lå¤Wä\0UEw \nÁoÆFn§Û\rÁrgwAæÑÜ•eBY.ˆ*Àš„¾ŸB_ê)Ğ¸Jgê²š/áÊ_$°ögÉc–|Š]èÜRG4ÍÍ):0s˜ì¤oMÄ7\"&3ußy—3Iˆ‚¼b§ğå²çêĞé\'ZòüîOš¸lš¤a\'wµjR´_y\'õ½á–êås˜ÅHyßˆ˜Ÿ“©éã’w8‘¸g†26RÄjâ\'è¹íP@?ªÉ H!Ğê=­±u .²(svZ^ŒŞW¨Ú9Z\\,ç³u÷t´ªÆV‰ËêûUç*Ë®¦tiûıÑ©yÅ%ë\"): \'å¸…œÉîÒÈ²¢~¨ëô,VÅâCÈkd»@]ÁvqaåõoW\"¨ÿVRHKÂ7Hì28µ©ism“â\rÄc†@î~Ñâ	~’ w´¡Ë/M>DO(‹\r#nIœ£Ø\'¡Ëu Ğu»ğ¯cã®ìD}—™@U*3ÃiÕ\"İ’©¶ÄB¾1)¿:vQ«R@N\Zæî$V‘|uŸ\nˆPºèn@;X­Şş>ĞQJ‡Ôğì´ój©uÏ²Œ}9óÜæªiØ¨1ªœI³¡Ş3¬M!ñÑË®´Ác\"Z·!yP	5c±Óğ ÉÁŠ)G×4\'MÄ;Ò•g¬î|ÖUì¨?No_ªù°9C&Ÿè}tê=É6Í¾\r„•ÇÑÔ#´Bnûg~|n~–^]Tgô0İ„	NùØÒüéâ7<¨sd_{îÆû€ÜSö÷ŸĞ;ÁâšÇŸ{¨‡Sö¾ğş.Õ=\n5—ˆâQ‡& \Z_ùÇytÛ FlYVî#UŸ(,eSà .WİDSĞ=uÃ÷?•ZøÚÆW\\ªaŸrU»0o@¦$‰RxåèªÇªf½rO*üÄÓ¦J/}Dà¾ü\ZUidÑ¶6Ö“£«-Ûè«lx:Í.9¦uu¦éZ„h&·µÅnÚaî\r<l`šºyMq°À’-cjùLI»|ò!¢g<U…°2¹Î™°Z:RÇßÂ>–“×óåz¼Yÿ0šÎï»Ã¯¤0YÃ4P&±Šh e:÷·°H3€Íâê›y£jº}<>+÷o§åÙº”/«óü»Y #Ô@:ÚŞsIi˜áèÖro)½Æ4ï5÷B^ºõ´Fl¿ \rÊLŒ&“¦Ñ­áÓš•HN´ÆóˆeµÀ:5¥‹	äY_áíÔvVâ¦ni•¢ÂF¼<H>ñÍ7•4=lw¶~J±*â‰D4ÁgÈ\\‘äË”‡—ë•ucşõùù²<>›ãIóG„‘uÔ×Äp1_UUr®?f¨éŸ¥úi¶uz7Qz7İ/É*ƒVó§YØéœ\rÉËÉpf-.Ñ–@^øÎ\rp_5€¹aùwÉàP…3h³¾îîğ_š‹E8wèâİOÔê#&v*€…ô§ûyŞıÜÅİ\\ÒÄ†„3Â•½ëş¹áÏW±kú°\núSş§ªW/İú;•ËoQC.‚Ö8i(İÈK’i›%©Sb[ŞÅºôÛl‰d+*Pô9öàº×v¢<dËN5ÛA‰zjvû†‹j->Wİ÷Ç¨oŞÇ3G®dÍUWm7Øâ\"~ÇÎÜsE–C™‰yšgì~ …œd\'õKÃÏZt«‚±Ñ„1êºS3¢>5¢×@îøªh p5OZXXA¼{\'L\'&¢-‘7×`ù`¦¬×çØ&gÔ²mTÁåñ+İ›ù|º®Ğ5±ÁvÔ‰À?\ZvaÓfññŞü¹AU!ùµëĞİ?5õÎà†úìb´|†”&~LKAO¶o\ZË«ÕP™ÇV`÷Œ‚Wı)D±ß•ÔT\r¤ÃRŸ·8‰ø(ÓùDÄ²x9Ó%®«=˜;tÓóõß(Wãr\n’‡Iö¼¶PêRWam, ®HŒ×u0ğØƒ+4ÈZÆŠ—MxŠı”ì¯0¼f,İX\\ŒN—Õ]huİñêV¬A¢ªw2/Ø ö*ƒ–?´JK¡´.Êé¢ˆ}([®µ€Aô²A×ÙÎ¾Êh2JcïIsÀ.=œp5«a‡®üT¥xD!Ù$ã5„¼zıÓ=¶=ªÎnhÕ;Ûq¤$ÊÓÒÃ!şù——¹”‡ÃØ+m›\r§VÃ	}dØbŸNÒÄ\nÎéñÅËçÌ–Ù¿VïK?Ùtä¢»œc.Ú:_ïšáG»fX£\" Ú.µnø—Óú”O>ïjã¨!XîuÇ«åYš	ªˆŠ´/‰^²\"€†º9oÉMççÕì‘”z”º¸a¢]Ûç<ˆ”éîFîd1&\Z9‡à‘ñP“?’S„Õ¢µC¸m¿«OhÇQá?ıòğÓ/¾à×w_r5ËjšÈï«‘(ôH„rU<è°Fñt„Ï‰>ö5Æ²/–Îã¯„¶§äy¤¢V¿+G÷¶Ò» ¯<˜íûê@Ç8!‡_$V I^\rO7«\Z˜o»HüA\'NvÔÔòC}w´| Ø13Ú÷Cåg [5ØB?µ‡î:&:Ü¨ïmÑÍŞ{æäşÛ#%0béÅIÁ‡j²¾(2Xúÿ\'Kù	Pé„gÛéZ×É¿ …Sº\'%r]5®=ßrã•š€Tva»£Éò•‰Fa“ïƒÇì9Iz¶ê_\ne\Z×sààw ÓN#\róÄmï¦$§¥XÒ¶Û]³Ù†Ùü´ENç ƒÙİš\'7càŠñ¦\"4Z†&†1.un¹_|’?owNDôF+Š7Úì<Î\"Û€g/;ß@VüTu—µ\0~«ŞÚSg»İ_ÕYìôu[òİÖtÏ¹˜/kÏ-ÕùÅ…fåÄ	.±Š„®€»À\ZÑ¨ÉÎ3n£Ë—/o®²¼±Pø4Ô²ÙAD7IaËif¿Ï0Üw¾sôÈéµşê>ŠÕú¤<Cï¬fUpÉd=ïêÀ\0‡Vµ|è£xÈÈhvP×‡ª°–«~¶µŞ\'Dì;õÙÉ®ÃÑù¨šYjˆ-(Ñ,ø$Í™¯jòIÏ›{…\\P]Y»úŠTñ™¹Œ{ŒÇ/İSq¡xJ‚\\³9ğ5;»(;·ÚU‹û \Z…Sg™·jÒñV:<:@Èøjõów~ù·çp¿Á»×ål“¾[YÁ$u?G>w‡S!½vSi»	sÜ`4»ÙÎ‘ê¿Ëf\0ı[%\r@›êº7‘Ùé1WÕ\0‘bÌÿCïaÜej,ôCGG–ÈĞogpr\"öfùüì°õoıCùõıC+’ŸyOsp^oÔ£ÜMï9²p9âíÍ‰CŸz¤,úªfõí0ˆ=$1íäZ<òèÀMÖ­R©/‘OU¢y§U³RË£bIübÂ]‹Ï°?´fñ3Kc¦a$nt\"—#f*Ò°q„øÖĞ˜º:¦îíH d%OÂå\02FMüø\nüÇ©ºt–ÏÒŞI‡×â¡{¤C^a.¥X+ìÜlÈšÄ75¡)ÍXö‹\\ÙBùäµºFÁİİ¹Ïğ…a]Ø¸­²ŒnLdcüÁ.Q3GkÎ\Z[şw$½ä›(ŸLqvîõÍ]ZµM#kµfƒËÄ5Â&KÌøbäÒ\np¢´Aí¬e5ê–×‹>1 „\ZŠ‹öÄ´š]†·_ßE´ş¦S¡ãÃGøhqÉ$=Ã1§Şxà¿b€AñFHåI1šß‡lxÚbMáƒyt£–ç5ƒ|»#s½f\nš|ÄÜ¹„`šŞÇ \0ø4qÏEĞN÷ªw\rüœz3P·\nZö0Ÿônœ«MÕf~âS¢İÉÃ”ÿ@“˜÷adAOˆ?tK×äÜ{…)Œ©îÀ\0“ìü´%É±|MİAGl©Ê÷(Ô®Ë«[	WL”“ĞŸ0]/!Ãø†€¯\0?Sò@§‘½€^`Ÿ•ˆ‘Ó|:øgàÔé`xAªÚE£û\'akö†\r›©;Â“€ø·]s+óšä\"fŞGmßÏftÙ†^oÑ±ìi9Õ@:>dÑ¡/Šp~[ğŸ+ïfÖ7pÊ8¢Š¯J-No¥È¸eÉSó‰SÙõz3®™\\öš$MºƒÎ~ÏãÖÒ4¸ LøQĞ¿ÿ@©~–3äz^»Ùuz’âÔ+ä»Ğÿ@gD–»Vê]\"ö÷	‚\n*¢ˆÔÇ%æ)şQ iŠõ]Å~qBø\\·,äïÇ€ÆÕ5`<Ÿ9\n\0¿üçcá;Œ©Ù§Iáwÿ<¸wA8î£B2Ô½†ƒ:NJC‡ëœ$ˆÍ´bbãÙÿÍÉÃì†^®oì€”&ÜİIVjlÇÄ-t±,©O±LÆÜE÷ŒÔ|GÙ‰øôheí <À€VÀLğD\"\r\0†Ôtá{è¡=E2ıÏƒ¬u¾,o²T\0Qâ{|Ñøy[gBƒë·án\r·ÅB›°$‹‚•áÔT¾Æ‡«¤yn¥tÑw¬”’ë+Õ¼.pX\n*Ò–ğ»ƒ´†ğ‡Üír*˜ı>#¾ƒ7¶×ó{Jt7Îéë+àcû¼ñ*CÆZ?”ØÅõGÊ4Ü²é´hïõûşeÓ’á²ijjÙ4ïŞë]šP²„ğ‹‹uõßæqDELúìáMÊkğ†?Q\"/ECKùWl`ÛŸdXô û¤ÓoQlÔ)	[F«Öl¾6NÚÉ\0^ÇuÜ9Æ4`êXXŸ–—ÁDÌ75AòXÙÛÍãÃÃoH…–ƒ×‹± 1YôøG \ZÌF(ï$ÒéU->õ#ÌRO>a³ õ\\iRTpE‹D6š\rBåÂ\n,•%”†Öw}÷­G•9PÔ/l1ßã‰Eä€=rJöÓY&¨Sİ£HY‰µ\\ı0¼Vã¸JÙ[5ö›Ví©”Š‡/¥(Î¥dÃeÚ&#@È….ìïWÕ^QvL@qGD¬¸à¥@Õƒ#‘E=–òLé]/—¢SÓ£3qZ-è\râ×dÁ\':/ĞÊ_é^P¤/ë$‚/${C>3Å5txù©éX‹>u©d9óé¶ıa\n6H~…QãXnèÎgEÓ3$…§“z+¥Uî¯Ln­?f}úûBş¾–¿]\0\n-ø	}(\0\n†ØúäÇOZ@g—héßúä|”£Õ\Z¿†ß«ù†2²ƒƒ¯~òWHû€¶¡- ¤­ÕfÏËL1ÔÏŸÓ„­fÆqfíí‘Ü˜ÑÀ»T0ÛæÇ÷—…R:‡ù Ë{Ö¶sÒ©ñ»êùXÛÜE^VùójtMR¦‚Ö÷ [\\E“ÅTGß¼ ^po\0 2z‘uQ¡à+ß÷ª«ï0éÔÕh¹v¯,Œ`„q¢8;_©ha¦ºlq-ªqõ$††]@	ù|U6÷@tçuJªÕO³×@~C=.ÌÖòƒzy…¡@ÊÉOË\næ‚N(_zğo¹Šªø‡7s4\'‘qæùXˆÔÉ;òOÈ›|æ¬é—rªÏëğ7½­§¹“x‰Î\\z×İv{ÿNz×G;ùÑ!N¶ÀMwÖ»¡dãôEå\0ê§ê\"ğ›.\n±¸òú£ûÍÜ|Ãùk\rBùâcúã(bßiWÜ#˜YG‹ÎázÈã¥(ú<ÂˆÖ\rI$G×Ãëİo¿ï]»”H¹”¹Ì-F¬ŒÇhø%*z­´;şÆ3ú‰Tu‡´*wrz!ÙÇÕ	kªáWïú	tçîN¾nàëÆ}]?¥û\\úö~)D}&ò£Ù°ış`.o@ÃÎÃËëÌ»Xq“\r}u^ÔD3Û·ƒÅù«±U¶â#¢>ZãG©áíN\Z#q8Ã‚gÂ5?ÇwòDÖÁlg6gA¡ûjS‘zéQú‘Öfw§|ç³‡8–ïfL’Õƒjüäáï~áåÎ¼€ğÄØ·tv€“óVÓÊÏ>:N‚Sk¡S†@•ºİ{t„eä«àş”¼Ñ‹=Œãñï\ršÍS0)e™’vŸ. „«ÅQ&Cö%~bx¹z3ßŒ/„_o²±GôeÛv£cÙ#z6Æ¥AAf‹jwwGù“Vÿî¶	CÉØøG”DR-$ÔÀº;T\"œ	bs¹ÀÈ”‹Å\"~rŒaïìî¯›A˜\'Îå\'„|¾ÄØænëädb÷BÅĞoAg@eú—œ!’C]İC„õ²v=¤’áõğ’«“Ë\"n¡7geîãğSªÂöOíşñåI~IìßeáÄÜz×­[¼)	öãî;px¢ì\Zçb`ãòƒó*‚^Ş”W‹iàC	øÛËÍ\"·:Îk)DÓö” İ[ç.¯cë®ÿ½nTbfÃ—ùˆ`‹b™ğzçûá6…¥ÍÒèÌPVÖkök\"$UNÂ÷ºÂ~»õ¢@šfÚOí3á‘Uo²Šv1	`OÉpèqo]0ÊLS2/°ºu¥¾~ÕÑÎ­‡­æ\rñuır¬Ršu£8Ğae_oR6ÀºŠ!}‰Ü/âÊT4ìBXadx_•¿“]ƒ¸£^ÅUMĞlSq­©Ş·µ«¯ú§Å)1Ì!9›ñ7†Rì„ÖŒ3mßQiT«ºFfó-É¸ÿ±!!}¤°°D*®FB%\n–a\"Y şI(‚??“Àª…Z\nv \'«7%®¬Ä¶À\"Ê­Q’Yïœ\\‚oõÁÂÍ»Ğ“é|É1@8½i‰€LŠ“9§Héut‡9ægj@\05™¡‹“IÜ·x‡¢q0,ÍÄ›É 5—¾l6iÓ«5á‘oÈ\'¾,qÁ–ÚÁàÈ–ùM<tšhˆõ\0-Àò!\0ÿ$CJ1QQX`ìÇ«9Á3ÙûØÀP·¢Ù R‰Â4’.Şô‚êì\n>(`«H¤ Š\r¹–³5]°Û¨¶÷Ë_+h«›—{[ÛE’•y³üÍhB2S¦	·d}÷s«|¢‡j2ñ-ÖÓÃø\\’øÑÈEåã«Eè¯nxQ­WjÙìs ¡\\‰×æ$RB6:±í$>˜EœNlw+aXbË[R0Á7\'7ç‚h‹Şv;·Aÿ©B5U~r,¼GiZÌ\nØıZÛ¹Äfö÷ƒÂÎ¤Ió‰¯:K6¥#º¸€]\\D#º¸°#Røê\'ô0—a]\\œh¢ği÷rKS+ï)ô&O\rúo°Ê^áŞc‚“SDé_õ»GL_7¬º·a&fÙŞKâ{M„¶¸à^ñ^”¦\\’6‚Í5¼uÄKNú&†}MäI±I7¿Hº¡7Á7÷*H‚S	8³½Älg!ê»>Õ]-h¾é%#O°Qì1Ú‚Î5®Õ¸å}DÛ£y;Uş…w’Ì~çÖ\"œĞ÷zY–×s¬kßºVêFä#›ÔëòBÅ¹Æå­äÃ”43LÆooUN\'+‘Q\'ÿËÉÀ\'7*Ò—ØøÒ`n\rT6è‰á´¥?x\rnÇÁÒFó)LL9sèO>Äğ\\úğùÉİü<<ÉİøN:vØõcYZÎkMè°Ãƒú–´Û|;†ê\';\"úÚÎfYiÁ£“¼šèÇãï©S’>óI¸“4ùPíjtNáä%éËRéÁıîóvø)Å¾8ÉW\0qíp¦q	Ğ\'Ç½¹DèÛfVı}ãS>Ã1’n^ÌO³??ÙrxM]ëXc*Œ!Èš4±¢»×ÚiY¥œVv€Û„òçóò}5.ƒ×Ï	%iÌ{ä €=¾˜W³uÿ_ş‰â\0ÇéŞ_\'¾…¢2nD$e1Ä‚*pæ²¦ãÍÔxvnnÈN	·PNÌX”·[ õ’èb(¦ò$Í‰ûûÁgoô~TMé%‘v“­	÷®‹Fë‹ŞUtºwÙj„ÍÙ¤\\]®ç‹Œ.:½ë\'Ez\ZÑ²+pN&TøüO‡>wqª¥”)I¿L =“ZLü”Eğ¢™àşQŠBå»ÜXîZ’Ö;)}u_K`ªIÊ=õt¦LEMÚ]ÓÕØ‹k$Ld¼8Wš\r¬ĞdéÕê9ƒj ^ñ|³Š\0y¹ÂTáº®ğNàœ{ 9eñàÚ^†Óò	¶NÑn‘uÍ>Lv¤i’— –œ°Ğ[ÏÏÏ§0±¸J5Ã<u×Q’¥Ä¬ˆ¾ïî\\\0/MvIi¹û\ZÅàê×Ù›ÍÈ=6Ù­8°Ú:––ÇU;ƒ5Çµ(öäGh„½îQHö:Â’¸î²“S”Æ®5>Æ¶É\r/ëØ=¸ÿÛ(b¼2dİy:¿îÖëÑø‚TM\ZPhQïçÕp¬;×kãÜUK¢ë]çêåÖäìíºÆ²ßcÛßÌ¯àj7e8Õà7mÛ£Ôã:ê¨É-¹(w\\Tw»EùRô²I ƒwMzr±½RÇl„\Z=¦üyRhVİÅ¿Ä$:Æ…†­q¾ŠüĞ[€¾;Pë\ZÅ‘9fvOQñG«õPúÀ·\r2ÖDg8Å•E³/@\n\rKoúæŠ‰Ea:N£Çè!¾AÆ\\ºûÆYpÒMrc@+pu>Ä°<k±’wç!î©ÍJÓ{–Ó×ÓğAÒ´Ì‡PX6¾Uz\'¹ŠÕ¬½õ’¸R(¶Ü¢ôÖÕè†T8OK¸à ÷7~»_¶æg­Ñx½M[~#¢»\ZÛ×¦‹¯ÑÅòp/°=fu]š <lK £féj\\ÎÌ\rğ¬gÕ8Ôû‘Jq¹N¸@}uvwn5ƒD€ÑW8@%i\ZQ‚*¹(Ğ©<8œ¯Î=GÀ*Yb}«ås;—+|)\"ÒDŒk×ÌrÔ“îg¿Ï¶±ú³ê@S²’®ûºç`]*ÏÈÎBÖjFŠÄ.ñşŠÕscNZe›>pí¾\\½(—:‚œ:ÑñÚùé(pÑ!Åd3ÜÁ@]ê=#A`;âà|äH¨÷ÄA÷A­6«×pQÍ’çÂİõ5bgÆÛ?;Pr•á†ÏØ-KÖË,¹èèÛsÎœ·¶³ß½ùáûûw—Ey‚bnÛ?¹y}k)¾<Rv°—/@ÍF«KV:@g2Z^v¯ )Cg:mè±qD@’&Hum§ÕÌ€éØ¡Â©}£ÎNd€Âôæ£9çh°P.÷”Olr_EN^Új9.ä1şG¦‚£,ˆÿ·òæ9t]ù×½Píü·päyßÄG6Ãí5:Ü¹íZûZ% …V×PŒy‰³mÜOŒ‚pîD+úÆ<WHz‰²Vnm‚Q4¯‰å1Cı¦\0½×E÷å×l\ZÁ­/÷<¹çÇ·/\r¿]Nsåª§é1ÄÃ”ÓŞ˜ùî´Ò‹š0©>r†eéâ$¹\'vìH³±•v}éœÚ•øTØK±Ü¦Ù\"õi2·°HL‡Ô Ò-Öh˜Ç²2¬EÚÚzÅ_¨d®2géÇ‰ÏFİór´„ÄîjQÍğü`è°gX.Òx€ K+ä½è„Œ*‰òü|1\ZãkØá€îº¸İuNĞÃ&z¿ÌBóğZG7~û·Z½Œn–¬‚~Ä!‚ˆfßJãıãÃü°÷§“mÇÁ`âH%0ÃT›ín×T©Ï}¸½k½gR#ùEØğõâĞ¶Ák+F^ÇÇ>ç©3¦[ D~îÑDrZü¸ßªV­QkgÓ´\\ÏgB•5-ñ2ƒG‘˜?Û‹àKK\0Õ§cÕÛÖQ¬u¤Ë\\ç·gRM8¦(×máË€˜¿ÏÇ—åZ?lóšFµÅü=Ş4Ğ‘ïÉ_¢wø8û¦:Qrr2TİYhµº¿”ã®iß,pÁY³NÖ_r¡\0„r>ƒÚ¶µOËójÖQ\'şÁ€›…«ÂvíéŠşÜ¿Ä¾¿§:f>@o9zÚH–Yj–¬íÙO@¦‡Mr¬şë;Gûæ¡}ÚÌâ^Õûs®ÈÛ<¹”M6¾¸2iìÚİhDYëÎo>£„®‰h!´oœgŞòô5%´İWÅj.ˆÄó\' »±¾œ5ÛÅ÷ßz­ÊÕ\nèöŠW\\\"Q7ğœ¨©®Â‚zêWIsÅ#wÓªTÉ;ÆzğjéÜ/iÉ( @ä\0«¡-y(¥:Q¦At¾Ş=y‡éƒ{%3kGNOrğø\"ßÍd¬CÙGÀrIzêÔªÀãf…À^ÎEçäSí,%§gÅF£êÇ§ˆV!¯ÑöŠPßNÈä›6Ók¢Î9ä³^\ZV½ÿÛnÓDƒ¾brğmº\r|ÀjÊö³¸;K[7$ççÈÜÒtü;<Ëëu:¹_:ÚZºXy¤4¶2:Ù	i>ğc{„2!¹bwÎ¯jşÆ=Ù†>æ­«œgjy<aWcç¨ pğ¶ÖÁôÇùº:«ØE(ÆVT¦‡ÑbX÷œIEÀõ8µHamŞW«Š¢ÎŠ_ ¸\"¢£MÍ³Û?Â€˜ğÍÏŠ¿\0İhút¸®Ö\ZWhˆWIùI\"5ã¡ˆù¨Èİ›);2š.^@é«®§|²Ì^,;Qšƒ¹a ]\Z‘¸Ç¥‚b¤¬¯¬¶=Ø½ûûTh’È|1c­Èz‘°¢ÖWx Êƒ¾­,ç\"MRNº:}ïä#§ùê‚·pŠöGŸ¨¾K?ë‰\'	/eğ—LãÉFzIÔëh¥9^™8ìçsrê•{\'ëÌzÆÀ¤5u>£8z”Ùe~Õ°p^—,¹ğ¼¤$´Ø±¤a¼P£îâ(gÏÍVfÊ‡¶:\n4uê„~•WN~œvËÉÁ/Ì&sç.£Xí\nÊ©ƒyC»ÑûÁO­Oı[¯øÍÜ¶‹ØèÎ=ø]æÆ¯ò¬T«T¸îPƒØü:wPõùT\"æO†j\n.¸¤Í&î°Q´.lfç4x_ègÔ”HnGXQî\'Î›q”;ˆä\Zo%G~t/ŞÆõ>é=×‹ÅÛ™-M’¦=[KŠ(a—…YpXÉûZœ¾íD~t¼a”O½‹z×ïXá9YÍ„4£@¦™À\'®j	ŠŞ&áªZ­kŠ\";_0ˆiFÌ|tÎòıx\r=59\\|ÿø$ö|jgdÇ±h¸ƒéô{‚N‘Ó:«¼\0%Ÿ½Æó\'$Ûl¾È6ëäÚLT¾EÍ¢ ûåX<f^¢¡w›qÙ®ªüÈ³’õ1EóòPFCìqu­ŒˆZûØ\\QØ%®!~ì–¨®kW©.4O5³ñlÓ›n|üª	!îÁ˜gDDöàIvÛáËÔböÎœ]­%&×8\\“óy‰¡2”\'%õÙƒ(¡°|5GØ¨AŒ«<–Y·0»ûj]Ü²FĞUµ.¾?4†¥\"f6¯{PUBtFH¯¿Ä†îvÙ©s«{©Î½D]ÏƒÖ:	­?¹~vy74¨x¡ ~È‚bg{Ši?q’iÁ×›¡mĞ‰çj{N[e™BWîsqˆß2”]Øøï0!V”°WdáFtÄ °¾<ã8„Ó’ƒëµ¸Hê#”×¿¯&›ÑôQ–£¯?K«ÙwC\Z¬…ÀsÖW8Ë]Ñá÷–Iq4Ô—ŸjGÙÆCFm¢ğŞ~üÅ¡\r\\Æ8ãxî\nOß˜ÜKß|&W[‘Óù‹÷$4,ê§ôew®h£\':Ktzw7léûÚnÍàƒ;Ş²\\-`[È£Ÿ~õHš0£ëA‹ÒÒŸ¦q°lF!oE00»\'RsT]Œfå´Ë\\®Ô¿õíJ°™ëƒ¹éXªÂzšn‚ô6ÔéE _$¸jKÜ@Ÿ»XVW£å\r“Ÿ¿{ùœŠĞÈâ;POî8>î8=¹Åød¾$ËµÃ\'Óµ£\'A`™wt‚Ô\r¥ëìï§ˆšjZ{¢WÜ;ÙÏ¨çÃ+2É[Är`:®ßÃGÎà2\\c-º£i¹ÔH6ÁËæ!^oŠC\'\'S\nï1r<8¡ƒkÃEƒ¨ÏËí¤\ZMçç}ÎËQ³ßÜä– ŠÃ@Ôb”9ê¤JÁÊSbÜ@µíŞ…\\ßÆç‹i\\Ç>·Õvßß7°+¨Úe¨ášO\'Cï\"…wN‘!Š®ó‡z!Ht…¤³õg¯¶Âo^X^›ŠËgµ+dOkB…Úú	ŠÔÒ{N“7@¥Œ©\ZŒŞMc°İ>ôQu×ÃB(²Õ|3›dòÆ©aˆúk,‰¦á7Ñ3Ã=Ñ¶8Œc×ù9hà›~ÏrJLÛ<í[şkl›­ µáåNÂWÀ*ÖFäŒ	]TOMëÄc0ir·èÅá|‰IÚŒıl³œ¶³ƒ¨ÎAÖXŞ:’0À€ön	d¦È£>Òr´Öj{Ên+0‰:ƒô~U³÷¾>  ìD ke\'j¥ŠæwuwÕÎ‡eMYFÚe#Á­ó^YWªIQ¹–jÆ²CŠ1÷ÖÇ•ğõ‰;éBpCå[œ»=±şFºˆ2è|¹vßöÄ÷˜ôc§†Î°ı6{·¹Zdı£šÅ*ë?Î³Årş.ë–³sÿóF·˜gı/òlusušõ¿¼ßÀƒì—ÿ—ºø_iÁÏö÷ÎÁ‡[ÁãĞ„ıäîî_şå_Ä0?Qú}ª4™ç3æJN$ÇÉ]NüÆ&ú	£y‡ 6¤¨®ŠÃ!t¯º3QçQY&4.ÂJLÛê¡À\'ğş»¬E»@)xuÄÍ\r—zÔéÜİµÛ¦‡O÷$aéÏXd€à;·ŒVWUìÁny&ºÇA’¥¿¥C¤F×ÕÕæŠsŸá\0\"×+÷ø?z:·Êƒotyô@GA™û<ÈøÂNx1\'k9”ÙèeÏ¼àY”.R×dŞ)„š^x¦Õ˜6ØÑq`³Nhä`•RšFD1)]&ßK(ÿ;ÎWîç×2ËËF˜ÛzÆÿõÑR.ã(‚Ó/ºåAÒk©Í~:Án†RPÂqN­`Q¡•ü&Ö”B ÿUkÄe\0a?Ä.Aü{J¦æşÛ9VLÙİÉòáVe3ög%` ¯Çs¤2<\Zâ~¸\n‰ò¸ß,]pİ0s‡lîÆo”¿Àãİ\'È*;\'cRT˜ì|:?M•tÈ(rHJx \Z5ı’‡:—Phë÷WM8=ŠEûéÎÕ%ü)˜\ru;võÍ“@cq]daèÕéeçG«Á~¤V‹rL‡ELTT\n¦a	©(£†àĞÎ–hÅÇÕlĞ?Zu$ŸÁ²Siï\\®iÙ%ì;ı•f}‘˜U÷\rbûŸi$xÉpnşo©Rß×7qŞY><Û·•U7Å¼£pql\"3âã=â?MaàÕĞÙKˆ±ÔÚõ×FRŠ~VãVq\n_@üâ$zk‰6=ÜwUfçÖ-xQ£b‹<r}şEÒ\'C¢îÚeP)è%?ù˜Nûe‚,dIMT-uPfÕÑ¼:\0ÉÉFİ[˜Ğ¢¨’Lmg ½”´³-t*I´\r:o\\Lİe­We‰>½× BĞ§­º¨Ô\nÁLÇI¬—„Æ“Ğw[ªnDƒTÆ¼ÛÊ¨U­µ.ˆPqq‚5yNP-èûîÎÛå°à$ÓD=ÉN7§%dA0IØS‚Œæ9Û829Ğ9,ûU†Ï8õ£o€wË¼³mK³ô\n/o6nAI7\rÆã~EÇJŸ.DÈ2¢D™çŞ0™¹ÉÜ&ü¸A-<C—Ek„«Î8÷ö@¥¨‹®íWÊ¸||ø¥Ÿ|é¬{2•ÒÀf†šDÌ\'ÉáÉˆø1M=+\0¸¿,W,/–ˆTõ+Zän®Éªñ\rYŞ%,Ö´x uŠ;\0/œq¤t‹ä‘´ÆVÜ˜|¨Ó±-+Ã~»×’ÌòÜ:4R«:`Db·ß`8ŞÖ³i›ŞWoİ·;şş=S›-H{g¿ÎGÒÈaˆe†:‚“}Ãè÷„JéYLbç¨ÒqC\'µØ^ÑL=¬å}t\r]añù	±×Á^$y6o¦h³Ñ«ˆË	²ÂJV\"M3v¶œ_½¦\'ÓĞ¤Ö=$Ü7¯¸xr2òåß¿4^â`%°ãRp¤;RK³\Z®„°\rÂ„ïÊ\r]`a¿{EB”Iro±äE3ØA Ô½\"&±‘ÿÍ½ ^µzÉêEäÙÏ•Ó.ÑÑÆ¤Ş|‡‰’ÔíÜ2q››	Øàªù×¦HĞ\"Û>k3ëŸÉÄPô]IrT·õ~î?ş(5QD•3GrÖš\n19Êì¹İqFS?RåÒıÒj]ŞvÜİjøÈn~Ü}k\'\rF+\\»ôp[ŠÀ€Øù¾\n¶éPC#2‰G=Úè&ith˜ÆMow3¬÷g[ów¡lÖîIÛåÉI:èİ~ÿ•sáe|•Y·iõ+l\náÔT5ß¬¦7Ã>41F1×ëñu\rîBü|\'¶_q<¯„Æ|R\ZlI¶ƒ3XônÜ“”£/¢Dõ¼zü(´-\r\n\"°ënEÂ¸.®5È®eJ÷z×‹qïºc£Ï°|ßêÜşC õÔ\" _¶/æçÁ.„;t+º¥öé}š\'¡‚å0üêBjVïÁí‰¸¹ÄÆ©_¦.\0ì|yÓ%ÔØıİwœİóæv=Ÿo¶Y–5Éhº›ÊêCµ@¥ToT±à÷‰ÅQÚ»[à®>Æ¨î5×Q;Uˆ¶r?©ı|ÃJİbun1Ö„l\'ÑCâœ<“‰èá@Ÿ•¾¢OJ¡s•8ˆ³jÓz‡â|ÁyV1µ®qëÛì0të‰˜Œ1æ’É¼n»–Ò\\¢–jSÔRj\nØÂ‰0¦¤‚/Ó¤£ièi¸2Bg~]´G°G‡¸g)é†’n0é¦ãp¨.á±YI·irıéäºsĞÜ|:¹é<-Ú¶Ğ§öƒãÌR¹§W×ÀyTÕ;ô½‹-XšXk²èÒFg©YW rGBe‡ŞÓÎFyIêm!A›\\\'RÛp¡Ò5İ,j+š^PÄ;¦‡ô”ÚIMNz\'X;®u+B	`K8ó”pæ+uŸÃ²NqF\ZòF;:]Y÷Í‹Ãşâ0_õG¹Ûw¿r†Ğç?[ó€`»|ki]Hçv†Ìbíçîlô¾ÉÍ$Á-RTòÄÌ&T÷Eª²ÛØ#ÕF_Şß£û1äªp9IÅå½Œäº˜¤\Z«“U0‡)úh\\´•¢m+2„„‹Õ¶óvÉ0sQ¨ş\"¶˜tEtJ­(àĞe¿J”\0J8‡è6\na\'Y\ZLPœ-\'JF~˜«Õp´Î×ëùUÑêõn¢Ş=-‚.(UÄĞPxĞ®tì1©<—ÍNe3_±šÍ5Hs¤q\"pÃåÖ:¬ÅËeúR1 ×Şö™™,˜ÈîÑÈ8(	U\rñü¾§€º÷Ó=ƒòÂ×Õà ÓRZ3évËı\"¥z›¬-=)¢Éwl©îVÍ[&¸íØæöèBQ{\0å¼NOÑœ±\r1j8vi>Sd`Ìq¥ğş~`©\'©À,can‚üè™$«É£Æ2îDš;\r¼#?¬ÊÅhu¸–®WÛE8›)¦ˆ#:¥)Õ¼‡¨¢f`‹	îY¨W$UÛÌs˜xÖİXÆ—Í}™ë-B³œnßÒö„q(“rè°9ô#µºãùT%\'ÔÑâøV¼öùŒXŒğÍÀô3òÛ‰_¡ÚE‹o5½ëœŠíÈ¿ªfä1¾´Í]c4HÓ»¸tMÁ¨°T7ud9m5ØÁ0ß›ÊN¢EVEW‹\r	¯QwÓ™A÷|%ŒÕÛÔWÜŒà³ÃCüxA´ûİ£íIàİ,…ï~™Ól³.ešîÚ-mËH\0ZºÒ/x	ğò	­¦¿K¤}T® ôãKznİ£¤ÇŠUËA\0¸ı>@>»í*ÒĞïîXçÊÕxC&¶>Hë\Z OC€È>|$tĞ*xZuÛÉ•ë!ª‡cŠà«ğsšÃ¡“â=‡Coà˜£˜š“\\_¾Û‰ª	¢ZxGÃ£ä5æC‹´¥Ä§/T–Qİ H;Ep\\»tÇ¼-Ëét´À1RJBr\n&ÕÙJĞ1æW÷¬š–ëeYŠãõú¼xà{ØhZºrèW\Z“v_#EÓ|šÁZ\r3W±ÖEö²\0×ÏWF“w›Õú{/C\ZãT/Ğn-C–ÒÁÌ8äW¿íR¾:êvŒNF`mÆb»Y‘”)Úe…‰¡1ºnæL)ºé†y)µÓ|¶`››U×hn3…	=	—ÓwHe”8Ñ£œ¿;?I|º/ÜD`âî—Ô@½ÇbaYrÔÔ.`MØT†Ä.Àªzk5oœ‡Ü&è‰?Î/Ğâ(”¨ßˆYÂf—“j=¼Â8¨ÙŒdÑ™O&ğA`ƒ„­µ+7qEñ¢‘wE°…Ë\rwjAÙõVÔ-1Ú^¶U–zçpuqueÿ`Å»gĞ;éÒExñco3Ísš lqÖó.J¼ÎOÙ01şa%ÙX˜v;¬ÛPJxÕQzïá\"Û­Ÿk\nëçÿ¸yü­\'Æ¹rşµóâÂHî˜€-Ï\0~´Ã²š\ZE_rÃ#‰öØq Y|åq*Æ4ìñ^}\n-C³#&QOci\0u+	WÌ€I—î½xø®>Ä‹n*¼¸õÛAŸÍ=ÊàËoZƒ5BR/É4Ö|š_å¢ftäkHúóºš®¼NTÀ)}pu ÁCÙÿõŒ]Ş…•ÏMå_°HÛÍTs+¾`N`…Ëš\nW–L<¸R»\rƒF€x)y_×óá´š•«öø¥5ù„tÒÈ‡y9@ÿ¤»Çõ[Ô\"uÎ-Šc(Ë!]Ç¨¦=…™ã`]m„áW\'Ç‡\'ZêÂ_K­Œ¼áB±b|qÀ¿¬›³Ş»y5ÓŞ¤’ÆÁxù¼á™c÷ì9-¾èeª‰İËäÖXöá‹J¼İ…ú$çˆY;àíé|:Éúã²O?%ÁÙİ{í´Ø¤Œ²ëu\0P­GÓjxôÈ‚à\"dÆ@P–—‘>\n¨AµÈ|ŒHØ£ÿ¼X¯«¯úªŞ\Z7DÕË[®ÕAÖºkeì\r+kœ8Œ©•Î©•?ÿò=ö	+´©Ë¤õy uÃ~âº|ü_v¼WóÙ.øãÒOÜ%†¼Zw7Ó¬$Ì1á¢eâ3H3:_e­Öï[YştIgvî%ê*ç¶Pıã|Ù>·Ûâ„—T|¾Ê\0îÛ\"õT—Ï¨ßc<Šú²3ïî2Øqåh|ÑjÿûÙ\Z­Z =ÏÖíÛY«õa¾¼^UpK›B¿8gğv¶ÍDóqBğŸEª7YĞaSú û¯ÿú¯·³Lû	_µş}3_—ğ£/»üaSöïXsÒzCk÷ÀIÛ1cä†‚±›~¦Fl íÙ\nb¶G3|aÜ­5yU^tçY_}İÂ\"œM1rÄ£«°é®àîû8hæ{Ö¨iùzİÁ\0ÏyÆz~à=ÀÔèx¶Şú<B¥é|3én#ÑY¼U>âl6¨¦Î&A™ã·{›` Í1,§K½H&¦å\r»-İsü–²ï¯\Z\\ó8>¯š!\nv¥|¶Íù©¸_o€ğårıM‰N¹ºÜÛ5W¶M‘rò4¢,äXAÑfóEêê~I;`rÅá‘NÉ ¸Ñ<¼Óz¨y3‰Ú†Oà%Eˆfø^Ïr®–cÎ®ÖÈ+`À©0€¼‡¦¸\0Yô‰éZ†rÑ«°§d½>Qîu¢\\+TíÔÌüÜ ÖI¸èŞ2… oq7õÙîC^‚`/\0¾ò^QDö1É)©+ä*^‰>®SÄ\rëğ¹ ¾]É´š®Õ#ÅnøˆÁ´F‡á÷´vHcÑÆS¦æûûÛ¥¸+²¥rB)-.•ç»hóZÈòr\n3tæ5¿Ö®«2!qC;“Á–(ÈÛÉ.¢&ª²¯©ğ†Q´	ht@¼ÌÓÕ/1ºtPÕ-GèÁ7`7mˆ\Zçé=¨Qï¿cÜ^ïmX½ÒÂd+øš´)`ÔjÅ`ÂìA¥¾˜M\\Lf~Xåpæ÷Ë­x¸·lõƒzû·\\	Ş‹{5;×ó2_¢öCGì˜2~·À.ÓÆÎjÅı„˜wk”ò<Ğ÷›ù‚uªæ¾–äÔÆã{A-wÎ[TJÜÿñ9|_Øé;Ìe;ÄY„SıËß»{¦o³x¯ñ¾€S\0Œj³‰~<ƒw{:\0®U\"=ôVlg‘ìçêºœù/gèrsÕ¼ÂÉÉ\"Kïpx\nØ‰Ø€(®ÍĞÍãÃÃSµÍDÿ·„é!‘¢³uì¤ãª„ªã•–‚¤€‹¡N»Ï|›c¿sîy‰Î©´nğ;è=•úèà‡SĞºŒZÔ09ïË%/ÿQ¨„Yä‚†3²¥vĞy|µ¯+¹’¦TïúÀî |	²oâ\r¦‚ßtşÎ3’.ÅyfM\Z€aVÌ[¹QÔîöº¯‚!µ}ã½ën0ÜN~ãKŞ%o‚’7-QĞ²ëî}€}Á\ZÜmİYüÏ^nÿ-\\şÌW„d õëzWJ¹#„òñÏîn)Øà77ëR‚æğ•£œ˜¤åèv„Hqtt>F3tæÅIú×§üù——.ÊÃ¬´MÊbˆÆü]ÂC½÷{?øvpâ¢w|±™]jÈŸj…¾#®Ô1>œıÆàİcã§Ú¤p	!¨ÒßÎ«8]«0¨„«qî˜]¡oQÈÀß5=2.*éPZÁ9jL_=eSdáã±J)ìp]ÿõš©§øß–	SÛqàLÍI«ÑÈÎë#‹ââH5*úK‰ï’@sëuÜ<¬ÜÌs¡¶sP¸™®S.USó„g–Ÿ%39†³|<È¥Ó\\\0KW“gR:-]²ÇÑø–ß\r5}u‹Rñ*%JÂbÚr/„5J>‘(+­wÈÈ?ßDÒ.ÄCqNõµ–9%TOFI…°µ\0,,Åk,\'\"5ÊW>\0,Å¤pûô——m ÆÙ·Ù&½|—2Uwr¼ÖË9š_Â¡~œñ&iéJ·ÚYÎ\Z”ìÄùò:]fâhı\\á;\'ƒôH½\r¯ÜïóßH£K¸o¤XD+|‰6b¢YÇ0u”ßª)š!ì\ZX•*ö›û\r\'€»¯ŠV÷W?âìkN‚}×úÄ¯>ç û¤×ëeì­mˆw‹iæ{6ÜmqF¶öoÔœÆCº¦o[ ¿q1î	¶]Òrèæíçr9hÏÜ-™İweğ˜~Í\nÔÂBC\nŸ‰]\Zğ§®Mwtn‰ßÎèıŞgŞşÈRw-ÇxæçHËÇÙ˜ÎJµud\rç3ÄAÏ°ò}ˆeœ¯ß(ÒCrâ’t®6ÿA”~M„:MìÂ£=CŞÑáá§µì²ÿ\'ó}Ô…û•[Ÿ±Ò\"Ù‘p;€íşşìiA¡0og¬SC~Û³G¤›~VèlUgÿúM–g?à?ÿ†ÿË“¯Nt`3Z¤UÂ­¸ø…!¥$4EG[²~*p¤(	òŒïs¨ùõl‚fÎîU«×O‚]Ùëiäd‹p(¯ÛŞÄVµaL’‚BurØ®	D–V¢eæ9°š^ V¹ÖÙ`3•!77õĞ¨úe‰¾¶;Ö©ëÎ—“İ3+íû¸å³Q]!P–úÑAí‚ŸçÓj|£ùï]\n{ÑÄ}üæMïæpT¸ I\nİP†•|*Ál¿M7#±f\Z€Ü@¼¦İä´ˆC=\ZïEÈvMÈpÁF\rn…ùÁbÊ%¥,¸lê×\\‰_Ó+ziØÙ+*ñ+zõ¡šNõ¾øĞ^E»ãß6¹üìĞiç1C~æÁK›@qŒõ°nÛ¢8ÜßßwªÜŞ–Õ\0ãÒ²Uº¢Á÷)rÅ“td† ?!ƒ>Ñ€¶ñÑËÜB³¸aş}S.o~F•Ùvv‘åX•5 r”v×È\rÖr¾´ñ‰Y¤_¹n0‡Qã÷9ò«y	¡w\\Rs­»¦`„64ªNP©fD-`j]¬6.ÀÚŒZ\n‰za?îî˜Îß£ğø¾„İ%,Xl×Ûè*®±\Zy¦’7:iÑMHıÁ%¨t^K‰ì¼|!`$eéÛa§²!0¤MÀ<%	Ê*°zòïPè8†3)ˆC>s2\Z	TòË|¾ãz¹Ïp„ÖÈB±ª„{ßŸ—Ó>ê£§¸GÚÈ£,â_hƒD_“)P£”Á·-B	¨Ú±Æ\rdàÕ”Îz4®üµëåÇAp£C‘OŠÂĞaz|vEÕË¢ˆÇcö56\"ÎÓ¹A3ÁBÂ,ıâT9)JŒºk—H08µ˜CÜÂ1–8éq’àTRm.¦I~p÷ŒË4ÈMà —Ñ+,fìµQ…/µ\rc°OÙ4‰ñ,¸}¹+ Ã<\rH^|kCèè\nTÂü\'0.è\"C}ˆúåÍ…°’ê¢Á7A‚Ãa¹ZSşÀ:ª ÒAÃ»ÏœÕ3	¶X]î´´ŒÄëª)¯†Àm¡E9~]‹Ş5Ù–_Ìz×œÛyÚFù÷ûŞ5,Ëuá>º3„S^¦¨~©7š\Zm Ò__Ğ5¸­…:OP0~Ku&ğ_SİÕ|ƒu·ñ’\\³º¿IÆ·Á1¨…¾Lct}ç±Is¼óÔkˆÇ“tÄ+F‹Mìû&§]î²US§„÷¾‡€)mU3èY“Ÿ%\\÷C‰ÉDTœ 9µûŒ]T}ŸŸ‘à‹*Üâ«ƒì$Ë]#8\r3¹]I€¯™ák\";•Ğ©›WrÕnbd\'êb½c’Å_n‘äØÀ¸°ä(n@zs—„Yû¦òdfu/ëaâ²ø>ÄGÒx¦IÄÃ¦;¬b~Ã¨o˜‚¬æA	41¿Ö¨/hÏ-@‚¦Ç™0<W­ƒâçC¤\ruJ1”Âa_½¡¨ÖgGHõäš2&ÕUØú2ØoSÙ“hÊHVöe<¹Åbê¿61jÎönjjŸedO5nÈ\ZŞÏ×~¢]t„¸¡Šó¦}³»+šú¶tîë©¯~ı„Í¹*æ¥ø55w½€#æaİ¸~êÌÂ<ßÒÏçuçn68ÙÌøNœ©9VÂH`÷¦`&–ï^ŸşR—×¤\n¿^\\/ÚYûøíÛÉÉíQşÙ¶ƒ>˜a›B¹7óï œ‰Î¾ÌG«áh¹I°k(×¨%L\n¾Â@³ÔZO›èˆâÅuq|˜åÑ-ÀÂ«ÄRxç‘ ;ÌÚPó˜’Oº‡8c_³ÅÑ—ŒƒXtç;ì¹’híÑWĞN?û}v\0åâLaáá³>Şÿ<şıÉ-ôi‹ÿ€¼í4ışÉ¯ßÌ9?İ58ĞÄlhdÃ”aW=á¨NÉiå¸v/ã…Dç<òè+ø:€ÿúğ_ó’š	h£ŸÁ?íì\0şÅ89u€oÿfƒÆ«#(}ÜtK¨ˆ¯‰ü{Vcè}Ù~Á\\A—AcÈ8çåÛ¿õ|äÇ+œ-Vı/ó#)ê¹EÿÅáa®Æê´%¤š„›_;ÀµGÿõ\\î’3¸`ñ/t–)?YÑCthdª\07ïåûÑÔé,Ã°ßdêdb8|şâ/Ã¡¼¢Júúb9ÿĞBÔã×¯ì¯£u‹XÈUk2oİÌ7­£Ù\ZC·f NùUÆdÇ	êuV;Màd:vÁó!¤u8C\ZàÿuT­ã“\'Æå™ã/Ç$Át{¥I` ä1&ˆ3 3æõ<•qD|Ó£1n5@ÁœN\0ËnÚymŸ©O~óÆ²šåüWÊİ˜g„@åëyMÙ¸ËÆ“—2_Ñô9Åùfæ;„·¾(MÔqü!ÎÛ0â_×½UÙxA°\r,§<?Û³µí†×7)–iJÆ¼÷è2ó„¡ÊñË\rv„gT¹¾>É„æà?ò\rØ³ËoVh3zÉfÅv:Ùõ‡ëe9ëäæ‘	¯Éî™ìÛ¾c)P*ÌÁ ég|;ƒø~(Z“·…ù‡\'¦³î‘Ö=¯w¼‚Ô¸uèšÒ´Itƒøé	¦ ­&‘÷Œ¶/¬ˆ+“ÇŸ‘zĞ¢8d²ë‚İ­æŸÙã\0Ñì“2¯‹\0Jc-U«¯ñ4£dÿ@‰_á™ÉÁÅªÊ1v™K®ç*©¤.‹SÏI9…ûÍzŞ%ÔµÂóàøê´İtæÔaª˜\'ĞÄ¿ÄÖDæ®FŞY²P#´v%¬iC}…Ø<y¾\0~¾«õM†°pğ`Ìó€¨$°ı×$øÛO…j©ÈFÓÅÅ¨-0‹ì€\00_ÁXÉª¥’O¹øş+Hû»&r/¾B¹„_IB–\"’Ç~DPZYÚ³‘¿Èi˜;±ú´ÌB€oÿæØ“@mC Ë;ã­Œ¤/ ¾Böõ¤|”P`ó‹êü‚ÂÖ[¥q’ù² ïî²ßŸıi2Éë\n½§k_|0D:ãúÇ4\'˜wÇ0S}ô§–ïØ:?ÍÇ¹†´ÆŸ®MNñ¸ƒ’åºãG?mÓV\ZÏWüãç—X·Ó=ê¸ú/g	x¨…i‹+ØOL€õ©~ô¸Ó9;°?mÖ·%p¡r.B-§£`K\rj>Ê\n=³¸S:\Z4\\·O?‹íOçvQL>=ì}Æß£ÎíÃ²Ñş¦›÷çqÜÁÌñ`U,}®ˆ\r¿Û?•nvøÇ»?~4òvĞ#ÎXÀ9õ8ï~ºîø¶×ŸNº«Î§Î£…Nã) Ì8µ¾n\\OÚG÷şøEÇàFû½/¾|üÅ§khÁ8\'íÇ…ÛënÑ>ê}!>]â¸¾+Ğ\0áqïq\0â_>3@\Zë|UúÓçZm[»ôàCâ9>~OO)õçUu^MsöÁ \';¦ô¯¥ÎÕÅİ]  —lÜ­‹â?Nşe¾±ÀS÷0Á ÍgäÎëaâ´d}Ìo¨x®ûØÊ¡{§†®ã‘Ğä[b±,W«]Õ¡¸îF;©&ßÏéıUfSş½º˜o¦Vû#RÁÏgä[Ø;üxNZGøë5»|„_]îÌÁ\rúˆfâ+1ÏãëãxD-ıMË+—ÏôÕ¨/1†V/áLŸUë’M8¸¬½É.ıK©zµ’Og9éÛKŠğ’Ìªİ~~1_­ƒnq’×šgÖÛğf¹š/›kµ&ş´d“øéÇİ¯QÀp<Ïô÷üìlå:‡¶r+[Ë\'¸şaÒ\Z_ùFi˜êpÓÃî’Ÿt¡µãuÅ5î¤ls;)…äÕUÖÓ ¢–-¨»»¾ŠÚ¦Ö1ğãayÕi·LA¯4”Ó*|Ÿ$}9*•m;6£©l¦)l{–lŠ^-kv\nÿJ(ãªâî]iL{ÕÀgxådHQô\\Sw‚õ’1Sé¥‡Ÿ¹;·Š¸s³úù®4ßp]ÙP‹_¸K´E‡?º_ÃŒç¤–¦²FQ=\"Î?±Ä¾:Me®ÎŸY™­¯~¥µM¼or¦0üÎQ¡	¬\'NøM1³AôšO­íïóßŞ¬¼^¿æ–üêqÍĞ\"Şö1(íõ=…)õıóó.õÂAÿƒWnªAÚœÆ—)úæä\0İeä@8çv>î™í]åz®¡v§ßúqŞŠéxP}Dj„µ˜£ä\"aµ‘ÕWqtfÁf½Æ!qäàq«0´®\ZXNR	D0>íÍ„¹Ø\0GBû”ÅD¨áãxü€õ‹÷\"mŒ+‹òú)Z’=ûÏì=T¤­Ò!Q\Z Ğ\"÷°˜áÎTÆá\'•“ûDLó™/me\'îôñ.‘í\"×‰€,µÉ ¿!»¦]ã¢‰¸g>âŞx¤©>Î®!¯·Í‘È±mŸÂöâİ;Ò<t¤zA…B·püÀÆ7mR1Aì,È	&ıäù\'Ñ*>xIÌÆáV?\r’R÷LÁîwélR\\möçFP¤4ıÎŒG.5Ú¤Cu¨~ô# /ÚåF5ª¢hà<ˆâÙ¸ıë Ø#ú—õsˆ-ò¯Ã‚jÄ©B6¯t›í>¹Bï:çWRù¼awbóùt]-Ğ©ò¥JPu[†¬lD	d $KÁ»ÑçM\"‡),ª–4õaNäŠ:ùª§µ›”’<ú³/#iP cZßÕÈoú•˜¿Öv‡+ÔéİÀ¥yÕè½…îğ6½\n’Lüø%—\nÇ;Æ—áÉ|6\Z_ÄìZı§íH<†Ùµ‰KĞC=´w¢çÃàƒ~sNÄ¾¸eÇ[¯Q²+LZó1#Â»ÇÍà·†SÇğã	y*P×X[6ª¬AÿXßÅ÷&ì¯¦ĞÄ§B\0\Z,1fÓá`9éùòL\0«•L±p›(hí]?- Æ5°?½úyCkIOŠ6æ\0¤ëåsÊ\r¦Ü`·<âÍ\ZøùñŞ#\r-di\0‘5®DŞÌ²Üt/&c‚¢…Yp‹×®€eWõ²@†–‘5GNtÎxd+¸Õ™²W.ĞW{bÆeÙ“5<¿[uìŸ°¦£Š»ê>ËÅ±=,|~mo™îÅŒij¬»gÈqé~d¡ŞŸ²ÃAï¸ËBî#²Ô®½br{½xø®t÷»Å°htB†§ƒÚeç’w½¬ÎÏá]ã¨„t‡ÜVâLûÉg<-hzE;Ó¢­ƒGÅ t,î´”L•¢ğùuqk…0»G\'ûûá7µba$ÑÌ½ĞrûûAüIL÷¥!AÕ†ÂYÒF\Zâ¸«—ìŠU\rŠç\"Ì‹ïÄzcxL\nóeä–ºU9QÌğXQ:%G\rŠÄ^#\"}»ÙKõ¡~\rqİy¦ö=±qv©5\',¼¬>b`ëÚõ±B*¹öH”¿I–¿é¢\"s‡0Õà“ÉÔ¦~„G¬@¼Á‘u\0\nodw\Zšªš™ô^ö Àíx{ÒEĞ”áÜádÏ$-4_Á„–²¿‚¯İí/9©jm§].\0ñ¬wañÇ\rş8(,¯ß»±W£F¾Ğ»–±Ü~&rbÿ \0Òué©cQ¾¶ù˜ymp5šïìü²3Â©®¬6‘ZlpÑ¦ã%ÙîØø)k«Óàİù\\Å€ØµL«L@€’úş”Ôqa€0@Ú8éÍÇC\ZŒ“÷gS€\rpµ‰àöØ[«mlÆâÔÈU·ÆâÒ(ÎD¿FÛí˜^ªóÙ|‰aÔæ¿ÿ»øòsæ*U8˜ÌNèL¶¬Í¶/ÈxJé1]Ú»µJª:®v-\\×!<ª•ªå©™ëz3ä6ª×<Ç2x_ÀO™kÖ¤:ş\'SLb§©æ}¼ïãÆüN+ÍQ€^´Y½°´ Íï7KšË\0ô‚%Ã4¦0VÆß­¦³Š$ÄY¥ôÖ¬¬..SÉVÈnÎ\n7¨¬•x†Îtç„÷!Ç”­/©£Exa^MNÄÃÒ\næ0?ìøXµ*#q-ù»A,a±¯ƒF¸b¹Êìù\\—Î¡çù>â³ã&øeQós;v{S´Uô	ÒÔ¢Ç†âüŠµ`µ¡~Õ¿~[m¸ë§.°â“¶ù N©ÿ± ÑGÌPqÙfÖ 0s»± ÌñÍîW@¹Ì ÆÛëŸ»Û‚ş­.J9J@¤j”8äÅÀ½ˆ7}OØ¾I=\rÊ›Öóğ€÷“µ<:ª`y€ñóÑZî¶{‘0]yo#]ŸD”ò¼’¥+Y—ËCMbLàZ2[G?mSåG(Ä§ÙÀß`÷6pVlöŠ‰Sğ^C~®œoòÌèYÎMñÍdu\'{Å¦¹î$¨Ûµ•§PyºW,›+Oµ2a³•‘]ZîÓæÊË°²o\ZucµpMÓ©Õkk^óp²Œ¤‘iNí\ZcGxÛÏœ1(DÿP\nÀ¥E™¬j}~ëQ%Gì›»Ç½!s5_¨Èğw—3»7]ê“§<í®´´i¢.F«×˜å»š›ò¬O¿‡)ª`éÊkçN‰´nÁÓÌ‚ÏŞS7Ó^0`æ\nucõ9ğ>ÖiKıµDà×¿Z	íŒe_qöñàÀË9¥ 5º˜ş’N\r4“ëß¦óôÇİ¯7¿‡/¦©ÇbŞo¹´VµjÍæëWã—bˆ“D°ãi…¥¸Ó;ãwáz¦>ÈAÅñqf«¢Ÿşì$—\Z–<J}ÈNNj¦™ş=ù6>èúğÙ†,Gv¥òLÜ3A“½²vÜ—rdãœ+uŞX=©£C‘oF}_Í.SoÑÉp\r[ç_%jØ8rzÄah°aU vÎ(ŒFì$œ””©mD§æ2,k¡ß&Úú9¤dø±mˆL!¼‰„Uc—RT‡¹´ÑU7\"BlÛZX\\°>º¤‰Ïe@ú¡¤™NÅÏwú\\öh4èz–á1a|HD%­—‡\04¬R25^Ì]ûm›»óé¤¶Ü*ÿ.ˆ³AyıËJŒT˜ë.şó÷r²^t0X­†ÕdRzÕ—ÕEáaX·euá%ø%Â9)2Şİì\0\rP”BkMæç,\0Â5<C]óay=.V†*N·BÈ®ã‹NG#ô#î/±£É¦­M?9‡ªÇ£éõÜ;6…©àòÙ|à\'Lÿ†m¾ŒÂ`¢ôW&rà+ã÷\nFT’¼ÎYc 3Kzª„÷Ş	]omô{q1êÚ»ƒqáƒ†(DïŸ²ò¼Àcjb;hB½ç:yØ†Úˆo(ÊM¡øòÅ‰áç%`uµ¾i?fK‘‹gZƒU‘!Ù9ªBêº€İZn0„ƒëøIànû\Z«£…DZ³—_J~%Ñ0t)á0˜ékÀ“z+¾šda s8Õ‚£lŒ¶’Z8ßD´f0¶Dh	âH8•X˜d<ô<ó¡zK¢Ol¡v\ZÂëI_Gô“fwT»±Òbº9Të;©ñ‘ı¤ç;ü_ÁìÎÀR5=mÿ­¼9–“×N}³ngÿ/LcßZ°\Z-êx‹c­®ZòneK1½—5¯¥G·¼	İ:€ç¸¨Ë¤¯²MEn1ñöŞ…­´y°²Uw„ƒIÔ£cˆØülPå#™S*JÚ;ˆ½U°-Œú_ºm×p\næ¹”ú2ÚÇ´_YÆæ³àV6kÇføÇGÑa.òcX`~<¯¼×†x9\'sÀÙ²\\ Ÿ¸„Œ]ª#;(µ*Úöëîîø¤ƒ1‡à0sÇ¤{‡c|ì,‚¯»»[O:‹HŠDmØ&AëÇ;¾Ï–0¶ÒêëïËòf¥/IèÇ7Kİ­_ÿ|N9à&>jèĞÇ’üê?éÈ¹ã’8n@ÇöîmfLÈ1öîØ\0:9)\"À·$tâ>Ê\0dPÜUü¿™È\0©ùK²İèÜâì©bÜ¤o:¤Ân ²$A\nÎ¸¨¾KİÎ 6¶Bª±ŒƒšÔ•Ä•¡¯Vïòêá«<ş>Bø²üÿö¡Ô«×?ıØã*ÕÙ\rê4ßN¨Ù¥ ®åÓé°›“«: ë–ª5O7NÇ(|!Ï€Ã5fŠS$ëµïµ‰µYJœm1ãË“â½¤HL?‰DDeå~6C£ìbmR´aİ‘~óÆ TkÄ¦¹÷7n‡¹¶\rÆ#\"aÙñ€ÍÕ·ÆêÑww‡jíú±AÛqj2kg!ëp$Qí‹ #\nÒÃNÊ”ÔŒø¾/Gp&Zï%óÙ7%œj¥æ@‚<ˆ|³´V(ÑğHzôj¡ÃĞôĞÃé¹ô,N))*PM2Â_bÑ5\\¡·Û-ÿ Ëã“ØkH¸ˆ\\Ÿ×Oú—gœBÜÁˆ^$l²y;t×\"ß§!uyyä#+>7—LcáC•s’ŸÍ§°ó-»’\Z&æö;}\rwjô6-èzjVv@ÔFÛ¿Ì²—7¬‚>$õWqtà–ı\0\0A™_µ;Ÿ’OEú)ö§¸!ôz”ÄĞajbƒY$÷>¨!ir7‚¬Ï—åH‹%ŞG¨d¶W5}\nÙl÷DiJOı`ÍĞ3—¨ò\r×Í‹ºØ‰·f\\â0ÍeşEØ>p%x×Vİ‹Z÷’´„3{ŒeùıÈ½E´t»Ô#&ˆåjEX•Æ@ôÑ\'T’¾<íÃ]9Nâéú\Zı‰¤ÄûLñ—¬2V¬øpx\\ûNõåo¾™UïïFWÄÕm ƒÔim–´D,Çn¸u\\F¤°­sƒ{š–æÂÄ.+–Å±b`ŞnÔí}‰xs\"lL?{HAÚ¸_£FÇ»¦\'\\±Hµpn©ì°˜	\nüGƒ cw%Ö¬’[\r.t|Hç\\Nûª–yD™ÑQ‰{àNj¦ñÆN\rŠEïÉqÑP›~|]KLò4K¿Œ>ˆ‘W9=æÆ?YĞ\Z—€œ¿ìU‚í ©5Å×ù]óúŒîš´¶K\'Jç¾záF´éÜ’¶J3ÊûRù}¼–ßEóÚ·=	¹©ôñ¬ory­a¿*»’ğÎJjİCP‚Q\Z\"ÄR™Ú@–`?€h~5íš;0^Ô]K›ùZÜcçòÕ§!çÄw\\W‰6æª½íã?Á¡D‡GaÃÂ°‘ObèbfyˆV–u_-O_ãë\\ƒŸ|fWZ%Ô?D‰ï/åttS’çâ×¡h!0Á—…\r½ €À¦X\'\0+êX÷Óç\\xP2Ğ|†µ5i‚İù3’1À©ùlæÂîÍ¡w,ÃŸ¹)ˆ£tøùw‰D/®®Si¥0[ $\\Ş°ù\"iŠ‰9µâ2Ké\ZnoG•h\ZÓU(‹¯m³Ib·zÿh4ÁÎ\'ƒ&‡½ş8İò‚¥M÷@óL²)…ïD¹ÌGı¹ÁÚºö¥,¤ò¨ÇŒ§³‡övÌLÌP½Ù:(rëat\ZDˆø\'Ù³‚=ĞĞ9Š{-š™µù&Åk!b¬4ó·ûÌì³¨Uªiæ…ìF m¯¶‚İîÙğtà©êä³¨S¯{ôA3ß˜óéãAs-ç·±Hş1¡²¡D\ZZ×B˜ŒV$ïV7³qw1š•ÓÄ{(iÆb^aßã(™éG/ô%–ö¾Èü£¸øøK¢÷èUß	Ó}è\nıU.@¿RØ§ä®ë/Ÿk®IªGe×XHö‘½ˆİ\n¯\"™$Ñ½Ñ×N\në¤fx=:­ÍïnÙ~¢.şÚˆ¤ªøÏä:–÷7ÁBNöÚy¨¶RúT\r&Áè;Ø!œËÌz3P¨¼Ò×ÕÕxy#†èí¤¹SA„pŸ¾*–!Cc~\\À™ìâÓD—£X—“,Gx6›BR}j;åß#½)ÇX¼\nÈ Z•‰4‹ÉË³f$­ü»†à	dp­¯;3¼¦ s V­–_¸sè\'¿‚ğj)xXT\n»n7(ÉbG—åDù\nR7ƒˆI½òóh\rs<û¶Àå4-c35m6dİ°<ß*½a5«ßğ\r×ÄC£B‰Vª†”_ï©Ô£D¸ =à“—y}Ñ¤¢„7* ¯èb‘Ø “WIQi	ÀºD±ªèlh¹v‚¢¾¹o­ÆØƒ>ş““¼a«Í¸Å$F;œi–XK~šŒ(ªü7¬Ãtë.L8‰£Ãˆõ3ôhkÃu$±²t%¶ì“´5­Ò,	SPY½¾]È´\ræÁIîyã½øÇçğ5lTÔÕÑ˜?Y–gÅˆÈY©~ÜİÑŸÚ³\Z2+œ¢È~m@­95Kü3•SŸìËÒdÄøJêĞ¨ÿ†ò˜ãB`›tAJû×Ûı}I‚½67Z¿ƒÊzå„­ñ“\'t£jrS­Ğí}Ñ·ÂŠ ‘ÍGºGµ—9©môüt5§ ÆÑ¶\"ßµñ&ÒÂôZfT¬ ş ¶éeOD»ú¾]0¿³E$S{&FÒsq”&&òŒœ\0HT’Ú(·Ã¡í6’7öm³ƒÒ)mûiøšÜdÛå½„!€3Ğ±èR\rº«<–\' §{É£L_99eFj¢SVø§z¤Toãë*Ô©®Êåûòşa\n‰/‚–BÂ÷.(zNÉ|:‰Uì{ãe	T]_˜I±bG·^Ê3±‹Q›€6ò•\\€™l;Î“*;õR¯‰ËSÜ€ƒ£\\eS\ráoMxÁşî‰ÌMQ8Â‚Ìº} -é p9~MhÑ7(âÎmA… áXWm“É¢-9@D6318C•‰ÕHÜ+¿…ÿyw§«L¶‘ê6óDz6”N²R8¸{{p‡¬àSöB&Aw¤/PÓ™ ŞÀ<ìëBÔ6a@oá–¤‚_CÄölKlı\Zëë‰é<í˜}R’JÄMxWš:iiå$;pn‘²? \Zt5Á“ä&dãjgr$ÿ¼§ïmy~9`’¾ “® iØ•8bJ¤£))×ä4œjÒ\n;¦^z1½ƒÒWõ‹;z\n~P¦Zßt?Œ–3¶PlÒårÚÏ¤)åÛîÁP\'İ9›øÑ„0g\rH¥ *–<‹vÌu—â¤c\0CİuV¬ÍÜåˆBÔ¢ªr„ıEdsËÍY1ãk­W=Ó\Z.h[”œy2Ñ˜%ªº:7’£Sd4éKáÃÔ\"7“¿ 4-ŠrüWîÄ3j”Xu­×ó´8w—Š]¿»ki02WIÇæxtµë?›ò–é\'¹ÕYCn¾»…ú”–g€ªÙã2)\\9ov3±‰‘k“vÄ˜ZÂ¢&üük5a²ïı­§Ì{¥€Ÿ+ ®üŒû?Ëí5„çôµ5ˆîV9vx/#õòZqf±Ş‹{ˆ‡uBKgÛ\\YÓA²U¿×™véµÃ—‰P–SYpı°qÙÌùÂƒ´‡UD„Ûæ¶A7¢Å²¬ÉO;<gËó]nÃÕãy\r4ğ@ ï6Wâ{ü®ÚÑÃé²æ«]W#(´£I*Pë¸ üı¾ÖÅEiªÏÌgÕüÊÿæáÿ1ŸîÂ”î¨Ì%:æM>\'›üÍˆcÊX=OOjÔ¥y%j’M¹ÂæŞgª…n2¯Û+È³ÀfÉºÙ.¯£\0NäGu?6”	ÿèK	œ0xYÿçÓŠk>n¨ù*tñI‰Áµ\'{×İÉQïºIÙl1–ôÅ³úE<üˆi}ØÑ:zìº‚×ónİÌëNåÑªê9R‡òLeÔ=>¿Ù—úc{× 	£‰ˆw~Õ şzÅƒˆd©æ\rÙÑr\'èwì\ZUŠŠåeçS€3+¯ÍËQƒ%‚ñTàîËÕnşì}‡t6WC”Â¢¨Ã\'æM˜Kf;Ûº1Äì2ÏN§›eÌGE*ù„mX:¡mß\0UÄ÷5öÌ»Úi:g¢yäf¥(ÍŒö$x]I¯†=³Ä¿=×İl¸áJ”Òß[ŠéX½ØƒÈai}â]Äy\Z—:t.T±T‚d„ˆÛ»ù´ıÇGb\\,½ï^áÆ.|JÈ`oÈMÕÓú£ÃSÀŞQÖA¡X·õ‚]S0í½æİI·uìœÉîï¢©½f¿ˆ5ğz2Ø)^„3%îŸÑƒW7®¯NúèÎVpÉG\r+ƒ\\T5øF“w¸tS­OŠ;a¨qïË\n¯g£kïÒ˜\\ì\"tlWëàuçéÑç@˜¥ÉCçâ >mE}Š¸\Z9”\rÚNÄW˜Á=úÍ®{‹éh}6_¢\\kR^ÿtÖÎşZÍ²ÎÓîQGİá‡ÑkËb¼VE»/Œ—.®N”ÑV%İ„Æª¸KFÍç[Æs\0±ú¾2;Ê8Êp‡ŠH·$FgÁmÒ\"Õgûé!ÇwJì+éÊÁ—Ÿw1Xrb\'¶¹­n­4ÊTâDékòZ¢OìYÒ;_@`ÏÈÉÜAÀ.ìb¸Â*I²|‡¾ÕÔ\"Óçîªæsğëóóe	¨YÊ©?_š¨¾uÂ‚­„%yË·ß“/¿GìÒ¯3àTŞØš\'>ïÅÄ>äò+¦·y0\r\\XÆùRÊ¼—v!ƒO¤İ[KÃ¿JnŠıL&ŠÈ¦@H\\Æj5˜»_]³Áf2qø­YıôK(q·ÈèîM{@²ÎägL´¶œ#xş.v+ta¯¡*‚\'rMI²íÅ\'Ä¯…Èš“Ãp¾©…µM:üç<	t«uÃ¼h>Äõ<=ğM&×á²‡îîÌöæKƒ¥¦ÕusÄõ•F™°m|!®óÚnª(õ\'i¸\rôÔ‹ìvÆãV¨Aõ\r*\"¶ut,ğLq•^>ï¨RLªV?Œª™Luçé`|Õğqä¾Øf‰Bîx>İ\\ÍvÈ›ØİİW£)ì,£V#A8k%DjK:«rù9ç¤×‚¡õ\ráıCâIûæ­^>÷©næ|Ò]\"Ã ñ®©fi´rıìğğ€pæôşjs¥x\'¥şøåŸº¶I‡YS+túœæUÌğE®‹×¨Œ2“°<SãÌ(3˜”j?\0«ÚÆºxñ@xÊ¬ˆ›øfœ/.ªMš›î¢GØ~µ2“S¾˜Í7çp¬q‹1WôªÁA®eK®Ÿ¤&=öNc£;Êûï›¿rÉª)zwğ2z6Òh$Üß¿o$¡\r\nPÿ¬P¸ä½çI*tl=??Ÿ–nnì&Ø3ƒÆ¨²Å/åß7¥J‚İ½®fçøîfÜ8QúÔ¯ú‡l,=#\'T¾K¦¿.ömı`‰dšªõEŒ•.tn*rÏê¼‘\\õıı½=»·š°˜P&ì/ñ\n\\O ¤?Œf°õ–=OA¾¹yù¼m	JŠ§P Ûø9i§Fø¥}ßgß¿D«ñew1¯Xªâºç“‹j\n$}¹§ıåûjLrop×ß¸:m_ı¾Çı&÷$ÙÛ·@Şº¶yzĞz&$Èªòh81$:>ÂÒ„‹ú›˜q³9‚YK“¾l	÷bÇÏl¢l‘Bûd†÷Ææ·c$‚Şü€«1š¢ÜM%”#ŒKñÓÛ\n×>S×:»â§@+¨¿áÌïÊ¢ZXöÈéGŒ@HAe‰ª­¦S_=Õ!²¿Â\"ø‚(úH	@ÏÑõb3œåîsÇëZQ~¬j;<–3É×à«]»áãvRû9Q†Nw™ö¢q%~»*Şñ¶\\õ;ƒ`Ö…-XpÎ	J—ß€)°J¦ããuúˆÑß;”T?íĞ+µ\0MáíIu!è»ñF’¤‘O¿,I›,Ü0#;;²Ìgó™œ¹lRj>­<îbÊxíT›25k)’hcˆÁZe÷àHs;ÿ,©kì™5G¿âé›ˆ‚R7öó‘\Z†¨‡îRâßÁÊ²=O—1î°kIy°z0XñWJ¬fÆ¿î5¥A™{1‚sOB³‰	5×d+êìª\\^Ö\'e¹™…ëœ˜ÒóÈ-éóŸül¾„	½]“†.ŞğÎË~¶Úœ^U¤ñàí³Ñd2\\”ËŒêjsWçó¡™Ú¬Ï\ZASua(zA¦Rw9¨ôÇì‹ˆwzy¿\Z£xVºè*l—*ÙVI÷_øØŞ›şUh[0&aèRT°{Bp\nv¨_7n´Å¢²ÇÕIêR yyæ\r¥ÆìBVÀ\"øôşüï¥ ¯¼—8®M™{®qkĞBh¸©%¯ùßÀå§~?Àuÿ¹±‹Ô!%1éøÿ`Ÿ¸é¾™Åüì˜od8\Zúõí|yõ[w¨¢~ÉÚ¥¬†\nøß®7Êmİ³„Z*è\\#[ö@NÏÎC~Ç¿Á{\'Ò[rÁà·Üô”ÿî¾ÔI’ÎTÏr…cÛYyV²FÜq½Š¶ÔX0ëä·W|³Nøj)3»Míú DE›,·LR±c=€s\ns3[_”ëjüšOv`ãı°³Ëò†µçv@I©ØxK{EÆH\Z§¡ŸÇÈÙŞ!®ƒÕú“I˜E‹Ö@Ú]ÏO†üÁ(ÂæG˜çËu	îj—p;˜_Ó8{›ˆ#&Œ`È\rÉ%gRöè®}Ac;·qŠx*âôAœ€w²­‡Ù\0¦¿XJÖàkG¨™†cù7RÑ&gñxøôÔ\'£W©ö7‘fm¤]İ$\\J+[×¢IìO¡ƒ6VeqQ&šŠ¶æ§ï€ÁÂ £Ö\nèÙ´\\Ïg=Š2ñ 8p\nÃ+ÒM­hJUİIE\".8µ8Tp|ã™—³¶i?Œõd£-Z{£Ù‹IIú†IƒqËçU ÅS£ô«„Ôï§£ó|ø!)CsÙ“”dÌæ¦$2ğ„€ÂÖß•ı¡QjPïAS‰XÂ˜òY.4ZáD(qŞ$z¢\r\0AÅjÅ_¼t‰jßÌçÓr¤JÚ!ru€—ÏcL•ÉQZ­FQ¸r~w\rÄc³ø¦ªÕÄÎ£iÚLÎc°UÒ,XïCX}q‘î–*03Ñ—ÄşlìN½¬ôhÓ¥z±úüõ}S¿èæ‚¡¡¤p¨è@5³j²Tïu)&;Ç®ö‰˜I­ì	z§ŞšæM-\0¦±w4Ç¯>¿î/ÚŒ4ömír\n[Š¢Ä§ûsœºÂ›22^?r¡Ä6é¶î]R¦ì;–ôŸ0-µqQ\'6-¶;qÔ(n¦ÅX­ì(jQéš0º†Î¸Û÷#î ¨Ø[áË»ëÁ(?åN\\³ëæo¡ğº-‘znlÚ)m”ë§7^Ãlí®Ÿ¸”î‘U¹ïÄ8¼J™§†kZ±•8\"O/S\0×óÄ„Â2@(*¹ş‹Ñm’$ñØĞnÏ¦;öÕñcE¡›k¼‹ëË)œ~.^z½`ùu²½¤QzJAUÍTé\"ÔÒªWã¡üqW©Q„Xj\0\rÏ¨)WÔ2QºĞBuàéGÑfğipGÉÇÒføIr7ø$O¹«T…{¦(Åwîœ£D…İ£ø¨Òœğ=chà|w#]ç!ëñğv\Z™ò¦f†dôCfWVå_‹Ì÷ª\0ºR½HÒäM©9°°>ˆÎó¢±²#[İ-\nc\ZŠTšşbNJ0Z\\L«ñºËn1¼H¬n4‹ÔM¨õ]Ó\"É½õÍ¢Ü+2Xš»2—Ş+êÔÓ“ÕäïËçOšç1¨È¥ôZ«\ZÿúmºQ4v#ÕüÓÎålşšN§5\0ƒZßÄÚÌ÷^\06†‘Üd÷»›	ï¤”>k^Î{_pSàÔÇ¾JÑjq¥LÉúCÖË3@÷z½,%`æBÜÁ_Í—N>ºê:é³øRˆü+ñô¡ãS¨¥g$ùŠÊkN%Ó´4nAS\\P;Åğb×;ä/;4Ï£ôA°¦†×j/iiÊ,3Œø·\\æÜe®•üÿ/ó¯_fg©Å‡ÀêÛ®ıfTlÙ««ë(ÇJÙÉëI©‹ÜÀ:ÆzMÇ²kZ\ZHgC·Íb¦\Z)µ‹z,ïÊ¹(á²\'ß\Zåì9;HN\\ÄWÁPU†\\èT—/¸¤GÙÆh¤{mÕ„Età·càHGHœ(^»nºT¿ƒ·S[¼ù>{/lãã@/Ämå®Û=¹¸İ¹Şo«#ÂkëØ6Â/*€fÓÅ³û348±ãá‰¾’›jfSÛªû#a¶QÈFšÇ$ƒ¿;…várDø\"CUG‚ /Ü®œ¦Ö¾\rª“d[¦^%Ğ[µë±%ÏÎª\']‹Üñ3åÊ’\nTÌT·ŞõÓä.âÑo$9s[üz<p/å”¥vNSİÙådˆ½/bÚ³uÒ•§Íüê@¢½¼HL3IQİdÂÄ»‘xŸZg&ÖªŸéİ¨C%{pßÕ/o\Z¡n/œüüß@ÛZ§€¸r«cœ„y\ru¢)¢5ÈÍ}—Ã7ôå\Z$ëËŒyÙßßA…QÒ—v 	w@jß½ñÈhèBêtîYz2Êçş+CŠ$ÓJÜF}Í‡g–,ğ¨ˆø‡îoNW\'’†|—ÕB=M©XB,ª jşì4ÅœÍÜêÖW³MéB9rK,Eµ MÂÜ¥a¿:™|†ch›«´Š³´!·ï£÷°¥ÓÁ¤VØÎ=€c\nåÍRÏeORSj‡|Ïmá&.‚‘*Ü%©¾a´aq?Î†É“5~Ÿ½çpÕp†è\Z5\Zã\"˜”ÌöÎ›uÈ¿P™Œ2äFAš‡åÕb-\"¨HË”`j¦èôRÑ#Kc8ĞwfQ=(6C‡uE&êØûû>G5eóaìÕ\0±}âÃÇƒİ*lVsÇf4â ı,jŞ¸@Ÿ0&êvïñî4JœD¨{f—&· şÉ§QÊÚB÷W»²í®–«äó_;…Ñ„Æuå¬šo[Òä‹”óE³IØ`ŠPÀ\nÚ°,‘-·´òåÂL{[á×£E9Q³Î,19w²oª‡¨	˜û¾\\®\rŞÌŸWTl$;Q|òÊ3h6Á‰È(­†„$kP94~ğİŞ®}Õ9Ì±ŒÚõº®&\Z®1<ÊRçÀAö(€‘ä>°»àmƒ®|t³Z9Ë›Ü5iJ™¨\0^)KæŒ„1fÎêÿ',1458950021,NULL),(8,'C6QWXn6eXZ6q','phabricator:celerity:/res/phabricator/bff6884b/rsrc/js/phuix/PHUIXIconVi-UeZHu22VtQbm','raw','JX.install(\'PHUIXIconView\',{members:{_node:null,_icon:null,_color:null,setIcon:function(icon){var\nnode=this.getNode();if(this._icon){JX.DOM.alterClass(node,this._icon,false);}this._icon=icon;JX.DOM.alterClass(node,this._icon,true);return this;},setColor:function(color){var\nnode=this.getNode();if(this._color){JX.DOM.alterClass(node,this._color,false);}this._color=color;JX.DOM.alterClass(node,this._color,true);return this;},getNode:function(){if(!this._node){var\nattrs={className:\'phui-icon-view phui-font-fa\'};this._node=JX.$N(\'span\',attrs);}return this._node;}}});',1458950052,NULL),(9,'4JkVb4QRPhF8','phabricator:celerity:/res/phabricator/d0cd0df6/differential.pkg.js;-kTAjUcZTYeTu','deflate','İ}ısÛF²àïù+¨İ<(´´ï¶Ş$åØN­³‰“‹í}[¥è± aA\0€–µÿ÷ë¯ù@QNî^Õı\"óÑ3ÓÓÓİÓÓÓóı?§yÙ´IQŒƒŸ×Ée/“¶ª_ÖÉÕó2}YW›ïò\"{¿)ª$\r¢ûe…ëí²­¶å²Í«rÜ&õUÖ†÷ùjüı?§/úqš7oª4Sá}»Î›é¢„´˜Óæ»¬h2Ioò«¼Ğ»(û˜•m3;Ò<ı6»ÊKìKáç+ì}ÜæE¡:lêêªÎš†éd¬P×U\\D0À6_6³û¼y»İlªºÍR3‚ğ¾ÎÚm]İæeZİNqÈ?ä\rt\'Ê›Ÿ“¦ÍVkİd7—Y\r\rÒ°gå¶(\"©üN³M»F‹¼yU&—BN\0)Q“µ¯M’jì²ª\n…H]#ÆÔ9÷b„yĞß«Şêª¯#TXl7iÒf/©?ºBšmBsÊ5¨»qŸSÖ×§Ò›¼üX]gco²¸ôåMë8ç;ĞIL@æƒà¿ê¯\'¿8ŒC\'›iìáÁĞ#ŒH£vª¨Ÿ_\0­·	,±üÈêh¹Î‹4¼O+Ä}@§u¶i®ŞhÎ§¿ÓMRU¿¡&o!%ãÚ¡š=šûùîcRQ•‹e‘/¯cXM—@Y„¢Hw0£Y9¢1Ø“\rhæç;¯á}6½†õ2çœjÍøxb<†séC\n¸†.gõïëÇ‘Avx yâ+1›0\\ $Š GqlOš¢ıá®Û¥\r7ÁiRÓØ¡›ˆ:¡©¨¯³NŠ,ù˜ı!8±Û¶³W‡\'İW×$R›¿$·¯/Ã)´•¼«“²Yeõ4ñjµÊ–m,«Í]0×´fw¢Úü®D·‚µÓÄ{ûDEæ«ªc…<Oçyş¥N‹¬¼j×ğ}r¢°×deúKöÛ6kÚ1:ÏóÍ¯ö¬•Ğğ/&oÈ€¬´r¢€tëWë;œ—×‹ÏÔÑIÕ#uëQÒcõLÜj˜²¿Vµ±kT›P$;ÔyÛÖI»¬nTE…k¹»¨èT°àUrqÑ[Q°ĞSÑ £·\"£¡§ÆFO5ÄC§\n¡ƒµ¢Ç4«©¯fŒÃããÃHkƒõd>áJ©Ø\\VIv–—Îy™°Ô>Ò).ˆ6ûÔÆ:¡`q€éÏ6pµ œ¶`0/¯Æ¼€ K–¥Ë$\r˜¼Ín\Z“é¯l¯ »Æ© $Ç^)\\ä4’gÿ•ß\05ıúìÙ´E€¹Óön“vçåVs³É–1eÃ¸78{<„#Ì™–É\r`ZÿŒyfÒò”@±›Ù`QbÖŠÙØªßuˆõ3«ŠQS¨î½bˆq™İ~á’™¡-˜¿†f“~ºü\0¼š«còèéØt“ŞU°øöÁMş¯Œyo»-{]R£héÅz[^¿SÉ2¡êóø˜ø)‰,3üZĞvô:#”bĞİ!\0l.Í:Ÿ]Ñ ‡òï©mÏ[Ğı·Í8Pe™©+}Hé˜ö‚›ÀASµÅ¶Îc-¹Ğû_^sKØÈÿŞfõİÏIÜX\rE ‹efş³ª¯WEu;Öà¨Úß’2-²zì,\\‘2yúÜ\Z÷*¡º:&Â°{â{}À_¾«éÂ.‡şâÌóˆI\'CŠèâEeŠÙ3j!dü#Ïn®€«ß!>ø>êÂ3ıJ´üU;\néÏ{ır\0âf§¦g~ùNtl¨‰hóëb.ªw2®§ø¨`Kˆ†şA«sÅrŠ˜A2lŠ¬U«O :½JòÂÏÖÚÓ »ƒ¢<Ñx\n-Ãæ	+Ğ`ê=¶p–TÊ^6$-(õIã7ü-ĞúÖ†yÀâøA÷¿gi8ùİV#¼Õfc„ı‰rº\"?£oµqçcE…ÚÂUG#å\Z®¸¢´˜s´ˆ¢Ï©¢+£õë)äQ±p~YgÉ5Ï±UÄC•–À.Ğ¿:sÎ5{ç|»yÒ¤3$ª‰“îg/¤“‹E_î%0˜·8­÷xª5‚ú&c‰ûÉå½AEdc«ÖÙoJ‚ª…bÔ`‰\n7YV.°\rÌ\"op”ıi`£²ËI*ÉRæŸ*Ê‰Ó‚…~«Y¯¼+ÄŒ-LˆM¿iU5#ƒXÔƒ£ªä^‘É,‚:²¬œê<W¦\r3vFÎeQ]ê%àª0·Àß³±7Ö¼¾*SnÕÒ RE™ê…ış¢VëŠ¾%Ã‹DfVTİYL0íæ \ZšÅeã§(÷‰šÈ·²¼åR•\"Òúi¶&±VO‰^Â=bËBĞwƒ«L˜êKøYëÉUYõâh1²wµ\rMÁß:òVÀÀj²…‹øaqšC=Í“Á\n#	È´½?&5p?HX·7ŒDE¼iU¢İ(3”eÂ³MSXµÌóZ¶\Zª\Zî¹jÑNÍ~5…·ÇG\0¦9g~L‹j¢\"¡ø–‘{x%¸#”l%ÍN‚Ù(8áï¼\\Uj‘ mZ×1Î/¢\nÍU¸Ùç]äLaş7UÙdï€Çøğƒ·Yı1«G\\éT‚ÅFÕÄÆ.²Ûdu›gÍì·dFH\0%QÙ|Q$MÃiFkçï¥³ó£4\\èß÷\'½]\'›Líbû‘lI¡=oa´aÀÀüP‡n£ä½ú!éXõ…ÊsàÌ­³¥L†Ì9*¥Îg,0’T{ç¯›¼ÔG9«¬–ß€0)Ğ9W î¾ºIQ~Ûe–E–Ôïò›¬Ú¶Ú„¿B»Rö)îR8úm’·Àßc©\'½U¼w	WYĞuØ›#/~ITBä˜ã¶ï+]€7uGôøøˆAˆU\n&}[¤o-c†lF`ø4yzk)4\rs§[¾$Ğ3<`ÃÒ2HM“QÚ¡³qßXNÔæòÈø!¿Éq¥\r#Øúˆ†eº^¦-Œzà£œİ‘îÆFgÉYµ\\¥ı£ÆöA_å%`æn¾BŸF?h´Fv4…İ<q8rÎRÉ¡üFVìÖÇò’¡\nØ»MFÆ×UË¼ıç:¯ê¼½ÿÇ_O‰§`Å¬&ë%r—r‰3\r`·ÙXru‘Ï™Çï¨§¥Ø vQ‡ÈÍJ5tjÑxL8õ\0Õ–ïú‹¼ü‹Qy¬x~}qÇ˜¿¼Z;÷PĞåÒµ¢¶Ù_OO£•êóìì>kgBf´SaË—Ù:ù˜£$Ió s“U–¥¸&›:Cš&½Ê¯xw›P™“$}ÊI²ùªÊŒ/i\\@ ¿Â.óÇïwr“)méâIêwªÈù¡úv\Zë>\'pá|(\'¶-ùÊP­£¾,?Å8®DŠÍ’¬‘õõÆâÚĞ\0şV\rJ¬œkE zğš¨(%Fs`£	Éï	œ\"ÈÄo}d€cİ!}<ƒYháIR{|ù7š{Ğa‹r¤Ê„u\r9¸×‡á3Éßé$XO·VOxş1±Å©4Òî…„fòú1)¶YÄ™ñ?NÛuÙC>Òpº®³»f<Dlã„D´oN?T9ğØ(0ÆDi;µ±±EÚÚ£ˆÃQtdøb_g¤·=X­jÍ±¼#9ÁNÀ€Òê¶”©(Íh‹‚å:)¯2¿¬³{P8ˆ.}Ê\'`5Ä–bÓşu¶BõñuY\0½üÌ€aú}Kc-§Rˆ;r³ş8É¡sÎù#Éœ!•sr6ûíB[`«>5;6§ÊcƒÁì‹ÆjXËúN\r(HÈáÉê7gèîØŞl‚°cƒ$€İ3Z~}’Êóy[ßİS?±ğdò\Z4˜¹.0…½Á*şœXù=3¢+Dàƒµ³\\ó«²ªaƒ~¿ÛízO]{Fù7âNV\räî)P¦5s¸cï#äù^¹›¥yë5ÑÈŞ&+`Ëª=óxæ9mº,ÊıwU¸]Ãó›™Û–”GF‘.–YQ4ñùÅÜ–RNJÁFÍ\ZEËoG×Ue}ñ²oì8Âªæoâá†¾«ê<t<£&€Æ-È‚†Ï[ğ#,ì=Éêê|ì¼g>ƒĞê÷ŞzvÓ´tÒÅ8mj¦U¹\0<­Ûo¸Ô”>fòQd«–ª\0K³êäÍ›Œl9ßo‚YğS 4¤Uş)^\'ÒÂ‰ªvüÌe>hÅqY^Xåw°°y~ìü1Tn²×€^«dtv\Z¸¼ü1#TlLf¨‡[é¥E\\éµü]Mg‡Ód³N÷Ü\\šj«MÌã`kq¥=µØMâË€¶	§w_ó€Ñûn61dÎ¤Ï©òÍ†\'¿ ,v¬ÓN¨´­(¢ ]°-âbZfŸÚ·ù%ĞÁ×«ãBjÕvæñ±ÄÉ€)¬ãºpS{†¾!Zú±7ÿ€Õ[ÑæåùÕU]ß.ëª(€ş‰ÔÙ8¥ùT®¯BŒÊN éé§ˆşİõT™ßÀ#Ä›nŠm‡sèæô._RKÒŞI§-»9fã®j) €Fz¤ÒlÑ¡™&ûMZêê§Ùö¥DqÆàïWP`Jn•˜§¥\Zä XCs¶“1BïÕ™±Å\Z™0Èã§›m³îƒÂ‡\n}Ğ\n:ö9Dƒ&FâïYúÛSKö²ë”@¶À¥îyI:Ùd³k‘ÌPËº§¤†±Ç‰‘:§ÃzÀ0ˆF2ÂûÎa\'!ĞQ4dÊ“¶öÖ¤ÀÀDã¦êÊ«\'r…XoçèÕ‡E-îÎ2[¤Ğ+’XF@S·mBñ±H8şpz„/P³Y çy6–IØYÚoŞüTş‚ÒbÌ^²¯À‹Â§«¼nZb¥G1{,[DŒwí âFSy{m?<(9°jXF‘³©¬7·oH„ŒÛµ¸¥¡(0µH‘ÌiNoH‘{ö_/~MOÎzsñÃ~„_>ÏÏ.PÜ(Uï“ş¶LAt•è™Î>WÍ.‘LÔY\rÙª3TºÊÂ(ÑÏó5áºA$0`×§ŞTÛ&ãíÔùB\0¢ ¹š|¹ğ½í`ø\raøÛmÛ\"ñ<<8tyã8Öwœà¸ÇzOôåZ;LÚ}ü´É`PØ©àrÛÜ±m\rú `Ù\"š*Û+`¼Â•Œ+…ÕMü¦ƒf=-ã`NTÛ\\¡b~*çiƒ†œõ•£\Zrã‡—EJÚÎ×zl/æê8gò`_Qù½m>‹TÈ)ó]µ]®Åá²—¬¤Ï!%kş”¹Õb“ÃÓäuæñé=ŠcW;×õH—‚\Z„Q_z(Ëe¦bØí#ò¾4õÊêÎê®6¹?[åËìÏáÿáá¨§Ÿ´QŠé¬±¾ëf	uò.¢l²šw Éî«\n´Ô¬ŒÇÕ\nU1hÅTHTfç	a„\n·“*T¹§ 6 ì“/Ô$áFûÇ¤æHL@«’$#Ô¾í³XÎ»ìfS$xÎ’Ïa™V&5ôS‰[~öÅ’Î½~9ÖÔD9°ËÎr9´ˆ1?dŸYƒc#\rÍßœÍN¹5¡ç›Ğ%2\nmåLN¹ñ¼B2\rb¹\Zìr\07µ«N°¼Ñ<M€•¬Ïe/{w´Of,Ck²oõ\roÜµƒ[kvÛ3²ºÚD™u©‡¥Ñ¯±—ÎŞ}Ow¸ıWYp§HÏ‰È!Ÿ\rğ=eL‡Uáı\Zi@²qÕ™ë„èU^Œå†Äƒ’:p	¹¬àšö†ö×›{°n¬*–ÕÛ £ã°´wL\'\'yND©¨Ç1ë{æBƒ\ZÄ˜	Ì‚Mi,6N4ãºäœ€Ù=Ä¾“b¡vgÈì)TñÛGœ¤eÒdAš¡L0û®ÅU¿½¾£º6·EWµÕ!ğAÂlâ ÎVòm— ÇqÍ–×—Õ\'5›+4æ3AäåfÛÌC˜ÆÚêêªÈ^H³j‘ê‡1ì%…°äK¬Š›ânA¾Ïd¶Sc£ô@‰W¨\Zs«,\"WéÚ§[#~	|L†ßÖİ\ry#iÅ{èÜ·Æ*ÛÜÿK9´i±dSæK<J_š_ğÙ¦>KZæ;GÔ9¶IÎ‘©C7¡±šG-ü`Ê,i‡FŠ¨ƒÙ~W	VØyLÀï†æğ®Ú€^tàÜ³³H¯jøÉ$H‰¸Lfg»pß-³óı’²778©6ÚB{B‘†2MÈÉmW©t÷8/ù\\¸Wlñ´ãZàİijÜÊné€«8·(q‰Z²V:©AèT·æüŒWŞVQŒd˜JFÓ® Ä¬ÈiOcüÓG<½«i<qO·ï7EÕ’1ÏxÔz×XÈ–);”)H^i6Q±]™Z`Ë`O©PÙ1 T<–¾é•y|LµÏÏ.Â‡şyz!œøc|ÖV0ŸÏù8SÜ!V¢CJGÌ©Êx6”¸\'C^åˆƒøÉ;9\"ÆÇ¹¯á+Ô£%3¿œãQ÷¤ øW;ÌÙ7ˆĞ‘iåi3S8ÉÓ]çÖGb™\"¡{X‡’>íÊ•TBå¿c¢å3\"\"& ¡y,3@ó˜åÓ¼mà.ÉWÓ\"lWñãê‡(yHÕÚÂ* zî?¦½Jšª@t\nø\'S\nŞgJ…s²¹RğOÏñ	!İí<·ŸJÎJÍ^ƒpİ \n Ed=FPˆW&(ì¾ö×x”¦öÒnªÍ¶ ƒäÎÁlÇ¾-NO¶\Zòúeÿd”%-ø):\r™:a’HÉ&±Ë.kÏ·mÅ7?¡IJ&?æË¼Èÿ%BwÊùóş£uµ¨dˆÛ¶\'Çn²Glu|È;$¦cUÒ¶?Kƒj84‡ãw¨5ãnHç3â(xoûjWCô•ã«‡Ô/äç²)L!ùMnªzŸĞ5Ã?ÄHú¹H°Ÿš†öq¾Õr#úÔN8\'°ğû‚sX©±©H™²vÊ¡íj] DËRã\0 $~8ã4¦¦1•Mn]a;ÕòOI,«¯âÙ&èö»ª*Ú|ÃŠ¶FİwaeG.Ô©\\o;¶¶ô¢–[s%·’ó«2ş“}\ZfÊqà©Sœ{›§í:>ûË)Y{q1yˆ\0àqğç!Kƒ¹ß‡ ©¶õ¥Ø,ôÅ0Ä÷\Zâ›ªõıãPß8P_}Ê–¼”÷~Xw0ZüÊ)à Ày6Í\0œİ0M25O¡Ø‚ÁœQû×ÓÓ9ö©×£4œâœù½#¨¨·‘J8$FJBôˆ¦:Â\"óMt)¼·i¨=—~jÇéQvb»Ç$\"~Lê$Í«>o¥ƒe	âœ tÊà©P’~Ø6­¶c‰šŒì”\r\\™;ëÊa²<Ù…\\H¬ôY&d²×éÙiøul9ÙÒ®³´¹lJF—LÌ[êKºÈİe\'oÊNó†#yê—¢T/; FÆ(xxàÿÜúW¦á=gÈA1‘5y|Ìª€îV ?‚ù£3¯Ì–äHhŸŠ›3yŞÁbqµZ¡8RÇºş$³u§À÷U#wE:¹UjRP–n6”®jÊ­n>Å‘´•x°yÔ%ğ;ûFIg£©ô<¼H*ÔàÆĞ‰\'ü7÷ûBÛ>õSeàovMjuÑŠU³\"ÃQÍ¸–C69÷¼«ÆœaKô[9z×²åh\ZD6\rLÎÂıJSd¯.˜“³ğÒLÒTè&«›	T,—CÎ”é]™ÜäK¼~à\\ÎF ÙÊµ¿Ú4±›s~}1§t´e_Ï;7~®³Ur9½ÜæEª½¤ÇTÃ¾S é½ˆƒ‚z;G>l	­0‘®1Ó¿Ä<ÕÌ¸˜|EEr	,DùƒçÓòw¼$è\\3ô\\Â=‡üqOf;.\"5ñ–‚“êÜùÇw+l!c“[‹{Ï= ßÅºµ]İTŒıL\rÓ¦åx¬s£N‹ØMXtVº™0ñöÕ\'c¶½ÌÍãõ:»£¨D“r¯¶öRîr[7UOÎÜÍD3·|„«rq™9n»&#+-İ\\ñ]µÜ6öİ‹å Tâ6t¨Ú2Ê²IsXl\n\0ÉœsY¥w\Zğ÷¢o‹jyİŒy˜<dÀ¡Ş´zÎå.¬3…KŸŸ÷”ê&]ğ^›–Ÿååº¿2ó°KæjõxHºš“!ş~Çg®ÉH©‰XÔÁÉ(ÍJ-8yL¢È0ÃnãK°ÁæœÒ\"D ÉÙR±5Âc‚R^<<¼x,°Û+Ãaˆ21ÈŸHÈ{î‰4ÄxY:Eëğz||$å~(˜°4¤øĞHİN½-€ÕŸ}úi¥Ì×äy2GP§{J=¨¹Ç‡Å‚$¼ŒshÇŞ…Á]´ëòˆ‹Iù8öõ§*RiüáaoAr›ğÆËÜÛ\\”)Wø$azÃÆƒˆ¢¬F˜´h«O/xœk¦lÂŠä«²:Š„Bs¶Ÿ¬µ;KZ¤ãÌm°”¶¸\rÎ†×	ùæ–Ö¸ådÄ¬¥8ö˜¢j\n–¶Òªì®S¦™V€Qò…æG‘8Åp	c]±ÇÇªÚQì\"Üœ¦ûìÛ:wÙ¸›}v1—i5\Z?ôùÃW5	ÖO¥_1r\ZFÅĞdyêí5ï0@]—i?áPÂˆ•õÕ©ÚÂdé×±á¨0€Bdª¬	mÔ§’ÖrĞ­ ûÂ½cr%úñ‹A¶¦Í¿Ó®Îä–ÅåaO™Ï’mÙ.nPµ9[û©-úìÜ[¹cóÔâûw¾hS8ºq¸Ñ.™ø/ƒn×™71ÁV&ÁIGV³1,ŸÈ ÿwÑ_Ş®«º]nÛqğ$á÷@ç£¶\Z¡6?’Û0cŠ×¨ä=’æOgtƒ®„	Àp	ƒÍ][Í)ó×g599¼Íïı!RĞ§\r0b±rp›ïçÓÛ<¹áÒ,¯ª‘:¸{ê°ÍûÀlúFş{:1ùœ^´V/Úu6\"¥oT­Frı¶y´¼W\\ŠÕ~AãÆ\rÉwi\r]zÕ’M=©GÙ§\r4N½Ã)¥y³)’»Ñ8Y¤â ê%Çˆ5\\ëáá¨«ê\ZÎüs„2C`şìwèÒ;1ÖV…œ&ªqİÃÑØ+XOuNYÉÅhèŞ,:ƒ„=7É07û¾ãØu€M	ú5«6îmƒ^Üõùğ-ña®‹G\'ä¤ƒô©®Ì¸JPõSôå¿òı:”&qîĞiêí9ù]ÈW®Ä»ìÓ¿pÜ-İ‰¬“¬Q½¼¼\ZİˆÛ3j7Ø	¤‘lÖ5,ş	F‡&³Æ|àQYŠÊÀ6Ş¾§)ıW‡išU@´ñJôN¼I}ÿ]p²\"—Ş—ãğ$ØñáÇ!4tìzÍ¾oó‚Â™¼UXü‹8Îç—hê16âL›íeÃâN#Ê–)Â3—Wç0¿î¾äc3èÔ¯å¯ep?‰%¸}h¬>Û·‡÷±Õù×áá±­ÈØbÈÃ òİ½õÕàU 3ÏÏ‹b¬çíÔp\rZ\n¡ıÜ…EÅ]íJFmEM1±µÔ¹Kº~íâóa›Kg>pƒÍŞ£Ú-Â\'ôÁï¤¢\0t^£K¬ÊK¹³‰î:Ö[uµEU>]ó¡$†÷T­¡|\\BdKw©8’BÊ.Úü&«‡aß‘ÜÅ5ıXó­c<´W!tã&4ºzqG®`yo6b\0:á\"‘!iÚ­ gIS´}Ô¬kŒ¢•ÌğÒjTËí—ßâÒ“4,¸ÑåÈ³ƒ«\Z÷„®ó\ZM8È‹Î‚ÜX%OLflcÌf²Û*ª6_ªq®õ¦jA<½©0ğÜ¶ -GÛ’-cªs˜Æ%ÃH Ùv¾:fyû¼m“å\Z×ò½7\\g|DºC=cQ£‡1±?iHí\Zy\"}9`` ¤ ˆ¶fÈjªi€ÃÊP×Åi¸(°Gqûé¡ºÉùR-½\r*×}o³Şæ,2Áó}®NWÉ(8	VÉ8mV—èy“—×£=Kİ›R°‹ËádÁÅÈO×ö!Äx³5y\\1Û™‹Ë\")¯¡¾îxh\0$Î‡Ò1™Š\Z\0®9}4^xÁŸƒ!h‘…>®=jn’¢]ÕÙ´Å¿	XX3Ğ£Ğ@>òupi¯ÅG°v‘§0RùkÊï\"À”H{Jp·ÂqÍ¹4‘=DvI`xJyE`¤öp²C1(ˆ€‘û>T‘§bt`CT=¥fÂƒfëˆšœÑßİ.â+êlø\Z·˜ÙùZØU\"È¹†ò-6Ğ•~}U#s’.Âµ¯”9Yw#®Qß;k•FYµæ–ö÷aW|,•Ìd€È¨ºs«¿L)Z/ğÀ;¿Úìì)<ÓêyOä)Ç½]Ë£èä¤äKt\Z±GË3G<R’ˆ´(û´,¶°’LùŒh$³!A¸3!†O#õèô1qg=zØõ9¾uI<Ô\Zß\\aúå,9ŞoÎ‰8T¶™dºÔh7ì’b§ˆG‡¾tœïüè]½âè¿S|7ã1´SğGØ·n÷bJ´Ö=¨’HwOC–ïĞ!·kiî‡É´k˜&şÂÅøC1/zÕaÓs0)Åb]Ã§•­sİH§‡	ç6»±b”éaG–şL°2€u³W¨³MÕà¥©»É²®š¦ÎÈ°±ì:Q«W–wšu“­¼î›“e,gäU=Å‹V¨°›1ÈÂ¯åtÄh@ÏîbªøÍÿ:›ı‡{ã-€ÉSH`ÍØ¹8¥qhWıÊ:\08ëË[¶56¦Q\Zÿ›\ZM¸X˜àBÁ\\ü}L_ğ9‡_”bVáÅM²‰ïËå, O bP|Ô¨à+áĞÃå%*:@ğ9&ršu°˜‹OP\nÜUÿ™\0çï›Ofj<Q¬K-Ñ(`¾Š]°_/+½}—™•g®ãš»-5é¸+œiŞãè[İÚã„(‡…êyBÇÕağùÓˆuøğøXùjuÜÔ´†#\'G0ØïÄéRš’1|Fæ<„èDĞÇóxğ†kV¾Ş±\\»±!˜TØQĞÄ²‘o@‡Ğ:¬ïƒşĞfïlº%˜eÒ¥å~wsY©7d§h€½éáAÒò²Ìj4BA|\0fø\'ÒD!vµ\"bÒÌ…:3Ÿ!ªÙ\0±Œıi/ã%V.|íÂf€ÏŸÕù˜/ÕäŸ//D¤—Çb;ƒ_óä6ÖIœ·ÎA8¢ÍDò„‡>ç}¼hÄp$Aõcz=Ró°†è±(¼öæ |<—gÎh¤\n¡Á{ÛÀÄ>ã‚Ï‚şq<ÃûıuQÉÌ{\rË0X…üØ.’ÆŒ·‰9Ñsá¶Â£ŞIuvC¯L0xÿ„jÙÎèpàùœœä»ÁE¾\Z—ºà¿cS¥eVâª¦½övÆêm=;K…ÕPç)Û \0Pk_ûñqç{…:×É3¹òÚ%ÕfáªëÊ«ÕËÁ8¾BåkQ–p°ä1”}¸&­;jQËòöGäÒTíIdVP¦*Ú”+j†î]Ûz ”ŒkG÷Èëö¯\'r˜[@õÍíkÌÿ”pj~\n›9nQ‚zä÷Õ“ÈÃİóµ?´&Ã\Zâå|Ã°·+¥Í0„óšNÌKü EŸÏ¦My\Zª8¾ª†„İ-^ª£xä†ÿà›şãöûäxİ~Bòåˆ-…ø¤ŞŠP´¨7¾Íu¾ù	Ô\r§\'¿T·Ö[e|x)WMá÷ñ1_(xÔıM‡ÕpïkZñåğrP–™ÀåØ}4¯UªĞø&”A©ËË&S‚„QêD<¤Š8`N³â@Ùfô0Óo	pÉ1£59ÚAhÜ8_¿Ô™v…0BY¦³èÔ)|x±•X1á	¢ºÜÀ*Õ‰{Àğvô\Zl…f6™Sîì¬ù,ªÇ\Z†[³Œ|º£rMÑÖ=”oĞ\\ó\"¾¨o½\\¾¹£ä´i£¦^F|€7àT‹Ø‹Öw³ëºˆ\Z-×ÄêP.êğ	`zëU KS§ô-¥˜êRB|É°œHV;£jk&iÂÖc¦NDj2ôEE|¿Íº©ã6Ï¼¸FË#Ñ!imcCó³éŞî¢í{÷f³5”§´ˆ›á3—ÎÃ2ŞèÆæMNÍŒ¤d#ëÂË´ŸÏpCta<9~£Ş©5-ªãqnåŸû rºxlˆ,S^I\\¨§^\ZÑ~ĞwçøÔ¶!^\0Àƒ&É†BëšßîÅå‰oHYïŒRì¹Ş,Øá;æTĞ@ø[İbjòVœ) ›÷s—®D\'å>¼I[‘îÆ“j«D¦—ê¾²òÕuıYtçCüä¶TO\ZÁï±\'Ğõ/	\\\\mâ‘¤ã±Ÿˆ~ûTã~l°º³Ø×˜š??EÎ¥6öEm×eCöšÕ/ê-ñašbø¥{MSúUÊTC58d$s¼â™YC®¢Óc´4ãT«ÈŠˆ:án£7\0ÿRÃi¶—7y{Àp¾7q@ç¸ı®®n¾«êOİ|ÒuXóëŒìIè1XõKãY7„O ivÖ%}ƒ·½ô¯8°~0*‰¸Ò·we»ÆÀuo9ñÂ\r´jâ\\p³ Ü!-¨á¢ÊMy·«×³êT	{ñùĞ$0ØJGFså	›oLï™­Úo4u$–ÄÁÔ¾2nÍµ´7Ø:PÕ|„¨±Áv%i-^Ÿ\0äÆçyŸûoòqĞ7™e‡td¼WGbàõÌ·>²ftcÇÒc­*AÒh›Ù>+Š+Ò» êÃ½©çZ_>åªÑÙ\'×e†]RÌœœP²Yv4Ğã97Ë£b,ÑCÅ‘şòÕÈV3º½	7·K˜^©ıÓ7ºòö)ú7,#U…ªú´V(_P[&P­ÕZ+]Uµ6)óÕø$Í”Uq|]óÛms×GÁfÇ!Î¶Ò‚(í<˜x€Àç°Ö\\²Ä¾×Ÿİ>uŸ7oŞ³‡®#ª®{Ä\ZB]W	¶ÏY¹”¿ã¶†1ÄÖ$a?ŸrõAâ²¦Âö%É>åe@OÙ‡BòSvñ§ßZ&KNQ5™•Ç\Z‡ÙRè{D*ŒìĞ(\\óÕÀ jW½>)­\ZW5¶)9“™È¡†l1€–qÇÈTf:Ñ>’§»§`¯_QÒÂ]9S~éÕÖdv‘Ôî‰\nêõ“Ÿ;ø£ºXã(nHG›8òSìhİ ªôaºÚ›äiõ*o8ÄjtÔéÈ!ÕiÿE@è¡Ê¨Ò\".K¥˜“å1ÅÏÓ!v;eE»£pa±6Ú;Q~˜×y@²R|”‹£u‰ß€#ï-ñ\"‰Ä@İô¿ĞÖ;õ°±Åq6ÚÑoŠÆ-pµT‹4iÅ’ÆÒe¤“¯YÎzfx(@\rŒ-ø¨³\n±Y¹Á?ˆ¦m\\Û.øœ`ñ²ÆÖ9Ë“br™Ã\r²Æ»Ë®\nñ-êÆßÚ£Ù”ÃºáMˆÊÄ	Mf@~ø\0 ?|ø\nóÄ}ı\r‹ŸøÀ1òâk­ARÎ•ûB‡™îé CÛ{$¦ 6×	¤ñÙ‰¢½?ÆÌ£Q\nÜ£@ÓŒ\nÄ[½àÁJ4Ë’Ä^ì  uÆşÄµu(Î\ruºÚPÀR/úfJJõ<a{Ö\rnŠ»JgeİÀ|.6^•|(f®F¨P9şöşõ?_Êş2ô@Ø%ÈzeK>\'ô¡Êõ~r/ §ìrl„LI„Ñ4á¹SÁ¦Iüv÷T³ÛÃ§ ÎKH_x3&We‰\0nL0{ï8ñ! 4/çØúDN~UrmQƒì£nIGdM—¨C‘ÒLãŒÑd¦¯ÏÒ³ŠZYÅıX)® z!=>Lr\'¿Ë¶CÍ<m‡Ú‡’Ş0ßë‡%õrzı2ÜjãQa:t\'ÿì\\t:xöqk7œ+z#lñ¥pŠaòd|‹£l”—£—Êá8\rL{@¼ÿåu”J@ öF e”iRĞÆŸ«7:…ê“Åæóf —è¡yƒ^ÄæŠ•Ç& ¦>3c{‹dÇÁÙvC{hIşßBÄ&ñŒU@R\rK%¯Î$¦çÁó!ã–M0ì7PÍ‰ãı‰À,gÂ:3±ê&£W’«÷Ññ†\\Uâ{Õ‰™Âœ1»ºuğ¬Éêù2k©zÏ`î	Tkµ‰ëª×SUY\"wj<îŒz0J,z1>Ÿ€Ùf[{¨ÕîP£çÍá(ÕÍkœj8 U×<«t=ÕÕÿ¼ºHô–}R·˜àƒT²ôß‚R1ú%¹áUÆÑøÈ	ÕúÇb]ÎÁ è|¾)ö\ZìB³Ìğ|!G	©Éï\'ˆ\nçT¾EïĞµT~Aºõ¶Îz«ë\\Áš±f )_é†(ß•º÷•^!âkÅºÑ?¢?TÉçâŒãR3á÷yQŒ^h<—¹0/¤q£8öww?q)Ûß_õì÷Æ_VçG8šrÏŠôTÃ\'œ¶|‘2wiÿ‘Â}2I¥9’(fiƒoaj¸z¸H0°[èpw’©ïË|•gø–«~ã¨Ötye|káòn‚ÿ	Ê0õz´Ç6}™ ØªÅ#SÉÑ:r+)\rÚÑ;Ru`ˆa Ÿ™]­[(6S‹æë3²f|ùjüÄ<jaP#PNÈáht›·ëİ9ı©ìO£Û¤ÑÃ>Ègş$/†[]9	¦\n,ïE»á8>³tHÊ¡G†)u¹ûn“‡Íaó4¿âP‚ÖŞyQ¶ÌA:tG4šÒ½MVh÷Ğ{¹ÿ07 íA8ğŠeï.ÚÙHFz?úH¤BK{~º]åQÒ®nŞç;)£VD½£øÌ¿;\rdàÆSØÁ½2Í¹Ş)«¹·>äÆ‘Z1¶’êxÇÔXmq2OøS¼ØÙ£É‚H4¦ëÀ‹¥P„rBùŞ-i·¨N˜€¨¢¼Çm•øCÇiì¨ûmš/s!² <-°­\n·5ä0|hH\\_ÉÌŠÖ¡ñ•+;tß£ûö¶“Nå2`ª´Û’ı‰°“úá®É*esDíŸ>Dìd˜Ò„şÙÛæsëb‡/Prçä>-]¿á$Oi0ã\0å…{5ÅÓ.ö14¼(”t€d¾ñwIşÒ³=Ï{4¬ˆ»w><YÏÿyzòÌ‹T\'òzŒñ6§­pr‹GÏîğ·\\ã¹9ÆÍ:_µ?ºñùä£s+>ô…Ã²Œ)²œ|×b‰F³SjÈw™L¶Í·w$eÜê.ÁPeŸ`(/\'\0ÚÈÇ¸­~¨n³úEÒğ‹	¿Ø*N•æĞœû¬ªËüû¥h¤4½ñ“ı@4k¿ã©Ó·ò~fb…±sæ¬œAÅÛÇvco[Ñ½ÀŠ6°‡áîxD¿CmŒû~àîø>Îıh[·‹Î©A•“¢q{àÉÍõõŞ\'ß·°a–›ë½Õ¶äºØæîKâ½¾çaóîS`}Ëßz•»—‘_gw±7,«ëEßNè»ÿ`çG\0OÇÑqµ‹½Å«Û´óÈTj”æãã6=>¶Ş£MC¼\\bÚ%=¶Ï!\r’©Oêè¤«³©¸5Şc4ûjíJ¬ò ÿdkŠ ¿ÅuÅ»r¾¯İpzCîàİ[ q35ôE¾Ó‡şÛò„=ÜêK¾×†İ]ã*ƒlãı/¯åqqõ©³W*c%I G´Y³I–ç˜odVÛ1L<eê³ÜÂWŸ’­öàœ«¾$“÷òÔ9ıï¬++Í9WßPA¦[.³Ùi„5òÛQ*SXª\"Kä_f`:Ë>Ò5C‘om(µïÍ8§ÄÊ\0Ğ½ 2²GˆDÖ+W·5\'iŸ•ë_®SOä¾¢5Ø°C\ZÓDŠC}¿–öÄç®:`ŸË¶ñÏ®Ÿ¿L(éYÊÉ…§êädnLuqĞÊØˆrB»;iÜïè¡\'¸Ï`Úëb¥œG#·O¡Z3d)•¬»ÕŞ;İE®ûï=~|øT®>»ÈŒâN´uBm9ÔZ\\Áæ¸¸vìĞÃhå|ÈÓß¹s,í(üêr8J4WtÇo¹ØCè\n\n–ƒÍG}7åÿ+³/¾ê¶\r\r$Ô4ûrÜ©|Èµ×Œ;[½PÌ¼iprGƒÓP¯œázß€ûë)¿O÷A¹BÄ6PÙ\rI*8˜Èoœ`\nŸr¿FA”,–À63ïÎ±äÒ§7ÑöãfìØsÌ6\'çt^\'W7ætù˜«õ¼kê²š~M‰{vŸ¾\'\n\0œ‰Š··wïvIŒ®±Aag®ÀuŠˆßjÕ¼€g\0­ÖU/,«ïyá‡*øŞ˜ÊĞ¤ªp¨°jßˆ4lK€ÔËïÑıv‡ÆÚáb=—@Q´kµ&²Ä»¯Ø<vË’òø÷4ÊÕÊ€«×`^·´^LZ„V­oïö­bR Tíûr<}o3G`çZIs¹ÔUKPÕ`‚Q¿ñt\n\rTxQJ†ç˜dÁ¡_´‡µ}İV› ü†?frºÍ;o‘j/ªÅƒWgÉ¦>R¾÷TM­evßâ5¬«R›ú¤Õ”7®÷¾şkTßN»=€¼†Me¦}¥¼õS÷%?½QN®ø†Å*Dë±˜y¾Ò©G±§õ˜€bÓ\nûeébS¯ù…”£È¾dÏP×Î „ò¼2Ep]c¼\\«Pšß¸e^ŠåHÊ4-ìïâÿñ?9bj™%õ(,K¦w_Å\\&4.ñYkSâDõfz~Í5¡ÙéİD*Ú7œ»ãú¹jœ0ÅR®Ûñü¦¯ÜMÆcz36¦wÏşZA.©°é÷Øt\\—K3;Pá÷Wª¶<g‚¬3ĞU{´:*\rŠuëÖ®µoA—š¶Ó	êtÅ²ŒomÄãi†yĞ3ÒyîgvƒD¬ò)2è‘7<v;%±Ø®=ú.²Ù·Õ–•	öğæ–5‡¾íæ£ñTTpô2¢^ûa\"tóëcVÍ¯Jœ€Gın\"vø¤{ËMİôé/{ÀÑ†çİ­‰…AÙÔÔÏ¤ôİ*Ã6”«¦Æ4ÛU´2+°-á×íU\'Z8	ô—âc3ºñóô\r-{ıU™­\"¡óÙoGäú²Ô>¦Ïö# Õ^b¿Õö\0',1458950053,NULL);
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
INSERT INTO `cache_markupcache` VALUES (1,'fo7P4TuH2YZr:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-note\"><span class=\"remarkup-note-word\">NOTE:</span> Any user who can browse to this install&#039;s login page will be able to register a Phabricator account. To restrict who can register an account, configure 1Z.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:103:\"<a href=\"/config/edit/auth.email-domains/\" class=\"remarkup-link\" target=\"_blank\">auth.email-domains</a>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1458950067,1458950067),(2,'rVwVLSGl.Y9K:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-warning\">Examine the table below for information on how password hashes will be stored in the database.</div>\n\n\n\n<div class=\"remarkup-note\">You can select a minimum password length by setting 1Z in configuration.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:68:\"<tt class=\"remarkup-monospaced\">account.minimum-password-length</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1458950067,1458950067),(3,'nHato9WQIj8d:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:3488:\"<p>When a user types their LDAP username and password into Phabricator, Phabricator can either bind to LDAP with those credentials directly (which is simpler, but not as powerful) or bind to LDAP with anonymous credentials, then search for record matching the supplied credentials (which is more complicated, but more powerful).</p>\n\n<p>For many installs, direct binding is sufficient. However, you may want to search first if:</p>\n\n<ul class=\"remarkup-list\">\n<li class=\"remarkup-list-item\">You want users to be able to login with either their username     or their email address.</li>\n<li class=\"remarkup-list-item\">The login/username is not part of the distinguished name in     your LDAP records.</li>\n<li class=\"remarkup-list-item\">You want to restrict logins to a subset of users (like only     those in certain departments).</li>\n<li class=\"remarkup-list-item\">Your LDAP server is configured in some other way that prevents     direct binding from working correctly.</li>\n</ul>\n\n<p><strong>To bind directly</strong>, enter the LDAP attribute corresponding to the login name into the <strong>Search Attributes</strong> box below. Often, this is something like 1Z or 2Z. This is the simplest configuration, but will only work if the username is part of the distinguished name, and won&#039;t let you apply complex restrictions to logins.</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Direct Binding</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p><strong>To search first</strong>, provide an anonymous username and password below (or check the <strong>Always Search</strong> checkbox), then enter one or more search queries into this field, one per line. After binding, these queries will be used to identify the record associated with the login name the user typed.</p>\n\n<p>Searches will be tried in order until a matching record is found. Each query can be a simple attribute name (like 3Z or 4Z), which will search for a matching record, or it can be a complex query that uses the string 5Z to represent the login name.</p>\n\n<p>A common simple configuration is just an attribute name, like 6Z, which will work the same way direct binding works:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Example</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p>A slightly more complex configuration might let the user login with either their login name or email address:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Match Several Attributes</div><pre class=\"remarkup-code\">mail\nsn</pre></div>\n\n<p>If your LDAP directory is more complex, or you want to perform sophisticated filtering, you can use more complex queries. Depending on your directory structure, this example might allow users to login with either their email address or username, but only if they&#039;re in specific departments:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Complex Example</div><pre class=\"remarkup-code\">(&amp;(mail=${login})(|(departmentNumber=1)(departmentNumber=2)))\n(&amp;(sn=${login})(|(departmentNumber=1)(departmentNumber=2)))</pre></div>\n\n<p>All of the attribute names used here are just examples: your LDAP server may use different attribute names.</p>\";}s:7:\"storage\";a:6:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"2Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:40:\"<tt class=\"remarkup-monospaced\">uid</tt>\";}s:3:\"3Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"4Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:41:\"<tt class=\"remarkup-monospaced\">mail</tt>\";}s:3:\"5Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:45:\"<tt class=\"remarkup-monospaced\">${login}</tt>\";}s:3:\"6Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1458950083,1458950083),(4,'.4EOg8Xw88WD:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:189:\"<p>To search for an LDAP record before authenticating, either check the <strong>Always Search</strong> checkbox or enter an anonymous username and password to use to perform the search.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1458950083,1458950083),(5,'2SwALNO6Yg70:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:315:\"<p>Optionally, specify a username attribute to use to prefill usernames when registering a new account. This is purely cosmetic and does not affect the login process, but you can configure it to make sure users get the same default username as their LDAP username, so usernames remain consistent across systems.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1458950083,1458950083),(6,'H_JFmx5tn1ir:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:253:\"<p>Optionally, specify one or more comma-separated attributes to use to prefill the &quot;Real Name&quot; field when registering a new account. This is purely cosmetic and does not affect the login process, but can make registration a little easier.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1458950083,1458950083);
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
INSERT INTO `daemon_log` VALUES (1,'PhabricatorRepositoryPullLocalDaemon','phabricator',28,'[]','[]',1458950003,1458950106,'exit','phd','28:cmhjbbq2u'),(2,'PhabricatorTriggerDaemon','phabricator',28,'[]','[]',1458950003,1458950106,'exit','phd','28:ww45uojq6'),(3,'PhabricatorTaskmasterDaemon','phabricator',28,'[]','[]',1458950003,1458950106,'exit','phd','28:7qrjoxkl2'),(4,'PhabricatorTaskmasterDaemon','phabricator',28,'[]','[]',1458950075,1458950092,'exit','phd','28:elbv2whwj');
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
INSERT INTO `daemon_logevent` VALUES (1,1,'INIT','Starting process.',1458950003),(2,2,'INIT','Starting process.',1458950003),(3,3,'INIT','Starting process.',1458950003),(4,3,'STDE','[2016-03-25 23:54:33] EXCEPTION: (PhutilProxyException) Permanent failure while executing Task ID 6. {>} (PhabricatorWorkerPermanentFailureException) Task has no transaction PHIDs! at [<phabricator>/src/applications/transactions/worker/PhabricatorApplicationTransactionPublishWorker.php:89]\narcanist(), phabricator(), phutil()\n  #0 <#2> PhabricatorApplicationTransactionPublishWorker::loadTransactions(PhabricatorAuthProviderConfig) called at [<phabricator>/src/applications/transactions/worker/PhabricatorApplicationTransactionPublishWorker.php:19]\n  #1 <#2> PhabricatorApplicationTransactionPublishWorker::doWork() called at [<phabricator>/src/infrastructure/daemon/workers/PhabricatorWorker.php:122]\n  #2 <#2> PhabricatorWorker::executeTask() called at [<phabricator>/src/infrastructure/daemon/workers/storage/PhabricatorWorkerActiveTask.php:171]\n  #3 <#2> PhabricatorWorkerActiveTask::executeTask() called at [<phabricator>/src/infrastructure/daemon/workers/PhabricatorTaskmasterDaemon.php:22]\n  #4 PhabricatorTaskmasterDaemon::run() called at [<phutil>/src/daemon/PhutilDaemon.php:183]\n  #5 PhutilDaemon::execute() called at [<phutil>/scripts/daemon/exec/exec_daemon.php:125]',1458950073),(5,3,'FAIL','Process exited with error 255',1458950073),(6,3,'WAIT','Waiting to restart process.',1458950073),(7,4,'INIT','Starting process.',1458950076),(8,3,'INIT','Starting process.',1458950078),(9,4,'DONE','Process exited normally.',1458950092),(10,1,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1458950106),(11,2,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1458950106),(12,3,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1458950106),(13,1,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1458950106),(14,2,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1458950106),(15,3,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1458950106),(16,3,'DONE','Process exited normally.',1458950106),(17,1,'DONE','Process exited normally.',1458950106),(18,2,'DONE','Process exited normally.',1458950106);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
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
INSERT INTO `patch_status` VALUES ('phabricator:000.project.sql',1453226118,NULL),('phabricator:0000.legacy.sql',1453226118,NULL),('phabricator:001.maniphest_projects.sql',1453226118,NULL),('phabricator:002.oauth.sql',1453226118,NULL),('phabricator:003.more_oauth.sql',1453226118,NULL),('phabricator:004.daemonrepos.sql',1453226118,NULL),('phabricator:005.workers.sql',1453226118,NULL),('phabricator:006.repository.sql',1453226118,NULL),('phabricator:007.daemonlog.sql',1453226118,NULL),('phabricator:008.repoopt.sql',1453226118,NULL),('phabricator:009.repo_summary.sql',1453226118,NULL),('phabricator:010.herald.sql',1453226118,NULL),('phabricator:011.badcommit.sql',1453226118,NULL),('phabricator:012.dropphidtype.sql',1453226118,NULL),('phabricator:013.commitdetail.sql',1453226118,NULL),('phabricator:014.shortcuts.sql',1453226118,NULL),('phabricator:015.preferences.sql',1453226118,NULL),('phabricator:016.userrealnameindex.sql',1453226118,NULL),('phabricator:017.sessionkeys.sql',1453226118,NULL),('phabricator:018.owners.sql',1453226118,NULL),('phabricator:019.arcprojects.sql',1453226118,NULL),('phabricator:020.pathcapital.sql',1453226118,NULL),('phabricator:021.xhpastview.sql',1453226118,NULL),('phabricator:022.differentialcommit.sql',1453226118,NULL),('phabricator:023.dxkeys.sql',1453226118,NULL),('phabricator:024.mlistkeys.sql',1453226118,NULL),('phabricator:025.commentopt.sql',1453226118,NULL),('phabricator:026.diffpropkey.sql',1453226118,NULL),('phabricator:027.metamtakeys.sql',1453226118,NULL),('phabricator:028.systemagent.sql',1453226118,NULL),('phabricator:029.cursors.sql',1453226118,NULL),('phabricator:030.imagemacro.sql',1453226118,NULL),('phabricator:031.workerrace.sql',1453226118,NULL),('phabricator:032.viewtime.sql',1453226118,NULL),('phabricator:033.privtest.sql',1453226118,NULL),('phabricator:034.savedheader.sql',1453226118,NULL),('phabricator:035.proxyimage.sql',1453226118,NULL),('phabricator:036.mailkey.sql',1453226119,NULL),('phabricator:037.setuptest.sql',1453226119,NULL),('phabricator:038.admin.sql',1453226119,NULL),('phabricator:039.userlog.sql',1453226119,NULL),('phabricator:040.transform.sql',1453226119,NULL),('phabricator:041.heraldrepetition.sql',1453226119,NULL),('phabricator:042.commentmetadata.sql',1453226119,NULL),('phabricator:043.pastebin.sql',1453226119,NULL),('phabricator:044.countdown.sql',1453226119,NULL),('phabricator:045.timezone.sql',1453226119,NULL),('phabricator:046.conduittoken.sql',1453226119,NULL),('phabricator:047.projectstatus.sql',1453226119,NULL),('phabricator:048.relationshipkeys.sql',1453226119,NULL),('phabricator:049.projectowner.sql',1453226119,NULL),('phabricator:050.taskdenormal.sql',1453226119,NULL),('phabricator:051.projectfilter.sql',1453226119,NULL),('phabricator:052.pastelanguage.sql',1453226119,NULL),('phabricator:053.feed.sql',1453226119,NULL),('phabricator:054.subscribers.sql',1453226119,NULL),('phabricator:055.add_author_to_files.sql',1453226119,NULL),('phabricator:056.slowvote.sql',1453226119,NULL),('phabricator:057.parsecache.sql',1453226119,NULL),('phabricator:058.missingkeys.sql',1453226119,NULL),('phabricator:059.engines.php',1453226120,NULL),('phabricator:060.phriction.sql',1453226120,NULL),('phabricator:061.phrictioncontent.sql',1453226120,NULL),('phabricator:062.phrictionmenu.sql',1453226120,NULL),('phabricator:063.pasteforks.sql',1453226120,NULL),('phabricator:064.subprojects.sql',1453226120,NULL),('phabricator:065.sshkeys.sql',1453226120,NULL),('phabricator:066.phrictioncontent.sql',1453226120,NULL),('phabricator:067.preferences.sql',1453226120,NULL),('phabricator:068.maniphestauxiliarystorage.sql',1453226120,NULL),('phabricator:069.heraldxscript.sql',1453226120,NULL),('phabricator:070.differentialaux.sql',1453226120,NULL),('phabricator:071.contentsource.sql',1453226120,NULL),('phabricator:072.blamerevert.sql',1453226120,NULL),('phabricator:073.reposymbols.sql',1453226120,NULL),('phabricator:074.affectedpath.sql',1453226120,NULL),('phabricator:075.revisionhash.sql',1453226120,NULL),('phabricator:076.indexedlanguages.sql',1453226120,NULL),('phabricator:077.originalemail.sql',1453226120,NULL),('phabricator:078.nametoken.sql',1453226120,NULL),('phabricator:079.nametokenindex.php',1453226120,NULL),('phabricator:080.filekeys.sql',1453226120,NULL),('phabricator:081.filekeys.php',1453226120,NULL),('phabricator:082.xactionkey.sql',1453226120,NULL),('phabricator:083.dxviewtime.sql',1453226120,NULL),('phabricator:084.pasteauthorkey.sql',1453226120,NULL),('phabricator:085.packagecommitrelationship.sql',1453226120,NULL),('phabricator:086.formeraffil.sql',1453226120,NULL),('phabricator:087.phrictiondelete.sql',1453226120,NULL),('phabricator:088.audit.sql',1453226120,NULL),('phabricator:089.projectwiki.sql',1453226120,NULL),('phabricator:090.forceuniqueprojectnames.php',1453226120,NULL),('phabricator:091.uniqueslugkey.sql',1453226120,NULL),('phabricator:092.dropgithubnotification.sql',1453226120,NULL),('phabricator:093.gitremotes.php',1453226120,NULL),('phabricator:094.phrictioncolumn.sql',1453226120,NULL),('phabricator:095.directory.sql',1453226120,NULL),('phabricator:096.filename.sql',1453226120,NULL),('phabricator:097.heraldruletypes.sql',1453226120,NULL),('phabricator:098.heraldruletypemigration.php',1453226120,NULL),('phabricator:099.drydock.sql',1453226120,NULL),('phabricator:100.projectxaction.sql',1453226120,NULL),('phabricator:101.heraldruleapplied.sql',1453226120,NULL),('phabricator:102.heraldcleanup.php',1453226120,NULL),('phabricator:103.heraldedithistory.sql',1453226120,NULL),('phabricator:104.searchkey.sql',1453226120,NULL),('phabricator:105.mimetype.sql',1453226120,NULL),('phabricator:106.chatlog.sql',1453226120,NULL),('phabricator:107.oauthserver.sql',1453226120,NULL),('phabricator:108.oauthscope.sql',1453226120,NULL),('phabricator:109.oauthclientphidkey.sql',1453226120,NULL),('phabricator:110.commitaudit.sql',1453226121,NULL),('phabricator:111.commitauditmigration.php',1453226121,NULL),('phabricator:112.oauthaccesscoderedirecturi.sql',1453226121,NULL),('phabricator:113.lastreviewer.sql',1453226121,NULL),('phabricator:114.auditrequest.sql',1453226121,NULL),('phabricator:115.prepareutf8.sql',1453226121,NULL),('phabricator:116.utf8-backup-first-expect-wait.sql',1453226122,NULL),('phabricator:117.repositorydescription.php',1453226122,NULL),('phabricator:118.auditinline.sql',1453226122,NULL),('phabricator:119.filehash.sql',1453226123,NULL),('phabricator:120.noop.sql',1453226123,NULL),('phabricator:121.drydocklog.sql',1453226123,NULL),('phabricator:122.flag.sql',1453226123,NULL),('phabricator:123.heraldrulelog.sql',1453226123,NULL),('phabricator:124.subpriority.sql',1453226123,NULL),('phabricator:125.ipv6.sql',1453226123,NULL),('phabricator:126.edges.sql',1453226123,NULL),('phabricator:127.userkeybody.sql',1453226123,NULL),('phabricator:128.phabricatorcom.sql',1453226123,NULL),('phabricator:129.savedquery.sql',1453226123,NULL),('phabricator:130.denormalrevisionquery.sql',1453226123,NULL),('phabricator:131.migraterevisionquery.php',1453226123,NULL),('phabricator:132.phame.sql',1453226123,NULL),('phabricator:133.imagemacro.sql',1453226123,NULL),('phabricator:134.emptysearch.sql',1453226123,NULL),('phabricator:135.datecommitted.sql',1453226123,NULL),('phabricator:136.sex.sql',1453226123,NULL),('phabricator:137.auditmetadata.sql',1453226123,NULL),('phabricator:138.notification.sql',1453226123,NULL),('phabricator:20121209.pholioxactions.sql',1453226124,NULL),('phabricator:20121209.xmacroadd.sql',1453226124,NULL),('phabricator:20121209.xmacromigrate.php',1453226124,NULL),('phabricator:20121209.xmacromigratekey.sql',1453226124,NULL),('phabricator:20121220.generalcache.sql',1453226124,NULL),('phabricator:20121226.config.sql',1453226124,NULL),('phabricator:20130101.confxaction.sql',1453226124,NULL),('phabricator:20130102.metamtareceivedmailmessageidhash.sql',1453226124,NULL),('phabricator:20130103.filemetadata.sql',1453226124,NULL),('phabricator:20130111.conpherence.sql',1453226124,NULL),('phabricator:20130127.altheraldtranscript.sql',1453226124,NULL),('phabricator:20130131.conpherencepics.sql',1453226124,NULL),('phabricator:20130201.revisionunsubscribed.php',1453226124,NULL),('phabricator:20130201.revisionunsubscribed.sql',1453226124,NULL),('phabricator:20130214.chatlogchannel.sql',1453226124,NULL),('phabricator:20130214.chatlogchannelid.sql',1453226124,NULL),('phabricator:20130214.token.sql',1453226124,NULL),('phabricator:20130215.phabricatorfileaddttl.sql',1453226124,NULL),('phabricator:20130217.cachettl.sql',1453226124,NULL),('phabricator:20130218.longdaemon.sql',1453226124,NULL),('phabricator:20130218.updatechannelid.php',1453226124,NULL),('phabricator:20130219.commitsummary.sql',1453226124,NULL),('phabricator:20130219.commitsummarymig.php',1453226124,NULL),('phabricator:20130222.dropchannel.sql',1453226124,NULL),('phabricator:20130226.commitkey.sql',1453226124,NULL),('phabricator:20130304.lintauthor.sql',1453226124,NULL),('phabricator:20130310.xactionmeta.sql',1453226124,NULL),('phabricator:20130317.phrictionedge.sql',1453226124,NULL),('phabricator:20130319.conpherence.sql',1453226124,NULL),('phabricator:20130319.phabricatorfileexplicitupload.sql',1453226124,NULL),('phabricator:20130320.phlux.sql',1453226124,NULL),('phabricator:20130321.token.sql',1453226124,NULL),('phabricator:20130322.phortune.sql',1453226124,NULL),('phabricator:20130323.phortunepayment.sql',1453226124,NULL),('phabricator:20130324.phortuneproduct.sql',1453226124,NULL),('phabricator:20130330.phrequent.sql',1453226124,NULL),('phabricator:20130403.conpherencecache.sql',1453226124,NULL),('phabricator:20130403.conpherencecachemig.php',1453226124,NULL),('phabricator:20130409.commitdrev.php',1453226124,NULL),('phabricator:20130417.externalaccount.sql',1453226124,NULL),('phabricator:20130423.conpherenceindices.sql',1453226125,NULL),('phabricator:20130423.phortunepaymentrevised.sql',1453226125,NULL),('phabricator:20130423.updateexternalaccount.sql',1453226124,NULL),('phabricator:20130426.search_savedquery.sql',1453226125,NULL),('phabricator:20130502.countdownrevamp1.sql',1453226125,NULL),('phabricator:20130502.countdownrevamp2.php',1453226125,NULL),('phabricator:20130502.countdownrevamp3.sql',1453226125,NULL),('phabricator:20130507.releephrqmailkey.sql',1453226125,NULL),('phabricator:20130507.releephrqmailkeypop.php',1453226125,NULL),('phabricator:20130507.releephrqsimplifycols.sql',1453226125,NULL),('phabricator:20130508.releephtransactions.sql',1453226125,NULL),('phabricator:20130508.releephtransactionsmig.php',1453226125,NULL),('phabricator:20130508.search_namedquery.sql',1453226125,NULL),('phabricator:20130513.receviedmailstatus.sql',1453226125,NULL),('phabricator:20130519.diviner.sql',1453226125,NULL),('phabricator:20130521.dropconphimages.sql',1453226125,NULL),('phabricator:20130523.maniphest_owners.sql',1453226125,NULL),('phabricator:20130524.repoxactions.sql',1453226125,NULL),('phabricator:20130529.macroauthor.sql',1453226125,NULL),('phabricator:20130529.macroauthormig.php',1453226125,NULL),('phabricator:20130530.macrodatekey.sql',1453226125,NULL),('phabricator:20130530.pastekeys.sql',1453226125,NULL),('phabricator:20130530.sessionhash.php',1453226125,NULL),('phabricator:20130531.filekeys.sql',1453226125,NULL),('phabricator:20130602.morediviner.sql',1453226125,NULL),('phabricator:20130602.namedqueries.sql',1453226125,NULL),('phabricator:20130606.userxactions.sql',1453226125,NULL),('phabricator:20130607.xaccount.sql',1453226125,NULL),('phabricator:20130611.migrateoauth.php',1453226125,NULL),('phabricator:20130611.nukeldap.php',1453226125,NULL),('phabricator:20130613.authdb.sql',1453226125,NULL),('phabricator:20130619.authconf.php',1453226125,NULL),('phabricator:20130620.diffxactions.sql',1453226125,NULL),('phabricator:20130621.diffcommentphid.sql',1453226125,NULL),('phabricator:20130621.diffcommentphidmig.php',1453226125,NULL),('phabricator:20130621.diffcommentunphid.sql',1453226125,NULL),('phabricator:20130622.doorkeeper.sql',1453226125,NULL),('phabricator:20130628.legalpadv0.sql',1453226125,NULL),('phabricator:20130701.conduitlog.sql',1453226125,NULL),('phabricator:20130703.legalpaddocdenorm.php',1453226125,NULL),('phabricator:20130703.legalpaddocdenorm.sql',1453226125,NULL),('phabricator:20130709.droptimeline.sql',1453226125,NULL),('phabricator:20130709.legalpadsignature.sql',1453226125,NULL),('phabricator:20130711.pholioimageobsolete.php',1453226126,NULL),('phabricator:20130711.pholioimageobsolete.sql',1453226126,NULL),('phabricator:20130711.pholioimageobsolete2.sql',1453226126,NULL),('phabricator:20130711.trimrealnames.php',1453226125,NULL),('phabricator:20130714.votexactions.sql',1453226125,NULL),('phabricator:20130715.votecomments.php',1453226125,NULL),('phabricator:20130715.voteedges.sql',1453226125,NULL),('phabricator:20130716.archivememberlessprojects.php',1453226126,NULL),('phabricator:20130722.pholioreplace.sql',1453226126,NULL),('phabricator:20130723.taskstarttime.sql',1453226126,NULL),('phabricator:20130726.ponderxactions.sql',1453226126,NULL),('phabricator:20130727.ponderquestionstatus.sql',1453226126,NULL),('phabricator:20130728.ponderunique.php',1453226126,NULL),('phabricator:20130728.ponderuniquekey.sql',1453226126,NULL),('phabricator:20130728.ponderxcomment.php',1453226126,NULL),('phabricator:20130731.releephcutpointidentifier.sql',1453226126,NULL),('phabricator:20130731.releephproject.sql',1453226126,NULL),('phabricator:20130731.releephrepoid.sql',1453226126,NULL),('phabricator:20130801.pastexactions.php',1453226126,NULL),('phabricator:20130801.pastexactions.sql',1453226126,NULL),('phabricator:20130802.heraldphid.sql',1453226126,NULL),('phabricator:20130802.heraldphids.php',1453226126,NULL),('phabricator:20130802.heraldphidukey.sql',1453226126,NULL),('phabricator:20130802.heraldxactions.sql',1453226126,NULL),('phabricator:20130805.pasteedges.sql',1453226126,NULL),('phabricator:20130805.pastemailkey.sql',1453226126,NULL),('phabricator:20130805.pastemailkeypop.php',1453226126,NULL),('phabricator:20130814.usercustom.sql',1453226126,NULL),('phabricator:20130820.file-mailkey-populate.php',1453226126,NULL),('phabricator:20130820.filemailkey.sql',1453226126,NULL),('phabricator:20130820.filexactions.sql',1453226126,NULL),('phabricator:20130820.releephxactions.sql',1453226126,NULL),('phabricator:20130826.divinernode.sql',1453226126,NULL),('phabricator:20130912.maniphest.1.touch.sql',1453226126,NULL),('phabricator:20130912.maniphest.2.created.sql',1453226126,NULL),('phabricator:20130912.maniphest.3.nameindex.sql',1453226126,NULL),('phabricator:20130912.maniphest.4.fillindex.php',1453226126,NULL),('phabricator:20130913.maniphest.1.migratesearch.php',1453226126,NULL),('phabricator:20130914.usercustom.sql',1453226126,NULL),('phabricator:20130915.maniphestcustom.sql',1453226126,NULL),('phabricator:20130915.maniphestmigrate.php',1453226126,NULL),('phabricator:20130915.maniphestqdrop.sql',1453226126,NULL),('phabricator:20130919.mfieldconf.php',1453226126,NULL),('phabricator:20130920.repokeyspolicy.sql',1453226126,NULL),('phabricator:20130921.mtransactions.sql',1453226126,NULL),('phabricator:20130921.xmigratemaniphest.php',1453226126,NULL),('phabricator:20130923.mrename.sql',1453226126,NULL),('phabricator:20130924.mdraftkey.sql',1453226126,NULL),('phabricator:20130925.mpolicy.sql',1453226126,NULL),('phabricator:20130925.xpolicy.sql',1453226126,NULL),('phabricator:20130926.dcustom.sql',1453226126,NULL),('phabricator:20130926.dinkeys.sql',1453226126,NULL),('phabricator:20130926.dinline.php',1453226126,NULL),('phabricator:20130927.audiomacro.sql',1453226126,NULL),('phabricator:20130929.filepolicy.sql',1453226126,NULL),('phabricator:20131004.dxedgekey.sql',1453226126,NULL),('phabricator:20131004.dxreviewers.php',1453226126,NULL),('phabricator:20131006.hdisable.sql',1453226126,NULL),('phabricator:20131010.pstorage.sql',1453226126,NULL),('phabricator:20131015.cpolicy.sql',1453226126,NULL),('phabricator:20131020.col1.sql',1453226126,NULL),('phabricator:20131020.harbormaster.sql',1453226126,NULL),('phabricator:20131020.pcustom.sql',1453226126,NULL),('phabricator:20131020.pxaction.sql',1453226126,NULL),('phabricator:20131020.pxactionmig.php',1453226126,NULL),('phabricator:20131025.repopush.sql',1453226127,NULL),('phabricator:20131026.commitstatus.sql',1453226127,NULL),('phabricator:20131030.repostatusmessage.sql',1453226127,NULL),('phabricator:20131031.vcspassword.sql',1453226127,NULL),('phabricator:20131105.buildstep.sql',1453226127,NULL),('phabricator:20131106.diffphid.1.col.sql',1453226127,NULL),('phabricator:20131106.diffphid.2.mig.php',1453226127,NULL),('phabricator:20131106.diffphid.3.key.sql',1453226127,NULL),('phabricator:20131106.nuance-v0.sql',1453226127,NULL),('phabricator:20131107.buildlog.sql',1453226127,NULL),('phabricator:20131112.userverified.1.col.sql',1453226127,NULL),('phabricator:20131112.userverified.2.mig.php',1453226127,NULL),('phabricator:20131118.ownerorder.php',1453226127,NULL),('phabricator:20131119.passphrase.sql',1453226127,NULL),('phabricator:20131120.nuancesourcetype.sql',1453226127,NULL),('phabricator:20131121.passphraseedge.sql',1453226127,NULL),('phabricator:20131121.repocredentials.1.col.sql',1453226127,NULL),('phabricator:20131121.repocredentials.2.mig.php',1453226127,NULL),('phabricator:20131122.repomirror.sql',1453226127,NULL),('phabricator:20131123.drydockblueprintpolicy.sql',1453226127,NULL),('phabricator:20131129.drydockresourceblueprint.sql',1453226127,NULL),('phabricator:20131204.pushlog.sql',1453226127,NULL),('phabricator:20131205.buildsteporder.sql',1453226127,NULL),('phabricator:20131205.buildstepordermig.php',1453226127,NULL),('phabricator:20131205.buildtargets.sql',1453226127,NULL),('phabricator:20131206.phragment.sql',1453226127,NULL),('phabricator:20131206.phragmentnull.sql',1453226127,NULL),('phabricator:20131208.phragmentsnapshot.sql',1453226127,NULL),('phabricator:20131211.phragmentedges.sql',1453226127,NULL),('phabricator:20131217.pushlogphid.1.col.sql',1453226127,NULL),('phabricator:20131217.pushlogphid.2.mig.php',1453226127,NULL),('phabricator:20131217.pushlogphid.3.key.sql',1453226127,NULL),('phabricator:20131219.pxdrop.sql',1453226127,NULL),('phabricator:20131224.harbormanual.sql',1453226127,NULL),('phabricator:20131227.heraldobject.sql',1453226127,NULL),('phabricator:20131231.dropshortcut.sql',1453226127,NULL),('phabricator:20131302.maniphestvalue.sql',1453226124,NULL),('phabricator:20140104.harbormastercmd.sql',1453226127,NULL),('phabricator:20140106.macromailkey.1.sql',1453226127,NULL),('phabricator:20140106.macromailkey.2.php',1453226127,NULL),('phabricator:20140108.ddbpname.1.sql',1453226127,NULL),('phabricator:20140108.ddbpname.2.php',1453226127,NULL),('phabricator:20140109.ddxactions.sql',1453226127,NULL),('phabricator:20140109.projectcolumnsdates.sql',1453226127,NULL),('phabricator:20140113.legalpadsig.1.sql',1453226127,NULL),('phabricator:20140113.legalpadsig.2.php',1453226127,NULL),('phabricator:20140115.auth.1.id.sql',1453226128,NULL),('phabricator:20140115.auth.2.expires.sql',1453226128,NULL),('phabricator:20140115.auth.3.unlimit.php',1453226128,NULL),('phabricator:20140115.legalpadsigkey.sql',1453226128,NULL),('phabricator:20140116.reporefcursor.sql',1453226128,NULL),('phabricator:20140126.diff.1.parentrevisionid.sql',1453226128,NULL),('phabricator:20140126.diff.2.repositoryphid.sql',1453226128,NULL),('phabricator:20140130.dash.1.board.sql',1453226128,NULL),('phabricator:20140130.dash.2.panel.sql',1453226128,NULL),('phabricator:20140130.dash.3.boardxaction.sql',1453226128,NULL),('phabricator:20140130.dash.4.panelxaction.sql',1453226128,NULL),('phabricator:20140130.mail.1.retry.sql',1453226128,NULL),('phabricator:20140130.mail.2.next.sql',1453226128,NULL),('phabricator:20140201.gc.1.mailsent.sql',1453226128,NULL),('phabricator:20140201.gc.2.mailreceived.sql',1453226128,NULL),('phabricator:20140205.cal.1.rename.sql',1453226128,NULL),('phabricator:20140205.cal.2.phid-col.sql',1453226128,NULL),('phabricator:20140205.cal.3.phid-mig.php',1453226128,NULL),('phabricator:20140205.cal.4.phid-key.sql',1453226128,NULL),('phabricator:20140210.herald.rule-condition-mig.php',1453226128,NULL),('phabricator:20140210.projcfield.1.blurb.php',1453226128,NULL),('phabricator:20140210.projcfield.2.piccol.sql',1453226128,NULL),('phabricator:20140210.projcfield.3.picmig.sql',1453226128,NULL),('phabricator:20140210.projcfield.4.memmig.sql',1453226128,NULL),('phabricator:20140210.projcfield.5.dropprofile.sql',1453226128,NULL),('phabricator:20140211.dx.1.nullablechangesetid.sql',1453226128,NULL),('phabricator:20140211.dx.2.migcommenttext.php',1453226128,NULL),('phabricator:20140211.dx.3.migsubscriptions.sql',1453226128,NULL),('phabricator:20140211.dx.999.drop.relationships.sql',1453226128,NULL),('phabricator:20140212.dx.1.armageddon.php',1453226128,NULL),('phabricator:20140214.clean.1.legacycommentid.sql',1453226128,NULL),('phabricator:20140214.clean.2.dropcomment.sql',1453226128,NULL),('phabricator:20140214.clean.3.dropinline.sql',1453226128,NULL),('phabricator:20140218.differentialdraft.sql',1453226128,NULL),('phabricator:20140218.passwords.1.extend.sql',1453226128,NULL),('phabricator:20140218.passwords.2.prefix.sql',1453226128,NULL),('phabricator:20140218.passwords.3.vcsextend.sql',1453226128,NULL),('phabricator:20140218.passwords.4.vcs.php',1453226128,NULL),('phabricator:20140223.bigutf8scratch.sql',1453226128,NULL),('phabricator:20140224.dxclean.1.datecommitted.sql',1453226128,NULL),('phabricator:20140226.dxcustom.1.fielddata.php',1453226128,NULL),('phabricator:20140226.dxcustom.99.drop.sql',1453226128,NULL),('phabricator:20140228.dxcomment.1.sql',1453226128,NULL),('phabricator:20140305.diviner.1.slugcol.sql',1453226128,NULL),('phabricator:20140305.diviner.2.slugkey.sql',1453226128,NULL),('phabricator:20140311.mdroplegacy.sql',1453226128,NULL),('phabricator:20140314.projectcolumn.1.statuscol.sql',1453226128,NULL),('phabricator:20140314.projectcolumn.2.statuskey.sql',1453226128,NULL),('phabricator:20140317.mupdatedkey.sql',1453226128,NULL),('phabricator:20140321.harbor.1.bxaction.sql',1453226128,NULL),('phabricator:20140321.mstatus.1.col.sql',1453226128,NULL),('phabricator:20140321.mstatus.2.mig.php',1453226128,NULL),('phabricator:20140323.harbor.1.renames.php',1453226128,NULL),('phabricator:20140323.harbor.2.message.sql',1453226128,NULL),('phabricator:20140325.push.1.event.sql',1453226128,NULL),('phabricator:20140325.push.2.eventphid.sql',1453226128,NULL),('phabricator:20140325.push.3.groups.php',1453226128,NULL),('phabricator:20140325.push.4.prune.sql',1453226128,NULL),('phabricator:20140326.project.1.colxaction.sql',1453226128,NULL),('phabricator:20140328.releeph.1.productxaction.sql',1453226128,NULL),('phabricator:20140330.flagtext.sql',1453226128,NULL),('phabricator:20140402.actionlog.sql',1453226128,NULL),('phabricator:20140410.accountsecret.1.sql',1453226128,NULL),('phabricator:20140410.accountsecret.2.php',1453226128,NULL),('phabricator:20140416.harbor.1.sql',1453226128,NULL),('phabricator:20140420.rel.1.objectphid.sql',1453226128,NULL),('phabricator:20140420.rel.2.objectmig.php',1453226128,NULL),('phabricator:20140421.slowvotecolumnsisclosed.sql',1453226128,NULL),('phabricator:20140423.session.1.hisec.sql',1453226128,NULL),('phabricator:20140427.mfactor.1.sql',1453226128,NULL),('phabricator:20140430.auth.1.partial.sql',1453226128,NULL),('phabricator:20140430.dash.1.paneltype.sql',1453226128,NULL),('phabricator:20140430.dash.2.edge.sql',1453226128,NULL),('phabricator:20140501.passphraselockcredential.sql',1453226128,NULL),('phabricator:20140501.remove.1.dlog.sql',1453226128,NULL),('phabricator:20140507.smstable.sql',1453226128,NULL),('phabricator:20140509.coverage.1.sql',1453226128,NULL),('phabricator:20140509.dashboardlayoutconfig.sql',1453226128,NULL),('phabricator:20140512.dparents.1.sql',1453226128,NULL),('phabricator:20140514.harbormasterbuildabletransaction.sql',1453226128,NULL),('phabricator:20140514.pholiomockclose.sql',1453226129,NULL),('phabricator:20140515.trust-emails.sql',1453226129,NULL),('phabricator:20140517.dxbinarycache.sql',1453226129,NULL),('phabricator:20140518.dxmorebinarycache.sql',1453226129,NULL),('phabricator:20140519.dashboardinstall.sql',1453226129,NULL),('phabricator:20140520.authtemptoken.sql',1453226129,NULL),('phabricator:20140521.projectslug.1.create.sql',1453226129,NULL),('phabricator:20140521.projectslug.2.mig.php',1453226129,NULL),('phabricator:20140522.projecticon.sql',1453226129,NULL),('phabricator:20140524.auth.mfa.cache.sql',1453226129,NULL),('phabricator:20140525.hunkmodern.sql',1453226129,NULL),('phabricator:20140615.pholioedit.1.sql',1453226129,NULL),('phabricator:20140615.pholioedit.2.sql',1453226129,NULL),('phabricator:20140617.daemon.explicit-argv.sql',1453226129,NULL),('phabricator:20140617.daemonlog.sql',1453226129,NULL),('phabricator:20140624.projcolor.1.sql',1453226129,NULL),('phabricator:20140624.projcolor.2.sql',1453226129,NULL),('phabricator:20140629.dasharchive.1.sql',1453226129,NULL),('phabricator:20140629.legalsig.1.sql',1453226129,NULL),('phabricator:20140629.legalsig.2.php',1453226129,NULL),('phabricator:20140701.legalexemption.1.sql',1453226129,NULL),('phabricator:20140701.legalexemption.2.sql',1453226129,NULL),('phabricator:20140703.legalcorp.1.sql',1453226129,NULL),('phabricator:20140703.legalcorp.2.sql',1453226129,NULL),('phabricator:20140703.legalcorp.3.sql',1453226129,NULL),('phabricator:20140703.legalcorp.4.sql',1453226129,NULL),('phabricator:20140703.legalcorp.5.sql',1453226129,NULL),('phabricator:20140704.harbormasterstep.1.sql',1453226129,NULL),('phabricator:20140704.harbormasterstep.2.sql',1453226129,NULL),('phabricator:20140704.legalpreamble.1.sql',1453226129,NULL),('phabricator:20140706.harbormasterdepend.1.php',1453226129,NULL),('phabricator:20140706.pedge.1.sql',1453226129,NULL),('phabricator:20140711.pnames.1.sql',1453226129,NULL),('phabricator:20140711.pnames.2.php',1453226129,NULL),('phabricator:20140711.workerpriority.sql',1453226129,NULL),('phabricator:20140712.projcoluniq.sql',1453226129,NULL),('phabricator:20140721.phortune.1.cart.sql',1453226129,NULL),('phabricator:20140721.phortune.2.purchase.sql',1453226129,NULL),('phabricator:20140721.phortune.3.charge.sql',1453226129,NULL),('phabricator:20140721.phortune.4.cartstatus.sql',1453226129,NULL),('phabricator:20140721.phortune.5.cstatusdefault.sql',1453226129,NULL),('phabricator:20140721.phortune.6.onetimecharge.sql',1453226129,NULL),('phabricator:20140721.phortune.7.nullmethod.sql',1453226129,NULL),('phabricator:20140722.appname.php',1453226129,NULL),('phabricator:20140722.audit.1.xactions.sql',1453226129,NULL),('phabricator:20140722.audit.2.comments.sql',1453226129,NULL),('phabricator:20140722.audit.3.miginlines.php',1453226129,NULL),('phabricator:20140722.audit.4.migtext.php',1453226129,NULL),('phabricator:20140722.renameauth.php',1453226129,NULL),('phabricator:20140723.apprenamexaction.sql',1453226129,NULL),('phabricator:20140725.audit.1.migxactions.php',1453226129,NULL),('phabricator:20140731.audit.1.subscribers.php',1453226129,NULL),('phabricator:20140731.cancdn.php',1453226129,NULL),('phabricator:20140731.harbormasterstepdesc.sql',1453226129,NULL),('phabricator:20140805.boardcol.1.sql',1453226129,NULL),('phabricator:20140805.boardcol.2.php',1453226129,NULL),('phabricator:20140807.harbormastertargettime.sql',1453226129,NULL),('phabricator:20140808.boardprop.1.sql',1453226129,NULL),('phabricator:20140808.boardprop.2.sql',1453226129,NULL),('phabricator:20140808.boardprop.3.php',1453226129,NULL),('phabricator:20140811.blob.1.sql',1453226129,NULL),('phabricator:20140811.blob.2.sql',1453226129,NULL),('phabricator:20140812.projkey.1.sql',1453226129,NULL),('phabricator:20140812.projkey.2.sql',1453226129,NULL),('phabricator:20140814.passphrasecredentialconduit.sql',1453226129,NULL),('phabricator:20140815.cancdncase.php',1453226129,NULL),('phabricator:20140818.harbormasterindex.1.sql',1453226129,NULL),('phabricator:20140821.harbormasterbuildgen.1.sql',1453226129,NULL),('phabricator:20140822.daemonenvhash.sql',1453226129,NULL),('phabricator:20140902.almanacdevice.1.sql',1453226129,NULL),('phabricator:20140904.macroattach.php',1453226129,NULL),('phabricator:20140911.fund.1.initiative.sql',1453226129,NULL),('phabricator:20140911.fund.2.xaction.sql',1453226129,NULL),('phabricator:20140911.fund.3.edge.sql',1453226129,NULL),('phabricator:20140911.fund.4.backer.sql',1453226129,NULL),('phabricator:20140911.fund.5.backxaction.sql',1453226129,NULL),('phabricator:20140914.betaproto.php',1453226129,NULL),('phabricator:20140917.project.canlock.sql',1453226129,NULL),('phabricator:20140918.schema.1.dropaudit.sql',1453226129,NULL),('phabricator:20140918.schema.2.dropauditinline.sql',1453226129,NULL),('phabricator:20140918.schema.3.wipecache.sql',1453226129,NULL),('phabricator:20140918.schema.4.cachetype.sql',1453226129,NULL),('phabricator:20140918.schema.5.slowvote.sql',1453226129,NULL),('phabricator:20140919.schema.01.calstatus.sql',1453226129,NULL),('phabricator:20140919.schema.02.calname.sql',1453226129,NULL),('phabricator:20140919.schema.03.dropaux.sql',1453226129,NULL),('phabricator:20140919.schema.04.droptaskproj.sql',1453226129,NULL),('phabricator:20140926.schema.01.droprelev.sql',1453226129,NULL),('phabricator:20140926.schema.02.droprelreqev.sql',1453226129,NULL),('phabricator:20140926.schema.03.dropldapinfo.sql',1453226129,NULL),('phabricator:20140926.schema.04.dropoauthinfo.sql',1453226129,NULL),('phabricator:20140926.schema.05.dropprojaffil.sql',1453226129,NULL),('phabricator:20140926.schema.06.dropsubproject.sql',1453226129,NULL),('phabricator:20140926.schema.07.droppondcom.sql',1453226129,NULL),('phabricator:20140927.schema.01.dropsearchq.sql',1453226129,NULL),('phabricator:20140927.schema.02.pholio1.sql',1453226129,NULL),('phabricator:20140927.schema.03.pholio2.sql',1453226129,NULL),('phabricator:20140927.schema.04.pholio3.sql',1453226129,NULL),('phabricator:20140927.schema.05.phragment1.sql',1453226130,NULL),('phabricator:20140927.schema.06.releeph1.sql',1453226130,NULL),('phabricator:20141001.schema.01.version.sql',1453226130,NULL),('phabricator:20141001.schema.02.taskmail.sql',1453226130,NULL),('phabricator:20141002.schema.01.liskcounter.sql',1453226130,NULL),('phabricator:20141002.schema.02.draftnull.sql',1453226130,NULL),('phabricator:20141004.currency.01.sql',1453226130,NULL),('phabricator:20141004.currency.02.sql',1453226130,NULL),('phabricator:20141004.currency.03.sql',1453226130,NULL),('phabricator:20141004.currency.04.sql',1453226130,NULL),('phabricator:20141004.currency.05.sql',1453226130,NULL),('phabricator:20141004.currency.06.sql',1453226130,NULL),('phabricator:20141004.harborliskcounter.sql',1453226130,NULL),('phabricator:20141005.phortuneproduct.sql',1453226130,NULL),('phabricator:20141006.phortunecart.sql',1453226130,NULL),('phabricator:20141006.phortunemerchant.sql',1453226130,NULL),('phabricator:20141006.phortunemerchantx.sql',1453226130,NULL),('phabricator:20141007.fundmerchant.sql',1453226130,NULL),('phabricator:20141007.fundrisks.sql',1453226130,NULL),('phabricator:20141007.fundtotal.sql',1453226130,NULL),('phabricator:20141007.phortunecartmerchant.sql',1453226130,NULL),('phabricator:20141007.phortunecharge.sql',1453226130,NULL),('phabricator:20141007.phortunepayment.sql',1453226130,NULL),('phabricator:20141007.phortuneprovider.sql',1453226130,NULL),('phabricator:20141007.phortuneproviderx.sql',1453226130,NULL),('phabricator:20141008.phortunemerchdesc.sql',1453226130,NULL),('phabricator:20141008.phortuneprovdis.sql',1453226130,NULL),('phabricator:20141008.phortunerefund.sql',1453226130,NULL),('phabricator:20141010.fundmailkey.sql',1453226130,NULL),('phabricator:20141011.phortunemerchedit.sql',1453226130,NULL),('phabricator:20141012.phortunecartxaction.sql',1453226130,NULL),('phabricator:20141013.phortunecartkey.sql',1453226130,NULL),('phabricator:20141016.almanac.device.sql',1453226130,NULL),('phabricator:20141016.almanac.dxaction.sql',1453226130,NULL),('phabricator:20141016.almanac.interface.sql',1453226130,NULL),('phabricator:20141016.almanac.network.sql',1453226130,NULL),('phabricator:20141016.almanac.nxaction.sql',1453226130,NULL),('phabricator:20141016.almanac.service.sql',1453226130,NULL),('phabricator:20141016.almanac.sxaction.sql',1453226130,NULL),('phabricator:20141017.almanac.binding.sql',1453226130,NULL),('phabricator:20141017.almanac.bxaction.sql',1453226130,NULL),('phabricator:20141025.phriction.1.xaction.sql',1453226130,NULL),('phabricator:20141025.phriction.2.xaction.sql',1453226130,NULL),('phabricator:20141025.phriction.mailkey.sql',1453226130,NULL),('phabricator:20141103.almanac.1.delprop.sql',1453226130,NULL),('phabricator:20141103.almanac.2.addprop.sql',1453226131,NULL),('phabricator:20141104.almanac.3.edge.sql',1453226131,NULL),('phabricator:20141105.ssh.1.rename.sql',1453226131,NULL),('phabricator:20141106.dropold.sql',1453226131,NULL),('phabricator:20141106.uniqdrafts.php',1453226131,NULL),('phabricator:20141107.phriction.policy.1.sql',1453226131,NULL),('phabricator:20141107.phriction.policy.2.php',1453226131,NULL),('phabricator:20141107.phriction.popkeys.php',1453226131,NULL),('phabricator:20141107.ssh.1.colname.sql',1453226131,NULL),('phabricator:20141107.ssh.2.keyhash.sql',1453226131,NULL),('phabricator:20141107.ssh.3.keyindex.sql',1453226131,NULL),('phabricator:20141107.ssh.4.keymig.php',1453226131,NULL),('phabricator:20141107.ssh.5.indexnull.sql',1453226131,NULL),('phabricator:20141107.ssh.6.indexkey.sql',1453226131,NULL),('phabricator:20141107.ssh.7.colnull.sql',1453226131,NULL),('phabricator:20141113.auditdupes.php',1453226131,NULL),('phabricator:20141118.diffxaction.sql',1453226131,NULL),('phabricator:20141119.commitpedge.sql',1453226131,NULL),('phabricator:20141119.differential.diff.policy.sql',1453226131,NULL),('phabricator:20141119.sshtrust.sql',1453226131,NULL),('phabricator:20141123.taskpriority.1.sql',1453226131,NULL),('phabricator:20141123.taskpriority.2.sql',1453226131,NULL),('phabricator:20141210.maniphestsubscribersmig.1.sql',1453226131,NULL),('phabricator:20141210.maniphestsubscribersmig.2.sql',1453226131,NULL),('phabricator:20141210.reposervice.sql',1453226131,NULL),('phabricator:20141212.conduittoken.sql',1453226131,NULL),('phabricator:20141215.almanacservicetype.sql',1453226131,NULL),('phabricator:20141217.almanacdevicelock.sql',1453226131,NULL),('phabricator:20141217.almanaclock.sql',1453226131,NULL),('phabricator:20141218.maniphestcctxn.php',1453226131,NULL),('phabricator:20141222.maniphestprojtxn.php',1453226131,NULL),('phabricator:20141223.daemonloguser.sql',1453226131,NULL),('phabricator:20141223.daemonobjectphid.sql',1453226131,NULL),('phabricator:20141230.pasteeditpolicycolumn.sql',1453226131,NULL),('phabricator:20141230.pasteeditpolicyexisting.sql',1453226131,NULL),('phabricator:20150102.policyname.php',1453226131,NULL),('phabricator:20150102.tasksubscriber.sql',1453226131,NULL),('phabricator:20150105.conpsearch.sql',1453226131,NULL),('phabricator:20150114.oauthserver.client.policy.sql',1453226131,NULL),('phabricator:20150115.applicationemails.sql',1453226131,NULL),('phabricator:20150115.trigger.1.sql',1453226131,NULL),('phabricator:20150115.trigger.2.sql',1453226131,NULL),('phabricator:20150116.maniphestapplicationemails.php',1453226131,NULL),('phabricator:20150120.maniphestdefaultauthor.php',1453226131,NULL),('phabricator:20150124.subs.1.sql',1453226131,NULL),('phabricator:20150129.pastefileapplicationemails.php',1453226131,NULL),('phabricator:20150130.phortune.1.subphid.sql',1453226131,NULL),('phabricator:20150130.phortune.2.subkey.sql',1453226131,NULL),('phabricator:20150131.phortune.1.defaultpayment.sql',1453226131,NULL),('phabricator:20150205.authprovider.autologin.sql',1453226131,NULL),('phabricator:20150205.daemonenv.sql',1453226131,NULL),('phabricator:20150209.invite.sql',1453226131,NULL),('phabricator:20150209.oauthclient.trust.sql',1453226131,NULL),('phabricator:20150210.invitephid.sql',1453226131,NULL),('phabricator:20150212.legalpad.session.1.sql',1453226131,NULL),('phabricator:20150212.legalpad.session.2.sql',1453226131,NULL),('phabricator:20150219.scratch.nonmutable.sql',1453226131,NULL),('phabricator:20150223.daemon.1.id.sql',1453226131,NULL),('phabricator:20150223.daemon.2.idlegacy.sql',1453226131,NULL),('phabricator:20150223.daemon.3.idkey.sql',1453226131,NULL),('phabricator:20150312.filechunk.1.sql',1453226131,NULL),('phabricator:20150312.filechunk.2.sql',1453226131,NULL),('phabricator:20150312.filechunk.3.sql',1453226131,NULL),('phabricator:20150317.conpherence.isroom.1.sql',1453226131,NULL),('phabricator:20150317.conpherence.isroom.2.sql',1453226131,NULL),('phabricator:20150317.conpherence.policy.sql',1453226131,NULL),('phabricator:20150410.nukeruleedit.sql',1453226131,NULL),('phabricator:20150420.invoice.1.sql',1453226131,NULL),('phabricator:20150420.invoice.2.sql',1453226131,NULL),('phabricator:20150425.isclosed.sql',1453226131,NULL),('phabricator:20150427.calendar.1.edge.sql',1453226131,NULL),('phabricator:20150427.calendar.1.xaction.sql',1453226131,NULL),('phabricator:20150427.calendar.2.xaction.sql',1453226131,NULL),('phabricator:20150428.calendar.1.iscancelled.sql',1453226131,NULL),('phabricator:20150428.calendar.1.name.sql',1453226131,NULL),('phabricator:20150429.calendar.1.invitee.sql',1453226131,NULL),('phabricator:20150430.calendar.1.policies.sql',1453226132,NULL),('phabricator:20150430.multimeter.1.sql',1453226132,NULL),('phabricator:20150430.multimeter.2.host.sql',1453226132,NULL),('phabricator:20150430.multimeter.3.viewer.sql',1453226132,NULL),('phabricator:20150430.multimeter.4.context.sql',1453226132,NULL),('phabricator:20150430.multimeter.5.label.sql',1453226132,NULL),('phabricator:20150501.calendar.1.reply.sql',1453226132,NULL),('phabricator:20150501.calendar.2.reply.php',1453226132,NULL),('phabricator:20150501.conpherencepics.sql',1453226132,NULL),('phabricator:20150503.repositorysymbols.1.sql',1453226132,NULL),('phabricator:20150503.repositorysymbols.2.php',1453226132,NULL),('phabricator:20150503.repositorysymbols.3.sql',1453226132,NULL),('phabricator:20150504.symbolsproject.1.php',1453226132,NULL),('phabricator:20150504.symbolsproject.2.sql',1453226132,NULL),('phabricator:20150506.calendarunnamedevents.1.php',1453226132,NULL),('phabricator:20150507.calendar.1.isallday.sql',1453226132,NULL),('phabricator:20150513.user.cache.1.sql',1453226132,NULL),('phabricator:20150514.calendar.status.sql',1453226132,NULL),('phabricator:20150514.phame.blog.xaction.sql',1453226132,NULL),('phabricator:20150514.user.cache.2.sql',1453226132,NULL),('phabricator:20150515.phame.post.xaction.sql',1453226132,NULL),('phabricator:20150515.project.mailkey.1.sql',1453226132,NULL),('phabricator:20150515.project.mailkey.2.php',1453226132,NULL),('phabricator:20150519.calendar.calendaricon.sql',1453226132,NULL),('phabricator:20150521.releephrepository.sql',1453226132,NULL),('phabricator:20150525.diff.hidden.1.sql',1453226132,NULL),('phabricator:20150526.owners.mailkey.1.sql',1453226132,NULL),('phabricator:20150526.owners.mailkey.2.php',1453226132,NULL),('phabricator:20150526.owners.xaction.sql',1453226132,NULL),('phabricator:20150527.calendar.recurringevents.sql',1453226132,NULL),('phabricator:20150601.spaces.1.namespace.sql',1453226132,NULL),('phabricator:20150601.spaces.2.xaction.sql',1453226132,NULL),('phabricator:20150602.mlist.1.sql',1453226132,NULL),('phabricator:20150602.mlist.2.php',1453226132,NULL),('phabricator:20150604.spaces.1.sql',1453226132,NULL),('phabricator:20150605.diviner.edges.sql',1453226132,NULL),('phabricator:20150605.diviner.editPolicy.sql',1453226132,NULL),('phabricator:20150605.diviner.xaction.sql',1453226132,NULL),('phabricator:20150606.mlist.1.php',1453226132,NULL),('phabricator:20150609.inline.sql',1453226132,NULL),('phabricator:20150609.spaces.1.pholio.sql',1453226132,NULL),('phabricator:20150609.spaces.2.maniphest.sql',1453226132,NULL),('phabricator:20150610.spaces.1.desc.sql',1453226132,NULL),('phabricator:20150610.spaces.2.edge.sql',1453226132,NULL),('phabricator:20150610.spaces.3.archive.sql',1453226132,NULL),('phabricator:20150611.spaces.1.mailxaction.sql',1453226132,NULL),('phabricator:20150611.spaces.2.appmail.sql',1453226132,NULL),('phabricator:20150616.divinerrepository.sql',1453226132,NULL),('phabricator:20150617.harbor.1.lint.sql',1453226132,NULL),('phabricator:20150617.harbor.2.unit.sql',1453226132,NULL),('phabricator:20150618.harbor.1.planauto.sql',1453226132,NULL),('phabricator:20150618.harbor.2.stepauto.sql',1453226132,NULL),('phabricator:20150618.harbor.3.buildauto.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.1.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.2.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.3.sql',1453226132,NULL),('phabricator:20150621.phrase.1.sql',1453226132,NULL),('phabricator:20150621.phrase.2.sql',1453226132,NULL),('phabricator:20150622.bulk.1.job.sql',1453226132,NULL),('phabricator:20150622.bulk.2.task.sql',1453226132,NULL),('phabricator:20150622.bulk.3.xaction.sql',1453226132,NULL),('phabricator:20150622.bulk.4.edge.sql',1453226132,NULL),('phabricator:20150622.metamta.1.phid-col.sql',1453226132,NULL),('phabricator:20150622.metamta.2.phid-mig.php',1453226132,NULL),('phabricator:20150622.metamta.3.phid-key.sql',1453226132,NULL),('phabricator:20150622.metamta.4.actor-phid-col.sql',1453226132,NULL),('phabricator:20150622.metamta.5.actor-phid-mig.php',1453226132,NULL),('phabricator:20150622.metamta.6.actor-phid-key.sql',1453226132,NULL),('phabricator:20150624.spaces.1.repo.sql',1453226132,NULL),('phabricator:20150626.spaces.1.calendar.sql',1453226132,NULL),('phabricator:20150630.herald.1.sql',1453226132,NULL),('phabricator:20150630.herald.2.sql',1453226132,NULL),('phabricator:20150701.herald.1.sql',1453226132,NULL),('phabricator:20150701.herald.2.sql',1453226132,NULL),('phabricator:20150702.spaces.1.slowvote.sql',1453226133,NULL),('phabricator:20150706.herald.1.sql',1453226133,NULL),('phabricator:20150707.herald.1.sql',1453226133,NULL),('phabricator:20150708.arcanistproject.sql',1453226133,NULL),('phabricator:20150708.herald.1.sql',1453226133,NULL),('phabricator:20150708.herald.2.sql',1453226133,NULL),('phabricator:20150708.herald.3.sql',1453226133,NULL),('phabricator:20150712.badges.1.sql',1453226133,NULL),('phabricator:20150714.spaces.countdown.1.sql',1453226133,NULL),('phabricator:20150717.herald.1.sql',1453226133,NULL),('phabricator:20150719.countdown.1.sql',1453226133,NULL),('phabricator:20150719.countdown.2.sql',1453226133,NULL),('phabricator:20150719.countdown.3.sql',1453226133,NULL),('phabricator:20150721.phurl.1.url.sql',1453226133,NULL),('phabricator:20150721.phurl.2.xaction.sql',1453226133,NULL),('phabricator:20150721.phurl.3.xactioncomment.sql',1453226133,NULL),('phabricator:20150721.phurl.4.url.sql',1453226133,NULL),('phabricator:20150721.phurl.5.edge.sql',1453226133,NULL),('phabricator:20150721.phurl.6.alias.sql',1453226133,NULL),('phabricator:20150721.phurl.7.authorphid.sql',1453226133,NULL),('phabricator:20150722.dashboard.1.sql',1453226133,NULL),('phabricator:20150722.dashboard.2.sql',1453226133,NULL),('phabricator:20150723.countdown.1.sql',1453226133,NULL),('phabricator:20150724.badges.comments.1.sql',1453226133,NULL),('phabricator:20150724.countdown.comments.1.sql',1453226133,NULL),('phabricator:20150725.badges.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.badges.mailkey.2.php',1453226133,NULL),('phabricator:20150725.badges.viewpolicy.3.sql',1453226133,NULL),('phabricator:20150725.countdown.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.countdown.mailkey.2.php',1453226133,NULL),('phabricator:20150725.slowvote.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.slowvote.mailkey.2.php',1453226133,NULL),('phabricator:20150727.heraldaction.1.sql',1453226133,NULL),('phabricator:20150730.herald.1.sql',1453226133,NULL),('phabricator:20150730.herald.2.sql',1453226133,NULL),('phabricator:20150730.herald.3.sql',1453226133,NULL),('phabricator:20150730.herald.4.sql',1453226133,NULL),('phabricator:20150730.herald.5.sql',1453226133,NULL),('phabricator:20150730.herald.6.sql',1453226133,NULL),('phabricator:20150730.herald.7.sql',1453226133,NULL),('phabricator:20150803.herald.1.sql',1453226133,NULL),('phabricator:20150803.herald.2.sql',1453226133,NULL),('phabricator:20150804.ponder.answer.mailkey.1.sql',1453226133,NULL),('phabricator:20150804.ponder.answer.mailkey.2.php',1453226133,NULL),('phabricator:20150804.ponder.question.1.sql',1453226133,NULL),('phabricator:20150804.ponder.question.2.sql',1453226133,NULL),('phabricator:20150804.ponder.question.3.sql',1453226133,NULL),('phabricator:20150804.ponder.spaces.4.sql',1453226133,NULL),('phabricator:20150805.paste.status.1.sql',1453226133,NULL),('phabricator:20150805.paste.status.2.sql',1453226133,NULL),('phabricator:20150806.ponder.answer.1.sql',1453226133,NULL),('phabricator:20150806.ponder.editpolicy.2.sql',1453226133,NULL),('phabricator:20150806.ponder.status.1.sql',1453226133,NULL),('phabricator:20150806.ponder.status.2.sql',1453226133,NULL),('phabricator:20150806.ponder.status.3.sql',1453226133,NULL),('phabricator:20150808.ponder.vote.1.sql',1453226133,NULL),('phabricator:20150808.ponder.vote.2.sql',1453226133,NULL),('phabricator:20150812.ponder.answer.1.sql',1453226133,NULL),('phabricator:20150812.ponder.answer.2.sql',1453226133,NULL),('phabricator:20150814.harbormater.artifact.phid.sql',1453226133,NULL),('phabricator:20150815.owners.status.1.sql',1453226133,NULL),('phabricator:20150815.owners.status.2.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.1.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.2.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.3.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.4.sql',1453226133,NULL),('phabricator:20150828.ponder.wiki.1.sql',1453226133,NULL),('phabricator:20150829.ponder.dupe.1.sql',1453226133,NULL),('phabricator:20150904.herald.1.sql',1453226133,NULL),('phabricator:20150906.mailinglist.sql',1453226133,NULL),('phabricator:20150910.owners.custom.1.sql',1453226133,NULL),('phabricator:20150916.drydock.slotlocks.1.sql',1453226133,NULL),('phabricator:20150922.drydock.commands.1.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.1.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.2.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.3.sql',1453226133,NULL),('phabricator:20150923.drydock.taskid.1.sql',1453226133,NULL),('phabricator:20150924.drydock.disable.1.sql',1453226133,NULL),('phabricator:20150924.drydock.status.1.sql',1453226133,NULL),('phabricator:20150928.drydock.rexpire.1.sql',1453226133,NULL),('phabricator:20150930.drydock.log.1.sql',1453226134,NULL),('phabricator:20151001.drydock.rname.1.sql',1453226134,NULL),('phabricator:20151002.dashboard.status.1.sql',1453226134,NULL),('phabricator:20151002.harbormaster.bparam.1.sql',1453226134,NULL),('phabricator:20151009.drydock.auth.1.sql',1453226134,NULL),('phabricator:20151010.drydock.auth.2.sql',1453226134,NULL),('phabricator:20151013.drydock.op.1.sql',1453226134,NULL),('phabricator:20151023.harborpolicy.1.sql',1453226134,NULL),('phabricator:20151023.harborpolicy.2.php',1453226134,NULL),('phabricator:20151023.patchduration.sql',1453226134,14142),('phabricator:20151030.harbormaster.initiator.sql',1453226134,35726),('phabricator:20151106.editengine.1.table.sql',1453226134,8030),('phabricator:20151106.editengine.2.xactions.sql',1453226134,7392),('phabricator:20151106.phame.post.mailkey.1.sql',1453226134,18595),('phabricator:20151106.phame.post.mailkey.2.php',1453226134,1616),('phabricator:20151107.phame.blog.mailkey.1.sql',1453226134,19832),('phabricator:20151107.phame.blog.mailkey.2.php',1453226134,1389),('phabricator:20151108.phame.blog.joinpolicy.sql',1453226134,16415),('phabricator:20151108.xhpast.stderr.sql',1453226134,24424),('phabricator:20151109.phame.post.comments.1.sql',1453226134,8007),('phabricator:20151109.repository.coverage.1.sql',1453226134,1405),('phabricator:20151109.xhpast.db.1.sql',1453226134,1559),('phabricator:20151109.xhpast.db.2.sql',1453226134,599),('phabricator:20151110.daemonenvhash.sql',1453226134,39904),('phabricator:20151111.phame.blog.archive.1.sql',1453226134,15720),('phabricator:20151111.phame.blog.archive.2.sql',1453226134,534),('phabricator:20151112.herald.edge.sql',1453226134,13618),('phabricator:20151116.owners.edge.sql',1453226134,13570),('phabricator:20151128.phame.blog.picture.1.sql',1453226134,15964),('phabricator:20151130.phurl.mailkey.1.sql',1453226134,10402),('phabricator:20151130.phurl.mailkey.2.php',1453226134,1457),('phabricator:20151202.versioneddraft.1.sql',1453226134,8923),('phabricator:20151207.editengine.1.sql',1453226134,76111),('phabricator:20151210.land.1.refphid.sql',1453226134,19463),('phabricator:20151210.land.2.refphid.php',1453226134,833),('phabricator:20151215.phame.1.autotitle.sql',1453226134,21510),('phabricator:20151218.key.1.keyphid.sql',1453226134,14834),('phabricator:20151218.key.2.keyphid.php',1453226134,429),('phabricator:20151219.proj.01.prislug.sql',1453226134,21059),('phabricator:20151219.proj.02.prislugkey.sql',1453226134,16233),('phabricator:20151219.proj.03.copyslug.sql',1453226134,474),('phabricator:20151219.proj.04.dropslugkey.sql',1453226134,7782),('phabricator:20151219.proj.05.dropslug.sql',1453226134,20865),('phabricator:20151219.proj.06.defaultpolicy.php',1453226134,1358),('phabricator:20151219.proj.07.viewnull.sql',1453226134,16753),('phabricator:20151219.proj.08.editnull.sql',1453226134,13683),('phabricator:20151219.proj.09.joinnull.sql',1453226134,10924),('phabricator:20151219.proj.10.subcolumns.sql',1453226134,129879),('phabricator:20151219.proj.11.subprojectphids.sql',1453226135,26586),('phabricator:20151221.search.1.version.sql',1453226135,14029),('phabricator:20151221.search.2.ownersngrams.sql',1453226135,7390),('phabricator:20151221.search.3.reindex.php',1453226135,436),('phabricator:20151223.proj.01.paths.sql',1453226135,22387),('phabricator:20151223.proj.02.depths.sql',1453226135,28069),('phabricator:20151223.proj.03.pathkey.sql',1453226135,12562),('phabricator:20151223.proj.04.keycol.sql',1453226135,24719),('phabricator:20151223.proj.05.updatekeys.php',1453226135,463),('phabricator:20151223.proj.06.uniq.sql',1453226135,12857),('phabricator:20151226.reop.1.sql',1453226135,19351),('phabricator:20151227.proj.01.materialize.sql',1453226135,697),('phabricator:20151231.proj.01.icon.php',1453226135,3273),('phabricator:20160110.repo.01.slug.sql',1453226135,31556),('phabricator:20160110.repo.02.slug.php',1453226135,461),('phabricator:20160111.repo.01.slugx.sql',1453226135,745),('phabricator:20160112.repo.01.uri.sql',1453226135,7698),('phabricator:20160112.repo.02.uri.index.php',1453226135,437),('phabricator:20160113.propanel.1.storage.sql',1453226135,6273),('phabricator:20160113.propanel.2.xaction.sql',1453226135,7608),('phabricator:20160119.project.1.silence.sql',1458949998,6983),('phabricator:20160122.project.1.boarddefault.php',1458949998,11198),('phabricator:20160124.people.1.icon.sql',1458949998,38732),('phabricator:20160124.people.2.icondefault.sql',1458949998,1889),('phabricator:20160128.repo.1.pull.sql',1458949998,22133),('phabricator:20160202.board.1.proxy.sql',1458949998,48439),('phabricator:20160202.ipv6.1.sql',1458949998,87087),('phabricator:20160202.ipv6.2.php',1458949998,7444),('phabricator:20160206.cover.1.sql',1458949998,100217),('phabricator:20160208.task.1.sql',1458949998,75901),('phabricator:20160208.task.2.sql',1458949999,76774),('phabricator:20160208.task.3.sql',1458949999,72959),('phabricator:20160212.proj.1.sql',1458949999,70186),('phabricator:20160212.proj.2.sql',1458949999,2260),('phabricator:20160215.owners.policy.1.sql',1458949999,33130),('phabricator:20160215.owners.policy.2.sql',1458949999,31822),('phabricator:20160215.owners.policy.3.sql',1458949999,2122),('phabricator:20160215.owners.policy.4.sql',1458949999,1652),('phabricator:20160218.callsigns.1.sql',1458949999,68075),('phabricator:20160221.almanac.1.devicen.sql',1458949999,21535),('phabricator:20160221.almanac.2.devicei.php',1458949999,4841),('phabricator:20160221.almanac.3.servicen.sql',1458949999,52100),('phabricator:20160221.almanac.4.servicei.php',1458949999,2892),('phabricator:20160221.almanac.5.networkn.sql',1458949999,25134),('phabricator:20160221.almanac.6.networki.php',1458949999,3335),('phabricator:20160221.almanac.7.namespacen.sql',1458949999,23784),('phabricator:20160221.almanac.8.namespace.sql',1458949999,24935),('phabricator:20160221.almanac.9.namespacex.sql',1458949999,22057),('phabricator:20160222.almanac.1.properties.php',1458949999,7101),('phabricator:20160223.almanac.1.bound.sql',1458949999,62021),('phabricator:20160223.almanac.2.lockbind.sql',1458949999,2155),('phabricator:20160223.almanac.3.devicelock.sql',1458949999,59546),('phabricator:20160223.almanac.4.servicelock.sql',1458949999,60436),('phabricator:20160223.paste.fileedges.php',1458949999,6454),('phabricator:20160225.almanac.1.disablebinding.sql',1458949999,51136),('phabricator:20160225.almanac.2.stype.sql',1458949999,7061),('phabricator:20160225.almanac.3.stype.php',1458949999,2424),('phabricator:20160227.harbormaster.1.plann.sql',1458949999,24384),('phabricator:20160227.harbormaster.2.plani.php',1458949999,8216),('phabricator:20160303.drydock.1.bluen.sql',1458949999,35123),('phabricator:20160303.drydock.2.bluei.php',1458950000,5917),('phabricator:20160303.drydock.3.edge.sql',1458950000,41370),('phabricator:20160308.nuance.01.disabled.sql',1458950000,42980),('phabricator:20160308.nuance.02.cursordata.sql',1458950000,22163),('phabricator:20160308.nuance.03.sourcen.sql',1458950000,23991),('phabricator:20160308.nuance.04.sourcei.php',1458950000,4731),('phabricator:20160308.nuance.05.sourcename.sql',1458950000,47779),('phabricator:20160308.nuance.06.label.sql',1458950000,60679),('phabricator:20160308.nuance.07.itemtype.sql',1458950000,75701),('phabricator:20160308.nuance.08.itemkey.sql',1458950000,68184),('phabricator:20160308.nuance.09.itemcontainer.sql',1458950000,68630),('phabricator:20160308.nuance.10.itemkeyu.sql',1458950000,1935),('phabricator:20160308.nuance.11.requestor.sql',1458950000,58210),('phabricator:20160308.nuance.12.queue.sql',1458950000,80384),('phabricator:20160316.lfs.01.token.resource.sql',1458950000,11426),('phabricator:20160316.lfs.02.token.user.sql',1458950000,51183),('phabricator:20160316.lfs.03.token.properties.sql',1458950000,44158),('phabricator:20160316.lfs.04.token.default.sql',1458950000,1977),('phabricator:20160317.lfs.01.ref.sql',1458950000,18353),('phabricator:daemonstatus.sql',1453226123,NULL),('phabricator:daemonstatuskey.sql',1453226123,NULL),('phabricator:daemontaskarchive.sql',1453226124,NULL),('phabricator:db.almanac',1453226117,NULL),('phabricator:db.audit',1453226117,NULL),('phabricator:db.auth',1453226117,NULL),('phabricator:db.badges',1453226117,NULL),('phabricator:db.cache',1453226117,NULL),('phabricator:db.calendar',1453226117,NULL),('phabricator:db.chatlog',1453226117,NULL),('phabricator:db.conduit',1453226117,NULL),('phabricator:db.config',1453226117,NULL),('phabricator:db.conpherence',1453226117,NULL),('phabricator:db.countdown',1453226117,NULL),('phabricator:db.daemon',1453226117,NULL),('phabricator:db.dashboard',1453226117,NULL),('phabricator:db.differential',1453226117,NULL),('phabricator:db.diviner',1453226117,NULL),('phabricator:db.doorkeeper',1453226117,NULL),('phabricator:db.draft',1453226117,NULL),('phabricator:db.drydock',1453226117,NULL),('phabricator:db.fact',1453226117,NULL),('phabricator:db.feed',1453226117,NULL),('phabricator:db.file',1453226117,NULL),('phabricator:db.flag',1453226117,NULL),('phabricator:db.fund',1453226117,NULL),('phabricator:db.harbormaster',1453226117,NULL),('phabricator:db.herald',1453226117,NULL),('phabricator:db.legalpad',1453226117,NULL),('phabricator:db.maniphest',1453226117,NULL),('phabricator:db.meta_data',1453226117,NULL),('phabricator:db.metamta',1453226117,NULL),('phabricator:db.multimeter',1453226117,NULL),('phabricator:db.nuance',1453226117,NULL),('phabricator:db.oauth_server',1453226117,NULL),('phabricator:db.owners',1453226117,NULL),('phabricator:db.passphrase',1453226117,NULL),('phabricator:db.pastebin',1453226117,NULL),('phabricator:db.phame',1453226117,NULL),('phabricator:db.phlux',1453226117,NULL),('phabricator:db.pholio',1453226117,NULL),('phabricator:db.phortune',1453226117,NULL),('phabricator:db.phragment',1453226117,NULL),('phabricator:db.phrequent',1453226117,NULL),('phabricator:db.phriction',1453226117,NULL),('phabricator:db.phurl',1453226117,NULL),('phabricator:db.policy',1453226117,NULL),('phabricator:db.ponder',1453226117,NULL),('phabricator:db.project',1453226117,NULL),('phabricator:db.releeph',1453226117,NULL),('phabricator:db.repository',1453226117,NULL),('phabricator:db.search',1453226117,NULL),('phabricator:db.slowvote',1453226117,NULL),('phabricator:db.spaces',1453226117,NULL),('phabricator:db.system',1453226117,NULL),('phabricator:db.timeline',1453226117,NULL),('phabricator:db.token',1453226117,NULL),('phabricator:db.user',1453226117,NULL),('phabricator:db.worker',1453226117,NULL),('phabricator:db.xhpast',1453226117,NULL),('phabricator:db.xhpastview',1453226117,NULL),('phabricator:db.xhprof',1453226117,NULL),('phabricator:differentialbookmarks.sql',1453226123,NULL),('phabricator:draft-metadata.sql',1453226123,NULL),('phabricator:dropfileproxyimage.sql',1453226124,NULL),('phabricator:drydockresoucetype.sql',1453226124,NULL),('phabricator:drydocktaskid.sql',1453226124,NULL),('phabricator:edgetype.sql',1453226123,NULL),('phabricator:emailtable.sql',1453226123,NULL),('phabricator:emailtableport.sql',1453226123,NULL),('phabricator:emailtableremove.sql',1453226123,NULL),('phabricator:fact-raw.sql',1453226123,NULL),('phabricator:harbormasterobject.sql',1453226123,NULL),('phabricator:holidays.sql',1453226123,NULL),('phabricator:ldapinfo.sql',1453226123,NULL),('phabricator:legalpad-mailkey-populate.php',1453226125,NULL),('phabricator:legalpad-mailkey.sql',1453226125,NULL),('phabricator:liskcounters-task.sql',1453226124,NULL),('phabricator:liskcounters.php',1453226124,NULL),('phabricator:liskcounters.sql',1453226124,NULL),('phabricator:maniphestxcache.sql',1453226123,NULL),('phabricator:markupcache.sql',1453226123,NULL),('phabricator:migrate-differential-dependencies.php',1453226123,NULL),('phabricator:migrate-maniphest-dependencies.php',1453226123,NULL),('phabricator:migrate-maniphest-revisions.php',1453226123,NULL),('phabricator:migrate-project-edges.php',1453226123,NULL),('phabricator:owners-exclude.sql',1453226124,NULL),('phabricator:pastepolicy.sql',1453226123,NULL),('phabricator:phameblog.sql',1453226123,NULL),('phabricator:phamedomain.sql',1453226123,NULL),('phabricator:phameoneblog.sql',1453226123,NULL),('phabricator:phamepolicy.sql',1453226123,NULL),('phabricator:phiddrop.sql',1453226123,NULL),('phabricator:pholio.sql',1453226124,NULL),('phabricator:policy-project.sql',1453226123,NULL),('phabricator:ponder-comments.sql',1453226123,NULL),('phabricator:ponder-mailkey-populate.php',1453226123,NULL),('phabricator:ponder-mailkey.sql',1453226123,NULL),('phabricator:ponder.sql',1453226123,NULL),('phabricator:releeph.sql',1453226124,NULL),('phabricator:repository-lint.sql',1453226124,NULL),('phabricator:statustxt.sql',1453226124,NULL),('phabricator:symbolcontexts.sql',1453226123,NULL),('phabricator:testdatabase.sql',1453226123,NULL),('phabricator:threadtopic.sql',1453226123,NULL),('phabricator:userstatus.sql',1453226123,NULL),('phabricator:usertranslation.sql',1453226123,NULL),('phabricator:xhprof.sql',1453226123,NULL);
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
-- Table structure for table `nuance_requestor`
--

DROP TABLE IF EXISTS `nuance_requestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_requestor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_requestor`
--

LOCK TABLES `nuance_requestor` WRITE;
/*!40000 ALTER TABLE `nuance_requestor` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_requestor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_requestorsource`
--

DROP TABLE IF EXISTS `nuance_requestorsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_requestorsource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `requestorPHID` varbinary(64) NOT NULL,
  `sourcePHID` varbinary(64) NOT NULL,
  `sourceKey` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_source_key` (`sourcePHID`,`sourceKey`),
  KEY `key_requestor` (`requestorPHID`,`id`),
  KEY `key_source` (`sourcePHID`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuance_requestorsource`
--

LOCK TABLES `nuance_requestorsource` WRITE;
/*!40000 ALTER TABLE `nuance_requestorsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_requestorsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_requestortransaction`
--

DROP TABLE IF EXISTS `nuance_requestortransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_requestortransaction` (
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
-- Dumping data for table `nuance_requestortransaction`
--

LOCK TABLES `nuance_requestortransaction` WRITE;
/*!40000 ALTER TABLE `nuance_requestortransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_requestortransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuance_requestortransaction_comment`
--

DROP TABLE IF EXISTS `nuance_requestortransaction_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_requestortransaction_comment` (
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
-- Dumping data for table `nuance_requestortransaction_comment`
--

LOCK TABLES `nuance_requestortransaction_comment` WRITE;
/*!40000 ALTER TABLE `nuance_requestortransaction_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `nuance_requestortransaction_comment` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `phid` (`phid`),
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
INSERT INTO `search_document` VALUES ('PHID-USER-iamfox6yiijet2aeucts','USER','superadmin (superadmin)',1458950051,1458950051);
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
INSERT INTO `search_documentfield` VALUES ('PHID-USER-iamfox6yiijet2aeucts','USER','titl',NULL,'superadmin (superadmin)');
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
INSERT INTO `search_documentrelationship` VALUES ('PHID-USER-iamfox6yiijet2aeucts','PHID-USER-iamfox6yiijet2aeucts','open','USER',1458950052);
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
INSERT INTO `search_indexversion` VALUES (1,'PHID-USER-iamfox6yiijet2aeucts','fulltext','none:none');
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
INSERT INTO `phabricator_session` VALUES (1,'PHID-USER-iamfox6yiijet2aeucts','web','d1d9f850812bcd2d378ea7afeb1ce429e7b72be0',1458950051,1461542051,NULL,0,1);
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
INSERT INTO `user` VALUES (1,'PHID-USER-iamfox6yiijet2aeucts','superadmin','superadmin',NULL,NULL,'18e9fe35c2ef947cdbb28e7fd46e35f3','bcrypt:$2y$11$Qk2ISiDaSJY1nIV1q.UTVuWb2a5Uxm9e/wAfwbWkGZNDkWl9gpeBW',1458950051,1458950051,NULL,0,0,'','zznjdqj5hfgunazqtxmmxduqwjoaauik22szwo2z64mt6zdsrqexfytoxhxmts6mkcuiftyvet47ls7mmwtnap2uymcxi2abtsx4zdrhiippzyilc45fxclqafjdffbsjfzvpwnuhavcgcukyuzlssaccnukys2pro4vtc6vpg3pyigmmxktf6hqawny6prgbmtfs6v3gjq2zr7xvy6g4vc3jhrr5ty6htwyctyojo4gd5x76sbkfiffpfxrufx',0,0,1,'',1,1,'rmqz3qnyrnhbzlmsyki5pflvj2ed7ohiwrg5yludld7bnxpdosvqgoefqdml2fdm',0,'V5JLzFWF_QU3,https://phabricator-rofl.cloudron.me/res/phabricator/e132bb6a/rsrc/image/avatar.png','{\"until\":null}',1459209252,0);
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
INSERT INTO `user_email` VALUES (1,'PHID-USER-iamfox6yiijet2aeucts','admin@server.test',1,1,'cjvgtm5nxh6v7yuzqafstlsi',1458950051,1458950051);
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
  UNIQUE KEY `phid` (`phid`),
  UNIQUE KEY `account_details` (`accountType`,`accountDomain`,`accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_externalaccount`
--

LOCK TABLES `user_externalaccount` WRITE;
/*!40000 ALTER TABLE `user_externalaccount` DISABLE KEYS */;
INSERT INTO `user_externalaccount` VALUES (1,'PHID-XUSR-flkcx3klhhgs4knyoobe','PHID-USER-iamfox6yiijet2aeucts','password','self','bj3uurr5k2qk5c2dd2hztj57q6szzr6p','PHID-USER-iamfox6yiijet2aeucts',NULL,1458950051,1458950051,NULL,NULL,NULL,0,NULL,NULL,'[]');
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
INSERT INTO `user_log` VALUES (1,'PHID-USER-iamfox6yiijet2aeucts','PHID-USER-iamfox6yiijet2aeucts','create','null','\"admin@server.test\"','{\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.116 Safari\\/537.36\"}',1458950051,1458950051,'172.17.0.1',NULL),(2,'PHID-USER-iamfox6yiijet2aeucts','PHID-USER-iamfox6yiijet2aeucts','change-password','null','null','{\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.116 Safari\\/537.36\"}',1458950051,1458950051,'172.17.0.1',NULL),(3,'PHID-USER-iamfox6yiijet2aeucts','PHID-USER-iamfox6yiijet2aeucts','admin','false','true','{\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.116 Safari\\/537.36\"}',1458950051,1458950051,'172.17.0.1',NULL),(4,NULL,'PHID-USER-iamfox6yiijet2aeucts','login-partial','null','null','{\"session_type\":\"web\",\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.116 Safari\\/537.36\"}',1458950051,1458950051,'172.17.0.1','d1d9f850812bcd2d378ea7afeb1ce429e7b72be0'),(5,'PHID-USER-iamfox6yiijet2aeucts','PHID-USER-iamfox6yiijet2aeucts','login-full','null','null','{\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.116 Safari\\/537.36\"}',1458950052,1458950052,'172.17.0.1','d1d9f850812bcd2d378ea7afeb1ce429e7b72be0');
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
INSERT INTO `worker_archivetask` VALUES (3,'PhabricatorSearchWorker','31:1458950052:phabricator:49',1458957252,0,1,0,513338,1458950053,1458950053,4000,NULL),(4,'PhabricatorSearchWorker','31:1458950053:phabricator:50',1458957253,0,2,0,5588,1458950053,1458950053,4000,NULL),(5,'PhabricatorSearchWorker','31:1458950053:phabricator:51',1458957253,0,3,0,6968,1458950053,1458950053,4000,NULL),(6,'PhabricatorApplicationTransactionPublishWorker','31:1458950073:phabricator:72',1458957273,0,4,1,0,1458950073,1458950073,1000,'PHID-AUTH-yl5ljr3wjx5aehvbhb5f'),(7,'PhabricatorApplicationTransactionPublishWorker','71:1458950095:phabricator:18',1458957295,0,5,0,94321,1458950095,1458950095,1000,'PHID-AUTH-2nepldfmps6nbfb2zhvw');
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
INSERT INTO `worker_taskdata` VALUES (1,'{\"documentPHID\":\"PHID-USER-iamfox6yiijet2aeucts\",\"parameters\":[]}'),(2,'{\"documentPHID\":\"PHID-USER-iamfox6yiijet2aeucts\",\"parameters\":[]}'),(3,'{\"documentPHID\":\"PHID-USER-iamfox6yiijet2aeucts\",\"parameters\":[]}'),(4,'{\"objectPHID\":\"PHID-AUTH-yl5ljr3wjx5aehvbhb5f\",\"actorPHID\":\"PHID-USER-iamfox6yiijet2aeucts\",\"xactionPHIDs\":[],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}'),(5,'{\"objectPHID\":\"PHID-AUTH-2nepldfmps6nbfb2zhvw\",\"actorPHID\":\"PHID-USER-iamfox6yiijet2aeucts\",\"xactionPHIDs\":[\"PHID-XACT-AUTH-vledkhmneylb3vu\",\"PHID-XACT-AUTH-mktyewcsppvg7zs\",\"PHID-XACT-AUTH-np6tgbo4hyar3y2\",\"PHID-XACT-AUTH-cvtmuvzev3uptel\",\"PHID-XACT-AUTH-pecooyxfg74se45\",\"PHID-XACT-AUTH-fvseyi52a55zst3\",\"PHID-XACT-AUTH-2htcheor4n73fi7\",\"PHID-XACT-AUTH-uldyufm3aegn64w\",\"PHID-XACT-AUTH-d4ppt42im4szrqr\",\"PHID-XACT-AUTH-tonp726ca6a63yl\",\"PHID-XACT-AUTH-3iswqcaap7nsz2d\"],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}');
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

-- Dump completed on 2016-03-25 23:55:17
