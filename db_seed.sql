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
INSERT INTO `cache_general` VALUES (1,'KfK8e6XQsQaP','phabricator:celerity:/res/phabricator/8bdb2835/rsrc/css/font/font-aleo.c-7fvq7wpxrde1','deflate','­’Knƒ0\0÷=E¥,RSó­,šå	’ƒ‘1MPÕ»(eÅDağÃš±¬9qYê‡¿Æ¯K!ÚÄú(­ã0ºb‘ŸuÂ¤È~µn&¥TÇZ¥I£Ä(¬Iu¦Š´T$ó3ŸaF‰ê¶¼iT%ˆšô~xzì+Jm?Œô¾+7ûéyzxV½·ğÒq2Ì²ÂR·ZöË¬’†œqßóL”WÉ¹7g~,bŸ…®®©aI°Ä˜1ä	_ëY¼V\rşwIAÅq\Z¡‰¢şÌwÓjNÖm°ìï“qc~‚„\0½=¾r\\…y#@­4¹öˆ,£ĞppíÆÿ¬÷•™ú4Æ$[ã¤¡‹4 ¦Š{ûô zã-S¢ã`¹Ò',1460653190,NULL),(2,'RJ5XW2bhabPp','phabricator:celerity:/res/phabricator/027ba77e/rsrc/css/application/base-J__ZbJvSxL26','deflate','­“ËnÃ E%R¶Á\ZqºsİÁfb£Ø`Q{Uåß[µ‹”„,@Ù¡\r÷VË¸Y²8#é&ëŒü®ZFİÛëÕ2këÈŒn#î/Cğ›3_·ãÛ^P	\n¯Õ?’Ñá’I¡GÚ3ˆ(E6¬¥¢‰8M&DI \"H7m˜Ià\'%#Ê]îf˜hèûÌm7?Ã%ø³ğ—Ã?­ù=OÜMPÉÙû¡‘™d²VÇäÏX=†&ßˆç¼y’¢§×ìI0®dÊdÒCšK| …6ï¢4İ7#ß«KW¥@)Q³|\'ÊØ‰ªë7',1460653190,NULL),(3,'8jiSPdMasdo9','phabricator:celerity:/res/phabricator/b9538af1/rsrc/css/phui/phui-two-co-ZfzdOBm9T1iw','deflate','½W[‹Û8~ß_a(e:¬g&ÍÚP(´Ë.,}hYú,[r¬lIÎeÃü÷J¾(r|M†0–|¾sûÎÅ«\"-	GbFË,‚Îêö4Åa~‰`ü²ç¬Ì‘¾`<x“$I1®.AÄ¤dY°.N`” ‡ï#øîùÙ­ÿVkÿ1Ì ß“¼}Õ*N¯+„$Æ}“–tÖ¾\ZX‰L(£Zn!×ëÈ×­lÂr	ù¾WœÂê1¡çàá#ÅìÁ}ø†÷;ÿşmıë|Ç‘óïK\n¹}üíœEŒª“ Ô¢azÀ’ÄĞù‚Küàšg÷#\'ºæÌI69ñ<¯*(R–Äv‘7ëİXT—ŠSz) B$ßWÉv6*Q¯pÒ¹2ï>¿9ÍMÁYB(nÇ5¶y¿Ê¶)·4õœúg;®A„–-í$+F8|}µ£pãOù2\"TØañ¢Ôö…c•œK#êÍ(ë¿¿ö—è±A’7Ç—„2(Š	’iC\Z¿[{Ş[(KTïÂá.6\'û´ßxŞR[{p@9ê­ÅvÁß-waReß1+hş¶Ov[à¦{Ë½I·©BıÀ±TH§TÀs4¢3ĞEmL’aJr\\]ÙZ3¦`‚HÂò`7g ÿ]Îïƒ\Z­ÒË[CbÈT]d¡ñf®AãƒŠ¯m£G¶—†,\nÂ…qJ(º4c¹ê-f&¿ùôéóîóŸƒvõƒhÀ­ ¸š50Ö~\n\0¹j½!œ[f²º«Zw¹<J”¹/øÜfCSXq &ñz;^œs˜HKÜAÕCg ½ºoÓ ,4<Œ¸\Z¸’qP{ßè°ˆ[…ùéšúîfrG¿êº¡«Myjwòm]YK íQi^}G‹¡W„TÔÆÈnêÛ…%2ë€Es›ÅˆvH±%b#5‡—q)PQ|ADGÖŠ«ã½ŞÕ¬#7Ëëûµ»{ï®}Ï]ù³#°1¡ğv\\ŞI@+@”â‹&ævKò×±×¨T”ÌÇÑ$ÎÜÉ[cô³\n“^ç›mnÜ	Rvh×»	$>I¥\'fV\rW§:ì}˜Ü¦ÏÛ=¶ëñæéŠÚ¯)E°ùÿœĞIë˜rG%\\#Õë»\\°ŠZ»ª™Aı‹E}kÅİ\0ÃÖÌ5’\'¬;Í¦Úíqé*ÃY{x­KÓ2ûÊ&a•(ˆÔÈ1\Z û«Á¬\"=ô)»«Å-…äğĞå•:\0”©yv©\',%Í*¢š¸úNo§óXl53tr5l.‹ËLo2	-	2á0ÇÃ‰|ı	',1460653190,NULL),(4,'G_.240XDkwOI','phabricator:celerity:/res/phabricator/9cda225e/rsrc/css/phui/phui-fontki-hNxQ60x.0Uyr','raw','.diviner-document-section .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif;color:#000}.phui-document-view .phui-header-tall .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup h1.remarkup-header,.phui-document-view .phabricator-remarkup h2.remarkup-header,.phui-document-view .phabricator-remarkup h3.remarkup-header,.phui-document-view .phabricator-remarkup h4.remarkup-header,.phui-document-view .phabricator-remarkup h5.remarkup-header,.phui-document-view .phabricator-remarkup h6.remarkup-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup .remarkup-header{margin-bottom:8px}.phui-document-view .phabricator-remarkup h2.remarkup-header{padding:0 24px 8px 0;margin:32px 0 4px}',1460653190,NULL),(5,'f2R.vANEu3rE','phabricator:celerity:/res/phabricator/c7ccd872/rsrc/css/font/font-lato.c-Dj4S0TLFyL2d','deflate','­–Ín£0€ïû+õ@#mƒméaû\0û•fR$\'DÆÙ6ªúîIZE«dm\\8 lóøfÄ#v[¿D©áí|µiía•ı–¾Ëz§W{gïs}¾{–ÊµzXpyÍjƒª€Ü\r!9¼zp[iû|Ì‘Û!äxZ:Xï­t?¡ó‹9“ıºkÛ×Å·ïŸvn#ı}Æ€Yv;ØúÃ²Å«T.dƒ‚•‘Ô—±¼<.Ü‚ÔĞa\näãJAŠŠ«H„÷W	ŞíáoK+ÃÑT±”şÏúnœ8¯‡lñp”îÚõ³_mÇ{šêıÁÂyæı1MÒJ6„\"7=·^ÚVœkE…®©8‰ƒ¦Z‰Úh¦Bö‚1UĞªl°bù‰~£…Æã z†©vîNµ³iPi¬u`Çª³&àæÄLs˜I‡æÉ@‡ÊáˆLór¨5U’ªˆ%Lµ’HQ°ELşD\'K)kJA|9â|#çë•ª¡´nL¨HGhT¿LÊ7‡™†PNˆ5‚pšŸÀéPt,ÆŸ/ôN#\r-Jú¸ $ºÊ+¡€	¯íÒØ§)ô_qÏmô/',1460653190,NULL),(6,'u3PGH4Dj8lX1','phabricator:celerity:/res/phabricator/3010e992/rsrc/externals/javelin/co-ILq98pGCN3DS','deflate','…VÛnã6}ÏW8~0%Ø«î¾ÆáE Z,Š\0‹\0®aĞÑ¡I•¢ìfı{‡CÒ—XÎ>ÍÃ9‡C&«FåVh•¤­X%;¡\n½ËÒÖpÛ5íö*ÚvÓ-3W¥–…PÏ‹ŞğÚic«\r{áxóßÎš(¶á˜øáiæäù!ïi\Zo¥³ù4zÒ£Êú|³ª©Ë„™çfÃ•­Ói7í²•õq\r‡<.l²Ri»Ò&q;‚~\nqÛ›^rõlK0Ç¡2VUò5Q”“>ÿ™óôÂ® Eİô¬7D¨Ú2)IÚc[ò’m…6½ÆøI(aÁ! ´XÜİ_,èéçÛÛgDMjVğ‚®˜¬9*´r*×q÷µaµåfÁ·ĞK_|´­--tmÎ¢p/¹ûó„`õ‚E–2)nèõµÍÀrï=\0µ¶Cí;ˆv%³i{^Œ­¸ä£5ÌæzC-$~ù˜¿F£(e†³â5m}r&ÃÏ—™ö·á=_’DšŒÇBøøÖÒ#Ç‹©5¯h³¼¶2ûZñi—Cyeò_ÚæZY¡`ı6pí¡\Z¢#¥¤ĞÜIÛ=K]¼FÉÉw&\nJ€mk g¬~½†ê×ë[|,|½vüöºÙz=O€Äİ¾s…¨+,jqìñ;ƒÇ-uˆdµÉŞŞPá/A•^›¹ªÍ¥È_n¾Lêf¹öæK—FŞ3ƒßoÖ\Z±l,ïU&¤`–}Ú4µÍY£„“”B‡¾@kp?_¾3éx…lGueÔ;¾b„Šz”°õófz*Ä¥Ü®Ï¹>\ZísÀÉräö·åšçè¬«$ía›çùådş\0~—¿Á®ëÜ©âŠ-%¿•ïâÄugq˜i‹\'‰ŞqFë™sš{Şt{üÎÎpÚ^0$.~r~Â\'.#”íøsu”×Z–—èvHyĞ%D+2¾ÒÑgAì–ïcMgùE&¤XÊ(æ%SÏÏ9^ø+À_× ntSs˜™*ÊzËÍ^n‚wSùÿà(T…–Âè\nÿØ3,qN–œmyCºÊÁ\rÿV7y	ÜØø±ÑÛ½«\"Š9S9—ğå§Ÿn×ıÃö0B<‘È\n´µpå¢äö’\"°á’Ğ7ìÃ`]ÊÆ„°¨ãn9ğ\0È*èD)\n-ºòëôùg¿€<×:?_qXÅ1û¾ª“Q{Æ÷Äİ6“w1áVvÉ}%{’\\(ôW²WŞ_!t\0x\"~ {r£¥ŒíŒ½hu€\"º\0P¹g2ˆƒØ…ãåğhµ#Ì¬ã²Bãkot=?îÇ©ëOºá\'\'1¡ˆE-6„ŠGºàîÏâGLÃK†ãzƒQîˆŞ _×s½\'pV!!?ÍÔçø<šdàú3’ŸÏr÷í¯ßáu:¼ûÈäèıØSS‹5.Ö\Zs<¥p›h¢D¬‰-Eíè¥ƒ!Ü•ä–ÓAKÆäâ*ƒa\\fË€gG7ÍÎw«İµDeÁ8(ø\nOCü:…VŒóÔ¢ Gİ˜8¯·ÿüRç „_‰‡9¼ñöp‚ëßğ®EwÈAôt¶KÁş?',1460653190,NULL),(7,'YSH6x.tE1sxB','phabricator:celerity:/res/phabricator/82cefddc/core.pkg.css;-TJfpznEIJ_6A','deflate','ìıi“êH’0\nŸ_‘·Çúí©!ó ‰slîIˆ};<ÏØcÚ%Ğ†$p¬şûÕ\nZIòTõL_{»²ò$H¾p¦p}Ôó» ½î» ¼Ÿ´wS{×Ôw|W w~Ww}W\Zï–-¾K¦­¿Kª¨	è¾[ïœfò‡ãÉtÅwWyw…wîäº¦ñSgmY5¾?,VTCö?q¦-ˆöwàw—å4ñgôõƒ75µñ{ò!.÷áX,VüıŞœªË?ïP|¸¶è8ï<k¹ªi¼óªo\nâ» 2gÖş)™†ûá¸WMünø˜³Úğ‰\'ª²âÆ~÷û{Ò~jªó(jˆ¿\'p]å§+^ÜVSeã»&Jîï~7ı§gÑvUÕâ7®iı^³õ&~à¯™Ö9S~çü	}aëòö·¹(›âÛ²÷·÷ûÇ·µÈ½ÍDù¤±vúñüªû ü\'CÖ5ı?]Q;‹Focñ$şíışı°UV{wXÃùpD[•~ª-òAï¾k®ı#×½\'C\rÆñƒSõ»¨s¢ğƒcùƒl›\'Cøş¯îÿp?ünpÕık=ü`…ıÉqÃÑûaú£#i¦÷qıîğ¶?µ¿åX[d£Şª†âcâÆ´ğ¥øùhHü!óÇ4=ˆ\rëò»¥Ÿ şöç‡nŞ>Ì“«©†˜šÅ¨o‚È›6ö7|è“šiÿWnP$ôƒ?ÙÿÕ2UÃíßÙïJ€üÏ|M¿ï¢€ÿ= CAu,½~éÿ÷oÜÉ¹ş´LG\r‹Jê%3Ó_	úwÜºü°Ã	>yªà*ßaÈÿ¨Dd|şı›§ºÊ‡p²ƒáÖÄI7Ş\"¨Q]ÀƒbÁ“·o–rR?ü92>Îªè¥#‚L”%\nßYÉïÏO¿˜+úƒù—¿üHı¯‰¬íS¡«ü®Ø?cl@±ôds—,ÜpU|c}µÓĞRıe9ÇÇØßş/U·LÛe\r×‡®Zß*û7ä{ê÷·x€d\0€;±|WTAß¿Uç”´4)¨>Âoé¶CğìÉ5cháÇ`øù3ü–îĞh& IR)ø7öç£DqÑ>ª¤}:iš@ã‡p7÷úø¡¿ó_¸>¯ûà|–•£\"Ÿ­ø#u2d!q\'¡ÜD!\r„B©·Õ§ÓËw<à·—Ga€7¿ø›?øo¶Ì±ÿ¼ƒş¡è{Ğüoö-Û”¦ZDÀÓ–G\0Fš¸Àışí ^9“µ…ÉäONü¯0\"¡\'è¿Ä³Ê‹1³œís)×´?Ø)}„¬8 íÊ—®)Ëšøñ—©sğqŒW†à7©û$ÿ“ş¿¼ı¡VŠHçÚsU]ù®ú;Ê‡xöÛÌ¿RuV~@‚|Hª$‰¶_ÒgÍ…áÉ¿çÖEL—°SSÍCôüga#¼©ıNrü%pöwç´Ïı-?BĞß¿DC`í½F˜—Öf9=}¸Jü{¾—O’TM+áí“Î9¿Ê¼{Œ¼Á?|nÊ>*#~ÛÜûLä#\")Ed}N”~ï7h)Á8ù³â³6Ÿß2ÏÓÇÚßu§ª–?b§‹5ÄL³9¼›•Óïı©8YkÁ²ñqÖü–ïü­™l ö¼}ÓıåäO½ó?ùĞYçğşxï¯lYt³¯Ó€ü¹9„ì³1ı<?{ş$ş§FÍvCgU#ìì½@Ãgd–bÜÍ§kQ3-_ìmÛ/œïQ#;fÙê^\nûıÛŞç9á~ïÓI†VğI+ìÉoWäğ-ûÊ—ìR\'F{¯¬\n}V5Ó~añ¦&ÙtU)ø,şÌ(5ÃNe¦Âg™:¯ñG85ş ˜\0Y39Å“Lµ_ÆqíSÈlœL-à®ïf]—å•Ì‚£•ë·í^-‘\r–ƒÏ;œ“æ¦`À!rş‚àŠù ]Ğ§]‰5økH1–ÊÒäæú‡d³zŠí5B€¡TÄ«°¤«ØÅƒœôâÁM€ˆfı~ù²?G–&º)&¯Û´ü=+70Y÷EèÃ³Eÿ˜qğb€‘OtÒIÓ|òE#$ÇRˆ&Ì5MÍU­’ `¹˜ñ˜qà÷èdóÎ~‹8ÿíR{\"qGònú’[p@bCÒWYÇß¨“\"\'\'8A‰šÏ:#‘7”K:Å‡ùqÇËvÉ€øç.ıgnş\\Çõ¿qˆäÕF¿äl˜äû‡ï¾¤å7$¼«†urÿW@şÿñçÄéªû—ÿúùC>b¹\rjâ\0×Là’Ï@UáíşâQ#Üš¿û—Ï²dÛgÃşÂù7×|‹ø÷X²y«şâã“;<DÅ©ƒŠO)w	<Ş°ÃÓÃıˆjş‘&}(ãÅvØ`x,Î6ÍZÉQ9Àùäõ“¹\n6bìR’Lı#–æî’-j>\';ÇG¦€ì}ò†š˜r°®|h™¿w°Å)\0á&ŠÀ?çüôÃ/?“$J¾ÇUK¡s-¥†è\r›şóË6æÿ|ü3ÿ(ø[‘ÂB	ßqÌ—²÷oPB0ÿŠHËg41ş\Z°ÀòÄïØü‡’~DG”×¨ş÷Î7Ÿlƒ-3G`EV‚³èåÏšÏĞ-”e?{‘t§p¢ÍtÇÇÚ_6¼‘h—òßÿWòı¿~úÂ§¿V¾³šÏ­ş->dı\nü1ÀÇ©ıñqP\\]Ë<J}öÍmG¾td$ˆa†a­ßïÌ)ÜßÓ_\nêƒµVó©_`G ×àXà·üÑ&ÿpmßˆ6ğ\rtî¨FË!oêÉÏ/¯Q9‘Ïá[À7ø·§øˆF¡äÑÏ\\ç †%Ã´ˆ‚ÿ\Z[ÁpŸ`ÓjÅô³\'»ÏWĞ	«ä7™pq¿„Ya‘½Pæçëª¦•B¹²¥+§8He|ë®±xîóÅ$P²¾İ%Ì\"™Ñàå“WÅzğsË+Fï~æ{’ôC÷ÏUûKÿÍïÌfå\r(CVJTt¡ô¨ì\Z=Ú~ø™2Òê»´Â&œp‹\r¶\"¡†…‹ªò”6ÿ®à/ênã5ë??WÃ6QoİE×ÜĞEŒ;ÿ°b|ƒîª¾-=g”w±Ê\rB€œ+ Û¨óZì#˜dXPærŠ·`n<oÁO s+Ù£qª‰“xQ¦KZ‹Ç3œî²>¼±ßCáúg¬OÖåƒ÷|ñégº_ù‹|á·oşOtJş‘Õıj¢•J²Ínñ$é_0vè£óÁ¨&=ë>Şe5*Ê®å%êîÓŞ¯á««‚ ‰™V±Î‘PŞ¡¤ãùûíÜt×qG‚öÿŒ~D\\Ù‘§x~ÚÙçI6!¬ÔBÂ”tHæ!ƒ|V«]xˆ×B¡¦w!Á?Ä\'Ì\\ap»øY8ÿ$E\n{JùÙ­À7b¬\"m9D·6÷CÙ‡Æ:ntX6äóÑÜDÕÂBQİ@•öV…XX»™j(éÜ[D°Ø¦G8â$¹:,‹µ®°4àí1œ*§Æ4f‡ş”¿A@t }.êrÌ\r)aAe\0?é¤NÖ÷¹O ø‡—PF¢Oo³P~›õé½ìö8?MQ5Ñq’»_Z%×ÏwáÌy= Œû“\'´R‚Ä“kÃ°k)ÙEß£ÿ¿!¿½ºJş¼sEÆËÍUÈ|¹4_êÀÃª °èØÇ(å	‘<îx¥K8‹¤ÚN†W…“šğX2-¼~¡‰ˆùÿÌ5ÙÔ¢«İO!\\ág¾^jKVã{[Éàr§«Ì	lSíQrˆR\Z‹$÷“¯4ZqÚÉ!‘\\Şxö€5xÅÿÏÊ^ìY•ã+ÖTóÅí%#z¢Ñ(>\0ñŠmêb@Ú–CöÃqÙà²H_ı¬:\nD=%Š<üˆĞx%eFğ¤¨dšn\"•GÜ>¤ää„;D#şç.O‡ÚP -täôl…ŞÌ±r¦ô‚¹©‰Î]o±„m«Fh(ñ„„%„SşŸº(¨ì[Xÿçë/©¶ŞŠÔñV{¹;Ñ… 0»Ê†BâËOÅ\'™— gP}\\ô;>íºüÉõwJÍzs…÷ÊWÊ]4ød©Z\rWùY¢ÏÍyEİ—U™Bt§±Æ}ï+5ö(9¨¡(ú‰™Cî¼(	p‰ XÜlşLñG^Œ˜X×Ék¦#\n…ãl¸õ¸şj?ÉJ‚~~* T‹ËàDòöÌª\ZË©šê^?îª×ò×iT¼òLpQ•½€\0³GşZ\"l,ñ§ô»û~+5º©À2@£¨Í<ÙÚ¿	¬Ë~¿Ö-CöÁ;byWWädæƒlşãùR¡—rğ	ş™RÄÖÿÓZ¶§(<èlfíuw¶à  @íë!É]§©îædŸ[·İª¯m×3”ç5m\ZTè)ıİ^ŠcK­Oëõ©7BåN.h\nš)»Ãí@Û]¶@³\Z&»ãÎüJÔHgq–%yN$ÙÑ£G\"íqcêŠz[u¬\"‰Ô¦àvÏ.{Å–¡fŞ¤‹7Ö¤NÔ¤‹í ã!B!‡:2în‰·[Ëaï(œˆ8õl ‹î\Zi#²A{ÖŠËäE˜M\'Û°¨1Ál	OYînü||TÃq æËÕd6@©m¯÷¿UŒ}2ÏÿPÃo‡¿Û–Ç‹Æyuİ\rĞb¿a¶z·;X3]o¤ñ>_ÊûC{ãõúíÃeÄ`^_İ©ŠDôä\rq£9zTk\rø¾¾½­ç}}Á(£iitK©O4y\'O\rœÅ&­y8õ§µÖ\"ZhÒ1t<s™‰×¾ŒE¹>ƒ8ÓOoä½#w|D­ºK˜şƒºÆ¶†5Ãñ û³%JÛ‡¾,ËÿQ9É\"ıÇšƒçK`¡[GJë°;§&ÊÍ %pv7v:vÙøÔ‚¦x¿zWóŠzF±È@æj¹xœ=VY!¥¶ØHšÊìFˆ \\NÕ“Ú‚åX®x+\\ÑØÃP’à&”ˆ×M¾¦AI¤¯@Wàÿ~„\"_Î(2H)eÁp4S+h3°¿,‘¢ïæÉ—¸jÑ`96zŒ‡ènıºóº¢SÖLXçB9º`\ZU®;º7‘4İ” Xç-û$\Zûàöİló¡jO	ƒvbe{şqñ‰îK˜É™¸#¼¹_¢>,ÄWKñË7àä¼E·aQ›Ÿ•1?‡â|Vä“×éeÒà\">*uÜ†3“!+/Pœ¬ä|Y6eëgìéØ}:pŸŒÚgCöl¼âwŸRap§Åeû”«^UU-4\\1wŞ\Z\Z±E<$\"44¼¾ˆYG`õşhOcvW«¥Aáf¥TP4Ÿ{+Åä•kûyÎR|‰´NÜ‹÷‡1{iïãc™H·ùÎ*Ö?3\'éè8ım¹Ò’vr”‚á	ÿ~éWSˆóGàON¨š½¤ìIKî¡šÀ_ıi¼|$îHYÕ‹üÜ½g©9]²µ]_0J_Wgzhşƒı(î™e*‡mµhœn?QkÁÏvpÙÀûgëŸ©Ãèğ#ºn‹Ôá%‰/ßKß=Ìwv™{<ŞC²¢U÷Ÿ¡Îİ\06YÍ>ƒÊ§›§¸%N¹=-Ú?CÛæp	´çh¢a/¼úe%ˆÇd„şµºÌÛ·Ç“Ø;ç@”‘	Ø6Â79œÅ3Ê©ŒQe‹Râ5L|îÊ‹é«¬Hí”Tey>Ğâez‰©^Æ7µ¶¸\\¹~–¸©ÄEyÖºŸÄ€Jœ»Î9Rµ^ı³+û]RıĞÓÅä5Yå\'M.4ò,In%>„U\\«\ZHæUìâçÏup:ú—b½Ô=Àß·¡X¢}Ü=a7\\Rd!öÖiFW´Öxë)ó·°½€ÙGs”æÂùÍ.‡Ú[U] 5õ5Ø*¢Í¡¼x°ß\r +Ï7-¤EĞ@v@ÚhÏãğæ¦Eí>$áóğÑ]ß\'Œ²ù×ßşQPtfœèğHÁ©L½KûsìßKÇöå¾gnYãş>|R>¤)‡µ¬@f!‡&¥Y­õ£V|hñ$²Å_«dª°÷»Â»øî-²lZ$pt.§²ÒÌóˆßñöÑ’¶şıû÷d²Ãşøò¢âSHè»™Òn§Ü	+!\'‚W\0ÜwW°Tp6øe|B\rH¼gx².¢uQWEnqı^B„oee¯&JÙ3îó„Bè/CO\0Wvå¥Æ>ˆô\nFş±¤OOP}üóFhfû-UtXŞ\'Õ…Ÿ%†ƒñ´7¡f£ÙÊ[3¾ÂíJ¨4Z~•ë‹?ó%H9z»û§gG0ÅÈÂŸzP»ï/w+Mõ<±Å]Êæ÷W&·¤ŞPû#²Á/œÊÊ<9DMø?xÅ‚~Ò\\5³ØOJ%}RŒı›Òq\\2o÷	¼K|œEû\Zİ&nîH‘\n¾\nÏeıClâTM~ìHUºq¤y]‰l•§Š(ÅÏœ‰RVnHŸcâšßd_ğ(+X\Z?—;Jq®bi/õ·(ºÆC˜òŸ¼Ë…ŞåÓØí÷ª}ÿíÅ­¿Ğ|JØ)b›ì”Iw¾¡¢şä‹ïÛ_ô\Z,ÕÌ[ #Ç©îu!¿òt;•¬)¼\"Vùrª´Bäpù)97[¹»€[µÚBûˆY8ÏÀ~‡b¦Ç)èYÌØüıI9^ùCÀÏ£¢éÃ+\\DıÅSö\rwH™Ën<õàa[‚²şb¯w#\0ô\"Ùö^é¨ğöŒH\nhÅÅÓÃŒ¼ÂÛ3F‡’»ıÁkMg+åü·râKØX–íÜQÍqİj	\'bÄı	/]ß‹}°µ·h³ƒ*WHTÇg[ëoœq ‰œ‹GÌ€Š@\"ÑF±+õŸA|—Tè—’{¿3ôyŞİø:1ÍJÛód˜&5¥2ã™*]|¡¡7üYº¹}¤ëdÏ–xv¢¼2ö™n¥Dâ•TM5#1ƒG\"½v¶Pf#È,¤¼”›ÖñâE@ak¾|!ßm×CtÖQD_N\n~2ç#*.ç,\rÜ%–LSY¯OL„»ïEÆK7Ov Åş\rM±ç³n–İÃ>©Šè¸Äû8Ğ\Z\'æó@äü¹ˆÅ×í§Eäq);Q½Å÷Êe”ú ‚Æ#0@±l³OkÇ:†ŸT¾T;\\´%%D#dbéãLè4‘ŒØ—[‹È5}Dv‰õ\0÷\"ï_¨¾ÌÕÿtl3N-XAvù|´X?Çµj Ó\\l¿lLŞªÂrø§.ÿqô%ã3ùˆœ“ªtfµ“˜=/¢u<õT+–÷q´ ÁâVV03©€ñöM÷+*¡8ò^U&#Åt»opQ\0®\\´?GnÜB´?ğ¡P\rOôŸ£ò3»%Ï’[^‘%	ÍmBPåğeÚó¥™ošó¢‡+†9ñ½\'=Ó•R`\"P|\r³¬ñü£‡™MZlˆMñn E«lè>³â9†Ÿ7åí•ŠLEy ¾RÍé:ò8¼½‚Uğ¥Ò%;;åCş—º~IëB3Ê=]Ò_kÄÅƒ¿ÙıÌªË²HSEµš%·Ø¯÷Ã/Ÿ9\0„S”~œ›áhµeÕz¯µïšş×ŒB“4EÓ¹^ Ñ %UæŠóµßßFs.€ÆèGN *oÎ_¹ ’•¿fÄäã\nIÌoq±À§ı-/òT¹·\'.-å<¿°\"³ÂÏDò¢¨|wL~Ù­9#×§ğJÎaK˜’wùŞ——J\"	øÌ_şëg:|Ç³}ÿ[Îßx+eœ’[3£“à=¾^ê”>¶ø2€êwş-M³èû÷=ázÑö£w½QàÑ[óØbpåöÿ‘¨ş*ıËVÏ,ÍaWêµÁŸœÀø$Œœ›DÍËJ9Åág“Ÿ¾çJİ{sWşá†6Ô½÷C­4[óÃ)sÁ}Pø\"\'kL–Ÿ€ø×pŒ¿ÆÀóº_t—€Üa7î\'º½µÜw;·AVÕ/yûºñ¢–½RÀGËC£hS²Â«¦*®ïOùCG•9H5Àx/x·XJ¯\Z†÷KP~j‡P^£ü\"+Sæ”±è)œ¯Ú‡”èªÃY	­‚~¦l³*¯¨LÊº1¾mªŠ3„ûU†^†ÀGhºõ3z©Ğ\"k®êÂÒ±ôf,_%—È§\"PbkWn	´}YóÀË—[¾±Z6¸U\"!••V\n¦Sy”ªÏböÁNoÀ[´İVø“Uv¨ä´ÒÆÛÍ6õ»«”Í\\ßJD›@$`Utş}¯z‡Á©|šğ¾:ÙËŠ²€0•~Ò%‚)#|‹·Á,›Û‚ñN¶…)-‰_C™c…d¶~ä%˜êg>9‹¤—Ã° \ZÌJÑ¾ùx]‰¥¼D:K¶7\'ëïÒ—‡$òßÛ„‹dŒˆ\'7`YšxV\rJífa­ÔMrÊ{ÅWŞTãU°oµWa‡%sÁ%_lEy¥%|QáüJ3Š¯µ–,éL9c	hY’`È™]\'âÜÕ{ÔóêÏø¶ğ-ŠÁš¹ğK.ªñÖ‚Ë;g\n]UØ?|·É—ø®XY®ŒŠÒşzsl2¼^+3óÉÌÙ·py—oVBô²Dˆ//­›†õVbuU»~ÿËÈ4XŞüË{ğ&Ä+w»SÉø\Z˜ÂÖS	÷$øsWİc%UâN\"wßµŠ¡¤ÔâĞWS„ÖøZŸÌç:ÉúÇ‚»P\\=Èa˜ÛŠaC¶Ü!<Œà|hÎŞñ¿ûk´}DûPtâKÉâŸ{wº¥Àâmãg®ßÅx\0¹SË—\0Æ¢ÄfdÖQÅwŸÂøÜù@²‚Ô‘\'ÜêãIMX`«jÚ?l1¸)Ê§)‚.—:­>ïOëÀÃR%º¿*Ğ†¨ØôÖXŠŠí2ûÆ0êúåø×Do®rÒ¹· ¿ÌÃ\'ªéZ.‰Vã	“NR¤—äc%HğnÚ7ı{\nög3ëäsßT0ÜÀšâgq Òæ<¡.£ªYå[T£Š£Go‹--¼ŠrÊô³¢‘´“Ò–=q~g*Ôq-*Rn&\\-¼øgç¨ÌçÒË½h…‚#\'„N˜E÷šb©·¼alÎœ¡D7_ğÿ(Qx¤¯DC3íä\"Õ<ˆ†¿\\ìªkŠ\"KNñë<w.…üÒt¶¯@d©˜V>üŸÃğs©X­¿ŸY;Û.º¶ÊW*(¡0g`¯,†×èf:$ÒL”=•±›Àhq¥£ËÿHGM{«ÕNO‚­VFj-×ãÀ0|OÔø¬qÓW[¬ºƒË7r¿`O_à¥MESVp÷ØŞì.UÅ@*Bj¾jVëµJ ¹šá§ŒäSÿæÄ#8¶z‰´ôEm Š˜„§§?—Ä è\'ı@GùŒï0£eX?‚¹hc1å¤ßK`|9~D°Ÿ|ÀáúLf‡óg‡/ÅğC:Ñ	*‹‹ˆˆçµ¬ÏAnŸÔ)‹Í’8ŸÃÁOn|D4øI:Ä6‚ŸçKçñ\\ğSæñ6Z6ş©+¹rM?Ä\naË‘Q}QÁ\'ÎüàJ¼ÿ“³bãŞ?Æ`ì)ÈÒîÅqKŠ€K;Cªê£,ê‹³j±Ou0467şB¡(•¯ü\Z5\'¶<-%ü\\*MìäJLB‡åî-Rû_ô>¥pƒbßğG™ĞOõ#ññœóf˜7É‹D\"€0Š]TåeX±tùXÙÕáóÖŸ	YJÇ­Âµ|ZÀ{ÆÇèş7ÑÃä+ÕKæbif¾§C©çİ¸`àsD´—\\¾‡.Ø¯)¬-„B	ÑÿŸ›ô¨:Õ+ÁîIÅfºÇii%ç\Z!?q‡›ø_3¶qfC(k\0‰Wâ½!ˆÑşşµÒ‰êŞJ3¾2r°ÊAÉXfÍZr>{9ëµR×ğhô^j,¾ÅyR4ºD!\'àg,Å\"ë©R¡¥pèrŒ&òkH×|Ë$¾µÊJFÒpn¨R’ÒïŸYÃ¥j®ğM’ÇªA¾ÌÒ°°Ïæ$PBœœ0¿¤É6)ÑwáF*çQZéÍñ)×Ç€Ï$º¨(›Ÿˆ,§ËüÃÈQèÖú3i(‰1–Šå_÷$İÄk¸¬FØÔ¢M9B”óãÜRûì6=1\"¬8ÅW¢òV9ğá9>ÖóU…6(Ä_Ní\"Ùğ¹oOL\"^n5}FWºO¡õßjÑŸ<ÄL ã_\ZŠ2Ÿè„QCıÃğ2Và9×BÎ9úƒXe\\‚W›ÒÔV\"lz™@¹8O{\ZÄ¹\r?Aêgù\Z±à§¼[<‹¬öóùğàWÌÈ75oAü‚¯¤Ñ”D¼¬ÂÏ•fNEol‰õG:İÉçXø ÒË¥á›ÒµÑám5ãf»è¢U1DÂïiW\\-h,bšnóIØ<Q¥“l›?3.ÁßPPÔx>Õø\"§È¾‡ÿ~Ê«¿¥8`Tfú(7JÔÕÂ{yõtÖO!>6åÆ©9}ú­‡•‰†fşåı/T˜G—uü…‹*[_¼\r§\Z¾dé0Ux\nşAL¡¯bújs9o½Ü\rÀk€rv38\\^N-\Z:=D‚BF8\0ÿ­Üé§\"™@V.	ªVŞ‘Ç@ø]9\\E¼°Q:³Ò>–hGb%Â¯NpÙß-[üYÑ»Š…VßÊ˜v?ÚhLù{ú›×Í°Ép:K=2Ë–¯-¦ñJêWÇÏuîÔ}WXø>ë(øÛ£±ï_QsY~İ\\Š\rû	> Ü HèÓ©Š\'¼Vy™€\'íQ?ôAcŠwŠşôò?2+;\níò5ÜÁ™ÏÀ‰¼\Z˜X|âS \'+ˆ…æá|à)ŸP_„ñÛÔYãÓÙ«…FÜ¡\'yğÔI¯Ãàaà‚éŠú§ûÓ\'°NF\ZZ\ZápkNËS±€ü+íeï!€SñŸş¼yš]àE:/ÌdÅ0êåTÔËƒµ½B½ÂÍ¯	S_!¯NZL\0i±*ô;-­«©Ás#ğïxB†¹R)ò\n5%Î#÷ª\n˜çf)EK¨Î¢ÚHîı¯‚=ƒ §aŸÁ†ŸÀs3eaÃØ— #Ï 7\nĞÓÃBŸGŸGÀÁ4tü3àgÀ3ú\0|÷6)\Z\nÇ“éŠü85FW{9ƒş¢mLfáãJDÒf¥YügÈ½ıû÷ o•Ï¨Tí~ÙñCûYít/ó(„\"	ˆ¡ïÉ¯/“|Ñ_Œ©1x*¤jZÅûÚ¢¥]£\0ÏP%^~z×h¾~Z àˆ¼ŞY¹ÂE±Ä5wé‘39-EEÕåGû–m^®q¸‰´U7«ªuØS`Ë”ª“uİˆöÂ[ñtnÕTÈŞ2 Aê¥0°xñ9³STBdµ%8LşĞıbù)(AH,sR#$Fê¯§àOÆÁ0½”eÆUêµÊÏQ“Ø\n1ïÆlèªh¸«iéÕ;çüÉNlk<=­@é)Ïä\n¹¾ı1fE6¸Rÿ¤Á8—Æ/´)<ä®Ñ	OÛ,\"ûB«qÌÎ2ËÌ†6õU]ÇóˆxöKÕã!.­\\ÅÏQà=ùıUñólßBu×§æñ¥¤íš|&bzìK.!r×,±¶»‘Nzô¥?ÔlwEh%bœŠÎy…g·×Ê­\'hÑ ·\nKÕü1¨àéñ^\02Õiày—ƒ\nšZ†C.BJ©ªúşPÔ4ÕrT§Ä‘¬¢mQçüSä]ùQå˜ğyÍjØÏëF:·œ	ÊÓŠ!ÆØ–„ìLVI‹ÙæÓf§ÈuÿB*2LÏÄDyª	¯7•_ÊS¥&¹ÂËå´i^NÅæ~g^½eãÅÎé²]³#Ö\0\'ÂøõäªS\"B×‘6³$,ŠŸœ;›\r?Gğí ¿6/B»Ël;“>;Påá~î²=Vû%b\\ö¡1ü¦İ6çÛÍ†\r¸{Ş-m¿mº‚;i¢xŸÜõTŞ÷è‹«Nh§µ7\Z-ÉšĞX83@]_»+ı|Xs+Ø3.|©Ñ5¸±m‚ãÛö†7r·í¶ãWsj·Ónæ¢u¹ĞTŸn;ê@ëKØöå{‹Î.Vìô­)iuàééˆa=\Za’°Pğ:wpdzóÎÓ=r›ÜàJhëıµ~À©–·€õÙ«Ms^[9œ½TÇ§éæÖ¼Œ,g|nÙ\rĞé÷^ÖYz{!Z3\Zhí°&ĞÄúƒ›CâÛîíõH»ô–—÷7g1b=Ë\0‡ÎûÈiét\' ½cÄÖ˜$D…3-‰ìõg-ª§/w\'R¯1=qŒ²3@ÖLs0»¡íMr\0VòYDåA×¶ÆFûTÁ!9E`k…Â#MPDGaK¤c,Ê%ê½Ş­´f¼tSûè¥yœĞX*Oâà±°ïÊÃåøL-wà–¡©ù¼£/&óY§©™‹BÒ‘F{ºVßÎuB-ø›\\£Tïì/\Z=[Š‹%>\'.=iÜ@PqJ·¶¬5º1³Ö¾X\\§ímO Ğ]×©Aë½aa†B-mXŞÖ—m`êQÒœ{7¢\rÕö·²V\'İaàªËIİš×\"…a[’oV[>/Í\0siÃ$B\\Iu>™Öm­×É•L´n]›s›{­‡«†ÖÚ‹ÃüÄèõ[È9ï	_`\na^úÔ½Õ×XBY@ÃÌe@JI\"˜ÜÀJã bçN·\Z%¢©°*}ä¤©áó BÏ”%øKPR¢Ä³`å\nôĞ0&[?e”òy¨­´<‘µëHnŒ{OOªe˜”zÖ§¯fó†#OOôå-y£Û´½ûÛİŞ<8‘–AM©EX\'\n¢3j…ÀP+¨ùÓVw!:úö{u¾\"©n%Noÿş=Ì\ni,ŞLáJ¢ööï|ŸÍÛÿı‰æäõÏcÎ#ØdZ”èjî!„¦*å¯â¬I¥ï‚k³øE6SÊ€ç5¿=-†_â¨\Z:qTö0g(—¶3mÖÅŠXñyâ/»ú¦N³õÜeŞ*Dîî9­âĞ;ØÀß!¸áóCü·\"” aÊ3£è>ºÜÙF(“‡ğK&$;S_œú(JıÜKŒ…3ÃhLÓ†å\0ªÂÅE\'AÀ?Æ¿ß@´lS@òVv‰uOè‰÷3w¬\0¸tŸÅŸi7Ê²ÑÔ?/\Z³şŠ´éÍ\Z‹oP“EñÏ¤îU£æ»F€çS†Ş#>ö&Q2ŠLtà¢pŞf?iü¸d2=‡½æ}hãËÜ{)I•5±ài›/\rMb\'–ïó§fIUñ:òC_8)…–éÑ8æSEbÍıJîézd£Èo‹¢ñ¡†#%ÉÖ>RææáçøîğnşúPú‘ø ’ÿ•Û½Cw‹òb¾·´ƒ\\‰ŸZğ“õN‹ùqñš*·t–·MŸ…ÛfrâÏ	\\aF¸rebPõ©˜öĞí°g\rO¢Á‹‘3ú+:E%ë\noV™²¼&²vF±êb4µ}\'^×¥a-ISŠHfŠc™6ó*f—Ãş¼,•JŠO\\Ù®VğL/ò(Fa~{Íï„/Pee§2”RQÈ—|Ê‹exê·$îWÌ‡ÓÃ‘ÄZ|©f•cQ˜]ô%å{JÇgM¢Ô|XüåAVø\0À.ÁLòf`¯ã–¥	N¼J\"¾ÿJÈÇOã‘%KËc¾g1ŠnµJ‚¼¨…Ë»%W_ÄÎ¯cUåĞp+T¼p(Ày%áXWÒ\'ÕB‹ƒ´I¹àƒ¦}±?s!‰ÙÒ\'Ù\'^ÁæåIÏ½\0ó©iú®%òf}ØŒ½=qyyÿJá/Ï’ÖSŒ,àZ§S²hY Qx\0üp1í‘*˜³Î1È`üóY#ä½êEü\'úÛßeá\"¨0ÒÉ+UN™@Æ¹>(šVfø\'ñ…’|Ùo¼^|9y\'Æ\\G(Ôq”ŸOfÅ)–çŠŠø:PñQ_çrÇ·Ñ@Á’æïHd/¼5ÎˆgµøH~t„šHÌıÔ£IÂ…‡bÿ35jD-Ö)T9ÇşP Êo‡»ÏA e3Â[Å:%ì\"ÊÅ‰ã¬{Ï„h—QÒs·8Âüc00\0\"Š`¤\"˜Ë£âÏKqÅ©åNİÊˆ^lUWŠŠ£ÛVµ{üFÙ’i‘ïæ¯\0”Í›,ş,>»“w»¬FzexIõQ€(móN¥8€—B°>kÂ)Áúô€Z^ÉMÏm«Xà¸€ÚÅ·÷n%}¾À}hA—Ğ›ö˜ŒÒ1Œ†E§—2ô^ıWdXâƒaiÚQŸ±3›óşOBvI¶ä}2¡‘ö¬´È5.rõE=Ó+-’pD985”–àâœv*o%é‰jªl–9ÇEÎªé‹A‘Pˆ6íkéÆqlQíàÄø–¯}gœ~Há/ê^‰·¡à§¤(€GS^5«€¹j„zEí>‘UjåØÑòqJ-‰LzÌšš«Z%¡tîŠ”pš©£\Zå¡wò6ÿñQ£Y\Z\\şï~Æj?y8,ÈŸ&Ê•FèßYÉ½ø^ŠÑAßşòUšÄ.-“(ÔÊ‡xö+9%aQÒ—Y¿e&ùqçäƒÎœ**Ê¼{”ºø@sª¾M\Z‡ü0ôD \'©F\"*]Åúu,Òzä\0‰È*æ9ãÜME9ãj$\"­š97¥‘QÑH?GâÇ¸Pdş²·\"¡cLÌ²x¤I’ÆÊá‘,«…-¦U¼òÍ¦««€\\Ô#CÄ\0üS…«£´(Z\\Æ\"L™0_À<9³ }B	5ˆÿ“&æøaa€½U›^ÖOhS€ >0Lï•Aã8bG&an ZXêìx¤*û]Ûf¼eOA•¢Tn9;±ëx@•¹>_Óûƒ>ª¯kÜ+“©…Èm\"ÖêâÍÏ3ı2Öİ	Ü•Dc:0ø·h—ŸJ3š7–ÀáLccï¦×Ô\r~ê/ju©™D«ÓéËÌàæùç_·GĞ2š˜8YËì~ÏPÃØFÏğ¤0ö&·¨‡u<‚Ñ;òa$Mù¼3qÍÙÆ®ÍD÷Ğ¹³ò,Cœ+ÀŒR½ÆšB1İ<Ã[îŠÂr\\ï\"=¨¦°ê‰1Ú:y:O6½A}iÎ¤ëÀöö8°[{˜^ã{´ÖhP§(´¼N{‚€’âØ…p\näLÎ£êãPi—yçèaB™vo~£`\n9’ğF&	¯Iu=Œß¨]¶·S¹£¦ª(Éé\0EP@¤kÇQmíÂMYWñÛzO\\ëËÆpwİ¡ÄöÒl×¤²hµŠG^É5)ŸGs¹µX-ğ¼8ìÚ›~>\\œ9 Èıf|›ËPãêøB›]/ã#Eµ\rOUüi}e´îÄ¼í‡SÛÓ ƒøKa°•û:İàĞÚ•—7CŒÛKí­\rBğw‹<2\Z\\û¶ ˆAW>tGâ¹á¿\nİ®Ãèzw^câ]ÀıfwfÀVå.#|}› _[©[q†²½£1”/¢¹3\ZòDd—ÊÆ»¸°ZÛ­¦nki.lì(Ò·NÛ¦\\l£sn\rk‰ï‚€:¼´¡6Ùä§‹&Ó\\›ÃİViŒ ´ÁhaÊÕ[¼#ˆZ«ËĞÓíAòzjh³ŞRIcÙï\0¦‡ ³Ã0çÒ­5™ïE™‡K}Æk–‰nz0tÕÔª¶œ6o[æT·”)[öˆV×¹	rîÇl­¯ÔR“Ö	bï1´ŞÚ;f/\\¬óåj2 Ô¶×ûß*ÙøÅt!m€f.š©œt>ÌÇ‹õ•Á5ŞnİîñvÙ‘tSœvâ¤9Ãç-„ñêÇ{Ïäâb\ZòlÖ‚èÆÌdD‘]\Z˜)ÒĞëgË¢q´\r±ó;œÙ^Ûò¶ã½\0í´óù¬)Ûß½Ü “¹tÎüFà»şqŞÕøërË/å>c·mGî¿Şœš²™í›ı9æ,9ø2éûVm¿…Í8]86>ô]ı`oÇá^ÉÛUk<³‚&£-Ëúfi¦N¿lg8³ìçóÅŸì·ü™iàgf‰,ñß!‰ÈvÃ‡î‚¡Ö¬s<a4ÊÍV˜ná@\r†í™®Cüe¾íÊUGÚ^ûrPÉAR°Ö»á“5î<š!7ã…µTs%\r–âÉ¶%bîö:jë8ë7-kæÊ­¿¥\'KÚöÛÉ¤uiõ»Œt™ÊİCc(Œ¸±k^Û(\'ûÄô6ZZ‡xj#äy×™™ñn‰í§²\'K›ã©yòø…‡nÚæåj’TËrgh±î.üö@b:’êÜ­»Øa+q˜±İ\rPE¸[Ğ»íëq7\\‘ìŒ\ZL­>†÷#àtXò¬ãQÃÉñf\"8´ÁdÉ‚Võ>\".°Õ–oßÙh‚ĞÚŸM‚¡­hº·ìƒ˜ÊB›¦ÄL	AlbÜ›£1ÑF-¯sß”Õ´{º÷ªÙ;puˆói2ì›ØFëÃ›p=HrGÆ\rÌí\nºN:Vı6o®¼ØRn:Òè»òÎæ“­ÌOë~c½:ÚğlÍÓ5˜O‡ı«ôPM”m®õ8Ó°FÔØhÍû¦½š[vÊÛéØ3İÖÄĞ;ÀnÔ‹š¾Ô”ñlï±³kğíúUÇIRn5Ø1>]\\÷¬E‚ìÏ–(mú²,ÿÇ“¥ıC-ıC;µô]³MÓŒ$,oµ­ØÃ«£y»·“ƒA)tì3çˆyMíãkuùí0Ã˜d¯=­«ıö¥MÃ=ºPS#Ú$E[¼yØÁ&ëÎmº8[˜µïZ4q\ZÔµÅêŠçu­1jµn\0qÓ½©&bw63º¶WÛôğ6_/Öôl`,Éëş0V‡\0@1TÚ°æb¬ÒÄœÙº5úw˜à]ŞrÈÔ	ı‰¿\"/\"00Wæh2n‘×¶5kİ¡·Œ‘gS$ÆŒ™Z£QMå(!ª€Ş®yqØÍÊ!´ºÈİä‰Æpr¿S›‚ÔlvÄıÈeğ¸/½!Ø-@£	â GtÑŞ\nË-Äİ:Z‡Ì‘5”á›Ezd§½>^0CìldA5¹ït†İ«Û?ÃÀeëöV6Ü¨w Úµum½X÷8d»èZ¦ŞóøúB.]Ìg\0çK‘5ŞpIŸnZ“aG‰.ºBàÃuÆÚ\nAÛ9áüì[Ó66´ÕõncZìà\0HÀAÕæ¹ÛúşvµiëzÜ\\7 Ò46fwºÚÃıÀ›×åemƒwÉIÍ^ÏÚtıŠÔÔPU5Æ“éD±†DWHŠŸ`\Zµ_rÓşlC.ËŠpß& ÁÁfvtİYÕá6a!pEğ[oS}Âêl5GÑ¤Û´{<!±õvîZÚû:.«#E›¸{{È,˜oî6EÎY¬=éo²ÒÁšµÎÑ™oeàG²åaÂ¶>DyËVÔYÚRİš4V\'Û\r¤ğWÄ$úöÀÅ×vcê„ìgéF#ÚmôÍ/ìàğ?Ô26feŒ7ípw±a_ÅõUïÚëMY™¼æ¬cµirmû\'û\\4{2<ã;fÿ:Y«İY =ƒ»sèĞk3tYOç2¨Í-nÙ®ø9ÛmìÜy»1o^§ç	wâÚğñ‚Œï„Mn0ìİœ†3Ú4ñúU¹‚µo·zWGŸi›ÆmoOÆ{÷Ô#‡GU&pœîÆ—u{å‘Øv	Ü¬¹ÂÖıM_1^\Z»³ß>¬—aë³ 7ğ-Tk¯6—.†¶‚\\öke9pÚ‚¥6Fì<¡İ£\rf8uºÔñúN#Ü=Ûáê {TãØèè¹»mË—U\Zœ Mk!Ïvß¨ÁäÅ$§#ƒÒ™—Æ¤©‚Å\'â\\—†\0F˜\0/hoß`.³##ŒñcëÄCÏÙêıë¨c{´}t«›ÁØƒúq¶ù‹ë‹L–Lñ,é¬OóeK>òÉÒûõ˜oı•­JXoBÌbs[Ô©ËÅ†/ìî°ëÌÖöñL‡ŠºsÖì&;R<ÉK¤¤òÖÅ\\İ1îµEæ¼è0íÆÚİ\rX®³ĞTÛc&‡©‰“C ×îsL»a5G–%ÏÊÕaÑÏ4©õ½ã¸Û¯¼?ıÊU\\,0jâÕe±…ë×½É€sÛ¯¯.¹¿\nİílçÉû}·µÑ/ÈFíÍ®.š8<×€>ØºvİÕGo\\p¾lóî	¶&#»ÕwÉã»æAúd—AF~x«õ»giçRçmmuãÌúÀ{Ó‰Ì}uĞoSF[êñÒfx0®ÀÒğá0 ¤®¸š·”;D”Æ^¥%_f’œŞ­hT\\·jÓ+®Ñ”¶mãuÇu¯±˜ûÔ?ôø%ÖQN²É[½_y]ywì¦R÷Œz#4qi.l\\×EÉ} ÿX¬@¹³‚ƒ¿£û¬`©œkè;\\˜Õä\0.!lÉ‘ôqÊ´‰j·ø“@­)ÿpËlüâ²g t¼®½e¼[ImÆFƒC¯7˜.éÎ¨¿î9VwQÀ9;í;ÒÉ¼U„ê\Z°ë¡<†İÔh–Mo¤¿*8;iAMq¿Z‹Øò˜–Ò`¨!¶6]R×·ƒ1oO²Cß¨ı°qkö÷Ôb	@½smq!\'ÚQ\0~äS?Ø‘¡—­±BNóíM\\;CN}†ïÃ‡1B†ûC›0ü²ÆSê¶	¢¿Œom‘¡Cœ©&±»‰KZƒæŒ]:kŒô¢1êº§)¶ùŞÁÖƒ[n.YD]F¯—m{E¨t·‡İ{d_eÛãı¾5äú£e{4¬odyÉÀİ©6o0ï8öÁ¦—™p‡jŸ­&jŸ­@vz7õ@Ğ×éá´&§Ú–84QåªZÜF÷f«~­¶ğ¶»Ÿ\\—t–À#³ºÚğjAÀôºÓS«šKÓ—¢€1;Jbãh\"Ñ†—dc×tç=†)ô†¦ÖîØnßÃù£¤ˆûõ±´Ï—9§Q‹nØªÕ¡õ-4Vø•5©KøumÑö†Y¼áÓ´Y”µo 48ßİôíM[+Ç£+ó>¹QÙ±ö2?I³«ltÚiEú\'çÆ~tÛ]§ÍY\ri6½—˜ys|ëí×Íi£†‹–Ë7(¢½q‹ÑMGÑ…½xÙMêÚs“¹šlÇ¦¯â	[Rç)qîsUlí‹\r|Ä±òq¤Ì/ëZs2î¢Ä¬»¤ÛÛñ¥?îvå­ê£ó†Õ1Ä‘¹µÒ#Á!J·~³Ñm»‡VsuV¦ôÍDu\\GèÑĞ{¬LQşÄ,¥é±nÂ-v¥ºVSë5 ëõF¾TåÕÆÔğ°Åk¯•Jv€şC±]{°\04if.õúy€­%rÍş®ALSÖ©A›ª\r(µ×[šâlE9äµæ\\g„_µhıÚºôTk;Üd>ÎÊÜêÈx;[ß6T{·go‹ußÕ¡éÓÿ	ëÌË®âKâğBºéõúÄ—E¸şMœŠİìÏØä×µæ¤&ÈMÓÚõ™L [ˆ¢À¼l_ãÒ$ı\0SÌE£y2øæäÀB&ú§ÂhmUwíO0Ì´{ô|n¹àÄB‚<Ü\"·38äı•ÈÔ6˜.X8ï,¿áë¹|;‘pÇ•EåèqsbFy$¾¼Ù&KóĞ‘¸È<V›\Z.yâÕv¶½‹ÉS8Åİ!Oq›öÛn‹ß9#¯<UÛöùÎÊ<ªŠ$\0„ŞÚ³íÑİØáÛş²ÛéyWb(ŠÄj 9\rªvÛGÛ^÷Ú\\VÔı¼Óö÷2ÀÕ­ÉiŒ/“¶}\0l÷Uú´6·ëíB§ùË¥wÛ€£úàJÃy¿à=c©’&%ïš­3ÀÅ\\ö5}§-EôL®¹1˜ğ7vzàWñ¶êœö*k;[Şö]‚D¬cË\"[D‹â¶ôzª!ë«!J‹-PŸNM¤É]O¾üî5›À‰xrÛ¦Ãq?–í†‰š·;®¦m°Ö:»“=YSôc¯ÉOVH\"Ó¾³íçåaíç£VŸ\Z2´DÁ¦ĞÁ¯b\rP}Û ;òä¸²<¤9ïÔûÜôRk[\nÆé40T€)8\\54½İú©Û©;KqŞ^Np[H’êÌ7½e[@±	®úØéUÖo=\"\'Ø™.O(sú 4.+Ÿ%ñs°¹’ö\0±È^D»D1G3\\$®Ã)Ìä9²ÆèÑ™jµøÈa#éjÔg}™˜¢kt¨p¾¼¾ôÿPKßÌø•öVK_*Ó¹Ó´[;u$”À»lãØ\"É#!°\0u¶uš[c3›è£ÓŞ‘Tc5ÎûWú\nzº5ÓYÚ¦f9c7;b¥®	íˆ^_Õ0Äv7óæ‚Aà=!ï7¾Iğcã†z”ºn7íBŒ±\0@kE×üÓ2k¡ËÎ¸¥íyb”U“áví°î,€í²Ù=íçâÍæğém0çŞ¦\'øyÖ½¸úp;J%e@]›5Ä¾Èki-6£A]ÁÜ|xušÇÛ}…Õ˜ã¸ İ\Zw¼âëÃVY-g§SßØÛå™À™)´LeGiLKÇ¹n4Z7:µëVñw\\–TÕ›>êRJZrZ÷„Cíá=\'äÕÂ<o–KÓd[Ëµ¨*JÇ:Ê­íêD¯¦]ªKût9aùÛ%Ú0HÈ›iÇ«éô¸ÑÄ¯ĞÂ€æîÂÑCoö;Î¤®\0‹SÛqƒ+²¡v\nGkú¼m]ÎË]ëÆÍûÁD\ZõıÓÄ¹¦,dzM(&ÁÜº(²›-Ù›ÌI°Û¾ÎÀŞ˜AÃµ¨5°º2w½51[ŞÂÁ<WW™;sî\\ÒÂ=†M\\Y® ’ÌÌZºSğäÃáAvJêkÓ=\Z°‰I†â›µáŞì®bõù)6ûzo¼uYjÍ¨×‰Ä³\rÙTöõ#&´O*QŸ7µmqÚúx8L›ÛÛa;ÔItb§å¯ÃKU:ö`4®ÏØPW ÎK7èk¯d@&C”¸vsÂÈ½_ *İ—ÑÆv»ª¶GúnbhÇãDè/—ÌbDQTÛ·ùº€ZßaWÓ9´ö`92Çu}ªûXvG*õú}²ÕÆ÷5œ¯\r¿mË°N»CˆÇÃ_ÏŞà*H¬tÃf’\'í,d®×Ğ3Ş¯Câ¯ÔaC¢Ñİ(¦ğ:›Àş¡Ø„Ò4›Ã%Do%»qãÆ\rì¯æ5qÜÑ•mÿf-ç´<§6ò²qÜã2M±#6vÆ\\é€hO®í;¸sz¾l¸Wcd¥‡£¼™í	\rÚCkÜú¶×$!kÁwÎâkõi\r»Mk‚©¶ç¯£›æïCçiÃ¶–*\Z<nM;æ–¼É€×wÚª³f–³Íá0_õü^+ûÖä¶Ú.lSõhà«½abw³[®\\NAJÊ\0¡v›ÃÎ—y÷ÎXs†}mdœ:~×kĞlÇY“Ræ„¹Ş(¸×P­¡¼5WDo%lVl=ÉîtFù+F]zº2ÇËÚ=²‡Ñ¨¹Rm\n×\\İƒ¨›æ¯‹óâ¬ş>¸8Œfs»-˜èx#€çæÀ¡v\0 MÈôay;oáF0F[\0ë#âBK{jØPz›É•kRCÀíÏ/CIÅ»2¾³»s;vÁ\ZÜÙ‹ˆHùGiXï#½…Ğ:È”˜u\Zp›÷ô«c÷®½ù\\6kÇ`Ô‚¡Æ{s\'äpáKõæÂ¨±k³™Å‰›RÃ(yÅó·ÑíĞ_­¸=†]éÙ\ZãõÉFšãj›o¨Õ¥\rİ£¸r´7(ˆKpÛW·:ÅthÅäºã=ÓÒ¥Ùíğ0ŞzûŞ–jÓ½ÒQvÛ\0¯¨42øõXW™÷†ş¤\'qPs@áç1hô¾¹˜\\®R şŒ\ZÏÜú¼#òƒvËiLNÛ¶¿f}ë8PMË„—-‡÷<M­øé™š¨˜Øj\"ªĞ˜.ĞåÑ›ÒÄ¶µİze Ëñ8ùíL7<psëİ­İ6Tä4\\b=f½ç·#ëHøÈxxmu ÷Â\ZÉÍ]wD*ø\\İ,P«¹MºMVWKœQ3jÂ¸£çŞÖÂ4WKBcÕĞ˜EO·—3)ä!ôyW*œY\'˜Ã”@ë:te§(Éu\\`úí1Ò’úûA«¶Û!˜;»ëpå¤ºz®Óà\02Uo{³ØŠåö\"+¦ãşC1ánypXÚàÑŸÆpG«s—Ï]tÖ‹¶ÅıYbh}ãvõÁîK=jŞV¶Ãˆaè	ãoÃİÁø€Ukj@{ ><¸áàº»¢+ÒäC0š¨uFWêaIÉµõİÜYzd‹qİ³ÛÙ¡+lé¼­nmÜV^ÿp¢wZ×«qøfÏÏd®©áeN°ûeï@›myD¨£Ñ’$€îRÓ@ËÀk†İfí­ÇÔ½3’-TS†“öíe¶á5²±Ü‘EâL×i{§Ş®İÃ§—Æ™ÛQæÌ—I”YÍ6tÑó˜-ov-¹_n[õ.R—€+´¦.òØr/r—iÜVz¿y”=¨.Rœeê”f…K»ª¾iH#ÀÓÍ&Œ²tŸI&MÃgL]RîÎOğ–X3­‰Q¿=b1Æ_‰ò¢Qx\"š¹ä¯víP€tÇ;gdÑó¦mÆ³!¡:=Rğiws¬Ã«¸Ş\0K\\Ç¡\ZÍLØ³Nvıs·X\rMéX§ÄÖµ³<j€ÌÊĞ’0š ÜÕÉá§MsutZÇ&wdš¶!pn}Íî7ã¾>ÒŞõ s†;ÚÒ6Ht»>ÍWÀ®Ñ2×5ÁzA,íÊn%“¯ß¨¥x½R{`+cØz	íehOn7\r¸LÄ«°¿¬‡rŠ*›`ÁŒfFÜ9Ú½½²`¢ö‰X‰ÕQ\\ \nõ_t4bY66ºCğ\\¥¬í`&§R!é_&D.9šÄB’– ağTÎ¼T9T&ş”oÜb0ˆŠ³	?*¼¼Â •©Tn?âtğq^B$q†úP\rÉÌ¤Ÿ(ñ$ÙÕ¡Å^ˆ1Ÿûêwîä(é˜NQÎ‡ç[;ı3¹:£E¾äG!µEc-{sİ ·Ò8•¡%\'Š¾GÿÇ\"3€¢DŞNÆ.˜Í} wö{ˆ¨20I‚­¼—Y¡|èÒVËaÔût$‹ ®–Õ.Éœğ$ªè7¨dÓ‘s£˜]q Õl°ëBHØŠé­ò}ù€i¨èWPİkäÊş^ùæMüåŒtŸƒJ<Á¢lxeâÈv¥x%Qï*0ã›Îæ2Æ	œ_–¸6A\r	-ïŒaºa®ÚÊWU˜Åc‹vOš) e©¬¨È]ˆ…™+K<Xs	_”ó\\+©áœx^tœR´âw•ğæìøEénÊÿ	°ÄK\njp*ñ· ²š)$‘gÊ8l]ï-á¼}Ò9\'ZŠ’:S¨yõï9Œ0ëè7Ç²›}]4NŠŒİ¡A‹dlò0¯¡¢ÿ¡7£5Úè	4_I³}wt›ìÎu¾k\rvó]o?»ÖõÏæÒVìú#ÿt>8·Ñ‚î£C[ç0_o¯\"J&»Şá¼“×ù¼9ïeõùiW?×HäÂÓ:v:jÍ‹apÇš4¸5%WhÖ˜Q³°[\rH˜p`5ü¬ù²3ïËxCT²Ğ\r÷¨co{<Rò¶68©˜!l¥;Áíz3¸^0aßÊl£~j+GgÇ/Èºcƒ’–Öñâœf‡=Tï®©İlHcøÖW|I­í\r¶ız·1íöTÜ—7¹-´é«Ëåh¿¨qıƒñ7ov¹ín{ÿŒ7oÚ·ıHg@·†€“«Ú¹\rŒaC(¡65—Ú&Âe¼öÆãí1ONØ3Ã(Z¿‘ıÅè4ºê–®zRoúµ-#lMËÂ¯–1^ÒÑÙ‘Y¯Õ®&Hq2\0Ôæ•¶v3ÜÅuÌvk,2ˆÚ[7(½FM‡lGvkz\raTºRS5Æx·&¶&%m··µJY–¥L§ãV}âéPÇ?œzÚjÙju\Zîr¹Mñ+\rtè†wNbırZ]O+ï”™ÿ±¡\Z›ksuP}³=š[”l6ú§FCŸ:®º9-³±êÍLj:Øº½‹ÆyFn ùÖ»:³»X¬Qó¬€{}M\nÆmW¿\"³ÙÒLÏcvÀOfãFOæ!ÎtÏä:\0-zu¿S¦²×oZ§v¾j14:»‰2äê—ÁJ£Çúf G7¯ô¹¹¥\'¼ˆQ¬+Ëª²\r·[SWçúŸi£Qw:âÌ !Û* ªêÆm ó 3w\r\Zfçºã4Æs€eU˜LX¸·Ø9 ºtÎez<Gs@è\'B;Éû\ZTë,u¢#ÆÏêa4&ıº@NÏû›»éi,ÈÜöú¬®înÙ=NwV¥ä}[t¹nœÚ]n?Øn{×ÙÔ¨×w›ÁæZ«˜F™¦ån©\ZBL\Z­ÙŒèOMº»%†€Œ «ÚvÆ6±Ù-Ø›˜šÌˆ2a0­Û‘µ¤=çÍ©Û$F°#ÃíÈŞvø–jãÂ¢×>3§µ&ZgYØ^ODª±6æõàU§{–{Û\Z[K‰:oI‚#¹ÍFèÕ9Sï`ÈÓ\\z±N}Î›o=ªƒ´İC7ü0&B4½–±h_@×ÚÆbÜìŒˆmM…OcPèh}²æ½cí5\'2ŞØMPnu½Îx¹Â¹Ë¬‹Êly#I„l²”¿¾fãî ái2ÇN5†rn`ÎË£!íöbDÃf4GW„Ò­†ê[A»í±8n²®ÂMä\nš¤\r68±µ¡ô©({u¼yíÕá!ˆ}¬©}¤¯p—.×”ËÊó\0¸æ½ñzLgËo`Kéå·:#ãf§šZy-pFÎ¨)¸îK;«n	lw4c6î(³úâ¼m^Z<±Ô}!ì… Û#ÿ¬c3i‡#aÜË~%zmŸ ­Æâ‚øe©ï^ìõh¾ZÚ~!{d\"vÙ#İ%aíåf—ÏíVsq™Æó›:7¬Cc¸°½Í˜‘\'w‰íawp|©“m y©í¹µÕ²wS<méÓy&–à™©‹†Ö=Õ$;ƒ©Š¬ëƒ+¾ØØ=fé†ËlÛg;µœ†Ù;ÙbqšâXMhÚ²§n†£™_làú¸4šphbµº:ĞkËgoä6œ<ñ?][æY%6ˆµVë–l5çõÅØ€~“ÜÃg|³…ntû4B|¦8œPP”Tƒµ½µnôÏ†Í‘ˆÔ¯p>6‚«mŒzkä‡ÚHB\0¨~FÏâv[C$¤>“\n;¥>r«Hë‚3§)ï÷×%ÆÌ¥ÏŠ1	´â‹ó!E lñİírkuö¢}z*vÜšøuÊ‰ÙX‡ºÍ+à—‹kLO“«ß¢5³Û\'F?®V£ù™¥œ¡îjê[ôÖÜ·O\'Í;¬~l-¶{î²’À¾:hz=fæÎQœ¼Nä®­qnÍ¡ÙZ+“á9±Aê@]ouéh]Û3x8›#ºÆiMiyİ¸¦Çéò…î:æZÁ,â‚,wgöB£Ç¿nrw]w•¬¬w“í±ÑÓYSVzgVsëq™]]ár¾‡\"Ò?Ìä‘Û’ˆyßŸæ#Í3ĞHåØšÑ”cİ­_švĞÏ”ªn[õHA¼éÙrçr˜q0PwöNÃ«_ÇæŸĞ­õà8™­{\'†9Ç­Oéş¸ƒ_ï7Zó\r¹ãüa±ì¹¨´%…ÜwWaÓ›IÍ#¤ˆ=xL$§Nöézorà›–´9ˆkÂ^›¼wq rŞjINj	dw%pÊô\ruÓ\\,¡İ¸´:§ÖAó@ûDÔ–[ŒuÌÙ\r\\3=UÏM\rdÏäÙÖ”›2#uºsîVñúl}•´ÕYn×Õ“r>£½eãº1 ÚÅQÜgK°¶ïÖúÍvÏuæÒR\"ååe¿eo7…èÍ¦¹:SôhUkµjuGeé2ïsKŸ˜mwáËO|0kÎÚP½½¸(·¶HtIÇiÛ‡#µ7\'¶­¥íj-½ı°Û£9UF´ó¶‹Ò†9oxh>;ú¼”¨ÓÖi\\m\\¥lHÍV˜Ït6’wn°†Ü:œºö\\Â0x„œ¥4‡qÈ1tb#Ô‡hk:óxDaÖ‡Í­/ë›)6éu€U}‚5!Y3˜›ˆcàhJö–¨2füª)ö†ó«W?Şº#O±îõÚ3úÈìï[;üÂ­;”åóè¶¥…ÅÅAˆ¨³ƒ|i6©»Ækz&9~o÷º.]lçºw»Óı©¡ÛDoZÛ©gæ\nXrûÊÃÒe™z2\\ix&LImŒ»†5æ£)\'‹è	6—ÕæØÁñÎ¾Âí1‹„²Ì}_uW\0\\G Ö1–\'”%JÌëÓjÈïûÃ)ï?uÑ?Qü‹ih×·(¢ÓkoÿdLHRfªQûc¼çûßŞ…“P_ª¶ÅPåh¿üB‚e]~ûù§ŸF·Q¢ˆÀP‘º	>4Ar´¢—Áxuí[½^oÆë©ÏÁßËï/©wõ\\½Ï¾WÁz;ıı3|óÏ^Å£ª|Ùç4¬²>|ÖvYßšâ¸—õ¹jòcW…K^ù~TÍoeóùì}Õ<VÅgsYÖög´ól<ŸÑ×3ÚÏ·õ*¼º¶Êúğ¬®·´úø5`5x6_h#â„¹ô¬»ƒh²%Àóªï×Ññ|>Öj}U:c7	×%mÈ¤50àİQôGøÀê†0lêí>\rQûí\0nÖƒo\nzŞ\\Ñ1Ë™bsmm6\r¶÷ş™O¯OW@u/(Ş ÚÉcqÊÛñ\r\rz2Rs	m0•=õ¼é*ËuwĞŞÇŒ²1y|İ7O¢á®É‹èrÎ©iÈVoi¢†°P½ëvœñ]1À†ÄZlkÆtmí8Wú5ZŞMÿœ==4pÙn‘Ù^aØ¸zôTŞ®5ãì¦«³DG3Ó‘û“iu\\“\\Ö]B¿A×áLe¼ëBñz£ú~BYøÀ¸j£67»ÌUá\"¬P Íië\n»5É|ñg/É:îîõ8_ÎÈUW±A¶˜Ëµ†]<Ş&<‚˜]İ¡zJ‹˜Í:×6M˜¦8¥ñz½Öê\ZÛåèˆ.uÁÓU©ÕUùdÈŞ¤£¨\røÜiª$¶íMÖ„õ¥{—3îHìa½»£Î„´kl¨}§=äú|ûDwzíé^û|÷ÂœÓ=áÊu²e¸C›hÃK[Ş&3ŞqÃp%ÊöOlSv¬j½vo·àU\nízÜÁï\'ÚŸA·nÓ¹ìğñÊ“6­L‚:(9cl©9¯‹ùØßˆõ-nŸz½ğ×à;îxe.ÊŠïmÇ¼7[ñÛùÜ<;ÃìG´	Ph+L¬½ƒ³eV>šö°s[´{ÎÒ:ˆ­coK­d‚×åA%(S–ûë~g)İı…YR{¦OÎ=òèÊä\Z©Á»i¿=GÀz\Z`ªÿ»§4«Y˜aÍ.Ê†\'V¾·¹ÊW¿|ß?±Úìxå´ZúÜ\\pO¥Ñ[Êôm<ÛxÆğ‚™Ë%oÌö­C¶OÛn„aó^›<êD‡õÌ•åŸ½\\SØ5j3–ØŒ¶£åt“¡w€ÜjõêGÃuÈóš`ˆè¿´iµ·šÒ¡ÍÁ±£õüS08ÚàéV·1\rİâ”åAĞ8óƒ ®I9í\Zcs^w\rÍ\"ú¤‡övWräGK¥íğôdv™İpëO–Ş§N‡ÑòÒ¿œŞxŞ¦”£²Qê\n±Îr0z*#Ã=ºÓ>i,İ¹Z„Ö›ûÓlB4e-İõ®w©1ò`t‘®œÎ\0 y!Ğáæ°ºM»+Wk`«Ã’\\¨mäØ6z+@û¶9h€›S¾’ä÷øiÍı‰öbğåLÎPÜ—íğù¨§šCd0Ç±ƒ9\\–³9cñä~pU]jì,\rsBˆªå‘<çº³÷Ú³–·vˆ–<2¶#Ô±7½~¿±UHœ\Z›æ€‘×¦3›/Wî¥yºòó{³Ï\"1°Oşï™¬OëM”;›‹€ú3%H¾j± ñöÄÙ­½Ñ˜\\{ôm3[\\¹Éì!Å%ù°\Z‘7üÜ\'{vòé£Ã^ÌÕ<€«c­PÙ!—|ÙŒ©+xr{^îÔ_l\0c[c=âH‚&ˆŞ\0:ÛMQ,ÔQx™X™ëáÉ{–nÍIèv“Ôeİ¾ŞÚœ·aª~•öò!¢“^ëÔ¤£ªØ±\rà\0rr\0nõ¡]ãkõÅµf×úó!|>ÙØBàër63»x¿©ªè}b ²=\"˜¥ÙbÈÁ|\r´_·çûk¿}!}ÂícË9£É=İ8èTbğ¶x3 ¾ÙÀ6FíÔ×¡¶k6›P›kq—ZÓ?BH­qz÷n8P‡šëÔ‚wÜÛÕf”•“Ğ!‡XíıòLa±yTÏ\rs²!»x~[ ZsN(›·üIï’Í­è·ÕyÃÚ¦*5ÌTnC–÷ˆ`|âQŸÜâ²éB@Ş/w]]Âgl²c©›@ê­£:<t×=í(1¨6šjÚò4\\_ØÛ:Á¦VCSz<¦RëH)SW§µşY„ÉN\\³S	\0)“DÏÌé±Ú­\r!íãuw8ğÂ¹Š°¯»2®=g_[2ÇıxÁø\'³»mX\ZL\'¬æöØJìûs†Ÿö¶mÓ¸ê\r|]ï™Øv¤;Äa±Ü¹È ß®‡ƒËÍjvr´£ÇÖê4Êñ×yh»íNo˜ÃÎÄQÙã?Ú]Àì®şÅ½\"¹G5´}£ºç&>¸6œ©³`¼6»éõ&ú³}ªl›!Ğil·é(“ÍPœ3ş™ ÎÈùğ’Û·]À?CÛ	É¶B\\äÆF59uv¥sÒ¼v›{læ][`¦µŸmo”~h/æm¼Ãİ´¾Ò”ãh397ÛòÓ%­Õ]·¸Õx¨iö¾f³³U›\\EV;ÖrÑÇ§M­UP›t1 =¼…MïX–!Ï—Á”Ü4U¶cÙø›kÃÖ†n6Ñé²å•§¤kßÙBç-åNİŞõ°óX›f¦M5IÇD¬†íŞlÖ4k+Ú{ãúhÎ¸î¤v¶.˜êb»{ØÊpîÈó‘BVªç“û\nZŸPÇ¯km´-4Øp`Š>ïÊv®¶t³‹Ğ¤Û.¨¹Š\nÄ@±ho(ÈÆ±5b]{ç\\È­H-]©ï:Nk³¾ÕZ053GÊ°:›v{‡÷|f¢ºÄ=5ZVMd°Ô7¾9eÎ„²]\rı\r¼¥5…İ|*ú;<GÌ½æœ³\01jÍVÂ¸GmÅÍ0zŒ Ó\'}Š¢W»·uç>§r|–è´—¢â~³^ËûÚ>u¦¨†ûe–õù¶¹q½¹sĞ–sI¤½ï3íõæ2(s8möìÆÚk²Ø9kLï w]ön“6 ®0\0Ÿ©ë›€RKdælk]afæZËƒKwå–M{”¿)@»Ái4”l@Bo×bÀín\\g#ŸSÚ7!W}Ùg¢cÌiæÆZ{B01ft5\r’½ĞÖvêÉçñÚ“$ìr9+\0càøt«Òt:vwË…Ò¤GÊ¹/	½Sû\0Ş<¬×jH@R]y\0ø²ª4!:U«×ì¥ìu$O±	‘}ë,ÛGqI¸cƒîÎ\\’›ÓY»€Îô®~mâ¤61Kƒ \Z\r¬û(£z&ãóD§N\\7cP1[=gÑ&Õí)†Sè~K[o–ü\\2‡ÃÉuÈCŠtG¸Ò¢ÚJôTÚæ7¸9Æ±°œuÛXo}ö4b3ckòØµÚÆêœ\Zu–ÇÖôägm›ä8ßÈc_°ñÄQƒ.’nSS\\Ö\\äzÅFƒ-g«\'uÆ§ÃÔ»ÍOî|DD®ôè|“|6¯IG·©ïÇ#›° e}´—6×%½[#çtiÛ‹]{ÄÔ-Ú NLè\rĞÕ@·/ÎnÄ|ØkRB0°Œ‰0XS¶Nìf„Í€ËİX0©Zÿ¸ºIèd~…\\è<ªm(–4qµdG–L6ûkQ:»c¦eñ¶ãnpmÈpG•h¶ Â€0“ìŒ¬¹#9Ø@×I´Å©Ûı©¹>À+ºİ pÂröË.ĞôYğŸq5ÅWÍÓ|}Å×°¼õ(;ËÄº¦m±?hû³¨×šµõÌêz½-Ñæ×Ğ©®é mÕ%‰ßğşî\\%F\"xó‘:²µ<:­¨ZOì¨p}:%»j{ËˆôÑÆ¥ºÌ~Ds‡ñlnÔÚi{;@ñÙÌz‰ª4tj”»w=Äû×™µH‰šOxä¹„Àš0™ë}CõÎòïğ†Ëïyï[Ò`Óæ·Úˆe\Z‡í…‡-şB4t˜F·eÓÜ\0s´>Úì©6h,\ZÀr¾Ô»À–9H·½Îê»½L—Zd÷Æ„r‡šˆ 6»³4l„tSª:İÕrïÁíµ¦7Püv\0;Q¸ğÚv-l1‹]ë$7lu8ê•uÑÛ-ı´­a.Ö\\Û»¼\Zb¿IC°ïÀFOÖ…¶2ó’t\\ÍhÓ¹]×ŞS[‹Û`jğ€‹·&!‹İİÙét7pCß¡0!q§.ï6·Óz‚z­¶ ¯;TQV×y‚\nÒ]!µƒ½ùÕ›Æ\Zz>“¡íÓìxÖÙ9³ã±.´®+·ëïôòn±íÃ#µƒĞ²ìí˜(ÆÚĞ^àc…$÷†w»ƒ~mÄ©#W\ZQâaTãÜkË¥•[Ç¯´lºI/İÃ°éFÀ66\0ï[¼´êLÇ½ÏUì¿‡#b¾1î¬&²N_ñöEÇö\"Üé•v\0miº;6!p ô´ğ‹Ç(.Ú«bòì~ÓYŸÎCã¤Ofóõm Bƒ£5á¼©…ÏÚ\"#î€Zg5dÙ9	íñj5¦òìJ«ƒ¦|ğPªg[îñ¬¬zÚzRØfğq‰5—ƒ‘Ş\\íÆ`®µZRGã¸”zs•šÛkérˆùÌm/å+Õ„;—©N4l_@\\ÖoÔv¼\"ÖI}¼£§O$m\"·¬óx0¼65‚ì6ªãsÇÛ©âÜ%ºÚõ¥ú­m,8¨¢6Ñ›m”¾‰ÙÎÙ“Ö][èˆ3›mæÍum\'ZcÂõ†Øj»à&,6ÄmdßàèÍrÙP°nÇ¥­ÅÄxªîËŒu’n™Ü­]®©«mÀ\\3—Ëº9hˆøiÖE†—n³UW×=mvĞÓ|v—0p‚×0lyúÌ¼.\\Ãu‘1\'Ôøt™MÈ9)Npèxm\n\Z³u1a1ÀŒ“b8´o]µcŸZL@ùÂI¬m ^†ÍCKyvç¼}Ö–ç=\"qÈ87†Ò™–¨€Q[MìÑóï€Öµn÷İ•ÚçvƒGÂâè®>ş’ëosğ,¸«‰5šƒsÀgb{áF®Ïì­nË6+[h¨óKÛ]¢4´¼I§UP†b·I\\v£ssÄ\\¿ß[ÃzÓ^Ã50œMıFL$‡QFz½ßï×©å2FÒÙä|³WßÚüä&¼ºî¯atxq$íz£^óOóh{ÛÛõugõÌ]o¼\\Hâ0İ%H“sè\nôˆ\ZÁXmEŒ$ª/&a·Ö8ni\rÜrWaŠl\rûçÒ<Û»¡îŠÛÚYY÷Ïõ–E°ªÉÔŠÅ/˜AÍÇ\\Yh›´î=4½kbaÒìÀ¼ò÷ok>4S6Ózî»=hhMÓ„ÅÄ«XYê‡‚raŒÒçğ>ğQ²\ndX(š6gÕYÕˆôòûÜŠ‚ø?…l&ˆ„6ñU :×´Ş*šJU¹\'ñº¯¯hö}¢şÅ†?´­h8ÓÉŠ*úi³~K”“l6)«gäa/š\nĞ˜ŠÉŸ‰¶Ø¨ìg„]•q3eA¦½‚QB±-qõô†”Q5„”†z‡õÚ°†#õ4·ÓÃ ú-1ñVüJ9lC`¡­\\ğ2NğB†Ê†ù;DfË’Ğæ¡æ­µF´é† GRñğcª3ßä÷[ã·W“e¬j¡¥‹ËÖ²´àI;Àü½¬#²6¯D‹)c£üÚ|ÅÕ£1y±RÜt.ØWV_Ôl2©ğ °Oj¤H³Š¼ã.¥#?¢°¾%Îig…»‘e‘vò\r¸~QÑ­p @¾°f²ğâ,0!¥e¢Ò‚èËÃ”…†ªÍ€‚Ğ—!‡±ÄõâÁšŸ{S\rëäŞ3§¥ò>çÓ†qfÕGŞ‘$T>‰!8•N{”d»*ÎBy&–‡«DÖœ7Éòw“(ÍÁW’rCºSr½2aÂ?ŠSb¦ÙUÂP^Šxô2ÜïÑGÔÊ¤ƒÊl1hõjy¥É$×a>EU’5-—š<;°qªsÿÏš\rƒ4_-‘\r>|Ã‹Š©©?3Ôğ	¨¬½uL@EjIw&iŠ¦“lJQ.ôt‚´±L?ı …’äiæO9o«ÁN•ä‡käxO˜–í‘ =—nó¥>?_×‚mZ>ÂF	ÿ²ùÙ\"v<ˆÉeÏ¤§ù\n»û—·¯¡™^^Áàá_å¯_lğy\Z°Ğá•EûÕnFî_¹ìYAşş@oßxRÜïœ(™vy ’ÿ¿%Àşò#N©«Úõ{ÛÿLx¢cêâÑæO$¹(ÓoÉ°–ŠT9Ì}#‘vSDOü÷ÁğÎsâ¹ÿCSò2Ëƒ¨\\³÷zD°9RÊ…ã3Áæ-ã·•aã/nT1ÏM¦*Ÿ+8½”ìï%i+Ì™œÙ¢DaÅİ)LŸä’øæĞş¾—gUü4Ë^ÁÙ5—X÷!,dÿ¾*­U÷-\r.ßËH¹º¹ôÕQ¡ôy*í¬‹§]s3Ò,Zp©njŸy\"/Ê×q®È°ç	Ãv™r#›h!Â2À²ûVÁT²x,øÊ G?Vóù~³Rèç)ÿ¾Ødğ\"›Ü(İ$˜k2I$_F•ùÓf|Ê…2Êø—R*‹4IWßÄtTñùQÉzxil³{Á†^v†ÊÇ&ÔÑ%â²¿-„N²AzDBğPºÿTQxÆ©öÉI“Õü¥ä”+RG‰ÜÉ,¬úhJñ„:WÉû/lÈE©«^¼y¤ıªCÅÔıX÷!œb¥İ7ÈùÈ§Ù“Ak¼W”ĞEÇ	R§#˜bŒáç’áÆã\r3x§ƒ)¢ÂsŞØáÁ¾˜Ò)—Â<Ä+ü\Z…/õ4MÕ£ÅÇ\'ŠÁ¨>ï3H÷³¡\n¥P*ÙÒz¡2=]²ßo¹³,T\\Ûj\'Ã³Á~Š~¶z‚ös\0ÙÎeõZ¯#QÚ×Zç,=Á_îïéaÈP>á|ïŸ0F6Ï[”~f5‰\'A4ÕºiºJ°XÃU}Êa Eİ¯°ß0&IH€!ƒ	\"M|?Y–hó>Ì‚\"¨T{“–2€,Ã°%›yÉî&ü\Zâáè<G%äæa “eä&+İïŸ\'¢ùµlSR51r§ø™—„	ï\rÂ«v¹ôÆıºR÷teá»øğ9¹¤éÑÎÈ¦ÌWE©ı‰ŠïóSÀ/Ëé‹1(™ÊiSÒz…òÑÎKi¯ëüó5(ûÎó€OAdà¢ïÓúáªxBèŸx\\êÄ\Z?~¥ólóêíÎ\'´ò´GwÍÃ“>}ÆŠ+xC¸Ç”­ë/NrqŒã!Bb®Yœé5¨ûai\'\'#CŸŞ¤”aªÛ>ô2RäÉWÆ»Dé÷:\"%-ç+ß†ÿÀ\"N\',Şv=”ÓpêÎI‰Ÿ^áçè*¾\n©Úar•¢lƒ),ÒZr¤ä(Ÿ¾¢+È±9àÅí\"»”+@ªDã\'êò¼æ)¹ş»oäĞ‹{Ì4M_<Â²‡|¶Ï~AöR?ï#ôØ®“I¯Tš/ÃŸQçKcn£²UÃe9­JY—-yÖ¾…•~¾R!ÌCš>Ğ–eî•Ô‹($F¡\\8¸\\ıŸ©!ËIÃ•Så“îæÂ‰R3«‰*™òø\"/”ï9Ø\"g–€òÌ&?<áéæg.T* %¨I \0R„ r\'9BdÅ†„•€hˆ(Ï5J@øs— `¢ H%@¸‰\"pB_,ÛDÂ+Ñ<€›Wáˆş¨«î5Û^¤²‰ÂEa…\'ô–%ğMeBó•—É»n½ıOhß«Q®î°Ï(\\1£_ÇŠœ$YüÓ‘øğ÷Ú`È~…Ã{\0ÆĞÖ/õû*´rçv!‡r?)]iİ7“.¤DÇòÉŒò¢ÇóÑjÑ8İN¬ÒÀÔä’HÍt{oÿ—ª[¦íúçıˆ¯ÁM?* ıdä~şÍÒ_¢× ì$ÎRÁ«´h¬ôû„2´™e¢_¤…ê×%¡E^”$ô‹-üË“÷‘~éK(4Ä¦ød2£ˆs#õH&9AA±ùû7ÃÌ©¹_]¹Ïi\"îäû¯ÎC\\¿t\"*ë÷şÈtLúÌŞ¿¥#»V­ËO[|»ŸoÊ.¡J+T˜ßúıíàèö9ˆê¼&²¾´§i	V Ü H(µôJ« dšn\"3>yÚŠÙY6ÿ{À®J¬Ââ·!Vé×é¼ï¹ézu¬#´¿09I…?09U³–âKÚaHcCä#ÄeİSauU|#yò¸ÏHä¦_‚	WItÕX|\níßá‚u]–Wü¦râo¡ˆßq7/…‡!3£}\nHDràno˜“eJ!¾©ºœèFü­.(÷„»c|àléÍÒÿVæ[\"b”k@?šşw»ÿ|İÇçH;—²Œ‡­\r?½$”i»ª°KÆT’^i\0ü|ÖRùùç¡¢°}­ñÂƒ÷’Šù\\„¿‘Íña\Z€`22¡Øl˜è_„ş/ÅGaôìÜ=ğŸÿ-è6 úÂLş½Ú,`ş¬5^31T=AmTBQYG¢îi<ô¬şWòD„ßÙ(†-eÍ·É/å‰€kÕV€5\r&úøÌÍQ%*\"Ü&­Ñòêb—T¶«	©îÖ‚ÅíÃNõJZ» ®n«ñˆ=Z™ìRiğúj!Ğå¶ìíM;ôöx­×º Cqù¨	Z; Ã£†è×÷q:oõe#øÎ­WÀv«½®ÜğËxBÇiöíõµ^[/)²ÅÁşçÖò4º‚ûQ‹¾ôZ[h¸§ñbæ<Ú—‘Š{ÁïX.ã–	÷æu|%äÿîyÚív{k>£·w|x}¦Oç}SèÎ¼‰ŠŸX€‡êÍëîŠ_&‹:¼×á­wnüú*x×(°İÈ®_Ÿ‚Kï6ã=¯k~´3§’×]gÛØ®ûgaÃ4{jï1~?K ÙÓ@èáµyâ¯÷¹Øsp;mox£O#ªéráøødÙAoc,õUgæ)ÓÓjºCXQx\n¿÷Ä™ıùï,Ï~¯®[h5ß­·{.n}9ñ7+˜ûq‰ğàip<94¯l@zÛ™uš{a\rj\\ ÙŸß C}æÓŠé²ÿKÃãûóMüù›´d,¯£=íMè%ÀÜúíñ<Ÿ`\\\ZÕğ¬ö„ŞzÌmÕf´7£G—Ñrye–=t¼?x“E›fö=ºà4¼ù\Z½	¶?6«<-oò\"¼Éa|İ­Û€O“Kj:ş<$ka;MÿùØä`BfÀÔ£”ñv=¶ü~œyH¶\"ZIÆo¦ù´íÖ³¯7İ^7š×‰®xx¦púX›/}º	Ö…ZìšiŒZ[$ ÿññÆ·7ŞË—`|\'­qÛ§ÄË¨¥´Çôè:[,Õ<Ÿ.à•»ói6ïÁ£_†7¼ù¸SÍ¦gÕm÷-¾;³8ñ×ºwÖÑDëÓ³}X.½öƒ÷i¢qz€GOŞ0o…¶;‡Ã8·}Yk¨ÅvœÖû¤J/úÔø@NíÅF—#ºK‘ºÇŒä°TOà¹c„o‰É•Ù@³¨MÏÊÅ²VÇ+­\0µs}r»aX»QwQ{º¶HŸÁÌëÓ>áo~3Èfëm—67¸	í¡@µ{ÆòˆÜ¥©terQ£ÕsgíNíùˆÄ:¦umx“k¯u‘»&Ômo|=`­¹GŸT{®­d®¶c8À¼³×÷;g„XÍËAhoig<è	½Ù!ßÈ;x\'˜‹¯^;ã)3sÆòÍ ÀØe<gu¢¯HMí/ZëNÏ<³@vTô¼G,ÏÑ?(h$Ûä\rÛ‡®2\\y+ /_Ühö—×•©Mnt[VÎÉB\'Ø!7Ÿ‹™}˜j—ÃiëcËŞeÕ>ì5|3êR%:o¡29ß€ïDÖwímÍGÆGL²±éÎ.ø‘ÚÖCen-}J,dD¢›”¬±£ñš?õ{èoeüyyã×Pµ¶CÌwKŠ]Ã‡öX#O× ªÇtÛYzØiCØG÷ +kÓ©]Ñş–Ò]($ˆ sµÁ]§\r˜íÇºİä4«¡aîØ]‘~Çº‘5îá™Óõe>kˆ­®4íŠPÿ0±]CX8ÜÎ‡×$»Õ¶@]È».bhÎ†;ªm;hìFáé Ùğ¶ÛkÈSo¶%ZÓ&&,lvb÷™?İ—äˆ¢òO)àŸRÀ?¥€?*Ìşd)`Öú§ğß/ ¯	A.<²›dåpfknÖi¯İjİCÏõŞ¬¿%Œl.T³?òÈ¦·ôHÆ#A¡`^³]®+n„ó¢é\\şP_]wyÛCBŞ^§^Wdš”§ùu¶Èº…wÜv{>7é½Ó¨›‡ÔĞsh|®ëÉh%\\—ÍLOMzc)üÔê9ÜáÌÌ£6àuÊ«ì‚öN³Õ&uÄè\'Â\0¼õÔİ–ê­ëƒ~CĞsâ âã¨0ëz]ñĞpĞf‡»q½²q{É·îB¡mü„l7ìª¯ö†ûÉVyqeÏ6\r×;R=v·Ş–Ş4LbL§İİeäQÜñ€9äTŸ`Ìì0_]–=¦Ç®	÷6ÌÔ]åÄšIŞ8Ö_(îrãúb¯!‹30XÔAVÆÍm§öşèÏ»ºz™Ínóåj2 Ô¶×û|—TY‘Fã¯ñ½ò«Ge8uEşñ£r–™Ğã”ŠvM V¿´I^gÿÜ$ÿA6ÉW7¹ìfF@e»3€o™¾ŠúxFc5ç³é/8â<š#ŞİáõÑ¦ÏxƒÍñÕù¶êjŞnŞœû}òñïïZÚ©£h“lY-Î¡Ó¼®:Í3çÏ)á//;ÊÙ~ó7¯Gc•0ëöõÇ,Ø@¯m^ähÙo\0ÆûÊføds}ÀÛ\n/¤İh¬ƒ9í[‚¾:ÌŒ¾?¾äMhûã°·üol×è~·Ôh.ƒõsb×Úar /Ìay›µÈÖhAÒÌ¾Ì}’Ù É‚@GË5öÅ‚Ñı¹Màùs8ıµpè¼]\'şşØ°‚M\Z_Ù\r	°ëæiªø¾ÓXNl…4åî63%x?…ÏßÔíİ†‘ıMõàãq\rÖrMƒ§|pL÷“”¬\0ˆ;cïJ0d›$[ÙGÓÛŒémWuÈ–ª¶†û­¿ær:İ1â€h8t±Çö|9§¶ b_gò~y°Õ³îĞc‹å·SpqX5ëcİÌÄÕÒ=:\r¼	ñæ”k{±ê„WgC÷\ro­äîB­ğvW xŞ´Ïò¦ÎĞõ.Ê\Zn’°Ò:ñT§ylÁÆ›Ïë+tMK“Ú\\Ùk1j¯\'Ë›mp3uÆÂ–±\'gÜáË¶ªzŞ¤=\\y0%›^´tYÛú\'>èP.JÈµÖéPÛCgix¡ë´“¤LuÎ›“´\\ÉæıÂq*Ü[ş”ÓÔŸ´Qüó4õ³Qüÿıiêv\0Ç­-ì3çël9î0ê×NSãÏş—NSãÿOèT«N?#t¼` ±¿]Œ«ÖìĞûƒ§©\"¼¿“Nµ=šõ€í\0wêbã1\rÊ?Muv&ØšÊÎÅ¡‹)´±š9î6fs\Zğ\r6J—Ñ„ŸªWgÚ\'­®BGlÈÖ×Øæ9`N±ÇšIÊâT‡É¶5Ÿ‹ğÔ«/®·î¤Â*sˆ€t¹¯›¬&,³Õ?vP„ê³Ä›-\rb\rnÉúr#2x$ˆµÙ–\\Ú[Wa½‹eˆ‰\'½Õîâ¹aEb°ì‚’uq—VãÔ\0º·ßö„°WÒš\"g3Ü±:]—sÈ–ØñáF\\l+[®¿x“ãÜç—Û˜âó¡Gwˆ–T«Û²ÑÙºÖ¯èôÂËÀûqç‹Wƒÿ<ïüsûçyçO8ï|å\nğ•óó÷>ïìg-fO\\`×ùSÎ;1¼Y‹ğş§Î;’\'A>]b2‹Ï;öH«Ñıà¼£lA ×â8Á<cÂ<áÖO½öşÔ[»ƒÙöÀ²CqPŸ×ğc\"ÔD]£üıDÙíwT‡ŞÏ»£µæ^oç“Ù‚åé¡bºéçµÀ6€ÁÄí÷m…ÙÙh.Q×9Âƒ-ÙóJjY}rÓÌqnƒéŞDGî	âî²ÅëÓ¶áµ\'ÖH>Š‹“7ÃÇ=èLŒÎ*¾]éƒ9w³µÅh õv‡£…£È×·­ĞiÓ}ğ¼ï\Z›WG—µ”U¾.õÏÉ,OÒ†š)¿\'–)ÈÈkŸÅ\Z1îØ×ÕŒÃ([oÖôT•v&¶0®½)½ô¹5¤ÙóbÛ«_Ş‚şyúçòÏƒĞŸvJv‚Ëèö§„ğ^<Xıó ô§„šäF\n9tˆBz·†5»qÔoFP‡‡¤é¨ÕgdÖM¡.±#ÚÌˆ$k–èf+§i—ñF\rÅ\ZÇîZŞí©v«µ\\)<–Ho.×Ûƒƒîx³9tèëR\0dPŸì‰>¾’Voà0ìÂRıÑNu8zßÛ{ÃÖÆë,Ám±3mÛZoÕ]ªŸ;ûÙUÁ·#˜ÜvfnÕú2Ã½ÃXCÅS£É\rs:¢Ìl<[ÑÍùŠ®ã«QM_QMæØÆ\0ŸhË°@æ¼ìkÖj<^r48;75ª)/9ĞR·cƒ#sº­Í­×[S‡Ù’§z#‚8\nCÔL1óÚ+»ş	=#ûG5íSŸ¼[àİ¬õ-ñåÎB\r½‹“SèŠ”±ĞMµÍ\\ÉàI¶oj`®ïc]29j¨QÀÉ‡}Jà˜ú¤¥<Ó\n\0á—}¨r€rµüéïœ)\\ßŠ³•yb˜Qpõ0¶z!NH*êf:ÌßsÈ~GD!q3)=òšWè¼—Dñ	\"÷½Üìİ!>MOißÕÀÓ5\nš\r*[BÜy·¡Àš8øğëH¢°ÆÕ-Û´üé¸FîÀAÙ\0ˆ ¯ÈÁäO¡¼ùd¢W¥K¡è]Ÿ&–®’öğy„fÊ‡Öñ‡÷ÌãYèì	1ŸraŒ|%c &·÷{æÏî%ÁeıÑ,iç=zv—pÀ^ªù3ÿª8re•R¾.q×‹Nk¯@y’ ¨‰\\ó3´X>ö3N6ÎÊÓáüP!À3’IÕL*Æ‹ó	!q¡şQ\n¦„-¥`Æ/âˆøÁˆı<«Ê©ZØ9Ş’HÆ9/Ù›ø/Äm‹÷\r¨ÜÑ$\r,XŸÂ=˜\\´7•¸€•’üNålMúdàƒ\Z1ÎşÇåLtÏ|…(âRi¤¾ga\'ó.BÇœhlĞT¼šğs©Çsƒ(„N‘/‚êäë‰‚šyölù=\ZËÄå«Y[\"q°zœ3‘ß\naõ²³ZéÀYEÏ»Wú`üŠÿ\\j+:q%›1n)rËµÀïp\n%Ï/×Kˆ5æ½²–¿Áó×»Èâ3tóä(¥ëxA~$!ÂÀ|ÎÒ†?Ã\'äxù°Õj@Épqa~¦#ò7ËÖR1ğÇŞA( Bğ®â±ÃV³‹\"¤BàgB¤¿2wŸw)b„NóıL}.¡È\'HWŒoò”ö\'Çõ%9Ï—šs®Zş6!	Â×\0dfúı«UKc€ÂPC€‘WÑp\\Û4ä\\O$Llˆ¯‚ø¥¾¤*—ö†EaÆ^EEP%IH,ÛNDğË0~©?éÚ¥âØ\06*å›d»ÕM.ˆ`X…°Z´z Í·*0pÜ¯XèMS’%úñRÅ²AH¢Âx¥ÃÎÆbR.¤OáÜP Òg9¼èDN¿_?\r¤kç…ùÔ»¤*køgá÷Ì6ı*OÔù­¸²b6\n}TıÇW÷æDÌe—4ñR¶©Òt}	ØwV\n¢ä=t“cg”3îaÁ’Ğñ?H…L]Q=¥É–(Ñ¥òì<”euK„¢„ñ‡?6T4]Ğ€?ÉÊ^¨ñ¦Ò	^ïhõY4Îuñ7BÍ¿½ÿm.Ê¦ø¶ì¥>¾­Eîm&Ê\'µÓçW35ÿÉuƒª]Q;‹Jçm,Ä¿½ß¿¿¶Êjï¿Û8¢­¦ƒ\"AÈ«#Vª1ª:_Û~(|¨† ÊæãÄ³ÊhHüf][ŸerJÊ¼•>âŞ©é‘Ÿ&+åÇâOrPŠ•H99¨¤Mÿ­QÑn äxñõH‰KsĞ4·|à^•şï´Böø€”; æC”Èc&î)ş„ìĞ/DĞúúXùs”FŸÅ¸ a*Ïş¦½)*-yŸÊyé6Üs€âù#ŸÎ*¬‚zïPö—ÁÅm-‰ãä\"ûû®â7æ/Ÿ) >9n+¬Õ*¼Uşb­L»Oâ~;ªÓTL=,iı+‘K?g(z\ZèìEEMœ`­ÿT¶jÕDqI>¢¿\\%Y>¶]ñ¬ÿÕ±Mï€…ô8÷©,\rZsVó˜\rbj8O´Ù¦hğSšö.A/\nØş›Kø&IÒÛ¿6›M¾)¾¥¿¤Ãı©†ãÏíNóñ!A4“[7”C~Ån‚àƒº‘İD‹^jÒâ—ì&zdl9cáû½3 )š™Ñ®@À40\")\\Šõ½Æ3ú’¡¥\Z5ñô+ÒÂ-ûÔ8öuÇm±AÏõ¨×uäí¶	Ãû3VÌÜlßZ~™šxÓ£AMq·¬½X\"h}»†ü¶‡0Ìi€­ÙïN;f\0¬&k¡7ØÔUGÚˆpë@#\rïIµZ1=¢¥ºÌ»¬ÇëSxIHkíÅa~btŠú­t›Œ£>Ù]‹´—¬´B`¥§,ÀõEzÖö›tmÑ¥QÀ®BvêCÍï+•Kº\\÷	ç{ÂªÃ ¾ÊqJ9ù/ÀK³¥LÇha§xBNnóW‚Ê;~o¯<Pt.\"r‘Ñ•nÃ¹„\n¯duøC¨£Â’B5âTy*Êà&°£íy·?ˆò=iKyä8¾)poZ!mü’U<_›Ÿõ°$”yÒGÿUiò§Y #ğ\'t	‚ÑUH:*THöåöRñ£óD˜ØLäˆğ•Ä$ùãAù±¸ÿá9|6Q¯‰Ü™ÙÃ«Ş>éœ1•¼QIñ<›²3‰‚§½esÏİo­^c-ÙößO’^‡^)ãÄê¹\\úšÂ=Í?ŸVá¤‡\'C©dÁ±â	(ö¨·Ÿ!\"²ğb_îå«Ô³˜©9hµÓt\\Ö\'—…¤^¼X{ÌÒÏŠœ[%Éä2õ2Ô¯±>©‡ï2å‚£j>ITÌı{ [Dy*«$Eîã=Nn¯Ë5Ñ•Ğ>Á/5¥ĞËa“Ÿíô-ú“öÓV%!¥bwV†¬2†Ú‹Â²*½ML´ŞX>œ=TÆ\Zr¨—®Ş\\¶×i´,·@yÉªÅ˜|™AÄKµ˜F§¬UmÇš—\'UJZKOu£@/5_n‘¥×Gî7<OP¹5ç|D<¦Òˆ1Ü‰Pô=úÿø[Ú­Œ=n<~fé×ª…ÛåİpìgF0ÏôõÎo£.§¼”E…QT«Y¶<J¸HæUv	Fú¤½€i”Ä5x\Z	OØös8àC—_Zğ®´dæUøTÒNRĞ·æ¡<n´ÊÑ+¼ûY§´šjHf–‘şJã(ñšÅÃZ%×3i4«u21”ˆ¦’aACkŒg™?“š‚UY±á—¬AJÆN²Î’E1›„->èÆ* PT¦y*Ob”øjÂÅü&%ÈğA‘œ•Vù8G¶·vÉ4f:tÇıóE”¾0¾ß¹<¡™±¿L¬ŸĞİ3%?Ò†–EŸ‡Ğ/,–ìøk@• Vš[í>§¡I¢&–AÈS¶¹™YLßÍ$‰£Kµ¹O“•$ë&ÄïşĞUËQâ™àõ— €ù½©ø¦(‹÷Ã¼,sÂ/™ãP~).åN_İ\0\0(‰ƒ^¿ÒNV¹–Xà½Ae,¨¤ºl«–œN’İ<ç\r>–d()Y7=¯\'Ò	ÿ˜¿şÃ$şzêmşÓãûÿÛşzÿôø~æGgãÛ™íÛíÙ^&-&ò£[-f9º=xì¨ñ‚&Ô+~~wxQëSxĞã›G7¥3Z®h¿dÜŠ<´ÇÀ˜dn½ËhÏßf‡8Z0ÈkßwxíÏáı}<¾M–3öÇrë’Ü[©µs½>õFµÛ¨Gäa×‘ğÓ#v#hëö4Ctˆ6İÎ†¶¶ÄbÇ4)º\'âYÛ2¨wfO2-{Y¿İÖäUf\\âımİÉŸÔÒSVş™@vg÷•2YæH¦°Ï6× U\nröX±-`Êsé±%W;¼ÚÎ¹ÑE~fşwóäÆw¹ÏºŒ§Nvyáëgjw{Ù]®pÔüLv	[ªÖøæŒßs5_ñ|˜Cå*C‰4Ùx­‡! Ï{–já\nm—å­ªóåÅYQ*yø%.=)ï†ò	J‰Í%¾IéöÊo\0ÓÚ»D÷pA	¯ÔJµu%\n¹—ÎÜç=‡šÆ#…Şz‹gWæI«t±yrx€Ši0/Rj\\’%˜`¾Ñ0ĞÃåKÒ~\rÒÜ¹ºê*`D‰<ŸÖ•Ù÷¹/ôaĞ¯4€\"¯7\0ÿJXã³>;K?P•úšrıÛ¾Tõ{t¡¨Úã¢³rÌ4*æ>¶±Íi»Ø][^¤8×µUÎ\'^çg¡xÆ’1´\\Oç½/?¡ßá•3ƒ,‚/mwˆÑA9½95[ÂbD÷]-U^‹TÕŞÊ`\'üÀÉb8|ºéäëÅ‚E©–7*ûD¹2¥ò­£<1]<Üù}å™\\¢\"IÍ8ˆ—ÄK=OçQ\roşò^š/ÀxûĞşgL0œÊH!XÁµs†.%*Ú0]`Ö÷<İ2ÇÆúP_<2ur™ìÔ4mÖÅ²Êb!èiå«/™^Yå$•ò“Ê²-ŠFYİ$“ß“ºÎáZV3±­}R“ÓN¥½Í¸r—WlãË*?¬ä++ŸUSİ²ÊIå\'•­@ıVRU`‘&WF“ª’jWÌ.$Ø§CåORéH7HÁ©§Õ£øU>ŒĞ¼¬ã%nDE\Z¹¾ÚHPªª‘Œ9BU?}îi+A\Zø2à•G³œ‘D^•ZÒØ\'5•z¡ìEÀ‚Ÿ¯ÁÉ)xÓ<>u;òkWñ%bY)Â/BUü9çQÌ¦º•	Øç·’%H¦À}.ã$Œ²Éál)–àùC\'Š˜„±‚‰ÙgX±‡reL4ÈÑšÙ³c…ğ8êåy°ËÄß´jù÷ÓÓë+üómr~±¬tVû%$óĞËöÌ;œÏb,Ü¯A+â„·4™­<±IŒ=J…räYôèeËØªVX<‘?b§É˜ÄrIkKÏ¡Ïaü,¿«U¥¡,ùÙ—Ú™çyù5h¡(FãwyìûãÁ—$ÚÊÆ~VÙAoÿªÌß«VDÒ›Hë\ZXæÅİÌÉª(ü¦ò²b:nIŒŒ>ƒV2üÅ(2ñ!6¸}XGñ7åxñ9xÔ\\ğ¤6ı	âÂ\0ß 4~çˆ†}•¼á5¿wïÑçX«\Ze»ÿÏş’wû“ôûŒ+KştßÑ%	˜³7xéFKk³—âªK‘;‚§È½‘\rÜ‘µF{Ü\'n¯K}?‹Ü1µĞ?Ñ^Dª ‚î´Üx ¸ÓO¯šß«ŠTšµ<·E	õ¼e’—p?MA•jŞªŠ†W©/Âû¤ïÙ…cP(íçY\n&®P:ñ»ã¤s;®ˆşŠ¡ÑŠğDâş²‰RFÌˆ-³ŸÇjK¯ˆ‘&vÅy©¥ÇâÆ”ˆS¯ö¬\Z~â°Q2ÄŸE§Kº½;ÛXğóIğƒTd¹ªÉù—çı{>\\ÄĞ’5şßİZ©› ¢i·¿+pfä¸Uº­‰ºå^œ$MB\rU^qÏZşÃ§ı¤¹j0W\'İlŸüy-}œ¬©xÿ1}–ló…­RÏÜ×Té†ÂpP9¯ó¨+oSÁ¹ÂÏiaä%1ëÑDï÷—\n9,1×\rwÃğ‘İvJ¸RN”SÕöTÀ±È(RJ?¤œã©r·«¶ÚÎ/{2x%8â?Â¬”22òs	)~	ğ]üô®/­^DR$ƒ”Æs+¡SêéÆ‹\"ücÈ_™7údŞ¾0eHùÕA°æªÆ7?ø³ r~~%:½pAûYãÙ\r<»t’Øy	JÕ­R+‚¯\r?T²çĞ3QYBù4æQµ\\àûİÒ½¡ruÈæy3ƒL¨hûyíb„Ğêó ‹ÏFÑ/´¤©¯]ÛıÊœ%Fã‡Ú£àc|Q›÷t”5“ó×ÒÉòÏ‚¿M;®}J€v‰ÜYì±«À÷HTEuJàn:€MlğÃ—9¼z˜É„q‡+¢?â¿å˜dMVË;#èiK_ÿûãèN~•×õÔ¥ŸÿÕI®àµ2ƒ\"KÏ=›Ê=Ô²\Z¾¸ÙìÓ¸ñìÃ…ûİerâˆqÈ?‘È?±°³›^‚FîqŒ‡]¦aÒ¸¼v.Á¤ğ\"F¥ğ<Æ…ËE°MÉ?±É?Ñy(S‘1ôìÓ‘ìÃ‹»ğ¨®ë™‡qû™gAåH\rü,ÖÙwÕ°Nîÿ\nüÿã/ÁÃ¿üWæ‘Å:N`I{,ø§nWÕÅŠÇQ€’—¹Gº¿•Ü³°(r¢ãlî¡¨³j¾Õ“âˆ¬ÍZóÅÂ…í?Ôs-Ç5¢áó;ÜIØ ÖöS@¨ìî8á0WÈS\n”oÿMÑ½^Ğîş“VşZIG+k”í¡ëÓZèšò>M…ğ3Àİé(³ç\0úÛİ¼}­Æ×ÀÇ8…Q¢6Âÿ- ûÀ÷@÷Èôã·_«işZ½_k,=îê-˜Á»ç’\ZàÂ«Š\n18Ö²ü&Xƒ3j°X>\0îKî{å«dá•¼x,¿’—Eøäe²+Š”¾ˆ—e¢UÍEK´äE²PK^ÅËµäM¸hK\'K·tË«ÄË8~S½˜£Øk£—TL	zø;7\"ÁÏ<¹9ùòã×Vp¸ÂŞkì<èo/-îÏıIp~Of@ÌfQ*\"ğûËıÌÜ{e‚­şïffóŒ=£\"áågFy”O<Qd¡ñMj9Ç\r°‰áp—şW¨ó-ÿõ?Î\rÿ•´êI¢%d„î+¥¯xDÊ(ï>.ÑËŸ	İ»ñ›àËÁ…V 6$/¿Ø\0·Çî×ó…^Cº—”ü0%ÉŸÑ0Ày4?ßCÒñ%^Tüshß¥ÁÂ›œÙGRİù?UÁ(y]\nè{‚ûhÕer ãyJìGº{|O@¦}K>†kÛ6µì`¢\r/QcŠ¤äÇÁ0á>‰ğ¥ãz¼½\\?{ô¸kQÅ›:7Æ¾Ò²ô^ï›cÙÁ•pÈĞœ{|æ‡ê%üøk¦ßŸŸi¸pö¨|\rÔõºèï{zR\r}ÄèEgÕŸ\'hI-ø0ü˜×BÂhT[$ ‰ïœ(1ç§F6×îY2€aE^µyí®–I1¥¬y¼ñTã)yQ½Qno¹’Æ×ÔET¾ErC?¨ ü˜Sê6²C(Ğeâ©«2ğI¦ x@¾†‡l”ïLca/ØÀ§q£2Qq4³†U«›$4Rª·7Ø³*‡¤“O%Á–3Áàó‰Ëºñ—)ÿoşƒ³òöñ†øü[E[i¨oßr1üÊ²¾%`5åÆT´û(q·Jˆ(º™º|d¿?bŸTZ°T£\ZÌ©ÆZNdhX¾Ç3mãiğ¯D>Äbj(Òj³T¯\n`÷8h›@BñVœŠ“C“¿¥‡÷õfË°ª©~`I ÄÒÅ™½ì\0ŞÒ/HÎìyÉíGJ‡Pô=ù\rùÛ‚ŠÎ7UÆUéz©«Å_˜(t×«Õ+B	–;|•ÇÍ„\"Ío6rFÅ?È«lJJ‡¹ìî°bÈ^\\ÑŸ\rHÙ½A¢«Irù¥,ÂHÉù,M/Œ3~qÑâxÿ~(=!Ë?iŠÊi6¤Ğ»ı\0\\=ì¯5”*zø³Šh‘ß¾¼¤2A‰§æ7—ÏÆî…ø¥Q¤êŠş_èŞóğªåtówéîçğ+}üJCöò|äá?eà¿ŠÔKD _Ç !IÇÂ*}—´}½1İô%àÍÏ’°B™kÚ …[¹]uÙ&ôëˆTÛ@vª*ÿwÄ!ÃgEÛ6í*j¾ù«=‡Ha´ş\0í=a¤íUo±­€¿‡EÁ¿õYgy,QSÆrlå`2Ë—ı%\n‘AßR¡Èş´=´¬ùHbOÚ}‘ÔbåòëDîı;ö.¬x›”rıª0Ÿ¡!^,ÖRÔ–y‡rûğ”Ğ$5Æø«2Ğ°4~¥d$Ë—Øİê)v]ÌõEÚ©œ¶òğÅ”ÿícP-‰Ví‚/*	?¾¼)¼Ú@…FêÏjé© –Bã“\r #¿|N4¯`¥@õ§ô*?¸·^¾:‹_ìnYS¥ÄşÒI÷KàüYt\rMö¾Ôƒğçç\Z­§â¸ø—Ô7OC_ä»ôùvYbšHÕÉ\Zª)ÖJÇæÍ—Î_ÕD;Ö¯´ÕüJ[Õ]ûD¹XººÿıÃíÿçA¼†fµÎ[±ÈOà¯÷{Jğğ;„ş5uo	üå¾:´L…JğÉŒ-<Q¾ÿÃÏß7\Z}¢?ñ©~]‰]4Ü?ŸV~`VööW9Ş)ÌÊø„a«†›Š»÷Š¦>#½ıgpsÅ¾…p~ş\"ŒàjÚÒ‚2ÁM‘Ô\r„UÈd•MQ˜®;ÜmZBs—Wç4©yedñ§T—ŸºÆúÉ‚rA3¿Ô½DÜ~Z­Bß¦¦.%ÂÉ@Vl$JËLšy¼TW^êéT–›\'¾÷IRÚ•Ê9eÛëÔñR$ì·ç©\"~µÙ<w­šƒÂ%üÓ*%šô‚G@v˜Ë)¥|¼>iÑï?o«V:\'OäV›¿\"ÏC®º[ŠWMh/‘_x%îÿåÁ\nÓ®,Qd¯OºÁºÁM¦Zyk„ß½7RÏUÉ‡ŠÒdyÛ÷F#—ædüâ8BŸRTÈ>LC»>Kr÷+`dM¥MÏ†Ü‹Ô¢ÕiáƒÜ¬¦ºm·„Ô_À¤ò¥kÊ²&Vhå“?…š¤ø2»°.¿ÖJi´Qxø~j.—F1x8‰DH¡l ôØÎú’e˜œ¥#„şöt;ùC¬Ğ©¨Z5®R}³^Zô-r¬zÊŸYßûÒsEzl\"Çù»	k1gIY6èÔ^’Ş¨ÊìnÂ\rŠ„\"gÕPD[usÜ+e·™çX_‘÷çã•¦ä74k{Á@¡àåWŞN˜†¯” hä¶ª*ŞNÒH\'y%‹8!ÇCÂ4õy/*öë–Zâ\"M”Ïi­\Zx&¡ayÖâ._\nu›Üše²Úó¼†©–bOéÅÜá‰QÚ}ÿ<,R2U·ª`:dÛ¯,´{ıWX!]yÙGä´Tâ*¸˜™´<ùsŸÌ[6Ug!m÷!sğHgöœÏ=›3§ıWéá>¯­â2!áE¸/±å¿ÖÖÙ0Éú¤Iš¢é²ı–º»¦CæÄk¤ÄQLÛåO®óÁYUƒí—…9O¹ËG7‰ÁåÌ„GIÉ[v°oq¦r 2Üó`cùsÊK/Céô2^o*¿”^†İÅé!Ë%Ğ{z)‰°½`Mk¬Ók«ã Êä~§‚CF±ˆ §’QëLF—ö`|š-ôèQıÃ‘f×\0f	Zb«ŞœBg©.¢ĞGÎÃé¼MÏ¹ÏŒøM’†0v-Œ…º‡tÛÜz¥ñŞøæüæ€ sµÙäZ‚A¦c—Mø‚·[]ÔÙ6êæÑn\\,1:‹Òßr#syÃ¡Ãˆ45?SY¹S»Õ»5`‹÷<\"Fü8˜“î¬¶ÖtX6‡;q0ŸÍËEÛÔ¶Fo§P£:X/ìlr6Û¹Ê0“=‚1¬½a°ÍF1µ‘ˆ²³µ{Ã†İÅ¯\0‰ß¼Åp‡×ÉæV›Üà¯Z}İ8ŸÎ0u[Üí!}vGOû-±ëäş¼lK–ÆSkÂ¼ÍĞöúÀË*á5\Zû›Jµ®m04F™½Ñ¬m5ÁÎiÅ\\kK™õññ0’j±h­~{Ô×h³=ÚM.&Ôû‚ÍØ\Z]÷:çUCoWb¼mÎk{jÎGèQ 8AN· åµßXí±=èSo=À7\0›¶ÎätÜoˆªM¸(¸tsÓ<N4éì1[b´ïÚd§ìpª^ş-¤õ\'Ù?®Ñò›Úh‡:ºÿj¨õ^Æ1Nhy/–‹Ë™#U’Gï‘.¨»`a•j³è¦\nFú€èO&‰G&#É‹`Òéâ²Uü±,Ó…¤eÛÏ5/õ1h)îô×ŒŠük	§{¨4yMdíèc‰/ÿ-&Ùÿ•˜á-¥ø›*:a†·R²q}fìË;@>?ñŸÎÚáä¸biBé+ô\\Ÿò%\nÇÁŒåû\nÌË¶J6£‹‚üÂDDõâû\0¤@©9ÿûLtº}¾–Â²ş¼D(dÃsœĞÒS¦3\n¦ó\n~2A	‹c±•ŸNÑ%â	iT¦—Ù\0?ş/|Æ´î!ì²ïCÌ÷?½õ\"·/E\"7 yË_©ZŒòòiòğn¥ÚäXıHç? JÎŸ×<MT¤6ÉB°Y¯\0 D^±tã¾Eá	+´\nùÌ£QJ¨ä_š”(=\nd’;WLSC+ópµ>î+›hùVÂÕÌ©^SQ…Ş¢E;_ş5¥fËYUN.á—•3X«§ÿ3^™Ûò~¦˜ók4 ÅÓÒJĞTã;İ¤Âàå/5•èª“=#’²AŠ Ç}e>kvÛ´ä.¹¤±n?«õt ’\Z©‘HU²¢³a1¬n	eŞ£uªº|\' ¡±?xxKŠè©b±¿txl‘÷Ü‚ÓîToã“9hœöq­nısØÀBwE¯Ooèè‚YúM8ïen{ììcbDwr?•ÃjÖÂ¦$—àKrCa´Š¶ÿƒCD5ïC¤ÜòÄ˜s¸ºÌ:Ùh—ùÄµH­£S{ŸsÌZ$)İ£GÔ,‰«M;…³V>,ëÓİ¯*	}în(Ú8ûºw7“äÎÀ\nÇrÄ‚yÃÖß%6ÛúŸäşs1D\"y–#íf¸[Ü­âs€^o9–ê’ë™Â•]öJ©pmW’Ò*€„Ãˆ‚z¿åš»‹™Ì^Éˆ=O=à·ÙÈHd	Œ/‰8I(ƒŠ`–…´/…ñØÆãŞ!£=›Bñ,xä7Ê.I‹ÆÙñH)ó37q!aø‡û÷äø†\0¿…šÂ8\nL^ÄñıÊãï©Ü39ªËÌu˜*¬‘JåGÀçNp{S´rH®›(Š¿çÛ™d*ÙLU¹³E&}U\nµ8eUH”±*$“Æê$I]U¼3Wå€dÒY=€DÉ¤\n ¢\\R9™SIR©(§TH&ÑÔHœJ«\0#Ê¤•ƒ‘I¯õ€‘$¨*\0‰òSå€d’V¥Ä¯^#ˆ›“å\0Qˆ’M*G*û\\ıŒÿ\"$Ç²YÅ‚Ÿü¬†‹ô‘~	}aÁO¾Â‡ ñò(£/¿Ñ\"}Ë7¡»!Y²UMeÓ;5EN~b2	£ª8ÇKPóna›?t••ÉÇÄŒH¦}\n\"·-|±v„Àç;KúäÔ\rxµø³hn‘/RØÄJíõïÅ?M}\ZE|^ç¾=ÒŒcò¶ø\r®~úfç“pabCÌ³!QâıŸ„Ñ³(ŒÁØ“S.å-¾^.óü’lO<²([Nì¿>É »\n@–c¹Bg£=éÀ…İËcND0ÏpçádŒ9¶€çÍ>¾_(Z>Ø\"†Ã0øÚ`uXÊ‡œãšM±Ğ÷hva¯OrËåÉº)püİ”ƒ\ZZòL³ÏÇñŠ–y“k\"\rñµ!ÿê°”y&Şv ï¼9\'%)^òâ$p\"œ2ÒâQşY“ÏGğ‹ËºÁaÎ¿6Ğ_ŒÒAÎ¤÷KñöÃõ°a\nÔÔÓ@h¿2ÄŸÜ—Êıññ}}¾2º‘¼ı\nà‚dÏ†vßø¦x7Ü(Hè%Í>¾_(Z>ØxƒäµÁşê°”y’î-;<¼:ŒñÇV%!öà}„Çîÿ †\0#O}>ˆ_.Y>ÚÏbÈ‹<úk#RNŞ\0°`¡ÛÑ)îĞ…ó^ Ö‰¸”?¨‰€\0Š÷Ñn4+®ªL³ÏñŠVlŠP`+N8tX*È›åx´Ğ÷ 9ó+£$ÎY±-lŠRC@Å»hIğ\\ÚäóübÁ\nÏ„xîµşÊ`”{(+òBÙr~i7È©|ä}ÑC*è„`ñdQ´8©©ö>å	_)X>Â\Zü¼Ì;^‰r2†‚ŸBÃ\0Èâ‹§£{á’Ô%’4…cf|òFõéÈ_\"mìö³ö¼½D¢„·_Ïš8´óJ.‘²QzÓeÃš¢©Œ†7‰åØq?úç„ôË¥ÿ8íı\Zd©°ÄHã9aæò‘ßõ%ª58øÉ¯u4ø¹ë*\ZÁÏgmBÆrÁ¡ÿEC%¾Y!†~bDRŞéétŒùÇ¼UU–z/gŠNGzú™s³*(øĞ‡\0w¯™Ì«Ğ©ó¿Í;æETsAÑî±—â¨áŸç@ı¼Ğø<í¿’rk)wû¬ôo)qky­ı»1Kn:²#’§\0ó°SwO³ª³OÁ„«¨Ü–èyóÅ´i²	­î#»PÖ”û	74E,dıÉ*­?œVŠÍûX?PôœyuÊÁeÆã‹³Z¤ChMÈe,«¶üéìM(²®RáUM.–÷kîë_B Š¥?6â´×hòÕ‡Dk‹Í=“„ßKè/0ÒŞşï7M-´’²´Ê®€ç¹£_kÍÿçßóË…‚ÏÈ7ÇÄ“ vÙE×È’cØ´ûU±½4å´ñv³M}âËşbGŠ„Y¸ÿş–c)Oì1µ÷Ê¶\n}p•]šŒô3:JÙÍÃ8y¬]ÁQî]¿_è<ŠH¬ZÜïÓõ2÷õÙö¾4óñ§ã#	* ?>ïÊC©r0ÊPBáá!úgRYC¼pÂïmhT€ ÊZì	ıû˜Œe8Ş=WxV\0Êñ‚©¼\Z¥™áÿÏpJ,‹°««ÚõûßÚşÂSÿöÃ±ùğ¨[·E§’+ê0Ò8Gë¶_¤îóÑ6XÍ© ÂØDús ä_¿‰¦ûÿœÿù†~~û;6ñ¯ª(©—ÿ_ÒÒ[`ëÏºÿö7QçDG>LË|™ùo¿½—b€ Ï¢ø¯aà™’ı?…ÆÃÇU\r0ŒH(ürƒåíU5‡‚€ÄóôKÍ¹nIk®}£-‹Õ±ıxïO™Äô—äÆI“cŠ\Zÿ&±šœ¾ûÿÇÿ‰zfK¾a¨ÿ(çuúVê>è’‰zøN?„ã‡Hú!?DÓÑø¡ä%^Uß Å@jú”oü²²Æ:NÒÛØ÷û_ş·\0À_ÂúÉQùÒ`T J7WZŠJˆÆYÔÌÀ®´•òÏÚ¶[Z\0‰rƒSGÉ{ôñ¾¢‰FTâäˆå°è½¤jzé{<zï*şéÛ–ÅÒ2Í¤Lé[öÁç‘¥E¸¨H¨¿)-ÀGlQ÷·‰¸Ä{X%°%L?2–Ïª´K;•3ÅtÕ(/ÆDb™ÏÜıå]Z(!ŸôX­´DL(²xŸá¨_¦\\Z<¦×ö7ÅòcšQüÅZú½ÏxY‚1Íğ”XQ$&Ûd…Ò÷1ÙñŒ´ª21Ù°¶mzqôÑ3¬RZœ--~²JÇ¥\Zœy)-ST ß•’æ´±Øš¨ÈQ¸´¦˜­ä³üÒµÅôùdh¥` ˜B‚É(}“„¤±¥$!w&#„¢})9C1UœMí¤‹Uô52¥ª¦\nÂ2ÅÊ§ŠIähó¦PJ©PL ¾LWY$a.}çî¯Ë{Sgšåc+<Şûb]y™xšC÷œÒR¼œX]´Ù²pÌKÂØGeïÁ\r­t%Á1‰¨®¿É•îXpÂ7‚0ŞËŠ!©bÑFZV*¦•pGÄì²Rt©hß--‡¥ËÙ•¨áébû“ãªÒµ´`ó±¦JßÇ$ã‹¢‘YÊæÉM=ÊVºó“Ê1)j_óÙ\\Ç$å/E×L·^a¥X*ïì\n¶\'T\'\Z¼Zº³ ‰ÃZí–>“+CZZ\"&.·‚¼‘˜´DAÍŒf„Ù‡s<±U@ñF	Š<-‰¦$„ç%²¶‰ÒE`‰Ğ$ZÁÓ?—.+$&9‰uÜçïŒêIö±á”¾)ÌbON)«Cøm³”Ÿ\"BÂDìJÄT‡”CÔ=+ºz”€îÓv¶Íj^ÂÙr•\\\0E’Q<9IæÅ²b1¹„ÒÛ³r„¶}¡ñY9,M~OÊ%{ÚIt¢À•ÕE›	G‘ÌgÅb²ámÓñ—‰j—’4ÊûQ¾<P¾Ø“Š’ÉŞÇ–îñ¨˜Çª&¶¤KUNkL+—\ZPºL•èÑ€®çó,é¾ßYMiÅ˜²¢€Ó¥%dê–/Ğ•ND£ñ ÏÒ÷XŠ0K$Ûœ¿ölÕ)•8\ZÍU^c£ âO(¨S¬VLQL;šÈ–Ê|\r>9/T\\L\'âµüõÿÛÜ69ªeëÂè÷ş÷Æ÷t°jáôŠñbÈòú†a…¦bÿ÷‹™R&ÊªZİgßÓÕ«*Æôc7æ°ß^Ï;{Ğ¢İÙä‘¼¦“y_°ÇA™¯Çîğ0Gğ›|‡	zY¤‡vl\rûÓ£;÷d$ƒşğ{c‚è…%0ê…îÆö0ñ¶	¯ân˜áG£gªW,?\"{?£¨ì\rR½¢MÒôš-üEÀa¤÷Jä’m{Âx¤¸ïÉÌG5üı<Hc=Ñs†ıætÑõúû“Ñôöx¨,yçª¢ò‹KN‡›Ù0H	÷ŠÑ´/¶şW¤olt±ğ.“\rŠOòÎJ=¨îIìİïÏGÔ9şƒ‚ÄŸo˜¦Wg^ùKç˜} {ÅY$ù^òôpP>ÔCkX•ú{äbeÒôbÈƒÎ”Œ¿Zó¡ÿß/7ãRõréP½Ö<Hh?ôÎœªç¤,I½Áõ¤à^Êv½2¾è<uçŸ2}¡Ğ^ Gİ®œPª7ƒ.şü AüÂR¦ˆgçöÕè¡©¯ÆE>m¶AêÃ.s¿:XRœİAŠ;û”ñ«8	Õ[>ÙÅS¹HÀáÙïÍhÛ~2²a…Oİ™Ç³¬áùÓï¬c”aè%Ù {é½o‡ƒ®œÓ›Ç—Hºs96\\½\'wÚ«ÛÕ/­-{¢{e»éøÙ°,Ñ‰\'¢W’DïüÇàİË†Éâ×£\n#¾èìPñe—ïå†‰1<İw†ª²ÎÓT^ºÕ‡Ÿò`{ôŞ!óÃ{ÆèÙ\'ómçr9Ö Ñ£ùœ¿\n$\Z}¨ùr#á#k_Î»gB½¢¿ÉÅ?z!=XàŞ3LÊÁİeŞûàt–àp\r=«—OÁ„Üôó<yÑË7“,mË\\Üùğ¦4ñŞÙ¾\\9úƒÜbŞY;×Ÿœ°3¢š÷±…—rÒ¼3w¬Ÿ/H\'cß ÏöÍğ˜‚\\ßËA¡aê$É0‰Ñë÷ÌìûÍ!ƒ„f/]»ş]/†\"zãvcØD7í7Ãx8Ji½©ÙrX†[½‘…nÙÃ+ù@ôÅjXwvs“¤ó+na…/¨±OÔƒd½ĞiÌAcÁêíÿ®â¥\0²FTÃÍ\"i^	T‹z¤z)I­>Öp	ÛÇÃC{S³İn,5äåÉ`™>pÕ½ìïí|˜¬‡’Ï2ëúHQ¬w9ï‡¯C46ôlnÒÜ¹í~ôó0»Ü7Ã °ûÛ};ó»p;A2¸í;¾!]Kuöíå(ï…~°ŸıÑa©dğ^Pï²Ù{ì‘+»v>ÈŸö?;C=ëŒ›Áˆ¸MõÂ8/íE0?NÇs©7ñÖqsg\\/e¼ÅJ¼ëçŞC4½exÑZ_YÚÖ#åkŞ¾sàE³~Iœ÷ká%¹ù‚Oş¹ô‹WêßAŞÍÇFhï´&Ng×ÖÑóQY„v6(µœÇƒã[v¢A²Ş­(ığ\në¦ºóN7ôôrlõ‚ª·£n…õØîú\"Û\nüAFuú¨Æ…Wº9GI£ŸÇá½æÜùÄûBE8ıñÎ×šÄé£§—pVÇr¥ñÚ†{<Êñ+)÷à”\'êAí÷(•\'ÒêîÁ*7â—}Å©^w${Ñ;â¹w/ºug¤;R{äÎE¡¾¢è,Óe¸Ãz¯Óû?:Ş¼?,Ùƒ[^ÇÚáßr*“â‹¹µ©^ÏmÏè x“á¼ò2j÷È•k=³ÓğÉ´~|ğ\\¬÷1naaOîQ,}q{¦IíáXÜãYòè îÑ(NvI¯5Lò&D†a5p?qõÈN¥>ÜƒNŞîŠ®¨§‡ú°l„{ÈÉ•âı›¶!ÊûRwB-ò‡F0Ò¯õ0„F>­t·lá§Õ~xø\\éõØ=FøİÒâ‰[Ş_9åsÍïo\'¢‡¶\\rÈŞ2Â]ÜAÊ^}eÃÁß\'ár,4ä]À=º¥ŒüÛ?ŞàÎ¿|e8XrÔïÌÛ¹ß Í	/~ƒï?Ÿê’õ±Ôòr	×5·à YïÚ•ÆDwV´3}÷\0˜´lÛ‹ØóíA÷ ˜È¿¬À‹¨$Üã\\Ş©^	Á=æ%÷|{õ£t†y¨G¾\\¯.±àÎ\")ıÜnÉ’nÏ\rNúv¸S›Öà¡w¾vÁèhü¥tïq0è‡Uh…ù@üJ—öĞ¯ˆB| ×ey¾ïO}âÎgaëm]À…/Dn¹MóáƒE¸Ç·ô™1ÏàßòF5t÷—,ÿÂhƒ{¤Ëfp¬Qù¯˜{‚\'|Ñ ñ™n˜Ë{LKhw.æfèá,7šW<€½³ŒùÅ9ü†gy„ù¾y`ç0_Ñ÷á‚PĞ ]ï‹%Q:ä†{¼Ë-ã§ØÃ-ÒOëËéÑ0÷Zãêù\'s¯á†ôC%/÷~§±Ëìé´û}¼nÃ½ºó©uI\0şu,óAÛ£j²Nõ<¿~<Ü~/	ãgã12mì§E9¦ƒ†eÀÉÊ÷àâ­¶äÓ“Á\"¸ÇæTÏA× 4(zxÑ¹İÉsğÛ(†¢N0şæd‹…£óæ>=ÆÊô0õôA.·>Q¾£Á=TçF\Z]ré¾ªµÇë<’¾ª¶í\\iã2²3ß|Y/2@û²â¬z;ŸŞS=^çNôjóö &)‹ÒøJôĞ;å É	ëwŒÊó{òııW-QÏ}z	„{äÎ%1ğ0Œ&Ş\"øúªß+<DiöægGëfúº&Ş<Nw\rîéÎ£?=§Û6FùJıõP7¢/æªGíİ*‡ƒ=ê1;7Š¯ªÂzo¢[/Qdpáy æÂÉó@øÊĞëá<¤/}é¹¤£Ë…*?¶†a®påÑãüA>zÇ\\”ƒìÕ£x¬Ì7ŒáS¸GñäA3Â„{“”ÙëÕyë\\âÄƒ6ÎHÇôá®ôØœ—ï{…è…ÿ¤ÆİË7Öéğ6ì¡:yù\"v@¾÷¼ÀkÀä(ÙôüópßF½É;(Zz(ÎyĞsí18•íÃ¸3CfÇÙ°ÛãoRİµ/\'|ƒ<Õ#onâæ‹˜:L>b»Ş¿ÖyÉñ=çı«ÍD=Ûdf>T/k{¨ø2<×cv*Ï¶ÃK,`Põ¸³ÙÉr¨ïeth·ûŞ¾¸ø†ßáÒóY~ÑÛşÜúrC~gF—E1¼zhOC¨àÓóöãƒê90É¬WèX¸‡ñ\\‚yÃ©‡ñ\\´”_”Aûqøs\\¦Œ»İ”å~1<cf¿/³KœéÓÉZ·é­òŸ<¾‚{0P£{Éğ\\ßÙöv\"<DÑã2Û²O\'àıs£øbõ·PÛEÕÙeúîîÑ@Ôƒd½ĞízÓOO´á\ndùî têQ@©o[İ_épt¥½S½òÿ{Õ¹\ZÃQÍõsL’hğXîÁ>a\'¢J}XJõGT=Â§?Ê\Z¤éİPÏSõŸT´Ëz€O&ÃÔƒ{ÌFië¹¼\\<ãÎ†í½8Bƒ\rì‰ä4Ş¾8¶‡MHƒx øª¢Ş¡³Íæ½TÉÓùJ/ã½a¼ÌB¯ıAòşÂlğ\\6Œ·åyñÁlôF’}öõ¸#ÃÆ›¿VÆÖ+|lÜ™år©¡1|Ü÷¨¬«#™Z/bç=ëJuMè8L†<u\nİ>‰…Mô±ÑË7Ï×û“^cÄ—İQÛ·ç>o{sK5\\óãtë§¥ï6Ö‹òÄCùëRÕpI—÷¢üè¡|”œı¡şß>.O>”¿F“Q½)1H7ß:–=À‡{l×1w®i¾iÌŞşwìN=–OašÛÃ2ùüğˆ{Šåeš¾ƒŞ	³2³GŠ½™yqR\"(á2öl!e¶1¤{\0Ùó‡”v”»÷x2÷K½k½j¾¾oæŠ4üøvãÛcm·8—9ğĞ»¤uÍ¾Çö°×Îº—h_Û÷=äìt\Z|KôîAg¼>-SWa=~‚{ôYnÇOFÓ2ùò+¸¤]Š=o‡‚ÃLß£Ô<?ïfpPÔ¾!ÔnŒs¹qìÎû·;,)úÏÿõìI™ï\r~^®r^ >´v\rV¿°fz¬ÙÑ¼ÖcÎŒ$\ZŒbÚo4Ó¼\\S¤?@~n¨,Œä…ïqfÅ°½ÜcÉ:NÌ2†Âö»2¸¹{ÙuÖ^}n÷Ø±ËçÃ[¿‡5v8h›÷°±ËŞ¹ñÖğ˜õ>Râ\Z\0=@ÌÔÃË˜‹ác+û_ši\r»cC«na†£_=6Ì4;ñš®=6¬#‰®¾øXîÑa¡åçfræö Ö‘é‘=hê¾}b`~1Æ7˜y…‡{z˜Øöòx÷\r%öF5¼|=NìzáÉ Aš¤ÍËèB¼¨îáavc_B­/¼ç-@r±{Œ¬|ÑŸŞgğ³Â³.…z0<Oo[ù\rÜÅ:Ÿé%½ƒY¿¢ê/éXÊ²İ‘v£x-¥v¿ß‚ôX°jHV#=Ìğ_ùô†(HH\0ó“ÚK!áH\0»D«ÂC =Ì:”@z\0XîÙıbñìÓó?îèƒ\"[S}ğn\rzs9›ü˜µ†kz;ûŒcÛ,,û\ZŸ¤|s(rï…‰Ào×dedúAH/}<`Czì×¥ßù‚AzÜWîu›#÷c£‡âNHıÊı(\r›‹÷=¸`oÈ¯ Ñ‹giŞ¡öÅ+À>ˆ¾<@Ş.6òõ(üNß>¶ü®é‘dWppn›Ù @z4YÔ¹OÙË½¿Ed;övá ™õfe…1|aÒ£ÉÎöğÇéÈ;TlĞ4@z,XÔi¬rĞ‚CzH×õÛŒüMİŸzœ»v<l³!=Æëì…Å…¼İftÉØ:HG¼è+²Ñcu/GO>TÖ­G2(÷‘çõ@6JAz¤×#á Ìè±^±]%€ô@¯Û¬…ÃáY¤{½}ŸÙÉußôm¤Çr½e3Èì=Œ«ê\\O‡iŞG6lÀ =ˆëºe^íâ¼u%zu\rÒ¸¼¤xÚÆ Äéá\\g_\0<“¼Û(/z§¨4ªÁ3&}Ç°ûå nî±YùØéGŸs°Ô5’´ğãËIùé‘[—Ğü‹Ë»e×éåZÛÊóaÖxûfÿò%pó{šæûÃ(èSáÖÕÓ¡C…¯“vß/æI1ì˜!=î«/Uóâ“v¤‡ƒõtğPá{ëƒåÑçòĞPùG˜ìsi¬ü\'¿_S>HxgeÿûıJó!š;ûŞS•>~ûùL7z¢+ã×”o—øfĞ\\B7ƒb®Ç‘=\rZøH$ëœŠ£9hXô²«—wşİ‡M;f†ÃT¤u~ó-Ğm#=tÌKÊìzQèpç{lØ;Ù¯¼?Î_Ä…‘öNŠ×ğŠY{PØ;%:\\=l®ô(±7ÂA¢ÇOÆİL7ƒ×ÇÙ«Û\"‘8v%»Ü_5Púµàß˜÷_¿ =†~û\n…ôh°[éë®St÷½ø‚R¤´/g¯Ãtı]M™nÙ/.DzXf»şEdë¦Ö™×ì×ü’Á/7‘6x€‡ô¸/×}}¢ˆô€¯‹ë¯[gÿ…Èé±^‰\'Á…¡b?\n½ =Îë‰ğ¯³‡|¹¡›¾Bh#=â«ê*»è©î§A²·¯»=îŞ2;¾J!Ş¢ùY÷r(®‚ôX¯N¯Şˆô ¯+gÅİÈ:í\ZvDÃSÛóÎùqÿt†Œİ­ÆğHüº<Ó9²G}á”¢gDz;ÜHûzÃâ_Q\nƒ­õè¯7Òºy˜ö#ÄÿvÁÙ0-úö†`¦ÅúI·Ê|o¼_ã”^ŒÜAâär{ÌàÆëq_¢áÎ¼ù\rƒú¶‡zİ?Ş>RAFúGªõ¡ñ¤lÛA‚·{,#{¸†^…^P#İ‚îŒwÌW×ó…H\"Ÿ —›=²øe[ƒ§øÈÛ•Lï7»¼r{˜™X¾÷|³¿¬ÁİĞÃ½œ+Föv+ú İÛÕÛƒ¶JøJ³Ä*;“Ë+ãá.÷ìá×¯‘ÿuùÔÇ¦èáú—ë%¿ñï0°wºaNzÇ‚uúü‹\n­Od/ê{;J¹ßQfŞé‹PĞ\'ºü…*èñ]{Ã7#=´ë’2¹¸$ü\Z$B?}\\Ñ·[™ììrZ7HráÇÛöfêzNóéÂş¡[ıŸráüB&³¿:şn¿\'yı‘¦³îš«Y|éh÷ı¸ßQÓ±«ë[ÿâvÒå”~u‰Åt£Œşœ]¾éÊ§ø“Ñsß¼¾ı_×Ò^úßğ?ßºTôEşu«ûQe»ÿ¼õçõËüõ»äå«ÏG“ÿæĞ/†ÖUşÅØŞßîíåÀèúw¯^<¯SÍÿŞøĞ/Æ×UşÅøŞßŒïíåÀøúw¯^\\Çç„~Ú©±Ìo/†Møï\rú#ò³,É†õºş×wøøÓPŸ_å¯Ş$/^>}^Ÿ:ãßäĞ_üÇ÷Wƒë_}ÜıÍçÁİ^>½îòiú¾+zìß?w½<ş†äßüØñc¿°¿]„šİºõdÉ/ı”â¿ÿßksİ8™ŞY›ß®…şëÇ0“ß†^ 8u%éê½x êWì±öW4\r$Cul°Çj^?ÔØ­úĞLlè§‰xÿ^éç\n¿ªìuEÒìıÙıÁ\'Õù‰ä¢Á¯	›Ÿ2Ë}\"»&\nüñ)mß;Á%ñPr­wŠ$»6öD61²äQsùÖá=? lbĞç¶n9êï40Já:8®¡HÈ >‘äÁÛ¨oI?QtŞï&oScã¦A|\"ºæÊşNrq‡ß8ğèÉ=üˆ´1L·>İ®ö¹Ø\\vıNËR$CÓ^VöBûÇÀöƒ¿&ŞÃñ?nÿ‡şDÿù)Ù£şeå·Leü´ĞC6ì<ù³’=“~(}Í@x¸‘ÔßoyÅîÙÎ†2™}ÎVì8oéÏtË/ó¡oI»\Zÿt³Ì\\ê¾ç†¾Aßğ®âË×‰Cº9»üu3GAÿ|èÍ‡4è}“Â¨ûC}nõ9eòó¢ü‰<V|eíÏó,ÏØÏ*~ÎÚÖWwOÙvu_n¯úãy Ÿ	3Ó]%RªgQÿÓŠ¯_;ÿ´ö+Õë…~Uó=ãÜ¯Tß\'§dŠá¶nè¹¼!üdVÚ}]ìÃ*Ãı*ß{záÀç~Xşù!İ^nw»Á/.g	xô¯_{óeáËù–bô’²øÛ%Ë-‚\r¥G~LvÙ;k#l4\Zq»éi,7¿ó‹æÇÏ8ö¾{ßs ß»ı´êç¸\'ğ~zö]ùş)ñ$\0~¥^İ¼~1såØ‡T‡Ğ½Ç}æD¨—sß~:#/GøŠ1^ôìÎrŸ8ÜvÔ1ò0ŞÆ>°—w—Å_õ½#îYgy\\ûãSÙç\"ÃÃ~ÿı2¢PO;÷ıß†ÆşÔWä·—ööÏcj¿÷™J¯*\Z:o»ê–üü¿Äjşı)xà›¯*˜§·¤ïÕşøÄ½ÿNmÃ«ó”ÜôMê>ôáSºó7æ»æ¿ş…=/íoMÔµ‚‹N‡“ışV]ä{U¿\\ø+–…¾‘ıwÙowğçm\\8ğM9|Q¥–¹÷$â>\rõ+nxKÛ§³œıoŸ¿nú`õ¿¿¿xØöË	ï $â}2¯,IştÉ¾Zì:3=¿Ut»ï«¾|»±!9°¾Ğ†…î>¥ê½~ü7ê0/áİ\'í=dK\\¦ú’øA¬>™İwCşÜü¾Ïæı“ø³òÏ#xÌFÿoTódÛİª×µÖÈ¶,ççµŞ¬úOc{ò]RüõĞş~-_L·uçæë\Zø<°§(Á×¥_ëoWòÅ°n™Â?qşwÏ·,;ş~?¼xÒ]WŸnô‹™²Cf¿n½—n¯6è£ı`L~A;d|™¬ûç5Èê—VŸê{i»‰ım-ı?¼ıømkß4Û½|„óøxÙDFvO¦z‘tÿˆvx¶/âos»´ÿŸ?Ş~ÿƒÎ|=ü#ï¤ÑVé66¾}ä¢~è·´~Ç_?›ıœøÒç¹§f~-hÿæL¾	Õw¯éÉ—~:/»$Ñü[íÿøä’İß@¤å¶EîÍ\\@×ã¹\'cúvËÿ^ö–ò’#üâ¢şëú+˜Æî_—/	ìÃ,´\nšŒİ„îş7_®=~í^~ä/1,½¿üëæR¾üÀ­C^İ¨R´]`v©xNEK‰»X?\nÕkY[ã|È®ëşïÿıÏÇÎÜóÚŞşùŞ<¾z3S©ÏîĞ«±’¯Ôús¡Vì…mñ¢­Á®Ş*y.éÇ$ûnŸ;	ó±Æ+ú±gÛ«yğ \r,Ü\"møÍÒº¹¾|ıhûøûĞæµ#Ÿí¹˜\\=ƒ_¯ìã ı¸ôs3£Ÿ÷ğz£Hö£«âí¤™øqıYx×oÑCëŠF|R*÷°ÇMDPİï-PïŞù}*‘·}~ëùèúP]°#?^j¬û’½Í²nt/ÊÂ¾wçæo}Å³úÇ×lş8ÿw–½\rı-}ÓËƒúê™_÷U,ø­•Â/BûÇ#´à\Z{d\0jˆ;cbCSğqX·-çŞÁ@_uï›şã£xÆOü\Zo\\×àûÓJ¿ ÿbUnU]ù¦übŞ+ºôè¯{ç.ºæÆ‘—øäÇÙ¸ê‹ŸExœÜ\Zàï`ä{ù›Z… ÿú«©\\Ñ)ÿÆüÜºx½oòëÏWûm°Ä¯¬Äë	|lé²}K10ÆËÃo—[FîmcğoíÅÓXÈûA£Œ¿üİ¼™µ;ø!2ĞKŸÇĞÆ¿ÛÈ[¸â}!.ÇZÿf>\r7÷¼ïñ»]Õßgø½ş×uuŞ~oşus«éÌÌÂ»…ºŸ,ñB‚Ü\nDv\\¾¸)õ¡=ÖG_ŞEŸ+½\\ş£ÇnÜ¢ë-=ßl’kÙ?Ÿ2}şB¡|öyË¿ÁÑş?7n‡®ïvù­SĞ+^Øï¦3>RÜíê—˜„ïØWÀ ÷·8·—À„şİ«¿¯@?3ì%¨ó¦^ß4ÑEl<Aìíş§³Õge|=õ\ZÁ£?`º{=ëåOÏo?\nŠC|êî‡\róí·?û”A–İ™)¶õãfxÉÈâ›¯LûGCõAÂ¡_Ú©ƒfÓ\'“÷ÙSê½2º¾½¢ül©’ï3{÷p?éÏ7IõÊD±wErıùvğÕo£§„C\r¼¡+ŒFšŸÑŸ<ŸÆ¼îô£‚{Ğ{_jøş,à)şÍóQ¨I²7š¡ÂÊ`@Èv3™õ¼Ï/•éFvÉ™d=/_nrÊÌ»ø0_Hu}†ÊŞGM!Aq\rÇ€?h»Á®<C•ÿÔ5ºÔó£Û±OûRËË-w%Ä\n?I%âƒotµ/`¦Ûè:Yezú“MùÔÖ­‘! Ï‹üçå¯ĞúÆS5äg,Õç*n‘ÓOÌùô(uZ\rû>b®\nŞÁWˆˆGÖ@Á{`şS¹§ˆú@¹ës©\'0Ö@©ø—§÷@±;˜ësÁ\'\\×@Á;4ësÁ\'”Öğ´$É¯×Ñ‚ O¬vÁıyË,ÑùÖ™k?G¥ËÁ-ì16×sí÷é”fö…/û0âcE6d£¶ùƒÿòƒÿDğÿêÖîõ\r–öí¢ö?õüvKn\'\nİów›â‚1y³¶nŠwÈÖ²ËŸ¿>ÆP?·sË”tµn ür¹Ì=–şq®PKï‡ğxLA¤N\0^?LÍıããûÇ‘_Ä½¥Í×~¶\n~U2_ÏE³Ì÷K)=Ÿè\r£{>É²û<x•ğ‡ó=b4ôv=û°órs@>™wWänm<hwòÁ«F)=nÏ]|ß|:íxêŞ¿nÁ¤,®I`oØg²WÒÿ®õß(Ò£N†1“Ï»Â%_U4,f/å®êë-ûÖ5?Xú¼[>ğĞ»Ãı4Švu_CNbC·\\;`‡{t¤·>qä!ğ1w«¦?§¹ür	šø?½˜;;“=œ»ìEuŸæüÏ®ª<Í.6ÈÕOÍü\'<øËùÃß<0_4İ¿æ˜¿yhRÂ#ö7›QV*q ¶,áLöÍÕêï\'Õt©êËÌ—è\rÛH\'Ëç·¹Ä»Ka§¹c™kÜ=4ñ“É–W|†véÚ‡âóAZx£óyİ.#×˜´•ƒÑÖ[å gà`ÀlK ˆ’Ç‘á4Ó£è‰‡C€T¼Ã€j½@äB8ˆn\"¥\\m¥?Ï¡™·ËqİFÏÄrWéÚ`ÆÄ¤ytœ,’ãdØ“c\\˜4p²B7tGmÏ0Z ’ªóÁh9lÑPUlÉSâ‘˜ì\0…¨‚¸\n™@YQ,šõX	äåL›à,VäÔ0s\"p±…Z¨7²mQ/¶¥Û\"4qˆfÀ©áÍi–‘5;Õç8YhëÑ”dÜ²>êR5r\'Y%RŒÖÓøÚó\"oWÜ.Ù²œã‹•XZ™áçBŒnÑÓ*Ø²…7nvöÒƒbLi|p¡Rówù&ØQ\0­Må:n%ö¶º1-İı\rd}{L\'KœğOYp˜êuÙ˜]¹0%?µ7‡YAïÇ´-@Ğ§¶óâ\0	Å÷ç‘$ê)XV“³:²=ÛŸO¬,9ÆZa`kÃûœp’P³IbW«µ„ù(˜nIÇk›…iÊ\rç2S¯U{;Ö~½¦ä(¥™Œ¶¢\Z×pî=µu»WCsF…ç«M¬p–ĞâÃd’ê\\`Ö;©™Õì&Ş/ÖátE*µ0Ù¦áÑ[ÁİoI¤<yí1:GÌÎásİõF¨“6„/#I‹Ÿ8\\p»5~„	ù	œEIcbÌaOo×%º¶§Ì‹ı“Ÿœ²(ö\"4°¤|C5ì+U´ôÕáÌ6Àf:sY-·ÁD±ôù\\±¸í„RºÌRAÔš˜šµ9*Ñ	Ò“z<¬êšî£§8?eM-,­}(!°\\àgu»ÛÏ§°Õ%Õ¸™á2ÆÎ·Šå+†U:_‘t6RÀó›êœ\n+ƒF—H09\nÙpD´CìStÒˆÕ‹dM —»ƒ2C¶æ·[&_Ï–â\0ÅXµrî°ò,zš—5,í©[Á D†Xœf´,lïüy:O¥†,\r…íÈm4[Ñ­­LDZ‘î•ÊÌG+,vévLÀ¦wúZ@iyÒÚóöŠÉRÜºóãÄÚ0cj‰wòZÖ¸Sà×›`q:jÙÒ˜oä£éØŒ%åtZœrZjy	œ$37„š§})˜K\rwÚ…ÂÒ?Û|HÉô5Ü•«mÍjœEí	`lv!˜ëÏg#™®01TÆ{]ÙóZ€}½ÌG®¼“â½yp\"´~º™nÈ\'j|t4Íº¾öíq•O\\¸F™–\\®°VI–`˜9’),§2¨¥Ù$‘]fi»5CËM&~Ú‰Á™ÈNL€×h•)Ğ¡<±K6ÑFõŒ±â;–PUöæk˜ÎÖŒXt<+i}é@ëñì¸j\Z…1VÅq>vôê@œ\\^«zdé&]Ùó€#kÈ_×ã4tvïî—˜¬…w°m ãÈEyÀŸ’í®€t>õ—“dÆ¦U7|áëK])°	Ú*0qJ°\"=lÁÑ8U¦Tk¥›™«.@cN2Çx3˜Ê–~Ğê³¼E¡NÌÑè‹È¬Â:±1ŞôçÍ^\\ËBe—ÆÙCdÎ=U¦µ‡¢u%­ãÅ\\İÌ<¶»}ÌïÑ™j­İÎ5\0<wìˆs™+Îš+€q*-Nú¢fç\'Œ†tÃ§&Ò­wf\Zh©&:kÈ¾œÚ¦?Zr0œÃ\ZsÌ$ÆX„Š·<lêİ8%éÙ†TG1ß*\"úÇ³¨ÄÜy;Y1ËİyqÌÄj#ìhJ^ñ§h‹`ê–[ã‹6W¢fÄpMO•-cL€ğDg#ÚÙÔÅ4Ó0oÖíÜZ\'#/q+™.ğ?êü¿À_hì,ÀRò|0Ñn—µH¼°vµGì¹~–ícİ•fëÉVãı¤Q6†ETŞ”«[;;+G\n5ÌY¦³-Äg\\¤«\r\Z²Š´bX+¬³ÃtÌâ)Üfœ\0›;^N!Wb™@¤\r%#NØ*šÍw8zfoW\'İÌäô¡ØO¥q)§yHïĞ©¦±ÍÖÙ‹sk~pB¹lË1WÊB-¦u¹÷‘Mésí²åyÃ[h8U0É€HËhÑ	Í²ÙÅìX¹+V“øÓz¬bãÆäZèxpÏ‹5­$4·\rî´xÌ[6ÜHPŒŸê±)@h\nz^Œ×[7BXM7VâÀÌ˜‰»	¢šÊOìBÌÃ3?#Ã|ÏÔ;ÆÅº=¶İx:Ê=v¢ÍñŠãX&I@h9ax\'§^s?Ğ“È)l¥³C–¢ViL÷‰E\nVv\"nUÕ9$EÒ°¼“s²ÔêNr§V_šB L¢C`Ÿ‘nGè\nnÉ]ÅÍ6‘æÖ.ÒY^”§ÓÑ©]:(”«VŠS»àABH¹®„¥Ìöİl/’s#	òz^È	y#{5Å\n/ßAxÍúâ8Ì(ÅaŒ;j%«ûiZÓl´N›,jñ`i§M!Ÿûš¤Ÿur¡šP´Z2ãİ˜Í½t-êl¾:³î.?ü”æ\n¼B¡pNÑÁ\'Ó¥\ruŒœ:\"¸·ª¯ÇxŒ³1Å¯\r`Œ\'ó‰7NĞ®§°Äè¶.}Ò©æÚ¤”7ä&k6ÍÚ™•·ü½Oº°rg1Î\'˜Ä9Ğ:6ƒ&^å	¼ÓöQ[n\Z˜ŞT´CmòíÌ!¹©ëı¾…Fsµ3KV®7qdÙÒãt¼ât§¶\n­Jêôsl¶¬üÉôÄf°L5;v…Acë|fqD#GkuŒM5ŞÌ\r¦S}UGPŠÆG‚Ñ—U»)ÓI§/˜á|S”j‰æ\\µ?Ê«™sX0Àr«6Sç\0|*xMKZd¥fœb\'_öÊ¦ö€ón\"\"¨–‹ûR÷tiÖ[|;ÁÄn?ğ´­!$u&t©<¸€á:búLK¼|‰ûb±®=J0lolEF§”ÎÆ øxqV”d¥(\\§á3âœ3Ú6MÇâ6›õ\\\\NZ2$CC£â ¢	‡Yx¥ÊíšÁT¶Â;S·M|×0¤vbl[!Š‰[§Nj2çëâ˜ïg›p¿›LZ\r9KÉ\\¡&L²màINŸ;»+¬f!²àùmÕ¢KÌİÃ©*lWÚaÊ.Ùï¥`M6ÚfŸ®qĞF`!Å,‡6!­-–Dâ+£wj\'úXáØ©®OTää˜\Zâ›ÍrÖÙóLì±ş4A·”ì¥»‰>÷ÂuâDÓÚŸ{iBºH;Yà/ó*ï\r\\Ì­Ø­kâZB0Âôuy±}ÔØ´P” X­ñC3“šiPâÀ.TTÂ}èåÎ(œ.Â9—ò‰Zµ3v¥rçœ$,%3írÎÍg›\\v–¶^v™Ø¡´T\nr‡#›®s*ÕÅd¾tì|“Š¤-ÖvRWÊÙh\\R¸9g‘éV*U—!\'¼38(ÇTG,½b­ëÜØô‰=lV«JsÏ—G8|Â—4V„‹íÑG×İx-0Ö9#\'›ÂL%wiã±5\0G®ŞaV›œB;	BÊá<ƒÛ¢\Zª«p½UEpU‰v›ºU£sng«e±š×t•½>¢İ\Z^mİ2K	šåq9]~œî0nq”,èpğüÑZ6²/Â§Õj>Ö÷ÒñX4YWüÖN¼Œ—\'\r™L¸ÙF¶¾ÉVĞTÔJÚ šE³b¿d»Î]…“G‚Ú¶âcvòb’K{l\ZÈh\"“Ã¤Heh&[¾‚Î´2‹ÊZyänŒ —–8) áeR¼Eã-¿]M–X*®—Òtš:k”ÒqL7”¿(¸eÓ0Y„ÖÌŒ¬ŠĞloçËÓÄ­0\0VÒ5`;G+|Š–šUH“·’ÓV|¾	İ…|wkL	á	‰vÿÂö4œĞÕ„ ÑõÒëv2¾$Ä9°İéãMÉÊ—>ÍV,¹á,<9£5?Í¶øO$;/&²Ü\0 ²ÌİñŠ´*\nÙëÈ6\0mS<*“‚,ŠZ„E«©Ö†ÜQ{j‡EÛJNåÅŠ­[+ƒ+-÷†i·‘CËÃj²¢ıµò CÈ»ÎŒŒh	LÇæˆdfdjé’·gˆÍ³[[rg?íNŒ\n¬Hãe¸STÃ˜˜ºÕ¸NäF44=¶òb¦¬:K-’ÉÊz\Z8ZtnœL\rFÖ¢ŒÕÚÑí&t/òÌ€3+ğ¼ŠktµJµÙŒôÉÛnÕE”8„®…?òwææÔ°˜pÀÚ‡Óf¤àá_ÛÎÑ#eäQÛä”+«ñhó±—ñ´GèD›Šq†=:\"ò$=a.ZÂöÑ¢œÕ%gÂŒÇ]a‹ˆmPMç¼]hñ™«%QòÅÖ\0ÅÃéèPÜiL`=#Tô¸”Ó8Ò\"|OÇvigú\\úÒ¸öbXŠÛK,©fks’ì+	>St°ÚÄPtB…¨EÆ\'XÉ«Üºğ~L=î|E¤…3ÈØM;Qp\0bEâpòØ¬_²SJãµ9‡¯_ïFqk8íÛ…¾§twº“<Ò]ì*ÍfQ–¬å­¹„W\0âjóÚrâ$1>Ó8vÃ²‡­w§‰†O\"‘K‘±Ko£ÚÅ\";ÚhóÈlÓ;ª„¯6{0Ôåª{µ¬™¸;°Yr£DZéqŒx\r~¡ĞfÁnÆÑ´ÅFArnt’•Îìkñè\Zñ)³ô¼ÅŠh‚‰jìss×n;³$r[0Õ®ºË÷ÑÚ&-¡ú@L/ºG‡:Í¸ĞŞ¨©Va<wó2ß›îJ÷/²×E |¹=`3Ş½„X‰eç+ßçüÖ\0÷ØB9Ò-áp€ Úë¨Ê´£?[([DàÉÖ u °h©33.ÀãòÜ¢Õ§]ùëQíLQ­R2pì(cn;SÂ]ãˆÀšÎ) ¼Õ:C¤\rÙw°ØíÁİj‹šŒg8JÇ3®Íù¼-vZ‚ìdÚŒfİîeÇ‘4f4Á¶VŞiïKH7òY\rÅŠƒœ`5èğ‰+ ~Î¯éí—ÆCø¸8ÄZgİ!J!òóÆ`{q€DNŞGt¡<‚wú?˜(Û9ödK•ø™Êk§*\ni¶Ÿ¸¯·èÖfØÙœ³!®Ì¹$.f\ZÒ£}3ë6ıB.\'.Èn¤Õ9>ÔÚİEâ†uíåÖrg…ãõ1£PÖ¡|`b\0–€§ğ§Å8Ãònğ±›f7d$#§dâ4sæÂJ0bLÆo³x==+‹\Zà÷Ü9S&5êl=µênş\ZÛRİ¨.a Æğ`~Ş–çÙ|í3VgÔ~Çö!Ô˜Ò,i)#ÛC‹uõ,µs½q%QÇƒ|eÍOÈÃ-yQ‹2hƒëÚàM”\"tÌŠÂ[‡v~–´Uî;íN¸ÎlHË–Ûg¨“,Nçy™•¿J\"W	¤ã-Íå½-Î”æ”rp¾¹˜æP/`[wflB¯D`îsÀÃm‡7;9ûbB9¾,v‚˜·¶O¢*ŠÛ?ã‹E¹;%Keåñóá ğ;\Z‡fá¬³:\ZM‘RœHÁ…’ÉfZ0‹çµTZj\r—ûqqqFYº‘Æ	UÚ¢»=ÑŠËN\0³ÉÚ¤^­F®)	oËgNUä%OJ(,\"˜©åØY®Ù<YÁ€ˆ{®UÌÔ+hóDP<A6xdµ“(Ì§å‰%Kfƒª`¨Ìhcm]îãî×fjí[Ú ëñ¶¢â¬,8ûïµ“º–PÈé‚zÚ‡ÒtÑñ[°U‘†3îK½ÉŠ6ÏUGU$ˆ¬6©T06èÔÑ²–\"+E­!Ÿ\\i:Ûî4h6®Î´öP”ÓTgY3 H\Z’dSFÔY`½Sã˜Ÿ£-HnylQÊjÚğ‡,hè\rr,±zÁNB<5;æ\r˜ñ^ü\0iLÌüÓaÌÀ„3øz<†R‚\ZÛ{ÌîL»s¸(Á$$/tàq^@[ÄãÂÑlê‰óHr¦ØÖf»Id¶èúf’#0ÂÖª\'‰Õˆk¤UW	I5;/ò\"òx$Æp=!m‹q!ºq±XäHŒUu`\r¢¢éi®vQ\rúÎŠ5O« äÔôF,?šk*\\ŠÀ¾	¥•Ì2ì6îljˆ“aÜCbpLI“i¥\"6Úóò.I:Lİ@G½í€g«,¬kõ°pD9Ã×®&å¦¦ôd:gITMækqş4o\ZgÏj¬·õ¸ |+_Xc³L¹,\0hÁ›¸³¶W¥¬¦ã(ª…SE×„º“¦“”^†ØaœLxy¬1íÌFÑœ9°-&í<\\XÕ¾sÿv†z`2:à·üa‰‡Q)µİ´ó\r¾GZW9›Ä¶™í|¥‹±²Ä¶KÒ&½#Yê¢¸qwi±½]°ÄŠ\ràe“ã‰ß/gç£1RÉB	#£…‰Q;Û\'Ã0>gzã\Z‘ĞÛ’ÆqœM§ÎHH³>å#ZÙ®·’ì¯¢°“µï6¤ËX[G[öN†•3vyÀvNÅíU\'åR®g^ÜèpÚrå‘Sœ©FFh7ˆK	‹¨œ—¾¼•²´e0x/Ì+ÙètÈzqXeñœÏT33aìŒxÁhìÙí|G-—g\0ZfójÆ•·†£„å)\ZG\\0à= >^K“™íÆlÓHªo±,–¢{l%nsĞ7k\r5}Æ±¨å\rÀaÄÎÚT{Tc°šØ(Gìzß\ZGÙ¨Ö®’ö:©É‘jGs±\"Oª±†‰¦ó1çˆƒWp, ËGß!hÅîF|pàğ<Õ™\0ÆXéÄP¢İÏ½eRøærudªY±Ğ:—bA-;Ç_:)ä	çısPí(,Qñz£ê#[,÷>ÊtºgV*¿<¯6¢>Ì’êä}ÚiÄëø9”éz\n¨ØL¡=yÔÎÀ< ‚u¯H¤FÀ£ØRÍ!ÇÖáÄÛU5+9ƒ-(\04œh>£(jØ”\0É2\Zî1òĞ‚Í®ÎqhÓ™ò“\ZX²f6Ó0Ê(\0Ô2Ha1‘–:GY¯tOœk ¬g±¹6¯çQ@	ÔºZZ´[mÃš·Ú~u.•|İ+	q–²p=ßî#œn±õ¨š¤©	v\\šc£‰J–³°õ|¶D]Å—²>.ªX/ÙJÑl\Z),ë$‚#&€h:°U¢)» íı‚Ø%fä“§*j!BXCVÎÁhç¥ù¼hÜ‰cK«Å‡µBNŒœî„ûR”9^¨çíºiJk±à,“œ\'­2†|::+dÆê™‡i>@¯)o‹g¹šŸ7ÊNî¦Äx%©&Î¤‘å´âAB ŒMÉµ\0NöÎ^Óqf7YÌrÅVõVÙÍì,+ì<æD ÁN! ‡/±ÅØ˜N¶ìât<Asc[ÙŞŸ\nÀÉ£vÓ\r2™Ÿ]¢ú±œsød‰Š—{Ò\nÓUÖVç…M¤¬Ü’º“€À)$\Zï!Jvš¤5àY–«]¨şjÏ$™/§PbÔæ¡RìƒÔgrËwäÉ³£{(ãuí8n¡ ˜tR—sµu\n®ÎWW$÷s¿n±Õd“{£FY ‡,v«hÌÎ˜¬ùhê¯aí–sµ¬­f›:uÏ&¯ÇèŞÏa£ÈçXY…³£Òøy3n&aæZ»4Ñø\\KÕ¡Á¬sI´$çÒœ\\Ÿwv”€g—˜Op²qœœ>.ÍÎˆ’1Ğ·\Z$U^œĞËÉİxö–4ÅÉt,ŞŒKÖ6è™¼–}{Ç,ğ­ˆ›\Z6[…›åVSxÓÊ8×Î²ÙØÛ	Ê^(n©KZxl×ø2à\'–òf_n`a×™(çóù4i:AÉíÙÓ·S!ZÀª‘åãÑÑ:ºå\ZãŠI€æ³y®ä#HÌEGq<ïŒîõuX!Õ\"Ş„P;¶0»&Å¹Ôgš:T8„ºü)#ØcÅ)Àà¸‰	ÄS¶Ù4S‚æF\":wId…†UVôáhá&İD3s5M×ÒÔ[ÙËz™ZĞÑXšãõ#© ÷à\'{’,¤-óí¬¨÷QÂwŠŞ”«pµ<á¹»YÉÂ„I²Ê¼tÀz¾Û“óESW2Àbìüş²EqoÑæb;=ÂW5Gœ+RğX^:ÿqv.GK3fëto“¢`B2—2ÚÎèfT,åc|.òÓüÈm*»9Í—PH”²ºc*»£H,¦êyOyêaÓÌÊ`…²à0B‚·ÒœÛ¨±_ñÓÙÚÇ-gù‡3fRx`I#W>.y©±ñ¶§Áa­R©Bü:ÄtÒ„c2™	!Bcq‡=3›LÑ†µëô¬ÆV¾rq.€Õú‘µKçö˜\Z»YT\'Á4›PèlªÉBlI‹ljhÅ–İ¸&\n;Ù¹Ë©İ¶{\rTè#L0	Â¯0gíñZ‰÷î¨­.d;˜4\'o—É©=‘¥ö°Ó;ßÇóó”¤?_œWKÑ(Õ¥Ï…òÀ†V5ŠbdŸW\'LÍa°çÂ-Êı\Z€ZTµcUšƒ\"®±ğCÀ›;êTàRğÈ¯OÛ3³è-‹$“™±#æò5/ûûhZa{ÓQCyÉ—Ù‰™õf¬-¸qÂ\'ûyîçŒƒ©xghÓŞühÅÉ‰R×\Z­d{Ş¸˜°Ú{\"É±dIc¹ÉcRqkş„KÜWJ„çn¶’dWãj}€Y—ÈVöÆ]“9®ömš/\0t€+“ÜÊØ¤â‘ö zkLa\"¥4üœ¤“°XY›©ö„@«Ù%”ºsò¥­r‘K¦×Züj7b‚‰Ó\\Ñ‚*d:æl05¥Îë˜Ûr‚¶•j:îçNU@ò˜!ËlŠš(¶ÔI‚ÌÎæ#XŞ¢Å1²:Î)oÕĞJ€©YI\nÖØ¶3¢ÊvcfÁlš­¦i^t€˜Á¼î„=5;”\"#±¹].Ø\Z-¡ıj÷$XY2NŠ¶4aÕ]¹½«I…áIºGgI¢Õå14Àƒ®DY#’ßg”0¥s±G*‹Êø3È‰ A#soï( E‘mÅ ÒA@JªµKÍH‚Q:osAPèa½ÓFJXH9P0:ï¾Jym6—Îd|Vn\0.DòDå€uTĞ6-9\ZŒ\'²Zû\"[KE¡n«¯É9(FN³¯™Êu¬³aAHtà„…V«Â¬ÜœŒia]e1É\"&í&+EÅ°T:WgÒÉ`Û[p.9uZG’Ä–\rçÍ66J\ZÂÒ¯È69o(b%ó•0eö(Íîgpc’d´…‰è:¿„ó5¶Í¡¸å¦ŞOIœw¹YC\0MaEµ\Z‰!³(s”HË>®jcš\02Øb#BœQgX9;`Á²¢×Z[eÊí-4˜iëÀw1\Z¯\"h?˜óbæŒ\0ÌX×\ZDã6N]_Ğ\'\ntUg_wÖå©QjO@`7#œæsÈùè;¡éÉ§¶ÀÎhbIä×£3S›Jã	V¼v¬¤£‚ÍwÚ¬™86E¤E^›sÃÑp‚:OÕâ‚ö¤5Æ\"¥1íÑ)n§\"µ˜º¯%@HkK1Ğh|\r×¸rX\r?ÊØÌáƒ$vŞÙD3õ1®áG°(€v\'ø,ÖòÕÌ=ÍJ~5%¥qBƒÛ|ŒÅğVĞšmÁ²EZ“9Õõ9) ªK–¹ãdIÎ«İlÇÕ2KY2ªìhŒÌ0ê0NÕ†ÓX¤°’fİl/Q{èO´±ìö§6(L¿Æ7%USÇMMÎ4¨róÈ d2ã’ÏK^§:ùÚI\'uå g™š“è–ÔlÅÌg0Âî¯}VşöMâÿ¿—”Gú?’8l¾åæõ®=¶¾ı¯Ë§=nÔ¯íğ{vsşşÿçŸˆûï~«Ğ…8³¯°ºÂ®#²Ò´şçÿh5éò+İÑjdÙ)ÙîßîeVkMv£m6xr6â\\ \'\n&\n\'CG©®­>9mÆëJŸ÷x•Ûã\ZÖ´¾Â”óıIòWn³È×L­&û©.hëx<ç+Î­]²ÚE›NMÙNİ¹£Ø¦@@0ˆ}!JŒQ,w[ûLmòÌP€òœ…CÁm)1D²ãYºôS`Çğ(eÇ²é…5}hçQà¸3Ø’3Rx?\"ÌÜS¬Z\\Áá„4ú,£³ÉrJñò¼5\'kïDğÛôhò¼9IÛV’æ˜ÛÀr<ğ›Æ#•gz@gÍ­gòR&Ç\Z·#ÌàëÑÑal¹@&€lÓğhSÓ`:nGî¸™ã•íäèO¡¼¥hˆxÄ\0ErÄ†ÌRz•b$²VIe	¤³«]G‰[L6Ÿ%0;O‘åÒ‚«4 <…Š™mšêX×ÛóL(°&\Z{}™O\0w²&…Twj(&Rï÷¾»Øuî¦²)è`„9%K8I\'?ØõñLû²µá©ÆvRÑÍ;?›¶a°ÕÑ*ĞÙ€˜{kÛhYÃqä;¼: o\'9‘uö!KœäQØà†ä.×±Üu>5n:İo	À=¨\nIğéB…&bmk•š¬—\'Sİb£œ,Ñ2€P†Ñ&<Î)g2ÊãI…˜5‚ƒ!C8\r´Fá@ŞÚN¤Æb¢wÆÙY}¢>šâË¬Õ‰¿…rµ#F^¥ÇKNZã`pxB·‚1Õ¹=	ï]Š*Y·ÎrËëWğ­tµñF6JÕØ’÷$)„‚¼ª©Ğ=Ë=V¡Bšl7u¿1Q|²:¢Î‰Ë]¨îÂÎIÒÇ^µpH(u	Õ¬/OÚšM©pêÒãdÒBò¦åô¤œ’öÄ£JO™Æ¤—ˆŞtoúùdK[N±àMÙg$UTg¾²§;T!Î›X\Z™ËA¬ãlÁ\0,\ZUôŸŸá•?ÇH:•MÍÃl³\\™ÓØš¯EmÂèO´ß*‚ôfËà0>nçôTá†[YgĞeeÖŒ:»t[¤úF “Rl~Î\'¥Ø™áLoò*²ÑĞ´N\'KœSÚxA¦~ÖHÜ\'gcfÃ\n¾JVi\'³>ÍN¬Ù¡Jè\rÏ&Ñœæç]å+iL´Œ©šÉ.è´”z&S<F3oîÍƒ++Ÿí-‘óªCf-j\'ú52¶¸¬mç.ù4:¯É&Ï$w˜²ÕéªÎn ¹AKZPÔ3m¯!á´—EÁÒ0¿*hAFØ&9ÎqSO¶ê8Û/¡58sámg,2„AO`´áêŠxÒ±T32­doE‰{Ùî™†eâ N‚Q6æÉ	0wÇ¤ÆZyqX•¹$ãé,LYÜFÁT­%Š>oÉu(T®…æK/éµ6ÖaU“jQ\'İd’è\\µXªaJr‚Õ&é)\0tg)rÊtêD±8F—¬&n“cÌò”ïˆª½ÌÒšÉKÓ2c8Ôt›1¨ØÚxÇKÉ2	Ñùa—ç>’—4Á¨Ú9 £åh,	Ï¯béÀ‘¼Lã¨[İÆ\"W‚% Qpª.@Åø¢„0Õ[aZ :q(‘‹¨=ôQnLÑ@ËÍ8uM»6™ÒÏ°¦1û/yxN×xªÛ1MŒ²“S\r\n6!z0Hp.=…¨Óš:œ€Pš…¢Mù•7—H<aëå8KVÓ¥è\'v–l†(=|MšiQ²d,\ZKÆë =ŒmóÇ,ûS²š“+y¶;tºŒ•N«w‚êLbî âÉYÖÇçÌ¨Ù¬öjA3‡‡A†ÊçN	Ë2ã`k³Ñ:3º3r½‚Ò¹–&¸^ÖlÎìTØŞÀÔ#ºı¿`	dd­fnuÛ«6ŒÄ–Á\n’E¨ÇbÕÙãD#Fƒ:´7õ­ÎFÄ3NË‘;S­\\ÒY½Éİ\n%·õs8@#ˆÃt¨òœŒ„O\"r9;p-éh(UêSp¢ÉKfÒ	‡	ËïA²@U§\"}p¡ŒtJ$sdÓ…:R0+¨;®·kCÊ7Ú¤B<3_)•pÆĞQ…ZêbTŸ\0/jGÈˆ\"Mqç™–£FÀLt?!íC:uÎ#dîçb·Mdê‰æb7Ùt¬c<Ç`S)5µ9%fš\Z¬.!¥5Ğ1Åú§ãhÂûƒ¬¸š§µSL)RÎ_¨#®ØÒXI©@a~Y\n.¡šqµ$Á‘èpæœ ¹³X3óÑÔREcÆLüéNİŠ•ÛØÕ´©?ó {ŞŞöe§·ÈéÑYMQj	q¨yP°ÛºJ»|Œgúp„ œá¼ó‚+ÏÜ˜Š¸ÅñB£Zå\'’%ó°¸VÑ\\\Z¡í!hlÔuÅû; ‘Z’ˆ¤¥Ê.LmœK»éTæ6¬©µşÆyS„jµ,:V¹qÔNFœ5×[Ù[::ĞÆBsæ¸Ší½^ä¸ÈJDÍ{\ZÉ6›™(8,™”á‚Ôºš¯Ñ¡”U\n‹ÕäœŠFã\\Ùò{›w†OD„€TÈ\"aÙ)U‡_±Ç‰@óÂu•u=FX\"ôF\'©ÆIÊ\n‰¢SÕÙõ\00[([´YXù.˜$—$\rˆ8<¬r…içí/¥v4ùÆÙİm®‹\r«\"x1W!òf`ÁÎ×<¾ô^•›9ÈÊÜˆW“µËvºx¿oBEØ‰.8g€Êã0€¥İ,-}”£™)\ZÚ\"J‘1`á;Û¡v²£¡¬ªÎ6gñûd‘Âëí*óœM#H\'æ¼³yûJ3ùiÁgG£<b²VU~º9y,«ĞM5ÚÎ¤†î+ÕÒc¹r\"­É(6›$ñ\'G’vWõšivï.ğ…(Ñ»}à”I¢j\'œğáhrÚzI$ÖĞGF8¤±ßÆKq!À±cµ»!¶ ‚1‘Eâ.9ØµFªYælAïEÕÒÇ²ÅlÖÍ^Ç¸|B@f2â,\'0•Ì…¦ÅäfdÊIqKÕœkŞ8&®½±c¶™œFùxš6¶7·Í}!oÇM–›”jT\"¾2‹d M6|¸IXv³±Öªè”ÒÕ-¦œ;oVçÔ–åÚ[*Ûm½¡Iê8Kâm%ÍWÅVí„‡\0Œ=ï¾Ñğ˜Î!pç±Tä,ŸÃ€V:s/İBËwU’- 6Şv…™Û\r=õÎ©‚˜uVšk;×®š%HßÇš­pb¶§9HÀ~\'b|â  öºvvÓ1–‰LçU\nKP½ÉtûµFqA,-·gSİTk`‹Uù9=>@‚9o³¹¼Ü†ë9©ú²FŸ$>•L[R‰EÔšKËdÜ.ùyÈo÷¤!\'$Û¯D¢¶Ğ-­vC(0‘êìğ¸ZÄ`¡‹euô&=:ß&9:êÆçæl‘Úëº³óÁA÷ËtœcÖ5ŒnÇÅÀ¹YlRŠ\ZÓ|	¤L’åªR$aÖ(ÜµiÓU*ÕlI¬ÕÇµñˆ™ŠM®ç“h#¬1&Ôá‹~²!yUri7€°ñüÜ¤Ô†R©YvkË7ëYbœÒ\Z]-Ó]KŠ“ƒÂ\0jÃ5$¶3~§Ä¤¨ş~Nk˜hƒÇÅ±UpÅ3p[ÇÃzÅmµ•–/6–2Çf/¡œ‚^Ï\\¦B‚î&oVGÉƒR?¼ÙÆÈ†öóÚè|ĞGãmÁ4ù4R78Š]Û MyøRæe¥m*²4G,%U)ªãÅRjµn€&e%fDíì¦˜\"ÀXÉª˜‘;´kåD]‹‘ñË~œ¬Æ$Óõt´dˆ\"8&Û¢-Íãa5›ÎGãâEá.Şå¶›ƒ£háJ4”¥Açp™‚½$üNX¬å¸„²™Íóä%J­Èc.XÓÀr†. IÜ´Ó	?^Ólš‚>\Z&w\\ieÇÌ4L‹öÇ¶x0Än‰ĞZNÖ¨1æ¢Äß¬•wàÕXö‡–JÅ_ŸBƒtÏ@Â††§XäFÇ†>ñ0P¹Ğaär!ÕğfÛñu¹-.Èûã[*ª`õÜ,ì”`±R^U\nÅ/òuI“œ™ƒl\"oÖ­±Ş¦3¼äæ«Ù¸“Úùh·…\n˜ÈÂ@ªÛ-:=QøE:6Ê	Ï,d2°PòÆ6Ôı*”¦^t*©™r>Š ²‹a2w‚tr€“ÉÚw\nyÓìZ@h©Õi~˜Q{ì˜’_Lm×„j¿üúäĞ9šòfåäB3deï\\İ9;£á$M—P8M&>¢®ÎÊ2Š±LWš¯ˆO–âx)¯â	Ÿ¹ó<uaˆa[QH#›İÃHìn¡Úv\\ám?/¶ÊÅìD®ª]:efâ9ıv’Q&èï²ÔÙ-Ë\rÂ˜ïV§“â–\n,{>°ğS(ÑÈT†˜³Ó¨ıŠgæˆ!1>½œ)Ia¦¿ğ“¦µE/;n )€îv´³›P^uî¯…Câ†>ÒZÚv~y»¤“kçlŸ»­&ê2Íkv¢PŞ\\<q¢4¾Ÿ$Óeà-ƒÎ{PÔDbËu.bN:,‰vıQT!~A¢ºêjs8Î‹ÎUæ(Ü¨#\r=¶­”SÈ.ıíŠ?D¥0JVT‘9³ótÓ;ëØ˜ÌTŠİÜı|¢ãê[³ØÑbwf¥ëR­³ÓÈ›\0,7±ë‘óØvbu³fI \0r•zèÀ¤q§ÿÚ=WØTÕL©œ[®ÁU2ÄˆÁHğ¢SÁ8p•³LÚ_‚4Œßìpè¼ ÷‹–¤+k:¾Q÷r²	:›%[5MİiÌÈcçÏ‚dUĞÄ§D’Ó\r„‰Ù|èŒgi¾8’úAÀe#M!KFO­æfË2Z+&4äK¼‚×äƒ ;“@™ÏIÊ×Úá˜ó†ÙZRyˆµS†„åÄŸ²*Óa55÷Îñ88¾Ê€s½JlÏ!£ñ<‚¼]á‰DÛdÒ”S¸ŸfAÃéÎ–>‘X¨ë,ŠÍêÂ—šlÓ{¥jkTñ5¹ì&MĞì(=«@±ÎõEÄãh`€qµotB(Y\'S‡p\'TxÒ”9±ËhIŸa¨è+\\-F9ÀËÓÙÎNuæ\'ï¼ºœO2TE‘¥D­d=/(öÔI —§l¾ÅæqÁì8@ódÒÍ<Õ h>¯k¦²EŞkÚÔ•Ö±–ÍÂ¥ajba³Fò!‹C³›?‘P€\'¦+İTùÈ:Ê¼?w5VZü9\Z3ˆœ¶çÎ&65¤D€°R4n¹0]„¬‹]]°`UÛ¤ÀbÜ*¥D2¡­m’Sò‚àØØ-’#œO¹}° •Eqèf{ïa¢¸ììDÍhpf0³İ¸„Â§s¯ÁHÔ‚`¹à7ÂSL‰ë\n‚SqVu9¡wqFÛb­¡ò	™Y¶<·2YÆŞåÃ	Û…v\r–Øêfòê´Ô\'¹WÅKpº.|ÜòœW›¦€:Ã„V”Ø^ËÜ6“æªĞbSİ£f.¹Ä—vÕœ…GÌzİiæ™¤šãs¹¶\'ç+È›ŠÔ¦\Zò8v±«Ì¥6™#n¬Ê­\n‹4«²¼ÚÅĞ’wİqjjgLƒÌ¥qÜHÁ,ÙÌF¬Ÿ€Gg‡ZŞ¨XG˜fpŞ$0ÏÁlºjk‡ª5¾µ€3ÀÛ²êö§Ó¹ïQ«2Ì	\rÜRì‡ÃE°ÚQÛtRNc¼±¥åiÍ¢; µ÷®\n´5R²ÃÁ”ÁxuşE,íÚnÓÏ1oM(ŠƒìÑã\\ÆâÂ¡æÀ‰£[ÒFÉ\"uh×Í#!´±c»û›,«}:Ÿ754[ä\"9%öÊay‹Ãqãu¢Ö!á	¹óÙÎ”…|54}fÒÁ8Ì«í—yâìV+#èäÃÃ2õÜ¸\ZëG#‹÷:\'H!ánÁd™ãÓ–u@R‡\rT+ÜÆ¾}µQO\n­,Šdè¬I¼b)L‡)d}†²İF¡[ T‚Ò®B–Ä÷Œ4ÅÎØ›¢Êió|^ç¢>]CÓœhnÁ!7\"Òlha¾[{ëÂ°XnFØf§9{w«Àv$G”×Ø©y4XÓ“`„aÎnÔí¶ÍÎÏÌj¥ŠÛ\'Ï¶pÑ:ã\Zïœ³nê3tXû3Q˜3ÓÕlÒnŞ-xtR”sM”ÍŠ!\r\"ÙÆ%HRkÖÚµÎ‘‘–š Ya°¢!±âŸK¶s09³HS¥(\rŒüÅuŞDÈæE,95\\çÏ„h7©Ùãhú±èp±­ŒjQŒÄÎ+_øJgÿo—~ŸTÂ¶§˜¶™ÅñM–İ:Ä–<&a“A-£™Î´ˆ½Ô®*IKÌs3¿ò/iŒpHŞñNì*â÷eİ=	E£t¶\ZÉlJæÙ¦åN=lGmvºÅÛ\'Ûî¿³—.\nÿgâš\'¹²¹D¦H®éfj²¸öÁCu%n ‘­ì*ò`ğ¨²C°INeÉh[ÅMÏ;}	u|UÎb~AÀ‘\\T\'‡KkMwîÙO¬ qÅ`‚Ã2B:Š-\']¬n‘³@îë8µáİ]¨ç‡­/Å>?mKhÎ\Z‹ Ùuºà Î0MöØò4šÀ+À*£§´8\'{IrSö ¬Ó/m˜rĞñ@­[EàQÒ \\`¤r)¡‘l¨Ód¿‹m-yÄÉ–¯m-ÛğŠ^•Ï;ô ƒËÂÚ9.¸¯Í±™ëÕñl#Çj¨ÒdÚt6N4Å8İ—ÂNfu»AyÁÀç	h5sµŸpäyéÛYºX…/$ŸÊibŒóv¦„E7£m(I)H_ùaU`§tJ´Q()BÛcy«ÑÛ@U=®yÒ‘7l=cí‰ B~³_Ô³q í.k.rA›Gæt\\­á™1c,~Iïaít<1ÏÄd=7˜m4R4µqrìøFĞÇ[OáÉWİ1[eû×Ø‚Oš…2Õµ6ŞÚ.å¤Kd?§òôxÌŸK¦!)¸¥yk.,‚vs7k™e#_—–³SK¹©%ËÆÀá\\h»V\"Æz«İ¼+@€êaC­6ÉRp¥ãÅ½‘WGz\0‚F`ÓyÜ¦OSlQf8s°+SÎ}†¡¶êIKÄ‘É#Òìdx´ô”1Y,m£Ğ[Û-£¶† ¦“‹O‰=!ßİ-;Aw¹˜–“EC*HŒJ·3ŸXd¿I%·è	q$°İa¤]ŸÂvÑÖ³Vâ Iz#§ùã´Ó÷Ä‘£ıéf½8àş¦Š\rœp±„Kâ`ä´¥ò¼±áèzèº†0Ú%F9#Œ3\"àËšE}æTQ>ÂÏ,pWÍ£ÖéÕnàÓ‰·<I[wµˆw³NÉ(›ı:y2OWœIhû›—›Lã°c¡µwêæĞVLÅë¥¾mˆ‘^Ş4ñfb3İ4@ìR—‚‚uè9kİç·Xšjp”\ZÉ–B¦ÁbÜM—8W+Å*õ1&qO4îh[ÏR¦©»Yãj[‚\ncÂ—VcÁ²p¦ja¡I+q3_ŒlsR-ğÎ-¬d#Q«EØ¶3ékG™\ZG‡qOE8cË*àİÎÔblÔÍ÷å*ç¯¶„†êÔHXP:!nÈlšœG¡JùsC–ğ˜_íÇş´0U½LÀ9w*,\\µTAĞX#PMe=ZÀ©½¡mÉÙ·bë:›Z¤0k½‡¾^	IC‘ü•·ìmPŞx£\r¿Ífm¶©1.³â­\rË°ª‚Ç­k#-W4b²«¬µF­/ªğªÈcsÎGÔŠY—gÁcÅW¿İ/ÇvçP-é	-¦Æš)³óqïµ-:f’?‡¢rTŒ…¬\rr>ˆ¢á*–<ßtÊ±:·G3÷D@Á¥Åˆ©µV75B¯µNrÓô.wF)“œ’(wø].8K`LÄúJz$\'iç¸W¹Yp,9jİÃ›É2vp­˜ì·¼£ÌWó¡ô\0åóC‘,l·G¤ä=†½`%\nÅ]{€w°ä3u3²¶*äC!vÓÅ‰I$ŠBƒGÄÆ‰“„Ö#7¦Õu\nìt@À/}N\'Eò€Õ$”p²v“B61¥²$Ø.\n\"ÖkàH%û	k‘lé†c\n½EØ d#…‡IÛ¤Š®ÎõVWØJ‘éÙÓmİíBÖuœ2` ¢¡‰K6ˆÎÕŸÂÜf¢ÍË)\rÃn×ß\r­]\".no6Ÿ¾±QZ­æé±)N·¢»w76Sµ.@{ÉÚ±©õÜçÕôÇË\n€æY„§¨Ö™Û-‡ä2éšTEˆeFR\\+#m\nÖ´°Rï˜ƒPäf-bª hœÀ)ŒESÙ0±¸±B2°‚íØK\\…#¦,ÃÔ³:÷X–Õ(b—Ÿ|³»±Cb&ïàD9®]ßZâ„N†›ıˆ±‚÷Ûš²¸VbŠ8Ê]¼–£ÊÚÍ€wl¶íŞ\\ì-bQºÜœŠ¥Ä÷0œ®öY¶[2ôFİ‹0‹LXR8y¥W(µÄ‹“İH£q½Ü­Ù–Éb£S¶Ú™X€ÖíÃ0…¢™èHÉAÅ~kÏGkm¢¶SLºê_GÛ«ª62¹jæ!%k¡&¬wáf«Ó]iLwy7+¦Ş.	Ö–:›éL\"$ÁÓÑf–c^=(Xl*%²ª1è˜×råèo¦5§©+:vœ8ÜxÎ¨[AåõœÛ{ˆQÚÊ3±+gD›GÑ4ª´fÆîHĞæ’ô˜Ÿ¦h5:ƒÔpA~6çÆ,Ÿ/£YáU´ãê å|1›‡2Q»Ÿcæw[Gİ“§mD‹kgq‹ûqÄ‚¥ëÎªsµé,×õ6§\\&9/ÛUÌ@“£E)ªšÂÛj==üØ\0ñ°i—£õ\"è©o×ô?YeµÆŒQwìæ:gV˜yãÆ•+°’O4XÁˆj€¶KtNíÅiÚÙGm)h˜=oÌhnº_x\\ˆ¦µœ§\ZÂùÌ91–âTåMìµĞŒá³7ATÔ\\¢é¼µÌ!©æ+\"…­1Ï“­Pœç.dK›|Üâ“Ğ§tÉ·´™\n%ÆÎ¥Œˆ8#X³W[À_`°‰êZWÆê5*ƒ&^i¥šzÜ±/0C\r,™:®5Fk«%ÂLÕµAP%Š,{\\ƒÍX²@70§-Î±÷…ÓÈ¤\rAŠÈÏƒ,745c”\r\ZÌÄå„\0cn\n·‰4mPR\\vZ§~lÎ2B(~šLÒ¢é,et2ÛIÆ\ZÙº¡bf%z²Wœ³9ê”UMãe!Ü	f‚\nF÷ÌTğ›Î4QfÕ6FVzÇØ\nvlŒ%n3Ø•YÈöó³—Cê€ªÊR+ZU×¸¹ Gãñ!¡Ï#±èôçÙç³NÉÎ·¡Zósh“²ãñN$¡9ˆ€çQ´8MÊær€Æ§Hç7ú9j\\aäJ6¬B:à<ÔŠ[#cÉ.ÜågIh˜±*±†¶f—QÊ³nâã4ãØÂF3Áˆu`Î%ı-ºbáì¼=\"p\')âébìWB£èÂ‹ÜBÅÄÉî…ƒÆŠ’R\\ñwÍ¤U³‹ãqHöåóáŒ«İöjw„h¢´z:æ¬4‹Ï6\n#J2‘‘NÈi\ZTÂ4êŒ®íŠ”ÑkªRå7(\r—§¡ëFÅGs{ŸWf¯ÌÖ¦èùšèÍhµß’(»»³çm§b5\rO­¦Rk“Eİ3LÇ>_Hîb·Ÿ|RUÖi¿‹ÒEÆ\nµ‡&ôFcÕ¹%2w¥8%l‰¡PØğ8+O{î¢M@é^Ù…t°jhi‹³ŒÕv4¯˜<§¼öàòsí2‡©aÚIä-WÍ©n{™3ê šd7Â¹W¨PN¶„¹‘±i½0&Qeµô¹YÉ@]œ„€Z#ç:f&p¨¹Êzé\r¯60Z­Ç…kNhL§•Ø=Õ‰ƒ«Ø¶³ášÅV]ÛÀ|£EµóÈ—Ì¹A‡$bú¬/3Rq»q}W˜mæÌq^™S–>FvgÃ‹Ğ¡	™¬Â‚w¬Ê]cŸìæ6¢|¼=DBL¢í~Û¹ÄÒW»slèã“Ş\Z|xœK\'FYn•ÚQë´Î|½´0!å’\0(qvUkÇ†ŸÏ0GU”ä™…ÎxÍÛ#œõOË-o§GÊñÓ*£¶æsÖ¦ÚÊô=u¡e\r*Ö±È­Lƒ±>2X»Ìi+«Ö#,¾’¢câLrØb¶¡™úÂD¥5=HõµMš\\(š;µÑ9êa6İIñvî¹2^ºĞ¦jºqÂ)¿Ü>Fwv©Z-uwƒï‘\ZõZ¸S(Ò:(“ƒÁA!.@²çqNpœ³½ËäæP¥\nÓšDy&Ôndš„F„‘2Á	YÔ×DÀ1¢\'fÑ­\rt¶zLÅ–êToRÛİ&&A&¤\n±:ïrÌ¤G‹Et«XôPY ÓBGÌåzá0\"V`#Ÿnu¦‰z±]óúE·ğ—ØY•sLeîÆL\'š#w×jz¦ìN™è@ˆãÊ<˜`ùAîŒ˜Ò©˜¬ÜEy9rL¯±ÉB3Ç®¹.®®ªÂX©EgáEîd1{Ÿí‰ÙQ.6å(²ã¼ŒM+­³ÌrÎh°¥¸°Õuú´vQÑ¢Çª°¨øLrxƒ¥fµ]qV=)\\\r0ØŠD8S·›iuÆco%Ë£‡åâ,…g»%r¼#Ğ#æ”VUÊ5&\rW³{B²ó—å a˜Å6,ŒÊ-¸5GG4PÈüC³^Níı¡á—µ´(æ‰|/“±è9ÚªJÅS3X²RQôÌL%§¦¼ì<×`mÁ[(£PÄfX·~«3­ğÌ1˜¸áC¹ìlïRK—mÏ2ÑˆÙŒ8a’ÏNÂš<ñaµ=ïÉ½¬¶˜J4K<K‰`ûI½1X#*¼Bw¦ÔÊBIM—5%=xœ:j¾R·kÕb:Ñ®ê`F$òæÔL±´®<ßX	#«SÙ¦Å£ÌiJ `½jŠÓBÊÈà±	è§QbØ!¢Âºd²+«…¦æP \0Äø8’Q—«|çƒc’û>t6œ^tÒˆ`ÎÉ«fØJZ•¾vh«Îa™ËLå¯#¸ó«GjeËê±)ƒ”	¥)T.éi3Ñä õR=JØb“ÌSáÈŸ‰½Œ7ò]>Ãm]8\nÒy¬êú˜0Ö©>JXK+­¼ö¼µ0¼ºSU§•0Ø™×uœ1ØÒCSf­´1Ì­óN=\ZX¾m™=İq-Â­«sŒWÔ>swuÉ¢æBğb‘9gú¢êÒaVeÈí¾æww™ x6OAR™}>eóíAµôÚçda%ÕÍÌâLÍ\"²ÅÇQâ¼ÃKÈƒÆ\\åí2‹›ø2^Ÿ„6æ0İëœ(Ãg\'í9?	Hü#Ÿ.td¹§…Eã’¬ìÄÈ:‰§E¢kĞÕ¤µzêº²RK`Zåe49ªuÆìšı(É¶¬#a¸HÀEm4Ë1M[|^ìT‚–4:–XÓÛò¾Z+>gä(Íš´iÜèÏ¦)¶ƒœŸ\ní”1iô<ìLƒµš51 ;²r¶XŒ°Û1@&²:_Æ÷´¤ÔÀ¸ r¾bfš@ê%yÁÓËõf¡Mpv/IÏhêë›Ä%EÎå¯ÿşï?o˜åïfâÇßáÁlZ×K‡/wr>’\"ƒ¤ßáÑ1:LŒbCÄØ01 öl=+¾èòµ/¨¿êõ3}èö‹Êoı QûµçÏä‘méáW}G±OÔ_ö}€ş«I¢ÿjŞ?Ğû¹ùUçqø#ñ—}ÿLşe×?“Ùó+¹QEß\n}¿ıò|»õèògàvë{±Ïéª^Üèütéõ{¦ƒÛMË¹§[IÕ_\\şİo/eûİ£û8¿»™oıÈq{{¹E÷r[ğûoOyÚŞ/ùÍ½(ó‡4Û÷Q@Ğ½ xu“õCZøáŞô>İ4òpÙø½Êk‚ïû%ì	\rïŸ/†^ä øT_œöÃ /é~¾›{XôE÷¼4¼ÛÖ·b(³ÀíÆøŸ–|ÑÑOõ\räşı¸dC©3o?8¶İ‰ó\"Éš×Yê¾ÎB:PÕ¿B½[yÓóÃ·”´Wv¿Ó]oÁÿöé©n^rl<fÒBñ‡(ø@&­ëÃ[>‹ËĞŸÓİR°¼í?Îíâ–ûzoşõmÿãöÿ?aüŸ/¯ÖşĞõççØCæ¨ûUëX©êªınd¶üëú÷%\'¡õå¬tÌ|Oí,Ïàr¿ışEjÑ‡j.Ééò¤ôé²ßxä¾Ğä§‹õ»ÙMiİo‚>õsœ$)>¦Eyß´Ê(÷ÇàÓoú¡ô?R}7OÜ€5iøîU0v\"ºxÊ;š¯óĞÇ!ãCé›gû-Õ\0ô\r(×úïªFÏïlÈ(ô!ı¢=ºüyJ°F>ö­Â¯çè²RCI_>ı–«à*êóÉ<õšñ{Á‹\\,x•`Èƒ‚øpeüÃ$“_ÔéØ§±~H+ø˜ÙçZClW—ôİŞûñ S†vÜ‡‚·¤ocúºdZ\Z¡oŞ*p2=²?KÄëNz05ziú;•üø`,üFù‹Ş|ä–{F¢wrâ1‰ÖSVÖ{ÖaÊ[²­§W¯ò\\wÆ¥æËÖøI‘×u|Îˆ¤§^vY—¨ÿ¢JË(şî„e·‘†ß!ßËôÃ¯îÿ$egOıéé¡ó–kò¿ş.<?³z‰ş‰bÿãç÷Ö	âO‚èZİÚ¯TÙÙ«izIfû%ñ#‹¥zlÿ¸ç…‰’K¸¿Ùƒ®ÒLw¿»ŞMä÷uß‹&½¥ùë‰åÿf+ÿøĞõğ{\'–LÛ»Š‘ùæşf-ÜŸÛQZ4¿Öò-W¯²¯õã¼Zİ7§Ä²ÍäúÍsü˜›äª›ş¿4LôíÒ m}Ì€ó·‡uY›#p•ñÿSyãÊŸ°ÍMÓÄNòœ]ğQrõ) .âé¥¯øéó®v+Ò™¬ı¢è?_Œî“ŸÖ§{¤¾ô!±ùÛ¢_³¡>V3XÜãK>œ¯¦òâ üñu\'nÿ|!À¯Sİ™¦Á»B¸ë·5^ûuI¼ù³ıøè>üÊ|u[şùçt_†ëTŞÛé].â§-9~m¿’Ô×áıøéê|UÅ@?¯¶şïè?÷^¼†;UrMÙç’şÕŒ<×ŒıçjFŸk&şs5cÏ5“ÿ¹šñçš;^øUM|¨ú?¸†£Ußñ·\r–—ıl“?2øW[ågvÑo4ƒÿ­VĞßlåböuÿû;Ma¿Ù‚ÿVğßmåoMñ»<p±Wb±~Á¶¿Õö\'Bâ£/uç›½R\\¬ß¿>ëíŸí´Ÿj‰fÜ-óÛƒ¿Uvíe§8›nœÿº¶ı-ö<È›•ù®_ôãi.Ÿ&è»i‡á[œàÁı½›©ÿ~V~¿™V¿²b½v«øs<ÿ1TñY{°~¥Õ§FoÈ³³ıs3éÃ´Ü¦t°’¿1\r†)?‹o1¨ßkïë	ø°„îw7}û_—ä£ûçOûãcÀàoñãßªô÷æoUşgf_È¿TÓÍïùöí•»è¹_ácÔãÁ´}Şüÿ¹wOÑ‰ÿ[û÷U÷†xäù?+¿ğ¾[evŸb$—Ñ|ÑãßÛÿfcoüG\Zırïü›-ü‚İø+3ò»{êÿ’^ÿö^û¿©ß_îÁá>†ÑóB­[ÊµOàî6Áİ›~ªçFğ›õÜ¶Ÿö\'Ò»\"·ÏO¶	\na¿Ô—åoë8Ğş?Ê»abtfX™†‰nu²%/²ò–İúá”y?Ú¹zIÏ…\"=~Ü“|·Ïv\\äw©08úÂ?Ÿú×…nól&qêÙ™_˜ö©Á÷LÉWÃ÷šù’[ıf©Ü“hC=ÄRşz‚Œ8Î‹.}Ñä³YŠ¼Û^Âèòç«î~ûó2ÂË:Ş§õcšçKÿ©k/Ÿ‡\0¿çÿ¦ÈÏƒøë1ÂúW’ê¦_4ÿú“ø«íİ²ë!Ÿìë^öüĞÛÇv¯Ë_OĞ/¶æ#InEWUş–pûGß7ø—êzdk=MÃË—ÆëîxÖ]Cç™·iÄŞ¦%¾f¬{»ÿø²İ7”@^Ü\"QÙUšİ2ŒßNWwÚ~³ÉXìöÿ£z<‰}¤B€T×ŸNÍ±ÿÓíe¶óx.ûÅğ`.†Æov¡SÁpÛ—£¨ÛQópşíÑşãÿsõÂëê3¿»×³èËŸ÷4÷Ÿïgª_híûåpê‰szÀÎ¼õûøëfÃ|qÂBü³—‚(ÔòŞp0vúiîçŸP@C(´_ëû\'èÂë}Yåµ‚¤ßáŠ«PúŒRû¹2y«õ+Yş½è6ÉE÷_\0…+ñ,1ûn=ÈGì-Êğ¯w÷yƒ=‘½lØ\røïw>·õÌôz°ç˜\nzÿï[¹B®]Wâïû¦ÿy‡¡zz~›Ôïÿİ®|»Wù‰ÙŞ\0D¿Pë?~‘şÌíĞ6»Göì†biÿÑ¦¾uœò` ½)‹!çöºßàm—­İı\"ŞpHŸ ‡—åG¶şWÓ}ØÌÂ°ÏftkúkXLŞ#¿m2Şºñu8óËa\\ü€WÃ Ş‡_wí}ıˆziø½îåá0z­‡™~µ¸—í¯ßˆ^|‘wş“ışXö°$}x×k¹÷—¶å_ØõÎ§B÷×Xc/y~QÓ?öåÛ@c_õï®GÙâzİÖÇQD˜}ÕUòıu9¤»o•ÿÜ”|Ùy~\0_À¨•ù™ı·ÇkÙ…î‡}˜ùâğ«ú?[À“ıŒ…¾ı&7ÍË–^\\eDğ~îƒôêëgÒıï5óíúË»ø°U.»şûúFü‚¾şONşëòèN¿ÕI–\"òîÍ]×èy(ÿıÓVì4é¬‡«‘ş$>şú	Fşf$‘ÿc“~ÿåL;±8ûàÄ_ìÉİµIıøa|÷2ïÖıılŒ·;ƒ/®F\\gñ~äö=&>‘€)ê7ºÿo¯ëÁ GQFş\\”u~NgÑëöÅKâne ß\rA¨ÄŞ²¸\\µÕıÑ¿ù¯«©ñ`ôÖçÍöx>Õüğî£¹ñp,ÿWf_…ÂÏuñ}¨ÿr³Ì$eqÁÖ¿÷û¡G7{x¸Goï>\0º¿hù‚ ¿å~šâŞ{ ÂëºõŸh¼Xèïy·®|»ûT±²/Kİ¾ƒúñád?êÊĞ~şî{vç‘÷/.nı¿ÿ',1460653190,NULL),(8,'NzpaV0in7VA4','phabricator:celerity:/res/phabricator/e5484f37/core.pkg.js;-SFcBZePY3SkX','deflate','íıiwG’0Œ~ï_ºûef\"å¥{\0•üÚ’<–ÆÛXêeÅÁ€@‘,ĞX$rH<¿ıÆš™•Rn÷<sî½}Ú\"*—È-2222–WëıáEq¶™×Õ|Ö¾*W«ÑyÙ¹}?Zş®,få‡ß½X.çK—1ÀŒñh:-—Ã³Yñ\n«÷ø{Pµ]Nç¶ìùbî—İ®/–ó­r° ˆ¯}æ§ïÊñš;°,OgĞ:~TUq8¨ª\'\\ 7-gçëH88èÜ.{‹ÍêBêWÕIg°]–ëÍrÖZj3£İœ–Ãôe´„Ê\\\nU«¯—ËÑM˜ÿ•ıêÛ¯†-Õ\núW¿îî¢æF˜êZû‰G±XÎ×óõÍ¢ì­ç¯×ËjvN3T)Šì˜GÖ\"È\'7;/nü˜ğk8Y­sú±Z;·:s—¿«f¿óÉZòøò¤ĞTøífLó¹•Ój6±­ÌÖåõ:Ç„üj¾LUŸ¿øËpH¿q0ó³ßa½\"ÓŠYç–P¥	H©õäf3¾|š·z½^§ßÊ²¯×ëòj±†¹h­ç-,ÜZÍ¯Êõ¥\\ŒÖ­jÕšÍ×­QKÁ÷2Xğ-õt¾şÒ‚·GËóÍU9[¯:½Õ´\Z—íÇÄQ¬D}p‹áRz£ÅbzC%òcéá	Lôl<Z·	tÇc–›”ƒÊww\0ìüCN•RÜ=*³=:/\\J»,oV…àş6˜h‘Ø)´Ş”%ûâ²¶*³¦£™GKø\r`’ö¸ßØãÕ|ZŞİE	½éüœÖ[’ç‹r9Úß·_½Å|µ&êÑ¹\r+·P»ï÷‡ËêA,ë`[NWån0UPn#ƒä9«wŞS4\Z¯Ca)9*µ.ÚÒl´®ŞÃÄd™òr‹Ç)+œ~\"R3N(ÎFĞçAŒ)W+4-F»;“ÑgÛíIf9)\'­e	­,G3@w,‚˜ÎP[×Øz¹Á¶Lxİølş¡İ!´ó™|>ıWŞ¦¯´SóTñîg0[M ŠÏö÷Ãœã$Œ£“nXêğ¤óä‹ÃÃC‹N°PgÕò\n\'ì {;{;û~¾^µæg<	íÎªÅ0¦7½Ö¿UÓ)Ğ…òê«¬­ï(@Â »†´f\ny½\0‡:mŠğ$íç£u‰¿ÌösÛÏIÌowzçåúMu¿\0í´Ùj\rİã$”ÎFWe?Şmf—4nMÅ­ûêo!Uõ”S€µ?É´ÂAö‰¡ëåĞÍe)…cây1ZÁ,.ËÑä¦u\nÈÕ’rå„¨¨C®¬gØVó½¾¿[·ŸàÏOúØ¿mÜAíŞ‡j}Ñâ‚-8¬ozPò¤—KÇÕü}ÙªÖ­ù²…g#Ôcèşº|6­V­I¨€ˆ@g@Ûw§7üû¦Ü\0éª§Ávítx×Öã„™LLæ´×1Yöwµ®FÓê¿Ëæ³ÍtZãPjÍ)³rpPU[VÔÊ ×r|t‚;ôàğ(g“ıı½W;6	\'x~Ïàp„¿¥.Ô[“=\\UùQvüĞíVUš;\"EÔ\nîiAfä“rZ®ËßÅÉôM]Bœ\0TÀ	¸ø÷¤W:BdÉ <ƒò0B£õx~•ìï‡ß=B[(è*Éq‹ëĞ‘ƒ«ÈŒt±`vbÙn?\\TÓ²ë/å»æw*£¹âBáÆww—e„\r‚Up€`Ò{hkRàJ­€6×ı£ú³®Æ+øuU^–KüÅ“\r?ï«’Rß#S\0?°­şÑ–ğ‹ÎtG-öø›šéØh§ø^Ù‰ÙÁ%üJoE®Õè@ßfn¶ş‹*ıï,Å7¨ùr¯(n·6áa]1‚ùvM‰ÿj­.æ›éhm8}öyÆ×ÎØ°¥ı\n.ËÕfº¶¼ÄUo8¬&Ãa‘\r‡À/\r‡ÙAûàÀn¨,³^/ŸëÁMÃİÙ8ww|ät/±‘Ü3z¯ÁeV.îŞ ŞKä¨FQğ©twÇ_xDÈT?Éhì0Ü£Ói9dOiJß,+˜0\\bí.°xLzgã’hï|³ÆÓHpùá“q`0íæ,hQä8K ~êõD”îÉŞèÜRq¼—Ødº›àTÑe©FÅ0çåŠŠÆ²Ï&Ãßµ\nSß§èWÁ=öeñh7PÚJeÒ¥¡É-}Á˜Ç˜¦2D)V%\\m–¾‡ˆğÁåRß3ncîIñ^™HL£kB:$—âá}HO|îîn·ÑÓÑª,\0Ë/FË¯×íÃÜOÿ¼€bÏ ½İ9€ÅÙœBµø°D¸‹F›õ·Ñ%Ï¦Œ!j”³3˜‘ì\0Û:)xrx$š}î³ÏmvÀèñËtÕqQÔ¨ĞZÚGÁ±j\nÃùWìaöâå-Ç4µRJ˜P¸uµY­é\n”Ó&Ìê@åQk\nû‰/\\\n¡{c¸HC©ñh³\"Nî·ÜÅZ0Ç„D½Ö_FË\n÷ÏŠªCéÑl4½ùo€9‚ëñx	œüÏÊÖœl­^×À†æA>Ô•Ş¾wğ !m¦DÆ°öPË×\nÓÀ¡<,¤Ôèµ~a\rIˆMäàl„ô›2¨00¢`İšÌK¾Áójà­“Ôy¼³êšê\\Á¡}VAó((±æx´Ànà5`5:+§7ÜQœG?\"\\àŒÜÈd86ëDü–ˆ,‚\nEÆ\"—Ì¡\n¥Ã‰G¬ÆoŒ*N Ár%œ¨è¤­Ÿ…ÀŒ¦°^áÚ½\Z½­ÆËj±æµƒ‰Y\0€5(—%”„…/ç«•£ü´ÈLûÄ*Ï\'²ÀÌ/æ^=ùˆ(¯aIaî¯Ji¤×zsÈŠˆs·öÖvø¨šÁÒ@uÒ¼rÜÌ7\0\Z—\Z.­F—%Q$¦ó¸Î«êu>î1!‡ï í“c—çqÄDµÜğä ¦à~8‡k`«/üIXáõxD³ùâqAÓ¢3“±\rÏ,GY˜Té™¥8¦gV9ƒ“rI»\'àÔMº;Ñ¤îş¾ÉÊUæ[¯ÌÁVU·ËôZy\'[¯1ğc-x¢=w	EºZ€¥™­‹€Ù¹åÓh>™k-¸œ~ü=ò]\n®VR€ëÓï»;‘šÀ•T³=¨»;_ËI{ÏÚ¾¬aµµömÈ_9XyC\"1º[[õÊœ° …Zïrõ>ğ%.¨kÆ„s®p¶Êıè\\¶–ã J¬/÷&ì6¡=pé~R£õÅpHó¦µ9©Ğ²*b<¡ŸÈ‘\nø~~i˜$¤}5î%ã”	“,¬ŒŠ»uÔJX&TšCºˆcºHÓÑâ­JBp8çÂ\"KXZä õæ\\‡zï€Tµ³¼•u aÚ²N²Ü!¥OHàûÜ¯¼•gÕM¦¹+œtò[àWıóQg‹\\1Ïö´ZÁF	g;Ç[Ìéh|ùOœvn÷×´KŸÓÓšë»\0]0Ü„•…ÕY³÷¥mÏGëQî[°&(sÃÉgÜÿ\'¿iÊÿG&ú·œ^¦\0¿éÓèwñU¶D™ıPäêBÏ<¯7)Ïª2®7-!¨­Ÿ±\0ÜG?á/ÿ“c<â®:˜,`D®µıä´÷® ®Z0KB6íÇáµi„\nûÑ÷¦¿§%‰ıøè–î“¢(ß|·ƒ&‰\n±u6&ş;8œ=ûw`¶•eÎr_³3h›^:‘+lØ[}:ím›IlŸb¶ŠãL‹gyÌÄOf?ÖAñ{?Á¯j¥L7+j¾\\½pĞ y=ÿ~;§t \r3š 4Ä¾´³ˆ·Y~«BÀÛÕz¾°ïXüšGó{ï—ÑªÑæ\'|ÑãQ?ıfs\n—ŸÁQŒÎGf¿–„r\n×ì×µ(@åN(^È…sş¨1„¿Ğ½IŞ½zç9Ü7Ó5v(L±ıù™s\ZztYM§ıXn\'À\0\nµãŠĞÙ×‹r×…+o: =¯@²}Om{Tª72}5Z/‘^?›OÊ`T©d^­~©Î/ÖßlÖëùìA\rªè¬ìüø¢(>»»[öN©~Q<&?Î—W£éóÍª|‘Z¸Œ/æK˜¼Âİ­Æ—Yÿ(Ï®°ÖfáOàŠ“¡H™<éĞÀñvN¾VÇK”øul\'&ÀÍa=‚™Æ!Œ¦kù5^/§ònêg˜C…ÊíŒ&\0ß—–|Fä	Ù+j} Ò<EZ\\§Œª¤¨ªZZÁGEt¹™wÓÿ§´_ËúÙÛ+dŞcˆ\'{õÕÄm€ˆú# ’‡i&I›ÁpÒ=Åaœ¤ã	®1	zš[ Tù\n÷Dq+8Ş¿ıS?ãÇ,ÿ—~¶fùÑa?càğû3ÿûñûY¹\ZgùgğcZ‘ûªöåŸAİ%îŒ,ÿjæ_~öø³Çœ??séö¹BÀ/´òvkßIn—‚~}œ‹é´üF¥”Ô	NıB†¾|’¯˜öõiu”Ú¹ïNrÿvK?W\"yÀ„jõf¾_ÈÄÂæ„jØ—[¦\Zu=Ÿ\"ÚÇØÁ\";ÖMÖægHh‡üß	?;‘¤9D¿AÈ—¦«mØ?\\œØÓGkÌÉ+ù4z¢Ì+4r€İà_®šÏ64ÿ¶Ûmx¢9ôÊoÑ3Ìé„fqx1šM¦xîÁR\0+\0©(5îgŸfù“ÊërüŒuh¨,uü5À—U¦’ßLç°-óÇËÙ¤¼îæÌœôC¶‡EØPãû1g_D€ø±WÙŠOsz}uZa˜‰ÓIšk^3¹Tƒ3Â\n,>-Q¶G@QŠ,/©v1?O+Ï*jÜ†=ÇzÃIµ‚Ôñæ×7¨\'ğ;Å*À• \0]ãñ‹¶7”Dtº\"!\\àFÏ™QghESÄƒÚ¹K®È@öŠÏ¬Ô>â@6ü}S-ÿ\'Ááô¦õYËƒj=‡›J¯Ê¯ÏúA |•±ˆÿºdmëuf—²X5!Å\Z¿®\0}0+@3Ò¹¥?¼ßS©k1bàaÉéïÉ‰?pj…QçÅ•çâ|ºò(Êeq;ÔĞ:mkJÔÏX&¥´óTúWÂpåE5!~Hì0Î®ofÓùh’	È\\Qft+–½ÜÑçSù>ÆR\'ôú¥¬\"QÎåİ;Ë»wOhüXŞ½3$‘çëİ;Ñ¯š@%$Z+J%ÕLa‰ŞW“‚éDŠ)]M:^ƒî:vyùÄ<8¸¬K\r°Àñå%> ­GçıßOæcBïûp4o}”·r.Õ:CB1ÊM·µ!é5Ñ>Âç¨¾ì˜¨?¼Öìnè	gîìŒÔg5ƒÇÚ)à[ÒéFW]º«ÿD/â.wèÅ9¢”RÏªí\\ñ@{XªÚÉq˜øÂ2]ì•fmh)÷ïÙf‰Úï%=æÑETP×mÇµ¯%7°ô`UŒ5_SX{³\\Í—.“?»G3I«cN=éÜÖ’z2L™æ6±zàøQĞª›=)b{â–\ny˜(·¤	¸œ…eJ‰©ÊµİD/¼†3CzKY,–ÇŸ×\0§éç€ö(«¹B=Ô%ÄÔ‡zŞ[-Ç/¦%î“»;NálâšèPCúÛÃ¦ŞaÄ3Niç±yf¦œ|w\'?Yúz\r‡<Ü.JW—9u;CÅ‘]:é	¿çpÚş>ÿ\0Òi[gR\0{ûãè\n¹Êïçôu>ç\\?ÕJ:¥V5!Å«‰‚¬&\0±šÔ«Q·WÕy5]‰.µ3d4ºT £#“Ëvn¥ÿ!}´u;¶¶¥D°©Sœ;/Ñ-ê©\ZøA%:†%ª	÷LJë9†-é‰FŠé.ã–,\ZØ“NÁ+T$æJ9\\Ï€>­\nÌ)œyÖ (8ß¬}ÉÓéf™ÉyŠÌïndÅ-ı„n-×}¼£æôJdôå.ùæs³àºštØïKaÑù{³¶ŸHä›Úğß[;@ßŸÌñU\'†\0÷˜öÿ˜ªÀn‹J25ˆS¥x°dÈ;éãÔÚæÇ|ŞŠ3\nî6±3Ú%7Äuõ•_U[®oŠ:ßíÄLóÍˆ\0«¹_a‚gÒKÇ¥ËŠ÷>¥ğõhûvĞ¶£}”\\ğtl!¯ßÃ‹í‰ÁÎÛ\r¯aº§ü\\€Mã¹^;;GÙşJüæt*\"ú[ÄÏi¾ßFg‡Ë\rÇÏÅ¦(!7=WkwâÀïaíºÂQ•|Z–ÃÑ‡ÑMqtHÿsäh9Ÿ¯86ñï€ÌşìÜJí‚ÆtÜ¦rP°ó•¿ô‰Áœ\Z¿TáIs4ßŸ^¦øİö¨FJÁ§ŒB²‰ÇÇ)8¦„“¢m>îî;Gƒ`V´Ü8WÕ¬Ê½»Ó”€ènC†$68Á–iS5\\÷å	÷^øˆ‰Gm	zÚ§OÃ§ğ¹~«½è‡½½<É¥J_şnæNùríŸ\rFùiÈÀ‹>ç¨§0»§îg˜Uš¥%€_µ;İÃŞ^\'2YUşëÁuªï~±¦oŸp^ ş¡‚XĞ‹W\nœuËîÊ±ôoÇuR¿SI_÷r£ÂÀŒè¿Ü€t,Å´40­m\ZØ2²íßß¯%	¥¦#‰©ô¹ótY.½¸^D¹ÇsûfäS†¯\0¬¦¹vw‰röU}… ƒ§¾/ÂŞ«ˆn(ê=E˜—k	‰‡ÏcÊ9	Ñ=R‡qÕä;Q;qmt½hgT¥…xc ¤™ŠËŠŒ÷àY^Ã‚áo„*jTb¹Xï,#8ÎMn¿EèØóCêë‰™!Øù¦È&şMUÏfÎ\\g8T¹2W#©H?#§Kæ =«×È¤úÕ û\r1®uíÌƒ›ş‰ØúÄ+èö“Ù|Ö-ùêbM$Œl¦r‰^ëÔÁ›V—åô&GÙÚÛlY¶6à\ZÈuUp·è½„´ÿH#“A­Xot4{›¡ÅĞû²%œº“	‹_Px)ÀÎÂq%à¸à2pÀx/èU(¼ıéÌ§SòS8’·ùh2ùgM´‚şÿ†‰Î²ˆ\Zëxd&L/g…›ëÁ–€¯š€çr­ã§aÍpôQ*XƒÿkÓï)+¯GxÉl7M?àÙïè=wÈ7N©z|x‚*ÄüûHÎ3¦a†ÆùÂjG\nû¡ğÕáƒ½CyH°)Á?Òç1å$4tvÏü¤Ä)wæ\"£10X+šŒ7ÜB¥eí$Ò|jRéïAÖaëÂ#^­Å²\\ÑR‘‚0÷œN§7$î_‘à×Ïf\\4§gÔ:-ÏPµoµá@@ı÷\ZÄ\"=ƒ:~©°¯¢\0ºgföÈ]å“.¥AÊ±ÿ¢G$9kš6-y¡µPTóàÀß·Q¯úI?E}4íªo›ÿ5¤‡ÃÏPòˆƒ{N«~çˆH$ÃâÂB5×kÔÜ†_ÑU%ı?ğM	_İĞš*rú*¼¬®*4†o”kãbú-ï•=ˆEIí\"xÊªä€½óñh]ş `øE2m€Óóo–Àìê;êi	SWÍ-™O!G¹œO‡šZCSµ7Ô_5Q*™8¾¤dÚTAsY£Ÿm„—å9rİK±Æ…­wî`1ÉÀã©jFÊÃ9©&¹‡9lU][‚=q‹®%’­Ÿ–§£óòşÖ…±¿×6#QZ8ßœ&Jdüè‘qRJ•L¥yV›Läv^¡ŒXüf´üÉåc\'a2§Áâ!S§y‰Öá-‡Y´+Ò¨&v½ñÊ‚ÒjÂÇeo·ªX­¿Q8Ö-ËBdQ#ß–6¨}•¦\'Jo7Ÿê\' \rßÉÙş×›SË¥ù¬:_(¬tB{’ên±ñş3v3\r;Ğ·¢-ãµî„­\r¬ä\'lKdâ»– -5HXŞ<ûìÊ ÙgY–¦\"ëR›/¸µù÷kH+×wXÓ^u¹<å@”«õª-ôl“cq»M¢T-İŒGò—@-Ù‰\nõY~)WóÍr\\Z}–!>‘ãDÕü-Š+Àº\\².‹ÊèKøC\0…Fï\\¬‘©\rE¾YV¹&Æ\0k¨>şfuüåbÅn&æ›u[Aç‡Ş5HŒT¦®`´ªBí?ÿò’šaÇIÚ•J8m%¸“ôÓ¼ìÖ\rãX	ñşĞ™ìÉ”ùRAÿU1İÔÈƒÚpü.ğ…ÖÍR‡\ZhW„MA‡m[»ó]I´ì.¢½ñj•u\n+pî~€õìõë¶ë—ó@z”!Šj†§¨#’B7«}÷Ë¡O_lIjÏ°=ªÁò¨°MåàD^AÛgg\"V ®ö¥=¹Ô†X!³âwCU¤Z½ßzõš-Sñq\nlªé†m¢r]Ü¹\\$/({ôÎY9Âet9îC\r˜\0NéÍ	`ÃçQ‹°§>—XÜæåøb4;/c­<Êâ‹\Z¥ç!zé¤Œ\"ÓiÉîî4‰‘Ø’ Gô¶>p›HVcõÍÍ›Ñ9¾â¶³‹5qà‚…Fålòì¢šNdBÜ‚Æ%VIQ¡SØ´îX(ëS‹hkŠ2®`\'.Ê&ùbYá,ç|åÁÏLfıW\r&2köÒNUÔg áVFæe„†”†¶â/gp²\0§šÅ|:Í’}ÔÔ¥q|+¿1hĞ¯)1bÉÙ²ßsêbQïuÍú’&ŸëÒ)HNÒêÙe~şH;ıò#—¿{Wğ<xGªĞ¹å&Ş½Ã&4µàÂ¨\rÕ´;]c³r@Õ¹ñóî]~ÄPø\\ñ\0FeZ–éÉåõ$ÖCŞZs×$‚ò¡– |øøoê°¯ŒS§Ù\0ëd:X0ƒé¸#Kgl>¥ÕBÏ>m[Ò{şx£†kø	œ~¬ÚµJ¨#·¼ÑFz–Œñ™­]²k4î-oN\ZĞ–wãÓíòr!ßÏ…u±Ä‹\"%¢›Ÿ-©Øú^ùeğİrÏ\0¶ ²Ï¦H iÈ7¨=Û%şÃ×í{¨¢n9³.¤!$›‹.Ú¼4è¼õ%ÑMŠFTõ@É×ş>%#ª\'h@¶at|ÑánœÉîÃ‡ g(®`×s²É0ÈGãƒF%“ƒˆU´Ku¹B³#ï‘ÈnĞÜ½¼ªI¶AÇ²}–¥Lµ3œÀÑš¹Šˆâ·è˜K²<ƒĞş¬àÀ?ş”…/®êÂß³j=E¬Í‡×ÑsÀÇUvâÜ%İ¯/–—åè£O¼Z«È÷Ê)æçC€V¡ı&9¢Ñ—Ÿø´KùÓ²:¯fo<kkÿ3nŞşöÃ÷ß­×™R¿›¯gp_QÆô76tkg?¬®¯¦{X÷Í›ŸéRıZº@˜Ÿ­ƒŠÔïg?ıòº±Ç¸¯1£Hv˜ŒdªõÅ3¸˜Á¤ÁV^¡^0ÕèÜ:¶Z$/{>¿\ZU3©¾‡úÂl‚‰i%(ÖöåT$=Iõ:ôÀ—QÒl§¤	Î&g§­:\Zñlµ;}—‘X~Óõ<?üWØÄö]’®—*-‡×$ùéöl´Enø¬Ij\06AšQ±G6ëŒŞ õ[Ûp;J[Ñ^ä®;¸½¼Z“a˜3eíD›Œ]PõÜ&«{€uE­¼@VYúK2¨QàèuE`ZR®ÁW!½)¨h0êÆoĞ–##S2…³‚ay7P²Œ˜æ\rpL‡´’ßÎ¦Æ`å¤®\"z0ìz)j˜A0å”M)_\0WIi\Z^HnëœõÅ|âzû}¶#PƒÔ²³Y ?ÍP*ƒ²ñóO¯ßd¿Hè–Ÿ¡Pµ õ¯/ŞD~„+šÊ‚çgÃÅ¨Z®ÌùÌ2Åı#:­z7ºa!áô<Q•~¢\'R²şv§	*¾,íaŠ{É¿nÆpº^—Kæ©–¨fb¦gÂö²a™N;h”!¢DGAâù­¯¸”E3—ÉÖ\r	ªm<í½ğã+”|üìgûYçàï~Ï{Ù7Ñ{Y,Õ1Ø†WşÜíÅ/¿üôËğÍË^üôç7¼{°•ÍŒ„Œ„¤el&ìEæ5îİŠáş%ÆäŞ:v‹ÓèÎ%|®çŠhHË¬e¾ƒık‘âÏlİEEJà‚ĞC5¦ŠG×İ>tk¿ên–Àcç$^˜æşŞQ·&Q|bzr,ìaN”­fR=Ä›ĞRhªQ†@%”iÅm0™ß–’’\'èV||6ÓG‘—.€s-ÄE4Øs•YJ /ÌÙ+>Oä#ØÍj¯(÷÷ƒ¤\'ïîlÊÓâ³ÃC·ÇÛÆEsì\"ãz¬İğ|3Zzúú‚Ÿ½şåÛÅt1D×òÈßxÍ±%$vë‡Ïz+¸Ì“+]ìùŒk!Å·=†®GªíŞş~¢BàÛi{0è²Îêbı£}R‡)Û+RŸwİù\'ÍÎV¿œFœcØÆœÊH\".$íŸ7)*A¸—‹úëğ+ñ)şàfÇ£Íùzãpø\Zˆúxk»äèÃµ§d%Bw·=Eµ×Í›’AÖÔ†b‘€F‘¨C‹U)_´°È…†(Kêˆc­¦k›š$íYD{vv‰—lƒiº½Í£w Z|o	À›{ã`KƒàúE^½şéÇŒ•(ğëë¿¼øşå™±ïïa	´IØ¡SÀL´Ñçc¢ şv÷ü§~ÆªËèb\'ßV(ÛCßæZ¬Mòß‚³¸Õo—ó+‘@P@–kÀ}7Ó3kÜw½…2‚İ­nfcñ#‚ßx¬@v}ùüM\rË©¸FD5	Äúm÷ˆàİGîñ*²­’šYëÊNÓñü|Fn\Zµmv0e¼öŠÖ05oLùXèïÂàL¡ı‘35È×«%À%23\né‹[@¿JÂøÅÆxñmT ”Ö’øëÛ¸!)JO—¶ê‚-F7˜:ù´6Ù\\SNá8\nñæ%÷‚aW‡„îºµæm)Ø‰xK–oIæ½“(ÓTçÉ”…aÖdóJ\rß­TÕãäÄÎèJb&(Î&6‘¥2«XísRÑßÑòÆj×qÓô­º\\¦`ä§¦ga†J|AÇFg‚OÒ}‘‹Øeî³/ONBéÎÀ\rí¯ÕúÍw:ûoTáë½¿hÙ9Ñà¢ó/µA,nî8.ªo7Q°“‰ÆDYş1:¡¼o.¤¹«÷nô¾œV³¡*Å‘	bÀ?\\”3÷¸Jj8‹¨oüXß§]kÎézp{ÛXh)ó<a¥ã´	›çAÏuN‚DBqkuĞ@yKkS÷ìiëN\'¸çö»ÿrxx˜\'¯õX§×ûD8¬PúPL¦„Õ2ÄTzéREª‚¯“pÈ<ƒÙ€ÎÖm,…*â^uÓ\\êJ¡àÀ©SdEv@uüFÃ¬ê³ÏÔ.EGÍırÄOxÓp‘v6P£¸³/ÚÓw…r7c¯X›¯¾èI÷ùKVÔGÆNªŸN\ZEã~añ¼ªô\nœ¤8Ÿ2Ø!£÷J9†Ã‹50H¦	®˜›Õö*ÓQz“úÎ”ST}ÜRØ\'Ó11ŠßFŞ“`-½‹$ƒ”Æâ>K;ò%Ë08>Ô*˜Ï!N.Cî™5Qì.…—†ÂõA“wª?üÅ«]\\ç7Ádÿ¥DİGÊ	|	¶3ÎI?k ÏèŞ„X`øgBZMóUûZòë¢}]ÈZ|…ÿö™ÛD[c)*tS´o\Z‘a­{½ºæ‰’ç«µ›Qğ«j$ôĞÿ•H}7²¬ß¦^Îäü¿Î;\\\\ÃÎ2µ×ó…T¾ÙQùÆT®ŠÕÕî}¨&ë‹_ß¿‹=zıC]ö¡¾ØhÁ¦˜°änm;·7Åuïfp\rÿ^{ş8À.îíA°Æ,‘¼9Ö4ò”ö¾*?øWÈóä²ªİ8ìsLˆúHYÉsf>Ş¹†šü\r†‘ƒ+Ç³i™¿øH‰ğkÀ/•ãuÑ\\Ú\\¸;\\öıOæˆoıÃmÃì,9ââÙú@‚c¡— ¿ıtvˆ’S&@±yÿÁyñ×GÅ)zNÈİ]åA—|šX†~Cº©$»Dc$¸\0>äÁ¸·‚‹åtú=ô·“»rÿ–ûWîÍ|Ñ‘Kü5Pzü{%ôÓœò3;?§ú6e ÊvÒœTwpñà€ÓÀTØß·_{^ét([ÎŒhà\'J@ò`{} öJ\\\0kuÍ”nÂ|¨Óõ3AÛ4\0=ĞpIÁ:\nq·Ó+Ä›LÆê´¤yM¹é¿\"ÉMÂwD2àkên,C>\r»Åº@>-$»PÇï»»S3ıww¥ùÊë(ï‹ÃlúÒ4µÔ÷¯ÏÏ—å9\\ºxßÎ—¡óGŸ6\n(ÂQŞİE‰Ñ0Y3`S`3–CÄ“J]>xJd}x,ˆü1‹\r/SñËÎu(	oŠíàNO—–6ş¢T76y8ı•£ØF„lwwc!\ròy˜Û2Œ¾~*Ë´ÿ]R‚äÚ×ÛV“şU¢•Fœ¸»7J$Œ8»}VŠÉ\'\"©º6N#o\"W‘ğõªººÀ^åßî_Üıås²GcKDÌiwöœ™áfB5ë››—òæ\ré˜T“½‚¢¤Eí29‹ÊxQÜÚo3ôŠt½ÍÔd&İh\'|:àœ ´Yâ9	c“ÈÍjƒwE1‡$\r\n±\"ÕÕ>R‚´q0–ä)<Ği‰©W£Õ%[DĞ˜íŠ!ŠÑB÷0’‚ÁM\0‚Y©Y¡³îI\r™c-²Ÿ‘IkÆÖv«@ÀHT!`È¿{óÃ÷iv¾iÖáoÄÿ`\'.äWĞJ¹ä[\ZrÂÙCYã²©=ø}w‡ÿö¨ÿ~]a¿µ¤Éözäùê©wi¢Ë[z,¦ÑthfİËÃ¾ÆĞœ\'›–ç¬é¶&hø‹›ÿÍçkr\r>İ\\ÍøÇùr®o1¦±A©%UÅ&¤<Géê£šWëÍÙ	Ò)Ï_\\/ÚÙ¾}»úôI¶ô@îØwè(¶óöí)ú0\röãæ£íÁuœÇšä}Û›rá¦›º×ë}òqÓ¥¯Wp`ÑÖÙrtNøÚl=ª!²`¹ß—¨qƒ¡‚æ­ç?ı (ûöÅl<ÓƒŒ•ÁR¬jSE¬:«¤N£Ğl´¥û×u¢‡àxA÷¤(\nÊ[OHê)›?NçpsÁ~²^>E• \'´’OÕÖ!\0°°•‡8­Å£\'¬ÎùöôÛ	è¤›Bi„ü¦W*ÿŠ™Æ{æí£%\ZLÓEÓ†¾\"1/Gÿ}óÕ^ëù¼õãOo`2è\"µ··§ƒø\0³8ü0_^Âvm®ÈˆÍî?0\0Cèµ^¾@ 0Æ/E‘˜}#Ğ-²)U¢W‰Ï„\Z%±·pMw×µoâcûÃÑgIb—ÛÙ¤zÀ%QC4Æ>¦`l{£ü671f¨èYµ\\­ÉZ¢së0ÔÚPhAq9¤™Ê@+””‹q¥ë¬J¢Mï\"rëº4ÆVÈ]™HÃÙs§Å¹øa´¼Ü,H»ô{EÛzOŞö›Á>}(Ø+v€à³2j!\n3Q=ù®©9#ÔÆt>ëşğ£‰(3:Ïñ4Í¬ÀIĞŠĞÕçb-o\rw‡ß©s‘\rG–à?êT/Ğ½ƒ¸€Ü+ ÉÍ`ğ\'tHDÁ¢’\"Kà(&°\nHô0ÎòªĞSãªlqÕ>\"Ï¯\n·×À¡…HØ+rÇaYu’Œ–¼|(7Ùj”á“hôüÉ.`^¥<º›S*„ÃnO¾wÔÀ8kÿÜ—	€`J+ÉôñEXÄA‚]™>ûº»bç—åMëö	)Cb$‹³ç¯@f~‚GÓ\'š!¼Q«·2ZrÍ&QM(i(æH	\Z—ÃêWìœn·¢¦Æó¢ù»8B|×·†´âxó0nfÕßùt}I¹øZ½„$RÅ:úÒ†Oñˆ\\jØ=Ü/¤÷|Á]#\re‰Föäf3¾´~4ˆb8¿åÆŸ»r(<áşvPri@üëÆÙd’ùBçÓ³‹a\nLöo8îpû	²ûcçSÖø·ÔDÿóŠõªÕÕÏÜ¬èqnó`ô¿áğÂY}¬İÅÿÀè¾¦Vé¥+qÓØøJ-|CîotïåuŒÉã–vµ„Á¨p8µÇ7mİµ”‹?Qu} /e\nR¦¥ŒYÇ\'\ZAOËy¿¤IÇX¦æø\0W2šş°›drYïªªÄnñıÉ<ğ.y#ÕAh·Bî(V²’ë§ÓÔšmãÌ<˜è@Dı%B\\¿(‚KÆşşö\0ô\rÅkÑ<šöæh„I\nÑ¹×9üâşæXñŸÌ ”½w±RYQ{çæ=ZU-ÅpâÉK÷÷‘\\LGcŞË9k/K.\"„—Ô«$•ˆÚŠ§N›¬Í\r_˜V®NÈ1nnµ¶÷V1±NÃdJÜË\r={]¢§«Î­Ëvzq™¼a?ê›pšT°BÂV†}3Iú4°A]cY¯4co\Z,÷MÑBé£Y¿ã”K>\\º¯ŞÌ“ú6(Ç]i±¹,0©ÁóS‘p¨fPLSFèGCsxôÈI‹á†PéØæOª\n&¶Œ#+AIr\0.B¡(‡û<PÑF®[&Õ¼”/Êñåéüº´İßjQ4Ì„…¢İ¡£Ñ£ü¢‚Ëò~ ¨îäøY^¡®ßQ¾.ñ_ŞÒ\0êÎ±*ê›~ıË‹¯!óõ‹ï_<{CóŒ¶TmRò …Ä^\'æZ%>Î‚U}îô­R‹ª^ÚT7…Ì’p\'6a×­-lBİ…¼¹9t¥Wø¯£“AÔifÒ{{æµËyÙiñ^QH•!†$ÍÏ†X—îBí,;hÈ_`¬,•Ôñ‹Â¨\r]2j(-éŒl¡\nYğø\"FÂ¡Yw-(ÃÇN\nı×¨ïıcïH_Ï\"|À´—ÏyBOqx#\nCäâë8›*&p#Õ¿æ&l‡\n@_Ú0^­¨ì†i5Cßnq”Ä(qa£8R~B’ÎûÔ±ü+ô!+ÂC	£—E¼«‹•·’!dIp7šáIÃe#	?Ö`]³Ñš‚š“â¬a¼êä½}«AÒtL}ëœÖ÷qŒäc¯i/Ÿ\'~Öİb$‰¬£z\"qFñİ&8tá´Nx‡L@%_{kÀèiàéš9^LÃm…J!õàU“	ìXBóı}ş {G|WpĞ})ÖjZÑ|ÃÉ·$96´%ñN‡ÿ7ó9*bi\0}‘ÿKuUéà#Š6ù¶éoİ÷m˜õ´{ÄÒ’ÉØ@€\"sëKA%Ï•BY¨AÓÖ(ÂOÏs™g…öŞ½}»ê½iÕ‡´»?t`Ï³NN=‡ºbaÔH$ \rÉ~º¶í?:Ï³ıÑÕb™ÔO(õï›ù:H~BÉÓ0ñ)%c\"ª+]Ì?Ä¢Íª\n$˜ÖHÎÌp.‹ÈF,%€f<r °H¢ôÑUk}(ñm\0xWÌ£Ç\"1N}@‚ÆES\n·ìttSdMsU—áşŠÍü_èÕlq°Èèü ¢¡pÃ/VåîSˆùµUIÒ±) wg*É‡|¡TÌî›¢Î{\nL!†Ü¤¹Ü xZîßmƒc\\X=ºë¯Ú×¬äÖ‡u®Ë¤8B\0k€êñ†c¶‚nıîx;ÃíñätÙzô²<rg:kæh·Â~[Ö_\n8¸íÆ–ÇCÁ{Œ&±\rÎ¹C™\r…Ø¨m2\0ú«…p*~^;}g.2\"ı4j)_K}Ù[m¦ëÔÍbf*„aÑHÚû6û…RÜVÔ¦5×ÚœS|VYùÎo4Å´ıä|:_<ÍE€ïÜ„~âü¯òÑ3/“e2ÑãøaIæ\"õèã;+×óû:«ê\ná“ï¥Xgúö~“ÖRÊÜ\nùd¢Eüú4„Œfã4®ú˜µä:ÉÕ$èÿÄ%å¦­„€ÅİÌHùYuÊf¼¸ódÕÂù:`–òî#oõM#tÇøØÔ!İ@QD6íEã=peaEiq)Ê¡NHmobÈ®˜1F\\–Ùb®W·Î§Ã\nòÙ˜Jû·ÈLš[2~­w8S™1Ëîq¤ğEõ¸°/%…­Î¯¿é-å‹ÄJbDïIG0¥«¸˜G\'K (Ò#O©ÌaÕ{¤@çE:Ş¤][NÏ„Èz|š©Aûá Á(<×ƒt&jÓŞ¨m+ıi†h6²Û%¾Ù>ğ2Ä KŞŠl‰\\®ÒáõˆÓv_ÂXw5ç_dAlàH›İXİ¹à1ŸvU§rádM\nÅdzêş¾·=æ¥™Ÿ¾#-t´y1vÉâ-İ)ë` ˜†2w1wFĞåvv€U²³÷Ô—êÌ0PŒ:]ï+ìq;H¦ª|¸Ï7t²H“7Ñ»;ş”MÓİÑ9²§4/ß=H²z¢	‚¿t°ïïÓ¯¹ø´~_ã 0;´×r†KEbĞr‰L$k\0gşá•˜€›z|Á€âXR\\-KqãXG¯¶Â–«±LXğ LÓ_ë•¾„&XTŸwæ»v[ëÚ6Ã§)€ïş£ã·oß~òöúğ°ûöúèìíõÏàÇ¿œ½İ&ğï—˜ƒ>‡ÿxG<ıœşıâíæñáá¸KÎğßÇ¢Çôñå!}|	gåş{v†IğçìXg2€ìßfoOa(¬J÷vM?QïíŒ~¢ÎŞÛ3úy†?—ô•ø>¡_Ÿ`â[ú	x\\ÑıØN¹ˆ5Å‘\0I¬Y£y8Vş*û„®ÕëJæî[\n Îô†káoœëÚ‹Ê{mI`õˆ¸C˜z|åÄª0Ì\r®v†õ²ƒ«Şøb´|ÔêëuûĞx)<ú²Óé­È³e÷ó§Wø³×«!Ÿ¡¡sHª@r ^\0E~F/RËYÿQû«~ûø?ûo}õû“ƒN¿óÊ0½}ä?í@J¿ıvòi§ódÿ§&¾ÅüM•~ßîá¯GùP¬6ÿ}S.oRf›d}G»ä½x ²QòŒ…ÛR$[5ø»İin©¥;-CëEÑâï M¾ræ˜ı,³RP$0Ìœ”ã@$nµ¡8/hÈbß£·xç_î>hAävÍ.ëxFaÚª}Ë¿ÎQ¬¿F@k=³¤=ŒÆX p(¶Âx®ìâñÑÉİ#™¾;\ZÔBÓ…~Fsw)òYX„_+à¦.ÙŸ³ZîßqšöÅ‰ƒäŞ‰%ëË†]´NÜ+´O€?Ê¾Â´>ü8À49ÔÒş>ı	bé¡u»OY®W—‘XDû‰˜»T,e)¼\\”§‘ã÷ğË;^¾UIñ:±„´UÈ[Ùs>Şˆ;BQc\Zc<ºpÔ´,$®òXñ‘ã*œQªš§ğ¡°e¶5„]õİådYb>q5üçß=H“ª\n†qAC%\\ÕGfšZ£ÉÄtÚfwñÊÆÎ;‡×É±HİÓ—ñÀ0\Z7O•Ä] aÌŠ­MYAÜØ°WÔ1åş{v’¾u#ÚêpÓaşöúñÿ9ƒ>;ÅïÏáŸ/0ñ‹şù?ÿH9<ƒÛœ,ß>5áï‹oñÏ·ßò\'ü<>üüüçO˜şâ‹/ù—>üŒÿğ×Ñ·\'™øàóT:mïˆTp°J•Ù¹¸¨äUòò¯¾0«à?ÑZœ×g+ÄÕØÏh9¥\'4ÔNŞ×şğgFïÿ·PD:T]s_2\"ş6á¶¹lzşLùxäøâQÄ}{2¶‡d,Nßİ±±Le¹EŠs˜RÖo}òè	9¥Ö1Õª Z¤Î±«(ZÜÒ§ø>kĞz1[mPB=»QC\0oDä¨m§5-G“¶àì­—ÏsÃÑ9ÄhyÀ,õ`r=*È–¹uÁø\\5r¤\"°;3\"(ÜÑ»;<_¿‚yÄ£{àKuß»¥3-y\r%mí÷¾5«¾¤I=>Yó™’œš·J¡Á)î¨“¦VRÑ(¿\"®¥ß€üó¸Î³¥Á×HØª.8Îç©åè×’#DáZo{Äu |¹I’‹OŒı„TŸDí8‡è:½à¶QÆG©ßÀÿ:_^Mçšıo§ÃÁAğ\rĞ7\\ÅØâB¶Ÿ|eå§óó\rï0´HëŒ¬%¤Ñm´ş¾ÇDÎ{œãİ»î²{µ9½ªÖÙ‰1‹‡_ãK…½Ea¨ÖªƒĞ˜óË²\\Ë™(×üZ¥KÎÖ:aåÈ¸âõ‡£*.6ë¢NØ.§“g!¹o£OàDÚÔùŒŠd¼sºY¯1*Y\"_´F°È$Ç\\·Y{PàäH	I´Ğ}^Ğï °s	Ï&>¼öê£ÚájX©ÒH‚«å¸üiÒŞ’Úâ…Ö§Á	Èì]çÀ•¯9­6àAåNñ1ë³@\"DxGv´m@mÁÑï«™	İG1InwÎ\ZÅó P	 CÄANshÿ0Z]òk2\nØãmÃØë*¬ù\"¦‰ ¯óó\"U„·¹\0¹CŸÎWåwì©_èõéè½¥I Ü@•æ7Üê=cÛ2…‘©±o3B4ôõÊ;Àøœ{¯ª™¯bÏæ!5Nıh¯‚›E²w×]ª®n=§›­Gç}ÍŒO\rì¸î(ºüÕ­•¶Ìà|ˆÈ‰Kúq@š‡Ã1jÅN‡CÔş5©8ëÍ¯×LÆ\r’¯LáÇdÎ´–é	ëØÂ„¯nfë‹I/åš™ÿ\rf½4ãöNw–¼0Ğ<+§µ€0æ07Â)àìì\Z ×7ƒñØl	ñny5äÈõ¡z·>©&ÚÌk>¯h]¥F.Ái->ìL2Ú”Ü9Ö£”ßt³4aOã¤JGN1Ã}Œô’’©éˆ3.í½óHr$’p¾ê±ªÚ[¤ç\Z¹fËKŠp;‚»;)ªn);MçÅ=òßö\'ÁêLæˆı­GäÌ³‰ğqÌNÂ±QÀ—ÆÇf1Âğñ?LÌviÔù\rÚ[æ¡HkR¡­~è•ù¯?·}>0–sk	\0@–=Ş\njÏNx Z%Ø=kOjµPp±_	İL[Ñ÷p İó™j-: 9zÓ_fùñqŠäÇ–\0PH?ËJ¯wÁ‡ÍóZiŒìü¸\'\"C±J‰U…ñÀE»®–yQ ²5¢×Gyvä<v Sü€’¶+¸ŸñÑuûñaŞ~ß»éNz7G;ùÑá¡8$kæèÇ‚kÊ-zt	Ÿ¹”ÆÑS¯%xvîÒd¯3ği 1a«\n“™âBm1ËV’8§šİ?ÒUïçŸ^¿|óò//†/üöå/ßü‡(§£ú\'»ëÜÍ_91ÃUáNÍÁ\Zèê,¸àyóÅˆü,z7O°;ƒ:ŸiÛ2¯p¡Dg	Â3Ê‰îápXÏæK<š¶ñ-:\Zãdg–#wNÇöÈ–´Imç8ÕÊ´“k¾‚%˜¡xÚ;Fâc‘¨I±™±ÛO±©1VU)”%ÊC…ìR±ì¨3‚:Ğ44VíNq$ë\'úŸ„F™.¸ïé™F~#Zßxow)vDaGÿ.|xBÆÛñ«Tàrº+,b~4Eæø€sa~,›±(È†+gÄNôÅğ0Á7€•0\"Il—Í¡zü@ù ÷—m›¸zr•ôÆ*îa™m¼”Z÷ÎÔÍ˜EPÎgÛá1s€¡ÿ•Á”Ãøm£=ÌÙ±}Úû_ê‡8|ê`mÌ	Í¥ğ^O ô[]†6y ÒŸ¿ã›³-Crµ»Y•ËáÃ”+|Ÿ-J¹›0î¡$}4ı·ò=dP û˜Ê=Wœá²I5šÃú|ˆ‡\'µrÒ|à„OİE	¤TwO`4ßÓgqXÏK…$İ™i…×ĞÎ­À4Åª@‡İálßÄao}ÛWu›™ì²¼ÁX¾\"m}Ğ’³üÅJFQÔ¼ß;¹á}[©\0¡IvVì Ğ÷Ç’bneÕÃöÀåî—h‘ş!)ƒÙ;…jaé]¼úuœ”ı÷vÇëá¢¼Ÿ>F“w›\rËŒÁI`¬0Èd§\0‚Aó“Ü’×vWëMÓ2®<àÓƒõ-¹òCÓZ9]>³Ş®acãg2¯•ÏEĞWË(œ›ïÁNĞZLœ$\0JD¼MÌ±°”Äÿb´œ,æ•Øõ«äÜeî—ÆKá‚…ü%»mxxzcxàs­ıì²¢Â*s&jq,Z\rCŞ÷ì©vK”nÁE“8w …§Ó\r>\0•Xp<(O0¤“\'L9ê<SìwÇ¥ô8»š‘Á°p\0“ï<#Úy‘¦ÒM¼3\ZÙ+±\"îU«_ĞÕ7Dj}<´ñÅ(b»e#Vé*\\\Z¤‡%”JñS]°T¤w00{–“…á0Ò×ä5eQÄ!²>òåğE¾uiå“õ…$ª*zÖ¨ª¤ïÜ=’_^¼B\Z@óé¤\\ş¥ZUÄÖr4ü*ã•	Æ*â9áÃ¨ÂWªïÃQ Š(M½÷‡ÉµkHÀùòÄÖ,L¤	îLÚbÓíje;éÁíÇyËWDWtgÕùf‰ÒÏÈÑ:óùìón:e·ÄñqN»cä6¨Rşì\'¯İñ¢ÌW À«İv7¸p,aJo3C„Æ\'7$\'¤Š@	¾£(v%âÌxI|ş6	¼0}R¶BŠ¤îB˜õí|ù“ªN²K)BÛ¨\\\n.î®h<”\\-“‚‰—‹¿òP‚.0XãÍÜ¯\0_òãÅ2\r‹\nIb5[°æ%ÒÛĞØH°õº‰‡%FJ+1³¡Ô\r)Ó·$¥AÓ/şõë@ĞÔx’0õÒ	gqhElÔ)„OÁU^buëM¹\'·~I¶ì5ª¢ßÃ(u·ƒÄ˜(lª™,1œN˜ÈEÁt(í)ÆvlrO:·¾vs)bÛû\'cëgN#ép<‘Mb@¼Ä\'zfÂ!J}aéö÷ùi xóø˜Õİ)¶uG |Õ™\')j p2Æ<h¢‰9¤Fi²›R|^\ZsãtnãWj¦üµ+\\Nùrp]8ZıªÒ•[>|+ö@z³gä±u\'2H4Ot‚skK¹$×Q°SŞÆQ%ìt~†\nc×Øšº‘`†D7z¸çh‰òÅt”]½~%iäoÒ‚¾öçÊóÕŞ¢JÔv€€	nÓµì$Ö#vù=bbµ5®?5\0ÛdPã`\"Á%\"T{ÿ=•*~]ãòp—*|\0{˜Ï:6vDŸè;‰ÔÍ³›¢Vy&,ŸŸ[‹è³ÄÎFrŸUsAºƒHâ\\œ¥zzf:´g×’eÛÌQû–ä!Áj—G¸Ï¸>8x«Ô¦GáÄv*¸6v»­·9ÅmKœ¢Aõ,Ø\r«Ÿk+5C	u] êâ%¡Ê‚ÀK›áæ\"¸´”¬,mü.oÈÑÃËàÂ´£`ˆRN\"µ r“JLóı‹Ûà¨ò_èbdmĞ6ez-™¾r¨‚°RÄª…P—Yÿ”îLHñ];8s‚eJ^#H\\íN¬è•ãö÷ë\réÕ½s»úPáSÜ%ŠaÇlY¿‘¿¨3@Ş:·±.Í–OD‚G­|Äû\0Šm’)Ú%‰Zº³Me”CßÓ™F\Zm÷î®®G§Yß=¸4ÅOOm.Æ´ÔÁ‘)aè™„‚ææFÂë\nùı±KvéÄ°ï3\'ï‘„?1^\Z²”BÌ€Ø™`|\\¶]\Z‚îÊŸšfhóÓúe”6³i=0x\"}\\ÕH/\nÎiî~xkª•H?ÚÖä&1í,\'ww{µÂ‰şIı€ö×Ÿn/h#İ%¸ $q«±m¡›;‡—<7ãÒŞ+nÌ›¨œ1äûLU¥ù‰¶ëzÙîîıã|yÅ¯^ö1b¦©»½\Z¡_ìñhZ\ZïØŞ*îøm/ûè÷{øŞşçşÛOıÛm1ü¯ÿƒF¦™õgtÜ}{üöämûmçDÌè|^ë –ôŸoWŸŞÁ`8;†öšä\0i9´.°fhş#ûe>¿Ü,Ü÷\nÅ—:;m+óÉ=7SÊ;”×ãéfR¾|¾\"oå^ÖéXôH*ã…)¡˜ÓAùì/8òò\\Ò(b-Yè£åèººÚ\\ñâÙ|Tî‹|5_®ƒçÎ³\n±Ë&ÂÓÑ•Ò„È‡˜Š!é0Šd“$Ó\"iáM5)¼};Á“Ë÷r\'¹©%¤N\\ˆ1ÓÉ±‚$`¥ãÔkÌë°¸šÀ°I&Ô$:bhqîú\\ç‘8÷u,Òu™ÄV?/,mNSÜÀºˆFÆD°r«àú¸šœ(m“h7\0ÑÎOÁAĞÆÌÈl˜—\nSñÆã4jlÂêc&¯CUlMÜ«&¨†àÆ<şÁTeáï*ı£¼Bç¡*™?ÊÑrƒâAÑ¾T›å{„âLhznt(ç=Îf.Fï)’ßİ­·¶ÿ6ËáW5á¿ĞöÛŒÄäo3éÑÛLÔ©ÜÈy´\'ú›`­pÊ[óQÑi6äï.ww˜À^ŸtüïŞ‡ƒwï¬½¦Û»wö9€‘Òüôaö3÷ú¦½>~÷îÄIÊ¸Ì1%ıH\"Ÿp¹ËÄ}4ËT‚KŒÒÊ˜¹à€ÑU“è^“Dø–“›ZStòæ•G@¡ œ°@.Õ ˜“Ô´u$G\'Ÿ«²œéo¢Ï€ôB ’×¿t»ímš}Yì²Q²3éM­³ä­{HİÛŞ¤*ïæã½ŠV6ºĞÛºñÍº¦îHNÅóqp°.dã\'oUu»ùQgàm˜±À1•*ÆU!İm1ĞM§ß«Œ-”Ì–ÀÛ\nœÙíCg]¬ÂtJ\"I²Mk e‘\0Uå×qPDI\ZqÚ¡Eö´8¬VÛ?Ópÿx´©&ÅñŸZ&k‘é^*KìµkãJBÚê8\Z¶ÁuÓ^;™Œa÷8„29ó¬Ö«šî—©É4$Œ·±öR÷Ú¹p	“€@™N\\ºW@fP¾iÖ\nÈ®Å²biO®îä’7^—âçÅŠò\\T;)3û\'²\nÉ”C#\ZVë\\L[¨yu\nD&Î*­H\Zv eÇÂ=§ôÊ„KÑ* jÔØ£Ñr„t&Üúâmc¸)6Dîî6,–ÓŒ÷Å{ÉxÏê+‘5ç´|FĞË6•G¿#´±iØCÑ¤óa“,/‰v4Èn9Š„\0¦%„\'¥1G´Ú¡µÆ^{N¶¡©||ä1aÄOhÑB3Måõùìhe„èæf:ÁÒrè1óè‘D=ƒ¢ÍÈbdç:Şjì|»öÈï»//¡‹——OfğvŒ]ôyÔâ8¤›¡Ú%êg†.·ğÜõbïYÆ(ÿÇ6¾ÃİŠfXí9.GsA2Ïé¡f3ñ_ôEFBËrÊ_Õ$5u¤ú–”4ÕW*²Ï»/©-Cs‡ëH0«\\OÑ¨&Z{S5š+fØzé0ŸX[rqòèíêÑ¹x”‰YÖ€ë¥øÕ\\yQN;><qì¨OA¶T¾Ng•Ç\'ÛàŸaRç£IéoÂÀZ`Ô”ú¹ÉiM‚ÍEûbšîdûí¯DeE»N×@ôğô¯_“¸üø—m¡ë£‰ê[VÎ±E^Tæ`æy/ä5Yú•ºT%•ïuh‰ûá|F¨/Jñ¢Ûıë‹7Y 3ÎÅjï÷õ‡WÉù0jÉß(¤ŒøJÕrÃvºõÉ\nvœ`æÖ=c WM+æûê§‹Ò¿;pí§Ùóòj4ûŸA5˜Â­ê9…TÈ2V\0„:ßÄM?/éb÷ø‹|´¹®¦Õ’pYn­ù\\€£‚•ô­m4¢,N–Fç°ªNãÈƒA%™3b4B?Oa¯ ÍKÔ‰Ä²šZµˆ¢UŸUÅ\"u»¢xJœµât+q˜ÚÕ{ÀvwAµõy?½ùøº4›Ål¨Hh#A¶ì¿<šGáÕÂ¹’)·Pİ<\'Øü<¸•r´Ù[nZ7¶ëå¬Ö6y_„Q½ñ½_	>¦ÔFíÛl¤6lÁ{GúÚ\";ğ·ï»QôÔÈÊ%¦X4x¿Ê€¹gÄû‰3F;‰Ùö!;#µ-˜|İ¿»7O¢	k°Lñ¾8ªfÌÌY¡¾K,‚¯PÛ•¤—¡˜wZá2Ñæ©Ï$\Z‡HP—ó«RPô1[”Pã¯®iÕ õº°äûU“F‚X/«sùéØ6ı¦é X…ôseÓ©pXÌbÌù>\\•ÇZ¸\"V­¶¦[Ó[5&ŒÏe¤íN³ÒF0f´×å*]y0Q¥›†PÚr\'\rDÑ	QŸ\"E¬ÿêêõ×½ÖŸWekÅƒ¢bŠ†“â•¦5¢\0¤Nmíá:Ş’#dò<S&vÙ\rUßy¼Ò¡.	…—7ú6‰¸`c7Ñ¾#9ëÍ›f¨Jx³õovKŠ#Õ´H”g£U—‘9Ë÷œªÏ7ŠŞíu©-¦Ş¦G\n+©òÎ™¹9­ÄÓM5f¨nÏR\ZQî¡½µ²_ˆ„\"b\r\rß×—¨ë\n¡rb2ú¶_…ß!A	\'ˆº˜»¹©!ˆJ¿1GXÀ–,j„uN*jª`O*Qo¢ÂnÉê-EoïÆX€ß2\'h–W‚N4Ù¬ÓCw~¢U§/¼ü0O\ZI¨Â!PÈ®—…KªÊ¶#ÚØV-7çk¸‰=ªÉ Ü¬}Š/²şÔrƒ8ĞÅx³\\Í—Ùª«¢5‰ÿpA«ÑÉÚ”Õ3 \"QDTjàÉ‡Ur¶ïç[FlE cAfy\'Íø¿ùº²¦_qï´\0=+r}{8 O­X~¸ğÚöeNşO:\rAbiÚãšéş-k›e§óõE¶İ\Z=yÔÁ3Z 4iæÄ\n]MÖ{]@zİ½ä=Ošv‰š2¢Mè‹…\Zm›åß?Y[/½z&@İl8ráÌ·(…-Ë©0y=©€9ó‹ùf:ùN/a¡~š=c¥5·M}gU“%N§Åi×Ö¤¾\'ëã¥¶ô°)“ú\Zúˆ½o\Z‚˜æ¶X´ÜM3Òoãku“ªQm¾|¹vé­Ò›üö½£¢ëièè^™PıŠˆg]ûMUIi×	®Ö	4 àÊhVúQ\'5ôÒCe?\0é°%]Ï·Îm¹³È!©Zà©e\"\'$/ğË4v~§`¦”ûQ¬ãp3P+«-\ZïF¬±(g[©\Z¿Ãß˜á‡è)†8}Oªúº…©ÇUB\"m¢VÙ“(< »R	NYùÕ»aSı¼>(î¾Vl[!gÚ? ¿®Ò¾¤c`ò’xã_)İúéÍØô<;–Âï@>ÍŠá@å¬sÍFì:û#æ—a¹¼CJË£X¾Oå¶Ï/Ïhår06V.É•7Ğ­Ä—e:äjšë| Õ§)~pg\r;æ¬<‹]ï†/r™‰­s£«\rjd*Çxú\"×ÏæggYn&iëšo^_ÇÑQ/¸ñî#PiÂ±c†âğ9ÇÙ*–?8 \0[a)iNühÇ\0¯-½0¾Û<Ã8“?j|_~\rà%.üæ­×ËUÑ—d…-_ÜAĞhËïzÁ¥FzK°u$(”jxP÷÷K]XÑ\ró Bç6@”İv˜»tRÆaÅ<\0æ´v‚«^SŞg­‘7,»ˆ¥ş¬?o9Ò¦mOÎìiG&v©ê°Ça’üy0\0Ôôèkÿ2úğÂóeÜ¯—¨”~w‡¸bînÿæ·ß`+*é5G\"¢¢N\nÖ¼Ä¼[j÷§NO\\®X ¿l”h­º:iz‘ø^­pà¦fJBf!	*Bz…NŸ©´²ùå£_¥TÛ9IÚúFnô}E£\"§Z;Îá¢ˆ*tnçf ´“ù0ûNN…êZy“¢åŸÄKÊÿTT¥Çq¥»¨HÈi3C=\r~e£tDù\r;+Ê¹mp‰ÈtF)yN\'qÕf@^¾çHCfÍ¿Ÿ/¹uèSVÊÀŞfã*1a ¡lŒ´G(\'^.Èà\ZÅQSÖÓ\0EBG’á«²Vg?\n¸&öc5ÖÃ\Z€ÊI¸•s\\”ã¢bt‰¶‚cÆåuUš\Z9*óÿOhBïÎ)*_ùs\'\nˆpÙ»¬œ›Dë­Í ğÀ¹I7÷¯F¤s…bgÉøäs+ZOıf<pÑ ¶äuQõ\\\Zîúò˜Ç–ò1Y?ı+V±†ê’	õˆ§cP\n9K(D¬d®BœÚhôíØqF»ËËH|gE‘4 c=©F5ßU«õ¥Şláù‹o¿şó÷oú/gg(½¹Éşóëï^¿ùúÍ‹şgùw_¿şîÙw_ÿø¯/úóŸúşû—?şkÿ]‚Àµ/xÅÀ(’rU\"í¨VWü-y‘æ×\\ØCW¥‡(J¢jx°¾rq!4WÔéc¼óÖ|6½iI\Z|Œ9\0cš¼ß»>î9ÉÑ\n2+ì•O\n<-L7KûûŞ ^Ã|–Àÿî‚P¯]ó¾¹ˆAØS7Ÿ¶0ºûÎqŠöàb°7ñ”¿-àVÔ%\'GvXv\"/~^§Ç\0è|†/\'Œ•ıj>`¨J²³êƒºû€¹e\\Ğè&PºvĞüñ!Ë3È»¤ânsT“½£©(ï_¤ÜN.]RèÜ¢X«ü¼åï|õ¡2ƒN{î7ê\'GùÈ.†[6mQ$qİŞe‚ÛŞp—bCN‚=AI.L‰¯	èäX1®lîímóĞ	+ö Hå?0ÁìØùbvkTÔQbìS{EAÃnòÅÚ…Q»6Í\nûÇãmËñÇ,Ni§PÖ3Xª`Iñ>57‹Ê IØ…ä>ÿê%Qã¸ÿ‘U¹åé{Ğ¼Ù€×+ò*!-dqäîPbP2Û›àèº§»Øœ	#tÜÖvm¹uÒcäüØV­İıÑyèHÖ@¼Á¯Ë¢]îïGò İ¯İKÔlowÆ}[¦vVÕ·ƒDbá–öÂ–ˆİÆ)´Y‘\'¿ÓìU\"’,v?8€o)Š]Í¤¶fŸş%¢-b¼\"††qÈ()|¬9ÜXŒÈ1!ˆ¤Şá:0JÿÈ\\g8 OX\rÿîïã¿\Z´ì«e{>¢ïÿÙãø‹îäÎ\\BTAoo”“ühj®ı<6œ\\œw”?¦êÿgGıÏË!9£»:inÒğRá×ß7%\\(QÉÛkpQšqSˆ~|²£€EäîÀNrIŠt¼¾È9×ßáÄñrĞ\"Ÿ¯.+´b‘ö£\\uyªşææßÊ›HpŸvúÄ\r§]>QÙ2\0h’.Eı\rÀ•Šg¾îÖƒqS¼smşD’6DYÎZÂ~~¹Juµ¹ÂRRì\0ñKJJnqtxx($L“%.ÖäÚÇ–û±¼v³×–‚´Õ°”ªX*êü;˜…‰½ñÄªİä\Zíçj^Á	‰R*L˜á×Z[Fyàé9@AÑ¨Bğ›±‘ÛévC°ÜÙ]P£y4we™P–¢\n°&¡ï§Ğ—zÊ#t#®Ò™º¬æK¸ò	¬ıYòX £%Ÿb:·ÔMssŠÌ&{é[çˆÉLİwãåL¢ ¯Ø)|¹ì¹:tzÅ‰Öƒ<?‡û“&.›&iØÉİD­šíWŞI}o8ƒ¥zùf1RÇ7\"æçdjú¸‡äN$î™¡Œ±šø	zn;Ğj2HRH ´zOk,Fè„KÅƒìÊœ–£÷ªvËùlİ=­ª±Uâ²ú¾gÕ¹Ê²«)]Ú~†Ctj^qÉºHŠÈI9ä\0nág²»4²¬¨ê:=‹U±øò\ZÙ.<W°]\\09CıÛÂ•ê?†Õ£Ò’ğ\rRG»CmjÚDÛ¤¸CÃï˜!»_´x‚Ÿ$èmèòK“ÌÊbÃ8[\'Å(6ÁIÇårÂrİnüëØ¸+;Qße&<•ÊÌã Zµ8@·dª-Ñ…oLÊ¯]¬ª“†¹;‰U$_İãçŸ\"”.¦›„ÍÂd«·¿Ot”Ò!5<;í¼ÚFjİ3á+c_Î<·9ƒj\Zv#jŒêc#gÒl¨÷kÅcSC|ô²+mğ˜§ˆÖmEHTBÍXìôƒC\'<hr0nbÊÑ5ÍI±Átå«;Ÿu;êÓÀÛ—j>ìCÎÉ\'z`zO²M³oÃ_åñE4õ­ÛşÁ™Ÿ›Ÿ¥WÕ=L7a‚ÓB>¶´ºøM\'ê™Ä×»ñ> ÷”ııÆ\'ôN°¸æñçêá”½ï#ü€¿KuÌ%¢x`lç¡‰şG†ÆWşqİ6h„[–•ûHÕ\'\nFÙ¸#ˆËUwÑtcÏFİğıO¥ş…¶ñ—jØ§\\Õ®#Œç)I¢€^9ºê±ªY¯Ü“\n?ñ´©ÒK‘¸/¿FU\Z™ADg´­õäèjË6ú*NG³Kd]iz€áš§Émm±›vØ†{Ã˜¦nES,°$FË˜Z>SÒ.Ÿ<ÇFˆè_ÀOEU!,…L®£s&¬–Ôñ·°ƒOç£åäõÅ|¹oÖ?Œf£óûîğ+)LÖ0\r”I¬\"šC\'h™Î=Äm\',Ò`³¸§úfAŞ¨šnCÏÊıÛiy¶îåËêüÿnèß5¶÷\\R\Zf8ºµÜ[J¯1\rÃ{Í½ĞÂ0—n=­Û/Hƒ§2£É$†itDkxÁ´f%’­ñ¼bY-°NMébyÖ×Bx;õ€ƒ†•¸©[Z¥¨°¯\0’O|óM%MÛ­ŸR¬Šx\"ÑMğ2W$ù2åáäåzeİ˜}~¾,ÏÏæ(’Àüad]#õ51\\ÌWB•À‡œëjúg)ƒ~šmŞÍAÔƒŞM÷K²Ê Õüiv:gCòr2œY‹K´%…¾€³CÜW\r`.EX£Dş]28TáÚ,‚¯»;ü—æbÎºx÷µúˆ‰] J`!ıé~w?wq7—4±a#áŒp¥Eï:‡nøóUìš>¬Â…ş”ÿ©£êÕK·~çNåò[ÔĞ‚‹ 5NZJ7²\0Å’dÚfIê”Ø–w±.ı6[\"ÙŠ\n=E=¸îµ(Ã²SÍvP¢£šÀ¾á¢Z‹ÏU÷ı1ê›÷ñÌ‘+YsÕUÛ\r¶8¤ˆŸÅ±3÷\\‘åPfbæ»H!\'ÙIıÄğs†İª`lE4aŒºîÔŒ¨Oè5;¾*\Z(\\Í“VïŞ	Ó‰‰èEKäÍ5X>˜)ëõ9¶ÉµlUpy`üJ÷f>Ÿ®«tMlp„u\"ğF§]Ø´Y|DG¼7îCPUH~í:twÇOM½3¸¡>»-Ÿ!¥‰Ç’AĞ“í›Æòj5T&Æ±Õä=£àG\nQì7A%õUÃ\0é°C„”Äç-N\">Êt>±,^Î4G‰ëjæätÀ|ı7ÊÕ¸œ‚äa’=¯-”ºÔUXËˆ+ãÀu<öà\n\r²–±âeŞ†b¿%û+¯K7£Óe5FZ]w¼ºk¨êÌ6ˆ½Ê å-…ÒR(­‹rºhâ@Ê–¤k-`½lĞÀu¶³¯2šÌ@§ÒØ{Ò°K\'\\\rÄjØ¡+?U)QH6Iàx\r¡\'¯^ÿôcmª³ZõÎvàG)‰ò´ôpˆşåe.aäá06ÁJÛfAÃ©ƒÕpB`¶§˜À§“4±‚sz|ñò9³¥Eö¯ÕûÒO6¹è®\0ç˜‹¶Nç×»føÑ®Öh‡ˆ¶K­şå´>å“Ï»Ú8jˆ\'–{İñjyÖ€f‚*b\"íK¢—¬ !‚nGÎ[²GÓùy5{$¥e.nØ‚h×6Å9\"eúÀ…»£‘;YŒ‰FÎ!xd<Ôää…Áaµhín[çïÅêÚ±c,øÃO¿<üô‹/øu€gÀİW\\Í²š&òûj$\n=¡\\:¬Q<ás¢…}ì‹¥óø+í)¹G©¨ÕïÊÑÄ½­ô.è+fû¾:Ğ1NÈá‰h’WÃÓÍê†ã„æÛ.ÒÁ‰“õµüPcßÁ-vÌŒöıPùèV\r¶ĞOí¡»‰7ê»cÛEt³÷9ù†„ÿöH	ŒXzqRğ¡š¬/Š–şÿÉR~T:áÙvºÖuò/Há”îID‰\\W€kÏ·Üx%Ã‡& •]Áîh²|e¢QØäûàÂ1{N’­zÁ—B™Æõxøè´ÓH€CÃ¼ƒqÛ»)Éi)Ö…´ív×l¶a6?mcÑG¤Ó9È`v·æÉÍ¸£bG¼©–a 	ƒaŒK[îŸäÏÛ½ÑÊ£¢€Ã6;³Èß6àÙËÎ7?UFİe-€ßª·„öÔÙn÷Wu»#}İÅ–|@·5]às.æËÚsËEu~1E¡Y9ñG‚Kl£\"¡+à.°F4j²óŒÛèòåË›«,o,>\rµlvÑMRØrZ†Ùï3wàï\\=rz­¿ºbµã†>)ÏĞ;«™\0C\\2YÏ»:0À!ƒU-ú(22šÔõ¡*¬åªƒm­7Æ	ûNıBv²ëÂpt>ªf–\ZbJ4‹\0>Isæ«š<CÒ³Àæ^!TAÖ®¾\"FG|f.ããñK÷”AœC(’ ×l|ÍÎÀ.ÊÎívÕâ>¨ÆEáÔYæ­št¼•2¾ZıüİŸ_şí9ÜoğîõC9Û¤ïVV°ÇIİÏ‘ÏİáTH¯İT AÚnÂ7ÍnvÁ€s¤úï²\0GÿV‰gÅÅ¦ºîMdvzÌU5@¤óÿĞûCw™\ZıĞÑ‘%2tÀÛœœˆ½Y>?;lı[ÿP~ıGÿĞŠägŞÓœ×õ(·@Ó{„,\\x{sâÅĞ§)‹¾ªY};bIL;¹<:p“u«TêKäÓB•…hÂiÕ¬Ôò¨X?‚˜päâ3ì­YüÌÒØ#†ic‰Èåˆ™Š4l\\!¾54¦®©{E;(dÉ“°D9€Œ€Q\0¾…ÿñFª.å³´wÒáµxè©ÃW˜K)Ö\n;7²&ñMMhJ³#–}Æ\"W¶Pg>y­®QpDwwî3|aX6n«,£Ù°KÔÌÑš…³Æ–ÅIA/ù&Ê\'Sœ{}s‚–AmSÄÈÇZ­Ùà2qp„É3¾¹´œ¨\0mP;kYºåõb„O(¡†â¢=1­f—áí×w­¿iÄTèøğÄQ\0>Z\\2IOãpÌ©7ø¯``Pü€RyRFŒæ÷!¶XSø`İ¨åyÍ ßîÈÃ\\D¯™‚&_#1w.!˜¦÷1\0>MÜs´Ó½ê]?§ŞÔ­‚–=Ì\'½çê@Sµ™Ÿø”hwò0å?Ğ$æ}YĞSâİÒ59÷^Aa\n#Bª;0À$;?mIr,_SwĞÛ_ªòÃ=\nµëòjÅVFçå$ôç#L×KÈ0¾!à+€ÃOÄ”<ĞiäC/ XÀg%bä4Ÿş8u:^ªv‘Çè¾ÇIØš½¡GÃfêN†ğ$ şm×ÜÊ¼&¹ˆ™÷Q[ÁÄ÷³]6‡¡×[t,{ZNõ#Ytè‹\"œÃüçÊ»™5Á\rœ2¨â«R‹Ó[i 2nYòÔ|âTv½ŞŒkE&—½&Ig“.Ç ³ßó¸µ§4\r.(~ôï?ĞAªŸå¹Ş×nv^…¤8õ\nù.ôÇ?Ğ‘å®•z—ı}‚„ ‚Š(\"õq‰yŠhšb}Wñ†_œ>×-ùû1 qu\rÏgÀïÿùdøcjDöiÒGø]à?îİGûè†u/…á S£ÒPàaç:\'	b3­˜Øxö?Esò°»¡—ë; ¥	ww’•\ZÛ1q],ËcjÆS,“1wÑ=#5ßQv\">=ZYg;$0 0<$‘H€!5]øúGhO‘LAÿó k/Ë›,@”ø_4~ŞÖ™Ğ Ãúm¸[Ãm±Ğ&,É¢`e85•¯ñá*i[)]ô+¥äzçJ5¯–‚Š´%üî ­!ü¡w»œ\nf¿ÏˆïàM…íõüİsúú\nøØ>¯g¼ÊP„±Ö%vqı‘2\r·l:-Ú{ı¾Ù´d¸lššZ6Í»÷z—&”¬\0!üÀâb]ı·yQ“>{¸G“òZ#¼áO”ÈKÑĞRş›ÃØö\'Ù=È>éô[uJÇÖ‡Ñª5›¯“v2€×1B÷ÁE1\r˜:Ö§åe0óÅMMüßVEövóøğğR¡åàõÀb,HL=şˆ³Ê;‰tzU‹Oı³ÔG€OØ,h=×Cš\\Ñ\"‘fƒP¹p…Ke	¥¡õ]ß}ëQeõ[Ì÷xb9àGœ’ıtÖ†	êE÷(RÖc\'Dbí\0W?ï†Õ8®RöV}à¦U{*¥âáK)Šs)™ãp™¶Ér¡ûûUµW‡PÜ+îø@)PõàˆcdQ¥<Sz×Ë¥(ÇÔ´ÄèLœVzC§ø5Yğ‰Î´òWú£éË:‰ƒàËÉŞÏLq\r^~j:Ö¢Oc]*YÎ|:‡m˜‡‚\rÒ‡_aÔ8–ºóYÑôI¡@Æ©Ç¤ÁJGi•û+“[ëYŸş¾¿¯åï_c€B~BJ€‚!¶>ùñ“ĞÙ%Zú·>yåhµÆß¯á÷j¾¡Œì Ãà«ŸüÒ> mhikµYàó2Sõóç4a«™qœY{{$7f4ğ.Ì¶ùñıe¡”Îaş\0Èòµíœtj<Æ®z>Á6÷c‘—U~Æ¼\Z]“”© õ=È×DÑd1ÕÑ7/¨Ü\0¨Œ^d]T(8ÄÊ÷½êê;ƒD:u5Z®İ+#aœ(ÎÎW*Z˜©.[\\Ë£j\\=‰¡aPB>_•Í=İy’jõÓì5A ßPË\0ó€µü ^^a(ròÓ²‚¹ Ê—|Dã[.‡¢*~àáMãÜÍId¹g>\"uòüò&Ÿ9«gú¥œêó:üMoëiAî$^¢3—Şu·İÁ¿“ŞuçÑãN~t‡“-pÓõn(Ù8}C9€ú©ºü¦‹B,n ¼şè¾@37_ÄpşZƒƒP¾ø˜ş8\nØwšã•\'÷fÖÑ¢s¸òxiŠ>…0¢uCÉÑõğº@÷Ûï{×.åRn åF.sK +ã1\Z~F‰Š^+í?¤ñŒ~\"Uİ!­Êœ^HöquÂšjøÕ»~İ¹»“¯øºq_×O©Ã>—¾½_\nQŸ‰üh6l¿ÿ˜Ë›\'Ğ°óğò:ó.VÜdC_]õÑÃö­ÃàEqEş*El•­øˆ¨Ö¸ÁQjx»“ÆHÎp£à™pÍÏñ<‘u0Û™ÍYPè¾ÚTä„^z”şF¤µÙİ)ßùì!å»Ù“dõ \Z?yø»_x¹3/ <1ö-àäÄ¼Õ´2Ã³“àTÇZ¨ç”£áP¥n÷aù*¸?%¯Aôb#ÄxFü{ƒfóLJY¦¤İ§ájq”É}‰Ÿ^®ŞÌ7ãá×›lì}™Á¶İèXöˆ^…qiP£Ù¢\ZÁİİÑãCş¤Õ¿»ƒmÂßP26şÅ%‘T	5°î•g‚Ø\\.02åb±ˆŸcØû»{çëffÇ‰sù	!Ÿ/1v…¹Û:9™Ø½P1ô[ĞPÙ‚ş%gˆäPC÷a½¬]©dx=¼äêä²ˆ[èÍY™û8ü”j\'¤°ıÓB»|y’_ûwY81·ŞµEëo\nA‚ı¸»ã(»Æ¹Ø¸üà¼Š —7åÕb\ZøPşör³È­óZ\nÑ´}\'%H÷Ö¹ËëEÅºëïŸ[ Õƒ˜Ùğe>\"XEÆÂ¢D&¼ŞùşG¸Mag)D³´:3”„uÀšıšI•“ğ½®°äîB½(¦™öSûLxdÕ›¬¢]LØS2œzcÜ[Œ2Ó”Ì¬n])¯ßDuô£sëa«y@C|]§C¿«”fGİ(tXÙ×Ã›”\r°®bH_\"÷‹¸ò\r;ƒVŞWåÀïd× î¨WqU4ÛT\\kª÷míê«ş)GqŠgÀEsHÎfü¡;a„5ãLÛwT\ZÕª®Q‡Ù|K2îlHH),,‘Š«†P‰‚e˜HˆÊ‡àÏÏ$°j¡–‚ÈÉ*ÂM‰++±-$°ˆrk”dÖÄ;\'—à[}°pó.ôd:_rDFoZ\" “âdÀ)ÇãGz#İaN§ùÀ™\Z@Mfèâd·ã-Ş¡hK3ñÃf2HÍ¥/›M\ZÇô*GMxäòI†/K\\`°¥vğ8²e~&\Zb=@°|À?ÉP‡RŒ£CE”G{ÄñjNğLöÆ>60Ôm€h6ˆT¢0Í„¤‹7½ :»‚\nØ*i\'¨bCî…ålMì6ªíıò×\nÚêæåŞÖv‘deŞ,3šÌ”iÂ­\'YßıÜ*Ÿè¡šL|‹õô0>—$~4rQùøjú«^Të•Zv û$H(Wbçµ9‰£”£Nl;‰Ï_f§ÛİJ–Øò–LğÍÇÉÍ¹ Zã¢·ÃÎmĞÿcªPMD•ŸïQš³v¿VÀv.±™ıı °3iÒ|â«Î’Méˆ..`DÑˆ..ìˆ¾ú	=ÌeX\'\Z…£(|Ú}£ÜÒ”ãÊ{\n½ÉßSƒ¾Ã¬²Wø„÷˜àäQúWGıîÓ×\rë„îmX§‰Y¶÷’ø^¡-.¸W¼¥)—¤ Ds\roñ…£“~†‰a_yÒ_lÒÍ/’nèMğÍ½\n’àTÂÎl/ñ\0ÛYˆú®OuWšozÉÈlE{Œ¶ sk5nyÑöhŞN…á$³ß¹u€\'ô}€^–%ÇõëÚ·®•ºùÈ&5Äº¼Pq®qy+ù0%Í“ñÛ[•ÓÉJäGÔBÁIÇÿr2ğ‰ÃME§ŠôÁ%6¾4˜[•ÍD#zb¸méO\'^‚ÛñG°´Ñ|\nSÎœÄ:Ã“ƒ1<—>|~rw\'?Or7¾“vıX––óZ:ìğ ¾%í6ßaúÉH¾¶³YVZğè$¯&úñøÄ{ê”¤Ï|î$Mş#T»\ZS8yIúò„ÔCúÄEp¿ûü‡~J±/Nò@\\»„#œ)äF\\ôÉqo.ú¶™Ußø”ÏpŒ¤›óÓìÏO¶^S×:Ö˜\nc²&M¬èîµvZV)§•`Æ6¡üù¼|_ËàõsBI\Zó9àC`/æÕlİÿã—¢8Àqº÷×‰¯g¡¨ŒIY± \nœ¹,Ç£éx35›²SÂ-ÔSDG3åíhG½§$z…Š©£<Isâş~ğÙ½USzI¤İdkBã½ëâ‡Ñú¢wUî]çA¶\Zác³E6)W—ëù\"£‹NïúI‘F´lç\nœ“ÉÁ>ÿÓ¡Ï]\\ j)eJ’\0ä/hÏ¤?e¼h&¸”¢Pù.7–»–¤õNJ_İ×’˜j’rO=)SQ“v×t5öâ\Z	/Î•f+4™EzµzÎ šÈ‚W<ß¬\"@^®0•D¸®+¼8çhNÙ@§@<x§¶—áÆ´|B€­S´[d]³“išä%¨%\',ôÖóóó)L,®RÍ0OÂu”d)1+¢ï»;\0ÄK“]RZî¾F1¸úuöfs\'rMv+¬¶¥åqÕÎ`Íq-Š=ù\Za¯{’½°$®»ìäT\0¥±k±mrÃË:vîÿ6\n¯YwÎ¯»£õz4¾ U“ZÔû9A5ëÎõÚ8wUç’èzWÄ¹z¹59;d»n…±ì÷Øö7óë¸ÚMN5¸ÄMÛö(5ä¸:jrK.ÊÕÄİnQ¾½lÈà]“\\l¯ÔÁ1[!ƒF@éÅšUw±Å/1‰q¡ackœ¯\"?ô ïÔºFqd™İSG<äÑj=”>ğmC‡Œ5ÇNqeÑì‚ÇFÃÒÛ…¾¹bbQ˜Óè1zˆo1—î~„qœt“ÜĞ\n\\1,OÆZ¬äİyˆ{j³Ò4ä^‡å´Ä5Æ4|4í#³Å!–Í…o•ŞI®b5ko½$®\n…-·(½u5º!ÎÓ.8èıßîß—­ùYk4^oFÓ–ßˆè®Æöµébàkt±<ÜlY]—&(ÛÈ¨Yº\Z†3s<ëY5Îõ~¤R\\n îP_‡Ã[Í `ôP GIšF” J.\nt*ç«sÏ°J–XßjùÜÎeÇß\n_Šˆ4ãÚ5E³õ¤ûÙï³m¬şì\0…:Ğ”¬¤ë¾î9B—Ê3²³µš‘\"±K¼§¿bõÜØ_…“VÙ¦\\»¯W/Ê¥ §Nt¼v~z \n\\tH1Ùw0Pc—zÏHØ889êÅ½#qĞ}P«Íê5\\ÔBó‡dÇ¹pw}Ø™ñöÏ”\\e¸á³vË’õ²K.:ÁúÀöœ3ç­íìwo~øşş]ÆeQà‡˜ÛöOîC^ßZŠ/ÔÅ£ìåPó‡Ñê’•Á™Œ–—İ+HÊĞ™gzl¤	R]Ûé@53`:v¨pjß¨3 0½9Á(BÎ9\Z,”Ë=å›ÜW‘“‚¶Z9EŒÿ‘©à(âÿ­¼y]W¾Çu/T;ÿ-yŞÃ7±À‘MÆp{Î÷DnG»Ö¾V	H¡Õ5c^Gâl÷£ œ;ÑŠ¾£1†DÅ’^¢¬Õ‡[›`ÍkbyÌP¿)@/ÂuÑ}ù5›Fp+äË=OîùñmÀKGÃo—Ó\\¹êizñ°å´7f¾;­´ã¢fLªœaYú‡8Iî‰;Ò,Dl¥]_:§v%>öR,·…i¶H}šÌ-,Ó!5ˆ„t‹õ\Z&Äñƒ¬L\0k‘¶¶^ñ*™«ÌYúq¢Ä³Q÷¼-!±»ZT3<?:ì–‹4 èÒ\ny/:!£J¢<?_ŒÆø\Zv8 »n nAwô°‰Ş/³Ğ<<‚ÖQÇßş­–E/£›%« qˆ ¢Ù·Òxÿø0?ìıédÛñB0˜8R	ŒÃ0Õf»Û5UêsnïZ¯ã™ÔH~6|½¸\0´mğÚŠ‘×ñ±ÏyêL…é‘Ÿ{´#‘œ?î·ªUkÔZÁÙ4-×ó‡PeMK¼ÌàQ$æÏ¶Å\"øÒ@õéØGõ¶õFk)Ä2×ùí™T)Êµƒ@[ø2 æïóñe¹ÖÛ¼¦Qm17\rtä{ò—è>Î¾)N”œœU7EE\ZD­î/å¸„kÚ7K \\pÖ¬“õ—\\(\0¡ÜƒOÁ ¶íDíÓò¼šuÔ‰0à¦€cáª°]{ºb„?÷/±ïï©™Ğ[6’e–Z§%k{öéa“«ÿúÎÑ¾yhŸ6³¸Wõşœ+ò6O.e“/®L\Z»vw\ZQÖºó›Ï(¡k\"Zíç™·<}M	m·ÇU±š\"ñü	Èn¬/gÍvñı·^ë‡rµº½£â—HÔ\rü\'jª«° úURÇ\\ñÈİ´*Uò±¼Z:÷KZ2\n9ÀjhKJ©N”i¯wÆAÁaúà^ÉÌ\ZÆ‘„Ó“<¾Èw3ëPöÃ°\\’:µ*ğ¸Y!pF…—sÑ9ù”@;ËGÉéG±Ñ¨úñ)¢UÈk´½\"Ô·2ù¦Íôš¨sùì„—…†Uïÿ¶Û4Ñ ¯˜Å|›np…š²ı,nÇÎÒÖ\rÉù92·4ÿÏòºCÎGî×£¶–.B)Í…­ŒNvBšüØ¡LH®Øó«š¿qOA¶¡yë*ç£ã™ZOØÃØy*ˆ¼­5G0ıq¾®Î*vŠ±•é¡@´Ö=gRp=N-RX›÷Õª¢¨³â®ˆèhS³\'Âìö0 &|ó³â/€G7ZÇ…>®«µÆ\ZâUR~’HÍx(b>*r÷fgÊŒ¦‹Púªë)Ÿ,³ËN”æ`nh—F$îq© )ë+«mvïş>š$2_ÌX+²£^$ì„¨õˆò o+Ë¹H“”“®Nß;ùÈi¾„ºà-œ¢ıÑ\'ª/ÃÒÏzâIÂKü%Óx²Q‡^Òõ:Z©gW&ûùœœzåŞÉGÇ:³10iMÏ(N„ev™_5,œ×%K.</)	-v,iØ/Ô¨»8ÊÙ³D³•™„ò¡íMº\'¡_å•Ó‚§İrrğ³ÉÜ¹Ë(VG»‚rê`ŞĞnôşAğSëÓGAÿÖ+~3·í\"6ºs~¤¹ñ«<+Õ*Õ®;”Ç 6¿ÎT}>•ˆù“¡šÂ….i³‰;l­›™À9\rŞú5%’[ÀVÔ„û‰ófå¢¹ÆÇ[É‘İ‹·q½„OzÏõb±ÄvfKS‡¤iÏVÆ’\"JØåEaVò¾§o;‘oeãSï¢Şõ;VxNV3!Í(i&ğ‰«Z‚¢÷€I¸ªV+Äš¢ÈÎ—#bš3³|¿^COMß?>‰=ŸÚÙq,\Zî`:ı Aät†Î*¯@Ég¯ñ|Å	Éö›¯…#²ÍÆ:¹6•oQ³(hÆ~9™—hDèİf\\¶«*?ò¬d}LÑ¼<”Ñ{\\]+#¢Ç>6W”vI†kˆ»%ªëZÄUê†ÍSÍìG<Ûô¦?…jBˆ{0æ‘ı8F’İvø2µ˜½3gWëc‰É5×äÁ|^bhåIÉB}ö J(,_Í6jã*¤eÖ-Ì®Ç¾Z·¬tU­‹/Ä!C©ˆ™ÍëT•Äë/±¡»]6EêÜê^ªs/Q×ó µNBëO®Ÿ]Ş\r\r*^(ˆ² ØÙbÚOœ$AZğõfhtâ¹ÚÓVY¦Ğ•û\\â·e6ş;Lˆ%ìY¸1¬/Ïø#á´äà:E-.’…úåõï«Éf4}”åèëÏÒj¶Àİk!ğœõÎrWtø½åÀAR\rõå§ÚQ¶£ñQ›(¼·qh—„1Î8»ÂÓ7&÷Ò7ŸÉÕVätşâı\0	\rK€ú)}Ù+Ú(Â‰ÎŞİM[úş†¶[3øà·,WØòè§_=’&ÌèzPÇ¢´ô§i,›QÈÛ†gÑÌî‰ÔÜU£Y9í2—+õoEıC»l&Áú`n:–ª°¦› ½\ruzÑÈ	®Ú7Ğç.–ÕÕhyÃäãçï^>§\"tò…øÔ“;O§;NOn1>™/ÉríğÉtíèIXæ uECé:ûû)¢¦šÖè÷N`ö3êùğŠLò±‡ë÷ğ‘3¸×X‹îhZ.5’Mğ²yˆ×‚âĞÉÉ”Â;ÁGŒ\\NèàÚpÑ êór;©FÓùyŸórÔÃì77¹%¨â0µe…:©Rğ‡ò”E7Pmûƒw¡×·ñùb\Z×±Ïmµİ÷÷\r,Æ\nªv™j8…æÓÉĞ»HáÓƒÄ_dˆ¢ëü¡^]!élıÙ«­ğ›‡–×¦âòÁYí\nÙÓšP¡¶~‚\"µôÓä\rD)cª#‚÷AÓÀl·}Tİõ°PãŠl5ßÌ&Y ¼±gj¢ş\ZK¢iøMôÌpO´-ãØu~\Zø¦_çóÂ„œÇ6O{ç–ÿ\Z›Áf+H­Cx¹Ó£ğ°Šµ9cBDÕSÓ:ñLšÅ-zq8_âD’6c?Û,§íì ªsu\0–·$0 ½[™)ò¨´­µÚ²Û\nLb§Î`½D£_Õ¬ã½¯(;ÈZÙ‰Z©¢ù]İ]µóaYS–‘vÙHpë¼WÖ•jÄDRT®¥š±…ìbÌ½õq%|}âÆN:ƒ\\ÁÃPùgÆnO¬¿‡.¢:_®Ã÷„=ñ=&ıØ©¡3l¿ÍŞm®Yÿ(†f±Êúól±œ¿ËúŸålçÜÿ<‡Ñ-æYÿ‹<[İ\\fı/ï÷ğ ûåÿ¥î\0şWZğ³ı½sğáVğ84a?¹»û—ù1ÌO”~Ÿ*MæùL‡¹’Éqr—S¿±‰~ÂhŞ!¨\r)ê‚«âpˆİk£îLÔyT‚	‹ğ‚’Ó¶z(ğI¼ÿ.«EÑnP\nŞFqsÃåŸu:wwí¶éáÓÀ=IXú3 øÎ-£ÅU{°ÛF‰îqd©Åoéé‡Ñuuµ¹âÜg8€ÈõÊ=ş^…Î­òà]=ĞãQPæ>2¾°“#^ÌÉ\ZÄFe6zÙ3/x–¥‹Ô5™w\n¡¦i5¦\rvtØ¬\Z9X¥”¦QLJ—É÷Êÿó•ûùµÌò²‘æ¶1Æ½@´”Ë8Šàô‹.ByôšCj³_„N°›¡”pœSc+X”Eh%¿‰5¥ĞèÕ\Zq@Øq\0‡Kÿ’©9†ÿvSvw²|¸UÙÄŒıY	èÅëñ©†¸®Bb…<î7K\\7ÌÜá›»ñåïğxwà	²ŠÄÎÉ˜&;ŸÎOGSe#]2Š’Rc\'ˆFM¿ä¡Î%ÚúıUNbÑ~ºsu	ÊfCİ]}ó$ĞX\\™czuzÙùÑj°©Õ¢Ó!dÑÕ•‚iXB*Ê¨a x\04†³%Zñq5ôVÉg°ìTÚ;—kZv	ûN¥YßƒA$fÕ}ƒØşg\Z	^2œ›ÿ[ªÔ÷õMœw–Ï6Á­ÁFeÕMF1ï(\\ÛƒÈŒøxøOSx5töâD,µvıõ‡‘”¢ŸÕ¸U\\…ÂĞÇ¿8	B€ŞZ¢M÷]g•Ù¹u^Ôh£ØÁ\"\\ƒ¿c‘ô‰À¨»vT\nzÉO>¦Ó~™ YRUK”Yu4¯N@r²Q÷&´(ª$SÛh/%-ÄlJÒmƒNÇSwYëÁÕGY¢O¯Á5¨ôi«.*µE0Óqë%¡ñ$ôİ–ªÑ •1ï¶2jUk­\"T\\œ cMT‹\'ú¾»óvù,8É4QO²ÓÍ)B	YLÒö” £yÎv§LÎtË~á3Nıèàİ2ïlÛÒ,½ÂË›FPÒMƒñ¸§_Ñ±Ò§²Œ(Qæ¹7L&AEn2·	?nPÏĞeÑ\Záª3Î½}\0P)ê¢kû•§2.~é\'_:ëÇL¥4°™¡&óIrx2\"~LEASÏ\n\0î/ËÕË‹%\"U½ãŠ¹›k²j|C–w	‹5-H¢ÇÀg)İ\"y$­±7&êtlËÊ°ßîu‡$³<·N ÍßƒÔª‘Xãí7·õlšÇ¦÷•A€ã[÷í¿€EÅÔfÒŞÙß¯ó‘4rb™¡`Ådß0ú=¡Rz“Ø9ªtÜĞÂI-¶W4S†ky]CD×@Øc|şGB¬çu°IÍ›)Úlô*âr‚¬°’•HÓŒ-çW¯éÉ44©u	÷Í+.œŒ|ù÷/—8˜…ÅE	ìÁ¸éÔÒ¬†+!lƒ0á»rCXØÄï^‘‡e’ÜE,yÑv¨u¯ˆIläs/¨W­^²zyöså´Kt4DÀ…1©7ßa¢$u;·L\'DÜæf6¸jşµ)´È¶ÏÚÌúÇg21}W’Õm½ŸÀ†û?JMQ¥çÌ‘œµ£¦BL2{.FwœÑÔT¹t¿ô€ÚÆc—w w·\Z>²›wßÚIƒÑ\n×.=ÜÖ‚\"0 ¶A¾¯‚m:ÔĞˆLâQ6ºIF\Z\Z¦±AÓÛİëıÙÖü](›µ{ÒvùFr’z·ßßå\\x_eÖmZı\n›B8uUÍ7«éÍ°MŒQÌõÃz|]ƒ;†?ß‰­çWÃ+¡1Ÿ”[’íà½÷$åè‹(Q=¯Ş#?JÀÆ-dKƒ‚ìº[`‘0®‹k\r²k™Ò½ŞõÁbÜ»îØè3ìÇß·:·ÿh=µÈ—ƒíBã‹ùy°áİJ…n©}zŸæI¨ƒ`9¿z†šÕ{p{â†\'n.±qê—©\0;_ŞtE	5v÷g÷¼‡¹]ÏÂçÀ›m–eMr š£î¦²úP-P)ÕU,ø}bq”öî¸«£1ª{Mcçu”ÅN¢íŸÜÏEj?ßãğ£R·X[Œ5!ÛIô8\'Ïd\"z8Pàg¥¯è“…Rè\\%â¬šÁ´ŞÀ¡8_pUL­kÜúÂ6;İz\"&cŒ¹£d2¯Ûî€¥4—¨¥Úµ”š§¶p\"Œ)©àË4éh\Z:F\Z®ŒÂ™_íÅìÑÅ!îYJº¡¤Lºé8*‡K¸clVÅãCÒmš\\:¹î´\'7ŸNn:O‹¶-ô©ıà8³TîiÁÕÂ5pŞAUõ}ïb–&Öš,ºt ÑYjÖˆÜ‘PÙÅ¡÷Å´³Q^’z›AHĞ&×‰Ô6\\¨tM7‹ÚŠ¦ñßé!=¥vR““Ş	–ÅkİŠĞCØÎ<%œùJİç°¬S‡Ñ…†¼ÑNWÃÄ}óâ°¿8ÌGıÅQîÀöİ¯œ!ôùÏÖ< Ø.ßZZÒ¹!³Xû¹;½or3‰GFp‹£•<1³	Õ½@‘ƒ‡ªì6vçHµÑ—£÷÷è~¹ª\\NRqy/#¹.&©ƒÆêd`@ÌßaŠ>Z—m¥hÛJ…!!…Àbõ€í<ƒ]²#Ì\\*Ä£¿ˆ-$&]R+Š8tÙ¯R%ÀŸÎ!:ƒBØI–gË‰’‘æj5­‡§óõz~U´ƒz½›ƒ¨wO‹ J14´+{L*Ïe³SÙÌW¬fgs\rÒiœÜp¹µkñßr™¾EÈµ·}¦g&&²{ô2$JBUC|¿ï) îÆıtÏ ¼ğuu8è´”ÖLºİr¿H©Ş&kKOŠhò[ª»Uó–	n;¶¹=ºPÔ@9¯ÓS4g,EC¤\Z]šÏØ³E\\)¼¿XêI*0ËXØ…› ?:ÄC&Éjò¨…±Œ;‘æNïÈ«r1Z]®¥ëÕvÎfŠ)bÄH„NiJ5ï!ª¨äb‚{ÖêIÕFç6ó&u7–£ñåGs_æz‹Ğ,§[ç·´=aÊ¤:lıB­îx>UÉ	u´8¾o }>##|ó0ıŒü¶gâW¨vÑâ[Mï:§b;ò¯ªyŒïms×\rÒ´Å..]S0*,ÕMYN[\rv0LÄ÷¦²“h‘UÑÕbGÂkÔİtfĞ=_	cõ6õß7#øìğ?^cí~÷h{x7Ká»_æ4Û¬K…¦»vKÛã…Ã2€–®ô‹ã#^¼|B«©Äïi•+(ıø’[÷(©§Ã±\"BÃr\0.G¿Ïn»Š4ô»»#Ö¹r5Ä‰­ÒºhçÓ r„	´\nVİvråzˆêá˜\"øÃ*¼Çœæpè¤xÏáĞ8æ(¦fÄ$×—ïãv¢j‚è†ŞÑğÁèyùĞ\"m)ñ)Ç•eT7ÒN×nÀİ1oËÄr:-0BŒ£”’œ‚Iuv†tŒùÕ=«¦åzY–âx½>/ø^\06š¤®ú•†Å¤İ×HÑ4_…f°VÃÌU¬u‘=‚,ÀõóÕ£Ñäİfµ~ÄŞËÆ8Õ´[Ë¥t03ùÕo»”¯ú‡£“X›ñØn–A$eŠvY!GbhŒ®Û‡9SGŠnºa^ŠcítŸ-XÇæfgÕ5\Z‚ÛLaBƒDÂ¥ÃôRYe\0Nô(çïÎÀÏDŸî7˜¸û%5Pï±XX–5µXS6¡ç±ğªŞãÅZÍç!7	zâ€ó4…8\n%ê7b–°Ùå¤Z¯0j6#Ytæ“	|D\0Ø akíãŠƒÁM\\Q¼hä]lárCçÚ\0GPv½€ÕuGKŒ¶×…m•¥Ş9\\]\\]™EÄ?Xñîôcºt^üØÛLó¤&[œ5Á¼‹¯óÆS6LŒ˜GI6¦İë6”^u”Ş{¸ÈvëçšÆú¹Ànë‰q®œí¼¸0’;&`Ë3€í°ìƒ¦FÑ—ÜğH¢=vh_yœŠ1\r{¼WŸBËĞìˆIÔÓX\Z@İŠÇ_Âß3`Ò¥{/¾«ñ¢›\n/nı6Ã@ĞgóG2xÁò›Ö`€ÔK25ŸæW¹¨Ù\0ù\Z’ş¼®¦+¯S0GJ\\hğPö=c—waåsSù,Òv3ÕÜŠ/˜Xá²¦Â•%®ÔnÃ ` ^J‡@Ş—Ãõ|8­fåª=¾@iM>!4ò¡@^Ğ?éîÃqıµHs‹âÊrH×1ª)dOaæÃx#X×Fa¸ÇÕÉñá‰Ö€ºğWÀÒG+#o¸P¬_ğ/ëæ¬÷n^Í´7©äƒq0^>oxæØ={N‹/z™êcb÷2¹5–…}ø¢ow¡>É¹bÖx{:ŸN²¾Å¸ìÓOIpvwÇ^;Ã-6)£¬Àz\0TëÑ´\ZG =² ¸ˆ™1”åeä£jP-2#öè?/ÖëÅê«ş£ª·FÆ\r‘Cõ2¤ÅããV†kuµîZ{ÃÊZ\'\'cj¥sjåÏ¿|}ÂJmê2i}hİ°Ÿ8„._Ãÿ—ïÕ|6‡ş¸ô÷_‰!¯ÖİÍ4ë	sL¸(d™øÒŒÎWY«õûVÖ‡?]@RÄ™{‰:ƒÊ¹-T¿Ä8_¶Ïí¶8á%Ÿ¯2€ûv†H} Õå3ê÷¢¾ìÌ»»v\\9\Z_´ÚÀ~¶F«ÖHÏ³uûvÖj}˜//‡WÜÒ¦Ğ/Î¼m3Ñ|œĞüg‘êMtØ”>Èşë¿şëí,Ó~ÂW­£ßÌ×¥üèË.Ø”ı;Öœ´ŞĞÚ=pÒvÌ¹¡`ì¦Ÿ©HA{¶ÂA†˜íÑß@wkM^•İyÖW_·°gSŒñèjlú£+¸û>ÎšyÄ5jZ¾^w0Àsñ†xÏ0u:­·>Pi:ßLº›EçHto•8›\rª©³IPæøíßÃŞ&hsËéR/‰)CyÃnK÷¿¥ìû«×<Ï«fˆ‚])Ÿms~ª\'î×[#à|¹\\Sâ†S®.wçvMã•mS¤œ<(ù\0VP´Ù|‘ºº_’ã˜\\qx¤S2n4ï´ŞjŞL¢¶áxI¢¾×³œ«å˜…³«µ²ç\npD* ¯À¡).@}bº–a\\ôêì)Y¯O”{(×\nU;5s#?·Äˆu.º·L!È[ÜM}¶û×\0†à_Ø€¯¼W‘}LrJê\n¹ŠW¢ëqÃÇ:|.¨oW2­æƒkõH±[\0>bG0­Ñaø=­ÒF´ñÔ„©ùş¾Ãv)®ÄÊ¤l©œPJ‹Kåù.Ú¼²¼œÂyÍ¯µëßªLHÜĞÅd°%\nòv²Ë‚¨‰ªìk*ü€am\Z]/ótµãKŒ.TuËzğ\rØM¢£ÆyzjÔ{Æï·WÅ{V¯ôŸ°\0ÙJ¾&m\n5ƒZ1˜0{PF©/f“™Ÿ\0V9œùır+î-[ı Ş~Ã-W‚÷bÆ^ÍÎõ¼Ì—¨ıĞ‘€;¦Œß-°Ë´±³Zq?!æİ\Zå„<ôıf¾àCDê†y…¯%9µñø^GËó–#•’÷|ßvús™ÀÎqáÔBÿò÷îéÛ,Şk¼/àT\0£Úl¢ßÏàİ€k•ˆG½ÛÙB$û¹º.§@şËºÜ\\5¯pr²ÈÒ;œ¶C\"6 Šk³tóøğğTm3Ñÿ­azH¤èl{\0©Á¸*¡êx¥¥ )àb¨Óî3ßæÇØïœ»G^¢sj…­üzO¥>:øá´.£5LÎûr‰çË*a¹ áŒ¬çB©t_íëŠg®¤)Õ»>°;ßG‚ì›ƒxƒ©à7İ†¿óŒ¤KqY“`˜óVnµ»½îk§`Hmßxïº·“ßø’7AÉ› äMgK4‚ìº{`_°w[wÿ³—Û—€?ó!Hıú†Ş•RîÈ¡§|¼ç³»[\n6øÍÍº” 9|å(\'&i9ú€aRœÑyq’şõ)şå¥Äã‚ò0k m“²¢1—pÇPïıŞ¾œ¸è_lf—\Zò§Z¡ïˆ+uŒgÿŸƒ1x÷Øø©6)\\Â…Cª´Å·ó*N×j*ájœ;æ_Wè[2ğwMŒK„J:”VpZÓWOÙYøx¬R\n{\\@×½fê)ş·eÂÔvE8SsÒj4²óúÈ¢¸8RŠşRâ»$ĞÜz7+7ó\\¨ín¦ë”KÕÔ<á™ågÉLƒaÅ,_\0ré4@ÇÒÕä™T£DK—ìq4¾„åwCgM_İ¢E¼J‰’°˜¶ÜaÒƒO$ÊJë2òÄÏ7‘´ñĞGœS}­åEN	ÕS QDR!l-\0‹c1ä\ZË‰Hò•\0K1)Ü>ıåe¨qömv I/Ÿã¥LÕœ¯õræ—p¨g¼IZºÒ­v–³e\';q¾¼N—™8Z?CøÎÉ =RoÃ+7Äûü7Òèî)VG\'Ñ\n_¢˜…hcÖß1Lå·£jŠf»d¥Š½Àæ~Ã	àî«¢ÕıÃÕÆ8ûš“`ßµ>ñ«Ïã9È>éõzÙ{kâİbšù\rw[œÑ‚­ı5g£ñ®©ÄÛÈoÜAŒ{‚m—4‚ºyû¹\\Ú3wKf÷A<¦_³B\0µ°ĞÂgb—ü©kÓ[â·3úB¿÷™·?²Ô]Ë1ù9Òòq6¦³RmYÃùqÁ@Ç³¬|bçë7Šôœ¸$«Íå‡_¡N»ğ(DÏP§€wtxø)A-»ƒìÿÉ|uá~eçVÅgì€´HväÜàB»¿?{ZP(ÌÛëÔßÆöìiÁÂ&„ƒz[ÇÙ¿~“åÙøÏ¿á?Äòd\'Ç«ØŒi•p+.~aH)	MÑÑ–l‡Ÿ\n)J‚<ãûj~=› ™³ç{Õê5Ç“`Wöz\Z9Ù\"Êë¶7±Uí_“¤ P¶k‘¥•h™¹D,Á‡¦ˆUg®u6ØLeÈÍM=4ª~ÙB¢¯íuêz€óåäc÷ÌJ{Á>nùlTW”¥~tP»àçù´\Zßhş{—Â^4q¿¹@Ó»9Ü#U.HE’B7”!G%ŸJÀD0Ûo\'AÓÍH¬‡Y£ ·¯i7ù-âĞcÆ{Ñ‚²]2\\°‘çD‡[a~°˜rÉB©.›úõWâ×ôŠ^\ZvöŠJüŠ^}¨¦S½/>´WÑnÁø·Íc®?{ tÚyÌŸyğÒ&Pc=¬Û¶(÷÷÷Â*··e5À¸´lU£®hğ}Š\\G±Ç$™!èOÈ O4 ƒ-C|´ã2·Ğ,n˜ß”Ë›ŸQe¶]d9Ve\rˆ¥İ5rƒµœ/íF|béW®ÌaDÔxãıCüj^Bè—Ô\\ë®)¡\rªTªQ˜Z«°6£–B¢^Ø»;¦ó÷(<¾/aw	Ûõ6ºŠk¬F©ä„NZtRp	j\'×RE\";/ŸGX#IAYºÁvØ©l©E0OI‚²\n¬‚ü;:áL\nâÏœŒF•ü2Ÿ¯Ã¸„^î3¡§5²P`¬*áŞ÷çå´:Çè)îÑ…6ò(Ë‡øÚ ÑÁ×d\nÔ(eğm‹Pª6E¬qx5¥³„+ízùqÜèPäÄƒ¢‡0t˜ŞŸ]Qõ²(âñ˜}ˆótnĞLpĞƒ0K¿8UNŠ£îÚ%NmG#æ·pŒ%N:Aœ$¤\08•T›ƒ‹i’Ü=ã2\rr8Èeô\n‹{EmTáKmÃìS6Mb<n_î\nä0ÏF’ßÚ:º•0ÿ	ŒºÈP¢~ysD!¬¤ºhğMàpX®Ö”?°*H£tĞğÄî3gõL‚-V—;--#ñºjÊ«!$p[hQ_×Å¢wM¶å×³Şõçv¶Qşı¾w\rËr]¸îáT„—éªß@ê¦Fˆ´À×t\rnk¡ÎŒßRİƒ	ü×Tw5ß`İm¼$×¬îo’ñmğFŒ\0j¡/Ó]ßylÒï<õ\Zâñ$ñŠQÀbû¾ÉiW†»lÕÔ)á}„ï!`J[ÕzÖäg‰\0×ıPb2\'hNí>cUßçÄg$ø\"†\n·øê ;Ér×NÃLnWàkføšÈN%têæ•\\µ›Ù‰ºXï˜dñ—[$960.l#9Š‡[#ŞÜ%aÖ¾©<™YİËzƒ¸ìÂ¾qà‘4iÒñ°©Ã«˜ß0ê¦ «yPMÌ¯5êÚs éqAæÏU+Á øùiC„R¥pØWo(ª€õÙR=¹¦ŒIuU\'¶¾öÛTö$š2’•}Onñ…˜ú¯„MŒZ ³½›§ÚC ‡Ú\'GÙS²†÷óµŸh!n¨â<‡iEßìîŠ¦§¾­€ûzê«_?as®Šy)~MÍ]/àˆyX7®Ÿ:³0Ç÷Ç‚ôóyİ¹§›\rD63¾gj•ğ’Xã½)˜‰å»—ç§¿”çå5é‡Â¯×‹vÖ>~ûvrr{”¶í fØ¦PîÍü;(g¢³/óÑj8Z.Gì\ZÊÀ5j	“‚¯0Ğ,µÖÓ&:¢xq]æGùct°ğ*±Ãy$È³ƒ6Ô<¦ä“îaÎØ×¬gqô%Fã İÇùã{®$Z{ô´ÓÏ~ŸÀ_¹8SXxø¬÷?r}ÚâÀ?àÀo;M¿ÿ@òãë7ó_ÎOwÍ41ÚÙÁ0eØÃEO8ê„SrZ9®İËx!Ñ9<ú\n¾à¿>ü—Ã¼¤fÚègğO;;€1NN]#àÛ¿Ù ñêJ÷\0İªbãk\"ÿUçºE_¶_pWĞePÄ2Äyùöo=Ÿ\0ùÀ1ÇÊg‹Uÿ‹ÃüÃFŠ§zîBÑqx˜«±:m	©&áæ×píÑ=—»ä.XüeÊOVô]\0\Z™êÀÍ{ù~4uzË0ì7™:™Ÿ¿øËp(¯¨’¾¾XÎ?´õøõ+ûëÅhİ\"rÕšÌ[7óMëÃh¶ÆĞm£Y¨S~•1Ùq‚zÕN8™]ğ|iÄøUëøäÄ‰qAyæøË1I0İ^i˜\'(yŒ‰\'bçÌèŒy=OeßôhŒ›C\rP0§À²Û‡v^Ûgê“ß¼±¬f9ÿ•r7æ!Pùz^S¶\0®Ç²ñä\0ä¥ÌW4}NñA¾™ùá­/Juˆó6Œ¸Ã×uï@U6^lË)ÏÏölm»áõMJ†eš’ñï=ºÌ¼\'a¨r¼Eã2Bƒ!ÄÙ#U.„£ƒ¯O2!„9ø|ö¬çò›•\0ÚŒ^ò£D±Nv½ÅáúCYÎ:¹ydÂk²{&ûvïX\n”\ns0húßÎ ¾ŠÖämaşá‰é¬{¤uÏë¯ õnİº¦4mİ ~:B‚)H«Iä=£í+âÊäñ§c¤´(™ìº`wëƒùgö8@4û¤Ìë\"€ÒX‹GÕêk<Í(Ù?PâWxfrp±ªrE†„]æ’ë¹J*©ËâÔsRNá~³w	u­„ğ<8¾:m79u˜*æ	4ñ/±5Ñ\0…¹«‘w–,Ô­]	kÚP_!6O/€ßŸ/Fãj}“a,<ó< j@	lÿ5Éşö“„d!‡Z*²Ñtq1jÌ\"; \0ÌW0V²j©äS.¾ÿ\nÒş®‰Ü‹¯B.áW’¥ˆä±ÔŸV–öldÅ/r\ZæÎc¬>-³àÛ¿9ö$P›ÁÈòÎx+#éˆ¯}=éå‡\'Øü¢:¿ ğ€õViœäŸc¾,èß»»ì÷gggšL²ÁÃºBïéÚ‘Î¸ş1Í	fÆİ1ÌT=ÆÁ©å;¶ÎOóqî„!­ñ§ëG“ƒS<î dc¹îøÑãOÛ´•Æóÿøù%Öít:®şËY*EašÄâ\nöS`}ª€=îtÆìO›õÇÁm	\\¨\\‡‹PËéhØRƒšò…BFÏìî”F\0Í×íÓÆbûÓ¹]“O{Ÿñ÷¨s;Â°l´¿éæıÄ9Fw0s<X‹GŸ+bÃïöãO¥›ş1Âî¼ôˆ3pN=Î»G‡Ÿ®;~ íõ§“îªó©óh¡Óx\n(3N­¯×“öÑ£Ç½?~Ñ1¸Ñşcï‹/ñé\Z\ZB0NgçIûqcáöº[´z_HO×‡ø#®ï\n4@xÜ{€ø—ÏÆ:_F•şô¹VÛÖ.=øxÏ‚ß“ÁSJıyUWÓœ}0ÈÉ)ı+G©suqwè%wë¢8Æ“ÄG™o,ğTÆ=L0Hó¹óz˜8-Yóêë>¶rèŞ©¡ëx$4ù–X,ËÕjWu(C\'®»ÑNªÉ÷szEƒÙ”¯.æ›©Õşˆ”AğóùößN\'?“ÖşzÍ.á—D†;spƒ…>¢™øJÌóøú8QKÅràãÊå3}5êKŒ¡ÕK8ÓgÕºd.ko²KÿRª^­äÇYNú‡Àö’\"¼$ó‡j·Ÿ_ÌWë [œäµæ‡õ6¼Y®æËŸçæZ­‰?-Ã$~úq÷kg0Oç3ı=?;[¹Î¡­ÜÊÖò	®˜´ÆW¾Qc\Zæ€:Üô°»ä\']hç_íx]q;)ÛÜNJ!yu•õ4¨¨eêî.¯¢¶iuüxX^uÚ-SĞëÍå´\nß\'I_JeÛN Íh*›i\nÛ%›¢WËšÂ¿Ê¸ª¸{W\ZÓ^5ğÙ^9ÒC=×ÔàB½dÌTzéágîÎ­‡\"îÜ¬~¾+Í7\\W6ÔâîßmÑáî×°#£Á9©¥©¬QTˆóO,±¯NS™«ógVæCë«_imï›œ)¿sThë‰~SÌl½æSkûûü·7+¯×¯¹%¿z\\3´ˆ·}JûC}OaJ}ÿü¼d½pĞÿà•›jö€#§ñeJ£¾99@DwÙ\09Î¹{æE;ÃcW9ƒk¨İé·~œ·b:ŞTß#‘\Za-æ(¹HXm$BõUY°Y¯qH9xÜ*­«‚“TŒO{sa.6À‘ĞÇ>eñjGø8?àAıâ½HãÊâ†¼~Š–dÏş3;Fi«tH”†ô£È=¬f¸3•qøƒÃI¥ƒÃä>Ó|æK[Ù‰;}¼Kd»Èu\" Km2HçoÈ.…i×¸h\"î™¸7iê…³kAÈëms$r,DÛ§°½x÷4©‡^P¡Ğ-?°ñM›TL;r‚I?yşI´Š^óƒqx€•ÅOƒ¤Ô=S°û]:›W›ı¹)M¿3ã‘‹c6içP*‚§ıè‹v¹QÍ†ª(\Z8¢øc`6nAÿ:(öˆşeıb‹üë° \Zq@ªÍ+İf»O®Ğ»Îù•T>oØØ|>]Wtª|©Tİ–!+Q$(ÉF0ä.DtÇy@“Èa\n‹ª%M}˜¹£â†N>„êiíÂÇ&¥$şìËH\Zè˜Öw5ò›~%æ¯µİá\nuz7péG^GA5zAo¡;¼Mï†‚dS #~É¥Âññex2ŸÆ1»V?Ãi;a¶cmâ4ÄPíèùpø ßœ±/nÙñÖkÔ‚ì\n“Öü@Ìˆğîq3øm‡áÔ1üxB…\nÔ5Ö–*kĞ¿\0Öwñ½	û«£)ôñã©Ğ€KŒÙt8XNz¾<Àj%S,Ü&\nZ{×O¨q\rìOï†~ŞĞÚCÒ“¢9\0éºCùœrƒ)7Ø-x`³~~¼÷HCY\Z@d+‘7³,w\0İK…É˜ haÜbGãu†+`ÙU½,P§¡edÍ‘3ÙŠ\0nuf€ì…‹$ôÕ˜qYödD\rÏ/ÃVû\'l§é(‚â®ºÏrqElŸ_Û[¦{1cš\Zëîr\\ºY¨÷§ìpĞ;î²ûˆ,µko…˜Ãœã^/¾€+İıî@1,\Záé£ç vÙ¹ä]/«ós¸g×8*!İ!7Å…•8Ó¾g2ÅOÚ‚^ÑÎ´hëàQ1‹;-%S¥(|~CÜZ!ÌîÑÉş~øM­XI4óA/´Üş~ĞÓ}iHPµ¡p–´Ñ†8îê%{ bUƒâ¹óâ»±Ş“Â|¹¥nÕ@N3<V`”ÎcÉQƒ\"±×ˆHßnöR}¨_C\\÷E©}Olœ]jÍÉ/«Øºv}¬J®=åo’åoº¨ÈÅ!Lu¸Çd²µ©á+opd€BÄÙ†¦j€f&½W£=pû\0ŞÁôE4e¸#w8Ù3IDÍW0¡¥ì¯àkwûKNªšGÛi—@<ë]cØGüqƒ?\nËë÷nì•Á¨‘/ô®e,·Ÿ‰œ˜Ä?èE\'€t€DzêX”¯m>fF^\\æ;»¿ìŒpª+k…M¤\\´éøEI¶;6~\näÚê´xwşWD1 v-Ó* ¤¾?%u\\ 6NzóñãäıÙ`\\m\"¸ıöÖj[‡±85rÕ­g£±¸4Š3Ñ¯Ñv;¦×Ÿê|6_¢\0FDµùïÿ.¾üœ¹J`&³:Óƒ-ë@³í2RzL—ön­…ª«]K#×õFjåŸjyjæºŞù…ê5Ï±ŞğSfÅš5©ÿÉÇ“Ø)dªy/Äû¸1¿ÓJóE WmV/,-hóûÍ’æ2\0½`Ép\0)Œ•ñ7D«ià¬\"ÉqV)½5+«‹ËT²²›…³Â\r*kå¡³ç‚g\'İ9¡Ã}Èq#ekÇKêhŞE˜W“ñ°t§‚…9Ì;>V­ÊH\\KşnKXìë ®Xg®2{>×¥sèy¾øì¸	~YÔüÜİŞm}‚4µèq£¡8¿bF-Xm¨_uÅ¯ßVîú©¬ø¤m>¨ÓBDê,Hô3T\\¶™5ÌÜãn,(³ç_|³ûÕA.3H‡ñöúçîß¶ «…R©\Z%y1p/âMß¶oRÏÁCƒò¦õ<< Äıd-N*X Gü|´–»í^$LWŞÛH×çÑ#¥<¯déJÖåòP“¸–ÌÖÅÑãOÛTù\nñ)ƒã_6ğ7Ø½\rœ›½bâ<×†Ÿ+ç›<sz–sS|3™@İÉ^±i®;	êvmå)TîËæÊS­ÌAØled—–{Å´¹ò2¬ì›FİX-\\ÓÂtjõÚš×<„,#idšS»ÆØÁö3§€g\nÑ?TpiQ&«ZŸßzTÉûæîqoÈ\\Í*2üİåÌîM—úä)O»+-mÚ‡¨‹Ñê5fù®æ¦<ëÓïaŠ*XºrÇÚ¹“A\"­[ğt³à³÷ÔÍ´˜¹BİX}¼uÚR-øõ¯VB;cÙWÜ€}`<8ğòcN)H.¦¿¤£SÍäú·é¼#ıq÷ëÄïÄá‹iê±X÷[.­U­Z³ùºÅÕø¥ØbÇ$ìxZDa)îôÎxÇÆ]¸©rPq|œÙªè§?;ÉÃÄ¥†%’G²““ši¦O~†M„º>|¶!Ë‘]©<÷LĞdo£,ƒ·Á¥Ù8çJİ„7VOêèPä[ QßW³ËÔ[t2\\CçÖùW‰Ú6œq\ZlXÕˆ3\n£{	\'%ej[Ñ©¹Œ\'ËZè·‰¶‡~)~l\"So\"aÕØ¥ÕanmtÕˆÛ¶×\0¬.iâs~¨#i¦“G±Àó>—=\Z\r:„„%BxLQIëå!\0\r«”Ls×>CÛæî|:)ƒ-·JÄ¿â¬cP^ÿ²#æºÂ£ÿüı£œ¬ÌV«áE5™”^õeuQxØÖmY]xc	>E‰pNŠŒ7G7;ÀB¥ĞZ“ù9K\'€p\rÏP×|X^Ë…•¡ŠÓ­²ëßø¢„ÓQÆıˆû‹Gìh2¤ikÓOÎ¡*Ãñh:E=÷\rFa*¸|6Ÿ€ø	Ó¿¡c›/£0˜(ı•‰øÊø½B†•ä¯sÖÈÌ’*á½wBD×[ı^\\Œº6Ãî`\\ø !\nÑÄûçƒlà‚</ğ˜‡šØZ Pï¹ÎG¶¡6âŠrS(¾|q\"Bøy	X]­oÚÙÒ@äâ™Ö`Uä_HöFªPz†î`·–áÂà:~¸Û>„ÆêÃh!‘Öìå—’_I4]ŠD8fú\Zğ¤ŞŠï&Yègõ£ Ä([£­¤Î7­ÙŒ-Z‚8ÎE%&=Ã|¨Ş’è[¨†°ãzÒ×ı¤ÙÕn¬´˜nÕúNj@|Fd?éùN ÿW0»3°TMOÛ+oNç£åäõ†Sß¬ÛÇÙÿÓ˜Á÷‡¬F‹:ŞâX««V…¼[ÙRLïeÍkéÑ-oB· Å9.ê2é«lS‘[L¼½wa+mì£lgÕá`õè\"ö?TùHæÇT€Š’öNDboFl£ş—nÛ5„‚y.¥~€Œ6Â1­ãW–±ù,¸•ÍÚ±YşñQt˜‹üØƒOç+ïµ!^ÎÉp¶,Èg.!cW§êÈJ­Š¶ıº»;>é`Ì!8ÌÜñéŞaà;‹àëîîÖ“Î\"’\"Q¶‰AĞú1‡@Çßï³§%Œ­´zàúû²¼YéK:ÆñÍRwë×?ß€S¸‰\Z:ô±$¿úO:rî¸$Ğq‡½{›ÙrŒ½;6€NNŠğ-	†¸2C€ç\0wÿo&2@*Aş’l7:·8{ª7é›i„°ÛˆlI‚3.ªïR·3¨­j,ã &u%qe(Å«Õ»¼zø*¿ş£,¿Å¿}(õêõO?ö8†JuvC€:Í·jv)ˆkùt:ìæä*…èz„¥jÁÓÓÁ1\n_È3àp™âÔIÀÆzí»D-AbmÄcg[äøò¤x/)ÓO\"QYcy‡ŸÍĞ(»X›mXw¤_‡ã|…1(Õ\Z±iîıÛa®mƒñÈƒHXv|\0`suà-‡£±£zôİİ!ƒZ»~lĞvœšÌÚÙBÈ:ITû\"ÈÈ…‚ô°“2%5#¾ïËœ‰Ö{É|öM	§Z©9 \"ß,-Æ£J4<„=†§Zèß04=4Åpz.=Ë‡SJŠ\nT“C…ğ—Xt\rWèmàvË?Hãòø$ö\Z.\"×çµÇ“şå§w0¢	›lŞİµÈ÷iÈE]^ùÈÊ†ÏÍ%ÓXøP%Çœägó)ì|Ë®¤†‰çƒ¹ıN_Ã\Z½Mºš•„µÑö/³ìå\r« IıU8„e?\0@PæWíÎ§äS‘şGŠı)n½^£#%14d˜šØ`É½jHšÜ`+Åóe9RÇb‰÷*ÙƒíUMŸB6Û=QZ…ÒS?X3tçÌ%ª|@Ãuó¢.6dâ­—ø\0Ls™A‘#¶\\	ŞÇµU÷¢V…DÀ½$-áÃÂÌcY~?rAo-İ.õˆ‰b¹ZV¥1}ô	•¤/Oûp×FS‡xº¾F\"$)ñ>Bü%«Œ+¾E×¾S}ù›ofÕßû»ÑquÈ µAZD`›e-Ë±n—)lëÜà¦¥¹‡0±ËŠeq¬˜·Ûu;G_\"ŞœÓÏÒ_GP6.ÅWÆ¨Ññ®é	W,R-œ§[€c*;ìf‚ÂÿÑ èØ]‰õ«äVƒÒ9—Ó¾ªeQ&†@tTâ¸“š)A¼±SƒbÑ{r\\ô„\'Ô¦_×S‡|\'ÍÒ/£bäÕCN¹ñC´Æ% ç/${•`;hjMñu~WÇ¼¾£»€&­íÒ‰Ò¹¯^¸mú·¤­ÒŒò¾”C~¯åwÑ¼ömOBn*}<ë›\\^kØ¯Ê.‚$¼³’Z÷”`c”†±Tæƒ6%ØÅC š_Mgû„æŒõBWÆ’ãf~‡÷Ø¹|õiÈ9ñ]×U¢„¹joûøOpG(Ñá‘A˜ã°0lä“º˜Y¢•eİWÄ_ËÓ×ø:×à\'ŸYÄ•GÉÀõQâûK9İÔ‚ä¹øu(ZLğeaCo( °)Ö	ÀŠzçÖı´À9”4ŸamMš`wşŒdpj>›¹°{óEèËğgn\nâ(]~`~À]\"Ñ‹«ëTZ)ÌV\'(	—7l¾HšbbN­¸ÌRº†ÛÛQ%šÆtÊâkÛl’Ø­Ş?\ZM°ó	Â Éa¯?N·¼`iÓ}Ğ<“l\ndá;Q.óQng°¶n€})éŸ<ê1ãéì¡½33To6NŠ\\Åz@\"şIöì‡`4tâ^‹ffm¾ƒIñZˆ+Í|Æí>3û,j•jšy!»HÛßß«­`g·{6<xª:yã,êÔë}ĞÌ7æ|úxĞ\\ËùÅm,’FL¨l(‘†Öµ&£ÕÉÄ»£ÕÍlÜ]Œfå4ñJš±˜WØ÷8JÁGfúÑ}‰e‡½/2ÿ(.>~Æ’è=zÕw@Ât:…B•ËĞ¯…ö)¹ëúËçšk’êQÙ5’}d¯b·Â«H&Ictï_ôõƒ“BÆú©^Nkó»[¶Ÿ¨‹¿v\"©*ş3¹åıM°“½vª­”>UÃ‡I0úvç2³Ş*¯ôuu5^Şˆ!$z;iîT$!Ü§¯ŠeÈĞ˜p&»ø4Ñå(Öå$Ë^ƒÃ¦TŸÚNyÄ÷HoÊ±\0ïŸ2ˆÖBe\"Íbòò¬‰@+ÿ®!x™\'\\kÄëÎ¯)èˆU«åîúÉ¯ $¼ZJ•Âî‡[Æ\rJ²ØÑe9Q¾‚Âã bR`¯ü<ZÃÏ¾-p9M‹ÄØLM›\rF7,Ï·J/‚@XÍê7üFÃ5ñĞ¨P¢•ª¡å×»@ªõ(Q#.HøäåE^_4©(á\nÈ+ºX$6hàäURT\ZF°.Q¬*:Zn  ¨oî[«ñ£\0ö ÿä$oØj3n1‰Ñgš%Öß’Ÿ&£Š*ÿ\rkÀ0İº‹§ÎFâè0bııÚÚpI¬,]‰­\0{Ç$mM«4KÂTV¯o2íEƒy°c’{ŞøB¯\'şñ9|\ruu4æO–åY1¢\'rVêwwô§ö¬†Ì\n¤Ã§(²ßGAPkNÍÿLåÔ\'û²41¾’:4ê¿¡<&Æ¸XÇ¦]Òşõv_’`ï_ ÍVçï ²^9aküä‰İ¨š\\ÁT+t{_´Ãm †°\"Hdó‘îQíeNj=?]Í)¨q´­Èwm¼‰´0½–+C\0ˆ?¨mzÙÓÑ®¾oÌïlÉÔ‰ƒ‘ô\\¥‰€‰<#\'\0•¤6ÊípèB»\r‡ä}Û¬Ä tJ›Ã~\Z¾&7YÀvy/aàt,º£ÔFƒî*åÂ	èé^ò(“§ÄWNN™‘šè”şé)ÕÛ8Çº\nuê‡«rù¾¼˜Bâ‹ ¥ğÄ½Š„S2ŸNbûŞxYU×fR¬˜ÅÑÄÀ­—òLì\"GÔ& |G%àG&Ûó¤€ÊN½ÔkbDàò7àà(WÙTC8Â[^°¿{\"sS° 3‡nßFhK:(œG¤_Zô\rŠ¸s[P!h8VÅUÛd²hKN„‘ÍÇLÌNÇPåGb5÷JÇoáŞİiÄ*“m¤ºÍ<‘\rå‚“¬‡îŞÜ!«#ø”½IĞéÔÃt&È£70»ÀºµMĞ[¸%©à×\0±=Û[d¿Æúz¢G:O;fŸ”¤ñFŞ•¦NZ\ZD9Éœ[¤ƒì¨F\']Mğä9„	Ù¸Ú™É?ïé{c[_˜„¤/È¤+HZ v%˜é(GJÊ5y…\'\r§Ú£„´Â©—^L/Â ôUıâÂ”©Ö7İ£åŒ-›t¹œö3iFJù¶{0ÔIwÎ&~4!ÌYR)¨Š%Ïâ‡sİ¥8éÀĞÆAwU\'k3w9¢u£(F…ªaÑ\0™çÜrAs–gÌøZëUÏ´†ÚegL4f‰ª®ÎäèMúRøÀ0µÈ\rÄä/M¤¢ÿ•;ñŒ\Z%V]ëõ<mÎİ¥b×ïî\ZG\ZŒÌUÒ±¹]íúÏ¦|§£eúÉBnuÖ›ïn¡~#¥å jö¸L\nWÎ›İLlbäÚ¤1¦–ğ…¨	?ÿZM˜ì{ë)ó^éàçJˆ+?ãşÏr{\rá9}m\r¢»UN‡ŞËßH½¼VœY¬÷ââaĞÒÙ6WÖtl•Ç¯Åu¦]cúCíğe\"”ƒåT\\?¬c\\6s¾ğ íaá¶¹mĞh±,ëCràÓÏDàò|—Ûpõx^ƒ\r<È»Í•ø€«vôpº¬ùj×Õ\níh’\nÔ:.(¿¯uqQšê3óY5¿ò¿¹CøÌ§»0¥;*s‰yS…Oã‰Å&3â˜2VÏÓ“\ZuiŞ@‰šdS®°¹÷™j¡›Ì«ÅÃö\nò,°Y²n¶Ëë(€9ÇQİ\reÂ?úR\'^ÖÿÃù´âšj¾\n]|`RbpíÉãŞuwrÔ»îDR6[Œ%}ñ¬ş@?bZvF´»®àuÀ<…[7óºCy´ªzÔ¡<SuÏovÆ¥~àØç5HÂh\"â_5ˆ¿^ñ \"YªyCv´Ü	ú»F•¢by@ÙÅùàÌÊkórÔ`‰ Dü¸»ãrµ›?{ßaÍÕeG€°(êÁğ‰yæ’ÙÎ¶n1»Ì³ÓéfóQ‘J>a–NhÛ7@ñ}=ó®všÎ™h¹Y)J3£=	^WÒ«aÏ,q…ÃoÏu7îAøƒ$¥ô÷–b:V/ö ²\'GXÚ_ŸxqÆå„Ul• !âön>mÿñÑŸKï»W¸±Ÿ²ØrSõô‚şèğ°w”uPhgÖÁm½`×L»C¯ywÒm;g²û»hj¯Ù/b\r¼vŠáL‰ûgôàÕë«“>º³\\òQÃÊ Õc\r¾Ñäİ.İTëÓ†âNjÜû²ÃëÙhÁÚ»4&»ÛÕ:xİyzô9fiòĞ¹8¨O[QŸâ®Feƒ¶ñfp>G³ëŞb:ZŸÍ—(×š”×?µ³¿V³¬ó´{ÔQwøaôÆÚ²¯UÑîã¥‹«e´UID7¡ñ†*îÒ£Qó¹À–ñ@¬¾¯Ì22Ü¡\"Ò-‰Ñdp›´HõÙ~zÈñûJºrğåç§E†œØ‰mn«[+2•8Q:Æš¼–hÅ{–ôÎØ3r2w°»Ø®°J’,ß¡oF5µÈ´§ÀÄ¹»ªùüúü|Yj–rêÏ—&*o°`G+aIŞòí÷äËï»ôë8•7¶æÉßƒÏ;A1±¹üŠéíÁcL—–q¾”2ï¥dÈ Ài÷ÖÒpã¯’›b?“‰\"²)—±Z\ræîW×l°™L>DkV?ıJÁ-2º{ÓP‚¬3ù­-ç¿‹İ\n]Økè†Š Ã‰\\S’ìŸ\'E{ñ	ñëF!²æä0œojam“ÿ9Oİjİ0/šq=OüFÓ£Éu¸ì¡»;³½ùÒ`©icuİq}¥Q&l_ˆë¼¶›êÆJıI\Znƒ=õ\"»ñ¸jP}CŠˆm<S`\\¥—Ï;êŸ“ªÕ£j&Sİ¹E:_5|y£/¶Y¢P ;O7W³òf#vEw÷Õh\n;Ë¨ÕHÎZ	‘Ú’Áª\\şEÎ9éµ`è@}CxÿxÒ¾¹@ë‡—Ï}ª›9ŸtE—Èğh¼kªƒY\Z­\\`?;<<` œy½¿Ú\\)ŞI©?~ù§®-EÒaÖÔ\n¾\0§9A3|‘ëâ5*ã€Ì$¬\'ÏÆÔ83ŠÅ&eÚÀªv£…±.^<¤€ò+âf¾ç‹‹ªc“æ¦»¨Ä¶_­Ìä”/fóÍùkÜbÌ½jpkÙ’ë\'©I½ÓØèò~ãûÄæ¯ÜB²jŠŞ¼Œ4Ú	÷÷ïIhƒÂ?+.y@ïyR…\n[ÏÏÏ§¥›»	öÌÇ qªlñKù÷MéŸ’`w¯«Ù9¾»7NÔ£>uã«£ş!KÏÈ	•ï’é¯‹}[?X\"™æ‡j}c¥›ŠÜ³£:o$W}oÏî­&,&”	ûK¼—ÇéÅ£l½eÏSon^>o[‚’â)È6~ÎcÚ©~iß÷Ù÷/Ñj|Ù]Ì+–ª¸îùä\"…Ú†I_î©ÁGù¾\Z“ÜœÇõ7®NÛW¿ïq¿É=Iöö-‚7„®­g´		²ª<ZÎF‰°4á¢ş&fÜl`ÖÃÒ¤/$[Â½Øñ3›([¤Ğ>™á½±ùí‰ 7?àjŒ¦(7GS	åãRüô¶BçµÏÔÀµÎ®ø)Ğ\nêo8ó{‡²¨–=2Dú#RĞGY¢ê_«éÔWOuˆì¯°¾ Š>RĞst½Øg¹ûÜñºV”«ZÅåLò5øªAD×nø¸Ô~N”¡Ó]¦½h\\‰_À®Šw|§íWıÎ ˜uaËV\'\\€sF‚Òå7`\n¬ÒŸéø¸g>bô÷%ÕD;ôJ-@SxG{R]ún¼‘$éFäÓ/ËC’Ç&7ÌÈÎ,óÙ|&g.›”šO+ûŸ˜2^;Õ¦LÍZŠ¤Úb0ÖEÙ=8ÒÜÎ?Kê\Z{fÍÑo‡xú&¢ Ôı|¤†!ê¡»”øw°²lÏÓeGŒ;ìZR¬Vü•Ò«™ñï{MiPæ^ŒàÜ“ĞlbBÍ5ÙŠ:»*×#„—õÃIYnfáÂ:\'¦ô<rË@úü\'?›/a‚GïF×¤¡‹7¼ó²Ÿ­6§Wi<x{çl4™år£ú‡ÚÜÕÆù|h¦6ë³FĞT]Š^©€Ô]*ı1û\"âÆ^Ş¯Æ(•.º\nÛe\'…J6UÒı>v‡÷À¦ÚÖŒ	BºìĞ\0œ‚ê×m±¨ìqu’ºh^yC©1»Õ°>½?ÿ{)È+ï%kSfçkAÜÚ´\ZnjÉkş7pù©ßÏpİÿGnì\"uHIB:ş?Ø§Ànºof1ÿ;&Ä†~};_^ıÖİÂª¨_r€v)«a†¾ç·ër[÷,¡–\n:×È–=Ó3‚óßñoğŞ‰ô–\\0øÆ-7=å¿»/$u’¤s Õ³\\áØvV•¬w\\¯\"…-5ÌÃÀ:ùíß,‡¾ZŠÅÌnE»>QÑ&Ëm\'“TìXàœ‚ÇÜÌÖåº\Z¿æÄ“Øx?ìì²¼aí¹PRj6ŞÒ^‘1’FÆièç1r6ƒ÷BH†ë`u†şdæ_Ñ¢5öc×ó“‡!0Šp…ùæùrD]B »Ú%ÜÎD\'æ×4ÎŞÁ&âˆÇF‡	#rCrÉ™”=ºk_ÃØÎmœ\"Ş„Š8}\'àlëÂa6€©Ã¯–’5øÚj¦áXşT´ÉY<>=õÉèUªıM¤Y@iW7	—ÒÊÖµh;ÄSè UY\\”‰¦¢­ùé;`°0ÈÄ¨µz6-×óY¢L<¨†ÂğŠtS+šRU·@R‘HD‡N-ßx¦Àå¬mÚ£E=™ãh‹ÖŞhöbRB’¾aÒ`ÜòyHñÔ(ı*!µÃ;Åéè<~HÊĞ\\ö$%³¹)‰L\0<! °õweh”\ZÔ{ĞT\"–0¦|…V8Jœ7‰h@P±Zñ/]¢Ú7óù´©’vˆ\\àåóSer”Vë‚‡Q®œ‡Áß]ñÅØ,¾©j5±óhÚ†6“ól•‡ô\0ÖûV_\\¤û¥\nÌLô%±?»S/+=ÚÄt©^¬>?B}ßÄÔÁ/º¹`h()*ºPÍ¬š,Õ{]ŠÉÎ±«}âfEER+{‚Ş©·¦yS€i@ìÍñ«…Ï¯û‹6#}[»œÂ–¢(ñéş§®ğ¦L‡Œ×\\(ñ‡ÍAº­{—”)û%ı\'LKm\\Ô‰‡M‹íN5Ê£›i1V+{\0ŠZTº&‚®¡3îöıˆ;*öVøòîz0ÊO¹×ìºù[(¼nK¤›vJåúé×°\'[»ë\'.¥{dUî;1¯Ræ©açšVl%ÈÓËÀÀõ<1¡°Š§J®ÿbt[…$Iü64‡Û³©Äı@õBüXQèæ\Zïâúr\n§Ÿ‹—^/X`~lïi”RCU3Uºµ´êÕx(?DÜUj!–\Z@Ã3jÊµ€L”.´PxúQ´|šÜÑ@ò±´~’ƒÜ\r>ÉSîj Uá)Jñ;ç(Qa÷(>ª…4\'|Ï\Z8ßÃH×yÈz<¼F¦¼©™!½ãÃÙU£U9ä×\"³§Ãı…*€®T/’4ySêF,¬Ï¢ó¼h¬ìÈ†ÁVwË„£Â˜†\"•¦¿˜“’ŒÓj¼î²[/«\rÆ¢uj}WÀ´Hro}³(÷ŠL–æ®Œã¥÷Š:õÇôd5ùûòù“æy*r)½ÖªÆ¿~›nİH5ÿ4‚s9› ¦ÓéE\rÀ Ö7±6ó½W#€!F$7ÙıîfÂ;)¥Ïš—óŞÜ8õ±¯R´Z\\)S²ş…õòLĞ½^/K	˜¹P ·EğWó¥“®ºNú,¾\"ÿJ<}èøjéI¾¢òšSÉô-[ĞÔN1¼ØõùËÍó(}¬©áµÚKZZã£òË#ş-—9·c™k%ÿÿËüë—ÙYjñ!°ú¶k¿[öêê:Ê±RvòÀzÒDê\"70±^Sã±ìš–ÒÙĞ­A³¤©FJíÁ¢‹Ã»r.ÊA¸ìÉ·F9{Î’ñU0T•¡:Õå.éQ`¶1\Z©ã^[5aøíx#Ò\'Š×®›n\'ÕïàíÔo¾OÀŞÛÂø8Ğq[¹ëvO.nwA®÷Ûêˆ°çÚú¶ğ‹\n Yãtñì~ÄÌÆ#\rNìxx¢¯ä¦šÙÔ¶êşˆc˜m$²‘æ1É`çïN¡]¸Ü¾ÈPÕ‘ È·+§©µoƒê$Ù–©W	ôVíz¬CÉ³³jÅI×\"·EüL¹²¤3UÅ­§wı4¹Ë…xô‰DÎÜ¿\\ÄK9e©İ†ÓTwv9bï‹˜6Çltåi3¿:ho/ÇÌ_’gT7™0ñn$Ş\'d£Ö™‰5…êgz7jÀPÉÜwõ‹ã›F¨Ä\'?ÿ7Ğ¶Öé ®Üê\'a^C¨ÄCŠh\rrDsßåğ\r}¹Éú2cdö÷÷BPa”ƒ´Ä¥èGÂÚwo<2\Zºº{–Œ²Å¹ãÊ\"É´·Q_óáƒ%<*\"şa§€û›ÓUÁ‰¤á\0ŸãeµĞÃGOS*–‹*ˆš?;Í@1g3w„ºõÕlSºPÜKQ-D“0wiØ¯Î@F@&Ÿá\ZÇæ*­â,mÈíûè=létğé¶sà˜ByD³ÔsÙ“Ôß”§Ú!ßs[¸‰‹`¤\nwIªomXÜ³agòdßgï9\\5œ…!ºFÆ¸ˆC&%³„½³Åfò/T&£¹€QæayµX‹*Ò2%š):½§ÔcôãÈÒôYTŠÍĞa]‘‰:öş¾Ï‘@MÆ|{u@lŸøğñ`·\n›Õœã±8è„A?†š7îĞ\'Œ‰:d§]Æ{¼;\'êÙ¥É-ˆòi”²¶PãıßÕ®l»«åêùÁü×Na4¡q]9«æÛ–4ù\"å|ÑÆl6˜\"ğ…‚6,KdËÅ-­|¹0ÓŞVøõÅhQNÔ¬3ÅKLÎì›êa#jæ¾/—kDƒ7óçÉNŸ¼òšMp\"2J«!!É\ZT|··Ãk_uÎs,£v½®«	„†kŒ²ƒÔ9p=Ê`$¹ì.xÛ ¤+İ¬dÎò&7dMšR&*€WÊ’9cçaÌ™óA¤úÿ',1460653191,NULL),(9,'C6QWXn6eXZ6q','phabricator:celerity:/res/phabricator/bff6884b/rsrc/js/phuix/PHUIXIconVi-UeZHu22VtQbm','raw','JX.install(\'PHUIXIconView\',{members:{_node:null,_icon:null,_color:null,setIcon:function(icon){var\nnode=this.getNode();if(this._icon){JX.DOM.alterClass(node,this._icon,false);}this._icon=icon;JX.DOM.alterClass(node,this._icon,true);return this;},setColor:function(color){var\nnode=this.getNode();if(this._color){JX.DOM.alterClass(node,this._color,false);}this._color=color;JX.DOM.alterClass(node,this._color,true);return this;},getNode:function(){if(!this._node){var\nattrs={className:\'phui-icon-view phui-font-fa\'};this._node=JX.$N(\'span\',attrs);}return this._node;}}});',1460653227,NULL),(10,'4JkVb4QRPhF8','phabricator:celerity:/res/phabricator/d0cd0df6/differential.pkg.js;-kTAjUcZTYeTu','deflate','İ}ısÛF²àïù+¨İ<(´´ï¶Ş$åØN­³‰“‹í}[¥è± aA\0€–µÿ÷ë¯ù@QNî^Õı\"óÑ3ÓÓÓİÓÓÓóı?§yÙ´IQŒƒŸ×Ée/“¶ª_ÖÉÕó2}YW›ïò\"{¿)ª$\r¢ûe…ëí²­¶å²Í«rÜ&õUÖ†÷ùjüı?§/úqš7oª4Sá}»Î›é¢„´˜Óæ»¬h2Ioò«¼Ğ»(û˜•m3;Ò<ı6»ÊKìKáç+ì}ÜæE¡:lêêªÎš†éd¬P×U\\D0À6_6³û¼y»İlªºÍR3‚ğ¾ÎÚm]İæeZİNqÈ?ä\rt\'Ê›Ÿ“¦ÍVkİd7—Y\r\rÒ°gå¶(\"©üN³M»F‹¼yU&—BN\0)Q“µ¯M’jì²ª\n…H]#ÆÔ9÷b„yĞß«Şêª¯#TXl7iÒf/©?ºBšmBsÊ5¨»qŸSÖ×§Ò›¼üX]gco²¸ôåMë8ç;ĞIL@æƒà¿ê¯\'¿8ŒC\'›iìáÁĞ#ŒH£vª¨Ÿ_\0­·	,±üÈêh¹Î‹4¼O+Ä}@§u¶i®ŞhÎ§¿ÓMRU¿¡&o!%ãÚ¡š=šûùîcRQ•‹e‘/¯cXM—@Y„¢Hw0£Y9¢1Ø“\rhæç;¯á}6½†õ2çœjÍøxb<†séC\n¸†.gõïëÇ‘Avx yâ+1›0\\ $Š GqlOš¢ıá®Û¥\r7ÁiRÓØ¡›ˆ:¡©¨¯³NŠ,ù˜ı!8±Û¶³W‡\'İW×$R›¿$·¯/Ã)´•¼«“²Yeõ4ñjµÊ–m,«Í]0×´fw¢Úü®D·‚µÓÄ{ûDEæ«ªc…<Oçyş¥N‹¬¼j×ğ}r¢°×deúKöÛ6kÚ1:ÏóÍ¯ö¬•Ğğ/&oÈ€¬´r¢€tëWë;œ—×‹ÏÔÑIÕ#uëQÒcõLÜj˜²¿Vµ±kT›P$;ÔyÛÖI»¬nTE…k¹»¨èT°àUrqÑ[Q°ĞSÑ £·\"£¡§ÆFO5ÄC§\n¡ƒµ¢Ç4«©¯fŒÃããÃHkƒõd>áJ©Ø\\VIv–—Îy™°Ô>Ò).ˆ6ûÔÆ:¡`q€éÏ6pµ œ¶`0/¯Æ¼€ K–¥Ë$\r˜¼Ín\Z“é¯l¯ »Æ© $Ç^)\\ä4’gÿ•ß\05ıúìÙ´E€¹Óön“vçåVs³É–1eÃ¸78{<„#Ì™–É\r`ZÿŒyfÒò”@±›Ù`QbÖŠÙØªßuˆõ3«ŠQS¨î½bˆq™İ~á’™¡-˜¿†f“~ºü\0¼š«còèéØt“ŞU°øöÁMş¯Œyo»-{]R£héÅz[^¿SÉ2¡êóø˜ø)‰,3üZĞvô:#”bĞİ!\0l.Í:Ÿ]Ñ ‡òï©mÏ[Ğı·Í8Pe™©+}Hé˜ö‚›ÀASµÅ¶Îc-¹Ğû_^sKØÈÿŞfõİÏIÜX\rE ‹efş³ª¯WEu;Öà¨Úß’2-²zì,\\‘2yúÜ\Z÷*¡º:&Â°{â{}À_¾«éÂ.‡şâÌóˆI\'CŠèâEeŠÙ3j!dü#Ïn®€«ß!>ø>êÂ3ıJ´üU;\néÏ{ır\0âf§¦g~ùNtl¨‰hóëb.ªw2®§ø¨`Kˆ†şA«sÅrŠ˜A2lŠ¬U«O :½JòÂÏÖÚÓ »ƒ¢<Ñx\n-Ãæ	+Ğ`ê=¶p–TÊ^6$-(õIã7ü-ĞúÖ†yÀâøA÷¿gi8ùİV#¼Õfc„ı‰rº\"?£oµqçcE…ÚÂUG#å\Z®¸¢´˜s´ˆ¢Ï©¢+£õë)äQ±p~YgÉ5Ï±UÄC•–À.Ğ¿:sÎ5{ç|»yÒ¤3$ª‰“îg/¤“‹E_î%0˜·8­÷xª5‚ú&c‰ûÉå½AEdc«ÖÙoJ‚ª…bÔ`‰\n7YV.°\rÌ\"op”ıi`£²ËI*ÉRæŸ*Ê‰Ó‚…~«Y¯¼+ÄŒ-LˆM¿iU5#ƒXÔƒ£ªä^‘É,‚:²¬œê<W¦\r3vFÎeQ]ê%àª0·Àß³±7Ö¼¾*SnÕÒ RE™ê…ış¢VëŠ¾%Ã‹DfVTİYL0íæ \ZšÅeã§(÷‰šÈ·²¼åR•\"Òúi¶&±VO‰^Â=bËBĞwƒ«L˜êKøYëÉUYõâh1²wµ\rMÁß:òVÀÀj²…‹øaqšC=Í“Á\n#	È´½?&5p?HX·7ŒDE¼iU¢İ(3”eÂ³MSXµÌóZ¶\Zª\Zî¹jÑNÍ~5…·ÇG\0¦9g~L‹j¢\"¡ø–‘{x%¸#”l%ÍN‚Ù(8áï¼\\Uj‘ mZ×1Î/¢\nÍU¸Ùç]äLaş7UÙdï€Çøğƒ·Yı1«G\\éT‚ÅFÕÄÆ.²Ûdu›gÍì·dFH\0%QÙ|Q$MÃiFkçï¥³ó£4\\èß÷\'½]\'›Líbû‘lI¡=oa´aÀÀüP‡n£ä½ú!éXõ…ÊsàÌ­³¥L†Ì9*¥Îg,0’T{ç¯›¼ÔG9«¬–ß€0)Ğ9W î¾ºIQ~Ûe–E–Ôïò›¬Ú¶Ú„¿B»Rö)îR8úm’·Àßc©\'½U¼w	WYĞuØ›#/~ITBä˜ã¶ï+]€7uGôøøˆAˆU\n&}[¤o-c†lF`ø4yzk)4\rs§[¾$Ğ3<`ÃÒ2HM“QÚ¡³qßXNÔæòÈø!¿Éq¥\r#Øúˆ†eº^¦-Œzà£œİ‘îÆFgÉYµ\\¥ı£ÆöA_å%`æn¾BŸF?h´Fv4…İ<q8rÎRÉ¡üFVìÖÇò’¡\nØ»MFÆ×UË¼ıç:¯ê¼½ÿÇ_O‰§`Å¬&ë%r—r‰3\r`·ÙXru‘Ï™Çï¨§¥Ø vQ‡ÈÍJ5tjÑxL8õ\0Õ–ïú‹¼ü‹Qy¬x~}qÇ˜¿¼Z;÷PĞåÒµ¢¶Ù_OO£•êóìì>kgBf´SaË—Ù:ù˜£$Ió s“U–¥¸&›:Cš&½Ê¯xw›P™“$}ÊI²ùªÊŒ/i\\@ ¿Â.óÇïwr“)méâIêwªÈù¡úv\Zë>\'pá|(\'¶-ùÊP­£¾,?Å8®DŠÍ’¬‘õõÆâÚĞ\0şV\rJ¬œkE zğš¨(%Fs`£	Éï	œ\"ÈÄo}d€cİ!}<ƒYháIR{|ù7š{Ğa‹r¤Ê„u\r9¸×‡á3Éßé$XO·VOxş1±Å©4Òî…„fòú1)¶YÄ™ñ?NÛuÙC>Òpº®³»f<Dlã„D´oN?T9ğØ(0ÆDi;µ±±EÚÚ£ˆÃQtdøb_g¤·=X­jÍ±¼#9ÁNÀ€Òê¶”©(Íh‹‚å:)¯2¿¬³{P8ˆ.}Ê\'`5Ä–bÓşu¶BõñuY\0½üÌ€aú}Kc-§Rˆ;r³ş8É¡sÎù#Éœ!•sr6ûíB[`«>5;6§ÊcƒÁì‹ÆjXËúN\r(HÈáÉê7gèîØŞl‚°cƒ$€İ3Z~}’Êóy[ßİS?±ğdò\Z4˜¹.0…½Á*şœXù=3¢+Dàƒµ³\\ó«²ªaƒ~¿ÛízO]{Fù7âNV\räî)P¦5s¸cï#äù^¹›¥yë5ÑÈŞ&+`Ëª=óxæ9mº,ÊıwU¸]Ãó›™Û–”GF‘.–YQ4ñùÅÜ–RNJÁFÍ\ZEËoG×Ue}ñ²oì8Âªæoâá†¾«ê<t<£&€Æ-È‚†Ï[ğ#,ì=Éêê|ì¼g>ƒĞê÷ŞzvÓ´tÒÅ8mj¦U¹\0<­Ûo¸Ô”>fòQd«–ª\0K³êäÍ›Œl9ßo‚YğS 4¤Uş)^\'ÒÂ‰ªvüÌe>hÅqY^Xåw°°y~ìü1Tn²×€^«dtv\Z¸¼ü1#TlLf¨‡[é¥E\\éµü]Mg‡Ód³N÷Ü\\šj«MÌã`kq¥=µØMâË€¶	§w_ó€Ñûn61dÎ¤Ï©òÍ†\'¿ ,v¬ÓN¨´­(¢ ]°-âbZfŸÚ·ù%ĞÁ×«ãBjÕvæñ±ÄÉ€)¬ãºpS{†¾!Zú±7ÿ€Õ[ÑæåùÕU]ß.ëª(€ş‰ÔÙ8¥ùT®¯BŒÊN éé§ˆşİõT™ßÀ#Ä›nŠm‡sèæô._RKÒŞI§-»9fã®j) €Fz¤ÒlÑ¡™&ûMZêê§Ùö¥DqÆàïWP`Jn•˜§¥\Zä XCs¶“1BïÕ™±Å\Z™0Èã§›m³îƒÂ‡\n}Ğ\n:ö9Dƒ&FâïYúÛSKö²ë”@¶À¥îyI:Ùd³k‘ÌPËº§¤†±Ç‰‘:§ÃzÀ0ˆF2ÂûÎa\'!ĞQ4dÊ“¶öÖ¤ÀÀDã¦êÊ«\'r…XoçèÕ‡E-îÎ2[¤Ğ+’XF@S·mBñ±H8şpz„/P³Y çy6–IØYÚoŞüTş‚ÒbÌ^²¯À‹Â§«¼nZb¥G1{,[DŒwí âFSy{m?<(9°jXF‘³©¬7·oH„ŒÛµ¸¥¡(0µH‘ÌiNoH‘{ö_/~MOÎzsñÃ~„_>ÏÏ.PÜ(Uï“ş¶LAt•è™Î>WÍ.‘LÔY\rÙª3TºÊÂ(ÑÏó5áºA$0`×§ŞTÛ&ãíÔùB\0¢ ¹š|¹ğ½í`ø\raøÛmÛ\"ñ<<8tyã8Öwœà¸ÇzOôåZ;LÚ}ü´É`PØ©àrÛÜ±m\rú `Ù\"š*Û+`¼Â•Œ+…ÕMü¦ƒf=-ã`NTÛ\\¡b~*çiƒ†œõ•£\Zrã‡—EJÚÎ×zl/æê8gò`_Qù½m>‹TÈ)ó]µ]®Åá²—¬¤Ï!%kş”¹Õb“ÃÓäuæñé=ŠcW;×õH—‚\Z„Q_z(Ëe¦bØí#ò¾4õÊêÎê®6¹?[åËìÏáÿáá¨§Ÿ´QŠé¬±¾ëf	uò.¢l²šw Éî«\n´Ô¬ŒÇÕ\nU1hÅTHTfç	a„\n·“*T¹§ 6 ì“/Ô$áFûÇ¤æHL@«’$#Ô¾í³XÎ»ìfS$xÎ’Ïa™V&5ôS‰[~öÅ’Î½~9ÖÔD9°ËÎr9´ˆ1?dŸYƒc#\rÍßœÍN¹5¡ç›Ğ%2\nmåLN¹ñ¼B2\rb¹\Zìr\07µ«N°¼Ñ<M€•¬Ïe/{w´Of,Ck²oõ\roÜµƒ[kvÛ3²ºÚD™u©‡¥Ñ¯±—ÎŞ}Ow¸ıWYp§HÏ‰È!Ÿ\rğ=eL‡Uáı\Zi@²qÕ™ë„èU^Œå†Äƒ’:p	¹¬àšö†ö×›{°n¬*–ÕÛ £ã°´wL\'\'yND©¨Ç1ë{æBƒ\ZÄ˜	Ì‚Mi,6N4ãºäœ€Ù=Ä¾“b¡vgÈì)TñÛGœ¤eÒdAš¡L0û®ÅU¿½¾£º6·EWµÕ!ğAÂlâ ÎVòm— ÇqÍ–×—Õ\'5›+4æ3AäåfÛÌC˜ÆÚêêªÈ^H³j‘ê‡1ì%…°äK¬Š›ânA¾Ïd¶Sc£ô@‰W¨\Zs«,\"WéÚ§[#~	|L†ßÖİ\ry#iÅ{èÜ·Æ*ÛÜÿK9´i±dSæK<J_š_ğÙ¦>KZæ;GÔ9¶IÎ‘©C7¡±šG-ü`Ê,i‡FŠ¨ƒÙ~W	VØyLÀï†æğ®Ú€^tàÜ³³H¯jøÉ$H‰¸Lfg»pß-³óı’²778©6ÚB{B‘†2MÈÉmW©t÷8/ù\\¸Wlñ´ãZàİijÜÊné€«8·(q‰Z²V:©AèT·æüŒWŞVQŒd˜JFÓ® Ä¬ÈiOcüÓG<½«i<qO·ï7EÕ’1ÏxÔz×XÈ–);”)H^i6Q±]™Z`Ë`O©PÙ1 T<–¾é•y|LµÏÏ.Â‡şyz!œøc|ÖV0ŸÏù8SÜ!V¢CJGÌ©Êx6”¸\'C^åˆƒøÉ;9\"ÆÇ¹¯á+Ô£%3¿œãQ÷¤ øW;ÌÙ7ˆĞ‘iåi3S8ÉÓ]çÖGb™\"¡{X‡’>íÊ•TBå¿c¢å3\"\"& ¡y,3@ó˜åÓ¼mà.ÉWÓ\"lWñãê‡(yHÕÚÂ* zî?¦½Jšª@t\nø\'S\nŞgJ…s²¹RğOÏñ	!İí<·ŸJÎJÍ^ƒpİ \n Ed=FPˆW&(ì¾ö×x”¦öÒnªÍ¶ ƒäÎÁlÇ¾-NO¶\Zòúeÿd”%-ø):\r™:a’HÉ&±Ë.kÏ·mÅ7?¡IJ&?æË¼Èÿ%BwÊùóş£uµ¨dˆÛ¶\'Çn²Glu|È;$¦cUÒ¶?Kƒj84‡ãw¨5ãnHç3â(xoûjWCô•ã«‡Ô/äç²)L!ùMnªzŸĞ5Ã?ÄHú¹H°Ÿš†öq¾Õr#úÔN8\'°ğû‚sX©±©H™²vÊ¡íj] DËRã\0 $~8ã4¦¦1•Mn]a;ÕòOI,«¯âÙ&èö»ª*Ú|ÃŠ¶FİwaeG.Ô©\\o;¶¶ô¢–[s%·’ó«2ş“}\ZfÊqà©Sœ{›§í:>ûË)Y{q1yˆ\0àqğç!Kƒ¹ß‡ ©¶õ¥Ø,ôÅ0Ä÷\Zâ›ªõıãPß8P_}Ê–¼”÷~Xw0ZüÊ)à Ày6Í\0œİ0M25O¡Ø‚ÁœQû×ÓÓ9ö©×£4œâœù½#¨¨·‘J8$FJBôˆ¦:Â\"óMt)¼·i¨=—~jÇéQvb»Ç$\"~Lê$Í«>o¥ƒe	âœ tÊà©P’~Ø6­¶c‰šŒì”\r\\™;ëÊa²<Ù…\\H¬ôY&d²×éÙiøul9ÙÒ®³´¹lJF—LÌ[êKºÈİe\'oÊNó†#yê—¢T/; FÆ(xxàÿÜúW¦á=gÈA1‘5y|Ìª€îV ?‚ù£3¯Ì–äHhŸŠ›3yŞÁbqµZ¡8RÇºş$³u§À÷U#wE:¹UjRP–n6”®jÊ­n>Å‘´•x°yÔ%ğ;ûFIg£©ô<¼H*ÔàÆĞ‰\'ü7÷ûBÛ>õSeàovMjuÑŠU³\"ÃQÍ¸–C69÷¼«ÆœaKô[9z×²åh\ZD6\rLÎÂıJSd¯.˜“³ğÒLÒTè&«›	T,—CÎ”é]™ÜäK¼~à\\ÎF ÙÊµ¿Ú4±›s~}1§t´e_Ï;7~®³Ur9½ÜæEª½¤ÇTÃ¾S é½ˆƒ‚z;G>l	­0‘®1Ó¿Ä<ÕÌ¸˜|EEr	,DùƒçÓòw¼$è\\3ô\\Â=‡üqOf;.\"5ñ–‚“êÜùÇw+l!c“[‹{Ï= ßÅºµ]İTŒıL\rÓ¦åx¬s£N‹ØMXtVº™0ñöÕ\'c¶½ÌÍãõ:»£¨D“r¯¶öRîr[7UOÎÜÍD3·|„«rq™9n»&#+-İ\\ñ]µÜ6öİ‹å Tâ6t¨Ú2Ê²IsXl\n\0ÉœsY¥w\Zğ÷¢o‹jyİŒy˜<dÀ¡Ş´zÎå.¬3…KŸŸ÷”ê&]ğ^›–Ÿååº¿2ó°KæjõxHºš“!ş~Çg®ÉH©‰XÔÁÉ(ÍJ-8yL¢È0ÃnãK°ÁæœÒ\"D ÉÙR±5Âc‚R^<<¼x,°Û+Ãaˆ21ÈŸHÈ{î‰4ÄxY:Eëğz||$å~(˜°4¤øĞHİN½-€ÕŸ}úi¥Ì×äy2GP§{J=¨¹Ç‡Å‚$¼ŒshÇŞ…Á]´ëòˆ‹Iù8öõ§*RiüáaoAr›ğÆËÜÛ\\”)Wø$azÃÆƒˆ¢¬F˜´h«O/xœk¦lÂŠä«²:Š„Bs¶Ÿ¬µ;KZ¤ãÌm°”¶¸\rÎ†×	ùæ–Ö¸ådÄ¬¥8ö˜¢j\n–¶Òªì®S¦™V€Qò…æG‘8Åp	c]±ÇÇªÚQì\"Üœ¦ûìÛ:wÙ¸›}v1—i5\Z?ôùÃW5	ÖO¥_1r\ZFÅĞdyêí5ï0@]—i?áPÂˆ•õÕ©ÚÂdé×±á¨0€Bdª¬	mÔ§’ÖrĞ­ ûÂ½cr%úñ‹A¶¦Í¿Ó®Îä–ÅåaO™Ï’mÙ.nPµ9[û©-úìÜ[¹cóÔâûw¾hS8ºq¸Ñ.™ø/ƒn×™71ÁV&ÁIGV³1,ŸÈ ÿwÑ_Ş®«º]nÛqğ$á÷@ç£¶\Z¡6?’Û0cŠ×¨ä=’æOgtƒ®„	Àp	ƒÍ][Í)ó×g599¼Íïı!RĞ§\r0b±rp›ïçÓÛ<¹áÒ,¯ª‘:¸{ê°ÍûÀlúFş{:1ùœ^´V/Úu6\"¥oT­Frı¶y´¼W\\ŠÕ~AãÆ\rÉwi\r]zÕ’M=©GÙ§\r4N½Ã)¥y³)’»Ñ8Y¤â ê%Çˆ5\\ëáá¨«ê\ZÎüs„2C`şìwèÒ;1ÖV…œ&ªqİÃÑØ+XOuNYÉÅhèŞ,:ƒ„=7É07û¾ãØu€M	ú5«6îmƒ^Üõùğ-ña®‹G\'ä¤ƒô©®Ì¸JPõSôå¿òı:”&qîĞiêí9ù]ÈW®Ä»ìÓ¿pÜ-İ‰¬“¬Q½¼¼\ZİˆÛ3j7Ø	¤‘lÖ5,ş	F‡&³Æ|àQYŠÊÀ6Ş¾§)ıW‡išU@´ñJôN¼I}ÿ]p²\"—Ş—ãğ$ØñáÇ!4tìzÍ¾oó‚Â™¼UXü‹8Îç—hê16âL›íeÃâN#Ê–)Â3—Wç0¿î¾äc3èÔ¯å¯ep?‰%¸}h¬>Û·‡÷±Õù×áá±­ÈØbÈÃ òİ½õÕàU 3ÏÏ‹b¬çíÔp\rZ\n¡ıÜ…EÅ]íJFmEM1±µÔ¹Kº~íâóa›Kg>pƒÍŞ£Ú-Â\'ôÁï¤¢\0t^£K¬ÊK¹³‰î:Ö[uµEU>]ó¡$†÷T­¡|\\BdKw©8’BÊ.Úü&«‡aß‘ÜÅ5ıXó­c<´W!tã&4ºzqG®`yo6b\0:á\"‘!iÚ­ gIS´}Ô¬kŒ¢•ÌğÒjTËí—ßâÒ“4,¸ÑåÈ³ƒ«\Z÷„®ó\ZM8È‹Î‚ÜX%OLflcÌf²Û*ª6_ªq®õ¦jA<½©0ğÜ¶ -GÛ’-cªs˜Æ%ÃH Ùv¾:fyû¼m“å\Z×ò½7\\g|DºC=cQ£‡1±?iHí\Zy\"}9`` ¤ ˆ¶fÈjªi€ÃÊP×Åi¸(°Gqûé¡ºÉùR-½\r*×}o³Şæ,2Áó}®NWÉ(8	VÉ8mV—èy“—×£=Kİ›R°‹ËádÁÅÈO×ö!Äx³5y\\1Û™‹Ë\")¯¡¾îxh\0$Î‡Ò1™Š\Z\0®9}4^xÁŸƒ!h‘…>®=jn’¢]ÕÙ´Å¿	XX3Ğ£Ğ@>òupi¯ÅG°v‘§0RùkÊï\"À”H{Jp·ÂqÍ¹4‘=DvI`xJyE`¤öp²C1(ˆ€‘û>T‘§bt`CT=¥fÂƒfëˆšœÑßİ.â+êlø\Z·˜ÙùZØU\"È¹†ò-6Ğ•~}U#s’.Âµ¯”9Yw#®Qß;k•FYµæ–ö÷aW|,•Ìd€È¨ºs«¿L)Z/ğÀ;¿Úìì)<ÓêyOä)Ç½]Ë£èä¤äKt\Z±GË3G<R’ˆ´(û´,¶°’LùŒh$³!A¸3!†O#õèô1qg=zØõ9¾uI<Ô\Zß\\aúå,9ŞoÎ‰8T¶™dºÔh7ì’b§ˆG‡¾tœïüè]½âè¿S|7ã1´SğGØ·n÷bJ´Ö=¨’HwOC–ïĞ!·kiî‡É´k˜&şÂÅøC1/zÕaÓs0)Åb]Ã§•­sİH§‡	ç6»±b”éaG–şL°2€u³W¨³MÕà¥©»É²®š¦ÎÈ°±ì:Q«W–wšu“­¼î›“e,gäU=Å‹V¨°›1ÈÂ¯åtÄh@ÏîbªøÍÿ:›ı‡{ã-€ÉSH`ÍØ¹8¥qhWıÊ:\08ëË[¶56¦Q\Zÿ›\ZM¸X˜àBÁ\\ü}L_ğ9‡_”bVáÅM²‰ïËå, O bP|Ô¨à+áĞÃå%*:@ğ9&ršu°˜‹OP\nÜUÿ™\0çï›Ofj<Q¬K-Ñ(`¾Š]°_/+½}—™•g®ãš»-5é¸+œiŞãè[İÚã„(‡…êyBÇÕağùÓˆuøğøXùjuÜÔ´†#\'G0ØïÄéRš’1|Fæ<„èDĞÇóxğ†kV¾Ş±\\»±!˜TØQĞÄ²‘o@‡Ğ:¬ïƒşĞfïlº%˜eÒ¥å~wsY©7d§h€½éáAÒò²Ìj4BA|\0fø\'ÒD!vµ\"bÒÌ…:3Ÿ!ªÙ\0±Œıi/ã%V.|íÂf€ÏŸÕù˜/ÕäŸ//D¤—Çb;ƒ_óä6ÖIœ·ÎA8¢ÍDò„‡>ç}¼hÄp$Aõcz=Ró°†è±(¼öæ |<—gÎh¤\n¡Á{ÛÀÄ>ã‚Ï‚şq<ÃûıuQÉÌ{\rË0X…üØ.’ÆŒ·‰9Ñsá¶Â£ŞIuvC¯L0xÿ„jÙÎèpàùœœä»ÁE¾\Z—ºà¿cS¥eVâª¦½övÆêm=;K…ÕPç)Û \0Pk_ûñqç{…:×É3¹òÚ%ÕfáªëÊ«ÕËÁ8¾BåkQ–p°ä1”}¸&­;jQËòöGäÒTíIdVP¦*Ú”+j†î]Ûz ”ŒkG÷Èëö¯\'r˜[@õÍíkÌÿ”pj~\n›9nQ‚zä÷Õ“ÈÃİóµ?´&Ã\Zâå|Ã°·+¥Í0„óšNÌKü EŸÏ¦My\Zª8¾ª†„İ-^ª£xä†ÿà›şãöûäxİ~Bòåˆ-…ø¤ŞŠP´¨7¾Íu¾ù	Ô\r§\'¿T·Ö[e|x)WMá÷ñ1_(xÔıM‡ÕpïkZñåğrP–™ÀåØ}4¯UªĞø&”A©ËË&S‚„QêD<¤Š8`N³â@Ùfô0Óo	pÉ1£59ÚAhÜ8_¿Ô™v…0BY¦³èÔ)|x±•X1á	¢ºÜÀ*Õ‰{Àğvô\Zl…f6™Sîì¬ù,ªÇ\Z†[³Œ|º£rMÑÖ=”oĞ\\ó\"¾¨o½\\¾¹£ä´i£¦^F|€7àT‹Ø‹Öw³ëºˆ\Z-×ÄêP.êğ	`zëU KS§ô-¥˜êRB|É°œHV;£jk&iÂÖc¦NDj2ôEE|¿Íº©ã6Ï¼¸FË#Ñ!imcCó³éŞî¢í{÷f³5”§´ˆ›á3—ÎÃ2ŞèÆæMNÍŒ¤d#ëÂË´ŸÏpCta<9~£Ş©5-ªãqnåŸû rºxlˆ,S^I\\¨§^\ZÑ~ĞwçøÔ¶!^\0Àƒ&É†BëšßîÅå‰oHYïŒRì¹Ş,Øá;æTĞ@ø[İbjòVœ) ›÷s—®D\'å>¼I[‘îÆ“j«D¦—ê¾²òÕuıYtçCüä¶TO\ZÁï±\'Ğõ/	\\\\mâ‘¤ã±Ÿˆ~ûTã~l°º³Ø×˜š??EÎ¥6öEm×eCöšÕ/ê-ñašbø¥{MSúUÊTC58d$s¼â™YC®¢Óc´4ãT«ÈŠˆ:án£7\0ÿRÃi¶—7y{Àp¾7q@ç¸ı®®n¾«êOİ|ÒuXóëŒìIè1XõKãY7„O ivÖ%}ƒ·½ô¯8°~0*‰¸Ò·we»ÆÀuo9ñÂ\r´jâ\\p³ Ü!-¨á¢ÊMy·«×³êT	{ñùĞ$0ØJGFså	›oLï™­Úo4u$–ÄÁÔ¾2nÍµ´7Ø:PÕ|„¨±Áv%i-^Ÿ\0äÆçyŸûoòqĞ7™e‡td¼WGbàõÌ·>²ftcÇÒc­*AÒh›Ù>+Š+Ò» êÃ½©çZ_>åªÑÙ\'×e†]RÌœœP²Yv4Ğã97Ë£b,ÑCÅ‘şòÕÈV3º½	7·K˜^©ıÓ7ºòö)ú7,#U…ªú´V(_P[&P­ÕZ+]Uµ6)óÕø$Í”Uq|]óÛms×GÁfÇ!Î¶Ò‚(í<˜x€Àç°Ö\\²Ä¾×Ÿİ>uŸ7oŞ³‡®#ª®{Ä\ZB]W	¶ÏY¹”¿ã¶†1ÄÖ$a?ŸrõAâ²¦Âö%É>åe@OÙ‡BòSvñ§ßZ&KNQ5™•Ç\Z‡ÙRè{D*ŒìĞ(\\óÕÀ jW½>)­\ZW5¶)9“™È¡†l1€–qÇÈTf:Ñ>’§»§`¯_QÒÂ]9S~éÕÖdv‘Ôî‰\nêõ“Ÿ;ø£ºXã(nHG›8òSìhİ ªôaºÚ›äiõ*o8ÄjtÔéÈ!ÕiÿE@è¡Ê¨Ò\".K¥˜“å1ÅÏÓ!v;eE»£pa±6Ú;Q~˜×y@²R|”‹£u‰ß€#ï-ñ\"‰Ä@İô¿ĞÖ;õ°±Åq6ÚÑoŠÆ-pµT‹4iÅ’ÆÒe¤“¯YÎzfx(@\rŒ-ø¨³\n±Y¹Á?ˆ¦m\\Û.øœ`ñ²ÆÖ9Ë“br™Ã\r²Æ»Ë®\nñ-êÆßÚ£Ù”ÃºáMˆÊÄ	Mf@~ø\0 ?|ø\nóÄ}ı\r‹ŸøÀ1òâk­ARÎ•ûB‡™îé CÛ{$¦ 6×	¤ñÙ‰¢½?ÆÌ£Q\nÜ£@ÓŒ\nÄ[½àÁJ4Ë’Ä^ì  uÆşÄµu(Î\ruºÚPÀR/úfJJõ<a{Ö\rnŠ»JgeİÀ|.6^•|(f®F¨P9şöşõ?_Êş2ô@Ø%ÈzeK>\'ô¡Êõ~r/ §ìrl„LI„Ñ4á¹SÁ¦Iüv÷T³ÛÃ§ ÎKH_x3&We‰\0nL0{ï8ñ! 4/çØúDN~UrmQƒì£nIGdM—¨C‘ÒLãŒÑd¦¯ÏÒ³ŠZYÅıX)® z!=>Lr\'¿Ë¶CÍ<m‡Ú‡’Ş0ßë‡%õrzı2ÜjãQa:t\'ÿì\\t:xöqk7œ+z#lñ¥pŠaòd|‹£l”—£—Êá8\rL{@¼ÿåu”J@ öF e”iRĞÆŸ«7:…ê“Åæóf —è¡yƒ^ÄæŠ•Ç& ¦>3c{‹dÇÁÙvC{hIşßBÄ&ñŒU@R\rK%¯Î$¦çÁó!ã–M0ì7PÍ‰ãı‰À,gÂ:3±ê&£W’«÷Ññ†\\Uâ{Õ‰™Âœ1»ºuğ¬Éêù2k©zÏ`î	Tkµ‰ëª×SUY\"wj<îŒz0J,z1>Ÿ€Ùf[{¨ÕîP£çÍá(ÕÍkœj8 U×<«t=ÕÕÿ¼ºHô–}R·˜àƒT²ôß‚R1ú%¹áUÆÑøÈ	ÕúÇb]ÎÁ è|¾)ö\ZìB³Ìğ|!G	©Éï\'ˆ\nçT¾EïĞµT~Aºõ¶Îz«ë\\Áš±f )_é†(ß•º÷•^!âkÅºÑ?¢?TÉçâŒãR3á÷yQŒ^h<—¹0/¤q£8öww?q)Ûß_õì÷Æ_VçG8šrÏŠôTÃ\'œ¶|‘2wiÿ‘Â}2I¥9’(fiƒoaj¸z¸H0°[èpw’©ïË|•gø–«~ã¨Ötye|káòn‚ÿ	Ê0õz´Ç6}™ ØªÅ#SÉÑ:r+)\rÚÑ;Ru`ˆa Ÿ™]­[(6S‹æë3²f|ùjüÄ<jaP#PNÈáht›·ëİ9ı©ìO£Û¤ÑÃ>Ègş$/†[]9	¦\n,ïE»á8>³tHÊ¡G†)u¹ûn“‡Íaó4¿âP‚ÖŞyQ¶ÌA:tG4šÒ½MVh÷Ğ{¹ÿ07 íA8ğŠeï.ÚÙHFz?úH¤BK{~º]åQÒ®nŞç;)£VD½£øÌ¿;\rdàÆSØÁ½2Í¹Ş)«¹·>äÆ‘Z1¶’êxÇÔXmq2OøS¼ØÙ£É‚H4¦ëÀ‹¥P„rBùŞ-i·¨N˜€¨¢¼Çm•øCÇiì¨ûmš/s!² <-°­\n·5ä0|hH\\_ÉÌŠÖ¡ñ•+;tß£ûö¶“Nå2`ª´Û’ı‰°“úá®É*esDíŸ>Dìd˜Ò„şÙÛæsëb‡/Prçä>-]¿á$Oi0ã\0å…{5ÅÓ.ö14¼(”t€d¾ñwIşÒ³=Ï{4¬ˆ»w><YÏÿyzòÌ‹T\'òzŒñ6§­pr‹GÏîğ·\\ã¹9ÆÍ:_µ?ºñùä£s+>ô…Ã²Œ)²œ|×b‰F³SjÈw™L¶Í·w$eÜê.ÁPeŸ`(/\'\0ÚÈÇ¸­~¨n³úEÒğ‹	¿Ø*N•æĞœû¬ªËüû¥h¤4½ñ“ı@4k¿ã©Ó·ò~fb…±sæ¬œAÅÛÇvco[Ñ½ÀŠ6°‡áîxD¿CmŒû~àîø>Îıh[·‹Î©A•“¢q{àÉÍõõŞ\'ß·°a–›ë½Õ¶äºØæîKâ½¾çaóîS`}Ëßz•»—‘_gw±7,«ëEßNè»ÿ`çG\0OÇÑqµ‹½Å«Û´óÈTj”æãã6=>¶Ş£MC¼\\bÚ%=¶Ï!\r’©Oêè¤«³©¸5Şc4ûjíJ¬ò ÿdkŠ ¿ÅuÅ»r¾¯İpzCîàİ[ q35ôE¾Ó‡şÛò„=ÜêK¾×†İ]ã*ƒlãı/¯åqqõ©³W*c%I G´Y³I–ç˜odVÛ1L<eê³ÜÂWŸ’­öàœ«¾$“÷òÔ9ıï¬++Í9WßPA¦[.³Ùi„5òÛQ*SXª\"Kä_f`:Ë>Ò5C‘om(µïÍ8§ÄÊ\0Ğ½ 2²GˆDÖ+W·5\'iŸ•ë_®SOä¾¢5Ø°C\ZÓDŠC}¿–öÄç®:`ŸË¶ñÏ®Ÿ¿L(éYÊÉ…§êädnLuqĞÊØˆrB»;iÜïè¡\'¸Ï`Úëb¥œG#·O¡Z3d)•¬»ÕŞ;İE®ûï=~|øT®>»ÈŒâN´uBm9ÔZ\\Áæ¸¸vìĞÃhå|ÈÓß¹s,í(üêr8J4WtÇo¹ØCè\n\n–ƒÍG}7åÿ+³/¾ê¶\r\r$Ô4ûrÜ©|Èµ×Œ;[½PÌ¼iprGƒÓP¯œázß€ûë)¿O÷A¹BÄ6PÙ\rI*8˜Èoœ`\nŸr¿FA”,–À63ïÎ±äÒ§7ÑöãfìØsÌ6\'çt^\'W7ætù˜«õ¼kê²š~M‰{vŸ¾\'\n\0œ‰Š··wïvIŒ®±Aag®ÀuŠˆßjÕ¼€g\0­ÖU/,«ïyá‡*øŞ˜ÊĞ¤ªp¨°jßˆ4lK€ÔËïÑıv‡ÆÚáb=—@Q´kµ&²Ä»¯Ø<vË’òø÷4ÊÕÊ€«×`^·´^LZ„V­oïö­bR Tíûr<}o3G`çZIs¹ÔUKPÕ`‚Q¿ñt\n\rTxQJ†ç˜dÁ¡_´‡µ}İV› ü†?frºÍ;o‘j/ªÅƒWgÉ¦>R¾÷TM­evßâ5¬«R›ú¤Õ”7®÷¾şkTßN»=€¼†Me¦}¥¼õS÷%?½QN®ø†Å*Dë±˜y¾Ò©G±§õ˜€bÓ\nûeébS¯ù…”£È¾dÏP×Î „ò¼2Ep]c¼\\«Pšß¸e^ŠåHÊ4-ìïâÿñ?9bj™%õ(,K¦w_Å\\&4.ñYkSâDõfz~Í5¡ÙéİD*Ú7œ»ãú¹jœ0ÅR®Ûñü¦¯ÜMÆcz36¦wÏşZA.©°é÷Øt\\—K3;Pá÷Wª¶<g‚¬3ĞU{´:*\rŠuëÖ®µoA—š¶Ó	êtÅ²ŒomÄãi†yĞ3ÒyîgvƒD¬ò)2è‘7<v;%±Ø®=ú.²Ù·Õ–•	öğæ–5‡¾íæ£ñTTpô2¢^ûa\"tóëcVÍ¯Jœ€Gın\"vø¤{ËMİôé/{ÀÑ†çİ­‰…AÙÔÔÏ¤ôİ*Ã6”«¦Æ4ÛU´2+°-á×íU\'Z8	ô—âc3ºñóô\r-{ıU™­\"¡óÙoGäú²Ô>¦Ïö# Õ^b¿Õö\0',1460653227,NULL);
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
