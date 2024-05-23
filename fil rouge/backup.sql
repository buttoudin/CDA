-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: filrouge
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
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `Id_Client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `adresseLivraison` varchar(50) DEFAULT NULL,
  `villeLivraison` varchar(50) DEFAULT NULL,
  `cpLivraison` int(11) DEFAULT NULL,
  `adresseFacturation` varchar(50) DEFAULT NULL,
  `cpFacturation` int(11) DEFAULT NULL,
  `villeFacturation` varchar(50) DEFAULT NULL,
  `commercial` varchar(50) DEFAULT NULL,
  `coefficientPrix` decimal(4,2) DEFAULT NULL,
  `reduction` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Id_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commande`
--

DROP TABLE IF EXISTS `Commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Commande` (
  `Id_Commande` int(11) NOT NULL AUTO_INCREMENT,
  `produit` varchar(50) DEFAULT NULL,
  `dateCommande` date DEFAULT NULL,
  `adresseLivrison` varchar(50) DEFAULT NULL,
  `villeLivraison` varchar(50) DEFAULT NULL,
  `cpLivraison` int(11) DEFAULT NULL,
  `adresseFacturation` varchar(50) DEFAULT NULL,
  `cpFacturation` int(11) DEFAULT NULL,
  `villeFacturation` varchar(50) DEFAULT NULL,
  `montantTotal` decimal(12,2) DEFAULT NULL,
  `etat` varchar(20) DEFAULT NULL,
  `modalitePaiement` varchar(30) DEFAULT NULL,
  `dateFacturation` date DEFAULT NULL,
  `datePaiement` date DEFAULT NULL,
  `referenceCommande` varchar(50) DEFAULT NULL,
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
/*!40000 ALTER TABLE `Commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fournisseur`
--

DROP TABLE IF EXISTS `Fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fournisseur` (
  `Id_Fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fournisseur`
--

LOCK TABLES `Fournisseur` WRITE;
/*!40000 ALTER TABLE `Fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produit`
--

DROP TABLE IF EXISTS `Produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produit` (
  `Id_Produit` int(11) NOT NULL AUTO_INCREMENT,
  `libelleCourt` varchar(50) DEFAULT NULL,
  `libelleLong` varchar(150) DEFAULT NULL,
  `referenceFournisseur` varchar(30) DEFAULT NULL,
  `Prix` decimal(12,2) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `Id_sousRubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_Produit`),
  KEY `Id_sousRubrique` (`Id_sousRubrique`),
  CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`Id_sousRubrique`) REFERENCES `sousRubrique` (`Id_sousRubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produit`
--

LOCK TABLES `Produit` WRITE;
/*!40000 ALTER TABLE `Produit` DISABLE KEYS */;
INSERT INTO `Produit` VALUES (1,'pantherophis/serpent des blés','Pantherophis est un genre de serpents non venimeux de la famille des Colubridae, comprenant plusieurs espèces populaires en captivité.',' FUR-7321-AZC',69.00,'pantherophis.jpg',1),(2,'lampropeltis/serpent rois/faux corail','Lampropeltis est un genre de serpents colubridés non venimeux, comprenant notamment les rois et les laitiers, souvent appréciés en captivité',' FUR-7321-AZC',120.00,'lampropeltis.jpg',1),(3,'python regius \"pastel clown\"','Python regius, connu sous le nom de python royal, est un serpent non venimeux, populaire en captivité pour ses couleurs et sa taille gérable.',' FUR-7321-AZC',120.00,'regius_1.jpg',2),(4,'python regius \"fire enchi piebald\"','Python regius, connu sous le nom de python royal, est un serpent non venimeux, populaire en captivité pour ses couleurs et sa taille gérable.',' FUR-7321-AZC',120.00,'regius_2.jpg',2),(5,'boa constrictor \"surinam\"','Le Boa constricteur est une espèce de serpents de la famille des Boidae. Les boas sont carnivores et se nourrissent de petits animaux',' FUR-7321-AZC',299.00,'boa_1.jpg',3),(6,'Eryx colubrinus-boa des sables ','Le Boa des sables fréquentes les zones arides et semi-arides, il mesure entre 40cm et 80cm et se nourrit de rongeurs et d\'oiseaux',' FUR-7321-AZC',149.00,'boa_2.jpg',3),(7,'Pogona vitticeps agame barbu','Ces lézards sont les plus sociables en captivité. Il se nourrit de végétaux et des petits animaux comme des invertébrés mais aussi des petits vertébré',' NIS-7321-GTR',95.00,'pogona_1.jpg',4),(8,'Pogona henrylawsoni','Le pogona henrylawsoni aussi appelé pogona nain vie dans les milieux ensoleillés se nourrit de petits invertébrés, il mesure moins de 30cm. ','NIS-7321-GTR',199.00,'pogona_2.jpg',4),(9,'Furcifer pardalis \"nosy mitsio\"','Furcifer pardalis est un caméléon originaire de Madagascar, connu pour sa grande variété de couleurs vives et son mode de vie arboricole.','FUR-5783-BLM',490.00,'cameleon_2.jpg',6),(10,'Chamaeleo calyptratus - caméléon panthère','Est un reptile originaire du Yémen et d\'Arabie saoudite, connu pour ses couleurs vives et son mode de vie arboricole.','FUR-5783-BLM',139.00,'cameleon_1.jpg',6),(11,'coorelophus ciliatus \"lilly white\"','Correlophus ciliatus, le gecko à crête, est un lézard originaire de Nouvelle-Calédonie, connu pour sa crête et ses couleurs vives.',' NIS-7321-GTR',199.00,'gecko_1.jpg',5),(12,'Eublepharis macularius \"blizzard eclipse\"','Eublepharis macularius, le léopard gecko, est un petit lézard nocturne populaire en captivité, originaire d\'Asie.',' NIS-7321-GTR',249.00,'gecko_2.jpg',5),(13,'Testudo hermanni boettgeri','Testudo hermanni boettgeri, la tortue d\'Hermann, est une sous-espèce de tortue terrestre, native d\'Europe, menacée par la perte d\'habitat.',' NIS-7321-GTR',249.00,'tortueTerre_1.jpg',7),(14,'Testudo marginata','Testudo marginata, la tortue grecque, reconnaissable par ses marges cornées sur la carapace.',' NIS-7321-GTR',449.00,'tortueTerre_2.jpg',7),(16,'Emydura subglobosa','Emydura subglobosa, la tortue de Murray, est une espèce aquatique originaire d\'Australie, appréciée pour sa carapace colorée.',' FUR-7321-AZC',69.00,'otrtue_aquatique.jpg',8);
/*!40000 ALTER TABLE `Produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonLivraison`
--

DROP TABLE IF EXISTS `bonLivraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonLivraison` (
  `Id_bonLivraison` int(11) NOT NULL AUTO_INCREMENT,
  `dateLivraison` date DEFAULT NULL,
  `transporteur` varchar(50) DEFAULT NULL,
  `url_suivi` varchar(50) DEFAULT NULL,
  `Id_Commande` int(11) NOT NULL,
  PRIMARY KEY (`Id_bonLivraison`),
  KEY `Id_Commande` (`Id_Commande`),
  CONSTRAINT `bonLivraison_ibfk_1` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonLivraison`
--

LOCK TABLES `bonLivraison` WRITE;
/*!40000 ALTER TABLE `bonLivraison` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonLivraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concerne`
--

DROP TABLE IF EXISTS `concerne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concerne` (
  `Id_Produit` int(11) NOT NULL,
  `Id_bonLivraison` int(11) NOT NULL,
  `Quantité` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Produit`,`Id_bonLivraison`),
  KEY `Id_bonLivraison` (`Id_bonLivraison`),
  CONSTRAINT `concerne_ibfk_1` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`),
  CONSTRAINT `concerne_ibfk_2` FOREIGN KEY (`Id_bonLivraison`) REFERENCES `bonLivraison` (`Id_bonLivraison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concerne`
--

LOCK TABLES `concerne` WRITE;
/*!40000 ALTER TABLE `concerne` DISABLE KEYS */;
/*!40000 ALTER TABLE `concerne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournit`
--

DROP TABLE IF EXISTS `fournit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournit` (
  `Id_Produit` int(11) NOT NULL,
  `Id_Fournisseur` int(11) NOT NULL,
  PRIMARY KEY (`Id_Produit`,`Id_Fournisseur`),
  KEY `Id_Fournisseur` (`Id_Fournisseur`),
  CONSTRAINT `fournit_ibfk_1` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`),
  CONSTRAINT `fournit_ibfk_2` FOREIGN KEY (`Id_Fournisseur`) REFERENCES `Fournisseur` (`Id_Fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournit`
--

LOCK TABLES `fournit` WRITE;
/*!40000 ALTER TABLE `fournit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fournit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recupére`
--

DROP TABLE IF EXISTS `recupére`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recupére` (
  `Id_Produit` int(11) NOT NULL,
  `Id_Commande` int(11) NOT NULL,
  `Quantité` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Produit`,`Id_Commande`),
  KEY `Id_Commande` (`Id_Commande`),
  CONSTRAINT `recupére_ibfk_1` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`),
  CONSTRAINT `recupére_ibfk_2` FOREIGN KEY (`Id_Commande`) REFERENCES `Commande` (`Id_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recupére`
--

LOCK TABLES `recupére` WRITE;
/*!40000 ALTER TABLE `recupére` DISABLE KEYS */;
/*!40000 ALTER TABLE `recupére` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubrique` (
  `Id_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `images` varchar(50) DEFAULT NULL,
  `libelle` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Id_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrique`
--

LOCK TABLES `rubrique` WRITE;
/*!40000 ALTER TABLE `rubrique` DISABLE KEYS */;
INSERT INTO `rubrique` VALUES (1,'serpent','serpent.jpeg','Animal reptilien caractérisé par un corps allongé'),(2,'lézards','lezard.jpeg','Les lézards sont des reptiles à quetre pattes, généralement dotés d\'une queue et de griffes'),(3,'tortue','tortue.jpeg','La tortue est un reptile caractérisé par sa carapace, son régime omnivore et son mode de vie aquatique ou terrestre');
/*!40000 ALTER TABLE `rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sousRubrique`
--

DROP TABLE IF EXISTS `sousRubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sousRubrique` (
  `Id_sousRubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `images` varchar(50) DEFAULT NULL,
  `libelle` varchar(150) DEFAULT NULL,
  `Id_rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_sousRubrique`),
  KEY `Id_rubrique` (`Id_rubrique`),
  CONSTRAINT `sousRubrique_ibfk_1` FOREIGN KEY (`Id_rubrique`) REFERENCES `rubrique` (`Id_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sousRubrique`
--

LOCK TABLES `sousRubrique` WRITE;
/*!40000 ALTER TABLE `sousRubrique` DISABLE KEYS */;
INSERT INTO `sousRubrique` VALUES (1,'couleuvre','couleuvre.jpeg','La couleuvre est un serpent non venimeux, se trouvant dans divers habitats et se nourrissant principalement de rongeurs et d\'amphibiens.',1),(2,'python','python.jpeg','Grand serpent constrictor non venimeux, souvent trouvé dans les régions tropicales. Les pythons se nourrissent principalement de proies entières.',1),(3,'boas','boas.jpeg','Serpents constricteurs robustes, habitant les régions tropicales, se caractérisant par leur taille imposante et leur mode de chasse.',1),(4,'pogona','pogona.jpeg','Le pogona, ou dragon barbu, est un lézard de compagnie populaire, originaire d\'Australie, caractérisé par ses barbes et ses couleurs vives.',2),(5,'geckos','geckos.jpeg','Les geckos sont des lézards souvent nocturnes, caractérisés par leurs yeux sans paupières et leurs capacités à grimper sur les surfaces lisses.',2),(6,'caméléons','caméléons.jpeg','Les caméléons sont des reptiles arboricoles célèbres pour leur capacité à changer de couleur et à projeter leur langue pour capturer leurs proies.',2),(7,'tortues terrestres','tortue_terre.jpeg','La tortue terrestre est un reptile à carapace qui vit principalement sur la terre ferme, se nourrissant d\'herbes, de fruits et de végétaux.',3),(8,'tortues aquatique','tortue_aquatique.jpeg','La tortue aquatique est un reptile adapté à la vie en eau, avec des membres palmés et une carapace, se nourrissant de poissons et de plantes.',3);
/*!40000 ALTER TABLE `sousRubrique` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-13 10:48:44
