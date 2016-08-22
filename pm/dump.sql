-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pm
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add question',7,'add_question'),(20,'Can change question',7,'change_question'),(21,'Can delete question',7,'delete_question'),(22,'Can add choice',8,'add_choice'),(23,'Can change choice',8,'change_choice'),(24,'Can delete choice',8,'delete_choice'),(25,'Can add account',9,'add_account'),(26,'Can change account',9,'change_account'),(27,'Can delete account',9,'delete_account'),(28,'Can add site',10,'add_site'),(29,'Can change site',10,'change_site'),(30,'Can delete site',10,'delete_site');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$24000$Kt9xB9TDvtrl$ORoM45vPtZ0Sg6WKfYAsPeqPNqTcGaiweOX6o994S9Q=','2016-07-16 22:49:49',1,'leesh6796','','','leesh6796@gmail.com',1,1,'2016-07-16 22:48:52');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'pm','account'),(10,'pm','site'),(8,'polls','choice'),(7,'polls','question'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-07-06 21:05:46'),(2,'auth','0001_initial','2016-07-06 21:05:46'),(3,'admin','0001_initial','2016-07-06 21:05:46'),(4,'admin','0002_logentry_remove_auto_add','2016-07-06 21:05:46'),(5,'contenttypes','0002_remove_content_type_name','2016-07-06 21:05:46'),(6,'auth','0002_alter_permission_name_max_length','2016-07-06 21:05:46'),(7,'auth','0003_alter_user_email_max_length','2016-07-06 21:05:46'),(8,'auth','0004_alter_user_username_opts','2016-07-06 21:05:46'),(9,'auth','0005_alter_user_last_login_null','2016-07-06 21:05:46'),(10,'auth','0006_require_contenttypes_0002','2016-07-06 21:05:47'),(11,'auth','0007_alter_validators_add_error_messages','2016-07-06 21:05:47'),(12,'pm','0001_initial','2016-07-06 21:05:47'),(13,'polls','0001_initial','2016-07-06 21:05:47'),(14,'sessions','0001_initial','2016-07-06 21:05:47'),(15,'pm','0002_auto_20160717_0348','2016-07-16 22:32:29'),(16,'pm','0003_auto_20160717_0429','2016-07-16 22:32:29'),(17,'pm','0004_auto_20160717_0547','2016-07-16 22:32:29'),(18,'pm','0005_auto_20160717_0548','2016-07-16 22:32:29'),(19,'pm','0006_auto_20160717_0555','2016-07-16 22:32:29'),(20,'pm','0007_auto_20160717_0556','2016-07-16 22:32:29'),(21,'pm','0008_auto_20160717_0603','2016-07-16 22:34:20'),(22,'pm','0009_auto_20160717_0606','2016-07-16 22:34:20'),(23,'pm','0010_delete_site','2016-07-16 22:34:20'),(24,'pm','0011_site','2016-07-16 22:34:20');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4xpuzq9f9wzmmf3woa0o5ladgy0tlbsg','MDExZTY0ODE1Nzc4ZDViMWQyOGI4ZWI0MmMzNDVmMjYyMzM1NzhjMDp7Imhhc2giOiIyYmI3NTY3ZWVjYThiMTZjMDI1YWYxOWU0MjQ5Mjg4M2Y3ZTAxZTc5MmEyZWRkZDRiN2UzZTU0ODAyZDI2NzFhIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImlzTG9naW4iOnRydWUsIm1hc3RlcmlkIjoibGVlc2g2Nzk2IiwiX2F1dGhfdXNlcl9oYXNoIjoiODM5MGIzNmY1NzdmNGM2NmQwMTdiOGUyZjIyMDZmMWE5NTUzM2JhYiJ9','2016-07-30 22:49:49'),('c9on7twizukot4p6ypc2tpv1qtgzpepc','OTIwMjljOWFhYjU5MmYyODUzZGZlN2Q0NTUxZDE1ODdjYTkzNjQwOTp7ImlzTG9naW4iOnRydWUsIm1hc3RlcmlkIjoibGVlc2g2Nzk2IiwiaGFzaCI6IjJiYjc1NjdlZWNhOGIxNmMwMjVhZjE5ZTQyNDkyODgzZjdlMDFlNzkyYTJlZGRkNGI3ZTNlNTQ4MDJkMjY3MWEifQ==','2016-08-21 10:46:22'),('f18txepi7yt8d2j0y96hbmwoiesktng0','OTIwMjljOWFhYjU5MmYyODUzZGZlN2Q0NTUxZDE1ODdjYTkzNjQwOTp7ImlzTG9naW4iOnRydWUsIm1hc3RlcmlkIjoibGVlc2g2Nzk2IiwiaGFzaCI6IjJiYjc1NjdlZWNhOGIxNmMwMjVhZjE5ZTQyNDkyODgzZjdlMDFlNzkyYTJlZGRkNGI3ZTNlNTQ4MDJkMjY3MWEifQ==','2016-07-31 20:53:17'),('fcujmoi2brvk7l2r3engytodutnynkkj','OTIwMjljOWFhYjU5MmYyODUzZGZlN2Q0NTUxZDE1ODdjYTkzNjQwOTp7ImlzTG9naW4iOnRydWUsIm1hc3RlcmlkIjoibGVlc2g2Nzk2IiwiaGFzaCI6IjJiYjc1NjdlZWNhOGIxNmMwMjVhZjE5ZTQyNDkyODgzZjdlMDFlNzkyYTJlZGRkNGI3ZTNlNTQ4MDJkMjY3MWEifQ==','2016-07-31 20:54:57'),('jzipmwkeqp3zewtt4hea6w5qmdf4kf70','OTIwMjljOWFhYjU5MmYyODUzZGZlN2Q0NTUxZDE1ODdjYTkzNjQwOTp7ImlzTG9naW4iOnRydWUsIm1hc3RlcmlkIjoibGVlc2g2Nzk2IiwiaGFzaCI6IjJiYjc1NjdlZWNhOGIxNmMwMjVhZjE5ZTQyNDkyODgzZjdlMDFlNzkyYTJlZGRkNGI3ZTNlNTQ4MDJkMjY3MWEifQ==','2016-07-31 20:51:34');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_account`
--

DROP TABLE IF EXISTS `pm_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master_id` varchar(100) NOT NULL,
  `master_pw` varchar(1000) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_account`
