/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: HOTEL
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `MealPlanID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `CheckInDate` date NOT NULL,
  `CheckOutDate` date NOT NULL,
  `NumberOfGuests` int(11) NOT NULL CHECK (`NumberOfGuests` > 0),
  `FinalPrice` decimal(10,2) NOT NULL CHECK (`FinalPrice` >= 0),
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `RoomID` (`RoomID`),
  KEY `MealPlanID` (`MealPlanID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`MealPlanID`) REFERENCES `meal_plan` (`MealPlanID`),
  CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`CheckOutDate` > `CheckInDate`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES
(1,1,2,2,2,'2025-06-10','2025-06-12',2,9440.00),
(2,2,1,1,2,'2025-07-01','2025-07-03',1,5750.00),
(3,3,3,3,3,'2025-08-05','2025-08-08',3,12000.00),
(4,4,4,4,4,'2025-09-10','2025-09-12',2,9000.00),
(5,5,5,5,5,'2025-10-01','2025-10-05',3,24000.00),
(6,6,6,6,6,'2025-11-15','2025-11-18',2,21000.00),
(7,7,7,7,7,'2025-12-20','2025-12-25',4,40000.00),
(8,8,8,8,8,'2025-12-24','2025-12-26',1,8000.00),
(9,9,9,9,9,'2025-01-02','2025-01-04',2,9000.00),
(10,10,10,10,1,'2025-02-10','2025-02-12',4,10000.00);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL CHECK (trim(`Name`) <> '' and !(`Name` regexp '[0-9]')),
  `Phone` varchar(50) NOT NULL CHECK (`Phone` regexp '^09[0-9]{8}$' or `Phone` regexp '^(\\+8869|09)[0-9]{8}$' or `Phone` regexp '^\\+?[0-9\\-() ]{7,20}$'),
  `Email` varchar(255) NOT NULL CHECK (`Email` regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES
(1,'楊祐宇','0912345678','yuyu.yang@email.com'),
(2,'黃子峻','0922333444','tj.huang@email.com'),
(3,'陳彥福','0933222111','yff.chen@email.com'),
(4,'羅文鍵','0987654321','wj.luo@email.com'),
(5,'林小明','0911222333','ming.lin@email.com'),
(6,'王大華','0922111333','dh.wang@email.com'),
(7,'李美麗','0933444555','ml.li@email.com'),
(8,'張偉','0955666777','wei.chang@email.com'),
(9,'趙子龍','0966888999','zl.zhao@email.com'),
(10,'周杰倫','0977999888','jl.chou@email.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL CHECK (trim(`Name`) <> '' and !(`Name` regexp '[0-9]')),
  `Position` varchar(100) NOT NULL CHECK (trim(`Position`) <> ''),
  `Department` varchar(100) NOT NULL CHECK (trim(`Department`) <> ''),
  `HireDate` date NOT NULL,
  `Phone` varchar(50) NOT NULL CHECK (`Phone` regexp '^09[0-9]{8}$' or `Phone` regexp '^(\\+8869|09)[0-9]{8}$' or `Phone` regexp '^\\+?[0-9\\-() ]{7,20}$'),
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES
(1,'羅文鍵','餐廳經理','餐飲部','2023-08-01','0987654321',1),
(2,'陳彥福','前台接待員','客房部','2024-01-15','0911111111',1),
(3,'林小明','主廚','餐飲部','2022-03-01','0911222333',1),
(4,'王大華','廚房助理','餐飲部','2021-07-10','0922111333',1),
(5,'李美麗','房務員','客房部','2023-05-20','0933444555',1),
(6,'張偉','維修員','工程部','2020-11-30','0955666777',1),
(7,'趙子龍','餐廳服務員','餐飲部','2022-09-15','0966888999',1),
(8,'周杰倫','房務經理','客房部','2021-01-01','0977999888',1),
(9,'林志玲','櫃台人員','客房部','2024-02-01','0912345670',1),
(10,'王心凌','餐廳服務員','餐飲部','2023-07-01','0922333445',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_plan`
--

DROP TABLE IF EXISTS `meal_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_plan` (
  `MealPlanID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL CHECK (trim(`Name`) <> ''),
  `ExtraCharge` decimal(10,2) NOT NULL CHECK (`ExtraCharge` >= 0),
  PRIMARY KEY (`MealPlanID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_plan`
--

LOCK TABLES `meal_plan` WRITE;
/*!40000 ALTER TABLE `meal_plan` DISABLE KEYS */;
INSERT INTO `meal_plan` VALUES
(1,'僅住房',0.00),
(2,'自助早餐',350.00),
(3,'自助午餐',500.00),
(4,'自助晚餐',700.00),
(5,'全餐',1200.00),
(6,'兒童餐',200.00),
(7,'素食餐',400.00),
(8,'豪華套餐',1800.00),
(9,'節慶套餐',2200.00),
(10,'團體餐',1500.00);
/*!40000 ALTER TABLE `meal_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_plan_menu`
--

DROP TABLE IF EXISTS `meal_plan_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_plan_menu` (
  `MealPlanMenuID` int(11) NOT NULL AUTO_INCREMENT,
  `MealPlanID` int(11) NOT NULL,
  `MenuItemID` int(11) NOT NULL,
  PRIMARY KEY (`MealPlanMenuID`),
  UNIQUE KEY `MealPlanID` (`MealPlanID`,`MenuItemID`),
  KEY `MenuItemID` (`MenuItemID`),
  CONSTRAINT `meal_plan_menu_ibfk_1` FOREIGN KEY (`MealPlanID`) REFERENCES `meal_plan` (`MealPlanID`),
  CONSTRAINT `meal_plan_menu_ibfk_2` FOREIGN KEY (`MenuItemID`) REFERENCES `menu_item` (`MenuItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_plan_menu`
--

LOCK TABLES `meal_plan_menu` WRITE;
/*!40000 ALTER TABLE `meal_plan_menu` DISABLE KEYS */;
INSERT INTO `meal_plan_menu` VALUES
(1,2,1),
(2,2,2),
(3,2,3),
(4,3,4),
(5,3,5),
(6,4,6),
(7,5,7),
(8,6,8),
(9,7,9),
(10,8,10);
/*!40000 ALTER TABLE `meal_plan_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `MenuItemID` int(11) NOT NULL AUTO_INCREMENT,
  `RestaurantID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL CHECK (trim(`Name`) <> ''),
  `Category` varchar(100) NOT NULL CHECK (trim(`Category`) <> ''),
  `Price` decimal(10,2) NOT NULL CHECK (`Price` >= 0),
  PRIMARY KEY (`MenuItemID`),
  KEY `RestaurantID` (`RestaurantID`),
  CONSTRAINT `menu_item_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES
(1,1,'檸檬汁','飲品',80.00),
(2,1,'夸頌','烘焙坊',60.00),
(3,1,'巧克力卡拉雞腿堡','速食',60.00),
(4,1,'美味炒蛋','早餐熱食',150.00),
(5,1,'總匯三明治','輕食',220.00),
(6,1,'長崎素食沙拉','素食',280.00),
(7,2,'拿鐵咖啡','飲品',120.00),
(8,2,'鮮蝦沙拉','沙拉',180.00),
(9,3,'牛排','主餐',680.00),
(10,3,'法式吐司','早餐熱食',180.00);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `RestaurantID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL CHECK (trim(`Name`) <> ''),
  `DayOfWeek` varchar(50) NOT NULL CHECK (trim(`DayOfWeek`) <> ''),
  `OpenTime` time NOT NULL,
  `CloseTime` time NOT NULL,
  PRIMARY KEY (`RestaurantID`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`OpenTime` < `CloseTime`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES
(1,'雲苑廳','每日','07:00:00','22:00:00'),
(2,'星光咖啡館','每日','06:30:00','21:30:00'),
(3,'海景自助餐','每日','06:00:00','23:00:00'),
(4,'和風廳','每日','11:00:00','20:00:00'),
(5,'西餐廳','每日','07:30:00','21:00:00'),
(6,'宴會廳','每日','10:00:00','22:00:00'),
(7,'咖啡廳','每日','08:00:00','20:00:00'),
(8,'中餐廳','每日','11:00:00','21:00:00'),
(9,'素食廳','每日','11:30:00','19:30:00'),
(10,'燒烤餐廳','每日','17:00:00','23:00:00');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_employee`
--

DROP TABLE IF EXISTS `restaurant_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_employee` (
  `EmployeeID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`RestaurantID`),
  KEY `RestaurantID` (`RestaurantID`),
  CONSTRAINT `restaurant_employee_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `restaurant_employee_ibfk_2` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_employee`
--

LOCK TABLES `restaurant_employee` WRITE;
/*!40000 ALTER TABLE `restaurant_employee` DISABLE KEYS */;
INSERT INTO `restaurant_employee` VALUES
(1,1),
(2,1),
(6,1),
(7,1),
(8,1),
(3,2),
(9,2),
(4,3),
(10,3),
(5,4);
/*!40000 ALTER TABLE `restaurant_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomTypeID` int(11) NOT NULL,
  `RoomNumber` varchar(10) NOT NULL CHECK (trim(`RoomNumber`) <> ''),
  `RoomStatus` enum('待清潔','清潔中','正常','維修中') NOT NULL DEFAULT '正常',
  PRIMARY KEY (`RoomID`),
  KEY `RoomTypeID` (`RoomTypeID`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`RoomTypeID`) REFERENCES `room_type` (`RoomTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES
(1,1,'101','正常'),
(2,2,'205','正常'),
(3,1,'102','維修中'),
(4,3,'301','正常'),
(5,4,'402','待清潔'),
(6,5,'503','正常'),
(7,6,'604','清潔中'),
(8,7,'705','正常'),
(9,8,'801','正常'),
(10,9,'902','維修中');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_cleaning`
--

DROP TABLE IF EXISTS `room_cleaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_cleaning` (
  `CleaningID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `CleaningDate` datetime NOT NULL,
  `Notes` text DEFAULT NULL,
  PRIMARY KEY (`CleaningID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `room_cleaning_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `room_cleaning_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_cleaning`
--

LOCK TABLES `room_cleaning` WRITE;
/*!40000 ALTER TABLE `room_cleaning` DISABLE KEYS */;
INSERT INTO `room_cleaning` VALUES
(1,4,1,'2025-06-10 10:00:00','入住前清潔'),
(2,4,2,'2025-06-12 14:00:00','退房後清潔'),
(3,7,3,'2025-08-05 09:00:00','入住前清潔'),
(4,7,4,'2025-09-10 10:30:00','入住前清潔'),
(5,4,5,'2025-10-01 11:00:00','入住前清潔'),
(6,7,6,'2025-11-15 09:30:00','入住前清潔'),
(7,4,7,'2025-12-20 08:00:00','入住前清潔'),
(8,7,8,'2025-12-24 13:00:00','入住前清潔'),
(9,4,9,'2025-01-02 15:00:00','入住前清潔'),
(10,7,10,'2025-02-10 10:00:00','入住前清潔');
/*!40000 ALTER TABLE `room_cleaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_season_rate`
--

DROP TABLE IF EXISTS `room_season_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_season_rate` (
  `RoomTypeID` int(11) NOT NULL,
  `SeasonID` int(11) NOT NULL,
  `AdjustedPrice` decimal(10,2) NOT NULL CHECK (`AdjustedPrice` >= 0),
  PRIMARY KEY (`RoomTypeID`,`SeasonID`),
  KEY `SeasonID` (`SeasonID`),
  CONSTRAINT `room_season_rate_ibfk_1` FOREIGN KEY (`RoomTypeID`) REFERENCES `room_type` (`RoomTypeID`),
  CONSTRAINT `room_season_rate_ibfk_2` FOREIGN KEY (`SeasonID`) REFERENCES `season` (`SeasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_season_rate`
--

LOCK TABLES `room_season_rate` WRITE;
/*!40000 ALTER TABLE `room_season_rate` DISABLE KEYS */;
INSERT INTO `room_season_rate` VALUES
(1,1,4000.00),
(1,2,4000.00),
(1,3,2000.00),
(1,4,1800.00),
(2,1,4000.00),
(2,2,4000.00),
(2,3,2000.00),
(2,4,1800.00),
(3,1,6000.00),
(3,2,6000.00);
/*!40000 ALTER TABLE `room_season_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `RoomTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL CHECK (trim(`Name`) <> ''),
  `BedCount` int(11) NOT NULL CHECK (`BedCount` > 0),
  `BasePrice` decimal(10,2) NOT NULL CHECK (`BasePrice` >= 0),
  PRIMARY KEY (`RoomTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES
(1,'單人房',1,2000.00),
(2,'單床雙人房',1,2200.00),
(3,'雙床雙人房',2,2500.00),
(4,'雙床三人房',2,3000.00),
(5,'標準三人房',3,3500.00),
(6,'雙床四人房',2,4000.00),
(7,'四床四人房',4,4500.00),
(8,'豪華單人房',1,3000.00),
(9,'豪華雙人房',2,5000.00),
(10,'家庭房',4,5500.00);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `SeasonID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL CHECK (trim(`Name`) <> ''),
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `PriceAdjustmentPercent` decimal(5,2) NOT NULL CHECK (`PriceAdjustmentPercent` >= -100.00 and `PriceAdjustmentPercent` <= 500.00),
  PRIMARY KEY (`SeasonID`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`StartDate` <= `EndDate`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES
(1,'旺季(暑假)','2025-06-01','2025-08-31',100.00),
(2,'旺季(寒假)','2025-01-01','2025-03-31',100.00),
(3,'平時','2025-09-01','2025-12-31',0.00),
(4,'淡季','2025-04-01','2025-05-31',-20.00),
(5,'春節','2025-02-01','2025-02-10',150.00),
(6,'連假','2025-04-04','2025-04-07',80.00),
(7,'國慶','2025-10-10','2025-10-11',50.00),
(8,'聖誕','2025-12-24','2025-12-26',120.00),
(9,'跨年','2025-12-31','2026-01-01',200.00),
(10,'教師節','2025-09-28','2025-09-28',30.00);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-01 21:35:35
