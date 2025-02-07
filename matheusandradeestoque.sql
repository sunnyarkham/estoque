-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Fev-2025 às 21:04
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `matheusandradeestoque`
--
CREATE DATABASE IF NOT EXISTS `matheusandradeestoque` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `matheusandradeestoque`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Cod_Cliente` int(11) NOT NULL COMMENT 'esse campo mostra o codigo do cliente',
  `Nome_cliente` varchar(50) DEFAULT NULL COMMENT 'esse campo mostra o nome do cliente cadastrado ',
  `endereço` varchar(50) DEFAULT NULL COMMENT 'esse campo mostra o endereço que o cliente colocar',
  `cidade` varchar(50) DEFAULT NULL COMMENT 'esse campo mostra a cidade que o cliente mora',
  `cep` varchar(10) DEFAULT NULL COMMENT 'esse campo mostra o codigo de endereçamento postal do cliente',
  `cnpj` varchar(30) DEFAULT NULL COMMENT 'esse campo mostra o cadastro nacional do cliente juriidca',
  `uf` char(10) DEFAULT NULL COMMENT 'esse campo mostra a undade de federação do cliente',
  `ie` int(10) DEFAULT NULL COMMENT 'esse campo mostra a inscrição estadual do cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `num_pedido` int(11) NOT NULL,
  `prazo_entrega` int(10) DEFAULT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `Cod_Vendedor` int(11) NOT NULL COMMENT 'esse campo mostra o codigo do vendedor',
  `Nome_vendedor` varchar(50) DEFAULT NULL COMMENT 'esse campo mostra o nome do vendedor sugerido',
  `sal_fixo` decimal(15,2) DEFAULT NULL COMMENT 'esse campo mostra o salario  fixo que o vendedor ira reveber',
  `faixa_comissao` char(2) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL COMMENT 'esse campo mostra a faixa da comissao que o vendedor tem'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cod_Cliente`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_pedido`),
  ADD KEY `fk_cliente_pedido` (`cod_cliente`),
  ADD KEY `fk_vendedor_pedido` (`cod_vendedor`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`Cod_Vendedor`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_cliente_pedido` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`Cod_Cliente`),
  ADD CONSTRAINT `fk_vendedor_pedido` FOREIGN KEY (`cod_vendedor`) REFERENCES `vendedor` (`Cod_Vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
