-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 23, 2026 kell 10:32 EL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `titpv24baas`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `opetaja`
--

CREATE TABLE `opetaja` (
  `opetajaID` int(11) NOT NULL,
  `nimi` varchar(25) DEFAULT NULL,
  `epost` varchar(40) DEFAULT NULL,
  `ruum` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `opetaja`
--

INSERT INTO `opetaja` (`opetajaID`, `nimi`, `epost`, `ruum`) VALUES
(1, 'Merkulova Irina', 'merkulova.irina@tthk.ee', 'E03'),
(2, 'Markus Lehtla', 'markus.lehtla@tthk.ee', 'A116');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `opilane`
--

CREATE TABLE `opilane` (
  `opilaneID` int(11) NOT NULL,
  `eesnimi` varchar(25) DEFAULT NULL,
  `perenimi` varchar(30) NOT NULL,
  `synniaeg` date DEFAULT NULL,
  `stip` bit(1) DEFAULT NULL,
  `mobiil` varchar(13) DEFAULT NULL,
  `aadress` text DEFAULT NULL,
  `keskmineHinne` decimal(2,1) DEFAULT NULL,
  `ryhmId` int(11) DEFAULT NULL,
  `ryhm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `opilane`
--

INSERT INTO `opilane` (`opilaneID`, `eesnimi`, `perenimi`, `synniaeg`, `stip`, `mobiil`, `aadress`, `keskmineHinne`, `ryhmId`, `ryhm`) VALUES
(1, 'Lev', 'Valge', '2026-04-16', b'0', '85858574', 'Tartu,Narva,Muhosransk', 4.5, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `opitamine`
--

CREATE TABLE `opitamine` (
  `opetamineID` int(11) NOT NULL,
  `kuupaev` date DEFAULT NULL,
  `oppeaine` varchar(30) DEFAULT NULL,
  `opilaneID` int(11) DEFAULT NULL,
  `hinne` int(11) DEFAULT NULL CHECK (`hinne` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `opitamine`
--

INSERT INTO `opitamine` (`opetamineID`, `kuupaev`, `oppeaine`, `opilaneID`, `hinne`) VALUES
(1, NULL, 'Andmebaasid', 1, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `ryhm`
--

CREATE TABLE `ryhm` (
  `ryhmId` int(11) NOT NULL,
  `ryhmNimi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `ryhm`
--

INSERT INTO `ryhm` (`ryhmId`, `ryhmNimi`) VALUES
(2, 'LOGITpv24'),
(1, 'TiTpv24');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tund`
--

CREATE TABLE `tund` (
  `tundID` int(11) NOT NULL,
  `kuupaev` date DEFAULT NULL,
  `tundinimi` varchar(30) DEFAULT NULL,
  `opetajaID` int(11) DEFAULT NULL,
  `opetamineID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tund`
--

INSERT INTO `tund` (`tundID`, `kuupaev`, `tundinimi`, `opetajaID`, `opetamineID`) VALUES
(1, '2016-05-11', 'Andmebaasid', 1, 1);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `opetaja`
--
ALTER TABLE `opetaja`
  ADD PRIMARY KEY (`opetajaID`);

--
-- Indeksid tabelile `opilane`
--
ALTER TABLE `opilane`
  ADD PRIMARY KEY (`opilaneID`),
  ADD KEY `fk_ryhm` (`ryhm`);

--
-- Indeksid tabelile `opitamine`
--
ALTER TABLE `opitamine`
  ADD PRIMARY KEY (`opetamineID`),
  ADD KEY `opilaneID` (`opilaneID`);

--
-- Indeksid tabelile `ryhm`
--
ALTER TABLE `ryhm`
  ADD PRIMARY KEY (`ryhmId`),
  ADD UNIQUE KEY `ryhmNimi` (`ryhmNimi`);

--
-- Indeksid tabelile `tund`
--
ALTER TABLE `tund`
  ADD PRIMARY KEY (`tundID`),
  ADD KEY `opetajaID` (`opetajaID`),
  ADD KEY `opetamineID` (`opetamineID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `opetaja`
--
ALTER TABLE `opetaja`
  MODIFY `opetajaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `opilane`
--
ALTER TABLE `opilane`
  MODIFY `opilaneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `opitamine`
--
ALTER TABLE `opitamine`
  MODIFY `opetamineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `ryhm`
--
ALTER TABLE `ryhm`
  MODIFY `ryhmId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `tund`
--
ALTER TABLE `tund`
  MODIFY `tundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `opilane`
--
ALTER TABLE `opilane`
  ADD CONSTRAINT `fk_ryhm` FOREIGN KEY (`ryhm`) REFERENCES `ryhm` (`ryhmId`);

--
-- Piirangud tabelile `opitamine`
--
ALTER TABLE `opitamine`
  ADD CONSTRAINT `opitamine_ibfk_1` FOREIGN KEY (`opilaneID`) REFERENCES `opilane` (`opilaneID`);

--
-- Piirangud tabelile `tund`
--
ALTER TABLE `tund`
  ADD CONSTRAINT `tund_ibfk_1` FOREIGN KEY (`opetajaID`) REFERENCES `opetaja` (`opetajaID`),
  ADD CONSTRAINT `tund_ibfk_2` FOREIGN KEY (`opetamineID`) REFERENCES `opitamine` (`opetamineID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
