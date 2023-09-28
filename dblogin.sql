-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-09-2023 a las 15:11:10
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dblogin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `eIdAutor` int NOT NULL,
  `txtNombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catpersons`
--

CREATE TABLE `catpersons` (
  `personId` int NOT NULL,
  `personName` varchar(50) NOT NULL,
  `personLName` varchar(80) DEFAULT NULL,
  `personEmail` varchar(150) NOT NULL,
  `personPhone` varchar(20) NOT NULL,
  `dtCreatedAt` datetime DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `catpersons`
--

INSERT INTO `catpersons` (`personId`, `personName`, `personLName`, `personEmail`, `personPhone`, `dtCreatedAt`, `bActive`) VALUES
(1, 'Super Admin', 'Sistema', 'laboratorios_ti@utem.edu.mx', '3140000001', '2023-05-24 13:55:39', b'1'),
(2, 'Administrador', 'Biblioteca', 'admin-biblio@utem.edu.mx', '3140000002', '2023-05-24 13:55:39', b'1'),
(3, 'Director', 'Carrera TI', 'direccion-ti@utem.edu.mx', '3140000003', '2023-05-24 13:55:39', b'1'),
(4, 'Docente', 'TI', 'docente-ti@utem.edu.mx', '3140000004', '2023-05-24 13:55:39', b'1'),
(5, 'Alumno', 'Pruebas1', 'a20230001@utem.edu.mx', '3140000005', '2023-05-24 13:55:39', b'1'),
(6, 'Externo', 'CETis', 'laboratorios_ti@utem.edu.mx', '3140000006', '2023-05-24 13:55:39', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catusers`
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
-- Volcado de datos para la tabla `catusers`
--

INSERT INTO `catusers` (`userId`, `fk_personId`, `fk_UserTypeId`, `cveUser`, `userPass`, `departament`, `groupStdnt`, `career`, `dependence`, `dtCreatedAt`, `bActive`) VALUES
(1, 1, 1, 'ADMIN001', 'admin123', 'Sistemas', ' ', ' ', ' ', '2023-05-24 14:00:39', b'1'),
(2, 2, 2, 'ADBI001', 'admin2023', 'Servicios Escolares', '', '', '', '2023-05-24 14:00:39', b'1'),
(4, 3, 3, 'DCTI0012', 'director2023', 'Dirección Académica', '', 'TSU e ING en TI', '', '2023-05-24 14:00:39', b'1'),
(5, 4, 4, 'PTC180399', 'docente2023', 'Dirección Académica', '', 'ING en TI', '', '2023-05-24 14:00:39', b'1'),
(6, 5, 5, 'AL20230001', 'alumno2023', 'Escolares/Académico', '3TID1', 'TSU en TI', '', '2023-05-24 14:00:39', b'1'),
(7, 6, 6, 'EX20230001', 'externo2023', '', '', '', 'CEtis', '2023-05-24 14:00:39', b'1'),
(8, 1, 3, 'user2023', '07215ef5d2943dad30887d55e0cc3074', 'Sociales', '3TID2', 'TIC', 'UTEM', '2023-06-07 09:55:00', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catusertypes`
--

CREATE TABLE `catusertypes` (
  `userTypeId` int NOT NULL,
  `userType` varchar(50) NOT NULL,
  `typeDesc` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `catusertypes`
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
-- Estructura de tabla para la tabla `ejemplares`
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
-- Estructura de tabla para la tabla `libroautor`
--

CREATE TABLE `libroautor` (
  `eIdLaut` int NOT NULL,
  `fkeIdLibro` int NOT NULL,
  `fkeIdAutor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `eIdLibro` int NOT NULL,
  `txtNombreL` varchar(100) NOT NULL,
  `txtDescL` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
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
-- Estructura Stand-in para la vista `usersactive`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usersactive` (
`Pass` varchar(50)
,`uId` int
,`userCode` varchar(20)
,`UserType` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwadministrativos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwadministrativos` (
`Apellidos_Admin` varchar(80)
,`Departamento_Area` varchar(50)
,`Email_Admin` varchar(150)
,`Nombre_Admin` varchar(50)
,`Nombre_Completo_Admin` varchar(131)
,`NumTrab` varchar(20)
,`Telefono_Admin` varchar(20)
,`typeDesc` varchar(200)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwadmins`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwadmins` (
`departament` varchar(50)
,`email` varchar(150)
,`first_name` varchar(50)
,`last_name` varchar(80)
,`phone` varchar(20)
,`typeDesc` varchar(200)
,`user_code` varchar(20)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwallusersdata`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwallusersdata` (
`career` varchar(100)
,`departament` varchar(50)
,`dependence` varchar(200)
,`email` varchar(150)
,`first_name` varchar(50)
,`last_name` varchar(80)
,`phone` varchar(20)
,`std_group` varchar(20)
,`typeDesc` varchar(200)
,`user_code` varchar(20)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwalumnos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwalumnos` (
`Apellidos_Alumno` varchar(80)
,`Carrera` varchar(100)
,`Email_Alumno` varchar(150)
,`Grupo` varchar(20)
,`Nombre_Alumno` varchar(50)
,`Nombre_Completo_Alumno` varchar(131)
,`NumCtrl` varchar(20)
,`Telefono_Alumno` varchar(20)
,`typeDesc` varchar(200)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwdocente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwdocente` (
`Apellidos_Docente` varchar(80)
,`Carrera` varchar(100)
,`Departamento_Area` varchar(50)
,`Email_Docente` varchar(150)
,`Nombre_Completo_Docente` varchar(131)
,`Nombre_Docente` varchar(50)
,`NumTrab` varchar(20)
,`Telefono_Docente` varchar(20)
,`typeDesc` varchar(200)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwexternos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwexternos` (
`Apellidos_Externo` varchar(80)
,`cveExterno` varchar(20)
,`Dependencia` varchar(200)
,`Email_Externo` varchar(150)
,`Nombre_Completo_Externo` varchar(131)
,`Nombre_Externo` varchar(50)
,`Telefono_Externo` varchar(20)
,`typeDesc` varchar(200)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwsessionsusers`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwsessionsusers` (
`cveSession` int
,`cveUser` varchar(20)
,`dtLogIn` datetime
,`dtLogOut` datetime
,`personId` int
,`personLName` varchar(80)
,`personName` varchar(50)
,`sessionId` int
,`userId` int
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura para la vista `usersactive`
--
DROP TABLE IF EXISTS `usersactive`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersactive`  AS SELECT `catusers`.`userId` AS `uId`, `catusers`.`cveUser` AS `userCode`, `catusers`.`userPass` AS `Pass`, `catusers`.`fk_UserTypeId` AS `UserType` FROM `catusers` WHERE (`catusers`.`bActive` = 1) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwadministrativos`
--
DROP TABLE IF EXISTS `vwadministrativos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadministrativos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumTrab`, `u`.`departament` AS `Departamento_Area`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Admin`, `p`.`personLName` AS `Apellidos_Admin`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Admin`, `p`.`personEmail` AS `Email_Admin`, `p`.`personPhone` AS `Telefono_Admin`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 3) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwadmins`
--
DROP TABLE IF EXISTS `vwadmins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadmins`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `user_code`, `u`.`departament` AS `departament`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `first_name`, `p`.`personLName` AS `last_name`, `p`.`personEmail` AS `email`, `p`.`personPhone` AS `phone`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` between 1 and 2) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwallusersdata`
--
DROP TABLE IF EXISTS `vwallusersdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwallusersdata`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `user_code`, `u`.`departament` AS `departament`, `u`.`groupStdnt` AS `std_group`, `u`.`career` AS `career`, `u`.`dependence` AS `dependence`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `first_name`, `p`.`personLName` AS `last_name`, `p`.`personEmail` AS `email`, `p`.`personPhone` AS `phone`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwalumnos`
--
DROP TABLE IF EXISTS `vwalumnos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwalumnos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumCtrl`, `u`.`groupStdnt` AS `Grupo`, `u`.`career` AS `Carrera`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Alumno`, `p`.`personLName` AS `Apellidos_Alumno`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Alumno`, `p`.`personEmail` AS `Email_Alumno`, `p`.`personPhone` AS `Telefono_Alumno`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 5) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwdocente`
--
DROP TABLE IF EXISTS `vwdocente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwdocente`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumTrab`, `u`.`departament` AS `Departamento_Area`, `u`.`career` AS `Carrera`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Docente`, `p`.`personLName` AS `Apellidos_Docente`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Docente`, `p`.`personEmail` AS `Email_Docente`, `p`.`personPhone` AS `Telefono_Docente`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 4) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwexternos`
--
DROP TABLE IF EXISTS `vwexternos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexternos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `cveExterno`, `u`.`dependence` AS `Dependencia`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Externo`, `p`.`personLName` AS `Apellidos_Externo`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Externo`, `p`.`personEmail` AS `Email_Externo`, `p`.`personPhone` AS `Telefono_Externo`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 6) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwsessionsusers`
--
DROP TABLE IF EXISTS `vwsessionsusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwsessionsusers`  AS SELECT `u`.`userId` AS `userId`, `u`.`cveUser` AS `cveUser`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `p`.`personId` AS `personId`, `p`.`personName` AS `personName`, `p`.`personLName` AS `personLName`, `s`.`sessionId` AS `sessionId`, `s`.`cveSession` AS `cveSession`, `s`.`dtLogIn` AS `dtLogIn`, `s`.`dtLogOut` AS `dtLogOut` FROM (((`catusers` `u` join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) join `sessions` `s` on((`s`.`fk_userId` = `u`.`userId`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`eIdAutor`);

--
-- Indices de la tabla `catpersons`
--
ALTER TABLE `catpersons`
  ADD PRIMARY KEY (`personId`);

--
-- Indices de la tabla `catusers`
--
ALTER TABLE `catusers`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `fk_personId` (`fk_personId`),
  ADD KEY `fk_UserTypeId` (`fk_UserTypeId`);

--
-- Indices de la tabla `catusertypes`
--
ALTER TABLE `catusertypes`
  ADD PRIMARY KEY (`userTypeId`);

--
-- Indices de la tabla `ejemplares`
--
ALTER TABLE `ejemplares`
  ADD PRIMARY KEY (`eIdEjemplar`),
  ADD KEY `fkeIdLibro` (`fkeIdLibro`);

--
-- Indices de la tabla `libroautor`
--
ALTER TABLE `libroautor`
  ADD PRIMARY KEY (`eIdLaut`),
  ADD KEY `fkeIdLibro` (`fkeIdLibro`,`fkeIdAutor`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`eIdLibro`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionId`),
  ADD KEY `fk_userId` (`fk_userId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catpersons`
--
ALTER TABLE `catpersons`
  MODIFY `personId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `catusers`
--
ALTER TABLE `catusers`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `catusertypes`
--
ALTER TABLE `catusertypes`
  MODIFY `userTypeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessionId` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catusers`
--
ALTER TABLE `catusers`
  ADD CONSTRAINT `catusers_ibfk_1` FOREIGN KEY (`fk_personId`) REFERENCES `catpersons` (`personId`),
  ADD CONSTRAINT `catusers_ibfk_2` FOREIGN KEY (`fk_UserTypeId`) REFERENCES `catusertypes` (`userTypeId`);

--
-- Filtros para la tabla `ejemplares`
--
ALTER TABLE `ejemplares`
  ADD CONSTRAINT `ejemplares_ibfk_1` FOREIGN KEY (`fkeIdLibro`) REFERENCES `libros` (`eIdLibro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libroautor`
--
ALTER TABLE `libroautor`
  ADD CONSTRAINT `libroautor_ibfk_1` FOREIGN KEY (`fkeIdLibro`) REFERENCES `libros` (`eIdLibro`);

--
-- Filtros para la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`fk_userId`) REFERENCES `catusers` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
