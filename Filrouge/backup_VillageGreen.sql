-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: VillageGreen
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
-- Table structure for table `BonLivraison`
--

DROP TABLE IF EXISTS `BonLivraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BonLivraison` (
  `Id_BonLivraison` int(11) NOT NULL,
  `Date_livraison` date NOT NULL,
  `Statut` varchar(50) NOT NULL,
  `Suivi_commande` varchar(50) NOT NULL,
  `Id_Commande` int(11) NOT NULL,
  PRIMARY KEY (`Id_BonLivraison`),
  KEY `Id_Commande` (`Id_Commande`),
  CONSTRAINT `BonLivraison_ibfk_1` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BonLivraison`
--

LOCK TABLES `BonLivraison` WRITE;
/*!40000 ALTER TABLE `BonLivraison` DISABLE KEYS */;
INSERT INTO `BonLivraison` VALUES (3,'2024-05-03','En cours de préparation','9876543210',3),(4,'2024-05-04','En cours de préparation','',4);
/*!40000 ALTER TABLE `BonLivraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorie`
--

DROP TABLE IF EXISTS `Categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorie` (
  `Id_Catégorie` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle_court` varchar(50) NOT NULL,
  `Photo` blob DEFAULT NULL,
  PRIMARY KEY (`Id_Catégorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorie`
--

LOCK TABLES `Categorie` WRITE;
/*!40000 ALTER TABLE `Categorie` DISABLE KEYS */;
INSERT INTO `Categorie` VALUES (1,'Batteries',NULL),(2,'Accessoires',NULL);
/*!40000 ALTER TABLE `Categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `Id_Client` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Adresse_livraison` varchar(255) NOT NULL,
  `Adresse_facturation` varchar(255) NOT NULL,
  `Coefficient` decimal(15,2) NOT NULL,
  `Reduction` decimal(15,2) DEFAULT NULL,
  `Reference` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (3,'MusicAddict','Thomas','0234567890','Particulier','25 rue des Mélodies','25 rue des Factures',1.00,NULL,'MA001','thomas@musicaddict.com'),(4,'Symphony Corp.','Sophie','0678901234','Entreprise','10 avenue des Harmonies','10 avenue des Factures',1.50,0.20,'SC001','sophie@symphony.com');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commande`
--

DROP TABLE IF EXISTS `Commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commande` (
  `Id_Commande` int(11) NOT NULL,
  `Statut` varchar(50) NOT NULL,
  `Mode_paiement` varchar(50) NOT NULL,
  `Reduction_pro` decimal(15,2) DEFAULT NULL,
  `Total_HT` decimal(15,2) NOT NULL,
  `Total_TTC` decimal(15,2) NOT NULL,
  `Date_heure_commande` datetime NOT NULL,
  `Mode_differe` varchar(50) NOT NULL,
  `Date_facturation` date NOT NULL,
  `Id_Client` int(11) NOT NULL,
  PRIMARY KEY (`Id_Commande`),
  KEY `Id_Client` (`Id_Client`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `Client` (`Id_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commande`
--

LOCK TABLES `Commande` WRITE;
/*!40000 ALTER TABLE `Commande` DISABLE KEYS */;
INSERT INTO `Commande` VALUES (3,'En cours','Chèque',NULL,1500.00,1575.00,'2024-05-02 10:00:00','Différé','2024-05-03',3),(4,'En cours','Virement bancaire',0.15,3000.00,3300.00,'2024-05-02 11:30:00','Différé','2024-05-03',4);
/*!40000 ALTER TABLE `Commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commercial`
--

DROP TABLE IF EXISTS `Commercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commercial` (
  `Id_Commercial` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Id_Client` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Commercial`),
  KEY `Id_Client` (`Id_Client`),
  CONSTRAINT `Commercial_ibfk_1` FOREIGN KEY (`Id_Client`) REFERENCES `Client` (`Id_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commercial`
--

LOCK TABLES `Commercial` WRITE;
/*!40000 ALTER TABLE `Commercial` DISABLE KEYS */;
INSERT INTO `Commercial` VALUES (3,'Alex Parker','Alex','0456789012','alex@guitarworld.com',3),(4,'Emma White','Emma','0890123456','emma@pianouniverse.com',4);
/*!40000 ALTER TABLE `Commercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fournisseur`
--

DROP TABLE IF EXISTS `Fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fournisseur` (
  `Id_Fournisseur` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Contact` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fournisseur`
--

LOCK TABLES `Fournisseur` WRITE;
/*!40000 ALTER TABLE `Fournisseur` DISABLE KEYS */;
INSERT INTO `Fournisseur` VALUES (3,'Guitar World','Michael Johnson','0123456789'),(4,'Piano Universe','Sarah Lee','0987654321');
/*!40000 ALTER TABLE `Fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produit`
--

DROP TABLE IF EXISTS `Produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produit` (
  `Id_Produit` int(11) NOT NULL,
  `Libelle_court` varchar(100) NOT NULL,
  `Libelle_long` text NOT NULL,
  `Prix_achat_HT` decimal(15,2) NOT NULL,
  `Photo` blob DEFAULT NULL,
  `stock` decimal(15,2) DEFAULT NULL,
  `Actif` varchar(50) NOT NULL,
  `Id_Souscategorie` int(11) NOT NULL,
  `Id_Fournisseur` int(11) NOT NULL,
  PRIMARY KEY (`Id_Produit`),
  KEY `Id_Souscategorie` (`Id_Souscategorie`),
  KEY `Id_Fournisseur` (`Id_Fournisseur`),
  CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`Id_Souscategorie`) REFERENCES `Souscategorie` (`Id_Souscategorie`),
  CONSTRAINT `Produit_ibfk_2` FOREIGN KEY (`Id_Fournisseur`) REFERENCES `Fournisseur` (`Id_Fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produit`
--

LOCK TABLES `Produit` WRITE;
/*!40000 ALTER TABLE `Produit` DISABLE KEYS */;
INSERT INTO `Produit` VALUES (3,'Batterie Roland','Batterie électronique avec pads sensibles',1500.00,'',15.00,'Oui',1,3),(4,'Accordeur chromatique Korg','Accordeur polyvalent pour tous types d\'instruments',50.00,'',50.00,'Oui',2,4);
/*!40000 ALTER TABLE `Produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Souscategorie`
--

DROP TABLE IF EXISTS `Souscategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Souscategorie` (
  `Id_Souscategorie` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle_court` varchar(50) NOT NULL,
  `Photo` blob DEFAULT NULL,
  `Id_Catégorie` int(11) NOT NULL,
  PRIMARY KEY (`Id_Souscategorie`),
  KEY `Id_Catégorie` (`Id_Catégorie`),
  CONSTRAINT `Souscategorie_ibfk_1` FOREIGN KEY (`Id_Catégorie`) REFERENCES `Categorie` (`Id_Catégorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Souscategorie`
--

LOCK TABLES `Souscategorie` WRITE;
/*!40000 ALTER TABLE `Souscategorie` DISABLE KEYS */;
INSERT INTO `Souscategorie` VALUES (1,'Batteries électroniques',NULL,1),(2,'Accordeurs',NULL,2);
/*!40000 ALTER TABLE `Souscategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achete`
--

DROP TABLE IF EXISTS `achete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achete` (
  `Id_Produit` int(11) NOT NULL,
  `Id_Commande` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`Id_Produit`,`Id_Commande`),
  KEY `Id_Commande` (`Id_Commande`),
  CONSTRAINT `achete_ibfk_1` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`),
  CONSTRAINT `achete_ibfk_2` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achete`
--

LOCK TABLES `achete` WRITE;
/*!40000 ALTER TABLE `achete` DISABLE KEYS */;
INSERT INTO `achete` VALUES (3,3,1),(4,4,2);
/*!40000 ALTER TABLE `achete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livre`
--

DROP TABLE IF EXISTS `livre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livre` (
  `Id_Produit` int(11) NOT NULL,
  `Id_BonLivraison` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`Id_Produit`,`Id_BonLivraison`),
  KEY `Id_BonLivraison` (`Id_BonLivraison`),
  CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`),
  CONSTRAINT `livre_ibfk_2` FOREIGN KEY (`Id_BonLivraison`) REFERENCES `BonLivraison` (`Id_BonLivraison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livre`
--

LOCK TABLES `livre` WRITE;
/*!40000 ALTER TABLE `livre` DISABLE KEYS */;
INSERT INTO `livre` VALUES (3,3,1),(4,4,2);
/*!40000 ALTER TABLE `livre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-02 13:52:05
