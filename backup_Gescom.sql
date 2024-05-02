-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Gescom
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categories` (
  `Id_Categories` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(200) NOT NULL,
  `cat_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Categories`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Électronique',NULL),(2,'Téléphones',1),(3,'Ordinateurs',1);
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `Id_Customers` int(11) NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_address` varchar(150) NOT NULL,
  `cus_zipcode` varchar(5) DEFAULT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_mail` varchar(75) DEFAULT NULL,
  `cus_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Customers`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'\"1\"','\"Riviere\"','\"Romain\"','\"2301','\"80000\"','\"Amiens\"','\"risus.morbi@la'),(2,'\"2\"','\"Bailly\"','\"Lilou\"','\"Ap #','\"80300\"','\"Birmingham\"','\"sagittis.place'),(3,'\"3\"','\"Muller\"','\"Alexandre\"','\"P.O.',' 6931 Nulla. Rd.\"','\"80100\"','\"Abbeville\"'),(4,'\"4\"','\"Lefebvre\"','\"Élisa\"','\"Ap #',' Av.\"','\"62000\"','\"Arras\"'),(5,'\"5\"','\"Andre\"','\"Maëlle\"','\"Ap #','\"59133\"','\"Vieux-Genappe\"','\"aliquam.adipis'),(6,'\"6\"','\"Lemaire\"','\"Enzo\"','\"P.O.',' 895 Libero Avenue\"','\"31779\"','\"Sevastopol\"'),(7,'\"7\"','\"Perez\"','\"Bienvenue\"','\"Ap #',' Rd.\"','\"49960\"','\"Maastricht\"'),(8,'\"8\"','\"Dumont\"','\"Emma\"','\"299-','\"13011\"','\"Paternopoli\"','\"tristique.ac@S'),(9,'\"9\"','\"Riviere\"','\"Alice\"','\"P.O.',' 4502 Dictum St.\"','\"64066\"','\"Campbelltown\"'),(10,'\"10\"','\"Boucher\"','\"Noë\"','\"865-','\"75197\"','\"Fermont\"','\"facilisi.Sed.n'),(11,'\"11\"','\"Masson\"','\"Aaron\"','\"680-','\"68058\"','\"Renfrew\"','\"felis.Nulla@li'),(12,'\"12\"','\"Nazdorovie\"','\"Sergueï\"','\"592 ','\"51769\"','\"Vladivostok\"','\"serguei@nazdor'),(13,'\"13\"','\"Lemoine\"','\"Yasmine\"','\"9317','\"06190\"','\"Huntsville\"','\"dolor.sit.amet'),(14,'\"14\"','\"Lopez\"','\"Marion\"','\"292 ','\"47589\"','\"Kota\"','\"molestie.in@ac'),(15,'\"15\"','\"Blanchard\"','\"Émilie\"','\"Ap #','\"90846\"','\"Rodgau\"','\"consectetuer.a'),(16,'\"16\"','\"Philippe\"','\"Léonard\"','\"7315','\"70095\"','\"Matamata\"','\"sodales.elit.e'),(17,'\"17\"','\"Girard\"','\"Kimberley\"','\"P.O.',' 8937 Pretium Street\"','\"30481\"','\"Kamalia\"'),(18,'\"18\"','\"Morin\"','\"Élise\"','\"Ap #',' St.\"','\"27844\"','\"West Valley Ci'),(19,'\"19\"','\"Lefebvre\"','\"Zoé\"','\"677-','\"94571\"','\"Caruaru\"','\"Sed@odioAliqua'),(20,'\"20\"','\"Renault\"','\"Lilian\"','\"163 ','\"36652\"','\"La Unión\"','\"erat.semper@es'),(21,'\"21\"','\"Remy\"','\"Dimitri\"','\"Ap #','\"78009\"','\"Frigento\"','\"amet.dapibus.i'),(22,'\"22\"','\"Guillaume\"','\"Lena\"','\"1064','\"78387\"','\"Anchorage\"','\"varius.orci@fe'),(23,'\"23\"','\"Maillard\"','\"Charlotte\"','\"738 ','\"17914\"','\"Losino-Petrovsky\"','\"Maecenas.liber'),(24,'\"24\"','\"Albert\"','\"Diego\"','\"Ap #','\"83410\"','\"Trois-Rivières\"','\"aliquam@vestib'),(25,'\"25\"','\"Leclerc\"','\"Lauriane\"','\"Ap #','\"88100\"','\"Pékin\"','\"non@auctorveli'),(26,'\"26\"','\"Poirier\"','\"Paul\"','\"Ap #','\"42399\"','\"Flushing\"','\"lectus.sit@lig'),(27,'\"27\"','\"Hubert\"','\"Marianne\"','\"8 co','\"80090\"','\"Amiens\"','\"vitae.purus@cu'),(28,'\"28\"','\"Caron\"','\"Cédric\"','\"P.O.',' 5476 Mi Rd.\"','\"23735\"','\"Vanderhoof\"'),(29,'\"29\"','\"Fournier\"','\"Célia\"','\"P.O.',' 1701 Neque. Street\"','\"14711\"','\"Harrisburg\"'),(30,'\"30\"','\"Hubert\"','\"Corentin\"','\"Ap #',' St.\"','\"08762\"','\"Veldwezelt\"'),(31,'\"31\"','\"Dupont\"','\"Macéo\"','\"P.O.',' 927 Amet Ave\"','\"32275\"','\"Karachi\"'),(32,'\"32\"','\"Fabre\"','\"Maelys\"','\"P.O.',' 5390 Sit St.\"','\"04549\"','\"Francavilla Fo'),(33,'\"33\"','\"Henry\"','\"Florentin\"','\"4750','\"91323\"','\"Heusden-Zolder\"','\"a.sollicitudin'),(34,'\"34\"','\"Pons\"','\"Léonard\"','\"6857','\"52811\"','\"Antofagasta\"','\"lectus@aliquet'),(35,'\"35\"','\"Fleury\"','\"Solene\"','\"Ap #','\"55043\"','\"Olmué\"','\"mollis@lacinia'),(36,'\"36\"','\"Richard\"','\"Rémi\"','\"P.O.',' 2248 Ac Road\"','\"09509\"','\"Bilbo\"'),(37,'\"37\"','\"Blanc\"','\"Sarah\"','\"P.O.',' 8956 Ut',' Avenue\"','\"61210\"'),(38,'\"38\"','\"Evrard\"','\"Paul\"','\"P.O.',' 6072 Nullam St.\"','\"79346\"','\"Raiganj\"'),(39,'\"39\"','\"Legrand\"','\"Romane\"','\"P.O.',' 3645 Eu Rd.\"','\"41510\"','\"Vilvoorde\"'),(40,'\"40\"','\"Huet\"','\"Julien\"','\"285-',' Rd.\"','\"22174\"','\"Eschwege\"'),(41,'\"41\"','\"Dubois\"','\"Lamia\"','\"145-','\"86306\"','\"Valleyview\"','\"Pellentesque.h'),(42,'\"42\"','\"Carpentier\"','\"Maïwenn\"','\"P.O.',' 3727 Sem Road\"','\"77351\"','\"Farrukhabad-cu'),(43,'\"43\"','\"Perez\"','\"Florentin\"','\"2114','\"75209\"','\"Trivandrum\"','\"velit.justo.ne'),(44,'\"44\"','\"Dupont\"','\"Chaïma\"','\"P.O.',' 4207 Sociis Av.\"','\"78616\"','\"Romeral\"'),(45,'\"45\"','\"Schneider\"','\"Alice\"','\"548-','\"18591\"','\"Marburg\"','\"Aliquam.erat@e'),(46,'\"46\"','\"Gautier\"','\"Rose\"','\"P.O.',' 741 Integer Avenue\"','\"73604\"','\"Kartaly\"'),(47,'\"47\"','\"Guillot\"','\"Loevan\"','\"Ap #','\"54873\"','\"Gonnosfanadiga\"','\"cursus.in@ultr'),(48,'\"48\"','\"Lefevre\"','\"Clémence\"','\"476-',' Rd.\"','\"61563\"','\"Vöcklabruck\"'),(49,'\"49\"','\"Bouvier\"','\"Clara\"','\"P.O.',' 9786 Tellus Street\"','\"07517\"','\"Wilskerke\"'),(50,'\"50\"','\"Blanchard\"','\"Adam\"','\"P.O.',' 7958 Sem',' St.\"','\"82728\"'),(51,'\"51\"','\"Pikatchien\"','\"Jessica\"','\"92 r','\"22190\"','\"Plérin\"','\"jessica.pikatc'),(52,'\"52\"','\"Bailly\"','\"Léo\"','\"800-','\"50231\"','\"Widooie\"','\"ornare.lectus@'),(53,'\"53\"','\"Schneider\"','\"Florentin\"','\"P.O.',' 4940 Cursus Rd.\"','\"36508\"','\"Vaux-sur-Sure\"'),(54,'\"54\"','\"Caron\"','\"Martin\"','\"242-','\"51877\"','\"Tain\"','\"pharetra.sed@E'),(55,'\"55\"','\"David\"','\"Lutécia\"','\"665-','\"44664\"','\"Westkapelle\"','\"lorem@felispur'),(56,'\"56\"','\"Robert\"','\"Agathe\"','\"6737',' Road\"','\"05249\"','\"Sandy\"'),(57,'\"57\"','\"Rodriguez\"','\"Macéo\"','\"P.O.',' 2303 Vitae Street\"','\"57821\"','\"Suncheon\"'),(58,'\"58\"','\"Humbert\"','\"Élouan\"','\"P.O.',' 8712 Purus',' Av.\"','\"05252\"'),(59,'\"59\"','\"Charpentier\"','\"Lucie\"','\"9957','\"24752\"','\"Aschersleben\"','\"ac.nulla@ante.'),(60,'\"60\"','\"Colin\"','\"Yanis\"','\"804-','\"16829\"','\"Alness\"','\"sit.amet.orci@'),(61,'\"61\"','\"Robert\"','\"Élise\"','\"Ap #','\"09693\"','\"Rocky Mountain House\"','\"erat.nonummy.u'),(62,'\"62\"','\"Lucas\"','\"Laura\"','\"976-','\"58690\"','\"Alanya\"','\"vel.mauris@mas'),(63,'\"63\"','\"Laurent\"','\"Quentin\"','\"489-','\"65691\"','\"Fort Resolution\"','\"porttitor.inte'),(64,'\"64\"','\"Giraud\"','\"Kimberley\"','\"7411','\"51814\"','\"Stroud\"','\"nec@nectempus.'),(65,'\"65\"','\"Bailly\"','\"Julien\"','\"Ap #','\"82181\"','\"Laramie\"','\"Morbi@feugiatL'),(66,'\"66\"','\"Chevalier\"','\"Gaspard\"','\"8464','\"03869\"','\"Glain\"','\"elit.sed.conse'),(67,'\"67\"','\"Francois\"','\"Tatiana\"','\"Ap #','\"77822\"','\"Cap-de-la-Madeleine\"','\"dictum.mi.ac@a'),(68,'\"68\"','\"Mercier\"','\"Constant\"','\"Ap #','\"49458\"','\"Haut-Ittre\"','\"tellus.imperdi'),(69,'\"69\"','\"Gomez\"','\"Jérémy\"','\"70 a','\"80000\"','\"Amiens\"','\"lacus.Etiam@ni'),(70,'\"70\"','\"Leroy\"','\"Benjamin\"','\"P.O.',' 4157 Et',' Avenue\"','\"41799\"'),(71,'\"71\"','\"Rolland\"','\"Ethan\"','\"907-','\"32055\"','\"Enterprise\"','\"dolor.Fusce.mi'),(72,'\"72\"','\"Meunier\"','\"Margaux\"','\"P.O.',' 5531 In Rd.\"','\"39165\"','\"Glimes\"'),(73,'\"73\"','\"Roger\"','\"Thomas\"','\"P.O.',' 6494 Vel Avenue\"','\"06743\"','\"Fino Mornasco\"'),(74,'\"74\"','\"Renaud\"','\"Anaël\"','\"Ap #','\"45464\"','\"Westmount\"','\"eget@ipsumcurs'),(75,'\"75\"','\"Morin\"','\"Yüna\"','\"8089','\"07900\"','\"Shenkursk\"','\"Integer@lectus'),(76,'\"76\"','\"Joly\"','\"Eva\"','\"479-','\"42231\"','\"Bhimavaram\"','\"et.nunc.Quisqu'),(77,'\"77\"','\"Garnier\"','\"Anaël\"','\"4703',' Street\"','\"66625\"','\"Kobbegem\"'),(78,'\"78\"','\"Martinez\"','\"Lina\"','\"Ap #','\"46174\"','\"My\"','\"nisi.nibh.laci'),(79,'\"79\"','\"Le gall\"','\"Nathan\"','\"P.O.',' 625 Libero Rd.\"','\"40854\"','\"Ancaster Town\"'),(80,'\"80\"','\"Martinez\"','\"Fanny\"','\"Ap #','\"14981\"','\"Rodgau\"','\"tortor@mauriss'),(81,'\"81\"','\"Clement\"','\"Lucas\"','\"694-','\"92268\"','\"Branchon\"','\"luctus@vitaeor'),(82,'\"82\"','\"Marchal\"','\"Thomas\"','\"200-','\"11669\"','\"Saint-Honor�\"','\"magna.Praesent'),(83,'\"83\"','\"Rey\"','\"Alicia\"','\"P.O.',' 9603 Lorem Av.\"','\"75377\"','\"l\'Escaillre\"'),(84,'\"84\"','\"Rey\"','\"Jeanne\"','\"P.O.',' 3352 Vitae Avenue\"','\"81795\"','\"Olmué\"'),(85,'\"85\"','\"Bouvier\"','\"Léonie\"','\"116-','\"67639\"','\"Chieti\"','\"Duis.risus.odi'),(86,'\"86\"','\"Paul\"','\"Marwane\"','\"249-','\"70886\"','\"Wimmertingen\"','\"sociis.natoque'),(87,'\"87\"','\"Collin\"','\"Macéo\"','\"Ap #','\"04443\"','\"Terrance\"','\"per@pellentesq'),(88,'\"88\"','\"Maillard\"','\"Maelys\"','\"6013','\"88526\"','\"Huancayo\"','\"magnis@tristiq'),(89,'\"89\"','\"Maillard\"','\"Constant\"','\"Ap #','\"61695\"','\"Heidenheim\"','\"parturient.mon'),(90,'\"90\"','\"Daniel\"','\"Félix\"','\"Ap #',' Rd.\"','\"12706\"','\"Chimay\"'),(91,'\"91\"','\"Bon\"','\"Jean\"','\"30 r','\"80080\"','\"Amiens\"','\"adipiscing@gma'),(92,'\"92\"','\"Boulanger\"','\"Mathis\"','\"P.O.',' 7563 Id Avenue\"','\"92588\"','\"Bhatinda\"'),(93,'\"93\"','\"Boucher\"','\"Dorian\"','\"P.O.',' 7040 Venenatis Ave\"','\"82751\"','\"Jelenia Góra\"'),(94,'\"94\"','\"Bouvier\"','\"Marion\"','\"1071','\"38203\"','\"Limburg\"','\"Suspendisse.al'),(95,'\"95\"','\"Maillard\"','\"Pauline\"','\"4721','\"61225\"','\"Seilles\"','\"magna.Praesent'),(96,'\"96\"','\"Renaud\"','\"Rose\"','\"7837','\"67206\"','\"Fremantle\"','\"orci.in@ultric'),(97,'\"97\"','\"Robert\"','\"Maelys\"','\"P.O.',' 5911 Felis',' St.\"','\"06642\"'),(98,'\"98\"','\"Dupuis\"','\"Carla\"','\"Ap #','\"69142\"','\"Virginia Plage\"','\"nisi@neceuismo'),(99,'\"99\"','\"Meunier\"','\"Angelina\"','\"Ap #',' Ave\"','\"46591\"','\"Melle\"'),(100,'\"100\"','\"Philippe\"','\"Maïwenn\"','\"2585','\"53983\"','\"Lumaco\"','\"elit@Crassed.c');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `Id_Orders` int(11) NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_bill_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) NOT NULL,
  `Id_Customers` int(11) NOT NULL,
  PRIMARY KEY (`Id_Orders`),
  KEY `Id_Customers` (`Id_Customers`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`Id_Customers`) REFERENCES `Customers` (`Id_Customers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `Id_Products` int(11) NOT NULL AUTO_INCREMENT,
  `pro_ref` varchar(10) NOT NULL,
  `pro_name` varchar(200) NOT NULL,
  `pro_desc` text DEFAULT NULL,
  `pro_price` decimal(6,2) NOT NULL,
  `pro_stock` smallint(6) DEFAULT NULL,
  `pro_color` varchar(30) DEFAULT NULL,
  `pro_picture` varchar(40) DEFAULT NULL,
  `pro_add_date` date NOT NULL,
  `pro_update_date` datetime NOT NULL,
  `pro_publish` tinyint(4) NOT NULL,
  `Id_Suppliers` int(11) NOT NULL,
  `Id_Categories` int(11) NOT NULL,
  PRIMARY KEY (`Id_Products`),
  KEY `Id_Suppliers` (`Id_Suppliers`),
  KEY `Id_Categories` (`Id_Categories`),
  KEY `idx_pro_ref` (`pro_ref`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`Id_Suppliers`) REFERENCES `Suppliers` (`Id_Suppliers`),
  CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`Id_Categories`) REFERENCES `Categories` (`Id_Categories`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'TEL001','iPhone 12','Nouveau téléphone d\'Apple',999.99,100,'Noir','iphone12.jpg','2024-05-02','2024-05-02 11:53:11',1,1,3),(2,'TEL002','Samsung Galaxy S21','Dernier modèle de Samsung',899.99,150,'Bleu','galaxys21.jpg','2024-05-02','2024-05-02 11:53:11',1,1,3),(3,'TEL003','Google Pixel 5','Smartphone haut de gamme de Google',799.99,120,'Blanc','pix5.jpg','2024-05-02','2024-05-02 11:53:11',1,1,3),(4,'COM001','MacBook Pro','Ordinateur portable d\'Apple',1499.99,50,'Gris','macbookpro.jpg','2024-05-02','2024-05-02 11:53:11',1,1,3),(5,'COM002','Dell XPS 15','PC portable puissant de Dell',1299.99,80,'Noir','xps15.jpg','2024-05-02','2024-05-02 11:53:11',1,1,3),(6,'COM003','Lenovo ThinkPad X1 Carbon','PC portable léger et performant de Lenovo',1399.99,60,'Gris','thinkpad.jpg','2024-05-02','2024-05-02 11:53:11',1,1,3);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suppliers` (
  `Id_Suppliers` int(11) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) NOT NULL,
  `sup_city` varchar(50) NOT NULL,
  `sup_address` varchar(150) NOT NULL,
  `sup_mail` varchar(75) DEFAULT NULL,
  `sup_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id_Suppliers`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
INSERT INTO `Suppliers` VALUES (1,'Fournisseur A','Ville A','Adresse A','fournisseurA@example.com','123456789');
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `Id_details` int(11) NOT NULL AUTO_INCREMENT,
  `det_price` decimal(6,2) NOT NULL,
  `det_quantity` int(11) DEFAULT NULL,
  `Id_Products` int(11) NOT NULL,
  `Id_Orders` int(11) NOT NULL,
  PRIMARY KEY (`Id_details`),
  KEY `Id_Products` (`Id_Products`),
  KEY `Id_Orders` (`Id_Orders`),
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`Id_Products`) REFERENCES `Products` (`Id_Products`),
  CONSTRAINT `details_ibfk_2` FOREIGN KEY (`Id_Orders`) REFERENCES `Orders` (`Id_Orders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-02 13:56:47
