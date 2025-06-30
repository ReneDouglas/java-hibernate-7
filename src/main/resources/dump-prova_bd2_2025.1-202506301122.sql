-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: prova_bd2_2025.1
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes` (
  `avaliacao_id` int NOT NULL AUTO_INCREMENT,
  `produto_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `nota` int DEFAULT NULL,
  `comentario` text,
  `data_avaliacao` date DEFAULT NULL,
  PRIMARY KEY (`avaliacao_id`),
  KEY `produto_id` (`produto_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`),
  CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `avaliacoes_chk_1` CHECK ((`nota` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
INSERT INTO `avaliacoes` VALUES (1,1,1,5,'Excelente produto, superou minhas expectativas','2023-03-10'),(2,1,7,4,'Muito bom, mas o preço é elevado','2023-07-05'),(3,3,3,5,'Notebook rápido e eficiente','2023-03-25'),(4,5,5,3,'Bom, mas a bateria poderia durar mais','2023-04-20'),(5,8,6,2,'Não atendeu às expectativas, conexão instável','2023-05-25'),(6,8,9,4,'Bom fone, cancelamento de ruído eficaz','2023-08-10'),(7,9,10,5,'Som de alta qualidade e resistente à água','2023-09-15'),(8,2,8,3,'Bom custo-benefício, mas poderia ter mais memória','2023-08-05'),(9,4,2,4,'Atende bem para tarefas básicas','2023-03-15'),(10,6,4,5,'Ótimo tablet pelo preço','2023-04-12');
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Smartphones','Telefones inteligentes de última geração'),(2,'Notebooks','Computadores portáteis para trabalho e entretenimento'),(3,'Tablets','Dispositivos intermediários entre smartphones e notebooks'),(4,'Acessórios','Cabos, carregadores, capas e outros acessórios'),(5,'Áudio','Fones de ouvido, caixas de som e equipamentos de áudio'),(6,'Software Engineering','teste'),(7,'Software Engineering com Hibernate','teste com hibernate'),(8,'Software Engineering com Hibernate 2','teste com hibernate 2'),(9,'Software Engineering com Hibernate 3','teste com hibernate 3'),(10,'Software Engineering com Hibernate 4','teste com hibernate 4'),(11,'Software Engineering com Hibernate 5','teste com hibernate 5'),(12,'Software Engineering com Hibernate 6','teste com hibernate 6'),(13,'Software Engineering com Hibernate 6','teste com hibernate 6'),(14,'Software Engineering com Hibernate 7','teste com hibernate 7');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Silva','joao.silva@email.com','11999998888','2023-01-15'),(2,'Maria Souza','maria.souza@email.com','21988887777','2023-02-20'),(3,'Carlos Oliveira','carlos.oliveira@email.com','31977776666','2023-03-10'),(4,'Ana Santos','ana.santos@email.com','41966665555','2023-04-05'),(5,'Pedro Costa','pedro.costa@email.com','51955554444','2023-05-12'),(6,'Juliana Lima','juliana.lima@email.com','61944443333','2023-06-18'),(7,'Marcos Rocha','marcos.rocha@email.com','71933332222','2023-07-22'),(8,'Fernanda Alves','fernanda.alves@email.com','81922221111','2023-08-30'),(9,'Ricardo Pereira','ricardo.pereira@email.com','91911110000','2023-09-05'),(10,'Patrícia Gomes','patricia.gomes@email.com','21900009999','2023-10-15');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS ((`quantidade` * `preco_unitario`)) STORED,
  PRIMARY KEY (`item_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`),
  CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` (`item_id`, `pedido_id`, `produto_id`, `quantidade`, `preco_unitario`) VALUES (1,1,1,2,3999.90),(2,2,4,1,3499.90),(3,3,3,1,5999.90),(4,4,6,1,1299.90),(5,5,5,1,1999.90),(6,6,8,1,599.90),(7,7,1,1,3999.90),(8,8,2,1,2499.90),(9,9,8,1,599.90),(10,10,9,1,399.90);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `data_pedido` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `pedidos_chk_1` CHECK ((`status` in (_utf8mb4'Pendente',_utf8mb4'Processando',_utf8mb4'Enviado',_utf8mb4'Entregue',_utf8mb4'Cancelado')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2023-03-05','Entregue',7999.80),(2,2,'2023-03-12','Enviado',3499.90),(3,3,'2023-03-18','Entregue',5999.90),(4,4,'2023-04-10','Processando',1299.90),(5,5,'2023-04-15','Entregue',1999.90),(6,6,'2023-05-20','Cancelado',599.90),(7,7,'2023-06-25','Entregue',3999.90),(8,8,'2023-07-30','Enviado',2499.90),(9,9,'2023-08-05','Entregue',599.90),(10,10,'2023-09-10','Pendente',399.90);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `produto_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int NOT NULL,
  `categoria_id` int DEFAULT NULL,
  PRIMARY KEY (`produto_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Smartphone X','Última geração, 128GB RAM, tela OLED',3999.90,50,1),(2,'Smartphone Y','Modelo intermediário, 64GB RAM, tela AMOLED',2499.90,75,1),(3,'Notebook Pro','16GB RAM, SSD 512GB, processador i7',5999.90,30,2),(4,'Notebook Basic','8GB RAM, SSD 256GB, processador i5',3499.90,40,2),(5,'Tablet Plus','Tela 10\", 64GB, caneta inclusa',1999.90,60,3),(6,'Tablet Lite','Tela 8\", 32GB, versão econômica',1299.90,80,3),(7,'Carregador Turbo','Carregador rápido 65W',199.90,120,4),(8,'Fone Bluetooth','Fone sem fio com cancelamento de ruído',599.90,90,5),(9,'Caixa de Som','Caixa de som portátil à prova d\'água',399.90,70,5),(10,'Capa Smartphone','Capa protetora para Smartphone X',89.90,150,4);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'prova_bd2_2025.1'
--
