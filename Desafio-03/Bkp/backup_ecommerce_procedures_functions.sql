-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL,
  `Pessoa_idPessoa` int NOT NULL,
  PRIMARY KEY (`idCliente`,`Pessoa_idPessoa`),
  KEY `fk_Cliente_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Cliente_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1),(2,3),(3,5),(4,7),(5,8),(6,10),(21,21);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilizando_um_produto`
--

DROP TABLE IF EXISTS `disponibilizando_um_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilizando_um_produto` (
  `Produto_idProduto` int NOT NULL,
  `Fornecedor_idFornecedor1` int NOT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Fornecedor_idFornecedor1`),
  KEY `fk_Disponibilizando_um_produto_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Disponibilizando_um_produto_Fornecedor1_idx` (`Fornecedor_idFornecedor1`),
  CONSTRAINT `fk_Disponibilizando_um_produto_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor1`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Disponibilizando_um_produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilizando_um_produto`
--

LOCK TABLES `disponibilizando_um_produto` WRITE;
/*!40000 ALTER TABLE `disponibilizando_um_produto` DISABLE KEYS */;
INSERT INTO `disponibilizando_um_produto` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `disponibilizando_um_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `idEntrega` int NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `CodigoRastreio` varchar(45) DEFAULT NULL,
  `Pedido_idPedido` int NOT NULL,
  `Pedido_Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idEntrega`,`Pedido_idPedido`,`Pedido_Cliente_idCliente`),
  KEY `fk_Entrega_Pedido1_idx` (`Pedido_idPedido`,`Pedido_Cliente_idCliente`),
  CONSTRAINT `fk_Entrega_Pedido1` FOREIGN KEY (`Pedido_idPedido`, `Pedido_Cliente_idCliente`) REFERENCES `pedido` (`idPedido`, `Cliente_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (3,'Aguardando Coleta','BR1122334455',3,3),(4,'Cancelado','BR5544332211',4,4);
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL,
  `Local` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Depósito Central'),(2,'Filial Norte'),(3,'Filial Sul'),(10,'Estoque 1');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL,
  `Pessoa_idPessoa` int NOT NULL,
  PRIMARY KEY (`idFornecedor`,`Pessoa_idPessoa`),
  KEY `fk_Fornecedor_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Fornecedor_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,2),(2,4),(3,6),(4,9),(1,21);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `idPessoa` int NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_salario` BEFORE UPDATE ON `funcionario` FOR EACH ROW BEGIN
    IF OLD.Salario <> NEW.Salario THEN
        INSERT INTO Historico_Salarios (idPessoa, Nome, Salario_Antigo, Salario_Novo)
        VALUES (OLD.idPessoa, OLD.Nome, OLD.Salario, NEW.Salario);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `historico_salarios`
--

DROP TABLE IF EXISTS `historico_salarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_salarios` (
  `idHistorico` int NOT NULL AUTO_INCREMENT,
  `idPessoa` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Salario_Antigo` decimal(10,2) DEFAULT NULL,
  `Salario_Novo` decimal(10,2) DEFAULT NULL,
  `data_atualizacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idHistorico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_salarios`
--

LOCK TABLES `historico_salarios` WRITE;
/*!40000 ALTER TABLE `historico_salarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_salarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_usuarios`
--

DROP TABLE IF EXISTS `historico_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_usuarios` (
  `idHistorico` int NOT NULL AUTO_INCREMENT,
  `idPessoa` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `cpf_cnpj` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data_remocao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idHistorico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_usuarios`
--

LOCK TABLES `historico_usuarios` WRITE;
/*!40000 ALTER TABLE `historico_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idPagamento` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  `Pedido_Cliente_idCliente` int NOT NULL,
  `forma_pagamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPagamento`,`Pedido_idPedido`,`Pedido_Cliente_idCliente`),
  KEY `fk_Pagamento_Pedido1_idx` (`Pedido_idPedido`,`Pedido_Cliente_idCliente`),
  CONSTRAINT `fk_Pagamento_Pedido1` FOREIGN KEY (`Pedido_idPedido`, `Pedido_Cliente_idCliente`) REFERENCES `pedido` (`idPedido`, `Cliente_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,1,'Cartão de Crédito'),(2,2,2,'Boleto'),(3,3,3,'Pix'),(4,5,5,'Transferência Bancária');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `statusPedido` varchar(45) DEFAULT 'Processando',
  `Descrição` varchar(45) DEFAULT NULL,
  `Frete` float DEFAULT NULL,
  `Cliente_idCliente` int NOT NULL,
  `Total_Pedido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPedido`,`Cliente_idCliente`),
  KEY `fk_Pedido_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'Em andamento','Compra de Notebook',50,1,'4550.00'),(1,'Processando',NULL,NULL,21,NULL),(2,'Concluído','Compra de Acessórios',20,2,'500.00'),(2,'Processando',NULL,NULL,21,NULL),(3,'Pendente','Setup Completo',100,3,'7450.00'),(4,'Cancelado','Pedido Cancelado',0,4,'0.00'),(5,'Em andamento','Nova Compra',40,5,'1300.00');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `idPessoa` int NOT NULL,
  `Tipo_Pessoa` varchar(45) DEFAULT NULL,
  `Nome` varchar(45) DEFAULT NULL COMMENT 'Nome completo ou razão social',
  `cpf_cnpj` varchar(45) DEFAULT NULL,
  `rg_ie` varchar(45) DEFAULT NULL COMMENT 'RG ( Pessoa Fisica)  ou Incrição estadual ( Pessoa Juridica )',
  `data_abertura` varchar(45) DEFAULT NULL COMMENT 'Somente pessoa juridica\n',
  `data_nascimento` varchar(45) DEFAULT NULL COMMENT 'Somente pessoa fisica\n',
  `endereço` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPessoa`),
  UNIQUE KEY `cpf_cnpj_UNIQUE` (`cpf_cnpj`),
  UNIQUE KEY `rg_ie_UNIQUE` (`rg_ie`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Física','João Silva','123.456.789-00','MG-12.345.678',NULL,'1980-05-10','Rua A, 123','(31) 99999-9999','joao@email.com'),(2,'Jurídica','Empresa XYZ Ltda','12.345.678/0001-90','123.456.789.0001','2005-07-20',NULL,'Av. B, 456','(31) 88888-8888','contato@xyz.com'),(3,'Física','Maria Oliveira','234.567.890-11','SP-23.456.789',NULL,'1992-11-22','Rua C, 789','(11) 97777-7777','maria@email.com'),(4,'Jurídica','Tech Solutions','34.567.890/0001-01','SP-987.654.321','2010-03-15',NULL,'Av. D, 1010','(11) 96666-6666','tech@solutions.com'),(5,'Física','Carlos Mendes','345.678.901-22','RJ-34.567.890',NULL,'1985-07-19','Rua E, 202','(21) 95555-5555','carlos@email.com'),(6,'Jurídica','Alpha Corp','45.678.901/0001-12','RJ-112.233.445','2015-09-30',NULL,'Av. F, 303','(21) 94444-4444','contact@alphacorp.com'),(7,'Física','Fernanda Lima','456.789.012-33','MG-45.678.901',NULL,'1990-02-14','Rua G, 404','(31) 93333-3333','fernanda@email.com'),(8,'Física','Paulo César','567.890.123-44','BA-56.789.012',NULL,'1978-06-05','Rua H, 505','(71) 92222-2222','paulo@email.com'),(9,'Jurídica','Beta Industries','56.789.012/0001-23','BA-654.321.987','2012-12-12',NULL,'Av. I, 606','(71) 91111-1111','contact@betaindustries.com'),(10,'Física','Ana Souza','678.901.234-55','RS-67.890.123',NULL,'2000-04-25','Rua J, 707','(51) 90000-0000','ana@email.com'),(21,NULL,'João Cliente',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,'Maria Vendedora',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,'Pedro Fornecedor',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_pessoa` BEFORE DELETE ON `pessoa` FOR EACH ROW BEGIN
    INSERT INTO Historico_Usuarios (idPessoa, Nome, cpf_cnpj, email)
    VALUES (OLD.idPessoa, OLD.Nome, OLD.cpf_cnpj, OLD.email);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Produto A Modificado','Categoria 1','60.00'),(2,'Mouse Logitech','Acessórios','150.00'),(3,'Teclado Mecânico','Acessórios','350.00'),(4,'Monitor LG 24\"','Eletrônicos','1200.00'),(5,'Cadeira Gamer','Móveis','850.00'),(6,'Webcam Full HD','Acessórios','300.00'),(7,'Impressora HP','Eletrônicos','950.00'),(8,'HD Externo 1TB','Armazenamento','500.00'),(9,'SSD NVMe 1TB','Armazenamento','700.00'),(10,'Fonte 750W','Componentes','600.00'),(11,'Produto K','Categoria 4','55.00'),(22,'Produto A',NULL,NULL),(23,'Produto B',NULL,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_has_estoque`
--

DROP TABLE IF EXISTS `produto_has_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_has_estoque` (
  `quantidade` int NOT NULL,
  `Produto_idProduto` varchar(45) NOT NULL,
  `Produto_idProduto1` int NOT NULL,
  `Estoque_idEstoque` int NOT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Produto_idProduto1`,`Estoque_idEstoque`),
  KEY `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto1`),
  KEY `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque`),
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_Produto_has_Estoque_Produto1` FOREIGN KEY (`Produto_idProduto1`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_has_estoque`
--

LOCK TABLES `produto_has_estoque` WRITE;
/*!40000 ALTER TABLE `produto_has_estoque` DISABLE KEYS */;
INSERT INTO `produto_has_estoque` VALUES (10,'1',1,1),(50,'10',10,1),(20,'2',2,1),(15,'3',3,2),(5,'4',4,2),(8,'5',5,3),(12,'6',6,3),(25,'7',7,1),(30,'8',8,2),(40,'9',9,3);
/*!40000 ALTER TABLE `produto_has_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_por_vendedor_terceiro`
--

DROP TABLE IF EXISTS `produtos_por_vendedor_terceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_por_vendedor_terceiro` (
  `Quantidade` int DEFAULT NULL,
  `Terceiro_Vendedor_idTerceiro_Vendedor` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  PRIMARY KEY (`Terceiro_Vendedor_idTerceiro_Vendedor`,`Produto_idProduto`),
  KEY `fk_Produtos_por_Vendedor_Terceiro_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produtos_por_Vendedor_Terceiro_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_Produtos_por_Vendedor_Terceiro_Terceiro_Vendedor1` FOREIGN KEY (`Terceiro_Vendedor_idTerceiro_Vendedor`) REFERENCES `terceiro_vendedor` (`idTerceiro_Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_por_vendedor_terceiro`
--

LOCK TABLES `produtos_por_vendedor_terceiro` WRITE;
/*!40000 ALTER TABLE `produtos_por_vendedor_terceiro` DISABLE KEYS */;
INSERT INTO `produtos_por_vendedor_terceiro` VALUES (5,1,1),(10,2,2),(7,3,3);
/*!40000 ALTER TABLE `produtos_por_vendedor_terceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacao_de_produto_pedido`
--

DROP TABLE IF EXISTS `relacao_de_produto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacao_de_produto_pedido` (
  `Produto_idProduto` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  `Quantidade` varchar(45) DEFAULT NULL,
  `statusProduto` varchar(45) DEFAULT 'Disponível',
  PRIMARY KEY (`Produto_idProduto`,`Pedido_idPedido`),
  KEY `fk_Relacao_de_produto_pedido_Pedido1_idx` (`Pedido_idPedido`),
  CONSTRAINT `fk_Relacao_de_produto_pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_Relacao_de_produto_pedido_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacao_de_produto_pedido`
--

LOCK TABLES `relacao_de_produto_pedido` WRITE;
/*!40000 ALTER TABLE `relacao_de_produto_pedido` DISABLE KEYS */;
INSERT INTO `relacao_de_produto_pedido` VALUES (1,1,'1','Disponível'),(2,2,'2','Disponível'),(3,3,'1','Aguardando Estoque'),(4,3,'1','Disponível'),(5,5,'1','Disponível');
/*!40000 ALTER TABLE `relacao_de_produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceiro_vendedor`
--

DROP TABLE IF EXISTS `terceiro_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceiro_vendedor` (
  `idTerceiro_Vendedor` int NOT NULL,
  `Local` varchar(45) DEFAULT NULL,
  `Pessoa_idPessoa` int NOT NULL,
  PRIMARY KEY (`idTerceiro_Vendedor`,`Pessoa_idPessoa`),
  KEY `fk_Terceiro_Vendedor_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Terceiro_Vendedor_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceiro_vendedor`
--

LOCK TABLES `terceiro_vendedor` WRITE;
/*!40000 ALTER TABLE `terceiro_vendedor` DISABLE KEYS */;
INSERT INTO `terceiro_vendedor` VALUES (1,'Shopping Central',1),(1,NULL,21),(2,'Feira de Tecnologia',3),(3,'Centro Comercial',5);
/*!40000 ALTER TABLE `terceiro_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `ManipularProduto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManipularProduto`(
    IN p_operacao INT,  -- Define a operação: 1-SELECT, 2-INSERT, 3-UPDATE, 4-DELETE
    IN p_idProduto INT,
    IN p_Nome VARCHAR(255),
    IN p_Categoria VARCHAR(255),
    IN p_Valor DECIMAL(10,2)
)
BEGIN
    CASE p_operacao
        WHEN 1 THEN
            -- Selecionar produtos
            SELECT * FROM Produto;
        
        WHEN 2 THEN
            -- Inserir um novo produto
            INSERT INTO Produto (idProduto, Nome, Categoria, Valor)
            VALUES (p_idProduto, p_Nome, p_Categoria, p_Valor);
        
        WHEN 3 THEN
            -- Atualizar um produto existente
            UPDATE Produto
            SET Nome = p_Nome, Categoria = p_Categoria, Valor = p_Valor
            WHERE idProduto = p_idProduto;
        
        WHEN 4 THEN
            -- Remover um produto
            DELETE FROM Produto WHERE idProduto = p_idProduto;
        
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Operação inválida!';
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_gerenciar_ecommerce` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gerenciar_ecommerce`(
    IN p_acao INT,         -- Define a operação a ser realizada (1=SELECT, 2=INSERT, 3=UPDATE, 4=DELETE)
    IN p_id INT,           -- ID do produto/cliente/pedido
    IN p_nome VARCHAR(100), 
    IN p_tipo VARCHAR(50),  -- Define se é produto, cliente ou pedido
    IN p_extra VARCHAR(100) -- Informações extras (como categoria, status do pedido, etc.)
)
BEGIN
    CASE p_acao
        WHEN 1 THEN -- SELECT
            IF p_tipo = 'produto' THEN
                SELECT * FROM produtos WHERE id = p_id;
            ELSEIF p_tipo = 'cliente' THEN
                SELECT * FROM clientes WHERE id = p_id;
            ELSEIF p_tipo = 'pedido' THEN
                SELECT * FROM pedidos WHERE id = p_id;
            END IF;

        WHEN 2 THEN -- INSERT
            IF p_tipo = 'produto' THEN
                INSERT INTO produtos (nome, categoria) VALUES (p_nome, p_extra);
            ELSEIF p_tipo = 'cliente' THEN
                INSERT INTO clientes (nome, email) VALUES (p_nome, p_extra);
            ELSEIF p_tipo = 'pedido' THEN
                INSERT INTO pedidos (cliente_id, status) VALUES (p_id, p_extra);
            END IF;

        WHEN 3 THEN -- UPDATE
            IF p_tipo = 'produto' THEN
                UPDATE produtos SET nome = p_nome, categoria = p_extra WHERE id = p_id;
            ELSEIF p_tipo = 'cliente' THEN
                UPDATE clientes SET nome = p_nome, email = p_extra WHERE id = p_id;
            ELSEIF p_tipo = 'pedido' THEN
                UPDATE pedidos SET status = p_extra WHERE id = p_id;
            END IF;

        WHEN 4 THEN -- DELETE
            IF p_tipo = 'produto' THEN
                DELETE FROM produtos WHERE id = p_id;
            ELSEIF p_tipo = 'cliente' THEN
                DELETE FROM clientes WHERE id = p_id;
            ELSEIF p_tipo = 'pedido' THEN
                DELETE FROM pedidos WHERE id = p_id;
            END IF;
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-09 23:28:55
