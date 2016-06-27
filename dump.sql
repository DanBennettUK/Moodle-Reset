-- MySQL dump 10.14  Distrib 5.5.47-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: stable31
-- ------------------------------------------------------
-- Server version	5.5.47-MariaDB

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
-- Table structure for table `mdl_assign`
--

DROP TABLE IF EXISTS `mdl_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign`
--

LOCK TABLES `mdl_assign` WRITE;
/*!40000 ALTER TABLE `mdl_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_grades`
--

DROP TABLE IF EXISTS `mdl_assign_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_grades`
--

LOCK TABLES `mdl_assign_grades` WRITE;
/*!40000 ALTER TABLE `mdl_assign_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_plugin_config`
--

DROP TABLE IF EXISTS `mdl_assign_plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_plugin_config`
--

LOCK TABLES `mdl_assign_plugin_config` WRITE;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_submission`
--

DROP TABLE IF EXISTS `mdl_assign_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_submission`
--

LOCK TABLES `mdl_assign_submission` WRITE;
/*!40000 ALTER TABLE `mdl_assign_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_flags`
--

DROP TABLE IF EXISTS `mdl_assign_user_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of flags that can be set for a single user in a single ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_flags`
--

LOCK TABLES `mdl_assign_user_flags` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_mapping`
--

DROP TABLE IF EXISTS `mdl_assign_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Map an assignment specific id number to a user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_mapping`
--

LOCK TABLES `mdl_assign_user_mapping` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_comments`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_comments`
--

LOCK TABLES `mdl_assignfeedback_comments` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_annot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext,
  `type` varchar(10) DEFAULT 'line',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores annotations added to pdfs submitted by students';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_annot`
--

LOCK TABLES `mdl_assignfeedback_editpdf_annot` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_cmnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments added to pdfs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_cmnt`
--

LOCK TABLES `mdl_assignfeedback_editpdf_cmnt` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_queue`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `submissionattempt` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Queue for processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_queue`
--

LOCK TABLES `mdl_assignfeedback_editpdf_queue` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_quick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores teacher specified quicklist comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_quick`
--

LOCK TABLES `mdl_assignfeedback_editpdf_quick` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_file`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_file`
--

LOCK TABLES `mdl_assignfeedback_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment`
--

DROP TABLE IF EXISTS `mdl_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment`
--

LOCK TABLES `mdl_assignment` WRITE;
/*!40000 ALTER TABLE `mdl_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_submissions`
--

DROP TABLE IF EXISTS `mdl_assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_submissions`
--

LOCK TABLES `mdl_assignment_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_upgrade`
--

DROP TABLE IF EXISTS `mdl_assignment_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  KEY `mdl_assiupgr_old2_ix` (`oldinstance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about upgraded assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_upgrade`
--

LOCK TABLES `mdl_assignment_upgrade` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_file`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_file`
--

LOCK TABLES `mdl_assignsubmission_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_onlinetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_onlinetext`
--

LOCK TABLES `mdl_assignsubmission_onlinetext` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_controllers`
--

DROP TABLE IF EXISTS `mdl_backup_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_controllers`
--

LOCK TABLES `mdl_backup_controllers` WRITE;
/*!40000 ALTER TABLE `mdl_backup_controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_courses`
--

DROP TABLE IF EXISTS `mdl_backup_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_courses`
--

LOCK TABLES `mdl_backup_courses` WRITE;
/*!40000 ALTER TABLE `mdl_backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_logs`
--

DROP TABLE IF EXISTS `mdl_backup_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_logs`
--

LOCK TABLES `mdl_backup_logs` WRITE;
/*!40000 ALTER TABLE `mdl_backup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge`
--

DROP TABLE IF EXISTS `mdl_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines badge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge`
--

LOCK TABLES `mdl_badge` WRITE;
/*!40000 ALTER TABLE `mdl_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_backpack`
--

DROP TABLE IF EXISTS `mdl_badge_backpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines settings for connecting external backpack';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_backpack`
--

LOCK TABLES `mdl_badge_backpack` WRITE;
/*!40000 ALTER TABLE `mdl_badge_backpack` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_backpack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria`
--

DROP TABLE IF EXISTS `mdl_badge_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria for issuing badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria`
--

LOCK TABLES `mdl_badge_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_met`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_met`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria that were met for an issued badge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_met`
--

LOCK TABLES `mdl_badge_criteria_met` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_param`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines parameters for badges criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_param`
--

LOCK TABLES `mdl_badge_criteria_param` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_external`
--

DROP TABLE IF EXISTS `mdl_badge_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Setting for external badges display';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_external`
--

LOCK TABLES `mdl_badge_external` WRITE;
/*!40000 ALTER TABLE `mdl_badge_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_issued`
--

DROP TABLE IF EXISTS `mdl_badge_issued`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines issued badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_issued`
--

LOCK TABLES `mdl_badge_issued` WRITE;
/*!40000 ALTER TABLE `mdl_badge_issued` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_issued` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_manual_award`
--

DROP TABLE IF EXISTS `mdl_badge_manual_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track manual award criteria for badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_manual_award`
--

LOCK TABLES `mdl_badge_manual_award` WRITE;
/*!40000 ALTER TABLE `mdl_badge_manual_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_manual_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block`
--

DROP TABLE IF EXISTS `mdl_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block`
--

LOCK TABLES `mdl_block` WRITE;
/*!40000 ALTER TABLE `mdl_block` DISABLE KEYS */;
INSERT INTO `mdl_block` VALUES (1,'activity_modules',0,0,1),(2,'activity_results',0,0,1),(3,'admin_bookmarks',0,0,1),(4,'badges',0,0,1),(5,'blog_menu',0,0,1),(6,'blog_recent',0,0,1),(7,'blog_tags',0,0,1),(8,'calendar_month',0,0,1),(9,'calendar_upcoming',0,0,1),(10,'comments',0,0,1),(11,'community',0,0,1),(12,'completionstatus',0,0,1),(13,'course_list',0,0,1),(14,'course_overview',0,0,1),(15,'course_summary',0,0,1),(16,'feedback',0,0,1),(17,'globalsearch',0,0,1),(18,'glossary_random',0,0,1),(19,'html',0,0,1),(20,'login',0,0,1),(21,'lp',0,0,1),(22,'mentees',0,0,1),(23,'messages',0,0,1),(24,'mnet_hosts',0,0,1),(25,'myprofile',0,0,1),(26,'navigation',0,0,1),(27,'news_items',0,0,1),(28,'online_users',0,0,1),(29,'participants',0,0,1),(30,'private_files',0,0,1),(31,'quiz_results',0,0,0),(32,'recent_activity',86400,0,1),(33,'rss_client',300,0,1),(34,'search_forums',0,0,1),(35,'section_links',0,0,1),(36,'selfcompletion',0,0,1),(37,'settings',0,0,1),(38,'site_main_menu',0,0,1),(39,'social_activities',0,0,1),(40,'tag_flickr',0,0,1),(41,'tag_youtube',0,0,0),(42,'tags',0,0,1);
/*!40000 ALTER TABLE `mdl_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_community`
--

DROP TABLE IF EXISTS `mdl_block_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_community`
--

LOCK TABLES `mdl_block_community` WRITE;
/*!40000 ALTER TABLE `mdl_block_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_instances`
--

DROP TABLE IF EXISTS `mdl_block_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_instances`
--

LOCK TABLES `mdl_block_instances` WRITE;
/*!40000 ALTER TABLE `mdl_block_instances` DISABLE KEYS */;
INSERT INTO `mdl_block_instances` VALUES (1,'site_main_menu',2,0,'site-index',NULL,'side-pre',0,''),(2,'course_summary',2,0,'site-index',NULL,'side-post',0,''),(3,'calendar_month',2,0,'site-index',NULL,'side-post',1,''),(4,'navigation',1,1,'*',NULL,'side-pre',0,''),(5,'settings',1,1,'*',NULL,'side-pre',1,''),(6,'admin_bookmarks',1,0,'admin-*',NULL,'side-pre',2,''),(7,'private_files',1,0,'my-index','2','side-post',0,''),(8,'online_users',1,0,'my-index','2','side-post',1,''),(9,'badges',1,0,'my-index','2','side-post',2,''),(10,'calendar_month',1,0,'my-index','2','side-post',3,''),(11,'calendar_upcoming',1,0,'my-index','2','side-post',4,''),(12,'lp',1,0,'my-index','2','content',0,''),(13,'course_overview',1,0,'my-index','2','content',1,'');
/*!40000 ALTER TABLE `mdl_block_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_positions`
--

DROP TABLE IF EXISTS `mdl_block_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_positions`
--

LOCK TABLES `mdl_block_positions` WRITE;
/*!40000 ALTER TABLE `mdl_block_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_recent_activity`
--

DROP TABLE IF EXISTS `mdl_block_recent_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Recent activity block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_recent_activity`
--

LOCK TABLES `mdl_block_recent_activity` WRITE;
/*!40000 ALTER TABLE `mdl_block_recent_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_recent_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_rss_client`
--

DROP TABLE IF EXISTS `mdl_block_rss_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `skiptime` bigint(10) NOT NULL DEFAULT '0',
  `skipuntil` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_rss_client`
--

LOCK TABLES `mdl_block_rss_client` WRITE;
/*!40000 ALTER TABLE `mdl_block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_rss_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_association`
--

DROP TABLE IF EXISTS `mdl_blog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_association`
--

LOCK TABLES `mdl_blog_association` WRITE;
/*!40000 ALTER TABLE `mdl_blog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_external`
--

DROP TABLE IF EXISTS `mdl_blog_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_external`
--

LOCK TABLES `mdl_blog_external` WRITE;
/*!40000 ALTER TABLE `mdl_blog_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book`
--

DROP TABLE IF EXISTS `mdl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `navstyle` smallint(4) NOT NULL DEFAULT '1',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book`
--

LOCK TABLES `mdl_book` WRITE;
/*!40000 ALTER TABLE `mdl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book_chapters`
--

DROP TABLE IF EXISTS `mdl_book_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book_chapters`
--

LOCK TABLES `mdl_book_chapters` WRITE;
/*!40000 ALTER TABLE `mdl_book_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_filters`
--

DROP TABLE IF EXISTS `mdl_cache_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_filters`
--

LOCK TABLES `mdl_cache_filters` WRITE;
/*!40000 ALTER TABLE `mdl_cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_flags`
--

DROP TABLE IF EXISTS `mdl_cache_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_flags`
--

LOCK TABLES `mdl_cache_flags` WRITE;
/*!40000 ALTER TABLE `mdl_cache_flags` DISABLE KEYS */;
INSERT INTO `mdl_cache_flags` VALUES (1,'userpreferenceschanged','2',1466423715,'1',1466430915);
/*!40000 ALTER TABLE `mdl_cache_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_capabilities`
--

DROP TABLE IF EXISTS `mdl_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_capabilities`
--

LOCK TABLES `mdl_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_capabilities` VALUES (1,'moodle/site:config','write',10,'moodle',62),(2,'moodle/site:readallmessages','read',10,'moodle',8),(3,'moodle/site:deleteanymessage','write',10,'moodle',32),(4,'moodle/site:sendmessage','write',10,'moodle',16),(5,'moodle/site:deleteownmessage','write',10,'moodle',0),(6,'moodle/site:approvecourse','write',10,'moodle',4),(7,'moodle/backup:backupcourse','write',50,'moodle',28),(8,'moodle/backup:backupsection','write',50,'moodle',28),(9,'moodle/backup:backupactivity','write',70,'moodle',28),(10,'moodle/backup:backuptargethub','write',50,'moodle',28),(11,'moodle/backup:backuptargetimport','write',50,'moodle',28),(12,'moodle/backup:downloadfile','write',50,'moodle',28),(13,'moodle/backup:configure','write',50,'moodle',28),(14,'moodle/backup:userinfo','read',50,'moodle',8),(15,'moodle/backup:anonymise','read',50,'moodle',8),(16,'moodle/restore:restorecourse','write',50,'moodle',28),(17,'moodle/restore:restoresection','write',50,'moodle',28),(18,'moodle/restore:restoreactivity','write',50,'moodle',28),(19,'moodle/restore:viewautomatedfilearea','write',50,'moodle',28),(20,'moodle/restore:restoretargethub','write',50,'moodle',28),(21,'moodle/restore:restoretargetimport','write',50,'moodle',28),(22,'moodle/restore:uploadfile','write',50,'moodle',28),(23,'moodle/restore:configure','write',50,'moodle',28),(24,'moodle/restore:rolldates','write',50,'moodle',0),(25,'moodle/restore:userinfo','write',50,'moodle',30),(26,'moodle/restore:createuser','write',10,'moodle',24),(27,'moodle/site:manageblocks','write',80,'moodle',20),(28,'moodle/site:accessallgroups','read',50,'moodle',0),(29,'moodle/site:viewfullnames','read',50,'moodle',0),(30,'moodle/site:viewuseridentity','read',50,'moodle',0),(31,'moodle/site:viewreports','read',50,'moodle',8),(32,'moodle/site:trustcontent','write',50,'moodle',4),(33,'moodle/site:uploadusers','write',10,'moodle',24),(34,'moodle/filter:manage','write',50,'moodle',0),(35,'moodle/user:create','write',10,'moodle',24),(36,'moodle/user:delete','write',10,'moodle',8),(37,'moodle/user:update','write',10,'moodle',24),(38,'moodle/user:viewdetails','read',50,'moodle',0),(39,'moodle/user:viewalldetails','read',30,'moodle',8),(40,'moodle/user:viewlastip','read',30,'moodle',8),(41,'moodle/user:viewhiddendetails','read',50,'moodle',8),(42,'moodle/user:loginas','write',50,'moodle',30),(43,'moodle/user:managesyspages','write',10,'moodle',0),(44,'moodle/user:manageblocks','write',30,'moodle',0),(45,'moodle/user:manageownblocks','write',10,'moodle',0),(46,'moodle/user:manageownfiles','write',10,'moodle',0),(47,'moodle/user:ignoreuserquota','write',10,'moodle',0),(48,'moodle/my:configsyspages','write',10,'moodle',0),(49,'moodle/role:assign','write',50,'moodle',28),(50,'moodle/role:review','read',50,'moodle',8),(51,'moodle/role:override','write',50,'moodle',28),(52,'moodle/role:safeoverride','write',50,'moodle',16),(53,'moodle/role:manage','write',10,'moodle',28),(54,'moodle/role:switchroles','read',50,'moodle',12),(55,'moodle/category:manage','write',40,'moodle',4),(56,'moodle/category:viewhiddencategories','read',40,'moodle',0),(57,'moodle/cohort:manage','write',40,'moodle',0),(58,'moodle/cohort:assign','write',40,'moodle',0),(59,'moodle/cohort:view','read',50,'moodle',0),(60,'moodle/course:create','write',40,'moodle',4),(61,'moodle/course:request','write',10,'moodle',0),(62,'moodle/course:delete','write',50,'moodle',32),(63,'moodle/course:update','write',50,'moodle',4),(64,'moodle/course:view','read',50,'moodle',0),(65,'moodle/course:enrolreview','read',50,'moodle',8),(66,'moodle/course:enrolconfig','write',50,'moodle',8),(67,'moodle/course:reviewotherusers','read',50,'moodle',0),(68,'moodle/course:bulkmessaging','write',50,'moodle',16),(69,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(70,'moodle/course:viewhiddencourses','read',50,'moodle',0),(71,'moodle/course:visibility','write',50,'moodle',0),(72,'moodle/course:managefiles','write',50,'moodle',4),(73,'moodle/course:ignorefilesizelimits','write',50,'moodle',0),(74,'moodle/course:manageactivities','write',70,'moodle',4),(75,'moodle/course:activityvisibility','write',70,'moodle',0),(76,'moodle/course:viewhiddenactivities','write',70,'moodle',0),(77,'moodle/course:viewparticipants','read',50,'moodle',0),(78,'moodle/course:changefullname','write',50,'moodle',4),(79,'moodle/course:changeshortname','write',50,'moodle',4),(80,'moodle/course:renameroles','write',50,'moodle',0),(81,'moodle/course:changeidnumber','write',50,'moodle',4),(82,'moodle/course:changecategory','write',50,'moodle',4),(83,'moodle/course:changesummary','write',50,'moodle',4),(84,'moodle/site:viewparticipants','read',10,'moodle',0),(85,'moodle/course:isincompletionreports','read',50,'moodle',0),(86,'moodle/course:viewscales','read',50,'moodle',0),(87,'moodle/course:managescales','write',50,'moodle',0),(88,'moodle/course:managegroups','write',50,'moodle',0),(89,'moodle/course:reset','write',50,'moodle',32),(90,'moodle/course:viewsuspendedusers','read',10,'moodle',0),(91,'moodle/course:tag','write',50,'moodle',16),(92,'moodle/blog:view','read',10,'moodle',0),(93,'moodle/blog:search','read',10,'moodle',0),(94,'moodle/blog:viewdrafts','read',10,'moodle',8),(95,'moodle/blog:create','write',10,'moodle',16),(96,'moodle/blog:manageentries','write',10,'moodle',16),(97,'moodle/blog:manageexternal','write',10,'moodle',16),(98,'moodle/calendar:manageownentries','write',50,'moodle',16),(99,'moodle/calendar:managegroupentries','write',50,'moodle',16),(100,'moodle/calendar:manageentries','write',50,'moodle',16),(101,'moodle/user:editprofile','write',30,'moodle',24),(102,'moodle/user:editownprofile','write',10,'moodle',16),(103,'moodle/user:changeownpassword','write',10,'moodle',0),(104,'moodle/user:readuserposts','read',30,'moodle',0),(105,'moodle/user:readuserblogs','read',30,'moodle',0),(106,'moodle/user:viewuseractivitiesreport','read',30,'moodle',8),(107,'moodle/user:editmessageprofile','write',30,'moodle',16),(108,'moodle/user:editownmessageprofile','write',10,'moodle',0),(109,'moodle/question:managecategory','write',50,'moodle',20),(110,'moodle/question:add','write',50,'moodle',20),(111,'moodle/question:editmine','write',50,'moodle',20),(112,'moodle/question:editall','write',50,'moodle',20),(113,'moodle/question:viewmine','read',50,'moodle',0),(114,'moodle/question:viewall','read',50,'moodle',0),(115,'moodle/question:usemine','read',50,'moodle',0),(116,'moodle/question:useall','read',50,'moodle',0),(117,'moodle/question:movemine','write',50,'moodle',0),(118,'moodle/question:moveall','write',50,'moodle',0),(119,'moodle/question:config','write',10,'moodle',2),(120,'moodle/question:flag','write',50,'moodle',0),(121,'moodle/site:doclinks','read',10,'moodle',0),(122,'moodle/course:sectionvisibility','write',50,'moodle',0),(123,'moodle/course:useremail','write',50,'moodle',0),(124,'moodle/course:viewhiddensections','write',50,'moodle',0),(125,'moodle/course:setcurrentsection','write',50,'moodle',0),(126,'moodle/course:movesections','write',50,'moodle',0),(127,'moodle/site:mnetlogintoremote','read',10,'moodle',0),(128,'moodle/grade:viewall','read',50,'moodle',8),(129,'moodle/grade:view','read',50,'moodle',0),(130,'moodle/grade:viewhidden','read',50,'moodle',8),(131,'moodle/grade:import','write',50,'moodle',12),(132,'moodle/grade:export','read',50,'moodle',8),(133,'moodle/grade:manage','write',50,'moodle',12),(134,'moodle/grade:edit','write',50,'moodle',12),(135,'moodle/grade:managegradingforms','write',50,'moodle',12),(136,'moodle/grade:sharegradingforms','write',10,'moodle',4),(137,'moodle/grade:managesharedforms','write',10,'moodle',4),(138,'moodle/grade:manageoutcomes','write',50,'moodle',0),(139,'moodle/grade:manageletters','write',50,'moodle',0),(140,'moodle/grade:hide','write',50,'moodle',0),(141,'moodle/grade:lock','write',50,'moodle',0),(142,'moodle/grade:unlock','write',50,'moodle',0),(143,'moodle/my:manageblocks','write',10,'moodle',0),(144,'moodle/notes:view','read',50,'moodle',0),(145,'moodle/notes:manage','write',50,'moodle',16),(146,'moodle/tag:manage','write',10,'moodle',16),(147,'moodle/tag:edit','write',10,'moodle',16),(148,'moodle/tag:flag','write',10,'moodle',16),(149,'moodle/tag:editblocks','write',10,'moodle',0),(150,'moodle/block:view','read',80,'moodle',0),(151,'moodle/block:edit','write',80,'moodle',20),(152,'moodle/portfolio:export','read',10,'moodle',0),(153,'moodle/comment:view','read',50,'moodle',0),(154,'moodle/comment:post','write',50,'moodle',24),(155,'moodle/comment:delete','write',50,'moodle',32),(156,'moodle/webservice:createtoken','write',10,'moodle',62),(157,'moodle/webservice:createmobiletoken','write',10,'moodle',24),(158,'moodle/rating:view','read',50,'moodle',0),(159,'moodle/rating:viewany','read',50,'moodle',8),(160,'moodle/rating:viewall','read',50,'moodle',8),(161,'moodle/rating:rate','write',50,'moodle',0),(162,'moodle/course:publish','write',10,'moodle',24),(163,'moodle/course:markcomplete','write',50,'moodle',0),(164,'moodle/community:add','write',10,'moodle',0),(165,'moodle/community:download','write',10,'moodle',0),(166,'moodle/badges:manageglobalsettings','write',10,'moodle',34),(167,'moodle/badges:viewbadges','read',50,'moodle',0),(168,'moodle/badges:manageownbadges','write',30,'moodle',0),(169,'moodle/badges:viewotherbadges','read',30,'moodle',0),(170,'moodle/badges:earnbadge','write',50,'moodle',0),(171,'moodle/badges:createbadge','write',50,'moodle',16),(172,'moodle/badges:deletebadge','write',50,'moodle',32),(173,'moodle/badges:configuredetails','write',50,'moodle',16),(174,'moodle/badges:configurecriteria','write',50,'moodle',4),(175,'moodle/badges:configuremessages','write',50,'moodle',16),(176,'moodle/badges:awardbadge','write',50,'moodle',16),(177,'moodle/badges:viewawarded','read',50,'moodle',8),(178,'moodle/site:forcelanguage','read',10,'moodle',0),(179,'moodle/search:query','read',10,'moodle',0),(180,'moodle/competency:competencymanage','write',40,'moodle',0),(181,'moodle/competency:competencyview','read',40,'moodle',0),(182,'moodle/competency:competencygrade','write',50,'moodle',0),(183,'moodle/competency:coursecompetencymanage','write',50,'moodle',0),(184,'moodle/competency:coursecompetencyconfigure','write',70,'moodle',0),(185,'moodle/competency:coursecompetencygradable','read',50,'moodle',0),(186,'moodle/competency:coursecompetencyview','read',50,'moodle',0),(187,'moodle/competency:evidencedelete','write',30,'moodle',0),(188,'moodle/competency:planmanage','write',30,'moodle',0),(189,'moodle/competency:planmanagedraft','write',30,'moodle',0),(190,'moodle/competency:planmanageown','write',30,'moodle',0),(191,'moodle/competency:planmanageowndraft','write',30,'moodle',0),(192,'moodle/competency:planview','read',30,'moodle',0),(193,'moodle/competency:planviewdraft','read',30,'moodle',0),(194,'moodle/competency:planviewown','read',30,'moodle',0),(195,'moodle/competency:planviewowndraft','read',30,'moodle',0),(196,'moodle/competency:planrequestreview','write',30,'moodle',0),(197,'moodle/competency:planrequestreviewown','write',30,'moodle',0),(198,'moodle/competency:planreview','write',30,'moodle',0),(199,'moodle/competency:plancomment','write',30,'moodle',0),(200,'moodle/competency:plancommentown','write',30,'moodle',0),(201,'moodle/competency:usercompetencyview','read',30,'moodle',0),(202,'moodle/competency:usercompetencyrequestreview','write',30,'moodle',0),(203,'moodle/competency:usercompetencyrequestreviewown','write',30,'moodle',0),(204,'moodle/competency:usercompetencyreview','write',30,'moodle',0),(205,'moodle/competency:usercompetencycomment','write',30,'moodle',0),(206,'moodle/competency:usercompetencycommentown','write',30,'moodle',0),(207,'moodle/competency:templatemanage','write',40,'moodle',0),(208,'moodle/competency:templateview','read',40,'moodle',0),(209,'moodle/competency:userevidencemanage','write',30,'moodle',0),(210,'moodle/competency:userevidencemanageown','write',30,'moodle',0),(211,'moodle/competency:userevidenceview','read',30,'moodle',0),(212,'mod/assign:view','read',70,'mod_assign',0),(213,'mod/assign:submit','write',70,'mod_assign',0),(214,'mod/assign:grade','write',70,'mod_assign',4),(215,'mod/assign:exportownsubmission','read',70,'mod_assign',0),(216,'mod/assign:addinstance','write',50,'mod_assign',4),(217,'mod/assign:editothersubmission','write',70,'mod_assign',41),(218,'mod/assign:grantextension','write',70,'mod_assign',0),(219,'mod/assign:revealidentities','write',70,'mod_assign',0),(220,'mod/assign:reviewgrades','write',70,'mod_assign',0),(221,'mod/assign:releasegrades','write',70,'mod_assign',0),(222,'mod/assign:managegrades','write',70,'mod_assign',0),(223,'mod/assign:manageallocations','write',70,'mod_assign',0),(224,'mod/assign:viewgrades','read',70,'mod_assign',0),(225,'mod/assign:viewblinddetails','write',70,'mod_assign',8),(226,'mod/assign:receivegradernotifications','read',70,'mod_assign',0),(227,'mod/assignment:view','read',70,'mod_assignment',0),(228,'mod/assignment:addinstance','write',50,'mod_assignment',4),(229,'mod/assignment:submit','write',70,'mod_assignment',0),(230,'mod/assignment:grade','write',70,'mod_assignment',4),(231,'mod/assignment:exportownsubmission','read',70,'mod_assignment',0),(232,'mod/book:addinstance','write',50,'mod_book',4),(233,'mod/book:read','read',70,'mod_book',0),(234,'mod/book:viewhiddenchapters','read',70,'mod_book',0),(235,'mod/book:edit','write',70,'mod_book',4),(236,'mod/chat:addinstance','write',50,'mod_chat',4),(237,'mod/chat:chat','write',70,'mod_chat',16),(238,'mod/chat:readlog','read',70,'mod_chat',0),(239,'mod/chat:deletelog','write',70,'mod_chat',0),(240,'mod/chat:exportparticipatedsession','read',70,'mod_chat',8),(241,'mod/chat:exportsession','read',70,'mod_chat',8),(242,'mod/choice:addinstance','write',50,'mod_choice',4),(243,'mod/choice:choose','write',70,'mod_choice',0),(244,'mod/choice:readresponses','read',70,'mod_choice',0),(245,'mod/choice:deleteresponses','write',70,'mod_choice',0),(246,'mod/choice:downloadresponses','read',70,'mod_choice',0),(247,'mod/data:addinstance','write',50,'mod_data',4),(248,'mod/data:viewentry','read',70,'mod_data',0),(249,'mod/data:writeentry','write',70,'mod_data',16),(250,'mod/data:comment','write',70,'mod_data',16),(251,'mod/data:rate','write',70,'mod_data',0),(252,'mod/data:viewrating','read',70,'mod_data',0),(253,'mod/data:viewanyrating','read',70,'mod_data',8),(254,'mod/data:viewallratings','read',70,'mod_data',8),(255,'mod/data:approve','write',70,'mod_data',16),(256,'mod/data:manageentries','write',70,'mod_data',16),(257,'mod/data:managecomments','write',70,'mod_data',16),(258,'mod/data:managetemplates','write',70,'mod_data',20),(259,'mod/data:viewalluserpresets','read',70,'mod_data',0),(260,'mod/data:manageuserpresets','write',70,'mod_data',20),(261,'mod/data:exportentry','read',70,'mod_data',8),(262,'mod/data:exportownentry','read',70,'mod_data',0),(263,'mod/data:exportallentries','read',70,'mod_data',8),(264,'mod/data:exportuserinfo','read',70,'mod_data',8),(265,'mod/feedback:addinstance','write',50,'mod_feedback',4),(266,'mod/feedback:view','read',70,'mod_feedback',0),(267,'mod/feedback:complete','write',70,'mod_feedback',16),(268,'mod/feedback:viewanalysepage','read',70,'mod_feedback',8),(269,'mod/feedback:deletesubmissions','write',70,'mod_feedback',0),(270,'mod/feedback:mapcourse','write',70,'mod_feedback',0),(271,'mod/feedback:edititems','write',70,'mod_feedback',20),(272,'mod/feedback:createprivatetemplate','write',70,'mod_feedback',16),(273,'mod/feedback:createpublictemplate','write',70,'mod_feedback',16),(274,'mod/feedback:deletetemplate','write',70,'mod_feedback',0),(275,'mod/feedback:viewreports','read',70,'mod_feedback',8),(276,'mod/feedback:receivemail','read',70,'mod_feedback',8),(277,'mod/folder:addinstance','write',50,'mod_folder',4),(278,'mod/folder:view','read',70,'mod_folder',0),(279,'mod/folder:managefiles','write',70,'mod_folder',16),(280,'mod/forum:addinstance','write',50,'mod_forum',4),(281,'mod/forum:viewdiscussion','read',70,'mod_forum',0),(282,'mod/forum:viewhiddentimedposts','read',70,'mod_forum',0),(283,'mod/forum:startdiscussion','write',70,'mod_forum',16),(284,'mod/forum:replypost','write',70,'mod_forum',16),(285,'mod/forum:addnews','write',70,'mod_forum',16),(286,'mod/forum:replynews','write',70,'mod_forum',16),(287,'mod/forum:viewrating','read',70,'mod_forum',0),(288,'mod/forum:viewanyrating','read',70,'mod_forum',8),(289,'mod/forum:viewallratings','read',70,'mod_forum',8),(290,'mod/forum:rate','write',70,'mod_forum',0),(291,'mod/forum:createattachment','write',70,'mod_forum',16),(292,'mod/forum:deleteownpost','read',70,'mod_forum',0),(293,'mod/forum:deleteanypost','read',70,'mod_forum',0),(294,'mod/forum:splitdiscussions','read',70,'mod_forum',0),(295,'mod/forum:movediscussions','read',70,'mod_forum',0),(296,'mod/forum:pindiscussions','write',70,'mod_forum',0),(297,'mod/forum:editanypost','write',70,'mod_forum',16),(298,'mod/forum:viewqandawithoutposting','read',70,'mod_forum',0),(299,'mod/forum:viewsubscribers','read',70,'mod_forum',0),(300,'mod/forum:managesubscriptions','read',70,'mod_forum',16),(301,'mod/forum:postwithoutthrottling','write',70,'mod_forum',16),(302,'mod/forum:exportdiscussion','read',70,'mod_forum',8),(303,'mod/forum:exportpost','read',70,'mod_forum',8),(304,'mod/forum:exportownpost','read',70,'mod_forum',8),(305,'mod/forum:addquestion','write',70,'mod_forum',16),(306,'mod/forum:allowforcesubscribe','read',70,'mod_forum',0),(307,'mod/forum:canposttomygroups','write',70,'mod_forum',0),(308,'mod/glossary:addinstance','write',50,'mod_glossary',4),(309,'mod/glossary:view','read',70,'mod_glossary',0),(310,'mod/glossary:write','write',70,'mod_glossary',16),(311,'mod/glossary:manageentries','write',70,'mod_glossary',16),(312,'mod/glossary:managecategories','write',70,'mod_glossary',16),(313,'mod/glossary:comment','write',70,'mod_glossary',16),(314,'mod/glossary:managecomments','write',70,'mod_glossary',16),(315,'mod/glossary:import','write',70,'mod_glossary',16),(316,'mod/glossary:export','read',70,'mod_glossary',0),(317,'mod/glossary:approve','write',70,'mod_glossary',16),(318,'mod/glossary:rate','write',70,'mod_glossary',0),(319,'mod/glossary:viewrating','read',70,'mod_glossary',0),(320,'mod/glossary:viewanyrating','read',70,'mod_glossary',8),(321,'mod/glossary:viewallratings','read',70,'mod_glossary',8),(322,'mod/glossary:exportentry','read',70,'mod_glossary',8),(323,'mod/glossary:exportownentry','read',70,'mod_glossary',0),(324,'mod/imscp:view','read',70,'mod_imscp',0),(325,'mod/imscp:addinstance','write',50,'mod_imscp',4),(326,'mod/label:addinstance','write',50,'mod_label',4),(327,'mod/lesson:addinstance','write',50,'mod_lesson',4),(328,'mod/lesson:edit','write',70,'mod_lesson',4),(329,'mod/lesson:grade','write',70,'mod_lesson',20),(330,'mod/lesson:viewreports','read',70,'mod_lesson',8),(331,'mod/lesson:manage','write',70,'mod_lesson',0),(332,'mod/lesson:manageoverrides','write',70,'mod_lesson',0),(333,'mod/lti:view','read',70,'mod_lti',0),(334,'mod/lti:addinstance','write',50,'mod_lti',4),(335,'mod/lti:manage','write',70,'mod_lti',8),(336,'mod/lti:addcoursetool','write',50,'mod_lti',0),(337,'mod/lti:requesttooladd','write',50,'mod_lti',0),(338,'mod/page:view','read',70,'mod_page',0),(339,'mod/page:addinstance','write',50,'mod_page',4),(340,'mod/quiz:view','read',70,'mod_quiz',0),(341,'mod/quiz:addinstance','write',50,'mod_quiz',4),(342,'mod/quiz:attempt','write',70,'mod_quiz',16),(343,'mod/quiz:reviewmyattempts','read',70,'mod_quiz',0),(344,'mod/quiz:manage','write',70,'mod_quiz',16),(345,'mod/quiz:manageoverrides','write',70,'mod_quiz',0),(346,'mod/quiz:preview','write',70,'mod_quiz',0),(347,'mod/quiz:grade','write',70,'mod_quiz',20),(348,'mod/quiz:regrade','write',70,'mod_quiz',16),(349,'mod/quiz:viewreports','read',70,'mod_quiz',8),(350,'mod/quiz:deleteattempts','write',70,'mod_quiz',32),(351,'mod/quiz:ignoretimelimits','read',70,'mod_quiz',0),(352,'mod/quiz:emailconfirmsubmission','read',70,'mod_quiz',0),(353,'mod/quiz:emailnotifysubmission','read',70,'mod_quiz',0),(354,'mod/quiz:emailwarnoverdue','read',70,'mod_quiz',0),(355,'mod/resource:view','read',70,'mod_resource',0),(356,'mod/resource:addinstance','write',50,'mod_resource',4),(357,'mod/scorm:addinstance','write',50,'mod_scorm',4),(358,'mod/scorm:viewreport','read',70,'mod_scorm',0),(359,'mod/scorm:skipview','read',70,'mod_scorm',0),(360,'mod/scorm:savetrack','write',70,'mod_scorm',0),(361,'mod/scorm:viewscores','read',70,'mod_scorm',0),(362,'mod/scorm:deleteresponses','write',70,'mod_scorm',0),(363,'mod/scorm:deleteownresponses','write',70,'mod_scorm',0),(364,'mod/survey:addinstance','write',50,'mod_survey',4),(365,'mod/survey:participate','read',70,'mod_survey',0),(366,'mod/survey:readresponses','read',70,'mod_survey',0),(367,'mod/survey:download','read',70,'mod_survey',0),(368,'mod/url:view','read',70,'mod_url',0),(369,'mod/url:addinstance','write',50,'mod_url',4),(370,'mod/wiki:addinstance','write',50,'mod_wiki',4),(371,'mod/wiki:viewpage','read',70,'mod_wiki',0),(372,'mod/wiki:editpage','write',70,'mod_wiki',16),(373,'mod/wiki:createpage','write',70,'mod_wiki',16),(374,'mod/wiki:viewcomment','read',70,'mod_wiki',0),(375,'mod/wiki:editcomment','write',70,'mod_wiki',16),(376,'mod/wiki:managecomment','write',70,'mod_wiki',0),(377,'mod/wiki:managefiles','write',70,'mod_wiki',0),(378,'mod/wiki:overridelock','write',70,'mod_wiki',0),(379,'mod/wiki:managewiki','write',70,'mod_wiki',0),(380,'mod/workshop:view','read',70,'mod_workshop',0),(381,'mod/workshop:addinstance','write',50,'mod_workshop',4),(382,'mod/workshop:switchphase','write',70,'mod_workshop',0),(383,'mod/workshop:editdimensions','write',70,'mod_workshop',4),(384,'mod/workshop:submit','write',70,'mod_workshop',0),(385,'mod/workshop:peerassess','write',70,'mod_workshop',0),(386,'mod/workshop:manageexamples','write',70,'mod_workshop',0),(387,'mod/workshop:allocate','write',70,'mod_workshop',0),(388,'mod/workshop:publishsubmissions','write',70,'mod_workshop',0),(389,'mod/workshop:viewauthornames','read',70,'mod_workshop',0),(390,'mod/workshop:viewreviewernames','read',70,'mod_workshop',0),(391,'mod/workshop:viewallsubmissions','read',70,'mod_workshop',0),(392,'mod/workshop:viewpublishedsubmissions','read',70,'mod_workshop',0),(393,'mod/workshop:viewauthorpublished','read',70,'mod_workshop',0),(394,'mod/workshop:viewallassessments','read',70,'mod_workshop',0),(395,'mod/workshop:overridegrades','write',70,'mod_workshop',0),(396,'mod/workshop:ignoredeadlines','write',70,'mod_workshop',0),(397,'mod/workshop:deletesubmissions','write',70,'mod_workshop',0),(398,'enrol/category:synchronised','write',10,'enrol_category',0),(399,'enrol/category:config','write',50,'enrol_category',0),(400,'enrol/cohort:config','write',50,'enrol_cohort',0),(401,'enrol/cohort:unenrol','write',50,'enrol_cohort',0),(402,'enrol/database:unenrol','write',50,'enrol_database',0),(403,'enrol/database:config','write',50,'enrol_database',0),(404,'enrol/flatfile:manage','write',50,'enrol_flatfile',0),(405,'enrol/flatfile:unenrol','write',50,'enrol_flatfile',0),(406,'enrol/guest:config','write',50,'enrol_guest',0),(407,'enrol/imsenterprise:config','write',50,'enrol_imsenterprise',0),(408,'enrol/ldap:manage','write',50,'enrol_ldap',0),(409,'enrol/lti:config','write',50,'enrol_lti',0),(410,'enrol/lti:unenrol','write',50,'enrol_lti',0),(411,'enrol/manual:config','write',50,'enrol_manual',0),(412,'enrol/manual:enrol','write',50,'enrol_manual',0),(413,'enrol/manual:manage','write',50,'enrol_manual',0),(414,'enrol/manual:unenrol','write',50,'enrol_manual',0),(415,'enrol/manual:unenrolself','write',50,'enrol_manual',0),(416,'enrol/meta:config','write',50,'enrol_meta',0),(417,'enrol/meta:selectaslinked','read',50,'enrol_meta',0),(418,'enrol/meta:unenrol','write',50,'enrol_meta',0),(419,'enrol/mnet:config','write',50,'enrol_mnet',0),(420,'enrol/paypal:config','write',50,'enrol_paypal',0),(421,'enrol/paypal:manage','write',50,'enrol_paypal',0),(422,'enrol/paypal:unenrol','write',50,'enrol_paypal',0),(423,'enrol/paypal:unenrolself','write',50,'enrol_paypal',0),(424,'enrol/self:config','write',50,'enrol_self',0),(425,'enrol/self:manage','write',50,'enrol_self',0),(426,'enrol/self:holdkey','write',50,'enrol_self',0),(427,'enrol/self:unenrolself','write',50,'enrol_self',0),(428,'enrol/self:unenrol','write',50,'enrol_self',0),(429,'message/airnotifier:managedevice','write',10,'message_airnotifier',0),(430,'block/activity_modules:addinstance','write',80,'block_activity_modules',20),(431,'block/activity_results:addinstance','write',80,'block_activity_results',20),(432,'block/admin_bookmarks:myaddinstance','write',10,'block_admin_bookmarks',0),(433,'block/admin_bookmarks:addinstance','write',80,'block_admin_bookmarks',20),(434,'block/badges:addinstance','read',80,'block_badges',0),(435,'block/badges:myaddinstance','read',10,'block_badges',8),(436,'block/blog_menu:addinstance','write',80,'block_blog_menu',20),(437,'block/blog_recent:addinstance','write',80,'block_blog_recent',20),(438,'block/blog_tags:addinstance','write',80,'block_blog_tags',20),(439,'block/calendar_month:myaddinstance','write',10,'block_calendar_month',0),(440,'block/calendar_month:addinstance','write',80,'block_calendar_month',20),(441,'block/calendar_upcoming:myaddinstance','write',10,'block_calendar_upcoming',0),(442,'block/calendar_upcoming:addinstance','write',80,'block_calendar_upcoming',20),(443,'block/comments:myaddinstance','write',10,'block_comments',0),(444,'block/comments:addinstance','write',80,'block_comments',20),(445,'block/community:myaddinstance','write',10,'block_community',0),(446,'block/community:addinstance','write',80,'block_community',20),(447,'block/completionstatus:addinstance','write',80,'block_completionstatus',20),(448,'block/course_list:myaddinstance','write',10,'block_course_list',0),(449,'block/course_list:addinstance','write',80,'block_course_list',20),(450,'block/course_overview:myaddinstance','write',10,'block_course_overview',0),(451,'block/course_overview:addinstance','write',80,'block_course_overview',20),(452,'block/course_summary:addinstance','write',80,'block_course_summary',20),(453,'block/feedback:addinstance','write',80,'block_feedback',20),(454,'block/globalsearch:myaddinstance','write',10,'block_globalsearch',0),(455,'block/globalsearch:addinstance','write',80,'block_globalsearch',0),(456,'block/glossary_random:myaddinstance','write',10,'block_glossary_random',0),(457,'block/glossary_random:addinstance','write',80,'block_glossary_random',20),(458,'block/html:myaddinstance','write',10,'block_html',0),(459,'block/html:addinstance','write',80,'block_html',20),(460,'block/login:addinstance','write',80,'block_login',20),(461,'block/lp:addinstance','write',10,'block_lp',0),(462,'block/lp:myaddinstance','write',10,'block_lp',0),(463,'block/lp:view','read',10,'block_lp',0),(464,'block/mentees:myaddinstance','write',10,'block_mentees',0),(465,'block/mentees:addinstance','write',80,'block_mentees',20),(466,'block/messages:myaddinstance','write',10,'block_messages',0),(467,'block/messages:addinstance','write',80,'block_messages',20),(468,'block/mnet_hosts:myaddinstance','write',10,'block_mnet_hosts',0),(469,'block/mnet_hosts:addinstance','write',80,'block_mnet_hosts',20),(470,'block/myprofile:myaddinstance','write',10,'block_myprofile',0),(471,'block/myprofile:addinstance','write',80,'block_myprofile',20),(472,'block/navigation:myaddinstance','write',10,'block_navigation',0),(473,'block/navigation:addinstance','write',80,'block_navigation',20),(474,'block/news_items:myaddinstance','write',10,'block_news_items',0),(475,'block/news_items:addinstance','write',80,'block_news_items',20),(476,'block/online_users:myaddinstance','write',10,'block_online_users',0),(477,'block/online_users:addinstance','write',80,'block_online_users',20),(478,'block/online_users:viewlist','read',80,'block_online_users',0),(479,'block/participants:addinstance','write',80,'block_participants',20),(480,'block/private_files:myaddinstance','write',10,'block_private_files',0),(481,'block/private_files:addinstance','write',80,'block_private_files',20),(482,'block/quiz_results:addinstance','write',80,'block_quiz_results',20),(483,'block/recent_activity:addinstance','write',80,'block_recent_activity',20),(484,'block/recent_activity:viewaddupdatemodule','read',50,'block_recent_activity',0),(485,'block/recent_activity:viewdeletemodule','read',50,'block_recent_activity',0),(486,'block/rss_client:myaddinstance','write',10,'block_rss_client',0),(487,'block/rss_client:addinstance','write',80,'block_rss_client',20),(488,'block/rss_client:manageownfeeds','write',80,'block_rss_client',0),(489,'block/rss_client:manageanyfeeds','write',80,'block_rss_client',16),(490,'block/search_forums:addinstance','write',80,'block_search_forums',20),(491,'block/section_links:addinstance','write',80,'block_section_links',20),(492,'block/selfcompletion:addinstance','write',80,'block_selfcompletion',20),(493,'block/settings:myaddinstance','write',10,'block_settings',0),(494,'block/settings:addinstance','write',80,'block_settings',20),(495,'block/site_main_menu:addinstance','write',80,'block_site_main_menu',20),(496,'block/social_activities:addinstance','write',80,'block_social_activities',20),(497,'block/tag_flickr:addinstance','write',80,'block_tag_flickr',20),(498,'block/tag_youtube:addinstance','write',80,'block_tag_youtube',20),(499,'block/tags:myaddinstance','write',10,'block_tags',0),(500,'block/tags:addinstance','write',80,'block_tags',20),(501,'report/completion:view','read',50,'report_completion',8),(502,'report/courseoverview:view','read',10,'report_courseoverview',8),(503,'report/log:view','read',50,'report_log',8),(504,'report/log:viewtoday','read',50,'report_log',8),(505,'report/loglive:view','read',50,'report_loglive',8),(506,'report/outline:view','read',50,'report_outline',8),(507,'report/participation:view','read',50,'report_participation',8),(508,'report/performance:view','read',10,'report_performance',2),(509,'report/progress:view','read',50,'report_progress',8),(510,'report/questioninstances:view','read',10,'report_questioninstances',0),(511,'report/security:view','read',10,'report_security',2),(512,'report/stats:view','read',50,'report_stats',8),(513,'report/usersessions:manageownsessions','write',30,'report_usersessions',0),(514,'gradeexport/ods:view','read',50,'gradeexport_ods',8),(515,'gradeexport/ods:publish','read',50,'gradeexport_ods',8),(516,'gradeexport/txt:view','read',50,'gradeexport_txt',8),(517,'gradeexport/txt:publish','read',50,'gradeexport_txt',8),(518,'gradeexport/xls:view','read',50,'gradeexport_xls',8),(519,'gradeexport/xls:publish','read',50,'gradeexport_xls',8),(520,'gradeexport/xml:view','read',50,'gradeexport_xml',8),(521,'gradeexport/xml:publish','read',50,'gradeexport_xml',8),(522,'gradeimport/csv:view','write',50,'gradeimport_csv',0),(523,'gradeimport/direct:view','write',50,'gradeimport_direct',0),(524,'gradeimport/xml:view','write',50,'gradeimport_xml',0),(525,'gradeimport/xml:publish','write',50,'gradeimport_xml',0),(526,'gradereport/grader:view','read',50,'gradereport_grader',8),(527,'gradereport/history:view','read',50,'gradereport_history',8),(528,'gradereport/outcomes:view','read',50,'gradereport_outcomes',8),(529,'gradereport/overview:view','read',50,'gradereport_overview',8),(530,'gradereport/singleview:view','read',50,'gradereport_singleview',8),(531,'gradereport/user:view','read',50,'gradereport_user',8),(532,'webservice/rest:use','read',50,'webservice_rest',0),(533,'webservice/soap:use','read',50,'webservice_soap',0),(534,'webservice/xmlrpc:use','read',50,'webservice_xmlrpc',0),(535,'repository/alfresco:view','read',70,'repository_alfresco',0),(536,'repository/areafiles:view','read',70,'repository_areafiles',0),(537,'repository/boxnet:view','read',70,'repository_boxnet',0),(538,'repository/coursefiles:view','read',70,'repository_coursefiles',0),(539,'repository/dropbox:view','read',70,'repository_dropbox',0),(540,'repository/equella:view','read',70,'repository_equella',0),(541,'repository/filesystem:view','read',70,'repository_filesystem',0),(542,'repository/flickr:view','read',70,'repository_flickr',0),(543,'repository/flickr_public:view','read',70,'repository_flickr_public',0),(544,'repository/googledocs:view','read',70,'repository_googledocs',0),(545,'repository/local:view','read',70,'repository_local',0),(546,'repository/merlot:view','read',70,'repository_merlot',0),(547,'repository/picasa:view','read',70,'repository_picasa',0),(548,'repository/recent:view','read',70,'repository_recent',0),(549,'repository/s3:view','read',70,'repository_s3',0),(550,'repository/skydrive:view','read',70,'repository_skydrive',0),(551,'repository/upload:view','read',70,'repository_upload',0),(552,'repository/url:view','read',70,'repository_url',0),(553,'repository/user:view','read',70,'repository_user',0),(554,'repository/webdav:view','read',70,'repository_webdav',0),(555,'repository/wikimedia:view','read',70,'repository_wikimedia',0),(556,'repository/youtube:view','read',70,'repository_youtube',0),(557,'tool/customlang:view','read',10,'tool_customlang',2),(558,'tool/customlang:edit','write',10,'tool_customlang',6),(559,'tool/lpmigrate:frameworksmigrate','write',10,'tool_lpmigrate',0),(560,'tool/monitor:subscribe','read',50,'tool_monitor',8),(561,'tool/monitor:managerules','write',50,'tool_monitor',4),(562,'tool/monitor:managetool','write',10,'tool_monitor',4),(563,'tool/recyclebin:deleteitems','write',50,'tool_recyclebin',32),(564,'tool/recyclebin:restoreitems','write',50,'tool_recyclebin',0),(565,'tool/recyclebin:viewitems','read',50,'tool_recyclebin',0),(566,'tool/uploaduser:uploaduserpictures','write',10,'tool_uploaduser',16),(567,'booktool/exportimscp:export','read',70,'booktool_exportimscp',0),(568,'booktool/importhtml:import','write',70,'booktool_importhtml',4),(569,'booktool/print:print','read',70,'booktool_print',0),(570,'quiz/grading:viewstudentnames','read',70,'quiz_grading',0),(571,'quiz/grading:viewidnumber','read',70,'quiz_grading',0),(572,'quiz/statistics:view','read',70,'quiz_statistics',0);
/*!40000 ALTER TABLE `mdl_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat`
--

DROP TABLE IF EXISTS `mdl_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat`
--

LOCK TABLES `mdl_chat` WRITE;
/*!40000 ALTER TABLE `mdl_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages`
--

LOCK TABLES `mdl_chat_messages` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages_current`
--

DROP TABLE IF EXISTS `mdl_chat_messages_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages_current`
--

LOCK TABLES `mdl_chat_messages_current` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_users`
--

DROP TABLE IF EXISTS `mdl_chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_users`
--

LOCK TABLES `mdl_chat_users` WRITE;
/*!40000 ALTER TABLE `mdl_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice`
--

DROP TABLE IF EXISTS `mdl_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `includeinactive` tinyint(2) NOT NULL DEFAULT '1',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `showpreview` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice`
--

LOCK TABLES `mdl_choice` WRITE;
/*!40000 ALTER TABLE `mdl_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_answers`
--

DROP TABLE IF EXISTS `mdl_choice_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_answers`
--

LOCK TABLES `mdl_choice_answers` WRITE;
/*!40000 ALTER TABLE `mdl_choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_options`
--

DROP TABLE IF EXISTS `mdl_choice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_options`
--

LOCK TABLES `mdl_choice_options` WRITE;
/*!40000 ALTER TABLE `mdl_choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort`
--

DROP TABLE IF EXISTS `mdl_cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort`
--

LOCK TABLES `mdl_cohort` WRITE;
/*!40000 ALTER TABLE `mdl_cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort_members`
--

DROP TABLE IF EXISTS `mdl_cohort_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort_members`
--

LOCK TABLES `mdl_cohort_members` WRITE;
/*!40000 ALTER TABLE `mdl_cohort_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_comments`
--

DROP TABLE IF EXISTS `mdl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) DEFAULT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_comments`
--

LOCK TABLES `mdl_comments` WRITE;
/*!40000 ALTER TABLE `mdl_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency`
--

DROP TABLE IF EXISTS `mdl_competency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `competencyframeworkid` bigint(10) NOT NULL,
  `parentid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL,
  `ruletype` varchar(100) DEFAULT NULL,
  `ruleoutcome` tinyint(2) NOT NULL DEFAULT '0',
  `ruleconfig` longtext,
  `scaleid` bigint(10) DEFAULT NULL,
  `scaleconfiguration` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comp_comidn_uix` (`competencyframeworkid`,`idnumber`),
  KEY `mdl_comp_rul_ix` (`ruleoutcome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains the master record of each competency in ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency`
--

LOCK TABLES `mdl_competency` WRITE;
/*!40000 ALTER TABLE `mdl_competency` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_coursecomp`
--

DROP TABLE IF EXISTS `mdl_competency_coursecomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_coursecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_coucom_uix` (`courseid`,`competencyid`),
  KEY `mdl_compcour_courul_ix` (`courseid`,`ruleoutcome`),
  KEY `mdl_compcour_cou_ix` (`courseid`),
  KEY `mdl_compcour_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a competency to a course.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_coursecomp`
--

LOCK TABLES `mdl_competency_coursecomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_coursecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_coursecomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_coursecompsetting`
--

DROP TABLE IF EXISTS `mdl_competency_coursecompsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_coursecompsetting` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `pushratingstouserplans` tinyint(2) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains the course specific settings for compete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_coursecompsetting`
--

LOCK TABLES `mdl_competency_coursecompsetting` WRITE;
/*!40000 ALTER TABLE `mdl_competency_coursecompsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_coursecompsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_evidence`
--

DROP TABLE IF EXISTS `mdl_competency_evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_evidence` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `usercompetencyid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `action` tinyint(2) NOT NULL,
  `actionuserid` bigint(10) DEFAULT NULL,
  `descidentifier` varchar(255) NOT NULL DEFAULT '',
  `desccomponent` varchar(255) NOT NULL DEFAULT '',
  `desca` longtext,
  `url` varchar(255) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `note` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compevid_use_ix` (`usercompetencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The evidence linked to a user competency';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_evidence`
--

LOCK TABLES `mdl_competency_evidence` WRITE;
/*!40000 ALTER TABLE `mdl_competency_evidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_evidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_framework`
--

DROP TABLE IF EXISTS `mdl_competency_framework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_framework` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `scaleid` bigint(11) DEFAULT NULL,
  `scaleconfiguration` longtext NOT NULL,
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `taxonomies` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compfram_idn_uix` (`idnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of competency frameworks.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_framework`
--

LOCK TABLES `mdl_competency_framework` WRITE;
/*!40000 ALTER TABLE `mdl_competency_framework` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_framework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_modulecomp`
--

DROP TABLE IF EXISTS `mdl_competency_modulecomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_modulecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compmodu_cmicom_uix` (`cmid`,`competencyid`),
  KEY `mdl_compmodu_cmirul_ix` (`cmid`,`ruleoutcome`),
  KEY `mdl_compmodu_cmi_ix` (`cmid`),
  KEY `mdl_compmodu_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a competency to a module.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_modulecomp`
--

LOCK TABLES `mdl_competency_modulecomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_modulecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_modulecomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_plan`
--

DROP TABLE IF EXISTS `mdl_competency_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_plan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `templateid` bigint(10) DEFAULT NULL,
  `origtemplateid` bigint(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `duedate` bigint(10) DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compplan_usesta_ix` (`userid`,`status`),
  KEY `mdl_compplan_tem_ix` (`templateid`),
  KEY `mdl_compplan_stadue_ix` (`status`,`duedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Learning plans';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_plan`
--

LOCK TABLES `mdl_competency_plan` WRITE;
/*!40000 ALTER TABLE `mdl_competency_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_plancomp`
--

DROP TABLE IF EXISTS `mdl_competency_plancomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_plancomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `planid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compplan_placom_uix` (`planid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Plan competencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_plancomp`
--

LOCK TABLES `mdl_competency_plancomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_plancomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_plancomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_relatedcomp`
--

DROP TABLE IF EXISTS `mdl_competency_relatedcomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_relatedcomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `competencyid` bigint(10) NOT NULL,
  `relatedcompetencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Related competencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_relatedcomp`
--

LOCK TABLES `mdl_competency_relatedcomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_relatedcomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_relatedcomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_template`
--

DROP TABLE IF EXISTS `mdl_competency_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `duedate` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Learning plan templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_template`
--

LOCK TABLES `mdl_competency_template` WRITE;
/*!40000 ALTER TABLE `mdl_competency_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_templatecohort`
--

DROP TABLE IF EXISTS `mdl_competency_templatecohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_templatecohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `templateid` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comptemp_temcoh_uix` (`templateid`,`cohortid`),
  KEY `mdl_comptemp_tem2_ix` (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for the table, please edit me';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_templatecohort`
--

LOCK TABLES `mdl_competency_templatecohort` WRITE;
/*!40000 ALTER TABLE `mdl_competency_templatecohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_templatecohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_templatecomp`
--

DROP TABLE IF EXISTS `mdl_competency_templatecomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_templatecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `templateid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_comptemp_tem_ix` (`templateid`),
  KEY `mdl_comptemp_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a competency to a learning plan template.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_templatecomp`
--

LOCK TABLES `mdl_competency_templatecomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_templatecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_templatecomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_usercomp`
--

DROP TABLE IF EXISTS `mdl_competency_usercomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_usercomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom_uix` (`userid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User competencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_usercomp`
--

LOCK TABLES `mdl_competency_usercomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_usercomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_usercompcourse`
--

DROP TABLE IF EXISTS `mdl_competency_usercompcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_usercompcourse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecoucom_uix` (`userid`,`courseid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User competencies in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_usercompcourse`
--

LOCK TABLES `mdl_competency_usercompcourse` WRITE;
/*!40000 ALTER TABLE `mdl_competency_usercompcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercompcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_usercompplan`
--

DROP TABLE IF EXISTS `mdl_competency_usercompplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_usercompplan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `planid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecompla_uix` (`userid`,`competencyid`,`planid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User competencies plans';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_usercompplan`
--

LOCK TABLES `mdl_competency_usercompplan` WRITE;
/*!40000 ALTER TABLE `mdl_competency_usercompplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_usercompplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_userevidence`
--

DROP TABLE IF EXISTS `mdl_competency_userevidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_userevidence` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(1) NOT NULL,
  `url` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The evidence of prior learning';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_userevidence`
--

LOCK TABLES `mdl_competency_userevidence` WRITE;
/*!40000 ALTER TABLE `mdl_competency_userevidence` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_userevidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_competency_userevidencecomp`
--

DROP TABLE IF EXISTS `mdl_competency_userevidencecomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_competency_userevidencecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userevidenceid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom2_uix` (`userevidenceid`,`competencyid`),
  KEY `mdl_compuser_use2_ix` (`userevidenceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relationship between user evidence and competencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_competency_userevidencecomp`
--

LOCK TABLES `mdl_competency_userevidencecomp` WRITE;
/*!40000 ALTER TABLE `mdl_competency_userevidencecomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_competency_userevidencecomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config`
--

DROP TABLE IF EXISTS `mdl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config`
--

LOCK TABLES `mdl_config` WRITE;
/*!40000 ALTER TABLE `mdl_config` DISABLE KEYS */;
INSERT INTO `mdl_config` VALUES (2,'rolesactive','1'),(3,'auth','email'),(4,'auth_pop3mailbox','INBOX'),(5,'enrol_plugins_enabled','manual,guest,self,cohort'),(6,'theme','clean'),(7,'filter_multilang_converted','1'),(8,'siteidentifier','u62c4vyIDSIoQKcJI1BNrYGHbhQicOm2dan.local'),(9,'backup_version','2008111700'),(10,'backup_release','2.0 dev'),(11,'mnet_dispatcher_mode','off'),(12,'sessiontimeout','7200'),(13,'stringfilters',''),(14,'filterall','0'),(15,'texteditors','atto,tinymce,textarea'),(16,'antiviruses',''),(17,'upgrade_minmaxgradestepignored','1'),(18,'upgrade_extracreditweightsstepignored','1'),(19,'upgrade_calculatedgradeitemsignored','1'),(20,'upgrade_letterboundarycourses','1'),(21,'mnet_localhost_id','1'),(22,'mnet_all_hosts_id','2'),(23,'siteguest','1'),(24,'siteadmins','2'),(25,'themerev','1466423652'),(26,'jsrev','1466423652'),(27,'gdversion','2'),(28,'licenses','unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),(29,'version','2016052300.04'),(30,'enableoutcomes','0'),(31,'usecomments','1'),(32,'usetags','1'),(33,'enablenotes','1'),(34,'enableportfolios','0'),(35,'enablewebservices','0'),(36,'messaging','1'),(37,'messaginghidereadnotifications','0'),(38,'messagingdeletereadnotificationsdelay','604800'),(39,'messagingallowemailoverride','0'),(40,'enablestats','0'),(41,'enablerssfeeds','0'),(42,'enableblogs','1'),(43,'enablecompletion','1'),(44,'completiondefault','1'),(45,'enableavailability','1'),(46,'enableplagiarism','0'),(47,'enablebadges','1'),(48,'enableglobalsearch','0'),(49,'defaultpreference_maildisplay','2'),(50,'defaultpreference_mailformat','1'),(51,'defaultpreference_maildigest','0'),(52,'defaultpreference_autosubscribe','1'),(53,'defaultpreference_trackforums','0'),(54,'autologinguests','0'),(55,'hiddenuserfields',''),(56,'showuseridentity','email'),(57,'fullnamedisplay','language'),(58,'alternativefullnameformat','language'),(59,'maxusersperpage','100'),(60,'enablegravatar','0'),(61,'gravatardefaulturl','mm'),(62,'enablecourserequests','0'),(63,'defaultrequestcategory','1'),(64,'requestcategoryselection','0'),(65,'courserequestnotify',''),(66,'grade_profilereport','user'),(67,'grade_aggregationposition','1'),(68,'grade_includescalesinaggregation','1'),(69,'grade_hiddenasdate','0'),(70,'gradepublishing','0'),(71,'grade_export_displaytype','1'),(72,'grade_export_decimalpoints','2'),(73,'grade_navmethod','0'),(74,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email'),(75,'grade_export_customprofilefields',''),(76,'recovergradesdefault','0'),(77,'gradeexport',''),(78,'unlimitedgrades','0'),(79,'grade_report_showmin','1'),(80,'gradepointmax','100'),(81,'gradepointdefault','100'),(82,'grade_minmaxtouse','1'),(83,'grade_mygrades_report','overview'),(84,'gradereport_mygradeurl',''),(85,'grade_hideforcedsettings','1'),(86,'grade_aggregation','13'),(87,'grade_aggregation_flag','0'),(88,'grade_aggregations_visible','13'),(89,'grade_aggregateonlygraded','1'),(90,'grade_aggregateonlygraded_flag','2'),(91,'grade_aggregateoutcomes','0'),(92,'grade_aggregateoutcomes_flag','2'),(93,'grade_keephigh','0'),(94,'grade_keephigh_flag','3'),(95,'grade_droplow','0'),(96,'grade_droplow_flag','2'),(97,'grade_overridecat','1'),(98,'grade_displaytype','1'),(99,'grade_decimalpoints','2'),(100,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),(101,'grade_report_studentsperpage','100'),(102,'grade_report_showonlyactiveenrol','1'),(103,'grade_report_quickgrading','1'),(104,'grade_report_showquickfeedback','0'),(105,'grade_report_meanselection','1'),(106,'grade_report_enableajax','0'),(107,'grade_report_showcalculations','1'),(108,'grade_report_showeyecons','0'),(109,'grade_report_showaverages','1'),(110,'grade_report_showlocks','0'),(111,'grade_report_showranges','0'),(112,'grade_report_showanalysisicon','1'),(113,'grade_report_showuserimage','1'),(114,'grade_report_showactivityicons','1'),(115,'grade_report_shownumberofgrades','0'),(116,'grade_report_averagesdisplaytype','inherit'),(117,'grade_report_rangesdisplaytype','inherit'),(118,'grade_report_averagesdecimalpoints','inherit'),(119,'grade_report_rangesdecimalpoints','inherit'),(120,'grade_report_historyperpage','50'),(121,'grade_report_overview_showrank','0'),(122,'grade_report_overview_showtotalsifcontainhidden','0'),(123,'grade_report_user_showrank','0'),(124,'grade_report_user_showpercentage','1'),(125,'grade_report_user_showgrade','1'),(126,'grade_report_user_showfeedback','1'),(127,'grade_report_user_showrange','1'),(128,'grade_report_user_showweight','1'),(129,'grade_report_user_showaverage','0'),(130,'grade_report_user_showlettergrade','0'),(131,'grade_report_user_rangedecimals','0'),(132,'grade_report_user_showhiddenitems','1'),(133,'grade_report_user_showtotalsifcontainhidden','0'),(134,'grade_report_user_showcontributiontocoursetotal','1'),(135,'badges_defaultissuername',''),(136,'badges_defaultissuercontact',''),(137,'badges_badgesalt','badges1466423526'),(138,'badges_allowexternalbackpack','1'),(139,'badges_allowcoursebadges','1'),(140,'timezone','Europe/London'),(141,'forcetimezone','99'),(142,'country','0'),(143,'defaultcity',''),(144,'geoipfile','/var/www/moodles/stable_31/moodledata/geoip/GeoLiteCity.dat'),(145,'googlemapkey3',''),(146,'allcountrycodes',''),(147,'autolang','1'),(148,'lang','en'),(149,'langmenu','1'),(150,'langlist',''),(151,'langrev','1466423703'),(152,'langcache','1'),(153,'langstringcache','0'),(154,'locale',''),(155,'latinexcelexport','0'),(156,'requiremodintro','0'),(157,'registerauth',''),(158,'authloginviaemail','0'),(159,'allowaccountssameemail','0'),(160,'authpreventaccountcreation','0'),(161,'loginpageautofocus','0'),(162,'guestloginbutton','1'),(163,'limitconcurrentlogins','0'),(164,'alternateloginurl',''),(165,'forgottenpasswordurl',''),(166,'auth_instructions',''),(167,'allowemailaddresses',''),(168,'denyemailaddresses',''),(169,'verifychangedemail','1'),(170,'recaptchapublickey',''),(171,'recaptchaprivatekey',''),(172,'filteruploadedfiles','0'),(173,'filtermatchoneperpage','0'),(174,'filtermatchonepertext','0'),(175,'sitedefaultlicense','allrightsreserved'),(176,'portfolio_moderate_filesize_threshold','1048576'),(177,'portfolio_high_filesize_threshold','5242880'),(178,'portfolio_moderate_db_threshold','20'),(179,'portfolio_high_db_threshold','50'),(180,'repositorycacheexpire','120'),(181,'repositorygetfiletimeout','30'),(182,'repositorysyncfiletimeout','1'),(183,'repositorysyncimagetimeout','3'),(184,'repositoryallowexternallinks','1'),(185,'legacyfilesinnewcourses','0'),(186,'legacyfilesaddallowed','1'),(187,'searchengine','solr'),(188,'mobilecssurl',''),(189,'enablewsdocumentation','0'),(190,'allowbeforeblock','0'),(191,'allowedip',''),(192,'blockedip',''),(193,'protectusernames','1'),(194,'forcelogin','0'),(195,'forceloginforprofiles','1'),(196,'forceloginforprofileimage','0'),(197,'opentogoogle','0'),(198,'maxbytes','0'),(199,'userquota','104857600'),(200,'allowobjectembed','0'),(201,'enabletrusttext','0'),(202,'maxeditingtime','1800'),(203,'extendedusernamechars','0'),(204,'sitepolicy',''),(205,'sitepolicyguest',''),(206,'keeptagnamecase','1'),(207,'profilesforenrolledusersonly','1'),(208,'cronclionly','0'),(209,'cronremotepassword',''),(210,'lockoutthreshold','0'),(211,'lockoutwindow','1800'),(212,'lockoutduration','1800'),(213,'passwordpolicy','0'),(214,'minpasswordlength','8'),(215,'minpassworddigits','1'),(216,'minpasswordlower','1'),(217,'minpasswordupper','1'),(218,'minpasswordnonalphanum','1'),(219,'maxconsecutiveidentchars','0'),(220,'passwordreuselimit','0'),(221,'pwresettime','1800'),(222,'passwordchangelogout','0'),(223,'groupenrolmentkeypolicy','1'),(224,'disableuserimages','0'),(225,'emailchangeconfirmation','1'),(226,'rememberusername','2'),(227,'strictformsrequired','0'),(228,'loginhttps','0'),(229,'cookiesecure','0'),(230,'cookiehttponly','0'),(231,'allowframembedding','0'),(232,'loginpasswordautocomplete','0'),(233,'displayloginfailures','0'),(234,'notifyloginfailures',''),(235,'notifyloginthreshold','10'),(236,'themelist',''),(237,'themedesignermode','1'),(238,'allowuserthemes','0'),(239,'allowcoursethemes','0'),(240,'allowcategorythemes','0'),(241,'allowthemechangeonurl','1'),(242,'allowuserblockhiding','1'),(243,'allowblockstodock','1'),(244,'custommenuitems',''),(245,'customusermenuitems','grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences'),(246,'enabledevicedetection','1'),(247,'devicedetectregex','[]'),(248,'calendartype','gregorian'),(249,'calendar_adminseesall','0'),(250,'calendar_site_timeformat','0'),(251,'calendar_startwday','1'),(252,'calendar_weekend','65'),(253,'calendar_lookahead','21'),(254,'calendar_maxevents','10'),(255,'enablecalendarexport','1'),(256,'calendar_customexport','1'),(257,'calendar_exportlookahead','365'),(258,'calendar_exportlookback','5'),(259,'calendar_exportsalt','kx39SCjFuduxf4psaQVjtfwmo0RgeVDrMYEFO0oRVGPJwnTK3RkyFyqWOEda'),(260,'calendar_showicalsource','1'),(261,'useblogassociations','1'),(262,'bloglevel','4'),(263,'useexternalblogs','1'),(264,'externalblogcrontime','86400'),(265,'maxexternalblogsperuser','1'),(266,'blogusecomments','1'),(267,'blogshowcommentscount','1'),(268,'defaulthomepage','1'),(269,'allowguestmymoodle','1'),(270,'navshowfullcoursenames','0'),(271,'navshowcategories','1'),(272,'navshowmycoursecategories','0'),(273,'navshowallcourses','0'),(274,'navexpandmycourses','1'),(275,'navsortmycoursessort','sortorder'),(276,'navcourselimit','20'),(277,'usesitenameforsitepages','0'),(278,'linkadmincategories','0'),(279,'linkcoursesections','0'),(280,'navshowfrontpagemods','1'),(281,'navadduserpostslinks','1'),(282,'formatstringstriptags','1'),(283,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]'),(284,'core_media_enable_youtube','1'),(285,'core_media_enable_vimeo','0'),(286,'core_media_enable_mp3','1'),(287,'core_media_enable_flv','1'),(288,'core_media_enable_swf','1'),(289,'core_media_enable_html5audio','1'),(290,'core_media_enable_html5video','1'),(291,'core_media_enable_qt','1'),(292,'core_media_enable_wmp','1'),(293,'core_media_enable_rm','1'),(294,'docroot','http://docs.moodle.org'),(295,'doclang',''),(296,'doctonewwindow','0'),(297,'courselistshortnames','0'),(298,'coursesperpage','20'),(299,'courseswithsummarieslimit','10'),(300,'courseoverviewfileslimit','1'),(301,'courseoverviewfilesext','.jpg,.gif,.png'),(302,'useexternalyui','0'),(303,'yuicomboloading','0'),(304,'cachejs','0'),(305,'modchooserdefault','1'),(306,'modeditingmenu','1'),(307,'blockeditingmenu','1'),(308,'additionalhtmlhead',''),(309,'additionalhtmltopofbody',''),(310,'additionalhtmlfooter',''),(311,'pathtodu',''),(312,'aspellpath',''),(313,'pathtodot',''),(314,'pathtogs','/usr/bin/gs'),(315,'pathtounoconv','/usr/bin/unoconv'),(316,'supportname','Admin User'),(317,'supportemail',''),(318,'supportpage',''),(319,'dbsessions','0'),(320,'sessioncookie',''),(321,'sessioncookiepath',''),(322,'sessioncookiedomain',''),(323,'statsfirstrun','none'),(324,'statsmaxruntime','0'),(325,'statsruntimedays','31'),(326,'statsruntimestarthour','0'),(327,'statsruntimestartminute','0'),(328,'statsuserthreshold','0'),(329,'slasharguments','1'),(330,'getremoteaddrconf','0'),(331,'proxyhost',''),(332,'proxyport','0'),(333,'proxytype','HTTP'),(334,'proxyuser',''),(335,'proxypassword',''),(336,'proxybypass','localhost, 127.0.0.1'),(337,'maintenance_enabled','0'),(338,'maintenance_message',''),(339,'deleteunconfirmed','168'),(340,'deleteincompleteusers','0'),(341,'disablegradehistory','0'),(342,'gradehistorylifetime','0'),(343,'tempdatafoldercleanup','168'),(344,'extramemorylimit','512M'),(345,'maxtimelimit','0'),(346,'curlcache','120'),(347,'curltimeoutkbitrate','56'),(348,'updateautocheck','1'),(349,'updateminmaturity','200'),(350,'updatenotifybuilds','0'),(351,'enablesafebrowserintegration','0'),(352,'dndallowtextandlinks','0'),(353,'enablecssoptimiser','0'),(354,'debug','32767'),(355,'debugdisplay','1'),(356,'debugsmtp','0'),(357,'perfdebug','15'),(358,'debugstringids','0'),(359,'debugvalidators','0'),(360,'debugpageinfo','1'),(361,'profilingenabled','0'),(362,'profilingincluded',''),(363,'profilingexcluded',''),(364,'profilingautofrec','0'),(365,'profilingallowme','0'),(366,'profilingallowall','0'),(367,'profilinglifetime','1440'),(368,'profilingimportprefix','(I)'),(369,'release','3.1+ (Build: 20160616)'),(370,'branch','31'),(371,'localcachedirpurged','1466423652'),(372,'scheduledtaskreset','1466423652'),(373,'allversionshash','131bfaf5f999f1da7d632351ea5833a4c09af5e8'),(374,'notloggedinroleid','6'),(375,'guestroleid','6'),(376,'defaultuserroleid','7'),(377,'creatornewroleid','3'),(378,'restorernewroleid','3'),(379,'gradebookroles','5'),(380,'chat_method','ajax'),(381,'chat_refresh_userlist','10'),(382,'chat_old_ping','35'),(383,'chat_refresh_room','5'),(384,'chat_normal_updatemode','jsupdate'),(385,'chat_serverhost','dan.local'),(386,'chat_serverip','127.0.0.1'),(387,'chat_serverport','9111'),(388,'chat_servermax','100'),(389,'data_enablerssfeeds','0'),(390,'feedback_allowfullanonymous','0'),(391,'forum_displaymode','3'),(392,'forum_replytouser','1'),(393,'forum_shortpost','300'),(394,'forum_longpost','600'),(395,'forum_manydiscussions','100'),(396,'forum_maxbytes','512000'),(397,'forum_maxattachments','9'),(398,'forum_trackingtype','1'),(399,'forum_trackreadposts','1'),(400,'forum_allowforcedreadtracking','0'),(401,'forum_oldpostdays','14'),(402,'forum_usermarksread','0'),(403,'forum_cleanreadtime','2'),(404,'digestmailtime','17'),(405,'forum_enablerssfeeds','0'),(406,'forum_enabletimedposts','1'),(407,'glossary_entbypage','10'),(408,'glossary_dupentries','0'),(409,'glossary_allowcomments','0'),(410,'glossary_linkbydefault','1'),(411,'glossary_defaultapproval','1'),(412,'glossary_enablerssfeeds','0'),(413,'glossary_linkentries','0'),(414,'glossary_casesensitive','0'),(415,'glossary_fullmatch','0'),(416,'block_course_list_adminview','all'),(417,'block_course_list_hideallcourseslink','0'),(418,'block_html_allowcssclasses','0'),(419,'block_online_users_timetosee','5'),(420,'block_rss_client_num_entries','5'),(421,'block_rss_client_timeout','30'),(422,'filter_censor_badwords',''),(423,'filter_multilang_force_old','0'),(424,'logguests','1'),(425,'loglifetime','0'),(426,'airnotifierurl','https://messages.moodle.net'),(427,'airnotifierport','443'),(428,'airnotifiermobileappname','com.moodle.moodlemobile'),(429,'airnotifierappname','commoodlemoodlemobile'),(430,'airnotifieraccesskey',''),(431,'smtphosts',''),(432,'smtpsecure',''),(433,'smtpauthtype','LOGIN'),(434,'smtpuser',''),(435,'smtppass',''),(436,'smtpmaxbulk','1'),(437,'noreplyaddress','noreply@dan.local'),(438,'emailonlyfromnoreplyaddress','0'),(439,'sitemailcharset','0'),(440,'allowusermailcharset','0'),(441,'allowattachments','1'),(442,'mailnewline','LF'),(443,'jabberhost',''),(444,'jabberserver',''),(445,'jabberusername',''),(446,'jabberpassword',''),(447,'jabberport','5222'),(448,'enablemobilewebservice','0'),(449,'profileroles','5,4,3'),(450,'coursecontact','3'),(451,'frontpage','6'),(452,'frontpageloggedin','6'),(453,'maxcategorydepth','2'),(454,'frontpagecourselimit','200'),(455,'commentsperpage','15'),(456,'defaultfrontpageroleid','8'),(457,'messageinbound_enabled','0'),(458,'messageinbound_mailbox',''),(459,'messageinbound_domain',''),(460,'messageinbound_host',''),(461,'messageinbound_hostssl','ssl'),(462,'messageinbound_hostuser',''),(463,'messageinbound_hostpass','');
/*!40000 ALTER TABLE `mdl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_log`
--

DROP TABLE IF EXISTS `mdl_config_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_log`
--

LOCK TABLES `mdl_config_log` WRITE;
/*!40000 ALTER TABLE `mdl_config_log` DISABLE KEYS */;
INSERT INTO `mdl_config_log` VALUES (1,0,1466423552,NULL,'enableoutcomes','0',NULL),(2,0,1466423552,NULL,'usecomments','1',NULL),(3,0,1466423552,NULL,'usetags','1',NULL),(4,0,1466423552,NULL,'enablenotes','1',NULL),(5,0,1466423552,NULL,'enableportfolios','0',NULL),(6,0,1466423552,NULL,'enablewebservices','0',NULL),(7,0,1466423552,NULL,'messaging','1',NULL),(8,0,1466423552,NULL,'messaginghidereadnotifications','0',NULL),(9,0,1466423552,NULL,'messagingdeletereadnotificationsdelay','604800',NULL),(10,0,1466423552,NULL,'messagingallowemailoverride','0',NULL),(11,0,1466423552,NULL,'enablestats','0',NULL),(12,0,1466423552,NULL,'enablerssfeeds','0',NULL),(13,0,1466423552,NULL,'enableblogs','1',NULL),(14,0,1466423552,NULL,'enablecompletion','1',NULL),(15,0,1466423552,NULL,'completiondefault','1',NULL),(16,0,1466423552,NULL,'enableavailability','1',NULL),(17,0,1466423552,NULL,'enableplagiarism','0',NULL),(18,0,1466423552,NULL,'enablebadges','1',NULL),(19,0,1466423552,NULL,'enableglobalsearch','0',NULL),(20,0,1466423552,NULL,'defaultpreference_maildisplay','2',NULL),(21,0,1466423552,NULL,'defaultpreference_mailformat','1',NULL),(22,0,1466423552,NULL,'defaultpreference_maildigest','0',NULL),(23,0,1466423552,NULL,'defaultpreference_autosubscribe','1',NULL),(24,0,1466423552,NULL,'defaultpreference_trackforums','0',NULL),(25,0,1466423552,NULL,'autologinguests','0',NULL),(26,0,1466423552,NULL,'hiddenuserfields','',NULL),(27,0,1466423552,NULL,'showuseridentity','email',NULL),(28,0,1466423552,NULL,'fullnamedisplay','language',NULL),(29,0,1466423552,NULL,'alternativefullnameformat','language',NULL),(30,0,1466423552,NULL,'maxusersperpage','100',NULL),(31,0,1466423552,NULL,'enablegravatar','0',NULL),(32,0,1466423552,NULL,'gravatardefaulturl','mm',NULL),(33,0,1466423552,'moodlecourse','visible','1',NULL),(34,0,1466423552,'moodlecourse','format','weeks',NULL),(35,0,1466423552,'moodlecourse','maxsections','52',NULL),(36,0,1466423552,'moodlecourse','numsections','10',NULL),(37,0,1466423552,'moodlecourse','hiddensections','0',NULL),(38,0,1466423552,'moodlecourse','coursedisplay','0',NULL),(39,0,1466423552,'moodlecourse','lang','',NULL),(40,0,1466423552,'moodlecourse','newsitems','5',NULL),(41,0,1466423553,'moodlecourse','showgrades','1',NULL),(42,0,1466423553,'moodlecourse','showreports','0',NULL),(43,0,1466423553,'moodlecourse','maxbytes','0',NULL),(44,0,1466423553,'moodlecourse','enablecompletion','0',NULL),(45,0,1466423553,'moodlecourse','groupmode','0',NULL),(46,0,1466423553,'moodlecourse','groupmodeforce','0',NULL),(47,0,1466423553,NULL,'enablecourserequests','0',NULL),(48,0,1466423553,NULL,'defaultrequestcategory','1',NULL),(49,0,1466423553,NULL,'requestcategoryselection','0',NULL),(50,0,1466423553,NULL,'courserequestnotify','',NULL),(51,0,1466423553,'backup','loglifetime','30',NULL),(52,0,1466423553,'backup','backup_general_users','1',NULL),(53,0,1466423553,'backup','backup_general_users_locked','',NULL),(54,0,1466423553,'backup','backup_general_anonymize','0',NULL),(55,0,1466423553,'backup','backup_general_anonymize_locked','',NULL),(56,0,1466423553,'backup','backup_general_role_assignments','1',NULL),(57,0,1466423553,'backup','backup_general_role_assignments_locked','',NULL),(58,0,1466423553,'backup','backup_general_activities','1',NULL),(59,0,1466423553,'backup','backup_general_activities_locked','',NULL),(60,0,1466423553,'backup','backup_general_blocks','1',NULL),(61,0,1466423553,'backup','backup_general_blocks_locked','',NULL),(62,0,1466423553,'backup','backup_general_filters','1',NULL),(63,0,1466423553,'backup','backup_general_filters_locked','',NULL),(64,0,1466423553,'backup','backup_general_comments','1',NULL),(65,0,1466423553,'backup','backup_general_comments_locked','',NULL),(66,0,1466423553,'backup','backup_general_badges','1',NULL),(67,0,1466423553,'backup','backup_general_badges_locked','',NULL),(68,0,1466423553,'backup','backup_general_userscompletion','1',NULL),(69,0,1466423553,'backup','backup_general_userscompletion_locked','',NULL),(70,0,1466423553,'backup','backup_general_logs','0',NULL),(71,0,1466423553,'backup','backup_general_logs_locked','',NULL),(72,0,1466423553,'backup','backup_general_histories','0',NULL),(73,0,1466423553,'backup','backup_general_histories_locked','',NULL),(74,0,1466423553,'backup','backup_general_questionbank','1',NULL),(75,0,1466423553,'backup','backup_general_questionbank_locked','',NULL),(76,0,1466423553,'backup','backup_general_groups','1',NULL),(77,0,1466423553,'backup','backup_general_groups_locked','',NULL),(78,0,1466423553,'backup','import_general_maxresults','10',NULL),(79,0,1466423553,'backup','import_general_duplicate_admin_allowed','0',NULL),(80,0,1466423554,'backup','backup_auto_active','0',NULL),(81,0,1466423554,'backup','backup_auto_weekdays','0000000',NULL),(82,0,1466423554,'backup','backup_auto_hour','0',NULL),(83,0,1466423554,'backup','backup_auto_minute','0',NULL),(84,0,1466423554,'backup','backup_auto_storage','0',NULL),(85,0,1466423554,'backup','backup_auto_destination','',NULL),(86,0,1466423554,'backup','backup_auto_max_kept','1',NULL),(87,0,1466423554,'backup','backup_auto_delete_days','0',NULL),(88,0,1466423554,'backup','backup_auto_min_kept','0',NULL),(89,0,1466423554,'backup','backup_shortname','0',NULL),(90,0,1466423554,'backup','backup_auto_skip_hidden','1',NULL),(91,0,1466423554,'backup','backup_auto_skip_modif_days','30',NULL),(92,0,1466423554,'backup','backup_auto_skip_modif_prev','0',NULL),(93,0,1466423554,'backup','backup_auto_users','1',NULL),(94,0,1466423554,'backup','backup_auto_role_assignments','1',NULL),(95,0,1466423554,'backup','backup_auto_activities','1',NULL),(96,0,1466423554,'backup','backup_auto_blocks','1',NULL),(97,0,1466423554,'backup','backup_auto_filters','1',NULL),(98,0,1466423554,'backup','backup_auto_comments','1',NULL),(99,0,1466423554,'backup','backup_auto_badges','1',NULL),(100,0,1466423554,'backup','backup_auto_userscompletion','1',NULL),(101,0,1466423554,'backup','backup_auto_logs','0',NULL),(102,0,1466423554,'backup','backup_auto_histories','0',NULL),(103,0,1466423554,'backup','backup_auto_questionbank','1',NULL),(104,0,1466423554,'backup','backup_auto_groups','1',NULL),(105,0,1466423554,NULL,'grade_profilereport','user',NULL),(106,0,1466423554,NULL,'grade_aggregationposition','1',NULL),(107,0,1466423554,NULL,'grade_includescalesinaggregation','1',NULL),(108,0,1466423554,NULL,'grade_hiddenasdate','0',NULL),(109,0,1466423554,NULL,'gradepublishing','0',NULL),(110,0,1466423554,NULL,'grade_export_displaytype','1',NULL),(111,0,1466423554,NULL,'grade_export_decimalpoints','2',NULL),(112,0,1466423554,NULL,'grade_navmethod','0',NULL),(113,0,1466423554,NULL,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email',NULL),(114,0,1466423554,NULL,'grade_export_customprofilefields','',NULL),(115,0,1466423554,NULL,'recovergradesdefault','0',NULL),(116,0,1466423554,NULL,'gradeexport','',NULL),(117,0,1466423554,NULL,'unlimitedgrades','0',NULL),(118,0,1466423554,NULL,'grade_report_showmin','1',NULL),(119,0,1466423554,NULL,'gradepointmax','100',NULL),(120,0,1466423554,NULL,'gradepointdefault','100',NULL),(121,0,1466423555,NULL,'grade_minmaxtouse','1',NULL),(122,0,1466423555,NULL,'grade_mygrades_report','overview',NULL),(123,0,1466423555,NULL,'gradereport_mygradeurl','',NULL),(124,0,1466423555,NULL,'grade_hideforcedsettings','1',NULL),(125,0,1466423555,NULL,'grade_aggregation','13',NULL),(126,0,1466423555,NULL,'grade_aggregation_flag','0',NULL),(127,0,1466423555,NULL,'grade_aggregations_visible','13',NULL),(128,0,1466423555,NULL,'grade_aggregateonlygraded','1',NULL),(129,0,1466423555,NULL,'grade_aggregateonlygraded_flag','2',NULL),(130,0,1466423555,NULL,'grade_aggregateoutcomes','0',NULL),(131,0,1466423555,NULL,'grade_aggregateoutcomes_flag','2',NULL),(132,0,1466423555,NULL,'grade_keephigh','0',NULL),(133,0,1466423555,NULL,'grade_keephigh_flag','3',NULL),(134,0,1466423555,NULL,'grade_droplow','0',NULL),(135,0,1466423555,NULL,'grade_droplow_flag','2',NULL),(136,0,1466423555,NULL,'grade_overridecat','1',NULL),(137,0,1466423555,NULL,'grade_displaytype','1',NULL),(138,0,1466423555,NULL,'grade_decimalpoints','2',NULL),(139,0,1466423555,NULL,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime',NULL),(140,0,1466423555,NULL,'grade_report_studentsperpage','100',NULL),(141,0,1466423555,NULL,'grade_report_showonlyactiveenrol','1',NULL),(142,0,1466423555,NULL,'grade_report_quickgrading','1',NULL),(143,0,1466423555,NULL,'grade_report_showquickfeedback','0',NULL),(144,0,1466423555,NULL,'grade_report_meanselection','1',NULL),(145,0,1466423555,NULL,'grade_report_enableajax','0',NULL),(146,0,1466423555,NULL,'grade_report_showcalculations','1',NULL),(147,0,1466423555,NULL,'grade_report_showeyecons','0',NULL),(148,0,1466423555,NULL,'grade_report_showaverages','1',NULL),(149,0,1466423555,NULL,'grade_report_showlocks','0',NULL),(150,0,1466423555,NULL,'grade_report_showranges','0',NULL),(151,0,1466423555,NULL,'grade_report_showanalysisicon','1',NULL),(152,0,1466423555,NULL,'grade_report_showuserimage','1',NULL),(153,0,1466423555,NULL,'grade_report_showactivityicons','1',NULL),(154,0,1466423555,NULL,'grade_report_shownumberofgrades','0',NULL),(155,0,1466423555,NULL,'grade_report_averagesdisplaytype','inherit',NULL),(156,0,1466423555,NULL,'grade_report_rangesdisplaytype','inherit',NULL),(157,0,1466423555,NULL,'grade_report_averagesdecimalpoints','inherit',NULL),(158,0,1466423555,NULL,'grade_report_rangesdecimalpoints','inherit',NULL),(159,0,1466423555,NULL,'grade_report_historyperpage','50',NULL),(160,0,1466423555,NULL,'grade_report_overview_showrank','0',NULL),(161,0,1466423555,NULL,'grade_report_overview_showtotalsifcontainhidden','0',NULL),(162,0,1466423556,NULL,'grade_report_user_showrank','0',NULL),(163,0,1466423556,NULL,'grade_report_user_showpercentage','1',NULL),(164,0,1466423556,NULL,'grade_report_user_showgrade','1',NULL),(165,0,1466423556,NULL,'grade_report_user_showfeedback','1',NULL),(166,0,1466423556,NULL,'grade_report_user_showrange','1',NULL),(167,0,1466423556,NULL,'grade_report_user_showweight','1',NULL),(168,0,1466423556,NULL,'grade_report_user_showaverage','0',NULL),(169,0,1466423556,NULL,'grade_report_user_showlettergrade','0',NULL),(170,0,1466423556,NULL,'grade_report_user_rangedecimals','0',NULL),(171,0,1466423556,NULL,'grade_report_user_showhiddenitems','1',NULL),(172,0,1466423556,NULL,'grade_report_user_showtotalsifcontainhidden','0',NULL),(173,0,1466423556,NULL,'grade_report_user_showcontributiontocoursetotal','1',NULL),(174,0,1466423556,'core_competency','enabled','1',NULL),(175,0,1466423556,'core_competency','pushcourseratingstouserplans','1',NULL),(176,0,1466423556,NULL,'badges_defaultissuername','',NULL),(177,0,1466423556,NULL,'badges_defaultissuercontact','',NULL),(178,0,1466423556,NULL,'badges_badgesalt','badges1466423526',NULL),(179,0,1466423556,NULL,'badges_allowexternalbackpack','1',NULL),(180,0,1466423556,NULL,'badges_allowcoursebadges','1',NULL),(181,0,1466423556,NULL,'timezone','Europe/London',NULL),(182,0,1466423557,NULL,'forcetimezone','99',NULL),(183,0,1466423557,NULL,'country','0',NULL),(184,0,1466423557,NULL,'defaultcity','',NULL),(185,0,1466423557,NULL,'geoipfile','/var/www/moodles/stable_31/moodledata/geoip/GeoLiteCity.dat',NULL),(186,0,1466423557,NULL,'googlemapkey3','',NULL),(187,0,1466423557,NULL,'allcountrycodes','',NULL),(188,0,1466423557,NULL,'autolang','1',NULL),(189,0,1466423557,NULL,'lang','en',NULL),(190,0,1466423557,NULL,'langmenu','1',NULL),(191,0,1466423557,NULL,'langlist','',NULL),(192,0,1466423557,NULL,'langcache','1',NULL),(193,0,1466423557,NULL,'langstringcache','1',NULL),(194,0,1466423557,NULL,'locale','',NULL),(195,0,1466423557,NULL,'latinexcelexport','0',NULL),(196,0,1466423557,NULL,'requiremodintro','0',NULL),(197,0,1466423557,NULL,'registerauth','',NULL),(198,0,1466423557,NULL,'authloginviaemail','0',NULL),(199,0,1466423557,NULL,'allowaccountssameemail','0',NULL),(200,0,1466423557,NULL,'authpreventaccountcreation','0',NULL),(201,0,1466423558,NULL,'loginpageautofocus','0',NULL),(202,0,1466423558,NULL,'guestloginbutton','1',NULL),(203,0,1466423558,NULL,'limitconcurrentlogins','0',NULL),(204,0,1466423558,NULL,'alternateloginurl','',NULL),(205,0,1466423558,NULL,'forgottenpasswordurl','',NULL),(206,0,1466423558,NULL,'auth_instructions','',NULL),(207,0,1466423558,NULL,'allowemailaddresses','',NULL),(208,0,1466423558,NULL,'denyemailaddresses','',NULL),(209,0,1466423558,NULL,'verifychangedemail','1',NULL),(210,0,1466423558,NULL,'recaptchapublickey','',NULL),(211,0,1466423558,NULL,'recaptchaprivatekey','',NULL),(212,0,1466423558,'cachestore_memcache','testservers','',NULL),(213,0,1466423558,'cachestore_memcached','testservers','',NULL),(214,0,1466423558,'cachestore_mongodb','testserver','',NULL),(215,0,1466423558,NULL,'filteruploadedfiles','0',NULL),(216,0,1466423558,NULL,'filtermatchoneperpage','0',NULL),(217,0,1466423558,NULL,'filtermatchonepertext','0',NULL),(218,0,1466423558,NULL,'sitedefaultlicense','allrightsreserved',NULL),(219,0,1466423558,NULL,'portfolio_moderate_filesize_threshold','1048576',NULL),(220,0,1466423558,NULL,'portfolio_high_filesize_threshold','5242880',NULL),(221,0,1466423558,NULL,'portfolio_moderate_db_threshold','20',NULL),(222,0,1466423558,NULL,'portfolio_high_db_threshold','50',NULL),(223,0,1466423558,'question_preview','behaviour','deferredfeedback',NULL),(224,0,1466423558,'question_preview','correctness','1',NULL),(225,0,1466423558,'question_preview','marks','2',NULL),(226,0,1466423558,'question_preview','markdp','2',NULL),(227,0,1466423558,'question_preview','feedback','1',NULL),(228,0,1466423558,'question_preview','generalfeedback','1',NULL),(229,0,1466423558,'question_preview','rightanswer','1',NULL),(230,0,1466423558,'question_preview','history','0',NULL),(231,0,1466423558,NULL,'repositorycacheexpire','120',NULL),(232,0,1466423559,NULL,'repositorygetfiletimeout','30',NULL),(233,0,1466423559,NULL,'repositorysyncfiletimeout','1',NULL),(234,0,1466423559,NULL,'repositorysyncimagetimeout','3',NULL),(235,0,1466423559,NULL,'repositoryallowexternallinks','1',NULL),(236,0,1466423559,NULL,'legacyfilesinnewcourses','0',NULL),(237,0,1466423559,NULL,'legacyfilesaddallowed','1',NULL),(238,0,1466423559,NULL,'searchengine','solr',NULL),(239,0,1466423559,'mod_assign','search_activity_enabled','1',NULL),(240,0,1466423559,'mod_book','search_activity_enabled','1',NULL),(241,0,1466423559,'mod_book','search_chapter_enabled','1',NULL),(242,0,1466423559,'mod_chat','search_activity_enabled','1',NULL),(243,0,1466423559,'mod_choice','search_activity_enabled','1',NULL),(244,0,1466423559,'mod_data','search_activity_enabled','1',NULL),(245,0,1466423559,'mod_feedback','search_activity_enabled','1',NULL),(246,0,1466423559,'mod_folder','search_activity_enabled','1',NULL),(247,0,1466423559,'mod_forum','search_activity_enabled','1',NULL),(248,0,1466423559,'mod_forum','search_post_enabled','1',NULL),(249,0,1466423559,'mod_glossary','search_activity_enabled','1',NULL),(250,0,1466423559,'mod_glossary','search_entry_enabled','1',NULL),(251,0,1466423559,'mod_imscp','search_activity_enabled','1',NULL),(252,0,1466423559,'mod_label','search_activity_enabled','1',NULL),(253,0,1466423559,'mod_lesson','search_activity_enabled','1',NULL),(254,0,1466423559,'mod_lti','search_activity_enabled','1',NULL),(255,0,1466423559,'mod_page','search_activity_enabled','1',NULL),(256,0,1466423559,'mod_quiz','search_activity_enabled','1',NULL),(257,0,1466423559,'mod_resource','search_activity_enabled','1',NULL),(258,0,1466423560,'mod_scorm','search_activity_enabled','1',NULL),(259,0,1466423560,'mod_survey','search_activity_enabled','1',NULL),(260,0,1466423560,'mod_url','search_activity_enabled','1',NULL),(261,0,1466423560,'mod_wiki','search_activity_enabled','1',NULL),(262,0,1466423560,'mod_wiki','search_collaborative_page_enabled','1',NULL),(263,0,1466423560,'mod_workshop','search_activity_enabled','1',NULL),(264,0,1466423560,'core_search','core_course_mycourse_enabled','1',NULL),(265,0,1466423560,NULL,'mobilecssurl','',NULL),(266,0,1466423560,NULL,'enablewsdocumentation','0',NULL),(267,0,1466423560,NULL,'allowbeforeblock','0',NULL),(268,0,1466423560,NULL,'allowedip','',NULL),(269,0,1466423560,NULL,'blockedip','',NULL),(270,0,1466423560,NULL,'protectusernames','1',NULL),(271,0,1466423560,NULL,'forcelogin','0',NULL),(272,0,1466423560,NULL,'forceloginforprofiles','1',NULL),(273,0,1466423560,NULL,'forceloginforprofileimage','0',NULL),(274,0,1466423560,NULL,'opentogoogle','0',NULL),(275,0,1466423560,NULL,'maxbytes','0',NULL),(276,0,1466423560,NULL,'userquota','104857600',NULL),(277,0,1466423560,NULL,'allowobjectembed','0',NULL),(278,0,1466423560,NULL,'enabletrusttext','0',NULL),(279,0,1466423561,NULL,'maxeditingtime','1800',NULL),(280,0,1466423561,NULL,'extendedusernamechars','0',NULL),(281,0,1466423561,NULL,'sitepolicy','',NULL),(282,0,1466423561,NULL,'sitepolicyguest','',NULL),(283,0,1466423561,NULL,'keeptagnamecase','1',NULL),(284,0,1466423561,NULL,'profilesforenrolledusersonly','1',NULL),(285,0,1466423561,NULL,'cronclionly','1',NULL),(286,0,1466423561,NULL,'cronremotepassword','',NULL),(287,0,1466423561,NULL,'lockoutthreshold','0',NULL),(288,0,1466423561,NULL,'lockoutwindow','1800',NULL),(289,0,1466423561,NULL,'lockoutduration','1800',NULL),(290,0,1466423561,NULL,'passwordpolicy','1',NULL),(291,0,1466423561,NULL,'minpasswordlength','8',NULL),(292,0,1466423561,NULL,'minpassworddigits','1',NULL),(293,0,1466423561,NULL,'minpasswordlower','1',NULL),(294,0,1466423561,NULL,'minpasswordupper','1',NULL),(295,0,1466423561,NULL,'minpasswordnonalphanum','1',NULL),(296,0,1466423561,NULL,'maxconsecutiveidentchars','0',NULL),(297,0,1466423561,NULL,'passwordreuselimit','0',NULL),(298,0,1466423561,NULL,'pwresettime','1800',NULL),(299,0,1466423561,NULL,'passwordchangelogout','0',NULL),(300,0,1466423561,NULL,'groupenrolmentkeypolicy','1',NULL),(301,0,1466423561,NULL,'disableuserimages','0',NULL),(302,0,1466423561,NULL,'emailchangeconfirmation','1',NULL),(303,0,1466423561,NULL,'rememberusername','2',NULL),(304,0,1466423561,NULL,'strictformsrequired','0',NULL),(305,0,1466423561,NULL,'loginhttps','0',NULL),(306,0,1466423561,NULL,'cookiesecure','0',NULL),(307,0,1466423561,NULL,'cookiehttponly','0',NULL),(308,0,1466423561,NULL,'allowframembedding','0',NULL),(309,0,1466423561,NULL,'loginpasswordautocomplete','0',NULL),(310,0,1466423561,NULL,'displayloginfailures','0',NULL),(311,0,1466423561,NULL,'notifyloginfailures','',NULL),(312,0,1466423561,NULL,'notifyloginthreshold','10',NULL),(313,0,1466423561,NULL,'themelist','',NULL),(314,0,1466423562,NULL,'themedesignermode','0',NULL),(315,0,1466423562,NULL,'allowuserthemes','0',NULL),(316,0,1466423562,NULL,'allowcoursethemes','0',NULL),(317,0,1466423562,NULL,'allowcategorythemes','0',NULL),(318,0,1466423562,NULL,'allowthemechangeonurl','0',NULL),(319,0,1466423562,NULL,'allowuserblockhiding','1',NULL),(320,0,1466423562,NULL,'allowblockstodock','1',NULL),(321,0,1466423562,NULL,'custommenuitems','',NULL),(322,0,1466423562,NULL,'customusermenuitems','grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences',NULL),(323,0,1466423562,NULL,'enabledevicedetection','1',NULL),(324,0,1466423562,NULL,'devicedetectregex','[]',NULL),(325,0,1466423562,'theme_clean','invert','0',NULL),(326,0,1466423562,'theme_clean','logo','',NULL),(327,0,1466423562,'theme_clean','smalllogo','',NULL),(328,0,1466423562,'theme_clean','sitename','1',NULL),(329,0,1466423562,'theme_clean','customcss','',NULL),(330,0,1466423562,'theme_clean','footnote','',NULL),(331,0,1466423562,'theme_more','textcolor','#333366',NULL),(332,0,1466423562,'theme_more','linkcolor','#FF6500',NULL),(333,0,1466423562,'theme_more','bodybackground','',NULL),(334,0,1466423562,'theme_more','backgroundimage','',NULL),(335,0,1466423562,'theme_more','backgroundrepeat','repeat',NULL),(336,0,1466423562,'theme_more','backgroundposition','0',NULL),(337,0,1466423562,'theme_more','backgroundfixed','0',NULL),(338,0,1466423562,'theme_more','contentbackground','#FFFFFF',NULL),(339,0,1466423562,'theme_more','secondarybackground','#FFFFFF',NULL),(340,0,1466423562,'theme_more','invert','1',NULL),(341,0,1466423562,'theme_more','logo','',NULL),(342,0,1466423562,'theme_more','smalllogo','',NULL),(343,0,1466423562,'theme_more','sitename','1',NULL),(344,0,1466423562,'theme_more','customcss','',NULL),(345,0,1466423562,'theme_more','footnote','',NULL),(346,0,1466423562,NULL,'calendartype','gregorian',NULL),(347,0,1466423562,NULL,'calendar_adminseesall','0',NULL),(348,0,1466423562,NULL,'calendar_site_timeformat','0',NULL),(349,0,1466423562,NULL,'calendar_startwday','1',NULL),(350,0,1466423562,NULL,'calendar_weekend','65',NULL),(351,0,1466423562,NULL,'calendar_lookahead','21',NULL),(352,0,1466423562,NULL,'calendar_maxevents','10',NULL),(353,0,1466423563,NULL,'enablecalendarexport','1',NULL),(354,0,1466423563,NULL,'calendar_customexport','1',NULL),(355,0,1466423563,NULL,'calendar_exportlookahead','365',NULL),(356,0,1466423563,NULL,'calendar_exportlookback','5',NULL),(357,0,1466423563,NULL,'calendar_exportsalt','vFyokMfpDYQwpCFarqcGMEAJ4FUErqBlQRB2lMdYGQwN0qCvzO8FSr51elgx',NULL),(358,0,1466423563,NULL,'calendar_showicalsource','1',NULL),(359,0,1466423563,NULL,'useblogassociations','1',NULL),(360,0,1466423563,NULL,'bloglevel','4',NULL),(361,0,1466423563,NULL,'useexternalblogs','1',NULL),(362,0,1466423563,NULL,'externalblogcrontime','86400',NULL),(363,0,1466423563,NULL,'maxexternalblogsperuser','1',NULL),(364,0,1466423563,NULL,'blogusecomments','1',NULL),(365,0,1466423563,NULL,'blogshowcommentscount','1',NULL),(366,0,1466423563,NULL,'defaulthomepage','1',NULL),(367,0,1466423563,NULL,'allowguestmymoodle','1',NULL),(368,0,1466423563,NULL,'navshowfullcoursenames','0',NULL),(369,0,1466423563,NULL,'navshowcategories','1',NULL),(370,0,1466423563,NULL,'navshowmycoursecategories','0',NULL),(371,0,1466423563,NULL,'navshowallcourses','0',NULL),(372,0,1466423563,NULL,'navexpandmycourses','1',NULL),(373,0,1466423563,NULL,'navsortmycoursessort','sortorder',NULL),(374,0,1466423563,NULL,'navcourselimit','20',NULL),(375,0,1466423563,NULL,'usesitenameforsitepages','0',NULL),(376,0,1466423563,NULL,'linkadmincategories','0',NULL),(377,0,1466423563,NULL,'linkcoursesections','0',NULL),(378,0,1466423563,NULL,'navshowfrontpagemods','1',NULL),(379,0,1466423563,NULL,'navadduserpostslinks','1',NULL),(380,0,1466423563,NULL,'formatstringstriptags','1',NULL),(381,0,1466423563,NULL,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]',NULL),(382,0,1466423563,NULL,'core_media_enable_youtube','1',NULL),(383,0,1466423563,NULL,'core_media_enable_vimeo','0',NULL),(384,0,1466423563,NULL,'core_media_enable_mp3','1',NULL),(385,0,1466423563,NULL,'core_media_enable_flv','1',NULL),(386,0,1466423563,NULL,'core_media_enable_swf','1',NULL),(387,0,1466423563,NULL,'core_media_enable_html5audio','1',NULL),(388,0,1466423564,NULL,'core_media_enable_html5video','1',NULL),(389,0,1466423564,NULL,'core_media_enable_qt','1',NULL),(390,0,1466423564,NULL,'core_media_enable_wmp','1',NULL),(391,0,1466423564,NULL,'core_media_enable_rm','1',NULL),(392,0,1466423564,NULL,'docroot','http://docs.moodle.org',NULL),(393,0,1466423564,NULL,'doclang','',NULL),(394,0,1466423564,NULL,'doctonewwindow','0',NULL),(395,0,1466423564,NULL,'courselistshortnames','0',NULL),(396,0,1466423564,NULL,'coursesperpage','20',NULL),(397,0,1466423564,NULL,'courseswithsummarieslimit','10',NULL),(398,0,1466423564,NULL,'courseoverviewfileslimit','1',NULL),(399,0,1466423564,NULL,'courseoverviewfilesext','.jpg,.gif,.png',NULL),(400,0,1466423564,NULL,'useexternalyui','0',NULL),(401,0,1466423564,NULL,'yuicomboloading','1',NULL),(402,0,1466423564,NULL,'cachejs','1',NULL),(403,0,1466423564,NULL,'modchooserdefault','1',NULL),(404,0,1466423564,NULL,'modeditingmenu','1',NULL),(405,0,1466423564,NULL,'blockeditingmenu','1',NULL),(406,0,1466423564,NULL,'additionalhtmlhead','',NULL),(407,0,1466423564,NULL,'additionalhtmltopofbody','',NULL),(408,0,1466423564,NULL,'additionalhtmlfooter','',NULL),(409,0,1466423564,NULL,'pathtodu','',NULL),(410,0,1466423564,NULL,'aspellpath','',NULL),(411,0,1466423564,NULL,'pathtodot','',NULL),(412,0,1466423564,NULL,'pathtogs','/usr/bin/gs',NULL),(413,0,1466423564,NULL,'pathtounoconv','/usr/bin/unoconv',NULL),(414,0,1466423564,NULL,'supportname','Admin User',NULL),(415,0,1466423564,NULL,'supportemail','',NULL),(416,0,1466423564,NULL,'supportpage','',NULL),(417,0,1466423564,NULL,'dbsessions','0',NULL),(418,0,1466423564,NULL,'sessioncookie','',NULL),(419,0,1466423564,NULL,'sessioncookiepath','',NULL),(420,0,1466423564,NULL,'sessioncookiedomain','',NULL),(421,0,1466423564,NULL,'statsfirstrun','none',NULL),(422,0,1466423564,NULL,'statsmaxruntime','0',NULL),(423,0,1466423564,NULL,'statsruntimedays','31',NULL),(424,0,1466423564,NULL,'statsruntimestarthour','0',NULL),(425,0,1466423564,NULL,'statsruntimestartminute','0',NULL),(426,0,1466423565,NULL,'statsuserthreshold','0',NULL),(427,0,1466423565,NULL,'slasharguments','1',NULL),(428,0,1466423565,NULL,'getremoteaddrconf','0',NULL),(429,0,1466423565,NULL,'proxyhost','',NULL),(430,0,1466423565,NULL,'proxyport','0',NULL),(431,0,1466423565,NULL,'proxytype','HTTP',NULL),(432,0,1466423565,NULL,'proxyuser','',NULL),(433,0,1466423565,NULL,'proxypassword','',NULL),(434,0,1466423565,NULL,'proxybypass','localhost, 127.0.0.1',NULL),(435,0,1466423565,NULL,'maintenance_enabled','0',NULL),(436,0,1466423565,NULL,'maintenance_message','',NULL),(437,0,1466423565,NULL,'deleteunconfirmed','168',NULL),(438,0,1466423565,NULL,'deleteincompleteusers','0',NULL),(439,0,1466423565,NULL,'disablegradehistory','0',NULL),(440,0,1466423565,NULL,'gradehistorylifetime','0',NULL),(441,0,1466423565,NULL,'tempdatafoldercleanup','168',NULL),(442,0,1466423565,NULL,'extramemorylimit','512M',NULL),(443,0,1466423565,NULL,'maxtimelimit','0',NULL),(444,0,1466423565,NULL,'curlcache','120',NULL),(445,0,1466423565,NULL,'curltimeoutkbitrate','56',NULL),(446,0,1466423565,NULL,'updateautocheck','1',NULL),(447,0,1466423565,NULL,'updateminmaturity','200',NULL),(448,0,1466423565,NULL,'updatenotifybuilds','0',NULL),(449,0,1466423565,NULL,'enablesafebrowserintegration','0',NULL),(450,0,1466423565,NULL,'dndallowtextandlinks','0',NULL),(451,0,1466423565,NULL,'enablecssoptimiser','0',NULL),(452,0,1466423565,NULL,'debug','0',NULL),(453,0,1466423565,NULL,'debugdisplay','1',NULL),(454,0,1466423565,NULL,'debugsmtp','0',NULL),(455,0,1466423565,NULL,'perfdebug','7',NULL),(456,0,1466423565,NULL,'debugstringids','0',NULL),(457,0,1466423565,NULL,'debugvalidators','0',NULL),(458,0,1466423565,NULL,'debugpageinfo','0',NULL),(459,0,1466423565,NULL,'profilingenabled','0',NULL),(460,0,1466423565,NULL,'profilingincluded','',NULL),(461,0,1466423565,NULL,'profilingexcluded','',NULL),(462,0,1466423565,NULL,'profilingautofrec','0',NULL),(463,0,1466423565,NULL,'profilingallowme','0',NULL),(464,0,1466423565,NULL,'profilingallowall','0',NULL),(465,0,1466423565,NULL,'profilinglifetime','1440',NULL),(466,0,1466423566,NULL,'profilingimportprefix','(I)',NULL),(467,0,1466423614,'activitynames','filter_active','1',''),(468,0,1466423614,'mathjaxloader','filter_active','1',''),(469,0,1466423614,'mediaplugin','filter_active','1',''),(470,2,1466423656,NULL,'notloggedinroleid','6',NULL),(471,2,1466423656,NULL,'guestroleid','6',NULL),(472,2,1466423656,NULL,'defaultuserroleid','7',NULL),(473,2,1466423656,NULL,'creatornewroleid','3',NULL),(474,2,1466423656,NULL,'restorernewroleid','3',NULL),(475,2,1466423657,NULL,'gradebookroles','5',NULL),(476,2,1466423658,'assign','feedback_plugin_for_gradebook','assignfeedback_comments',NULL),(477,2,1466423658,'assign','showrecentsubmissions','0',NULL),(478,2,1466423658,'assign','submissionreceipts','1',NULL),(479,2,1466423658,'assign','submissionstatement','This assignment is my own work, except where I have acknowledged the use of the works of other people.',NULL),(480,2,1466423658,'assign','maxperpage','-1',NULL),(481,2,1466423658,'assign','alwaysshowdescription','1',NULL),(482,2,1466423658,'assign','alwaysshowdescription_adv','',NULL),(483,2,1466423658,'assign','alwaysshowdescription_locked','',NULL),(484,2,1466423658,'assign','allowsubmissionsfromdate','0',NULL),(485,2,1466423658,'assign','allowsubmissionsfromdate_enabled','1',NULL),(486,2,1466423658,'assign','allowsubmissionsfromdate_adv','',NULL),(487,2,1466423658,'assign','duedate','604800',NULL),(488,2,1466423659,'assign','duedate_enabled','1',NULL),(489,2,1466423659,'assign','duedate_adv','',NULL),(490,2,1466423659,'assign','cutoffdate','1209600',NULL),(491,2,1466423659,'assign','cutoffdate_enabled','',NULL),(492,2,1466423659,'assign','cutoffdate_adv','',NULL),(493,2,1466423659,'assign','submissiondrafts','0',NULL),(494,2,1466423659,'assign','submissiondrafts_adv','',NULL),(495,2,1466423659,'assign','submissiondrafts_locked','',NULL),(496,2,1466423659,'assign','requiresubmissionstatement','0',NULL),(497,2,1466423659,'assign','requiresubmissionstatement_adv','',NULL),(498,2,1466423659,'assign','requiresubmissionstatement_locked','',NULL),(499,2,1466423659,'assign','attemptreopenmethod','none',NULL),(500,2,1466423659,'assign','attemptreopenmethod_adv','',NULL),(501,2,1466423660,'assign','attemptreopenmethod_locked','',NULL),(502,2,1466423660,'assign','maxattempts','-1',NULL),(503,2,1466423660,'assign','maxattempts_adv','',NULL),(504,2,1466423660,'assign','maxattempts_locked','',NULL),(505,2,1466423660,'assign','teamsubmission','0',NULL),(506,2,1466423660,'assign','teamsubmission_adv','',NULL),(507,2,1466423660,'assign','teamsubmission_locked','',NULL),(508,2,1466423660,'assign','preventsubmissionnotingroup','0',NULL),(509,2,1466423660,'assign','preventsubmissionnotingroup_adv','',NULL),(510,2,1466423660,'assign','preventsubmissionnotingroup_locked','',NULL),(511,2,1466423660,'assign','requireallteammemberssubmit','0',NULL),(512,2,1466423660,'assign','requireallteammemberssubmit_adv','',NULL),(513,2,1466423660,'assign','requireallteammemberssubmit_locked','',NULL),(514,2,1466423660,'assign','teamsubmissiongroupingid','',NULL),(515,2,1466423660,'assign','teamsubmissiongroupingid_adv','',NULL),(516,2,1466423660,'assign','sendnotifications','0',NULL),(517,2,1466423660,'assign','sendnotifications_adv','',NULL),(518,2,1466423660,'assign','sendnotifications_locked','',NULL),(519,2,1466423660,'assign','sendlatenotifications','0',NULL),(520,2,1466423661,'assign','sendlatenotifications_adv','',NULL),(521,2,1466423661,'assign','sendlatenotifications_locked','',NULL),(522,2,1466423661,'assign','sendstudentnotifications','1',NULL),(523,2,1466423661,'assign','sendstudentnotifications_adv','',NULL),(524,2,1466423661,'assign','sendstudentnotifications_locked','',NULL),(525,2,1466423661,'assign','blindmarking','0',NULL),(526,2,1466423661,'assign','blindmarking_adv','',NULL),(527,2,1466423661,'assign','blindmarking_locked','',NULL),(528,2,1466423661,'assign','markingworkflow','0',NULL),(529,2,1466423661,'assign','markingworkflow_adv','',NULL),(530,2,1466423661,'assign','markingworkflow_locked','',NULL),(531,2,1466423661,'assign','markingallocation','0',NULL),(532,2,1466423661,'assign','markingallocation_adv','',NULL),(533,2,1466423662,'assign','markingallocation_locked','',NULL),(534,2,1466423662,'assignsubmission_file','default','1',NULL),(535,2,1466423662,'assignsubmission_file','maxfiles','20',NULL),(536,2,1466423662,'assignsubmission_file','maxbytes','1048576',NULL),(537,2,1466423662,'assignsubmission_onlinetext','default','0',NULL),(538,2,1466423662,'assignfeedback_comments','default','1',NULL),(539,2,1466423663,'assignfeedback_comments','inline','0',NULL),(540,2,1466423663,'assignfeedback_comments','inline_adv','',NULL),(541,2,1466423663,'assignfeedback_comments','inline_locked','',NULL),(542,2,1466423664,'assignfeedback_editpdf','stamps','',NULL),(543,2,1466423664,'assignfeedback_file','default','0',NULL),(544,2,1466423664,'assignfeedback_offline','default','0',NULL),(545,2,1466423664,'book','numberingoptions','0,1,2,3',NULL),(546,2,1466423665,'book','navoptions','0,1,2',NULL),(547,2,1466423665,'book','numbering','1',NULL),(548,2,1466423665,'book','navstyle','1',NULL),(549,2,1466423665,NULL,'chat_method','ajax',NULL),(550,2,1466423665,NULL,'chat_refresh_userlist','10',NULL),(551,2,1466423666,NULL,'chat_old_ping','35',NULL),(552,2,1466423666,NULL,'chat_refresh_room','5',NULL),(553,2,1466423666,NULL,'chat_normal_updatemode','jsupdate',NULL),(554,2,1466423666,NULL,'chat_serverhost','dan.local',NULL),(555,2,1466423666,NULL,'chat_serverip','127.0.0.1',NULL),(556,2,1466423666,NULL,'chat_serverport','9111',NULL),(557,2,1466423666,NULL,'chat_servermax','100',NULL),(558,2,1466423666,NULL,'data_enablerssfeeds','0',NULL),(559,2,1466423666,NULL,'feedback_allowfullanonymous','0',NULL),(560,2,1466423666,'folder','showexpanded','1',NULL),(561,2,1466423666,'folder','maxsizetodownload','0',NULL),(562,2,1466423666,NULL,'forum_displaymode','3',NULL),(563,2,1466423666,NULL,'forum_replytouser','1',NULL),(564,2,1466423666,NULL,'forum_shortpost','300',NULL),(565,2,1466423666,NULL,'forum_longpost','600',NULL),(566,2,1466423666,NULL,'forum_manydiscussions','100',NULL),(567,2,1466423666,NULL,'forum_maxbytes','512000',NULL),(568,2,1466423667,NULL,'forum_maxattachments','9',NULL),(569,2,1466423667,NULL,'forum_trackingtype','1',NULL),(570,2,1466423667,NULL,'forum_trackreadposts','1',NULL),(571,2,1466423667,NULL,'forum_allowforcedreadtracking','0',NULL),(572,2,1466423667,NULL,'forum_oldpostdays','14',NULL),(573,2,1466423667,NULL,'forum_usermarksread','0',NULL),(574,2,1466423667,NULL,'forum_cleanreadtime','2',NULL),(575,2,1466423667,NULL,'digestmailtime','17',NULL),(576,2,1466423667,NULL,'forum_enablerssfeeds','0',NULL),(577,2,1466423667,NULL,'forum_enabletimedposts','1',NULL),(578,2,1466423667,NULL,'glossary_entbypage','10',NULL),(579,2,1466423667,NULL,'glossary_dupentries','0',NULL),(580,2,1466423667,NULL,'glossary_allowcomments','0',NULL),(581,2,1466423667,NULL,'glossary_linkbydefault','1',NULL),(582,2,1466423667,NULL,'glossary_defaultapproval','1',NULL),(583,2,1466423667,NULL,'glossary_enablerssfeeds','0',NULL),(584,2,1466423667,NULL,'glossary_linkentries','0',NULL),(585,2,1466423667,NULL,'glossary_casesensitive','0',NULL),(586,2,1466423667,NULL,'glossary_fullmatch','0',NULL),(587,2,1466423667,'imscp','keepold','1',NULL),(588,2,1466423667,'imscp','keepold_adv','',NULL),(589,2,1466423667,'label','dndmedia','1',NULL),(590,2,1466423668,'label','dndresizewidth','400',NULL),(591,2,1466423668,'label','dndresizeheight','400',NULL),(592,2,1466423668,'mod_lesson','mediafile','',NULL),(593,2,1466423668,'mod_lesson','mediafile_adv','1',NULL),(594,2,1466423668,'mod_lesson','mediawidth','640',NULL),(595,2,1466423668,'mod_lesson','mediaheight','480',NULL),(596,2,1466423668,'mod_lesson','mediaclose','0',NULL),(597,2,1466423668,'mod_lesson','progressbar','0',NULL),(598,2,1466423668,'mod_lesson','progressbar_adv','',NULL),(599,2,1466423668,'mod_lesson','ongoing','0',NULL),(600,2,1466423668,'mod_lesson','ongoing_adv','1',NULL),(601,2,1466423668,'mod_lesson','displayleftmenu','0',NULL),(602,2,1466423668,'mod_lesson','displayleftmenu_adv','',NULL),(603,2,1466423668,'mod_lesson','displayleftif','0',NULL),(604,2,1466423668,'mod_lesson','displayleftif_adv','1',NULL),(605,2,1466423668,'mod_lesson','slideshow','0',NULL),(606,2,1466423668,'mod_lesson','slideshow_adv','1',NULL),(607,2,1466423668,'mod_lesson','slideshowwidth','640',NULL),(608,2,1466423669,'mod_lesson','slideshowheight','480',NULL),(609,2,1466423669,'mod_lesson','slideshowbgcolor','#FFFFFF',NULL),(610,2,1466423669,'mod_lesson','maxanswers','5',NULL),(611,2,1466423669,'mod_lesson','maxanswers_adv','1',NULL),(612,2,1466423669,'mod_lesson','defaultfeedback','0',NULL),(613,2,1466423669,'mod_lesson','defaultfeedback_adv','1',NULL),(614,2,1466423669,'mod_lesson','activitylink','',NULL),(615,2,1466423669,'mod_lesson','activitylink_adv','1',NULL),(616,2,1466423669,'mod_lesson','timelimit','0',NULL),(617,2,1466423670,'mod_lesson','timelimit_adv','',NULL),(618,2,1466423670,'mod_lesson','password','0',NULL),(619,2,1466423670,'mod_lesson','password_adv','1',NULL),(620,2,1466423670,'mod_lesson','modattempts','0',NULL),(621,2,1466423670,'mod_lesson','modattempts_adv','',NULL),(622,2,1466423670,'mod_lesson','displayreview','0',NULL),(623,2,1466423670,'mod_lesson','displayreview_adv','',NULL),(624,2,1466423670,'mod_lesson','maximumnumberofattempts','1',NULL),(625,2,1466423670,'mod_lesson','maximumnumberofattempts_adv','',NULL),(626,2,1466423670,'mod_lesson','defaultnextpage','0',NULL),(627,2,1466423670,'mod_lesson','defaultnextpage_adv','1',NULL),(628,2,1466423671,'mod_lesson','numberofpagestoshow','1',NULL),(629,2,1466423671,'mod_lesson','numberofpagestoshow_adv','1',NULL),(630,2,1466423671,'mod_lesson','practice','0',NULL),(631,2,1466423671,'mod_lesson','practice_adv','',NULL),(632,2,1466423671,'mod_lesson','customscoring','1',NULL),(633,2,1466423671,'mod_lesson','customscoring_adv','1',NULL),(634,2,1466423671,'mod_lesson','retakesallowed','0',NULL),(635,2,1466423671,'mod_lesson','retakesallowed_adv','',NULL),(636,2,1466423671,'mod_lesson','handlingofretakes','0',NULL),(637,2,1466423671,'mod_lesson','handlingofretakes_adv','1',NULL),(638,2,1466423671,'mod_lesson','minimumnumberofquestions','0',NULL),(639,2,1466423671,'mod_lesson','minimumnumberofquestions_adv','1',NULL),(640,2,1466423672,'page','displayoptions','5',NULL),(641,2,1466423672,'page','printheading','1',NULL),(642,2,1466423672,'page','printintro','0',NULL),(643,2,1466423672,'page','display','5',NULL),(644,2,1466423672,'page','popupwidth','620',NULL),(645,2,1466423672,'page','popupheight','450',NULL),(646,2,1466423672,'quiz','timelimit','0',NULL),(647,2,1466423672,'quiz','timelimit_adv','',NULL),(648,2,1466423672,'quiz','overduehandling','autosubmit',NULL),(649,2,1466423672,'quiz','overduehandling_adv','',NULL),(650,2,1466423672,'quiz','graceperiod','86400',NULL),(651,2,1466423672,'quiz','graceperiod_adv','',NULL),(652,2,1466423672,'quiz','graceperiodmin','60',NULL),(653,2,1466423672,'quiz','attempts','0',NULL),(654,2,1466423672,'quiz','attempts_adv','',NULL),(655,2,1466423672,'quiz','grademethod','1',NULL),(656,2,1466423672,'quiz','grademethod_adv','',NULL),(657,2,1466423672,'quiz','maximumgrade','10',NULL),(658,2,1466423672,'quiz','questionsperpage','1',NULL),(659,2,1466423672,'quiz','questionsperpage_adv','',NULL),(660,2,1466423672,'quiz','navmethod','free',NULL),(661,2,1466423672,'quiz','navmethod_adv','1',NULL),(662,2,1466423673,'quiz','shuffleanswers','1',NULL),(663,2,1466423673,'quiz','shuffleanswers_adv','',NULL),(664,2,1466423673,'quiz','preferredbehaviour','deferredfeedback',NULL),(665,2,1466423673,'quiz','canredoquestions','0',NULL),(666,2,1466423673,'quiz','canredoquestions_adv','1',NULL),(667,2,1466423673,'quiz','attemptonlast','0',NULL),(668,2,1466423673,'quiz','attemptonlast_adv','1',NULL),(669,2,1466423673,'quiz','reviewattempt','69904',NULL),(670,2,1466423673,'quiz','reviewcorrectness','69904',NULL),(671,2,1466423673,'quiz','reviewmarks','69904',NULL),(672,2,1466423673,'quiz','reviewspecificfeedback','69904',NULL),(673,2,1466423673,'quiz','reviewgeneralfeedback','69904',NULL),(674,2,1466423674,'quiz','reviewrightanswer','69904',NULL),(675,2,1466423674,'quiz','reviewoverallfeedback','4368',NULL),(676,2,1466423674,'quiz','showuserpicture','0',NULL),(677,2,1466423674,'quiz','showuserpicture_adv','',NULL),(678,2,1466423674,'quiz','decimalpoints','2',NULL),(679,2,1466423674,'quiz','decimalpoints_adv','',NULL),(680,2,1466423674,'quiz','questiondecimalpoints','-1',NULL),(681,2,1466423674,'quiz','questiondecimalpoints_adv','1',NULL),(682,2,1466423674,'quiz','showblocks','0',NULL),(683,2,1466423674,'quiz','showblocks_adv','1',NULL),(684,2,1466423674,'quiz','password','',NULL),(685,2,1466423674,'quiz','password_adv','',NULL),(686,2,1466423674,'quiz','subnet','',NULL),(687,2,1466423675,'quiz','subnet_adv','1',NULL),(688,2,1466423676,'quiz','delay1','0',NULL),(689,2,1466423676,'quiz','delay1_adv','1',NULL),(690,2,1466423676,'quiz','delay2','0',NULL),(691,2,1466423676,'quiz','delay2_adv','1',NULL),(692,2,1466423676,'quiz','browsersecurity','-',NULL),(693,2,1466423676,'quiz','browsersecurity_adv','1',NULL),(694,2,1466423676,'quiz','initialnumfeedbacks','2',NULL),(695,2,1466423676,'quiz','autosaveperiod','60',NULL),(696,2,1466423676,'resource','framesize','130',NULL),(697,2,1466423676,'resource','displayoptions','0,1,4,5,6',NULL),(698,2,1466423676,'resource','printintro','1',NULL),(699,2,1466423676,'resource','display','0',NULL),(700,2,1466423677,'resource','showsize','0',NULL),(701,2,1466423677,'resource','showtype','0',NULL),(702,2,1466423677,'resource','showdate','0',NULL),(703,2,1466423677,'resource','popupwidth','620',NULL),(704,2,1466423677,'resource','popupheight','450',NULL),(705,2,1466423677,'resource','filterfiles','0',NULL),(706,2,1466423677,'scorm','displaycoursestructure','0',NULL),(707,2,1466423677,'scorm','displaycoursestructure_adv','',NULL),(708,2,1466423677,'scorm','popup','0',NULL),(709,2,1466423677,'scorm','popup_adv','',NULL),(710,2,1466423677,'scorm','displayactivityname','1',NULL),(711,2,1466423677,'scorm','framewidth','100',NULL),(712,2,1466423677,'scorm','framewidth_adv','1',NULL),(713,2,1466423677,'scorm','frameheight','500',NULL),(714,2,1466423677,'scorm','frameheight_adv','1',NULL),(715,2,1466423677,'scorm','winoptgrp_adv','1',NULL),(716,2,1466423677,'scorm','scrollbars','0',NULL),(717,2,1466423677,'scorm','directories','0',NULL),(718,2,1466423677,'scorm','location','0',NULL),(719,2,1466423678,'scorm','menubar','0',NULL),(720,2,1466423678,'scorm','toolbar','0',NULL),(721,2,1466423678,'scorm','status','0',NULL),(722,2,1466423678,'scorm','skipview','0',NULL),(723,2,1466423678,'scorm','skipview_adv','1',NULL),(724,2,1466423678,'scorm','hidebrowse','0',NULL),(725,2,1466423678,'scorm','hidebrowse_adv','1',NULL),(726,2,1466423678,'scorm','hidetoc','0',NULL),(727,2,1466423678,'scorm','hidetoc_adv','1',NULL),(728,2,1466423678,'scorm','nav','1',NULL),(729,2,1466423678,'scorm','nav_adv','1',NULL),(730,2,1466423678,'scorm','navpositionleft','-100',NULL),(731,2,1466423678,'scorm','navpositionleft_adv','1',NULL),(732,2,1466423678,'scorm','navpositiontop','-100',NULL),(733,2,1466423678,'scorm','navpositiontop_adv','1',NULL),(734,2,1466423678,'scorm','collapsetocwinsize','767',NULL),(735,2,1466423678,'scorm','collapsetocwinsize_adv','1',NULL),(736,2,1466423679,'scorm','displayattemptstatus','1',NULL),(737,2,1466423679,'scorm','displayattemptstatus_adv','',NULL),(738,2,1466423679,'scorm','grademethod','1',NULL),(739,2,1466423679,'scorm','maxgrade','100',NULL),(740,2,1466423679,'scorm','maxattempt','0',NULL),(741,2,1466423679,'scorm','whatgrade','0',NULL),(742,2,1466423679,'scorm','forcecompleted','0',NULL),(743,2,1466423679,'scorm','forcenewattempt','0',NULL),(744,2,1466423679,'scorm','autocommit','0',NULL),(745,2,1466423679,'scorm','masteryoverride','1',NULL),(746,2,1466423679,'scorm','lastattemptlock','0',NULL),(747,2,1466423679,'scorm','auto','0',NULL),(748,2,1466423679,'scorm','updatefreq','0',NULL),(749,2,1466423680,'scorm','scorm12standard','1',NULL),(750,2,1466423680,'scorm','allowtypeexternal','0',NULL),(751,2,1466423680,'scorm','allowtypelocalsync','0',NULL),(752,2,1466423680,'scorm','allowtypeexternalaicc','0',NULL),(753,2,1466423680,'scorm','allowaicchacp','0',NULL),(754,2,1466423680,'scorm','aicchacptimeout','30',NULL),(755,2,1466423680,'scorm','aicchacpkeepsessiondata','1',NULL),(756,2,1466423680,'scorm','aiccuserid','1',NULL),(757,2,1466423680,'scorm','forcejavascript','1',NULL),(758,2,1466423680,'scorm','allowapidebug','0',NULL),(759,2,1466423680,'scorm','apidebugmask','.*',NULL),(760,2,1466423680,'scorm','protectpackagedownloads','0',NULL),(761,2,1466423680,'url','framesize','130',NULL),(762,2,1466423680,'url','secretphrase','',NULL),(763,2,1466423680,'url','rolesinparams','0',NULL),(764,2,1466423681,'url','displayoptions','0,1,5,6',NULL),(765,2,1466423681,'url','printintro','1',NULL),(766,2,1466423681,'url','display','0',NULL),(767,2,1466423681,'url','popupwidth','620',NULL),(768,2,1466423681,'url','popupheight','450',NULL),(769,2,1466423681,'workshop','grade','80',NULL),(770,2,1466423681,'workshop','gradinggrade','20',NULL),(771,2,1466423681,'workshop','gradedecimals','0',NULL),(772,2,1466423681,'workshop','maxbytes','0',NULL),(773,2,1466423681,'workshop','strategy','accumulative',NULL),(774,2,1466423681,'workshop','examplesmode','0',NULL),(775,2,1466423681,'workshopallocation_random','numofreviews','5',NULL),(776,2,1466423681,'workshopform_numerrors','grade0','No',NULL),(777,2,1466423681,'workshopform_numerrors','grade1','Yes',NULL),(778,2,1466423681,'workshopeval_best','comparison','5',NULL),(779,2,1466423681,'tool_recyclebin','coursebinenable','1',NULL),(780,2,1466423681,'tool_recyclebin','coursebinexpiry','604800',NULL),(781,2,1466423681,'tool_recyclebin','categorybinenable','1',NULL),(782,2,1466423681,'tool_recyclebin','categorybinexpiry','604800',NULL),(783,2,1466423682,'tool_recyclebin','autohide','1',NULL),(784,2,1466423682,'antivirus_clamav','pathtoclam','',NULL),(785,2,1466423682,'antivirus_clamav','quarantinedir','',NULL),(786,2,1466423682,'antivirus_clamav','clamfailureonupload','donothing',NULL),(787,2,1466423682,NULL,'block_course_list_adminview','all',NULL),(788,2,1466423682,NULL,'block_course_list_hideallcourseslink','0',NULL),(789,2,1466423682,'block_course_overview','defaultmaxcourses','10',NULL),(790,2,1466423682,'block_course_overview','forcedefaultmaxcourses','0',NULL),(791,2,1466423682,'block_course_overview','showchildren','0',NULL),(792,2,1466423682,'block_course_overview','showwelcomearea','0',NULL),(793,2,1466423682,'block_course_overview','showcategories','0',NULL),(794,2,1466423682,NULL,'block_html_allowcssclasses','0',NULL),(795,2,1466423682,NULL,'block_online_users_timetosee','5',NULL),(796,2,1466423682,NULL,'block_rss_client_num_entries','5',NULL),(797,2,1466423682,NULL,'block_rss_client_timeout','30',NULL),(798,2,1466423682,'block_section_links','numsections1','22',NULL),(799,2,1466423682,'block_section_links','incby1','2',NULL),(800,2,1466423683,'block_section_links','numsections2','40',NULL),(801,2,1466423683,'block_section_links','incby2','5',NULL),(802,2,1466423683,'block_tag_youtube','apikey','',NULL),(803,2,1466423683,'format_singleactivity','activitytype','forum',NULL),(804,2,1466423683,'enrol_cohort','roleid','5',NULL),(805,2,1466423683,'enrol_cohort','unenrolaction','0',NULL),(806,2,1466423683,'enrol_database','dbtype','',NULL),(807,2,1466423683,'enrol_database','dbhost','localhost',NULL),(808,2,1466423683,'enrol_database','dbuser','',NULL),(809,2,1466423683,'enrol_database','dbpass','',NULL),(810,2,1466423683,'enrol_database','dbname','',NULL),(811,2,1466423683,'enrol_database','dbencoding','utf-8',NULL),(812,2,1466423683,'enrol_database','dbsetupsql','',NULL),(813,2,1466423683,'enrol_database','dbsybasequoting','0',NULL),(814,2,1466423683,'enrol_database','debugdb','0',NULL),(815,2,1466423683,'enrol_database','localcoursefield','idnumber',NULL),(816,2,1466423683,'enrol_database','localuserfield','idnumber',NULL),(817,2,1466423684,'enrol_database','localrolefield','shortname',NULL),(818,2,1466423684,'enrol_database','localcategoryfield','id',NULL),(819,2,1466423684,'enrol_database','remoteenroltable','',NULL),(820,2,1466423684,'enrol_database','remotecoursefield','',NULL),(821,2,1466423684,'enrol_database','remoteuserfield','',NULL),(822,2,1466423684,'enrol_database','remoterolefield','',NULL),(823,2,1466423684,'enrol_database','remoteotheruserfield','',NULL),(824,2,1466423684,'enrol_database','defaultrole','5',NULL),(825,2,1466423684,'enrol_database','ignorehiddencourses','0',NULL),(826,2,1466423684,'enrol_database','unenrolaction','0',NULL),(827,2,1466423684,'enrol_database','newcoursetable','',NULL),(828,2,1466423684,'enrol_database','newcoursefullname','fullname',NULL),(829,2,1466423684,'enrol_database','newcourseshortname','shortname',NULL),(830,2,1466423684,'enrol_database','newcourseidnumber','idnumber',NULL),(831,2,1466423684,'enrol_database','newcoursecategory','',NULL),(832,2,1466423684,'enrol_database','defaultcategory','1',NULL),(833,2,1466423684,'enrol_database','templatecourse','',NULL),(834,2,1466423684,'enrol_flatfile','location','',NULL),(835,2,1466423684,'enrol_flatfile','encoding','UTF-8',NULL),(836,2,1466423684,'enrol_flatfile','mailstudents','0',NULL),(837,2,1466423684,'enrol_flatfile','mailteachers','0',NULL),(838,2,1466423684,'enrol_flatfile','mailadmins','0',NULL),(839,2,1466423684,'enrol_flatfile','unenrolaction','3',NULL),(840,2,1466423684,'enrol_flatfile','expiredaction','3',NULL),(841,2,1466423684,'enrol_guest','requirepassword','0',NULL),(842,2,1466423684,'enrol_guest','usepasswordpolicy','0',NULL),(843,2,1466423684,'enrol_guest','showhint','0',NULL),(844,2,1466423684,'enrol_guest','defaultenrol','1',NULL),(845,2,1466423685,'enrol_guest','status','1',NULL),(846,2,1466423685,'enrol_guest','status_adv','',NULL),(847,2,1466423685,'enrol_imsenterprise','imsfilelocation','',NULL),(848,2,1466423685,'enrol_imsenterprise','logtolocation','',NULL),(849,2,1466423685,'enrol_imsenterprise','mailadmins','0',NULL),(850,2,1466423685,'enrol_imsenterprise','createnewusers','0',NULL),(851,2,1466423685,'enrol_imsenterprise','imsdeleteusers','0',NULL),(852,2,1466423685,'enrol_imsenterprise','fixcaseusernames','0',NULL),(853,2,1466423685,'enrol_imsenterprise','fixcasepersonalnames','0',NULL),(854,2,1466423685,'enrol_imsenterprise','imssourcedidfallback','0',NULL),(855,2,1466423685,'enrol_imsenterprise','imsrolemap01','5',NULL),(856,2,1466423685,'enrol_imsenterprise','imsrolemap02','3',NULL),(857,2,1466423685,'enrol_imsenterprise','imsrolemap03','3',NULL),(858,2,1466423685,'enrol_imsenterprise','imsrolemap04','5',NULL),(859,2,1466423685,'enrol_imsenterprise','imsrolemap05','0',NULL),(860,2,1466423685,'enrol_imsenterprise','imsrolemap06','4',NULL),(861,2,1466423685,'enrol_imsenterprise','imsrolemap07','0',NULL),(862,2,1466423685,'enrol_imsenterprise','imsrolemap08','4',NULL),(863,2,1466423685,'enrol_imsenterprise','truncatecoursecodes','0',NULL),(864,2,1466423686,'enrol_imsenterprise','createnewcourses','0',NULL),(865,2,1466423686,'enrol_imsenterprise','createnewcategories','0',NULL),(866,2,1466423686,'enrol_imsenterprise','imsunenrol','0',NULL),(867,2,1466423686,'enrol_imsenterprise','imscoursemapshortname','coursecode',NULL),(868,2,1466423686,'enrol_imsenterprise','imscoursemapfullname','short',NULL),(869,2,1466423686,'enrol_imsenterprise','imscoursemapsummary','ignore',NULL),(870,2,1466423686,'enrol_imsenterprise','imsrestricttarget','',NULL),(871,2,1466423686,'enrol_imsenterprise','imscapitafix','0',NULL),(872,2,1466423686,'enrol_ldap','host_url','',NULL),(873,2,1466423687,'enrol_ldap','start_tls','0',NULL),(874,2,1466423687,'enrol_ldap','ldap_version','3',NULL),(875,2,1466423687,'enrol_ldap','ldapencoding','utf-8',NULL),(876,2,1466423687,'enrol_ldap','pagesize','250',NULL),(877,2,1466423687,'enrol_ldap','bind_dn','',NULL),(878,2,1466423687,'enrol_ldap','bind_pw','',NULL),(879,2,1466423687,'enrol_ldap','course_search_sub','0',NULL),(880,2,1466423687,'enrol_ldap','memberattribute_isdn','0',NULL),(881,2,1466423687,'enrol_ldap','user_contexts','',NULL),(882,2,1466423687,'enrol_ldap','user_search_sub','0',NULL),(883,2,1466423687,'enrol_ldap','user_type','default',NULL),(884,2,1466423687,'enrol_ldap','opt_deref','0',NULL),(885,2,1466423687,'enrol_ldap','idnumber_attribute','',NULL),(886,2,1466423687,'enrol_ldap','objectclass','',NULL),(887,2,1466423687,'enrol_ldap','course_idnumber','',NULL),(888,2,1466423688,'enrol_ldap','course_shortname','',NULL),(889,2,1466423688,'enrol_ldap','course_fullname','',NULL),(890,2,1466423688,'enrol_ldap','course_summary','',NULL),(891,2,1466423688,'enrol_ldap','ignorehiddencourses','0',NULL),(892,2,1466423688,'enrol_ldap','unenrolaction','0',NULL),(893,2,1466423688,'enrol_ldap','autocreate','0',NULL),(894,2,1466423688,'enrol_ldap','category','1',NULL),(895,2,1466423688,'enrol_ldap','template','',NULL),(896,2,1466423688,'enrol_ldap','course_shortname_updateonsync','0',NULL),(897,2,1466423688,'enrol_ldap','course_fullname_updateonsync','0',NULL),(898,2,1466423688,'enrol_ldap','course_summary_updateonsync','0',NULL),(899,2,1466423688,'enrol_ldap','nested_groups','0',NULL),(900,2,1466423688,'enrol_ldap','group_memberofattribute','',NULL),(901,2,1466423688,'enrol_lti','emaildisplay','2',NULL),(902,2,1466423688,'enrol_lti','city','',NULL),(903,2,1466423689,'enrol_lti','country','',NULL),(904,2,1466423689,'enrol_lti','timezone','99',NULL),(905,2,1466423689,'enrol_lti','lang','en',NULL),(906,2,1466423689,'enrol_lti','institution','',NULL),(907,2,1466423689,'enrol_manual','expiredaction','1',NULL),(908,2,1466423689,'enrol_manual','expirynotifyhour','6',NULL),(909,2,1466423689,'enrol_manual','defaultenrol','1',NULL),(910,2,1466423689,'enrol_manual','status','0',NULL),(911,2,1466423689,'enrol_manual','roleid','5',NULL),(912,2,1466423689,'enrol_manual','enrolstart','4',NULL),(913,2,1466423689,'enrol_manual','enrolperiod','0',NULL),(914,2,1466423689,'enrol_manual','expirynotify','0',NULL),(915,2,1466423689,'enrol_manual','expirythreshold','86400',NULL),(916,2,1466423689,'enrol_meta','nosyncroleids','',NULL),(917,2,1466423690,'enrol_meta','syncall','1',NULL),(918,2,1466423690,'enrol_meta','unenrolaction','3',NULL),(919,2,1466423690,'enrol_meta','coursesort','sortorder',NULL),(920,2,1466423690,'enrol_mnet','roleid','5',NULL),(921,2,1466423690,'enrol_mnet','roleid_adv','1',NULL),(922,2,1466423690,'enrol_paypal','paypalbusiness','',NULL),(923,2,1466423690,'enrol_paypal','mailstudents','0',NULL),(924,2,1466423690,'enrol_paypal','mailteachers','0',NULL),(925,2,1466423690,'enrol_paypal','mailadmins','0',NULL),(926,2,1466423690,'enrol_paypal','expiredaction','3',NULL),(927,2,1466423690,'enrol_paypal','status','1',NULL),(928,2,1466423690,'enrol_paypal','cost','0',NULL),(929,2,1466423690,'enrol_paypal','currency','USD',NULL),(930,2,1466423690,'enrol_paypal','roleid','5',NULL),(931,2,1466423690,'enrol_paypal','enrolperiod','0',NULL),(932,2,1466423690,'enrol_self','requirepassword','0',NULL),(933,2,1466423691,'enrol_self','usepasswordpolicy','0',NULL),(934,2,1466423691,'enrol_self','showhint','0',NULL),(935,2,1466423691,'enrol_self','expiredaction','1',NULL),(936,2,1466423691,'enrol_self','expirynotifyhour','6',NULL),(937,2,1466423691,'enrol_self','defaultenrol','1',NULL),(938,2,1466423691,'enrol_self','status','1',NULL),(939,2,1466423691,'enrol_self','newenrols','1',NULL),(940,2,1466423691,'enrol_self','groupkey','0',NULL),(941,2,1466423691,'enrol_self','roleid','5',NULL),(942,2,1466423691,'enrol_self','enrolperiod','0',NULL),(943,2,1466423691,'enrol_self','expirynotify','0',NULL),(944,2,1466423691,'enrol_self','expirythreshold','86400',NULL),(945,2,1466423691,'enrol_self','longtimenosee','0',NULL),(946,2,1466423691,'enrol_self','maxenrolled','0',NULL),(947,2,1466423691,'enrol_self','sendcoursewelcomemessage','1',NULL),(948,2,1466423691,NULL,'filter_censor_badwords','',NULL),(949,2,1466423691,'filter_emoticon','formats','1,4,0',NULL),(950,2,1466423691,'filter_mathjaxloader','httpurl','http://cdn.mathjax.org/mathjax/2.6-latest/MathJax.js',NULL),(951,2,1466423691,'filter_mathjaxloader','httpsurl','https://cdn.mathjax.org/mathjax/2.6-latest/MathJax.js',NULL),(952,2,1466423691,'filter_mathjaxloader','texfiltercompatibility','0',NULL),(953,2,1466423691,'filter_mathjaxloader','mathjaxconfig','\nMathJax.Hub.Config({\n    config: [\"Accessible.js\", \"Safe.js\"],\n    errorSettings: { message: [\"!\"] },\n    skipStartupTypeset: true,\n    messageStyle: \"none\"\n});\n',NULL),(954,2,1466423691,'filter_mathjaxloader','additionaldelimiters','',NULL),(955,2,1466423691,NULL,'filter_multilang_force_old','0',NULL),(956,2,1466423691,'filter_tex','latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n',NULL),(957,2,1466423691,'filter_tex','latexbackground','#FFFFFF',NULL),(958,2,1466423692,'filter_tex','density','120',NULL),(959,2,1466423692,'filter_tex','pathlatex','/usr/bin/latex',NULL),(960,2,1466423692,'filter_tex','pathdvips','/usr/bin/dvips',NULL),(961,2,1466423692,'filter_tex','pathconvert','/usr/bin/convert',NULL),(962,2,1466423692,'filter_tex','pathdvisvgm','/usr/bin/dvisvgm',NULL),(963,2,1466423692,'filter_tex','pathmimetex','',NULL),(964,2,1466423692,'filter_tex','convertformat','gif',NULL),(965,2,1466423692,'filter_urltolink','formats','0',NULL),(966,2,1466423692,'filter_urltolink','embedimages','1',NULL),(967,2,1466423692,'logstore_database','dbdriver','',NULL),(968,2,1466423692,'logstore_database','dbhost','',NULL),(969,2,1466423692,'logstore_database','dbuser','',NULL),(970,2,1466423692,'logstore_database','dbpass','',NULL),(971,2,1466423692,'logstore_database','dbname','',NULL),(972,2,1466423692,'logstore_database','dbtable','',NULL),(973,2,1466423692,'logstore_database','dbpersist','0',NULL),(974,2,1466423692,'logstore_database','dbsocket','',NULL),(975,2,1466423693,'logstore_database','dbport','',NULL),(976,2,1466423693,'logstore_database','dbschema','',NULL),(977,2,1466423693,'logstore_database','dbcollation','',NULL),(978,2,1466423693,'logstore_database','buffersize','50',NULL),(979,2,1466423693,'logstore_database','logguests','0',NULL),(980,2,1466423693,'logstore_database','includelevels','1,2,0',NULL),(981,2,1466423693,'logstore_database','includeactions','c,r,u,d',NULL),(982,2,1466423693,'logstore_legacy','loglegacy','0',NULL),(983,2,1466423693,NULL,'logguests','1',NULL),(984,2,1466423693,NULL,'loglifetime','0',NULL),(985,2,1466423693,'logstore_standard','logguests','1',NULL),(986,2,1466423693,'logstore_standard','loglifetime','0',NULL),(987,2,1466423693,'logstore_standard','buffersize','50',NULL),(988,2,1466423693,NULL,'airnotifierurl','https://messages.moodle.net',NULL),(989,2,1466423693,NULL,'airnotifierport','443',NULL),(990,2,1466423694,NULL,'airnotifiermobileappname','com.moodle.moodlemobile',NULL),(991,2,1466423694,NULL,'airnotifierappname','commoodlemoodlemobile',NULL),(992,2,1466423694,NULL,'airnotifieraccesskey','',NULL),(993,2,1466423694,NULL,'smtphosts','',NULL),(994,2,1466423694,NULL,'smtpsecure','',NULL),(995,2,1466423694,NULL,'smtpauthtype','LOGIN',NULL),(996,2,1466423694,NULL,'smtpuser','',NULL),(997,2,1466423694,NULL,'smtppass','',NULL),(998,2,1466423694,NULL,'smtpmaxbulk','1',NULL),(999,2,1466423694,NULL,'noreplyaddress','noreply@dan.local',NULL),(1000,2,1466423694,NULL,'emailonlyfromnoreplyaddress','0',NULL),(1001,2,1466423694,NULL,'sitemailcharset','0',NULL),(1002,2,1466423694,NULL,'allowusermailcharset','0',NULL),(1003,2,1466423694,NULL,'allowattachments','1',NULL),(1004,2,1466423694,NULL,'mailnewline','LF',NULL),(1005,2,1466423694,NULL,'jabberhost','',NULL),(1006,2,1466423694,NULL,'jabberserver','',NULL),(1007,2,1466423694,NULL,'jabberusername','',NULL),(1008,2,1466423694,NULL,'jabberpassword','',NULL),(1009,2,1466423695,NULL,'jabberport','5222',NULL),(1010,2,1466423695,'search_solr','server_hostname','127.0.0.1',NULL),(1011,2,1466423695,'search_solr','indexname','',NULL),(1012,2,1466423695,'search_solr','secure','0',NULL),(1013,2,1466423695,'search_solr','server_port','8983',NULL),(1014,2,1466423695,'search_solr','server_username','',NULL),(1015,2,1466423695,'search_solr','server_password','',NULL),(1016,2,1466423695,'search_solr','server_timeout','30',NULL),(1017,2,1466423695,'search_solr','ssl_cert','',NULL),(1018,2,1466423695,'search_solr','ssl_key','',NULL),(1019,2,1466423695,'search_solr','ssl_keypassword','',NULL),(1020,2,1466423695,'search_solr','ssl_cainfo','',NULL),(1021,2,1466423695,'search_solr','ssl_capath','',NULL),(1022,2,1466423695,'search_solr','fileindexing','1',NULL),(1023,2,1466423695,'search_solr','maxindexfilekb','2097152',NULL),(1024,2,1466423695,'editor_atto','toolbar','collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html',NULL),(1025,2,1466423695,'editor_atto','autosavefrequency','60',NULL),(1026,2,1466423695,'atto_collapse','showgroups','5',NULL),(1027,2,1466423695,'atto_equation','librarygroup1','\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n',NULL),(1028,2,1466423695,'atto_equation','librarygroup2','\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n',NULL),(1029,2,1466423695,'atto_equation','librarygroup3','\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n',NULL),(1030,2,1466423696,'atto_equation','librarygroup4','\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n',NULL),(1031,2,1466423696,'atto_table','allowborders','0',NULL),(1032,2,1466423696,'atto_table','allowbackgroundcolour','0',NULL),(1033,2,1466423696,'atto_table','allowwidth','0',NULL),(1034,2,1466423696,'editor_tinymce','customtoolbar','wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen',NULL),(1035,2,1466423696,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings',NULL),(1036,2,1466423696,'editor_tinymce','customconfig','',NULL),(1037,2,1466423696,'tinymce_moodleemoticon','requireemoticon','1',NULL),(1038,2,1466423696,'tinymce_spellchecker','spellengine','',NULL),(1039,2,1466423696,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv',NULL),(1040,2,1466423696,NULL,'enablemobilewebservice','0',NULL),(1041,2,1466423696,NULL,'profileroles','5,4,3',NULL),(1042,2,1466423696,NULL,'calendar_exportsalt','Q12PjvuN0hcZpJdEG817VPlRd9ABTkI2XbbRdGuZf5Q08aFOSTvakuwsrHUU','vFyokMfpDYQwpCFarqcGMEAJ4FUErqBlQRB2lMdYGQwN0qCvzO8FSr51elgx'),(1043,2,1466423696,NULL,'coursecontact','3',NULL),(1044,2,1466423696,NULL,'frontpage','6',NULL),(1045,2,1466423696,NULL,'frontpageloggedin','6',NULL),(1046,2,1466423697,NULL,'maxcategorydepth','2',NULL),(1047,2,1466423697,NULL,'frontpagecourselimit','200',NULL),(1048,2,1466423697,NULL,'commentsperpage','15',NULL),(1049,2,1466423697,NULL,'defaultfrontpageroleid','8',NULL),(1050,2,1466423697,NULL,'messageinbound_enabled','0',NULL),(1051,2,1466423698,NULL,'messageinbound_mailbox','',NULL),(1052,2,1466423698,NULL,'messageinbound_domain','',NULL),(1053,2,1466423698,NULL,'messageinbound_host','',NULL),(1054,2,1466423698,NULL,'messageinbound_hostssl','ssl',NULL),(1055,2,1466423698,NULL,'messageinbound_hostuser','',NULL),(1056,2,1466423698,NULL,'messageinbound_hostpass','',NULL),(1057,2,1466423703,NULL,'calendar_exportsalt','kx39SCjFuduxf4psaQVjtfwmo0RgeVDrMYEFO0oRVGPJwnTK3RkyFyqWOEda','Q12PjvuN0hcZpJdEG817VPlRd9ABTkI2XbbRdGuZf5Q08aFOSTvakuwsrHUU');
/*!40000 ALTER TABLE `mdl_config_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_plugins`
--

DROP TABLE IF EXISTS `mdl_config_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1305 DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_plugins`
--

LOCK TABLES `mdl_config_plugins` WRITE;
/*!40000 ALTER TABLE `mdl_config_plugins` DISABLE KEYS */;
INSERT INTO `mdl_config_plugins` VALUES (1,'question','multichoice_sortorder','1'),(2,'question','truefalse_sortorder','2'),(3,'question','match_sortorder','3'),(4,'question','shortanswer_sortorder','4'),(5,'question','numerical_sortorder','5'),(6,'question','essay_sortorder','6'),(7,'moodlecourse','visible','1'),(8,'moodlecourse','format','weeks'),(9,'moodlecourse','maxsections','52'),(10,'moodlecourse','numsections','10'),(11,'moodlecourse','hiddensections','0'),(12,'moodlecourse','coursedisplay','0'),(13,'moodlecourse','lang',''),(14,'moodlecourse','newsitems','5'),(15,'moodlecourse','showgrades','1'),(16,'moodlecourse','showreports','0'),(17,'moodlecourse','maxbytes','0'),(18,'moodlecourse','enablecompletion','0'),(19,'moodlecourse','groupmode','0'),(20,'moodlecourse','groupmodeforce','0'),(21,'backup','loglifetime','30'),(22,'backup','backup_general_users','1'),(23,'backup','backup_general_users_locked',''),(24,'backup','backup_general_anonymize','0'),(25,'backup','backup_general_anonymize_locked',''),(26,'backup','backup_general_role_assignments','1'),(27,'backup','backup_general_role_assignments_locked',''),(28,'backup','backup_general_activities','1'),(29,'backup','backup_general_activities_locked',''),(30,'backup','backup_general_blocks','1'),(31,'backup','backup_general_blocks_locked',''),(32,'backup','backup_general_filters','1'),(33,'backup','backup_general_filters_locked',''),(34,'backup','backup_general_comments','1'),(35,'backup','backup_general_comments_locked',''),(36,'backup','backup_general_badges','1'),(37,'backup','backup_general_badges_locked',''),(38,'backup','backup_general_userscompletion','1'),(39,'backup','backup_general_userscompletion_locked',''),(40,'backup','backup_general_logs','0'),(41,'backup','backup_general_logs_locked',''),(42,'backup','backup_general_histories','0'),(43,'backup','backup_general_histories_locked',''),(44,'backup','backup_general_questionbank','1'),(45,'backup','backup_general_questionbank_locked',''),(46,'backup','backup_general_groups','1'),(47,'backup','backup_general_groups_locked',''),(48,'backup','import_general_maxresults','10'),(49,'backup','import_general_duplicate_admin_allowed','0'),(50,'backup','backup_auto_active','0'),(51,'backup','backup_auto_weekdays','0000000'),(52,'backup','backup_auto_hour','0'),(53,'backup','backup_auto_minute','0'),(54,'backup','backup_auto_storage','0'),(55,'backup','backup_auto_destination',''),(56,'backup','backup_auto_max_kept','1'),(57,'backup','backup_auto_delete_days','0'),(58,'backup','backup_auto_min_kept','0'),(59,'backup','backup_shortname','0'),(60,'backup','backup_auto_skip_hidden','1'),(61,'backup','backup_auto_skip_modif_days','30'),(62,'backup','backup_auto_skip_modif_prev','0'),(63,'backup','backup_auto_users','1'),(64,'backup','backup_auto_role_assignments','1'),(65,'backup','backup_auto_activities','1'),(66,'backup','backup_auto_blocks','1'),(67,'backup','backup_auto_filters','1'),(68,'backup','backup_auto_comments','1'),(69,'backup','backup_auto_badges','1'),(70,'backup','backup_auto_userscompletion','1'),(71,'backup','backup_auto_logs','0'),(72,'backup','backup_auto_histories','0'),(73,'backup','backup_auto_questionbank','1'),(74,'backup','backup_auto_groups','1'),(75,'core_competency','enabled','1'),(76,'core_competency','pushcourseratingstouserplans','1'),(77,'cachestore_memcache','testservers',''),(78,'cachestore_memcached','testservers',''),(79,'cachestore_mongodb','testserver',''),(80,'question_preview','behaviour','deferredfeedback'),(81,'question_preview','correctness','1'),(82,'question_preview','marks','2'),(83,'question_preview','markdp','2'),(84,'question_preview','feedback','1'),(85,'question_preview','generalfeedback','1'),(86,'question_preview','rightanswer','1'),(87,'question_preview','history','0'),(88,'mod_assign','search_activity_enabled','1'),(89,'mod_book','search_activity_enabled','1'),(90,'mod_book','search_chapter_enabled','1'),(91,'mod_chat','search_activity_enabled','1'),(92,'mod_choice','search_activity_enabled','1'),(93,'mod_data','search_activity_enabled','1'),(94,'mod_feedback','search_activity_enabled','1'),(95,'mod_folder','search_activity_enabled','1'),(96,'mod_forum','search_activity_enabled','1'),(97,'mod_forum','search_post_enabled','1'),(98,'mod_glossary','search_activity_enabled','1'),(99,'mod_glossary','search_entry_enabled','1'),(100,'mod_imscp','search_activity_enabled','1'),(101,'mod_label','search_activity_enabled','1'),(102,'mod_lesson','search_activity_enabled','1'),(103,'mod_lti','search_activity_enabled','1'),(104,'mod_page','search_activity_enabled','1'),(105,'mod_quiz','search_activity_enabled','1'),(106,'mod_resource','search_activity_enabled','1'),(107,'mod_scorm','search_activity_enabled','1'),(108,'mod_survey','search_activity_enabled','1'),(109,'mod_url','search_activity_enabled','1'),(110,'mod_wiki','search_activity_enabled','1'),(111,'mod_wiki','search_collaborative_page_enabled','1'),(112,'mod_workshop','search_activity_enabled','1'),(113,'core_search','core_course_mycourse_enabled','1'),(114,'theme_clean','invert','0'),(115,'theme_clean','logo',''),(116,'theme_clean','smalllogo',''),(117,'theme_clean','sitename','1'),(118,'theme_clean','customcss',''),(119,'theme_clean','footnote',''),(120,'theme_more','textcolor','#333366'),(121,'theme_more','linkcolor','#FF6500'),(122,'theme_more','bodybackground',''),(123,'theme_more','backgroundimage',''),(124,'theme_more','backgroundrepeat','repeat'),(125,'theme_more','backgroundposition','0'),(126,'theme_more','backgroundfixed','0'),(127,'theme_more','contentbackground','#FFFFFF'),(128,'theme_more','secondarybackground','#FFFFFF'),(129,'theme_more','invert','1'),(130,'theme_more','logo',''),(131,'theme_more','smalllogo',''),(132,'theme_more','sitename','1'),(133,'theme_more','customcss',''),(134,'theme_more','footnote',''),(135,'antivirus_clamav','version','2016052300'),(136,'availability_completion','version','2016052300'),(137,'availability_date','version','2016052300'),(138,'availability_grade','version','2016052300'),(139,'availability_group','version','2016052300'),(140,'availability_grouping','version','2016052300'),(141,'availability_profile','version','2016052300'),(142,'qtype_calculated','version','2016052300'),(143,'qtype_calculatedmulti','version','2016052300'),(144,'qtype_calculatedsimple','version','2016052300'),(145,'qtype_ddimageortext','version','2016052300'),(146,'qtype_ddmarker','version','2016052300'),(147,'qtype_ddwtos','version','2016052300'),(148,'qtype_description','version','2016052300'),(149,'qtype_essay','version','2016052300'),(150,'qtype_gapselect','version','2016052300'),(151,'qtype_match','version','2016052300'),(152,'qtype_missingtype','version','2016052300'),(153,'qtype_multianswer','version','2016052300'),(154,'qtype_multichoice','version','2016052300'),(155,'qtype_numerical','version','2016052300'),(156,'qtype_random','version','2016052300'),(157,'qtype_randomsamatch','version','2016052300'),(158,'qtype_shortanswer','version','2016052300'),(159,'qtype_truefalse','version','2016052300'),(160,'mod_assign','version','2016052300'),(161,'mod_assignment','version','2016052300'),(163,'mod_book','version','2016052300'),(164,'mod_chat','version','2016052300'),(165,'mod_choice','version','2016052300'),(166,'mod_data','version','2016052300'),(167,'mod_feedback','version','2016052300'),(169,'mod_folder','version','2016052300'),(171,'mod_forum','version','2016052300'),(172,'mod_glossary','version','2016052300'),(173,'mod_imscp','version','2016052300'),(175,'mod_label','version','2016052300'),(176,'mod_lesson','version','2016052300'),(177,'mod_lti','version','2016052300'),(178,'mod_page','version','2016052300'),(180,'mod_quiz','version','2016052300'),(181,'mod_resource','version','2016052300'),(182,'mod_scorm','version','2016052300'),(183,'mod_survey','version','2016052300'),(185,'mod_url','version','2016052300'),(187,'mod_wiki','version','2016052300'),(189,'mod_workshop','version','2016052300'),(190,'auth_cas','version','2016052300'),(192,'auth_db','version','2016052300'),(194,'auth_email','version','2016052300'),(195,'auth_fc','version','2016052300'),(197,'auth_imap','version','2016052300'),(199,'auth_ldap','version','2016052300'),(201,'auth_lti','version','2016052300'),(202,'auth_manual','version','2016052300'),(203,'auth_mnet','version','2016052300'),(205,'auth_nntp','version','2016052300'),(207,'auth_nologin','version','2016052300'),(208,'auth_none','version','2016052300'),(209,'auth_pam','version','2016052300'),(211,'auth_pop3','version','2016052300'),(213,'auth_radius','version','2016052300'),(215,'auth_shibboleth','version','2016052300'),(217,'auth_webservice','version','2016052300'),(218,'calendartype_gregorian','version','2016052300'),(219,'enrol_category','version','2016052300'),(221,'enrol_cohort','version','2016052300'),(222,'enrol_database','version','2016052300'),(224,'enrol_flatfile','version','2016052300'),(226,'enrol_flatfile','map_1','manager'),(227,'enrol_flatfile','map_2','coursecreator'),(228,'enrol_flatfile','map_3','editingteacher'),(229,'enrol_flatfile','map_4','teacher'),(230,'enrol_flatfile','map_5','student'),(231,'enrol_flatfile','map_6','guest'),(232,'enrol_flatfile','map_7','user'),(233,'enrol_flatfile','map_8','frontpage'),(234,'enrol_guest','version','2016052300'),(235,'enrol_imsenterprise','version','2016052300'),(237,'enrol_ldap','version','2016052300'),(239,'enrol_lti','version','2016052300'),(240,'enrol_manual','version','2016052300'),(242,'enrol_meta','version','2016052300'),(244,'enrol_mnet','version','2016052300'),(245,'enrol_paypal','version','2016052300'),(246,'enrol_self','version','2016052300'),(248,'message_airnotifier','version','2016052300'),(250,'message','airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(251,'message','airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(252,'message','airnotifier_provider_enrol_manual_expiry_notification_permitted','permitted'),(253,'message','airnotifier_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(254,'message','airnotifier_provider_enrol_self_expiry_notification_permitted','permitted'),(255,'message','airnotifier_provider_mod_assign_assign_notification_permitted','permitted'),(256,'message','airnotifier_provider_mod_assignment_assignment_updates_permitted','permitted'),(257,'message','airnotifier_provider_mod_feedback_submission_permitted','permitted'),(258,'message','airnotifier_provider_mod_feedback_message_permitted','permitted'),(259,'message','airnotifier_provider_mod_forum_posts_permitted','permitted'),(260,'message','airnotifier_provider_mod_forum_digests_permitted','permitted'),(261,'message','airnotifier_provider_mod_lesson_graded_essay_permitted','permitted'),(262,'message','airnotifier_provider_mod_quiz_submission_permitted','permitted'),(263,'message','airnotifier_provider_mod_quiz_confirmation_permitted','permitted'),(264,'message','airnotifier_provider_mod_quiz_attempt_overdue_permitted','permitted'),(265,'message','airnotifier_provider_moodle_notices_permitted','permitted'),(266,'message','airnotifier_provider_moodle_errors_permitted','permitted'),(267,'message','airnotifier_provider_moodle_availableupdate_permitted','permitted'),(268,'message','airnotifier_provider_moodle_instantmessage_permitted','permitted'),(269,'message','airnotifier_provider_moodle_backup_permitted','permitted'),(270,'message','airnotifier_provider_moodle_courserequested_permitted','permitted'),(271,'message','airnotifier_provider_moodle_courserequestapproved_permitted','permitted'),(272,'message','airnotifier_provider_moodle_courserequestrejected_permitted','permitted'),(273,'message','airnotifier_provider_moodle_badgerecipientnotice_permitted','permitted'),(274,'message','airnotifier_provider_moodle_badgecreatornotice_permitted','permitted'),(275,'message','airnotifier_provider_moodle_competencyplancomment_permitted','permitted'),(276,'message','airnotifier_provider_moodle_competencyusercompcomment_permitted','permitted'),(277,'message_email','version','2016052300'),(279,'message','email_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(280,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedin','email'),(281,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedoff','email'),(282,'message','email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(283,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin','email'),(284,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff','email'),(285,'message','email_provider_enrol_manual_expiry_notification_permitted','permitted'),(286,'message','message_provider_enrol_manual_expiry_notification_loggedin','email'),(287,'message','message_provider_enrol_manual_expiry_notification_loggedoff','email'),(288,'message','email_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(289,'message','message_provider_enrol_paypal_paypal_enrolment_loggedin','email'),(290,'message','message_provider_enrol_paypal_paypal_enrolment_loggedoff','email'),(291,'message','email_provider_enrol_self_expiry_notification_permitted','permitted'),(292,'message','message_provider_enrol_self_expiry_notification_loggedin','email'),(293,'message','message_provider_enrol_self_expiry_notification_loggedoff','email'),(294,'message','email_provider_mod_assign_assign_notification_permitted','permitted'),(295,'message','message_provider_mod_assign_assign_notification_loggedin','email'),(296,'message','message_provider_mod_assign_assign_notification_loggedoff','email'),(297,'message','email_provider_mod_assignment_assignment_updates_permitted','permitted'),(298,'message','message_provider_mod_assignment_assignment_updates_loggedin','email'),(299,'message','message_provider_mod_assignment_assignment_updates_loggedoff','email'),(300,'message','email_provider_mod_feedback_submission_permitted','permitted'),(301,'message','message_provider_mod_feedback_submission_loggedin','email'),(302,'message','message_provider_mod_feedback_submission_loggedoff','email'),(303,'message','email_provider_mod_feedback_message_permitted','permitted'),(304,'message','message_provider_mod_feedback_message_loggedin','email'),(305,'message','message_provider_mod_feedback_message_loggedoff','email'),(306,'message','email_provider_mod_forum_posts_permitted','permitted'),(307,'message','message_provider_mod_forum_posts_loggedin','email'),(308,'message','message_provider_mod_forum_posts_loggedoff','email'),(309,'message','email_provider_mod_forum_digests_permitted','permitted'),(310,'message','message_provider_mod_forum_digests_loggedin','email'),(311,'message','message_provider_mod_forum_digests_loggedoff','email'),(312,'message','email_provider_mod_lesson_graded_essay_permitted','permitted'),(313,'message','message_provider_mod_lesson_graded_essay_loggedin','email'),(314,'message','message_provider_mod_lesson_graded_essay_loggedoff','email'),(315,'message','email_provider_mod_quiz_submission_permitted','permitted'),(316,'message','message_provider_mod_quiz_submission_loggedin','email'),(317,'message','message_provider_mod_quiz_submission_loggedoff','email'),(318,'message','email_provider_mod_quiz_confirmation_permitted','permitted'),(319,'message','message_provider_mod_quiz_confirmation_loggedin','email'),(320,'message','message_provider_mod_quiz_confirmation_loggedoff','email'),(321,'message','email_provider_mod_quiz_attempt_overdue_permitted','permitted'),(322,'message','message_provider_mod_quiz_attempt_overdue_loggedin','email'),(323,'message','message_provider_mod_quiz_attempt_overdue_loggedoff','email'),(324,'message','email_provider_moodle_notices_permitted','permitted'),(325,'message','message_provider_moodle_notices_loggedin','email'),(326,'message','message_provider_moodle_notices_loggedoff','email'),(327,'message','email_provider_moodle_errors_permitted','permitted'),(328,'message','message_provider_moodle_errors_loggedin','email'),(329,'message','message_provider_moodle_errors_loggedoff','email'),(330,'message','email_provider_moodle_availableupdate_permitted','permitted'),(331,'message','message_provider_moodle_availableupdate_loggedin','email'),(332,'message','message_provider_moodle_availableupdate_loggedoff','email'),(333,'message','email_provider_moodle_instantmessage_permitted','permitted'),(334,'message','message_provider_moodle_instantmessage_loggedoff','popup,email'),(335,'message','email_provider_moodle_backup_permitted','permitted'),(336,'message','message_provider_moodle_backup_loggedin','email'),(337,'message','message_provider_moodle_backup_loggedoff','email'),(338,'message','email_provider_moodle_courserequested_permitted','permitted'),(339,'message','message_provider_moodle_courserequested_loggedin','email'),(340,'message','message_provider_moodle_courserequested_loggedoff','email'),(341,'message','email_provider_moodle_courserequestapproved_permitted','permitted'),(342,'message','message_provider_moodle_courserequestapproved_loggedin','email'),(343,'message','message_provider_moodle_courserequestapproved_loggedoff','email'),(344,'message','email_provider_moodle_courserequestrejected_permitted','permitted'),(345,'message','message_provider_moodle_courserequestrejected_loggedin','email'),(346,'message','message_provider_moodle_courserequestrejected_loggedoff','email'),(347,'message','email_provider_moodle_badgerecipientnotice_permitted','permitted'),(348,'message','message_provider_moodle_badgerecipientnotice_loggedoff','popup,email'),(349,'message','email_provider_moodle_badgecreatornotice_permitted','permitted'),(350,'message','message_provider_moodle_badgecreatornotice_loggedoff','email'),(351,'message','email_provider_moodle_competencyplancomment_permitted','permitted'),(352,'message','message_provider_moodle_competencyplancomment_loggedin','email'),(353,'message','message_provider_moodle_competencyplancomment_loggedoff','email'),(354,'message','email_provider_moodle_competencyusercompcomment_permitted','permitted'),(355,'message','message_provider_moodle_competencyusercompcomment_loggedin','email'),(356,'message','message_provider_moodle_competencyusercompcomment_loggedoff','email'),(357,'message_jabber','version','2016052300'),(359,'message','jabber_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(360,'message','jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(361,'message','jabber_provider_enrol_manual_expiry_notification_permitted','permitted'),(362,'message','jabber_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(363,'message','jabber_provider_enrol_self_expiry_notification_permitted','permitted'),(364,'message','jabber_provider_mod_assign_assign_notification_permitted','permitted'),(365,'message','jabber_provider_mod_assignment_assignment_updates_permitted','permitted'),(366,'message','jabber_provider_mod_feedback_submission_permitted','permitted'),(367,'message','jabber_provider_mod_feedback_message_permitted','permitted'),(368,'message','jabber_provider_mod_forum_posts_permitted','permitted'),(369,'message','jabber_provider_mod_forum_digests_permitted','permitted'),(370,'message','jabber_provider_mod_lesson_graded_essay_permitted','permitted'),(371,'message','jabber_provider_mod_quiz_submission_permitted','permitted'),(372,'message','jabber_provider_mod_quiz_confirmation_permitted','permitted'),(373,'message','jabber_provider_mod_quiz_attempt_overdue_permitted','permitted'),(374,'message','jabber_provider_moodle_notices_permitted','permitted'),(375,'message','jabber_provider_moodle_errors_permitted','permitted'),(376,'message','jabber_provider_moodle_availableupdate_permitted','permitted'),(377,'message','jabber_provider_moodle_instantmessage_permitted','permitted'),(378,'message','jabber_provider_moodle_backup_permitted','permitted'),(379,'message','jabber_provider_moodle_courserequested_permitted','permitted'),(380,'message','jabber_provider_moodle_courserequestapproved_permitted','permitted'),(381,'message','jabber_provider_moodle_courserequestrejected_permitted','permitted'),(382,'message','jabber_provider_moodle_badgerecipientnotice_permitted','permitted'),(383,'message','jabber_provider_moodle_badgecreatornotice_permitted','permitted'),(384,'message','jabber_provider_moodle_competencyplancomment_permitted','permitted'),(385,'message','jabber_provider_moodle_competencyusercompcomment_permitted','permitted'),(386,'message_popup','version','2016052300'),(388,'message','popup_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(389,'message','popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(390,'message','popup_provider_enrol_manual_expiry_notification_permitted','permitted'),(391,'message','popup_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(392,'message','popup_provider_enrol_self_expiry_notification_permitted','permitted'),(393,'message','popup_provider_mod_assign_assign_notification_permitted','permitted'),(394,'message','popup_provider_mod_assignment_assignment_updates_permitted','permitted'),(395,'message','popup_provider_mod_feedback_submission_permitted','permitted'),(396,'message','popup_provider_mod_feedback_message_permitted','permitted'),(397,'message','popup_provider_mod_forum_posts_permitted','permitted'),(398,'message','popup_provider_mod_forum_digests_permitted','permitted'),(399,'message','popup_provider_mod_lesson_graded_essay_permitted','permitted'),(400,'message','popup_provider_mod_quiz_submission_permitted','permitted'),(401,'message','popup_provider_mod_quiz_confirmation_permitted','permitted'),(402,'message','popup_provider_mod_quiz_attempt_overdue_permitted','permitted'),(403,'message','popup_provider_moodle_notices_permitted','permitted'),(404,'message','popup_provider_moodle_errors_permitted','permitted'),(405,'message','popup_provider_moodle_availableupdate_permitted','permitted'),(406,'message','popup_provider_moodle_instantmessage_permitted','permitted'),(407,'message','message_provider_moodle_instantmessage_loggedin','popup'),(408,'message','popup_provider_moodle_backup_permitted','permitted'),(409,'message','popup_provider_moodle_courserequested_permitted','permitted'),(410,'message','popup_provider_moodle_courserequestapproved_permitted','permitted'),(411,'message','popup_provider_moodle_courserequestrejected_permitted','permitted'),(412,'message','popup_provider_moodle_badgerecipientnotice_permitted','permitted'),(413,'message','message_provider_moodle_badgerecipientnotice_loggedin','popup'),(414,'message','popup_provider_moodle_badgecreatornotice_permitted','permitted'),(415,'message','popup_provider_moodle_competencyplancomment_permitted','permitted'),(416,'message','popup_provider_moodle_competencyusercompcomment_permitted','permitted'),(417,'block_activity_modules','version','2016052300'),(418,'block_activity_results','version','2016052300'),(419,'block_admin_bookmarks','version','2016052300'),(420,'block_badges','version','2016052300'),(421,'block_blog_menu','version','2016052300'),(422,'block_blog_recent','version','2016052300'),(423,'block_blog_tags','version','2016052300'),(424,'block_calendar_month','version','2016052300'),(425,'block_calendar_upcoming','version','2016052300'),(426,'block_comments','version','2016052300'),(427,'block_community','version','2016052300'),(428,'block_completionstatus','version','2016052300'),(429,'block_course_list','version','2016052300'),(430,'block_course_overview','version','2016052300'),(431,'block_course_summary','version','2016052300'),(432,'block_feedback','version','2016052300'),(434,'block_globalsearch','version','2016052300'),(435,'block_glossary_random','version','2016052300'),(436,'block_html','version','2016052300'),(437,'block_login','version','2016052300'),(438,'block_lp','version','2016052300'),(439,'block_mentees','version','2016052300'),(440,'block_messages','version','2016052300'),(441,'block_mnet_hosts','version','2016052300'),(442,'block_myprofile','version','2016052300'),(443,'block_navigation','version','2016052300'),(444,'block_news_items','version','2016052300'),(445,'block_online_users','version','2016052300'),(446,'block_participants','version','2016052300'),(447,'block_private_files','version','2016052300'),(448,'block_quiz_results','version','2016052300'),(450,'block_recent_activity','version','2016052300'),(451,'block_rss_client','version','2016052300'),(452,'block_search_forums','version','2016052300'),(453,'block_section_links','version','2016052300'),(454,'block_selfcompletion','version','2016052300'),(455,'block_settings','version','2016052300'),(456,'block_site_main_menu','version','2016052300'),(457,'block_social_activities','version','2016052300'),(458,'block_tag_flickr','version','2016052300'),(459,'block_tag_youtube','version','2016052300'),(461,'block_tags','version','2016052300'),(462,'filter_activitynames','version','2016052300'),(464,'filter_algebra','version','2016052300'),(465,'filter_censor','version','2016052300'),(466,'filter_data','version','2016052300'),(468,'filter_emailprotect','version','2016052300'),(469,'filter_emoticon','version','2016052300'),(470,'filter_glossary','version','2016052300'),(472,'filter_mathjaxloader','version','2016052300'),(474,'filter_mediaplugin','version','2016052300'),(476,'filter_multilang','version','2016052300'),(477,'filter_tex','version','2016052300'),(479,'filter_tidy','version','2016052300'),(480,'filter_urltolink','version','2016052300'),(481,'editor_atto','version','2016052300'),(483,'editor_textarea','version','2016052300'),(484,'editor_tinymce','version','2016052300'),(485,'format_singleactivity','version','2016052300'),(486,'format_social','version','2016052300'),(487,'format_topics','version','2016052300'),(488,'format_weeks','version','2016052300'),(489,'dataformat_csv','version','2016052300'),(490,'dataformat_excel','version','2016052300'),(491,'dataformat_html','version','2016052300'),(492,'dataformat_json','version','2016052300'),(493,'dataformat_ods','version','2016052300'),(494,'profilefield_checkbox','version','2016052300'),(495,'profilefield_datetime','version','2016052300'),(496,'profilefield_menu','version','2016052300'),(497,'profilefield_text','version','2016052300'),(498,'profilefield_textarea','version','2016052300'),(499,'report_backups','version','2016052300'),(500,'report_competency','version','2016052300'),(501,'report_completion','version','2016052300'),(503,'report_configlog','version','2016052300'),(504,'report_courseoverview','version','2016052300'),(505,'report_eventlist','version','2016052300'),(506,'report_log','version','2016052300'),(508,'report_loglive','version','2016052300'),(509,'report_outline','version','2016052300'),(511,'report_participation','version','2016052300'),(513,'report_performance','version','2016052300'),(514,'report_progress','version','2016052300'),(516,'report_questioninstances','version','2016052300'),(517,'report_search','version','2016052300'),(518,'report_security','version','2016052300'),(519,'report_stats','version','2016052300'),(521,'report_usersessions','version','2016052300'),(522,'gradeexport_ods','version','2016052300'),(523,'gradeexport_txt','version','2016052300'),(524,'gradeexport_xls','version','2016052300'),(525,'gradeexport_xml','version','2016052300'),(526,'gradeimport_csv','version','2016052300'),(527,'gradeimport_direct','version','2016052300'),(528,'gradeimport_xml','version','2016052300'),(529,'gradereport_grader','version','2016052300'),(530,'gradereport_history','version','2016052300'),(531,'gradereport_outcomes','version','2016052300'),(532,'gradereport_overview','version','2016052300'),(533,'gradereport_singleview','version','2016052300'),(534,'gradereport_user','version','2016052300'),(535,'gradingform_guide','version','2016052300'),(536,'gradingform_rubric','version','2016052300'),(537,'mnetservice_enrol','version','2016052300'),(538,'webservice_rest','version','2016052300'),(539,'webservice_soap','version','2016052300'),(540,'webservice_xmlrpc','version','2016052300'),(541,'repository_alfresco','version','2016052300'),(542,'repository_areafiles','version','2016052300'),(544,'areafiles','enablecourseinstances','0'),(545,'areafiles','enableuserinstances','0'),(546,'repository_boxnet','version','2016052300'),(547,'repository_coursefiles','version','2016052300'),(548,'repository_dropbox','version','2016052300'),(549,'repository_equella','version','2016052300'),(550,'repository_filesystem','version','2016052300'),(551,'repository_flickr','version','2016052300'),(552,'repository_flickr_public','version','2016052300'),(553,'repository_googledocs','version','2016052300'),(554,'repository_local','version','2016052300'),(556,'local','enablecourseinstances','0'),(557,'local','enableuserinstances','0'),(558,'repository_merlot','version','2016052300'),(559,'repository_picasa','version','2016052300'),(560,'repository_recent','version','2016052300'),(562,'recent','enablecourseinstances','0'),(563,'recent','enableuserinstances','0'),(564,'repository_s3','version','2016052300'),(565,'repository_skydrive','version','2016052300'),(566,'repository_upload','version','2016052300'),(568,'upload','enablecourseinstances','0'),(569,'upload','enableuserinstances','0'),(570,'repository_url','version','2016052300'),(572,'url','enablecourseinstances','0'),(573,'url','enableuserinstances','0'),(574,'repository_user','version','2016052300'),(576,'user','enablecourseinstances','0'),(577,'user','enableuserinstances','0'),(578,'repository_webdav','version','2016052300'),(579,'repository_wikimedia','version','2016052300'),(581,'wikimedia','enablecourseinstances','0'),(582,'wikimedia','enableuserinstances','0'),(583,'repository_youtube','version','2016052300'),(585,'portfolio_boxnet','version','2016052300'),(586,'portfolio_download','version','2016052300'),(587,'portfolio_flickr','version','2016052300'),(588,'portfolio_googledocs','version','2016052300'),(589,'portfolio_mahara','version','2016052300'),(590,'portfolio_picasa','version','2016052300'),(591,'search_solr','version','2016052300'),(592,'qbehaviour_adaptive','version','2016052300'),(593,'qbehaviour_adaptivenopenalty','version','2016052300'),(594,'qbehaviour_deferredcbm','version','2016052300'),(595,'qbehaviour_deferredfeedback','version','2016052300'),(596,'qbehaviour_immediatecbm','version','2016052300'),(597,'qbehaviour_immediatefeedback','version','2016052300'),(598,'qbehaviour_informationitem','version','2016052300'),(599,'qbehaviour_interactive','version','2016052300'),(600,'qbehaviour_interactivecountback','version','2016052300'),(601,'qbehaviour_manualgraded','version','2016052300'),(603,'question','disabledbehaviours','manualgraded'),(604,'qbehaviour_missing','version','2016052300'),(605,'qformat_aiken','version','2016052300'),(606,'qformat_blackboard_six','version','2016052300'),(607,'qformat_examview','version','2016052300'),(608,'qformat_gift','version','2016052300'),(609,'qformat_missingword','version','2016052300'),(610,'qformat_multianswer','version','2016052300'),(611,'qformat_webct','version','2016052300'),(612,'qformat_xhtml','version','2016052300'),(613,'qformat_xml','version','2016052300'),(614,'tool_assignmentupgrade','version','2016052300'),(615,'tool_availabilityconditions','version','2016052300'),(616,'tool_behat','version','2016052300'),(617,'tool_capability','version','2016052300'),(618,'tool_cohortroles','version','2016052300'),(619,'tool_customlang','version','2016052300'),(621,'tool_dbtransfer','version','2016052300'),(622,'tool_filetypes','version','2016052300'),(623,'tool_generator','version','2016052300'),(624,'tool_health','version','2016052300'),(625,'tool_innodb','version','2016052300'),(626,'tool_installaddon','version','2016052300'),(627,'tool_langimport','version','2016052300'),(628,'tool_log','version','2016052300'),(630,'tool_log','enabled_stores','logstore_standard'),(631,'tool_lp','version','2016052300'),(632,'tool_lpmigrate','version','2016052300'),(633,'tool_messageinbound','version','2016052300'),(634,'message','airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(635,'message','email_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(636,'message','jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(637,'message','popup_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(638,'message','message_provider_tool_messageinbound_invalidrecipienthandler_loggedin','email'),(639,'message','message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff','email'),(640,'message','airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(641,'message','email_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(642,'message','jabber_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(643,'message','popup_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(644,'message','message_provider_tool_messageinbound_messageprocessingerror_loggedin','email'),(645,'message','message_provider_tool_messageinbound_messageprocessingerror_loggedoff','email'),(646,'message','airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(647,'message','email_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(648,'message','jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(649,'message','popup_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(650,'message','message_provider_tool_messageinbound_messageprocessingsuccess_loggedin','email'),(651,'message','message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff','email'),(652,'tool_mobile','version','2016052300'),(653,'tool_monitor','version','2016052300'),(654,'message','airnotifier_provider_tool_monitor_notification_permitted','permitted'),(655,'message','email_provider_tool_monitor_notification_permitted','permitted'),(656,'message','jabber_provider_tool_monitor_notification_permitted','permitted'),(657,'message','popup_provider_tool_monitor_notification_permitted','permitted'),(658,'message','message_provider_tool_monitor_notification_loggedin','email'),(659,'message','message_provider_tool_monitor_notification_loggedoff','email'),(660,'tool_multilangupgrade','version','2016052300'),(661,'tool_phpunit','version','2016052300'),(662,'tool_profiling','version','2016052300'),(663,'tool_recyclebin','version','2016052300'),(664,'tool_replace','version','2016052300'),(665,'tool_spamcleaner','version','2016052300'),(666,'tool_task','version','2016052300'),(667,'tool_templatelibrary','version','2016052300'),(668,'tool_unsuproles','version','2016052300'),(670,'tool_uploadcourse','version','2016052300'),(671,'tool_uploaduser','version','2016052300'),(672,'tool_xmldb','version','2016052300'),(673,'cachestore_file','version','2016052300'),(674,'cachestore_memcache','version','2016052300'),(675,'cachestore_memcached','version','2016052300'),(676,'cachestore_mongodb','version','2016052300'),(677,'cachestore_session','version','2016052300'),(678,'cachestore_static','version','2016052300'),(679,'cachelock_file','version','2016052300'),(680,'theme_base','version','2016052300'),(681,'theme_bootstrapbase','version','2016052300'),(682,'theme_canvas','version','2016052300'),(683,'theme_clean','version','2016052300'),(684,'theme_more','version','2016052300'),(686,'assignsubmission_comments','version','2016052300'),(688,'assignsubmission_file','sortorder','1'),(689,'assignsubmission_comments','sortorder','2'),(690,'assignsubmission_onlinetext','sortorder','0'),(691,'assignsubmission_file','version','2016052300'),(692,'assignsubmission_onlinetext','version','2016052300'),(694,'assignfeedback_comments','version','2016052300'),(696,'assignfeedback_comments','sortorder','0'),(697,'assignfeedback_editpdf','sortorder','1'),(698,'assignfeedback_file','sortorder','3'),(699,'assignfeedback_offline','sortorder','2'),(700,'assignfeedback_editpdf','version','2016052300'),(702,'assignfeedback_file','version','2016052300'),(704,'assignfeedback_offline','version','2016052300'),(705,'assignment_offline','version','2016052300'),(706,'assignment_online','version','2016052300'),(707,'assignment_upload','version','2016052300'),(708,'assignment_uploadsingle','version','2016052300'),(709,'booktool_exportimscp','version','2016052300'),(710,'booktool_importhtml','version','2016052300'),(711,'booktool_print','version','2016052300'),(712,'datafield_checkbox','version','2016052300'),(713,'datafield_date','version','2016052300'),(714,'datafield_file','version','2016052300'),(715,'datafield_latlong','version','2016052300'),(716,'datafield_menu','version','2016052300'),(717,'datafield_multimenu','version','2016052300'),(718,'datafield_number','version','2016052300'),(719,'datafield_picture','version','2016052300'),(720,'datafield_radiobutton','version','2016052300'),(721,'datafield_text','version','2016052300'),(722,'datafield_textarea','version','2016052300'),(723,'datafield_url','version','2016052300'),(724,'datapreset_imagegallery','version','2016052300'),(725,'ltiservice_memberships','version','2016052300'),(726,'ltiservice_profile','version','2016052300'),(727,'ltiservice_toolproxy','version','2016052300'),(728,'ltiservice_toolsettings','version','2016052300'),(729,'quiz_grading','version','2016052300'),(731,'quiz_overview','version','2016052300'),(733,'quiz_responses','version','2016052300'),(735,'quiz_statistics','version','2016052300'),(737,'quizaccess_delaybetweenattempts','version','2016052300'),(738,'quizaccess_ipaddress','version','2016052300'),(739,'quizaccess_numattempts','version','2016052300'),(740,'quizaccess_openclosedate','version','2016052300'),(741,'quizaccess_password','version','2016052300'),(742,'quizaccess_safebrowser','version','2016052300'),(743,'quizaccess_securewindow','version','2016052300'),(744,'quizaccess_timelimit','version','2016052300'),(745,'scormreport_basic','version','2016052300'),(746,'scormreport_graphs','version','2016052300'),(747,'scormreport_interactions','version','2016052300'),(748,'scormreport_objectives','version','2016052300'),(749,'workshopform_accumulative','version','2016052300'),(751,'workshopform_comments','version','2016052300'),(753,'workshopform_numerrors','version','2016052300'),(755,'workshopform_rubric','version','2016052300'),(757,'workshopallocation_manual','version','2016052300'),(758,'workshopallocation_random','version','2016052300'),(759,'workshopallocation_scheduled','version','2016052300'),(760,'workshopeval_best','version','2016052300'),(761,'atto_accessibilitychecker','version','2016052300'),(762,'atto_accessibilityhelper','version','2016052300'),(763,'atto_align','version','2016052300'),(764,'atto_backcolor','version','2016052300'),(765,'atto_bold','version','2016052300'),(766,'atto_charmap','version','2016052300'),(767,'atto_clear','version','2016052300'),(768,'atto_collapse','version','2016052300'),(769,'atto_emoticon','version','2016052300'),(770,'atto_equation','version','2016052300'),(771,'atto_fontcolor','version','2016052300'),(772,'atto_html','version','2016052300'),(773,'atto_image','version','2016052300'),(774,'atto_indent','version','2016052300'),(775,'atto_italic','version','2016052300'),(776,'atto_link','version','2016052300'),(777,'atto_managefiles','version','2016052300'),(778,'atto_media','version','2016052300'),(779,'atto_noautolink','version','2016052300'),(780,'atto_orderedlist','version','2016052300'),(781,'atto_rtl','version','2016052300'),(782,'atto_strike','version','2016052300'),(783,'atto_subscript','version','2016052300'),(784,'atto_superscript','version','2016052300'),(785,'atto_table','version','2016052300'),(786,'atto_title','version','2016052300'),(787,'atto_underline','version','2016052300'),(788,'atto_undo','version','2016052300'),(789,'atto_unorderedlist','version','2016052300'),(790,'tinymce_ctrlhelp','version','2016052300'),(791,'tinymce_managefiles','version','2016052300'),(792,'tinymce_moodleemoticon','version','2016052300'),(793,'tinymce_moodleimage','version','2016052300'),(794,'tinymce_moodlemedia','version','2016052300'),(795,'tinymce_moodlenolink','version','2016052300'),(796,'tinymce_pdw','version','2016052300'),(797,'tinymce_spellchecker','version','2016052300'),(799,'tinymce_wrap','version','2016052300'),(800,'logstore_database','version','2016052300'),(801,'logstore_legacy','version','2016052300'),(802,'logstore_standard','version','2016052300'),(803,'assign','feedback_plugin_for_gradebook','assignfeedback_comments'),(804,'assign','showrecentsubmissions','0'),(805,'assign','submissionreceipts','1'),(806,'assign','submissionstatement','This assignment is my own work, except where I have acknowledged the use of the works of other people.'),(807,'assign','maxperpage','-1'),(808,'assign','alwaysshowdescription','1'),(809,'assign','alwaysshowdescription_adv',''),(810,'assign','alwaysshowdescription_locked',''),(811,'assign','allowsubmissionsfromdate','0'),(812,'assign','allowsubmissionsfromdate_enabled','1'),(813,'assign','allowsubmissionsfromdate_adv',''),(814,'assign','duedate','604800'),(815,'assign','duedate_enabled','1'),(816,'assign','duedate_adv',''),(817,'assign','cutoffdate','1209600'),(818,'assign','cutoffdate_enabled',''),(819,'assign','cutoffdate_adv',''),(820,'assign','submissiondrafts','0'),(821,'assign','submissiondrafts_adv',''),(822,'assign','submissiondrafts_locked',''),(823,'assign','requiresubmissionstatement','0'),(824,'assign','requiresubmissionstatement_adv',''),(825,'assign','requiresubmissionstatement_locked',''),(826,'assign','attemptreopenmethod','none'),(827,'assign','attemptreopenmethod_adv',''),(828,'assign','attemptreopenmethod_locked',''),(829,'assign','maxattempts','-1'),(830,'assign','maxattempts_adv',''),(831,'assign','maxattempts_locked',''),(832,'assign','teamsubmission','0'),(833,'assign','teamsubmission_adv',''),(834,'assign','teamsubmission_locked',''),(835,'assign','preventsubmissionnotingroup','0'),(836,'assign','preventsubmissionnotingroup_adv',''),(837,'assign','preventsubmissionnotingroup_locked',''),(838,'assign','requireallteammemberssubmit','0'),(839,'assign','requireallteammemberssubmit_adv',''),(840,'assign','requireallteammemberssubmit_locked',''),(841,'assign','teamsubmissiongroupingid',''),(842,'assign','teamsubmissiongroupingid_adv',''),(843,'assign','sendnotifications','0'),(844,'assign','sendnotifications_adv',''),(845,'assign','sendnotifications_locked',''),(846,'assign','sendlatenotifications','0'),(847,'assign','sendlatenotifications_adv',''),(848,'assign','sendlatenotifications_locked',''),(849,'assign','sendstudentnotifications','1'),(850,'assign','sendstudentnotifications_adv',''),(851,'assign','sendstudentnotifications_locked',''),(852,'assign','blindmarking','0'),(853,'assign','blindmarking_adv',''),(854,'assign','blindmarking_locked',''),(855,'assign','markingworkflow','0'),(856,'assign','markingworkflow_adv',''),(857,'assign','markingworkflow_locked',''),(858,'assign','markingallocation','0'),(859,'assign','markingallocation_adv',''),(860,'assign','markingallocation_locked',''),(861,'assignsubmission_file','default','1'),(862,'assignsubmission_file','maxfiles','20'),(863,'assignsubmission_file','maxbytes','1048576'),(864,'assignsubmission_onlinetext','default','0'),(865,'assignfeedback_comments','default','1'),(866,'assignfeedback_comments','inline','0'),(867,'assignfeedback_comments','inline_adv',''),(868,'assignfeedback_comments','inline_locked',''),(869,'assignfeedback_editpdf','stamps',''),(870,'assignfeedback_file','default','0'),(871,'assignfeedback_offline','default','0'),(872,'book','numberingoptions','0,1,2,3'),(873,'book','navoptions','0,1,2'),(874,'book','numbering','1'),(875,'book','navstyle','1'),(876,'folder','showexpanded','1'),(877,'folder','maxsizetodownload','0'),(878,'imscp','keepold','1'),(879,'imscp','keepold_adv',''),(880,'label','dndmedia','1'),(881,'label','dndresizewidth','400'),(882,'label','dndresizeheight','400'),(883,'mod_lesson','mediafile',''),(884,'mod_lesson','mediafile_adv','1'),(885,'mod_lesson','mediawidth','640'),(886,'mod_lesson','mediaheight','480'),(887,'mod_lesson','mediaclose','0'),(888,'mod_lesson','progressbar','0'),(889,'mod_lesson','progressbar_adv',''),(890,'mod_lesson','ongoing','0'),(891,'mod_lesson','ongoing_adv','1'),(892,'mod_lesson','displayleftmenu','0'),(893,'mod_lesson','displayleftmenu_adv',''),(894,'mod_lesson','displayleftif','0'),(895,'mod_lesson','displayleftif_adv','1'),(896,'mod_lesson','slideshow','0'),(897,'mod_lesson','slideshow_adv','1'),(898,'mod_lesson','slideshowwidth','640'),(899,'mod_lesson','slideshowheight','480'),(900,'mod_lesson','slideshowbgcolor','#FFFFFF'),(901,'mod_lesson','maxanswers','5'),(902,'mod_lesson','maxanswers_adv','1'),(903,'mod_lesson','defaultfeedback','0'),(904,'mod_lesson','defaultfeedback_adv','1'),(905,'mod_lesson','activitylink',''),(906,'mod_lesson','activitylink_adv','1'),(907,'mod_lesson','timelimit','0'),(908,'mod_lesson','timelimit_adv',''),(909,'mod_lesson','password','0'),(910,'mod_lesson','password_adv','1'),(911,'mod_lesson','modattempts','0'),(912,'mod_lesson','modattempts_adv',''),(913,'mod_lesson','displayreview','0'),(914,'mod_lesson','displayreview_adv',''),(915,'mod_lesson','maximumnumberofattempts','1'),(916,'mod_lesson','maximumnumberofattempts_adv',''),(917,'mod_lesson','defaultnextpage','0'),(918,'mod_lesson','defaultnextpage_adv','1'),(919,'mod_lesson','numberofpagestoshow','1'),(920,'mod_lesson','numberofpagestoshow_adv','1'),(921,'mod_lesson','practice','0'),(922,'mod_lesson','practice_adv',''),(923,'mod_lesson','customscoring','1'),(924,'mod_lesson','customscoring_adv','1'),(925,'mod_lesson','retakesallowed','0'),(926,'mod_lesson','retakesallowed_adv',''),(927,'mod_lesson','handlingofretakes','0'),(928,'mod_lesson','handlingofretakes_adv','1'),(929,'mod_lesson','minimumnumberofquestions','0'),(930,'mod_lesson','minimumnumberofquestions_adv','1'),(931,'page','displayoptions','5'),(932,'page','printheading','1'),(933,'page','printintro','0'),(934,'page','display','5'),(935,'page','popupwidth','620'),(936,'page','popupheight','450'),(937,'quiz','timelimit','0'),(938,'quiz','timelimit_adv',''),(939,'quiz','overduehandling','autosubmit'),(940,'quiz','overduehandling_adv',''),(941,'quiz','graceperiod','86400'),(942,'quiz','graceperiod_adv',''),(943,'quiz','graceperiodmin','60'),(944,'quiz','attempts','0'),(945,'quiz','attempts_adv',''),(946,'quiz','grademethod','1'),(947,'quiz','grademethod_adv',''),(948,'quiz','maximumgrade','10'),(949,'quiz','questionsperpage','1'),(950,'quiz','questionsperpage_adv',''),(951,'quiz','navmethod','free'),(952,'quiz','navmethod_adv','1'),(953,'quiz','shuffleanswers','1'),(954,'quiz','shuffleanswers_adv',''),(955,'quiz','preferredbehaviour','deferredfeedback'),(956,'quiz','canredoquestions','0'),(957,'quiz','canredoquestions_adv','1'),(958,'quiz','attemptonlast','0'),(959,'quiz','attemptonlast_adv','1'),(960,'quiz','reviewattempt','69904'),(961,'quiz','reviewcorrectness','69904'),(962,'quiz','reviewmarks','69904'),(963,'quiz','reviewspecificfeedback','69904'),(964,'quiz','reviewgeneralfeedback','69904'),(965,'quiz','reviewrightanswer','69904'),(966,'quiz','reviewoverallfeedback','4368'),(967,'quiz','showuserpicture','0'),(968,'quiz','showuserpicture_adv',''),(969,'quiz','decimalpoints','2'),(970,'quiz','decimalpoints_adv',''),(971,'quiz','questiondecimalpoints','-1'),(972,'quiz','questiondecimalpoints_adv','1'),(973,'quiz','showblocks','0'),(974,'quiz','showblocks_adv','1'),(975,'quiz','password',''),(976,'quiz','password_adv',''),(977,'quiz','subnet',''),(978,'quiz','subnet_adv','1'),(979,'quiz','delay1','0'),(980,'quiz','delay1_adv','1'),(981,'quiz','delay2','0'),(982,'quiz','delay2_adv','1'),(983,'quiz','browsersecurity','-'),(984,'quiz','browsersecurity_adv','1'),(985,'quiz','initialnumfeedbacks','2'),(986,'quiz','autosaveperiod','60'),(987,'resource','framesize','130'),(988,'resource','displayoptions','0,1,4,5,6'),(989,'resource','printintro','1'),(990,'resource','display','0'),(991,'resource','showsize','0'),(992,'resource','showtype','0'),(993,'resource','showdate','0'),(994,'resource','popupwidth','620'),(995,'resource','popupheight','450'),(996,'resource','filterfiles','0'),(997,'scorm','displaycoursestructure','0'),(998,'scorm','displaycoursestructure_adv',''),(999,'scorm','popup','0'),(1000,'scorm','popup_adv',''),(1001,'scorm','displayactivityname','1'),(1002,'scorm','framewidth','100'),(1003,'scorm','framewidth_adv','1'),(1004,'scorm','frameheight','500'),(1005,'scorm','frameheight_adv','1'),(1006,'scorm','winoptgrp_adv','1'),(1007,'scorm','scrollbars','0'),(1008,'scorm','directories','0'),(1009,'scorm','location','0'),(1010,'scorm','menubar','0'),(1011,'scorm','toolbar','0'),(1012,'scorm','status','0'),(1013,'scorm','skipview','0'),(1014,'scorm','skipview_adv','1'),(1015,'scorm','hidebrowse','0'),(1016,'scorm','hidebrowse_adv','1'),(1017,'scorm','hidetoc','0'),(1018,'scorm','hidetoc_adv','1'),(1019,'scorm','nav','1'),(1020,'scorm','nav_adv','1'),(1021,'scorm','navpositionleft','-100'),(1022,'scorm','navpositionleft_adv','1'),(1023,'scorm','navpositiontop','-100'),(1024,'scorm','navpositiontop_adv','1'),(1025,'scorm','collapsetocwinsize','767'),(1026,'scorm','collapsetocwinsize_adv','1'),(1027,'scorm','displayattemptstatus','1'),(1028,'scorm','displayattemptstatus_adv',''),(1029,'scorm','grademethod','1'),(1030,'scorm','maxgrade','100'),(1031,'scorm','maxattempt','0'),(1032,'scorm','whatgrade','0'),(1033,'scorm','forcecompleted','0'),(1034,'scorm','forcenewattempt','0'),(1035,'scorm','autocommit','0'),(1036,'scorm','masteryoverride','1'),(1037,'scorm','lastattemptlock','0'),(1038,'scorm','auto','0'),(1039,'scorm','updatefreq','0'),(1040,'scorm','scorm12standard','1'),(1041,'scorm','allowtypeexternal','0'),(1042,'scorm','allowtypelocalsync','0'),(1043,'scorm','allowtypeexternalaicc','0'),(1044,'scorm','allowaicchacp','0'),(1045,'scorm','aicchacptimeout','30'),(1046,'scorm','aicchacpkeepsessiondata','1'),(1047,'scorm','aiccuserid','1'),(1048,'scorm','forcejavascript','1'),(1049,'scorm','allowapidebug','0'),(1050,'scorm','apidebugmask','.*'),(1051,'scorm','protectpackagedownloads','0'),(1052,'url','framesize','130'),(1053,'url','secretphrase',''),(1054,'url','rolesinparams','0'),(1055,'url','displayoptions','0,1,5,6'),(1056,'url','printintro','1'),(1057,'url','display','0'),(1058,'url','popupwidth','620'),(1059,'url','popupheight','450'),(1060,'workshop','grade','80'),(1061,'workshop','gradinggrade','20'),(1062,'workshop','gradedecimals','0'),(1063,'workshop','maxbytes','0'),(1064,'workshop','strategy','accumulative'),(1065,'workshop','examplesmode','0'),(1066,'workshopallocation_random','numofreviews','5'),(1067,'workshopform_numerrors','grade0','No'),(1068,'workshopform_numerrors','grade1','Yes'),(1069,'workshopeval_best','comparison','5'),(1070,'tool_recyclebin','coursebinenable','1'),(1071,'tool_recyclebin','coursebinexpiry','604800'),(1072,'tool_recyclebin','categorybinenable','1'),(1073,'tool_recyclebin','categorybinexpiry','604800'),(1074,'tool_recyclebin','autohide','1'),(1075,'antivirus_clamav','pathtoclam',''),(1076,'antivirus_clamav','quarantinedir',''),(1077,'antivirus_clamav','clamfailureonupload','donothing'),(1078,'block_course_overview','defaultmaxcourses','10'),(1079,'block_course_overview','forcedefaultmaxcourses','0'),(1080,'block_course_overview','showchildren','0'),(1081,'block_course_overview','showwelcomearea','0'),(1082,'block_course_overview','showcategories','0'),(1083,'block_section_links','numsections1','22'),(1084,'block_section_links','incby1','2'),(1085,'block_section_links','numsections2','40'),(1086,'block_section_links','incby2','5'),(1087,'block_tag_youtube','apikey',''),(1088,'format_singleactivity','activitytype','forum'),(1089,'enrol_cohort','roleid','5'),(1090,'enrol_cohort','unenrolaction','0'),(1091,'enrol_database','dbtype',''),(1092,'enrol_database','dbhost','localhost'),(1093,'enrol_database','dbuser',''),(1094,'enrol_database','dbpass',''),(1095,'enrol_database','dbname',''),(1096,'enrol_database','dbencoding','utf-8'),(1097,'enrol_database','dbsetupsql',''),(1098,'enrol_database','dbsybasequoting','0'),(1099,'enrol_database','debugdb','0'),(1100,'enrol_database','localcoursefield','idnumber'),(1101,'enrol_database','localuserfield','idnumber'),(1102,'enrol_database','localrolefield','shortname'),(1103,'enrol_database','localcategoryfield','id'),(1104,'enrol_database','remoteenroltable',''),(1105,'enrol_database','remotecoursefield',''),(1106,'enrol_database','remoteuserfield',''),(1107,'enrol_database','remoterolefield',''),(1108,'enrol_database','remoteotheruserfield',''),(1109,'enrol_database','defaultrole','5'),(1110,'enrol_database','ignorehiddencourses','0'),(1111,'enrol_database','unenrolaction','0'),(1112,'enrol_database','newcoursetable',''),(1113,'enrol_database','newcoursefullname','fullname'),(1114,'enrol_database','newcourseshortname','shortname'),(1115,'enrol_database','newcourseidnumber','idnumber'),(1116,'enrol_database','newcoursecategory',''),(1117,'enrol_database','defaultcategory','1'),(1118,'enrol_database','templatecourse',''),(1119,'enrol_flatfile','location',''),(1120,'enrol_flatfile','encoding','UTF-8'),(1121,'enrol_flatfile','mailstudents','0'),(1122,'enrol_flatfile','mailteachers','0'),(1123,'enrol_flatfile','mailadmins','0'),(1124,'enrol_flatfile','unenrolaction','3'),(1125,'enrol_flatfile','expiredaction','3'),(1126,'enrol_guest','requirepassword','0'),(1127,'enrol_guest','usepasswordpolicy','0'),(1128,'enrol_guest','showhint','0'),(1129,'enrol_guest','defaultenrol','1'),(1130,'enrol_guest','status','1'),(1131,'enrol_guest','status_adv',''),(1132,'enrol_imsenterprise','imsfilelocation',''),(1133,'enrol_imsenterprise','logtolocation',''),(1134,'enrol_imsenterprise','mailadmins','0'),(1135,'enrol_imsenterprise','createnewusers','0'),(1136,'enrol_imsenterprise','imsdeleteusers','0'),(1137,'enrol_imsenterprise','fixcaseusernames','0'),(1138,'enrol_imsenterprise','fixcasepersonalnames','0'),(1139,'enrol_imsenterprise','imssourcedidfallback','0'),(1140,'enrol_imsenterprise','imsrolemap01','5'),(1141,'enrol_imsenterprise','imsrolemap02','3'),(1142,'enrol_imsenterprise','imsrolemap03','3'),(1143,'enrol_imsenterprise','imsrolemap04','5'),(1144,'enrol_imsenterprise','imsrolemap05','0'),(1145,'enrol_imsenterprise','imsrolemap06','4'),(1146,'enrol_imsenterprise','imsrolemap07','0'),(1147,'enrol_imsenterprise','imsrolemap08','4'),(1148,'enrol_imsenterprise','truncatecoursecodes','0'),(1149,'enrol_imsenterprise','createnewcourses','0'),(1150,'enrol_imsenterprise','createnewcategories','0'),(1151,'enrol_imsenterprise','imsunenrol','0'),(1152,'enrol_imsenterprise','imscoursemapshortname','coursecode'),(1153,'enrol_imsenterprise','imscoursemapfullname','short'),(1154,'enrol_imsenterprise','imscoursemapsummary','ignore'),(1155,'enrol_imsenterprise','imsrestricttarget',''),(1156,'enrol_imsenterprise','imscapitafix','0'),(1157,'enrol_ldap','host_url',''),(1158,'enrol_ldap','start_tls','0'),(1159,'enrol_ldap','ldap_version','3'),(1160,'enrol_ldap','ldapencoding','utf-8'),(1161,'enrol_ldap','pagesize','250'),(1162,'enrol_ldap','bind_dn',''),(1163,'enrol_ldap','bind_pw',''),(1164,'enrol_ldap','course_search_sub','0'),(1165,'enrol_ldap','memberattribute_isdn','0'),(1166,'enrol_ldap','user_contexts',''),(1167,'enrol_ldap','user_search_sub','0'),(1168,'enrol_ldap','user_type','default'),(1169,'enrol_ldap','opt_deref','0'),(1170,'enrol_ldap','idnumber_attribute',''),(1171,'enrol_ldap','objectclass',''),(1172,'enrol_ldap','course_idnumber',''),(1173,'enrol_ldap','course_shortname',''),(1174,'enrol_ldap','course_fullname',''),(1175,'enrol_ldap','course_summary',''),(1176,'enrol_ldap','ignorehiddencourses','0'),(1177,'enrol_ldap','unenrolaction','0'),(1178,'enrol_ldap','autocreate','0'),(1179,'enrol_ldap','category','1'),(1180,'enrol_ldap','template',''),(1181,'enrol_ldap','course_shortname_updateonsync','0'),(1182,'enrol_ldap','course_fullname_updateonsync','0'),(1183,'enrol_ldap','course_summary_updateonsync','0'),(1184,'enrol_ldap','nested_groups','0'),(1185,'enrol_ldap','group_memberofattribute',''),(1186,'enrol_lti','emaildisplay','2'),(1187,'enrol_lti','city',''),(1188,'enrol_lti','country',''),(1189,'enrol_lti','timezone','99'),(1190,'enrol_lti','lang','en'),(1191,'enrol_lti','institution',''),(1192,'enrol_manual','expiredaction','1'),(1193,'enrol_manual','expirynotifyhour','6'),(1194,'enrol_manual','defaultenrol','1'),(1195,'enrol_manual','status','0'),(1196,'enrol_manual','roleid','5'),(1197,'enrol_manual','enrolstart','4'),(1198,'enrol_manual','enrolperiod','0'),(1199,'enrol_manual','expirynotify','0'),(1200,'enrol_manual','expirythreshold','86400'),(1201,'enrol_meta','nosyncroleids',''),(1202,'enrol_meta','syncall','1'),(1203,'enrol_meta','unenrolaction','3'),(1204,'enrol_meta','coursesort','sortorder'),(1205,'enrol_mnet','roleid','5'),(1206,'enrol_mnet','roleid_adv','1'),(1207,'enrol_paypal','paypalbusiness',''),(1208,'enrol_paypal','mailstudents','0'),(1209,'enrol_paypal','mailteachers','0'),(1210,'enrol_paypal','mailadmins','0'),(1211,'enrol_paypal','expiredaction','3'),(1212,'enrol_paypal','status','1'),(1213,'enrol_paypal','cost','0'),(1214,'enrol_paypal','currency','USD'),(1215,'enrol_paypal','roleid','5'),(1216,'enrol_paypal','enrolperiod','0'),(1217,'enrol_self','requirepassword','0'),(1218,'enrol_self','usepasswordpolicy','0'),(1219,'enrol_self','showhint','0'),(1220,'enrol_self','expiredaction','1'),(1221,'enrol_self','expirynotifyhour','6'),(1222,'enrol_self','defaultenrol','1'),(1223,'enrol_self','status','1'),(1224,'enrol_self','newenrols','1'),(1225,'enrol_self','groupkey','0'),(1226,'enrol_self','roleid','5'),(1227,'enrol_self','enrolperiod','0'),(1228,'enrol_self','expirynotify','0'),(1229,'enrol_self','expirythreshold','86400'),(1230,'enrol_self','longtimenosee','0'),(1231,'enrol_self','maxenrolled','0'),(1232,'enrol_self','sendcoursewelcomemessage','1'),(1233,'filter_emoticon','formats','1,4,0'),(1234,'filter_mathjaxloader','httpurl','http://cdn.mathjax.org/mathjax/2.6-latest/MathJax.js'),(1235,'filter_mathjaxloader','httpsurl','https://cdn.mathjax.org/mathjax/2.6-latest/MathJax.js'),(1236,'filter_mathjaxloader','texfiltercompatibility','0'),(1237,'filter_mathjaxloader','mathjaxconfig','\nMathJax.Hub.Config({\n    config: [\"Accessible.js\", \"Safe.js\"],\n    errorSettings: { message: [\"!\"] },\n    skipStartupTypeset: true,\n    messageStyle: \"none\"\n});\n'),(1238,'filter_mathjaxloader','additionaldelimiters',''),(1239,'filter_tex','latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),(1240,'filter_tex','latexbackground','#FFFFFF'),(1241,'filter_tex','density','120'),(1242,'filter_tex','pathlatex','/usr/bin/latex'),(1243,'filter_tex','pathdvips','/usr/bin/dvips'),(1244,'filter_tex','pathconvert','/usr/bin/convert'),(1245,'filter_tex','pathdvisvgm','/usr/bin/dvisvgm'),(1246,'filter_tex','pathmimetex',''),(1247,'filter_tex','convertformat','gif'),(1248,'filter_urltolink','formats','0'),(1249,'filter_urltolink','embedimages','1'),(1250,'logstore_database','dbdriver',''),(1251,'logstore_database','dbhost',''),(1252,'logstore_database','dbuser',''),(1253,'logstore_database','dbpass',''),(1254,'logstore_database','dbname',''),(1255,'logstore_database','dbtable',''),(1256,'logstore_database','dbpersist','0'),(1257,'logstore_database','dbsocket',''),(1258,'logstore_database','dbport',''),(1259,'logstore_database','dbschema',''),(1260,'logstore_database','dbcollation',''),(1261,'logstore_database','buffersize','50'),(1262,'logstore_database','logguests','0'),(1263,'logstore_database','includelevels','1,2,0'),(1264,'logstore_database','includeactions','c,r,u,d'),(1265,'logstore_legacy','loglegacy','0'),(1266,'logstore_standard','logguests','1'),(1267,'logstore_standard','loglifetime','0'),(1268,'logstore_standard','buffersize','50'),(1269,'search_solr','server_hostname','127.0.0.1'),(1270,'search_solr','indexname',''),(1271,'search_solr','secure','0'),(1272,'search_solr','server_port','8983'),(1273,'search_solr','server_username',''),(1274,'search_solr','server_password',''),(1275,'search_solr','server_timeout','30'),(1276,'search_solr','ssl_cert',''),(1277,'search_solr','ssl_key',''),(1278,'search_solr','ssl_keypassword',''),(1279,'search_solr','ssl_cainfo',''),(1280,'search_solr','ssl_capath',''),(1281,'search_solr','fileindexing','1'),(1282,'search_solr','maxindexfilekb','2097152'),(1283,'editor_atto','toolbar','collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html'),(1284,'editor_atto','autosavefrequency','60'),(1285,'atto_collapse','showgroups','5'),(1286,'atto_equation','librarygroup1','\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n'),(1287,'atto_equation','librarygroup2','\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n'),(1288,'atto_equation','librarygroup3','\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n'),(1289,'atto_equation','librarygroup4','\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n'),(1290,'atto_table','allowborders','0'),(1291,'atto_table','allowbackgroundcolour','0'),(1292,'atto_table','allowwidth','0'),(1293,'editor_tinymce','customtoolbar','wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),(1294,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),(1295,'editor_tinymce','customconfig',''),(1296,'tinymce_moodleemoticon','requireemoticon','1'),(1297,'tinymce_spellchecker','spellengine',''),(1298,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),(1299,'book','requiremodintro','0'),(1300,'folder','requiremodintro','0'),(1301,'imscp','requiremodintro','0'),(1302,'page','requiremodintro','0'),(1303,'resource','requiremodintro','0'),(1304,'url','requiremodintro','0');
/*!40000 ALTER TABLE `mdl_config_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context`
--

DROP TABLE IF EXISTS `mdl_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='one of these must be set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context`
--

LOCK TABLES `mdl_context` WRITE;
/*!40000 ALTER TABLE `mdl_context` DISABLE KEYS */;
INSERT INTO `mdl_context` VALUES (1,10,0,'/1',1),(2,50,1,'/1/2',2),(3,40,1,'/1/3',2),(4,30,1,'/1/4',2),(5,30,2,'/1/5',2),(6,80,1,'/1/2/6',3),(7,80,2,'/1/2/7',3),(8,80,3,'/1/2/8',3),(9,80,4,'/1/9',2),(10,80,5,'/1/10',2),(11,80,6,'/1/11',2),(12,80,7,'/1/12',2),(13,80,8,'/1/13',2),(14,80,9,'/1/14',2),(15,80,10,'/1/15',2),(16,80,11,'/1/16',2),(17,80,12,'/1/17',2),(18,80,13,'/1/18',2),(19,30,3,'/1/19',2),(20,30,4,'/1/20',2),(21,30,5,'/1/21',2),(22,30,6,'/1/22',2),(23,30,7,'/1/23',2),(24,30,8,'/1/24',2),(25,30,9,'/1/25',2),(26,30,10,'/1/26',2),(27,30,11,'/1/27',2),(28,30,12,'/1/28',2),(29,30,13,'/1/29',2),(30,30,14,'/1/30',2),(31,30,15,'/1/31',2),(32,30,16,'/1/32',2),(33,30,17,'/1/33',2),(34,30,18,'/1/34',2);
/*!40000 ALTER TABLE `mdl_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context_temp`
--

DROP TABLE IF EXISTS `mdl_context_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context_temp`
--

LOCK TABLES `mdl_context_temp` WRITE;
/*!40000 ALTER TABLE `mdl_context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_context_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `calendartype` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Central course table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course`
--

LOCK TABLES `mdl_course` WRITE;
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` VALUES (1,0,0,'Stable 31 MySQL','stable_31','','',0,'site',1,3,0,0,0,0,0,1,1,0,0,0,'','','',1466423526,1466423704,0,0,0,1466423704);
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Course categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_categories`
--

LOCK TABLES `mdl_course_categories` WRITE;
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` VALUES (1,'Miscellaneous',NULL,NULL,0,0,10000,0,1,1,1466423526,1,'/1',NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

DROP TABLE IF EXISTS `mdl_course_completion_aggr_methd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_aggr_methd`
--

LOCK TABLES `mdl_course_completion_aggr_methd` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

DROP TABLE IF EXISTS `mdl_course_completion_crit_compl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_crit_compl`
--

LOCK TABLES `mdl_course_completion_crit_compl` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_criteria`
--

DROP TABLE IF EXISTS `mdl_course_completion_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_criteria`
--

LOCK TABLES `mdl_course_completion_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completions`
--

DROP TABLE IF EXISTS `mdl_course_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completions`
--

LOCK TABLES `mdl_course_completions` WRITE;
/*!40000 ALTER TABLE `mdl_course_completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_format_options`
--

DROP TABLE IF EXISTS `mdl_course_format_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores format-specific options for the course or course sect';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_format_options`
--

LOCK TABLES `mdl_course_format_options` WRITE;
/*!40000 ALTER TABLE `mdl_course_format_options` DISABLE KEYS */;
INSERT INTO `mdl_course_format_options` VALUES (1,1,'site',0,'numsections','1');
/*!40000 ALTER TABLE `mdl_course_format_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules`
--

DROP TABLE IF EXISTS `mdl_course_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules`
--

LOCK TABLES `mdl_course_modules` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_completion`
--

DROP TABLE IF EXISTS `mdl_course_modules_completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_completion`
--

LOCK TABLES `mdl_course_modules_completion` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_completion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_published`
--

DROP TABLE IF EXISTS `mdl_course_published`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_published`
--

LOCK TABLES `mdl_course_published` WRITE;
/*!40000 ALTER TABLE `mdl_course_published` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_published` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_request`
--

DROP TABLE IF EXISTS `mdl_course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_request`
--

LOCK TABLES `mdl_course_request` WRITE;
/*!40000 ALTER TABLE `mdl_course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections`
--

DROP TABLE IF EXISTS `mdl_course_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections`
--

LOCK TABLES `mdl_course_sections` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data`
--

DROP TABLE IF EXISTS `mdl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `manageapproved` smallint(4) NOT NULL DEFAULT '1',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data`
--

LOCK TABLES `mdl_data` WRITE;
/*!40000 ALTER TABLE `mdl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_content`
--

DROP TABLE IF EXISTS `mdl_data_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_content`
--

LOCK TABLES `mdl_data_content` WRITE;
/*!40000 ALTER TABLE `mdl_data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_fields`
--

DROP TABLE IF EXISTS `mdl_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_fields`
--

LOCK TABLES `mdl_data_fields` WRITE;
/*!40000 ALTER TABLE `mdl_data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_records`
--

DROP TABLE IF EXISTS `mdl_data_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_records`
--

LOCK TABLES `mdl_data_records` WRITE;
/*!40000 ALTER TABLE `mdl_data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_editor_atto_autosave`
--

DROP TABLE IF EXISTS `mdl_editor_atto_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `elementid` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Draft text that is auto-saved every 5 seconds while an edito';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_editor_atto_autosave`
--

LOCK TABLES `mdl_editor_atto_autosave` WRITE;
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol`
--

DROP TABLE IF EXISTS `mdl_enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol`
--

LOCK TABLES `mdl_enrol` WRITE;
/*!40000 ALTER TABLE `mdl_enrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_flatfile`
--

DROP TABLE IF EXISTS `mdl_enrol_flatfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_flatfile`
--

LOCK TABLES `mdl_enrol_flatfile` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_tools`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_tools` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrolid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `institution` varchar(40) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `maxenrolled` bigint(10) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `gradesync` tinyint(1) NOT NULL DEFAULT '0',
  `gradesynccompletion` tinyint(1) NOT NULL DEFAULT '0',
  `membersync` tinyint(1) NOT NULL DEFAULT '0',
  `membersyncmode` tinyint(1) NOT NULL DEFAULT '0',
  `roleinstructor` bigint(10) NOT NULL,
  `rolelearner` bigint(10) NOT NULL,
  `secret` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltitool_enr_ix` (`enrolid`),
  KEY `mdl_enroltitool_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of tools provided to the remote system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_tools`
--

LOCK TABLES `mdl_enrol_lti_tools` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_lti_users`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_lti_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `toolid` bigint(10) NOT NULL,
  `serviceurl` longtext,
  `sourceid` longtext,
  `consumerkey` longtext,
  `consumersecret` longtext,
  `membershipsurl` longtext,
  `membershipsid` longtext,
  `lastgrade` decimal(10,5) DEFAULT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltiuser_use_ix` (`userid`),
  KEY `mdl_enroltiuser_too_ix` (`toolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User access log and gradeback data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_lti_users`
--

LOCK TABLES `mdl_enrol_lti_users` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_lti_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_lti_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_paypal`
--

DROP TABLE IF EXISTS `mdl_enrol_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_paypal`
--

LOCK TABLES `mdl_enrol_paypal` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event`
--

DROP TABLE IF EXISTS `mdl_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event`
--

LOCK TABLES `mdl_event` WRITE;
/*!40000 ALTER TABLE `mdl_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event_subscriptions`
--

DROP TABLE IF EXISTS `mdl_event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks subscriptions to remote calendars.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event_subscriptions`
--

LOCK TABLES `mdl_event_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_handlers`
--

DROP TABLE IF EXISTS `mdl_events_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_handlers`
--

LOCK TABLES `mdl_events_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue`
--

DROP TABLE IF EXISTS `mdl_events_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue`
--

LOCK TABLES `mdl_events_queue` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue_handlers`
--

DROP TABLE IF EXISTS `mdl_events_queue_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue_handlers`
--

LOCK TABLES `mdl_events_queue_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_functions`
--

DROP TABLE IF EXISTS `mdl_external_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  `services` varchar(1333) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COMMENT='list of all external functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_functions`
--

LOCK TABLES `mdl_external_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_functions` VALUES (1,'core_badges_get_user_badges','core_badges_external','get_user_badges',NULL,'moodle','moodle/badges:viewotherbadges','moodle_mobile_app'),(2,'core_calendar_create_calendar_events','core_calendar_external','create_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries',NULL),(3,'core_calendar_delete_calendar_events','core_calendar_external','delete_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries',NULL),(4,'core_calendar_get_calendar_events','core_calendar_external','get_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries','moodle_mobile_app'),(5,'core_cohort_add_cohort_members','core_cohort_external','add_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign',NULL),(6,'core_cohort_create_cohorts','core_cohort_external','create_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage',NULL),(7,'core_cohort_delete_cohort_members','core_cohort_external','delete_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign',NULL),(8,'core_cohort_delete_cohorts','core_cohort_external','delete_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage',NULL),(9,'core_cohort_get_cohort_members','core_cohort_external','get_cohort_members','cohort/externallib.php','moodle','moodle/cohort:view',NULL),(10,'core_cohort_get_cohorts','core_cohort_external','get_cohorts','cohort/externallib.php','moodle','moodle/cohort:view',NULL),(11,'core_cohort_update_cohorts','core_cohort_external','update_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage',NULL),(12,'core_comment_get_comments','core_comment_external','get_comments',NULL,'moodle','moodle/comment:view','moodle_mobile_app'),(13,'core_completion_get_activities_completion_status','core_completion_external','get_activities_completion_status',NULL,'moodle','','moodle_mobile_app'),(14,'core_completion_get_course_completion_status','core_completion_external','get_course_completion_status',NULL,'moodle','report/completion:view','moodle_mobile_app'),(15,'core_completion_mark_course_self_completed','core_completion_external','mark_course_self_completed',NULL,'moodle','','moodle_mobile_app'),(16,'core_completion_update_activity_completion_status_manually','core_completion_external','update_activity_completion_status_manually',NULL,'moodle','','moodle_mobile_app'),(17,'core_course_create_categories','core_course_external','create_categories','course/externallib.php','moodle','moodle/category:manage',NULL),(18,'core_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create, moodle/course:visibility',NULL),(19,'core_course_delete_categories','core_course_external','delete_categories','course/externallib.php','moodle','moodle/category:manage',NULL),(20,'core_course_delete_courses','core_course_external','delete_courses','course/externallib.php','moodle','moodle/course:delete',NULL),(21,'core_course_delete_modules','core_course_external','delete_modules','course/externallib.php','moodle','moodle/course:manageactivities',NULL),(22,'core_course_duplicate_course','core_course_external','duplicate_course','course/externallib.php','moodle','moodle/backup:backupcourse, moodle/restore:restorecourse, moodle/course:create',NULL),(23,'core_course_get_categories','core_course_external','get_categories','course/externallib.php','moodle','moodle/category:viewhiddencategories',NULL),(24,'core_course_get_contents','core_course_external','get_course_contents','course/externallib.php','moodle','moodle/course:update, moodle/course:viewhiddencourses','moodle_mobile_app'),(25,'core_course_get_course_module','core_course_external','get_course_module','course/externallib.php','moodle','','moodle_mobile_app'),(26,'core_course_get_course_module_by_instance','core_course_external','get_course_module_by_instance','course/externallib.php','moodle','','moodle_mobile_app'),(27,'core_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view, moodle/course:update, moodle/course:viewhiddencourses','moodle_mobile_app'),(28,'core_course_import_course','core_course_external','import_course','course/externallib.php','moodle','moodle/backup:backuptargetimport, moodle/restore:restoretargetimport',NULL),(29,'core_course_search_courses','core_course_external','search_courses','course/externallib.php','moodle','','moodle_mobile_app'),(30,'core_course_update_categories','core_course_external','update_categories','course/externallib.php','moodle','moodle/category:manage',NULL),(31,'core_course_update_courses','core_course_external','update_courses','course/externallib.php','moodle','moodle/course:update, moodle/course:changecategory, moodle/course:changefullname, moodle/course:changeshortname, moodle/course:changeidnumber, moodle/course:changesummary, moodle/course:visibility',NULL),(32,'core_course_view_course','core_course_external','view_course','course/externallib.php','moodle','','moodle_mobile_app'),(33,'core_enrol_get_course_enrolment_methods','core_enrol_external','get_course_enrolment_methods','enrol/externallib.php','moodle','','moodle_mobile_app'),(34,'core_enrol_get_enrolled_users','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups','moodle_mobile_app'),(35,'core_enrol_get_enrolled_users_with_capability','core_enrol_external','get_enrolled_users_with_capability','enrol/externallib.php','moodle','',NULL),(36,'core_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants','moodle_mobile_app'),(37,'core_fetch_notifications','core_external','fetch_notifications','lib/external/externallib.php','moodle','',NULL),(38,'core_files_get_files','core_files_external','get_files','files/externallib.php','moodle','','moodle_mobile_app'),(39,'core_files_upload','core_files_external','upload','files/externallib.php','moodle','',NULL),(40,'core_get_component_strings','core_external','get_component_strings','lib/external/externallib.php','moodle','','moodle_mobile_app'),(41,'core_get_fragment','core_external','get_fragment','lib/external/externallib.php','moodle','',NULL),(42,'core_get_string','core_external','get_string','lib/external/externallib.php','moodle','',NULL),(43,'core_get_strings','core_external','get_strings','lib/external/externallib.php','moodle','',NULL),(44,'core_grades_get_grades','core_grades_external','get_grades',NULL,'moodle','moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden',NULL),(45,'core_grades_update_grades','core_grades_external','update_grades',NULL,'moodle','','moodle_mobile_app'),(46,'core_grading_get_definitions','core_grading_external','get_definitions',NULL,'moodle','',NULL),(47,'core_grading_get_gradingform_instances','core_grading_external','get_gradingform_instances',NULL,'moodle','',NULL),(48,'core_grading_save_definitions','core_grading_external','save_definitions',NULL,'moodle','',NULL),(49,'core_group_add_group_members','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups',NULL),(50,'core_group_assign_grouping','core_group_external','assign_grouping','group/externallib.php','moodle','',NULL),(51,'core_group_create_groupings','core_group_external','create_groupings','group/externallib.php','moodle','',NULL),(52,'core_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups',NULL),(53,'core_group_delete_group_members','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups',NULL),(54,'core_group_delete_groupings','core_group_external','delete_groupings','group/externallib.php','moodle','',NULL),(55,'core_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups',NULL),(56,'core_group_get_activity_allowed_groups','core_group_external','get_activity_allowed_groups','group/externallib.php','moodle','','moodle_mobile_app'),(57,'core_group_get_activity_groupmode','core_group_external','get_activity_groupmode','group/externallib.php','moodle','','moodle_mobile_app'),(58,'core_group_get_course_groupings','core_group_external','get_course_groupings','group/externallib.php','moodle','',NULL),(59,'core_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups',NULL),(60,'core_group_get_course_user_groups','core_group_external','get_course_user_groups','group/externallib.php','moodle','moodle/course:managegroups','moodle_mobile_app'),(61,'core_group_get_group_members','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups',NULL),(62,'core_group_get_groupings','core_group_external','get_groupings','group/externallib.php','moodle','',NULL),(63,'core_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups',NULL),(64,'core_group_unassign_grouping','core_group_external','unassign_grouping','group/externallib.php','moodle','',NULL),(65,'core_group_update_groupings','core_group_external','update_groupings','group/externallib.php','moodle','',NULL),(66,'core_message_block_contacts','core_message_external','block_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(67,'core_message_create_contacts','core_message_external','create_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(68,'core_message_delete_contacts','core_message_external','delete_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(69,'core_message_delete_message','core_message_external','delete_message','message/externallib.php','moodle','moodle/site:deleteownmessage','moodle_mobile_app'),(70,'core_message_get_blocked_users','core_message_external','get_blocked_users','message/externallib.php','moodle','','moodle_mobile_app'),(71,'core_message_get_contacts','core_message_external','get_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(72,'core_message_get_messages','core_message_external','get_messages','message/externallib.php','moodle','','moodle_mobile_app'),(73,'core_message_mark_message_read','core_message_external','mark_message_read','message/externallib.php','moodle','','moodle_mobile_app'),(74,'core_message_search_contacts','core_message_external','search_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(75,'core_message_send_instant_messages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage','moodle_mobile_app'),(76,'core_message_unblock_contacts','core_message_external','unblock_contacts','message/externallib.php','moodle','','moodle_mobile_app'),(77,'core_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage','moodle_mobile_app'),(78,'core_notes_delete_notes','core_notes_external','delete_notes','notes/externallib.php','moodle','moodle/notes:manage','moodle_mobile_app'),(79,'core_notes_get_course_notes','core_notes_external','get_course_notes','notes/externallib.php','moodle','moodle/notes:view','moodle_mobile_app'),(80,'core_notes_get_notes','core_notes_external','get_notes','notes/externallib.php','moodle','moodle/notes:view',NULL),(81,'core_notes_update_notes','core_notes_external','update_notes','notes/externallib.php','moodle','moodle/notes:manage',NULL),(82,'core_notes_view_notes','core_notes_external','view_notes','notes/externallib.php','moodle','moodle/notes:view','moodle_mobile_app'),(83,'core_output_load_template','core\\output\\external','load_template',NULL,'moodle','',NULL),(84,'core_question_update_flag','core_question_external','update_flag',NULL,'moodle','moodle/question:flag','moodle_mobile_app'),(85,'core_rating_get_item_ratings','core_rating_external','get_item_ratings',NULL,'moodle','moodle/rating:view','moodle_mobile_app'),(86,'core_role_assign_roles','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign',NULL),(87,'core_role_unassign_roles','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign',NULL),(88,'core_tag_get_tagindex','core_tag_external','get_tagindex',NULL,'moodle','',NULL),(89,'core_tag_get_tags','core_tag_external','get_tags',NULL,'moodle','',NULL),(90,'core_tag_update_tags','core_tag_external','update_tags',NULL,'moodle','',NULL),(91,'core_update_inplace_editable','core_external','update_inplace_editable','lib/external/externallib.php','moodle','',NULL),(92,'core_user_add_user_device','core_user_external','add_user_device','user/externallib.php','moodle','','moodle_mobile_app'),(93,'core_user_add_user_private_files','core_user_external','add_user_private_files','user/externallib.php','moodle','moodle/user:manageownfiles','moodle_mobile_app'),(94,'core_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create',NULL),(95,'core_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete',NULL),(96,'core_user_get_course_user_profiles','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups','moodle_mobile_app'),(97,'core_user_get_users','core_user_external','get_users','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update',NULL),(98,'core_user_get_users_by_field','core_user_external','get_users_by_field','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update','moodle_mobile_app'),(99,'core_user_remove_user_device','core_user_external','remove_user_device','user/externallib.php','moodle','','moodle_mobile_app'),(100,'core_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update',NULL),(101,'core_user_view_user_list','core_user_external','view_user_list','user/externallib.php','moodle','moodle/course:viewparticipants','moodle_mobile_app'),(102,'core_user_view_user_profile','core_user_external','view_user_profile','user/externallib.php','moodle','moodle/user:viewdetails','moodle_mobile_app'),(103,'core_competency_create_competency_framework','core_competency\\external','create_competency_framework',NULL,'moodle','moodle/competency:competencymanage',NULL),(104,'core_competency_read_competency_framework','core_competency\\external','read_competency_framework',NULL,'moodle','moodle/competency:competencyview',NULL),(105,'core_competency_duplicate_competency_framework','core_competency\\external','duplicate_competency_framework',NULL,'moodle','moodle/competency:competencymanage',NULL),(106,'core_competency_delete_competency_framework','core_competency\\external','delete_competency_framework',NULL,'moodle','moodle/competency:competencymanage',NULL),(107,'core_competency_update_competency_framework','core_competency\\external','update_competency_framework',NULL,'moodle','moodle/competency:competencymanage',NULL),(108,'core_competency_list_competency_frameworks','core_competency\\external','list_competency_frameworks',NULL,'moodle','moodle/competency:competencyview',NULL),(109,'core_competency_count_competency_frameworks','core_competency\\external','count_competency_frameworks',NULL,'moodle','moodle/competency:competencyview',NULL),(110,'core_competency_competency_framework_viewed','core_competency\\external','competency_framework_viewed',NULL,'moodle','moodle/competency:competencyview',NULL),(111,'core_competency_create_competency','core_competency\\external','create_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(112,'core_competency_read_competency','core_competency\\external','read_competency',NULL,'moodle','moodle/competency:competencyview',NULL),(113,'core_competency_competency_viewed','core_competency\\external','competency_viewed',NULL,'moodle','moodle/competency:competencyview','moodle_mobile_app'),(114,'core_competency_delete_competency','core_competency\\external','delete_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(115,'core_competency_update_competency','core_competency\\external','update_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(116,'core_competency_list_competencies','core_competency\\external','list_competencies',NULL,'moodle','moodle/competency:competencyview',NULL),(117,'core_competency_list_competencies_in_template','core_competency\\external','list_competencies_in_template',NULL,'moodle','moodle/competency:competencyview',NULL),(118,'core_competency_count_competencies','core_competency\\external','count_competencies',NULL,'moodle','moodle/competency:competencyview',NULL),(119,'core_competency_count_competencies_in_template','core_competency\\external','count_competencies_in_template',NULL,'moodle','moodle/competency:competencyview',NULL),(120,'core_competency_search_competencies','core_competency\\external','search_competencies',NULL,'moodle','moodle/competency:competencyview',NULL),(121,'core_competency_set_parent_competency','core_competency\\external','set_parent_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(122,'core_competency_move_up_competency','core_competency\\external','move_up_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(123,'core_competency_move_down_competency','core_competency\\external','move_down_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(124,'core_competency_list_course_competencies','core_competency\\external','list_course_competencies',NULL,'moodle','moodle/competency:coursecompetencyview','moodle_mobile_app'),(125,'core_competency_count_competencies_in_course','core_competency\\external','count_competencies_in_course',NULL,'moodle','moodle/competency:coursecompetencyview',NULL),(126,'core_competency_count_courses_using_competency','core_competency\\external','count_courses_using_competency',NULL,'moodle','moodle/competency:coursecompetencyview',NULL),(127,'core_competency_add_competency_to_course','core_competency\\external','add_competency_to_course',NULL,'moodle','moodle/competency:coursecompetencymanage',NULL),(128,'core_competency_add_competency_to_template','core_competency\\external','add_competency_to_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(129,'core_competency_remove_competency_from_course','core_competency\\external','remove_competency_from_course',NULL,'moodle','moodle/competency:coursecompetencymanage',NULL),(130,'core_competency_set_course_competency_ruleoutcome','core_competency\\external','set_course_competency_ruleoutcome',NULL,'moodle','moodle/competency:coursecompetencymanage',NULL),(131,'core_competency_remove_competency_from_template','core_competency\\external','remove_competency_from_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(132,'core_competency_reorder_course_competency','core_competency\\external','reorder_course_competency',NULL,'moodle','moodle/competency:coursecompetencymanage',NULL),(133,'core_competency_reorder_template_competency','core_competency\\external','reorder_template_competency',NULL,'moodle','moodle/competency:templatemanage',NULL),(134,'core_competency_create_template','core_competency\\external','create_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(135,'core_competency_duplicate_template','core_competency\\external','duplicate_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(136,'core_competency_read_template','core_competency\\external','read_template',NULL,'moodle','moodle/competency:templateview',NULL),(137,'core_competency_delete_template','core_competency\\external','delete_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(138,'core_competency_update_template','core_competency\\external','update_template',NULL,'moodle','moodle/competency:templatemanage',NULL),(139,'core_competency_list_templates','core_competency\\external','list_templates',NULL,'moodle','moodle/competency:templateview',NULL),(140,'core_competency_list_templates_using_competency','core_competency\\external','list_templates_using_competency',NULL,'moodle','moodle/competency:templateview',NULL),(141,'core_competency_count_templates','core_competency\\external','count_templates',NULL,'moodle','moodle/competency:templateview',NULL),(142,'core_competency_count_templates_using_competency','core_competency\\external','count_templates_using_competency',NULL,'moodle','moodle/competency:templateview',NULL),(143,'core_competency_create_plan','core_competency\\external','create_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(144,'core_competency_update_plan','core_competency\\external','update_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(145,'core_competency_complete_plan','core_competency\\external','complete_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(146,'core_competency_reopen_plan','core_competency\\external','reopen_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(147,'core_competency_read_plan','core_competency\\external','read_plan',NULL,'moodle','moodle/competency:planviewown',NULL),(148,'core_competency_delete_plan','core_competency\\external','delete_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(149,'core_competency_list_user_plans','core_competency\\external','list_user_plans',NULL,'moodle','moodle/competency:planviewown',NULL),(150,'core_competency_list_plan_competencies','core_competency\\external','list_plan_competencies',NULL,'moodle','moodle/competency:planviewown',NULL),(151,'core_competency_add_competency_to_plan','core_competency\\external','add_competency_to_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(152,'core_competency_remove_competency_from_plan','core_competency\\external','remove_competency_from_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(153,'core_competency_reorder_plan_competency','core_competency\\external','reorder_plan_competency',NULL,'moodle','moodle/competency:planmanage',NULL),(154,'core_competency_plan_request_review','core_competency\\external','plan_request_review',NULL,'moodle','moodle/competency:planmanagedraft',NULL),(155,'core_competency_plan_start_review','core_competency\\external','plan_start_review',NULL,'moodle','moodle/competency:planmanage',NULL),(156,'core_competency_plan_stop_review','core_competency\\external','plan_stop_review',NULL,'moodle','moodle/competency:planmanage',NULL),(157,'core_competency_plan_cancel_review_request','core_competency\\external','plan_cancel_review_request',NULL,'moodle','moodle/competency:planmanagedraft',NULL),(158,'core_competency_approve_plan','core_competency\\external','approve_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(159,'core_competency_unapprove_plan','core_competency\\external','unapprove_plan',NULL,'moodle','moodle/competency:planmanage',NULL),(160,'core_competency_template_has_related_data','core_competency\\external','template_has_related_data',NULL,'moodle','moodle/competency:templateview',NULL),(161,'core_competency_get_scale_values','core_competency\\external','get_scale_values',NULL,'moodle','moodle/competency:competencymanage','moodle_mobile_app'),(162,'core_competency_add_related_competency','core_competency\\external','add_related_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(163,'core_competency_remove_related_competency','core_competency\\external','remove_related_competency',NULL,'moodle','moodle/competency:competencymanage',NULL),(164,'core_competency_read_user_evidence','core_competency\\external','read_user_evidence',NULL,'moodle','moodle/competency:userevidenceview',NULL),(165,'core_competency_delete_user_evidence','core_competency\\external','delete_user_evidence',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(166,'core_competency_create_user_evidence_competency','core_competency\\external','create_user_evidence_competency',NULL,'moodle','moodle/competency:userevidencemanageown, moodle/competency:competencyview',NULL),(167,'core_competency_delete_user_evidence_competency','core_competency\\external','delete_user_evidence_competency',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(168,'core_competency_user_competency_cancel_review_request','core_competency\\external','user_competency_cancel_review_request',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(169,'core_competency_user_competency_request_review','core_competency\\external','user_competency_request_review',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(170,'core_competency_user_competency_start_review','core_competency\\external','user_competency_start_review',NULL,'moodle','moodle/competency:competencygrade',NULL),(171,'core_competency_user_competency_stop_review','core_competency\\external','user_competency_stop_review',NULL,'moodle','moodle/competency:competencygrade',NULL),(172,'core_competency_user_competency_viewed','core_competency\\external','user_competency_viewed',NULL,'moodle','moodle/competency:usercompetencyview','moodle_mobile_app'),(173,'core_competency_user_competency_viewed_in_plan','core_competency\\external','user_competency_viewed_in_plan',NULL,'moodle','moodle/competency:usercompetencyview','moodle_mobile_app'),(174,'core_competency_user_competency_viewed_in_course','core_competency\\external','user_competency_viewed_in_course',NULL,'moodle','moodle/competency:usercompetencyview','moodle_mobile_app'),(175,'core_competency_user_competency_plan_viewed','core_competency\\external','user_competency_plan_viewed',NULL,'moodle','moodle/competency:usercompetencyview','moodle_mobile_app'),(176,'core_competency_grade_competency','core_competency\\external','grade_competency',NULL,'moodle','moodle/competency:competencygrade',NULL),(177,'core_competency_grade_competency_in_plan','core_competency\\external','grade_competency_in_plan',NULL,'moodle','moodle/competency:competencygrade',NULL),(178,'core_competency_grade_competency_in_course','core_competency\\external','grade_competency_in_course',NULL,'moodle','moodle/competency:competencygrade','moodle_mobile_app'),(179,'core_competency_unlink_plan_from_template','core_competency\\external','unlink_plan_from_template',NULL,'moodle','moodle/competency:planmanage',NULL),(180,'core_competency_template_viewed','core_competency\\external','template_viewed',NULL,'moodle','moodle/competency:templateview',NULL),(181,'core_competency_request_review_of_user_evidence_linked_competencies','core_competency\\external','request_review_of_user_evidence_linked_competencies',NULL,'moodle','moodle/competency:userevidencemanageown',NULL),(182,'core_competency_update_course_competency_settings','core_competency\\external','update_course_competency_settings',NULL,'moodle','moodle/competency:coursecompetencyconfigure',NULL),(183,'core_competency_delete_evidence','core_competency\\external','delete_evidence',NULL,'moodle','moodle/competency:evidencedelete','moodle_mobile_app'),(184,'core_webservice_get_site_info','core_webservice_external','get_site_info','webservice/externallib.php','moodle','','moodle_mobile_app'),(185,'mod_assign_get_grades','mod_assign_external','get_grades','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(186,'mod_assign_get_assignments','mod_assign_external','get_assignments','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(187,'mod_assign_get_submissions','mod_assign_external','get_submissions','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(188,'mod_assign_get_user_flags','mod_assign_external','get_user_flags','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(189,'mod_assign_set_user_flags','mod_assign_external','set_user_flags','mod/assign/externallib.php','mod_assign','mod/assign:grade','moodle_mobile_app'),(190,'mod_assign_get_user_mappings','mod_assign_external','get_user_mappings','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(191,'mod_assign_revert_submissions_to_draft','mod_assign_external','revert_submissions_to_draft','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(192,'mod_assign_lock_submissions','mod_assign_external','lock_submissions','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(193,'mod_assign_unlock_submissions','mod_assign_external','unlock_submissions','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(194,'mod_assign_save_submission','mod_assign_external','save_submission','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(195,'mod_assign_submit_for_grading','mod_assign_external','submit_for_grading','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(196,'mod_assign_save_grade','mod_assign_external','save_grade','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(197,'mod_assign_save_grades','mod_assign_external','save_grades','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(198,'mod_assign_save_user_extensions','mod_assign_external','save_user_extensions','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(199,'mod_assign_reveal_identities','mod_assign_external','reveal_identities','mod/assign/externallib.php','mod_assign','','moodle_mobile_app'),(200,'mod_assign_view_grading_table','mod_assign_external','view_grading_table','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:viewgrades','moodle_mobile_app'),(201,'mod_assign_view_submission_status','mod_assign_external','view_submission_status','mod/assign/externallib.php','mod_assign','mod/assign:view','moodle_mobile_app'),(202,'mod_assign_get_submission_status','mod_assign_external','get_submission_status','mod/assign/externallib.php','mod_assign','mod/assign:view','moodle_mobile_app'),(203,'mod_assign_list_participants','mod_assign_external','list_participants','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:viewgrades',NULL),(204,'mod_assign_submit_grading_form','mod_assign_external','submit_grading_form','mod/assign/externallib.php','mod_assign','mod/assign:grade',NULL),(205,'mod_assign_get_participant','mod_assign_external','get_participant','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:viewgrades',NULL),(206,'mod_book_view_book','mod_book_external','view_book',NULL,'mod_book','mod/book:read','moodle_mobile_app'),(207,'mod_book_get_books_by_courses','mod_book_external','get_books_by_courses',NULL,'mod_book','','moodle_mobile_app'),(208,'mod_chat_login_user','mod_chat_external','login_user',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(209,'mod_chat_get_chat_users','mod_chat_external','get_chat_users',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(210,'mod_chat_send_chat_message','mod_chat_external','send_chat_message',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(211,'mod_chat_get_chat_latest_messages','mod_chat_external','get_chat_latest_messages',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(212,'mod_chat_view_chat','mod_chat_external','view_chat',NULL,'mod_chat','mod/chat:chat','moodle_mobile_app'),(213,'mod_chat_get_chats_by_courses','mod_chat_external','get_chats_by_courses',NULL,'mod_chat','','moodle_mobile_app'),(214,'mod_choice_get_choice_results','mod_choice_external','get_choice_results',NULL,'mod_choice','','moodle_mobile_app'),(215,'mod_choice_get_choice_options','mod_choice_external','get_choice_options',NULL,'mod_choice','mod/choice:choose','moodle_mobile_app'),(216,'mod_choice_submit_choice_response','mod_choice_external','submit_choice_response',NULL,'mod_choice','mod/choice:choose','moodle_mobile_app'),(217,'mod_choice_view_choice','mod_choice_external','view_choice',NULL,'mod_choice','','moodle_mobile_app'),(218,'mod_choice_get_choices_by_courses','mod_choice_external','get_choices_by_courses',NULL,'mod_choice','','moodle_mobile_app'),(219,'mod_choice_delete_choice_responses','mod_choice_external','delete_choice_responses',NULL,'mod_choice','mod/choice:choose','moodle_mobile_app'),(220,'mod_data_get_databases_by_courses','mod_data_external','get_databases_by_courses',NULL,'mod_data','mod/data:viewentry','moodle_mobile_app'),(221,'mod_folder_view_folder','mod_folder_external','view_folder',NULL,'mod_folder','mod/folder:view','moodle_mobile_app'),(222,'mod_forum_get_forums_by_courses','mod_forum_external','get_forums_by_courses','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion','moodle_mobile_app'),(223,'mod_forum_get_forum_discussion_posts','mod_forum_external','get_forum_discussion_posts','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting','moodle_mobile_app'),(224,'mod_forum_get_forum_discussions_paginated','mod_forum_external','get_forum_discussions_paginated','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting','moodle_mobile_app'),(225,'mod_forum_view_forum','mod_forum_external','view_forum','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion','moodle_mobile_app'),(226,'mod_forum_view_forum_discussion','mod_forum_external','view_forum_discussion','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion','moodle_mobile_app'),(227,'mod_forum_add_discussion_post','mod_forum_external','add_discussion_post','mod/forum/externallib.php','mod_forum','mod/forum:replypost','moodle_mobile_app'),(228,'mod_forum_add_discussion','mod_forum_external','add_discussion','mod/forum/externallib.php','mod_forum','mod/forum:startdiscussion','moodle_mobile_app'),(229,'mod_forum_can_add_discussion','mod_forum_external','can_add_discussion','mod/forum/externallib.php','mod_forum','','moodle_mobile_app'),(230,'mod_glossary_get_glossaries_by_courses','mod_glossary_external','get_glossaries_by_courses',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(231,'mod_glossary_view_glossary','mod_glossary_external','view_glossary',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(232,'mod_glossary_view_entry','mod_glossary_external','view_entry',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(233,'mod_glossary_get_entries_by_letter','mod_glossary_external','get_entries_by_letter',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(234,'mod_glossary_get_entries_by_date','mod_glossary_external','get_entries_by_date',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(235,'mod_glossary_get_categories','mod_glossary_external','get_categories',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(236,'mod_glossary_get_entries_by_category','mod_glossary_external','get_entries_by_category',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(237,'mod_glossary_get_authors','mod_glossary_external','get_authors',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(238,'mod_glossary_get_entries_by_author','mod_glossary_external','get_entries_by_author',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(239,'mod_glossary_get_entries_by_author_id','mod_glossary_external','get_entries_by_author_id',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(240,'mod_glossary_get_entries_by_search','mod_glossary_external','get_entries_by_search',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(241,'mod_glossary_get_entries_by_term','mod_glossary_external','get_entries_by_term',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(242,'mod_glossary_get_entries_to_approve','mod_glossary_external','get_entries_to_approve',NULL,'mod_glossary','mod/glossary:approve','moodle_mobile_app'),(243,'mod_glossary_get_entry_by_id','mod_glossary_external','get_entry_by_id',NULL,'mod_glossary','mod/glossary:view','moodle_mobile_app'),(244,'mod_imscp_view_imscp','mod_imscp_external','view_imscp',NULL,'mod_imscp','mod/imscp:view','moodle_mobile_app'),(245,'mod_imscp_get_imscps_by_courses','mod_imscp_external','get_imscps_by_courses',NULL,'mod_imscp','mod/imscp:view','moodle_mobile_app'),(246,'mod_lti_get_tool_launch_data','mod_lti_external','get_tool_launch_data',NULL,'mod_lti','mod/lti:view','moodle_mobile_app'),(247,'mod_lti_get_ltis_by_courses','mod_lti_external','get_ltis_by_courses',NULL,'mod_lti','mod/lti:view','moodle_mobile_app'),(248,'mod_lti_view_lti','mod_lti_external','view_lti',NULL,'mod_lti','mod/lti:view','moodle_mobile_app'),(249,'mod_lti_get_tool_proxies','mod_lti_external','get_tool_proxies',NULL,'mod_lti','moodle/site:config',NULL),(250,'mod_lti_create_tool_proxy','mod_lti_external','create_tool_proxy',NULL,'mod_lti','moodle/site:config',NULL),(251,'mod_lti_delete_tool_proxy','mod_lti_external','delete_tool_proxy',NULL,'mod_lti','moodle/site:config',NULL),(252,'mod_lti_get_tool_proxy_registration_request','mod_lti_external','get_tool_proxy_registration_request',NULL,'mod_lti','moodle/site:config',NULL),(253,'mod_lti_get_tool_types','mod_lti_external','get_tool_types',NULL,'mod_lti','moodle/site:config',NULL),(254,'mod_lti_create_tool_type','mod_lti_external','create_tool_type',NULL,'mod_lti','moodle/site:config',NULL),(255,'mod_lti_update_tool_type','mod_lti_external','update_tool_type',NULL,'mod_lti','moodle/site:config',NULL),(256,'mod_lti_delete_tool_type','mod_lti_external','delete_tool_type',NULL,'mod_lti','moodle/site:config',NULL),(257,'mod_lti_is_cartridge','mod_lti_external','is_cartridge',NULL,'mod_lti','moodle/site:config',NULL),(258,'mod_page_view_page','mod_page_external','view_page',NULL,'mod_page','mod/page:view','moodle_mobile_app'),(259,'mod_quiz_get_quizzes_by_courses','mod_quiz_external','get_quizzes_by_courses',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(260,'mod_quiz_view_quiz','mod_quiz_external','view_quiz',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(261,'mod_quiz_get_user_attempts','mod_quiz_external','get_user_attempts',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(262,'mod_quiz_get_user_best_grade','mod_quiz_external','get_user_best_grade',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(263,'mod_quiz_get_combined_review_options','mod_quiz_external','get_combined_review_options',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(264,'mod_quiz_start_attempt','mod_quiz_external','start_attempt',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(265,'mod_quiz_get_attempt_data','mod_quiz_external','get_attempt_data',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(266,'mod_quiz_get_attempt_summary','mod_quiz_external','get_attempt_summary',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(267,'mod_quiz_save_attempt','mod_quiz_external','save_attempt',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(268,'mod_quiz_process_attempt','mod_quiz_external','process_attempt',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(269,'mod_quiz_get_attempt_review','mod_quiz_external','get_attempt_review',NULL,'mod_quiz','mod/quiz:reviewmyattempts','moodle_mobile_app'),(270,'mod_quiz_view_attempt','mod_quiz_external','view_attempt',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(271,'mod_quiz_view_attempt_summary','mod_quiz_external','view_attempt_summary',NULL,'mod_quiz','mod/quiz:attempt','moodle_mobile_app'),(272,'mod_quiz_view_attempt_review','mod_quiz_external','view_attempt_review',NULL,'mod_quiz','mod/quiz:reviewmyattempts','moodle_mobile_app'),(273,'mod_quiz_get_quiz_feedback_for_grade','mod_quiz_external','get_quiz_feedback_for_grade',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(274,'mod_quiz_get_quiz_access_information','mod_quiz_external','get_quiz_access_information',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(275,'mod_quiz_get_attempt_access_information','mod_quiz_external','get_attempt_access_information',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(276,'mod_quiz_get_quiz_required_qtypes','mod_quiz_external','get_quiz_required_qtypes',NULL,'mod_quiz','mod/quiz:view','moodle_mobile_app'),(277,'mod_resource_view_resource','mod_resource_external','view_resource',NULL,'mod_resource','mod/resource:view','moodle_mobile_app'),(278,'mod_scorm_view_scorm','mod_scorm_external','view_scorm',NULL,'mod_scorm','','moodle_mobile_app'),(279,'mod_scorm_get_scorm_attempt_count','mod_scorm_external','get_scorm_attempt_count',NULL,'mod_scorm','','moodle_mobile_app'),(280,'mod_scorm_get_scorm_scoes','mod_scorm_external','get_scorm_scoes',NULL,'mod_scorm','','moodle_mobile_app'),(281,'mod_scorm_get_scorm_user_data','mod_scorm_external','get_scorm_user_data',NULL,'mod_scorm','','moodle_mobile_app'),(282,'mod_scorm_insert_scorm_tracks','mod_scorm_external','insert_scorm_tracks',NULL,'mod_scorm','mod/scorm:savetrack','moodle_mobile_app'),(283,'mod_scorm_get_scorm_sco_tracks','mod_scorm_external','get_scorm_sco_tracks',NULL,'mod_scorm','','moodle_mobile_app'),(284,'mod_scorm_get_scorms_by_courses','mod_scorm_external','get_scorms_by_courses',NULL,'mod_scorm','','moodle_mobile_app'),(285,'mod_scorm_launch_sco','mod_scorm_external','launch_sco',NULL,'mod_scorm','','moodle_mobile_app'),(286,'mod_survey_get_surveys_by_courses','mod_survey_external','get_surveys_by_courses',NULL,'mod_survey','','moodle_mobile_app'),(287,'mod_survey_view_survey','mod_survey_external','view_survey',NULL,'mod_survey','mod/survey:participate','moodle_mobile_app'),(288,'mod_survey_get_questions','mod_survey_external','get_questions',NULL,'mod_survey','mod/survey:participate','moodle_mobile_app'),(289,'mod_survey_submit_answers','mod_survey_external','submit_answers',NULL,'mod_survey','mod/survey:participate','moodle_mobile_app'),(290,'mod_url_view_url','mod_url_external','view_url',NULL,'mod_url','mod/url:view','moodle_mobile_app'),(291,'mod_wiki_get_wikis_by_courses','mod_wiki_external','get_wikis_by_courses',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(292,'mod_wiki_view_wiki','mod_wiki_external','view_wiki',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(293,'mod_wiki_view_page','mod_wiki_external','view_page',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(294,'mod_wiki_get_subwikis','mod_wiki_external','get_subwikis',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(295,'mod_wiki_get_subwiki_pages','mod_wiki_external','get_subwiki_pages',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(296,'mod_wiki_get_subwiki_files','mod_wiki_external','get_subwiki_files',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(297,'mod_wiki_get_page_contents','mod_wiki_external','get_page_contents',NULL,'mod_wiki','mod/wiki:viewpage','moodle_mobile_app'),(298,'mod_wiki_get_page_for_editing','mod_wiki_external','get_page_for_editing',NULL,'mod_wiki','mod/wiki:editpage','moodle_mobile_app'),(299,'mod_wiki_new_page','mod_wiki_external','new_page',NULL,'mod_wiki','mod/wiki:editpage','moodle_mobile_app'),(300,'mod_wiki_edit_page','mod_wiki_external','edit_page',NULL,'mod_wiki','mod/wiki:editpage','moodle_mobile_app'),(301,'enrol_guest_get_instance_info','enrol_guest_external','get_instance_info',NULL,'enrol_guest','','moodle_mobile_app'),(302,'enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol',NULL),(303,'enrol_manual_unenrol_users','enrol_manual_external','unenrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:unenrol',NULL),(304,'enrol_self_get_instance_info','enrol_self_external','get_instance_info','enrol/self/externallib.php','enrol_self','','moodle_mobile_app'),(305,'enrol_self_enrol_user','enrol_self_external','enrol_user','enrol/self/externallib.php','enrol_self','','moodle_mobile_app'),(306,'message_airnotifier_is_system_configured','message_airnotifier_external','is_system_configured','message/output/airnotifier/externallib.php','message_airnotifier','','moodle_mobile_app'),(307,'message_airnotifier_are_notification_preferences_configured','message_airnotifier_external','are_notification_preferences_configured','message/output/airnotifier/externallib.php','message_airnotifier','','moodle_mobile_app'),(308,'report_competency_data_for_report','report_competency\\external','data_for_report',NULL,'report_competency','moodle/competency:coursecompetencyview',NULL),(309,'gradereport_user_get_grades_table','gradereport_user_external','get_grades_table','grade/report/user/externallib.php','gradereport_user','gradereport/user:view','moodle_mobile_app'),(310,'gradereport_user_view_grade_report','gradereport_user_external','view_grade_report','grade/report/user/externallib.php','gradereport_user','gradereport/user:view','moodle_mobile_app'),(311,'tool_lp_data_for_competency_frameworks_manage_page','tool_lp\\external','data_for_competency_frameworks_manage_page',NULL,'tool_lp','moodle/competency:competencyview',NULL),(312,'tool_lp_data_for_competency_summary','tool_lp\\external','data_for_competency_summary',NULL,'tool_lp','moodle/competency:competencyview',NULL),(313,'tool_lp_data_for_competencies_manage_page','tool_lp\\external','data_for_competencies_manage_page',NULL,'tool_lp','moodle/competency:competencyview',NULL),(314,'tool_lp_list_courses_using_competency','tool_lp\\external','list_courses_using_competency',NULL,'tool_lp','moodle/competency:coursecompetencyview',NULL),(315,'tool_lp_data_for_course_competencies_page','tool_lp\\external','data_for_course_competencies_page',NULL,'tool_lp','moodle/competency:coursecompetencyview','moodle_mobile_app'),(316,'tool_lp_data_for_template_competencies_page','tool_lp\\external','data_for_template_competencies_page',NULL,'tool_lp','moodle/competency:templateview',NULL),(317,'tool_lp_data_for_templates_manage_page','tool_lp\\external','data_for_templates_manage_page',NULL,'tool_lp','moodle/competency:templateview',NULL),(318,'tool_lp_data_for_plans_page','tool_lp\\external','data_for_plans_page',NULL,'tool_lp','moodle/competency:planviewown','moodle_mobile_app'),(319,'tool_lp_data_for_plan_page','tool_lp\\external','data_for_plan_page',NULL,'tool_lp','moodle/competency:planview','moodle_mobile_app'),(320,'tool_lp_data_for_related_competencies_section','tool_lp\\external','data_for_related_competencies_section',NULL,'tool_lp','moodle/competency:competencyview',NULL),(321,'tool_lp_search_users','tool_lp\\external','search_users',NULL,'tool_lp','',NULL),(322,'tool_lp_search_cohorts','tool_lp\\external','search_cohorts',NULL,'tool_lp','moodle/cohort:view',NULL),(323,'tool_lp_data_for_user_evidence_list_page','tool_lp\\external','data_for_user_evidence_list_page',NULL,'tool_lp','moodle/competency:userevidenceview','moodle_mobile_app'),(324,'tool_lp_data_for_user_evidence_page','tool_lp\\external','data_for_user_evidence_page',NULL,'tool_lp','moodle/competency:userevidenceview','moodle_mobile_app'),(325,'tool_lp_data_for_user_competency_summary','tool_lp\\external','data_for_user_competency_summary',NULL,'tool_lp','moodle/competency:planview','moodle_mobile_app'),(326,'tool_lp_data_for_user_competency_summary_in_plan','tool_lp\\external','data_for_user_competency_summary_in_plan',NULL,'tool_lp','moodle/competency:planview','moodle_mobile_app'),(327,'tool_lp_data_for_user_competency_summary_in_course','tool_lp\\external','data_for_user_competency_summary_in_course',NULL,'tool_lp','moodle/competency:coursecompetencyview','moodle_mobile_app'),(328,'tool_mobile_get_plugins_supporting_mobile','tool_mobile\\external','get_plugins_supporting_mobile',NULL,'tool_mobile','','moodle_mobile_app'),(329,'tool_templatelibrary_list_templates','tool_templatelibrary\\external','list_templates',NULL,'tool_templatelibrary','',NULL),(330,'tool_templatelibrary_load_canonical_template','tool_templatelibrary\\external','load_canonical_template',NULL,'tool_templatelibrary','',NULL);
/*!40000 ALTER TABLE `mdl_external_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services`
--

DROP TABLE IF EXISTS `mdl_external_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='built in and custom external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services`
--

LOCK TABLES `mdl_external_services` WRITE;
/*!40000 ALTER TABLE `mdl_external_services` DISABLE KEYS */;
INSERT INTO `mdl_external_services` VALUES (1,'Moodle mobile web service',0,NULL,0,'moodle',1466423547,1466423703,'moodle_mobile_app',1,1);
/*!40000 ALTER TABLE `mdl_external_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_functions`
--

DROP TABLE IF EXISTS `mdl_external_services_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_functions`
--

LOCK TABLES `mdl_external_services_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_services_functions` VALUES (1,1,'core_badges_get_user_badges'),(2,1,'core_calendar_get_calendar_events'),(3,1,'core_comment_get_comments'),(4,1,'core_completion_get_activities_completion_status'),(5,1,'core_completion_get_course_completion_status'),(6,1,'core_completion_mark_course_self_completed'),(7,1,'core_completion_update_activity_completion_status_manually'),(8,1,'core_course_get_contents'),(9,1,'core_course_get_course_module'),(10,1,'core_course_get_course_module_by_instance'),(11,1,'core_course_get_courses'),(12,1,'core_course_search_courses'),(13,1,'core_course_view_course'),(14,1,'core_enrol_get_course_enrolment_methods'),(15,1,'core_enrol_get_enrolled_users'),(16,1,'core_enrol_get_users_courses'),(17,1,'core_files_get_files'),(18,1,'core_get_component_strings'),(19,1,'core_grades_update_grades'),(20,1,'core_group_get_activity_allowed_groups'),(21,1,'core_group_get_activity_groupmode'),(22,1,'core_group_get_course_user_groups'),(23,1,'core_message_block_contacts'),(24,1,'core_message_create_contacts'),(25,1,'core_message_delete_contacts'),(26,1,'core_message_delete_message'),(27,1,'core_message_get_blocked_users'),(28,1,'core_message_get_contacts'),(29,1,'core_message_get_messages'),(30,1,'core_message_mark_message_read'),(31,1,'core_message_search_contacts'),(32,1,'core_message_send_instant_messages'),(33,1,'core_message_unblock_contacts'),(34,1,'core_notes_create_notes'),(35,1,'core_notes_delete_notes'),(36,1,'core_notes_get_course_notes'),(37,1,'core_notes_view_notes'),(38,1,'core_question_update_flag'),(39,1,'core_rating_get_item_ratings'),(40,1,'core_user_add_user_device'),(41,1,'core_user_add_user_private_files'),(42,1,'core_user_get_course_user_profiles'),(43,1,'core_user_get_users_by_field'),(44,1,'core_user_remove_user_device'),(45,1,'core_user_view_user_list'),(46,1,'core_user_view_user_profile'),(47,1,'core_competency_competency_viewed'),(48,1,'core_competency_list_course_competencies'),(49,1,'core_competency_get_scale_values'),(50,1,'core_competency_user_competency_viewed'),(51,1,'core_competency_user_competency_viewed_in_plan'),(52,1,'core_competency_user_competency_viewed_in_course'),(53,1,'core_competency_user_competency_plan_viewed'),(54,1,'core_competency_grade_competency_in_course'),(55,1,'core_competency_delete_evidence'),(56,1,'core_webservice_get_site_info'),(57,1,'mod_assign_get_grades'),(58,1,'mod_assign_get_assignments'),(59,1,'mod_assign_get_submissions'),(60,1,'mod_assign_get_user_flags'),(61,1,'mod_assign_set_user_flags'),(62,1,'mod_assign_get_user_mappings'),(63,1,'mod_assign_revert_submissions_to_draft'),(64,1,'mod_assign_lock_submissions'),(65,1,'mod_assign_unlock_submissions'),(66,1,'mod_assign_save_submission'),(67,1,'mod_assign_submit_for_grading'),(68,1,'mod_assign_save_grade'),(69,1,'mod_assign_save_grades'),(70,1,'mod_assign_save_user_extensions'),(71,1,'mod_assign_reveal_identities'),(72,1,'mod_assign_view_grading_table'),(73,1,'mod_assign_view_submission_status'),(74,1,'mod_assign_get_submission_status'),(75,1,'mod_book_view_book'),(76,1,'mod_book_get_books_by_courses'),(77,1,'mod_chat_login_user'),(78,1,'mod_chat_get_chat_users'),(79,1,'mod_chat_send_chat_message'),(80,1,'mod_chat_get_chat_latest_messages'),(81,1,'mod_chat_view_chat'),(82,1,'mod_chat_get_chats_by_courses'),(83,1,'mod_choice_get_choice_results'),(84,1,'mod_choice_get_choice_options'),(85,1,'mod_choice_submit_choice_response'),(86,1,'mod_choice_view_choice'),(87,1,'mod_choice_get_choices_by_courses'),(88,1,'mod_choice_delete_choice_responses'),(89,1,'mod_data_get_databases_by_courses'),(90,1,'mod_folder_view_folder'),(91,1,'mod_forum_get_forums_by_courses'),(92,1,'mod_forum_get_forum_discussion_posts'),(93,1,'mod_forum_get_forum_discussions_paginated'),(94,1,'mod_forum_view_forum'),(95,1,'mod_forum_view_forum_discussion'),(96,1,'mod_forum_add_discussion_post'),(97,1,'mod_forum_add_discussion'),(98,1,'mod_forum_can_add_discussion'),(99,1,'mod_glossary_get_glossaries_by_courses'),(100,1,'mod_glossary_view_glossary'),(101,1,'mod_glossary_view_entry'),(102,1,'mod_glossary_get_entries_by_letter'),(103,1,'mod_glossary_get_entries_by_date'),(104,1,'mod_glossary_get_categories'),(105,1,'mod_glossary_get_entries_by_category'),(106,1,'mod_glossary_get_authors'),(107,1,'mod_glossary_get_entries_by_author'),(108,1,'mod_glossary_get_entries_by_author_id'),(109,1,'mod_glossary_get_entries_by_search'),(110,1,'mod_glossary_get_entries_by_term'),(111,1,'mod_glossary_get_entries_to_approve'),(112,1,'mod_glossary_get_entry_by_id'),(113,1,'mod_imscp_view_imscp'),(114,1,'mod_imscp_get_imscps_by_courses'),(115,1,'mod_lti_get_tool_launch_data'),(116,1,'mod_lti_get_ltis_by_courses'),(117,1,'mod_lti_view_lti'),(118,1,'mod_page_view_page'),(119,1,'mod_quiz_get_quizzes_by_courses'),(120,1,'mod_quiz_view_quiz'),(121,1,'mod_quiz_get_user_attempts'),(122,1,'mod_quiz_get_user_best_grade'),(123,1,'mod_quiz_get_combined_review_options'),(124,1,'mod_quiz_start_attempt'),(125,1,'mod_quiz_get_attempt_data'),(126,1,'mod_quiz_get_attempt_summary'),(127,1,'mod_quiz_save_attempt'),(128,1,'mod_quiz_process_attempt'),(129,1,'mod_quiz_get_attempt_review'),(130,1,'mod_quiz_view_attempt'),(131,1,'mod_quiz_view_attempt_summary'),(132,1,'mod_quiz_view_attempt_review'),(133,1,'mod_quiz_get_quiz_feedback_for_grade'),(134,1,'mod_quiz_get_quiz_access_information'),(135,1,'mod_quiz_get_attempt_access_information'),(136,1,'mod_quiz_get_quiz_required_qtypes'),(137,1,'mod_resource_view_resource'),(138,1,'mod_scorm_view_scorm'),(139,1,'mod_scorm_get_scorm_attempt_count'),(140,1,'mod_scorm_get_scorm_scoes'),(141,1,'mod_scorm_get_scorm_user_data'),(142,1,'mod_scorm_insert_scorm_tracks'),(143,1,'mod_scorm_get_scorm_sco_tracks'),(144,1,'mod_scorm_get_scorms_by_courses'),(145,1,'mod_scorm_launch_sco'),(146,1,'mod_survey_get_surveys_by_courses'),(147,1,'mod_survey_view_survey'),(148,1,'mod_survey_get_questions'),(149,1,'mod_survey_submit_answers'),(150,1,'mod_url_view_url'),(151,1,'mod_wiki_get_wikis_by_courses'),(152,1,'mod_wiki_view_wiki'),(153,1,'mod_wiki_view_page'),(154,1,'mod_wiki_get_subwikis'),(155,1,'mod_wiki_get_subwiki_pages'),(156,1,'mod_wiki_get_subwiki_files'),(157,1,'mod_wiki_get_page_contents'),(158,1,'mod_wiki_get_page_for_editing'),(159,1,'mod_wiki_new_page'),(160,1,'mod_wiki_edit_page'),(161,1,'enrol_guest_get_instance_info'),(162,1,'enrol_self_get_instance_info'),(163,1,'enrol_self_enrol_user'),(164,1,'message_airnotifier_is_system_configured'),(165,1,'message_airnotifier_are_notification_preferences_configured'),(166,1,'gradereport_user_get_grades_table'),(167,1,'gradereport_user_view_grade_report'),(168,1,'tool_lp_data_for_course_competencies_page'),(169,1,'tool_lp_data_for_plans_page'),(170,1,'tool_lp_data_for_plan_page'),(171,1,'tool_lp_data_for_user_evidence_list_page'),(172,1,'tool_lp_data_for_user_evidence_page'),(173,1,'tool_lp_data_for_user_competency_summary'),(174,1,'tool_lp_data_for_user_competency_summary_in_plan'),(175,1,'tool_lp_data_for_user_competency_summary_in_course'),(176,1,'tool_mobile_get_plugins_supporting_mobile');
/*!40000 ALTER TABLE `mdl_external_services_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_users`
--

DROP TABLE IF EXISTS `mdl_external_services_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_users`
--

LOCK TABLES `mdl_external_services_users` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_services_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_tokens`
--

DROP TABLE IF EXISTS `mdl_external_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_tokens`
--

LOCK TABLES `mdl_external_tokens` WRITE;
/*!40000 ALTER TABLE `mdl_external_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback`
--

DROP TABLE IF EXISTS `mdl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback`
--

LOCK TABLES `mdl_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completed`
--

DROP TABLE IF EXISTS `mdl_feedback_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completed`
--

LOCK TABLES `mdl_feedback_completed` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completedtmp`
--

DROP TABLE IF EXISTS `mdl_feedback_completedtmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completedtmp`
--

LOCK TABLES `mdl_feedback_completedtmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_item`
--

DROP TABLE IF EXISTS `mdl_feedback_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_item`
--

LOCK TABLES `mdl_feedback_item` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

DROP TABLE IF EXISTS `mdl_feedback_sitecourse_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_sitecourse_map`
--

LOCK TABLES `mdl_feedback_sitecourse_map` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_template`
--

DROP TABLE IF EXISTS `mdl_feedback_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_template`
--

LOCK TABLES `mdl_feedback_template` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_value`
--

DROP TABLE IF EXISTS `mdl_feedback_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_value`
--

LOCK TABLES `mdl_feedback_value` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_valuetmp`
--

DROP TABLE IF EXISTS `mdl_feedback_valuetmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou2_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_valuetmp`
--

LOCK TABLES `mdl_feedback_valuetmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files`
--

DROP TABLE IF EXISTS `mdl_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files`
--

LOCK TABLES `mdl_files` WRITE;
/*!40000 ALTER TABLE `mdl_files` DISABLE KEYS */;
INSERT INTO `mdl_files` VALUES (1,'41cfeee5884a43a4650a851f4f85e7b28316fcc9','a48e186a2cc853a9e94e9305f4e9bc086391212d',1,'theme_more','backgroundimage',0,'/','background.jpg',2,4451,'image/jpeg',0,NULL,NULL,NULL,1466423638,1466423638,0,NULL),(2,'da39a3ee5e6b4b0d3255bfef95601890afd80709','d1da7ab1bb9c08a926037367bf8ce9a838034ead',1,'theme_more','backgroundimage',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1466423638,1466423638,0,NULL),(3,'5f8e911d0da441e36f47c5c46f4393269211ca56','508e674d49c30d4fde325fe6c7f6fd3d56b247e1',1,'assignfeedback_editpdf','stamps',0,'/','smile.png',2,1085,'image/png',0,NULL,NULL,NULL,1466423640,1466423640,0,NULL),(4,'da39a3ee5e6b4b0d3255bfef95601890afd80709','70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5',1,'assignfeedback_editpdf','stamps',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1466423640,1466423640,0,NULL),(5,'75c101cb8cb34ea573cd25ac38f8157b1de901b8','68317eab56c67d32aeaee5acf509a0c4aa828b6b',1,'assignfeedback_editpdf','stamps',0,'/','sad.png',2,966,'image/png',0,NULL,NULL,NULL,1466423640,1466423640,0,NULL),(6,'0c5190a24c3943966541401c883eacaa20ca20cb','695a55ff780e61c9e59428aa425430b0d6bde53b',1,'assignfeedback_editpdf','stamps',0,'/','tick.png',2,1039,'image/png',0,NULL,NULL,NULL,1466423640,1466423640,0,NULL),(7,'8c96a486d5801e0f4ab8c411f561f1c687e1f865','373e63af262a9b8466ba8632551520be793c37ff',1,'assignfeedback_editpdf','stamps',0,'/','cross.png',2,861,'image/png',0,NULL,NULL,NULL,1466423640,1466423640,0,NULL),(8,'5c67de5e745b3cd7dbf2327ee003eb99b7be48de','055aca6a3785672d60bddd2a90a3d36697e77245',19,'user','icon',0,'/','f1.png',NULL,11595,'image/png',0,NULL,NULL,NULL,1466423749,1466423749,0,NULL),(9,'da39a3ee5e6b4b0d3255bfef95601890afd80709','b1108b5808048572dc08acdc66df8ebffa9a9985',19,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423749,1466423749,0,NULL),(10,'6c21c8b9f3f451f4e83b0d72f790909a64d91609','4fece316dd2c8eeb0f027b1cc735e2952f57f952',19,'user','icon',0,'/','f2.png',NULL,2199,'image/png',0,NULL,NULL,NULL,1466423749,1466423749,0,NULL),(11,'ed7573e8288be41ed447a46dfa9670650af70c45','83105b4b8358ec952452a72c520c92ba475a850d',19,'user','icon',0,'/','f3.png',NULL,30662,'image/png',0,NULL,NULL,NULL,1466423749,1466423749,0,NULL),(12,'edc3a6a0f5914dd60cc4f4a110879b3dcfc90154','5c64feda27153843474e21d158fd17e40ee08bae',20,'user','icon',0,'/','f1.png',NULL,18205,'image/png',0,NULL,NULL,NULL,1466423749,1466423749,0,NULL),(13,'da39a3ee5e6b4b0d3255bfef95601890afd80709','47f017b071bb936217570076b6316ec42b4258e6',20,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423749,1466423749,0,NULL),(14,'ede5fa4e8f8c265cdfaf0604da44f951a2e0f35f','6b69c83a596b9b4f9974aabb5fb197c52b18bc98',20,'user','icon',0,'/','f2.png',NULL,3082,'image/png',0,NULL,NULL,NULL,1466423749,1466423749,0,NULL),(15,'edb4c380bd235a352ac68eb871c75a8757768233','082381a6c6c848ad140dc4d3af5e202be969bb52',20,'user','icon',0,'/','f3.png',NULL,54375,'image/png',0,NULL,NULL,NULL,1466423749,1466423749,0,NULL),(16,'093f6f0d289f06b214f47fb78ffdf2d07270fbae','51823d7ca4e077591276c36d987c0285699912c8',21,'user','icon',0,'/','f1.png',NULL,12261,'image/png',0,NULL,NULL,NULL,1466423750,1466423750,0,NULL),(17,'da39a3ee5e6b4b0d3255bfef95601890afd80709','76f2ac3ef0098aa7e37503d5239b5526f5afe2d9',21,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423750,1466423750,0,NULL),(18,'ce354d3cbc0c20e89a7afd8beea70b86912db7bf','32ca204ce40daa523ab5b0db300d3499a064480b',21,'user','icon',0,'/','f2.png',NULL,2076,'image/png',0,NULL,NULL,NULL,1466423750,1466423750,0,NULL),(19,'5842fe698d96139d88238b59d37b82b594c4bc7d','cab51a56a918888190546c14b06f0cc9b8abd218',21,'user','icon',0,'/','f3.png',NULL,31684,'image/png',0,NULL,NULL,NULL,1466423750,1466423750,0,NULL),(20,'9c577c98d75df3bfd658799749178599333d6f86','36137ae9e2466c21cb7884c2017535756c59789e',22,'user','icon',0,'/','f1.png',NULL,16571,'image/png',0,NULL,NULL,NULL,1466423750,1466423750,0,NULL),(21,'da39a3ee5e6b4b0d3255bfef95601890afd80709','7200c091bb327a921c9f9c5df90e0a77c759f23e',22,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423750,1466423750,0,NULL),(22,'ae40e1bdc1937695f05e6d5060425fbc776d7cdc','5fc3fe85fb8de0a7a44e12d517980d901e3609cc',22,'user','icon',0,'/','f2.png',NULL,2698,'image/png',0,NULL,NULL,NULL,1466423750,1466423750,0,NULL),(23,'fd8ba068a71563254bc766c4cf1881abadb840ea','402261b9c93f92d532f76479749ca798b1f581c0',22,'user','icon',0,'/','f3.png',NULL,52553,'image/png',0,NULL,NULL,NULL,1466423750,1466423750,0,NULL),(24,'aa6c68d25b6ccdcd7b10b20a7eaa1a80ba36ce77','ee3868be1a8f1476231a8a6eb5eea96a455290a1',23,'user','icon',0,'/','f1.png',NULL,14068,'image/png',0,NULL,NULL,NULL,1466423751,1466423751,0,NULL),(25,'da39a3ee5e6b4b0d3255bfef95601890afd80709','260ad1050b141661b7357c601e15f365bb2604b2',23,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423751,1466423751,0,NULL),(26,'eab99da2c3625de271303ae607390764cacbe08e','ebf714d582f0f98c50287ab65e92240c7c1567e7',23,'user','icon',0,'/','f2.png',NULL,2310,'image/png',0,NULL,NULL,NULL,1466423751,1466423751,0,NULL),(27,'7a83a76e55fb161b4c72d8bae38bc3c00cef4d21','0aeb4e4cedb63e8000535dd0ed981b77c7414a9b',23,'user','icon',0,'/','f3.png',NULL,36905,'image/png',0,NULL,NULL,NULL,1466423751,1466423751,0,NULL),(28,'f05fed794c221d55f4e383f61d8df599692bec74','569d61073988a8c3f6d331ca394711941f3a03cc',24,'user','icon',0,'/','f1.png',NULL,10638,'image/png',0,NULL,NULL,NULL,1466423751,1466423751,0,NULL),(29,'da39a3ee5e6b4b0d3255bfef95601890afd80709','601143bd3ae9604ce884ce0cbef1d78f5cbc4a76',24,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423751,1466423751,0,NULL),(30,'7dcc46c6291dcc3a206071d8518d27c35c4bc1b3','1ec83f2c7cf128a99771a95e817349f2a8e46851',24,'user','icon',0,'/','f2.png',NULL,2073,'image/png',0,NULL,NULL,NULL,1466423751,1466423751,0,NULL),(31,'e53a310b0a287d2b99f5f3665aa0864f60556c58','d3ddfc8c49e245776eeb7d43e5fb2d2048359ef8',24,'user','icon',0,'/','f3.png',NULL,30446,'image/png',0,NULL,NULL,NULL,1466423751,1466423751,0,NULL),(32,'4040269ff339b93b4274f335bb4429a798d94ead','41950598f8e9270a7da2ca5b90c60cc69da828f4',25,'user','icon',0,'/','f1.png',NULL,12662,'image/png',0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(33,'da39a3ee5e6b4b0d3255bfef95601890afd80709','3630fbe2ea6dd6405ee5b9d940e9bb920eff6903',25,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(34,'8ada52381ea52a7d4fd69e5a58b3d90c1e83976e','df414c7c1809d7684fd2dad498cc976701e4578a',25,'user','icon',0,'/','f2.png',NULL,2172,'image/png',0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(35,'ba6da8532689c4c9e44d733b605c837f6888b570','29b436c7d41cf6fc07e029336845c40039a87eab',25,'user','icon',0,'/','f3.png',NULL,33637,'image/png',0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(36,'d3f57b074779207a24993b659f42e8bae4b71fb4','b388d6b6e13c22bbe1d2dafac525772247906548',26,'user','icon',0,'/','f1.png',NULL,16903,'image/png',0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(37,'da39a3ee5e6b4b0d3255bfef95601890afd80709','979c51c50e176f40db38e92a4675731764d116ff',26,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(38,'62d637978aa78c8b7cb0965a751199eff5e6dbd1','7d1428eae5bab196077738b366a058772d4bc572',26,'user','icon',0,'/','f2.png',NULL,2723,'image/png',0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(39,'e69c4d62c9f030e2cd7d1504c707b489c59ec6c3','d7a307b0f302b032808c6dc218399c057a2ea4df',26,'user','icon',0,'/','f3.png',NULL,50353,'image/png',0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(40,'ccfc7162c5c0720ef3ef39c3b4d9b83e0ea0e34e','38ea204d7102ee5efba58d13973b883ad8919538',27,'user','icon',0,'/','f1.png',NULL,17701,'image/png',0,NULL,NULL,NULL,1466423752,1466423752,0,NULL),(41,'da39a3ee5e6b4b0d3255bfef95601890afd80709','67248d2bd3a58b03617ebd69ca389e527236671c',27,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423754,1466423754,0,NULL),(42,'916abe059aaba7b3ddec81b8e6294c4c34c6322a','8060d442cb7fa21feb4dc423d981c585d0a55d1b',27,'user','icon',0,'/','f2.png',NULL,3049,'image/png',0,NULL,NULL,NULL,1466423754,1466423754,0,NULL),(43,'cf58db7374373cf5e0f2be538cea2f1798af1802','e47974b97c19705bb4e52b2e3126ff30f7458b83',27,'user','icon',0,'/','f3.png',NULL,52438,'image/png',0,NULL,NULL,NULL,1466423754,1466423754,0,NULL),(44,'9f73495e334cdf7767bbd068bb1d5dc11784976a','589fb4406823ac92f9d213dd60010963b5d181b9',28,'user','icon',0,'/','f1.png',NULL,18049,'image/png',0,NULL,NULL,NULL,1466423755,1466423755,0,NULL),(45,'da39a3ee5e6b4b0d3255bfef95601890afd80709','0b41216a80a46b416df82914615696e71116d028',28,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423755,1466423755,0,NULL),(46,'0a2bb162a97d9f2f8dba41cc14f5f726812bb7d2','b07ce1e865ccaeaa0410414e817e95945604a9d4',28,'user','icon',0,'/','f2.png',NULL,3053,'image/png',0,NULL,NULL,NULL,1466423755,1466423755,0,NULL),(47,'1048e2e3781bbef59019acc04bd0a75972b43b5d','68c1127588ea5a8b15ea51add8e50e8c2cf141b6',28,'user','icon',0,'/','f3.png',NULL,54790,'image/png',0,NULL,NULL,NULL,1466423755,1466423755,0,NULL),(48,'5b83dd431c51325653ee17a3eaae592dcb3a5f34','9f8ef8145c5bd790514c56afb2757006f4e43e3f',29,'user','icon',0,'/','f1.png',NULL,16558,'image/png',0,NULL,NULL,NULL,1466423756,1466423756,0,NULL),(49,'da39a3ee5e6b4b0d3255bfef95601890afd80709','2a42cee38fdce226dbca6750dee943b3ff688a18',29,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423756,1466423756,0,NULL),(50,'e1129ce65bbb4c8db5c2f5ea9e99ad1c298a641b','a315a947a8198a90140edd553fdaccfc7d37704d',29,'user','icon',0,'/','f2.png',NULL,2856,'image/png',0,NULL,NULL,NULL,1466423756,1466423756,0,NULL),(51,'a838f51cc0e61db5cfadbebccf0dd0716bddc76c','8e53520a14e98b3adfeef5aa61e3e1d83771f356',29,'user','icon',0,'/','f3.png',NULL,48873,'image/png',0,NULL,NULL,NULL,1466423756,1466423756,0,NULL),(52,'7cf2eee7ec570626f7c02efe4a30dcb9c6d7f1c3','90e4ce1e1bf92556dac75d2ba6da53d899d2f956',30,'user','icon',0,'/','f1.png',NULL,10475,'image/png',0,NULL,NULL,NULL,1466423757,1466423757,0,NULL),(53,'da39a3ee5e6b4b0d3255bfef95601890afd80709','f6cccb7b7ee74f8aa44a37fcbf71e9b80f57341b',30,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423757,1466423757,0,NULL),(54,'a5234e99ea9963567f6c2aa96fbb54b91b977c80','3a381402045acd91989dcf3c972cb7e24c777259',30,'user','icon',0,'/','f2.png',NULL,1897,'image/png',0,NULL,NULL,NULL,1466423757,1466423757,0,NULL),(55,'1401a3b88b0a3ed0ed5b7998e9b2410633ded81e','c9908a0eef1ad5f302da2b6fd33e5728f6b83b40',30,'user','icon',0,'/','f3.png',NULL,28503,'image/png',0,NULL,NULL,NULL,1466423757,1466423757,0,NULL),(56,'279a1d17145c34da273b3aa3c171ed1cd3388ad6','cf492287cfd8d6e6d6e7bdf2abe2a73443635b0c',31,'user','icon',0,'/','f1.png',NULL,17675,'image/png',0,NULL,NULL,NULL,1466423758,1466423758,0,NULL),(57,'da39a3ee5e6b4b0d3255bfef95601890afd80709','466ee1f722960423b17acd9c4ad69ddf02a2eee8',31,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423758,1466423758,0,NULL),(58,'9b4891ac756dd57e9baefdfa1ce3b44712a7e029','08af4d96300ec4e7cd6209f4241c269d5cc35c90',31,'user','icon',0,'/','f2.png',NULL,3051,'image/png',0,NULL,NULL,NULL,1466423758,1466423758,0,NULL),(59,'e896cf458d0bad217bc49a9f53dcbb1d8ad6a8b7','aa40d722d7be6ce9944cb44b45feb068b2349104',31,'user','icon',0,'/','f3.png',NULL,51283,'image/png',0,NULL,NULL,NULL,1466423758,1466423758,0,NULL),(60,'71860143ad58a48daa6b14587e1ebd31da7cc168','7e91eddfce12c64d23cbf6222fdfa2f3db9a59f2',32,'user','icon',0,'/','f1.png',NULL,12402,'image/png',0,NULL,NULL,NULL,1466423759,1466423759,0,NULL),(61,'da39a3ee5e6b4b0d3255bfef95601890afd80709','9ac108342710f810fd117a331574c6d047e60bee',32,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423759,1466423759,0,NULL),(62,'eef6a5982d6cd49809b86f40f229118701a521bd','dd9c901a2fae2ed14c2fb398a6142cdf3a8c2f1e',32,'user','icon',0,'/','f2.png',NULL,2101,'image/png',0,NULL,NULL,NULL,1466423759,1466423759,0,NULL),(63,'370e522e3c6fa0e37b6b6a7c505a19de1946157b','ca93885f0bdefac0e931e26e2c56f65d17c56757',32,'user','icon',0,'/','f3.png',NULL,34263,'image/png',0,NULL,NULL,NULL,1466423759,1466423759,0,NULL),(64,'98886df6db19b57e04d27e59fdf976c51a4ed03e','9c307f8be64147d4af0ae7f58aa3bd3452126a90',33,'user','icon',0,'/','f1.png',NULL,17914,'image/png',0,NULL,NULL,NULL,1466423759,1466423759,0,NULL),(65,'da39a3ee5e6b4b0d3255bfef95601890afd80709','5f00b8f6644d9079d8cc5c3b0550b53ef7c903b4',33,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423759,1466423759,0,NULL),(66,'079f95470130bc9b1b862c7bc1527831999cfb1f','ba7b773568bf391f3672267ff5b6151375970dfc',33,'user','icon',0,'/','f2.png',NULL,3055,'image/png',0,NULL,NULL,NULL,1466423759,1466423759,0,NULL),(67,'99cb5c69f13bd7b95076db24316db6b0600a80e6','2a06ebdc3b7e075f89785dd72105e8626d92c8e4',33,'user','icon',0,'/','f3.png',NULL,53055,'image/png',0,NULL,NULL,NULL,1466423759,1466423759,0,NULL),(68,'8eb026e8f11fb9eb474f99d35d66bbf609768dcf','65afec4e5be1d935bc8e01a73415cd9b19f527db',34,'user','icon',0,'/','f1.png',NULL,19209,'image/png',0,NULL,NULL,NULL,1466423760,1466423760,0,NULL),(69,'da39a3ee5e6b4b0d3255bfef95601890afd80709','9726d9dfa5de7ab3a3bfd9588961e18b07868524',34,'user','icon',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1466423760,1466423760,0,NULL),(70,'8209e7b37dd277054c5a3379e60b1578a93d6eae','56ac5997fb11fb4d3ea0cd6c4a842b52ebb8aadf',34,'user','icon',0,'/','f2.png',NULL,3195,'image/png',0,NULL,NULL,NULL,1466423760,1466423760,0,NULL),(71,'a8027daf9c6657379956b9e39d8c629ceb32721a','f1bc67d819d4e9287d617746e1249f6df516527c',34,'user','icon',0,'/','f3.png',NULL,59089,'image/png',0,NULL,NULL,NULL,1466423760,1466423760,0,NULL);
/*!40000 ALTER TABLE `mdl_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files_reference`
--

DROP TABLE IF EXISTS `mdl_files_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files_reference`
--

LOCK TABLES `mdl_files_reference` WRITE;
/*!40000 ALTER TABLE `mdl_files_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_active`
--

DROP TABLE IF EXISTS `mdl_filter_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_active`
--

LOCK TABLES `mdl_filter_active` WRITE;
/*!40000 ALTER TABLE `mdl_filter_active` DISABLE KEYS */;
INSERT INTO `mdl_filter_active` VALUES (1,'activitynames',1,1,2),(2,'mathjaxloader',1,1,1),(3,'mediaplugin',1,1,3);
/*!40000 ALTER TABLE `mdl_filter_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_config`
--

DROP TABLE IF EXISTS `mdl_filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_config`
--

LOCK TABLES `mdl_filter_config` WRITE;
/*!40000 ALTER TABLE `mdl_filter_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_filter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_folder`
--

DROP TABLE IF EXISTS `mdl_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  `showdownloadfolder` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_folder`
--

LOCK TABLES `mdl_folder` WRITE;
/*!40000 ALTER TABLE `mdl_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum`
--

DROP TABLE IF EXISTS `mdl_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum`
--

LOCK TABLES `mdl_forum` WRITE;
/*!40000 ALTER TABLE `mdl_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_digests`
--

DROP TABLE IF EXISTS `mdl_forum_digests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of user mail delivery preferences for each forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_digests`
--

LOCK TABLES `mdl_forum_digests` WRITE;
/*!40000 ALTER TABLE `mdl_forum_digests` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_digests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussion_subs`
--

DROP TABLE IF EXISTS `mdl_forum_discussion_subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  KEY `mdl_forudiscsubs_for_ix` (`forum`),
  KEY `mdl_forudiscsubs_use_ix` (`userid`),
  KEY `mdl_forudiscsubs_dis_ix` (`discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users may choose to subscribe and unsubscribe from specific ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussion_subs`
--

LOCK TABLES `mdl_forum_discussion_subs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussions`
--

DROP TABLE IF EXISTS `mdl_forum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_cou_ix` (`course`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussions`
--

LOCK TABLES `mdl_forum_discussions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_posts`
--

DROP TABLE IF EXISTS `mdl_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_posts`
--

LOCK TABLES `mdl_forum_posts` WRITE;
/*!40000 ALTER TABLE `mdl_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_queue`
--

DROP TABLE IF EXISTS `mdl_forum_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_queue`
--

LOCK TABLES `mdl_forum_queue` WRITE;
/*!40000 ALTER TABLE `mdl_forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_read`
--

DROP TABLE IF EXISTS `mdl_forum_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_posuse_ix` (`postid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_read`
--

LOCK TABLES `mdl_forum_read` WRITE;
/*!40000 ALTER TABLE `mdl_forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_subscriptions`
--

DROP TABLE IF EXISTS `mdl_forum_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_subscriptions`
--

LOCK TABLES `mdl_forum_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_track_prefs`
--

DROP TABLE IF EXISTS `mdl_forum_track_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_track_prefs`
--

LOCK TABLES `mdl_forum_track_prefs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary`
--

DROP TABLE IF EXISTS `mdl_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary`
--

LOCK TABLES `mdl_glossary` WRITE;
/*!40000 ALTER TABLE `mdl_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_alias`
--

DROP TABLE IF EXISTS `mdl_glossary_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_alias`
--

LOCK TABLES `mdl_glossary_alias` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_categories`
--

LOCK TABLES `mdl_glossary_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries`
--

DROP TABLE IF EXISTS `mdl_glossary_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries`
--

LOCK TABLES `mdl_glossary_entries` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_entries_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries_categories`
--

LOCK TABLES `mdl_glossary_entries_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_formats`
--

DROP TABLE IF EXISTS `mdl_glossary_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `showtabs` varchar(100) DEFAULT NULL,
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_formats`
--

LOCK TABLES `mdl_glossary_formats` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_formats` DISABLE KEYS */;
INSERT INTO `mdl_glossary_formats` VALUES (1,'continuous','continuous',1,1,'standard,category,date','','','',''),(2,'dictionary','dictionary',1,1,'standard','','','',''),(3,'encyclopedia','encyclopedia',1,1,'standard,category,date,author','','','',''),(4,'entrylist','entrylist',1,1,'standard,category,date,author','','','',''),(5,'faq','faq',1,1,'standard,category,date,author','','','',''),(6,'fullwithauthor','fullwithauthor',1,1,'standard,category,date,author','','','',''),(7,'fullwithoutauthor','fullwithoutauthor',1,1,'standard,category,date','','','','');
/*!40000 ALTER TABLE `mdl_glossary_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories`
--

DROP TABLE IF EXISTS `mdl_grade_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories`
--

LOCK TABLES `mdl_grade_categories` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories_history`
--

DROP TABLE IF EXISTS `mdl_grade_categories_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories_history`
--

LOCK TABLES `mdl_grade_categories_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades`
--

DROP TABLE IF EXISTS `mdl_grade_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades`
--

LOCK TABLES `mdl_grade_grades` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades_history`
--

DROP TABLE IF EXISTS `mdl_grade_grades_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_useitetim_ix` (`userid`,`itemid`,`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades_history`
--

LOCK TABLES `mdl_grade_grades_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_newitem`
--

DROP TABLE IF EXISTS `mdl_grade_import_newitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_newitem`
--

LOCK TABLES `mdl_grade_import_newitem` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_values`
--

DROP TABLE IF EXISTS `mdl_grade_import_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  `importonlyfeedback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_values`
--

LOCK TABLES `mdl_grade_import_values` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items`
--

DROP TABLE IF EXISTS `mdl_grade_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items`
--

LOCK TABLES `mdl_grade_items` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items_history`
--

DROP TABLE IF EXISTS `mdl_grade_items_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items_history`
--

LOCK TABLES `mdl_grade_items_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_letters`
--

DROP TABLE IF EXISTS `mdl_grade_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_letters`
--

LOCK TABLES `mdl_grade_letters` WRITE;
/*!40000 ALTER TABLE `mdl_grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes`
--

LOCK TABLES `mdl_grade_outcomes` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_courses`
--

LOCK TABLES `mdl_grade_outcomes_courses` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_history`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_history`
--

LOCK TABLES `mdl_grade_outcomes_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_settings`
--

DROP TABLE IF EXISTS `mdl_grade_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_settings`
--

LOCK TABLES `mdl_grade_settings` WRITE;
/*!40000 ALTER TABLE `mdl_grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_areas`
--

DROP TABLE IF EXISTS `mdl_grading_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_areas`
--

LOCK TABLES `mdl_grading_areas` WRITE;
/*!40000 ALTER TABLE `mdl_grading_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_definitions`
--

DROP TABLE IF EXISTS `mdl_grading_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_definitions`
--

LOCK TABLES `mdl_grading_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_grading_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_instances`
--

DROP TABLE IF EXISTS `mdl_grading_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_instances`
--

LOCK TABLES `mdl_grading_instances` WRITE;
/*!40000 ALTER TABLE `mdl_grading_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_comments`
--

LOCK TABLES `mdl_gradingform_guide_comments` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_criteria`
--

LOCK TABLES `mdl_gradingform_guide_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_fillings`
--

LOCK TABLES `mdl_gradingform_guide_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_criteria`
--

LOCK TABLES `mdl_gradingform_rubric_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_fillings`
--

LOCK TABLES `mdl_gradingform_rubric_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_levels`
--

LOCK TABLES `mdl_gradingform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings`
--

DROP TABLE IF EXISTS `mdl_groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings`
--

LOCK TABLES `mdl_groupings` WRITE;
/*!40000 ALTER TABLE `mdl_groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings_groups`
--

DROP TABLE IF EXISTS `mdl_groupings_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings_groups`
--

LOCK TABLES `mdl_groupings_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups`
--

DROP TABLE IF EXISTS `mdl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups`
--

LOCK TABLES `mdl_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups_members`
--

DROP TABLE IF EXISTS `mdl_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups_members`
--

LOCK TABLES `mdl_groups_members` WRITE;
/*!40000 ALTER TABLE `mdl_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_imscp`
--

DROP TABLE IF EXISTS `mdl_imscp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_imscp`
--

LOCK TABLES `mdl_imscp` WRITE;
/*!40000 ALTER TABLE `mdl_imscp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_imscp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_label`
--

DROP TABLE IF EXISTS `mdl_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_label`
--

LOCK TABLES `mdl_label` WRITE;
/*!40000 ALTER TABLE `mdl_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson`
--

DROP TABLE IF EXISTS `mdl_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson`
--

LOCK TABLES `mdl_lesson` WRITE;
/*!40000 ALTER TABLE `mdl_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_answers`
--

DROP TABLE IF EXISTS `mdl_lesson_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_answers`
--

LOCK TABLES `mdl_lesson_answers` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_attempts`
--

DROP TABLE IF EXISTS `mdl_lesson_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_attempts`
--

LOCK TABLES `mdl_lesson_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_branch`
--

DROP TABLE IF EXISTS `mdl_lesson_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_branch`
--

LOCK TABLES `mdl_lesson_branch` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_grades`
--

DROP TABLE IF EXISTS `mdl_lesson_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_grades`
--

LOCK TABLES `mdl_lesson_grades` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_overrides`
--

DROP TABLE IF EXISTS `mdl_lesson_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `available` bigint(10) DEFAULT NULL,
  `deadline` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `review` smallint(3) DEFAULT NULL,
  `maxattempts` smallint(3) DEFAULT NULL,
  `retake` smallint(3) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_lessover_les_ix` (`lessonid`),
  KEY `mdl_lessover_gro_ix` (`groupid`),
  KEY `mdl_lessover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to lesson settings.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_overrides`
--

LOCK TABLES `mdl_lesson_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_pages`
--

DROP TABLE IF EXISTS `mdl_lesson_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_pages`
--

LOCK TABLES `mdl_lesson_pages` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_timer`
--

DROP TABLE IF EXISTS `mdl_lesson_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_timer`
--

LOCK TABLES `mdl_lesson_timer` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_license`
--

DROP TABLE IF EXISTS `mdl_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_license`
--

LOCK TABLES `mdl_license` WRITE;
/*!40000 ALTER TABLE `mdl_license` DISABLE KEYS */;
INSERT INTO `mdl_license` VALUES (1,'unknown','Unknown license','',1,2010033100),(2,'allrightsreserved','All rights reserved','http://en.wikipedia.org/wiki/All_rights_reserved',1,2010033100),(3,'public','Public Domain','http://creativecommons.org/licenses/publicdomain/',1,2010033100),(4,'cc','Creative Commons','http://creativecommons.org/licenses/by/3.0/',1,2010033100),(5,'cc-nd','Creative Commons - NoDerivs','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(6,'cc-nc-nd','Creative Commons - No Commercial NoDerivs','http://creativecommons.org/licenses/by-nc-nd/3.0/',1,2010033100),(7,'cc-nc','Creative Commons - No Commercial','http://creativecommons.org/licenses/by-nc/3.0/',1,2013051500),(8,'cc-nc-sa','Creative Commons - No Commercial ShareAlike','http://creativecommons.org/licenses/by-nc-sa/3.0/',1,2010033100),(9,'cc-sa','Creative Commons - ShareAlike','http://creativecommons.org/licenses/by-sa/3.0/',1,2010033100);
/*!40000 ALTER TABLE `mdl_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lock_db`
--

DROP TABLE IF EXISTS `mdl_lock_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lock_db` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `resourcekey` varchar(255) NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  KEY `mdl_lockdb_exp_ix` (`expires`),
  KEY `mdl_lockdb_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores active and inactive lock types for db locking method.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lock_db`
--

LOCK TABLES `mdl_lock_db` WRITE;
/*!40000 ALTER TABLE `mdl_lock_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lock_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log`
--

DROP TABLE IF EXISTS `mdl_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log`
--

LOCK TABLES `mdl_log` WRITE;
/*!40000 ALTER TABLE `mdl_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_display`
--

DROP TABLE IF EXISTS `mdl_log_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_display`
--

LOCK TABLES `mdl_log_display` WRITE;
/*!40000 ALTER TABLE `mdl_log_display` DISABLE KEYS */;
INSERT INTO `mdl_log_display` VALUES (1,'course','user report','user','CONCAT(firstname, \' \', lastname)','moodle'),(2,'course','view','course','fullname','moodle'),(3,'course','view section','course_sections','name','moodle'),(4,'course','update','course','fullname','moodle'),(5,'course','hide','course','fullname','moodle'),(6,'course','show','course','fullname','moodle'),(7,'course','move','course','fullname','moodle'),(8,'course','enrol','course','fullname','moodle'),(9,'course','unenrol','course','fullname','moodle'),(10,'course','report log','course','fullname','moodle'),(11,'course','report live','course','fullname','moodle'),(12,'course','report outline','course','fullname','moodle'),(13,'course','report participation','course','fullname','moodle'),(14,'course','report stats','course','fullname','moodle'),(15,'category','add','course_categories','name','moodle'),(16,'category','hide','course_categories','name','moodle'),(17,'category','move','course_categories','name','moodle'),(18,'category','show','course_categories','name','moodle'),(19,'category','update','course_categories','name','moodle'),(20,'message','write','user','CONCAT(firstname, \' \', lastname)','moodle'),(21,'message','read','user','CONCAT(firstname, \' \', lastname)','moodle'),(22,'message','add contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(23,'message','remove contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(24,'message','block contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(25,'message','unblock contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(26,'group','view','groups','name','moodle'),(27,'tag','update','tag','name','moodle'),(28,'tag','flag','tag','name','moodle'),(29,'user','view','user','CONCAT(firstname, \' \', lastname)','moodle'),(30,'assign','add','assign','name','mod_assign'),(31,'assign','delete mod','assign','name','mod_assign'),(32,'assign','download all submissions','assign','name','mod_assign'),(33,'assign','grade submission','assign','name','mod_assign'),(34,'assign','lock submission','assign','name','mod_assign'),(35,'assign','reveal identities','assign','name','mod_assign'),(36,'assign','revert submission to draft','assign','name','mod_assign'),(37,'assign','set marking workflow state','assign','name','mod_assign'),(38,'assign','submission statement accepted','assign','name','mod_assign'),(39,'assign','submit','assign','name','mod_assign'),(40,'assign','submit for grading','assign','name','mod_assign'),(41,'assign','unlock submission','assign','name','mod_assign'),(42,'assign','update','assign','name','mod_assign'),(43,'assign','upload','assign','name','mod_assign'),(44,'assign','view','assign','name','mod_assign'),(45,'assign','view all','course','fullname','mod_assign'),(46,'assign','view confirm submit assignment form','assign','name','mod_assign'),(47,'assign','view grading form','assign','name','mod_assign'),(48,'assign','view submission','assign','name','mod_assign'),(49,'assign','view submission grading table','assign','name','mod_assign'),(50,'assign','view submit assignment form','assign','name','mod_assign'),(51,'assign','view feedback','assign','name','mod_assign'),(52,'assign','view batch set marking workflow state','assign','name','mod_assign'),(53,'assignment','view','assignment','name','mod_assignment'),(54,'assignment','add','assignment','name','mod_assignment'),(55,'assignment','update','assignment','name','mod_assignment'),(56,'assignment','view submission','assignment','name','mod_assignment'),(57,'assignment','upload','assignment','name','mod_assignment'),(58,'book','add','book','name','mod_book'),(59,'book','update','book','name','mod_book'),(60,'book','view','book','name','mod_book'),(61,'book','add chapter','book_chapters','title','mod_book'),(62,'book','update chapter','book_chapters','title','mod_book'),(63,'book','view chapter','book_chapters','title','mod_book'),(64,'chat','view','chat','name','mod_chat'),(65,'chat','add','chat','name','mod_chat'),(66,'chat','update','chat','name','mod_chat'),(67,'chat','report','chat','name','mod_chat'),(68,'chat','talk','chat','name','mod_chat'),(69,'choice','view','choice','name','mod_choice'),(70,'choice','update','choice','name','mod_choice'),(71,'choice','add','choice','name','mod_choice'),(72,'choice','report','choice','name','mod_choice'),(73,'choice','choose','choice','name','mod_choice'),(74,'choice','choose again','choice','name','mod_choice'),(75,'data','view','data','name','mod_data'),(76,'data','add','data','name','mod_data'),(77,'data','update','data','name','mod_data'),(78,'data','record delete','data','name','mod_data'),(79,'data','fields add','data_fields','name','mod_data'),(80,'data','fields update','data_fields','name','mod_data'),(81,'data','templates saved','data','name','mod_data'),(82,'data','templates def','data','name','mod_data'),(83,'feedback','startcomplete','feedback','name','mod_feedback'),(84,'feedback','submit','feedback','name','mod_feedback'),(85,'feedback','delete','feedback','name','mod_feedback'),(86,'feedback','view','feedback','name','mod_feedback'),(87,'feedback','view all','course','shortname','mod_feedback'),(88,'folder','view','folder','name','mod_folder'),(89,'folder','view all','folder','name','mod_folder'),(90,'folder','update','folder','name','mod_folder'),(91,'folder','add','folder','name','mod_folder'),(92,'forum','add','forum','name','mod_forum'),(93,'forum','update','forum','name','mod_forum'),(94,'forum','add discussion','forum_discussions','name','mod_forum'),(95,'forum','add post','forum_posts','subject','mod_forum'),(96,'forum','update post','forum_posts','subject','mod_forum'),(97,'forum','user report','user','CONCAT(firstname, \' \', lastname)','mod_forum'),(98,'forum','move discussion','forum_discussions','name','mod_forum'),(99,'forum','view subscribers','forum','name','mod_forum'),(100,'forum','view discussion','forum_discussions','name','mod_forum'),(101,'forum','view forum','forum','name','mod_forum'),(102,'forum','subscribe','forum','name','mod_forum'),(103,'forum','unsubscribe','forum','name','mod_forum'),(104,'forum','pin discussion','forum_discussions','name','mod_forum'),(105,'forum','unpin discussion','forum_discussions','name','mod_forum'),(106,'glossary','add','glossary','name','mod_glossary'),(107,'glossary','update','glossary','name','mod_glossary'),(108,'glossary','view','glossary','name','mod_glossary'),(109,'glossary','view all','glossary','name','mod_glossary'),(110,'glossary','add entry','glossary','name','mod_glossary'),(111,'glossary','update entry','glossary','name','mod_glossary'),(112,'glossary','add category','glossary','name','mod_glossary'),(113,'glossary','update category','glossary','name','mod_glossary'),(114,'glossary','delete category','glossary','name','mod_glossary'),(115,'glossary','approve entry','glossary','name','mod_glossary'),(116,'glossary','disapprove entry','glossary','name','mod_glossary'),(117,'glossary','view entry','glossary_entries','concept','mod_glossary'),(118,'imscp','view','imscp','name','mod_imscp'),(119,'imscp','view all','imscp','name','mod_imscp'),(120,'imscp','update','imscp','name','mod_imscp'),(121,'imscp','add','imscp','name','mod_imscp'),(122,'label','add','label','name','mod_label'),(123,'label','update','label','name','mod_label'),(124,'lesson','start','lesson','name','mod_lesson'),(125,'lesson','end','lesson','name','mod_lesson'),(126,'lesson','view','lesson_pages','title','mod_lesson'),(127,'lti','view','lti','name','mod_lti'),(128,'lti','launch','lti','name','mod_lti'),(129,'lti','view all','lti','name','mod_lti'),(130,'page','view','page','name','mod_page'),(131,'page','view all','page','name','mod_page'),(132,'page','update','page','name','mod_page'),(133,'page','add','page','name','mod_page'),(134,'quiz','add','quiz','name','mod_quiz'),(135,'quiz','update','quiz','name','mod_quiz'),(136,'quiz','view','quiz','name','mod_quiz'),(137,'quiz','report','quiz','name','mod_quiz'),(138,'quiz','attempt','quiz','name','mod_quiz'),(139,'quiz','submit','quiz','name','mod_quiz'),(140,'quiz','review','quiz','name','mod_quiz'),(141,'quiz','editquestions','quiz','name','mod_quiz'),(142,'quiz','preview','quiz','name','mod_quiz'),(143,'quiz','start attempt','quiz','name','mod_quiz'),(144,'quiz','close attempt','quiz','name','mod_quiz'),(145,'quiz','continue attempt','quiz','name','mod_quiz'),(146,'quiz','edit override','quiz','name','mod_quiz'),(147,'quiz','delete override','quiz','name','mod_quiz'),(148,'quiz','view summary','quiz','name','mod_quiz'),(149,'resource','view','resource','name','mod_resource'),(150,'resource','view all','resource','name','mod_resource'),(151,'resource','update','resource','name','mod_resource'),(152,'resource','add','resource','name','mod_resource'),(153,'scorm','view','scorm','name','mod_scorm'),(154,'scorm','review','scorm','name','mod_scorm'),(155,'scorm','update','scorm','name','mod_scorm'),(156,'scorm','add','scorm','name','mod_scorm'),(157,'survey','add','survey','name','mod_survey'),(158,'survey','update','survey','name','mod_survey'),(159,'survey','download','survey','name','mod_survey'),(160,'survey','view form','survey','name','mod_survey'),(161,'survey','view graph','survey','name','mod_survey'),(162,'survey','view report','survey','name','mod_survey'),(163,'survey','submit','survey','name','mod_survey'),(164,'url','view','url','name','mod_url'),(165,'url','view all','url','name','mod_url'),(166,'url','update','url','name','mod_url'),(167,'url','add','url','name','mod_url'),(168,'workshop','add','workshop','name','mod_workshop'),(169,'workshop','update','workshop','name','mod_workshop'),(170,'workshop','view','workshop','name','mod_workshop'),(171,'workshop','view all','workshop','name','mod_workshop'),(172,'workshop','add submission','workshop_submissions','title','mod_workshop'),(173,'workshop','update submission','workshop_submissions','title','mod_workshop'),(174,'workshop','view submission','workshop_submissions','title','mod_workshop'),(175,'workshop','add assessment','workshop_submissions','title','mod_workshop'),(176,'workshop','update assessment','workshop_submissions','title','mod_workshop'),(177,'workshop','add example','workshop_submissions','title','mod_workshop'),(178,'workshop','update example','workshop_submissions','title','mod_workshop'),(179,'workshop','view example','workshop_submissions','title','mod_workshop'),(180,'workshop','add reference assessment','workshop_submissions','title','mod_workshop'),(181,'workshop','update reference assessment','workshop_submissions','title','mod_workshop'),(182,'workshop','add example assessment','workshop_submissions','title','mod_workshop'),(183,'workshop','update example assessment','workshop_submissions','title','mod_workshop'),(184,'workshop','update aggregate grades','workshop','name','mod_workshop'),(185,'workshop','update clear aggregated grades','workshop','name','mod_workshop'),(186,'workshop','update clear assessments','workshop','name','mod_workshop'),(187,'book','exportimscp','book','name','booktool_exportimscp'),(188,'book','print','book','name','booktool_print'),(189,'book','print chapter','book_chapters','title','booktool_print');
/*!40000 ALTER TABLE `mdl_log_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_queries`
--

DROP TABLE IF EXISTS `mdl_log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_queries`
--

LOCK TABLES `mdl_log_queries` WRITE;
/*!40000 ALTER TABLE `mdl_log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_logstore_standard_log`
--

DROP TABLE IF EXISTS `mdl_logstore_standard_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `objecttable` varchar(50) DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`),
  KEY `mdl_logsstanlog_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Standard log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_logstore_standard_log`
--

LOCK TABLES `mdl_logstore_standard_log` WRITE;
/*!40000 ALTER TABLE `mdl_logstore_standard_log` DISABLE KEYS */;
INSERT INTO `mdl_logstore_standard_log` VALUES (1,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,0,1,NULL,0,'N;',1466423708,'web','10.2.10.48',NULL),(2,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1466423715,'web','10.2.10.48',NULL),(3,'\\core\\event\\user_updated','core','updated','user','user',2,'u',0,5,30,2,2,0,2,0,'N;',1466423752,'web','10.2.10.48',NULL),(4,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,19,30,3,0,0,3,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423748,'cli',NULL,NULL),(5,'\\core\\event\\user_created','core','created','user','user',3,'c',0,19,30,3,0,0,3,0,'N;',1466423748,'cli',NULL,NULL),(6,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,20,30,4,0,0,4,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423749,'cli',NULL,NULL),(7,'\\core\\event\\user_created','core','created','user','user',4,'c',0,20,30,4,0,0,4,0,'N;',1466423749,'cli',NULL,NULL),(8,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,21,30,5,0,0,5,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423749,'cli',NULL,NULL),(9,'\\core\\event\\user_created','core','created','user','user',5,'c',0,21,30,5,0,0,5,0,'N;',1466423749,'cli',NULL,NULL),(10,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,22,30,6,0,0,6,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423750,'cli',NULL,NULL),(11,'\\core\\event\\user_created','core','created','user','user',6,'c',0,22,30,6,0,0,6,0,'N;',1466423750,'cli',NULL,NULL),(12,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,23,30,7,0,0,7,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423750,'cli',NULL,NULL),(13,'\\core\\event\\user_created','core','created','user','user',7,'c',0,23,30,7,0,0,7,0,'N;',1466423750,'cli',NULL,NULL),(14,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,24,30,8,0,0,8,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423751,'cli',NULL,NULL),(15,'\\core\\event\\user_created','core','created','user','user',8,'c',0,24,30,8,0,0,8,0,'N;',1466423751,'cli',NULL,NULL),(16,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,25,30,9,0,0,9,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423751,'cli',NULL,NULL),(17,'\\core\\event\\user_created','core','created','user','user',9,'c',0,25,30,9,0,0,9,0,'N;',1466423751,'cli',NULL,NULL),(18,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,26,30,10,0,0,10,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423752,'cli',NULL,NULL),(19,'\\core\\event\\user_created','core','created','user','user',10,'c',0,26,30,10,0,0,10,0,'N;',1466423752,'cli',NULL,NULL),(20,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,27,30,11,0,0,11,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423752,'cli',NULL,NULL),(21,'\\core\\event\\user_created','core','created','user','user',11,'c',0,27,30,11,0,0,11,0,'N;',1466423752,'cli',NULL,NULL),(22,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,28,30,12,0,0,12,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423755,'cli',NULL,NULL),(23,'\\core\\event\\user_created','core','created','user','user',12,'c',0,28,30,12,0,0,12,0,'N;',1466423755,'cli',NULL,NULL),(24,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,29,30,13,0,0,13,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423756,'cli',NULL,NULL),(25,'\\core\\event\\user_created','core','created','user','user',13,'c',0,29,30,13,0,0,13,0,'N;',1466423756,'cli',NULL,NULL),(26,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,30,30,14,0,0,14,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423757,'cli',NULL,NULL),(27,'\\core\\event\\user_created','core','created','user','user',14,'c',0,30,30,14,0,0,14,0,'N;',1466423757,'cli',NULL,NULL),(28,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,31,30,15,0,0,15,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423757,'cli',NULL,NULL),(29,'\\core\\event\\user_created','core','created','user','user',15,'c',0,31,30,15,0,0,15,0,'N;',1466423757,'cli',NULL,NULL),(30,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,32,30,16,0,0,16,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423758,'cli',NULL,NULL),(31,'\\core\\event\\user_created','core','created','user','user',16,'c',0,32,30,16,0,0,16,0,'N;',1466423758,'cli',NULL,NULL),(32,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,33,30,17,0,0,17,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423759,'cli',NULL,NULL),(33,'\\core\\event\\user_created','core','created','user','user',17,'c',0,33,30,17,0,0,17,0,'N;',1466423759,'cli',NULL,NULL),(34,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,34,30,18,0,0,18,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1466423759,'cli',NULL,NULL),(35,'\\core\\event\\user_created','core','created','user','user',18,'c',0,34,30,18,0,0,18,0,'N;',1466423759,'cli',NULL,NULL),(36,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1466423767,'web','10.2.10.48',NULL);
/*!40000 ALTER TABLE `mdl_logstore_standard_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti`
--

DROP TABLE IF EXISTS `mdl_lti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti`
--

LOCK TABLES `mdl_lti` WRITE;
/*!40000 ALTER TABLE `mdl_lti` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_submission`
--

DROP TABLE IF EXISTS `mdl_lti_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_submission`
--

LOCK TABLES `mdl_lti_submission` WRITE;
/*!40000 ALTER TABLE `mdl_lti_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_tool_proxies`
--

DROP TABLE IF EXISTS `mdl_lti_tool_proxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `vendorcode` varchar(255) DEFAULT NULL,
  `capabilityoffered` longtext NOT NULL,
  `serviceoffered` longtext NOT NULL,
  `toolproxy` longtext,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LTI tool proxy registrations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_tool_proxies`
--

LOCK TABLES `mdl_lti_tool_proxies` WRITE;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_tool_settings`
--

DROP TABLE IF EXISTS `mdl_lti_tool_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  KEY `mdl_ltitoolsett_cou_ix` (`course`),
  KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LTI tool setting values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_tool_settings`
--

LOCK TABLES `mdl_lti_tool_settings` WRITE;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types`
--

DROP TABLE IF EXISTS `mdl_lti_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext,
  `parameter` longtext,
  `icon` longtext,
  `secureicon` longtext,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types`
--

LOCK TABLES `mdl_lti_types` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types_config`
--

DROP TABLE IF EXISTS `mdl_lti_types_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types_config`
--

LOCK TABLES `mdl_lti_types_config` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message`
--

DROP TABLE IF EXISTS `mdl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridto`),
  KEY `mdl_mess_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message`
--

LOCK TABLES `mdl_message` WRITE;
/*!40000 ALTER TABLE `mdl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

DROP TABLE IF EXISTS `mdl_message_airnotifier_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store information about the devices registered in Airnotifie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_airnotifier_devices`
--

LOCK TABLES `mdl_message_airnotifier_devices` WRITE;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_contacts`
--

DROP TABLE IF EXISTS `mdl_message_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_contacts`
--

LOCK TABLES `mdl_message_contacts` WRITE;
/*!40000 ALTER TABLE `mdl_message_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_processors`
--

DROP TABLE IF EXISTS `mdl_message_processors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='List of message output plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_processors`
--

LOCK TABLES `mdl_message_processors` WRITE;
/*!40000 ALTER TABLE `mdl_message_processors` DISABLE KEYS */;
INSERT INTO `mdl_message_processors` VALUES (1,'airnotifier',0),(2,'email',1),(3,'jabber',1),(4,'popup',1);
/*!40000 ALTER TABLE `mdl_message_processors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_providers`
--

DROP TABLE IF EXISTS `mdl_message_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_providers`
--

LOCK TABLES `mdl_message_providers` WRITE;
/*!40000 ALTER TABLE `mdl_message_providers` DISABLE KEYS */;
INSERT INTO `mdl_message_providers` VALUES (1,'notices','moodle','moodle/site:config'),(2,'errors','moodle','moodle/site:config'),(3,'availableupdate','moodle','moodle/site:config'),(4,'instantmessage','moodle',NULL),(5,'backup','moodle','moodle/site:config'),(6,'courserequested','moodle','moodle/site:approvecourse'),(7,'courserequestapproved','moodle','moodle/course:request'),(8,'courserequestrejected','moodle','moodle/course:request'),(9,'badgerecipientnotice','moodle','moodle/badges:earnbadge'),(10,'badgecreatornotice','moodle',NULL),(11,'competencyplancomment','moodle',NULL),(12,'competencyusercompcomment','moodle',NULL),(13,'assign_notification','mod_assign',NULL),(14,'assignment_updates','mod_assignment',NULL),(15,'submission','mod_feedback',NULL),(16,'message','mod_feedback',NULL),(17,'posts','mod_forum',NULL),(18,'digests','mod_forum',NULL),(19,'graded_essay','mod_lesson',NULL),(20,'submission','mod_quiz','mod/quiz:emailnotifysubmission'),(21,'confirmation','mod_quiz','mod/quiz:emailconfirmsubmission'),(22,'attempt_overdue','mod_quiz','mod/quiz:emailwarnoverdue'),(23,'flatfile_enrolment','enrol_flatfile',NULL),(24,'imsenterprise_enrolment','enrol_imsenterprise',NULL),(25,'expiry_notification','enrol_manual',NULL),(26,'paypal_enrolment','enrol_paypal',NULL),(27,'expiry_notification','enrol_self',NULL),(28,'invalidrecipienthandler','tool_messageinbound',NULL),(29,'messageprocessingerror','tool_messageinbound',NULL),(30,'messageprocessingsuccess','tool_messageinbound',NULL),(31,'notification','tool_monitor','tool/monitor:subscribe');
/*!40000 ALTER TABLE `mdl_message_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_read`
--

DROP TABLE IF EXISTS `mdl_message_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridto`),
  KEY `mdl_messread_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  KEY `mdl_messread_nottim_ix` (`notification`,`timeread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_read`
--

LOCK TABLES `mdl_message_read` WRITE;
/*!40000 ALTER TABLE `mdl_message_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_working`
--

DROP TABLE IF EXISTS `mdl_message_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_working`
--

LOCK TABLES `mdl_message_working` WRITE;
/*!40000 ALTER TABLE `mdl_message_working` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_working` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_datakeys`
--

DROP TABLE IF EXISTS `mdl_messageinbound_datakeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  KEY `mdl_messdata_han_ix` (`handler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inbound Message data item secret keys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_datakeys`
--

LOCK TABLES `mdl_messageinbound_datakeys` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_handlers`
--

DROP TABLE IF EXISTS `mdl_messageinbound_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messhand_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Inbound Message Handler definitions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_handlers`
--

LOCK TABLES `mdl_messageinbound_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` DISABLE KEYS */;
INSERT INTO `mdl_messageinbound_handlers` VALUES (1,'core','\\core\\message\\inbound\\private_files_handler',0,1,0),(2,'mod_forum','\\mod_forum\\message\\inbound\\reply_handler',604800,1,0),(3,'tool_messageinbound','\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler',604800,0,1);
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_messagelist`
--

DROP TABLE IF EXISTS `mdl_messageinbound_messagelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` longtext NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messmess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of message IDs for existing replies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_messagelist`
--

LOCK TABLES `mdl_messageinbound_messagelist` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_application`
--

DROP TABLE IF EXISTS `mdl_mnet_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_application`
--

LOCK TABLES `mdl_mnet_application` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_application` DISABLE KEYS */;
INSERT INTO `mdl_mnet_application` VALUES (1,'moodle','Moodle','/mnet/xmlrpc/server.php','/auth/mnet/land.php','/auth/mnet/jump.php'),(2,'mahara','Mahara','/api/xmlrpc/server.php','/auth/xmlrpc/land.php','/auth/xmlrpc/jump.php');
/*!40000 ALTER TABLE `mdl_mnet_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host`
--

DROP TABLE IF EXISTS `mdl_mnet_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host`
--

LOCK TABLES `mdl_mnet_host` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host` DISABLE KEYS */;
INSERT INTO `mdl_mnet_host` VALUES (1,0,'http://dan.local/stable_31','127.0.0.1','','',0,0,0,0,0,0,NULL,1,0),(2,0,'','','All Hosts','',0,0,0,0,0,0,NULL,1,0);
/*!40000 ALTER TABLE `mdl_mnet_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host2service`
--

DROP TABLE IF EXISTS `mdl_mnet_host2service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host2service`
--

LOCK TABLES `mdl_mnet_host2service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_host2service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_log`
--

DROP TABLE IF EXISTS `mdl_mnet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_log`
--

LOCK TABLES `mdl_mnet_log` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

LOCK TABLES `mdl_mnet_remote_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1),(15,'send_content_intent','portfolio/mahara/lib.php/send_content_intent','portfolio','mahara',1),(16,'send_content_ready','portfolio/mahara/lib.php/send_content_ready','portfolio','mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

LOCK TABLES `mdl_mnet_remote_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15),(16,4,16);
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_rpc`
--

LOCK TABLES `mdl_mnet_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1,'Return user data for the provided token, compare with user_agent string.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"The unique ID provided by remotehost.\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"User Agent string.\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}}','auth.php','auth_plugin_mnet',0),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1,'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1,'The IdP uses this function to kill child sessions on other hosts','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:35:\"SHA1 hash of user agent to look for\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}}','auth.php','auth_plugin_mnet',0),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1,'Receives an array of log entries from an SP and adds them to the mnet_log\ntable','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1,'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\nf1          - the content of the default 100x100px image\nf1_mimetype - the mimetype of the f1 file\nf2          - the content of the 35x35px variant of the image\nf2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:18:\"The id of the user\";}}s:6:\"return\";a:2:{s:4:\"type\";s:11:\"false|array\";s:11:\"description\";s:84:\"false if user not found, empty array if no picture exists, array with data otherwise\";}}','auth.php','auth_plugin_mnet',0),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1,'Returns the theme information and logo url as strings.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}','auth.php','auth_plugin_mnet',0),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1,'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:12:\"The username\";}i:1;a:3:{s:4:\"name\";s:7:\"courses\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:75:\"Assoc array of courses following the structure of mnetservice_enrol_courses\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1,'Poll the IdP server to let it know that a user it has authenticated is still\nonline','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1,'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:35:\"SHA1 hash of user agent to look for\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:15:\"True on success\";}}','auth.php','auth_plugin_mnet',0),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1,'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1,'This method has never been implemented in Moodle MNet API','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:11:\"empty array\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1,'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"userdata\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:43:\"user details {@see mnet_fields_to_import()}\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"our local course id\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:69:\"true if the enrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1,'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"of the remote user\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"of our local course\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:71:\"true if the unenrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1,'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:16:\"ID of our course\";}i:1;a:3:{s:4:\"name\";s:5:\"roles\";s:4:\"type\";s:12:\"string|array\";s:11:\"description\";s:58:\"comma separated list of role shortnames (or array of them)\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(15,'fetch_file','portfolio/mahara/lib.php/fetch_file','portfolio','mahara',1,'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:56:\"the token recieved previously during send_content_intent\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','lib.php','portfolio_plugin_mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service`
--

DROP TABLE IF EXISTS `mdl_mnet_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service`
--

LOCK TABLES `mdl_mnet_service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service` VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1),(4,'pf','','1',1);
/*!40000 ALTER TABLE `mdl_mnet_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

LOCK TABLES `mdl_mnet_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15);
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_session`
--

DROP TABLE IF EXISTS `mdl_mnet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_session`
--

LOCK TABLES `mdl_mnet_session` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mdl_mnet_sso_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_sso_access_control`
--

LOCK TABLES `mdl_mnet_sso_access_control` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_courses`
--

LOCK TABLES `mdl_mnetservice_enrol_courses` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_enrolments`
--

LOCK TABLES `mdl_mnetservice_enrol_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_modules`
--

DROP TABLE IF EXISTS `mdl_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='modules available in the site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_modules`
--

LOCK TABLES `mdl_modules` WRITE;
/*!40000 ALTER TABLE `mdl_modules` DISABLE KEYS */;
INSERT INTO `mdl_modules` VALUES (1,'assign',60,0,'',1),(2,'assignment',60,0,'',0),(3,'book',0,0,'',1),(4,'chat',300,0,'',1),(5,'choice',0,0,'',1),(6,'data',0,0,'',1),(7,'feedback',0,0,'',1),(8,'folder',0,0,'',1),(9,'forum',0,0,'',1),(10,'glossary',0,0,'',1),(11,'imscp',0,0,'',1),(12,'label',0,0,'',1),(13,'lesson',0,0,'',1),(14,'lti',0,0,'',1),(15,'page',0,0,'',1),(16,'quiz',60,0,'',1),(17,'resource',0,0,'',1),(18,'scorm',300,0,'',1),(19,'survey',0,0,'',1),(20,'url',0,0,'',1),(21,'wiki',0,0,'',1),(22,'workshop',60,0,'',1);
/*!40000 ALTER TABLE `mdl_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_my_pages`
--

DROP TABLE IF EXISTS `mdl_my_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_my_pages`
--

LOCK TABLES `mdl_my_pages` WRITE;
/*!40000 ALTER TABLE `mdl_my_pages` DISABLE KEYS */;
INSERT INTO `mdl_my_pages` VALUES (1,NULL,'__default',0,0),(2,NULL,'__default',1,0);
/*!40000 ALTER TABLE `mdl_my_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_page`
--

DROP TABLE IF EXISTS `mdl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_page`
--

LOCK TABLES `mdl_page` WRITE;
/*!40000 ALTER TABLE `mdl_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance`
--

LOCK TABLES `mdl_portfolio_instance` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_config`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_config`
--

LOCK TABLES `mdl_portfolio_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_user`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_user`
--

LOCK TABLES `mdl_portfolio_instance_user` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_log`
--

DROP TABLE IF EXISTS `mdl_portfolio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_log`
--

LOCK TABLES `mdl_portfolio_log` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

DROP TABLE IF EXISTS `mdl_portfolio_mahara_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_mahara_queue`
--

LOCK TABLES `mdl_portfolio_mahara_queue` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_tempdata`
--

DROP TABLE IF EXISTS `mdl_portfolio_tempdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_tempdata`
--

LOCK TABLES `mdl_portfolio_tempdata` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_post`
--

DROP TABLE IF EXISTS `mdl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_post`
--

LOCK TABLES `mdl_post` WRITE;
/*!40000 ALTER TABLE `mdl_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_profiling`
--

DROP TABLE IF EXISTS `mdl_profiling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_profiling`
--

LOCK TABLES `mdl_profiling` WRITE;
/*!40000 ALTER TABLE `mdl_profiling` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_profiling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddim_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines drag and drop (text or images onto a background imag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext`
--

LOCK TABLES `mdl_qtype_ddimageortext` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext_drags`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext_drags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `draggroup` bigint(10) NOT NULL DEFAULT '0',
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Images to drag. Actual file names are not stored here we use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext_drags`
--

LOCK TABLES `mdl_qtype_ddimageortext_drags` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext_drops`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext_drops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `xleft` bigint(10) NOT NULL DEFAULT '0',
  `ytop` bigint(10) NOT NULL DEFAULT '0',
  `choice` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Drop boxes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext_drops`
--

LOCK TABLES `mdl_qtype_ddimageortext_drops` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  `showmisplaced` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddma_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines drag and drop (text or images onto a background imag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker`
--

LOCK TABLES `mdl_qtype_ddmarker` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker_drags`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker_drags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL,
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `noofdrags` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Labels for markers to drag.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker_drags`
--

LOCK TABLES `mdl_qtype_ddmarker_drags` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker_drops`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker_drops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `shape` varchar(255) DEFAULT NULL,
  `coords` longtext NOT NULL,
  `choice` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='drop regions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker_drops`
--

LOCK TABLES `mdl_qtype_ddmarker_drops` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_essay_options`
--

DROP TABLE IF EXISTS `mdl_qtype_essay_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_essay_options`
--

LOCK TABLES `mdl_qtype_essay_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_options`
--

DROP TABLE IF EXISTS `mdl_qtype_match_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the question-type specific options for matching ques';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_options`
--

LOCK TABLES `mdl_qtype_match_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

DROP TABLE IF EXISTS `mdl_qtype_match_subquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The subquestions that make up a matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_subquestions`
--

LOCK TABLES `mdl_qtype_match_subquestions` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

DROP TABLE IF EXISTS `mdl_qtype_multichoice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_multichoice_options`
--

LOCK TABLES `mdl_qtype_multichoice_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

DROP TABLE IF EXISTS `mdl_qtype_randomsamatch_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_randomsamatch_options`
--

LOCK TABLES `mdl_qtype_randomsamatch_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

DROP TABLE IF EXISTS `mdl_qtype_shortanswer_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_shortanswer_options`
--

LOCK TABLES `mdl_qtype_shortanswer_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question`
--

DROP TABLE IF EXISTS `mdl_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_qty_ix` (`qtype`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question`
--

LOCK TABLES `mdl_question` WRITE;
/*!40000 ALTER TABLE `mdl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_answers`
--

DROP TABLE IF EXISTS `mdl_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_answers`
--

LOCK TABLES `mdl_question_answers` WRITE;
/*!40000 ALTER TABLE `mdl_question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_step_data`
--

DROP TABLE IF EXISTS `mdl_question_attempt_step_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

LOCK TABLES `mdl_question_attempt_step_data` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_steps`
--

DROP TABLE IF EXISTS `mdl_question_attempt_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_steps`
--

LOCK TABLES `mdl_question_attempt_steps` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempts`
--

DROP TABLE IF EXISTS `mdl_question_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_beh_ix` (`behaviour`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempts`
--

LOCK TABLES `mdl_question_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated`
--

DROP TABLE IF EXISTS `mdl_question_calculated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated`
--

LOCK TABLES `mdl_question_calculated` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated_options`
--

DROP TABLE IF EXISTS `mdl_question_calculated_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated_options`
--

LOCK TABLES `mdl_question_calculated_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_categories`
--

DROP TABLE IF EXISTS `mdl_question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_categories`
--

LOCK TABLES `mdl_question_categories` WRITE;
/*!40000 ALTER TABLE `mdl_question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_definitions`
--

DROP TABLE IF EXISTS `mdl_question_dataset_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_definitions`
--

LOCK TABLES `mdl_question_dataset_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_items`
--

DROP TABLE IF EXISTS `mdl_question_dataset_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_items`
--

LOCK TABLES `mdl_question_dataset_items` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_datasets`
--

DROP TABLE IF EXISTS `mdl_question_datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_datasets`
--

LOCK TABLES `mdl_question_datasets` WRITE;
/*!40000 ALTER TABLE `mdl_question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_ddwtos`
--

DROP TABLE IF EXISTS `mdl_question_ddwtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_ddwtos` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesddwt_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines drag and drop (words into sentences) questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_ddwtos`
--

LOCK TABLES `mdl_question_ddwtos` WRITE;
/*!40000 ALTER TABLE `mdl_question_ddwtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_ddwtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_gapselect`
--

DROP TABLE IF EXISTS `mdl_question_gapselect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_gapselect` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesgaps_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines select missing words questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_gapselect`
--

LOCK TABLES `mdl_question_gapselect` WRITE;
/*!40000 ALTER TABLE `mdl_question_gapselect` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_gapselect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_hints`
--

DROP TABLE IF EXISTS `mdl_question_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_hints`
--

LOCK TABLES `mdl_question_hints` WRITE;
/*!40000 ALTER TABLE `mdl_question_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multianswer`
--

DROP TABLE IF EXISTS `mdl_question_multianswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_multianswer`
--

LOCK TABLES `mdl_question_multianswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multianswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical`
--

DROP TABLE IF EXISTS `mdl_question_numerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical`
--

LOCK TABLES `mdl_question_numerical` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_options`
--

DROP TABLE IF EXISTS `mdl_question_numerical_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_options`
--

LOCK TABLES `mdl_question_numerical_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_units`
--

DROP TABLE IF EXISTS `mdl_question_numerical_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_units`
--

LOCK TABLES `mdl_question_numerical_units` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_response_analysis`
--

DROP TABLE IF EXISTS `mdl_question_response_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichtries` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Analysis of student responses given to questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_response_analysis`
--

LOCK TABLES `mdl_question_response_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_question_response_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_response_count`
--

DROP TABLE IF EXISTS `mdl_question_response_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_response_count` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespcoun_ana_ix` (`analysisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count for each responses for each try at a question.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_response_count`
--

LOCK TABLES `mdl_question_response_count` WRITE;
/*!40000 ALTER TABLE `mdl_question_response_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_statistics`
--

DROP TABLE IF EXISTS `mdl_question_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Statistics for individual questions used in an activity.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_statistics`
--

LOCK TABLES `mdl_question_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_question_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_truefalse`
--

DROP TABLE IF EXISTS `mdl_question_truefalse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_truefalse`
--

LOCK TABLES `mdl_question_truefalse` WRITE;
/*!40000 ALTER TABLE `mdl_question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_truefalse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_usages`
--

DROP TABLE IF EXISTS `mdl_question_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_usages`
--

LOCK TABLES `mdl_question_usages` WRITE;
/*!40000 ALTER TABLE `mdl_question_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz`
--

DROP TABLE IF EXISTS `mdl_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `canredoquestions` smallint(4) NOT NULL DEFAULT '0',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz`
--

LOCK TABLES `mdl_quiz` WRITE;
/*!40000 ALTER TABLE `mdl_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_attempts`
--

DROP TABLE IF EXISTS `mdl_quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_attempts`
--

LOCK TABLES `mdl_quiz_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_feedback`
--

DROP TABLE IF EXISTS `mdl_quiz_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_feedback`
--

LOCK TABLES `mdl_quiz_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_grades`
--

DROP TABLE IF EXISTS `mdl_quiz_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_grades`
--

LOCK TABLES `mdl_quiz_grades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overrides`
--

DROP TABLE IF EXISTS `mdl_quiz_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overrides`
--

LOCK TABLES `mdl_quiz_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

DROP TABLE IF EXISTS `mdl_quiz_overview_regrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overview_regrades`
--

LOCK TABLES `mdl_quiz_overview_regrades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_reports`
--

DROP TABLE IF EXISTS `mdl_quiz_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_reports`
--

LOCK TABLES `mdl_quiz_reports` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_reports` DISABLE KEYS */;
INSERT INTO `mdl_quiz_reports` VALUES (1,'grading',6000,'mod/quiz:grade'),(2,'overview',10000,NULL),(3,'responses',9000,NULL),(4,'statistics',8000,'quiz/statistics:view');
/*!40000 ALTER TABLE `mdl_quiz_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_sections`
--

DROP TABLE IF EXISTS `mdl_quiz_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `firstslot` bigint(10) NOT NULL,
  `heading` varchar(1333) DEFAULT NULL,
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  KEY `mdl_quizsect_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores sections of a quiz with section name (heading), from ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_sections`
--

LOCK TABLES `mdl_quiz_sections` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_slots`
--

DROP TABLE IF EXISTS `mdl_quiz_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_slots` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `requireprevious` smallint(4) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  KEY `mdl_quizslot_qui_ix` (`quizid`),
  KEY `mdl_quizslot_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the question used in a quiz, with the order, and for ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_slots`
--

LOCK TABLES `mdl_quiz_slots` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_statistics`
--

LOCK TABLES `mdl_quiz_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_rating`
--

DROP TABLE IF EXISTS `mdl_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_rating`
--

LOCK TABLES `mdl_rating` WRITE;
/*!40000 ALTER TABLE `mdl_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_registration_hubs`
--

DROP TABLE IF EXISTS `mdl_registration_hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_registration_hubs`
--

LOCK TABLES `mdl_registration_hubs` WRITE;
/*!40000 ALTER TABLE `mdl_registration_hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_registration_hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository`
--

DROP TABLE IF EXISTS `mdl_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository`
--

LOCK TABLES `mdl_repository` WRITE;
/*!40000 ALTER TABLE `mdl_repository` DISABLE KEYS */;
INSERT INTO `mdl_repository` VALUES (1,'areafiles',1,1),(2,'local',1,2),(3,'recent',1,3),(4,'upload',1,4),(5,'url',1,5),(6,'user',1,6),(7,'wikimedia',1,7);
/*!40000 ALTER TABLE `mdl_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instance_config`
--

DROP TABLE IF EXISTS `mdl_repository_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instance_config`
--

LOCK TABLES `mdl_repository_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_repository_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instances`
--

DROP TABLE IF EXISTS `mdl_repository_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instances`
--

LOCK TABLES `mdl_repository_instances` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instances` DISABLE KEYS */;
INSERT INTO `mdl_repository_instances` VALUES (1,'',1,0,1,NULL,NULL,1466423623,1466423623,0),(2,'',2,0,1,NULL,NULL,1466423625,1466423625,0),(3,'',3,0,1,NULL,NULL,1466423625,1466423625,0),(4,'',4,0,1,NULL,NULL,1466423626,1466423626,0),(5,'',5,0,1,NULL,NULL,1466423626,1466423626,0),(6,'',6,0,1,NULL,NULL,1466423626,1466423626,0),(7,'',7,0,1,NULL,NULL,1466423627,1466423627,0);
/*!40000 ALTER TABLE `mdl_repository_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource`
--

DROP TABLE IF EXISTS `mdl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource`
--

LOCK TABLES `mdl_resource` WRITE;
/*!40000 ALTER TABLE `mdl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource_old`
--

DROP TABLE IF EXISTS `mdl_resource_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource_old`
--

LOCK TABLES `mdl_resource_old` WRITE;
/*!40000 ALTER TABLE `mdl_resource_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role`
--

DROP TABLE IF EXISTS `mdl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='moodle roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role`
--

LOCK TABLES `mdl_role` WRITE;
/*!40000 ALTER TABLE `mdl_role` DISABLE KEYS */;
INSERT INTO `mdl_role` VALUES (1,'','manager','',1,'manager'),(2,'','coursecreator','',2,'coursecreator'),(3,'','editingteacher','',3,'editingteacher'),(4,'','teacher','',4,'teacher'),(5,'','student','',5,'student'),(6,'','guest','',6,'guest'),(7,'','user','',7,'user'),(8,'','frontpage','',8,'frontpage');
/*!40000 ALTER TABLE `mdl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_assign`
--

DROP TABLE IF EXISTS `mdl_role_allow_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_assign`
--

LOCK TABLES `mdl_role_allow_assign` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_assign` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_assign` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,3,4),(7,3,5);
/*!40000 ALTER TABLE `mdl_role_allow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_override`
--

DROP TABLE IF EXISTS `mdl_role_allow_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_override`
--

LOCK TABLES `mdl_role_allow_override` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_override` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_override` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,3,4),(10,3,5),(11,3,6);
/*!40000 ALTER TABLE `mdl_role_allow_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_switch`
--

DROP TABLE IF EXISTS `mdl_role_allow_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_switch`
--

LOCK TABLES `mdl_role_allow_switch` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_switch` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_switch` VALUES (1,1,3),(2,1,4),(3,1,5),(4,1,6),(5,3,4),(6,3,5),(7,3,6),(8,4,5),(9,4,6);
/*!40000 ALTER TABLE `mdl_role_allow_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_assignments`
--

DROP TABLE IF EXISTS `mdl_role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_assignments`
--

LOCK TABLES `mdl_role_assignments` WRITE;
/*!40000 ALTER TABLE `mdl_role_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_capabilities`
--

DROP TABLE IF EXISTS `mdl_role_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_capabilities`
--

LOCK TABLES `mdl_role_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_role_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_role_capabilities` VALUES (1,1,1,'moodle/site:readallmessages',1,1466423527,0),(2,1,3,'moodle/site:readallmessages',1,1466423527,0),(3,1,1,'moodle/site:deleteanymessage',1,1466423527,0),(4,1,1,'moodle/site:sendmessage',1,1466423527,0),(5,1,7,'moodle/site:sendmessage',1,1466423527,0),(6,1,7,'moodle/site:deleteownmessage',1,1466423527,0),(7,1,1,'moodle/site:approvecourse',1,1466423527,0),(8,1,3,'moodle/backup:backupcourse',1,1466423527,0),(9,1,1,'moodle/backup:backupcourse',1,1466423527,0),(10,1,3,'moodle/backup:backupsection',1,1466423527,0),(11,1,1,'moodle/backup:backupsection',1,1466423527,0),(12,1,3,'moodle/backup:backupactivity',1,1466423527,0),(13,1,1,'moodle/backup:backupactivity',1,1466423527,0),(14,1,3,'moodle/backup:backuptargethub',1,1466423527,0),(15,1,1,'moodle/backup:backuptargethub',1,1466423527,0),(16,1,3,'moodle/backup:backuptargetimport',1,1466423527,0),(17,1,1,'moodle/backup:backuptargetimport',1,1466423527,0),(18,1,3,'moodle/backup:downloadfile',1,1466423527,0),(19,1,1,'moodle/backup:downloadfile',1,1466423527,0),(20,1,3,'moodle/backup:configure',1,1466423527,0),(21,1,1,'moodle/backup:configure',1,1466423527,0),(22,1,1,'moodle/backup:userinfo',1,1466423527,0),(23,1,1,'moodle/backup:anonymise',1,1466423527,0),(24,1,3,'moodle/restore:restorecourse',1,1466423527,0),(25,1,1,'moodle/restore:restorecourse',1,1466423527,0),(26,1,3,'moodle/restore:restoresection',1,1466423527,0),(27,1,1,'moodle/restore:restoresection',1,1466423527,0),(28,1,3,'moodle/restore:restoreactivity',1,1466423527,0),(29,1,1,'moodle/restore:restoreactivity',1,1466423527,0),(30,1,3,'moodle/restore:restoretargethub',1,1466423527,0),(31,1,1,'moodle/restore:restoretargethub',1,1466423527,0),(32,1,3,'moodle/restore:restoretargetimport',1,1466423527,0),(33,1,1,'moodle/restore:restoretargetimport',1,1466423527,0),(34,1,3,'moodle/restore:uploadfile',1,1466423528,0),(35,1,1,'moodle/restore:uploadfile',1,1466423528,0),(36,1,3,'moodle/restore:configure',1,1466423529,0),(37,1,1,'moodle/restore:configure',1,1466423529,0),(38,1,2,'moodle/restore:rolldates',1,1466423529,0),(39,1,1,'moodle/restore:rolldates',1,1466423529,0),(40,1,1,'moodle/restore:userinfo',1,1466423529,0),(41,1,1,'moodle/restore:createuser',1,1466423529,0),(42,1,3,'moodle/site:manageblocks',1,1466423529,0),(43,1,1,'moodle/site:manageblocks',1,1466423529,0),(44,1,4,'moodle/site:accessallgroups',1,1466423529,0),(45,1,3,'moodle/site:accessallgroups',1,1466423529,0),(46,1,1,'moodle/site:accessallgroups',1,1466423529,0),(47,1,4,'moodle/site:viewfullnames',1,1466423529,0),(48,1,3,'moodle/site:viewfullnames',1,1466423530,0),(49,1,1,'moodle/site:viewfullnames',1,1466423530,0),(50,1,4,'moodle/site:viewuseridentity',1,1466423530,0),(51,1,3,'moodle/site:viewuseridentity',1,1466423530,0),(52,1,1,'moodle/site:viewuseridentity',1,1466423530,0),(53,1,4,'moodle/site:viewreports',1,1466423530,0),(54,1,3,'moodle/site:viewreports',1,1466423530,0),(55,1,1,'moodle/site:viewreports',1,1466423530,0),(56,1,3,'moodle/site:trustcontent',1,1466423530,0),(57,1,1,'moodle/site:trustcontent',1,1466423530,0),(58,1,1,'moodle/site:uploadusers',1,1466423530,0),(59,1,3,'moodle/filter:manage',1,1466423530,0),(60,1,1,'moodle/filter:manage',1,1466423530,0),(61,1,1,'moodle/user:create',1,1466423530,0),(62,1,1,'moodle/user:delete',1,1466423530,0),(63,1,1,'moodle/user:update',1,1466423530,0),(64,1,6,'moodle/user:viewdetails',1,1466423530,0),(65,1,5,'moodle/user:viewdetails',1,1466423530,0),(66,1,4,'moodle/user:viewdetails',1,1466423530,0),(67,1,3,'moodle/user:viewdetails',1,1466423530,0),(68,1,1,'moodle/user:viewdetails',1,1466423530,0),(69,1,1,'moodle/user:viewalldetails',1,1466423530,0),(70,1,1,'moodle/user:viewlastip',1,1466423530,0),(71,1,4,'moodle/user:viewhiddendetails',1,1466423530,0),(72,1,3,'moodle/user:viewhiddendetails',1,1466423530,0),(73,1,1,'moodle/user:viewhiddendetails',1,1466423530,0),(74,1,1,'moodle/user:loginas',1,1466423530,0),(75,1,1,'moodle/user:managesyspages',1,1466423530,0),(76,1,7,'moodle/user:manageownblocks',1,1466423531,0),(77,1,7,'moodle/user:manageownfiles',1,1466423531,0),(78,1,1,'moodle/my:configsyspages',1,1466423531,0),(79,1,3,'moodle/role:assign',1,1466423531,0),(80,1,1,'moodle/role:assign',1,1466423531,0),(81,1,4,'moodle/role:review',1,1466423531,0),(82,1,3,'moodle/role:review',1,1466423531,0),(83,1,1,'moodle/role:review',1,1466423531,0),(84,1,1,'moodle/role:override',1,1466423531,0),(85,1,3,'moodle/role:safeoverride',1,1466423531,0),(86,1,1,'moodle/role:manage',1,1466423531,0),(87,1,3,'moodle/role:switchroles',1,1466423531,0),(88,1,1,'moodle/role:switchroles',1,1466423531,0),(89,1,1,'moodle/category:manage',1,1466423531,0),(90,1,2,'moodle/category:viewhiddencategories',1,1466423531,0),(91,1,1,'moodle/category:viewhiddencategories',1,1466423531,0),(92,1,1,'moodle/cohort:manage',1,1466423531,0),(93,1,1,'moodle/cohort:assign',1,1466423531,0),(94,1,3,'moodle/cohort:view',1,1466423531,0),(95,1,1,'moodle/cohort:view',1,1466423531,0),(96,1,2,'moodle/course:create',1,1466423531,0),(97,1,1,'moodle/course:create',1,1466423531,0),(98,1,7,'moodle/course:request',1,1466423531,0),(99,1,1,'moodle/course:delete',1,1466423531,0),(100,1,3,'moodle/course:update',1,1466423531,0),(101,1,1,'moodle/course:update',1,1466423531,0),(102,1,1,'moodle/course:view',1,1466423532,0),(103,1,3,'moodle/course:enrolreview',1,1466423532,0),(104,1,1,'moodle/course:enrolreview',1,1466423532,0),(105,1,3,'moodle/course:enrolconfig',1,1466423532,0),(106,1,1,'moodle/course:enrolconfig',1,1466423532,0),(107,1,3,'moodle/course:reviewotherusers',1,1466423532,0),(108,1,1,'moodle/course:reviewotherusers',1,1466423532,0),(109,1,4,'moodle/course:bulkmessaging',1,1466423532,0),(110,1,3,'moodle/course:bulkmessaging',1,1466423532,0),(111,1,1,'moodle/course:bulkmessaging',1,1466423532,0),(112,1,4,'moodle/course:viewhiddenuserfields',1,1466423532,0),(113,1,3,'moodle/course:viewhiddenuserfields',1,1466423532,0),(114,1,1,'moodle/course:viewhiddenuserfields',1,1466423532,0),(115,1,2,'moodle/course:viewhiddencourses',1,1466423532,0),(116,1,4,'moodle/course:viewhiddencourses',1,1466423532,0),(117,1,3,'moodle/course:viewhiddencourses',1,1466423532,0),(118,1,1,'moodle/course:viewhiddencourses',1,1466423532,0),(119,1,3,'moodle/course:visibility',1,1466423532,0),(120,1,1,'moodle/course:visibility',1,1466423532,0),(121,1,3,'moodle/course:managefiles',1,1466423532,0),(122,1,1,'moodle/course:managefiles',1,1466423532,0),(123,1,3,'moodle/course:manageactivities',1,1466423532,0),(124,1,1,'moodle/course:manageactivities',1,1466423532,0),(125,1,3,'moodle/course:activityvisibility',1,1466423532,0),(126,1,1,'moodle/course:activityvisibility',1,1466423532,0),(127,1,4,'moodle/course:viewhiddenactivities',1,1466423532,0),(128,1,3,'moodle/course:viewhiddenactivities',1,1466423532,0),(129,1,1,'moodle/course:viewhiddenactivities',1,1466423532,0),(130,1,5,'moodle/course:viewparticipants',1,1466423532,0),(131,1,4,'moodle/course:viewparticipants',1,1466423532,0),(132,1,3,'moodle/course:viewparticipants',1,1466423532,0),(133,1,1,'moodle/course:viewparticipants',1,1466423532,0),(134,1,3,'moodle/course:changefullname',1,1466423532,0),(135,1,1,'moodle/course:changefullname',1,1466423532,0),(136,1,3,'moodle/course:changeshortname',1,1466423532,0),(137,1,1,'moodle/course:changeshortname',1,1466423532,0),(138,1,3,'moodle/course:renameroles',1,1466423532,0),(139,1,1,'moodle/course:renameroles',1,1466423532,0),(140,1,3,'moodle/course:changeidnumber',1,1466423532,0),(141,1,1,'moodle/course:changeidnumber',1,1466423532,0),(142,1,3,'moodle/course:changecategory',1,1466423532,0),(143,1,1,'moodle/course:changecategory',1,1466423532,0),(144,1,3,'moodle/course:changesummary',1,1466423533,0),(145,1,1,'moodle/course:changesummary',1,1466423533,0),(146,1,1,'moodle/site:viewparticipants',1,1466423533,0),(147,1,5,'moodle/course:isincompletionreports',1,1466423533,0),(148,1,5,'moodle/course:viewscales',1,1466423533,0),(149,1,4,'moodle/course:viewscales',1,1466423533,0),(150,1,3,'moodle/course:viewscales',1,1466423533,0),(151,1,1,'moodle/course:viewscales',1,1466423533,0),(152,1,3,'moodle/course:managescales',1,1466423533,0),(153,1,1,'moodle/course:managescales',1,1466423533,0),(154,1,3,'moodle/course:managegroups',1,1466423533,0),(155,1,1,'moodle/course:managegroups',1,1466423533,0),(156,1,3,'moodle/course:reset',1,1466423533,0),(157,1,1,'moodle/course:reset',1,1466423533,0),(158,1,3,'moodle/course:viewsuspendedusers',1,1466423533,0),(159,1,1,'moodle/course:viewsuspendedusers',1,1466423533,0),(160,1,1,'moodle/course:tag',1,1466423533,0),(161,1,3,'moodle/course:tag',1,1466423533,0),(162,1,6,'moodle/blog:view',1,1466423533,0),(163,1,7,'moodle/blog:view',1,1466423533,0),(164,1,5,'moodle/blog:view',1,1466423533,0),(165,1,4,'moodle/blog:view',1,1466423533,0),(166,1,3,'moodle/blog:view',1,1466423533,0),(167,1,1,'moodle/blog:view',1,1466423533,0),(168,1,6,'moodle/blog:search',1,1466423533,0),(169,1,7,'moodle/blog:search',1,1466423533,0),(170,1,5,'moodle/blog:search',1,1466423533,0),(171,1,4,'moodle/blog:search',1,1466423533,0),(172,1,3,'moodle/blog:search',1,1466423533,0),(173,1,1,'moodle/blog:search',1,1466423533,0),(174,1,1,'moodle/blog:viewdrafts',1,1466423533,0),(175,1,7,'moodle/blog:create',1,1466423533,0),(176,1,1,'moodle/blog:create',1,1466423533,0),(177,1,4,'moodle/blog:manageentries',1,1466423533,0),(178,1,3,'moodle/blog:manageentries',1,1466423533,0),(179,1,1,'moodle/blog:manageentries',1,1466423533,0),(180,1,5,'moodle/blog:manageexternal',1,1466423533,0),(181,1,7,'moodle/blog:manageexternal',1,1466423533,0),(182,1,4,'moodle/blog:manageexternal',1,1466423533,0),(183,1,3,'moodle/blog:manageexternal',1,1466423533,0),(184,1,1,'moodle/blog:manageexternal',1,1466423533,0),(185,1,7,'moodle/calendar:manageownentries',1,1466423533,0),(186,1,1,'moodle/calendar:manageownentries',1,1466423533,0),(187,1,4,'moodle/calendar:managegroupentries',1,1466423533,0),(188,1,3,'moodle/calendar:managegroupentries',1,1466423533,0),(189,1,1,'moodle/calendar:managegroupentries',1,1466423533,0),(190,1,4,'moodle/calendar:manageentries',1,1466423533,0),(191,1,3,'moodle/calendar:manageentries',1,1466423533,0),(192,1,1,'moodle/calendar:manageentries',1,1466423533,0),(193,1,1,'moodle/user:editprofile',1,1466423534,0),(194,1,6,'moodle/user:editownprofile',-1000,1466423534,0),(195,1,7,'moodle/user:editownprofile',1,1466423534,0),(196,1,1,'moodle/user:editownprofile',1,1466423534,0),(197,1,6,'moodle/user:changeownpassword',-1000,1466423534,0),(198,1,7,'moodle/user:changeownpassword',1,1466423534,0),(199,1,1,'moodle/user:changeownpassword',1,1466423534,0),(200,1,5,'moodle/user:readuserposts',1,1466423534,0),(201,1,4,'moodle/user:readuserposts',1,1466423534,0),(202,1,3,'moodle/user:readuserposts',1,1466423534,0),(203,1,1,'moodle/user:readuserposts',1,1466423534,0),(204,1,5,'moodle/user:readuserblogs',1,1466423534,0),(205,1,4,'moodle/user:readuserblogs',1,1466423534,0),(206,1,3,'moodle/user:readuserblogs',1,1466423534,0),(207,1,1,'moodle/user:readuserblogs',1,1466423534,0),(208,1,1,'moodle/user:editmessageprofile',1,1466423534,0),(209,1,6,'moodle/user:editownmessageprofile',-1000,1466423534,0),(210,1,7,'moodle/user:editownmessageprofile',1,1466423534,0),(211,1,1,'moodle/user:editownmessageprofile',1,1466423534,0),(212,1,3,'moodle/question:managecategory',1,1466423534,0),(213,1,1,'moodle/question:managecategory',1,1466423534,0),(214,1,3,'moodle/question:add',1,1466423534,0),(215,1,1,'moodle/question:add',1,1466423534,0),(216,1,3,'moodle/question:editmine',1,1466423534,0),(217,1,1,'moodle/question:editmine',1,1466423534,0),(218,1,3,'moodle/question:editall',1,1466423534,0),(219,1,1,'moodle/question:editall',1,1466423534,0),(220,1,3,'moodle/question:viewmine',1,1466423534,0),(221,1,1,'moodle/question:viewmine',1,1466423534,0),(222,1,3,'moodle/question:viewall',1,1466423534,0),(223,1,1,'moodle/question:viewall',1,1466423535,0),(224,1,3,'moodle/question:usemine',1,1466423535,0),(225,1,1,'moodle/question:usemine',1,1466423535,0),(226,1,3,'moodle/question:useall',1,1466423535,0),(227,1,1,'moodle/question:useall',1,1466423535,0),(228,1,3,'moodle/question:movemine',1,1466423535,0),(229,1,1,'moodle/question:movemine',1,1466423535,0),(230,1,3,'moodle/question:moveall',1,1466423535,0),(231,1,1,'moodle/question:moveall',1,1466423535,0),(232,1,1,'moodle/question:config',1,1466423535,0),(233,1,5,'moodle/question:flag',1,1466423535,0),(234,1,4,'moodle/question:flag',1,1466423535,0),(235,1,3,'moodle/question:flag',1,1466423535,0),(236,1,1,'moodle/question:flag',1,1466423535,0),(237,1,4,'moodle/site:doclinks',1,1466423535,0),(238,1,3,'moodle/site:doclinks',1,1466423535,0),(239,1,1,'moodle/site:doclinks',1,1466423535,0),(240,1,3,'moodle/course:sectionvisibility',1,1466423535,0),(241,1,1,'moodle/course:sectionvisibility',1,1466423535,0),(242,1,3,'moodle/course:useremail',1,1466423535,0),(243,1,1,'moodle/course:useremail',1,1466423535,0),(244,1,3,'moodle/course:viewhiddensections',1,1466423535,0),(245,1,1,'moodle/course:viewhiddensections',1,1466423535,0),(246,1,3,'moodle/course:setcurrentsection',1,1466423535,0),(247,1,1,'moodle/course:setcurrentsection',1,1466423535,0),(248,1,3,'moodle/course:movesections',1,1466423535,0),(249,1,1,'moodle/course:movesections',1,1466423535,0),(250,1,4,'moodle/grade:viewall',1,1466423535,0),(251,1,3,'moodle/grade:viewall',1,1466423535,0),(252,1,1,'moodle/grade:viewall',1,1466423535,0),(253,1,5,'moodle/grade:view',1,1466423535,0),(254,1,4,'moodle/grade:viewhidden',1,1466423535,0),(255,1,3,'moodle/grade:viewhidden',1,1466423535,0),(256,1,1,'moodle/grade:viewhidden',1,1466423535,0),(257,1,3,'moodle/grade:import',1,1466423535,0),(258,1,1,'moodle/grade:import',1,1466423535,0),(259,1,4,'moodle/grade:export',1,1466423535,0),(260,1,3,'moodle/grade:export',1,1466423535,0),(261,1,1,'moodle/grade:export',1,1466423535,0),(262,1,3,'moodle/grade:manage',1,1466423536,0),(263,1,1,'moodle/grade:manage',1,1466423536,0),(264,1,3,'moodle/grade:edit',1,1466423536,0),(265,1,1,'moodle/grade:edit',1,1466423536,0),(266,1,3,'moodle/grade:managegradingforms',1,1466423536,0),(267,1,1,'moodle/grade:managegradingforms',1,1466423536,0),(268,1,1,'moodle/grade:sharegradingforms',1,1466423536,0),(269,1,1,'moodle/grade:managesharedforms',1,1466423536,0),(270,1,3,'moodle/grade:manageoutcomes',1,1466423536,0),(271,1,1,'moodle/grade:manageoutcomes',1,1466423536,0),(272,1,3,'moodle/grade:manageletters',1,1466423536,0),(273,1,1,'moodle/grade:manageletters',1,1466423536,0),(274,1,3,'moodle/grade:hide',1,1466423536,0),(275,1,1,'moodle/grade:hide',1,1466423536,0),(276,1,3,'moodle/grade:lock',1,1466423536,0),(277,1,1,'moodle/grade:lock',1,1466423536,0),(278,1,3,'moodle/grade:unlock',1,1466423536,0),(279,1,1,'moodle/grade:unlock',1,1466423536,0),(280,1,7,'moodle/my:manageblocks',1,1466423536,0),(281,1,4,'moodle/notes:view',1,1466423536,0),(282,1,3,'moodle/notes:view',1,1466423536,0),(283,1,1,'moodle/notes:view',1,1466423536,0),(284,1,4,'moodle/notes:manage',1,1466423536,0),(285,1,3,'moodle/notes:manage',1,1466423536,0),(286,1,1,'moodle/notes:manage',1,1466423536,0),(287,1,1,'moodle/tag:manage',1,1466423536,0),(288,1,1,'moodle/tag:edit',1,1466423536,0),(289,1,7,'moodle/tag:flag',1,1466423536,0),(290,1,4,'moodle/tag:editblocks',1,1466423536,0),(291,1,3,'moodle/tag:editblocks',1,1466423536,0),(292,1,1,'moodle/tag:editblocks',1,1466423536,0),(293,1,6,'moodle/block:view',1,1466423536,0),(294,1,7,'moodle/block:view',1,1466423536,0),(295,1,5,'moodle/block:view',1,1466423536,0),(296,1,4,'moodle/block:view',1,1466423536,0),(297,1,3,'moodle/block:view',1,1466423536,0),(298,1,3,'moodle/block:edit',1,1466423536,0),(299,1,1,'moodle/block:edit',1,1466423536,0),(300,1,7,'moodle/portfolio:export',1,1466423537,0),(301,1,5,'moodle/portfolio:export',1,1466423537,0),(302,1,4,'moodle/portfolio:export',1,1466423537,0),(303,1,3,'moodle/portfolio:export',1,1466423537,0),(304,1,8,'moodle/comment:view',1,1466423537,0),(305,1,6,'moodle/comment:view',1,1466423537,0),(306,1,7,'moodle/comment:view',1,1466423537,0),(307,1,5,'moodle/comment:view',1,1466423537,0),(308,1,4,'moodle/comment:view',1,1466423537,0),(309,1,3,'moodle/comment:view',1,1466423537,0),(310,1,1,'moodle/comment:view',1,1466423537,0),(311,1,7,'moodle/comment:post',1,1466423537,0),(312,1,5,'moodle/comment:post',1,1466423537,0),(313,1,4,'moodle/comment:post',1,1466423537,0),(314,1,3,'moodle/comment:post',1,1466423537,0),(315,1,1,'moodle/comment:post',1,1466423537,0),(316,1,3,'moodle/comment:delete',1,1466423537,0),(317,1,1,'moodle/comment:delete',1,1466423537,0),(318,1,1,'moodle/webservice:createtoken',1,1466423537,0),(319,1,7,'moodle/webservice:createmobiletoken',1,1466423537,0),(320,1,7,'moodle/rating:view',1,1466423537,0),(321,1,5,'moodle/rating:view',1,1466423537,0),(322,1,4,'moodle/rating:view',1,1466423537,0),(323,1,3,'moodle/rating:view',1,1466423537,0),(324,1,1,'moodle/rating:view',1,1466423537,0),(325,1,7,'moodle/rating:viewany',1,1466423537,0),(326,1,5,'moodle/rating:viewany',1,1466423537,0),(327,1,4,'moodle/rating:viewany',1,1466423537,0),(328,1,3,'moodle/rating:viewany',1,1466423537,0),(329,1,1,'moodle/rating:viewany',1,1466423537,0),(330,1,7,'moodle/rating:viewall',1,1466423537,0),(331,1,5,'moodle/rating:viewall',1,1466423537,0),(332,1,4,'moodle/rating:viewall',1,1466423537,0),(333,1,3,'moodle/rating:viewall',1,1466423537,0),(334,1,1,'moodle/rating:viewall',1,1466423537,0),(335,1,7,'moodle/rating:rate',1,1466423537,0),(336,1,5,'moodle/rating:rate',1,1466423537,0),(337,1,4,'moodle/rating:rate',1,1466423537,0),(338,1,3,'moodle/rating:rate',1,1466423537,0),(339,1,1,'moodle/rating:rate',1,1466423538,0),(340,1,1,'moodle/course:publish',1,1466423538,0),(341,1,4,'moodle/course:markcomplete',1,1466423538,0),(342,1,3,'moodle/course:markcomplete',1,1466423538,0),(343,1,1,'moodle/course:markcomplete',1,1466423538,0),(344,1,1,'moodle/community:add',1,1466423538,0),(345,1,4,'moodle/community:add',1,1466423538,0),(346,1,3,'moodle/community:add',1,1466423538,0),(347,1,1,'moodle/community:download',1,1466423538,0),(348,1,3,'moodle/community:download',1,1466423538,0),(349,1,1,'moodle/badges:manageglobalsettings',1,1466423538,0),(350,1,7,'moodle/badges:viewbadges',1,1466423538,0),(351,1,7,'moodle/badges:manageownbadges',1,1466423538,0),(352,1,7,'moodle/badges:viewotherbadges',1,1466423538,0),(353,1,7,'moodle/badges:earnbadge',1,1466423538,0),(354,1,1,'moodle/badges:createbadge',1,1466423538,0),(355,1,3,'moodle/badges:createbadge',1,1466423538,0),(356,1,1,'moodle/badges:deletebadge',1,1466423538,0),(357,1,3,'moodle/badges:deletebadge',1,1466423538,0),(358,1,1,'moodle/badges:configuredetails',1,1466423538,0),(359,1,3,'moodle/badges:configuredetails',1,1466423538,0),(360,1,1,'moodle/badges:configurecriteria',1,1466423538,0),(361,1,3,'moodle/badges:configurecriteria',1,1466423538,0),(362,1,1,'moodle/badges:configuremessages',1,1466423538,0),(363,1,3,'moodle/badges:configuremessages',1,1466423538,0),(364,1,1,'moodle/badges:awardbadge',1,1466423538,0),(365,1,4,'moodle/badges:awardbadge',1,1466423538,0),(366,1,3,'moodle/badges:awardbadge',1,1466423538,0),(367,1,1,'moodle/badges:viewawarded',1,1466423538,0),(368,1,4,'moodle/badges:viewawarded',1,1466423539,0),(369,1,3,'moodle/badges:viewawarded',1,1466423539,0),(370,1,6,'moodle/search:query',1,1466423539,0),(371,1,7,'moodle/search:query',1,1466423539,0),(372,1,5,'moodle/search:query',1,1466423539,0),(373,1,4,'moodle/search:query',1,1466423539,0),(374,1,3,'moodle/search:query',1,1466423539,0),(375,1,1,'moodle/search:query',1,1466423539,0),(376,1,1,'moodle/competency:competencymanage',1,1466423539,0),(377,1,7,'moodle/competency:competencyview',1,1466423539,0),(378,1,3,'moodle/competency:competencygrade',1,1466423539,0),(379,1,4,'moodle/competency:competencygrade',1,1466423539,0),(380,1,1,'moodle/competency:competencygrade',1,1466423539,0),(381,1,3,'moodle/competency:coursecompetencymanage',1,1466423539,0),(382,1,1,'moodle/competency:coursecompetencymanage',1,1466423539,0),(383,1,1,'moodle/competency:coursecompetencyconfigure',1,1466423539,0),(384,1,5,'moodle/competency:coursecompetencygradable',1,1466423539,0),(385,1,7,'moodle/competency:coursecompetencyview',1,1466423539,0),(386,1,1,'moodle/competency:planmanage',1,1466423540,0),(387,1,1,'moodle/competency:planmanagedraft',1,1466423540,0),(388,1,1,'moodle/competency:planview',1,1466423540,0),(389,1,1,'moodle/competency:planviewdraft',1,1466423540,0),(390,1,7,'moodle/competency:planviewown',1,1466423540,0),(391,1,1,'moodle/competency:planrequestreview',1,1466423540,0),(392,1,7,'moodle/competency:planrequestreviewown',1,1466423540,0),(393,1,1,'moodle/competency:planreview',1,1466423540,0),(394,1,1,'moodle/competency:plancomment',1,1466423540,0),(395,1,7,'moodle/competency:plancommentown',1,1466423540,0),(396,1,1,'moodle/competency:usercompetencyview',1,1466423540,0),(397,1,3,'moodle/competency:usercompetencyview',1,1466423540,0),(398,1,4,'moodle/competency:usercompetencyview',1,1466423540,0),(399,1,1,'moodle/competency:usercompetencyrequestreview',1,1466423540,0),(400,1,7,'moodle/competency:usercompetencyrequestreviewown',1,1466423540,0),(401,1,1,'moodle/competency:usercompetencyreview',1,1466423540,0),(402,1,1,'moodle/competency:usercompetencycomment',1,1466423540,0),(403,1,7,'moodle/competency:usercompetencycommentown',1,1466423540,0),(404,1,1,'moodle/competency:templatemanage',1,1466423540,0),(405,1,1,'moodle/competency:templateview',1,1466423541,0),(406,1,1,'moodle/competency:userevidencemanage',1,1466423541,0),(407,1,7,'moodle/competency:userevidencemanageown',1,1466423541,0),(408,1,1,'moodle/competency:userevidenceview',1,1466423541,0),(409,1,6,'mod/assign:view',1,1466423570,0),(410,1,5,'mod/assign:view',1,1466423570,0),(411,1,4,'mod/assign:view',1,1466423570,0),(412,1,3,'mod/assign:view',1,1466423570,0),(413,1,1,'mod/assign:view',1,1466423570,0),(414,1,5,'mod/assign:submit',1,1466423570,0),(415,1,4,'mod/assign:grade',1,1466423570,0),(416,1,3,'mod/assign:grade',1,1466423570,0),(417,1,1,'mod/assign:grade',1,1466423570,0),(418,1,4,'mod/assign:exportownsubmission',1,1466423570,0),(419,1,3,'mod/assign:exportownsubmission',1,1466423570,0),(420,1,1,'mod/assign:exportownsubmission',1,1466423570,0),(421,1,5,'mod/assign:exportownsubmission',1,1466423570,0),(422,1,3,'mod/assign:addinstance',1,1466423570,0),(423,1,1,'mod/assign:addinstance',1,1466423570,0),(424,1,4,'mod/assign:grantextension',1,1466423570,0),(425,1,3,'mod/assign:grantextension',1,1466423570,0),(426,1,1,'mod/assign:grantextension',1,1466423570,0),(427,1,3,'mod/assign:revealidentities',1,1466423570,0),(428,1,1,'mod/assign:revealidentities',1,1466423570,0),(429,1,3,'mod/assign:reviewgrades',1,1466423570,0),(430,1,1,'mod/assign:reviewgrades',1,1466423570,0),(431,1,3,'mod/assign:releasegrades',1,1466423570,0),(432,1,1,'mod/assign:releasegrades',1,1466423570,0),(433,1,3,'mod/assign:managegrades',1,1466423570,0),(434,1,1,'mod/assign:managegrades',1,1466423570,0),(435,1,3,'mod/assign:manageallocations',1,1466423570,0),(436,1,1,'mod/assign:manageallocations',1,1466423571,0),(437,1,3,'mod/assign:viewgrades',1,1466423571,0),(438,1,1,'mod/assign:viewgrades',1,1466423571,0),(439,1,4,'mod/assign:viewgrades',1,1466423571,0),(440,1,1,'mod/assign:viewblinddetails',1,1466423571,0),(441,1,4,'mod/assign:receivegradernotifications',1,1466423571,0),(442,1,3,'mod/assign:receivegradernotifications',1,1466423571,0),(443,1,1,'mod/assign:receivegradernotifications',1,1466423571,0),(444,1,6,'mod/assignment:view',1,1466423573,0),(445,1,5,'mod/assignment:view',1,1466423573,0),(446,1,4,'mod/assignment:view',1,1466423573,0),(447,1,3,'mod/assignment:view',1,1466423573,0),(448,1,1,'mod/assignment:view',1,1466423573,0),(449,1,3,'mod/assignment:addinstance',1,1466423573,0),(450,1,1,'mod/assignment:addinstance',1,1466423573,0),(451,1,5,'mod/assignment:submit',1,1466423573,0),(452,1,4,'mod/assignment:grade',1,1466423573,0),(453,1,3,'mod/assignment:grade',1,1466423573,0),(454,1,1,'mod/assignment:grade',1,1466423573,0),(455,1,4,'mod/assignment:exportownsubmission',1,1466423573,0),(456,1,3,'mod/assignment:exportownsubmission',1,1466423573,0),(457,1,1,'mod/assignment:exportownsubmission',1,1466423573,0),(458,1,5,'mod/assignment:exportownsubmission',1,1466423573,0),(459,1,3,'mod/book:addinstance',1,1466423573,0),(460,1,1,'mod/book:addinstance',1,1466423573,0),(461,1,6,'mod/book:read',1,1466423573,0),(462,1,8,'mod/book:read',1,1466423573,0),(463,1,5,'mod/book:read',1,1466423573,0),(464,1,4,'mod/book:read',1,1466423573,0),(465,1,3,'mod/book:read',1,1466423573,0),(466,1,1,'mod/book:read',1,1466423573,0),(467,1,4,'mod/book:viewhiddenchapters',1,1466423573,0),(468,1,3,'mod/book:viewhiddenchapters',1,1466423573,0),(469,1,1,'mod/book:viewhiddenchapters',1,1466423573,0),(470,1,3,'mod/book:edit',1,1466423573,0),(471,1,1,'mod/book:edit',1,1466423573,0),(472,1,3,'mod/chat:addinstance',1,1466423574,0),(473,1,1,'mod/chat:addinstance',1,1466423574,0),(474,1,5,'mod/chat:chat',1,1466423574,0),(475,1,4,'mod/chat:chat',1,1466423574,0),(476,1,3,'mod/chat:chat',1,1466423574,0),(477,1,1,'mod/chat:chat',1,1466423574,0),(478,1,5,'mod/chat:readlog',1,1466423574,0),(479,1,4,'mod/chat:readlog',1,1466423574,0),(480,1,3,'mod/chat:readlog',1,1466423574,0),(481,1,1,'mod/chat:readlog',1,1466423574,0),(482,1,4,'mod/chat:deletelog',1,1466423574,0),(483,1,3,'mod/chat:deletelog',1,1466423574,0),(484,1,1,'mod/chat:deletelog',1,1466423574,0),(485,1,4,'mod/chat:exportparticipatedsession',1,1466423574,0),(486,1,3,'mod/chat:exportparticipatedsession',1,1466423574,0),(487,1,1,'mod/chat:exportparticipatedsession',1,1466423574,0),(488,1,4,'mod/chat:exportsession',1,1466423574,0),(489,1,3,'mod/chat:exportsession',1,1466423574,0),(490,1,1,'mod/chat:exportsession',1,1466423574,0),(491,1,3,'mod/choice:addinstance',1,1466423575,0),(492,1,1,'mod/choice:addinstance',1,1466423575,0),(493,1,5,'mod/choice:choose',1,1466423575,0),(494,1,4,'mod/choice:choose',1,1466423575,0),(495,1,3,'mod/choice:choose',1,1466423575,0),(496,1,4,'mod/choice:readresponses',1,1466423575,0),(497,1,3,'mod/choice:readresponses',1,1466423575,0),(498,1,1,'mod/choice:readresponses',1,1466423575,0),(499,1,4,'mod/choice:deleteresponses',1,1466423575,0),(500,1,3,'mod/choice:deleteresponses',1,1466423575,0),(501,1,1,'mod/choice:deleteresponses',1,1466423575,0),(502,1,4,'mod/choice:downloadresponses',1,1466423575,0),(503,1,3,'mod/choice:downloadresponses',1,1466423575,0),(504,1,1,'mod/choice:downloadresponses',1,1466423575,0),(505,1,3,'mod/data:addinstance',1,1466423575,0),(506,1,1,'mod/data:addinstance',1,1466423575,0),(507,1,8,'mod/data:viewentry',1,1466423575,0),(508,1,6,'mod/data:viewentry',1,1466423575,0),(509,1,5,'mod/data:viewentry',1,1466423575,0),(510,1,4,'mod/data:viewentry',1,1466423575,0),(511,1,3,'mod/data:viewentry',1,1466423575,0),(512,1,1,'mod/data:viewentry',1,1466423575,0),(513,1,5,'mod/data:writeentry',1,1466423575,0),(514,1,4,'mod/data:writeentry',1,1466423575,0),(515,1,3,'mod/data:writeentry',1,1466423575,0),(516,1,1,'mod/data:writeentry',1,1466423575,0),(517,1,5,'mod/data:comment',1,1466423575,0),(518,1,4,'mod/data:comment',1,1466423575,0),(519,1,3,'mod/data:comment',1,1466423575,0),(520,1,1,'mod/data:comment',1,1466423575,0),(521,1,4,'mod/data:rate',1,1466423575,0),(522,1,3,'mod/data:rate',1,1466423575,0),(523,1,1,'mod/data:rate',1,1466423575,0),(524,1,4,'mod/data:viewrating',1,1466423576,0),(525,1,3,'mod/data:viewrating',1,1466423576,0),(526,1,1,'mod/data:viewrating',1,1466423576,0),(527,1,4,'mod/data:viewanyrating',1,1466423576,0),(528,1,3,'mod/data:viewanyrating',1,1466423576,0),(529,1,1,'mod/data:viewanyrating',1,1466423576,0),(530,1,4,'mod/data:viewallratings',1,1466423576,0),(531,1,3,'mod/data:viewallratings',1,1466423576,0),(532,1,1,'mod/data:viewallratings',1,1466423576,0),(533,1,4,'mod/data:approve',1,1466423576,0),(534,1,3,'mod/data:approve',1,1466423576,0),(535,1,1,'mod/data:approve',1,1466423576,0),(536,1,4,'mod/data:manageentries',1,1466423576,0),(537,1,3,'mod/data:manageentries',1,1466423576,0),(538,1,1,'mod/data:manageentries',1,1466423576,0),(539,1,4,'mod/data:managecomments',1,1466423576,0),(540,1,3,'mod/data:managecomments',1,1466423576,0),(541,1,1,'mod/data:managecomments',1,1466423576,0),(542,1,3,'mod/data:managetemplates',1,1466423576,0),(543,1,1,'mod/data:managetemplates',1,1466423576,0),(544,1,4,'mod/data:viewalluserpresets',1,1466423576,0),(545,1,3,'mod/data:viewalluserpresets',1,1466423576,0),(546,1,1,'mod/data:viewalluserpresets',1,1466423576,0),(547,1,1,'mod/data:manageuserpresets',1,1466423576,0),(548,1,1,'mod/data:exportentry',1,1466423576,0),(549,1,4,'mod/data:exportentry',1,1466423576,0),(550,1,3,'mod/data:exportentry',1,1466423576,0),(551,1,1,'mod/data:exportownentry',1,1466423576,0),(552,1,4,'mod/data:exportownentry',1,1466423576,0),(553,1,3,'mod/data:exportownentry',1,1466423576,0),(554,1,5,'mod/data:exportownentry',1,1466423576,0),(555,1,1,'mod/data:exportallentries',1,1466423576,0),(556,1,4,'mod/data:exportallentries',1,1466423576,0),(557,1,3,'mod/data:exportallentries',1,1466423576,0),(558,1,1,'mod/data:exportuserinfo',1,1466423576,0),(559,1,4,'mod/data:exportuserinfo',1,1466423576,0),(560,1,3,'mod/data:exportuserinfo',1,1466423576,0),(561,1,3,'mod/feedback:addinstance',1,1466423577,0),(562,1,1,'mod/feedback:addinstance',1,1466423577,0),(563,1,6,'mod/feedback:view',1,1466423577,0),(564,1,8,'mod/feedback:view',1,1466423577,0),(565,1,5,'mod/feedback:view',1,1466423577,0),(566,1,4,'mod/feedback:view',1,1466423577,0),(567,1,3,'mod/feedback:view',1,1466423577,0),(568,1,1,'mod/feedback:view',1,1466423577,0),(569,1,8,'mod/feedback:complete',1,1466423577,0),(570,1,5,'mod/feedback:complete',1,1466423577,0),(571,1,5,'mod/feedback:viewanalysepage',1,1466423577,0),(572,1,3,'mod/feedback:viewanalysepage',1,1466423577,0),(573,1,1,'mod/feedback:viewanalysepage',1,1466423577,0),(574,1,3,'mod/feedback:deletesubmissions',1,1466423577,0),(575,1,1,'mod/feedback:deletesubmissions',1,1466423577,0),(576,1,1,'mod/feedback:mapcourse',1,1466423577,0),(577,1,3,'mod/feedback:edititems',1,1466423577,0),(578,1,1,'mod/feedback:edititems',1,1466423577,0),(579,1,3,'mod/feedback:createprivatetemplate',1,1466423577,0),(580,1,1,'mod/feedback:createprivatetemplate',1,1466423577,0),(581,1,3,'mod/feedback:createpublictemplate',1,1466423577,0),(582,1,1,'mod/feedback:createpublictemplate',1,1466423577,0),(583,1,3,'mod/feedback:deletetemplate',1,1466423577,0),(584,1,1,'mod/feedback:deletetemplate',1,1466423577,0),(585,1,4,'mod/feedback:viewreports',1,1466423577,0),(586,1,3,'mod/feedback:viewreports',1,1466423577,0),(587,1,1,'mod/feedback:viewreports',1,1466423577,0),(588,1,4,'mod/feedback:receivemail',1,1466423577,0),(589,1,3,'mod/feedback:receivemail',1,1466423577,0),(590,1,3,'mod/folder:addinstance',1,1466423577,0),(591,1,1,'mod/folder:addinstance',1,1466423577,0),(592,1,6,'mod/folder:view',1,1466423577,0),(593,1,7,'mod/folder:view',1,1466423577,0),(594,1,3,'mod/folder:managefiles',1,1466423577,0),(595,1,3,'mod/forum:addinstance',1,1466423578,0),(596,1,1,'mod/forum:addinstance',1,1466423578,0),(597,1,8,'mod/forum:viewdiscussion',1,1466423578,0),(598,1,6,'mod/forum:viewdiscussion',1,1466423578,0),(599,1,5,'mod/forum:viewdiscussion',1,1466423578,0),(600,1,4,'mod/forum:viewdiscussion',1,1466423578,0),(601,1,3,'mod/forum:viewdiscussion',1,1466423578,0),(602,1,1,'mod/forum:viewdiscussion',1,1466423578,0),(603,1,4,'mod/forum:viewhiddentimedposts',1,1466423578,0),(604,1,3,'mod/forum:viewhiddentimedposts',1,1466423578,0),(605,1,1,'mod/forum:viewhiddentimedposts',1,1466423578,0),(606,1,5,'mod/forum:startdiscussion',1,1466423579,0),(607,1,4,'mod/forum:startdiscussion',1,1466423579,0),(608,1,3,'mod/forum:startdiscussion',1,1466423579,0),(609,1,1,'mod/forum:startdiscussion',1,1466423579,0),(610,1,5,'mod/forum:replypost',1,1466423579,0),(611,1,4,'mod/forum:replypost',1,1466423579,0),(612,1,3,'mod/forum:replypost',1,1466423579,0),(613,1,1,'mod/forum:replypost',1,1466423579,0),(614,1,4,'mod/forum:addnews',1,1466423579,0),(615,1,3,'mod/forum:addnews',1,1466423579,0),(616,1,1,'mod/forum:addnews',1,1466423579,0),(617,1,4,'mod/forum:replynews',1,1466423579,0),(618,1,3,'mod/forum:replynews',1,1466423579,0),(619,1,1,'mod/forum:replynews',1,1466423579,0),(620,1,5,'mod/forum:viewrating',1,1466423580,0),(621,1,4,'mod/forum:viewrating',1,1466423580,0),(622,1,3,'mod/forum:viewrating',1,1466423580,0),(623,1,1,'mod/forum:viewrating',1,1466423580,0),(624,1,4,'mod/forum:viewanyrating',1,1466423580,0),(625,1,3,'mod/forum:viewanyrating',1,1466423580,0),(626,1,1,'mod/forum:viewanyrating',1,1466423580,0),(627,1,4,'mod/forum:viewallratings',1,1466423580,0),(628,1,3,'mod/forum:viewallratings',1,1466423580,0),(629,1,1,'mod/forum:viewallratings',1,1466423580,0),(630,1,4,'mod/forum:rate',1,1466423580,0),(631,1,3,'mod/forum:rate',1,1466423580,0),(632,1,1,'mod/forum:rate',1,1466423580,0),(633,1,5,'mod/forum:createattachment',1,1466423580,0),(634,1,4,'mod/forum:createattachment',1,1466423580,0),(635,1,3,'mod/forum:createattachment',1,1466423580,0),(636,1,1,'mod/forum:createattachment',1,1466423580,0),(637,1,5,'mod/forum:deleteownpost',1,1466423580,0),(638,1,4,'mod/forum:deleteownpost',1,1466423580,0),(639,1,3,'mod/forum:deleteownpost',1,1466423580,0),(640,1,1,'mod/forum:deleteownpost',1,1466423581,0),(641,1,4,'mod/forum:deleteanypost',1,1466423581,0),(642,1,3,'mod/forum:deleteanypost',1,1466423581,0),(643,1,1,'mod/forum:deleteanypost',1,1466423581,0),(644,1,4,'mod/forum:splitdiscussions',1,1466423581,0),(645,1,3,'mod/forum:splitdiscussions',1,1466423581,0),(646,1,1,'mod/forum:splitdiscussions',1,1466423581,0),(647,1,4,'mod/forum:movediscussions',1,1466423581,0),(648,1,3,'mod/forum:movediscussions',1,1466423581,0),(649,1,1,'mod/forum:movediscussions',1,1466423581,0),(650,1,4,'mod/forum:pindiscussions',1,1466423581,0),(651,1,3,'mod/forum:pindiscussions',1,1466423581,0),(652,1,1,'mod/forum:pindiscussions',1,1466423581,0),(653,1,4,'mod/forum:editanypost',1,1466423581,0),(654,1,3,'mod/forum:editanypost',1,1466423581,0),(655,1,1,'mod/forum:editanypost',1,1466423581,0),(656,1,4,'mod/forum:viewqandawithoutposting',1,1466423581,0),(657,1,3,'mod/forum:viewqandawithoutposting',1,1466423581,0),(658,1,1,'mod/forum:viewqandawithoutposting',1,1466423581,0),(659,1,4,'mod/forum:viewsubscribers',1,1466423581,0),(660,1,3,'mod/forum:viewsubscribers',1,1466423581,0),(661,1,1,'mod/forum:viewsubscribers',1,1466423582,0),(662,1,4,'mod/forum:managesubscriptions',1,1466423582,0),(663,1,3,'mod/forum:managesubscriptions',1,1466423582,0),(664,1,1,'mod/forum:managesubscriptions',1,1466423582,0),(665,1,4,'mod/forum:postwithoutthrottling',1,1466423582,0),(666,1,3,'mod/forum:postwithoutthrottling',1,1466423582,0),(667,1,1,'mod/forum:postwithoutthrottling',1,1466423582,0),(668,1,4,'mod/forum:exportdiscussion',1,1466423582,0),(669,1,3,'mod/forum:exportdiscussion',1,1466423582,0),(670,1,1,'mod/forum:exportdiscussion',1,1466423582,0),(671,1,4,'mod/forum:exportpost',1,1466423582,0),(672,1,3,'mod/forum:exportpost',1,1466423582,0),(673,1,1,'mod/forum:exportpost',1,1466423582,0),(674,1,4,'mod/forum:exportownpost',1,1466423582,0),(675,1,3,'mod/forum:exportownpost',1,1466423582,0),(676,1,1,'mod/forum:exportownpost',1,1466423582,0),(677,1,5,'mod/forum:exportownpost',1,1466423582,0),(678,1,4,'mod/forum:addquestion',1,1466423582,0),(679,1,3,'mod/forum:addquestion',1,1466423583,0),(680,1,1,'mod/forum:addquestion',1,1466423583,0),(681,1,5,'mod/forum:allowforcesubscribe',1,1466423583,0),(682,1,4,'mod/forum:allowforcesubscribe',1,1466423583,0),(683,1,3,'mod/forum:allowforcesubscribe',1,1466423583,0),(684,1,8,'mod/forum:allowforcesubscribe',1,1466423583,0),(685,1,4,'mod/forum:canposttomygroups',1,1466423583,0),(686,1,3,'mod/forum:canposttomygroups',1,1466423583,0),(687,1,1,'mod/forum:canposttomygroups',1,1466423583,0),(688,1,3,'mod/glossary:addinstance',1,1466423584,0),(689,1,1,'mod/glossary:addinstance',1,1466423584,0),(690,1,8,'mod/glossary:view',1,1466423584,0),(691,1,6,'mod/glossary:view',1,1466423584,0),(692,1,5,'mod/glossary:view',1,1466423584,0),(693,1,4,'mod/glossary:view',1,1466423584,0),(694,1,3,'mod/glossary:view',1,1466423584,0),(695,1,1,'mod/glossary:view',1,1466423584,0),(696,1,5,'mod/glossary:write',1,1466423584,0),(697,1,4,'mod/glossary:write',1,1466423584,0),(698,1,3,'mod/glossary:write',1,1466423584,0),(699,1,1,'mod/glossary:write',1,1466423584,0),(700,1,4,'mod/glossary:manageentries',1,1466423584,0),(701,1,3,'mod/glossary:manageentries',1,1466423584,0),(702,1,1,'mod/glossary:manageentries',1,1466423584,0),(703,1,4,'mod/glossary:managecategories',1,1466423584,0),(704,1,3,'mod/glossary:managecategories',1,1466423584,0),(705,1,1,'mod/glossary:managecategories',1,1466423584,0),(706,1,5,'mod/glossary:comment',1,1466423584,0),(707,1,4,'mod/glossary:comment',1,1466423584,0),(708,1,3,'mod/glossary:comment',1,1466423584,0),(709,1,1,'mod/glossary:comment',1,1466423584,0),(710,1,4,'mod/glossary:managecomments',1,1466423584,0),(711,1,3,'mod/glossary:managecomments',1,1466423584,0),(712,1,1,'mod/glossary:managecomments',1,1466423584,0),(713,1,4,'mod/glossary:import',1,1466423584,0),(714,1,3,'mod/glossary:import',1,1466423584,0),(715,1,1,'mod/glossary:import',1,1466423584,0),(716,1,4,'mod/glossary:export',1,1466423584,0),(717,1,3,'mod/glossary:export',1,1466423584,0),(718,1,1,'mod/glossary:export',1,1466423584,0),(719,1,4,'mod/glossary:approve',1,1466423585,0),(720,1,3,'mod/glossary:approve',1,1466423585,0),(721,1,1,'mod/glossary:approve',1,1466423585,0),(722,1,4,'mod/glossary:rate',1,1466423585,0),(723,1,3,'mod/glossary:rate',1,1466423585,0),(724,1,1,'mod/glossary:rate',1,1466423585,0),(725,1,4,'mod/glossary:viewrating',1,1466423585,0),(726,1,3,'mod/glossary:viewrating',1,1466423585,0),(727,1,1,'mod/glossary:viewrating',1,1466423585,0),(728,1,4,'mod/glossary:viewanyrating',1,1466423585,0),(729,1,3,'mod/glossary:viewanyrating',1,1466423585,0),(730,1,1,'mod/glossary:viewanyrating',1,1466423585,0),(731,1,4,'mod/glossary:viewallratings',1,1466423585,0),(732,1,3,'mod/glossary:viewallratings',1,1466423585,0),(733,1,1,'mod/glossary:viewallratings',1,1466423585,0),(734,1,4,'mod/glossary:exportentry',1,1466423585,0),(735,1,3,'mod/glossary:exportentry',1,1466423585,0),(736,1,1,'mod/glossary:exportentry',1,1466423585,0),(737,1,4,'mod/glossary:exportownentry',1,1466423585,0),(738,1,3,'mod/glossary:exportownentry',1,1466423585,0),(739,1,1,'mod/glossary:exportownentry',1,1466423585,0),(740,1,5,'mod/glossary:exportownentry',1,1466423585,0),(741,1,6,'mod/imscp:view',1,1466423586,0),(742,1,7,'mod/imscp:view',1,1466423586,0),(743,1,3,'mod/imscp:addinstance',1,1466423586,0),(744,1,1,'mod/imscp:addinstance',1,1466423586,0),(745,1,3,'mod/label:addinstance',1,1466423586,0),(746,1,1,'mod/label:addinstance',1,1466423586,0),(747,1,3,'mod/lesson:addinstance',1,1466423587,0),(748,1,1,'mod/lesson:addinstance',1,1466423587,0),(749,1,3,'mod/lesson:edit',1,1466423587,0),(750,1,1,'mod/lesson:edit',1,1466423587,0),(751,1,4,'mod/lesson:grade',1,1466423587,0),(752,1,3,'mod/lesson:grade',1,1466423587,0),(753,1,1,'mod/lesson:grade',1,1466423587,0),(754,1,4,'mod/lesson:viewreports',1,1466423587,0),(755,1,3,'mod/lesson:viewreports',1,1466423587,0),(756,1,1,'mod/lesson:viewreports',1,1466423587,0),(757,1,4,'mod/lesson:manage',1,1466423587,0),(758,1,3,'mod/lesson:manage',1,1466423587,0),(759,1,1,'mod/lesson:manage',1,1466423587,0),(760,1,3,'mod/lesson:manageoverrides',1,1466423587,0),(761,1,1,'mod/lesson:manageoverrides',1,1466423587,0),(762,1,5,'mod/lti:view',1,1466423587,0),(763,1,4,'mod/lti:view',1,1466423587,0),(764,1,3,'mod/lti:view',1,1466423587,0),(765,1,1,'mod/lti:view',1,1466423587,0),(766,1,3,'mod/lti:addinstance',1,1466423587,0),(767,1,1,'mod/lti:addinstance',1,1466423587,0),(768,1,4,'mod/lti:manage',1,1466423587,0),(769,1,3,'mod/lti:manage',1,1466423587,0),(770,1,1,'mod/lti:manage',1,1466423587,0),(771,1,3,'mod/lti:addcoursetool',1,1466423587,0),(772,1,1,'mod/lti:addcoursetool',1,1466423587,0),(773,1,3,'mod/lti:requesttooladd',1,1466423587,0),(774,1,1,'mod/lti:requesttooladd',1,1466423587,0),(775,1,6,'mod/page:view',1,1466423588,0),(776,1,7,'mod/page:view',1,1466423588,0),(777,1,3,'mod/page:addinstance',1,1466423588,0),(778,1,1,'mod/page:addinstance',1,1466423588,0),(779,1,6,'mod/quiz:view',1,1466423589,0),(780,1,5,'mod/quiz:view',1,1466423589,0),(781,1,4,'mod/quiz:view',1,1466423589,0),(782,1,3,'mod/quiz:view',1,1466423589,0),(783,1,1,'mod/quiz:view',1,1466423589,0),(784,1,3,'mod/quiz:addinstance',1,1466423589,0),(785,1,1,'mod/quiz:addinstance',1,1466423589,0),(786,1,5,'mod/quiz:attempt',1,1466423589,0),(787,1,5,'mod/quiz:reviewmyattempts',1,1466423589,0),(788,1,3,'mod/quiz:manage',1,1466423589,0),(789,1,1,'mod/quiz:manage',1,1466423589,0),(790,1,3,'mod/quiz:manageoverrides',1,1466423589,0),(791,1,1,'mod/quiz:manageoverrides',1,1466423589,0),(792,1,4,'mod/quiz:preview',1,1466423590,0),(793,1,3,'mod/quiz:preview',1,1466423590,0),(794,1,1,'mod/quiz:preview',1,1466423590,0),(795,1,4,'mod/quiz:grade',1,1466423590,0),(796,1,3,'mod/quiz:grade',1,1466423590,0),(797,1,1,'mod/quiz:grade',1,1466423590,0),(798,1,4,'mod/quiz:regrade',1,1466423590,0),(799,1,3,'mod/quiz:regrade',1,1466423590,0),(800,1,1,'mod/quiz:regrade',1,1466423590,0),(801,1,4,'mod/quiz:viewreports',1,1466423590,0),(802,1,3,'mod/quiz:viewreports',1,1466423590,0),(803,1,1,'mod/quiz:viewreports',1,1466423590,0),(804,1,3,'mod/quiz:deleteattempts',1,1466423590,0),(805,1,1,'mod/quiz:deleteattempts',1,1466423590,0),(806,1,6,'mod/resource:view',1,1466423591,0),(807,1,7,'mod/resource:view',1,1466423591,0),(808,1,3,'mod/resource:addinstance',1,1466423591,0),(809,1,1,'mod/resource:addinstance',1,1466423591,0),(810,1,3,'mod/scorm:addinstance',1,1466423591,0),(811,1,1,'mod/scorm:addinstance',1,1466423591,0),(812,1,4,'mod/scorm:viewreport',1,1466423591,0),(813,1,3,'mod/scorm:viewreport',1,1466423591,0),(814,1,1,'mod/scorm:viewreport',1,1466423591,0),(815,1,5,'mod/scorm:skipview',1,1466423591,0),(816,1,5,'mod/scorm:savetrack',1,1466423591,0),(817,1,4,'mod/scorm:savetrack',1,1466423591,0),(818,1,3,'mod/scorm:savetrack',1,1466423591,0),(819,1,1,'mod/scorm:savetrack',1,1466423591,0),(820,1,5,'mod/scorm:viewscores',1,1466423591,0),(821,1,4,'mod/scorm:viewscores',1,1466423591,0),(822,1,3,'mod/scorm:viewscores',1,1466423591,0),(823,1,1,'mod/scorm:viewscores',1,1466423591,0),(824,1,4,'mod/scorm:deleteresponses',1,1466423591,0),(825,1,3,'mod/scorm:deleteresponses',1,1466423591,0),(826,1,1,'mod/scorm:deleteresponses',1,1466423591,0),(827,1,3,'mod/survey:addinstance',1,1466423593,0),(828,1,1,'mod/survey:addinstance',1,1466423593,0),(829,1,5,'mod/survey:participate',1,1466423593,0),(830,1,4,'mod/survey:participate',1,1466423593,0),(831,1,3,'mod/survey:participate',1,1466423593,0),(832,1,1,'mod/survey:participate',1,1466423593,0),(833,1,4,'mod/survey:readresponses',1,1466423593,0),(834,1,3,'mod/survey:readresponses',1,1466423593,0),(835,1,1,'mod/survey:readresponses',1,1466423593,0),(836,1,4,'mod/survey:download',1,1466423593,0),(837,1,3,'mod/survey:download',1,1466423593,0),(838,1,1,'mod/survey:download',1,1466423593,0),(839,1,6,'mod/url:view',1,1466423594,0),(840,1,7,'mod/url:view',1,1466423594,0),(841,1,3,'mod/url:addinstance',1,1466423594,0),(842,1,1,'mod/url:addinstance',1,1466423594,0),(843,1,3,'mod/wiki:addinstance',1,1466423594,0),(844,1,1,'mod/wiki:addinstance',1,1466423594,0),(845,1,6,'mod/wiki:viewpage',1,1466423594,0),(846,1,5,'mod/wiki:viewpage',1,1466423594,0),(847,1,4,'mod/wiki:viewpage',1,1466423595,0),(848,1,3,'mod/wiki:viewpage',1,1466423595,0),(849,1,1,'mod/wiki:viewpage',1,1466423595,0),(850,1,5,'mod/wiki:editpage',1,1466423595,0),(851,1,4,'mod/wiki:editpage',1,1466423595,0),(852,1,3,'mod/wiki:editpage',1,1466423595,0),(853,1,1,'mod/wiki:editpage',1,1466423595,0),(854,1,5,'mod/wiki:createpage',1,1466423595,0),(855,1,4,'mod/wiki:createpage',1,1466423595,0),(856,1,3,'mod/wiki:createpage',1,1466423595,0),(857,1,1,'mod/wiki:createpage',1,1466423595,0),(858,1,5,'mod/wiki:viewcomment',1,1466423595,0),(859,1,4,'mod/wiki:viewcomment',1,1466423595,0),(860,1,3,'mod/wiki:viewcomment',1,1466423595,0),(861,1,1,'mod/wiki:viewcomment',1,1466423595,0),(862,1,5,'mod/wiki:editcomment',1,1466423595,0),(863,1,4,'mod/wiki:editcomment',1,1466423595,0),(864,1,3,'mod/wiki:editcomment',1,1466423595,0),(865,1,1,'mod/wiki:editcomment',1,1466423595,0),(866,1,4,'mod/wiki:managecomment',1,1466423595,0),(867,1,3,'mod/wiki:managecomment',1,1466423595,0),(868,1,1,'mod/wiki:managecomment',1,1466423595,0),(869,1,4,'mod/wiki:managefiles',1,1466423595,0),(870,1,3,'mod/wiki:managefiles',1,1466423595,0),(871,1,1,'mod/wiki:managefiles',1,1466423595,0),(872,1,4,'mod/wiki:overridelock',1,1466423595,0),(873,1,3,'mod/wiki:overridelock',1,1466423595,0),(874,1,1,'mod/wiki:overridelock',1,1466423595,0),(875,1,4,'mod/wiki:managewiki',1,1466423595,0),(876,1,3,'mod/wiki:managewiki',1,1466423595,0),(877,1,1,'mod/wiki:managewiki',1,1466423595,0),(878,1,6,'mod/workshop:view',1,1466423596,0),(879,1,5,'mod/workshop:view',1,1466423596,0),(880,1,4,'mod/workshop:view',1,1466423596,0),(881,1,3,'mod/workshop:view',1,1466423596,0),(882,1,1,'mod/workshop:view',1,1466423596,0),(883,1,3,'mod/workshop:addinstance',1,1466423596,0),(884,1,1,'mod/workshop:addinstance',1,1466423596,0),(885,1,4,'mod/workshop:switchphase',1,1466423596,0),(886,1,3,'mod/workshop:switchphase',1,1466423596,0),(887,1,1,'mod/workshop:switchphase',1,1466423596,0),(888,1,3,'mod/workshop:editdimensions',1,1466423596,0),(889,1,1,'mod/workshop:editdimensions',1,1466423596,0),(890,1,5,'mod/workshop:submit',1,1466423596,0),(891,1,5,'mod/workshop:peerassess',1,1466423596,0),(892,1,4,'mod/workshop:manageexamples',1,1466423596,0),(893,1,3,'mod/workshop:manageexamples',1,1466423596,0),(894,1,1,'mod/workshop:manageexamples',1,1466423596,0),(895,1,4,'mod/workshop:allocate',1,1466423596,0),(896,1,3,'mod/workshop:allocate',1,1466423596,0),(897,1,1,'mod/workshop:allocate',1,1466423596,0),(898,1,4,'mod/workshop:publishsubmissions',1,1466423596,0),(899,1,3,'mod/workshop:publishsubmissions',1,1466423596,0),(900,1,1,'mod/workshop:publishsubmissions',1,1466423596,0),(901,1,5,'mod/workshop:viewauthornames',1,1466423596,0),(902,1,4,'mod/workshop:viewauthornames',1,1466423596,0),(903,1,3,'mod/workshop:viewauthornames',1,1466423597,0),(904,1,1,'mod/workshop:viewauthornames',1,1466423597,0),(905,1,4,'mod/workshop:viewreviewernames',1,1466423597,0),(906,1,3,'mod/workshop:viewreviewernames',1,1466423597,0),(907,1,1,'mod/workshop:viewreviewernames',1,1466423597,0),(908,1,4,'mod/workshop:viewallsubmissions',1,1466423597,0),(909,1,3,'mod/workshop:viewallsubmissions',1,1466423597,0),(910,1,1,'mod/workshop:viewallsubmissions',1,1466423597,0),(911,1,5,'mod/workshop:viewpublishedsubmissions',1,1466423597,0),(912,1,4,'mod/workshop:viewpublishedsubmissions',1,1466423597,0),(913,1,3,'mod/workshop:viewpublishedsubmissions',1,1466423597,0),(914,1,1,'mod/workshop:viewpublishedsubmissions',1,1466423597,0),(915,1,5,'mod/workshop:viewauthorpublished',1,1466423597,0),(916,1,4,'mod/workshop:viewauthorpublished',1,1466423597,0),(917,1,3,'mod/workshop:viewauthorpublished',1,1466423597,0),(918,1,1,'mod/workshop:viewauthorpublished',1,1466423597,0),(919,1,4,'mod/workshop:viewallassessments',1,1466423597,0),(920,1,3,'mod/workshop:viewallassessments',1,1466423597,0),(921,1,1,'mod/workshop:viewallassessments',1,1466423597,0),(922,1,4,'mod/workshop:overridegrades',1,1466423597,0),(923,1,3,'mod/workshop:overridegrades',1,1466423597,0),(924,1,1,'mod/workshop:overridegrades',1,1466423597,0),(925,1,4,'mod/workshop:ignoredeadlines',1,1466423597,0),(926,1,3,'mod/workshop:ignoredeadlines',1,1466423597,0),(927,1,1,'mod/workshop:ignoredeadlines',1,1466423597,0),(928,1,4,'mod/workshop:deletesubmissions',1,1466423597,0),(929,1,3,'mod/workshop:deletesubmissions',1,1466423597,0),(930,1,1,'mod/workshop:deletesubmissions',1,1466423597,0),(931,1,1,'enrol/category:config',1,1466423601,0),(932,1,3,'enrol/category:config',1,1466423601,0),(933,1,3,'enrol/cohort:config',1,1466423601,0),(934,1,1,'enrol/cohort:config',1,1466423601,0),(935,1,1,'enrol/cohort:unenrol',1,1466423601,0),(936,1,1,'enrol/database:unenrol',1,1466423601,0),(937,1,1,'enrol/database:config',1,1466423601,0),(938,1,3,'enrol/database:config',1,1466423601,0),(939,1,1,'enrol/guest:config',1,1466423601,0),(940,1,3,'enrol/guest:config',1,1466423601,0),(941,1,1,'enrol/imsenterprise:config',1,1466423602,0),(942,1,3,'enrol/imsenterprise:config',1,1466423602,0),(943,1,1,'enrol/ldap:manage',1,1466423602,0),(944,1,1,'enrol/lti:config',1,1466423602,0),(945,1,3,'enrol/lti:config',1,1466423602,0),(946,1,1,'enrol/lti:unenrol',1,1466423602,0),(947,1,3,'enrol/lti:unenrol',1,1466423602,0),(948,1,1,'enrol/manual:config',1,1466423602,0),(949,1,1,'enrol/manual:enrol',1,1466423602,0),(950,1,3,'enrol/manual:enrol',1,1466423602,0),(951,1,1,'enrol/manual:manage',1,1466423602,0),(952,1,3,'enrol/manual:manage',1,1466423602,0),(953,1,1,'enrol/manual:unenrol',1,1466423602,0),(954,1,3,'enrol/manual:unenrol',1,1466423602,0),(955,1,1,'enrol/meta:config',1,1466423603,0),(956,1,3,'enrol/meta:config',1,1466423603,0),(957,1,1,'enrol/meta:selectaslinked',1,1466423603,0),(958,1,1,'enrol/meta:unenrol',1,1466423603,0),(959,1,1,'enrol/mnet:config',1,1466423603,0),(960,1,3,'enrol/mnet:config',1,1466423603,0),(961,1,1,'enrol/paypal:config',1,1466423604,0),(962,1,1,'enrol/paypal:manage',1,1466423604,0),(963,1,3,'enrol/paypal:manage',1,1466423604,0),(964,1,1,'enrol/paypal:unenrol',1,1466423604,0),(965,1,3,'enrol/self:config',1,1466423604,0),(966,1,1,'enrol/self:config',1,1466423604,0),(967,1,3,'enrol/self:manage',1,1466423604,0),(968,1,1,'enrol/self:manage',1,1466423604,0),(969,1,1,'enrol/self:holdkey',-1000,1466423604,0),(970,1,5,'enrol/self:unenrolself',1,1466423604,0),(971,1,3,'enrol/self:unenrol',1,1466423604,0),(972,1,1,'enrol/self:unenrol',1,1466423604,0),(973,1,7,'message/airnotifier:managedevice',1,1466423604,0),(974,1,3,'block/activity_modules:addinstance',1,1466423605,0),(975,1,1,'block/activity_modules:addinstance',1,1466423605,0),(976,1,3,'block/activity_results:addinstance',1,1466423605,0),(977,1,1,'block/activity_results:addinstance',1,1466423605,0),(978,1,7,'block/admin_bookmarks:myaddinstance',1,1466423605,0),(979,1,3,'block/admin_bookmarks:addinstance',1,1466423605,0),(980,1,1,'block/admin_bookmarks:addinstance',1,1466423605,0),(981,1,3,'block/badges:addinstance',1,1466423606,0),(982,1,1,'block/badges:addinstance',1,1466423606,0),(983,1,7,'block/badges:myaddinstance',1,1466423606,0),(984,1,3,'block/blog_menu:addinstance',1,1466423606,0),(985,1,1,'block/blog_menu:addinstance',1,1466423606,0),(986,1,3,'block/blog_recent:addinstance',1,1466423606,0),(987,1,1,'block/blog_recent:addinstance',1,1466423606,0),(988,1,3,'block/blog_tags:addinstance',1,1466423606,0),(989,1,1,'block/blog_tags:addinstance',1,1466423606,0),(990,1,7,'block/calendar_month:myaddinstance',1,1466423606,0),(991,1,3,'block/calendar_month:addinstance',1,1466423606,0),(992,1,1,'block/calendar_month:addinstance',1,1466423606,0),(993,1,7,'block/calendar_upcoming:myaddinstance',1,1466423606,0),(994,1,3,'block/calendar_upcoming:addinstance',1,1466423606,0),(995,1,1,'block/calendar_upcoming:addinstance',1,1466423606,0),(996,1,7,'block/comments:myaddinstance',1,1466423606,0),(997,1,3,'block/comments:addinstance',1,1466423606,0),(998,1,1,'block/comments:addinstance',1,1466423606,0),(999,1,7,'block/community:myaddinstance',1,1466423607,0),(1000,1,3,'block/community:addinstance',1,1466423607,0),(1001,1,1,'block/community:addinstance',1,1466423607,0),(1002,1,3,'block/completionstatus:addinstance',1,1466423607,0),(1003,1,1,'block/completionstatus:addinstance',1,1466423607,0),(1004,1,7,'block/course_list:myaddinstance',1,1466423607,0),(1005,1,3,'block/course_list:addinstance',1,1466423607,0),(1006,1,1,'block/course_list:addinstance',1,1466423607,0),(1007,1,7,'block/course_overview:myaddinstance',1,1466423607,0),(1008,1,3,'block/course_overview:addinstance',1,1466423607,0),(1009,1,1,'block/course_overview:addinstance',1,1466423607,0),(1010,1,3,'block/course_summary:addinstance',1,1466423607,0),(1011,1,1,'block/course_summary:addinstance',1,1466423607,0),(1012,1,3,'block/feedback:addinstance',1,1466423607,0),(1013,1,1,'block/feedback:addinstance',1,1466423607,0),(1014,1,7,'block/globalsearch:myaddinstance',1,1466423607,0),(1015,1,3,'block/globalsearch:addinstance',1,1466423607,0),(1016,1,1,'block/globalsearch:addinstance',1,1466423607,0),(1017,1,7,'block/glossary_random:myaddinstance',1,1466423608,0),(1018,1,3,'block/glossary_random:addinstance',1,1466423608,0),(1019,1,1,'block/glossary_random:addinstance',1,1466423608,0),(1020,1,7,'block/html:myaddinstance',1,1466423608,0),(1021,1,3,'block/html:addinstance',1,1466423608,0),(1022,1,1,'block/html:addinstance',1,1466423608,0),(1023,1,3,'block/login:addinstance',1,1466423608,0),(1024,1,1,'block/login:addinstance',1,1466423608,0),(1025,1,3,'block/lp:addinstance',1,1466423608,0),(1026,1,1,'block/lp:addinstance',1,1466423608,0),(1027,1,7,'block/lp:myaddinstance',1,1466423608,0),(1028,1,7,'block/lp:view',1,1466423608,0),(1029,1,7,'block/mentees:myaddinstance',1,1466423608,0),(1030,1,3,'block/mentees:addinstance',1,1466423608,0),(1031,1,1,'block/mentees:addinstance',1,1466423608,0),(1032,1,7,'block/messages:myaddinstance',1,1466423609,0),(1033,1,3,'block/messages:addinstance',1,1466423609,0),(1034,1,1,'block/messages:addinstance',1,1466423609,0),(1035,1,7,'block/mnet_hosts:myaddinstance',1,1466423609,0),(1036,1,3,'block/mnet_hosts:addinstance',1,1466423609,0),(1037,1,1,'block/mnet_hosts:addinstance',1,1466423609,0),(1038,1,7,'block/myprofile:myaddinstance',1,1466423609,0),(1039,1,3,'block/myprofile:addinstance',1,1466423609,0),(1040,1,1,'block/myprofile:addinstance',1,1466423609,0),(1041,1,7,'block/navigation:myaddinstance',1,1466423609,0),(1042,1,3,'block/navigation:addinstance',1,1466423609,0),(1043,1,1,'block/navigation:addinstance',1,1466423609,0),(1044,1,7,'block/news_items:myaddinstance',1,1466423609,0),(1045,1,3,'block/news_items:addinstance',1,1466423609,0),(1046,1,1,'block/news_items:addinstance',1,1466423609,0),(1047,1,7,'block/online_users:myaddinstance',1,1466423610,0),(1048,1,3,'block/online_users:addinstance',1,1466423610,0),(1049,1,1,'block/online_users:addinstance',1,1466423610,0),(1050,1,7,'block/online_users:viewlist',1,1466423610,0),(1051,1,6,'block/online_users:viewlist',1,1466423610,0),(1052,1,5,'block/online_users:viewlist',1,1466423610,0),(1053,1,4,'block/online_users:viewlist',1,1466423610,0),(1054,1,3,'block/online_users:viewlist',1,1466423610,0),(1055,1,1,'block/online_users:viewlist',1,1466423610,0),(1056,1,3,'block/participants:addinstance',1,1466423610,0),(1057,1,1,'block/participants:addinstance',1,1466423610,0),(1058,1,7,'block/private_files:myaddinstance',1,1466423610,0),(1059,1,3,'block/private_files:addinstance',1,1466423610,0),(1060,1,1,'block/private_files:addinstance',1,1466423610,0),(1061,1,3,'block/quiz_results:addinstance',1,1466423611,0),(1062,1,1,'block/quiz_results:addinstance',1,1466423611,0),(1063,1,3,'block/recent_activity:addinstance',1,1466423611,0),(1064,1,1,'block/recent_activity:addinstance',1,1466423611,0),(1065,1,7,'block/recent_activity:viewaddupdatemodule',1,1466423611,0),(1066,1,7,'block/recent_activity:viewdeletemodule',1,1466423611,0),(1067,1,7,'block/rss_client:myaddinstance',1,1466423611,0),(1068,1,3,'block/rss_client:addinstance',1,1466423611,0),(1069,1,1,'block/rss_client:addinstance',1,1466423611,0),(1070,1,4,'block/rss_client:manageownfeeds',1,1466423611,0),(1071,1,3,'block/rss_client:manageownfeeds',1,1466423611,0),(1072,1,1,'block/rss_client:manageownfeeds',1,1466423611,0),(1073,1,1,'block/rss_client:manageanyfeeds',1,1466423611,0),(1074,1,3,'block/search_forums:addinstance',1,1466423611,0),(1075,1,1,'block/search_forums:addinstance',1,1466423611,0),(1076,1,3,'block/section_links:addinstance',1,1466423611,0),(1077,1,1,'block/section_links:addinstance',1,1466423611,0),(1078,1,3,'block/selfcompletion:addinstance',1,1466423612,0),(1079,1,1,'block/selfcompletion:addinstance',1,1466423612,0),(1080,1,7,'block/settings:myaddinstance',1,1466423612,0),(1081,1,3,'block/settings:addinstance',1,1466423612,0),(1082,1,1,'block/settings:addinstance',1,1466423612,0),(1083,1,3,'block/site_main_menu:addinstance',1,1466423612,0),(1084,1,1,'block/site_main_menu:addinstance',1,1466423612,0),(1085,1,3,'block/social_activities:addinstance',1,1466423612,0),(1086,1,1,'block/social_activities:addinstance',1,1466423612,0),(1087,1,3,'block/tag_flickr:addinstance',1,1466423612,0),(1088,1,1,'block/tag_flickr:addinstance',1,1466423612,0),(1089,1,3,'block/tag_youtube:addinstance',1,1466423613,0),(1090,1,1,'block/tag_youtube:addinstance',1,1466423613,0),(1091,1,7,'block/tags:myaddinstance',1,1466423613,0),(1092,1,3,'block/tags:addinstance',1,1466423613,0),(1093,1,1,'block/tags:addinstance',1,1466423613,0),(1094,1,4,'report/completion:view',1,1466423617,0),(1095,1,3,'report/completion:view',1,1466423617,0),(1096,1,1,'report/completion:view',1,1466423617,0),(1097,1,4,'report/courseoverview:view',1,1466423617,0),(1098,1,3,'report/courseoverview:view',1,1466423617,0),(1099,1,1,'report/courseoverview:view',1,1466423617,0),(1100,1,4,'report/log:view',1,1466423617,0),(1101,1,3,'report/log:view',1,1466423617,0),(1102,1,1,'report/log:view',1,1466423617,0),(1103,1,4,'report/log:viewtoday',1,1466423617,0),(1104,1,3,'report/log:viewtoday',1,1466423617,0),(1105,1,1,'report/log:viewtoday',1,1466423617,0),(1106,1,4,'report/loglive:view',1,1466423617,0),(1107,1,3,'report/loglive:view',1,1466423617,0),(1108,1,1,'report/loglive:view',1,1466423617,0),(1109,1,4,'report/outline:view',1,1466423617,0),(1110,1,3,'report/outline:view',1,1466423618,0),(1111,1,1,'report/outline:view',1,1466423618,0),(1112,1,4,'report/participation:view',1,1466423618,0),(1113,1,3,'report/participation:view',1,1466423618,0),(1114,1,1,'report/participation:view',1,1466423618,0),(1115,1,1,'report/performance:view',1,1466423618,0),(1116,1,4,'report/progress:view',1,1466423618,0),(1117,1,3,'report/progress:view',1,1466423618,0),(1118,1,1,'report/progress:view',1,1466423618,0),(1119,1,1,'report/security:view',1,1466423618,0),(1120,1,4,'report/stats:view',1,1466423618,0),(1121,1,3,'report/stats:view',1,1466423618,0),(1122,1,1,'report/stats:view',1,1466423618,0),(1123,1,6,'report/usersessions:manageownsessions',-1000,1466423619,0),(1124,1,7,'report/usersessions:manageownsessions',1,1466423619,0),(1125,1,1,'report/usersessions:manageownsessions',1,1466423619,0),(1126,1,4,'gradeexport/ods:view',1,1466423619,0),(1127,1,3,'gradeexport/ods:view',1,1466423619,0),(1128,1,1,'gradeexport/ods:view',1,1466423619,0),(1129,1,1,'gradeexport/ods:publish',1,1466423619,0),(1130,1,4,'gradeexport/txt:view',1,1466423619,0),(1131,1,3,'gradeexport/txt:view',1,1466423619,0),(1132,1,1,'gradeexport/txt:view',1,1466423619,0),(1133,1,1,'gradeexport/txt:publish',1,1466423619,0),(1134,1,4,'gradeexport/xls:view',1,1466423620,0),(1135,1,3,'gradeexport/xls:view',1,1466423620,0),(1136,1,1,'gradeexport/xls:view',1,1466423620,0),(1137,1,1,'gradeexport/xls:publish',1,1466423620,0),(1138,1,4,'gradeexport/xml:view',1,1466423620,0),(1139,1,3,'gradeexport/xml:view',1,1466423620,0),(1140,1,1,'gradeexport/xml:view',1,1466423620,0),(1141,1,1,'gradeexport/xml:publish',1,1466423620,0),(1142,1,3,'gradeimport/csv:view',1,1466423620,0),(1143,1,1,'gradeimport/csv:view',1,1466423620,0),(1144,1,3,'gradeimport/direct:view',1,1466423620,0),(1145,1,1,'gradeimport/direct:view',1,1466423620,0),(1146,1,3,'gradeimport/xml:view',1,1466423620,0),(1147,1,1,'gradeimport/xml:view',1,1466423620,0),(1148,1,1,'gradeimport/xml:publish',1,1466423620,0),(1149,1,4,'gradereport/grader:view',1,1466423620,0),(1150,1,3,'gradereport/grader:view',1,1466423620,0),(1151,1,1,'gradereport/grader:view',1,1466423620,0),(1152,1,4,'gradereport/history:view',1,1466423621,0),(1153,1,3,'gradereport/history:view',1,1466423621,0),(1154,1,1,'gradereport/history:view',1,1466423621,0),(1155,1,4,'gradereport/outcomes:view',1,1466423621,0),(1156,1,3,'gradereport/outcomes:view',1,1466423621,0),(1157,1,1,'gradereport/outcomes:view',1,1466423621,0),(1158,1,5,'gradereport/overview:view',1,1466423621,0),(1159,1,1,'gradereport/overview:view',1,1466423621,0),(1160,1,3,'gradereport/singleview:view',1,1466423621,0),(1161,1,1,'gradereport/singleview:view',1,1466423621,0),(1162,1,5,'gradereport/user:view',1,1466423621,0),(1163,1,4,'gradereport/user:view',1,1466423621,0),(1164,1,3,'gradereport/user:view',1,1466423621,0),(1165,1,1,'gradereport/user:view',1,1466423621,0),(1166,1,7,'repository/alfresco:view',1,1466423623,0),(1167,1,7,'repository/areafiles:view',1,1466423623,0),(1168,1,7,'repository/boxnet:view',1,1466423623,0),(1169,1,2,'repository/coursefiles:view',1,1466423623,0),(1170,1,4,'repository/coursefiles:view',1,1466423623,0),(1171,1,3,'repository/coursefiles:view',1,1466423623,0),(1172,1,1,'repository/coursefiles:view',1,1466423623,0),(1173,1,7,'repository/dropbox:view',1,1466423624,0),(1174,1,7,'repository/equella:view',1,1466423624,0),(1175,1,2,'repository/filesystem:view',1,1466423624,0),(1176,1,4,'repository/filesystem:view',1,1466423624,0),(1177,1,3,'repository/filesystem:view',1,1466423624,0),(1178,1,1,'repository/filesystem:view',1,1466423624,0),(1179,1,7,'repository/flickr:view',1,1466423624,0),(1180,1,7,'repository/flickr_public:view',1,1466423624,0),(1181,1,7,'repository/googledocs:view',1,1466423624,0),(1182,1,2,'repository/local:view',1,1466423625,0),(1183,1,4,'repository/local:view',1,1466423625,0),(1184,1,3,'repository/local:view',1,1466423625,0),(1185,1,1,'repository/local:view',1,1466423625,0),(1186,1,7,'repository/merlot:view',1,1466423625,0),(1187,1,7,'repository/picasa:view',1,1466423625,0),(1188,1,7,'repository/recent:view',1,1466423625,0),(1189,1,7,'repository/s3:view',1,1466423625,0),(1190,1,7,'repository/skydrive:view',1,1466423625,0),(1191,1,7,'repository/upload:view',1,1466423626,0),(1192,1,7,'repository/url:view',1,1466423626,0),(1193,1,7,'repository/user:view',1,1466423626,0),(1194,1,2,'repository/webdav:view',1,1466423626,0),(1195,1,4,'repository/webdav:view',1,1466423626,0),(1196,1,3,'repository/webdav:view',1,1466423626,0),(1197,1,1,'repository/webdav:view',1,1466423626,0),(1198,1,7,'repository/wikimedia:view',1,1466423627,0),(1199,1,7,'repository/youtube:view',1,1466423627,0),(1200,1,1,'tool/customlang:view',1,1466423631,0),(1201,1,1,'tool/customlang:edit',1,1466423631,0),(1202,1,1,'tool/lpmigrate:frameworksmigrate',1,1466423634,0),(1203,1,4,'tool/monitor:subscribe',1,1466423635,0),(1204,1,3,'tool/monitor:subscribe',1,1466423635,0),(1205,1,1,'tool/monitor:subscribe',1,1466423635,0),(1206,1,4,'tool/monitor:managerules',1,1466423635,0),(1207,1,3,'tool/monitor:managerules',1,1466423635,0),(1208,1,1,'tool/monitor:managerules',1,1466423635,0),(1209,1,1,'tool/monitor:managetool',1,1466423635,0),(1210,1,3,'tool/recyclebin:deleteitems',1,1466423636,0),(1211,1,1,'tool/recyclebin:deleteitems',1,1466423636,0),(1212,1,3,'tool/recyclebin:restoreitems',1,1466423636,0),(1213,1,1,'tool/recyclebin:restoreitems',1,1466423636,0),(1214,1,4,'tool/recyclebin:viewitems',1,1466423636,0),(1215,1,3,'tool/recyclebin:viewitems',1,1466423636,0),(1216,1,1,'tool/recyclebin:viewitems',1,1466423636,0),(1217,1,1,'tool/uploaduser:uploaduserpictures',1,1466423637,0),(1218,1,3,'booktool/importhtml:import',1,1466423641,0),(1219,1,1,'booktool/importhtml:import',1,1466423641,0),(1220,1,6,'booktool/print:print',1,1466423641,0),(1221,1,8,'booktool/print:print',1,1466423641,0),(1222,1,5,'booktool/print:print',1,1466423641,0),(1223,1,4,'booktool/print:print',1,1466423641,0),(1224,1,3,'booktool/print:print',1,1466423641,0),(1225,1,1,'booktool/print:print',1,1466423641,0),(1226,1,4,'quiz/grading:viewstudentnames',1,1466423643,0),(1227,1,3,'quiz/grading:viewstudentnames',1,1466423643,0),(1228,1,1,'quiz/grading:viewstudentnames',1,1466423643,0),(1229,1,4,'quiz/grading:viewidnumber',1,1466423643,0),(1230,1,3,'quiz/grading:viewidnumber',1,1466423643,0),(1231,1,1,'quiz/grading:viewidnumber',1,1466423643,0),(1232,1,4,'quiz/statistics:view',1,1466423643,0),(1233,1,3,'quiz/statistics:view',1,1466423643,0),(1234,1,1,'quiz/statistics:view',1,1466423643,0);
/*!40000 ALTER TABLE `mdl_role_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_context_levels`
--

DROP TABLE IF EXISTS `mdl_role_context_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_context_levels`
--

LOCK TABLES `mdl_role_context_levels` WRITE;
/*!40000 ALTER TABLE `mdl_role_context_levels` DISABLE KEYS */;
INSERT INTO `mdl_role_context_levels` VALUES (1,1,10),(4,2,10),(2,1,40),(5,2,40),(3,1,50),(6,3,50),(8,4,50),(10,5,50),(7,3,70),(9,4,70),(11,5,70);
/*!40000 ALTER TABLE `mdl_role_context_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_names`
--

DROP TABLE IF EXISTS `mdl_role_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_names`
--

LOCK TABLES `mdl_role_names` WRITE;
/*!40000 ALTER TABLE `mdl_role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_sortorder`
--

DROP TABLE IF EXISTS `mdl_role_sortorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_sortorder`
--

LOCK TABLES `mdl_role_sortorder` WRITE;
/*!40000 ALTER TABLE `mdl_role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_sortorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale`
--

DROP TABLE IF EXISTS `mdl_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Defines grading scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale`
--

LOCK TABLES `mdl_scale` WRITE;
/*!40000 ALTER TABLE `mdl_scale` DISABLE KEYS */;
INSERT INTO `mdl_scale` VALUES (1,0,0,'Separate and Connected ways of knowing','Mostly separate knowing,Separate and connected,Mostly connected knowing','The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent\'s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tends to listen and ask questions until they feel they can connect and \"understand things from their point of view\". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>',0,1466423544),(2,0,0,'Default competence scale','Not yet competent,Competent','A binary rating scale that provides no further information beyond whether someone has demonstrated proficiency or not.',0,1466423544);
/*!40000 ALTER TABLE `mdl_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale_history`
--

DROP TABLE IF EXISTS `mdl_scale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale_history`
--

LOCK TABLES `mdl_scale_history` WRITE;
/*!40000 ALTER TABLE `mdl_scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm`
--

DROP TABLE IF EXISTS `mdl_scorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '0',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `masteryoverride` tinyint(1) NOT NULL DEFAULT '1',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '0',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm`
--

LOCK TABLES `mdl_scorm` WRITE;
/*!40000 ALTER TABLE `mdl_scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_aicc_session`
--

DROP TABLE IF EXISTS `mdl_scorm_aicc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_aicc_session`
--

LOCK TABLES `mdl_scorm_aicc_session` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes`
--

LOCK TABLES `mdl_scorm_scoes` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_data`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_data`
--

LOCK TABLES `mdl_scorm_scoes_data` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_track`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_track`
--

LOCK TABLES `mdl_scorm_scoes_track` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_mapinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_mapinfo`
--

LOCK TABLES `mdl_scorm_seq_mapinfo` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_objective`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_objective`
--

LOCK TABLES `mdl_scorm_seq_objective` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprule`
--

LOCK TABLES `mdl_scorm_seq_rolluprule` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprulecond`
--

LOCK TABLES `mdl_scorm_seq_rolluprulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rulecond`
--

LOCK TABLES `mdl_scorm_seq_rulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_ruleconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_ruleconds`
--

LOCK TABLES `mdl_scorm_seq_ruleconds` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sessions`
--

DROP TABLE IF EXISTS `mdl_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_sessions`
--

LOCK TABLES `mdl_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_sessions` DISABLE KEYS */;
INSERT INTO `mdl_sessions` VALUES (2,0,'to84monmpbn51lhrmhnp6afn51',0,NULL,1466423715,1466423715,'10.2.10.48','10.2.10.48'),(3,0,'1c9ltobc8hri7nbppqfebkdai1',2,NULL,1466423715,1466423752,'10.2.10.48','10.2.10.48');
/*!40000 ALTER TABLE `mdl_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_daily`
--

DROP TABLE IF EXISTS `mdl_stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_daily`
--

LOCK TABLES `mdl_stats_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_monthly`
--

LOCK TABLES `mdl_stats_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_daily`
--

DROP TABLE IF EXISTS `mdl_stats_user_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_daily`
--

LOCK TABLES `mdl_stats_user_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_user_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_monthly`
--

LOCK TABLES `mdl_stats_user_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_user_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_weekly`
--

LOCK TABLES `mdl_stats_user_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_weekly`
--

LOCK TABLES `mdl_stats_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey`
--

DROP TABLE IF EXISTS `mdl_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey`
--

LOCK TABLES `mdl_survey` WRITE;
/*!40000 ALTER TABLE `mdl_survey` DISABLE KEYS */;
INSERT INTO `mdl_survey` VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro',0,'25,26,27,28,29,30,43,44'),(2,0,0,0,985017600,985017600,'collespname','collespintro',0,'31,32,33,34,35,36,43,44'),(3,0,0,0,985017600,985017600,'collesapname','collesapintro',0,'37,38,39,40,41,42,43,44'),(4,0,0,0,985017600,985017600,'attlsname','attlsintro',0,'65,67,68'),(5,0,0,0,985017600,985017600,'ciqname','ciqintro',0,'69,70,71,72,73');
/*!40000 ALTER TABLE `mdl_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_analysis`
--

DROP TABLE IF EXISTS `mdl_survey_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_analysis`
--

LOCK TABLES `mdl_survey_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_answers`
--

DROP TABLE IF EXISTS `mdl_survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_answers`
--

LOCK TABLES `mdl_survey_answers` WRITE;
/*!40000 ALTER TABLE `mdl_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_questions`
--

DROP TABLE IF EXISTS `mdl_survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_questions`
--

LOCK TABLES `mdl_survey_questions` WRITE;
/*!40000 ALTER TABLE `mdl_survey_questions` DISABLE KEYS */;
INSERT INTO `mdl_survey_questions` VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE `mdl_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag`
--

DROP TABLE IF EXISTS `mdl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `tagcollid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `isstandard` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_tagnam_uix` (`tagcollid`,`name`),
  KEY `mdl_tag_tagiss_ix` (`tagcollid`,`isstandard`),
  KEY `mdl_tag_use_ix` (`userid`),
  KEY `mdl_tag_tag_ix` (`tagcollid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag`
--

LOCK TABLES `mdl_tag` WRITE;
/*!40000 ALTER TABLE `mdl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_area`
--

DROP TABLE IF EXISTS `mdl_tag_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_area` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `tagcollid` bigint(10) NOT NULL,
  `callback` varchar(100) DEFAULT NULL,
  `callbackfile` varchar(100) DEFAULT NULL,
  `showstandard` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tagarea_comite_uix` (`component`,`itemtype`),
  KEY `mdl_tagarea_tag_ix` (`tagcollid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Defines various tag areas, one area is identified by compone';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_area`
--

LOCK TABLES `mdl_tag_area` WRITE;
/*!40000 ALTER TABLE `mdl_tag_area` DISABLE KEYS */;
INSERT INTO `mdl_tag_area` VALUES (1,'core','user',1,1,'user_get_tagged_users','/user/lib.php',2),(2,'core','course',1,1,'course_get_tagged_courses','/course/lib.php',0),(3,'core_question','question',1,1,NULL,NULL,0),(4,'core','post',1,1,'blog_get_tagged_posts','/blog/lib.php',0),(5,'core','blog_external',1,1,NULL,NULL,0),(6,'core','course_modules',1,1,'course_get_tagged_course_modules','/course/lib.php',0),(7,'mod_wiki','wiki_pages',1,1,'mod_wiki_get_tagged_pages','/mod/wiki/locallib.php',0);
/*!40000 ALTER TABLE `mdl_tag_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_coll`
--

DROP TABLE IF EXISTS `mdl_tag_coll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_coll` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `isdefault` tinyint(2) NOT NULL DEFAULT '0',
  `component` varchar(100) DEFAULT NULL,
  `sortorder` mediumint(5) NOT NULL DEFAULT '0',
  `searchable` tinyint(2) NOT NULL DEFAULT '1',
  `customurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Defines different set of tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_coll`
--

LOCK TABLES `mdl_tag_coll` WRITE;
/*!40000 ALTER TABLE `mdl_tag_coll` DISABLE KEYS */;
INSERT INTO `mdl_tag_coll` VALUES (1,NULL,1,NULL,0,1,NULL);
/*!40000 ALTER TABLE `mdl_tag_coll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_correlation`
--

DROP TABLE IF EXISTS `mdl_tag_correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_correlation`
--

LOCK TABLES `mdl_tag_correlation` WRITE;
/*!40000 ALTER TABLE `mdl_tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_instance`
--

DROP TABLE IF EXISTS `mdl_tag_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_comiteitetiuta_uix` (`component`,`itemtype`,`itemid`,`tiuserid`,`tagid`),
  KEY `mdl_taginst_itecomtagcon_ix` (`itemtype`,`component`,`tagid`,`contextid`),
  KEY `mdl_taginst_tag_ix` (`tagid`),
  KEY `mdl_taginst_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_instance`
--

LOCK TABLES `mdl_tag_instance` WRITE;
/*!40000 ALTER TABLE `mdl_tag_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_task_adhoc`
--

DROP TABLE IF EXISTS `mdl_task_adhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_task_adhoc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_taskadho_nex_ix` (`nextruntime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of adhoc tasks waiting to run.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_task_adhoc`
--

LOCK TABLES `mdl_task_adhoc` WRITE;
/*!40000 ALTER TABLE `mdl_task_adhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_task_adhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_task_scheduled`
--

DROP TABLE IF EXISTS `mdl_task_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_task_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) NOT NULL DEFAULT '',
  `hour` varchar(25) NOT NULL DEFAULT '',
  `day` varchar(25) NOT NULL DEFAULT '',
  `month` varchar(25) NOT NULL DEFAULT '',
  `dayofweek` varchar(25) NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='List of scheduled tasks to be run by cron.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_task_scheduled`
--

LOCK TABLES `mdl_task_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_task_scheduled` DISABLE KEYS */;
INSERT INTO `mdl_task_scheduled` VALUES (1,'moodle','\\core\\task\\session_cleanup_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(2,'moodle','\\core\\task\\delete_unconfirmed_users_task',0,1466424000,0,'0','*','*','*','*',0,0,0),(3,'moodle','\\core\\task\\delete_incomplete_users_task',0,1466424300,0,'5','*','*','*','*',0,0,0),(4,'moodle','\\core\\task\\backup_cleanup_task',0,1466424600,0,'10','*','*','*','*',0,0,0),(5,'moodle','\\core\\task\\tag_cron_task',0,1466475780,0,'23','3','*','*','*',0,0,0),(6,'moodle','\\core\\task\\context_cleanup_task',0,1466425500,0,'25','*','*','*','*',0,0,0),(7,'moodle','\\core\\task\\cache_cleanup_task',0,1466425800,0,'30','*','*','*','*',0,0,0),(8,'moodle','\\core\\task\\messaging_cleanup_task',0,1466426100,0,'35','*','*','*','*',0,0,0),(9,'moodle','\\core\\task\\send_new_user_passwords_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(10,'moodle','\\core\\task\\send_failed_login_notifications_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(11,'moodle','\\core\\task\\create_contexts_task',0,1466463600,1,'0','0','*','*','*',0,0,0),(12,'moodle','\\core\\task\\legacy_plugin_cron_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(13,'moodle','\\core\\task\\grade_cron_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(14,'moodle','\\core\\task\\events_cron_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(15,'moodle','\\core\\task\\completion_regular_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(16,'moodle','\\core\\task\\completion_daily_task',0,1466504520,0,'22','11','*','*','*',0,0,0),(17,'moodle','\\core\\task\\portfolio_cron_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(18,'moodle','\\core\\task\\plagiarism_cron_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(19,'moodle','\\core\\task\\calendar_cron_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(20,'moodle','\\core\\task\\blog_cron_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(21,'moodle','\\core\\task\\question_cron_task',0,1466423580,0,'*','*','*','*','*',0,0,0),(22,'moodle','\\core\\task\\registration_cron_task',0,1466579580,0,'13','8','*','*','3',0,0,0),(23,'moodle','\\core\\task\\check_for_updates_task',0,1466427600,0,'0','*/2','*','*','*',0,0,0),(24,'moodle','\\core\\task\\cache_cron_task',0,1466427000,0,'50','*','*','*','*',0,0,0),(25,'moodle','\\core\\task\\automated_backup_task',0,1466427000,0,'50','*','*','*','*',0,0,0),(26,'moodle','\\core\\task\\badges_cron_task',0,1466423700,0,'*/5','*','*','*','*',0,0,0),(27,'moodle','\\core\\task\\file_temp_cleanup_task',0,1466423700,0,'55','*/6','*','*','*',0,0,0),(28,'moodle','\\core\\task\\file_trash_cleanup_task',0,1466423700,0,'55','*/6','*','*','*',0,0,0),(29,'moodle','\\core\\task\\search_index_task',0,1466424000,0,'*/30','*','*','*','*',0,0,0),(30,'moodle','\\core\\task\\search_optimize_task',0,1466464500,0,'15','*/12','*','*','*',0,0,0),(31,'moodle','\\core\\task\\stats_cron_task',0,1466424000,0,'0','*','*','*','*',0,0,0),(32,'moodle','\\core\\task\\password_reset_cleanup_task',0,1466442000,0,'0','*/6','*','*','*',0,0,0),(33,'moodle','\\core\\task\\complete_plans_task',0,1466424540,0,'9','*','*','*','*',0,0,0),(34,'moodle','\\core\\task\\sync_plans_from_template_cohorts_task',0,1466424540,0,'9','*','*','*','*',0,0,0),(35,'mod_forum','\\mod_forum\\task\\cron_task',0,1466423640,0,'*','*','*','*','*',0,0,0),(36,'auth_cas','\\auth_cas\\task\\sync_task',0,1466463600,0,'0','0','*','*','*',0,0,1),(37,'auth_ldap','\\auth_ldap\\task\\sync_task',0,1466463600,0,'0','0','*','*','*',0,0,1),(38,'enrol_flatfile','\\enrol_flatfile\\task\\flatfile_sync_task',0,1466424900,0,'15','*','*','*','*',0,0,0),(39,'enrol_imsenterprise','\\enrol_imsenterprise\\task\\cron_task',0,1466424600,0,'10','*','*','*','*',0,0,0),(40,'enrol_lti','\\enrol_lti\\task\\sync_grades',0,1466424000,0,'*/30','*','*','*','*',0,0,0),(41,'enrol_lti','\\enrol_lti\\task\\sync_members',0,1466424000,0,'*/30','*','*','*','*',0,0,0),(42,'editor_atto','\\editor_atto\\task\\autosave_cleanup_task',0,1467022200,0,'10','11','*','*','1',0,0,0),(43,'tool_cohortroles','\\tool_cohortroles\\task\\cohort_role_sync',0,1466424120,0,'2','*','*','*','*',0,0,0),(44,'tool_langimport','\\tool_langimport\\task\\update_langpacks_task',0,1466478120,0,'2','4','*','*','*',0,0,0),(45,'tool_messageinbound','\\tool_messageinbound\\task\\pickup_task',0,1466423640,0,'*','*','*','*','*',0,0,0),(46,'tool_messageinbound','\\tool_messageinbound\\task\\cleanup_task',0,1466470500,0,'55','1','*','*','*',0,0,0),(47,'tool_monitor','\\tool_monitor\\task\\clean_events',0,1466423640,0,'*','*','*','*','*',0,0,0),(48,'tool_recyclebin','\\tool_recyclebin\\task\\cleanup_course_bin',0,1466424000,0,'*/30','*','*','*','*',0,0,0),(49,'tool_recyclebin','\\tool_recyclebin\\task\\cleanup_category_bin',0,1466424000,0,'*/30','*','*','*','*',0,0,0),(50,'assignfeedback_editpdf','\\assignfeedback_editpdf\\task\\convert_submissions',0,1466424000,0,'*/15','*','*','*','*',0,0,0),(51,'logstore_legacy','\\logstore_legacy\\task\\cleanup_task',0,1466482200,0,'10','5','*','*','*',0,0,0),(52,'logstore_standard','\\logstore_standard\\task\\cleanup_task',0,1466478600,0,'10','4','*','*','*',0,0,0);
/*!40000 ALTER TABLE `mdl_task_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_cohortroles`
--

DROP TABLE IF EXISTS `mdl_tool_cohortroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_cohortroles` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcoho_cohroluse_uix` (`cohortid`,`roleid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping of users to cohort role assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_cohortroles`
--

LOCK TABLES `mdl_tool_cohortroles` WRITE;
/*!40000 ALTER TABLE `mdl_tool_cohortroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_cohortroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang`
--

DROP TABLE IF EXISTS `mdl_tool_customlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang`
--

LOCK TABLES `mdl_tool_customlang` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang_components`
--

DROP TABLE IF EXISTS `mdl_tool_customlang_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang_components`
--

LOCK TABLES `mdl_tool_customlang_components` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_events`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_events` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(254) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `link` varchar(254) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A table that keeps a log of events related to subscriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_events`
--

LOCK TABLES `mdl_tool_monitor_events` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_history`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timesent` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  KEY `mdl_toolmonihist_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store history of message notifications sent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_history`
--

LOCK TABLES `mdl_tool_monitor_history` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_rules`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_rules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `plugin` varchar(254) NOT NULL DEFAULT '',
  `eventname` varchar(254) NOT NULL DEFAULT '',
  `template` longtext NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint(4) NOT NULL,
  `timewindow` mediumint(5) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonirule_eve_ix` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_rules`
--

LOCK TABLES `mdl_tool_monitor_rules` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_subscriptions`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `ruleid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastnotificationsent` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonisubs_rul_ix` (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store user subscriptions to various rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_subscriptions`
--

LOCK TABLES `mdl_tool_monitor_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_recyclebin_category`
--

DROP TABLE IF EXISTS `mdl_tool_recyclebin_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_recyclebin_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycate_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycate_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of items in the category recycle bin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_recyclebin_category`
--

LOCK TABLES `mdl_tool_recyclebin_category` WRITE;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_recyclebin_course`
--

DROP TABLE IF EXISTS `mdl_tool_recyclebin_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_recyclebin_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `section` bigint(10) NOT NULL,
  `module` bigint(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycour_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycour_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of items in the course recycle bin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_recyclebin_course`
--

LOCK TABLES `mdl_tool_recyclebin_course` WRITE;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_recyclebin_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_upgrade_log`
--

DROP TABLE IF EXISTS `mdl_upgrade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1137 DEFAULT CHARSET=utf8 COMMENT='Upgrade logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_upgrade_log`
--

LOCK TABLES `mdl_upgrade_log` WRITE;
/*!40000 ALTER TABLE `mdl_upgrade_log` DISABLE KEYS */;
INSERT INTO `mdl_upgrade_log` VALUES (1,0,'core','2016052300.04','2016052300.04','Upgrade savepoint reached',NULL,'',0,1466423544),(2,0,'core','2016052300.04','2016052300.04','Core installed',NULL,'',0,1466423566),(3,0,'antivirus_clamav',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423566),(4,0,'antivirus_clamav','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423566),(5,0,'antivirus_clamav','2016052300','2016052300','Plugin installed',NULL,'',0,1466423566),(6,0,'availability_completion',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423566),(7,0,'availability_completion','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423566),(8,0,'availability_completion','2016052300','2016052300','Plugin installed',NULL,'',0,1466423566),(9,0,'availability_date',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423566),(10,0,'availability_date','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423566),(11,0,'availability_date','2016052300','2016052300','Plugin installed',NULL,'',0,1466423566),(12,0,'availability_grade',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423566),(13,0,'availability_grade','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423566),(14,0,'availability_grade','2016052300','2016052300','Plugin installed',NULL,'',0,1466423566),(15,0,'availability_group',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423566),(16,0,'availability_group','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423566),(17,0,'availability_group','2016052300','2016052300','Plugin installed',NULL,'',0,1466423566),(18,0,'availability_grouping',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423566),(19,0,'availability_grouping','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423566),(20,0,'availability_grouping','2016052300','2016052300','Plugin installed',NULL,'',0,1466423566),(21,0,'availability_profile',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423566),(22,0,'availability_profile','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423566),(23,0,'availability_profile','2016052300','2016052300','Plugin installed',NULL,'',0,1466423566),(24,0,'qtype_calculated',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423566),(25,0,'qtype_calculated','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423567),(26,0,'qtype_calculated','2016052300','2016052300','Plugin installed',NULL,'',0,1466423567),(27,0,'qtype_calculatedmulti',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423567),(28,0,'qtype_calculatedmulti','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423567),(29,0,'qtype_calculatedmulti','2016052300','2016052300','Plugin installed',NULL,'',0,1466423567),(30,0,'qtype_calculatedsimple',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423567),(31,0,'qtype_calculatedsimple','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423567),(32,0,'qtype_calculatedsimple','2016052300','2016052300','Plugin installed',NULL,'',0,1466423567),(33,0,'qtype_ddimageortext',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423567),(34,0,'qtype_ddimageortext','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423567),(35,0,'qtype_ddimageortext','2016052300','2016052300','Plugin installed',NULL,'',0,1466423567),(36,0,'qtype_ddmarker',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423567),(37,0,'qtype_ddmarker','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423567),(38,0,'qtype_ddmarker','2016052300','2016052300','Plugin installed',NULL,'',0,1466423567),(39,0,'qtype_ddwtos',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423567),(40,0,'qtype_ddwtos','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423567),(41,0,'qtype_ddwtos','2016052300','2016052300','Plugin installed',NULL,'',0,1466423567),(42,0,'qtype_description',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423567),(43,0,'qtype_description','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423567),(44,0,'qtype_description','2016052300','2016052300','Plugin installed',NULL,'',0,1466423567),(45,0,'qtype_essay',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423567),(46,0,'qtype_essay','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423568),(47,0,'qtype_essay','2016052300','2016052300','Plugin installed',NULL,'',0,1466423568),(48,0,'qtype_gapselect',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423568),(49,0,'qtype_gapselect','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423568),(50,0,'qtype_gapselect','2016052300','2016052300','Plugin installed',NULL,'',0,1466423568),(51,0,'qtype_match',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423568),(52,0,'qtype_match','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423568),(53,0,'qtype_match','2016052300','2016052300','Plugin installed',NULL,'',0,1466423568),(54,0,'qtype_missingtype',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423568),(55,0,'qtype_missingtype','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423568),(56,0,'qtype_missingtype','2016052300','2016052300','Plugin installed',NULL,'',0,1466423568),(57,0,'qtype_multianswer',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423568),(58,0,'qtype_multianswer','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423568),(59,0,'qtype_multianswer','2016052300','2016052300','Plugin installed',NULL,'',0,1466423568),(60,0,'qtype_multichoice',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423568),(61,0,'qtype_multichoice','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423568),(62,0,'qtype_multichoice','2016052300','2016052300','Plugin installed',NULL,'',0,1466423568),(63,0,'qtype_numerical',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423568),(64,0,'qtype_numerical','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423569),(65,0,'qtype_numerical','2016052300','2016052300','Plugin installed',NULL,'',0,1466423569),(66,0,'qtype_random',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423569),(67,0,'qtype_random','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423569),(68,0,'qtype_random','2016052300','2016052300','Plugin installed',NULL,'',0,1466423569),(69,0,'qtype_randomsamatch',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423569),(70,0,'qtype_randomsamatch','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423569),(71,0,'qtype_randomsamatch','2016052300','2016052300','Plugin installed',NULL,'',0,1466423569),(72,0,'qtype_shortanswer',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423569),(73,0,'qtype_shortanswer','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423569),(74,0,'qtype_shortanswer','2016052300','2016052300','Plugin installed',NULL,'',0,1466423569),(75,0,'qtype_truefalse',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423569),(76,0,'qtype_truefalse','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423569),(77,0,'qtype_truefalse','2016052300','2016052300','Plugin installed',NULL,'',0,1466423569),(78,0,'mod_assign',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423569),(79,0,'mod_assign','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423570),(80,0,'mod_assign','2016052300','2016052300','Plugin installed',NULL,'',0,1466423572),(81,0,'mod_assignment',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423572),(82,0,'mod_assignment','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423572),(83,0,'mod_assignment','2016052300','2016052300','Plugin installed',NULL,'',0,1466423573),(84,0,'mod_book',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423573),(85,0,'mod_book','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423573),(86,0,'mod_book','2016052300','2016052300','Plugin installed',NULL,'',0,1466423573),(87,0,'mod_chat',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423573),(88,0,'mod_chat','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423574),(89,0,'mod_chat','2016052300','2016052300','Plugin installed',NULL,'',0,1466423574),(90,0,'mod_choice',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423574),(91,0,'mod_choice','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423574),(92,0,'mod_choice','2016052300','2016052300','Plugin installed',NULL,'',0,1466423575),(93,0,'mod_data',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423575),(94,0,'mod_data','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423575),(95,0,'mod_data','2016052300','2016052300','Plugin installed',NULL,'',0,1466423576),(96,0,'mod_feedback',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423576),(97,0,'mod_feedback','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423577),(98,0,'mod_feedback','2016052300','2016052300','Plugin installed',NULL,'',0,1466423577),(99,0,'mod_folder',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423577),(100,0,'mod_folder','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423577),(101,0,'mod_folder','2016052300','2016052300','Plugin installed',NULL,'',0,1466423578),(102,0,'mod_forum',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423578),(103,0,'mod_forum','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423578),(104,0,'mod_forum','2016052300','2016052300','Plugin installed',NULL,'',0,1466423584),(105,0,'mod_glossary',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423584),(106,0,'mod_glossary','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423584),(107,0,'mod_glossary','2016052300','2016052300','Plugin installed',NULL,'',0,1466423585),(108,0,'mod_imscp',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423585),(109,0,'mod_imscp','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423586),(110,0,'mod_imscp','2016052300','2016052300','Plugin installed',NULL,'',0,1466423586),(111,0,'mod_label',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423586),(112,0,'mod_label','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423586),(113,0,'mod_label','2016052300','2016052300','Plugin installed',NULL,'',0,1466423586),(114,0,'mod_lesson',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423586),(115,0,'mod_lesson','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423587),(116,0,'mod_lesson','2016052300','2016052300','Plugin installed',NULL,'',0,1466423587),(117,0,'mod_lti',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423587),(118,0,'mod_lti','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423587),(119,0,'mod_lti','2016052300','2016052300','Plugin installed',NULL,'',0,1466423588),(120,0,'mod_page',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423588),(121,0,'mod_page','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423588),(122,0,'mod_page','2016052300','2016052300','Plugin installed',NULL,'',0,1466423588),(123,0,'mod_quiz',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423588),(124,0,'mod_quiz','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423589),(125,0,'mod_quiz','2016052300','2016052300','Plugin installed',NULL,'',0,1466423590),(126,0,'mod_resource',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423590),(127,0,'mod_resource','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423591),(128,0,'mod_resource','2016052300','2016052300','Plugin installed',NULL,'',0,1466423591),(129,0,'mod_scorm',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423591),(130,0,'mod_scorm','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423591),(131,0,'mod_scorm','2016052300','2016052300','Plugin installed',NULL,'',0,1466423592),(132,0,'mod_survey',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423592),(133,0,'mod_survey','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423592),(134,0,'mod_survey','2016052300','2016052300','Plugin installed',NULL,'',0,1466423594),(135,0,'mod_url',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423594),(136,0,'mod_url','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423594),(137,0,'mod_url','2016052300','2016052300','Plugin installed',NULL,'',0,1466423594),(138,0,'mod_wiki',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423594),(139,0,'mod_wiki','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423594),(140,0,'mod_wiki','2016052300','2016052300','Plugin installed',NULL,'',0,1466423595),(141,0,'mod_workshop',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423595),(142,0,'mod_workshop','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423596),(143,0,'mod_workshop','2016052300','2016052300','Plugin installed',NULL,'',0,1466423597),(144,0,'auth_cas',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423597),(145,0,'auth_cas','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423597),(146,0,'auth_cas','2016052300','2016052300','Plugin installed',NULL,'',0,1466423597),(147,0,'auth_db',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423597),(148,0,'auth_db','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423597),(149,0,'auth_db','2016052300','2016052300','Plugin installed',NULL,'',0,1466423597),(150,0,'auth_email',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423597),(151,0,'auth_email','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423597),(152,0,'auth_email','2016052300','2016052300','Plugin installed',NULL,'',0,1466423597),(153,0,'auth_fc',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423597),(154,0,'auth_fc','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423597),(155,0,'auth_fc','2016052300','2016052300','Plugin installed',NULL,'',0,1466423597),(156,0,'auth_imap',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423597),(157,0,'auth_imap','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423598),(158,0,'auth_imap','2016052300','2016052300','Plugin installed',NULL,'',0,1466423598),(159,0,'auth_ldap',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423598),(160,0,'auth_ldap','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423598),(161,0,'auth_ldap','2016052300','2016052300','Plugin installed',NULL,'',0,1466423598),(162,0,'auth_lti',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423598),(163,0,'auth_lti','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423598),(164,0,'auth_lti','2016052300','2016052300','Plugin installed',NULL,'',0,1466423598),(165,0,'auth_manual',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423598),(166,0,'auth_manual','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423598),(167,0,'auth_manual','2016052300','2016052300','Plugin installed',NULL,'',0,1466423598),(168,0,'auth_mnet',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423598),(169,0,'auth_mnet','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423598),(170,0,'auth_mnet','2016052300','2016052300','Plugin installed',NULL,'',0,1466423600),(171,0,'auth_nntp',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423600),(172,0,'auth_nntp','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423600),(173,0,'auth_nntp','2016052300','2016052300','Plugin installed',NULL,'',0,1466423600),(174,0,'auth_nologin',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423600),(175,0,'auth_nologin','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423600),(176,0,'auth_nologin','2016052300','2016052300','Plugin installed',NULL,'',0,1466423600),(177,0,'auth_none',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423600),(178,0,'auth_none','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423600),(179,0,'auth_none','2016052300','2016052300','Plugin installed',NULL,'',0,1466423600),(180,0,'auth_pam',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423600),(181,0,'auth_pam','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423600),(182,0,'auth_pam','2016052300','2016052300','Plugin installed',NULL,'',0,1466423600),(183,0,'auth_pop3',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423600),(184,0,'auth_pop3','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423600),(185,0,'auth_pop3','2016052300','2016052300','Plugin installed',NULL,'',0,1466423600),(186,0,'auth_radius',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423600),(187,0,'auth_radius','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423600),(188,0,'auth_radius','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(189,0,'auth_shibboleth',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423601),(190,0,'auth_shibboleth','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423601),(191,0,'auth_shibboleth','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(192,0,'auth_webservice',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423601),(193,0,'auth_webservice','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423601),(194,0,'auth_webservice','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(195,0,'calendartype_gregorian',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423601),(196,0,'calendartype_gregorian','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423601),(197,0,'calendartype_gregorian','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(198,0,'enrol_category',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423601),(199,0,'enrol_category','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423601),(200,0,'enrol_category','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(201,0,'enrol_cohort',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423601),(202,0,'enrol_cohort','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423601),(203,0,'enrol_cohort','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(204,0,'enrol_database',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423601),(205,0,'enrol_database','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423601),(206,0,'enrol_database','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(207,0,'enrol_flatfile',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423601),(208,0,'enrol_flatfile','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423601),(209,0,'enrol_flatfile','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(210,0,'enrol_guest',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423601),(211,0,'enrol_guest','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423601),(212,0,'enrol_guest','2016052300','2016052300','Plugin installed',NULL,'',0,1466423601),(213,0,'enrol_imsenterprise',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423602),(214,0,'enrol_imsenterprise','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423602),(215,0,'enrol_imsenterprise','2016052300','2016052300','Plugin installed',NULL,'',0,1466423602),(216,0,'enrol_ldap',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423602),(217,0,'enrol_ldap','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423602),(218,0,'enrol_ldap','2016052300','2016052300','Plugin installed',NULL,'',0,1466423602),(219,0,'enrol_lti',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423602),(220,0,'enrol_lti','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423602),(221,0,'enrol_lti','2016052300','2016052300','Plugin installed',NULL,'',0,1466423602),(222,0,'enrol_manual',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423602),(223,0,'enrol_manual','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423602),(224,0,'enrol_manual','2016052300','2016052300','Plugin installed',NULL,'',0,1466423603),(225,0,'enrol_meta',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423603),(226,0,'enrol_meta','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423603),(227,0,'enrol_meta','2016052300','2016052300','Plugin installed',NULL,'',0,1466423603),(228,0,'enrol_mnet',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423603),(229,0,'enrol_mnet','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423603),(230,0,'enrol_mnet','2016052300','2016052300','Plugin installed',NULL,'',0,1466423604),(231,0,'enrol_paypal',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423604),(232,0,'enrol_paypal','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423604),(233,0,'enrol_paypal','2016052300','2016052300','Plugin installed',NULL,'',0,1466423604),(234,0,'enrol_self',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423604),(235,0,'enrol_self','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423604),(236,0,'enrol_self','2016052300','2016052300','Plugin installed',NULL,'',0,1466423604),(237,0,'message_airnotifier',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423604),(238,0,'message_airnotifier','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423604),(239,0,'message_airnotifier','2016052300','2016052300','Plugin installed',NULL,'',0,1466423604),(240,0,'message_email',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423604),(241,0,'message_email','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423604),(242,0,'message_email','2016052300','2016052300','Plugin installed',NULL,'',0,1466423605),(243,0,'message_jabber',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423605),(244,0,'message_jabber','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423605),(245,0,'message_jabber','2016052300','2016052300','Plugin installed',NULL,'',0,1466423605),(246,0,'message_popup',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423605),(247,0,'message_popup','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423605),(248,0,'message_popup','2016052300','2016052300','Plugin installed',NULL,'',0,1466423605),(249,0,'block_activity_modules',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423605),(250,0,'block_activity_modules','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423605),(251,0,'block_activity_modules','2016052300','2016052300','Plugin installed',NULL,'',0,1466423605),(252,0,'block_activity_results',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423605),(253,0,'block_activity_results','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423605),(254,0,'block_activity_results','2016052300','2016052300','Plugin installed',NULL,'',0,1466423605),(255,0,'block_admin_bookmarks',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423605),(256,0,'block_admin_bookmarks','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423605),(257,0,'block_admin_bookmarks','2016052300','2016052300','Plugin installed',NULL,'',0,1466423605),(258,0,'block_badges',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423606),(259,0,'block_badges','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423606),(260,0,'block_badges','2016052300','2016052300','Plugin installed',NULL,'',0,1466423606),(261,0,'block_blog_menu',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423606),(262,0,'block_blog_menu','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423606),(263,0,'block_blog_menu','2016052300','2016052300','Plugin installed',NULL,'',0,1466423606),(264,0,'block_blog_recent',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423606),(265,0,'block_blog_recent','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423606),(266,0,'block_blog_recent','2016052300','2016052300','Plugin installed',NULL,'',0,1466423606),(267,0,'block_blog_tags',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423606),(268,0,'block_blog_tags','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423606),(269,0,'block_blog_tags','2016052300','2016052300','Plugin installed',NULL,'',0,1466423606),(270,0,'block_calendar_month',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423606),(271,0,'block_calendar_month','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423606),(272,0,'block_calendar_month','2016052300','2016052300','Plugin installed',NULL,'',0,1466423606),(273,0,'block_calendar_upcoming',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423606),(274,0,'block_calendar_upcoming','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423606),(275,0,'block_calendar_upcoming','2016052300','2016052300','Plugin installed',NULL,'',0,1466423606),(276,0,'block_comments',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423606),(277,0,'block_comments','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423606),(278,0,'block_comments','2016052300','2016052300','Plugin installed',NULL,'',0,1466423606),(279,0,'block_community',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423606),(280,0,'block_community','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423607),(281,0,'block_community','2016052300','2016052300','Plugin installed',NULL,'',0,1466423607),(282,0,'block_completionstatus',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423607),(283,0,'block_completionstatus','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423607),(284,0,'block_completionstatus','2016052300','2016052300','Plugin installed',NULL,'',0,1466423607),(285,0,'block_course_list',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423607),(286,0,'block_course_list','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423607),(287,0,'block_course_list','2016052300','2016052300','Plugin installed',NULL,'',0,1466423607),(288,0,'block_course_overview',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423607),(289,0,'block_course_overview','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423607),(290,0,'block_course_overview','2016052300','2016052300','Plugin installed',NULL,'',0,1466423607),(291,0,'block_course_summary',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423607),(292,0,'block_course_summary','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423607),(293,0,'block_course_summary','2016052300','2016052300','Plugin installed',NULL,'',0,1466423607),(294,0,'block_feedback',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423607),(295,0,'block_feedback','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423607),(296,0,'block_feedback','2016052300','2016052300','Plugin installed',NULL,'',0,1466423607),(297,0,'block_globalsearch',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423607),(298,0,'block_globalsearch','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423607),(299,0,'block_globalsearch','2016052300','2016052300','Plugin installed',NULL,'',0,1466423608),(300,0,'block_glossary_random',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423608),(301,0,'block_glossary_random','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423608),(302,0,'block_glossary_random','2016052300','2016052300','Plugin installed',NULL,'',0,1466423608),(303,0,'block_html',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423608),(304,0,'block_html','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423608),(305,0,'block_html','2016052300','2016052300','Plugin installed',NULL,'',0,1466423608),(306,0,'block_login',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423608),(307,0,'block_login','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423608),(308,0,'block_login','2016052300','2016052300','Plugin installed',NULL,'',0,1466423608),(309,0,'block_lp',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423608),(310,0,'block_lp','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423608),(311,0,'block_lp','2016052300','2016052300','Plugin installed',NULL,'',0,1466423608),(312,0,'block_mentees',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423608),(313,0,'block_mentees','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423608),(314,0,'block_mentees','2016052300','2016052300','Plugin installed',NULL,'',0,1466423608),(315,0,'block_messages',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423609),(316,0,'block_messages','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423609),(317,0,'block_messages','2016052300','2016052300','Plugin installed',NULL,'',0,1466423609),(318,0,'block_mnet_hosts',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423609),(319,0,'block_mnet_hosts','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423609),(320,0,'block_mnet_hosts','2016052300','2016052300','Plugin installed',NULL,'',0,1466423609),(321,0,'block_myprofile',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423609),(322,0,'block_myprofile','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423609),(323,0,'block_myprofile','2016052300','2016052300','Plugin installed',NULL,'',0,1466423609),(324,0,'block_navigation',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423609),(325,0,'block_navigation','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423609),(326,0,'block_navigation','2016052300','2016052300','Plugin installed',NULL,'',0,1466423609),(327,0,'block_news_items',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423609),(328,0,'block_news_items','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423609),(329,0,'block_news_items','2016052300','2016052300','Plugin installed',NULL,'',0,1466423609),(330,0,'block_online_users',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423609),(331,0,'block_online_users','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423610),(332,0,'block_online_users','2016052300','2016052300','Plugin installed',NULL,'',0,1466423610),(333,0,'block_participants',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423610),(334,0,'block_participants','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423610),(335,0,'block_participants','2016052300','2016052300','Plugin installed',NULL,'',0,1466423610),(336,0,'block_private_files',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423610),(337,0,'block_private_files','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423610),(338,0,'block_private_files','2016052300','2016052300','Plugin installed',NULL,'',0,1466423610),(339,0,'block_quiz_results',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423610),(340,0,'block_quiz_results','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423610),(341,0,'block_quiz_results','2016052300','2016052300','Plugin installed',NULL,'',0,1466423611),(342,0,'block_recent_activity',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423611),(343,0,'block_recent_activity','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423611),(344,0,'block_recent_activity','2016052300','2016052300','Plugin installed',NULL,'',0,1466423611),(345,0,'block_rss_client',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423611),(346,0,'block_rss_client','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423611),(347,0,'block_rss_client','2016052300','2016052300','Plugin installed',NULL,'',0,1466423611),(348,0,'block_search_forums',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423611),(349,0,'block_search_forums','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423611),(350,0,'block_search_forums','2016052300','2016052300','Plugin installed',NULL,'',0,1466423611),(351,0,'block_section_links',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423611),(352,0,'block_section_links','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423611),(353,0,'block_section_links','2016052300','2016052300','Plugin installed',NULL,'',0,1466423611),(354,0,'block_selfcompletion',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423611),(355,0,'block_selfcompletion','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423611),(356,0,'block_selfcompletion','2016052300','2016052300','Plugin installed',NULL,'',0,1466423612),(357,0,'block_settings',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423612),(358,0,'block_settings','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423612),(359,0,'block_settings','2016052300','2016052300','Plugin installed',NULL,'',0,1466423612),(360,0,'block_site_main_menu',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423612),(361,0,'block_site_main_menu','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423612),(362,0,'block_site_main_menu','2016052300','2016052300','Plugin installed',NULL,'',0,1466423612),(363,0,'block_social_activities',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423612),(364,0,'block_social_activities','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423612),(365,0,'block_social_activities','2016052300','2016052300','Plugin installed',NULL,'',0,1466423612),(366,0,'block_tag_flickr',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423612),(367,0,'block_tag_flickr','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423612),(368,0,'block_tag_flickr','2016052300','2016052300','Plugin installed',NULL,'',0,1466423612),(369,0,'block_tag_youtube',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423613),(370,0,'block_tag_youtube','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423613),(371,0,'block_tag_youtube','2016052300','2016052300','Plugin installed',NULL,'',0,1466423613),(372,0,'block_tags',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423613),(373,0,'block_tags','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423613),(374,0,'block_tags','2016052300','2016052300','Plugin installed',NULL,'',0,1466423613),(375,0,'filter_activitynames',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(376,0,'filter_activitynames','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(377,0,'filter_activitynames','2016052300','2016052300','Plugin installed',NULL,'',0,1466423614),(378,0,'filter_algebra',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(379,0,'filter_algebra','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(380,0,'filter_algebra','2016052300','2016052300','Plugin installed',NULL,'',0,1466423614),(381,0,'filter_censor',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(382,0,'filter_censor','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(383,0,'filter_censor','2016052300','2016052300','Plugin installed',NULL,'',0,1466423614),(384,0,'filter_data',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(385,0,'filter_data','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(386,0,'filter_data','2016052300','2016052300','Plugin installed',NULL,'',0,1466423614),(387,0,'filter_emailprotect',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(388,0,'filter_emailprotect','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(389,0,'filter_emailprotect','2016052300','2016052300','Plugin installed',NULL,'',0,1466423614),(390,0,'filter_emoticon',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(391,0,'filter_emoticon','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(392,0,'filter_emoticon','2016052300','2016052300','Plugin installed',NULL,'',0,1466423614),(393,0,'filter_glossary',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(394,0,'filter_glossary','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(395,0,'filter_glossary','2016052300','2016052300','Plugin installed',NULL,'',0,1466423614),(396,0,'filter_mathjaxloader',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(397,0,'filter_mathjaxloader','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(398,0,'filter_mathjaxloader','2016052300','2016052300','Plugin installed',NULL,'',0,1466423614),(399,0,'filter_mediaplugin',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423614),(400,0,'filter_mediaplugin','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423614),(401,0,'filter_mediaplugin','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(402,0,'filter_multilang',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(403,0,'filter_multilang','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(404,0,'filter_multilang','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(405,0,'filter_tex',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(406,0,'filter_tex','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(407,0,'filter_tex','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(408,0,'filter_tidy',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(409,0,'filter_tidy','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(410,0,'filter_tidy','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(411,0,'filter_urltolink',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(412,0,'filter_urltolink','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(413,0,'filter_urltolink','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(414,0,'editor_atto',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(415,0,'editor_atto','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(416,0,'editor_atto','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(417,0,'editor_textarea',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(418,0,'editor_textarea','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(419,0,'editor_textarea','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(420,0,'editor_tinymce',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(421,0,'editor_tinymce','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(422,0,'editor_tinymce','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(423,0,'format_singleactivity',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(424,0,'format_singleactivity','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(425,0,'format_singleactivity','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(426,0,'format_social',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(427,0,'format_social','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(428,0,'format_social','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(429,0,'format_topics',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(430,0,'format_topics','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(431,0,'format_topics','2016052300','2016052300','Plugin installed',NULL,'',0,1466423615),(432,0,'format_weeks',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423615),(433,0,'format_weeks','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423615),(434,0,'format_weeks','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(435,0,'dataformat_csv',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(436,0,'dataformat_csv','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(437,0,'dataformat_csv','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(438,0,'dataformat_excel',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(439,0,'dataformat_excel','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(440,0,'dataformat_excel','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(441,0,'dataformat_html',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(442,0,'dataformat_html','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(443,0,'dataformat_html','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(444,0,'dataformat_json',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(445,0,'dataformat_json','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(446,0,'dataformat_json','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(447,0,'dataformat_ods',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(448,0,'dataformat_ods','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(449,0,'dataformat_ods','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(450,0,'profilefield_checkbox',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(451,0,'profilefield_checkbox','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(452,0,'profilefield_checkbox','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(453,0,'profilefield_datetime',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(454,0,'profilefield_datetime','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(455,0,'profilefield_datetime','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(456,0,'profilefield_menu',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(457,0,'profilefield_menu','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(458,0,'profilefield_menu','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(459,0,'profilefield_text',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(460,0,'profilefield_text','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(461,0,'profilefield_text','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(462,0,'profilefield_textarea',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(463,0,'profilefield_textarea','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(464,0,'profilefield_textarea','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(465,0,'report_backups',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(466,0,'report_backups','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423616),(467,0,'report_backups','2016052300','2016052300','Plugin installed',NULL,'',0,1466423616),(468,0,'report_competency',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423616),(469,0,'report_competency','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423617),(470,0,'report_competency','2016052300','2016052300','Plugin installed',NULL,'',0,1466423617),(471,0,'report_completion',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423617),(472,0,'report_completion','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423617),(473,0,'report_completion','2016052300','2016052300','Plugin installed',NULL,'',0,1466423617),(474,0,'report_configlog',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423617),(475,0,'report_configlog','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423617),(476,0,'report_configlog','2016052300','2016052300','Plugin installed',NULL,'',0,1466423617),(477,0,'report_courseoverview',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423617),(478,0,'report_courseoverview','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423617),(479,0,'report_courseoverview','2016052300','2016052300','Plugin installed',NULL,'',0,1466423617),(480,0,'report_eventlist',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423617),(481,0,'report_eventlist','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423617),(482,0,'report_eventlist','2016052300','2016052300','Plugin installed',NULL,'',0,1466423617),(483,0,'report_log',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423617),(484,0,'report_log','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423617),(485,0,'report_log','2016052300','2016052300','Plugin installed',NULL,'',0,1466423617),(486,0,'report_loglive',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423617),(487,0,'report_loglive','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423617),(488,0,'report_loglive','2016052300','2016052300','Plugin installed',NULL,'',0,1466423617),(489,0,'report_outline',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423617),(490,0,'report_outline','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423617),(491,0,'report_outline','2016052300','2016052300','Plugin installed',NULL,'',0,1466423618),(492,0,'report_participation',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423618),(493,0,'report_participation','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423618),(494,0,'report_participation','2016052300','2016052300','Plugin installed',NULL,'',0,1466423618),(495,0,'report_performance',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423618),(496,0,'report_performance','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423618),(497,0,'report_performance','2016052300','2016052300','Plugin installed',NULL,'',0,1466423618),(498,0,'report_progress',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423618),(499,0,'report_progress','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423618),(500,0,'report_progress','2016052300','2016052300','Plugin installed',NULL,'',0,1466423618),(501,0,'report_questioninstances',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423618),(502,0,'report_questioninstances','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423618),(503,0,'report_questioninstances','2016052300','2016052300','Plugin installed',NULL,'',0,1466423618),(504,0,'report_search',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423618),(505,0,'report_search','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423618),(506,0,'report_search','2016052300','2016052300','Plugin installed',NULL,'',0,1466423618),(507,0,'report_security',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423618),(508,0,'report_security','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423618),(509,0,'report_security','2016052300','2016052300','Plugin installed',NULL,'',0,1466423618),(510,0,'report_stats',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423618),(511,0,'report_stats','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423618),(512,0,'report_stats','2016052300','2016052300','Plugin installed',NULL,'',0,1466423619),(513,0,'report_usersessions',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423619),(514,0,'report_usersessions','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423619),(515,0,'report_usersessions','2016052300','2016052300','Plugin installed',NULL,'',0,1466423619),(516,0,'gradeexport_ods',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423619),(517,0,'gradeexport_ods','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423619),(518,0,'gradeexport_ods','2016052300','2016052300','Plugin installed',NULL,'',0,1466423619),(519,0,'gradeexport_txt',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423619),(520,0,'gradeexport_txt','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423619),(521,0,'gradeexport_txt','2016052300','2016052300','Plugin installed',NULL,'',0,1466423619),(522,0,'gradeexport_xls',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423619),(523,0,'gradeexport_xls','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423619),(524,0,'gradeexport_xls','2016052300','2016052300','Plugin installed',NULL,'',0,1466423620),(525,0,'gradeexport_xml',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423620),(526,0,'gradeexport_xml','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423620),(527,0,'gradeexport_xml','2016052300','2016052300','Plugin installed',NULL,'',0,1466423620),(528,0,'gradeimport_csv',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423620),(529,0,'gradeimport_csv','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423620),(530,0,'gradeimport_csv','2016052300','2016052300','Plugin installed',NULL,'',0,1466423620),(531,0,'gradeimport_direct',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423620),(532,0,'gradeimport_direct','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423620),(533,0,'gradeimport_direct','2016052300','2016052300','Plugin installed',NULL,'',0,1466423620),(534,0,'gradeimport_xml',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423620),(535,0,'gradeimport_xml','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423620),(536,0,'gradeimport_xml','2016052300','2016052300','Plugin installed',NULL,'',0,1466423620),(537,0,'gradereport_grader',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423620),(538,0,'gradereport_grader','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423620),(539,0,'gradereport_grader','2016052300','2016052300','Plugin installed',NULL,'',0,1466423620),(540,0,'gradereport_history',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423620),(541,0,'gradereport_history','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423621),(542,0,'gradereport_history','2016052300','2016052300','Plugin installed',NULL,'',0,1466423621),(543,0,'gradereport_outcomes',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423621),(544,0,'gradereport_outcomes','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423621),(545,0,'gradereport_outcomes','2016052300','2016052300','Plugin installed',NULL,'',0,1466423621),(546,0,'gradereport_overview',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423621),(547,0,'gradereport_overview','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423621),(548,0,'gradereport_overview','2016052300','2016052300','Plugin installed',NULL,'',0,1466423621),(549,0,'gradereport_singleview',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423621),(550,0,'gradereport_singleview','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423621),(551,0,'gradereport_singleview','2016052300','2016052300','Plugin installed',NULL,'',0,1466423621),(552,0,'gradereport_user',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423621),(553,0,'gradereport_user','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423621),(554,0,'gradereport_user','2016052300','2016052300','Plugin installed',NULL,'',0,1466423621),(555,0,'gradingform_guide',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423621),(556,0,'gradingform_guide','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423622),(557,0,'gradingform_guide','2016052300','2016052300','Plugin installed',NULL,'',0,1466423622),(558,0,'gradingform_rubric',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423622),(559,0,'gradingform_rubric','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423622),(560,0,'gradingform_rubric','2016052300','2016052300','Plugin installed',NULL,'',0,1466423622),(561,0,'mnetservice_enrol',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423622),(562,0,'mnetservice_enrol','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423622),(563,0,'mnetservice_enrol','2016052300','2016052300','Plugin installed',NULL,'',0,1466423622),(564,0,'webservice_rest',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423622),(565,0,'webservice_rest','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423622),(566,0,'webservice_rest','2016052300','2016052300','Plugin installed',NULL,'',0,1466423622),(567,0,'webservice_soap',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423622),(568,0,'webservice_soap','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423622),(569,0,'webservice_soap','2016052300','2016052300','Plugin installed',NULL,'',0,1466423622),(570,0,'webservice_xmlrpc',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423622),(571,0,'webservice_xmlrpc','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423623),(572,0,'webservice_xmlrpc','2016052300','2016052300','Plugin installed',NULL,'',0,1466423623),(573,0,'repository_alfresco',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423623),(574,0,'repository_alfresco','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423623),(575,0,'repository_alfresco','2016052300','2016052300','Plugin installed',NULL,'',0,1466423623),(576,0,'repository_areafiles',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423623),(577,0,'repository_areafiles','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423623),(578,0,'repository_areafiles','2016052300','2016052300','Plugin installed',NULL,'',0,1466423623),(579,0,'repository_boxnet',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423623),(580,0,'repository_boxnet','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423623),(581,0,'repository_boxnet','2016052300','2016052300','Plugin installed',NULL,'',0,1466423623),(582,0,'repository_coursefiles',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423623),(583,0,'repository_coursefiles','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423623),(584,0,'repository_coursefiles','2016052300','2016052300','Plugin installed',NULL,'',0,1466423623),(585,0,'repository_dropbox',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423623),(586,0,'repository_dropbox','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423624),(587,0,'repository_dropbox','2016052300','2016052300','Plugin installed',NULL,'',0,1466423624),(588,0,'repository_equella',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423624),(589,0,'repository_equella','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423624),(590,0,'repository_equella','2016052300','2016052300','Plugin installed',NULL,'',0,1466423624),(591,0,'repository_filesystem',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423624),(592,0,'repository_filesystem','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423624),(593,0,'repository_filesystem','2016052300','2016052300','Plugin installed',NULL,'',0,1466423624),(594,0,'repository_flickr',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423624),(595,0,'repository_flickr','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423624),(596,0,'repository_flickr','2016052300','2016052300','Plugin installed',NULL,'',0,1466423624),(597,0,'repository_flickr_public',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423624),(598,0,'repository_flickr_public','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423624),(599,0,'repository_flickr_public','2016052300','2016052300','Plugin installed',NULL,'',0,1466423624),(600,0,'repository_googledocs',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423624),(601,0,'repository_googledocs','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423624),(602,0,'repository_googledocs','2016052300','2016052300','Plugin installed',NULL,'',0,1466423624),(603,0,'repository_local',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423625),(604,0,'repository_local','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423625),(605,0,'repository_local','2016052300','2016052300','Plugin installed',NULL,'',0,1466423625),(606,0,'repository_merlot',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423625),(607,0,'repository_merlot','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423625),(608,0,'repository_merlot','2016052300','2016052300','Plugin installed',NULL,'',0,1466423625),(609,0,'repository_picasa',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423625),(610,0,'repository_picasa','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423625),(611,0,'repository_picasa','2016052300','2016052300','Plugin installed',NULL,'',0,1466423625),(612,0,'repository_recent',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423625),(613,0,'repository_recent','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423625),(614,0,'repository_recent','2016052300','2016052300','Plugin installed',NULL,'',0,1466423625),(615,0,'repository_s3',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423625),(616,0,'repository_s3','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423625),(617,0,'repository_s3','2016052300','2016052300','Plugin installed',NULL,'',0,1466423625),(618,0,'repository_skydrive',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423625),(619,0,'repository_skydrive','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423625),(620,0,'repository_skydrive','2016052300','2016052300','Plugin installed',NULL,'',0,1466423625),(621,0,'repository_upload',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423626),(622,0,'repository_upload','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423626),(623,0,'repository_upload','2016052300','2016052300','Plugin installed',NULL,'',0,1466423626),(624,0,'repository_url',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423626),(625,0,'repository_url','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423626),(626,0,'repository_url','2016052300','2016052300','Plugin installed',NULL,'',0,1466423626),(627,0,'repository_user',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423626),(628,0,'repository_user','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423626),(629,0,'repository_user','2016052300','2016052300','Plugin installed',NULL,'',0,1466423626),(630,0,'repository_webdav',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423626),(631,0,'repository_webdav','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423626),(632,0,'repository_webdav','2016052300','2016052300','Plugin installed',NULL,'',0,1466423627),(633,0,'repository_wikimedia',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423627),(634,0,'repository_wikimedia','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423627),(635,0,'repository_wikimedia','2016052300','2016052300','Plugin installed',NULL,'',0,1466423627),(636,0,'repository_youtube',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423627),(637,0,'repository_youtube','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423627),(638,0,'repository_youtube','2016052300','2016052300','Plugin installed',NULL,'',0,1466423627),(639,0,'portfolio_boxnet',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423627),(640,0,'portfolio_boxnet','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423627),(641,0,'portfolio_boxnet','2016052300','2016052300','Plugin installed',NULL,'',0,1466423627),(642,0,'portfolio_download',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423627),(643,0,'portfolio_download','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423627),(644,0,'portfolio_download','2016052300','2016052300','Plugin installed',NULL,'',0,1466423627),(645,0,'portfolio_flickr',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423627),(646,0,'portfolio_flickr','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423627),(647,0,'portfolio_flickr','2016052300','2016052300','Plugin installed',NULL,'',0,1466423627),(648,0,'portfolio_googledocs',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423627),(649,0,'portfolio_googledocs','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423627),(650,0,'portfolio_googledocs','2016052300','2016052300','Plugin installed',NULL,'',0,1466423627),(651,0,'portfolio_mahara',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423627),(652,0,'portfolio_mahara','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423627),(653,0,'portfolio_mahara','2016052300','2016052300','Plugin installed',NULL,'',0,1466423627),(654,0,'portfolio_picasa',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(655,0,'portfolio_picasa','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(656,0,'portfolio_picasa','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(657,0,'search_solr',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(658,0,'search_solr','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(659,0,'search_solr','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(660,0,'qbehaviour_adaptive',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(661,0,'qbehaviour_adaptive','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(662,0,'qbehaviour_adaptive','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(663,0,'qbehaviour_adaptivenopenalty',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(664,0,'qbehaviour_adaptivenopenalty','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(665,0,'qbehaviour_adaptivenopenalty','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(666,0,'qbehaviour_deferredcbm',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(667,0,'qbehaviour_deferredcbm','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(668,0,'qbehaviour_deferredcbm','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(669,0,'qbehaviour_deferredfeedback',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(670,0,'qbehaviour_deferredfeedback','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(671,0,'qbehaviour_deferredfeedback','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(672,0,'qbehaviour_immediatecbm',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(673,0,'qbehaviour_immediatecbm','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(674,0,'qbehaviour_immediatecbm','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(675,0,'qbehaviour_immediatefeedback',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(676,0,'qbehaviour_immediatefeedback','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(677,0,'qbehaviour_immediatefeedback','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(678,0,'qbehaviour_informationitem',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(679,0,'qbehaviour_informationitem','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423628),(680,0,'qbehaviour_informationitem','2016052300','2016052300','Plugin installed',NULL,'',0,1466423628),(681,0,'qbehaviour_interactive',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423628),(682,0,'qbehaviour_interactive','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(683,0,'qbehaviour_interactive','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(684,0,'qbehaviour_interactivecountback',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(685,0,'qbehaviour_interactivecountback','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(686,0,'qbehaviour_interactivecountback','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(687,0,'qbehaviour_manualgraded',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(688,0,'qbehaviour_manualgraded','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(689,0,'qbehaviour_manualgraded','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(690,0,'qbehaviour_missing',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(691,0,'qbehaviour_missing','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(692,0,'qbehaviour_missing','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(693,0,'qformat_aiken',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(694,0,'qformat_aiken','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(695,0,'qformat_aiken','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(696,0,'qformat_blackboard_six',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(697,0,'qformat_blackboard_six','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(698,0,'qformat_blackboard_six','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(699,0,'qformat_examview',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(700,0,'qformat_examview','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(701,0,'qformat_examview','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(702,0,'qformat_gift',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(703,0,'qformat_gift','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(704,0,'qformat_gift','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(705,0,'qformat_missingword',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(706,0,'qformat_missingword','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423629),(707,0,'qformat_missingword','2016052300','2016052300','Plugin installed',NULL,'',0,1466423629),(708,0,'qformat_multianswer',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423629),(709,0,'qformat_multianswer','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423630),(710,0,'qformat_multianswer','2016052300','2016052300','Plugin installed',NULL,'',0,1466423630),(711,0,'qformat_webct',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423630),(712,0,'qformat_webct','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423630),(713,0,'qformat_webct','2016052300','2016052300','Plugin installed',NULL,'',0,1466423630),(714,0,'qformat_xhtml',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423630),(715,0,'qformat_xhtml','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423630),(716,0,'qformat_xhtml','2016052300','2016052300','Plugin installed',NULL,'',0,1466423630),(717,0,'qformat_xml',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423630),(718,0,'qformat_xml','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423630),(719,0,'qformat_xml','2016052300','2016052300','Plugin installed',NULL,'',0,1466423630),(720,0,'tool_assignmentupgrade',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423630),(721,0,'tool_assignmentupgrade','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423630),(722,0,'tool_assignmentupgrade','2016052300','2016052300','Plugin installed',NULL,'',0,1466423630),(723,0,'tool_availabilityconditions',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423630),(724,0,'tool_availabilityconditions','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423630),(725,0,'tool_availabilityconditions','2016052300','2016052300','Plugin installed',NULL,'',0,1466423630),(726,0,'tool_behat',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423630),(727,0,'tool_behat','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423630),(728,0,'tool_behat','2016052300','2016052300','Plugin installed',NULL,'',0,1466423630),(729,0,'tool_capability',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423630),(730,0,'tool_capability','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423631),(731,0,'tool_capability','2016052300','2016052300','Plugin installed',NULL,'',0,1466423631),(732,0,'tool_cohortroles',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423631),(733,0,'tool_cohortroles','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423631),(734,0,'tool_cohortroles','2016052300','2016052300','Plugin installed',NULL,'',0,1466423631),(735,0,'tool_customlang',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423631),(736,0,'tool_customlang','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423631),(737,0,'tool_customlang','2016052300','2016052300','Plugin installed',NULL,'',0,1466423631),(738,0,'tool_dbtransfer',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423631),(739,0,'tool_dbtransfer','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423631),(740,0,'tool_dbtransfer','2016052300','2016052300','Plugin installed',NULL,'',0,1466423631),(741,0,'tool_filetypes',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423631),(742,0,'tool_filetypes','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423631),(743,0,'tool_filetypes','2016052300','2016052300','Plugin installed',NULL,'',0,1466423632),(744,0,'tool_generator',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423632),(745,0,'tool_generator','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423633),(746,0,'tool_generator','2016052300','2016052300','Plugin installed',NULL,'',0,1466423633),(747,0,'tool_health',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423633),(748,0,'tool_health','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423633),(749,0,'tool_health','2016052300','2016052300','Plugin installed',NULL,'',0,1466423633),(750,0,'tool_innodb',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423633),(751,0,'tool_innodb','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423633),(752,0,'tool_innodb','2016052300','2016052300','Plugin installed',NULL,'',0,1466423633),(753,0,'tool_installaddon',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423633),(754,0,'tool_installaddon','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423633),(755,0,'tool_installaddon','2016052300','2016052300','Plugin installed',NULL,'',0,1466423633),(756,0,'tool_langimport',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423633),(757,0,'tool_langimport','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423633),(758,0,'tool_langimport','2016052300','2016052300','Plugin installed',NULL,'',0,1466423633),(759,0,'tool_log',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423633),(760,0,'tool_log','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423634),(761,0,'tool_log','2016052300','2016052300','Plugin installed',NULL,'',0,1466423634),(762,0,'tool_lp',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423634),(763,0,'tool_lp','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423634),(764,0,'tool_lp','2016052300','2016052300','Plugin installed',NULL,'',0,1466423634),(765,0,'tool_lpmigrate',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423634),(766,0,'tool_lpmigrate','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423634),(767,0,'tool_lpmigrate','2016052300','2016052300','Plugin installed',NULL,'',0,1466423634),(768,0,'tool_messageinbound',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423634),(769,0,'tool_messageinbound','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423634),(770,0,'tool_messageinbound','2016052300','2016052300','Plugin installed',NULL,'',0,1466423634),(771,0,'tool_mobile',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423634),(772,0,'tool_mobile','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423634),(773,0,'tool_mobile','2016052300','2016052300','Plugin installed',NULL,'',0,1466423635),(774,0,'tool_monitor',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423635),(775,0,'tool_monitor','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423635),(776,0,'tool_monitor','2016052300','2016052300','Plugin installed',NULL,'',0,1466423635),(777,0,'tool_multilangupgrade',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423635),(778,0,'tool_multilangupgrade','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423635),(779,0,'tool_multilangupgrade','2016052300','2016052300','Plugin installed',NULL,'',0,1466423635),(780,0,'tool_phpunit',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423635),(781,0,'tool_phpunit','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423635),(782,0,'tool_phpunit','2016052300','2016052300','Plugin installed',NULL,'',0,1466423635),(783,0,'tool_profiling',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423635),(784,0,'tool_profiling','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423635),(785,0,'tool_profiling','2016052300','2016052300','Plugin installed',NULL,'',0,1466423636),(786,0,'tool_recyclebin',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423636),(787,0,'tool_recyclebin','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423636),(788,0,'tool_recyclebin','2016052300','2016052300','Plugin installed',NULL,'',0,1466423636),(789,0,'tool_replace',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423636),(790,0,'tool_replace','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423636),(791,0,'tool_replace','2016052300','2016052300','Plugin installed',NULL,'',0,1466423636),(792,0,'tool_spamcleaner',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423636),(793,0,'tool_spamcleaner','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423636),(794,0,'tool_spamcleaner','2016052300','2016052300','Plugin installed',NULL,'',0,1466423636),(795,0,'tool_task',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423636),(796,0,'tool_task','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423636),(797,0,'tool_task','2016052300','2016052300','Plugin installed',NULL,'',0,1466423636),(798,0,'tool_templatelibrary',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423636),(799,0,'tool_templatelibrary','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423636),(800,0,'tool_templatelibrary','2016052300','2016052300','Plugin installed',NULL,'',0,1466423636),(801,0,'tool_unsuproles',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423636),(802,0,'tool_unsuproles','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423636),(803,0,'tool_unsuproles','2016052300','2016052300','Plugin installed',NULL,'',0,1466423637),(804,0,'tool_uploadcourse',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423637),(805,0,'tool_uploadcourse','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423637),(806,0,'tool_uploadcourse','2016052300','2016052300','Plugin installed',NULL,'',0,1466423637),(807,0,'tool_uploaduser',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423637),(808,0,'tool_uploaduser','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423637),(809,0,'tool_uploaduser','2016052300','2016052300','Plugin installed',NULL,'',0,1466423637),(810,0,'tool_xmldb',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423637),(811,0,'tool_xmldb','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423637),(812,0,'tool_xmldb','2016052300','2016052300','Plugin installed',NULL,'',0,1466423637),(813,0,'cachestore_file',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423637),(814,0,'cachestore_file','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423637),(815,0,'cachestore_file','2016052300','2016052300','Plugin installed',NULL,'',0,1466423637),(816,0,'cachestore_memcache',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423637),(817,0,'cachestore_memcache','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423637),(818,0,'cachestore_memcache','2016052300','2016052300','Plugin installed',NULL,'',0,1466423637),(819,0,'cachestore_memcached',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423637),(820,0,'cachestore_memcached','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423637),(821,0,'cachestore_memcached','2016052300','2016052300','Plugin installed',NULL,'',0,1466423637),(822,0,'cachestore_mongodb',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423637),(823,0,'cachestore_mongodb','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423637),(824,0,'cachestore_mongodb','2016052300','2016052300','Plugin installed',NULL,'',0,1466423637),(825,0,'cachestore_session',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423637),(826,0,'cachestore_session','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423637),(827,0,'cachestore_session','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(828,0,'cachestore_static',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(829,0,'cachestore_static','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(830,0,'cachestore_static','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(831,0,'cachelock_file',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(832,0,'cachelock_file','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(833,0,'cachelock_file','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(834,0,'theme_base',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(835,0,'theme_base','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(836,0,'theme_base','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(837,0,'theme_bootstrapbase',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(838,0,'theme_bootstrapbase','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(839,0,'theme_bootstrapbase','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(840,0,'theme_canvas',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(841,0,'theme_canvas','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(842,0,'theme_canvas','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(843,0,'theme_clean',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(844,0,'theme_clean','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(845,0,'theme_clean','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(846,0,'theme_more',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(847,0,'theme_more','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(848,0,'theme_more','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(849,0,'assignsubmission_comments',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(850,0,'assignsubmission_comments','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(851,0,'assignsubmission_comments','2016052300','2016052300','Plugin installed',NULL,'',0,1466423638),(852,0,'assignsubmission_file',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423638),(853,0,'assignsubmission_file','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423638),(854,0,'assignsubmission_file','2016052300','2016052300','Plugin installed',NULL,'',0,1466423639),(855,0,'assignsubmission_onlinetext',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423639),(856,0,'assignsubmission_onlinetext','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423639),(857,0,'assignsubmission_onlinetext','2016052300','2016052300','Plugin installed',NULL,'',0,1466423639),(858,0,'assignfeedback_comments',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423639),(859,0,'assignfeedback_comments','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423639),(860,0,'assignfeedback_comments','2016052300','2016052300','Plugin installed',NULL,'',0,1466423639),(861,0,'assignfeedback_editpdf',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423639),(862,0,'assignfeedback_editpdf','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423640),(863,0,'assignfeedback_editpdf','2016052300','2016052300','Plugin installed',NULL,'',0,1466423640),(864,0,'assignfeedback_file',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423640),(865,0,'assignfeedback_file','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423640),(866,0,'assignfeedback_file','2016052300','2016052300','Plugin installed',NULL,'',0,1466423640),(867,0,'assignfeedback_offline',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423640),(868,0,'assignfeedback_offline','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423640),(869,0,'assignfeedback_offline','2016052300','2016052300','Plugin installed',NULL,'',0,1466423640),(870,0,'assignment_offline',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423640),(871,0,'assignment_offline','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423640),(872,0,'assignment_offline','2016052300','2016052300','Plugin installed',NULL,'',0,1466423640),(873,0,'assignment_online',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423640),(874,0,'assignment_online','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423640),(875,0,'assignment_online','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(876,0,'assignment_upload',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(877,0,'assignment_upload','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(878,0,'assignment_upload','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(879,0,'assignment_uploadsingle',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(880,0,'assignment_uploadsingle','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(881,0,'assignment_uploadsingle','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(882,0,'booktool_exportimscp',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(883,0,'booktool_exportimscp','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(884,0,'booktool_exportimscp','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(885,0,'booktool_importhtml',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(886,0,'booktool_importhtml','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(887,0,'booktool_importhtml','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(888,0,'booktool_print',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(889,0,'booktool_print','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(890,0,'booktool_print','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(891,0,'datafield_checkbox',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(892,0,'datafield_checkbox','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(893,0,'datafield_checkbox','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(894,0,'datafield_date',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(895,0,'datafield_date','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(896,0,'datafield_date','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(897,0,'datafield_file',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(898,0,'datafield_file','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(899,0,'datafield_file','2016052300','2016052300','Plugin installed',NULL,'',0,1466423641),(900,0,'datafield_latlong',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423641),(901,0,'datafield_latlong','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423641),(902,0,'datafield_latlong','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(903,0,'datafield_menu',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(904,0,'datafield_menu','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(905,0,'datafield_menu','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(906,0,'datafield_multimenu',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(907,0,'datafield_multimenu','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(908,0,'datafield_multimenu','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(909,0,'datafield_number',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(910,0,'datafield_number','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(911,0,'datafield_number','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(912,0,'datafield_picture',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(913,0,'datafield_picture','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(914,0,'datafield_picture','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(915,0,'datafield_radiobutton',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(916,0,'datafield_radiobutton','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(917,0,'datafield_radiobutton','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(918,0,'datafield_text',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(919,0,'datafield_text','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(920,0,'datafield_text','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(921,0,'datafield_textarea',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(922,0,'datafield_textarea','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(923,0,'datafield_textarea','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(924,0,'datafield_url',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(925,0,'datafield_url','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(926,0,'datafield_url','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(927,0,'datapreset_imagegallery',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(928,0,'datapreset_imagegallery','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(929,0,'datapreset_imagegallery','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(930,0,'ltiservice_memberships',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(931,0,'ltiservice_memberships','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(932,0,'ltiservice_memberships','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(933,0,'ltiservice_profile',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(934,0,'ltiservice_profile','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(935,0,'ltiservice_profile','2016052300','2016052300','Plugin installed',NULL,'',0,1466423642),(936,0,'ltiservice_toolproxy',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423642),(937,0,'ltiservice_toolproxy','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423642),(938,0,'ltiservice_toolproxy','2016052300','2016052300','Plugin installed',NULL,'',0,1466423643),(939,0,'ltiservice_toolsettings',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423643),(940,0,'ltiservice_toolsettings','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423643),(941,0,'ltiservice_toolsettings','2016052300','2016052300','Plugin installed',NULL,'',0,1466423643),(942,0,'quiz_grading',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423643),(943,0,'quiz_grading','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423643),(944,0,'quiz_grading','2016052300','2016052300','Plugin installed',NULL,'',0,1466423643),(945,0,'quiz_overview',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423643),(946,0,'quiz_overview','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423643),(947,0,'quiz_overview','2016052300','2016052300','Plugin installed',NULL,'',0,1466423643),(948,0,'quiz_responses',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423643),(949,0,'quiz_responses','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423643),(950,0,'quiz_responses','2016052300','2016052300','Plugin installed',NULL,'',0,1466423643),(951,0,'quiz_statistics',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423643),(952,0,'quiz_statistics','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423643),(953,0,'quiz_statistics','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(954,0,'quizaccess_delaybetweenattempts',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(955,0,'quizaccess_delaybetweenattempts','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(956,0,'quizaccess_delaybetweenattempts','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(957,0,'quizaccess_ipaddress',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(958,0,'quizaccess_ipaddress','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(959,0,'quizaccess_ipaddress','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(960,0,'quizaccess_numattempts',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(961,0,'quizaccess_numattempts','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(962,0,'quizaccess_numattempts','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(963,0,'quizaccess_openclosedate',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(964,0,'quizaccess_openclosedate','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(965,0,'quizaccess_openclosedate','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(966,0,'quizaccess_password',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(967,0,'quizaccess_password','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(968,0,'quizaccess_password','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(969,0,'quizaccess_safebrowser',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(970,0,'quizaccess_safebrowser','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(971,0,'quizaccess_safebrowser','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(972,0,'quizaccess_securewindow',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(973,0,'quizaccess_securewindow','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(974,0,'quizaccess_securewindow','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(975,0,'quizaccess_timelimit',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(976,0,'quizaccess_timelimit','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(977,0,'quizaccess_timelimit','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(978,0,'scormreport_basic',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(979,0,'scormreport_basic','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(980,0,'scormreport_basic','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(981,0,'scormreport_graphs',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(982,0,'scormreport_graphs','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(983,0,'scormreport_graphs','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(984,0,'scormreport_interactions',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(985,0,'scormreport_interactions','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(986,0,'scormreport_interactions','2016052300','2016052300','Plugin installed',NULL,'',0,1466423644),(987,0,'scormreport_objectives',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423644),(988,0,'scormreport_objectives','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423644),(989,0,'scormreport_objectives','2016052300','2016052300','Plugin installed',NULL,'',0,1466423645),(990,0,'workshopform_accumulative',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423645),(991,0,'workshopform_accumulative','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423645),(992,0,'workshopform_accumulative','2016052300','2016052300','Plugin installed',NULL,'',0,1466423645),(993,0,'workshopform_comments',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423645),(994,0,'workshopform_comments','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423645),(995,0,'workshopform_comments','2016052300','2016052300','Plugin installed',NULL,'',0,1466423645),(996,0,'workshopform_numerrors',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423645),(997,0,'workshopform_numerrors','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423645),(998,0,'workshopform_numerrors','2016052300','2016052300','Plugin installed',NULL,'',0,1466423645),(999,0,'workshopform_rubric',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423645),(1000,0,'workshopform_rubric','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423645),(1001,0,'workshopform_rubric','2016052300','2016052300','Plugin installed',NULL,'',0,1466423645),(1002,0,'workshopallocation_manual',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423645),(1003,0,'workshopallocation_manual','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423645),(1004,0,'workshopallocation_manual','2016052300','2016052300','Plugin installed',NULL,'',0,1466423645),(1005,0,'workshopallocation_random',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423645),(1006,0,'workshopallocation_random','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423645),(1007,0,'workshopallocation_random','2016052300','2016052300','Plugin installed',NULL,'',0,1466423645),(1008,0,'workshopallocation_scheduled',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423645),(1009,0,'workshopallocation_scheduled','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423645),(1010,0,'workshopallocation_scheduled','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1011,0,'workshopeval_best',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1012,0,'workshopeval_best','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1013,0,'workshopeval_best','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1014,0,'atto_accessibilitychecker',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1015,0,'atto_accessibilitychecker','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1016,0,'atto_accessibilitychecker','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1017,0,'atto_accessibilityhelper',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1018,0,'atto_accessibilityhelper','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1019,0,'atto_accessibilityhelper','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1020,0,'atto_align',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1021,0,'atto_align','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1022,0,'atto_align','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1023,0,'atto_backcolor',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1024,0,'atto_backcolor','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1025,0,'atto_backcolor','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1026,0,'atto_bold',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1027,0,'atto_bold','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1028,0,'atto_bold','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1029,0,'atto_charmap',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1030,0,'atto_charmap','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1031,0,'atto_charmap','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1032,0,'atto_clear',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1033,0,'atto_clear','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1034,0,'atto_clear','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1035,0,'atto_collapse',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1036,0,'atto_collapse','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1037,0,'atto_collapse','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1038,0,'atto_emoticon',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1039,0,'atto_emoticon','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1040,0,'atto_emoticon','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1041,0,'atto_equation',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1042,0,'atto_equation','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1043,0,'atto_equation','2016052300','2016052300','Plugin installed',NULL,'',0,1466423646),(1044,0,'atto_fontcolor',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423646),(1045,0,'atto_fontcolor','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423646),(1046,0,'atto_fontcolor','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1047,0,'atto_html',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1048,0,'atto_html','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1049,0,'atto_html','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1050,0,'atto_image',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1051,0,'atto_image','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1052,0,'atto_image','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1053,0,'atto_indent',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1054,0,'atto_indent','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1055,0,'atto_indent','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1056,0,'atto_italic',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1057,0,'atto_italic','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1058,0,'atto_italic','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1059,0,'atto_link',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1060,0,'atto_link','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1061,0,'atto_link','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1062,0,'atto_managefiles',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1063,0,'atto_managefiles','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1064,0,'atto_managefiles','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1065,0,'atto_media',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1066,0,'atto_media','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1067,0,'atto_media','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1068,0,'atto_noautolink',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1069,0,'atto_noautolink','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1070,0,'atto_noautolink','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1071,0,'atto_orderedlist',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1072,0,'atto_orderedlist','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1073,0,'atto_orderedlist','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1074,0,'atto_rtl',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1075,0,'atto_rtl','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1076,0,'atto_rtl','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1077,0,'atto_strike',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423647),(1078,0,'atto_strike','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423647),(1079,0,'atto_strike','2016052300','2016052300','Plugin installed',NULL,'',0,1466423647),(1080,0,'atto_subscript',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1081,0,'atto_subscript','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1082,0,'atto_subscript','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1083,0,'atto_superscript',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1084,0,'atto_superscript','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1085,0,'atto_superscript','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1086,0,'atto_table',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1087,0,'atto_table','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1088,0,'atto_table','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1089,0,'atto_title',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1090,0,'atto_title','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1091,0,'atto_title','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1092,0,'atto_underline',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1093,0,'atto_underline','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1094,0,'atto_underline','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1095,0,'atto_undo',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1096,0,'atto_undo','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1097,0,'atto_undo','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1098,0,'atto_unorderedlist',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1099,0,'atto_unorderedlist','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1100,0,'atto_unorderedlist','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1101,0,'tinymce_ctrlhelp',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1102,0,'tinymce_ctrlhelp','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1103,0,'tinymce_ctrlhelp','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1104,0,'tinymce_managefiles',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1105,0,'tinymce_managefiles','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1106,0,'tinymce_managefiles','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1107,0,'tinymce_moodleemoticon',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1108,0,'tinymce_moodleemoticon','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1109,0,'tinymce_moodleemoticon','2016052300','2016052300','Plugin installed',NULL,'',0,1466423648),(1110,0,'tinymce_moodleimage',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423648),(1111,0,'tinymce_moodleimage','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423648),(1112,0,'tinymce_moodleimage','2016052300','2016052300','Plugin installed',NULL,'',0,1466423649),(1113,0,'tinymce_moodlemedia',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423649),(1114,0,'tinymce_moodlemedia','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423649),(1115,0,'tinymce_moodlemedia','2016052300','2016052300','Plugin installed',NULL,'',0,1466423649),(1116,0,'tinymce_moodlenolink',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423649),(1117,0,'tinymce_moodlenolink','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423649),(1118,0,'tinymce_moodlenolink','2016052300','2016052300','Plugin installed',NULL,'',0,1466423649),(1119,0,'tinymce_pdw',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423649),(1120,0,'tinymce_pdw','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423649),(1121,0,'tinymce_pdw','2016052300','2016052300','Plugin installed',NULL,'',0,1466423649),(1122,0,'tinymce_spellchecker',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423649),(1123,0,'tinymce_spellchecker','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423649),(1124,0,'tinymce_spellchecker','2016052300','2016052300','Plugin installed',NULL,'',0,1466423649),(1125,0,'tinymce_wrap',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423649),(1126,0,'tinymce_wrap','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423649),(1127,0,'tinymce_wrap','2016052300','2016052300','Plugin installed',NULL,'',0,1466423649),(1128,0,'logstore_database',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423649),(1129,0,'logstore_database','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423649),(1130,0,'logstore_database','2016052300','2016052300','Plugin installed',NULL,'',0,1466423649),(1131,0,'logstore_legacy',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423649),(1132,0,'logstore_legacy','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423649),(1133,0,'logstore_legacy','2016052300','2016052300','Plugin installed',NULL,'',0,1466423649),(1134,0,'logstore_standard',NULL,'2016052300','Starting plugin installation',NULL,'',0,1466423649),(1135,0,'logstore_standard','2016052300','2016052300','Upgrade savepoint reached',NULL,'',0,1466423649),(1136,0,'logstore_standard','2016052300','2016052300','Plugin installed',NULL,'',0,1466423650);
/*!40000 ALTER TABLE `mdl_upgrade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_url`
--

DROP TABLE IF EXISTS `mdl_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_url`
--

LOCK TABLES `mdl_url` WRITE;
/*!40000 ALTER TABLE `mdl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user`
--

DROP TABLE IF EXISTS `mdl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `department` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `lastnamephonetic` varchar(255) DEFAULT NULL,
  `firstnamephonetic` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `alternatename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='One record for each person';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user`
--

LOCK TABLES `mdl_user` WRITE;
/*!40000 ALTER TABLE `mdl_user` DISABLE KEYS */;
INSERT INTO `mdl_user` VALUES (1,'manual',1,0,0,0,1,'guest','$2y$10$5wrgrXTEaTy6VTHj/GiDDO9ohr7lqGAMMTWtcuDIlwORzhKpTbS8y','','Guest user',' ','root@localhost',0,'','','','','','','','','','','','','en','gregorian','','99',0,0,0,0,'','',0,'','This user is a special user that allows read-only access to some courses.',1,1,0,2,1,0,0,1466423526,0,NULL,NULL,NULL,NULL,NULL),(2,'manual',1,0,0,0,1,'admin','$2y$10$LccMTjY78qMI0pEB1aM81upIG03F810q2OnnW38KHMoW66PMtWuD.','','Admin','User','null@htm.com',0,'','','','','','','','','','','','','en','gregorian','','99',1466423715,1466423715,0,1466423715,'10.2.10.48','',0,'',NULL,1,1,0,1,1,0,0,1466423752,0,'','','','',''),(3,'manual',1,0,0,0,1,'s1','$2y$10$rkO8X1ZgRD9iLunh4k.avecZ0I5.4EfXWTOJDftBtIIvT.oOcrrAS','','Eric','Cartman','s1@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',8,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423748,1466423748,0,NULL,NULL,NULL,NULL,NULL),(4,'manual',1,0,0,0,1,'s2','$2y$10$cDhximlMc8W0b.0a3Uwb4.00XXhgZhYj7riNuUPvSFuPAqjuszTcq','','Stan','Marsh','s2@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',12,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423749,1466423749,0,NULL,NULL,NULL,NULL,NULL),(5,'manual',1,0,0,0,1,'s3','$2y$10$hezEmciY1EzAMHoQpHCVGe/0PNH98IEP8j36ISdA.A/WylSA.ypL6','','Kyle','Broflovski','s3@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',16,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423749,1466423749,0,NULL,NULL,NULL,NULL,NULL),(6,'manual',1,0,0,0,1,'s4','$2y$10$atNGtbZzqCfzN8wfTgLrnu4wv3opSb9WD5FZN91jrTJ8Ige9yJ67i','','Kenny','McCormick','s4@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',20,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423750,1466423750,0,NULL,NULL,NULL,NULL,NULL),(7,'manual',1,0,0,0,1,'s5','$2y$10$I.AeX73Gol5Gujc17JTsOuvbhe26IaoVmcIBA0GnF8g3m7dQeMimS','','Butters','Stotch','s5@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',24,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423750,1466423750,0,NULL,NULL,NULL,NULL,NULL),(8,'manual',1,0,0,0,1,'s6','$2y$10$8itC/M7Ab/GbszelQRyUwOPDbspGCHup3BUzzdhHfo6wxh1wXbFbi','','Clyde','Donovan','s6@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',28,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423751,1466423751,0,NULL,NULL,NULL,NULL,NULL),(9,'manual',1,0,0,0,1,'s7','$2y$10$kDO/ysF//YaTftR.sJRYJukB5G9OKvOE/5gPaRd1TuaggqQQyk.WO','','Jimmy','Valmer','s7@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',32,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423751,1466423751,0,NULL,NULL,NULL,NULL,NULL),(10,'manual',1,0,0,0,1,'s8','$2y$10$n5hhaZ4ePc9U9Ahwl620M.sfk0PCfaI73Iz.cSEu/aWxBwAzfbQUC','','Timmy','Burch','s8@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',36,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423752,1466423752,0,NULL,NULL,NULL,NULL,NULL),(11,'manual',1,0,0,0,1,'s9','$2y$10$VWhWY51mKt5tjzUCAvYjz.usZJU5nfCfk8kpsK1G69zKVuHyy7If6','','Wendy','Testaburger','s9@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',40,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423752,1466423752,0,NULL,NULL,NULL,NULL,NULL),(12,'manual',1,0,0,0,1,'s10','$2y$10$F9FhT11KaHzdTRBP0URV9ezUj8BbXAM3YDnNw5H16Dcfy77a74Dwm','','Bebe','Stevens','s10@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',44,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423755,1466423755,0,NULL,NULL,NULL,NULL,NULL),(13,'manual',1,0,0,0,1,'t1','$2y$10$gVisffOYN4hA9HctN.NCy.OITKOpMTMFEDH5Ig5sZtvXSnwlpPxhq','','Herbert','Garrison','t1@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',48,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423755,1466423755,0,NULL,NULL,NULL,NULL,NULL),(14,'manual',1,0,0,0,1,'t2','$2y$10$bqU9c0i0hQ4x55pva40ydeFhMeSnCjGzopIKnWMqR5ZCeFGYoHeUK','','Sheila','Brovslovski','t2@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',52,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423756,1466423756,0,NULL,NULL,NULL,NULL,NULL),(15,'manual',1,0,0,0,1,'t3','$2y$10$/cvi6H/2higX5DX2DMrRGeP0wYTZu3mE4h7Stfguwyx4aJ51MJSTu','','Liane','Cartman','t3@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',56,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423757,1466423757,0,NULL,NULL,NULL,NULL,NULL),(16,'manual',1,0,0,0,1,'m1','$2y$10$c0okcqFHWtwVv2YZ0RtZoudEfy9/6uZu.WXCj7Vo/C5hYX7moXskW','','Officer','Barbady','m1@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',60,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423758,1466423758,0,NULL,NULL,NULL,NULL,NULL),(17,'manual',1,0,0,0,1,'m2','$2y$10$uHBK4dYC0LL.8eLTb8ijDeYiOviKccNPCjkeFyRPmBMnsvwNzD3zC','','Principal','Victoria','m2@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',64,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423759,1466423759,0,NULL,NULL,NULL,NULL,NULL),(18,'manual',1,0,0,0,1,'m3','$2y$10$Td6Ce0ez9CuQrKaScAqHo.valayPcyptvwD5BE/BWm8hB4b4x3waC','','Randy','Marsh','m3@example.com',0,'','','','','','','','Moodle HQ','Rock on!','','Perth','AU','en','gregorian','','99',0,0,0,0,'0.0.0.0','',68,'http://moodle.org','Who\'s your daddy?',1,1,0,2,1,0,1466423759,1466423759,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mdl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_devices`
--

DROP TABLE IF EXISTS `mdl_user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `model` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `pushid` varchar(255) NOT NULL DEFAULT '',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores user''s mobile devices information in order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_devices`
--

LOCK TABLES `mdl_user_devices` WRITE;
/*!40000 ALTER TABLE `mdl_user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_enrolments`
--

DROP TABLE IF EXISTS `mdl_user_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_enrolments`
--

LOCK TABLES `mdl_user_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_user_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_category`
--

DROP TABLE IF EXISTS `mdl_user_info_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_category`
--

LOCK TABLES `mdl_user_info_category` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_data`
--

DROP TABLE IF EXISTS `mdl_user_info_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_data`
--

LOCK TABLES `mdl_user_info_data` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_field`
--

DROP TABLE IF EXISTS `mdl_user_info_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_field`
--

LOCK TABLES `mdl_user_info_field` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_lastaccess`
--

DROP TABLE IF EXISTS `mdl_user_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_lastaccess`
--

LOCK TABLES `mdl_user_lastaccess` WRITE;
/*!40000 ALTER TABLE `mdl_user_lastaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_password_history`
--

DROP TABLE IF EXISTS `mdl_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_password_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `hash` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userpasshist_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A rotating log of hashes of previously used passwords for ea';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_password_history`
--

LOCK TABLES `mdl_user_password_history` WRITE;
/*!40000 ALTER TABLE `mdl_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_password_resets`
--

DROP TABLE IF EXISTS `mdl_user_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table tracking password reset confirmation tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_password_resets`
--

LOCK TABLES `mdl_user_password_resets` WRITE;
/*!40000 ALTER TABLE `mdl_user_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_preferences`
--

DROP TABLE IF EXISTS `mdl_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_preferences`
--

LOCK TABLES `mdl_user_preferences` WRITE;
/*!40000 ALTER TABLE `mdl_user_preferences` DISABLE KEYS */;
INSERT INTO `mdl_user_preferences` VALUES (1,2,'email_bounce_count','1'),(2,2,'email_send_count','1');
/*!40000 ALTER TABLE `mdl_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_private_key`
--

DROP TABLE IF EXISTS `mdl_user_private_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_private_key`
--

LOCK TABLES `mdl_user_private_key` WRITE;
/*!40000 ALTER TABLE `mdl_user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_private_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki`
--

DROP TABLE IF EXISTS `mdl_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki`
--

LOCK TABLES `mdl_wiki` WRITE;
/*!40000 ALTER TABLE `mdl_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_links`
--

DROP TABLE IF EXISTS `mdl_wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_links`
--

LOCK TABLES `mdl_wiki_links` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_locks`
--

DROP TABLE IF EXISTS `mdl_wiki_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_locks`
--

LOCK TABLES `mdl_wiki_locks` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_pages`
--

DROP TABLE IF EXISTS `mdl_wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_pages`
--

LOCK TABLES `mdl_wiki_pages` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_subwikis`
--

DROP TABLE IF EXISTS `mdl_wiki_subwikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_subwikis`
--

LOCK TABLES `mdl_wiki_subwikis` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_synonyms`
--

DROP TABLE IF EXISTS `mdl_wiki_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_synonyms`
--

LOCK TABLES `mdl_wiki_synonyms` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_versions`
--

DROP TABLE IF EXISTS `mdl_wiki_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_versions`
--

LOCK TABLES `mdl_wiki_versions` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop`
--

DROP TABLE IF EXISTS `mdl_workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `submissionfiletypes` varchar(255) DEFAULT NULL,
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackfiletypes` varchar(255) DEFAULT NULL,
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop`
--

LOCK TABLES `mdl_workshop` WRITE;
/*!40000 ALTER TABLE `mdl_workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_aggregations`
--

DROP TABLE IF EXISTS `mdl_workshop_aggregations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_aggregations`
--

LOCK TABLES `mdl_workshop_aggregations` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments`
--

LOCK TABLES `mdl_workshop_assessments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments_old`
--

LOCK TABLES `mdl_workshop_assessments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_comments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_comments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_comments_old`
--

LOCK TABLES `mdl_workshop_comments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_elements_old`
--

DROP TABLE IF EXISTS `mdl_workshop_elements_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_elements_old`
--

LOCK TABLES `mdl_workshop_elements_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades`
--

DROP TABLE IF EXISTS `mdl_workshop_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades`
--

LOCK TABLES `mdl_workshop_grades` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades_old`
--

DROP TABLE IF EXISTS `mdl_workshop_grades_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades_old`
--

LOCK TABLES `mdl_workshop_grades_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_old`
--

DROP TABLE IF EXISTS `mdl_workshop_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_old`
--

LOCK TABLES `mdl_workshop_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

DROP TABLE IF EXISTS `mdl_workshop_rubrics_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_rubrics_old`
--

LOCK TABLES `mdl_workshop_rubrics_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_stockcomments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_stockcomments_old`
--

LOCK TABLES `mdl_workshop_stockcomments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions`
--

LOCK TABLES `mdl_workshop_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions_old`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions_old`
--

LOCK TABLES `mdl_workshop_submissions_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

DROP TABLE IF EXISTS `mdl_workshopallocation_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopallocation_scheduled`
--

LOCK TABLES `mdl_workshopallocation_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

DROP TABLE IF EXISTS `mdl_workshopeval_best_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopeval_best_settings`
--

LOCK TABLES `mdl_workshopeval_best_settings` WRITE;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_accumulative`
--

DROP TABLE IF EXISTS `mdl_workshopform_accumulative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_accumulative`
--

LOCK TABLES `mdl_workshopform_accumulative` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_comments`
--

DROP TABLE IF EXISTS `mdl_workshopform_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_comments`
--

LOCK TABLES `mdl_workshopform_comments` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors`
--

LOCK TABLES `mdl_workshopform_numerrors` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors_map`
--

LOCK TABLES `mdl_workshopform_numerrors_map` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric`
--

LOCK TABLES `mdl_workshopform_rubric` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_config`
--

LOCK TABLES `mdl_workshopform_rubric_config` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_levels`
--

LOCK TABLES `mdl_workshopform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-20 17:25:10
