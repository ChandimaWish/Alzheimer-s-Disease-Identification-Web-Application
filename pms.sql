-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: pms
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `password_reset_log`
--

DROP TABLE IF EXISTS `password_reset_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_log`
--

LOCK TABLES `password_reset_log` WRITE;
/*!40000 ALTER TABLE `password_reset_log` DISABLE KEYS */;
INSERT INTO `password_reset_log` VALUES (1,'doctor@gmail.com',_binary '','a397b553-1175-4b6f-8b1b-98f8e9317049','http://localhost:8080/reset-password/a397b553-1175-4b6f-8b1b-98f8e9317049'),(2,'doctor@gmail.com',_binary '\0','45df605b-6eda-4ebc-9085-bcd96455d846','http://localhost:8080/reset-password/45df605b-6eda-4ebc-9085-bcd96455d846'),(3,'doctor@gmail.com',_binary '\0','06478c02-b71f-450e-a231-fa10df66667d','http://localhost:8080/api/v1/auth/reset-password/06478c02-b71f-450e-a231-fa10df66667d'),(4,'doctor@gmail.com',_binary '','6b695a23-a406-474a-bf0e-45f32cdcbee7','http://localhost:8080/api/v1/auth/reset-password/6b695a23-a406-474a-bf0e-45f32cdcbee7'),(5,'doctor@gmail.com',_binary '','02b40605-c818-446f-ba06-0ce1a75f2e34','http://localhost:8080/api/v1/auth/reset-password/02b40605-c818-446f-ba06-0ce1a75f2e34'),(6,'doctor@gmail.com',_binary '','b88004dd-a872-489c-9010-316f52345174','http://localhost:8080/api/v1/auth/reset-password/b88004dd-a872-489c-9010-316f52345174'),(7,'doctor@gmail.com',_binary '','a1437917-c6cd-49d9-b8fd-70ba4d57701b','http://localhost:8080/api/v1/auth/reset-password/a1437917-c6cd-49d9-b8fd-70ba4d57701b'),(8,'doctor@gmail.com',_binary '','82b9a0e1-04d2-40d9-825c-750ad0e3ce24','http://localhost:8080/api/v1/auth/reset-password/82b9a0e1-04d2-40d9-825c-750ad0e3ce24'),(9,'doctor@gmail.com',_binary '','f6b9714a-2e75-485c-a263-f4c1e4c31202','http://localhost:8080/api/v1/auth/reset-password/f6b9714a-2e75-485c-a263-f4c1e4c31202'),(10,'doctor@gmail.com',_binary '','2364b28e-94b4-4933-9ab2-d97063b52e29','http://localhost:8080/api/v1/auth/reset-password/2364b28e-94b4-4933-9ab2-d97063b52e29'),(11,'doctor@gmail.com',_binary '','a33cdcf8-5aae-4fa0-9586-db1201d29a3c','http://localhost:8080/api/v1/auth/reset-password/a33cdcf8-5aae-4fa0-9586-db1201d29a3c'),(12,'doctor@gmail.com',_binary '','a7fecba4-3cbe-4b23-a1cd-277e2d14753b','http://localhost:8080/api/v1/auth/reset-password/a7fecba4-3cbe-4b23-a1cd-277e2d14753b'),(13,'doctor@gmail.com',_binary '','148b6f31-8f83-462b-a01c-879910d99ffd','http://localhost:8080/api/v1/auth/reset-password/148b6f31-8f83-462b-a01c-879910d99ffd'),(14,'doctor@gmail.com',_binary '\0','eae177c2-f4ec-4768-81eb-41c0919f707c','http://localhost:8080/api/v1/auth/reset-password/eae177c2-f4ec-4768-81eb-41c0919f707c'),(15,'doctor@gmail.com',_binary '','a19a68b7-eebb-4b0a-b6c8-a7097aa6b5e5','http://localhost:8080/api/v1/auth/reset-password/a19a68b7-eebb-4b0a-b6c8-a7097aa6b5e5'),(16,'doctor@gmail.com',_binary '','f75c4d3e-577e-401e-a57c-2c6a3c34a7c7','http://localhost:8080/api/v1/auth/reset-password/f75c4d3e-577e-401e-a57c-2c6a3c34a7c7'),(17,'doctor@gmail.com',_binary '\0','885d6de5-3f96-44a3-bf5b-bc917086fbfd','http://localhost:8080/api/v1/auth/reset-password/885d6de5-3f96-44a3-bf5b-bc917086fbfd'),(18,'doctor@gmail.com',_binary '','bed15408-36f1-439e-a7ac-e03e167d7688','http://localhost:8080/api/v1/auth/reset-password/bed15408-36f1-439e-a7ac-e03e167d7688'),(19,'doctor@gmail.com',_binary '','b7c4084f-72e1-4f35-a231-4029adea8dea','http://localhost:8080/api/v1/auth/reset-password/b7c4084f-72e1-4f35-a231-4029adea8dea'),(20,'doctor@gmail.com',_binary '\0','8209becf-49af-43ad-be5f-e3f3c310e276','http://localhost:8080/api/v1/auth/reset-password/8209becf-49af-43ad-be5f-e3f3c310e276'),(21,'doctor@gmail.com',_binary '\0','526bd9e3-0ca5-411d-991c-b5535c2922ba','http://localhost:8080/api/v1/auth/reset-password/526bd9e3-0ca5-411d-991c-b5535c2922ba'),(22,'doctor@gmail.com',_binary '\0','df758367-e0a0-4066-931b-e1ba15188d2a','http://localhost:8080/api/v1/auth/reset-password/df758367-e0a0-4066-931b-e1ba15188d2a');
/*!40000 ALTER TABLE `password_reset_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `nic` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8g3w6j39n5gmbmoq80nbw55hy` (`user`),
  CONSTRAINT `FKltum8cbaq9qwg96unmf3nev14` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admin`
--

LOCK TABLES `tbl_admin` WRITE;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
INSERT INTO `tbl_admin` VALUES (1,_binary '','TEST HOS','990492042','0768409954',4);
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `fbs_id` bigint DEFAULT NULL,
  `report_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2y8tyihty2hdcc4vuoh0e2ps3` (`fbs_id`),
  KEY `FK40nkbal6ydw9y98rrt1xe60v7` (`report_id`),
  CONSTRAINT `FK2y8tyihty2hdcc4vuoh0e2ps3` FOREIGN KEY (`fbs_id`) REFERENCES `tbl_fbs` (`id`),
  CONSTRAINT `FK40nkbal6ydw9y98rrt1xe60v7` FOREIGN KEY (`report_id`) REFERENCES `tbl_fbs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` VALUES (1,'2024-03-04 21:28:52.200276','patient@gmail.com',NULL,NULL,'test comment',1,NULL),(2,'2024-03-04 21:29:38.922777','patient@gmail.com',NULL,NULL,'test comment',2,NULL),(3,'2024-03-04 21:40:27.768092','patient@gmail.com',NULL,NULL,'test comment 2',1,NULL),(4,'2024-03-04 21:42:20.176405','patient@gmail.com',NULL,NULL,'test comment 3',1,NULL),(5,'2024-03-09 22:14:07.853984','patient@gmail.com',NULL,NULL,'test comment',3,NULL),(6,'2024-03-09 22:19:18.757936','patient@gmail.com',NULL,NULL,'test comment',4,NULL),(7,'2024-03-09 22:23:25.560163','patient@gmail.com',NULL,NULL,'test comment 3',4,NULL),(8,'2024-03-09 22:50:40.384230','admin@gmail.com',NULL,NULL,'This is test comment for front end check',5,NULL),(9,'2024-03-09 23:06:05.609317','admin@gmail.com',NULL,NULL,'asdasdasd',1,NULL),(10,'2024-03-09 23:10:15.305467','admin@gmail.com',NULL,NULL,'front end edit comment',1,NULL),(11,'2024-03-09 23:13:28.980774','admin@gmail.com',NULL,NULL,'rrr',5,NULL),(12,'2024-03-09 23:15:24.537996','admin@gmail.com',NULL,NULL,'aerfdr',5,NULL),(13,'2024-03-09 23:17:33.656952','admin@gmail.com',NULL,NULL,'asdasdasd',3,NULL),(14,'2024-03-09 23:21:38.313584','admin@gmail.com',NULL,NULL,'test comment new',5,NULL),(15,'2024-03-09 23:24:24.809015','patient@gmail.com',NULL,NULL,'comment from patient',5,NULL),(16,'2024-03-09 23:26:53.616711','patient@gmail.com',NULL,NULL,'test\n',4,NULL),(17,'2024-03-10 00:22:04.935193','patient@gmail.com',NULL,NULL,'test comment from the pationent',4,NULL),(18,'2024-03-10 00:25:50.492323','admin@gmail.com',NULL,NULL,'pdf check',6,NULL),(19,'2024-03-10 00:27:25.217613','admin@gmail.com',NULL,NULL,'test',7,NULL),(20,'2024-03-10 00:27:41.349604','admin@gmail.com',NULL,NULL,'asdasd',7,NULL),(21,'2024-03-10 00:54:32.235953','patient@gmail.com',NULL,NULL,'test comment',NULL,8),(22,'2024-03-10 00:54:43.964964','patient@gmail.com',NULL,NULL,'test comment 3',NULL,4),(23,'2024-03-24 20:15:52.090833','admin@gmail.com',NULL,NULL,'test',NULL,7),(24,'2024-03-24 20:18:58.005414','patient@gmail.com',NULL,NULL,'tdfasasd',NULL,8),(25,'2024-03-25 21:06:23.316466','admin@gmail.com',NULL,NULL,'test comment from admin',NULL,8),(26,'2024-03-25 21:06:55.000709','admin@gmail.com',NULL,NULL,'comment',NULL,2),(27,'2024-03-25 21:07:38.923067','admin@gmail.com',NULL,NULL,'First comment',NULL,9),(28,'2024-03-25 21:08:20.765044','patient@gmail.com',NULL,NULL,'comment from pation',NULL,9),(29,'2024-03-25 21:44:22.591863','admin@gmail.com',NULL,NULL,'test',NULL,8),(30,'2024-04-06 17:54:23.290731','doctor@gmail.com',NULL,NULL,'test',NULL,9),(31,'2024-04-06 17:56:25.050646','doctor@gmail.com',NULL,NULL,'dsfsdfsdf',NULL,9),(32,'2024-04-06 18:00:15.065730','doctor@gmail.com',NULL,NULL,'This is test from doctor',NULL,10);
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doctor`
--

DROP TABLE IF EXISTS `tbl_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_doctor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2qqvkk36y95o90semjidr0b5p` (`user`),
  CONSTRAINT `FK4omp6tuitn4gaxw4jiwavfhlr` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doctor`
--

LOCK TABLES `tbl_doctor` WRITE;
/*!40000 ALTER TABLE `tbl_doctor` DISABLE KEYS */;
INSERT INTO `tbl_doctor` VALUES (1,_binary '','TEST','0774428594','12548',6);
/*!40000 ALTER TABLE `tbl_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fbs`
--

DROP TABLE IF EXISTS `tbl_fbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_fbs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `fbs` double DEFAULT NULL,
  `file_dir` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `reported_date` date DEFAULT NULL,
  `patient` bigint DEFAULT NULL,
  `prediction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKktfil0d6ffh9succx7j8x1plj` (`patient`),
  CONSTRAINT `FKktfil0d6ffh9succx7j8x1plj` FOREIGN KEY (`patient`) REFERENCES `tbl_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fbs`
--

LOCK TABLES `tbl_fbs` WRITE;
/*!40000 ALTER TABLE `tbl_fbs` DISABLE KEYS */;
INSERT INTO `tbl_fbs` VALUES (1,'2024-03-04 21:28:52.151143','patient@gmail.com','2024-03-08 22:24:19.263260','admin@gmail.com',_binary '\0',23,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1709567932061_mi17.jpg','report','2024-02-10',1,NULL),(2,'2024-03-04 21:29:38.902454','patient@gmail.com',NULL,NULL,_binary '',23,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1709567978854_mi17.jpg','report','2024-02-10',1,NULL),(3,'2024-03-09 22:14:07.821168','patient@gmail.com',NULL,NULL,_binary '',NULL,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1710002647484_mi17.jpg','report','2024-02-10',1,'mod'),(4,'2024-03-09 22:19:18.711927','patient@gmail.com',NULL,NULL,_binary '',NULL,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1710002958656_mi17.jpg','report','2024-02-10',1,'mod'),(5,'2024-03-09 22:50:40.212416','admin@gmail.com',NULL,NULL,_binary '',NULL,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1710004840171_20231227152110_21.jpg','report','2024-03-18',1,'OK'),(6,'2024-03-10 00:25:50.375878','admin@gmail.com',NULL,NULL,_binary '',NULL,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1710010550330_hasaranga react app.pdf','report','2024-03-03',1,'OK'),(7,'2024-03-10 00:27:25.209216','admin@gmail.com',NULL,NULL,_binary '',NULL,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1710010645190_doctor-5840874_1920.png','report','2024-03-18',1,'OK'),(8,'2024-03-10 00:54:32.206897','patient@gmail.com',NULL,NULL,_binary '',NULL,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1710012272179_mi17.jpg','report','2024-02-10',1,'mod'),(9,'2024-03-25 21:07:38.883375','admin@gmail.com',NULL,NULL,_binary '',NULL,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1711381058840_20231227152110_105.jpg','report','2024-03-11',1,'OK'),(10,'2024-04-06 18:00:15.023980','doctor@gmail.com',NULL,NULL,_binary '',NULL,'D:\\SHIFTDEL\\ALZHEIMER\\application\\report_dir\\1712406614993_0b13dba9-d2ff-4370-8a43-488a3e209b43.jpg','report','2024-04-05',1,'VeryMildDemented');
/*!40000 ALTER TABLE `tbl_fbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient`
--

DROP TABLE IF EXISTS `tbl_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `blood_group` enum('AP','AN','BP','BN','ABP','ABN','OP','ON') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nic` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pbb2xrs3arnavl2w51i7n59oj` (`user`),
  CONSTRAINT `FK6ml3fc3ifkhep4rsh690aj7ws` FOREIGN KEY (`user`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient`
--

LOCK TABLES `tbl_patient` WRITE;
/*!40000 ALTER TABLE `tbl_patient` DISABLE KEYS */;
INSERT INTO `tbl_patient` VALUES (1,'2024-03-02 17:13:02.901844','admin@gmail.com',NULL,NULL,_binary '','OP','2023-12-05','990492043V','0768409954',5);
/*!40000 ALTER TABLE `tbl_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recommendation`
--

DROP TABLE IF EXISTS `tbl_recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_recommendation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `last_fire` date DEFAULT NULL,
  `next_fire` date DEFAULT NULL,
  `occurrence` enum('DAILY','WEEKLY','MONTHLY','YEARLY') DEFAULT NULL,
  `recommendation` varchar(255) DEFAULT NULL,
  `recommendation_type` enum('DIABETIC_FOOT_CARE','DIABETIC_RETINOPATHY_SCREENING','DENTAL_SCREENING','FAMILY_SCREENING') DEFAULT NULL,
  `reported_date` date DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `patient` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKllb5qha263sepuh0vswmp4a4y` (`patient`),
  CONSTRAINT `FKllb5qha263sepuh0vswmp4a4y` FOREIGN KEY (`patient`) REFERENCES `tbl_patient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recommendation`
--

LOCK TABLES `tbl_recommendation` WRITE;
/*!40000 ALTER TABLE `tbl_recommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role` (
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES ('DATA'),('DOCTOR'),('USER');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_npn1wf1yu1g5rjohbek375pp1` (`email`),
  KEY `FK1qhctjsa2f8n948vp5wvvdlmy` (`role`),
  CONSTRAINT `FK1qhctjsa2f8n948vp5wvvdlmy` FOREIGN KEY (`role`) REFERENCES `tbl_role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (3,_binary '','system@pms.com','SYSTEM','USER','$2a$10$wzZijJ5rsuZ.mWmdQBgoluMVjuInvLL24LcbI5rIA/zO.ZFNd6HVy','USER'),(4,_binary '','admin@gmail.com','system','admin','$2a$10$RpGnSETvUNYZ1Dunb6e7Leq9TqTbK6RSgdjsGzj1.1Cu1TAfiHfrG','DATA'),(5,_binary '','patient@gmail.com','patient','patient','$2a$10$eLlv59XGtoQ3TABENWz6pOdd1BiezRFwbgCf.Hc8LLJeiYGIlGr0q','USER'),(6,_binary '','doctor@gmail.com','doctor','last','$2a$10$aaCdDFl908Zgwok6PxLrdOnAeP0WBHItzkbzO0SmvF.kgduXmdaHa','DOCTOR');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-01 22:16:37
