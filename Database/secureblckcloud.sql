
--
-- Table structure for table `registrations`
--
create database secureblckcloud;
use secureblckcloud;

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custname` varchar(100) NOT NULL,
  `loginid` varchar(100) NOT NULL,
  `pswd` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginid` (`loginid`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `loginid_2` (`loginid`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--


/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
INSERT INTO `registrations` VALUES (1,'alex','alex','Alex@141','9849098490','lx160cm@gmail.com','Hyderabad','#201, new Swarnalatha Estates','Hyderabad','Telangana','Activated'),(2,'meghana','meghana','Meghana@141','9704545452','allameghana141@gmail.com','Vijayawada','#201, New Orliano Streets','Vijayawada','Andhrapradesh','Activated'),(3,'sagar','sagar','Sagarbabu@141','9870045458','marrisagarbabu21@gmail.com','Godavarikhani','#548, New Streets','Godavarikhani','Hyderabad','Activated'),(4,'sreya','sreyachukka','Sreya@123','9133655204','sreyachukka@gmail.com','Hyderabad','lbnagar','hyderabad','telangana','Activated');
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;


DROP TABLE IF EXISTS `blockchain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blockchain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginuser` varchar(100) NOT NULL,
  `currenthash` varchar(1000) NOT NULL,
  `previoushash` varchar(1000) NOT NULL,
  `data` varchar(100) NOT NULL,
  `trnstimestamp` mediumtext,
  `nonce` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockchain`
--


/*!40000 ALTER TABLE `blockchain` DISABLE KEYS */;
INSERT INTO `blockchain` VALUES (1,'alex','0000009cbccfde528269a6bfa963e63976e23242d282d5afac999973347280a6','0','alex sending 180.0 to Azure Blockchain','1618209906886',2211717),(2,'alex','0000083ee02d1185390aa754fb3da6f9dcb580078e5114916fe1cca4a7bb9bf0','0000009cbccfde528269a6bfa963e63976e23242d282d5afac999973347280a6','alex sending 540.0 to AWS Blockchain','1618209995159',253881),(3,'alex','00000b467d2a8e45a133e4c8ff62f5bb90e6e950cf3617837c4b683ee83d41c3','0','alex sending 190.0 to Azure Blockchain','1618210158481',211718),(4,'sagar','00000fb7291a45d8f7f7e2895ae2ca0043259afbbdeebb006fb68338bf50f1b4','00000b467d2a8e45a133e4c8ff62f5bb90e6e950cf3617837c4b683ee83d41c3','sagar sending 150.0 to AWS Blockchain','1618210448768',398956),(5,'sagar','000008903391742dfd665ba7a8de2b286e21741959f40a8b238cde99ff73a825','0','sagar sending 540.0 to Azure Blockchain','1618212113204',331005);
/*!40000 ALTER TABLE `blockchain` ENABLE KEYS */;


DROP TABLE IF EXISTS `trnxdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trnxdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loginuser` varchar(100) NOT NULL,
  `fileid` int DEFAULT NULL,
  `nameoncard` varchar(100) NOT NULL,
  `price` float DEFAULT NULL,
  `cardnumber` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `cardexpiry` varchar(100) NOT NULL,
  `blkplatform` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fileid` (`fileid`,`loginuser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trnxdetails`
--


/*!40000 ALTER TABLE `trnxdetails` DISABLE KEYS */;
INSERT INTO `trnxdetails` VALUES (1,'alex',2,'Alex hales',180,'4582145260024570','785','2023-06','Azure Blockchain'),(2,'alex',4,'Alex hales',540,'1540789545208562','358','2023-06','AWS Blockchain'),(3,'alex',3,'Mounisha',190,'1450789545006321','254','2024-09','Azure Blockchain'),(4,'sagar',1,'Alex hales',150,'4582256180094512','542','2023-10','AWS Blockchain'),(6,'sagar',4,'Alex hales',540,'7895456214527856','254','2023-06','Azure Blockchain');
/*!40000 ALTER TABLE `trnxdetails` ENABLE KEYS */;

DROP TABLE IF EXISTS `cloudfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) NOT NULL,
  `filetype` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `filezie` mediumtext,
  `originalname` varchar(100) NOT NULL,
  `filedata` longblob,
  `cdate` date DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


