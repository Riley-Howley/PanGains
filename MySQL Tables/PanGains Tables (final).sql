-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: pangains
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20220528141151_Init','6.0.3'),('20220601214413_update#1','6.0.3'),('20220603101315_AddAdminAccount','6.0.5'),('20220605151949_Removed-JWT','6.0.3'),('20220605152628_RemovedRequired','6.0.3'),('20220612082633_AddedChallenges','6.0.5'),('20220612084243_AddedChallenges','6.0.5'),('20220612090138_AddToLeaderboard','6.0.5');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `Firstname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Lastname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ProfilePicture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Private` tinyint(1) NOT NULL,
  `Notifications` tinyint(1) NOT NULL,
  `AverageChallengePos` int NOT NULL,
  `Type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MessageToken` longtext,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Jordan','Nolen','j.nolen@gmail.com','Personal Trainer','https://cdn.pixabay.com/photo/2021/07/28/18/47/sheep-6503001__340.jpg','Personal Trainer looking for Clients',1,1,1,'Standard','Account','IUfVfr6Zlko79VC6v4bx1w==','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiam9yZGFuLW5vbGVuIn0.wRXRzzrPXZ9ubv6j4ts_tOYNLSW2YQ667ysrBbSaAA4'),(2,'Taliyah','Bell','t.bell@gmail.com','Gym','https://cdn.fstoppers.com/styles/full/s3/media/2015/10/soft-light-natural-beauty-portrait.jpg','Tryna get wamp',1,0,54,'Standard','Account','ex2PEsH1kU088le9uIH20A==','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVGFsaXlhaC1iYXIifQ.d9vCZDiqdo7-0NLnkgqp8WWIF5UFV99xSLvf_X2T4-0'),(3,'Patrick','Rehman','p.cowie@gmail.com','Gym','https://www.w3schools.com/w3images/paris.jpg','Inspired by Abdul to get massive and huge arms. (huge = muscle)',0,1,34,'Standard','Account','ex2PEsH1kU088le9uIH20A==','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiUGF0cmljay1yZWhtYW4ifQ.YvbY5l7X1v5KLAf4KdMYuRjB_9EdSGMizmfSHbmnxOQ'),(4,'Rajan','Bradley','r.bradley@gmail.com','Gym','https://www.w3schools.com/w3images/paris.jpg','Just ya local gym junkie',0,1,78,'Standard','Account','ex2PEsH1kU088le9uIH20A==','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiUmFqYW4tYnJhZGxleSJ9.oc9gwyxW8LfzFUwFF0FGB04N_0GjcZ5zd1-AsggJ4Hg'),(5,'Aleah','Parra','a.parra@gmail.com','Health Care Pro','https://www.w3schools.com/w3images/team1.jpg','health is a lifestyle',0,1,567,'Premium','Account','ex2PEsH1kU088le9uIH20A==','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiQWxlYWgtcGFycmEifQ.eaxKTHLOAoqefkWrP5VEt6yW3JZFg1Gpd23BeYMKbkM'),(6,'Ryker','Weston','r.weston@gmail.com','Gym','https://www.w3schools.com/w3images/team2.jpg','ya boiiiii',1,1,54,'Standard','Account','ex2PEsH1kU088le9uIH20A==','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiUnlsZXItd2VzdG9uIn0.d1illLUCHZBzbmsPFNwpetpO9zJW_WeUwNsUhkjbzRk'),(7,'Demo','Demo','demo@gmail.com','Gym','https://www.howtopastel.com/wp-content/uploads/2017/05/Carol-Peebles-Demo-from-life-pastel-on-colourfix-paper-21-x-16-in.png','Trying to get Fit!',0,0,0,'Standard','Account','OUrfbamM7CFCjC3fx+j53w==','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiRGVtby1EZW1vIn0.iVVcwdMk38j7LlqLEpnym0ObEKXSepxw0DpVVoiR1_c');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminaccount`
--

