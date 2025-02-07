-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Fev-2025 às 19:33
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
DROP DATABASE IF EXISTS `matheusandradeestoque`;
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

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Cod_Cliente`, `Nome_cliente`, `endereço`, `cidade`, `cep`, `cnpj`, `uf`, `ie`) VALUES
(20, 'Beth', 'Av Climério n. 45', 'São Paulo', '25679300', 'SP', '3248512673', 9280),
(110, 'Jorge', 'Rua Caiapó 13', 'Curitiba', '30078500', 'PR', '1451276498', 2134),
(130, 'Edmar', 'Rua da Prais s/n', 'Salvador', '30079300', 'BA', '2346328423', 7121),
(157, 'Paulo', 'Tv. Moraes c/3', 'Londrina', NULL, 'PR', '3284822332', 1923),
(180, 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '30077500', 'SC', '1273657123', NULL),
(222, 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '22124391', 'MG', '2831521393', 2985),
(234, 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '22841650', 'DF', '2176357612', 2931),
(260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', 'RJ', '2176357123', 2530),
(290, 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '30225900', 'SP', '1327657112', 1820),
(390, 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '30438700', 'MG', '3217654721', 9071),
(410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '30078900', 'RJ', '1283512823', 7431),
(720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358310', 'RJ', '1211323100', 2134),
(830, 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '3012683', 'SP', '3281698574', 9343),
(870, 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '22763931', 'SP', '2253412693', 4631);

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

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`num_pedido`, `prazo_entrega`, `cod_cliente`, `cod_vendedor`) VALUES
(91, 20, 260, 11),
(97, 20, 720, 101),
(98, 20, 410, 209),
(101, 15, 720, 101),
(103, 20, 260, 11),
(104, 30, 110, 101),
(105, 15, 180, 240),
(108, 15, 290, 310),
(111, 20, 260, 240),
(112, 20, 260, 240),
(119, 30, 390, 250),
(121, 20, 410, 209),
(127, 10, 410, 11),
(137, 20, 720, 720),
(138, 20, 260, 11),
(143, 30, 20, 111),
(148, 20, 720, 101),
(189, 15, 870, 213),
(203, 30, 830, 250);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_has_poduto`
--

CREATE TABLE `pedido_has_poduto` (
  `pedido_Num_pedido` int(11) NOT NULL COMMENT 'esse campo mostra o numero do pedido',
  `Poduto_Cod_Produto` int(11) NOT NULL COMMENT 'esse campo mostra o codigo do produto',
  `QTDE` varchar(45) DEFAULT NULL COMMENT 'esse campo mostra a quantidade do produto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pedido_has_poduto`
--

INSERT INTO `pedido_has_poduto` (`pedido_Num_pedido`, `Poduto_Cod_Produto`, `QTDE`) VALUES
(91, 77, '40'),
(97, 77, '20'),
(101, 31, '9'),
(103, 53, '37'),
(104, 53, '32'),
(105, 78, '10'),
(108, 13, '17'),
(111, 25, '10'),
(111, 78, '70'),
(119, 13, '6'),
(119, 22, '10'),
(119, 53, '43'),
(119, 77, '40'),
(121, 25, '10'),
(121, 31, '35'),
(137, 13, '8'),
(138, 22, '10'),
(138, 53, '18'),
(138, 77, '35'),
(143, 31, '20'),
(148, 25, '10'),
(148, 31, '7'),
(148, 45, '8'),
(148, 77, '3'),
(148, 78, '30'),
(189, 78, '45'),
(203, 31, '6');

-- --------------------------------------------------------

--
-- Estrutura da tabela `poduto`
--

CREATE TABLE `poduto` (
  `Cod_Produto` int(11) NOT NULL COMMENT 'esse campo mostra o codigo do produto',
  `unida_produto` varchar(10) DEFAULT NULL COMMENT 'esse campo mostra a unidade do produto',
  `desc_produto` varchar(50) DEFAULT NULL COMMENT 'esse campo mostra a descrição do produto',
  `valor_unit` decimal(15,2) DEFAULT NULL COMMENT 'esse campo mostra o valor da unit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `poduto`
--

INSERT INTO `poduto` (`Cod_Produto`, `unida_produto`, `desc_produto`, `valor_unit`) VALUES
(13, 'G', 'Ouro', '6.18'),
(22, 'M', 'Linho', '0.11'),
(25, 'Kg', 'Queijo', '0.97'),
(30, 'SAC', 'Açucar', '0.30'),
(31, 'Bar', 'Chocolate', '0.87'),
(45, 'M', 'Madeira', '0.25'),
(53, 'M', 'Linha', '1.80'),
(77, 'M', 'Papel', '1.05'),
(78, 'L', 'Vinho', '2.00'),
(87, 'M', 'Cano', '1.97');

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
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`Cod_Vendedor`, `Nome_vendedor`, `sal_fixo`, `faixa_comissao`) VALUES
(11, 'João', '2780.00', 'C'),
(101, 'João', '2650.32', 'C'),
(111, 'Carlos', '2490.00', 'A'),
(209, 'José', '1800.00', 'C'),
(213, 'Jonas', '2300.50', 'A'),
(240, 'Antonio', '9500.00', 'C'),
(250, 'Mauricío', '2930.00', 'B'),
(310, 'Josias', '870.00', 'B'),
(720, 'Felipe', '4600.00', 'A');

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
-- Índices para tabela `pedido_has_poduto`
--
ALTER TABLE `pedido_has_poduto`
  ADD PRIMARY KEY (`pedido_Num_pedido`,`Poduto_Cod_Produto`),
  ADD KEY `fk_pedido_has_Poduto_Poduto1_idx` (`Poduto_Cod_Produto`),
  ADD KEY `fk_pedido_has_Poduto_pedido1_idx` (`pedido_Num_pedido`);

--
-- Índices para tabela `poduto`
--
ALTER TABLE `poduto`
  ADD PRIMARY KEY (`Cod_Produto`);

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

--
-- Limitadores para a tabela `pedido_has_poduto`
--
ALTER TABLE `pedido_has_poduto`
  ADD CONSTRAINT `fk_pedido_has_Poduto_Poduto1` FOREIGN KEY (`Poduto_Cod_Produto`) REFERENCES `poduto` (`Cod_Produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_has_Poduto_pedido1` FOREIGN KEY (`pedido_Num_pedido`) REFERENCES `pedido` (`num_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
