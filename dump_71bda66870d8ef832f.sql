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
INSERT INTO `cache_general` VALUES (1,'i0dazEHxf.Gq','phabricator:celerity:/res/phabricator/ab7b848c/rsrc/css/application/base-PTO0Tc6dClqX','deflate','���j�0�_e��E�w���0z��j$U�({���hS� a�r�|1�I����ju_�ڼ%CS(��b4u��Q��TQ^jk���=�N��<���^)dKJ�J�\r�ɑg�B�s��j\'�`�vR8������<#���l��`�Y��Cq�W]���kힵ*:3�E�1T�r���V�Є1��VR��?s�I��2��Hs��q�wT�^OF��4��T\"�<�,܉P�#r��5�4���\r((����|̗����߶�)?������\\��',1454486317,NULL),(2,'f2R.vANEu3rE','phabricator:celerity:/res/phabricator/c7ccd872/rsrc/css/font/font-lato.c-Dj4S0TLFyL2d','deflate','���n�0���+�@#m�m�a�\0��fR$\'D��6���IZE�dm\\8 l��f�#v[�D���|�i�a�����z�W{g�s}�{�ʵzXpy�j����\r!9�zp[i�|̑�!�xZ:X�t?��9���k��ŷ�vn#�}ƀYv;����ŏ�T.d����ԗ��<.܂��a\n��JA���H��W	���oK+��T�����n�8����l�p�����_m�{�����y��1M�J6�\"7�=�^�V��kE����8���Z��h�B��1UЪl�b��~���� z���v��N��iPi�u`Ǫ�&���Ls�I���@���L�r�5U���%L��HQ�EL�D\'K)kJ�A|9�|#�땪��nL�HGhT�L�7���PN�5�p����Pt,Ɵ/�N#\r-J���$��+��	���ا)��_q�m�/',1454486317,NULL),(3,'RP7MCG.JsX.W','phabricator:celerity:/res/phabricator/5e4df064/core.pkg.css;-V.FwI9gtllzh','deflate','��i��8� �~?�\"n��;�F)�\"�i羡(jߨ]�{l�;)qI�i��W��PdU����	8���p��[��]�N��.z��~��-�]��U�]E�U�]��U�]��ێ�.[��.k�.���n��%�G˓�=������Y�O�s����9Q�L���[�(9ߡ_������`�:g����C\\�õ9!���ޜf(?�P|����g{�e����`�һ(�2\'��)[���zW]�n��s����Y�Ջ���{���(jJ����ӓ.��k��]�d��M��Ir<M����gٿ\nc#�ݤ�0�=�:o��/ޟ���w�/o�>�Kz[t�����m%�oSI9꜓~<�\Z>�ɀ�,�OG�OR���H:J��~��N9\Z�����~����?D͑��w�u����ޏ�����k��]2xI��s�^q��)~�o2��`?�n�{��k=���������a��#������j�8G��j��c�Ŵ�����hH�!��4=�5��KE�O0�	��ðn���5SJ�b�7Q,��>�I�r��7��\r�pt\\��mi�\'9���j���|M����������]�����t�?m��¢�v	���W��/?�pOgM���(�T#2>��v�<�C<:�pk�h�oԨ.\n�A����7[=j��\'M:�#�L�-��9���O��\'������H����K��S���R��16��Xz�y�On�*�q>���e��r��c�Io��fؖ�q��C�������=��G<P2\0НX���(J�o\'�=&�M����[��<w��Z�1~�������	Ȳ���|�(.�G�4�O�#�@�����]�C���7�����gY9*�ي?BQ\'Cw�MV�h��q��|:�|\'~{�pUN��\0z�����(<��;��������h�v,%`�`$��<(V\'E�׷�t�-�?dK8��N��������&J\'M�b�x��R��|p!S�Yq@ڥ/=KQt�=�/Sw����o��I�#&�{�S��ε�i��C�w��䷙�����4Y���ϚÓ/���H��.a���Y�t������;]�����ߝC�z<���A��L�s>D�\Za����z���,�W��O�5]/�����ʼ{��ɝ>|n�=*c~���L�#\")U�|N�~�7h��8���6���2�L����uD���?b��3�L�9�D�S����8�g�1�e���-��+Z��@�y�f��ɟz�#~�ap�����_ي�e_��s��g)R湏Q��/f)��i�g���>5lx����(��|g�N��|��t���1�q����ֲ����_�v>3\n��2DD�h]�~�F ��o�W�ȗ�x8c�{iU䳪���:5������+dF�v*3_0>��	��?©���(���(��2��C.�f���\r�:�y��fV:-i�m�jK\\�N|��u/\r��w�`DT���>Q˜)\\C��5a�Fk�r��C@��;C�G3A��O��8��[�?�.y)�\'�Eǲ�]+7�(�Y�e��s$�����b��O]�Q�}:�$3���G3�Y��i6�84S���6�ܷ���]nOd�H�3,_v�H\\H�\Z��[uR��g(I��g$�2�[|�w�O��?y?�p��:���{�C$hf0���an������ߐ������������#oh�����C��%7�NB|=��>>�ķ�ET��0sG����#u��g�.G��nx�tr�q�?���V����	��pvr�u�\r������S���?� $��dwy͑t���O@�>�\"�L%X>���;��0�h������a\n�8+�.����P2%�w��SȗL���f%`�D��\ZX�_�1F�00N�;.��Y$��FO�8�|b\nv���8͢�?�=C�P���Eҝ�i1�k���-;���������;���s���#>��\'���ǉ��W=C�<J}��1z_�0�� ����w������<dZEҍN$?<�g����IƽC��1\r>�����9}��5.��֓G��5�&F���=1���E���/A/��e~��H�jZ��+$�bGA��~8~����)��݁%k\'����W�z�.{���w?�=I�a��z�\r���Gp�#��PW���mP��%ڡ�c#��fw´�(�\'���п�T�w�qQ!��X���n���d�.\r�)�X��%#t�S� Pt-h�b=�A9�I@�Q�?]�G0�ɰ���9��S{hs��@�؜H�N6Ȣ����g8��>�q�Cy�g�[MV������3ݯ��<_�?���������=To�������xO����|0�I�ú�wi�������C�\Zc\Z��=|\rMu)�*��9��� ��gh�;Й�	��+�\rpiG���ig�w$!؄�R�xPz8�!����Y�Z�E���BL�۲.Lضʹ��� �\'E\n��(Q�1V�\n������C�\\�\0:,r�hn�ja��n��y+C,�]O5�t�-\"X�?�#q�\\����WX\Z��O^SRc\Z�C��(:_��?9�X�\'�@��A�~��	_jeD���7T��AW��i����K�����&�(���N������\04���)�DJ�����o���.�O,\"uF~p�ĖC�������B�\n\\\0����\\ր�2���9n���ӗ�Xg,�~������5�٨�;�O!+�g�^�͇�qϽ-eZ��MFE�hѭ&8��ɕ�+�KN%��\n�S\n3SP�?�	���N���9\'P������G#�\0$��eH�~؜��Zs=.��W?K��O�Ο���Z.��-�K��+�ԙ��hx9Y���˽�\rJ��xԆX�\0�`���Eg���I3�+��&k<\\�ÐD�{���b��-D�G����4�*/w$Zq��h41��R}zy	r�����\'=;��7O|/}�����%�r��O��47�%u�|V�� ȝ�j�mx�8M�8��w�P\'�(@�+��!����#��+��t�����3g��x�R?*j�~�~J ��]Ap�S�w�4��5]�w� �u@\Z%�|�\\Pd��p���A[₝\"��~w`�F��,4ҢDx������!r�=�Z�M��J5�][6��3�o+��7�-Tf����	Mm�?�Ek�C���z�Zu�s�B\"Һn�Fcۮk�Y�ǯZ�v��7�).�>	*t�ޔi-���U\'���<ĕ�ј342U��۞q:\\B�B�F�ٕ�4��I��3�o���nk]�[�����F%5����E�=߰��<Uà*��q��\0��}u6Ԑ�.�Š{�B���w��0�d���)��8��7h^a)��Pgu��	��Aǁ�-��i�7���Q2��<�S\r�]�NK�k��u��#�ݚ��N�v�CmD6��B��[�s���_�,q�i[M�����n�+;�36�լg�Yuxk�:�T�c]�*��qsV���I�9E�f�-M=v|n]F�R��I����h������BDͪGY�4�mmEl�:Qǣћ.p���E���)H�?�<_s�>�z�ۺI��-�+��q��v@K�S���]�*�A����a�Yf��b#Q*�a�(�9}Lja����MbIc9B�H\"EG4���#��1/��彜���p�ʂ�`�V�f`y���j�T56w���n�����|��D�R�`ք���ݯ��\\=��\']�a<�#���)��q�@���$4I��Px)X��c�	J&����a\'7���;ws��mB����\'����\'*\0�`��~A���~ܓ�/�����,!Ή�����9��\"��N3��P��1P��w`������@q��C8h�W��ӱ�t�>�φ��x��>��x�����޻�-<\\1��)��8pDhxxC�>w�4�,\n��D�R�<jU�\'X[�e�7 q�a{��8>��<W�\rl�~ft���-�)s�e���B]��\Z�N��G���e\r*��QOn����%�F����f$6����|�/}3�Y�-\"��Q�@����l2$�z��C�kQ�8[�C	��?���H�L|��|�0�{\\\Zf.vȘ�g��.`Cǒ��f��|��Q�M���\'^B��0\0�c]���0HA\n���c���^^����Ild�s�Ɋ���`�u��Ȍ�-c�f;�G�py\r��	R�.-�J�r��\'3���k#�*v�]���|8�~�*q>^AoX���ϩ��wI\rt_O{��ҁ�K(�Z|h�XG>�\r\0�qeL�H�U���u �[�^����P,�>.����.�F���4�+��<����ǻD�^�ۣ9Js����C�.����\Z��&.z�M��K�nM�I1Pv�Zx����s��߇$|>����K��Q�����?\n\Z��,e�d��H��e�`��;pl_�{�7����(��r���!d��rh̙��?j�G\n�A\"J��Lzz\0{�+���\"k�E�]�8�Jg0�#~�;�Gm���ߓ�|��+H�O!�GbJs�>�A\n��W\0�wW�T ��6>�v\'޳`2Y�:ȨB��\"��~��\r�X���Ȟq�\'�B�@x<\\ڕ�\Z�| �+4\Z��n�>O<A1t��O��[�tS2�ayG:5G,�i�#�Z��7�|���4Z~��K8	��5̀��^��L1�аP������A(�HF���/e�����{���?\"��\0T��� j��!�(&���i	���~R*��b�\'�\0Ͼpɼ�\'�^,y�q��ktۙ8ocE*�*<��Ϭ��/V6��sp�H�:�l���(��Ϝ�TVnH�c����d_�*5?�;�8�����[]�!L9��e�B��il��l�@{q�/4�v��&;eҝo�d�A9������Du����q�{]į�#�N)k���`\nX!r\"���k���]�-[m��x�,�g`�#1S�����z+vo~RNP%a��h���Q�����R�\"�L=x����������#���@��W:*�=#�Zq��0c���L�ѡ�n[�Z��J9ϩ��6�e;wTs\\�\\qI��7��l�-�����ٖ��g!�M3�\"�H�Q�R�g�$�p��`�>ϻ[�{t��B���3B�� ۠���xF/��(���?���G*�L��If���k��_\0B���R�<��\0,�tge���Z��i50Y�� �ݾ>DW�\\U�����\'s����ϒ�]��4�u�$$Q���d[s4�����P;�\Z�I��SD�\0��@����C��F�!�ps�#-a�[�إ�-�Vv��\"b�f�֎�?�|�v��%$3�s�O�ؐ��d�[��5�}�4�U�\"�_�����tl3�7DA��|�X?ǵl��\\l4&oea\'����8����|��IU:q�Q�)�(�z���8:�pq�+Xٔ�x�f�ՏPby/+�ω�����(�T.̝+�^!��й����Q�����)��V$Y�s�R:|��|���ļ��!G�ۋp�3]*(&2��0�:<z��ĥ�T�Q�҆�3 �c�yK��\\�h�U��[ל:$���+X_J���S�qWx��ᗴ�4)�=\0t*x���$����gV��E�&h�Y\\t��3��z��NQ�qn��Ֆ���־g�_3\"�`h������Z���2������6ژs�-��@?r�9A�\'��fZ��+$ �������S�l��׀y~a\rDV�Bd��:#ק�J�j�{\Z��|����QB>�������l��DC�7�RY\'�׭�x,�����z����˅�,�\'~O�^�}��]�x3�EgfG\nN����� \0�����e;ډ�9�N+��\r�S�I�����-~6���Ȧ\0肜�\n7�0�g���{��{ؚ?.�M�e@�<��5Xb��_�1�\Z���~�]V�r�� ���=�V�yn�,�x{�	���u GۑB��hS���ۨ2��O�CG��H9�x/8�PDJ�\Z��KP~j�\0���ʔ�G#,z3�k�&$)u6�p�B3�{���*�3e��U�EeR���\rVY$�q���\0 �--�4��\'�N�Wc�MD��e=M�i��gL%���Z0�ʣT�^s�(�sz�ޢ]��k��C�CI�l�[�/O`��W�7��\0�䨒οq�e/��;��CS�W\"{m�MS��g�e�05ƻ]�Ӂ�`Ɠ�caJ���8��4K|=���x3�T?���&�{�`vӏ���베0��0���H_����$\\$cN=���ĳjHj�o1���K��ګ`�*��K��.�؊�Jj\Z��^��f_k+,	����,�IL�̮q��=�y�g|��]#�����/�[���QtYa��Q�&_�>b�\\%���.��dx�2���ٷpy�7+1z	����\r˴��ʜ����Z&\'X{ބx�.q� �_S�zJ�E��{��J�I��W2�lY�r���\Z_��s��\\\'9_������-�0����·��]�K��F;�G�E����ep�o?s�.F=�\r�0%r��e|G�� �>��*�u	{­>��DE��fh�Ñ�A<M�t�,��5�)xZ_\0����@�V�!��[\'�jh�fY�<�\\�T��Q=\Z�[�0��.[���X�=��I���\Z|,��ݭ��VO��	�y��|2�R�,�Lڒ\'�Q�5�~�j����m���qWQ0��~V4���v2�ڨ\'N8�Lu�:�EE���ҊX��|.�܋�(.r{~�Y��)�z�����\0:���@/���-��Rk/��.�]?yp�A��1�K7�پB��N`U�pLCߥ���8\'ې!y�&�*�0h`�,����9$�8t2���hq���HG%M;��CO��F�+nP����}ֿ8z�-�ݭ��_��/��V�)�{@�v��� �5_5���Y@�G�f�)c����8�S��Y\"�{Q�#J!������/:0?Pp!��(맡�3h���\0��a1���\r�g2;�?;��hFG�,>*a�W�>Q�M~Rr&�\nG����Hx�t��?�!�	|�rE��\r���(�|���,�?9A�&����Q%��v/�R�X��_�s�/�>�ņ9�1j�،,����T��kԜ��<���38��ؿL\"���#R�_�>�aCb��G��E�����Ob��7��D�\"�08_T�eX�t��J�y�τ��@����\n����0��M/9�\ne�������0�y.���%���a�vi*��\0 ��u����Pz%��(K�TO�8-��\"��\'�p��{�� NՇd��t��ć��^�?u�@�yȻ�\nV:(���J�]/g��\n�F���k�\'EC�Ks~�,��\n-���D�c4�KC��[&���*Iù�JIJ�>��I�\\�#�,�3�	 �Am��I�u8�a�DKlMc��T�X���)��@Ȥ�()���,���àQ��r�3i�NK�\0�<I7�v#�hS>`~�[j�]z\'Ɓ%��RT�J><�Ǌ����8ѩ]$�퉩�˭�O�X�E�)���[%����	��[Cr�N5��?\r/cݝ�*�ќ�?L��$x�� �j)����1�1𴷡}G����~�׀D?�F�$q����C>�0#�Լe�z<@�)�TЫ9���7`�N��9>��?0rS��(���e<�b�\\�,|H�=텋���SL�m>�ؑ\'���`�<�g��KƏ�O5��)q����p��L��L冉�Z|WO\'��cS�a�iҧ�jh(���d�����F��a9��X������p�5ӗ,}��B�?�)�UL_m.m��Sf��5@9C�Z2./�-�\"A1Y!�ؙ�$�AV�Sw�1~W�W�.\\�4\r�G�v$V\"��ǐ�M�v��%�+Yh`�v�d���Fc*�S��Ҽg.�������Hi�ң�����;u���:\n���@��W�\\��p���5��|:U��\'�\0<���oiN,�D��W��Y�QG�����zN�����=�A��0��3\0Oa���\"��8���/vd���O�4�p��;d9z\n5����{�Rk2x���r\"�K�/f�N\\��PR/���\n�\nk$�f��^�p���M��	��k�s3p����+�\"�P9\0�˸WU�<CI�:B�p�Z:�r�t�t�\0=\r�6�v��)%�{�V���8�8^\0�����=^���#\0h����\'e����ݮ���(٘K���1DE�W��A�\'Ƚ���A�+�3i��������^������b���Ř\Z���p�V�ػϡ#��5��\\\0�����@��)%�z\0���MA�0��f(��mǺ\\��iS$(o�T.p��\0(+�&+�{��W��d��� �A\Z�0n�t�y�[<�g��e4����6�)(QL�YR#$E:�����޴�)kČ��k���&s%���$�047P���=\nv�U����VezZ!�\"ϖ���Ŝ�5����6eX���ݳ(�\"�i���]_h5�q	�_|ah�@��O#�a�U=b`�2�C���7��g��>5\"��g	����h�sw������y����M=2ܕ�\0����F^ta+�8�!�nA����P�?n\"�Ǔ�?�x�T���]*�\Z�\\��~��P�u�v5�nUҶd���&\n��Qf��y�r����F�����ӊ!���B\\&���l�i[͏��`��#gU#L��F9�(������Y�%y���v�YL��nk]��E����Y����CG�&���j��T���lZ���0��M���.b��n���ה�n�q43���f^0=��g�!ț~[�n75��i�pL��޸��=�Ve�e.�6f��ά5e{�5��BUc�-��~�/9h�z��T�ڦ�n{�<�	��i-�����ۭ��S�b��D&�d���z�Z��/�8|z��p�gO\Zv��e0kP6_g.�Mn��d�]G߿R�jw��I�y��F�ѭL�3A_����F���V�mwtj��5��uEA18fs��Sjn�:T\'z��� 7���6P�B1A���#��`�@<>�aǅ��̖���%��eˍnoڤ��b{l�+�pn\n)�e��7�����R9I���8��l+0<hL0�^��PU�U��k����j�{kBͩ ߴ~�ƌW��,��H�u��bt�[x�2�l�6��ٴ]�-��y���S�nf���M��ڙl�.:3]H�9�.]yT�pi�47�=��s�Һ�|��윳H�ێ[AV;�&L�^8���.Z��L���ިR�ݎ�J�\rnK��/w*�fC�d�f����0,4�׬���kC��\'U��W���B5o���;������[����\Z4�G�9��_`\na\"��e��X(\0`F��A�pw���b*ٹӭFyZJL1��B�����!e>���(���u�I��S��ǝJ�Yc���q��l	������[[<=��[�i#񷻑vp\"AM)287\n�3j��P)���W�w!:��+��^�`�����=L���LA�_y��|�����������c�#�bZ�hWr!0�;/�8��]p���&.JY��flЬ9R(�%�Cis�ei�)��LE*���\'~ЕΏ0X���.�!r�1�6���D��\Z���5����R�E������6B�<����L}q�,�(�pX�f�7�q���\0�b�E\'A�?ƿ�`4�) yӴ�$&t_��;\n�\0\n�O�ϴoKi�h��YI\Z��fM�׎ɢx�3�R���%�]# �FC���#�(yC&�n�l6o螿i}�Yg���=M��{)YSt����/\rMb\\���<eQ-�C_8)����8�S�Eb�=��7(��Ȱ7�/\\��$���-\0��>R6���(3�Æ�#�4��#Q@)��#w3�b~��W��+�ɺt���x��[\'8���+�\"0%p����Ġ�S1���N�\Z:%S�>\"��Wt�j�&ެ2WZ?]� ����5|���(�2����2S˴�\0P1�,X��e�T��x�@�Z��.�ȣ�}��5��@����PJI!_����oI����#	<�R�2o�0W�K�{J�gM�\\���A�8��.�L\nV`�⁒�&��%�᧱����\0�Y��{(@��py_��k��c�u�ʼ\0��w�8��&����Zh#���\0>xځ�3���-}���l^�$��0�z]��Z\"Ї��K�?����FZO1��k�ɢ�Z�m\0��S�0\0F�`��8� �=Z��gA$����tl�E���x|$��yd������:�ZN\n%�<����.>r��?��X��?�̊[,��u��\"���o��À��^;�\ZYxk�\nOZ��� �Ա\"���űF-��gZ�Q�jx�N�ʾ8��U~���(\n͈`�\09E������CU/.;�s�8��c0��`�\"�ˣ��Kq���N���Ql�P���c���{�CY��(w�Q\n�@�H?������H�L��(`�w*%!���	���\\�K�m�X�ŜBZŷ�n%}��}h\"��MLp`L�a��������Kz0�\"M��3v�������>�O&4Ҟ�\\�\"W_Գ��\"	GT�S����#���\'�)j�,r���4��\"�m9� ��:�,9���-_;�:����&�3^�=���������(�E`]�t���f�zE�>���j��;�qJ�o�L-���@����\"%�f�h&8^M�P>>jԁ����g�z���ǂ�i�4z@����=R���P����G@�$�\'`L��$�ɯ�b��/���*L�����9U��y+�(u!���T}&�D�a��@OR�DT\Z���u,�z�\0��*�9��M�Q9��Ϝ��H�Ǩ\0�h��#q��[(2��[�Л$fY<Ҋ$Y��H���CP�|����J ���#J�#S��\0-\n����S&L�0�A��J�PB\r��Ik��0����,�G�.�T훖J�Fj�vrC���#.n4��ݶ��EW�`��5~1=r{���ՙ1[1��1�.){wة�MB�m,U��́OS�2�V�1ڑ%s2	�6O��SF0�����ͨhk�؛W��B��f��S����\r�`۬�x�p�K�p?��&��x��.�>S��V�Cy�f�gM�Ne*	�������6��\nMi�Э�h�0���,.F��E**�Y�e4���ۯ.��|�{}���Ns�2+r�W�s��	�,���(�\ri�!$\r����=T�Y�p&�����F�4vh�k�A��t�Lk��u�\Z�5\ro�D3{���aX�];h]14��Q�ꢶ����i�Rka5��:o���qm�\Z�i8S���݄O�����U���m7�tc��f\nR����f#���@�-�i5Ḻ�zgl�v�ə�1���K��QzS��#�Q7S�Z��5J<Sކ�lؿP�mNQ�����\rv#Ea>;[�@����\"�!>G{m�iO���_���6\"S���6<��\r�9́r���YS��P�狇j��r�5��!sk��#��U�2��i�Ki5��d^g�+k�ݨ�!�׸##N�j�@�UivX�u;]DYML}�]#Z�\\�ڐu���~Y3���v�Ґc*超��(r5������o�X��aC��!�o�UvT��ة;\Zq��Z��uƠ�ݙe���Զ��b�-��i�7���Q��*�`�i4k1l����~6�����V��u�˶�ԥI{/��Sr���s�0��ҩ1�X�2�6���SS���{l����\ru��ɶ�\"�4&�\'�۲ϛ�ND���t���E�\\n��^�\'a-�m�0���u�J���ې�NC�@^onE]Ow�ތp<z�=��۠���]��{��w6#����*�D��\rǛ�z��\'n��l�$��f����6��\'v�-Ȧ�nP}S(�F�9K�8�p$\\y2P��8٠[��ZS�@��l�Qښ��έ�^k�����9^����a�ќ&�������825�m�y���==�ꭷa���w��yi�:�|�(�}m 1���_[8��z��6��z�ia�Ӷ=����M��\"����,����e]�V�n��t��W���LM�r��u�[b�`.ۧ6�>�\Z}o��P�z��\rnJ�\'v� ��!t��me�>Ӄ��fa$�&�F��&͉�Un��^��ܝ,�e��&��yу	�C�u��P���;Ԩ	��fm���*�SyS����:�iVw�WqH�N��g�n�u/+�-���#\Z&<n��۬�:RS�X��)[��764;�z����ӕ�Tph6�����uIq4���-��#�9�Y�r,n�����Cל�U䶢�ц���Hҍ����;�D�<ShU��h(�\Z7\"\'�睂�H5z��8���(��d�#�TK�J-}�j1+��[�ƨΠ���p��F�~����ڝ�Ԭ����\r;q�����F�5�j�֥Š]���g�B�\Z4c�~���b����d�|�m2Ա_���,�V�ڰټA��8Ot�p��9�2���b��j�b�}sѸ��#m\0A4���5G��u����Oq�1�l�qA���c�7�W�E����\Z�G�ƵeO���p�\r�\"��%Q�5�N��ᰢ��6\\����m��r�K�U��)c��^�2��]�ޖvCU��Z��̚�6�ǘ��yk#.6k�m���@Aov��h�V�aJ��C������s�z\'�l���Ak�6R����/��yW�<��wl�螅��,<�g\0�)G�Y�\Z>\\7ǃ�(Q|��M�o��%9D63\Z!�ܳ\'-b\"��=w��,l`s[H�C�o@.��G�\r�Tw���M���������޳������YUYT�d�%�_�v�uǯHOLMqs4��U{@uD�AcB�w~��-��8	�9��;얩��*ڢll/}��%[t����Uu�6��Bm�[o%o=�T������3`�**�wP�n�8�]��d�=mb�k�]�bj߃��/����\0lGզ]dCw*�Hoֈ*\\1��9}��_[U��Rʙ:�7Ӈx�g}aG����9},c��;�Gz\Zi,��nw�)�+dM�v�i����6���N��ջ�$�n��X�df��w[,�\\V���3�_�Ka�uj[o֪����i��z�`C�|$�7=�ܚ;\\���U���4�Wט���m�G;��m�B�$��.���� 6�f�T��o�L�`Йބ�~y�X�D�Fn�Jk��tr�11�[��q����>���b4f�iUGY^�,���)oǵ���\Z]�v��(��ٴ�˲��Ⱥ9W��v_�U���jL�9��/�q]�G�)�<rIC@e�EtΜw5�2=��<4�,58��}�w�Mj���ay3Y�_=L��p�|��Vh�k���l�T��r���n��f�[o�h2�&�;_��U�rq���o�ӕs8@���m�wAm���-�򅆅Z�b��΍\Zu[{���Vm�m�ߞ�sf���E6P����V� *���go$�W�uM�81\r�w>�:��)�ӯ^������\"5I㺳X�fo���k�bg3ݞ�ݮ�\\l�u�W��,��Pn^;ލ��7>8_������I۾|:��z��\r/��V�uN���N����[�5Dv\'c��<ko�&��0�ҥ�\n0e�=�c���O��p5kho�����Ⱦ̤�y�5]2��jV&WRgh}S�F�I\Z��|�S��,,��zT,������Q�ȩ�ճY���.��C\Z�$��/�쟋�wV��wt�,�S����B,�s��-j.[M�(�+�?ܲk��,�)�n�kw�m�r�u�}���\'�=�z�3<܃H� ���|��\r�;&�q� n&n6![F&�����$7n\"ui�\\I��Y�Zc�\Z%5ם�al�#����ѻA�V����B����2Ď��B�Ч~�-S�,�sj�g������>�{��C�Gj�\rv�V��\n{�M��j(J�2����,Y�Dש�M⹆ݯO���\"\Z��JՆ�8���НcĪk���e�H�wf��e�ZRڙ�:��vO��FO�Z�ݮ9�{�Ek8��e���eC��P�u���`;ٓ.�:�u�9�}���޴=�\\\'��1�7Ծ��W����yn5���~�n:��u�\"\'>�˫�.�ʬ�]\r�s���|)\n\Zq��,���Y1�uo�e9��/�~`魶��Τp�Ui�:�����l��fj\rb�l3����We�xkͮ�Y�i�Lm���p�mo�榯���C�Y���pŵw6;�ӫbv��q��Oε��N��\n>�f\'�����ݭ�Z��l�?�qL���&kX�j�;鲝��qf{����\\�#��O���)�\":ޓj��!<�������S�΂imF��d�e��yY�֜A`�¯�n��x��k���o֗\'u��,� \r��!��)4�O�B���2RG���Z�:��З�Ε=�o�J�k����T����\0�-f�K�z�@ps�a���1}�R�ߢ+}Z�vǺ4]�n�Z��&,��qm^�����oJ=LU���h3]��tk��n�U��]�����hO����K��\\���ؗE��M�H�&�\rN\"\\V���\"*u���ضB���᭲h]L�Ro��>�Z�Z�h\n��C,�O�m��h�ʟ`�mu������y���`��N��?��[Y�D����Pq�F�f���@۞\"��3?����A..��1��DS�.�@T&晔���q7݋%�$���@��ց�l̋�9�h\\���	�u�TY�(�#�lv�e憹%7�E��=_��$Q˾����Mjbs��3E�v�v��� �6���L��� ��Ә��ڬ6s�.��m\r��+�Ε�\\8��a�ʶ޼�}�T��qW1��B�O��6�c��M��r.ݖ��N�h�(�^�C50�дM�I�f5ѱ�Ք���N&V�G_~?���%�S�����%Nj��n�8K���������J��w��j�ua�4�6鹛�xZ��n6lvȉ� ��m�*U`76�F[������?�TZ�J�\rTh�5�hu�^{⵫�B����#\r���A�g���tl��9�������y5lԎ��<�Rg�^�]�>Kfp})�dᰝ�w�f\r��D]��8Uf؊`�\'����O�Y��j����n�=���ү�S-}+�W�].|�����N�ؖq��p�C��8P\"чA�`�1u�9��m��-G�Y��\\�~װ��8��=c��zK-�����$��\n����f�<8���������7Y$1ad��3�m��M�:k�!�^2������=j�;���&mW�Uٯ�sh��w���tsxrr��xVp�1y�v.�������\Z�ڧ��\n�\\���5��a��}~6����?�z*���u�;�p%W���\\L�]��v6�E�jZ��٦��ƪVk�DJlW���q���݌a����U:Gi�)�t��,��i�XX�\\�$MU��Ain�Gf9��Ƨ�1\'ܶ8�BaJYO����ju��o/<38��^��WUh~l��|�����3�1kٗ�bۼ���?��=�4q��s�YQ�E�C�*I�z��g\r�ӺN���\"���׈�����5]����:�W��,{j_�����ݳ\0\r�,��=Qk�S{��L��\Z��+�rO��H�D-B6U�\\�L��tT�\'L���3�����+V��e�k�uuW=b�Q��i]i26��������7���踘�Ut!rj���G����rU��!\"�眥�C�x`�2ߪ�YEdvs\\c�}�2\\;^gLWv�YݎM�p��ł�i�n���Pq���r�o��ͽ�_�Q՘>���F!�^��l�;�LךC�6�m��m���Ò��s�*ʜt#��Y���̨�\'�WEX�_����@��V-�u6A�S�	\'�;�����N�&@��[�*Ҩm����^�eF��E�#�95V�m͙چ�RٵI�0�w}�p	/G�R?�[e=��]k����N�	TB��>��#�W\'�6�\\P1��N�o���&=��ؚd��9i[��M��=���+v1]���e�ﵺk�o�\r塦9�&�ܙ1������U�Ч��Q�~��o}�w�tw�Ӈ����&�L��=�huFY��J�k�=P6֒�.���k�GśLi�h�������ܾo�*�\\���8#�M���i~� ��ә�EBr�CH�gо���=C)�~q;m�=A�fK��C���.w�1zPS�������.Y#;\n�u:g�v�����0���<��ús�y8�	5m�Жp6��ӽvg3\rZ�\\�O�s��H5s_���f�;{�V8����V��p�����ĕ��Y��������<ƴ�N��~k-¢��7=mc�l�Q-�3�	(Ca����u���n�9٩	�65���CSXݨ9uU1po荻2���4y\Z�f��Y����o�4֛ң�W��%��j���q��W��g��e[H�����^`�09�c���uLk�9�8�\'�g}�Z��b4��~;��\0ݼjg�L\r;D�]���>0\"9��g���3;q����3l��L[�q�Fx{]���W[��Sz�z��ٻ�h��/�����g��l.Cv6T�2fc��V�b�\n�\Zȕ��\r��\"�k���������#l��^Ko(W�S���v�;��Fګ��E�\\��w˃�����7\\N�#�h��y{5�pKڝd�1�^��ܥg-u��Y���6��S�[6\'&����Ӑ���+�lX�h�f�O�R�/h���rk�?�b��d=�䵷�Rl4\r�ч��hf��?2[�s���z\'L���eFq�Ew�X-eHi��AA��8b��IVL��9�3[=����uu0�	y�Z�V]ak��\r���mu�ɥvⷴ5�e��.��>>�ٍ`��Mc��4��*CWdE_���]�[�-�^�����D�e�q�/�rr��&�����Q�c�����J�2}��i(���P+����5쵆��+Q�W���%���i�mڄ��h��~Z׈�h:�4��Ur�Y����Ђ4H�°c�d4:����/�|��R��^tHDu`�C����\n���<��C�?�u�y���v�Q�\Z{�蜑6{B���1�fu�-�m�i�*��٫̜Z�����ȖP���z�w�F!���)�\Z�n:tKWqwY\r.�	���3����ֵ���ezO\\�\0VGq�(>~�ш���#si�����DD�Ly�H��bF_K�>��~��My�R�P��S>�q�� J\Z�f�(��\n�L������������C3e+���\r�HEk<B�}\Z�9qa�5c�CQ�1(��/��7�B�E�P��<��\r\"24������88cP����X3�����~�����ʻ�ʇ�i��F�O���0�6 o������ ���F�����Pυh�%�[:\Z��t��i���Wмk��^��K��|l��J\\��\\p�\nq�: ^I��̄:Or��~q��W�%>JHM���1-/��Z���8Vk�U�I3Ģ�%5��0�q	b�+j.��+�\n�5ܣ H�D+~W:`��qp� _��6��\0Kܝ�����\\�\Z�[�GB�a�0yo	������R,�l��B�̃��a�97�����y�K��6H�D$,7��\n.��SFg|�C���#��<�u����4�f�f;�vw�k���~&o��7��3��{���a\rd��g��U�x�ݟ���:��g���1;n��J;��J��J�b���\"�ou���\ZaVl�VA�2!�9�<�,���\0r#����9heS�5����K�f��_/����V=@��kp�CۗH��I��pq����vV�v��z멾��:�7�j�6�t5��\r��i��p7�𽽌���r��v�amV߷n����^��W�}뛃\n��F�+����hufYoD�FBc�]�)1���ћ�ë�n\Z�b����Wٰ�Ʋm�j��30�Z�J�j�5��}�Am�7ӛ_G\\��a���U�6*�d�&��N�¯�3�� Wz����T�映����h۶��dԬ����O�g}�h6۵��&䕁�L�|��R�r\\^���13�y`M����r�zVk8�iŪ����1q=m}\\@Vmٝ���<��Uk��Ffk�����������\n�UC4o���Nd���օ��tT�*��ٜ�Z|ۄ�y��w�Rw�MoWNW��f{;V|��_���X�Q>3�+s�o�� 4�)��E�%���@��V7�����pؙy�/��f.�*�i�y���<�A���꺵ь�PE�c�η.�/��Z�N�PƑҏʮ�Tڋy�jK�K��q�*6&��M���:���vƴ�mor�s�l�F+���aJ�<�:����t�ӉY�n����R2��u����\Zך�)՛XLgC\r ×�	�j����y�g+\n+)��6oΖw�y:�\Zڠ� (\nueh�:����R�w[\'v�6WT󤈛��!��\"�]t����4G�B�O��7��Z쌴[mg\nRD��8�y�>���ls��X�07��Z�b}�¨��i�[�>Ա��9��CjS������Z���Z��[��c��mN�4;��h�x��Ü�Q�tqk4�F����u�zko���q���{���xZL�j��C�ڰ5�b�����H�i��Q��T��cW�_o8p���kژHʹJ֯ݑ6���*Z�����Py�7Ь;Z��l�\rm\Z\'���Fʅ_��Q�I2\"C/�Mxژ�xՓ�v�Q�����t�V���iS�4ja�z(F9s�p������<\r�6�z��R:�|��k��x�wqV��r����������,({��;�tj5����8�ݴ���\\� ��m��J�j�S�զ��	�.�F�HAn���rѽ��%7�d��Rx�N�y���g�j��\r[U�Wr�v�����i�P��tkV�����qB�F鋮��~����R��-Td����\"S����C�>畱��ڴN\Z���V��>��G.��z\"��ƴ�C�g��1�t�frιm�j��i�k(a�+�F5�bGZ�`��\n�!Ծ2�1����T0�Ne�&#��ݪ�9ּ���Pv��`gr�gń)sW�L���5$�\rm���rk�w�u��\Zq�X�u�\r���@:��\'���gN��%g�T�9uZ�����\n#Lm��t�W����u<����F�|��/K^���+�ֹ�N�N6�c�F��Z���\'k`5W�xp�\'�_��H缼���s6�3u��L��������3o(��Z+����؞���ª�c�u�1���ڎ7�&�L�uE�8uį��ez����vHXo?U�^S�f=���\"C��*f]�U�z�S��8њ�iV�0u����Qڗ��G���sk��ud݄1�\\���{d�#|����;�\n�^�9[7��?,�3�Ԗ�6v��I9�z��T���R�Ac٭6zL�;�u[^��,�|q�Ƭ�5xe��ǈӑ�	�3�u}>��V��l�{e$@�#UYlε�7x�vq\\;�u�;5N����)u�2�S/0o7����/OJ����	�.j׵�����<]��]�ҫ���;�rCY\\v;o\'�^ח\'�.+�f�ꪨ\"_f=~�����}�iL���i����֒�N�u[��@�1���+y�\\�Tw7�t^S0�����iMFk�M>/D��qkW��hц�%�3��|>�8Si�g&:Ď�B��$����9��LeW���.��	1euL�E7ٛD�p��.pu��e]�f�s�pØ�2!:;�L1g��ޮ�%/��M�>�nF�_\\�j�6�+�z��;[h�b����vg��q�;�3�k�Cu\'��vb�����<5�`�=�Gӓǁ�����H��r�l8�	?�f��\\�$�^�W�5�P����B�Ҽ���s�N>���|�?����!�\'��L���fz�L��?��I�H�\"�a���|��{�p��K���5�_H���?���0pj\"4X�7��a��:�.�E0^�y�V�V���j�s�����K�]5W��e���N����W�(+�����gm��Vo���1ȏ].ex��Q6�ex������y,�����g��l<���3�Ϸ�*����@}xV���{�5`t:��C�Hx̴�E�FSDg]������t�Tz�|\"n2:��&ޤ�q�o�ۃ����3LqP7Z=�w�>Z��:��T����#�����^�k���3�Q���]p�F���#��V���U��G���r�N뎺Xu���`ĪkK W=�(�ުq�<~ͻ�M]�1�v��;��KZ7�&ל�G?��^�Q�T�?gO�]6l�S�=���gf�lV�u��e�]�é�*��<�\Z|�1�ʸ!��Tc�׹z���1m�}�[��2�ċ�a��&�+�Uds��ş�hTIt���b�XvT�R�&�b�R���Yp�3E����]�IM��k�i�ٺ4a�j��옛���/�\Z1M�T5�h*�q[�j�]�\ZĦ;^Q|:T�MZL��w�Ζ>Q򶶦w�ր�	�#��.\r��:���ΑT��\r��[T]8ʎ��іt�+�Ҏb�p#Mﶺ۹��x����~?���u��eK��g�l1�8��7��#�gj>���!�c��z}r���E]\n��H8O��f6�Nz�!cA4;j��R���]�\n�,gо�[]wa�桻��\n%J��S��(�U��#����.��k�΍��4VX�Nz�W+t�����D�&L{zQ��\\��U���{����FK��d9�2fV�B�5��������9��b!�3�uk7Z�M�tD�t�s�q0�6w�����,q[�L9j=��1����f�[=���8�(���k��fk��m���z�?��5y�oU���\rI�g�A\'�?��U����ȚU=S��^�w����\rj�����2�j��Ɵ,�G��ťw��ѬE�u�VUj���nov5VA�L�u�9�}�)�;��B�^x�m�Ra���\"_y���ƅ����6�,=�F,���\\ka���]�)��X�\Z�>v�kk4�y�Dsd��z95��?�V�|�լ֟��ޚ�/�錵�Ʈ�<z�.LkLI�}n<���ܚ6�+�j*��J_�S;����6j��G��g���Ng��w��¬�ݜ�D����{jT\'�:Ο�y@��Y2�\\u��7���ݮ��Qcufn���ʷ-v��^C�A�a�F��#��L�>}�����5N}���K\\q��rY��#\'����j}�X%6�j�7(���}�Hm�MsH[ji���Y�qLs�@n�Q���Z��X�JW��N�Gt�m��Q��5�8a�	�a^�AЭ:p*B�:�V�Jo6@OG���\"z]L�V���5J3 �Gm l�h\r)va5�F����/�;�ݵ�������ښ2�)3Y��Dfɖt3�^#�f��3D�����H�o�J�?B�X���F�<�H���W7��n�!����,�\Z/��[�ŉ&�#렝�S����6���ӎ`���i�7.dܖ�5�X�VK�\r8�?\"�ё%c��˺�@=t��v�����ob�Xm����������D�����ݸ�����0��8��Z�x�4��NB!�Tq;����L[\r��N�ވ��Z�:\\��� ��0���ꠣ�����*���Y��bu6-�� �ɘ�ϜЎX*�]o�\n��e�W�F��]��\r���[��Z��Ix�^N��~8s�*���u�ط�V�;��A{�j�aB�duVn��])���u�u�;�:ٿ�܉;g�-n�펍-��T���ϔȈ\rs�zuW�Ҍ��-|ژ]� {-iӁ��8�7���Ĩ�R[k�M�tְ��������\r�*��M77�ط���ozOm��a���-eK��쬚�r4�ugWq��Ŋ��hm{1�޻�����5�s��r�8]��ƺ�qm�!�L4�L��OM�i-_{�9mho�u���svRGqI�\rB\"*���N�u��d\\�;�g��+\'�Bı*�:��BC��2��p��}r_\"�#��u���E��k.J3��\\�̴V���P	wz�9=�p��6s��yh9�ٺ��F���U�m��^�*M��ZC�\0��u��%�>3�<j�k�A���:�_���P��\'J�,�����v6����f���wj5lN��Ko��2��h0Gc��W��vf>�r}�����n�Z)m��:�\'�N�e�٦���3w�/f\Z6�ήǶV��hp:�����qk{}�(R���(�E��uѽ�[��$ r��n\"N/�����<rE٩g/��Q�s��M�����\Z\"v�M�lGUn>�9�c��Ʋ���Tr���8{G������.������hu�e�r9�k��d�12r<t���Z�)���\'��ck��D�Y�M�Aw�>�˪�j�t�Z�sk��sס2a�:���\'e�:H��tgJ��R�L[U���{�kSG�N�:�Th��Y�l�>Ot��u=�U��03����fy��5��z!�dk0_g�2�ސT�tKm�g�9��Z��H\\L;-��:�uj=�*�ȳ[�nkUN V��-��&<[+#_��\n�AG.�aCKZT<�z%f�.�\'�+�G���|��ِ2�*\n]���&�l^�^�؍�\']�)�p�/}}f�F�Ҙ��Im.:r�R[ذ)\\l�5f�PG���4�Q�A�N�)�Ϣ\ny���dlO�*��R/�#Ѣ+���&����Ӱ��9ҥ��J��[I���M[p����V,Шz�L��\Z�=se��k�jo��fw����i�h���ݢ��=s�g|E��e�8[]��l�}��jU�����Y4*��jjw��\r�Vs�2�%\n���o�E�����\"ɬL����G��U���+]����ɤ��ZVb!�=b�awC�ߏFX}�Wn뼅T�ͬx���B{;�,�d�:5�fC�gc�=J�,\Zό���O�@h�\'�ٳ���%l�!�����\0���\0\ro����fxu���m�_�נ�lat�\r��o;�3�;�-����1�\rt	�nk��k�\'\"R�;��V�Q����o%�\"蛕�!lne4�A���to�����j\Z�M�����9s��)u��<�{n�uCl�� ˇ唱��uu��Zs~�OL�I�V���=���\Z�[�d������\Z���X���-�����`�,���@��l�usG�>�a��\0n���y�N��ؼ.����+�������t��b�v6kh����agN���z7����*C^z���\n�]����~��p�0uf��/�HL�\"�v t��e{2j�|���ZR�ݐ���s;�Rp.���vg�.�=�ȓ��}���5H�oyV���H���������40��x:[��\Z�?�c�<��iKb�-Ti/����G�5Z.g�D�^�_W�g��:v�s8�ˮ���4��!�>zX�Eh�W�C�v�D�o.��<,��L�\'��J�Dj6�Z�J���ebP5�U�L�*[A��\rc�e�ǹ@e}�4�Ө?��u�ѩ�5%g�y�I3���{Η�7�9��;Tw�V{ḧ���8Z����t=��*[�Q�y@,7s~���v5�Y/5��=ƞ/`B����X=��m�4�+��Z�V�岪�ky�v���SoV��u�Xm�8�^�\n���gcj]��y؈�z�LǍYC\Z���Zuv��O�G�Id׼�+�=�ʅ�9���m��2�,��A�	�I_�v��c�T�\'Z�\"Aot�{�OW�\r�ת�;t�Z�����*-�^���/{�F0�O����<�|&�o���⏽�i:�~�5mviy�A7���A�@�ԩ�vx�����+tά[+��@���ި���Ш�z�*�#�P>Y�A�w�G�DQ�V��.C�F��S�U+�i�Emok��n���}��O`o3�r��T�b�)�h�5_L\"ns�v�0:��℀�Ĝ���~r�Ó6���Ꝫ�s����K��&=�5i�{hzW\'�|Ձ��o\"��?tK��z�ag�m<���IW������`���}`�dȰP4m�jp�����%?�\n��L�v����=�~+i*U垍�����7�I���ж��Lg*���]Z\'iiR����^4i1\\?6�V���2S�z�8�_E�Db����\r)�j)\r��a\rG�i���A.�Gb����r؆�B[�(re��;�����;EcA�d�P�f�#�tC�#;x�1���G����ǫه2V�H�ҥ���g�z�$H�`�*�J�#��b��(�6_q�hL�_�7�K����5�L*e\r˟�H�fy�]JE8~�S}�\0^i����e�v�\rx~Q�+����f���t.��C��B�/SVs6\n�_�TF�Ń5?����ѻ�@K%p����j�\"I����t:Q���8��*���9o��;��\0L�ȝ!ߩ�L�P)-рŹ-��*a(/OE<z���#ng�:e��|���d��0�k*I��1��8�����f�h�W[������j�A�5|*koP�Zҝc\Z�0IZ�(�y:�Y�X��~�BI(�4s������`�J��r�\'̯��t�˛�R���kѱla���G���]`��ri�3yf������kh��W0x�W��|��+tAxe�~���W.\rVD������O����d�	R����������\\\Z�~���?Sgɵ�h��\\��0�@�*�ス�%�n��y��1�yN<�jJ^fby�k�>B�P�1GJ�p|&ؼe��2l�ō*��T�������$m�ɏ3�B��;�y�����d��wpz�O���Vsr�B����Zy��`Q�^�@���塎\n��Si�[2�c��f�ԂK-�pS���yQ��sI��8H���AʍlƄ�H\0��[S���+���09C�\'��J�����b���l��t�p��$#<�*����\'� ��7 �E����ob:����^\Z��^�a����!�؄:�D\\����I6ȳ�r��O�g�j��49�_J.X�:J�Nfa��GS�\'���\0￰!�.\0�x�H�U������C<�J�o���O�\'��x/)aH��(N1F8��π�&�\r��Sq��)�\"s�������)��<�+�\ZE\n��/�4MՏ���\'�����3Hﳡ\n�Pli�HO����G�,��v���t⴮�������@�sY���D����9KO���gz2�O8��\'���sFՑ�Y�@�IM�aY�\Z�#��4�r87�5�;�7.`�`�Hߏ�-9���jo�R�e���v�0���G�9*!7#��,#7Y�f�<ͯ�X��K�;�ϼ$HxoY�˥7�ו��(�K�Ňϑ�e?ψ�hF6}��*J�OT|��~[.H_�!��HN���+�G;/������,��;�o\0>���z�O뇫�	�\n�q�k8����#�ͫ�;�����5O��+.�\r�Z�_����C��\\e�5�2�a�G7##�ޤ��0�m:��#y��(�^G�r9�6�\'q:�_�로FS7�hNJ��\n?GW�8TX����\rLa�֒c��|��� �����vV����O��y�Sr�w�ȑ��/h��x��d�l����~�G�]\'�^�4+^�?�Η$��F�h���z��.[<�}+�|�B�P4}������$&�B�\\\\�\\���!�I��S����Ir=��Ly|������l�3KPHyf���t�3*1\0j2,`�\\!J�Qɀ�8�&\05	�\Z\0�?w\"!���\0�uC���b�~`�^��AZG�\"W�G]�ٮ�,�&��0���[��34�	�.�w�.(<z�?�}/G���>��~�|(r���OG���k�!�Y�C[�<�g��ʝۅ���t�uZKL�0���/$8���dH��X�a���%�0�����/Ͱ-����_C��~T@������m�D�A�H>���)�h����2���e�_���׀P�� �2������H��%jR]z2�QĹ��zd�N��(K�T��ʹrj�WW�s��;�����NDi��~����)C����t�ֲu�i�o��\r�\nX������G��A�t��=]O���\Z�@��W�WZ�\0e��r�1���V�β��ü�E���m�U�u:�{n�^��/LNR�OLND՜���v�ؔ�H\0�8�XX]���H�<�3�鷠E�U]5�B��@��<�T����[(�w��K�a��h������d �7�P݈���ޠpw��u(�Y���`�%\"X�Q�������>>Gڹ��`<l-$���%Q��*�.ySIz�Ap��YK���CE`�Z��%\':�#��/�4\0�dd \")��0ѿ	�ߊ���ٹ{��[&�m@����G�	P��5A�\\)T=!m����#Q��z�ZV�;	��\\Ö�g����> ��l�Њ��cct�g�\Z��1~��h��R��nO醶]�6��4�8V�Z��6!my[��|f���-Ԛ`,��_lP����}wGV��66UOhú�f�\r��9�I~}���XԂ��j	mf���(5��Yl��瑞�m���h����8��n�d.���h4� ��Y��P#���H�.���v�ut��.��0e���;{6e6w|cjLf=K�L�c�<���L�60��핼��{|p���[�:X��5�&�ph�V<��.�ٮG;���>�\'^k\\��Mm���5[�j�����/�z�P!�C���Q���b�#�Ij�΃s�u���\'�6~�#ha,38�0��7H���*��e��N��{q���xty� ��v���s���Q���ܿ�K������~��0Z�]߉+X�L����S�V��p���:jR�?O�؟�q���:�1�1���[�5����K���\Z3�3{[��9s�2��p����.>����y�aw\"3�\r�4��\n���?6�<=o�\"��~tݮZ�O����<$k���u����QJa�!ҥ��f5��~�D�#ZI�o����lWӶ`Խn\'�ױ�t���H�-|�	���܊�\r�,��э=�n��h�\\��7G-�/æ�\Z1��t���|�@��֧��}�y����N�C�����\rڳ�����_��S���z����r��O��7<���F��x�p8��q;��B�,u��j��1�=�7&�|��!ӡƙ*mh��5v�F5�P�+�F�MX��ԋm/WF�*���v#�V����de7|3�N��X����l�{��z�7Hy}C�p�\Z�t�[�꜀)uHU�jGi�+�vj��ɾ56��e_k���<\r�:҄���\'��3sԜ��T�ʖ�!��o���m�!f�/{��a�Q�+v�;Fa�lѭhͻ�vm��\r��[SN��.�gP=��е޼�jw�}c�m\r?m�a߀���k���*����}G,�K��\\XҬ�ץ��oLKQO2�(}ʠ�?�B󩳟��qw���e���tr=���>k�Jc����c��mm{64$f5j���B�MU55��4&�\\�d�N+:7��c��H�V&��y�>�4��R���V�5��k�c�i/��qM9oo�+˭�<��7�-�3W0�ʹ\Z��Pn�նN���1@�Cg9�zm���Q�Nݎ/��byŐIGBz����<�y��v�o���(;����b_�v0Sw��Ak�^�(�N���yӾM��29O7TsR\'ĹÍ���}I�(� ���%�K\n��R��/���I���\0t1Hj��$Y9�銟��C��j6�΅efFw��PV��������`�\r�hT��~��Hk�4�{{O�W�[�րR6�ɹ#�u���u6تI��Vk6ՙ�[�Z����33dt�B��p)^���L,fm�������)�L���Dи9-��z��00�7�}��ն����{5Q�Ϩ�F��\ZĮ��u) �~�lG=���EF\"����{se���#�Ys˞���cT��3]�<Sj���9ܺf]��3�t����{�mL�1�N���e�e�܊�n#��\"��Q54^�X����[�PҘ�tl~���*,�A��㨾����Y��.S�~��-`�X��}��t���r�*+�Ө�=�W~�������?T�2SF�ѩ���6���_��?�&��&���\Z��Ҹ���/��>��X\r�����:\rg�y�����h�g������|[v��vV��}����Z�j�h�l�M�U�]�.����)�,���~�7�s��G\Ze�W��Y���_ۼ\Z�E�5���W6�\'����Sx!�Fc�i���~j���m�Ė?;���F�f�����2X?Gn���{����i���{c.�y�����xN��Ŕ�b��&���&��9��Z8��޶���|�|lX�&���ܺq��q�Q�\0��XNj�4�m�S5x?Aճ��;�5�������\Z�劎N���0�%�U!�tG�+�6Z\r��Q|4�����v��i��n㯀ټ1�lY�O5!�8#g���Xu�Se��;څ]����	�	<�/������r��\ZYGk�ר���U�ǫ�fz�y�C��^���H	�圔u�e�]CRt�j�j�(������{b6�.�#�+3u��԰�\Z/n��O96X�X�Ԯ1?��\\�4�\\�[��U8S��0�����@m��)��<�+;�$.L�1�FC�ۧ�Q^,��~���T���%���h���i�f������m���g���b�f����F�3�/��F��Щ��~��h�\"#�����\'OSEx� �jk4��ہ�:�����h�4���ĉ��ps��SA.��\"*֨S���?68,_�ca�]�I�7���W]�QG��*!��cm���LB\'�����W]��r��C��+C�j�m�{���Z��Fu1C1>P��j�cKͫ�ڎ��: ���luȱR��_t`پx�v�v����tž�SU1\\�nL��k�;^c�c\Z�F�uQ��Bm��j|f�4��NЄ�\r�L�jʕ����g��N/��w�x5���ο���w����W�\0_9�����n�dwԕ����Û6�����|�� �.5���g�W�^p�Q70�m\n�HQ��P���nkw쮼�t�縁ԯN�k�Ą�9+����~�nw[���f��J�����j���:�R����ՠ��������p&��&�M�|fi�i�\Z�hu�S��Mr��(m/�:i����*i~<O�Q9QÓFn�F��}>�����`��+	�M��[L>�:���W�L/M�ʽ�`GyMOU[�K�vSGTlxn��\n5j;��\Z�8W�W��D��17��	��5�;��j\rZ��ނ�u����_vJv�������^<X�� ���ꍵrd��.4j*N�`��&�ȓa��Rش5� jK��a��8���.�a<�?�T{H:+e��[�����a���3����\r�̲�}��.DH����Keow�.����n5�gv�͠;h���<gln�o�������S{7���f�66�Kڕ��rTw?�qi�V�ƚ=pv:�.��l�T��b,�:{h�O4�m�0{Z�w{9\Z-x���:]W<lk��v�5�T������t!��!E���\'�u킮BO�����U%]��g\'�x7k}K|��PC�����\"e,t�E+W2x�-\"X:�+#�X��L�\Z�p� _�8��>i)ϴ@�e�E��\\-�@�����[q�2OL+\n��V/�	IE�L��{��$&n&��#��x��{I� r���������]\r<]��٠�\0�λ\r����_G�5�n;��O�5r�@D�xE~��p����� �\n.��w}>�X�J����)\n�q���H�s����h�=zv�R�חj�̆�*v\ZT)�c]�7{ʓ��ɰ u�럡�	����w�!R��\'�\n�����@� \'~�����\Z��A4�\'�s��/6�-^�3k�ݑ,\n��-�\0~WɬD>��r�dCW�`��5b���ʙ���\nQ�#`x�g��a%Bo�hl�T���3��8�A���\n�l��$Q��{�p�e�ᕃ,�x5=��|�B,���D*��w��J�_qZK��#�qK!���q\r�SX(@����G�&�\0�����^ڰ��\n�(TT��G�i�g���+�~yb����A�\\�\0~\'�w	�\0�?����(A*yʉ��������r�<>[�E�k\02���ժ�@�(RQ�U4\\ϱL%���jR� ~�/����p8J�ī���,K�И�/��e�՟tm`�x�����4C�a��{0�0��@�\0!���x�qܐס9��h�~\0i�ex�#If����]�uW\"��@\r���+��\0H��\\ ����C���>?^�z��J�w�E�Z�4Ҡ�\0�㙈����ɍ�sA�s�?];/���%U9�?���r�9�ߥe]����Bv�/��Ɂs~ޱ59���,��M+�����H�%�SJ�l	��$���q���5	q�7f*i��6�>r|�P�!�������s`�\"��)]�����g�bIo�n���J�ߦ�r�9\'�xv5xK���ӹ��#�\')Є���������q��˙��v�t,!{uĀ���~������Y����i��N��,Yq;���K�B�$J��5K�\r�Ջ�GB� �V��eB_>p/K~�Z!�y@ʝ��/\0�z�/�U�?B��	�G}}��9��b�b\\Я\0�s���?S�Uv�/{�+$lV�\0��G>�SX	����.����JI#�c�ޟ�\\h�1A�k��8\0�ɹW�ܨvP��ke�}����8��j��XI�_����8?��0_/��hL��b`�S��u�%��}rI�U��n�C�W�6����ܧ����11$�j�h��7�\0�����E���s��dY~�o�z]�Ko�/�`w���s��aC�|tD�d�\rŉ߱\Z����Nd5�d�<�-��n#������7h��2�H�4lФ2��;]`���z|6�X�84�c��3\\�>\"�fctj��ݎ�l6u�m�Y��dgV����T���+����ë��86]�e�}l`OgdgҾ�}h9^�������Z2�[�dW�T��u�������j�:�Wd�ޚ�gG֠�?��d����Z��d��\n=e�/ys��t��Lv�Sj~_)]�`��\'��	s(�*�r�߀�fK�,���N���M(v��8Lr.p����\\:�Wr\Z�)T�1�)�j�9��1�+D({��O�|OY�\0G����=K��?сB���k�y\'}�_S_<́���h�Fw�4�H!uؗ�KEO�ab1�#�W�r�a��������D�&rgf�Hl.�h�n�T�&�ci��\"J��Ί�G�q�l��\'I��G��qc�V.wKa~�&_O+bң���T��X}{���燁�,�ؗ{�25�#`hZ`אJ���.�ԋ\\�Y�Y�p\n�I-S/C�:�Sz�.S.8��3$�ܿ�E�Ԩ�JR�>^����.��	~y�)�\\��l�o����[ҒqWCe�*cZP��(,+��b��&��kȡ\\��$e��((�>�d�b�L4�� �Z�!�_���|/��|:be��YțG ���١�<��F�Q^����{��7���]�\'=�~fD�ת����gF��u�_(�\r�F��^�N��X�K�?)�y>����t�y(��0z�w?�p��4S����w\Z/@��FtFDp��ƹ\\�C�	�n֓1���%��Gb�|�~��0��p�,��_�I2ֱ���j�#\'qD��3\0Ȅ��`�2X��|��o;�7O��A�/��\'������G�IP�r4{	��\"/��\'*�a#����Z��`n���0�̍F�l�}��\"Y!~����ٮ�E���\"f��������,��̹0#�|#�.�N_x@��V�^��NV%���! ���8�mB}raX��������%����e(�D���xQ�?l�������������//�g�W4�\r��՚�h�d#߫��d��p�E�Ж�hL��v��6?��\'��YtxS��Œ���F�ȫw�\Z�{��t߅�s{�K���9�������.�rm^���r�V\'�a�6�R��~ۖɭۥ�Cds��jSsb�z�5co�����LW\"ۊ�a��;*�r�\Z��mո*��U\0^�o�֝�I]�<e��?�ݗ�d]�:#?�<^�V*�猑bC����=�G�vx!�s��|����ыo@�XO����������Uf$�-�����9��\\�W<�b[�be$�&k��0�yo`���6(e�L�P>�7���3J��3e���������fi�W��zxP�Q@%@��rÙ[��P�x��{A3����Z�\"�@P1\r��ŀ&Y�	�3�<�Ԉ$e���\0�m��=k���@\0���>ʹ�U}A�@~�{��w\Z j�5��Y��b*UAd�Nl=�R���_����`)�i��}l`�3�N��c�����9\Z����P<c��9��~��8�ʳ���7���P�r���$dt�RzIPVz��S^dyV_��.F��B@x����6Tr5��^,\0սQ�\':��w�wpγ�l���3�D��R��$�r^�y:Egx����f�۷`�|�+C҈��K�{Ί�Ĉ�l9{�\n��J��)��X�$@@9Ќ�\\�H\r�T�ur֞Դ�T$Pe�FH��՗��3�r���I��P7�0������j&V�Oj���ی�2��f��b�*g����O��K�r���Ie;P���V�A��*kN��\"2L|:T�$G�� 0�~Z=����]�A��i���i#A��F2�e��ħ��>k\0�ǿ��B^]h�\Z���=�\0�z���kprJ����8����R��������(eS�ʢ����M\0�)p��Q	���$\"E�i�?t�D��+}�G�8b�A��̆+E��q�g	:h�2��\'�W �g蜼T�\r�[H桃��;�����OK\\�Û����$��f�P�T�D�,*	��jYG��^���xƅ��L�,�%�V��+��j0�a�GLW2�E��+�Q\"��v��\\�\0���l�\Z\0-���<���\\���2c��ed�\r{��Iz)�B+ɼX�9�����]Q-�D�\0xn�l\n�3up�/r���5��x�g�Qs�?J&�.��h��a���b������d�	xop�\nIis�4�ղq(�F]����m6����R��mF�\Z*������l�)5dynp�}AR�x?6!�j߲��T��|J���18�����+\0g ~�a\r�a�s�Bx�\"<���l��	b���sǿ�`1t���l��i����b�~>q�O\r+�{޿���xxEL4Yz��[\n��	*\Z.��2R0�,@mɰ�ka��i�!���9ۗ�}�0���su4��DɟW�;��h�[ɻ���sJ�/�8��D�Z�L7ʹTG]��<�\n~�XԽ\"|<�(��\"�/�V��C�U��uB�(�\0�EN\Z�SٮQ���)RJ7̈?�T�	��$g��;��\Z���7@�zF���\0���O����=,E20j8�XJ�\\�O���yÑO��S��5���+�8��ς���8u�x���Ƴ�dv�(�����0G�f��s�o_�K.��X�}�����u)	�=1%V:��z�Ӏ0>gI�6��ŷ)z���H[7���]8��=�IT�0R7\"�W7e���AF��{7�{\Z7�g5q�٧q�ه1\n���D��q�?���?��p�$A#�8���xu>�-H0)��Q)<�q�f8	2��16��1:�Eʇ��>��>�����Gu��<���<*Gj��`�p�Ľk�}��g�9����2�l�u���c�?Yx�!�<�|�/s�	��g\0�gI��E\"{�dpZ�գ��J�#Z����?�SWó����\'��\\�����K���%L6`J�|���)��ڦ��_@+�F5�9��9}Ċ�M��TTݽ\'2{D���0���j|\r|�S�?m��o���?@�G��^M����^c�q�n��O×�\0^�T��q��7����9���t_r��x@��x�X~���E��e�K�\0_���hYs��H*�U�\\o�Ex�,]�����8~S���(M�K���9���5�Ak��矈r��ǯ��p��\'�y��j_Zܟ����J�f@�V�Q������e<��2�C�V��zf�A\"��g�$��^d�����Ǳ�\n��G�3�nغ�_�����_I��3z � ����Q�}\\��?�	v�7ї�y 6$/�\0���.�KA1�^R�ÒeF�����|IǗ\\I��=�s�or��Iu�#�T�\Z�{��h�er �yJ��{|O@�}K>�k۱��B��\noj�ݤ��޴�>�0�������=�*)���^T���R��{�o���N!C����-Rq�$p�����C,�<�_��!����3��𽼚��=��>\"���*ς\n�$�dˑ��F.���2IaEAs���O1��/l���)�cQ����}ζ�Tڀ*ߢ?�!GT~�i�j١�@��Խ�$�F< _ÿ�C6�n���\\��3�8�Q�2�e�\Z*AM�)!�$-It�L��|���n�e*���ा}�a�\0�Q�V\Zj6*���	��Pr�S�ū^��IBD��������PzM^�j0�:g���Sy�3�̴M��Y�2�`l��H��R�pJ��#&el�p\'k �a�#��R.�!�Gzx_o�tR�<�;\0!Հ�3�)}���l���j~�y�ߓ�@�ϰ-��pPf�������������Z�$����O�BD��l��<�*��ݛ�tS2d/���to��j�\\\"p�ci��0�j>��?\n�/P�8^#�JO��/�\"0͆z��Eˇ�����@I�-�Ǘ��C&\0x�}qs�l�^�tŴ-����=���Hw�8�_��Wz���#��%�U�^\"\n�:��[X:�8�V�\Z���˗4�7?�T2״A�\'��&h�}D�\rJ[<M��ᳱSX�#���mgj&���X���\Z���L1Eԙ�qL���\Z\Z]�uczv���t�ό$����@��_���E�)�6��u.s���1(��������/��W(Q�U-=�Sh�����9Ѽ>����_ҫ����z��,~����������K��Y�-\n�ԃ�$Y�35�S�	\\�Kg�\'���_�}�\r�+�8S3\"mpl�|���C]�c�NkQͯ�U޵O4>%�?�_��?����K�І�}+�	��~y�~!��S�I�/\"�=Pld*��Of<h�F��>_����R3ħ�u)v�p�|Z����/0�)����:[f9Л{j�ʴ@���ҕb���\rx��j�>&\Z<��)j���͔R�O$Y�eR����V�9�i�ub|��Rц�3��VKT8�d�$Ps4��4���I* �F�S=�N/e� �xc�w�ͳ��9(\\I>��+죳����r��E������d�#U��0�L�����8��\0��pU�i*�J�g t��{�T����>4��.�q��FNl���Q>���|X�~}��w�<�ږJ՚\r�)�ʳ�9�,;t�+Jv���I�K�R]*�Q��p4O��j��.��\n0�=�U>5@�~���(�\r�[�^�����B�?�n\'����XR��U���E�\"������;�l2i�>=6a��A_1.=(�fj/�{b�7*�h�-`�F7��4\\3U�Ѽ�JY��9��F���x�i �͸�?��Ͱ�R$��E@�z���z�6�x;I#���*���(�	sW?�E�~] B�]b��<��r��DP�l�\\��0#��A���|P���2O�Ŝ����}�:,R2U��`:���,�{�WX!J��#�M*�Z��V��9�O�-�⬐���9H\\o?�s3��1�Uz���k�$$��%�������/�:�;&T����@����Ow�t���t���]�r<��܉��0�2(��#�G(A���oal�Lb�$?}�[��<�K����4�t������J0�m�\0��j����%�\\\Zpo���mi��()��V��,�#	�(^kԆ]�=^Z��q��3#�K���[A�-�m@��j}��䪄#3;\r&�3e�;�L��g)s�$8�`��N�_-u�<������c�L����(!��Z�E���fw7��upj�������6��Z�Hd�C��-L5NiWn�NڐݳNS�9y���qgZYC�3�_�L�?�.4�N��E_W6fw���\Z�_\r.�t|2盙Ʋ�F���f��Z����s�q����!�P����W�\\��[e|C���o��t<���k�I����-3�5�\nj4v��⚊<��J�qV{AѨs���it�zfL�!h�;���:�>.�ke�p>�Cn�Ɯ�ϛ��\Z�t�j\r�㋅�DչS��T��ӲN�+5��g��@�gC|�NiX\ZcG�D����k�����w��y�\'�s��4O�ɨW�4��px�b��u����n���4�]hK҅��o!�?���t���H�u��>�7��B�;��R�w�^,5-��4\'4���Z�7I�Ytڃ#}@�\'�=��E0�A�*�X�t!i��s��K}Z����=�b���t���K�}x6��r`w�\r�\\��w�(��4�\rs�\0���/�<bD�x��z:k�{J D`�B��\\������`��G	栭����bT�0Q�X�� 5����N�O���RX�����lD��KNz*��RaN�tf�O&(�aq���4]\"ΐ�FiZޘ�����gL�)�>�,1f��[/r{ �-I��J�b̋O�#�ɱ$��� ��?3����<z~�Ý\0\0���-�|U�U�瞋�\ZDA��<Ф�(�I�Y2MQȟx�����(��ୄ;���S��b��E�>vE�{J͖3g(�\\��dB�O�g�2�����@�\0R<-�Mō��M*�Rn���;��:�3\"�!�y�WF ����^*����D�?/0�-����ZO*�;8uST���a1�\"�2��4C���؟<<���Mu��t\r���:<6��R���hR��կw{i�m�sX�ƷmըNn��B��M<�~sho�#jȴ�Ʈ����I�, �T�U�KEa�ֈ�ǎ���.�����Hm�;|��/����J۠w>K�6\r���TŖ�ʤ]8��C>����ܥQ>�e�u1�c&~�����x`������6��O3����\'�\n�3<�T�6�NL����9@���v�%M�ڳK��;@�\0r\" \n���k�.(d2�$#� �z-#�%0�$�$���*��%�q����!�7�J�.x)�@W�Eۼ�x�T�����0�#�{�}à?B}�G#/�q��}���T~��e�:���H�t�#�7��)�:$�u\'�_y�N&�}6�HI1�B-N+R\0e�ɤ\Zy\0Iҋ����\"9 ��# Q�8�}D&	�D���\0$����I�\0�;)�����`dR�<`$ID\n@�\"9 ��\"��`�Dr��h�(!H�r�����h� Br�*��g5|X�����E?y�\n���D_~�E�\n�7��6!Y�eMeSp�%^.��>���@IR�Ǳ*�Լ��^�2�8����OA|����&\r�=%}r\nj\\Z�Y4��)l_@C�{�WמƔ��׹o̟4��ػ#�gCM���9�)�T��H��\'a��(���/����e�_��I q��d��㐈�Y��9����v�W\0�-�yI��<3 EA@�1�\Zמ7�|�~�(x�%�DQ����가����u���h�~va��\'vȑu]䅻)��d�8�f���oy��c5�!��\0�<���;�t^�����|Fy�Ny	Mi	����#�ł����F\n�\r�W8ș�K��,�\n�ԘO�r�YB]���G@��G�7��������6�_��\'9`r�C���y�[Q�ż\\,�[�@�#t!5Ş6�|�\\<ژ�؋\\�k#&oH�8�����\n��Y$<$R�\"$H���h��BWU����EK�6R�����K	ys���$w|r�2+�p�-�D\\����&�����$�V-�\r�W,���$���|}q�\\�4�o�rA_�J�D&����IM��)O�JA�x��2�xy$�d�?��K���{�U}�C���;:�����_s��օ�w������y���Id{.������g?@Ú����1���X\Z?���ۥ�<���d�`F�0s�L�\'r��\r~�k~��Z��Y��|p,}�\\�oV�ჟ���r:U��#�l�-�˙&��%M��Ȑ9G�B��{u����ud^�n����7^D5�(�K]��y��ҼlO�	ͣ�)��cb���������Ț�?����<���+`�U�vy�|1fd�lB���rџ5�~�\r��\0��_�[�Yl�_��)\0`��\0.3_��\"��b@kb.�Pyt�Og�x��u�	�r�w_s��e,����\Z��>L�s~�����5��mu��8�\r���o�Vh%e�]��Y�֚�����\n>#�\'�՘Yt�,9��M;�KSN�l�[�\'��/v�H����o�9���V�Y{�l)��{l[`&���(e�T4`z�t��r?�����QD��~����Kζ���/�?�x�,ʸ����+���\0����Ç�\Z%PC����-4.�\"Tf���cl�2�(5+\0��L�T|`Z�_�#\\�2\'�\"���~���-�u�\\ː�����Q��Hn5%WTQ�&�W�H���cr�[\r@��p���@�\r�~�,��{�O��\r�����$Y�����kt����^�w4�ò}1������w .\nN�gK���o���qY��b2NB�� ����p��G~�9���9G)\ZQP4����{��;��$�E�S����}�J�v�\Z�\'�-�F����_��Q�@�K\n\"�C4��b�X�O?���9�����8cH��\0p���*:�Ioc����d��0��&\0�Q�(=���̓�[���\Z���ڎ,��\ry����/i��8���5�\0�\'���ꟾE��\'e�o��G��Q�P, D�𷉸�{X%�sK?2��gULOڇ��ŤL1C3����Hl��3wy%���KĄ�H���e)��1�x��)�g�iF�+�=~����c�)��HL6�ŉ��1�w��21�p�c����VXX�?���1Ei&o]�b�\n��;0`A1�i`��\r���\\Y�5��he����G�5�� 1��|���s@�A�;�C�H�HL� 	�TF�H-S�l�\"S<EHL\"G�D �\"1��2]i���������:�޲�c+>��b�L<͡	��/\'ΐT�yI��N�Ё+	�ID��M�c�	�v�x{�RŢ�T*��pG��lP�Z�T����rN)jd����z�|�?��}L2��)���l�ԣl�;?)-�R�����uLR�R��t��V���	��)aKhBu�)h��K���h<�XLZ�)�DL\\^	yc1iI�����p��:�%�\ZyZOI�K&dl�E���$����?�������i�;�zR�{l8��1�����:LHж��&�� �:���F�Y��x��\rT\0�O�ɱ�y�f˕rKF��&��@�br	��g�j	m�B�rD����K����F�ˋ��\"[ϊ�d#8��/��4��^�P�II�d��{<.�ű���A�R��Z�����B\rI�)=jh��|ޓ%��;�V�)+�E,�� ˰}�8�ڃ>��a$ۜ���J�z���sQ��\'T�)H�J�(�]�2_MH�%Ӊt���?\\��\r�(��L�d�i�1a�Nz�ƙ\n��|�&�@8]2E�y�����I���	�NF�$@$̇SL	\\�v_�!�<AdK��<A&��,�4XO6Z˶��%\n�K6� ;.��.*�ń�6�q�3e��!��\0�@�Xd���cP]2�*�yA��Hl\0����Q�Y�Y�;^0��}�1)�%�vOb�s����2��L���G�wK�$�+VFY$�R/���d=��o%$�P�R6�L4s�)R��[���+TC���R\n;\r8����V��Y�.�c�?A����.Ӌ�ф!��h=���<�@�|\")�k��mI)\"�Գ~���,Rϭ29M��S`M.=��1��2=I=�|��p@��\'b�$e���c�QE<~����7]r����S�u۱>��Hf�v͚Q�$h�?f�Đv޽��K��#3���[Q�k�k�i���:fE~����1��N4�ʹ�y|����c��%0�pr���]���2�\'�W���?����x\"z%I���޽l�!~=��0�Ύ�_v����(5ǧ�����tG��a�\"�cpȂ�Ş1��ǽ^�4J�h>���j�ޙ���׳���Y�`��r��AH�x�����������x\r�WO���\n�\"}��w�,k�\\�������پ^���b��va<9�QoD�/*b/�����,���\'��!������\\?�Q�a$�8�9��<��[-F	�A����]]>F���渉n9��x��~W�ո�#��r�V6��հ���K�ޯ����ƾP��\r@�1G�{���vʗȞ<R�K4�|�y%Pm��$��X�5l���]����|֐�\'�e��U��q��~<t�q~�J>ˬ�#�E���|;|�q�gss���ގ~f�׷�0*��������n�^���C�ߑ.��z��z��B?8���Tr>�/����?��L��3�+���O�?{C=ш�C\r¸(��U0?N�s�w��sso\\�/e��J���c4�ex�Z�Y:�#�k�y���f����1��O����	r��Կ�|��/���iM�ޮ�c࣪��|Tj�����9�d�[Q�\r�;N��;�г������6k��o�;v�2�;D5��ү�i<J��<��5��O�oT�;�|�I�!zz\rg�,W���ax��<����\0Ny����Ry\"}����r\'~�W��u\'�G��#�{��[o���%y���^Q���2�ac�����_?����-�c���o9Wi���ڏT��v�g�P2���\0^y5���-��;Y�dZ?>x.6��0ȸ\'(�!�8J�=�d�x,�,E�\n�h7�&�\Z\'y\"�\Zx��xF�d�R@\'﷙�W4��#c\\6���F��M���R�B-�F02��8�F��t�lї�~x�\\��[���g��|�r��?ތN�\0m����,�:�������78�L��Xh̻�tK�<����;��~��p��dؙ�s�Q�7&�����z�3J6�R��Q��w�d�kW��������@x\0�dU�]�^���`x\0���u^D%���A��H0/�8���t�3�C��z|u��I��p�K��{nt���ÝƲG�t��}�F\'��/�����D?�B,�\'�W�t���e��.+\nt��p��>����{�\n.|� t�5hZ�,��e��8z~��w���(x����7F< ]0��d�*x�D�<���t�\\>`Z\"�w1_0�\0g�Ӽ��e�o���w<�#�g���{8���~<��F�_,��q 7<�]�I����aZ_�Ȁ�y��9��p2o5|��~�����4N�?�������-s�Wo|j_sC?E�bT����W=O�o���?H���x���_[�iQN٨a9 p��#�x�-��d��9�s�5�G\r��c�nw��6˱���;��ba�輻ϣD��2#�|�E���/�/�h�\0չ���l��j�:����@;7ڤ��<�^֋�о�x\0��ϧ��Ԁ�y#z�y�N�Vee~\'O���(�6�������Z����ȝk��q;L�G��+T�Vx��\Z�Ϟ�ˍ1tL�{��\Z����7~ O�m����:�D��Հ�)�U�F{4`v��U�\r�D�:ߢ����@:΅���7�yH_\n��sM�<>�7��������Hz�	F��sQ��׀���4�Ou��S��h <nZ�W��s���8� \'6ƻ2`s^�bP���\Z���Xg��p��Ջ��~�����d�.�}�&�h�8�Q�u���N`�w��r\'��]���s=��ys7���a�����K�@8��_m&��&�|4�ɠzY<X@���S��]c��h��\\��I��Cx����D��������g4������������{3�*���0@{�hB��������in�B����\Z��H�窥��z���?�e���My��3f\r�2�ƙ�����ޮ�ೣ�W�\0j\r?��7����Q��ܱ���	x@��)��c�=�vUuN�}���4��(�����\n��mx�ف7*�P8v�W6]@@T���d���xTs@���4=V��Oԋ���R��5F�߀���Fi7���T�\'3F��Sd��\r��Q:�z��G�|c��_��&�D�\r��_;�&�I<|W���9V�����\n����|e��ޱO^fi4�(��a>z.\n������6#ɹFR���a��_��>\n6ߘ�z��9~����#��/b��FuK98N�<��\n�?��-����7Ϸ��^c���ݞQ���>o�xs��4^��td#��l�則�����E��C�8�c��8^�|(;�\'�Sb<�n�#ulg�خS��Q��X���:�z���4��U����/*�,�\0�|�/d�{7�EP�d��B�sH\0��)�8�v�d޷z��8�}��5�k(����o����\\��C��x4��8�>�\08�\\?�}m����y�-1�����L}��(�	�g��<M7��˯l��v-��5\n�3��R󃢟�QQ��P�3��z�Q�7޿�a9J1|�o��`H6�|���z���\r��[���53`�މ��sf��h�y�Y���\"��s�@Ui�/���3+���K��pjU�8�v>����=��n���s;x��]?��t�u�Q�|��]�Ν���l�w�\0\0b�]�\\�[9��Ҿ0Hh�6��f<�5`�,��Ũ�:`�z���!������Aa��qn\0b=�;����\'�7c|�Y7��x�g����h/�w�Qb�T��7��n���i־�.�ы:���5���{q�$W��̫�|� /}�zPh����!q��߰�P���^!���;�Ბ���1��`w��R\n�`o���B�6P��jd@���+?\0���c	`A���($`�hU��bd\0�Yc��\0\0+|\'t�A,�s~~D�}��1���[��]ζ�f����>�ıJ۹�gF)����A\"���#y��~2���k�Gؐ�u�w1�`��U���(�Ĭ���2`�� ΢��}�.�;�+l����Q��}�\n�����oO����#NG�G���mG�+A$�\r\\8V>�\'�M��S�ro���ށ�_@8Jf�[Dyi�_X�h��3�q:�5\r��\Z�\Z����u�6�x�Eo�O#)<\'�ِ��@���B�o3���\r�:JG|�;��cu/GO>T֯G:*����@6\nJA��#���^�S�%�@���E��Yd\0{������\nFmd�r}|e3���������i�G>n� ��e^���u#zu\r2\0���|��(��\\��x\0<�|�(/��2��3&���ըn�Y����G�s��k�Y$���2 ����� v�i��\'��]������K���4�o��O�X�@��.�^����\'�c����2V͋Oڑ6��c��Z-�>����?�d�Kc���9���5壄o��x��|��}��h>~��L7y���ה�V�^C7�bn��=��Z��\0$띊�5jX������Ê�M�;fE�Td\0��~�=�m�#t�O��vQ�x�l���|<.^ą��A�����YP�%:^�3n�(�w�Q��Oƽ�0�������\"�8v#��_5R�����ߘ_� �<�FA�\n��h�{���Sto{���H�\\�^�醻�r�v^\\*�8�����M�7!o�1n���_n\"l�\0p_���D\0_W�߰/��3`�R;I�+C%A8zA���7^�\0��zC7{��F�W�Wv�S�O�d�_w�F>޽wdv>~�*B�G����X\\�^�^�@^7�J����5�Ƨv������\r�_����u}f�r���!(�\0Έ�n�����ſ�F[�_�wt�8�g�����qZ���<N�\r�nW�8����)�\Z��$�����э7ྮD�y�F��\0�z�xw�H���^46��Ӫ�F	�ﱌ��\ZzE��2�3>0_}_�\"�|�F\\o�=�B��c���#�W2}����1`VjN6�w����Gw�\0�ro����t�Wo��*�+�S��M.�Jƻ<�Gм:6F���Ss�b��_���F���>��9����o*�������(��2s�N_����/T������!�]פ��5��(����芾�����ӺQ�+�<޶��h���D0_.����)Ο�d�{��ݏ�h>���]{3���>��?������r{�zJ���b�Qƿ-��t�[��E`����t����_�]*�\"�����d;�����e��]��Ջ�#��qh�7C�+�floG��rdtûW/�׫�m|�7��+�f|oG���rd|ûW/n�s� ��XtW�&��	�\Zy���z�����2��Wū7��O?�7���9�O��ǫ�\r��������_�>�\r��i�CW�$x�������%H� 	J痫P3�{��Y�\'�~J���ﭹ�i����_n����q&�3$�$@q�F���6���_m���_�<4���=���y�Pc��c31���&b��G�_+����}J��[o�<��/$W\r~K���Y��-Q�_��}\\��%���H��a�@�A���o>��}m랣��F)CG�5� 	���\"|�=)���\n��}j�2�/D���c��?H������|!yK�FD:f�_��W�\\m.���e)�!�i�+{��ud\n�?���������{z�_Z�!�\'F�YɁ3?���|��6?����R���/����u�s�vP�D�3%�5��VU�q��-q4���W|���_��A�B�Q�=��S���&�+V�k�#9oc�2��Zx�煿V�[.�� ��Z�_�;���1��M�dF�[�?����Ok�Q�^̏��P�+� ��k}���9K�����%~n�.I�\n�g���F诠�__�����/��=q�-�16�o�qM�g�M&��h���������/����+�EFV|����r��hJ̿T�Q՟.<��C}�G�{�ӿ����qM�����T�FU�?�<�:ԑ���&�\'R�>?����?~�Km@�����ǋ������t�O�j�7�$�d�-�-Y�;�Wt��껾�rgC�Q�i�/sz�6��\'��g�G��_�fD�\r�8����ֻ��2�\'��\'�_�������p��|]\rү{�M�/�z\\��o�u�O�e���\'���2{��<�����Y��|�� -^	�G�4�ΟӾ����ߦ��y�#��������+�K�_6��������������ǫ66Ө27ʴ�Gt��s�K��8��������tѯE���`��)��K�-��.5���������S�^��we�R|���?4ͣ𾪅�vߚ�p�B�����?�޳�]��^\r��~��������\Zl��^C����������7��G����R��ٰ�\\L������!ڣ�0�)W�l�丕��N�-+��k��u^�8J \"!K�\Z�W��IR�7\ZF�78����y�����\0��&����>�z7�5����C�R���ZA^%?��hW�<��S���M��Kgn�K��G����[G�RT�\Z&����٦��}t��~n�yo_���U��de\\����[�Ⱦ�]���۬������#C��T\"����	��>�׳�?^ꦷ��g�0�U�u��|ǁ����l�8�o,{���]�j���J͢ϭ�A9<]!��`\0j�;������ú7�I&�Ls�U�~1���~����޸�����~A�ͪܫ�.�\'6�7��Q�M�u��@_g�c��*���޼����������&�����`�Ia�7���Ñ���_�����ơ�p���ʾO\r�g���t?���-!�,�{*�+K^�yk���ν����L\n��>��.���w�}�n�~n�ٗ��Ö��̠᪪�?oC}�����\n��7K�4�$��}����z/pק(��U�!��x�s��`����>�}`=�{�#����oO�6�Ʋ�D�W�u��#\r��;�@7.��-s�����e���������ݙ��ۑ#���#gNûW/���z\n=��?4�{��x��=C(�w�S�͕�N�װ���g[�/�v�w���6�z��^��n�<�\0����h\0>��[�o��bJ>[���o����8�W����7����ˌ>�e��d�a_̔O��X_e�[O��s��XΗ}|(np��0Q�C/�~�Z�[o��}��=��ґA�<8�����F����Q�=跟Z~�5�U�N���c?�v��~\"������2�̯���|؈��Cr��9|��^[��Ǝ/?��Ѧ���{e?���%�������{)n���\'aH|r�n�}=#�o��[und?�Om�y��ޗ�����B�#���G6��9�H����#͇����oa�/���#宧�_K=Џ�zqb��)�v�����Y�H������N�ǧel|$�e<�����<�bm��o����s�cƮ��6��X�ǈ����u3��Ǌ�A�.�э�C�������}��\\�/~�9����DŇ1]��yW�cF��^�<+��v��3nF�a]�Nq�p�-��y�P��}��2I�9�}<0�45o��}0�M�jTT|��g���\n��)`~�~�\n��c\n���֟�now��B�A/����W��{=w�����ü��ĳ�}��6�%��l��mLr�{��HҪ�%|@e<�}��g8���+4�y��\rM�\'��S�ۣ�v�}��}�-V/0�/���A������1\r�s��E~�<`o��#�ˌ��{5����������ϼ1)����_T�e&��2*��j����ǁ�]x�>\\�c<�l��)��Vǐ\n�0p��N�J-�cuUu�r`����0��+�X�Do�V:��+$�[	{ݛ�\\��Y��v̴����6�\\��ҟ\\.�n{��䢝Nvة\0�\0Gg�;�\0A�<ML���D_<C��=ԛ%\"��Q�R)�z\'�E�B�-m��Z#�%^g����4[��=Ȱg��(m�t�n��Y0`�D�\0<ח�مrԡ��h؊��1�*Q�I1���BY���\Z�Gʝ��E�ɹ`�L��Q�8�Q�*�Ch�/����#Ӯb{qn.I��7�9�xUs2�z���Z��\rm�����\"��}�/e��.k�9v2�+B����:ܱ�?m��ʇLmp�_R��6�S\0���&�$�w�9���\recw�f+��yx�M�Z}�(#� s��EI��/A0�vJy���\ZJ,�FV��M��3+K��Q���\'�%�jD��7Z#a\nf[Uң��aa��\"Ef����`4�pNN�HZȈ��Uq=��k�׷���R\rV��X�,�\'��,?7��l�R�h�mrXn���Ta��r§w�wؑHu1��g�X\\��y���0\Z&m�@F�?s���3 ���3\Z��(��<����m*t�ι�� =�q��hhK��C\rNkM����,��v��X�p�5D���R���FR��3A�ۄZt*^�	��v���Y�\n�����V�!�	X-����+��@un�C����N�մ���k���V\ny~[_2am�H�)&�M�r��q��Z�����jT����J�c��b%�PL4G �U����ei_�	&y\"r��t�cag(��I-Y�:\n1����.�Z_[��&�)*U�7��X�ݔ\n�L���w�#엳������2Sj���Zֹs4�py>���T�r��tb%�z>/�-H��ΒU�B�Ӂ*R˝���\n.Q2�@Mo���G�gQg��}��%���h��5&F�aO�\';SAi80�b��{)9���Bd��|��\'Wؼ��������E����\Z��tF�+Y��t��FZ�R�cV���r����td�\\���x��h�]���to5ߜ��g	M�a_���p�Ĳ�YI�\Z+�L�u۪��.O��5�#q�Tx�)�g�l�(!G,7P�i�Y��;�����b�2D����9=��}	��2V�t	��Ӷ|+C-��\n\Z0s+�&}l��8UeTggۅ�-AS!�c�L� �EѡP/�ht��d^c�X�~��� nd�v*��#2�k�>@�6�R�@/�N����t���7�ߛ��\"s�E�0ɤ��X6�r�h��1|��\"����V�qf��\\⫹c��\'֙S.1�2R��q��I/��z:��N�(8]D5�.�ٚY�/�S.�[aOS�?�;�v�_v�\Z�J��\r=Ww�9�3�Ohw۔�\\_¼y�t����&~��02_�~�)a���E�e��h��.�di����L ���<?$�\'-6��&�Y�nM���9�tN~QO阻�;��.�X=�[4bUiͰvԤV+���3�s��9����A��2�H�jN��u�P�8zaߤ����<̥i%N�ED�ѹ����=����Hn\0��\n�ժ��ySd[\\��x^��� n�r �sZtEB�v�8�ޚ�%���jش���z<�bC�)\r�]F{=Y�J�F[	J�s35�mI+�t��bTE��|k\' ,��z�0n���.�\"���<*��3��݁��y\"Pީm�_���0KCB/�?�͆�����cAa{([��+s~H�8V��q�) )vՖ�M�T�JozɝYce	�:���sA�a�Bb��-���TR�}l��(��s�rQ�|O�U��j�=��<�\nC������^	*�0�&:�0%���8$&�z��~����\r�i�S�-�w&�Z���x��X6��<�n��B���V.��,(^���~�~�m��/,�{K\"(� �BE��()m�y�1C*���ȹ+����4��M(~cS<UfVҺa������\nH�V�Y%o�m�n�(�w����>���Iɽ�@S�a�@�(8���/�n[:\'}�maz[�.�-v\\F�^n��(Zo��=���?g��t&�^�TZ��9�bU����a�j��\Z������N.O���XZ�U�-esc]�&P�&\'�1Vu���Y\ng/X��-+�B�>����=.`��ڹ{O\'>������&3Ͱs��u���e?T/�Ce����.��ab�x�����T=���V��Gc��~����4>%��?�c��Gjoc|���j�VU���υI��*�X�ks��FW�΅L��Ф<��V�a^k2�xV8�m�������sB���Ոj���W����z8�6:��6��NG.R��ԌIw-<+�KowE�\"B�<��;te��w<ץ�I{Lݧ��n��V���Q ��s�\\�6���Hu�����L�j;7͙���\"|�]-z{�I|6��莒�l?3?ڤn<o��R�Cr��C�t�W�`\n�ra��~����	fl����֡���z���6L�Gv�q�\Z\"�p\'�|)\\ƧZ�-صFȽs����t+�S�B���Y��أ�RKr����O\n�b��\\��f���2�D�u�̓�P6[O�TN�l2�I��s���Z����_n��Zq���d5I�y��g|Ece�ܝtӏ��3�-�L��1��>�\0\0q��	f��9r�0�\\�7�CIQ�����6;uY��I��h��;-�N�^�k����b�	��7�z�UyF�,L���l��|�q˓dCǣLЪ�>����8H3�g�t}Z�;\'�s^��d>��v;�6_CsQ�`hw�h��Ê�;wN>	��N��ˋY!�y(�1�̎�2E\Z��5p��e��i!�6�w��ۚa�lqV�@�ϥd9��;~����Lܬ��<s7*(-���o�`Yr��e�m���5�;�>)��̫1\0V�\r�\'+�V�]JSt���|����|�L�������<���������w2�\"D��鶄d�+��k���h��Ɇ��;|��g�Uʙ���\0��\no�&�B��e�6!�ʤ ����Q�隽%�ԁ�c�3y�f����\ZA��i9]��긞��`A�}���33^��9!�[z��݅��5���O�3���d�U�4g��t��1��MO�\\��^�\'R�䲺���_Z7��I�w(c@�~��	�&�\"��#`\'�\Z���]�3}� 2�v;m�.a�dL���=��f�k��񼝨x4�7�{A�X���.=�zz ��H��u<�	:Ӗj^�ЈO�<�Θ�V�s�)�Lua�Y0��\'O�!b�s�wJ=� s�cJ��\Z�x<�CJz�	l���VӉz��z���Ȯ��B_��U[ϙCKq�i���bc��C-�����ϨwȔ��&�p]�W��O��]N��tp��y/\n�@�JN��\rH�rN鼮p�&\r�~g����[\Z���{�\'�徶�|��F�Y�G�% �0��fn*�E���c� ��f���,��z�.n<,v��ɍq��A�X�I#�=��������c��ۃ튛��ژ�S�o�Ӕ�\n���	v;��6	�Kk0���f_�G�@7��Ϙ��/�D�4�PX�nכ%�ׁŤ�}q�w�.�-\0zٷ896Y�E�V��ƌ�+��`yk#P��	=����-x�\Zr`%�U�A��	��z�;��\0At6q��`�Tw ����3o@�Ha��`\\�\'ե\rE	j�K�6�Ɲ�z���4 PƼn�F��M���sH��M�H[r0�h����ӗ\r�,p�N\\\'��e�X���˴/���N{#i�������9��~�J$95�zk84�3WB��o�]V�C��<&zo�!j)���`gy�DN>�t�<���?���59�e[���Ɩ�.Kiq�y�����f؈�قs �*�=$.:ҝ�C��7�R�f�n��%96�����������\n��)�P֛�|bbV�����4Ǌ~����7d��b�,wam�1%\'S�7�E��_�e��uw�V�7�mi^�T0�`x�\\v�e�l��m�&��>�Z�H��-�ddw�^�^Ĳ1p@1ZO�d�1�1P7��<؊�8��(���-��B\'�(!�}씋����=��l��fCVu�!G�ty���|��u\Z{j(���hI���P��wV�-��!f�c��lӛ�)�9�u(\0w\\��y��	��.��b���9��(���/�����Ե�+�?C�:5���ݸm2�#k�<����$���p�(�T�;jW��pqAن��)����=щ�%N\0��ƉJ�Y�\'��)��NS�5%�*(*c�iJ��[����a@�}�.Z���u&K(�![W<��Y�yufɊ�b�&�\Z3�ڻTEW�����ۇ�6�f���$�J��{��m�q����4_��@M�a�Jz��h����K�ç�V	b���m&���D(������Z�\Z( ׺�Î7ۭgE�;��<3X�\n)���%�V1u�7��$���CɫNj�aU�[���-�#Ά%�(�Y�gVϼ!3=�a�=��Ep>.��r&�L�PFPS�9����%X��G.<-Jh��\\4Y�}Q�%w��py��L˾�qc9cl���XO�VZI��Tk�J�����1����;���}����Eb�Y���ϊ�{F\r�k�:���3˟��D�5��CIk�e�]���\'ø�$���f�� Dlr��}!�t�y����\0/�y�4�q�r�o<]�mC�\\aITK׳�`^��{`u�J�fZ�]�	�uX�Z�\0���+G�4)o�$��\\�\r���,�Wv<�f3^�\Z\',ظ�I�0G��ŴS��]z�oojG&�C~�WxWR�O;��Ky�����A�j��)kcZN��[����ŭ��J�-���Vn?����a�8�L�H-�%L�&&�␺.���ODb@G��i>�8#!��\\Lhu��Ir���^���wԒc�\\}39�9V-��ۻ5w�܌˸R\\�Io��Y�U\'Nu�:a��}�\"%,�J�y\'�Y�`�APj��u�fy\\��\\,4+sa��d�����}G��g\0Zf�z\n&������9�\'\\0�\"�\0+�����Xj\0��-Wb\0�l-�\n00��tc��G��M�e���5g�`��:(G��Й\'�j����˱�ĊX�g�@OX��se�G����)��Z��	9��&��9U{1Fh������Z��zQ.�ޥXR����*y����{\nK5��j�D���C�2��Y4S�*���hLC��zy��\Z�6>U�u��\Z��#�@��0Ch�`S�ki�$vT{,��o��n]/�c�`K\n\0M7VE�B� YF�F;��7m{S~�\0�I�.:F�%��&),���+�R�(�b�Wޙ�L��m�Е�x���@m�-@��.jx��֗J-6ݴ����7��{�|�m&�,�,�����4�ZD��M(\Z\Z�b��iY\'F�֪��Hi�g�0!D�Б��\n��%���>=:0#��$�P��F{/-��P�δ��X�ؽ(>nTrft/ܗ��*x�]v����咳-RI;u\nt|Qɜ5r���P��/r�\\�9ʖn���t-i�d��v�QB���ȍ\0��A7pf?[.\n�ьN�/�</�\"�D�\0�^!�����Ԝ�v��|:C����%���S���)O���q�f��mQ�_Zc��:��S�Lʫ!i{Y`�C���>��g�M�I^d�>ҥ�L�r�fck�9�as!w��s\'�\\2{Jp�\n1~ߎ�*�Igm5���I���b��D��M��g����9d�_�ӈ�l`qq�t���`#�:Z�Us,i-�6�w�xc:EA�e�`U-N\"H��E�g��p�K#���/!В\\H\n���8/\'����d�4;�L|ZY�%c``�*H�����_�)���i���T2�V�c�y#ΞY�;�tl��K6/���yi��)䋩�ԃP��ʐ���m�U&�N�����¾7Q.��y������o��B��53/���}�\rƕ�-J�H,DWu}���MT#�2�F��{�1�!EEj�MkB=���fʌ`pZM��)	�n�9AsU<Y�Q݂5}<ٸEw�#��Z+��F��kgլ2:�+kڡ~h�5����@����a�[��!N�^�[r�Wg��k9D�(MWBUTޑ\0x�(�RY�M}$C,���JQ6m-wJ���n8�R����B�����gp9^Y	�d������f?�b%��KY�����������d!�$�R�\'�Xεˁ��]T�\Ze�=`��$��j9qX�����g��RtdI#��xi��;���(�� ~a���)�-����M��Y��h�:M�vk	�������O��ڂmpL����\"nR�d�m$�6�l)v�M�\r�f�~\\3�����麃��	&��ט��x�&o�5.��\nL۳���̙�Rw���\'�2\')3(���J4+mp�|\0���7�Q��9����\nXeIxU\Z@E�\0P�\n�n�I\n��� |�����\'~s�]�@�Y$��J\\�r:�0Wlx98��\Z;X��+���D�l�S}�MS>=(etP���Ц}�d\'��6:mdw�z��>�\"���Hs�-R�\Z��K�W+��/_K��kI�9¬G�kg�͙D�C��%\0��\"w26�y�;j�3D��(���,�\0V��3#�zqD	��|i���P��9�u6�V�VL1q^�zXGLϜ-�e�e�pQW�Ю�,כ�J���$O9��稅b+�$��b8��mZ�\"�B��V�̬ZR��v�Uu[+��Zh=�\Z���#����h/�ű9L��j�6hfPw ����iZv�k6�1�m�}C�Oҽ8�H��N9��zeOH��S����:�p�*k3�/ \'��(��UA�\"����@m�����Z����撠(��\\z-f���0�q�`��}���B�.dr��^.E�L�}R�.�8\Z��5��K��\"�He���#�oHc�=4L�y.�۰ $�p�B�ui�^A&�����������bT�]h�l�]�-9�\\Lz�#Ib�Ȗ�[%Ma�d�^����ZXLrG*��\\&�$�]i!����b�튐A(n�m�T��[m7@S�GW�\'b�,+՚�Ҫ�O�Ɯ��v��w�V�X���w�N�s\r�f+��_���:,\0�\\�\037����KR�0���=�=4�uynU�:���r9nd����-1�w�D������cJF5��j�b�^?�\rS�����7\ZK1]\'��\\+�!h�@�S,V[˙��n.R˹w�;����C��7p��\'���-L>J��e��& �y�q-?�Etz�\'`�^��yQ��9	�]�:�S,�w���J�-�f�X̹i.i�uS��̝� KrfT�{���Eƒq��Sd�Q�ij�%\"�U4���:@�b�O�p8wai\r����:mr�#@]X\'!�9�T,x�Y\"�{\r���^:ik�ȔB֠WQ�5�,`\Z��?����ׁ���^�[�H�����n�{���^?�РA�D?����¿�����᳤�T�J�;7X�a��Y�����j��/VzC��U�d���Z��ح������K��)�(��dn����켝nj]��5��X�*S)����vYl�FKsC�7�T�k�k<����^M9nӻ�ġ@@0�C)J�Y��;�Bm��TM��ݥK�]%1D��E��Os`ϛ�$c���G\r}�8���A�ȅO����F�U��p4�����b��a�����?�.;١��\'\"�Z�]k�X�G~�z\nR�����f!�dr�s{��L���\\ƑKd�\rO�\r\r���䮗�~��Nn���۪��\'P%Wl�<��F\"�Tא@���sդ�Th�0�E����^)-�Z�s�Z�֥��u�/��\n�y0V��fR�4p�Eb*E��x�}�n�ے\'�[�����ݜ.t �[�j7����iF\0G��C�\r	��8f�r�N���\0�{�͉��Y�,O�7%o�I��٢���aG\0�QSI�ϖ\Z4G�i�l�:[����l�V!�2�>��H��٤Hf5~d6F���Cy縱����Wdo���d����f�b������v��8i��M��)�	���R,�%dzXBN%jd=ݹ�op@Q��z��֟8(�`+ޗ��	�\"�\"όD�Ji����������zC$�����z\'ɘ���%�4$�8��<�\Z6���GO�Y�ێ3�jN:3��|u>�\\�]#z��m�咷䀑4Q[��yP�8f�dl�,C�M�I�%�h\\�S\\���@�H:�-����b�Z[��V6���Hi��\'>��^A��Ux��v\n���)�rk�z��Zqo�����\ntkQ���AeV������c��Y�&I�)�O�d��`O�Cz1���t��2����^���l\Z+4�\\�E\\��)�1�6i3L<����Rڅ-�/|�W�>��k�Xl�󏚝@�f�lj/\r1���]�.4�4d[䒷,��uUo7��ܢ�--)��Y���h^���di�_�� #l���P�6��6�+h.<x��a��3o����tm͊-;=�q�]��w�a�8j�p�Oyr(ޔ�Y�(�몐�i2_D� ��8�k�Dї�����u������S=�P=��\r�Kg���˕e$\'�T�a���\0@��\"���n��St���.=%,O��9��(m���l+�#�p�˝������U����򑼢	F�/!�&SIpy~�HG��e\n����6���\"�\0��sm�j&%�1��A��C�\\�ݑ�Ork�^�^�iڛ�霮y�51�9,i|��\n����$41��L�(�F��$AElzQ�\ru<���D��k_�H<e��4O���N��Z��|\\�f�X2�DM�>Ɖ���c���9]+�Z^쏽.c�ӛ�����;�xv�g�\rp�����A+�p��0�P��V�r��[�7�{#�/)�T�,u�ͪaf��������%K �b���o��2B��&+H6���uo�-XN�y�)�,�{SR�<�&�B��`���j��5K��4\0�!3��ws>����������Y@��.��Y/f,\0��ܚ��:1(���C��D���}�R�mL���\Z�b���C\'5j3���Ps��� �tu�Sr�@͐�AJ:�l�^&�b�-d��r?���c<�`s)�\r���$f���!!�=��	���d�.�lT�V2��k*��,�	�le���T�0���Ь�^��Dt�%sI��]ne2�5�\\0�`��vb-��.�t},|�Q�����9?��9�@#� \n�;O�Ai_��bFO�3�_S~FpՅ��@�t8^�Tg��L�e7\ZZH�;��M��8�`�RG���إ�Oi?��ܖ��.X�8o�Pñ�M@��0O��ˈ���kgG�G�\\�\ngM��9e���D4y��|�]x��ÒE�Hmj��x����VY�!\'�\\�0\Z窎?8��t|&\"$\0dBC�Ω&����=NRJ�S7�a�ȟ����+��A���|�l��Qx`�\\�� ��@q��5�_vG���M�[d���.���ॢA>�/��U6<��^�[dU1��l㱽.>�H��*P�f��rڕmL�b�UG;D�b2l|��^vU�$�u��9��l�p��2V�S�[羻mE���Rz��x��)S���eq2�&�u���۳ϲ*�֓��D���Q=;Uk7�ўM�M�`v\"io�l��f�*�1_��?�n���~f�Mf睟�@*`-�{d�K��]����v�_b\"�	Y$�ъ�={�YU���A�lc*��v3ӝUx���\'��ef�vCK͝Dh�I\"A^Nf��\"��,E��)�������<)��u|ű����aV�^Ziq�0��*�EX����6e����h�[I7{��s�Ү/Y����Rw�fK��i�&�ZR��N녇\0L}�\Z���. pﳽT䁼P`@��]���W^��:��[�Ƭݖ����A�>�k]NN��O��\n��ƚ�qb��T�=J�A�S19sP��\'C�x��E��*�h�L��a�S\\�H�݅�4�C���auqI����`)]�ȫ]�QH-�u�,�d1؊�H,�6\\V��n�+�;���������Fw����D��Óz���!B���[���Mz6\r�K.�9\"u0w0��V�4��g���K�K��f5��\n�\\�$�u3�X:��Yzˡ�L6�ŊX�Z���	3U��(3�h��5g�񘈽~r y]qY?����¢��3�]�k˷��Yb��:]��}G�����\r$v~�&���A�uLt���ԩ8��9�k��q��v�Z/�[[U�E�K(�� dԗ�k�`������I�,��1r���Ҙ����x�+����ڶG�瘴%o�@ʽ��vm�Vք��:�Am�\\I��Т�Ԋ��Ӗs�;]�!31�����i1�c~5��ՙt��OVQ��twF��u:���}4.Y���C~`{��KO��<{�����b#\'5 T�B)����*O�pC���$q��g�tC/�yr�dX�)����0�0�l:�:���%f@{5۠攋�`�Q�ܑ?�S�g\\Z��`s�Lһ�\0	[\Z�c��Z���@�Aǉ�1����]��ծ�\"�OGn3���5\no�t2��*y]�{���MrV����t�f�-��S֋i/���~�0�G��9�_�z��ljV3�\'(X�e`��cj�u$���\\Q�rAd;�Tq�lv���&pKy��;@��Y9.(�;�L�/�gAM�As�P�M��rz���v���^���p��+(�����P�`e�X�/)k\"�ӕ8]��d��\0�Rd1l\'\n�i�I��8�\'����N=����u�Ϧ���|����B:��C���U�E�	S����R����eO`ʇ6~�$\Z���w�:uXS��S1\"���_�	%����A�v���-4���6av�����qH��\'ZϺ�/�V���r�Rs��EC��r��T�W���ji:_��*�UK%�D�\\�\"�˒h��ԋA\r��	(�N�v0��R��2G�f��뤂�Ev���1��XQCf��67�9[h{�xef��۰��f�VmRc��؟,���J⸉�ݰ$�Pyj3�Bt`Ҵ�݁+�n�T��6�:���dH�@xѭO`z�E&H}��@\Z��v8tY҇eGR���=�h9݆�͒�۶鵿����J��:l�s*����\\��yV,O�qp��2Ȗ�s�{���7Ӛ�L�\Z���� �.$P��\nč�B8�ev�T�E\0b�,�!��E9\r欀�tTϭ�{:�.��s�ҬS�w�x:/ǰ��x*��.��U��y�r�����k�6��r���.;�A�;���|C�z��K34?�jo�$\ZPn\nc�8\Z�`A���P!J6��%��uU!bv��Lu�r�k�\0x�cz���k�r���+�+e��\Z��$j- ���s/�<�r�S���s�鬟x�C��4\rS;\"�]�I�D��J�1-��E+�M+���O����ڰ4>�O2L�}�U6�DN�\"�ݥ��-�`�U�[--`#�rߔ,X7���tj%�L��[�䴣�$x6���s�.IuY��>����8S\Z�������\r�z���vF��%1bSCp&.�~#��>�iGltT>#ۑ��Nfc�<x�|<c��i�\n[���B^�WƬ��d�7e���[]�z�ӔPo�Ъ�8��咢	67|jᑇ�Ai__��]���j6�f^H�5�TgvY����jHci�cW��Z�3��Q^]ڤUW��.�V���OsK�`:d���V\n�v1�e�<�{��\'�&�t��g�u	�u��{Tk�\r\\��Uu�?��}�;�cnd:��b�8-����e�j��#����s�<P�퉚��&3��/i���^��\r5�`(	�KLOKJ�R�3Gw�O�e�	о�GB���wY�t1?mh�,DrN����㦛Tk\"0${���ޒ�b�\0tca��4����TE���k#N���q��^RO����������p��`�*���Ϊ&$\'�ˆ����٨g��6E�\'tѦ~������@�~�Ҍ#P&AY_!K�F�c���mY�u�l\nјo�y.��ማY\n����7~�0�W�	�����۩!��!��-vj�L��%a����m�\n�;i����wl\\t�޸��{����7�Bf���m�ϻ\rOΪzi��]3�I���Ij�����;2�Jt�7MV4%V@�K���� i���I��͛9��������g\r{�� 1C.w�Y/ˉ�{��@����*(�F8�ӗ\"�<]�٪_�Ė�$l1�mv\"��Y6q�B���i�Ea7�%�	�{�M<�W��lxg�����MAɺ8������i����x�l��w�e�\\��$W���ɵ�L͖�>x\n����8�&�&��{�T�΁�S��7VP�W�\"�4��emrrԻ��|�]����&�,#d��v������S[��G�I9�)�q弫 �5�a��u�Q\\`\"���5h��7U�u6E�{hy����e�Q�d=_�(�ӑڄ���	\"��I#��H�JBc����a�86Z񈛯�8z��U��j�w���\0W��w=�P/�S���� �zh�l��6N<�8#��^f��ACy����\rs��pd��/�\"[�#�����<5�E�Da��dIR�7~X�Ʃ�mՓo�j���T���.�4�k�t�M�A/Xw&�����b\ZJ�뚋�\\R�6��5��xa.�_��g{O(��n���UxP����oc��U��qY�=��Np�-Ŭ]�\n�m����(7[!�*�өH.�Ǆ d��������u�nd��CZ-�L#��J�V,����RZ���J_�\0��Zoӕ�I��{#�O�9��f�C��ز�q��Ԗ\\C����G���>�h�S�\\�V�m�q:F�LA�fW�ZI� �;C���W�eK�HL*�7�X��$��q\"��q��}��n�5�N�#I�K���Ӽ��ĉ���v�<���NL��K��`䬣���C���要0ڧf� �\"૆E�\\S�/lp_+qgF��@����۾�d��^&�E�d��a�}�N�k�\"����+,�u٩�9{m{	i;����ص��(K����o	\Z ��GA�&�ݍ�W�,-<I��H�b	�e+�k�r��zg\Zw����6��q�#A�9�+��`۸S��ԥ5/�E Ǝ5��x�ֲ�j��!lכ��͓�x�2Z�U�^oj1��j]�7[\"mn�,(�/�	6K/�H�Ŕ�<�ׇi0/-ͨRP�Υ�k�&:k���n&K8s��#��N�<wۈfo��7k!m)����Ά���[��w��/�\r��v�s`�4�\n}��N�����D\r>R5yj/ńZ3��\"XS���\Z\nv�����=����0U~9��C��R\n(�&�T�{�@!��(��j�ʶW���;Y�/2�lF�썶mz�Gx|��6���;ɘ��ƅ���Ycb6P�9�zǽ.��c�I����V������]UY+�\0C�9\0ʗ�\"y8�LLH\rɷ���(@��އ��ϵ���iP\0E�]���*\r�\'�:�L���6�7\0��8�U�ֳH2���KK]�&�ƒ`�,��h��f�M��M)H��Q����&���&zo6;U\\ckYD��ppt`P�H�Ep�����\"4$�l�$zWsۙ�8��4{}�z1�n�x0���|��AAj�V�g3\n��D+���|njeZS�Ίuzc�\ZŝL�z	S�e@w�<�3T���C\n��,�&ģ� )���.ZXk�*@(���4P4����9�l�D��X)��^���5��s�a�ES�,���/΁�9��!1��p��6^`�p� ��aB�X��]C�\\\'1����qm���;���`-6��<N�)\r|��C��W}���c�&S��~�j#��l?�iܨ�v�GU��\Z���&���0\n\'�h�RqPy�9�d�ϴn�I7���M�\'W/|�bm�Ƅ�>�nm������g�2�!@���3ӵ�Y�$x>9�j�kGk�m�ƶK�&�P��YB����t�<�D�IR��*�I��P�(��s��;�<�%�v\'�u-��*`a�O�e��-�y�֓H]\0�A��\n7e�b/J�x���G�\"�Ŝp9�����Y;��\\�@�w1-n��=��K�nz�����0�������	�N6���j~*�����Sģ�[M6�T��=��{�ls�ݙD��W�4�(���\'�`-�i���}�\Z�89���N>�Q�2�\\�������\Z��u�9���{flխ��:���_AT�=��[t�1������T�t\'�Ńi[L;|��!�΅�s��XEʉ�3�\r{��%�\0���mu�-P�68h�G�^y�e$=���e��ي0�p\\#`i��*(�Pl;�l��\rz�5�p���x(�V&RE^	�l��X�NmP6i0W3L�94ݥ�|�EIq�k�\Zt����	�4�y:�ʶ����b/{��>I�E�\Z�Au/֤WV\r�W\r�pg�	k=0s!h{�D]ԻY5�`kD��99Vt��aOf- ?(���6\0�ԕ^v6�mpkIO��cJ_&b���K�罒Uv&���%rH���x/��D��$^�g��8@g�sl�[���0�$����p�AZ�*6��X����EZf�I��o�U��8͸���-0f]���`��Y8��N�K�d����\Z�����W�p�ᢉ��W�};�EU���tZ�s�|x\r�Z�}�ƛ�!��]��O+-�����d�r�N��0�{�k�&e��ں��-J�U���������Ĝ��9�lx��Nև�)������n.�����\Z��XԻ�t��-���Ӻ�χ��TV2U�4��:{�i^­œ��p$�Ba���\"k%\0D�������p��,ҕk�h)^+1Y����O�K�1ǭk[a�K�W+T���u�,rZ�ҀkT�f;���ؼYZ\'����^\\���d��\"@k��\Z�238�=u�rɖO�[�7�ҳf4f�j❛��5l��p�r�m@�jQ�=r��egK1��\"�X4ӥ�bf&�^�	���\\�5g��q��&0������:*y����3�^ɱ)��1���% Vδ�_Ә���䣓\"�u�K5jO��۹Kt~T���Ƅ�KC���u��Z^Y`�j(Ʌ����w&8�W;*��OT��u\nfc+\n�P]m����U	�Y�@�v�C�؜�[����6_K�)ugl3���a�Ѻf�F�gm��Tݛ;����C�R�S|O�/+��m?�P8�����.���m�Ҡ~�\nEڄUz49(��W�<�	�[�Q~�`�����`Z�(߂��L�Є03&<#˦��8���*�U���6CO��Q��M���$�DT)֗}�Y�dk���q5�kt;��En�.#b%6�����h��\ro\\u������~���9���n�Q��u����8�0�*�V�ވ�ܚ�[��]��+\'��-uk�9���ں.͵V�^�͖s�ŁX��r+Q�j\"{������{��$�۪;à�mz�	˚�%�79Pj׻5g7�����I��g���<�ײ<��X!.RPHq�_\"׏0=aneוR�x�r\r{�� \"{Y[�Y�Ҭ�ɒ�Xkr2h@�<8����9[~�@�b��(2������4U}��¥)�5E/�Lr��/��K��A��b6���[_h�gN���\r�c�Zy�dw��V����dq6䙏���@d��4�]�yzLe\0;̚�ɚq�O�7��PIZ��9�Ç���[P�Z�m4��E�f�9���s;ǲ��s-L�&�d�O2����ͺ-�L���f`��D�a�:��*�龪��V@�\n��DF=n���IN8��ra��Y\'B��}V˱�����սâ�Llb���\'Z��ک���9T��y;���3#N�r�*��p�/���n��žX`��)]�=VmsJ�ܜ$���N^��^�~ӫ����B��&�l��9G�v�@�e��L��u-�̧��z��6��H�k�{��bQk)���\\�}U\nM�2�*������7���OARY}9����F�%\nY�iou3����&����iHT8�2�\n�)W����fA��7g�K8��{\'��Yw)�B\n����gK#���yiSĴ\"k\'5�^���9&t`ui�����U�X�QAyώ�z�3��0I��JSp٘�jJ��WʽF��F�k�;>�\Z5�F�����֋��b��\',A�\\�l���YkQo\Zl��M0\0ٓ�����M2��U��2����&%ɐʚY�iT�-a�j�]�3�=H�������f����������J��<���v���N�GRd��<#FǉQl�\'��Oľc��7]����w�~����yQ���#�/j����<vl#���(���۾��7�c����\'�����<&���_ɿ��W�o{~#7��L�{��_�ﬞ\\���Y�9��{��4?]e�v��{��tE����>~�k�!/@��m�?�<����p{�E�z[��oO�>.�-J����Z�O�MC����rO���o屇Yx��>V}�f�v��CZ·l���JC/�|�/IK�a0ϙ���(�V	}����:�\'��mw�_ʱ����Z�EG��7����ҍ�����:N/��4o_��>�HU����,?xO{�x!����_�<5�k���lU(����Vu{xO5q�s$�\'�z�8�S����R��E�߱�����f��?o_���N�5����ɋ~�>_v�\"c�C5fj�|��!��K�G��Oh3����#�ښ������ȧlԟ��*����_�?�ft�����\r�X�f��d/�˧L��	���/>�)��ׄN����H\0��(���T���E��xBDgr��.��<W��]�j,�ױ�3�D�c���>`c3�V�*�F�$�C2��W�?L2�M�׎}����)�έ�ĩ�����ǃL�`�\n�SF<�����YeF�u��͍��*o{�����_��OF�_(՛ς�6\n�L�^R<��zʓ��Sc��������79Mܷ�O����k�\"#����UTWUZ��7���4��Qe���OZ�v�o���������r{И�o(�?�x��:A�F}�[�3U�vk�]��~K��b��8�e}��k���ك����~x�]o��~�mvO.�����V���я^,Y�#�2���&Zx{��Y�����f����������;տ|d��+�}��ɻO��0M0�/׆��Oz�o�Lw��&����Ν?a���I��9?�F��SC��Q�[�|�QO��X�h� I��h���~���N���F��f���y��~^�x��5]��z��g����W_�\\~��o�p�ʷv���iKn�8��mx�tu��b��7c������_��{I�y9$_��Ռ<׌��jF�k&�}5c�5������{^��UM|��߸��OU�-�_�\'�\\��M����m���-��o����V�VY������B��\n�W[�[�F�U���?1(�aۿ��B�ou�Q^��߿���j�G�y������+���W�m?�����{�c�����s�4A?,\'����k��S��~���=���n2���t�����#	�G���n�3�>5z7@�}៛I���>�����i��`���2�{�������?��]���^c��:����?>����V�ma�V��Q�����j��#���J�]�ܟ�cP���}����ܻ��������{c<����ouP�?�*���/!��h���_��bco��[\Z�v���-�	�����_�S����/��������c��(�ľ��<��<��&x����z��O�}�{v�\'���?Տ����8��?��{Qj�fX�E�a���(��Z���8y�yIυb��x˰�ù8IY�I��я��Կ.t�g+M2�ɝ�ʴO\r~$4�������wK�-�5��C,��\'d����7M>��ȇ�%L����/�]Gx]Ƿi���������!�ɷ)�� ~|��f���?#~��E����W���C\'?��ө���o�ퟛ(���*޳]�1�\r�Su=���e�����mw<뮱���4b�ӈ�3�[������3���8����4����~��i��M&F�|�{����A�+���w���p����n?w��c�G�̈s54�bz%��}=)���w�_�?�w0� �n>��x��@�^���c>9��T���3�\'��47l�G���O�\n�vxtk��_��~#�k��(4I�U�(\n�\"(��t�@b��_��;�m��\n�0�aw<�+nB�+�������d����$W���=�ĳ��� ��(�??T��\r����0ذ;\\�_�|�����h��ߟl��Ut[��W��7��o�I������/oU~a�w|ϟ���~+�ȱJg\0�\r�bi��֦~�9��@{Wc��m;��Ϯ[��U0�Ä� �ˏ�l�o�����a_�,������|�<�e��ލ�Ù����\Z�1��k߆0�h��?�A����w�{��ƛ���t�t�k�����ݠ�>^:vpe�7>�����?���\'5�c_~i�����?mq�n��?����&�~�ҽm�ߔ~;Eq��^ѢW��`���k;�DC����o��?[�ϓ��6�~����=/�Fy��ǹ2���I����/�_�x����u��x¹C�B_�;\'�u�+�f��$K�������y(���V�,����$>����n$��c�����7scq�����\'o�M$�㇗�f�O����W�3�����m����c�����B���u��s0�Q��?e���[�ƈ}�ɒx�2��zn!�wE�fY��ܴ�ۣ��7S����ϻ��|����gs��X��ܹ	���ⷡ��M���#��+����=����=z�	o�M�W���(��������ŋu����x��/o>�C���R�ϔ��t��e�<��=����w����',1454486317,NULL),(4,'KfK8e6XQsQaP','phabricator:celerity:/res/phabricator/8bdb2835/rsrc/css/font/font-aleo.c-7fvq7wpxrde1','deflate','��Kn�0\0�=E�,RS�,���	���1MPջ(e�Da��Ú��9qY���ƯK!���(��0�b��u¤�~�n&�T�Z�I�Ğ(�Iu���T$�3�aF���iT%���~xz�+Jm?���+�7��yzxV����q2���R�Z�ˬ���q��L�Wɹ7g~,b�����aI���1�	_�Y�V\r�wIA�q\Z�����w�jN�m���q�c~��\0�=�r\\�y#@�4���,��pp��������4�$[㤡�4���{�� z�-S��`��',1454486317,NULL),(5,'u3PGH4Dj8lX1','phabricator:celerity:/res/phabricator/3010e992/rsrc/externals/javelin/co-ILq98pGCN3DS','deflate','�V�n�6}�W8~0%ث���E�Z,�\0�\0�a�ѡI���f�{�CҗX�>͍�9�C&�F�Vh���X%;�\n�����p�5��*�v�-3W���Pϋ���ic��\r{�x��Κ(����i���!�i\Zo���4zң��|���˄��fÕ��i7�����q\r�<.l�Ri��&q;�~�\nqۛ^r�lK0���2VU�5Q���>����®�E���7D��2)I�c[�m�6���I(a�! �X��_,�����gDMjV�����9*�r*�q��a��f���K_|��--t�m΢p/���`��E�2)n�����r�=\0��C�;�v%�i{^����5��zC�-$~����F�(e���5m}r&�ϗ����=_��D���B����#ǋ�5�h���2�Z�i�Cye�_��ZY�`�6p�\Z��#����I�=K]��F��w&\nJ�mk g�~�����[|,|�v����z=O��ݾs��+,jq��;���-u�d����P�/A�^���ͥ�_n�L�f���K��F�3��o�\Z�l,�U&�`�}�4��Y����B��@kp?_�3�x�lGue�;�b���z����fz*ĥܞ�Ϲ>\Z�s��r�����謫$�a����d�\0~�����ܩ�-%������ugq�i�\'��qF�s�{�t{���p�^0$.~r~�\'.#���su��Z���vHy�%D+2����gA��cMg�E&�X�(�%S��9^�+�_� ntSs��*�z��^n�wS���(T����\n��3,�qN��my�C���\r�V7y	�����۽��\"�9S9�����n����0B<��\n��p����\"���7��`]�Ƅ���n9�\0�*�D)\n-�����g���<�:?_qX�1����Q{����6�w1�Vv�}%{�\\(�W�W�_!t\0x\"~ {r���팽hu�\"�\0P�g2��؅����h�#̬�B�kot=?�ǩ�O��\'\'1��E-6�����G�����GL�K���z�Q�ޠ_�s�\'pV!!?����<�d��3���r����u:�������SS�5.�\Zs<�p�h�D��-E�����!ܐ���AK���*�a\\fˀgG7��w���De�8(�\n�OC�:�V��Ԣ�Gݘ8�����R� �_��9����p����Ew�A�t�K��?',1454486317,NULL),(6,'G_.240XDkwOI','phabricator:celerity:/res/phabricator/9cda225e/rsrc/css/phui/phui-fontki-hNxQ60x.0Uyr','raw','.diviner-document-section .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif;color:#000}.phui-document-view .phui-header-tall .phui-header-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup h1.remarkup-header,.phui-document-view .phabricator-remarkup h2.remarkup-header,.phui-document-view .phabricator-remarkup h3.remarkup-header,.phui-document-view .phabricator-remarkup h4.remarkup-header,.phui-document-view .phabricator-remarkup h5.remarkup-header,.phui-document-view .phabricator-remarkup h6.remarkup-header{font-family:\'Aleo\',\'Segoe UI\',\'Segoe UI Web Regular\',\'Segoe UI Symbol\',\'Lato\',\'Helvetica Neue\',Helvetica,Arial,sans-serif}.phui-document-view .phabricator-remarkup .remarkup-header{margin-bottom:8px}.phui-document-view .phabricator-remarkup h2.remarkup-header{padding:0 24px 8px 0;margin:32px 0 4px}',1454486317,NULL),(7,'51qBKx1XgkVQ','phabricator:celerity:/res/phabricator/a79eed25/core.pkg.js;-x8ytZLaTwmQn','deflate','��iwG�0�~�_��ef\"�{\0��ʒ<�ƶ<�z�Cq0 P$K4��o��fFfe���=Ϝ{o����%2r������ߺxY����U5��/��rxVvn?�+�iy�����l�2��1\ZN&�bp:-^c�.��Ӷ��ܖ]_��Ң���bv�*��>�x�1��|(G+F`Q�O�u����_UO�@wRN�V琰�׹]t����=���N�(W�Ŵ��&�fz9�9)K�e���\\\nU�g���&���~����1Öj��_wwQsCLu���^���lu3/����բ���U�\";➵�q�͎f��\'�\Z����~,�έ������|��<�8.4~��|n多�m+�Uy��1!��-`���/^�e0��ؙ����N�iŬsKK��	H���f=�x����n�����g�Uy9_�X�V�n-g���R·�V�lMg�ְ��L��z2[�4����l}YNW�Nw9�Fe�q�(V\"�d���p>��P��H0<������6�����%�� ������]�TY!��!P��Ya�R�Ey�,d��o��`Y$v\n�7eɾ��m����p�%��0H;�7b��Mʻ�(�;���|K�l^.�����;�-WD=:�a��j���p�Q=ȁi�o�ɲ��\n�m�g�� gu�=E���%,%�@�VE�A�W�Gؑ�,C^�`�8e��ODj�	��p��+�rɃ��hW 2}��W@a�r�Z���b8��Ep�3���5�Z��-��;\0�ή�Z�a>�ϧ_�����v�A�*���V����0�(	��x?,up�y�����]N0Q���l/{?}?�a�Z�f�<�β�0&7�ֿU�	Ѕ����(X����T�!���5�i[P��h��J�e���6xNb~��=+W�K��h�M�+��~MB��txY����zzA��Tܺ��RUO9X��lO+�e�ڹZ��\\�R8&���%���oZ\'��ZR�u�+$���r��Ѻ�~�C�61���U�:oq��@V7](�����r��lU��l�³���*�O��ek\\�R��@g@ۣ��}]��t��`�v:�G�j�q�L���3��,��ZU�I��e��z2�q(��Y�۫��-+je�k9:<Ɲ��px���������c<��p8�\n��dWU~؁�����WU���\"jw������q9)W���d�&�pM�R�����g�!���:��0B��hv����]Z�P�U���#V��ǂٱm��fsu^M�6\"�^ʣ�w*/s]����]��j�5Q&}�����h�h�;��U5Z¯���\\�/l�!�*)�#2���nh}љ��S3���S ;1ۻ�_�ȵZ\0������Q��❥��uj��)�ۍMx*�B��oה����|����V���#�g��g�x��\r[���\\�\'+�[I\\v�j<�`\0��`����솚�1�����0�ݙ�sw�GNG�%6�{F/�5��L�E����X\"G\r0��O��;��#B��I�G}�����L��`/{JC�nQ���+���1靎J����\nOO ���g-��`��Y�\";�8K��~��u�\n\"�������Rq���d���P�e�F�0��������&�ߵ\nSߧ��W���x�(m�2���䆾��#̃S���6�!.���@�yma�q�Q�HL�kB:{$���}HO|��n7ѓ�,`���V��O�<�b�!��ك�Y���j�a�0p\r׫n�M�C�N(gg0\"��u\\��pO4��g���;���㢨Q�����c����؃�!��1Z�ij1��20�p�r�\\�=(���Ձ����_�z#�HC��p�$N���Z0ƴ�����%U����pr��\0s���8�=���S8�ZC���\r̓|�+�~t�!m�Dư�P��\nSǡ<L���~a\rI��M��t���2�00�`�\Z�J���l୓�y����\\¡}ZA�((��h8G4�\Z����F��w��YpF�e��b82�D���,�\nE�\"��-J��X��x�8�˕p���n�~3��|9Z�s�z�q�-����VdE\0\0�\\�P&v��-����d 3�pUy>���|V�Փ���\Z�����F��w�Xq�\\­�5�>��05P�t�W���\Z@�T�%����$����t�yyNX�1ƴ8<��O���<��@�� &���W\n�3�����ܟ�^/���e6���\ZC�4��dl�3�Q&Uzf�\Z�3���I���p�&ݝhRww�d�\n�W	�`�j���N�,^)b�GZ�X1w	E�v�Z������ٹ��h6�k-��~�=�]\n�VR����;����T�=��;_�I{O۾�a���m�_9�XyC\"1�[[��� �&Z�ru��5}�1W8�~t,\n[��FH�%֓{�M��t?����|0�q�ڜThY1�Џ�H��qva�$�}5�%�	�,��銻u�JX&T�C��c�H���JBp8��\"KXZ���B�@��Y��:�0mY\'���נ��4w��N~��� c>�l�+�ўTK�(�h�x�9�.�������\Zv�)1�8�����\rX�XX5{)Q��b�\Z��s�27|^����7\r���@�����7`��.�ʖ(��\\]�����i5E���%��3���g���r�G�U����¹������Y��ג�M��@�Bm\Z���~4�߾��iIzb?>�����K�o��~�D�X�:�\0�=����;\n0��2g����\r�N�\n�V�N{�]�$�O1[�Q�ų<f����gYu�@�ޛS�U-���o]���/4H^�~���)HÌf�(\r��\0��%��,�U!��r5��w,~ͣ�����j��	_�Fx�O�]�\0���E ؋�����֒PnA@����%P��	��pΟ�C�ݛ�ݫ+p^�-p=Y!Ba���g�i�袚Lz��N�=j�ٷ�rׅ+oڡ�@�}Om�T�;\02}9�-�^?���c`T�d^-���W߮W���A\r�����(���[tO�~Q<&�?���ɏ���|�����g���ݭFY�0�.��z��ና�H�<A���vN�V�K��ul�J���j#�]NV�k�ZL�\'��O19�\n��\r\0�/-:����S�p��<DZ\\������ZZ�GEt���w����W����)d�c�fMv볉�\0�O��<�3H���#��)n�I:��������J呯pO���{��e�ؓ����VÓ,?<�e~�?�c/+��,�~L�S r_@uX}�Pw�;#˿�ڴ�x��c�ǟ_��Ǐ��R!��WZy���$�Y~=���F���1�B��wt�/���hv�ڹ�)r�vC?^T\"y��j�n������Ұ/�L5�z>E���\";�M��gHh���1?;��9\\~}� _T۰�8���V������2������\\4�mh�)*m6��Ds�+�u���dL<!4����t<�s�XxLE�q/�<�4a�T^���CCe	�\0_f�J~;���|�����w�3s��~���\Zߏ9��\"ď��Ȗ|����\n�LN�\\�qȥ���V`)�I��=�R,`yI���y�yVQ�6�9���%����0��A=��骂ձ�@�x���%����.�\rp���(�#��!�Am��%Wd ;�V�zq�@�������pr����A�^�M%�����o~�d,��.Yc�z�٦,V�Iq���3@�\nЈtn��7Z��Z�0��GG����8�¨���sq>]�墸hh�65%�3�I)m�<����p\n\\`y^�I��;��a�����p�	��\\Q�ft+�����S�>�R����HHV�(������Ç\'4�/>������W�����j��0�Do���1�t\"ű����Aw�]\\<���.�R,ptq�H��Y���و��}k4o}��r.�:EB1��M��&�5�>Z�Q}�1><�D�7`[�����c���\"|K:ݨ��,��S�e���E���8G�R�Y���3hKU;8n%�za�.b��YZ��=_/PB����<�(���5G�Q-�k��-=X#����^/�������þ���wnkI]�s��@=p|/h�͞�=qK����[����2��T�Z��n�^Ù!��,��Ͼk����O{��\\��	b�C�w����I����S8��&�Ԑ�v��wD�S\Z�y,�G��i#\'���d�������E��2�nG�8�S\'��{����� ���u�\'۟���U�0�����s�P+�Z՘��\n�\Z�j\\�Fh/��j�,(�3d4��@FG&���J�C�h�v,lm/J�`;R��;/��E��S	İD5f̤�v���ے�hdo�-1�eܒ]$���S�*�@s���@��V�N�<k��W���d���<E�w\07��~Z�U�9}�}�K��\\�����&��BXt�^��\'���6���v��9������S����1춨$S�8U��K����>N�m�x��-9�`���Q�P���W~Um��)�|�0ut�7/����<�^:.]�T��)���D�ܷ�������}y�.^lH��&�ox%�=��,h\Z�����9���P�7w���@P��\"~N���6:;\\n�.6A	�����Z�~j��%�����t���7���ϑ��l�*��ĿO\0:0{��s+���Q��A��7�:�#6s���R���|z��ww�Q�0\n�:�O�d��CpD	�E�|��t����h�q/�i;�{w�)�݄Ilp�-�6&�5\\��1c/�F�ģ�=�ӧ�S�\\�U,z!�ǹT���M�<��3[����0?	x��v�����f�Fi�g����A�+����*�u������_��ۣ5/P�@A���+Ί�ew�X���:	/�T�׽ܨ00#���7 ���ֽ���.�F����c�wwkIB��Hb*}�C��<Y��/�Q��̾Y ����3��i��]��~S�!H�������zOP\0��ZB���r����øj򝨝�6:,��Ci!��(iA��jQ��\\ �k�0��PE�J,��r?������}{~@�9�H����7E6	��h�z:u�:��ʕ�\ZIEzq8�d^�1�ҳ|�L��\r���Z�.�<�)����O���n?�Φ�%_]��$�q�-X�\\���u�&�E9��Q��>[�-�\r8r�g�B�-z/!�?��dPK�N�gh1��l	��dg���:^\n��3�p\\	8.������\noߜ�tJ~\nG�&�����V���0�Y�Qc}����^�ƺ�!��&�\\���)�@X��}�\n�����{J�Jī!^2�MÏx�;z���S��\n1�>��i��q��ڑ�~(|5G�`�PlJ���yD��	\r��#?.qȝ��p֒��\r�PiY�D�O\rA*���:l]x5�ٚ/�%M)�q���drC��%	�q.�l�IszF�����Q�V�\0��X�A�	��3��\nq�3����(�t)\rR��=\"�YӴ)h�������{{��E0�z�wL�)�iW}���!]�~��G��qZ�[{D\"i�Z@k��j����+ꡪ���)�ZS@EN_�.��\ǹ���8�~�{ebQR{���*9���h�*0�\"�6���7K`v������fƖ�̧��\\�&M�-S�;�_5Q*�8��d�TAsY��m��r��Ɖ�#wO0�d��T5#��T����*O��-Y=q���%���\r\'ó�������6#QZ8ޜ&Jd��qRJ�L�yV�L�v^��X�f��Ɏ�Sa<���!S�y���-��hW������3�J�	��ݨ2`��V�X�,s�qTD�|[Vؠ�]T��(��|\nOX�5x|\'g�_oN-����lY����H��������4�@ߊ�p�׺c�6����-��o���� ay��+�$�2=,ME֥6^�qk���f��VM{١��).�:P��B�6�>��䒪���H^���3;P�>�/�r�^�J��2�\'rܑ����EqX��eQ}a	���蝋52����׋*����c\r�G�߬����D,���l�j+�������++\nZU���yEͰ�$E��N[	��$��4/�u�8�_��x�Hve�|�\0UL75�6�s|�u�����aS��mk{�ØD��\"�-�Y����/���}�vx9Q��A���{�tDR�F��~������3l��`zTX�&��rp�F/��팳3���}iON�!VȬ��P�V�^�e�T|��[��j�f���\\#����a�>8+G��.F=��)�,�n�<±1�����6/G���Yk�Q_Ԩ(=�K\'e�Kvw�I�؁-	0������D2�oo�\r��������,4�(�����d,�&V\\bƑ:�M󎅲N0���acMP�u��yY� �/�S圯<��ɨ��.`�Df;@ک�:�$��h����!�����)�,�i��f>�L����@5ui���o��[J́Xr����P,�X׬/i�.�°�IZ=���ϟ�b��@~d��\no�H:��ć؄�\\���v�+pdf�:�\"�a>|��\n�+`T&�p�\\��~b>�5wx$(j	���3���8u�\r�����3��;��x��#PZ-��Ӷ%��7j��>��ӏe�V	u�7�H�ҁ>��Kv����F�>�`y7>��<]��sa�,�H���gC*�+?\r-�`\"�l�Z�|�ڳ��?<k�C%�up˙y!\r!�\\t��A�E�/�n�P4��J�vw)�z ��6��/�1܍3�}x��t���7\'�t�|4>�X2ىXE��T�K4;�����˫��`t,�gY�T;�1�����B��cI�gp�%��ǟ����3Z������h���cw�:z�q�;wI�����Ey#���o��*�t���\0�U��B�I�h���\'>��T�YTg����gm�`�����~����j.C�w�u���eLcC�v����r�u߽��.��U����*�Hx?���F�q+^cF�D��d���s�����V^�^0���:�Z$/{1�VS�����l���i%(���T$=H�:����Q�l��	�&G��:\Z�h�;=���~�z��?~�+	lb�.I�K���k��t{G6H�\"7|�$5\0� Oͨ�#�uJo���m���(�C���Wk2ta���h�����du�����,�$�\Z�^��	�%�\Z|қ��#4~��i��)�˻�:�i�4o�c�J~?:�\Z��(\'u	�î���SNٔ�p�����ֹ�Y�������ꧦ���i�R���߼}�}�$�/X~�BՂֿ�|	��h(2����j�4/l�3#�������z0�����XUn��.x�H��۝&���@@��)�%�^���z[.��Z����1�ˆe:�Q���緾B�T�\\&[7�$��W���oP�Azn��f����=w�e7�D�e�TǬ6���k/���/�w�~|����:yv#�	�	I��L8؋�kܻ��K�ɽu�(�*N/wF��s=WDCZf%��=�g����}T�.}0T#z�xt�uu�\\���z<�hFⅾi���qk�\'�\'���D�j&���= ��\ZeTB�V���m�!)y�n��g3}y�8ײOYD�=W��������D>�]/w��`w7Hz�����Φ<-�88p�\0�x۸h�]d\\ρ����O__R��|���.��(����KQr@b�~�����<��E��g\\�,��1t=R-z��	����v���g����GqR�)����;t�I���/�����1��\"���� \\��y�u���p�������	8|\rD�<��]r���S�-w�=E�׍��~��Ժb��F��C�U)_4��ȅ�(p������mBh��gqٳ�K�d������<z������&�\0�{��w�a\0���_P���7?e�D�_����W?eƾ��%�&`#�N\r\\\03�F������݋7?��U��N�-Q���͵X��gq��-f�\"���,׀�n�gָ�z-d�;\\�LG�G��X������\Z�Sq��j��#��>q��W�M���z*k8MG��)�iԶ�����+Z�Լ1�c�c��3U�2�G�� _��l8��@�(�/n�n(	���GD�Q�PZK��↤(=]vڪ6�`j?���dsM9��(ěo��U�]�r׭�3hK�N�[�|K2�D�:O�,�n$�W�h�n��F� \'�pFW�3Aq6��,�Y�j���7V����o��2#�<5�83T��82:dx��E.b��>�8>�;}׵�V�s4�}s�3ި��{Ѳ�9Q��/�A���r\\T�n�`\'����ctBy�\\HsW���c9��U�#Ā_��S��Jjk��9�c}�v�9����mBb���󄕎�&l.�����ĭ�AY�-�Mݳ��;����������<y�o\\uz�O��\n��dJX-J/]�HU�u��0\Z��骍��AE_ܫ��KB)8u��������hX�U}v�ڥ訹_�)o\Z.��\Zj��b�E{�P�`�k�\r�=������I��	R��c�ϫJ���yA��)��W��1���A�0Mp�D؜���xTD�M�{SN�r���>��(~yO���.��\n�4w�Xڑ/X��Y�V�|qrrϬ��bw)�0����S��/^��:�	� �/%�>RN�K��qN�Y�\0yF�&\\�f ��4[��� �.�ׅ��7�o��]Xh+,E�n��Mc!2�u�W�<P�|���b3\n~�C��.��	�G#�zmj��T�����\0���5�,S{5�K�-�oL���X]nA�\Z��=~�%z���P��>�h���0�nn;�7�u��\r�^{�8X]��^0�,����4���*��+�YrZ�n�9&D8RVG򜙏w�G��&�a����|RA�/>R\"���K�hU4�6���E��9�����atq�t�\'���K��ޜ��B�)�ؼ�༎���=\n���\0%�&���ߐnh�I����ч��u�p��L~\0|;�+�a��p������_�ǿ7�WB?ͨ#?��s�oS��l\'�Iu8\rL��]����Nf�Ȁ��L��x�$�7�{b���־��M�u��H�6\r@�5\\d��B�vz��`��X��4�)7�W$0�I��H�\0|K��2�-��i�� �B}}�ݝ�Ώ+�W^_�8��/MCK�?;;[�gp��N|7[��y|�Q�@���.J���̚aU06}9��`R	僾�D�׉_���/f��\0�e*��`ڹ%�M�������_���&��2sۈ���HH�|��?_H�t�˰�()Ar�k�m�I�*�J㚸�7J$�8�}V��\'\"��6N#o\"W�������N���_�����GcKD�iwv���̈́jַ7���=��1=��;EI��er��?��g�i/{���L��N�t�9Ah-\n*��s�&&���\Z�bI\ZbE��}�i�`,K�Qx��S/�����1�%B0���a$��\0	�8T�Bgݓ�2�Zd?#�֔�햁���B�������8|Ө�߈��:N\\ȯ��rɷ4�*�����e\'2R;������~^a�����z���wi�ː[z,��thd�ːþ�М\'��g��\"h������f+r\r>Y_N���b��o1��A�U�Ƥ<G�ꐣ�����)	�)�^^�������I�` w�;t�y��}���?��q����:�cMr�>��M�pӇM��v?�����+8G�h�t1<����l=�!�`�?��q���f�o~�%���t4�у���R�jS�:XuWI��\"F��hK��C���xA��(\n�[OH�)�?NfW��`?Y-��J��ɧj�\0���8�ţ\'������	蠛B���T�#���1�GK4(���\r�\"1-��}��N�Ŭ�ӛw0t�����N\\�(�f��îu������:� ��֫��\nc�R��7��\"�R%z��L�Q{�tw]�N�B|l_-p�,H��S;W�$\nC\0}(���ǔ\0�mo�?��&��=��YKtn�\n�6ZP\\Ni��\'�\n%�b�{�UI��.\"���B��D\Z��О�8,ε8����������A�W��w�m��Ӈ��dwh>-��0�ٓ��\n�3Zژ�g�~2e�g9���,\0+p�h�N�j�s��������ԹȆ�K��u����N	\\@����V�gtHD����\"K�(&�\nH�0����S�lq�>\"ϯ\n�����H��c���,��$�%/�M�\Ze�$�=���)�.�f��\n�����50��?�e �R�J2}<A��#qG�`�E�Ͼ�.���Ey���}Fʐ�����+��ǟ�����f�D/d����\\�ICJ\Z:�9R���V�kv�\r�[QS�q��m!��[CZq�y������P_P.�V/`A�b}içx$\"�\Zv���/�k��,QϞܬG֏Q���sW��ߎJ.\r��8�L�1_�|zt1L���\r�n?�@v���|\n����^��^�����=�M��7�^8�O��;���3j�^��7��/��·��F�^^_1y��V���0+*�N��M[w-��OT]�K����i)�g�ѱF��r�/i����9>����?D�L.먪Jl�ߟ�}O�7R턢rG���\\?���t�g��D\"�/����-p����QpB�Q��p�G��ޜ�B�0N-t�:�_�o�щu�����.V*+ *vnܣI!Q�B�\'ޑ�dqw���d8⽜��rp��R Z�z��Q[��i��1�����	���V+{oc�4L�Ľ�`г��	z��ܺl�G�����	�I+$l�a�7��O}�5��J3���r�-�4��Ϡ\\���}�n�ԷA9��J��e�I\rF����C5�b��0B?��04�G���n��m��Z�``l�8��$�\"�r羊�0r�b8�f��|t^�.Nf׽���nP�r�a&,����\\���E�p\'���u��U����Pwx�UQ���//�A�ۗ?�|��\"�m�ڠ�A\n���͵J|�����[�&U���n\n�%�NlZ\\�6�	u���T\\Е^�����8�(vv�k��/�❢�*C:\r!I��8�.݅�Y�� ���X/X*���Q�dԖ���bUȂ�1ͺkA��>vR�F}�yG�z���z�z܏�Q\"_��4P1����97a[8T\0�҆�jEe7Ls�\Z�v�C�$z�ő��tާ��_�YJ�d�(�]]����!K���O\Z.I��{�WԜ�g\r�U\'��[\r��}�qp\\紾�}$3xM{�\"���#Id��3�o|�6q�-N�w�T򵷂=	<]3ǋi��P)��j<�K�|w�?���tC����4�p�-H�\r�@I������l�ʂX\Z@�e��R]U:�\0���M�mEA���\r�����d<6����REP�s�Pj�p�5����\\�Y���w��/;6�oz�v����Y��	s��KVF���A�Ґ��k��<�^���I��R������\'�<	�R�&�����*mVU ���@�pf�+pYD6b)4�\nс$J]��U�o��b=�q�\ZM)ܲ��M�e4�U]��O�(6���ST���\"�󣈆�\r?_�k�O��̯���H��L�;UI>|����)����b���@��������-�68ƅգ���}�Jn=��L�#��No8f+X����S�ON�GO� �# #k�X3G�\n񶬿-ppۍ,����Mb�s�2\n�Q�d\0�W�T��,v�� (2\"x\Z��g�E_����*u����\n�FX4����~��7��i�5�6���VV��\r1m?9���Os�;7��9��}���`ىL`?,�X�}<�r=�YUW��<�b����MZK)Gp+䓉&��I NG�h\\�)s�u��I���S�M[	�������x+0�d����a���#o�M#t�����n�(\"�b�8B�Y�Q�\\�r�Rۛ�+f�Q�e����m\'�ɠ�|6���2�斌�+�LUfE̲{)|Q=.�KIa���o�EK�b ���{�L�*�g������S�E*s�C�.)�y��7iז�S!2��\0�fh�~8H0\n��u?��ڴ7j�J�!���v�o��1蒷\"[\"��tx=��ף0�]��Y�\'8�f7Vw.xL�]թ�c8Y�B1����m�yjf\'Hm^�]�xKw���(���]̝!������^�a��p�N\r���:6��_�A2U��}����@������o�l���Α=�y���A��\r���}w�~�ħ��\Z�١��3\\�,k��Kd`\"Y}@����bnz��ǒ�jY����ܛx��\\�d��e\Z�\ZT��`qP}�1�G��&ç)��ޣ��������`�������?�9}�>8��߯1�|	���\02�x�%�����ッ�>�9���>�����5|������)&���c`��\0�w��?���*���D5��S��:{�O��)�\\�OT���~}����\'��~E�c;p��.\\ VGHb&��\n�ñ�7�gt�v\\T2w�R\0u6\0���q�k/*��I$Y��#b�0��҉U��k ]��e{����p��ճU��x)<����.ɳ���O���g�WC>CC-�0T/��@�\0���^��ޣ�7�����?����{�^��a<z��%~ށ�^����N��>�OM|���*����_��Xm���\\ܤ�6���v�G�@e��=��H�j�w���RKw�\nZ<�֋���^� }��1{Yf��H`�9.G�H�jCq^А]}����S|����#������i��-�:G��\Z�u͔v1B\Z��C�F3e��������Ѡz�.�3��K�/�\"�Z7u����r���д��$�N,Y_74�u�^�}��Q�\r���������vw�OK���{�b�,���\"�M�ܥb)K�Ū�<���_�1p��5�J�׉%��B��Ȯ����C��\ZӀx�sq��Y��ĵ�N�z���q��(UM�S���e�5���\n�	�ɲ�|�l�Ͽ{�&UゆJ���:��ij\r�c��!��ⵍ�wv��c��!�/�a4n*�):�5�1/(�6eqcC�1e�=;Iߺ�mu8��0�x����?_������W��U	�|����?��mN��^������w������|�G��\'L�����K|�����L|�y*H�{#.*O8X���\\\\T�*y�W��U�h.����j�g��Г\Zj\'�k�3/���PD:T]s_�#�6�6�lz�L�x���Q�}{2��d,N�ݱ�e�E�3R�o}��3	9��1ղ Z�α�(Z��\'�>s�z9]�QB=�QC\0oD�m�5)��%����s��1�hy�,�`r=*Ȗ�u��\\5r�\"��;3\"(�������8����%���ԙ������{ߚU_Ҁ�����̇\nIN�[���w�IS+G����W��oX����Ҭ�Hت.8�f���ג#D�Zo;�u |�I��O���T�D�8��:���7Q�G����:[\\�NfW������ ��\rg1��P��\'�XA���l�{��Cg\'-�:#k	�gt��o�1����x����^�O.�Uvl�����C�\0�� �:Bu�s~Q��A9�_�r���Z\'�W��pT��z�ĥ����Y�D@���8�6!�Q����sN֫F%Kd��&��+�6k\n�)!����\n;��l��s�>��\ZR\r+#U\ZJp���-�����x����ip2{�1p�kN�\rx�@��S|��(��#;�6,mY�?TS��b��n5��A�@�=8͡m��py���D(`��\r�^W�`��1My���� ����d�,�gO�B�O�g�-M�\0��4�at;zƶe#Sc�f����+�\0�sf��=���8	8���*\\nz�>\\��P���3q���jx����������.����Җܜ9qI?H�`0B���`�ڿ&G�����ɸA}�ɢ�1�1�ez�:�0�˛��D�K�f��Q/M�=�id���RpzPcc#��ζr\rq3�͖�\\�Wq��j�ͼ���Uj������$�M�ȱ����,�4N�t�3��H/)ّ��8�����1�$G\"	����Ez�Q�{�`�����(����ꖲ�t�Y�%��m�xt��d��zD�<�GL�$�!��wi|l�!�\0����`w��I�ߠ�e�����.Q���s��c9��\0\0d�孠��T�ѳ��Vw���ʹ}�=��֢��7��E����q~d	�1�����z|�<o����ɏjp\"2��XU\\���j)q��au\"[#z}�gG�c2ŏ(i����^���ݛ�q����q\'?<8�dmH�ֽ��=Z0�O/���K�=�Z�gG1M\0;}Ϛ�����)~��&	v��M�=Uu~��ջWy9x��w�~z��?DMA�q�vN���\n�l�EW����/F�h޽y��`4V@\n>�Ҷec�FB��&�G���:��xHm��Zt9�O��@Gn����i��΅�9�iO׼KXC�;s,E.�`\"W�S���P�\n���Vi�i�%�M����񨳄��44V�N�!$��� 	�Vxd��}O�4Q����M�%���w�t�\'2ޓ_�B���]	e���)F���	��h:Тp���8!P�Ä�\0��\\�$��Y4���#�_�Q���ɝ�u�/�8�e\"�Wj=�1��<Ц�}�PC�+� )����Az��c�����#q��!aۘ\'\Z���>A�:m�E�?�w f`�tw�,�9)��R=��rKᵇ2������a�A��S�*�\\v>��&%iJ��!���S�!<�>u+%�R�=�Y�|�L��a=/�tg�^H;���*�����a���u�좼���\"w}Д�$��HQ���;	�\0�\\�7\0�IW�\r ��ǒbxe�v�����&\"���ۅ�a�m\\�%!N��{����pQ�O�����e��d1V,d���\0A��qO;n;�s����a	��#�\'��aa}Fw��j�+��g��5lu�H���j�Se�l���]A�HD���!�K��χ��|V��/��J�]F�~i�.X�_��ۆ��7��=W��>�,,3g��G��0�}Ͼ�j�EA��Ĺ)<���\0�Ĝ#Cy�!H3��<|L���-�ӣ�rD�L��\r,��Th땚J�x{6�WbOܭ���W�o����h��P�vJ#��(�	�V�(4HOL3�\"����H�c�,\'[ß��o�; ���Bm���ȗ[/�S+��9$�U�O��W%���C��-�t>����_�eE�a-G��2aY%V<\'\\\r+|��!ĈBVDi��?L�]CΗ�f�`bN02i�M������f-_�ҝVg�>M?\'������Ʉ4��9�y�[ϡJ���v�s�2^�*���npa_�z�\Z?\\���*�\0%���ؙ�3�)���$���l�I݅0���&U�$J)�Bۨ\\\n.�hܕ\\-������rW�\r��n�g�/��d��E�$�b�[V�+����;�`�J��WbfC�R��HJ#���^��@��x�0���	g{hEl�)R�Ucb��u�#�~I��5*���(u7�ĝ�(l�J�,;����Eau(�)��vdr�;��vs)b۝#(c�gN#A8�&1 �@�=3����t���H�~|��n�#�|��)j p2f=h���9�F��R|h�\Zs�o�Wj���+�N�rp]`���ҙ[��� ����3��u1H\\Ot�s\nsK�$�Q�S��e%�t~�\n���h���`�D7z���h���t�]�%i�o҂������^�J�vO��	nӞ��$�cw�=b�b�:�?:\0�d���X�LDKM,�wT������.U�\0� �vlX�>�wrQ7�n�Z噰|~l�B�&�(p;����3�-D��4��Ah��%˶���-�C��3��>s�����S���۩��L�����-q�ճ�o7�~: ���%�z�{�P����RG/m�����T\Z�2���!G;.�Ӗ��r��	��Tb���O9@��B#k��.�s������\"V-$Ȱt��Oi�ԉߵ�3\'���5���^�Ċ^IEnw�ސ^�;�˫\n��.P�;f=�z��E��\0�ֹ��j6|\"<j�S �P��H�3I�ҝm*��d\Zi�ݻ�\\\rO��{pi����\\��R{D��a�g\n��	K�5��7F1٦�^��:�{��$��ץ!K��;��˶K�Y�]�Sâ�m~R���f6��O䬏�\Z�E�9�臷�Z���mMn��r|w�S+��O���v��Hu;Ai����\\[�m��ڽ����qc�D�!�g�*�O�]��vw�f�K~���SM���=d��������qG���G�������?w����n���47ͬg����G�߷�w�Š���jI��~�������koI��C�t\0k��@�_f����}/Q|��ӶR0��u#��Cy=����K�[�e��E��2^��9d������c0�$�bג=�>Z����%�(���@�ʗ��*x�<�pu٤@x:�R�(\r�|�����H6I��0-���T��۷<�|/w��ZB�T��3�+�$+����b^�����M2�&�`���Źù�#q��X��2��~>�\'Xچ5M_�$\Zy��͂��j|��M��\0DO?A\0�2#ba*L�;��Qw[8V3y��g��n5F5����<��*�xW���U��a�64�\"���Z/�#gB�u�C�8�qv5s>�H!���n�ϰ��Y��1����g$&�	F�3Q�r=;���y���)o�?�G�ѐ����a����P�?|x��n>��\0^4�����g����:����Iʸ�%�%I\"��pe�>�e*�%Fie�\\p��`U��^��D�-\'�6�����%>���BA8a�\\�i1\'���2H�N>�e9��D�a��vJ^���n�ed�dgܛ�g�[u����qU�э�G��u�7u3�UMݑ܋��������3��U���v�ޚQi�a�ҽ��p���{�W�\'�%�gv�����ݓH�l�\Zh�$X���((�$�8��6{R�8�V�?�p��eS��	�hE+�H�z�,\ry�Ӯ�+	i����f�����d��w���ɭg�Z�t�LMv�a a䍕���΅�t�½2��l\n�X( �ˊ�=9��K�x]��(J�sQ�<��\0��PH�\ZѰ\Zr1m���=\r�����\"�ہ�w��+2,EL���Q#F���L�����`]��2�ݭY,�����3�AV\"��I����m*�HhcS��I�(Y^�h0��r	?\0\rKOJc������zN���|t	�1a�Oh�B3M�����if���f�:��t�W2��#�{f�6/#;���Xc�۝#�쾼\0/.�L�D������H7#Zj��:��s�W��h�����w+�a��\r�P�������-�	U�<�ԑ�R�T���>o���t��#a�r=E��h�M�h�@�a�E��xtl���)ȣ��Gg�[&fY��\"Ysu�E9���ر�>�R�:<F�U>o�\\��A�\rǥ�	k��S�w�&�5	6u8�=j����B�ED������/^�&q��/�Bׇc�\'���c�����.��^�k��+u�J*�k���ٔ��(ŋn{��/�e��8����^%#�è%��2�5UG�u�=��+,�q�Q[���\\5͘��=����7���p�?��X`\n��\\!�X��|7�����������TCH�i���t�\Z�UI��F�����f�iy0�$0u�F��)����#�?��VS�;����*,������E�8k)��`� �eWǀlGA���y?����4�l�Hh#A��<\ZG��±�!�P��<\'��<����h�O�ܴn����i�m���z�_	>���z��l�6l��Izf;���^����%�X�y?ˎ��g���3F[���!;#�-�|�?�7O��	k�H��8����Y��K,��Pە����wR�2��	���C$���ղT#}�%�8ثkZ5H�.,y��ߤ� 6�L~:�M�i8(j!�\\���*�s���߱ΈU������V�	��i�Ӭ��-w�ʾ<���MCPm���脨OE�����ם֟�ekɏ��b���⟦5�P�NmB��<~�=d�<S&v����<y�C�*\n/n�mׂm�F{Dr֛7�P�,�k���Q�i�(;�·�}^�Y��T}����nPP��b�m0RXI�w�����h%���ɘ4CMw��҈r�뭕�D$k��c}��]!TN�@F�����;$(�\0��������s�9l��FZpRQS�T���\n�)����c~gȜ�YL\\	:�xd�N��V�����<i$�\n�@!�^.�*�F�hc[�ܜ��&Z��Q�����ڧ�\"�O\r!7�C^�֋�lQ���*:Q���\Z��M�W=\"ED���|X%g�~ޱe�V�:d��֤��<_W��3����E�o����C B۾��3�q�!\\,\r{`�C#ݻem��d�:�6�\'�:xF�͜X���:���M��i�(�)#ڄ�X��ѶY�����ҳg��͆#g>�x�Rآ����1�3?��\'�������9+��m�UM�8�&�]������[���ݦL�5�{�0�b6��b�t7�@J����M�F����ڥ�Jo��g�B����{eB�+\"�u�7=T%�]\'�Z\'Ѐ�+s�Y�{���KC��\0�[-��|�un�ȝ]�L����:�L��	�<4��*)�~�븵�F����w��X����T����o��Ct�t�8}wwG:�����GXB\"m�Wٓ(< �����{æ&�y�W<��}-ٶBδ@-�;�}I��/�ƿR���.���qv,�߁|�#Á�Y皍�u�L�/�ry���G�|��m�_����`l�\\*�+o�[�/�t��4��@�S���\Z\"�<�]�/r���s��\r�ld*���\"��f��Yni�o�_��܌x��4���a�8��Q��J�����(��FXJ\Z?���kgK/��&�0����\Z�_x������bY4�eYa��y�e��w��R#�l�	\n%\Z(�=��RV�E�<�й\r;e����\"��q�g1��9͝�U�)��;�]�R֟�iӶ\'���#�Tu��I��\0jzx�\ZĿ�^z����������g�}�������oD%��HDT�I����wK���������UW\'M/�ߩ��HI�,$AEH��)��3��@6ߣ|��j;\'�C[�ȍ~��W�Tk�9\\Q��m�����\"��\0��T���7�����`I����t9�T�q	9m�`��W6�A�A�� �����瘁Lg���tWm��{N�4`�����[\'�>e���m6��Ƌ�����\\�8l�z\Z�DG�Хd����яB���X����r�n���F����qy��*M����\'4�w������D��^T�a���f�p�9L7���E�\n�n����V��z���Ņڐ�E�si���c[��d�,���_�\Z�V$�#��A)�t,���u�J�<��z�oǎ�4�]^�@�;+r���S5z���Z�f(�f/^~���?�뽚����&���o���ٻ��/������~�ח����o~���O��;D� p�^10��\\�H;��%K�F^��5g���`��$���k!Bs�C�F>oͦ�����ǈC1&����áp��I�V�Qa�|R�ia\n�Q�����Ƴ��w�\\��v���R �!�n<mat?�-����E`��)[�%,	%\'Gv�Xv\"/~^��_���\'^N�+��|@W=�$���}���Z���&P�v����3Ȼ�����&;^����r;�tI-�E]��-�w�t�s��O�Q�l�ۢH�u{�}�����%r�	JrK|MXN��j�����&��b��YQ��.��\'F�FE5!�>��SB�!_|�����kӨ�<޶�̂��ve>��\n��S33����QB��WO�\Z�����y�(߃���\0�^��h�BFQ��%%��G�=�bs&�T��%���t������Z��ϣ�Б����_�E��ݍ�]Yv�v/Q�A���m��YU���[�	[\":v��fm\\,8���&`���d�{�|K��h&��0{�/	m�Wh����aȚ��9&��#\\_��\n�d��#�\'��ww�_\r_v�ղ����p$Fwrg.!� ��7�I~45׊�~N.�;�S������������47ix�����.����5�(͸)D?>ٱQ��rw`\'��E:^_���p�x9h��W�Z�H�Q�:\n�<U{�o�M$�O;}��.�(�l\04I����J�#_w��kS�sm��G�6\\�����/��r	��r}�����/))�������0M:�Y�ke��ڍ^[\n�V�R�b�x���`�N���t�k���y�E�Ra�?�:���=H���R�%�e��������`�mP�q4weP��\n�&��Зz�#t�Z�3uQ�p�/��g�c���|�(tn	Msc���J��7&�����<�˙$DA^�S�r�uu���y~�\'M\\6M���D�\Z���I}w0��z�F1R��7\"��dhz���N$���\Z�za\n�G5�\')$�zOk,Ft©�N�d�N����\nU;����l��?.��U����ՙʲ�	]�~�Cxb^qɺH���I9����?�dwadY�:=�U���\Z�.PW�]\\X9C�����G)�%�$Ddu�5��ism��\r�c�@�~��	~��w\n�a�_�|��PFܒ8)F)�	N:B�C �u���#��X}��@U*3��i�\"ݒ���B�1)�:rQ�R@���8V�|}��\n�P��n@,�Vow��(�Cjxv�y��ԺkYƾ�yls���ƥ1����I���s��M!���δY�<D4oKZ�A%ԌE�:�A��S��iL��\r\"�/�X��龮���4������3d�؇\'ޓl���@Xy|M=B+�p����g��yuJ�M+�i!Yڀ?]���!G&��n��=ew��	�L�y���z8e���?�oSݣPs�(�y`�\0����G�\r\ZaĖe�>R���R6��r՝A4�رQ7<���¿�6��R\r����u���dJ�( ��]���Y�ܓ\n?��S��/�EU\ZA\\�h[���Ֆm�M68��Ӻ:��`Y�h�&7��n�akƆ60M�<��8�`I��15}���>y����u*�\na)dr�3a������|2.�o�g��h��q8��w�_Ja��i�Lb�:A�t�!n[!`�f\0��=��s�F�t� x|V��N��U�0_Tg��w=G�F��t����0�ѭ��Rz�i(�k��t�i��~A\Z<����1L�#Z[Lk�\"9�\Z/J ���Ԕ.Ɛg}-��S8�aX����Y�\n�\n� ��7�T�`��l��bU\\\'��!sE�/Sn@���֍����Ey|6Ǔ�#�\Z����|���>�\\�P�?K��l�to�\"�7�_�U��i�tΆ��x0��hK /|g����\\�a��w��P�3h�����_\Z�y8v�����v�*�\n�������.��6l$�4�^���\r��]ӇU�П�?uT�z���̩\\~�\ZZp��I�@�F&�X�L�LI���.�e��fK$[Q���ȱם��!cXv��J�uT��7�W+��?E}�>�9r%k��j����8r�K��L��<c7 �)�8;�_�~�Т[������;5#�S#z\r�N�/�\nW󤅅ć�tb\"z�ys\r�f�z}�mrF-�F\\��ҽ��&�j��\r���N���i�jZ�?�͟q�\nɯ]������{\n7�����s�4�c�H2z�}�X^-��8��\0������O��M��z���\0A�-�����-N\">� ��XOg���y�s�r:`���r5.�,�0ɞ�J]�*�����q�\n:{p��Y�X�i݆b�%�+�K7��ÓE5BZ��xu3� Q�;�l{�A�W-��R(��r2o��ʖ�k͡ݬ��u��o2\Z�@���{��K\'\\\r�j�Х��($�$p<����o~��QuzC����}�#%Q�.v�Ͽ��%�<�&Xi�Lh8t0N�#�vu%��$M,���z�li��k���MG.�+�1梭����~�m�5�!��RC�Ͽ�֧|�yW�Gm����h�8mXf�T�EڗD/Y@hG�[�G��Y5}$�e�.n؂h�6�9\"e���ۣ�;Y��F�!x�?��O��a�hE����b�	m�1*���_|��W�:�#��@��YM�c5��P���(��9ч¾�X���y������%�T����p��V�����}_@�r�Eb\Z���d���8�������dp�dG�@-?��wp���1�}?T~�U�-�S{�c�Í���v��gN�!�]R#�^�\\U��y����?Y�O�J\'<�N׺N�)��=�(�C��v|ˍW2|hR�=�M��L��|\\8f�HҳQ� �R(ø�/\0��v�	ph���\'n{�%9-ź���l�6���m,���t:{���<�wT�7-�Eh¬0^K�[ƋO��α��h�QQ���6;����m����o!+~���e-��\n[Z������B�\\��%W�f���٢��r^��OPhV����ۨH�\n�����<�6�����U7\n��Z6ۋ�&)l9-����;��w���^��Q�v\\���)zg5`��K&�yW:8`���C�CzF���>T��\\����ac���ԯd\';óa5��[P�Y�I�3[��9��6�\n������T񙱌1���)�8��xJ�\\�9�5;};)[��U���\Z�Cg��j��V:�;X���������o/�~�w���:}���=>H�~�|��Bz�\r�v��pz�\r�#���\08��J<�����uw,��e��\"Ř���¸��X臎�,��ú��ɉ�7�g���Z��;�_��;�\"���4��Z=�����#!�#�ޜx1��Gʢ�kV�N\0���$��\\�G�ɺU*���Pe!\Z�pX5+5=*�ď &�9���9��Y\Z1b�6���щ\\���H��I�[s@}��>�_ҎJY�$,Q #`���o�����Kg�,�tx-�_�a�+̥k���\rY���4���>c�+[�3��R�(أ�;��0�\n�U����l���5s�f⬱�_qGR�K����g�^�܅�eP�1�Vk6�L\\�5�d��_�\\Z���`٠v֢\Z���!>1��\Z���Ĥ�^��_�\"ZS�������\0|��d����So��_�����=����C6<m������Q��Y|�#s�f�2y��ܹ�`��� \0�4v�E���e�\Z�9�f�n��A>��8W��ͼ�S���Ô�@���adY�\"薮ɹw\n\nSR݁�J��Ж$���AGl�ʫ{jW�咭��+&�I��G�W�a|C�W\0���)���ȇ^@/���J��i>�3p�t0� U�Gc�#���\r=\Z�w2�\'�o��V�5�EL���\n��M�9�ޢcٓr��t|��C_����?��ͬ	n��qD_�Z��J�qӒ���r��͸Vdp�k� �t9����VLi\\P&�(��\0A������[7�N�BR�z�|��@FAd�k��-`� !�,E����<�?�h\Zb}W�_�>�-\n��)�qv\rͦ��������=�Ԉ��G�]�?���}tCH����pPG�^i(���q��L*&6��Oќ<l�n����vHi�ݝd��vD��>��>5�S,�1w�Jj���X|z��ΦH�CK`&�K\"�\0j���GhO�LA�s/k�-ʛ,@��_4~�֑� ��m�[�m��&,ɢ`e85����,i��)��-3��z�L5���iK��AZC�C;�v9�~����\n���=%�g��\r�=��x���Zߕ���\'�4ܴ�(��}��i�p�455m�w��.M(YB������o�8�\"&}�p�&�Fxß(������k6���ϲ=,��}��(6�����5����v2��>B��E�0\r�:֧�e0��MM���W�\"{�~|p�-��r�z`1�$&��D���G:��ŧ~�Y�=�\'l���!M�\n�h��F�A�\\�B�������w�zT�E���]X\\�KN�ޜ�a�:E�)�\"�v���w�jW){��>pӪ=�R��Ź��q�L�d����nU��A��wDĊ{\0>P\nT�;�Y���gJ�\\�rLMK���I5�7t�_���@+�?�A���c���\\`�������姦c-�4֥���C���/1Z�ݹlN��R	�������K��V��5��\'�\r:D\"\0ٰ��O���h.�l���K�(���~���5ed{FR�쯐v���-����z�oż��i�Sk���f�!�|����S�l��_J����,�S��q��0l��lr�y&�7���5��\n���l~M�I�\\�v�Rx\05ˋl���}O����d�o/���{2�UC�H�`gK�LU1-���_\\�ּ�h�(��-��6E�]+T�7ӷ@À�B=.g?�\n����%��(�o�3�N�����({��8��όd����D�H�3B��3��L?�}/���=)�?�+��ҽ�o����{�y�����n���J6�=_�P��~�.��G��7P�~2.����W1���� ��>�!��Nr���~əy4�=J�k���<���\Z\r��׃��i�^��H�����-�N�=�\\�sJ��Tt�������N]����B���cV=ï��@��N�n���}]?%�}.}{G�9�l؊�?0�7O�a��m�}���\\]���������IqE�*El��8}�����Q�x���H`�p��p���<��7ݚ�YP��T䘞n��F���)_��A����=&��5~���f�4x`�,m�=���r��c�s8������\Zm�)R��0I�Jm����!;>ɽ(?V�a��\\./V�y��:kv\\W��Z�:�w��Wc�丱�`ww���?iZ��`��7���l�{�%0�7x��E���5��9�X,L\'�Sg��|��8�)����D�[��H��	C�>�-�_r;H�k1HQ���E�J���N΁���զ��O�vL��o����q~A��EQxI��e�Vd��qw�+ŹB��r�;О�]y9�ފ���X�s�M��B4l�K	�ru��:F%��d�{�H�pa6P���U�Y������ws�	J�-	�@G���\0\nX�W֨\Z����K����R<gZGV�Ȫ��$�}�,o�0��>f��y�Э+%���H�~tn=lU�o�d��#��l�E\\+�zxͱ��U��K�~���.�N?��`�U9�:Y���e\\Մ�6W��H�������p���\"g��Ơ��0��q[����)X�5�V6__��|���\nK�\"X��J��&f�?	�C�g�´P���d�M��*Q$$���Q�d�Ļ�&��}\Zp�.�d2[p�\r��E�G\"�����)1�\'z#-]N�����@Mf�����-ޡ�K3��f2Hͥ/�M����EM��7���p�@C��?pd��&�M��z(���� �R�CE�y�1��0�x&{�\Z��6Xh6\\S�0����ߺ�:;]\n�*�&�b�ۅ�lMV6��=��\n�����v1[e�,3�t�i­\'Y���(�衚L|���0>�$R3rQ��rz��W���P\0p\Z$H�T⳵9\r4_�6�5Ll��Mf�[�J���ƕT9�u�I�� ڽ�_���m��U�Ƣ4O.|w(M�YQ��+`;���nP�i>�U�ɦ�G��У��G��G\n_=r�ҭ��c�wQ>�^nh�q�=�^��A��\Z��>�#&8B���ao���뚵/w֬=�,�GI�����)>�z�K�F���y���	�ab�k\"O��&��\"�l�o�*H�S	\'8�X���ᮏb�s\Zoz3�lE勶�sBku[y��h�NZ�$�߹u�hM���p%�a�u��Rv|b�\Z�\\ނ8�8��|�f��xȭ��x)�j�ण9������SEpp���\0��@e3�=�A[�ӱ�5�v�,m4��Ĕ3\'�\0dxp�D��×�ww���8w�;��n׏ei9�5���[�#����DD\n�����҂��y5֏���\'�$}�p\'i�������K��Ǥ��#.����v�)ž:Η\0q�q��q	����\\\"ඞV_��/�������/�7�R�:�M\n����J�R��cZV����a�&�f����qLI\Z]9�C`��g�t�������q����O[N�qZ8i�N�5�U��E9\ZNF���ܐ�gՀS�D3� �]�aOI�<0�By������;�8�&��G��քƻ�ŏ��y��:ݽ΃l5w�f�T�.:��\'Ezц�+pN&T��O>w~�J��)I��LH;�Z���E�ܘ��Q�B����ܵ$�wR�ᾖt�T��{��H��N�������H�xٮ4�{�(�s���h]�x�d�y�	�s4a��ĩ����2ܘ�O���!�.��YbɎ4M�Ԓ�p����g�f���:J�����ݝ���.)-�_�֣s���\rԎ��D+a����q�N�$���;�����`I\\w�ɩ\0JcW\Z�b������&\n6��Q�̮����ptNz \r����(�\n/�q�q��n�ɭ�s�rkr��v�c���og�pj�2Qjp>���Qj����\0\\4/Ϋ��ݢ|)zr$���#=�X�ԕ0�� �F@����Uwf�/1	ĸР�5�W��������ƱGq�].W��o�e��k�!p�W\r�`Qpߨ[z���PL,\n�8��t�y��ݏV�\'h��\0��˳��2�y�{j��4�^��9�4|)4�#�����ͅo��I��jV�zE\\)\n[nQz�rxCʒ\'%\\p��\Z?�,[���p�Z\'-��1�ŵ�b�k�cy�X�Y1�(k�K�Y�\Z�3s\r<�i5�Ut�R\\���B=_����έ��0z\n(��$M=JP%o9�����X_J�\\�|nǲ�o��DD��&횢�Y�\Zɽ���&V4v�BmcJV�uz�Х�,\Zd�������W��U8i�h���{k��\\hrB�����Qࢭ�ɦ#���\Z��{z���t���Ğ���A���˷pQ\r\r��s���5�Ό����*�\r������Yr�	����&o,�߿���w�Ey��bn�?�o���R|y���`/_��?��t��x��ؿ����x���fI\Z#յHz�ӱE�Rq#dw-@a�3�Q��s�Y(�{�\'֯�#w*m�r�OY�,�������|�C/T��-\\f��7�����p{\r����HGҞV	H�U�YG�l�� p:ъ��1�D��^��}�����sby�P�(X^��E���l\ZY[!_�yrϏo^:�~����UO�}���/\'���i��\"`R}�\n��?��FrOl\r��f!b{���9,�^��b�-L�E��dna���A$����{�H=V&��H�Z��s��U�,�4Q��p��. q9��x~0t�3,i<@�y�^tBF�D�}6��5�Ow�@܂�1����Lf�!v��.��[-�^F��?�`<D�o����A~�����`0pxg�<������R�p{װ�G2�0t�����m�T�q��}�\'f* �@�<ʣ����q�U-[��ΦI��M9X)�@�e�\"14�-���\0�O�>���֢8XC�X�!g\\�9z\'�BZ�ˀ��F�J?l�F��~&�4���лV�~[�(99n��,ԉZ�_�Q	״o@��Y%�/�P\0B����cۉ�\'�Y5����M���Ya�t�h��?���3���l(�,�NJ���% ��&�0���Ѿy(N�i�U�3]�̓K�dM�3�^]��F�����#J�5�����[����������x����YY|�����\\.�no�x�%uϻ���+����V�s7�J���ϖ�����\\�G��\Zڒ�R�e���׻�Y<��郱��5&�C	\\\'9x|��d����/�rAJ�Ԫ��f��^�E7���%�k\\�F��ŧ�V!����P�N��6�s�n0�^\Zf���n�D��b�W�6�>�5e{Y܎����(dni��->�u�:����G}�Z�Xy�4 2:�i�\\�c{�dBrŎ�_�<{{\n�	��[�4�9��x®��3PA���m�9V�O�UuZ�3N�b�L�|�\0�9����qj���|���w<pED���=f�w��\'ᛟ�ut�u\\����Zi�^%�\'�Ԍ/��r8R�g4\\<���Χ|�̞��9�����#Z*(���jۃݻ�K�Ɖ̗S֊쨿; j��<���r.� 夫���4r\Z/�.x��z���0�Ӯ�l�R�4>c�u�`��=+����D<?����ܻ��X��S&���]��mvQ\r�uɒ�SJB�-S\Z���\ZugB9�ph6���9�=�%��S����_Z�L3a6�;wy�՗]A9u0�h7zO���飠����vq5�s~���|�*�C��%��b~���x*�\'C5�\\Ҧcw��.lfb�i��У�)�����. �O���(�%�5>�J���^���%��{��%�3���E��!e,)��m.��a%�kq��y��Q6�6�]�c��d5Ҍ�f���%(z���j��US��b��B3b�s����k�Ɂ�{GǱ�Q;\"[�E�L&?t\"����Y�5\0(�쟝�8!�~`��?��X\'�f��-j��/��1���Ȍ�vU凞���)\Z��2\Z�͕Q��+��$õ�;\0��Z�U��C��G<���?�jB�#.�q!�	p�${��ej�q�ή�G�k�Ƀ��D��2�\'%���(��|5ǲ�A��<��Y�-��j(nX#�Z_��C�R�)��=�*�0�EϿDa��gS�έ�:����uZr����Р⅂����)���$	���7۠������2�}����t�Pva#�ÀXQ�N����P���?�`IcS�\"Y��P^��\Z���GY�^�,�f�5i��Y_a�*wE���#��j_~�e;����{��W6DHM�#�+<}cr/}��\\mEN�/��а��җ�:��\"��,����D���oh�1��x�r9�m!�~��%i��U���4��e3\ny��,����=�\Z���|8-\'���J�[Q�PT��$�>���*���HoC�nt�E���D���Eu9\\�0����W/�݁|!�u����ӕ[�O�K�\\;|2];�.\0�y��h(]gw7E�T������~F=��q�\"�#�q�.>r��\Zk�?����l�������dJ��z.�\'tpm���q�W����y9�a����Tq͇Z�2�B�T)��<aQ F�S���]���m$���u�s[m��}\r������\05�B��x�]����B�/�E�u���DWH��?{�~s����T\\>8�]!{Z�R�͟,�Zz�i�D)c�/�1�l����a��	�r����@yc��0D�-�D���ីV0q��9h��~���IL�<�[�kl�� ��˭�{/�U����raP]5�߼��Qܢ��$i3���b����:{Y`��(��՝2;�5E��z�ֱ��\"扢�,Ռ��Uq\0|Ub��;�R�=P�g��F��7K��9[��G��=����ٓ�f֗�w�1_f��y6_�>d�/r6/�}�C�泬�U�-o.O������?�l����J�y6{w~5�����ww��/�\"����S��*��Wr�0N����ol��Uw���t�C�;D��5\rw���+��~ExAɾi[���=�ռh�(o��x���O;���v�`�4�\n���o��s���J��j���\"�@��%����C���\\_r�s�@����C�C�Ry�����h((s��_؉��gd�aCc2��蚇3����嚢�;=L����E��G�ꄶV��Gt�e�u���|e:~-��h�;�����qY�%_�E��<Hz�1��A\'��P�#&8���,ʑ���ĚR��Gjm��Wꖉ� �n=!o�o�����d�p��e��0���������\\�n�y�7_�\Zf��^��]���uxd�y������%E����&���D�7b�Bc������zM��}�%���U��b�z\Z��`=�y��n�ξ��7�I� }^�]v~4�i9/Gt�偉��I�4L!�a x\0ԇ�\Z�q5Վf�g0�T��tk�v�kN�Y�A?�n����g�	��Ώ�-U���&�9�e�k=jaGu�QP7���f2\">�!���\\틽`6,�]t�EJ�j�*�B�蛋��!@\')Ѧ�k�3��ܺ	/j�Q�O�G�����J8%F��2��,�\0K~i1H�i�,dIM�(�f���\0��4�vФ�nJmg�����-t*I�\r:o�K貲���\"<�^�k�B��F=Cj\nѥ�$�Kb�Il�\rU79*c\"�m�תMZ����6Aǚ��L�}w���Xp�i��d\'��� ���)A���N	왜	蓕��g|��7��e�ٶ�Yz{�����NO��c�G\"dQ��co�L���dn~Z��ˢ��U��{�\0�Rԅ��3Oe\\>���O�t֏=Ji`=E�����)e�zV\0���\\���VB.��e���&c�wd�0�⁰\'zc�u�l-�[)_�}L�����UH �c�����O�j�+����&�M��������}���`�c�ق�wvw�|$\r��Xf�=X2�7�~W����$�*5�p\\^�ԃ��\\�G�p�k����#!��:؋$F��m6z�p9AVX�\n�i�N�˷�RZ�:��}㊓\'\'#_��@���0?/�=��F��j�U[+!l�`���X���M�ce���@,y��˧u��Il��r\'�W-_�V9�s�%:\Z\"��zԛ�0Q���[�\"ns#\\���X�읶����db(z�$���x�|\r���0�Jϙ#9mGM�+9�� �qF�ri����}��-w��zd�:���z/��	 6����m:T��,�Q}5�IF�\Z��A�����ljn&���>h�\\9I=���~p��hj���j�^Nn\r|h��b%���\Z�1��y$6�_q<τ�@R\ZlI��ӟwox1ZFTt�^T�%`#���AAv�_`�0Ήk\r�k��^�zo>�^wl4v��f۝���Z���f�1��8؉p�n�B��>�O�#|����=CH��=�=�~7��8���9��-n�E�3�:�=gw�c�m��g���eMr \n�����m��>1?L;U������&��8�b_��O��\"����Q�7��-�x��$�?��g2]�(�+�B�:W��8��0�7p(��g�A늮����Bo���1��a2��m{DN\ZKTm\n�I�S[8��4�e��7\r��b)/�̯������\0�,%�P�\r&�t�\Z*�c����R)\Z_>����7��o:O��-����@�T�i���9pN9e����ɖU��k2�ҎFg��W r�Be����FyJ�m1/�<R�p��9]�k3��P\\��O���I\rNz\'X;�u+B��Jk�)��o�k\r�:�_]h�	��diW�xM������7?�؞��3��٘��u!��\Z������ÏM���nq���\'f6��(r@M���^�6�P�nݏW5��q*��E$��$��X�\r���;L��@�W���m[��.$�X���Gp���2�	�Q�_�����N�%����ש�y�N	�\0}�F!�$K�뉏�D���q�W���j5�,�A���^���\"@A�\"Fd�@|v�cGE�lv*�����t�Q�#��N��a��[.ӓ��rŶ���d�@�~����P�W��\nh�~�gP���:� -�5�n����dm�I\r�S�gq7k� �m�6�G��(�u���y���R\r�.ͦ���]�Rxw70��T`�1l7A~x��L���^c#��N���r>\\���ն�f�)b�H�NiJ5�!����b�{��IՆg6��u7���\'s_�z��,�[練=aʤ:l��A���l��B�8�\'�=>#�C|�0��ܥg�Χv��[M�:�b[�/�)9j�nr�uҴŞ%]S�+,�M�N[\rv0����h�1��|\rG�[T�t��]_	c�6�|qp�o1�to�ps8K�w?�i�Y�2�w���e$ +]��%�\0x�fS����r�]�s�%u�;VD�bX��������mW��~ww�:W�Ɠ2��Aھ��<���{B���Y�H.����)�~Xs����\Z:.>r���9\ne1�������� ���w4|0�%^a>�H[J\\��De�\r�S�ĕ�Yab9����QJIH��:=E	:���?�&�jQ���>.�N\06\Z��~��Ť��H�4_�F�VÌU�u�=�,X�g�G���r����!�q�h.�!K�`fi��v)��:F\'#0����,�H��B���^�r����y)��ӑ�l�:67;�����f\nz$�Z:H�!�UP�X�r����H$��}Q�r?��=������ê�S�������@U��|�V�����=����B��1K��r\\��~4��,:��>��l����q���&.)~2��p���Lm��;,`�����ۇm���9\\]�]E\\0�����R�Gx�co3�s�� lp�d块x�7�a`��<J��0�v��������E6?��Տ��w��[���k��Eo�2\0�h�e44�|���$�cǁf�_S�JC�w�Ch�-���\Z��[��k��dLP����Q}���T�o�.:���?����ߴf�	H�$S_�I~���\rБg���U5Yz�2��9Rz�rOcv���){�+��ʿ`����V|���\n�5�,��w�vf�\n�K�\0��b��\r&մ\\�G�(��Ǥ�F�ȹ\0�e �}8�ߣ��)QAY��:B5��)�|��� ��:>:8�\ZP�\nX�he����=�e��u?̪�b�J����G����4������O��c�؇O*�v��\n�krX�\'��8���}�9	�����kgX��gX֡��h\0T��\ZE =� ���1��e�\Z��XP-�#��?�W���ޣ��B�\r��eH�GG��j/kݵ2vB����݊��Ω�?��ℕ�ڄ2i}�i�O��>_�������l:�����_�./W��I�f�p^�4���o�V�����a��ٺ�T�m��%�ײ8�����T|��\0��).�=�.��#<�z�3��2�q�pt�j��l\r��?��g����պ�-.���&����O7�h>��@��Ha���{�����f�\'|���z�*%�FOv�Æ�߱�����e����n��걁�g+�e���2�7^��&/���Y�S�0	����rl��K��>��y�-jZ�^w0X�<�\r��y�0t{ڟ�7����d���#�,�*q6�1�IP������&hs��R/��)Cy��Bw������8�ϫ����|������_o����b�m�N��ܝ�5�W�M�r�4�,�XA�f�E��~I�;`r�ϐI?��<i�Ԝ�Dm�\'�\"D3|�g9��g�+��0·T�C^�]ӵ\0Y��Z�rѫ��d4>V�u�\\+T��̍�� �I8��2� oq7���C^�`�{_y�(\"����ru]�>�S�\r�𹠾]ɴ���#]���_	h�v��iEHC��S����ۥ�+���rB)-.�� �Z��r\n3t�5�֮�2�hC;���(���.������#F/�	ht@���Վ.0�sP�MG�87`7md�\Z������㵽,>�hv���	Ȗ\n�-iS@�Ԓ����2J}9�P�������q,o��a�	�\\	>�{5=��2_��CG�\0l2~�@�icg��~@O�V+��塑Cȭ�ϑ����?>;�Dg�8�p�\0����/�6��\Z.8�Kf:�o�g�ώv�k��z�������꺜\0/��r�<S��\"��px؞���(,���ッ��D�����H��*v�Q�qYB��RKAR����3��G�w�葓�Z�8��H��=	�J}��)h%F-j����ω�(TR,�=��X�R;@_��\nd��)ս�+���d���fs\'�M��o�<\"�R�g�f�<��E@�n�{�t���^����7��MP�&(y��%� ;t����n������3���:�7tN�����S�{�Q��ooV�Ĝ�C96I��\"���8	��М}aq���)�^�ظ�6|������޻���������B#�TK��p�~����s���&��jK�%\\�J[\\!/�t��Ǡ��1�*BߢH��k�_\\\"T����sԢ����^�D�}�R������-SKqW-�6\'��V����{���jT�������qX���Bm��o=Y�<���	�(?Jfp+T�xp�\\\0�0W��R���.�qԿ��v�W7)E�R�$L�-�RX�t��2�z����\r\"�q;t��TVky�?u�g�TxZ�W�bT�P��R|��R�Oy��}��iҫx�R5%�tk����$�Go���t�����Ɏ���E&~��Ā�s�O�������>w�Ի��C\nm�I�_#!ژ��tS{�ݰ������Y�b/���p\0}U����z��g�8	�]�3?�ܟ��n��=[����lp��l�ߨ9��tD%<�@~�^�ls���=���bО��-������򩅹F�={2�G]��������ϼݐ��Z�י#-gc:+��k8��\ZD0�x����[�Xƹƍ#$.I�j���W@���.<J�3�)�|N`P;n/�2��NܯDnY|��:�$\"Wp�����iA�#o��Cn��G��\n�~����kYe��m�g?�?���˓-��cS��e���s!e\"4!G�-�%��(�����l:F�d��v��[�����4r2A8�Wmo\Z�Z��\'IAa8�7�\"KK�s���M/ȪN]�lh�ʐ��zVT���+�\Z�a����Z��J{�.a�lT���oP+��٤\Z�h�G��~}q�;G���Uw-HE�B7��H|\\`o\'���H���� ��!7��b�c�;ф2Ya[V#���ٶB�`2�R�R\n86��g��`E/[�����j2���C��v��m�s\r�����c��ԃ�6���_ݶEq����T��-�>�qeku!��J��-/��@>!�>����ю��@��a�}].n~FU�vv��X�5r�R��\r�r����H�r�`#���r�W��Aﯤ�Zw)��Ш:A�����u�͸\0k!j)$����c:����v��`�=n����j�QJ�6�E�����v��,U$���E�\0k$)(K7�;�\r�!�h�)IPV��#v�B��IA�n�,�~P�e6[�a���g0DidY����{ߟ��\n���G��ȣ,�_h�D�Ȅ�Q����Tm\n��:���E�]�	W~��4�w(�	�\'��o��ϥ�2Yq̾�F��87h�@�AT�_�\n&UQ��8���f�[8�ǝ �R\0J�ͱ�4�w�~��	��\"z=Ō��֫�����	�1�/���q+�ϑ��Z::�V��#C}�z��x����7A��a�\\Q~�:� M�~�ӸϜ�3	�XKn��������m�%8~]��5ل_�M��{��y�Fy���5L�u�>��(��\"<M7P�Ro45�@���:�kp[u�� ����ῦ���\Z�n�)�f5}����7��_��^���Ǧ���So~��D����}��+�]�lBJx�{��V5_�6�G\"�u���LD�	�S���3��9�	����-��ˎ��5��0�ە�Ú\Z�&�/	��y�TE!�u�$���$ɱ�aT�Q��\Z��f*[���Y�ˁ{��ܟ�񿑴}iR��	o����0�� kiP�ϯ���s� �qAf�U+����ID�%t����T�����jSƸ���\\_�6�=���de_�S]|&����M\n ۽y�UT��dG3��\Z��~�(:z�P�9�Ҋ���\r���=��0�կ��5V�,?��8i���Sg���x|,H?�ם{�l������8Sk����$�\Z�|6���g�g\'��g�5�w¯���v�>z�~||{���eئP���{(gb�/��r0\\,�\"\Z��mj���1�,���&:�oq]��c��{�V�n�\nd�^jQ���A�ڷ�^q�5�������v<I|�b�\r���~���_�?S0u����?�~|8m��W��ǛN��?����엳�m��M��\" ;�1\\R���N8$\'�c޽�����o�k���9�Kj$��^���=�������\r��~���[B#@LtM����#���K.�\n�\n�B��8.���� �X��t��}u�_\r��x��.��W�ښӖ�j�}�\0���W3�RN�ſ�ץ�d�Q	���J\0\\���n��e��\"�����˿�*���쪅K�����W-�$���u3[����<N+X:�7�\'��Q�4�����^��H�e���a��ONSg�����u����G�x,f�����W�T�!�O�F�9�~s:,�}h�}����\Z�j�s?)Wd��f5��z,7O�;^�xE����y���4����^À9|k��Oe��2����l�ֶ^���[�)�_����{�*�[�/#;�x�J�B8:�%B+��oX=���f�?�6��hQz��]oq��*�i\'7oMx[v�e���9K�Ra�L?�K\Z ���eM�fWO��ֽ�w�^�\\���Mi�$�A�p�S�&��/�W�?#��Iq����[��?�`�ٗe��^�xT-��iF�����3�c�U�+bVH�2�\\�T`I(�O�q9���j�OK�\n\nς��vÙ�T1O,� [�Pp�\ZygC��ڙ��	�b������|8�V7V����1�.\r� �����oo$��:8RR�\r\'pm�\"�#\0�W�d�Rɧ\\|�E��&r/�>hq	���,E$�݀�ڴ���C+���0w_���e��ͱ\'�����[�IO@|���q��0?8�p������j�R?ɽ�lQпww��OOO�4g���B�ꊋ!Hg\\�3ct3�C�opjy�V�I>ʝL�5�|�h�w���l,�?z���6m��l�?~~�u;��W��4��0Mbq���	�>W��w:{#��z�ip[*��\"�r2\\�j�A͇�\\!�cuwBG#������{#1���΋���/��1�\Z�o�y?q~\rG�����ї���w���f��ѣ�7cr�Ω�����竎�h{��x����y4�a<�%3Jͯ�ד����?~�1k����W_?���4�`��Γ������~�>�~%>_�����+�\0�q�q\0�_�0@\Z�|U�ӗZmS���{���@�J)��euVMrv� \';�����S��] ��lܭ��?��c����c�`�fS���0qZ�>�7��}j��;S�x$�F�;�\Z�0��T��N���|��X5�H�?��s_��+���᯷�s~IT]��wP@�bW�P.������OD����lӥ����o$�ľI��E{N8;�-WI��?���S$����#���܈9��W��B������?��)��	W\\c0ʞ���WWO��Z����kGT!-���w˫#�����<�M��͏tШT��\Z������i�)z	����+ͣ��i�a�U������=��H�!,�K���~:��z(���꼻�|]teC�xa�-���:\Z�N�[ㄟ��{�%�W�x۴�H�NbE��4��Mf}:4x����1@�v�)̶��gb҉�zS��\'�bSk����;-�Wo��$�t\\34&�8�����0����^8�?xh�\Z��a|�рi�QL��\rc�P�{�����S��\Zjwz��f���`g�d���ܵ���aə�f.t\ZOYL�C����ˏ\"�+�_���T������;�0��1>���)��2�\rע����T6�O��A���٢<�J��n�0��P*\n�b1Q��[!M&�4��@�z�\nEu�ã?j�6���u<87��_X�>| �=G�#*:D�=��X��@��BX2��F?}$8���;�MD0���[�\"GISWҸ��wf��f�!N$El�!\")ɿV�K��C�E����sl$��c���ֳnP���o��`����*���M�+�WD<�T����>[c�N�(�*#���\"\'�X��=��c~�~��\n�CԬ���$���<��(�p��\0oΉ�g����dtI�:\"U��o��{��]R*P�lZlUm���[�lPBֽ~Z,�_8;�7����m��[�����L���[f8<��k���|��-͕ȋT�;�N�ka������Z�D�ר�b`9C�\"��粰k�,���pqUX���,{���ga��>� �`����\\��a��kKנs*��n!Ƕ����X��1��-%q�c�����n(G�ۡ_�Ҳ�\n���y}�0�:A����\n��|8G�+���FW;م���:V*I;��$d��B���{�\"ά�>-h�z}*���Ľ�}vZ(�J��k��>��?<V�]>�|�m�������mޜ�ď�6�6�7�p˸zITdfvL.���K&�#R&#����n K�̤g��\\�N�:G��a�6�q����yS���T��9<a��Ý-�j0#&�[#p��3�(��̱�{\Z�-���f����\n��[��u��/ЙE����R~�C���M�V��lB�vҰ�~�	�GS3�}\0�l\"�5�n`h<`\\=)�wN���_+����\n�s�j�Ǹ\"��#��z�$�0�H\\c2и��v+��;���\Zv������w�Km/!u2�&\'��\r�� ?����:T�����K����D�dsae������Xv�VQ�EҶ��,�Zзn\r05���c��ռ|��m`�S�8l�U&#q0�\\�S覓����f�A�7�wt���4/Yn��KCR�S�z��Tko�CN)�53zh��^O;�V�z#��0ӥ�\n��ri�jٚ�V-��BC��D#��ȫS��V5}�tQ����2[��f�y�����Q��*;>���6!��-R��dׄ��#�7�n4��C\Z�R� q��;�[�.��)h��m��Y�F��%���mSpq1ȴcFΈc��pPRu���M2p\0�M��:C��c���W.���\r��SG4�P�Nq����b��jA�&�`!�u���@{�F\ZO��.�����!<V�y�_z���\0�9}25��m�ML�g�ql�e\"�H�C���xQa�;�����D� `��ZΫ��� ������3�����}�-ɋ�7�~������m2\Z��\0��)����Q9��%q�Bv��8��>1��h8а��\'�P�J\'T7�X�����g-6��7��-I>b�3Q�k�z!XU�%�*���ٺ23Sz�����m�q������AC���ϕl�����Ml-P��\\�#�PS�5�\n/s>���d^���V7�Ǭ�%7�Lk�F�)�*�\n�X�h���\\�#l���h{G�˫�\\�UX.��_�Oa���Sa۸N�x4��@W<��!^�u0�Jj�|ќ]���P!ϑp.*�H��E�,Y5H�\"���QO��B?nv�}Uڕn��NjX������[��_Yٝ��jz��[ys2.�o�1(�z�>��_7�W-��!��U�V��[�ҕ�͚��/��i�u`Q��.��#�վ�߇��~�ǈ�U�8�Nԣc���L�Ӯī6S*J�b�m�+�6�y�m�p�P����2���n��2�fs�������E�\\䧰��h2[z�x:�3X�e9G>#p�;�R�\"PjY������q=��a�?H��[Fx{-����[O:��Ԇm��~ā$����i	}+����(o�j��fʾYB�~��\r8a�M|�С�%Y8?�ȹ��kk����t����&�#���\0:>.\"T�~e\0\0�\02(V��o&�*A����-���8�{!�?�-�HU��/8�4%u;�Z�\n��RCjRgg�R�B�˫�������C��~��.{��NoP��vB�.d�Z>��Y��]�S_�0�q3^nE~Z+��:$k�C��߭�%����q�QR$2��s��F\Z?��Qv�2)ڠ�ִ�yn`P��cӜ�/��\\�\Z�:�l�\0��r�pD}G3����rx�ф�����B�:�IqQQ \n�C$eHj��?�C8��l�m	�Z�9� ��o�,F�%J4�\"\r+\'Z��0�\'4�p�.=�J�\nT�7�8n,���v�?H���86�\'�����I��S�;�<4�����]�<N.����\'V6|n.�F7�*9�$?�M`�[v%�M<��w�����O�뉙I�Q�!����*��G�{n��9��e��9y����R�B�h�.��S��������z��u�(�������h�୎ڱX�۫�<�l֘��\n������Φ6��G�u㢖�2����K\\�\\�_���g��qmֽ�U!p/IK����U�߿�\0[\\�n����b�\\ҪJ�@��\"T��<��]��\Z����:IR�M���K\Z~K~��8<�=R=������{ۗ+��M ��i�m�	�D,G4�<.\"R�ֱ�=MSsab��Eq�+0o�����~���Xؘ^�|Aڸ��a�4�	W,R-��[�c*;�d�����$]��\0��f��9�Ӿ�eR&�qT����)A��S�b�{�_��)Ԧ_�C�|\'��/�+�,�\"����Հ�q	���^��9�`o翫���������]`x��Ѧ?pK�*�Kޗr��{��]4�=�I�M��g�H��\Z���� 	ﬤ�=%��!B,���\rd	�Cס�����a3��EX��Xr�����9\\>\r9\'��༊��0WM/�	�%ڝ�s��|CG\0�D���+b3�Z���׹s=|f���L���(\'ÛZ�=E�E�Ll�F�&#�%a����JVϱ�&��?#�55�N]Г�<tR`�37q�_�($�J����u��)�A\'(	�7l�H\Z�aN���R����Q%\Z�t��k�t�ح�M\r�3�d��>�����їhIV��(��?�3X[7X})c�7~�1��Lc�U3To6��\n����0:\r\"D�����`4 G�	A���A�\Z>��|��>7�,j�j�q!�NH��ݩ�`g��<x�:y�(���}��7�|���\\˹\'k,�AL�l(��ֵ���9����˛�h>����{(ۼM9��{��|d��ХCv��*��b.�3�D\'~˞�{G���\\���Rا��W/4�$�c[�gz��^gi�W�L���޿��G\'���	R#�\Z���w�l?Qmq]U�g|���`!\'{�Z)}��wZk�l�dd�9T^���r�����mF*pY��S�2d�Ïn�&�9�`9�r�W@gc\'�$է�S�I��7�X\0��O�Φ2�0�.9�ӌ���W����5b>�k\n\Z��֋�l!�p��O~!��ofQ)�~�eܠ$��\r�c�+N���؁�{���\n�x�-l��IZ$�\Z�>ִe]�<�*Xa	��o���k�Q�D+UC;ʯw�T�Q������I^�7�(�\n�+z�!6���URT\ZF�*Q�*:Z��HP����Q\01��?9�6ڌ�Lb�Ñf��w8��!��q����~Y���՜�π/�ֆ�Hbf�Jl�[icZ�Q���z}��Nԙ[����������5lX��ј?Y��Ő��Y�~��џڳ\Z2+����~��E�99�`Yb9u��(MF�^�Q�:<�0q��ؔ\0)�_oww%	��9�Vhu�*���O$�F��~<���}�h��@lVD�H4��X{��چ@�N�3\n1m+r!o\"-L�eF��\0�j�^���^�����\0�{[D23�h�X����.\'\0��6��`�m�sӬĠtJ�C<\r_���@`���0�p��v���FC�)���[�^�(���WN������)��4~���r񱼿�B⋠�����E��!�M�t�k�E	�|�A�bG�3��Q��6�-���ul���*;�R����S\\���\\eS\r�anM������MQ8�о�tЖtP8�����e�3Kĝ۲��cU\\�,#s��@�g�|��<�tU~$rq�t���ݝ�0�F�����P.8ɺH������:�O�	�ݑ�@=hR�<z�օ�m��-I���!�U@�k��\'z��e�II*�)�a⤥���l������jt�j�\'/ȼ;d�jgr$���ƶ<�0	I/BI\'B4A��WJ��))���4�(F	i��S7=�^�A����6?K�Z��_\rS6�i��r�Ϥ)����P�!���*��c���T�U�Sw9��!��U��!�hu�cn���3�\ZM7��BhD��\'�Y���c#9:DF@��>0hr1���(Ge$�S�Īk�������TD��A�\\%�K��ծ�l�z2\\��,�V��>���[��Hiy�q\0�����3��6)\"dI�pi�ϿVc&���e�+���A\rv�>���$[h��5K�5��F9w?#��Zqf�>J`��!���M�B�&[��kqiט��t�`�A\n��C��f���=�\".8��+\r��e�K|��$�<On�ި�\'kp������3�x�D��E�e��FPhK�T���,��]^r�$��g��{��~9�Z3U[��-��DǼ�§�f���\'6���I�z�l�DM�)W���L������a{y�,�>�7�Zp\"�8L���L�G_J�����8�\\�qC�ׁ59%%:�?�^��םH�f���/�)��\'��Έ��c�\n^�S8�ȑ�H(�VUϡ�/e*��O��θT}c���Ih��=9^s\Z�ϖ�\"���7dG˝�߱kT)*��]\"�ÚYzm^��&�܉��ww\\�v�Ǖ��1s5\\�CX�(��(6y��%��M�bz�g\'��\"�\"�|ZmX:�m�\0U��5��۸7�3�8r�R�FF1	^Wҳa�,��홇��@�<�$����b:V/� �\'GXڵ�x/p�:�C�Ul��D�-�����?>���һ�n�ܧ��\0bC.���v��^��X�����`�g�c囤?J������]���ɰŇ����[�FG+q}uDw��K>j��_Z�������x����v:���.�ɹ�G\'15�;O��,M8�a+�C���ȕ\\�v�����ghvݝO�����Z����i;�k5�:O��ne����6N�0z�ĺPF[�Dt\Zi�z3�5�l�q����(�(�*\"ݒPIA�I�T��f?�������<-b����Nls[���(S�1��D+��d����R���]��&p�e�dy����\"G[p	�ݥP�����*��JX��|�#\Z|4�?�>����<���e\' (&\r�_2��{�݀a�2�2�R棴�x\"��Z\Zn��rS�M6QD6B�2V�����\r6���U4g��/���\"��7� �<����rV��خЅX\Z�\'rMI����\'į�Ț��p^)��M���<�7�uüh<4��㕶z�=twg�7_\Z,5m���#��4�D��q��vC�x@��`AO��vg<n�\ZT�P�\"b[G����Ջ;8�j�㰚�Pwn��W\r��苭(��&���y��V�jU\r\'���Z��B���-�,��_��e���7��ņ\'�s�~�`�TF��\'I0��h�k�U����\Z����K]wR�_�iߖ\"�0kj�N_��������5*�x$�\'ϊ�83�����Uݏ&ƺx�@���w�����f�/.��M���G%���ji�|9�����X�c��uChv˖\\?I\rz��ّ����2\n�Ȫ	zw�2z6�h�E��{_OB��Y�p�}���U�@��jvv6)���M�c>��=Pe\r�/�jUM���͸q\"�z��7����	��Q2��d��%�i^U��xU�f��u[u�H����Ύ�[M���L�/�\n\\O �?���]OA��y��m	J��P ��9�i�Z�}O�ƕ^v糊�*=�\\�����@��=5���`��@�Y}��}����ܓd��!xG˵��Ӄ�s!AV�\'Xց�C��#,M��Ĉ���zX��dK�;~f�`�(\'ӽw6�/\"��G�����h*�a\\��ޖ�9�\Z���?ZA}}&`���,��e��~�)�,Q���d⫧\"�+,�/����\0�]/6�Yl?w���ǪV�gR9�|\r�jѵ>n\'��e�t�a/\Zg�W,`W�;��v��~������N�/���7���?��q�<}B���J\n\\v�>V����Iu!��x\'I�F��/����&7��VD�t6�3�MJͧ���OϝjS�F-E�m1�@��5���?a��5�̜��q�KDA���HuC�C�)�oaeٞg�1n�kIy�z0X�WJ�fƿ��5�A�{>�sOb��	5�d+��\\\r^�e���뜘���-���t��~^s�zҳ��-�\'�i<x{�l8��b	��������l`�6�F�D]�^����]�*�)�\"�Ɲ^ޯ^Q<*��*l���HbO9���/|��M��e[0\"�\0��*�=�8;ԯ5�bQ٣�8u)м<�R#v!�`|v���^\n��{��ڔٹ�Z��\0-���Z��-\\~���\\����HR�����x�M�f&�1!��p4���lq�[��T^r��SV�|�o��r[�L��\n�kd����y���7x�DzC.|㖛�����:I�1��Y�pl;K�Jֈ;�W�Z-5���:��%�,c�Z���vE;?Q�M�[$�T�H`�-|3]���j�������ag�\rk�m��R;x;/G�p�o�\r��e�H#�4��9��{!$�u�:E2	�h�\ZH�����a�?�E8���b1$��vimg��k\Zg�`cq�c������!���.ݵ��al�6NoBE�ޏ�N�qQ�\Z����\0K�\Z|E��i8�#mr��OW}2z�ji�F��M¥��u-���:hcUe��hkv�,21l-��M��lڥ(j�#���0�\"�Ċ�\\Hq+�H$����\n��<S�rV6��἞�*Eko8}9�!I�0i>��e �S��˄��\'ó|p�����qJ2fsS�\0xB@a�o˾j�\Z�1h*KS>�F+�z�� �m\0*VK��KT�v6��CU�W�\0x�\"�T���P�0���0�w[G|16�o�Z��8�����8[�!`�:a��y\Z,U`f���lD�^V0�ĠT/V���b��\'�\\0Ds���nT3�&K�^�b�s�j+��\"��=F��Ӽ��4F��������E��ƾ�]NaKQ��4>G�+�)�!��CD�ac�n��)�Bק��0,�~�N\"J�,7�b�V��%j��5� @\r�q��_���b8z��0���;(�jK���vB���װ\'[��\'.e�Ъ�w�5�L����5͘��n��\0��	�e�P�kr�/�eH��?`Cs�=�Jl�T/\\(�J�.�8�\\P�z���d{+H��������E��U��]�1�R�9�T\Z�QS��d�t����ӏ������������v�I�r[�\n�Q���:F�\n�{�I-�9�{����n�F��C����42�M����̮\Z.���=�/Tt����ɛR7r`a}.��EceG6��[$�49�4�Ŝ�`8?�T��>���\"���`,\ZP7��w�$wW7�r��``i��8^z��SLOV���^<iǠ\"��k�j��A�hD#�����tvEM�Ӌ\Z�~\r7�6�ث��#��lw3᝔�g��y�n\n���W)Z-��)Y��zy&�n����\\(��\"�����G��N�,�\"�J<|��j�I���S��\0-�[��N1��z��e��y�����Z�M��Q��i������2͵���i����,���X=��oF�ݺ��r���<��4���\rL�c��Ը/ۆ��t6��o���5Rjv�8|_�E9]��(g/�Ar�\"���2��B��|�%=\n�6B#u�k˦UD~;޸�8�v�x��vR��Nm���콰-��X���m�{rq�\rro�#k��6�/*�f��ţ�	#�48���jfS۪�#�a6Q��F��$���;�v�rD�\"CUG� /ܮ��־\r��d[�^%�[��X��g�����En���reI*f��[O�zir���5���-~=�r�R�\r����r<@싘6�l���_�K�7���c�/�3��Lx���Q��ĚB�3�5�P���w���FK7�N~�o,�\Z�X�r��5	�\Z�D%RDk�#�{��7��\Z$�ˌy����	A�Q��v�	w@j߽�Ho�B�t�z2����3C�$�J�F=��3KxTD��N`�O�\'��|��\\=M�XB,� j��4Ŝ����W�u�B9rK,E� p����~u��2����7WigiCn�G�a���Ow���=�c\n��R�EWRS�j�|�m�&.�U�KR�a�aq?Ά�ɓ5~���p�p��\Z5\Z�\"������׫��2e���4���JDP��)��L��=��G��p���.������c���	Ԕȧ�W�\0��ć��	Tج���h��,j޸@�0&ꀝv���4J�D�{f�&� �ɧQ��B��W��m�����_[�Ѵ���Y5߶��)�6f�����/�aQ\"[.ni�˅����oχ�r�f�)>Xbrne�T�&�܏�b�����EEņ��\'�<�fc���j��d\r*���������:c�9�Q;��j��\Z��G�^���e0��v�Mҕ�nV2gy��&M)�+eɘ��0���� R��',1454486318,NULL),(8,'8Pv3UAqNINqH','phabricator:celerity:/res/phabricator/5c2ba922/differential.pkg.js;-.laET2RkA0Ap','deflate','�}ks�F����\nj7G J -�[�\\2Hʱ�Z{\'\'��l��ÂP�\0Z�J��_�@Q�ܻU��Ḍ����������ߧyٴIQ�����e�/���_����2}YW���\"{�)�$\r��e������ͫr\\Vi޷뼙.�w��(���m3;�<�6��K�D��B��ۼ(�`SWWu�4\\H\'c�����\"D�|������v���6K\r&�}��ۺ<:��˴��\"�?�M����I�fO���n��ˬ��k�r[�\"�6�zv\Z-��2�,ZR4Y�d�+��\Z���BH׈1u�-�0p�꭮�y��b�I�6{I��\niV�Ix���\\�Ѝ�������>l��cu���\n�;��ILU������7D\nխ����6�ˏ����H���B����ن�8����t���mo��n!%�ڡ�0��|���ӗ?�8-`t�rlx6\n�E��\"\Z`(u	�@���<#�Q%{�ơ�k�s��g�k`�q8�Tk��� *��إ@N�_V�j�[-dX�]R�_(������ $�,���된�e��w�$a�Kr�ʹq8,�wuR6���� 8�[��e�js�5+<�^��P��>&�+�\rM�[*2_U�+�y|:��(uZd�U���E�&+�_�߶Yӎ��y�_h���ɡ�;�뱕f�k��0�6X���\Z����J�C0��2ayx�S\\m���uB�\Z�\0ӟm\n`� ���۶�˫1Q����$0ML�6�iL�?V^AwԨ $�^)6�ɳ��o@����ٴ�A��i{�ɀ:8��-�i6�2�l���G��p�9�2�J�1�L�@.	���Ee�r����Q·��YU�RBu���ev���Z��`�\Z\ZML����K���o\0ӱA��U�}{���&�GƳ�]����`�Q��b�-�ߩdP�y|L3���~�h1\ZXXgDR��`Ѳ��=�h}u*\Z�P�=�\r�yzӶ�,p OS�4����Ǹ	�4U[l�;���p����▰���f���I��X\rE �ed����WEu;���_�2-�z�L\\�y���c�P�cؘ��G�g\0����\Z.D9���#�=�2��B<�L1{DC�\"A������\n4�;�/���.D��h��v\rҟ����\0��:O\rf~��N� ��d��R.��v2�����`K���A���p�r����ͦ�Z5���Ы$/�l�~a1\rR1��)��\n��4l�0s���cgI��iC��>ib���Z��0 �?h�{����a�C�[mtT��\r�H����}����\nh�V�k���Ŝ��(��*�2��B��u�\\�[E<\"P�h	��2Y^wǜk���v�AgHT��^��E_�%��8�c<�	�\ZA�I_�~vyoH��ªu��ZA�D�zj�D��,+�F��	U���q������I*�d)�O�?�ĉi�\"�լW�]ČA����)�1�Ș�Ш*+27DPG��S��ʴa��Ĺ,�K=\\���{6���\ZW�:sk����\0�+�TO���0���P�L�$2�0���d:@h��,)��<e@��O�D�8��M���%��gkZ��)�K�gٲ4D���,�	�p	?k>�*��-�Q�ζ�!���#o�&{R��^�@s���9�o�#X�a\"�v#K�I\r���\rQ1oZ��\Z�e��K�a�a�p�*�G��8�[GMs�M�j\"a聖Q8x%J��f\'�l��w^�*5�u?����c�/���7E�3���Te�����f�Ǭq�Kl�S	�U;�\Z��j��m�5�{�%�� �|D]�E�4\r������Ǝ�p��]\'�LmR�-��B\Z�fa��� �PEa��s�Cұ��������̍	[�Rfl�$�\"���&/��{���&:�]B$����Ȋ��.�,��~��dն��R�΂q����}��-��X�	�J�.��*P��7�ڗ�%Ď9���x�v$@�����1\"�նH�Z�\n�k@�i���Sh�Z���#<`��K�\Z&���q__N�����!��q�\r�����e�\\�-�z��������eTMW�@���}�Wy	����ȧ�,��{\ra7�!���Tr(���D������@�B�n�ҩNV-���뼪��n�>%������(]�%�4��fc�U5>g�\'LK11����j�� ��h�¨��y���X����(�1	~y�v+�k�m�?��F+����>kg@f��S˗�:���J��+ L�<)&�,Kq>M6u�2>0<Bz�_��5�$�I���doU�-\n;_Ҹ�@�]��\0����\0�)�|��I�w�0&��v\Z�>\'p�|(����i;����۷ZRl�d��KjC�_D5�T0;p����k���8�́mkV,$]�\'p�Y ���\0~�5B<G$\r<H�\0J�/�]#���1\n��9Reº�0���ș���̧[!LlI*M�{a����~L�m1Ef���v]B���E4�����0!͗�U26\n������ڷ�Kڐڣ��Qt��b>g��w5X�j-��2�N@��궔�(�d���:)�2��3{H8H.�)�\Z�N�b}�G�u�B��UY\0��̀a�}CS-�RH;r�3�8�0��s��=ٜ!�s�r���B{�Q}j6d�N��:���U�����P��/��7gh�?lo6A�11��M�>I��D����	O,<�5y\r\Z�\\���`N�����\0��8�`�,�����j���v;�i}���Hq���܁?�@���ᆼ���{��,�[��f`�m�v��ڳ�g������A�qW��5<���mI�@�,�_[,��h�󋹽JH9)5kTI8�k�������i����U�����\r}_�/��xM\0��	v��4|ނaa�d�XVW�S�=���{��M��I�d���V��n��RS���G��Z�\"ͪ�7o22�|�	f�O�ҐV��8x�H\'��I�C0���eyb�[���t����P��^y����ix�f��ǌP�1�i�s�q����5\rN��$��1ry��61����0���x>|�7��6���k���!z��&��9�9U�����žM�V�ж���v�v���i�}j���W\\���Uۙ��.\'\0����.�ME�p/B4�#6��[�����U�]�.�(�����8���T�����@��O����2���o�$����._RK��I�-�9f㎮j+ �F0Ri����L��&�(uu��l���r���WP`J�m��W5��e\r��N�9d\\�1�WGb$�hd� 7�{J�n�ͺ\n��AG*(�?r�M�$߳��1���i�)�b�K��t��f7�2>�5CM랒\ZZ�%fu�9��A4��w�2����!C������.� &\Z7�^u$���u�v�nXXԒ�f�*��XF@K�mB�bY����_�f�@��l,����߼���W��}~X>]�uӒ(=�a��#a��F�r���~xP���=�5��1��zs����q�^�c3�S/)�9���\r)r���ů���Oo.~Ï��g���.7J�����-SX�Jt�e�*��f�H&꬏�l�*]ea����5�A$0`ק�T�&�����B\0KAr5����w���7D�o�m�����P��֌�Xw��qc����εv����i�A���r�ܱm\rp�l�M���_�J�S�BE3�A���e���*#\Z�C��A���\r\Zvf�蘧�Q��b��HI��Z�������*+��-��g�\n�\\���˵�S���9�d��C2��Qlrx�<dޣ8v�s]�t)���p��,W��a��]ȹ��w8�;����d|�ʵ�����Q��Q�������f	w�.�l��w�(��Wh�Y��	�bЊ���̎?Q�\n��*T�� 6��/� �F�Ǥ�HB@���F�}�g��w�ͦH�%��2�Lj�����j%Ƚz9��D9���q9���1t?d�XX�f52s6;�ք�;bB�@)�$��3��WH�!,W�]Ц�}�	����	�����e��ɂehN�;፻��`��b�^yf��6Qf���i�G��QC⥳w߃���*���Ê@��m_��*�_�\"\rH6�:s��\"z�c���Ǡ�\\Bn+�����u����\n��j�m��q�X�;���<\'�T����=s�A\r�F̄f���4,N�>;20Cĝ�;CaOɠ���8� -�&��[��gH-�������^��\r��+�&�l%�v	�{O�ly}Y}R��Bc>3D^n����1��gt������4��)<L�a/)Ā%_bU�wrm&����jy��A0�� �ީ}���� Ǥ�m���P6��8P���}kܡk�����UmZ��)�W<J_��M}�h�αMr��	��8����Z��H�Y�`��UB�\r��O.���ڀ^t����H�j��,H�8Mfg;��uT9��x����\rN�ͅ��ОPfI�5�M���mW�t�8/�\\�w��aǹ�#��T�\\�W!p�����ZAR��=�n��=�����0���݅�\"�>E��O�xL�n���=ݾ�UK�<��ֻ�B�L�n���l�b�2�����R��c@�x,��y|L���.�yz!��cr�V0���8S:�!V�CJGʩ�x6��\'C^��Q�$��T羂/s?zKf~9�#�P�������i�i3S4��]�RGb�\"�{�[��>��ժ���D�g>�D�@��Xf��1��y��]����خ���Q򐫵�U@�\\oL{�4U���O����\n?�ds%�����\"��<t��Kd�f�A��nP�\"2�c(�+3���5婽���j�-� �s0۱o�ӓ���z�?eI~�NC�N$R�i�e���۶⋝�$%��e^���Ew�����u5�b�۶���d������wHL�cUҶ?K��j�5��w�5�nH�3�(xo�jWC��㛅�JKrY����&7U�o�5�?�H��D��\ZC�8�܈>��	,����Fjl*R���rh�Z��e�q\0ЉZ~8��4���1�Mn]a;��:�XV0���M\"����*�|Ê�z�waeG-ԩ\\�n;������[s%���2��}\Z�q�S�{���:>��)Y{i1y��\0�q��!K���C�T�z���,��0��\Z⛪���P�8P���-y*��&��`��,(���γi��i��8�y���\"̙�>=�#N�����ǎ���F(�)	mD�#\Z���w6�1�����\\�Ԏ=���v����1��4����^K������\n%�m�j;���(N��5�\"3��:L�\'���i��>ˤ�L�:=;\r���!\'[�u�6�M�蒉yK}	��.;ySv�7�(P��z�	2&����ֿ28���!��Z���1g�\Z�@~�GG^�-ɑ�>7g���j���H������W����V�\r�AYz�q�8R��)�z��{�V���q����%����yx/�T&��\'L�N�o����}>��6�	����;�fE���1�C69���ƜaK�[9z��h\ZD6L���JS�.�����L�T�&��	T�,�CΔ�]���K�~�\\�A �ʵ��4��s~}1�t�e_�;7~��Ur9���E����TþS�齈���z;G>l	�0��1ӿ�<�̸�|EEr	\"D�c�G�r�$�\\3�\\�=���qO;.!5��B��ㅻ����ɭ��3�{�D����\0����_��aڴ�un�iфIg��o_}2f����<��^gwthRB�U��^�]n릪�ə��h斏pU..3�m�dd���K\'����ƾ{���J��Ʊ�T[FY6i��M �s.���Q��^�mQ-��1w��4t��VϹ܅u�pI\0���Rݤ�k�����A�Wfv�\\�ǀ4Ш�)1�/��q|暌���e@��Ҭ�\'��\"f�m��\\�s	6؜SZ�d�hrv�\\l�p�`���:/���pX\'�L��&+�=c�[\n��S����G�(�`�Ԑ�C=u1�z[\0�?���J�����!�Ɣ0��Ǉł$��sh�ޅ�]���I�8��S�4�� �Mx�e�m�ʐ+z�bz�ƃ��SF��h�Oxk�l�^��\"Y:�D\Z�Bs���5;SZ��A��m����\r��׉��ִ�d�̥8���j\n��Ҫl�)�\n�)�(�Bˣ�?I�b8���M��cU�(v	nN�}����b��>��˰\Z����|H૚�ү9\r�bh�<���w��˰�p�U�����Tma����H�N�?a2U�D.��NIk9�V�}��,cr%��A��ͿӮ�����QO�ϒm�.nP�9�[��-���[�c����w�hS8�q��N��O�nיO71�V&�I�GV�1L���� �W�_ޮ��]n�q�V���磶\Z�6?��0�c�פ�=��Ogt����p	��][�)��g599���~)���:�rp�����۝<����,Ϫ�:�{j���@6}=�g��|��E��F���H��6���{ťX=�4�ܐ|0Jk@�TK6\r`R��Oh���!�y�)���8Y�� C�\Z���p�Uu�d~�9B�!0�O��;�0�V��&��q����+XOuNY��h��,:��=7�07{�q�:��xͪ�{۠�v}�#|K|X���	9� �+3�T���_�~ʓ8v�4���@A>\n��]��q�Γ�e���<Ɋ��˫�\r����1P��N �d��a�O0j6��0>���PT���=M�_�i~V���+�;�&����Ɋ\\z_�Ó`Ǉ;t��б�94���\ng�VQ�,�8�_f�d�mĞ6�ˆ㿝F�-SDg.��a~�}��f�ԯ�ep?I$�84�v���}lu����x����%zB.��W�Wq�<w>/H�>��S�96h)���\rw�+�5���R�.]���χm.���U6W�Jh���7������Mx�R,�>./��&��X/l��U�t͇��SM���q	�-ݥZ`GH��h�6FN�}Gr��� �[�xh�B@�&4�zr�D�`zo6R\0::�\"�!i�� gJ\n�>j�5F��?fxi5����oGq�4�p�ˑ�g�V5�\r�\\�5���1����J��,�Ƙ�l\'�UTm�T�\\�M�������sۂ�mK����a\Z�#�d�������M�k���^w��h�z��z=bfR��5��Dp9�c���mṵ�T�\0��!��i�$�{q�顺��R-�\r,T���f��\'Xd��#�\\!���Qp��	Hڬ.��&/�G{�.�7!�`��ɂ�����C��<fk�b�3�ER^C}�xh�\0$·��E\r\0�n�\ZO�������\"�57IQ��������X3У�@�>�upi��w~v�O�0R�k����H{J0Zᅸ�\\����,0<�<#0�{8١D��}��S1:�!*��R3�A�uDM���n�u6��[��|-⪏�\\C���~}U#s�.�k_)s��F\\#�;s�FY���끰+>�J2�dTݹ�_��d`g;P�����<����yO�)ǽ]�G��Iɗ�4c��g��HI��E٧e����d�gD=�\r-�;i�4R�Nw��]��[��C����_���s\\�朘Ӭ�V\"�L�m概]V����_�;?zW�r�/�����\"����۽��u�$��ӈ%�;t�m�ǚ��a2oG�\Z������B1��P��cu�ǴǜLJ�X�0�ie�\\7ҩ%a¹-n�e�ۑ�?l�P���lS5xi�n�����32l,�N���:��坦C��`+����d�yUO�*��D��k9��\r4��fw1U������Î��\n���)$��\\��8��~��:\08��[�56�^I���M�T���@�\\�}L_�9�_��bV��M�����,�O`bP|T��+����%*:��9&r�u����OP\n�U��\0��Oj<P��K-�(`��J�]�_/+�}���g�㚻-5�+��a���[h�qB��B�<�c����3DNj�7g><>V>�Z] �#5������;q����>#��D���\rx��kV�ٱ\\��!�U�Q����o�@��:�Ah�w6h	e�ui���\\V��,\Z�Dozx���,�\Z�P�@�#���4�c�]���4s����gHj6@,cX��x����p���fu~#�K5�����a����w��uҀ�sX�fK�>�}�h�p$Aa�1��yXC�^{sH>�˳d4�M���m``�q�g�	�8	����:Ǩd湊��0���)�ƌ��%�s\\�m7�G����3�`��	ղ�9����789�w��>z4d.u�ǦJɬ*$UMz����z��\n;���S�A����� ���t��gr�7J�-�U֕W��8�B�kQ��`��P����V�E-��?�����jO\"˰�2UѦܥf�N�e��B�8�v4F.X���an���k������(l�E-�{V~_=�<j��9_�Ck2�!~0�7{�Rz�C8��D����Z��l�왧���jH�����1�Gn��I�?>a?݌��\'$ _���R8�O����z\ny�\\盟@�p0���m����)�>>�����\Z�}M+�>�B�28�O*�J\Z߄2#uy�dJЁ0�S���T,�iV<(�,�f�-���1y\"��\"G;�竗:��F���,:u\n�@l%2&<ATw�X�:qގ�����fs�Ý}�� �Eu�X��pk��O#*�m�SA���嵾!�����ћ;JN�6j�e�xN�X��h}7�����rM��ҩ���^�\0(M9�ҷ�b�K	�%�rN Y팪�u��[�����`苊�~�u1R�m�y;qM�G�C��Ɔ$�gӽ�%�k�f�Օ��������2^����M-��d#��˴��pCta<9�~���5�(��qn�?�A�t�XyM�N�B=�҈v�,ܝ�S�f�x\0\Z$\n�k~��\'�!e=#J�O�2x�`��SA�ou��Y�Sp��~n�/]�+:�(��Mڊ4\ZO�����	�2��u�Y��·��m��4��coA�7�$pq��{�$���D�Ӧ��cC՝%�����)J.���(j�.�׬~0o����e��NTC58�\'s��Y]��:�c�4�T�Ȋ�:a�����4�˛�=�;�M\\�9n�������Sw_l��:={y�E��t�\r�HZ�uY��m/�k\'���LJb���]ٮ1p�[N�pG��8\\�L(�Cjx��rS��*���:U|~ ��	�ґ�����7���,V�7�:+����>\"n���7�:�P�|D����� N�Z�>:ȍ��>����o2ʎ8��^���3�^P<�0Ěэ�K�Q@��I�mf��(�H���k}�<��BFg�\\�6vI1srB�fJ�A�@���8,���DG��W#[���&,��.a�R��ot�)�S�o�F�\nOT�i�P���̠Z��f��jmR���I�)������殏�͎C�m�I�y0���Zs�?�wvq�*n��g]g�b�~H�kx�t]%�>g�R����ƐX���r��a�9=�ε���S^��}$$?e�~�)e��U�Yy�q�-��G�����U0Q\r�v���Ҫq�P�a��3���j�hgq�Le��#y�{\n��%�x�+g�/���݈�6z&*��\'?w�{�X�(nHG�8�S�h����a�ڛ�i�*o8�jt�A���\" �PeTO�1�����������2Ǣ�Q��X�(?��< Y)9��Ѻ�o�����ъ�������;����q6��o��-p�T/iҊ�\Z.�H\'_�����P�\Z�)Z�\'Pg;b�&v�M=ڸ�]�18��e��s�\'��2�*d�w�] �[ԍ��7F�	(����M���	Mf@~�\0 ?|�\n��}�\r����1��k�AR���B��tС��=S�����D��c��(�Q�iFҭ�_��W4˒�^� w�~ĵu(�\r!]m(�F`�}#%�z��=�7�]���n`>W���?3W#R��y���/e\n��#�d���%��P��?���Sv96�I���4�S��I�v�T��ç �K�H_x3&WeZܘ`��q�C@i^α�!,9�UɵE\r���%�5]�E6J3�;<2F�y��9K�*je?�c�8���x7ɝ�.<�5�Q|jIz�l��K����e�?�ƣ��НD��s���٧���p����ŗ�)��\'��[�e���T q�c���/���T�7-�L��6�\\��)T��+6�7�D��\"6W��rlj�33��Hv�m7�����O�-Ll�(Q$հT�P��Lbz<�o��~��\'�8ޟ�t&���n2�N@�s�>>ސ�J|���)�)㰫[Ϛ���/�晪�ƞ@��V���\Zp=U�%r������ԡ���	�m�%�GZ�5z�NRݼ����Qu�éj@�S]����KDo�\'5H�	>H%S�-(�_��^e���P�,֕����a�b��P�.Xp�y!\0~�/`�(!5��Q�ʷ����/H���You�+T��s!�,4�+�W��w��}@�w�b	�h��?Tɞ���r3��yQ�^h<W��,�q�8��������ǗC=�����B~��)��HO��9r�i��_R�.�?R�oMRi�J�j�oaj����0�[�HwZSߗ�*��-W��Q���0^��˻	�\'(�`�����H�e�`��%G{�[I�kЎޑ�],�z4����ju�D9 ���4_��5�������̣:5��F�y�ѝ��:��0�M�=�r��b���I0�C`y/�\r��CR=�0DHq���w��8l&�Đ�;�!d�e���Cw�AA�)��l�v����K���X��d����D*����Uu ���}���8jE�;������~a<��+Ә띲\Z{�Cn�Ca+��wL�5�\'�?ŋ�=�,�t@cJ��X\nG(\'��vhI�Eu¬\0D����8�h����OcG��o��x�;��i�mU��!��CC��JfV�ψ�\\��ܡ�ݷ?���H*W\0S�}Җ�OD��wMV)[\"j��!f\'Ôf���6�+X;|������t���<������O��\'��P�5���{�%Q�Kc��<�Ѱ\"��y��pd=[����3/P���1�ۜ���-�5�{x��r!�?��4�|�:���瓏έ�0��eSd9����f�԰%�2�m�o�h�q��C�}��D��\0d#������I�/\"$�b�8U�Cs�YU���KQOix�\'M��h�~�C�o����\nc��Y9��)�O��޶�7z�m`�����~���z���>��h[��ΩA���q{�����޷�oa�,7�;{�m�t=��\'�ݗ(�{}���ݧ�����*w� ���b�[�E�N��`�G\0O��q���%�۴��Tj����6=>�ޣMC�\\b�%=��!\r�	\'ut���T�\Z�1��N�v%Vy����E�����]9��n8�!w��-��ƙ�\0��G��C��yn��	�k�F׸ʠ�x��+y\\\\}���XI�m�l�e�9����6DO�z�,��էd�=8�/����<uN��;��\nE��cc��7TP��lv\Z�c��v���=��(���β�tMW�[J�{3�)�2\0t/������ʕ�m�I�\'D%�������h\r6��4��P߯�=�U��Sb�#����%=K9��P���-����]��@�(\'�[�����z����.V�y4rq\n՜!K�L`�ح���Nr�����A˧r��E^`w��jˡ�z�\n6�ŵc�&+�C��ΝciG�W��qU@sE���{�݅�EA�r(����e��wAݶ᠁D��F_�;����qG��7\rN���cp\Z�� \\�p>����>h W���*�aI��L�S�W��H�)��̻s����MGE����;����9����Ս9�]>�j=�����_s�ݧ�@\'g����ݻ]����\"6(���N�[�����º�e�=/�C�S�U\rU��\0��m- �2�{t��ݡ��v�X�%P\\ڵZY˻��<v˒����i6���W��<�niM��5yhZ����7�I�P���+�x��� ε��J��> ����\0�~��\Z��>��1ɂC�h\'s���6A�\r��t�w�\"�^U�;�ΒM}�|署Z��t��kXW�6�I�)o\\�}�ר��v{\0y\r����Jy�g��K~z� �\\�\rKT��c	�|�S�bO7�1Ŧ��.�Ŧ\"Y�7\n)G�}ɞ���A	�ye���x�V�4�q˼ˑ�iZ�����?9bj�%�8,ӻ�b.�����)q���ޅ_sMhvz7���\r�n�~�\Z\'L���\"�������xl`6caz��O��\n��q].A��@��_���	��x@W���|4��[�v�}\Z��p��NH��q�2�����A�H���1�\r2�\"ʧȐG�����-��b;pq�)�w�;��ĨL��7��9�m7�����������__�j~U��	t��&raGN����M���mx����X��M�BJ߭2bC�jjJ�]E+��Z�������D�\0\'��Rr�qF7~���e��*�Udt>��1�ȑ\\_�����~��K����',1454486437,NULL),(9,'HhYIPhwICdgu','phabricator:celerity:/res/phabricator/db7e9c40/rsrc/css/application/conf-FF0yol9jSjnp','deflate','�TѮ�0����E��W�?ZZ��Ғ�����[�U\\wCbL��̙s�|hj�0�[\n0��J���\r\"��F�¯���(�}�:pa�T0مM��H�L�hg��H�M����(R,�\nF�����`�����t&�[��P��V�M�y�A�Ϝ�\"�0��(0\n�o3X.9G��p��R�^`����\0�Y)�beeґc3P8Ef�����E\"����F�\rx�پ�E��\'U����f���=� ������y>��7��1�LZ��\\��Ē���F��aR��f�)�,R�fʙ��\Z���.\Z��Y/x1�P���ăך��Wy�9��OB���N1���4��^Tә/�����n�����tl���o�A�O�F6��f��V{��\r�*��mOq:���d�IF�;x}��F8Q�l�����b�9`�Q$����v��9-��9*�b�Pqo7T�~�j�H�{�*���QTlRg�T����e<�d*v}؇����\\���O��n��hv��d��.~�Im��_�.Y�rN}Bq[�ӵwb=D�i�N��8I���',1454486445,NULL);
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
