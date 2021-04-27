-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 27 avr. 2021 à 15:13
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `todo`
--
CREATE DATABASE IF NOT EXISTS `todo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `todo`;

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE IF NOT EXISTS `tache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `statut` int(11) NOT NULL DEFAULT 0,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tache`
--

INSERT INTO `tache` (`id`, `description`, `date_debut`, `date_fin`, `statut`, `id_utilisateur`) VALUES
(9, 'dadadada', '2021-04-26 09:51:10', '2021-04-26 13:29:25', 1, 26),
(10, 'dadadada', '2021-04-26 10:06:01', '2021-04-26 13:29:33', 1, 26),
(11, 'totototototo', '2021-04-26 10:49:18', '2021-04-26 12:00:52', 1, 26),
(12, 'tetete', '2021-04-26 12:01:13', '2021-04-26 12:01:18', 1, 26),
(13, 'zozozoz', '2021-04-26 12:05:00', '2021-04-26 12:05:21', 1, 26),
(14, 'zozozozo', '2021-04-26 12:05:59', '2021-04-26 12:09:00', 1, 26),
(15, 'zozozozo', '2021-04-26 12:06:00', '2021-04-26 12:09:18', 1, 26),
(16, 'opopopopopopo', '2021-04-26 12:12:07', '2021-04-26 12:12:14', 1, 26),
(17, 'zeaeaeza', '2021-04-26 12:12:45', '2021-04-26 12:12:50', 1, 26),
(18, 'tatata', '2021-04-26 12:14:42', '2021-04-26 12:14:52', 1, 26),
(19, 'zozozozozzo', '2021-04-26 12:32:00', '2021-04-26 13:29:10', 1, 26),
(20, 'pierrot le fou', '2021-04-27 08:50:27', '2021-04-27 09:11:13', 1, 26),
(21, 'aezaze', '2021-04-27 08:55:19', '2021-04-27 09:24:55', 1, 26),
(22, 'azea', '2021-04-27 08:56:07', '0000-00-00 00:00:00', 0, 26),
(23, 'azea', '2021-04-27 08:56:43', '0000-00-00 00:00:00', 0, 26),
(24, 'zaeza', '2021-04-27 08:57:26', '0000-00-00 00:00:00', 0, 26),
(25, 'fabfab', '2021-04-27 08:58:02', '2021-04-27 09:35:30', 1, 26),
(26, 'dmx bmx', '2021-04-27 09:00:30', '2021-04-27 09:37:22', 1, 26),
(27, 'nadirziane', '2021-04-27 09:03:50', '2021-04-27 09:37:15', 1, 26),
(28, 'aezazeaz', '2021-04-27 09:04:03', '0000-00-00 00:00:00', 0, 26),
(29, 'zaeazeaz', '2021-04-27 09:09:43', '0000-00-00 00:00:00', 0, 26),
(30, 'test new fonctionnalite', '2021-04-27 09:10:01', '2021-04-27 10:29:13', 0, 26),
(31, 'taille joueurs', '2021-04-27 14:48:03', '2021-04-27 15:00:06', 1, 27),
(32, 'tototo', '2021-04-27 14:49:32', '2021-04-27 14:49:36', 1, 27),
(33, 'rrrra', '2021-04-27 14:52:40', '2021-04-27 14:52:43', 1, 27),
(34, 'ruben', '2021-04-27 14:58:14', '2021-04-27 15:01:25', 1, 27),
(35, 'test', '2021-04-27 15:01:53', '2021-04-27 15:01:57', 0, 27),
(36, 'lol', '2021-04-27 15:03:35', '2021-04-27 15:03:42', 1, 27),
(37, 'rubrub', '2021-04-27 15:04:48', '2021-04-27 15:04:53', 1, 27),
(38, 'est ce la fin du game?', '2021-04-27 15:11:29', '0000-00-00 00:00:00', 0, 27),
(39, 'la vrai fin du game', '2021-04-27 15:11:56', '2021-04-27 15:12:02', 1, 27);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `login`, `password`) VALUES
(4, 'nerner@nerner.fr', 'nerner', '$2y$10$P7sNudwwIvuBsJIORDemZO/4kLDoOraN3nd7yru5gibF7EQPsVMW6'),
(5, 'clement@caillou.Fr', 'clement', '$2y$10$DEA9fdD8/kA74JYeo85vxOJN45BdTsLP4btdRDGVjxRD5DoRDEERK'),
(10, 'clement@caillou.fr', 'clement1', '$2y$10$cqtIEhTK5SxRD8CKbL1BaeNarWEWBROyWFqe7r2T329hiKrXSmDwC'),
(11, 'caca@pipi.com', 'cacacacac', '$2y$10$PHU7.XT1GS0AkWicE1cBcu/Y4yKjyqSQ2AhNCHC9Vqq5PcJAfwdo.'),
(12, 'clement@caillou.fr', 'admin', '$2y$10$AsOZVJN4GdFEfNBNVHWq8e84rABxqP8aB.BQiR4HON8C42EVIsl5y'),
(13, 'adrien@coquillat.fv', 'adrienleboss', '$2y$10$NR/yzlrkXS5dvD.2GAdgr.oVFLFByX.n6yKZ.15GM2r6I1htd55iy'),
(14, 'admin@admin.fr', 'admini', '$2y$10$qXrS1gDC4LHZqjqWqYp86O4r0U3SRRyHn4z/YlD5RVtzYc/32l/ei'),
(15, 'admin@admin.fr', 'adminis', '$2y$10$vYB5.i37.nb3LlZReDN0YOL2hRYgZHAt4kiLkYHr.OlMgX7mIb5rW'),
(16, 'fabien@baba.com', 'fabbaba', '$2y$10$IRGw4KMymTFuldIFF.iKCeXkYl3r5tkveY90yaXGszABzsWwdPr.6'),
(17, 'fabien@baba.com', 'fabbaba1', '$2y$10$KX9autLvD4brsqT/o8wt6O8JBmlysMr9Q5Np5shnUGHJ9RhAu.206'),
(18, 'fabien@baba.com', 'fabbaba12', '$2y$10$CygYjt.0Qk/PmuOZ.6RK4OPfWmGRCtObgFsJnWzjDWx9Et5GwxJMW'),
(19, 'fabbaba12@mail.com', 'fabbaba123', '$2y$10$pSSQPYdq0JW0oe8GUs/hyuL3z70nQHXFgoROZlPHo.qvljo83KIRu'),
(20, 'bart@simpson.fr', 'bartsimpson', '$2y$10$VB3hxABrCfqxVOVjKtwsgOPwpbhhCEFDLc4P6EnX2j10Mzn3Fz9US'),
(21, 'bart@simpson.fr', 'bartsimpson1', '$2y$10$grivA0UmDTpZXuo9TiGgful7UVeS8oS99l4i10sPoNTdUL9zl1ISu'),
(22, 'bart@simpson.fr', 'bartsimpson12', '$2y$10$2epW.YdKPkfXfFUBFHT7L.V10WenvYK2Iza0ASO3RrNtwrb0WTR5u'),
(23, 'ruben@habib.fr', 'rubenhabib', '$2y$10$DZdK6HITljXvTsBPAc2O3eEDsrUFPKNPLtPuIrDAq6YTmsQSX.Mse'),
(24, 'azeqz@kgkdfm.com', 'azazaza', '$2y$10$ybk/CvTbcoK98JqYSImp9uSESeTrKo.6jYy8iToYaKHfgo.JayUay'),
(25, 'azeqz@kgkdfm.com', 'azazaza1', '$2y$10$6lRrWcWIwfFfvk0NiFY0feIIjinqcBfjTV9BG7hoOL7qBDbISULIO'),
(26, 'tavernier@mathias.fr', 'tavernier', '$2y$10$1Gfvnm18joxLxKWhkBDvKOGSWc.14Rsxlyd1cE18ZyPUj.ZbRVJ7q'),
(27, 'fabien@baba.fr', 'fabienbaba', '$2y$10$feYYv6gII7Adxt7/DtxEI.n4fPQnAnSZ653n5yzDCD.eySlTPVToS');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `tache_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
