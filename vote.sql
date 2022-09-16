-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 16 sep. 2022 à 18:57
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vote`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidats`
--

CREATE TABLE `candidats` (
  `id` int(11) NOT NULL,
  `candidat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `candidats`
--

INSERT INTO `candidats` (`id`, `candidat`) VALUES
(1, 'Mohamed el amri'),
(2, 'abdilaah benali'),
(3, 'aymen el hafdi'),
(4, 'zakaria el ghayam');

-- --------------------------------------------------------

--
-- Structure de la table `centreco`
--

CREATE TABLE `centreco` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `centreco`
--

INSERT INTO `centreco` (`id`, `email`, `password`) VALUES
(1, 'centreCo@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b');

-- --------------------------------------------------------

--
-- Structure de la table `centrede`
--

CREATE TABLE `centrede` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `centrede`
--

INSERT INTO `centrede` (`id`, `email`, `password`) VALUES
(1, 'centreDe@gmail.com', '4a7d1ed414474e4033ac29ccb8653d9b');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `datenaissance` varchar(100) NOT NULL,
  `identificateur` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `nom`, `prenom`, `datenaissance`, `identificateur`) VALUES
(1, 'test1', 'test', '1999-07-17', 'A123'),
(2, 'test2', 'test', '1998-05-28', 'A124'),
(3, 'test3', 'test', '1999-04-14', 'A125'),
(4, 'test4', 'test', '1998-06-14', 'A126'),
(5, 'test5', 'test', '1994-03-14', 'A127'),
(6, 'test6', 'teste', '1999-08-12', 'A128'),
(7, 'test7', 'testl', '1998-02-17', 'A129'),
(8, 'test8', 'test', '1996-05-29', 'A120'),
(9, 'test9', 'test', '1998-04-16', 'A177'),
(10, 'test10', 'test', '1994-03-16', 'A198');

-- --------------------------------------------------------

--
-- Structure de la table `votant`
--

CREATE TABLE `votant` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `datenaissance` varchar(100) NOT NULL,
  `identificateur` varchar(1000) NOT NULL,
  `bulltinvote` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votant`
--

INSERT INTO `votant` (`id`, `nom`, `prenom`, `datenaissance`, `identificateur`, `bulltinvote`) VALUES
(6, 'test1', 'test', '1999-07-17', 'A123\n', '-----BEGIN PGP MESSAGE-----\nVersion: Didisoft OpenPGP Library for Java 3.2\n\nhF4DFC9Nne+MFV8SAQdAoYHoScjJoklSRdvwypfVa7444gRE0PZy8nJtNTY+vUUw\nDvJnEqW8CQJha62k3foxdolNDi3QdRkq+g4H902OLCM2Gp8vv9GkE9BTqI6iqcDr\n0lUBBdAlOU/wOidkAZkPUNhHkKv12YpO/TGTfNhw3wsB4FJg/ZhrjZrUrgl8ReC6\nzNPWD5EH7rWPiAwyyRl1aUsSDExPj0ER4BoYr8zNql8KiKKY1Q6t\n=sx6w\n-----END PGP MESSAGE-----\n'),
(7, 'test2', 'test', '1998-05-28', 'A124\n', '-----BEGIN PGP MESSAGE-----\nVersion: Didisoft OpenPGP Library for Java 3.2\n\nhF4DFC9Nne+MFV8SAQdAxpy2Nn3BHE+iNsGtiDi3m2R4ffX7cbYpFq/16g9RbTUw\ncvZPpW5mNbCPRmVHS6RjvzioMLFxwyZ5v6sfda4QiIU3InkhgrFtc7WZQL04Wggn\n0lUBg9d8YZ6V4E4ISc9UGy811bZiaYyRERuxyBqVHAayoHkYRH5pfdMk1Q+k8ahh\ndvxaDXcVgGrUrVkC1eu4Ery/FRb3ONpYzLH7yCVQPhChx57bvkw5\n=NhzX\n-----END PGP MESSAGE-----\n'),
(8, 'test4', 'test', '1998-04-16', 'A126\n', '-----BEGIN PGP MESSAGE-----\nVersion: Didisoft OpenPGP Library for Java 3.2\n\nhF4DFC9Nne+MFV8SAQdAg8XHI+LJpkJScn5/OnfoRCFsg9mRvJA30dm9FuB55FEw\n2kVYe9z1wtNj4raTRMWxybHTX+NEFtdPliju61rnTZTAb8ovjAG4iogerQvHr3K4\n0lUBuTnor0s2BX/xNwcBlvJCc7M++P5sNnj0xCoH0wNWnkTBK7JszevNTjgeFaU/\nFbKKL2OlHH7e42+ILvO4AK7FWYoCDKEw5eYlijqjC+KL5wLDmhrY\n=7FMh\n-----END PGP MESSAGE-----\n'),
(9, 'test5', 'test', '1994-03-14', 'A127\n', '-----BEGIN PGP MESSAGE-----\nVersion: Didisoft OpenPGP Library for Java 3.2\n\nhF4DFC9Nne+MFV8SAQdAkEuocxGLXnV2RCaOoQja2NSoa1pu8rkd/2kAhmx4+V8w\nYi5WURXP3l7GmyKx2d8YkAbOpJ2aQ6vfd+JNipZojFfRBt8ECZRA/UkSkRkXCV7W\n0lUBAOeqANayAf3h4M/x46pyChMEJIrRrwZwbSHIWJ7cDIdxaBRjTsdXReVPl6ly\nziBUV3em0bvl18mpqA5xYIXLhZoSemTdYWxERiqEfTlrwi1g2bU6\n=ir20\n-----END PGP MESSAGE-----\n');

-- --------------------------------------------------------

--
-- Structure de la table `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `identificateur` varchar(1000) NOT NULL,
  `bulltinvote` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vote`
--

INSERT INTO `vote` (`id`, `identificateur`, `bulltinvote`) VALUES
(5, 'A123', 'abdilaah benali\n'),
(6, 'A124', 'Mohamed el amri\n'),
(7, 'A126', 'maymen el hafdi\n'),
(8, 'A127', 'Mohamed el amri\n');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `candidats`
--
ALTER TABLE `candidats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `centreco`
--
ALTER TABLE `centreco`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `centrede`
--
ALTER TABLE `centrede`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `votant`
--
ALTER TABLE `votant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `candidats`
--
ALTER TABLE `candidats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `centreco`
--
ALTER TABLE `centreco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `centrede`
--
ALTER TABLE `centrede`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `votant`
--
ALTER TABLE `votant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
