-- MySQL dump 10.13  Distrib 5.1.33, for Win32 (ia32)
--
-- Host: localhost    Database: bsp
-- ------------------------------------------------------
-- Server version	5.1.33-community

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
-- Table structure for table `abdf_attach`
--

DROP TABLE IF EXISTS `abdf_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_attach` (
  `ATTACH_ID` varchar(32) NOT NULL,
  `ORI_FILE_NAME` varchar(100) DEFAULT NULL,
  `FILE_PATH` varchar(100) DEFAULT NULL,
  `REAL_FILE_NAME` varchar(100) DEFAULT NULL,
  `FILE_SIZE` decimal(10,0) DEFAULT NULL,
  `CREATE_ID` varchar(32) DEFAULT NULL,
  `CREATE_NAME` varchar(32) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(320) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `PROCESS_ID` varchar(32) DEFAULT NULL,
  `PROCESS_NAME` varchar(320) DEFAULT NULL,
  `PROCESS_INSTANCE_ID` varchar(32) DEFAULT NULL,
  `FUNCTION_NAME` varchar(32) DEFAULT NULL,
  `DICT_ID` varchar(32) DEFAULT NULL,
  `DICT_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ATTACH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_attach`
--

LOCK TABLES `abdf_attach` WRITE;
/*!40000 ALTER TABLE `abdf_attach` DISABLE KEYS */;
INSERT INTO `abdf_attach` VALUES ('402881ea289eeba501289eee05db0007','oracle.txt','/20100516/','127397671877910364901oracle.txt','0','8873FA518265405763E919A125D540ED','刘正仁','2010-05-16','ff8080811928036a01192813cee80049','经理审批','402881ea289eeba501289eed8ade0001','ff8080811928036a011928120f750047','并行会签测试','402881ea289eeba501289eed8aee0002','process',NULL,NULL),('ff80808126a75e580126a76f2f330037','Wildlife.wmv','/20100207/','1265529466107-1976640789Wildlife.wmv','26246','8873FA518265405763E919A125D540ED','刘正仁','2010-02-07',NULL,NULL,'ff80808126a75e580126a76f2c3d0036',NULL,NULL,NULL,'online_help',NULL,NULL),('ff808081289c314301289c32219e0001','UrlLog.hbm.xml','/20100515/','1273930850671-1414923098UrlLog.hbm.xml','1','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15','ff8080811928036a01192813cee80049','经理审批','ff808081289c1b2d01289c29fe8d001c','ff8080811928036a011928120f750047','并行会签测试','ff808081289c1b2d01289c29fe8d001d','process',NULL,NULL),('ff8080812cd952ae012cd9b88b0a0009','Magento List.txt','/20101212/','1292142938828367282109Magento List.txt','0','8873FA518265405763E919A125D540ED','刘正仁','2010-12-12','8a90247317b150a30117b16db07d0004','站址谈判','ff808081289c1b2d01289c1f81300004','ff808081178d304d01178d45e73a0001','审批流程','ff808081289c1b2d01289c1f81300005','process',NULL,NULL),('ff8080812cd952ae012cd9b88b1a000a','bryan.txt','/20101212/','12921429389061190429628bryan.txt','0','8873FA518265405763E919A125D540ED','刘正仁','2010-12-12','8a90247317b150a30117b16db07d0004','站址谈判','ff808081289c1b2d01289c1f81300004','ff808081178d304d01178d45e73a0001','审批流程','ff808081289c1b2d01289c1f81300005','process',NULL,NULL);
/*!40000 ALTER TABLE `abdf_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_dict`
--

DROP TABLE IF EXISTS `abdf_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_dict` (
  `DICT_ID` varchar(32) NOT NULL,
  `DICT_TYPE_ID` varchar(32) NOT NULL,
  `DICT_VALUE` varchar(32) DEFAULT NULL,
  `DICT_DES` varchar(320) DEFAULT NULL,
  `IS_USE` varchar(2) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `DICT_ALIAS` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`DICT_ID`),
  KEY `FK_ABDF_DIC_REFERENCE_ABDF_DIC` (`DICT_TYPE_ID`),
  CONSTRAINT `FK_ABDF_DIC_REFERENCE_ABDF_DIC` FOREIGN KEY (`DICT_TYPE_ID`) REFERENCES `abdf_dict_type` (`DICT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_dict`
--

LOCK TABLES `abdf_dict` WRITE;
/*!40000 ALTER TABLE `abdf_dict` DISABLE KEYS */;
INSERT INTO `abdf_dict` VALUES ('402881e51d721ec2011d722fe6640001','402881e51d5c149a011d5c5ed0680024','hghfg','gfhgfhgfh','Y','0','hfgh'),('402881e51d721ec2011d72328b160002','402881e51d5c149a011d5c5ed0680024','gfg','dfgdfg','Y','0','gfdg'),('402881e51d721ec2011d7232aebb0003','402881e51d5c149a011d5c5ed0680024','gfd','gdfg','N','0','gdfg'),('402881e51d721ec2011d7232da7e0004','402881e51d5c149a011d5c5ed0680024','gdf','gdfg','Y','0','fgdfgfg'),('402881e51d721ec2011d72330cf80005','402881e51d5c149a011d5c5ed0680024','gdf','gdfgfd','Y','0','gfdgfdg'),('402881e51d721ec2011d7233383e0006','402881e51d5c149a011d5c5ed0680024','gd','fgdfg','Y','0','dfgfdg'),('402881e51d721ec2011d7233577e0007','402881e51d5c149a011d5c5ed0680024','gd','fgdfg','Y','0','dfgfdg'),('402881e51d721ec2011d72336ecf0008','402881e51d5c149a011d5c5ed0680024','gd','fgdfg','Y','0','dfgfdg'),('402881e51d721ec2011d723385260009','402881e51d5c149a011d5c5ed0680024','gd','fgdfg','Y','0','dfgfdg'),('402881e51d721ec2011d72339bab000a','402881e51d5c149a011d5c5ed0680024','gd','fgdfg','Y','0','dfgfdg'),('402881e51d721ec2011d7233b156000b','402881e51d5c149a011d5c5ed0680024','gd','fgdfg','Y','0','dfgfdg'),('402881e51d721ec2011d7233caf9000c','402881e51d5c149a011d5c5ed0680024','gd','fgdfg','Y','0','dfgfdg'),('402881e51d721ec2011d72340aa2000d','402881e51d5c149a011d5c5ed0680024','gd','fgdfg','Y','0','fdg'),('402881e51d721ec2011d72342d8b000e','402881e51d5c149a011d5c5ed0680024','gdf','gdfgdfgfdg','Y','0',NULL),('402881e51d721ec2011d7234514f000f','402881e51d5c149a011d5c5ed0680024','gggggggggg','gggggggggggggggggg','Y','0',NULL),('402881e51d721ec2011d723475140010','402881e51d5c149a011d5c5ed0680024','fdgfdgfdg','gdfgdfg','Y','0',NULL),('402881e51d721ec2011d72349c040011','402881e51d5c149a011d5c5ed0680024','hgfhg','hfghfghfg','Y','0','fhgfhgh'),('402881e51d721ec2011d7234cb900012','402881e51d5c149a011d5c5ed0680024','hhhhhhhhhhhhhhhh','hhhhhhhhhhhhhhhhhhhhhhhhh','Y','0','hhhh'),('402881e51d721ec2011d7234f4460013','402881e51d5c149a011d5c5ed0680024','fghgf','hfghfgh','Y','0','hgfhgfh'),('402881e51d721ec2011d72351c9e0014','402881e51d5c149a011d5c5ed0680024','hfghfg','gfhgfhfgh','Y','0','hgfh'),('402881e51d721ec2011d7235446a0015','402881e51d5c149a011d5c5ed0680024','hfg','hfghgf','Y','0','hgfhgfh'),('402881e51d721ec2011d72356fee0016','402881e51d5c149a011d5c5ed0680024','gfhgfh','hfgggggffffffffffgh','Y','0','gfhgfh'),('402881ef19766f760119767dd8950004','402881ef19766f7601197678031d0001','待办',NULL,'Y','0','DB'),('402881ef19766f760119767e2ee30005','402881ef19766f7601197678031d0001','已办',NULL,'Y','1','YB'),('ff808081180243ff01180245e4460001','ff8080811801f4fc011802057cc90001','男',NULL,'Y','0','man'),('ff808081180243ff0118025197250002','ff8080811801f4fc011802057cc90001','女',NULL,'Y','0','women'),('ff808081180243ff0118025197250003','4028888220d781970120d7826cab0001','是','ttest','Y','0','Y'),('ff808081180243ff0118025197250004','4028888220d781970120d7826cab0001','否','test','Y','0','N'),('ff808081192925a30119292dfa810001','ff8080811801f4fc011802057cc90001','不男',NULL,'N','0','nthing');
/*!40000 ALTER TABLE `abdf_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_dict_tree`
--

DROP TABLE IF EXISTS `abdf_dict_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_dict_tree` (
  `TREE_ID` varchar(32) NOT NULL,
  `TREE_NAME` varchar(320) DEFAULT NULL,
  `TREE_TYPE` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ALL_PARENT_ID` varchar(640) DEFAULT NULL,
  `ALL_PARENT_NAME` varchar(640) DEFAULT NULL,
  `ORDER_SHOW` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`TREE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_dict_tree`
--

LOCK TABLES `abdf_dict_tree` WRITE;
/*!40000 ALTER TABLE `abdf_dict_tree` DISABLE KEYS */;
INSERT INTO `abdf_dict_tree` VALUES ('fdsf','测试树','test1','root',NULL,NULL,'0'),('ff8080811754fd2b0117551b4d890001','HFGHGFHFGDFG','test1','ff8080811754fd2b01175520bc770002','ff8080811754fd2b01175520bc770002','hfghfgh','0'),('ff8080811754fd2b01175520bc770002','hfghfgh','test1',NULL,NULL,NULL,'0'),('ff808081175557e801175559eb430001','lzr test','test1',NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `abdf_dict_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_dict_tree_layout`
--

DROP TABLE IF EXISTS `abdf_dict_tree_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_dict_tree_layout` (
  `FORM_LAYOUT_ID` varchar(32) NOT NULL,
  `PROPERTY_NAME` varchar(32) DEFAULT NULL,
  `PROPERTY_DES` varchar(32) DEFAULT NULL,
  `INPUT_TYPE` varchar(32) DEFAULT NULL,
  `INPUT_KEY` varchar(32) DEFAULT NULL,
  `COLS` decimal(10,0) DEFAULT NULL,
  `TREE_TYPE_ID` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `PROPERTY_DATA_TYPE` varchar(32) DEFAULT NULL,
  `LAYOUT_GROUP` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`FORM_LAYOUT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_dict_tree_layout`
--

LOCK TABLES `abdf_dict_tree_layout` WRITE;
/*!40000 ALTER TABLE `abdf_dict_tree_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_dict_tree_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_dict_tree_type`
--

DROP TABLE IF EXISTS `abdf_dict_tree_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_dict_tree_type` (
  `TREE_TYPE_ID` varchar(32) NOT NULL,
  `TREE_TYPE_NAME` varchar(32) DEFAULT NULL,
  `TREE_TYPE_CODE` varchar(32) DEFAULT NULL,
  `MODEL_CLASS` varchar(320) DEFAULT NULL,
  `TREE_STYLE` varchar(32) DEFAULT NULL,
  `IMPORT_JS` varchar(32) DEFAULT NULL,
  `DEL_MODE` varchar(22) DEFAULT NULL,
  `EXT_CHECK_METHOD` varchar(32) DEFAULT NULL,
  `FORM_ID` varchar(32) DEFAULT NULL,
  `MODULE_CODE` varchar(32) DEFAULT NULL,
  `DELETE_EXT` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`TREE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_dict_tree_type`
--

LOCK TABLES `abdf_dict_tree_type` WRITE;
/*!40000 ALTER TABLE `abdf_dict_tree_type` DISABLE KEYS */;
INSERT INTO `abdf_dict_tree_type` VALUES ('402881e51d620945011d628d5f8a000e','图书分类','OA_BOOK_TYPE','com.fe.bsp.oa.model.BookType','sync',NULL,'logicDel',NULL,'bookType','OA','BookTypeDeleteDAO'),('ff8080811759ee75011759f015230001','树型DEMO1(无扩展属性)','DEMO_TREE_1','com.fe.bsp.core.demo.model.DemoTree1','sync',NULL,'logicDel',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `abdf_dict_tree_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_dict_type`
--

DROP TABLE IF EXISTS `abdf_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_dict_type` (
  `DICT_TYPE_ID` varchar(32) NOT NULL,
  `DICT_TYPE_NAME` varchar(32) NOT NULL,
  `DICT_TYPE_CODE` varchar(32) NOT NULL,
  `MODULE_NAME` varchar(128) NOT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`DICT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_dict_type`
--

LOCK TABLES `abdf_dict_type` WRITE;
/*!40000 ALTER TABLE `abdf_dict_type` DISABLE KEYS */;
INSERT INTO `abdf_dict_type` VALUES ('402881e51d5c149a011d5c5ed0680024','出版社','OA_pub_com','基础数据','402828701604fcd401160501e13a0002'),('402881ef19766f7601197678031d0001','按钮所处理位置','buttonPositions','工作流','402828701604fcd401160501e13a0002'),('4028888220d781970120d7826cab0001','是否','abdf_yesno','abdf','402828701604fcd401160501e13a0002'),('ff8080811801f4fc011802057cc90001','性别','sex','公用','402828701604fcd401160501e13a0002');
/*!40000 ALTER TABLE `abdf_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_favorite`
--

DROP TABLE IF EXISTS `abdf_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_favorite` (
  `FAVORITE_ID` varchar(32) NOT NULL,
  `FAVORITE_NAME` varchar(320) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `ORG_NAME` varchar(32) DEFAULT NULL,
  `ALL_PARENT_ID` varchar(340) DEFAULT NULL,
  `ALL_PARENT_NAME` varchar(600) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`FAVORITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_favorite`
--

LOCK TABLES `abdf_favorite` WRITE;
/*!40000 ALTER TABLE `abdf_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_favorite_item`
--

DROP TABLE IF EXISTS `abdf_favorite_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_favorite_item` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(320) DEFAULT NULL,
  `FAVORITE_ID` varchar(32) DEFAULT NULL,
  `URL` varchar(620) DEFAULT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `ORG_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ABDF_FAV_REFERENCE_ABDF_FAV` (`FAVORITE_ID`),
  CONSTRAINT `FK_ABDF_FAV_REFERENCE_ABDF_FAV` FOREIGN KEY (`FAVORITE_ID`) REFERENCES `abdf_favorite` (`FAVORITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_favorite_item`
--

LOCK TABLES `abdf_favorite_item` WRITE;
/*!40000 ALTER TABLE `abdf_favorite_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_favorite_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_form_layout`
--

DROP TABLE IF EXISTS `abdf_form_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_form_layout` (
  `FORM_LAYOUT_ID` varchar(32) NOT NULL,
  `PROPERTY_NAME` varchar(32) DEFAULT NULL,
  `PROPERTY_DES` varchar(32) DEFAULT NULL,
  `INPUT_TYPE` varchar(32) DEFAULT NULL,
  `INPUT_KEY` varchar(32) DEFAULT NULL,
  `COLS` decimal(10,0) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `PROPERTY_DATA_TYPE` varchar(32) DEFAULT NULL,
  `LAYOUT_GROUP` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`FORM_LAYOUT_ID`),
  KEY `FK_ABDF_DIC_REF6_ABDF_DIC` (`PARENT_ID`),
  CONSTRAINT `FK_ABDF_DIC_REF6_ABDF_DIC` FOREIGN KEY (`PARENT_ID`) REFERENCES `abdf_dict_tree_type` (`TREE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_form_layout`
--

LOCK TABLES `abdf_form_layout` WRITE;
/*!40000 ALTER TABLE `abdf_form_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_form_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_information`
--

DROP TABLE IF EXISTS `abdf_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_information` (
  `INFO_ID` varchar(32) NOT NULL,
  `INFO_TYPE` varchar(6) DEFAULT NULL,
  `INFO_TITLE` varchar(600) DEFAULT NULL,
  `HTML_CONTENT` varchar(4000) DEFAULT NULL,
  `INFO_STATUS` varchar(10) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `CREATE_ORG_ID` varchar(32) DEFAULT NULL,
  `CREATE_ORG_NAME` varchar(32) DEFAULT NULL,
  `ABLED_DATE` date DEFAULT NULL,
  `DISABLED_DATE` date DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_information`
--

LOCK TABLES `abdf_information` WRITE;
/*!40000 ALTER TABLE `abdf_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_message_accept`
--

DROP TABLE IF EXISTS `abdf_message_accept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_message_accept` (
  `ID` varchar(32) NOT NULL,
  `SEND_ID` varchar(32) DEFAULT NULL,
  `OWNER_ID` varchar(32) DEFAULT NULL,
  `OWNER_NAME` varchar(32) DEFAULT NULL,
  `FOLDER_TYPE` varchar(10) DEFAULT NULL,
  `FOLDER_IDS` varchar(340) DEFAULT NULL,
  `ACCEPT_TIME` date DEFAULT NULL,
  `READ_FLAG` varchar(10) DEFAULT NULL,
  `READ_TIME` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_message_accept`
--

LOCK TABLES `abdf_message_accept` WRITE;
/*!40000 ALTER TABLE `abdf_message_accept` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_message_accept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_message_folder`
--

DROP TABLE IF EXISTS `abdf_message_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_message_folder` (
  `FOLDER_ID` varchar(32) NOT NULL,
  `FOLDER_NAME` varchar(320) DEFAULT NULL,
  `SYSTEM_IN` varchar(32) DEFAULT NULL,
  `FOLDER_TYPE` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ALLOW_SUB_FOLDER` varchar(2) DEFAULT NULL,
  `PUT_ORG_IDS` varchar(320) DEFAULT NULL,
  `PUT_ORG_NAMES` varchar(620) DEFAULT NULL,
  `PARENT_IDS` varchar(320) DEFAULT NULL,
  `PARENT_NAMES` varchar(620) DEFAULT NULL,
  `OWNER_ID` varchar(32) DEFAULT NULL,
  `OWNER_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FOLDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_message_folder`
--

LOCK TABLES `abdf_message_folder` WRITE;
/*!40000 ALTER TABLE `abdf_message_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_message_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_message_send`
--

DROP TABLE IF EXISTS `abdf_message_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_message_send` (
  `ID` varchar(32) NOT NULL,
  `SEND_ORG_ID` varchar(32) DEFAULT NULL,
  `SEND_ORG_NAME` varchar(32) DEFAULT NULL,
  `ACCEPT_ORG_IDS` varchar(320) DEFAULT NULL,
  `ACCEPT_ORG_NAMES` varchar(620) DEFAULT NULL,
  `ACCEPT_ORG_TYPES` varchar(320) DEFAULT NULL,
  `IS_SEND` varchar(32) DEFAULT NULL,
  `FOLDER_TYPE` varchar(32) DEFAULT NULL,
  `FOLDER_ID` varchar(32) DEFAULT NULL,
  `HTML_CONTENT` varchar(4000) DEFAULT NULL,
  `IS_DELETE` varchar(32) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `HTML_TITLE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_message_send`
--

LOCK TABLES `abdf_message_send` WRITE;
/*!40000 ALTER TABLE `abdf_message_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_message_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_online_helper`
--

DROP TABLE IF EXISTS `abdf_online_helper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_online_helper` (
  `ONLINE_HELPER_ID` varchar(32) NOT NULL,
  `ONLINE_HELPER_NAME` varchar(320) DEFAULT NULL,
  `ONLINE_HELPER_CODE` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ALL_PARENT_ID` varchar(320) DEFAULT NULL,
  `ALL_PARENT_NAME` varchar(640) DEFAULT NULL,
  `HTML_CONTENT` varchar(2000) DEFAULT NULL,
  `ORDER_SHOW` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ONLINE_HELPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_online_helper`
--

LOCK TABLES `abdf_online_helper` WRITE;
/*!40000 ALTER TABLE `abdf_online_helper` DISABLE KEYS */;
INSERT INTO `abdf_online_helper` VALUES ('ff80808126a75e580126a76f2c3d0036','用户管理','YHGL','','','','','0');
/*!40000 ALTER TABLE `abdf_online_helper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_report_files`
--

DROP TABLE IF EXISTS `abdf_report_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_report_files` (
  `ID` varchar(32) NOT NULL,
  `FUN_MODULE_ID` varchar(32) DEFAULT NULL,
  `FILE_NAME` varchar(320) CHARACTER SET utf8 DEFAULT NULL,
  `FUN_CODE` varchar(32) DEFAULT NULL,
  `MEMO` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_report_files`
--

LOCK TABLES `abdf_report_files` WRITE;
/*!40000 ALTER TABLE `abdf_report_files` DISABLE KEYS */;
INSERT INTO `abdf_report_files` VALUES ('ff80808127de0cd30127de0d47c10001','ff808081275ab3c001275b6810ed02db','cash_account.jasper','cash_account','');
/*!40000 ALTER TABLE `abdf_report_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_report_query_para`
--

DROP TABLE IF EXISTS `abdf_report_query_para`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_report_query_para` (
  `ID` varchar(32) NOT NULL,
  `FUN_MODULE_ID` varchar(32) NOT NULL,
  `PARA_KEY` varchar(32) NOT NULL,
  `INPUT_TYPE` varchar(32) NOT NULL,
  `DICT_TYPE_CODE` varchar(32) DEFAULT NULL,
  `NOT_NULL` varchar(32) NOT NULL,
  `NAME` varchar(45) CHARACTER SET utf8 NOT NULL,
  `PARA_COL` varchar(45) NOT NULL,
  `DATA_TYPE` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_report_query_para`
--

LOCK TABLES `abdf_report_query_para` WRITE;
/*!40000 ALTER TABLE `abdf_report_query_para` DISABLE KEYS */;
INSERT INTO `abdf_report_query_para` VALUES ('hhhhh','ff808081275ab3c001275b6810ed02db','FUN_MODULE_NAME','text',NULL,'Y','功能名称','FUN_MODULE_NAME','string');
/*!40000 ALTER TABLE `abdf_report_query_para` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_subassembly`
--

DROP TABLE IF EXISTS `abdf_subassembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_subassembly` (
  `SUBASSEMBLY_ID` varchar(32) NOT NULL,
  `SUBASSEMBLY_NAME` varchar(100) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `TABLE_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SUBASSEMBLY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_subassembly`
--

LOCK TABLES `abdf_subassembly` WRITE;
/*!40000 ALTER TABLE `abdf_subassembly` DISABLE KEYS */;
INSERT INTO `abdf_subassembly` VALUES ('ff808081170cfbc801170cfd95f30001',NULL,NULL,'ABDF_DICT'),('ff808081170d0d0801170d0e5b0b0001',NULL,NULL,'ABDF_DICT'),('ff808081170d111701170d1261800001',NULL,NULL,'ABDF_DICT'),('ff808081170d111701170d134be00008',NULL,NULL,'ABDF_DICT'),('ff808081170d111701170d16428a000f',NULL,NULL,'ABDF_DICT');
/*!40000 ALTER TABLE `abdf_subassembly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_subassembly_field`
--

DROP TABLE IF EXISTS `abdf_subassembly_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_subassembly_field` (
  `FIELD_ID` varchar(32) NOT NULL,
  `FIELD_DES` varchar(100) DEFAULT NULL,
  `DATA_FIELD_NAME` varchar(100) DEFAULT NULL,
  `WEB_INPUT_NAME` varchar(100) DEFAULT NULL,
  `WEB_INPUT` varchar(20) DEFAULT NULL,
  `DICT_TYPE_CODE` varchar(100) DEFAULT NULL,
  `SUBASSEMBLY_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  KEY `FK_ABDF_SUB_REFERENCE_ABDF_SUB` (`SUBASSEMBLY_ID`),
  CONSTRAINT `FK_ABDF_SUB_REFERENCE_ABDF_SUB` FOREIGN KEY (`SUBASSEMBLY_ID`) REFERENCES `abdf_subassembly` (`SUBASSEMBLY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_subassembly_field`
--

LOCK TABLES `abdf_subassembly_field` WRITE;
/*!40000 ALTER TABLE `abdf_subassembly_field` DISABLE KEYS */;
INSERT INTO `abdf_subassembly_field` VALUES ('ff808081170cfbc801170cfd96130002',NULL,'DICT_ID','dictId',NULL,NULL,NULL),('ff808081170cfbc801170cfd96130003',NULL,'DICT_TYPE_ID','dictTypeId',NULL,NULL,NULL),('ff808081170cfbc801170cfd96130004',NULL,'DICT_VALUE','dictValue',NULL,NULL,NULL),('ff808081170cfbc801170cfd96130005',NULL,'DICT_DES','dictDes',NULL,NULL,NULL),('ff808081170cfbc801170cfd96130006',NULL,'IS_USE','isUse',NULL,NULL,NULL),('ff808081170cfbc801170cfd96130007',NULL,'ORDER_INDEX','orderIndex',NULL,NULL,NULL),('ff808081170d0d0801170d0e5b1a0002',NULL,'DICT_ID','dictId',NULL,NULL,'ff808081170d0d0801170d0e5b0b0001'),('ff808081170d0d0801170d0e5b1a0003',NULL,'DICT_TYPE_ID','dictTypeId',NULL,NULL,'ff808081170d0d0801170d0e5b0b0001'),('ff808081170d0d0801170d0e5b1a0004',NULL,'DICT_VALUE','dictValue',NULL,NULL,'ff808081170d0d0801170d0e5b0b0001'),('ff808081170d0d0801170d0e5b2a0005',NULL,'DICT_DES','dictDes',NULL,NULL,'ff808081170d0d0801170d0e5b0b0001'),('ff808081170d0d0801170d0e5b2a0006',NULL,'IS_USE','isUse',NULL,NULL,'ff808081170d0d0801170d0e5b0b0001'),('ff808081170d0d0801170d0e5b2a0007',NULL,'ORDER_INDEX','orderIndex',NULL,NULL,'ff808081170d0d0801170d0e5b0b0001'),('ff808081170d111701170d12619f0002',NULL,'DICT_ID','dictId',NULL,NULL,'ff808081170d111701170d1261800001'),('ff808081170d111701170d12619f0003',NULL,'DICT_TYPE_ID','dictTypeId',NULL,NULL,'ff808081170d111701170d1261800001'),('ff808081170d111701170d12619f0004',NULL,'DICT_VALUE','dictValue',NULL,NULL,'ff808081170d111701170d1261800001'),('ff808081170d111701170d12619f0005',NULL,'DICT_DES','dictDes',NULL,NULL,'ff808081170d111701170d1261800001'),('ff808081170d111701170d12619f0006',NULL,'IS_USE','isUse',NULL,NULL,'ff808081170d111701170d1261800001'),('ff808081170d111701170d12619f0007',NULL,'ORDER_INDEX','orderIndex',NULL,NULL,'ff808081170d111701170d1261800001'),('ff808081170d111701170d134be00009',NULL,'DICT_ID','dictId',NULL,NULL,'ff808081170d111701170d134be00008'),('ff808081170d111701170d134be0000a',NULL,'DICT_TYPE_ID','dictTypeId',NULL,NULL,'ff808081170d111701170d134be00008'),('ff808081170d111701170d134be0000b',NULL,'DICT_VALUE','dictValue',NULL,NULL,'ff808081170d111701170d134be00008'),('ff808081170d111701170d134be0000c',NULL,'DICT_DES','dictDes',NULL,NULL,'ff808081170d111701170d134be00008'),('ff808081170d111701170d134bef000d',NULL,'IS_USE','isUse',NULL,NULL,'ff808081170d111701170d134be00008'),('ff808081170d111701170d134bef000e',NULL,'ORDER_INDEX','orderIndex',NULL,NULL,'ff808081170d111701170d134be00008'),('ff808081170d111701170d16428a0010',NULL,'DICT_ID','dictId',NULL,NULL,'ff808081170d111701170d16428a000f'),('ff808081170d111701170d16428a0011',NULL,'DICT_TYPE_ID','dictTypeId',NULL,NULL,'ff808081170d111701170d16428a000f'),('ff808081170d111701170d16428a0012',NULL,'DICT_VALUE','dictValue',NULL,NULL,'ff808081170d111701170d16428a000f'),('ff808081170d111701170d16428a0013',NULL,'DICT_DES','dictDes',NULL,NULL,'ff808081170d111701170d16428a000f'),('ff808081170d111701170d16428a0014',NULL,'IS_USE','isUse',NULL,NULL,'ff808081170d111701170d16428a000f'),('ff808081170d111701170d16428a0015',NULL,'ORDER_INDEX','orderIndex',NULL,NULL,'ff808081170d111701170d16428a000f');
/*!40000 ALTER TABLE `abdf_subassembly_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_system_conf`
--

DROP TABLE IF EXISTS `abdf_system_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_system_conf` (
  `KEY` varchar(50) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `MEMO` varchar(255) DEFAULT NULL,
  `GROUP_NAME` varchar(50) DEFAULT NULL,
  `INPUT_TYPE` varchar(50) DEFAULT NULL,
  `DICT_TYPE_CODE` varchar(50) DEFAULT NULL,
  `DICT_TYPE_VALUE_TYPE` varchar(10) DEFAULT NULL,
  `SYSTEM_IN` varchar(10) DEFAULT NULL,
  `NOT_NULL` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_system_conf`
--

LOCK TABLES `abdf_system_conf` WRITE;
/*!40000 ALTER TABLE `abdf_system_conf` DISABLE KEYS */;
INSERT INTO `abdf_system_conf` VALUES ('AppCode','GXUNION_PROJECT','应用编号','系统参数','text',NULL,NULL,'Y','Y'),('ATTACH_PATH','C:/abdf/attach','附件存放','系统参数','text',NULL,NULL,'N','Y'),('ComId','402828701604fcd401160501e13a0002','公司id','系统参数','text',NULL,NULL,'Y','Y'),('mail.server.host','smtp.sohu.com','主机地址','邮件服务器信息','text',NULL,NULL,'Y','Y'),('mail.server.port','25','端口号','邮件服务器信息','text',NULL,NULL,'N','Y'),('mail.server.smtp.auth','Y','是否需要认证','邮件服务器信息','radio','abdf_yesno','code','N','Y'),('mail.server.smtp.password','123456','密码','邮件服务器信息','text',NULL,NULL,'N','Y'),('mail.server.smtp.username','gxunion','登录名','邮件服务器信息','text',NULL,NULL,'N','N'),('mail.template.file.path','/WEB-INF/ftl/gg','邮件模板路径','邮件模板路径','text',NULL,NULL,'N','Y'),('report.template.path','E:/workspace/gdms/WebContent/ireport/','报表模板路径','系统参数','text',NULL,NULL,'Y','N'),('startupCoopCache','N','启动协同区缓存','缓存管理','radio','abdf_yesno','code','N','Y');
/*!40000 ALTER TABLE `abdf_system_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abdf_url_log`
--

DROP TABLE IF EXISTS `abdf_url_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abdf_url_log` (
  `ID` varchar(32) NOT NULL,
  `URL` varchar(320) DEFAULT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  `TIME_LONG` int(11) DEFAULT NULL,
  `LOG_TIME` date DEFAULT NULL,
  `COMMIT_METHOD` varchar(6) DEFAULT NULL,
  `COMMIT_DATA` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abdf_url_log`
--

LOCK TABLES `abdf_url_log` WRITE;
/*!40000 ALTER TABLE `abdf_url_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `abdf_url_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_tree_1`
--

DROP TABLE IF EXISTS `demo_tree_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_tree_1` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ALL_PARENT_ID` varchar(320) DEFAULT NULL,
  `ALL_PARENT_NAME` varchar(320) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_tree_1`
--

LOCK TABLES `demo_tree_1` WRITE;
/*!40000 ALTER TABLE `demo_tree_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `demo_tree_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gxunion_base_station`
--

DROP TABLE IF EXISTS `gxunion_base_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gxunion_base_station` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NORTH_LATITUDE` decimal(10,4) DEFAULT NULL,
  `EAST_LONGITUDE` decimal(10,4) DEFAULT NULL,
  `CREATE_ORG_ID` varchar(32) DEFAULT NULL,
  `CREATE_ORG_NAME` varchar(50) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `UPDATE_ORG_ID` varchar(32) DEFAULT NULL,
  `UPDATE_ORG_NAME` varchar(50) DEFAULT NULL,
  `UPDATE_TIME` date DEFAULT NULL,
  `STATUS` varchar(5) DEFAULT NULL,
  `MEMO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gxunion_base_station`
--

LOCK TABLES `gxunion_base_station` WRITE;
/*!40000 ALTER TABLE `gxunion_base_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `gxunion_base_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gxunion_simple_materials`
--

DROP TABLE IF EXISTS `gxunion_simple_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gxunion_simple_materials` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `INVENTORY` decimal(10,2) DEFAULT NULL,
  `PRINCIPAL_EMAIL` varchar(50) DEFAULT NULL,
  `WARNING_MIN_VALUE` decimal(10,2) DEFAULT NULL,
  `STATUS` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gxunion_simple_materials`
--

LOCK TABLES `gxunion_simple_materials` WRITE;
/*!40000 ALTER TABLE `gxunion_simple_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `gxunion_simple_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_book_type`
--

DROP TABLE IF EXISTS `oa_book_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_book_type` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ALL_PARENT_ID` varchar(640) DEFAULT NULL,
  `ALL_PARENT_NAME` varchar(1000) DEFAULT NULL,
  `ORDER_INDEX` float DEFAULT NULL,
  `DELETE_FLAG` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_book_type`
--

LOCK TABLES `oa_book_type` WRITE;
/*!40000 ALTER TABLE `oa_book_type` DISABLE KEYS */;
INSERT INTO `oa_book_type` VALUES ('402881e51d6779df011d677db6af0001','treeDao',NULL,NULL,NULL,12,'Y'),('402881e51d678958011d678aa1d00001','名称12',NULL,NULL,NULL,0,NULL),('402881e51d6790da011d67bd7f1d0001','gfgfg','402881e51d6779df011d677db6af0001','402881e51d6779df011d677db6af0001','treeDao',0,NULL),('402881e51d6790da011d67bdac860002','gfgfgfg','402881e51d6790da011d67bd7f1d0001','402881e51d6779df011d677db6af0001:402881e51d6790da011d67bd7f1d0001','treeDao:gfgfg',0,NULL),('402881e51d67c66b011d67c97f030001','gfdgdfgfdg','402881e51d678958011d678aa1d00001','402881e51d678958011d678aa1d00001','名称12',0,'Y'),('402881e51d67c66b011d67cb91870002','gdfgdfg','402881e51d678958011d678aa1d00001','402881e51d678958011d678aa1d00001','名称12',0,'Y'),('402881e51d71f17d011d7201f0080001','rewrewrewr',NULL,NULL,NULL,0,NULL),('402881e51d7b1689011d7b1b6e310001','gfdgfdg','402881e51d678958011d678aa1d00001','402881e51d678958011d678aa1d00001','名称12',0,'Y');
/*!40000 ALTER TABLE `oa_book_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_process_demo`
--

DROP TABLE IF EXISTS `simple_process_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_process_demo` (
  `SIMPLE_ID` varchar(32) NOT NULL,
  `TEXT_DEMO` varchar(320) DEFAULT NULL,
  `DATE_DEMO` date DEFAULT NULL,
  `SELECT_DEMO` varchar(32) DEFAULT NULL,
  `CHECK_BOX_DEMO` varchar(32) DEFAULT NULL,
  `RADIO_BOX_DEMO` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`SIMPLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_process_demo`
--

LOCK TABLES `simple_process_demo` WRITE;
/*!40000 ALTER TABLE `simple_process_demo` DISABLE KEYS */;
INSERT INTO `simple_process_demo` VALUES ('402881e63a554ae9013a556aecc40001','dgfdg','2012-10-12','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff0118025197250002'),('402881e63a597d59013a5a39a1900004','我的测试1','2012-10-02','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('402881ea289eeba501289eed8ade0001','gfdgfdg','2010-05-05','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('402881fa2cd5fbb0012cd5fd97830001','dfds','2010-12-14','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff0118025197250002'),('ff80808126a75e580126a769f655001f','刘 正 仁 测 试','2010-02-03','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff80808126a75e580126a7a497f10096','再 次 测 试','2010-02-10','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff80808126ffc6c00126ffcef40f0006','yyyy','2010-02-05','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff80808126ffc6c00126ffcfe333000d','ytyty','2010-02-04','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff808081272c6fcc01272c8b780d0014','hhhhhhhh','2010-03-02','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff808081272c6fcc01272c9cab180036','hhhhhhhhhh','2010-03-18','ff808081180243ff01180245e4460001','ff808081180243ff0118025197250002','ff808081180243ff0118025197250002'),('ff808081272e37bf01272e4bed14000a','gfgfgf','2010-03-03','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff80808127d314f30127d31c1f710001','<,>=','2010-04-07','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff808081289c0f8801289c1391660001','我的测试','2010-05-06','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff0118025197250002'),('ff808081289c1b2d01289c1f81300004','再一次测试','2010-05-04','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff808081289c1b2d01289c23fd32000c','hello 并行会签','2010-05-04','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff0118025197250002'),('ff808081289c1b2d01289c29fe8d001c','并行流程','2010-05-05','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001','ff808081180243ff01180245e4460001'),('ff8080812cd952ae012cd95cc0040001','fdg','2010-12-01','ff808081180243ff01180245e4460001',NULL,NULL);
/*!40000 ALTER TABLE `simple_process_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_process_demo_1`
--

DROP TABLE IF EXISTS `simple_process_demo_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_process_demo_1` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `SIMPLE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_process_demo_1`
--

LOCK TABLES `simple_process_demo_1` WRITE;
/*!40000 ALTER TABLE `simple_process_demo_1` DISABLE KEYS */;
INSERT INTO `simple_process_demo_1` VALUES ('402881e5217173bf012171b0150700fb','分支环节测试1','402881e5217173bf012171af4ac200e8'),('402881e521967e420121967f02de000a','分支环节测试1','402881e52194caa2012194cc2723000f'),('ff808081272c6fcc01272c9e1792003f','分支环节测试1','ff808081272c6fcc01272c9cab180036'),('ff808081289c1b2d01289c1c65b70001','分支环节测试1','ff808081289c0f8801289c1391660001'),('ff808081289c314301289c41793b0013','分支环节测试1','ff80808126ffc6c00126ffcfe333000d'),('ff808081289c314301289c4558ee0016','分支环节测试1','ff808081272c6fcc01272c8b780d0014'),('ff8080812cd952ae012cd95cc0140005','分支环节测试1','ff8080812cd952ae012cd95cc0040001');
/*!40000 ALTER TABLE `simple_process_demo_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_process_demo_2`
--

DROP TABLE IF EXISTS `simple_process_demo_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_process_demo_2` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(32) DEFAULT NULL,
  `SIMPLE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_process_demo_2`
--

LOCK TABLES `simple_process_demo_2` WRITE;
/*!40000 ALTER TABLE `simple_process_demo_2` DISABLE KEYS */;
INSERT INTO `simple_process_demo_2` VALUES ('402881e5217173bf012171b0150700fe','分支环节测试2','402881e5217173bf012171af4ac200e8'),('ff80808127002c3b0127002cc1d60002','分支环节测试2','ff80808126a75e580126a7a497f10096');
/*!40000 ALTER TABLE `simple_process_demo_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_app`
--

DROP TABLE IF EXISTS `urss_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_app` (
  `APP_ID` varchar(32) NOT NULL,
  `APP_NAME` varchar(32) NOT NULL,
  `APP_CODE` varchar(32) NOT NULL,
  `COM_ID` varchar(32) NOT NULL,
  `APP_TYPE` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `STATUS` varchar(2) DEFAULT NULL,
  `DESK_URL` varchar(128) DEFAULT NULL,
  `APP_ADDRESS` varchar(128) DEFAULT NULL,
  `APP_MRG` varchar(32) DEFAULT NULL,
  `TURN_ON_MENU` varchar(2) DEFAULT NULL,
  `APP_OUT_ADDRESS` varchar(128) DEFAULT NULL,
  `STARTUP_MENU_CACHE` varchar(2) DEFAULT NULL,
  `IS_DELETE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_app`
--

LOCK TABLES `urss_app` WRITE;
/*!40000 ALTER TABLE `urss_app` DISABLE KEYS */;
INSERT INTO `urss_app` VALUES ('ff80808116d8b9390116d8c47b4a0001','配送系统','GXUNION_PROJECT','402828701604fcd401160501e13a0002',NULL,'0','1',NULL,NULL,NULL,'N',NULL,'N',NULL);
/*!40000 ALTER TABLE `urss_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_app_com`
--

DROP TABLE IF EXISTS `urss_app_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_app_com` (
  `APP_COM_ID` varchar(32) NOT NULL,
  `APP_ID` varchar(32) NOT NULL,
  `COM_ID` varchar(32) NOT NULL,
  `STATUS` varchar(32) NOT NULL,
  `VALID_DATE` date DEFAULT NULL,
  PRIMARY KEY (`APP_COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_app_com`
--

LOCK TABLES `urss_app_com` WRITE;
/*!40000 ALTER TABLE `urss_app_com` DISABLE KEYS */;
/*!40000 ALTER TABLE `urss_app_com` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_app_user`
--

DROP TABLE IF EXISTS `urss_app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_app_user` (
  `APP_USER_ID` varchar(32) NOT NULL,
  `APP_ID` varchar(32) NOT NULL,
  `COM_USER_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`APP_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_app_user`
--

LOCK TABLES `urss_app_user` WRITE;
/*!40000 ALTER TABLE `urss_app_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `urss_app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_com_user`
--

DROP TABLE IF EXISTS `urss_com_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_com_user` (
  `COM_USER_ID` varchar(32) NOT NULL,
  `COM_USER_NAME` varchar(32) NOT NULL,
  `LOGON_ID` varchar(32) NOT NULL,
  `PWD` varchar(32) NOT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  `REG_COM_NAME` varchar(320) DEFAULT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `ORG_NAME` varchar(320) DEFAULT NULL,
  `USER_TYPE` varchar(2) NOT NULL,
  PRIMARY KEY (`COM_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_com_user`
--

LOCK TABLES `urss_com_user` WRITE;
/*!40000 ALTER TABLE `urss_com_user` DISABLE KEYS */;
INSERT INTO `urss_com_user` VALUES ('ff8080811643731301164379f8630002','刘正仁','lzr','5f4dcc3b5aa765d61d8327deb882cf99','402828701604fcd401160501e13a0002','精鹰技术股份有限公司',NULL,NULL,'0');
/*!40000 ALTER TABLE `urss_com_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_coop_area`
--

DROP TABLE IF EXISTS `urss_coop_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_coop_area` (
  `COOP_AREA_ID` varchar(32) NOT NULL,
  `COOP_AREA_NAME` varchar(32) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ALL_PARENT_ID` varchar(320) DEFAULT NULL,
  `COOP_AREA_IMG` varchar(320) DEFAULT NULL,
  `IS_DYNAMIC` varchar(2) DEFAULT NULL,
  `IMPL_INF` varchar(320) DEFAULT NULL,
  `ORDER_SHOW` decimal(10,0) DEFAULT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  `ALL_PARENT_NAME` varchar(320) DEFAULT NULL,
  `COOP_AREA_CODE` varchar(32) DEFAULT NULL,
  `IS_DELETE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`COOP_AREA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_coop_area`
--

LOCK TABLES `urss_coop_area` WRITE;
/*!40000 ALTER TABLE `urss_coop_area` DISABLE KEYS */;
INSERT INTO `urss_coop_area` VALUES ('4028286f162e0df601162e0ebb760001','新建',NULL,NULL,'/bsp/abdf/skins/default/img/coop/add.gif','N',NULL,'1','402828701604fcd401160501e13a0002',NULL,'ADD',NULL),('ff80808116af8af30116af956c190001','更新',NULL,NULL,'/bsp/abdf/skins/default/img/coop/update.gif','N',NULL,'2','402828701604fcd401160501e13a0002',NULL,'UPDATE',NULL),('ff80808116af8af30116af99b3010002','数据列表',NULL,NULL,'/bsp/abdf/skins/default/img/coop/view.png','N',NULL,'3','402828701604fcd401160501e13a0002',NULL,'LIST',NULL),('ff80808116af8af30116af99f0390003','统计报表',NULL,NULL,'/bsp/abdf/skins/default/img/coop/icon-title.gif','N',NULL,'4','402828701604fcd401160501e13a0002',NULL,'STAT',NULL);
/*!40000 ALTER TABLE `urss_coop_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_desk`
--

DROP TABLE IF EXISTS `urss_desk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_desk` (
  `DESK_ID` varchar(32) NOT NULL,
  `DESK_NAME` varchar(32) NOT NULL,
  `INIT_DISPLAY` varchar(2) NOT NULL,
  `APP_ID` varchar(32) NOT NULL,
  `DESK_URL` varchar(32) NOT NULL,
  `ORDER_INDEX` decimal(10,0) NOT NULL,
  `COM_ID` varchar(32) NOT NULL,
  `IS_DELETE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`DESK_ID`),
  KEY `FK_URSS_DES_REFERENCE_URSS_APP` (`APP_ID`),
  CONSTRAINT `FK_URSS_DES_REFERENCE_URSS_APP` FOREIGN KEY (`APP_ID`) REFERENCES `urss_app` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_desk`
--

LOCK TABLES `urss_desk` WRITE;
/*!40000 ALTER TABLE `urss_desk` DISABLE KEYS */;
/*!40000 ALTER TABLE `urss_desk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_function`
--

DROP TABLE IF EXISTS `urss_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_function` (
  `FUN_MODULE_ID` varchar(32) NOT NULL,
  `FUN_MODULE_NAME` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ALL_PARENT_ID` varchar(360) DEFAULT NULL,
  `IS_MENU` varchar(2) DEFAULT NULL,
  `IS_PUBLIC` varchar(2) DEFAULT NULL,
  `IMPL_URL` varchar(320) DEFAULT NULL,
  `SMALL_IMG` varchar(320) DEFAULT NULL,
  `BIG_IMG` varchar(320) DEFAULT NULL,
  `FUN_CODE` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `APP_ID` varchar(32) NOT NULL,
  `WINDOW_STYLE` varchar(2) DEFAULT NULL,
  `ALL_PARENT_NAME` varchar(720) DEFAULT NULL,
  `WINDOW_HEIGHT` decimal(10,0) DEFAULT NULL,
  `WINDOW_WIDTH` decimal(10,0) DEFAULT NULL,
  `FOLD_AREA` varchar(2) DEFAULT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  `IS_DELETE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`FUN_MODULE_ID`),
  KEY `FK_URSS_FUN_REFERENCE_URSS_APP` (`APP_ID`),
  CONSTRAINT `FK_URSS_FUN_REFERENCE_URSS_APP` FOREIGN KEY (`APP_ID`) REFERENCES `urss_app` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_function`
--

LOCK TABLES `urss_function` WRITE;
/*!40000 ALTER TABLE `urss_function` DISABLE KEYS */;
INSERT INTO `urss_function` VALUES ('402881e5201e7ea001201e8047900001','系统管理','','','Y','N','','/bsp/abdf/skins/images/function/13.jpg','','urss_sys_conf','30','ff80808116d8b9390116d8c47b4a0001','I','','0','0','Y',NULL,NULL),('402881e5201e7ea001201e8370a50003','系统参数设置','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','N','/showSystemConf_abdf.do','/gd/images/submemu/z-ctwz.gif','','urss_sys_para','2','ff80808116d8b9390116d8c47b4a0001','I','系统配置','0','0','Y',NULL,NULL),('402881e5201e7ea001201e8b695b0005','类型定义','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','N','/getOrgTypeByComId_urss.do','/gd/images/submemu/z-dnbgl.gif','','urss_org_type','0','ff80808116d8b9390116d8c47b4a0001','I','系统管理','0','0','Y',NULL,NULL),('402881e5201e7ea001201e8be0210006','组织定义','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','N','/forwardOrgFrame_urss.do','/gd/images/submemu/o-sbsz.gif','','urss_org','1','ff80808116d8b9390116d8c47b4a0001','I','系统管理','0','0','Y',NULL,NULL),('402881e5201e7ea001201e8e1e490008','用户定义','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','N','/forwardUserFrame_urss.do','/gd/images/submemu/u-yhsz.gif','','urss_use_mrg','0','ff80808116d8b9390116d8c47b4a0001','I','系统管理','0','0','Y',NULL,NULL),('402881e5201e7ea001201e8e87730009','角色定义','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','N','/forwardRoleFrame_urss.do','/gd/images/submemu/u-jsgl.gif','','urss_role','1','ff80808116d8b9390116d8c47b4a0001','I','系统管理','0','0','Y',NULL,NULL),('402881e5201e7ea001201e923df3000a','角色权限分配','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','N','/forwardRoleRightFrame_urss.do','/gd/images/submemu/t-jlzzpz.gif','','urss_assign_role','2','ff80808116d8b9390116d8c47b4a0001','I','系统管理','0','0','Y',NULL,NULL),('402881e5201e7ea001201e93e4cd000b','用户权限分配','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','N','/forwardUserRightFrame_urss.do','/gd/images/submemu/o-cqzb.gif','','urss_assign_user','3','ff80808116d8b9390116d8c47b4a0001','I','系统管理','0','0','Y',NULL,NULL),('402881e5201e7ea001201e9456d1000c','工作流管理',NULL,NULL,'Y','N',NULL,'/bsp/abdf/skins/images/function/24.jpg',NULL,'wfss_mrg','25','ff80808116d8b9390116d8c47b4a0001','I',NULL,'0','0','Y',NULL,NULL),('402881e5201e7ea001201e950428000d','业务表单配置','402881e5201e7ea001201e9456d1000c','402881e5201e7ea001201e9456d1000c','Y','N','/forwardAppFormFrame_wfss.do','/gd/images/submemu/o-zzff.gif','','wfss_form_mrg','0','ff80808116d8b9390116d8c47b4a0001','I','工作流管理','0','0','Y',NULL,NULL),('402881e5201e7ea001201e95b6fd000e','流程定义','402881e5201e7ea001201e9456d1000c','402881e5201e7ea001201e9456d1000c','Y','N','/queryPageProcess_wfss.do','/gd/images/submemu/icon_zjlhgl.gif','','wfss_process_mrg','1','ff80808116d8b9390116d8c47b4a0001','I','工作流管理','0','0','Y',NULL,NULL),('402881e5201e7ea001201e96a313000f','功能/资源定义','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','N','/forwardFunctionFrame_urss.do','/gd/images/submemu/s-xfxmgg.gif','','urss_function','-1','ff80808116d8b9390116d8c47b4a0001','I','系统配置','0','0','Y',NULL,NULL),('402881e520241cb10120243af71f0007','我的已办','402881ee20240f7601202437000b0005','402881ee20240f7601202437000b0005','Y','Y','/listWorkItemDoen_wfss.do','/gd/images/submemu/j-zhhgq.gif','','worked','0','ff80808116d8b9390116d8c47b4a0001','I','协同办公','0','0','Y',NULL,NULL),('402881e520241cb10120243b61040008','我的待办','402881ee20240f7601202437000b0005','402881ee20240f7601202437000b0005','Y','Y','/listWorkItemDoing_wfss.do','/gd/images/submemu/j-dnb.gif','','my_create','0','ff80808116d8b9390116d8c47b4a0001','I','协同办公','0','0','Y',NULL,NULL),('402881e520cdb92a0120cdbdb12b0001','流程辅助按钮定义','402881e5201e7ea001201e9456d1000c','402881e5201e7ea001201e9456d1000c','Y','N','/listButton_wfss.do','/gd/images/submemu/z-dyechlgl.gif','','wfss_button','0','ff80808116d8b9390116d8c47b4a0001','I','工作流管理','0','0','Y',NULL,NULL),('402881e5217173bf01217175a3ba000c','流程版本管理','402881e5201e7ea001201e9456d1000c','402881e5201e7ea001201e9456d1000c','Y','N','/listProcessEdition_wfss.do','/gd/images/submemu/s-cpsz.gif','','wfss_process_edition','0','ff80808116d8b9390116d8c47b4a0001','I','工作流管理','0','0','Y',NULL,NULL),('402881e5217173bf0121717772110018','代理人设置','402881e5201e7ea001201e9456d1000c','402881e5201e7ea001201e9456d1000c','Y','N','/showAgent_wfss.do','/gd/images/submemu/d-hylbsz.gif','','wfss_process_agent','0','ff80808116d8b9390116d8c47b4a0001','I','工作流管理','0','0','Y',NULL,NULL),('402881ee20240f7601202437000b0005','个人事项','','','Y','Y','/bsp/abdf/demo/1.jsp','/bsp/abdf/skins/images/function/30.jpg','','GXUNION_office','-5','ff80808116d8b9390116d8c47b4a0001','I','','0','0','Y',NULL,NULL),('402881f0203e097001203e13de7d0001','修改密码','402881ee20240f7601202437000b0005','402881ee20240f7601202437000b0005','Y','Y','/forwardPwdEdit_urss.do','/gd/images/submemu/s-yqcs.gif','','urss_modify_pwd','0','ff80808116d8b9390116d8c47b4a0001','I','协同办公','0','0','Y',NULL,NULL),('8a90247317b485ec0117b48838360001','流程DEMO','ff8080811759435c0117596aa0b50002','ff8080811759435c0117596aa0b50002','Y','N','/forwardFlowDemoList_demo.do','/gd/images/submemu/s-xfsmdw.gif','','FLOW_DEMO','1','ff80808116d8b9390116d8c47b4a0001','I','DEMO','0','0','N',NULL,NULL),('ff80808116fddc9d0116fde90d620001','数据字典类型','ff80808117010a2f0117011870070001','ff8080811759435c011759487a470001:ff80808116fddc9d0116fde90d620001:ff80808117010a2f0117011870070001:ff80808116fddc9d0116fde90d620001:ff80808117010a2f0117011870070001','Y','N','/forwardDictFrame_abdf.do','/bsp/abdf/skins/images/function/33.jpg',NULL,NULL,'-1','ff80808116d8b9390116d8c47b4a0001','I','开发管理:数据字典类型:平面数据字典类型:数据字典类型:平面数据字典类型','0','0','N',NULL,NULL),('ff80808117010a2f0117011870070001','平面数据字典类型','ff80808116fddc9d0116fde90d620001','ff8080811759435c011759487a470001:ff80808116fddc9d0116fde90d620001:ff80808117010a2f0117011870070001:ff80808116fddc9d0116fde90d620001:ff80808117010a2f0117011870070001:ff80808116fddc9d0116fde90d620001','Y','N','/forwardDictTypeFrame_abdf.do','/bsp/abdf/skins/images/function/36.jpg',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','I','开发管理:数据字典类型:平面数据字典类型:数据字典类型:平面数据字典类型:数据字典类型','0','0','N',NULL,NULL),('ff80808117010a2f01170118d3170002','树型数据字典类型','ff80808116fddc9d0116fde90d620001','ff8080811759435c011759487a470001:ff80808116fddc9d0116fde90d620001:ff80808117010a2f0117011870070001:ff80808116fddc9d0116fde90d620001:ff80808117010a2f0117011870070001:ff80808116fddc9d0116fde90d620001','Y','N','/listDictTypeTree_abdf.do','/bsp/abdf/skins/images/function/37.jpg',NULL,NULL,'2','ff80808116d8b9390116d8c47b4a0001','I','开发管理:数据字典类型:平面数据字典类型:数据字典类型:平面数据字典类型:数据字典类型','0','0','N',NULL,NULL),('ff8080811759435c0117596aa0b50002','DEMO',NULL,NULL,'Y','N',NULL,'/bsp/abdf/skins/images/function/8.jpg',NULL,NULL,'35','ff80808116d8b9390116d8c47b4a0001','I',NULL,'0','0','Y',NULL,NULL),('ff808081274d1b7f01274d29cd140019','报表管理','','','Y','N','','','','report_mrg','20','ff80808116d8b9390116d8c47b4a0001','I','','0','0','Y',NULL,NULL),('ff808081274d1b7f01274d2a8d5f001f','毛利报表','ff808081274d1b7f01274d29cd140019','ff808081274d1b7f01274d29cd140019','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/o-fkfs.gif','','cash_report','0','ff80808116d8b9390116d8c47b4a0001','I','报表管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275ad2e58b0047','基础数据管理','','','Y','N','','','','base_data_mrg','0','ff80808116d8b9390116d8c47b4a0001','I','','0','0','Y',NULL,NULL),('ff808081275ab3c001275ad4f654004d','车辆管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/z-qtsbgl.gif','','cart_mrg','0','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275af5c35900ab','结算方式管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/z-dlhdgql.gif','','moeny_mrg','1','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b00a07600e7','客户分类','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/d-hylbsz.gif','','customer_type','2','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b09eaff0117','客户管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/d-hysz.gif','','customer_mrg','3','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b1cf2a1017a','供应商分类','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/u-bmsz.gif','','provider_type','4','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b24f78301a3','供应商管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/x-dnb.gif','','provider_mrg','0','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b2a2b9f01bc','商品单位管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/r-ryqzjl.gif','','unit_mrg','6','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b32ee7e01d4','功能码管理','402881e5201e7ea001201e8047900001','402881e5201e7ea001201e8047900001','Y','Y','/gd/images/submemu/doing.gif','/gd/images/submemu/icon_zjlhgl.gif','','fun_m_mrg','0','ff80808116d8b9390116d8c47b4a0001','I','系统管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b3599a001df','帐套管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/o-fyyxsy.gif','','account_mrg','7','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b3a840301fc','商品分类','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/f-fqgl.gif','','product_type','8','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b3e835a0212','商品管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/s-dxdnb.gif','','product_mrg','9','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b46988d023b','现金报表','ff808081274d1b7f01274d29cd140019','ff808081274d1b7f01274d29cd140019','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/z-xffs.gif','','cash_report','1','ff80808116d8b9390116d8c47b4a0001','I','报表管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b496530024a','应收款报表','ff808081274d1b7f01274d29cd140019','ff808081274d1b7f01274d29cd140019','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/x-dyhgq.gif','','return_money','2','ff80808116d8b9390116d8c47b4a0001','I','报表管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b4c37ef025f','应付款报表','ff808081274d1b7f01274d29cd140019','ff808081274d1b7f01274d29cd140019','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/x-dlhgqjy.gif','','give_money','3','ff80808116d8b9390116d8c47b4a0001','I','报表管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b51655d0289','采购单报表','ff808081274d1b7f01274d29cd140019','ff808081274d1b7f01274d29cd140019','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/s-bzcf.gif','','buy_report','4','ff80808116d8b9390116d8c47b4a0001','I','报表管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b54b76c0292','配送单报表','ff808081274d1b7f01274d29cd140019','ff808081274d1b7f01274d29cd140019','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/s-bzwd.gif','','send_report','5','ff80808116d8b9390116d8c47b4a0001','I','报表管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b5af90202ba','退货清单报表','ff808081274d1b7f01274d29cd140019','ff808081274d1b7f01274d29cd140019','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/z-dyechlgl.gif','','','6','ff80808116d8b9390116d8c47b4a0001','I','报表管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b5e902702c3','订单下单报表','ff808081274d1b7f01274d29cd140019','ff808081274d1b7f01274d29cd140019','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/u-qqgl.gif','','order_report','7','ff80808116d8b9390116d8c47b4a0001','I','报表管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b65f7f902d7','资金管理','','','Y','N','','','','cash_momey_mrg','10','ff80808116d8b9390116d8c47b4a0001','I','','0','0','Y',NULL,NULL),('ff808081275ab3c001275b6810ed02db','现金帐户管理','ff808081275ab3c001275b65f7f902d7','ff808081275ab3c001275b65f7f902d7','Y','N','/getReportPage_abdf.do?fun_code=cash_account','/gd/images/submemu/o-fyyxsy.gif','','cash_account','0','ff80808116d8b9390116d8c47b4a0001','I','资金管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b6e10c902e9','应付帐户管理','ff808081275ab3c001275b65f7f902d7','ff808081275ab3c001275b65f7f902d7','Y','N','/getReportPage_abdf.do?fun_code=retrun_account_mrg','/gd/images/submemu/z-dyhgqgl.gif','','retrun_account_mrg','1','ff80808116d8b9390116d8c47b4a0001','I','资金管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b709e0802f4','应收帐户管理','ff808081275ab3c001275b65f7f902d7','ff808081275ab3c001275b65f7f902d7','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/z-dyechlgl.gif','','','2','ff80808116d8b9390116d8c47b4a0001','I','资金管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b72ecff02ff','仓库管理','','','Y','N','','','','wh_mrg','15','ff80808116d8b9390116d8c47b4a0001','I','','0','0','Y',NULL,NULL),('ff808081275ab3c001275b73e7ae0303','仓库资料管理','ff808081275ab3c001275b72ecff02ff','ff808081275ab3c001275b72ecff02ff','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/d-flfg.gif','','','0','ff80808116d8b9390116d8c47b4a0001','I','仓库管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b78a2230321','出库单管理','ff808081275ab3c001275b72ecff02ff','ff808081275ab3c001275b72ecff02ff','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/f-fyghjl.gif','','out_wh','1','ff80808116d8b9390116d8c47b4a0001','I','仓库管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b7c24750334','入库单管理','ff808081275ab3c001275b72ecff02ff','ff808081275ab3c001275b72ecff02ff','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/t-pxqk.gif','','','2','ff80808116d8b9390116d8c47b4a0001','I','仓库管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b7f689e034a','盘点清单','ff808081275ab3c001275b72ecff02ff','ff808081275ab3c001275b72ecff02ff','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/j-ecyj.gif','','','3','ff80808116d8b9390116d8c47b4a0001','I','仓库管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b817b560353','商品预警管理','ff808081275ab3c001275b72ecff02ff','ff808081275ab3c001275b72ecff02ff','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/j-zhhgq.gif','','','4','ff80808116d8b9390116d8c47b4a0001','I','仓库管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b84c2f6036d','业务管理','','','Y','N','','/gd/images/submemu/doing.gif','','bus_mrg','5','ff80808116d8b9390116d8c47b4a0001','I','','0','0','Y',NULL,NULL),('ff808081275ab3c001275b857a9d0371','订单管理','ff808081275ab3c001275b84c2f6036d','ff808081275ab3c001275b84c2f6036d','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/o-tsxq.gif','','order_mrg','0','ff80808116d8b9390116d8c47b4a0001','I','业务管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b8914180386','配送单管理','ff808081275ab3c001275b84c2f6036d','ff808081275ab3c001275b84c2f6036d','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/s-cpxmsz.gif','','','1','ff80808116d8b9390116d8c47b4a0001','I','业务管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b8d104b0395','采购计划单管理','ff808081275ab3c001275b84c2f6036d','ff808081275ab3c001275b84c2f6036d','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/o-sbgl.gif','','','2','ff80808116d8b9390116d8c47b4a0001','I','业务管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b8fad6b03a4','采购单管理','ff808081275ab3c001275b84c2f6036d','ff808081275ab3c001275b84c2f6036d','Y','N','/gd/images/submemu/doing.gif','/gd/images/submemu/t-jlzzpz.gif','','','3','ff80808116d8b9390116d8c47b4a0001','I','业务管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b98080003be','配送人员管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','Y','/gd/images/submemu/doing.gif','/gd/images/submemu/u-jsgl.gif','','','10','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b99086603c2','采购人员管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','Y','/gd/images/submemu/doing.gif','/gd/images/submemu/o-cqzb.gif','','','11','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL),('ff808081275ab3c001275b99c6f203c6','订单模块管理','ff808081275ab3c001275ad2e58b0047','ff808081275ab3c001275ad2e58b0047','Y','Y','/gd/images/submemu/doing.gif','/gd/images/submemu/f-fylyjl.gif','','','12','ff80808116d8b9390116d8c47b4a0001','I','基础数据管理','0','0','Y',NULL,NULL);
/*!40000 ALTER TABLE `urss_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_org_tree`
--

DROP TABLE IF EXISTS `urss_org_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_org_tree` (
  `ORG_ID` varchar(32) NOT NULL,
  `ORG_NAME` varchar(60) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ORG_TYPE_CODE` varchar(32) NOT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `ALL_PARENT_ID` varchar(350) DEFAULT NULL,
  `ORG_CODE` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `ALL_PARENT_NAME` varchar(1000) DEFAULT NULL,
  `ALL_PARENT_CODE` varchar(32) DEFAULT NULL,
  `QUERY_CODE` varchar(32) DEFAULT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_org_tree`
--

LOCK TABLES `urss_org_tree` WRITE;
/*!40000 ALTER TABLE `urss_org_tree` DISABLE KEYS */;
INSERT INTO `urss_org_tree` VALUES ('0F7E0CE47906DE28288FBD9379F4690A','技术部','402828701604fcd401160501e13a0002','BM','0','402828701604fcd401160501e13a0002','',NULL,'上海佑哲信息科技有限公司','GS','JSB','402828701604fcd401160501e13a0002'),('2551C200700BA543BBF3F9445F80C098','周旭顺','0F7E0CE47906DE28288FBD9379F4690A','YG','0','402828701604fcd401160501e13a0002:0F7E0CE47906DE28288FBD9379F4690A',NULL,'402881e51d3e2ac2011d3e33137e0004','上海佑哲信息科技有限公司:技术部','GS:BM','ZXS','402828701604fcd401160501e13a0002'),('402828701604fcd401160501e13a0002','上海佑哲信息科技有限公司',NULL,'GS','0',NULL,'FE',NULL,NULL,NULL,'JYJSGFYXGS','402828701604fcd401160501e13a0002'),('46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','6C89FB00F2E415D61662A478E849F5CD','YG','0','402828701604fcd401160501e13a0002:6C89FB00F2E415D61662A478E849F5CD','',NULL,'上海佑哲信息科技有限公司:财物部','GS:BM','LZR','402828701604fcd401160501e13a0002'),('54511D70B80FF7FFDD5A11FAABC085A2','王六','6C89FB00F2E415D61662A478E849F5CD','YG','0','402828701604fcd401160501e13a0002:6C89FB00F2E415D61662A478E849F5CD',NULL,'N','上海佑哲信息科技有限公司:财物部','GS:BM','WL','402828701604fcd401160501e13a0002'),('569E49C465E734651F7F4CFFE16160F6','张三','0F7E0CE47906DE28288FBD9379F4690A','YG','0','402828701604fcd401160501e13a0002:0F7E0CE47906DE28288FBD9379F4690A',NULL,'402881e5202cd8e601202ce416210001','上海佑哲信息科技有限公司:技术部','GS:','ZS','402828701604fcd401160501e13a0002'),('6C89FB00F2E415D61662A478E849F5CD','财物部','402828701604fcd401160501e13a0002','BM','0','402828701604fcd401160501e13a0002',NULL,'N','上海佑哲信息科技有限公司','GS','CWB','402828701604fcd401160501e13a0002'),('80252AA5ACC97F84D6C1A75807A5455C','设计部','402828701604fcd401160501e13a0002','BM','0','402828701604fcd401160501e13a0002',NULL,NULL,'上海佑哲信息科技有限公司','GS','SJB','402828701604fcd401160501e13a0002'),('8873FA518265405763E919A125D540ED','刘正仁','0F7E0CE47906DE28288FBD9379F4690A','YG','0','402828701604fcd401160501e13a0002:0F7E0CE47906DE28288FBD9379F4690A',NULL,'402881e51d3e2ac2011d3e32242c0001','上海佑哲信息科技有限公司:技术部','GS:BM','LZR','402828701604fcd401160501e13a0002'),('A7A1803A658D3E0B0D135DFA6BB3E9DD','test','EBA7913FA5A707ABEAAECAC4F9FB945F','GS','0','402828701604fcd401160501e13a0002:6C89FB00F2E415D61662A478E849F5CD:EBA7913FA5A707ABEAAECAC4F9FB945F',NULL,'N','上海佑哲信息科技有限公司:财物部:张三4','GS','test','402828701604fcd401160501e13a0002'),('AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','0F7E0CE47906DE28288FBD9379F4690A','YG','0','402828701604fcd401160501e13a0002:0F7E0CE47906DE28288FBD9379F4690A',NULL,'402881e51d3e2ac2011d3e32822b0002','上海佑哲信息科技有限公司:技术部','GS:BM','WM','402828701604fcd401160501e13a0002'),('EBA7913FA5A707ABEAAECAC4F9FB945F','张三4','6C89FB00F2E415D61662A478E849F5CD','YG','0','402828701604fcd401160501e13a0002:6C89FB00F2E415D61662A478E849F5CD',NULL,NULL,'上海佑哲信息科技有限公司:财物部','GS:','ZS4','402828701604fcd401160501e13a0002'),('F09115978AB94DF8B4C87C8E32CD908D','王五','6C89FB00F2E415D61662A478E849F5CD','YG','0','402828701604fcd401160501e13a0002:6C89FB00F2E415D61662A478E849F5CD',NULL,'N','上海佑哲信息科技有限公司:财物部','GS:','WW','402828701604fcd401160501e13a0002'),('FC409474641EB0CF6CE03B29663E58BB','林颖军','0F7E0CE47906DE28288FBD9379F4690A','YG','0','402828701604fcd401160501e13a0002:0F7E0CE47906DE28288FBD9379F4690A',NULL,'402881e51d3e2ac2011d3e32d1e10003','上海佑哲信息科技有限公司:技术部','GS:BM','LYJ','402828701604fcd401160501e13a0002');
/*!40000 ALTER TABLE `urss_org_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_org_type`
--

DROP TABLE IF EXISTS `urss_org_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_org_type` (
  `ORG_TYPE_ID` varchar(32) NOT NULL,
  `ORG_TYPE_NAME` varchar(32) NOT NULL,
  `ORG_TYPE_CODE` varchar(32) NOT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  `IS_USEING` varchar(2) DEFAULT NULL,
  `ORG_NUMBER` decimal(10,0) DEFAULT NULL,
  `SYSTEM_IN` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ORG_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_org_type`
--

LOCK TABLES `urss_org_type` WRITE;
/*!40000 ALTER TABLE `urss_org_type` DISABLE KEYS */;
INSERT INTO `urss_org_type` VALUES ('4028286f16512e690116512fb9750001','科室','KS','402828701604fcd401160501e13a0002','Y','0','Y'),('402881e5204aee4a01204af0f2bf0001','外部组织','OUT_ORG','402828701604fcd401160501e13a0002','Y','0','Y'),('402881e5204aee4a01204af0f2bf0002','公司','GS','402828701604fcd401160501e13a0002','Y','0','Y'),('402881e5204aee4a01204af0f2bf0003','部门','BM','402828701604fcd401160501e13a0002','Y','0','Y'),('402881e5204aee4a01204af0f2bf0004','员工','YG','402828701604fcd401160501e13a0002','Y','0','Y');
/*!40000 ALTER TABLE `urss_org_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_post`
--

DROP TABLE IF EXISTS `urss_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_post` (
  `POST_ID` varchar(32) NOT NULL,
  `POST_NAME` varchar(32) NOT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  `POST_MEMO` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_post`
--

LOCK TABLES `urss_post` WRITE;
/*!40000 ALTER TABLE `urss_post` DISABLE KEYS */;
INSERT INTO `urss_post` VALUES ('4028286f164e034a01164e0429430001','项目经理','402828701604fcd401160501e13a0002','项目经理'),('ff808081169550b60116959888f00001','董事长','402828701604fcd401160501e13a0002','董事长'),('ff808081169550b601169598a2630002','总经理','402828701604fcd401160501e13a0002','总经理'),('ff808081169550b601169598bd4e0003','二级部门经理','402828701604fcd401160501e13a0002','二级部门经理'),('ff808081169550b601169598d3760004','三级部门经理','402828701604fcd401160501e13a0002','三级部门经理');
/*!40000 ALTER TABLE `urss_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_post_assign`
--

DROP TABLE IF EXISTS `urss_post_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_post_assign` (
  `ASSIGN_ID` varchar(32) NOT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `POST_ID` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ASSIGN_ID`),
  KEY `FK_URSS_POS_REFERENCE_URSS_ORG` (`ORG_ID`),
  KEY `FK_URSS_POS_REFERENCE_URSS_POS` (`POST_ID`),
  CONSTRAINT `FK_URSS_POS_REFERENCE_URSS_ORG` FOREIGN KEY (`ORG_ID`) REFERENCES `urss_org_tree` (`ORG_ID`),
  CONSTRAINT `FK_URSS_POS_REFERENCE_URSS_POS` FOREIGN KEY (`POST_ID`) REFERENCES `urss_post` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_post_assign`
--

LOCK TABLES `urss_post_assign` WRITE;
/*!40000 ALTER TABLE `urss_post_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `urss_post_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_post_org`
--

DROP TABLE IF EXISTS `urss_post_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_post_org` (
  `POST_ORG_ID` varchar(32) NOT NULL,
  `ASSIGN_ID` varchar(32) DEFAULT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `ORG_NAME` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`POST_ORG_ID`),
  KEY `FK_URSS_POS_URSS_ORG` (`ORG_ID`),
  KEY `FK_URSS_POS_URSS_POS` (`ASSIGN_ID`),
  CONSTRAINT `FK_URSS_POS_URSS_ORG` FOREIGN KEY (`ORG_ID`) REFERENCES `urss_org_tree` (`ORG_ID`),
  CONSTRAINT `FK_URSS_POS_URSS_POS` FOREIGN KEY (`ASSIGN_ID`) REFERENCES `urss_post_assign` (`ASSIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_post_org`
--

LOCK TABLES `urss_post_org` WRITE;
/*!40000 ALTER TABLE `urss_post_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `urss_post_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_reg_com`
--

DROP TABLE IF EXISTS `urss_reg_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_reg_com` (
  `COM_ID` varchar(32) NOT NULL,
  `REG_COM_NAME` varchar(320) NOT NULL,
  `REG_COM_CODE` varchar(32) DEFAULT NULL,
  `REG_COM_ADDRESS` varchar(320) NOT NULL,
  `REG_COM_EMAIL` varchar(32) NOT NULL,
  `REG_COM_BOSS` varchar(320) NOT NULL,
  `CAPTIL` decimal(10,0) DEFAULT NULL,
  `USER_TYPE` varchar(6) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `END_TIME` date DEFAULT NULL,
  PRIMARY KEY (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_reg_com`
--

LOCK TABLES `urss_reg_com` WRITE;
/*!40000 ALTER TABLE `urss_reg_com` DISABLE KEYS */;
INSERT INTO `urss_reg_com` VALUES ('402828701604fcd401160501e13a0002','精鹰网格有限公司','FE','上海','zhengmen@163.com','刘正仁','123','1','2010-03-09','0000-00-00');
/*!40000 ALTER TABLE `urss_reg_com` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_relation_href`
--

DROP TABLE IF EXISTS `urss_relation_href`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_relation_href` (
  `RELATION_HREF_ID` varchar(32) NOT NULL,
  `FUN_MODULE_ID` varchar(32) DEFAULT NULL,
  `FUN_MODULE_NAME` varchar(32) DEFAULT NULL,
  `RESOURCE_ID` varchar(32) DEFAULT NULL,
  `RELATION_NAME` varchar(32) DEFAULT NULL,
  `DYNAMIC` varchar(2) DEFAULT NULL,
  `JAVA_IMPL` varchar(32) DEFAULT NULL,
  `JS_IMPL` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`RELATION_HREF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_relation_href`
--

LOCK TABLES `urss_relation_href` WRITE;
/*!40000 ALTER TABLE `urss_relation_href` DISABLE KEYS */;
/*!40000 ALTER TABLE `urss_relation_href` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_resource`
--

DROP TABLE IF EXISTS `urss_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_resource` (
  `RESOURCE_ID` varchar(32) NOT NULL,
  `RESOURCE_NAME` varchar(32) NOT NULL,
  `RESOURCE_CODE` varchar(32) NOT NULL,
  `FUN_MODULE_ID` varchar(32) NOT NULL,
  `IS_BUTTON` varchar(2) NOT NULL,
  `BUTTON_ID` varchar(32) DEFAULT NULL,
  `IMPL_JS` varchar(255) DEFAULT NULL,
  `GROUP_NAME` varchar(320) DEFAULT NULL,
  `IMPL_URL` varchar(320) DEFAULT NULL,
  `COOP_AREA_ID` varchar(32) DEFAULT NULL,
  `COOP_ITEM_NAME` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `COOP_IMG` varchar(320) DEFAULT NULL,
  `IS_MENU_DISPLAY` varchar(2) DEFAULT NULL,
  `LINK_ASSIGN` varchar(10) DEFAULT NULL,
  `BUTTON_STYLE` varchar(32) DEFAULT NULL,
  `HAVE_ORG_RIGHT` varchar(2) DEFAULT NULL,
  `LINK_ASSIGN_VALUE` varchar(660) DEFAULT NULL,
  `PARENT_RES_ID` varchar(32) DEFAULT NULL,
  `ORDER_INDEX_COOP` decimal(10,0) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `FOLD_AREA` varchar(2) DEFAULT NULL,
  `ALL_PARENT_RES_ID` varchar(320) DEFAULT NULL,
  `PROCESS_INFO` varchar(100) DEFAULT NULL,
  `ASSIGN_METHOD` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`),
  KEY `FK_URSS_RES_REFERENCE_URSS_COO` (`COOP_AREA_ID`),
  KEY `FK_URSS_RES_REFERENCE_URSS_FUN` (`FUN_MODULE_ID`),
  CONSTRAINT `FK_URSS_RES_REFERENCE_URSS_FUN` FOREIGN KEY (`FUN_MODULE_ID`) REFERENCES `urss_function` (`FUN_MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_resource`
--

LOCK TABLES `urss_resource` WRITE;
/*!40000 ALTER TABLE `urss_resource` DISABLE KEYS */;
INSERT INTO `urss_resource` VALUES ('297e46552178367e0121783b2ca30015','增加流程','wfss_prc_edition_add_process','402881e5217173bf01217175a3ba000c','Y',NULL,'openSelectOpenSelectProcess()','edit',NULL,NULL,NULL,'0',NULL,'N','N',NULL,'N','402881e5217d679d01217d688c2b000a',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e5201e7ea001201e9ca3060011','保存','urss_save_sys_conf','402881e5201e7ea001201e8370a50003','Y',NULL,'selfDefSubmitForm(\'SystemConfEdit\')','edit','/saveSystemConf_abdf.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e52129bb4c012129c25fca0016',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e5201ea0f801201ea26f370001','新增功能','urss_add_function','402881e5201e7ea001201e96a313000f','Y','urss_add_function','addFunction(this)','function_top','/initFunction_urss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e5201ea0f801201ee1c17b0004,402881e5201ea0f801201eeab9710006,402881e5201ea0f801201ee817fa0005',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e5201ea0f801201edf64de0002','删除功能','urss_fun_del','402881e5201e7ea001201e96a313000f','Y','urss_fun_del','deleteFunction()','function_top',NULL,NULL,NULL,'1',NULL,'N','N',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e5201ea0f801201ee034ef0003','移动功能','urss_fun_move','402881e5201e7ea001201e96a313000f','Y','urss_fun_move','move()','function_top,fun_edit','','','','0','','N','N','','N','','','0','','Y',NULL,'','display'),('402881e5201ea0f801201ee1c17b0004','保存功能','urss_fun_save','402881e5201e7ea001201e96a313000f','Y','urss_fun_save','submitForm(this,\'FunctionEdit\',0,\'urss\')','edit_fun','/saveFunction_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5201ea0f801201ee817fa0005','新增平级','urss_fun_add_equal','402881e5201e7ea001201e96a313000f','Y',NULL,'equalAdd()','edit_fun',NULL,NULL,NULL,'0',NULL,'Y','Y',NULL,'N','402881e5201ea0f801201ee1c17b0004',NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5201ea0f801201eeab9710006','新增下级','urss_fun_add_child','402881e5201e7ea001201e96a313000f','Y',NULL,'downAdd()','edit_fun',NULL,NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e5201eef7f01201ef35e350003',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5201eef7f01201eefec110001','新增资源','urss_add_res','402881e5201e7ea001201e96a313000f','Y',NULL,'addResource(this)','URSS_RES_LIST,URSS_RES_EDIT',NULL,NULL,NULL,'0',NULL,'N','N',NULL,'N','402881e5201eef7f01201ef35e350003',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e5201eef7f01201ef1b3d10002','删除资源','urss_del_res','402881e5201e7ea001201e96a313000f','Y',NULL,'delResource(this)','URSS_RES_LIST',NULL,NULL,NULL,'0',NULL,'N','N',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e5201eef7f01201ef35e350003','保存资源','urss_save_res','402881e5201e7ea001201e96a313000f','Y',NULL,'submitForm(this,\'resourceEdit\',0,\'urss\')','URSS_RES_EDIT','/saveResource_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e520241cb101202428e3210001','新增表单','wfss_form_add','402881e5201e7ea001201e950428000d','Y',NULL,'addForm(this)','list','/initAppForm_wfss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e5210bed3e01210bf8998c004f,402881e520336b820120338a40470003',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e520241cb1012024292e910002','新增流程','wfss_process_add','402881e5201e7ea001201e95b6fd000e','Y',NULL,'buttomOnClickAdd(this,\'${baseURL}/forwardProcessEditFrame_wfss.do\',\'self\')','process_list','/initProcess_wfss.do',NULL,NULL,'0',NULL,'Y','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e520241cb10120242981f10003','新增','urss_add_org_type','402881e5201e7ea001201e8b695b0005','Y',NULL,'buttomOnClickAdd(this,\'${baseURL}/initOrgType_urss.do\',\'self\')','list','/initOrgType_urss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e5204ade6b01204ae14f930001,402881e52100a676012100aa163f000d',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e520241cb101202429cdbf0004','保存','urss_org_save','402881e5201e7ea001201e8be0210006','Y',NULL,'submitOrgEdit(this)','edit','/saveOrg_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52100d847012100e970e0001b',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5202737c001202740b9360001','管理用户','urss_role_user','402881e5201e7ea001201e8e87730009','Y',NULL,'displayUserOrgPage()','edit','/listRoleOrgByRoleId_urss.do',NULL,NULL,'0',NULL,'N','N',NULL,'N','402881e52101cfdf012101d3bcea001b,402881e52101d80b012101d9b6a40007,402881e52101d80b012101dac8ee000a,402881e52101d80b012101db64a2000e,402881e52101d80b012101dc0eec0011,402881e5210bcba201210bd00bb6000a',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e520278449012027868cf20001','新增','urss_add_role','402881e5201e7ea001201e8e87730009','Y',NULL,'addRole(this)','list','/initRole_urss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e52101cfdf012101d3bcea001b,402881ee20240f7601202413822b0001',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e52027844901202786ff530002','删除','urss_del_role','402881e5201e7ea001201e8e87730009','Y',NULL,'deleteRole()','list','/deleteRole_urss.do',NULL,NULL,'0',NULL,'N','N',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e5202cd8e601202ce77e610002','管理已定义用户','urss_mrg_defined','402881e5201e7ea001201e8e1e490008','Y',NULL,'displayUserPage()','un_edit','/listPageUserByOrgId_urss.do',NULL,NULL,'1',NULL,'Y','N',NULL,'N','402881e521018ea40121018fa2f50003',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e5202d082e01202d0fd8750002','保存用户','urss_user_save','402881e5201e7ea001201e8e1e490008','Y',NULL,'submitForm(this,\'UserEdit\',0,\'urss\')','urss_user_edit','/saveUser_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e521018ea40121018fa2f50003',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e520336b820120337d421b0001','删除用户','urss_del_user','402881e5201e7ea001201e8e1e490008','Y',NULL,'buttomOnClickDel(this,\'${baseURL}/deleteUser_urss.do\',\'self\',\'itemIdCheckBox\')','selected_list','/deleteUser_urss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e520336b82012033896b630002','删除表单','wfss_form_del','402881e5201e7ea001201e950428000d','Y',NULL,'buttomOnClickDel(this,\'${baseURL}/deleteAppForm_wfss.do\',\'self\',\'itemIdCheckBox\')','list','/deleteAppForm_wfss.do',NULL,NULL,'0',NULL,'N','N',NULL,'N','402881e5210bed3e01210bf8998c004f',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e520336b820120338a40470003','保存表单','wfss_form_save','402881e5201e7ea001201e950428000d','Y',NULL,'submitForm(this,\'appFormEdit\',0,\'wfss\')','edit','/saveAppForm_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e5210bed3e01210bf8998c004f,402881e520336b820120338b29bd0004',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e520336b820120338b29bd0004','返回列表','wfss_form_back','402881e5201e7ea001201e950428000d','Y',NULL,'buttomOnClick(\'${baseURL}/queryPageAppForm_wfss.do\',\'self\')','edit',NULL,NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e520336b82012033a0a05e0005','管理字段','wfss_mrg_filed','402881e5201e7ea001201e950428000d','Y',NULL,'gotoMrgForm()','edit,list','/getFormFieldByFormId_wfss.do',NULL,NULL,'4',NULL,'N','N',NULL,'N','402881e5210bed3e01210bff42de0092,402881e52033a935012033be78bf0001,402881e5203d551a01203d5d7ae60001,402881e52033a935012033c3f6050003,402881e52033a935012033bf75ad0002',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e52033a935012033be78bf0001','新增字段','wfss_field_add','402881e5201e7ea001201e950428000d','Y',NULL,'addField(this)','list_field,edit_field','/initFormField_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52033a935012033c3f6050003',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e52033a935012033bf75ad0002','删除字段','wfss_field_del','402881e5201e7ea001201e950428000d','Y',NULL,'delField(this)','list_field','/deleteFormField_wfss.do',NULL,NULL,'1',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52033a935012033c3f6050003','保存字段','wfss_field_save','402881e5201e7ea001201e950428000d','Y',NULL,'submitForm(this,\'appFormFieldEdit\',0,\'wfss\')','edit_field','/saveFormField_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e5203d551a01203d5d7ae60001',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5203d551a01203d5d7ae60001','返回字段列表','wfss_form_feild_back','402881e5201e7ea001201e950428000d','Y',NULL,'backList(this)','edit_field',NULL,NULL,NULL,'0',NULL,'Y','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5203da10201203da5f5f40001','删除流程','wfss_process_del','402881e5201e7ea001201e95b6fd000e','Y',NULL,'buttomOnClickDel(this,\'${baseURL}/deleteProcess_wfss.do\',\'self\',\'itemIdCheckBox\')','process_list','/deleteProcess_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5203dac1c01203db175bd0001','保存流程','wfss_process_save','402881e5201e7ea001201e95b6fd000e','Y',NULL,'submitForm(this,\'processEdit\',0,\'wfss\')','process_edit','/saveProcess_wfss.do',NULL,NULL,'0',NULL,'Y','Y',NULL,'N','402881e5203dac1c01203db3adcb0003',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5203dac1c01203db2a8af0002','新增活动','wfss_activity_add','402881e5201e7ea001201e95b6fd000e','Y',NULL,'addActivity(this)','process_edit','/initActivity_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e5203dac1c01203db3adcb0003,402881e5203dac1c01203dc7d71c0004',NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5203dac1c01203db3adcb0003','返回列表','wfss_rpocess_back','402881e5201e7ea001201e95b6fd000e','Y',NULL,'backProcess(this)','process_edit,activity_edit,route_edit',NULL,NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5203dac1c01203dc7d71c0004','保存活动','wfss_activity_save','402881e5201e7ea001201e95b6fd000e','Y',NULL,'submitForm(this,\'activityEdit\',0,\'wfss\')','activity_edit','/saveActivity_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5203dc94c01203dc973090001','新增路由','wfss_route_add','402881e5201e7ea001201e95b6fd000e','Y',NULL,'addRoute()','activity_edit','/initRoute_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e5203dd6b501203dd90f310001,402881e5203dac1c01203db3adcb0003',NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5203dd6b501203dd90f310001','保存路由','wfss_route_save','402881e5201e7ea001201e95b6fd000e','Y',NULL,'submitForm(this,\'routeEdit\',0,\'wfss\')','route_edit','/saveProcess_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5204ade6b01204ae14f930001','保存','urss_org_type_save','402881e5201e7ea001201e8b695b0005','Y',NULL,'submitForm(this,\'orgTypeEdit\',0,\'urss\')','edit','/saveOrgType_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52100a676012100aa163f000d,402881e5204ade6b01204ae239560002',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e5204ade6b01204ae239560002','返回列表','urss_org_type_back','402881e5201e7ea001201e8b695b0005','Y',NULL,'buttomOnClick(\'${baseURL}/getOrgTypeByComId_urss.do\',\'self\')','edit',NULL,NULL,NULL,'1',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5204b016b01204b373b1e0001','新增平级','urss_org_equals_add','402881e5201e7ea001201e8be0210006','Y',NULL,'equalAdd()','edit','/initOrg_urss.do',NULL,NULL,'0',NULL,'Y','Y',NULL,'N','402881e52100d847012100e970e0001b,402881e520241cb101202429cdbf0004',NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5204b016b01204b37c4720002','新增下级','urss_org_child_add','402881e5201e7ea001201e8be0210006','Y',NULL,'downAdd()','edit','/initOrg_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52100d847012100e970e0001b,402881e520241cb101202429cdbf0004',NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5204b016b01204b3832400003','移动','urss_org_move','402881e5201e7ea001201e8be0210006','Y',NULL,'move()','edit','/moveOrg_urss.do',NULL,NULL,'0',NULL,'N','N',NULL,'N','402881e52100d847012100e970e0001b',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e5204b016b01204b38d3df0004','删除','urss_org_del','402881e5201e7ea001201e8be0210006','Y',NULL,'deleteOrg()','edit','/deleteOrg_urss.do',NULL,NULL,'0',NULL,'N','N',NULL,'N','402881e52100d847012100e970e0001b',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e520cdb92a0120cdbe17860002','保存','wfss_button_save','402881e520cdb92a0120cdbdb12b0001','Y',NULL,'submitForm(this,\'ButtonForm\',0,\'wfss\')','edit','/saveButton_wfss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e520cdb92a0120cdc9a74d0003,402881e5210bcba201210bd6b4ca0029',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e520cdb92a0120cdc9a74d0003','返回','wfss_button_back','402881e520cdb92a0120cdbdb12b0001','Y',NULL,'buttomOnClick(\'${baseURL}/listButton_wfss.do\',\'self\')','edit',NULL,NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e520ff3f340120ff44a4820014','角色树','urss_role_tree','402881e5201e7ea001201e923df3000a','N',NULL,NULL,NULL,'/forwardRoleRightTree_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e520ff3f340120ff45ab920018','显示角色权限','urss_role_display','402881e5201e7ea001201e923df3000a','N',NULL,NULL,NULL,'/getFunctionByRoleId_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e520ff3f340120ff4723ab0025','角色权限功能树','urss_roe_right_fun_tree','402881e5201e7ea001201e923df3000a','N',NULL,NULL,NULL,'/forwardRightFunctionTree_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e520ff3f340120ff489f6e002d','查看角色权限','urss_role_right_view','402881e5201e7ea001201e923df3000a','N',NULL,NULL,NULL,'/forwardRoleRightFrame_urss.do',NULL,NULL,'0',NULL,'Y','Y',NULL,'N','402881e520ff3f340120ff44a4820014,402881e520ff3f340120ff45ab920018,402881e520ff3f340120ff4723ab0025',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e521009d0f012100a2c1e70005','查看列表','urss_org_type_list','402881e5201e7ea001201e8b695b0005','N',NULL,NULL,NULL,'/getOrgTypeByComId_urss.do',NULL,NULL,'0',NULL,'Y','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e52100a676012100aa163f000d','查看组织架构类型','urss_org_type_view','402881e5201e7ea001201e8b695b0005','N',NULL,NULL,NULL,'/showOrgType_urss.do',NULL,NULL,'0',NULL,'Y','Y',NULL,'N','402881e521009d0f012100a2c1e70005',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e52100d847012100e7ed7c0013','组织框架页','urss_org_frame','402881e5201e7ea001201e8be0210006','N',NULL,NULL,NULL,'/forwardOrgFrame_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52100d847012100e8d8970017','组织架构树','urss_org_ree','402881e5201e7ea001201e8be0210006','N',NULL,NULL,NULL,'/forwardOrgTree_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52100d847012100e970e0001b','查看组织','urss_org_tree','402881e5201e7ea001201e8be0210006','N',NULL,NULL,NULL,'/showOrg_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52100d847012100e7ed7c0013,402881e52100d847012100e8d8970017,402881e52100d847012100ef56460035',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e52100d847012100ef56460035','异步加载组织','urs_org_tree_asyn','402881e5201e7ea001201e8be0210006','N',NULL,NULL,NULL,'/orgTree_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5210115550121013b7b80002a','新增','urss_org_add','402881e5201e7ea001201e8be0210006','N',NULL,NULL,NULL,'/initOrg_urss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e5204b016b01204b373b1e0001,402881e5204b016b01204b37c4720002',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e521017bd301210186cb390017','用户管理--组织架构树','urss_org_user_tree','402881e5201e7ea001201e8e1e490008','N',NULL,NULL,NULL,'/forwardUserTree_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e521017bd3012101881760001b','用户管理--树数据异步加载','urss_user_org_asyn','402881e5201e7ea001201e8e1e490008','N',NULL,NULL,NULL,'/orgTreeUser_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e521018ea40121018fa2f50003','查看用户信息','urss_user_view','402881e5201e7ea001201e8e1e490008','N',NULL,NULL,NULL,'/showUser_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e521017bd301210186cb390017,402881e521017bd3012101881760001b,402881e521018ea401210191d8d00018',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e521018ea401210191d8d00018','未定义用户列表','urss_org_unuser','402881e5201e7ea001201e8e1e490008','N',NULL,NULL,NULL,'/listPageUnUserByOrgId_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e52101cfdf012101d1e1160013','角色树','urss_role_tree','402881e5201e7ea001201e8e87730009','N',NULL,NULL,NULL,'/forwardRoleTree_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52101cfdf012101d282090017','角色列表','urss_role_list','402881e5201e7ea001201e8e87730009','N',NULL,NULL,NULL,'/getTopRoleByAppIdAndComId_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52101cfdf012101d3bcea001b','查看角色信息','urss_role_view','402881e5201e7ea001201e8e87730009','N',NULL,NULL,NULL,'/showRole_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52101cfdf012101d1e1160013,402881e52101cfdf012101d282090017',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e52101d80b012101d9b6a40007','保存角色下加用户','urss_role_org_save','402881e5201e7ea001201e8e87730009','N',NULL,NULL,NULL,'/saveRoleOrg_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52101d80b012101dac8ee000a','查询角色下用户','urss_role_org_query','402881e5201e7ea001201e8e87730009','N',NULL,NULL,NULL,'/queryRoleOrg_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52101d80b012101db64a2000e','新增查询角色下用户','urss_role_org_query_add','402881e5201e7ea001201e8e87730009','N',NULL,NULL,NULL,'/addRoleOrgFormQuery_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52101d80b012101dc0eec0011','删除查询角色下用户','urss_role_org_query_del','402881e5201e7ea001201e8e87730009','N',NULL,NULL,NULL,'/deleteRoleOrgFormQuery_urss.d',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52101fe3401210202685d0007','查看用户权限','urss_user_right_view','402881e5201e7ea001201e93e4cd000b','N',NULL,NULL,NULL,'/showUserRight_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52101fe3401210203a1e7000b',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e52101fe3401210203a1e7000b','用户权根分配的功能树','urss_user_right_fun','402881e5201e7ea001201e93e4cd000b','N',NULL,NULL,NULL,'/forwardRightFunctionTree_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52101fe3401210202685d0007',NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5210bcba201210bd00bb6000a','删除角色下用户--列表','urss_role_org_del_list','402881e5201e7ea001201e8e87730009','N',NULL,NULL,NULL,'/deleteRoleOrg_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5210bcba201210bd6b4ca0029','查看列表','wfss_button_list','402881e520cdb92a0120cdbdb12b0001','N',NULL,NULL,NULL,'/listButton_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5210bcba201210bd77db7002d','查看流程辅助按钮','wfss_button_view','402881e520cdb92a0120cdbdb12b0001','N',NULL,NULL,NULL,'/showButton_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e5210bcba201210bd6b4ca0029',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e5210bed3e01210bf6793c0049','业务表单列表页','wfss_appform_list','402881e5201e7ea001201e950428000d','N',NULL,NULL,NULL,'/queryPageAppForm_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5210bed3e01210bf71bb6004c','业务表单树','wfss_appform_tree','402881e5201e7ea001201e950428000d','N',NULL,NULL,NULL,'/forwardAppFormTree_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5210bed3e01210bf8998c004f','查看业务表单','wfss_appform_view','402881e5201e7ea001201e950428000d','N',NULL,NULL,NULL,'/showAppForm_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e5210bed3e01210bf6793c0049,402881e5210bed3e01210bf71bb6004c',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e5210bed3e01210bff42de0092','查看业务表单字段信息','wfss_appform_field_view','402881e5201e7ea001201e950428000d','N',NULL,NULL,NULL,'/showFormField_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e52110dfec012111062dbc0057','流程定义--树','wfss_process_tree','402881e5201e7ea001201e95b6fd000e','N',NULL,NULL,NULL,'/forwardProcessEditTree_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52110dfec01211106e871005a','流程定义列表页','wfss_process_list','402881e5201e7ea001201e95b6fd000e','N',NULL,NULL,NULL,'/queryPageProcess_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52110dfec01211107ec25005f','流程定义--流程详细信息页','wfss_process_view','402881e5201e7ea001201e95b6fd000e','N',NULL,NULL,NULL,'/showProcess_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52110dfec01211108b2d10063','流程定义--环节详细信息页','wfss_act_view','402881e5201e7ea001201e95b6fd000e','N',NULL,NULL,NULL,'/showActivity_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52110dfec01211109e2480067','流程定义--路由详细信息页','wfss_route_view','402881e5201e7ea001201e95b6fd000e','N',NULL,NULL,NULL,'/showRoute_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e52110dfec0121110e0a20006d','管理流程定义','wfss_process_mrg','402881e5201e7ea001201e95b6fd000e','N',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,'N','N',NULL,'N','402881e5203dd6b501203dd90f310001,402881e52110dfec012111062dbc0057,402881e52110dfec01211106e871005a,402881e52110dfec01211107ec25005f,402881e52110dfec01211108b2d10063,402881e52110dfec01211109e2480067,402881e5203da10201203da5f5f40001,402881e5203dac1c01203db175bd0001,402881e5203dac1c01203db2a8af0002,402881e5203dac1c01203db3adcb0003,402881e5203dac1c01203dc7d71c0004,402881e5203dc94c01203dc973090001,402881e520241cb1012024292e910002',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e52129bb4c012129c25fca0016','查看系统参数配置信息','abdf_sys_conf_view','402881e5201e7ea001201e8370a50003','N',NULL,NULL,NULL,'/showSystemConf_abdf.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5217173bf01217176c6be0013','查看','view','402881e5217173bf01217175a3ba000c','N',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e5217277eb0121727ee2be000b,402881e5217277eb01217280d065000f',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e5217173bf01217177f76e001e','保存','wfss_process_agent_save','402881e5217173bf0121717772110018','Y',NULL,'submitForm(this,\'AgentForm\',0,\'wfss\')',NULL,NULL,NULL,NULL,'0',NULL,'Y','N',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881e5217277eb0121727ee2be000b','列表页','wfss_pro_edition_list','402881e5217173bf01217175a3ba000c','N',NULL,NULL,NULL,'/listProcessEdition_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5217277eb01217280d065000f','详细信息页','wfss_pro_edition','402881e5217173bf01217175a3ba000c','N',NULL,NULL,NULL,'/showProcessEdition_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0',NULL,'Y',NULL,NULL,'hidden'),('402881e5217277eb0121728233fc0019','新增','wfss_pro_edition_add','402881e5217173bf01217175a3ba000c','Y',NULL,'buttomOnClickAdd(this,\'${baseURL}/initProcessEdition_wfss.do\',\'self\')','list','/initProcessEdition_wfss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e521729c2e012172a0b232000a',NULL,'0',NULL,'Y',NULL,NULL,'display'),('402881e521729c2e012172a0b232000a','保存','wfss_pro_edition_save','402881e5217173bf01217175a3ba000c','Y',NULL,'submitForm(this,\'ProcessEditionForm\',0,\'wfss\')','edit','/saveProcessEdition_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881e5217d679d01217d688c2b000a','增加流程到版本','wfss_process_to_edition','402881e5217173bf01217175a3ba000c','N',NULL,NULL,NULL,'/addProcessToEdition_wfss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'hidden'),('402881ee20240f7601202413822b0001','保存','urss_role_save','402881e5201e7ea001201e8e87730009','Y',NULL,'submitForm(this,\'RoleEdit\',0,\'urss\')','edit','/saveRole_urss.do',NULL,NULL,'0',NULL,'N','Y',NULL,'N','402881e52101cfdf012101d3bcea001b',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881ee20240f7601202421d3830002','保存权限','urss_role_power','402881e5201e7ea001201e923df3000a','Y',NULL,'submitRoleRight(this)','edit','/saveRoleRight_urss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e520ff3f340120ff489f6e002d',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881ee20240f760120242205220003','保存','urss_user_right','402881e5201e7ea001201e93e4cd000b','N',NULL,NULL,'edit','/saveUserRight_urss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e52101fe3401210202685d0007',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881ee20240f760120242329200004','新增用户','urss_add_user','402881e5201e7ea001201e8e1e490008','Y',NULL,'addUser()','un_edit','/initUser_urss.do',NULL,NULL,'0',NULL,'Y','N',NULL,'N','402881e521018ea40121018fa2f50003,402881e5202d082e01202d0fd8750002',NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('402881f0203e097001203e166ff50002','保存密码','pwd_save','402881f0203e097001203e13de7d0001','Y',NULL,'submitForm(this,\'UserPwdEdit\',0,\'urss\')','edit','/modifyPassword.do',NULL,NULL,'0',NULL,'N','N',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('8a90247317b485ec0117b488ea6f0002','新建','add','8a90247317b485ec0117b48838360001','Y',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,'Y','Y',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','N',NULL,NULL,'hidden'),('8a90247317b485ec0117b48a1a920003','基站审批流程','flow_demo1','8a90247317b485ec0117b48838360001','Y','flow_demo1','add_flow_demo()','list','/initSimpleProcessDemo_demo.do','4028286f162e0df601162e0ebb760001','基站审批流程','1','/gd/images/submemu/s-xfsmdw.gif','N','N','','Y','','8a90247317b485ec0117b488ea6f0002','0','','N','8a90247317b485ec0117b488ea6f0002','TEST_PROCESS][test_activity','display'),('8a90247317b485ec0117b48b09950004','单分支审批流程(不是首环节开始)','flow_demo2','8a90247317b485ec0117b48838360001','Y','flow_demo2','add_flow_demo2()','list',NULL,NULL,NULL,'0',NULL,'N','N',NULL,'N','8a90247317b485ec0117b488ea6f0002','8a90247317b485ec0117b488ea6f0002','0',NULL,'N','8a90247317b485ec0117b488ea6f0002','TEST_PROCESS][test2_activity','display'),('ff80808117010a2f0117011972c20003','管理','mrg','ff80808117010a2f0117011870070001','Y',NULL,NULL,NULL,'/forwardDictFrame_adbf.do','ff80808116af8af30116af956c190001','平面数据字黄类型','0','/bsp/abdf/skins/default/img/toolbar/label.gif','Y','N',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('ff80808117010a2f0117011a801b0004','管理','mrg','ff80808117010a2f01170118d3170002','Y',NULL,NULL,NULL,NULL,'ff80808116af8af30116af956c190001','树型数据字典类型','0','/bsp/abdf/skins/default/img/toolbar/label.gif','Y','N',NULL,'N',NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,NULL,'display'),('ff80808118bd90db0118bdacfa680033','顺序会签审批流程','flow_demo3','8a90247317b485ec0117b48838360001','Y',NULL,'add_flow_demo3()','list',NULL,NULL,NULL,'5',NULL,'N','N',NULL,'N',NULL,'8a90247317b485ec0117b488ea6f0002','5',NULL,'Y','8a90247317b485ec0117b488ea6f0002','PROCESS_TEST2][PROCESS_TEST2_A2','display'),('ff8080811922f6a901192416a9d2007a','多个消息一人处理流程','flow_demo4','8a90247317b485ec0117b48838360001','Y','flow_demo4','add_flow_demo4() ','list',NULL,NULL,NULL,'0',NULL,'N','N',NULL,'N',NULL,'8a90247317b485ec0117b488ea6f0002','0','ff80808116d8b9390116d8c47b4a0001','Y','8a90247317b485ec0117b488ea6f0002','PROCESS_TEST3][PROCESS_TEST3_A1','display'),('ff8080811928036a011928189746005d','并行会签','flow_demo5','8a90247317b485ec0117b48838360001','Y','flow_demo5','add_flow_demo5()','list',NULL,NULL,NULL,'7',NULL,'N','N',NULL,'N',NULL,'8a90247317b485ec0117b488ea6f0002','0','ff80808116d8b9390116d8c47b4a0001','Y','8a90247317b485ec0117b488ea6f0002','PROCESS_TEST4][PROCESS_TEST4_A1','display'),('ff808081274d1b7f01274d2be4cb0025','执行','execute','ff808081274d1b7f01274d2a8d5f001f','N','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99f0390003','毛利报表','0','/gd/images/submemu/o-fkfs.gif','Y','N','','N','','','0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275ad7544b005f','新增','add_cart','ff808081275ab3c001275ad4f654004d','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','新增车辆','0','/gd/images/submemu/z-qtsbgl.gif','N','N','','N','ff808081275ab3c001275ad8d7920062','','0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275ad8d7920062','车辆列表','list_cart','ff808081275ab3c001275ad4f654004d','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','车辆列表','0','/gd/images/submemu/z-qtsbgl.gif','Y','Y','','N','','','0','','Y',NULL,'','hidden'),('ff808081275ab3c001275af72b0d00af','结算方式列表','list_momey_1','ff808081275ab3c001275af5c35900ab','N','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','结算方式','0','/gd/images/submemu/z-dlhdgql.gif','Y','Y','','N','','','0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275af8043200b2','新增','add_moeny','ff808081275ab3c001275af5c35900ab','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','新增结算方式','0','/gd/images/submemu/z-dlhdgql.gif','N','N','','N','ff808081275ab3c001275af72b0d00af','','2','','Y',NULL,'','display'),('ff808081275ab3c001275b01d91300eb','客户分类列表','customer_type_list','ff808081275ab3c001275b00a07600e7','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','客户分类','0','/gd/images/submemu/d-hylbsz.gif','Y','Y','','N','','','3','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b02bb3000ee','新增','add_customer_type','ff808081275ab3c001275b00a07600e7','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','客户分类','0','/gd/images/submemu/d-hylbsz.gif','N','N','','N','ff808081275ab3c001275b01d91300eb','','3','','Y',NULL,'','display'),('ff808081275ab3c001275b0aa61b011b','客户列表','list_customer','ff808081275ab3c001275b09eaff0117','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','客户列表','0','/gd/images/submemu/d-hysz.gif','Y','Y','','N','','','4','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b0b5d5b011e','新增','add_customer','ff808081275ab3c001275b09eaff0117','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','客户','0','/gd/images/submemu/d-hysz.gif','N','N','','N','ff808081275ab3c001275b0aa61b011b','','4','','Y',NULL,'','display'),('ff808081275ab3c001275b2054000188','供应商分类列表','list_provider_type','ff808081275ab3c001275b1cf2a1017a','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','供应商分类','0','/gd/images/submemu/u-bmsz.gif','Y','Y','','N','','','4','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b211ebd018b','新增','add_provider','ff808081275ab3c001275b1cf2a1017a','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','供应商类型','0','/gd/images/submemu/u-bmsz.gif','N','N','','N','ff808081275ab3c001275b2054000188','','4','','Y',NULL,'','display'),('ff808081275ab3c001275b25abdd01a7','供应商列表','list_provider','ff808081275ab3c001275b24f78301a3','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','供应商','0','/gd/images/submemu/x-dnb.gif','Y','Y','','N','','','5','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b267a8101aa','新增','add_provider','ff808081275ab3c001275b24f78301a3','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','供应商','0','/gd/images/submemu/x-dnb.gif','N','N','','N','ff808081275ab3c001275b25abdd01a7','','5','','Y',NULL,'','display'),('ff808081275ab3c001275b2b1e3401c0','商品单价列表','unit_list','ff808081275ab3c001275b2a2b9f01bc','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','商品单价','0','/gd/images/submemu/r-ryqzjl.gif','Y','Y','','N','','','6','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b2c4c0e01c3','新增','add_unit','ff808081275ab3c001275b2a2b9f01bc','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','商品单位','0','/gd/images/submemu/r-ryqzjl.gif','N','N','','N','ff808081275ab3c001275b2b1e3401c0','','6','','Y',NULL,'','display'),('ff808081275ab3c001275b36801c01e3','帐套管理列表','account_list','ff808081275ab3c001275b3599a001df','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','帐套','0','/gd/images/submemu/o-fyyxsy.gif','Y','Y','','N','','','7','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b378ec801e8','新增','add_account','ff808081275ab3c001275b3599a001df','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','帐套','0','/gd/images/submemu/o-fyyxsy.gif','N','N','','N','ff808081275ab3c001275b36801c01e3','','7','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b3b79590200','商品分类列表','list_product','ff808081275ab3c001275b3a840301fc','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','商品分类','0','/gd/images/submemu/f-fqgl.gif','N','Y','','N','','','8','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b3c4b630205','新增','add_product','ff808081275ab3c001275b3a840301fc','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','商品分类','0','/gd/images/submemu/f-fqgl.gif','N','N','','N','ff808081275ab3c001275b3b79590200','','8','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b3f5f480216','商品列表','list_pro','ff808081275ab3c001275b3e835a0212','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','商品','0','/gd/images/submemu/s-dxdnb.gif','N','Y','','N','','','9','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b40a63a0222','新增','add_pod','ff808081275ab3c001275b3e835a0212','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','商品','0','/gd/images/submemu/s-dxdnb.gif','N','N','','N','ff808081275ab3c001275b3f5f480216','','9','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b47751b023f','执行','execute_cash','ff808081275ab3c001275b46988d023b','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99f0390003','现金报表','0','/gd/images/submemu/z-xffs.gif','Y','N','','N','','','1','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b4a39d9024e','执行','execute','ff808081275ab3c001275b496530024a','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99f0390003','应收款报表','0','/gd/images/submemu/x-dyhgq.gif','Y','N','','N','','','2','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b4d063c0263','执行','execute','ff808081275ab3c001275b4c37ef025f','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99f0390003','应付款报表','0','/gd/images/submemu/x-dlhgqjy.gif','Y','N','','N','','','3','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b527a49028d','执行','buy_res','ff808081275ab3c001275b51655d0289','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99f0390003','采购单报表','0','/gd/images/submemu/s-bzcf.gif','Y','N','','N','','','4','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b55f6b20296','执行','execute','ff808081275ab3c001275b54b76c0292','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99f0390003','配送单报表','0','/gd/images/submemu/s-bzwd.gif','Y','N','','N','','','5','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b5bd18e02be','执行','execute','ff808081275ab3c001275b5af90202ba','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99f0390003','退货清单报表','0','/gd/images/submemu/z-dyechlgl.gif','Y','N','','N','','','6','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b5f794e02c7','执行','execute','ff808081275ab3c001275b5e902702c3','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99f0390003','订单下单报表','0','/gd/images/submemu/u-qqgl.gif','Y','N','','N','','','7','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b68e4b402df','生成PDF','PDF','ff808081275ab3c001275b6810ed02db','Y','','submitReportFrom(\'pdfReportViewer\')','query','','','','0','','Y','N','','N','','','0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b6f806202ed','执行','executort','ff808081275ab3c001275b6e10c902e9','Y','','','','','','','0','','Y','N','','N','','','1','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b70f64402f8','执行','executoer','ff808081275ab3c001275b709e0802f4','Y','','','','','','','0','','Y','N','','N','','','2','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b74bd860307','仓库列表','wh_list','ff808081275ab3c001275b73e7ae0303','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','仓库资料','0','/gd/images/submemu/d-flfg.gif','Y','Y','','N','','','11','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b757e09030a','新增','add_wh','ff808081275ab3c001275b73e7ae0303','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','仓库资料','0','/gd/images/submemu/d-flfg.gif','N','N','','N','ff808081275ab3c001275b74bd860307','','11','','Y',NULL,'','display'),('ff808081275ab3c001275b7998e30325','出库单列表','out_list','ff808081275ab3c001275b78a2230321','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','出库单','0','/gd/images/submemu/f-fyghjl.gif','Y','Y','','N','','','12','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b7ab4660328','新增','add_out','ff808081275ab3c001275b78a2230321','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','出库单','0','/gd/images/submemu/f-fyghjl.gif','N','N','','N','ff808081275ab3c001275b7998e30325','','12','','Y',NULL,'','display'),('ff808081275ab3c001275b7d4be60341','入库单列表','in_list','ff808081275ab3c001275b7c24750334','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','入库单','0','/gd/images/submemu/t-pxqk.gif','Y','Y','','N','','','13','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b7dec7a0344','新增','add_in','ff808081275ab3c001275b7c24750334','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','入库单','0','/gd/images/submemu/t-pxqk.gif','N','N','','N','ff808081275ab3c001275b7d4be60341','','13','','Y',NULL,'','display'),('ff808081275ab3c001275b7fba3d034e','执行','executor','ff808081275ab3c001275b7f689e034a','Y','','','','','','','0','','Y','N','','N','','','0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b81be4b0357','执行','executor','ff808081275ab3c001275b817b560353','Y','','','','','','','0','','Y','N','','N','','','0','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','display'),('ff808081275ab3c001275b864b680375','订单列表','order_list','ff808081275ab3c001275b857a9d0371','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','订单','0','/gd/images/submemu/o-tsxq.gif','Y','Y','','N','','','14','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b86d4210378','新增','add_order','ff808081275ab3c001275b857a9d0371','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','订单','0','/gd/images/submemu/o-tsxq.gif','N','N','','N','ff808081275ab3c001275b864b680375','','14','','Y',NULL,'','display'),('ff808081275ab3c001275b89d0b4038a','配送单列表','gfgfgf','ff808081275ab3c001275b8914180386','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','配送单','0','/gd/images/submemu/s-cpxmsz.gif','Y','Y','','N','','','15','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b8ae4e7038d','新增','add_out_order','ff808081275ab3c001275b8914180386','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','配送单','0','/gd/images/submemu/s-cpxmsz.gif','N','N','','N','ff808081275ab3c001275b89d0b4038a','','15','','Y',NULL,'','display'),('ff808081275ab3c001275b8dd5410399','采购计划单列表','ggggg','ff808081275ab3c001275b8d104b0395','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','采购计划单','0','/gd/images/submemu/o-sbgl.gif','Y','Y','','N','','','16','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b8e7351039c','新增','add_gggg','ff808081275ab3c001275b8d104b0395','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','采购计划单','0','/gd/images/submemu/o-sbgl.gif','N','N','','N','ff808081275ab3c001275b8dd5410399','','16','','Y',NULL,'','display'),('ff808081275ab3c001275b906d4103a8','采购单列表','gggggggg','ff808081275ab3c001275b8fad6b03a4','Y','','','','/gd/images/submemu/doing.gif','ff80808116af8af30116af99b3010002','采购单','0','/gd/images/submemu/t-jlzzpz.gif','Y','Y','','N','','','17','ff80808116d8b9390116d8c47b4a0001','Y',NULL,'','hidden'),('ff808081275ab3c001275b910ab903ab','新增','hhhhhhhh','ff808081275ab3c001275b8fad6b03a4','Y','','','','/gd/images/submemu/doing.gif','4028286f162e0df601162e0ebb760001','采购单','0','/gd/images/submemu/t-jlzzpz.gif','N','N','','N','ff808081275ab3c001275b906d4103a8','','17','','Y',NULL,'','display'),('ff80808127c22fb30127c2329cb40001','生成EXCEL','EXCEL','ff808081275ab3c001275b6810ed02db','Y','','submitReportFrom(\'excelReportViewer\')','query','','','','0','','N','N','','N','','','0','','Y',NULL,'','display'),('ff80808127c22fb30127c234492c0002','生成HTML','HTML','ff808081275ab3c001275b6810ed02db','Y','','submitReportFrom(\'htmlReportViewer\')','query','','','','0','','N','N','','N','','','0','','Y',NULL,'','display');
/*!40000 ALTER TABLE `urss_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_right`
--

DROP TABLE IF EXISTS `urss_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_right` (
  `RIGHT_ID` varchar(32) NOT NULL,
  `RESOURCE_ID` varchar(32) DEFAULT NULL,
  `FUN_MODULE_ID` varchar(32) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `MEMBER_TYPE` varchar(2) DEFAULT NULL,
  `ORG_IDS` varchar(320) DEFAULT NULL,
  `ORG_NAMES` varchar(320) DEFAULT NULL,
  `ORG_TYPES` varchar(320) DEFAULT NULL,
  `ORG_FLAG` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_right`
--

LOCK TABLES `urss_right` WRITE;
/*!40000 ALTER TABLE `urss_right` DISABLE KEYS */;
INSERT INTO `urss_right` VALUES ('00568FF4CFE949196F1F8B1D08CE9393','402881e52100d847012100ef56460035','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('02719E826C606012A3B7C3476B121EAF','402881e521017bd3012101881760001b','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('035D4450FB95F2C65A4AFA56F515E941','ff808081275ab3c001275ad8d7920062','ff808081275ab3c001275ad4f654004d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('0395C7B7DBACA29E20D5D5BF9B3BF491','ff808081275ab3c001275ad7544b005f','ff808081275ab3c001275ad4f654004d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('04312257AF39C01E09A4E6D822D7D9D8','402881e520336b820120337d421b0001','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('043EF28FCD95B4A001F90B296B348FFD','402881ee20240f7601202413822b0001','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('0446454B11E2D6DAFE2E4649EB6D2FDA','402881e52101d80b012101dac8ee000a','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('04808351BC7364D74BC0F5608BC09F30','ff808081275ab3c001275b70f64402f8','ff808081275ab3c001275b709e0802f4','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('04A166AA9403F784CEB72F60805451E9','402881e52110dfec01211106e871005a','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('06AC8EC4A66FE5A1E103AD4DB3E746B6','ff8080811922f6a901192416a9d2007a','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51de87700011de881532a0001','JS',NULL,NULL,NULL,NULL),('06C02E185C93455B623DF98119BA373E','402881e52101d80b012101d9b6a40007','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('09152C9C73520CB0A8157204A4A6CFEE','ff808081275ab3c001275b4a39d9024e','ff808081275ab3c001275b496530024a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('0B2B04D040E714121635B6E4779DD26E','402881e5204ade6b01204ae14f930001','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('0BA26806A99262FD1A718F608B5FE82E','ff808081275ab3c001275af72b0d00af','ff808081275ab3c001275af5c35900ab','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('0D10B5B5D1C7E7EF26D867C048E529AA','ff808081275ab3c001275b01d91300eb','ff808081275ab3c001275b00a07600e7','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('0D878B2343A0297CAACFBD14E82C14F6','402881e52110dfec01211109e2480067','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('0E6ABC84F52144CC5763737B0E336D45','402881e52101d80b012101dac8ee000a','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('0F2F24959213E52D4F7A19C375662891','402881e5204ade6b01204ae239560002','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('1018FD9B528ADB51211818967581155C','402881e520ff3f340120ff45ab920018','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('1AD50DAC579BB92E822CA825D32D0718','402881e521018ea40121018fa2f50003','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('1C937C0D0ABBD2A12EF00AC7BF0DD912','ff808081275ab3c001275b86d4210378','ff808081275ab3c001275b857a9d0371','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('1D9476EB3C9A3FEAC5E5AA3182450A2E','402881e5203da10201203da5f5f40001','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('1EC72A69231235F1266FD1B4BE945D1B','8a90247317b485ec0117b48b09950004','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('216A3AAD5C88D0BCFE7A3B353ABE5B7D','402881e52110dfec01211108b2d10063','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('25C4FA1C885FA7777982829045438347','402881e52110dfec012111062dbc0057','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('25DD3FE515582D60AD3461F4C0D279FE','402881e520241cb1012024292e910002','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('26008F18056C19F020C13AA1C8F6E1DA','ff808081275ab3c001275b906d4103a8','ff808081275ab3c001275b8fad6b03a4','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('27215691F45BA6B4CB5F54BEDD1031B4','402881e5217277eb01217280d065000f','402881e5217173bf01217175a3ba000c','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('27CFDD3449C8AC2FFF2FE1FF1E482EF6','402881e520cdb92a0120cdbe17860002','402881e520cdb92a0120cdbdb12b0001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('28E1FD77A5176643330FDCDF6253F8CB','402881ee20240f7601202413822b0001','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('2926A0ED6239832B35417010FC6A1F93','402881e5201eef7f01201ef35e350003','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('294F050F9DC6221C27960D70388ACA16','402881e52033a935012033bf75ad0002','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('2CA6584EB2FCA4A490A799B37F3A9064','ff80808117010a2f0117011972c20003','ff80808117010a2f0117011870070001','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('2E78382ACF10C1F91E3B32AB6B48CD10','402881e5210bed3e01210bff42de0092','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('2F77CEF1A565C75F9B19CDE3D1CA72CE','402881e520336b82012033896b630002','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('2FBAB537BD2575749135320545C201DD','402881e52027844901202786ff530002','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('3023D670C8D2D0A7AE2C6ACE00252456','402881e5201eef7f01201eefec110001','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('3529F2369DDC8E4558D44265C7CDCB7C','402881e520336b820120337d421b0001','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('373E31863CA22EABD399EC245DA75347','ff808081275ab3c001275b55f6b20296','ff808081275ab3c001275b54b76c0292','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('3765E404BC2B4D51B4B0A3AB20527E40','402881e5201eef7f01201ef1b3d10002','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('39886BF23DA7936E3B88551C50C9C973','402881e520ff3f340120ff489f6e002d','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('3A1B2B4E2A14D9BE50EA02432B759E92','8a90247317b485ec0117b48b09950004','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('3C76E45AB935E23FE592BC814D7FDB4A','402881e52101fe3401210202685d0007','402881e5201e7ea001201e93e4cd000b','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('3E691C7876B859E0979B4195DBAF7C66','402881e5210bed3e01210bf8998c004f','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('3EBFC83ECF814EADFF2C055E10B79DDC','402881e521017bd3012101881760001b','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('420FAEC6F6D1C060D29AEBF2C6039B2A','402881e52033a935012033be78bf0001','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('42E139A3D4F02222FB5F707F973283A0','ff808081275ab3c001275b7998e30325','ff808081275ab3c001275b78a2230321','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('4795AA348DA4BB4DED45ED8185F20C40','402881e5202cd8e601202ce77e610002','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('47FDDADB9F423ED44B8C402B339BB719','ff80808118bd90db0118bdacfa680033','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('4918D7274791F94CF5115385A8F68E99','402881ee20240f7601202421d3830002','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('4A4FC59D806B285201EFFE3F7C980090','402881e52101fe3401210203a1e7000b','402881e5201e7ea001201e93e4cd000b','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('4BEE4ED292BF724820E1625EF21F7F09','402881e5210bed3e01210bf71bb6004c','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('4FCE9905ABFD7715360FC8D780C00330','ff808081275ab3c001275b02bb3000ee','ff808081275ab3c001275b00a07600e7','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('50A4D0F2C2F5C64B746EFB87E9579BE6','402881e5201ea0f801201ee1c17b0004','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('5183B8594925B23627C0BD1B979B2227','402881e52101fe3401210203a1e7000b','402881e5201e7ea001201e93e4cd000b','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('519CF264FBCFC6F0A1C19C9D5EE1BDBD','402881e5217277eb0121727ee2be000b','402881e5217173bf01217175a3ba000c','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('5242FC3A45BB90C5EBE5EC79437218A4','ff80808118bd90db0118bdacfa680033','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51de87700011de881532a0001','JS',NULL,NULL,NULL,NULL),('524AB4EE12F1E7F3F1A7396A252EFFAB','ff808081275ab3c001275b7ab4660328','ff808081275ab3c001275b78a2230321','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('52BE295DFAD78C7BEA98B6E757DFE811','402881ee20240f760120242205220003','402881e5201e7ea001201e93e4cd000b','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('5379850C9712C212508145380B26F412','402881e5202737c001202740b9360001','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('53A8B735CEE06D1E3286D16AABB301FA','ff8080811922f6a901192416a9d2007a','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('5597C2F6816CCDDC56D1B7DF3C8AC48C','402881e520336b82012033a0a05e0005','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('57BF1EF9FF1DC6B9A35952E24C42FB71','ff808081275ab3c001275b2b1e3401c0','ff808081275ab3c001275b2a2b9f01bc','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('5876F8EDC27DE1846BDDB4F48872F3B1','402881e5201eef7f01201ef1b3d10002','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('59F9828E3F34FF55BFB6E10B3E5254C5','402881e520278449012027868cf20001','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('5B9C4EF6CD080E8BCD579AAAC8848404','402881e52129bb4c012129c25fca0016','402881e5201e7ea001201e8370a50003','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('5CECE09910BAB00BE659F5A215F7F3FF','ff808081275ab3c001275b8ae4e7038d','ff808081275ab3c001275b8914180386','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('5D35904E0AD62224728769579F2A04EF','402881ee20240f760120242329200004','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('5D3A97F0D894C59CDCADBBB916156D81','402881e520241cb10120242981f10003','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('5EF69080C9877585F7550E85A1E48F72','297e46552178367e0121783b2ca30015','402881e5217173bf01217175a3ba000c','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('5F0DFFB815FB9A926A639451CF0E49A6','402881e5204b016b01204b37c4720002','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('60E03220F0C9A370B41EF988BD039EB2','402881e5217d679d01217d688c2b000a','402881e5217173bf01217175a3ba000c','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('618C4FDE33B13E9742FA6F7CD706D49A','402881e5201ea0f801201edf64de0002','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('62F5EDEF4B9BF2D514DF53E4F4F1A538','402881e521017bd301210186cb390017','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('64A29F9F21AD871AF06BB5482DA0E8F5','ff808081275ab3c001275b6f806202ed','ff808081275ab3c001275b6e10c902e9','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('65BAFD5B9A6044AB694F89001CF9DC27','402881e52101d80b012101db64a2000e','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('661FF1115F84BFCE737AF8937FCD0A04','ff808081275ab3c001275b5f794e02c7','ff808081275ab3c001275b5e902702c3','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('66A34C4B658F820E15735E00EC8D1100','402881e520278449012027868cf20001','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('691031F932A2EEC1885E2F4B5765A247','ff808081275ab3c001275b378ec801e8','ff808081275ab3c001275b3599a001df','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6A07574EC3B3CFCB43EDCDE2971A4ED3','402881e52100d847012100e8d8970017','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6A89ABDAF3A7FE12A3B87678D9210AF6','402881e5201ea0f801201edf64de0002','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6BA6A4C3BCB08789C6924419458AF094','402881e52101cfdf012101d1e1160013','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6BB24E180F0380673BCD2D12EAF4AC25','402881e5217173bf01217176c6be0013','402881e5217173bf01217175a3ba000c','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6C104AFBAAB22B6ABBB1790E3C502394','402881e520ff3f340120ff44a4820014','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6CD568C33A2A9DC7CE6DB6C810B6B47A','402881e52101d80b012101dc0eec0011','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('6D4A3289DC544F2333DD475F169686D2','402881e520ff3f340120ff4723ab0025','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6E2A8C4EB57F91D5F6478D0292186C6A','402881e5203dd6b501203dd90f310001','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6EF0113AC25E95D322A49EFC4AF3810C','402881e52101d80b012101dc0eec0011','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6F26BCFFBB73EABC1175E88ECD1C832C','ff8080811928036a011928189746005d','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('6F80ED8AE808E3368B559D9A3E719296','402881e5217277eb0121728233fc0019','402881e5217173bf01217175a3ba000c','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('7453289D44A864ECE020FBA42C9B530A','402881e52100d847012100e970e0001b','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('75365606CD4E2C23C1C70368AB846021','402881e5203dc94c01203dc973090001','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('755A2C0B676A128D9FF66B373F575FEF','402881e52101cfdf012101d3bcea001b','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('7588A40C48F542C0A00F87429BC00D3D','402881e5204b016b01204b3832400003','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('75BE78A49B553B7EDD98C661A793274E','ff808081275ab3c001275b267a8101aa','ff808081275ab3c001275b24f78301a3','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('76D95EC29A16E3B81DF1AB5FA2F53027','ff80808117010a2f0117011a801b0004','ff80808117010a2f01170118d3170002','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('78B59031E7E476F3DF5B95F349587AD9','ff808081275ab3c001275af8043200b2','ff808081275ab3c001275af5c35900ab','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('78E6A4628A377273D62AC22D3365B71E','ff808081275ab3c001275b3c4b630205','ff808081275ab3c001275b3a840301fc','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('7CE80263C4432868CBBBB082B1C36C8C','ff80808127c22fb30127c234492c0002','ff808081275ab3c001275b6810ed02db','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('7D998A6AC20A483002B453C99DD281F2','8a90247317b485ec0117b488ea6f0002','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51de87700011de881532a0001','JS',NULL,NULL,NULL,NULL),('7E50AADA9EFEBCD7987A3D974412FEBC','402881e5210bed3e01210bf6793c0049','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('7EB2216E7F257261392BB94C8E9CCED0','402881e52101d80b012101d9b6a40007','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('801AC97B07A3E1D8AE1E89A9FF8BBD31','ff80808127c22fb30127c2329cb40001','ff808081275ab3c001275b6810ed02db','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('8040C316025E096A6BFF6044639137F2','402881e520ff3f340120ff45ab920018','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('8084622F28F79BF450755389C831B1E0','8a90247317b485ec0117b48a1a920003','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51de87700011de881532a0001','JS',NULL,NULL,NULL,NULL),('814DDFB63AFE25FB5D32266B790BC475','402881e520241cb101202428e3210001','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('8287DE1322B51843E2216BDCE1DDB060','ff808081275ab3c001275b910ab903ab','ff808081275ab3c001275b8fad6b03a4','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('875088FCF5FDB935E083A44D650AEA99','ff80808117010a2f0117011a801b0004','ff80808117010a2f01170118d3170002','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('87CE96E11091F78401405D03B37D2741','402881e521729c2e012172a0b232000a','402881e5217173bf01217175a3ba000c','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('892B1AEFEEE53CF6150305893CD952AA','402881e5203dac1c01203db3adcb0003','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('8A5A7C5367BE9794C41B779252CF3FC5','8a90247317b485ec0117b488ea6f0002','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('8B3357431B945CFA4606BC94CC64271B','402881e520cdb92a0120cdc9a74d0003','402881e520cdb92a0120cdbdb12b0001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('8C8E8EDA9FC395262F87D03168AEFE35','8a90247317b485ec0117b48b09950004','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51de87700011de881532a0001','JS',NULL,NULL,NULL,NULL),('8CE659D269BE3B56D104DB67240D9F25','ff8080811928036a011928189746005d','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('8E7A81CF1DB406BF8522633C14C68A1A','402881e5204ade6b01204ae239560002','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('8EB56A615AE2F5007DAA52D3962A0006','402881e5210bcba201210bd77db7002d','402881e520cdb92a0120cdbdb12b0001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('8F39D29BE0620AE43E1000DB3CBD444C','402881e521009d0f012100a2c1e70005','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('8F7CB7E0F9B157C9EE41ACFC9CE075AE','402881e52110dfec0121110e0a20006d','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('900A96BD58C60AD8209AE46A8B50F862','ff808081274d1b7f01274d2be4cb0025','ff808081274d1b7f01274d2a8d5f001f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('9049A36B26BB128B4C80DB0ADD1C034E','ff808081275ab3c001275b3f5f480216','ff808081275ab3c001275b3e835a0212','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('90B3D8B26287A5A625B1C32FCEF37065','402881e52100d847012100e7ed7c0013','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('90E77E5C13716001D6EC123BD324DCC1','ff808081275ab3c001275b8e7351039c','ff808081275ab3c001275b8d104b0395','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('914167D8B2374F9BFEC6C64DA77FE544','402881e52101fe3401210202685d0007','402881e5201e7ea001201e93e4cd000b','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('935D7E89941B453B1D0553DBAF10B754','402881e52101cfdf012101d282090017','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('960C846D355A999693BA7AFAB900D7F0','ff808081275ab3c001275b74bd860307','ff808081275ab3c001275b73e7ae0303','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('96508C6A3DE593A45066E77FA5B7B91C','ff808081275ab3c001275b527a49028d','ff808081275ab3c001275b51655d0289','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('96F1FEAA661425E539128B46403E6EEB','402881e5202737c001202740b9360001','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('97381575726FC548050053E9719621BE','402881e521017bd301210186cb390017','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('988AB2E7233AE3A9923B359492BDBDA8','402881e5201ea0f801201eeab9710006','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('98F1E8E1FD575BAFA31631CEA708CC83','ff808081275ab3c001275b36801c01e3','ff808081275ab3c001275b3599a001df','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('99E99F4D0B97B6745E80A72F41F3A732','402881e5204b016b01204b38d3df0004','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('9A5F37B6FD709C740F6CBDB8BCDFF0A2','402881e5201ea0f801201eeab9710006','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('9A8FA506CCE67F53A8530E14A3CA6784','402881e5201ea0f801201ee034ef0003','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('9B7151ABB31C012F541F7C4FAA960BE2','402881e52110dfec01211107ec25005f','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('9C293256ADE611532EE149541495E2DA','8a90247317b485ec0117b48a1a920003','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('9D308A5590528F3A76075CAA65FF8BE4','ff808081275ab3c001275b81be4b0357','ff808081275ab3c001275b817b560353','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('9F82DE0EB3CB5AB2ABAA8B03FA031F0E','402881e5202d082e01202d0fd8750002','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('A00205779348657ED3C95C9F2D4D23B2','ff808081275ab3c001275b211ebd018b','ff808081275ab3c001275b1cf2a1017a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('A13D6FBFA9EBE8B7143FC1340CBF6F63','ff808081275ab3c001275b40a63a0222','ff808081275ab3c001275b3e835a0212','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('A2FC12B56AB42059612E98B395F39243','402881e520ff3f340120ff4723ab0025','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('A392CBE242A0BE844527D6D04B8342BF','ff808081275ab3c001275b89d0b4038a','ff808081275ab3c001275b8914180386','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('A744C497144866813E1CA8C2A9DAAF65','ff808081275ab3c001275b864b680375','ff808081275ab3c001275b857a9d0371','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('A7AE057C6E3AD04F95848BB3E9CF6860','402881e52101cfdf012101d282090017','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('A860D5C56B1FAC72A0CBF0F2F3378690','402881e52100a676012100aa163f000d','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('AB7778345B2CD71BEA76ECEA2B5DEBC4','402881e5203dac1c01203db175bd0001','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('ADF49B4003A1C96755AAFF56478EE1BD','402881e520241cb10120242981f10003','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('B1C452D88BA383CF3DA27A2E50AF6DBD','402881e5201ea0f801201ee817fa0005','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('B498E8D83321F6FBE008EE835754A333','402881e5204ade6b01204ae14f930001','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('B558DB52D6694F1A81596CBA26A09140','402881e520241cb1012024292e910002','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('B5F41DD458AE6CC449154D7CE07B698D','ff8080811922f6a901192416a9d2007a','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('B75D3CC7ABEFDE1481E229A6A92D97A7','402881e520336b820120338b29bd0004','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('B770CF85B88630453D414CCD655002D7','402881e5203dac1c01203dc7d71c0004','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('B9A4BBF8E57CB78E2E6873BCA4C4F590','ff808081275ab3c001275b3b79590200','ff808081275ab3c001275b3a840301fc','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('B9B15269F3BE6AD600F897EC78ADB8B2','ff808081275ab3c001275b4d063c0263','ff808081275ab3c001275b4c37ef025f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('BA69B15D264D285765D73F6A2A6EE8CA','402881e521009d0f012100a2c1e70005','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('BA714E7D5CA3E31C4BA5C25F2065AE4B','402881e52101d80b012101db64a2000e','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('BAF5C6DBCD19B043A4F17A2923EC0B6F','ff808081275ab3c001275b7d4be60341','ff808081275ab3c001275b7c24750334','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('BCD8CE8DDFEEA8818D8D9A499EA7040F','ff80808118bd90db0118bdacfa680033','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('BD1DC54E9447C2506FC848AF331A38B3','402881e5203da10201203da5f5f40001','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('BE15752AF7A93EEB8AFC221D41C4A6A7','402881e521018ea40121018fa2f50003','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('BEA538AA431A6A38F2D37DB048FBAEF7','402881e5202d082e01202d0fd8750002','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('BED9CE38228094EB47245D7614B32EB3','ff808081275ab3c001275b2054000188','ff808081275ab3c001275b1cf2a1017a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('BEECC99479D85E777D95227D7D57AD7E','ff8080811928036a011928189746005d','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','402881e51de87700011de881532a0001','JS',NULL,NULL,NULL,NULL),('C088BF10BE48FC81345C9FA37EA99042','ff808081275ab3c001275b0b5d5b011e','ff808081275ab3c001275b09eaff0117','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('C3FB12C9485A4E75613E62CB5B185F97','402881e521018ea401210191d8d00018','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('C69F4B5F96BA2A5D9FB4DA4C472EFE93','402881e5210bcba201210bd6b4ca0029','402881e520cdb92a0120cdbdb12b0001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('C6E9E3AFEBA65A1A77C7E597DEDBF1A2','8a90247317b485ec0117b48a1a920003','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('C7A6FBC6D8648E997317B547F4E02681','402881e5201eef7f01201eefec110001','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('CA4416238691AF0BE66400394D5C61E1','402881e52101cfdf012101d1e1160013','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('CA54E0099DCC0893C3C4558F27AD8840','402881e5201ea0f801201ea26f370001','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('CC37D6CCA5FA68F83F904D5574DC2283','402881ee20240f760120242205220003','402881e5201e7ea001201e93e4cd000b','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('CC6FD5DE91AECF6F05E60BCE6E61ABF2','402881e5210115550121013b7b80002a','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('CCABC5BBF02F59674697D026EC6E6FFF','402881e5201ea0f801201ea26f370001','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('CEEEED5F8C52F4891B335FA1587EE2D7','402881ee20240f7601202421d3830002','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('D1468A82B83915835EBB20C029F487BB','ff808081275ab3c001275b757e09030a','ff808081275ab3c001275b73e7ae0303','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('D2EACBC38436960A8353D5671DF35FB3','402881e520ff3f340120ff489f6e002d','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('D36BA32F619E548A9D69E8C4157C48F2','402881e5217173bf01217177f76e001e','402881e5217173bf0121717772110018','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('D49F8038A4C8100A20E53B75DEC4A0CB','402881e5202cd8e601202ce77e610002','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('D5C45645FE564B9C428C9E13E605649A','402881e52027844901202786ff530002','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('D630940482069272C5B22AE6149094E6','ff808081275ab3c001275b2c4c0e01c3','ff808081275ab3c001275b2a2b9f01bc','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('D6BCCA236A4747C314E347BF2DDBF2CB','402881e5201e7ea001201e9ca3060011','402881e5201e7ea001201e8370a50003','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('D72A7D1EA0825FCDE26B3677A184363F','402881f0203e097001203e166ff50002','402881f0203e097001203e13de7d0001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('D82E97D7D3B9B991ABB708A657541EF1','402881e5203d551a01203d5d7ae60001','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('D8622C5A84376429B74D9295ED0C3F3F','402881e5201ea0f801201ee034ef0003','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('D95A510C6686444B73CA4D257348879D','402881e5201e7ea001201e9ca3060011','402881e5201e7ea001201e8370a50003','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('DA06766DA063F7F22789D9E5B4727A86','402881e5204b016b01204b373b1e0001','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('DBD5E6792F1E72C26666734DE0FA7695','402881e52100a676012100aa163f000d','402881e5201e7ea001201e8b695b0005','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('DBFB1E6C77DB95CA2B518B3684ECCC35','402881e520ff3f340120ff44a4820014','402881e5201e7ea001201e923df3000a','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('E0056138ADC5E1ED9F33993815915231','ff808081275ab3c001275b68e4b402df','ff808081275ab3c001275b6810ed02db','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('E08F4C1341FB00F54742EEC998F421A6','ff808081275ab3c001275b7dec7a0344','ff808081275ab3c001275b7c24750334','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('E11D2085E02A314A54B7B297ACB318EA','ff808081275ab3c001275b5bd18e02be','ff808081275ab3c001275b5af90202ba','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('E1A9B374EF8185B2BA98F0E4789B0A83','402881e52033a935012033c3f6050003','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('E45A15DEA9A6D14FB7B5B618F2C026A7','402881e5201eef7f01201ef35e350003','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('E4DB4C66B0121665768F9CF6D6B87D6A','402881e521018ea401210191d8d00018','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('E63FEC5CAF11D67AD99EBACFB583521C','402881e52101cfdf012101d3bcea001b','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('E64A49A85494BD7CC993D105291A8834','402881e5203dac1c01203db2a8af0002','402881e5201e7ea001201e95b6fd000e','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('E909A1C23A1F1DF8F067CBB5DB1995CD','402881e5210bcba201210bd00bb6000a','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('E950EC54D9635AEEBE2073E826BF231B','402881e520336b820120338a40470003','402881e5201e7ea001201e950428000d','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('E9F3456B672F6EA44B34486ED15AB443','ff808081275ab3c001275b25abdd01a7','ff808081275ab3c001275b24f78301a3','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('EA0B8A708F3448457963E9D1CD25A181','ff808081275ab3c001275b0aa61b011b','ff808081275ab3c001275b09eaff0117','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('EC1511FE9D0759CE4EADDBCA060CA026','402881e5201ea0f801201ee817fa0005','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('EE866FB8617C7810E324C3EFA66FDE32','ff808081275ab3c001275b47751b023f','ff808081275ab3c001275b46988d023b','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('F2A1D43745C5475C147DA96C1C99C890','402881e5210bcba201210bd00bb6000a','402881e5201e7ea001201e8e87730009','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('F3E4AC7E9528FB51AB38FADA96FF0940','ff808081275ab3c001275b8dd5410399','ff808081275ab3c001275b8d104b0395','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('F3FF17C269943233BD81070CCD67CFE1','402881ee20240f760120242329200004','402881e5201e7ea001201e8e1e490008','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('F723818DC5744298F86F6F948AEDEB6A','402881e5201ea0f801201ee1c17b0004','402881e5201e7ea001201e96a313000f','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('F79DF350951184AA0EC6F6378CEF0597','ff808081275ab3c001275b7fba3d034e','ff808081275ab3c001275b7f689e034a','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('F7EC0D84A177D3B857EB01BF0DE6A9B0','ff80808117010a2f0117011972c20003','ff80808117010a2f0117011870070001','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','',''),('FAA96D38657CB1055F8EA6375651DFA7','8a90247317b485ec0117b488ea6f0002','8a90247317b485ec0117b48838360001','ff80808116d8b9390116d8c47b4a0001','8873FA518265405763E919A125D540ED','YG',NULL,NULL,NULL,NULL),('FB631B9EC41AC2D17E77D04672123020','402881e520241cb101202429cdbf0004','402881e5201e7ea001201e8be0210006','ff80808116d8b9390116d8c47b4a0001','402881e51d2eea72011d2f01fed10001','JS','','','','');
/*!40000 ALTER TABLE `urss_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_role`
--

DROP TABLE IF EXISTS `urss_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_role` (
  `ROLE_ID` varchar(32) NOT NULL,
  `ROLE_NAME` varchar(32) NOT NULL,
  `APP_ID` varchar(32) NOT NULL,
  `COM_ID` varchar(32) NOT NULL,
  `IS_DELETE` varchar(2) NOT NULL,
  `SYSTEM_ID` varchar(2) NOT NULL,
  `ROLE_CODE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `FK_URSS_ROL_REFERENCE_URSS_APP` (`APP_ID`),
  CONSTRAINT `FK_URSS_ROL_REFERENCE_URSS_APP` FOREIGN KEY (`APP_ID`) REFERENCES `urss_app` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_role`
--

LOCK TABLES `urss_role` WRITE;
/*!40000 ALTER TABLE `urss_role` DISABLE KEYS */;
INSERT INTO `urss_role` VALUES ('402881e51d2eea72011d2f01fed10001','系统管理员','ff80808116d8b9390116d8c47b4a0001','402828701604fcd401160501e13a0002','N','Y','Admin'),('402881e51de87700011de881532a0001','一般员工','ff80808116d8b9390116d8c47b4a0001','402828701604fcd401160501e13a0002','N','N',NULL),('402881e5219c529501219c5393ca0007','仓库主管','ff80808116d8b9390116d8c47b4a0001','402828701604fcd401160501e13a0002','Y','N',''),('402881e5219c669101219c6808ba0007','配送员','ff80808116d8b9390116d8c47b4a0001','402828701604fcd401160501e13a0002','Y','N','');
/*!40000 ALTER TABLE `urss_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_role_org`
--

DROP TABLE IF EXISTS `urss_role_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_role_org` (
  `ROLE_ORG_ID` varchar(32) DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `CREATE_NAME` varchar(32) DEFAULT NULL,
  `CREATE_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `SYSTEM_IN` varchar(2) DEFAULT NULL,
  KEY `FK_URSS_ROL_REFERENCE_URSS_ORG` (`ORG_ID`),
  KEY `FK_URSS_ROL_REFERENCE_URSS_ROL` (`ROLE_ID`),
  CONSTRAINT `FK_URSS_ROL_REFERENCE_URSS_ORG` FOREIGN KEY (`ORG_ID`) REFERENCES `urss_org_tree` (`ORG_ID`),
  CONSTRAINT `FK_URSS_ROL_REFERENCE_URSS_ROL` FOREIGN KEY (`ROLE_ID`) REFERENCES `urss_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_role_org`
--

LOCK TABLES `urss_role_org` WRITE;
/*!40000 ALTER TABLE `urss_role_org` DISABLE KEYS */;
INSERT INTO `urss_role_org` VALUES ('402881e52024cbbf012024de101c0001','402881e51de87700011de881532a0001','AA9162568C12F6F1EF0E8D68CE8DD98A','刘正仁','ff8080811643731301164379f8630002','2010-11-23','Y'),('402881e52024cbbf012024de101c0002','402881e51de87700011de881532a0001','FC409474641EB0CF6CE03B29663E58BB','刘正仁','ff8080811643731301164379f8630002','2010-11-23','Y'),('402881e52024cbbf012024de101c0003','402881e51de87700011de881532a0001','2551C200700BA543BBF3F9445F80C098','刘正仁','ff8080811643731301164379f8630002','2010-11-23','Y'),('402881e520d8213e0120d82574a10001','402881e51de87700011de881532a0001','46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','8873FA518265405763E919A125D540ED','2010-11-23','Y'),('402881e52101a2d1012101a36d8b0007','402881e51d2eea72011d2f01fed10001','46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','8873FA518265405763E919A125D540ED','2010-11-23','Y'),('402881e52101ca61012101cba17a0005','402881e51d2eea72011d2f01fed10001','569E49C465E734651F7F4CFFE16160F6','刘正仁','8873FA518265405763E919A125D540ED','2010-11-23','Y'),('402881e52101cc41012101ccbc400001','402881e51d2eea72011d2f01fed10001','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','2010-11-23','Y');
/*!40000 ALTER TABLE `urss_role_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urss_user`
--

DROP TABLE IF EXISTS `urss_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urss_user` (
  `USER_ID` varchar(32) NOT NULL,
  `USER_CODE` varchar(32) DEFAULT NULL,
  `USER_EMAIL` varchar(32) DEFAULT NULL,
  `USER_FIXD_TEL` varchar(32) DEFAULT NULL,
  `USER_MOVE_TEL` varchar(32) DEFAULT NULL,
  `LOGIN_ID` varchar(32) NOT NULL,
  `PWD` varchar(32) NOT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urss_user`
--

LOCK TABLES `urss_user` WRITE;
/*!40000 ALTER TABLE `urss_user` DISABLE KEYS */;
INSERT INTO `urss_user` VALUES ('402881e51d3e2ac2011d3e32242c0001',NULL,NULL,NULL,NULL,'lzr','21218cca77804d2ba1922c33e0151105','402828701604fcd401160501e13a0002','刘正仁'),('402881e51d3e2ac2011d3e32822b0002',NULL,NULL,NULL,NULL,'wm','21218cca77804d2ba1922c33e0151105','402828701604fcd401160501e13a0002','王敏'),('402881e51d3e2ac2011d3e32d1e10003',NULL,NULL,NULL,NULL,'lyj','21218cca77804d2ba1922c33e0151105','402828701604fcd401160501e13a0002','林颖军'),('402881e51d3e2ac2011d3e33137e0004',NULL,NULL,NULL,NULL,'zxs','21218cca77804d2ba1922c33e0151105','402828701604fcd401160501e13a0002','周旭顺'),('402881e5202cd8e601202ce416210001',NULL,NULL,NULL,NULL,'gggg','21218cca77804d2ba1922c33e0151105','402828701604fcd401160501e13a0002','张三'),('402881e5202d082e01202d0a49da0001',NULL,NULL,NULL,NULL,'hhh','21218cca77804d2ba1922c33e0151105','402828701604fcd401160501e13a0002','张三');
/*!40000 ALTER TABLE `urss_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_activity`
--

DROP TABLE IF EXISTS `wfss_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_activity` (
  `ACTIVITY_ID` varchar(32) NOT NULL,
  `PROCESS_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(320) DEFAULT NULL,
  `ACTIVITY_ALIAS` varchar(32) DEFAULT NULL,
  `APP_FORM_ID` varchar(32) DEFAULT NULL,
  `SPLIT_MODE` varchar(4) DEFAULT NULL,
  `SPLIT_STRATEGY` varchar(32) DEFAULT NULL,
  `SPLIT_ID` varchar(32) DEFAULT NULL,
  `JOIN_MODE` varchar(32) DEFAULT NULL,
  `JOIN_STRATEGY` varchar(32) DEFAULT NULL,
  `JOIN_ID` varchar(32) DEFAULT NULL,
  `OPERATE_MODE` varchar(32) DEFAULT NULL,
  `OPERATION` varchar(320) DEFAULT NULL,
  `OPERATE_STRATEGY` varchar(32) DEFAULT NULL,
  `IS_FIRST_NODE` varchar(32) DEFAULT NULL,
  `ON_START_EVENT` varchar(32) DEFAULT NULL,
  `ON_COMPLETE_EVENT` varchar(32) DEFAULT NULL,
  `EDIT_FIELDS` varchar(3200) DEFAULT NULL,
  `NOT_NULL_FIELDS` varchar(3200) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `EDIT_FIELDS_NAME` varchar(3200) DEFAULT NULL,
  `NOT_NULL_FIELDS_NAME` varchar(3200) DEFAULT NULL,
  `START_PROCESS` varchar(4) DEFAULT NULL,
  `ATTACH_PRIVILEGE` varchar(20) DEFAULT NULL,
  `ATTACH_TYPE` varchar(20) DEFAULT NULL,
  `IS_BATCH` varchar(20) DEFAULT NULL,
  `NOTIFY_TYPE` varchar(20) DEFAULT NULL,
  `ATTACH_TYPE_DYNAMIC` varchar(20) DEFAULT NULL,
  `ATTACH_TYPE_VALUE_MODE` varchar(20) DEFAULT NULL,
  `PROCESS_BUTTON_MODE` varchar(20) DEFAULT NULL,
  `INIT_FORM_EVENT` varchar(50) DEFAULT NULL,
  `BACK_FORM_EVENT` varchar(50) DEFAULT NULL,
  `RE_DO_EVENT` varchar(50) DEFAULT NULL,
  `ROUTE_SPLIT_ID` varchar(5) DEFAULT NULL,
  `JOIN_STRATEGY_BACK` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_ID`),
  KEY `FK_WFSS_ACT_REFERENCE_WFSS_PRO` (`PROCESS_ID`),
  CONSTRAINT `FK_WFSS_ACT_REFERENCE_WFSS_PRO` FOREIGN KEY (`PROCESS_ID`) REFERENCES `wfss_process` (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_activity`
--

LOCK TABLES `wfss_activity` WRITE;
/*!40000 ALTER TABLE `wfss_activity` DISABLE KEYS */;
INSERT INTO `wfss_activity` VALUES ('297e4ced22469c7c012246b798470010','297e4ced22469c7c012246b79847000f','员工审请','PROCESS_TEST2_A2','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'Y',NULL,NULL,'textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('297e4ced22469c7c012246b798760013','297e4ced22469c7c012246b79847000f','顺序会签环节','PROCESS_A3','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'LOOP',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('297e4ced22469c7c012246b798760019','297e4ced22469c7c012246b79847000f','总经理审核','PROCESS_A4','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('297e4ced22469c7c012246b79902001f','297e4ced22469c7c012246b79847000f','流程结束','PROCESS_A5','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('297e4ced22469c7c012246b799120020','297e4ced22469c7c012246b79847000f','经理审批','PROCESS_A2','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'1','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2c92897a18baf3c30118bafc9cba000a','ff808081178d304d01178d45e73a0001','流程结束','a8','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'7','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e51d723d5e011d7245035c0002','402881f0199a24d401199a2832d20002','建维部、分公司主管、各施工队会签','z',NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'2','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,NULL,NULL,NULL,'EMAIL','N','VALUE','ALL_ROUTE',NULL,NULL,NULL,NULL,NULL),('402881e51d723d5e011d724633210004','402881f0199a24d401199a2832d20002','流程结束','s',NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'3','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e520045b74012004607d870002','402881f0199a24d401199a2832d20002','抱杆回单','o',NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'3','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ALL_ROUTE',NULL,NULL,NULL,NULL,NULL),('402881e5212aaa2d01212abe7174001d','ff808081178d304d01178d45e73a0001','分支环节测试1','a','402881e5212ff4a901212ff62332000b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,'name','name','0','ff80808116d8b9390116d8c47b4a0001','名称(name)','名称(name)',NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initBranchForm1',NULL,NULL,NULL,NULL),('402881e5212aaa2d01212abed81d0022','ff808081178d304d01178d45e73a0001','分支环节测试2','b','402881e5212ff4a901212ff6d4cf0015','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,'name','name','0','ff80808116d8b9390116d8c47b4a0001','名称(name)','名称(name)',NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initBranchForm2',NULL,NULL,NULL,NULL),('402881e521354f68012135580e540036','ff808081178d304d01178d45e73a0001','分支环节测试1_1','q','402881e5212ff4a901212ff62332000b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e5213a45bf01213a47682c000c','ff808081178d304d01178d45e73a0001','分支环节测试2_2','w','402881e5212ff4a901212ff6d4cf0015','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e5213a45bf01213a4c2956001e','ff808081178d304d01178d45e73a0001','聚合A环节','p','ff808081178cf67e01178d0259960009','OR',NULL,'B','AND',NULL,'A','XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initJoinA',NULL,NULL,NULL,NULL),('402881e5216358880121635d7e9b000d','ff808081178d304d01178d45e73a0001','单路由分单---主','jjj','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e5216366a101216369898d0015','ff808081178d304d01178d45e73a0001','单路由分单环节--一个表单生成多个','n','402881e5212ff4a901212ff62332000b','XOR',NULL,NULL,'XOR',NULL,NULL,'LYHD',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','routeSplitInitBranchForm',NULL,NULL,'C',NULL),('402881e52163b9c9012163bf2cc50012','ff808081178d304d01178d45e73a0001','各走各的单路由分单---环节','h','402881e5212ff4a901212ff62332000b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52163b9c9012163c7203b003e','ff808081178d304d01178d45e73a0001','单路由分单---聚合C','i','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,'C','XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initJoinA',NULL,NULL,NULL,NULL),('402881e521827a060121827aa4da0007','402881f0199a24d401199a2832d20002','填写抱杆单','JJJJ','ff808081178cf67e01178d0259960009','XOR',NULL,'BB','XOR',NULL,'MMMMM','XOR','KJHJK',NULL,'Y','KJKJ',NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e521827a060121827aa4da0009','402881f0199a24d401199a2832d20002','建维部、分公司主管、各施工队会签','k',NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'2','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,NULL,NULL,NULL,'EMAIL','N','VALUE','ALL_ROUTE',NULL,NULL,NULL,NULL,NULL),('402881e521827a060121827aa4ea000c','402881f0199a24d401199a2832d20002','抱杆回单','l',NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'3','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ALL_ROUTE',NULL,NULL,NULL,NULL,NULL),('402881e521827a060121827aa4ea000f','402881f0199a24d401199a2832d20002','流程结束','m',NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'3','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e521827a060121827bd6270010','ff8080811922f6a901192408d490005c','员工审请','PROCESS_TEST3_A1','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'Y',NULL,NULL,'textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','textDemo,selectDemo,dateDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo)','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e521827a060121827bd6270013','ff8080811922f6a901192408d490005c','总经理审核','PROCESS_TEST3_A4','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e521827a060121827bd6270015','ff8080811922f6a901192408d490005c','经理审批','PROCESS_TEST3_A2','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'1','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e521827a060121827bd6270017','ff8080811922f6a901192408d490005c','多个消息一人处理','PROCESS_TEST3_A3','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'OR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'2','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e521827a060121827bd6270019','ff8080811922f6a901192408d490005c','流程结束','PROCESS_TEST3_A5','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'4','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2a8cc0006','402881e52191b22b012191b2a8ad0005','分支环节测试1','a','402881e52191b22b012191b2adae005b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,'name','name','0','ff80808116d8b9390116d8c47b4a0001','名称(name)','名称(name)',NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initBranchForm1',NULL,NULL,NULL,NULL),('402881e52191b22b012191b2a90a000c','402881e52191b22b012191b2a8ad0005','分支环节测试2','b','402881e52191b22b012191b2adae005d','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,'name','name','0','ff80808116d8b9390116d8c47b4a0001','名称(name)','名称(name)',NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initBranchForm2',NULL,NULL,NULL,NULL),('402881e52191b22b012191b2a9390012','402881e52191b22b012191b2a8ad0005','全部聚合--环节2','c','402881e52191b22b012191b2adae005d','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initBranchForm2',NULL,NULL,NULL,NULL),('402881e52191b22b012191b2a9490015','402881e52191b22b012191b2a8ad0005','全部聚合--环节1','d','402881e52191b22b012191b2adae005b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initBranchForm1',NULL,NULL,NULL,NULL),('402881e52191b22b012191b2a9870018','402881e52191b22b012191b2a8ad0005','全部聚合--环节1_1','e','402881e52191b22b012191b2adae005b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2a997001b','402881e52191b22b012191b2a8ad0005','全部聚合--环节2_2','f','402881e52191b22b012191b2adae005d','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2a9a7001e','402881e52191b22b012191b2a8ad0005','全部聚合B','g','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'AND',NULL,'B','XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initJoinA',NULL,NULL,NULL,NULL),('402881e52191b22b012191b2a9d60022','402881e52191b22b012191b2a8ad0005','各走各的单路由分单---环节','h','402881e52191b22b012191b2adae005b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2aa140025','402881e52191b22b012191b2a8ad0005','单路由分单---聚合C','i','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,'C','XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initJoinA',NULL,NULL,NULL,NULL),('402881e52191b22b012191b2aa330027','402881e52191b22b012191b2a8ad0005','站址谈判','a4','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,'textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','Y','EDIT_OWN',NULL,NULL,NULL,NULL,NULL,'ALL_ROUTE',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2aa43002e','402881e52191b22b012191b2a8ad0005','单路由分单---主','jjj','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2aa720031','402881e52191b22b012191b2a8ad0005','单路由分单环节--一个表单生成多个','n','402881e52191b22b012191b2adae005b','XOR',NULL,'','XOR','','','LYHD','','','N','','','','','0','ff80808116d8b9390116d8c47b4a0001','','',NULL,'NONE','','N','EMAIL','N','VALUE','ONLY_SUBMIT','routeSplitInitBranchForm','','','C',''),('402881e52191b22b012191b2aa910037','402881e52191b22b012191b2a8ad0005','分支环节测试1_1','q','402881e52191b22b012191b2adae005b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2aadf003a','402881e52191b22b012191b2a8ad0005','分支环节测试2_2','w','402881e52191b22b012191b2adae005d','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2aaef003d','402881e52191b22b012191b2a8ad0005','聚合A环节','p','402881e52191b22b012191b2ad600055','OR',NULL,'B','AND',NULL,'A','XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initJoinA',NULL,NULL,NULL,NULL),('402881e52191b22b012191b2ab0e0041','402881e52191b22b012191b2a8ad0005','网建部录入数据','test_activity','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR','CTL',NULL,'Y','extText',NULL,'selectDemo,dateDemo,checkBoxDemo,radioBoxDemo,textDemo','selectDemo,dateDemo,checkBoxDemo,radioBoxDemo,textDemo','0','ff80808116d8b9390116d8c47b4a0001','下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo),基站名称(textDemo)','下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo),基站名称(textDemo)','Y','EDIT_OWN','sex','N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2ab0e0043','402881e52191b22b012191b2a8ad0005','设计院、运维部网优中心、县分人员并行传签','test2_activity','402881e52191b22b012191b2ad600055','OR',NULL,'A','XOR',NULL,NULL,'XOR','CTL,LTZF,TJ,JTRQL,LTGQ',NULL,'N',NULL,NULL,'textDemo,selectDemo,dateDemo','textDemo,selectDemo,dateDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo)','Y','VIEW',NULL,'Y','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2ab5c004c','402881e52191b22b012191b2a8ad0005','网建部、运维部网优中心、县分人员并行会签','activity3','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'AND',NULL,NULL,'N',NULL,NULL,NULL,NULL,'1','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'Y','VIEW',NULL,NULL,NULL,'N','VALUE','ALL_ROUTE',NULL,NULL,NULL,NULL,NULL),('402881e52191b22b012191b2ab7b0054','402881e52191b22b012191b2a8ad0005','流程结束','a8','402881e52191b22b012191b2ad600055','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'7','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('402881e52196c13d012196cae532003b','ff808081178d304d01178d45e73a0001','全部聚合--环节2','c','402881e5212ff4a901212ff6d4cf0015','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initBranchForm2',NULL,NULL,NULL,NULL),('402881e52196c13d012196cb5eb80041','ff808081178d304d01178d45e73a0001','全部聚合--环节1','d','402881e5212ff4a901212ff62332000b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initBranchForm1',NULL,NULL,NULL,NULL),('402881e52196c13d012196ce64d30072','ff808081178d304d01178d45e73a0001','全部聚合--环节1_1','e','402881e5212ff4a901212ff62332000b','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52196c13d012196cec4a70077','ff808081178d304d01178d45e73a0001','全部聚合--环节2_2','f','402881e5212ff4a901212ff6d4cf0015','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('402881e52196c13d012196cf4b7a007c','ff808081178d304d01178d45e73a0001','全部聚合B','g','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'AND',NULL,'B','XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,'NONE',NULL,'N','EMAIL','N','VALUE','ONLY_SUBMIT','initJoinA',NULL,NULL,NULL,NULL),('402881f0199a24d401199a2962d60003','402881f0199a24d401199a2832d20002','填写抱杆单','JJJJ','ff808081178cf67e01178d0259960009','XOR',NULL,'BB','XOR',NULL,'MMMMM','XOR','KJHJK',NULL,'Y','KJKJ',NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8a90247317b150a30117b16b20da0002','ff808081178d304d01178d45e73a0001','设计院、运维部网优中心、县分人员并行传签','test2_activity','ff808081178cf67e01178d0259960009','OR',NULL,'A','XOR',NULL,NULL,'XOR','CTL,LTZF,TJ,JTRQL,LTGQ',NULL,'N',NULL,NULL,'textDemo,selectDemo,dateDemo','textDemo,selectDemo,dateDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo)','Y','VIEW',NULL,'Y','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('8a90247317b150a30117b16d1c7b0003','ff808081178d304d01178d45e73a0001','网建部、运维部网优中心、县分人员并行会签','activity3','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'AND',NULL,NULL,'N',NULL,NULL,NULL,NULL,'1','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'Y','VIEW',NULL,NULL,NULL,'N','VALUE','ALL_ROUTE',NULL,NULL,NULL,NULL,NULL),('8a90247317b150a30117b16db07d0004','ff808081178d304d01178d45e73a0001','站址谈判','a4','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,'textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','Y','EDIT_OWN',NULL,NULL,NULL,NULL,NULL,'ALL_ROUTE',NULL,NULL,NULL,NULL,NULL),('ff8080811797373f011797429d6b0002','ff8080811797373f01179739bb010001','事件登记','event_create','ff808081178cf67e01178d02155a0008','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'Y',NULL,NULL,'dfdsfdsf,fsdfdsf','dfdsfdsf,fsdfdsf','1','ff808081178cd5fc01178cedc43d0001','测试１(dfdsfdsf),测试２(fsdfdsf)','测试１(dfdsfdsf),测试２(fsdfdsf)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff808081179cf63c01179cf9fa830001','ff808081178d304d01178d45e73a0001','网建部录入数据','test_activity','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR','CTL',NULL,'Y','extText',NULL,'selectDemo,dateDemo,checkBoxDemo,radioBoxDemo,textDemo','selectDemo,dateDemo,checkBoxDemo,radioBoxDemo,textDemo','0','ff80808116d8b9390116d8c47b4a0001','下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo),基站名称(textDemo)','下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo),基站名称(textDemo)','Y','NONE','sex','N','EMAIL','N','VALUE','ONLY_SUBMIT',NULL,NULL,NULL,NULL,NULL),('ff80808118bd90db0118bda1f8690018','ff80808118bd90db0118bda0936b0017','员工审请','PROCESS_TEST2_A2','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'Y',NULL,NULL,'textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff80808118bd90db0118bda3ea75001a','ff80808118bd90db0118bda0936b0017','经理审批','PROCESS_A2','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'1','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff80808118bd90db0118bda590360020','ff80808118bd90db0118bda0936b0017','顺序会签环节','PROCESS_A3','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'LOOP',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff80808118bd90db0118bda76e1e0026','ff80808118bd90db0118bda0936b0017','总经理审核','PROCESS_A4','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff80808118bd90db0118bda8bd910030','ff80808118bd90db0118bda0936b0017','流程结束','PROCESS_A5','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff8080811922f6a90119240a3a2b005d','ff8080811922f6a901192408d490005c','员工审请','PROCESS_TEST3_A1','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'Y',NULL,NULL,'textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','textDemo,selectDemo,dateDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo)','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff8080811922f6a90119240b15390062','ff8080811922f6a901192408d490005c','经理审批','PROCESS_TEST3_A2','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'1','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff8080811922f6a90119240bec11006b','ff8080811922f6a901192408d490005c','多个消息一人处理','PROCESS_TEST3_A3','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'OR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'2','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff8080811922f6a90119240d17910070','ff8080811922f6a901192408d490005c','总经理审核','PROCESS_TEST3_A4','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'0','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff8080811922f6a90119240dba870072','ff8080811922f6a901192408d490005c','流程结束','PROCESS_TEST3_A5','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'4','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ff8080811928036a01192812e0710048','ff8080811928036a011928120f750047','员工审请','PROCESS_TEST4_A1','ff808081178cf67e01178d0259960009','XOR',NULL,'','XOR','','','XOR','','','N','','','textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','textDemo,selectDemo,dateDemo,checkBoxDemo,radioBoxDemo','0','ff80808116d8b9390116d8c47b4a0001','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)','文本框(textDemo),下拉框(selectDemo),日期框(dateDemo),多选框(checkBoxDemo),单选框(radioBoxDemo)',NULL,NULL,'','N','NOTE','N',NULL,'ONLY_SUBMIT','','','','',''),('ff8080811928036a01192813cee80049','ff8080811928036a011928120f750047','经理审批','PROCESS_TEST4_A2','ff808081178cf67e01178d0259960009','XOR',NULL,'','XOR','','','XOR','','','N','','','','','1','ff80808116d8b9390116d8c47b4a0001','','',NULL,'EDIT_ALL','',NULL,NULL,NULL,NULL,'ALL_ROUTE','','','','',''),('ff8080811928036a01192814b272004e','ff8080811928036a011928120f750047','并行会签','PROCESS_TEST4_A3','ff808081178cf67e01178d0259960009','XOR',NULL,'','XOR','','','AND','LTZF,CTL,TJ,JTRQL,LTGQ','','N','','','','','2','ff80808116d8b9390116d8c47b4a0001','','',NULL,'EDIT_OWN','','N',NULL,'N',NULL,'ONLY_SUBMIT','','','','',''),('ff8080811928036a011928156a680053','ff8080811928036a011928120f750047','总经理审核','PROCESS_TEST4_A4','ff808081178cf67e01178d0259960009','XOR',NULL,'','XOR','','','XOR','LTZF,CTL,TJ,JTRQL,LTGQ','','N','','','','','3','ff80808116d8b9390116d8c47b4a0001','','',NULL,'EDIT_OWN','','N','NOTE','N',NULL,'ONLY_SUBMIT','','','','',''),('ff8080811928036a01192815db230058','ff8080811928036a011928120f750047','流程结束','PROCESS_TEST4_A5','ff808081178cf67e01178d0259960009','XOR',NULL,NULL,'XOR',NULL,NULL,'XOR',NULL,NULL,'N',NULL,NULL,NULL,NULL,'4','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wfss_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_activity_button`
--

DROP TABLE IF EXISTS `wfss_activity_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_activity_button` (
  `ACT_BUT_ID` varchar(32) NOT NULL,
  `BUTTON_STYLE_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `BUTTON_NAME` varchar(32) DEFAULT NULL,
  `EXT_JAVA` varchar(32) DEFAULT NULL,
  `JS_METHOD` varchar(32) DEFAULT NULL,
  `BUTTON_POSITION` varchar(32) DEFAULT NULL,
  `BUTTON_GROUP` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ACT_BUT_ID`),
  KEY `FK_WFSS_ACT_REFERENCE_WFSS_ACT` (`ACTIVITY_ID`),
  CONSTRAINT `FK_WFSS_ACT_REFERENCE_WFSS_ACT` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `wfss_activity` (`ACTIVITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_activity_button`
--

LOCK TABLES `wfss_activity_button` WRITE;
/*!40000 ALTER TABLE `wfss_activity_button` DISABLE KEYS */;
/*!40000 ALTER TABLE `wfss_activity_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_activity_instance`
--

DROP TABLE IF EXISTS `wfss_activity_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_activity_instance` (
  `ACTIVITY_INSTANCE_ID` varchar(32) NOT NULL,
  `PARENT_ACTIVITY_INST_ID` varchar(32) DEFAULT NULL,
  `PROCESS_INSTANCE_ID` varchar(32) DEFAULT NULL,
  `PROCESS_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(640) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  `NOTIFY_ORG_IDS` varchar(320) DEFAULT NULL,
  `NOTIFY_ORG_NAMES` varchar(320) DEFAULT NULL,
  `EXECUTOR_ID` varchar(32) DEFAULT NULL,
  `EXECUTOR_NAME` varchar(32) DEFAULT NULL,
  `STATUS` varchar(8) DEFAULT NULL,
  `COMPLETE_DATE` date DEFAULT NULL,
  `EXECUTE_MSG` varchar(640) DEFAULT NULL,
  `TO_ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `TO_ACTIVITY_NAME` varchar(640) DEFAULT NULL,
  `SHOW_ORDER` decimal(10,0) DEFAULT NULL,
  `SUBMIT_STATUS` varchar(8) DEFAULT NULL,
  `WANT_TO_ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `SPLIT_IDS` varchar(32) DEFAULT NULL,
  `IS_AGENTED_ORG_ID` varchar(32) DEFAULT NULL,
  `IS_AGENTED_ORG_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ACTIVITY_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_activity_instance`
--

LOCK TABLES `wfss_activity_instance` WRITE;
/*!40000 ALTER TABLE `wfss_activity_instance` DISABLE KEYS */;
INSERT INTO `wfss_activity_instance` VALUES ('402881e63a554ae9013a556aece40003',NULL,'402881e63a554ae9013a556aece40002','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','402881e63a554ae9013a556aecc40001','2012-10-12','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','YB','2012-10-12','dfgfdg',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('402881e63a554ae9013a556aece40005','402881e63a554ae9013a556aece40003','402881e63a554ae9013a556aece40002','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','402881e63a554ae9013a556aecc40001','2012-10-12','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('402881e63a597d59013a5a3896890002','ff808081272c6fcc01272c8b78170018','ff808081272c6fcc01272c8b780d0015','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081272c6fcc01272c8b780d0014','2012-10-13','8873FA518265405763E919A125D540ED','刘正仁','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','DB',NULL,NULL,'8a90247317b150a30117b16db07d0004','站址谈判','0','TJ',NULL,NULL,NULL,NULL),('402881e63a597d59013a5a39a1900006',NULL,'402881e63a597d59013a5a39a1900005','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','402881e63a597d59013a5a39a1900004','2012-10-13','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2012-10-13','eweweewe',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('402881e63a597d59013a5a39a1900008','402881e63a597d59013a5a39a1900006','402881e63a597d59013a5a39a1900005','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','402881e63a597d59013a5a39a1900004','2012-10-13','8873FA518265405763E919A125D540ED','刘正仁','FC409474641EB0CF6CE03B29663E58BB','林颖军','DB',NULL,NULL,'8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('402881ea289eeba501289eed8aee0003',NULL,'402881ea289eeba501289eed8aee0002','ff8080811928036a011928120f750047','ff8080811928036a01192812e0710048','员工审请','402881ea289eeba501289eed8ade0001','2010-05-16','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-16','请尽快处理',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('402881ea289eeba501289eed8aee0005','402881ea289eeba501289eed8aee0003','402881ea289eeba501289eed8aee0002','ff8080811928036a011928120f750047','ff8080811928036a01192812e0710048','员工审请','402881ea289eeba501289eed8ade0001','2010-05-16','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-16','提交并行会签','ff8080811928036a01192813cee80049','经理审批','0','TJ',NULL,'',NULL,NULL),('402881ea289eeba501289eee48a00008','402881ea289eeba501289eed8aee0005','402881ea289eeba501289eed8aee0002','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','经理审批','402881ea289eeba501289eed8ade0001','2010-05-16','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'ff8080811928036a01192814b272004e','并行会签','0','TJ',NULL,'',NULL,NULL),('402881ea289eeba501289eee48a0000a','402881ea289eeba501289eed8aee0005','402881ea289eeba501289eed8aee0002','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','经理审批','402881ea289eeba501289eed8ade0001','2010-05-16','8873FA518265405763E919A125D540ED','刘正仁','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','DB',NULL,NULL,'ff8080811928036a01192814b272004e','并行会签','1','TJ',NULL,'',NULL,NULL),('402881ea289eeba501289eee48a0000c','402881ea289eeba501289eed8aee0005','402881ea289eeba501289eed8aee0002','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','经理审批','402881ea289eeba501289eed8ade0001','2010-05-16','8873FA518265405763E919A125D540ED','刘正仁','FC409474641EB0CF6CE03B29663E58BB','林颖军','DB',NULL,NULL,'ff8080811928036a01192814b272004e','并行会签','2','TJ',NULL,'',NULL,NULL),('402881ea289eeba501289eee48a0000e','402881ea289eeba501289eed8aee0005','402881ea289eeba501289eed8aee0002','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','经理审批','402881ea289eeba501289eed8ade0001','2010-05-16','8873FA518265405763E919A125D540ED','刘正仁','2551C200700BA543BBF3F9445F80C098','周旭顺','DB',NULL,NULL,'ff8080811928036a01192814b272004e','并行会签','3','TJ',NULL,'',NULL,NULL),('402881fa2cd5fbb0012cd5fd97830003',NULL,'402881fa2cd5fbb0012cd5fd97830002','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','402881fa2cd5fbb0012cd5fd97830001','2010-12-11','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-12-11','gfdsf',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('402881fa2cd5fbb0012cd5fd97830005','402881fa2cd5fbb0012cd5fd97830003','402881fa2cd5fbb0012cd5fd97830002','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','402881fa2cd5fbb0012cd5fd97830001','2010-12-11','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('ff80808126a75e580126a769f6580021',NULL,'ff80808126a75e580126a769f6580020','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff80808126a75e580126a769f655001f','2010-02-07','46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','YB','2010-02-07','ggggg',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff80808126a75e580126a769f6590023','ff80808126a75e580126a769f6580021','ff80808126a75e580126a769f6580020','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff80808126a75e580126a769f655001f','2010-02-07','46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('ff80808126a75e580126a7a497f10098',NULL,'ff80808126a75e580126a7a497f10097','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff80808126a75e580126a7a497f10096','2010-02-07','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-02-07','',NULL,NULL,'0',NULL,'','',NULL,NULL),('ff80808126a7b2470126a7b3f2f9000c','ff80808126a75e580126a7a497f10098','ff80808126a75e580126a7a497f10097','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff80808126a75e580126a7a497f10096','2010-02-07','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-02-24','yyyy','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ','','',NULL,NULL),('ff80808126ffc6c00126ffcef4150008',NULL,'ff80808126ffc6c00126ffcef4150007','ff8080811922f6a901192408d490005c','402881e521827a060121827bd6270010','员工审请','ff80808126ffc6c00126ffcef40f0006','2010-02-24','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff80808126ffc6c00126ffcfe333000f',NULL,'ff80808126ffc6c00126ffcfe333000e','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff80808126ffc6c00126ffcfe333000d','2010-02-24','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-02-24','',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff80808126ffc6c00126ffcfe3350011','ff80808126ffc6c00126ffcfe333000f','ff80808126ffc6c00126ffcfe333000e','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff80808126ffc6c00126ffcfe333000d','2010-02-24','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-15','bbb','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('ff80808127002c3b0127002cc1d70003','ff80808126a7b2470126a7b3f2f9000c','ff80808126a75e580126a7a497f10097','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff80808127002c3b0127002cc1d60002','2010-02-24','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-03-14','','402881e5212aaa2d01212abed81d0022','分支环节测试2','0','TJ',NULL,'A',NULL,NULL),('ff808081272c6fcc01272c8b780d0016',NULL,'ff808081272c6fcc01272c8b780d0015','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081272c6fcc01272c8b780d0014','2010-03-05','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-03-05','',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff808081272c6fcc01272c8b78170018','ff808081272c6fcc01272c8b780d0016','ff808081272c6fcc01272c8b780d0015','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081272c6fcc01272c8b780d0014','2010-03-05','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2012-10-13','fdfdffdf','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ','','',NULL,NULL),('ff808081272c6fcc01272c9cab180038',NULL,'ff808081272c6fcc01272c9cab180037','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081272c6fcc01272c9cab180036','2010-03-05','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-03-05','',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff808081272c6fcc01272c9cab28003a','ff808081272c6fcc01272c9cab180038','ff808081272c6fcc01272c9cab180037','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081272c6fcc01272c9cab180036','2010-03-05','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-03-05','','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('ff808081272c6fcc01272c9e17920040','ff808081272c6fcc01272c9cab28003a','ff808081272c6fcc01272c9cab180037','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081272c6fcc01272c9e1792003f','2010-03-05','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'402881e5212aaa2d01212abe7174001d','分支环节测试1','0','TJ',NULL,'A',NULL,NULL),('ff808081272e37bf01272e4bed1c000c',NULL,'ff808081272e37bf01272e4bed1c000b','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081272e37bf01272e4bed14000a','2010-03-05','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-03-05','',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff808081272e37bf01272e4bed20000e','ff808081272e37bf01272e4bed1c000c','ff808081272e37bf01272e4bed1c000b','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081272e37bf01272e4bed14000a','2010-03-05','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('ff808081275ab3c001275c46573403f8','ff80808127002c3b0127002cc1d70003','ff80808126a75e580126a7a497f10097','ff808081178d304d01178d45e73a0001','402881e5212aaa2d01212abed81d0022','分支环节测试2','ff80808127002c3b0127002cc1d60002','2010-03-14','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'402881e5213a45bf01213a47682c000c','分支环节测试2_2','0','TJ',NULL,'A',NULL,NULL),('ff80808127d314f30127d31c1f710003',NULL,'ff80808127d314f30127d31c1f710002','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff80808127d314f30127d31c1f710001','2010-04-06','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff808081289c0f8801289c1391660003',NULL,'ff808081289c0f8801289c1391660002','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081289c0f8801289c1391660001','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-15','',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff808081289c0f8801289c1391660005','ff808081289c0f8801289c1391660003','ff808081289c0f8801289c1391660002','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081289c0f8801289c1391660001','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-15','','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('ff808081289c1b2d01289c1c65b70002','ff808081289c0f8801289c1391660005','ff808081289c0f8801289c1391660002','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081289c1b2d01289c1c65b70001','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'402881e5212aaa2d01212abe7174001d','分支环节测试1','0','TJ',NULL,'A',NULL,NULL),('ff808081289c1b2d01289c1f81300006',NULL,'ff808081289c1b2d01289c1f81300005','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081289c1b2d01289c1f81300004','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-15','vvvvv',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff808081289c1b2d01289c1fc25f0008','ff808081289c1b2d01289c1f81300006','ff808081289c1b2d01289c1f81300005','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081289c1b2d01289c1f81300004','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-15','','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','0','TJ',NULL,'',NULL,NULL),('ff808081289c1b2d01289c200295000a','ff808081289c1b2d01289c1fc25f0008','ff808081289c1b2d01289c1f81300005','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081289c1b2d01289c1f81300004','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-12-12','同意','8a90247317b150a30117b16db07d0004','站址谈判','0','TJ',NULL,'A',NULL,NULL),('ff808081289c1b2d01289c23fd32000e',NULL,'ff808081289c1b2d01289c23fd32000d','ff8080811928036a011928120f750047','ff8080811928036a01192812e0710048','员工审请','ff808081289c1b2d01289c23fd32000c','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff808081289c1b2d01289c29fe8d001e',NULL,'ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192812e0710048','员工审请','ff808081289c1b2d01289c29fe8d001c','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-15','hello',NULL,NULL,'0',NULL,NULL,'',NULL,NULL),('ff808081289c1b2d01289c29fe8d0020','ff808081289c1b2d01289c29fe8d001e','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192812e0710048','员工审请','ff808081289c1b2d01289c29fe8d001c','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-15','提交并行会签','ff8080811928036a01192813cee80049','经理审批','0','TJ',NULL,'',NULL,NULL),('ff808081289c314301289c32bfb30002','ff808081289c1b2d01289c29fe8d0020','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','经理审批','ff808081289c1b2d01289c29fe8d001c','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','YB','2010-05-15','','ff8080811928036a01192814b272004e','并行会签','0','TJ','','',NULL,NULL),('ff808081289c314301289c32bfb30004','ff808081289c1b2d01289c29fe8d0020','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','经理审批','ff808081289c1b2d01289c29fe8d001c','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','YB','2010-05-15','','ff8080811928036a01192814b272004e','并行会签','1','TJ',NULL,'',NULL,NULL),('ff808081289c314301289c32bfb30006','ff808081289c1b2d01289c29fe8d0020','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','经理审批','ff808081289c1b2d01289c29fe8d001c','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','FC409474641EB0CF6CE03B29663E58BB','林颖军','YB','2010-05-15','','ff8080811928036a01192814b272004e','并行会签','2','TJ',NULL,'',NULL,NULL),('ff808081289c314301289c32bfb30008','ff808081289c1b2d01289c29fe8d0020','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','经理审批','ff808081289c1b2d01289c29fe8d001c','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','2551C200700BA543BBF3F9445F80C098','周旭顺','YB','2010-05-15','hhhhh','ff8080811928036a01192814b272004e','并行会签','3','TJ',NULL,'',NULL,NULL),('ff808081289c314301289c33b9a3000c','ff808081289c314301289c32bfb30002','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192814b272004e','并行会签','ff808081289c1b2d01289c29fe8d001c','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','','','',NULL,NULL,'ff8080811928036a01192814b272004e','并行会签','0','TLZ',NULL,NULL,NULL,NULL),('ff808081289c314301289c33f797000d','ff808081289c314301289c32bfb30004','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192814b272004e','并行会签','ff808081289c1b2d01289c29fe8d001c','2010-05-15','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','','','',NULL,NULL,'ff8080811928036a01192814b272004e','并行会签','0','TLZ',NULL,NULL,NULL,NULL),('ff808081289c314301289c3536ed000e','ff808081289c314301289c32bfb30006','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192814b272004e','并行会签','ff808081289c1b2d01289c29fe8d001c','2010-05-15','FC409474641EB0CF6CE03B29663E58BB','林颖军','','','',NULL,NULL,'ff8080811928036a01192814b272004e','并行会签','0','TLZ',NULL,NULL,NULL,NULL),('ff808081289c314301289c3c59b5000f','ff808081289c314301289c32bfb30008','ff808081289c1b2d01289c29fe8d001d','ff8080811928036a011928120f750047','ff8080811928036a01192814b272004e','并行会签','ff808081289c1b2d01289c29fe8d001c','2010-05-15','2551C200700BA543BBF3F9445F80C098','周旭顺','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','DB',NULL,'ggggg','ff8080811928036a011928156a680053','总经理审核','0','TJ','','',NULL,NULL),('ff808081289c314301289c41793b0014','ff80808126ffc6c00126ffcfe3350011','ff80808126ffc6c00126ffcfe333000e','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081289c314301289c41793b0013','2010-05-15','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'402881e5212aaa2d01212abe7174001d','分支环节测试1','0','TJ',NULL,'A',NULL,NULL),('ff8080812cd952ae012cd95cc0040003',NULL,'ff8080812cd952ae012cd95cc0040002','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff8080812cd952ae012cd95cc0040001','2010-12-12','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,'',NULL,NULL,'0',NULL,'','A',NULL,NULL),('ff8080812cd952ae012cd9b91e90000b','ff808081289c1b2d01289c200295000a','ff808081289c1b2d01289c1f81300005','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16db07d0004','站址谈判','ff808081289c1b2d01289c1f81300004','2010-12-12','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','DB',NULL,NULL,'8a90247317b150a30117b16d1c7b0003','网建部、运维部网优中心、县分人员并行会签','0','TJ',NULL,'A',NULL,NULL),('ff8080812cd952ae012cd9b91e90000d','ff808081289c1b2d01289c200295000a','ff808081289c1b2d01289c1f81300005','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16db07d0004','站址谈判','ff808081289c1b2d01289c1f81300004','2010-12-12','8873FA518265405763E919A125D540ED','刘正仁','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','DB',NULL,NULL,'8a90247317b150a30117b16d1c7b0003','网建部、运维部网优中心、县分人员并行会签','1','TJ',NULL,'A',NULL,NULL),('ff8080812cd952ae012cd9b91e90000f','ff808081289c1b2d01289c200295000a','ff808081289c1b2d01289c1f81300005','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16db07d0004','站址谈判','ff808081289c1b2d01289c1f81300004','2010-12-12','8873FA518265405763E919A125D540ED','刘正仁','FC409474641EB0CF6CE03B29663E58BB','林颖军','DB',NULL,NULL,'8a90247317b150a30117b16d1c7b0003','网建部、运维部网优中心、县分人员并行会签','2','TJ',NULL,'A',NULL,NULL),('ff8080812cd952ae012cd9b91e900011','ff808081289c1b2d01289c200295000a','ff808081289c1b2d01289c1f81300005','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16db07d0004','站址谈判','ff808081289c1b2d01289c1f81300004','2010-12-12','8873FA518265405763E919A125D540ED','刘正仁','2551C200700BA543BBF3F9445F80C098','周旭顺','DB',NULL,NULL,'8a90247317b150a30117b16d1c7b0003','网建部、运维部网优中心、县分人员并行会签','3','TJ',NULL,'A',NULL,NULL);
/*!40000 ALTER TABLE `wfss_activity_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_agent`
--

DROP TABLE IF EXISTS `wfss_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_agent` (
  `ORG_ID` varchar(32) NOT NULL,
  `ORG_NAME` varchar(32) DEFAULT NULL,
  `FROM_DATE` date DEFAULT NULL,
  `TO_DATE` date DEFAULT NULL,
  `AGENT_TYPE` varchar(32) DEFAULT NULL,
  `AGENT_ORG_ID` varchar(32) DEFAULT NULL,
  `AGENT_ORG_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_agent`
--

LOCK TABLES `wfss_agent` WRITE;
/*!40000 ALTER TABLE `wfss_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `wfss_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_agent_item`
--

DROP TABLE IF EXISTS `wfss_agent_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_agent_item` (
  `ID` varchar(32) NOT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `ORG_NAME` varchar(32) DEFAULT NULL,
  `AGENT_ORG_ID` varchar(32) DEFAULT NULL,
  `AGENT_ORG_NAME` varchar(32) DEFAULT NULL,
  `FROM_DATE` date DEFAULT NULL,
  `TO_DATE` date DEFAULT NULL,
  `PROCESS_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_WFSS_AGE_REFERENCE_WFSS_AGE` (`ORG_ID`),
  CONSTRAINT `FK_WFSS_AGE_REFERENCE_WFSS_AGE` FOREIGN KEY (`ORG_ID`) REFERENCES `wfss_agent` (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_agent_item`
--

LOCK TABLES `wfss_agent_item` WRITE;
/*!40000 ALTER TABLE `wfss_agent_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `wfss_agent_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_app_form`
--

DROP TABLE IF EXISTS `wfss_app_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_app_form` (
  `APP_FORM_ID` varchar(32) NOT NULL,
  `APP_FORM_CODE` varchar(32) DEFAULT NULL,
  `APP_FORM_NAME` varchar(32) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  `APP_FORM_URL` varchar(320) DEFAULT NULL,
  `EDITION_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`APP_FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_app_form`
--

LOCK TABLES `wfss_app_form` WRITE;
/*!40000 ALTER TABLE `wfss_app_form` DISABLE KEYS */;
INSERT INTO `wfss_app_form` VALUES ('297e4ced22469c7c012246b799700026','formTest','业务表单测试','ff80808116d8b9390116d8c47b4a0001',NULL,'/showSimpleProcessDemo_demo.do','402881e5217d3b0c01217d3cab230007'),('402881e5212ff4a901212ff62332000b','branch_1','分支流程测试1','ff80808116d8b9390116d8c47b4a0001',NULL,'/showSimpleProcessDemo1_demo.do','402881e521729c2e012172a2a0950012'),('402881e5212ff4a901212ff6d4cf0015','branch_2','分支流程测试2','ff80808116d8b9390116d8c47b4a0001',NULL,'/showSimpleProcessDemo2_demo.do','402881e521729c2e012172a2a0950012'),('402881e52191b22b012191b2ad600055','formTest','业务表单测试','ff80808116d8b9390116d8c47b4a0001',NULL,'/showSimpleProcessDemo_demo.do','402881e5217d3b0c01217d3cab230007'),('402881e52191b22b012191b2adae005b','branch_1','分支流程测试1','ff80808116d8b9390116d8c47b4a0001',NULL,'/showSimpleProcessDemo1_demo.do','402881e5217d3b0c01217d3cab230007'),('402881e52191b22b012191b2adae005d','branch_2','分支流程测试2','ff80808116d8b9390116d8c47b4a0001',NULL,'/showSimpleProcessDemo2_demo.do','402881e5217d3b0c01217d3cab230007'),('402881ee1fcc95ac011fcd09ef670001','gxunion_base','基站申报','ff80808116d8b9390116d8c47b4a0001',NULL,'/showBaseStation.do','402881e521729c2e012172a2a0950012'),('402881f0199a24d401199a26de000001','fdfd','test','ff80808116d8b9390116d8c47b4a0001',NULL,NULL,'402881e521729c2e012172a2a0950012'),('ff808081178cf67e01178d02155a0008','ITSM_EVENT_MRG','事件管理','ff808081178cd5fc01178cedc43d0001',NULL,'/jsp.jsp','402881e521729c2e012172a2a0950012'),('ff808081178cf67e01178d0259960009','formTest','业务表单测试','ff80808116d8b9390116d8c47b4a0001',NULL,'/showSimpleProcessDemo_demo.do','402881e521729c2e012172a2a0950012');
/*!40000 ALTER TABLE `wfss_app_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_app_form_field`
--

DROP TABLE IF EXISTS `wfss_app_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_app_form_field` (
  `FIELD_ID` varchar(32) NOT NULL,
  `FIELD_NAME` varchar(32) DEFAULT NULL,
  `FIELD_ALIAS` varchar(32) DEFAULT NULL,
  `FIELD_INPUT_TYPE` varchar(32) DEFAULT NULL,
  `APP_FORM_ID` varchar(32) DEFAULT NULL,
  `IS_ARRAY` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  KEY `FK_WFSS_APP_REFERENCE_WFSS_APP` (`APP_FORM_ID`),
  CONSTRAINT `FK_WFSS_APP_REFERENCE_WFSS_APP` FOREIGN KEY (`APP_FORM_ID`) REFERENCES `wfss_app_form` (`APP_FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_app_form_field`
--

LOCK TABLES `wfss_app_form_field` WRITE;
/*!40000 ALTER TABLE `wfss_app_form_field` DISABLE KEYS */;
INSERT INTO `wfss_app_form_field` VALUES ('297e4ced22469c7c012246b799700027','下拉框','selectDemo','select','297e4ced22469c7c012246b799700026','N'),('297e4ced22469c7c012246b799700028','日期框','dateDemo','date','297e4ced22469c7c012246b799700026','N'),('297e4ced22469c7c012246b799700029','多选框','checkBoxDemo','checkbox','297e4ced22469c7c012246b799700026','N'),('297e4ced22469c7c012246b79970002a','单选框','radioBoxDemo','radio','297e4ced22469c7c012246b799700026','N'),('297e4ced22469c7c012246b79970002b','基站名称','textDemo','text','297e4ced22469c7c012246b799700026','N'),('402881e5204272e801204277bb690001','基站代号','code','text','402881ee1fcc95ac011fcd09ef670001','N'),('402881e5204272e801204278061e0002','北纬位置','northLatitude','text','402881ee1fcc95ac011fcd09ef670001','N'),('402881e5204272e8012042784be20003','东经位置','eastLongitude','text','402881ee1fcc95ac011fcd09ef670001','N'),('402881e5204272e801204278aed20004','建站时间','createTime','date','402881ee1fcc95ac011fcd09ef670001','N'),('402881e5204272e80120427925880005','创建者','createOrgName','text','402881ee1fcc95ac011fcd09ef670001','N'),('402881e5204272e80120427998d40006','基站描述','description','textarea','402881ee1fcc95ac011fcd09ef670001','N'),('402881e52129d976012129e0a146003a','基站名称','textDemo','text','ff808081178cf67e01178d0259960009','N'),('402881e5212ff4a901212ff673560010','名称','name','text','402881e5212ff4a901212ff62332000b','N'),('402881e5212ff4a901212ff70bec001a','名称','name','text','402881e5212ff4a901212ff6d4cf0015','N'),('402881e52191b22b012191b2ad600056','下拉框','selectDemo','select','402881e52191b22b012191b2ad600055','N'),('402881e52191b22b012191b2ad600057','日期框','dateDemo','date','402881e52191b22b012191b2ad600055','N'),('402881e52191b22b012191b2ad600058','多选框','checkBoxDemo','checkbox','402881e52191b22b012191b2ad600055','N'),('402881e52191b22b012191b2ad600059','单选框','radioBoxDemo','radio','402881e52191b22b012191b2ad600055','N'),('402881e52191b22b012191b2adae005a','基站名称','textDemo','text','402881e52191b22b012191b2ad600055','N'),('402881e52191b22b012191b2adae005c','名称','name','text','402881e52191b22b012191b2adae005b','N'),('402881e52191b22b012191b2adae005e','名称','name','text','402881e52191b22b012191b2adae005d','N'),('402881ee20240f76012026e40c7b0095','基站名称','name','text','402881ee1fcc95ac011fcd09ef670001','N'),('ff808081178cf67e01178d0cbed80011','下拉框','selectDemo','select','ff808081178cf67e01178d0259960009','N'),('ff808081178cf67e01178d0cd7610012','日期框','dateDemo','date','ff808081178cf67e01178d0259960009','N'),('ff808081183a5f1401183a66ad930001','多选框','checkBoxDemo','checkbox','ff808081178cf67e01178d0259960009','N'),('ff808081183a5f1401183a674ee40002','单选框','radioBoxDemo','radio','ff808081178cf67e01178d0259960009','N');
/*!40000 ALTER TABLE `wfss_app_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_button`
--

DROP TABLE IF EXISTS `wfss_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_button` (
  `BUTTON_ID` varchar(32) NOT NULL,
  `BUTTON_STYLE_ID` varchar(32) DEFAULT NULL,
  `BUTTON_NAME` varchar(32) DEFAULT NULL,
  `BUTTON_POSITION` varchar(8) DEFAULT NULL,
  `JS_METHOD` varchar(32) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_button`
--

LOCK TABLES `wfss_button` WRITE;
/*!40000 ALTER TABLE `wfss_button` DISABLE KEYS */;
INSERT INTO `wfss_button` VALUES ('402881e520cdd1dc0120cdd518230007','TJ','跳转','DB','jumpToOtherActivity','1'),('402881e520cdd1dc0120cdd5af610008','JTRQL','转他人处理','DB','assignOtherUserProcess','2'),('402881e520cdd1dc0120cdd654b90009','LTZF','流程作废','DB,YB','cancelProcessInst','0'),('402881e520cdd1dc0120cdd6f07c000a','LTGQ','流程挂起','DB,YB','hangProcessInst','4'),('402881ef1976644d011976657f5e0001','CTL','重处理','YB','redoWorkItem','0');
/*!40000 ALTER TABLE `wfss_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_expression`
--

DROP TABLE IF EXISTS `wfss_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_expression` (
  `EXP_ID` varchar(32) NOT NULL,
  `EXP_NAME` varchar(32) DEFAULT NULL,
  `EXP_TYPE` varchar(4) DEFAULT NULL,
  `EXP_CONTENT` varchar(2000) DEFAULT NULL,
  `EXP_USE_TYPE` varchar(8) DEFAULT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `APP_FORM_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`EXP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_expression`
--

LOCK TABLES `wfss_expression` WRITE;
/*!40000 ALTER TABLE `wfss_expression` DISABLE KEYS */;
/*!40000 ALTER TABLE `wfss_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_option`
--

DROP TABLE IF EXISTS `wfss_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_option` (
  `ID` varchar(32) NOT NULL,
  `CONTENT` varchar(200) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_option`
--

LOCK TABLES `wfss_option` WRITE;
/*!40000 ALTER TABLE `wfss_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wfss_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_participant`
--

DROP TABLE IF EXISTS `wfss_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_participant` (
  `PARTICIPANT_ID` varchar(32) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `PARENT_TYPE` varchar(2) DEFAULT NULL,
  `MEMBER_ID` varchar(32) DEFAULT NULL,
  `MEMBER_TYPE` varchar(5) DEFAULT NULL,
  `PARTICIPANT_NAME` varchar(320) DEFAULT NULL,
  `ORG_TYPE_CODE` varchar(5) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`PARTICIPANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_participant`
--

LOCK TABLES `wfss_participant` WRITE;
/*!40000 ALTER TABLE `wfss_participant` DISABLE KEYS */;
INSERT INTO `wfss_participant` VALUES ('297e4ced22469c7c012246b798760014','297e4ced22469c7c012246b798760013','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('297e4ced22469c7c012246b798760015','297e4ced22469c7c012246b798760013','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('297e4ced22469c7c012246b798760016','297e4ced22469c7c012246b798760013','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('297e4ced22469c7c012246b798760017','297e4ced22469c7c012246b798760013','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('297e4ced22469c7c012246b79902001a','297e4ced22469c7c012246b798760019','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('297e4ced22469c7c012246b79902001b','297e4ced22469c7c012246b798760019','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('297e4ced22469c7c012246b79902001c','297e4ced22469c7c012246b798760019','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('297e4ced22469c7c012246b79902001d','297e4ced22469c7c012246b798760019','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('297e4ced22469c7c012246b799220021','297e4ced22469c7c012246b799120020','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('297e4ced22469c7c012246b799220022','297e4ced22469c7c012246b799120020','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('297e4ced22469c7c012246b799220023','297e4ced22469c7c012246b799120020','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('297e4ced22469c7c012246b799220024','297e4ced22469c7c012246b799120020','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e5207000da0120700364940009','8a90247317b150a30117b16d1c7b0003','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e5207000da012070036494000a','8a90247317b150a30117b16d1c7b0003','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e5207000da012070036494000b','8a90247317b150a30117b16d1c7b0003','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e5207000da012070036494000c','8a90247317b150a30117b16d1c7b0003','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e5207000da012070036494000d','8a90247317b150a30117b16d1c7b0003','A','0F7E0CE47906DE28288FBD9379F4690A','ORG','技术部','BM','0'),('402881e52129d976012129deaff5001f','8a90247317b150a30117b16db07d0004','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52129d976012129deaff50020','8a90247317b150a30117b16db07d0004','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e52129d976012129deaff50021','8a90247317b150a30117b16db07d0004','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e52129d976012129deaff50022','8a90247317b150a30117b16db07d0004','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e5213026f601213027ff6b0010','402881e5212aaa2d01212abed81d0022','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e5213026f601213027ff6b0011','402881e5212aaa2d01212abed81d0022','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e5213026f601213027ff6b0012','402881e5212aaa2d01212abed81d0022','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e5213026f601213027ff6b0013','402881e5212aaa2d01212abed81d0022','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e521354f68012135584d51003e','402881e521354f68012135580e540036','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e5216358880121635d7e9b000e','402881e5216358880121635d7e9b000d','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e5216366a10121636bfd1e0021','402881e5216366a101216369898d0015','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e5216366a10121636bfd1e0022','402881e5216366a101216369898d0015','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e5216366a10121636bfd1e0023','402881e5216366a101216369898d0015','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e5216366a10121636bfd1e0024','402881e5216366a101216369898d0015','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e52163b9c9012163c102cd001e','402881e52163b9c9012163bf2cc50012','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52163b9c9012163ca11a60056','402881e52163b9c9012163c7203b003e','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52168bae8012168bd326a0012','402881e5212aaa2d01212abe7174001d','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52168bae8012168bd326a0013','402881e5212aaa2d01212abe7174001d','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e52168bae8012168bd326a0014','402881e5212aaa2d01212abe7174001d','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e52168bae8012168bd326a0015','402881e5212aaa2d01212abe7174001d','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e5217173bf012171af962300f3','8a90247317b150a30117b16b20da0002','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e5217173bf012171af962300f4','8a90247317b150a30117b16b20da0002','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e5217173bf012171af962300f5','8a90247317b150a30117b16b20da0002','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e5217173bf012171af962300f6','8a90247317b150a30117b16b20da0002','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e5218cd96001218cde2511001c','402881e5213a45bf01213a47682c000c','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2a8dc0007','402881e52191b22b012191b2a8cc0006','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2a8dc0008','402881e52191b22b012191b2a8cc0006','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e52191b22b012191b2a8dc0009','402881e52191b22b012191b2a8cc0006','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e52191b22b012191b2a8dc000a','402881e52191b22b012191b2a8cc0006','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e52191b22b012191b2a939000d','402881e52191b22b012191b2a90a000c','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2a939000e','402881e52191b22b012191b2a90a000c','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e52191b22b012191b2a939000f','402881e52191b22b012191b2a90a000c','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e52191b22b012191b2a9390010','402881e52191b22b012191b2a90a000c','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e52191b22b012191b2a9870016','402881e52191b22b012191b2a9490015','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2a9970019','402881e52191b22b012191b2a9870018','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2a9a7001c','402881e52191b22b012191b2a997001b','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2a9d6001f','402881e52191b22b012191b2a9a7001e','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2aa140023','402881e52191b22b012191b2a9d60022','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2aa330026','402881e52191b22b012191b2aa140025','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2aa430028','402881e52191b22b012191b2aa330027','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2aa430029','402881e52191b22b012191b2aa330027','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e52191b22b012191b2aa43002a','402881e52191b22b012191b2aa330027','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e52191b22b012191b2aa43002b','402881e52191b22b012191b2aa330027','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e52191b22b012191b2aa72002f','402881e52191b22b012191b2aa43002e','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2aadf0038','402881e52191b22b012191b2aa910037','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2aaef003b','402881e52191b22b012191b2aadf003a','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2ab0e003e','402881e52191b22b012191b2aaef003d','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2ab5c0044','402881e52191b22b012191b2ab0e0043','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2ab5c0045','402881e52191b22b012191b2ab0e0043','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e52191b22b012191b2ab5c0046','402881e52191b22b012191b2ab0e0043','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e52191b22b012191b2ab5c0047','402881e52191b22b012191b2ab0e0043','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e52191b22b012191b2ab7b004d','402881e52191b22b012191b2ab5c004c','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52191b22b012191b2ab7b004e','402881e52191b22b012191b2ab5c004c','A','0F7E0CE47906DE28288FBD9379F4690A','ORG','技术部','BM','0'),('402881e52191b22b012191b2ab7b004f','402881e52191b22b012191b2ab5c004c','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('402881e52191b22b012191b2ab7b0050','402881e52191b22b012191b2ab5c004c','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('402881e52191b22b012191b2ab7b0051','402881e52191b22b012191b2ab5c004c','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('402881e5219497620121949867b3000e','402881e52191b22b012191b2a9390012','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52196c13d012196d19451008b','402881e52196c13d012196cb5eb80041','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52196c13d012196d2125b008e','402881e52196c13d012196cae532003b','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52196d6ba012196daadc90011','402881e5213a45bf01213a4c2956001e','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52196db61012196ed2c580030','402881e52196c13d012196cec4a70077','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e52196db61012196ed60390033','402881e52196c13d012196ce64d30072','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('402881e5219718810121971ce35f0012','402881e52196c13d012196cf4b7a007c','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff80808118bd90db0118bda3ea75001b','ff80808118bd90db0118bda3ea75001a','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff80808118bd90db0118bda3ea75001c','ff80808118bd90db0118bda3ea75001a','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff80808118bd90db0118bda3ea75001d','ff80808118bd90db0118bda3ea75001a','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff80808118bd90db0118bda3ea75001e','ff80808118bd90db0118bda3ea75001a','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff80808118bd90db0118bda76e1e0027','ff80808118bd90db0118bda76e1e0026','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff80808118bd90db0118bda76e1e0028','ff80808118bd90db0118bda76e1e0026','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff80808118bd90db0118bda76e1e0029','ff80808118bd90db0118bda76e1e0026','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff80808118bd90db0118bda76e1e002a','ff80808118bd90db0118bda76e1e0026','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff80808118bd90db0118bda7b076002b','ff80808118bd90db0118bda590360020','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff80808118bd90db0118bda7b076002c','ff80808118bd90db0118bda590360020','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff80808118bd90db0118bda7b076002d','ff80808118bd90db0118bda590360020','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff80808118bd90db0118bda7b076002e','ff80808118bd90db0118bda590360020','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff8080811922f6a90119240b15390063','ff8080811922f6a90119240b15390062','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff8080811922f6a90119240b15390064','ff8080811922f6a90119240b15390062','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff8080811922f6a90119240b15390065','ff8080811922f6a90119240b15390062','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff8080811922f6a90119240b15390066','ff8080811922f6a90119240b15390062','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff8080811922f6a90119240bec20006c','ff8080811922f6a90119240bec11006b','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff8080811922f6a90119240bec20006d','ff8080811922f6a90119240bec11006b','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff8080811922f6a90119240bec30006e','ff8080811922f6a90119240bec11006b','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff8080811922f6a90119240bec30006f','ff8080811922f6a90119240bec11006b','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff8080811922f6a90119240d17910071','ff8080811922f6a90119240d17910070','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff80808119288fda01192896c6ec002b','ff8080811922f6a90119240a3a2b005d','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff80808119288fda01192896c6ec002c','ff8080811922f6a90119240a3a2b005d','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff80808119288fda01192896c6ec002d','ff8080811922f6a90119240a3a2b005d','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff80808119288fda01192896c6ec002e','ff8080811922f6a90119240a3a2b005d','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff80808126a75e580126a7735ae9005a','402881e52191b22b012191b2aa720031','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff80808126a75e580126a7735ae9005b','402881e52191b22b012191b2aa720031','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff80808126a75e580126a7735ae9005c','402881e52191b22b012191b2aa720031','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff80808126a75e580126a7735ae9005d','402881e52191b22b012191b2aa720031','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff808081289c1b2d01289c27e3ea0010','ff8080811928036a01192814b272004e','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff808081289c1b2d01289c27e3ea0011','ff8080811928036a01192814b272004e','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff808081289c1b2d01289c27e3ea0012','ff8080811928036a01192814b272004e','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff808081289c1b2d01289c27e3ea0013','ff8080811928036a01192814b272004e','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff808081289c1b2d01289c28b2560014','ff8080811928036a011928156a680053','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff808081289c1b2d01289c28b2560015','ff8080811928036a011928156a680053','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff808081289c1b2d01289c28b2560016','ff8080811928036a011928156a680053','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff808081289c1b2d01289c28b2560017','ff8080811928036a011928156a680053','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3'),('ff808081289c1b2d01289c295ee20018','ff8080811928036a01192813cee80049','A','8873FA518265405763E919A125D540ED','USER','刘正仁',NULL,'0'),('ff808081289c1b2d01289c295ee20019','ff8080811928036a01192813cee80049','A','AA9162568C12F6F1EF0E8D68CE8DD98A','USER','王敏',NULL,'1'),('ff808081289c1b2d01289c295ee2001a','ff8080811928036a01192813cee80049','A','FC409474641EB0CF6CE03B29663E58BB','USER','林颖军',NULL,'2'),('ff808081289c1b2d01289c295ee2001b','ff8080811928036a01192813cee80049','A','2551C200700BA543BBF3F9445F80C098','USER','周旭顺',NULL,'3');
/*!40000 ALTER TABLE `wfss_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_process`
--

DROP TABLE IF EXISTS `wfss_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_process` (
  `PROCESS_ID` varchar(32) NOT NULL,
  `PROCESS_NAME` varchar(640) DEFAULT NULL,
  `PROCESS_ALIAS` varchar(32) DEFAULT NULL,
  `ORG_ID` varchar(32) DEFAULT NULL,
  `ORG_NAME` varchar(320) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `APP_FORM_ID` varchar(32) DEFAULT NULL,
  `FIRST_ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `ON_START_EVENT` varchar(64) DEFAULT NULL,
  `ON_END_EVENT` varchar(64) DEFAULT NULL,
  `PROCESS_IMG` varchar(60) DEFAULT NULL,
  `MEMO` varchar(3200) DEFAULT NULL,
  `ORG_TYPE_CODE` varchar(32) DEFAULT NULL,
  `CANCELLATION_EVENT` varchar(60) DEFAULT NULL,
  `HANG_EVENT` varchar(60) DEFAULT NULL,
  `EDITION_ID` varchar(32) DEFAULT NULL,
  `IS_USED` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`PROCESS_ID`),
  KEY `FK_WFSS_PRO_REFERENCE_WFSS_APP` (`APP_FORM_ID`),
  CONSTRAINT `FK_WFSS_PRO_REFERENCE_WFSS_APP` FOREIGN KEY (`APP_FORM_ID`) REFERENCES `wfss_app_form` (`APP_FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_process`
--

LOCK TABLES `wfss_process` WRITE;
/*!40000 ALTER TABLE `wfss_process` DISABLE KEYS */;
INSERT INTO `wfss_process` VALUES ('297e4ced22469c7c012246b79847000f','顺序会签审批流程','PROCESS_TEST2','402828701604fcd401160501e13a0002','精鹰技术股份有限公司','ff80808116d8b9390116d8c47b4a0001','402881e52191b22b012191b2ad600055','ff80808118bd90db0118bda1f8690018',NULL,NULL,NULL,NULL,'GS',NULL,NULL,'402881e5217d3b0c01217d3cab230007','N'),('402881e52191b22b012191b2a8ad0005','审批流程','TEST_PROCESS','402828701604fcd401160501e13a0002','精鹰技术股份有限公司','ff80808116d8b9390116d8c47b4a0001','402881e52191b22b012191b2ad600055','','','testFlowEndEvet',NULL,NULL,'GS','cancelEventTest','','402881e5217d3b0c01217d3cab230007','N'),('402881f0199a24d401199a2832d20002','抱杆流程','borrom_book','402828701604fcd401160501e13a0002','精鹰技术股份有限公司','ff80808116d8b9390116d8c47b4a0001',NULL,'402881f0199a24d401199a2962d60003',NULL,NULL,NULL,NULL,'GS',NULL,NULL,'402881e521729c2e012172a2a0950012','Y'),('ff808081178d304d01178d45e73a0001','审批流程','TEST_PROCESS','402828701604fcd401160501e13a0002','精鹰技术股份有限公司','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff808081179cf63c01179cf9fa830001','','testFlowEndEvet',NULL,'测试使用','GS','cancelEventTest','','402881e521729c2e012172a2a0950012','Y'),('ff8080811797373f01179739bb010001','事件管理流程','EVENT_PROCESS','402828701604fcd401160501e13a0002','数据通讯网络有限公司','ff808081178cd5fc01178cedc43d0001','ff808081178cf67e01178d02155a0008','ff8080811797373f011797429d6b0002',NULL,NULL,NULL,NULL,'GS',NULL,NULL,'402881e521729c2e012172a2a0950012','Y'),('ff80808118bd90db0118bda0936b0017','顺序会签审批流程','PROCESS_TEST2','402828701604fcd401160501e13a0002','精鹰技术股份有限公司','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff80808118bd90db0118bda1f8690018',NULL,NULL,NULL,NULL,'GS',NULL,NULL,'402881e521729c2e012172a2a0950012','Y'),('ff8080811922f6a901192408d490005c','土建流程','PROCESS_TEST3','402828701604fcd401160501e13a0002','精鹰技术股份有限公司','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff8080811922f6a90119240a3a2b005d',NULL,NULL,NULL,NULL,'GS',NULL,NULL,'402881e521729c2e012172a2a0950012','Y'),('ff8080811928036a011928120f750047','并行会签测试','PROCESS_TEST4','402828701604fcd401160501e13a0002','精鹰技术股份有限公司','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009',NULL,NULL,NULL,NULL,NULL,'GS',NULL,NULL,'402881e521729c2e012172a2a0950012','Y');
/*!40000 ALTER TABLE `wfss_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_process_edition`
--

DROP TABLE IF EXISTS `wfss_process_edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_process_edition` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(320) DEFAULT NULL,
  `DELETE_FLAG` varchar(2) DEFAULT NULL,
  `COM_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_process_edition`
--

LOCK TABLES `wfss_process_edition` WRITE;
/*!40000 ALTER TABLE `wfss_process_edition` DISABLE KEYS */;
INSERT INTO `wfss_process_edition` VALUES ('402881e521729c2e012172a2a0950012','标准版','N','402828701604fcd401160501e13a0002'),('402881e5217d3b0c01217d3cab230007','增强版1','N','402828701604fcd401160501e13a0002');
/*!40000 ALTER TABLE `wfss_process_edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_process_instance`
--

DROP TABLE IF EXISTS `wfss_process_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_process_instance` (
  `PROCESS_INSTANCE_ID` varchar(32) NOT NULL,
  `PARENT_PROCESS_INST_ID` varchar(32) DEFAULT NULL,
  `PROCESS_ID` varchar(32) DEFAULT NULL,
  `PROCESS_NAME` varchar(640) DEFAULT NULL,
  `SYSTEM_ID` varchar(32) DEFAULT NULL,
  `APP_FORM_ID` varchar(32) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `TITLE` varchar(640) DEFAULT NULL,
  `COMPLETE_DATE` date DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `CREATE_ID` varchar(32) DEFAULT NULL,
  `CREATE_NAME` varchar(32) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  PRIMARY KEY (`PROCESS_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_process_instance`
--

LOCK TABLES `wfss_process_instance` WRITE;
/*!40000 ALTER TABLE `wfss_process_instance` DISABLE KEYS */;
INSERT INTO `wfss_process_instance` VALUES ('402881e63a554ae9013a556aece40002',NULL,'ff808081178d304d01178d45e73a0001','审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','402881e63a554ae9013a556aecc40001','dgfdg',NULL,'LZ','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','2012-10-12'),('402881e63a597d59013a5a39a1900005',NULL,'ff808081178d304d01178d45e73a0001','审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','402881e63a597d59013a5a39a1900004','我的测试1',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2012-10-13'),('402881ea289eeba501289eed8aee0002',NULL,'ff8080811928036a011928120f750047','并行会签测试','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','402881ea289eeba501289eed8ade0001','gfdgfdg',NULL,'CANCEL','8873FA518265405763E919A125D540ED','刘正仁','2010-05-16'),('402881fa2cd5fbb0012cd5fd97830002',NULL,'ff808081178d304d01178d45e73a0001','审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','402881fa2cd5fbb0012cd5fd97830001','dfds',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-12-11'),('ff80808126a75e580126a769f6580020',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff80808126a75e580126a769f655001f','刘 正 仁 测 试',NULL,'CANCEL','46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','2010-02-07'),('ff80808126a75e580126a7a497f10097',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff80808126a75e580126a7a497f10096','再 次 测 试',NULL,'CANCEL','8873FA518265405763E919A125D540ED','刘正仁','2010-02-07'),('ff80808126ffc6c00126ffcef4150007',NULL,'ff8080811922f6a901192408d490005c','土建流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff80808126ffc6c00126ffcef40f0006','yyyy',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-02-24'),('ff80808126ffc6c00126ffcfe333000e',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff80808126ffc6c00126ffcfe333000d','ytyty',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-02-24'),('ff808081272c6fcc01272c8b780d0015',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff808081272c6fcc01272c8b780d0014','hhhhhhhh',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-03-05'),('ff808081272c6fcc01272c9cab180037',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff808081272c6fcc01272c9cab180036','hhhhhhhhhh',NULL,'CANCEL','8873FA518265405763E919A125D540ED','刘正仁','2010-03-05'),('ff808081272e37bf01272e4bed1c000b',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff808081272e37bf01272e4bed14000a','gfgfgf',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-03-05'),('ff80808127d314f30127d31c1f710002',NULL,'ff808081178d304d01178d45e73a0001','审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff80808127d314f30127d31c1f710001','<,>=',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-04-06'),('ff808081289c0f8801289c1391660002',NULL,'ff808081178d304d01178d45e73a0001','审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff808081289c0f8801289c1391660001','我的测试',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15'),('ff808081289c1b2d01289c1f81300005',NULL,'ff808081178d304d01178d45e73a0001','审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c1f81300004','再一次测试',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15'),('ff808081289c1b2d01289c23fd32000d',NULL,'ff8080811928036a011928120f750047','并行会签测试','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c23fd32000c','hello 并行会签',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15'),('ff808081289c1b2d01289c29fe8d001d',NULL,'ff8080811928036a011928120f750047','并行会签测试','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c29fe8d001c','并行流程',NULL,'JS','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15'),('ff8080812cd952ae012cd95cc0040002',NULL,'ff808081178d304d01178d45e73a0001','审批流程','ff80808116d8b9390116d8c47b4a0001','ff808081178cf67e01178d0259960009','ff8080812cd952ae012cd95cc0040001','fdg',NULL,'LZ','8873FA518265405763E919A125D540ED','刘正仁','2010-12-12');
/*!40000 ALTER TABLE `wfss_process_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_route`
--

DROP TABLE IF EXISTS `wfss_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_route` (
  `ROUTE_ID` varchar(32) NOT NULL,
  `PROCESS_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `ROUTE_NAME` varchar(320) DEFAULT NULL,
  `ROUTE_ALIAS` varchar(32) DEFAULT NULL,
  `TO_PROCESS_ID` varchar(32) DEFAULT NULL,
  `TO_ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `TO_ACTIVITY_RULE` varchar(32) DEFAULT NULL,
  `TO_ACTIVITY_EVENT` varchar(32) DEFAULT NULL,
  `FLITER_EXPR` varchar(40) DEFAULT NULL,
  `IS_POINT_TO_END` varchar(4) DEFAULT NULL,
  `IS_DEFAULT_ROUTE` varchar(4) DEFAULT NULL,
  `IS_REJECT_ROUTE` varchar(4) DEFAULT NULL,
  `AND_ROUTE` varchar(320) DEFAULT NULL,
  `XOR_ROUTE` varchar(320) DEFAULT NULL,
  `MEMO` varchar(320) DEFAULT NULL,
  `ORDER_INDEX` decimal(10,0) DEFAULT NULL,
  `PARTICIPANT_EXPR` varchar(40) DEFAULT NULL,
  `XOR_STRATEGY` varchar(12) DEFAULT NULL,
  `XOR_STRATEGY_SCALE` float DEFAULT NULL,
  `IS_BUTTON` varchar(4) DEFAULT NULL,
  `BATCH_FLAG` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ROUTE_ID`),
  KEY `FK_WFSS_ROU_REFERENCE_WFSS_ACT` (`ACTIVITY_ID`),
  KEY `FK_WFSS_ROU_REFERENCE_WFSS_PRO` (`PROCESS_ID`),
  CONSTRAINT `FK_WFSS_ROU_REFERENCE_WFSS_ACT` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `wfss_activity` (`ACTIVITY_ID`),
  CONSTRAINT `FK_WFSS_ROU_REFERENCE_WFSS_PRO` FOREIGN KEY (`PROCESS_ID`) REFERENCES `wfss_process` (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_route`
--

LOCK TABLES `wfss_route` WRITE;
/*!40000 ALTER TABLE `wfss_route` DISABLE KEYS */;
INSERT INTO `wfss_route` VALUES ('297e4ced22469c7c012246b798760011','297e4ced22469c7c012246b79847000f','297e4ced22469c7c012246b798470010','提交顺序会签',NULL,'ff80808118bd90db0118bda0936b0017','297e4ced22469c7c012246b798760013','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('297e4ced22469c7c012246b798760012','297e4ced22469c7c012246b79847000f','297e4ced22469c7c012246b798470010','提交经理审批','pt2a1r1','ff80808118bd90db0118bda0936b0017','297e4ced22469c7c012246b799120020','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('297e4ced22469c7c012246b798760018','297e4ced22469c7c012246b79847000f','297e4ced22469c7c012246b798760013','提交总经理审核','p2a3r1','ff80808118bd90db0118bda0936b0017',NULL,NULL,NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('297e4ced22469c7c012246b79902001e','297e4ced22469c7c012246b79847000f','297e4ced22469c7c012246b798760019','提交归档',NULL,'ff80808118bd90db0118bda0936b0017','297e4ced22469c7c012246b79902001f','toActivity',NULL,NULL,'Y','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('297e4ced22469c7c012246b799220025','297e4ced22469c7c012246b79847000f','297e4ced22469c7c012246b799120020','提交顺序会签','p2a2r1','ff80808118bd90db0118bda0936b0017','297e4ced22469c7c012246b798760013','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e51d723d5e011d7245b6410003','402881f0199a24d401199a2832d20002','402881e51d723d5e011d7245035c0002','同意',NULL,'402881f0199a24d401199a2832d20002','402881e520045b74012004607d870002','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e5200444230120045228660006','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','不同意',NULL,'ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'2',NULL,'BY_VALUE',0,'Y','unagree'),('402881e5200444230120045353e6000b','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16db07d0004','不同意',NULL,'ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'2',NULL,'BY_VALUE',0,NULL,'unagree'),('402881e5200444230120045637080016','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16d1c7b0003','不同意',NULL,'ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'0',NULL,'BY_VALUE',0,NULL,'unagree'),('402881e520045b740120045f91420001','402881f0199a24d401199a2832d20002','402881e51d723d5e011d7245035c0002','不同意',NULL,'402881f0199a24d401199a2832d20002','402881f0199a24d401199a2962d60003','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'2',NULL,NULL,0,NULL,NULL),('402881e520045b7401200460b9190003','402881f0199a24d401199a2832d20002','402881e520045b74012004607d870002','同意',NULL,'402881f0199a24d401199a2832d20002','402881e51d723d5e011d724633210004','toActivity',NULL,NULL,'Y','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e520045b7401200460e48e0004','402881f0199a24d401199a2832d20002','402881e520045b74012004607d870002','不同意',NULL,'402881f0199a24d401199a2832d20002','402881f0199a24d401199a2962d60003','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e5212aaa2d01212abf4a7e0027','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','到分支环节测试1',NULL,'ff808081178d304d01178d45e73a0001','402881e5212aaa2d01212abe7174001d','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e5212aaa2d01212ac191fd0031','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','到分支环节测试2',NULL,'ff808081178d304d01178d45e73a0001','402881e5212aaa2d01212abed81d0022','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521354f6801213558c2610042','ff808081178d304d01178d45e73a0001','402881e5212aaa2d01212abe7174001d','提交分支环节测试1_1',NULL,'ff808081178d304d01178d45e73a0001','402881e521354f68012135580e540036','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,'BY_END_USER',0,NULL,NULL),('402881e5213a45bf01213a4806030013','ff808081178d304d01178d45e73a0001','402881e5212aaa2d01212abed81d0022','提交分支环节测试2_2',NULL,'ff808081178d304d01178d45e73a0001','402881e5213a45bf01213a47682c000c','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e5213a45bf01213a516fec0025','ff808081178d304d01178d45e73a0001','402881e521354f68012135580e540036','提交到聚合A环节',NULL,'ff808081178d304d01178d45e73a0001','402881e5213a45bf01213a4c2956001e','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e5213a45bf01213a62119d002c','ff808081178d304d01178d45e73a0001','402881e5213a45bf01213a47682c000c','提交到聚合A环节',NULL,'ff808081178d304d01178d45e73a0001','402881e5213a45bf01213a4c2956001e','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e5216358880121635db8a60012','ff808081178d304d01178d45e73a0001','402881e52196c13d012196cf4b7a007c','提交单路由分单---主',NULL,'ff808081178d304d01178d45e73a0001','402881e5216358880121635d7e9b000d','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e5216366a1012163686d6f000f','ff808081178d304d01178d45e73a0001','402881e5216358880121635d7e9b000d','提交到路由分单节',NULL,'ff808081178d304d01178d45e73a0001','402881e5216366a101216369898d0015','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52163b9c9012163beaf19000d','ff808081178d304d01178d45e73a0001','402881e5216366a101216369898d0015','各走各的单路由分单',NULL,'ff808081178d304d01178d45e73a0001','402881e52163b9c9012163bf2cc50012','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52163b9c9012163c79a6d0043','ff808081178d304d01178d45e73a0001','402881e52163b9c9012163bf2cc50012','提交单路由分单---聚合C',NULL,'ff808081178d304d01178d45e73a0001','402881e52163b9c9012163c7203b003e','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521827a060121827aa4da0008','402881f0199a24d401199a2832d20002','402881e521827a060121827aa4da0007','提交会签','JHKJH','402881f0199a24d401199a2832d20002',NULL,'toActivity',NULL,'JHKH','N','N','N','JHJK',NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521827a060121827aa4da000a','402881f0199a24d401199a2832d20002','402881e521827a060121827aa4da0009','同意',NULL,'402881f0199a24d401199a2832d20002','402881e520045b74012004607d870002','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521827a060121827aa4da000b','402881f0199a24d401199a2832d20002','402881e521827a060121827aa4da0009','不同意',NULL,'402881f0199a24d401199a2832d20002','402881f0199a24d401199a2962d60003','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'2',NULL,NULL,0,NULL,NULL),('402881e521827a060121827aa4ea000d','402881f0199a24d401199a2832d20002','402881e521827a060121827aa4ea000c','同意',NULL,'402881f0199a24d401199a2832d20002','402881e51d723d5e011d724633210004','toActivity',NULL,NULL,'Y','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521827a060121827aa4ea000e','402881f0199a24d401199a2832d20002','402881e521827a060121827aa4ea000c','不同意',NULL,'402881f0199a24d401199a2832d20002','402881f0199a24d401199a2962d60003','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521827a060121827bd6270011','ff8080811922f6a901192408d490005c','402881e521827a060121827bd6270010','提交经理审批',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240b15390062','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521827a060121827bd6270012','ff8080811922f6a901192408d490005c','402881e521827a060121827bd6270010','提交给多个消息一个人处理',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240bec11006b','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'1',NULL,NULL,0,NULL,NULL),('402881e521827a060121827bd6270014','ff8080811922f6a901192408d490005c','402881e521827a060121827bd6270013','提交结束',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240dba870072','toActivity',NULL,NULL,'Y','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521827a060121827bd6270016','ff8080811922f6a901192408d490005c','402881e521827a060121827bd6270015','提交给多个消息一个人处理',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240bec11006b','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e521827a060121827bd6270018','ff8080811922f6a901192408d490005c','402881e521827a060121827bd6270017','提交总经理审批',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240d17910070','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2a8dc000b','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a8cc0006','提交分支环节测试1_1',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aa910037','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,'BY_END_USER',0,NULL,NULL),('402881e52191b22b012191b2a9390011','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a90a000c','提交分支环节测试2_2',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aadf003a','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2a9490014','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a9390012','全部聚合--环节2_2',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a997001b','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2a9870017','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a9490015','全部聚合--环节1_1',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a9870018','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2a997001a','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a9870018','提交全部聚合B',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a9a7001e','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2a9a7001d','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a997001b','提交全部聚合B',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a9a7001e','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2a9d60020','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a9a7001e','提交单表单分单',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aa43002e','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2a9d60021','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a9a7001e','提交单路由分单---主',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aa43002e','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2aa140024','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2a9d60022','提交单路由分单---聚合C',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aa140025','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2aa43002c','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2aa330027','同意','end','ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2ab5c004c','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,'BY_VALUE',100,NULL,'agree'),('402881e52191b22b012191b2aa43002d','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2aa330027','不同意',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2ab0e0041','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'2',NULL,'BY_VALUE',0,NULL,'unagree'),('402881e52191b22b012191b2aa720030','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2aa43002e','提交到路由分单节',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aa720031','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2aa910036','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2aa720031','各走各的单路由分单',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a9d60022','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2aadf0039','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2aa910037','提交到聚合A环节',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aaef003d','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2aaef003c','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2aadf003a','提交到聚合A环节',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aaef003d','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2ab0e003f','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2aaef003d','提交全部聚合--环节2',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a9390012','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2ab0e0040','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2aaef003d','提交全部聚合--环节1',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a9490015','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2ab0e0042','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2ab0e0041','提交传签','test_activity4','ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2ab0e0043','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2ab5c0048','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2ab0e0043','同意','fghgf','ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2aa330027','toActivity',NULL,NULL,'N',NULL,'N',NULL,NULL,NULL,'0',NULL,'BY_VALUE',100,'Y','agree'),('402881e52191b22b012191b2ab5c0049','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2ab0e0043','到分支环节测试1',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a8cc0006','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2ab5c004a','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2ab0e0043','到分支环节测试2',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2a90a000c','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52191b22b012191b2ab5c004b','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2ab0e0043','不同意',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2ab0e0041','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'2',NULL,'BY_VALUE',0,'Y','unagree'),('402881e52191b22b012191b2ab7b0052','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2ab5c004c','不同意',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2ab0e0041','toActivity',NULL,NULL,'N','N','Y',NULL,NULL,NULL,'0',NULL,'BY_VALUE',0,NULL,'unagree'),('402881e52191b22b012191b2ab7b0053','402881e52191b22b012191b2a8ad0005','402881e52191b22b012191b2ab5c004c','同意',NULL,'ff808081178d304d01178d45e73a0001','402881e52191b22b012191b2ab7b0054','toActivity',NULL,NULL,'Y','N','N',NULL,NULL,NULL,'0',NULL,'BY_VALUE',100,NULL,'agree'),('402881e52196c13d012196c99a53002d','ff808081178d304d01178d45e73a0001','402881e5213a45bf01213a4c2956001e','提交全部聚合--环节1',NULL,'ff808081178d304d01178d45e73a0001','402881e52196c13d012196cb5eb80041','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52196c13d012196c9e6210032','ff808081178d304d01178d45e73a0001','402881e5213a45bf01213a4c2956001e','提交全部聚合--环节2',NULL,'ff808081178d304d01178d45e73a0001','402881e52196c13d012196cae532003b','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52196c13d012196cda6750066','ff808081178d304d01178d45e73a0001','402881e52196c13d012196cae532003b','全部聚合--环节2_2',NULL,'ff808081178d304d01178d45e73a0001','402881e52196c13d012196cec4a70077','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52196c13d012196cdfd5f006d','ff808081178d304d01178d45e73a0001','402881e52196c13d012196cb5eb80041','全部聚合--环节1_1',NULL,'ff808081178d304d01178d45e73a0001','402881e52196c13d012196ce64d30072','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52196c13d012196d005c20082','ff808081178d304d01178d45e73a0001','402881e52196c13d012196ce64d30072','提交全部聚合B',NULL,'ff808081178d304d01178d45e73a0001','402881e52196c13d012196cf4b7a007c','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52196c13d012196d03aad0087','ff808081178d304d01178d45e73a0001','402881e52196c13d012196cec4a70077','提交全部聚合B',NULL,'ff808081178d304d01178d45e73a0001','402881e52196c13d012196cf4b7a007c','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881e52197188101215e7b3afb001d','ff808081178d304d01178d45e73a0001','402881e52196c13d012196cf4b7a007c','提交单表单分单',NULL,'ff808081178d304d01178d45e73a0001','402881e5216358880121635d7e9b000d','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('402881f0199a24d401199a2a036c0004','402881f0199a24d401199a2832d20002','402881f0199a24d401199a2962d60003','提交会签','JHKJH','402881f0199a24d401199a2832d20002',NULL,'toActivity',NULL,'JHKH','N','N','N','JHJK',NULL,NULL,'0','JHJKJHKJH',NULL,0,NULL,NULL),('8a90247317b150a30117b16e15ee0005','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','同意','fghgf','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16db07d0004','toActivity',NULL,NULL,'N',NULL,'N',NULL,NULL,NULL,'0',NULL,'BY_VALUE',100,'Y','agree'),('8a90247317b150a30117b16e5b730006','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16d1c7b0003','同意',NULL,'ff808081178d304d01178d45e73a0001','2c92897a18baf3c30118bafc9cba000a','toActivity',NULL,NULL,'Y','N','N',NULL,NULL,NULL,'0',NULL,'BY_VALUE',100,NULL,'agree'),('ff8080811797373f01179750001d0003','ff8080811797373f01179739bb010001','ff8080811797373f011797429d6b0002','转给一线',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff808081184497bf011844c47a030001','ff808081178d304d01178d45e73a0001','ff808081179cf63c01179cf9fa830001','提交传签','test_activity4','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16b20da0002','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811891b9f3011891c470190023','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16db07d0004','同意','end','ff808081178d304d01178d45e73a0001','8a90247317b150a30117b16d1c7b0003','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,'BY_VALUE',100,NULL,'agree'),('ff80808118bd90db0118bda303510019','ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda1f8690018','提交经理审批','pt2a1r1','ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda3ea75001a','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff80808118bd90db0118bda4b007001f','ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda3ea75001a','提交顺序会签','p2a2r1','ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda590360020','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff80808118bd90db0118bda6c0c70025','ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda590360020','提交总经理审核','p2a3r1','ff80808118bd90db0118bda0936b0017',NULL,NULL,NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff80808118bd90db0118bda8496a002f','ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda76e1e0026','提交归档',NULL,'ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda8bd910030','toActivity',NULL,NULL,'Y','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811922f6a90119240e5a520073','ff8080811922f6a901192408d490005c','ff8080811922f6a90119240a3a2b005d','提交经理审批',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240b15390062','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811922f6a90119240f07f70074','ff8080811922f6a901192408d490005c','ff8080811922f6a90119240a3a2b005d','提交给多个消息一个人处理',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240bec11006b','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'1',NULL,NULL,0,NULL,NULL),('ff8080811922f6a90119240f64300075','ff8080811922f6a901192408d490005c','ff8080811922f6a90119240b15390062','提交给多个消息一个人处理',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240bec11006b','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811922f6a90119240fcf000076','ff8080811922f6a901192408d490005c','ff8080811922f6a90119240bec11006b','提交总经理审批',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240d17910070','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811922f6a90119241029360077','ff8080811922f6a901192408d490005c','ff8080811922f6a90119240d17910070','提交结束',NULL,'ff8080811922f6a901192408d490005c','ff8080811922f6a90119240dba870072','toActivity',NULL,NULL,'Y','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811922f6a901192410b97f0078','ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda1f8690018','提交顺序会签',NULL,'ff80808118bd90db0118bda0936b0017','ff80808118bd90db0118bda590360020','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811928036a0119281636440059','ff8080811928036a011928120f750047','ff8080811928036a01192812e0710048','提交经理审批','','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','toActivity','','','N','N','N','','','','0',NULL,NULL,0,'N',''),('ff8080811928036a0119281694de005a','ff8080811928036a011928120f750047','ff8080811928036a01192813cee80049','提交并行会签',NULL,'ff8080811928036a011928120f750047','ff8080811928036a01192814b272004e','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811928036a01192816ffed005b','ff8080811928036a011928120f750047','ff8080811928036a01192814b272004e','提交总经理审核',NULL,'ff8080811928036a011928120f750047','ff8080811928036a011928156a680053','toActivity',NULL,NULL,'N','N','N',NULL,NULL,NULL,'0',NULL,NULL,0,NULL,NULL),('ff8080811928036a011928176434005c','ff8080811928036a011928120f750047','ff8080811928036a011928156a680053','提交结束','','ff8080811928036a011928120f750047','ff8080811928036a01192815db230058','toActivity','','','Y','N','N','','','','0',NULL,NULL,0,'N','');
/*!40000 ALTER TABLE `wfss_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_route_instance`
--

DROP TABLE IF EXISTS `wfss_route_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_route_instance` (
  `ROUTE_INSTANCE_ID` varchar(32) NOT NULL,
  `PROCESS_INSTANCE_ID` varchar(32) DEFAULT NULL,
  `FROM_ACTIVITYINST_ID` varchar(32) DEFAULT NULL,
  `TO_ACTIVITYINST_ID` varchar(32) DEFAULT NULL,
  `ROUTE_ID` varchar(32) DEFAULT NULL,
  `ROUTE_NAME` varchar(640) DEFAULT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ROUTE_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_route_instance`
--

LOCK TABLES `wfss_route_instance` WRITE;
/*!40000 ALTER TABLE `wfss_route_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `wfss_route_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_work_item_doen`
--

DROP TABLE IF EXISTS `wfss_work_item_doen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_work_item_doen` (
  `WORK_ITEM_ID` varchar(32) NOT NULL,
  `PROCESS_INSTANCE_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_INSTANCE_ID` varchar(32) DEFAULT NULL,
  `PARENT_ACTIVITY_INST_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(640) DEFAULT NULL,
  `APP_FORM_ID` varchar(32) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `SENDER_ID` varchar(32) DEFAULT NULL,
  `SENDER_NAME` varchar(32) DEFAULT NULL,
  `OWNER_ID` varchar(32) DEFAULT NULL,
  `OWNER_NAME` varchar(32) DEFAULT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  `COMPLETE_DATE` date DEFAULT NULL,
  `PROCESS_ID` varchar(32) DEFAULT NULL,
  `PROCESS_NAME` varchar(640) DEFAULT NULL,
  `TITLE` varchar(640) DEFAULT NULL,
  `IS_AGENTED_ORG_ID` varchar(32) DEFAULT NULL,
  `IS_AGENTED_ORG_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`WORK_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_work_item_doen`
--

LOCK TABLES `wfss_work_item_doen` WRITE;
/*!40000 ALTER TABLE `wfss_work_item_doen` DISABLE KEYS */;
INSERT INTO `wfss_work_item_doen` VALUES ('402881e63a554ae9013a556aece40004','402881e63a554ae9013a556aece40002','402881e63a554ae9013a556aece40003',NULL,'ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081178cf67e01178d0259960009','402881e63a554ae9013a556aecc40001','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','2012-10-12','2012-10-12','ff808081178d304d01178d45e73a0001','审批流程','dgfdg',NULL,NULL),('402881e63a597d59013a5a213d5d0001','ff808081272c6fcc01272c8b780d0015','ff808081272c6fcc01272c8b78170018','ff808081272c6fcc01272c8b780d0016','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','ff808081272c6fcc01272c8b780d0014','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-03-05','2012-10-13','ff808081178d304d01178d45e73a0001','基站审批流程','hhhhhhhh',NULL,NULL),('402881e63a597d59013a5a39a1900007','402881e63a597d59013a5a39a1900005','402881e63a597d59013a5a39a1900006',NULL,'ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081178cf67e01178d0259960009','402881e63a597d59013a5a39a1900004','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2012-10-13','2012-10-13','ff808081178d304d01178d45e73a0001','审批流程','我的测试1',NULL,NULL),('402881ea289eeba501289eed8aee0006','402881ea289eeba501289eed8aee0002','402881ea289eeba501289eed8aee0005','402881ea289eeba501289eed8aee0003','ff8080811928036a01192813cee80049','经理审批','ff808081178cf67e01178d0259960009','402881ea289eeba501289eed8ade0001','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-05-16','2010-05-16','ff8080811928036a011928120f750047','并行会签测试','gfdgfdg',NULL,NULL),('402881fa2cd5fbb0012cd5fd97830004','402881fa2cd5fbb0012cd5fd97830002','402881fa2cd5fbb0012cd5fd97830003',NULL,'ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081178cf67e01178d0259960009','402881fa2cd5fbb0012cd5fd97830001','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-12-11','2010-12-11','ff808081178d304d01178d45e73a0001','审批流程','dfds',NULL,NULL),('ff80808126a75e580126a769f6580022','ff80808126a75e580126a769f6580020','ff80808126a75e580126a769f6580021',NULL,'ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081178cf67e01178d0259960009','ff80808126a75e580126a769f655001f','46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','46B5B5BF043EA79F215B95F8A8CF1D0A','刘正仁','2010-02-07','2010-02-07','ff808081178d304d01178d45e73a0001','基站审批流程','刘 正 仁 测 试',NULL,NULL),('ff80808126f5e5500126f5f3c9840018','ff80808126a75e580126a7a497f10097','ff80808126a7b2470126a7b3f2f9000c','ff80808126a75e580126a7a497f10098','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','ff80808126a75e580126a7a497f10096','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-02-07','2010-02-24','ff808081178d304d01178d45e73a0001','基站审批流程','再 次 测 试',NULL,NULL),('ff80808126ffc6c00126ffcfe3350012','ff80808126ffc6c00126ffcfe333000e','ff80808126ffc6c00126ffcfe3350011','ff80808126ffc6c00126ffcfe333000f','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','ff80808126ffc6c00126ffcfe333000d','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-02-24','2010-05-15','ff808081178d304d01178d45e73a0001','基站审批流程','ytyty',NULL,NULL),('ff80808127002c3b0127002cc1d70004','ff80808126a75e580126a7a497f10097','ff80808127002c3b0127002cc1d70003','ff80808126a7b2470126a7b3f2f9000c','402881e5212aaa2d01212abed81d0022','分支环节测试2','402881e5212ff4a901212ff6d4cf0015','ff80808127002c3b0127002cc1d60002','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-02-24','2010-03-14','ff808081178d304d01178d45e73a0001','基站审批流程','分支环节测试2',NULL,NULL),('ff808081272c6fcc01272c9cab28003b','ff808081272c6fcc01272c9cab180037','ff808081272c6fcc01272c9cab28003a','ff808081272c6fcc01272c9cab180038','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','ff808081272c6fcc01272c9cab180036','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-03-05','2010-03-05','ff808081178d304d01178d45e73a0001','基站审批流程','hhhhhhhhhh',NULL,NULL),('ff808081272e37bf01272e4bed1c000d','ff808081272e37bf01272e4bed1c000b','ff808081272e37bf01272e4bed1c000c',NULL,'ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081178cf67e01178d0259960009','ff808081272e37bf01272e4bed14000a','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-03-05','2010-03-05','ff808081178d304d01178d45e73a0001','基站审批流程','gfgfgf',NULL,NULL),('ff808081289c0f8801289c1391660006','ff808081289c0f8801289c1391660002','ff808081289c0f8801289c1391660005','ff808081289c0f8801289c1391660003','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','ff808081289c0f8801289c1391660001','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15','2010-05-15','ff808081178d304d01178d45e73a0001','审批流程','我的测试',NULL,NULL),('ff808081289c1b2d01289c200295000b','ff808081289c1b2d01289c1f81300005','ff808081289c1b2d01289c200295000a','ff808081289c1b2d01289c1fc25f0008','8a90247317b150a30117b16db07d0004','站址谈判','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c1f81300004','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15','2010-12-12','ff808081178d304d01178d45e73a0001','审批流程','再一次测试',NULL,NULL),('ff808081289c314301289c32bfb30005','ff808081289c1b2d01289c29fe8d001d','ff808081289c314301289c32bfb30004','ff808081289c1b2d01289c29fe8d0020','ff8080811928036a01192814b272004e','并行会签','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c29fe8d001c','8873FA518265405763E919A125D540ED','刘正仁','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','2010-05-15','2010-05-15','ff8080811928036a011928120f750047','并行会签测试','并行流程',NULL,NULL),('ff808081289c314301289c32bfb30007','ff808081289c1b2d01289c29fe8d001d','ff808081289c314301289c32bfb30006','ff808081289c1b2d01289c29fe8d0020','ff8080811928036a01192814b272004e','并行会签','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c29fe8d001c','8873FA518265405763E919A125D540ED','刘正仁','FC409474641EB0CF6CE03B29663E58BB','林颖军','2010-05-15','2010-05-15','ff8080811928036a011928120f750047','并行会签测试','并行流程',NULL,NULL),('ff808081289c314301289c32bfb30009','ff808081289c1b2d01289c29fe8d001d','ff808081289c314301289c32bfb30008','ff808081289c1b2d01289c29fe8d0020','ff8080811928036a01192814b272004e','并行会签','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c29fe8d001c','8873FA518265405763E919A125D540ED','刘正仁','2551C200700BA543BBF3F9445F80C098','周旭顺','2010-05-15','2010-05-15','ff8080811928036a011928120f750047','并行会签测试','并行流程',NULL,NULL);
/*!40000 ALTER TABLE `wfss_work_item_doen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfss_work_item_doing`
--

DROP TABLE IF EXISTS `wfss_work_item_doing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wfss_work_item_doing` (
  `WORK_ITEM_ID` varchar(32) NOT NULL,
  `PROCESS_INSTANCE_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_INSTANCE_ID` varchar(32) DEFAULT NULL,
  `PARENT_ACTIVITY_INST_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_ID` varchar(32) DEFAULT NULL,
  `ACTIVITY_NAME` varchar(640) DEFAULT NULL,
  `APP_FORM_ID` varchar(32) DEFAULT NULL,
  `APP_ID` varchar(32) DEFAULT NULL,
  `SENDER_ID` varchar(32) DEFAULT NULL,
  `SENDER_NAME` varchar(32) DEFAULT NULL,
  `OWNER_ID` varchar(32) DEFAULT NULL,
  `OWNER_NAME` varchar(32) DEFAULT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  `IS_READ` varchar(2) DEFAULT NULL,
  `PROCESS_ID` varchar(32) DEFAULT NULL,
  `PROCESS_NAME` varchar(640) DEFAULT NULL,
  `TITLE` varchar(640) DEFAULT NULL,
  `STATES` varchar(8) DEFAULT NULL,
  `IS_AGENTED_ORG_ID` varchar(32) DEFAULT NULL,
  `IS_AGENTED_ORG_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`WORK_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfss_work_item_doing`
--

LOCK TABLES `wfss_work_item_doing` WRITE;
/*!40000 ALTER TABLE `wfss_work_item_doing` DISABLE KEYS */;
INSERT INTO `wfss_work_item_doing` VALUES ('402881e63a554ae9013a556aece40006','402881e63a554ae9013a556aece40002','402881e63a554ae9013a556aece40005','402881e63a554ae9013a556aece40003','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','402881e63a554ae9013a556aecc40001','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','8873FA518265405763E919A125D540ED','刘正仁','2012-10-12',NULL,'ff808081178d304d01178d45e73a0001','审批流程','dgfdg','DB',NULL,NULL),('402881e63a597d59013a5a3896890003','ff808081272c6fcc01272c8b780d0015','402881e63a597d59013a5a3896890002','ff808081272c6fcc01272c8b78170018','8a90247317b150a30117b16db07d0004','站址谈判','ff808081178cf67e01178d0259960009','ff808081272c6fcc01272c8b780d0014','8873FA518265405763E919A125D540ED','刘正仁','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','2012-10-13',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','hhhhhhhh','DB',NULL,NULL),('402881e63a597d59013a5a39a1900009','402881e63a597d59013a5a39a1900005','402881e63a597d59013a5a39a1900008','402881e63a597d59013a5a39a1900006','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','402881e63a597d59013a5a39a1900004','8873FA518265405763E919A125D540ED','刘正仁','FC409474641EB0CF6CE03B29663E58BB','林颖军','2012-10-13',NULL,'ff808081178d304d01178d45e73a0001','审批流程','我的测试1','DB',NULL,NULL),('402881fa2cd5fbb0012cd5fd97830006','402881fa2cd5fbb0012cd5fd97830002','402881fa2cd5fbb0012cd5fd97830005','402881fa2cd5fbb0012cd5fd97830003','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','402881fa2cd5fbb0012cd5fd97830001','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-12-11',NULL,'ff808081178d304d01178d45e73a0001','审批流程','dfds','DB',NULL,NULL),('ff80808126ffc6c00126ffcef4150009','ff80808126ffc6c00126ffcef4150007','ff80808126ffc6c00126ffcef4150008',NULL,'402881e521827a060121827bd6270010','员工审请','ff808081178cf67e01178d0259960009','ff80808126ffc6c00126ffcef40f0006','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-02-24',NULL,'ff8080811922f6a901192408d490005c','土建流程','yyyy','CG',NULL,NULL),('ff808081272e37bf01272e4bed21000f','ff808081272e37bf01272e4bed1c000b','ff808081272e37bf01272e4bed20000e','ff808081272e37bf01272e4bed1c000c','8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','ff808081272e37bf01272e4bed14000a','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-03-05',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','gfgfgf','DB',NULL,NULL),('ff80808127d314f30127d31c1f710004','ff80808127d314f30127d31c1f710002','ff80808127d314f30127d31c1f710003',NULL,'ff808081179cf63c01179cf9fa830001','网建部录入数据','ff808081178cf67e01178d0259960009','ff80808127d314f30127d31c1f710001','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-04-06',NULL,'ff808081178d304d01178d45e73a0001','审批流程','<,>=','CG',NULL,NULL),('ff808081289c1b2d01289c1c65b70003','ff808081289c0f8801289c1391660002','ff808081289c1b2d01289c1c65b70002','ff808081289c0f8801289c1391660005','402881e5212aaa2d01212abe7174001d','分支环节测试1','402881e5212ff4a901212ff62332000b','ff808081289c1b2d01289c1c65b70001','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15',NULL,'ff808081178d304d01178d45e73a0001','审批流程','分支环节测试1','DB',NULL,NULL),('ff808081289c1b2d01289c23fd32000f','ff808081289c1b2d01289c23fd32000d','ff808081289c1b2d01289c23fd32000e',NULL,'ff8080811928036a01192812e0710048','员工审请','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c23fd32000c','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15',NULL,'ff8080811928036a011928120f750047','并行会签测试','hello 并行会签','CG',NULL,NULL),('ff808081289c314301289c3f5a240012','ff808081289c1b2d01289c29fe8d001d','ff808081289c314301289c3c59b5000f','ff808081289c314301289c32bfb30008','ff8080811928036a011928156a680053','总经理审核','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c29fe8d001c','2551C200700BA543BBF3F9445F80C098','周旭顺','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','2010-05-15',NULL,'ff8080811928036a011928120f750047','并行会签测试','并行流程','DB',NULL,NULL),('ff808081289c314301289c41793b0015','ff80808126ffc6c00126ffcfe333000e','ff808081289c314301289c41793b0014','ff80808126ffc6c00126ffcfe3350011','402881e5212aaa2d01212abe7174001d','分支环节测试1','402881e5212ff4a901212ff62332000b','ff808081289c314301289c41793b0013','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-05-15',NULL,'ff808081178d304d01178d45e73a0001','基站审批流程','分支环节测试1','DB',NULL,NULL),('ff8080812cd952ae012cd95cf0a90008','ff8080812cd952ae012cd95cc0040002','ff8080812cd952ae012cd95cc0040003',NULL,'8a90247317b150a30117b16b20da0002','设计院、运维部网优中心、县分人员并行传签','ff808081178cf67e01178d0259960009','ff8080812cd952ae012cd95cc0040001','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-12-12',NULL,'ff808081178d304d01178d45e73a0001','审批流程','fdg','DB',NULL,NULL),('ff8080812cd952ae012cd9b91e90000c','ff808081289c1b2d01289c1f81300005','ff8080812cd952ae012cd9b91e90000b','ff808081289c1b2d01289c200295000a','8a90247317b150a30117b16d1c7b0003','网建部、运维部网优中心、县分人员并行会签','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c1f81300004','8873FA518265405763E919A125D540ED','刘正仁','8873FA518265405763E919A125D540ED','刘正仁','2010-12-12',NULL,'ff808081178d304d01178d45e73a0001','审批流程','再一次测试','DB',NULL,NULL),('ff8080812cd952ae012cd9b91e90000e','ff808081289c1b2d01289c1f81300005','ff8080812cd952ae012cd9b91e90000d','ff808081289c1b2d01289c200295000a','8a90247317b150a30117b16d1c7b0003','网建部、运维部网优中心、县分人员并行会签','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c1f81300004','8873FA518265405763E919A125D540ED','刘正仁','AA9162568C12F6F1EF0E8D68CE8DD98A','王敏','2010-12-12',NULL,'ff808081178d304d01178d45e73a0001','审批流程','再一次测试','DB',NULL,NULL),('ff8080812cd952ae012cd9b91e900010','ff808081289c1b2d01289c1f81300005','ff8080812cd952ae012cd9b91e90000f','ff808081289c1b2d01289c200295000a','8a90247317b150a30117b16d1c7b0003','网建部、运维部网优中心、县分人员并行会签','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c1f81300004','8873FA518265405763E919A125D540ED','刘正仁','FC409474641EB0CF6CE03B29663E58BB','林颖军','2010-12-12',NULL,'ff808081178d304d01178d45e73a0001','审批流程','再一次测试','DB',NULL,NULL),('ff8080812cd952ae012cd9b91e900012','ff808081289c1b2d01289c1f81300005','ff8080812cd952ae012cd9b91e900011','ff808081289c1b2d01289c200295000a','8a90247317b150a30117b16d1c7b0003','网建部、运维部网优中心、县分人员并行会签','ff808081178cf67e01178d0259960009','ff808081289c1b2d01289c1f81300004','8873FA518265405763E919A125D540ED','刘正仁','2551C200700BA543BBF3F9445F80C098','周旭顺','2010-12-12',NULL,'ff808081178d304d01178d45e73a0001','审批流程','再一次测试','DB',NULL,NULL);
/*!40000 ALTER TABLE `wfss_work_item_doing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-21 11:06:00
