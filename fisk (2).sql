-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 12:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fisk`
--

-- --------------------------------------------------------

--
-- Table structure for table `idioma`
--

CREATE TABLE `idioma` (
  `id` int(100) NOT NULL,
  `nome` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `idioma`
--

INSERT INTO `idioma` (`id`, `nome`) VALUES
(1, 'Espanhol'),
(2, 'Ingles\r\n'),
(3, 'Frances\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `matriculas`
--

CREATE TABLE `matriculas` (
  `id` int(11) NOT NULL,
  `idutilizador` int(11) NOT NULL,
  `idturma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matriculas`
--

INSERT INTO `matriculas` (`id`, `idutilizador`, `idturma`) VALUES
(16, 4, 21),
(19, 1, 21),
(20, 1, 32),
(21, 1, 31);

-- --------------------------------------------------------

--
-- Table structure for table `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) DEFAULT NULL,
  `ididioma` int(11) DEFAULT NULL,
  `nota` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notas`
--

INSERT INTO `notas` (`id`, `aluno_id`, `ididioma`, `nota`) VALUES
(8, 4, 1, 11.00),
(9, 1, 3, 15.00),
(10, 1, 2, 19.00),
(11, 1, 1, 12.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbutilizadores`
--

CREATE TABLE `tbutilizadores` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbutilizadores`
--

INSERT INTO `tbutilizadores` (`id`, `nome`, `email`, `password`, `tipo`) VALUES
(1, 'Wagner Santos', 'wagner@gmail.com', '202cb962ac59075b964b07152d234b70', 3),
(2, 'Luis', 'Luis123@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(4, 'pedro', 'aluno2@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 3),
(9, 'andre', 'andre@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 3);

-- --------------------------------------------------------

--
-- Table structure for table `turmas`
--

CREATE TABLE `turmas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ididioma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turmas`
--

INSERT INTO `turmas` (`id`, `nome`, `ididioma`) VALUES
(21, 'Turma teste espanhol', 1),
(31, 'turma teste ingles', 2),
(32, 'turma teste frances', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idutilizador` (`idutilizador`),
  ADD KEY `matriculas_ibfk_2` (`idturma`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aluno_id_2` (`aluno_id`,`ididioma`),
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `ididioma` (`ididioma`);

--
-- Indexes for table `tbutilizadores`
--
ALTER TABLE `tbutilizadores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `idioma`
--
ALTER TABLE `idioma`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbutilizadores`
--
ALTER TABLE `tbutilizadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`idutilizador`) REFERENCES `tbutilizadores` (`id`),
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`idturma`) REFERENCES `turmas` (`id`);

--
-- Constraints for table `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `tbutilizadores` (`id`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`ididioma`) REFERENCES `idioma` (`id`);

--
-- Constraints for table `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`ididioma`) REFERENCES `idioma` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
