-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: localhost    Database: acme
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `body` text,
  `publish_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,3,'This is comment one','2024-08-16 10:25:12'),(2,2,1,'This is comment two','2024-08-16 10:25:12'),(3,5,3,'This is comment three','2024-08-16 10:25:12'),(4,2,4,'This is comment four','2024-08-16 10:25:12'),(5,1,2,'This is comment five','2024-08-16 10:25:12'),(6,3,1,'This is comment six','2024-08-16 10:25:12'),(7,3,2,'This is comment six','2024-08-16 10:25:12'),(8,5,4,'This is comment seven','2024-08-16 10:25:12'),(9,2,3,'This is comment seven','2024-08-16 10:25:12');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `body` text,
  `publish_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'Post One','This is post one','2024-08-14 22:16:23'),(2,3,'Post Two','This is post two','2024-08-14 22:16:23'),(3,1,'Post Three','This is post three','2024-08-14 22:16:23'),(4,2,'Post Four','This is post four','2024-08-14 22:16:23'),(5,5,'Post Five','This is post five','2024-08-14 22:16:23'),(6,4,'Post Six','This is post six','2024-08-14 22:16:23'),(7,2,'Post Seven','This is post seven','2024-08-14 22:16:23'),(8,1,'Post Eight','This is post eight','2024-08-14 22:16:23'),(9,3,'Post Nine','This is post none','2024-08-14 22:16:23'),(10,4,'Post Ten','This is post ten','2024-08-14 22:16:23'),(11,1,'Very New','Post, Post, Post, Post, Post','2024-08-16 16:50:40'),(12,1,'Second New Post','Second Second Second Second Second','2024-08-16 16:56:10'),(13,NULL,NULL,NULL,'2024-08-16 17:33:17'),(14,2,'3d post','asdfsdaf sadfsdaf','2024-08-16 18:45:57'),(15,2,'3d post','asdfsdaf sadfsdaf','2024-08-16 18:46:27'),(16,NULL,'3d post','asdfsdaf sadfsdaf','2024-08-16 18:58:20'),(17,NULL,'3d post','asdfsdaf sadfsdaf','2024-08-16 18:58:45');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `dept` varchar(75) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','john@gmail.com','123456','City','dev',1,'2024-08-13 20:41:14',20),(2,'Ivan','Jokavic','frddy@gmail.com','645553','CityCity','sales',0,'2024-08-13 20:43:01',3),(3,'Fred','Smith','fred@gmail.com','123456','New York','design',0,'2024-08-13 20:44:53',33),(4,'Sara','Watson','sara@gmail.com','123456','New York','design',0,'2024-08-13 20:44:53',NULL),(5,'Will','Jackson','will@yahoo.com','123456','Rhode Island','development',1,'2024-08-13 20:44:53',NULL),(7,'Tom','Spears','tom@yahoo.com','123456','Massachusetts','sales',0,'2024-08-13 20:44:53',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16 19:09:26
