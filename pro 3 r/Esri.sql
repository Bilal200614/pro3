-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 10 apr 2023 om 23:01
-- Serverversie: 10.4.25-MariaDB
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mediamarkt`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestellingen`
--

CREATE TABLE `bestellingen` (
  `idbestelling` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  `totaalprijs` decimal(65,2) DEFAULT NULL,
  `klanten_idklant` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `bestellingen`
--

INSERT INTO `bestellingen` (`idbestelling`, `datum`, `totaalprijs`, `klanten_idklant`) VALUES
(3, '2023-03-01', NULL, 6),
(4, '2023-02-18', NULL, 1),
(5, '2022-12-15', NULL, 5),
(6, '2022-12-16', NULL, 5),
(7, '2022-11-24', NULL, 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestellingen_has_producten`
--

CREATE TABLE `bestellingen_has_producten` (
  `bestellingen_idbestelling` int(11) NOT NULL,
  `producten_idproduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `bestellingen_has_producten`
--

INSERT INTO `bestellingen_has_producten` (`bestellingen_idbestelling`, `producten_idproduct`) VALUES
(3, 1),
(3, 6);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorieën`
--

CREATE TABLE `categorieën` (
  `idcategorie` int(11) NOT NULL,
  `categorienaam` varchar(255) DEFAULT NULL,
  `leveranciers_idleverancier` int(20) NOT NULL,
  `Producten_idcategorie` int(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `categorieën`
--

INSERT INTO `categorieën` (`idcategorie`, `categorienaam`, `leveranciers_idleverancier`, `Producten_idcategorie`) VALUES
(1, 'Computermuizen', 0, 0),
(2, 'Schermen', 0, 0),
(3, 'Toetsenborden', 0, 0),
(4, 'Koffiezetapparaten', 0, 0),
(5, 'Wasmachines', 0, 0),
(6, 'Tv\'s', 0, 0),
(7, 'Koelkasten', 0, 0),
(8, 'Laptops', 0, 0),
(9, 'Smartphones', 0, 0),
(10, 'Tablets', 0, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `complimenten`
--

CREATE TABLE `complimenten` (
  `idcomplimenten` int(11) NOT NULL,
  `volledigenaam` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `woonplaats` varchar(255) DEFAULT NULL,
  `geboortedatum` date DEFAULT NULL,
  `compliment` varchar(255) DEFAULT NULL,
  `Uniek` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `filter`
--

CREATE TABLE `filter` (
  `p_no` int(11) NOT NULL,
  `p_tmg` datetime(6) NOT NULL,
  `p_title` varchar(50) NOT NULL,
  `p_username` longtext NOT NULL,
  `p_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klanten`
--

CREATE TABLE `klanten` (
  `idklant` int(10) UNSIGNED NOT NULL,
  `voornaam` varchar(255) DEFAULT NULL,
  `achternaam` varchar(255) DEFAULT NULL,
  `telefoon` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `woonplaats` varchar(255) DEFAULT NULL,
  `totaalbestellingen` int(11) DEFAULT NULL,
  `totaalproducten` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='`';

--
-- Gegevens worden geëxporteerd voor tabel `klanten`
--

INSERT INTO `klanten` (`idklant`, `voornaam`, `achternaam`, `telefoon`, `email`, `woonplaats`, `totaalbestellingen`, `totaalproducten`) VALUES
(1, 'Piet', 'de Jong', 612345678, 'pietjong@gmail.com', 'Rotterdam', NULL, NULL),
(3, 'Francis', 'van de Overkant', 695672318, 'overkantjohan@hotmail.nl', 'Enschede', NULL, NULL),
(4, 'Felix', 'Stating', 678945612, 'felixofficieel@gmail.com', 'Utrecht', NULL, NULL),
(5, 'James', 'Bale', 698765432, 'james.bale@zadkine.nl', 'Urk', NULL, NULL),
(6, 'Gerard', 'niet Joling', 669696969, 'jolingnietgerard@outlook.com', 'Amsterdam', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `landen`
--

CREATE TABLE `landen` (
  `idland` int(11) NOT NULL,
  `landnaam` varchar(255) DEFAULT NULL,
  `afkortingnaam` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `landen`
--

INSERT INTO `landen` (`idland`, `landnaam`, `afkortingnaam`) VALUES
(1, 'Nederland', 'Ned'),
(2, 'Duitsland', 'Dui'),
(3, 'België', 'Bel'),
(4, 'Frankrijk', 'Fra'),
(5, 'Engeland', 'Eng'),
(6, 'Luxemburg', 'Lux'),
(7, 'Zweden', 'Zwe'),
(8, 'Australië', 'Aus'),
(9, 'Polen', 'Pol'),
(10, 'Oostenrijk', 'Oos');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leveranciers`
--

CREATE TABLE `leveranciers` (
  `idleverancier` int(11) NOT NULL,
  `leveranciernaam` varchar(45) DEFAULT NULL,
  `landen_idland` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `leveranciers`
--

INSERT INTO `leveranciers` (`idleverancier`, `leveranciernaam`, `landen_idland`) VALUES
(3, 'ElectricLife', 5),
(4, 'Online4Ever', 4),
(5, 'Telin', 1),
(6, 'MDA', 6),
(7, 'Nfindea', 8);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerkerklachten`
--

CREATE TABLE `medewerkerklachten` (
  `idmedewerkerklachten` int(11) NOT NULL,
  `volledigenaam` varchar(255) DEFAULT NULL,
  `straatnaam` varchar(255) DEFAULT NULL,
  `huisnummer` varchar(255) DEFAULT NULL,
  `klachtdatum` date DEFAULT NULL,
  `contactmanier` varchar(255) DEFAULT NULL,
  `medewerker` varchar(255) DEFAULT NULL,
  `probleem` varchar(255) DEFAULT NULL,
  `Onderwerp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `producten`
--

CREATE TABLE `producten` (
  `idproduct` int(11) NOT NULL,
  `productnaam` varchar(255) DEFAULT NULL,
  `prijs` decimal(65,2) DEFAULT NULL,
  `leveranciers_idleverancier` int(11) NOT NULL,
  `categorieën_idcategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `producten`
--

INSERT INTO `producten` (`idproduct`, `productnaam`, `prijs`, `leveranciers_idleverancier`, `categorieën_idcategorie`) VALUES
(1, 'ElecLife Supermuis 400 dpi', '65.00', 3, 1),
(2, 'Nfindea Opper 2.0 toetsenbord', '48.85', 7, 3),
(3, 'Telin wm 01 wasmachine', '450.00', 5, 5),
(4, 'Telin wm 02 wasmachine', '550.00', 5, 5),
(5, 'KoffieCups koffieapparaat 1200 editie 3', '45.99', 6, 4),
(6, 'GTZ 140 HZ gaming beeldscherm OLED', '799.99', 4, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `productklachten`
--

CREATE TABLE `productklachten` (
  `idproductklachten` int(11) NOT NULL,
  `voornaam` varchar(255) DEFAULT NULL,
  `achternaam` varchar(255) DEFAULT NULL,
  `telefoon` int(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `oplossing` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `websiteklachten`
--

CREATE TABLE `websiteklachten` (
  `idwebsiteklachten` int(11) NOT NULL,
  `volledigenaam` varchar(255) DEFAULT NULL,
  `telefoon` int(20) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `probleem` varchar(255) DEFAULT NULL,
  `oplossing` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD PRIMARY KEY (`idbestelling`),
  ADD KEY `fk_bestellingen_klanten1_idx` (`klanten_idklant`);

--
-- Indexen voor tabel `bestellingen_has_producten`
--
ALTER TABLE `bestellingen_has_producten`
  ADD PRIMARY KEY (`bestellingen_idbestelling`,`producten_idproduct`),
  ADD KEY `fk_bestellingen_has_producten_producten1_idx` (`producten_idproduct`),
  ADD KEY `fk_bestellingen_has_producten_bestellingen1_idx` (`bestellingen_idbestelling`);

--
-- Indexen voor tabel `categorieën`
--
ALTER TABLE `categorieën`
  ADD PRIMARY KEY (`idcategorie`);

--
-- Indexen voor tabel `complimenten`
--
ALTER TABLE `complimenten`
  ADD PRIMARY KEY (`idcomplimenten`);

--
-- Indexen voor tabel `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`p_no`);

--
-- Indexen voor tabel `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`idklant`);

--
-- Indexen voor tabel `landen`
--
ALTER TABLE `landen`
  ADD PRIMARY KEY (`idland`);

--
-- Indexen voor tabel `leveranciers`
--
ALTER TABLE `leveranciers`
  ADD PRIMARY KEY (`idleverancier`),
  ADD KEY `fk_leveranciers_landen1_idx` (`landen_idland`);

--
-- Indexen voor tabel `medewerkerklachten`
--
ALTER TABLE `medewerkerklachten`
  ADD PRIMARY KEY (`idmedewerkerklachten`);

--
-- Indexen voor tabel `producten`
--
ALTER TABLE `producten`
  ADD PRIMARY KEY (`idproduct`),
  ADD KEY `fk_producten_leveranciers1_idx` (`leveranciers_idleverancier`),
  ADD KEY `fk_producten_categorieën1_idx` (`categorieën_idcategorie`);

--
-- Indexen voor tabel `productklachten`
--
ALTER TABLE `productklachten`
  ADD PRIMARY KEY (`idproductklachten`);

--
-- Indexen voor tabel `websiteklachten`
--
ALTER TABLE `websiteklachten`
  ADD PRIMARY KEY (`idwebsiteklachten`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  MODIFY `idbestelling` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `categorieën`
--
ALTER TABLE `categorieën`
  MODIFY `idcategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `filter`
--
ALTER TABLE `filter`
  MODIFY `p_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `medewerkerklachten`
--
ALTER TABLE `medewerkerklachten`
  MODIFY `idmedewerkerklachten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
