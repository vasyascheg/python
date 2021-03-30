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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30 20:39:20
