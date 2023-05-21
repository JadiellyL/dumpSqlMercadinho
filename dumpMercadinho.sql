-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Mercadinho
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

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
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(10) DEFAULT NULL,
  `Sexo` varchar(4) DEFAULT NULL,
  `Rua` varchar(20) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Bairro` varchar(20) DEFAULT NULL,
  `Cidade` varchar(15) DEFAULT NULL,
  `Celular` varchar(11) DEFAULT NULL,
  `TelefoneFixo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES
('04438196370','Jadielly','Fem','13 B',60,'Industrial','Maracanau','85989252408','8531012147');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fornecedor`
--

DROP TABLE IF EXISTS `Fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fornecedor` (
  `cod_fornecedor` int(4) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(10) DEFAULT NULL,
  `Cidade` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cod_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedor`
--

LOCK TABLES `Fornecedor` WRITE;
/*!40000 ALTER TABLE `Fornecedor` DISABLE KEYS */;
INSERT INTO `Fornecedor` VALUES
(1,'Durametal','Marcanau'),
(2,'Nidobox','Fortaleza');
/*!40000 ALTER TABLE `Fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item_venda`
--

DROP TABLE IF EXISTS `Item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item_venda` (
  `codigo_itemvenda` int(11) NOT NULL AUTO_INCREMENT,
  `cod_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_itemvenda`),
  KEY `fk_proditemvenda` (`cod_produto`),
  CONSTRAINT `fk_proditemvenda` FOREIGN KEY (`cod_produto`) REFERENCES `Produto` (`cod_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item_venda`
--

LOCK TABLES `Item_venda` WRITE;
/*!40000 ALTER TABLE `Item_venda` DISABLE KEYS */;
INSERT INTO `Item_venda` VALUES
(1,1,5);
/*!40000 ALTER TABLE `Item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produto`
--

DROP TABLE IF EXISTS `Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produto` (
  `cod_produto` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(10) DEFAULT NULL,
  `Preco` double DEFAULT NULL,
  `cod_fornecedor` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_produto`),
  KEY `fk_prodForn` (`cod_fornecedor`),
  CONSTRAINT `fk_prodForn` FOREIGN KEY (`cod_fornecedor`) REFERENCES `Fornecedor` (`cod_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
INSERT INTO `Produto` VALUES
(1,'Arroz',4.99,2,100),
(2,'Treliça',4.99,1,55);
/*!40000 ALTER TABLE `Produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venda`
--

DROP TABLE IF EXISTS `Venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Venda` (
  `cod_venda` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_cliente` varchar(11) DEFAULT NULL,
  `cod_vendedor` int(11) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `cod_itemvenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_venda`),
  KEY `fk_vendaCliente` (`cpf_cliente`),
  KEY `fk_vendedorVenda` (`cod_vendedor`),
  KEY `fk_itemvendavenda` (`cod_itemvenda`),
  CONSTRAINT `fk_itemvendavenda` FOREIGN KEY (`cod_itemvenda`) REFERENCES `Item_venda` (`codigo_itemvenda`),
  CONSTRAINT `fk_vendaCliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `Cliente` (`CPF`),
  CONSTRAINT `fk_vendedorVenda` FOREIGN KEY (`cod_vendedor`) REFERENCES `Vendedor` (`Cod_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venda`
--

LOCK TABLES `Venda` WRITE;
/*!40000 ALTER TABLE `Venda` DISABLE KEYS */;
INSERT INTO `Venda` VALUES
(1,'04438196370',1,'2023-05-14',1);
/*!40000 ALTER TABLE `Venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendedor`
--

DROP TABLE IF EXISTS `Vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendedor` (
  `Cod_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(10) DEFAULT NULL,
  `Sexo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`Cod_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendedor`
--

LOCK TABLES `Vendedor` WRITE;
/*!40000 ALTER TABLE `Vendedor` DISABLE KEYS */;
INSERT INTO `Vendedor` VALUES
(1,'Jaqueline','fem'),
(2,'Josafa','masc');
/*!40000 ALTER TABLE `Vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 11:30:27
