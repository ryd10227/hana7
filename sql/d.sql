-- MySQL dump 10.13  Distrib 9.3.0, for macos14.7 (arm64)
--
-- Host: 127.0.0.1    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Dept`
--

DROP TABLE IF EXISTS `Dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dept` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '상위부서id',
  `dname` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `captain` int unsigned DEFAULT NULL COMMENT '부서장',
  PRIMARY KEY (`id`),
  KEY `captain` (`captain`),
  CONSTRAINT `dept_ibfk_1` FOREIGN KEY (`captain`) REFERENCES `Emp` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dept`
--

LOCK TABLES `Dept` WRITE;
/*!40000 ALTER TABLE `Dept` DISABLE KEYS */;
INSERT INTO `Dept` VALUES (1,0,'영업부',NULL),(2,0,'개발부',30),(3,1,'영업1팀',78),(4,1,'영업2팀',51),(5,1,'영업3팀',169),(6,2,'서버팀',109),(7,2,'클라이언트팀',150),(8,6,'인프라셀',NULL),(9,6,'DB셀',NULL),(10,7,'모바일셀',NULL);
/*!40000 ALTER TABLE `Dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Emp`
--

DROP TABLE IF EXISTS `Emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Emp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ename` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept` tinyint unsigned NOT NULL,
  `auth` tinyint unsigned NOT NULL DEFAULT '9' COMMENT '0:sysadmin, 1: superuser,...',
  `salary` int NOT NULL DEFAULT '0',
  `outdt` date DEFAULT NULL,
  `outdtVarchar` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '퇴사일varchar',
  `remark` json DEFAULT NULL,
  `remark2` text COLLATE utf8mb4_unicode_ci,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept` (`dept`),
  KEY `idx_Emp_email` (`Email`),
  KEY `idx_Emp_mobile` (`mobile`),
  KEY `functional_index` ((substring_index(`Email`,_utf8mb4'@',-(1)))),
  KEY `functional_index_mobile` ((substr(`mobile`,8,4))),
  CONSTRAINT `fk_Dept_captain_Emp` FOREIGN KEY (`dept`) REFERENCES `Dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Emp`
--

LOCK TABLES `Emp` WRITE;
/*!40000 ALTER TABLE `Emp` DISABLE KEYS */;
INSERT INTO `Emp` VALUES (2,'유세혜',4,9,300,NULL,NULL,'{\"id\": 1, \"age\": 30, \"fam\": [{\"id\": 1, \"name\": \"유세차\"}]}','{\"id\": 1, \"age\": 30, \"fam\": [{\"id\": 1, \"name\": \"유세차\"}]}','mail2@gmail.com','01000000002'),(3,'원사아',4,9,100,'2025-04-25','2025-04-25',NULL,NULL,'mail3@gmail.com','01000000003'),(4,'김태혜',5,9,700,NULL,NULL,NULL,NULL,'mail4@gmail.com','01000000004'),(5,'지세국',7,9,400,'2025-04-25','2025-04-25',NULL,NULL,'mail5@gmail.com','01000000005'),(6,'최가국',4,9,800,NULL,NULL,NULL,NULL,'mail6@gmail.com','01000000006'),(7,'배파나',1,9,800,NULL,NULL,NULL,NULL,'mail7@gmail.com','01000000007'),(8,'원성결',2,9,200,NULL,NULL,NULL,NULL,'mail8@gmail.com','01000000008'),(9,'전바찬',6,9,900,NULL,NULL,NULL,NULL,'mail9@gmail.com','01000000009'),(10,'지윤희',5,9,500,NULL,NULL,NULL,NULL,'mail10@gmail.com','01000000010'),(11,'전차가',1,9,900,NULL,NULL,NULL,NULL,'mail11@gmail.com','01000000011'),(12,'지호하',3,9,800,NULL,NULL,NULL,NULL,'mail12@gmail.com','01000000012'),(13,'최종라',5,9,300,NULL,NULL,NULL,NULL,'mail13@gmail.com','01000000013'),(14,'마마순',1,9,700,'2025-05-01','2025-05-01',NULL,NULL,'mail14@gmail.com','01000000014'),(15,'원자파',7,9,200,NULL,NULL,NULL,NULL,'mail15@gmail.com','01000000015'),(16,'이결세',7,9,700,NULL,NULL,NULL,NULL,'mail16@gmail.com','01000000016'),(17,'원호신',2,9,600,NULL,NULL,NULL,NULL,'mail17@gmail.com','01000000017'),(18,'전국찬',3,9,904,NULL,NULL,NULL,NULL,'mail18@gmail.com','01000000018'),(19,'방성찬',3,9,800,NULL,NULL,NULL,NULL,'mail19@gmail.com','01000000019'),(20,'최희결',5,9,700,NULL,NULL,NULL,NULL,'mail20@gmail.com','01000000020'),(21,'지찬파',2,9,600,NULL,NULL,NULL,NULL,'mail21@gmail.com','01000000021'),(22,'최파지',4,9,100,NULL,NULL,NULL,NULL,'mail22@gmail.com','01000000022'),(23,'마다윤',4,9,300,NULL,NULL,NULL,NULL,'mail23@gmail.com','01000000023'),(24,'이윤파',6,9,600,NULL,NULL,NULL,NULL,'mail24@gmail.com','01000000024'),(25,'전다윤',3,9,800,NULL,NULL,NULL,NULL,'mail25@gmail.com','01000000025'),(26,'김나나',1,9,800,'2025-05-01','2025-05-01',NULL,NULL,'mail26@gmail.com','01000000026'),(27,'원호순',7,9,600,NULL,NULL,NULL,NULL,'mail27@gmail.com','01000000027'),(28,'조국국',7,9,400,NULL,NULL,NULL,NULL,'mail28@gmail.com','01000000028'),(29,'이윤바',1,9,300,NULL,NULL,NULL,NULL,'mail29@gmail.com','01000000029'),(30,'김바순',2,9,800,NULL,NULL,NULL,NULL,'mail30@gmail.com','01000000030'),(31,'방윤윤',6,9,600,NULL,NULL,NULL,NULL,'mail31@gmail.com','01000000031'),(32,'방호지',4,9,900,NULL,NULL,NULL,NULL,'mail32@gmail.com','01000000032'),(33,'최마호',1,9,500,NULL,NULL,NULL,NULL,'mail33@gmail.com','01000000033'),(34,'전아가',3,9,600,NULL,NULL,NULL,NULL,'mail34@gmail.com','01000000034'),(35,'원성태',6,9,600,NULL,NULL,NULL,NULL,'mail35@gmail.com','01000000035'),(36,'마다라',3,9,900,NULL,NULL,NULL,NULL,'mail36@gmail.com','01000000036'),(37,'지라파',3,9,200,NULL,NULL,NULL,NULL,'mail37@gmail.com','01000000037'),(38,'김자나',3,9,300,NULL,NULL,NULL,NULL,'mail38@gmail.com','01000000038'),(39,'전가순',2,9,400,NULL,NULL,NULL,NULL,'mail39@gmail.com','01000000039'),(40,'유호가',6,9,400,NULL,NULL,NULL,NULL,'mail40@gmail.com','01000000040'),(41,'방사자',6,9,400,NULL,NULL,NULL,NULL,'mail41@gmail.com','01000000041'),(42,'마윤결',2,9,700,NULL,NULL,NULL,NULL,'mail42@gmail.com','01000000042'),(43,'마마차',1,9,800,NULL,NULL,NULL,NULL,'mail43@gmail.com','01000000043'),(44,'이찬가',4,9,100,NULL,NULL,NULL,NULL,'mail44@gmail.com','01000000044'),(45,'유태파',5,9,500,NULL,NULL,NULL,NULL,'mail45@gmail.com','01000000045'),(46,'유호다',4,9,200,NULL,NULL,NULL,NULL,'mail46@gmail.com','01000000046'),(47,'이신희',6,9,907,NULL,NULL,NULL,NULL,'mail47@gmail.com','01000000047'),(48,'천마라',7,9,200,NULL,NULL,NULL,NULL,'mail48@gmail.com','01000000048'),(49,'이순아',4,9,600,NULL,NULL,NULL,NULL,'mail49@gmail.com','01000000049'),(50,'최찬자',7,9,200,NULL,NULL,NULL,NULL,'mail50@gmail.com','01000000050'),(51,'김바가',4,9,500,NULL,NULL,NULL,NULL,'mail51@gmail.com','01000000051'),(52,'원가국',6,9,600,NULL,NULL,NULL,NULL,'mail52@gmail.com','01000000052'),(53,'방가다',7,9,100,NULL,NULL,NULL,NULL,'mail53@gmail.com','01000000053'),(54,'전순차',6,9,700,NULL,NULL,NULL,NULL,'mail54@gmail.com','01000000054'),(55,'조종차',5,9,600,NULL,NULL,NULL,NULL,'mail55@gmail.com','01000000055'),(56,'전호라',3,9,200,NULL,NULL,NULL,NULL,'mail56@gmail.com','01000000056'),(57,'천호윤',4,9,500,NULL,NULL,NULL,NULL,'mail57@gmail.com','01000000057'),(58,'마신혜',1,9,300,NULL,NULL,NULL,NULL,'mail58@gmail.com','01000000058'),(59,'전세국',2,9,600,NULL,NULL,NULL,NULL,'mail59@gmail.com','01000000059'),(60,'지호태',2,9,300,NULL,NULL,NULL,NULL,'mail60@gmail.com','01000000060'),(61,'유혜태',4,9,700,NULL,NULL,NULL,NULL,'mail61@gmail.com','01000000061'),(62,'천세찬',4,9,800,NULL,NULL,NULL,NULL,'mail62@gmail.com','01000000062'),(63,'지바혜',3,9,200,NULL,NULL,NULL,NULL,'mail63@gmail.com','01000000063'),(64,'천가차',1,9,800,NULL,NULL,NULL,NULL,'mail64@gmail.com','01000000064'),(65,'배세사',2,9,800,NULL,NULL,NULL,NULL,'mail65@gmail.com','01000000065'),(66,'방나하',6,9,200,NULL,NULL,NULL,NULL,'mail66@gmail.com','01000000066'),(67,'최호태',1,9,800,NULL,NULL,NULL,NULL,'mail67@gmail.com','01000000067'),(68,'마가혜',3,9,100,NULL,NULL,NULL,NULL,'mail68@gmail.com','01000000068'),(69,'김성바',6,9,200,NULL,NULL,NULL,NULL,'mail69@gmail.com','01000000069'),(70,'방혜국',5,9,600,NULL,NULL,NULL,NULL,'mail70@gmail.com','01000000070'),(71,'이파파',4,9,300,NULL,NULL,NULL,NULL,'mail71@gmail.com','01000000071'),(72,'지윤혜',7,9,100,NULL,NULL,NULL,NULL,'mail72@gmail.com','01000000072'),(73,'박찬종',6,9,600,NULL,NULL,NULL,NULL,'mail73@gmail.com','01000000073'),(74,'방혜윤',3,9,300,NULL,NULL,NULL,NULL,'mail74@gmail.com','01000000074'),(75,'전호바',1,9,600,NULL,NULL,NULL,NULL,'mail75@gmail.com','01000000075'),(76,'유희마',1,9,700,NULL,NULL,NULL,NULL,'mail76@gmail.com','01000000076'),(77,'천성혜',7,9,500,NULL,NULL,NULL,NULL,'mail77@gmail.com','01000000077'),(78,'김나라',3,9,800,NULL,NULL,NULL,NULL,'mail78@gmail.com','01000000078'),(79,'최혜성',1,9,700,NULL,NULL,NULL,NULL,'mail79@gmail.com','01000000079'),(80,'지종라',4,9,905,NULL,NULL,NULL,NULL,'mail80@gmail.com','01000000080'),(81,'이바희',7,9,800,NULL,NULL,NULL,NULL,'mail81@gmail.com','01000000081'),(82,'최은가',4,9,800,NULL,NULL,NULL,NULL,'mail82@gmail.com','01000000082'),(83,'배자호',5,9,500,NULL,NULL,NULL,NULL,'mail83@gmail.com','01000000083'),(84,'배사파',7,9,500,NULL,NULL,NULL,NULL,'mail84@gmail.com','01000000084'),(85,'마성다',2,9,400,NULL,NULL,NULL,NULL,'mail85@gmail.com','01000000085'),(86,'최국세',3,9,600,NULL,NULL,NULL,NULL,'mail86@gmail.com','01000000086'),(87,'유다지',4,9,600,NULL,NULL,NULL,NULL,'mail87@gmail.com','01000000087'),(88,'천결신',4,9,400,NULL,NULL,NULL,NULL,'mail88@gmail.com','01000000088'),(89,'박태사',7,9,300,NULL,NULL,NULL,NULL,'mail89@gmail.com','01000000089'),(90,'원파가',7,9,900,NULL,NULL,NULL,NULL,'mail90@gmail.com','01000000090'),(91,'마순차',7,9,300,NULL,NULL,NULL,NULL,'mail91@gmail.com','01000000091'),(92,'지호희',6,9,700,NULL,NULL,NULL,NULL,'mail92@gmail.com','01000000092'),(93,'최가국',6,9,800,NULL,NULL,NULL,NULL,'mail93@gmail.com','01000000093'),(94,'마성나',1,9,200,NULL,NULL,NULL,NULL,'mail94@gmail.com','01000000094'),(95,'조하마',4,9,700,NULL,NULL,NULL,NULL,'mail95@gmail.com','01000000095'),(96,'원바가',3,9,300,NULL,NULL,NULL,NULL,'mail96@gmail.com','01000000096'),(97,'최신세',2,9,903,NULL,NULL,NULL,NULL,'mail97@gmail.com','01000000097'),(98,'김은다',5,9,900,NULL,NULL,NULL,NULL,'mail98@gmail.com','01000000098'),(99,'천라국',5,9,500,NULL,NULL,NULL,NULL,'mail99@gmail.com','01000000099'),(100,'원신국',1,9,200,NULL,NULL,NULL,NULL,'mail100@gmail.com','01000000100'),(101,'방국윤',5,9,300,NULL,NULL,NULL,NULL,'mail101@gmail.com','01000000101'),(102,'박세찬',4,9,600,NULL,NULL,NULL,NULL,'mail102@gmail.com','01000000102'),(103,'최종다',4,9,500,NULL,NULL,NULL,NULL,'mail103@gmail.com','01000000103'),(104,'이신찬',4,9,900,NULL,NULL,NULL,NULL,'mail104@gmail.com','01000000104'),(105,'원종마',6,9,900,NULL,NULL,NULL,NULL,'mail105@gmail.com','01000000105'),(106,'최신호',6,9,200,NULL,NULL,NULL,NULL,'mail106@gmail.com','01000000106'),(107,'지차찬',3,9,100,NULL,NULL,NULL,NULL,'mail107@gmail.com','01000000107'),(108,'이나종',1,9,100,NULL,NULL,NULL,NULL,'mail108@gmail.com','01000000108'),(109,'김결나',6,9,500,NULL,NULL,NULL,NULL,'mail109@gmail.com','01000000109'),(110,'조파호',3,9,600,NULL,NULL,NULL,NULL,'mail110@gmail.com','01000000110'),(111,'유신찬',5,9,200,NULL,NULL,NULL,NULL,'mail111@gmail.com','01000000111'),(112,'원세태',1,9,200,NULL,NULL,NULL,NULL,'mail112@gmail.com','01000000112'),(113,'방호혜',5,9,800,NULL,NULL,NULL,NULL,'mail113@gmail.com','01000000113'),(114,'유마자',7,9,200,NULL,NULL,NULL,NULL,'mail114@gmail.com','01000000114'),(115,'최순신',2,9,900,NULL,NULL,NULL,NULL,'mail115@gmail.com','01000000115'),(116,'조윤혜',7,9,100,NULL,NULL,NULL,NULL,'mail116@gmail.com','01000000116'),(117,'조호호',3,9,400,NULL,NULL,NULL,NULL,'mail117@gmail.com','01000000117'),(118,'마세사',3,9,900,NULL,NULL,NULL,NULL,'mail118@gmail.com','01000000118'),(119,'방결희',1,9,600,NULL,NULL,NULL,NULL,'mail119@gmail.com','01000000119'),(120,'지국혜',1,9,300,NULL,NULL,NULL,NULL,'mail120@gmail.com','01000000120'),(121,'박세결',3,9,100,NULL,NULL,NULL,NULL,'mail121@gmail.com','01000000121'),(122,'조지혜',4,9,800,NULL,NULL,NULL,NULL,'mail122@gmail.com','01000000122'),(123,'방은희',7,9,800,NULL,NULL,NULL,NULL,'mail123@gmail.com','01000000123'),(124,'이성가',7,9,900,NULL,NULL,NULL,NULL,'mail124@gmail.com','01000000124'),(125,'원지신',5,9,300,NULL,NULL,NULL,NULL,'mail125@gmail.com','01000000125'),(126,'천윤아',3,9,600,NULL,NULL,NULL,NULL,'mail126@gmail.com','01000000126'),(127,'원순지',1,9,400,NULL,NULL,NULL,NULL,'mail127@gmail.com','01000000127'),(128,'이윤바',7,9,908,NULL,NULL,NULL,NULL,'mail128@gmail.com','01000000128'),(129,'김신호',6,9,300,NULL,NULL,NULL,NULL,'mail129@gmail.com','01000000129'),(130,'원혜호',2,9,600,NULL,NULL,NULL,NULL,'mail130@gmail.com','01000000130'),(131,'천윤사',2,9,800,NULL,NULL,NULL,NULL,'mail131@gmail.com','01000000131'),(132,'천희가',3,9,600,NULL,NULL,NULL,NULL,'mail132@gmail.com','01000000132'),(133,'원결바',5,9,906,NULL,NULL,NULL,NULL,'mail133@gmail.com','01000000133'),(134,'마성호',4,9,100,NULL,NULL,NULL,NULL,'mail134@gmail.com','01000000134'),(135,'이성다',3,9,800,NULL,NULL,NULL,NULL,'mail135@gmail.com','01000000135'),(136,'조사자',5,9,800,NULL,NULL,NULL,NULL,'mail136@gmail.com','01000000136'),(137,'천찬혜',3,9,400,NULL,NULL,NULL,NULL,'mail137@gmail.com','01000000137'),(138,'전지사',6,9,900,NULL,NULL,NULL,NULL,'mail138@gmail.com','01000000138'),(139,'방자세',2,9,800,NULL,NULL,NULL,NULL,'mail139@gmail.com','01000000139'),(140,'지아마',7,9,700,NULL,NULL,NULL,NULL,'mail140@gmail.com','01000000140'),(141,'김찬마',2,9,500,NULL,NULL,NULL,NULL,'mail141@gmail.com','01000000141'),(142,'방가사',7,9,500,NULL,NULL,NULL,NULL,'mail142@gmail.com','01000000142'),(143,'배아순',7,9,400,NULL,NULL,NULL,NULL,'mail143@gmail.com','01000000143'),(144,'최호희',6,9,200,NULL,NULL,NULL,NULL,'mail144@gmail.com','01000000144'),(145,'최혜혜',4,9,400,NULL,NULL,NULL,NULL,'mail145@gmail.com','01000000145'),(146,'유태차',3,9,200,NULL,NULL,NULL,NULL,'mail146@gmail.com','01000000146'),(147,'원국은',1,9,700,NULL,NULL,NULL,NULL,'mail147@gmail.com','01000000147'),(148,'조혜은',7,9,400,NULL,NULL,NULL,NULL,'mail148@gmail.com','01000000148'),(149,'조가마',2,9,200,NULL,NULL,NULL,NULL,'mail149@gmail.com','01000000149'),(150,'김찬라',7,9,300,NULL,NULL,NULL,NULL,'mail150@gmail.com','01000000150'),(151,'최신세',2,9,900,NULL,NULL,NULL,NULL,'mail151@gmail.com','01000000151'),(152,'박성종',1,9,902,NULL,NULL,NULL,NULL,'mail152@gmail.com','01000000152'),(153,'지나국',6,9,600,NULL,NULL,NULL,NULL,'mail153@gmail.com','01000000153'),(154,'마파결',1,9,500,NULL,NULL,NULL,NULL,'mail154@gmail.com','01000000154'),(155,'조태국',5,9,200,NULL,NULL,NULL,NULL,'mail155@gmail.com','01000000155'),(156,'방나차',3,9,600,NULL,NULL,NULL,NULL,'mail156@gmail.com','01000000156'),(157,'김지희',3,9,500,NULL,NULL,NULL,NULL,'mail157@gmail.com','01000000157'),(158,'유나순',5,9,100,NULL,NULL,NULL,NULL,'mail158@gmail.com','01000000158'),(159,'조윤호',6,9,100,NULL,NULL,NULL,NULL,'mail159@gmail.com','01000000159'),(160,'배다결',7,9,200,NULL,NULL,NULL,NULL,'mail160@gmail.com','01000000160'),(161,'배희호',1,9,500,NULL,NULL,NULL,NULL,'mail161@gmail.com','01000000161'),(162,'방호성',4,9,400,NULL,NULL,NULL,NULL,'mail162@gmail.com','01000000162'),(163,'김세은',3,9,900,NULL,NULL,NULL,NULL,'mail163@gmail.com','01000000163'),(164,'최성라',4,9,800,NULL,NULL,NULL,NULL,'mail164@gmail.com','01000000164'),(165,'마신신',1,9,200,NULL,NULL,NULL,NULL,'mail165@gmail.com','01000000165'),(166,'유윤사',2,9,800,NULL,NULL,NULL,NULL,'mail166@gmail.com','01000000166'),(167,'전파자',3,9,200,NULL,NULL,NULL,NULL,'mail167@gmail.com','01000000167'),(168,'박국다',3,9,300,NULL,NULL,NULL,NULL,'mail168@gmail.com','01000000168'),(169,'김다바',5,9,200,NULL,NULL,NULL,NULL,'mail169@gmail.com','01000000169'),(170,'원호신',6,9,700,NULL,NULL,NULL,NULL,'mail170@gmail.com','01000000170'),(171,'김호파',5,9,500,NULL,NULL,NULL,NULL,'mail171@gmail.com','01000000171'),(172,'방나자',2,9,900,NULL,NULL,NULL,NULL,'mail172@gmail.com','01000000172'),(173,'박세자',4,9,300,NULL,NULL,NULL,NULL,'mail173@gmail.com','01000000173'),(174,'원결바',4,9,500,NULL,NULL,NULL,NULL,'mail174@gmail.com','01000000174'),(175,'김태신',5,9,300,NULL,NULL,NULL,NULL,'mail175@gmail.com','01000000175'),(176,'최신신',2,9,700,NULL,NULL,NULL,NULL,'mail176@gmail.com','01000000176'),(177,'배가하',5,9,300,NULL,NULL,NULL,NULL,'mail177@gmail.com','01000000177'),(178,'지나다',2,9,200,NULL,NULL,NULL,NULL,'mail178@gmail.com','01000000178'),(179,'박사파',7,9,500,NULL,NULL,NULL,NULL,'mail179@gmail.com','01000000179'),(180,'천신아',4,9,300,NULL,NULL,NULL,NULL,'mail180@gmail.com','01000000180'),(181,'이가세',1,9,900,NULL,NULL,NULL,NULL,'mail181@gmail.com','01000000181'),(182,'방신다',4,9,100,NULL,NULL,NULL,NULL,'mail182@gmail.com','01000000182'),(183,'방태가',6,9,700,NULL,NULL,NULL,NULL,'mail183@gmail.com','01000000183'),(184,'박하아',7,9,500,NULL,NULL,NULL,NULL,'mail184@gmail.com','01000000184'),(185,'천성가',7,9,700,NULL,NULL,NULL,NULL,'mail185@gmail.com','01000000185'),(186,'이호라',3,9,400,NULL,NULL,NULL,NULL,'mail186@gmail.com','01000000186'),(187,'천다종',1,9,600,NULL,NULL,NULL,NULL,'mail187@gmail.com','01000000187'),(188,'이하결',7,9,700,NULL,NULL,NULL,NULL,'mail188@gmail.com','01000000188'),(189,'이은호',7,9,400,NULL,NULL,NULL,NULL,'mail189@gmail.com','01000000189'),(190,'이성다',3,9,800,NULL,NULL,NULL,NULL,'mail190@gmail.com','01000000190'),(191,'이신신',1,9,200,NULL,NULL,NULL,NULL,'mail191@gmail.com','01000000191'),(192,'마세가',2,9,100,NULL,NULL,NULL,NULL,'mail192@gmail.com','01000000192'),(193,'원세순',7,9,700,NULL,NULL,NULL,NULL,'mail193@gmail.com','01000000193'),(194,'원윤가',1,9,600,NULL,NULL,NULL,NULL,'mail194@gmail.com','01000000194'),(195,'김세윤',6,9,900,NULL,NULL,NULL,NULL,'mail195@gmail.com','01000000195'),(196,'최찬라',1,9,600,NULL,NULL,NULL,NULL,'mail196@gmail.com','01000000196'),(197,'유호윤',7,9,400,NULL,NULL,NULL,NULL,'mail197@gmail.com','01000000197'),(198,'박차호',5,9,700,NULL,NULL,NULL,NULL,'mail198@gmail.com','01000000198'),(199,'마바순',2,9,800,NULL,NULL,NULL,NULL,'mail199@gmail.com','01000000199'),(200,'방국가',1,9,200,NULL,NULL,NULL,NULL,'mail200@gmail.com','01000000200'),(201,'최세마',1,9,300,NULL,NULL,NULL,NULL,'mail201@gmail.com','01000000201'),(202,'조라종',6,9,500,NULL,NULL,NULL,NULL,'mail202@gmail.com','01000000202'),(203,'이지마',4,9,700,NULL,NULL,NULL,NULL,'mail203@gmail.com','01000000203'),(204,'김신호',6,9,300,NULL,NULL,NULL,NULL,'mail204@gmail.com','01000000204'),(205,'김은다',6,9,200,NULL,NULL,NULL,NULL,'mail205@gmail.com','01000000205'),(206,'마세혜',7,9,700,NULL,NULL,NULL,NULL,'mail206@gmail.com','01000000206'),(207,'김하세',1,9,200,NULL,NULL,NULL,NULL,'mail207@gmail.com','01000000207'),(208,'원순세',5,9,400,NULL,NULL,NULL,NULL,'mail208@gmail.com','01000000208'),(209,'원마종',6,9,600,NULL,NULL,NULL,NULL,'mail209@gmail.com','01000000209'),(210,'마사혜',2,9,200,NULL,NULL,NULL,NULL,'mail210@gmail.com','01000000210'),(211,'박나신',5,9,300,NULL,NULL,NULL,NULL,'mail211@gmail.com','01000000211'),(212,'전호사',6,9,100,NULL,NULL,NULL,NULL,'mail212@gmail.com','01000000212'),(213,'지지호',2,9,400,NULL,NULL,NULL,NULL,'mail213@gmail.com','01000000213'),(214,'천혜파',2,9,900,NULL,NULL,NULL,NULL,'mail214@gmail.com','01000000214'),(215,'지사세',6,9,700,NULL,NULL,NULL,NULL,'mail215@gmail.com','01000000215'),(216,'방나태',6,9,100,NULL,NULL,NULL,NULL,'mail216@gmail.com','01000000216'),(217,'김지하',6,9,400,NULL,NULL,NULL,NULL,'mail217@gmail.com','01000000217'),(218,'지찬태',3,9,300,NULL,NULL,NULL,NULL,'mail218@gmail.com','01000000218'),(219,'조사나',4,9,800,NULL,NULL,NULL,NULL,'mail219@gmail.com','01000000219'),(220,'지차순',6,9,800,NULL,NULL,NULL,NULL,'mail220@gmail.com','01000000220'),(221,'지희태',3,9,300,NULL,NULL,NULL,NULL,'mail221@gmail.com','01000000221'),(222,'이희나',5,9,800,NULL,NULL,NULL,NULL,'mail222@gmail.com','01000000222'),(223,'배신마',7,9,900,NULL,NULL,NULL,NULL,'mail223@gmail.com','01000000223'),(224,'배나희',3,9,900,NULL,NULL,NULL,NULL,'mail224@gmail.com','01000000224'),(225,'마아세',4,9,800,NULL,NULL,NULL,NULL,'mail225@gmail.com','01000000225'),(226,'전바신',2,9,900,NULL,NULL,NULL,NULL,'mail226@gmail.com','01000000226'),(227,'박희윤',1,9,200,NULL,NULL,NULL,NULL,'mail227@gmail.com','01000000227'),(228,'천결호',1,9,100,NULL,NULL,NULL,NULL,'mail228@gmail.com','01000000228'),(229,'마사혜',2,9,200,NULL,NULL,NULL,NULL,'mail229@gmail.com','01000000229'),(230,'최종바',6,9,300,NULL,NULL,NULL,NULL,'mail230@gmail.com','01000000230'),(231,'원파가',1,9,200,NULL,NULL,NULL,NULL,'mail231@gmail.com','01000000231'),(232,'지희결',5,9,200,NULL,NULL,NULL,NULL,'mail232@gmail.com','01000000232'),(233,'김자마',6,9,200,NULL,NULL,NULL,NULL,'mail233@gmail.com','01000000233'),(234,'방성세',1,9,900,NULL,NULL,NULL,NULL,'mail234@gmail.com','01000000234'),(235,'마바성',6,9,600,NULL,NULL,NULL,NULL,'mail235@gmail.com','01000000235'),(236,'천마마',2,9,200,NULL,NULL,NULL,NULL,'mail236@gmail.com','01000000236'),(237,'최가세',6,9,100,NULL,NULL,NULL,NULL,'mail237@gmail.com','01000000237'),(238,'김파희',3,9,200,NULL,NULL,NULL,NULL,'mail238@gmail.com','01000000238'),(239,'마찬아',5,9,900,NULL,NULL,NULL,NULL,'mail239@gmail.com','01000000239'),(240,'김세가',1,9,200,NULL,NULL,NULL,NULL,'mail240@gmail.com','01000000240'),(241,'전차나',2,9,700,NULL,NULL,NULL,NULL,'mail241@gmail.com','01000000241'),(242,'유희국',2,9,100,NULL,NULL,NULL,NULL,'mail242@gmail.com','01000000242'),(243,'전희마',1,9,800,NULL,NULL,NULL,NULL,'mail243@gmail.com','01000000243'),(244,'마호차',3,9,200,NULL,NULL,NULL,NULL,'mail244@gmail.com','01000000244'),(245,'배태바',5,9,600,NULL,NULL,NULL,NULL,'mail245@gmail.com','01000000245'),(246,'배나희',4,9,300,NULL,NULL,NULL,NULL,'mail246@gmail.com','01000000246'),(247,'유은종',6,9,300,NULL,NULL,NULL,NULL,'mail247@gmail.com','01000000247'),(248,'원세마',6,9,300,NULL,NULL,NULL,NULL,'mail248@gmail.com','01000000248'),(249,'배마가',4,9,100,NULL,NULL,NULL,NULL,'mail249@gmail.com','01000000249'),(250,'유결호',1,9,700,NULL,NULL,NULL,NULL,'mail250@gmail.com','01000000250'),(251,'지태윤',4,9,100,NULL,NULL,NULL,NULL,'mail251@gmail.com','01000000251'),(252,'배호가',7,9,600,NULL,NULL,NULL,NULL,'mail252@gmail.com','01000000252');
/*!40000 ALTER TABLE `Emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
  `workdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `writer` int unsigned DEFAULT NULL COMMENT '작성자',
  `contents` text COLLATE utf8mb4_unicode_ci COMMENT '내용',
  PRIMARY KEY (`id`),
  KEY `fk_Notice_writer_Emp` (`writer`),
  FULLTEXT KEY `ft_idx_Notice_title_contents` (`title`,`contents`),
  CONSTRAINT `fk_Notice_writer_Emp` FOREIGN KEY (`writer`) REFERENCES `Emp` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'2025-05-08 02:18:17','2025-05-08 02:18:17','세종대왕',NULL,'조선의 제4대 국왕이다.'),(2,'2025-05-08 02:18:17','2025-05-08 02:18:17','단군',NULL,'단군왕검(檀君王儉)은 한민족의 시조이자 고조선(古朝鮮)의 국조(國祖), 대종교의 시작.'),(3,'2025-05-08 02:18:17','2025-05-08 02:18:17','정약용',NULL,'조선 후기의 문신이자 실학자·저술가·시인·철학자·과학자·공학자이다.'),(4,'2025-05-08 02:18:17','2025-05-08 02:18:17','계백',NULL,'백제 말기의 군인이다.'),(5,'2025-05-08 02:18:17','2025-05-08 02:18:17','이순신',NULL,'조선 중기의 무신이었다. 본관은 덕수(德水), 자는 여해(汝諧), 시호는 충무(忠武).'),(6,'2025-05-08 02:18:17','2025-05-08 02:18:17','김유신',NULL,'신라의 화랑의 우두머리였으며 태대각간(太大角干)이었고 신라에 귀순한 가야 왕족의 후손.');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartiListTest`
--

DROP TABLE IF EXISTS `PartiListTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PartiListTest` (
  `studentno` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(dept)
(PARTITION p1 VALUES IN ('컴공','산공') ENGINE = InnoDB,
 PARTITION p2 VALUES IN ('사학','철학') ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartiListTest`
--

LOCK TABLES `PartiListTest` WRITE;
/*!40000 ALTER TABLE `PartiListTest` DISABLE KEYS */;
INSERT INTO `PartiListTest` VALUES ('8809080','컴공'),('0809080','산공'),('1809080','철학');
/*!40000 ALTER TABLE `PartiListTest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partirangetest`
--

DROP TABLE IF EXISTS `partirangetest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partirangetest` (
  `studentno` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enteryear` smallint NOT NULL,
  `studentname` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50100 PARTITION BY RANGE (`enteryear`)
(PARTITION p1 VALUES LESS THAN (2000) ENGINE = InnoDB,
 PARTITION p3 VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partirangetest`
--

LOCK TABLES `partirangetest` WRITE;
/*!40000 ALTER TABLE `partirangetest` DISABLE KEYS */;
INSERT INTO `partirangetest` VALUES ('8809080',1988,'팔팔학번'),('1809080',2018,'일팔학번');
/*!40000 ALTER TABLE `partirangetest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Professor` (
  `id` smallint unsigned NOT NULL COMMENT '교수번호',
  `name` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '교수명',
  `likecnt` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StopWord`
--

DROP TABLE IF EXISTS `StopWord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StopWord` (
  `value` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StopWord`
--

LOCK TABLES `StopWord` WRITE;
/*!40000 ALTER TABLE `StopWord` DISABLE KEYS */;
INSERT INTO `StopWord` VALUES ('가까스로'),('가령'),('각각'),('각자'),('각종'),('갖고말하자면'),('같다'),('같이'),('개의치않고'),('거니와'),('거바'),('거의'),('것과'),('것들'),('게다가'),('게우다'),('겨우'),('견지에서'),('이르다'),('있다'),('겸사겸사'),('고려하면'),('고로'),('공동으로'),('과연'),('관계없이'),('관련이'),('관하여'),('관한'),('관해서는'),('구체적으로'),('구토하다'),('그들'),('그때'),('그래'),('그래도'),('그래서'),('그러나'),('그러니'),('그러니까'),('그러면'),('그러므로'),('그러한즉'),('그런'),('까닭에'),('그런데'),('그런즉'),('그럼'),('그럼에도불구하고'),('그렇게'),('함으로써'),('그렇지'),('않다면'),('않으면'),('그렇지만'),('그렇지않으면'),('그리고'),('그리하여'),('그만이다'),('그에'),('따르는'),('그위에'),('그저'),('그중에서'),('그치지'),('않다'),('근거로'),('근거하여'),('기대여'),('기점으로'),('기준으로'),('기타'),('까닭으로'),('까악'),('까지'),('미치다'),('까지도'),('꽈당'),('끙끙'),('끼익'),('나머지는'),('남들'),('남짓'),('너희'),('너희들'),('논하지'),('놀라다'),('누가'),('알겠는가'),('누구'),('다른'),('방면으로'),('다만'),('다섯'),('다소'),('다수'),('다시'),('말하자면'),('다시말하면'),('다음'),('다음에'),('다음으로'),('단지'),('답다'),('당신'),('당장'),('대로'),('하다'),('대하면'),('대하여'),('대해'),('대해서'),('댕그'),('더구나'),('더군다나'),('더라도'),('더불어'),('더욱더'),('더욱이는'),('도달하다'),('도착하다'),('동시에'),('동안'),('된바에야'),('된이상'),('두번째로'),('둥둥'),('뒤따라'),('뒤이어'),('든간에'),('등등'),('딩동'),('따라'),('따라서'),('따위'),('따지지'),('때가'),('되어'),('때문에'),('또한'),('뚝뚝'),('해도'),('인하여'),('로부터'),('로써'),('마음대로'),('마저'),('마저도'),('마치'),('막론하고'),('못하다'),('만약'),('만약에'),('만은'),('아니다'),('만이'),('만일'),('만큼'),('말할것도'),('없고'),('매번'),('메쓰겁다'),('모두'),('무렵'),('무릎쓰고'),('무슨'),('무엇'),('무엇때문에'),('물론'),('바꾸어말하면'),('바꾸어말하자면'),('바꾸어서'),('말하면'),('한다면'),('바꿔'),('바로'),('바와같이'),('밖에'),('안된다'),('반대로'),('반드시'),('버금'),('보는데서'),('보다더'),('보드득'),('본대로'),('봐라'),('부류의'),('사람들'),('부터'),('불구하고'),('불문하고'),('붕붕'),('비걱거리다'),('비교적'),('비길수'),('없다'),('비로소'),('비록'),('비슷하다'),('비추어'),('보아'),('비하면'),('뿐만'),('아니라'),('뿐만아니라'),('뿐이다'),('삐걱'),('삐걱거리다'),('상대적으로'),('생각한대로'),('설령'),('설마'),('설사'),('소생'),('소인'),('습니까'),('습니다'),('시각'),('시간'),('시작하여'),('시초에'),('시키다'),('실로'),('심지어'),('아니'),('아니나다를가'),('아니라면'),('아니면'),('아니었다면'),('아래윗'),('아무거나'),('아무도'),('아야'),('아울러'),('아이'),('아이고'),('아이구'),('아이야'),('아이쿠'),('아하'),('아홉'),('않기'),('위하여'),('위해서'),('알았어'),('앞에서'),('앞의것'),('약간'),('양자'),('어기여차'),('어느'),('년도'),('어느것'),('어느곳'),('어느때'),('어느쪽'),('어느해'),('어디'),('어때'),('어떠한'),('어떤'),('어떤것'),('어떤것들'),('어떻게'),('어떻해'),('어이'),('어째서'),('어쨋든'),('어쩔수'),('어찌'),('어찌됏든'),('어찌됏어'),('어찌하든지'),('어찌하여'),('언제'),('언젠가'),('얼마'),('되는'),('얼마간'),('얼마나'),('얼마든지'),('얼마만큼'),('얼마큼'),('엉엉'),('가서'),('달려'),('한하다'),('에게'),('에서'),('여기'),('여덟'),('여러분'),('여보시오'),('여부'),('여섯'),('여전히'),('여차'),('연관되다'),('연이서'),('영차'),('옆사람'),('예를'),('들면'),('들자면'),('예컨대'),('예하면'),('오로지'),('오르다'),('오자마자'),('오직'),('오호'),('오히려'),('같은'),('와르르'),('와아'),('왜냐하면'),('외에도'),('요만큼'),('요만한'),('요만한걸'),('요컨대'),('우르르'),('우리'),('우리들'),('우선'),('우에'),('종합한것과같이'),('운운'),('위에서'),('서술한바와같이'),('윙윙'),('으로'),('으로서'),('으로써'),('응당'),('의거하여'),('의지하여'),('의해'),('의해되다'),('의해서'),('되다'),('외에'),('정도의'),('이것'),('이곳'),('이때'),('이라면'),('이래'),('이러이러하다'),('이러한'),('이런'),('이럴정도로'),('이렇게'),('많은'),('이렇게되면'),('이렇게말하자면'),('이렇구나'),('이로'),('이르기까지'),('이리하여'),('이만큼'),('이번'),('이봐'),('이상'),('이어서'),('이었다'),('이와'),('이와같다면'),('이외에도'),('이용하여'),('이유만으로'),('이젠'),('이지만'),('이쪽'),('이천구'),('이천육'),('이천칠'),('이천팔'),('듯하다'),('인젠'),('일것이다'),('일곱'),('일단'),('일때'),('일반적으로'),('일지라도'),('임에'),('틀림없다'),('입각하여'),('입장에서'),('잇따라'),('자기'),('자기집'),('자마자'),('자신'),('잠깐'),('잠시'),('저것'),('저것만큼'),('저기'),('저쪽'),('저희'),('전부'),('전자'),('전후'),('점에서'),('정도에'),('제각기'),('제외하고'),('조금'),('조차'),('조차도'),('졸졸'),('좋아'),('좍좍'),('주룩주룩'),('주저하지'),('않고'),('줄은'),('몰랏다'),('줄은모른다'),('중에서'),('중의하나'),('즈음하여'),('즉시'),('지든지'),('지만'),('지말고'),('진짜로'),('쪽으로'),('차라리'),('참나'),('첫번째로'),('총적으로'),('보면'),('콸콸'),('쾅쾅'),('타다'),('타인'),('탕탕'),('토하다'),('통하여'),('틈타'),('펄렁'),('하게될것이다'),('하게하다'),('하겠는가'),('하고'),('하고있었다'),('하곤하였다'),('하구나'),('하기'),('하기는한데'),('하기만'),('하면'),('하기보다는'),('하기에'),('하나'),('하느니'),('하는'),('김에'),('편이'),('낫다'),('하는것도'),('하는것만'),('하는것이'),('하는바'),('하더라도'),('하도다'),('하도록시키다'),('하도록하다'),('하든지'),('하려고하다'),('하마터면'),('할수록'),('하면된다'),('하면서'),('하물며'),('하여금'),('하여야'),('하자마자'),('하지'),('않는다면'),('않도록'),('하지마'),('하지마라'),('하지만'),('하하'),('이유는'),('몰라도'),('한데'),('한마디'),('한적이있다'),('한켠으로는'),('한항목'),('따름이다'),('생각이다'),('안다'),('지경이다'),('힘이'),('할때'),('할만하다'),('할망정'),('할뿐'),('할수있다'),('할수있어'),('할줄알다'),('할지라도'),('할지언정'),('함께'),('해도된다'),('해도좋다'),('해봐요'),('해서는'),('해야한다'),('해요'),('했어요'),('향하다'),('향하여'),('향해서'),('허걱'),('허허'),('헉헉'),('헐떡헐떡'),('형식으로'),('쓰여'),('혹시'),('혹은'),('혼자'),('훨씬'),('휘익'),('흐흐'),('힘입어');
/*!40000 ALTER TABLE `StopWord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subject`
--

DROP TABLE IF EXISTS `Subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subject` (
  `id` smallint unsigned NOT NULL,
  `name` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '과목명',
  `professor` smallint unsigned DEFAULT NULL COMMENT '교수번호',
  PRIMARY KEY (`id`),
  KEY `fk_Subject_professor_Professor` (`professor`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`professor`) REFERENCES `Professor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subject`
--

LOCK TABLES `Subject` WRITE;
/*!40000 ALTER TABLE `Subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `Subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T`
--

DROP TABLE IF EXISTS `T`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T`
--

LOCK TABLES `T` WRITE;
/*!40000 ALTER TABLE `T` DISABLE KEYS */;
INSERT INTO `T` VALUES (1,'홍길동');
/*!40000 ALTER TABLE `T` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestEmp`
--

DROP TABLE IF EXISTS `TestEmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TestEmp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ename` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept` tinyint unsigned NOT NULL,
  `auth` tinyint unsigned NOT NULL DEFAULT '9' COMMENT '0:sysadmin, 1: superuser,...',
  `salary` int NOT NULL DEFAULT '0',
  `outdt` date DEFAULT NULL,
  `outdtVarchar` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '퇴사일varchar',
  `remark` json DEFAULT NULL,
  `remark2` text COLLATE utf8mb4_unicode_ci,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50100 PARTITION BY RANGE (`id`)
(PARTITION p1 VALUES LESS THAN (100) ENGINE = InnoDB,
 PARTITION p2 VALUES LESS THAN (200) ENGINE = InnoDB,
 PARTITION p3 VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestEmp`
--

LOCK TABLES `TestEmp` WRITE;
/*!40000 ALTER TABLE `TestEmp` DISABLE KEYS */;
INSERT INTO `TestEmp` VALUES (2,'유세혜',4,9,300,NULL,NULL,'{\"id\": 1, \"age\": 30, \"fam\": [{\"id\": 1, \"name\": \"유세차\"}]}','{\"id\": 1, \"age\": 30, \"fam\": [{\"id\": 1, \"name\": \"유세차\"}]}','mail2@gmail.com','01000000002'),(3,'원사아',4,9,100,'2025-04-25','2025-04-25',NULL,NULL,'mail3@gmail.com','01000000003'),(4,'김태혜',5,9,700,NULL,NULL,NULL,NULL,'mail4@gmail.com','01000000004'),(5,'지세국',7,9,400,'2025-04-25','2025-04-25',NULL,NULL,'mail5@gmail.com','01000000005'),(6,'최가국',4,9,800,NULL,NULL,NULL,NULL,'mail6@gmail.com','01000000006'),(7,'배파나',1,9,800,NULL,NULL,NULL,NULL,'mail7@gmail.com','01000000007'),(8,'원성결',2,9,200,NULL,NULL,NULL,NULL,'mail8@gmail.com','01000000008'),(9,'전바찬',6,9,900,NULL,NULL,NULL,NULL,'mail9@gmail.com','01000000009'),(10,'지윤희',5,9,500,NULL,NULL,NULL,NULL,'mail10@gmail.com','01000000010'),(11,'전차가',1,9,900,NULL,NULL,NULL,NULL,'mail11@gmail.com','01000000011'),(12,'지호하',3,9,800,NULL,NULL,NULL,NULL,'mail12@gmail.com','01000000012'),(13,'최종라',5,9,300,NULL,NULL,NULL,NULL,'mail13@gmail.com','01000000013'),(14,'마마순',1,9,700,'2025-05-01','2025-05-01',NULL,NULL,'mail14@gmail.com','01000000014'),(15,'원자파',7,9,200,NULL,NULL,NULL,NULL,'mail15@gmail.com','01000000015'),(16,'이결세',7,9,700,NULL,NULL,NULL,NULL,'mail16@gmail.com','01000000016'),(17,'원호신',2,9,600,NULL,NULL,NULL,NULL,'mail17@gmail.com','01000000017'),(18,'전국찬',3,9,904,NULL,NULL,NULL,NULL,'mail18@gmail.com','01000000018'),(19,'방성찬',3,9,800,NULL,NULL,NULL,NULL,'mail19@gmail.com','01000000019'),(20,'최희결',5,9,700,NULL,NULL,NULL,NULL,'mail20@gmail.com','01000000020'),(21,'지찬파',2,9,600,NULL,NULL,NULL,NULL,'mail21@gmail.com','01000000021'),(22,'최파지',4,9,100,NULL,NULL,NULL,NULL,'mail22@gmail.com','01000000022'),(23,'마다윤',4,9,300,NULL,NULL,NULL,NULL,'mail23@gmail.com','01000000023'),(24,'이윤파',6,9,600,NULL,NULL,NULL,NULL,'mail24@gmail.com','01000000024'),(25,'전다윤',3,9,800,NULL,NULL,NULL,NULL,'mail25@gmail.com','01000000025'),(26,'김나나',1,9,800,'2025-05-01','2025-05-01',NULL,NULL,'mail26@gmail.com','01000000026'),(27,'원호순',7,9,600,NULL,NULL,NULL,NULL,'mail27@gmail.com','01000000027'),(28,'조국국',7,9,400,NULL,NULL,NULL,NULL,'mail28@gmail.com','01000000028'),(29,'이윤바',1,9,300,NULL,NULL,NULL,NULL,'mail29@gmail.com','01000000029'),(30,'김바순',2,9,800,NULL,NULL,NULL,NULL,'mail30@gmail.com','01000000030'),(31,'방윤윤',6,9,600,NULL,NULL,NULL,NULL,'mail31@gmail.com','01000000031'),(32,'방호지',4,9,900,NULL,NULL,NULL,NULL,'mail32@gmail.com','01000000032'),(33,'최마호',1,9,500,NULL,NULL,NULL,NULL,'mail33@gmail.com','01000000033'),(34,'전아가',3,9,600,NULL,NULL,NULL,NULL,'mail34@gmail.com','01000000034'),(35,'원성태',6,9,600,NULL,NULL,NULL,NULL,'mail35@gmail.com','01000000035'),(36,'마다라',3,9,900,NULL,NULL,NULL,NULL,'mail36@gmail.com','01000000036'),(37,'지라파',3,9,200,NULL,NULL,NULL,NULL,'mail37@gmail.com','01000000037'),(38,'김자나',3,9,300,NULL,NULL,NULL,NULL,'mail38@gmail.com','01000000038'),(39,'전가순',2,9,400,NULL,NULL,NULL,NULL,'mail39@gmail.com','01000000039'),(40,'유호가',6,9,400,NULL,NULL,NULL,NULL,'mail40@gmail.com','01000000040'),(41,'방사자',6,9,400,NULL,NULL,NULL,NULL,'mail41@gmail.com','01000000041'),(42,'마윤결',2,9,700,NULL,NULL,NULL,NULL,'mail42@gmail.com','01000000042'),(43,'마마차',1,9,800,NULL,NULL,NULL,NULL,'mail43@gmail.com','01000000043'),(44,'이찬가',4,9,100,NULL,NULL,NULL,NULL,'mail44@gmail.com','01000000044'),(45,'유태파',5,9,500,NULL,NULL,NULL,NULL,'mail45@gmail.com','01000000045'),(46,'유호다',4,9,200,NULL,NULL,NULL,NULL,'mail46@gmail.com','01000000046'),(47,'이신희',6,9,907,NULL,NULL,NULL,NULL,'mail47@gmail.com','01000000047'),(48,'천마라',7,9,200,NULL,NULL,NULL,NULL,'mail48@gmail.com','01000000048'),(49,'이순아',4,9,600,NULL,NULL,NULL,NULL,'mail49@gmail.com','01000000049'),(50,'최찬자',7,9,200,NULL,NULL,NULL,NULL,'mail50@gmail.com','01000000050'),(51,'김바가',4,9,500,NULL,NULL,NULL,NULL,'mail51@gmail.com','01000000051'),(52,'원가국',6,9,600,NULL,NULL,NULL,NULL,'mail52@gmail.com','01000000052'),(53,'방가다',7,9,100,NULL,NULL,NULL,NULL,'mail53@gmail.com','01000000053'),(54,'전순차',6,9,700,NULL,NULL,NULL,NULL,'mail54@gmail.com','01000000054'),(55,'조종차',5,9,600,NULL,NULL,NULL,NULL,'mail55@gmail.com','01000000055'),(56,'전호라',3,9,200,NULL,NULL,NULL,NULL,'mail56@gmail.com','01000000056'),(57,'천호윤',4,9,500,NULL,NULL,NULL,NULL,'mail57@gmail.com','01000000057'),(58,'마신혜',1,9,300,NULL,NULL,NULL,NULL,'mail58@gmail.com','01000000058'),(59,'전세국',2,9,600,NULL,NULL,NULL,NULL,'mail59@gmail.com','01000000059'),(60,'지호태',2,9,300,NULL,NULL,NULL,NULL,'mail60@gmail.com','01000000060'),(61,'유혜태',4,9,700,NULL,NULL,NULL,NULL,'mail61@gmail.com','01000000061'),(62,'천세찬',4,9,800,NULL,NULL,NULL,NULL,'mail62@gmail.com','01000000062'),(63,'지바혜',3,9,200,NULL,NULL,NULL,NULL,'mail63@gmail.com','01000000063'),(64,'천가차',1,9,800,NULL,NULL,NULL,NULL,'mail64@gmail.com','01000000064'),(65,'배세사',2,9,800,NULL,NULL,NULL,NULL,'mail65@gmail.com','01000000065'),(66,'방나하',6,9,200,NULL,NULL,NULL,NULL,'mail66@gmail.com','01000000066'),(67,'최호태',1,9,800,NULL,NULL,NULL,NULL,'mail67@gmail.com','01000000067'),(68,'마가혜',3,9,100,NULL,NULL,NULL,NULL,'mail68@gmail.com','01000000068'),(69,'김성바',6,9,200,NULL,NULL,NULL,NULL,'mail69@gmail.com','01000000069'),(70,'방혜국',5,9,600,NULL,NULL,NULL,NULL,'mail70@gmail.com','01000000070'),(71,'이파파',4,9,300,NULL,NULL,NULL,NULL,'mail71@gmail.com','01000000071'),(72,'지윤혜',7,9,100,NULL,NULL,NULL,NULL,'mail72@gmail.com','01000000072'),(73,'박찬종',6,9,600,NULL,NULL,NULL,NULL,'mail73@gmail.com','01000000073'),(74,'방혜윤',3,9,300,NULL,NULL,NULL,NULL,'mail74@gmail.com','01000000074'),(75,'전호바',1,9,600,NULL,NULL,NULL,NULL,'mail75@gmail.com','01000000075'),(76,'유희마',1,9,700,NULL,NULL,NULL,NULL,'mail76@gmail.com','01000000076'),(77,'천성혜',7,9,500,NULL,NULL,NULL,NULL,'mail77@gmail.com','01000000077'),(78,'김나라',3,9,800,NULL,NULL,NULL,NULL,'mail78@gmail.com','01000000078'),(79,'최혜성',1,9,700,NULL,NULL,NULL,NULL,'mail79@gmail.com','01000000079'),(80,'지종라',4,9,905,NULL,NULL,NULL,NULL,'mail80@gmail.com','01000000080'),(81,'이바희',7,9,800,NULL,NULL,NULL,NULL,'mail81@gmail.com','01000000081'),(82,'최은가',4,9,800,NULL,NULL,NULL,NULL,'mail82@gmail.com','01000000082'),(83,'배자호',5,9,500,NULL,NULL,NULL,NULL,'mail83@gmail.com','01000000083'),(84,'배사파',7,9,500,NULL,NULL,NULL,NULL,'mail84@gmail.com','01000000084'),(85,'마성다',2,9,400,NULL,NULL,NULL,NULL,'mail85@gmail.com','01000000085'),(86,'최국세',3,9,600,NULL,NULL,NULL,NULL,'mail86@gmail.com','01000000086'),(87,'유다지',4,9,600,NULL,NULL,NULL,NULL,'mail87@gmail.com','01000000087'),(88,'천결신',4,9,400,NULL,NULL,NULL,NULL,'mail88@gmail.com','01000000088'),(89,'박태사',7,9,300,NULL,NULL,NULL,NULL,'mail89@gmail.com','01000000089'),(90,'원파가',7,9,900,NULL,NULL,NULL,NULL,'mail90@gmail.com','01000000090'),(91,'마순차',7,9,300,NULL,NULL,NULL,NULL,'mail91@gmail.com','01000000091'),(92,'지호희',6,9,700,NULL,NULL,NULL,NULL,'mail92@gmail.com','01000000092'),(93,'최가국',6,9,800,NULL,NULL,NULL,NULL,'mail93@gmail.com','01000000093'),(94,'마성나',1,9,200,NULL,NULL,NULL,NULL,'mail94@gmail.com','01000000094'),(95,'조하마',4,9,700,NULL,NULL,NULL,NULL,'mail95@gmail.com','01000000095'),(96,'원바가',3,9,300,NULL,NULL,NULL,NULL,'mail96@gmail.com','01000000096'),(97,'최신세',2,9,903,NULL,NULL,NULL,NULL,'mail97@gmail.com','01000000097'),(98,'김은다',5,9,900,NULL,NULL,NULL,NULL,'mail98@gmail.com','01000000098'),(99,'천라국',5,9,500,NULL,NULL,NULL,NULL,'mail99@gmail.com','01000000099'),(150,'백오십',5,9,500,NULL,NULL,NULL,NULL,'mail150@gmail.com','01000000150'),(200,'방국가',1,9,200,NULL,NULL,NULL,NULL,'mail200@gmail.com','01000000200'),(201,'최세마',1,9,300,NULL,NULL,NULL,NULL,'mail201@gmail.com','01000000201'),(202,'조라종',6,9,500,NULL,NULL,NULL,NULL,'mail202@gmail.com','01000000202'),(203,'이지마',4,9,700,NULL,NULL,NULL,NULL,'mail203@gmail.com','01000000203'),(204,'김신호',6,9,300,NULL,NULL,NULL,NULL,'mail204@gmail.com','01000000204'),(205,'김은다',6,9,200,NULL,NULL,NULL,NULL,'mail205@gmail.com','01000000205'),(206,'마세혜',7,9,700,NULL,NULL,NULL,NULL,'mail206@gmail.com','01000000206'),(207,'김하세',1,9,200,NULL,NULL,NULL,NULL,'mail207@gmail.com','01000000207'),(208,'원순세',5,9,400,NULL,NULL,NULL,NULL,'mail208@gmail.com','01000000208'),(209,'원마종',6,9,600,NULL,NULL,NULL,NULL,'mail209@gmail.com','01000000209'),(210,'마사혜',2,9,200,NULL,NULL,NULL,NULL,'mail210@gmail.com','01000000210'),(211,'박나신',5,9,300,NULL,NULL,NULL,NULL,'mail211@gmail.com','01000000211'),(212,'전호사',6,9,100,NULL,NULL,NULL,NULL,'mail212@gmail.com','01000000212'),(213,'지지호',2,9,400,NULL,NULL,NULL,NULL,'mail213@gmail.com','01000000213'),(214,'천혜파',2,9,900,NULL,NULL,NULL,NULL,'mail214@gmail.com','01000000214'),(215,'지사세',6,9,700,NULL,NULL,NULL,NULL,'mail215@gmail.com','01000000215'),(216,'방나태',6,9,100,NULL,NULL,NULL,NULL,'mail216@gmail.com','01000000216'),(217,'김지하',6,9,400,NULL,NULL,NULL,NULL,'mail217@gmail.com','01000000217'),(218,'지찬태',3,9,300,NULL,NULL,NULL,NULL,'mail218@gmail.com','01000000218'),(219,'조사나',4,9,800,NULL,NULL,NULL,NULL,'mail219@gmail.com','01000000219'),(220,'지차순',6,9,800,NULL,NULL,NULL,NULL,'mail220@gmail.com','01000000220'),(221,'지희태',3,9,300,NULL,NULL,NULL,NULL,'mail221@gmail.com','01000000221'),(222,'이희나',5,9,800,NULL,NULL,NULL,NULL,'mail222@gmail.com','01000000222'),(223,'배신마',7,9,900,NULL,NULL,NULL,NULL,'mail223@gmail.com','01000000223'),(224,'배나희',3,9,900,NULL,NULL,NULL,NULL,'mail224@gmail.com','01000000224'),(225,'마아세',4,9,800,NULL,NULL,NULL,NULL,'mail225@gmail.com','01000000225'),(226,'전바신',2,9,900,NULL,NULL,NULL,NULL,'mail226@gmail.com','01000000226'),(227,'박희윤',1,9,200,NULL,NULL,NULL,NULL,'mail227@gmail.com','01000000227'),(228,'천결호',1,9,100,NULL,NULL,NULL,NULL,'mail228@gmail.com','01000000228'),(229,'마사혜',2,9,200,NULL,NULL,NULL,NULL,'mail229@gmail.com','01000000229'),(230,'최종바',6,9,300,NULL,NULL,NULL,NULL,'mail230@gmail.com','01000000230'),(231,'원파가',1,9,200,NULL,NULL,NULL,NULL,'mail231@gmail.com','01000000231'),(232,'지희결',5,9,200,NULL,NULL,NULL,NULL,'mail232@gmail.com','01000000232'),(233,'김자마',6,9,200,NULL,NULL,NULL,NULL,'mail233@gmail.com','01000000233'),(234,'방성세',1,9,900,NULL,NULL,NULL,NULL,'mail234@gmail.com','01000000234'),(235,'마바성',6,9,600,NULL,NULL,NULL,NULL,'mail235@gmail.com','01000000235'),(236,'천마마',2,9,200,NULL,NULL,NULL,NULL,'mail236@gmail.com','01000000236'),(237,'최가세',6,9,100,NULL,NULL,NULL,NULL,'mail237@gmail.com','01000000237'),(238,'김파희',3,9,200,NULL,NULL,NULL,NULL,'mail238@gmail.com','01000000238'),(239,'마찬아',5,9,900,NULL,NULL,NULL,NULL,'mail239@gmail.com','01000000239'),(240,'김세가',1,9,200,NULL,NULL,NULL,NULL,'mail240@gmail.com','01000000240'),(241,'전차나',2,9,700,NULL,NULL,NULL,NULL,'mail241@gmail.com','01000000241'),(242,'유희국',2,9,100,NULL,NULL,NULL,NULL,'mail242@gmail.com','01000000242'),(243,'전희마',1,9,800,NULL,NULL,NULL,NULL,'mail243@gmail.com','01000000243'),(244,'마호차',3,9,200,NULL,NULL,NULL,NULL,'mail244@gmail.com','01000000244'),(245,'배태바',5,9,600,NULL,NULL,NULL,NULL,'mail245@gmail.com','01000000245'),(246,'배나희',4,9,300,NULL,NULL,NULL,NULL,'mail246@gmail.com','01000000246'),(247,'유은종',6,9,300,NULL,NULL,NULL,NULL,'mail247@gmail.com','01000000247'),(248,'원세마',6,9,300,NULL,NULL,NULL,NULL,'mail248@gmail.com','01000000248'),(249,'배마가',4,9,100,NULL,NULL,NULL,NULL,'mail249@gmail.com','01000000249'),(250,'유결호',1,9,700,NULL,NULL,NULL,NULL,'mail250@gmail.com','01000000250'),(251,'지태윤',4,9,100,NULL,NULL,NULL,NULL,'mail251@gmail.com','01000000251'),(252,'배호가',7,9,600,NULL,NULL,NULL,NULL,'mail252@gmail.com','01000000252');
/*!40000 ALTER TABLE `TestEmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'testdb'
--