DROP TABLE IF EXISTS `adminaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminaccount` (
  `AdminAccountID` int NOT NULL AUTO_INCREMENT,
  `Username` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`AdminAccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminaccount`
--

LOCK TABLES `adminaccount` WRITE;
/*!40000 ALTER TABLE `adminaccount` DISABLE KEYS */;
INSERT INTO `adminaccount` VALUES (1,'admin','123'),(2,'Theo','123'),(3,'Riley','123'),(4,'Ameil','123'),(5,'Kyle','123');
/*!40000 ALTER TABLE `adminaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges` (
  `ChallengesID` int NOT NULL AUTO_INCREMENT,
  `ChallengeName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ChallengesID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (1,'Pushups'),(2,'Situps'),(3,'Body Weight Squats'),(4,'Body Weight Dips'),(5,'Burpees'),(6,'Lunges');
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challengestats`
--

DROP TABLE IF EXISTS `challengestats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challengestats` (
  `ChallengeStatsID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `LeaderboardID` int NOT NULL,
  `ChallengeTotalReps` int NOT NULL,
  PRIMARY KEY (`ChallengeStatsID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challengestats`
--

LOCK TABLES `challengestats` WRITE;
/*!40000 ALTER TABLE `challengestats` DISABLE KEYS */;
INSERT INTO `challengestats` VALUES (1,1,1,25),(2,2,1,38),(3,3,1,56),(4,4,1,23),(5,5,1,23),(6,6,1,24),(11,1,2,22),(12,2,2,34),(13,3,2,52),(14,4,2,23),(15,5,2,67),(16,6,2,35),(21,1,3,65),(22,2,3,77),(23,3,3,33),(24,4,3,76),(25,5,3,65),(26,6,3,34),(27,7,3,86);
/*!40000 ALTER TABLE `challengestats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completedworkout`
--

DROP TABLE IF EXISTS `completedworkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completedworkout` (
  `CompletedWorkoutID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `RoutineID` int NOT NULL,
  `DateCompleted` longtext NOT NULL,
  `Duration` longtext NOT NULL,
  `TotalWeightLifted` double NOT NULL,
  PRIMARY KEY (`CompletedWorkoutID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completedworkout`
--

LOCK TABLES `completedworkout` WRITE;
/*!40000 ALTER TABLE `completedworkout` DISABLE KEYS */;
INSERT INTO `completedworkout` VALUES (1,1,1,'2022-05-03 00:00:00.000000','2',4867),(2,2,5,'2022-05-04 00:00:00.000000','1',2764),(3,3,9,'2022-05-05 00:00:00.000000','2',5633),(4,4,13,'2022-05-06 00:00:00.000000','4',14663),(5,5,17,'2022-05-07 00:00:00.000000','2',6235),(6,6,21,'2022-05-08 00:00:00.000000','1',5673),(86,1,1,'2022-06-30 23:22:56.538116','00:00:19.24',240),(93,7,46,'2022-06-30 23:44:00.119300','00:00:11.23',120),(94,7,1,'2022-06-30 23:44:45.756493','00:00:30.53',160),(96,7,46,'2022-06-30 23:49:08.808430','00:00:03.34',20);
/*!40000 ALTER TABLE `completedworkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daysworkedout`
--

DROP TABLE IF EXISTS `daysworkedout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daysworkedout` (
  `DaysWorkedOutID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `Day` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Hours` int NOT NULL,
  PRIMARY KEY (`DaysWorkedOutID`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daysworkedout`
--

LOCK TABLES `daysworkedout` WRITE;
/*!40000 ALTER TABLE `daysworkedout` DISABLE KEYS */;
INSERT INTO `daysworkedout` VALUES (1,1,'Mon',2),(2,1,'Tue',1),(3,1,'Wed',3),(4,1,'Thu',3),(5,1,'Fri',2),(6,1,'Sat',1),(7,1,'Sun',2),(8,2,'Mon',1),(9,2,'Tue',2),(10,2,'Wed',1),(11,2,'Thu',2),(12,2,'Fri',2),(13,2,'Sat',3),(14,2,'Sun',2),(15,3,'Mon',2),(16,3,'Tue',1),(17,3,'Wed',4),(18,3,'Thu',3),(19,3,'Fri',2),(20,3,'Sat',2),(21,3,'Sun',2),(22,4,'Mon',4),(23,4,'Tue',2),(24,4,'Wed',2),(25,4,'Thu',2),(26,4,'Fri',5),(27,4,'Sat',3),(28,4,'Sun',2),(29,5,'Mon',2),(30,5,'Tue',1),(31,5,'Wed',1),(32,5,'Thu',2),(33,5,'Fri',2),(34,5,'Sat',2),(35,5,'Sun',1),(36,6,'Mon',1),(37,6,'Tue',2),(38,6,'Wed',2),(39,6,'Thu',2),(40,6,'Fri',1),(41,6,'Sat',2),(42,6,'Sun',3),(43,7,'Mon',0),(44,7,'Tue',0),(45,7,'Wed',0),(46,7,'Thu',0),(47,7,'Fri',0),(48,7,'Sat',0),(49,7,'Sun',0),(50,7,'Mon',0),(51,7,'Tue',0),(52,7,'Wed',0),(53,7,'Thu',0),(54,7,'Fri',0),(55,7,'Sat',0),(56,7,'Sun',0),(57,7,'Mon',0),(58,7,'Tue',0),(59,7,'Wed',0),(60,7,'Thu',0),(61,7,'Fri',0),(62,7,'Sat',0),(63,7,'Sun',0);
/*!40000 ALTER TABLE `daysworkedout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise` (
  `ExerciseID` int NOT NULL AUTO_INCREMENT,
  `ExerciseName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ExerciseID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Lat Pulldown'),(2,'Dumbbell Row'),(3,'Shrug'),(4,'Pull Ups'),(5,'Seated Incline Curl'),(6,'Bicep Curl'),(7,'Face Pull'),(8,'Squat'),(9,'Leg Press'),(10,'Leg Extension'),(11,'Starjumps');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `FolderID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `FolderName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FolderLikes` int NOT NULL,
  PRIMARY KEY (`FolderID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,1,'workout 1',8),(2,2,'w1',7),(3,3,'yeee',7),(4,4,'fucken workout boi',8),(5,5,'folder 1',5),(6,6,'yo',5),(25,7,'Demo',0);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard` (
  `LeaderboardID` int NOT NULL AUTO_INCREMENT,
  `LeaderboardDate` datetime(6) NOT NULL,
  `TotalParticipants` int NOT NULL,
  `ChallengesID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`LeaderboardID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` VALUES (1,'2022-05-01 00:00:00.000000',10,1),(2,'2022-06-01 00:00:00.000000',10,4),(3,'2022-07-01 00:00:00.000000',10,2);
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine`
--

DROP TABLE IF EXISTS `routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routine` (
  `RoutineID` int NOT NULL AUTO_INCREMENT,
  `FolderID` int NOT NULL,
  `RoutineName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`RoutineID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine`
--

LOCK TABLES `routine` WRITE;
/*!40000 ALTER TABLE `routine` DISABLE KEYS */;
INSERT INTO `routine` VALUES (1,1,'bob'),(2,1,'is'),(3,2,'your uncle'),(4,2,'if you'),(5,3,'think im'),(6,3,'going'),(46,25,'Wednesday');
/*!40000 ALTER TABLE `routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set`
--

DROP TABLE IF EXISTS `set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `set` (
  `SetID` int NOT NULL AUTO_INCREMENT,
  `YourExerciseID` int NOT NULL,
  `SetRow` int NOT NULL,
  `SetType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Previous` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Kg` int NOT NULL,
  `Reps` int NOT NULL,
  PRIMARY KEY (`SetID`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set`
--

LOCK TABLES `set` WRITE;
/*!40000 ALTER TABLE `set` DISABLE KEYS */;
/*!40000 ALTER TABLE `set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social`
--

DROP TABLE IF EXISTS `social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social` (
  `SocialID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `FollowingID` int NOT NULL,
  PRIMARY KEY (`SocialID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social`
--

LOCK TABLES `social` WRITE;
/*!40000 ALTER TABLE `social` DISABLE KEYS */;
INSERT INTO `social` VALUES (1,1,2),(3,3,6),(4,3,7),(5,5,1),(6,6,1),(16,1,4);
/*!40000 ALTER TABLE `social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `StatisticsID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `TotalWorkouts` int NOT NULL,
  `AvgWorkoutTime` int NOT NULL,
  `TotalLifted` double NOT NULL,
  `AvgReps` int NOT NULL,
  `AvgSets` int NOT NULL,
  PRIMARY KEY (`StatisticsID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,1,128,3456,54203774,612,3),(2,2,153,4593,76432654,8,4),(3,3,43,5699,672543,20,2),(4,4,146,3563,6454343,10,4),(5,5,265,6699,5543543,8,3),(6,6,533,10243,5567657,10,3),(7,7,5,0,230,150,0),(8,7,0,0,0,0,0),(9,7,0,0,0,0,0);
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauth`
--

DROP TABLE IF EXISTS `userauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userauth` (
  `UserAuthID` int NOT NULL AUTO_INCREMENT,
  `Password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PasswordSalt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserAuthID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauth`
--

LOCK TABLES `userauth` WRITE;
/*!40000 ALTER TABLE `userauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `userauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourexercise`
--

DROP TABLE IF EXISTS `yourexercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yourexercise` (
  `YourExerciseID` int NOT NULL AUTO_INCREMENT,
  `RoutineID` int NOT NULL,
  `ExerciseID` int NOT NULL,
  PRIMARY KEY (`YourExerciseID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourexercise`
--

LOCK TABLES `yourexercise` WRITE;
/*!40000 ALTER TABLE `yourexercise` DISABLE KEYS */;
INSERT INTO `yourexercise` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,5),(6,3,6),(7,4,7),(8,4,8),(9,5,9),(10,5,10),(11,6,1),(12,6,2),(85,46,3);
/*!40000 ALTER TABLE `yourexercise` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-01 21:14:47
