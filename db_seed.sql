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
  `isLocked` tinyint(1) NOT NULL,
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
  `serviceClass` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `isLocked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  UNIQUE KEY `key_name` (`nameIndex`),
  KEY `key_nametext` (`name`),
  KEY `key_class` (`serviceClass`)
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
INSERT INTO `auth_providerconfig` VALUES (1,'PHID-AUTH-pt2plcm6qbrbw3wtmvmn','PhabricatorPasswordAuthProvider','password','self',1,1,1,1,1,0,'[]',1455342729,1455342729,0),(2,'PHID-AUTH-z4ru52daoq7nfw6ak45t','PhabricatorLDAPAuthProvider','ldap','self',1,1,1,1,1,1,'{\"ldap:port\":\"389\",\"ldap:version\":\"3\",\"ldap:host\":\"\",\"ldap:dn\":\"\",\"ldap:search-attribute\":\"\",\"ldap:anoynmous-username\":\"superadmin\",\"ldap:anonymous-password\":\"changeme123\",\"ldap:username-attribute\":\"\",\"ldap:realname-attributes\":[],\"ldap:activedirectory-domain\":\"\"}',1455342772,1455342772,0);
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
INSERT INTO `auth_providerconfigtransaction` VALUES (1,'PHID-XACT-AUTH-hfzfvvdxwwfssgp','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:trustEmails','0','1','[]','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(2,'PHID-XACT-AUTH-o7wekqcnlhtcyji','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:host\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(3,'PHID-XACT-AUTH-2yys4jqz7xfhw2i','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','389','\"389\"','{\"auth:property\":\"ldap:port\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(4,'PHID-XACT-AUTH-6qinuqborktxqfb','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:dn\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(5,'PHID-XACT-AUTH-byim7tlvnw5xbuf','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:search-attribute\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(6,'PHID-XACT-AUTH-ishbqhyrk3nbxlg','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','null','\"superadmin\"','{\"auth:property\":\"ldap:anoynmous-username\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(7,'PHID-XACT-AUTH-4gbezvmlzgxwnrz','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','null','\"changeme123\"','{\"auth:property\":\"ldap:anonymous-password\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(8,'PHID-XACT-AUTH-pt7undk2p6dkesg','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:username-attribute\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(9,'PHID-XACT-AUTH-nedknbzvdkqrl4c','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','null','[]','{\"auth:property\":\"ldap:realname-attributes\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(10,'PHID-XACT-AUTH-g366x7hz6l5n6ea','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','3','\"3\"','{\"auth:property\":\"ldap:version\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772),(11,'PHID-XACT-AUTH-nruv7uaoto4f7nl','PHID-USER-qgpjve7vgfx3hhk6azae','PHID-AUTH-z4ru52daoq7nfw6ak45t','public','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:activedirectory-domain\"}','{\"source\":\"web\",\"params\":[]}',1455342772,1455342772);
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
  `objectPHID` varbinary(64) NOT NULL,
  `tokenType` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `tokenExpires` int(10) unsigned NOT NULL,
  `tokenCode` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_token` (`objectPHID`,`tokenType`,`tokenCode`),
  KEY `key_expires` (`tokenExpires`)
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_general`
--

LOCK TABLES `cache_general` WRITE;
/*!40000 ALTER TABLE `cache_general` DISABLE KEYS */;
INSERT INTO `cache_general` VALUES (1,'KfK8e6XQsQaP','phabricator:celerity:/res/phabricator/8bdb2835/rsrc/css/font/font-aleo.c-7fvq7wpxrde1','deflate','­’Knƒ0\0÷=E¥,RSó­,šå	’ƒ‘1MPÕ»(eÅDağÃš±¬9qYê‡¿Æ¯K!ÚÄú(­ã0ºb‘ŸuÂ¤È~µn&¥TÇZ¥I£Ä(¬Iu¦Š´T$ó3ŸaF‰ê¶¼iT%ˆšô~xzì+Jm?Œô¾+7ûéyzxV½·ğÒq2Ì²ÂR·ZöË¬’†œqßóL”WÉ¹7g~,bŸ…®®©aI°Ä˜1ä	_ëY¼V\rşwIAÅq\Z¡‰¢şÌwÓjNÖm°ìï“qc~‚„\0½=¾r\\…y#@­4¹öˆ,£ĞppíÆÿ¬÷•™ú4Æ$[ã¤¡‹4 ¦Š{ûô zã-S¢ã`¹Ò',1455342687,NULL),(2,'f2R.vANEu3rE','phabricator:celerity:/res/phabricator/c7ccd872/rsrc/css/font/font-lato.c-Dj4S0TLFyL2d','deflate','­–Ín£0€ïû+õ@#mƒméaû\0û•fR$\'DÆÙ6ªúîIZE«dm\\8 lóøfÄ#v[¿D©áí|µiía•ı–¾Ëz§W{gïs}¾{–ÊµzXpyÍjƒª€Ü\r!9¼zp[iû|Ì‘Û!äxZ:Xï­t?¡ó‹9“ıºkÛ×Å·ïŸvn#ı}Æ€Yv;ØúÃ²Å«T.dƒ‚•‘Ô—±¼<.Ü‚ÔĞa\näãJAŠŠ«H„÷W	ŞíáoK+ÃÑT±”şÏúnœ8¯‡lñp”îÚõ³_mÇ{šêıÁÂyæı1MÒJ6„\"7=·^ÚVœkE…®©8‰ƒ¦Z‰Úh¦Bö‚1UĞªl°bù‰~£…Æã z†©vîNµ³iPi¬u`Çª³&àæÄLs˜I‡æÉ@‡ÊáˆLór¨5U’ªˆ%Lµ’HQ°ELşD\'K)kJA|9â|#çë•ª¡´nL¨HGhT¿LÊ7‡™†PNˆ5‚pšŸÀéPt,ÆŸ/ôN#\r-Jú¸ $ºÊ+¡€	¯íÒØ§)ô_qÏmô/',1455342687,NULL),(3,'G_.240XDkwOI','phabricator:celerity:/res/phabricator/9cda225e/rsrc/css/phui/phui-fontki-hNxQ60x.0Uyr','raw','.diviner-document-section .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif;color:#000}.phui-document-view .phui-header-tall .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup h1.remarkup-header,.phui-document-view .phabricator-remarkup h2.remarkup-header,.phui-document-view .phabricator-remarkup h3.remarkup-header,.phui-document-view .phabricator-remarkup h4.remarkup-header,.phui-document-view .phabricator-remarkup h5.remarkup-header,.phui-document-view .phabricator-remarkup h6.remarkup-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup .remarkup-header{margin-bottom:8px}.phui-document-view .phabricator-remarkup h2.remarkup-header{padding:0 24px 8px 0;margin:32px 0 4px}',1455342687,NULL),(4,'i0dazEHxf.Gq','phabricator:celerity:/res/phabricator/ab7b848c/rsrc/css/application/base-PTO0Tc6dClqX','deflate','­”ßjƒ0‡_eĞÛEò¿¶wÖÒ÷0zª¡j$UØ({÷ÉÊhSã a¢r¾|1šI£±ju_éÚ¼%CS(«Ëb4u…îQı„TQ^jk¦¾º=÷N–ğ•<‘ªÂ^)dKJŠJ”\rÍÉ‘gÇB‘sÌˆj\'¤`ÌvR8”Úô¡“¡<#‡™Çlæâ`ÍY·ğCqáW]İËïkíµ*:3‚EÄ1T¤rëıòVËĞ„1ÌËVRáô?sâ”I‘ú2¡´HsŒÎqîwTš^OF¸–4åÔT\"”<Ç,Ü‰Pº#r‘î§5¨4­±û\r((ÁÿœÊ|Ì—­ÀŞî·ß¶Ã)?³¿Úæ÷ø\\ßï',1455342687,NULL),(5,'u3PGH4Dj8lX1','phabricator:celerity:/res/phabricator/3010e992/rsrc/externals/javelin/co-ILq98pGCN3DS','deflate','…VÛnã6}ÏW8~0%Ø«î¾ÆáE Z,Š\0‹\0®aĞÑ¡I•¢ìfı{‡CÒ—XÎ>ÍÃ9‡C&«FåVh•¤­X%;¡\n½ËÒÖpÛ5íö*ÚvÓ-3W¥–…PÏ‹ŞğÚic«\r{áxóßÎš(¶á˜øáiæäù!ïi\Zo¥³ù4zÒ£Êú|³ª©Ë„™çfÃ•­Ói7í²•õq\r‡<.l²Ri»Ò&q;‚~\nqÛ›^rõlK0Ç¡2VUò5Q”“>ÿ™óôÂ® Eİô¬7D¨Ú2)IÚc[ò’m…6½ÆøI(aÁ! ´XÜİ_,èéçÛÛgDMjVğ‚®˜¬9*´r*×q÷µaµåfÁ·ĞK_|´­--tmÎ¢p/¹ûó„`õ‚E–2)nèõµÍÀrï=\0µ¶Cí;ˆv%³i{^Œ­¸ä£5ÌæzC-$~ù˜¿F£(e†³â5m}r&ÃÏ—™ö·á=_’DšŒÇBøøÖÒ#Ç‹©5¯h³¼¶2ûZñi—Cyeò_ÚæZY¡`ı6pí¡\Z¢#¥¤ĞÜIÛ=K]¼FÉÉw&\nJ€mk g¬~½†ê×ë[|,|½vüöºÙz=O€Äİ¾s…¨+,jqìñ;ƒÇ-uˆdµÉŞŞPá/A•^›¹ªÍ¥È_n¾Lêf¹öæK—FŞ3ƒßoÖ\Z±l,ïU&¤`–}Ú4µÍY£„“”B‡¾@kp?_¾3éx…lGueÔ;¾b„Šz”°õófz*Ä¥Ü®Ï¹>\ZísÀÉräö·åšçè¬«$ía›çùådş\0~—¿Á®ëÜ©âŠ-%¿•ïâÄugq˜i‹\'‰ŞqFë™sš{Şt{üÎÎpÚ^0$.~r~Â\'.#”íøsu”×Z–—èvHyĞ%D+2¾ÒÑgAì–ïcMgùE&¤XÊ(æ%SÏÏ9^ø+À_× ntSs˜™*ÊzËÍ^n‚wSùÿà(T…–Âè\nÿØ3,qN–œmyCºÊÁ\rÿV7y	ÜØø±ÑÛ½«\"Š9S9—ğå§Ÿn×ıÃö0B<‘È\n´µpå¢äö’\"°á’Ğ7ìÃ`]ÊÆ„°¨ãn9ğ\0È*èD)\n-ºòëôùg¿€<×:?_qXÅ1û¾ª“Q{Æ÷Äİ6“w1áVvÉ}%{’\\(ôW²WŞ_!t\0x\"~ {r£¥ŒíŒ½hu€\"º\0P¹g2ˆƒØ…ãåğhµ#Ì¬ã²Bãkot=?îÇ©ëOºá\'\'1¡ˆE-6„ŠGºàîÏâGLÃK†ãzƒQîˆŞ _×s½\'pV!!?ÍÔçø<šdàú3’ŸÏr÷í¯ßáu:¼ûÈäèıØSS‹5.Ö\Zs<¥p›h¢D¬‰-Eíè¥ƒ!Ü•ä–ÓAKÆäâ*ƒa\\fË€gG7ÍÎw«İµDeÁ8(ø\nOCü:…VŒóÔ¢ Gİ˜8¯·ÿüRç „_‰‡9¼ñöp‚ëßğ®EwÈAôt¶KÁş?',1455342687,NULL),(6,'IrOtgtHVQVR0','phabricator:celerity:/res/phabricator/b59766ad/core.pkg.css;-1A.JRcRe3Cvi','deflate','ìıé’ã8’(\nÿŸ§ˆÛcıõÔ(\"ÅU¤2mîŠ¢öÚ¥sÆq\'%n\"©5­Şır•¸€\nEVõL_ûº¢\"C\"‡p8_xK¼¾‹Úé]ÔßEï]ßú»¥¿ëÚ»\n¿«È»Š¾«Ø»Š¿«µwÛ‘ŞeË1ŞeMÒEWòŞíw^·„ıáhyÒ»§¾{â;ô<Ëüip¢™ß¡6\'Šš©øŸxË%ç;ô»Çñºô3úú!XºÎÙ®ô=ù—ûpmN+ş~oN3”Ÿw(>\\Grİw³=Í2ßÍÇA°Dé]”Í\0™çü”-Óûp½«.}7}Ì9ıGøä,iŠêÅ~÷û{Ôêšû(jJ¿\'p=õ§\']¼N×ó».ÉŞï~7ı§\'Éñ4Óã7eÿ^³í&}‡!è¯™ÖyKçı	}‡Qûòö·™¤XÒÛ¢û·÷ûÇ·•Ä¿M%å¨sNúñìjø ü\'Î³ü?I?IFo#é(ıíışır4Nw9Óıp%G“ˆš#	Aï¾ëó#×½GSÆñƒ×Dí»dğ’øƒç„½âXGSüş¯2ìÿ`?ünğ{Íûk=üàÄİÑõÂÑûaù£#ëÖùãúİjÊqÄE½ÕLÕÇÄ‹iá1JñóÑøCæizköåwI?Áü\'ÜÏÃº}XGO×L)5‹QßDI°.ìoøĞ\'5Ëùş¯0Z£Èáè¸şWÛÒLOr~ç¾«ò?ó5ı¾KN\0ş÷€EÍµuîú=¤ÿß¿ñG÷úÓ¶\\-,*k—`Ì,%ßIûòÃ	\'<øtÖDOı\"şG5\"ƒàóïßÎš§~ˆG\'`M\ró-‚\ZÕE!2(<yûf«GíÃŸ#óã¤IçÔ`D°‚‰²%ñ;\'ûıùéó$0ÿò—	Òá ÿt‰s|*ôÔßUçgŒ\rì#–lç“…®Šoœ£şa™zª¿ïú{ÒÛÿ¥¶åxœéùĞ5û{@eÿæƒ|Oış”\0t\'–ïª&Š’ùû·“æ“V‚&EÍGø-İv;zV-ü?ßa†ßÒ]‚jõ„dY‚ã~>Jí£J\ZÑ§Ã‘F Õ~Xwó®ß¡oşû7ÿ…çóºŞgY9*òÙŠ?BQ\'CwÉMVÃhœşqûĞ|:½|\'~{ùpUNôÇ\0zó‹¿ùƒÿæ(<÷oĞ;Œï¿Íÿöhßv,%`ª`$æğ˜¶<(V\'Eş÷o{éÊ[œ#~È–ptã€ù=Aşı›(4A\nˆ™ãŸKy–óÁ…Lé#dÅi—¾ô,EÑ¥÷ˆ¿Lİ½c¼2D¿IÃ\'ù˜ôÿåíµRD:×§RÈwÍßQ>¤“ßfş•fpÊâCÒdYrü’>k.Oş½ r¦\"ù[`º„­Zºf}˜ÒÙ6\"XFĞït!×_\'wIëñÜßò#ııK2EÎù¹k„9°6ÇûëéÃS³pĞßó½x’¬éz¡ˆà\rŞøUæİcäMîôásSîQó8ÖÎg\"I©çs¢ô{¿A[\rÆÉŸŸµùtü–yfZ>Öş®#ºeµü;~Øœ)ešÍá%:œ’~ïOÅÑş8s,gİoù^À_ÑºÅbÏÛ7Ã_NşÔ»ñ“ƒs÷ï÷şÊV$/û:\rÈŸ›}@È>K‘ÒÏó³çO’éqjtğl7N3ÃÎŞÔ|Ff«NÀİ|º–tËöÅ.ÉqüÂùÕ²c–İ¨î¥ˆß¿í|î÷>dh…Ì‘´Êıv@Î€ß²¯|É.!åpbô÷ÒªÈgU3íoj’-O“ƒÏÁâÏŒR=ìTfZ`(|–©ğ\Z„SãÃÙ	Pt‹÷Q<ÚÁTûe\\Ï9†ÌÆÍTÑî\ZğnÎó8AÍ,h8Z¹~ÛŞÕ–¸`9ø¼Ã=ê^\n\Z\"çoÁ ˆş¨XÒ…}Ú•9S¸†ckÂ>p@n>¡Èg¤Ø^-JEB°\n]%îì(ä¤nE4ë÷Ëßı9²uÉKq<8y-:–íïY¹Y@‘XÈº/B#ùÇŒ½¿Œ|¢ûºî“Ÿ$™!y<–B4aeéf:€Ã`1ã1ãĞïÑÉæûqşÛ¥öDâä=Ãò%·à€Ä…¤¯q®¿Q\'Enp‚’tŸuF\"o(ºÅ‡ùqÇA»dÀÎ?üs—ñ³7®ãúß¿‡8Dò€f£8æùşá»/iù\r‰ïši½ÿÿüÅ=ò†æıå¿~>äXnCê$Ä×¸äã3PM|K^DÅÎª3w\0(ˆ{?R‡\r¶ïRt¼é†\'€û17 8¶ücIú`%H!ì°ÁğhœOÎg\'Ç]ÇgÿG7¨ŸŒw°™úıOıI!¸X\"»Kk¤ûÜè{ÒõI©?`*ÁÚğ¡eşŞÁ‡Fë8†şxœÕS ¯ÀY‰Şpé?å-…r)¿“„/›B¾\\\nÕ~Ë6[(#¿%r<ÖÀšş1rµ€¹€qŠßqù\0Ì\"áÿ5zú=óÍ\'¦`3ÊÀ9‰“Ñ,zùSÜ3te¹Ï^$İ)œ3İñ±ö‰9ØÉ½MşûÿJ¾ÿ×O_¬ó)ø;§û|àßâãËàĞokyœgğ{Õ3ôÌ£Ôg¿Ñ£÷å3AŒÀ‚hş~_öá®óşR8˜‡L«HºÑyä‡çø4Z>É¸wÈ=¦Á§¼@Ÿõ=§O¿À³Æ%³Ğzò°¡&ÕÄÈr€ñ´g ¦Ÿ•³ÈÔA÷%èš{¡ÌÏ×)TMkre„Tì(hßÆ¯Â}Ş±x=Ú¼·;°dí$³¼|òªX/ØeO¸bôîg¾\'I?_€¸Aúo~ûğoäCjJR›] \n·¸D7T{l$şóıÏìN˜Ö¥5á„Û\\ÀÚ×”‚ø®3.ªã•«Ô>×ìÕqœlŞ¥¡Ü E+ÿ°d$ƒ~ªŠ®}P¬ÅA0(§:	4êüG iù>ÜŸ£œ.\'Ø}j]Nğ¨q\0›I×ÉY1’Öâñ\'Ô‡7î{(¯ıŒ5«Éj±}ğş\"»¦û•×•çûÇsŸ¼Ÿ²\nò¾‡ÊÍßãG@Áª ,,ªİ“şc‡?:ŒjÒó°îã]š$ã\"¡(.ñĞ Æ˜Fğ~\r_CE]Ê´J<p¶?p‡\0HÇó÷Ú¹é4æqG‚öÿŒ~D\\Ú‘§x~ÚÙçI6!¬ÔB\"”tHæ!+|V«éĞ¥k¡ĞÓû¶ìŸ¶­rn¸1ü,ˆãI‘Âî>JøFŒU¤€…¡è\"à~FøĞ9×+€Ë†=š›¨ZX(ªhgŞÊk×S\r%{Ë€ûÏôGœ$W§€e±vÀÕ–½=Æ“×”Ô˜ÆìĞŸò7ŠÎWoÁİO¹a\0øI?P(uĞ»ßñ|Å—ÚC@Q6½¡\"ù\rÕ§wĞ…d~š>¢>ê’ë&3v¿-J¾é¥“9($pò„*\0Í=¹s\n;‘qü=úÿöÛ+ ËäS\0‹H‘_\\\"±åP­¿„êãò¹°¸\0®ídâW5à²Ìã\"k›á?áô%=–AÄ¯_h\"bè?³C\re6ªèğSHÁJÿ™¯—bóáÃrÜsoK™Vî|“QQ4Zt«IN…©³@raõ\nø’SI®¹à”ÂÌTÿOx`½0¹“¦ÄÚgÎ	´²Åm #\"âÑÈ<\0	ªcR@®6§ä.Ö\\î	ÄğÕÏá<îS¼óçág@|„v©ä\'EeËòé9âÊ!u&â>ròZüÏ]î\r•hPZ8xÈµ¹Åßõ@±ö\0x·D*ÆÁ¢“Ğ[,	;šŞ‘¿\0!YæáÚøOC5î-¬ÿó‹u‹÷+	/Äêx«¼ÜhÑ!ŠG ¡ĞÄøŞKõIæ%ÈTw¼®O»pôüM·ß<ñ½ô•zßÂŞ&Ëáª?ŠÓÜœ—ÔİóY‚ w\Z«İw.à=?à@…ãø\'7Ü¹s,¢\0®¸^‡ü£’ê¼Ø¯pRĞ-×?­çávâù«ı¨¨	ú5\"ø)Pr|Á‰Î8Ü‰Ót×tÍ»~Üuƒà×i”¼òLpG‘Õ[ÃY[m‰6‹øSúİ}?‚•\Z)ÓK°ĞHKáÍû÷££ÿ›ÈyÜ÷ğkÕ6¼+Õ°wmÙOÏP¿­X”ÿßh¶P™…|Ä‚&4µñÿ4­	ÚëikÕ™Îyd‰Hëºem»®mg¿j™ÛeOß¬¦¸ èú$¨ĞU{S¦µF¶VT«“óWºFcÎĞÈTİîo{Æép]™VÅµgWªÒpç\'EVfÌPV¼)Ó7»\r¬u¡nluO³ƒóF”ÔÀ*x³ãİö|ÃÒÓó¸CÖV\rƒªÈÇÅFŒÆöUlÔÙPC~»€ƒîA<Ruì:PßaÖÂ“9ÛKf¤4.ât2Ş\\ y…¥(vCÕÅö&ÌF-j¶X§}œŞt»ÿñ[ÉØ\'óü5üvqø;-e4¯–×mÌwkvct:ıÛ9µÙ$ge·o­Ïİ^k²Ä¹§m5U¦ºÊšº1<3¬4ûBÏØÜV³1gÕá­aëLS­ue«LL’#ÆÍY…:ö&•æ¡šmdÜ¶T|4õØñ¹uIJu(R&ubög£ÕWv®ÒîY4«eùĞè·µ±9ëD=FoºÀgßSå?J§ Y¤ÿXsğ|	Ì\rû@ëmnëV$¥ş´®ĞöÆ¡nÛ-O\'Š×rwÅ«dd€en$‹‡ÙSd™Jj‹¤©Ìn„‰¢ÈçT2©-H„9ã‹—‰%=lä­#‰ ÑäkšDú\nÎôşïG(òålH\"[„âPl3µ‚6Ó;€}·L½ÄU‹¶ª±½[<DwÃ·èÈœGĞ“\\P3a\nåè‚UXÇso\"iš¸aç-û$\Z{\0pçn±÷P‰§yA;±R<ÿ¸øÄğ%ÌäİŞÜoùÆÁËøåô\rqß\"àœ¨ÍÏÊXŸCq?+òÉëô2©	5‰€•:B6§‰Ã[É\'+9I‚¦ìq?J<»Oî“QûlÈWüîS*n™ølŸruÂË£²%ƒ‡+æÎ[Cû¥ˆ‡D„†‡×1ëß-gÌî\nru¢(Ü€\0UEË©7 &¯\\ÇÜÏs¶êK¤`8q/BÜvÌÀŞÇÇ2=nó/TÃ~fNÒÑqú-Ú<r¥eıèªÃşırŒSˆóGàON\r*›½¤ìQOî‹êĞ_ıi¼|$¶Í¨jˆEş®ìŞ³ÔœÇÖéÙÚ/¥/3½E??Š{&Håğ¯Í&C2­\'ª*ô¹\r¼¶ş™:Œ¾A?¢k±Hm\rèL|\rü|÷°L{Ü­eî?ÈxÉÚ–İS†ŞwÛÇd5û*sœ®#2š:âìÅs{Z´†f­!`\0´ç¨ãa.‚ºä$ˆÇd„ÿµ¼ÌÛ·Ç“Ø7ç;’‘D9\0ê<É‘åTÆ–Ëv¤@)ñ\Z&>w¤ô•S¤vJªr‚hñ2½Ä¡T/ãUGÚE^<?\nqQ³ï\') ÷®ó‚B€•­Wÿ,Ç)~—Ô@?ô´@±\'yM˜á„\"¢Å‡öİáÃ\"à>VÆµÊd^ÅŞ]ş\\§£)ÖKéöÿ¾\rÅíãşæ	»)à’j$90µM3º¢UÅsXO™¼m„íÌ>š£4Îov9ÔŞÊêBy¨©¯ÁVmàâÁ|·p{€.=ß4±&Å@Ù-\0ká-2Ã›˜–ôû„ÏÃGwıU|W0Êú_S|ûGAÑı™Ai¢ÃkI¿`åìÏ±íË}ÏÜ†Æı}â¤ÜS¾JÙëúÌBm³ZëG­øĞâ?Hd‹¿–ÉT`ïw…wñİ[dÔü´Hàã\n\'PéæyÄïxGû( ­ÿş=™ìğÁ‡?¾‚¤úºí¥´Û)O²RHÁ‰à\0÷İ.œ\r~ŸPïY0™¬‹hdÔÅU‘[\\¿ˆğ\rÔXöjÀÈqŸ\'ôB‰@x<\\Ú•—\Zû| Ò+4\ZùÇn>e<A1tñÏ¡9Xì²R2ĞayG:5Güâi¯#õZ½™·/|…Û¨4Z~¥ëK8	€‚5Ì€Şî®ÉÙL1²ğÀ§İÔîûËİnF$#@l—2[ùı•ÉÔ{ƒÀ°?\"#ñÂ‰\0TæÉÉ jÂÿ!³(&Œ£îi	œ˜Å~R*Áè“bÜ\'Ø\0OÄpÉ¼İ\'ğ^,yğq’œkt#˜x8cE*ø*<ó±‰,V6ù±\rpãHó:€l•§Š(ÁÏœ)QVnHŸc¡âšßd_p&*Øş>—;€8—±´—ú[]ã!L¹ÎİeƒBïòil.ö{Ù¾ÿ€öâÖ_h>%ì±MvÊ¤;ßpÉxƒrÀ÷í/z\rˆêæ-ˆÍãT÷ºˆ_ùGºRÖ^kX†Vˆ|í>%çZbÓvpËV[è]1÷ØïHÌâĞ!`pÅŠ}€ßŸ”TIØü<*š>¼¢EÔ_l0eßp‡”¹ì&SÖ«E!(ëĞôz7ò /\"mï•ŠoÏˆ¤€V\\<=ÌØ+¼=Óht(¹Û¼Öt¶RÎÁ(\'¾„eÙÎÕ×-—p\"F\\ÒŸğÒõÍµ¹[{‹6;¤t…Du|¶%sşÆÇÈ9]Ä¨$mT§Tÿ„öHEı\0Üû=˜¡ÏóîFÒñ\"¨¸2üŒë2È~&«/ÑË\n¸¼©ğOàş÷‘\n»’=~’Ù¹ÄòúÚgê€P,kº*Oâ=\0‹TßÙB™½\"³Öò‚pZ\rL…­ù\"ˆr7CÑ9W•||y9øÉ¡`¤¸â³drj2Me=	IïnYÿÏÍ:¢/ø7ÔEÅ>µ†ºª}R1ş‘:À¯5P,\'–ğPäÇ‡@ˆ%ÜÜòHKEØãŞ(ö|z‹¯AÄŸú ¾ÂÃm¼ˆX¶Ù§µc5ÄÏ*_ª®k@	ÉùÜGúÄÚÿçF$#æÖD­ÀErg_q?bUÁ½Èûê‡/sõ?ÛŒ\nQo>­ÖÏq-èô\0ÛÉ[YĞÿ`æ?¾dqUR•Nœ~”²GÊB,‡§NgÅò>Î$\\Üí\n–(%0Ş¾~Eõ#”XŞËÊAf¢ˆ_÷=0\nÏ”‹çJÁå‚Wˆ?t®á¡ÿsT~f÷€¢p\n¸–I–ñÜ&„”_¦=_àù¦;1/z¨ÁbÈÑöö\"œôL—\nŠ‰Ìñ5Ì²6óf6q©&Õ¥»Ke_ª´¡ûÌˆç~ŞÚ76i*\Z9å…øÖ5§Éãğö\nVÁ—R_èì”g¬ú_êrø%­.Í@ÊÙmï_kä,I{³û™Õ¨e‘¦	šnÖİ¯÷Ãï§ù„S”~œ›áhµe5¯µïYş×ŒÂ4šar½¤`ªÖ€~\0$ªÌ-èk=¾¿6æ\\ˆ\'\"Ğœ@nÎ_¹ƒ¥¿™VÄäã\nI”Äoq±Àı-/ò”ù¤\'n(`_X‘åáÙ_öPÎÈõ)¼’£Úãğ.ß{p©t0€Ïüå¿~¦CP<Û÷¿!Ãü·TÖÉéÁu+:,Ş£¯%F=9½/h~çßr±‹n|ß®m$~W-N?±Á#§UAåşO§èÿhòÿ±íÄ	×v@Çáèö)a\\Õ$¦ZV\nÌé?›üôUpdS\0ôÔÍY„@ø2ÒßÏ½şé=lÍäMû2 ğENÖŞ,±OÉ¯áçï|¿è.+@¹ÃnúMò{+Ø\r;·A–Õ¼ˆßIÏŞ:…£€íH¡İG´©?YOámTWŠ÷§ü¡£Ìb¤`¼—?`(\"¥z\rƒ¿%(?5U\0×\0ßueÊÜCö~ó5B’”:ŒA8G¡Ñ=°eøÈù™²cÎªÑ¢2)‹Éø«,ÜrÎ¸îWw\0Á––}\ZÄÌR\'$±ºÛDÄQM_ÖÓ¤›v¾qz6S\"J«#ª<Jå.h1—Œ\"!§÷@è-ÚUK<ËJ;8”´ÈV½Eÿî©\0ì?Üàj ø`\0‘UÒù7î½ìE¢¦ôuhÌûê@d¯-@!\\Jü,Kş ¦Æx·Ëq:ĞÜÌx²},L) 8/c‰?d¶~–%˜êgŞ9Û¤—§`\ZÌnúÑöøx];\\\";%Û›£ıwéËCàøïíNÂE2æÄĞ“»°,M<«†¤6-ğ†Cyº±ä›ª½\nö­ò*ì°d.:á‹­¨¯4 ¦‘/ê•_i&@ñµ¶Â’€Î€K@Ë’˜DÄÍì:ç.ß£WÆ·ıİ52\0Î(şzÿr¼õàNÁÉE—öÏÅmò%¾ë#J˜PRÚ_ïRM†m ƒŸÌœ}—7x³£—\0Y\\Ú°L+ê­Ìš~ış—¡er‚õ—÷àMˆWî§’ù50…­§îQôç®¼ÇjªÄDî^l%CÈ–Å¡/§)¬ñµ>7Ïu’ó¥ÿ»([>ÈaœÔ’a²Ü!<Ìá|hjŞõ¿ûk´}DûPt°KIĞŸû ·»@`ñ¶ñ3×ïbd€ÜÑàK\0cQâ32ğ(ã;ªOaæ|ÌSQ®KØnõñ¤&*re5ƒ0İ\\ŠàiŠ §ËeÁ‡î«OÁûÓúğ°@ÅWÚ´\r—Ş:ÁW#@KÇ0‰æùåJ¦ÂçêÑàß‚¬\"w¨Z¤C¹$öWµ\'\\9	pŸ^ƒ¥W ¹»Uÿİêï)Ø73Oœ›ÏxRÂaCŠŸÅ‘I[ò„:Š²fÕoQ2½-¶P4î*\n&wĞÏŠFÛ~ÒNf÷OõÄYY©.Rç³¨ØB¸\\ZñËQ™ÏÅ•{ÑÅEnÏı/‹5ÅRoy›Øœ™@ç^pı\0è%ÒW¡…vrAjí%Óß%œ²ë‡\"N1è<;B~é¦9ÛW(2Ò	¬*®Ïa„¸TàÔßOœ“mÈ<GJH-30Õ\nCˆktãœiœ:™Ò°Mp´¸ÒñÈ¤ƒw¦UŠÚ¡\'ñPKƒ©‚7(ŠŞÅÔ>ë_dôÕËîÖòÜ/ÎÓsi+Ñ”Ü=ît»KYñD	\nbš¯šÕOÆŠ, Æ#W3ü”±}|êÚœ8ÇÖ,‘ö½¨ş%‰ÉôôçÂŞ]¤¨¸qûf„õÓİ™4àq^ş\0ãË¡#‚ıä\r×g2;¼?;ÃùhFG¦,>*a™W†>Q¸M~R–%ñ;GƒŸÜøHxğ“tˆ«?Ï!ãà	|ğrvêª\r¬Áçƒ0!Í|âÌ®,ø?9A©&ÕîıÃQ%‚v/YRìX©¬_‰s¸/¿>ªÅ†9åq\\ğØŒ,ø‹„¢T¾òkÔœØè<¶”ğ38JØ¿L¢†åî#Rû_ô>¥aCb·ğG™ĞEõññœ÷Ob®”7µ‹D\"€0€]TåeX±tùèJğyëÏ„€¬@‡¤â×–á\nøç/º×M/9Æ\ne‘¹Ğ˜™ïéhçy.úÑí%1‘ïÑ}vi*çˆá†\0 úÿs³‚•g z%Î(K°TO÷8-­ä¼\"¤à\'îpükÆÆ Îg‡d­Â¬ñŞ„QƒÿZê?uï@©yÈ»ì\nV:(¿¬¹JÎ]/g•ô\nFï¥Æâk›\'EC¡Ks~Æ,²Š\n-¥€óD—c4‘KCºæ[&eìı¨*IÃ¹¡JIJ¿\"üe\r’Ê¹ÂG<6YHgN²$c¿>›“@ëptÃ¬‚–ØšÆÜ…+¨œ\'°Ò›ëS®É:QR6?YN—9ø‡A¢/ÑåògÒ&/–\n·y’nâ5\'Ü?V#ìFjÑ¦| Àü8·Ô>»ôNŒKNñ¥¨¼•|x{eQ\r\ná”S»H6rîÛS‡—[MŸ€±Ä‹îS(Aı·Jô\'1Ãø—†ä0jä¯^Æº;çU£9˜(\rIğjóArÒR‚M/c bàioCû8£İ\'Hı¯‰~À8ÒIâôŸÏ‡‡|xaFn©yËàôx€FSÎ\rñ²\n?—š/A¼q\0stF’Ï±ğA¤ı¡€‘›ÒµDÉ-ãa{çâeáCÂïi/\\/h,bšnóIÄ<Q¥“‹?3ŞÀßpX2~œ}ªñEN‰Ûÿı€«¿¥8`Ofò(7LÔÕâ;¸z:×£›rã„Œ>ıVCCÉ¿%S·şòş:ÌÊ¹şÇÂÍ”­/Ş†ï¬™¾dé0ex\nşAL‘¯bújsiTŸ2s7\0¯ÊÊÔâry9µhÙô	Š9ıÈßÀÎ<%¹²‚0 \Z¸#ğ»r¸Štá¢ÜbÀ>´#±áW\'8†ìo‚¶#ı,é]ÉBÃ·3&ÛÏ‡6\ZSá¡&—=s‰ô´-_GJã•Õ¯Ÿç= İ©û®°ğ}ÖQø·GbŸ¾¢æ|¿Ä†û­Ñ\räÓ©Š\'¼8Ç\0àQÔ}KãpbÁ%¢?½ÂÌÊ¢:¢…T\rwpÖ3p’ 6_…øèÑÂ ‡9\"Ÿx\nÃ\'Ôa¼\0Æ±Î|q°#óìĞ<xê¦¡…ûfFØ!ËĞS¨Yø{dŞ_ƒ•Z“ÁÃÀı3ˆe—^ê}a0KvâB½üƒ’zyğ¯¶W¨WX#·ô0Aöêx†£••lB—N`]]›ëDP¯ß\\©…Ê€_Æ½ª\nçJJ×j„³¨ÖÒá>{ÿË #Ï CèiØĞg°Ñ\'°ÃlGYØ(ñ%èØ3èµôô°ÀÈgÀñgÀñp8\rüxíğÂŒ>\0ß9\0@Ãııp´<)£@·èv-gD_°GÉÆ\\Š…ÅŒ!*¼JL\Z?Aîíß¿™ |Î¤é÷û†GØÏj§{	ÌÆø{òë‹ŸCôcjîÃ©Zbï>‡dë×(¼r ¼Ê/C´‘8§”øë¼2s79ÃL *š¡<Ú·ërc/¤M‘ ¼-R¹|À ¬$š¬ÄZì½^%§s†¦BÜ‚€©ŠÂ¸¹ÒÅç¥nñäõZ–Ñ ÷S@÷ÛØ§ D11gIéŒ‚?š{Ó:§¬3~C¯U~šÌ•ÈFw0fÂĞÜ@-\\NK÷(Ø9WİOöN3X•éi…€§Š<[J²/S£Ö`œ{âÚ”aƒrwÏ¢Œ‹Ø§mw}¡Õ8Æ%È~ñ…¡}\">UŒ<\"„ıRõxˆ•Ë80½\'¿ß2œí[¨#úÔˆHÚ%dB¦Ç ¹ÏİMÄ*âZ:	æ=2VJ7u×–á\0ØÈÑüF^ta+ô8»!–nA‹¾ÈûPÅ?n\"óÇ“‚?ÄxÈT§¡ç]*è\Z‡\\¸ ~÷şPÒuÍv5ànUÒ¶dğş™&\nèõQf¾ÿyÍr«ÑÏëFŠªœİÆÓŠ!ÆØB\\&şÊä»lói[Í‡á`Šº!¯S#LgÄFy(™¬ÖÕ_Êë¤%¹µ‹Åv˜YL¤únk]æİE—¤öñ²YúÓÑîCG&„ÕøjĞÆT±» lZŸÚëµ0ÃÈM¿·².b«ÃnÚã××”Ánæq43Òú»f^0=ï÷g–!È›~[Ÿn75ÑÎi»pLò¶îˆŞ¸“=òVe×e.6fÜæÎ¬5e{Ì5èÄBUcå-Ó~Å/9hÇzè¥ÂTĞÚ¦n{ô<¸	ˆ·i-‰­°œÑÛ­ñS¯bØÍD&ÆdÓÖúz—Z /Ç8|z±ëp»gO\ZvÑe0kP6_g.‰MnçÓd‡]Gß¿Rújw­îIºy£F³Ñ­Lú3A_º¼³ĞFÇÉúV¿mwtj¸5ÔîuEA18fs¡šSjn‰:T\'zı›Û 7Şí6PâB1AÙİ’#¨Õ`¤@<>ëaÇ…ÛÃÌ–•š£%©¼eËnoÚ¤»Æb{l¶+pn\n)ºeõ§7¼µî÷ĞR9I¸Òï8öÈl+0<hL0Ô^âèPUÉU¦Äk›•ö¨j·{kBÍ© ß´~©ÆŒWêú,óèHÜu”Ábt¢[xÃ2ôlÖ6æãÙ´]×-ŒÃyˆÉÃS©nf¥çÂM©ĞÚ™lï.:3]Hó9£.]yTÃpiÂ47œ=¼±s«ÒºØ|»‹ìœ³HáÛ[AV;Ó&L•^8¨²©.ZĞäLË¬êŞ¨RÙİØJ«\rnKÀË/w*çfC´dåf·”Ãé‚0,4“×¬ÙÀ¨kC›\'U§W«¥B5o‡÷ê;«†«†Ñ[óıìÈ\Z4ı[È9ï	_`\na¾õÔeÏ×X(\0`FƒA’pw‹¸Ôb*Ù¹Ó­F‰[JL19\\JEø<¨Ğİ!e>ı””(ñÌ¬u­I²õS–ŸÇJËYcˆäšåqöôl	Âè¾ÏÌ[[<=ƒƒ[ó–ªi#ñ·»‘vp\"AM)287\n¢3j‰ÀP)èÆÓWÿw!:úö{¥½$	m)Noÿş=ÌŒéŞLA_yû÷¾Ï‡æíÿşD×qÏùç1÷y1­¿I´+¹˜áğUœeø.¸kŠ_d¥¬^^3¶hÖ)øwÎĞó¡´‡9ë²´é”åp¦\"•ÄVÏ?èJçG˜j,Ìns—yË¹ûä›BVH\"ïp|GĞšÏÉßŠP‚œ})w†¢ÏEèwqg¡LÂLHv¦¾8õP”ú¸,l3Ãè8ÓÖ`\0e±Ó¢“ äŸãßo0\ZÁ¼iZbº¯ıÌK\0Ï\'égÚ·¥´l4õÏ‹Æ¬¿$Bz³&âkÇdQ<Â§rÙß-ï\ZAH5\Zº\\ødiDÉ2¡t‹f³yC÷üMëãÈ:»Ü5ïi\Zß€ŞKÉš¢KÔ|©hhãª|Ÿ?µå)‹j‘úÂI)4çÆ1Ÿ\",kî)L¾A™®G†½|á\n$™F`mHNö‘²Ñ?G¹6Ü¡§ñg ‰JùØX¹›aó£¥½Ê\0Î]ÁOÖ¥+æÇÅ‹¥HÜ28Á±|îXÉ‰?\'p…ÔÀÊÄ êS1í¡ÛáNş\Z:%S>\"—íWtŠjÖ&Ş¬2WZ?]âœ ¦ úù5|â›Œñ(Ê2œòêÃ2SË´ù\0P1»,XÃçe©TÙxâ@»ZÁå.½È£€}ùí5¿¾@•¥ÊPJI!_òËğÔoI¬˜§‡#	<øRÍ2oœ0çKÀ{JÇgM’\\˜ÉåA–8ÎÀ.ÁL\nV`äâÒê&®ß%şá§±¶’ğà\0èYŒ¢{(@€µpy_ŞòkØcáu¬Ê¼\0îÑwŠ8’ &«àù¤Zh#öº\0>xÚù3¿‹˜-}’­ál^˜$¨Ú0Ÿz]¦ïZ\"Ğ‡¡ÕKĞ?‘÷¯¸FZO1²€kÉ¢å Zám\0ğÃS¥0\0Fª`Îä8Ç ƒ=ZôÏgA$÷²ñŸtl—E‹ Âx|$¯”yd¢úæú ê:ÈZN\n%…<²ß£ø.>róÆ?¹®X¨ãª?ŸÌŠ[,Ïñu‘â£\"¾îåo­†Ã€æï^;\ZYxk\nOZñ‘òè ŒÔ±\"˜û©Å±F-ØûgZ©Q£jx±N¡Ê¾8öûU~ÛßÅ(\nÍˆ`ë\09E”‹ÇÛ÷CU/.;Ğs¯8ÂÂc0¡Š`ä\"˜Ë£æÏKqÅ©åNİÊˆQlÕP‹ŠcÛÖô{”CYÀ´(w›Q\n‚@ó¦H?‹ÏîäİÕH¯LˆĞ(`›w*%!Áş¬	€õñ\\ÉKÏm³XàÅœBZÅ·÷n%}¾À}h\"ŒèMLp`LóaÇé„ŞÃç‹Kz0¬\"M»Ú3væğçÿ“„¤>¼O&4Ò‹\\ã\"W_Ô³ÎÀ\"	GT‚S°—àõ#¸•¤\'š)jŠ,rŠ‹œ4Ë‚\"¡m9× í‹ë:’,9Á‰ñ-_;û:ÎĞü&Â3^Ô=€‹è³â§¤(êE`]•t»€¹f†zEı>‘‚”jåØ;ñqJÄoİL-İÓì@ü™û\"%œfêh&8^MŞP>>jÔ‘Öğîg¬zğ“óÇ‚üi¬4z@ÿÎÉŞ=RÃ÷‚Pôˆ¡ùö—G@Ï$Â\'`L¢ø$ÒÉ¯äb‰¤/³~Ë*LòãÎÉ“9U””y+ö(u!ğçT}&šDùa¼†@ORDT\ZŒÅêu,Òzä\0‰È*æ9£ÜM‰Q9‘ÖÏœ›ÒH„Ç¨\0‡h¤Ÿ#qÏû[(2ûÙ[‘Ğ›$fY<ÒŠ$Yç”ğH–ÕÂCP¯|³éİßJ õÈÈ#Jş#Sáê¨\0-\n±–±S&Lğ0ÏAÇìJŸPB\râÿ¤…‰5zX˜@pwÙbÕ#^QªöMK%{#µ_;¹¡EYk„7\ZjênÛrØó¢«K°FÓ\Z¿˜¹½}ØãêÌ˜­˜İŞV—”½;ìÔñÄ&!ì6–*UéæÀ§©q™B«ÎíÈ’9‹zC›Œ\'Lä)#˜hbˆÑùfT´5yìÍ+km¡[T³İî)lÿvöÏ¿o°mÖ	i¼R¸İ¥G¸…ŸĞLÜM<löH—hŸ)Öh+û¡<f³öØ³¦k§2•|ÖÅgîòl›ÒL…¦´zèÖV4NÖ	İğW£jë\"•Ó¬Ù2\ZÇÓxİíWÖT¾ö½>ål}§¹C™¹Ã+mˆ9CÚG×IWñ†4ò’†y‹?ÓÕÑªõË¬}8F[Nwv£Q\Z;4ĞµÒ Îuºs&„µÖáº[?èš†7x¢™=ILå0¬ì®´®\Zy[í¨kuQÛSŞöì´i©µ°š‡UC7[}õÜ¸6V\rå4œ)ÍMßnÂ§ù~ÛZ÷ªÌşâ¶}º±[n3©]]_h³‘ëet é–yÖ´šp\\]Y½3¶n»ÁäÌïØÅü¥Ğß(=ƒ©ñøï(‹›©õG­…ÎuW‡\Z%)oCP6ì_(ç6§¨~GÙw†Ò»‘¢0ˆ-i øj{ZÒŸ£½¶î´§ĞFã/Cru›‘©PYjuóâœæ@¹HÖÖ¬)c‰[¨ëóÅCµÊv9ñškî‰¹µ[íkƒ÷*„T™ËB†´Á¥…´\Zua2¯³õ•5ØnÔÚÁkÜ‘\'|µI [Šª4;,ãº.¢¬&¦>í®­a.zmÈ:cøt¿€¬™|kg;IiHƒ…1tÛÂ×]¹\Z{zYYLê·\r{¬Úê°¡ØÎê7ì*;ªòcìÔ¸JO­öå:cPÔîÌ2Fs{j[İp±ÎËñ´Ó›n÷?~+eğ?{0Ä´šµ€¶jòòi?ÍWNWd«uğ:‡ÛeÛ`êÒ¤½—Æõ)9kbì¹z˜s{éÔ˜_,S™N›ÓÕÙ©‚©ŠÇ@Ó=6ÁÚHß†º]ødÛ‰w‘q\Zû×mÙçÍh\'\"[ıt:éêæ\"t.7Äb/í“°ùÃ¶w˜utáºØ¥ÇÚÔmÈX§¡w ¯7·¢®§»zoF¸½ŒÛƒ]ÙmPëOæ.KŒö=ÏØ;›‘Ky×Æmk]\"ãá†ãMc½pú·K^6S’]t³Ù|FwáÄÖÈ»ÀdSh7¨>ƒ)q#Şœ¥Wœ{8®<(íõFœlĞ-D÷­©a Âe¶é(mÍÀZçÖe¯5ÚTƒFõî¯ÈóşÌ°õhNMÍZÊı…tt™šyİ¶Ö<L{uÛaõÖÛ0ãã÷»ÍxÜ¼4{V¾L”Î¾6‡ZÛÖ¯-œWF=jr@M½M‹´°ÆiÛŒØÑvAì&ÊY‘×‡cıxæg|İ².W«A7moºGæ«ÎÜo¦&C¹Êß:ó-±T0—íS›mW¾·ÏW¨u=lË7¥û»Gİş:Şú¶2mŸéÁøp³0YŠl#Ëj“æÄòŠ*7Dh¯uQlîNÅ2ıf“‚tã¼èÁ„Æ!ëºÌN(AíjÔ„ë}³6Ö‡Ís•ä)†¼©ËIçxì4«»ç«8$R§ãxĞ³ˆŠW7ñº—•Ş–Új„×\r·íêmV_©©Ş¬Öó”­ÍÆšW½ÚjypĞéJ`*84›z}Níâº¤8\ZZéò–ié‘Ùœõ,g97ÜDpÆò¡kÎÏ*r[QÊhCÛak$éÆBWGÓw\"N)´ªWƒl4”f‘“yßóNÁZ¤\Z½égœ}OQ”ÿx²ô‘¨¥¿o¥–¾gµ†•ÅÅ­rcTgĞWPm8kuW£F¿ß[ˆmgíÎxjVÑzäŠÇ†áÂ¸ìàB@V£ÛšTµ^ëÒbĞ.L_è³[¡Z\rš±k¿E]B1ÜÛd~²	{>Ú6êØ¯êóå–N«JmØlŞ êfœ\'ºD¸üÉœO™ÊNk1ƒÛl5_1Ó¾¹h\\wû‘6€ šíãòš#àÔ:áNWÍÑÄ§¸ı˜ì¶Û¸ m‰rğ1Õû+ò\"A}ki\rÇ£fãÚ²\'Rme¸Ì†U‘ÆÉ’¨Ñš`\'ÃæpXÑxZ`.]Ãàó¶~q¹õÒ¥ôªÄß”±ÎòJ¯]™Àô®QoK»¡‹*ğa-]\\fMq\nC†cÌÅø¼µ„¿µõ6‰XC{  7»qn´[«Ã…0¥öZAà!RQzn{Ğ¹z½\n]6^wé µj©lpÇĞ—Ğà¼…«gÛÌ;¶etÏBuná3€Ó”£ØŠ¬y\rŸ®›ãA[”¨¾ÄĞ&Ë·Gú’\"›ÂîÙ“1õå;ßF6°¹-$ì!Û7 ×ê#ìoª»ÛÕÆ&Íëa}]ÃXİ\\ïÙíñêvıó¬ª,*k²c’Ø¯w»öºãW¤\'¦¦‰¸9\ZOÆª= :¢Ü …1¡Ó»?é\ráâqœ„ö\néïvËTİemQ66†—>yë’-ºGÙíîªº|›tG¡6ç­·’·‡A*ÚPÕÇŞÎ°sê;¨E7fœ?ö®áo²òŞ6±ö5Ø®à1µïA‡FÓÂÄMu€¶£jÓ.²¡;y¤7kD®˜Eõœ¾GÌ¯­*ÁV)åLäƒéC¼Ö³¾°ƒ£ÿPËØœ>–1YwÂÜ#=4–İk·;á”Æ²¦m»Å4VOqŠÏVWA§BÛê]Gg·Ús¬k23o†ì»-–E.«ÉLõ™Í/Úƒ¥0ã:µ­7kÕfõëä4æ|=\\°!u>ãŠonÍ®ëdõª^áÊEpšİ«kLõuí¶sÆ£wì6M¡H’éG—Ukyn›t³g*Wõ7}	&y0èLoBk¿‚<vH¬N¢R#7H¥µ\\_:9Ü˜vÙ­ÔÅ¸Ïës^Ÿ	j{V1\Z3Î´ª£,¯MYİê”·ãÚ|uŒB.];Ôz~êlZÊeÙEúGdİœ+Óm»/Ô*hãb5&C‹Áò‰æ¸®\rXŠ#Çv¹¤! ‚²Î\":gÎ»\Z{™XqDšG–\Zœİõ¾Ú»Û&µÃ[÷°¼™¬Ó¯¦[X¸x¾Èd+´À5ÜÕq¶h*GJ9ÚÆ|·ÚC³Ã­·t4™h“u„¯oó*}¹8è…Ûî·íéÊ9 É@Õ¶îŠ» ¶Ü‚Jß–hùBÃB­y±VTçFº-‰=ÍÛl«¶ò¶}oÏuÍ9³ãıÄ\"¨Ûêñl«EWQä³7Õ«Ëº&fœ˜†Ş;F^ÅüéW¯Ò|NĞãsU‘š¤qİY,L³·İêê5vW±³™nÏÊn×i®¶ÖºÓ+AJ‰Ît¨7¯ïF÷ğœ/[‚wDíñĞiö¤m_>ka½F‡Å†ap«ô:\'yëR§Meyã­ê\Z\"»“±Í|µ7nV_céÒb˜²öÈ1è~ß§ä¸š5´7ÀÔÚNcd_fRú¼Ñš.\\Z5+“+©3´¾©C£U‡$sm>ó©pD[=*–`ËÌnyî(ÛäÔÕêÙ¬öÖ\nÅP—úÜ!\rC’İáXöÅ\nÔ;+Øû;ºÏ\nê©‚‰ı…]÷ğ!|ƒ9LØ5­¦péínÙµ¿Q\\–ğF·ıµ»è¶K¹Å:Ø¾¿ïvû“ÓöV½ÏîA$oÇ][>Z×ƒ†ÑõÎ¸@77›-#“[Ãß@U’7‘º´[®$bqƒ,[­±t’šëNÃ06ı‘@nŠËÜèİ v«÷vô|!İSe~bGÆU!aèS?Ü–)eÍ9µÄ³ÍMZA[SŒû=Vè¡û#5Ä»}«Ñg…=b&ôm5%ßZRF–,u¢ëÔö&ñ\\Ãî×§ÜÂ]~W¥jÃwœ`pKèÎ1bÕ¿µÑæş²W$Ü;3øõ²i-)íÌBÍ~»\'àn£§q­Ñn×ğ½á¢5T×Š²`ÑÎ²¡Õo¨àºÎŞa0ìI—nì:î÷Í¾ØhwoÚb®“ıqÕ˜èj_ÇÕ«fókã<·šÕku¿A7İøºp‘“ØåÕA—s\neVí®õ9ÍZX¾¸ş@–jk×‚¬˜Ûº7ë²Lãx?°ôVÛñzgR8Èª´[zXëti6fn3µ±l¶cƒŒTai«2y]Ù¼µfWæ…¬ù4‚l¦6mïj8Ï¶7csÓWêáà¡ê¬×ØH¸âÚ;\n›åéU1;På¸lø\'çÚnxÛ^\'õiŸê³“ÙY}tëîVõI­BJ¶ÇŸÖ8¦SİQ“5,W5ÄtÙNDé83‹½Z\\Ûa®Ò‘XĞ§	uêñ]	ïI5rÈsÊò\rEXTõúxÔÁ©igÁ´6£Ko2Ø²Üò¼¬OkÎ 0WáWj·pJ¼õêµNËÛ7ëË“:annÆ×Ñåšö\'f!OUe©#WõŠV­@swèKUçÊˆì7d¥àµRÊğ(v`èv\0Á3ì¥Z=m ¸¹À°ÕÛÖ˜¾e)İoÑ•>­u»‹c]š.i·q­ø×	–MÆ¸6/]ÍŞLû7¥¦*mml´™®nkºµİq·ùªçé®X÷éÿH´§ıEGõ%qt.ßŒjuìË\"|ï&M¤Nõ\'®«J}\\•ºeo{l[¡ğ\rBÓğVY´.¦y©7Ü]ŸP­y­~4…úxÏ!û§Â¶do4oåO0Ê¶ºÌlf{ğø<@De°Án\'xÀzK‰­¬	C¢ˆŞ`Ö^¨8y#W3åvl mO‘ÔÃ™ŸQSúÜ —Wça{¢)QE *óLÊgéê¸›îÅh’fŞ@ ùuë@l6æÅïœC4®]Ùô„öÒ:hª,B”Ñ[6»é2sÃÜ’›Ş¢Óî¯Ô@’¨e_vktå&µ±¹îô™¢j»Y»åïe\rk‹×Y_&mö{ÜêiÌqemV›¹Á—K÷¶†‡Õş•AçÊn.œÍ…Ö°he[o^Ø>aªÖò¸«[}!á§ÆŠ_›ı±pã&{a9—nËöq§q´u”M¯ß¡\Z˜}hÚ&Õ¤ù\r³šèØêjJò|U\'«ó×£/¿Ÿkûõâ)×ÂÎJË\'µıa7Rœ%AHúy{XNZp¥yòÆ»FE5İº0^šp›ôÜM[<-öd76;äÄT×Å6y•*0„›Z£­ŒKûŒÕgíjŸ\\*-[%xƒ*4Ëšn´ºP¯=ñÚUw!ÍZËı‘†nsyÜ Û³ÚÍh:6ÔÂŠoáşvrUtõ¼\Z6jGƒÚZ@©3f/Ö.KŸ%	3¸¾”w2„pØNÂ;T³†SR¢®ƒZCœ*3lE0Ãİlbè\'†òÕ¬N{\n5ÁWø@7Ñzy}é×ş¡–¾•ñ+í.¾TfğÇI§rlË8Ev¸Ú¡Ùh(‘ƒèÃ e0üŠ˜:ŒÈÜÖ¶A×–£Á¬we®p¿kØSƒczÚ±Öa½¥–ÚŠÒäan’Õe…Àab{³nDÎİQÊvÃÑ›,’˜02oø™Ö6âí&p„5çl/™ŠZæl|Ñ5õ@ÍQ“¶+\nÚªìWí9´YÔ;ÇİLº9<9¹õg<+8Ì˜<M;ÏØ@Ş|Kk\rUíÓ×zs.ÊÊÀšóõ°_U‰>?\\İúùÌZ=•ÓÙÃºà\n¸’«ıF].¦Ç.[];›Å‰\"Ù	5-uKëlS‚GtcU«5o\"%¶+×êï¸\\CÓnÆ°C_hyÁ×*#‰´öAºÎŒR–së´^,,‹k.V’¦ªmû 47Ë#³œtèãÓå˜n[œj¡0¥¬\'ísÅ`Fµ:yEFÕ·œÉz¯İn«*4?¶ÎC¾ÅÖôVåİ˜µìËi±mŞøY×ËÃš8UÔ¹Â¬(Õ¢ø¡W•$n½itÇ³Üi]§pwM‘ÁJÒkDW[ZÛîŠš.n{qoË«¿Ì]–=µ¯}yîí÷îY€u^Ú¨5Ø©=ßw&ğñL\r{Åi¹§Ov$l¢!›*L®W¦ws:ªİ&ÄHêİÑÆãè«]Ç²Àµ×ºº«±uÔ¨êä´®4›×W‡ı~RßÜö›ÑÀÇt\\LÉ*º9µİnõ‡£êCMm9‡ª‚|ó‘ÙsÎRÁ!l<°a™oÕÇ¬\"2»9®1õ¾x®¯3¦+;Ü¬nÇ¦~8ŒÅŞbÁÎ‡4M·ÜQK¨Š¸Mmn9é7ÆıæŞé/†Ö¨jLËÎP£n¯×h¶ÈA¦‡kÍ!oÖ6íã¶ËRÒaÉ\n×Ó¹eÎ?ºSù,omlfTğÙ«\",æ¯ÔAMf É[«–ø:› ş¡Ø„“ÒÔëƒÂld§v Ú\rî-giÔ6ÔMïf/fŒ2£×Ê¢vØ‘\nÃˆ\Z+Õ¶æLmÃxW©ìÚ¤{ô»¾l¸„—#l©Ã­²îæ.‹ˆ5æŒWøÕm§Ë*!ö\\hŸÖÔÕ«“\nq›T.(‚˜re\'\\‡7İß‡N“AllM2EtÔœ´­Mã¦@çÛÒÜ»˜®÷ûÙ²ë÷Zİ5Ç·å†òPÓœh“\\îL‹˜{ëíbéñ*vèÓÊ@(}¿]ï·¾Ì»sGº;èéCóØnÛnF¦[Ş[´:£¬ÕZ%Ï5Í(kIu—âzÉµñ£âM¦´¿b´ÅÙP`öpYynß7kO®LĞŠgœú¦ûëâ4?i¿Î÷ÃéÌi‰\"!¹ç!$ğ3h_ÙCÈ¡f¿¸6è X³%ÂÕ!uad—»Á=¨©İõøÊ×éäõf—¬‘…Ü:³{;tà\nÚŞI˜DûGyPíaİ¹Ø<Ø„š¶khK8W×é^»³™­W®Ó\'è9KvÖV¤\Zƒ¹/Õ[s³Â=‡k+IİÔ\nA+KA¸\roûŞrÉïâÊLwÈˆ¬×òŒÔZBMëkcZø\'Õ}¿µaQZÀ›¶1h¶Í¨ßí”¡°ÃmûÑºßİu7tËœìÔ„s›\Z|Åå¡)¬nÔœº*Œ¸7ôÆ]™Gê}š<`³gö¬ùørí7D\ZëMéÑÔ«ÎÚ’Ğo5İÚø¸iù+`Ú³}Í²-¤Ùğdo/0ôR˜œè±FHÍ:¦‰µÉ_Î†Ú3¾]-M|1\ZBG¿ÉZ€n^µ³qZ¦†¢Ë®vÂfh‘zı3YYî™8C†J}Û6Tr¦­ç¸]#¼½.ßÆË«-Mé)=f½áöìİV4ÆÖ—JçösÍê3„ÍL6—!;ªF³1Py«J±û	…W\räÊMğWI‘íµFXSîíúÍÊv‹6ên¯ƒ¥7”«Ú©M‚ÈD»õõ|#íÕWØ‹¢Z®÷Å\\Ä»åÁ~áÀJXÓ.§ì^´ÏŞ¼½šw	¸%íN2Ëk¯cô÷LOîÒ³–ºiï‡,ËŒYîì)Ö„-›ÙAÕÁiÈú×í_6,^4E³Û\'|©í´RYm¹µÈŸD±Ûh²wòÚ[|)6š†àèÃ[‹t4³ÛÛ™­Ş9Wxr½¦Š?×ôà2£¸İ¢»g¬–2¤´ápÑ  ÎB1PÓ$+¦ÓâœÍ™­OŞhâº:˜ó„¼k-i«…®°µí\ríÉvÜÖùØİ¶ºääR;ñ[Úšú²qg—ÓuŸwÏìF°ÚØ¦±[lšÕV•¡+²¢/ÊÈö.J‡­İ–F¯~PÎHU¢yÛ2Ö8Ã‰—V9¹tu]“‡ĞÙØ×ë(Î1]jtde¥a™>cê4”Îìˆn¨ÛVñáŠ\ZöZC`ı•¨Ì«èGÇ’…Xáê´ñ6mBXg´u‡æ\0?­kÄz4Pš{f†*9é¬UtÙ‡WkhA\Z$RaØ1w2\ZÿÜÂÏ—K>Ti©ym/:¤¢:°e‚¡hoyt…IİZÜæ¡ÎØºcŠ¼W]q»õ¨g=btÎH›=¡m}á˜\r|³:Î–Ğ¶Ö´VÁìUfN-úcıÊmdK¨Şè…t½Ò;h£Äjì\njo7ºŒ¥«¸»¬—ÆW×Á‚NÍJcëÚxçöÊ‚‰2½\'.`\0«£¸@¿èhÄq\\lt‡‘¹´CYÛÁL\"¢B¦¼L$ˆ\\F1#‰/„%Yÿ@?Âø¦¼u)s¨Lü)Ş¸Å`%\rf³d”xy…a&SùÏ~ÄIÓãd~Xâõ¡™²•ÉÙ\0ğ¤¢5¡Å>\rÌœ¸°åš1î¡(ó”çsÈ—üâä¡Ö¢@¨…bo÷\0ôšdâø{ôœ1(Ê[íf¬Ñ‚ıÛvwM¿ÇzIÒKåİÅ\nåCß´J~£Ş§CRuUT7àI@Ïo`ÓAk£à[qÓl¨çB4Ö’é-\rp~º|ä‡4TWò+hŞ5òI/}óÆ%şr>¶ÏA%.]Q.8P…8D¯$|]	fB\'¹\\~¿8_ñ+À%¤&ãàÎ˜–fj-}U†Y«µè*÷¤™bQÆ’\Z\0U‚X˜Ø¸±Ä5—Şğ@…øÓ…\ZîQ$×¢¿+0HÀ88g/Éw›üO€%îNHMDSy®EÓ-å#	!â°q˜¼·„{\nÎÑàİh)xJ6|L¡BæAÔ¿ç0Âœ›ß\\Û	Œï\rÉ<ş)Âr›	$f\"–ûY—üİ)£3¾Ä‡!GDä‘ÙRî:ÃÛx{šk³m³¿m»»éµjìa?“7ÚxÛúç™ÓŞ½\rçÁö€°²q÷³Õæ*áÌ~¼íîO[eÍê³^PÖ˜·ÕS¥atR%Çc¥~1MşP‘û·ºì‰õj0+6q« c™÷œNt_|am€‹¹‘gúĞİ´²©ô\ZaÊ{Gíô%x³Z÷¯BÜÕ\nW« ÊÒ5¸ş¡íK¤ŞÈ¤å…}¸¸Çé~‡T;+z»kò½õT_äjû›^µS›tº\ZéüY÷´Åb¸›WøŞ^F„Ûyz¹mo;ÿ°6«ï[·İĞ`a¯‚Áã«Ö¾õÍA…Çh£×^÷Çâe´:³¬7\"[#¡1æ.ì”˜ãxõÖèÍ‡ÇáÕh7\rc1ãj}Ø«lXqcÙ6yµÍÑ‚™˜Á\r­j¥rµ`†šKã>„á ¶ô›éÍ¯#®Sá°~ÔŞªFz2XÛF§Bá×àAw+=qqsDv*RsLĞòfs[i´mÛêd2jVÇgiû§Ì³¾\\4›íÚ…¿\\nòÊ@m¦v¾@G©z9.¯Çåù˜™ÿ<°¦këk}¹×=«5œÙ´bÕzÇZÍ˜¸¶>. «¶ìÎDBnÛÄªµÆyÚX#³5òv{ésßßÛÃúI…wÆª!š·mõŠM§²ÎgvëBÂx:ªuñçlÎt-¾mBÈ¼[õ;e©;ã¦·+§«NP³½«¾zé/ufd¬Ç(Ÿ™ú•9Õ7ÌXšóÅæ¢ñ`Mq óv«ÚÌØ\nS}8ìL†¼Õel3`Ö4Ã¼õ\rfgÉ lÿTuİÚhFA¨¢‰ã1‡vç[Æîi­N§h(ãHéGeWA*íÅ¼Jµ¥øYÕ¥ÌÚ¸W“Óî&Eãnufo;cZÕ¶7¹Ñ9L¶sN£•]Kò0¥j[~×ßlº×éÄ¬V·ëşúZ)™\nÅÙºímè\nFkÍé”êM,¦³¡‚áËÊuGµ^SMô<ë³…•Êd›·gË;ş<c\rmĞj…º24ØM[hj)Î»­;v›+ªyRÄÍõHõêhç.ºlwN\nëlš#{!Ó§Mƒâüz-vFÚŒ­¶‰3)\"[_œÛ<k{üy¶9Óm¬y˜g|-\\±>kaTıÜ4ç­KêØPËœêí!µ©hèq‹mjï­OÖB­{è­Îõ±BÖ6\'Všs{´A<ñÔáaÎÃ(uº¸5\ZX£ÎÑşú:X½µ·EÇñŒ8VXÚ½ÁMR<-¦BµZó!ƒZmØ\Z^1ÚPõ\nnl$ï´FÒ¨Îy*KÕ±+Ô¯7¸ÆKÍ5mL$å\\%ë×îHRgs­‡õTşÒáë\n¨¼\0ÁhÖ­FL¶ü‚6vf{#åÂ/OØ¨Ş$‘¡—ç&<mLé	¼êÉ[»j(b{Ats:j«Óêü´©_šµ0j=£œ¹h8CÿĞâˆSkCc½Ën)[>AÛµùóO¼rÏ»8«ál¹püBÎĞÂÎúe‡u”½SêV:µšõùerÍnÚÌÜs.Câæ6e‡g¥M5Ğ©ÔjSNÛ„G—j£å¤ ·Î^e¹è^`Ì’s²ç\rB©¼c§Ú¼fàÕ³f5Úı‰†­ªı+9_;]vqŞDİ´N(qlº5«{túÔü8!‰ŠX£ôEW[†S¿Xßóq©ÕÑ*2Ôryu‘)ÑRNç¡WŸóÊØÿtmZ\'ZcöJ«ÚŠ]ŸUç#zõÆ=‘ë\rrcZÇ!æ3ÅÁ˜Fº\rY39çÜ¶WµŞÉ4à5”°êm£‡šI±#­E°Hw…İj_Ê„TOøIÚl*˜ŒU§2K‡‘ÜÃnÕÃk^HöXk(»İuA°3¹í³bB†”¹+o&äütÂ\ZÔ†6äöv¹5Û»Õ:@]8l,ò:áÔtd z×ÉËÅ3\'Çñ’3n*Õœ:-ÿÔ¿oxz…¦¶zB:Ë‰+nğ[}×:õó~é\n#{¾Ùñ—¥/ÉÍÄ•aëÜe§Ş\'×±r#Us­×Nõ“5°š+u<8a‡Ñ¯Ğm¤s^^ÚzÇ9›Â™:YC¦Âëuyqİìùú™7”Óq­•JØÔ[lOÜ…ÁCaUç1şºê˜KE]mÇ›Ca&Óº¢vOœ:âW]ó2½zâåt;$¬·Ÿ*C¯)S³?ÍF`‘¡Æs³®ˆæªS½Ô)boœhMÛ4«S˜:Àdıì(íË~Ê£PÕİ¹µsõ:²nÂ˜i®ú‡ñtÕ=²ì>l|J÷Çv…j¯Öœ­[ŞÛ™IjKV»ÎÒ¤f=îrCª~@T©‹Î ±ìV=¦Úï…º-¯÷ÒŠrV–p¾¸HcÖl\Z¼2ÑÛcÄéÈğ„í™Úº>ŸSb«vi¶Í½2 Ö‘ª,6çZÓ¼b»8®ê:Ì\Z\'GWoê”:T™ö©˜·ÓÕUÖ—\'¥UÕêé„wµëÚÚÃx‡ÄI.àÊ®SéÕ[]ÏÉ¹¡,.»\r‹·„Y¯ëËÍ—•f³RuUT‘/³¿ğé€İtæ¾ü4&ûÓú´…T[ó‹zkIT§áº-g wÖÑ×Ã•¼Y®dª»tº¯)˜~ÚtpÆ´&£µ€Ì¦Ÿ—\n\"}Ü¸µ«Cj´ƒhÃé’ğ™ÎZ>Ÿjœ©4÷Ç3“	bGl!ÏPqMƒZ‹ÕŞœLÏ¦²«ızˆWÕõ„wÛĞ²:&êˆ¢›ìM\"	x8it¸:âöÂ².u³ë¹z¸aL[™w¦˜³U‡Vo×Ü’~Õ¦mŸG·‰\r#Î/.FµyH›î•K½ÎÊ-4Z1SÙõ{»3ùâ¸××™ì5Ã¡º“ÊV;±WÈVZW\Z\\°Çñ£éÉãÀÅ`ÒĞG¤wa9s6œğŠ„Q³Y®m’l/Ğ+Ú\ZqX(ËÜ÷Uo	¡UiŞXsqÄ9\n`\'ŸV{D>ußŞuÿiHş‰â_,S¿¾E¡™Ş8S|û· õA’0R»HúG¬%8ßÿö^(œÄdüR¥ °#…º«@åmûòÛÏ?ıì0Ü†šM‡ô\rîkXğ¡7†KfŒW{ŞºU«Õzü·šúü½¼ğş’zWÍÕûì{¬g°Óß?Ã7ÿìU<ÊÊƒ>§aúğYÛ ¾ÕÛÅqõ¹lòcW†K^ù~”Ío ù|ö¾lËÆâ³¹µıí<ÏgôõŒöóm½J#¯®-PÕ=/ìy\r˜DÎæú:3íl¦ÑÑYW3¶ûëğp:*•&Ÿˆ›Œª²‰7)lÜì›èö ù‡£9ºçSÔVAèİ¦Ö+ªÎ£7?­¯øˆã-©¾²×ë\Z†:;ÿÌgTGÇ+¤yœ¬Ñ­¾|æHú¼j:)v¬âQz¢œµÓº£.V~k3±êÚÈUÏ:J¦·j\\$_ónEÇ6FS—tŒCª¯í®ø’…Ö\r¢É5§lÇÑ3µWa”-U÷ÏÙ“=Å@—Í›îTnOl¡ë™™(›•»bİídÙwøpj¹Jo<é-«ßeŒy‡2nÈu0ÕØóu®»ÃênLÛdß¼êÃ?½Ì4ñ\"®DXd¬IóŠzÙì}ñgG.\ZUÒİëa¶˜6–U\"†T£É†¼X©Ô$ärêLQãg¸tWmRÓiûÚb\Z{¶.M²Z­4;æf1<àC´FÌES+UM9šÊyÜVµ\Zzj×µ±éW”ŸÕ…w“Sş@íAµ³¥O”¼­­é]»5à{BëÈ´»­KÃ»ö„ÎEè»k·s$ÕëxÃòûÕB²£,v´å]ñJ©´ãŸØ&ÜHÓ»­îv.h4Şéwù½ßO¼7Enº{Ù’£åY1[Œ:êà)ëÈõY…šÏFşFllHçØí†¿^ŸÜò‡+{Q—Bw3ÎÓ¥°™Í¬“;è¢ŞaÈXÍÂÚî£Ôê¼w°Â)Ë´oóV×]Ø{©yènè¥B	†Òoám)JoÕkïµ³»°zÇö\Z³sãà)VA·“^k†ÁÕ\nİ\'4ÿwGëQ±	Ó^Ôµ@-×Bw}U®~ùbu¸ÑÒm6Y¡Œ™Õ¿g¦¤óBan£éúl.„µXæÌmİÚÖqÓ\'‘2áÜjªÍ­¥íŸ½<KÜÖ*SZ7ÃÅdŒ6B3¥ÙìV¦ç6N+Š¥¢ÿÚòºÙÚèj›±ú‡¶ŞõOÁğpM^ä[Õ!t|CÒöAfĞIèÏ!mÕ@°ã¶6²fUÏÔmª×8ãİíµ1ôFÃ…Ú»¶f<½L Úv°ñ\'ËèÑÇıpqé]‡nw4kÑêA]«U•Z@\'¥·Û›]UĞ.Ónui_mJïÎüi¶†¶ŞjÛ½TX¥?¼ÈWŞ`!¸q¡ğÁz¿¼M:KO¯Ëı¢1×ZØ¡ev—g\nï9V¿¯ôÚÇ\Z\raG7ÑÜÿ †^N)îû¢>v5k€õg$±·fıËb:cm¡±ë_5¹Ó\ZS’fŸf†»;·¦ÍóÊ¥šÊdÀ:®Ò×æÔÎ:÷zµÚ é‘eõYee¹ÓÙbé]êÇ«0ë{7ç$Q}çèÿ\ZÕIµó\'kĞ`@–Œ(W§æ\r²5v·«ópÔX™Ûz:¿òm‹İ!ª×nĞrØ¸‘§öÈ<:Ó£Omîb-oSººöWÜÆâ¬\\Ö#úÈ‰{¡±9-¶Zß/ÖG‰¹\Zò\rŠ¡¨n9R›=CÓÒV…ZZ«!uVvÓœ5Û~Ô /«ÖõF1Ö¬…ÒÕ«¼Söt›èpT¥ÇmM#N˜cB{˜Wjt«œŠP©Î¯§Ò›\rĞÓÑ!æ¢ˆ^Ó©Õ!{uÒÈèQ7ZCŠ]XM¶ÑŸ­ ¦ëËáÎlwíµöC¬Gy=b±¶¦LcÊLÖ.>‘Y²%İLD¨×ˆµY9öQ¬lëõ:Òâ›ü¥R÷&V© ¼Q\'Ï7ª\"õÕ\ri¢[~Hl«}«Ë¦ÆËø€ÇìÖnq¢‰öÈ:h\'ÄAyÅT¼6:»Íq½¾„Ç´#Øş¤w\Zõ·åiÍ9–«ÂRoNğˆ{htäEÉ˜Aüü²î Pİ-¶C&§}b¼åè›Ø8V›m°ï¬ºúAfq}8ÑõÅq°ºp7®yD-½2B&Ì¨/NäæV\'!M*½“„P:UÜ¼â&2ÓV?±S¬7\"*·‚µ×í~/ˆ§6L©â®:è($¼:»»Ê‚=ìFsÖ?©XM‹\":H2æü3\'´#–J×›±Â¤»iYæÕ¨‘«j×\"6CÃ¥öóÅÖÃú½V…²y^¬—Ó£«Î\\¥Êà¼pİ7ö-¯Õî!kĞ»\Zw˜§Y•Û»xWJjìpoİèÎ©Nö¯5wâÎÙs‹[w»ccK8>Õö7õ3%2bÃÜ°^İUÇë4cı3AŸ6fW¸/È^KÚt ÿ4lÆ\r¡¿11ê¢ÔÖšÅkÓ+İŸ5¬k§¾#¦çë~ÃB¬Ê6wÓÍ6ö­ù¬E¶ù›ŞS›¢z®Ç§zKÙ†¬7;«&¿\rtİÙUnºl±¢§*ZÛ^Ì{ä¤®÷®*î4<jÍÄóÜa¶Ç6N—ş¤±®k\\ÛvÈ?ÓÍ5S¯ã“EÓ;`š@Ë×»ANÚ›xİë~{æ†ÔQ\\Òeƒˆ\nvpºÓiİª,îªÃ»ç;ãÊÉ¾q¬J­Î~£ĞĞ©­Ì†*=\\jgŸÜ—Èêˆ»®t]éÃùpQcàš‹ÒÌi7W73­Ucê=TBÆŞ`NÏ4\\¤úªÍœ¢bšCÎs¶î¥±‘è…§aÕmÛm®W·J¥§ÖP=@v{İjmÉ®ÏL4\ZpÇšjĞ«ı²õzÿ&Ô\'ì‰R7Ë¿7õº¸M$‡ç©Ù¹>ã\ZD\r›Ó¥8êÒi=‚Ì.+\ZÌÑ˜àøÕé®‡™Ï©\\Ÿ%º­…¤@¢´[¯VJÛ¹¶í	®“~™Eu¶©¯½óÌİë‹™†\rå†³ë±­Õú2\Zœ8»?®wÜÚ^*ŠÔ>é&Êl‘6]toã¤-	ˆœj«›ˆÓlên*&\\QvêÙ‹½Çt”¦ÃœiS@¶ıã9êx£†ˆİm“…7ÛQ•›}NéØü¸±ì)¶4•\\sÆ°7ÎŞQ¢E°Ã«e6¸co&gå4Ze™¸\\N*Äš$9ÙhŒŒíb®ÖiÊÆ¤¡zêÉb÷ØÚÃ·3ÑmÖdjĞ¥ù²ª<¦Ú&]©VöÜ\ZgúÜu¨LX©4zöIµÒ‚òFşİ™R¤¬Ô\'ÓV§ ƒí^ıÚÔQ«¶ ZõpV;[¬Ïİ*u]`Õj\"ÌŒÃët{¸£Y^ezM}µ^3Ù\ZÆ×¤è†7$Õ&İR›ğYcÎÃãì†ÖG$4ÓN‹è®NgZO¹Š2òì–¹¥ÛÇZ•ˆ3……iË¡E¥	ÏÖÊÈl§uĞ‘‹lØĞÄ’»^ÉƒYã‡‹şÉîÊíÑq?9ßfGo6¤LªŠBWfxºÉ>›×åƒW7v£¡Ã‰DW4FŠ1ÜÀıK_Ÿ²Ñ©4f{|aR›‹\\»Ô6l\n[°A™5ÔÑa¯\'MoÔlĞ­ÓcJë³¨B¨­8Û®Jm§”ÃÂ‹íH´èJï°¼ÉøxvE<ä4¬¬i…ti¹à†¶Ò¨÷V’|òFlÓ÷<¼¡•Ë4ªŞD(!¬F{hÏ\\Ù%úÚ¨ÚÀ›¼¶Ùë«=ºdZ5š¤lw·è@=iÏœDÿ_Q½ÁhY?ÎVWr…*›sçF3…ZUt¸%õú-J½²šÚswCµ„Õ\\ z‰Â+æémÑ odo{ªH2+Sı3|ó‘:p•-:<.éJWjkhu2it´Ö†•˜ƒCˆjvØİá÷£Ö_ßè•Û:o!Õg3«ŞßkòÀ­ĞŞÎ;K0Ù»N\r¢ÙéÙC‡g9Ë…Æ3£gjç“2Ú‚é	;¡Aöl¹¿n	}È±µıæ\"Àƒ¦p¡j*@ÃÛ¢n­¡^®wt[ï×æ5h1[hÃîåÛÎàŒíN¡G½s;sL{]Â0‡ÛÚ:1ÄÚó‰ˆT†íÎr±;£­•nÔpò¶‡ç[I¼úf%n›[\r~Ğló<İ©«.f´šÆqS!<¢¾rÎÜâjJ]á&àÛ‡k]Å[êx$Èòa9e,÷v]w¼ÖœßúSpERºÕ)EêlOn»³FkÆG)™?v„ó~};®Æx¿;Ö+óÆu‹«êò:«ğXÅ:K¬½2P¸;ÛáFİÜÑƒ³Ïdç8€ÛgûtºÓÃ¡*6¯K¯ãïôÊv¾é¡µ¾+ô½Ø´Í\Z\Z«&Á9sØ™“#µA¹Şìtú½Ê×†<¤¥ı°Â{×¦Ç¨·¶_i7:LYxû$“µH¬İ5yÙŒÚ;Ÿ«8Ga‡Ö†Ôl7d½iEâÜ¹œ‹Aì$´İ¸K};òd{¨#p_ìax\ræ[U=¼3Ò¤.rvzuwu<\rÌ£1ÎV·¾†ôö˜?OlrÚ’XiUÚË¾¬(îQl–Ë™8Q¦WFë×•ı§»]ëNê²«¯æ0M¬wÈ¡D}Ñ\ZõUÿĞªİ(å›Ë}0¹;ÓèÉ µ’/‘šM½ÖB¹Òu´}™TÍñÄEÕ=“µÊVP¥jÃm™ıq.ĞCY+Mû4ê®ujtê{ÍCÉ™{ŞjÒÌ£:úó¥úcÎy¤‡ãÕ®ÕE8îé,¯:Ö70w:]Ïê«ÊV²G”wËÍœsÄ€t°]gÖ‹EM%:m±ç˜èª/3VÏ´|›+íÊãë†Ö‚¬{¹¬êıšD§lpéÔ›Uuİ1V?Î¦iBGt…¢öÙ˜Z×¹gz6âÅ*„/ÓqcÖÆ$r¸ÖEİx„8ïæQ5EÙ5¯ıÊ¡GÏÇ°ráeÎ1ñsE­µŒ\"ezf‚sÒ§&óØ:Õò‰…¸HĞ]êğÓ•lÃöµêô¥Öã·ış¹J¨×¿úøË¿Ìà“è-ÇöpÏ Ÿ‰íÄ[cuºøcowš¹_:bM›]ZŞgÅM>.k::uê²êCâ{½î\n3ëÖ\n­8é®«7j,»¬:4ª½^¯J/Æˆ9”O–pêİêÆÆ7Q´Uo…âƒË·éàTkÕŠšg‘@ÛÛÚ¬®[»km»£Årß öØ[ÀLc†\\¡.U¡X»åAŠD4\Z}Í“ˆÛœ¨6Œoø«8! 91\'½µ{©ŸœíÀğ¤Må¤®z§jó…¢ª(ô’#/„IÏF<(FMZ÷šŞÕ‰0_u`\'ùû7‘söº¥Xi=÷İ°3Ì6ÚSÅ¤«TZêƒD‚ra°Ñçğ>0øQ²dX(š¶K58ÍŒôòCÛ’‚ø?…l&ˆa;ÑQr÷e¿•4•ªrÏÆuB_Òì÷$Öü‹\rhÛÑp¦³•ôÓáü.­“´4)óeìa/šŠ´˜\n®Ÿ	›X+íg„]™)p=e\næ¯¢J\"±Qpùô†”Q5„”†z‡õÚ°†#õ4IÓÃ ù-±ÕVıJ9lC`¡­\\¹2ÎÔBE@Ãü†¢ˆ± l²y¨y³ë‡mº!ä‘<ü˜êâ÷#ùıVûíÕìC«Z¤@éÒÅöäƒ³m=x$Ò0r%ÎÔh1el”_›¯¸z4&ï/VŠ›Î¥ôúÊê‹šM&²†åOj¤H³Œ¼ã.¥\"?Â©¾A\0/‚´×ÁİÈ²H;ù<¿¨ä•x`_X3Yxq:zØ¡Çi¡ğ—‡)+Œ9›…à/C*#À‡âÁšŸ{ÓLûèİS ¥8çóı…cµG‘$æ}ƒÀH:¿(I[UœpJ•‡ÏCÖœ7I×÷w\0&ÓäÎïTD¦|(‚”–hÀâÜ–iv•0”—§\"½÷{ô·3y2[^¾Z^i2IZ˜Ï5•¤?ËåÏlœN\n`îÿY³a´å«-qÃÃ‡ÏbIµô ‡g†\Z>•µ·	¨H-éÎ1\r†f˜$-R”Ô<é¬@¬ÓO?d¡$”xš¹ÄSNÆÛj°S%‰Şj9ŞæW{d:ÏåÍ|©ÏÏ×µèX¶°	à_Î#ÑZÄ.°qa¹´ß™<3_awÿòö54ÓË+<ò«üõ‹\r>Ïçº ¼²h¿ÚÍÈ+—+\"Èß¿èí›àOŠ÷—dË	RÄÑîÿ·CÄ_~ÄY.\rM¿~oùŸ©³äZ†ôD´ùI.JÙV H•ãqÁÜ×i7Eù<Àï<\'û?4%/3±<ˆÒ5{¡G(ú˜#¥\\8>lŞ2~[6şâFóÜdªòIÓKùÁş^’¶ÂäÇ™}!ÊøUÜÂ<ØARˆïa2ìà;8=â§éò\n^«¹¹a!ãø÷Ui­¼oi°(x/O åêæòPG…Òç©´×-™ö±ÍH³djÁ¥d¸©}zä‰¼(_Ç¹$U^œ$ü\rOØ åF6cB„e$€e÷­‚©dñXğ•Aş~˜œ!å÷f¥ĞÏs÷}±ÉàE6KQºI8×d’D•ùÓf|Ê“D	e\nüÊ\"MÒÃÕ71U}~X/mv/øÃ0ÃÁËÎxlB]\".ûÛBè$äÙA¹\0÷Àı§ŒÂ3NµONšœî/%¬xJ%r\'³°Vè£)Çêft\\€÷_Ø‹R\0^¼y¤ıªCÅÔıX÷!c¥İ7ÄıÈ§Ù“Ak¼—”0$×\rr§#œbŒágÀp“ñ†AÆ©¸S‡ÁQ‘9oìğ`_ÌÍ”ËEâ~\"Hâ—zš¦êÇÑâãÅ`T_ğ¤÷ÙP……R(¶´^¤§Kö[èí#w–EŠk;Bíh:qZ×OÑÏVOĞ~ Û¹¬^ëu\"JûZ‹áœ¥\'øËıı#=Ê\'œïıÆÈå9£êHòÏ¬f ñ$ˆ¦Ú°,O\rÖgzšO9œäšûö		0d0A¤‰ïGÛ–Á‡YPµ7i)\nÉ2ŒØÌ»w˜Ùïkˆ‡£ó•›‡KB–‘›¬t3‚ˆæ×v,YÓ¥Èâg^\n$¼7„,ÛåÒ÷ëJİOĞ¥…ïâÃçHä²ŸgDS4#›>RX¥ö\'*¾ÏO¿,¤/Æ|d$§MIëÀ£—Ò^×ùçkPöç7\0Ÿ‚ÈÀE=ß§õÃUñ„Ğ?ğ¸Ô‰5üJçØæÕÛOhåiîš‡\'}úŒ—ğ†p­ë/NrqŒã!Âb®	Š²ô\ZT™û°õ£›‘‘OoR@c˜ê¶Dê‘<ùÊx”~¯#h9‡xş‹8å¯xÛõPN£©d4\'%~z…Ÿ£«L*¬l‡ÉUŠÒ¦°HkÉ1ÀQ>}EWcsÀ‹ÛEv;+@ÊDã\'êò¼æ)¹ş»oäÈ‹{Ì4M_<Â²‡|¶Ï~AöR?ï#ôØ®“I/Uš/ÃŸQçKcn£r4Óãx½LY—-yÖ¾…•~¾R!L(š>Ğ‚RğÊÚE“T¡H.®[®şÏÔe¤á‚Ê)òÙssa‹$¹ÕD¦<¾ÈËE×{N6È™¥($‚<³ÉOxºù™•…‹\050H.‚%ş¨d@HœT“	\0ˆš„|\r\0ÂŸ»‘DQ@€Ñ:¡Ea|±l?0Q¯Dó ­#|„+ù£®y×lWQ–AEJÆ‰Oè-KàšÊ„æ—É»n½ıOhßËQ.ï°Ï(<)£_\'Šœ$ëûÓ‘øğ÷Ú`È~…Ã{$ÅĞÖ/õû*´rçv!‡ò>)]jİ…Ö“. cùdÆ	Îãùh6’i%ViX`jrI$Œzº½·ÿK3lËñüó~Ä×Ğ¿¦~2ò?ÿf/ÑkPö’g©`Š,\Z+ı>¡Œ\'mf™èi¡ü5 Ô¢$H²Œ±…yò>Ò/}	…šT—Lfq®d¤½Ó$\'Ê,ÕÿfZ95÷«+÷9MÄ|ÿÕyˆë\'¢´Np?à\\AÇ”¡Ïìı[:DkÙºü´Å·ûùt	¬Pb~ë÷Sr‚£Ûç ÊºÄùÒ®\'XÁhn éø«À+­R€²ey9ŠÌøäi+fgÙDîa^û¢UXü6Ä*ı:À=7]¯u„ö&\'©ğ&\'¢jÎV}I;ŒMlJB$€xœw,¬®Ò‚O`$O÷‰ÜôKĞ\"á*‰®\Z‹O¡ı{ \\pÇ	ªßTNü-ñ;îå¥ğ0df´OA‰Hİí\rs²â›f(‰nÄßê‚roP¸;ÆÎ:”Ş,ıo`0ß¬ı¨ûÿİíşóuŸ#í\\ÊF0¶üdô’(Òv•a—<Œ©$½Ò 8øù¬%ğùç¡¢°}­ñÂƒï’Šù\\„¿‘Íña\Z€`22‘Øl˜è_„ş/ÅGaôìÜ=ğŸÿ-è6 úÂLş½Úˆ\r(Š~Öš [®ª‡6PTVÁ‘¨{j½C-«‡ÿ•„áw.ŠaKÛ³ımüK	Õ^¶ThÅÀÃ±1:ñ3\\Êã¿ck4ÏU©ÓP7ˆ§‹tCÛ®D›ßA\ZA«]­ao›¶¼-GC>³ÈÒâjM0–si/6¨ílnú¾»#+İæ›ª\'´a]l3ŠÔ†]ŞÖ$¿¾Óic,jÁw~µ„63Rëv”š_æ,¶İzwßÚóHOï¶ÔÑ‚n4yÔÿÜ\\‡Wx7l2—nsƒv4šoáì¬wÔe¨‘çàw¤A—QÓ‚G;ë:ºRJ—w˜2éôöÛ=›2›;>‚15&³%v¦ç±FDTD¦põëöJ^Æó=>¸Q×Á­{¬ıú\Z|“V8´Y+_—‚Ël×£`è~ô¯5®Ûö¦¶YõNâš­wµîcü~ÎP½k¨Ø¡jƒkı(\\ïs±ãè$µ[çÁ9éºÇ‡ãã“e¿Í´0–œ}˜ÇxL¤î\rPUhò2ØQ\'öç¿½8ùun<º¼nål»Úìü¹ÄøÕå(Üì`î_Ä%ÂC`àÑx_¿rm-wÚ®ïÄ¬óA¦c~ƒş\rŒ©O+Öy8Wü_5)ÔŸ\'dìÏß¸IaChqî˜ó˜Y@ì­×\ZÍÂñ	Æ¥VÏn™Í™½-[ìœ9O™áe¸X\\ÙEíöçñ¼Å°;‘Ş†h\ZŞl…ßÄvË›e\n7~Şx?ºnW-È§ÉÔ]’5Çríºÿ|dñ(¥°ğéÒêh³\ZÙ~?N¢Ø­$ã7Õ}ZA¶«i[0ê^·ÍëØĞ:Uyc¤Ï>İkˆÆmnÅÖ†Í\rĞÿèÆG·îy´S.Áø›£–O‰—aSm˜áu:_hx>] KoëÓl\nŞ>‚Ç¼opóq§ë!MOÛËÛíÙBgjóæ¯õó)XGc½ÇLwa¹ôÚŞ§yŠÎ]mr#ÎK¼Õ8	Åñ¸Ë\nZ!M–:ë‡Iµ×Ğ˜yíg¾CñÅéĞ\rãÌ•6´Ğğ\Z»P#Œ\Zm¨ñ•]#Ó&¬ONêÅ¶—‡+£B•Su|»D«VõÌak²²>ƒ™U\'sr,ÜXòf6ê½Íy½ï¤¼¾¡u¸?o\rDºÕ­uuNÀ”:¤ªuµ£4æF;µWŞdßš\rDÛ²¯µóøÚm†miÂÎytİÍÙ™9jÎL_*|eËòuƒÚ7vgì¶î³ë—½ØÚ0î¨ß»Ó#‚°V¶èV´æ]A»¶GË†ÂÎ­)\'Ôƒ\0c—ÑŒ3¨vlèZoŞ\\µ»Ö¾1m‹¶†Ÿ6ğ°oÀıÅÉ5{{õ‚ÇFÎƒÖ¾£–ç%ÔS.,iÖ{‹ëÒÒÇ7¦¥¨\'™B”>ePÜ€ŸM¡ùÔÙOôËş¸»õˆE÷²líw:¹vèöŸ5q¥1[Ããó±Qİ¶¶Œ=š³\Zµugz!ô¦ªš\Z{k\Zj®`2S§VÂ±×E$+Nä<jŸkšŞr©ÙvAs+tß\Zéã5ˆê1Ù´gâ¸¦œƒ·7Ô•åVFäõş–Ò™«\rÃfZ¿Nj(7Üj[§ÎëvÍ ü¡³a½¶}kˆô¨w@§nÇ—ùì±¼bÈ¤#!½ıØñxã<h;í·|gz”fÚ@U±¯l;˜©»kş µb¯sG\'ızí¼iß&DM™œ§ª9©âÜáÆNøé¾$GEJÿ”ş)üQ)`ú\'KÓæ?¥€ÿ~)\0C]’Ú5:IVwºâ§íæ:·šMªsa™™Ñö6ÔU¬¹fõ†çFı¼87ØsF0\Zt»ßá;ÒZ<ÍëŞŞöÕÅÁó{¥5 ”ÍurîHl>ë~\r¶j’m¯Õš\rFufçÖªÖ~-wûÌªĞj<\\Š×E½¯0‹YÛª0±».¿?ñGŠ8Ókø:4nN‹;·Şl5Ìì\rÆb¾uµí†î®ªı^MÔû3j¯‘µÃ°±«-~]\nÈ ßâÛQ¿r{‘‘Hg!´öŞ\\â-òˆmÖÜ²§u»ñÕiéL×5Ï”Úr?t·î†Y×,jÄŒ&íex¦ùÃpcL°ÓılyYtÙ.·¢¼ÛH´ºH{xT\r—*VãÆsşBñ;”4æ;›Ÿ ş¼\nh°ò8ªo:$½óGÖ1´Ë®_°p˜-–ãi§7İîç»\\ ÊŠì4jï•_=*£©+zø•ƒ°Ì”çFt*\"½ü¥Mò:ıç&ù²I¾ºÉe7³Æh>‡4®3…„¦å‹¡¸g4Vƒp>ëş‚£NÃv °7¸>Úôo°9¾º1ß–ı¼Õg~Ÿ|ü{»€–¶Ú0Ú$›vÓŸsUl×¯ËvıÄûsÊFø+‹¶zòŸßü\rãÜeFó‘FYóUkÇùcl ı×6¯ÆpÑk\r!öü•ÍğÉæú€·û^H»ÑXsÚ³Ec¹Ÿš=|7±åÃÎö7¾´Yá»íBgü¹ÖÏ‘[éûñ¹°ûÅmÚl4‡óÃŞ˜ËtŞk°»=2Søp1¥G¾X0¼	°?·	<G°¿\"ó€·mgà1ŸÃ#V°	#£+·n@Üª~œh9@ïô–“š!MyÛõT\rŞOPõìoêÎvÍ*ş¦º÷ñ¸k¹¢£!8&ŒzInU&İÑùJ±VƒêoÍózÄl:â°İhjZs°Ûø+`6oL&[VêSMˆD.ÎÈ™-fôVëTÙ-övaWmfdsÂfÏ÷Ëzuãë©´\\x·FÖÁšğ5j\'°v•òñj¯™y^éPc{¡—d«#R‚`9\'e]e™j×´\Z¨Ú<\nt»~h¢æ˜ÍªK|ÅÈãÊLİé,5l­Æ‹›còS…\rÖ&<µkÌO¤;$-M;×ºãÖ¨Î”%;Ì¼i(úÆ?ñ9P›öpJ©4ûÊ9ÉƒSe²ÑPèöi}”Kå¬Ÿá8î-ÊiêOÚ(şyšú‡Ù(şÿş4uÛÃ£æõ™óuºµYík§©ÑçÿK§©Ñÿ\'tªe§Ÿ!>š³ÈÈß.†ûesºïşÁÓTŞßI§Ú\ZM¬jÀv »Nu¾>³5Ú?Mµ±6q¢æ2Üœ(îÅT‹%¶ˆŠ5êÔ¦3ò\rË—áX˜hWwÒFÇí¡!bÀUWmÔxhFs‡ŠAÈêüXE-{6“ĞÉ¹:?xçUj¨œ:C(ÄPz†ÅéÊĞ¶š½CÇèGíùéÂ¤Vğ¦Q]ÌPLµ²Z²ÇØRó*®¶#i­éh4[r¬Ô¬DõX¶/Ş¢İ¬kğÁ8ï6]±/îTE—¡Ó)éÚí×ñØ††¸ÑşF]Tb£P¾·\ZŸÇ‡™)Í.·4!gƒ3Ó¦šr¥ê(f{ãÙ¿¢Ó/ïÇ/^\rşó¼óÏmìŸç?á¼ó•+ÀWÎ;ìßû¼³›6Ùue¡mûO9ïÄğ¦Mêü?uŞ‘Ï2äÓ¥ÆÓø¼ãõ\nÓÎ;ê†ºM©#*°*P^õØmíİ•×Ÿnö7úÕ)um›˜°7ÇbE2tÚßOÔínK·™İ¬3\\éŞõv:ZMTÙZg\\ê\"7ã´¹\ZÔ{½£Ò07Îdú:Ã¸©œÏ,-7í^c]­.ujÁrÃ»I®Ò¥íeCV\'-óÜ\ZÛCå Íç)9ê\"\'jxÒÈÍÒèÏø›£Ï‡}¹»İlw%¡ºiv¡v‹éÁ§]Ç\\ù*¾é…¢	U¹w¢ìâ(¯é©jsiÜnêˆŠ\rÏ­“T¡FmçºœR#çªõê™hòÖ\"ææµ;a>·Ftg¶V­AkùË[Ğ?BÿÜAşyúÓBÉNpŞş”ƒĞŞ‹«„şÔƒP½±–CÎƒìãƒÑ…FÍAÅ©Œ›Ù$à=Òy2löX\n›¶¦¤Cm©;lPıGµ÷Ó¥B2ŒÇú£šj©Cg¥lwt«ÙÜô¯´Ş8Xw¦T[ı½áYv½o3×…)°1ŞQ=r©ìínße¹¹9 {Ã­æòÌ®»tÍõ¹½€çŒÍMõMsµÑ¶]ºzjï¦W•ÜÑÆ¦=uI»ÒSXêîG:.MÙ\nÓX³ÇÎNGÓ%SŸ-™*¹VŒ%]g-ò‰†µMfO«ş®b/G£ÏÀÓS]§ëÊ‚‡mõÚ<´&›ÊÔÔ»İ½Ÿ.º;¤¨ƒ8Àİş„°®]ĞõOèéØ¸ª¤ëŸúìäİïf­o‰/wjè]œœ˜BW¤Œ…nº¨cåJO²EK‡seë’ÉQCµN>äPÇ´Ğ\'-å™V\0ˆ¾°èC•”«åHç-ñúVœ­ÌÓŠ‚«‡±ÕqBRQ7ÓaşCö;\"‰‰›	8ôÈk>^¡ó^Å\'ˆÜ÷r³w‡ø4=¥}WO×(üi6¨,€¸ónC5qğá×‘Da«ÛeûÓqÜƒ²Q;^‘¢%C;y7ò1ÈD¯‚K¡è]Ÿ&–®’öğy„fÊ‡vÜâw>RşÄ\\²èqş@\0\Zyİ»öõ¥š?³¡«ŠUJ¹©ÄXıÍ^ò$®2,H„øúghqBìæeîİlˆ”§Ãù	 B pì8/HÁ‰_Äaèƒ¾ş<i®ÆkzM9æÄIøàœkê‹M|‹€‚¥ÅÌ\Z{w¤‹B¼Gp‹6€ßU2+‘Oîï9\nS²¡+a0dù\Z1ÎşÇåLHÍ|…(Ì0<Ş³Xù°¡7L46x*HLøèfœÃ Š[Sd…H6ùz’¨åãŒ=[8Æ2ÁğÊA–tH¼š‡ÒŒ{>ö[!–]vÖã\r\"•Ëâ;ôN|¥?Æ¯8­¥øÿ‘xKÆ¸¥xDù¸‡ŒÂ), IÅká#	q~€~äƒR[x/mØß`…k**Ïù£W‰4á3lëè•J?<±Òaèë Z.P\0¿“Ä;ŒT\0İƒ}Üãt” •<åÄİÑõüíşì‹V9Ÿ­É¢ø5\0™áyÿjU` H©‰(ö*\Z®çX¦’ë‰LH5©öU¿Ô—Te`o8%PâUTDM–¥@hÌv‡—D	ş2Œ_êOº6°C<WƒàÚóeš!ò0ÔË=˜vÅã â€¿ÔBi<ğ8nÈëĞœ‡ëk4{?€´õ2<Å‘$3Kİùğ.Ñº+‘jb †ÅKƒÿ•‹EO\0¤Ùg	®ÏŠ…Ştí!‹@QnŸ/V½\nCD¥ã»Æ¢Q-O\ZiPe€\nÄñLÄÄrôr‚äFş¹ ê¹ôŸ®ŞSï’ªœé[üã	¹ñœèïÒ².]@{c!»Õ—€}çäÀ9?ïØšœÖÂX–ñV¦•DÄŒÿÁJ¤â’ê)¥F¶@}’JOó8cƒêÄš„¸È‡3	•4]PÀ?9¾^¨ñ‡Òqş_ïhù90Nñ7J—¬¿½ÿm&)–ô¶è¦>¾­$şm*)GsÒgWƒ·tÿÉÀ?û:’~’MÈÛH:J{¿§Óß]Îtı“·£¥c	!Ø«#T´dõ~mÏç•Ïò%eŞ€O£h}w¢xdgÉŠÛ±”•œXbJ&Q\n°Mÿ­YÒnÀ¬^<Ğ<a·Rl-úò{Yò»Ğ\n9ÎRî¤–|Õ|ñ¬úCü2-¿L?êëcåÏQ>{ã‚~\0ŸûşLRTÙ	¾ì!È¯p°YOùdNY`%Ô{Ïÿ±»|ˆ6÷+%QŒüA\\{¢s¡EüÆüá¯íÂã\0Ä\'ç^•s£ÚA…·2À_¬•i÷IÔkWãP’ªeä#c%­%nçg\0ãü<OÃ|½#£1‰Ó‹ñOe +×—ä#öÉ%ÑVå#»İ_ÛôFVHsŸJ`È–{¬–ÇÄl´«y¢ÍŠßxğLú–Î…«ÿÍ¥;“eùí_ëõºP—ŞÒ_ÒÁî4ÓõçöÃ†Àùèˆ0É,Š¿b5@	Á?Èj É,tyşKVİFl7b“»ÛoĞ;e<‘BhØ Ie\"UwºÀ\Z–‘+ôøl\\±&qh:ÇÚ¡g¸^}D¬ÍÆèÔ^\r»WÙlê(ºÛ²³~ÉÎ¬Ö­é—©H×3ìWToÃ9ó†W7q lºËûØÀÎÈÎ¤}aûĞr¼»ıuUsåµdB·62ÔÉ®\\©TYëL55İó—Õhu¯È½5ßÏ¬AÓ¿·É8Vß“İµH{ÉJ+„zÊ<_òæ¿é@é]™ì*d§>Ôü¾Rº¤ÁzµO8ßæPğUää¿\0/Í–2Y£…â	9¹Í_	šPìø½=p˜ä\\<à\"£nÃ¹t¯ä4øC¨c¢R\"Õâs8cpVˆPö<€ÙDù²œ8î	İ£{–H …T\rÏ×æg=òNúè¿¦¾xšù1ÒHŒî$Òi@‘Bê°/·—Šœ\'ÂÄb G„¯¤åÈÂ¸‡Å=øÏá³‰zMäÎÌ‘Ø\\ÎÑàİˆ©äM*ŠÇÒ”•E”è3<o^ã,ÙæßO’N‡^)ãÆš­\\î–Âü<M¾VÄ¤G\'C©L¹±ú*öˆÛ‡Ï	Y|±/÷òejÜGÀĞ´\nÀ®!”ôÉ¥]©/¸³ô³$á “Z¦^†øuÎ§ôğ]¦\\pRÍgH*‚¹D‹(©Qi•¤È}¼¢ÇÉ-2X\\\níüòPSj¹6ùÙNßf?i?Ô·¤%%â®†ÊUÆ´ DyQXVÀ«ÅDMäc¹# ÖC¸zsIÊ^§QP`}pÉ²Å™h|™AÄKµ˜CÔ¿²¶cÅË“*€ÖÒS]+PÆKÍƒÍ²ôúH\\ñFæ	*·æÜˆÇ”Zğ…¿GÿƒKaØãágF~­Z¸[Ş­¦~fäòL_ïü6êrZ¾K™“ÑM7ë åà\"™WÙ$é£ş¦QÓài$O<aÛÏá¤.ˆ€aà€%3¯Â§²~tÕ‚º5åqGF¯ğî\'°šfÊV–‘şJã(XÚŞÀ‚hn\\Ò8—ëgb(%c„‡\r<ËØ¹ÄËâaÛRlø%;À@ÊNÀf²(fÓ‘Å‡ŞXª†@Z(p:ŸÄk-fú\0 #Er¦Sàq¬PÀœf:tÇıó•¾Ã½ß¿<! å¿L¹Ÿá3zoÔ	4AqØÑìÕÆgü\04ş:Tf™G\0³Œİç4´Ô%\0„ì0e¥š™Åô=M’B¨Ù}š¶#Y7!~÷‡¾<¬Ù®æ¯g{ÌHÌïMÅ·FY¼6_™Ó>`FÌ=ø9]Êÿœ¾Æ (Q½~¥¬¢-1‹{C@,P]q4Û*ÉíŠaò6OË?âáJ–DÏëÌ¡tj¼?æ¹F…ÿ°‰çš¶Ãëÿô}şÿ¶çÚ?}ŸŸy”YĞè6Ä¦»VkºS q“<Êæb“]¯ÃyB[z4g 1ıŠÇÛ^{ØüŞô}fÑáMmKÆo5#_å4j°·îe¸nÓ}ÎYì5ßç;¼Öçğş>¾ÏÇ›»Àw·yIî°´Ê©Zœ‡•Û°K5\Zûm[&·n—Ú‘Íy¸cXªMÍ‰1êµ×Œ½¡æ[¶N3]‰l+ú†ÅÏ\'î¨0Ê™jTo·UãªpWø¿E[wò\'u™ô”•&İÙ}©L–9Á©Óì³Íã5h¥G„œ‰Ul—òá¹ç.ÉÕ¯¹se‘Ç•ÿİ:zñ½nÁÇ¬\0ã©»Y^øú™Úİ^v+œ;?“]Â–Êµ¿9‹ô\\ÍWüâb§be$‘&k¯õ0ôyo` J®Ğ6(Ëf”\"¥P>Ñ¢¥’‡‹M’X4år\0 ”ØpõI·¾\rL«òuÜÃ/$¼^ªî\0Ú¹—ÎÜí=‡šÆ#…ŞJŒg—f+õ{yrx€Ši0/44ÉL0ßx˜çá|G$‰0¿†0u®îYóÔ8 Ï§gÎ=[ì}Ø\0ò+\ràØë\r ¿Ò\0Qû¬ÏÎÒmT©¾\"£?pb›À—ª~î4TM\\z–B™FÉÜÇf³?³š§ìíøxÏy£ñ>ñº?Å3V¡iy:<ø„~‡fY_Úî£ƒrzs.j¶-„Í™‰\"<ºg*½#)«½`\'üÀÍbØğºéäëÅ‚På•}¢Ü	™xë\0§h‹‡;¿¯<³ˆKT$©‡I\0I¼ÔótFÑğ\ZğoÓ<Œ·oíÆÃ©Œ‚%\\;gôRbóPÑ†‰ó²^Øé–y.Ö‡†n1é:¹œnOjZg*¨²T#$yZùêËCÖT9I*ü¤räz¨›ä´{R×İ_A5;Û\'5yıìmÆ3\Z\\U3EM±@•3~LàÊ\'ÍÒ%T9É8ü¤²¨ß\0UE«ó š|T•5§dv&>*’€#]kI?­Eròa„NÚ ¼tŠ4r}ÿ´‘ TY#Û„²~úÜÓVB/9\0ğÒ£YÎb\"¯J4öIGŒ€Ò=\0ºA‰àçkpr\nŞ4O]U‡üÚS}‰XQ‹ğ‹PUÃy”²I_eQFEîù%\0É¸Ïeœ„QÖy’‘\"ÀÏ:I\"dòËˆÌÍ>ÃŠ#xœ1Ñ [ifÏĞã¨3BƒÄß´rù÷ÓÓë+üómr~±,õ?û%$óĞA{æÎgî× %Îüá-Mf+Oç®EcÃR(cœR¢yyÙJ¶¬£eÖOäØÏ1&±\\úVà9ô9ŒŸÅãw¹J\0_â™ó=Ğæ<ÏË¯AE1š¼Ëcß¾$Ñ–6ö³Ì&ºxûWf\n_¶\"’ŞDZ—ĞØ2/îfNVEá70›WTËõ\07\0àÅá/Ü÷\'‡Øàö]ä\\Õß@ş•xÌçàQsÁ?Jˆ×òG$Ö}Cğø+™böUòFĞıŞ½GŸc­j”÷ıC:ùKŞMŒQÒï3n-ùÓE|G—¤\"ÎŞà¥(Ö\n60ÅU—\"wŒL‘{-M#kšö¸O,Ü^İ9‹Ü1µĞ?Ñ^Dª ‚îl<Üé§WÍïeEJm\\Û¢„z^ä%ŞOSH©š·¬bá•êßÁ@Ÿô½ ÏnŒ¤}>`â\nÀˆß}˜GƒuEôWV¤€\'÷—í•2bFl¥ı<jYzE\0DšØ-ç¥–‹›ü§^íY1ÒúÄyã³äô€÷i«·¢§g‹~>‰-Š±V69ÿò¼ïÏ‡#pˆ‹Z²Æÿ»[J±é	*Úyû»oEN\\ÀmM2lïZà$izh¨òŠ{Îö>EGİÓ‚¹:\Zf`ûäÏ+øòq´ÿ¥ä]üÇòY²óÍ¶€¹¯)Ó\r…1šrèQW\"Ş‚¦\"f…Ÿ3V}¯ˆY&\n|¯¸¿”Èa‰ín¸†§ˆì¶àJ9Q6ZLeÛSÇ\"£H)ı00ÇÿRénWnÂ!^îh\njpÄ„+22ò3€¿ø®~z×—V/b)’Á€AÖÀ\"tJ=]{Q„ù+ó†#ŸÌÛ¦_k®l|ã˜€?*ççWÒ©cĞ´Ÿ5½Ğ ³K§\'BÑ-ŞGìhû‚¼èó<×sñµnqÉåÛÇ\rè»ìl\Zx[ßïaIè¯‰ü¬tôá$\Z*Ö6a8Ó’øväo9Š‹#]êy3o#m6éÈ‘áh÷1QyÃHİ ø_İ”`\0^YgØFîqÜTîiÜ U—ÄÍfŸÆgÆ(Ü/‚ñ-Æ!ÿ<F\"ÿ8ÆÂÉrÜãt\\×ù¼ª#Á¤ğ\"F¥ğ<Æ…ÿ™=È%ÈäŸÇØäÇè<4/©FöiŒHöaŒÅ§>ªFæaÜ~æYP9Ò©½‹…s$î]3í£÷¿GËÿøKğğ/ÿ•yds®˜åæ‹şÆÓ©äqäZ\rx™{døKPÍ=€=KÒ>÷(:äJ§å[=:ù\'®Ä9B¡U)_,\\Øş3Q;aH<k/™>ïpBÌ!|ŸúV! ‹¸„[ (ZÂd¦ÊçoÿMÑ^P•ı“VşZI‡ªÏIˆØé#VtçsŸ¦B\\èîÁ‘Ùs ÿíÇ‡aİ¾VãkàcœBwëh£ğè>pä€p÷ı2ı8Âí×jZ¿Vï×\ZK»vfğ~\Z¾¤¸ğª¤B³m¿	Î¤ŒN!– û’û†O,<À‹Çò¼|,Â\'/“¥XRø\"^– DËš‹–(àE²P¯âå\nx.ZÀódé‡\\%^Æñ›òÅµzX¤œõIä®‘ïZ‹?ÿD“/?~m‡+ì=1mÍƒşVûÒâşØŸç÷ôhÄlå¥*	{¿±¿üWÆï-m%hõ×3›gìf	/?3\'ñ|<û\"¯¥À78%V(Ğ]>ú_¡vÃÖ¥ÿzç†ÿJZÑ\01Ñ€ôˆòîã½ü™ĞM°¿‰¾ìÜbCò\"p2Ğx{làBî5Ãî%%?,Yög4Œ#ÍÏ÷t|ÉETÿÜ#9wi°ğ&w‡Tw?ÂOe0\0¯€¾\'¸?V^&2§ä2>¡»Ç÷dêÑ·äc¸¶KÏŞ§$ª®ğF*¾NJ~ìM+îëÈíêaÿjıìÑã®’’.œaëEí<Pì,5Ó»×ûæÚNp¿24÷¶–\rÛøë–ßŸŸi¸p)ñ¨|\rtŸ†äï{ÆÏt üG|üòj®Ïô¤ú¼~Ì«tP<*ˆÚÄw^’-G*\Z¹\\»/d‹È˜S…Íô»V?Å”²ş¸ñÆ_Ğ3¦ÔEõØx3òË‹ïüŠ¨|‹şä†}PAø1§!«e‡.Q ËÄS÷ğ“$ñ€|\rÿÙˆÄ™ÆÂ^p€Oòd¬Kâ0Q9Ë –…ŒHh¨5¹“¦„¤sÚ$Áh3Á®óùºñ—©ğoşƒ“úöñ†ùü[I[i¨Ù F> ï–¯CÉE®Lù„/Ñ¾+	EjşËGöû#ªD©9@9ªÁœêœíFV[åqáH2Ó6™¶¦ıÊ@äc×¥†\"­6K¥*v0•1°Âœ¬€¨áîK¹˜Ğoéá}½Y°7K™WÊ¯\0D .Î|\\«´õ\0–³áÀ^2\nú‘äO~A>Ã¶¢\'C™¥Jº^êæW&\nŠôjõ’m`ï°£vhsi~³aò,ş©@^vAfĞELÉ½¸¢?Ğ½A¢«IR¯Àù¥-ÖÃ´ù<4/Œ3NFÑâxÿ~(=!Ë?iŠÀ4Rèı2-ö×\ZJ%=üYF´Øo_^Ò™\0àööÅÍå³±{!0d¸¤ğº÷<n%˜nş.İıâ~¥_éaÈ^<ú§üW‘z‰(0üëäbaéÀBà bIkÈ×3,_ÒŞüÄhÉ\\Ó™²ÀFª Mè×)7(	Œş4áïˆC†ÏJc99§ƒ\\Ó…ñùå]I	“>òœSÊ$ııË&Ú…È„o©èGÚNêE>xÑ“v_œØ+|)H‡ÇŞ…µw o,ó\\ş\rébs¦˜â2™·qô¨³\ZZÁÅURxv‚Æ¯táŒ$˜ßßAÑÑ«˜Sæ‹´S:m`ú\\æ—ÿ‰1(—×Ê@OÁUi_f¯6P¢·ù³Zz*®¤Ğ(_\'Å]şs¢y}\0KÅ?¥WùÁı»õòÕYübwAM‰ı¥óà—Àü³è©\Z¶}©ğÏÏõ>O9Ä\'pÉ/)9¾ÈwÿèómP^ŒH!È™š©Ÿ€cóæË°¯²£ëWZ‹j~¥­ò®}¢‚+Á€½kÿŒÎşáöÿs/]C£Z÷­Xä\'ô×ûmü\rúÁÿšºİƒ~\'rßMS¦B)ødÆƒ¨¨GÑçïkµ¿>Ñ2‡ø”¿.Å.\ZîŸO+?0½}àÆ;…¸€Ofz©P_¯è³3ÒÛ÷;Ü[çç/Â.pm=(Ü§xAİ€AØ…D:ÙiéJ±­òİò#4\nyµpNO—Š°ŸWÙoC€\ZïÔeÏÈU’KH˜±áş¥î%âöÓj%jæøÎ1¥ºïíY±–¨ö29¯I Fè\\J\rß$µ€ò@N%õ:u¼”„…øíy¨ú_m6Ï]Ëæ pUı´\n@ß\\°›Ï38vKÊ­ä“ışf§s‚D|ù‹ä<ä²˜xÕ„Vù…ğ8ÇGKu‘µR>‘\' œÜ÷i¥w+ßíÖAC˜á¢4	nûŞhäE™Œ_ºäSŠ\nyÀ‡eê×g9¶~Ì“ä‡©ŒÇÙ(_‘ò°<9t\ZÒ²COÑâ–P€ú˜”¾ô,EÑ¥İµh	ÇP“_ùÖå×Z8D ‡Ó§F%(ĞqúáJÅ<D²±—ckäK–aÖrö€şÛÓíäuü±:B×›BfÇ¸Jùı3°è[äwTö:M*Ÿ”)}®HMä«{7ô,æL\0%£MíåùHé\ndœp­Ñ\r$rĞLUr4/Ç½RÖyõµy>^i\ZH~Cã¯®ñ3¬¯É( hä¶²*ŞNÒH\'iíŠ8!¬|ÂÂğOzQ²_ˆh¯ZpnÏi¥x&Ÿ\Z8ij—/E×Ìnu¬ö<­Zªå‡Õ“Az1uqbºuÇ?‹”LÂ-+˜õ+í^ÿV}.ûÖ”Jœƒ#âµ~ò“yËf\n,d\rş\"Ä`é”ó¹‡ùoæ´ÿ*=ÜçáµU^„û[ş;`]r-ÿ\'aË-*Ó`h†ùQ ÛèØoû§»k:JÇ^ºFq\\Õr<áè¹Ü‰Óô0¾7(²ò#˜Ì÷è&1¸œù@È(\'òcËö-(N”•ÆŸzß(Nùc-\ZT:£…LVëê/e´à¶qDúÃbµÆÔYÈm.\r¸·btÎí¶´Q[””Æn«ÁV–Ü‘„a¯5jÃ.ß/­şè8]ì™Ô¥{ûÃ­ ÂÛŒ6 övµ>ANrUÂ‘‰“Y‹™²J\n{¦Ñè³”¹mz0ÎX§Å¯–ºpİÜA_Xï1l¦Õë|S”Är­Ã¢^ÈV³ƒ»›ZÕ:8µ‹m`f{ŞÆz~h-n$²vY‰¡‡ĞÁ¦\Z§´+·j§mÈîY§©áœ<LÆÖ¸3­¬¡ÕÙ/j¦ËyšM§Øå¢¯+³»Uéa\rï¯n:>™óÍLcÙñ#XÎY³Äz­ÙÊPÂ9Šİ8İAÍéW¨AŞÎó+ä\r®ãõ­2¾¡{Aß7{†y:Xhâ5û¤×ÅzÜ–™ôšR5\Z»Óv@qMEQl¥\nË8«½ hÔ¹VÛİ4ºy=3&Ë´ÕN[vn—ìµ²P8ß¡€\n·AcNÏçÍƒİk\r{:cµ†ÛñÅBz¢ê\\ˆ)WaªçöiY\'ğÛ•\Zmê³ÊN ë³!>A§4,±#A¢Mdqíµúvkäô»Ğä¼ê“ë9DLš§ÆdÔ«IšCy8¼p±Sİ:Œuùtf7Ôp×q\Zí.´%éBvë·ÖŸ$xºFÁ7µÑ:utşÍÔ!ëÄ\\)N¨w/–˜\r]SšZÎÅ.Ø!¥Ú,:sÂ‘> ú“ÉI‚ğ\"˜t†ªl,Aº´lû¹fã¥>-Åı@şšQ±Àpº‡JSĞ%Î‰><Ş_h9ğÇÈF/ÅŒü+p”âošä†I¥€dãùÌØ—w±C~<BÂ=µı=®*\"°Î¡ôz®Où°…ã`Æ>üG	æ ­’\"÷æ¯¾0Q½ø>\0+AjÎÿ>nŸ Ÿ¯¥°ìŸ?/\nÙˆ€W­ôT„™ÌÂ$féTfŸLPÂÃâğOàÓi ºDœ!!ÒìÖ1;  èÇã…Ï˜Ö=jVö}ˆYâäğ§·^äö@$rZ’7ù•ªÅX(ŸÖG”j“cIô#1/ÿ@J9f\\3ûEyº†,‡;\0\0Tá%K7î[­D«OveÑ@¡R~ğ% I	àQ “\\¶dš¢PPñ˜‡«õq_YÇÁ[	w5+§zMÅŞy‹}ì¢ø×”š-gUQ8¹„/<NÉÄ|,ŸşÏxenËKgñ~æ¤xZZ	šŠ›z§›Tä­ÜàÅ™]u²gD2C6”ò¸¯ÌgíMÂ)î’½p{üY­§•MÁº)*ZÑY°É@™÷\0š¡Ü	Jhìƒ\\dÔ‚¦ºÁ_º†ÙÜ/›{:³Igb4©ÑÑê×»½´Ò6ş9¬oãÛ¶jT\'7|x!lã&v\n¿9´·ı5dÚTc×WÔırÚ$E¾¬ô*ã%¢0ŒE£ÈÿÁ±£ë÷±RÒmjÄ{5R[dÇ¯õËlì9¬Ò6èÏR¦ÍFC¡:‡3U±e¾2iaù‘O·Å²ìØ¹K£|˜ÕìëbĞLR‚;g+œOÀ.|»‡ÌÂ\'.Ûú—Şşs)Ó\Zòx‘?m¥Ÿx+Ü]#r€^o9÷’{›ÂÈŞ5îó\0éuÈA4‰(Àğ[®¹»ìÉ2”ŒØù0è~›µŒ¨–Àø’ì“„G2¨ˆ(¼6NÄ|k‰T¼èl:·¸àĞ^İ­³ã‘Òòg®èBÂğOıïÉ/ô\rƒ~Uˆq•<¼(â;÷•ÇßSy0rT—™ë0GMX#•V8€ÏÜàZ§hşÜ-ÖqœÏv2‰²Ysr‡L*jqúœ({NH&¥ÎH’F§xCfÑÉÉ¤Öy\0‰Û@Dymr 2Én ’7 Q~›LÒ›8­OF”Õ\'#“êç#I–S\0åÊÉÉ$ĞIˆ_\0#;“‹„€Qˆß*Gºü\\ıŒ‚ÿ\"$GĞ¬ÁO~VÃ‡EúŠH@_Dğ“§¯ğaH¼<@ôå7Z¤¯à!xº+’%[ÖT6ÕL]âeñ!&#P’¼æqÒŠóM5ï¦·ùÓ¨L>¤d„@*ÄëSŸfEÏw–ô‘*¨ğjégÑ#_¤°‰\rùïÅ?\\]{\Z„~^ç¾=ÒŒ“còôM~úæäRMÊ³!IüŸ„Ñs8J Ä“S¾\Zà_/—y~I¶\'Ä9œû¯CrÈ®˜ã9¾ĞÙhOzpa÷òÇ˜—D	Î³R4c«Apíy³Ï‡ïŠ‚[\"H…_ì¯xÈy¾^—\n}vğW`öú$ÏU¬ë\"/Üm|¤&ãÅ!Ï4û|¡(xÈë|«I¯\rùW‡8ä™Ü\\Ø¼ó\näœ\\”¤›È‹w²ÈKhÊzKÀ…gM>Á/t\'0Rxm ¿2ÀAÎ¤\Z{À$ÂW dÇ|î ;ÏêÒİæ  Cš}>‚¿P<Üd@Dìµáşê°\0‡<I”ƒÊÏ¯€ÎÚşØŠ’,æ¥cÁß2âÒ\r©‰(ö´Ñçƒøå’àÑÆÀ^ä\"_0yCÆÁ…nGçŒW@N$à!‘rş(!A\",İG»VÇ¢¸ª2Í>Ä_(ZÂ¶‘\ZÄ•ÈàtXJÈ›ã¼Ğ÷ •é+£”§YÁ„+°m¹&âÒ]øË¤C6ù|¿X°D$ñ·jm ¿2`qç$A-çë‹æš¥is”ZTÂ$2d/Njª½OyÂW\n‚G˜ÀƒŸ—yÇË#&c$ø)ô8Œp+½(¿ßÿƒèğS÷ò­ØÑñ<¬NvPşşcí´.„½»Õìı½§Î»Õ´N\"ÛsùıG|9%ü\ZÖMetI°æÄùéĞ?\'¤_.ıÇiï×h$K…\0û‚ç„™ËŞ{?‘”?hğ“_ëxğs?M×‚ŸÏÚ(Äåƒcé‹GàR|³BüÄˆ¤«ÓÉËò)“ËŒÌ^Î«\Zİ;i¢„Íy\nÜ¿Cõİá#ó*ôGüosìxÕ\\Ô«{Ø 8,ôç?o\'´›N»^¤<2À‹¥®\0Œ×Ú¿Ûaä¦#kËÿ°x\n0°l;uw’*‹!úL¸ŠÀf0Ï›/M“Mh0™4ú³¦Ş¹¡]!­KV­ZÖ ·t³Ø¼¿€õS\0À|ç/Í\\f<¾8«Eú1Å€ÖÄ\\JªòpºŸÎ^ñ’?ëå^&ä‚5¿æyı%ÊXúc#N;<&_}˜A ±ØR1I[0âıã\06ğö¿éZ¡•”‘Pv<Ï´úZkş?ÿw¶-|F¾9&Ä_Ë.ºZ–KÀ¦=‡Ší¥)§E¶ê-ú7ì;R$ÌÂ\rñ7ø·Kyb1ğ¬½W¶…”×ş=20ußgt”2}*Z6=p:sN	G¹t	ò~åğ(\"sZq¿O×ËÜ(gÛûÒÌÄŸRŒ<Fe\\Ä~|Ş•?†Ré`€PÂDñáÜøg¨!A†xñ÷\ZQ*³gzÂBÿ>FMwÏ¬›€òö§p*q0òïÿ.B™bVæM¿~ÿ[ËÿB%×2¤¿ıp!<êVÉ­¦äŠ*ŠÕd^ğªã©úüBrLNw«¨ğ.‘ş¹Á×o’åı?§ÿÀ¾áß ßşMü«&ÉÚåÿ—´ô˜©sŞ¿ıM2xÉßÑÄËöÅ\0_fşÛoï@0\\8œü5Î–,#ÿO¡ñğqYƒŠb2NB¿Ü ¸½²æp’G~©9Ï´æ9G)\ZQP˜ˆíÇ{êÂ;¦¿$ùIšSÔøû7™ûĞ•ôíô74şO22[2ôÀıG9‡É80°ö —D2Â‡hú!\Z?ÄÒ±ø!~ˆÇåsâô\r!qÆºàxã—UtÎu“ŞÆ¦¢ßÿò¿e‚ş0®&\0ÀQ(Ÿ°•Ì“¤[Á°\Z•òÏÚ,€Å\ryÁ©ğ¼/i¢•8º½—5İ\0¾\'£÷êŸ¾E–©\'e€o¹ŸG‹ğQ‘P, DÉğ·‰¸Ä{X%°vK?RÌgULOÚ‡­ÁÅ¤L1C3Áåà˜Hlëì3wy%„â“§KÄ„¢H÷úe)Àâ1Åx¿)‚giFõ+ğ=~Ÿñ²„cš)±¤HL6Å‰À÷1Ù¡xô²21ÙpcãÀ™VXXœ?ÚÀÂ1Ei&o]€bŠ\nÄá;0`A1éi`ğ‹\r©‰Š|\\5¥„heŸå×ÓGäN Á 1…“|“„¬s@’A°;“CÑHÎHL\'K?\ZR=#µL©²©BˆL1ğ!1‰Á”ŠÄâËt¥EæRÒwşş\ZÜë˜\nxË­øxï‹uà2ñ4‡%Àr¼œ8Cr8P	4æ%aØĞ{8AC®$4&Íó79à…&|#Ø	ãíTK‹6RP©˜VÂ5³A¥jéRÑ¾,G¤Ë9¥¨‘éb»£ëiòX°şXSÀ÷1Éø¢§df–²uôR²•îü¤´DLJÚ×z6×1IùKÑ³Ò­‡WXé¶&xG§„-¡	ÕI¦ w,‘b8û# ]ğèc1iqb0¤À1qy%äÅ¤%‰Zf4#Ì>ÜÃ‘+ë–ˆ7jPäiI<%!</™]°M\0=F$B“dNÿ\\VXLr2çzÏŞÕ“2ÜcÃ¾)Ìæ.ÕaB‚¶ä§˜˜0§)Õ¡\'åp(5BÏÊÅÄ#…Î È}ÚNUÎ+p4[®”àX2ŠG7I­*“K(½=+WKhÛ\ZŸ•#Òä÷¤\\²§%7Š¹X^´pÙzV,&Á±\\™h¤q¾ØğòÀ…bOJJ&{Üãq)-•Ml\rJ—*Ö\Zœ.–jHºL™èQC®çó,é¾ßY\r°bLYQ¬d`‰„Y†ítÀ‰¨Õô	|O¤X Ùæüµçh.Pâ¨ÕT‹âa?¡ ZLAŠV2E1íè”ùjBr^(¸˜N¤+øµtıáú\'n DAÄdh$ÃL(	KwÒs4ÎTÀİ$à;5Á^Äé’)‚ÏÓDL=Oğ<L`w\"0J$\"a>œbJàµû\"Ù˜à	\"[ªŒä	29gxg©¤Áz²ÑZ¶¦ƒ.Q8\\²‰é”%øt‰Py,&¤·á°Œ˜)¦é~ğÂÇú##4İƒê’1UygÍÒDb°$œlŒ‚ÈúÏŠŞÉ(ğ‚Aw€ì“ŒIi/·{{œûİtüƒ?1x†ğÀe’íL=\Z¼[z8&‰\\±2Ê\"É”zIåt  ë)%x+!¹‡\Z$²e6¤™{_”4ŸMÂÿ#ê,•ğ¥X¡\ZB”RØiÀ¨\'”äX¶\nœÏ:œpY+ş	òõ˜~v™^¤&ÙğW=p@ë‰œçÿßæŞtÉQ,[ü_O‘ÖmÇú##™TÚ5kF’ Yÿ˜AŒbCÚy÷F’ã.¹#Ì¬º§oEe„;¬=¯½¦ı±×(ÁüÆR¦ˆgçöÕä¡©ïÆE>m¶QêÓ.sx:ZÒxœİQŠ7ö©’Wqj°|ò«§r•€ã³?˜Ñód8äã\nŸzcß¶ÇçÏxc³Š\"?ÍGÙËü{\'\ZuåÜÁ<¾FÒİë±ÁèC8¹×^ı®~imØİ+ÛÍÀŸÈÆe‰A<½’$Æàä?ï^6L¿ÍXñEgÇBˆ/»üÆQ^”šãÓıÆPuŞ{º£ÊË°‡ğSr18dAôbÏ˜ûäã^ïu\Z%z4Ÿ‹WDs5_/Ó{díëÙÀh÷,h°@Œw¹øë ¤G¼uÄŠÒjtwYo}p{Kp¼†Õ«§`BaE‘¾èå»I–µe®îb|SZøàl_oËŠ‚Qn±ŞX»0Ü¨7¢Ú±…—rÒzcîkZ÷şù“ˆqîŠgûf|ÌA®Õ¨Ğ°Œ’tœÄô{„ÎÛİ£„Ö ]ûşİî4#zçvsÜD·œwÃx<Ji¿«Ùj\\†Ûƒ‘ƒn9ã+ùDôÍjØoìæ¥iïWÜÃ\nßPc_¨GÉ ×˜£Æ‚=Øÿ};åKdO©Æ%šM>Ò¼¨6õHõR’ÚC¬á\Z¶OÆ‡ö®fûİX>kÈë“Ñ2Càªÿ8Ø_?:Å8?Ø%ŸeÖí‘ñ¢Øàr¾¾Ñ8Ğ³¹9JóÆmoG?³ûëÛf•Îp`ãxïg~·^/HF÷¡óÆ…ïH—ÇR½}{=Ê{¡œgt\\*9Ÿ|‡TÄ‡lö{`¦ã\nÅ„İÅcŒò§óÆŸ½¡÷ÆÍhDÜ¡a\\”O‚ö*˜§ã¹Ô»xë¹¹7®Ìƒ2ßc%şíƒä1šÁ2¼j­o,û‘òµ	ï¼qàU³şˆGIÜké§…õ‚Oİá¹\nÊWêßE>ÌÇFèà´¦no×Ö1ğQUFN>*µÜÇƒã{bQ²Á­¨‚èë§zã~èÙõØêÕ`	Æı\n‰5Şõ7ş‰;FÕ¢\ZW^éWä4%qÍaÇ÷šûÆ\'ş7*Âw¾×$î=½†³z–«Ì×ö0<àQˆ_Iqx\0§<Qjx@©<‘¾PGğ\0V¹¿ì+öHõº“ø#Ù‹ŞÏ½{Ñ­7FzCj’¼qQdd¯(ËÕtï°1ètóÊş÷¯ÏGKà–×±vxÀ·œ«´üfníGª×s;Ä3z(ådx\0¯¼Œ\ZÃråGÏ,z2­<|Œ{dÜËC¥Ái2g<x–\"~h4Š›_3C“¼‘qX\r<ÀO<#v²Q© “÷kÎÇ+\Zâé‘1.árr£øø¦mŒòm©{¡ã#ÖzB#_Vº_¶èËj?<|.zì-FøÃ‰³ò‰[>^¹ÕsÍoF\'b€¶\\ÓŸŞ“™]ÜQÊA}åãÁ?&áz,4æ]Àº¥JüÛ_ßàŞ¿~e8Zr2ìÌû¹ß(Í^üFß=Õ%b©Õõš¨[Z¼Q²Áµ«ÌoˆŞXÑÉqx <\0`²ªë®b/pFu0<€`âàº/¢’ğ€sù zy$˜—ÂœQÔŒ~:Ğç¡ùr=¾ºÆ‚{‹¤\n\n|¸ş%Oû=7:eèûáNcÙ£„~:Üù>Ø£“Qò—Ò}ÀÁ|¢W¡æñ+]:@cü2ğQ‚A—:ú~8õIzŸe|†í÷=v¾Pºå\Z4-Æáß2$u=?‚|Ë;ÕØI<`\\òâ£\r.˜ÁQ²D¼b\"ì	ğMƒÄWºq.0-‘Ó»˜/˜a€³Üi^ñ\0öÁ2Ö7ç`ğ;åæ3Jøî=œÃ|G?„@A£tƒ/–ÆÙ8ğ.÷ì_b÷pÈ0­/gd@Ã¼Õò‡øTÇøÌ8™·\Z¾`H?Uòrïp\Z§ÊŸNAûßGÉ‡à–9Ş«7>µ¯¹«Ÿ¢U1*pTMŞ«\'ã7HÆÛ$aòl<Ææã¯­ó´(§lÔ°8yõ\\¼×–~y2zBØœú9è\Zæ£Å\0Ï1{·;}~›åXÔ	ÆßÌq±0`tŞİçQ¢ÇX™e¾ñ\"ÈãöÊa4x€êÜIãk\ZØWµxGÒWÕ mRÅNX/ëEFh_V<€UïçÓã{jÀë¼½Ú¼h§M«²2¿“\'tçr”ä	›ŒÊó{òãıw-QÏ}z	„äÎ5§í8Œ&Ş#øÆª?|+<Fi\rægOëåÆº&Ş=^wîéÎcŒ?§ß6fõJı\rPw¢oæj@í”ı*G£=\Z0;wŠïªÂo¢_oQdğ\0áy çÂÉó@øÊĞà<¤/ı\0é¹fRËÕAbÃ\\áÊc$=ÿ£}ò¹¨FÙk@ñØy`šã§:ğ€â)Âv4„	7­ò×«óÖ¹Æ‰Gmœwã]°9/ß\n1(ËàI{×o¬³ñm8@uŠêEì€|?ïy×€ÉwP²å—ñ¾M“wT´PœË¨ç:`pj\'0Ç;ğÆ¹“äã.ì€¿ÉÏ¹ğòÔ€¼¹‹›obê0ùˆíúøZç%Ç œOô¯6õl“}>šùdP½¬, òÛğÜ€Ù©}Ç‰®±€QA4àv.Aì¤ßÈ¡¼SVyØ{¢ıî{ÿRà~à3\Z~‡HÏCdùEo‡sëëî½]•åøv =E4¡‚LÏûWŒßjàÀ4·_¡cáÆs\ræK¤ÆsÕRAY=AŞÃŸã2UÒï¦¼Êñ³†}™_ãL_NÖúMoWoğÙÑã+x\0µ†ŸÏõÛŞO„Ç(üOîØöèé< îßÌ±ñj»ª:§Ê¾ÃıÂ\Zèz”lğú]oéè‰6<@ìÀ•N\n(»ÿ+®  ªWşÿ€\0²{Wc<ª9 ~Ni\Z+ÂØ\'êETeŒK©ãã\Z£êo@øGY£4ƒêãaªã“£vÙ\0ğ)²t|põÂ(`=×÷£‹g¾1‚éø/Ğ`{\"ù†Í÷/qÒ$¾«hpè«}ÁÁæ`Ueút¾2ÈøÑBïX‡\'/³4š`”|ø€0=…Mó}y^|p›ƒ‘ä\\#)ÇÁÈ°ùî¯U‰ı\n›oÌr½ÔĞ?î…TÖÍ‘Ìì±óŠu£ºå\"\'CÈz…îŒŸÄÂúØèõ›çÛıI/ˆ±Gâë‡nÏ¨íûóOŸ·}¼¹\'o\Z¯ùñº²‘Òo6Ö‹òÄCùÛRŒÕpÍôö¢üä¡|œ^‚±şß?/O>”¿FŒ“Qƒ)1H·Ş‘:¶3À‡l×©poªGi¬Áşw^=VOašûÃ*ıúğ\nˆ{ŠU–}€>ó2s@Š½›yIZ\"(á2öl!å9\n¤\0Ùó‡”Nœ»x2ï[½kj¾~Û\Zí5iÉıÆ·ÇÚîq.kä¡ÍHšÿHœqn\0œõ®Ğ¾¶ïÈÙù<ú–ÜƒŞx}Z¦¾Âfüè³ÂIŒ¦dòåW6ğ\0H»{Ş\ZÇ™~@©ùAÑÏà¨¨}G¨İçz=ã(Ùïßï°¥>ÿ7òk0$e¾wøYt½Êq|†ĞÚ-XıÂš°fïDßğÚ€93Óx4Šé¼Ò,ëzM‘ñ\0ù¹K ª4ÓB|À™•ãöò€%ëy8µªhz\n;~Èèæ`d·Y{õ¹<`Ç®ŸŒoı:Ö:Ñ¨m>ÀÆ®{çÎ[ãc6†H‰;j\0\01Ëˆ®c.Ç­œw~i_¤4ì\rZ÷3ı\Z°a–Õ‹÷bÔt°a=I|ûğÅÇ\nğ€ë	í °ÒË8·\0±ÌˆQS÷ıë›1¾ƒÄ¬dx<Ü3ÀÄnh´—Ç»ï(±wªñåpb·OF	†óĞ4k_FˆØèEğ\0sZç\Zj}á½¸ï’«İcæÕ‹ş>C—¾}=(4Âñyz8ÆËoØà(ÖûL/‰èÌúÕpÙHÏRî˜íx°;Åk)…X°·ğËøm!È€¨Æd52 ÁÌà•€@ïˆÂ1„° müt°k´*zq12€À¬±C	d\0€¾:Ï ß9??	¢ñ¾qPìIfŒŞ­@ï.g[\\³öxMïgŸIâX¥íÜâ3£”ïEá¿ğ øıú‘¼ŠÍQ?ğ`Ñµï£lÈ€ıºö»S0È€û*ü~sAbVÑXÜ	°_EgQ{õ¾Gìù¶FÙóì(ÍÔ¾|ØGàÉÑ·\'ÈûÅF§£ß‰#ğûÇ¶£ß• ’ì.+ÕÈ€&‹{÷)¹7à÷ˆlïÀŞ/ %³ß-¢¼4Ç/,B4ÙÅÿ8ù€ŠšÈ€‹{UZpÈ\0éº}›Q¼ë¢·À§‘“ŒÛlÈ€ñz {aq!ï·]Gòl¥#>ôÙä±º—£\'*ë×#•ûÈ€óz ¥ Òë‘pTfX¯Ä©Æ¿@ ×}Ö¢ñğ,2€½Ş¿Ïìåz`£¶\02`¹>¾²eöÆU÷Gadã4ï‚#7`ÄuÛ2¯vñ\0Şº½º\0\\~Z>msb‰p®K`<\0I>l”ƒST™õè‚~`ØƒjT7Ø¬Özìô£Ï9Zê5Ò¬’ëIÅ[×Ğü‹Ë»å4ÙõZÇ.ŠqÖxÿfÿú%pû{šæ·‡PĞ§Â¬k CÇ\n—~/í~\\Í“rÜ1CÜ×P«æÅ\'íÈ\0èà±Âo­–GŸËCcåa²Ï¥±Ağ÷œüãíšòQÂ7V~¼]i>FóÆ¾oÉ4¿ı|¦›<ÑUÉkÊ÷K+l¯¡›Q17àÈÈF-|d\0’õNÅÉ\Z5,ÙÍËIúÿaEã&È€³¢q*2€Æz¿ùè¶ÆŠ‘:æ§U~»(t¼ó6ìƒì‰W>/âÂÈ€\rû EÆkxÅ¬(ìƒ¯À7W”Ø;á(Ñã\'ã^n˜ÏA‡ÛãüÕm‘È\0»‘]ï¯\Z)ıÚ…GğÇoÌ‡/_NH£ {…ÂG4Ø½Îìu×©º·½ø‚Òx¤t®g¯ãtÃ]M¹a;/.DXîxÁUdë¦Ö›·ì·üÒÑ/7‘6z€‡¸/Ï{}¢ˆ€¯«ëoØ—à…È°^©¤á•¡’ ½ Îë‰ğ¯s€|y½¡›½Bh#â«î+»ê©ş§Q²÷¯»]#ïŞ;2;¿J!Ş£ùyÿr,®‚X¯^¯Şˆ ¯g%ıÈzí\ZõDãS;ğÎåqÿô†ŒÓ¯ÆøÈ\0üº>3F9r@}á”b\0gÄF7ŞÈ€ûzÇâßP\n£­\rè¯wÒ;ºyœö3Äÿ~ÁÙ8-ú‰ö`§Å†I·«bo|\\ã”]ÜQâƒäz{ÌèÆp_W¢ñÎ¼û\r£úv€z½}¼;~¤‚LŒÏT/\ZBãiÕu£ï÷XÆÎx\rƒ\n½¢Fúİ˜¯¾/Ö‘D>A#®7{e!ğË±GOñ‘÷+™>nvyå0+µ\'ï;ùnÙ£»a€{¹7ŒìıVôQº÷«·Gm•ğ•å©]õ&—_%ã]Ø#h^#şëú©9N1Àõ¯×K~#ã?``tãœôëõù7Ú_È^Ô÷~”òvG™9z§/BA_èŠª`ÀwùFáßŒĞ®kRßòšğk”ıDôctEßoeròëiİ(É•woÛÏ[ÿœæË…ıc·ú?åÂù™Ì~ïù»û‘ÍgšŞºkofñµ£ÃİôÇÛ5=»zıOn/]Oé××XL?Êø·Åõ›®\"uËß£¬ÛÛÿ¼•îõÒÿ‚ÿë½KåPäŸ÷ºÿ“‚lÇû¯{^¿,^¿K_¾zñüqd0ù/\rùfh}åßŒíãíÈàŞ_Œnx÷êÅãøzÕü¯ıf|}åßŒïãíÈøŞ_Œox÷êÅm|nd½\ZËƒîjØDÿÚ ¡_ã ÏÓ|œQoÛá?À¿Â_†úüªxõ&}ñbôéÇğ†Ôÿ\"‡ş‰ÁÁ¿şx5¸áÕ×Á½½ù:¸û‹Ñ§·Á]?MÿcèŠ‘oŸ»^ÿ‚¿‰$AéürjF~ïÖŸ KÿÑO)şûÿ½5:­›½µùË­³Ğü1Îäw†„¡—(NİHúzß<Rõ«\röXû+š‡Ò±ºG6Øcµ#¯jìW}l&F6ôÓDŒ¼ÿ¨ôk…ßUöº¢Oiö~ëşğ\'Õù…äªÁo	›Ÿ2Ë}!»%\nüãKÚ¾‚kâ±äZi~=lˆbâ È¢öú­ÃG~@ØÂ ¯mİsÔ¿ÑÀ(…cèè¸„\"!“úBR„ï£¾\'EüBÑ{C—¾Oƒ[&ñ…è–S|,WøÉÕş8âÂ“/$o©àßˆHÃûÑıjŸ«Íå4´,E2ä8íue¯´¿Láûà‡\\˜Ÿ2<\ZßÖxOOöëO=¤ÀşÄˆ?+9pæ§Ò·´ƒo£5ÓæÇ=™Ø[Š³±ôe_S»î{Î3ÃªâŸè{¦Ä¾ÆßÜÔªŠ?®u¿%†~~ÁûŠ¯ÿİÒ\"8şëõ?èWè7\nú¯‡Ş|Ê}şŞ$|ÅŠ|mu$GàmLWæıZÏò¼ğ×jyËÅöÄ¾^Kõësg¿<¦œ»‰šÌÈ{kı§ß>cşií7ª×‹ùQóªvÅDÑx­<g©C>ØàCX½õâºÄÏ\rÚÁå!‰]áôì”×ıtüëëÂ·¾|[øÅ\\¾\'î¼e?ÆÆò\r?®éàıL°ÉdÂ}Í_’?×?4rûáÅ\\|ü~e¶ÈÈŠ4´÷Z®›\0\ZM‰ù—ê\"?ªúÓ…ÇÖ{¨úÈ\"}Oxú7;øó6®ixßû›*İ¨*üÇœ‡_‡:ÒØ{ÚÄ÷DŠCÒçÇÙÿÓÃùÇ/©\rè“P~ÿxñ:ıã·şîû)[-ùÆ’äO—ì»…¹%Kçï÷Šî—V}×—_îlH>Êı7MòeNïÖÆWıòdxü¬üó(s ÿÕŒH¾AUØÇ¶İŸ×z×4_Æöd1ı¤øë¡ııZ¾™áîŸ˜¯«Aúu`O¶é÷¥_ëoWòÍ°îùi¿ìğ÷$×?ŞBfÏù˜\'×?2?ë_¯[¤Å+ö¨“ÙùsÚw±ôPüÛ±?¯qDö==ºÿóœ`våx©óËFú~}ÿñ—cş¢;ŞúıøxÕÆf\ZõOæF™öÿˆNtq®q‰_§rşŸ_ßÿ•Î#úµè5ÿÌ|5E~yaÉ¾%ƒŞ¥&ôûŸŸı¿4ş{ÊÒ«ù®şTŠï¿Öş‡¦yŞWµğÕÎ½3ö[3×®[(÷¶?Tò=“ğGÙ{¶°k>Ù«áõÏÛ¯`–x¿_¿\Z#°_ƒ-³Ôkh6õRºÿŸ²ÚøüÆ»şÈ_ÿbXZêÿa5Vëƒé^v¢¾6‘#d#B{Ôæ8¥‚ãŠ‘Í·rtØé¸eE‘z-@S²ÎGÉD!diZ£ùJ“3IêØàFÃÈúçóPö<ïı¯ÿzÀ[ŞÄû??ÚÇWïõ æ~ù~~ÈW\nñ¹ÀX+È«äç/Ú\Zíê½’çb±qJó½‰œ|éÌ\r]óoITıèÓ}ò1?µyëÈSŠê[Ãr5V>ÛÔ¾²Ïƒ’aĞÏÍà?ïáí‹õü¾Š÷“â¯Œë·Ò¿}ëÙ7´Ë“úx›µ»œ¡ú!¿µ@}dè~›Jä]6Ü{>Á~Ş‡úz6ùÇKİôÖøû,fÿ¢*·îÜ=•ï8ğaVıÍçÿeïÃ@ÿƒ¾kàQÍô³\\é¯Yô¹•2(#çÇ£+ä6û@qç ²ŸÂwcSğyX÷?Éä›i¾êŞ/ÆŸUÂïŸú?Ã·5øñ´Ò/è¿Y•{U×Å@şÄÆøf>*º©Â·Î]õÓ#èëlÜtÌ_Ex’¾ı4ÂßcÁ›÷@S=ÿŞ|½_à!Ø„ã¿ŞÿÿŒ?)Œ»â† ÿø}82½•ş³yĞ}À8ô!n?ß\\Ù÷©!şÌº½îÇ–ò£%ä“EpO…~eÉë7ïomcğ_Ú¹w²œIØÇ]uÛe[û®c~¶Oß\r×ÏM=ûÒã{|Ørø›4\\Uõ£ùçm¨ï¿·ÿ¼[á£Õôfbéß‚¦Ÿdù¢Ï÷±“Tïîú%¾–¸ª!dğï~®ôzìŸ2ÚÇ·¬q¯Ä¸•ıí)×Æ×XÖŸ(4à\n¾î¶w¤ÁÿugèÆÅx¿eî‚ÖüºÌwq=<|6ƒ_7ıÀ¾;óıx;rôşräÌix÷êÅ_×]ïA¡‡ù‡f{÷oµgÅóÎ|\n£¿¹²×)ş\Z–ŞşlK=õåÓnøö—ß†T¶Ó«ÿŞí€‡Ü@¿2™\rÀY€~kÿš#_LÉg|\\ü\rbû·§üj’3ûæ#~{™Ñ‡·ŒÙŸÌ2ì‹™òÉÓ«ã«ì{ëéWwÎ1Ëù²oÅ\r®Ñ¼F Š|è…ÛÏ_«~ëïM5½ïğÏ¡ô¯\'v_:2H‡Ñ1ßè³÷Ñ<*²ıöSËï½†±ªÃÉ#’ıÏtìgÕN¾VÛOd>œ<?¼Vf˜ù5ñZšñz}Hn½9‡3Ùkë1|ÖØñå\'ı:Úô³õy¯ì§Ñµä½@¹:Ø×r/%Âp‚ö$‰O.Ñmµ¯gä÷mĞw«Îì\'2ã©­{#¯vŞû2Şãš_6ÂSHr¤ÔÛáûÈæ|<‡)øv ?v¤ùp6?Rğ-lş¥ÜS¼{¤ÜõTşk©§ú‘R/NLŸ\"Ğ#ÅŞø¿|:ë)øv\\ÿµàÓÉıø´Œ$¿lÇÁõôc“‚~™Ç[¬í·ûmã½?œ{ÎsÌØµ]ÜÆcpËı1Ğ²Ü¹næ!\\øX‘9¨c}Âe>º‘ğoşÃ1Ò›z¹ïõ›kó…Ãï7\'ö¸4‚¨ø0F +ñ >ïJ}ÌHsÜëŸgÅ8ÚÎ={ÆÍ¨2¬«Ú)®¼Eº?Ïj¿\"P&i#g¶¦Ÿ¦æíƒ´·f¾‰UŠŠï;ılqüYAz;ÌïĞ¯Q¡ú}La0ºŞúóÙMxóín‚òQh>èbôÜûıÊŞq¯çî¹|±Ş|˜77•xÖ½>Ş×¿[€ß¿IuïŸw\0IZ•·Ä€¨Œ\'²/3öÇ1şB‘a…Æ!5Ï»¡i^Uô{*w{ÔÜn^¶o9c²O»Åê¦õEÜ<È‘ó‘ãñ÷2¦a{N1²Èo‘ìm•qä}™ñáu¯f8_¹şrµ“‚?ı™7&%?û:#¾ğ‹ê¾Ìä÷ÜBFE–_Í‚›ÛZüñï8°àµëAÏÒ‡ësŒÇ—mÿ¯5å#^ÛêRÁ¶ÛI^©%q¡®ªÑB¬õúXfõ|¥«<è-ÛJg;àw…Ä{+a¯{S™k½4ÒÙ™Ö|öÙ&€’ËQZú“ËeÓ­bÏ\\œ\\´“ÃÉÎ;õ àèLÀ|G ˆ’§‰é¶ó“è‹ÇcˆT²Ç€z³DäR8Š^*e!\\ï¤¿(ĞB(º¥íz^käbµÄëlã0ca’ŸfËô´öìš!¥-œ®Ñ-İS;Œ—ˆ€çúr4»P:4’\r[ñ”x\"f{@%ê0©#&T×T(‹V3UCùH¹ó6¼ˆ59÷Ìš	\\b£6êOG4Ê]åuMãpA\Zx{dÚUl/ÎÍ%I—úf2\'¯jN†TO¼Y^‹£·¡\rÃ4¾ñıØ_$5·O÷¥,8Ã%b-6ÇNfxEHĞz^‡;¶ô§íŞYùP‚©m\0.õ‹@êÁ¾Ø†{\n õ¹Ü$dÃşÎ0ç•w˜¢¡lìNÙl…Á9s£©Z«/e„dÎö¸(éÃ”öâ%ÔN)°Uƒ@‰%ÑÈÀª]´‰ãcØárfeÉ57*Û[>à„³„ZHûFk$,@Ál«Jz4İ8,LS^¤ÈL³Ñœl‚fÎÉIIU=¶*®‡ â_|­óú×@\n£ÁÊz›kœ%ôä8›åç¦˜Í^j\r»MËM4_“j#ÌvYNøôNğ;©.fÑøŒÁ‹KtÁ<o³\ZFÃ¤-ÈHÚág¼~DŸ`BqFcwÅÒ”‡˜#s<Ğ»M…nÂİ9÷“à¤ç<Nü\rm©Pp¨a€Ãi­‰¶±>ÅØÎ«¸†(–¾\\jwÜHÊVy&ˆz›P‹®@Å\Z!avÖN‚Õ<Ë[aô\\\0•sŞ6ÂÊ>D\"«%~Ñvûƒ2w…!¨Î-t—1VÙ©v šv\Z|MÒ9ØJ!ÏoëK&¬M\Z	=\"Åä8b£	ÑA.q8ÎÑY+5?–u^íêÙY[XévL±Y¬Ä9\0Š‰æ¤â±ê\"úºŸ·,ík;Á$ODØœnv,ìì%S2©%«RG!F?q[İÑEtAëk‘Ö¤7E¥*÷¦ñ\ZËÃ}¶›R!0ƒé½±BPZõîr„ır¶wršÙ[fJ­ğ^^Ë:wƒf.Ï\'=_™ÊVÎ1šN¬DRÏçå¹ ©‘WÀY²\nShx:BEj¹ó>VÁÅá#J¦¨é­=}âhŞà,êÌ\0s»ğ´Ä¼@YÍt¾ÆÄH2ì	ôdg*(\0FUL<y/%óáTè‚ì 2ıÏÔôäê›÷;}8Óº8¹hƒ2¹Zcš®À(w%KXÎUØH‹Y*{ÌÊñ–Z–¶—Î‚¬ƒ‘Y\0¯Ó\Z-R KybŸnã­æ›S=Â÷,¡i0ì+˜.ö‚Xö<+é[cåB›éâ´n[•1×åI™ºF}$Î\no4#òl›­%äˆå\n6Í4Ë\0ƒ=x‡œ\Z¡Ã]lW†È4öP0§çt·/¡UæÁj–.¡ĞÜvÚ–/ce¨%6C[AfnÖ¤-9\Z§ªŒêìl»ğ´%h*$crŒ¿€©|„±(:êÅÎ±˜Ìk¬kãÏÏpÑÄ,ÔNe^|Dæ¼smÙ(ŞÔÒ&Y*èåÖ©Ûş€.4{ãõ?à{SWTd®¼è\0&™´<Ë†UÎ\r<†Ï]]¤;ÿÂ´ĞJ;ÎÖ”K|5w¬`²â`ş¤À:sÊ%Æ\\Fª¿:n›ı4#éÅ–TO\'±Ø©\"§‹¨&Üe7[3«ıeyÊÅz+ìiJ^óçx‡`ÚÛàË®PãVI¸¡çê1g@t¦ó	ín›rëK˜7›N±W—ÙÄO½\ZFæK|ÁOz#%–:»±Œ¼-´ße’,í]’	$û^ç‡Äğ¤Åf¶“Áä0kÕ­iµ?çšÎÉ/êI€\"sWÙbñÓ«§z‹F¬*­ÖšÔjEà8Ÿr¦xv9\'ÀÖ—3È“X&iSÍ‰3¶ÊG/,àï›´Ÿ™‚>–‡¹4­Äé¼ˆè=:×u¶İ¹Q±•£É\ràxX!¸Z•Z9oªC€l«€ëVÏËŞAÄ­ÃYÄzN‹®Hè¶Ã.§Ú[³ºÄŸ7S\r›¶×¹@Ïƒ^lh5¥a¸kÁh¯\'‹PéØh+A	~n¦Fz¢\0¡-i¥œnv^Œª°oíÄ…¹ RoÆ\rUœÙ¥XD~AšGåÀ4{ÆÃú=¶;!x>OÊ;õ¢ÍõËÓTfiHèaúg·Ùp>?ƒĞsp,(le‹c¡veÎ©Ç*Võ\"n]7$Å®Ú²¼‰“\nYéM/¹³#k¬,!Tgñ1t.H¿#WHL·å¾âv—JŠ½\r–åù|rîV.\n•ïiµê6^\r¸\'gRa¨QœòC?Û+A…´¦ÜDBç¼¦¤qB‡ÄÄYÏ±Ò/öŞ°8rJµEãÎ„VËÚa54o²6ËF<š\'Úí2W(”@—££ÔÁÊÅ —šÅë3İOÙÂÏ6¡-”õ…%poId\\¨¨ğ\Z…\"…¢m‚7Ï>fH\Z9wEp£tZ ¦x‚³	ÅoL`Š§ÊÌJZ7ì6sXbBt×TéÖŠ>«ä-¹ÍÛíEónaÿÖ\']:)¹·È`Ê3Lâh‡AS¿öŞmKç¤¯¶-LokÚ¥¶ÅnáƒËˆÜÖËÍáĞAEëÍ’µçÏ\\Y@öçì4Ÿ®Â$ÛkJk’6ƒ[¬ê`6?³9,Sí]cĞÔ¾\\XÑÉåÉ^ŸKK¶Š¹Å¢ln¬ëÓÊĞäD0Æªî¶U6KáLà+R¶e¥UhÁÕ‡“¼^¸Ç%¬vZ;wàéÄÁç’×õ´CÖÚa¦v´ø n¸ìg\"‚ê…x¨ßİ¥Ãw3Lì÷O;:BRÂª£Şjöh,ôÔ/Vx –›Æ§Óñ§vlöúHím‚O–UM×ªÊõ\Z>÷¹0)8S¥Ërmn»İ(âjÖ¹)™Âš”GİJ8ÌÂkM†Ï\nç²-àŞ›º]\ZxNˆ!İ¼c»\ZQ-Ü>÷ªP—ñ¢ XÇ‚ ßF‡ØæZÜéÈEJ•š1é®…g}éí®¨^DÈ’çwu‡®L°ğçºt<i©ûôpÂ\r6ÛêÛC¶9\nÄQŸ€a”‹ÚF´¾\\i N–Ü¹=éScç¦9S±[`Z„o·«EoÏ3‰ÏóİQ²Ÿíg†âG›ÔçM øYJzH»yè®ó*L\\.L½Üo\ZâÙB8ÁŒMu”±CÜ:´PV Xoğc;ƒÓ†iQâÈ.5T£Cäî$š/#…ËøT«»»Ö¹wNR–’™n¥pÊb[hÀŞÖ7«^ {ƒVjIîÑrâĞõI¡2CL••ëÛìœz€T¦h³›yRÊfë	Ê)œMf;©Ò‚}œñŞà \\K\\±òËapS+ °U›¬&)~ OpøŒ¯h¬Œ–»S€núñÚ`bpfA¶¥•IŞ>†ÒÖg\0 N\\³;Á¬>;GN\ZF”Ëù&w()*BuÔ0×Ñf§.Ëğ8©Sí7u§Å—ÂÉ×«r­4t_Ìƒ1¡ı^ï¼*ÏšåI5ß˜­qšï1ny’lèxôƒÉZµr ÂçõZ™\Zi†ø,š®Ok~ç¤~ÎË³–Ì\'ÜîbÇØækh.êíÎÍ¢yyX±}çnÂÉ\'A}ÛÉ‚±zy1+¤6e4‘ÙqV¦ˆAƒ2´³] ìÃ°7-¤Ü¦òNx[3¬¢•-ÎÊhú¹”,\'ñtÇïÖ³–‰›•4ŸgîF¥¥tÚó-,KnÕ¶L£\r3»&tÇßÁ\'euy5Àj¶÷Dbe@±ÀJ·K	cŠNr»ãš/¶‘·”Oà~ƒ©<#Ñş_Ø™G3º4ºYùıNÆW„¨\0»½1İ–, |áó|Ír±-¢³;Ùğó|‡OPñL²J9óÕÕ\0ÕUáM×¤]SÈÁ@v!°ìÚ&äQ™d±Tµ2*;]³·ä:P{,ŞÕr&/×lÓÙ9\\#hu0-§‹]¢\\×³5,¨µ™BÑwfbÆ+`>=2\'$·bKÏVü´»@b]¼Æ–{ûif4`Ãø@–¬¢½ª™æÌ‚ĞÎõ\"7¦yœ é©]”uİôDê\\V7óĞÕãKëæZ8	õe¨ÑO^?¡ÓdYä6xì„Yƒ—uÒ ëu¦/d@fØn§-ãÔ%•,ƒI°·¶ç–=²ÀÌtm€Ã\0Ö9·¦øÆq/ˆ«ŸÚ¥çB]ODWÉ˜½§;AgÚRÍ\Zñ	‘gÙóĞ\nvN6å©.¬8f|şä	;DìÂz®ğN©\'da®W`LÉW[çsh@I¯1Í‚ĞĞÓj:QÏÓXñÙ•^èK´jë9sˆa)n?­°´^l¬Yz¨%øBÑáz›@ñâ™œ`×$®ûÊ;ø)ó¹Ë	‘Î!s?ïEÁHT‰ÃÉS»AÉ^Î)×ß¤Ñâ,66p>tKã@Ş|/ù¤·Ü×6š/â<İÈ;+ö¿ÄõæõÕÌMº|¡sì–dÛìÏ3ŸÅ\"—!SŞÅ‡ÅN|8¹ñ\"•8Ë?iD µ0µÕºw¬•z{°]q“TZ3qŠø-~š[¡Ô6Án§ñ¼Ã&azi\r’ÕŞìëğˆè˜ğ³òıåšhÃ™f\nkßíz³$ö:°˜4¶/ñÚ¥¡@B/û\'Ç&Ë¹ÈÙj™Ş˜Q¢xEU,omª;¡ç!P±Ú±ï]C¬Ä²Ê:¸ 3Á¶TOtG¸ ˆÎ&®sı,–ê$Ñxvæ\rH),^Ì‚ñ¤º´¡(AÍyI×ÁfÒ¸sT¯ÕœÊ˜×-Ôhßº¢	°–{	½ÉiËBÆmvwôvú²!“RÀé‚ëD{¹lË½\"{™¶âE¿{Ùio$M]@°]ôZÀ?\'Ò|Ñ@‰„â §†Xo\r‡|æJˆWø\r£‹ÃJÂxŸ–ÇDï­;D-…cqÙZì,ÈÉ‡˜n!”Gğ^ÿ‡3u·&§¾lk¿ĞØrãÖe)-3b“µà•ıZÂ10[pÄU·‡ÄåBGºS|hı¦_ÊÕÌÙ­´¾$ÇF?°ûXÜ²³ÚÙŞ¢Ta¼9åÊz”CLÁ\nğUş¼œæXÑï>ñ²¼÷†ÌtâVL’å®\"¬#¦ädêò¦¹H6ó‹ºl\0şÀ]ruÖ îÎ×êŞáæo±-Í‹›\n•Ë®º,”MÀØ½mĞ=ÛGPkI_°¥•ŒìÖÔ‹X6(FëI¢œL19ê†Ÿ‘Ç[ñ¢çĞ6´ÅÛ8Cè„%„·r‘ôu¸Gı˜Í¸ŞlÈª;ä¨›.Ï—#yu°NcO\r¥œâ-)òÁêóÎjµ¸À:ÄL{l–p€mz36¥7G\"´àãË[=\\‚^1¡ßÅ6;C,×ß8gQÅİ‚_ğå²ÚŸÓ•ºöyeBøg(‚^§†Â±]º÷¢M&sd”gRğ‘d±¹.¥‘ªsGmàêĞ!..(Û0Óã4…âZ¿@t¿\':qµÄ	`1Û8Q‰4ëõÄó!5åùÂiª¼¦äYEe3M©zË5WÒ5ˆ¸ïÙåB«°’¶Îd	%3dëŠ\'V?‹‚2¯Î,Y1[ÔSc&[{—ªèêô¿¶sûĞÑ&ÙLw5•äU‰Àá4€xï¢Ÿµt‚\"Î´ó!’æËßÂ¨‰4XIïX\Zm‘R´u©sø4Ùj\"A,ñt½Í¤’q@Ÿ¥–µU1\\«ZäZ7xØñæa»õ¬h¡wÇ²šgËZ!EÒ´$Û*¦.Zâ†›½–$¼‚vt(yÕ©C\r8¬êyËó°¥·`ÄÙ°Ä\Z%;‹ğÌê™7d¦=Bt¡Ç0±ÎÇe¸\0SÎä›éÊjê0§7œŞá¢‹üÈ…§E	íŸ‹&‹¹/*±äÎ±. o›™ébÙ÷3cÌ\"\'`Œm4_ë	×Jë\"©S’jmV©òcòt\"¦p3!}‡qºp±\\¾HL5ua¢âùYÑzÏ¨wÍZçurfù–Ÿ(ºW\"ph#i-³»Kz›\Zâd÷‘œRÒl^„ˆM¼¼/D’2/4Pw\0àÅ:šF;.]QÎñ§Ëaµm(#+,‰j©âz6Ì‹¶u¬ÎZI×LK\"°‹5µËT«`à|åÈ]ôƒ&å\rÄq#œkº!´½4Ÿeô*Â‡ÓlÆËSã„w1‰æÈ2´˜vJ´´ëCïşíMíÈätÈïøã\nâJêúiç[|)Oô¾2r1#ˆ]\r2;emLË©ºÂv+Ò!ıY¢¸õö[i¹ı}¸ÂÊ-àç³Ó™?¬Ò\0g•É©e¡„‰ÙÁÄ¤[R×e˜€³üiƒHèïHó4Íçsg$¤İœ‹	­î6;IÖqÔËÚŞ÷ZÒcì«o&7Çª»:b{·æš›qWŠ?é\rt8ë¸êÄ©î\\\'L3²O[Ä£„e\\)U ï¤<ë>J-›½Ù,ë¼7‹…fÅ`.Ì€½™,½x½ï¨Âà@ËlQOÁ¤ö7pœƒ°<§@ó„&| C$À`Eb2³ÛZ]K\rà/w³åJ`Ÿ­Å]æq£‘n,8öu¼	¸ŒØ[@û£æL\ZÖRåˆƒÙ:ó„ [ÍŞ×ÒÁ u9ÖœXkò¬è	k™x®L¹àHı’cY>øAkv?áÃ#‡™Á„x¼4§j/†Âí÷xá¯Ò2°VëS/Ê¥Ş»KjÕ;şÒY%Ï8\\ÂzOa©†7[Í˜ÜruP¦×=‹fŠPÅõy½ihUT/ï³^#ŞÆ§Ê9 Î7s@ÃrÈ“~f`èÍlJxM\"\rÄj¶ñM7Ù­ëEu,lI éÆÊ‚¢¨UèP$ËhtÀÈc¶û¦À¡moÊÏ\Z`=ÉÛÅBÇ(³PÛ$…åt1qEZêeYlıÊ;s‰²¾ÍºR/“¨M½²h¿ŞE\roŸôÃúR©Å¦›Öš“<cáFÙbœï°Í¤e™ö\\V`“™FW‹¨ó¶	ECÃW²9-ëÄ¨ØZÕ\Z)mû,‚&„h:²5U¡»$Ã’Ø§Gfä³“d\Zj#BÔ@vÁÁhï¥¼êÜ™Ë»ÅÇJÎÌ‚î…ûRU/µËnÓ¶•½\\r¶E*i§N¡€/*™³Fîcz\0ĞÊßâE®•Ë6GÙÒm¢ıœ˜®%ÍÂ™,¶İN<J”³¹ÀÙÁ=èÎìgËE¡:šÑ©û…“ç¥S$œ Ø+D\0ôñ¶œšóÙ]OgH1wµ³äƒ¹\0œ}j?ß\"3åâ‰u4NÕ,Tà³-ª~áKkÌĞXGS|\n›Iyµ#$m/,\0sH49ŞGÔü,´i;iÁ‹,×GºÔ‚õIó@Î Ôl¬c­:G9l.ä|îÄ“KfO	ÎP!ÆïÛq½RE0é¬­fÖz;é\\S¬·H”\0 é°õl[ø“VŸØ ‡,÷ëx\Z\r,..˜nøxlaãUGk½j%­åÛ&ó.oL§è!(`³,¬ª£ÅIiü²¶³(÷ì}–\Znri¤úØbö¥\"Z’I!7—½§àÅàÄœlfç“‰O+«7¢dìVI@“—ô2E·¾³#-q6ŸJ¦¿`ÀŠuLz!oäÀÙ3K|\'â–-ÖaÉæ…İ–ş¼6/Í’3…|1õ÷‚zª–[’º\r¾Ê8Â‰•¼=T[XØ÷&Êår9ÏÚ^ĞCrwñİ\\ˆ—°fæÅtr²O^µÁ¸r¢ÅB)Ôb‰…èª®ï_Ğƒ±‰j¤^&Û¨\Zb/À6æ4¤¨H-y¡©cC¨ÇŸs‚=ÕL™q\0N«‰˜B<%aÛm;\'hn\"¢ŠG\"k4ª[°¦\'·èn\"rd”[ke2ßHsí¬šUfC\'seM;ÔÍ´†¼c0H²”v<Ìw‹²9Ä)ß+zK®£õêŒŞv-‡¥éJ¨ŠÊ;\0o\ZÅş@*Ë¶©dˆ%ÙûıU)ŠâÁ¦­åN‰|Â×\rG\\jRğY^{ÿq÷.Ç++a›ìà¢`A2—1úŞìgT¬äSr)‹³râ¶µÓ••,dÄXêş$Ë¹v9P¾vÜ¶‹*\\£,¸Ç\0Œà¤p[-\'k~¾Øxà´ãìàxa¢\\Š,Ibä:\0£\"\r6U`g7\Ze’\ZÄo\"Ìp!]8¥³…\0\"45°	w<0‹ÙmY§)@ßn-aø —Xù	aœX[°\rî€iñq¹_ÄM\n™L»„Ş¦š-Å´É¶ÖlÕk¦²³½·š;]wĞA•>Á“\"ü\Zs×ĞoÔäàMºÆå\"¶Wi{ö÷¹œ93Yê{£÷}á¤\\æ$eÅò²^‰f¥­.’\0v2õ8jqœ ‡|º>cZ«€£,	¯J¨\Z\0êPaÒM5I}U=sD€¯¸Ú\\à2ğÄoÎ»s\0è½#‹$“[‰+]NGæŠ\r/‡x^cËÕ\"yÅWù™ˆ˜Ívª/¹iÊ§¥Œ\nãb\ZŞÚ´¯œì$=SÚF§\rì.[Ö_$y\"‘œi®¶EBª^ÃŸq‰›áj…‘âåkIöq-©7G˜õˆ|íl½µ9S€h}è²b¹ #\\[äNÆf5tGÍß`†¥ã—4›EÀÊúBsfZ/(¡6½“/íÔ3Š\\:‡¸Îæ×\nŞŠ)&ÎUëˆé™³Å´Œºl.êªÚÕšåzST)Üº:ƒä)GVùµPle™_¬G°¼M‹Sd}R(İÒj‚™UK*6Ø®7¢ªnkåábU­çYƒ›~|„–X\0Á¼í…µ8V\"#‡‰µ[-Ù­ Ãê$Úy:MË®²`Í=¹­³oH•áIºGI¢µÕ)tÀS@O¢ì	ÉrJ˜‚€Ú»XÇUem†üäD Å?¸*HQdWs—¨\rÒzãQ’`ÔŞÛ\\ú˜K¯Å¬•R2ÌŞ»¯3^_(Ò…L.ñÚÁ¥H©°O*ÚeGƒÓ°†ñtIÖ›@d©,µ]}Äñ\r©€bì¶‡†©=ÏÅz„DNYh½.­Ú+È„6u< bÒ~¶VUXŒ*•¡m!M¶+°%ç‘‹I¯u$IìX\0Ùrşbë ¤)¬‚šìÒË–\"Ö2_‹Iî(@eõ?ƒË“$³+-Ä0ø\\l°]2Å­¶ÍaJâüRz«íhêû(âjõDŒ˜e¥Z“TZUğiİ˜óÁ› âNzÃÊİK–ıÎŞ©sî`£áBßl¾ÿ‹Ñy}C‡À\\–w`æ¦Ñ!˜vIê\ZÆ’>S §¹‡¦·.Ï­ŠPûáô€C.§À,_>Ÿ±%†ô@›H\"¿™\\˜²ÜÖ:LÉ¨æõS-TLÙë²aJàÔ–±ûFc)¦«ãu™kå5\rH{ŠÅjk9“sÒÍEj9÷~G€ŞWb¨Óønpõ°:~’±…)ÃGIº¸¬ÒÛD;0®å\'°(€N/ø,Ñ‹õÂ;/*~=\'µKpB‡»bŠ%ğNĞÛ]É²eÖL‹97Í%­\\ n*–¹ÓdIÎŒêıbÏ56²ÈX2®xŠ,0ê8ÍBÍ³D¤°Šf½ü QèXÌô©îç.,­ Á·ÕP§mC.t¨ëÄ d:“Š/=K„~¯zùÚK\'mí¢™RÈ\Zô*j±f”L£°÷ç>ğ~ÿ:ğ¿ÿßkrãiµ¿Öí~#±ùÏëÇ\Z4hœèÇ5{úOø7ü¿~ıB<|–ô—\n]‰sç«»\"ìz\";ËšÿúãZMºşÅJoh5²ê•lÿoÿr@«u»Õ·[<½Xq)‘3¥›£“Ì6öŸ·ÓM­‹BÀû¼Æpk»@e*åp–‚µ×.‹\rÓhéanú&™*|ÍyGÖûxÛ«)Çmz—a’8&q(E‰1ËÕ~ç\\¨m‘›ª	P¾»t)¸«$†h#vºÈVşiìydìT¶ü¨¡‡Aâ¡·0ˆ¹ğ)•×ğÂ(¾j7â\Zf´ Ó]ÌVs\"LV—5Ûøg‚ße\';”•öD¤]WKºkíZ\0+|òÈo[OAjßòŞšÛ,ä•LNunO–˜É7““Ë8r‰Ì\0Ù¡áÉ¶¡Át½Üõr×¯ºÙÉ\rBy[Õñ„ªäŠ-™gô:ÃHd£‘ê\ZHwßx®št˜\n-¾H`~™#{Û+¥%Wë@uT+ßº4Õ³®à%˜Pa]4Æª˜ŞlC\n™îµHL¥(9o¹ïİMu[Òás+–pÓ^~°›Ó…d{ËS­ãf¢Wô~6íÀàh“uh°!¡øÇìX™ÂI¸¼6 /¹9‘÷ö!KœåIÔâ¦ä­6‰Üw>[´^6?ìÀ;j*IğÙRƒfbãè3šmVgKÛa“œ­Ğ*„P†Ñg<)”;›É¬ÆÌÁÁˆ!ÜÚ p(ï7Ö15zãŠì­>Ñ˜ÌñÖc6Ú,ØA¹Ş¿Ö.Ó\'mp°I9<¥;Áœ\\ŠE¾„LKÈ©D¬§;wµã\r(jø^ºŞú¥\ZlÅûR°\"A^7Tä]ä™‘hP)ÍvÛƒúß˜89Û=Qoˆ$Õ>ÒöQï$S¿^º$†„\ZG6g]ÃfT4÷èi:ë yÛqFZÍIgæS•¯Î\'S‚³kDo~°‚b¶£m·\\ò–0’&j‹@=Ğ=jçÏlŒ­œeˆ°	7I¾d\0kzŠ+x(Ig²¥“‘u\\lWkkØÊFTÑ)Í^ñÄ‡Ú+H±\nÓÓN¡P=E[nm_@•Y+îíÒ]™[n-Juø=¨Ì*±7Ã!˜Şuì ‘7ëÜ$IW81¥ôé’Ì‚2ì‰xH/æÂU|®³^fŸšÙ‹cÒ[Mc…”Ë¾ˆ‹µ4%:ÆÒ&m†‰§töZJ»¡%â…¯øÊÑ§pm‹ƒ-rşQ³¨×‘MíÅ ¡#ÆW€½ëİ¥€F•†l‹\\ò–€%Û½®êí[°¥%E9Ëñ[bÍ+pU–,\róë’d„mÓ“ŠÛf¶Ó¦ùamÀ…ïzc‘!Lzzã-×Ô´À“®­Y±e§;N½ëşğ.4,GmNò)OÎ\0Å›’:kåq]’8Mæ‹(dq‡s­‘(ú²#7‘P¹RV^Ñ}ª§ÂªgWÔ¢Azé,5¸z¹Ò¢Œä„\0šj1LÒs\0èŞRäÔùÜqŠ®X]Ü¥§„å©À5g•¥\rST–m%p¤c\"q¹sğ—ÒU\Z¡Êq_W>’W4Áhú%¤ãÕd*	.Ï¯éÈ‘¼LÓ¸_İÖ&×‚_$ Qp®­–@Í¢„0&7;a: >s(‘ƒË¸;’ôIn-Ñ‹AÛË9mC{36Ó5Ï°&¦3‡%¯xX¡<3œ„&&ùÙƒ©Û=š$¨È€MÏ!ê¼¡g ’‘(Cs~í+‰§l³šæéz¾ƒÔÉÓ]Ë•+Ø¬—K&¢¹b‚¨	CÑÇ8Ñ±ŞyÌö@àt8§k…\\Ë‹ı±×e¬rz³4w–pG=ÏîúÌ°®0“v»>h%.\\ªPÜ\nVUÎÁöv«÷ftoäú%e˜Š¥.¸Y5lÁì5ØÙÂÔ#úı¿d	db_ìV±ûí€Õ[FHÛdÉ&´S¹îíq¢Ë	£C=O:¥—vo\n£@ê›çÕÄ[hv!¬Ñ^’»f‰¹œ 1ÄaTûnNÂg¹x¶t2Õ:(8Õå3ë…ÃŒå Y¢š[“¸T\'¥B’5qèR›¨˜6½WŠ»)[}V#¾U¬ÕZ¸`è¤Fmõ0jÎ€wdB‘®®zJ®¨23#HIç˜ÍİËQ‚Bì÷¯…Ì}ÑZîgÛÕ`Œçl.Åà±¡¶—“ÄÌ3“5$¤²ç3:¡Øà|šÌøÀe\n×JæÚ{MÅÔ2ã‚¥6Áàš­Ìµ´”JæW•àš•Ô+œˆ.·d.)R¸Ë\r£Læ¶&šfÌ÷ÚN¬¥ğÔ%®Ïƒ…9Jwß—½Ş\"ç\'w=G=h$`Â¡äCá~ç	<(í‹=0]Ìèã	‚p†ó+`ÊÏ®ºpS\Z(“ÇKê,”ŸI¶ÌÃâFCi‚vÇ°C°Ißg\ZìVêH\"–V\Z»´ôi!íçs™Û²–Şç-j8Ö¶	èTæIĞzqÑ=íìèøH›KYá¬i8£,p‘•ˆ†!4’o·PqX²(Ó©M­¯Ó‘”×*‹5äœ‹Fã\\Õñ‡÷ÏD„€LÈcaÙ9ÕD>_³½Ç‰@Jéyê¦™\",ù“³ÔÓ4c…T5¨úâù\0˜oB”-»<ª,’KÓD\\(vµÆôËîÈWR·	Ûbkìş>×å–Õ¼T4È§üX²Ê†ÇW>Ãkr«€¡*f²m<¶×Å‡C©Â^ô@…jŸÃLT\0VN»²IvAÌv¡êh‡¨UL&€ï—ÚË®J˜„º®÷88œÍSÆ*sjvëÜw·­H 9œZJoóµ<eŠó’»,NfuÂd½®—ü|{öYV¥Ûz²[œH=Ô>ªg§jíÆ\"Ú³Ibµi\ZÌN$í­›\rÑìÁ[…2&àKQ¢÷‡Ğ­ÒTÓÏ,8ã£Éì¼óÓH¬¥{ŒpIó°KVâR€×îökBì@?a\"‹Ä9Zq°gO4«*Ø’>ˆšmLe›Ùnfº³\nO1pı„€>ºÌlÂÙnh©¹“m7I$ÈËÉŒ“\\âVš¥èş8¥³u¶\'Åtµ¯8Ö¡”wÓ6ÌªÖK+-®_[eºKĞ![>Ú¦,»İÚMt+éfÏ–sÎSÚõ%ÂUµñWên×li’:-ÒdWKÊºÜi½ğ€©ï_Ã7:Ğî}¶—Š<\nè5P¢W°ñÊ+õb_\'ÙbëïÖ˜µÛÒsÿ’y ˆÙÇp­ËÉ©qByã	‘UôÛXó5N,–’ê¶G	8(p*&g\nÿdè/›b¹Èô^¥°‚ÍŸ) ·<ltŠiµ»ğœ¦rè¶Ş\0;¬..Iâ³ğ,¥Ëyµ‹6\n©²NŸ%>“,[Q‰ÅÔ†ËªtÚ­x%âw‡Ò‘3’Ö\"ÑØèÖú!”˜HõvxR/°4DÈ¶{z‹VâŞ·IÏ¦zÉ%¢9G¤†áîFpÑÃ*›æÀ”õL³ßq	pi—ÛŒ¢¦4_™+“dµnf¡K\'˜5Koc9tÉf½XkSp}:af¡êefíq‚µæŒ:±×O$¯+.ë\'¶~PX”ÖÒa&µ«~mùvÓ3+CL3Z§ëU¶ïHq–cPB]´ÄnÁï5‚ÃÃ„U\"8(´‰xZ:Y<wy:nÖÜN_ëÅrk«\n¶y	åt„Œúrár\r×´x»>I>”Ñİ6FN0tP\Z³÷A—POw%ÓóXÛöâ(ñ“¶äMH¹7•Õ®­ƒÙÊš°”Tg<¨M—+©ÓûZ”Z1µwÚr´c§ë2d&FâÒV3m#ÆvÌ¯†q²:“Î7óÉŠ!Êğ”îÎˆ¾²NÇµ\"¶½Æ%ËÒ[~Èl¯€“xéI4”gaïpY‚³\"‚^Xlä¤„ª](Ez‚RµQå)nh`µ@—$n»ùŒŸnè%6Ï@ŸL\0‹;…´vf†–MSG<šb¿Äh¯fÔœrq\Zl7êš;ò§z*ûŒKK•\ZlÎ‘Iz—œ\0 aKÃs,öâSKŸy¨=è8ñ8†\Zx»ëùºÚ•WäıéÈm&5U²FáÍ–NF°X%¯k•bOWùº¢IÎ*@6•·›ÎÜì²^qÊz1í¥v1Ùï &ò¨\0:ÇöË^O”A™MÍjÆó¹,Õ¢uLí°¤¹Ÿ+j¡^N\"ˆl§b”*n˜Íp:Ûn)oÛ}µ>+Çå{§)ùåÜñ,¨	: hÎ\n½£)aVNO´@ÖÎŞ3ÜË´7\ZÎÒ|EótĞê¬,£Ëôe eMÄxº§+yÌøœ€ÜSŠÌƒ!†íD!;Mö\0#‰·ƒ\ZÇõ„÷ı¼Ü©sR¹®÷Ù4‘™™ïööÛYH\'¹`|ÈRw¿ª¶?a*¼_^ŠÛ\Z²ì	LùĞÆÏ‘D#sböî^§kb\n\\˜c*FÄôrò6¡$•™»ü2HÛÎıü´…æ\0ºßÓ&Ìn#yİ»¿6‰[úDëY×ûåİ*2Ó^®]òCjîwºhÈ4[nØ™JùŠx\"’Tmƒ Mç«Ğ_…½÷ j©Äœ(–ë]Ä‚tYíû£z1¨Aü’<e}Ó)ÔæpTÊŞUæ(Ülb=uTP½È®‚İš?Æ• \0+jˆÂì}ÃòÏæ&1gbï Ì\\›c;ÙìŞª\rCjvû3€Åà6ñ|RI7Ñ¶–„Q\0\n!Om¦Pˆî\0Lšöú¯;p¥CÕíœ*¸Õ\\§óY‚˜‰/ºõ	LBO½È©ïñHÃøİ‡.Kú°ìHJµó¶çí §Û°·YòuÛ6½ö—Áœ<õş\\)¸@^‡mrN%9ÛB˜˜+3À`8ÏŠå‰4.›YÙ2zît/_UñfZ3‘)_ã¼q¡\0Ù…Ê|AR¸ÑWÇ\\¶ÌÎ–ª³@¬“0$”°(§ÁœP™ê¹upO§ĞÅñu\\šuêø.Oçàåİ\ZO%òÒ¥³¶êÂÃ<[Îpwô1tÍÔF=wYn×W¾Ôe‡>¨uØ“šoÈU/xti†æÇPíí‘DÊMa,cGC{,ˆ›}c*DÉ™¹„7£¢³®*DÌ®â}I@ Î _®q­œ\0/sLo;º{ÍUÎ\ZŞ{t¥ÌrTC‘•D­d£”{î%ÇSßaJR2{ÎĞ\"õó\0ÏuR”¦ajGäı¶Ë<i“èù\"Z	9¦¥6¶h¥\0²iZÜı‰”|1[–ÆÇöIæƒ	¸o°Êæ—ÈÉ\\@ä¼»ô6±¥#,€µªs«¥ìcdSî›’ëÆ! “N­$’‰}Ëœv”—¯Âæ~™àbÎÂ%©.Ëc?ÛƒTÕcgjAC€»€™İÖ#T>S¼cQÃÕ’ßÎ_µ$FljÎÄEİoä”Ş\'9íˆÊgda;òb2İÉll›O”gl9\rXaë38YÈëóÊ˜~¬Àù¦Xt^r«KQo{šê\rZUg#s»\\R4¡Ãæ†O-<ò2H íëºKŸ:[Í¦×ÌI³¦—jãÌ.KV·[\ri,-âqìjWY+}¦ ^¢ƒ3Ê«K›´êªºÙÅĞŠ÷ÜıinéL‡¬•yÚJá\"İ.&½¬Ÿ\'wÚş¤ÜÄ˜nrş,´.áb¾nU{j\r¾³Â»ªî÷§Û»ïq§sÌLÜQì‡£e¸ŞS»lVÍ¼u¤ÕyÃ¢{ s\n´=QóãÑ’ÁdõşE\"í»~Ó+˜¿¡&%a~‰éi!cIéR\npæèÎ€ôIºÌ<Ú÷óH]â:Şá.Ëš€.æ§m-–…HÎ‰ƒz\\İãpÜt“jM†doxB²Ø[²P¬€n,,:œ&±u³½’ªHİızícÄ	U@>:®2ßKê©1p4¶y¿w‚Tî×LW>ßÓYÕ„ä$sÙP³£]87õ¬BĞÚ¦Hö„.ÚÔ/WÂœÑy˜B6(ßoUšqd\0Ê$(ë+dIüÀHsìÒ»€¡³-ë‚¶.—M!\Zó\r4ïÀ6q\"KÁ–”ıÆï]†õƒãj;Á¶{İ=x;5v›\"$9¢ºÅN­“ÉZ¾#sñâ~·m÷A!`v\'-PÜ9û‹Ğ—Ğtï^<pÛ\\ ã&Xˆ‚ÂÌ—T»Íúy·áÉYU/\rQµk†4‰t—T ImX{Ñ{GFZé‚nû¦ÉŠ¦Ä\nHp©ØŞuÀäÂ\"m¡40	–·y!‡±ôÜr½_¼âı¬aO“C$fhÀå®6ëe9{¯|¨½ı¿[%|ÖÇ™cúRd–§K<[õëØò”„-µÍNdz:Ë&^HRûº\"m±(¬âÆ¿¤9Á!yÏ»‰§öŠ?\rï,U2Øz\"³)(Y‡–8ó±=\rtùùoŸíúÿ.~¶,ƒc’‹äªö\Z™\"¹¶Ÿ©ÙòÖOšZÜBGİ×äÑäQu`³‚ÊÓ9Ğuª—]öÆ\nêùªZ$ü’&€¹¬MNz—Öï½KÚa?âšÁ—e„l’Øn¶Ü¸Ü²`\"0pjË{ûH;)Ç] %5®œw¤°æ2l÷½.8ŠLDÓ¶ºÍ6ô¦*°Î¦èy-Ï—ÙA’¼Œ=ª›¬çK`et:R›ĞÁÖ18AD”4i©ZIh,›Ú<=ìÇF+qó•\0ÂGÏ·¼jÔUÍóî=\Zàª´÷®êe{j£>]äTï\0MšÍÛŞÆ‰çgRÔË¬~÷ h(/ø2³anöÎB‚¬Tş¥[dËuÄñ‚@2ğ¹š§æ´è”(#lºì\"IÊ@úÆëÃ8µW¢­zò­PÍÚ™Ê;Ş…šæsÍÂ—N¼é0èëÎñÛÃ²YLCi]s1”KjÚ¦à4¶æÓz/Ìcó+ú\0ûl¯ã	%Ób2»x¢êêÓôÔó`Lw¾Ê“9®\"kºg¶Ú	n±¡˜µKUµ>İ9åf+ä PEv:iÀ¥ó˜„ÜÑ|€µWAû¹.ÚÌ²q`H«Å™i¤š\\‰ÔŠe“#àr´[Jkcıõ^é vÜRëmº<étuoäõ‰> G€ ØÃwèó[V9ÎÚ’‹€a¨vÖSqbñˆ´8ÛG­|uJ–Ëc×ª´Í6NÇh)hÙìjÁS¢@+	¢·cgè^ —ój¶lIiIåõæ‹¶™$ã6=#N¶?Nô°ïSÔ-»fÑIt$Ii4š÷ú8qt0ßn–G<ØÖ‰‰–riŒœuTQ´v(œ<İ4Æ@ûÔ¬„yA|Õ°hÀœk*@ø…\rîk%îÌˆ^è>ŸyÛ÷™¬óÖËd¿è•Œº=Ì ³/ÓÉ|ÍY„~¸Ûy…Å´.;:g¯m/!m\'T²Y»–˜eéÏS!¶ó-AÄ>ó((ÜD¾»1ş´ôÊ•¥…\'©•)bZ,Á½l…sZ®³\0cRïLã®¾ƒğ<cÚ¦Ÿ5®q$¨4g|es`=l÷`ª–º´fà·ÄØ±fõïİÂZ6SMµ;„íz“¾qÕ¹yrï\\F¶ªCŞëM-ÆA½âP­şfK8Q¤ÍÍ”¥3âE<ÁféeiT ˜ò¼‚§üú0\ræ¥¥U\n*Ü¹´qÍÖAgÍP³ÔÍd	gÎ–v$÷Ğ‰çn‘ÂìÍøf-¤-EòsTŞÙ°wr@yëO¶ü._õÅ¶Á¸ÜNv,ÃšvB¡OôBÕ‰Ù¾¶7^w¨ÁGª&Oí¥˜PkfS]kŠÕ_CÁî°š:½Cµ¢g´˜™¦Ê/§ƒßuè”]JÅÕ¤œ\ny/\Z(ärEÓSmYÙöÊ±¾t\'«ğE@Á•Íˆ™½Ñ¶\rBoôÏrÛ†ô¾p\'“Ó¸pù}!8K`LÌjv\"gYï¸×…Ur,9i—ıÃÛÙ*qq½œv¼«*ke`(=@ù²ÃP$Ï‡Ã‰	©!ùÃ^²Èâ¾;ÂûXñ¹¶Ø;\r\n »ëâÔ\"RU¥ÁâàÄYB\'›‰—ĞÚ&ö à×>ç³*ùÀzI&8Ûxi©Û„ÒXì–%‘\rp¢ÒÃŒµI¶ò¢)‰ş2jQ²•¢ŞÃ¤ÒDÏàÍf§Škl-‹Èüâî\n!‰ºn2ÑR„†$•\r›DïêÏan;ÓÇÕœ†a¯ïï’@/¦Ş­ww›ÏØ:(H­×\nBúlFóhÅÓşÏM­LkJĞY±NoìCZ£¸“©R/Á`*°¬\0è.‘Çx†ê½¹İqH!“EÕ„xT$Åu2Òe`CkÍõOÅ^Ş!–ŠæœÃX<Ç‘-“ˆ[+%Û«Ø½ÆU8bÎ2L³h\nŸeY\"öÅ9P1§;$æòNÕÓÆìNd´=L(K ø°k(›ë$¦\\‚“ÂÃ9®íıØs§v×¬åÁ&–•Ç)T\"¥át}ÈóıŠ¡O0\"~ŒÙdÊ’ÂÙ¯üRm$^œí\':Õ~Ã.ù¨J—[ƒr´ŞÄô~Fá$­Ô@**;G™lô™ÖÍ1é¦]ı iúÄâê…T¬Ö˜°ÙGÛm¢Í÷•9ßı¬XF·\"ØØÚbfº–;‹}’Ï\'‡YMyí¨b\r²­ÕØv©Ö¤Jt=K(ÔS°˜Îšgè:IêrS…9	P¿‚Ê?u£vg”g¶$âÔî„¶N¢eÖY,Ìı‰ ·Ì5½%?ÏĞzr©à80üBá¦,_¬âEé×tÓú¨]äb¹˜.‡2qwP0k‡{«Èó.¦Å»¼Çı8bÉÒMoÕyú|QFWP“^Vİ:a ÙÉ¦Ô^UÍO%á]½™C~j‚xÔv«Éf™\nô<°§zÏŸm²;sÁƒ¨w@öŠÁ™¦åş´õä\Z¬å3\rÖ0¢ƒ: ïSƒ\'qõößÉg;\nZæÀ›š›–>¡Y£—¹0ÇS±pÏŒ­ºuuASg#´Søâ+ ˆŠºGB4]t‹9¦µ²–!RØ™J‘î„ò¢x#m‹i‡Ï¢€2<¤Ø¹Ğv.T«H9sf¸ao¶@°Ä`³µ¡NµjÖÍü(Ö+´Œ¤g_`œZX²<[&k$Â,Ís@P%ŠmgÚ€íT²A/´æÎ±¥ÛÊ¤AªÈ+aM[\Z‹Û©\rÊ&\ræâjF€	7‡¦»TšO¶()®z­Sƒ.?µ9!”&?OgYÙö–2:[ì¥#cOÃÔ\'	³ˆS#=¨îÅšôÊª¡ñªÁî3a\r£f.moš¨‹z— k£†lˆ@75\'ÇŠv9ìÉ¬äåâvÃ šºÒËÎFµ\rn-éÉtzLéËD,{ıy	ø¼W²ÊÎ$4[¹D)»ŞïEZ€x™ÄËó¬Z`èLy\r~k\\âÖ&ä°À:¢“ÎÀ3H«YÅ¦K÷Ñ¾¸HBËL5‰5õ\r»Š3õÒ\0§×¶ºÆ¬sìĞ5ç—İ	{I‘Ì—Ó Zƒ@—6X6âªNö/\\4QÕb’áj°og½¨Š™ıTœNk@r®Ÿ¯a\\ë·oÜx<DSµkµó©`¥ErqPQÓ™ŒôBN×É°æqotíÖ¤ŒVX[W\Z¿Ei¸\n9İ´\Z>QœCQ—˜³¶:‡¢•\r/ĞÛÉú°7%QöößßÍÅz;]£6‹z˜N¾”¼åş ˜|Z×öù°›ÊÊC¦*u€fôVgO3ÍK¸¢xR’ÄP(lúœ]d­£€èPvP÷®[šEºò\"c-Åk%&+”ßıIqi<æ¸ucm+Ì{‰¼ãj…ê·—µ š…@N+\\\Zp\nÕlGX[›7Këd5QÕ«€‹Q‘•LÔcÁYh\rrY£SfGº§nV.ÙòÉz£õfZzÖŒÆZM¼s“º¸†íz®]î´([í\"j½G¹ìl)&‘\\„‹fºtQÌÌÄİÖ<a±U˜+â¼¶æ,}>NœŞ†—‘·@S2]G%ï•X]xæ!İ+96âbº;ÆBB¢İa×»ÄÊ™ÖûKb\ZÓ³Ñ™|tR¤3£®v©Fí)Ÿu;w‰Î*¾YÙ˜qiT8»nôSË+ŒÁQ\r%¹Ğ`‘;İğÎgƒójG%»ùÉ‚\nü¼Î@ÁllEaª«­À×–z^Ó *a=‹hĞÎuH›ƒu«‚¶óš`}Âæk)>¥î¬€mfYY Ì4Z7ÂÌØù¬-´™ª{sUPsè^ŠwŠïÉüeåAÛºíÇ\nçâzûİÛ¥Z½2¼-~@\ZÔïà^¡H›°J&E¸\0õÊÇ9Ás2Ê,“ÛcV\ZLëå[P·•išfÆ„gdÙ”\\§˜Ye¿\n4ĞÛfè);ªW½iãô›˜™ˆ*Åú²/0‹lm18®fÑcmƒn1¡ÈÍÒeD¬Ä&\Z¾\0¼úBÍr·á«ná¯±³ºà˜ÚÚO™^4ÇŞ¾Ó8ÊØ½.2ñ‘§&TE8ÃŠ£Ü1•[3y¹«òrå„Ş`³¥nM=ó<\\[×¥¹ÖÊŞÂ‹½Ùb\"¾8‹“\\n%ÊUMdÏù9›×zo™ä‚Ña[õ `gôyã¡¢MO5aYó¹äò&Jíz·æìfVz:`²5‰p–á,·óú‚\'şZ–\'[+ÄE\n\n)ÎöKäúF \'Ì­ìº’Cj\ZÏZ®a¯öDdï/ËaË0Ë]Tšµ5YrkMN\rè Çv³š;‡cË¯\ZèPÌŸÅA&Ñwõu¦ª¯2V¸4eµ¦è…•InCùùEÑa}É]:(™¢PÌæX¿~ë­òÌ)œy½áCyìâàQ+œì.2ÑŠù‚8c’,ÎÂ†<óQ½»Èƒ¬u˜F´+<O©`‡Y³5Y3.ı	B÷¦ÔÊ#IËV5\'}øpš{JYk»f3½h×0\'Ry{nçXÖÔ~`®…‰İD™ìĞâIæt5”@°Y·å‘é ubòØ²™(1ìV‡Qe=2İWõR×\n(TbzšÈ¨ÇM5¾÷Á1É)‚\0z›@.L?>ëD¨p²Ïj9¶–ÖU »ºwX™©ƒM÷~õD«Y;µU˜1‘4‡ª=ogºv~fÄ)[nSå4Nü…8ØÀÔ\rp³ØÑ7¥«\"½ÇªmN)cŸ›“„u´ÚÉËğÀÛKÓozUu^{\0ƒ]hpÓ$9ƒ­|t9çhÖÎZÈÂ¾ìµ“‰»®…ùÔ7\\ïØ!Ü¦¾étMroßT,j-?™Ky¡¯J¡©\\f]E\\Ù\Z~ÿ&Tßá)HJ K¢/ç\\Ù5Ûh¼D!K;í­nfqÚd“>\r‰\nç]†XA>4åjŸÛÜ,è•ñæ,t	‡~ïD™;ë.ÅQHAòœøliÛ;/mŠ˜Vdí¤fŞK<==Ç„¬.m´sß•µÊØk6*(¯âÙñXorfß&i¾c]	Ãƒc\n.³]MiÚ^âJ¹×:\\ÑèTb-ÇZ£†¸ÂÈq–·YÛzñ^Ì—Râ„%¨œKí•9k\"êMƒ–·	 {²vwX‚°»)@†²\n{_&ğõ´ÒÁ¤$RY3] Š¼%ÌZm¶K}†³Iú__³Ÿ×Ì ×¿şû¿»c–Xiü€GóZİ®¾ŞÉùHŠŒ’ş€\'cÄè81ŠcãÄ8ü‰ØwŒ¼ü¦Ë·¾|¢ş®×ÏôQ:/*¿÷{„üEí·?“ÇmDßõÅ¾PÛ÷úï&}Œş»yÿDÖwÇáÏÄßöı+ù·]ÿJşmÏoäfU–ir/ôãşËóÕ“ëŸ‘;«?\'ÜzOõâæ§«¬ß.˜~OTü–®è–›ø!}ÑÇïAw-;äè½ó‡—ö#\Zîo¯·è^oşøí)cÚÇ%¿Ei”Õ•Y‹òé¶iú_îé}¾wÿ­<ö0w££C‚ÙÇªoÙ¬ß®XHKø–­÷ùZièEz€/õ%ié<æ9óóóÅØÃ*¡7?Vç÷¤·´íıK9–7à~üOK¾èè—úFr\\^º±Ô—÷\\ÇéÅz™æíë¼qßg\0©êŸ‘Ñs€åïiO/äş »İqÿË—§†uMpñ˜­\nÅ²’à#Ùªnï©&®CÎ‚Dşõ„_/‡|êú_RŠºHı+Õ}µ?ÌÜ1ÂŞş¾f	´¿•kâö™“ı®|¾ÛşE‚Ğ‡jÌÔnÿø\"Cêçwy[hòËµù£İì§´¶\nA_Çúµnš–Ws#›úœıS¹_GŸşbüñ4£ãe¿ˆ\'nÀÇš4ï& {Q]>e„¿LÏ÷…ñÑO	m¾&tzí÷DĞ/øƒD¹Õÿ¦rŒüS.šßÇ\":“ëŸ÷~N\\ó\\á÷st]©±|,_Ç~ÏDpù©^ú€Íø[Á«\\-x“`Éˆ>_ÿ0Éä7õ_;ö½\Zúï§´:·\Z§¾&è÷Ş2elÇ}*xOñPğ>¦ïKf•Ö½77bç«D¼í¤“c¦¥’?>\r¡üUo>rÛ(|35z9ñ˜~ë)Oê[NqÊ{š®§W/SÇßä4qß\Z?)òº¯ÉŠŒÌÏ¯ëWQ\\Ui\'?Ü¨ê7Òø;äG•ıcüÕÛ?iÕÛU¿ùFä¾çsüÿÁ†K?ÈíAc¢¿¡ØÿxãÅ[ëñAô­¿níÏTÙÛ­YvM/û-ñ#‹eFâüñ–õ%N¯ùãşfúJsÃûáùw}P¼¥¶ûQ¶Ù=¹ÈïO,ÿ7[ùÇ§®G?z±d9şMŒ|ÊT÷7›xháí¹geûçZ¾›éƒÊFŒó{ºBâîTÿò‘UÆv¬ôö\rt28&ï>ÑÿMÃ4Á@¿\\vìß?éñ¿=¼ë2İ‚›¬ÿ˜Ò;wş„}î\Z\'qÓçü„/\ZıâN\r‰ÒF©oíÿñ5Gı=]ëc5£Åƒ$¹&£ùn„Wûı×ï;qÿçùz›Şr?äõ›úyQã­_×t™?ëÙŸ­û?3_}Åvpùùº¾-Ãm*ßÚ<\"â§-¹Aã¼¤·áıñÓÕù®Š‘~ŞLñ¿\"æƒÂñ\Zî%ı-çå|ùßV3ò\\3öï«}®™ø÷ÕŒ=×LşûjÆŸkîyáßV5ñ©êã\ZN>Uı¶ˆÙ¸rÙÏ6ù#ƒ·U~f¶ü…fğ¿Õ\nú[¹ZeıÿşNSØ_l\nÁÿN+ø_måoMñWyàjNşÄ ü†mÿRSØo‰O¾ÕïfDy5Nÿª·¶Ó~ª%=ä=Nò—¯ìÖË^q¶ı8ÿykû\'Zìy±Ú{ZèŸÏåÓı°œ(zwã¯ÖO™Ëû™úï÷Xâ»ÉøgVlˆÒİ+ş\ZvŒ$<¾ì†?ÓêS£wäÙş¹™ôiZîS:ZÉß˜†Oñ¼›1ş2–{ıµö¾Ÿ€ÏñDèíŠ¥_şó\Z1|ÔqÿõÇ—ıñÙŸÿ[üø·*ıkó·*ÿ-òoä?UÓİùå—W\"ìªçşÄƒ¦í{låÿçŞ=şOíßwİãyt”ç«ƒÒÿaWù]4~	a\\GóMÿÚ^øû{{äßÒè·{ç_láOØfFşêú?¤×y¯ıŸÔïo÷àxG£ÜEi$ö=4ä9do6Á›7ıTÏà/Ös7Ø~ÚŸØè‹Ü³+?Ù&(„ı©~¼,_Ç‘öÿñTŞ‹R³7Ãª,J\r»—-E™W÷ÔÒ‡XÈÇÉËÍKz.EøÇ[†íÎÅIÊâM*Œ~¤ğÏ§şu¡û<[i’ùNî$W¦}jğ#¡ñÍğ½¥0¾&6¿[*o¬¡ßb)¿?!;\\÷E—¾iòÙ,E>l/arıó]wùí:Âë:¾MëçlÌ×şS·^>şH¾M‘_ñûcàó÷43¬ lÿùñ{×/ºí4ÿD¾*Ø×½:ù©·ŸNÕ^—KmÿÜDá”e_Uñíú¡oğŸªë‘­,‹®?^\0o»ãYw7Ş§{ŸF”ø±ŞÚıÇ·í¾âåÀq•}¥ù=½÷ığó¯NÛ_l21bçSÜûÇ¨J_áĞ¼Óíç‡CmìÇtû¹ã>›>\"eF<˜«¡ñ»Ğ+p¼íëIÑı$x¼ÿòhÿñ¿ƒ¹áuó™?ÜÆDúõúç7øóÉñ~¦ú­ı¸=qÎ€§¹a«>b¿‚TX·Ã£[{ÿ:ü÷ñ_ƒD¡áHê¦âDQAñ¤3ûs}ÿ‚,xİ±o«¼Up…y»ã!\\qJ_Ad?W&ïµ~\'Ë”ı&¹êş+îïa%%æĞ­ùˆ½Gşù¡â¾n°Õ‡Á†İázÿzçÇÈ-Àd>` ÿşd+÷@È­¢ÛJü½b¿¿½¡E}£¸Oê\0G„ÿnW~y«ò³½ã{şD­ÿø“<ğ[áDU:po`7£HÛü·6õKÏ)Ú»²snoÛù}vİÚıØ¯‚á&ôx]~ôgë3İÇÍ,ûjfA÷ö ßÇÅä[äñ/›Œ÷n|ÎüvW?àÕ0ˆaÀ·]û6„aDƒ4üÑòp\\6 @¿[Üëö7ŞˆA|‘o2ü\'ûı±ì5`ÿHúğnĞr/;¸²ëŸREPÜïŸP‡ƒäù“šş±/¿Œ4ö]ÿŞôèŸ¶¸^·õyÔŸ`_Gu“|¿_éŞ¶Ê¿oÊ?¿¢¸ás¯XÑ«Ê|B´şËãµÒ¢!Ìüqø·UıŸ-àçÉş\0®B¿üEnş—m£¼ÉˆğãÜÔ×Ï¤ûßkæ—Û/¼ÉO[åºë<áÜ¡_ˆ?¡¯ÿ“ÿºüQ3lu’¥H†|óænkô<”ÿşi+N–öÖÃÍHÿƒı‚ò~7’Èÿ±IûdäÈ9±8ûoàÄ?Ù“7×&’{„ñÃË|³î\'è¿ecü«İ}qûná6‹ÿboè1ñğLQ¡ûÿòºşñ9ô(ÊÈŸ‹²ŞÏé-zcÄ¾ødI¼Yèã=·Ú»¢z³,ŞHnÚêíÑ\r^ùÏ›©ñ`Öçİöx>Õüôî³¹ñp,ÿ{îÜ„ÂÏuñÛPÿé¦VUü‘VåúşÑï‡İíáñ½¿û„·ş¦å+Àûz”ûeŠïxvoë6|Añb ¿ç5Ş»òË›Oõ+û¶Ôı3¥?>ìÇ½A9ÏŸeaÏî<òñAÄ] ÿ÷ÿ',1455342687,NULL),(7,'61zfpP4pSD70','phabricator:celerity:/res/phabricator/d7daa6d8/core.pkg.js;-4XmfWk1_o6Az','deflate','íıiwG’0Œ~ï_ºûef\"å¥{\0•üÚ’<–ÆÛXêeÅÁ€@‘,ĞX$rH<¿ıÆš™•Rn÷<sî½}Ú\"*—È-2222–WëıáEq¶™×Õ|Ö¾*W«ÑyÙ¹}?Zş®,få‡ß½X.çK—1ÀŒñh:-—Ã³Yñ\n«÷ø{Pµ]Nç¶ìùbî—İ®/–ó­r° ˆ¯}æ§ïÊñš;°,OgĞ:~TUq8¨ª\'\\ 7-gçëH88èÜ.{‹ÍêBêWÕIg°]–ëÍrÖZj3£İœ–Ãôe´„Ê\\\nU«¯—ËÑM˜ÿ•ıêÛ¯†-Õ\núW¿îî¢æF˜êZû‰G±XÎ×óõÍ¢ì­ç¯×ËjvN3T)Šì˜GÖ\"È\'7;/nü˜ğk8Y­sú±Z;·:s—¿«f¿óÉZòøò¤ĞTøífLó¹•Ój6±­ÌÖåõ:Ç„üj¾LUŸ¿øËpH¿q0ó³ßa½\"ÓŠYç–P¥	H©õäf3¾|š·z½^§ßÊ²¯×ëòj±†¹h­ç-,ÜZÍ¯Êõ¥\\ŒÖ­jÕšÍ×­QKÁ÷2Xğ-õt¾şÒ‚·GËóÍU9[¯:½Õ´\Z—íÇÄQ¬D}p‹áRz£ÅbzC%òcéá	Lôl<Z·	tÇc–›”ƒÊww\0ìüCN•RÜ=*³=:/\\J»,oV…àş6˜h‘Ø)´Ş”%ûâ²¶*³¦£™GKø\r`’ö¸ßØãÕ|ZŞİE	½éüœÖ[’ç‹r9Úß·_½Å|µ&êÑ¹\r+·P»ï÷‡ËêA,ë`[NWån0UPn#ƒä9«wŞS4\Z¯Ca)9*µ.ÚÒl´®ŞÃÄd™òr‹Ç)+œ~\"R3N(ÎFĞçAŒ)W+4-F»;“ÑgÛíIf9)\'­e	­,G3@w,‚˜ÎP[×Øz¹Á¶Lxİølş¡İ!´ó™|>ıWŞ¦¯´SóTñîg0[M ŠÏö÷Ãœã$Œ£“nXêğ¤óä‹ÃÃC‹N°PgÕò\n\'ì {;{;û~¾^µæg<	íÎªÅ0¦7½Ö¿UÓ)Ğ…òê«¬­ï(@Â »†´f\ny½\0‡:mŠğ$íç£u‰¿ÌösÛÏIÌowzçåúMu¿\0í´Ùj\rİã$”ÎFWe?Şmf—4nMÅ­ûêo!Uõ”S€µ?É´ÂAö‰¡ëåĞÍe)…cây1ZÁ,.ËÑä¦u\nÈÕ’rå„¨¨C®¬gØVó½¾¿[·ŸàÏOúØ¿mÜAíŞ‡j}Ñâ‚-8¬ozPò¤—KÇÕü}ÙªÖ­ù²…g#Ôcèşº|6­V­I¨€ˆ@g@Ûw§7üû¦Ü\0éª§Ávítx×Öã„™LLæ´×1Yöwµ®FÓê¿Ëæ³ÍtZãPjÍ)³rpPU[VÔÊ ×r|t‚;ôàğ(g“ıı½W;6	\'x~Ïàp„¿¥.Ô[“=\\UùQvüĞíVUš;\"EÔ\nîiAfä“rZ®ËßÅÉôM]Bœ\0TÀ	¸ø÷¤W:BdÉ <ƒò0B£õx~•ìï‡ß=B[(è*Éq‹ëĞ‘ƒ«ÈŒt±`vbÙn?\\TÓ²ë/å»æw*£¹âBáÆww—e„\r‚Up€`Ò{hkRàJ­€6×ı£ú³®Æ+øuU^–KüÅ“\r?ï«’Rß#S\0?°­şÑ–ğ‹ÎtG-öø›šéØh§ø^Ù‰ÙÁ%üJoE®Õè@ßfn¶ş‹*ıï,Å7¨ùr¯(n·6áa]1‚ùvM‰ÿj­.æ›éhm8}öyÆ×ÎØ°¥ı\n.ËÕfº¶¼ÄUo8¬&Ãa‘\r‡À/\r‡ÙAûàÀn¨,³^/ŸëÁMÃİÙ8ww|ät/±‘Ü3z¯ÁeV.îŞ ŞKä¨FQğ©twÇ_xDÈT?Éhì0Ü£Ói9dOiJß,+˜0\\bí.°xLzgã’hï|³ÆÓHpùá“q`0íæ,hQä8K ~êõD”îÉŞèÜRq¼—Ødº›àTÑe©FÅ0çåŠŠÆ²Ï&Ãßµ\nSß§èWÁ=öeñh7PÚJeÒ¥¡É-}Á˜Ç˜¦2D)V%\\m–¾‡ˆğÁåRß3ncîIñ^™HL£kB:$—âá}HO|îîn·ÑÓÑª,\0Ë/FË¯×íÃÜOÿ¼€bÏ ½İ9€ÅÙœBµø°D¸‹F›õ·Ñ%Ï¦Œ!j”³3˜‘ì\0Û:)xrx$š}î³ÏmvÀèñËtÕqQÔ¨ĞZÚGÁ±j\nÃùWìaöâå-Ç4µRJ˜P¸uµY­é\n”Ó&Ìê@åQk\nû‰/\\\n¡{c¸HC©ñh³\"Nî·ÜÅZ0Ç„D½Ö_FË\n÷ÏŠªCéÑl4½ùo€9‚ëñx	œüÏÊÖœl­^×À†æA>Ô•Ş¾wğ !m¦DÆ°öPË×\nÓÀ¡<,¤Ôèµ~a\rIˆMäàl„ô›2¨00¢`İšÌK¾Áójà­“Ôy¼³êšê\\Á¡}VAó((±æx´Ànà5`5:+§7ÜQœG?\"\\àŒÜÈd86ëDü–ˆ,‚\nEÆ\"—Ì¡\n¥Ã‰G¬ÆoŒ*N Ár%œ¨è¤­Ÿ…ÀŒ¦°^áÚ½\Z½­ÆËj±æµƒ‰Y\0€5(—%”„…/ç«•£ü´ÈLûÄ*Ï\'²ÀÌ/æ^=ùˆ(¯aIaî¯Ji¤×zsÈŠˆs·öÖvø¨šÁÒ@uÒ¼rÜÌ7\0\Z—\Z.­F—%Q$¦ó¸Î«êu>î1!‡ï í“c—çqÄDµÜğä ¦à~8‡k`«/üIXáõxD³ùâqAÓ¢3“±\rÏ,GY˜Té™¥8¦gV9ƒ“rI»\'àÔMº;Ñ¤îş¾ÉÊUæ[¯ÌÁVU·ËôZy\'[¯1ğc-x¢=w	EºZ€¥™­‹€Ù¹åÓh>™k-¸œ~ü=ò]\n®VR€ëÓï»;‘šÀ•T³=¨»;_ËI{ÏÚ¾¬aµµömÈ_9XyC\"1º[[õÊœ° …Zïrõ>ğ%.¨kÆ„s®p¶Êıè\\¶–ã J¬/÷&ì6¡=pé~R£õÅpHó¦µ9©Ğ²*b<¡ŸÈ‘\nø~~i˜$¤}5î%ã”	“,¬ŒŠ»uÔJX&TšCºˆcºHÓÑâ­JBp8çÂ\"KXZä õæ\\‡zï€Tµ³¼•u aÚ²N²Ü!¥OHàûÜ¯¼•gÕM¦¹+œtò[àWıóQg‹\\1Ïö´ZÁF	g;Ç[Ìéh|ùOœvn÷×´KŸÓÓšë»\0]0Ü„•…ÕY³÷¥mÏGëQî[°&(sÃÉgÜÿ\'¿iÊÿG&ú·œ^¦\0¿éÓèwñU¶D™ıPäêBÏ<¯7)Ïª2®7-!¨­Ÿ±\0ÜG?á/ÿ“c<â®:˜,`D®µıä´÷® ®Z0KB6íÇáµi„\nûÑ÷¦¿§%‰ıøè–î“¢(ß|·ƒ&‰\n±u6&ş;8œ=ûw`¶•eÎr_³3h›^:‘+lØ[}:ím›IlŸb¶ŠãL‹gyÌÄOf?ÖAñ{?Á¯j¥L7+j¾\\½pĞ y=ÿ~;§t \r3š 4Ä¾´³ˆ·Y~«BÀÛÕz¾°ïXüšGó{ï—ÑªÑæ\'|ÑãQ?ıfs\n—ŸÁQŒÎGf¿–„r\n×ì×µ(@åN(^È…sş¨1„¿Ğ½IŞ½zç9Ü7Ó5v(L±ıù™s\ZztYM§ıXn\'À\0\nµãŠĞÙ×‹r×…+o: =¯@²}Om{Tª72}5Z/‘^?›OÊ`T©d^­~©Î/ÖßlÖëùìA\rªè¬ìüø¢(>»»[öN©~Q<&?Î—W£éóÍª|‘Z¸Œ/æK˜¼Âİ­Æ—Yÿ(Ï®°ÖfáOàŠ“¡H™<éĞÀñvN¾VÇK”øul\'&ÀÍa=‚™Æ!Œ¦kù5^/§ònêg˜C…ÊíŒ&\0ß—–|Fä	Ù+j} Ò<EZ\\§Œª¤¨ªZZÁGEt¹™wÓÿ§´_ËúÙÛ+dŞcˆ\'{õÕÄm€ˆú# ’‡i&I›ÁpÒ=Åaœ¤ã	®1	zš[ Tù\n÷Dq+8Ş¿ıS?ãÇ,ÿ—~¶fùÑa?càğû3ÿûñûY¹\ZgùgğcZ‘ûªöåŸAİ%îŒ,ÿjæ_~öø³Çœ??séö¹BÀ/´òvkßIn—‚~}œ‹é´üF¥”Ô	NıB†¾|’¯˜öõiu”Ú¹ïNrÿvK?W\"yÀ„jõf¾_ÈÄÂæ„jØ—[¦\Zu=Ÿ\"ÚÇØÁ\";ÖMÖægHh‡üß	?;‘¤9D¿AÈ—¦«mØ?\\œØÓGkÌÉ+ù4z¢Ì+4r€İà_®šÏ64ÿ¶Ûmx¢9ôÊoÑ3Ìé„fqx1šM¦xîÁR\0+\0©(5îgŸfù“ÊërüŒuh¨,uü5À—U¦’ßLç°-óÇËÙ¤¼îæÌœôC¶‡EØPãû1g_D€ø±WÙŠOsz}uZa˜‰ÓIšk^3¹Tƒ3Â\n,>-Q¶G@QŠ,/©v1?O+Ï*jÜ†=ÇzÃIµ‚Ôñæ×7¨\'ğ;Å*À• \0]ãñ‹¶7”Dtº\"!\\àFÏ™QghESÄƒÚ¹K®È@öŠÏ¬Ô>â@6ü}S-ÿ\'Ááô¦õYËƒj=‡›J¯Ê¯ÏúA |•±ˆÿºdmëuf—²X5!Å\Z¿®\0}0+@3Ò¹¥?¼ßS©k1bàaÉéïÉ‰?pj…QçÅ•çâ|ºò(Êeq;ÔĞ:mkJÔÏX&¥´óTúWÂpåE5!~Hì0Î®ofÓùh’	È\\Qft+–½ÜÑçSù>ÆR\'ôú¥¬\"QÎåİ;Ë»wOhüXŞ½3$‘çëİ;Ñ¯š@%$Z+J%ÕLa‰ŞW“‚éDŠ)]M:^ƒî:vyùÄ<8¸¬K\r°Àñå%> ­GçıßOæcBïûp4o}”·r.Õ:CB1ÊM·µ!é5Ñ>Âç¨¾ì˜¨?¼Öìnè	gîìŒÔg5ƒÇÚ)à[ÒéFW]º«ÿD/â.wèÅ9¢”RÏªí\\ñ@{XªÚÉq˜øÂ2]ì•fmh)÷ïÙf‰Úï%=æÑETP×mÇµ¯%7°ô`UŒ5_SX{³\\Í—.“?»G3I«cN=éÜÖ’z2L™æ6±zàøQĞª›=)b{â–\ny˜(·¤	¸œ…eJ‰©ÊµİD/¼†3CzKY,–ÇŸ×\0§éç€ö(«¹B=Ô%ÄÔ‡zŞ[-Ç/¦%î“»;NálâšèPCúÛÃ¦ŞaÄ3Niç±yf¦œ|w\'?Yúz\r‡<Ü.JW—9u;CÅ‘]:é	¿çpÚş>ÿ\0Òi[gR\0{ûãè\n¹Êïçôu>ç\\?ÕJ:¥V5!Å«‰‚¬&\0±šÔ«Q·WÕy5]‰.µ3d4ºT £#“Ëvn¥ÿ!}´u;¶¶¥D°©Sœ;/Ñ-ê©\ZøA%:†%ª	÷LJë9†-é‰FŠé.ã–,\ZØ“NÁ+T$æJ9\\Ï€>­\nÌ)œyÖ (8ß¬}ÉÓéf™ÉyŠÌïndÅ-ı„n-×}¼£æôJdôå.ùæs³àºštØïKaÑù{³¶ŸHä›Úğß[;@ßŸÌñU\'†\0÷˜öÿ˜ªÀn‹J25ˆS¥x°dÈ;éãÔÚæÇ|ŞŠ3\nî6±3Ú%7Äuõ•_U[®oŠ:ßíÄLóÍˆ\0«¹_a‚gÒKÇ¥ËŠ÷>¥ğõhûvĞ¶£}”\\ğtl!¯ßÃ‹í‰ÁÎÛ\r¯aº§ü\\€Mã¹^;;GÙşJüæt*\"ú[ÄÏi¾ßFg‡Ë\rÇÏÅ¦(!7=WkwâÀïaíºÂQ•|Z–ÃÑ‡ÑMqtHÿsäh9Ÿ¯86ñï€ÌşìÜJí‚ÆtÜ¦rP°ó•¿ô‰Áœ\Z¿TáIs4ßŸ^¦øİö¨FJÁ§ŒB²‰ÇÇ)8¦„“¢m>îî;Gƒ`V´Ü8WÕ¬Ê½»Ó”€ènC†$68Á–iS5\\÷å	÷^øˆ‰Gm	zÚ§OÃ§ğ¹~«½è‡½½<É¥J_şnæNùríŸ\rFùiÈÀ‹>ç¨§0»§îg˜Uš¥%€_µ;İÃŞ^\'2YUşëÁuªï~±¦oŸp^ ş¡‚XĞ‹W\nœuËîÊ±ôoÇuR¿SI_÷r£ÂÀŒè¿Ü€t,Å´40­m\ZØ2²íßß¯%	¥¦#‰©ô¹ótY.½¸^D¹ÇsûfäS†¯\0¬¦¹vw‰röU}… ƒ§¾/ÂŞ«ˆn(ê=E˜—k	‰‡ÏcÊ9	Ñ=R‡qÕä;Q;qmt½hgT¥…xc ¤™ŠËŠŒ÷àY^Ã‚áo„*jTb¹Xï,#8ÎMn¿EèØóCêë‰™!Øù¦È&şMUÏfÎ\\g8T¹2W#©H?#§Kæ =«×È¤úÕ û\r1®uíÌƒ›ş‰ØúÄ+èö“Ù|Ö-ùêbM$Œl¦r‰^ëÔÁ›V—åô&GÙÚÛlY¶6à\ZÈuUp·è½„´ÿH#“A­Xot4{›¡ÅĞû²%œº“	‹_Px)ÀÎÂq%à¸à2pÀx/èU(¼ıéÌ§SòS8’·ùh2ùgM´‚şÿ†‰Î²ˆ\Zëxd&L/g…›ëÁ–€¯š€çr­ã§aÍpôQ*XƒÿkÓï)+¯GxÉl7M?àÙïè=wÈ7N©z|x‚*ÄüûHÎ3¦a†ÆùÂjG\nû¡ğÕáƒ½CyH°)Á?Òç1å$4tvÏü¤Ä)wæ\"£10X+šŒ7ÜB¥eí$Ò|jRéïAÖaëÂ#^­Å²\\ÑR‘‚0÷œN§7$î_‘à×Ïf\\4§gÔ:-ÏPµoµá@@ı÷\ZÄ\"=ƒ:~©°¯¢\0ºgföÈ]å“.¥AÊ±ÿ¢G$9kš6-y¡µPTóàÀß·Q¯úI?E}4íªo›ÿ5¤‡ÃÏPòˆƒ{N«~çˆH$ÃâÂB5×kÔÜ†_ÑU%ı?ğM	_İĞš*rú*¼¬®*4†o”kãbú-ï•=ˆEIí\"xÊªä€½óñh]ş `øE2m€Óóo–Àìê;êi	SWÍ-™O!G¹œO‡šZCSµ7Ô_5Q*™8¾¤dÚTAsY£Ÿm„—å9rİK±Æ…­wî`1ÉÀã©jFÊÃ9©&¹‡9lU][‚=q‹®%’­Ÿ–§£óòşÖ…±¿×6#QZ8ßœ&Jdüè‘qRJ•L¥yV›Läv^¡ŒXüf´üÉåc\'a2§Áâ!S§y‰Öá-‡Y´+Ò¨&v½ñÊ‚ÒjÂÇeo·ªX­¿Q8Ö-ËBdQ#ß–6¨}•¦\'Jo7Ÿê\' \rßÉÙş×›SË¥ù¬:_(¬tB{’ên±ñş3v3\r;Ğ·¢-ãµî„­\r¬ä\'lKdâ»– -5HXŞ<ûìÊ ÙgY–¦\"ëR›/¸µù÷kH+×wXÓ^u¹<å@”«õª-ôl“cq»M¢T-İŒGò—@-Ù‰\nõY~)WóÍr\\Z}–!>‘ãDÕü-Š+Àº\\².‹ÊèKøC\0…Fï\\¬‘©\rE¾YV¹&Æ\0k¨>şfuüåbÅn&æ›u[Aç‡Ş5HŒT¦®`´ªBí?ÿò’šaÇIÚ•J8m%¸“ôÓ¼ìÖ\rãX	ñşĞ™ìÉ”ùRAÿU1İÔÈƒÚpü.ğ…ÖÍR‡\ZhW„MA‡m[»ó]I´ì.¢½ñj•u\n+pî~€õìõë¶ë—ó@z”!Šj†§¨#’B7«}÷Ë¡O_lIjÏ°=ªÁò¨°MåàD^AÛgg\"V ®ö¥=¹Ô†X!³âwCU¤Z½ßzõš-Sñq\nlªé†m¢r]Ü¹\\$/({ôÎY9Âet9îC\r˜\0NéÍ	`ÃçQ‹°§>—XÜæåøb4;/c­<Êâ‹\Z¥ç!zé¤Œ\"ÓiÉîî4‰‘Ø’ Gô¶>p›HVcõÍÍ›Ñ9¾â¶³‹5qà‚…Fålòì¢šNdBÜ‚Æ%VIQ¡SØ´îX(ëS‹hkŠ2®`\'.Ê&ùbYá,ç|åÁÏLfıW\r&2köÒNUÔg áVFæe„†”†¶â/gp²\0§šÅ|:Í’}ÔÔ¥q|+¿1hĞ¯)1bÉÙ²ßsêbQïuÍú’&ŸëÒ)HNÒêÙe~şH;ıò#—¿{Wğ<xGªĞ¹å&Ş½Ã&4µàÂ¨\rÕ´;]c³r@Õ¹ñóî]~ÄPø\\ñ\0FeZ–éÉåõ$ÖCŞZs×$‚ò¡– |øøoê°¯ŒS§Ù\0ëd:X0ƒé¸#Kgl>¥ÕBÏ>m[Ò{şx£†kø	œ~¬ÚµJ¨#·¼ÑFz–Œñ™­]²k4î-oN\ZĞ–wãÓíòr!ßÏ…u±Ä‹\"%¢›Ÿ-©Øú^ùeğİrÏ\0¶ ²Ï¦H iÈ7¨=Û%şÃ×í{¨¢n9³.¤!$›‹.Ú¼4è¼õ%ÑMŠFTõ@É×ş>%#ª\'h@¶at|ÑánœÉîÃ‡ g(®`×s²É0ÈGãƒF%“ƒˆU´Ku¹B³#ï‘ÈnĞÜ½¼ªI¶AÇ²}–¥Lµ3œÀÑš¹Šˆâ·è˜K²<ƒĞş¬àÀ?ş”…/®êÂß³j=E¬Í‡×ÑsÀÇUvâÜ%İ¯/–—åè£O¼Z«È÷Ê)æçC€V¡ı&9¢Ñ—Ÿø´KùÓ²:¯fo<kkÿ3nŞşöÃ÷ß­×™R¿›¯gp_QÆô76tkg?¬®¯¦{X÷Í›ŸéRıZº@˜Ÿ­ƒŠÔïg?ıòº±Ç¸¯1£Hv˜ŒdªõÅ3¸˜Á¤ÁV^¡^0ÕèÜ:¶Z$/{>¿\ZU3©¾‡úÂl‚‰i%(ÖöåT$=Iõ:ôÀ—QÒl§¤	Î&g§­:\Zñlµ;}—‘X~Óõ<?üWØÄö]’®—*-‡×$ùéöl´Enø¬Ij\06AšQ±G6ëŒŞ õ[Ûp;J[Ñ^ä®;¸½¼Z“a˜3eíD›Œ]PõÜ&«{€uE­¼@VYúK2¨QàèuE`ZR®ÁW!½)¨h0êÆoĞ–##S2…³‚ay7P²Œ˜æ\rpL‡´’ßÎ¦Æ`å¤®\"z0ìz)j˜A0å”M)_\0WIi\Z^HnëœõÅ|âzû}¶#PƒÔ²³Y ?ÍP*ƒ²ñóO¯ßd¿Hè–Ÿ¡Pµ õ¯/ŞD~„+šÊ‚çgÃÅ¨Z®ÌùÌ2Åı#:­z7ºa!áô<Q•~¢\'R²şv§	*¾,íaŠ{É¿nÆpº^—Kæ©–¨fb¦gÂö²a™N;h”!¢DGAâù­¯¸”E3—ÉÖ\r	ªm<í½ğã+”|üìgûYçàï~Ï{Ù7Ñ{Y,Õ1Ø†WşÜíÅ/¿üôËğÍË^üôç7¼{°•ÍŒ„Œ„¤el&ìEæ5îİŠáş%ÆäŞ:v‹ÓèÎ%|®çŠhHË¬e¾ƒık‘âÏlİEEJà‚ĞC5¦ŠG×İ>tk¿ên–Àcç$^˜æşŞQ·&Q|bzr,ìaN”­fR=Ä›ĞRhªQ†@%”iÅm0™ß–’’\'èV||6ÓG‘—.€s-ÄE4Øs•YJ /ÌÙ+>Oä#ØÍj¯(÷÷ƒ¤\'ïîlÊÓâ³ÃC·ÇÛÆEsì\"ãz¬İğ|3Zzúú‚Ÿ½şåÛÅt1D×òÈßxÍ±%$vë‡Ïz+¸Ì“+]ìùŒk!Å·=†®GªíŞş~¢BàÛi{0è²Îêbı£}R‡)Û+RŸwİù\'ÍÎV¿œFœcØÆœÊH\".$íŸ7)*A¸—‹úëğ+ñ)şàfÇ£Íùzãpø\Zˆúxk»äèÃµ§d%Bw·=Eµ×Í›’AÖÔ†b‘€F‘¨C‹U)_´°È…†(Kêˆc­¦k›š$íYD{vv‰—lƒiº½Í£w Z|o	À›{ã`KƒàúE^½şéÇŒ•(ğëë¿¼øşå™±ïïa	´IØ¡SÀL´Ñçc¢ şv÷ü§~ÆªËèb\'ßV(ÛCßæZ¬Mòß‚³¸Õo—ó+‘@P@–kÀ}7Ó3kÜw½…2‚İ­nfcñ#‚ßx¬@v}ùüM\rË©¸FD5	Äúm÷ˆàİGîñ*²­’šYëÊNÓñü|Fn\Zµmv0e¼öŠÖ05oLùXèïÂàL¡ı‘35È×«%À%23\né‹[@¿JÂøÅÆxñmT ”Ö’øëÛ¸!)JO—¶ê‚-F7˜:ù´6Ù\\SNá8\nñæ%÷‚aW‡„îºµæm)Ø‰xK–oIæ½“(ÓTçÉ”…aÖdóJ\rß­TÕãäÄÎèJb&(Î&6‘¥2«XísRÑßÑòÆj×qÓô­º\\¦`ä§¦ga†J|AÇFg‚OÒ}‘‹Øeî³/ONBéÎÀ\rí¯ÕúÍw:ûoTáë½¿hÙ9Ñà¢ó/µA,nî8.ªo7Q°“‰ÆDYş1:¡¼o.¤¹«÷nô¾œV³¡*Å‘	bÀ?\\”3÷¸Jj8‹¨oüXß§]kÎézp{ÛXh)ó<a¥ã´	›çAÏuN‚DBqkuĞ@yKkS÷ìiëN\'¸çö»ÿrxx˜\'¯õX§×ûD8¬PúPL¦„Õ2ÄTzéREª‚¯“pÈ<ƒÙ€ÎÖm,…*â^uÓ\\êJ¡àÀ©SdEv@uüFÃ¬ê³ÏÔ.EGÍırÄOxÓp‘v6P£¸³/ÚÓw…r7c¯X›¯¾èI÷ùKVÔGÆNªŸN\ZEã~añ¼ªô\nœ¤8Ÿ2Ø!£÷J9†Ã‹50H¦	®˜›Õö*ÓQz“úÎ”ST}ÜRØ\'Ó11ŠßFŞ“`-½‹$ƒ”Æâ>K;ò%Ë08>Ô*˜Ï!N.Cî™5Qì.…—†ÂõA“wª?üÅ«]\\ç7Ádÿ¥DİGÊ	|	¶3ÎI?k ÏèŞ„X`øgBZMóUûZòë¢}]ÈZ|…ÿö™ÛD[c)*tS´o\Z‘a­{½ºæ‰’ç«µ›Qğ«j$ôĞÿ•H}7²¬ß¦^Îäü¿Î;\\\\ÃÎ2µ×ó…T¾ÙQùÆT®ŠÕÕî}¨&ë‹_ß¿‹=zıC]ö¡¾ØhÁ¦˜°änm;·7Åuïfp\rÿ^{ş8À.îíA°Æ,‘¼9Ö4ò”ö¾*?øWÈóä²ªİ8ìsLˆúHYÉsf>Ş¹†šü\r†‘ƒ+Ç³i™¿øH‰ğkÀ/•ãuÑ\\Ú\\¸;\\öıOæˆoıÃmÃì,9ââÙú@‚c¡— ¿ıtvˆ’S&@±yÿÁyñ×GÅ)zNÈİ]åA—|šX†~Cº©$»Dc$¸\0>äÁ¸·‚‹åtú=ô·“»rÿ–ûWîÍ|Ñ‘Kü5Pzü{%ôÓœò3;?§ú6e ÊvÒœTwpñà€ÓÀTØß·_{^ét([ÎŒhà\'J@ò`{} öJ\\\0kuÍ”nÂ|¨Óõ3AÛ4\0=ĞpIÁ:\nq·Ó+Ä›LÆê´¤yM¹é¿\"ÉMÂwD2àkên,C>\r»Åº@>-$»PÇï»»S3ıww¥ùÊë(ï‹ÃlúÒ4µÔ÷¯ÏÏ—å9\\ºxßÎ—¡óGŸ6\n(ÂQŞİE‰Ñ0Y3`S`3–CÄ“J]>xJd}x,ˆü1‹\r/SñËÎu(	oŠíàNO—–6ş¢T76y8ı•£ØF„lwwc!\ròy˜Û2Œ¾~*Ë´ÿ]R‚äÚ×ÛV“şU¢•Fœ¸»7J$Œ8»}VŠÉ\'\"©º6N#o\"W‘ğõªººÀ^åßî_Üıås²GcKDÌiwöœ™áfB5ë››—òæ\ré˜T“½‚¢¤Eí29‹ÊxQÜÚo3ôŠt½ÍÔd&İh\'|:àœ ´Yâ9	c“ÈÍjƒwE1‡$\r\n±\"ÕÕ>R‚´q0–ä)<Ği‰©W£Õ%[DĞ˜íŠ!ŠÑB÷0’‚ÁM\0‚Y©Y¡³îI\r™c-²Ÿ‘IkÆÖv«@ÀHT!`È¿{óÃ÷iv¾iÖáoÄÿ`\'.äWĞJ¹ä[\ZrÂÙCYã²©=ø}w‡ÿö¨ÿ~]a¿µ¤Éözäùê©wi¢Ë[z,¦ÑthfİËÃ¾ÆĞœ\'›–ç¬é¶&hø‹›ÿÍçkr\r>İ\\ÍøÇùr®o1¦±A©%UÅ&¤<Géê£šWëÍÙ	Ò)Ï_\\/ÚÙ¾}»úôI¶ô@îØwè(¶óöí)ú0\röãæ£íÁuœÇšä}Û›rá¦›º×ë}òqÓ¥¯Wp`ÑÖÙrtNøÚl=ª!²`¹ß—¨qƒ¡‚æ­ç?ı (ûöÅl<ÓƒŒ•ÁR¬jSE¬:«¤N£Ğl´¥û×u¢‡àxA÷¤(\nÊ[OHê)›?NçpsÁ~²^>E• \'´’OÕÖ!\0°°•‡8­Å£\'¬ÎùöôÛ	è¤›Bi„ü¦W*ÿŠ™Æ{æí£%\ZLÓEÓ†¾\"1/Gÿ}óÕ^ëù¼õãOo`2è\"µ··§ƒø\0³8ü0_^Âvm®ÈˆÍî?0\0Cèµ^¾@ 0Æ/E‘˜}#Ğ-²)U¢W‰Ï„\Z%±·pMw×µoâcûÃÑgIb—ÛÙ¤zÀ%QC4Æ>¦`l{£ü671f¨èYµ\\­ÉZ¢së0ÔÚPhAq9¤™Ê@+””‹q¥ë¬J¢Mï\"rëº4ÆVÈ]™HÃÙs§Å¹øa´¼Ü,H»ô{EÛzOŞö›Á>}(Ø+v€à³2j!\n3Q=ù®©9#ÔÆt>ëşğ£‰(3:Ïñ4Í¬ÀIĞŠĞÕçb-o\rw‡ß©s‘\rG–à?êT/Ğ½ƒ¸€Ü+ ÉÍ`ğ\'tHDÁ¢’\"Kà(&°\nHô0ÎòªĞSãªlqÕ>\"Ï¯\n·×À¡…HØ+rÇaYu’Œ–¼|(7Ùj”á“hôüÉ.`^¥<º›S*„ÃnO¾wÔÀ8kÿÜ—	€`J+ÉôñEXÄA‚]™>ûº»bç—åMëö	)Cb$‹³ç¯@f~‚GÓ\'š!¼Q«·2ZrÍ&QM(i(æH	\Z—ÃêWìœn·¢¦Æó¢ù»8B|×·†´âxó0nfÕßùt}I¹øZ½„$RÅ:úÒ†Oñˆ\\jØ=Ü/¤÷|Á]#\re‰Föäf3¾´~4ˆb8¿åÆŸ»r(<áşvPri@üëÆÙd’ùBçÓ³‹a\nLöo8îpû	²ûcçSÖø·ÔDÿóŠõªÕÕÏÜ¬èqnó`ô¿áğÂY}¬İÅÿÀè¾¦Vé¥+qÓØøJ-|CîotïåuŒÉã–vµ„Á¨p8µÇ7mİµ”‹?Qu} /e\nR¦¥ŒYÇ\'\ZAOËy¿¤IÇX¦æø\0W2šş°›drYïªªÄnñıÉ<ğ.y#ÕAh·Bî(V²’ë§ÓÔšmãÌ<˜è@Dı%B\\¿(‚KÆşşö\0ô\rÅkÑ<šöæh„I\nÑ¹×9üâşæXñŸÌ ”½w±RYQ{çæ=ZU-ÅpâÉK÷÷‘\\LGcŞË9k/K.\"„—Ô«$•ˆÚŠ§N›¬Í\r_˜V®NÈ1nnµ¶÷V1±NÃdJÜË\r={]¢§«Î­Ëvzq™¼a?ê›pšT°BÂV†}3Iú4°A]cY¯4co\Z,÷MÑBé£Y¿ã”K>\\º¯ŞÌ“ú6(Ç]i±¹,0©ÁóS‘p¨fPLSFèGCsxôÈI‹á†PéØæOª\n&¶Œ#+AIr\0.B¡(‡û<PÑF®[&Õ¼”/Êñåéüº´İßjQ4Ì„…¢İ¡£Ñ£ü¢‚Ëò~ ¨îäøY^¡®ßQ¾.ñ_ŞÒ\0êÎ±*ê›~ıË‹¯!óõ‹ï_<{CóŒ¶TmRò …Ä^\'æZ%>Î‚U}îô­R‹ª^ÚT7…Ì’p\'6a×­-lBİ…¼¹9t¥Wø¯£“AÔifÒ{{æµËyÙiñ^QH•!†$ÍÏ†X—îBí,;hÈ_`¬,•Ôñ‹Â¨\r]2j(-éŒl¡\nYğø\"FÂ¡Yw-(ÃÇN\nı×¨ïıcïH_Ï\"|À´—ÏyBOqx#\nCäâë8›*&p#Õ¿æ&l‡\n@_Ú0^­¨ì†i5Cßnq”Ä(qa£8R~B’ÎûÔ±ü+ô!+ÂC	£—E¼«‹•·’!dIp7šáIÃe#	?Ö`]³Ñš‚š“â¬a¼êä½}«AÒtL}ëœÖ÷qŒäc¯i/Ÿ\'~Öİb$‰¬£z\"qFñİ&8tá´Nx‡L@%_{kÀèiàéš9^LÃm…J!õàU“	ìXBóı}ş {G|WpĞ})ÖjZÑ|ÃÉ·$96´%ñN‡ÿ7ó9*bi\0}‘ÿKuUéà#Š6ù¶éoİ÷m˜õ´{ÄÒ’ÉØ@€\"sëKA%Ï•BY¨AÓÖ(ÂOÏs™g…öŞ½}»ê½iÕ‡´»?t`Ï³NN=‡ºbaÔH$ \rÉ~º¶í?:Ï³ıÑÕb™ÔO(õï›ù:H~BÉÓ0ñ)%c\"ª+]Ì?Ä¢Íª\n$˜ÖHÎÌp.‹ÈF,%€f<r °H¢ôÑUk}(ñm\0xWÌ£Ç\"1N}@‚ÆES\n·ìttSdMsU—áşŠÍü_èÕlq°Èèü ¢¡pÃ/VåîSˆùµUIÒ±) wg*É‡|¡TÌî›¢Î{\nL!†Ü¤¹Ü xZîßmƒc\\X=ºë¯Ú×¬äÖ‡u®Ë¤8B\0k€êñ†c¶‚nıîx;ÃíñätÙzô²<rg:kæh·Â~[Ö_\n8¸íÆ–ÇCÁ{Œ&±\rÎ¹C™\r…Ø¨m2\0ú«…p*~^;}g.2\"ı4j)_K}Ù[m¦ëÔÍbf*„aÑHÚû6û…RÜVÔ¦5×ÚœS|VYùÎo4Å´ıä|:_<ÍE€ïÜ„~âü¯òÑ3/“e2ÑãøaIæ\"õèã;+×óû:«ê\ná“ï¥Xgúö~“ÖRÊÜ\nùd¢Eüú4„Œfã4®ú˜µä:ÉÕ$èÿÄ%å¦­„€ÅİÌHùYuÊf¼¸ódÕÂù:`–òî#oõM#tÇøØÔ!İ@QD6íEã=peaEiq)Ê¡NHmobÈ®˜1F\\–Ùb®W·Î§Ã\nòÙ˜Jû·ÈLš[2~­w8S™1Ëîq¤ğEõ¸°/%…­Î¯¿é-å‹ÄJbDïIG0¥«¸˜G\'K (Ò#O©ÌaÕ{¤@çE:Ş¤][NÏ„Èz|š©Aûá Á(<×ƒt&jÓŞ¨m+ıi†h6²Û%¾Ù>ğ2Ä KŞŠl‰\\®ÒáõˆÓv_ÂXw5ç_dAlàH›İXİ¹à1ŸvU§rádM\nÅdzêş¾·=æ¥™Ÿ¾#-t´y1vÉâ-İ)ë` ˜†2w1wFĞåvv€U²³÷Ô—êÌ0PŒ:]ï+ìq;H¦ª|¸Ï7t²H“7Ñ»;ş”MÓİÑ9²§4/ß=H²z¢	‚¿t°ïïÓ¯¹ø´~_ã 0;´×r†KEbĞr‰L$k\0gşá•˜€›z|Á€âXR\\-KqãXG¯¶Â–«±LXğ LÓ_ë•¾„&XTŸwæ»v[ëÚ6Ã§)€ïş£ã·oß~òöúğ°ûöúèìíõÏàÇ¿œ½İ&ğï—˜ƒ>‡ÿxG<ıœşıâíæñáá¸KÎğßÇ¢Çôñå!}|	gåş{v†IğçìXg2€ìßfoOa(¬J÷vM?QïíŒ~¢ÎŞÛ3úy†?—ô•ø>¡_Ÿ`â[ú	x\\ÑıØN¹ˆ5Å‘\0I¬Y£y8Vş*û„®ÕëJæî[\n Îô†káoœëÚ‹Ê{mI`õˆ¸C˜z|åÄª0Ì\r®v†õ²ƒ«Şøb´|ÔêëuûĞx)<ú²Óé­È³e÷ó§Wø³×«!Ÿ¡¡sHª@r ^\0E~F/RËYÿQû«~ûø?ûo}õû“ƒN¿óÊ0½}ä?í@J¿ıvòi§ódÿ§&¾ÅüM•~ßîá¯GùP¬6ÿ}S.oRf›d}G»ä½x ²QòŒ…ÛR$[5ø»İin©¥;-CëEÑâï M¾ræ˜ı,³RP$0Ìœ”ã@$nµ¡8/hÈbß£·xç_î>hAävÍ.ëxFaÚª}Ë¿ÎQ¬¿F@k=³¤=ŒÆX p(¶Âx®ìâñÑÉİ#™¾;\ZÔBÓ…~Fsw)òYX„_+à¦.ÙŸ³ZîßqšöÅ‰ƒäŞ‰%ëË†]´NÜ+´O€?Ê¾Â´>ü8À49ÔÒş>ı	bé¡u»OY®W—‘XDû‰˜»T,e)¼\\”§‘ã÷ğË;^¾UIñ:±„´UÈ[Ùs>Şˆ;BQc\Zc<ºpÔ´,$®òXñ‘ã*œQªš§ğ¡°e¶5„]õİådYb>q5üçß=H“ª\n†qAC%\\ÕGfšZ£ÉÄtÚfwñÊÆÎ;‡×É±HİÓ—ñÀ0\Z7O•Ä] aÌŠ­MYAÜØ°WÔ1åş{v’¾u#ÚêpÓaşöúñÿ9ƒ>;ÅïÏáŸ/0ñ‹şù?ÿH9<ƒÛœ,ß>5áï‹oñÏ·ßò\'ü<>üüüçO˜şâ‹/ù—>üŒÿğ×Ñ·\'™øàóT:mïˆTp°J•Ù¹¸¨äUòò¯¾0«à?ÑZœ×g+ÄÕØÏh9¥\'4ÔNŞ×şğgFïÿ·PD:T]s_2\"ş6á¶¹lzşLùxäøâQÄ}{2¶‡d,Nßİ±±Le¹EŠs˜RÖo}òè	9¥Ö1Õª Z¤Î±«(ZÜÒ§ø>kĞz1[mPB=»QC\0oDä¨m§5-G“¶àì­—ÏsÃÑ9ÄhyÀ,õ`r=*È–¹uÁø\\5r¤\"°;3\"(ÜÑ»;<_¿‚yÄ£{àKuß»¥3-y\r%mí÷¾5«¾¤I=>Yó™’œš·J¡Á)î¨“¦VRÑ(¿\"®¥ß€üó¸Î³¥Á×HØª.8Îç©åè×’#DáZo{Äu |¹I’‹OŒı„TŸDí8‡è:½à¶QÆG©ßÀÿ:_^Mçšıo§ÃÁAğ\rĞ7\\ÅØâB¶Ÿ|eå§óó\rï0´HëŒ¬%¤Ñm´ş¾ÇDÎ{œãİ»î²{µ9½ªÖÙ‰1‹‡_ãK…½Ea¨ÖªƒĞ˜óË²\\Ë™(×üZ¥KÎÖ:aåÈ¸âõ‡£*.6ë¢NØ.§“g!¹o£OàDÚÔùŒŠd¼sºY¯1*Y\"_´F°È$Ç\\·Y{PàäH	I´Ğ}^Ğï °s	Ï&>¼öê£ÚájX©ÒH‚«å¸üiÒŞ’Úâ…Ö§Á	Èì]çÀ•¯9­6àAåNñ1ë³@\"DxGv´m@mÁÑï«™	İG1InwÎ\ZÅó P	 CÄANshÿ0Z]òk2\nØãmÃØë*¬ù\"¦‰ ¯óó\"U„·¹\0¹CŸÎWåwì©_èõéè½¥I Ü@•æ7Üê=cÛ2…‘©±o3B4ôõÊ;Àøœ{¯ª™¯bÏæ!5Nıh¯‚›E²w×]ª®n=§›­Gç}ÍŒO\rì¸î(ºüÕ­•¶Ìà|ˆÈ‰Kúq@š‡Ã1jÅN‡CÔş5©8ëÍ¯×LÆ\r’¯LáÇdÎ´–é	ëØÂ„¯nfë‹I/åš™ÿ\rf½4ãöNw–¼0Ğ<+§µ€0æ07Â)àìì\Z ×7ƒñØl	ñny5äÈõ¡z·>©&ÚÌk>¯h]¥F.Ái->ìL2Ú”Ü9Ö£”ßt³4aOã¤JGN1Ã}Œô’’©éˆ3.í½óHr$’p¾ê±ªÚ[¤ç\Z¹fËKŠp;‚»;)ªn);MçÅ=òßö\'ÁêLæˆı­GäÌ³‰ğqÌNÂ±QÀ—ÆÇf1Âğñ?LÌviÔù\rÚ[æ¡HkR¡­~è•ù¯?·}>0–sk	\0@–=Ş\njÏNx Z%Ø=kOjµPp±_	İL[Ñ÷p İó™j-: 9zÓ_fùñqŠäÇ–\0PH?ËJ¯wÁ‡ÍóZiŒìü¸\'\"C±J‰U…ñÀE»®–yQ ²5¢×Gyvä<v Sü€’¶+¸ŸñÑuûñaŞ~ß»éNz7G;ùÑá¡8$kC:ĞµŞ5¤çèÑ‚aÈ}zt¼”ÚÑ£¯%}vÓ°3ğ¬i ;a«\n»™âGm1Ë`’`§šİ?ÒSUïçŸ^¿|óò//†/üöå/ßü‡¨©£\"(;îÜÍi9İ1Ã_ámÂºèê6¸àôÅˆ-z7O°;:ŸiÛ²±p#¡DgÂ3Ê‰î	qXÏæK<¤¶ñk-ºã§dg #·OÇ\0Éæ´ImçBÕÏ´§k^ƒ%¬¡øÜ;–\"c0‘¨S±™±P±\n©±ƒVii•%ÊM…ŒÒ±ñ¨³„:Ğ44VòNñ!$õ§“ 	0<2bpßS6GT¿ñïbSìˆ3Â.ÿ] ñ‰Œ÷äW©&ä~WBY6DÿhŠÑñçÂ„şX6hQ¸\rWÎBœ(ŠæaÂp\0Sa®F’6Ø.›ƒöøò‘ï¯İ(@qõäNş*é—UÅ2ø+µ©›1³ <Ğ¶ÃcæPCÿ+Ã )¯ñÛÆAz˜ÛcûÈ÷¿Ô#qøè!aÛ˜\'\Z›ëá½>Aé·:mòE¥?Çw f`†ätw³*—Ã)WøR=Z”rKaÜC™úhúoå\rú0È @ö1w•{.;Ão“’4%†õùOjå©ùÁ	Ÿº•H©îÃ,h¾G¦Ïâ°—Iº3Ø\n/¤[iŠ\rT•»ÃÙ¾‰#ÂŞÿ¶¯êÖ3ÙeyƒQ}Eîú %gIŒ•‘¢Ğ!xÉwÄ!z¹Ro\0L“,®Ø@ ù%ÅğÊ*Š!ìË+Ü/Ñ=\"MDR³·Õ#ÃÒ»¸ö+ê8©úïí.Ş×ÃEÉ?}Œ&ï6+\Z–ƒ“ÅX±ÉN›ƒæÇ=¸$¯í®Ö›¦%d\\y<Á§ë[0ºså‡¦µrZ}f½]ÃÆPÇÏd^+Ÿ‹È¯–Q8U6ßƒ µ˜¸+H\0”‰È›˜?bw`)ÙÿÅh9YÌ+±ğVÉ¹Ë(Ü/œÂùKÒ<wÛğğôÆğÀ»çZûÙe•…UæŒ!Ô0ãXô†¼ïÙ7Rí¾(İ‚+\'qî@\nO§|.\0*±àÈP`H\'O˜rÔy>¦ØAîëéqv5\"ƒâ\0&ÿŞxF*´óJM%¤›x{5²WbOÜ«V¿ WªoˆÔúÈhã‹9PÄvJ#G¬(Ó	V¸(4HOL3•\"©º°©Hï``ö,\'[Ãa¤¯É; êÌ\"¢6Fd}äËá‹|ëÒÊ\'kI|Uô¬ñUIó¹{$¿¼ …t.æÓI¹üKµªˆ?¬åh VÆ+–UbÅsÂ‡Q…ïUß‡=¢Qšúñ“k×€óå‰­Ù\"˜˜Ü™´í¦ÛÕÊvÒÓÛó–¯ˆNéÎªóÍŸ¦Ÿ‘ËtAçóÙûİtÊ\ZˆããœvÇ<ÍmP¥üÙO^»ã9D™¯@•W»ínpáXÂ”Şf†nHN\\-€|GQìJÄ™ñ’øümxaú¤l…Iİ…0ëÛùò&Ud—R …¶Q¹\\Ü]1Ğx()¸Z&/å¡]6`°Æ›¹_¾äÇ‹e\Ze’\nÄ\n%¶\n`ÍK¤·¡Ù;‘`ëJŒÔWbfC©R¦oIJ#‚¦_üë× ©ñ$a\Zë¥ÎöĞŠØ¼S&.¤‚	ªÆÄŠ×›rOnı’lÙkTJ¿%†Qên‰;1QØ•4Yv80‘‹ÂêPÚSŒíØätn}íæRÄ¶;GPÆêÏœFÒáx\"›Ä€x‰OôÌF”úÂÒíïó#Ağúñ1«»S€ë@ù*6OR2Ô@àdÌzĞX;sHre7¥øĞ\Z5æÆißÆ®ÔLùkW¸œşòåàºÀ<´úU¥+·}øV,ƒôfcÏÈ³ëNd¸èçÖ6–*rI<®£°§¼\'ŒËJØéü F±±Ñ4u#Á.‰nôqÏÑå!‹é(»úÿJÒÈß¤}÷Ï•ç«½J”¨í9Ü¦=kÙI¬!Æîò{ÄÅju\\t\0¶É ÆÁDÂLD¨&–ÿ{*UüºÆåá.Uø\0ö0ŸulXìˆ>Ñw©›g7E­òLX>?·Ñg‰9\nÜä>«æŒt‘Ä¹8KõôÌthÏ®%Ë¶™£ö-ÉC‚Õ3pŸ9p}pğö©MÏÃ‰íTpm&ìv[osŠà–8EƒêY6°V?Ö[j†j½<A(ÔÙKB©#—6ÃÍEpi)\rXYÚø…Ş£‡—Á…iGÁ¥œ*EjAå&•˜æû·ÁSPå¿ĞÅÈZ£mÊôZ2}å a¥ˆU	2 .³ş)-š:‘â»vpæË”¼F¸Ú«XÑ+©Èíï×Ò«{çvõ¡Â§¸K1ÂÙ,²~#Qg&€¼unc­š-ŸˆZùˆ÷+%RôLµtg›Ê(‡¾§34Úîİ]\\N³¾{piŠ¤Ú\\Œi©ƒ=\"SÂ0Ğ3	…ÏÍ„%Ö\Zòû£˜ìÒa/hOŞ-\"	b¼4d)…˜±3aù¸l»4İ•?5-*ÌĞæ§õË(mfÓz`úDÎú¸ª‘^œÓÜığÖT+‘~´­ÉMbÚYNîîöj…ı“úí¯/>Rİ^ĞFºKpAHâVcÛB7w/ynÆ¥½Ü˜7Q9cÈ÷™ªJóm×5´İİûÇùòŠ_½ìcÄLSwû7BÙãÑ´4~²½}ÜñÛ^şöÑï÷şğÿ¼ıÏı·Ÿú·Ûbø_ÿÍM3ëÙè¸ûöøíÉÛöÛÎ‰Ôù¼ÖA-é?ß®>½ƒÿşÀpví5ÉÒrh]`ÍĞHöË|~¹Y¸ïŠ/uvÚV\næ“{n¦”w(¯ÇÓÍ¤|ù|E~Ë½¬Ó±è‘TÆSB1§ƒ,ò=:Ø_pæ¹¤QìZ²ÑGËÑuuµ¹âÅ³ù¨Üùj¾\\Ïgb—M\n„§£*¥	‘?0CÒaÉ&I>¦EÒÃ›jRxûv‚\'—ïåNrSKH*¸c¦“c=IÀJ=Æ+¨×˜×aop5a“L¨I6tÄĞâÜõ¹Î#qîëX¤ë2‰­~6\Z_$XÚœ¦‚/t<Œ‰`åVÁ/ôq59QÚ&Ğn\0¢§Ÿ‚ƒ  Œ™‘1‡0¦âÇiÔİ„ÕÇL^‡ªØ®¸WMP\rÁ?x <…©ÊÂ-ŞUúGy…nDU2”£\r\rºÅƒ¢}©ÖË÷Å™ĞôÜèP<Î{œ]Í\\ŒŞSH$¿»[o3lÿm–Ã¯jÂ¡í·‰ÉßfÒ£·™¨S¹‘óhO\nô<Áúá”·æã£ÓlÈŞ]îî0ı?éøß½+ïŞ=Y{M·wïìs\0#\rº¦ùéÃìgîõM{}üîİ‰“”q™cJ<!K’D:?ár—‰ûh–©—¥•1sÁ¡£ª&Ñ½\'‰ğ-\'6µ¦èäÍ%>šƒBA8a\\ªi1\'©‘ë*HN>We9ÓßDŸé…@;%¯èvÛ[7û²Ød¢dgÜ›ZgÉ[÷º·½qUşŞÍÇ{­lt¡·u3œuMİ‘Ü‹æãà`]ÈÚNŞªêvó£ÎÀ[3cc*-T\"Œ°BºÚb ›N¿W[8<™-·8³Û‡ÎÎX…7èD’d›Ö@Ë\"ªÊ¯ã ˆ’4â´CÛìi qX­¶¦áşñhSMŠ)â?	´\"L:Ö\"\'Ò½T–†<Ùk×Æ•„´Ôq4lƒë¦½v2ğq0erëY­W5İ/S“]iHycí¥îµsá&2¸t¯€Ì |=Ò\n¬]‹eÅæœŞÉ%o¼.EÒ	Š%ä¹¨vRç\0€ÈB($ShX­s1m¡æÕ=M˜¸­´\"iØ”÷œÒ+2,EL¨€ªQcFËÒ™pë‹ßá¦Øe¸»Û°XN3Şï%ã=g¨ƒ¬DvÓòA/ÛT=ĞÆ¦aE“ÎP²¼$ØÑd »å(~\08š–”ÆÑo‡>Ö\Z{í9Ù†¦òñüÅ„?¡EÍ4•×ç³3 •¢w˜›uêHË, ÇdÌ£G9öŠ6#‹‘ëx¨±óíNØ#¿ì¾¼„.^^>™Á?Ø1vÖçQ‹#2nF„j—¨Ÿ:ßÂs×WˆıhóüÛøw+šaµç¸\rÉP§‡šÍÄÑ™-Ë)U“<ÔÔ‘ê[RÒT¯©È>ï¾¤¶tÍ®#a­r=E£šh÷MÕh®@šaëe¤Ãx|b­ÊÅ)È£·«Gçâ[&fY®—\"YsuæE9íøğÄ±£>ÙRù::AU>Ÿlw\\€†I&¥¿	kñSêwä&÷5	6u8ì‹=jº“¸¿B•Eì:]Ñ×Ó_¼~Mâòã_¶…®&ªOlY9ÇyQ™ƒ]˜ç½×déWêR•T¾×¡%î‡ó¡¾(Å‹n{ö¯/ŞdÎ8«½ß×^%#äÃ¨%£2â5UgÈ\rÛ=êÖ\'+,Øq‚Q˜[÷Œ\\5­˜ï«Ÿz.JÿîÀµŸfÏË«ÑìÕX`\n·ªç\\!ËXlê|7ı¼¤‹İã/òÑæºšV#HÂe¹µ†t\nVÒ·¶Ñˆ²@8Y\ZÃª:#•fÎœÑı<…q ¼R€6{,ñ\'ËjjÕbp°V}V{ŠxÖíŠâ)qÖRˆ?ĞÁÄahWïØİyÖÖçıôæãëÒl2³¡\"¡Ù²ÿòh…WçJ¦ÜButóœ`óóàVFÈÑfŸl¹iİX±_”³ZÛä‡2DõÆ÷2|%øxšRµo³‘Ú°-wì\'ék‹ìÀ3Üş½ïFÑwP#+—˜bÑàı*;æï\'fÌí$fÛ‡ìŒÔ¶`òuÿZìŞ<5Š&¬Á2-8Æûâ¨š13g…ú.±¾BmW’^†bŞi…OÈD_˜K¤<“¸\"A]Î?¬J5BÑÇlQBƒ½º¦UƒÔëÂ’XıM\Z	b#¼¬Îå§cÛô›¦ƒ¢ÒÏ•Mÿa¤Âa1‹1çûpUşkáŠXµÚš^lMoÕ˜0>—‘¶;ÍJÁ˜Ñr—«tåÁD•n\Z‚jË4E\'D}Š±ş««gÔ_÷Z^•­?ŠŠ)\ZNŠšÖˆB‘:y´	¹‡ëøHuÈóL™Øe7T}çuòJ‡ºT$^ŞèÛ$â‚mŒFûä¬7oš¡*Yà×Ö¿Ù-)¢TÓ\"Qv]ŒV]Fæ,ßsª>ß(z·Ô¥¶}›)¬¤Ê;gväæl´O7ÕtBš¡f¸=KiD¹‡şõÖÊ~!Šˆ54|__¢®+„Ê‰ÈèØ~~‡%œ êb~ìæ¦n„ *ıÆa[²|¨BÔ-8©¨©‚}ªD½‰\n»%«·½½c~gÈœ YL\\	:Ñxf³Nû‰V¾ğòÃ<i$¡\n‡@!»^.©*ÛVŒhc[´Üœ¯á&Zô¨&ƒ:r³ö)¾ÈúSCÈ\rBàãÍr5_d«®ŠNÔ$şÃ­F\'kSTÏ€ˆDQ©\'VÉÙ¾Ÿwl±}€™å9œ4ã7çëÊš~Å½ûô±Èõíá€ŞµbùáÂsDhÛ—9yf<é4„‹¥iŒ{h¦û·¬m–Î×ÙvkôäQÏhĞ¤™+t:YïuéuG“÷<iÚ%JhÊˆ6¡/jx´m–ÿdm½ôê™`\0u³áÈ™O0ß¢¶,§Âäõ|ÌæÌ/æ›éä;8½„…úiöŒ•ÖÜ6õUM–8§][“ú¬[”ÚÒÃ¦Lêkè-ö¾i0b6šÛbÑr7Í@J¿¯ÕMªFµùòåÚ¥·JoòàgôŠB¬§¡ {eBõ+\"uí7=T%¥]\'¸Z\'Ğ€‚+s YéGÔĞKC•ı\0¤Ã–ty>ß:·MäÎ\" „¤jy€§–‰Tœ¼ÀCÓØy ‚™RîG9°ÃÍx6B­¬¶h¼]°Æ¢œmU¤jü|c†¢{¤âôıı=@¨êë\n¦za	‰´‰_eO¢ğ€ìJ%8eåWï†MMôóú xü¹ûZ±m…œiÿ€şZ¸vJû’.‚É_â¥të§;\\4cÓóìX\n¿ù4G(†•³Î5±ëì™˜_†åò)},bù>•Û<¿<£•7ÊÁØ¨¹T$WŞ@·_–é«i®óTŸ¦øÁ4ì˜³>ğ,vM¼¾Èe&¶Î®6²‘9¨#è‹\\?›Ÿe¹™¤­k¾y}G_D½àfÄ»@¥	Çfˆégª4Zşıà€BMl…¥¤9Qğ£¼v¶ôÂønó#>Lş¨‘~ù5€—¸ğ›o´^/WE#\\f¶|q˜A£-¿ë—\Zé-ÁÖ‘ Pb¨BİSÜ/uaE[4Ìƒ\nÛp\0QvÛavî:ÒI‡yó8\0˜ÓÚ	®zMyWœµFŞ°ì\"–ú³ş¼åH›¶=¹µ§™Ø¥ªÃLòçeÀ\0PÓ£¬AüËèÃÏ—Aro¼^¢Rúİ~àŠ¹¸yü›ß~ƒ­¨¤×‰ˆŠ:)Xóón©İ#œR8=q¹bş²Q¢µêê¤éE:â{µÂÃ~˜)	…$¨é:e0|¦ÒÈæ{”ƒ•Rmç$yhë¹Ñ÷Šœjí8‡‹\"ªĞ¹\rœ<˜ĞNæÃ8\0<Å:ªkåMŠ>”,)ÿSQ•G˜\n4î¢\"!§ÍõD4ø•zĞaå7ì¬(ç¶Á9f Ó¥ä9ÄU›yù \r™5ÿ~>¾äÖI OY)?z›«Ä„„²1rĞ¡œx¹ ƒkGMYOLt	]J†¯ÊZ1œı(ôšØÕXk\0*\'}àVÎqQ‹~ˆÑa$Ú\n—×uVijä¨Ìÿ?¡	½;§¨T|åÏ(0 Âeï²r­·6ƒÂç0İÜ¿\Z‘ÎŠİ&ã“Ï­h=õ›ñÀÅ…Ú’×EÕsi¸ëËc[ÊÇdı<ô¯0XÅ\ZªKV$Ô#A)ät,¡±’uºJxqj£Ñ·cÇA\Zí./w ñ9DÒ€õ©\Z=Ô|W­Ös”\nx³…ç/¾ıúÏß¿é¿œ¡ôæ&ÿùÏ¯¿{ıæë7/úŸåß}ıú»gß}ıã¿¾è?Îşéûï_şø¯ı#t	×¾àãHÊU‰´£Z]ñ·4näEš_sf]•¢(‰ªáÁúÊEˆĞ\\P§‘Ï[óÙô¦%iğ1æPŒIhò~ïúP¸_ä$G+È¬°W>)ğ´0Ü,íïgxƒx\róYOü».@½vÍûæR aOİ|ÚÂè~ì8Ç)îƒ‹2À~ÅSş¶€KXQ—œÙAbÙ‰¼øyy@zœ` ó.¼œ0Vö«ù€¡z(ÉÎ\Z¨êîæ–qu@BK ›@éÚM@óÇ‡,Ï ï’Š»ÍñMöŒ¦ ¼‘r;¹tI¡s‹¢®òó–¿óÕ‡Ê:í¹ß¨ŸOä#»nÙp´E‘Äu{—}n{Ã]Š9	ö%¹€%¾& “cÅ¸Z°¹w¶·ÍC\'¬âƒbV”ÿÀ³‹çÿ‰Ù­QQGMˆ±Oeì…»mÈ_hf,DíÚ4+ì·-G\"³``8¥BYÏ`©‚%ÅûÔÜ,*ƒ$ac„ûü«—DãşGVå\"l”§ïAófw\0r\\¯È¿x„´D”»wB‰AÉlo‚£ëîbs& TĞqKXÛµåÖI!óc[µv÷_Dç¡#Yñ¿.‹v¹¿Éz‚v¿v/Q³A¾İ÷m™ÚYUß“…[Ú[\":v§ĞfmDœHüN°W‰`H²Øıà\0¾¥xvM4“Úb˜}ú—ˆ¶ˆñ^ˆ\ZF$£¤t²æÀc1\"Ç„ Fz‡ëHÀT(ı#s\rœá€<a5ü»¿ÿjø²#¬–íùØ¾ÿg#1º“;s	yxP±¼½QNò£©¹VlôóØprqŞQş˜ªÿŸõ?3,‡xäŒîè¤¹IÃK…_ß”p¡D%o¯ÁEiÆM!úñÉNŒ»;É%(Òñú\"ç\\‡ÇËA‹|¾º¬ĞŠEÚrÕQ@ä©ú››+o\"Á}Úé7œvùDydË\0 IºXõ7\0W*ùº[ÆMñJÌµùcI^xÚe9ÿi_øùå\n(ÕÕæ\nKI±Ä/))¹ÅÑáá¡0M:”Y“keîÇòÚÍ^[\nÒVÃRªb¨xªóï`&NôÆ«t“k´Ÿ«y\'$J©0a†_k]lå¤Wä\0UEw \nÁoÆFn§Û\rÁrgwAæÑÜ•eBY.ˆ*Àš„¾ŸB_ê)Ğ¸Jgê²š/áÊ_$°ögÉc–|Š]èÜRG4ÍÍ):0s˜ì¤oMÄ7\"&3ußy—3Iˆ‚¼b§ğå²çêĞé\'ZòüîOš¸lš¤a\'wµjR´_y\'õ½á–êås˜ÅHyßˆ˜Ÿ“©éã’w8‘¸g†26RÄjâ\'è¹íP@?ªÉ H!Ğê=­±u .²(svZ^ŒŞW¨Ú9Z\\,ç³u÷t´ªÆV‰ËêûUç*Ë®¦tiûıÑ©yÅ%ë\"): \'å¸…œÉîÒÈ²¢~¨ëô,VÅâCÈkd»@]ÁvqaåõoW\"¨ÿVRHKÂ7Hì28µ©ism“â\rÄc†@î~Ñâ	~’ w´¡Ë/M>DO(‹\r#nIœ£Ø\'¡Ëu Ğu»ğ¯cã®ìD}—™@U*3ÃiÕ\"İ’©¶ÄB¾1)¿:vQ«R@N\Zæî$V‘|uŸ\nˆPºèn@;X­Şş>ĞQJ‡Ôğì´ój©uÏ²Œ}9óÜæªiØ¨1ªœI³¡Ş3¬M!ñÑË®´Ác\"Z·!yP	5c±Óğ ÉÁŠ)G×4\'MÄ;Ò•g¬î|ÖUì¨?No_ªù°9C&Ÿè}tê=É6Í¾\r„•ÇÑÔ#´Bnûg~|n~–^]Tgô0İ„	NùØÒüéâ7<¨sd_{îÆû€ÜSö÷ŸĞ;ÁâšÇŸ{¨‡Sö¾ğş.Õ=\n5—ˆâQ‡& \Z_ùÇytÛ FlYVî#UŸ(,eSà .WİDSĞ=uÃ÷?•ZøÚÆW\\ªaŸrU»0o@¦$‰RxåèªÇªf½rO*üÄÓ¦J/}Dà¾ü\ZUidÑ¶6Ö“£«-Ûè«lx:Í.9¦uu¦éZ„h&·µÅnÚaî\r<l`šºyMq°À’-cjùLI»|ò!¢g<U…°2¹Î™°Z:RÇßÂ>–“×óåz¼Yÿ0šÎï»Ã¯¤0YÃ4P&±Šh e:÷·°H3€Íâê›y£jº}<>+÷o§åÙº”/«óü»Y #Ô@:ÚŞsIi˜áèÖro)½Æ4ï5÷B^ºõ´Fl¿ \rÊLŒ&“¦Ñ­áÓš•HN´ÆóˆeµÀ:5¥‹	äY_áíÔvVâ¦ni•¢ÂF¼<H>ñÍ7•4=lw¶~J±*â‰D4ÁgÈ\\‘äË”‡—ë•ucşõùù²<>›ãIóG„‘uÔ×Äp1_UUr®?f¨éŸ¥úi¶uz7Qz7İ/É*ƒVó§YØéœ\rÉËÉpf-.Ñ–@^øÎ\rp_5€¹aùwÉàP…3h³¾îîğ_š‹E8wèâİOÔê#&v*€…ô§ûyŞıÜÅİ\\ÒÄ†„3Â•½ëş¹áÏW±kú°\núSş§ªW/İú;•ËoQC.‚Ö8i(İÈK’i›%©Sb[ŞÅºôÛl‰d+*Pô9öàº×v¢<dËN5ÛA‰zjvû†‹j->Wİ÷Ç¨oŞÇ3G®dÍUWm7Øâ\"~ÇÎÜsE–C™‰yšgì~ …œd\'õKÃÏZt«‚±Ñ„1êºS3¢>5¢×@îøªh p5OZXXA¼{\'L\'&¢-‘7×`ù`¦¬×çØ&gÔ²mTÁåñ+İ›ù|º®Ğ5±ÁvÔ‰À?\ZvaÓfññŞü¹AU!ùµëĞİ?5õÎà†úìb´|†”&~LKAO¶o\ZË«ÕP™ÇV`÷Œ‚Wı)D±ß•ÔT\r¤ÃRŸ·8‰ø(ÓùDÄ²x9Ó%®«=˜;tÓóõß(Wãr\n’‡Iö¼¶PêRWam, ®HŒ×u0ğØƒ+4ÈZÆŠ—MxŠı”ì¯0¼f,İX\\ŒN—Õ]huİñêV¬A¢ªw2/Ø ö*ƒ–?´JK¡´.Êé¢ˆ}([®µ€Aô²A×ÙÎ¾Êh2JcïIsÀ.=œp5«a‡®üT¥xD!Ù$ã5„¼zıÓ=¶=ªÎnhÕ;Ûq¤$ÊÓÒÃ!şù——¹”‡ÃØ+m›\r§VÃ	}dØbŸNÒÄ\nÎéñÅËçÌ–Ù¿VïK?Ùtä¢»œc.Ú:_ïšáG»fX£\" Ú.µnø—Óú”O>ïjã¨!XîuÇ«åYš	ªˆŠ´/‰^²\"€†º9oÉMççÕì‘”z”º¸a¢]Ûç<ˆ”éîFîd1&\Z9‡à‘ñP“?’S„Õ¢µC¸m¿«OhÇQá?ıòğÓ/¾à×w_r5ËjšÈï«‘(ôH„rU<è°Fñt„Ï‰>ö5Æ²/–Îã¯„¶§äy¤¢V¿+G÷¶Ò» ¯<˜íûê@Ç8!‡_$V I^\rO7«\Z˜o»HüA\'NvÔÔòC}w´| Ø13Ú÷Cåg [5ØB?µ‡î:&:Ü¨ïmÑÍŞ{æäşÛ#%0béÅIÁ‡j²¾(2Xúÿ\'Kù	Pé„gÛéZ×É¿ …Sº\'%r]5®=ßrã•š€Tva»£Éò•‰Fa“ïƒÇì9Iz¶ê_\ne\Z×sààw ÓN#\róÄmï¦$§¥XÒ¶Û]³Ù†Ùü´ENç ƒÙİš\'7càŠñ¦\"4Z†&†1.un¹_|’?owNDôF+Š7Úì<Î\"Û€g/;ß@VüTu—µ\0~«ŞÚSg»İ_ÕYìôu[òİÖtÏ¹˜/kÏ-ÕùÅ…fåÄ	.±Š„®€»À\ZÑ¨ÉÎ3n£Ë—/o®²¼±Pø4Ô²ÙAD7IaËif¿Ï0Üw¾sôÈéµşê>ŠÕú¤<Cï¬fUpÉd=ïêÀ\0‡Vµ|è£xÈÈhvP×‡ª°–«~¶µŞ\'Dì;õÙÉ®ÃÑù¨šYjˆ-(Ñ,ø$Í™¯jòIÏ›{…\\P]Y»úŠTñ™¹Œ{ŒÇ/İSq¡xJ‚\\³9ğ5;»(;·ÚU‹û \Z…Sg™·jÒñV:<:@Èøjõów~ù·çp¿Á»×ål“¾[YÁ$u?G>w‡S!½vSi»	sÜ`4»ÙÎ‘ê¿Ëf\0ı[%\r@›êº7‘Ùé1WÕ\0‘bÌÿCïaÜej,ôCGG–ÈĞogpr\"öfùüì°õoıCùõıC+’ŸyOsp^oÔ£ÜMï9²p9âíÍ‰CŸz¤,úªfõí0ˆ=$1íäZ<òèÀMÖ­R©/‘OU¢y§U³RË£bIübÂ]‹Ï°?´fñ3Kc¦a$nt\"—#f*Ò°q„øÖĞ˜º:¦îíH d%OÂå\02FMüø\nüÇ©ºt–ÏÒŞI‡×â¡{¤C^a.¥X+ìÜlÈšÄ75¡)ÍXö‹\\ÙBùäµºFÁİİ¹Ïğ…a]Ø¸­²ŒnLdcüÁ.Q3GkÎ\Z[şw$½ä›(ŸLqvîõÍ]ZµM#kµfƒËÄ5Â&KÌøbäÒ\np¢´Aí¬e5ê–×‹>1 „\ZŠ‹öÄ´š]†·_ßE´ş¦S¡ãÃGøhqÉ$=Ã1§Şxà¿b€AñFHåI1šß‡lxÚbMáƒyt£–ç5ƒ|»#s½f\nš|ÄÜ¹„`šŞÇ \0ø4qÏEĞN÷ªw\rüœz3P·\nZö0Ÿônœ«MÕf~âS¢İÉÃ”ÿ@“˜÷adAOˆ?tK×äÜ{…)Œ©îÀ\0“ìü´%É±|MİAGl©Ê÷(Ô®Ë«[	WL”“ĞŸ0]/!Ãø†€¯\0?Sò@§‘½€^`Ÿ•ˆ‘Ó|:øgàÔé`xAªÚE£û\'akö†\r›©;Â“€ø·]s+óšä\"fŞGmßÏftÙ†^oÑ±ìi9Õ@:>dÑ¡/Šp~[ğŸ+ïfÖ7pÊ8¢Š¯J-No¥È¸eÉSó‰SÙõz3®™\\öš$MºƒÎ~ÏãÖÒ4¸ LøQĞ¿ÿ@©~–3äz^»Ùuz’âÔ+ä»Ğÿ@gD–»Vê]\"ö÷	‚\n*¢ˆÔÇ%æ)şQ iŠõ]Å~qBø\\·,äïÇ€ÆÕ5`<Ÿ9\n\0¿üçcá;Œ©Ù§Iáwÿ<¸wA8î£B2Ô½†ƒ:NJC‡ëœ$ˆÍ´bbãÙÿÍÉÃì†^®oì€”&ÜİIVjlÇÄ-t±,©O±LÆÜE÷ŒÔ|GÙ‰øôheí <À€VÀLğD\"\r\0†Ôtá{è¡=E2ıÏƒ¬u¾,o²T\0Qâ{|Ñøy[gBƒë·án\r·ÅB›°$‹‚•áÔT¾Æ‡«¤yn¥tÑw¬”’ë+Õ¼.pX\n*Ò–ğ»ƒ´†ğ‡Üír*˜ı>#¾ƒ7¶×ó{Jt7Îéë+àcû¼ñ*CÆZ?”ØÅõGÊ4Ü²é´hïõûşeÓ’á²ijjÙ4ïŞë]šP²„ğ‹‹uõßæqDELúìáMÊkğ†?Q\"/ECKùWl`ÛŸdXô û¤ÓoQlÔ)	[F«Öl¾6NÚÉ\0^ÇuÜ9Æ4`êXXŸ–—ÁDÌ75AòXÙÛÍãÃÃoH…–ƒ×‹± 1YôøG \ZÌF(ï$ÒéU->õ#ÌRO>a³ õ\\iRTpE‹D6š\rBåÂ\n,•%”†Öw}÷­G•9PÔ/l1ßã‰Eä€=rJöÓY&¨Sİ£HY‰µ\\ı0¼Vã¸JÙ[5ö›Ví©”Š‡/¥(Î¥dÃeÚ&#@È….ìïWÕ^QvL@qGD¬¸à¥@Õƒ#‘E=–òLé]/—¢SÓ£3qZ-è\râ×dÁ\':/ĞÊ_é^P¤/ë$‚/${C>3Å5txù©éX‹>u©d9óé¶ıa\n6H~…QãXnèÎgEÓ3$…§“z+¥Uî¯Ln­?f}úûBş¾–¿]\0\n-ø	}(\0\n†ØúäÇOZ@g—héßúä|”£Õ\Z¿†ß«ù†2²ƒƒ¯~òWHû€¶¡- ¤­ÕfÏËL1ÔÏŸÓ„­fÆqfíí‘Ü˜ÑÀ»T0ÛæÇ÷—…R:‡ù Ë{Ö¶sÒ©ñ»êùXÛÜE^VùójtMR¦‚Ö÷ [\\E“ÅTGß¼ ^po\0 2z‘uQ¡à+ß÷ª«ï0éÔÕh¹v¯,Œ`„q¢8;_©ha¦ºlq-ªqõ$††]@	ù|U6÷@tçuJªÕO³×@~C=.ÌÖòƒzy…¡@ÊÉOË\næ‚N(_zğo¹Šªø‡7s4\'‘qæùXˆÔÉ;òOÈ›|æ¬é—rªÏëğ7½­§¹“x‰Î\\z×İv{ÿNz×G;ùÑ!N¶ÀMwÖ»¡dãôEå\0ê§ê\"ğ›.\n±¸òú£ûÍÜ|Ãùk\rBùâcúã(bßiWÜ#˜YG‹ÎázÈã¥(ú<ÂˆÖ\rI$G×Ãëİo¿ï]»”H¹”¹Ì-F¬ŒÇhø%*z­´;şÆ3ú‰Tu‡´*wrz!ÙÇÕ	kªáWïú	tçîN¾nàëÆ}]?¥û\\úö~)D}&ò£Ù°ış`.o@ÃÎÃËëÌ»Xq“\r}u^ÔD3Û·ƒÅù«±U¶â#¢>ZãG©áíN\Z#q8Ã‚gÂ5?ÇwòDÖÁlg6gA¡ûjS‘zéQú‘Öfw§|ç³‡8–ïfL’Õƒjüäáï~áåÎ¼€ğÄØ·tv€“óVÓÊÏ>:N‚Sk¡S†@•ºİ{t„eä«àş”¼Ñ‹=Œãñï\ršÍS0)e™’vŸ. „«ÅQ&Cö%|5|^¾¯Ø	*ÿ¢g†I¹º\\ÏY¤ìî—™Û¶}êX^‰ˆ¥iPCÛ¢NÁİİÑãCş$T¸»ƒ=ÃßP2¶Æá%F”Ô	Õ°îıgØ\\.°8åb±¼Ÿ¼dØËû~ç»gsÇÉvù=!Ÿ/1…¹è:¡™ÁP1tbĞPÙ‚ş%Ïˆä]ãø•½¬İ©dxW¼äêä¿ˆ[èÍY³û8ü”j\'¤½ıÓB»|y’_/xY8™·^¼E¯\rA‚ı¸»ã(ïÆ¹å¸üà\\Œ Ë7åÕb\Z8Tf÷r³È­ÂóZ\nÑ´}\'%H×ùÎë­Åz\0ï¬[ Õ#šÙXf><XE–Ã¢%Dö¼ŞÿGøPaÏ)DÀ´:3”ÄxÀšıš<I5•ğñ®°äûB]*Ú™öSûLxdu¬Ö]LØm2œzc\\™2Ó”ÌK¯n])¯ßD‚ô£sëa«­@C°]§P¿«ÈfGİ((tXÙ×Ãk•¶®2I_\"÷‹¸ò\r;ƒV&ŞWå(ğdä ¾©WqUAÛT\\kªwtíê«2*‡tŠgÀ…sHÎ6ıq;a¸5ãYÛwT\ZÕª®Q‡Ù|e2¾€l|H6,,‘\n²ÆS‰\"g˜°ˆ×‡àÏÏ$Êj¡fƒÈÉ*ÂM	2+.$Êˆ²n”dÖÄ{\'ÿà[}½pó.ôd:_r@KF\\\"-“âd›À)ÔãGzª#EbN§ùÀ™\Z@Mfèâq·ã-Ş¡ĞK3ñÃf2HÍ¥/›MêÇôDGMxäòI†ÏL\\`°¥vğ8²e~¯&4b=ZğÀ¿ÏP‡R\\¤CE”a~{ÄÁkNğLö–?6JÔm€h6¢T¢0Í„¤‹k½ :û…\nØ*v\'¨bãï…ålMù6ªíô×\nÚêæßÖvaeeŞ,3š\0•iÂ­\'YßıÜ*Óè¡šL|˜õô0>—$˜4rQùøj:¯^Të•šy /$H\\Wâíµ9	ª”ˆ£ÁNlH‰oaf§áJL–Ø—´MğÈ	Ñ¹ šæ¢ëÃÎmĞÿcªPMD¯Ÿ¼ïQš³Òv¿VÀv.±™ıı °³oÒ|â«Î’Méˆ..`DÑˆ..ìˆ¾:\r=ÌeX\'\Z’£(|Ú}£ÜÒ”ãÊ{\n½ÉßSƒ¾Ã¬²Wø„÷˜à„QúWGıîÓ×\r+ˆîmXÁ‰Y¶÷’ø^¡-.¸W¼\r*—¤ Ds\'oñ…£“~†‰a_yÒ_lÒÍ/’nèMğÍ½\n’àTÂÎl/ñ\0ÛYˆú®ïvWšozÖÈlEˆŒ¶ ó“kÕoyÑöhŞNÅ‚á$³ß¹u€\'ô±€™%ÇõëÚ‡¯•úùÈ&5Şº<Wq®ñ+ù0%Í“qâ[•ÓÉJ„IÔBÁIÇÿr2ğ‰ÃME§ŠôÁ%6>;˜[•ÍD=zb¸méO\'^‚ÛñG°´Ñ|\nSÎœÄ:Ã“ƒ¯2<—>|~rw\'?Or7¾“vıX––óZ:ìğ ¾%U7ßaúÉH¾¶³YVZğè$¯&úñøÄ»í”¤Ï|î$Mş#T»\ZSlyIúò„tEúÄEp¿ûü‡½J±/Nò@\\»„#œ)äF\\ôÉqo.ú¶™Ußø”ÏpŒ¤¨DöÓìÏO¶kS×:VŸ\n\n²ZM¬õîUxZVC§•`Æ6¡	ÊâŸà)tBIòJ^1=¾˜W³uÿ_ş‰‚ÇéŞy\'>¥…r3nDÄf1Ä‚*pæ²¦ãÍÔ¸ynnÈN‰È³jÀ)¼£ƒËõvK·£ŞS=IÅîQŞ§9q?øìŞª)=+Òn²5¡ñŞuñÃh}Ñ»ª€N÷®ó [-ò±Y/•£‹NïúI‘F4sç\nœ“ÉÁ>ÿÓ¡Ï]\\ )eJ’\0ä/uÏ¤?e<o&¸”¢Pù.7–»–¤õNJyİ×’˜j’rO=)SÑ‰4wÖt5öâ\Z	{/Û•f“4™EzÂzÎ š¤É‚W<ß¬/`ä±¶ó¼8çhNó@§@Üy§¶—áÆ´|Bš­S´[~]3“išä%¨%\'ÌõÖóóó)L,®RÍJO½Ãu”d)1+¢ï»;\rÄK“]RZ¿oÆêäÙÛĞÈ=6Ù­8ÊÚ:––ÇU;ƒ5¹(öäGh‘½îQ|ö:Â’¸î²“S”Æ®5XÆ¶É\'/+Ü=¸ÿÛ(b¼2dêy:¿îÖëÑø‚ôN\Z¼QhQïôur¬o×kãéU=M¢^çêåÖäìíºÆ²ßcÛßÌ¯àw7eEÕà7mè£Ôƒ<ê¨ÉG¹hz\\Tw»EùRôÌI ƒGNzr±½RoÇl*„\Z=¦üyRhVİß¿Ä$:Æ…†­q¾ŠüĞu€¾;Pë\ZÒ‘9föUQñG«õPúÀ·\r2ÖDgEÅ•E0@\n\rKoú\0‹‰Ea:N£ÇP\"¾AÆ\\ºûÆYpÒMòi@+pu>Ä=«´’«ç!î©ÍJÓ{–Ó×ÓğuÒ´ÌÇPX6¾Uz\'¹ŠÕ¬Êõ’¸R(¶Ü¢ôÖÕè†ô9OK¸à +8~È_¶æg­Ñx½M[~#¢ï\ZÛ×¦‹¯ÑÅòp/°=fİ]š <lX £féj\\ÎÌ\rğ¬gÕ8T’Jq¹N¸‹F}uvwn5ƒD€ÑW8@%i\ZQ‚*¹Ğ©<8œ¯Î=GÀúYbŠ«ås;—+|)\"ÒDÀk×ÌrTšîg¿Ï¶±.´*DS²’®ûºç`]*ÏÈèBÖjFZÅ.ñşŠ	tcNZ›>pí¾\\½(—:‚œ:Ññªúé(pQ(Åd3ÜÁ@]ê=#A`;âà|äH¨÷ÄA÷®6«×pQm!’çÂİõ5bgÆÛ?;Pr•á†ÏØGKÖË,¹èèÛs·¶³ß½ùáûûw—Ey‚bnÛ?¹y}k)¾<Òv°—/@ÍF«KV:@g2Z^v¯ )CÏ:mè±¥D@’&Hum§=Í€éØ¡Ï©}£Îe€Âôæ£9çh°P.÷”Ot_E_Új9.ä1ÎH¦‚£,ˆÿ·òæ9t]ù×½Pı·ğêyßÄG¶Ãí5:ÜÆ\\ûZ% …VñP,{‰³mÜOŒ‚ØîD+úÆ<WHz‰²& nm‚Q4¯‰å1Ce§\0½×E÷å×l\ZÁ­/÷<¹çÇ·/\r¿]Nsåª§é1ÄÃ”ÓŞ˜ùî´Ò¡0©>Œ†eéâ$¹\'vFïH³±Év}éœ–8XØK±Ü¦Ù\"õi2·°HL‡Ô Ò-Öh¥²2¬EªÛzÅ_¨d®2géÇ‰ÏFİór´„ÄîjQÍğü`è°gX.Òx€ +ä½è„Œ*‰&ı|1\ZãkØá€îº¸}wNĞİ&ºÂÌB[ñZG½8~û·Z½Œn–¬~Äñ‚ˆfßJãıãÃü°÷§“mÇÁ`âH?0ÉT›ín×T©Ï}¸½k½gRÃúEØğõâĞ¶Á…+†aÇÇ>ç¶3³[ DNïÑ¨DrZü¸ßªV­QkgÓ´\\ÏgO•Õ.ñ2ƒG‘ØBÛ‹àKK\0Õ§cÕÛÖQ¬u¤3]çÄgRM8À(×¢náË€ØÂÏÇ—åZ?lóšFµÅ>Ş4Ğ‘ïÉy¢÷ş8û¦:Qrr2nİYhµº¿”ã®iß,pÁY³NÖ_r¡\0„r>#Ü¶µOËójÖQşÁ€›¢…«ÂFîéŠşÜ¿Ä¾¿§:f>@o9”ÚH–Yj–¬íÙO@¦‡Mò²şë;Gûæ¡}ÚÌâ^Õûs®ÈÛ<¹”M¿¸2iìÚİhDYëÎo>£„®‰Ğ!´oœ›Şòô5%´İW-k.ˆÄó\' »±¾œµáÅ÷ßz­ÊÕ\nèöŠW\\\"Q7pœ¨©~Ã‚zêdI½tÅ#wÓªTÉ{ÉzğjéÜ/iÉ(:@ä\r«¡-y(¥:Q¦At¾Ş=y‡éƒ{%3k¬G[Orğø\"GÎd¹CÙGÀrIJëÔªÀãf…À^ÎEOåSíÌ %§g¼ÆF£êÇ§ˆV!ÒöŠPßNÈä›6Ók¢:ä³^\ZV½ÿÛnÓDƒ¾brğmº\r|ÀjÊö³¸;K[7$çôÈÜÒtü;ÜÌëu:¹_:ÚZºXy¤4Ã2:Ù	i>ğc{„2!¹bßÎ¯jÎÇ=Ù†ç­ßœnjy<aWcç¨  pğ¶ÖÎôÇùº:«Ø_(ZT¦‡¢ÒbŒ÷œIEÀõ8µHamŞW«ŠBĞŠ“ ¸\"¢×MÍ³Û?Âè˜ğÍÏŠ¿\0İhu¸®Ö\ZdhˆWIùI\"5ã®ˆù¨È÷›);2š.^@é«®§|²Ì^Ì<Qšƒ¹aÔ]\Z‘øÊ¥‚b±¬¯¬¶=Ø½ûûTh’È|1c­Èº”°¢¦Xx Êƒ¾­,ç\"MRNº:}ïñ#§ùê‚·p\nıGŸ¨¾K?ë‰[	/eğ—LãÖF½{IÔi¥n:^™ ìçsòğ•{ëÙzÆÀ¤5õD£8º—Ùe‹Õ°p^—,¹ğ¼¤$´Ø±¤a¼P£îï(g7Í&g×‡¶z\r4uên…~•‹N~œöÑÉ‘0Ì&sç.£Xí\nÊ©ƒyC»Ñ;ÁO­Oı[¯øÍÜ¶‹ØèÎ=ø]æÆ¯r³T«T¾îP#Úü:ßPõùT\"æO†j\n.¸¤Í&î°Q´.lfç4’_ètÔ”HnGXQî\'Îµq”;ˆä\Zo%G~t/ŞÆõê=×‹ÅÛ™ÍN’¦İ\\KŠ(a—K…YpXÉûZœ¾íDNu¼a”\rV½‹z×ïXá9YÍ„4£@¦™À\'®j	ŠŞ&áªZ­kŠ\";_0¢iFÌ|tÎòıx\r=59v|ÿø$vƒjgdÇ±h¸ƒéô{‚N‘Ó:«¼\0%Ÿ]Èó\'$Ûl¾›È6ëäÚLT¾EÍ¢ ûåX<f^¢¡«›qÙ®ªüÈ³’õ1EóòPFCŒsu­ŒˆZ¼üØ\\QØ%®!~ì£¨®kW©.4O5³ñlÓ›n|üª	!¾Â˜gDDöàIöááËÔøÎœ]­,&×8\\“óy‰¡2”\'%õÙƒ(¡°|5‡Û¨AŒ«<–Y1»ûj]Ü²FĞUµ.¾§4†¥Âg6¯{PUâuFH¯¿ŠîvÙ©s«{©Î½D]ÏƒÖ:	­?¹~vy74¨x¡ ~È‚bg{Ši?q’DlÁ×›¡mĞ‰çj{N[e™BWîsq¼ß2”]Ø`ğ0!V”°WdáFtÄ °¾<ã8Ó’#íµ Iê#”×¿¯&›ÑôQ–£ã?K«ÙwC\Z¬…ÀsÖWEË]Ñá÷–£Iq´Ú—ŸjGÙÆCFm¢ğŞ~üÅ¡b<ãàî\nOß˜ÜKß|&W[‘Óù‹÷$4,ê§ôew®h£\':Ktzw7léûÚnÍàƒ;Ş²\\-`[È£Ÿ~õHš0£ëA‹ÒÒŸ¦q°lF!oE00»\'RsT]Œfå´Ë\\®Ô¿õíJ°™ëƒ¹éXªÂzšn‚ô6ÔéE _$¸jKAŸ»XVW£å\r“Ÿ¿{ùœŠĞÈâ;POî8>î8=¹Åød¾$ËµÃ\'Óµ£\'\r`™wt‚Ô\r¥ëìï§ˆšjZ{¢WÜ;ÙÏ¨çÃ+2É[Är`P:®ßÃGÎà2\\c-º£i¹Ô°6ÁËæ!^oŠC\'\'S\nï1r<8¡ƒkÃ…†¨ÏËí¤\ZMçç}ÎËQ³ßÜä– Š÷@Ôb”9ê¤JÁÊSbAµíŞ…\\ßë‹i\\Ç>·Õvßß7°+¨Úe¨ášO\'Cï\"…wN‘!Š®ó‡z!Ht…¤³õg¯¶Âo^X^›ŠËgµ+dOkB…Úú	ŠÔÒ{N“7@¥Œ©\ZŒŞ!Mc°İ>ôQu×ÃB(²Õ|3›dòÆ©aˆúk,‰¦á7Ñ3Ã=¡·8¦c×ù9hà›~ÏJLÛ<í[şkl›­ µáåN÷ÂWÀ*ÖFäŒ	]TOMëÄ}0ir·èÅá|‰IÚŒıl³œ¶³ƒ¨ÎAÖXŞ:’0À€ön	d¦È½>Òr´Öj{Ên+0‰:ƒtNV³wÅ>  ìD ke\'j¥ŠæwußÕÎ¡eMYFÚe#Á­seYWªIQ¹–jÆ²CŠ1÷ÖÇ•ğõ‰;éBpCå[œ»=±şFºˆ2è|¹vŞßöÄ÷˜ôc§†Î°ı6{·¹Zdı£šÅ*ë?Î³Årş.ë–³sÿóF·˜gı/òlusušõ¿¼ßÀƒì—ÿ—ºø_iÁÏö÷ÎÁ‡[ÁãĞ„ıäîî_şå_Ä0?Qú}ª4™ç3æJN$ÇÉ]NüÆ&ú	£y‡ 6¾¨‹´ŠÃ!t¯º3QçQY&N.ÂJLÛê¡À\'ğş»¬E»@)xuÄÍ\r—zÔéÜİµÛ¦‡O÷$aéÏXd€à;·ŒVWUìÎny&ºÇA’¥¿¥C¤F×ÕÕæŠsŸá\0\"×+÷ø?z:·Êƒotyô@GA™û<ÈøÂNx1\'kF”ÙèeÏ¼àY”.R×qŞ)„š^x¦Õ˜6ØÑq”³Nhä`•RšFD*]&ßK(ÿ;ÎWîç×2ËËF˜ÛzÆÿõÑR.ã(‚Ó/ºåAÒk¯Í~:Án†R]ÂqN­`Q\Z¡•ü&Ö”B 3VkÄe\0a?Ä.A	|J¦æÜ9VLÙİÉòáVe3ög%` ¯Çs¤2<\Zâ~¸\n‰ò¸ß,]pİ0s‡lîÆo”¿Àãİ\'È*;\'cRT˜ì|:?M•táÈ(ŒHJx \Z5ı’‡:—Phë÷WM8=ŠEûéÎÕ%ü)˜\ru;võÍ“@cq]dhèÕéeçG«Á~¤V‹rL‡ELTT\n¦a	©(£†àĞÎ–hÅÇÕl@Zu$ŸÁ²Siï\\®iÙ%<ı•f}‘˜U÷\rbûŸi$xÉp>ÿo©Rß×7AßY><Û·¢U7À£Øql\"3âƒ?â?M1áÕĞÙKˆÕÚõ×FR\n…VãVq\n_@üâ$zk‰6=ÜwUfçÖ-xQ£b‹<r}şEÒ\'C¢îÚeP)è%?ù˜Nûe‚,dIMˆ-uPfÕÑ¼:\0ÉÉFİ[˜Ğ¢¨’Lmg ½”´³-t*I´\r:o\\Lİe­We‰>½× BĞ§­º¨Ô\nÎLÇI¬—ÄÉ“8x[ªnDƒTÆD¿ÛÊ¨U­µ.ˆPqq‚5yNP-èûîÎÛå°à$ÓD=ÉN7§%dA0IØS‚Œæ9Û829Ğ9,ûU†Ï8õ£o€wË¼³mK³ô\n/o6nNI7\rç~EÇJŸ.DÈ2¢D™çŞ0™¹ÉÜ&ü¸A-<C—Ek„«Î8÷ö@¥¨µíWÊ¸||ø¥Ÿ|é¬{2•ÒÀf†šDÌ\'ÉáÉˆø1M=+\0¸¿,W,/–ğTõ+Zän®Éªñ\rYŞ%,Ö´x uŠ;\0/œq¤t‹ä‘´ÆVÜ˜|¨Ó±-+Ã~»×’ÌòÜ:4R«:`Db·ß`8ŞÖ³i›ŞWoİ·;şş=S›-H{g¿ÎGÒÈaˆe†:‚“}Ãè÷„JéYLbç¨ÒqC\'µ@_ÑL=¬å}t\r]£bñù	±×Á^$y6o¦h³Ñ«ˆË	²ÂJV\"M3v¶œ_½¦\'ÓĞ¤Ö=$Ü7¯¸xr2òåß¿4^â`%°ãRp¤;RK³\Z®„°\rÂ„ïÊ\r]`a¿{EB”Iro±äE3ØA Ô½\"&±‘ÿÍ½ ^µzÉêEäÙÏ•Ó.ÑÑÓ¤Ş|‡‰’ÔíÜ2q››	Øàªù×¦°Ğ\"Û>k3ëŸÉÄPô]IrT·õ~î?ş(5!E•3GrÖš\n19Êì¹€İqFS?RåÒıÒj]ŞvÜİjøÈn~Ü}k\'\rF+\\»ôpk#$@lƒ|_Ût¨¡™Ä£mt“Œ4:4fcƒ¦·»Öû³­ù»P6k÷¤íòä$ôn¿¿ÿêÁ±#\\GS§î ªùf5½6ğ¡‰1Š¹~X¯kpÇâç;±õüŠãax%4\0”Ò`K²œÁ¢wã¤}%ªçÕ{äG	ØX …liP]w,yq­Av-Sº×»>XŒ{×Š†ıøãûVçö­§ùr°]h°1?v!Ü¡[©Ğ-µOïÓ<	u,‡áWÏR³znOÜğÄÍ%6Nı2u`çË›®(¡Æîï¾ãì÷0·ëYøx³Í²¬IDsÔİTVª*¥z£Š¿O,ÒŞİwuô1Fu¯iì¼²Ø©B´ı“û¹Híç{~Tê«s‹±&d;‰çä™LD\nü¬ô}²P\n«ÄAœU3˜Ö8çÎ³Š©u[?@Øf‡¡[OÄd8w”LæuÛ½”æµT›B˜RóTÀNÄ4%|™&MCÇHÃ•B8óë¢½8‚=º8Ä=KI7”tƒI7‡Cåp	wŒÍªx|HºM“ëO\'×ƒöäæÓÉMçiÑ¶…>µt–Ê=-¸Z¸Î;¨ ªŞ¡ï]lÁÒÄZ“E—4:KÍº‘;*»8ô¾˜v6ÊKRo3ˆÚä:‘Ú†•®éfQ[Ñô‚\"şÛ1=¤§ÔNjrÒ;Á²Øq­[zH4[Â™§„3_©û–uŠã0ºĞ7ÚÑéÊb˜¸o^ö‡ùâ¨¿8ÊØ¾û•3„>ÿÙšÛå[KëB:·3~k?wg£÷Mn&ñÈnq”¢’\'f6¡º(r$Q•İÆî©6úrôşİ!W5€ËI*Hïe$×Å$uĞX¨‚ù;LÑÇ@ëàr ­m[©!$¤X¬½g°Kv„™‹B…x4ğ±…¨+¢SjE‡.ûU*Z DûSÂ9Dg°Q<;ÉÒÈ‚âl9Q2òÃ\\­†£õğt¾^Ï¯ŠvP¯wsõîitA©\"††Â(„v¥cIå¹lv*›ùŠÕìl®›#.·Öa-ş[.Ó—¢ˆ¹ö¶ÏôÌdÁDv¾@†ÄAI¨jˆÏà÷=Ôİ¸Ÿî”¾®Îà\0–ÒšI·[î)ÕÛdméIM¾³@`Ku·jŞ2ÁmÇ6·GŠÚ(çuzŠæŒ¥hˆTÃ±Kó™\"»`¶ˆ+…÷÷K=If@`»päG‡xÈ$YMµ0–q\'ÒÜiàùaU.F«‹Àµt½Ú.ÂÙL1EŒ‰Ğ)M©æ=D5ƒ\\LpÏÚ@½\"©ÚèÜfÃÄ³îÆr4¾ühîË\\ošåtëü–¶\'ŒC™”C‡Í¡A¨ÕÏ§*9¡Ç·â\r´ÏgÄb„o\0¦Ÿ‘ßöLü\nÕ.Z|«é]çTlGşU5#ñı£mî\Z£Aš¶ØÅ¥k\nF…% º©#Ëi«Á†‰øŞTv-²*ºZlàHxº›Îºç+aàŞ¦ş»âfŸâÇkŒ¨İïmOïf)|÷Ëœf›u)£Ğt×ni{¼pXF¢ÑÒ5~q|ÄK €—Oh5•ø]\"í£r¥_Òsë%õt8VD¨bXÀåè÷òÙmW‘†~wwÄ:W®Æ“2±õAZ×\0í|\ZDğá#¡ƒVÁÓªÛN®\\Q=SX…÷˜Óï96zÇÅÔŒ˜äúò}ÜNTMİĞÂ;\Z>ı#¯1Z¤-%>åx¡²ŒêÛ)‚ãÚ\rØ ;æm™XN§£Fˆq”R’S0©ÎÎP‚1¿ºgÕ´\\/ËR¯×çÅßÀFÓ‚Ô•ãÀÒ°˜´û\Z)šæ«ĞÖj˜¹Šµ.²G¸~¾z4š¼Û¬ÖØ{Ò§zvk²”fÆ!¿úm—òÕQÿ°ct2k3>ÛÍ2ˆ¤LÑ.+äHÑuû0g*àHÑM7ÌKq¬à³ëØÜì¬ºFCp›)LèaH¸t˜¾C*« À‰åüİø™HâÓ}á&w¿¤ê=Ë’£¦vkªÀ¦\"0ô¼ vş PÕ{¼X«yã<ä&0AOüp~¦G¡DıFÌ6»œTëáÆAÍf$‹Î|2‚\0$l­}\\q0¸‰+\n¼+‚-\\nè¼SàpÊ®°ú£îh‰Ñöº°­²Ô;‡«‹«+³ˆø+Ş=ƒŞqL—.Â‹{›iƒÔa‹³&˜wQâuŞxÊ†‰ñó(ÉÆÂ´Ûaİ†RÂ«Ò{Ùnı\\SÀX?øÏÀÍão=1Î•ó¯FrÇlyğ£–}ĞÔ(ú’I´ÇÍâ+S1¦a÷êShš1‰z\ZK¨[ñøKø»bLºtïÅÃwõ!^tS±Æ­ßfúlşèQ/X~Ó\Z¬zI¦±æÓü*5 #_CÒŸ×ÕtåuÊ æHéƒ«\rÊş¯gìò.¬|n*ÿ‚EÚn¦š[ñs+\\ÖT¸²dâÁ•Úm4ÄKéÈûr¸§Õ¬\\µÇ(­É\'¤“F>ÈËú‡ İ}8®ß¢©snQCYé:F5…ì)Ì|oëÚh#÷¸:9><Ñ\ZPş\nXúheä\rŠã‹şeİœõŞÍ«™ö&•|0ÆËç\rÏ»gÏiñE/S}Lì^&·Æ²°_Tâí.Ô\'9w@ÌÚoOçÓIÖ·—}ú)	ÎîîàØkgX Å&e”X¯€j=šVãÄ£Gq@ 3‚²¼Œ|ôQ@\rªEæcDÂıçÅz½X}ÕTõÖÈ¸!r¨^†´x|ÜÊp­²Ö]+coXYëäÄaL­tN­üù—ï±OXé M]&­Ï­ö‡Ğå+p8àÿ²ã½šÏæpÁ—~âş+1äÕº»™fı a	…,ŸAšÑù*kµ~ßÊúğ§HŠ8³s/QgP9·…ê—çËö¹İ\'¼¤âóUpßÎ©¤º|FıãQÔ—yw—Á+Gã‹VûØÏÖhÕúéy¶nßÎZ­óååğª‚[ÚúÅ9ƒ·³m&š:€ÿ,R½É‚›ÒÙı×½eÚOøªuôï›ùº”€}Ùå›²Çš“ÖZ»NÚ#7Œİô35b)hÏV8È³=šáãn­É«ò¢;ÏúêëálŠ‘#]€MtwßGÀY@3Ø³FMË×ëxÎ3ŞĞóï¹\0¦î@Ç³õÖç*Mç›Iw³ è‰Îâ­òg³A5u6	Ê¿ı{ØÛma9]êE\"01e(oØméã·”}ÕàšÇñyÕQ°+å³mÎOõÄızk|€/—ëoJÜpÊÕåîÜ®i¼²mŠ”“§e!À\nŠ6›/RW÷KrÜ“+tJÁæáÖû@Í›IÔ6|/)B4Ã÷z–sµ³pvµ–@ö\\H…ä84ÅÈ¢OL×2,‹^}€=%ëõ‰r¯åZ¡j§fnäç–8\0±NÂE÷–)¤\0y‹»©Ïvò\ZÀü+\0{ğ•÷Š\"²INI]!WñJôq\"nøX‡ÏõíJ¦Õ|p­)vÀGì& 5:¿§µC\ZÃˆ6š05ßßwØ.Å•XÙ€”-•Jiq©<ßE›×B–—3P˜¡3¯ùµvı[•	‰Ú¡˜¶DAŞNvY5Q•}M…0Œ¢M@£‹\0âe®v|‰Ñ¥ƒªn9B¾»iCtÔ8OïAzÏøãöªxoÃê•ş [)À×¤M£fP+fÊ(õÅlâb2óÀ*‡3¿_nÅÃ½e«ÔÛ`¸åJğ^ÌØ«Ù¹—ùµ:`Ç”ñ»v™6vV+î\'„ú©nseâ~yhä™rçøs¤6òpşÏÅûÂNÃa.Ñ9 !œ\"è_şŞİ}›Å{Û‡\0`”™Mô›àüÙÓp­ñá¡·[;[ˆ,?W×åÈx9C×™«æ•JNYl‡“ÀSÀöDtœGñi¶ÀHnª%ú±µ L‰¤œ­cO5W%T¯´$ÜuÚ}æÛüûs÷ÈÛsN­pÀtF3ø~G‚¹§Rõp\nZ‰Q‹\Zîæ}¹Äsâ?\n•‹|Ïp8Ö¡Ô:¯ïu2WÒ”ê]¦“øÎdßÙoæ\'ÀM·áoÒ<#éRœgÖ¤fÅ<’E@µn¯ûÚ)RÛ7Ş»îÃíä7¾äMPò&(yÓÙ%Œ »îŞØ¬ÁİÖ¾ÿìåïß3ÿgfõ“Á|Ô?oè%)åVlz¼Çû:»­¥ ßÜ¬K	~ÃW‡rb’–£ØvÅIĞÑùÍĞ)\'é_Ÿòç_^º€:.¸ñÒ6)}!\Zów	wõÂïıÙÛÁ‰«İñÅfv©¡{ªú€¸R÷p†ÿ9ƒwsŸj[Â%\\Xƒ J[|4¯ât­vÀ .Ã¹cş•„¾E±×ôÁ¸D¨lCiç¨…/}õ”İ…Ç*¥°wpšwı×k¦âG[&LmPÄ35\'­F#;¯,Šo#Õ¨è/%¾/Í­×qó°r3Ï…ÚÎÑàfºN¹FMÍY~–Ìä0V°òğ —Nst]MI5êH´tÉGãKXp7tÖôÕ-JQÄ«”(	‹iË½\'=øD¢¬´Ş#ú|£H»}½9ÖZ^ä\\P=ş…\"¦Ö©°XC§±¼‡Ô!_ù@®[ÂíÓ_^¶\Zgßfšôò9^®TmÉyâZ/çhF	‡úqÆ›¤¥+İjg9kBv²ç“ët™‰Ãôs1hïœÒ#õ¶¸rÓ»Ï#.á†‘bnt­ğeØˆKˆ6fıÃÔQ~;ª¦hN°k`AVªØlî7œ\0î¾*Lİ?\\=`üˆ³¯9	ö]ë¿ú<ƒì“^¯—=°·¶!Ş-¦™ïÙ\0·Å-ØÚ¿Qs6ªéŒJÜlüÆÄ¸\'ØI#Á¡»¶ŸËå =s·]vÃ”Ácú5?ìS\r\r|&öeÀŸº6İ9Ğ¹%~;£/ô_Ÿy;\"Kİµã™Ÿ#-gc:+ÇÖ‘5œÏt<;ÀÊ÷a –q>{£ˆ\rÉ‰KÒ¹ÚüÑzøUê4±R@ôuŠtG‡‡ŸÔ–;ÈşŸÌ÷QîWvnU|ÆD‹dG>Àí\0.´ûû³§…´¼±nù_lÏ‘6+lBø1X¡—¯Uqœıë7Yı€ÿüşC,Ovr¼:ÑÍh‘V	÷àâß…”‹Ğ¤mÂvø›À‘¢DÇ3¾Ï¡æ×³	š+{¸W­^s\\vI¯§‘“Â¡¼n{SYÕâ…1I\n\nÇÉñº&YZ‰¶˜Kä\0|hzÁVuæZgÃËT†ÜÜÔÓ¢ê‰-$ŠÚî˜¥®8_NÎuÏ¬´ì«–ÏFui@Yêµ~O«ñæ¿w)ì\r÷ñ›4¡›Ã=RuÙ‚T$)tCrtñ©^@³ıv’0İŒÄz˜5j\0r\0ñ\Zs“o0`\"=öL¼-X £5¡¿yN4\0¸Ê‹)—,”Z°\0²©_/p%~M¯èÅ`g¯¨Ä¯èÕ‡j:ÕûâC{íŒcÛ<æ\Zğ³B§Çù™/mÅ1VÀºm‹âp/Ü©r{[VŒ/ËÖ1êRß™È[bLÒ‚ş„úD+Ø2ÄG;.sÍâ†ù÷M¹¼ùU_ÛÙE–cUÖdÈQj]#7XËùÄnÄ\'f‘~åºÁFD7Ş?ä¯æíƒŞcI]µîb‚ÚĞ¨:A¥šµ€©u1×¸\0k%j)$ê…ı¸»c:ââûv—°`±}n£Ë·ÆjäaJŞ:è¤Ewõ‡“ vÒ	-U$²óòy„€5’”¥l‡Ã†ÀZ4ó”$(«Àê¡Ä¿C¡ãÎ¤ øÌÉh$àÈ/óù:Œ/èå>ÃzL#KÆªî}^Nû¨;Œß]h#²|ˆ¡\r|M&=Rß¶% jSä7W7:ëÑH¸ò×®—ÁE>A\\\'zĞBÇçMpğùU(‹\"Ù×Øˆ8AçÍ=—ô‹SÉ¤h/êv]\"ºàÔv4ò\rqÇXâ¤Ä;B\n€SIµ9H˜&ùÁİ3.Ó 7ƒ\\F¯©˜±WÔF¾¸6ŒÁ>IÓ$Æ³àöå®À>ólTy¹­\r¡£+@P	sğŸÀH ‹õ!ê‰7GÂJªSß	‡åjMùëp‚4C\rOå>sVÏ$Øb=¹Ób2¯«Æ»\Z4·…–áøu],z×d#~}0ë]pnçiåßï{×°,×…ûèÎPNEx™n ú\r¤Şhj´H›{}A×à¶ê<AÁø-Õ=˜ÀMuWó\rÖİÆKrÍjû&mnD™¿Â2ÑõÇ¦ÉñÎSïOÒ‘«,6±›œve¸ËVMŞGø¦´UÍ™gMş’pİŸ$&Qq‚æÔî3öMõ}N|F‚/b¨p‹¯²“,wà4Ìäv%ºf†¯‰ìMBçl^YU»‰š¨‹õI¹E’cã»6’£x¸5éÍVæé›Ê“™Õ½¬‡1lË.üáûGI#˜&­›:ì°Šù\r£†a\n²º%ĞÄüZã¼ =·\0	šd~Àğ\\µŠŸ‘6ÔA(ÅP\n‡}õŸ\nXŸ!Õ“kÊ˜TWubëË`¿MeO¢)#YÙ—ñä_ˆ©ÿJØÄ8:Û»yª=r¨}r”‘=Î¸!k˜>_û‰vÑâ†*Î˜VôÍî®hzêÛ:Ğ	¸¯§¾úõ6Ëª˜—â×ÔÜõ˜‡uãú©3ïòp|,H?Ÿ×{ºÙàd3ã;q¦fU	? I€5Ş›‚’X¾{y~úKy^^“\'üzq½hgíã·o\'\'·GùgÛúR†m\nåŞÌ¿ƒr&Êú2­†£år$A«¡\\£–0)ø\nÍRk=m¢#Š×Åña~”?Fóş…Wm¥0Î³@v˜´¡æ1%Ÿt;pÆ¾f=‹£/1Â£è>ÎwØ%1ĞÚ£¯ ~öûì\0şÊÅ™Â»Ãg}¼ÿyüû“[èÓşşxÛiúı’_¿™ÿr~ºk6p ‰ÙĞÈ†)Ã®(\nÂQ\'œ’ÓÊqí^Æ‰Î	äÑWğu\0ÿõá¿æ%5ĞF?ƒÚÙü‹ñnê\ZßşÍW‡Nú¸è–P\r[]Á÷¬:Ç,ú²ı‚¸‚.ƒ\"¿‘#ÎË·ëùÈ9V&8[¬ú_æF0R<ÕsRş‹ÃÃ\\ÎiKH5	¿v€kşë¹Ü%gpÁâ_èôR~²¢‡èĞÈT\0nŞË÷£©Ó;X†á»ÉdÈÄpøüÅ_†CyE•ôõÅrş¡…¨Ç¯_Ù_/Fë±«ÖdŞº™oZF³5†`Í*@ò«ŒÉÔë¬všÀÉtì‚çCAëp$4Àÿë¨ZÇ\'\'NŒ®3Ç_I‚éöÊÀ<AÉcL<{eş@§Êëy*ãˆø¦GcÜjH‚9\0–İ>´óÚ>SŸüæe5Ëù¡”»1ÏÊ×óš²p=–\'G/e¾¢ésŠòÍÌwo}QšèáøCœ°aä¾®{G¨²ñ‚ XNy~¶KkÛ\r¯oR2,Ó”Œ/xïÑeæ=	C•ã-\Z—\ZìÎ¥r!|}’	!ÌÁä°g=—ß¬Ğfô’Í Šít²ë-×ÊrÖÉÍ#^“İ3Ù·|ÇR T˜ƒ:ÓÏøvğıP´&¯	óOLgİ#­{^ïx©pëşĞ5¥i“èñÓLAZM\"/m_XW&?#õ EqÈd×»[Ì?³Ç¢Ù\'e^”ÆZ<ªV_ãiFÉş¿Â3“ƒ„U•+b0$ì2—\\ÏURI]çœ“r\n÷›õ¼K¨k%„çÁñÕi»éÌ©ÃT1O ‰‰­‰(\\]¼³d¡FhíJX…ú\n±™ñ|üş|1\ZWë›+`áàÁ˜çQ*H€ú¯Işğ·Ÿ$¼98dR‘¦‹‹Q[`Ù`¾‚±’UK%ŸrñıWöwMä^|~r	¿’„,E$ı ş´²´g#+~‘Ó0w_õi™…\0ßşÍ±\'Ú†2–wÆ[I_@|…ìëIÿø(?<¡\0åÕù…ù«·Jã$?óeAÿŞİe¿?;;ûÓd’\rÖzO×¾ø †tÆõ	hN03îa¦úèù\rN-ß±u~šs\'i?]?šœâq%ËuÇÚ¦­4¯øÇÏ/±n§{Ôqõ_ÎğP)\nÓ$W°Ÿ:˜\0ëSüèq§s0v`Ú¬?nKàBå:\\„ZNG+À–\ZÔ|”/2zXp§t4(h¸nŸ~0Îí¢˜|zØûŒ¿Ñ\0Ã«Ñş¦›÷çàpÜÁÌñ`U,}®ˆ\r¿Û?•nvøÇ»?~4òöÌ#ÎXÀ9õ8ï~ºîø¶×ŸNº«Î§Î£…Nã) Ì8µ¾n\\OÚG÷şøEÇàFû½/¾|üÅ§khÁ8\'íÇ…ÛënÑ>ê}!>]â¸¾+Ğ\0áqïq\0â_>3@\Zë|UúÓçZm[»ôàCâ9>~O†K)õçUu^Msö¥ \';¦ô¯¥ÎeÅİ]  —lÜ­‹â?Nş_c¾±Àã÷0Á Ígä–ëaâ´d}Ìo¨x ûØÊ¡›¦†®ã‘Ğä#b±,W«]Õ¡¸îF;©&ßÏéıUfSş½º˜o¦Vû#RÁÏgä#Ø;üxNZGøë5»n„_%îÌÁ\rúˆæŞ+1³ãëãxD-ıMË+—ÏôÕ¨/±‚V/áLŸUë’M8¸¬½É.ıK©z§’Og9éÛKŠğ’Ìªİ~~1_­ƒnq’×šgÖÛğf¹š/›kµ&ş´d“øéÇİ¯QÀp<Ïô÷üìlå:‡6o+[Ë\'¸şaÒ\Z_ùFi˜êpÓÃî’Ÿt¡µãuÅ5~¤ls;)…äÕUÖÓ ¢–-¨»»¾ŠÚ¦Ö1ğãayÕi·LA¯4”Ó*|Ÿ$}9*•m;6£©l¦)l{–lŠ^-kv\nÿJ(ãªâî]ilzÕÀgOvådHQô\\Swfõ’±Oé¥‡Ÿ¹;·Š¸e³úù®4ßp]ÙP‹_¸K´E‡?º_ÃŒç¤–¦²FC=\"Î?±Ä¾:Me®NœY™­¯~¥µM¼or¦0üÎá 	\'ÎôM1³AôšO­íïóßŞ¬¼^¿æ–üãqÍĞ²İö1(íõ=…)õıóó.õÂAÿƒWnªAÚœÆ—)Şæä\0İeCâ@8çv>î™í]åz®¡v§ßúqŞŠéxP}Dj„µ˜£ä\"aµ‘¹Wq”eÁf½Æ!qä p«0D®\ZXNR	D0>íÍ„¹Ø\0GB_ù”ÅD¨áãqü€õ‹÷\"mŒ+‹;ñú)Z’]úÏìà<T¤­Ò¡Mèâ?Ğ\"7¯˜áÎTÆá\'•“ûDLó™/me\'îôñ®í\"×‰€,µÉ ¿!»¦]ã¢‚¸g>âŞx¤©>Î®¯·ÍÅ±mŸÂöâİ;Ò<t¤zA…B÷nüÀÆ7mR1Aì,È™%ıäù\'Ñ*>xIìÆáV’R÷0ÁntélR\\möËFP¤4ıÎŒg-Ú¤Cu¨~ô# /ÚåF5ª¢hà<âÙ¸ıë Ø#ú—õsˆ-ò¯Ã‚jÄ©B6¯t›í>¹Bï:çWRù¼a·`óùt]-Ğ9ò¥JPu[†¬lD	d $KÁ»ÑçM\"Ç\',ª–4õENäŠ:ùª§µc”’<ú³O\"iP™cZßÕÈoú•˜¿Öv‡+ÔéİÀ¥yÕèÍ¼…ní6½\nvLüø%—\nÇ;Æ‰áÉ|6\Z_ÄìZı§íH<†Ùµ‰KĞC=´w¢çÃ‘Üƒ~sNÄ¾¸eÇ[¯Q²+LZó1#Â»ÇÍà·†SÇğã	y*P×X[6ª¬AÿXßÅ÷&ì¯¦ĞÄ§B\0\Z,1öÒá`9éùòL\0«•L±p›(hí]?- Æ5°?½úyCkIOŠ6æ\0¤ëåsÊ\r¦Ü`·<âÍ\Zøùñ^ \r-di\0‘5®D^É²Üt/&c‚¢…Yp‹×®€eWõ²@†–‘5GNtÎxd+¸Õ™²W.¦ĞW{bÆeÙ#5<¿[uìŸ°¦£Š»ê>ËÅ±=,|~mo™îÅŒij¬»gÈqé~d¡ŞŸ²ÃAï¸ËBî#²Ô®½bd{½xø®t÷»Å°htB†§ƒÚeçZw½¬ÎÏá]ã¨„t‡ÜVâLûÉg<-hzE;Ó¢­ƒGÅ tî´”L•¢ğùuqk…0»G\'ûûá7µba$ÑÌ¯ĞrûûAüIL÷¥!AÕ†ÂYÒF\Zâ¸«—ìŠU\rŠç\"Ì‹ïÄzc˜K\n×eä–ºU9QÌğXQ:%G\rŠÄ^#\"}»ÙKõ¡~\rqİy¦ö=±qv©5\',¼¬>b`ëÚõ±B*¹öH”¿I–¿é¢\"sO0Õà“Éœ¦~„G¬@¼Á‘u\0\nodw\Zšªš™ô^ö Àíx{ÒEĞ”áÜádÏ$-4_Á„–²¿‚¯İí/9©jm§].Èğ¬wáñÇ\rş8(,¯ß»±W£F¾Ğ»–±Ü~&rbÿ \0Òué©cQ¾¶ùØymp5šïìü²3Â©®¬6‘ZlpÑ¦ã%ÙîØø)k«Óàİù\\Å€ØµL«L@€’úş”Ôqá|0ĞÙ8éÍÇC\ZŒ“÷gS€\rpµ‰àöØ[«mlÆâÔÈU·ÆâÒ(ÎD¿FÛí˜^ªóÙ|‰aÔæ¿ÿ»øòsæ*U8˜ÌÎäL¶¬Í¶/ÈxJé1]Ú»µJr:®v-\\×!<ª•ªå©™ëz3äß5ª×<Ç2x_ÀO™kÖ¤:ş\'Sb§©æE¼/âÆüN+ÍQ ]´Y½°´ Íï7KšË\0ô‚%Ã4¦0VÆßu¦³Š$ÄY¥ôÖ¬¬..SÉVÈnÎ\n7¨¬•x†Îtç„÷!Ç”­/©£Exa^MNÄÃÒ\næ0?ìø˜³*#q-ù»A,a±¯ƒF¸b²Êìù\\—Î!äù>â³ã&øeQós;v{S´Uô	ÒÔ¢Ç†âüŠµ`µ¡~Õ¿~[m¸ë§.°â[¶ù N©ÿ± ÑG¾PqÙfÖ 0s»± ÌñÍîW@¹Ì ÆÛëŸ»Û‚ş­.J9J@¤j”8äÅÀ½ˆ7}OØ¾I=\rÊ›Öóğ€÷“µ<:ª`y€ñóÑZî¶{‘0]yo#]ŸD”ò¼’¥+Y—ËCMbLàZ2[G?mSåG(Ä§cÙÀß`÷6pVlöŠ‰Sğ^C~®œoòÌèYÎMñÍdu\'{Å¦¹î$¨Ûµ•§PyºW,›+Oµ2S³•‘]ZîÓæÊË°²o\ZucµpMÓ©Õkk^óp²Œ¤‘iNí\ZcGxÛÏœ1(DÿP\n¤¥E™¬j}~ëQ%Gì›»Ç½!s5_¨Èğw—3»7]ê“§<í®´´i¢.F«×˜å»š›ò¬O¿‡)ª`éÊkçN‰´nÁÓÌ‚ÏŞSwÑ^0`æ\nucõ9ğ>ÖiKıµDà×¿Z	íŒe_qöñàÀË9¥ 5º˜ş’N\r4“ëß¦óôÇİ¯7¿‡/¦©ÇbŞo¹´VµjÍæëWã—bˆ“D°ãi…¥¸Ó;ã·ßz¦>ÈAÅñqf«¢¿ıì$—\Z^<J}ÈNNj¦™ş=ù6>èú0Ø†,Gv¥òLÜ3Á½²vÜ—rdãœKt¦X=¢£C‘oF}_Í.SoÑÉ°[ç_%jØ8rzÄSh°aU vÎ(Fì$œ””©mD§æú,k¡ß&jú9¤dø±mˆ0!¼‰„Gc—RT‡¹´ÑU7\"BlÛZX\\°>º¤‰Ïe@ú¡¤™NÏwú\\öh4èz–á1a|Hd$­—‡\04<R25^Ì]ûm›»óé¤¶Ü*Ç.ˆ—ÁuıËJŒT˜ë.şó÷r²^t0X­†ÕdRzÕ—ÕEáaX·euá%ø%Â9)2Şİì\0\rP”BkMæç,\0Â5<C]óay=.V†*N·BÈ®ã‹NG#ô#î/±£É¦­M?9‡ªÇ£éõÜ;6¨„©àòÙ|à\'Lÿ†m¾ŒÂ`¢ôW&à+ã÷\nFT’¼ÎYc 3Kzª„÷Ş	]omô{q1êÚ»ƒñİƒ†(ÔïŸ²ò¼Àcjb;hB¶ç:yØ†Úˆo(ZM¡øòÅ‰Ğàç%`uµ¾i?fK‘‹gZƒU‘!Ù9ªBêº€İZn0ƒëøIànûP«£…DL³—_J~%Q-t)a-˜ékÀ“z+¾šda s8Õ‚£lŒ¶’Z8ßD´f0FDh	âH8•˜–d<ô<×¡zK¢Ol¡v\ZÂ‡ëI_Gô“fwT»±Òbº9Të;©ñ‘ı¤ç;ü_ÁìÎÀR5=mÿ­¼9–“×}³ngÿ/LcßZ°\Z-êx‹c¦®ZòneK1½—5¯¥G·¼	İ:€ç¸¨Ë¤¯²MEn1ñöŞ…­´y°²Uw„uIÔ£cˆØülPå#™S*JÚ;ˆ½U°-Œú_ºm×pÒå¹”ú2ÚÇ´_YÆæ³àV6kÇføÇGÃa.òcX`~<¯¼×†x9\'sÀÙ²\\ Ÿ¸„Œ]ª#;(µ*Úöëîîø¤ƒ±ƒà0sÇ¤{‡c|ì,‚¯»»[O:‹HŠDmØ&AëÇÊ;¾Ï–0¶ÒêëïËòf¥/IèÇ7Kİ­_ÿ|N9à&>jèĞÇ’üê?éÈ¹ã’8n@ÇöîmfLÈ1öîØ\0:9)\"À·$tâ>Ê\0dPÜUü¿™È\0©ùK²İèÜâì©bÜ¤o:¤Ân ²$A\nÎ¸¨¾KİÎ 6¶Bª±ŒƒšÔ•Ä•¡¯Vïòêa¨<ş>Bø²üÿö¡Ô«×?ıØã*ÕÙ\rê4ßN¨Ù¥ ®åÓé°›“«: ë‘’ª5A7NÇ(|!Ï€Ã5fŠS$ëµïµ‰µYJœm1ãË“â½¤Hl>‰(Deå~6C£ìbmR´aİ‘~óÆ TkÄ¦¹÷7n‡¹¶\rÆ\"ZÙñ€ÍÕ·ÆêÑww‡jíú±AÛqj2kg!ëpDPí‹ #\nÒÃNÊ”ÔŒø¾/Gp&Zï%óÙ7%œj¥æ@‚<ˆ|³´V(ÑğHzôj¡ÃóĞÃé¹ô,N))*PM2Â_bÑ5\\¡·Û-ÿ Ëã“ØkH¸ˆ\\Ÿ×Oú—gœBÜÁˆ^$l²y;t×\"ß§!uyyä#+>7—LcáC•s’ŸÍ§°ó-»’\Z&æö;}\rwjô6-èzjVv@ÔFÛ¿Ì²—7¬‚>$õWqtà–ı\0\0A™_µ;Ÿ’OEú)ö§¸!ôz”ÄĞajbƒY$÷>¨!ir7‚¬Ï—åH‹%ŞG¨d¶W5}\nÙl÷DiJOı`ÍĞ3—¨ò\r×Í‹ºØ‰·f\\â0ÍeşEØ>p%x×Vİ‹Z÷’´„3{ŒeùıÈ½E´t»Ô#&ˆåjEX•Æ@ôÑ\'T’¾<íÃ]9Nâéú\Zı‰¤ÄûLñ—¬2V¬øpx\\ûNõåo¾™UïïFWÄÕm ƒÔim–´D,Çn¸u\\F¤°­sƒ{š–æÂÄ.+–Å±b`ŞnÔí}‰xs\"lL?{HAÚ¸_£FÇ»¦\'\\±Hµpn©ì°˜	\nüGƒ™cw%Ö¬’[\r.t|Hç\\Nûª–yD™ÊĞQ‰{àNj¦ñÆN\rŠEïÉqÑP›~|]KLò4K¿Œ>ˆ‘W9=æÆ?YĞ\Z—€œ¿ìU‚í ©5Å×ù]óúŒîš´¶K\'Jç¾záF´éÜ’¶J3ÊûRù}¼–ßEóÚ·=	¹©ôñ¬ory­a¿*»’ğÎJjİCP‚Q\Z\"ÄR™Ú@–`?€h~5íš;0^Ô]K›ùZÜcçòÕ§!çÄw\\W‰6æª½íã?Á¡D‡GaÃÂ°‘ObèbfyˆV–u_-O_ãë\\ƒŸ|fWZ%Ô?D‰ï/åttS’çâ×¡h!0Á—…\r½ €À¦X\'\0+êX÷Óç\\xP2Ğ|†µ5i‚İù3’1À©ùlæÂîÍ¡w,ÃŸ¹)ˆ£tøùw‰D/®®Si¥0[ $\\Ş°ù\"iŠ‰9µâ2Ké\ZnoG•h\ZÓU(‹¯m³Ib·zÿh4ÁÎ\'ƒ&‡½ş8İò‚¥M÷@óL²)…ïD¹ÌGı¹ÁÚºö¥,¤ò¨ÇŒ§³‡övÌLÌP½Ù:(rëat\ZDˆø\'Ù³‚=ĞĞ9Š_-š™µù&Åk!b¬4ó·ûÌì³¨Uªiæ…ìF m¯¶‚İîÙğtà©êä³¨S¯{ôA3ß˜óéãAs-ç·±Hş1¡²¡D\ZZ×B˜ŒV$ïV7³qw1š•ÓÄ{(iÆb^aßã(™éG/ô%–ö¾Èü£¸øøK¢÷èUß	Ó}è\nıU.@¿RØ§ä®ë/Ÿk®IªGW×XHö‘½Pİ\n¯\"™$Ñ½Ñ×N\në¤fx=:­ÍïnÙ~¢.şÚˆ¤ªøÏä:–÷7ÁBNöÚy¨¶RúT\r&Áè;Ø!œËÌz3P¨¼Ò×ÕÕxy#†èí¤¹SA„pŸ¾*–!Cc~\\À™ìâÓD—£X—“,Gx6›BR}j;åß#½)ÇX¼\nÈ Z•‰4‹ÉË³f$­ü»†à	dp­¯;3¼¦ s V­–_¸sè\'¿‚ğj)xXT\n»n7(ÉbG—åDù\nR7ƒˆI½òóh\rs<û¶Àå4-c35m6dİ°<ß*½a5«ßğ\r×ÄC£B‰Vª†”_ï©Ô£D¸ =à“—y}Ñ¤¢„7* ¯èb‘Ø “WIQi	ÀºD±ªèlh¹v‚¢¾¹o­ÆØƒ>ş““¼a«Í¸Å$F;œi–XK~šŒ(ªü7¬Ãtë.L8‰£Ãˆõ3ôhkÃu$±²t%¶ì“´5­Ò,	SPY½¾]È´\ræÁIîyã½øÇçğ5lTÔÕÑ˜?Y–gÅˆÈY©~ÜİÑŸÚ³\Z2+œ¢È~m@­95Kü3•SŸìËÒdÄøJêĞ¨ÿ†ò˜ãB`›tAJû×Ûı}I‚½67Z¿ƒÊzå„­ñ“\'t£jrS­Ğí}Ñ·ÂŠ ‘ÍGºGµ—9©môüt5§ ÆÑ¶\"ßµñ&ÒÂôZfT¬ ş ¶éeOD»ú¾]0¿³E$S{&FÒsq”&&òŒœ\0HT’Ú(·Ã¡í6’7öm³ƒÒ)mûiøšÜdÛå½„!€3Ğ±èR\rº«<–\' §{É£L_99eFj¢SVø§z¤Toãë*Ô©®Êåûòşa\n‰/‚–BÂ÷.(zNÉ|:‰Uì{ãe	T]_˜I±bG·^Ê3±‹Q›€6ò•\\€™l;Î“*;õR¯‰ËSÜ€ƒ£\\eS\ráoMxÁşî‰ÌMQ8Â‚Ìº} -é p9~MhÑ7(âÎmA… áXWm“É¢-9@D6318C•‰ÕHÜ+¿…ÿyw§«L¶‘ê6óDz6”N²R8¸{{p‡¬àSöB&Aw¤/PÓ™ ŞÀ<ìëBÔ6a@oá–¤‚_CÄölKlı\Zëë‰é<í˜}R’JÄMxWš:iiå$;pn‘²? \Zt5Á“ä&dãjgr$ÿ¼§ïmy~9`’¾ “® iØ•8bJ¤£))×ä4œjÒ\n;¦^z1½ƒÒWõ‹;z\n~P¦Zßt?Œ–3¶PlÒårÚÏ¤)åÛîÁP\'İ9›øÑ„0g\rH¥ *–<‹vÌu—â¤c\0CİuV¬ÍÜåˆBÔ¢ªr„ıEdsËÍY1ãk­W=Ó\Z.h[”œy2Ñ˜%ªº:7’£Sd4éKáÃÔ\"7“¿ 4-ŠrüWîÄ3j”Xu­×ó´8w—Š]¿»ki02WIÇæxtµë?›ò–é\'¹ÕYCn¾»…ú”–g€ªÙã2)\\9ov3±‰‘k“vÄ˜ZÂ¢&üük5a²ïı­§Ì{¥€Ÿ+ ®üŒû?Ëí5„çôµ5ˆîV9vx/#õòZqf±Ş‹{ˆ‡uBKgÛ\\YÓA²U¿×™véµÃ—‰P–SYpı°qÙÌùÂƒ´‡UD„Ûæ¶A7¢Å²¬ÉO;<gËó]nÃÕãy\r4ğ@ ï6Wâ{ü®ÚÑÃé²æ«]W#(´£I*Pë¸ üı¾ÖÅEiªÏÌgÕüÊÿæáÿ1ŸîÂ”î¨Ì%:æM>\'›üÍˆcÊX=OOjÔ¥y%j’M¹ÂæŞgª…n2¯Û+È³ÀfÉºÙ.¯£\0NäGu?6”	ÿèK	œ0xYÿçÓŠk>n¨ù*tñI‰Áµ\'{×İÉQïºIÙl1–ôÅ³úE<üˆi}ØÑ:zìº‚×ónİÌëNåÑªê9R‡òLeÔ=>¿Ù—úc{× 	£‰ˆw~Õ şzÅƒˆd©æ\rÙÑr\'èwì\ZUŠŠåeçS€3+¯ÍËQƒ%‚ñTàîËÕnşì}‡t6WC”Â¢¨Ã\'æM˜Kf;Ûº1Äì2ÏN§›eÌGE*ù„mX:¡mß\0UÄ÷5öÌ»Úi:g¢yäf¥(ÍŒö$x]I¯†=³Ä¿=×İl¸áJ”Òß[ŠéX½ØƒÈai}â]Äy\Z—:t.T±T‚d„ˆÛ»ù´ıÇGb\\,½ï^áÆ.|JÈ`oÈMÕÓú£ÃSÀŞQÖA¡X·õ‚]S0í½æİI·uìœÉîï¢©½f¿ˆ5ğz2Ø)^„3%îŸÑƒW7®¯NúèÎVpÉG\r+ƒ\\T5øF“w¸tS­OŠ;a¨qïË\n¯g£kïÒ˜\\ì\"tlWëàuçéÑç@˜¥ÉCçâ >mE}Š¸\Z9”\rÚNÄW˜Á=úÍ®{‹éh}6_¢\\kR^ÿtÖÎşZÍ²ÎÓîQGİá‡ÑkËb¼VE»/Œ—.®N”ÑV%İ„Æª¸KFÍç[Æs\0±ú¾2;Ê8Êp‡ŠH·$FgÁmÒ\"Õgûé!ÇwJì+éÊÁ—Ÿw1Xrb\'¶¹­n­4ÊTâDékòZ¢OìYÒ;_@`ÏÈÉÜAÀ.ìb¸Â*I²|‡¾ÕÔ\"Óçîªæsğëóóe	¨YÊ©?_š¨¾uÂ‚­„%yË·ß“/¿GìÒ¯3àTŞØš\'>ïÅÄ>äò+¦·y0\r\\XÆùRÊ¼—v!ƒO¤İ[KÃ¿JnŠıL&ŠÈ¦@H\\Æj5˜»_]³Áf2qø­YıôK(q·ÈèîM{@²ÎägL´¶œ#xş.v+ta¯¡*‚\'rMI²íÅ\'Ä¯…Èš“Ãp¾©…µM:üç<	t«uÃ¼h>Äõ<=ğM&×á²‡îîÌöæKƒ¥¦ÕusÄõ•F™°m|!®óÚnª(õ\'i¸\rôÔ‹ìvÆãV¨Aõ\r*\"¶ut,ğLq•^>ï¨RLªV?Œª™Luçé`|Õğqä¾Øf‰Bîx>İ\\ÍvÈ›ØİİW£)ì,£V#A8k%DjK:«rù9ç¤×‚¡õ\ráıCâIûæ­^>÷©næ|Ò]\"Ã ñ®©fi´rıìğğ€pæôşjs¥x\'¥şøåŸº¶I‡YS+túœæUÌğE®‹×¨Œ2“°<SãÌ(3˜”j?\0«ÚÆºxñ@xÊ¬ˆ›øfœ/.ªMš›î¢GØ~µ2“S¾˜Í7çp¬q‹1WôªÁA®eK®Ÿ¤&=öNc£;Êûï›¿rÉª)zwğ2z6Òh$Üß¿o$¡\r\nPÿ¬P¸ä½çI*tl=??Ÿ–nnì&Ø3ƒÆ¨²Å/åß7¥J‚İ½®fçøîfÜ8QúÔ¯ú‡l,=#\'T¾K¦¿.ömı`‰dšªõEŒ•.tn*rÏê¼‘\\õıı½=»·š°˜P&ì/ñ\n\\O ¤?Œf°õ–=OA¾¹yù¼m	JŠ§P Ûø9i§Fø¥}ßgß¿D«ñew1¯Xªâºç“‹j\n$}¹§ıåûjLrop×ß¸:m_ı¾Çı&÷$ÙÛ·@Şº¶yzĞz&$Èªòh81$:>ÂÒ„‹ú›˜q³9‚YK“¾l	÷bÇÏl¢l‘Bûd†÷Ææ·c$‚Şü€«1š¢ÜM%”#ŒKñÓÛ\n×>S×:»â§@+¨¿áÌïÊ¢ZXöÈéGŒ@HAe‰ª­¦S_=Õ!²¿Â\"ø‚(úH	@ÏÑõb3œåîsÇëZQ~¬j;<–3É×à«]»áãvRû9Q†Nw™ö¢q%~»*Şñ¶\\õ;ƒ`Ö…-XpÎ	J—ß€)°J¦ããuúˆÑß;”T?íĞ+µ\0MáíIu!è»ñF’¤‘O¿,I›,Ü0#;;²Ìgó™œ¹lRj>­<îbÊxíT›25k)’hcˆÁZe÷àHs;ÿ,©kì™5G¿âé›ˆ‚R7öó‘\Z†¨‡îRâßÁÊ²=O—1î°kIy°z0XñWJ¬fÆ¿î5¥A™{1‚sOB³‰	5×d+êìª\\^Ö\'e¹™…ëœ˜ÒóÈ-éóŸül¾„	½]“†.ŞğÎË~¶Úœ^U¤ñàí³Ñd2\\”ËŒêjsWçó¡™Ú¬Ï\ZASua(zA¦Rw9¨ôÇì‹ˆwzy¿\Z£xVºè*l—*ÙVI÷_øØŞ›şUh[0&aèRT°{Bp\nv¨_7n´Å¢²ÇÕIêR yyæ\r¥ÆìBVÀ\"øôşüï¥ ¯¼—8®M™{®qkĞBh¸©%¯ùßÀå§~?Àuÿ¹±‹Ô!%1éøÿ`Ÿ¸é¾™Åüì˜od8\Zúõí|yõ[w¨¢~ÉÚ¥¬†\nøß®7Êmİ³„Z*è\\#[ö@NÏÎC~Ç¿Á{\'Ò[rÁà·Üô”ÿî¾ÔI’ÎTÏr…cÛYyV²FÜq½Š¶ÔX0ëä·W|³Nøj)3»Míú DE›,·LR±c=€s\ns3[_”ëjüšOv`ãı°³Ëò†µçv@I©ØxK{EÆH\Z§¡ŸÇÈÙŞ!®ƒÕú“I˜E‹Ö@Ú]ÏO†üÁ(ÂæG˜çËu	îj—p;˜_Ó8{›ˆ#&Œ`È\rÉ%gRöè®}Ac;·qŠx*âôAœ€w²­‡Ù\0¦¿XJÖàkG¨™†cù7RÑ&gñxøôÔ\'£W©ö7‘fm¤]İ$\\J+[×¢IìO¡ƒ6VeqQ&šŠ¶æ§ï€ÁÂ £Ö\nèÙ´\\Ïg=Š2ñ 8p\nÃ+ÒM­hJUİIE\".8µ8Tp|ã™—³¶i?Œõd£-Z{£Ù‹IIú†IƒqËçU ÅS£ô«„Ôï§£ó|ø!)CsÙ“”dÌæ¦$2ğ„€ÂÖß•ı¡QjPïAS‰XÂ˜òY.4ZáD(qŞ$z¢\r\0AÅjÅ_¼t‰jßÌçÓr¤JÚ!ru€—ÏcL•ÉQZ­FQ¸r~w\rÄc³ø¦ªÕÄÎ£iÚLÎc°UÒ,XïCX}q‘î–*03Ñ—ÄşlìN½¬ôhÓ¥z±úüõ}S¿èæ‚¡¡¤p¨è@5³j²Tïu)&;Ç®ö‰˜I­ì	z§ŞšæM-\0¦±w4Ç¯>¿î/ÚŒ4ömír\n[Š¢Ä§ûsœºÂ›22^?r¡Ä6é¶î]R¦ì;–ôŸ0-µqQ\'6-¶;qÔ(n¦ÅX­ì(jQéš0º†Î¸Û÷#î ¨Ø[áË»ëÁ(?åN\\³ëæo¡ğº-‘znlÚ)m”ë§7^Ãlí®Ÿ¸”î‘U¹ïÄ8¼J™§†kZ±•8\"O/S\0×óÄ„Â2@(*¹ş‹Ñm’$ñØĞnÏ¦;öÕñcE¡›k¼‹ëË)œ~.^z½`ùu²½¤QzJAUÍTé\"ÔÒªWã¡üqW©Q„Xj\0\rÏ¨)WÔ2QºĞBuàéGÑfğipGÉÇÒføIr7ø$O¹«T…{¦(Åwîœ£D…İ£ø¨Òœğ=chà|w#]ç!ëñğv\Z™ò¦f†dôCfWVå_‹Ì÷ª\0ºR½HÒäM©9°°>ˆÎó¢±²#[İ-\nc\ZŠTšşbNJ0Z\\L«ñºËn1¼H¬n4‹ÔM¨õ]Ó\"É½õÍ¢Ü+2Xš»2—Ş+êÔÓ“ÕäïËçOšç1¨È¥ôZ«\ZÿúmºQ4v#ÕüÓÎålşšN§5\0ƒZßÄÚÌ÷^\06†‘Üd÷»›	ï¤”>k^Î{_pSàÔÇ¾JÑjq¥LÉúCÖË3@÷z½,%`æBÜÁ_Í—N>ºê:é³øRˆü+ñô¡ãS¨¥g$ùŠÊkN%Ó´4nAS\\P;Åğb×;ä/;4Ï£ôA°¦†×j/iiÊ,3Œø·\\æÜe®•üÿ/ó¯_fg©Å‡ÀêÛ®ıfTlÙ««ë(ÇJÙÉëI©‹ÜÀ:ÆzMÇ²kZ\ZHgC·Íb¦\Z)µ‹z,ïÊ¹(á²\'ß\Zåì9;HN\\ÄWÁPU†\\èT—/¸¤GÙÆh¤{mÕ„Età·càHGHœ(^»nºT¿ƒ·S[¼ù>{/lãã@/Ämå®Û=¹¸İ¹Şo«#ÂkëØ6Â/*€fÓÅ³û348±ãá‰¾’›jfSÛªû#a¶QÈFšÇ$ƒ¿;…várDø\"CUG‚ /Ü®œ¦Ö¾\rª“d[¦^%Ğ[µë±%ÏÎª\']‹Üñ3åÊ’\nTÌT·ŞõÓä.âÑo$9s[üz<p/å”¥vNSİÙådˆ½/bÚ³uÒ•§Íüê@¢½¼HL3IQİdÂÄ»‘xŸZg&ÖªŸéİ¨C%{pßÕ/o\Z¡n/œüüß@ÛZ§€¸r«cœ„y\ru¢)¢5ÈÍ}—Ã7ôå\Z$ëËŒyÙßßA…QÒ—v 	w@jß½ñÈhèBêtîYz2Êçş+CŠ$ÓJÜF}Í‡g–,ğ¨ˆø‡îoNW\'’†|—ÕB=M©XB,ª jşì4ÅœÍÜêÖW³MéB9rK,Eµ MÂÜ¥a¿:™|†ch›«´Š³´!·ï£÷°¥ÓÁ¤VØÎ=€c\nåÍRÏeORSj‡|Ïmá&.‚‘*Ü%©¾a´aq?Î†É“5~Ÿ½çpÕp†è\Z5\Zã\"˜”ÌöÎ›uÈ¿P™Œ2äFAš‡åÕb-\"¨HË”`j¦èôRÑ#Kc8ĞwfQ=(6C‡uE&êØûû>G5eóaìÕ\0±}âÃÇƒİ*lVsÇf4â ı,jŞ¸@Ÿ0&êvïñî4JœD¨{f—&· şÉ§QÊÚB÷W»²í®–«äó_;…Ñ„Æuå¬šo[Òä‹”óE³IØ`ŠPÀ\nÚ°,‘-·´òåÂL{[á×£E9Q³Î,19w²oª‡¨	˜û¾\\®\rŞÌŸWTl$;Q|òÊ3h6Á‰È(­†„$kP94~ğİŞ®}Õ9Ì±ŒÚõº®&\Z®1<ÊRçÀAö(€‘ä>°»àmƒ®|t³Z9Ë›Ü5iJ™¨\0^)KæŒ„1fÎêÿ',1455342687,NULL),(8,'C6QWXn6eXZ6q','phabricator:celerity:/res/phabricator/bff6884b/rsrc/js/phuix/PHUIXIconVi-UeZHu22VtQbm','raw','JX.install(\'PHUIXIconView\',{members:{_node:null,_icon:null,_color:null,setIcon:function(icon){var\nnode=this.getNode();if(this._icon){JX.DOM.alterClass(node,this._icon,false);}this._icon=icon;JX.DOM.alterClass(node,this._icon,true);return this;},setColor:function(color){var\nnode=this.getNode();if(this._color){JX.DOM.alterClass(node,this._color,false);}this._color=color;JX.DOM.alterClass(node,this._color,true);return this;},getNode:function(){if(!this._node){var\nattrs={className:\'phui-icon-view phui-font-fa\'};this._node=JX.$N(\'span\',attrs);}return this._node;}}});',1455342710,NULL),(9,'4JkVb4QRPhF8','phabricator:celerity:/res/phabricator/d0cd0df6/differential.pkg.js;-kTAjUcZTYeTu','deflate','İ}ısÛF²àïù+¨İ<(´´ï¶Ş$åØN­³‰“‹í}[¥è± aA\0€–µÿ÷ë¯ù@QNî^Õı\"óÑ3ÓÓÓİÓÓÓóı?§yÙ´IQŒƒŸ×Ée/“¶ª_ÖÉÕó2}YW›ïò\"{¿)ª$\r¢ûe…ëí²­¶å²Í«rÜ&õUÖ†÷ùjüı?§/úqš7oª4Sá}»Î›é¢„´˜Óæ»¬h2Ioò«¼Ğ»(û˜•m3;Ò<ı6»ÊKìKáç+ì}ÜæE¡:lêêªÎš†éd¬P×U\\D0À6_6³û¼y»İlªºÍR3‚ğ¾ÎÚm]İæeZİNqÈ?ä\rt\'Ê›Ÿ“¦ÍVkİd7—Y\r\rÒ°gå¶(\"©üN³M»F‹¼yU&—BN\0)Q“µ¯M’jì²ª\n…H]#ÆÔ9÷b„yĞß«Şêª¯#TXl7iÒf/©?ºBšmBsÊ5¨»qŸSÖ×§Ò›¼üX]gco²¸ôåMë8ç;ĞIL@æƒà¿ê¯\'¿8ŒC\'›iìáÁĞ#ŒH£vª¨Ÿ_\0­·	,±üÈêh¹Î‹4¼O+Ä}@§u¶i®ŞhÎ§¿ÓMRU¿¡&o!%ãÚ¡š=šûùîcRQ•‹e‘/¯cXM—@Y„¢Hw0£Y9¢1Ø“\rhæç;¯á}6½†õ2çœjÍøxb<†séC\n¸†.gõïëÇ‘Avx yâ+1›0\\ $Š GqlOš¢ıá®Û¥\r7ÁiRÓØ¡›ˆ:¡©¨¯³NŠ,ù˜ı!8±Û¶³W‡\'İW×$R›¿$·¯/Ã)´•¼«“²Yeõ4ñjµÊ–m,«Í]0×´fw¢Úü®D·‚µÓÄ{ûDEæ«ªc…<Oçyş¥N‹¬¼j×ğ}r¢°×deúKöÛ6kÚ1:ÏóÍ¯ö¬•Ğğ/&oÈ€¬´r¢€tëWë;œ—×‹ÏÔÑIÕ#uëQÒcõLÜj˜²¿Vµ±kT›P$;ÔyÛÖI»¬nTE…k¹»¨èT°àUrqÑ[Q°ĞSÑ £·\"£¡§ÆFO5ÄC§\n¡ƒµ¢Ç4«©¯fŒÃããÃHkƒõd>áJ©Ø\\VIv–—Îy™°Ô>Ò).ˆ6ûÔÆ:¡`q€éÏ6pµ œ¶`0/¯Æ¼€ K–¥Ë$\r˜¼Ín\Z“é¯l¯ »Æ© $Ç^)\\ä4’gÿ•ß\05ıúìÙ´E€¹Óön“vçåVs³É–1eÃ¸78{<„#Ì™–É\r`ZÿŒyfÒò”@±›Ù`QbÖŠÙØªßuˆõ3«ŠQS¨î½bˆq™İ~á’™¡-˜¿†f“~ºü\0¼š«còèéØt“ŞU°øöÁMş¯Œyo»-{]R£héÅz[^¿SÉ2¡êóø˜ø)‰,3üZĞvô:#”bĞİ!\0l.Í:Ÿ]Ñ ‡òï©mÏ[Ğı·Í8Pe™©+}Hé˜ö‚›ÀASµÅ¶Îc-¹Ğû_^sKØÈÿŞfõİÏIÜX\rE ‹efş³ª¯WEu;Öà¨Úß’2-²zì,\\‘2yúÜ\Z÷*¡º:&Â°{â{}À_¾«éÂ.‡şâÌóˆI\'CŠèâEeŠÙ3j!dü#Ïn®€«ß!>ø>êÂ3ıJ´üU;\néÏ{ır\0âf§¦g~ùNtl¨‰hóëb.ªw2®§ø¨`Kˆ†şA«sÅrŠ˜A2lŠ¬U«O :½JòÂÏÖÚÓ »ƒ¢<Ñx\n-Ãæ	+Ğ`ê=¶p–TÊ^6$-(õIã7ü-ĞúÖ†yÀâøA÷¿gi8ùİV#¼Õfc„ı‰rº\"?£oµqçcE…ÚÂUG#å\Z®¸¢´˜s´ˆ¢Ï©¢+£õë)äQ±p~YgÉ5Ï±UÄC•–À.Ğ¿:sÎ5{ç|»yÒ¤3$ª‰“îg/¤“‹E_î%0˜·8­÷xª5‚ú&c‰ûÉå½AEdc«ÖÙoJ‚ª…bÔ`‰\n7YV.°\rÌ\"op”ıi`£²ËI*ÉRæŸ*Ê‰Ó‚…~«Y¯¼+ÄŒ-LˆM¿iU5#ƒXÔƒ£ªä^‘É,‚:²¬œê<W¦\r3vFÎeQ]ê%àª0·Àß³±7Ö¼¾*SnÕÒ RE™ê…ış¢VëŠ¾%Ã‹DfVTİYL0íæ \ZšÅeã§(÷‰šÈ·²¼åR•\"Òúi¶&±VO‰^Â=bËBĞwƒ«L˜êKøYëÉUYõâh1²wµ\rMÁß:òVÀÀj²…‹øaqšC=Í“Á\n#	È´½?&5p?HX·7ŒDE¼iU¢İ(3”eÂ³MSXµÌóZ¶\Zª\Zî¹jÑNÍ~5…·ÇG\0¦9g~L‹j¢\"¡ø–‘{x%¸#”l%ÍN‚Ù(8áï¼\\Uj‘ mZ×1Î/¢\nÍU¸Ùç]äLaş7UÙdï€Çøğƒ·Yı1«G\\éT‚ÅFÕÄÆ.²Ûdu›gÍì·dFH\0%QÙ|Q$MÃiFkçï¥³ó£4\\èß÷\'½]\'›Líbû‘lI¡=oa´aÀÀüP‡n£ä½ú!éXõ…ÊsàÌ­³¥L†Ì9*¥Îg,0’T{ç¯›¼ÔG9«¬–ß€0)Ğ9W î¾ºIQ~Ûe–E–Ôïò›¬Ú¶Ú„¿B»Rö)îR8úm’·Àßc©\'½U¼w	WYĞuØ›#/~ITBä˜ã¶ï+]€7uGôøøˆAˆU\n&}[¤o-c†lF`ø4yzk)4\rs§[¾$Ğ3<`ÃÒ2HM“QÚ¡³qßXNÔæòÈø!¿Éq¥\r#Øúˆ†eº^¦-Œzà£œİ‘îÆFgÉYµ\\¥ı£ÆöA_å%`æn¾BŸF?h´Fv4…İ<q8rÎRÉ¡üFVìÖÇò’¡\nØ»MFÆ×UË¼ıç:¯ê¼½ÿÇ_O‰§`Å¬&ë%r—r‰3\r`·ÙXru‘Ï™Çï¨§¥Ø vQ‡ÈÍJ5tjÑxL8õ\0Õ–ïú‹¼ü‹Qy¬x~}qÇ˜¿¼Z;÷PĞåÒµ¢¶Ù_OO£•êóìì>kgBf´SaË—Ù:ù˜£$Ió s“U–¥¸&›:Cš&½Ê¯xw›P™“$}ÊI²ùªÊŒ/i\\@ ¿Â.óÇïwr“)méâIêwªÈù¡úv\Zë>\'pá|(\'¶-ùÊP­£¾,?Å8®DŠÍ’¬‘õõÆâÚĞ\0şV\rJ¬œkE zğš¨(%Fs`£	Éï	œ\"ÈÄo}d€cİ!}<ƒYháIR{|ù7š{Ğa‹r¤Ê„u\r9¸×‡á3Éßé$XO·VOxş1±Å©4Òî…„fòú1)¶YÄ™ñ?NÛuÙC>Òpº®³»f<Dlã„D´oN?T9ğØ(0ÆDi;µ±±EÚÚ£ˆÃQtdøb_g¤·=X­jÍ±¼#9ÁNÀ€Òê¶”©(Íh‹‚å:)¯2¿¬³{P8ˆ.}Ê\'`5Ä–bÓşu¶BõñuY\0½üÌ€aú}Kc-§Rˆ;r³ş8É¡sÎù#Éœ!•sr6ûíB[`«>5;6§ÊcƒÁì‹ÆjXËúN\r(HÈáÉê7gèîØŞl‚°cƒ$€İ3Z~}’Êóy[ßİS?±ğdò\Z4˜¹.0…½Á*şœXù=3¢+Dàƒµ³\\ó«²ªaƒ~¿ÛízO]{Fù7âNV\räî)P¦5s¸cï#äù^¹›¥yë5ÑÈŞ&+`Ëª=óxæ9mº,ÊıwU¸]Ãó›™Û–”GF‘.–YQ4ñùÅÜ–RNJÁFÍ\ZEËoG×Ue}ñ²oì8Âªæoâá†¾«ê<t<£&€Æ-È‚†Ï[ğ#,ì=Éêê|ì¼g>ƒĞê÷ŞzvÓ´tÒÅ8mj¦U¹\0<­Ûo¸Ô”>fòQd«–ª\0K³êäÍ›Œl9ßo‚YğS 4¤Uş)^\'ÒÂ‰ªvüÌe>hÅqY^Xåw°°y~ìü1Tn²×€^«dtv\Z¸¼ü1#TlLf¨‡[é¥E\\éµü]Mg‡Ód³N÷Ü\\šj«MÌã`kq¥=µØMâË€¶	§w_ó€Ñûn61dÎ¤Ï©òÍ†\'¿ ,v¬ÓN¨´­(¢ ]°-âbZfŸÚ·ù%ĞÁ×«ãBjÕvæñ±ÄÉ€)¬ãºpS{†¾!Zú±7ÿ€Õ[ÑæåùÕU]ß.ëª(€ş‰ÔÙ8¥ùT®¯BŒÊN éé§ˆşİõT™ßÀ#Ä›nŠm‡sèæô._RKÒŞI§-»9fã®j) €Fz¤ÒlÑ¡™&ûMZêê§Ùö¥DqÆàïWP`Jn•˜§¥\Zä XCs¶“1BïÕ™±Å\Z™0Èã§›m³îƒÂ‡\n}Ğ\n:ö9Dƒ&FâïYúÛSKö²ë”@¶À¥îyI:Ùd³k‘ÌPËº§¤†±Ç‰‘:§ÃzÀ0ˆF2ÂûÎa\'!ĞQ4dÊ“¶öÖ¤ÀÀDã¦êÊ«\'r…XoçèÕ‡E-îÎ2[¤Ğ+’XF@S·mBñ±H8şpz„/P³Y çy6–IØYÚoŞüTş‚ÒbÌ^²¯À‹Â§«¼nZb¥G1{,[DŒwí âFSy{m?<(9°jXF‘³©¬7·oH„ŒÛµ¸¥¡(0µH‘ÌiNoH‘{ö_/~MOÎzsñÃ~„_>ÏÏ.PÜ(Uï“ş¶LAt•è™Î>WÍ.‘LÔY\rÙª3TºÊÂ(ÑÏó5áºA$0`×§ŞTÛ&ãíÔùB\0¢ ¹š|¹ğ½í`ø\raøÛmÛ\"ñ<<8tyã8Öwœà¸ÇzOôåZ;LÚ}ü´É`PØ©àrÛÜ±m\rú `Ù\"š*Û+`¼Â•Œ+…ÕMü¦ƒf=-ã`NTÛ\\¡b~*çiƒ†œõ•£\Zrã‡—EJÚÎ×zl/æê8gò`_Qù½m>‹TÈ)ó]µ]®Åá²—¬¤Ï!%kş”¹Õb“ÃÓäuæñé=ŠcW;×õH—‚\Z„Q_z(Ëe¦bØí#ò¾4õÊêÎê®6¹?[åËìÏáÿáá¨§Ÿ´QŠé¬±¾ëf	uò.¢l²šw Éî«\n´Ô¬ŒÇÕ\nU1hÅTHTfç	a„\n·“*T¹§ 6 ì“/Ô$áFûÇ¤æHL@«’$#Ô¾í³XÎ»ìfS$xÎ’Ïa™V&5ôS‰[~öÅ’Î½~9ÖÔD9°ËÎr9´ˆ1?dŸYƒc#\rÍßœÍN¹5¡ç›Ğ%2\nmåLN¹ñ¼B2\rb¹\Zìr\07µ«N°¼Ñ<M€•¬Ïe/{w´Of,Ck²oõ\roÜµƒ[kvÛ3²ºÚD™u©‡¥Ñ¯±—ÎŞ}Ow¸ıWYp§HÏ‰È!Ÿ\rğ=eL‡Uáı\Zi@²qÕ™ë„èU^Œå†Äƒ’:p	¹¬àšö†ö×›{°n¬*–ÕÛ £ã°´wL\'\'yND©¨Ç1ë{æBƒ\ZÄ˜	Ì‚Mi,6N4ãºäœ€Ù=Ä¾“b¡vgÈì)TñÛGœ¤eÒdAš¡L0û®ÅU¿½¾£º6·EWµÕ!ğAÂlâ ÎVòm— ÇqÍ–×—Õ\'5›+4æ3AäåfÛÌC˜ÆÚêêªÈ^H³j‘ê‡1ì%…°äK¬Š›ânA¾Ïd¶Sc£ô@‰W¨\Zs«,\"WéÚ§[#~	|L†ßÖİ\ry#iÅ{èÜ·Æ*ÛÜÿK9´i±dSæK<J_š_ğÙ¦>KZæ;GÔ9¶IÎ‘©C7¡±šG-ü`Ê,i‡FŠ¨ƒÙ~W	VØyLÀï†æğ®Ú€^tàÜ³³H¯jøÉ$H‰¸Lfg»pß-³óı’²778©6ÚB{B‘†2MÈÉmW©t÷8/ù\\¸Wlñ´ãZàİijÜÊné€«8·(q‰Z²V:©AèT·æüŒWŞVQŒd˜JFÓ® Ä¬ÈiOcüÓG<½«i<qO·ï7EÕ’1ÏxÔz×XÈ–);”)H^i6Q±]™Z`Ë`O©PÙ1 T<–¾é•y|LµÏÏ.Â‡şyz!œøc|ÖV0ŸÏù8SÜ!V¢CJGÌ©Êx6”¸\'C^åˆƒøÉ;9\"ÆÇ¹¯á+Ô£%3¿œãQ÷¤ øW;ÌÙ7ˆĞ‘iåi3S8ÉÓ]çÖGb™\"¡{X‡’>íÊ•TBå¿c¢å3\"\"& ¡y,3@ó˜åÓ¼mà.ÉWÓ\"lWñãê‡(yHÕÚÂ* zî?¦½Jšª@t\nø\'S\nŞgJ…s²¹RğOÏñ	!İí<·ŸJÎJÍ^ƒpİ \n Ed=FPˆW&(ì¾ö×x”¦öÒnªÍ¶ ƒäÎÁlÇ¾-NO¶\Zòúeÿd”%-ø):\r™:a’HÉ&±Ë.kÏ·mÅ7?¡IJ&?æË¼Èÿ%BwÊùóş£uµ¨dˆÛ¶\'Çn²Glu|È;$¦cUÒ¶?Kƒj84‡ãw¨5ãnHç3â(xoûjWCô•ã«‡Ô/äç²)L!ùMnªzŸĞ5Ã?ÄHú¹H°Ÿš†öq¾Õr#úÔN8\'°ğû‚sX©±©H™²vÊ¡íj] DËRã\0 $~8ã4¦¦1•Mn]a;ÕòOI,«¯âÙ&èö»ª*Ú|ÃŠ¶FİwaeG.Ô©\\o;¶¶ô¢–[s%·’ó«2ş“}\ZfÊqà©Sœ{›§í:>ûË)Y{q1yˆ\0àqğç!Kƒ¹ß‡ ©¶õ¥Ø,ôÅ0Ä÷\Zâ›ªõıãPß8P_}Ê–¼”÷~Xw0ZüÊ)à Ày6Í\0œİ0M25O¡Ø‚ÁœQû×ÓÓ9ö©×£4œâœù½#¨¨·‘J8$FJBôˆ¦:Â\"óMt)¼·i¨=—~jÇéQvb»Ç$\"~Lê$Í«>o¥ƒe	âœ tÊà©P’~Ø6­¶c‰šŒì”\r\\™;ëÊa²<Ù…\\H¬ôY&d²×éÙiøul9ÙÒ®³´¹lJF—LÌ[êKºÈİe\'oÊNó†#yê—¢T/; FÆ(xxàÿÜúW¦á=gÈA1‘5y|Ìª€îV ?‚ù£3¯Ì–äHhŸŠ›3yŞÁbqµZ¡8RÇºş$³u§À÷U#wE:¹UjRP–n6”®jÊ­n>Å‘´•x°yÔ%ğ;ûFIg£©ô<¼H*ÔàÆĞ‰\'ü7÷ûBÛ>õSeàovMjuÑŠU³\"ÃQÍ¸–C69÷¼«ÆœaKô[9z×²åh\ZD6\rLÎÂıJSd¯.˜“³ğÒLÒTè&«›	T,—CÎ”é]™ÜäK¼~à\\ÎF ÙÊµ¿Ú4±›s~}1§t´e_Ï;7~®³Ur9½ÜæEª½¤ÇTÃ¾S é½ˆƒ‚z;G>l	­0‘®1Ó¿Ä<ÕÌ¸˜|EEr	,DùƒçÓòw¼$è\\3ô\\Â=‡üqOf;.\"5ñ–‚“êÜùÇw+l!c“[‹{Ï= ßÅºµ]İTŒıL\rÓ¦åx¬s£N‹ØMXtVº™0ñöÕ\'c¶½ÌÍãõ:»£¨D“r¯¶öRîr[7UOÎÜÍD3·|„«rq™9n»&#+-İ\\ñ]µÜ6öİ‹å Tâ6t¨Ú2Ê²IsXl\n\0ÉœsY¥w\Zğ÷¢o‹jyİŒy˜<dÀ¡Ş´zÎå.¬3…KŸŸ÷”ê&]ğ^›–Ÿååº¿2ó°KæjõxHºš“!ş~Çg®ÉH©‰XÔÁÉ(ÍJ-8yL¢È0ÃnãK°ÁæœÒ\"D ÉÙR±5Âc‚R^<<¼x,°Û+Ãaˆ21ÈŸHÈ{î‰4ÄxY:Eëğz||$å~(˜°4¤øĞHİN½-€ÕŸ}úi¥Ì×äy2GP§{J=¨¹Ç‡Å‚$¼ŒshÇŞ…Á]´ëòˆ‹Iù8öõ§*RiüáaoAr›ğÆËÜÛ\\”)Wø$azÃÆƒˆ¢¬F˜´h«O/xœk¦lÂŠä«²:Š„Bs¶Ÿ¬µ;KZ¤ãÌm°”¶¸\rÎ†×	ùæ–Ö¸ådÄ¬¥8ö˜¢j\n–¶Òªì®S¦™V€Qò…æG‘8Åp	c]±ÇÇªÚQì\"Üœ¦ûìÛ:wÙ¸›}v1—i5\Z?ôùÃW5	ÖO¥_1r\ZFÅĞdyêí5ï0@]—i?áPÂˆ•õÕ©ÚÂdé×±á¨0€Bdª¬	mÔ§’ÖrĞ­ ûÂ½cr%úñ‹A¶¦Í¿Ó®Îä–ÅåaO™Ï’mÙ.nPµ9[û©-úìÜ[¹cóÔâûw¾hS8ºq¸Ñ.™ø/ƒn×™71ÁV&ÁIGV³1,ŸÈ ÿwÑ_Ş®«º]nÛqğ$á÷@ç£¶\Z¡6?’Û0cŠ×¨ä=’æOgtƒ®„	Àp	ƒÍ][Í)ó×g599¼Íïı!RĞ§\r0b±rp›ïçÓÛ<¹áÒ,¯ª‘:¸{ê°ÍûÀlúFş{:1ùœ^´V/Úu6\"¥oT­Frı¶y´¼W\\ŠÕ~AãÆ\rÉwi\r]zÕ’M=©GÙ§\r4N½Ã)¥y³)’»Ñ8Y¤â ê%Çˆ5\\ëáá¨«ê\ZÎüs„2C`şìwèÒ;1ÖV…œ&ªqİÃÑØ+XOuNYÉÅhèŞ,:ƒ„=7É07û¾ãØu€M	ú5«6îmƒ^Üõùğ-ña®‹G\'ä¤ƒô©®Ì¸JPõSôå¿òı:”&qîĞiêí9ù]ÈW®Ä»ìÓ¿pÜ-İ‰¬“¬Q½¼¼\ZİˆÛ3j7Ø	¤‘lÖ5,ş	F‡&³Æ|àQYŠÊÀ6Ş¾§)ıW‡išU@´ñJôN¼I}ÿ]p²\"—Ş—ãğ$ØñáÇ!4tìzÍ¾oó‚Â™¼UXü‹8Îç—hê16âL›íeÃâN#Ê–)Â3—Wç0¿î¾äc3èÔ¯å¯ep?‰%¸}h¬>Û·‡÷±Õù×áá±­ÈØbÈÃ òİ½õÕàU 3ÏÏ‹b¬çíÔp\rZ\n¡ıÜ…EÅ]íJFmEM1±µÔ¹Kº~íâóa›Kg>pƒÍŞ£Ú-Â\'ôÁï¤¢\0t^£K¬ÊK¹³‰î:Ö[uµEU>]ó¡$†÷T­¡|\\BdKw©8’BÊ.Úü&«‡aß‘ÜÅ5ıXó­c<´W!tã&4ºzqG®`yo6b\0:á\"‘!iÚ­ gIS´}Ô¬kŒ¢•ÌğÒjTËí—ßâÒ“4,¸ÑåÈ³ƒ«\Z÷„®ó\ZM8È‹Î‚ÜX%OLflcÌf²Û*ª6_ªq®õ¦jA<½©0ğÜ¶ -GÛ’-cªs˜Æ%ÃH Ùv¾:fyû¼m“å\Z×ò½7\\g|DºC=cQ£‡1±?iHí\Zy\"}9`` ¤ ˆ¶fÈjªi€ÃÊP×Åi¸(°Gqûé¡ºÉùR-½\r*×}o³Şæ,2Áó}®NWÉ(8	VÉ8mV—èy“—×£=Kİ›R°‹ËádÁÅÈO×ö!Äx³5y\\1Û™‹Ë\")¯¡¾îxh\0$Î‡Ò1™Š\Z\0®9}4^xÁŸƒ!h‘…>®=jn’¢]ÕÙ´Å¿	XX3Ğ£Ğ@>òupi¯ÅG°v‘§0RùkÊï\"À”H{Jp·ÂqÍ¹4‘=DvI`xJyE`¤öp²C1(ˆ€‘û>T‘§bt`CT=¥fÂƒfëˆšœÑßİ.â+êlø\Z·˜ÙùZØU\"È¹†ò-6Ğ•~}U#s’.Âµ¯”9Yw#®Qß;k•FYµæ–ö÷aW|,•Ìd€È¨ºs«¿L)Z/ğÀ;¿Úìì)<ÓêyOä)Ç½]Ë£èä¤äKt\Z±GË3G<R’ˆ´(û´,¶°’LùŒh$³!A¸3!†O#õèô1qg=zØõ9¾uI<Ô\Zß\\aúå,9ŞoÎ‰8T¶™dºÔh7ì’b§ˆG‡¾tœïüè]½âè¿S|7ã1´SğGØ·n÷bJ´Ö=¨’HwOC–ïĞ!·kiî‡É´k˜&şÂÅøC1/zÕaÓs0)Åb]Ã§•­sİH§‡	ç6»±b”éaG–şL°2€u³W¨³MÕà¥©»É²®š¦ÎÈ°±ì:Q«W–wšu“­¼î›“e,gäU=Å‹V¨°›1ÈÂ¯åtÄh@ÏîbªøÍÿ:›ı‡{ã-€ÉSH`ÍØ¹8¥qhWıÊ:\08ëË[¶56¦Q\Zÿ›\ZM¸X˜àBÁ\\ü}L_ğ9‡_”bVáÅM²‰ïËå, O bP|Ô¨à+áĞÃå%*:@ğ9&ršu°˜‹OP\nÜUÿ™\0çï›Ofj<Q¬K-Ñ(`¾Š]°_/+½}—™•g®ãš»-5é¸+œiŞãè[İÚã„(‡…êyBÇÕağùÓˆuøğøXùjuÜÔ´†#\'G0ØïÄéRš’1|Fæ<„èDĞÇóxğ†kV¾Ş±\\»±!˜TØQĞÄ²‘o@‡Ğ:¬ïƒşĞfïlº%˜eÒ¥å~wsY©7d§h€½éáAÒò²Ìj4BA|\0fø\'ÒD!vµ\"bÒÌ…:3Ÿ!ªÙ\0±Œıi/ã%V.|íÂf€ÏŸÕù˜/ÕäŸ//D¤—Çb;ƒ_óä6ÖIœ·ÎA8¢ÍDò„‡>ç}¼hÄp$Aõcz=Ró°†è±(¼öæ |<—gÎh¤\n¡Á{ÛÀÄ>ã‚Ï‚şq<ÃûıuQÉÌ{\rË0X…üØ.’ÆŒ·‰9Ñsá¶Â£ŞIuvC¯L0xÿ„jÙÎèpàùœœä»ÁE¾\Z—ºà¿cS¥eVâª¦½övÆêm=;K…ÕPç)Û \0Pk_ûñqç{…:×É3¹òÚ%ÕfáªëÊ«ÕËÁ8¾BåkQ–p°ä1”}¸&­;jQËòöGäÒTíIdVP¦*Ú”+j†î]Ûz ”ŒkG÷Èëö¯\'r˜[@õÍíkÌÿ”pj~\n›9nQ‚zä÷Õ“ÈÃİóµ?´&Ã\Zâå|Ã°·+¥Í0„óšNÌKü EŸÏ¦My\Zª8¾ª†„İ-^ª£xä†ÿà›şãöûäxİ~Bòåˆ-…ø¤ŞŠP´¨7¾Íu¾ù	Ô\r§\'¿T·Ö[e|x)WMá÷ñ1_(xÔıM‡ÕpïkZñåğrP–™ÀåØ}4¯UªĞø&”A©ËË&S‚„QêD<¤Š8`N³â@Ùfô0Óo	pÉ1£59ÚAhÜ8_¿Ô™v…0BY¦³èÔ)|x±•X1á	¢ºÜÀ*Õ‰{Àğvô\Zl…f6™Sîì¬ù,ªÇ\Z†[³Œ|º£rMÑÖ=”oĞ\\ó\"¾¨o½\\¾¹£ä´i£¦^F|€7àT‹Ø‹Öw³ëºˆ\Z-×ÄêP.êğ	`zëU KS§ô-¥˜êRB|É°œHV;£jk&iÂÖc¦NDj2ôEE|¿Íº©ã6Ï¼¸FË#Ñ!imcCó³éŞî¢í{÷f³5”§´ˆ›á3—ÎÃ2ŞèÆæMNÍŒ¤d#ëÂË´ŸÏpCta<9~£Ş©5-ªãqnåŸû rºxlˆ,S^I\\¨§^\ZÑ~ĞwçøÔ¶!^\0Àƒ&É†BëšßîÅå‰oHYïŒRì¹Ş,Øá;æTĞ@ø[İbjòVœ) ›÷s—®D\'å>¼I[‘îÆ“j«D¦—ê¾²òÕuıYtçCüä¶TO\ZÁï±\'Ğõ/	\\\\mâ‘¤ã±Ÿˆ~ûTã~l°º³Ø×˜š??EÎ¥6öEm×eCöšÕ/ê-ñašbø¥{MSúUÊTC58d$s¼â™YC®¢Óc´4ãT«ÈŠˆ:án£7\0ÿRÃi¶—7y{Àp¾7q@ç¸ı®®n¾«êOİ|ÒuXóëŒìIè1XõKãY7„O ivÖ%}ƒ·½ô¯8°~0*‰¸Ò·we»ÆÀuo9ñÂ\r´jâ\\p³ Ü!-¨á¢ÊMy·«×³êT	{ñùĞ$0ØJGFså	›oLï™­Úo4u$–ÄÁÔ¾2nÍµ´7Ø:PÕ|„¨±Áv%i-^Ÿ\0äÆçyŸûoòqĞ7™e‡td¼WGbàõÌ·>²ftcÇÒc­*AÒh›Ù>+Š+Ò» êÃ½©çZ_>åªÑÙ\'×e†]RÌœœP²Yv4Ğã97Ë£b,ÑCÅ‘şòÕÈV3º½	7·K˜^©ıÓ7ºòö)ú7,#U…ªú´V(_P[&P­ÕZ+]Uµ6)óÕø$Í”Uq|]óÛms×GÁfÇ!Î¶Ò‚(í<˜x€Àç°Ö\\²Ä¾×Ÿİ>uŸ7oŞ³‡®#ª®{Ä\ZB]W	¶ÏY¹”¿ã¶†1ÄÖ$a?ŸrõAâ²¦Âö%É>åe@OÙ‡BòSvñ§ßZ&KNQ5™•Ç\Z‡ÙRè{D*ŒìĞ(\\óÕÀ jW½>)­\ZW5¶)9“™È¡†l1€–qÇÈTf:Ñ>’§»§`¯_QÒÂ]9S~éÕÖdv‘Ôî‰\nêõ“Ÿ;ø£ºXã(nHG›8òSìhİ ªôaºÚ›äiõ*o8ÄjtÔéÈ!ÕiÿE@è¡Ê¨Ò\".K¥˜“å1ÅÏÓ!v;eE»£pa±6Ú;Q~˜×y@²R|”‹£u‰ß€#ï-ñ\"‰Ä@İô¿ĞÖ;õ°±Åq6ÚÑoŠÆ-pµT‹4iÅ’ÆÒe¤“¯YÎzfx(@\rŒ-ø¨³\n±Y¹Á?ˆ¦m\\Û.øœ`ñ²ÆÖ9Ë“br™Ã\r²Æ»Ë®\nñ-êÆßÚ£Ù”ÃºáMˆÊÄ	Mf@~ø\0 ?|ø\nóÄ}ı\r‹ŸøÀ1òâk­ARÎ•ûB‡™îé CÛ{$¦ 6×	¤ñÙ‰¢½?ÆÌ£Q\nÜ£@ÓŒ\nÄ[½àÁJ4Ë’Ä^ì  uÆşÄµu(Î\ruºÚPÀR/úfJJõ<a{Ö\rnŠ»JgeİÀ|.6^•|(f®F¨P9şöşõ?_Êş2ô@Ø%ÈzeK>\'ô¡Êõ~r/ §ìrl„LI„Ñ4á¹SÁ¦Iüv÷T³ÛÃ§ ÎKH_x3&We‰\0nL0{ï8ñ! 4/çØúDN~UrmQƒì£nIGdM—¨C‘ÒLãŒÑd¦¯ÏÒ³ŠZYÅıX)® z!=>Lr\'¿Ë¶CÍ<m‡Ú‡’Ş0ßë‡%õrzı2ÜjãQa:t\'ÿì\\t:xöqk7œ+z#lñ¥pŠaòd|‹£l”—£—Êá8\rL{@¼ÿåu”J@ öF e”iRĞÆŸ«7:…ê“Åæóf —è¡yƒ^ÄæŠ•Ç& ¦>3c{‹dÇÁÙvC{hIşßBÄ&ñŒU@R\rK%¯Î$¦çÁó!ã–M0ì7PÍ‰ãı‰À,gÂ:3±ê&£W’«÷Ññ†\\Uâ{Õ‰™Âœ1»ºuğ¬Éêù2k©zÏ`î	Tkµ‰ëª×SUY\"wj<îŒz0J,z1>Ÿ€Ùf[{¨ÕîP£çÍá(ÕÍkœj8 U×<«t=ÕÕÿ¼ºHô–}R·˜àƒT²ôß‚R1ú%¹áUÆÑøÈ	ÕúÇb]ÎÁ è|¾)ö\ZìB³Ìğ|!G	©Éï\'ˆ\nçT¾EïĞµT~Aºõ¶Îz«ë\\Áš±f )_é†(ß•º÷•^!âkÅºÑ?¢?TÉçâŒãR3á÷yQŒ^h<—¹0/¤q£8öww?q)Ûß_õì÷Æ_VçG8šrÏŠôTÃ\'œ¶|‘2wiÿ‘Â}2I¥9’(fiƒoaj¸z¸H0°[èpw’©ïË|•gø–«~ã¨Ötye|káòn‚ÿ	Ê0õz´Ç6}™ ØªÅ#SÉÑ:r+)\rÚÑ;Ru`ˆa Ÿ™]­[(6S‹æë3²f|ùjüÄ<jaP#PNÈáht›·ëİ9ı©ìO£Û¤ÑÃ>Ègş$/†[]9	¦\n,ïE»á8>³tHÊ¡G†)u¹ûn“‡Íaó4¿âP‚ÖŞyQ¶ÌA:tG4šÒ½MVh÷Ğ{¹ÿ07 íA8ğŠeï.ÚÙHFz?úH¤BK{~º]åQÒ®nŞç;)£VD½£øÌ¿;\rdàÆSØÁ½2Í¹Ş)«¹·>äÆ‘Z1¶’êxÇÔXmq2OøS¼ØÙ£É‚H4¦ëÀ‹¥P„rBùŞ-i·¨N˜€¨¢¼Çm•øCÇiì¨ûmš/s!² <-°­\n·5ä0|hH\\_ÉÌŠÖ¡ñ•+;tß£ûö¶“Nå2`ª´Û’ı‰°“úá®É*esDíŸ>Dìd˜Ò„şÙÛæsëb‡/Prçä>-]¿á$Oi0ã\0å…{5ÅÓ.ö14¼(”t€d¾ñwIşÒ³=Ï{4¬ˆ»w><YÏÿyzòÌ‹T\'òzŒñ6§­pr‹GÏîğ·\\ã¹9ÆÍ:_µ?ºñùä£s+>ô…Ã²Œ)²œ|×b‰F³SjÈw™L¶Í·w$eÜê.ÁPeŸ`(/\'\0ÚÈÇ¸­~¨n³úEÒğ‹	¿Ø*N•æĞœû¬ªËüû¥h¤4½ñ“ı@4k¿ã©Ó·ò~fb…±sæ¬œAÅÛÇvco[Ñ½ÀŠ6°‡áîxD¿CmŒû~àîø>Îıh[·‹Î©A•“¢q{àÉÍõõŞ\'ß·°a–›ë½Õ¶äºØæîKâ½¾çaóîS`}Ëßz•»—‘_gw±7,«ëEßNè»ÿ`çG\0OÇÑqµ‹½Å«Û´óÈTj”æãã6=>¶Ş£MC¼\\bÚ%=¶Ï!\r’©Oêè¤«³©¸5Şc4ûjíJ¬ò ÿdkŠ ¿ÅuÅ»r¾¯İpzCîàİ[ q35ôE¾Ó‡şÛò„=ÜêK¾×†İ]ã*ƒlãı/¯åqqõ©³W*c%I G´Y³I–ç˜odVÛ1L<eê³ÜÂWŸ’­öàœ«¾$“÷òÔ9ıï¬++Í9WßPA¦[.³Ùi„5òÛQ*SXª\"Kä_f`:Ë>Ò5C‘om(µïÍ8§ÄÊ\0Ğ½ 2²GˆDÖ+W·5\'iŸ•ë_®SOä¾¢5Ø°C\ZÓDŠC}¿–öÄç®:`ŸË¶ñÏ®Ÿ¿L(éYÊÉ…§êädnLuqĞÊØˆrB»;iÜïè¡\'¸Ï`Úëb¥œG#·O¡Z3d)•¬»ÕŞ;İE®ûï=~|øT®>»ÈŒâN´uBm9ÔZ\\Áæ¸¸vìĞÃhå|ÈÓß¹s,í(üêr8J4WtÇo¹ØCè\n\n–ƒÍG}7åÿ+³/¾ê¶\r\r$Ô4ûrÜ©|Èµ×Œ;[½PÌ¼iprGƒÓP¯œázß€ûë)¿O÷A¹BÄ6PÙ\rI*8˜Èoœ`\nŸr¿FA”,–À63ïÎ±äÒ§7ÑöãfìØsÌ6\'çt^\'W7ætù˜«õ¼kê²š~M‰{vŸ¾\'\n\0œ‰Š··wïvIŒ®±Aag®ÀuŠˆßjÕ¼€g\0­ÖU/,«ïyá‡*øŞ˜ÊĞ¤ªp¨°jßˆ4lK€ÔËïÑıv‡ÆÚáb=—@Q´kµ&²Ä»¯Ø<vË’òø÷4ÊÕÊ€«×`^·´^LZ„V­oïö­bR Tíûr<}o3G`çZIs¹ÔUKPÕ`‚Q¿ñt\n\rTxQJ†ç˜dÁ¡_´‡µ}İV› ü†?frºÍ;o‘j/ªÅƒWgÉ¦>R¾÷TM­evßâ5¬«R›ú¤Õ”7®÷¾şkTßN»=€¼†Me¦}¥¼õS÷%?½QN®ø†Å*Dë±˜y¾Ò©G±§õ˜€bÓ\nûeébS¯ù…”£È¾dÏP×Î „ò¼2Ep]c¼\\«Pšß¸e^ŠåHÊ4-ìïâÿñ?9bj™%õ(,K¦w_Å\\&4.ñYkSâDõfz~Í5¡ÙéİD*Ú7œ»ãú¹jœ0ÅR®Ûñü¦¯ÜMÆcz36¦wÏşZA.©°é÷Øt\\—K3;Pá÷Wª¶<g‚¬3ĞU{´:*\rŠuëÖ®µoA—š¶Ó	êtÅ²ŒomÄãi†yĞ3ÒyîgvƒD¬ò)2è‘7<v;%±Ø®=ú.²Ù·Õ–•	öğæ–5‡¾íæ£ñTTpô2¢^ûa\"tóëcVÍ¯Jœ€Gın\"vø¤{ËMİôé/{ÀÑ†çİ­‰…AÙÔÔÏ¤ôİ*Ã6”«¦Æ4ÛU´2+°-á×íU\'Z8	ô—âc3ºñóô\r-{ıU™­\"¡óÙoGäú²Ô>¦Ïö# Õ^b¿Õö\0',1455342710,NULL),(10,'HhYIPhwICdgu','phabricator:celerity:/res/phabricator/db7e9c40/rsrc/css/application/conf-FF0yol9jSjnp','deflate','•TÑ®¢0ü³½EÑò´Wå?ZZ ÙÒ’¶¬ì’ûï[´U\\wCbLÚÎÌ™sæ|hjÚ0­[\n0Ê”J¶‚ô\r\"„‰Fë¦Â¯÷š®(ç}:paÄT0Ù…M—ÖH•LÀhg ÖHïM‡†«¢(R,¡\nFö²–œ‘`õ™³Ó÷t&Ş[ÈñPˆ°VÃMÓy˜AÓÏœÏ\"ƒ0§ı(0\nÃo3X.9G¦pşóRÊ^`ªŞĞÎ\0ÄY) beeÒ‘c3P8Efûìÿ©ÎE\"ÒÿÿÓFÍ\rxÏÙ¾ëEİò\'U—ĞÁ§fÆôÖ=© æö¥÷üüy>Ï7†¡1ñ£LZ÷…\\èàÄ’À˜ĞFµ¹aRèñªf¿)Œ,RêfÊ™  \ZÖÃ.\ZÀÒY/x1P€³ŒÄƒ×šÆêWy¸9¬±OB°§òN1’¼–4âù^TÓ™/ŞÅÇíñníì¼êtlÜÚëo€AŒOáF6ĞõfÚ™V{Œ¯\rñ*÷ë”mOq:•‚ód¿IFÔ;x}€¦F8Qğl¸Š¾ƒ’bø9`’Q$Ãç›®±v¨9-¼Ó9*°b„Pqo7Tİ~Új·Hï{õ*­®‰QTlRgåTªÜöîœe<†d*v}Ø‡øğÎÚ\\Š‚•OÎúnù´hvíÍd´¾.~›Imµ˜_Ü.Y¦rN}Bq[ºÓµwb=DüiÃNú“8I’Ó×',1455342719,NULL);
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
INSERT INTO `cache_markupcache` VALUES (1,'fo7P4TuH2YZr:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-note\"><span class=\"remarkup-note-word\">NOTE:</span> Any user who can browse to this install&#039;s login page will be able to register a Phabricator account. To restrict who can register an account, configure 1Z.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:103:\"<a href=\"/config/edit/auth.email-domains/\" class=\"remarkup-link\" target=\"_blank\">auth.email-domains</a>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1455342727,1455342727),(2,'rVwVLSGl.Y9K:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-warning\">Examine the table below for information on how password hashes will be stored in the database.</div>\n\n\n\n<div class=\"remarkup-note\">You can select a minimum password length by setting 1Z in configuration.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:68:\"<tt class=\"remarkup-monospaced\">account.minimum-password-length</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1455342727,1455342727),(3,'nHato9WQIj8d:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:3488:\"<p>When a user types their LDAP username and password into Phabricator, Phabricator can either bind to LDAP with those credentials directly (which is simpler, but not as powerful) or bind to LDAP with anonymous credentials, then search for record matching the supplied credentials (which is more complicated, but more powerful).</p>\n\n<p>For many installs, direct binding is sufficient. However, you may want to search first if:</p>\n\n<ul class=\"remarkup-list\">\n<li class=\"remarkup-list-item\">You want users to be able to login with either their username     or their email address.</li>\n<li class=\"remarkup-list-item\">The login/username is not part of the distinguished name in     your LDAP records.</li>\n<li class=\"remarkup-list-item\">You want to restrict logins to a subset of users (like only     those in certain departments).</li>\n<li class=\"remarkup-list-item\">Your LDAP server is configured in some other way that prevents     direct binding from working correctly.</li>\n</ul>\n\n<p><strong>To bind directly</strong>, enter the LDAP attribute corresponding to the login name into the <strong>Search Attributes</strong> box below. Often, this is something like 1Z or 2Z. This is the simplest configuration, but will only work if the username is part of the distinguished name, and won&#039;t let you apply complex restrictions to logins.</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Direct Binding</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p><strong>To search first</strong>, provide an anonymous username and password below (or check the <strong>Always Search</strong> checkbox), then enter one or more search queries into this field, one per line. After binding, these queries will be used to identify the record associated with the login name the user typed.</p>\n\n<p>Searches will be tried in order until a matching record is found. Each query can be a simple attribute name (like 3Z or 4Z), which will search for a matching record, or it can be a complex query that uses the string 5Z to represent the login name.</p>\n\n<p>A common simple configuration is just an attribute name, like 6Z, which will work the same way direct binding works:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Example</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p>A slightly more complex configuration might let the user login with either their login name or email address:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Match Several Attributes</div><pre class=\"remarkup-code\">mail\nsn</pre></div>\n\n<p>If your LDAP directory is more complex, or you want to perform sophisticated filtering, you can use more complex queries. Depending on your directory structure, this example might allow users to login with either their email address or username, but only if they&#039;re in specific departments:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Complex Example</div><pre class=\"remarkup-code\">(&amp;(mail=${login})(|(departmentNumber=1)(departmentNumber=2)))\n(&amp;(sn=${login})(|(departmentNumber=1)(departmentNumber=2)))</pre></div>\n\n<p>All of the attribute names used here are just examples: your LDAP server may use different attribute names.</p>\";}s:7:\"storage\";a:6:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"2Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:40:\"<tt class=\"remarkup-monospaced\">uid</tt>\";}s:3:\"3Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"4Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:41:\"<tt class=\"remarkup-monospaced\">mail</tt>\";}s:3:\"5Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:45:\"<tt class=\"remarkup-monospaced\">${login}</tt>\";}s:3:\"6Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1455342734,1455342734),(4,'.4EOg8Xw88WD:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:189:\"<p>To search for an LDAP record before authenticating, either check the <strong>Always Search</strong> checkbox or enter an anonymous username and password to use to perform the search.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1455342734,1455342734),(5,'2SwALNO6Yg70:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:315:\"<p>Optionally, specify a username attribute to use to prefill usernames when registering a new account. This is purely cosmetic and does not affect the login process, but you can configure it to make sure users get the same default username as their LDAP username, so usernames remain consistent across systems.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1455342734,1455342734),(6,'H_JFmx5tn1ir:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:253:\"<p>Optionally, specify one or more comma-separated attributes to use to prefill the &quot;Real Name&quot; field when registering a new account. This is purely cosmetic and does not affect the login process, but can make registration a little easier.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"phabricator\"}',1455342734,1455342734);
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
INSERT INTO `daemon_log` VALUES (1,'PhabricatorRepositoryPullLocalDaemon','phabricator',32,'[]','[]',1455342656,1455342783,'exit','phd','32:dx3p7biio'),(2,'PhabricatorTriggerDaemon','phabricator',32,'[]','[]',1455342656,1455342783,'exit','phd','32:ik3uye22l'),(3,'PhabricatorTaskmasterDaemon','phabricator',32,'[]','[]',1455342656,1455342783,'exit','phd','32:66xc65jke'),(4,'PhabricatorTaskmasterDaemon','phabricator',32,'[]','[]',1455342732,1455342749,'exit','phd','32:hgx677bqd');
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
INSERT INTO `daemon_logevent` VALUES (1,1,'INIT','Starting process.',1455342656),(2,2,'INIT','Starting process.',1455342656),(3,3,'INIT','Starting process.',1455342656),(4,3,'STDE','[2016-02-13 05:52:10] EXCEPTION: (PhutilProxyException) Permanent failure while executing Task ID 6. {>} (PhabricatorWorkerPermanentFailureException) Task has no transaction PHIDs! at [<phabricator>/src/applications/transactions/worker/PhabricatorApplicationTransactionPublishWorker.php:89]\narcanist(), phabricator(), phutil()\n  #0 <#2> PhabricatorApplicationTransactionPublishWorker::loadTransactions(PhabricatorAuthProviderConfig) called at [<phabricator>/src/applications/transactions/worker/PhabricatorApplicationTransactionPublishWorker.php:19]\n  #1 <#2> PhabricatorApplicationTransactionPublishWorker::doWork() called at [<phabricator>/src/infrastructure/daemon/workers/PhabricatorWorker.php:122]\n  #2 <#2> PhabricatorWorker::executeTask() called at [<phabricator>/src/infrastructure/daemon/workers/storage/PhabricatorWorkerActiveTask.php:171]\n  #3 <#2> PhabricatorWorkerActiveTask::executeTask() called at [<phabricator>/src/infrastructure/daemon/workers/PhabricatorTaskmasterDaemon.php:22]\n  #4 PhabricatorTaskmasterDaemon::run() called at [<phutil>/src/daemon/PhutilDaemon.php:183]\n  #5 PhutilDaemon::execute() called at [<phutil>/scripts/daemon/exec/exec_daemon.php:125]',1455342730),(5,3,'FAIL','Process exited with error 255',1455342730),(6,3,'WAIT','Waiting to restart process.',1455342730),(7,4,'INIT','Starting process.',1455342733),(8,3,'INIT','Starting process.',1455342735),(9,4,'DONE','Process exited normally.',1455342749),(10,1,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1455342783),(11,2,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1455342783),(12,3,'DONE','(2) Graceful shutdown in response to signal 2 (SIGINT).',1455342783),(13,1,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1455342783),(14,2,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1455342783),(15,3,'RELO','(1) Reloading in response to signal 1 (SIGHUP).',1455342783),(16,1,'DONE','Process exited normally.',1455342783),(17,3,'DONE','Process exited normally.',1455342783),(18,2,'DONE','Process exited normally.',1455342783);
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
INSERT INTO `patch_status` VALUES ('phabricator:000.project.sql',1453226118,NULL),('phabricator:0000.legacy.sql',1453226118,NULL),('phabricator:001.maniphest_projects.sql',1453226118,NULL),('phabricator:002.oauth.sql',1453226118,NULL),('phabricator:003.more_oauth.sql',1453226118,NULL),('phabricator:004.daemonrepos.sql',1453226118,NULL),('phabricator:005.workers.sql',1453226118,NULL),('phabricator:006.repository.sql',1453226118,NULL),('phabricator:007.daemonlog.sql',1453226118,NULL),('phabricator:008.repoopt.sql',1453226118,NULL),('phabricator:009.repo_summary.sql',1453226118,NULL),('phabricator:010.herald.sql',1453226118,NULL),('phabricator:011.badcommit.sql',1453226118,NULL),('phabricator:012.dropphidtype.sql',1453226118,NULL),('phabricator:013.commitdetail.sql',1453226118,NULL),('phabricator:014.shortcuts.sql',1453226118,NULL),('phabricator:015.preferences.sql',1453226118,NULL),('phabricator:016.userrealnameindex.sql',1453226118,NULL),('phabricator:017.sessionkeys.sql',1453226118,NULL),('phabricator:018.owners.sql',1453226118,NULL),('phabricator:019.arcprojects.sql',1453226118,NULL),('phabricator:020.pathcapital.sql',1453226118,NULL),('phabricator:021.xhpastview.sql',1453226118,NULL),('phabricator:022.differentialcommit.sql',1453226118,NULL),('phabricator:023.dxkeys.sql',1453226118,NULL),('phabricator:024.mlistkeys.sql',1453226118,NULL),('phabricator:025.commentopt.sql',1453226118,NULL),('phabricator:026.diffpropkey.sql',1453226118,NULL),('phabricator:027.metamtakeys.sql',1453226118,NULL),('phabricator:028.systemagent.sql',1453226118,NULL),('phabricator:029.cursors.sql',1453226118,NULL),('phabricator:030.imagemacro.sql',1453226118,NULL),('phabricator:031.workerrace.sql',1453226118,NULL),('phabricator:032.viewtime.sql',1453226118,NULL),('phabricator:033.privtest.sql',1453226118,NULL),('phabricator:034.savedheader.sql',1453226118,NULL),('phabricator:035.proxyimage.sql',1453226118,NULL),('phabricator:036.mailkey.sql',1453226119,NULL),('phabricator:037.setuptest.sql',1453226119,NULL),('phabricator:038.admin.sql',1453226119,NULL),('phabricator:039.userlog.sql',1453226119,NULL),('phabricator:040.transform.sql',1453226119,NULL),('phabricator:041.heraldrepetition.sql',1453226119,NULL),('phabricator:042.commentmetadata.sql',1453226119,NULL),('phabricator:043.pastebin.sql',1453226119,NULL),('phabricator:044.countdown.sql',1453226119,NULL),('phabricator:045.timezone.sql',1453226119,NULL),('phabricator:046.conduittoken.sql',1453226119,NULL),('phabricator:047.projectstatus.sql',1453226119,NULL),('phabricator:048.relationshipkeys.sql',1453226119,NULL),('phabricator:049.projectowner.sql',1453226119,NULL),('phabricator:050.taskdenormal.sql',1453226119,NULL),('phabricator:051.projectfilter.sql',1453226119,NULL),('phabricator:052.pastelanguage.sql',1453226119,NULL),('phabricator:053.feed.sql',1453226119,NULL),('phabricator:054.subscribers.sql',1453226119,NULL),('phabricator:055.add_author_to_files.sql',1453226119,NULL),('phabricator:056.slowvote.sql',1453226119,NULL),('phabricator:057.parsecache.sql',1453226119,NULL),('phabricator:058.missingkeys.sql',1453226119,NULL),('phabricator:059.engines.php',1453226120,NULL),('phabricator:060.phriction.sql',1453226120,NULL),('phabricator:061.phrictioncontent.sql',1453226120,NULL),('phabricator:062.phrictionmenu.sql',1453226120,NULL),('phabricator:063.pasteforks.sql',1453226120,NULL),('phabricator:064.subprojects.sql',1453226120,NULL),('phabricator:065.sshkeys.sql',1453226120,NULL),('phabricator:066.phrictioncontent.sql',1453226120,NULL),('phabricator:067.preferences.sql',1453226120,NULL),('phabricator:068.maniphestauxiliarystorage.sql',1453226120,NULL),('phabricator:069.heraldxscript.sql',1453226120,NULL),('phabricator:070.differentialaux.sql',1453226120,NULL),('phabricator:071.contentsource.sql',1453226120,NULL),('phabricator:072.blamerevert.sql',1453226120,NULL),('phabricator:073.reposymbols.sql',1453226120,NULL),('phabricator:074.affectedpath.sql',1453226120,NULL),('phabricator:075.revisionhash.sql',1453226120,NULL),('phabricator:076.indexedlanguages.sql',1453226120,NULL),('phabricator:077.originalemail.sql',1453226120,NULL),('phabricator:078.nametoken.sql',1453226120,NULL),('phabricator:079.nametokenindex.php',1453226120,NULL),('phabricator:080.filekeys.sql',1453226120,NULL),('phabricator:081.filekeys.php',1453226120,NULL),('phabricator:082.xactionkey.sql',1453226120,NULL),('phabricator:083.dxviewtime.sql',1453226120,NULL),('phabricator:084.pasteauthorkey.sql',1453226120,NULL),('phabricator:085.packagecommitrelationship.sql',1453226120,NULL),('phabricator:086.formeraffil.sql',1453226120,NULL),('phabricator:087.phrictiondelete.sql',1453226120,NULL),('phabricator:088.audit.sql',1453226120,NULL),('phabricator:089.projectwiki.sql',1453226120,NULL),('phabricator:090.forceuniqueprojectnames.php',1453226120,NULL),('phabricator:091.uniqueslugkey.sql',1453226120,NULL),('phabricator:092.dropgithubnotification.sql',1453226120,NULL),('phabricator:093.gitremotes.php',1453226120,NULL),('phabricator:094.phrictioncolumn.sql',1453226120,NULL),('phabricator:095.directory.sql',1453226120,NULL),('phabricator:096.filename.sql',1453226120,NULL),('phabricator:097.heraldruletypes.sql',1453226120,NULL),('phabricator:098.heraldruletypemigration.php',1453226120,NULL),('phabricator:099.drydock.sql',1453226120,NULL),('phabricator:100.projectxaction.sql',1453226120,NULL),('phabricator:101.heraldruleapplied.sql',1453226120,NULL),('phabricator:102.heraldcleanup.php',1453226120,NULL),('phabricator:103.heraldedithistory.sql',1453226120,NULL),('phabricator:104.searchkey.sql',1453226120,NULL),('phabricator:105.mimetype.sql',1453226120,NULL),('phabricator:106.chatlog.sql',1453226120,NULL),('phabricator:107.oauthserver.sql',1453226120,NULL),('phabricator:108.oauthscope.sql',1453226120,NULL),('phabricator:109.oauthclientphidkey.sql',1453226120,NULL),('phabricator:110.commitaudit.sql',1453226121,NULL),('phabricator:111.commitauditmigration.php',1453226121,NULL),('phabricator:112.oauthaccesscoderedirecturi.sql',1453226121,NULL),('phabricator:113.lastreviewer.sql',1453226121,NULL),('phabricator:114.auditrequest.sql',1453226121,NULL),('phabricator:115.prepareutf8.sql',1453226121,NULL),('phabricator:116.utf8-backup-first-expect-wait.sql',1453226122,NULL),('phabricator:117.repositorydescription.php',1453226122,NULL),('phabricator:118.auditinline.sql',1453226122,NULL),('phabricator:119.filehash.sql',1453226123,NULL),('phabricator:120.noop.sql',1453226123,NULL),('phabricator:121.drydocklog.sql',1453226123,NULL),('phabricator:122.flag.sql',1453226123,NULL),('phabricator:123.heraldrulelog.sql',1453226123,NULL),('phabricator:124.subpriority.sql',1453226123,NULL),('phabricator:125.ipv6.sql',1453226123,NULL),('phabricator:126.edges.sql',1453226123,NULL),('phabricator:127.userkeybody.sql',1453226123,NULL),('phabricator:128.phabricatorcom.sql',1453226123,NULL),('phabricator:129.savedquery.sql',1453226123,NULL),('phabricator:130.denormalrevisionquery.sql',1453226123,NULL),('phabricator:131.migraterevisionquery.php',1453226123,NULL),('phabricator:132.phame.sql',1453226123,NULL),('phabricator:133.imagemacro.sql',1453226123,NULL),('phabricator:134.emptysearch.sql',1453226123,NULL),('phabricator:135.datecommitted.sql',1453226123,NULL),('phabricator:136.sex.sql',1453226123,NULL),('phabricator:137.auditmetadata.sql',1453226123,NULL),('phabricator:138.notification.sql',1453226123,NULL),('phabricator:20121209.pholioxactions.sql',1453226124,NULL),('phabricator:20121209.xmacroadd.sql',1453226124,NULL),('phabricator:20121209.xmacromigrate.php',1453226124,NULL),('phabricator:20121209.xmacromigratekey.sql',1453226124,NULL),('phabricator:20121220.generalcache.sql',1453226124,NULL),('phabricator:20121226.config.sql',1453226124,NULL),('phabricator:20130101.confxaction.sql',1453226124,NULL),('phabricator:20130102.metamtareceivedmailmessageidhash.sql',1453226124,NULL),('phabricator:20130103.filemetadata.sql',1453226124,NULL),('phabricator:20130111.conpherence.sql',1453226124,NULL),('phabricator:20130127.altheraldtranscript.sql',1453226124,NULL),('phabricator:20130131.conpherencepics.sql',1453226124,NULL),('phabricator:20130201.revisionunsubscribed.php',1453226124,NULL),('phabricator:20130201.revisionunsubscribed.sql',1453226124,NULL),('phabricator:20130214.chatlogchannel.sql',1453226124,NULL),('phabricator:20130214.chatlogchannelid.sql',1453226124,NULL),('phabricator:20130214.token.sql',1453226124,NULL),('phabricator:20130215.phabricatorfileaddttl.sql',1453226124,NULL),('phabricator:20130217.cachettl.sql',1453226124,NULL),('phabricator:20130218.longdaemon.sql',1453226124,NULL),('phabricator:20130218.updatechannelid.php',1453226124,NULL),('phabricator:20130219.commitsummary.sql',1453226124,NULL),('phabricator:20130219.commitsummarymig.php',1453226124,NULL),('phabricator:20130222.dropchannel.sql',1453226124,NULL),('phabricator:20130226.commitkey.sql',1453226124,NULL),('phabricator:20130304.lintauthor.sql',1453226124,NULL),('phabricator:20130310.xactionmeta.sql',1453226124,NULL),('phabricator:20130317.phrictionedge.sql',1453226124,NULL),('phabricator:20130319.conpherence.sql',1453226124,NULL),('phabricator:20130319.phabricatorfileexplicitupload.sql',1453226124,NULL),('phabricator:20130320.phlux.sql',1453226124,NULL),('phabricator:20130321.token.sql',1453226124,NULL),('phabricator:20130322.phortune.sql',1453226124,NULL),('phabricator:20130323.phortunepayment.sql',1453226124,NULL),('phabricator:20130324.phortuneproduct.sql',1453226124,NULL),('phabricator:20130330.phrequent.sql',1453226124,NULL),('phabricator:20130403.conpherencecache.sql',1453226124,NULL),('phabricator:20130403.conpherencecachemig.php',1453226124,NULL),('phabricator:20130409.commitdrev.php',1453226124,NULL),('phabricator:20130417.externalaccount.sql',1453226124,NULL),('phabricator:20130423.conpherenceindices.sql',1453226125,NULL),('phabricator:20130423.phortunepaymentrevised.sql',1453226125,NULL),('phabricator:20130423.updateexternalaccount.sql',1453226124,NULL),('phabricator:20130426.search_savedquery.sql',1453226125,NULL),('phabricator:20130502.countdownrevamp1.sql',1453226125,NULL),('phabricator:20130502.countdownrevamp2.php',1453226125,NULL),('phabricator:20130502.countdownrevamp3.sql',1453226125,NULL),('phabricator:20130507.releephrqmailkey.sql',1453226125,NULL),('phabricator:20130507.releephrqmailkeypop.php',1453226125,NULL),('phabricator:20130507.releephrqsimplifycols.sql',1453226125,NULL),('phabricator:20130508.releephtransactions.sql',1453226125,NULL),('phabricator:20130508.releephtransactionsmig.php',1453226125,NULL),('phabricator:20130508.search_namedquery.sql',1453226125,NULL),('phabricator:20130513.receviedmailstatus.sql',1453226125,NULL),('phabricator:20130519.diviner.sql',1453226125,NULL),('phabricator:20130521.dropconphimages.sql',1453226125,NULL),('phabricator:20130523.maniphest_owners.sql',1453226125,NULL),('phabricator:20130524.repoxactions.sql',1453226125,NULL),('phabricator:20130529.macroauthor.sql',1453226125,NULL),('phabricator:20130529.macroauthormig.php',1453226125,NULL),('phabricator:20130530.macrodatekey.sql',1453226125,NULL),('phabricator:20130530.pastekeys.sql',1453226125,NULL),('phabricator:20130530.sessionhash.php',1453226125,NULL),('phabricator:20130531.filekeys.sql',1453226125,NULL),('phabricator:20130602.morediviner.sql',1453226125,NULL),('phabricator:20130602.namedqueries.sql',1453226125,NULL),('phabricator:20130606.userxactions.sql',1453226125,NULL),('phabricator:20130607.xaccount.sql',1453226125,NULL),('phabricator:20130611.migrateoauth.php',1453226125,NULL),('phabricator:20130611.nukeldap.php',1453226125,NULL),('phabricator:20130613.authdb.sql',1453226125,NULL),('phabricator:20130619.authconf.php',1453226125,NULL),('phabricator:20130620.diffxactions.sql',1453226125,NULL),('phabricator:20130621.diffcommentphid.sql',1453226125,NULL),('phabricator:20130621.diffcommentphidmig.php',1453226125,NULL),('phabricator:20130621.diffcommentunphid.sql',1453226125,NULL),('phabricator:20130622.doorkeeper.sql',1453226125,NULL),('phabricator:20130628.legalpadv0.sql',1453226125,NULL),('phabricator:20130701.conduitlog.sql',1453226125,NULL),('phabricator:20130703.legalpaddocdenorm.php',1453226125,NULL),('phabricator:20130703.legalpaddocdenorm.sql',1453226125,NULL),('phabricator:20130709.droptimeline.sql',1453226125,NULL),('phabricator:20130709.legalpadsignature.sql',1453226125,NULL),('phabricator:20130711.pholioimageobsolete.php',1453226126,NULL),('phabricator:20130711.pholioimageobsolete.sql',1453226126,NULL),('phabricator:20130711.pholioimageobsolete2.sql',1453226126,NULL),('phabricator:20130711.trimrealnames.php',1453226125,NULL),('phabricator:20130714.votexactions.sql',1453226125,NULL),('phabricator:20130715.votecomments.php',1453226125,NULL),('phabricator:20130715.voteedges.sql',1453226125,NULL),('phabricator:20130716.archivememberlessprojects.php',1453226126,NULL),('phabricator:20130722.pholioreplace.sql',1453226126,NULL),('phabricator:20130723.taskstarttime.sql',1453226126,NULL),('phabricator:20130726.ponderxactions.sql',1453226126,NULL),('phabricator:20130727.ponderquestionstatus.sql',1453226126,NULL),('phabricator:20130728.ponderunique.php',1453226126,NULL),('phabricator:20130728.ponderuniquekey.sql',1453226126,NULL),('phabricator:20130728.ponderxcomment.php',1453226126,NULL),('phabricator:20130731.releephcutpointidentifier.sql',1453226126,NULL),('phabricator:20130731.releephproject.sql',1453226126,NULL),('phabricator:20130731.releephrepoid.sql',1453226126,NULL),('phabricator:20130801.pastexactions.php',1453226126,NULL),('phabricator:20130801.pastexactions.sql',1453226126,NULL),('phabricator:20130802.heraldphid.sql',1453226126,NULL),('phabricator:20130802.heraldphids.php',1453226126,NULL),('phabricator:20130802.heraldphidukey.sql',1453226126,NULL),('phabricator:20130802.heraldxactions.sql',1453226126,NULL),('phabricator:20130805.pasteedges.sql',1453226126,NULL),('phabricator:20130805.pastemailkey.sql',1453226126,NULL),('phabricator:20130805.pastemailkeypop.php',1453226126,NULL),('phabricator:20130814.usercustom.sql',1453226126,NULL),('phabricator:20130820.file-mailkey-populate.php',1453226126,NULL),('phabricator:20130820.filemailkey.sql',1453226126,NULL),('phabricator:20130820.filexactions.sql',1453226126,NULL),('phabricator:20130820.releephxactions.sql',1453226126,NULL),('phabricator:20130826.divinernode.sql',1453226126,NULL),('phabricator:20130912.maniphest.1.touch.sql',1453226126,NULL),('phabricator:20130912.maniphest.2.created.sql',1453226126,NULL),('phabricator:20130912.maniphest.3.nameindex.sql',1453226126,NULL),('phabricator:20130912.maniphest.4.fillindex.php',1453226126,NULL),('phabricator:20130913.maniphest.1.migratesearch.php',1453226126,NULL),('phabricator:20130914.usercustom.sql',1453226126,NULL),('phabricator:20130915.maniphestcustom.sql',1453226126,NULL),('phabricator:20130915.maniphestmigrate.php',1453226126,NULL),('phabricator:20130915.maniphestqdrop.sql',1453226126,NULL),('phabricator:20130919.mfieldconf.php',1453226126,NULL),('phabricator:20130920.repokeyspolicy.sql',1453226126,NULL),('phabricator:20130921.mtransactions.sql',1453226126,NULL),('phabricator:20130921.xmigratemaniphest.php',1453226126,NULL),('phabricator:20130923.mrename.sql',1453226126,NULL),('phabricator:20130924.mdraftkey.sql',1453226126,NULL),('phabricator:20130925.mpolicy.sql',1453226126,NULL),('phabricator:20130925.xpolicy.sql',1453226126,NULL),('phabricator:20130926.dcustom.sql',1453226126,NULL),('phabricator:20130926.dinkeys.sql',1453226126,NULL),('phabricator:20130926.dinline.php',1453226126,NULL),('phabricator:20130927.audiomacro.sql',1453226126,NULL),('phabricator:20130929.filepolicy.sql',1453226126,NULL),('phabricator:20131004.dxedgekey.sql',1453226126,NULL),('phabricator:20131004.dxreviewers.php',1453226126,NULL),('phabricator:20131006.hdisable.sql',1453226126,NULL),('phabricator:20131010.pstorage.sql',1453226126,NULL),('phabricator:20131015.cpolicy.sql',1453226126,NULL),('phabricator:20131020.col1.sql',1453226126,NULL),('phabricator:20131020.harbormaster.sql',1453226126,NULL),('phabricator:20131020.pcustom.sql',1453226126,NULL),('phabricator:20131020.pxaction.sql',1453226126,NULL),('phabricator:20131020.pxactionmig.php',1453226126,NULL),('phabricator:20131025.repopush.sql',1453226127,NULL),('phabricator:20131026.commitstatus.sql',1453226127,NULL),('phabricator:20131030.repostatusmessage.sql',1453226127,NULL),('phabricator:20131031.vcspassword.sql',1453226127,NULL),('phabricator:20131105.buildstep.sql',1453226127,NULL),('phabricator:20131106.diffphid.1.col.sql',1453226127,NULL),('phabricator:20131106.diffphid.2.mig.php',1453226127,NULL),('phabricator:20131106.diffphid.3.key.sql',1453226127,NULL),('phabricator:20131106.nuance-v0.sql',1453226127,NULL),('phabricator:20131107.buildlog.sql',1453226127,NULL),('phabricator:20131112.userverified.1.col.sql',1453226127,NULL),('phabricator:20131112.userverified.2.mig.php',1453226127,NULL),('phabricator:20131118.ownerorder.php',1453226127,NULL),('phabricator:20131119.passphrase.sql',1453226127,NULL),('phabricator:20131120.nuancesourcetype.sql',1453226127,NULL),('phabricator:20131121.passphraseedge.sql',1453226127,NULL),('phabricator:20131121.repocredentials.1.col.sql',1453226127,NULL),('phabricator:20131121.repocredentials.2.mig.php',1453226127,NULL),('phabricator:20131122.repomirror.sql',1453226127,NULL),('phabricator:20131123.drydockblueprintpolicy.sql',1453226127,NULL),('phabricator:20131129.drydockresourceblueprint.sql',1453226127,NULL),('phabricator:20131204.pushlog.sql',1453226127,NULL),('phabricator:20131205.buildsteporder.sql',1453226127,NULL),('phabricator:20131205.buildstepordermig.php',1453226127,NULL),('phabricator:20131205.buildtargets.sql',1453226127,NULL),('phabricator:20131206.phragment.sql',1453226127,NULL),('phabricator:20131206.phragmentnull.sql',1453226127,NULL),('phabricator:20131208.phragmentsnapshot.sql',1453226127,NULL),('phabricator:20131211.phragmentedges.sql',1453226127,NULL),('phabricator:20131217.pushlogphid.1.col.sql',1453226127,NULL),('phabricator:20131217.pushlogphid.2.mig.php',1453226127,NULL),('phabricator:20131217.pushlogphid.3.key.sql',1453226127,NULL),('phabricator:20131219.pxdrop.sql',1453226127,NULL),('phabricator:20131224.harbormanual.sql',1453226127,NULL),('phabricator:20131227.heraldobject.sql',1453226127,NULL),('phabricator:20131231.dropshortcut.sql',1453226127,NULL),('phabricator:20131302.maniphestvalue.sql',1453226124,NULL),('phabricator:20140104.harbormastercmd.sql',1453226127,NULL),('phabricator:20140106.macromailkey.1.sql',1453226127,NULL),('phabricator:20140106.macromailkey.2.php',1453226127,NULL),('phabricator:20140108.ddbpname.1.sql',1453226127,NULL),('phabricator:20140108.ddbpname.2.php',1453226127,NULL),('phabricator:20140109.ddxactions.sql',1453226127,NULL),('phabricator:20140109.projectcolumnsdates.sql',1453226127,NULL),('phabricator:20140113.legalpadsig.1.sql',1453226127,NULL),('phabricator:20140113.legalpadsig.2.php',1453226127,NULL),('phabricator:20140115.auth.1.id.sql',1453226128,NULL),('phabricator:20140115.auth.2.expires.sql',1453226128,NULL),('phabricator:20140115.auth.3.unlimit.php',1453226128,NULL),('phabricator:20140115.legalpadsigkey.sql',1453226128,NULL),('phabricator:20140116.reporefcursor.sql',1453226128,NULL),('phabricator:20140126.diff.1.parentrevisionid.sql',1453226128,NULL),('phabricator:20140126.diff.2.repositoryphid.sql',1453226128,NULL),('phabricator:20140130.dash.1.board.sql',1453226128,NULL),('phabricator:20140130.dash.2.panel.sql',1453226128,NULL),('phabricator:20140130.dash.3.boardxaction.sql',1453226128,NULL),('phabricator:20140130.dash.4.panelxaction.sql',1453226128,NULL),('phabricator:20140130.mail.1.retry.sql',1453226128,NULL),('phabricator:20140130.mail.2.next.sql',1453226128,NULL),('phabricator:20140201.gc.1.mailsent.sql',1453226128,NULL),('phabricator:20140201.gc.2.mailreceived.sql',1453226128,NULL),('phabricator:20140205.cal.1.rename.sql',1453226128,NULL),('phabricator:20140205.cal.2.phid-col.sql',1453226128,NULL),('phabricator:20140205.cal.3.phid-mig.php',1453226128,NULL),('phabricator:20140205.cal.4.phid-key.sql',1453226128,NULL),('phabricator:20140210.herald.rule-condition-mig.php',1453226128,NULL),('phabricator:20140210.projcfield.1.blurb.php',1453226128,NULL),('phabricator:20140210.projcfield.2.piccol.sql',1453226128,NULL),('phabricator:20140210.projcfield.3.picmig.sql',1453226128,NULL),('phabricator:20140210.projcfield.4.memmig.sql',1453226128,NULL),('phabricator:20140210.projcfield.5.dropprofile.sql',1453226128,NULL),('phabricator:20140211.dx.1.nullablechangesetid.sql',1453226128,NULL),('phabricator:20140211.dx.2.migcommenttext.php',1453226128,NULL),('phabricator:20140211.dx.3.migsubscriptions.sql',1453226128,NULL),('phabricator:20140211.dx.999.drop.relationships.sql',1453226128,NULL),('phabricator:20140212.dx.1.armageddon.php',1453226128,NULL),('phabricator:20140214.clean.1.legacycommentid.sql',1453226128,NULL),('phabricator:20140214.clean.2.dropcomment.sql',1453226128,NULL),('phabricator:20140214.clean.3.dropinline.sql',1453226128,NULL),('phabricator:20140218.differentialdraft.sql',1453226128,NULL),('phabricator:20140218.passwords.1.extend.sql',1453226128,NULL),('phabricator:20140218.passwords.2.prefix.sql',1453226128,NULL),('phabricator:20140218.passwords.3.vcsextend.sql',1453226128,NULL),('phabricator:20140218.passwords.4.vcs.php',1453226128,NULL),('phabricator:20140223.bigutf8scratch.sql',1453226128,NULL),('phabricator:20140224.dxclean.1.datecommitted.sql',1453226128,NULL),('phabricator:20140226.dxcustom.1.fielddata.php',1453226128,NULL),('phabricator:20140226.dxcustom.99.drop.sql',1453226128,NULL),('phabricator:20140228.dxcomment.1.sql',1453226128,NULL),('phabricator:20140305.diviner.1.slugcol.sql',1453226128,NULL),('phabricator:20140305.diviner.2.slugkey.sql',1453226128,NULL),('phabricator:20140311.mdroplegacy.sql',1453226128,NULL),('phabricator:20140314.projectcolumn.1.statuscol.sql',1453226128,NULL),('phabricator:20140314.projectcolumn.2.statuskey.sql',1453226128,NULL),('phabricator:20140317.mupdatedkey.sql',1453226128,NULL),('phabricator:20140321.harbor.1.bxaction.sql',1453226128,NULL),('phabricator:20140321.mstatus.1.col.sql',1453226128,NULL),('phabricator:20140321.mstatus.2.mig.php',1453226128,NULL),('phabricator:20140323.harbor.1.renames.php',1453226128,NULL),('phabricator:20140323.harbor.2.message.sql',1453226128,NULL),('phabricator:20140325.push.1.event.sql',1453226128,NULL),('phabricator:20140325.push.2.eventphid.sql',1453226128,NULL),('phabricator:20140325.push.3.groups.php',1453226128,NULL),('phabricator:20140325.push.4.prune.sql',1453226128,NULL),('phabricator:20140326.project.1.colxaction.sql',1453226128,NULL),('phabricator:20140328.releeph.1.productxaction.sql',1453226128,NULL),('phabricator:20140330.flagtext.sql',1453226128,NULL),('phabricator:20140402.actionlog.sql',1453226128,NULL),('phabricator:20140410.accountsecret.1.sql',1453226128,NULL),('phabricator:20140410.accountsecret.2.php',1453226128,NULL),('phabricator:20140416.harbor.1.sql',1453226128,NULL),('phabricator:20140420.rel.1.objectphid.sql',1453226128,NULL),('phabricator:20140420.rel.2.objectmig.php',1453226128,NULL),('phabricator:20140421.slowvotecolumnsisclosed.sql',1453226128,NULL),('phabricator:20140423.session.1.hisec.sql',1453226128,NULL),('phabricator:20140427.mfactor.1.sql',1453226128,NULL),('phabricator:20140430.auth.1.partial.sql',1453226128,NULL),('phabricator:20140430.dash.1.paneltype.sql',1453226128,NULL),('phabricator:20140430.dash.2.edge.sql',1453226128,NULL),('phabricator:20140501.passphraselockcredential.sql',1453226128,NULL),('phabricator:20140501.remove.1.dlog.sql',1453226128,NULL),('phabricator:20140507.smstable.sql',1453226128,NULL),('phabricator:20140509.coverage.1.sql',1453226128,NULL),('phabricator:20140509.dashboardlayoutconfig.sql',1453226128,NULL),('phabricator:20140512.dparents.1.sql',1453226128,NULL),('phabricator:20140514.harbormasterbuildabletransaction.sql',1453226128,NULL),('phabricator:20140514.pholiomockclose.sql',1453226129,NULL),('phabricator:20140515.trust-emails.sql',1453226129,NULL),('phabricator:20140517.dxbinarycache.sql',1453226129,NULL),('phabricator:20140518.dxmorebinarycache.sql',1453226129,NULL),('phabricator:20140519.dashboardinstall.sql',1453226129,NULL),('phabricator:20140520.authtemptoken.sql',1453226129,NULL),('phabricator:20140521.projectslug.1.create.sql',1453226129,NULL),('phabricator:20140521.projectslug.2.mig.php',1453226129,NULL),('phabricator:20140522.projecticon.sql',1453226129,NULL),('phabricator:20140524.auth.mfa.cache.sql',1453226129,NULL),('phabricator:20140525.hunkmodern.sql',1453226129,NULL),('phabricator:20140615.pholioedit.1.sql',1453226129,NULL),('phabricator:20140615.pholioedit.2.sql',1453226129,NULL),('phabricator:20140617.daemon.explicit-argv.sql',1453226129,NULL),('phabricator:20140617.daemonlog.sql',1453226129,NULL),('phabricator:20140624.projcolor.1.sql',1453226129,NULL),('phabricator:20140624.projcolor.2.sql',1453226129,NULL),('phabricator:20140629.dasharchive.1.sql',1453226129,NULL),('phabricator:20140629.legalsig.1.sql',1453226129,NULL),('phabricator:20140629.legalsig.2.php',1453226129,NULL),('phabricator:20140701.legalexemption.1.sql',1453226129,NULL),('phabricator:20140701.legalexemption.2.sql',1453226129,NULL),('phabricator:20140703.legalcorp.1.sql',1453226129,NULL),('phabricator:20140703.legalcorp.2.sql',1453226129,NULL),('phabricator:20140703.legalcorp.3.sql',1453226129,NULL),('phabricator:20140703.legalcorp.4.sql',1453226129,NULL),('phabricator:20140703.legalcorp.5.sql',1453226129,NULL),('phabricator:20140704.harbormasterstep.1.sql',1453226129,NULL),('phabricator:20140704.harbormasterstep.2.sql',1453226129,NULL),('phabricator:20140704.legalpreamble.1.sql',1453226129,NULL),('phabricator:20140706.harbormasterdepend.1.php',1453226129,NULL),('phabricator:20140706.pedge.1.sql',1453226129,NULL),('phabricator:20140711.pnames.1.sql',1453226129,NULL),('phabricator:20140711.pnames.2.php',1453226129,NULL),('phabricator:20140711.workerpriority.sql',1453226129,NULL),('phabricator:20140712.projcoluniq.sql',1453226129,NULL),('phabricator:20140721.phortune.1.cart.sql',1453226129,NULL),('phabricator:20140721.phortune.2.purchase.sql',1453226129,NULL),('phabricator:20140721.phortune.3.charge.sql',1453226129,NULL),('phabricator:20140721.phortune.4.cartstatus.sql',1453226129,NULL),('phabricator:20140721.phortune.5.cstatusdefault.sql',1453226129,NULL),('phabricator:20140721.phortune.6.onetimecharge.sql',1453226129,NULL),('phabricator:20140721.phortune.7.nullmethod.sql',1453226129,NULL),('phabricator:20140722.appname.php',1453226129,NULL),('phabricator:20140722.audit.1.xactions.sql',1453226129,NULL),('phabricator:20140722.audit.2.comments.sql',1453226129,NULL),('phabricator:20140722.audit.3.miginlines.php',1453226129,NULL),('phabricator:20140722.audit.4.migtext.php',1453226129,NULL),('phabricator:20140722.renameauth.php',1453226129,NULL),('phabricator:20140723.apprenamexaction.sql',1453226129,NULL),('phabricator:20140725.audit.1.migxactions.php',1453226129,NULL),('phabricator:20140731.audit.1.subscribers.php',1453226129,NULL),('phabricator:20140731.cancdn.php',1453226129,NULL),('phabricator:20140731.harbormasterstepdesc.sql',1453226129,NULL),('phabricator:20140805.boardcol.1.sql',1453226129,NULL),('phabricator:20140805.boardcol.2.php',1453226129,NULL),('phabricator:20140807.harbormastertargettime.sql',1453226129,NULL),('phabricator:20140808.boardprop.1.sql',1453226129,NULL),('phabricator:20140808.boardprop.2.sql',1453226129,NULL),('phabricator:20140808.boardprop.3.php',1453226129,NULL),('phabricator:20140811.blob.1.sql',1453226129,NULL),('phabricator:20140811.blob.2.sql',1453226129,NULL),('phabricator:20140812.projkey.1.sql',1453226129,NULL),('phabricator:20140812.projkey.2.sql',1453226129,NULL),('phabricator:20140814.passphrasecredentialconduit.sql',1453226129,NULL),('phabricator:20140815.cancdncase.php',1453226129,NULL),('phabricator:20140818.harbormasterindex.1.sql',1453226129,NULL),('phabricator:20140821.harbormasterbuildgen.1.sql',1453226129,NULL),('phabricator:20140822.daemonenvhash.sql',1453226129,NULL),('phabricator:20140902.almanacdevice.1.sql',1453226129,NULL),('phabricator:20140904.macroattach.php',1453226129,NULL),('phabricator:20140911.fund.1.initiative.sql',1453226129,NULL),('phabricator:20140911.fund.2.xaction.sql',1453226129,NULL),('phabricator:20140911.fund.3.edge.sql',1453226129,NULL),('phabricator:20140911.fund.4.backer.sql',1453226129,NULL),('phabricator:20140911.fund.5.backxaction.sql',1453226129,NULL),('phabricator:20140914.betaproto.php',1453226129,NULL),('phabricator:20140917.project.canlock.sql',1453226129,NULL),('phabricator:20140918.schema.1.dropaudit.sql',1453226129,NULL),('phabricator:20140918.schema.2.dropauditinline.sql',1453226129,NULL),('phabricator:20140918.schema.3.wipecache.sql',1453226129,NULL),('phabricator:20140918.schema.4.cachetype.sql',1453226129,NULL),('phabricator:20140918.schema.5.slowvote.sql',1453226129,NULL),('phabricator:20140919.schema.01.calstatus.sql',1453226129,NULL),('phabricator:20140919.schema.02.calname.sql',1453226129,NULL),('phabricator:20140919.schema.03.dropaux.sql',1453226129,NULL),('phabricator:20140919.schema.04.droptaskproj.sql',1453226129,NULL),('phabricator:20140926.schema.01.droprelev.sql',1453226129,NULL),('phabricator:20140926.schema.02.droprelreqev.sql',1453226129,NULL),('phabricator:20140926.schema.03.dropldapinfo.sql',1453226129,NULL),('phabricator:20140926.schema.04.dropoauthinfo.sql',1453226129,NULL),('phabricator:20140926.schema.05.dropprojaffil.sql',1453226129,NULL),('phabricator:20140926.schema.06.dropsubproject.sql',1453226129,NULL),('phabricator:20140926.schema.07.droppondcom.sql',1453226129,NULL),('phabricator:20140927.schema.01.dropsearchq.sql',1453226129,NULL),('phabricator:20140927.schema.02.pholio1.sql',1453226129,NULL),('phabricator:20140927.schema.03.pholio2.sql',1453226129,NULL),('phabricator:20140927.schema.04.pholio3.sql',1453226129,NULL),('phabricator:20140927.schema.05.phragment1.sql',1453226130,NULL),('phabricator:20140927.schema.06.releeph1.sql',1453226130,NULL),('phabricator:20141001.schema.01.version.sql',1453226130,NULL),('phabricator:20141001.schema.02.taskmail.sql',1453226130,NULL),('phabricator:20141002.schema.01.liskcounter.sql',1453226130,NULL),('phabricator:20141002.schema.02.draftnull.sql',1453226130,NULL),('phabricator:20141004.currency.01.sql',1453226130,NULL),('phabricator:20141004.currency.02.sql',1453226130,NULL),('phabricator:20141004.currency.03.sql',1453226130,NULL),('phabricator:20141004.currency.04.sql',1453226130,NULL),('phabricator:20141004.currency.05.sql',1453226130,NULL),('phabricator:20141004.currency.06.sql',1453226130,NULL),('phabricator:20141004.harborliskcounter.sql',1453226130,NULL),('phabricator:20141005.phortuneproduct.sql',1453226130,NULL),('phabricator:20141006.phortunecart.sql',1453226130,NULL),('phabricator:20141006.phortunemerchant.sql',1453226130,NULL),('phabricator:20141006.phortunemerchantx.sql',1453226130,NULL),('phabricator:20141007.fundmerchant.sql',1453226130,NULL),('phabricator:20141007.fundrisks.sql',1453226130,NULL),('phabricator:20141007.fundtotal.sql',1453226130,NULL),('phabricator:20141007.phortunecartmerchant.sql',1453226130,NULL),('phabricator:20141007.phortunecharge.sql',1453226130,NULL),('phabricator:20141007.phortunepayment.sql',1453226130,NULL),('phabricator:20141007.phortuneprovider.sql',1453226130,NULL),('phabricator:20141007.phortuneproviderx.sql',1453226130,NULL),('phabricator:20141008.phortunemerchdesc.sql',1453226130,NULL),('phabricator:20141008.phortuneprovdis.sql',1453226130,NULL),('phabricator:20141008.phortunerefund.sql',1453226130,NULL),('phabricator:20141010.fundmailkey.sql',1453226130,NULL),('phabricator:20141011.phortunemerchedit.sql',1453226130,NULL),('phabricator:20141012.phortunecartxaction.sql',1453226130,NULL),('phabricator:20141013.phortunecartkey.sql',1453226130,NULL),('phabricator:20141016.almanac.device.sql',1453226130,NULL),('phabricator:20141016.almanac.dxaction.sql',1453226130,NULL),('phabricator:20141016.almanac.interface.sql',1453226130,NULL),('phabricator:20141016.almanac.network.sql',1453226130,NULL),('phabricator:20141016.almanac.nxaction.sql',1453226130,NULL),('phabricator:20141016.almanac.service.sql',1453226130,NULL),('phabricator:20141016.almanac.sxaction.sql',1453226130,NULL),('phabricator:20141017.almanac.binding.sql',1453226130,NULL),('phabricator:20141017.almanac.bxaction.sql',1453226130,NULL),('phabricator:20141025.phriction.1.xaction.sql',1453226130,NULL),('phabricator:20141025.phriction.2.xaction.sql',1453226130,NULL),('phabricator:20141025.phriction.mailkey.sql',1453226130,NULL),('phabricator:20141103.almanac.1.delprop.sql',1453226130,NULL),('phabricator:20141103.almanac.2.addprop.sql',1453226131,NULL),('phabricator:20141104.almanac.3.edge.sql',1453226131,NULL),('phabricator:20141105.ssh.1.rename.sql',1453226131,NULL),('phabricator:20141106.dropold.sql',1453226131,NULL),('phabricator:20141106.uniqdrafts.php',1453226131,NULL),('phabricator:20141107.phriction.policy.1.sql',1453226131,NULL),('phabricator:20141107.phriction.policy.2.php',1453226131,NULL),('phabricator:20141107.phriction.popkeys.php',1453226131,NULL),('phabricator:20141107.ssh.1.colname.sql',1453226131,NULL),('phabricator:20141107.ssh.2.keyhash.sql',1453226131,NULL),('phabricator:20141107.ssh.3.keyindex.sql',1453226131,NULL),('phabricator:20141107.ssh.4.keymig.php',1453226131,NULL),('phabricator:20141107.ssh.5.indexnull.sql',1453226131,NULL),('phabricator:20141107.ssh.6.indexkey.sql',1453226131,NULL),('phabricator:20141107.ssh.7.colnull.sql',1453226131,NULL),('phabricator:20141113.auditdupes.php',1453226131,NULL),('phabricator:20141118.diffxaction.sql',1453226131,NULL),('phabricator:20141119.commitpedge.sql',1453226131,NULL),('phabricator:20141119.differential.diff.policy.sql',1453226131,NULL),('phabricator:20141119.sshtrust.sql',1453226131,NULL),('phabricator:20141123.taskpriority.1.sql',1453226131,NULL),('phabricator:20141123.taskpriority.2.sql',1453226131,NULL),('phabricator:20141210.maniphestsubscribersmig.1.sql',1453226131,NULL),('phabricator:20141210.maniphestsubscribersmig.2.sql',1453226131,NULL),('phabricator:20141210.reposervice.sql',1453226131,NULL),('phabricator:20141212.conduittoken.sql',1453226131,NULL),('phabricator:20141215.almanacservicetype.sql',1453226131,NULL),('phabricator:20141217.almanacdevicelock.sql',1453226131,NULL),('phabricator:20141217.almanaclock.sql',1453226131,NULL),('phabricator:20141218.maniphestcctxn.php',1453226131,NULL),('phabricator:20141222.maniphestprojtxn.php',1453226131,NULL),('phabricator:20141223.daemonloguser.sql',1453226131,NULL),('phabricator:20141223.daemonobjectphid.sql',1453226131,NULL),('phabricator:20141230.pasteeditpolicycolumn.sql',1453226131,NULL),('phabricator:20141230.pasteeditpolicyexisting.sql',1453226131,NULL),('phabricator:20150102.policyname.php',1453226131,NULL),('phabricator:20150102.tasksubscriber.sql',1453226131,NULL),('phabricator:20150105.conpsearch.sql',1453226131,NULL),('phabricator:20150114.oauthserver.client.policy.sql',1453226131,NULL),('phabricator:20150115.applicationemails.sql',1453226131,NULL),('phabricator:20150115.trigger.1.sql',1453226131,NULL),('phabricator:20150115.trigger.2.sql',1453226131,NULL),('phabricator:20150116.maniphestapplicationemails.php',1453226131,NULL),('phabricator:20150120.maniphestdefaultauthor.php',1453226131,NULL),('phabricator:20150124.subs.1.sql',1453226131,NULL),('phabricator:20150129.pastefileapplicationemails.php',1453226131,NULL),('phabricator:20150130.phortune.1.subphid.sql',1453226131,NULL),('phabricator:20150130.phortune.2.subkey.sql',1453226131,NULL),('phabricator:20150131.phortune.1.defaultpayment.sql',1453226131,NULL),('phabricator:20150205.authprovider.autologin.sql',1453226131,NULL),('phabricator:20150205.daemonenv.sql',1453226131,NULL),('phabricator:20150209.invite.sql',1453226131,NULL),('phabricator:20150209.oauthclient.trust.sql',1453226131,NULL),('phabricator:20150210.invitephid.sql',1453226131,NULL),('phabricator:20150212.legalpad.session.1.sql',1453226131,NULL),('phabricator:20150212.legalpad.session.2.sql',1453226131,NULL),('phabricator:20150219.scratch.nonmutable.sql',1453226131,NULL),('phabricator:20150223.daemon.1.id.sql',1453226131,NULL),('phabricator:20150223.daemon.2.idlegacy.sql',1453226131,NULL),('phabricator:20150223.daemon.3.idkey.sql',1453226131,NULL),('phabricator:20150312.filechunk.1.sql',1453226131,NULL),('phabricator:20150312.filechunk.2.sql',1453226131,NULL),('phabricator:20150312.filechunk.3.sql',1453226131,NULL),('phabricator:20150317.conpherence.isroom.1.sql',1453226131,NULL),('phabricator:20150317.conpherence.isroom.2.sql',1453226131,NULL),('phabricator:20150317.conpherence.policy.sql',1453226131,NULL),('phabricator:20150410.nukeruleedit.sql',1453226131,NULL),('phabricator:20150420.invoice.1.sql',1453226131,NULL),('phabricator:20150420.invoice.2.sql',1453226131,NULL),('phabricator:20150425.isclosed.sql',1453226131,NULL),('phabricator:20150427.calendar.1.edge.sql',1453226131,NULL),('phabricator:20150427.calendar.1.xaction.sql',1453226131,NULL),('phabricator:20150427.calendar.2.xaction.sql',1453226131,NULL),('phabricator:20150428.calendar.1.iscancelled.sql',1453226131,NULL),('phabricator:20150428.calendar.1.name.sql',1453226131,NULL),('phabricator:20150429.calendar.1.invitee.sql',1453226131,NULL),('phabricator:20150430.calendar.1.policies.sql',1453226132,NULL),('phabricator:20150430.multimeter.1.sql',1453226132,NULL),('phabricator:20150430.multimeter.2.host.sql',1453226132,NULL),('phabricator:20150430.multimeter.3.viewer.sql',1453226132,NULL),('phabricator:20150430.multimeter.4.context.sql',1453226132,NULL),('phabricator:20150430.multimeter.5.label.sql',1453226132,NULL),('phabricator:20150501.calendar.1.reply.sql',1453226132,NULL),('phabricator:20150501.calendar.2.reply.php',1453226132,NULL),('phabricator:20150501.conpherencepics.sql',1453226132,NULL),('phabricator:20150503.repositorysymbols.1.sql',1453226132,NULL),('phabricator:20150503.repositorysymbols.2.php',1453226132,NULL),('phabricator:20150503.repositorysymbols.3.sql',1453226132,NULL),('phabricator:20150504.symbolsproject.1.php',1453226132,NULL),('phabricator:20150504.symbolsproject.2.sql',1453226132,NULL),('phabricator:20150506.calendarunnamedevents.1.php',1453226132,NULL),('phabricator:20150507.calendar.1.isallday.sql',1453226132,NULL),('phabricator:20150513.user.cache.1.sql',1453226132,NULL),('phabricator:20150514.calendar.status.sql',1453226132,NULL),('phabricator:20150514.phame.blog.xaction.sql',1453226132,NULL),('phabricator:20150514.user.cache.2.sql',1453226132,NULL),('phabricator:20150515.phame.post.xaction.sql',1453226132,NULL),('phabricator:20150515.project.mailkey.1.sql',1453226132,NULL),('phabricator:20150515.project.mailkey.2.php',1453226132,NULL),('phabricator:20150519.calendar.calendaricon.sql',1453226132,NULL),('phabricator:20150521.releephrepository.sql',1453226132,NULL),('phabricator:20150525.diff.hidden.1.sql',1453226132,NULL),('phabricator:20150526.owners.mailkey.1.sql',1453226132,NULL),('phabricator:20150526.owners.mailkey.2.php',1453226132,NULL),('phabricator:20150526.owners.xaction.sql',1453226132,NULL),('phabricator:20150527.calendar.recurringevents.sql',1453226132,NULL),('phabricator:20150601.spaces.1.namespace.sql',1453226132,NULL),('phabricator:20150601.spaces.2.xaction.sql',1453226132,NULL),('phabricator:20150602.mlist.1.sql',1453226132,NULL),('phabricator:20150602.mlist.2.php',1453226132,NULL),('phabricator:20150604.spaces.1.sql',1453226132,NULL),('phabricator:20150605.diviner.edges.sql',1453226132,NULL),('phabricator:20150605.diviner.editPolicy.sql',1453226132,NULL),('phabricator:20150605.diviner.xaction.sql',1453226132,NULL),('phabricator:20150606.mlist.1.php',1453226132,NULL),('phabricator:20150609.inline.sql',1453226132,NULL),('phabricator:20150609.spaces.1.pholio.sql',1453226132,NULL),('phabricator:20150609.spaces.2.maniphest.sql',1453226132,NULL),('phabricator:20150610.spaces.1.desc.sql',1453226132,NULL),('phabricator:20150610.spaces.2.edge.sql',1453226132,NULL),('phabricator:20150610.spaces.3.archive.sql',1453226132,NULL),('phabricator:20150611.spaces.1.mailxaction.sql',1453226132,NULL),('phabricator:20150611.spaces.2.appmail.sql',1453226132,NULL),('phabricator:20150616.divinerrepository.sql',1453226132,NULL),('phabricator:20150617.harbor.1.lint.sql',1453226132,NULL),('phabricator:20150617.harbor.2.unit.sql',1453226132,NULL),('phabricator:20150618.harbor.1.planauto.sql',1453226132,NULL),('phabricator:20150618.harbor.2.stepauto.sql',1453226132,NULL),('phabricator:20150618.harbor.3.buildauto.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.1.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.2.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.3.sql',1453226132,NULL),('phabricator:20150621.phrase.1.sql',1453226132,NULL),('phabricator:20150621.phrase.2.sql',1453226132,NULL),('phabricator:20150622.bulk.1.job.sql',1453226132,NULL),('phabricator:20150622.bulk.2.task.sql',1453226132,NULL),('phabricator:20150622.bulk.3.xaction.sql',1453226132,NULL),('phabricator:20150622.bulk.4.edge.sql',1453226132,NULL),('phabricator:20150622.metamta.1.phid-col.sql',1453226132,NULL),('phabricator:20150622.metamta.2.phid-mig.php',1453226132,NULL),('phabricator:20150622.metamta.3.phid-key.sql',1453226132,NULL),('phabricator:20150622.metamta.4.actor-phid-col.sql',1453226132,NULL),('phabricator:20150622.metamta.5.actor-phid-mig.php',1453226132,NULL),('phabricator:20150622.metamta.6.actor-phid-key.sql',1453226132,NULL),('phabricator:20150624.spaces.1.repo.sql',1453226132,NULL),('phabricator:20150626.spaces.1.calendar.sql',1453226132,NULL),('phabricator:20150630.herald.1.sql',1453226132,NULL),('phabricator:20150630.herald.2.sql',1453226132,NULL),('phabricator:20150701.herald.1.sql',1453226132,NULL),('phabricator:20150701.herald.2.sql',1453226132,NULL),('phabricator:20150702.spaces.1.slowvote.sql',1453226133,NULL),('phabricator:20150706.herald.1.sql',1453226133,NULL),('phabricator:20150707.herald.1.sql',1453226133,NULL),('phabricator:20150708.arcanistproject.sql',1453226133,NULL),('phabricator:20150708.herald.1.sql',1453226133,NULL),('phabricator:20150708.herald.2.sql',1453226133,NULL),('phabricator:20150708.herald.3.sql',1453226133,NULL),('phabricator:20150712.badges.1.sql',1453226133,NULL),('phabricator:20150714.spaces.countdown.1.sql',1453226133,NULL),('phabricator:20150717.herald.1.sql',1453226133,NULL),('phabricator:20150719.countdown.1.sql',1453226133,NULL),('phabricator:20150719.countdown.2.sql',1453226133,NULL),('phabricator:20150719.countdown.3.sql',1453226133,NULL),('phabricator:20150721.phurl.1.url.sql',1453226133,NULL),('phabricator:20150721.phurl.2.xaction.sql',1453226133,NULL),('phabricator:20150721.phurl.3.xactioncomment.sql',1453226133,NULL),('phabricator:20150721.phurl.4.url.sql',1453226133,NULL),('phabricator:20150721.phurl.5.edge.sql',1453226133,NULL),('phabricator:20150721.phurl.6.alias.sql',1453226133,NULL),('phabricator:20150721.phurl.7.authorphid.sql',1453226133,NULL),('phabricator:20150722.dashboard.1.sql',1453226133,NULL),('phabricator:20150722.dashboard.2.sql',1453226133,NULL),('phabricator:20150723.countdown.1.sql',1453226133,NULL),('phabricator:20150724.badges.comments.1.sql',1453226133,NULL),('phabricator:20150724.countdown.comments.1.sql',1453226133,NULL),('phabricator:20150725.badges.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.badges.mailkey.2.php',1453226133,NULL),('phabricator:20150725.badges.viewpolicy.3.sql',1453226133,NULL),('phabricator:20150725.countdown.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.countdown.mailkey.2.php',1453226133,NULL),('phabricator:20150725.slowvote.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.slowvote.mailkey.2.php',1453226133,NULL),('phabricator:20150727.heraldaction.1.sql',1453226133,NULL),('phabricator:20150730.herald.1.sql',1453226133,NULL),('phabricator:20150730.herald.2.sql',1453226133,NULL),('phabricator:20150730.herald.3.sql',1453226133,NULL),('phabricator:20150730.herald.4.sql',1453226133,NULL),('phabricator:20150730.herald.5.sql',1453226133,NULL),('phabricator:20150730.herald.6.sql',1453226133,NULL),('phabricator:20150730.herald.7.sql',1453226133,NULL),('phabricator:20150803.herald.1.sql',1453226133,NULL),('phabricator:20150803.herald.2.sql',1453226133,NULL),('phabricator:20150804.ponder.answer.mailkey.1.sql',1453226133,NULL),('phabricator:20150804.ponder.answer.mailkey.2.php',1453226133,NULL),('phabricator:20150804.ponder.question.1.sql',1453226133,NULL),('phabricator:20150804.ponder.question.2.sql',1453226133,NULL),('phabricator:20150804.ponder.question.3.sql',1453226133,NULL),('phabricator:20150804.ponder.spaces.4.sql',1453226133,NULL),('phabricator:20150805.paste.status.1.sql',1453226133,NULL),('phabricator:20150805.paste.status.2.sql',1453226133,NULL),('phabricator:20150806.ponder.answer.1.sql',1453226133,NULL),('phabricator:20150806.ponder.editpolicy.2.sql',1453226133,NULL),('phabricator:20150806.ponder.status.1.sql',1453226133,NULL),('phabricator:20150806.ponder.status.2.sql',1453226133,NULL),('phabricator:20150806.ponder.status.3.sql',1453226133,NULL),('phabricator:20150808.ponder.vote.1.sql',1453226133,NULL),('phabricator:20150808.ponder.vote.2.sql',1453226133,NULL),('phabricator:20150812.ponder.answer.1.sql',1453226133,NULL),('phabricator:20150812.ponder.answer.2.sql',1453226133,NULL),('phabricator:20150814.harbormater.artifact.phid.sql',1453226133,NULL),('phabricator:20150815.owners.status.1.sql',1453226133,NULL),('phabricator:20150815.owners.status.2.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.1.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.2.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.3.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.4.sql',1453226133,NULL),('phabricator:20150828.ponder.wiki.1.sql',1453226133,NULL),('phabricator:20150829.ponder.dupe.1.sql',1453226133,NULL),('phabricator:20150904.herald.1.sql',1453226133,NULL),('phabricator:20150906.mailinglist.sql',1453226133,NULL),('phabricator:20150910.owners.custom.1.sql',1453226133,NULL),('phabricator:20150916.drydock.slotlocks.1.sql',1453226133,NULL),('phabricator:20150922.drydock.commands.1.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.1.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.2.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.3.sql',1453226133,NULL),('phabricator:20150923.drydock.taskid.1.sql',1453226133,NULL),('phabricator:20150924.drydock.disable.1.sql',1453226133,NULL),('phabricator:20150924.drydock.status.1.sql',1453226133,NULL),('phabricator:20150928.drydock.rexpire.1.sql',1453226133,NULL),('phabricator:20150930.drydock.log.1.sql',1453226134,NULL),('phabricator:20151001.drydock.rname.1.sql',1453226134,NULL),('phabricator:20151002.dashboard.status.1.sql',1453226134,NULL),('phabricator:20151002.harbormaster.bparam.1.sql',1453226134,NULL),('phabricator:20151009.drydock.auth.1.sql',1453226134,NULL),('phabricator:20151010.drydock.auth.2.sql',1453226134,NULL),('phabricator:20151013.drydock.op.1.sql',1453226134,NULL),('phabricator:20151023.harborpolicy.1.sql',1453226134,NULL),('phabricator:20151023.harborpolicy.2.php',1453226134,NULL),('phabricator:20151023.patchduration.sql',1453226134,14142),('phabricator:20151030.harbormaster.initiator.sql',1453226134,35726),('phabricator:20151106.editengine.1.table.sql',1453226134,8030),('phabricator:20151106.editengine.2.xactions.sql',1453226134,7392),('phabricator:20151106.phame.post.mailkey.1.sql',1453226134,18595),('phabricator:20151106.phame.post.mailkey.2.php',1453226134,1616),('phabricator:20151107.phame.blog.mailkey.1.sql',1453226134,19832),('phabricator:20151107.phame.blog.mailkey.2.php',1453226134,1389),('phabricator:20151108.phame.blog.joinpolicy.sql',1453226134,16415),('phabricator:20151108.xhpast.stderr.sql',1453226134,24424),('phabricator:20151109.phame.post.comments.1.sql',1453226134,8007),('phabricator:20151109.repository.coverage.1.sql',1453226134,1405),('phabricator:20151109.xhpast.db.1.sql',1453226134,1559),('phabricator:20151109.xhpast.db.2.sql',1453226134,599),('phabricator:20151110.daemonenvhash.sql',1453226134,39904),('phabricator:20151111.phame.blog.archive.1.sql',1453226134,15720),('phabricator:20151111.phame.blog.archive.2.sql',1453226134,534),('phabricator:20151112.herald.edge.sql',1453226134,13618),('phabricator:20151116.owners.edge.sql',1453226134,13570),('phabricator:20151128.phame.blog.picture.1.sql',1453226134,15964),('phabricator:20151130.phurl.mailkey.1.sql',1453226134,10402),('phabricator:20151130.phurl.mailkey.2.php',1453226134,1457),('phabricator:20151202.versioneddraft.1.sql',1453226134,8923),('phabricator:20151207.editengine.1.sql',1453226134,76111),('phabricator:20151210.land.1.refphid.sql',1453226134,19463),('phabricator:20151210.land.2.refphid.php',1453226134,833),('phabricator:20151215.phame.1.autotitle.sql',1453226134,21510),('phabricator:20151218.key.1.keyphid.sql',1453226134,14834),('phabricator:20151218.key.2.keyphid.php',1453226134,429),('phabricator:20151219.proj.01.prislug.sql',1453226134,21059),('phabricator:20151219.proj.02.prislugkey.sql',1453226134,16233),('phabricator:20151219.proj.03.copyslug.sql',1453226134,474),('phabricator:20151219.proj.04.dropslugkey.sql',1453226134,7782),('phabricator:20151219.proj.05.dropslug.sql',1453226134,20865),('phabricator:20151219.proj.06.defaultpolicy.php',1453226134,1358),('phabricator:20151219.proj.07.viewnull.sql',1453226134,16753),('phabricator:20151219.proj.08.editnull.sql',1453226134,13683),('phabricator:20151219.proj.09.joinnull.sql',1453226134,10924),('phabricator:20151219.proj.10.subcolumns.sql',1453226134,129879),('phabricator:20151219.proj.11.subprojectphids.sql',1453226135,26586),('phabricator:20151221.search.1.version.sql',1453226135,14029),('phabricator:20151221.search.2.ownersngrams.sql',1453226135,7390),('phabricator:20151221.search.3.reindex.php',1453226135,436),('phabricator:20151223.proj.01.paths.sql',1453226135,22387),('phabricator:20151223.proj.02.depths.sql',1453226135,28069),('phabricator:20151223.proj.03.pathkey.sql',1453226135,12562),('phabricator:20151223.proj.04.keycol.sql',1453226135,24719),('phabricator:20151223.proj.05.updatekeys.php',1453226135,463),('phabricator:20151223.proj.06.uniq.sql',1453226135,12857),('phabricator:20151226.reop.1.sql',1453226135,19351),('phabricator:20151227.proj.01.materialize.sql',1453226135,697),('phabricator:20151231.proj.01.icon.php',1453226135,3273),('phabricator:20160110.repo.01.slug.sql',1453226135,31556),('phabricator:20160110.repo.02.slug.php',1453226135,461),('phabricator:20160111.repo.01.slugx.sql',1453226135,745),('phabricator:20160112.repo.01.uri.sql',1453226135,7698),('phabricator:20160112.repo.02.uri.index.php',1453226135,437),('phabricator:20160113.propanel.1.storage.sql',1453226135,6273),('phabricator:20160113.propanel.2.xaction.sql',1453226135,7608),('phabricator:20160119.project.1.silence.sql',1455342652,11678),('phabricator:20160122.project.1.boarddefault.php',1455342652,13894),('phabricator:20160124.people.1.icon.sql',1455342652,67329),('phabricator:20160124.people.2.icondefault.sql',1455342652,2029),('phabricator:20160128.repo.1.pull.sql',1455342652,26541),('phabricator:20160202.board.1.proxy.sql',1455342652,76282),('phabricator:20160202.ipv6.1.sql',1455342653,110328),('phabricator:20160202.ipv6.2.php',1455342653,8896),('phabricator:20160206.cover.1.sql',1455342653,109094),('phabricator:20160208.task.1.sql',1455342653,109303),('phabricator:20160208.task.2.sql',1455342653,91926),('phabricator:20160208.task.3.sql',1455342653,101171),('phabricator:20160212.proj.1.sql',1455342653,117462),('phabricator:20160212.proj.2.sql',1455342653,1734),('phabricator:daemonstatus.sql',1453226123,NULL),('phabricator:daemonstatuskey.sql',1453226123,NULL),('phabricator:daemontaskarchive.sql',1453226124,NULL),('phabricator:db.almanac',1453226117,NULL),('phabricator:db.audit',1453226117,NULL),('phabricator:db.auth',1453226117,NULL),('phabricator:db.badges',1453226117,NULL),('phabricator:db.cache',1453226117,NULL),('phabricator:db.calendar',1453226117,NULL),('phabricator:db.chatlog',1453226117,NULL),('phabricator:db.conduit',1453226117,NULL),('phabricator:db.config',1453226117,NULL),('phabricator:db.conpherence',1453226117,NULL),('phabricator:db.countdown',1453226117,NULL),('phabricator:db.daemon',1453226117,NULL),('phabricator:db.dashboard',1453226117,NULL),('phabricator:db.differential',1453226117,NULL),('phabricator:db.diviner',1453226117,NULL),('phabricator:db.doorkeeper',1453226117,NULL),('phabricator:db.draft',1453226117,NULL),('phabricator:db.drydock',1453226117,NULL),('phabricator:db.fact',1453226117,NULL),('phabricator:db.feed',1453226117,NULL),('phabricator:db.file',1453226117,NULL),('phabricator:db.flag',1453226117,NULL),('phabricator:db.fund',1453226117,NULL),('phabricator:db.harbormaster',1453226117,NULL),('phabricator:db.herald',1453226117,NULL),('phabricator:db.legalpad',1453226117,NULL),('phabricator:db.maniphest',1453226117,NULL),('phabricator:db.meta_data',1453226117,NULL),('phabricator:db.metamta',1453226117,NULL),('phabricator:db.multimeter',1453226117,NULL),('phabricator:db.nuance',1453226117,NULL),('phabricator:db.oauth_server',1453226117,NULL),('phabricator:db.owners',1453226117,NULL),('phabricator:db.passphrase',1453226117,NULL),('phabricator:db.pastebin',1453226117,NULL),('phabricator:db.phame',1453226117,NULL),('phabricator:db.phlux',1453226117,NULL),('phabricator:db.pholio',1453226117,NULL),('phabricator:db.phortune',1453226117,NULL),('phabricator:db.phragment',1453226117,NULL),('phabricator:db.phrequent',1453226117,NULL),('phabricator:db.phriction',1453226117,NULL),('phabricator:db.phurl',1453226117,NULL),('phabricator:db.policy',1453226117,NULL),('phabricator:db.ponder',1453226117,NULL),('phabricator:db.project',1453226117,NULL),('phabricator:db.releeph',1453226117,NULL),('phabricator:db.repository',1453226117,NULL),('phabricator:db.search',1453226117,NULL),('phabricator:db.slowvote',1453226117,NULL),('phabricator:db.spaces',1453226117,NULL),('phabricator:db.system',1453226117,NULL),('phabricator:db.timeline',1453226117,NULL),('phabricator:db.token',1453226117,NULL),('phabricator:db.user',1453226117,NULL),('phabricator:db.worker',1453226117,NULL),('phabricator:db.xhpast',1453226117,NULL),('phabricator:db.xhpastview',1453226117,NULL),('phabricator:db.xhprof',1453226117,NULL),('phabricator:differentialbookmarks.sql',1453226123,NULL),('phabricator:draft-metadata.sql',1453226123,NULL),('phabricator:dropfileproxyimage.sql',1453226124,NULL),('phabricator:drydockresoucetype.sql',1453226124,NULL),('phabricator:drydocktaskid.sql',1453226124,NULL),('phabricator:edgetype.sql',1453226123,NULL),('phabricator:emailtable.sql',1453226123,NULL),('phabricator:emailtableport.sql',1453226123,NULL),('phabricator:emailtableremove.sql',1453226123,NULL),('phabricator:fact-raw.sql',1453226123,NULL),('phabricator:harbormasterobject.sql',1453226123,NULL),('phabricator:holidays.sql',1453226123,NULL),('phabricator:ldapinfo.sql',1453226123,NULL),('phabricator:legalpad-mailkey-populate.php',1453226125,NULL),('phabricator:legalpad-mailkey.sql',1453226125,NULL),('phabricator:liskcounters-task.sql',1453226124,NULL),('phabricator:liskcounters.php',1453226124,NULL),('phabricator:liskcounters.sql',1453226124,NULL),('phabricator:maniphestxcache.sql',1453226123,NULL),('phabricator:markupcache.sql',1453226123,NULL),('phabricator:migrate-differential-dependencies.php',1453226123,NULL),('phabricator:migrate-maniphest-dependencies.php',1453226123,NULL),('phabricator:migrate-maniphest-revisions.php',1453226123,NULL),('phabricator:migrate-project-edges.php',1453226123,NULL),('phabricator:owners-exclude.sql',1453226124,NULL),('phabricator:pastepolicy.sql',1453226123,NULL),('phabricator:phameblog.sql',1453226123,NULL),('phabricator:phamedomain.sql',1453226123,NULL),('phabricator:phameoneblog.sql',1453226123,NULL),('phabricator:phamepolicy.sql',1453226123,NULL),('phabricator:phiddrop.sql',1453226123,NULL),('phabricator:pholio.sql',1453226124,NULL),('phabricator:policy-project.sql',1453226123,NULL),('phabricator:ponder-comments.sql',1453226123,NULL),('phabricator:ponder-mailkey-populate.php',1453226123,NULL),('phabricator:ponder-mailkey.sql',1453226123,NULL),('phabricator:ponder.sql',1453226123,NULL),('phabricator:releeph.sql',1453226124,NULL),('phabricator:repository-lint.sql',1453226124,NULL),('phabricator:statustxt.sql',1453226124,NULL),('phabricator:symbolcontexts.sql',1453226123,NULL),('phabricator:testdatabase.sql',1453226123,NULL),('phabricator:threadtopic.sql',1453226123,NULL),('phabricator:userstatus.sql',1453226123,NULL),('phabricator:usertranslation.sql',1453226123,NULL),('phabricator:xhprof.sql',1453226123,NULL);
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
-- Table structure for table `nuance_item`
--

DROP TABLE IF EXISTS `nuance_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuance_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phid` varbinary(64) NOT NULL,
  `ownerPHID` varbinary(64) DEFAULT NULL,
  `requestorPHID` varbinary(64) NOT NULL,
  `sourcePHID` varbinary(64) NOT NULL,
  `sourceLabel` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `queuePHID` varbinary(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
  KEY `key_source` (`sourcePHID`,`status`),
  KEY `key_owner` (`ownerPHID`,`status`),
  KEY `key_requestor` (`requestorPHID`,`status`),
  KEY `key_queue` (`queuePHID`,`status`)
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
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `defaultQueuePHID` varbinary(64) NOT NULL,
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
  `callsign` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  UNIQUE KEY `callsign` (`callsign`),
  UNIQUE KEY `key_phid` (`phid`),
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
INSERT INTO `search_document` VALUES ('PHID-USER-qgpjve7vgfx3hhk6azae','USER','superadmin (superadmin)',1455342708,1455342708);
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
INSERT INTO `search_documentfield` VALUES ('PHID-USER-qgpjve7vgfx3hhk6azae','USER','titl',NULL,'superadmin (superadmin)');
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
INSERT INTO `search_documentrelationship` VALUES ('PHID-USER-qgpjve7vgfx3hhk6azae','PHID-USER-qgpjve7vgfx3hhk6azae','open','USER',1455342709);
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
INSERT INTO `search_indexversion` VALUES (1,'PHID-USER-qgpjve7vgfx3hhk6azae','fulltext','none:none');
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
INSERT INTO `phabricator_session` VALUES (1,'PHID-USER-qgpjve7vgfx3hhk6azae','web','8387ac806a399c2d5b967ef22fbe4b8a87c67b09',1455342709,1457934709,NULL,0,1);
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
INSERT INTO `user` VALUES (1,'PHID-USER-qgpjve7vgfx3hhk6azae','superadmin','superadmin',NULL,NULL,'29bbea58b2c2994c9bbf6ac24f5b29b8','bcrypt:$2y$11$zyuKvHfziD.o3EV.th0cdeAc5N.gkUNmBP.SDxvgN7/VTxeDzQ07C',1455342708,1455342708,NULL,0,0,'','5ft4pseeuki2cdkfvbuydudg2j57woxs4ocgy4ebgrfzdrdjegrzz2zcgymyrmtax36jzab2az3dcdzoncjftfuwjiocbsk5otpn6pzc3cx4csmgwtpq5su4q2pbb2i2geatw2wzimjkz7uambm4uxemroiqccefdhx2enk7khkfclusnshxkkg4fbjk3sgdq6x7x2y7ejptix77bmymczdilu7ersuwnsirdmh5qrc6bjy5nvwmkac66yree6b',0,0,1,'',1,1,'cto5wiuhjuh2cpbmlyf2mpwfkgp7oi2b6xq6efndhjenj7di2fvj6jhl2qsvtq73',0,'tgU5D19iTkux,https://phabricator-tbone.cloudron.me/res/phabricator/e132bb6a/rsrc/image/avatar.png','{\"until\":null}',1455601909,0);
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
INSERT INTO `user_email` VALUES (1,'PHID-USER-qgpjve7vgfx3hhk6azae','admin@server.test',1,1,'j2yi6gtrrl3rm5gp4fs4i5tl',1455342708,1455342708);
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
INSERT INTO `user_externalaccount` VALUES (1,'PHID-XUSR-wgttaidvdz6e2rfwdg3w','PHID-USER-qgpjve7vgfx3hhk6azae','password','self','7i4alq45fdtmomy2nojfpd5cpzsgr26a','PHID-USER-qgpjve7vgfx3hhk6azae',NULL,1455342708,1455342708,NULL,NULL,NULL,0,NULL,NULL,'[]');
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
INSERT INTO `user_log` VALUES (1,'PHID-USER-qgpjve7vgfx3hhk6azae','PHID-USER-qgpjve7vgfx3hhk6azae','create','null','\"admin@server.test\"','{\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.109 Safari\\/537.36\"}',1455342708,1455342708,'172.17.0.1',NULL),(2,'PHID-USER-qgpjve7vgfx3hhk6azae','PHID-USER-qgpjve7vgfx3hhk6azae','change-password','null','null','{\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.109 Safari\\/537.36\"}',1455342708,1455342708,'172.17.0.1',NULL),(3,'PHID-USER-qgpjve7vgfx3hhk6azae','PHID-USER-qgpjve7vgfx3hhk6azae','admin','false','true','{\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.109 Safari\\/537.36\"}',1455342708,1455342708,'172.17.0.1',NULL),(4,NULL,'PHID-USER-qgpjve7vgfx3hhk6azae','login-partial','null','null','{\"session_type\":\"web\",\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.109 Safari\\/537.36\"}',1455342709,1455342709,'172.17.0.1','8387ac806a399c2d5b967ef22fbe4b8a87c67b09'),(5,'PHID-USER-qgpjve7vgfx3hhk6azae','PHID-USER-qgpjve7vgfx3hhk6azae','login-full','null','null','{\"host\":\"phabricator\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.109 Safari\\/537.36\"}',1455342709,1455342709,'172.17.0.1','8387ac806a399c2d5b967ef22fbe4b8a87c67b09');
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
INSERT INTO `worker_archivetask` VALUES (3,'PhabricatorSearchWorker','35:1455342709:phabricator:53',1455349909,0,1,0,577647,1455342710,1455342710,4000,NULL),(4,'PhabricatorSearchWorker','35:1455342710:phabricator:54',1455349910,0,2,0,9948,1455342710,1455342710,4000,NULL),(5,'PhabricatorSearchWorker','35:1455342710:phabricator:55',1455349910,0,3,0,8454,1455342710,1455342710,4000,NULL),(6,'PhabricatorApplicationTransactionPublishWorker','35:1455342730:phabricator:76',1455349930,0,4,1,0,1455342730,1455342730,1000,'PHID-AUTH-pt2plcm6qbrbw3wtmvmn'),(7,'PhabricatorApplicationTransactionPublishWorker','101:1455342772:phabricator:38',1455349972,0,5,0,170537,1455342773,1455342773,1000,'PHID-AUTH-z4ru52daoq7nfw6ak45t');
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
INSERT INTO `worker_taskdata` VALUES (1,'{\"documentPHID\":\"PHID-USER-qgpjve7vgfx3hhk6azae\",\"parameters\":[]}'),(2,'{\"documentPHID\":\"PHID-USER-qgpjve7vgfx3hhk6azae\",\"parameters\":[]}'),(3,'{\"documentPHID\":\"PHID-USER-qgpjve7vgfx3hhk6azae\",\"parameters\":[]}'),(4,'{\"objectPHID\":\"PHID-AUTH-pt2plcm6qbrbw3wtmvmn\",\"actorPHID\":\"PHID-USER-qgpjve7vgfx3hhk6azae\",\"xactionPHIDs\":[],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}'),(5,'{\"objectPHID\":\"PHID-AUTH-z4ru52daoq7nfw6ak45t\",\"actorPHID\":\"PHID-USER-qgpjve7vgfx3hhk6azae\",\"xactionPHIDs\":[\"PHID-XACT-AUTH-hfzfvvdxwwfssgp\",\"PHID-XACT-AUTH-o7wekqcnlhtcyji\",\"PHID-XACT-AUTH-2yys4jqz7xfhw2i\",\"PHID-XACT-AUTH-6qinuqborktxqfb\",\"PHID-XACT-AUTH-byim7tlvnw5xbuf\",\"PHID-XACT-AUTH-ishbqhyrk3nbxlg\",\"PHID-XACT-AUTH-4gbezvmlzgxwnrz\",\"PHID-XACT-AUTH-pt7undk2p6dkesg\",\"PHID-XACT-AUTH-nedknbzvdkqrl4c\",\"PHID-XACT-AUTH-g366x7hz6l5n6ea\",\"PHID-XACT-AUTH-nruv7uaoto4f7nl\"],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}');
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

-- Dump completed on 2016-02-13  5:53:11
