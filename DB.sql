-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: togethercultureuk
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_app_adminprofile`
--

DROP TABLE IF EXISTS `admin_app_adminprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin_app_adminprofile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_admin` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `admin_app_adminprofile_user_id_4ff3e670_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_app_adminprofile`
--

LOCK TABLES `admin_app_adminprofile` WRITE;
/*!40000 ALTER TABLE `admin_app_adminprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_app_adminprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_app_alert`
--

DROP TABLE IF EXISTS `admin_app_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin_app_alert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_app_alert`
--

LOCK TABLES `admin_app_alert` WRITE;
/*!40000 ALTER TABLE `admin_app_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_app_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_app_event`
--

DROP TABLE IF EXISTS `admin_app_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin_app_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `attendees` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_app_event`
--

LOCK TABLES `admin_app_event` WRITE;
/*!40000 ALTER TABLE `admin_app_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_app_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_app_member`
--

DROP TABLE IF EXISTS `admin_app_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin_app_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_app_member`
--

LOCK TABLES `admin_app_member` WRITE;
/*!40000 ALTER TABLE `admin_app_member` DISABLE KEYS */;
INSERT INTO `admin_app_member` VALUES (1,'Maryam','Maryam@gmail.com','dasdasd','asdasda');
/*!40000 ALTER TABLE `admin_app_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add profile',7,'add_profile'),(26,'Can change profile',7,'change_profile'),(27,'Can delete profile',7,'delete_profile'),(28,'Can view profile',7,'view_profile'),(29,'Can add profile',8,'add_profile'),(30,'Can change profile',8,'change_profile'),(31,'Can delete profile',8,'delete_profile'),(32,'Can view profile',8,'view_profile'),(33,'Can add admin profile',9,'add_adminprofile'),(34,'Can change admin profile',9,'change_adminprofile'),(35,'Can delete admin profile',9,'delete_adminprofile'),(36,'Can view admin profile',9,'view_adminprofile'),(37,'Can add member',10,'add_member'),(38,'Can change member',10,'change_member'),(39,'Can delete member',10,'delete_member'),(40,'Can view member',10,'view_member'),(41,'Can add event',11,'add_event'),(42,'Can change event',11,'change_event'),(43,'Can delete event',11,'delete_event'),(44,'Can view event',11,'view_event'),(45,'Can add alert',12,'add_alert'),(46,'Can change alert',12,'change_alert'),(47,'Can delete alert',12,'delete_alert'),(48,'Can view alert',12,'view_alert'),(49,'Can add event',13,'add_event'),(50,'Can change event',13,'change_event'),(51,'Can delete event',13,'delete_event'),(52,'Can view event',13,'view_event');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$Y5X8u4kPD01ZVy0yNUH2rp$/2+gObFOKPNqcBGRmxvsLcGSgsHBYpSuEz+gcN1WuoY=','2025-04-06 16:13:36.001009',1,'admin','','','admin@gmail.com',1,1,'2025-04-06 14:24:17.612590'),(2,'pbkdf2_sha256$260000$opBsNnz3zGLhe4Qp6kQasO$92SM2aoiEzoya9vqCyzkKp1pDfsO5+/CR7QqPi+kJ6A=','2025-04-06 14:26:27.492068',0,'Mohsin','Mohsin','','mohsin@gmail.com',0,1,'2025-04-06 14:26:02.510698'),(4,'pbkdf2_sha256$260000$vwp2bS5rbHDv6xsFqdM1ae$0+jp3fmP8wiK7G54UFmhJSrCTI9ToyI9lz+KM4Ldk/Q=',NULL,0,'Romana','Romana','','Romana@gmail.com',0,1,'2025-04-06 14:32:13.316397'),(5,'pbkdf2_sha256$260000$BB9ZjtAYslA5vxVvpvbR9x$2U4ruPpSGGvQgN7ERl18tgvP0coPPUk+aL2+x7sGN4A=',NULL,0,'Asad','','','asad@gmail.com',0,1,'2025-04-06 14:44:55.234629'),(6,'pbkdf2_sha256$260000$yytfEDaE7izim1qQDuW043$N1oSBdCjO4YYQa2Yy090ACBs8tYPxM1aR+ZXakEIh4A=',NULL,0,'Faizan','','','faizan@gmail.com',0,1,'2025-04-06 14:50:03.641985'),(7,'pbkdf2_sha256$260000$8Viyo1cuR5C6UtlUxhnpz1$FqRr6Ss0EtOlRNDrJWsg/L9aBHuuIovQYOQcVVnc7K8=','2025-04-06 16:11:38.613933',0,'zubu','zubu','','zubi@gamil.com',0,1,'2025-04-06 15:06:35.971687'),(8,'pbkdf2_sha256$260000$FAV5rjWHIIibFVEmkDK3o4$yLz3n8yFS2Fp9+uBzvmc4WQab061xskf0GLpn6vRO7E=',NULL,0,'rana','rana','','Rana@gmail.com',0,1,'2025-04-06 15:07:38.625123'),(10,'pbkdf2_sha256$260000$i2HMGMx8VmQ8X04Vslx0gP$Vo76vdFlcRB8Y1tSQWDDymP+POIG9T91jXKvf7pSS+Q=',NULL,0,'minal','minal','','minal@gmail.com',0,1,'2025-04-06 15:10:12.467734'),(12,'pbkdf2_sha256$260000$Ofr7xG3cTsY7Y4xquE8cZ2$7XpkPRVC2RPQtIYaWASNCL+SOSH5xFVVB38U/zUMJ24=','2025-04-06 15:36:54.239217',0,'Amna','Amna','','Amna@gmail.com',0,1,'2025-04-06 15:14:51.479696'),(13,'pbkdf2_sha256$260000$pti1c8uVCpg5ULWvy66MFq$OmfRpHxZ6xNFdeWTFs9Ce5XUZO9Q0gQzpLzv9B5dIu8=','2025-04-06 15:30:23.389465',0,'umair','umair','','umair@gmail.com',0,1,'2025-04-06 15:29:17.041863'),(14,'pbkdf2_sha256$260000$6U4XJ9GHnlsSM1IwANaGYx$yH8atXcz7UDYOZVNzOZ+tlhDd7lqyIhW07LC7i+thX0=',NULL,0,'Romana_Marvi','Romana_Marvi','','romanaMarvi@gmail.com',0,1,'2025-04-06 16:13:17.417528');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'admin_app','adminprofile'),(12,'admin_app','alert'),(11,'admin_app','event'),(10,'admin_app','member'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'events_dashboard','event'),(8,'membership_dashboard','profile'),(7,'register','profile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-30 11:39:48.515855'),(2,'auth','0001_initial','2025-03-30 11:39:49.144771'),(3,'admin','0001_initial','2025-03-30 11:39:49.294227'),(4,'admin','0002_logentry_remove_auto_add','2025-03-30 11:39:49.312507'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-30 11:39:49.328748'),(6,'admin_app','0001_initial','2025-03-30 11:39:49.415455'),(7,'admin_app','0002_alert_event_member','2025-03-30 11:39:49.485124'),(8,'contenttypes','0002_remove_content_type_name','2025-03-30 11:39:49.600725'),(9,'auth','0002_alter_permission_name_max_length','2025-03-30 11:39:49.666113'),(10,'auth','0003_alter_user_email_max_length','2025-03-30 11:39:49.712647'),(11,'auth','0004_alter_user_username_opts','2025-03-30 11:39:49.730714'),(12,'auth','0005_alter_user_last_login_null','2025-03-30 11:39:49.794468'),(13,'auth','0006_require_contenttypes_0002','2025-03-30 11:39:49.799764'),(14,'auth','0007_alter_validators_add_error_messages','2025-03-30 11:39:49.818025'),(15,'auth','0008_alter_user_username_max_length','2025-03-30 11:39:49.890589'),(16,'auth','0009_alter_user_last_name_max_length','2025-03-30 11:39:49.983241'),(17,'auth','0010_alter_group_name_max_length','2025-03-30 11:39:50.017712'),(18,'auth','0011_update_proxy_permissions','2025-03-30 11:39:50.038751'),(19,'auth','0012_alter_user_first_name_max_length','2025-03-30 11:39:50.114767'),(21,'sessions','0001_initial','2025-03-30 11:39:50.260437'),(22,'events_dashboard','0001_initial','2025-04-03 15:51:37.824996'),(23,'events_dashboard','0002_auto_20250403_1615','2025-04-03 16:16:10.528132'),(24,'events_dashboard','0003_remove_event_event_image','2025-04-03 18:33:59.884357'),(25,'membership_dashboard','0001_initial','2025-04-03 18:34:00.042538'),(27,'membership_dashboard','0002_auto_20250403_1844','2025-04-03 18:44:30.776404'),(28,'events_dashboard','0004_event_attendees','2025-04-06 09:12:55.416151'),(31,'register','0001_initial','2025-04-06 14:48:42.800313'),(32,'register','0002_alter_profile_user','2025-04-06 14:48:42.828159'),(33,'register','0003_profile_status','2025-04-06 14:48:42.886252'),(34,'register','0004_auto_20250406_1442','2025-04-06 14:48:42.890178');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('32s7schqqidfr6rrcmizc9efwqvt4jqn','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1S8e:TxXPxZoQ61dJnNGDWGSF4PIvgqsYw6adUEGxAz_9awg','2025-04-06 15:43:24.209185'),('4r9qfa5olu17o90irghn5wuybptzkjgs','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SGA:qn4z7rlFGOpT8O4UkdB5b16MFZdBlvqV4meDZCLw0wI','2025-04-06 15:51:10.334915'),('55plr873phzdlrwy11ncc1dy7t6lwulj','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SdR:dYCDAI7usy63MqLQJjnrxxd4I4KCeHH-uQFJ5TwMvLE','2025-04-06 16:15:13.260205'),('5dovvt11z7blvaqytsqfydhmnqa1103d','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SQu:kTqFD35Gm_15qwG0lamXVLfTsZ20gCkJp0OO0dBHp3Q','2025-04-06 16:02:16.337257'),('6161s6hmwtvdbjf6fvvfctqs4tn42htn','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1STi:ltA9eZnwxbGpzXw7n9uAtdSjIk2wwwJT4VZ6PHy-eMg','2025-04-06 16:05:10.184619'),('7zs8hlaoq7vnwo2hbjyepw13iso9hj0l','.eJxVjs0OgjAQhN-lZ0L6R0s5qe_gmWxhC43ykxaMxvjulgSNnjY7881knqSGdenrNWKofUsqwgTJfkULzQXHzQnY-bhgyHcp5sd5DtMN23MCTzv3F-4h9ilpXVEaZNpKbVGUCIZKpahSBZVOK66VkxYEuIZrBiiFYVoIAUZyZwrgqfQ7kImM4AD-mnrXdMOh2768mYYdG2HAj7nNiRijn8Ya77MPD1Ip-noD5LlQ1w:1u1RyW:YAETKUFvqzo8__yS1OJWNJpkn9Agk6rPNiqz1aykSKk','2025-04-06 15:32:56.309010'),('8g8jlhal1z9hzd816i557f8vqm547mwv','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SIp:aN3KxirISQ49EkDz7ykCzoTVy0f9hE_4SRAl4n5j-Ns','2025-04-06 15:53:55.877046'),('8oiabp1ocrvxmkmyvdbte6ta0pjahseq','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SNG:S0jhJcYyhUAlkXQuc2v1jpcA1k5OWv3lB8yyGqFUfEk','2025-04-06 15:58:30.423127'),('dd330fh3qq2jq7xmpi5gb6o9v8katrqg','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SAO:S7xOGeNjPPcK-MYdHjkJ8dWx-bKSdYSe3rFKjIZQ8Wo','2025-04-06 15:45:12.829697'),('km9do2wged7hrugwx19wd7qkjii1tuwx','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SWd:74V2Dbbl4ZRj0d_Lm2X4b1VIINj0LmPpGbpcszj-Mek','2025-04-06 16:08:11.501177'),('oq9dfmppin74fnks4qq0guyuu8o9ys0t','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SCX:F9ZN24amuItGbZxQmVDJvI6P_Ex1lfBBWjJKRllpKts','2025-04-06 15:47:25.256684'),('y7qzht1kur5ec67xym7s452wiy3lvhtj','.eJxVjk0OwiAQhe_C2pACLZQu3XsGMgyDRQ2Y0iYa491tk8bo9n3v78UcLPPolkqTS4ENTLDDr-YBr5Q3EC6Qz4VjyfOUPN8sfKeVn0qg23H3_hWMUMc1baE1OhpJwUSrbeMtyQZD1xEptMoo9DZC23tDbSejlkoKMD0G4xF6sZV-P4p1oFKtqWRHj3uanmzQzfsD5pRDhg:1u1SKx:q8zWqDLykxIyGtbAkRJ-RhEarZOFxAcDcKTCDheU6-M','2025-04-06 15:56:07.036895');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_dashboard_event`
--

DROP TABLE IF EXISTS `events_dashboard_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `events_dashboard_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_attendees` int(11) NOT NULL,
  `current_attendees` int(11) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_dashboard_event`
--

LOCK TABLES `events_dashboard_event` WRITE;
/*!40000 ALTER TABLE `events_dashboard_event` DISABLE KEYS */;
INSERT INTO `events_dashboard_event` VALUES (1,'Street Dance','Street Dance in chester','2025-04-13','Chester',12,2,'upcoming'),(2,'Street Dance','Street Dance','2025-04-14','Liverpool',12,1,'upcoming');
/*!40000 ALTER TABLE `events_dashboard_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_dashboard_event_attendees`
--

DROP TABLE IF EXISTS `events_dashboard_event_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `events_dashboard_event_attendees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_dashboard_event_attendees_event_id_user_id_35ffc073_uniq` (`event_id`,`user_id`),
  KEY `events_dashboard_eve_user_id_eb4deebe_fk_auth_user` (`user_id`),
  CONSTRAINT `events_dashboard_eve_event_id_d249e650_fk_events_da` FOREIGN KEY (`event_id`) REFERENCES `events_dashboard_event` (`id`),
  CONSTRAINT `events_dashboard_eve_user_id_eb4deebe_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_dashboard_event_attendees`
--

LOCK TABLES `events_dashboard_event_attendees` WRITE;
/*!40000 ALTER TABLE `events_dashboard_event_attendees` DISABLE KEYS */;
INSERT INTO `events_dashboard_event_attendees` VALUES (1,1,12),(2,1,13),(3,2,13);
/*!40000 ALTER TABLE `events_dashboard_event_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_dashboard_profile`
--

DROP TABLE IF EXISTS `membership_dashboard_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `membership_dashboard_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `membership_dashboard_profile_user_id_8b0221a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_dashboard_profile`
--

LOCK TABLES `membership_dashboard_profile` WRITE;
/*!40000 ALTER TABLE `membership_dashboard_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_dashboard_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_profile`
--

DROP TABLE IF EXISTS `register_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `register_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dob` date DEFAULT NULL,
  `interests` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `benefits` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `membership_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `register_profile_user_id_41c3c6b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_profile`
--

LOCK TABLES `register_profile` WRITE;
/*!40000 ALTER TABLE `register_profile` DISABLE KEYS */;
INSERT INTO `register_profile` VALUES (1,'2001-03-12','','Workshop Access, Networking Events, Newsletter Subscription, Creative Workspace, Mentorship Sessions, Priority Booking','community','+441234512345','chester',7,'approved'),(3,NULL,'','','','','',8,'approved'),(7,'2000-03-12','Creating','[\'Networking Events\', \'Newsletter Subscription\']','key-access','+441234512345','sdasdasdfasf',10,'approved'),(9,'2000-02-12','Working, Creating','Newsletter Subscription, Creative Workspace, Priority Booking','community','+441234512345','lonodn uk 1234 st6',12,'approved'),(10,'2001-04-12','Sharing, Creating','Workshop Access, Networking Events, Creative Workspace, Mentorship Sessions','community','+441234512345','London st 6 123 ',13,'approved'),(11,'1998-01-12','Sharing, Experiencing','[\'Networking Events\', \'Newsletter Subscription\', \'Creative Workspace\', \'Mentorship Sessions\', \'Priority Booking\']','key-access','+441234512345','sdasdasd',14,'pending');
/*!40000 ALTER TABLE `register_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06 21:16:53
