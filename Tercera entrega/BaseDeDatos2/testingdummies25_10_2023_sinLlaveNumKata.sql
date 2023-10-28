-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2023 a las 17:23:19
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `testingdummies`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiste`
--

CREATE TABLE `asiste` (
  `idUsuario` int(11) NOT NULL,
  `idTorneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `asiste`
--

INSERT INTO `asiste` (`idUsuario`, `idTorneo`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coach`
--

CREATE TABLE `coach` (
  `CI` int(8) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Nombre` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellido` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competidor`
--

CREATE TABLE `competidor` (
  `idcompetidor` int(11) NOT NULL,
  `CI` int(8) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `genero` enum('Masculino','Femenino') COLLATE utf8_spanish2_ci NOT NULL,
  `IDDojo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `competidor`
--

INSERT INTO `competidor` (`idcompetidor`, `CI`, `nombre`, `apellido`, `fecha_nac`, `genero`, `IDDojo`) VALUES
(1, 55499749, 'Pepe', 'Josefo', '2005-11-11', 'Femenino', 1),
(2, 55499743, 'Pep2', 'Josef2', '2005-12-12', 'Femenino', 1),
(3, 55499739, 'Pepepina', 'Josefina', '2003-11-11', 'Masculino', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compiten`
--

CREATE TABLE `compiten` (
  `idcompetidor` int(11) NOT NULL,
  `idTorneo` int(11) NOT NULL,
  `NumKata` int(11) NOT NULL,
  `puesto` int(11) NOT NULL,
  `Categoria` enum('12/13','14/15','16/17','Mayores') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `compiten`
--

INSERT INTO `compiten` (`idcompetidor`, `idTorneo`, `NumKata`, `puesto`, `Categoria`) VALUES
(1, 3, 1, 1, '16/17'),
(2, 1, 1, 3, '12/13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componen`
--

CREATE TABLE `componen` (
  `idRonda` int(11) NOT NULL,
  `idTorneo` int(11) NOT NULL,
  `idcompetidor` int(11) NOT NULL,
  `resultado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `componen`
--

INSERT INTO `componen` (`idRonda`, `idTorneo`, `idcompetidor`, `resultado`) VALUES
(1, 1, 1, 1),
(1, 1, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contituye`
--

CREATE TABLE `contituye` (
  `NumKata` int(11) NOT NULL,
  `idcompetidor` int(11) NOT NULL,
  `idRonda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `contituye`
--

INSERT INTO `contituye` (`NumKata`, `idcompetidor`, `idRonda`) VALUES
(1, 1, 1),
(102, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dirige`
--

CREATE TABLE `dirige` (
  `CI` int(20) NOT NULL,
  `IDDojo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dojo`
--

CREATE TABLE `dojo` (
  `idDojo` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `escuela` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `dojo`
--

INSERT INTO `dojo` (`idDojo`, `nombre`, `escuela`) VALUES
(1, 'messi', 'laescuelademessi'),
(2, 'messi2', 'messint');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kata`
--

CREATE TABLE `kata` (
  `NumKata` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `kata`
--

INSERT INTO `kata` (`NumKata`, `Nombre`) VALUES
(1, 'Anan'),
(2, 'Anan Dai'),
(3, 'Ananko'),
(4, 'Aoyagi'),
(5, 'Bassai'),
(6, 'Bassai Dai'),
(7, 'Bassai Sho'),
(8, 'Chatanyara Kusanku'),
(9, 'Chibana No Kushanku'),
(10, 'Chinte'),
(11, 'Chinto'),
(12, 'Empi'),
(13, 'Fukyugata Ichi'),
(14, 'Fukyugata Ni'),
(15, 'Gankaku'),
(16, 'Garyu'),
(17, 'Gekisai (Geksai) 1'),
(18, 'Gekisai (Geksai) 2'),
(19, 'Gojushiho'),
(20, 'Gojushiho Dai'),
(21, 'Gojushaho Sho'),
(22, 'Hakucho'),
(23, 'Hangetsu'),
(24, 'Haufa (Haffa)'),
(25, 'Heian Shodan'),
(26, 'Heian Nidan'),
(27, 'Heian Sandan'),
(28, 'Heian Yondan'),
(29, 'Heian Godan'),
(30, 'Heiku'),
(31, 'Ishimine Bassai'),
(32, 'Itosu Rohai Shodan'),
(33, 'Itosu Rohai Nidan'),
(34, 'Itosu Rohai Sandan'),
(35, 'Jün'),
(36, 'Jion'),
(37, 'Jitte'),
(38, 'Juroku'),
(39, 'Kanchin'),
(40, 'Kanku Dai'),
(41, 'Kanku Sho'),
(42, 'Kanshu'),
(43, 'Kishimoto No Kushanku'),
(44, 'Kousoukum'),
(45, 'Kousoukum Dai'),
(46, 'Kousoukun Sho'),
(47, 'Kururunfa'),
(48, 'Kusanku'),
(49, 'Kyan No Chinto'),
(50, 'Kyan No Wanshu'),
(51, 'Matsukaze'),
(52, 'Matsumura Bassai'),
(53, 'Matsumura Rohai'),
(54, 'Meikyo'),
(55, 'Myojo'),
(56, 'Naifanchin Shodan'),
(57, 'Naifanchin Nidan'),
(58, 'Naifanchin Sandan'),
(59, 'Naihanchi'),
(60, 'Nijushiho'),
(61, 'Nipaipo'),
(62, 'Niseishi'),
(63, 'Ohan'),
(64, 'Ohan Dai'),
(65, 'Oyadomari No Passai'),
(66, 'Pachu'),
(67, 'Paiku'),
(68, 'Papuren'),
(69, ' Passai'),
(70, 'Pinan Shodan'),
(71, 'Pinan Nidan'),
(72, 'Pinan Sandan'),
(73, 'Pinan Yondan'),
(74, 'Pinan Godan'),
(75, 'Rohai'),
(76, 'Saifa'),
(77, 'Sanchin'),
(78, 'Sansai'),
(79, 'Sanseiru'),
(80, 'Sanseru'),
(81, 'Seichin'),
(82, 'Seienchin (Seiyunchin)'),
(83, 'Seipai'),
(84, 'Seiryu'),
(85, 'Seishan'),
(86, 'Seisan (Sesan)'),
(87, 'Shiho Kousoukun'),
(88, 'Shinpa'),
(89, 'Shinsei'),
(90, 'Shisochin'),
(91, 'Sochin'),
(92, 'Suparinpei'),
(93, 'Tekki Shodan'),
(94, 'Tekki Nidan'),
(95, 'Tekki Sandan'),
(96, 'Tensho'),
(97, 'Temari Bassai'),
(98, 'Unshu'),
(99, 'Unsu'),
(100, 'Useishi'),
(101, 'Wankan'),
(102, 'Wanshu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llave`
--

CREATE TABLE `llave` (
  `idLlave` int(11) NOT NULL,
  `color` enum('rojo(aka)','azul(ao)') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `llave`
--

INSERT INTO `llave` (`idLlave`, `color`) VALUES
(1, 'rojo(aka)'),
(2, 'azul(ao)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntaje`
--

CREATE TABLE `puntaje` (
  `idpuntaje` int(11) NOT NULL,
  `puntaje` decimal(4,2) NOT NULL,
  `IdCompetidor` int(11) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `IdRonda` int(11) DEFAULT NULL,
  `NumKata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `puntaje`
--

INSERT INTO `puntaje` (`idpuntaje`, `puntaje`, `IdCompetidor`, `IdUsuario`, `IdRonda`, `NumKata`) VALUES
(1, '9.20', 1, 1, 1, 1),
(2, '3.20', 1, 3, 1, 2),
(3, '9.30', 1, 2, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `NumKata` int(11) NOT NULL,
  `idcompetidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `realiza`
--

INSERT INTO `realiza` (`NumKata`, `idcompetidor`) VALUES
(1, 1),
(2, 1),
(102, 2),
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ronda`
--

CREATE TABLE `ronda` (
  `idRonda` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinilizacion` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFinilizacion` time NOT NULL,
  `Idllave` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ronda`
--

INSERT INTO `ronda` (`idRonda`, `fechaInicio`, `fechaFinilizacion`, `horaInicio`, `horaFinilizacion`, `Idllave`) VALUES
(1, '1002-11-11', '2005-11-11', '20:20:00', '22:22:00', 1),
(2, '1002-11-11', '2005-11-11', '21:20:00', '23:22:00', 2),
(3, '2023-11-11', '2023-12-12', '12:12:00', '13:12:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `idTorneo` int(11) NOT NULL,
  `ubicacion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `Genero` enum('Masculino','Femenino','','') COLLATE utf8_spanish2_ci NOT NULL,
  `Tipo` enum('Individual','Grupal','','') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`idTorneo`, `ubicacion`, `fecha`, `hora`, `Genero`, `Tipo`) VALUES
(1, 'san gomes', '1001-11-11', '20:00:00', 'Masculino', 'Individual'),
(2, ' gomes', '1001-12-11', '21:00:00', 'Masculino', 'Individual'),
(3, 'san peron', '2023-10-18', '20:00:00', 'Masculino', 'Individual'),
(4, 'San peru', '2023-12-10', '20:20:00', 'Masculino', 'Individual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` enum('Juez1','Juez2','Juez3','Juez4','Juez5','Juez6','Juez7','Administrador','AdministradorBDKarate') COLLATE utf8_spanish2_ci NOT NULL,
  `contraseña` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `grupoUsuario` enum('Juez','Administrador','AdministradorBDKarate','Juez1') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `contraseña`, `grupoUsuario`) VALUES
(1, 'Juez1', 'AlterOlsztyn4', 'Juez'),
(2, 'Juez2', 'Pepe', 'Juez'),
(3, 'Juez3', 'Pepe1', 'Juez'),
(4, 'Administrador', 'PepeAdmin', 'Administrador'),
(5, 'AdministradorBDKarate', 'PepeBD', 'AdministradorBDKarate');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asiste`
--
ALTER TABLE `asiste`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_asiste_torneo` (`idTorneo`);

--
-- Indices de la tabla `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`CI`);

--
-- Indices de la tabla `competidor`
--
ALTER TABLE `competidor`
  ADD PRIMARY KEY (`idcompetidor`),
  ADD KEY `IDDojo` (`IDDojo`);

--
-- Indices de la tabla `compiten`
--
ALTER TABLE `compiten`
  ADD PRIMARY KEY (`idcompetidor`,`idTorneo`),
  ADD KEY `fk_compiten_torneo` (`idTorneo`);

--
-- Indices de la tabla `componen`
--
ALTER TABLE `componen`
  ADD PRIMARY KEY (`idRonda`,`idTorneo`,`idcompetidor`);

--
-- Indices de la tabla `contituye`
--
ALTER TABLE `contituye`
  ADD PRIMARY KEY (`NumKata`,`idcompetidor`,`idRonda`),
  ADD KEY `fk_contituye_ronda` (`idRonda`);

--
-- Indices de la tabla `dirige`
--
ALTER TABLE `dirige`
  ADD KEY `CI` (`CI`),
  ADD KEY `IDDojo` (`IDDojo`);

--
-- Indices de la tabla `dojo`
--
ALTER TABLE `dojo`
  ADD PRIMARY KEY (`idDojo`);

--
-- Indices de la tabla `kata`
--
ALTER TABLE `kata`
  ADD PRIMARY KEY (`NumKata`);

--
-- Indices de la tabla `llave`
--
ALTER TABLE `llave`
  ADD PRIMARY KEY (`idLlave`);

--
-- Indices de la tabla `puntaje`
--
ALTER TABLE `puntaje`
  ADD PRIMARY KEY (`idpuntaje`),
  ADD KEY `IdCompetidor` (`IdCompetidor`),
  ADD KEY `IdUsuario` (`IdUsuario`),
  ADD KEY `IdRonda` (`IdRonda`),
  ADD KEY `NumKata` (`NumKata`);

--
-- Indices de la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD KEY `fk_realiza_competidor` (`idcompetidor`);

--
-- Indices de la tabla `ronda`
--
ALTER TABLE `ronda`
  ADD PRIMARY KEY (`idRonda`),
  ADD KEY `Idllave` (`Idllave`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`idTorneo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `competidor`
--
ALTER TABLE `competidor`
  MODIFY `idcompetidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `dojo`
--
ALTER TABLE `dojo`
  MODIFY `idDojo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `kata`
--
ALTER TABLE `kata`
  MODIFY `NumKata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `puntaje`
--
ALTER TABLE `puntaje`
  MODIFY `idpuntaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ronda`
--
ALTER TABLE `ronda`
  MODIFY `idRonda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiste`
--
ALTER TABLE `asiste`
  ADD CONSTRAINT `fk_asiste_torneo` FOREIGN KEY (`idTorneo`) REFERENCES `torneo` (`idTorneo`),
  ADD CONSTRAINT `fk_asiste_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `competidor`
--
ALTER TABLE `competidor`
  ADD CONSTRAINT `competidor_ibfk_1` FOREIGN KEY (`IDDojo`) REFERENCES `dojo` (`idDojo`);

--
-- Filtros para la tabla `compiten`
--
ALTER TABLE `compiten`
  ADD CONSTRAINT `compiten_ibfk_1` FOREIGN KEY (`idcompetidor`) REFERENCES `competidor` (`idcompetidor`),
  ADD CONSTRAINT `compiten_ibfk_2` FOREIGN KEY (`idTorneo`) REFERENCES `torneo` (`idTorneo`);

--
-- Filtros para la tabla `dirige`
--
ALTER TABLE `dirige`
  ADD CONSTRAINT `dirige_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `coach` (`CI`),
  ADD CONSTRAINT `dirige_ibfk_2` FOREIGN KEY (`IDDojo`) REFERENCES `dojo` (`idDojo`);

--
-- Filtros para la tabla `puntaje`
--
ALTER TABLE `puntaje`
  ADD CONSTRAINT `puntaje_ibfk_1` FOREIGN KEY (`IdCompetidor`) REFERENCES `competidor` (`idcompetidor`),
  ADD CONSTRAINT `puntaje_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `puntaje_ibfk_3` FOREIGN KEY (`IdRonda`) REFERENCES `ronda` (`idRonda`),
  ADD CONSTRAINT `puntaje_ibfk_4` FOREIGN KEY (`NumKata`) REFERENCES `kata` (`NumKata`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
