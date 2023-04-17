-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2023 at 04:50 AM
-- Server version: 8.0.32
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `centre_de_formation`
--

-- --------------------------------------------------------

--
-- Table structure for table `apprenant`
--

CREATE TABLE `apprenant` (
  `id_apprenant` int NOT NULL,
  `Nom` varchar(150) NOT NULL,
  `Prenom` varchar(150) NOT NULL,
  `Adresse` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `apprenant`
--

INSERT INTO `apprenant` (`id_apprenant`, `Nom`, `Prenom`, `Adresse`, `Email`) VALUES
(1, 'hamdi ', 'ahmad', 'morocco settat', 'hamdi123@gmail.com'),
(2, 'miu ', 'amine', 'morocco agadir', 'amine123@gmail.com'),
(3, 'madi', 'sami', 'morocco tanger', 'sami123@gmail.com'),
(4, 'hamdi', 'mohammed', 'morocco eljadida', 'mohammed123@gmail.com'),
(5, 'bichri', 'yassine', 'morocco', 'safi'),
(6, 'sani', 'zakaria', 'morocco kenitra', 'zakaria123@gmail.com'),
(7, 'mita', 'meryam', 'taza', 'meryam123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `formateur`
--

CREATE TABLE `formateur` (
  `Nom` varchar(150) NOT NULL,
  `Prenom` varchar(150) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Competences` varchar(200) NOT NULL,
  `id_formateur` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `formateur`
--

INSERT INTO `formateur` (`Nom`, `Prenom`, `Email`, `Competences`, `id_formateur`) VALUES
('bouich', 'fatimaezzahra', 'fatima.zahra@gmail.com', 'Design', 1),
('bouik', 'hussein', 'bouik.hussein@gmail.com', 'Programmation', 2),
('elghali', 'ikram', 'elghali.ikram@gmail.com', 'computer networks', 3),
('daifane', 'yassmine', 'yassmine.yass@gmail.com', 'Web developpement', 4),
('boui', 'khadija', 'boui.khadija@gmail.com', 'Operating systems', 5),
('jabrane', 'yassin', 'yassin.jabran@gmail.com', 'Databases', 6),
('elhail', 'imane', 'elhail.imane@gmail.com', 'cyber security', 7);

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

CREATE TABLE `formation` (
  `id_formation` int NOT NULL,
  `Sujet` varchar(255) NOT NULL,
  `Catégorie` varchar(255) NOT NULL,
  `masse_horaire` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `formation`
--

INSERT INTO `formation` (`id_formation`, `Sujet`, `Catégorie`, `masse_horaire`) VALUES
(1, 'PHP', 'Programmation', '20'),
(2, 'Java script', 'Programmation', '20'),
(3, 'Html and Css', 'Programmation', '30'),
(4, 'C++', 'Programmation', '10'),
(5, 'Ruby', 'Programmation', '30'),
(6, 'Photoshop', 'Design', '10'),
(7, 'Illustrator', 'Design', '20'),
(8, 'Figma', 'Design', '10'),
(9, 'Adobe flash', 'Design', '20'),
(10, 'Adobe xd', 'Design', '15'),
(11, 'WordPress', 'web development', '30'),
(12, 'Blogger', 'web development', '40'),
(13, 'Seo', 'web development', '30'),
(14, '+N', 'computer networks', '10'),
(15, 'Mcse', 'computer networks', '50'),
(16, 'Ccna & Ccnp', 'computer networks', '30'),
(17, 'CEH', 'cyber security', '40'),
(18, 'Metasploit', 'cyber security', '60'),
(19, 'network security', 'cyber security', '30'),
(20, 'Web Application Security', 'cyber security', '50'),
(21, 'MySql', 'Databases', '60'),
(22, 'Oracle', 'Databases', '50'),
(23, 'SQL', 'Databases', '10'),
(24, 'Mac', 'Operating systems', '10'),
(25, 'Linux', 'Operating systems', '30'),
(26, 'Algorithmes', 'Computer Science', '70'),
(27, 'digital logic', 'Computer Science', '10');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id_session` int NOT NULL,
  `date_de_début` date NOT NULL,
  `date_de_fin` date NOT NULL,
  `nombre_places_max` int NOT NULL,
  `état` varchar(255) NOT NULL,
  `id_formateur` int NOT NULL,
  `id_formation` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sinscrire`
--

CREATE TABLE `sinscrire` (
  `Evaluation` varchar(100) NOT NULL,
  `id_session` int NOT NULL,
  `id_apprenant` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apprenant`
--
ALTER TABLE `apprenant`
  ADD PRIMARY KEY (`id_apprenant`);

--
-- Indexes for table `formateur`
--
ALTER TABLE `formateur`
  ADD PRIMARY KEY (`id_formateur`);

--
-- Indexes for table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id_formation`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id_session`),
  ADD KEY `id_formateur` (`id_formateur`),
  ADD KEY `id_formation` (`id_formation`);

--
-- Indexes for table `sinscrire`
--
ALTER TABLE `sinscrire`
  ADD KEY `id_apprenant` (`id_apprenant`),
  ADD KEY `id_session` (`id_session`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apprenant`
--
ALTER TABLE `apprenant`
  MODIFY `id_apprenant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `formateur`
--
ALTER TABLE `formateur`
  MODIFY `id_formateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `formation`
--
ALTER TABLE `formation`
  MODIFY `id_formation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id_session` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `id_formateur` FOREIGN KEY (`id_formateur`) REFERENCES `formateur` (`id_formateur`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_formation` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id_formation`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `sinscrire`
--
ALTER TABLE `sinscrire`
  ADD CONSTRAINT `id_apprenant` FOREIGN KEY (`id_apprenant`) REFERENCES `apprenant` (`id_apprenant`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_session` FOREIGN KEY (`id_session`) REFERENCES `session` (`id_session`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
