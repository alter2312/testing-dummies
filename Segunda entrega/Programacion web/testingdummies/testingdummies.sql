-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-09-2023 a las 15:49:29
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
  `FotoCompetidor` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compiten`
--

CREATE TABLE `compiten` (
  `idcompetidor` int(11) NOT NULL,
  `idTorneo` int(11) NOT NULL,
  `puesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componen`
--

CREATE TABLE `componen` (
  `idRonda` int(11) NOT NULL,
  `idLlave` int(11) NOT NULL,
  `idTorneo` int(11) NOT NULL,
  `idcompetidor` int(11) NOT NULL,
  `resultado` enum('Gano','Perdio') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contituye`
--

CREATE TABLE `contituye` (
  `NumKata` int(11) NOT NULL,
  `idcompetidor` int(11) NOT NULL,
  `idRonda` int(11) NOT NULL
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kata`
--

CREATE TABLE `kata` (
  `NumKata` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llave`
--

CREATE TABLE `llave` (
  `idLlave` int(11) NOT NULL,
  `color` enum('rojo(aka)','azul(ao)') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pertenecen`
--

CREATE TABLE `pertenecen` (
  `idcompetidor` int(11) NOT NULL,
  `idDojo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntua`
--

CREATE TABLE `puntua` (
  `idUsuario` int(11) NOT NULL,
  `idRonda` int(11) NOT NULL,
  `Puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `NumKata` int(11) NOT NULL,
  `idcompetidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ronda`
--

CREATE TABLE `ronda` (
  `idRonda` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinilizacion` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFinilizacion` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `se_separa_en`
--

CREATE TABLE `se_separa_en` (
  `idRonda` int(11) NOT NULL,
  `idLlave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `idTorneo` int(11) NOT NULL,
  `ubicacion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo_grupal`
--

CREATE TABLE `torneo_grupal` (
  `idTorneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo_individual`
--

CREATE TABLE `torneo_individual` (
  `idTorneo` int(11) NOT NULL,
  `categoria` enum('12/13 años','14/15 años','16/17 años','18 o mayores') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` enum('Juez1','Juez2','Juez3','Juez4','Juez5','Juez6','Juez7','Administrador','AdministradorBDKarate') COLLATE utf8_spanish2_ci NOT NULL,
  `contraseña` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `grupoUsuario` enum('Juez','Administrador','AdministradorBDKarate') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `contraseña`, `grupoUsuario`) VALUES
(1, 'Juez1', 'AlterOlsztyn4', 'Juez');

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
-- Indices de la tabla `competidor`
--
ALTER TABLE `competidor`
  ADD PRIMARY KEY (`idcompetidor`);

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
  ADD PRIMARY KEY (`idRonda`,`idLlave`,`idTorneo`,`idcompetidor`);

--
-- Indices de la tabla `contituye`
--
ALTER TABLE `contituye`
  ADD PRIMARY KEY (`NumKata`,`idcompetidor`,`idRonda`),
  ADD KEY `fk_contituye_ronda` (`idRonda`);

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
-- Indices de la tabla `puntua`
--
ALTER TABLE `puntua`
  ADD PRIMARY KEY (`idUsuario`,`idRonda`),
  ADD KEY `fk_puntua_ronda` (`idRonda`);

--
-- Indices de la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD PRIMARY KEY (`NumKata`,`idcompetidor`),
  ADD KEY `fk_realiza_competidor` (`idcompetidor`);

--
-- Indices de la tabla `ronda`
--
ALTER TABLE `ronda`
  ADD PRIMARY KEY (`idRonda`);

--
-- Indices de la tabla `se_separa_en`
--
ALTER TABLE `se_separa_en`
  ADD PRIMARY KEY (`idRonda`,`idLlave`),
  ADD KEY `fk_se_separa_en_llave` (`idLlave`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`idTorneo`);

--
-- Indices de la tabla `torneo_grupal`
--
ALTER TABLE `torneo_grupal`
  ADD PRIMARY KEY (`idTorneo`);

--
-- Indices de la tabla `torneo_individual`
--
ALTER TABLE `torneo_individual`
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
  MODIFY `idDojo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `kata`
--
ALTER TABLE `kata`
  MODIFY `NumKata` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ronda`
--
ALTER TABLE `ronda`
  MODIFY `idRonda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `torneo_grupal`
--
ALTER TABLE `torneo_grupal`
  MODIFY `idTorneo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Filtros para la tabla `componen`
--
ALTER TABLE `componen`
  ADD CONSTRAINT `fk_componen_se_separa_en` FOREIGN KEY (`idRonda`,`idLlave`) REFERENCES `se_separa_en` (`idRonda`, `idLlave`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