--

LOCK TABLES `pm_account` WRITE;
/*!40000 ALTER TABLE `pm_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_site`
--

DROP TABLE IF EXISTS `pm_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masterid` varchar(100) NOT NULL,
  `sitename` varchar(100) NOT NULL,
  `username` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_site`
--

LOCK TABLES `pm_site` WRITE;
/*!40000 ALTER TABLE `pm_site` DISABLE KEYS */;
INSERT INTO `pm_site` VALUES (71,'leesh6796','카이스트 인터넷 증명서 발급 센터 (http://kaist.certpia.com/)','3cb1c15e27ae46a2bb275c5bfcf2a31df268c99117bb80f4c193422d52563ff28edd3851e0f8054dd380d25e71b06caf705d2eb43015e0b7e1d574244f0da6bc2e753be9acc87c526faf03d8f68a5900','017a14251e86a27cfbd7c01ff6db394ef35b2204d456bc393ccef4791a1a7565fdf5e05f31537ad4f698ea6f8c8c44258a4a78402674d3dc0c512750ee5edc10','89e5fc2a74f66ab6c00ae22283814d55e0690936ea52fcd6048607f3c29129308bc6be7a94830b5996c7e24e1bcbf7d0c424fac1d9a1a39d909134f050db6149'),(72,'leesh6796','구글 세컨','76fbd3c735ecc60639b871130f0ea52902d8be18e88aa6ae3ab5e702bed0bef3d41799df80c42c8c3b005477d25cd6a3aa8b7f74b3b7298b40bb7cab16781c6cf544ec6637b063d378545d014c25465c','f75be88ea661dc383daeab612f10e8130ba9392a3f5bd271a939a92f640f2c61ff8f6e78d3336878da4a3c546ceaa1fdb7a97aec2f87369b29e457acfd9a336d','6cc187a58046686ad47806d46603bc6ac47a9ddcfe7a85a6e0e9034ad777230566b0eb84ef00c8b4b56acf35abf1cc031e4dca331a82d80de380d1d0f72e671f'),(73,'leesh6796','Memrise','4de05ca4d2c05362ebf59d443219d9fafa610684dccbd0f4d6c96f20ad702ba48cca2cf45e2c106acce016299bd48a917b6b9d68f8de3e5f99e651862041119d','32a67fcf52f34cca20c1f1d482e4f3952e836a1f56351e64fe00c902f62262d7960f6975452ed8a396ac1c50ee454c424a478e913af07071c8c62de5528bb38e','f7383aecdc06cf6cf48827eb07d1de4364d5ee2301da04a1d183605c1d22f0f732ffed10a6c99a82c040f2e22f3a7e6ba4d0da5ca404a3c5b08c280475e0c8c7'),(74,'leesh6796','Mathwork','13a6d5084c7421fd9c6bd30354230aac3ed9c5e85c3705156ccad046d96a6ab7b331572f3ae3e4e26c49a4186175e07ab7f063d4e5acc633bac3495298d08597eef018d2e1e7f2311862728922bcc143','2088bffb0547a4316b6b94aef094db3086bbdc44e53cdc0a25ed75477ffd91a06911fcf2f15ec6f6675d8c5ce5f8d0c51ac40a03fb144940103571442d7df948','43111ccca5204cef7ab577aeca9c5329911bb8a302fb43592af7d09d952b8ab6dd61ca973b86117011ba4fa0209d1bac101a63f658b7f06e7f75c86deb8f2c88'),(75,'leesh6796','도미노피자 (아빠)','dc1d0ea1f8264c5789f13f0381db3199575414181f7c58bec885ed144c9769a032ff7ed190a723b8d31175aa946677bbd51cb2357cdd821148263afb9aa7d1d3','b93e240cf06777729e08b2b24bdd5da4977bc44b1b307c985ce0210aab836bbe565c5ea886dbbb24a1c8b3b8b21af66f651a14ed86d0012df583b9132a3c7ecf','75b9f5119a6f28afd8d6646a97498bd0c7caae0c280a11ff812efa73fbf55dc64dafffb21d1e84a9ad99e22be5f4765660221c037365b5923761ec605c89f7a4'),(76,'leesh6796','한국장학재단','5a11b1e04eb2934cf06d2386d7e6961bb57270bdf34d6c97a2ec3943b59aba2a8df77562072961fc4a76e41f44f1e74fbc5d723821d37c74e40b75b626df07fc','0e23240ea12ddae768d2b102c10a72aa4389d10e07206b06e1304a9e69ab5995eae1617fe904193be0e3460cbbadc39d45a2901d5c04e142fb5d1077ad0c19f9','80b428e0d24fcae3afbf9934fedd5180072c9bc9db10597870ba4943942543bbbd84369a4aca848c591e36a578ca846c30aad02d67b74bf658f79ed1722a1ca4'),(78,'leesh6796','엄마구글계정','2628ee6c67183e34f0689f0197b0e11ac7e338f8900424682b955e440353325e5b9fd977628724250c586fd182a4aec23341fea3876668e0d82329f4adb076f01e3fce17914e26d89da802e3ca21638b','7f768ada61a2dfac6a7bc426efc3e9e78a7884bf676cf23335e668452c194efa4f1377141bae04e9186c1ec8bf76539cf18d71f744ff252577650bfe09295565','c3799cabdb83edffe5f44d27b6ab6ae67d560f012240efaa742862710c38e63afd85c20e1b116ed36ef9cc6509203201b0dfced4c51f9c6e82de38cc02bc6197'),(79,'leesh6796','한게임','77f268544751ce47a6fc5cc686bd52cf9b2ce7d3e290b046845928c030ed613395bd5a99a4efd094a1ee4ae026026c12b87b0b12bf3a9e44c004b2a247ee678d','34b444951939513913a9208a6628d043fbc5f62affbbf95bf82dfcff647be8e8e79cd330209d64c5ad6437eb1c5b4334f6a7100981b77f71896d0da5f0a90a20','9c4b5faa516775ba5815bd67b3f72554db174f9376453afcf1732ca176007bce3ff5f77c8ee76095882ab874ae6e6ddb4114d72d14f6d5d08b8d7722402e2544'),(80,'leesh6796','네이버','283d3f82ea2e3bc43b71faed48596e9aa5e499042dd7556493d7a82d875784e55549b8a857ea1fe32f6cf28f05f04fae9ece46052782ceed9b47f2c64e76ca38','3fd924472345c792cfe99f7ccdbae43e25e029589b775a9cefe28ade6dfd92f7f674c87d7c6f4ef8cfea004d45a6b8edd74630843d1ebee473366f07682b66bd','38018f6a2e034df65bf726241d0668b64ce6507da48837cdb0b61089f74dacd85fff34029f899113b8fb221710bca02172676ca1e53080907f88f352cc16367f'),(81,'leesh6796','우리은행','bb0252050df668822fcc649f28a8c9e94f23592dac697e47c8c4f9f6dbf411782517da71ce0d97462cc176c32edab2fabde7a7aead2aea86bbb4ffa54d92f7a5','11fb56f239ec7cb7cd348c429e7dd57c0fa8d11ec81131f0e32f4d43145cc2d39961f5fc3356926629f6edacbf9b7925e190700816760719ab6bd6a69927bcf7','6c0e0d64c92efa60aa45a309c4190b93b5aa335811d9ed0fda35df3625583c0c3680d0effec8f5eb825ab2f5f562004897974ce0aa85b9c0a3fd7e9924c9b3abe6ab44b2c34cc80eac6fda2a383b7196ed7d366ac0fec8d3b74a08e2c5359fcd4be5b889b53cbbd51bf022192851816861018effc967e3833be48c2ef6a2141319f69ea323c0070fb42a6a6fa742d16eedca19327a77a1203683c1876a53afea'),(82,'leesh6796','우체국','1c0902c55107ff6af077a152212b405937e95e61012d6633cb6f789c0bb3a16e96653cfbdf22798eb5fedcc36b8d2500357ccff8748702e2b48bbdca42003889','3f8d4328b0f23ec2e7ed7862e8a0c12bc6fa10e66aabf40f206b7e5c2af407f86de05ea1782f28ed7814498d6968c123920f483cb1342f8e622657b03d1a966e','895714ee5295c58ab18decc88dd8926b270e2b0654952cc267ba0f8117ddb1ecf8c64a2dd3f32a8ad184d7152c26a253e224c1d6eb4657b9341bf35e87e312fc57eaa34b47564ad0b4b27f86c1f0fd6d'),(83,'leesh6796','11번가','15fd1e61d465cb316a311c5ad78fd4138ff3c85110e1a99202194a31552b195faffde3b4acdc4642610f62c23e898322642a5f2f4726d71c285684775d3768b74bf3a29673f272df137b5d2d340905bb','cc8c2ea7d3dff8e92594d73133bad0fe9c522014a51e3c2a00db53db7b5f54460f6a2280d06569725084f1502567b56a1633659656cc6e2ae8bd923a319429be','176d1534768dbd51ec0dfc272df065de0f32f4c69a40b3ba4f8caafaf45090ec400afddd2926e0b4e868517b33fbc8df2a74fb7c531ec80425ff77a4d212fdad'),(84,'leesh6796','네이트','33b630cb8dd4edbc85173c140a0aca8fa2e42fb72fedc6f4e391716aef9115e5f5473185857e5ba08919a5522cd94f4a0c0936012b0aad1038971db2992683c0','88e5466f5ee4750f028049fdc95866816f1b138b611fe59f392834346d964b5b48ce738799777d3c5791f3eeedefd45e4d29c6cda8743f6e0f4f81b7ad86c808','9a97330f6788fd34ea87412daa552d623dc52d5f7953ae0b3c5e47c52989df361c187b69796d4c479004a61307492cc4f23c325317ac6b797891d54a81005ae1'),(85,'leesh6796','우리카드','4ea1e96a1b9f18ed6252858b75c85b3c469d5798f9222d87f51a3e8599d165d9265c217b7720c182eb193066bfbc1f4511855634ff8444e8be0915d83db014a5','77ccd246a5995adfbf8e6d8628a014c039f41e0a51552a1db62523ff703c0bcce45128530e04bed5d5a94af483948cce2f314c90fe9c8635ff7598ab1957691d','6f49e3ebca3b2c4f935e8671ded48e5ce5e0fba2c696de5579406fd885f4cee7867b189ce6cdc8088fd77532df2376161f0d48fcbef5bc2f7888244cde77d25f'),(86,'leesh6796','아이핀','5e3dc5b59b658d391983010cc5f671a9cf2fd730bec754e94a5e0d9e265d88d370f2466c83c3e78e86365c6f5577974bb7e317b2956c5b110bd942166ea337cb','774ab24c7a29098cca03d37100b2e3995a0103bffa34e4f1c220dc905d48b469cd9311122c873e992e95123ebf418a57854d08fd8c83d64371d8b130149ba085','dd4e3b9813a0e443260134a57686846eb208d7bb4ee2344ae95d44e00e6efbce3b013a0624007a147b6e08ae071b9fd76ea1eba65a0511efb53dd0f5734553649cfd3e0c7a870711b45b5e8152598180'),(87,'leesh6796','L Point','5b28133d773a4f41be448ed45f7ccc2c6e446f82667a49a273d767db58f8010419f0d00da63e2813aff5bd7d118f2bc0fa36e44a56127da4ab9392fd6215429bc89673defc4013f84ae8930d110d3dff','36348dcaed4bf12ab71cf3bf1ae44bd8172d2e8f8892feb1467a0418348fbe42e5ec6fae65d010dbea68bfcc6c5df61c290da3645d2ec465e19cd2e494781985','a0e87caf6676b6067161ff513a8df365a21d1cd281520a22b57fded64b6c1adad6be1e82e162a9e9048640ad186ac8ec6981e631a37c87c8a8add55afa364da7'),(88,'leesh6796','JetBrains','00a58d02b5cf2c8e6d7681fe0357b1be7aedbb51421fe478f0bb39a49968535db5428b9e6e2a223d16a58ea7130024b4e2ae1c308ed97486927c96046e29c1739a88beeacede59e8528d9611038626f4','c6a089377f1593d65b9c4685de392ca48b95d12d84f9a6d34d7e8de55326b0e7c3fd4d587913423b35663cef7144f77b3383610ac595788ca043803b5f446986','1bea0171939c207de58ff1c521d73d0a4836e301023ffedf69a32d9303baca3c901cace76f59df36a4d56d879c3c7f57eb580a22bd578e042148fc53c60ba34a'),(89,'leesh6796','PAYCO','8a291d137221fb012b4e2127cd30134b839ae457b3a8d432eacf26d586c89e22ec8b398dde97b44054762195ee463f59d4a35f590d1db0e903a9edcf54c582ee5260f7c360f039ef9d1f927bf6fffdc8','6abfe7c6e9b6949f757bf16775b319899149d983f62b5b4a65a5203fc3a31b2e1473a8011d8e7491306a5d0b2caf83a4833e91b74369b6fd825dea8527e084eb','ce8fe7d6d22b78727a58e1f9956f4cec79303c8f536f83905d1336dd43d1e2a0df2025ed900baababd825311f0ca8496985daa6dd0c0c528d83fecc6f988fb49'),(90,'leesh6796','github','070237fc9fefa1c69c9bdafb059c8c8c57002c4403e4213efd6b00eefd1c11821a45a518d6fca8b485f7d42ff36aa4a72caff018b9f40626d354d086491f7d9f','23343830093bd9e650e00360203891e49fb050bb69ece7136075b8b5596bbc62d2bc20c681c1e76e0b6b73b2352e81dcd279b8415047adbc44b3e299ea1896b9','737a1a98aec23b370035b2b1fe2cfe6c14fdffcc5677b85f51753b1c6f3e665c188ce2786b449b198f09108ae59564f115bd10a9ac9877fb44b2328dc4313f3e'),(91,'leesh6796','운전면허 안전교육','135e3c06edfe612dd7220d06509dd6af431135020e4fbc7df5867f0964d95e884c12f44f13093f3cfc6adbfa6e29056ef76cad1e7e0da5fe79df4f4e3dee0324','b5819a6a44923ccc9214cec662759bdb3125fc938ac740e34c30945cc0b3286d4aad4ba57dac0e83f86ef2554f8644244f7c9422d50b6f54d247507fe1004789','2d5fce4046d7cdb571a0ef4cfcfdcef3b81ed6824cc3f7281e614391ee3a3e01c5d7eb8f80aaa95ff9e49e88606741369fb684a8b65057e2341cae1efefa78e2'),(92,'leesh6796','June PC','9b42aea29576dc3d65b830dd0cd8b74b6f3ca1346e4a8471ac59de63849eada13c095ab661e42aca9b728930e7d2d5ba04db941513a929f4a76bf8bab0a045f1','03a08fa201babe2aedfcb6c1fb207a93701ad82cdf32c3535f59aabcceb3e69424eeba2aa1829c457deedd16414bb9788b38da90c0bdb45689e4d3319273ca73','c0ed6b70426619fb3b02fd2d45462cf9ef112234a6663e06da8ab92dcc7c3a78fa72a69744e0498bdf48b585a516ed43a9bde17dd2ff51f8e89dfb63caebd257'),(93,'leesh6796','카이스트 대학원생 협동조합','60618746bf975f03dadc15d573535a23f0a18e3c66d55cb6816fd5f048919235b8be55fb51848f6feb698cdb5325f631a42356e5736788fb6717e95aac0eb0c6','b3105db0e2677226b6dc9b2d5d9cf6b9a9074fa32b94562cc304eb5d32415f304695244ecfd28dd300edcd10c5579ffb49ee84b51549d441884b3f3ef6465988','7bbe1c4d299ac96262968807498167f165356e7e84348eefa4702e8d710ce5de47b9679e94a7ffba730140d797cbc28ee49d8090cac1a2cc6a9f37577b561acb'),(94,'leesh6796','noah 관리자','cae64219dd42ceb2f97919eff286bd38e990d18768d509dabd916f0f65cbff3006d2b52d03ba239e9f4f3d6896b454552f14a419e924376ff99b1166a2911267','0899c6c65638c2b4a4e6e8be776e2f01295ada126822141aa5d6cc6a32bae8998a76290696bb87a3ec65197b17dc9ffc34874e4fa39f01d5578db264d35f8d2f','5163a81951fc005c1d91f6f63017ccd379a3fa4a8cd895d618cdb77bd770ecdbba7e8528db993565b51dcdc42783fb0fc43ce0506d39c80a7a8c4fe8c7d89ad7'),(95,'leesh6796','인스타그램','082587887a4a2aa3d44935f869bde06dd06b0c6cf8893aecc1f6bbff48d08d0fc61236d50af0a8ee7aa38ab8a54a4bf8ab993f8cf98aab83af7fa097d782357f','7754c7229da3b50ce06965a7e1cef147d7004d891273a8d6832a514a72cc48877b86f19bb64e992cdd93cac51a123fa0b1abd80746c745f8d40c30f7e558dab3','a0f9e2b30c3d69f60dd338fcf6c4e237bac2f2463363acedd47ed6fb05b1c81c1521e43e9c45e88289452e0328c756d1437d7b0d81b9692255d28a93fbce550f'),(96,'leesh6796','Adobe','35937f60346e3d4d1b7d8c60ea63c6e5fc722b228415a9402cd1e8a02213b3c01d407656ccb83609534c6cfdcb64796cb1c796413abb556d632bb4ea5b163dc6d5b9a506aa43d44edc8b1940e81786f0','4d6cd31a20a4236dc2b4564264835b70795c46627c014397b8c15f34b79f2484f94ea7f024cab8a51e7a9c329d7b40962d480e88a1bd1b430a125b1916ad363c','b82b7ad32195d643ad78488259fd3d020e3ee522a5982ed3a67e18d477ead3b57eb04b0eb1341aef7fabd5666bc91d2b86b7a2f6d218984d4a43bdc918985c0f'),(97,'leesh6796','Microsoft','8ccec50cd6d3f8a11146ec0e1ed75f83d40d0aa43fc02c0661ecfdaa4852ddf19378dbc86746901ff0a2e53761de1b25ac3e03475e10cb7de8e2948ecce65a8177ad84de114edb7c9f002011fbe7fb31','50d0c3b3cb2b08f96619b51dc478a283ce273318ca10a921c0a21dd6ba35050a11e0b6c3b18920f0aebbaccdf2ca76b939b8c08f01f5bdff5e8dcd830752a845','abdd8605333eb76ee956fe3d688fb410418999476935995c9ffbe995eb3ce287f488458d5f6acc59a3bf47e8ae2ddd5825a885ed105bdfa2e7b30ad7d8de276e'),(98,'leesh6796','Slack','0f930f005a27ac4d6bfcf76ce0e24b194d1ad455d21e12e4e223e537e27ab837c878ca05574770ece18af9a498563b499494533393e60fffb59c48209628c922','597e7abd992cf30ae52d52727a52a6bc486fc6ed8161f2408f285773c6cfced65efffecf0a9bfa31d9069824e6a1cab19b112b6dcebe73fe6484c08063235768','08617ce084504dd9a17135f001f4e05d2557c3d19bab0036ba91519dddba84c5a09d5f17f94074652ba0fb42dba8e2db5c9d9adcee22ee128e75ea90ca684285'),(99,'leesh6796','가비아','047bfbf53662ea65f4c0a0501389e4cb30a1897211e354214d20ed6a757be0960ce58a678ae764fb030cc0524f80dc970d82c4fa8faf05054b77eb54cb43d660','d14e0288e4e6ed7ca2731ae5c309dbb7eecac87707a8796304f711c08ab6b66e6c482ac2f40044bc5d6ec7ca841d27b4b9d36172883c1369e335d34139052fdc','080ac9e95c855f763825394b6618cd10aff6cee5109e05c350b825f71aa152d441dab134d8ac08b98a13f771f711c4b1f2a01d7cdfc568aa972230e02204330b'),(100,'leesh6796','컬쳐랜드','bee2cc0664c54c576b1003ec6a9c3868dab53b57c233aa6f38728465827c3bb2c138f61a98e187dc25544ae7e94e900d90a0374271cbaaae8b2e590f596cf52f','19e8e8fdf661f5fcc55de08aa47317e8aef2f7495e59092ae173e73ca72763ec9a7b1c8a37b724a50b7c556c8dd406315e6db013816540a163f1ebcfb1869208','7d6b9afbe7c443de62edf104fc50577991b9dc4427c7a9098fd203a3f0ae2ce39c54096d32808a2b6139fd491ea8621e606f572bd54a94c73d0126271a3917b5'),(101,'leesh6796','AWS 서울','dc4547d09559a071d2dc3f374091b8f2ffc70a75682fc8f9e28cba71ac43ea1e67f629e5587ca2eca9384ed6255fe2cf870bfc5b21269defab932bf992fea1b313269cea09310c26a64e8295f77e63b9','ce7c670f418fc84a23648dcc3653349c1b62882809b5d095881468b11935bf9455c21f64192d1582ac512732f3bba2d531d4feda8fd5f44ceada16b036093685','62dbb1e383c3df6ea51ca6d682449b50ba7f6c6d0d12ed48f98fbb273755d70319adf3bbb45d1dc41a4069926b4d01fdd08f0460f62b893a386f9c60246beacf'),(102,'leesh6796','Adobe+','95601eea93e000ef61f60124caeec074c0404b9f888fe561e3b3684a52a8504498809a1532377a0570cd84f46277cddc27e1b90118d29462e3d1e762176bac20','3624a5e7a8cef167fce507ab66b25aa3b046c72ae5991a8d5a6be66e100ce1d753a061f5e727a63f8de1693a81b4b320be2ccf6d129c8f3345eab4a46b1451fa','bcb5759947450373a5e14874ca6d9bad5e09576745c389fcb5b76a8e6d49fae79ff1541a29d1d9c00fd3ff466f3bfbd9095ff68b6ad27dbccfa349fad49a84dc'),(103,'leesh6796','KAIST','4b5231cb0589cf169018fdf31ba8b094570404e35272c970d721f39827dc663fe3312bdd410bcdc97e3898fbe589d8f8a26d66e7dfffecb1d6980a657694ebc7','19783b4ac4bc2ffb4176d333d2088d780de934b27d6752cf3cc353a76d2d1b2daaaafdc81b83abcaa1266fd319219a260ced659ce553d639246bf33ddeaca4fd','25fed18a4a1c31c0c214e71ae9b88c6f8eb324e45db126a11d639a25e171bef35156df6174501d6a5a38018688118c4842326f58885c118b11eecff0b515f1b2'),(104,'leesh6796','AWS SQL','db43dd3f33fc33a5a573f8fea58fd08876529f15234a6bf7267fe365dfb3532bf6cf7fa308c26b308b960534eb3fbe5707eb3de4f240fe32d392f9f9f5145e0d','3d5ea6791a85cf382942f929d5f59a1dd2c02734f6b3d6107cbd1ac326a141cca1320bb5d92e7dd69725ec36c128525e033b206a4ead0b9e580768bd17419c55','0b500e902c2834bd81a22d48748b874b9cdb33bd74a544e8bc70ecc2c33d03f49c833d63b453599a4159e410ea068c3fbccf3dfebe636d2b8385ba2d6ba47782'),(105,'leesh6796','SSL','6c6d388878f041793e1769577abf32b0985f495989dc8811e2bc297bced5c76b62c93a854fda6ef15c6c468895e8b6f96fc757c13f5fdb0813f4a74f2b85fa40ffcde5bf1ab4f4eeec82e6f3a8b1daff','c158313378cb18be0122a4b259dce476039ae045144ce9be55586bca2cb701b44dde257841770142bd4ccf692bc0d8eab053b71f1b534359951be84b2a2c887b','9415b9ea1f6006ebcab39c107691aff1bba381e117f182fe64013ff327ac99a1b7cebcd9ede5da25ba1e82775b68f398690abc32a5d38eefa4bf43b2179e0be7'),(108,'leesh6796','넥슨','66ac788e2398ecc167a7955a6fdc7f70c7ec786a4939d2ca97008b6366a7e49d5c789ce89711cad24c2b264f0f0c06a4ef734d08bdff073f29a6dd0d9515f0a0','b17788718bec2d81b32b6fe41b3386ea8eb5826045c942d51cc7a14a60a8d88ace0216d946ea0eb34bf92c99f99fec64266782f0562a99f95f32e9b18c3af06b','955ff95e698e320d33fcd2316ec43477f02691e44d645bc261237663c14d45c73a4758b22ba8cba41da80a08da16aea30e26752937b28b619e29c136f29aae99'),(109,'leesh6796','메이플스토리','8a44b19a510a33fb94d4bf8dc5cc197498d3200661cf18cb5958bdac4ddefdf218739bb355dd4da2312b206d9fc2b0f7e74e7be68711a90240c0b676ffaefecf6215f2f8a8f6d44c2a6914c01ef08c3a','b870a9f9997fc5171033aa81541b9c08348aa7343b7e688576e78a952d83821df71ace2ee7af564e8ea90d9711afd0d5896e1a18a62ca7e49634a1684d5d9364','489a23fb715e3d8e419e1aa78579bd4e8e2ce718b2a5644ae287754021d16753f5cc0b0894e429b0f96ba89101b548120a7230601bb596810487d0032b56039c49c9436a75a4469b500a18297e3bdb6e'),(110,'leesh6796','카이스트신문 위키','a7e4fb78766eb3c62e39e59b5a0b6a07a25ad414ec3884d6d1dcb006b45b30939e56169afb555510ac3b97f7c08dcd0ed6fade847eb3a511109eb3599e95342c','baac355c8638d018d599e492f1b364c2bde4bb601b744189a44a4d1232b4b45ba9d9fe5f5ffab6399caeba97feaaafa6967dbfe319a51a17aefc4148d701d8aa','37d9fbf1302ee358c2eb071bc666b64e6874b6327eeb3321317517f2105dcc3222eb2de42ed8e52ffd81c0beeb0d9a9fff15045d967bad007abb55fb94688e7c'),(111,'leesh6796','카이스트신문','0f506e30a4a59566dd6882cdaa707b2644ac1acd2a11ff10e226806dab4519072d8487528306fdf9095bb5917f588ce857dca83eeacdb24ad7be5e93af610dbc','d8ef4f400c3bb3fad37c66af7600d91b4dafbcfd9166f7df7cc8e32e221ae6e9b41aebe800dcedf20a5fb76c8d2bcc9d57485a5130a82ce9072df40301072420','ed115d44b8b38cfce3bd783b745c96c2cf4683567bb7a2eaf837ff62a00d9504d7e266370a169e531e8109b9c2e852cc697503e1c8d30daf2dd5a2fa13a39ada');
/*!40000 ALTER TABLE `pm_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_7aa0f6ee` (`question_id`),
  CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_question`
--

DROP TABLE IF EXISTS `polls_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_question`
--

LOCK TABLES `polls_question` WRITE;
/*!40000 ALTER TABLE `polls_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-22  2:38:06
