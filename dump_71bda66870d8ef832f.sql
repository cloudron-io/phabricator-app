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
-- Current Database: `c426f39125b21bba_almanac`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_almanac` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_almanac`;

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
-- Current Database: `c426f39125b21bba_audit`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_audit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_audit`;

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
-- Current Database: `c426f39125b21bba_auth`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_auth` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_auth`;

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
INSERT INTO `auth_providerconfig` VALUES (1,'PHID-AUTH-c6pyggoe6gesp5wptaor','PhabricatorPasswordAuthProvider','password','self',1,1,0,0,0,0,'[]',1454486513,1454486513,0),(2,'PHID-AUTH-ebbjq5rhjm2ojnp246n3','PhabricatorLDAPAuthProvider','ldap','self',1,1,1,1,1,1,'{\"ldap:port\":\"389\",\"ldap:version\":\"3\",\"ldap:host\":\"ldap_hostname\",\"ldap:dn\":\"ldap_base_dn\",\"ldap:search-attribute\":\"cn\",\"ldap:always-search\":\"1\",\"ldap:anoynmous-username\":\"ldap_bind_dn\",\"ldap:anonymous-password\":\"ldap_bind_password\",\"ldap:username-attribute\":\"cn\",\"ldap:realname-attributes\":[\"displayname\"],\"ldap:activedirectory-domain\":\"\"}',1454486601,1454486601,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_providerconfigtransaction`
--

LOCK TABLES `auth_providerconfigtransaction` WRITE;
/*!40000 ALTER TABLE `auth_providerconfigtransaction` DISABLE KEYS */;
INSERT INTO `auth_providerconfigtransaction` VALUES (1,'PHID-XACT-AUTH-cseaobycylko43n','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-c6pyggoe6gesp5wptaor','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:registration','1','0','[]','{\"source\":\"web\",\"params\":[]}',1454486513,1454486513),(2,'PHID-XACT-AUTH-ibxpvvh4awj5653','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-c6pyggoe6gesp5wptaor','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:link','1','0','[]','{\"source\":\"web\",\"params\":[]}',1454486513,1454486513),(3,'PHID-XACT-AUTH-pv5q7nc5qbesxqo','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-c6pyggoe6gesp5wptaor','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:unlink','1','0','[]','{\"source\":\"web\",\"params\":[]}',1454486513,1454486513),(4,'PHID-XACT-AUTH-reh3haaedhamwqi','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:trustEmails','0','1','[]','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(5,'PHID-XACT-AUTH-gm6s36mb7mfsmts','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','\"ldap_hostname\"','{\"auth:property\":\"ldap:host\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(6,'PHID-XACT-AUTH-7eiyypxwnpegapu','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','389','\"389\"','{\"auth:property\":\"ldap:port\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(7,'PHID-XACT-AUTH-mxhqsqjwrh5pkvx','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','\"ldap_base_dn\"','{\"auth:property\":\"ldap:dn\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(8,'PHID-XACT-AUTH-mkolj65kazmjho2','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','\"cn\"','{\"auth:property\":\"ldap:search-attribute\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(9,'PHID-XACT-AUTH-hjqknkxc6m2s532','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','\"1\"','{\"auth:property\":\"ldap:always-search\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(10,'PHID-XACT-AUTH-53fj22zwshyo3dl','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','\"ldap_bind_dn\"','{\"auth:property\":\"ldap:anoynmous-username\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(11,'PHID-XACT-AUTH-3rwaps23to6kbg7','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','\"ldap_bind_password\"','{\"auth:property\":\"ldap:anonymous-password\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(12,'PHID-XACT-AUTH-d76zmm6bisy7lnp','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','\"cn\"','{\"auth:property\":\"ldap:username-attribute\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(13,'PHID-XACT-AUTH-fgnn4tu6rnymxjk','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','[\"displayname\"]','{\"auth:property\":\"ldap:realname-attributes\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(14,'PHID-XACT-AUTH-5nk7s35aiop6cy7','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','3','\"3\"','{\"auth:property\":\"ldap:version\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601),(15,'PHID-XACT-AUTH-q2ojndbdyvcqp65','PHID-USER-l2r2l32e4yudsfvfkhti','PHID-AUTH-ebbjq5rhjm2ojnp246n3','public','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,0,'config:property','null','\"\"','{\"auth:property\":\"ldap:activedirectory-domain\"}','{\"source\":\"web\",\"params\":[]}',1454486601,1454486601);
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
-- Current Database: `c426f39125b21bba_badges`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_badges` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_badges`;

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
-- Current Database: `c426f39125b21bba_cache`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_cache` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_cache`;

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
INSERT INTO `cache_general` VALUES (1,'i0dazEHxf.Gq','phabricator:celerity:/res/phabricator/ab7b848c/rsrc/css/application/base-PTO0Tc6dClqX','deflate','­”ßjƒ0‡_eĞÛEò¿¶wÖÒ÷0zª¡j$UØ({÷ÉÊhSã a¢r¾|1šI£±ju_éÚ¼%CS(«Ëb4u…îQı„TQ^jk¦¾º=÷N–ğ•<‘ªÂ^)dKJŠJ”\rÍÉ‘gÇB‘sÌˆj\'¤`ÌvR8”Úô¡“¡<#‡™Çlæâ`ÍY·ğCqáW]İËïkíµ*:3‚EÄ1T¤rëıòVËĞ„1ÌËVRáô?sâ”I‘ú2¡´HsŒÎqîwTš^OF¸–4åÔT\"”<Ç,Ü‰Pº#r‘î§5¨4­±û\r((ÁÿœÊ|Ì—­ÀŞî·ß¶Ã)?³¿Úæ÷ø\\ßï',1454486317,NULL),(2,'f2R.vANEu3rE','phabricator:celerity:/res/phabricator/c7ccd872/rsrc/css/font/font-lato.c-Dj4S0TLFyL2d','deflate','­–Ín£0€ïû+õ@#mƒméaû\0û•fR$\'DÆÙ6ªúîIZE«dm\\8 lóøfÄ#v[¿D©áí|µiía•ı–¾Ëz§W{gïs}¾{–ÊµzXpyÍjƒª€Ü\r!9¼zp[iû|Ì‘Û!äxZ:Xï­t?¡ó‹9“ıºkÛ×Å·ïŸvn#ı}Æ€Yv;ØúÃ²Å«T.dƒ‚•‘Ô—±¼<.Ü‚ÔĞa\näãJAŠŠ«H„÷W	ŞíáoK+ÃÑT±”şÏúnœ8¯‡lñp”îÚõ³_mÇ{šêıÁÂyæı1MÒJ6„\"7=·^ÚVœkE…®©8‰ƒ¦Z‰Úh¦Bö‚1UĞªl°bù‰~£…Æã z†©vîNµ³iPi¬u`Çª³&àæÄLs˜I‡æÉ@‡ÊáˆLór¨5U’ªˆ%Lµ’HQ°ELşD\'K)kJA|9â|#çë•ª¡´nL¨HGhT¿LÊ7‡™†PNˆ5‚pšŸÀéPt,ÆŸ/ôN#\r-Jú¸ $ºÊ+¡€	¯íÒØ§)ô_qÏmô/',1454486317,NULL),(3,'RP7MCG.JsX.W','phabricator:celerity:/res/phabricator/5e4df064/core.pkg.css;-V.FwI9gtllzh','deflate','ìıi“ã8² Š~?¿\"nõ;§F)®\"•iç¾¡(jß¨]š{lŒ;)qI­iùßW‰¨PdUÏôµ×	8€ÃápøÂ[âõ]ÔNï¢ş.zï¢ø~Ôß-ı]×ŞUø]EŞUô]ÅŞUü]­½Ûô.[ñ.k’.º’÷n¿óº%ìGË“Ş=õİßù£çYæOƒsÍüı°9QÔLÅÿÄ[(9ß¡_ÇëÒÏèë‡`é:g»Ò÷äC\\îÃµ9!¬øëŞœf(?ïP|¸äºïg{še¾šƒ`‰Ò»(›2\'Îù)[¦÷ázW]únú˜súğÉYÒÕ‹ıòû{Ôêšû(jJ¿¸úÓ“.Ş§kŠù]—dï—ßMÿéIr<MàôøgÙ¿\nc# İ¤ï0ı=Ó:oéâ/ŞŸ€°Ğwµ/oÿ>“Kz[tÿıışñm%ñoSI9êœ“~<»\Z>ÿÉ€ó,ÿOGÒOR€ÑÛH:Jÿş~ÿşN9\Z§¿»œé~¸’£É?DÍ‘„ wßuÏù‘ëŞ£©ãøÁk¢ö]2xIüÁsÂ^q¬£)~ÿo2ìÿ`?ünğ{Íûk=üàÄİÑõÂÑûaù£#ëÖùãúİjå8Gâ¢Şj¦êcâÅ´ğ¥øùhHü!óÇ4=ˆ5ûòKEÒO0ÿ	÷óÃ°nÖÑÓ5SJÍbÔ7Q,‡û>ôIÍr¾ÿ7­Ñ\rä‡pt\\ÿ«mi¦\'9¿¸ïj€üÏ|M¿ï’€ÿ¡¨¹¶Î]¿‡ôÿët¯?mËÕÂ¢²v	ÆÌòW‚ñ´/?œpÂƒOgMôÔï(âT#2>ÿúvÖ<õC<:Ápkâh˜oÔ¨.\n‘A±àÉÛ7[=jş™\'M:§#‚L”-‰ß9ÙïÏO¿˜\'ùƒù·¿ıHı‡ KœãS¡§şRŸ16°Xz²yOn¸*¾q>ú‡eê©şr¼ëcìIoÿ—fØ–ãq¦çC×ìï•ı‡ò=õûG<P2\0ĞX¾«š(Jæ¯o\'Í=&­MŠšğ[ºí<wô¬Zø1~¾Ã¿¥»Õê	È²ÿÆı|”(.ÚG•4¢O‡#@ªı°îæ]¿Cßü×7ÿ…çóºŞgY9*òÙŠ?BQ\'CwÉMVÃhœşqûĞ|:½|\'~{ùpUNôÇ\0zó‹¿ùƒÿæ(<÷Ğ;Œï¿Íÿñhßv,%`ª`$æğ˜¶<(V\'Eş×·½tå-Î?dK8ºñ¿NÀˆü… ÿú&J\'MbæxÇçRå|p!SúYq@Ú¥/=KQté=â/Swïã¯ÑoÒğIş#&ı{ûS­‘Îµçi†òCów”éä·™¥œò€„ø4Y–¿¤ÏšÃ“/¨œ©Hş˜.a«–®Y¦töŸ…–ô;]Èõ—ÀÉßCÒz<÷·üAÿ’L‘s>Dî\Za¬ÍñşzúğÔ,ôW¾—O’5]/œ£Á»¿Ê¼{Œ¼É>|nÊ=*c~ÇÚùLä#\")Uâ|N”~ï7h«Á8ù³â³6Ÿß2ÏLËÇÚßuD·¬–?bÇ›3¥L³9¼D‡SÒïı©8ÚgÎ1ƒeãã¬û-ßø+Z·¸@ìyûføËÉŸz÷#~òapîşıñŞ_ÙŠäe_§ùs³Ùg)Ræ¹Qˆ–/f)éùiõgÏôÇ>5lx¶§™á(ÜÔ|g«NÀö|‚—tËöå1ÉqüÂù®Ö²ƒ™İÁî¥ˆ_ßv>3\nŸ€2DDæh]å~»F €ÀoÙW¾È—Ğx8cú{iUä³ª™ö«:5û–§ÉÁç€+dF©v*3_0>ËÔ	˜?Â©ñ‡áì(ºÅû(í€ü2®çC.äfªèÛ\r˜:çyœ fV:-i¿mïjK\\°N|¦âu/\r‘ówÎ`DT¬áÀ>QËœ)\\CŠ±5aŸFk†r‘¬C@Ÿˆ;CŠG3A÷ÁO ˆ8ıø[²?¶.y)\'¯EÇ²ı]+7Ü(‹Y÷eèÃs$ÿ ±÷—b€‘O]òQ×}:“$3¤ƒÍG3ãY–îi6 84SıŠÎ6ïÜ·øó¿]nOdîHâ3,_vH\\Hã\Zçú[uRäèg(I÷™g$ô†2à©[|˜w´OıÃ?y?Ëpóç:®ÿı{ˆC$hf0ú€Óanï¾û²–ßø®™öÑûŸÿçßÜ#ohŞßşëçCùˆ%7¤NB|=È>>ÕÄ·äETì¬ú0sG€‚À÷#uÜğgû.GÇÛnx¸tr€qË?˜¤V‚Â·Á	åìpvràuü\ràèõ“ñ¶S¿ÿ©?É $÷ËdwyÍ‘tŸíœâƒO@º>‰\"õL%X>´Ìß;Øâ0ÂhÇĞÓúãa\nä8+Ñ.ı§¼¥P2%àw’ğ¥SÈ—L¡ÚÙf%`äD’Ç\ZXÓ_Â1F®00Nñ;.ÿ€Y$ş¿FO¿8ß|b\nv‘“8Í¢—?Ç=C·P–ûìEÒÂi1ÓkŸ˜ƒ-;ÑÜä¿ÿÏäûıô;Ÿ‚¿sºÏş#>Àü\'ı±–Ç‰ÿñ±W=CÏ<J}öÍ1z_À0ÄŒ ˆæ¯û²w÷ô—ÂÑ<dZEÒN$?<Çg ÑêğIÆ½Cè1\r>õäú¨ï9}ú5.™…Ö“G€…5©&F–Œ§=1ı¬œE¦º/A/ĞÜe~¾ŞH¡jZÿ+$¤bGAËø~8~îóÅë)Ğç½İ%k\'™•àå“WÅzÁ.{’À£w?ó=Iúaø’zÀ\rÒóÛGpˆ#º¨PW’ÚìmP¸Å%Ú¡Úc#ñŸïfwÂ´¦(­\'Üæ®Ğ¿¦TÄw­qQ!¯´X©ö¹n¯ãdó.\rå)âXù‡%#tôS Pt-h„b=‚A9åI@ Qç?]ËG0ğÉ°àşå´9ÁîS{hs‚Ÿ@‘ØœHºN6È¢ˆ‘´g8± >¼qßCyíg¬[MV‹íƒ÷±Øı3İ¯¼¶<_Ø? û¤àı”ıã÷=ToşŠ«‚º°¨xOúŒşè|0ªIÏÃºwi’Œ‹„¢¸ÄC‡\Zc\ZÁû=|\rMu)Ó*ñÀ9ÚşÀ Ïßghç¦;Ğ™Ç	Úÿ+ú\rpiGâùigŸw$!Ø„°R‰xPz8Ğ!™‡¬ğY­Z¤E—®…BLïÛ².LØ¶Ê¹áÆğ³ \'E\n»ø(Qà1V‘\n†¢«€ûáCç\\¯\0:,rôhn¢ja¡¨n †y+C,¬]O5”tî-\"Xì?Ó#q’\\–ÅÚWX\ZôöO^SRc\Z³CÊß(:_½·?9æ†Xà\'ı@¡ÔAï~Ëó	_jeDÙô†Šä7TŸŞAW’ùiúˆú¨K®›ÌØı&´(ù¦—Næ ÀıÉª\04÷äÖ)ìDJÆñ÷èÿoØ¯€.“O,\"uF~p‰Ä–CµşªëçÂBâ\n\\\0¸¶“‰\\Ö€Ë2‹¬9n†ÿ„Ó—ôXg,¼~¡‰ˆ¡ÿÌ5”Ù¨¢;ÀO!+ıg¾^ŠÍ‡ËqÏ½-eZ¹óMFEÑhÑ­&8¦ÎÉ•Õ+àKN%¹æ\n€S\n3SPı?á	ôÂäNš«™9\'P¿·ŒˆˆG#ó\0$¨eH¹~Øœ’»Zs=.¸ÃW?K„ó¸OñÎŸ‡ŸñZ.¤îŸ•-ËK¤çˆ+‡Ô™ˆûhx9Y‹ÿ¹Ë½¡\rJ¹¶xÔ†îª X\0¼`â£Eg¡àÎI3Ã+òê&k<\\ÿÃD{ëÿübİâ-DÀGÂû°€4Ş*/w$Zq‡²h41¾öR}zy	rÕÇ¯ë®\'=;Óí7O|/}¥Ş÷ï€ñ%Ér¸êO€Ö47Û%u÷|V¡‡ ÈÀj÷mxÍ8Má8şÉwîP\'‹(@š+®×!ÿœ¤ú#¯æ+œçƒtËõêù3g¸—xşR?*j‚~~J ”œ]Ap¢Sówâ4ã5]ó®wÅ øu@\Z%¯|î\\Pd•ÖpÖÔÄA[â‚\"ş”~wÂ`‘Fšô,4Ò¢Dxñşıèèÿ!r÷=üZµMÅïJ5ì][6ÆÓ3Ôo+åÿ7š-Tf¡±àŸ	Mmü?ÍEk‚CÁƒözÚZu¦sÙB\"ÒºnÙFcÛ®kÛY£Ç¯ZævÙÓ7«).º>	*tÕŞ”i-¤‘­U\'Õêä<Ä•®Ñ˜342U·ûÛq:\\B¦BñFíÙ•ª4ÜùI‘•3”oÊôÍnk]¨[İÓìà¼ÑF%5°ÊŞì¸E·=ß°ôô<îµUÃ *òÅq±Ñ\0£±}u6Ôß. Å {B»ÔÁwƒµ0ÅdÎö’)‹8Œ7h^a)ŠİPgu±½	³ÑAÇš-–ãi§7İîşQ2öÉ<ÿS\r¿]şNKÍk§åuÛß#óİšİNÅvÎCmD6ÉÙBÙí[ës·×Ú_†,qîi[M•©®²¦nÏ+Í¾Ğ36·Õ¬gÌYuxkØ:ÓT«c]Ù*“äˆqsV¡½I¥9E¨f·-M=v|n]F’RŠ”I˜ıÙhõ•«´ûBDÍªGYş4úmmElÎ:QÇ£Ñ›.pÆÙ÷EùÏÒ)Hé?×<_sÃ>Ğz›ÛºI©ÿ-+´½q¨Ûv@KàS‰âÜ]ë*íA™ëÈâ­aöYf’Úb#Q*³a¢(ò9}LjaçøâMbIc9BëH\"EG4ùšš#–»1/øıå½œ¥ˆìp†Ê‚É`¦VĞf`y¡ï†©—¸jÑT56w‹‡èn÷—¡Œ|ÚÎD‚RÑ`Ö„šâİ¯‘¿\\=Óø\']a<ì#Óöˆ)…êq½@¹‰ò$4Iáˆ Px)XÕc÷	J&¸Ÿ°a\'7€å€;wsÇÇmBú„´ß\'äŸş„\'*\0è`ğæ~Aú°¬~Ü“Å/ßüƒû,!Î‰Úü¬Œõ9÷³\"Ÿ¼N3™šP“ø1P©Ów`°›€¼•¸@q²’C8hÊWËÄÓ±ûtà>µÏ†ìÙxÅï>¥Âx¡§û”«Ş»•-<\\1÷)´ñŠ8pDhxxC“>w‡4Ú,\n§’D‡R¸<jUî\'X[õeğ7 qËa{¾Ä8>ˆê<W–\rlİ~ft‘âà-Ú)s¥eıèªÜB]Æı\ZŒNˆîGàÿe\r*ì¤ìQOnÆêĞß%ÃFó—€÷¤f$6¼ÏÖö|¡/}3Y†-\"øùQ”@º”ÿÖl2$Óz¢ƒCŸkQĞ8[ÖC	õú?¢û¾HèL|¿ı|÷0¹{\\\Zf.vÈ˜Ãg­Ë.`CÇ’»õf²Ö|ö‘QÔMß¦ğ¹\'^B‹İ0\0Úc]×ñÇ0HA\n½ÄcªÁÿ^^æíÛãIldœs‹ÉŠ¢ŒŠ`‘uäÈŒÖ-c¤f;ÒG py\rŸ÷	Rú.-ºJªr‚¨\'3½ÄÓk#¾*v¤]ä ôà|8û~ê‘*q>^AoXÙòôÏ©œâwI\rt_O{’×ÒùK(şZ|hºXG>œ\r\0qeLªHæUì¸æÏu ş[±^êÒâÛP,Å>.¦°›.©F²â4£+š‹<‡õ”×Ç»DØ^ÀÛ£9Jsáü¶–Cí­¬.”‡šú\ZìÑ&.zÜM÷ KÏnM¬I1PvÀZx‹Ìãğ¦s¼¤ß‡$|>ºëæâKø„QÖÿâÛ?\n\ZüÏ,eıdƒÀHúóeà`ı;pl_î{æš7îïÃÂ(å™rÃÊÚ!d¶ÀrhÌ™ÕÈ?jÅG\nÿA\"Jü½Lzz\0{¿+ó‹ïŞ\"kí§E÷]à8Jg0Ï#~Ç;ÚGmı÷ïß“É|øã+HªO!¡GbJsŸ>–A\näõW\0ÜwW¸T ¹ÿ6>¡v\'Ş³`2YÑ:È¨BŠ«\"·¸~ˆğ\rÔXöÚÀÈqŸ\'ôB‰@x<\\Ú•—\Zû| Ò+4\ZùÇn>O<A1tœòO¡[ìtS2ĞayG:5G,ãi¯#õZ½™7œ|…Û¨4Z~¥ëK8	€‚5Ì€Şî^×ÙL1²Ğ°P»¨İ÷—»A(ŒHFØä/eóë•ÉÔ{ƒÀ°?\"ë÷Â‰\0TæÉÉ jÂÿ!³(&Œ£îi	œ˜Å~R*Áè“bÜ\'Ø\0Ï¾pÉ¼İ\'ğ^,yğq’œktÛ™8ocE*ø*<óÏ¬‰‡/V6ù±spãHó:€l•§Š(ÊÂÏœTVnHŸc¡âšßd_ğ’*5?—;€8—±´—ú[]ã!L9ÿİeƒBïòil÷«lß@{që/4ŸvŠØ&;eÒo¸d¼A9Ëæûö½†Duó„Èqª{]Ä¯ü#İN)kúˆÓ`\nX!r\"ü”œk‰±Ş]À-[m¡ãxÄ,Üg`¿#1Sˆ£¢€Áz+vo~RNP%ağó¨húğŠQ±Á”íÆRæ\"ŸL=x˜å… ¬§ÖëİÈ#€¼ˆ@¶½W:*¾=#’Zqñô0c¯ğöL£Ñ¡än[ñZÓÙJ9Ï©œø6–e;wTs\\·\\Â‰qIÂå7×ælí-ÚìÒÕñÙ–Ìùg!çM3 \"H´QRıgµ$Ğp§ù`†>Ï»[Ç{tŠ BâÊğ3B®Ë Û ¬²¼xF/óÄ(àò¦Â?ûßG*¢LöøIfçËëkŸ©_\0B±¬éR¨<‰÷\0,ÒtgeöŠÌZËÂi50Y¶æ‹ Êİ¾>DWä\\Uòñååà\'s„‚‘âŠÏ’É]¨É4•uÉ$$Q¼û‡d[s4ëŠ¾àßP;è\ZúIÅøSDê\0‡İ@±œ˜øC‘ƒFÄ!–psË#-a[Ø¥ë-¾Vvêƒø\"bÙfŸÖÕ?¨|©v¸®%$3äséOèØ‘Œd˜[µÉ5}„4‰U÷\"ï_¨¾ÌÕÿtl37DA¼ù|´X?Çµl Ó\\l4&oea\'üƒ™ÿ8ú’ñà|„ŒIU:qúQÊ)Ñ(zÓËû8:pq·+XÙ”ÀxûføÕPby/+ÄÏ‰‚™İ÷À(òT.Ì+—^!ÌüĞ¹†‡şÏQù™İŠÂ)àšV$YÆs›R:|™ö|ç›îÄ¼è¡‹!GÛÛ‹pÒ3]*(&2Ç×0Ë:<z˜ÙÄ¥šT—î¾¢Qè¬Ò†î3 cøyKæØ\\«hÀU”â[×œ:$ÃÛ+X_J¼³SqWx©Ëá—´º4)ã=\0t*x­‘³$íıÍîgV£–Eš&hºY\\t¿Ş3¼ŸzæüNQúqn†£Õ–Õü½Ö¾gù_3\"Ó`h†Éõ’‚©Zú¨2· ¯õøş6Ú˜sÑ-ˆ@?r¸9Aä¢\'–üfZ“+$ ¿ÅÅû·¼ÈSælŸø×€y~a\rDV•BdÙõ:#×§ğJj{\ZÀ»|ïÁ¥ÒQB>ó·ÿú™­ñlßÿDCó7ŞRY\'§×­è°x,—˜ïäôz¾ ùË…‘,ú\'~O¸^´}ø]µx3½EgfG\nN«‚Êı¯ \0ÓÿÒäÿe;Ú‰®9ì€N+ÂÑ\rìSÂ±I¸¸¬˜Ó-~6ùé«àÈ¦\0è‚œ³\n7€0¦g¤¾Ÿ{ıÓ{Øš?.ÈMøe@á‹<œ¬5XbŸ“_Ã1ş\ZÏßù~Ğ]V€r‡İ ªä=öV°ynƒ,«x{ô	’½u GÛ‘B»hS²ÂÛ¨2®ïOùCG™ÅH9Àx/8÷PDJõ\Z†¯KP~jª\0®¾ëÊ”¹G#,z3çk„&$)u6ƒpB3¢{ÌÎğ‘*ò3e£U£EeRöŒñ\rVY$éœqİïî\0 ‚--û4ˆú\'¤N‰Wc‰MD°õe=Mºiç§gL%‚¨´Z0¢Ê£Tî^sÉ(Èsz„Ş¢]µÄk®´C€CI‹lÕ[ô/O`ÿáWÁ7€“\0ˆä¨’Î¿qïe/âØ;¥¯CSÛW\"{mŠMSŠàgÑeò05Æ»]Óæ¶`Æ“ícaJ‘ÎÁ8€ü4K|=³õÃx3ÁT?óÉÙ&½{Ğ`vÓ¶ÇÇë² 0àé 0ÙŞíH_ÇÿŞî$\\$cN=¹ËÒÄ³jHjÓo1”÷§K¾©Ú«`ß*¯ÂKæÂ.¾ØŠúJj\Zù¢^ù•f_k+,	è˜±´,‰ILßÌ®qîò=êyõg|Ûß]#àŒâ ÷/Ç[îœœQtYaÿŒQÜ&_â»>b \\%¥ıõ.åØdxÑ2øÉÌÙ·pyƒ7+1z	ÕÁ¥\rË´¢ŞÊœ¡é×ïZ&\'X{Ş„xå.qÊ ™_SØzJáEîÊ{¬¦JÜIäî¡W2ôlYúrŠÂ\Z_ëàsÓù\\\'9_ú¿‹²åƒ€-†0ÒÌÂÃÎ‡¨æ]ÿK°¿F;ÑG´E»”ı¹ep»o?sı.F=È\r¾0%r‡e|GõÉ Œ>æ*Êu	{Â­>ÔDE®¬fhüÃ‘‚A<Môt¹,øĞ5÷)xZ_\0–¨øÊ@›V !âÒ[\'øjhéfYÑ<¿\\ÉTø¼Q=\Zü[0Åà.[ÅÁ×Xä©=áÊIìşô\Z|,½Íİ­úïVOÁ¾	œyâÜ|2—Rü,LÚ’\'ÔQ”5«~‹j”±ğèm±…¢qWQ0¹ƒ~V4Úö“v2»Ú¨\'N8óLu‘:ŸEEÀÂåÒŠXÊ|.®Ü‹–(.r{~èYô¬)–zËÛÄæÌ\0:÷‚ë@/‘¾ê-´“Rk/™ş.á”]?ypŠAçÙ1òK7ÍÙ¾B‘‘N`UùpLCß¥ü·8\'Û!y&”*‘0h`ª,†×èÆ9$Ò8t2¥ñ¨àhq¥­ÿHG%M;ªµCO½–F‰+nP½çÀ©}Ö¿8zê«-–İ­å¹_œ§/æÒV¢)¸{@ív—²â‰ 5_5«ŸŒY@G®fø)cûøÔñ8ñS­Y\"í{Qı#J!“ééÏÅó/:0?Pp!ã”Ì(ë§¡Ç3hÁã¼ü\0ãËa1‚ıä\r×g2;¼?;ÃùhFG¦,>*a™W†>Q¸M~Rr&ñ\nGƒŸÜøHxğ“tˆ«?Ï!ü	|ğrEêª\r¬Áçƒ(Í|âÌ®,ø?9A©&ÕîıÃQ%‚v/ÇRìX©¬_‰s¸/¿>ªÅ†9å1jğØŒ,ø‹„¢T¾òkÔœØè<¶”ğ38†Ø¿L\"¢åî#Rû_ô>¥aCb·ğG™ĞEõáññœ÷Ob®”7µ‹D\"€08_TåeX±tùèJğyëÏ„€¬@‡¤ó–á\nøÂ0º×M/9Æ\ne‘¹˜Ÿ™ïé0îy.úÑí%Áïa‹vi*çˆá†\0 úÿu³‚•çPz%†Ÿ(K°TO÷8-­ä¼\"¤à\'îpü{ÆÆ NÕ‡d­ÂtñŞÄ‡ƒÿ^ê?uï@©yÈ»ì\nV:(¿¬¹JÎ]/g•ô\nFï¥Æâk›\'EC¡Ks~Æ,²Š\n-¥€óD—c4‘KCºæ[&îı¨*IÃ¹¡JIJ¿>ş²Iå\\á#›,¤3§	 AmŸÍI u8ºaÂDKlMcîÂTÎXéÍõ)×Ç@È¤Ó()›Ÿˆ,§ËüÃ Qæšèrù3i„NKå\0„<I7ñšîŸ«v#µhS>`~œ[jŸ]z\'Æ%§øRTŞJ><ÇÇŠ½²¨…8Ñ©]$øí‰©ÃË­¦OÀXâE÷)” ş[%ú“‡˜	Îü[Cr‡N5ò÷?\r/cİó*„Ñœ?L”†$xµù ïj)Á¦—‰11ğ´·¡}Gœªï¤~‚×€D?àFé$qúÏçÃC>¼0#·Ô¼eğz<@£)ç†TĞ«9úï7`î‘Nµò9>ˆ´?0rSº–(¹‚£e<Ìbï\\¼,|Hø=í…‹àÅSLÓm>‰Ø‘\'ª´Ñ`’<ògÆøKÆ³O5¾È)qûïá¿Ápõ·LâÉLå†‰ºZ|WO\'±ãcSîaœiÒ§ßjh(ù·¡dêÖßŞÿF‡‰a9×ÿX¸™ò±õÅÛpá5Ó—,}¦¯BÁ?‰)òUL_m.m‚êSfîà5@9C™Z2./§-›\"A1Y!ùØ™§$éAVÄSwä1~WW‘.\\”4\rØG€v$V\"üîÇıMĞv¤Ÿ%½+Yh`øvÆdûùĞFc*ÜSïäÒ¼g.±€– åëHi¼Ò£úÕñó¼¤;uß¾Ï:\nÿñè@ìÓWÔ\\‚ï—ØpŸà£5º|:Uñ„—À\'¯\0<êú¡oiN,¸Dô§Wø‘YÙQG´ƒâÎzN´À¦â«Ÿ=ÚAˆç0ùå3\0Oaø„ú\"ŒÀ8–Á™/vdº‘Oİ4´pßÌ;d9z\n5ë›û{°Rk2x¸±ìr\"ÂK½/fÉN\\¨—PR/şÕö\nõ\nk$ã–f¾Â^Ïp´²’MèÒ	¬«kÁs3pê•à›+•\"¢P9\0ğË¸WUá<CIé:BpÕZ:Ürïtät¨\0=\rú6úv˜Æ)%¾{½V€ù8ş8^\0§¡“Ÿ¯=^˜Ñà»#\0h¸¿–\'eÔèãàİ®åŒèö(Ù˜K±°˜1DE€W‰‰Aã\'È½ı÷ïAŠ+Ÿ3iúı¾áö³Úé^ÓÃşüúbÁçıÅ˜\Zƒ§ûpªV Ø»Ï¡#Ùú5Š¦\\\0¯òÛĞ­@äÎ)%şz\0¯ÌÜMAÎ0ˆŠf(ömÇº\\ãØiS$(o‹T.pÇÀ\0(+‰&+±{¯…WÉéd¨©·  A\Z¦0n®tñy©[<¹g½–e4³ıĞı6ö)(QLÌYR#$E:£§àæŞ´Î)kÄŒßĞk•Ÿ£&s%²ÑŒ$Û047P—ÓÒ=\nvÎU÷“½ÓVezZ!à©\"Ï–’´ÒÅœïŸ5çÕø6eXÀ Üİ³(ã\"öi›…À]_h5q	²_|ahß@‡ˆO#a¿U=b`å2ŒCïÉï7¤Œgûêˆ>5\"’¶g	™é±hîsw±Š¸–ÎîyŒ•ÒM=2Ü•à\0ØÈÑüF^ta+ô8»!–nA‹¾ÈûPÅ?n\"óÇ“‚?ÄxÈT§¡ç]*è\Z‡\\¸ ~÷şPÒuÍv5ànUÒ¶dğş™&\nèõQf¾ÿyÍr«ÑÏëFŠªœİÆÓŠ!ÆØB\\&şÊä»lói[Í‡á`Šº#gU#LÕÄF9«(™¬ÖÕßÊY¥%yÃ‹Åv˜YL¤únk]æİE—¤öñ²YúÓÑîCG&„ÕøjĞÆT±» lZŸÚëµ0ÃÈM¿·².b«ÃnÚã××”Ánæq43Òú»f^0=ï÷g–!È›~[Ÿn75ÑÎi»pLò¶îˆŞ¸“=òVe×e.6fÜæÎ¬5e{Ì5èÄBUcå-Ó~Å/9hÇzè¥ÂTĞÚ¦n{ô<¸	ˆ·i-‰­°œÑÛ­ñS¯bØÍD&ÆdÓÖúz—Z /Ç8|z±ëp»gO\ZvÑe0kP6_g.‰MnçÓd‡]Gß¿Rújw­îIºy£F³Ñ­Lú3A_º¼³ĞFÇÉúV¿mwtj¸5ÔîuEA18fs¡šSjn‰:T\'zı›Û 7Şí6PâB1AÙİ’#¨Õ`¤@<>ëaÇ…ÛÃÌ–•š£%©¼eËnoÚ¤»Æb{l¶+pn\n)ºeõ§7¼µî÷ĞR9I¸Òï8öÈl+0<hL0Ô^âèPUÉU¦Äk›•ö¨j·{kBÍ© ß´~©ÆŒWêú,óèHÜu”Ábt¢[xÃ2ôlÖ6æãÙ´]×-ŒÃyˆÉÃS©nf¥çÂM©ĞÚ™lï.:3]Hó9£.]yTÃpiÂ47œ=¼±s«ÒºØ|»‹ìœ³HáÛ[AV;Ó&L•^8¨²©.ZĞäLË¬êŞ¨RÙİØJ«\rnKÀË/w*çfC´dåf·”Ãé‚0,4“×¬ÙÀ¨kC›\'U§W«¥B5o‡÷ê;«†«†Ñ[óıìÈ\Z4ıGÈ9ïÉ_`\na\"ùÔeÏ×X(\0`FƒA’pw‹¸Ôb*Ù¹Ó­FyZJL1““Bä˜õ¨Ğİ!e>ı””(ñÌ¬u­I²õS–ŸÇJËYcˆäšåqöôl	Âè¾ÏÌ[[<=ƒƒ[ó–ªi#ñ·»‘vp\"AM)287\n¢3j‰ÀP)èÆÓWÿw!:úö+‰Ò^’`·§·ÿş=LùéŞLA_yûï|ŸÍÛÿı‰®ãóÏcî#òbZ“hWr!0Ã;/à«8Ëğ]p×¿È&.JY½¼flĞ¬9R(ğ%îœ¡çCisÖeiÓ)ËáLE*‰­\'~Ğ•Î0X˜İæ.ó–!r÷1È6…¬DŞá\Zù 5Ÿ’¡õRîEŸ‹ĞïâÎ6B™<„˜ìL}qê, (õpXØf†7Ğq¦­À\0Êb§E\'AÈ?Æ¿ß`4‚) yÓ´Ä$&t_û™;\n–\0\nŸOÒÏ´oKiÙhêŸYI\Z…ôfMÄ×É¢x„3†R—‘‰%ğ]# ©FC—ŸŒ#(yC&”nÑl6oè¿i}ÜYg—»æ=MãĞ{)YSt©àš/\rMb\\•ïó§¶<eQ-òC_8)…æÜÑ8æS„EbÍ=…É7(ÓõÈ°7/\\Á‘$óÃ¬-\0ÉÉ>R6Úáç(3àÃ†û#ô4şô#Q@)ÿ‹#w3ìb~´´WÀ¹+øÉºtÅü¸x±‰[\'8–ÏÂ+\"0%p…ÔÀÊÄ êS1í¡ÛáNş\Z:%S>\"—íWtŠjÖ&Ş¬2WZ?]âœ ¦ úù5|â›Œñ(Ê2œòêÃ2SË´ù\0P1»,XÃçe©T‚Üxâ@»ZÁå.½È£€}ùí5¿¾@•¥ÊPJI!_òËğÔoI¬˜§‡#	<øRÍ2oœ0WæKÀ{JÇgM’\\˜ÉåA–8ÎÀ.ÁL\nV`äâ’Ş&®ß%şá§±¶’ğà\0èYŒ¢{(@€µpy_ŞòkØcáu¬Ê¼\0îÑwŠ8’ &«àù¤Zh#öº\0>xÚù3¿‹˜-}’­ál^˜$¨Ú0Ÿz]¦ïZ\"Ğ‡¡ÕKĞ?‘÷¯¸FZO1²€kÉ¢å Zám\0ğÃS¥0\0Fª`Îä8Ç ƒ=ZôÏgA$÷²ñŸtl—E‹ Âx|$¯”yd¢úæú ê:ÈZN\n%…<²ß£ø.>róÆ?¹®X¨ãª?ŸÌŠ[,Ïñu‘â£\"¾îåo­†Ã€æï^;\ZYxk\nOZñ‘òè ŒÔ±\"˜û©Å±F-ØûgZ©Q£jx±N¡Ê¾8öûU~ÛßÅ(\nÍˆ`ë\09E”‹ÇÛ÷CU/.;Ğs¯8ÂÂc0¡Š`ä\"˜Ë£æÏKqÅ©åNİÊˆQlÕP‹ŠcÛÖô{”CYÀ´(w›Q\n‚@ó¦H?‹ÏîäİÕH¯LˆĞ(`›w*%!Áş¬	€õñ\\ÉKÏm³XàÅœBZÅ·÷n%}¾À}h\"ŒèMLp`LóaÇé„ŞÃç‹Kz0¬\"M»Ú3væğçÿ•„¤>¼O&4Ò‹\\ã\"W_Ô³ÎÀ\"	GT‚S°—àõ#¸•¤\'š)jŠ,rŠ‹œ4Ë‚\"¡m9× í‹ë:’,9Á‰ñ-_;û:ÎĞü&Â3^Ô=€‹è³â§¤(êE`]•t»€¹f†zEı>‘‚”jåØ;ñqJÄoİL-İÓì@ü™û\"%œfêh&8^MŞP>>jÔ‘Öğîg¬zğ“óÇ‚üi¬4z@ÿÎÉŞ=RÃ÷‚Pôˆ¡ùö·G@Ï$Â\'`L¢ø$ÒÉ¯äb‰¤/³şÈ*LòãÎÉ“9U””y+ö(u!ğçT}&šDùa¼†@ORDT\ZŒÅêu,Òzä\0‰È*æ9£ÜM‰Q9‘ÖÏœ›ÒH„Ç¨\0‡h¤Ÿ#qÏû[(2ûÙ[‘Ğ›$fY<ÒŠ$Yç”ğH–ÕÂCP¯|³éİßJ õÈÈ#Jş#Sáê¨\0-\n±–±S&Lğ0ÏAÇìJŸPB\râÿIkô°0àî²Å,ªG¼.¢Tí›–JöFj¿vrC‹²Ö#.n4ÔÔİ¶å°çEW—`¦5~1=r{û°ÇÕ™1[1»½1¬.){wØ©ã‰MBØm,UªÒÍOSã2…V1Ú‘%s2	ô†6O˜ÈSF0ĞşÄ£óÍ¨hkòØ›WÖÚB·¨f»İSØşíìŸ\rŞ`Û¬Òx¥p»Kp?¡˜&¸›xØì‘.Ñ>S¬ÑVöCyÍfí±gM×Ne*	ø¬‹ÏÜåÙ6¥™\nMiõĞ­­hœ0¬ºá¯,.FÕÖE**§Y³e4§ñºÛ¯.¬©|í{}ÊÙúNs‡2+r‡WÚs†´	,®“®(â\riä!$\ró¦«£=Tê—Yûp&Œ¶œîìF£4vh k¥AëtçLk­Ãu·\ZĞ5\roğD3{’˜ÊaXÙ];h]14ò¶ÚQ×ê¢¶§¼íÙiÓRka5«†:o¶úê¹qm¬\ZÊi8Sš›¾İ„Oóı¶µîU™ıÅm7útc·İf\nR»º¾Ğf#×Ëè@Ó-ó¬i5á¸º²zglİvƒÉ™ß1°‹ùK¡¿QzSãñ#ŞQ7SëZë®5J<SŞ† lØ¿PÎmNQı²ï¥\rv#Ea>;[Ò@ñÕö´\"¤!>G{mİiO¡Æ_†äê6\"S¡²Ô6<ëæ\rÄ9Ìr‘¬­YSÆ·P×ç‹‡j•írâ5ÖÜ!sk·Ú#ÖïU©2—…iƒKi5êÂd^gë+k°İ¨µ!‚×¸##Nøj“@·UivXÆu;]DYML}Ú]#ZÃ\\ôÚuÆğé~Y3ùÖÏv’Òc*è¶…¯»(r5öô²²˜ÔoöXµÕaC±!ÕoØUvTåÇØ©;\Zq•ZíËuÆ ¨İ™eŒæöÔ¶ºáb-–ãi§7İîşQÊà*ö`ˆi4k1lÕäåÓ~6š¯œ¯ÈVëàu·Ë¶ÁÔ¥I{/ëSrÖÄØsõ0çöÒ©1¿X¦26¦«³SS¦{l‚µ‘¾\ru»ğÉ¶ï\"â4&ö\'®Û²Ï›ÑND¶úétÒÕÍEè\\nˆÅ^Ú\'a-ò‡mï0ëèÂu±Jµ©Û±NCï@^onE]OwõŞŒp<z·=»²Û ÖÌ]–í{±w6#—ò®Û×*»DÆÃ\rÇ›Æzáô\'n—¼l¦$»èf³ùŒï6Â‰­‘\'v-È¦ĞnP}S(âF¼9K¯8÷p$\\y2PÚë8Ù [ˆîZSÃ@„ËlÓQÚšµÎ­Ë^k´©êİ9^‘çı™aëÑœ&ššµ”ûéè825óºm­y˜öê¶==Ãê­·aÆÆîw›ñ¸yiö:¬|™(}m 1´¶­_[8¯ŒzÔä6€šz›iaÓ¶=±£í‚ØM”³\"¯Çúñ,ÌÏøºe]®VƒnÚŞtÌW¹ßLM†r•¿uæ[b©`.Û§6Û>®\Z}oŸ¯PëzØ–\rnJ÷\'v »ı!t¼õmeÚ>Óƒñáfa$²&ÙF–Õ&Í‰åUnˆĞ^ë¢ØÜ,ŠeúÍ&éÆyÑƒ	CÖu™Pş‚Ú;Ô¨	×ûfm¬›ç*ÉSyS—“Îñ:ØiVwÏWqH¤NÇñ g¯nâu/+½-µÕ¯#\Z&<nÛÕÛ¬¾:RS½X­ç)[š764;®zµÕòà Ó•ÀTph6ôúœÚÅuIq4´Òå-ÓÒ#³9ëYÎr,n¸‰àŒåC×œŸUä¶¢”Ñ†¶ÃÖHÒ…®¦;ïDœ<ShU¯Ùh(Í\Z7\"\'ó¾ç‚µH5zÓÎ8û¢(ÿùdé#ÿTKßJ-}Ïj1+‹‹[åÆ¨Î ¯ ÚpÖê®F~¿·ÛÎÚñÔ¬¢õÈ\r;Â…qÙÁ…€¬F·5©j½Ö¥Å ]˜¾Ğg·Bµ\Z4cÖ~‹º„b¸·Éüdö|´m2Ô±_ÕçË,V•Ú°Ù¼AÔÍ8Ot‰pù“9Ÿ2•Öb·Ùj¾b¦}sÑ¸îö#m\0A4ÛÇå5GÁ©uÂ®š£‰Oqû1Ùl·qAÚåàcª7öWäE‚úÖÒ\ZGÍÆµeO¤ÚÊp™\r«\"“%Q£5ÁN†Íá°¢ñ´À6\\º†Áçmıârë¥KéU‰¿)cå•^»2é]£Ş–vCUàÃZº¸Ìšâ6†Ç˜‹ğyk#.6këm±†ö@AovãÜh·V‡aJíµ‚ÀC¤¢ôÜö sõz\'ºl¼îÒAkÕ6RÙà¡/¡ÁyWÏ<¶™wlËè…êÜ,<Âg\0§)G°Yó\Z>\\7Çƒ¶(Q|‰¡M–oô%9D63\Z!…Ü³\'-b\"êË=w¾,l`s[HØC¶o@.®ÕGØ\rŞTw·«Mš×Ãúº†±º¹Ş³ÛãÕìúçYUYTÖdÇ%±_ïvíuÇ¯HOLMqs4ŒU{@uD¹AcB§w~ÒÂ-Äã8	í9Òß;ì–©ºË*Ú¢ll/}òÖ%[t²ÛİUuù6éBmÎ[o%o=ƒT´¡ª½3`ç**ÔwP‹nÌ8ì]Ãßdå½=mbík°]Ábjßƒ¦/„‰›ê\0lGÕ¦]dCw*òHoÖˆ*\\1‹ê9}˜_[U‚­RÊ™:É7Ó‡x­g}aGÿ©–±9},c²î„;¸Gz\Zi,»×nwÂ)+dMÛv‹i¬ŸâŸ6¬®‚N…¶Õ»$ÎnµçX×dfŞÙw[,‹\\V“™ë3›_´KaÆuj[oÖªÍê×ÉiÌùz¸`Cê|$Æ7=ßÜš;\\×ÉêU½Â•‹à4»W×˜êëÚmçŒG;ïØmšB‘$Ó.«ÖòÜ 6èfÏT®êoúLò`Ğ™Ş„Ö~yìXD¥FnJk¹¾tr¸11ì²[©‹qŸ×ç½>Ôö¬b4fœiUGY^›,²ºÕ)oÇµùê…\Z]ºv¨õ(üÔÙ´”Ë²‹ôÈº9W¦Ûv_¨UĞÆÅjL†9‚å/Ìq]°G)ì<rIC@eEtÎœw5ö2=°âˆ<4,58»ë}µw¶Mj‡·îay3Y§_=L·°pñ|‘ÉVhk¸«ãlÑT”r´ùnµ‡f‡[oéh2Ñ&ë;_ßæUúrqĞ·İoÛÓ•s8@“ªmİwAm¹•¾-Ñò…†…Zób­¨Î\Zu[{š·ÙVmåmûßëšsfÇû‰E6P·ÕãÙV‹ *®¢Ègo$ªW—uMÌ81\r½w>Œ:½Š)øÓ¯^¥ùœ Ççª\"5Iãº³X˜fo»ÕÕkì®bg3İ•İ®Ó\\l­u§W‚”,éPn^;Şîá7>8_¶ïˆÚã¡ÓìIÛ¾|:ÖÃz‹\r/ÂàVéuNòÖ¤N›ÊòÆ[Õ5Dv\'cšù<koÜ&¬¾0ÆÒ¥Å\n0eí=‘cĞı¾OÉÿp5kho€©µÆÈ¾Ì¤ôy£5]2¸´jV&WRgh}S‡F«I\ZçÚ|æSÿà,,ˆ¶zT,Á–™İòÜQ¶È©«Õ³Yí­Š¡.õ¹C\Z†$»Ã/°ìŸ‹¨wV°÷wtŸ,ÔSû»ïáB,øs˜°-j.[Má(Ò+Ú?Ü²k£¸,á)ŒnûkwÑm—r‹u°}ßíö\'¦=ì­z3<ÜƒHŞ »¶|´®\r£;&êq n&n6![F&·†¿ª$7n\"ui·\\IÄâY¶Zcé\Z%5×†alú#Ü—¹Ñ»AíVïíèùBº§Êü2ÄŒ«BÂĞ§~¸-SË,šsj‰g››´‚¶¦>÷{¬ĞC÷Gjˆ\rvûV£Ï\n{ÄMèÛj(Jş2¾µ¤Œ,YêD×©íMâ¹†İ¯O¹…»\"\Zı®JÕ†ï8Áà–ĞcÄªk£Íıe¯H¸wfğëeÓZRÚ™…:›ıvOÀİFOãZ£İ®9à{ÃEk8¨®eÁ¢eC«ßPÁu½Ã`;Ù“.İ:ÙuÜ9î›}±ÑîŞ´=Å\\\'ûãª1Ñ7Ô¾«WÍæ×Æyn5«×ê~ƒn:»ñuá\"\'>°Ë«ƒ.çÊ¬Ú]\rêsšµ°|)\n\Zqı,ÕÖ®Y1·uoÖe9˜Æ/ğ~`é­¶ãõÎ¤pUi·:ô°ÖéÒlÌÜfj\rbÙl3Æ©ÂÒWeòº²xkÍ®ÌYóiÙLmÚŞÕpmoÆæ¦¯ÔÃÁCÕY¯±‘pÅµw6;ÊÓ«bv ÊqÙğOÎµİğ¶½NêÓ\n>Õf\'³³úèÖİ­ê“Z…”l?­qL§º£&kX®jˆ;é²ˆÒqf{µ¸¶Ã\\¥#± OêÔã)º\":Ş“jäç”!<äŠ°¨êõñ¨ƒSÓÎ‚imF—Şd°e¹åyYÖœA`®Â¯Ônà”xëÕk–·oÖ—\'uÂÜ,Ü \rŒ®!£Ë)4íOÌBªÊ2RG®ê­Z:çîĞ—ªÎ•=ØoÈJÁk¥”àÿTìÀĞì\0‚-fØKµzÚ@psa«·­1}ËRºß¢+}ZëvÇº4]ÒnãZñ®&,›Œqm^ºš½™öoJ=LUÚÚØh3]İÖtk»ãnóUÏÓ]±îÓÿ‘hOû‹êKâè\\¾ÕêØ—EøŞMšH&ê\rN\"\\V•ú¸\"*uËŞöØ¶Bá„¦á­²h]LóRo¸»>¡ZóZıh\nõñC,öO…mÉŞhŞÊŸ`”mu™ÙÌöàñy€ˆÊ`ƒİNğ€?ô–[Y†D½Á¬½PqòF®fÊíØ@Û\"©‡3?£¦ô¹A..®Î1ÂöDS¢.Š@T&æ™”ÏÒÕq7İ‹%Ğ$Í¼@óëÖØlÌ‹ß9‡h\\º²é	í¥uĞTY„(£#¶lvÓeæ†¹%7½E§İ=_©$QË¾ìÖèÊMjbsİé3EÕv³vËßË Ö6¯³¾LÚì÷ ¸ÕÓ˜ãÊÚ¬6sƒ.—îm\r«ı+ƒÎ•İ\\8›­aÑÊ¶Ş¼°}ÂT­åqW1¶úBÂO¿6ûcáÆMöÂr.İ–íãNãhë(›^¿C50ûĞ´MªIóf5Ñ±ÕÕ”äùªN&Vç¯G_~?×öë%ÄS®…•–%NjûÃn¤8K‚ôóö°œ´àJóäwŠjºua¼4á6é¹›¶xZìÈn6lvÈ‰© ®‹mò*U`76µF[–ö«ÏÚÕ?¹TZ¶Jğ\rTh–5İhu¡^{âµ«îBšµ–û#\rİæò¸A·gµ›Ñtl¨…9ßÂıìäªèêy5lÔµµ<RgÌ^¬]–>Kfp})ïdá°„w¨f\r§¤D]µ†8UfØŠ`†\'ºÙÄĞOå«Yöj‚¯ğn¢=ôòúÒ¯ıS-}+ãWÚ].|©Ìà“NåØ–qŠìpµC³Ñ8P\"Ñ‡AË`ø1u‘9¸­mƒ®-GƒYïÊ\\á~×°§Ç8ô´=c­ÃzK-µ¥ÈÃÜ$«Ë\nÃÄöfİ<8ˆœ»£”íş†£7Y$1adŞğ3­mÄÛMà:kÎ!Ø^2ÿ´ÌÙø¢=jê;š£&mW´UÙ¯Úsh³¨w»™tsxrrëÏxVp˜1yšv.±¼ù–Ö\ZªÚ§¯õ\næ\\”•5çëa¿ª}~6¸ºõó™?´z*§³‡uÁ;şp%Wûº\\L]¶ºv6‹E²jZê–ÖÙ¦èÆªVkŞDJlW®Õßq¹†¦İŒa‡¾Ğò‚¯U:Gií)‚t¥,çÖi½XX×\\¬$MUÛöAin–Gf9éĞÆ§Ë1\'Ü¶8ÕBaJYOÚçŠÁŒjuòŠŒªo/<38“õ^»İWUh~l‡|ÿŠ­é­Ê3º1kÙ—ÓbÛ¼ñ³ş®?–‡=ÿ4qª¨s…YQªEñC¯*IÜzÓèg\r¸ÓºNáîš\"ƒ•¤×ˆ®¶´¶İ5]ÜöâŞ:–W™»,{j_ûòÜÛïİ³\0\rê,¼´=Qk°S{¾ïLàã™\ZöŠ+ÒrOŸìHØD-B6U˜\\¯LïætT»\'Lˆ‘Ô3º£ÇÑ+V»ek¯uuW=bë¨QÕÉi]i26¯¯ûı¤¾¹í7£è¸˜’Ut!rj»İêGÕ†šÚrUùæ!\"³çœ¥‚CØx`Ã2ßªYEdvs\\cê}ñ2\\;^gLWv¸YİMıp‹½Å‚išn¹£–Pq›ÚÜrÒoŒûÍ½Ó_­QÕ˜>–¡F!İ^¯Ñl‘;‚L×šCŞ6¬mÚÇm—¥¤Ã’®§sÿ*Êœt#¦òYŞÚØÌ¨à\'²WEXÌ_©ƒšÌ@’·V-ñu6AüS±	\'¥;¨×„ÙÈNí&@µÜ[Î*Ò¨m¨›ŞÍ^ÌeF¯•Eí°#†95VªmÍ™Ú†ñ®RÙµI÷0èw}Ùp	/GØR?†[e=İÍ]kÌ¯ğ«ÛN—	TBì¹Ğ>­©#ªW\'â6©\\P1åÊN¸oº¿&=‚ØØšdŠè¨9i[›ÆMÎ=·¥¹+v1]ï÷³e×ïµºkoË\rå¡¦9Ñ&¹Ü™1÷ÖÛÅÒãUìĞ§•Qú~»Şo}™wçtwĞÓ‡æ±İ¶İ&ŒL·¼=¶huFY«µJkš=P6Ö’ê.Åõ’kãGÅ›LiÅh‹³¡Àìá²òÜ¾oÖ*\\™ Ï8#ôM÷×Åi~Ò œï‡Ó™ÓEBrÏCHàgĞ¾²‡=C)Ì~q;mĞ=A±fK„«CêÂÈ.wƒ1zPS»ëñ•¯ÓÈëÍ.Y#;\n¹u:g÷vèÀ´½“0‰ö<ò ÚÃºs±y8°	5m×Ğ–p6®®Ó½vg3\rZ¯\\§OĞs–í¬­H5s_ª·æf…;{×V8’º©‚V–‚pŞö½å’ßÄ•™îY¯å©µ„šÖ×<Æ´ğNªû~k-Â¢´€7=mcĞl›Q-¾3Ú	(Ca†Ûö£u¿»ënè–9Ù©	ç65øŠËCSXİ¨9uU1poè»2Ôû4y\ZÁfÏìYóñåÚoˆ4Ö›Ò£©Wµ%¡ßjºµñqÓòWÀ´gúše[Hÿ²áÉŞ^`è¥09ÑcšuLk“9¾8œ\'µg}»Zšøb4„~;“µ\0İ¼jgã´L\r;D—]í„ÍĞ>0\"9ôúg²²Ü3;q†•ú¶3l¨äL[Ïq»Fx{]¾—W[šÒSzÌzÃíÙ»­hŒ­/”ÎíçšÕg›™l.Cv6TŒ2fc òV•b÷\n¯\ZÈ•›à\r®’\"Ûk°¦ÜÛõ›•í#lÔİ^Ko(WµSš‰vë;ëùFÚ«¯°Eµ\\ïŸŠ¹ˆwËƒıÂş”°¦7\\NÙ#¼hŸ½y{5ïpKÚd–1Ö^Çèï™Ü¥g-uÓŞY–³ş6ÜÙS¬[6\'&²ƒªƒÓô¯Û+¾lX¼hŠf·OøRÛ/h¥²Úrk‘?‰b·Ñd=ïäµ·øRl4\rÁÑ‡·éhf··?2[½s®ğäz\'L®éÁeFq»EwÏX-eHiÃá¢AA…8b ¦IVL§Å9›3[=Ÿ¼ÑÄuu0ç	y×ZÒV]akÛÚ\r’í¸­ó±»muÉÉ¥vâ·´5õeãÎ.§ë>>ïÙ`µ±Mc·Ø4«¬*CWdE_”‘í]”[»-^ı œ‘ªDó¶e¬q†/­rréêº&¡³±¯×QœcºÔèÈÊJÃ2}ÆÔi(ÙİP+¶­âÃ5ìµ†Áú+Q™WÑ%±ÂÕiãmÚ„°ÎhëÍ~Z×ˆõh: 4÷ÌUrÒYªè²¯ÖĞ‚4H¤Â°cîd4:ş¹…Ÿ/–|¨ÒRóÚ^tHDu`ËCÑŞòè\n“ºµ<¸ÍC?°uÇy¯ºâvëQÏ\Z{Äèœ‘6{BÛúÂ1øfuœ-¡m­i­*ş‚Ù«ÌœZôÇú•ÛÈ–P½Ñéz¥wĞF!ˆÕÙ)Ô\Zßn:tKWqwY\r.	®®ƒ3œš•ÆÖµñÎí•ezO\\À\0VGq(>~ÑÑˆã¸Øè#si‡²¶ƒ™DD…Ly™H¹ŒbF_K²>ş‰~„ñMyëRæP™øS>¼q‹Á J\ZÌfÉ(ñò\nÃL¦òŸıˆ“¦ÇÉü°ÄêC3e+“³à\rşHEk<B‹}\Z˜9qaË5cÜCQæ1(Ïç/ùÄ7ÈB­EPÅŞ<ïè\r\"24ÉÄñ÷èÿ88cP”·ÚÍX3¢û·ìîš~õ“¤—Ê»‹Ê‡¾i•üF½O‡¤êª0¨6 oÀ“€ßÀ ¦ƒÖFÁ·â¦ÙPÏ…h¬%Ó[:\ZàütùÈi¨®äWĞ¼kä“ş^úæKüå|lŸƒJ\\º¢\\p \nqˆ: ^IøºÌ„:Or¹ü~q¾âW€%>JHMÆÁ1-/ÌÔZúª³8VkÑUîI3Ä¢%5ª±0±q	b‰+j.½á+€\nñ§5Ü£ H®D+~W:`€qpÎ _’ï6ùŸ\0KÜšˆ¦ò\\‹\Z§[ÊGBÄaã0yo	÷œ£Á»ÑR,ğ”lø˜B…Ìƒ¨Ïa„97¿¹¶ß’yüK„å6HÌD$,7ö³\n.ùºSFg|‰CˆÈ#³¥<İu†·ñö4×fÛf;ÛvwÓkÕØÂ~&o´ñ¶7ôÏ3§½{Îƒía\rdãîg«ÍUÂ™ıxÛİŸ¶Êş:›Õg½ ¬1;n«§J;Âè¤JÇJıbšü¡\"÷ouÙëÕ\ZaVlâVAÇ2!î9<é¾,øÂÚ\0r#Ïô¡»9heSé5Â”÷ÚéKğfµî_/„¸«®V=@•¥kpıCÛ—H½‘IËûpqÓı©vVôv×äzë©¾ÈÕ:÷7½j§6ét5Òù\r²îi‹Åp7¯ğ½½Œ·óôrÛŞvşamVß·n»¡ÁÂ^ƒÇW­}ë›ƒ\nÑF¯+½îÅËhufYoD¶FBcÌ]Ø)1Çñê­Ñ›Ã«Ñn\ZÆbÆÕú°WÙ°âÆ²mòj›£30ƒZÕJåjÁ5—Æ}ÃAmé7Ó›_G\\§Âaı¨½U6*ôd°&¶N…Â¯Á3‚î WzââæˆìT¤æ˜ åÍæ¶ÒhÛ¶ÕÉdÔ¬ÏÒöO™g}¹h6Ûµ¹Ü&ä•ÚLí|Rõr\\^Ëó13şy`M×Ö×úr¯zVk8³iÅªõµš1q=m}\\@VmÙ‰„Ü<¶‰Ukó´±FfkäìöÒç¾¿·‡õ“\nïŒUC4oÛê›NdÏìÖ…„ñtTë*âÏÙœéZ|Û„y·êwÊRwÆMoWNW f{;V|õÒ_êÌÈXQ>3õ+sªo˜± 4ç)ŠÍEã%Àšâ@æíV7´™±¦úpØ™y«/ÊØf.À*¬i†yëÌÎ<“AÙş©êºµÑŒ‚PEÇcíÎ·.Œ/ÜÓZNÑPÆ‘ÒÊ®‚TÚ‹y•jKñ³ªK™µq¯*6&§İMŠÆİ:ëÌŞvÆ´ªmor£s˜lçœF+»–äaJÕ<¶:ü®¿Ùt¯Ó‰Y­n×ıõµR2Š³uÛÛĞŒ\Z×šÓ)Õ›XLgC\r Ã—•	êj½¦šèyÖg+\n+)”É6oÎ–wüy:Ç\ZÚ Õ (\nueh°:›¶ĞÔRœw[\'vì6WTó¤ˆ›ë‘ê!ÕÑ\"Î]tÙîœÖÙ4GöB¦O›Å7øõZìŒ´[mg\nRD¶¾8·yÖ>öøóls¦ÛXó07ÎøZ¸b}ÖÂ¨ú¹iÎ[—>Ô±¡–9ÕÛCjSÑĞãÛÔŞZŸ¬…Z÷Ğ[ëc…¬mN¬4;çöhƒxâ©ÃÃœ‡Qêtqk4°F£ıõu°zko‹ãq¬°´{ƒ›¤xZL…jµæCµÚ°5¼b´¡êÜØHŞi¤QóT–ªcW¨_o8p—škÚ˜HÊ¹JÖ¯İ‘6¤Îæ*Zë©ü¥Ã×Py‚7Ğ¬;Z˜lù\rm\Z\'ìÌöFÊ…_°Q½I2\"C/ÏMxÚ˜ÒxÕ“·vÕQÄö‚èætÔV§ÕùiS¿4jaÔz(F9sÑp†ş¡Å§Ö<\r†6Æz—İR:·|‚¶kóæŸxåwqVÃÙráø…œ¡…õËë,({§Ô;¬tj5ëóËä8šİ´™¹ç\\† ÅÍmÊÏJ›j S©Õ¦œ¶	.ÕFËHAn½ÊrÑ½À˜%7ædÏ…RxÇNµyÍÀ«gÍj´û\r[UûWr¾vºìâ¼ˆ»iPâØtkV÷èô©ùqB±Fé‹®¶§~±¾çãR«£-Td¨åòê\"S¢¥œÎC¯>ç•±ÿéÚ´N\ZµÆì•Vµ»>«ÎG.õêz\"×äÆ´CÌgŠƒ1t²frÎ¹m¯j½“iÀk(aÕ+ÚF5“bGZ‹`‘î\n»!Ô¾2”1©ğ“´ÙT0«Ne–&#¹‡İª‡9Ö¼ì±ÖPv»ë‚`grÛgÅ„)sWŞLÈùé„5$¨\rmÈíírk¶wªu€º\ZqØXäuÂ\r¨éÈ@:õ®\'’—‹gNã%gÜTª9uZş©ßğô\n#Lmõ„t–WÜà·ú®u<êçıÒFö|³ã/K^’›‰+ÃÖ¹ËN½N6®cåFªæZ¯ê\'k`5WêxpÂ\'¢_¡ÛHç¼¼´õs6…3u²†L…×ëòâºÙóõ3o(¦ãZ+•°©¶Ø¸ƒ†ÂªÎcüuÕ1—ŠºÚ7‡&ÂL¦uEí8uÄ¯ºæezõÄËévHXo?U†^S¦f=šŒÀ\"Cç*f]ÍU§z©SÄŞ8Ñš¶iV§0u€ÉúÙQÚ—ı”G¡ª»skçêudİ„1Ó\\õãéª{dÙ#|Øø”î;ì\nÕ^­9[7¶¼?,¶3“Ô–¬6v¥I9ÌzÜå†Tı€¨RAcÙ­6zLµ;Şu[^ï¥å¬,á|q‘Æ¬Ù5xe¢·ÇˆÓ‘á	Û3µu}>§ÄVíÒl›{e$@­#UYlÎµ¦7xÅvq\\;Õu˜;5N®ŞÔ)u¨2íS/0o7¦««¬/OJ«ªÕÓ	ï.j×µµ‡ñ‰“<]À•]§Ò«·º;“rCY\\v;o\'³^×—\'š.+Íf¥êª¨\"_f=~áÓ»éÌ}ùiLö§õi©¶æõÖ’¨NÃu[Îş@ï¬1¢¯‡+y³\\ÉTw7èt^S0ı´éàŒiMFk™M>/Dú¸qkW‡ÔhÑ†Ó%á3µ|>Õ8Siîg&:ÄØB¡$âšµ«¼9™LeWûõ¯.ªë	1î¶¡euLÔE7Ù›DğpÒè.puÄí…e]êf×sõpÃ˜¶2!:;îL1gª­Ş®¹%/üªMÛ>nFœ_\\Œjó6İ+—z•;[h´b¦²ë÷vgòÅq¯;¯3Ùk†Cu\'•­vb¯­´®<5¸`=âGÓ“Ç‹Á¤¡HïÂræl8á	?¢fÿ²\\Ú$Ù^ W´5â°P–¹ï«ŞB«Ò¼±æâˆsÀN>­öˆ|ê¾?¼ëş‡!ù\'Š³Lıú…fzãLñí?‚ÔIÂHí\"éa°–à|ÿÇ{¡p“ñK•‚Âê®5–_H´íË?ÿò³Ã0pj\"4XÒ7¸¯aÁ‡:Ü.™E0^íyëV­Vëñßjêsğ÷òÂûKê]5Wï³ïe°ÁNÿßü³Wñ(+úœ†êÃgmƒúVoÇÔç²1È].exåûQ6¿ex‚æóÙû²y,‹ÏæÔög´ól<ŸÑ×3ÚÏ·õ*¼º¶@}xV÷¼°{ä5`t:›ëCêHxÌ´³E˜FSDg]ÍØî¯ÃÃét¨Tzš|\"n2:ªÊ&Ş¤°q³o¢Ûƒäæè3LqP7Z=¡w›>Z¯¨:ŞTü´¾â#·¤úÊ^¯kêìü3ŸQ¯æ]p²F·úò™#éóV¨é¤ØU°ŠGéı‰rÖNëºXuú­Í`ÄªkK W=ë(™Şªq‘<~Í»ÛM]Ò1©v¼¶;ºâKZ7ˆ&×œ²G?ÌÔ^…Q¶Tİ?gOö]6lºS¹=±…®gf¢lVîŠu·“eß]àÃ©å*½ñ¤·<¬\Z|—1æÊ¸!×ÁTcÏ×¹zî«»1m“}óª[üô2ÓÄ‹¸a‘±&Í+êUds°÷ÅŸ¹hTIt¯‡ÙbÚXvT‰R&òb¥R“ËYp¨3EáÒ]µIM§ík‹iìÙº4aÈjµÒì˜›Åğ€/Ñ\Z1M­T5åh*çq[Õjè©]×\ZÄ¦;^Q|:TŞMZLùµwÕÎ–>Qò¶¶¦wíÖ€ï	­#Óî¶.\rïÚ:¡ï®İÎ‘T¯ã\rËï[T]8Ê²ØÑ–tÅ+¥Òb›p#Mï¶ºÛ¹ Ñx§ßå÷~?ñŞ¹uêîeK–gÅl1ê8¨ƒ7¦¬#×gj>ù±±!c·şz}rË®ìE]\nİÍH8O—Âf6³Nî ‹z‡!cA4;j»R«óŞ]À\n§,gĞ¾Í[]waï¥æ¡»¡—\n%J¿…S´¥(½U¯½#ÔÎîÂ.èÛkÌÎƒ§4VXİNz­W+tŸĞüß­DÅ&L{zQ×µ\\İõU¹úå{ş‰ÕáFK·Ùd9„2fVÿB5š’Î…¹¦ë³9¸Öb!˜3·uk7ZÇMŸtDÊt„s«q0¨6w¶–¶öò,q[«L9j=Ü“1ÚÍü•f³[=˜Û8­(–ŠşkËëfk£«mÆêÚz×?ÃÃ5y‘oU‡Ğñ\rIÛg™A\'¡?‡´UÁÛÚÈšU=S·©^ãŒw·×ÆĞ\rjïÚ˜ñô2jÛÁÆŸ,£G÷ÃÅ¥wºİÑ¬E«u­VUj”Şnov5VA»L»uÔ9¦}µ)½;ó§ÙBÚ^x«m÷Ra•şğ\"_yƒ…àÆ…Âëıò6é,=½F,÷‹Æ\\ka‡–Ù])¼çXı\Z¼>vĞkk4„yÜDsdüƒz95¦¸?î‹Vø|ØÕ¬ÖŸ‘ÄŞšõ/‹éŒµ…Æ®Õ<zä.LkLIš}n<šîîÜš6Ï+—j*“ë¸J_›S;ëÜëÕ6jƒ¤G–Õg••åNg‹¥w©¯Â¬ïİœ“Dõ£ÿ{jT\'Õ:ÎŸ¬y@ƒıY2¢\\uš7ÈÖØİ®ÎÃQcufnëéüÊ·-v‡¨^C¸AËaãFÚ#óèL>}´¹‹µ¼5N}èêÚK\\q‹³rYè#\'î…Ææ´Øj}¿X%6æjÈ7(†¢º}äHmöMsH[ji­†ÔYÙqLsÖ@nûQƒ¾¬Z×ÅX³JW¯òNÙGtÒm¢ÃQ•·58a	ía^©AĞ­:p*B¥:¿VœJo6@OG‡˜‹\"z]L§V‡ìÕ5J3 £Gm lÜh\r)va5ÙF¶‚š®/‡;³İµ×Ú±åõˆÅÚš2)3Y»øDfÉ–t3¡^#ÖfåØ3D±²­×ëH‹oò—Jİ?B˜X¥‚ğF<ßH¨ŠÔW7¤‰nù!±­ö­,›\Z/ã³[»Å‰&Ú#ë åSñÚèì6ÇõúÓ`û“ŞiÔ7.dÜ–§5çX¬VK½\r8Á?\"î¡Ñ‘%cñóËºƒ@=t·Øv™œö‰ñ–£obãXm´Á¾³êê™ÅõáD×ÇÁêÂİ¸æµôÊ™0£¾8‘›Zx†4©ôNB!èTq;ğŠ›ÈL[\rüÄN±Şˆ¨ÜZÖ:\\·û½ Ú0¥Š»ê £ğêìî*ö°ÍYÿ¤bu6-Šè ıÉ˜óÏœĞX*ı]oÆ\n“î¦e™W£F®ª]‹Ø\r—ÚÏ[ë÷ZÊæIx±^N®~8s•*ƒóÂußØ·¼V»;†¬A{ìjÜaBœduVnïâ])©±Ãu¼u£;§:Ù¿ÖÜ‰;gÏ-nİí-áøTÛßÔÏ”Èˆ\rsÃzuW¯ÒŒõÏ-|Ú˜]á¾ {-iÓüÓ8²7„şÆÄ¨‹R[k¯M¯tÖ°®ú˜¯û\r±*ÛÜM77ÚØ·æ³ÙæozOmŠêa¸Ÿê-eK²Şì¬šür4ĞugWq¸é²ÅŠªhm{1ï‘“ºŞ»ª¸Óğ¨5Ïs‡ÙrÛ8]ú“Æº®qmÛ!üL4×L½OMï€i-_{î9mhoâu¯ûí™svRGqI—\rB\"*ØÁéN§u«²d\\¸;ªgìïŒ+\'ûBÄ±*µ:ûBC§¶2ªôp©}r_\"«#îºÒu¥çÃEk.J3§İ\\İÌ´V©÷P	wzƒ9=Óp‘ê«6sˆŠyh9ÏÙº—ÆF¢†U·m·¹^İ*M”ZCõ\0Ùíu«µ%»>3Ñ<jÀkªA¯öË:Ö_èı›PŸ°\'Jİ,şŞÔëâv6‘ü§fçúŒwj5lN—â¨Ko¤õ2»¬h0Gc‚ãW§»vf>§r}–è¶’‰Òn½Z)mçÚ:¶\'¸NúeÕÙ¦¾öÎ3w¯/f\Z6”Î®Ç¶VëËhp:àìş¸Şqk{}¨(Rû¤›(³EÚüuÑ½[¶$ rª­n\"N/°©»©˜<rEÙ©g/öÓQšs¦ıMÙöä¨ã\Z\"v·MŞlGUn>ô9¥cóãÆ²§ØÒTrÍÃŞ8{G‰Á¯–Ùà.Œ½™œ•Óhu–eâr9©k’äd£12r<t¶‹¹Z§)“†ê©\'‹İckßÎD·Y“M¨Aw”>äËªò˜j›t¥ZÙskœés×¡2a¥:ÒèÙ\'eÔ:HÊùtgJ‘²RŸL[Uœ‚¶{õkSG­NØ:‚ThÕÃYíl±>Ot«Ôu=‚U«‰03¯Óíáfy•é5õÕz!Ìdk0_g2 ŞT›tKmÂg9³Z‘ĞH\\L;-¢»:uj=å*ÊÈ³[æ–nkUN VÌ¦-‡•&<[+#_°\nÔAG.²aCKZT<ìz%f.ú\'»+·GÇıä|›½Ù2©*\n]™áé&ûl^—^İØ†\']Ñ)Æp÷/}}fÈF§Ò˜íñ…Im.:ríR[Ø°)\\lÁ5fÖPG‡½4½Q³A·N)­Ï¢\ny ¶âdlO¸*µR/¶#Ñ¢+½Ãò&ããÙñÓ°²¦9Ò¥å‚ÚJ£Ş[IòÉ±M[pÜóğ†V,Ğ¨z¡L„°\Zí¡=se—èk£joòÚfw¬¯öè’iÕh’²İİ¢õ¤=sıg|Eõ£eı8[]ÉªlÎ}œÍjUÑá–Ôë·üY4*õÊjjwÎİ\rÕVs2è%\n¯˜¤o´Eƒ¼‘½í©\"É¬LõÏğÍGêÀU¶èğ¸¤+]©­¡ÕÉ¤ÑÑZVb!ª=bØawC†ßFX}£Wnë¼…TŸÍ¬x¯É·B{;ï,Ádï:5ˆfC¦gc=Jä,\ZÏŒ©OÊ@h¦\'ì„Ù³åşº%lô!ÇÖö›‹\0šÂ…ª¨\0\ro‹ºµ†fxu¸ŞÑm½_›× Ålat \r»—o;ƒ3¶;…-ôÌíÌ1í\rt	ÃnkëÄkÏ\'\"R¶;ËÅîŒ¶VºQÃÉÛo%ñ\"è›•¸!lne4øA³Íóto¤®º˜Ñj\ZÇM…ğˆúÊ9s‹«)u…›<€{n®uCl©ã‘ Ë‡å”±ÜÛuuŞñZs~ëOLÁIéV§©³=¹íÎ\Z­[¥dşØÎûõí¸\ZãıîX¯Ì×-®ªËë¬Â`ë,±öÊ@áîl‡usGÎ>“aœã\0nŸíÓyèN‡ªØ¼.½¿Ó+Ûù¦‡Öú®tÒ÷bÓv6kh¬šçÌagNÔåz7²Óé÷*C^zò–öÃ\nï]›£ŞÚ~¥İpè0ufáí/HLÖ\"±v t×äe{2jï|®â…ZR³İõ¦‰s;äRp.±“Ğvgà.õ=ìÈ“í¡À}±‡á5H˜oyVõğÎH“ºÈÙéÕİÕñ40Æx:[İú\ZÒ?Øcş<±ÉiKb¥-Ti/û²¢¸G±5Z.gâD™^­_Wögœî:v­s8©Ë®¾šÃ4±Ş!‡>zXõEhÔWıC«v£D”o.ôÁ<,äîL£\'ƒÖJ¾Dj6õZåJ×ÑöebP5ÇU÷LÖ*[A•ª\rc´eöÇ¹@e}¬4íÓ¨?¸ÖuªÑ©ï5%gîy«I3êè{Î—ê79ç‘;TwºV{á¸§³¼ê8ZßÀÜét=«¯*[ÉQŞy@,7s~ÌÒÁv5Y/5•è´=Æ/`B «¾ÌX=Óòm®4¶+¯Z²Vìå²ª÷kyœv°Á¥SoVÕıuÇXmü8›^¤\nÑŠÚgcj]çéyØˆ«z¼LÇYC\Z“ÈáZuvãâ¼O˜GÕId×¼ö+‡=ÃÊ…—9ÇÄÏmµÖ2Š,”éAš	ÎI_œv˜ÌcèTÈ\'Zà\"Aot©{ÂOW²\rÛ×ªÓ;t–Zßöûç*- ^ÿêã/{şF0ƒO¢·ÛÃ<ƒ|&¶oÕéâ½İi:æ~éˆ5mviyœA7ù¸¬Aê@êÔ©Ëvxªˆïõº+tÎ¬[+´â@¦»®Ş¨±ì²êĞ¨öz½*½#æP>YÂA¨w«GßDQĞV½Š.CŞF¤ƒS­U+şiEmok³ºní®µíË}ƒÚO`o3r…ºT…bí–)Ñhô5_L\"ns¢vØ0:¼á¯â„€æÄœôÖî¥~r¶Ã“6•“ºêªÍsŠª¢ĞK¼&=ñ 5iİ{hzW\'Â|Õä¯o\"çì?tK±Òzî»ag˜m<´§ŠIW©´Ô‰åÂ`£Ïá}`ğ£dÈ°P4m—jpšéå†¶%?ğ\nÿØLÃv¢¢äî=Ë~+i*Uåë…¾¤Ù7îI¬ùşĞ¶£áLg*é§Ãù]Z\'iiRæËØÃ^4i1\\?6±VÚÏ»2SàzÊ8Ì_E•Db£àòé\r)£j)\rõëµa\rGêi’¦‡A.òGb«­ú•rØ†ÀB[¹(reœ©;…Š€†ù;EcAÙdóPóf×#ÚtCÈ#;xø1ÕÄïGòû­öÇ«Ù‡2VµHÒ¥‹íÈgÛzğ$H¤`ş*äJœ#¨ÑbÊØ(¿6_qõhLŞ_¬7Kéõ•Õ5›L*e\rËŸÔH‘fyÇ]JE8~„S}ƒ\0^i¯ƒ»‘e‘vò\rx~QÉ+ñÀ¾°f²ğât.ô°CÓBá/SVs6\nÁ_†TF€Åƒ5?ö¦™öÑ»§@K%pÎçûÆj\"IÌû‘t:Q’¶ª8à”*Ÿ‡¬9o’®;ïï\0L¦È!ß©ˆLùP)-Ñ€Å¹-Óì*a(/OE<zî÷è#ngò:e¶¼|µ¼Òd’´0Ÿk*I–Ë1Ø8ÀÜÿ³fÃhËW[â‡‡ŸÅ’jéAÏ5|*koP‘ZÒc\ZÍ0IZ¤(©y:ÓYX¦Ÿ~ÈBI(ñ4s‰§œŒ·Õ`§J½Õr¼\'Ì¯öÈtË›ùRŸŸ¯kÑ±laÀ¿œG¢µˆ]`âÂri¿3yf¾Âîşííkh¦—W0xäWùë|Ï+tAxeÑ~µ›‘W.\rVD¿¾èí›àOŠ÷—dË	RÄÑîÿ†ˆ¿ıˆ³\\\Zš~ıŞò?SgÉµé‰hó’\\”²0¬@‘*Çã‚¹¯%ÒnŠòy€ÿ1ŞyN<÷jJ^fby¥kö>BPô1GJ¹p|&Ø¼eü¶2lüÅ*æ¹ÉTå“ş¦—òƒı½$m…É3ûB”ñ«¸;…y°ƒ¤ßÃdØÁwpzÄOÓå¼VsrÂBÆñï«ÒZyßÒ`Qğ^@ÊÕÍå¡\n¥ÏSi¯[2íc›‘fÉÔ‚K-ÈpSûôÈyQ¾sIª¼8Hø°AÊlÆ„ËH\0Ëî[SÉâ±à+ƒıı09CÊ\'îÍJ¡Ÿçîûb“Á‹l–¢t“p®É$#<ˆ*ó§Íø”\'‰ Êø7 •Eš¤‡«ob:ªúü°^\ZÛì^ğ§a†ƒ—!ğØ„:ºD\\ö·…ĞI6È³‚rîûO…gœjŸœ49İ_J.Xñ”:JäNfa­ĞGS\'ÔÍè¸\0ï¿°!¥.\0¼xóHûU‡Š©û±îC<ÆJ»oˆûO²\'ƒÖx/)aH®ä(N1F8ÅÃÏ€á&ã\rƒŒSq§ƒ)¢\"sŞØáÁ¾˜›)—‹<Ä+ü\ZE\nÄ/õ4MÕ£ÅÇ\'ŠÁ¨¾à3Hï³¡\n¥Pli½HO—ì·ĞÛGî,‹×v„ÚÑtâ´®Ÿ¢Ÿ­ ı@¶sY½ÖëD”öµÃ9KOğ—ûûgz2”O8ßû\'Œ‘ËsFÕ‘äŸYÍ@âIMµaY\Z¬#Îô4Ÿr87È5÷;ì7.`È`‚Hß¶-9‚³ joÒR’eÿ°™vï0³ß×Gç9*!7#–„,#7Yéfÿ<Í¯íX²¦K‘;ÅÏ¼$HxoY¶Ë¥7î×•ºŸ( KßÅ‡Ï‘Èe?Ïˆ¦hF6}¤°*JíOT|ŸŸ~[.H_Œ!ùÈHN›’Ö+€G;/¥½®óÏ×, ì;Ïo\0>‘€‹z¾Oë‡«â	¡\nàq©k8şü•Î#°Í«·;ŸĞÊÓİ5Oúô+.á\ráZ×_œäâÇC„Å\\eé5¨2÷aëG7##ŸŞ¤€Æ0Õm:ˆÔ#yò•ñ(ı^GĞr9ğ6ü\'q:Ë_ñ¶ë¡œFS7ÈhNJüô\n?GW™8TXÙ“«¥\rLa‘Ö’c€£|úŠ® Çæ€·‹ìvV€”‰ÆOÔåyÍSrıwßÈ‘÷˜/hš¾x„ÿdùlŸı‚ì¥~ŞGè±]\'“^ª4+^†?£Î—$ÆÜFåh¦Çñz™².[<ò¬}+ı|¥B˜P4} ¥à•µ‹$&©B‘\\\\·\\ıŸ©!ËIÃ•Så³çæÂIr=«‰Ly|‘—‹®÷œl‘3KPHyf“ğtó3*1\0j2,`\\!JüQÉ€8©&\05	ø\Z\0„?w\"!‰¢€\0£uC‹ÂøbÙ~`¢^‰æAZGø\"WòG]ó®Ù®¢,ƒ&Š”0ŒŸĞ[–À34•	Í.“wİ.(<zû?¡}/G¹¼Ã>£ğ¤Œ~|(r’¬ïOGâÃßkƒ!ûYï‘C[¿<Ôgì«ĞÊÛ…Êû¤t©uZKLº0€å“/$8ç£ÙdH¦•X¥a©É%‘0êéöŞş/Í°-ÇóÏû_Cÿ~T@úÉÈüü›m¼D¯AÙH>œ¥‚)°h¬ôû„2´™e¢_¤…ò×€P‹’ É2şÅşíÉûH¿ô%jR]z2™QÄ¹’‘zdôN“œ(K°TÿõÍ´rjîWWîsšˆ;ùş»ó×NDià~À¹‚)CŸÙû·tˆÖ²uùi‹o÷ó\rè\nX¡ÄüÖï§äG·ÏA”t‰ó¥=]O°‚Ñ\Zİ@ÒñWWZ¥\0eËòr™1ğÉÓVÌÎ²‰ÜÃ¼öE«°ømˆUúu:{nº^ëí/LNRáOLNDÕœ­ú’v›Ø”„H\0ñ8ïXX]¥ŸÀH<î3¹é· EÂU]5ŸBû÷@¸à<T¿©œø[(âwÜËKáaÈÌhŸ‚‘ºÛæd Ä7ÍPİˆ¿ÕåŞ pwŒœu(½YúßÀ`¾%\"XúQ÷ÿ»Ûıçë>>GÚ¹”`<l-$øÉè%Q¤í*Ã.ySIz¥ApğóYKàóÏCE`ûZã…Ş%\':ò¹#›ã/Â4\0Ádd \")°Ù0Ñ¿	ıßŠÂèÙ¹{à¿ş[&Ğm@õ…™üGµ	Pı¬5A·\\)T=!m ¨¬‚#Q÷Ôz‡ZVÿ;	Âï\\Ã–¶gûÛø·> ª½l©ĞŠ‡cctâg¸\Z•Ç1~ÇÖh«R§¡nOé†¶]‰6¿ƒ4‚8V»ZÃŞ6!my[†|f‘¥Å-Ôš`,çÒ_lPÛÙÜô}wGVºÍ66UOhÃºØf©\r»¼9¬I~}§ÓÆXÔ‚ïüj	mf¤Öí(5¿ÌYl»õî¾µç‘Şm©£İhò¨ÿ¹¹8¯ğnØd.İæìh4ß ÃÙYî¨ËP#ÏÁïHƒ.£¦vÖut¥”.ÿî0eÒéí·;{6e6w|cjLf=KìLÏc<‰¨ˆLá60ê×í•¼Œç{|p£®ƒ[÷:Xûõ5ø&­ph³V<¿ş.—Ù®G;ÁĞı>è\'^k\\·íMm³êÄ5[ïjİÇøıœ/ z×P!±CÕ×úQ¸ŞçbÇ#ĞIj·ÎƒsÒuÇÇ\'Ë6~›#ha,38û0ñ˜7Hİ ª*Ğäe°£NìÏ{qòëÜxtyİ ËÙvµÙùs‰ñ«ËQ¸ÙÁÜ¿ˆK„‡ÀÀ£ñ¾~åÚ0Zî´]ß‰+XçƒLÇşüıSŸV¬óp®ø¿:jR¨?OÈØŸ¿q“Â†Ğâ:Ü1ç1³€Ø[¯5š…ãŒK­İ\Z3›3{[¶Ø9s2ÃËp±¸²‹.>ÚíÏãy‹aw\"3¼\rÑ4¼Ù\n¿‰í–?6Ë<=oü\"¼ñ~tİ®ZO“©»ş<$kåÚuÿùÈâQJaá!Ò¥ÕÑf5²ı~œD±#ZIÆoªû´‚lWÓ¶`Ô½n\'š×±¡tªòÆHŸ-|º	ÖÛÜŠ­\r›, ÿÑ=nİóh§\\‚ñ7G-Ÿ/Ã¦Ú\Z1Ãët¾Ğğ|º@—ŞÖ§Ù¼}yŞàæãN×Cš¶—·\rÚ³…ÎÔæÌ_ëçS°Æz™îÂréµ¼Oó7<ºÚäFœ—x«p8Šãq;—´Bš,uÖ“j¯¡1ó=Ú7&Î|‡â‹!Ó¡Æ™*mh¡á5v¡F5ÚPã+»F¦MXŸœÔ‹m/WF…*§êøv#ˆV­ê™ÃÖde7|3«NæäX¸±äÍlÔ{›ózß7Hy}CëpŞ\Zˆt«[ëêœ€)uHUëjGiÌ+Œvj¯¼É¾56ˆ¶e_kçñµÛ<\rÛ:Ò„óèº\'š³3sÔœ™¾TøÊ–å!ëµoìÎØmİ!f×/{±µaÜQ¿+v§;Fa­lÑ­hÍ»‚vm–\r…[SN¨Æ.£gP=íØĞµŞ¼¹jw­}cÚm\r?màaß€û‹“kööê*œ­}G,ÏK¨§\\XÒ¬÷×¥¥oLKQO2…(}Ê ¸?›Bó©³Ÿè—ıqwë‹îeÙÚïtr=ìĞí>kâJc¶†Ççc£ºmm{64$f5jëÎôBèMU55öÖ4&Ô\\Ád¦N+:7­„c¯‹HşV&œÈyÔ>×4½åR³í‚æVè¾5ÒÇkÕc²i/ÎÄqM9oo¨+Ë­Œ<Éë7ü-¥3W0†Í´\ZÔPn¸Õ¶N×íš1@ùCg9ÂzmûÖéQï€Nİ/óÙbyÅIGBzû±ãñ<ÆyĞşvÚoùÎô(;Í´ªb_Ùv0Sw×üAkÄ^ç(NúõÚyÓ¾Mˆš29O7TsR\'Ä¹ÃğÓ}I(Š ÿ’ş%üK\nø³RÀô/–¦ÍIÿû¥\0t1Hj×è$Y9ÜéŠŸ¶›CêÜj6©Î…efFwÚÛPV±æšÕõóâÜ`Ï\rÁhTĞí~‡ïHkñ4¯{{OØWÏ[ì•Ö€R6×É¹#±uú¬ûu6ØªI¶½Vk6Õ™[«ZûµÜí33dtªB«ñp)^õ¾ÂL,fm«ÂÄîºüşÄ)âL¯áëDĞ¸9-îÜz³Õ00³7‹}øÖÕ¶º»ªö{5QïÏ¨½FÖÃ\ZÄ®¶øu) ƒ~‹lG=üÊíEF\"…ĞÚ{seˆ·È#¶YsËÖìÆcT¤¥3]×<SjËüĞ9Üºf]³¨3št¶—á™æ{ÂmLŒ1ÁN÷³åeÑe»ÜŠòn#Ñê\"íáQ54^ªXÏùÅ[ìPÒ˜ïtl~‚úó*, AÀÊã¨¾éôÎıYÇĞ.S¸~ÁÂ-`¶X§}œŞt»Ÿïr*+²Ó¨ı=¾W~õ¨Œ¦®èá?TÂ2SFœÑ©ˆôò·6Éëô_›ä?É&ùê&—İÌ\Z£ùÒ¸Îš–/†â>ÑX\rÂù¬û:\rgØy€ÀŞàúhÓg¼ÁæøêÆ|[vôóvVŸù}òñïíZÚjÃh“lÚMÎU±]¿.ÛõïÏ)á¯,ÚêÉ~ó7Œs—ÍG\ZeÍW­çY°ô_Û¼\ZÃE¯5„ØóW6Ã\'›ëŞîSx!íFcÌiÏå~jöüñmÜÄ–?;ÛßøFĞf…ï¶ñç2X?Gn¥ïÇ{æÂî·i³ÑÎ{c.Óy¯ÁîöÈxNáÃÅ”ùbÁğ&ÀşÜ&ğü9ÁşZ8ŠÌŞ¶Ç||lXÁ&ŒŒ®Üºq«úq¢Qä\0½ÓXNj†4åm×S5x?AÕ³¿©;Û5«ø›êŞÇã\Z¬åŠN„à˜0ê%¹U!˜tGç+Å6Z\rª¿Q|4Ïë³éˆÃv£©iÍÁnã¯€Ù¼1™lY©O5!¹8#g¶˜ÑXu®Se·Ø;Ú…]µ™‘Í	›	<ß/ëÕŒ¯§ÒráÜ\ZYGkÂ×¨ÀÚUÊÇ«½fzæy¥Cí…^’­H	‚åœ”u•eª]CRtÒj jó(Ğíú¡‰š{b6«.ñ#+3u§³Ô°µ\Z/nÉO96X›XğÔ®1?‘î\\´4í\\ë[£şU8S–ì0ó¦¡èÿÄç@mÚÃ)¥Ò<î+;ä$.L•1ÈFC¡Û§õQ^,•³~şãT¸·ü%§©¿h£ø×iêŸf£øÿûÓÔmšÔgÎ×ébÔfµ¯¦FŸ3ü/¦Fÿ¯Ğ©–~†øhÎ\"#»î—Íé¾û\'OSExÿ jk4±ªÛî:ÕùúÌÖhÿ4ÕÆÚÄ‰šËps¢¸SA.–Ø\"*Ö¨S›ÎÈ?68,_†ca¢]İI·7††ˆW]µQGà¡Í*!«ócm´ìÙLB\'çêüàW]¨¡rê¡Cé§+CÛjöm£{µç§“ZÁ›Fu1C1>PÔÊjÉcKÍ«¸Ú¤µ: ¤£ÑluÈ±R³Õ_t`Ù¾x‹v³v¬Áã¼ÛtÅ¾¸SU1\\†nL§¤k·;^cÄc\ZâFûuQ‰BmøŞj|f¦4»ÜNĞ„œ\rÎL›jÊ•ª£˜ígÿN/¼¼w¾x5ø¯óÎ¿¶±wş‚óÎW®\0_9ï°ÿèóÎnÚdwÔ•…¶í¿ä¼Ã›6©óÿ©ó|–á Ÿ.5Æçg¨W˜^pŞQ70Ôm\n¬HQµPòªÇnkwì®¼şt³ç¸Ô¯N©kÛÄ„½9+’¡Óş~¢nw[ºÍìfáJ÷®·ÓÑj¢ÊÖ:ãR¹§•ÈÕ şØëõ•†¹ép&Ó×&ÀMå|fi¹i÷\Zëºhu©S–ŞMr•®(m/²:i™çÖØ*i~<OÉQ9QÃ“Fn–FÆß}>ìËİíş`“¸+	ÕM³µ[L>í:æúÈWñ…L/M¨Ê½İ`GyMOU[˜KãvSGTlxn¤\n5j;×å”\Z¡8W­W÷ÌD“·17¯İ	³ğ¹5¢;³µj\rZËßŞ‚şuú×ò¯ƒĞ_vJv‚Ëğö—„ğ^<Xıë ô—„êµrd„Œ.4j*Ní`ÜÌ&ï‘¶€È“a³ÇRØ´5 jKµØaƒê¯8ª½Ÿ.’a<Ö?ÕT{H:+e»£[Íæ¦¥õÆa¸Àº3¥Úêï\r÷Ì²ë}›¹.DHñê‘Keowû.ËÍÍİn5—gvİÍ ;h®Ïí<glnªoš«¶íÒÕS{7½ªäfˆ66í©KÚ•ÂrTw?ÒqiÊV˜Æš=pv:š.™úlÉTÉå°b,é:{hO4¬mÚ0{Zõw{9\Z-xê:]W<lk¬×và¡5ÙT¦¦Şí®èıt!Ğİ!EÄîö\'„uí‚®BOÇÈÀşÃU%]ÿÔg\'ïx7k}K|¹³PCïâäÄº\"e,tÓE+W2x’-\"X:œ+#øX—„L\Zªpò¡ _€8¦…>i)Ï´@ôe€Eª \\-ÿ@ú‹·Äë[q¶2OL+\n®ÆV/Ä	IEİL‡ù{Ùïˆ$&n&àĞ#¯ùx…Î{IŸ rßËÍŞâÓô”ö]\r<]£ğ§Ù ²\0âÎ»\rÖÄÀ‡_G…5®n;–íOÇ5rÊ@DíxE~ˆ–píäİÈÇ ½\n.…¢w}>šXºJÚÃçš)\nØq‹ßùHùsÉ Çùhä=zvïRØ×—jşÌ†®*v\ZT)å¦c]ô7{Ê“¸şÉ° uâëŸ¡Å	±›—¹w³!Rç\'€\nüÁ±ã@¼ \'~‡¡úúó¤¹\Z¯éA4å˜\'áƒs®©/6ñ-^–3kìİ‘,\nñÁ-Ú\0~WÉ¬D>¹¿r¦dCWÂ`Èò5bœıÊ™šù\nQ˜#`x¼g±óa%Bo˜hlğT˜ğ3ĞÍ8‡A·¦È\n‘lòõ$QËÇ{¶pe‚á•ƒ,èx5=¥÷|ìB,»ì¬ÇD*—ÅwèøJŒ_qZKñÿ#ğ–ŒqK!ğˆòq\r„SX(@’Š×ÂGâ&ü\0ıÈ¥¶ğ^Ú°¿Á\n×(TTóG¯iÂgØÖÑ+”~yb¥ÃĞ×A´\\ \0~\'‰w	¨\0º?ú¸Çé(A*yÊ‰»£ëùÛıÙ­rş<>[“Eñk\02ÃóşÕªÀ@‘(RQìU4\\Ï±L%×™jRí« ~«/©ÊÀŞp8J Ä«¨ˆš,KĞ˜í/‰üe¿ÕŸtm`‡x®ÁµçË4Cäa¨—{0í0ŠÇ@Ä\0!©…ÒxàqÜ×¡9××hö~\0iëexŠ#If–ºóá]¢uW\"ÕÄ@\r‹–ÿ+‹\0H³Ï\\ Ÿ½éÚC¢Ü>?^¬z†ˆJÇwE£Z4Ò Ê\0ˆã™ˆˆåèåÉüsAÕsé?];/¼§Ş%U9Ó?¶øÇrã9Ñß¥e]º€öÆBv«/ûÎÉs~Ş±59­…±,ã­şM+‰ˆÿƒ•HÅ%ÕSJl	€ú$•æqÆÕˆ5	q‘7f*iº 6€>r|½Pã!¥ãü¿ŞÑòs`œ\"âß)]²şııßg’bIo‹nêãÛJâß¦’rÔ9\'ıxv5xK÷ŸüÓ¹ÿ§#é\')Ğ„¼¤£ôïï÷ïï”£qú»Ë™®òv´t,!{uÄ€Š–¬~À¯íù¼òY£¤Ìği­ïNì,Yq;–²’K¬BÉ$J¶é¿5KÚ\r˜Õ‹šGBÀ ìVŠ­eB_>p/K~÷Z!Çy@ÊÔò/\0¢z/Uˆ?B¦å—	âG}}¬ü9ÊÇbÏb\\Ğ¯\0àsÿ‡€?S€Uv‚/{ò+$lV§\0ÅÓG>™SX	õŞóì.¢ãŸÍıJI#ÿc×ŞŸè\\h¿1Aøk»ğ8\0ñÉ¹WåÜ¨vPá­ğkeÚ}õÚÕÄ8”¤jùÈXIë_‰ÛùÀ8?ÏÓ0_/ÂÈhLâôb`üSÈÊuÅ%ùˆ}rI´UùÈnÅC÷WÇ6½‘’ÃÜ§²å«å11$íjh³â7ü\0“¾¥óÇEáêÂséÎdY~ûoõz]¨Koé/é`wšéúsûÇaCà|tDÏd–\rÅ‰ß±\Z „àŸNd5Ğdº<ÿ-«n#¶±ÉİÎí7h†2H¡4lĞ¤2‘ª;]`ËÈz|6®X“84cíĞ3\\¯>\"Öfctj¯†İ«l6uİmÙY¿¿dgVëÖôËT¤ëˆö+ª·áœùÃ«›86]Œe}l`OgdgÒ¾°}h9^‰İşºª¹òZ2¡[êdW®Tª¬u¦ššÇîùËj´:†WdŒŞšïgGÖ é?€Ûd«ïÉîZ¤½d¥Â\n=e/ysßt ôŠ®Lv²Sj~_)]Ò`½Ú\'œï	s(ø*Çròß€—fK™,†ÑÂNñ„œÜæ¯M(vüŞ8Lr.p‘Ñ·á\\:Wr\Zü)T‹1Ñ)‘jñ9œˆ1¸+D({ÀìO¢|OYÎ\0G÷„îÑ=K¤?ÑBª†çkó³y\'}ô_S_<Íü¿h¤Fwé4 H!uØ—ÛKEOÎab1#ÂWÒräaÜÃâü§çğÙD½&rgfHl.çhğnÄTò&ÅciÊÊ\"JôÎŠ·G¯q–lóï…\'I§ÃG¯”qcÍV.wKa~&_O+bÒ£“¡ÇT¦ÜX}{ÄíÃç‡„,¾Ø—{ù25î#`hZ`×JúäÒ.ƒÔ‹\\YúY’p\nI-S/Cü:çSzø.S.8©æ3$ÁÜ¿¢E”Ô¨´JRä>^Ñãä¬.…ö	~y¨)µ\\›ül§o³Ÿ´ê[Ò’qWCeÈ*cZP¢¼(,+àÕb¢‰&ò±ÜkÈ¡\\½¹$e¯Ó((°>¸dÙbŠL4¾Ì â¥ZÌ!ê_ÉÔÆ|/šÑ|:be£ÚYÈ›G €ĞÙ¡Ê<ˆØF©Q^¸·àø{ôÿ7ø´]ˆ\'=®~fDã×ª…àİêgFÔşuÔ_(¥\rF›ô^øNêÖXğK¨?)™y>•õ£«t˜y(‹0z…w?Áp€Õ4S¶²Üéw\Z/@ÁÒFtFDp‘Æ¹\\éC¡	šnÖ“1ÂÃ%–ŒGbÂ|Œ~Éø0²pŠ,ŠÙ_ñI2Ö±„újœ#\'qD‹é3\0È„öš`¢2XŞú|™¤o;ï7O¨âAÎ/“ã\'”õŒˆã»çGªIPÄr4{	ğÙ\"/¾ó\'*³a#€ù¸îZÔé`n£”ö0™ÌF’l¨}šà\"Y!~÷‡¾ä¨Ù®æEé×ó\"föÍæ÷¦âû•,Şë¨Ì¹0#æ|#›.åN_x@”¨Vƒ^¿ÒNV%•½! ¾¨®8šmB}raX§¼µÂÓòÈñ€’%±¶óÚe(DîÏùxQá?lâã¥íğú¿¼„ÿßíãõ//ág¾W4º\r±é®ÕšîhÜd#ß«¹ØdÃëpŞE‡Ğ–ÍhL¿âv‡×6?…÷\'½„YtxSÛÃÅ’ñÛÁFÍÈ«w\Zì­{î„Ûtß…‡s{ÍKø¯õ9¼Œ—°Åñæ.ğrm^’Û­rªV\'çaå6ìRÆ~Û–É­Û¥¶Cdsî–jSsbŒzí5co¨ù–­ÓLW\"ÛŠ¾añó‰;*Œr¦\ZÕÛmÕ¸*ÜÁU\0^´oÑÖüI]»<eå Ó?İ—Êd]œ:#?Û<^ƒV*÷çŒ‘bC¶”·Ë=ËG®vx!œs½Š|“üïÖÑ‹o@ŞXO³òÂ×ÏÔîö²‹Uf$Ê-…–Êõ¤9Ûí\\ÍW<Èb[ be$‘&k¯õ0ôyo` òªĞ6(e”L¤P>Ñ7¥’‡3J’‚3eœ ’äó€öÀ÷fi¥W¢¸zxP„Q@%@õrÃ™[°çPÓx¤Ğ{A3ñ¬ñÒÜZ¥\"¯@P1\r¦ñÅ€&Y‚	æ3È<ÜÔˆ$eä×Ğ\0æmÎÕ=kúç@\0äù´>Ê¹çU}A @~§{½ôw\Z jŸ5ğÙYú¡b*UÂ€AdôNl=÷RÕï‘ö_ÕôÇõ`)ä˜i”Ì}l`ú3«NÊŞc÷œç9\Zï¯û³P<cÿƒ9ü½~Şì8ƒÊ³ŠÑù7½çµPrÁæÌ$dtÑRzIPVzÁ¾S^dyV_øü.FÄóB@x™²±·6Tr5ô¬^,\0Õ½QÙ\': wwpÎ³˜lòÛÏ3³D“’RÈÁ$r^èy:Egx¯ö‚ûfÆÛ·`‰|Æ+CÒˆÌÀK˜{ÎŠ¤Äˆşl9{Ş\nŒ†JôÌ)û‰X¹$@@9ĞŒò\\¬H\rTÒurÖÔ´ÎT$Pe©FHò´òÕ—¹¬3¨r’â÷IåÈP7É0÷¤®»¿‚j&V¯OjòúØÛŒŸ2¸ªfŠšb*g¼ŠÀ•Oš¥K¨r’ÿ÷Ie;PñªŠVçAı¨*kNÉì\"2L|:Tş$GºÖ 0’~Z=Š«äÃ]¦AøÌiäúşi#A©²F2–eıô…Ä§­„>k\0à¥Ç¿œıB^]hì“\ZıÒ=\0ºz‰àçkprJäô‘º8™½§úR·¢á¡ªş†ó(eS°Ê¢ŒŠÜó»M\0’)pŸËQ	£¬ó$\"E€iœ?t’DÈä—+}†Gğ8b¢AîĞÌ†+E Çqçg	:hå2ö§\'äW ùgèœ¼Tê\rö[Hæ¡ƒöÌ;œÏÂÜïOK\\ëÃ› ŒÎ$‹ÆfPÆT¤Dó,*	ò²ÍjYGŸ›^€à´ì›xÆ…ÇÂLİ,½%©Vòâ+„˜j0‘aáGLW2åE–©+òQ\"ğvŠÌ\\ô\0Åólÿ\Z\0-Šëî<ø’ä\\ÚØÏ2cæâed™\r{ÙâIz)B+É¼X9è…ìÀŞ]Q-×DÌ\0xnƒl\n’3upÃ/r®êï5ÿxÌgöQsÁ?J&ƒ.°ÅhƒøaùÃ„b¾Õãú®d†	xopĞ\nIis°4‰Õ²q(²F]ûÅÂm6Ğ²ÈÉR‹òmF¤\Z*œ´ÁÆÁšl•)5dynpê}AR’x?6!¥jß²ŠæTª|Jğ‚µ18’ö–‚‰+\0g ~÷a\rşaús»Bx­\"<‘¿l””	bûæÏsÇ¿Ô`1túÄá³lë€÷i‹³¢ëb‹~>q–O\r+³{Ş¿÷çÃxxEL4Yzÿ»[\n‚é	*\Z.ûÜ2R0Š,@mÉ°½ka§iè¡!Êë×9Û—Ù}Š0º§su4ÌÀDÉŸWğ;äãhÿ[É»øåsJç›/¯8 óDæZ¥L7Ê¹TG]‰–<š\n~ÎXÔ½\"|<š(°£\"Û/ŞV„ŸC¾U‹¯uBÁ(»\0˜EN\ZŒSÙ®QÀ±È)RJ7Ìˆ?‡Tº	•Û$gˆ—;š‚\Zœ’ñ7@‚zFŒâ—\0ßõºO¯äÒê=,E20j8æXJİ\\ÉO‡ü•yÃ‘OæíS†5üÁš+ß8ÈİÏ‚ÿüæ8u’xáõ³Æ³÷dvé(ºÅûˆí0G½fºsŒo_‹K.ç€üX¢}—ï÷áûu)	ı=1%V:úğzÛÓ€0>gIÀ6òÅÅ·)zŞÄÚH[7úßâ]8ÚÆ=æITŞ0R7\"şW7e¬€×AF¶‘{7•{\Z7¨g5q³Ù§qãÙ‡1\n÷‹DªŠqÈ?‘È?±p²$A#÷8ÆÃxu>¯-H0)¼ˆQ)<qáf8	2ùç16ùÇ1:åEÊ‡ŞÈ>É>Œ±¸óÔGuÃÈ<ŒÛÏ<*Gj©÷`±pÄ½k¦}ôşgà9øŸşí¿2lÎuëÙÜcÑ?Yxš!•<|…/s	ª¹g\0°gIÚçE\"{î¡dpZ¾Õ£“âJœ#Z•òÅÂ…í?µSWÃ³ö’éó\'äÀ\\“ö©³ºK¸Š¢%L6`J¡|şö¿)œÏÚ¦ÑÊ_@+é¸F5à9éâ9}ÄŠ®MîÓTTİ½\'2{Dàüø0¬Û×j|\r|ŒSè?m´şoİşî¾?@¦G¸ı^Më÷êı^céq×nÁŞOÃ—Ô\0^•TˆÁq¶í7Á™‚”9êÇòt_rßÃx@€…xñX~€—Eøäe²KŠ\0_ÄË„hYsÑ¼H*àU¼\\oÂEx,]à‚«ÄË8~S¾˜£(MKø”÷9‰¼Ã5òAk‘àçŸˆròåÇ¯­àp…½\'¨yĞßj_ZÜŸû‹àüJf@ÌVQª’°÷ûÛe<áŞ2áC‚VÿŸzfóŒ½A\"áågæ$Ğ^d¡ñÍ˜ãÇ±Ä\nºËGÿ3ÔnØºô_ïñƒàÜğ_IËá¡3z £ È¾âQŞ}\\¢—?º	vã7Ñ—­y 6$/¿\0·Ç.ñKA1ì^RòÃ’eFÃÀÈÑü|IÇ—\\IõÏ=’s—or×ĞIu÷#üTğ\Zè{‚ûhåer ãyJî³º{|O@¦}K>†kÛ±ôìB¢ê\nojâİ¤äÇŞ´á>ñ0¼£†ê¯ÖÏ=î*)éÂ¶^TšÅÎR£ê{½o®í÷N!C»ßó…á-Rqÿ$pİòû“¹C,Ü<ê_İç‡!ùûñ3Ùığ½¼šëó=©…>\"‰…ó*Ï‚\nÂ$ñ—dË‘Š§F.×îé2IaEAsı®ÖO1¥¬/l¼ñôŒ)õcQ½œªØ}Î¶´TÚ€*ß¢?¹!GT~ÌiÈjÙ¡‹@è²ñÔ½ü$£F< _Ã¿€C6Än¦±°\\àÓ38îQÃ2ˆeñ\Z*AMî¤)!é$-ItÕLôæ|‚Ÿ„nüe*ü‡ÿà¤¾}¼aş\0ÿQÒV\Zj6*È	åëPr¡S®Å«^€‹IBD‘šÿò‘ışˆ©PzM^j0§:g»‘áSy 3’Ì´M¦­Y¿2ù`l©¡H«ÍR¹pJ€İ#&el”p\'k Œa¸#…ûR.ˆ!ôGzx_oìtRæ<ò;\0!Õ€‹3¨)}©ål°—ìj~¤yÇß“ß@Ï°-¤èpPfÁ‘®—º§ù‰¢ü¼Z½$èØÉìOšBDšßl´€<‹*—İ›‡tS2d/®èÏtoèj’\\\"p¾ci‹ñ0¦j>±Ê?\nãŒ/P´8^#ÄJOÈò/š\"0Í†z¿ŒEË‡ıµ†’£@I–-öÇ——ôC&\0x§}qsùlì^ˆtÅ´-éü…î=Ä¦›Hw¿8‡_éãWz²—ç#ş%ÿU¤^\"\nÿ:¹È[X:¨8¤VÒ\ZòõÆË—4‚7?¡T2×´Aê\'°ñ&hú}DÊ\rJ[<Møâá³±SX#Åìšmgj&ÉÀ¥XæÏú\ZÒÅæL1EÔ™·qL¡³\Z\Z]Åuczv‚ÆïtáÏŒ$˜½Ü¯@‘¤_ÌÉñEÚ)6°Ÿu.sÆÿ‰1(Êåí§à‹š›/¯ÔW(QüU-=İSh”¯“â¦ò9Ñ¼>€¥»Ü_Ò«üàşÃzùê,~±» ¦€ÄşÒñãKàşYô-\ní¨¾Ôƒ$YÒ35ÃSñ	\\òKgê\'êùî_Á}¾\rÊ+éŸ8S3\"mplŞ|‘éÕC]´cıNkQÍ¯´UŞµO4>%ğ¡?ä_ÑÙ?İşÿØK×Ğ†Ó}+ù	ıı~yƒ~!øßS—IĞ/\"÷=Pld*”‚Of<há‰FôŠ>_«ıı‰R3Ä§üu)vÑpÿ|Zùèí/0Ş)ÌÀ‚‹:[f9Ğ›{jÁÊ´@²©Ò•b›Ôû\rxùÿjáœ>&\Z<¯š)j½šÍ”RÿO$YÈeRËØêşV÷9÷iµub|·”RÑ†÷3VKT8™d½$Ps4¢å4ˆµàI* àFœS=¼N/e şxcûw›Í³µ²9(\\I>­Ğ+ì£³Ã‘‘rø¤E¿ÿ‚£Ùéd‘#UşÂ0¹LÓ¯šğö8¿ğ\0—àpUÉi*²JÉg tƒó‚{­T‡Ğñİ>4„é.Šqà¶ïFNlÉøÅQ>¥¨|X¦~}–èwÀ<ÉÚ–JÕš\rº)‰Ê³Ú9í,;tÔ+Jv¨¿IéKÏR]*ÑQŠ–p4OŒøj¯°.¿Ö\n0Ş=ÜU>5@~«“ù(’\r…[^²³–³ûBğ?n\'ªãÕºXRÒÅUÊïEß\"ÿ’²×éÀ;ùl2i>=6a±‡A_1.=(‹fj/Ï{b§7*hÂ-`´F7È4\\3UÉÑ¼÷JY±å9Ö×Fäıùx¥i ùÍ¸è?¹®Í°¾R$£ôE@‚z ‘ÛzÊ6ªx;I#äã*âü…(ß	sW?éEÉ~] B ]bÁ·<§•rà™DPàl\\¾ì0#¸ÕA²Úó|P©–æ2OéÅœ«‰‰Î}ÿ:,R2U·¬`: Îï,´{ıWX!J¸ì#®M*£ZÌèVŸù9ÈOæ-›â¬îô‹ƒ9H\\o?ãs3ÏÌ1ûUz¸ÏÃk«$$¼÷%¶üÀºäúõ/Â:—;&T¦ÁĞó£@¶‘ÇöOw×t„½tüß]Õr<áè¹Ü‰Óô0Ü2(Ğí#–G(A¿®Ùoal˜Lbí$?}ü[âŒõ<¾Kşœòç4¨t‚™¬ÖÕßJ0Àmã\0á‡Åj©³%Ú\\\ZpoÅèœÛmi£¶()İVƒ¬,¹#	Ã(^kÔ†]¾=^ZıÑqºØ3#¨K÷ö†[A„-¶m@ìíj}‚œäª„#3;\r&³3e•;öL£Ñg)sÛ$8ô`œ±N‹_-uá<º¹ƒ¾°ŞcØL«×ù¦(!ˆåZ‡E½­fw7µªupjÛÀÌö¼õ6üĞZÜHdí²C¡ƒ-L5NiWnÕNÚİ³NSÃ9y˜Œ­qgZYC«3²_ÔL—?ò.4›N±ËE_W6fw«ÒÃ\ZŞ_\r.Üt|2ç›™Æ²ãF°œ³f‰õZ²•¡„s»qºƒšÓ!¯Pƒ¼çWÈ\\Çë[e|C÷‚¾oöót<±ĞÄköI¯‹õ¸-3é5¥\nj4v§í€âšŠ<¢ØJ–qV{AÑ¨s­¶»itózfL–!h«;œ¶ì:Ü>.Ùke¡p>¾CnƒÆœÏ›»×\ZötÆj\r·ã‹…ôDÕ¹S®ÂTÏíÓ²Nà·+5ÚÔg•@×gC|‚NiX\ZcG‚D›ÈâÚkõíÖÈéw¡ÉyÕ\'×sˆ˜4OÉ¨W“4‡òpxáb§ºuëòéÌn¨á®ã4Ú]hKÒ…´¼o!­?‰ÿşt‚¯H£uêè>ü7š©BÖ;ˆ¸Rœwì^,5-¢¤4\'4œ‹ÁZ°7IµYtÚƒ#}@ô\'Æ=“şE0é„AÙ*şX‚t!iÙösÍÆK}ZŠûü=£bÿàt•¦ Kœ}x6¿Ğr`wŸ\rò\\Šùwà(Åß4É\rsü\0ÉÆó™±/ï<bDüx„Äz:kû{J D`Bé»ë\\Ÿòîõ…ã`ÆøG	æ ­’‚œæbT¾0Q½Xˆ 5çÿ˜‰N·OÏ×RXö¯Ÿ—…lD´‚KNz*ÂÄRaN©tf©O&(áaq˜ğé4]\"ÎFiZŞ˜ôãÏñÂgLë)û>Ä,1fÿË[/r{ ¹-IøúJÕbÌ‹Oë€#µÉ±$ú‘˜ ¥œ?3®™ı¢<z~‚Ã\0\0ªğ’¥÷-Š|U¢UÈç‹’\ZDAĞÿ<Ğ¤ğ(I¡Y2MQÈŸxÌÃÕú¸(¬ãà­„;Šš•S½¦b¬¼E‹>vEû{JÍ–3g(œ\\Â§dBî•Oÿg¼2·å¥Ó¿Æ@ó\0R<-­MÅ¼ÓM*ÂRnğâÀ;‰®:Ù3\"™!²yÜWF š£™^*‹¸±ŒDù?/0î-¬ùóåZO*›;8uST´¢³a1\"€2ïà4C¹”ĞØŸ<<©¡¨Muƒ¿t\r³¹ß:<6÷ìR“ÎÄhR££Õ¯w{i¥müsXßÆ·mÕ¨NnøğBØÆM<í~shoû#jÈ´©Æ®¯¨ûå´IŠ, ›TéUÆKEa‹ÖˆÿÇ®ßÇ.È¶¨ïÕHm‘;|¼Ö/³±ç°JÛ w>K™6\r…êÎTÅ–ùÊ¤]8„åC>İ–¬³Ü¥Q>Êeöu1Öc&~û³½”x`÷ğ‚ºË6õÄO3…”ÿÜ\'İ\n¢3<‹T6½NLĞïöî9@¯·ËvÉ%MÚ³K…Ë;@”\0r\" \næú–kî.(d2¼$#ö éz-#—%0¾$è$±“‘*¢Š%„qÚÚãö!›7›Jë.x)×@W¥EÛ¼ìx¤Tú™û¸0ü#ş{ò}Ã ?B}áG#/Šq÷Î}åñ÷T~€Õeæ:ÌİÖH¥tÍ#à³7¸Ã)Ú:$‰u\'Å_yÀN&à}6›Hî„‘I1’B-N+R\0eÉÉ¤\Zy\0IÒ‹¯ÃÂì\"9 ™”# QÂˆ8é}D&	ÈD’ø£\0$Êû‘’Iò\0§;)Àˆ²ä`dR <`$ID\n@¢\"9 ™Ä\"éñ«`±Drîíh…(!H¡r¤¸ÏÕÏhó BrÍ*üäg5|X¤¯ˆôôE?yú\n€ÄËD_~£Eú\n‚7¡»6!Y²eMeSpÔ%^.ÙÖ>…˜Œ@IRÇ±*­Ô¼¸æ^ 2ù8©¸OA|š‘úò&\ré=%}r\nj\\ZúY4·È)l_@Cù{ñW×Æ”€Ÿ×¹oÌŸ4ãäØ»#½gCM…Ÿ¾9ù)„T“òH’ÿ\'añ(ñ¤Á”/¸Å×Ëe_’I qçÀdşûãˆúYú‡9ãv£W\0ö-ŒyI”à<3 EA@“1æ¹\Z×7û|ø~£(x°%‚DQøµÁşê°€‡œçëu©Ğ÷hï~va—¿\'vÈ‘u]ä…»)Ôd¼8ä™fŸãoy¯c5éµ!ÿê°\0‡<“­è;t^œ“ˆ’|FyÁNy	Mi	¸ğ¬Éç#øÅ‚à®ñF\n¯\rôW8È™äK¸‘,ø\nä‚Ô˜O‘rçYB]º›¤G@³ÏGğ7Š‚‡›¬ˆˆ½6Ü_à\'9`r°CÉùĞyÛ[Q’Å¼\\,ø[¦@Ü#t!5Å6ú|¿\\<Ú˜ÀØ‹\\äk#&oHÀ8¸Ğíè„ñ\nèÂY$<$RÎ\"$H„¥ûh×êBWU¦ÙçƒøEKØ6Rƒ¸éûÏK	ys¼€ú$w|r”2+˜p¶-×D\\º™‘À&Ÿà–ˆ$şV-ğ¯\rôW,àœ$ˆ å|}qÁ\\³4íorA_J˜D&ƒŒãÅIMµ÷)OøJAğxğó2ïxy$ÀdŒ?…‡K¥å÷{áU}êšC µ;:‡ÕÉÊ_s¬Ö…°w²š½æ ÷Ôy·šÖId{.¿æˆïÀ£œg?@Ãš¢©Œö1‰½›X\Z?úç„ôÛ¥ÿ<íıd©`Fğœ0sùLï\'r€Ú\r~òk~î§éZğóY…|p,}ñ\\ŠoVˆáƒŸ‘”ãr:Uşñ#‰l™-ÙË™&£ë%M”‚È9G B‚{u¨œ¾ûud^…n‡ÿÛü7^D5Ä(ÎK]ö’y¿ÛÒ¼lOÛ	Í£Ó)Ç°cb©Àñâµöïæ¹éÈšì?ÌÒé<¡âß+`ÂU¶vyŞ|1fdšlB»ğÈrÑŸ5õ~Ì\rå\0éê_[ºYlŞ_Àú)\0`è—æ\0.3_œÕ\"ı˜b@kb.ÃPytÔOg¯x—Ÿuæ	¯r±w_s°şe,ı±§ı\Z“¯>Ls~Æ‰Á•5¡‰mu¿À8€\r¼ıßoºVh%e”]ÏóY¾ÖšÿÏÏûÔ\n>#ß\'“Õ˜Ytµ,9–€M;ÛKSN‹lÕ[ô\'ŞÖ/v¤H˜…»áoğ9–òÄVàY{¯l)çü{l[`&¶Ïè(eáT4`zàtæœr?èäıÊáQDæ´â~Ÿ®—¹KÎ¶÷¥™/ˆ?¥xŒ,Ê¸ˆıø¼+¥ÒÁ\0¡„‰âÃ‡ñ¯\Z%PC‚ñâŸï-4.¢\"Tf¶ô„…şcl—2ï(5+\0åÍLáT|`ZÜ_ÿ#\\„2\'Ä\"¬Ìš~ışï-ÿu–\\Ëşı‡ëáQ·êHn5%WTQ¬&ó‚€W¿HÕç’crº[\r@…ÿpˆôç@È\r¾~“,ïÿ{úOìş\rúãØÄÓ$Y»ü’–ŞktÎû—^òw4ñÃ²}1À—™ÿıw .\nNşgK–‘ÿo¡ñğqYƒŠb2NB¿İ ¸½²æp’G~«9Ï´æ9G)\ZQP4ˆíÇ{êÂ;¦¿$—EšSÔøë›Ì}èJúvú\Zÿ\'™-úFàş£œ_äØQû@K\n\"áC4ıbé‡XüO?Äã‡ò9ñûù†8cHİÇ\0p¼ñË*:çºIoc‹Ğïûd‚ş0®&\0ÀQ(=°•Ì“¤[©°\Z•òÏÚ,€Å\ryÁ©ğ¼/i¢•8º½—5İ\0¾\'£÷êŸ¾E–©\'e€o¹ŸG‹ğQ‘P, DÉğ·‰¸Ä{X%°sK?2†gULOÚ‡­ÁÅ¤L1C3Áåà˜Hlëì3wy%„â“§KÄ„¢H÷úe)Àâ1Åx¿)‚giFõ+ğ=~Ÿñ²„cš)±¤HL6Å‰À÷1Ùwô²21ÙpcãÀ”VXXœ?ÚÀÂ1Ei&o]€bŠ\nÄá;0`A1éi`ê‹\r©‰Š\\Y5¥„heŸå×ÓGä5 Á 1…“|“„¬s@’A°;“CÑHÎHL§ 	»TFÏH-Sªlª\"S<EHL\"G°D ¥\"1ø2]i‘„¹”ô¿¿÷:¦Ş²Àc+>Şûb¸L<Í¡	°€/\'ÎTyIôNĞĞ+	IDóüM¸c¡	ßvÂx{ÃRÅ¢T*¦•pGÄlP©ZºT´ïËérN)jdºØîèzš|¬?Öğ}L2¾è)™™¥l½Ô£l¥;?)-“R öµÍuLRşRô¬tëáVú­	ŞÑ)aKhBu’)hÀK¤Îşh<úXLZœ)°DL\\^	yc1iI¢–Í³÷päÊ:%â\ZyZOIÏK&dlÀE‰Ğ$ÙÁÓ?—“œÌùÜùiÁ;£zR†{l8À÷1…ÙÜÑ²:LHĞ¶€ü&â”â ¥:ô¤¥FèY¹˜x¤Ğ\rT\0¹OÛÉ±ÊyfË•rKFñè&™Ò@Åbr	¥·gåj	mûBã³rDšü”Kö´£äF¡Ë‹Ö\"[ÏŠÅd#8–ë/Í’4Îû^¸PìIIÉdïã€{<.¥Å±²‰­AéR¥ÓZƒÓÅÀòB\rI—)=jhÂõ|Ş“%İ÷;«VŒ)+ŠE,‘ğ Ë°}8µÚƒ>ï‰a$Ûœ¿öÍJµz‚ª sQ¼é\'T‹)HÑJ¦(¦]â€2_MHÎ%Ó‰t¿–î¯?\\ÿÄ\r”(ˆ˜Ld˜iä1aéNzÆ™\n¸›|ç¯&¸@Â‹8]2Eğyšˆ©ÇñIÀ‡	ìNF‰$@$Ì‡SL	\\¢v_„!»<AdK•‘<A&çï,•4XO6ZË¶Ãì¾%\n‚K6‘ ;.°Ÿ.*ï€Å„ô6üq–3eÀ”!İÏ\0ş@øXd„¦ûcP]2¦*ï¬yA¸ÿHl\0–„“QYÿYÑ;^0è}’1)í%àvObs¿›î‘ğ2Ï¸L²©GƒwKÇ$‘+VFY$™R/©œäd=¥Äo%$÷PƒR6°LÂ†4sï‹’æ³)Rø±[€¥¾+TCÈÀ‚R\n;\r8õ„’ËVóY‡.ëcÅ?A¾ÓÏÑ.Ó‹ÔÑ„!şªh=ƒ‚ó<°@¢|\")×kÙÃmI)\"ÕÔ³~‘™Å,RÏ­29MøÉS`M.=ºÀ1ùÍ2=I=‘|œà¤p@ğè\'b´$e¼á×câQE<~Üÿ¯¹7]rËÖÿ×S¤uÛ±>ÇÈHf•vÍšQ€$hÖ?f£ÄvŞ½‘ä¸KîÈ#3«îé[QákÏk¯iìõÆ:fE~š²—1ø÷N4êÊ¹ƒy|¤»×cƒÑ%0†pr¯½ú]ıÒÚ2°\'ºW¶›?‘Ëƒx\"z%IŒÁÉŞ½l˜!~=š±0â‹Î…_vù£¼(5Ç§û¡ê¼÷tG•—aá§\"åcpÈ‚èÅ1öÉÇ½^ß4Jôh>¯‰æj¾Ş™÷ÈÚ×³ÑîYĞ`ïrñ×AHxëˆ¥Õèî²Şúàö–àx\r«WOÁ„Â\nŠ\"}ÑËw“,kË\\ÜÅø¦´ğÁÙ¾^Š£Üb½±va<9¸QoDµ/*b/å¤õÆÜ×,İıó\'ãÜ!ÏöÍø˜‚\\?ªQ¡a$é8‰9è÷<·[-F	­Aºöı»]]>FôÎíæ¸‰n9ï†ñx”Ò~W³Õ¸·#ÿİrÆV6ò‰è›Õ°ßØÍKÓŞ¯¸‡¾¡Æ¾P’\r@¯1G{°ÿûvÊ—È<RK4›|¤y%Pmê‘ê¥$µ‡XÃ5lŸŒí]Íö»±|Ö×\'£e†ÀUÿşq°¿~<tŠq~°J>Ë¬Û#ãE±Áå|;|£q gss”æÛŞ~f÷×·Í0*œáÀÆñŞÏün¼^ŒîCçß‘.¥zûöz”÷B?8Ïşè¸Tr>ù/¨ˆÙì?öÀLÇŠ3»+ŠÇåOç?{C=ï›Ñˆ¸C\rÂ¸(ŸíU0?NÇs©wñÖsso\\™/e¾ÇJüÛÉc4ƒexÕZßY:ö#åkŞyãÀ«fı’¸1ÖÒOëŸºÃ	r”¯Ô¿‹|˜/ŒĞÁiMİŞ®­cà£ªŒœ|Tj¹Ç÷ü9£dƒ[QÑ\rÖ;NõÆ;ıĞ³ë±ÕªÁŒû6k¼ëoü;vŒ2ª;D5®¼Ò¯Èi<JâšÃ<ï5÷OüoT„;ï|¯IÜ!zz\rgõ,W™¯íaxÀ£<¿’âğ\0Ny¢Õğ€Ry\"}¡à¬r\'~ÙWì‘êu\'ñG²½#{÷¢[oŒô†Ô%yã¢ÈÈ^Q–«é2ŞacĞéæ•ıï_?–À-¯cíğ€o9WiùÍÜÚT¯çvˆgôP2ÊÉğ\0^y5†äÊ-;YôdZ?>x.6ø÷0È¸\'(–!†8Jƒ=ÓdÎx,ğ,Eü\nĞh7¿&€\Z\'y\"ã°\Zx€ŸxFìd£R@\'ï·™W4ÄÓ#c\\6ÂääFññMÛåÛR÷B-ÆF02¬õ8„F¾¬t¿lÑ—Õ~xø\\ôØ[Œğ‡gå·|¼r«çš?ŞŒNÄ\0m¹¦½ç,»:¸£”ƒúÊÇ78‚LÂõXhÌ»€tK•<ø·¿¾;À½~ıÊp´ädØ™÷s¿Qš7&¼ø¾ÿzª3J6ÄR«ëQ·ìw£dƒkW™ß½±¢“ãğ@x\0ÀdU×]Å^àŒê`x\0ÁÄÁu^D%áçòAõòH0/…8£¨ıt 3ÎCòåz|u÷IşøpüKö{ntÊĞ÷ÃÆ²Gıt¸ó}°F\'£ä/¥û€ƒùD?®B,Ì\'âWºt€Æøeá£ƒ.+\ntôıpê“ô>ËøÛï{ì\n.|¡ tË5hZŒ,Â¾eÈİ8z~ø–wª±“(xÀ¸äÅ7F< ]0ƒ£dˆ*xÅDØ<á›‰¯tã\\>`Z\"§w1_0Ã\0g¹Ó¼âìƒe¬oÎÁàw<Ë#Ìg”ğİ{8‡ù~<€‚Fé_,³q 7<à]îI¿ÄîáaZ_ÎÈ€†y«å9ñ©ñ™p2o5|Á~ªäåŞà4N•?‚ö¿’Á-s¼Wo|j_sC?E«bTà¨š¼W=OÆoŒ·?HÂäÙxŒÍÇ_[çiQNÙ¨a9 pòê#¸x¯-ıòdô„°9õsĞ5ÌG\rŠcönwúü6Ë±¨Œ¿;™ãbaÀè¼»Ï£D±2#Ê|ãEÆí/”/Âhğ\0Õ¹“Æ×l¯¯jğ:¤¯ª@;7Ú¤Š<°^Ö‹ŒĞ¾¬x\0«ŞÏ§Ç÷Ô€×y#zµyĞN›Vee~\'OèÎå(É6•ç÷äÇûïZ¢ûôÈkêÚq;L¼Gğ+TøVxŒÒ\ZÌÏÖË1tL¼{½î\ZİÓœÇ7~ O¿mÌê•ú :ïDßÌÕ€Ú)ûUF{4`vîßU…\rŞD¿:ß¢ÈàÂó@:Î…’çğ•¡7ÀyH_\núÒsM˜<>–7ªƒÄ‡¹Â”ÇHzş	FúäsQ²×€â±óÀ4ÇOuàÅS„íh <nZå¯Wç¬sÚ8ï \'6Æ»2`s^¾bP–Á“\Z÷®ßXgãÛp€êÕ‹Øù~Şó¯“ï dË.ã}›&ï¨h 8—QÏuÀàÔN`wàr\'ÉÇ]Ø“s=áå©ys7ßÄÔaòÛõñµÎK@8Ÿè_m&êÙ&û|4óÉ zY<X@å·á¹³Sû]c£‚hÀí\\‚ØI¿‘Cx§¬ò°÷Dûİ÷ş¥ÀıÀg4ü‡Èò‹ŞçÖ×ÛÛ{3º*Ëñí0@{ŠhB˜÷¯¿ÔÀin¿BÇÂŒç\ZÌ—HŒçª¥‚²z‚¼‡?Çeª¤ßMy”ã3f\rû2¿Æ™¾œ¬õ›Ş®Şà³£ÇWğ\0j\r?Ÿë7¶½ŸQøŸÜ±íÑÓ	x@ÿÜ)¾™cã=ÔvUuN•}‡û…4Ğõ(Ùàô»Ş\nÒÑmx€Ù7*P8vÿW6]@@T¯üÿd÷®ÆxTs@ıœÒ4=V„°OÔ‹¨Ê—RÆÇ5FÕß€ğ²Fi7ÔÆÃTÆ\'3Fí²àSdéø\ràë…Q:Àz®ïGÏ|cÓñ_¡Á&öDò\ršï_;ã&¤I<|WÑàĞ9Vû‚ƒÍÁ\nªÊôé|eñ£…Ş±O^fi4Á(ùğa>z.\n›æûò¼øà6#É¹FRƒ‘aóİ_«û>\n6ß˜åz©¡9~Ü¨¬›#™Ù/bçëFuK98N†<õ\nİ?‰…-ô±Ñë7Ï·û“^cÄ×İQÛ÷çŸ>oûxsÏÑ4^óãtd#¥ßl¬å‰‡ò·¥«ášĞíEùÉCù8½cı¿8^|(;Œ\'£Sb<n½#ulg€Ø®SáŞQÒXƒıï:½z¬Â4÷‡Uúõá÷/*ª,û\0ÿ|æ/dæ€{7ó’´EPÂdìÙBÊsH\0²ç)8ÿvğdŞ·z×ş8Ô}ı¶5Úk(Ò’ûoµİã\\ÖÈCÿšx4ÿ‘8ã>Ü\08ë\\? }mß³óyô-1¸½ñú´L}…Í(ø	Ğg…“<M7ÈäË¯làv-ö¼5\n3ı€Róƒ¢ŸÁQQûP»3ÎõzÆQ²7Ş¿ßa9J1|şoä×`H6Ê|ïğ³èz•ãø\r¡µ[°ú…53`ÍŞ‰¾áµsf¦ñhÓy¤YÖõš\"ãòs—@Ui¦/„ø€3+ÇíåKÖópjUÑ8ôv>üÑÍ=ÀÈn³öês;xÀ]?ßút¬u¢QÛ|€]÷Î·ÆÇl‘wÔ\0\0b–]Ç\\[9ïüÒ¾0HhØ6´îf<ú5`Ã,«ïÅ¨é:`Ãz’øö!à‹àÖÚAa¥—qn\0b=™;£¦îû\'Ö7c|‰Y7Èğx¸g€‰İĞh/wßQbïTãË7àÄnŒç¡iÖ¾Œ.±Ñ‹:àæ´Î5ÔúÂ{qß$W»ÇÌ«ı|† /}ûzPh„ãóô!qŒ—ß°ÁP¬÷™^!Ğ˜õ;ªá²‘¥Ü1Ûğ`wŠ×R\n°`oá—ñÛB6PÉjd@‚™Á+?\0Ş…c	`AÚøé($`×hUôâbd\0Yc‡È\0\0+|\'tA,¾s~~Dã}ã Ø1’Ì½[Ş]Î¶¸fíñšŞÏ>“Ä±JÛ¹ÅgF)ßŠÂáA\"ğûõ#y›£~2àÁ¢kßGØûuíw1¦`÷Uøıæ(‚Ä¬¢±¸2`¿Š Î¢öê}.Ø;ò+l²çÙQš¨}ù\n°À“¢oO÷‹#NG¿Gà÷mG¿+A$Ù\r\\8V>ª\'M÷îSşroÀïÙŞ½_@8Jf¿[Dyi_X„h²‹3şq:ò5\r÷\Z«\ZµàÒuû6£x×EoO#)<\'·Ùãõ@öÂâBŞo3ºä\rØ:JG|è;²Écu/GO>TÖ¯G:*÷‘çõ@6\nJA¤×#á¨Ì°^‰S%€@¯û¬EãáYd\0{½ŸÙËõÀ\nFmdÀr}|e3ÊìŒ«îÂÈÆiŞG>nÀ ˆë¶e^íâ¼u#zu\r2\0¸ü´|Úæ(Äà\\—Àx\0<“|Ø(/§¨2ëÑ3&ıÀ°Õ¨n°Y­õØéGŸs´Ôk¤Y$×’Š2 ·®¡ù— vËi²ë\'´]ã¬ñşÍşõKàöö4Ío  O…X×@‡.ı^Úı¸š\'å¸c†¸¯¡2VÍ‹OÚ‘6ĞÁc…ßZ->—‡ÆÊ?ÂdŸKcƒàï9ùÇÛ5å£„o¬üx»Ò|Œæ}ßÒh>~ûùL7y¢«’×”ï—VØ^C7£bnÀ‘=ZøÈ\0$ëŠ“5jX²›—“ôşÃŠÆM;fEãTd\0õ~ó=Ğm#tÌO«üvQèxçlØÙ¯|<.^Ä…‘öAŠŒ×ğŠYPØ%:^3n®(±wÂQ¢ÇOÆ½Ü0Ÿƒ·Çù«Û\"‘8v#»Ş_5Rúµàß˜_¿ <FA÷\n…h°{Ùë®Sto{ñ¥ñHé\\Ï^Çé†»šrÃv^\\*ˆ8°Üñ‚«È×M¬7!oÙ1nø¥£_n\"lô\0p_÷úD\0_W×ß°/Á‘3`½R;IÃ+C%A8zAœ×á7^ç\0ùòzC7{…ĞFÄWİWvÕSıO£dï_w»F>Ş½wdv>~•*B¼GóóşåX\\°^½^½@^7ÎJú‘õÚ5ê‰Æ§vàËãşé\r§_ñøu}fŒrä€úÂ!(Ä\0Îˆn¼‘÷õÅ¿¡F[Ğ_ï¤wtó8ígˆÿı‚³qZôíÁ<N‹\r“nWÅ8Şù¸Æ)»\Z¹£$ÄÉõö˜Ñ7à¾®Dãy÷Fõí\0õzûxwüH™Ÿ©^46„ÆÓªëF	Şï±Œñ\ZzEô2º3>0_}_¬\"‰|‚F\\oö=ÊBà—câ#ïW2}ÜìòÊ1`VjN6Şwòİş²GwÃ\0÷roÙû­è£tïWoÚ*à+ËS»êM.¿JÆ»<°GĞ¼:6Fü×õSsœb€ë_¯—üFÆÀÀ>èÆ9éÖëóo*´¿½¨ïı(åí2sôN_„‚¾Ğ/TÁ€ïòÂ¿! ]×¤¾å5á×(ú‰èÇèŠ¾ßÊää×ÓºQ’+ï<Ş¶ÿÇh¦®çD0_.ì»Õÿ)ÎŸÈdö{Ïßİ´h>ÓôÖ]{3‹¯î>  ?Şî¨éÙÕìr{ézJ¿¾ÆbúQÆ¿-®ßt©[şÆE`İŞşç­t¯—şü_ï]*‡\"ÿ¼×ıŸd;Şİûóúeñú]úòÕ‹ç#ƒÉqhÈ7Cë+ÿfloG÷şrdtÃ»W/Ç×«æm|è7ãë+ÿf|oGÆ÷şrd|Ã»W/nãs£ ëÕXtWÃ&ú×	ı\ZyæãŒzÛÿùşş2ÔçWÅ«7é‹£O?†7¤Îø9ôOşõÇ«Á\r¯¾îíÍ×Áİ_Œ>½\rîúiúCWŒ$xûÜõúø¤ø%HÜ 	Jç—«P3ò{·şYú\'ˆ~Jñßÿï­¹ĞiİÜè­Í_n…şãq&¿3$½$@qêFÒ×û6à‘ª_m°ÇÚ_Ñ<4Õ=²Á«yıPc¿êc31²¡Ÿ&bäıG¥_+ü®²×}J³÷[oô‡<©Î/$W\r~KØü”YîÙ-Qà_Òö}\\ó%×ú Hóëaã@äA¾µ×o>òÂ}më£şF)CGÇ5 	™Ô’\"|õ=)âŠŞ\n¼ô}jÜ2‰/D·œâc¹Â?H®îğÇÀ|!yKÿFD:fØ_ˆîWû\\m.§ù e)’!Çi¯+{¥ıud\nß?äÂü”áÑø¶Æ{z²_Zè!ö\'FüYÉ3?•¾¥|­™6?îÉÄŞRœ¥/ûš¢ØußsvPÿDß3%ö5şæ¦VUüq­û-q4ôôŞW|ıï–¦Áñ_¯ÿA¿B¿QĞ=ôæSîó÷&á+Väk«#9ocº2ï×Zx–ç…¿VË[.¶· öõZª_Ÿ;û•à1åÜMÔdFŞ[ë?­øöóOk¿Q½^ÌšïPµ+– ŠÆk}¤øã9KòÁÂê­×%~nĞ.Iì\n§g· ¼Fè¯ ã__¾õåÛÂ/æò=qç-û16–oøqMïg‚M&îËhşø’ø¹ş¡‘Û/æâã÷+³EFV|¤¡½×rİĞhJÌ¿TùQÕŸ.<¶ŞC}ĞGé{ÂÓ¿ÙÁŸ·qMÃû¾ØßTéFUá?æ<ü:Ô‘ÆŞÓ&¾\'R’>?ÎşŸÎ?~ùKm@Ÿ„ÊğûÇ‹×é¿ğ‡tßOÙjÉ7–$ºdß-Ì-Yú;¿Wt¿´ê»¾ürgCòQî¿i’/sz·6¾ê—\'ÃãgåŸGñ˜ù_¨fDò\rªÂ8¶íş¼Ö»¦ù2¶\'‹é\'Å_íï×òİÈÇpÿÄ|]\rÒ¯{²M¿/ız\\»’o†uÏOûe‡ÿ¸\'¹şñ2{ÎÇ<¹şù“ùYÿ‚|İú -^	´G4ÈÎŸÓ¾‹¥‡âß¦ˆıy#²ïéÑıŸç³+ÇK_6Òÿóëû¿ìóİñ®ĞïÇÇ«66Ó¨27Ê´ÿGt¢‹sKü¢8•óÿüúşû¯tÑ¯E¯ù¯`à«)òËKö-Ùô.5¡ßÿüìÿ¥ñßS–^ÍÈweğ§R|ÿµö?4Í£ğ¾ª…¯vî±ßš¹pİB¹·ø¡’ï™„?ÊŞ³…]óÉ^\r¯Ş~³ÄûıúÕı\Zl™¥^C³©—Òıÿ”ÕÆç7ŞõGşúÃÒRÿ«Ù°ê\\L÷º°õµ‰!Ú£Æ0Ç)WŒlî„ä¸•£ÃNÇ-+ŠÔkš’u^Ø8J \"!KÓ\ZÍWšœIRÇ7\ZFÖ78Ÿ‡²çyÿëı×ã\0Şò&ŞÿùÑ>¾z7ğ¨5÷Ë÷óC¾RˆÏÆZA^%?ÑÖhWï•<‹SšÿèMääKgnèšK¢êGŸî“ù©Í[GRTß\Z&«±òÙ¦şó•}tƒ~nÿyo_¬çôU¼Ÿde\\¿•şí[ÇÈ¾¡]ÔÇÛ¬İåÕù­ê#C÷ÛT\"ï²áŞó	öó>Ô×³É?^ê¦·ÆßgÙ0ûUé¼uçî©|Ç³úë÷lş8ÿo,{ú—ô]j¦ŸåJÍ¢Ï­”A9<]!·Ù`\0jŒ;‘ı¾›‚ÏÃº7øI&ßLsôU÷~1şø¬~ÿäĞÿŞ¸­Á§•~AÿÍªÜ«º.ò\'6Æ7óğQÑM¾uîªŸî‰@_gã¦cşø*Â“ôí§şŞ¼š‚¤èù÷æëıÁ&ÿõşÿß`üIaÜ7ıÇïÃ‘éí¬ô_˜Íû€îÆ¡‘pûùæÊ¾O\rñgÖíõt?¶„-!Ÿ,‚{*ô+K^¿ykƒÿÒÎ½³ø“åL\n”À>îªÛ.ûØÚwó³}ún¸~nêÙ—ßãÃ–ÃßÌ áªªÍ?oC}ÿ½ıçİ\n­¦7Kÿ4ı$ÛÈ}¾ˆ¤z/p×§(ñµÄU…!ƒx÷s¥×`ÿø”Ñ>¾}`=èŒ{ı#æÀ­ìoO¹6¾Æ²şD¡Wğu·½#\rş¯;ë@7.Æû-sïô°æ×e¾‹ëáá³üò¸éöİ™ïÇÛ‘# ÷—#gNÃ»W/şºîz\n=¼È?4Û{¸x‹¨=C(wæSıÍ•½Nñ×°ôğög[ê©/ŸvÃw´¿ü6¤z°^ı÷nÿ<ä\0ú•Éüh\0>Èô[ûoÔùbJ>[àãâoÛ÷¸ı8åWü˜Ù7ñóìÜËŒ>¼eÌşd–a_Ì”OæX_eß[O¿ºséXÎ—}|(npæ½0QäC/Ü~şZõ[oªé}‡¥=±ûÒ‘A‚<8ÄøˆùFŸ½æQ‘=è·ŸZ~ï5ŒUıN‘ì¦c?«vòµÚ~\"óáüãùáµ2ÃÌ¯‰×Ò|Øˆ×ëCrëÍ9|˜É^[á³Æ/?é×Ñ¦Ÿ­Ï{e?õˆ®%ÿèÊÕÁ¾–{)n„£´\'aH|r‰n«}=#¿oƒ¾[und?‘OmİyµóŞ—ñ×ü²B’#¥ŞßG6çã9üHÁ·ù±#Í‡³ù‘‚oaó/åâİ#å®§ò_K=Ğ”zqbú)övÀÿµàÓYÿHÁ·ãú¯ŸNîÇ§el|$ùe<®§›ôË<Şbm¿İoïıáÜscÆ®íâ6öƒXîÇˆ–åÎu3áÂÇŠÈAë.óÑ„Cğÿ‘ŞÔË}¯ß\\›/~¿9±ßÀ¥DÅ‡1]‰ñyWêcFšã^ÿ<+ÆÑvîÙ3nF•a]ÕNq½pà-Òıy®PÛø}ä2Iƒ9³}<0ı45o¤½}0óM¬jTT|ßég‹ãÏ\nÒÛ)`~‡~\nÕïc\nƒÑõÖŸÏnÂ›ow”BóA/£çŞïWö{=wÏå‹ÅğæÃ¼¹©Ä³î}ôñ¾6ø%ØòlüşmLr¬{ÿ¼HÒª¼%|@e<‘}™±g8ñŠ+4©yîÜ\rMóª¢\'ØS¹Û£ævó²}Ë“}Ú-V/0­/úàæAœïŒ¿—1\rÛsŠ‘E~‹<`o«Œ#ïËŒ¯{5ÃùÊõ—«üñèÏ¼1)ùÙ×ñ…_T÷e&¸ç2*²üjÜÜÖâÇ¯]x–>\\Ÿc<¾lû­)ñÚVÇ\n0p°İNòJ-‰cuUuŒr`­×Çâ0«ç+ÍXåDoÙV:Û¿+$Ş[	{İ›Ê\\ë YÎvÌ´†ä´Ï6”\\ÒÒŸ\\.›n{æâä¢NvØ©\0½\0Ggæ;Š\0A”<ML·ŸD_<C ’=Ô›%\"—ÂQôR)áz\'øEBÑ-m×óZ#«%^g€“”ø4[¦§=È°g×¹(mátnéÚY0`¼D¤\0<×—£Ù…rÔ¡‘œhØŠ§Ä1Û*Q‡I1¡º¦BY´š©\ZÊGÊ·áE¬É¹`ÖLàµQâ8¢Qî*¯Châ/€ÒÀÛ#Ó®b{qn.IºÔ7“9ÉxUs2¤zâÍòZ¤½\rm¦ñïÇş\"©¹}º/e¹À.k±9v2Ã+B‚îĞó:Ü±¥?m÷ÎÊ‡Lmp©_RöÅ6ÜS\0­Ïå&é$öw†9¯¼Ã\recwÊf+œÎyxœMÕZ}¹(#„ s¶ÇEI¦´/A0 vJy„„­\ZJ,‰FVõì¢MÃ—3+K®¹QØŞò\'œ%ÔjD’Ø7Z#a\nf[UÒ£éÆaašò\"Efšæì`4›pNN¢HZÈˆà¨ê±Uq=ÿâk×·¸†€R\rVÖÛXã,¡\'ÇÙ,?7…ÀlöR»hØmrXn¢ùšTa¶ËrÂ§w‚wØ‘Hu1‹ÆgX\\¢æy›­Ğ0\Z&m‰@FÒ?s¸àõ3 êüŠ3\Z»Ë(–¦<Ä™ãŞm*tîÎ¹Ÿç =çqâÇhhK…‚C\rNkM´õñ,¶Àv¾ğX½pÀ5D±ôåR³¸ãFR¶Ê3AÔÛ„Zt*^Ğ	³³vº¬æYŞ\n£ç¨œó¶Vö!’	X-ñ‹¶Û”¹+ì‰@un¡C¸Œ±ÊNµÕ´ëĞàk’ÎÁV\ny~[_2amÒHè)&ÇMˆr‰ÃqÎZñ¨ù±¬ôjTÈÎÚÂJ·cŠÍb%ÎPL4G ïŒUÑ×ı¼ei_Û	&y\"rÄæt³cag(™’I-Y•:\n1ú‰Ûê.¢Z_[ˆ´&½)*U¹7×Xî³İ”\nLï‚Òê¬w—#ì—³•¸ó”ÓÌŞ2Sj…÷òZÖ¹s4Ûpy>éùÊT¶rÑtb%’z>/Ï-H¼Î’U˜BÃÓ*RË÷‘°\n.Q2½@MoíéÛGógQg˜Û}„§%æÊâh¦ó5&Fê”aO \';SAi80ªbâÉ{)9˜˜§Bd‘é‡|¦¦\'WØ¼ßé›À™ÖÅéÌE”éÈÕ\ZëÔtF¹+YÂêt®ÂFZÌRÙcV·Ôrô´´½td½\\ˆìÌxÖh‘]êÈûto5ßœê¾g	Mƒa_ÙÀ„p±Ä²çYIß\Z+ÚL§uÛªŒ¹.OÊÔ5ê#qöTx£)gÛlí(!G,7P°i¦YìÁ;¬°àÔîb»2D¦±‡ò€9=§»}	…¨2V³t	…æ¶Ó¶|+C-±Ú\n\Z0s+°&}lÉÑ8UeTggÛ…§-AS!“cüLå« ìŒEÑ¡P/æhtÅd^c½Xƒ~†‹ö nd¡v*óâ#2çkË>@ñ¦–6ÉR‘@/·Nİşğt¡Ù¯7øß›º¢\"såE÷0É¤åÙX6¬rÆhÈà1|îê\"İù¦…VÚqf°¦\\â«¹c“ó\'Ö™S.1æ2RıÕqÛì§I/¶¤z:‰ÅNé(8]D5á.»ÙšYí/ËS.Ö[aOSòš?Ç;ÓvÜ_v…\Z·JšÀ\r=WwŒ9¢3OhwÛ”ó\\_Â¼yÜtŠ½ºÌ&~êÕ02_â~Ò)a°ÔÙEˆeäåh¡ı.ëdi‡ìúL Ù÷‚<?$†\'-6³&‡Y«nM›¨ı9×tN~QOé˜»Ê;ˆŸ.¸X=Õ[4bUiÍ°vÔ¤V+Çù”3Ås´Ë9¶ö¼œAÄ2¡H›jNœ±u¼Pö8zaß¤ıÌô±<Ì¥i%NçEDïÑ¹®³íÎ=ˆŠ­İHn\0ÇÃ\nÁÕªÔÊySd[\\·êx^ÆğÚ nÎr ÖsZtEB·v¹8ÕŞšÕ%ş¼™jØ´µ¸Îz<ğbC«)\rÃ]F{=Y„JÇF[	Jğs35ÒmI+åt³óbTE€õ|k\' ,Ì‘zÛ0n¨âÌ.Å\"ºğÒ<*¦Ù3Öï±İÁóy\"PŞ©m®_¦‚0KCB/Ó?»Í†óù„ƒcAa{([óµ+s~HÍ8V±ªqëº) )vÕ–åMœTÈJozÉYce	¡:‹¡sAúa¸Bbª¸-÷·»TRì}l°¼(Ïç“s·rQ¨|O«U·ñjÀ=„<“\nCªà”úÙ^	*¤0å&:ç0%ıˆŠ8$&Îz•~±‡ğ†\rÄi”Sª-Âw&´ZÖó¬¡Ùx“µX6âÑ<Ñn—¹B¡º¥V.¹Ô,(^¯˜é~Ê~¶m¡¬/,{K\"(€ ãBE…×()m¼yö1C*ĞÈÀÈ¹+‚¥Óõ4ÅœM(~cS<UfVÒºa·™Ã¢»¦\nH·VôY%oÉmŞn(šw»èø·>ùèÒIÉ½Í@Saç@û(8šúµ/ğn[:\'}µmaz[Ó.µ-v\\Fä¶^n‡š(Zo–¬=æÊ²?g§ùt&Ù^ëTZ“´9ØbU³ù™Ía™j÷ì\Zƒ¦öåÂâˆN.Oöú”XZ²UÌ-esc]Ÿ&P†&\'‚1Vu·­²Y\ng/X‘²-+­B®>œäõÂ=.`µÓÚ¹{O\'>—¼®§²Ö&3Í°s ÅuÛøÀe?T/ÄCeø†´è.¾›ab¿xÚÑ’º†T=À€ğV›°Gc¡§~±Â±Ü4>%˜?µc³×Gjoc|²¼¨jºVU®×ğ¹Ï…IÁ™*íX–ksÛíFW³Î…LÉ¦Ğ¤<ŠèVÂa^k2äxV8—m‡ğŞÔíÒÀsBéæ½ÛÕˆjáö¹W…ºŒÅz8ù6:¬À6×âNG.Rª¨ÔŒIw-<+èKowEõ\"B–<¿«;te‚…w<×¥ãI{Lİ§‡ƒn°ÙVß²ÍQ ús¤\\Ğ6¢õåŠHu²äÎíéLŸj;7Í™ŠİÓ\"|»]-z{I|6˜§è’ıl?3?Ú¤n<oÅÏRÒCrØÍC÷tWù`\näraêå~ÓÇÈÂ	flª£ŒâÖ¡…²ÁzƒÛœ6L‹Gv©q \Z\"¿p\'Ñ|)\\Æ§Zİ-ØµFÈ½s’²”Ìt+…SÛBö¶¾Yõ™Ø£´RKr–‡®O\n•bª¬\\§ØfçÔ¤2íD›uÜÌ“ŠP6[O€TNál2ÛI•ìsäŒ÷åZšàŠ•_nƒ›Zq€­Úd5Iñy‚Ãg|Ece´ÜtÓ×ƒ3²-­Lòğ1”¶>Û\0\0qâšİ	fõÙ9rÒ0¢\\Î7¹CIQª£†¹6;uY†ÇIšh¿©;-¾N¾^•k¥¡ëübŒ	…ì7ğzçUyFĞ,LªùÆlÓ|qË“dCÇ£LĞª•>¯×ÊÔ8H3ÄgÑt}Zó;\'õs^µd>±àv;Æ6_CsQ¯`hw†hÍËÃŠí;wN>	êØNŒÕË‹Y!°y(£1ˆÌ³2E\Z”¡5pœíe†½i!å6•wòÄÛša­lqV@ÓÏ¥d9‰§;~·­°LÜ¬¤ù<s7*(-¥Ó˜o©`Yr«¶eòm˜™Ø5¡;ş>)«óÌ«1\0V³\rà¸\'+ŠVº]JSt’Û×|±¼¥|÷Là‰öÿÂÎ<šÑõŒ ÑÍÊïw2¾\"DØíé¶„då+Ÿçk–‹½hİÉ†Ÿç;|‚Šg’UÊ™¯®¶\0¨®\noº&íšB²e×6!Ê¤ ‹¥ª•QÙéš½%÷ÔÚcñ®–3y¹f›ÎÎá\ZA«ƒi9]ìåê¸­é`A­}ÈŠ¾33^óé‘9!¹[z¶â§İ…ëâ5¶ÜÛOû3£Æ²díUÍ4g„ît®¹1ÍãMOí¢\\¨ë^ \'R‡ä²º™‡®_Z7×ÂI¨w(c@~òú	&Ë\"·Á#`\'Ì\Z¼¬“]¯3}± 2Ãv;m§.a¨dL‚½µ=·ì‘f¦k°Îñ¼¨x4Å7{AŒXøÔ.=êzz ºâHÆìu<İ	:Ó–j^ ĞˆOˆ<ËÎ˜‡V°s²)÷LuaÅY0ãó\'OØ!bÖs…wJ=¹ s½cJ¾Ú\Z x<ŸCJz	l„†VÓ‰zÆzŒèäÈ®¬ğB_ª U[Ï™CKqûi…¥õbcÍÒC-ÁŠ×ÛŠÏ¨wÈ”à»&™p]ØWŞÁO™Ï]N ˆtp™ûy/\n@¢JNÚ\rHörNé¼®pø&\rŒ~g±±ó¡[\ZÊğæ{É\'½å¾¶Ñ|çéFŞY±Gø% ®0¯¯fn*ĞE˜àc· ûØféø,¹™zô.n<,vâÃÉq¨ÄAèXşI#­=˜€©­Öı»¸c­ÔÛƒíŠ›¤ÒÚ˜‰SÄoñÓ”Ø\n¥¾°	v;ç6	ÓKk0¬öf_‡G”@7À„Ï˜•ï/×DÎ4óPXûn×›%±×Å¤ñ´}qˆwĞ.í-\0zÙ·896YÎEÎVËôÆŒÅ+ªâ`yk#PıØ	=ŠÕîˆ-xï\Zr`%–UÖAÀ	°¥z¢;Âå\0At6që§`±Tw ‰À³3o@êHañÊ`\\ˆ\'Õ¥\rE	jÎKº6“Æ£z­æà4 PÆ¼n¡FûÖM€µÜsHøëMH[r0îh³»£·Ó—\r™,p”N\\\'ÚËe³XîõÙË´/úİËN{#iÊè‚íì¢×ş9‘~ä‹J$95Äzk84à3WB¼Âoè]VÆCø´<&zoİ!j)‹ËÖ`gy„DN>Ät¡<‚÷ú?œ©»59õe[“ø…Æ–·.Kiq˜y›¬¯ì×fØˆÙ‚s ®*¸=$.:ÒâC»è7ıR®fÈn¥õ%96úİÇâ–õœÕÎö¥\nãÍ)§PÖ› |bbV€¯òçå4ÇŠ~ğ‰—å½7d¦·b’,wam„1%\'S—7ÍE²™_Ôeğî’«³uw¾V÷7‹mi^ÜT0`x¨\\vÕe¡lÆîmƒ&èÙ>‚ZëHú‚-­ddwì°^ ^Ä²1p@1ZOådŠ1È1P7üŒ<ØŠõ8‡¶(°‰ -ŞÆB\'¬(!¼}ì”‹¤¯‹À=êÇlÆõfCVuÜ!Gİty¾Éë|¬ƒu\Z{j(µà§hI‘¸P˜wV«-ÀÖ!fÚc³„lÓ›±)½9¡u(\0w\\ŞêyäôŠ	åø.¶Ùb¹şÆ9‹š(îü‚/—Õşœ®ÔµÏ+Â?Cô:5íÒİ¸m2™#k¤<“‚·ˆ$‹Íõp‘(T;jW‡ñpqAÙ†™§)×ú¢û=Ñ‰«%N\0‹ÙÆ‰J¤Y¯\'©)ïÈNSå5%Ï*(*c˜iJõÔ[®¹’®a@Ä}Ï.Z…•´u&K(™![W<±úY”yufÉŠÙb &˜\Z3ÙÚ»TEW‡¤ÿµÛ‡6Éfº«©$¯J§Ä{ı¬m¤q† ‘4_öü@M¤aÀJzÇÒh‹”¢­KÃ§ÉV	b‰§ëm&•ŒúD(õ´¬­ŠáZÕ\Z( ×ºÁÃ7Û­gE½;–Õ<3XÖ\n)’†¤%ÙV1uÑ7Üìµ$á´£CÉ«NjÀaUÏ[ş˜‡-½#Î†%Ö(ÙY„gVÏ¼!3=èa¢=†‰Ep>.Ã˜r&ßL§PFPSç€9½éàô%X„äG.<-Jh‡ø\\4YÌ}Q‰%wíœpyÛÌLË¾Ÿqc9cl£ù’XO¸VZI’Tk³JÅÀ“§1…›©é;Œ‹Ğ}„‹å²ğEbªY¨ëÏÏŠÖ{F\r¸kÖ:¯Ã3ËŸ°üDÑ5¸CIk™eØ]ÒÛÔ\'Ã¸$à”’fóÚ Dlràå}!’t”y¡ú»\0/ÖyÔ4ÚqéŠro<]«mCé\\aITK×³¹`^´­{`uÖJºfZ]¬	¬uX¦Z•\0‡´à+Gî¢4)oè$á\\Ó\r¡í¥ù,£Wv<œf3^\Z\',Ø¸‹I¬0G–¡Å´S¢¥]z÷oojG&§C~ÇWxWR×O;ßâKy¢÷•‘‹AìjÙ)kcZNÕ¶[‘éŸÈÊÅ­·ßJË-èïÃVn?ŸÎüa•8«L¦H-û%LÌ&&İâº.ÃœåODb@Gš§i>Ÿ8#!íæ\\Lhu·ÙIr°£^Öö¾wÔ’cï\\}39¸9V-ØÕÛ»5wĞÜŒË¸R\\øIo ÃYÇU\'Nuç:aš‘}Ú\"%,ãJ©y\'åYÇ`ğAPjÙìuÈfy\\ç½ñ\\,4+saìÍdÉèìÅë}G½g\0Zf‹z\n&µ¿ã„å9š\'\\0á\"Ş\0+“™İÖê²Xj\0¹›-Wb\0ûl-î\n00tcÁ±G¨ãMÀeÄŞÚ5gÒ`°–:(GÌæĞ™\'Ùjö¾–©Ë±æÄŠX“gÍ@OXËÄseÊGâè—Èò)À÷Z³û	9¼È&Äã¥9U{1Fh¿Ç•–µZŸ˜zQ.õŞ¥XR«Şñ—Î*yÆùàÖ{\nK5¼ÙjÆDà–«C€2½îY4S„*®Ïë­hLC«¢zyŸõ\Zñ6>UÎu¾™\Z¶#è@ô0Chæ`SÂkiğ$vT{,°oºÉn]/ªcÁ`K\n\0M7VE­B‡ YF£F;°İ7m{S~Ö\0ëIŞ.:F™%€Ú&),§‹‰+ÒRï(ËbëWŞ™óL”õm¶Ğ•úx™„”@mê•-@ûõ.jxû¤Ö—J-6İ´–Ğä˜ä7Êî{à|‡m&õ,Ë,°·à²›Ì4ò¸ZD°M(\Z\Z¾bÍiY\'FÅÖªîĞHiÛgœ0!DûĞ‘­©\nÍØ%é–Ä>=:0#Ÿ$ÓP¢²F{/-àõPçÎ´˜ XÆØ½(>nTrft/Ü—ª*x©]v›¶­ìå’³-RI;u\nt|QÉœ5rÓ€ŞPş¦/r­\\¶9Ê–níçÄt-iÎd±ívâQB œÍÈ\0ÎîA7pf?[.\nÕÑŒNİ/œ</\"áD \0Á^! ¯°åÔœÏvìò|:CŠ¹«%ÌàìSûù™)O„¨£qªf¡ŸmQõ_Zc†Æ:šâSØLÊ«!i{Y`œC¢Éñ>¢æg¡MÛI^d¹>Ò¥¬Lšr¥fckÕ9Êas!wŒàs\'\\2{Jp€\n1~ßë•*‚Igm5³ÖÛI¯àšb½õDò M‡­gÛÂŸ´úÄ9d¹_ÇÓˆ€l`qqÁtÃÇó`#¯:ZëUs,i-ß6™w±xc:EA›e¡`U-N\"Hã—í´E¹gï³Ôp“K#ÕÇ³/!Ğ’\\H\n¹¹ì8/\'®°€àdó4;ŸL|ZY½%c``·*Hš¼¼¨ _)ºõi‰³ùT2ıV¬cÒy#ÎYâ;·tl±¾K6/ì¶ôçµyi–œ)ä‹©¿ÔƒPµÜÊôèÔmğU&ÀN¬äí¡ÚÂÂ¾7Q.—ËyÖö‚’»‹oìæB¼„53/¦““}òª\rÆ•³-J¡H,DWu}ÿ‚ŒMT#õ2ÙF­Ğ{¶1§!EEjÉMkB=şœì©fÊŒ`pZMÄâ)	ÛnÛ9AsU<Y£Qİ‚5}<Ù¸Ew‘#£ÜZ+“ùFšûkgÕ¬2:™+kÚ¡~h¦5äƒéì@’¥´ãa¾[”Í!Nù^Ñ[r­Wg¼ğ¶k9D˜(MWBUTŞ‘\0xÓ(öRY¶M}$C,ÈŞï¯JQ6m-wJäÃ¾n8âR“‚ÏòBØû›è¸gp9^Y	Ûd‡’¹ŒÑ÷f?£b%Ÿ’KYœ•·­ö¬¬ ˆ¨d!ó$ÆR÷\'‘XÎµËòµã¶]Tá\ZeÁ=`„ï$…Ûj9qXóóÅÆ§gÇåRtdI#×­xi°©;óğ¸Ñ(“Ô ~a†éÂ)-ˆ¡©M¸ãYÌæhË:Múvk	ëÀ¹¤ÀúÈOãÄÚ‚mpL‹Ëı\"nRÈdÚm$ô6Õl)v¤M¶\r´f«~\\3•í½ÕÜéºƒªô	&˜á×˜»†x£&oÒ5.±½\nLÛ³¿ÏåÌ™ÉRwÜ½ï\'å2\')3(–—õJ4+mp‘|\0°“©7ÀQ‹ã9äÓõÓ\nXeIxU\Z@EĞ\0P‡\n“nªI\nè«è™Ë |ÅÕæ—\'~sŞ]˜@ïY$™ÜJ\\ér:²0Wlx98Äó\Z;X®É+¾ÊÏDÄl¶S}ÉMS>=(etPÓğŞĞ¦}åd\'é™Ò6:mdwÙz˜°>ø\"É‰äœHsµ-Rõ\ZşŒKÜW+„ˆ/_K²kI½9Â¬Gäkgë­Í™DëC—Ë%\0áÚ\"w26«y¤;jş3D˜È(¿¤Ù,ê\0VÖš3#ĞzqD	µé|i§ÁPäÒ9Äu6¿VğVL1q^¨zXGLÏœ-¦eÔe“pQWÍĞ®Ö,×›¢JáÖÕ$O9²Êç¨…b+ƒ$Èüb8‚åmZœ\"ë“Bùë–VËÌ¬ZR°Áv½Uu[+óì¬Zh=Ï\ZÜôã#´ÄæÍh/¨Å±9L¬İjÉ6hfPw éĞÎÓiZv•k6è1Èm}CªOÒ½8ºH­­N9 zeOHşSÂÔŞÅ:p¨*k3ä/ \'‚(şÁUAŠ\"»š»”@m€€”ÖZ£öŞæ’ (ĞÇ\\z-f­”²0q `öŞ}ñúB‘.dr‰×^.EòL€}RÑ.«8\Zœ†5Œ§K²Ş\"ÛHe©íê#oHc·=4Líy.ÖÛ° $ºpÊBëuiÕ^A&´°©ó„ä“ö³µªÂbT©]hél²]-9\\Lz­#IbÇÈ–ó[%MaÔd—^¶±–ùZXLrG*«ÿ\\&˜$™]i!†Á¯àbƒíŠA(nµmóTç—Ò[m7@SØGW«\'bÄ,+Õš¤Òª‚OëÆœ§€vØ…wÒVîX²¬èwöNs\rúf+ğı_ŒÎë“:,\0æ²\\¸\037‘À´KR×0–ô™=Í=4½uynU„:ØÏ§r9ndùòùŒ-1¤wÚDùÍäÂ”å¶ÖùcJF5¯Ÿjé¤bÊ^?\rS§¶ŒõØ7\ZK1]\'¨Ë\\+¯!hà@ÚS,V[Ë™œ“n.RË¹wô;„ôö¸CÆ7pƒ«\'€Õñ“Œ-L>JÒÅe•Ş& Úy€q-?EtzÁ\'`‰^¬ŞyQñë9	¨]‚:ÜS,w‚ŞîJ–-³f‚XÌ¹i.iåuS±°Ìæ KrfTï{®±‘EÆ’qíÄSdQÇijœ%\"…U4ëå‰:@Çb¦Op8wai\r¾­¨†:mr¡#@]X\'!Ó9˜T,xéY\"ô{\rÔË×^:ik½È”BÖ WQ‹5£,`\Z…½?÷÷û×ÿıÿ^“[ÿH“¨ı¥°n÷{‰ıË^?öĞ AãD?®¹ØÓÂ¿áÿõëâá³¤¿TèJœ;7Xİa×ÙYÖü×ÿĞjÒõ/VzC«‘U¯dûû—Z­³Ø­¾İâéÅˆK‰œ)˜(İdn´±Ïøì¼nj]Şç5î€ëXÛ*S)‡³¬½vYl˜FKsCĞ7ÉTákÎk<²ŞÇÛ^M9nÓ»“Ä¡@@0‰C)JŒY®ö;çBm‹ÜTM€òİ¥KÁ]%1D±ÓE¶òOs`Ï›ğ$c§²åG\r}ì”8Â½…AìÈ…O©¼†ŸFñU»×p4£¾Èèb¶ša²ºì¬ÙÆ?ü.;Ù¡¬´\'\"íºZÒ]k×Xá“G~Ûz\nRû–ôÖÜf!¯drªs{²ÄL¾™œ\\Æ‘KdÈ\rO¶\r\r ëõä®—»~ÕÍNnˆğÊÛªˆ\'P%WlÉ<£×F\"T×@ºûÆsÕ¤ÃThé0ğEóËÙÛ^)-¹Zªs¤ZùÖ¥©uı/Á„\në¢y0VÅğfRÈ4p¯Eb*EÉáxË}ïnªÛ’\'˜[±„›öòƒİœ.t Û[j7½¢÷³iF\0G›¬Cƒ\r	Åß8fÇrÈNâÀåµ\0ù{ÉÍ‰¼·Yâ,O¢7%oµIä¾óÙ¢õ²ùaG\0ŞQSI‚Ï–\Z4GŸiÔl³:[Ú›”àl…V!„2Œ>ãÁH¡ÜÙ¤Hf5~d6Fá¶Ğ…Cyç¸±–ˆ©ÑWdoõ‰Æd·³ÑfÁbÈõ˜øµv™®8iƒƒMÊá)İ	æÜàR,ò%dzXBN%jd=İ¹«op@QÃ÷zĞõÖŸ8(Õ`+Ş—‚•	òº¡\"ï\"ÏŒDƒJi¶ÛöÔÿÆÄÉÙî‰zC$©ö‘¶z\'É˜úõÒ%¡4$Ô8²<ë\Z6£¢¹GOÓYÉÛ3ÒjN:3Ÿª|u>™\\˜]#zóƒ³m»å’·ä€‘4Q[êîyPƒ8fëdlå,C„M¸Iò%°h\\ÓS\\¹Àë@ÁH:“-Œ¬ãb»Z[óÄV6¢Š¶HiöŠ\'>ìÔ^Aú‹Uxœv\n­€ê)Úrkûz¬ÌZqo—îÊÌØ\ntkQªÃïAeV‰½Áô¶¨c¼Yç&IºÂ‰)¥O—d”¡`OÄCz1¬âëtõ2ûĞìÌ^ë”Şòl\Z+4 \\öE\\¬¥)Ñ1–6i3L<¥û°×RÚ…-ñ/|ÅW>€k»Xl‘óš@½fˆlj/\r1¸ì]ï.4ª4d[ä’·,ÙîuUo7€Ü¢€--)êÈYßËh^«²di˜_—´ #l›”PÜ6³6Í+h.<x×‹aÒÓ3o¹¦¦tmÍŠ-;=Øqê]÷‡w¡a™8j³p’Oyr(Ş”ÔY»(ëªÄi2_D™ ‹»8œkDÑ—¹‰„úÈu²ğŠŞèS=¦P=»¢\rÒKg©ÁÕË•e$\'ĞT‹a’Ã\0@÷–\"§ÎçnœˆStÅêâ.=%,O®¨9«ü(m˜¢²l+#İp‰Ëƒ÷¼”®ÒUû¢¸ò‘¼¢	FÓ/!¯&SIpy~HGäe\n˜Æıê¶6¹¬ø\"ù\0‚smµj&%„1á¸ÙAÓñ™C‰\\Æİ‘¤Ork‰^Ú^ÎiÚ›±éœ®y†519,i|ÅÃ\nİà™á$41ÉÏLµ(ØFèÑ$AElzQç\ru<‘´ˆDšók_‘H<e›Õ4O×ó•¤NîZ†¨|\\Áfí¼¬X2ÍDMŠ>Æ‰õÎc¶§Ã9]+äZ^ì½.cåÓ›½ ¹³„;ê¡xv×g†\rp…™´ÛõA+Épáò0ÈP…âVğ´ªr¶·[½7£{#×/)ÃTô,uÁÍªaf¯ÁÎ¦öÑïÿ%K ûb·Šİo¬Ş2BšØ&+H6¡Êuo-XNêyÒ)½,°{SRß<¯&ŞB³É`¶ğj”Ü5KÌå4\0!3 Úws>‹ÈõìÀ³¥“©ÖY@Á©.¯˜Y/f,\0ÉÕÜšÀ¥:1(’¬‰C—ÚDÅì°é}¸RÜmL©Øê³\Zñ­b­ÖÂC\'5j3¨‡ùPsü¸› ŠtuÕSr½@Í™AJ:Çlî^&ˆb¿-dî‹Ör?Ûö¬c<Ç`s)\rµ½œ$f™¬!!•=ŸÑ	ÅçÓdÆ.ƒlT¸V2×Şk*¦–,µ	×le®¥¥T¢0¿ªĞ¬¤^‘àDt¹%sI‘Â]ne2·5Ñ\\0³`¾×vb-…§.ñt},|ÈQºû¾ìõ9?¹ë9ê¡@#õ \n÷;OàAi_ìébFO„3œ_S~FpÕ…›Ò@™t8^êTg¡üL²e7\ZZH´;†‚Mú®8Ó`´RG±´ÒØ¥¥Oi?ŸËÜ–µô.XÀ8o‰PÃ±¶M@§º0O‚ÖËˆ‹îùkgGÇGÚ\\Ê\ngMëÄ9e‹¬D4y ‘|»]x€ŠÃ’E™Hmj…x¤¼VY¬!\'à\\ä0\Zçª?8¸‡t|&\"$\0dBCËÎ©&òùší=NRJÏS7Ía‰ÈŸœ¥˜¦+¤ªAÕÏÀ|¢lÙåQx`‘\\š¶ âò@q´«5¦_vG¾’ºMØ[d÷÷¹.·¬†à¥¢A>å/À’U6<¾ò^“[dU1“õlã±½.>ÚHö¢*Pûf¢°rÚ•mL²b¶UG;D­b2l|ï¸Ô^vUÂ$Ôu½Ç9Àálşp„œ2V™S³[ç¾»mEÉáÔRz›çx¨å)Sœ—Üeq2«&ëu½äçÛ³Ï²*İÖ“İâDêè¡öQ=;Uk7æÑM«MÓ`v\"ioİlˆˆfŞ*”1_Š½?„n•¦š~fÁMfçŸ–@*`-İ{d„Kš‡]²—œ¸v·_b\"ø	Y$ÎÑŠƒ={¢YUÁ–ôAÔlc*ÛÌv3ÓUxŠë\'ôÑefÎvCKÍDh»I\"A^Nfœä\"·Ò,E÷À)õœ­“°íì<)¦ó¬u|Å±¥¼›¶aVµ^Ziq…0øÚ*ÓEX‚ÙòÑ6eÙíÖŞh¢[I7{¶œsÒ®/Y®ª¿Rw»fK“Ôi‘&»ZRÖåNë…‡\0L}ÿ\Z¾Ññ„. pï³½Tä¼P`@¯]¸‚W^©û:‰È[·Æ¬İ–û—ÌAÌ>†k]NNÊOˆ¬\n¤ßÆš¯qb±”T·=JÀAS19sP˜ø\'C¿xÙËE¦÷*…hşL½åa£S\\˜H«İ…ç4•C·õØauqIŸ…`)]®È«]´QH-uú,ñ™d1ØŠ‚H,¦6\\V¥ÓnÅ+¿;„œ‘ü°‰ÆFw´Ö¡ÄDª·Ã“z™€¥!B¶İÓ[´÷¾Mz6\rÔK.Í9\"u0w0‚‹VÙ4¦¬gšıK€K»Üf5¥ù\nÈ\\™$«u3¥X:Á¬YzË¡ëL6ëÅŠX›Z€ëÓ	3U‡Ü(3‹h¬5gÔñ˜ˆ½~r y]qY?€°õƒÂ¢´–3©]õkË·›YbšÑ:]¯²}GŠ³ƒ¢ê¢\r$v~¯&¤¨ÁA¡uLtÀÓòÔ©8Èâ9¸kÌÓq³ævúZ/–[[U°EÈK(§ƒ dÔ——k`¸¦ÅÀÛõIò¡,ˆî¶1r‚¡ƒÒ˜½º„’xº+™¶˜ÇÚ¶G‰ç˜´%oÂ@Ê½©¬vmÌVÖ„¥¤:ãAmº\\IŞĞ¢ìÔŠ©½Ó–s¤;]—!31—öœ°ši1¶c~5Œ“Õ™t¾™OVQ†§twFô•u:®±í}4.Y–ŞòC~`{œÄKO¢¡<{‡ËœôÂb#\'5 TíB)Ò”ª*O¹pC«º„$qÛÍgütC/±yrødXÜ)ô¤µ“0ó0´l:˜:âÑû%f@{5Û æ”‹Ó`»Q×Ü‘?ÕSÙg\\ZªÔ`sLÒ»ä\0	[\Zc±ŸZúÌÃ@íAÇ‰Ç1„ÔÀÛ]Ï×Õ®¼\"ïOGn3©©’5\no¶t2‚Å*y]«{ºÊ×MrV²©¼İtæf—-ğŠSÖ‹i/µ‹É~•0‘G€Ô9¶_öz¢ÊljV3\'(XÈe`©­cj‡u$Íıø\\QõrAd;£TqÃlv„ÓÙ&pKyÛî;@è¨õY9.(ß;õLÉ/çgAMĞAs„PèMù³rzŠ ²vöá^¦½Ñp–æ+(š§³€ÎPÏ`eÅX¦/)k\"ÆÓ•8]ÉëdÆç„\0äRd1l\'\nÙiâ°I¼Ô8®\'¼ïçåN= ˜“Êu½Ï¦‰ÌÌ|··ßÎB:ÉãC–ºûUµEø	SáıêôRÜÖÀeO`Ê‡6~$\Z™Ë³w÷:uXSàÂS1\"¦—“_°	%©ÌÜå—AÚvèç§-4Ğı6avÉëŞıµqHÜÒ\'ZÏºŞ/ïV‘™örí’Rs¿ÓEC¦ÙrÃÎTÊWÄ‘¤ji:_…ş*ì½UK%æD±\\ï\"¤Ë’hßõÔ‹A\râ—ä	(ë›N¡v0‡ã Rö®2Gáfëè©ë¤‚êEvìÖü1®¨XQCfï–67‰9[h{˜xefàÚÛ°ØÉf÷VmRc°óØŸ,·‰ç“Jâ¸‰¶İ°$ŒPyj3…Bt`Ò´×İ+ªnçTÁ­6à:ÏÄdH¤@xÑ­O`zêE&H}¯@\ZÆïv8tYÒ‡eGRª·=ßh9İ†½Í’¯Û¶éµ¿æä©÷çJÁò:l“s*ÉÙÂÄ\\™ÀyV,O¤qpÙÌ2È–Ñs§{ùªŠ7Óš‰Lù\Z¯€à È.$Pæ’\nÄ¾B8æ²ev¶TE\0b,€!¡„E9\ræ¬€ÊtTÏ­ƒ{:….¯sàÒ¬SÇwÉx:/Ç°èÖx*‘—.µUïæyØr†»£¡k¦6ê¹Ër»¾ò¥.;ôA­;ÀÔ|C®zÁ£K34?†jo$\ZPn\ncó8\ZÚ`AÜìƒP!J6ÈÌ%¼uU!bv¯èLuırkå¤\0x™czÛÑİk®rÖğŞ+ +e–£\ZŠ¬$j- ¥¤Øs/<røS’’Ùs€é¬Ÿx®C¢4\rS;\"ï·]æI›DÏÑJÈ1-µ±E+M+ĞâîO¤à‹ÙÚ°4>¶O2LÀ}ƒU6¿DNæ\"çİ¥·‰-©`¬U[--`#›rß”,X7©°˜tj%‘Läè[†ä´£¼$x6÷Ëôsî.IuYûÙ>ø¤ª»8S\ZÜÌì¶¡ò™Âà\r‹z®–üvFøª%1bSCp&.ê~#§ô>ÉiGltT>#Û‘“éNfcÛ<x¢|<cûÈiÀ\n[ŸÁÉB^ŸWÆ¬ğëdÎ7eÀ¢ó’[]ŠzÛÓ”Po˜Ğªš8™Ûå’¢	67|já‘‡Ai__àĞ]úÔÙj6½f^Hš5½TgvY²‚¼İjHcicW»ÊZé3ñœQ^]Ú¤UWÕÍ.†V¼çîOsK¿`:d­ÌÓV\név1éeı<¹{Ôö\'å&Æt“óg¡u	óu«Ú{Tkğ\r\\°ŞUu¿?İŞ};í˜cnd:àbç8-ÃõÚe³jà­#­Îİ™sğ<P í‰š–&3¨÷/ißõ›^Áü\r5¡`(	óKLOKJ—R€3Gw¤OÒeæ	Ğ¾ŸGBè×ñwYÖt1?mh±,DrNÔãê‡ã¦›Tk\"0${Ãò”ÅŞ’…b½\0tcaÑá4‰­›í•TEêî×k#N¨òÑq•ù^RO™€£±Íû½¤’p¿Î`º*ğùÎª&$\'™Ë†ší’À¹Ù¨g‚Ö6E²\'tÑ¦~¹æŒÎÃ²¹@ù~«ÒŒ#P&AY_!KâFšc—ŞmY´u¹l\nÑ˜o y.´°áˆ›Y\n¶´ ì7~ïº0¬WÛ	¶İëîÁÛ©!°Û!ÉÕ-vjLÖò%a˜‹÷»m»\n³;iâÎÙwl\\t€Ş¸„¦{÷âÛæ7ÁBf¾¤ÚmÖÏ»\rOÎªziˆª]3¤I¤»¤IjÃÚû‹Ş;2ÒJtÛ7MV4%V@‚KÅö®æ ië¥I°¼Í›9¼ˆ¥ç–ëıâ…ïg\r{š¢ 1C.wµY/Ë‰Ø{åË@ííÿİ*(á³F8ÎÓ—\"³<]âÙª_‡Ä–§$l1¨mv\"ÓÓY6qğB’Ú×i‹Ea7ş%Í	É{ŞM<µWülxgá¨ê”ÁÖ™MAÉº8´œÀ™íi ËÏ÷xûl×ÿwñ³e“\\Üğ$Wµ×ÈÉµıLÍ–·>x\nÔÔâš8ê¾&&ª{›TÎ®S½ì²7VPÏWÕ\"á—4œÈemrrÔ»´ö|ï]‚Ôû×&¸,#d“Äv³åÆå–S[ŞÛGÚI9î)©qå¼« …5—a»ïuÁQ\\`\"š°Õ5h¶¡7Uu6EÏ{hy¾Ì’äeìQİd=_»(ã Ó‘Ú„¶Á	\"¢¤I#¸ÀHÕJBcÙÔæéaŸ86Zñˆ›¯Ş8z¾åU£®jw·èÑ\0W¥½w=ğP/ÛS«õéâ §zhÒlŞö6N<Ç8#¢^fõ»ACyÉÀ—è˜\rs³Ÿpd¥ò/İ\"[®#’ÏÕ<5§E§DaÓídIRÒ7~X—Æ©½mÕ“o…j†ĞÎTŞéô.Ô4Ÿk¾tâM‡A/Xw&¨ˆß–Íb\ZJûëš‹¡\\RÓ6§±5ŸÖxa.›_ÑØg{O(¹˜n“ÙÅUxPŸ¦§ocºóUÌqYÓ=³ÕNp‹-Å¬]ª\n¨môéÎñ(7[!…*²Ó©H.Ç„ dàæ¬½²ÚÏuÑnd–CZ-ÎL#ÕäJ¤V,›—ó İRZ‹ë¯÷J_€\0µã–ZoÓ•àI§«{#¯Oô9Àfğ¸CŸçØ²ÊqæèÔ–\\Cí´³Š‹G¤ÅÙ>òhå«S²\\»V¥m¶q:FëLAËfWZI  ½;C÷¹œW³eKªHL*¯7ŸXä°Í$·éq\"°ıq¢‡}Ÿ¢nÙ5‹Nâ #IúK³ ùÓ¼×÷Ä‰£ƒùv³<âÁ¶NLœğ°”K“ˆ`ä¬£Š¢µCáäùè¦0Ú§fµ Ì\"à«†Eæ\\SÂ/lp_+qgFôú@·ğùÌÛ¾Ïd·^&ûE¯dÔía}™NækÎ\"ôÃİÎ+,¦uÙ©Ğ9{m{	i;¡’ÍÊØµÄÄ(Kú±o	\Z ö™GAá&òİğ§¥W®,-<I­äHÓb	îe+œkÔr“zg\Zwõ„çÓ6ı¬q#A¥9ã+›ë©`Û¸S°Ô¥5/¸E Æ5«—xïÖ²™jªİ!l×›ô«ÎÍ“Ëxç2Z°Uò^oj1ê‡j]ğ7[Â‰\"mn¦,(/â	6K/“H£Å”ç<å×‡i0/-Í¨RPáÎ¥k¶&:k†š¥n&K8s¶´#¹‡Nì<wÛˆfoÀ7k!m)’Ÿ£òÎ†½“Ê[²åwùâ¨/¶\rÆåv²s`Ö4ğ´\n}¢ªNÌöµ½ñ¢¸D\r>R5yj/Å„Z3›ê\"XS¬¦ø\Z\nv‡ÕÔéª=£ÅÌÜ0U~9ü®C§ìR\n(®&åTÈ{Ñ@!—£(šjËÊ¶Wõ¥;Y…/2®lFÌì¶mz£Gx|–Û6¤÷…;É˜ôœÆ…ËïÀYcb6P³9ËzÇ½.¬’cÉI»ìŞÎV‰‹ëåì°ã]UY+Û\0Cé9\0Ê—†\"y8îLLH\rÉ·ö’•(@÷İŞ‡ÀŠÏµíÄŞiP\0EØ]§‘ª*\r\'Î:ÙL¼„Ö6°7\0¿ö8ŸUÉÖ³H2ÁÙÆKK]Ø&”Æ’`·,‰Äh€•f¬M²•M)Hô—Q‹’­õ&íø&zo6;U\\ckYDæßppt`PÙHÔEp«ˆ–\"4$©lØ$zWsÛ™¾8®æ4{}—z1õn…x0¸»Û|ÆÖAAj½VÒg3\nœïD+öï|njeZS‚ÎŠuzcÒ\ZÅL•z	Se@w‰<Æ3TïÍíC\n™ô,ª&Ä£º )®“‘.ZXk®*@(öò±4P4ÏàÆâ9l™DÜÂX)™Ø^Åöì5®Âs–ašESø,Ëê±/ÎŠ9ıØ!1—÷pª6^`¯pÂ £íaBXÁ‡]CÙ\\\'1åœŞÈqmïÀ;µ»î`-6±¬<N¡)\r|§ëCïW}‚ÁğcÌ&S–Î~å—j#ñâl?ÑiÜ¨övÉGUºÜ\Z”£õ& ÷û0\n\'‘h¥RqPyØ9Êd£Ï´nI7ıëêMÓ\'W/|¤bm´Æ„Í>Únm¾¯Ìù¾ègÅ2º!@ÀÆÖ3ÓµÜYì“$x>9ÌjÊkGkm­Æ¶Kµ&P¢ëYB¡‚ÀtÖ<óD×IR—›*ÌI€úPŞ(ø©s€µ;£<³%§v\'´u-³Î*`aîO½e®é-ùy†Ö“H]\0ÄA€á\n7eùb/J¿x¤›ÖGí\"ËÅœp9”‰»ƒ‚Y;Üë\\í@w1-nÜå=îÇK–nz«ÎÓç‹Â0º‚ò˜ô²êÖ	ÍN6¥öªj~*ïêÍüòSÄ£¶[M6ËT ç=İĞ{şls”İ™D½²WÎ4í(÷§­\'×`-Ÿi°†Ô}Ÿ\Zœ89ˆó¬·ÿN>ÛQĞ2Ş\\ĞÜü°ô¹Í\Z¸Ìu„9Š…{flÕ­«š:¡Â_ATÔ=¢é¢[tÌ1­•µ‘ÂÎTŠt\'”Åƒi[L;|”á!ÅÎ…¶s¡ÂXEÊ‰˜3Ã\r{³‚%Æ\0›…¨muª-P³68hæG±^y e$=ûäÔÂ’eààÙŠ0Ùp\\#`i‚*(ÙPl;Ól§’\rz¡5ïpàˆx(İV&RE^	ólÚÒXÜNmP6i0W3L¸94İ¥Ò|²EIqÕk\Ztù©µÈ	¡4ùy:ËÊ¶·”ÑÙb/{â¦>I˜Eœ\ZéAu/Ö¤WV\rW\r†pg˜	k=0s!h{ÓD]Ô»Y5œ`kDº©99Vt´ËaOf- ?(¿€´6\0ÕÔ•^v6ªmpkIO¦ÓcJ_&bÙëÏKÀç½’Uv&¡ÙÊ%rHÙõ¦x/’ĞDÀË$^gÕó8@gÊslğ[ã·0ñ$‡ÖÌpAZÍ*6ÅÈXºöÅEZfªI¬©oØUœñ¬—8Í¸°Õ-0f]˜óÈ`‡®Y8¿ìNÜKŠd¾œµĞ\Zº´Á²°Wµp²á¢‰ª“Wƒ};ëEUÌì§âtZ’sı|x\rãZ¿}ãÆ›à!šª]«O+-’‹ƒÂˆšÎd¤rºN†µ0{£k·&e´ÂÚºÒø-JÃUÈéè¦Õğ‰âŠºÄœµÕ9­lxŞNÖ‡½)‰²·¿øşn.ÖóèÜé\Zµ±XÔ»Àtğ¥ä-÷ÅäÓº¶Ï‡İôTV2U©4£·:{ši^Â­Å“’Œp$†BaÓçì\"k%\0D‡€²ƒºèpİÒ,Ò•kœh)^+1Y¡üîèOŠKã1Ç­k[aŞKäW+T¿½¬uÔ,rZáÒ€kT¨f;ÂÚÊØ¼YZ\'‹¨‰ª^\\ŒŠ¬d¢Î\"@kË\Z238Ò=u³rÉ–OÖ[­7ÓÒ³f4fĞjâ›ÔÅ5l×Ûpír§m@ÙjQë=ràÈegK1éˆä\"ÌX4Ó¥‹bf&î¶^à	‹­Â\\çµ5géóqâô&0¼Œ¼š’é:*y¯ÄêÂ3é^É±)Óİ1í»Ş% VÎ´Ş_Ó˜Îä£“\"uµK5jOù¬Û¹Kt~TñÍÊÆ„ŒKC ÂÙu£ŸZ^Y`j(É…³ˆÜé†w&8œW;*ÙÍOTàçu\nfc+\nëP]m¾¶ÔóšU	ëYä@ƒv®C‚Øœ¬[´×ë6_Kñ)ugl3»ÈÊa¦ÑºfÆFÈgm¡ÍTİ›;¨‚ú˜C÷R¼S|Oæ/+ÚÖm?ÎP8×ÛÇèŞ.Õê•ámñÒ ~÷\nEÚ„Uz49(Â¨Wö<Î	[Q~ğ`™Ü›°Ò`Z—(ß‚º­L“Ğ„03&<#Ë¦äÚ8ÅôÌ*ûU Ş6CO™ØQ½êM§ßÄ$ÈDT)Ö—}Yôdk³ˆÁq5‹kt;ˆáEn–.#b%6ÑğàÕšh–»\ro\\uÕÇÔÖ~Êô¢9öönÄQÆîu‘‰„80¡*ÂVåŞˆ©ÜšÉ[èÈ]•—+\'ô›-ukê9˜çáÚº.ÍµVö^ìÍ–sñÅXœär+Q®j\"{ÎÏÙô¸Ö{Ëì$ŒÛª;Ã Ïmzª	ËšÏ%—79Pj×»5g7³ÒÓ“­I„³g¹×<ñ×²<ÙúX!.RPHq¶_\"×0=ane×•RÓxÖr\r{µ÷ \"{Y[†Yî¢Ò¬­É’‹Xkr2h@…<8¶›ÕÜ9[~Õ@‡bş”(2™ˆ¾«¯ë4U}•±Â¥)«5E/¬LrÊÏ/ŠëKîÒAÉ…b6Çúõ[_h•gNáÌë\rÊcZyädw‘‰VÌÄ“ôdq6ä™êİå@d­Ã4¢]áyzLe\0;Ìš­ÉšqéOº7¥¦PIZ¶â¨9éÃ‡ÓìØ[PÊZÛm4›éE»f€9‘ÊÛs;Ç²¦ös-Lì&Êd‡O2§«¡‚Íº-L©“Çf`ÍD‰a·:„ˆ*ë‘é¾ª—ºV@¡\nÓÓDF=nªñ½IN8ĞÛraúñY\'B…“}VË±µ´®ıØÕ½Ã¢ÈLlb¸÷«\'ZíÈÚ©­ÂŒ‰¤9T­èy;Óå°ó3#NÙr›*§¹pâ/ÄÁ¦n€›Å¾X`ˆ¾)]é=VmsJûÜœ$¬£ÕN^†Ş^š~Ó«ªóÚìBƒ›&Élå£Ë9G³vÖÂ˜@öe¯L¬Øu-„Ì§¾ázÇá6õ¥H§kê{û¦bQk)ø‰È\\Ê}U\nMå2ë*âÊîĞğû7™ úOARY}9çÊî¨ÙFã%\nYÚiou3‹“¸Ğ&‹˜ìğiHT8ï2Ä\nò¡)WûûÜæfA¯Œ7g¡K8Ìğ{\'ÊØYw)B\n’çàÄgK#˜ØŞyiSÄ´\"k\'5ó^âé±è9&t`ui£û®¬UÆX³QAyÏÇz“3ûö0IóëJSpÙ˜íjJÓöWÊ½FĞáŠF§kù;>Ğ\Z5ÄF³¼ÍÚÖ‹Ïğb¾”\',Aå\\êl¯üËYkQo\Zl´¼M0\0Ù“µ»Ã„İM2´UØû2¯§•&%ÉÊšYèiTä-aÖj³]ê3œ=HÒÿúšı„¸f¹şõßÿıÛ³üÃJƒä<š×êv•ğõNÎGRd”ô<#FÇ‰QlŒ\'ÆáOÄ¾cäå7]¾õåõw½~¦‚ĞyQù½ß#ä/j¿õü™<vl#ú®ï(ö…úÛ¾Ğ7écôßÍû\'ú °¾ë<&ş¶ï_É¿íúWòo{~#7«²L“{¡÷_ï¬\\ÿŒÜYı9áÖ{â¨÷4?]eıvÁô{¢â·tE·ÜÄé‹>~ºkÙ!/@ÿèmœ?¼<°ÿÉĞp{½E÷z[ğÇoOÓ>.ù-J£¬®ÌZ”O·MCĞ¼ ørOïó½ûoå±‡Yx¸Ì>V}ËfıvÅúCZÂ·l½Ï×JC/Ò|©/IKça0Ï™ŸŸï(ÆV	}¸éü±:¿\'½¥mwì_Ê±¼÷ûàZòEG¿Ô7’ãúóÒ¥¾¼ÿà:N/ÖË4o_çû>èHUÿŒŒ,?xO{òx!÷İíû_¾<5¬k‚‹ÇlU(ş•ÉVu{xO5qús$ò¯\'üz‘8äS×ÿø’RüÓEêß±Òí¾ô¾fîá?o_ÓÚßNÓ5“ûÌÉ‹~›>_vÿ\"cèC5fj·|ˆ•!ô§KóGûÔOh3ô… ¯#ıÚš›¦åãÅÜÈ§lÔŸ’£*ùëèÓ_Œ?ft¼ì±óÄ\røX“fàİd/ªË§L€ğ—	ú¾ğ/>ú)¡Í×„NÏóıH\0ú(·úßT‘ÊEóûxBDgrıó.×<Wøı]×j,Ë×±ß3ÜDşcª—§>`c3şVğ*×FŞ$ØC2¢ÏWÇ?L2ùMı×}¯†şû)­Î­†Ä©¯Éú­öÇƒLÛ`Ÿ\nŞSF<¼éû’YeFu¯ÀÍØù*o{éÁä¤é_©äOFÃ_(Õ›Ï‚Ü6\nßL^R<¦ßzÊ“ú–Scœò¦ëéÕËÔñ79MÜ·ÆOŠ¼®ãk²\"#óóëºÄUTWUZÅÉ7ªú4şùQeÿõöOZõvÕo¾¹ïùÿã°áÒr{Ğ˜èo(ö?ŞxñÖ:AüF}ë¯[û3Uövk–]ÓË~KüÈb™‘8¼e}‰Ókş¸¿Ùƒ¾ÒÜğ~xş]o©í~”mvO.òûËÿÍVşñ©ëÑ^,Y#Ÿ2ÕıÍ&Zx{îÄYÙş¹–ïfú ´‘ãü®¸;Õ¿|d•±+½}É»OôÓ0M0Ğ/×†û÷OzüoïºLw‡à&ëÿ¦ôÎ?aŸ»ÆIÜô9?á‹F¿¸SC¢´Qê[û|ÍQO×úXÍhñ I®Éh¾áÕ~ÿõûNÜÿùF¾Şf ·Ãyı¦~^Ôxë×5]æÏzöÇgëşÏÌW_±\\~¾®oËp›Ê·vˆøiKnĞ8¯émxütu¾«b¤Ÿ7cü¯ˆù ğ_¼†{IËy9$_ş·ÕŒ<×ŒıûjFŸk&ş}5cÏ5“ÿ¾šñçš{^ø·UM|ªúß¸†“OU¿-â_¶\'®\\ö³MşÈàßm•Ÿ™-¡üoµ‚şÅV®VYÿ¿¿Óö›Bğ¿Ó\nşW[ù[ÓFüU¸š“?1(¿aÛ¿ÔöBâ“ouç»Q^Óß¿êíŸí´Ÿj‰GÏy“üåÁß+»õ²Wœm?ÎŞÚş‰{äc¬öúçsù4A?,\'ŠŞİøk€õSæò~¦şû=–øãn2ş™¢t÷Š¿†İ#	äGôéÑnø3­>5z7@}áŸ›IŸ¦å>¥£•üi†õ`¦üş2–{ıµö¾Ÿ€ß?µ½]±ôË^c†:î¿şø²?>ûó‹ÿV¥maşVå¿ÅQşü§jº»#¿üòJ„]õÜŸácPâÁ´}­üÿÜ»§àÁÿ©ıû®{c<òüouPú?ì*¿‹Æ/!Œëh¾éñ_Ûÿbcoü[\Zıvïü‹-ü	»ñÏÌÈ_İSÿ‡ôú/ïµÿ“úıíïèc”»(Ä¾‡†<çñ<ìÍ&xó¦Ÿê¹üÅzîÛOû}‘{vå\'Û…°?Õ—åïë8Òş?Ê{QjöfX•E©a÷²¥(óêZúáù8y¹yIÏ…b£ÿxË°ıÃ¹8IY¼I…ÑÑşùÔ¿.tŸg+M2ßÉäÊ´O\r~$4¾¾·Æ×ÄæwKå-ƒ5ôûC,å÷\'d‡ë¾èÒ7M>›¥È‡í%L®¾ëî/¿]Gx]Ç·iıœùÚêÖËç!ÀÉ·)òë ~|şf†”í?#~ïúE·æŸÈWûº—C\'?õöÓ©Úëòo©íŸ›(œ²ì«*Ş³]ÿ1ô\rşSu=²µ‘eÑõÇëàmw<ë®±ãÆû4bïÓˆß3Ö[»ÿø¶İ÷3û¢¼8®¢²¯4¿§÷¾~şÕiû‹M&Fì|Š{ÿïÕãAé+¼ú€wºıüp¨ıï˜n?wÜÇcÓG¤Ìˆs54şbz%·}=)ºŸwà_í?şw0× ¼n>ó‡ÛxƒÈ@¿^ÿüÀc>9ŞÏT¢µ×3£\'Îğ47lÕGìã÷O\nëvxtkÁñ_‡ÿ~#şk‚(4I½Uœ(\n²\"(¾€tÆ@b®ï_¯;öm•·\n®0aw<„+nBé+ˆìçÊä½Öïdù²ß$WİÅı=¬Ä³Äºõ ±÷(Ã??TÜ×\rö€¡ú0Ø°;\\ï_ï|á¹å˜ÌhôñßŸlå¹Ut[‰¿Wìã·7´¨o÷IàˆğßíÊ/oU~a¶w|ÏŸ¨õ’~+œÈ±Jg\0î\rì†bi›ÿÖ¦~é9åÁ@{WcÎím;¿ãÏ®[»ûU0¼Ã„¾ ¯Ëşlıo¦û¸™…a_Í,èŞôû¸˜|‹<şe“ñŞïÃ™ßãê¼\Zñ1ø¶kß†0Œh†?šAƒËèw‹{İşÆ›ñˆõ»tÿtÙkÀş‘ôáİ å>^:vpe×7>¥Š ¸ß?áÉó\'5ıc_~iì»ş½éÑ?mq½nëó¨?À¾ê&ù~¿Ò½m•ß”~;EqÃç^Ñ¢W•ù`ı—Çk;¥DC˜ùâğo«ú?[ÀÏ“ı6‡~ù‹Üü=/ÛFy“áÇ¹2¨¯ŸI÷¿×Ì/·_şx“Ÿ¶Êu×ÿxÂ¹C¿B_ÿ;\'ÿuù+¢fØê$K‘ùæÍİÖèy(ÿıÓVœ,í­‡›‘ş$>şúÔın$‘ÿc“şöÉÈ7scqößÀ‰²\'o®M$÷ã‡—ùfİOĞËÆøW»3úâöİÂmÿÄŞĞcâá˜¢şB÷ÿåuıãs0èQ”‘?e½ŸÓ[ôÆˆ}ñÉ’x³2ĞÇzn!µwEõfY¼Ü´ÕÛ£¼òŸ7SãÁş¬Ï»íñ|ªùéİgsãáXş÷Ü¹	…Ÿëâ·¡şÓM­ªø#­Ê+ôı£ß=ºÛÃã=z÷	oıMËW€÷õ(÷ËŞñìşòøÅ‹u€ş×xïÊ/o>ÕC¬ìÛR÷Ï”şøt²÷eä<–…=»óÈÇwşßÿ',1454486317,NULL),(4,'KfK8e6XQsQaP','phabricator:celerity:/res/phabricator/8bdb2835/rsrc/css/font/font-aleo.c-7fvq7wpxrde1','deflate','­’Knƒ0\0÷=E¥,RSó­,šå	’ƒ‘1MPÕ»(eÅDağÃš±¬9qYê‡¿Æ¯K!ÚÄú(­ã0ºb‘ŸuÂ¤È~µn&¥TÇZ¥I£Ä(¬Iu¦Š´T$ó3ŸaF‰ê¶¼iT%ˆšô~xzì+Jm?Œô¾+7ûéyzxV½·ğÒq2Ì²ÂR·ZöË¬’†œqßóL”WÉ¹7g~,bŸ…®®©aI°Ä˜1ä	_ëY¼V\rşwIAÅq\Z¡‰¢şÌwÓjNÖm°ìï“qc~‚„\0½=¾r\\…y#@­4¹öˆ,£ĞppíÆÿ¬÷•™ú4Æ$[ã¤¡‹4 ¦Š{ûô zã-S¢ã`¹Ò',1454486317,NULL),(5,'u3PGH4Dj8lX1','phabricator:celerity:/res/phabricator/3010e992/rsrc/externals/javelin/co-ILq98pGCN3DS','deflate','…VÛnã6}ÏW8~0%Ø«î¾ÆáE Z,Š\0‹\0®aĞÑ¡I•¢ìfı{‡CÒ—XÎ>ÍÃ9‡C&«FåVh•¤­X%;¡\n½ËÒÖpÛ5íö*ÚvÓ-3W¥–…PÏ‹ŞğÚic«\r{áxóßÎš(¶á˜øáiæäù!ïi\Zo¥³ù4zÒ£Êú|³ª©Ë„™çfÃ•­Ói7í²•õq\r‡<.l²Ri»Ò&q;‚~\nqÛ›^rõlK0Ç¡2VUò5Q”“>ÿ™óôÂ® Eİô¬7D¨Ú2)IÚc[ò’m…6½ÆøI(aÁ! ´XÜİ_,èéçÛÛgDMjVğ‚®˜¬9*´r*×q÷µaµåfÁ·ĞK_|´­--tmÎ¢p/¹ûó„`õ‚E–2)nèõµÍÀrï=\0µ¶Cí;ˆv%³i{^Œ­¸ä£5ÌæzC-$~ù˜¿F£(e†³â5m}r&ÃÏ—™ö·á=_’DšŒÇBøøÖÒ#Ç‹©5¯h³¼¶2ûZñi—Cyeò_ÚæZY¡`ı6pí¡\Z¢#¥¤ĞÜIÛ=K]¼FÉÉw&\nJ€mk g¬~½†ê×ë[|,|½vüöºÙz=O€Äİ¾s…¨+,jqìñ;ƒÇ-uˆdµÉŞŞPá/A•^›¹ªÍ¥È_n¾Lêf¹öæK—FŞ3ƒßoÖ\Z±l,ïU&¤`–}Ú4µÍY£„“”B‡¾@kp?_¾3éx…lGueÔ;¾b„Šz”°õófz*Ä¥Ü®Ï¹>\ZísÀÉräö·åšçè¬«$ía›çùådş\0~—¿Á®ëÜ©âŠ-%¿•ïâÄugq˜i‹\'‰ŞqFë™sš{Şt{üÎÎpÚ^0$.~r~Â\'.#”íøsu”×Z–—èvHyĞ%D+2¾ÒÑgAì–ïcMgùE&¤XÊ(æ%SÏÏ9^ø+À_× ntSs˜™*ÊzËÍ^n‚wSùÿà(T…–Âè\nÿØ3,qN–œmyCºÊÁ\rÿV7y	ÜØø±ÑÛ½«\"Š9S9—ğå§Ÿn×ıÃö0B<‘È\n´µpå¢äö’\"°á’Ğ7ìÃ`]ÊÆ„°¨ãn9ğ\0È*èD)\n-ºòëôùg¿€<×:?_qXÅ1û¾ª“Q{Æ÷Äİ6“w1áVvÉ}%{’\\(ôW²WŞ_!t\0x\"~ {r£¥ŒíŒ½hu€\"º\0P¹g2ˆƒØ…ãåğhµ#Ì¬ã²Bãkot=?îÇ©ëOºá\'\'1¡ˆE-6„ŠGºàîÏâGLÃK†ãzƒQîˆŞ _×s½\'pV!!?ÍÔçø<šdàú3’ŸÏr÷í¯ßáu:¼ûÈäèıØSS‹5.Ö\Zs<¥p›h¢D¬‰-Eíè¥ƒ!Ü•ä–ÓAKÆäâ*ƒa\\fË€gG7ÍÎw«İµDeÁ8(ø\nOCü:…VŒóÔ¢ Gİ˜8¯·ÿüRç „_‰‡9¼ñöp‚ëßğ®EwÈAôt¶KÁş?',1454486317,NULL),(6,'G_.240XDkwOI','phabricator:celerity:/res/phabricator/9cda225e/rsrc/css/phui/phui-fontki-hNxQ60x.0Uyr','raw','.diviner-document-section .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif;color:#000}.phui-document-view .phui-header-tall .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup h1.remarkup-header,.phui-document-view .phabricator-remarkup h2.remarkup-header,.phui-document-view .phabricator-remarkup h3.remarkup-header,.phui-document-view .phabricator-remarkup h4.remarkup-header,.phui-document-view .phabricator-remarkup h5.remarkup-header,.phui-document-view .phabricator-remarkup h6.remarkup-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup .remarkup-header{margin-bottom:8px}.phui-document-view .phabricator-remarkup h2.remarkup-header{padding:0 24px 8px 0;margin:32px 0 4px}',1454486317,NULL),(7,'51qBKx1XgkVQ','phabricator:celerity:/res/phabricator/a79eed25/core.pkg.js;-x8ytZLaTwmQn','deflate','íıiwG’0Œ~ï_ºûef\"å¥{\0•üÊ’<–Æ¶<–z™Cq0 P$K4‘Ïo¿±fFfe”Û=Ïœ{oŸ¶ˆÊ%2r‹ŒŒŒåõßºxYœ®§£U5›¶/ËårxVvn?¿+‹iyõ»—‹Ålá2ú˜1\ZN&åbp:-^cõ.÷«Ó¶ËéÜ–]_ÌıÒ¢›ÕùbvÕ*û›>‚xæ1˜|(G+F`Q÷O¡uü¨ªâ _UO¸@wRNÏVç°·×¹]tçëå¹Ô=ªªãN³(WëÅ´µĞ&şfz9¼9)KÀe¸€Ê\\\nUËg‹Åğ&ÌÿÆ~õì×1Ã–jı«_wwQsCLu­½á^Ì³Õlu3/»«ÙÛÕ¢šÑUŠ\";âµòqÆÍfóß\'ü\ZŒ—«œ~,£Î­ÜÅïªéï|²–<º8.4~»Ó|nå¤šm+ÓUy½Ê1!¿œ-`¥À¬/^şe0 ßØ™Ùéï°ÀN‘iÅ¬sKK¥	H©õäf=ºxš·ºİn§×Êö²g«Uy9_ÁX´V³n-g—åêœRÎ‡«VµlMg«Ö°¥à»Løûz2[¾4áíáâl}YNWËNw9©Feûq×(V\"Üd¸”îp>ŸÜP‰üH0<††«6îø•å%„Ã ¤òİİ€]åTY!Åè!PíáYaàRÚEy³,d½ào³²`Y$v\nÍ7eÉ¾¸¨m‡ÊÌépê—%ü†0H;Œ7b¼œMÊ»»(¡;™Ñ|Kòl^.†»»ö«;Ÿ-WD=:·aåâj÷üşpùQ=ÈiíoÊÉ²Ü†\nÊm gœ guä=E£şº%,%‡@¥VEÛAšWÕGØ‘˜,C^`ò8e‰ÃODjÊ	ÅépîÇ+årÉƒ¦ÅhW 2}¶İW@aãrÜZ”ĞÊb8…åEp¥3ÔşÆ5¶Z¬±-ƒÏ;\0ŸÎ®ÚZöa>“Ï§_àÌÛôåœvÊA*¾ÿŒV¨â‹İİ0ç(	ãğx?,upÜyòÕÁÁ]N0Q§Õâl/{?}?ıa¶Z¶f§<íÎ²Å0&7İÖ¿U“	Ğ…òò›¬Íï(X´‚ìÒT˜!äù‚5Ôi[P„±h¿®Jüe¶ŸÛ6xNb~»Ó=+WïªKø h§M—+ è~MBÙÁtxYæøãÃzzAıÖTÜº¯ÿRUO9Xû³lO+ìeŸÚ¹ZÜİ\\”R8&çÃ%Œâ¢oZ\'°¸ZR®u‹+$ë¶•rëûÑºı~ÖCü61‚ŠŞUµ:oqÁ‡@V7](ùÒËôãrö±lU«ÖlÑÂ³ê ¿*ŸO†Ëek\\ÁRÀ…@g@Û£Óü}]®tÕÓ`»v:¼GjóqÌL¦õÇ3Úë˜,û»ZUÃIõßeó‹éz2©q(µæ”YÙÛ«ªÎ-+jek9:<ÆŠºpx”ÓñîîÎë¿™„c<¿§p8Âß\nõÖdWU~ØİÿïïïWUš‘\"jw†ö´ Óóq9)Wåïâdú&”pMÀRÀ¸ø÷¸g!²äĞ:ƒò0BÃÕhv™ïî†ß]Z¶PĞU’ãç¡#V‘ÙÇ‚Ù±mÖÈfsu^MÊ6\"Ö^Ê£æw*/s]…ëßİ]–Ñj5Q&}„¶ÆÎÔhóhÕ;ÌŸU5ZÂ¯Ëòò¤\\à/lø!ë¾*)õ#2ğÛênh}Ñ™î¨ÅS3»íÆS ;1Û»€_é­ÈµZ\0èÛÔíÂÖQ¥ÿâ¥«Çuj¶Ø)ŠÛMx*¦B€o×”ø¯Öò|¶ŒVÑö‡#Ñgÿ—güxîì\r[ÚÏà¢\\®\'+Ë[I\\vƒj<Ù`\0üÒ`íµ÷öì†šÂ1ëõê…¼Ñ0Üİ™swÇGNGÖ%6’{F/â5˜¢LËEÁèõëX\"G\r0Š‚O¥»;şÂ#B†úI¶G}‡¾àîLÊÁ`/{JCúnQÁ€á+ºÀâ1éJ¢½³õ\nOO ÁåÕg-âÀ`ØÍYĞ\";ä8Kî ~èûuÌ\n\"Á’îÊŞèÜRq¼—Ødº›àPÑe©FÅ0çÕŠŠú²Ï&Ãßµ\nSß§öéWÁû²x´(m¥2éÒĞä†¾ Ï#ÌƒS¢Ë®6!.øàò@©ymaîqñQ™HL£kB:{$—âá}HO|îîn7Ñ“á²,`•ŸÏVíƒÜOÿ<‡bÏ!½İÙƒÉYŸÀ‚jòa‰0p\r×«n£MéCÔN(gg0\"Ù¶u\\ğàpO4ûÌgŸÙì€;Ñã—éªã¢¨Q¡µ´‚cÕ†ó®Øƒì!ÄË1Zij1¤”20¡për½\\Ñ=(¦™ÕÊÃÖö_¸z#¸HC©Ñp½$Nî·ÜÅZ0Æ´ˆº­¿îŸ%U‡ÒÃépróß\0s×ãÑ8ø=›–­S8ÙZC¼¯€\rÍƒ|¨+Ø~tğ !m¦DÆ°öPË×\nSÇ¡<L¤Ôè¶~a\rIˆïMäàtˆô›2¨00¢`Õ\ZÏJ¾Áólà­“Ôy¼Óêšê\\Â¡}ZAó((±æh8G4ğ\Z°–“FÇÑw—YpF®eÇËb82óDü–ˆ,‚\nEÆ\"—Ì-J‡Xßx©8Ë•p ¢“n´~3œÀ|9Z„s÷zøq¸-ªùŠçVdE\0\0æ \\”P&v´˜-—òÓd 3ípUy>‰Œü|VáÕ“ˆò\Z¦Æş²”Fº­wç¸Xqá\\Â­½5‚>¬¦05P»t…W›Ù\Z@ãTÃ%£õãğ¢$Š¤ãÁtçyyNXò1Æ´8<‚´O¦¼º<·€@ˆ“ &ªå€W\nî‡3¸¶ÊáèÜŸ„^/÷Áe6›ßà\ZCĞ4éÌdlÂ3ËQ&Uzfé\ZÓ3«œÂI¹ İpê&İhRww×dåª\nó­W	æ`«jŸéµòN¶,^)bàGZğX1w	EºvZ€©™®Š€Ù¹åÓh6˜k-¸œ~ü=ğ]\n®VR€ëÓï»;‘šÀ•T³=¨»;_ËI{OÛ¾¬aµµömÈ_9XyC\"1º[[õÊ³ …&ZïruøÔ5}Â1W8å~t,\n[ËñFH%Ö“{¢MË¸t?¨óáê|0 qÓÚœThY1…ĞåH…øqva˜$¤}5î%ã	“,¬ŒéŠ»uÔJX&TšCºˆcºHÃÑâ­JBp8çÂ\"KXZä õæBİ@ªÚYŞÊ:Ğ0mY\'Ùî‚øã•× ò¨ºÁ4w…ãN~üï²× c>ìl+æÑTKØ(áhçx‹9.ş‰ÃÎíşï\ZvÁ)1ì8¬¹¾ĞÃ\rXéXX5{)QÚöb¸\Z¶á¾s‚27|^ûÿàà7\rùÿÈ@ÿ–ÃËà7`ºı.¾Ê–(³ˆ\\]è™çõÆåi5EÆõ¦%µõ3€ûègœàårŒGÜU“Œ€ÈÂ¹¶œöŞÔYúà×’Mûñ@øBm\Zá„Â~4Ãß¾éïiIzb?>¹¥ûú¤K”o¾›~“DXÈ:\0ÿ=ÎÀı;\n0ÛÊ2g¹¯Ùé·\r–Nä\nöVŸN{‡]Í$¶O1[ÅQ¦Å³<fâÍÕôgYu@üŞ›SøU-•éæo]š¯–/4H^Í~˜ÁÎ)HÃŒfÇ(\r±¯\0íì%®Û,¿U!àír5›Ûw,~Í£ñ‡½÷ËğŠj´ù	_ôFxÔO¾]Ÿ\0òòÓE Ø‹áÙÁìîÖ’PnA@ášı²æ%P¨Ü	Å¹pÎŸ„Cøİ›äİ«+p^À-p=Y!BaŠÅçgÎiÀè¢šLz±ÜN€=jÇÙ·ór×…+oÚ¡¯@²}Om»Tª;\02}9œ-^?ŸËc`T©d^-©ÎÎWß®W«ÙôA\rªè¬ìüè¼(¾¸»[tO¨~Q<&?Í—ÃÉ³õ²|™š¸ŒÏg¼—Âİ­FYï0Ï.±ÖzîáŠ“¡H™<Aè¬ñvN¾VÇK”øulëJ€›Ãj#]NVòk´ZLä\'ÜÔO19†\n•Û\r\0¾/-:øŒÈ²SÖp Ò<DZ\\‡Œª¤¨ªZZÁGEtº™wÃÿ‡´WËúÑÛ)dÜcˆfMvë³‰Û\0êO°<ü3HÚ–€#î)nÅI:ĞéÚ“ §¹Jå‘¯pO·²Æ{·êeüØ“åÿÒËVÃ“,?<èe~á?şc/+—£,ÿ~LÊS r_@uX}ùPw;#Ë¿„Ú´ó¯¿xüÅcÎÇŸ_¸ôÇ¿øR!àÇWZy³±ï$·Y~=‹é´üF¥”Ô1ıB†¾wtœ/™öõhv”Ú¹ï)rïvC?^T\"yÀ„jùn¶ËÄÂæ„ÑÒ°/·L5êz>E´Á\";ÖMæægHh‡üß1?;‘¤9\\~}³ _TÛ°¸8±§V˜“éªäÓè‰2¯ĞÈ¢Á¿\\4mhş)*m6›ğDsË+¿uˆédL<!4Šƒóát<Ás¦XxLE©q/û<Ë4a˜T^—£ç¬CCe	ñ·\0_f™J~;™Á¶|Ì¯¦ãòºw3sÒÙ~ì­†\Zß9»»\"Ä¢È–|šÓë«Ó\nÃLNÒ\\óšqÈ¥ê„œV`)ğI‰²=ŠR,`yIµ‹ùyšyVQã6ì9ÖŒ«%¤Îá0¿¾A=ßéª‚Õ±”@×xü¢í%®¸.Š\rp£çÌ(†#´¤!â‹AmŒÜ%Wd ;ÅVêzq @ş¾®Àÿ“àprÓú¢åAµ^ÀM%ƒ—åÎ×o~ßd,â€.YcÛzÙ¦,VIq‡ú¯3@Ì\nĞˆtnéï7Z©„Z¼0ğ°ä‚GGô÷øØ8µÂ¨óâÊsq>]¹å¢¸hh65%Â3–I)mÀ<•şÁ•p\n\\`y^Iƒ;¼æa­¯§“Ùpœ	È\\Qîft+–½ÜÑçSù>ÂRÇôú¥HHV‘(çúòáôåÃ‡\'4¾/>’ÈãõáƒèW ­¥’j‡¦0‰Doªñ1Át\"Å±”®Æ¯Awˆ]\\<±÷ö.êR,ptqH«áYï÷ãÙˆ–÷}k4o}”·r.Õ:EB1™ÈM·µ&é5Ñ>ZÏQ}Ù1><×D†7`Â™[‘‘ú¬†c–À‘\"|K:İ¨ãà,À£S×eõŸèEÜå¼8G”RêYµƒ3hKU;8n%Áza™.b¥„YZÊø=_/PBûƒ¤Ç<º(ƒÊÒ5GÛQ-ÅkÉõ-=X#Í×ÖÄ^/–³…ËäÏıÃ¾¤å§wnkI]é¦s›Ø@=p|/hÖÍ±=qK…¼Œ•[ÒœÎÂ2¥ÄTåZ…n¢^Ã™!½¥,ËãÏ¾k€Óô³O{”Õ\\¡ê‹	bêC˜w—‹ÑËI‰ûäîS8›¸&úÔşv±©wDñŒS\ZÆy,†G™i#\'ßİÉd–­à‡ÛEéê2§nG¨8´S\'˜ğ{§íîòß õ‘¶u¶\'ÛŸ†—ÈUş0»Ò×ùœsıP+é”ZÕ˜¯Æ\n²\ZÄj\\¯Fh/«³j²,(µ3d4ö©@FG&—íÜJşCúh«v,lm/J‰`;Rœ;/áEª¾S	Ä°D5fÌ¤´v™³ Û’hdoÏ-1İeÜ’]$ö¤ƒSÖ*’@s¥®§@ŸVæNÈ<kœ­W¾äÉd½Èä<Eæw\07²â–~Z‹Uï¨9}£}¹K¾ù\\Ïùƒ®§&öûBXtş^¯ì\'Òù¦6ü÷ÆvĞã“9À±êÄàSü¨Ú1ì¶¨$Sƒ8UŠ×K†¼³‘>N­mŞxÌç-9£`´‰Q”PÜ×ÕW~Um¹¾)ê|·0utÌ7/˜ÍÕì<“^:.]îT¼÷)…¯÷DóÜ·»€¶í£¼à‚§}yı.^lH¶Ş&¨ox%Ó=åç,h\ZÍôÚéØ9Êö·Pâ7w¨ “@PÑß\"~N«ğı6:;\\nØ.6A	¹áÈèé¸Z¹~jÇĞ%öªäÓòt¸¯†7ÅáıÏ‘£Ål¶*àØÄ¿O\0:0{ø³s+µêÓQ›ÊAÁÎ7ş:Ğ#6s©ÿR…ÍÑ|z™âwwŠQ0\n”:ƒO…dCpD	ÇEÛ|ÜİtöûÁ¨h¹q/«i;•{w§)Ñİ„Ilp‚-Ó6&5\\÷Å1c/üFÄÄ£¶=íÓ§áSø\\¿U,z!¶Ç¹TéÉßMÀ<ÂÉ3[¬ü³Á0?	xÑçvæş‰ûÙf•Fi g—íÎşA÷+¯™¬ƒ*ÿuûàê¹_¬éÛ£5/Pï@AÌéÅ+ÎŠºewåXú·ã:	/ÇTÒ×½Ü¨00#úÄÏ7 ˆ¥˜Ö½½¦Õ.›F¶¯Œ¬cûwwkIB©éHb*}æC€ã<Y”Ã/®QîñÌ¾Y ù”®Ä3€«i¬İ]¢œ~SŸ!H…Éà¡ï‰°÷²¢ŠzOP\0æåZBâáóˆrÃå©Ã¸jò¨¸6:,ÚÙCi!Şû(iA¦âjQ‘ñ\\ Ëk˜0üPEJ,ëÈr?‚ãÜäø—}{~@è9¼HäÈÁÖ7E6	ğàhªz:uæ:ƒÊ•¹\ZIEzq8ûd^‘1‘Ò³|‹LªŸ\rºßãZ×.À<¸)àŸˆ­OŒ±‚n?™Î¦û%_]¬‰$‚q‚-X©\\¢Ûúuğ&ÕE9¹ÉQ¶ö>[”-¤\r8r…gİBä-z/!í?ÒÈdPKÖNßgh1ô±l	§îdgÂâ×:^\nğ„3†p\\	8.¸ìñÇŞº\noßœútJ~\nGò&Çÿ¬VĞÿß0ĞYÖQc}™ÓËÙ^áÆº¿!àË&à¹\\ëøÁ)¤@Xóœ}”\næàÿÚğ{JÅJÄ«!^2ÛMÃxô;zÏğSª£\n1ÿ>”óŒi˜¡q¾°Ú‘Â~(|5Gø`ïPlJğ¤ôyD¹Ç	\rí#?.qÈ¹ÈpÖ’£Å\r·PiY‘DšO\rA*ıİË:l]x5äÙš/Ê%M)³qÏÉğdrCâş%	şq.ğlÆIszF­“òÕáQûVÎ\0ÔÿX¡Aì	‚Ğ3¨ã§\nqĞ3²‡îú(Ÿt)\rRü=\"ÉYÓ´)hÊóì­…¢š{{ş¾E0ˆzÕwLú)ê“iW}Ûü¯!]Ø~†’GüØqZõ[{D\"iìZ@k—æj…šÛğ+ê¡ª¤ÿ¾)á«ZS@EN_æ².«Ë\nÍ€áåÚ8™~Ë{ebQR{…²*9¬ŞÙh¸*0ü\"™6Àéú7K`võõ¤„¡«fÆ–‡Ì§£\\Ì&M­-Sµ;Ğ_5Q*™8¾¤dÚTAsY£Ÿm„årİ±Æ‰­#wO0™dàñT5#åáœT“ÜÃ¶*O†®-Y=q‹®%’­Ÿ\r\'Ã³òşÖ…±¿×6#QZ8Şœ&Jdüè‘qRJ•L¥yV›Läv^¡ŒXüf´üÉåSa<£Îâ!S§y‰Öá-·²hW¤—šØõÆ3ÓJ«	—½İ¨2`µúVáX·,s‘qTD|[VØ ö]Tš(½İ|\nOXş5x|\'gû_oN-—æÓêlY °ÒíHª»ÅÆûÏØÍ4ì@ßŠ¶p„×ºc¶6°’Ÿ°-‘‰o›‚¶Ô ayóè³+ƒ$Î2=,MEÖ¥6^Úqkóïçf®çVM{Ù¡Åå).¹:P¯ÚBÏ6é>·›ä’ª¥›şH^â¨Å3;P¡>Ë/år¶^ŒJ«Ï2À\'rÜ‘¨š‚¿EqX—ÖeQ}a	 ĞÂè‹52µ½È×‹*×ÒÂèc\rÕGÀß¬€¿ÜD,ÙÍÄl½j+èüÀ»‰•©++\nZU¡öŸyEÍ°ã$E¥€N[	îÇ$½Å4/»uİ8Ò_²ˆxèHveÈ|©\0UL75ò 6¿s|¡u£ÔÁ®ÚaS€°mk{¾Ã˜DËî\"Ú-—Y§°çı/°¿}Ûvx9Q¡×A¢¨¦{ºtDRèFµç~¹åÓÓ’Ú3l¿Ô`zTX&…rp¢F/ íŒ³3«‡„}iONµ!VÈ¬øİPé„Vïµ^¿eËT|œÂ[§Ãj²fÛ¨\\#—‹äÅa>8+G¸Œ.F=¨À)İ,‚nø<Â±1õ¹Äâà6/GçÃéYkåQ_Ô¨(=ÑK\'e™Kvw§I¼Ø-	0¢·õ¾›ØD2ËooŞ\rÏğ·—¨‰,4Â(§ãççÕd,â&V\\bÆ‘:„Mó…²N0´¸ÌacMPÆuìÄyYÂ Ÿ/ÊSåœ¯<ø™É¨ÿª.`ÃDfÍ¾@Ú©Š:â$ÜÊhÀ¼ˆ–!¥¡­ø«)œ,Ài…„f>›LòÇ¤Ç@5uiìßÒoêô[JÌXr¶ì÷œP,êX×¬/iğ¹.Â°ÈIZ=½èÒÏŸèb§ß@~dàò\noàH:·ÜÄ‡Ø„¦\\µ¡šv§+pdf¨:·\"a>|ÈÙ\nŸ+`T&åp‘\\~b>ä­5wx$(j	Â‡ø¦3Ğ÷Ê8uš\r°û©ƒ3˜;²äxÆæ#PZ-ôìÓ¶%½ë7j¸¶>ÓÓe»V	uä7ÚH×Ò>³µKvÆØòFà¤>½`y7>ûû<]È÷sa,ñ¢H‰èægC*¶+?\r-÷`\"ûlŠZğ‘†|ƒÚ³â?<kßC%˜upË™y!\r!Ù\\tÑæ©AçE¨/‰n²P4¢ªJ¾vw)—zâ€†åÑ6Œ/Ú1Ü3Ù}xôÂtâÓğ7\'›tƒ|4>¨X2Ù‰XEû¸T—K4;ò‰ìÍİË«šä`t,ÛgYÊT;Ã1­™«ˆëBüñcI–gpšÂŸ%œøÇŸ²ğÅÕ3Zºğ÷´š¦hµcwá:zëq™;wI·ƒëóÅEy#úßèo‰Ö*ò½tŠùù\0 UèÀB¿IhôÆå\'>íÁT¾YTgÕôƒgm`ãÆÍÛß~üáûÕj.CêwóuàîÙeLcC·vöãòúrò¸‹uß½û™.Õ©U¡„Ùé*¨Hx?óËÛFŒq+^cF‘D˜ŒdªÕùs¸˜Á ÁV^¢^0ÕèÜ:¶Z$/{1»VS©¾ƒúÂl‚‰i%(ÖöåT$=Hõ:ôÀì—QÒl§¤	Î&G§­:\Zñhµ;=—‘˜~ƒzŸ?~+	lbû.I×K•–Ãk’üt{G6HÚ\"7|Ö$5\0› OÍ¨Ø#›uJoĞú­m¸¥­(¹C÷ —Wk2ta¦¬h“±ª®Ûdu°®¨•È,¾$ƒ\Z^—ä	¦%å\Z|Ò›‚Š#4~ƒ¶iœ)œË»:iÄ4o€cÒJ~?:›\Z³Ú(\'u	–Ã®—¢†SNÙ”òp•”¦á…äÖ¹ÎYÏÆÛé³ù€ê§¦Íùi†RŸß¼}—}ú$¡/X~†BÕ‚Ö¿¾|	ø®h(2˜æÃj±4/lä3#È÷è´êÃğz0€‰„ÓóXUnø‰.xHÉúÛ&¨ø²@@´‡)î%ÿ^¸Ãáz[.˜§Z š‰1ÛË†e:í Q†ˆ‰ç·¾BâTŒ\\&[7œ$¨¶W´ñ´÷ÂoPòAznğ³—íf½¿û=wæe7ŞDïe±TÇ¬6¼òç¦k/ùåÍ/ƒw¯~|ùæÏï:yv#›	é	IËØL8Ø‹ÌkÜ»ÃıKŒÉ½uì(Ê*N/wF–Ös=WDCZf%ƒğ=ìg˜óŒ¦«}T¤.}0T#z xt½uuµ\\ûåşz<æhFâ…¾iîïõqkÅ\'¦\'ÇÂæDÙj&Õ¼ù= …¦\ZeTB™VÜƒñm¹!)y‚nÅÇg3}yé8×²OYDƒ=Wù©äòÂœâËD>‚]/wŠâ`w7HzòøààîÎ¦<-¾88pû\0×xÛ¸h]d\\Ïµœ­‡O__Râó·¿|÷¯˜.†èŠ(÷ü×KQr@b·~ø¬·„Ë<¹ÒE¤Èg\\é,¾í1t=R-z»»	…À·Óv¿ßégÕÅúGqR‡)ŸŠ©Ï;tşI£³Ñ/§ÑçÂ¶1§ò\"’öÏ• \\Êyıuøµøp³£áúì½ñ	8|\rDı<ˆµ]rôáÚS²-w·=Eµ×’~ÖÔºb‘€F‘¨C‹U)_4°È…†(p•Ôµš®mBh’´gqÙ³³K¼d›•¦ÛÑÛ<z×Ú©Å×ù&‘\0¼{ù·wŞa\0¶Ô®_PäõÛ7?e¬D_Ïşòò‡W?eÆ¾¿‹%Ğ&`#„N\r\\\03ÑFŸˆ‚úÛİ‹7?şŒUÑÅN¾-Q¶‡¾ÍµX›ä¿gq«ß-f—\" €,×€ûn¦gÖ¸ïz-d»;\\ŞLGâG¿ñXíúôù›\Z–Sqˆjë·İ#²î>qˆW‘M•ÔÌz*k8MG³³)¹iÔ¶ÙÁ”ñÚ+ZÃÔ¼1åc¡c¼ƒ3U„2ôGÎÔ _¯–l8—È@Ì(¤/nın(	ããÅGD´QPZKâ¯ïâ†¤(=]vÚª6Ş`j?äÓÚdsM9…ã(Ä›o”ÜU†]Ğr×­ı3hKÁNÄ[²|K2ïD¦:O¦,³n$›WÚhøn¥ªFï˜ \'¾pFWš3Aq6±‰,•YÆjŸãŠş7V»›¦oÕå2#÷<5Å83TâÚ82:dx’ÆE.b¹Ï>º8>¥;}×µ¿V«s4ß}sú3Ş¨Â×{Ñ²ˆ9Qç¢ó/µAìÚÜr\\Tßn¢`\'‰²üctByß\\HsWïÃğc9©¦UŠ#Ä€_—S÷¸Jjk—¾9ğc}Ÿv­9§ëÁímBb¡¥Ìó„•Ó&l.œ˜ë˜‰´Ä­ÕAYä-­Mİ³§­;àÛÛÿ—ƒƒƒ<y­o\\uz½O„Ã\n¥ÅdJX-Â•J/]ªHUğu™ç0\ZĞÁéª¥ĞAE_Ü«®›KB)8uª½¬Èö¨ßhX€U}v™Ú¥è¨¹_ù)o\Z.ÒÎ\Zj÷ÑböE{ò¡Pî†`ìkó\rÃ=é‰ÂŠúèÀØIõÓ	R£¨cŒÏ«J¯àÈyAŠó)ƒ½WòÈ1œ¯€A’0MpÅDØœ¨¶§xTDéMê{SN—rìã–Â>ÄÄ(~yO‚¹ô.’Ì\n¤4wôXÚ‘/X†ÁYğ¡VÁ|qrrÏ¬¹ˆbw)¼0®çš¼Sıá/^íâ:¿	Ş û/%ê>RNàK°qNúY‹\0yF÷&\\†f ¤Õ4[¶¯õ ¿.Ú×…ÌÅ7øo¹]Xh+,E…nŠöMc!2¬u¯W×<Pò|µ¤Öb3\n~ÕC„.ú¿	¡G#ËzmjàÕTÎÿëüğ\0¸Ãù5ì,S{5›Kå›-•oLåú¡X]nAïª\Z¯Î=~ç%zôú‡Pö¡>ÙhÁ¦˜0ånn;·7Åu÷¦\rÿ^{ş8X]Œí^0Ç,‘¼Ùæ4ò”ö±*¯ü+äYrZÕnö9&D8RVGòœ™w®G§¡&‹aäàÊñ|RAæ/>R\"üêóKåhU4—6î—½Eÿ“9®·ŞÁ¦atqñtµ\'Á±ĞKĞßŞœÂBÉ) Ø¼ÿà¼øë£â=\näî®Îò\0%Ÿ&–¡…ßnhûI”¨ÀÑ‡€Üu—p±œL~\0|;¹+÷a¹ÿpåŞÍæ¹Ä_¥Ç¿7ğWB?Í¨#?³ósªoSú¢l\'ÍIu8\rL…İ]ûµã‘NfØÈ€²åLúx¢$÷7×{b¯Ä°Ö¾’şM˜uöıHĞ6\r@÷5\\d°BŒvz†˜`“ÉX–4Ï)7ıW$0¹IøH†\0|KèÆ2ä“-Öòi±€ ‰B}}ßİ˜á¿»+ÍW^_ò¾8Œ¦/MCK¸?;;[”gpéâN|7[„Îy|«QÈ@öòî.JŒºéÌšaU06}9Àµ`R	åƒ¾§DÖ×‰_ñ„ÿá/f²\0âe*¢`Ú¹%áM±ÃéâÒÒÆ_”êÆ&ï§2sÛˆÛİİHHƒ|ä¶¯?_H¿tË°ÿ()Arík‚m«Iÿ*ÑJãš¸»7J$Œ8Û}VŠÉ\'\"©º6N#o\"W‘ğõªººÀNåßî_’ÜıÕ²GcKDÌiwvœ™­Í„jÖ·7¯Æä=ÌÒ1=©Æ;EI‹Úer•ñ¢¸?´ßgèi/{Ÿ©ÉLºÑNøtÀ9Ah-\n*²Àsú&&‘ëå\ZïŠbI\ZbEª«}¤iã`,KÈQx “S/‡Ë¶ˆ¢1Û%B0£…îa$ƒ›\0	²8T³Bgİ“ê2ÇZd?#ãÖ”­í–€‘¨BÀÿîÇÒì8|Ó¨ÃßˆÿÁ:N\\È¯ ”rÉ·4ä*„³‡²Æe\'2R;ğûîÿíş~^a¿µ¤Éözäùæ©wi¢Ë[z,¦ÑthdİËÃ¾ÆĞœ\'›”g¬é¶\"hø‹›ÿÎf+r\r>Y_NùÇÙb†®o1¦±A©UÅÆ¤<Géê£š–«õé)	Ò)Ï^^ÏÛÙ¾¿üüI¶` wì;tÛyÿş}˜‹†?ûŒqãÑöà:ÎcMrŒ>ƒíM¹pÓ‡Mİív?û´áÒ×+8G°hët1<£õÚl=ª!²`º?–¨qƒ¡‚f­o~”%ûöÅt4™Ñƒô•ÁR¬jSŠ:XuWIÿœ\"F¡ÙhK÷¯C¢‹àxA÷¤(\nÊ[OHê)›?NfW¸¹`?Y-¢JĞšÉ§jë\0°°•8¬Å£\'¬ÎùşäÛ	è ›Béù¯Tş#÷Ì1ÚGK4(¦Š¦\r¸\"1-†ÿ}óÍNëÅ¬õÓ›w0t‘ÚÙÙÑN\\Á(®f‹èÃ®uÁÙÒ±Ùı:  °İÖ«—ä\ncüR‰Ñ7òİ\"›R%z•øL¨Q{×tw]ûNÖB|l_-pù,HìòS;W¸$\nC\0}(‚ÆØÇ”\0Œmo”?Ğá&Æ•=­ËYKtnİ\nµ6ZP\\Ni¦²\'Ğ\n%åbœ{éUI´Á.\"·¥¶BîÊD\ZöäĞ›8,Îµ8¬€‡‹‹õœ´ëàA¿W´­wäm¿ìÓ‡‚½dwh>-£â¡0åÙ“ï‹ğ˜\n™3ZÚ˜Îgİ~2e†g9¦¹,\0+pÒhÅNèjs±–·†¿»ÃïÔ¹È†£KôñuªèŞÁN	\\@îäÆVğgtHDÁ¢’\"Kà(&°\nHô0Îò²ìÓSã²lqÕ>\"Ï¯\n·ÛÀ¡…Hˆ¹c„°,ˆ$£%/ÊM¶\Zeø$ê=²˜×).äfÁ”\ná°Û…ƒï50ÎÚ?÷e ˜RçJ2}<AÑ–#qG`çE†Ï¾î.ÙùÅEyÓú}FÊÉâôÆù+ÑÇŸŸáÑô™fÈD/dÔê­ô–\\³ICJ\Z:Š9R‚úåVõkvÎ\r·[QSãqÑüm!¾ë[CZq¼yÖÓêïüP_P.¾V/`A©b}iÃ§x$\"—\Zv÷Áƒ/¸k¤¡,QÏÜ¬GÖQç·ÜøsW…ÜßJ.\rˆİ8›L²1_è|zt1LÉş\rûn?Á@v¿¢ï|\nÂœÿ–êƒè^’¢^µ¼ü™›=ÎMôş7ì^8ªO€µ;ÿèİ3j•^ºâ7õ/¡ÔÂ·äşF÷^^_1yÜÒV –0+*ìNíñM[w-åâOT]èK™‚”§i)£gÖÑ±FĞÓrŞ/iÒñ–©9>À™Œ†?D“L.ë¨ªJlàßŸÌ}Oá’7Rí„¢rG±’•\\?¦ÖtgæÁD\"ê/ÑÂõ“-pÉØİİQpBßQ¼Æp™GƒÃŞœ­B€0N-tÆ:‡_ŒoÎÑ‰uı“„²÷.V*+ *vnÜ£I!QÕBÜ\'Ş‘¼dqw×Éùd8â½œ³örp°äR Zğ’z™¤Q[ñĞi“µ1£îÓÊÕ	‰ãæV+{ocë4L†Ä½Ü`Ğ³·Õ	zºêÜºl§G—Éö£¾	§I+$lôaØ7“¤O}Ô5–õJ3ö¦Árß-Í4øÍÏ \\òáÒ}ùn–Ô·A9–èJ‹ÍeI\rF˜Ÿ‹„C5ƒbš¢0B?º¸04‰G—œ´n•mş¸Z¢``lË8²”$à\"Šrç¾Š®0rİb8®f½Ã|t^.Nf×½ÃÍînP‹r a&,íæç\\–§ğE¥p\'ÃÏòuıóU‰ÿò–Pwx†UQßôÙ//ŸAæÛ—?¼|ş\"æm©Ú äA\n‰½ÍµJ|œ³úÂé[¥&U½´©n\n™%áNlZ\\·6±	uòææT\\Ğ•^á¿ûÒÌ8¤(vvÌk—ó²/Òâ¢*C:\r!Iš8°.İ…ÚY¶× ‘¿ÀX/X*©ã…QëºdÔ–´¤óbUÈ‚Ç1ÍºkA¨>vRè¿F}ïyGúzá¤½zÁzÜÃQ\"_ÇÙ4P1©¶ø97a[8T\0úÒ†şjEe7Ls¬\Zøv‹C $z‰Å‘ò’tŞ§å_£YJ½dÈ(â]]´¨¼•!K‚»áO\Z.Iø±{ìšWÔœüg\rıU\'ïí[\r’¦}êqp\\ç´¾‡}$3xM{õ\"áğ³î¦#IdÕ‰3òŒo|è6qÏ-Në„wÈTòµ·‚=	<]3Ç‹i¸­P)¤¼j<†KË|w—?èŞßtCŠµš–4Şpò-H\rí@I¼“Ãáÿíl†Ê‚X\Z@ïeäÿR]U:†\0øˆ¢M¾mEAğ­û¾\r³î²´d<6 ÈØúREPÉs¥PjĞp„5ŠğÓó\\æY¡ıŸwïß/;6íozv÷‡ÌãYÖÉ	s˜¡KVF´àAÒÒüá§këÑî£³<Û^Îû™IıŒRÿ¾­‚ä\'”<	ŸRâ&¢ºÒùì*mVU Á´@âpf†+pYD6b)4ã\nÑ$J]µÖU‰oÀ»b=‰qê\ZM)Ü²“áM‘e4ÌU]†ûOè(6ó­£ST³ÅÎ\"£ó£ˆ†Â\r?_–k¸OáêÌ¯­²¸H’Lñ¸;UI>|à¥®ì)ê¼÷§ÀbÈÍá@šËõƒ§õàş-Ñ68Æ…Õ£»ş¦}ÍJn=˜çºLŠ#°¨No8f+XáÖï÷SÜON­GO Ë# #kÔX3GÑ\nñ¶¬¿-ppÛ,‡‚÷Mbœs‡2\n±QÛd\0ôWáTü¼,vúÎ (2\"x\Zµ”g„E_ö–ëÉ*u³˜š§\náFX4’ö¾Í~¡Ô7ƒµiÍ5‡6çÃŸVV¾ó\r1m?9›ÌæOsà;7¡Ÿ9ÿëŸ}òÈË`Ù‰L`?,ÉX¤}<²r=¿YUWŸ„<–béÛûMZK)Gp+ä“‰&ñÙI NGçh\\õ)sÉu’³IĞÿ‰SÊM[	‹»™‘ò£ê”Íx+0òdÕÂùÚa–òî#oõM#tÇøØ„n (\"›bÑ8BœY˜Qš\\Šr¨RÛ›²+fŒQ—e¶˜ëÕm\'³É ‚|6¦Âş2“æ–ŒŸ+ÄLUfEÌ²{)|Q=.ìKIa«óëoºEKùb ±’Ñ{ÒLé*ÎgÑÉ¨ŠôÈS‚E*sCõ.)Æy‘7i×–“S!2¤\0ŸfhĞ~8H0\nÅu?‰Ú´7jÄJš!šìv‰o¶¼1è’·\"[\"—«tx=â´í×£0Ö]ÍùY›\'8Òf7Vw.xLà§]Õ©Üc8Y“B1„º»ëmyjf\'Hm^Œ]²xKwŠçÚ(¦¡Ì]Ì! ÜÎö°Ê^Öaöp©N\r³Åé:6®°_ÛA2UåÃ}¶¦“À@š¼‰Şİño¤lú›îÎ‘=¥yù¾èA’Õ\rü¥ƒ}w—~ÍÄ§õÇ\ZÙ¡½–3\\‚,k„–Kd`\"Y}@ù‡×bnzè×Ç’âjY‚ˆÇêÜ›x¶æ \\dÀ‚e\Zş\ZTúš`qP}Ü1˜Gí¶†Ú&Ã§)€ïŞ££÷ïßöşúà`ÿıõáéûë?Â9}¿>8áß¯1ÿ|	ÿşñ\02ÿxò%ıûÕûõãƒƒÑ>ı9Åÿ‰>ÓÇ×ôñ5|œ–§øïé)&ÁŸÓc`É\0²w›½?®°*İûıD5¾÷Sú‰:{ïOéç)ş\\ĞOTâûŒ~}†‰ïé\'üá~E÷c;pĞå.\\ VGHb&°È\nÍÃ±ò7Ùgt­v\\T2wßR\0u6\0®…¿q¬k/*—ìµI$Y€Õ#b„0õèÒ‰U¡›k ]íëe{—İÑùpñ¨Õ³UûÀx)<üºÓé.É³åş—O¯şğg¯WC>CC-ç0T/€ä@½\0ŠüŒ^¤ÓŞ£ö7½öÑöŞ?úæ÷Ç{^ç”a<zÿÈ%~Ş”^ûıøóNçÈ>úOM|ø›*ı¾İÅ_òXmşûº\\Ü¤Ì6ÉúvÉGñ@e£ä=¶¤H¶jğw»ÕÜRKwú\nZ<†Ö‹¢Åß^› }ãÌ1{Yf¥ H`˜9.GHÜjCq^Ğ]}ŞïáS|¹û ‘#Ø»¬ãü…iËö-ü:G±ş\Z­uÍ”v1B\Z¯…C±F3eïîÉôÅØÑ zœ.ô3š»K‘/Â\"üZ7uÉş’Õrÿ½Ğ´¯$÷N,Y_74è¢uâ^¡}´øQö\r¦õàÇş Á¡–vwéOK­Ûı{Êbµ,¸ŒÄ\"ÚMÄÜ¥b)KáÅª <¿ƒ_Ş1pğò5¯JŠ×‰%¤­BŞâÈ®˜óñşCÜŠ\ZÓ€xÅsq¡‡Y–…ÄµÂNézà…Èq‹(UMSë¡°e¶5„Ë\nê¹	ÊÉ²Ä|âløÏ¿{&Uã‚†J¸«:¦•ij\rÇcƒ´!Ìîâµwv¯“c‘º!§/ãa4n*‰):Ç5„1/(¶6eqcC¬1eü=;Ißº‘mu8Ïé0ıx„ÿœÂ?_œà÷—ğÏW˜øU	ÿ|Ÿ¤œ?ÂmN–ï^¼Àšğ÷åwøç»ïøşÇ|ùGşó\'LùÕ×ü‡K|Áøëğ»ãL|ğy*HÛ{#.*O8X¥Êì\\\\Tò*yùWß˜UğŸh.Îê£Çâjìg´œĞ“\Zj\'ïkø3/ïÿ·PD:T]s_Ò#ş6á6¹lzşLùxäøâQÄ}{2¶ƒd,Nßİ±±e¹EŠ3RÖo}öè3	9¥Ö1Õ² Z¤Î±«(ZÜÒ\'ø>sĞz9]®QB=½QC\0oDä¨m§5)‡ã%¶àì­ÏsİÑ1ÄhyÀ,õ`r=*È–±uÁø\\5r¤\"°;3\"(Œèİ¯ßÀ8âÑİ÷%ºïİÔ™–¼†’¶ö{ßšU_Ò€Œ¤¬ùÌ‡\nINÍ[¥ĞàwÔIS+G©¨—ßWŠÒoXü³çÙÒ¬×HØª.8Îf©åè×’#DáZo;Äu |¹I’‹OŒı„TŸDí8‡è:½à÷7QÆG©ßÀÿ:[\\œNfWÍş·Óáà øÀ\rg1¶¸P í\'ßXAùÉìlÍ{ÅÌCg\'-Ò:#k	©gt­¿oÇ1‘óçÆx÷®»ì^®O.«UvlÌâá×èCá\0¶è Õ:Buês~Q–óA9åš_«ráÃÙZ\'¬W¼şpTÅùzµÄ¥¶ËéäYˆD@îÛè8‘6!ŸQ‘¬“×sNÖ«F%Kdá‹Ö&™ä˜+ã6k\nœ)!‰ºÏğ\n;—ğlâÃs¯>ªİ\ZR\r+#U\ZJpµ§ß-š´·¤¶x¡µÅÄip2{Á1påkN«\rxĞ@¹S|Ìú(¼#;Ú6,mY£?TSºb’Ün5ŠçA¡@¸=8Í¡müãpyÁ¯ÉD(`—·\r¯^W`Íæ1My©ê ¼ÍÈúd¶,¿gOıB¯O†gè-MÊ\0åª4»at;zÆ¶e#Scßf´ĞĞ×+ï\0ãsî£ªf¾=›‡Ô8	8ô£½*\\nzÉ>\\ïëPíëÖ3qº¹ĞjxÖÓÌøäĞÀ«.—¿º¹Ò–Üœ9qI?Hó`0B­ØÉ`€Ú¿&G£ñâÙñšÉ¸A}â™É¢õ11­ezÂ:¶0àË›éê¼DÒK¹fäƒQ/M¿=ÂidÉ³RpzPcc#œÎ¶r\rq3÷Í–ï–—\\ªWqëãj¬Í¼åóŠ¦ÑUjäœÖâÃÎ$£MÉÈ±¥ü¦›,ö4Nªtä3ÜÇH/)Ù‘š8³àÒŞû1÷$G\"	ç««ª½Ez®Q{`¶¼¤°å(¸»“¢ê–²ÓtĞYÜ%ÿømÿxt©ÎdÙßzDÎ<›GLá$Û!¼ñwi|l³!œ\0ÿÃÄü`w‘æIß ½eŠ´ÆÚê‡.Q™ÿúsÛçc9³–\0\0dÑå­ öì´T«Ñ³ö¤Vwû•ĞÍ´}Ò=Ÿ©Ö¢š£7ÑE–¥Èáq~d	à1‰ô£¬ôz|Ø<o•ÆÈîÉjp\"2«”XU\\ô·ëj)q‘au\"[#z}”gGÎc2Å(i»„ûÿ^·äíİ›ıq÷¦óèq\'?<8‡dmHºÖ½†ô=Z0¹O/äğÁK©=úZÒgG1M\0;}Ïšº¶ª°›)~Ô³&	vªéMñ=Uu~óöÕ»Wy9xõÓw¯~zõî?DMAÙqçvNËéş\n÷lÖEW·Á /F„hŞ½y‚è`4V@\n>ûÒ¶ecáFB‰Î&„G”İâ :›ÎxHmâ×Zt9ÆOÉÎ@GnŸ’Íi“ÚÎ…ª9iO×¼KXCñ¹;s,E.Æ`\"W¨S±²P±\n©±ƒVii•%ÊM…ŒÒ±ñ¨³„ÚÑ44VòNñ!$õ§“ 	VxdÄ¬}OÙ4QıÆ¼‹M±%Î»üwtÄ\'2Ş“_§B˜û]	eÙı£)FÇ…	ı±h:Ğ¢p®œ„8!PÍÃ„á\0¦Â\\$­¿Y4íñå#ß_»Q€âêÉüuÒ/«8Še\"ğWj=š1³ <Ğ¦Ã}æPCÿ+Ã )¯ñÛÆAz˜ÛcûÈ÷¿Ô#qøè!aÛ˜\'\Z™ëá½>Aé·:mòE¥?Çw f`ätw½,ƒ9)—øR=œ—rKáµ‡2õáäßÊôaAìSî*÷\\v>…ß&%iJëó!ÔÊSó!<„>u+%Rİ=†YĞ|LŸÅa=/’tg°^H;·Óë«*¢ÃÙÄaï›×uë™ì¢¼Á¨¾\"w}Ğ”³$ÆÊHQè¼ä;	â\0½\\©7\0¦IWì\r ĞüÇ’bxeÅvßåî—è‘&\"©…ÙÛ…ê‘aém\\û%!Nêƒş{³÷õpQòOÃñ‡õ’ºeúàd1V,d²Óæ\0A§ùqO;n;És»­õ¦a	™‡#÷\'øôaa}Fw®¼jš+§ÕgæÛ5luüHæµò¹ˆüj…Seól­ÅÄ]A HDŞÄü!»KÉşÏ‡‹ñ|V‰…/°°JÎ]Fá~iä.XÈ_’æ¹Û†‡§7†Ş=WŠç>«,,3g¡†G¢ß0à}Ï¾‘j÷EA®œÄ¹)<™¬ñ¹\0¨Äœ#Cy‚!H3å¨ó<|L±ƒÜ-×Ó£ìrDÄLş½\r,ğŒThë•šJšx{6²WbOÜ­–¿ Wªo‰ÔúÈh£óPÄvJ#‡¬(Ó	V¸(4HOL3•\"©º°©Hï cö,\'[ÃŸ §oÉ; êÌâBmŒÈüÈ—[/ò­S+Ÿ¬9$ñUÑO°ÆW%ÍçıCùå-¤t>›ŒËÅ_ªeEüa-G±òº2aY%V<\'\\\r+|¯ú!ÄˆBVDiêÇ?L®]CÎ—¶f‹`bN02iÛM·«•í¤§·Ÿf-_ÒVgë>M?\'—è‚Îç³÷»É„4ÇÇ9íyš[Ï¡Jù³¼vÇsˆ2^*¯¢ínpa_Â”îzŠ\Z?\\—œ¸*š\0%ø¢Ø™ˆ3ã)ñù›$ğÂà¤l…Iİ…0ë»Ùâ&U$J)BÛ¨\\\n.î®hÜ•\\-“‚‰—‹¿rW”\r¬ñnæg€/ùñd™†E™$±b…[VÍ+¤·¡Ù;‘`ëJŒÔWbfC©R¦ïHJ#‚¦Ÿ^şë³@ĞÔx’0õÒ	g{hElŞ)RÁUcbÅëu¹#·~I¶ì5*¥ßÃ(u7ıÄ˜(lJš,;œŒ™ÈEau(í)†úvdr;·¾vs)bÛ#(cõgN#A8È&1 Ş@â=3¥¾°t»»üH¼~|Êìnàº#–|›Ç)j p2f=h¬‰9¤F¹²R|h\Zsã´oãWj¤üµ+œNùrp]`šıªÒ™[¯¾Ë ½‡ÙØ3òìºu1H\\Ot‡s\nsK¹$×QØSŞÆe%ìt~\n£ØØhšº‘`†D7z¸çhŠòÅt”]ı%iäoÒ‚¾ûçÊóÕ^¥JÔvOŠ	nÓµì$æcwù=bbµ:®?:\0Ûd–ÆŞXÂLDKM,ÿwTªø¬Æåá.Uø\0ö ŸvlXìˆ>ÑwrQ7nŠZå™°|~líBŸ&Æ(p;’û¬š3Ò-DÇâ4…é©AhÇÎ%Ë¶™£ö-ÉC‚Õ3Ö>sàúààíS›‡Û©àÚLØí¶ŞäÁ-qŠÕ³¬o7¬~: ¬·Ô%Ôzé{‚P¨³—„RG/m†›‹àÒT\Z°2µñ½!G;.ƒÓ–‚á’rª©	•›Tb˜ïŸÜO9@•ÿB#k¶.ÓsÉô•ƒ„•\"V-$È°t™õOiÑÔ‰ßµƒ3\'˜¦ä5‚ÄÕ^õÄŠ^IEnw·Ş^İ;·Ë«\nŸâ.PÄ;f=ÏzüE™\0òÖ¹µj6|\"<jåS ŞP¬”HÑ3IÔÒm*£úd\Zi´İ»Û\\\rO²{piŠ¤Ú\\¼ÒR{D¦„a g\nŸ›	K¬5ä÷7F1Ù¦Ã^Ğü:é{·ˆ$ü‰×¥!K©…;–Ë¶KãYĞ]ùSÃ¢Âm~R¿ŒÒf6­¦Oä¬«\ZéEÁ9Íè‡·¦Z‰ô£mMnÓÎr|w·S+œÀOê´¿v¼øHu;Ai”à‚\\[mİÜÚ½ä¹—öşqcŞDåŒ!ßgª*ÍO´]×ĞvwïŸf‹K~õ²SMİîß=d†“ÒøÉööqGï»ùûG¿ßùÃÿóş?wßŞïİnŠÁı47Í¬g££ı÷Gïß·ßwÅ ÎçµöjIÿù~ùùü÷†³¥koI–Cët\0k††@²_f³‹õÜ}/Q|©£Ó¶R0ŸÜu#¥¼Cy=š¬Çå«Kò[îeE¤2^˜Š9d‘ïÑÁş’c0Ï$b×’=ˆ>Z¯«Ëõ%ß(ÏÖ@å¾Ê—³Å*xî<­puÙ¤@x:¼Ré(\rˆ|ø©’£H6IòÁ0-’öŞT“ÂÛ·<¹|/w’›ZBêTÁ…3+À$+õ¯ Şb^‡½ÁÕ†M2¡&Ù`€ˆ¡Å¹Ã¹Î#qîÛX¤ë2‰­~>\'XÚ†5M_ê$\ZyÁÊÍ‚Ÿè£j|¬´M í\0DO?A\0¼2#ba*LÅ;¿¦Qw[8V3yªÚg»ân5F5×ÿà<ğ¦*·xWéæºUÉüa64è\"Šö…Z/ß#gBÓu½Cñ8ïqv5s>üH!‘üîn½Ï°ı÷Y¿ª1ÿ…¶ßg$&Ÿ	Fï3Q§r=;âŞèy‚õÃ)oÌ?ÆG§Ñ¼»ÜİaûÒşøPô?|x²òšn>Øç\0^4èšæÍÕôgÆú¦½:úğáØIÊ¸Ì%“%I\"Ÿpeâ>še*Á%FieÌ\\pèè`Uãè^ƒDë-\'6µ¦èäÍ%>šƒBA8a\\ªi1\'©‘ë2HN>—e9ÕßDŸaÑvJ^ÿĞí¶·nöed¢dgÜ›šgÉ[u‘º·½qUşÑÇG­¬u¢7u3œUMİ‘Ü‹ÃÊÇÎÁ¼µ3œ¼Uµ¿ŸvúŞšQi¡a„Ò½Ğæpºáô{•W‡\'³%ğ¶gvûÀÙ«ğİ“H’lÓ\Zh™$Xªòë((¢$8íĞ6{R‹8¬VÛ?“pÿøeS‹	®hE+éH‹z©,\ry²Ó®õ+	i¨£¨Ûf­›öÚÉdÀ·wÈÁ”É­gµZÖt¿LMv¥a aä•—º×Î…ÊtâÂ½2ƒòl\n¤X( »ËŠÍ=9½“KŞx]Š¤(JÈsQí<¤Î\0‘…PH¦\ZÑ°\Zr1m¡æÕ=\r˜¸­´\"©Û”wÒ+2,EL¨€ªQ#FÃÅéL¸õÅïÆ`]¬‰2Üİ­Y,§‹’ñ‘3ÔAV\"»ÎIùœ —m*HhcS·¢Iç(Y^ìh0İr	?\0\rKOJcè·µÆŞzN¶¡©|t	ä1aÄOhÑB3Måõñìôif„èäf:ÁÒtèW2æÑ#‰{f‰6/#;×şşXcçÛ#¿ì¾¼\0/.LáDŒõù¥ÅH7#Zj¨Ÿ:ßÂs×WˆıhóüŸÚøw+šaµç¸\rÉP§‹šÍÄÑ™-Ê	Uã<ÔÔ‘êRÒT¯©È>o¿¤¶tÍ®#a­r=E£šh÷MÕh®@ša«E¤Ãxtl­ÊÅ)È£÷ËGgâ[&fY®—\"YsuæE9íèàØ±£>ÙRù:<FU>o¶\\€†A\rÇ¥¿	kñSêwä&÷5	6u8ì‹=jº“¸¿B•ED®èëé/^¿&qùñ/ÛB×‡cÕ\'¶¬œc‹¼¨ÌÁ.Ìó^Èk²ô+u©J*ßk×÷ÃÙ”–¾(Å‹n{ö¯/ßeÎ8«½ß×^%#äÃ¨%£2â5UGÈuÛ=êÖ+,Øq‚Q[÷Œ\\5Í˜ÇÕ=¥·¬µ7Óååpú?³ÔX`\n·ª\\!ËX¬ê|7ı¢¤‹İã¯òáúºšTCHÂi¹µ†tÁ\Z•UIßÚFã’ÂÉÒèfÕiy0¨$0uæŒFèç)Œá•´Ù#‰?‘˜VS«;€ƒµê³*,±§¸Îö÷Eñ”8k)Äè`â ‡eWÇ€lGAµõy?½ùøº4Äl¨Hh#A¶ì¿<\ZGáÕÂ±’!·Pİ<\'Øü<¸•Ñâh³O¶Ü´n¬ØÏËi­mòÃ¢zã±_	>¦ÔzíÛl¤6lËûIzf;ğ·ï¹^ôÔÈÊ%¦XÔy?Ë€¹gÄû‰3F[‰Ùæ!;#µ-˜|İ?Û7O¢	k°Hñ¾8¬¦ÌÌY¡¾K,‚¯PÛ•¤—¡˜wRá2Ñæ	ç—C$¨‹ÙÕ²T#}Ì%Ô8Ø«kZ5H½.,yÕß¤‘ 6Â‹êL~:¶M¿i8(j!ı\\Úô‡*³s¾–åß±ÎˆU«­éÅÖôV	ãéi»Ó¬´ô-w¹Ê¾<˜¨ÒMCPm¹“¢è„¨OE¬ÿêêõ×ÖŸ—ekÉƒ¢bŠ†“âŸ¦5¤P¤NmBîá<~’=dò<S&v±ª¾ó<y¥C*\n/nôm×‚mŒF{DrÖ›7ÍP•,ğkëßìQªi’(;ÏÎ‡Ë}^ÌY¾ãT}¾ÕåİnPP—Úbôm0RXI•wÎìÈÍÙh%¬«É˜4CMw»–Òˆrıë­•ıD$kËğc}Šö]!TNŒ@FßÀö«ğ;$(á\0Šù‘›º‚¨ôs„9lÉò¡FZpRQSûT‰°‰\n»)«·½½c~gÈœ YL\\	:Ñxd³Nû‰V¾ğòÃ<i$¡\n‡@!»^.©*ÛFŒhc[´Üœ­à&Z˜åQûõÅÍÚ§ø\"ëO\r!7C^ŒÖ‹ålQ­º*:Q“ø´\Z¬MÙW=\"ED¥ú|X%gû~Ş±eÄVô:d–çÖ¤é¿ñ<_WÖô3îİ E®oô®ËçC BÛ¾ÈÉ3ãq§!\\,\r{`ÜC#İ»em³ìd¶:Ï6£\':xF„ÍœX¡ÓÉ:Ö¤×MŞó¤i§(¡)#Ú„¾X¨áÑ¶Yşı“µõÒ³g‚ÔÍ†#g>Áx‹RØ¢œ“×õ1˜3?Ÿ­\'ãïáôêÍô9+­¹mê‘UM–8&§]›“ú¬÷[”ÚÒİ¦LÂ5ô{ß0˜b6šÛbÑt7@J¿¯ÕMªFµñòåÚ¥·JoòàgôŠB¬§¡ {eBõ+\"uí7=T%¥]\'¸Z\'Ğ€‚+s Yé{ÔĞKC•ı\0¤[-éò|¾un›È]€L’ªåÁ:µL¤®	É<4œ*)å~”ë¸µF¨•Õw£ÖX”³­ŠTßáoÌğCtt…8}wwG:ªúº…©GXB\"mâWÙ“(< ÷¥œ²ò«{Ã¦&úy½W<şÒ}-Ù¶BÎ´@-œ;¥}IÁä/ñÆ¿RºùÓ.š±éqv,…ß|š#ÃÊYçšØuöLÌ/Ãry‡”–G±|Êm_ÑÊå`lÔ\\*’+o [‰/ËtÈÕ4×ù@ªSüàÎ\Z\"æ¬<‹]ï†/r™‰­s£«\r‡ld*ÇÈú\"×Ëf§§Yniãšo_ÇÑÜŒx÷¨4àˆ˜a†8ÎQ¶§J£åß÷ö(ÔÄFXJ\Z?ÜÒÁkgK/Œï&Ï0âÃø\Zé—_xŠ¿ù†«ÕbY4ÂeYaË‡ye´áw½àR#Ølí	\n%\Z(Ô=ÅıRV´EÃ<¨Ğ¹\r;e·İÊÎ\"”q˜g1€9Í¬U¯)ïŠ³ÖÈ;–]ÄRÖŸ·iÓ¶\'·ö´#»TuØã€Iş¼\0jzxÅ\ZÄ¿¯^z¾’»£Õ•ÒïîğgÌ}ÀÍãßüöëoD%½æHDTÔIÁš§˜wKíá”Âé‰Ëô—­UW\'M/Òß©öÃHIğ,$AEH¯Ğ)ƒá3•–@6ß£|¬”j;\'ÉC[ÏÈ~¨¨WäTkË9\\Q…ÎmàüãÁ„\"™â\0ğëT¨®•7éò¡üãø`IùŸŠªt9ÂT q	9mæ`ÑàW6êA‡A”ß °³¢œÛç˜Lg˜’çtWmäå{N€4`Öü‡Ùè‚[\'>e¥üèm6®ÊÆ‹ƒöåÄÓ\\£8lÊz\Z¬DG‘Ğ¥døª¬ÃÑB¯‰ıXõ° rÒnåå¸è‡F¢­à˜qyûÎ*M•ùÿ\'4¡wç•Š¯ü¹D¸ì^TÎa¢õÖf–pß9L7÷¯ÆEç\nÅn“ñÉçV´zÍëÀÅ…Ú×EÕsi¸ëËc[ÊÇdı,ô¯Ğ_Æ\ZªV$Ô#A)ät,¡±’uºJë<âÔz£oÇƒ4Ú]^î@â;+rˆ¤ëS5z¨ù¾Z®f(ğf/^~÷ìÏ?¼ë½š¢ôæ&ÿùÏo¿ûîÙ»—½/òïŸ½ışù÷Ï~ú×—½ÇùÏo~øáÕOÿÚ;D— pí^10¤\\–H;ªå%KãF^¤ù5gö€ª`ˆ¢$ª†ëk!BsµCF>oÍ¦“›–¤ÁÇˆC1&¡Éû½Ã¡p¿ÈIVQa¯|Ràia\n¸QÚİÍğñÆ³øwç\\€°vÍûæR ú!¦n<mat?ö-œã÷ÁE`¿â)[À%,	%\'GvXv\"/~^î§_ĞÑÙ\'^Nè+ûÕ|@W=”$²êƒĞ}ÀØòZí“Ğè&PºvĞüñË3È»¤®İæø&;^¦ ¼‘r;¹tI-çE]åç-ç«w•tÚs¿OäQ·lØÛ¢H®u{—}ÈÚö†»%rì	JrK|MXNãjÁæŞÚŞ&°bˆŠYQşÌ.ÿ\'F·FE5!Æ>•±SBì¶!_|¡›¾µkÓ¨°<Ş¶‰Ì‚î”ve>ƒ©\n¦ïS33©’„QBÆùWO‰\ZÇıÌÊyØ(ßƒÆÍî\0ä¸^“ñhÑBFQîŞ%%³ØG×=èbs& T€¸%¬íÚtë ÇÈù±­Z»ûÏ£óĞ‘¬¾ø…_•E»Üİä]Yv¿v/Q³A¾İ÷m™ÚYUß“…[Ú	[\":v§Ğfm\\,8ø&`¯Ád²{Á|Kñìšh&µÅ0{ô/	mã½Wh‘Œ’ÒaÈšÅ9&ñ©#\\_¼‚\n¥d®#\'¬†wwñ_\r_vˆÕ²Û÷ÿìp$Fwrg.!ª –·7ÊI~45×Š~N.Î;ÌSõÿ³¥ş†åœÑİ47ix©ğëïë.”¨äí5¸(Í¸)D?>Ù±QÀ¢rw`\'¹¤E:^_åœëïpâx9h‘ÏW—Z±HûQ®:\nˆ<U{óoåM$¸O;}â†Ó.Ÿ(l\04I‹¢şàJÅ#_wëÁkS¼smşèG’6\\²œÿ´„/üür	”êr}‰¥¤Ø®/))¹ÅáÁÁ0M:Yãkeî§òÚ^[\nÒVÃRªb¨xªóï`ÆNôÆ«tãk´Ÿ«y§E”RaÂ?×:ÙÒË=H¯ÈÁR‘%ºe©üæÕÈíìï‡`ÙmP£q4weP–¢\n°&¡ï§Ğ—zÊ#tãZ¥3uQÍpå/«ögÉc–|Š(tn	MscŠÌÜJöÒ7&â“©ºï<ÃË™$DA^³SørÑuuèôŠ­y~÷\'M\\6MÒÉíD­\Zí×ŞI}w0…©zõF1RÇ7\"æçdhz¸‡äN$î™¡Œ±\Zûza\nèG5î\')$´zOk,FtÂ©âNödÌNÊóáÇ\nU;‡óóÅlºÚ?.«‘Uâ²ú¾§Õ™Ê²«	]Ú~†Cxb^qÉºHŠöÉI9äÀÚÂ?ÎdwadYê:=‹U±øò\ZÙ.PW°]\\X9CıÛÂ•ÈÒ³G)¤%á$Ddu™5µ©ism’â\rÄcº@î~Ñâ	~’ w\n´aŸ_š|ˆPFÜ’8)F)°	N:B—C Ğu»éó¯#ã®ìX}—™@U*3ÃiÕ\"İ’©¶ÄB¾1)¿:rQ«R@Æî8V‘|}Ÿ\nˆPºèn@,ÈVow—è(¥CjxvØy¶ÔºkYÆ¾œylsÕÔíÆ¥1¬÷œI³¡Şs¬÷M!ğÑËÎ´YÇ<D4oKZäA%ÔŒE¤:áAƒƒS®iLšˆ\r\"²/ÏXû³é¾®úã4ğö¥šû3dò‰Ø‡\'Ş“lÓèÛ@Xy|M=B+ä¶pæÇçægéåyuJÓM+Ái!YÚ€?]ü¦ã!G&ñµçn¼È=ew·ñ	½L®yü¹‡z8eïûÈ?àoSİ£Ps‰(åy`â\0’¡ñ¥œG·\r\ZaÄ–eå>Rõ‰ÂR6îârÕA4İØ±Q7<ş©ÔÂ¿Ğ6¾âR\rû”«Úu´âùdJ’( µ®]õ«ªY¯Ü“\n?ğ´©ÒS‘¸/¿EU\ZA\\Îh[ëÊÑÕ–môM68™§Óº:Õô`Y„h&7µÉnÚakÆ†60Mİ<‹†8˜`IŒ¦15}¦¤>y¢çu*ª\na)dr3aµ´§¿…|2.ÆoÏg‹Õh½úq8İw‡_Ja²†i LbÑ:AËtî!n[!`‘f\0ëù=Õ×sòFÕtû x|VîİNÊÓUï0_Tgçøw=GÿF¨t¸¹ç’Ò0ÂÑ­åŞRzi(Şkî…¼tóiØ~A\Z<‘‘Ç1L£#Z[Lk–\"9Ñ\Z/J –ÕëÔ”.Æg}-„·S8ØaX‰›º¥YŠ\nñ\nğ ùØ7ßTÒ`ØîlübU\\\'ĞŸ!sE’/Sn@®×Öù³³³Ey|6Ç“æ#ë\Z©¯‰Á|¶¬ª>ä\\ÌPÓ?KôÓlëtoö\"º7û_“UÍæ›iˆtÎ†äåx0µ—hK /|g‡¸¯À\\ÈaùwÁàP…3h³¾îîğ_\Z‹y8vèâİÔòv*°\néÏş—ùş—.îæ‚6l$®4ï^çğÏ\r¾]Ó‡U¸ĞŸò?uT½záæïÌ©\\~‡\ZZp´ÆI‹@éF& XLÛLIÛò.Öe ßfK$[Q¢§È±×¶å!cXvªéJÔuT³Ø7œW+ñ¹ê¾?E}ó>9r%k®ºj»Á‡ñ³8ræK²ÊLÌÓ<c7 ğ)ä8;®_‚~ÎĞ¢[ô­ˆŒ—®;5#êS#z\räN€/‹\nWó¤……Ä‡Âtb\"zÑys\r–fÊz}mrF-›F\\î¿Ò½›Í&«j¨‰\r°£NşÉËiÛjZÏ?ïÍŸqª\nÉ¯]‡îîø©©{\n7ÔççÃÅs¤4ñcâH2z²}ÓX^-ÊÄ8¶Ú\0ƒ¼ç¼âğOáûM–’zª­\0AØ-„¾”Äç-N\">Ê ŸˆXOgš£Äyµs‡r:`ır5.§,ò0É×J]ê*¬åÄ‰qàº\n:{p…ƒYËXñ²iİ†b¿%û+¯K7æçÃ“E5BZûîxu3Ö QÕ;™l{•AËW-…ÒR(­ór2oÁÂÊ–¤kÍ¡İ¬ßÀu¶³o2\ZÌ@§ÒØ{Ò°K\'\\\rÄjˆĞ¥ª($›$p<‡€Éë·o~ê²íQuzC³ŞÙô}#%Q–.vñÏ¿¼Ê% <Æ&XiÛLh8t0Nì#Ãvu%ğé$M,áœ¿zÁli‘ıkõ±ôƒMG.º+À1æ¢­“Ùõ¶~´m„5Ú!¢íRC£Ï¿œÖ§|òyWëGmá‰åŞşh¹8mXf²TÄEÚ—D/Y@hGÎ[²G“ÙY5}$¥e.nØ‚h×6Å9\"eúÀ…Û£‘;YŒ‰FÎ!x¤?ÔäOä…ÁaµhE·­ó÷bõ	mß1*üÁç_|şÕWü:À#àî«@®¦YMùc5…‰P®ŠÖ(ñ9Ñ‡Â¾ÆXöÅÂyü•Ğö”Ü%TÔê÷åpìŞVºçô•£}_@ŒrøEb\Zäåàd½¼á8¡ù¶‹ôÀdpâdG½@-?ÔØwp‡‹‚1£}?T~ºUƒ-ôS{à®c¢ÃúîØvİì½gN¾!á¿]R#–^œ\\UãÕy‘ÁÔÿ?YÊO€J\'<ÛN×ºNş)œÒ=‰(‘CÕ¸v|ËW2|hR¹=ØM–¯LÔ›|\\8fÏHÒ³Q øR(Ã¸š/\0¿vê	ph˜··\'n{×%9-Åº¶ÙlÍ6Œæçm,úˆ€t:{ŒîÆ<¹wTìˆ7-£EhÂ¬0^K[Æ‹OòíÎ±ˆŞhæQQÀ­6;³‹¿mÀ³—o!+~ªŒĞe-€ß\n[Zö„ìşş¯BÑ\\·±%Wè¶føœóÙ¢öÜr^OPhVı‘àÛ¨Hè\n¸¬šì<ã6öùòåÍU7\nŸ†Z6Û‹è&)l9-Ãì÷†;ğÎw®Œœ^ë¯ÆQ¬v\\×Çå)zg5`¨‚K&ëyW:8`°ªåCÅCzF£ƒº>T…µ\\õ£¿©acœ±ïÔ¯d\';Ã³a5µÔ[P¢YğIš3[Öä9’6÷\n¹ º²¶áŠTñ™±Œ1Æã—î)ı8‡–xJ‚\\³9ğ5;};)[·ÚU‹û \Z…Cg™·jÜñV:Ü;XñÕêçïÿüêo/à~ƒw¯Ëé:}·²‚=>Hê~|î§Bzí¦\rÒvæ¸Àpz³\rœ#Õ—Í\08ú·J<€ÌÏ×Õuw,£Óe®ª\"Å˜ÿ‡ŞÂ¸ËÔXè‡,‘¡ÃºÂÉ‰«7Ëg§§°ZÿÖ;_ÿÑ;°\"ù©÷4çõZ=ÊÍÑô#!—#ŞŞœx1ô©GÊ¢¯kVßN\0ƒ«‡$¦\\‹G¸ÉºU*áù´Pe!\Z‡pX5+5=*–Ä &Ü9¹øñ¡9‹ŸY\Z1b˜6†‘¸Ñ‰\\˜¡HÃÆIâ[s@}Ú×>í_ÒJYò$,Q #`ÔÄ€o¡À¼‘ªKgù,ítx-îº_ÔaÈ+Ì¥k…›\rY“ø¦4¥ÙË>c‘+[¨3Ÿ¼R×(Ø£»;÷¾0¬\n·U¦Ñõ‰lŒ¯ì5s´fâ¬±å_qGRĞK¾‰òÉgç^ßÜ… eP›1ò±Vk6¸L\\£5Âd‰™_Œ\\ZÁš¨`Ù vÖ¢\Zî—×ó!>1 „\ZŠ‹öÄ¤š^„·_\"ZS©ĞÑÁ±£\0|´¸d’Æá˜SoÜñ_ÑÁÀ ø=¤ò¤ŒïC6<m±¦ğÁÜºQËóšY|Û#s½fÊ2y†ÄÜ¹„`šŞÃ \0ø4vÏEĞÎşe÷\Zø9õf n´ìA>îŞ8WšªÍ¼áS¢İÉÃ”ÿ@“˜adY\"è–®É¹w\n\nSRİÁJ²ãĞ–$ÇòŒĞAGl©Ê«{jWåå’­ŒÎ+&ÊIèÏG®Wa|CÀW\0‡Ÿˆ)¹¯ÃÈ‡^@/°€ÏJÄÈi>ü3pêt0¼ UİGcÿ#ÂÆì\r=\ZÖw2„\'ñoÛÆVÆ5ÉEL½Ú\n¾—Mé²9½Ş¢cÙ“r¢t|À¢C_áü¶à?—ŞÍ¬	nà”qD_•ZœŞJ‘qÓ’§Æ‡rßëÍ¸VdpÙk’ ›t9ÈşÀıVLi\\P&ü(èß\0AªŸå¹À[7ºN¯BRœz…|úã@FAd¹k¥-`Ÿ !¨,E‘ú¸Ä<Ä?Éh\Zb}Wñ†_œ>×-\nùû) qv\rÍ¦Àïÿù”Åğ=ÆÔˆìÓGø]à?ÆîÇ}tCH†º—ÂpPG©^i(ğ¹Îq‚ØL*&6ıOÑœ<lÀnèÅêÆvHiÂİd¥úvDÜÂ>–å>5¯S,“1w±Jj¾ÃìX|z´²Î¦H CK`&¸K\"‘\0jºğúGhO‘LAÿs/k-Ê›,@”ø_4~ŞÖ‘Ğ Ãúm¸[Ãm±Ğ&,É¢`e85•¯ñá,i›)ô-3¥äzëL5Ï–²iKøİAZCøC;îv9Ì~ŸßÁ›\nÛëú=%ºgôõ\rğ±=Ïx–¡¯Zß•ØÅõ\'Ê4Ü´é°(öú}ÿ´iÉpÚ455mšwïõ.M(YBøùùªúoó8¢\"&}öp&åµFxÃŸ(‘—¢¡¥ük6‡°íÏ²=,º—}Öéµ(6ê„­«á²5­Œ“v2€×>B÷ÁE0\r˜:Ö§åe0³ùMMüßWË\"{¿~|pğ-©Ğrğz`1æ$&‹ÿDƒÙåG:½ªÅ§~„Yê‰=À\'l´é!MŠ\n®h‘ÈF³A¨\\¸B¥²„ÒĞúwßzT™EıÂó]X\\ğ£KNÉŞœ¶a€:E±)ë±\"±v€«†wÃjW){¯Æ>pÓª=•Rñğ¥Å¹”Ìq¸LÛd¹€ÂînUíÅAÇÄwDÄŠ{\0>P\nTİ;äY„±”gJï°\\ˆrLMKŒÎÄI5§7tŠ_“Ÿè¼@+£?ºA‘ÌcØ¾\\`ìùÌ×Ğáå§¦c-ú4Ö¥’áÌCéÁ/1ZËİ¹lN¹ŒR	¹‚ş”õèïKùûVşş5öç\'û\r:D\"\0Ù°õÙOŸµ€h.Ğl¿õÙKø(‡Ëş~¿—³5ed{FRıì¯v…†- Š­åzoÅ¼ıÕiŸSk­¦Æfí!‘|’ÑøìSÁl“İ_JéÀä€,S›Îq§Æ0l«çlrßy&å7ÉËá5‰Œ\nš´½l~MäIæ\\½vÇRx\05Ë‹lµ°ò}O´ú¨âd¸o/‡‹•{2áUCËH´`gK•LU1-®å×_\\ıÖ¼áhŸ(à-Ëæ6Eõ]+TË7Ó·@Ã€üB=.g?Ö\nàâÓå%Æó(ÇoŒ3¾Nÿ“ÙØÒ({âŞ8ÎÿÏŒdÀ°ûÆDÄHŞ3B€ä3§õL?}/‡¿é­=)È?Ä+ôÎÒ½Şo·§ğï¸{İyô¸“À³nö§İJ6Ş=_ÆPö ~ª.¿ÙG©”7PŞ~2.ĞÌÍŞW1œ¿Öà ”¯>ç!ãNr¼Ãä~É™y4Ó=JÊk¤‘ú<”ªˆ\Z\r‰‡×ƒëıiì^»”H¹”¹-€N˜=Š\\ŞsJÔåµTtü©‹‡î©êN]ÕÖäôB²ªcV=Ã¯îõ@çîN¾nàëÆ}]?%„}.}{G¢9ÆlØŠÿ?0–7O aç²åmæ}¦¸Á\\]—õÑÃö­ÃàIqEş*El•8}¨÷ÖøµQÊx»•ÆH`Íp£à¹pÍïë<‘µ7İšÍYPè¾ÚTä˜n”şF¤µÙ)_âìAå÷³=&Éê5~Ãğ—¹ğ¶f4x`ì±,m¶=åËàr’¼cĞs8´†Á‚ø÷\ZmÒ)R“²0I£JmÁÕâ!;>É½(?Vìa”‘\\./V³y©İ:kv\\WÌÊZœ:–w¡÷WcÆä¸±ø`wwøø€?iZîî`ıò7”ŒÍl±{‰%0Â7x¬»EùÀû5—Ì9¹X,L\'–SgÇê|±Ú8Á)ëóÙ£D˜[¤“H‰…	C>•-è_r;H®k1HQ¼‹ÚEŒJ†±®NÎ¸…îŒÕ¦ÂO©vLªÑoæŠşÑÅq~AœÚEQxI³ÔeıVdãƒûqwÇ+Å¹B¸¼rş;Ğÿ]y9ŸŞŠ€ù¼XÏs«M¼’B4lßK	Òrué:F%°îdß{ÂHõpa6P˜½U‘Y®¨à±¬wsÿ	JØ-	Å@G†²‚\0\nX³WÖ¨\Z¾ŒöƒK¨¿ÒéR<gZGV‘Èª´Å$€}À,oŒ0ëÂ>fš’yÑĞ­+%ğõ›H~tn=lUÄoˆdë´Õ#•‡l©E\\+ûzxÍ±¡ÌUàçKä~—¾ .ÃN?„Æ`÷U9Ä:Yˆãçe\\Õ„§6Wšê½H»úªéÉñ’âp±¹Ü\"gƒùÆ …0–™q[ííøø)XÕ5êV6__Œ£|ÑÇä\nK¤\"X„ÁJ¢°&f®?	šCğg§Â´P›¼äd­M‰à*Q$$„‡²Q”dæÄ»ß&çÛ}\Zpã.ôd2[p´\rùE¯G\"Š’â¤øÏ)1ã\'z#-]N§ñÀ‘ê@MfèâÎ·ã-Ş¡¸K3ñÃf2HÍ¥/›Mº½ôşEMøÅ7à“ßp¸@Cíà?pdËø&MÜÁz(àÅ€ü „RCE”yŞ1âÈ0Çx&{³\Z‚é6Xh6\\S¢0„¤‹ßº :;]\nØ*Ó&¨bƒÛ…ålMV6ªí=à×\nÚêæÜÖv1[eÜ,3“t’iÂ­\'YÏıÜ(Óè¡šL|õôô0>—$R3rQùèrz†œW«¥ÚP\0p\Z$HĞTâ³µ9\r4_—6£5Ll¥ˆMf§[¸JÀ“ØÆ•T9ğuÅI¨¹ Ú½¢_›ƒÎm€ÿU¨Æ¢4O.|w(M‹YQ¶Ÿ+`;ØÌînPØi>ñU§É¦´GççĞ£óó¨Gçç¶G\n_=räÒ­óócwQ>í¾^nhÈqæ=…^ç©Ağ\Z«ì>á#&8B”şÍaoÿéëšµ/wÖ¬=Ä,ÛGIü¨‰ĞÜ)>Šz’KÒF¢¹·yŠÂŞ	abˆk\"OğÅ&İø\"él‚oÆ*H‚S	\'8³Xâ¶µá®b—s\Zoz3ÈlEå‹¶ sBku[yÑöhŞNZá$£ß¹u€hM¨ğŞp%Çauí«ÒRv|b“\ZÌ\\Ş‚8×8—•|’f†ÉxÈ­ÊÉx)‚j¡à¤£9îûÄÁº¢SEpp‰Ï\0æÖ@e3Ñ=îA[úÓ±×5àvü,m4ŸÂÄ”3\'ñ\0dxpğ•D€ç‚Ã—Çwwòóà8wı;îØn×ei9¯5¡İê[Ò#óí¨—DD\nô´õ¢Ò‚‡Çy5ÖÇÇŞ\'¦$}á“p\'iò¡ÚåğŒ·KÒ×Ç¤ˆÑ#.‚ñîñv­)Å¾:Î—\0qåq¤q	€“ãŞ\\\"à¶V_û”/°¤„ÍÓì/7ÈRç:ÖM\n£õ±ÎJ¬RîõcZVı¥•íaÆ&¡fÉâŸàqLI\Z]9àC`ÏgÕtÕûã×¢ˆ»qº÷Œ‰O[N¨qZ8iÊN»5ˆUàÌE9\ZNFë‰ñ¡ÜÜ‘gÕ€SìD3ö ´]ÒaOIô<0£ByüåÄİİà³;ü8¬&ôÌG»ÉÖ„Æ»×ÅÃÕy÷²:İ½Îƒl5wÇf½T.:İë\'EzÑ†œ+pN&TøòO>w~Jœ”)I¿LH;“ZŒı”EğÜ˜àşQŠBå÷¹±Üµ$­wRšá¾–tÀT“”{êéH™ŠN¤¹µ¦«±×H£xÙ®4Ø{É(ÒsÒ¯ºh]ñxódå±yŞ	œs4aÃÜÄ©¯ìÔö2Ü˜–O¸“Ğ!Ú.¿®YbÉ4MòÔ’¶p«ÙÙÙg©f§®×:J²”˜Ñ÷İµá¥É.)-„_ÍÖ£sõ ì\rÔå›D+a¶Š¥åqÕNÅ$Šùš;¯ºü¼¾`I\\wÑÉ©\0JcW\Z‰bÓäğ–µÙŒÿ&\n6ÏÙQÌ®÷‡«ÕptNz \r®´¨÷(‚\n/Öqêµq£ªnÑÉ­ˆsõrkr¶ÈvİcÙ°íog×pj›2Qjp>›¶¢QjÈµ×ä\0\\4/Î«±»İ¢|)zr$Áƒ#=¹X¬Ô•0Ûá ƒF@èÅšUwfÅ/1	Ä¸Ğ ±5ÎW‘Úåë»µ®ñûÆ±GqÈ].WÁoÚe¬‰kœ!pˆW\r¬`Qpß¨[z»ĞÇPL,\nƒ8õãtøyåÒİVœ\'h’Ã\0šË³ÀÉ2ï¤y€{j½Ô4ä^å¤Ä9Æ4|)4í#³ÅÎú–Í…o•ŞI®®jV­zE\\)\n[nQzërxCÊ’\'%\\pĞÏ\Z?ª,[³ÓÖp´Z\'-¿Ñ1ŒÅµébàkìcy¸XŒY1–(kíK¯Yº\Z†3s\r<ëi5ÎUt¤R\\®¯îB=_…ˆáÎ­¦0z\n(£$M=JP%o9•‡óå™çX_Jì\\µ|nÇ²ão…¯DDšˆ&íš¢‚Y\ZÉ½ì÷Ù&V4v€BmcJVÒuz†Ğ¥ò”,\Zd®¦¤²ëïÁWì‹ñU8iåhúÀ¹{kõ¼\\hrB¢ãõàÓQà¢­‰É¦#¸ƒ\Z»Ô{z‚À¶tÄÁùÄ÷öÄA÷á£ÖË·pQ\r\r’ˆsáıÕ5®ÎŒ·¶§ä*Ã\rŸí±”¬›íYrÑ	Ğ¶çÜ&o,²ß¿ûñ‡ûw—Ey‚ïbnÛ?¾oñúÖR|y¤˜í`/_€š?—¬t€Îx¸¸Ø¿„¤İÖx¶¡ËfI\Z#ÕµHz“Ó±E¿Rq#dw-@aº3‚Q„œsÔY(—{Ê\'Ö¯¯#w*m¹rŠOY£,ˆÿ·òæ ®|C/Tğş-\\fŞÃ7±À‘³p{\rÏú÷ÄHGÒV	H¡U³YGâl÷£ p:ÑŠ£1†DÅ’^¢¬}…›› ÍsbyÌPñ(X^´ÖE÷å×l\ZY[!_îyrÏo^:ê~»œäÊUOÒ}ˆ»İ/\'İóİi¥Ÿ\"`R}Œ\nËÒ?ÄõFrOl\r‘f!b{èúÔ9,ñ^°“b¹-L³EêÃdna‘˜©A$¤›¯Î{õH=V&€µH±Z¯øs•ÌUæ,ı4Qâépÿ¬. q9¯¦x~0tØ3,i<@Ğyò^tBF•D³}6ğ5ì Owİ@Ü‚1ÇèËıLf¡!v­£.¿û[-‹^F×Ö?ä`<D³o¥ñŞÑA~ĞıÓñ¦ã…`0pxg¨<ªöş¾©Rûp{×°G2Ô0t«áÙü–mƒTŒq}Î\'f* ¶@ˆ<Ê£‘‡ä´øq¿U-[ÃÖÎ¦I¹šM9X)«@âe\"14¶-Á—–\0ªOÇ>ª·­Ö¢8XC¤Xç!g\\9z\'×BZáË€šÏFåJ?lóšFµÅ~&Ş4€Èä™Ğ»Vœ~[(99n‚Š,Ô‰Zİ_ÊQ	×´o@¸à¬Y%ë/¸P\0B¹Ÿ‚ácÛ‰Ú\'åY5í¨»ü ÃM¡½ÂYaòtÅhıÜ?Åßí3 ·§l(Ó,µNJÖöì% ÓÃ&¹0ÿõÈÑ¾y(NëiŒUŸ3]¼ÍƒKÙdM‹3“^]ÛF”µîüæ#JË5—ƒöó[¼¥„¶ÛãªñÌ‘x¾²ëËYY|ÿ­×ú±\\.no©xÉ%uÏ»‰šê”+¨§ŒÔVÜs7¬J•¼ªÏ–ı‚¦Œ\\ïG®¦\ZÚ’‡Rªeš…Î×»¯Y<²†éƒ±’‘5&ƒC	\\\'9x|‘—d²¢¡ì‡/ÀrAJëÔªÀãf…À^ÎE7àíÌ%§k\\²F½êÅ§ˆV!ÿÌöŠPßNÈä›6Ós¢n0ä³^\Zf½÷ÛnÓDƒ¾b²Wø6İ>à5e{YÜ¥ë’ó(dniÚÿ->Üu‡:ÜÏG}ÙZºXy¤4 2:ÙiÑ\\ñc{´dBrÅ“_×<{{\n²	½¹[§4Ÿ9ÔòxÂ®ÆÎ3PA´İàm­9VèO³UuZ±3NŒb¨L…|Å\0ê9“Š€ëqj‘ÂÚ|¬–Åw<pED—–š=f·wˆ¡\'á›Ÿut£u\\ÑÁªZiŸ^%å\'‰ÔŒ/ „r8R¶g4\\<‚«Î§|²Ì‹¤9˜†´¥‰#Z*(ÄúÊjÛƒİ»»K…Æ‰Ì—SÖŠì¨¿; j…¢<èÛÊr.Ò å¤«Óóî4r\Z/¡.x§¸zô‰êË0õÓ®ølğRÉ4>cÔu–` ş=+õñÚD<?›‘û¬Ü»ÓèX·ÑS&­©›]¡ï–mvQ\rçuÉ’ÏSJB‹-S\Z¢à…\ZugB9ûph6ÿ’ 9´=Ğ%Ÿ©S÷Ùó«ü_Zğ£´L3a6™;wy‰Õ—]A9u0ïh7zOø©õé£ ë¿Ùvq5ºs~¤¹ñ«|Õ*ÕC›»%áb~ã¥úx*ó\'C5\\Ò¦cwØè².lfbÍi˜¼Ğ£§)‘Ü°¢. ÜOœßà(·%È5>ŞJüè^¼ë%¼¿{®‹%¶3›€ºEšö!e,)¢„m.¦Áa%ïkqú¦y¬ñ†Q6ô6ê]¿c…çd5ÒŒ™fŸ¸ª%(z˜„Ëj¹ÄUSÙÙbˆáB3bæ£s–ï÷Àkè©ÉÙ{GÇ±Q;\"[EÃL&?t\"ˆœÎĞYå5\0(ùìŸ¯8!Ù~`óµÀ?¶ÙX\'×f¢ò-jÍØ/Çâ1óõıÈŒÊvUå‡•¬÷)\Z—‡2\ZÈÍ•Q‹›+ÊÛ$Ãµ…;\0ªëZÄUê†ÍCÍìG<Úô¦?…jBˆ#.æq!û	pŒ${ØğejÑq§Î®ÖGí’kÎÉƒù¼D×Ì2”\'%õÙı(¡°|5Ç²¨AŒ«<–YŸ-Ûûj(nX#è²Z_‰“C†R±)›ç=¨*Á0£EÏ¿DaŞßgS¤Î­î¥:÷¡­uZrıÜçİĞ â…‚øŠí)¦½á$	‡‚¯7Û ÏÕöœ¶Ê2…}¹ÏÅÁtËPva#­Ã€XQÂN‘…ÑƒPÀúê”?â`IcSÔ\"Y¨P^ÿ±\Z¯‡“GY^õ,­fÜ5i°ÏY_aˆ*wE‡ßÑ#ÅÑj_~ªe;êµ‰Â{ûñW6DHMŒ#§+<}cr/}³©\\mENç/ŞĞ°¨—Ò—İ:£\"œè,ÑáİŞD°¥ïoh³1îx‹r9‡m!~úÕ%iÂ”®õU”–ş4õƒe3\nyÓğ,ú€Ù=‘\Z› ê|8-\'ûÌåJı[QÿPT‚Í$«>›¥*¬§éHoCntòE‚«¶Dèó¹óEu9\\Ü0ùøùûW/¨İ|!¾uåãÓéÓ•[ŒOæK²\\;|2];º.\0¦y¤®h(]gw7EÔTÓÚ½âŞÌ~F=‘qŞ\"–#¾qı.>r—á\Zk±?œ”¼làõ† ¸åädJáàz.‚\'tpm¸¸õq¹WÃÉì¬Çy9êaöš›ÜTqÍ‡ZŒ2†BT)øª<aQ FèSÛşà]¨Ïõm$¼˜Æuìs[m÷ı}\r“±„ªûÌ\05œB³Éxà]¤ğÎéBâ/ÒEÑu¾ª‚DWH­?{µ~s÷ÂòÚT\\>8«]!{ZÓR¨ÍŸ,‘Zz×iòD)cª/ï¦1Ølú¨ºía¡Æ	Ùr¶³@ycÇÔ0Dı-–DÓğ›è™á¸V0qßù9hà›~ÏÜILÛ<ì[şkl›­ µ­Ë­¾{/U¬õÈâraP]5­ß¼¤ÉQÜ¢‡³$i3ö²õbÒÎö¢:{Y`‰…(š¾Õ2;ç5EÅzçÖ±®Ğ\"æ‰¢î,ÕŒâıUq\0|Ub‚;ıRÁ=P±gÆŞF¬›7K¢ƒ9[¬œGó„ï=–ôˆÔÀÙ“ßfÖ—ó¬w˜1_f½Çy6_Ì>d½/r6/î}™Cïæ³¬÷U-o.O²Ş×÷›à?Èlø©şÿJÃy6{w~5Ü…–ãÇwwÿò/ÿ\"öğ‰ÒS¥É*ÉWr’0NŞçÔşolŸ°UwÔÆÌtÑC±;Dûï5\rw–áÜ+ÁÄ~ExAÉ¾i[ø¤½=ŞÕ¼h·(o£x—áòO;»»vÛ`ø4ğ\n–ş‚oê¾sËËÀJÀªjŸ”¼\"‡@÷ø%²Ôâ·ôCôãğºº\\_rîsì@äñä·C¯CŸRyğ†èh((sŸã_Ø‰ïÎgd„aCc2÷ºèš‡3ËùÑıåš¢¨;=Lƒ…çEíGîê„¶V¤©GtÑeòu€ò¿ç|e:~-ºhä;¹­ç¼âŸÍqYÊ%_úE÷<HzË1£ÙA\'ØÍPŠ#&8†¥±,Ê‘´’ßÄšRèôGjm§ Wê–‰§ Šn=!oŒoíü¦Ìİdúp«²e»‘0€ÅÛÑ©÷†®“\\…nóyŒ7_ê\Zfìğ^ËÀ]ÿÎuxdÙy€¬ş®óí%E…ÉÎ&³“áD¹7b‹Bc¤´ÇéùšzM¿ä}Ì%ÚúıU¾†b‰z\Z¹º`=åy²¡nÇÎ¾‘Ä7×Iæ }^‹]v~4ì¾i9/GtÙå‰êùIÁ4L!å¥a x\0Ô‡Ó\ZÏq5ÕfÉg0íTÚûtkšv‰kN¥YA?’nê¾ÁÕşgê	òöÎı-Uêùú&9‹e§k=jaGu“QP7Š‡Æf2\"> !şÓç\\í‹½`6,¬]táEJá½jÜ*ÎBáè›‹Ÿœ!@\')Ñ¦‡k¦3†ìÜº	/j´QÌO‘G®÷ñïJ8%F‚ì2Ë,¥\0K~i1Hûi‚,dIMØ(õfµÀ¼\0ÉÉ4ÜvĞ¤¨nJmg ™’´³-t*I´\r:oÓKè²²«\"<Ÿ^ƒk–B€ÓF=Cj\nÑ¥ı$ÖKb¿Il·\rU79*c\"ºm¤×ªMZ¿ÿ«”6AÇš¨òLô}wçÍáXp’i¢d\'ë„² ˜¤ì)A¶êœíN	ì™œ	è“•İÃg|éÑ7À»eŞÙ¶¥Yz{—§×¤›NO¾¡c¥G\"dQËco˜L‚ŠÜdn~Z£ò›¡Ë¢¬ÁU§œ{û\0 RÔ…ö3Oe\\>¾·ÒO¾tÖ=Ji`=Eæ“äğä…ø)e™zV\0Öş¢\\³˜VB.Õ×e‘»±&cÂwdğ–0Óâ°\'zc€uál-Ò[)_ò}Lû¶¨ûíUH ÊcëäÀüİOÍjŸ+šıİñ&–MãØô¬ÑÖøÆ}»ãï`Ñcé°Ù‚´wvwë|$\r€†Xf =X2Ù7Œ~W¨”Å$í*5´p\\^ÔƒáÀ\\ŞG×p¡k¤ç¾º#!Öó:Ø‹$FæÍm6zŒp9AVXÉ\n‚iÄN³Ë·ôRZ²:ùı}ãŠ“\'\'#_ş½@¾ñ£0?/=•²Fö‡jàU[+!l³`ÂçÜXØÄÏM‘ce’ÜÓ@,yÑöË§u§ˆIläör\'¨W-_±V9Ôså%:\Z\"àÂzÔ›ï0Q’º[¦\"ns#\\îÚêXÜì¶™õÏdb(z®$ù‡Ûx÷|\r÷”š0™JÏ™#9mGM…+9Êìº ÔqF©ri¼ô€ÚÄ}—ç—-w·Úzdï:î¾µ•£ñ«z/µ	 6ı½¯‚m:TŒˆ,ÑQ}5ºIFŠ\Z‡°AÁÚİëøljn&”ÍÚ>hÛ\\9I=—ïî¾~pÈ‡hjÁ©¦j¶^Nn\r|h¢b%Öãë\ZÜ1„øy$6_q<Ï„Æ@R\ZlI¶ƒÓŸwox1ZFTt—^T‘%`#²¥AAv½_`‘0Î‰k\r²k™‚^÷zo>ê^wl4vŸfÛÛ´Zäëşf®1·ü8Ø‰p‡n¥B·Ô>½Oá#|ú·†Ÿ=CHÍì=¸=ñ~7—Ø8õËÔ9€-nöE÷3ö:÷=gw½c·m¯±gÀ›­eMr \n›î¦²¼ªæ¨êmæü>1?L;U¼ÄÑÇµ¬&±Ï8Êb_ÑöOîç\"µŸïñ³Q©7ªÎ-†xí$ê?œ“g2]ì(ğ³‚+ºB¡:W‰ƒ8­¦0¬7p(ÎæœgõAëŠ®¾ƒ°ÍBoš¸’1şÚa2™çm{DN\ZKTm\nËIÍS[8§“4ße˜´7\rˆ‘b)/áÌ¯‹öüöèü\0÷,%İPÒ\r&İtÜ\Z*¸c¬—ÅãR)\Z_>¾îìµÇ7Ÿo:O‹¶-ô¹ıà@ªTîiÁÕÂ9pN9e©êúŞÉ–Uš˜k2¤ÒFg©™W r‡BeçŞÒÖFyJêm1/›<RÛp¡Ò9]Ïk3šP\\ÿ¶OÁ”ÚI\rNz\'X;®u+B‰ĞJkæ)­™oÔk\rË:Å_]hÈ	ìğdiW˜xMôæùü°7?ÌØû•3„ÿÙ˜‹ò­¥u!Û\Z¶Š•÷§ÃMŞñÈnq”¢’\'f6¡º(r@M•İÆ^©6ºPônİW5€Ëq*ğìE$×Å$õ‹X÷\r¨‚ù;LÑÇ@ëW²¯­m[©.$¤X¬‘œGpŸÌ÷2ü	×Qß_Äæ£­ˆN©%ÅÄ¸ì×©€yğN	ç\0}°F!İ$Kƒë‰ãDÉÈıqµWƒ“Ùj5»,ÚA½îÍ^„İÓ\"@A©\"FdÂ@|v¦cGEå™lv*›ùŠÕôt¦Qˆ#N·Öaåù[.Ó“¢¸rÅ¶ÇôÌdÁ@î~…‰ƒ’PÕW½»\nhí~ºgPøº:ƒ -¥5“n·Œé²ÛdméI\r¾Sügq7kŞ ÀmÇ6·GŠÚ(çuººÌy•¢ıR\rÇ.Í¦ºØó±]¸Rxw70“T`–1l7A~x€‡L’Õä^c#‘æN§Ä«r>\\ëÕ¶ÎfŠ)bÄH„NiJ5ï!ª¨äb‚{ÖêIÕ†g6óu7ÃÑÅ\'s_æz‹Ğ,§[ç·´=aÊ¤:lİ÷A­ıÑl¢’B´8º\'œ=>#æC|ó0½ŒÜ¥gâÎ§vÑâ[M÷:§b[ò/«)9jïnr×uÒ´Å%]SĞ+,ÕM™N[\rv0Ä¦²“h‘1Ïå|\rGÂ[T™tÖÇ]_	c×6áïŠ›|qp€o1°toÿps8K­w?Íi¶Y§2Šwí¦¶Ë‡e$ +]é‡%¼\0xñ„fS‰ß†Çr¥]Ğsë%uµ;VD¨bXö½Ïåè÷òÙmW‘º~wwÈ:W®Æ“2±õAÚ¾Úù<ˆáÃ{B­‚§Y·H.†¨•)²~XsöˆÓÜ\Z:.>rˆğ9\ne1Éõéû´¨š º¡…w4|0º%^a>´H[J\\¹ñDeÕ\r—SàÄ•ë°Yî˜·ab9™ç˜ÅQJIHÁ¸:=E	:†ÚÚ?­&åjQ–âï¼>.øN\06\Z¤®~•ºÅ¤İ×HÑ4_…F°VÃŒU¬u‘=‚,XëgËGÃñ‡õrõˆ†!qªh.–!Ké`fi«×v)ßö:F\'#0òâ±İ,ƒHÊí´B„®^·r¦İì‡y)µÓ‘õlÁ:67;­®ÑşÚf\nz$ÒZ:Hß!•UPàXrşîôıH$×Ó}QËr?¥ê=†‹’ƒ•îÃª©S†À¾òœØøƒ@Uïñ|¥V…³›À=ñ‡ÀùšBüõ1KØìr\\­—~4›’,:óÉ>ğİl°µöqÅÁà&.)~2ò®¶p¹¡ÏLm€£;,`ö‡ûÃ¹Û‡m•¥Ş9\\]œ]E\\0ãû§€‡RÙGxñco3Ísš lpÔdå—x7ªa`üÃ<J²±0ív˜·”ğª£ôŞÃE6?Ö§ÕşÓwãø[Œó ükÇÅEoÜ2\0üh‡e44º|Éû$ÚcÇfñ•_SñJCŒwêChš-¡€º\ZÂ¨[ñøkø»dLPº÷âáQ}ˆóÚTˆoë.:‚®’?¹—Á–ß´fÕ	H½$S_óI~™‹š\rĞ‘gôçU5Yz2¨€9RzïrOcv²Ûé){š+Ÿ™Ê¿`‘¶©æV|ÁœÀ\n—5®,™¸w©vfÁ\nÄKé\0Èûb°š\r&Õ´\\¶Gç(­ÉÇ¤“F®È¹\0ºe İ}8®ß£©ó)QAY¤:B5…ì)Œ|æëÚ ÷¨:>:8Ö\ZPş\nXúheä„Š£ó=şe½‹u?Ìª©b“JŞıåó†G½¢ç4ù¢—©®¶O“›c™Ø‡O*ñvçê\nœkrX·\'³É8ëÙ—}ş9	ÎîîàØkgX …gXÖ¡¬Àh\0T«á¤\ZE =² ¸ˆ™1”åeä\ZâXP-²#öè?ÏW«ùò›Ş£ª»BÆ\r‡êeH‹GG­çj/kİµ2vB•µİŠ©•Î©•?ÿòâ„•öÚ„2i}îiİOìÂ>_Ãÿ—íïål:ƒş¨ô÷_‰./WûëIÖf˜p^È4ñ¤o²Vë÷­¬öa‘âšÙº—TÎm¡ú%†×²8·Ûâû–T|¾É\0îû).ê=©.ŸŞ#<Šz²3ïî2ØqåptŞjÿñl\r—­?gëöı´Õºš-.—ÜÒ&€çôßO7™h>é@ş³Ha“›Ò{Ùı×½ŸfŠ\'|Õıûz¶*%ÎFOvùÃ†ìß±æ¸õæîƒ¶eÄÈû¯nú™ê±´g+ìe¸²ı2Ã7^»µ&/ËóıYÖS³0	§Øğèrlú£K¸û>ÎšyÄ-jZ¾^w0Xç<â\r˜ïy‡0t{ÚŸ7ú–Òd¶ï¯ç#,Ş*q6Û1²IPæøíİÃŞ&hsËéR/‰)CyÃŞBw¿¥ìûë8Ï«¦¸÷¥|¶Éù©¸_o€ğåbõm‰N¹ºÜÛ5W¶M‘rò4¢,äXAÑfóEêê~I;`rÅÏI?¸Ñ<i½ÔœˆDmÃ\'ğ’\"D3|¯g9—‹g—+‰Ï0Î‡TèC^]Óµ\0Yô‰éZ†rÑ«°§d4>Vîu¬\\+TíÔÌüØ ÖI8éŞ2… oq7õØîC^‚`ã{_y§(\"û˜äÔru]‰>®SÄ\rëğ¹ ¾]É´š®å#]İğû_	hvÃïiEHCÑÆS¦æûûÛ¥¸+²¥rB)-.•ç» ïZÈòr\n3tæ5¿Ö®«2‘hC;“Á–(ÈÛÉ.‚ª²¯©ğ#F/´	ht@¼ÈÓÕ.0¨sPÕMGè87`7mdŒ\Zçé—ö¼¾ãµ½,>Úhv¥ÿ„	È–\nğ-iS@¯Ô’Á„Ùı2J}9»PÈü°ÌáÌï•q,oÙêaû	·\\	>Š{5=Óó2_ öCGâ\0l2~·@”icgµâ~@OõV+£ãå¡‘CÈ­ıÏ‘ÚÈÃù?>;¹Dg8„pˆ\0¿ü£»/ú6‹\Z.8ÀKf:Öo‚gÖÏv€k•¸z»µ£…‹åçêºœ\0/§è±rÙ<SÉÁ\"‹ípxØˆó(,ÌÉõãƒƒµ±D÷±„ÁHÊé*vâQƒqYBÕÑRKARÀÒî3ßäGˆwÎè‘“åœZá8å¼ÌHàû=	æJ}ôÃ)h%F-j”™åÏ‰ÿ(TR,ò=ÃáXÇR;@_ßë\nd®¤)Õ½Ş+’øÎdßÙïfs\'ÀM·áoÒ<\"éRœgæ¤fÅ<’ëE@µn¯{Št©íï^ïİíä7¾äMPò&(yÓÙ%Œ ;tïìÖànê¾Ööò÷ï€™ÿ3³úÉ:ê7tN”òæÕÍS¨{ãQ¬¾ooV¥Äœá«C96I‹á\"Âş—8	Ğœ}aq’şõ)Å^ãØ¸˜6|ÄóïîêìŞ»·¶£óõôB#äTKôùp©~äáÌşs€³÷&ŸjKÂ%\\ô€ J[\\!/ãt­¶Ç ¹1ÿ*Bß¢H¿kú_\\\"T®¡´‚sÔ¢—¾ºÊ^ÈDÇ}•RˆœŞûşë-SKqW-¦6\'âï˜š“V£Õ{…‘‘jTô—ßÆÖë¸qXº‘çBmçÏo=Y¥<¦Æ	Ï(?Jfp+TùxpÒ\\\0ı0WãçR‰¦.‰qÔ¿„Åv²W7)EÏR¢$L¦-÷RXštç‰2Óz÷‹×ó\r\"íq;t©æTVky‘?u¬gˆTxZ‹WÂbTŒPÆòR|íã¥R·OyÕê›}—íiÒ«x™R5%çtkµ˜¡Ù$âGo’–Ît«å¬ùØÉ­“E&~ÉÏÄ€½sÜO÷ÔÛŞÊÍî>w‡Ô»„·C\nmÑI´Â—_#!Ú˜õ¶tS{ùİ°š ùÀ¶Y©b/±¹ßp\0}Uº¿»z øgÏ8	ö]ë3?ûÜŸ½ì³n·›=[ÛïÓÌlpÛâŒlíß¨9¼†tD%<µ@~ç^Üls¤×Ğ=ÛÏåbĞ»Û-»İÊà±ü–ò©…¹Fà={2àG]›îèÜÑº‰Ï¼İ¥îZ×™#-gc:+ÃÖk8á\ZD0€x¶‡•ï[XÆ¹Æ#$.IçjãÅáW@¨ÓÄ.<JÑ3Ô)Î|N`P;n/û2£NÜ¯DnY|Áş:‹$\"Wp€ìîîôiA‘#o§¬CnÛÓG¤½\n›~ô—èÕkYeÿúm–g?â?ÿ†ÿË“-µcSš¤eÂ·øs!e\"4!G°-ş%°§(ÁñŒî¨ùl:FódÏóv«å[¿Àßõ4r2A8”Wmo\Z«Z»Ğ\'IAa8ù7×\"KKÑs‰‡M/ÈªN]ëlh™Ê›šzVT½°¹+Û\ZÔa€ãåäZ÷ŒJ{Î.aùlT”¥şoP+àçÙ¤\ZİhşG—Â~}q¿;G“¹ÜUw-HE’B7’ñH|\\`o\'ùÒÍH¬‡™£ ·¯!7şãb×cÀ;Ñ„2Ya[V#‰ÆÙ¶Bø`2åR…R\n86áõgâ×`E/[±¢¿««j2ÑûáC±Šv†‹mîs\røé¡ÓÎc†üÔƒ—6â«_İ¶Eq°»»îT¹½-ª>†qeku!ƒïJäò‰-/Æé@>!ƒ>Öø¶ñÑËÜ@³¸aş}].n~FU×vvåX•5r”R×È\rÖr®§×³H¿rŞ`#¢ÆïrÀWóîAï¯¤Zw)ÁÚĞ¨:A¥šµ€¡u¡Í¸\0k!j)$ê…ı¸»c:¢âÇv—°`±=n£‹·ÆjäQJŞ6è¤E÷õ‡’ vÒé,U$²óêE´\0k$)(K7Ø;ƒ\r!µhæ)IPVÕ#vBÆœIAØn¬,â~Püe6[…aü¼œg0DidYÀ«ª„{ßŸ“ê\n£‡·GçÚÈ£,à_hƒDÏÈ„§QÊàÛ¡Tm\nğâ:Ò÷êE§]ê	W~æ°ü4®w(ò	Â\'Ñúo‚ƒÏ¥¨2YqÌ¾ÆFÄ×87h¸@èAT¢_œ\n&UQïæ8‡¶£fˆ[8ÂÇ ¬R\0JªÍ±¸4Éwî~™¹	ìä\"z=ÅŒ¢Ö«ğ…µ¡ö	š1·/·ÅÏq+ÏÏ‘—ÚZ::•Vşì#C}€záÍx°’êÁ7A‚Ãa±\\Q~ß:˜ MĞ~ÃÓ¸ÏœÖ3	¶XKnµŒÄéªá®ŒÀm¡%8~]óî5Ù„_ïM»×{œÛyÚFy÷Çî5LËuá>ö§(ø¦\"<M7PıRo45Ú@¤½½:§kp[u  ü–êîá¿¦ºËÙ\Zënâ)¹f5}“Œºÿ7¢¼_‹™^ÑõÇ¦ÈñÎSo~¤Dñ°«‰}Öä´+Ã]¶lBJxá{˜ÒV5_6ùG\"Àuÿ‘˜LDÅ	šS»ÏØ3Õ÷9ñ	¾ˆ¡Â-¾ÚË³Ü5‚Ã0•Û•ÄÃš\Z¾&²/	±yåTE!ŠuÄ$‹¿Ü$É±aTÉQÜİ\Zôf*[ÍÑµYŞË{¶ìÜŸÁñ¿‘´}iRæğ°	o·¸˜í0Ú¦ kiPÏ¯µÉÚsó íqAfëU+Á øÕID„%tˆ«·óTÀúÚ©jSÆ¸º¬Ó\\_ñ6•=¥¦Œde_ÆS]|&ü•¾‰M\n Û½yªUTœdG3®Ë\ZÏ×~¢(:zÜPÅ9şÒŠ¾Ùí\r¦¾­=€û0õÕ¯Ÿ°5VÅ,?¢æ8i†ÆõSgÕåáx|,H?×{Ğlğÿ±òÕ8Skª„û$À\Zş|6Á‹ g¿g\'¿”gå5©wÂ¯—×óvÖ>zÿ~||{˜±é eØ¦Pîİì{(gbš/òár0\\,†\"\ZÊÀmjƒ‚1Ğ,µÖÕ&:¢oq]ä‡ùc´êŸ{VŠná\ndÙ^jQòñşAÚ·¬^qø5ÆÓâûóÇv<I|´bô\r´ÓË~ŸíÁ_¹?S0uø¬÷÷?~|8m°ãWØñÇ›NÓï?ùúİì—³“m£MŒ†\" ;†1\\RğƒÃN8$\'•cŞ½¨ïÇÃoàkşëÁ9ŒKj$ ^ÿ´³=ø£ËÔ¾û›\rµ®~œô–[B#@LtM¼ÜÓê#¯è÷K.à\nº\nøB¶8.ßı­ë çX‡àt¾ì}u_\r¡§x¸ç.€ûW¹ÚšÓ–j¤}å\0×ŞşW3¹RNáÅ¿Ğ×¥üdıQ	 ©J\0\\À‡§n°ƒe“¥\"‰ÁàÅË¿ò˜*é«óÅìª…KÁ²¿W-â$—­ñ¬u3[·®†Ó<N+X:å7“\'¯×Qí4“áØÏ^ÖîHäe€ÿ×aµŠONSg†¿¯Ãíu‡‚’G˜x,fÊü¾”W³TÆ!±OF¸9Ô~s:,»}hçµ}¦¾üÍ\ZËj–s?)Wd•¯f5àz,7Oş;^ÉxEÃçôä›yğŞê¼4±ºñ‡ø^Ã€9|k÷şOeã±2°œ²şlÖ¶^Ÿ¦¤[¦)é_ğì£ÓÌ{º*Ç[Ô/#;Øx›JåB8:ø%B+ÿ‘oX=«™üfİ?€6¥ıhQz§ƒ]oq°º*Ëi\'7oMx[v¯eßÍñ9KRa¡L?ãK\Z àñĞeMÎfWO²î­Ö½²w¼^Ô\\¾¯öMiÚ$ºAüp„S­&‘ó‹¶/¬W?#õ Iq‹ÉÎ¢[ïÌ?ã`¡Ù—e”^µxT-ŸáiFÉş¿Â3“cƒU•+bVHˆ2—\\ÍT`I(‹OÎq9ûÍj¶OK×\n\nÏ‚ã«ÓvÃ™ÂT1O,ÿ [“Pp¸\ZygCĞÚ™°–	õbëâÙøıÙ|8ªV7VÀÂÁ»1.\r¨ áàŸ‘âoo$˜Ë:8RR‘\r\'pmÌ\"Û#\0ÌWğªdRÉ§\\|–Eû»&r/®>hq	¿’„,E$İ€ Ú´²´§C+…‘Ó0w_õ…™eßıÍ±\'ö–çÆ[éIO@|ƒìëqïè0?8¦pàçÕÙù•jë­R?É½ÆlQĞ¿wwÙïOOOÿ4gı‡¡BÏêŠ‹!Hg\\ïˆ€æ3ct3ÕC‡opjyÄVùI>ÊL¤5ú|õh¼w‚Ç”l,·?zôøó6m¥ÑlÉ?~~…u;û‡WÿÕ4•¢0Mbqû¹ƒ	°>WÀw:{#öÍzõip[*×á\"Ôr2\\Âj©AÍ‡ù\\!£cuwBG#€‚æ€ëöé{#1İéÜÎ‹ñçİ/øÿ1ª\Zíoºy?q~\rGÌõ—ÅüÑ—º°áwûñç‚f‡ıÑ£¡7crÆÎ©ÇùşáÁç«ïh{õùxÙùÜÀy4×a<%3JÍ¯ë×“öá£Çİ?~Õ1k£ıÇîW_?şêó4„`œêÎ“öãÆÂíÕ~Ñ>ì~%>_íà¸¾+Ğ\0áq÷q\0â_¾0@\Zë|UúÓ—ZmS»ôà{â¾ş@öJ)­çeuVMrv¡ \';¦ô¯¥ÎSÅİ] §—lÜ­óâ?ÿc¾±ÀÑc˜`fSòÆõ0qZ²>æ7ÔÏ}jåĞ;Sêx$àFÕ;é¸\Zÿ0£‡TÔ˜Nø÷ò|¶X5H«?Ÿ“s_ÿí”+ğã©á¯·ìs~IT]¸õwP@í´—bW»P.ü»¥ú†’OD¶÷òÁlÓ¥ªæüÁo$’Ä¾IƒÕE{N8;Ÿ-WIúÉ?¨ÒÚS$€âıˆ#ÿóÌÜˆ9ı¹WâÔB†”¦ÇÒ?“Â)õ¯	W\\c0Ê±˜’WWOƒŠZ¶ îîkGT!-°wË«#»±°şÉ<úMªğÍtĞ¨T¶é\Z‚¦²¦°íi²)z	¬éşÿ+Í£«Ši©aÕU«½Á•ã=îĞHİ!,ÔKÆ¥×~:îÜz(âÚÌê¼»Ò|]teCÍxa¥-½øè²:\ZÒNı[ã„Ÿ—Ô{¾%èW½xÛ´¥H©NbEøê4ò¹úMf}:4xêû…á1@¯v˜)Ì¶óñgbÒ‰ÿzSÌì\'½bSk»»ü·;-¯Wo±$—t\\34&·8¥ıº£0¥¾Ş²^8À?xh¦\Zô€ïa|‘Ñ€iîQL¶İ\rcPà{ÙÎğÈÓS¹ë\Zjwz­Ÿf­˜·`gìdÆôâÜµÓÎçŸaÉ™¯f.t\ZOYL«Cµ˜‚èË\"‹+‹_íú©T’öÏìé;Ô0­Ò1>èëŞ)…ı2é\r×¢¥øÜñT6•O£ğAéÙÙÙ¢<®JÎün¶0İP*\nî˜’âb1Qªï[!M&ƒ4åì@—zÛ\nEuØÃ£?j·6µğÛu<87¢Õ_XŒ>| İ=GØ#*:D«=ÌÅX©î@İÛBX2çÓF?}$8äËÕ;áÂƒMD0œ÷ò[Á\"GISWÒ¸©¸wfÏÕfª!N$Elô!\")É¿V²K™ŠCˆE¼ÿü¾sl$²¡cç Â¿Ö³nP¬Ëİo×Ø`Ïá•ßô*±‘¬MŠ+óWD<ÌT£Ëëú>[c³NÈ(ƒ*#†À¥\"\'·Xİğ”=Îc~¤~êĞ\n¤CÔ¬ÀÚô$¶Ù<Š(‡p¸ï\0oÎ‰Îg·¸ğdtIì:\"Uëşo‹¹{¯÷]R*P×lZlUmª–Ò[álPBÖ½~Z,à_8;»7ôó†¦’mÌÙ[Œ»×Êç”L¹Áñ[f8<ŞŞkŸÙÜ|£-Í•È‹T–;€NÄkaò¤è™±‡‰ZêD™×¨õb`9CÄ\"Êåç²°k‚,¢pqUXØĞã¸,{…¡†ga«>Ä Š` ¸«î³\\Œ‹aáókK× s*©¾n!Ç¶ù…ºXÊØ1Êõ-%q¿cäæŸ§¥n(GüÛ¡_óˆÒ²ú\n‘ÊÁy}‹0ö:AŠİÈæ\nòÌ|8G¨+àÎàFW;Ù…††§:V*I;û†$dÒê“BŠ¸²{…\"Î¬§>-h§z}*ƒšÄ½ú}vZ(¦Já³ëkÎÍ>‚Ü?<VŞ]>»|¶mƒ°ññ´Øî®mŞœÎÄ¦6¥6Ù7ĞpË¸zITdfvL.‚š˜K&ö#R&#“ºõçn KğÌ¤gËÒ\\öN„:GìÚa“6Ÿqµ†º×yS„æ¨TÑï9<aÓÆÃ-¦j0#&½[#pó€à»3¦(‚¦Ì±ï{\ZÈ-¯™µf¹õ¯¿\nÑç[ÆíuÏŞ/Ğ™Eı¾ÌŞR~ C‹ ÂM²ÂV¸élBÚvÒ°ƒ~Ä	‡GS3­}\0±l\"”5Ón`h<`\\=)ówN‚„_+ú±¡ú\n®sÀjÔÇ¸\"û’#ì»zñ$ù0¹H\\c2Ğ¸ív+·Ÿ;ÑÅÔ\Zv¯ø™ğßØwñKm/!u2Ï&\'šî\r÷æ ?èø ƒ:T÷ş¾¨Kç¸ÀÌàD—dsae©³»åÙîXvÒVQñ´©EÒ¶†â,áZĞ·n\r05¬ÀÜc¾ùÕ¼|ım`êS±8l¤U&#q0˜\\»Sè¦“’¸·f¹A½7wtöÜï4/Ynô×KCR»Sãzã¬TkoÏCN)è53zh©^O;äVız#±È0Ó¥ä†\n¼×ri­jÙšÎV-®ÆBCˆÍD#Øñ°È«SŒôV5}ãtQôƒÌ2[½fÇy˜¸ĞàQòğ*;>ş”èº6!Ü-RïÙd×„ó#¢7Ân4€›C\ZêRš qêÍ;¿[Ì.¨¦)hÒémçÖY»Fí½%´À›mSpq1È´cFÎˆc›ÌpPRušãM2p\0¼MÌô:CÉğcÓàßW.ªœ‚\rü©SG4•P£Nq’ÖÖÂb¨ÅjA’&ï`!ĞuãÇú@{ûF\ZOŸ‹.õİñõÃ!<VÂyˆ_z­—‡\0Ô9}25ÌmûMLög“ql¹e\"ŠH­C›ù§xQa®;Éıçïå¤Dî `ş ZÎ«ñ¸ô¯ ËóÂÃîó3ÇòÜë¬ñ}Œ-É‹Œ7Ç~¶‡…ú±öm2\Z‘Š\0®Á)ªüÊëQ9··%qBvøÁ8ºĞ>1¾h8Ğ°µé\'çPàJ\'T7êX—¾¦‚Ëg-6˜€7˜ş-I>b±3QúkÅz!XU—%ê*ÁºÎÙº23Sz¢„÷Ş•môqøäÚÑÁèšACäè÷Ï•là‚ìà¸ÏMl-PÀÌ\\Ç#ÛPS5ù\n/s>œÈîd^Àª®V7íÇ¬ğ%7àLk°FÖ)é*ò\nõX¦h¥»µ\\£#l×ñƒÀh{GÄË«á\\âUX.•’_‹OaŠ„SaÛ¸Nê­x4ÉÂ@W<ªŸ!^²u0ÚJjâ|Ñœ]¡‡ŞP!Ï‘p.*…H‡óEì,Y5H…\"„Ú¼QOúúB?nv°}UÚ•nÕúNjXø¼ı ç[ü_YÙ¾¥jzÚş[ys2.ÆoÏ1(åzÕ>Êş_7ßW-˜!ŞâˆUËV…¼[ÙÒ•ŞÍšçÒ/·¼i¹u`Qœá¤.’#ÖÕ¾ªß‡­´~°Çˆ­U·8ÕNÔ£cˆØüL¼Ó®Ä«6S*JÏbˆmË+Ø6üy²m×pàPû…”ú2ÚÇ´n¸ø2ì³fsÒåµãğ÷EÎ\\ä§°Àüh2[zã¹x:Ç3X³e9G>#pĞ;R·\"PjY´í×İİÑq=·Ãaæ?H÷î[Fx{-‚¯»»[O:ã¸ÈÔ†m¢´~Ä$ñ·ãûìi	}+­‘ş¾(o–jõƒfÊ¾YB·~ıó\r8aÿM|ÔĞ¡%Y8?îÈ¹ã’ØkkÇöÕÙt¶ÀëØ&#ÄîÈ\0:>.\"Tú~e\0\0Ï\02(Vƒÿo&â*AÖëÎ-¾8{!õ?¢-€HU›¤/8â¢4%u;ıZß\n©ÆRCjRgg†R¼B–Ë«ğë÷Â”å·øC©¾~ûæ§.{°®NoP§ùvBÍ.dáZ>»Y¬Ò]÷S_­0¥q3^nE~Z+ÌÛ:$këCåŸß­ÿ%®ÈÑÅqñQR$2Šøs§²F\Z?›¡Qv±2)Ú îÖ´Çyn`PúÀcÓœî/·Ã\\Û\Z£:ñlÿ\0ÀúrÏpD}G3»»µrx¬Ñ„‡šÌÚÙBÈ:IqQQ \nÒC$eHjºÔ?”C8­élúm	§Z©9 ’Ëo°,FÃ%J4ü\"\r+\'Zèß0À\'4Åpº.=ËJŠ\nTã7ó—8n,ÑèëvÃ?H•áè86Ş\'‘ëóÜãIÿê”Sˆ;¢<4·ÉæÕİ]‹<N.êòòÈ\'V6|n.™F7”*9æ$?M`ç[v%ÕM<ÌíwòîÔèûO–ë‰™IØQÎ!ŸúÜÀ*èÑG‡{nÁ²9”Ùe»ó9y¸¡ÿ‘RŠB„hÏ.êâS´Óû †¤Éİz°Ôu¾(‡êß­âöh¾à­Ú±X²Û«š<…lÖ˜¥´\n¥§¾³¦ëÎ¦6ª¼Gİuã¢–2ğÖà‘K\\Ó\\æ_‘ßÍg‚÷qmÖ½¨U!p/IK˜šÑãU–ß¿¸\0[\\–n—ú…‰b¹\\ÒªJ¯@ô˜\"T’¾<íÃ]¹±\ZàéúÍ:IRâM×ÂõK\Z~K~ 8<®=R=ù›¯§Õß{Û—+®ÕM ƒÔim–	´D,G4Ü<.\"RØÖ±Á=MSsabËÁEq¤+0o·ÍÒíì~ëæXØ˜^ö|AÚ¸“Åa£4ƒ	W,R-œ¥[€c*;èd²„ş£¡$]‰´\0³äfƒĞ9—Ó¾ªeR&’qTâ¸“š)A¼±SbÑ{²_¤“)Ô¦_×C‡|\'Ò/Ã+Ñ,î\"§ÇÜøÕ€­q	ÈùÉ^Åõ9Ô`oç¿«¯¼£»€­íÒ]`x¿†Ñ¦?pKÚ*ÍKŞ—r‹ß{Ïş]4®=‹IÈM¥gõHŸ×\Zö³² 	ï¬¤Ö=%Ø¥!B,•ù \rd	öC×¡¯¦³¶a3‚ãEXèÌXrÜÌïĞä9\\>\r9\'¾«à¼Šïç0WM/ÿ	î%Ú›s†|CG\0×D ±ä+b3ÿZ¼Å×¹s=|fì³ÔL£’¿(\'Ã›Zˆ=EE•LlF‚&#°%açÂ‡¼™ã˜JVÏ±¶&?#ƒ55›N]Ğ“Ù<tR`ø37qÌ_Ô($J“èÅÕu®á)èA\'(	—7l¾H\ZæaN­¸ŒRº†ÛÛQ%\ZÆtÊâkÛtœØ­ŞM\r°3ÍdĞä>Í§°´Ñ—hIVìµğ€(—ñ¨?·3X[7X})c™7~é1ãéLcŒU3To6±œ\n¹Š¢Ÿ0:\r\"Dü“ÄìÇ`4 GÑ	A™¾ÆAñ\Z>¹Â|Æí>7û,j•jšq!õNHÛİİ©Í`g»—<x¨:yã(êĞë}ĞÈ7æ|ş¸ß\\Ë¹\'k,’AL¨l(‘†ÖµÆÃå9ÉÄ÷‡Ë›éh>œ–“Ä{(Û¼M9Àµ{£|d¦İĞ¥CvĞı*óâb.ö3–D\'~Ë¦{GÖˆ¡\\üˆ‘RØ§äõW/4×$Õc[ªgzûÈ^gi…W‘L’úèŞ¿èëG\'…Œõ	R#¼\ZÔÆw»l?Qmq]Uüg|Ëû›`!\'{íZ)}ª†wZkôlÎdd½9T^êëêr´¸³´“mF*pYîSÃ2dÁÃnŸ&ö9†`9Îr„W@gc\'Ö$Õ§¶SşIı¢7åX\0‹÷OøÎ¦20Ø.9ÛÓŒ„ÛëW‡èÌ®5b>Åk\n\Z‡Ö‹ål!¿pçĞO~!á•ÆofQ)ì~¸eÜ $‹ı\r•cå+NÃËÒØ“{åçá\nÆxú-l‹IZ$Æ\Zå>Ö´e]·<ß*Xa	šÕoø†kâ¡Q¡D+UC;Ê¯wTêQ¢ú¿øäåI^7©(á\nÈ+zº!6¨ïäURT\ZF°*Q¬*:Z®¯HP÷­ÕøQ\01èá?9É6ÚŒ›Lb´Ã‘f‰õw8‹Ö!Òğ²q¦›÷‚~YçââÕœÖÏ€/ĞÖ†ëHbféJlØ[icZ¥Q¦ ²z}ÛÓNÔ™[ÃŞóÆšÚúÇçğ5lXÔÕÑ˜?Y”§ÅÈY©~ÜİÑŸÚ³\Z2+œ¢È~ùÎE­99Â`Yb9u¹(MF¼^±QÒ:<Ã0qèëØ”\0)í_oww%	öş9ÚVhuş*ë•¶ÆO$èFÕğ~<®–è}´h‡Û@lVDH4®³X{™“Ú†@ÏN–3\n1m+r!o\"-L¯eFÅÊ\0âj›^öôŞ^´«ïÛÅ\0ó{[D23îhÃX¦‰€ñ.\'\0•¤6Êí`àmäsÓ¬Ä tJ›C<\r_“›¬@`»¸—0„pÚñv¹£ÔFC )•[î^ò(“‡ÄWN™‘šèşé)½¥4~†æËrñ±¼¿›Bâ‹ ¥ğÄØEÃ!™MùtÏk£E	ô…|šA±bGÊ3±»Q›€6ò-•œ»ulÛÏã*;õR¯‰ËS\\‡ƒ£\\eS\rÁanM°—ŞöÌMQ8Â‚ÌĞ¾ŒtĞ–tP8üø½¥eÑ3KÄÛ²‚†cU\\µ,#s’ä@ˆgÙ|ÌÄ<àtU~$rq¯tüşçİÆ0ÙFªÛÌéÙP.8ÉºHáàîíÁ°:‚OÙ	™İ‘¾@=hR‚<z·Ö…¨mÂ€ŞÂ-I¿†¨!±U@ök¬¯\'z¤ó´eôII*ı)áaâ¤¥³élÏùØËş€jt‚j‚\'/È¼;dãjgr$ÿ¼÷Æ¶<¿0	I/BI\'B4AìÑWJ¤£))×ä4œ(F	i…íS7=™^„AéËúÅ6?K¦Zİì_\rS6×iÒårÚÏ¤)åÛîÁP½!¶¥ *–ŒcÚŞãT‘U¿Sw9¢€!ÃÈU°ª!¾huÇcn¹ Ë3¦\ZM7®áBhDÁ™\'Y¢ª«c#9:DF@“¾>0hr1ù…©(Ge$S£Äªk½®§íÀ¹»TDıî®±§AÏ\\%í›KàŞÕ®ÿl°z2\\¤Ÿ,äVÇÒ>ú»[¨ßHiyÆq\0šıæ‘Â•óè3›¹6)\"dIé¾piÂÏ¿Vc&ûŞíeÊ+àñA\rvÀ>¥éÊ$[hÃí5Kòµ5¤ÙF9w?#õòZqf±>J`¢‡!¡¥³MîBë&[åşkqi×˜ştå`ÕA\n²èCŒËfÎÉ¤=¬\".8‰…+\rºÍe½K|Úï$ƒ<OnóŞ¨\'kp ù°¾œ3xÌDëÌEÍe¦ÎFPhK“T †¸,ùû]^r‰$ÎÌgÕÜ{şæ~9îZ3U[˜Ò-•¹DÇ¼©Â§‰f“¿²\'6«çéIz¨l DM²)WØÜûLµĞËÕåüa{yØ,Ù>êª7†Zp\"ç8LøõÂLøG_Jà„ÁËú8ï\\óqCÍ×59%%:×?î^ï»×HÊf‹±¤/Õ)ğÌ\'ëÃÎˆÖác‡\n^ÌS8íÈ‘—H(VUÏ¡ú/e*£îOùÍÎ¸T}c½§ò¸Ihâı=9^s\ZÄÏ–â©\"”¥š7dGË ß±kT)*–”]\"¥ÃšYzm^á&Ü‰ÿ ww\\®vóÇ•ÆÓ1s5\\²CX°(êÁ(6yÓÊ%³Mİbz‘g\'“õ\"æ£\"•|ZmX:¡mß\0UÄ÷5öÌÛ¸73Ñ8r³R”FF1	^WÒ³aÏ,æ äí™‡¦ş@‹<œ$¥ô÷–b:V/ö ²\'GXÚµx/pÑ:å„C¬UlÕäDĞ-ÜîÍçí?>ú¯ÅÒ»ŞnìÜ§„ì\0bC.ñÓívâŒù^¡ÈX—‰‚û¦`ÚgÂcå›¤?J»¿‹¦öš]ÕÀëÉ°Å‡Éìô–[ÑFG+q}uDw¶‚K>j˜ä¢_ZÕú¼¡¸†Şx÷¬Àğv:œ³ö.õÉ¹G\'15¯;O¿Â,M8õa+êC¼ÇÕÈ•\\ĞvÂÕîîÑghvİO†«ÓÙåZãòúÍi;ûk5Í:O÷“neœº„Ÿ6Ní¾0z¥ÄºPF[•Dt\Ziâz3ê5ŸlÏqêûÊì(ã(Ã*\"İ’PIA·I“Tí§ìf?±¯•½¯¿ì<-b°ĞåÄNls[ûµÒ(S‰1ÖäµD+ØÓdÁ€ÀR»½€]ØÆ&p…e’dy„¾ÖÔ\"G[p	Îİ¥P¶ú§ò­Ó*ØÒJX’·|û#\Z|4¢?>§òÆÖ<ù»÷e\' (&\r—_2½İ{Ìİ€aà2À2ÎRæ£´ƒx\"íŞZ\Zn‚ĞrSìM6QD6Bâ2V«ÁÜıêš\r6“‰ÃU4gõÓ/¡ÄÜ\"£»7í È<““ÑÚrVù»Ø®Ğ…X\Zíˆ\'rMI²íÄ\'Ä¯ë…Èš“İp^)…µMúëå<‰7¦uÃ¼h<4àï™ã•¶zï—=twg¶7_\Z,5m¬®›#®¯4ÊDÏàq×vCİx@ñ¯€Û`AO½Èvg<n†\ZTßP \"b[GÇÏè‘ÿÕ‹;8å¤jùã°šÊPwn‘ÆW\rÎÓè‹­(ØÍ&ëËéy³»VÓjU\r\'°³ŒZÄBª•©-é,ËÅ_äœ¬e…öÕ7„÷Å†\'í»s´~Ğ`ÔTF‡Ã\'I0Ùàh¼k¶Uˆ½•ì\Z•ö—ëK]wRê_ÿiß–\"é0kj…N_€Ó£Š¾Èíã5*ã¸x$¬\'ÏŠÔ83ºŠÊµ€Uİ&Æºxñ@¸“Êw¬ˆ›éûfœ/.ªMš›ŞG%°ıji§|9­ÏÎáXãc®èuChvË–\\?I\rzìÆÙ‘÷›¿2\n´Èª	zwğ2z6Òh›E¸»{_OB şY¡pÉ}—ÍU¨@€Øjvv6)İØØM°c>ú=Pe\r®/åjUMÏğİÍ¸q\"Œz„Æ7‡½ƒ	İíQ2øºdõƒ%’i^U«óxUºf‰Óu[uŞH®úîîÎİ[M«˜–Lˆ/ñ\n\\O ¤?§°õ]OA¾½yõ¢m	JŠ§P ›ø9i§Z£}O¢Æ•^vç³Š¥*=Ÿ\\¤–ö¡@‚Ë=5øèç`èä@šY}ëê´}õû÷›Ü“dïß!xGËµõÜÓƒÖs!AV•\'XÖ³C¢ã#,M¸ßÄˆ›ÍŒzXšô…dK¸;~f…`»(\'Ó½w6¿/\"ÀæGœáåæh*¡a\\ŠŸŞ–è9ò¹\Z¸ÖÙ?ZA}}&`şà–,ª…e‘~Ä)è£,Qõ¯Õdâ«§\"û+,‚/ˆ¢”\0ô]/6ÃYl?w¼®åÇªV±gR9“|\r¾jÑµ>n\'µŸeèt—a/\ZgâW,`WÅ;¾Óv‚«~§Œº°å«NÀ/‚Òå7¬˜¥?ÓñqÏ<}BïïíJ\n\\vè>V€¦ÖíIu!èÑx\'I‚FäÓ/Ëú’Ç&7ŒÈVDùt6•3—MJÍ§•ÇıOÏjS¦F-EÒm1˜@ë¢ì5ÒÜÎ?a•Ô5öÌœ£ßq³KDA©ûùHuCÔC·)ñoaeÙgŸ1n±kIy°z0XñWJ¬fÆ¿ûî5¥A™{>„sObˆ	5×d+êì²\\\r^Öe±†ëœ˜ÒóÈ-éñŸüt¶€~^sØzÒ³²—-×\'—i<x{çl8æåb	½ú‡ÚÜÖÆÙl`†6ë±FĞD]Š^©€Ô]*ı)û\"âÆ^Ş¯^Q<*ûè*l›ÔHbO9«¤û/|ìïMÿªe[0\"´\0†*Ø=¡8;Ô¯5ÚbQÙ£ê8u)Ğ¼<ó†R#v!«`|vœÈë^\nòÚ{‰ãÚ”Ù¹çZ·ö\0-„†›Zòšÿ-\\~ê÷ó\\÷ÿ‘»HRƒÿâxÀMãf&ó1!ŞÈp4àõİlqù[£…T^r€îSVÃ|Ïo‡r[÷L¡–\nkdËÈéÁyÈïø7xïDzC.|ã–›ğßí’:IÒ1êY®pl;KÏJÖˆ;ÎW‘Z-5ÌÃÀ:ùí%ß,c¾ZŠÅÌvE;?Q—M–[$“TìH`-|3]—«jô–·¬Æûagå\rkÏm’R;x;/GÕpòoå\rše¼H#ã4ôó9›Á{!$Ãu°:E2	ó¯hÒ\ZHû‘Ãüøa‹?èE8Ãüób1$”è¶vimg¢ók\Zgï`cqÄcƒ…±Š¸!¹äŒË.İµÏÉalç6NoBEœŞğN¶qQ«\ZÀÔá×\0KÉ\Z|E„ši8–#mr‡OW}2z•jiĞFÚÕMÂ¥´²u-šÄñ:hcUe¢©hkvò,21l-MÊÕlÚ¥(j#û…¡0¼\"İÄŠ¦\\Hq+©H$¢Ã§‡\nï<SàrV6íÇá¼Ì*Eko8}9®!IÏ0i>Şùe ÅS£ôË„Ôï\'Ã³|p•”¡¹ìqJ2fsS™\0xB@aëoË¾j”\ZÔ1h*KS>‹Â‰F+œzô Ñm\0*VKşâ©KTûv6›”CUÒWÇ\0xõ\"ÁT™¥ÕPğ0ŠÂ•óı0ëw[G|16‹oªZí8š¶¡Íä8[å!`Á:aõùy\Z,U`f—ÄşlD§^V0ÚÄ T/V¡¾ïbêà\'İ\\0Ds•ºŠnT3«&Kõ^—b²säj+µ\"©™=FïÔÓ¼©À4Fæ–æøÕÂç×ıE›Æ¾­]NaKQÌ×4>G©+¼)Ó!ãõCDôacnëŞ)B×§ôŸ0,µ~‹N\"J±,7Ób¬Vö€%j—Ò5­ @\rq·ï_¸ı b8z˜Ÿ0×ìºù;(¼jK¤›vBåúé×°\'[»ë\'.eÿĞªÜwâ5¼L™§†È5Í˜„În˜¦\0Îç±	…e€PŒkrı/·eH’Ä?`Cs¸=›JlÙT/\\(ÎJğ.—8ı\\PãzÁóëd{+H£ô”‚ªš©ÒE¨¥U¯Æ]ù1â®R½9°T\ZQS®¨d¢t¡…êÀÓ¢ÍàÓà–’¥Íğ“ävğIr[©\n÷QŠïÜ:F‰\nÛ{ñI-¤9á{úĞÀùníFºÎCæãáí42åMÍÈè†Ì®\Z.Ë¿™=î/Tt¥º‘¤É›R7r`a}.çEceG6¶º[$Æ49¨4ıÅœ”`8?ŸT£Õ>»Åğ\"±ºÑ`,\ZP7¡Öw‹$wW7ór§È``iîÊ8^z§¨SLOV“¿¯^<iÇ \"—Òk­jüë·A£hD#ÕüÓÎÅtvEM§Ó‹\Z€~\r7±6óØ«ÀÚ#’›lw3á”ÒgÍÓyïn\nœúØW)Z-®”)YˆÂzy&èn·›¥Ì\\(Û\"øËÙÂÉG—ûNú,¾\"ÿJ<|èøjéI¾¢òšSÉô\0-Œ[ĞÔN1¼ˆz‡üe‡æy”ŞæÔğZíM­ñQù€i†ÿ–ÓÛ2Íµ’ÿÿişõÓì,µøX=‹ÚoFÅİººr¬”<°4‘ºÈ\rL c¬×Ô¸/Û†¥t6 Õo¤ÿ5Rjvé±8|_ÎE9]ùÖ(g/ØArâ\"¾ºª2ôàB§º|Á%=\nÌ6B#uÜkË¦UD~;Ş¸è8†v½xíºévRıŞNmñæûì½°-ŒXˆÛÊm·{rq»\rro«#ÂkëØ6Â/*€fÃÅ£û	#÷48±ãî‰¾’jfSÛªû#a6QÈFšÇ$ƒ¿;…várDø\"CUG‚ /Ü®œ¦Ö¾\rª“d[¦^%Ğ[µÃX»’g§ÕŠ“®En‹ø‘reI*fªŠ[Oïzir—ñè5‰œ¹-~=î»ˆ—rÊR»\r§©îìr<@ì‹˜6Çl ò´™_íK´7‚‰‰cæ/É3ª›Lx×ï²QëÌÄšBõ3½5¬PÉîßwõ‹ã›FK7ˆN~şo,Û\ZÒX¸r«ã5	ã\ZêD%RDk#š{”Ã7ôå\Z$ëËŒyÙİİ	A…QÒ—v 	w@jß½ñHoèBêtî™z2Êçş3CŠ$“JÜF=ãÃ3KxTDüÃN`í¯O–\'’†|Õ\\=M©XB,ª jşì4ÅœÍÜêÖWÓuéB9rK,Eµ p™„¹Ã~uúÒ2ùûĞØ7WigiCnßGïa§ƒ×Ow¬°È=€c\nåÍRÏEWRSj‹|Ïmá&.‚U¸KR¸a´aq?Î†É“5~Ÿ½çpÕp†è\Z5\Zã\"˜”ÌÒêÎ×«¡2eÈŒ‚4ÊËùJDP‘–)ÁÔLÑé=¥¡G–Æp ïÌ.õ ØÖ™¨cïîú	Ô”aÌ‡°W—\0ÄâÄ‡»	TØ¬æ÷ÍhÄı,jŞ¸@Ÿ0&ê€vïñî4JœD¨{f§&· şÉ§QÊÚB÷W»²m¯–«äó_[…Ñ´ŒëÊY5ß¶¤É)ç‹6f“°Á¡€/´aQ\"[.niåË…™ö¶ÂoÏ‡ór¬f)>XbrneßT—&¬Üåb…ËàİìEEÅ†²Å\'¯<ƒfcˆŒÒj‹d\r*‡Æ¾ÛÛîÀµ¯:cƒ9–Q;¬ëj¡á\Z¯€GÙ^êØËe0Üv¼MÒ•nV2gy“²&M)À+eÉ˜±óƒ0æÀÔù Rıÿ',1454486318,NULL),(8,'8Pv3UAqNINqH','phabricator:celerity:/res/phabricator/5c2ba922/differential.pkg.js;-.laET2RkA0Ap','deflate','İ}ksÛF²è÷ü\nj7G J -í¹[ç\\2HÊ±“Z{\'\'¶÷l•¢Ã‚P„\0ZÖJüï·_ó@QŞÜ»U÷‹DÌ£§§§§§§§§çõß§yÙ´IQŒƒŸ×Ée/“¶ª_ÖÉÕó2}YW›ïó\"{¿)ª$\r¢ûe…ëí²­¶å²Í«r\\ViŞ·ë¼™.ğwŒæ»(û˜•m3;Ò<ı6»ÊK„DøùB¦Û¼(ğ`SWWuÖ4\\H\'c…º®êà\"DÛ|ÙÌîóæív³©ê6K\r&á}µÛº<:ºÍË´º\"ê?äMØäÍÏIÓfO«µ‹n²›Ë¬†©k³r[Ñ\"Í6ízv\Z-òæ»2¹,ZR4YÔdí+“¤\Z¸¬ªBH×ˆ1uÎ-0p¼ê­®ğy Âb»I“6{Iøè\niV´IxŸ¯Æ\\ƒĞãøôø˜²¾>lòòcuİ\nç;«ÚILUæƒÀ¾ê¦†7D\nÂÕ­İõóà¥6æË¬–ë¼HÃû´BìéšÒÙ†õ8Œóéït“ÔÀmoˆón!%ãÚ¡¢0Ï|÷úïÓ—?ı8-`t³rlx6\n–E¾¼\"\Z`(u	¬@ù‘Æ<#’Q%{¤Æ¡Âk¾sÉŞgÓk`ğq8çTk¸Æ» *çÃØ¥@Nè_Vÿjº[-dXá]RÃ_(­¸ÕÆ÷ì $‹,ù˜ıëœ†eõñw $aóKrûÊ¹q8,’wuR6«¬¦ 8¿[­²eËjsÌ5+<†^µùP“¶>&õ+˜\rM¼[*2_Uõ+äy|:Ïó¯(uZdåU»†ï“Eñ&+Ó_²ß¶YÓ©Ğy_h¹±‡É¡ç€;ôë±•fê‹kìİ0Ñ6XöŸ¦\ZöÄÀæ²Jê´C0ó2ayx¤S\\mö©uBÁ\Zã\0ÓŸm\n`ê œ¶ÕÛ¶ÎË«1Q³„ĞÎ$0MLó6»iL¦?V^AwÔ¨ $Ç^)6êÉ³ÿÉo@ÀüúìÙ´ÅAÅÜi{·É€:8óå-‚i6Ù2¦lè×óGŒ»p„9Ó2¹JëŸ1Lº@.	ƒØìƒEeÊr®½„QÎ‡¸ÎYUÌRBuï‹Çevû…ËZ†Ÿ`ü\Z\ZMLúéòÌK®Éo\0Ó±A“ŞU }{ÄàŒ&ÿGÆ³©]ƒ†²®`áQ¼ôb½-¯ß©dPõy|L3„—~­h1\ZXXgDR¬Ï`Ñ²æò‘=ïh}u*\ZâPş=µ\rıyzÓ¶ª,p OSµ4©ÕÛÖÇ¸	ì4U[lëœ;½€Şp¡÷¿¼â–°‘ÿÚfõİÏIÜX\rE ‘edş»ª¯WEu;Öà¨Ú_’2-²zìL\\‘yúÜêc•P¥cØ˜øGÌg\0üåû±\Z.D9ìà‹#Ï=Æ2ÄİB<©L1{DC­\"AÆßòìöç\n4Š;”/€ƒé£.D½•hú«v\rÒŸÿòêå\0ÄÍ:O\rf~ùNô ¨‰dóëR.ª™v2®§ø¸`K„†şA³’pÅrŠ™—ÕÍ¦ÈZ5ûªÃĞ«$/ül½~a1\rR1±Û)Ê½\n¡Ğ4l0s€¦ŞcgI¥ìiC«¥>ibü†¿ZßÜ0 ˜?hü{¦†“ßaÕC¡[mtTÄÿ\r¬H”£Èù}³‘\nh‹Vƒk¸Ë¥Åœ£—(úœ*¾2ºŸBîç—u–\\ó[E<\"PÙh	Òè2Y^wÇœköùvó¤AgHTİÏ^’‹E_î%˜·8¬c<Õ	\ZA¸I_â~vyoHÙÔÂªuö›ZAÕD±zj¨D…›,+ˆF£ˆ	U©öîq¿ş¥²…ÊI*Èd)ËO•?åÄ‰iÁ\"¿Õ¬WŞ]ÄŒA˜·¿)Å1ÈÈ˜õĞ¨*+27DPG¦•SÇÊ´aúÎÄ¹,ªK=\\•Æä{6öÆÑ\ZWØ:sk¬®æˆ\0‘+ÊTOì÷0µšßPô…L$2â0£êÎd:@hÑĞ,)û˜<e@À¹OÔD8ñ¼™åM—ª”%­ŸgkZÖê)ñK¸gÙ²4DÃİà,“	¦p	?k>¹*«-¦QöÎ¶¡!ø×Í#oÌ&{R¸„^î@s¨§ 9àoÒ#XÁa\"v#KïI\rÒÖí\rQ1oZ•Ã\Z´e¹ÔK§ašaÄp¦*µGäÓ8Ü[GMsùM‹j\"aè–Q8x%J©‘f\'Álœğw^®*5u?­ë‡õc´/àş7E3…áİTe“½âÃŞfõÇ¬qàKl¤S	æU;\Z»¸j“Õm5³{Ü%• ’|D]òE‘4\r§¥œ¿—ÎÆÒp¿î·˜¿]\'›LmRû-åöB\Z¡fa”‘¯ ÛPEa¢–sõCÒ±ê•çÀ±Íî™ØÌ	[•RflŒ$Õ\"½ùë&/µÅ{•Õò&:¦]B$ìÕ¨¬ÈŠòÛ.³,²¤~—ßdÕ¶ÕÆR€Î‚qŠ»½}›ä-ˆïXê	¶J´.¡ã*P‡­7ŠÚ—Ä%Ä9îê¾ÒxÏv$@Äñ1\"ÖÕ¶HßZ¶\nÙk@÷iğôÎShæZ¾ ×#<`¢ÒKŒ\Z&£“²q__NÔŞñÈø!¿Éq¦\rØúˆ†eº\\†-Œzà³ÏééŞÁ˜à¬eTMW©@ÿ¨±}ĞWy	”¹‚¯È§É,Ú­{\ra7Ï!öœ³Tr(Ì¿ÑD»õ±¼äÀ@¨BönƒÒ©NV-ËöŸë¼ªóönü>%™‚³šŒ“(]Ê%4€İfcÈU5>g¿\'LK11ì¢“›™jøµ âñ˜hêÂ¨İõyù£òXñüúâ(1	~yµvî¹Œ+¥kÅm³?ŸF+…óìì>kg@f‚´SË—Ù:ù˜ãJ’æ+ Læ<)&«,Kq>M6u†2>0<Bz•_ñæ5¡$²Iú”“doU•-\n;_Ò¸€@Œ]æÿ\0‰ßïÄ\0Ÿ)í|éÒIêwª0&­úv\Zë>\'pá|(«ƒÂ›´ i;´ê°üÛ·ZRl‘dõ¬KjCø_D5èT0;p¬ƒèÎk¦¢”8˜ÌmkV,$]¼\'pŠY ¿õ‰\0~Œ5B<G$\r<Hª\0J/ÿ]#–Ñä1\n„Å9ReÂº†0ÜëóÈ™äïôÌ§[!LlI*M´{a¡™üŸ~LŠm1EfüÓv]Bö°E4®ëì®±›0!Í—ÓU26\nŒ­–´Ú·ØKÚÚ£˜ÃQt¤ûb>g‰¤w5XÍj-±¼2¡N@‡Òê¶”¡(Íd‹‚å:)¯2¿¬3{H8H.µ)°\ZâN¯b}ÓGÜu¶BõñUY\0¿üÌ€aø}CS-§RH;r3ÿ8É0ásÎù=Ùœ!—sr¶êíB{ÁQ}j6dšN•Ç:ƒÙU·–õêP/ˆ…7ghô?lo6AØ11ÀîM¿>IåùD³­ïî	O,<…5y\r\ZÌ\\˜ÂŞ`N¬üÑ¢\0ü8Å`î,×ãüª¬jØßïv;Åi}½…üHq«ÏÜ?¤@˜ÖÈá†¼‘ç{×İ,Í[¯‰f`ím²vô¨Ú³Œg™Óæ Ë£¼AĞqW…Û5<™¹mIá@ì,°_[,³¢hâó‹¹½JH9)5kTI8‘kù®«ÊúâißØ°‡UÍßÇÿÂ\r}_Õ/¸ëxM\0ù„	vÑ¹4|Ş‚aa÷d™XVWçSå=ã„Ş{ëÙMÓÔId´©™Våè´n¿áRSú˜ÉG‘­Zª\"Íª“7o22Õ|¼	fÁOÒVù§8xœH\'ªÚIğC0—ñ Çeyb•[ÜÁÂtäñ±óÇP¹É^y­’ÑÙixâfğôÇŒP‰1¡i¥s”q¥çò÷5\rN“Í$İô1ryª­61÷ƒÁ0àŒ¶x>|ù7ĞÀ6áôîkş€ğ!zßÍ&†Ì9Â€ô9U¾Ùğà”Å¾M‚VŞĞ¶¢ˆ‚vÀv´ˆ‹i™}jßæ—ÀW\\¯©UÛ™ÇÇ.\'\0¦°ë.ÀMEâp/B4ä#6ƒÙ[ÑæåùÕU]ß.ëª(€ÿ‰ÕÙ8¥ùT®¯‹•@ÓÓOı»ë©ş2¿¡oĞ$Úç€æô._RKÒŞI§-»9fã®j+ €F0Ri¶èğL“ı&ç(uu‹Ãl»³árÆàïWP`Jm˜§W5ÈÁe\r­ÕNş9d\\Ä1¼WGb$”hdÆ 7‹{Jœn¶Íº\nŸôAG*(èˆ?r˜MŒ$ß³ô¶1¦–ìi×)bKİó”t²Éf7Ö2>¢5CMë’\ZZÄ%fuĞ9Ğ†A4’ŞwÎ2‰€¢!C°µ·€°.  &\Z7¸^u$‘»ˆuèvnXXÔ’î¼fË*ô­XF@K¶mBñbYáøÃÁ_ f³@§Ül,ƒ°³´ß¼ù©üWñ–}~X>]åuÓ’(=ßa‚¬#a¯âF¦røôÚ~xPëÀª=â5ŠÖ1›Ézsû†–q»^ˆc3è€S/)’9ÍÓé\r)rÏşçÅ¯éÉùOo.~ÃğËgáùÙ.7JÕû¤»¿-SXºJtàe—*‡f—H&ê¬‡lÕ*]eaÈÒÏã5áºA$0`×§ŞTÛ&ãíÔùB\0KAr5ƒõåÂw¦ƒî7Dáo·m‹ÌóğàPĞõÖŒãXwÜñqcŒõèÎµv˜´ûøi“A§©àrÛÜ±m\rp°l‘M•íĞ_‘JÆSÂBE3¿AĞÌ²e¬À‰*#\Z‹CŠùAªœ§\r\Zvfè˜§õQÃÎbüğ²HIÛùZåÚÇçÌì*+¿·-°Ág±\nù\\¾«¶ËµøSöò€•ô9¬dŸC2·úQlrx˜<dŞ£8vµs]t)ÀĞŒpéá,W˜Ša·]È¹ÒÔw8«;ª»şÑd|¶ÊµØ¢ÿÃÃQ´QŠáª±¾ëf	wò.¢l²šw°(’ÜWh©Y«	ªbĞŠ©¨Ì?Q„\n·“*T¹§ 6 ì“/Ô áFûÇ¤áHB@«’´F¨}Ûg‰œwÙÍ¦Hğ%—Â2­Ljè¦·üìj%È½z9ÖÜD9°ËÎq9´ˆ1t?d—XXÇf52s6;åÖ„Ÿ;bB—@)È$´•3îWH¦!,Wƒ]Ğ¦Ö}Õ	–³™§	°’õ¹âeïöÉ‚ehNöÍ¾á»öß`ËâbÍ^yf­®6Qfİöèi´GÆÛQCâ¥³wßƒ·¿à*‹ÄÜÃŠ@Ó“m_ƒ°*¼_£\"\rH6®:sÀ\"z•c¹°°Ç ¤\\Bn+¸¦½¡ıuÄæ¬«\nÖËj„mĞÑqÇXÚ;¦““<\'¢TÔÇã˜õ=s¡A\rÒFÌ„fÁ¦4,Nú>;20CÄµ;CaOÉ Šßæ¨8â -“&Òı[‚ÙgH-®úíÈ…ÚÜ^ºª\rÌ+Ì&êl%ßv	ò{OÏly}Y}R£¹Bc>3D^n¶íÀØ1„ùgt¡­®®Šì…4«º)<LŒa/)Ä€%_bUÜwrm&³ê¥jy…ªA0·Ê ò„Ş©}ºÕóç— Ç¤ûmíØİP6’Ö8P¼‡Ï}kÜ¡k›ÛàÿãUmZ¼²)óW<J_šá³M}Öh™ïœ¥Î±Mrº	Õ8êÅ†ÌZíĞHÑYê`´ßUBö\rÓğO.†æğ®Ú€^tàØ³³HÏjøÉ,H‰8Mfg;ÚüuT9¹ªx¾¥ìÍ\rNªÍ…öŸĞPfIÃ5MÈÉmW©t÷8/ù\\¸wÙâaÇ¹À#ºÒT¿\\»W!p®½áµÖZARƒĞ=¨nÍù=¯¼­¢É0•Œ¦İ…³\"§>EŒñOÉxLônñÀ=İ¾ßUKÆ<Á£Ö»ÆB¶Lñ¢n€½Òl¢b»2µÀ–ÁR¡²c@©x,¸é™y|LµÏÏ.Â‡şyz!’øcrÖV0ŸÏù8S:Ü!V¢CJGÊ©Êx6”¸\'C^å¨ÁQê$ïäˆTç¾‚/s?zKf~9Ç#ôPü›æì–Ğ±iåi3S4ÉÓ]çRGb™\"á{¿[‡²>íÊÕª„ÊÇDËg>ÄDÌ@ÂóXf€ç1ËçyÛÀ]’¯¦ÅØ®âÇÕQò«µ…U@õ\\oL{•4UøèO¦¼®”\n?çds%¢àŸã\"º‹<t·ŸKd¥f¯A¸ÎnP\"2‹c(¤+3¢¯ı5å©½‡´›j³-è ¹s0Û±o‹Ó“­†¼zÙ?eI~ŠNC¦N$R²iÙe—µçÛ¶â‹Ğ$%“óe^äÿEwÊùóş£u5©bˆÛ¶·İdØêøšwHL˜cUÒ¶?KƒjØ5é‡ãw¨5ãnHç3â(xoûjWCô•ã›…„JKrY¥ı&7U½oÑ5İ?ÄHú¹D°Ÿ\ZCû8ßÂ„Üˆ>µÎ	,ú¾àÖFjl*R¦¬rh»Z¸¢e©q\0Ğ‰Z~8ã÷4¦¦1•Mn]a;ÕëŸ:’XV0ôÀ³M\"€ö»ª*Ú|ÃŠ¶zİwaeG-Ô©\\‡n;¶¶ô’¦[s%—ó«2ş›}\ZÊqà©Sœ{›§í:>ûÓ)Y{i1y„\0àqğÇ!Kƒ¹CĞTÛz‰«Ø,ôÅ0Ä÷\Zâ›ªõıãPß8P¿û”-y*ïü&°î`´ø,(ä€üÎ³iàì†i©8¨yŠÄÖ\"Ì™´>=#N½¥áÇÌÇ ¢ŞF(á°)	mDĞ#\Zê‹Ìw6Ó1¤ğŞæ¡ö\\ğÔ=ò£ìÄv­ˆø1©“4¯ú¼•^Kæ¥» \n%é‡mÓj;–¨É(NÙÀ5°\"3²î:L–\'û iƒ•>Ë¤ƒLö:=;\r¿Í!\'[Úu–6—MÉè’‰yK}	ŠŒ.;ySvš7ğ(P¿§zÙ	2&ÁÃÿçÖ¿28†÷œ!ÅÄZÔäñ1g¨\Z­@~óGG^™-É‘Ğ>7gò¼ƒÅãjµÂåHëúƒÌÖßWÜéäV©\rÈAYz¸qØ8Rºª)·z¸ù{ÒVâÁæq—Àïì%¦‚yx/T&¨Á\'L¡Nøoî÷…¶}>ê§Ê6À	ŞìšÔê¢;«fE†½š1–C69÷¼«ÆœaKô[9zç²åh\ZD6LÎÂıJS¯.˜“³ğÖLÒTø&«›	T,—CÎ”é]™ÜäK¼~à\\ÎA ÙÊµ¿Ú4±›s~}1§t´e_Ï;7~®³Ur9½ÜæEª½¤ÇTÃ¾S é½ˆƒ‚z;G>l	­0‘®1Ó¿Ä<ÕÌ¸˜|EEr	\"DùcçG÷r¼$è\\3ô\\Â=‡üqO;.!5ñ–‚î“Bîüã…»¶Š±É­ÅØ3ô{¡D·¶«»\0¢€Š±_€©aÚ´unÔiÑ„Ig¥›o_}2fÛËüŞ<¾ ^gwthRBîUÂÃ^Î]në¦ªãÉ™»™hæ–pU..3Çm×dd¥¥›K\'¾¯–ÛÆ¾{±³”J¼ÑÆ±æT[FY6iˆM ™s.«ôîQ¾ã^ômQ-¯›1w“»4tÁ›VÏ¹Ü…u¦pI\0âóóRİ¤ŞkÓô³¼œA÷WfvÉ\\­Ç€4Ğ¨«)1â/‘çq|æšŒ”šˆe@‘Ò¬Ô\'÷É\"fØm‚¢\\Üs	6ØœSZ„dƒhrv\\lõpç˜` ”À:/ìöÊpX\'¢LŒ×&+ä=cÂ[\n‡¥S´©ÇÇG‚(ã¡`ÂÔâC=u1œz[\0³?ûôÓJ™¯ÉóÖ!Æ”0¨¹Ç‡Å‚$ºŒshÇŞ…Á]´ëòˆ“Iù8öáS©4şğ°· ¹Mxıeém®Ê+zÒbzÃÆƒˆÂSF˜´h«OxkælŒ^‰ì«\"Y:ˆD\ZBs¶Ÿ¬5;SZ¤AâÌm°”µ¸\rÎ×‰èæ–Ö´åd¤Ì¥8ö„¢j\n¦¶ÒªlÔ)Ó\né)À(ùBË£…?Iœb8…±®MØãcUí(v	nNÓ}ñí»bÜÍ>»˜Ë°\ZÎïú|Hà«šë§Ò¯9\r£bh²<õöšw ®Ë°ŸpÄU¤ŠÊúêTma²ôëØHÔN”?a2UÖD.êÓNIk9èV}áŞ,cr%úñ‹A¶¦Í¿Ó®Îä–ÉåQO™Ï’mÙ.nPµ9[û©-úìÜ[¹cóÔâûw¾hS8ºq¤ÑN™øOƒn×™O71ÁV&ÁIGV³1LŸÈ ÿWÑ_Ş®«º]nÛqğVÂ×Àç£¶\Z¡6?’Û0cŠ×¤ä=’–Ogtƒ®„Àp	ƒÍ][Í)ó×g599¼Í×~)èÆÓ:ñ²rp›íëçÓÛ<¹áÒï,Ïª‘:¸{j·Íû@6}=ÿg˜|­…E»ÎF¤ôªÕH®ß6âÀ{Å¥X=à4ŞÜ|0Jk@éTK6\r`R²Ohœ°Ã!¥y³)’»Ñ8Y¤Ò Â’CÀ\Z©õğpÔUud~Š9B™!0öOèÒ;Ÿ0ÖV…œ&ªqİÃŞØ+XOuNYÉÅhèŞ,:ƒ„=7É07{İqì:À¦xÍª{Û —v}ş#|K|XêâÑ	9é ª+3ÎTııõ_ù~Ê“8vè4õ»â@A>\nùÊ]ñîqúÎ“»e¡‘Á<ÉŠÕËË«Ñ\r¹€¸˜1P»ÁN d³®aòO0j6™0>õÊPT¶ñö=MÁ_¦i~VñÎÆ+Ñ;ñ&õı÷ÁÉŠ\\z_Ã“`Ç‡;t‡ĞĞ±ë94û¾Í\ngòVQñ,â8Ÿ_f d±mÄ6ÛË†ã¿F”-SDg.¯Îa~İ}ÉÇf€Ô¯å¯ep?I$¸84ävÆíá}luşµËxí»¦Ù%zB.ôÖWWqÌ<w>/H±>·SÃ96h)„ö³\rwµ+éµ5ÅÄÖRç.]èúˆÏ‡m.ùÀU6WJh·ŸÑ7†¾“ŠâËMxR,±>./åÎ&ºêX/lÕÕUùtÍ‡’ŞSM´†òq	±-İ¥Z`GHŠ»hó›¬6FN„}GrÿÙà± ç[ÇxhÏB@ã&4ºzrƒD®`zo6R\0::á\"‘!iÚÍ gJ\nÚ>jæ5FÑÊ?fxi5ªåöËoGqé­4¼p£Ë‘×g‡V5î\rˆ\\ç5š±“1şœ¹±J˜,ØÆ˜Íl\'¶UTm¾Tã\\ëMÕÂòô¦ÂÀsÛ‚´mK¶Œ©Îa\Z—#dÛùê„åíó¶M–kœË÷^wşh„zú¢z=bfR—Ú5ÊşDp9 c ¤àmuÌ°ÕTó\0‡•!ÔÅi¸$°{qûé¡ºÉùR-½\r,T®ûŞf½Í\'Xd‚ç#ú\\!Ÿ®’Qp¬’	HÚ¬.Ñó&/¯G{¦.º7!¤`–ÃÉ‚‹‘Ÿ®íCˆñ<fkò¸b±3—ER^C}xh\0$Î‡‚˜E\r\0×n¾\ZOˆ¼àÁ´È\"×57IQŒ®êìÚâ‚ß¼X3Ğ£Ğ@>òupi¯Åw~v‘O§0RùkÊïÀ”H{J0Zá…¸æ\\šÈ¢»,0<¤<#0Ò{8Ù¡D È}©ÈS1:°!*‹R3‘A³uDMÎèïnñu6ü[Âì|-âªä\\Cù–è®~}U#s’.‹k_)s²îF\\#Ü;s•FYµæ–öë°+>•J2ÀdTİ¹Õ_¦Œd`g;P¾Úâì<‚ÓêyOä)Ç½]¯GÑÉIÉ—è4c•gÎòHI²¤EÙ§e±…dÊgD=™\r-„;iø4R÷Nwæó ‡]Ÿã[—ÅC­ğÍæ_¾À’s\\ıæœ˜Ó¬ÊV\"³L—mæ¦‚]VìñøĞ_ç;?zWïrô/¡ßÍøÂ\"íüöÍÛ½”­u©$ÒİÓˆ%ì;tÈmÓÇššûa2oGç\Z¦‰À†¿ğB1şßPç‹ŞcuÃÇ´ÇœLJ±X×0Ìieë\\7Ò©%aÂ¹-n¬eºÛ‘¥?l‚PİìêlS5xiên²¬«¦©32l,»NÔêÁ:¦„å¦CÁ`+¯ûæÇdËyUOñ¢*ìæDòƒğk9‡å\r4 ¿fw1UüæŸÍÎşÃ½ñ–\nÀàŒ)$°ì\\œÒ8´«~â×:\08ëË[¶56¦^Iÿ‹êM¸T˜àû@Á\\ü}L_ğ9‡_”bVáÅM²‰ïËå, O`bP|T¯à+áĞÃå%*:Àğ9&ršu°”‹OP\nÜUÿ™\0çïOj<P¬K-Ò(`¾J€]°_/+½}—™•g®ãš»-5ë¸+œaŞãè[híqB”ÃBú<ŠcÇÕÁ½3DNj²7g><>V>ƒZ] ·#5¬¡çÈÉö;qºœ¦Ö>#“ôDĞÇó\rxğ†kV¾Ù±\\»±!˜UØQĞÄ²‰o÷@‡Ğ:÷Ah³w6h	e™uiºßİ\\V…ê,\ZàDozx´¼,³\ZPÆ@ß#€ş‰4“cˆ]­ˆ˜4s¡„ÎÌgHj6@,cXçËx‰•‹³p»àëfu~#æK5øçËÑéa±ØÎàw¹uÒ€ä­sXÑfKò„»>ç}¼hÄp$Aa‡1½©yXCô^{sH>Ë³d4ïMÏĞà½m``ŸqÁgÁ	ÿ8	áış:Ç¨dæ¹Š†×0˜…ü)²ÆŒ·™%Ñs\\Âm7„G½“êì†3˜`ğş	Õ²9ĞáÀó789Éwƒ‹>z4d.uÁÇ¦JÉ¬*$UMzîíŒÕÛzù“\n;ª¡ÎS¶A æ¾öãã Î÷Št®“gråµ7Jª-ÂUÖ•WËÁ8¾BåkQÖâ`­ÇPöĞ„´Vì¨E-¯·?¢”ö„ jO\"Ë°‚2UÑ¦Ü¥fèNĞe±­BÉ8±v4F.X¿Èan…›‹kÌÿÔâÜü(læ¸E-Ô{V~_=‰<jĞí9_ûCk2Ì!~0Î7{»Rz°C8¯éDÀ¼ÄÁZôùlÚì™§¡Šã«jHØİÒè¥ú1ŠGnø¾Iá?>a?İŒÑí\'$ _ØR8€Oê­õşŠz\nyÑ\\ç›Ÿ@İp0ù¥ºmü—£åª)ü>>æº¿é°\Zî}M+¾>ƒBÊ28»O*ãµJ\Zß„2#uyÙdJĞ0ÊSˆ‡T,ĞiV<(Û,€fú-âÃ1y\"´¦\"G;ç«—:Ó£F¸–é,:u\n‚@l%2&<ATw‚X¥:qŞ›‚­ĞÌfsŠÃ}‚² ŸEuáXƒÃpk–‘O#*×mİSAù½Áåµ¾!¶á‹úÖãÑ›;JN›6jêeÄxNµX€½h}7»®‹¨ÑrM¬åÒ©ï‘¦±^¡\0(M9œÒ·”bªK	ñ%ÃrN YíŒª­u˜¤[÷™ˆÔ`è‹Šø~šu1RÆmy;qM–G¢CÒÜÆ†$ægÓ½Ü%Ûk÷f³Õ•§´ˆ›á—ÎÃ2^ïÆæÉM-Œ¤d#óÂË´ŸÏpCta<9~£¡5ï(ªãqn×?÷AåtñXyMùNâB=õÒˆvğ,ÜãSÛf‚x\0\Z$\nÍk~š§\'¾!e=#J±Oä2x³`‡ï˜SAáou‹©YÈSp¦€~nŞ/]º+:¹(÷ÑMÚŠ4\ZOª­‰–ê	¾2óÕuıYÏêÎ‡øÉm©4‚ßcoA×7¾$pqµ‰{–$§ˆıDôÓ¦šöcCÕ%¾ÆÔüù)J.í´±—Á(j».²×¬~0o‰ÓÒeï‘NTC58¤\'s¼â™Y]©¢:Óc´4ıT³ÈŠˆ:a´Ñ€©î4ÛË›¼= ;¯M\\Ğ9n¿¯«›ï«úÆSw_lÖü:={y•EıÒtÖ\ráHZœuYßĞm/ÿk\'ªŸLJb®ôí]Ù®1pİ[N¼pG­š8\\ÅL(·Cjx‚¨rSŞí*âõÌ:UÂ|~ ´‡	¶Ò‘ÑÜõ„Í7¦÷,Ví7š:+–ÄÁÔ>\"nµ´7Ø:÷PÕ|D¨¾˜…í NÒZ¼>:ÈÏó>÷ßäã o2Ê8è¬ñ^‰×3Ş^P<ú0ÄšÑ·KQ@¶ªI“mfû¬(©Hï‚¨÷¦k}ù<‘«BFgŸ\\—6vI1srBÉfJØAĞ@çÜ8,‹±DGúËW#[Îèö&,ÜÜ.a°Rû§otå)ìSôo˜Fª\nOTõiÍP¾ ¶Ì Z«µfºªjmRæ³ñIš)«âøºæ·Ûæ®ƒÍCm¥IÚy0ñ€ŸÃZsÉ?úwvqê¾*nŞ¼g]g©b¸~HìkxŠt]%Ø>gåRşÛêÆX“„ırÊÕa—9=ğÎµ¿’ìS^ô”}$$?e—~ú)e²äU“Yy¬q˜-…¾G¤ÂÈõÂU0Q\r¡våĞë“Òªq…Pıa›’3ø‘‰jØhgqŒLe†í#yº{\nõú%½x£+gÊ/½îœîİˆ 6z&*¨‡\'?wğ{¡Xã(nHG›8òSìhİ ªôaºÚ›äiõ*o8ÄjtÔAäê´ÿ\" ôPeTOé1—¥ÒˆÉò„âçé»2Ç¢İQ¤°Xí(?Ìë< Y)9ÊÅÑºÄoÀ‘÷–øÑŠÄÀİô¿ĞÖ;õ°±Åq6ÚÑoŠÆ-pµT/iÒŠµ\Z.ÊH\'_³œõÌğP€\Zè)Zğ\'Pg;b³&vƒM=Ú¸¶]ğ18Áãe­s–\'Åä2‡*dw—] ã[Ô¿µ7F³	(‡˜ºáMˆÊÄ	Mf@~ø\0 ?|ø\nóÄ}ı\r‹ŸøÀ1òâk­ARÎ•ûB‡ôtĞ¡ƒí=S›ëÒôìDÑŞcæÑ(îQ iFÒ­‡_ğàW4Ë’Ä^ì  wÆ~Äµu(Î\r!]m(F`©}#%¥zœ°=ë7Å]¥³²n`>W¯Êß?3W#R¨‹yÿêï/e\nÿº#ìd½²‰%ŸùPåú?¹ÇSv96‹I„Ñ4á¹SÁ¦Iüv÷T³ÛÃ§ ÎKH_x3&WeZÜ˜`öŞqâC@i^Î±õ!,9ùUÉµE\r²º%‰5]¢E6J3Œ;<2F“yš¾9KÏ*je?ôc¥8ƒè…ôx7Éü.<Ø5ò´Q|jIzÃl¼ÖKêéôêe¸?ÔÆ£‹éĞDü³sÉéĞÙ§­İİp®ø¨Å—Â)†¬\'ãà[Üe£¼½T q¨cÚâı/¯ú T©7-£L“‚6ş\\½Ñ)TŸü+6Ÿ7¹DÍô\"6W¬Ôrljê33¶·Hvœm7´‡–„àOğ-LlÏ(Q$Õ°TPòêLbz<ÒoÙÃ~Õü\'°8ŞŸÌt&ª³¡n2úN@²sõ>>Ş«J|¯˜)Ê)ã°«[Ïš¬ş˜/³æ™ª÷Æ@õ·V›¸®\Zp=U•%r§¦ãÎè¡“Ô¡¢ãó	”m¶%ğ±GZí5zŞNRİ¼¦©†óQuÍÃ©j@×S]ı÷ «KDoÚ\'5H‹	>H%Sÿ-(£_’Û^e€œPÍ,Ö•‚Îçûab¯PÁ.Xp–y!\0~‚/`â(!5ùıQáœÊ·èº–Ê/H·ŞÖYou+T³£s!Õ,4å+İWÄÀw¥î}@¥wñµb	İhÇÑ?TÉçâŒãr3Ñ÷yQŒ^h<W¸°,äq£8ö£»Ÿ¹”ŒíÇ—C=ûØøóÑB~„½)÷ÌHOåØ9rÂiûÈ_Ræ.ï?R¸oMRiÎJójƒoaj¸º»È0°[èHwZSß—ù*Ïğ-WıÆQ¬éÊ0^”ñ­…Ë»	ş\'(Ã`ÔëÑìÛHôe‚`«%G{è¬[IùkĞŞ‘ª],ˆz4ùıÌìjuØD9 °™š4_Ÿ‘5ãËïÆÁÀÌ£:5å„F·y»Ñ³Ñ:Àş0ºMš=ìƒræòb¸…ÊI0ıC`y/Ú\rÇñ™¥CR=¢0DHq¨Ëİw›ì8l&›Äù;µ!díeË„¡CwôAA£)İÑl…v½—‹ñKÚ„¯Xöî¢d¤÷£D*´´ç§ÛUu íêæ}¾“â8jEÔ;ŠÏü»ÓÀ~a<…Ü+Ó˜ë²\Z{ëCn©Ca+©wL5Ğ\'ã„?Å‹=š,ˆt@cJ±¼X\nG(\'”×vhI»EuÂ¬\0Dı­àõ8Æh«ÄïÚOcGİØoƒĞx™;‘áimU¸­!‡áCCâúJfV´Ïˆ¬\\ù€Ü¡ûİ·? ğ°ÄH*W\0S¥}Ò–ìODÔwMV)[\"jÿô!f\'Ã”fôÏŞ6Ÿ+X;|’‘“û´tı†“<¥ÁŒ’îÕO»Ø\'Ğğ¢PÒ5’ùÆ{Ş%QôKcÌö<ïÑ°\"îŞyúğpd=[üÇéÉ3/PÈë1ÆÛœ¶ÂÉ-ü5»{xÀßr!Œ?äæ4ë|Õ:şèÆç“Î­ø0€‡eSd9ù®Åf§Ô°%î2™m›oïh•q«»C•}†¡D¼œ\0d#ã¶ú¡ºÍêIÃ/\"$üb«8UšCsÆYU—ñ÷KQOixã\'MúhÖ~ÇC§oåıÌÄ\ncçÌY9ƒŠ)¶OìÆŞ¶¢7zm`Àİñˆ~‡Ú÷zàîø>Éıh[·‹Î©A•“¢q{àÉÍõõŞ·¾oaÃ,7×;{«mÉt=ş°\'Ìİ—(Ä{}ÏÃæİ§Àú¦¿õ*w¯ ¿Îîb¯[êEßNè»ÿ`çG\0OÇÑqµ‹½%«Û´óÈTj”æãã6=>¶Ş£MC¼\\bÚ%=¶Ï!\r’	\'utÒÕÙTÜ\Zï1šıNµv%VyĞÆ²µEˆßâºâ]9ß×n8½!wğî-Š¸Æ™š\0ú¢GßéCÿíyÂnõ¥	ßkÃF×¸Ê ØxÿË+y\\\\}êì•ÊXIèmÖl’eÆ9æÛ™Õ6DO™zã,·ğÕ§d«=8çª/ÉäıŸ<uN¿ç;ëÊ\nE³ãccÎÕ7TPè–Ëlv\Zácüv”ÊÔ=–ª(ù—é˜Î²tMWä[Jí{3Î)±2\0t/¨Œì¢‘õÊ•ãmÍIÚ\'D%Äú—ëÔ¹¯h\r6ì°Æ4‘âPß¯¥=ñUŒãSbÙ#şÙõó—%=K9¹ğPœÌ-ƒ©Æç]¡Ì@Œ(\'´[±“Æız€û¦½.VÊy4rq\nÕœ!K©L`İØ­öŞéNr¿÷øñAË§rõÙE^`w ­jË¡Özà\n6ÇÅµc‡&+àCî˜şÎciGáW—ÃqU@sE·ÿ–{€İ…EAÁr( å¨ï¦üeôÅwAİ¶á DºƒF_;•¹öšqG«Š7\rN®óÈcp\Zê•ó \\ïp>å÷àé>h WˆØÂ*»aIùLáSîW¸çƒH€)°ÍÌ»sì¹ôùMGE´ı¸Ù;ö³ÍÉ9§×ÉÕ9Ä]>æj=ïšú‡¬æ€_sâİ§ï‰@\'gâ‚âííİ»]‚Ñõ\"6(ìÌ¸Nñ[­ú‚ğ Âºê…eõ=/üCßSšU\rUíÛ\0‘†m- õ2Â{tÿŸİ¡ƒ¾v¤XÏ%P\\ÚµZYË»¯Ø<vË’òÍòïi6”«•W¯Á<¼niM¼5yhZµ¾½Û7‹IPøÚ÷+äxúŞ Îµ’æJ©«> – ªÁ\0£~ãé\Z¨È>â”Ï1É‚C¿h\'sûº­6Aø\rÌät›wŞ\"Ô^U‹;¯Î’M}¤|ï©šZËìt¾ÄkXW¥6õI«)o\\ï}ı×¨¾v{\0y\r›ÊÌûJyëg¦îK~z£ ’\\É\rKTˆÖc	ó|¥SbO7ê1Å¦öË.ÒÅ¦\"Yó7\n)G‘}É¡®A	åyeŠà¼Æx¹V¡4¿qË¼Ë‘”iZØŞÅÿë?9bj™%õ8,Ó»¯b.š—ø¬µ)q¢°™Ş…_sMhvz7‘Šö\rçn¿~®\Z\'L±”ë\"ßô•»ÉÓxl`6caz÷ìO¡ä’\n¼Çq].AÉì@…ß_©Úòœ	ŠÎx@WíÑê¨|4¸¬[·v­}\Z¸Ôp°NHÿğ qË2¾µ†ÆAHç¸Ÿ1Ø\r2±\"Ê§ÈGŞğØíü-”Äb;pqí)Ğw‘Í¾­¶Ä¨L°‡7·¬9ôm7§ú ‚£ïõÚ¡ëœ__³j~UÂÊ	tÔï&raGNº·ÜÔMŸş²mxŞİúX”ÍMıBJß­2bC¹jjJ³]E+³ÛZüº ½ÊÓàD«\0\'şRrÌqF7~¾¡e¯¿*‹Udt>ûí1âÈ‘\\_–ÚÇôÙ~´ÚKÂà·Úş',1454486437,NULL),(9,'HhYIPhwICdgu','phabricator:celerity:/res/phabricator/db7e9c40/rsrc/css/application/conf-FF0yol9jSjnp','deflate','•TÑ®¢0ü³½EÑò´Wå?ZZ ÙÒ’¶¬ì’ûï[´U\\wCbLÚÎÌ™sæ|hjÚ0­[\n0Ê”J¶‚ô\r\"„‰Fë¦Â¯÷š®(ç}:paÄT0Ù…M—ÖH•LÀhg ÖHïM‡†«¢(R,¡\nFö²–œ‘`õ™³Ó÷t&Ş[ÈñPˆ°VÃMÓy˜AÓÏœÏ\"ƒ0§ı(0\nÃo3X.9G¦pşóRÊ^`ªŞĞÎ\0ÄY) beeÒ‘c3P8Efûìÿ©ÎE\"ÒÿÿÓFÍ\rxÏÙ¾ëEİò\'U—ĞÁ§fÆôÖ=© æö¥÷üüy>Ï7†¡1ñ£LZ÷…\\èàÄ’À˜ĞFµ¹aRèñªf¿)Œ,RêfÊ™  \ZÖÃ.\ZÀÒY/x1P€³ŒÄƒ×šÆêWy¸9¬±OB°§òN1’¼–4âù^TÓ™/ŞÅÇíñníì¼êtlÜÚëo€AŒOáF6ĞõfÚ™V{Œ¯\rñ*÷ë”mOq:•‚ód¿IFÔ;x}€¦F8Qğl¸Š¾ƒ’bø9`’Q$Ãç›®±v¨9-¼Ó9*°b„Pqo7Tİ~Új·Hï{õ*­®‰QTlRgåTªÜöîœe<†d*v}Ø‡øğÎÚ\\Š‚•OÎúnù´hvíÍd´¾.~›Imµ˜_Ü.Y¦rN}Bq[ºÓµwb=DüiÃNú“8I’Ó×',1454486445,NULL);
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
INSERT INTO `cache_markupcache` VALUES (1,'fo7P4TuH2YZr:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-note\"><span class=\"remarkup-note-word\">NOTE:</span> Any user who can browse to this install&#039;s login page will be able to register a Phabricator account. To restrict who can register an account, configure 1Z.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:103:\"<a href=\"/config/edit/auth.email-domains/\" class=\"remarkup-link\" target=\"_blank\">auth.email-domains</a>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"shot\"}',1454486469,1454486469),(2,'rVwVLSGl.Y9K:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:240:\"<div class=\"remarkup-warning\">Examine the table below for information on how password hashes will be stored in the database.</div>\n\n\n\n<div class=\"remarkup-note\">You can select a minimum password length by setting 1Z in configuration.</div>\";}s:7:\"storage\";a:1:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:68:\"<tt class=\"remarkup-monospaced\">account.minimum-password-length</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"shot\"}',1454486469,1454486469),(3,'nHato9WQIj8d:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:3488:\"<p>When a user types their LDAP username and password into Phabricator, Phabricator can either bind to LDAP with those credentials directly (which is simpler, but not as powerful) or bind to LDAP with anonymous credentials, then search for record matching the supplied credentials (which is more complicated, but more powerful).</p>\n\n<p>For many installs, direct binding is sufficient. However, you may want to search first if:</p>\n\n<ul class=\"remarkup-list\">\n<li class=\"remarkup-list-item\">You want users to be able to login with either their username     or their email address.</li>\n<li class=\"remarkup-list-item\">The login/username is not part of the distinguished name in     your LDAP records.</li>\n<li class=\"remarkup-list-item\">You want to restrict logins to a subset of users (like only     those in certain departments).</li>\n<li class=\"remarkup-list-item\">Your LDAP server is configured in some other way that prevents     direct binding from working correctly.</li>\n</ul>\n\n<p><strong>To bind directly</strong>, enter the LDAP attribute corresponding to the login name into the <strong>Search Attributes</strong> box below. Often, this is something like 1Z or 2Z. This is the simplest configuration, but will only work if the username is part of the distinguished name, and won&#039;t let you apply complex restrictions to logins.</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Direct Binding</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p><strong>To search first</strong>, provide an anonymous username and password below (or check the <strong>Always Search</strong> checkbox), then enter one or more search queries into this field, one per line. After binding, these queries will be used to identify the record associated with the login name the user typed.</p>\n\n<p>Searches will be tried in order until a matching record is found. Each query can be a simple attribute name (like 3Z or 4Z), which will search for a matching record, or it can be a complex query that uses the string 5Z to represent the login name.</p>\n\n<p>A common simple configuration is just an attribute name, like 6Z, which will work the same way direct binding works:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Simple Example</div><pre class=\"remarkup-code\">sn</pre></div>\n\n<p>A slightly more complex configuration might let the user login with either their login name or email address:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Match Several Attributes</div><pre class=\"remarkup-code\">mail\nsn</pre></div>\n\n<p>If your LDAP directory is more complex, or you want to perform sophisticated filtering, you can use more complex queries. Depending on your directory structure, this example might allow users to login with either their email address or username, but only if they&#039;re in specific departments:</p>\n\n<div class=\"remarkup-code-block\" data-code-lang=\"text\" data-sigil=\"remarkup-code-block\"><div class=\"remarkup-code-header\">Complex Example</div><pre class=\"remarkup-code\">(&amp;(mail=${login})(|(departmentNumber=1)(departmentNumber=2)))\n(&amp;(sn=${login})(|(departmentNumber=1)(departmentNumber=2)))</pre></div>\n\n<p>All of the attribute names used here are just examples: your LDAP server may use different attribute names.</p>\";}s:7:\"storage\";a:6:{s:3:\"1Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"2Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:40:\"<tt class=\"remarkup-monospaced\">uid</tt>\";}s:3:\"3Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}s:3:\"4Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:41:\"<tt class=\"remarkup-monospaced\">mail</tt>\";}s:3:\"5Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:45:\"<tt class=\"remarkup-monospaced\">${login}</tt>\";}s:3:\"6Z\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:39:\"<tt class=\"remarkup-monospaced\">sn</tt>\";}}s:8:\"metadata\";a:0:{}}','{\"host\":\"shot\"}',1454486525,1454486525),(4,'.4EOg8Xw88WD:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:189:\"<p>To search for an LDAP record before authenticating, either check the <strong>Always Search</strong> checkbox or enter an anonymous username and password to use to perform the search.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"shot\"}',1454486525,1454486525),(5,'2SwALNO6Yg70:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:315:\"<p>Optionally, specify a username attribute to use to prefill usernames when registering a new account. This is purely cosmetic and does not affect the login process, but you can configure it to make sure users get the same default username as their LDAP username, so usernames remain consistent across systems.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"shot\"}',1454486525,1454486525),(6,'H_JFmx5tn1ir:oneoff@15@7VwBk7PApozc','a:3:{s:6:\"output\";O:14:\"PhutilSafeHTML\":1:{s:23:\"\0PhutilSafeHTML\0content\";s:253:\"<p>Optionally, specify one or more comma-separated attributes to use to prefill the &quot;Real Name&quot; field when registering a new account. This is purely cosmetic and does not affect the login process, but can make registration a little easier.</p>\";}s:7:\"storage\";a:0:{}s:8:\"metadata\";a:0:{}}','{\"host\":\"shot\"}',1454486525,1454486525);
/*!40000 ALTER TABLE `cache_markupcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `c426f39125b21bba_calendar`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_calendar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_calendar`;

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
-- Current Database: `c426f39125b21bba_chatlog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_chatlog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_chatlog`;

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
-- Current Database: `c426f39125b21bba_conduit`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_conduit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_conduit`;

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
-- Current Database: `c426f39125b21bba_config`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_config` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_config`;

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
-- Current Database: `c426f39125b21bba_conpherence`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_conpherence` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_conpherence`;

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
-- Current Database: `c426f39125b21bba_countdown`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_countdown` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_countdown`;

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
-- Current Database: `c426f39125b21bba_daemon`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_daemon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_daemon`;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_log`
--

LOCK TABLES `daemon_log` WRITE;
/*!40000 ALTER TABLE `daemon_log` DISABLE KEYS */;
INSERT INTO `daemon_log` VALUES (1,'PhabricatorRepositoryPullLocalDaemon','shot',40,'[]','[]',1454486210,1454486570,'run','root','40:p7jtudtc5'),(2,'PhabricatorTriggerDaemon','shot',40,'[]','[]',1454486210,1454486570,'run','root','40:xiowlo7c6'),(3,'PhabricatorTaskmasterDaemon','shot',40,'[]','[]',1454486210,1454486570,'run','root','40:efkl4qho3');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daemon_logevent`
--

LOCK TABLES `daemon_logevent` WRITE;
/*!40000 ALTER TABLE `daemon_logevent` DISABLE KEYS */;
INSERT INTO `daemon_logevent` VALUES (1,1,'INIT','Starting process.',1454486210),(2,2,'INIT','Starting process.',1454486210),(3,3,'INIT','Starting process.',1454486210);
/*!40000 ALTER TABLE `daemon_logevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `c426f39125b21bba_dashboard`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_dashboard` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_dashboard`;

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
-- Current Database: `c426f39125b21bba_differential`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_differential` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_differential`;

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
-- Current Database: `c426f39125b21bba_diviner`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_diviner` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_diviner`;

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
-- Current Database: `c426f39125b21bba_doorkeeper`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_doorkeeper` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_doorkeeper`;

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
-- Current Database: `c426f39125b21bba_draft`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_draft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_draft`;

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
-- Current Database: `c426f39125b21bba_drydock`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_drydock` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_drydock`;

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
-- Current Database: `c426f39125b21bba_fact`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_fact` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_fact`;

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
-- Current Database: `c426f39125b21bba_feed`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_feed` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_feed`;

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
-- Current Database: `c426f39125b21bba_file`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_file` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_file`;

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
-- Current Database: `c426f39125b21bba_flag`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_flag` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_flag`;

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
-- Current Database: `c426f39125b21bba_fund`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_fund` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_fund`;

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
-- Current Database: `c426f39125b21bba_harbormaster`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_harbormaster` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_harbormaster`;

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
-- Current Database: `c426f39125b21bba_herald`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_herald` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_herald`;

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
-- Current Database: `c426f39125b21bba_legalpad`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_legalpad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_legalpad`;

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
-- Current Database: `c426f39125b21bba_maniphest`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_maniphest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_maniphest`;

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
  `attached` longtext COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `originalTitle` longtext COLLATE utf8mb4_bin NOT NULL,
  `description` longtext COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` int(10) unsigned NOT NULL,
  `dateModified` int(10) unsigned NOT NULL,
  `projectPHIDs` longtext COLLATE utf8mb4_bin NOT NULL,
  `mailKey` binary(20) NOT NULL,
  `ownerOrdering` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `originalEmailSource` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `subpriority` double NOT NULL,
  `viewPolicy` varbinary(64) NOT NULL,
  `editPolicy` varbinary(64) NOT NULL,
  `spacePHID` varbinary(64) DEFAULT NULL,
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
-- Current Database: `c426f39125b21bba_meta_data`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_meta_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_meta_data`;

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
INSERT INTO `patch_status` VALUES ('phabricator:000.project.sql',1453226118,NULL),('phabricator:0000.legacy.sql',1453226118,NULL),('phabricator:001.maniphest_projects.sql',1453226118,NULL),('phabricator:002.oauth.sql',1453226118,NULL),('phabricator:003.more_oauth.sql',1453226118,NULL),('phabricator:004.daemonrepos.sql',1453226118,NULL),('phabricator:005.workers.sql',1453226118,NULL),('phabricator:006.repository.sql',1453226118,NULL),('phabricator:007.daemonlog.sql',1453226118,NULL),('phabricator:008.repoopt.sql',1453226118,NULL),('phabricator:009.repo_summary.sql',1453226118,NULL),('phabricator:010.herald.sql',1453226118,NULL),('phabricator:011.badcommit.sql',1453226118,NULL),('phabricator:012.dropphidtype.sql',1453226118,NULL),('phabricator:013.commitdetail.sql',1453226118,NULL),('phabricator:014.shortcuts.sql',1453226118,NULL),('phabricator:015.preferences.sql',1453226118,NULL),('phabricator:016.userrealnameindex.sql',1453226118,NULL),('phabricator:017.sessionkeys.sql',1453226118,NULL),('phabricator:018.owners.sql',1453226118,NULL),('phabricator:019.arcprojects.sql',1453226118,NULL),('phabricator:020.pathcapital.sql',1453226118,NULL),('phabricator:021.xhpastview.sql',1453226118,NULL),('phabricator:022.differentialcommit.sql',1453226118,NULL),('phabricator:023.dxkeys.sql',1453226118,NULL),('phabricator:024.mlistkeys.sql',1453226118,NULL),('phabricator:025.commentopt.sql',1453226118,NULL),('phabricator:026.diffpropkey.sql',1453226118,NULL),('phabricator:027.metamtakeys.sql',1453226118,NULL),('phabricator:028.systemagent.sql',1453226118,NULL),('phabricator:029.cursors.sql',1453226118,NULL),('phabricator:030.imagemacro.sql',1453226118,NULL),('phabricator:031.workerrace.sql',1453226118,NULL),('phabricator:032.viewtime.sql',1453226118,NULL),('phabricator:033.privtest.sql',1453226118,NULL),('phabricator:034.savedheader.sql',1453226118,NULL),('phabricator:035.proxyimage.sql',1453226118,NULL),('phabricator:036.mailkey.sql',1453226119,NULL),('phabricator:037.setuptest.sql',1453226119,NULL),('phabricator:038.admin.sql',1453226119,NULL),('phabricator:039.userlog.sql',1453226119,NULL),('phabricator:040.transform.sql',1453226119,NULL),('phabricator:041.heraldrepetition.sql',1453226119,NULL),('phabricator:042.commentmetadata.sql',1453226119,NULL),('phabricator:043.pastebin.sql',1453226119,NULL),('phabricator:044.countdown.sql',1453226119,NULL),('phabricator:045.timezone.sql',1453226119,NULL),('phabricator:046.conduittoken.sql',1453226119,NULL),('phabricator:047.projectstatus.sql',1453226119,NULL),('phabricator:048.relationshipkeys.sql',1453226119,NULL),('phabricator:049.projectowner.sql',1453226119,NULL),('phabricator:050.taskdenormal.sql',1453226119,NULL),('phabricator:051.projectfilter.sql',1453226119,NULL),('phabricator:052.pastelanguage.sql',1453226119,NULL),('phabricator:053.feed.sql',1453226119,NULL),('phabricator:054.subscribers.sql',1453226119,NULL),('phabricator:055.add_author_to_files.sql',1453226119,NULL),('phabricator:056.slowvote.sql',1453226119,NULL),('phabricator:057.parsecache.sql',1453226119,NULL),('phabricator:058.missingkeys.sql',1453226119,NULL),('phabricator:059.engines.php',1453226120,NULL),('phabricator:060.phriction.sql',1453226120,NULL),('phabricator:061.phrictioncontent.sql',1453226120,NULL),('phabricator:062.phrictionmenu.sql',1453226120,NULL),('phabricator:063.pasteforks.sql',1453226120,NULL),('phabricator:064.subprojects.sql',1453226120,NULL),('phabricator:065.sshkeys.sql',1453226120,NULL),('phabricator:066.phrictioncontent.sql',1453226120,NULL),('phabricator:067.preferences.sql',1453226120,NULL),('phabricator:068.maniphestauxiliarystorage.sql',1453226120,NULL),('phabricator:069.heraldxscript.sql',1453226120,NULL),('phabricator:070.differentialaux.sql',1453226120,NULL),('phabricator:071.contentsource.sql',1453226120,NULL),('phabricator:072.blamerevert.sql',1453226120,NULL),('phabricator:073.reposymbols.sql',1453226120,NULL),('phabricator:074.affectedpath.sql',1453226120,NULL),('phabricator:075.revisionhash.sql',1453226120,NULL),('phabricator:076.indexedlanguages.sql',1453226120,NULL),('phabricator:077.originalemail.sql',1453226120,NULL),('phabricator:078.nametoken.sql',1453226120,NULL),('phabricator:079.nametokenindex.php',1453226120,NULL),('phabricator:080.filekeys.sql',1453226120,NULL),('phabricator:081.filekeys.php',1453226120,NULL),('phabricator:082.xactionkey.sql',1453226120,NULL),('phabricator:083.dxviewtime.sql',1453226120,NULL),('phabricator:084.pasteauthorkey.sql',1453226120,NULL),('phabricator:085.packagecommitrelationship.sql',1453226120,NULL),('phabricator:086.formeraffil.sql',1453226120,NULL),('phabricator:087.phrictiondelete.sql',1453226120,NULL),('phabricator:088.audit.sql',1453226120,NULL),('phabricator:089.projectwiki.sql',1453226120,NULL),('phabricator:090.forceuniqueprojectnames.php',1453226120,NULL),('phabricator:091.uniqueslugkey.sql',1453226120,NULL),('phabricator:092.dropgithubnotification.sql',1453226120,NULL),('phabricator:093.gitremotes.php',1453226120,NULL),('phabricator:094.phrictioncolumn.sql',1453226120,NULL),('phabricator:095.directory.sql',1453226120,NULL),('phabricator:096.filename.sql',1453226120,NULL),('phabricator:097.heraldruletypes.sql',1453226120,NULL),('phabricator:098.heraldruletypemigration.php',1453226120,NULL),('phabricator:099.drydock.sql',1453226120,NULL),('phabricator:100.projectxaction.sql',1453226120,NULL),('phabricator:101.heraldruleapplied.sql',1453226120,NULL),('phabricator:102.heraldcleanup.php',1453226120,NULL),('phabricator:103.heraldedithistory.sql',1453226120,NULL),('phabricator:104.searchkey.sql',1453226120,NULL),('phabricator:105.mimetype.sql',1453226120,NULL),('phabricator:106.chatlog.sql',1453226120,NULL),('phabricator:107.oauthserver.sql',1453226120,NULL),('phabricator:108.oauthscope.sql',1453226120,NULL),('phabricator:109.oauthclientphidkey.sql',1453226120,NULL),('phabricator:110.commitaudit.sql',1453226121,NULL),('phabricator:111.commitauditmigration.php',1453226121,NULL),('phabricator:112.oauthaccesscoderedirecturi.sql',1453226121,NULL),('phabricator:113.lastreviewer.sql',1453226121,NULL),('phabricator:114.auditrequest.sql',1453226121,NULL),('phabricator:115.prepareutf8.sql',1453226121,NULL),('phabricator:116.utf8-backup-first-expect-wait.sql',1453226122,NULL),('phabricator:117.repositorydescription.php',1453226122,NULL),('phabricator:118.auditinline.sql',1453226122,NULL),('phabricator:119.filehash.sql',1453226123,NULL),('phabricator:120.noop.sql',1453226123,NULL),('phabricator:121.drydocklog.sql',1453226123,NULL),('phabricator:122.flag.sql',1453226123,NULL),('phabricator:123.heraldrulelog.sql',1453226123,NULL),('phabricator:124.subpriority.sql',1453226123,NULL),('phabricator:125.ipv6.sql',1453226123,NULL),('phabricator:126.edges.sql',1453226123,NULL),('phabricator:127.userkeybody.sql',1453226123,NULL),('phabricator:128.phabricatorcom.sql',1453226123,NULL),('phabricator:129.savedquery.sql',1453226123,NULL),('phabricator:130.denormalrevisionquery.sql',1453226123,NULL),('phabricator:131.migraterevisionquery.php',1453226123,NULL),('phabricator:132.phame.sql',1453226123,NULL),('phabricator:133.imagemacro.sql',1453226123,NULL),('phabricator:134.emptysearch.sql',1453226123,NULL),('phabricator:135.datecommitted.sql',1453226123,NULL),('phabricator:136.sex.sql',1453226123,NULL),('phabricator:137.auditmetadata.sql',1453226123,NULL),('phabricator:138.notification.sql',1453226123,NULL),('phabricator:20121209.pholioxactions.sql',1453226124,NULL),('phabricator:20121209.xmacroadd.sql',1453226124,NULL),('phabricator:20121209.xmacromigrate.php',1453226124,NULL),('phabricator:20121209.xmacromigratekey.sql',1453226124,NULL),('phabricator:20121220.generalcache.sql',1453226124,NULL),('phabricator:20121226.config.sql',1453226124,NULL),('phabricator:20130101.confxaction.sql',1453226124,NULL),('phabricator:20130102.metamtareceivedmailmessageidhash.sql',1453226124,NULL),('phabricator:20130103.filemetadata.sql',1453226124,NULL),('phabricator:20130111.conpherence.sql',1453226124,NULL),('phabricator:20130127.altheraldtranscript.sql',1453226124,NULL),('phabricator:20130131.conpherencepics.sql',1453226124,NULL),('phabricator:20130201.revisionunsubscribed.php',1453226124,NULL),('phabricator:20130201.revisionunsubscribed.sql',1453226124,NULL),('phabricator:20130214.chatlogchannel.sql',1453226124,NULL),('phabricator:20130214.chatlogchannelid.sql',1453226124,NULL),('phabricator:20130214.token.sql',1453226124,NULL),('phabricator:20130215.phabricatorfileaddttl.sql',1453226124,NULL),('phabricator:20130217.cachettl.sql',1453226124,NULL),('phabricator:20130218.longdaemon.sql',1453226124,NULL),('phabricator:20130218.updatechannelid.php',1453226124,NULL),('phabricator:20130219.commitsummary.sql',1453226124,NULL),('phabricator:20130219.commitsummarymig.php',1453226124,NULL),('phabricator:20130222.dropchannel.sql',1453226124,NULL),('phabricator:20130226.commitkey.sql',1453226124,NULL),('phabricator:20130304.lintauthor.sql',1453226124,NULL),('phabricator:20130310.xactionmeta.sql',1453226124,NULL),('phabricator:20130317.phrictionedge.sql',1453226124,NULL),('phabricator:20130319.conpherence.sql',1453226124,NULL),('phabricator:20130319.phabricatorfileexplicitupload.sql',1453226124,NULL),('phabricator:20130320.phlux.sql',1453226124,NULL),('phabricator:20130321.token.sql',1453226124,NULL),('phabricator:20130322.phortune.sql',1453226124,NULL),('phabricator:20130323.phortunepayment.sql',1453226124,NULL),('phabricator:20130324.phortuneproduct.sql',1453226124,NULL),('phabricator:20130330.phrequent.sql',1453226124,NULL),('phabricator:20130403.conpherencecache.sql',1453226124,NULL),('phabricator:20130403.conpherencecachemig.php',1453226124,NULL),('phabricator:20130409.commitdrev.php',1453226124,NULL),('phabricator:20130417.externalaccount.sql',1453226124,NULL),('phabricator:20130423.conpherenceindices.sql',1453226125,NULL),('phabricator:20130423.phortunepaymentrevised.sql',1453226125,NULL),('phabricator:20130423.updateexternalaccount.sql',1453226124,NULL),('phabricator:20130426.search_savedquery.sql',1453226125,NULL),('phabricator:20130502.countdownrevamp1.sql',1453226125,NULL),('phabricator:20130502.countdownrevamp2.php',1453226125,NULL),('phabricator:20130502.countdownrevamp3.sql',1453226125,NULL),('phabricator:20130507.releephrqmailkey.sql',1453226125,NULL),('phabricator:20130507.releephrqmailkeypop.php',1453226125,NULL),('phabricator:20130507.releephrqsimplifycols.sql',1453226125,NULL),('phabricator:20130508.releephtransactions.sql',1453226125,NULL),('phabricator:20130508.releephtransactionsmig.php',1453226125,NULL),('phabricator:20130508.search_namedquery.sql',1453226125,NULL),('phabricator:20130513.receviedmailstatus.sql',1453226125,NULL),('phabricator:20130519.diviner.sql',1453226125,NULL),('phabricator:20130521.dropconphimages.sql',1453226125,NULL),('phabricator:20130523.maniphest_owners.sql',1453226125,NULL),('phabricator:20130524.repoxactions.sql',1453226125,NULL),('phabricator:20130529.macroauthor.sql',1453226125,NULL),('phabricator:20130529.macroauthormig.php',1453226125,NULL),('phabricator:20130530.macrodatekey.sql',1453226125,NULL),('phabricator:20130530.pastekeys.sql',1453226125,NULL),('phabricator:20130530.sessionhash.php',1453226125,NULL),('phabricator:20130531.filekeys.sql',1453226125,NULL),('phabricator:20130602.morediviner.sql',1453226125,NULL),('phabricator:20130602.namedqueries.sql',1453226125,NULL),('phabricator:20130606.userxactions.sql',1453226125,NULL),('phabricator:20130607.xaccount.sql',1453226125,NULL),('phabricator:20130611.migrateoauth.php',1453226125,NULL),('phabricator:20130611.nukeldap.php',1453226125,NULL),('phabricator:20130613.authdb.sql',1453226125,NULL),('phabricator:20130619.authconf.php',1453226125,NULL),('phabricator:20130620.diffxactions.sql',1453226125,NULL),('phabricator:20130621.diffcommentphid.sql',1453226125,NULL),('phabricator:20130621.diffcommentphidmig.php',1453226125,NULL),('phabricator:20130621.diffcommentunphid.sql',1453226125,NULL),('phabricator:20130622.doorkeeper.sql',1453226125,NULL),('phabricator:20130628.legalpadv0.sql',1453226125,NULL),('phabricator:20130701.conduitlog.sql',1453226125,NULL),('phabricator:20130703.legalpaddocdenorm.php',1453226125,NULL),('phabricator:20130703.legalpaddocdenorm.sql',1453226125,NULL),('phabricator:20130709.droptimeline.sql',1453226125,NULL),('phabricator:20130709.legalpadsignature.sql',1453226125,NULL),('phabricator:20130711.pholioimageobsolete.php',1453226126,NULL),('phabricator:20130711.pholioimageobsolete.sql',1453226126,NULL),('phabricator:20130711.pholioimageobsolete2.sql',1453226126,NULL),('phabricator:20130711.trimrealnames.php',1453226125,NULL),('phabricator:20130714.votexactions.sql',1453226125,NULL),('phabricator:20130715.votecomments.php',1453226125,NULL),('phabricator:20130715.voteedges.sql',1453226125,NULL),('phabricator:20130716.archivememberlessprojects.php',1453226126,NULL),('phabricator:20130722.pholioreplace.sql',1453226126,NULL),('phabricator:20130723.taskstarttime.sql',1453226126,NULL),('phabricator:20130726.ponderxactions.sql',1453226126,NULL),('phabricator:20130727.ponderquestionstatus.sql',1453226126,NULL),('phabricator:20130728.ponderunique.php',1453226126,NULL),('phabricator:20130728.ponderuniquekey.sql',1453226126,NULL),('phabricator:20130728.ponderxcomment.php',1453226126,NULL),('phabricator:20130731.releephcutpointidentifier.sql',1453226126,NULL),('phabricator:20130731.releephproject.sql',1453226126,NULL),('phabricator:20130731.releephrepoid.sql',1453226126,NULL),('phabricator:20130801.pastexactions.php',1453226126,NULL),('phabricator:20130801.pastexactions.sql',1453226126,NULL),('phabricator:20130802.heraldphid.sql',1453226126,NULL),('phabricator:20130802.heraldphids.php',1453226126,NULL),('phabricator:20130802.heraldphidukey.sql',1453226126,NULL),('phabricator:20130802.heraldxactions.sql',1453226126,NULL),('phabricator:20130805.pasteedges.sql',1453226126,NULL),('phabricator:20130805.pastemailkey.sql',1453226126,NULL),('phabricator:20130805.pastemailkeypop.php',1453226126,NULL),('phabricator:20130814.usercustom.sql',1453226126,NULL),('phabricator:20130820.file-mailkey-populate.php',1453226126,NULL),('phabricator:20130820.filemailkey.sql',1453226126,NULL),('phabricator:20130820.filexactions.sql',1453226126,NULL),('phabricator:20130820.releephxactions.sql',1453226126,NULL),('phabricator:20130826.divinernode.sql',1453226126,NULL),('phabricator:20130912.maniphest.1.touch.sql',1453226126,NULL),('phabricator:20130912.maniphest.2.created.sql',1453226126,NULL),('phabricator:20130912.maniphest.3.nameindex.sql',1453226126,NULL),('phabricator:20130912.maniphest.4.fillindex.php',1453226126,NULL),('phabricator:20130913.maniphest.1.migratesearch.php',1453226126,NULL),('phabricator:20130914.usercustom.sql',1453226126,NULL),('phabricator:20130915.maniphestcustom.sql',1453226126,NULL),('phabricator:20130915.maniphestmigrate.php',1453226126,NULL),('phabricator:20130915.maniphestqdrop.sql',1453226126,NULL),('phabricator:20130919.mfieldconf.php',1453226126,NULL),('phabricator:20130920.repokeyspolicy.sql',1453226126,NULL),('phabricator:20130921.mtransactions.sql',1453226126,NULL),('phabricator:20130921.xmigratemaniphest.php',1453226126,NULL),('phabricator:20130923.mrename.sql',1453226126,NULL),('phabricator:20130924.mdraftkey.sql',1453226126,NULL),('phabricator:20130925.mpolicy.sql',1453226126,NULL),('phabricator:20130925.xpolicy.sql',1453226126,NULL),('phabricator:20130926.dcustom.sql',1453226126,NULL),('phabricator:20130926.dinkeys.sql',1453226126,NULL),('phabricator:20130926.dinline.php',1453226126,NULL),('phabricator:20130927.audiomacro.sql',1453226126,NULL),('phabricator:20130929.filepolicy.sql',1453226126,NULL),('phabricator:20131004.dxedgekey.sql',1453226126,NULL),('phabricator:20131004.dxreviewers.php',1453226126,NULL),('phabricator:20131006.hdisable.sql',1453226126,NULL),('phabricator:20131010.pstorage.sql',1453226126,NULL),('phabricator:20131015.cpolicy.sql',1453226126,NULL),('phabricator:20131020.col1.sql',1453226126,NULL),('phabricator:20131020.harbormaster.sql',1453226126,NULL),('phabricator:20131020.pcustom.sql',1453226126,NULL),('phabricator:20131020.pxaction.sql',1453226126,NULL),('phabricator:20131020.pxactionmig.php',1453226126,NULL),('phabricator:20131025.repopush.sql',1453226127,NULL),('phabricator:20131026.commitstatus.sql',1453226127,NULL),('phabricator:20131030.repostatusmessage.sql',1453226127,NULL),('phabricator:20131031.vcspassword.sql',1453226127,NULL),('phabricator:20131105.buildstep.sql',1453226127,NULL),('phabricator:20131106.diffphid.1.col.sql',1453226127,NULL),('phabricator:20131106.diffphid.2.mig.php',1453226127,NULL),('phabricator:20131106.diffphid.3.key.sql',1453226127,NULL),('phabricator:20131106.nuance-v0.sql',1453226127,NULL),('phabricator:20131107.buildlog.sql',1453226127,NULL),('phabricator:20131112.userverified.1.col.sql',1453226127,NULL),('phabricator:20131112.userverified.2.mig.php',1453226127,NULL),('phabricator:20131118.ownerorder.php',1453226127,NULL),('phabricator:20131119.passphrase.sql',1453226127,NULL),('phabricator:20131120.nuancesourcetype.sql',1453226127,NULL),('phabricator:20131121.passphraseedge.sql',1453226127,NULL),('phabricator:20131121.repocredentials.1.col.sql',1453226127,NULL),('phabricator:20131121.repocredentials.2.mig.php',1453226127,NULL),('phabricator:20131122.repomirror.sql',1453226127,NULL),('phabricator:20131123.drydockblueprintpolicy.sql',1453226127,NULL),('phabricator:20131129.drydockresourceblueprint.sql',1453226127,NULL),('phabricator:20131204.pushlog.sql',1453226127,NULL),('phabricator:20131205.buildsteporder.sql',1453226127,NULL),('phabricator:20131205.buildstepordermig.php',1453226127,NULL),('phabricator:20131205.buildtargets.sql',1453226127,NULL),('phabricator:20131206.phragment.sql',1453226127,NULL),('phabricator:20131206.phragmentnull.sql',1453226127,NULL),('phabricator:20131208.phragmentsnapshot.sql',1453226127,NULL),('phabricator:20131211.phragmentedges.sql',1453226127,NULL),('phabricator:20131217.pushlogphid.1.col.sql',1453226127,NULL),('phabricator:20131217.pushlogphid.2.mig.php',1453226127,NULL),('phabricator:20131217.pushlogphid.3.key.sql',1453226127,NULL),('phabricator:20131219.pxdrop.sql',1453226127,NULL),('phabricator:20131224.harbormanual.sql',1453226127,NULL),('phabricator:20131227.heraldobject.sql',1453226127,NULL),('phabricator:20131231.dropshortcut.sql',1453226127,NULL),('phabricator:20131302.maniphestvalue.sql',1453226124,NULL),('phabricator:20140104.harbormastercmd.sql',1453226127,NULL),('phabricator:20140106.macromailkey.1.sql',1453226127,NULL),('phabricator:20140106.macromailkey.2.php',1453226127,NULL),('phabricator:20140108.ddbpname.1.sql',1453226127,NULL),('phabricator:20140108.ddbpname.2.php',1453226127,NULL),('phabricator:20140109.ddxactions.sql',1453226127,NULL),('phabricator:20140109.projectcolumnsdates.sql',1453226127,NULL),('phabricator:20140113.legalpadsig.1.sql',1453226127,NULL),('phabricator:20140113.legalpadsig.2.php',1453226127,NULL),('phabricator:20140115.auth.1.id.sql',1453226128,NULL),('phabricator:20140115.auth.2.expires.sql',1453226128,NULL),('phabricator:20140115.auth.3.unlimit.php',1453226128,NULL),('phabricator:20140115.legalpadsigkey.sql',1453226128,NULL),('phabricator:20140116.reporefcursor.sql',1453226128,NULL),('phabricator:20140126.diff.1.parentrevisionid.sql',1453226128,NULL),('phabricator:20140126.diff.2.repositoryphid.sql',1453226128,NULL),('phabricator:20140130.dash.1.board.sql',1453226128,NULL),('phabricator:20140130.dash.2.panel.sql',1453226128,NULL),('phabricator:20140130.dash.3.boardxaction.sql',1453226128,NULL),('phabricator:20140130.dash.4.panelxaction.sql',1453226128,NULL),('phabricator:20140130.mail.1.retry.sql',1453226128,NULL),('phabricator:20140130.mail.2.next.sql',1453226128,NULL),('phabricator:20140201.gc.1.mailsent.sql',1453226128,NULL),('phabricator:20140201.gc.2.mailreceived.sql',1453226128,NULL),('phabricator:20140205.cal.1.rename.sql',1453226128,NULL),('phabricator:20140205.cal.2.phid-col.sql',1453226128,NULL),('phabricator:20140205.cal.3.phid-mig.php',1453226128,NULL),('phabricator:20140205.cal.4.phid-key.sql',1453226128,NULL),('phabricator:20140210.herald.rule-condition-mig.php',1453226128,NULL),('phabricator:20140210.projcfield.1.blurb.php',1453226128,NULL),('phabricator:20140210.projcfield.2.piccol.sql',1453226128,NULL),('phabricator:20140210.projcfield.3.picmig.sql',1453226128,NULL),('phabricator:20140210.projcfield.4.memmig.sql',1453226128,NULL),('phabricator:20140210.projcfield.5.dropprofile.sql',1453226128,NULL),('phabricator:20140211.dx.1.nullablechangesetid.sql',1453226128,NULL),('phabricator:20140211.dx.2.migcommenttext.php',1453226128,NULL),('phabricator:20140211.dx.3.migsubscriptions.sql',1453226128,NULL),('phabricator:20140211.dx.999.drop.relationships.sql',1453226128,NULL),('phabricator:20140212.dx.1.armageddon.php',1453226128,NULL),('phabricator:20140214.clean.1.legacycommentid.sql',1453226128,NULL),('phabricator:20140214.clean.2.dropcomment.sql',1453226128,NULL),('phabricator:20140214.clean.3.dropinline.sql',1453226128,NULL),('phabricator:20140218.differentialdraft.sql',1453226128,NULL),('phabricator:20140218.passwords.1.extend.sql',1453226128,NULL),('phabricator:20140218.passwords.2.prefix.sql',1453226128,NULL),('phabricator:20140218.passwords.3.vcsextend.sql',1453226128,NULL),('phabricator:20140218.passwords.4.vcs.php',1453226128,NULL),('phabricator:20140223.bigutf8scratch.sql',1453226128,NULL),('phabricator:20140224.dxclean.1.datecommitted.sql',1453226128,NULL),('phabricator:20140226.dxcustom.1.fielddata.php',1453226128,NULL),('phabricator:20140226.dxcustom.99.drop.sql',1453226128,NULL),('phabricator:20140228.dxcomment.1.sql',1453226128,NULL),('phabricator:20140305.diviner.1.slugcol.sql',1453226128,NULL),('phabricator:20140305.diviner.2.slugkey.sql',1453226128,NULL),('phabricator:20140311.mdroplegacy.sql',1453226128,NULL),('phabricator:20140314.projectcolumn.1.statuscol.sql',1453226128,NULL),('phabricator:20140314.projectcolumn.2.statuskey.sql',1453226128,NULL),('phabricator:20140317.mupdatedkey.sql',1453226128,NULL),('phabricator:20140321.harbor.1.bxaction.sql',1453226128,NULL),('phabricator:20140321.mstatus.1.col.sql',1453226128,NULL),('phabricator:20140321.mstatus.2.mig.php',1453226128,NULL),('phabricator:20140323.harbor.1.renames.php',1453226128,NULL),('phabricator:20140323.harbor.2.message.sql',1453226128,NULL),('phabricator:20140325.push.1.event.sql',1453226128,NULL),('phabricator:20140325.push.2.eventphid.sql',1453226128,NULL),('phabricator:20140325.push.3.groups.php',1453226128,NULL),('phabricator:20140325.push.4.prune.sql',1453226128,NULL),('phabricator:20140326.project.1.colxaction.sql',1453226128,NULL),('phabricator:20140328.releeph.1.productxaction.sql',1453226128,NULL),('phabricator:20140330.flagtext.sql',1453226128,NULL),('phabricator:20140402.actionlog.sql',1453226128,NULL),('phabricator:20140410.accountsecret.1.sql',1453226128,NULL),('phabricator:20140410.accountsecret.2.php',1453226128,NULL),('phabricator:20140416.harbor.1.sql',1453226128,NULL),('phabricator:20140420.rel.1.objectphid.sql',1453226128,NULL),('phabricator:20140420.rel.2.objectmig.php',1453226128,NULL),('phabricator:20140421.slowvotecolumnsisclosed.sql',1453226128,NULL),('phabricator:20140423.session.1.hisec.sql',1453226128,NULL),('phabricator:20140427.mfactor.1.sql',1453226128,NULL),('phabricator:20140430.auth.1.partial.sql',1453226128,NULL),('phabricator:20140430.dash.1.paneltype.sql',1453226128,NULL),('phabricator:20140430.dash.2.edge.sql',1453226128,NULL),('phabricator:20140501.passphraselockcredential.sql',1453226128,NULL),('phabricator:20140501.remove.1.dlog.sql',1453226128,NULL),('phabricator:20140507.smstable.sql',1453226128,NULL),('phabricator:20140509.coverage.1.sql',1453226128,NULL),('phabricator:20140509.dashboardlayoutconfig.sql',1453226128,NULL),('phabricator:20140512.dparents.1.sql',1453226128,NULL),('phabricator:20140514.harbormasterbuildabletransaction.sql',1453226128,NULL),('phabricator:20140514.pholiomockclose.sql',1453226129,NULL),('phabricator:20140515.trust-emails.sql',1453226129,NULL),('phabricator:20140517.dxbinarycache.sql',1453226129,NULL),('phabricator:20140518.dxmorebinarycache.sql',1453226129,NULL),('phabricator:20140519.dashboardinstall.sql',1453226129,NULL),('phabricator:20140520.authtemptoken.sql',1453226129,NULL),('phabricator:20140521.projectslug.1.create.sql',1453226129,NULL),('phabricator:20140521.projectslug.2.mig.php',1453226129,NULL),('phabricator:20140522.projecticon.sql',1453226129,NULL),('phabricator:20140524.auth.mfa.cache.sql',1453226129,NULL),('phabricator:20140525.hunkmodern.sql',1453226129,NULL),('phabricator:20140615.pholioedit.1.sql',1453226129,NULL),('phabricator:20140615.pholioedit.2.sql',1453226129,NULL),('phabricator:20140617.daemon.explicit-argv.sql',1453226129,NULL),('phabricator:20140617.daemonlog.sql',1453226129,NULL),('phabricator:20140624.projcolor.1.sql',1453226129,NULL),('phabricator:20140624.projcolor.2.sql',1453226129,NULL),('phabricator:20140629.dasharchive.1.sql',1453226129,NULL),('phabricator:20140629.legalsig.1.sql',1453226129,NULL),('phabricator:20140629.legalsig.2.php',1453226129,NULL),('phabricator:20140701.legalexemption.1.sql',1453226129,NULL),('phabricator:20140701.legalexemption.2.sql',1453226129,NULL),('phabricator:20140703.legalcorp.1.sql',1453226129,NULL),('phabricator:20140703.legalcorp.2.sql',1453226129,NULL),('phabricator:20140703.legalcorp.3.sql',1453226129,NULL),('phabricator:20140703.legalcorp.4.sql',1453226129,NULL),('phabricator:20140703.legalcorp.5.sql',1453226129,NULL),('phabricator:20140704.harbormasterstep.1.sql',1453226129,NULL),('phabricator:20140704.harbormasterstep.2.sql',1453226129,NULL),('phabricator:20140704.legalpreamble.1.sql',1453226129,NULL),('phabricator:20140706.harbormasterdepend.1.php',1453226129,NULL),('phabricator:20140706.pedge.1.sql',1453226129,NULL),('phabricator:20140711.pnames.1.sql',1453226129,NULL),('phabricator:20140711.pnames.2.php',1453226129,NULL),('phabricator:20140711.workerpriority.sql',1453226129,NULL),('phabricator:20140712.projcoluniq.sql',1453226129,NULL),('phabricator:20140721.phortune.1.cart.sql',1453226129,NULL),('phabricator:20140721.phortune.2.purchase.sql',1453226129,NULL),('phabricator:20140721.phortune.3.charge.sql',1453226129,NULL),('phabricator:20140721.phortune.4.cartstatus.sql',1453226129,NULL),('phabricator:20140721.phortune.5.cstatusdefault.sql',1453226129,NULL),('phabricator:20140721.phortune.6.onetimecharge.sql',1453226129,NULL),('phabricator:20140721.phortune.7.nullmethod.sql',1453226129,NULL),('phabricator:20140722.appname.php',1453226129,NULL),('phabricator:20140722.audit.1.xactions.sql',1453226129,NULL),('phabricator:20140722.audit.2.comments.sql',1453226129,NULL),('phabricator:20140722.audit.3.miginlines.php',1453226129,NULL),('phabricator:20140722.audit.4.migtext.php',1453226129,NULL),('phabricator:20140722.renameauth.php',1453226129,NULL),('phabricator:20140723.apprenamexaction.sql',1453226129,NULL),('phabricator:20140725.audit.1.migxactions.php',1453226129,NULL),('phabricator:20140731.audit.1.subscribers.php',1453226129,NULL),('phabricator:20140731.cancdn.php',1453226129,NULL),('phabricator:20140731.harbormasterstepdesc.sql',1453226129,NULL),('phabricator:20140805.boardcol.1.sql',1453226129,NULL),('phabricator:20140805.boardcol.2.php',1453226129,NULL),('phabricator:20140807.harbormastertargettime.sql',1453226129,NULL),('phabricator:20140808.boardprop.1.sql',1453226129,NULL),('phabricator:20140808.boardprop.2.sql',1453226129,NULL),('phabricator:20140808.boardprop.3.php',1453226129,NULL),('phabricator:20140811.blob.1.sql',1453226129,NULL),('phabricator:20140811.blob.2.sql',1453226129,NULL),('phabricator:20140812.projkey.1.sql',1453226129,NULL),('phabricator:20140812.projkey.2.sql',1453226129,NULL),('phabricator:20140814.passphrasecredentialconduit.sql',1453226129,NULL),('phabricator:20140815.cancdncase.php',1453226129,NULL),('phabricator:20140818.harbormasterindex.1.sql',1453226129,NULL),('phabricator:20140821.harbormasterbuildgen.1.sql',1453226129,NULL),('phabricator:20140822.daemonenvhash.sql',1453226129,NULL),('phabricator:20140902.almanacdevice.1.sql',1453226129,NULL),('phabricator:20140904.macroattach.php',1453226129,NULL),('phabricator:20140911.fund.1.initiative.sql',1453226129,NULL),('phabricator:20140911.fund.2.xaction.sql',1453226129,NULL),('phabricator:20140911.fund.3.edge.sql',1453226129,NULL),('phabricator:20140911.fund.4.backer.sql',1453226129,NULL),('phabricator:20140911.fund.5.backxaction.sql',1453226129,NULL),('phabricator:20140914.betaproto.php',1453226129,NULL),('phabricator:20140917.project.canlock.sql',1453226129,NULL),('phabricator:20140918.schema.1.dropaudit.sql',1453226129,NULL),('phabricator:20140918.schema.2.dropauditinline.sql',1453226129,NULL),('phabricator:20140918.schema.3.wipecache.sql',1453226129,NULL),('phabricator:20140918.schema.4.cachetype.sql',1453226129,NULL),('phabricator:20140918.schema.5.slowvote.sql',1453226129,NULL),('phabricator:20140919.schema.01.calstatus.sql',1453226129,NULL),('phabricator:20140919.schema.02.calname.sql',1453226129,NULL),('phabricator:20140919.schema.03.dropaux.sql',1453226129,NULL),('phabricator:20140919.schema.04.droptaskproj.sql',1453226129,NULL),('phabricator:20140926.schema.01.droprelev.sql',1453226129,NULL),('phabricator:20140926.schema.02.droprelreqev.sql',1453226129,NULL),('phabricator:20140926.schema.03.dropldapinfo.sql',1453226129,NULL),('phabricator:20140926.schema.04.dropoauthinfo.sql',1453226129,NULL),('phabricator:20140926.schema.05.dropprojaffil.sql',1453226129,NULL),('phabricator:20140926.schema.06.dropsubproject.sql',1453226129,NULL),('phabricator:20140926.schema.07.droppondcom.sql',1453226129,NULL),('phabricator:20140927.schema.01.dropsearchq.sql',1453226129,NULL),('phabricator:20140927.schema.02.pholio1.sql',1453226129,NULL),('phabricator:20140927.schema.03.pholio2.sql',1453226129,NULL),('phabricator:20140927.schema.04.pholio3.sql',1453226129,NULL),('phabricator:20140927.schema.05.phragment1.sql',1453226130,NULL),('phabricator:20140927.schema.06.releeph1.sql',1453226130,NULL),('phabricator:20141001.schema.01.version.sql',1453226130,NULL),('phabricator:20141001.schema.02.taskmail.sql',1453226130,NULL),('phabricator:20141002.schema.01.liskcounter.sql',1453226130,NULL),('phabricator:20141002.schema.02.draftnull.sql',1453226130,NULL),('phabricator:20141004.currency.01.sql',1453226130,NULL),('phabricator:20141004.currency.02.sql',1453226130,NULL),('phabricator:20141004.currency.03.sql',1453226130,NULL),('phabricator:20141004.currency.04.sql',1453226130,NULL),('phabricator:20141004.currency.05.sql',1453226130,NULL),('phabricator:20141004.currency.06.sql',1453226130,NULL),('phabricator:20141004.harborliskcounter.sql',1453226130,NULL),('phabricator:20141005.phortuneproduct.sql',1453226130,NULL),('phabricator:20141006.phortunecart.sql',1453226130,NULL),('phabricator:20141006.phortunemerchant.sql',1453226130,NULL),('phabricator:20141006.phortunemerchantx.sql',1453226130,NULL),('phabricator:20141007.fundmerchant.sql',1453226130,NULL),('phabricator:20141007.fundrisks.sql',1453226130,NULL),('phabricator:20141007.fundtotal.sql',1453226130,NULL),('phabricator:20141007.phortunecartmerchant.sql',1453226130,NULL),('phabricator:20141007.phortunecharge.sql',1453226130,NULL),('phabricator:20141007.phortunepayment.sql',1453226130,NULL),('phabricator:20141007.phortuneprovider.sql',1453226130,NULL),('phabricator:20141007.phortuneproviderx.sql',1453226130,NULL),('phabricator:20141008.phortunemerchdesc.sql',1453226130,NULL),('phabricator:20141008.phortuneprovdis.sql',1453226130,NULL),('phabricator:20141008.phortunerefund.sql',1453226130,NULL),('phabricator:20141010.fundmailkey.sql',1453226130,NULL),('phabricator:20141011.phortunemerchedit.sql',1453226130,NULL),('phabricator:20141012.phortunecartxaction.sql',1453226130,NULL),('phabricator:20141013.phortunecartkey.sql',1453226130,NULL),('phabricator:20141016.almanac.device.sql',1453226130,NULL),('phabricator:20141016.almanac.dxaction.sql',1453226130,NULL),('phabricator:20141016.almanac.interface.sql',1453226130,NULL),('phabricator:20141016.almanac.network.sql',1453226130,NULL),('phabricator:20141016.almanac.nxaction.sql',1453226130,NULL),('phabricator:20141016.almanac.service.sql',1453226130,NULL),('phabricator:20141016.almanac.sxaction.sql',1453226130,NULL),('phabricator:20141017.almanac.binding.sql',1453226130,NULL),('phabricator:20141017.almanac.bxaction.sql',1453226130,NULL),('phabricator:20141025.phriction.1.xaction.sql',1453226130,NULL),('phabricator:20141025.phriction.2.xaction.sql',1453226130,NULL),('phabricator:20141025.phriction.mailkey.sql',1453226130,NULL),('phabricator:20141103.almanac.1.delprop.sql',1453226130,NULL),('phabricator:20141103.almanac.2.addprop.sql',1453226131,NULL),('phabricator:20141104.almanac.3.edge.sql',1453226131,NULL),('phabricator:20141105.ssh.1.rename.sql',1453226131,NULL),('phabricator:20141106.dropold.sql',1453226131,NULL),('phabricator:20141106.uniqdrafts.php',1453226131,NULL),('phabricator:20141107.phriction.policy.1.sql',1453226131,NULL),('phabricator:20141107.phriction.policy.2.php',1453226131,NULL),('phabricator:20141107.phriction.popkeys.php',1453226131,NULL),('phabricator:20141107.ssh.1.colname.sql',1453226131,NULL),('phabricator:20141107.ssh.2.keyhash.sql',1453226131,NULL),('phabricator:20141107.ssh.3.keyindex.sql',1453226131,NULL),('phabricator:20141107.ssh.4.keymig.php',1453226131,NULL),('phabricator:20141107.ssh.5.indexnull.sql',1453226131,NULL),('phabricator:20141107.ssh.6.indexkey.sql',1453226131,NULL),('phabricator:20141107.ssh.7.colnull.sql',1453226131,NULL),('phabricator:20141113.auditdupes.php',1453226131,NULL),('phabricator:20141118.diffxaction.sql',1453226131,NULL),('phabricator:20141119.commitpedge.sql',1453226131,NULL),('phabricator:20141119.differential.diff.policy.sql',1453226131,NULL),('phabricator:20141119.sshtrust.sql',1453226131,NULL),('phabricator:20141123.taskpriority.1.sql',1453226131,NULL),('phabricator:20141123.taskpriority.2.sql',1453226131,NULL),('phabricator:20141210.maniphestsubscribersmig.1.sql',1453226131,NULL),('phabricator:20141210.maniphestsubscribersmig.2.sql',1453226131,NULL),('phabricator:20141210.reposervice.sql',1453226131,NULL),('phabricator:20141212.conduittoken.sql',1453226131,NULL),('phabricator:20141215.almanacservicetype.sql',1453226131,NULL),('phabricator:20141217.almanacdevicelock.sql',1453226131,NULL),('phabricator:20141217.almanaclock.sql',1453226131,NULL),('phabricator:20141218.maniphestcctxn.php',1453226131,NULL),('phabricator:20141222.maniphestprojtxn.php',1453226131,NULL),('phabricator:20141223.daemonloguser.sql',1453226131,NULL),('phabricator:20141223.daemonobjectphid.sql',1453226131,NULL),('phabricator:20141230.pasteeditpolicycolumn.sql',1453226131,NULL),('phabricator:20141230.pasteeditpolicyexisting.sql',1453226131,NULL),('phabricator:20150102.policyname.php',1453226131,NULL),('phabricator:20150102.tasksubscriber.sql',1453226131,NULL),('phabricator:20150105.conpsearch.sql',1453226131,NULL),('phabricator:20150114.oauthserver.client.policy.sql',1453226131,NULL),('phabricator:20150115.applicationemails.sql',1453226131,NULL),('phabricator:20150115.trigger.1.sql',1453226131,NULL),('phabricator:20150115.trigger.2.sql',1453226131,NULL),('phabricator:20150116.maniphestapplicationemails.php',1453226131,NULL),('phabricator:20150120.maniphestdefaultauthor.php',1453226131,NULL),('phabricator:20150124.subs.1.sql',1453226131,NULL),('phabricator:20150129.pastefileapplicationemails.php',1453226131,NULL),('phabricator:20150130.phortune.1.subphid.sql',1453226131,NULL),('phabricator:20150130.phortune.2.subkey.sql',1453226131,NULL),('phabricator:20150131.phortune.1.defaultpayment.sql',1453226131,NULL),('phabricator:20150205.authprovider.autologin.sql',1453226131,NULL),('phabricator:20150205.daemonenv.sql',1453226131,NULL),('phabricator:20150209.invite.sql',1453226131,NULL),('phabricator:20150209.oauthclient.trust.sql',1453226131,NULL),('phabricator:20150210.invitephid.sql',1453226131,NULL),('phabricator:20150212.legalpad.session.1.sql',1453226131,NULL),('phabricator:20150212.legalpad.session.2.sql',1453226131,NULL),('phabricator:20150219.scratch.nonmutable.sql',1453226131,NULL),('phabricator:20150223.daemon.1.id.sql',1453226131,NULL),('phabricator:20150223.daemon.2.idlegacy.sql',1453226131,NULL),('phabricator:20150223.daemon.3.idkey.sql',1453226131,NULL),('phabricator:20150312.filechunk.1.sql',1453226131,NULL),('phabricator:20150312.filechunk.2.sql',1453226131,NULL),('phabricator:20150312.filechunk.3.sql',1453226131,NULL),('phabricator:20150317.conpherence.isroom.1.sql',1453226131,NULL),('phabricator:20150317.conpherence.isroom.2.sql',1453226131,NULL),('phabricator:20150317.conpherence.policy.sql',1453226131,NULL),('phabricator:20150410.nukeruleedit.sql',1453226131,NULL),('phabricator:20150420.invoice.1.sql',1453226131,NULL),('phabricator:20150420.invoice.2.sql',1453226131,NULL),('phabricator:20150425.isclosed.sql',1453226131,NULL),('phabricator:20150427.calendar.1.edge.sql',1453226131,NULL),('phabricator:20150427.calendar.1.xaction.sql',1453226131,NULL),('phabricator:20150427.calendar.2.xaction.sql',1453226131,NULL),('phabricator:20150428.calendar.1.iscancelled.sql',1453226131,NULL),('phabricator:20150428.calendar.1.name.sql',1453226131,NULL),('phabricator:20150429.calendar.1.invitee.sql',1453226131,NULL),('phabricator:20150430.calendar.1.policies.sql',1453226132,NULL),('phabricator:20150430.multimeter.1.sql',1453226132,NULL),('phabricator:20150430.multimeter.2.host.sql',1453226132,NULL),('phabricator:20150430.multimeter.3.viewer.sql',1453226132,NULL),('phabricator:20150430.multimeter.4.context.sql',1453226132,NULL),('phabricator:20150430.multimeter.5.label.sql',1453226132,NULL),('phabricator:20150501.calendar.1.reply.sql',1453226132,NULL),('phabricator:20150501.calendar.2.reply.php',1453226132,NULL),('phabricator:20150501.conpherencepics.sql',1453226132,NULL),('phabricator:20150503.repositorysymbols.1.sql',1453226132,NULL),('phabricator:20150503.repositorysymbols.2.php',1453226132,NULL),('phabricator:20150503.repositorysymbols.3.sql',1453226132,NULL),('phabricator:20150504.symbolsproject.1.php',1453226132,NULL),('phabricator:20150504.symbolsproject.2.sql',1453226132,NULL),('phabricator:20150506.calendarunnamedevents.1.php',1453226132,NULL),('phabricator:20150507.calendar.1.isallday.sql',1453226132,NULL),('phabricator:20150513.user.cache.1.sql',1453226132,NULL),('phabricator:20150514.calendar.status.sql',1453226132,NULL),('phabricator:20150514.phame.blog.xaction.sql',1453226132,NULL),('phabricator:20150514.user.cache.2.sql',1453226132,NULL),('phabricator:20150515.phame.post.xaction.sql',1453226132,NULL),('phabricator:20150515.project.mailkey.1.sql',1453226132,NULL),('phabricator:20150515.project.mailkey.2.php',1453226132,NULL),('phabricator:20150519.calendar.calendaricon.sql',1453226132,NULL),('phabricator:20150521.releephrepository.sql',1453226132,NULL),('phabricator:20150525.diff.hidden.1.sql',1453226132,NULL),('phabricator:20150526.owners.mailkey.1.sql',1453226132,NULL),('phabricator:20150526.owners.mailkey.2.php',1453226132,NULL),('phabricator:20150526.owners.xaction.sql',1453226132,NULL),('phabricator:20150527.calendar.recurringevents.sql',1453226132,NULL),('phabricator:20150601.spaces.1.namespace.sql',1453226132,NULL),('phabricator:20150601.spaces.2.xaction.sql',1453226132,NULL),('phabricator:20150602.mlist.1.sql',1453226132,NULL),('phabricator:20150602.mlist.2.php',1453226132,NULL),('phabricator:20150604.spaces.1.sql',1453226132,NULL),('phabricator:20150605.diviner.edges.sql',1453226132,NULL),('phabricator:20150605.diviner.editPolicy.sql',1453226132,NULL),('phabricator:20150605.diviner.xaction.sql',1453226132,NULL),('phabricator:20150606.mlist.1.php',1453226132,NULL),('phabricator:20150609.inline.sql',1453226132,NULL),('phabricator:20150609.spaces.1.pholio.sql',1453226132,NULL),('phabricator:20150609.spaces.2.maniphest.sql',1453226132,NULL),('phabricator:20150610.spaces.1.desc.sql',1453226132,NULL),('phabricator:20150610.spaces.2.edge.sql',1453226132,NULL),('phabricator:20150610.spaces.3.archive.sql',1453226132,NULL),('phabricator:20150611.spaces.1.mailxaction.sql',1453226132,NULL),('phabricator:20150611.spaces.2.appmail.sql',1453226132,NULL),('phabricator:20150616.divinerrepository.sql',1453226132,NULL),('phabricator:20150617.harbor.1.lint.sql',1453226132,NULL),('phabricator:20150617.harbor.2.unit.sql',1453226132,NULL),('phabricator:20150618.harbor.1.planauto.sql',1453226132,NULL),('phabricator:20150618.harbor.2.stepauto.sql',1453226132,NULL),('phabricator:20150618.harbor.3.buildauto.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.1.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.2.sql',1453226132,NULL),('phabricator:20150619.conpherencerooms.3.sql',1453226132,NULL),('phabricator:20150621.phrase.1.sql',1453226132,NULL),('phabricator:20150621.phrase.2.sql',1453226132,NULL),('phabricator:20150622.bulk.1.job.sql',1453226132,NULL),('phabricator:20150622.bulk.2.task.sql',1453226132,NULL),('phabricator:20150622.bulk.3.xaction.sql',1453226132,NULL),('phabricator:20150622.bulk.4.edge.sql',1453226132,NULL),('phabricator:20150622.metamta.1.phid-col.sql',1453226132,NULL),('phabricator:20150622.metamta.2.phid-mig.php',1453226132,NULL),('phabricator:20150622.metamta.3.phid-key.sql',1453226132,NULL),('phabricator:20150622.metamta.4.actor-phid-col.sql',1453226132,NULL),('phabricator:20150622.metamta.5.actor-phid-mig.php',1453226132,NULL),('phabricator:20150622.metamta.6.actor-phid-key.sql',1453226132,NULL),('phabricator:20150624.spaces.1.repo.sql',1453226132,NULL),('phabricator:20150626.spaces.1.calendar.sql',1453226132,NULL),('phabricator:20150630.herald.1.sql',1453226132,NULL),('phabricator:20150630.herald.2.sql',1453226132,NULL),('phabricator:20150701.herald.1.sql',1453226132,NULL),('phabricator:20150701.herald.2.sql',1453226132,NULL),('phabricator:20150702.spaces.1.slowvote.sql',1453226133,NULL),('phabricator:20150706.herald.1.sql',1453226133,NULL),('phabricator:20150707.herald.1.sql',1453226133,NULL),('phabricator:20150708.arcanistproject.sql',1453226133,NULL),('phabricator:20150708.herald.1.sql',1453226133,NULL),('phabricator:20150708.herald.2.sql',1453226133,NULL),('phabricator:20150708.herald.3.sql',1453226133,NULL),('phabricator:20150712.badges.1.sql',1453226133,NULL),('phabricator:20150714.spaces.countdown.1.sql',1453226133,NULL),('phabricator:20150717.herald.1.sql',1453226133,NULL),('phabricator:20150719.countdown.1.sql',1453226133,NULL),('phabricator:20150719.countdown.2.sql',1453226133,NULL),('phabricator:20150719.countdown.3.sql',1453226133,NULL),('phabricator:20150721.phurl.1.url.sql',1453226133,NULL),('phabricator:20150721.phurl.2.xaction.sql',1453226133,NULL),('phabricator:20150721.phurl.3.xactioncomment.sql',1453226133,NULL),('phabricator:20150721.phurl.4.url.sql',1453226133,NULL),('phabricator:20150721.phurl.5.edge.sql',1453226133,NULL),('phabricator:20150721.phurl.6.alias.sql',1453226133,NULL),('phabricator:20150721.phurl.7.authorphid.sql',1453226133,NULL),('phabricator:20150722.dashboard.1.sql',1453226133,NULL),('phabricator:20150722.dashboard.2.sql',1453226133,NULL),('phabricator:20150723.countdown.1.sql',1453226133,NULL),('phabricator:20150724.badges.comments.1.sql',1453226133,NULL),('phabricator:20150724.countdown.comments.1.sql',1453226133,NULL),('phabricator:20150725.badges.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.badges.mailkey.2.php',1453226133,NULL),('phabricator:20150725.badges.viewpolicy.3.sql',1453226133,NULL),('phabricator:20150725.countdown.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.countdown.mailkey.2.php',1453226133,NULL),('phabricator:20150725.slowvote.mailkey.1.sql',1453226133,NULL),('phabricator:20150725.slowvote.mailkey.2.php',1453226133,NULL),('phabricator:20150727.heraldaction.1.sql',1453226133,NULL),('phabricator:20150730.herald.1.sql',1453226133,NULL),('phabricator:20150730.herald.2.sql',1453226133,NULL),('phabricator:20150730.herald.3.sql',1453226133,NULL),('phabricator:20150730.herald.4.sql',1453226133,NULL),('phabricator:20150730.herald.5.sql',1453226133,NULL),('phabricator:20150730.herald.6.sql',1453226133,NULL),('phabricator:20150730.herald.7.sql',1453226133,NULL),('phabricator:20150803.herald.1.sql',1453226133,NULL),('phabricator:20150803.herald.2.sql',1453226133,NULL),('phabricator:20150804.ponder.answer.mailkey.1.sql',1453226133,NULL),('phabricator:20150804.ponder.answer.mailkey.2.php',1453226133,NULL),('phabricator:20150804.ponder.question.1.sql',1453226133,NULL),('phabricator:20150804.ponder.question.2.sql',1453226133,NULL),('phabricator:20150804.ponder.question.3.sql',1453226133,NULL),('phabricator:20150804.ponder.spaces.4.sql',1453226133,NULL),('phabricator:20150805.paste.status.1.sql',1453226133,NULL),('phabricator:20150805.paste.status.2.sql',1453226133,NULL),('phabricator:20150806.ponder.answer.1.sql',1453226133,NULL),('phabricator:20150806.ponder.editpolicy.2.sql',1453226133,NULL),('phabricator:20150806.ponder.status.1.sql',1453226133,NULL),('phabricator:20150806.ponder.status.2.sql',1453226133,NULL),('phabricator:20150806.ponder.status.3.sql',1453226133,NULL),('phabricator:20150808.ponder.vote.1.sql',1453226133,NULL),('phabricator:20150808.ponder.vote.2.sql',1453226133,NULL),('phabricator:20150812.ponder.answer.1.sql',1453226133,NULL),('phabricator:20150812.ponder.answer.2.sql',1453226133,NULL),('phabricator:20150814.harbormater.artifact.phid.sql',1453226133,NULL),('phabricator:20150815.owners.status.1.sql',1453226133,NULL),('phabricator:20150815.owners.status.2.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.1.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.2.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.3.sql',1453226133,NULL),('phabricator:20150823.nuance.queue.4.sql',1453226133,NULL),('phabricator:20150828.ponder.wiki.1.sql',1453226133,NULL),('phabricator:20150829.ponder.dupe.1.sql',1453226133,NULL),('phabricator:20150904.herald.1.sql',1453226133,NULL),('phabricator:20150906.mailinglist.sql',1453226133,NULL),('phabricator:20150910.owners.custom.1.sql',1453226133,NULL),('phabricator:20150916.drydock.slotlocks.1.sql',1453226133,NULL),('phabricator:20150922.drydock.commands.1.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.1.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.2.sql',1453226133,NULL),('phabricator:20150923.drydock.resourceid.3.sql',1453226133,NULL),('phabricator:20150923.drydock.taskid.1.sql',1453226133,NULL),('phabricator:20150924.drydock.disable.1.sql',1453226133,NULL),('phabricator:20150924.drydock.status.1.sql',1453226133,NULL),('phabricator:20150928.drydock.rexpire.1.sql',1453226133,NULL),('phabricator:20150930.drydock.log.1.sql',1453226134,NULL),('phabricator:20151001.drydock.rname.1.sql',1453226134,NULL),('phabricator:20151002.dashboard.status.1.sql',1453226134,NULL),('phabricator:20151002.harbormaster.bparam.1.sql',1453226134,NULL),('phabricator:20151009.drydock.auth.1.sql',1453226134,NULL),('phabricator:20151010.drydock.auth.2.sql',1453226134,NULL),('phabricator:20151013.drydock.op.1.sql',1453226134,NULL),('phabricator:20151023.harborpolicy.1.sql',1453226134,NULL),('phabricator:20151023.harborpolicy.2.php',1453226134,NULL),('phabricator:20151023.patchduration.sql',1453226134,14142),('phabricator:20151030.harbormaster.initiator.sql',1453226134,35726),('phabricator:20151106.editengine.1.table.sql',1453226134,8030),('phabricator:20151106.editengine.2.xactions.sql',1453226134,7392),('phabricator:20151106.phame.post.mailkey.1.sql',1453226134,18595),('phabricator:20151106.phame.post.mailkey.2.php',1453226134,1616),('phabricator:20151107.phame.blog.mailkey.1.sql',1453226134,19832),('phabricator:20151107.phame.blog.mailkey.2.php',1453226134,1389),('phabricator:20151108.phame.blog.joinpolicy.sql',1453226134,16415),('phabricator:20151108.xhpast.stderr.sql',1453226134,24424),('phabricator:20151109.phame.post.comments.1.sql',1453226134,8007),('phabricator:20151109.repository.coverage.1.sql',1453226134,1405),('phabricator:20151109.xhpast.db.1.sql',1453226134,1559),('phabricator:20151109.xhpast.db.2.sql',1453226134,599),('phabricator:20151110.daemonenvhash.sql',1453226134,39904),('phabricator:20151111.phame.blog.archive.1.sql',1453226134,15720),('phabricator:20151111.phame.blog.archive.2.sql',1453226134,534),('phabricator:20151112.herald.edge.sql',1453226134,13618),('phabricator:20151116.owners.edge.sql',1453226134,13570),('phabricator:20151128.phame.blog.picture.1.sql',1453226134,15964),('phabricator:20151130.phurl.mailkey.1.sql',1453226134,10402),('phabricator:20151130.phurl.mailkey.2.php',1453226134,1457),('phabricator:20151202.versioneddraft.1.sql',1453226134,8923),('phabricator:20151207.editengine.1.sql',1453226134,76111),('phabricator:20151210.land.1.refphid.sql',1453226134,19463),('phabricator:20151210.land.2.refphid.php',1453226134,833),('phabricator:20151215.phame.1.autotitle.sql',1453226134,21510),('phabricator:20151218.key.1.keyphid.sql',1453226134,14834),('phabricator:20151218.key.2.keyphid.php',1453226134,429),('phabricator:20151219.proj.01.prislug.sql',1453226134,21059),('phabricator:20151219.proj.02.prislugkey.sql',1453226134,16233),('phabricator:20151219.proj.03.copyslug.sql',1453226134,474),('phabricator:20151219.proj.04.dropslugkey.sql',1453226134,7782),('phabricator:20151219.proj.05.dropslug.sql',1453226134,20865),('phabricator:20151219.proj.06.defaultpolicy.php',1453226134,1358),('phabricator:20151219.proj.07.viewnull.sql',1453226134,16753),('phabricator:20151219.proj.08.editnull.sql',1453226134,13683),('phabricator:20151219.proj.09.joinnull.sql',1453226134,10924),('phabricator:20151219.proj.10.subcolumns.sql',1453226134,129879),('phabricator:20151219.proj.11.subprojectphids.sql',1453226135,26586),('phabricator:20151221.search.1.version.sql',1453226135,14029),('phabricator:20151221.search.2.ownersngrams.sql',1453226135,7390),('phabricator:20151221.search.3.reindex.php',1453226135,436),('phabricator:20151223.proj.01.paths.sql',1453226135,22387),('phabricator:20151223.proj.02.depths.sql',1453226135,28069),('phabricator:20151223.proj.03.pathkey.sql',1453226135,12562),('phabricator:20151223.proj.04.keycol.sql',1453226135,24719),('phabricator:20151223.proj.05.updatekeys.php',1453226135,463),('phabricator:20151223.proj.06.uniq.sql',1453226135,12857),('phabricator:20151226.reop.1.sql',1453226135,19351),('phabricator:20151227.proj.01.materialize.sql',1453226135,697),('phabricator:20151231.proj.01.icon.php',1453226135,3273),('phabricator:20160110.repo.01.slug.sql',1453226135,31556),('phabricator:20160110.repo.02.slug.php',1453226135,461),('phabricator:20160111.repo.01.slugx.sql',1453226135,745),('phabricator:20160112.repo.01.uri.sql',1453226135,7698),('phabricator:20160112.repo.02.uri.index.php',1453226135,437),('phabricator:20160113.propanel.1.storage.sql',1453226135,6273),('phabricator:20160113.propanel.2.xaction.sql',1453226135,7608),('phabricator:20160119.project.1.silence.sql',1454486204,18511),('phabricator:20160122.project.1.boarddefault.php',1454486204,24032),('phabricator:20160124.people.1.icon.sql',1454486204,88891),('phabricator:20160124.people.2.icondefault.sql',1454486204,9661),('phabricator:20160128.repo.1.pull.sql',1454486204,47263),('phabricator:daemonstatus.sql',1453226123,NULL),('phabricator:daemonstatuskey.sql',1453226123,NULL),('phabricator:daemontaskarchive.sql',1453226124,NULL),('phabricator:db.almanac',1453226117,NULL),('phabricator:db.audit',1453226117,NULL),('phabricator:db.auth',1453226117,NULL),('phabricator:db.badges',1453226117,NULL),('phabricator:db.cache',1453226117,NULL),('phabricator:db.calendar',1453226117,NULL),('phabricator:db.chatlog',1453226117,NULL),('phabricator:db.conduit',1453226117,NULL),('phabricator:db.config',1453226117,NULL),('phabricator:db.conpherence',1453226117,NULL),('phabricator:db.countdown',1453226117,NULL),('phabricator:db.daemon',1453226117,NULL),('phabricator:db.dashboard',1453226117,NULL),('phabricator:db.differential',1453226117,NULL),('phabricator:db.diviner',1453226117,NULL),('phabricator:db.doorkeeper',1453226117,NULL),('phabricator:db.draft',1453226117,NULL),('phabricator:db.drydock',1453226117,NULL),('phabricator:db.fact',1453226117,NULL),('phabricator:db.feed',1453226117,NULL),('phabricator:db.file',1453226117,NULL),('phabricator:db.flag',1453226117,NULL),('phabricator:db.fund',1453226117,NULL),('phabricator:db.harbormaster',1453226117,NULL),('phabricator:db.herald',1453226117,NULL),('phabricator:db.legalpad',1453226117,NULL),('phabricator:db.maniphest',1453226117,NULL),('phabricator:db.meta_data',1453226117,NULL),('phabricator:db.metamta',1453226117,NULL),('phabricator:db.multimeter',1453226117,NULL),('phabricator:db.nuance',1453226117,NULL),('phabricator:db.oauth_server',1453226117,NULL),('phabricator:db.owners',1453226117,NULL),('phabricator:db.passphrase',1453226117,NULL),('phabricator:db.pastebin',1453226117,NULL),('phabricator:db.phame',1453226117,NULL),('phabricator:db.phlux',1453226117,NULL),('phabricator:db.pholio',1453226117,NULL),('phabricator:db.phortune',1453226117,NULL),('phabricator:db.phragment',1453226117,NULL),('phabricator:db.phrequent',1453226117,NULL),('phabricator:db.phriction',1453226117,NULL),('phabricator:db.phurl',1453226117,NULL),('phabricator:db.policy',1453226117,NULL),('phabricator:db.ponder',1453226117,NULL),('phabricator:db.project',1453226117,NULL),('phabricator:db.releeph',1453226117,NULL),('phabricator:db.repository',1453226117,NULL),('phabricator:db.search',1453226117,NULL),('phabricator:db.slowvote',1453226117,NULL),('phabricator:db.spaces',1453226117,NULL),('phabricator:db.system',1453226117,NULL),('phabricator:db.timeline',1453226117,NULL),('phabricator:db.token',1453226117,NULL),('phabricator:db.user',1453226117,NULL),('phabricator:db.worker',1453226117,NULL),('phabricator:db.xhpast',1453226117,NULL),('phabricator:db.xhpastview',1453226117,NULL),('phabricator:db.xhprof',1453226117,NULL),('phabricator:differentialbookmarks.sql',1453226123,NULL),('phabricator:draft-metadata.sql',1453226123,NULL),('phabricator:dropfileproxyimage.sql',1453226124,NULL),('phabricator:drydockresoucetype.sql',1453226124,NULL),('phabricator:drydocktaskid.sql',1453226124,NULL),('phabricator:edgetype.sql',1453226123,NULL),('phabricator:emailtable.sql',1453226123,NULL),('phabricator:emailtableport.sql',1453226123,NULL),('phabricator:emailtableremove.sql',1453226123,NULL),('phabricator:fact-raw.sql',1453226123,NULL),('phabricator:harbormasterobject.sql',1453226123,NULL),('phabricator:holidays.sql',1453226123,NULL),('phabricator:ldapinfo.sql',1453226123,NULL),('phabricator:legalpad-mailkey-populate.php',1453226125,NULL),('phabricator:legalpad-mailkey.sql',1453226125,NULL),('phabricator:liskcounters-task.sql',1453226124,NULL),('phabricator:liskcounters.php',1453226124,NULL),('phabricator:liskcounters.sql',1453226124,NULL),('phabricator:maniphestxcache.sql',1453226123,NULL),('phabricator:markupcache.sql',1453226123,NULL),('phabricator:migrate-differential-dependencies.php',1453226123,NULL),('phabricator:migrate-maniphest-dependencies.php',1453226123,NULL),('phabricator:migrate-maniphest-revisions.php',1453226123,NULL),('phabricator:migrate-project-edges.php',1453226123,NULL),('phabricator:owners-exclude.sql',1453226124,NULL),('phabricator:pastepolicy.sql',1453226123,NULL),('phabricator:phameblog.sql',1453226123,NULL),('phabricator:phamedomain.sql',1453226123,NULL),('phabricator:phameoneblog.sql',1453226123,NULL),('phabricator:phamepolicy.sql',1453226123,NULL),('phabricator:phiddrop.sql',1453226123,NULL),('phabricator:pholio.sql',1453226124,NULL),('phabricator:policy-project.sql',1453226123,NULL),('phabricator:ponder-comments.sql',1453226123,NULL),('phabricator:ponder-mailkey-populate.php',1453226123,NULL),('phabricator:ponder-mailkey.sql',1453226123,NULL),('phabricator:ponder.sql',1453226123,NULL),('phabricator:releeph.sql',1453226124,NULL),('phabricator:repository-lint.sql',1453226124,NULL),('phabricator:statustxt.sql',1453226124,NULL),('phabricator:symbolcontexts.sql',1453226123,NULL),('phabricator:testdatabase.sql',1453226123,NULL),('phabricator:threadtopic.sql',1453226123,NULL),('phabricator:userstatus.sql',1453226123,NULL),('phabricator:usertranslation.sql',1453226123,NULL),('phabricator:xhprof.sql',1453226123,NULL);
/*!40000 ALTER TABLE `patch_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `c426f39125b21bba_metamta`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_metamta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_metamta`;

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
-- Current Database: `c426f39125b21bba_multimeter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_multimeter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_multimeter`;

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
-- Current Database: `c426f39125b21bba_nuance`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_nuance` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_nuance`;

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
-- Current Database: `c426f39125b21bba_oauth_server`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_oauth_server` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_oauth_server`;

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
-- Current Database: `c426f39125b21bba_owners`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_owners` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_owners`;

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
-- Current Database: `c426f39125b21bba_passphrase`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_passphrase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_passphrase`;

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
-- Current Database: `c426f39125b21bba_pastebin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_pastebin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_pastebin`;

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
-- Current Database: `c426f39125b21bba_phame`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_phame` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_phame`;

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
-- Current Database: `c426f39125b21bba_phlux`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_phlux` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_phlux`;

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
-- Current Database: `c426f39125b21bba_pholio`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_pholio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_pholio`;

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
-- Current Database: `c426f39125b21bba_phortune`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_phortune` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_phortune`;

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
-- Current Database: `c426f39125b21bba_phragment`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_phragment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_phragment`;

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
-- Current Database: `c426f39125b21bba_phrequent`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_phrequent` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_phrequent`;

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
-- Current Database: `c426f39125b21bba_phriction`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_phriction` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_phriction`;

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
-- Current Database: `c426f39125b21bba_phurl`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_phurl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_phurl`;

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
-- Current Database: `c426f39125b21bba_policy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_policy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_policy`;

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
-- Current Database: `c426f39125b21bba_ponder`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_ponder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_ponder`;

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
-- Current Database: `c426f39125b21bba_project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_project`;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_phid` (`phid`),
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
-- Current Database: `c426f39125b21bba_releeph`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_releeph` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_releeph`;

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
-- Current Database: `c426f39125b21bba_repository`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_repository` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_repository`;

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
  `remoteAddress` int(10) unsigned DEFAULT NULL,
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
  `remoteAddress` int(10) unsigned DEFAULT NULL,
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
-- Current Database: `c426f39125b21bba_search`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_search` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_search`;

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
INSERT INTO `search_document` VALUES ('PHID-USER-l2r2l32e4yudsfvfkhti','USER','superadmin (Administrator)',1454486435,1454486435);
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
INSERT INTO `search_documentfield` VALUES ('PHID-USER-l2r2l32e4yudsfvfkhti','USER','titl',NULL,'superadmin (Administrator)');
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
INSERT INTO `search_documentrelationship` VALUES ('PHID-USER-l2r2l32e4yudsfvfkhti','PHID-USER-l2r2l32e4yudsfvfkhti','open','USER',1454486435);
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
INSERT INTO `search_indexversion` VALUES (1,'PHID-USER-l2r2l32e4yudsfvfkhti','fulltext','none:none');
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
-- Current Database: `c426f39125b21bba_slowvote`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_slowvote` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_slowvote`;

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
-- Current Database: `c426f39125b21bba_spaces`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_spaces` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_spaces`;

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
-- Current Database: `c426f39125b21bba_system`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_system`;

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
-- Current Database: `c426f39125b21bba_token`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_token` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_token`;

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
-- Current Database: `c426f39125b21bba_user`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_user` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_user`;

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
INSERT INTO `user` VALUES (1,'PHID-USER-l2r2l32e4yudsfvfkhti','superadmin','Administrator',NULL,NULL,'f490fb0662cd0d70f747feeb6f8d930d','bcrypt:$2y$11$UXupBCb.7NcYwGdWHs30NuQABlwfX3gTPk462u0flR493qk8QTzXe',1454486435,1454486435,NULL,0,0,'','oevdpin4asthqa3hm4s37m65sje6bkgpv2veqbqlq4gquthfwjyeptidlif46spnav2byxfysitll2thz2rtv3pyxj32376cgxusxipadv2yy6mv6mobuk5fji7hi6adkyciqafbd4gmhz5nemoozfj4nj2vzsuaenjng6mwbtwnnaqtahfxgpwusevoet2qaf2yol5kqqzltvtr4763ex7w3bdb3xx2dy7psi2i3e7sru6mqfshub7gca5xyp2',0,0,1,'',1,1,'kezik7qbssykng3va3hxtboothczxw6n6zhq7muxb2fx527qou5dwwff7evvch4q',0,'CqF0_PWAw6Fc,https://shot-snap.cloudron.eu/res/phabricator/e132bb6a/rsrc/image/avatar.png','{\"until\":null}',1454745635,0);
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
INSERT INTO `user_email` VALUES (1,'PHID-USER-l2r2l32e4yudsfvfkhti','admin@server.test',1,1,'ejylwkng2xk6mv3kz644ytvl',1454486435,1454486435);
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
INSERT INTO `user_externalaccount` VALUES (1,'PHID-XUSR-hqknh233nnqa7qnkh2te','PHID-USER-l2r2l32e4yudsfvfkhti','password','self','l63jdszovcmwbt6e4f7vjknzishg6cqf','PHID-USER-l2r2l32e4yudsfvfkhti',NULL,1454486435,1454486435,NULL,NULL,NULL,0,NULL,NULL,'[]');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES (1,'PHID-USER-l2r2l32e4yudsfvfkhti','PHID-USER-l2r2l32e4yudsfvfkhti','create','null','\"admin@server.test\"','{\"host\":\"shot\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.82 Safari\\/537.36\"}',1454486435,1454486435,'172.17.0.1',NULL),(2,'PHID-USER-l2r2l32e4yudsfvfkhti','PHID-USER-l2r2l32e4yudsfvfkhti','change-password','null','null','{\"host\":\"shot\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.82 Safari\\/537.36\"}',1454486435,1454486435,'172.17.0.1',NULL),(3,'PHID-USER-l2r2l32e4yudsfvfkhti','PHID-USER-l2r2l32e4yudsfvfkhti','admin','false','true','{\"host\":\"shot\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.82 Safari\\/537.36\"}',1454486435,1454486435,'172.17.0.1',NULL),(4,NULL,'PHID-USER-l2r2l32e4yudsfvfkhti','login-partial','null','null','{\"session_type\":\"web\",\"host\":\"shot\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.82 Safari\\/537.36\"}',1454486435,1454486435,'172.17.0.1','6cf4c3730f8bba304bd43fa7e6e680e2e4286e40'),(5,'PHID-USER-l2r2l32e4yudsfvfkhti','PHID-USER-l2r2l32e4yudsfvfkhti','login-full','null','null','{\"host\":\"shot\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.82 Safari\\/537.36\"}',1454486435,1454486435,'172.17.0.1','6cf4c3730f8bba304bd43fa7e6e680e2e4286e40'),(6,'PHID-USER-l2r2l32e4yudsfvfkhti','PHID-USER-l2r2l32e4yudsfvfkhti','logout','null','null','{\"host\":\"shot\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/48.0.2564.82 Safari\\/537.36\"}',1454486622,1454486622,'172.17.0.1','6cf4c3730f8bba304bd43fa7e6e680e2e4286e40');
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
INSERT INTO `user_nametoken` VALUES ('superadmin',1),('administrator',1);
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
-- Current Database: `c426f39125b21bba_worker`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_worker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_worker`;

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
INSERT INTO `worker_archivetask` VALUES (3,'PhabricatorSearchWorker','43:1454486435:shot:223',1454493635,0,1,0,770343,1454486436,1454486436,4000,NULL),(4,'PhabricatorSearchWorker','43:1454486436:shot:224',1454493636,0,2,0,21941,1454486436,1454486436,4000,NULL),(5,'PhabricatorSearchWorker','43:1454486436:shot:225',1454493636,0,3,0,13624,1454486436,1454486436,4000,NULL),(6,'PhabricatorApplicationTransactionPublishWorker','43:1454486513:shot:303',1454493713,0,4,0,191737,1454486513,1454486513,1000,'PHID-AUTH-c6pyggoe6gesp5wptaor'),(7,'PhabricatorApplicationTransactionPublishWorker','43:1454486602:shot:392',1454493802,0,5,0,9102,1454486602,1454486602,1000,'PHID-AUTH-ebbjq5rhjm2ojnp246n3');
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
INSERT INTO `worker_taskdata` VALUES (1,'{\"documentPHID\":\"PHID-USER-l2r2l32e4yudsfvfkhti\",\"parameters\":[]}'),(2,'{\"documentPHID\":\"PHID-USER-l2r2l32e4yudsfvfkhti\",\"parameters\":[]}'),(3,'{\"documentPHID\":\"PHID-USER-l2r2l32e4yudsfvfkhti\",\"parameters\":[]}'),(4,'{\"objectPHID\":\"PHID-AUTH-c6pyggoe6gesp5wptaor\",\"actorPHID\":\"PHID-USER-l2r2l32e4yudsfvfkhti\",\"xactionPHIDs\":[\"PHID-XACT-AUTH-cseaobycylko43n\",\"PHID-XACT-AUTH-ibxpvvh4awj5653\",\"PHID-XACT-AUTH-pv5q7nc5qbesxqo\"],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}'),(5,'{\"objectPHID\":\"PHID-AUTH-ebbjq5rhjm2ojnp246n3\",\"actorPHID\":\"PHID-USER-l2r2l32e4yudsfvfkhti\",\"xactionPHIDs\":[\"PHID-XACT-AUTH-reh3haaedhamwqi\",\"PHID-XACT-AUTH-gm6s36mb7mfsmts\",\"PHID-XACT-AUTH-7eiyypxwnpegapu\",\"PHID-XACT-AUTH-mxhqsqjwrh5pkvx\",\"PHID-XACT-AUTH-mkolj65kazmjho2\",\"PHID-XACT-AUTH-hjqknkxc6m2s532\",\"PHID-XACT-AUTH-53fj22zwshyo3dl\",\"PHID-XACT-AUTH-3rwaps23to6kbg7\",\"PHID-XACT-AUTH-d76zmm6bisy7lnp\",\"PHID-XACT-AUTH-fgnn4tu6rnymxjk\",\"PHID-XACT-AUTH-5nk7s35aiop6cy7\",\"PHID-XACT-AUTH-q2ojndbdyvcqp65\"],\"state\":{\"parentMessageID\":null,\"disableEmail\":null,\"isNewObject\":false,\"heraldEmailPHIDs\":[],\"heraldForcedEmailPHIDs\":[],\"heraldHeader\":null,\"mailToPHIDs\":[],\"mailCCPHIDs\":[],\"feedNotifyPHIDs\":[],\"feedRelatedPHIDs\":[],\"excludeMailRecipientPHIDs\":[],\"custom\":[],\"custom.encoding\":[]}}');
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
-- Current Database: `c426f39125b21bba_xhpast`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_xhpast` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_xhpast`;

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
-- Current Database: `c426f39125b21bba_xhprof`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `c426f39125b21bba_xhprof` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `c426f39125b21bba_xhprof`;

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

-- Dump completed on 2016-02-03  8:03:47
