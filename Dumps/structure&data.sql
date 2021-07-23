CREATE DATABASE  IF NOT EXISTS `OC_PIZZA` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `OC_PIZZA`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: OC_PIZZA
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idAddress` int NOT NULL,
  `streetNumber` int DEFAULT NULL,
  `streetName` varchar(100) DEFAULT NULL,
  `additionalAddress` varchar(100) DEFAULT NULL,
  `postalCode` int DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,17,'rue Coustou',NULL,75018,'Paris'),(2,46,'quai Amiral Hamelin',NULL,75011,'Paris'),(3,1970,'avenue Roger Salengros',NULL,31500,'Toulouse'),(4,4,'boulevard Ney',NULL,75008,'Paris'),(5,33,'avenue President Kennedy',NULL,31100,'Toulouse'),(6,82,'place de Clichy',NULL,75006,'Paris');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idCustomer` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Dupont','Jean Pierre',678987678,'jp.dupont@gmail.com','mdp123'),(2,'Wang','Jade',765434543,'wang.jade@icloud.com','mdp1234'),(3,'David','Simon',676545654,'david.simon@outlook.fr','mdp12345');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `idEmployee` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `restaurant_idRestaurant` int NOT NULL,
  PRIMARY KEY (`idEmployee`),
  KEY `fk_employee_restaurant1_idx` (`restaurant_idRestaurant`),
  CONSTRAINT `fk_employee_restaurant1` FOREIGN KEY (`restaurant_idRestaurant`) REFERENCES `restaurant` (`idRestaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Cesar','Jules',678767876,'jcesar@ocpizza.com','manager',1),(2,'Osaka','Naomie',678123456,'nosaka@ocpizza.com','pizzaiolo',2),(3,'Super','Mario',654534678,'mspuer@ocpizza.com','livreur',3),(4,'Laborde','Christine',789876543,'claborde@ocpizza.com','manager',2),(5,'Antonio','Daniella',654786324,'dantonio@ocpizza.com','pizzaiolo',3),(6,'Tournesol','Pierre',634567898,'ptournesol@ocpizza.com','livreur',1),(7,'Piscaso','Pascal',612321234,'ppiscaso@ocpizza.com','manger',3),(8,'Eiffel','Catherine',741846249,'ceiffel@ocpizza.com','pizzaiolo',1),(9,'Lucky','Lucie',734529876,'llucky@ocpizza.com','livreur',2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `idIngredient` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `pizza_idPizza` int NOT NULL,
  PRIMARY KEY (`idIngredient`),
  KEY `fk_ingredient_pizza1_idx` (`pizza_idPizza`),
  CONSTRAINT `fk_ingredient_pizza1` FOREIGN KEY (`pizza_idPizza`) REFERENCES `pizza` (`idPizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'sauce tomate',0.40,2),(2,'mozzarella',30.00,1),(3,'champignon de paris',2.80,3),(4,'parmesan',9.60,1),(5,'aubergine',2.30,3);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idOrder` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `paymentMethod` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `address_idAddress` int NOT NULL,
  `restaurant_idRestaurant` int NOT NULL,
  `customer_idCustomer` int NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_order_address1_idx` (`address_idAddress`),
  KEY `fk_order_restaurant1_idx` (`restaurant_idRestaurant`),
  KEY `fk_order_customer1_idx` (`customer_idCustomer`),
  CONSTRAINT `fk_order_address1` FOREIGN KEY (`address_idAddress`) REFERENCES `address` (`idAddress`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_idCustomer`) REFERENCES `customer` (`idCustomer`),
  CONSTRAINT `fk_order_restaurant1` FOREIGN KEY (`restaurant_idRestaurant`) REFERENCES `restaurant` (`idRestaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2021-01-10 00:00:00',24.00,'carte bleue','delivre',2,2,1),(2,'2021-01-11 00:00:00',38.50,'carte bleue','delivre',3,3,2),(3,'2021-01-12 00:00:00',12.00,'carte bleue','delivre',1,1,3);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `order_idOrder` int NOT NULL,
  `pizza_idPizza` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_idOrder`,`pizza_idPizza`),
  KEY `fk_order_has_pizza_pizza1_idx` (`pizza_idPizza`),
  KEY `fk_order_has_pizza_order1_idx` (`order_idOrder`),
  CONSTRAINT `fk_order_has_pizza_order1` FOREIGN KEY (`order_idOrder`) REFERENCES `order` (`idOrder`),
  CONSTRAINT `fk_order_has_pizza_pizza1` FOREIGN KEY (`pizza_idPizza`) REFERENCES `pizza` (`idPizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,1,2),(2,1,1),(2,2,1),(2,3,4);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `idPizza` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `reference` varchar(45) DEFAULT NULL,
  `descriptive` longtext,
  `recipe` longtext,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'Margherita','marg','Sauce tomate, mozzarella de bufflonne, parmesan reggiona, basili, huile d\'olive',NULL,12.00),(2,'Regina','regi','Sauce tomate, mozzarella de bufflonne, parmesan reggiona, basili, huile d\'olive, jambon',NULL,14.00),(3,'Vegetarien','vege','Sauce tomate, mozzarella de bufflonne, parmesan reggiona, basili, huile d\'olive, champinon, poivron',NULL,12.50);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `idRestaurant` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `isOpen` tinyint(1) DEFAULT NULL,
  `address_idAddress` int NOT NULL,
  PRIMARY KEY (`idRestaurant`),
  KEY `fk_restaurant_address_idx` (`address_idAddress`),
  CONSTRAINT `fk_restaurant_address` FOREIGN KEY (`address_idAddress`) REFERENCES `address` (`idAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'OC Pizza Paris',567898789,2,1),(2,'OC Pizza Toulouse',543212345,2,3),(3,'OC Pizza Paris II',512345678,2,4);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_line`
--

DROP TABLE IF EXISTS `stock_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_line` (
  `ingredient_idIngredient` int NOT NULL,
  `restaurant_idRestaurant` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`ingredient_idIngredient`,`restaurant_idRestaurant`),
  KEY `fk_ingredient_has_restaurant_restaurant1_idx` (`restaurant_idRestaurant`),
  KEY `fk_ingredient_has_restaurant_ingredient1_idx` (`ingredient_idIngredient`),
  CONSTRAINT `fk_ingredient_has_restaurant_ingredient1` FOREIGN KEY (`ingredient_idIngredient`) REFERENCES `ingredient` (`idIngredient`),
  CONSTRAINT `fk_ingredient_has_restaurant_restaurant1` FOREIGN KEY (`restaurant_idRestaurant`) REFERENCES `restaurant` (`idRestaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_line`
--

LOCK TABLES `stock_line` WRITE;
/*!40000 ALTER TABLE `stock_line` DISABLE KEYS */;
INSERT INTO `stock_line` VALUES (1,1,10),(2,1,6),(2,3,2),(3,1,1),(3,2,4);
/*!40000 ALTER TABLE `stock_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-22 11:37:52
