-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2023 a las 21:11:17
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competidor`
--

CREATE TABLE `competidor` (
  `idCompetidor` int(11) NOT NULL,
  `CI` int(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL,
  `genero` enum('Masculino','Femenino') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dojo`
--

CREATE TABLE `dojo` (
  `idDojo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kata`
--

CREATE TABLE `kata` (
  `NumKata` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llave`
--

CREATE TABLE `llave` (
  `idLlave` int(11) NOT NULL,
  `color` enum('rojo(aka)','azul(ao)','','') NOT NULL
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
  `categoria` enum('12/13 años','14/15 años','16/17 años','18 o mayores') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `grupoUsuario` enum('Administrativo','Juez','Administrador','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `competidor`
--
ALTER TABLE `competidor`
  ADD PRIMARY KEY (`idCompetidor`);

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
-- Indices de la tabla `puntua`
--
ALTER TABLE `puntua`
  ADD PRIMARY KEY (`idUsuario`,`idRonda`),
  ADD KEY `fk_puntua_ronda` (`idRonda`);

--
-- Indices de la tabla `ronda`
--
ALTER TABLE `ronda`
  ADD PRIMARY KEY (`idRonda`);

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
  MODIFY `idCompetidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dojo`
--
ALTER TABLE `dojo`
  MODIFY `idDojo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kata`
--
ALTER TABLE `kata`
  MODIFY `NumKata` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `llave`
--
ALTER TABLE `llave`
  MODIFY `idLlave` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `puntua`
--
ALTER TABLE `puntua`
  ADD CONSTRAINT `fk_puntua_ronda` FOREIGN KEY (`idRonda`) REFERENCES `ronda` (`idRonda`),
  ADD CONSTRAINT `fk_puntua_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `torneo_grupal`
--
ALTER TABLE `torneo_grupal`
  ADD CONSTRAINT `fk_torneo_grupal_torneo` FOREIGN KEY (`idTorneo`) REFERENCES `torneo` (`idTorneo`);

--
-- Filtros para la tabla `torneo_individual`
--
ALTER TABLE `torneo_individual`
  ADD CONSTRAINT `fk_torneo_individual_torneo` FOREIGN KEY (`idTorneo`) REFERENCES `torneo` (`idTorneo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
