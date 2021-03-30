-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_1091
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `Home_phone`
--

DROP TABLE IF EXISTS `Home_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Home_phone` (
  `Home_phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `Paired` set('да','нет') NOT NULL DEFAULT 'нет',
  `Phone_id` int(11) NOT NULL,
  PRIMARY KEY (`Home_phone_id`),
  KEY `Phone_id` (`Phone_id`),
  CONSTRAINT `Home_phone_ibfk_1` FOREIGN KEY (`Phone_id`) REFERENCES `Phone` (`Phone_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Home_phone`
--

LOCK TABLES `Home_phone` WRITE;
/*!40000 ALTER TABLE `Home_phone` DISABLE KEYS */;
INSERT INTO `Home_phone` VALUES (2,'нет',5);
/*!40000 ALTER TABLE `Home_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mobile_phone`
--

DROP TABLE IF EXISTS `Mobile_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mobile_phone` (
  `Mobile_phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `Paid` set('да','нет') NOT NULL DEFAULT 'нет',
  `Phone_id` int(11) NOT NULL,
  PRIMARY KEY (`Mobile_phone_id`),
  KEY `Phone_id` (`Phone_id`),
  CONSTRAINT `Mobile_phone_ibfk_1` FOREIGN KEY (`Phone_id`) REFERENCES `Phone` (`Phone_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mobile_phone`
--

LOCK TABLES `Mobile_phone` WRITE;
/*!40000 ALTER TABLE `Mobile_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mobile_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mobile_phoneOrganization`
--

DROP TABLE IF EXISTS `Mobile_phoneOrganization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mobile_phoneOrganization` (
  `Mobile_phone_id` int(11) NOT NULL,
  `Organization_id` int(11) NOT NULL,
  PRIMARY KEY (`Mobile_phone_id`,`Organization_id`) USING BTREE,
  KEY `Organization_id` (`Organization_id`),
  CONSTRAINT `Mobile_phoneOrganization_ibfk_1` FOREIGN KEY (`Mobile_phone_id`) REFERENCES `Mobile_phone` (`Mobile_phone_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Mobile_phoneOrganization_ibfk_2` FOREIGN KEY (`Organization_id`) REFERENCES `Organization` (`Organization_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mobile_phoneOrganization`
--

LOCK TABLES `Mobile_phoneOrganization` WRITE;
/*!40000 ALTER TABLE `Mobile_phoneOrganization` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mobile_phoneOrganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organization` (
  `Organization_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  PRIMARY KEY (`Organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` text NOT NULL,
  `name` text NOT NULL,
  `Middle` text NOT NULL,
  `Address` text NOT NULL,
  `Home_phone_id` int(11) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `Home_phone_id` (`Home_phone_id`),
  CONSTRAINT `Person_ibfk_1` FOREIGN KEY (`Home_phone_id`) REFERENCES `Home_phone` (`Home_phone_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phone`
--

DROP TABLE IF EXISTS `Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Phone` (
  `Phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `Country_code` varchar(5) NOT NULL,
  `Area _code` varchar(5) NOT NULL,
  `Number` varchar(9) NOT NULL,
  PRIMARY KEY (`Phone_id`),
  UNIQUE KEY `Number` (`Number`,`Country_code`,`Area _code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phone`
--

LOCK TABLES `Phone` WRITE;
/*!40000 ALTER TABLE `Phone` DISABLE KEYS */;
INSERT INTO `Phone` VALUES (5,'+7','499','1112200'),(11,'+7','491','445530'),(10,'+7','495','445530'),(9,'+7','499','445530'),(7,'+7','499','445531'),(6,'+7','499','445535');
/*!40000 ALTER TABLE `Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Working_phone`
--

DROP TABLE IF EXISTS `Working_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Working_phone` (
  `Working_phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `Begin` time NOT NULL,
  `End` time NOT NULL,
  `Add_number` varchar(9) NOT NULL,
  `Phone_id` int(11) NOT NULL,
  PRIMARY KEY (`Working_phone_id`),
  KEY `Phone_id` (`Phone_id`),
  CONSTRAINT `Working_phone_ibfk_1` FOREIGN KEY (`Phone_id`) REFERENCES `Phone` (`Phone_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Working_phone`
--

LOCK TABLES `Working_phone` WRITE;
/*!40000 ALTER TABLE `Working_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Working_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Working_phoneOrganization`
--

DROP TABLE IF EXISTS `Working_phoneOrganization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Working_phoneOrganization` (
  `Working_phone_id` int(11) NOT NULL,
  `Organization_id` int(11) NOT NULL,
  PRIMARY KEY (`Working_phone_id`,`Organization_id`) USING BTREE,
  KEY `Organization_id` (`Organization_id`),
  CONSTRAINT `Working_phoneOrganization_ibfk_1` FOREIGN KEY (`Working_phone_id`) REFERENCES `Working_phone` (`Working_phone_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Working_phoneOrganization_ibfk_2` FOREIGN KEY (`Organization_id`) REFERENCES `Organization` (`Organization_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Working_phoneOrganization`
--

LOCK TABLES `Working_phoneOrganization` WRITE;
/*!40000 ALTER TABLE `Working_phoneOrganization` DISABLE KEYS */;
/*!40000 ALTER TABLE `Working_phoneOrganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `turnir_id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `place` varchar(256) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`turnir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_number`
--

DROP TABLE IF EXISTS `car_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_number` (
  `car_number` int(12) NOT NULL,
  PRIMARY KEY (`car_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_number`
--

LOCK TABLES `car_number` WRITE;
/*!40000 ALTER TABLE `car_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`country_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Херовая');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_turn`
--

DROP TABLE IF EXISTS `country_turn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_turn` (
  `turn_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`turn_id`,`country_id`),
  CONSTRAINT `country_turn_ibfk_1` FOREIGN KEY (`turn_id`) REFERENCES `calendar` (`turnir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_turn`
--

LOCK TABLES `country_turn` WRITE;
/*!40000 ALTER TABLE `country_turn` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_turn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_films`
--

DROP TABLE IF EXISTS `exam_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `production_year` year(4) NOT NULL,
  `country` varchar(25) NOT NULL,
  `director` varchar(25) NOT NULL,
  `screenwriter` varchar(25) NOT NULL,
  `actors` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_films`
--

LOCK TABLES `exam_films` WRITE;
/*!40000 ALTER TABLE `exam_films` DISABLE KEYS */;
INSERT INTO `exam_films` VALUES (12,'Бегущий по лезвию','апроладаорпарол',1996,'Америка','Василиса','Василиса','Василиса',40),(14,'qww','err',1923,'Россия','aaa','aaa','aaa, ererr',180);
/*!40000 ALTER TABLE `exam_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_films_genres`
--

DROP TABLE IF EXISTS `exam_films_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_films_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `film_id` (`film_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `exam_films_genres_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `exam_films` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_films_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `exam_genres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_films_genres`
--

LOCK TABLES `exam_films_genres` WRITE;
/*!40000 ALTER TABLE `exam_films_genres` DISABLE KEYS */;
INSERT INTO `exam_films_genres` VALUES (12,12,8);
/*!40000 ALTER TABLE `exam_films_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_genres`
--

DROP TABLE IF EXISTS `exam_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_genres`
--

LOCK TABLES `exam_genres` WRITE;
/*!40000 ALTER TABLE `exam_genres` DISABLE KEYS */;
INSERT INTO `exam_genres` VALUES (8,'хоррор');
/*!40000 ALTER TABLE `exam_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_reviews`
--

DROP TABLE IF EXISTS `exam_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `film_id` (`film_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `exam_reviews_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `exam_films` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_reviews_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `exam_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_reviews`
--

LOCK TABLES `exam_reviews` WRITE;
/*!40000 ALTER TABLE `exam_reviews` DISABLE KEYS */;
INSERT INTO `exam_reviews` VALUES (6,12,6,5,'супер','2021-03-30 14:34:29'),(7,14,6,5,'щшгнрепка','2021-03-30 17:07:29');
/*!40000 ALTER TABLE `exam_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_roles`
--

DROP TABLE IF EXISTS `exam_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_roles`
--

LOCK TABLES `exam_roles` WRITE;
/*!40000 ALTER TABLE `exam_roles` DISABLE KEYS */;
INSERT INTO `exam_roles` VALUES (4,'Администратор','Обладает всеми правами'),(5,'Пользователь','Может просматривать фильмы и добавлять комментарии'),(6,'Модератор','Может просматривать и редактировать фильмы');
/*!40000 ALTER TABLE `exam_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_users`
--

DROP TABLE IF EXISTS `exam_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `password_hash` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `exam_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `exam_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_users`
--

LOCK TABLES `exam_users` WRITE;
/*!40000 ALTER TABLE `exam_users` DISABLE KEYS */;
INSERT INTO `exam_users` VALUES (6,'user','Щеголькова','Василиса','Васильевна','65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5','2021-03-30 12:52:20',4),(7,'user1','Васильева','Василиса','Васильевна','65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5','2021-03-30 17:29:24',5),(8,'user2','Иванов','Иван','Иванович','65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5','2021-03-30 17:30:46',6);
/*!40000 ALTER TABLE `exam_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_racer`
--

DROP TABLE IF EXISTS `first_racer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `first_racer` (
  `rider_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `car_number` int(11) NOT NULL,
  PRIMARY KEY (`rider_id`,`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_racer`
--

LOCK TABLES `first_racer` WRITE;
/*!40000 ALTER TABLE `first_racer` DISABLE KEYS */;
/*!40000 ALTER TABLE `first_racer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racers`
--

DROP TABLE IF EXISTS `racers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racers` (
  `racer_id` int(11) NOT NULL,
  `last_name` int(11) NOT NULL,
  `birthday` int(11) DEFAULT NULL,
  `number_of_wins` int(11) DEFAULT NULL,
  `first_name` text,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`racer_id`),
  CONSTRAINT `racers_ibfk_1` FOREIGN KEY (`racer_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racers`
--

LOCK TABLES `racers` WRITE;
/*!40000 ALTER TABLE `racers` DISABLE KEYS */;
/*!40000 ALTER TABLE `racers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `result_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `place` varchar(256) DEFAULT NULL,
  `circles_of_win` int(11) DEFAULT NULL,
  `fail` int(11) NOT NULL,
  `id_racer` int(11) NOT NULL,
  `turnir_id` int(11) NOT NULL,
  PRIMARY KEY (`id_racer`,`turnir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор',NULL),(2,'Пользователь',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `second_racer`
--

DROP TABLE IF EXISTS `second_racer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `second_racer` (
  `rider_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `car_number` int(11) NOT NULL,
  PRIMARY KEY (`rider_id`,`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `second_racer`
--

LOCK TABLES `second_racer` WRITE;
/*!40000 ALTER TABLE `second_racer` DISABLE KEYS */;
/*!40000 ALTER TABLE `second_racer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spare_racer`
--

DROP TABLE IF EXISTS `spare_racer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spare_racer` (
  `rider_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`rider_id`,`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_racer`
--

LOCK TABLES `spare_racer` WRITE;
/*!40000 ALTER TABLE `spare_racer` DISABLE KEYS */;
/*!40000 ALTER TABLE `spare_racer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `motor` varchar(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_in_turn`
--

DROP TABLE IF EXISTS `team_in_turn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_in_turn` (
  `turnir_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  PRIMARY KEY (`turnir_id`,`team_id`,`record_id`),
  CONSTRAINT `team_in_turn_ibfk_1` FOREIGN KEY (`turnir_id`) REFERENCES `calendar` (`turnir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_in_turn`
--

LOCK TABLES `team_in_turn` WRITE;
/*!40000 ALTER TABLE `team_in_turn` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_in_turn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `password_hash` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','Ivanov','Ivan','Ivanovich','65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5','2021-01-22 02:55:24',2),(2,'admin','Щеголькова','Василиса','Васильевна','*AA1420F182E88B9E5F874F6FBE7459291E8F4601','2021-01-22 03:09:28',1),(3,'qq','Петров','Петр','Петрович','65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5','2021-01-27 04:47:16',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_logs`
--

DROP TABLE IF EXISTS `visit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `visit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_logs`
--

LOCK TABLES `visit_logs` WRITE;
/*!40000 ALTER TABLE `visit_logs` DISABLE KEYS */;
INSERT INTO `visit_logs` VALUES (1,'/',1,'2021-03-29 21:01:41'),(2,'/users',1,'2021-03-29 21:01:46'),(3,'/visits/logs',1,'2021-03-29 21:01:49'),(4,'/',1,'2021-03-29 21:01:59'),(5,'/',1,'2021-03-29 21:03:24'),(6,'/users',1,'2021-03-29 21:03:28'),(7,'/visits/logs',1,'2021-03-29 21:03:30'),(8,'/users/1',1,'2021-03-29 21:03:37'),(9,'/visits/logs',1,'2021-03-29 21:03:41'),(10,'/visits/logs',1,'2021-03-29 21:03:47'),(11,'/visits/stat/pages',1,'2021-03-29 21:03:54'),(12,'/visits/stat/users',1,'2021-03-29 21:03:56'),(13,'/',1,'2021-03-29 21:04:03'),(14,'/users',1,'2021-03-29 21:04:07'),(15,'/visits/logs',1,'2021-03-29 21:04:09'),(16,'/visits/logs',1,'2021-03-29 21:05:43'),(17,'/',1,'2021-03-29 21:05:45'),(18,'/',NULL,'2021-03-29 21:13:09'),(19,'/static/styles.css',NULL,'2021-03-29 21:13:09'),(20,'/static/main.js',NULL,'2021-03-29 21:13:09'),(21,'/favicon.ico',NULL,'2021-03-29 21:13:10'),(22,'/users',NULL,'2021-03-29 21:13:14'),(23,'/static/styles.css',NULL,'2021-03-29 21:13:14'),(24,'/static/main.js',NULL,'2021-03-29 21:13:14'),(25,'/visits/logs',NULL,'2021-03-29 21:13:16'),(26,'/static/styles.css',NULL,'2021-03-29 21:13:17'),(27,'/static/main.js',NULL,'2021-03-29 21:13:17'),(28,'/visits/stat/pages',NULL,'2021-03-29 21:13:33'),(29,'/static/styles.css',NULL,'2021-03-29 21:13:33'),(30,'/static/main.js',NULL,'2021-03-29 21:13:33'),(31,'/visits/stat/users',NULL,'2021-03-29 21:13:35'),(32,'/static/styles.css',NULL,'2021-03-29 21:13:36'),(33,'/static/main.js',NULL,'2021-03-29 21:13:36'),(34,'/',NULL,'2021-03-29 21:13:53'),(35,'/static/main.js',NULL,'2021-03-29 21:13:53'),(36,'/static/styles.css',NULL,'2021-03-29 21:13:53'),(37,'/users',NULL,'2021-03-29 21:13:56'),(38,'/static/styles.css',NULL,'2021-03-29 21:13:57'),(39,'/static/main.js',NULL,'2021-03-29 21:13:57'),(40,'/visits/logs',NULL,'2021-03-29 21:13:58'),(41,'/static/styles.css',NULL,'2021-03-29 21:13:59'),(42,'/static/main.js',NULL,'2021-03-29 21:13:59'),(43,'/visits/logs',NULL,'2021-03-29 21:14:04'),(44,'/static/styles.css',NULL,'2021-03-29 21:14:04'),(45,'/static/main.js',NULL,'2021-03-29 21:14:04'),(46,'/',NULL,'2021-03-29 21:48:25'),(47,'/static/styles.css',NULL,'2021-03-29 21:48:26'),(48,'/static/main.js',NULL,'2021-03-29 21:48:26'),(49,'/static/styles.css',NULL,'2021-03-29 23:53:05'),(50,'/static/main.js',NULL,'2021-03-29 23:53:05'),(51,'/visits/logs',NULL,'2021-03-29 23:53:11'),(52,'/static/main.js',NULL,'2021-03-29 23:53:11'),(53,'/static/styles.css',NULL,'2021-03-29 23:53:11');
/*!40000 ALTER TABLE `visit_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30 20:40:04
