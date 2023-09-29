-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 29, 2023 at 01:41 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblogin`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser` (IN `personName` VARCHAR(50), IN `personLName` VARCHAR(80), IN `personEmail` VARCHAR(150), IN `personPhone` VARCHAR(20), IN `userTypeId` INT, IN `cveUser` VARCHAR(20), IN `departament` VARCHAR(50), IN `groupStdnt` VARCHAR(20), IN `career` VARCHAR(100), IN `dependence` VARCHAR(200))   BEGIN
    DECLARE personId INT;

    -- Insertar en la tabla catpersons
    INSERT INTO catpersons (personName, personLName, personEmail, personPhone, dtCreatedAt)
    VALUES (personName, personLName, personEmail, personPhone, NOW());

    -- Obtener el ID generado para catpersons
    SET personId = LAST_INSERT_ID();

    -- Insertar en la tabla catusers
    INSERT INTO catusers (fk_personId, fk_UserTypeId, cveUser, userPass, departament, groupStdnt, career, dependence, dtCreatedAt)
    VALUES (personId, userTypeId, cveUser, MD5(cveUser), departament, groupStdnt, career, dependence, NOW());

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `autores`
--

CREATE TABLE `autores` (
  `eIdAutor` int NOT NULL,
  `txtNombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catpersons`
--

CREATE TABLE `catpersons` (
  `personId` int NOT NULL,
  `personName` varchar(50) NOT NULL,
  `personLName` varchar(80) DEFAULT NULL,
  `personEmail` varchar(150) NOT NULL,
  `personPhone` varchar(20) NOT NULL,
  `dtCreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catpersons`
--

INSERT INTO `catpersons` (`personId`, `personName`, `personLName`, `personEmail`, `personPhone`, `dtCreatedAt`, `bActive`) VALUES
(1, 'Super Admin', 'Sistema', 'laboratorios_ti@utem.edu.mx', '3140000001', '2023-05-24 13:55:39', b'1'),
(2, 'Administrador', 'Biblioteca', 'admin-biblio@utem.edu.mx', '3140000002', '2023-05-24 13:55:39', b'1'),
(3, 'Director', 'Carrera TI', 'direccion-ti@utem.edu.mx', '3140000003', '2023-05-24 13:55:39', b'1'),
(4, 'Docente', 'TI', 'docente-ti@utem.edu.mx', '3140000004', '2023-05-24 13:55:39', b'1'),
(5, 'Alumno', 'Pruebas1', 'a20230001@utem.edu.mx', '3140000005', '2023-05-24 13:55:39', b'1'),
(6, 'Externo', 'CETis', 'laboratorios_ti@utem.edu.mx', '3140000006', '2023-05-24 13:55:39', b'1'),
(7, 'Juan', 'Fernandez', 'iscjuanmafa@gmail.com', '3122100436', '2023-09-28 13:02:04', b'1'),
(8, 'Juan Manuel', 'Fernández Alvarez', 'manuel-fernandez@utem.edu.mx', '3122100436', '2023-09-28 13:14:27', b'1'),
(9, 'Pedro', 'Gonzalez', 'pedro_gon@algo.comn', '1234567890', '2023-09-28 13:18:57', b'1'),
(10, 'Damian', 'Hernandez', 'dam@algo.com', '3142345678', '2023-09-28 13:26:01', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `catusers`
--

CREATE TABLE `catusers` (
  `userId` int NOT NULL,
  `fk_personId` int DEFAULT NULL,
  `fk_UserTypeId` int DEFAULT NULL,
  `cveUser` varchar(20) NOT NULL,
  `userPass` varchar(50) NOT NULL,
  `departament` varchar(50) DEFAULT NULL,
  `groupStdnt` varchar(20) DEFAULT NULL,
  `career` varchar(100) DEFAULT NULL,
  `dependence` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catusers`
--

INSERT INTO `catusers` (`userId`, `fk_personId`, `fk_UserTypeId`, `cveUser`, `userPass`, `departament`, `groupStdnt`, `career`, `dependence`, `dtCreatedAt`, `bActive`) VALUES
(1, 1, 1, 'ADMIN001', 'admin123', 'Sistemas', ' ', ' ', ' ', '2023-05-24 14:00:39', b'1'),
(2, 2, 2, 'ADBI001', 'admin2023', 'Servicios Escolares', '', '', '', '2023-05-24 14:00:39', b'1'),
(4, 3, 3, 'DCTI0012', 'director2023', 'Dirección Académica', '', 'TSU e ING en TI', '', '2023-05-24 14:00:39', b'1'),
(5, 4, 4, 'PTC180399', 'docente2023', 'Dirección Académica', '', 'ING en TI', '', '2023-05-24 14:00:39', b'1'),
(6, 5, 5, 'AL20230001', 'alumno2023', 'Escolares/Académico', '3TID1', 'TSU en TI', '', '2023-05-24 14:00:39', b'1'),
(7, 6, 6, 'EX20230001', 'externo2023', '', '', '', 'CEtis', '2023-05-24 14:00:39', b'1'),
(8, 1, 3, 'user2023', '07215ef5d2943dad30887d55e0cc3074', 'Sociales', '3TID2', 'TIC', 'UTEM', '2023-06-07 09:55:00', b'1'),
(9, 7, 1, 'FEJU2309', '23f9378b21fc2837a62e0e0ed025e689', 'acad', '1TID1', 'TSU en TI', 'UTeM', '2023-09-28 13:02:04', b'1'),
(10, 8, 4, 'FEJU2309', '23f9378b21fc2837a62e0e0ed025e689', 'Académico', '1TID1', 'TSU en TI', 'UTeM', '2023-09-28 13:14:27', b'1'),
(11, 9, 6, 'GOPE2309', 'f955f90118e99d8ce5585095a43d2fa9', 'Recursos Humanos', 'NA', 'NA', 'ASIPONA', '2023-09-28 13:18:57', b'1'),
(12, 10, 3, 'HEDA2309', 'b8e448e111fb659c1cee7c2625505ed5', 'Escolares', 'NA', 'NA', 'UTeM', '2023-09-28 13:26:01', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `catusertypes`
--

CREATE TABLE `catusertypes` (
  `userTypeId` int NOT NULL,
  `userType` varchar(50) NOT NULL,
  `typeDesc` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catusertypes`
--

INSERT INTO `catusertypes` (`userTypeId`, `userType`, `typeDesc`, `dtCreatedAt`) VALUES
(1, 'Super Administrador', NULL, '2023-05-24 13:34:40'),
(2, 'Administrador Biblioteca', NULL, '2023-05-24 13:39:38'),
(3, 'Administrativo', NULL, '2023-05-24 13:39:37'),
(4, 'Docente', NULL, '2023-05-24 13:39:36'),
(5, 'Alumno', NULL, '2023-05-24 13:39:36'),
(6, 'Externo', NULL, '2023-05-24 13:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `ejemplares`
--

CREATE TABLE `ejemplares` (
  `eIdEjemplar` int NOT NULL,
  `fkeIdLibro` int DEFAULT NULL,
  `cveLibro` varchar(20) NOT NULL,
  `txtEditorial` varchar(50) NOT NULL,
  `eAnioPub` int NOT NULL,
  `txtCiudad` varchar(50) NOT NULL,
  `txtEdicion` varchar(20) NOT NULL,
  `feEdicion` date DEFAULT NULL,
  `txtPublicacion` varchar(100) DEFAULT NULL,
  `txtLTraduccion` varchar(100) DEFAULT NULL,
  `eNumPag` int DEFAULT NULL,
  `txtISBN` varchar(30) DEFAULT NULL,
  `bActivo` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libroautor`
--

CREATE TABLE `libroautor` (
  `eIdLaut` int NOT NULL,
  `fkeIdLibro` int NOT NULL,
  `fkeIdAutor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `eIdLibro` int NOT NULL,
  `txtNombreL` varchar(100) NOT NULL,
  `txtDescL` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessionId` int NOT NULL,
  `fk_userId` int NOT NULL,
  `cveSession` int NOT NULL,
  `dtLogIn` datetime DEFAULT NULL,
  `dtLogOut` datetime DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `usersactive`
-- (See below for the actual view)
--
CREATE TABLE `usersactive` (
`uId` int
,`userCode` varchar(20)
,`Pass` varchar(50)
,`UserType` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwadministrativos`
-- (See below for the actual view)
--
CREATE TABLE `vwadministrativos` (
`user_id` int
,`NumTrab` varchar(20)
,`Departamento_Area` varchar(50)
,`userActive` bit(1)
,`Nombre_Admin` varchar(50)
,`Apellidos_Admin` varchar(80)
,`Nombre_Completo_Admin` varchar(131)
,`Email_Admin` varchar(150)
,`Telefono_Admin` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwadmins`
-- (See below for the actual view)
--
CREATE TABLE `vwadmins` (
`user_id` int
,`user_code` varchar(20)
,`departament` varchar(50)
,`userActive` bit(1)
,`first_name` varchar(50)
,`last_name` varchar(80)
,`email` varchar(150)
,`phone` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwallusersdata`
-- (See below for the actual view)
--
CREATE TABLE `vwallusersdata` (
`user_id` int
,`user_code` varchar(20)
,`departament` varchar(50)
,`std_group` varchar(20)
,`career` varchar(100)
,`dependence` varchar(200)
,`userActive` bit(1)
,`first_name` varchar(50)
,`last_name` varchar(80)
,`email` varchar(150)
,`phone` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwalumnos`
-- (See below for the actual view)
--
CREATE TABLE `vwalumnos` (
`user_id` int
,`NumCtrl` varchar(20)
,`Grupo` varchar(20)
,`Carrera` varchar(100)
,`userActive` bit(1)
,`Nombre_Alumno` varchar(50)
,`Apellidos_Alumno` varchar(80)
,`Nombre_Completo_Alumno` varchar(131)
,`Email_Alumno` varchar(150)
,`Telefono_Alumno` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwdocente`
-- (See below for the actual view)
--
CREATE TABLE `vwdocente` (
`user_id` int
,`NumTrab` varchar(20)
,`Departamento_Area` varchar(50)
,`Carrera` varchar(100)
,`userActive` bit(1)
,`Nombre_Docente` varchar(50)
,`Apellidos_Docente` varchar(80)
,`Nombre_Completo_Docente` varchar(131)
,`Email_Docente` varchar(150)
,`Telefono_Docente` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexternos`
-- (See below for the actual view)
--
CREATE TABLE `vwexternos` (
`user_id` int
,`cveExterno` varchar(20)
,`Dependencia` varchar(200)
,`userActive` bit(1)
,`Nombre_Externo` varchar(50)
,`Apellidos_Externo` varchar(80)
,`Nombre_Completo_Externo` varchar(131)
,`Email_Externo` varchar(150)
,`Telefono_Externo` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwsessionsusers`
-- (See below for the actual view)
--
CREATE TABLE `vwsessionsusers` (
`userId` int
,`cveUser` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`personId` int
,`personName` varchar(50)
,`personLName` varchar(80)
,`sessionId` int
,`cveSession` int
,`dtLogIn` datetime
,`dtLogOut` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `usersactive`
--
DROP TABLE IF EXISTS `usersactive`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersactive`  AS SELECT `catusers`.`userId` AS `uId`, `catusers`.`cveUser` AS `userCode`, `catusers`.`userPass` AS `Pass`, `catusers`.`fk_UserTypeId` AS `UserType` FROM `catusers` WHERE (`catusers`.`bActive` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `vwadministrativos`
--
DROP TABLE IF EXISTS `vwadministrativos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadministrativos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumTrab`, `u`.`departament` AS `Departamento_Area`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Admin`, `p`.`personLName` AS `Apellidos_Admin`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Admin`, `p`.`personEmail` AS `Email_Admin`, `p`.`personPhone` AS `Telefono_Admin`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 3) ;

-- --------------------------------------------------------

--
-- Structure for view `vwadmins`
--
DROP TABLE IF EXISTS `vwadmins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadmins`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `user_code`, `u`.`departament` AS `departament`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `first_name`, `p`.`personLName` AS `last_name`, `p`.`personEmail` AS `email`, `p`.`personPhone` AS `phone`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` between 1 and 2) ;

-- --------------------------------------------------------

--
-- Structure for view `vwallusersdata`
--
DROP TABLE IF EXISTS `vwallusersdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwallusersdata`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `user_code`, `u`.`departament` AS `departament`, `u`.`groupStdnt` AS `std_group`, `u`.`career` AS `career`, `u`.`dependence` AS `dependence`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `first_name`, `p`.`personLName` AS `last_name`, `p`.`personEmail` AS `email`, `p`.`personPhone` AS `phone`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vwalumnos`
--
DROP TABLE IF EXISTS `vwalumnos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwalumnos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumCtrl`, `u`.`groupStdnt` AS `Grupo`, `u`.`career` AS `Carrera`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Alumno`, `p`.`personLName` AS `Apellidos_Alumno`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Alumno`, `p`.`personEmail` AS `Email_Alumno`, `p`.`personPhone` AS `Telefono_Alumno`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 5) ;

-- --------------------------------------------------------

--
-- Structure for view `vwdocente`
--
DROP TABLE IF EXISTS `vwdocente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwdocente`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumTrab`, `u`.`departament` AS `Departamento_Area`, `u`.`career` AS `Carrera`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Docente`, `p`.`personLName` AS `Apellidos_Docente`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Docente`, `p`.`personEmail` AS `Email_Docente`, `p`.`personPhone` AS `Telefono_Docente`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 4) ;

-- --------------------------------------------------------

--
-- Structure for view `vwexternos`
--
DROP TABLE IF EXISTS `vwexternos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexternos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `cveExterno`, `u`.`dependence` AS `Dependencia`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Externo`, `p`.`personLName` AS `Apellidos_Externo`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Externo`, `p`.`personEmail` AS `Email_Externo`, `p`.`personPhone` AS `Telefono_Externo`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 6) ;

-- --------------------------------------------------------

--
-- Structure for view `vwsessionsusers`
--
DROP TABLE IF EXISTS `vwsessionsusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwsessionsusers`  AS SELECT `u`.`userId` AS `userId`, `u`.`cveUser` AS `cveUser`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `p`.`personId` AS `personId`, `p`.`personName` AS `personName`, `p`.`personLName` AS `personLName`, `s`.`sessionId` AS `sessionId`, `s`.`cveSession` AS `cveSession`, `s`.`dtLogIn` AS `dtLogIn`, `s`.`dtLogOut` AS `dtLogOut` FROM (((`catusers` `u` join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) join `sessions` `s` on((`s`.`fk_userId` = `u`.`userId`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`eIdAutor`);

--
-- Indexes for table `catpersons`
--
ALTER TABLE `catpersons`
  ADD PRIMARY KEY (`personId`);

--
-- Indexes for table `catusers`
--
ALTER TABLE `catusers`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `fk_personId` (`fk_personId`),
  ADD KEY `fk_UserTypeId` (`fk_UserTypeId`);

--
-- Indexes for table `catusertypes`
--
ALTER TABLE `catusertypes`
  ADD PRIMARY KEY (`userTypeId`);

--
-- Indexes for table `ejemplares`
--
ALTER TABLE `ejemplares`
  ADD PRIMARY KEY (`eIdEjemplar`),
  ADD KEY `fkeIdLibro` (`fkeIdLibro`);

--
-- Indexes for table `libroautor`
--
ALTER TABLE `libroautor`
  ADD PRIMARY KEY (`eIdLaut`),
  ADD KEY `fkeIdLibro` (`fkeIdLibro`,`fkeIdAutor`);

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`eIdLibro`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionId`),
  ADD KEY `fk_userId` (`fk_userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catpersons`
--
ALTER TABLE `catpersons`
  MODIFY `personId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `catusers`
--
ALTER TABLE `catusers`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `catusertypes`
--
ALTER TABLE `catusertypes`
  MODIFY `userTypeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessionId` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catusers`
--
ALTER TABLE `catusers`
  ADD CONSTRAINT `catusers_ibfk_1` FOREIGN KEY (`fk_personId`) REFERENCES `catpersons` (`personId`),
  ADD CONSTRAINT `catusers_ibfk_2` FOREIGN KEY (`fk_UserTypeId`) REFERENCES `catusertypes` (`userTypeId`);

--
-- Constraints for table `ejemplares`
--
ALTER TABLE `ejemplares`
  ADD CONSTRAINT `ejemplares_ibfk_1` FOREIGN KEY (`fkeIdLibro`) REFERENCES `libros` (`eIdLibro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `libroautor`
--
ALTER TABLE `libroautor`
  ADD CONSTRAINT `libroautor_ibfk_1` FOREIGN KEY (`fkeIdLibro`) REFERENCES `libros` (`eIdLibro`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`fk_userId`) REFERENCES `catusers` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
