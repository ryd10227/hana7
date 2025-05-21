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
-- Dumping routines for database 'testdb'
--
