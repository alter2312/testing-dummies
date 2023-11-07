-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2023 a las 00:18:22
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

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
  `IDTorneo` int(11) NOT NULL,
  `IDUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coach`
--

CREATE TABLE `coach` (
  `CI` int(8) NOT NULL,
  `Apellido` varchar(11) NOT NULL,
  `Nombre` varchar(11) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competidor`
--

CREATE TABLE `competidor` (
  `IDCompetidor` int(11) NOT NULL,
  `CI` int(8) NOT NULL,
  `Fecha_Nac` date NOT NULL,
  `Nombre` varchar(11) NOT NULL,
  `Apellido` varchar(11) NOT NULL,
  `Genero` enum('Masculino','Femenino','','') NOT NULL,
  `IDDojo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compite`
--

CREATE TABLE `compite` (
  `IDEquipo` int(11) NOT NULL,
  `IDTorneo` int(11) NOT NULL,
  `Categoria` enum('12/13','14/15','16/17','18/mayores') NOT NULL,
  `Puesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componen`
--

CREATE TABLE `componen` (
  `IDEquipo` int(11) NOT NULL,
  `IDRonda` int(11) NOT NULL,
  `IDTorneo` int(11) NOT NULL,
  `Resultado` enum('Gano','Perdio','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conforma`
--

CREATE TABLE `conforma` (
  `IDCompetidor` int(11) NOT NULL,
  `IDEquipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constituye`
--

CREATE TABLE `constituye` (
  `IDEquipo` int(11) NOT NULL,
  `IDRonda` int(11) NOT NULL,
  `NumKata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dirige`
--

CREATE TABLE `dirige` (
  `CI` int(8) NOT NULL,
  `IDDojo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dojo`
--

CREATE TABLE `dojo` (
  `IDDojo` int(11) NOT NULL,
  `NombreDojo` varchar(30) NOT NULL,
  `Escuela` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `IDEquipo` int(11) NOT NULL,
  `IDCompetidor` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kata`
--

CREATE TABLE `kata` (
  `NumKata` int(11) NOT NULL,
  `Nombre` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llave`
--

CREATE TABLE `llave` (
  `IDLlave` int(11) NOT NULL,
  `Color` enum('Ao','Aka','','') NOT NULL,
  `Categoria` enum('12/13','14/15','16/17','18/mayores') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntaje`
--

CREATE TABLE `puntaje` (
  `IDPuntaje` int(11) NOT NULL,
  `IDEquipo` int(11) NOT NULL,
  `IDUsuario` int(11) NOT NULL,
  `IDRonda` int(11) NOT NULL,
  `NumKata` int(11) NOT NULL,
  `Puntaje` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `IDEquipo` int(11) NOT NULL,
  `NumKata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ronda`
--

CREATE TABLE `ronda` (
  `IDRonda` int(11) NOT NULL,
  `IDLlave` int(11) NOT NULL,
  `EstadoRonda` enum('Inicializada','Finalizada','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seencuentraen`
--

CREATE TABLE `seencuentraen` (
  `IDEquipo` int(11) NOT NULL,
  `IDLlave` int(11) NOT NULL,
  `IDTorneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `IDTorneo` int(11) NOT NULL,
  `EstadoTorneo` enum('Inicializado','Finalizado','','') NOT NULL,
  `Fecha` date NOT NULL,
  `Genero` enum('Masculino','Femenino','','') NOT NULL,
  `Tipo` enum('Individual','Grupal','','') NOT NULL,
  `Ubicacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDUsuario` int(11) NOT NULL,
  `GrupoUsuario` enum('AdministradorBDKarate','Juez','Juez1','Administrador') NOT NULL,
  `Contraseña` varchar(11) NOT NULL,
  `Nombre` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asiste`
--
ALTER TABLE `asiste`
  ADD PRIMARY KEY (`IDTorneo`,`IDUsuario`),
  ADD KEY `IDUsuario` (`IDUsuario`),
  ADD KEY `IDTorneo` (`IDTorneo`);

--
-- Indices de la tabla `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`CI`);

--
-- Indices de la tabla `competidor`
--
ALTER TABLE `competidor`
  ADD PRIMARY KEY (`IDCompetidor`),
  ADD KEY `IDDojo` (`IDDojo`);

--
-- Indices de la tabla `compite`
--
ALTER TABLE `compite`
  ADD PRIMARY KEY (`IDEquipo`),
  ADD KEY `IDTorneo` (`IDTorneo`),
  ADD KEY `IDEquipo` (`IDEquipo`);

--
-- Indices de la tabla `componen`
--
ALTER TABLE `componen`
  ADD PRIMARY KEY (`IDEquipo`,`IDRonda`,`IDTorneo`),
  ADD KEY `IDTorneo` (`IDTorneo`),
  ADD KEY `IDRonda` (`IDRonda`),
  ADD KEY `IDEquipo` (`IDEquipo`);

--
-- Indices de la tabla `conforma`
--
ALTER TABLE `conforma`
  ADD PRIMARY KEY (`IDCompetidor`,`IDEquipo`),
  ADD KEY `IDEquipo` (`IDEquipo`),
  ADD KEY `IDCompetidor` (`IDCompetidor`);

--
-- Indices de la tabla `constituye`
--
ALTER TABLE `constituye`
  ADD PRIMARY KEY (`IDEquipo`,`IDRonda`,`NumKata`),
  ADD KEY `IDRonda` (`IDRonda`),
  ADD KEY `NumKata` (`NumKata`),
  ADD KEY `IDEquipo` (`IDEquipo`);

--
-- Indices de la tabla `dirige`
--
ALTER TABLE `dirige`
  ADD PRIMARY KEY (`IDDojo`),
  ADD KEY `CI` (`CI`),
  ADD KEY `IDDojo` (`IDDojo`);

--
-- Indices de la tabla `dojo`
--
ALTER TABLE `dojo`
  ADD PRIMARY KEY (`IDDojo`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`IDEquipo`),
  ADD KEY `IDCompetidor` (`IDCompetidor`);

--
-- Indices de la tabla `kata`
--
ALTER TABLE `kata`
  ADD PRIMARY KEY (`NumKata`);

--
-- Indices de la tabla `llave`
--
ALTER TABLE `llave`
  ADD PRIMARY KEY (`IDLlave`);

--
-- Indices de la tabla `puntaje`
--
ALTER TABLE `puntaje`
  ADD PRIMARY KEY (`IDPuntaje`),
  ADD KEY `IDEquipo` (`IDEquipo`),
  ADD KEY `IDUsuario` (`IDUsuario`),
  ADD KEY `IDRonda` (`IDRonda`),
  ADD KEY `NumKata` (`NumKata`);

--
-- Indices de la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD PRIMARY KEY (`IDEquipo`,`NumKata`),
  ADD KEY `NumKata` (`NumKata`),
  ADD KEY `IDEquipo` (`IDEquipo`);

--
-- Indices de la tabla `ronda`
--
ALTER TABLE `ronda`
  ADD PRIMARY KEY (`IDRonda`),
  ADD KEY `IDLlave` (`IDLlave`);

--
-- Indices de la tabla `seencuentraen`
--
ALTER TABLE `seencuentraen`
  ADD PRIMARY KEY (`IDEquipo`,`IDLlave`,`IDTorneo`),
  ADD KEY `IDLlave` (`IDLlave`),
  ADD KEY `IDTorneo` (`IDTorneo`),
  ADD KEY `IDEquipo` (`IDEquipo`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`IDTorneo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `competidor`
--
ALTER TABLE `competidor`
  MODIFY `IDCompetidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dojo`
--
ALTER TABLE `dojo`
  MODIFY `IDDojo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `IDEquipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kata`
--
ALTER TABLE `kata`
  MODIFY `NumKata` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `llave`
--
ALTER TABLE `llave`
  MODIFY `IDLlave` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puntaje`
--
ALTER TABLE `puntaje`
  MODIFY `IDPuntaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ronda`
--
ALTER TABLE `ronda`
  MODIFY `IDRonda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `IDTorneo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiste`
--
ALTER TABLE `asiste`
  ADD CONSTRAINT `asiste_ibfk_1` FOREIGN KEY (`IDTorneo`) REFERENCES `torneo` (`IDTorneo`),
  ADD CONSTRAINT `asiste_ibfk_2` FOREIGN KEY (`IDUsuario`) REFERENCES `usuarios` (`IDUsuario`);

--
-- Filtros para la tabla `competidor`
--
ALTER TABLE `competidor`
  ADD CONSTRAINT `competidor_ibfk_1` FOREIGN KEY (`IDDojo`) REFERENCES `dojo` (`IDDojo`);

--
-- Filtros para la tabla `compite`
--
ALTER TABLE `compite`
  ADD CONSTRAINT `compite_ibfk_1` FOREIGN KEY (`IDTorneo`) REFERENCES `torneo` (`IDTorneo`),
  ADD CONSTRAINT `compite_ibfk_2` FOREIGN KEY (`IDEquipo`) REFERENCES `equipo` (`IDEquipo`);

--
-- Filtros para la tabla `componen`
--
ALTER TABLE `componen`
  ADD CONSTRAINT `componen_ibfk_1` FOREIGN KEY (`IDTorneo`) REFERENCES `torneo` (`IDTorneo`),
  ADD CONSTRAINT `componen_ibfk_2` FOREIGN KEY (`IDEquipo`) REFERENCES `equipo` (`IDEquipo`),
  ADD CONSTRAINT `componen_ibfk_3` FOREIGN KEY (`IDRonda`) REFERENCES `ronda` (`IDRonda`);

--
-- Filtros para la tabla `conforma`
--
ALTER TABLE `conforma`
  ADD CONSTRAINT `conforma_ibfk_1` FOREIGN KEY (`IDCompetidor`) REFERENCES `competidor` (`IDCompetidor`),
  ADD CONSTRAINT `conforma_ibfk_2` FOREIGN KEY (`IDEquipo`) REFERENCES `equipo` (`IDEquipo`);

--
-- Filtros para la tabla `constituye`
--
ALTER TABLE `constituye`
  ADD CONSTRAINT `constituye_ibfk_1` FOREIGN KEY (`IDEquipo`) REFERENCES `equipo` (`IDEquipo`),
  ADD CONSTRAINT `constituye_ibfk_2` FOREIGN KEY (`IDRonda`) REFERENCES `ronda` (`IDRonda`),
  ADD CONSTRAINT `constituye_ibfk_3` FOREIGN KEY (`NumKata`) REFERENCES `kata` (`NumKata`);

--
-- Filtros para la tabla `dirige`
--
ALTER TABLE `dirige`
  ADD CONSTRAINT `dirige_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `coach` (`CI`),
  ADD CONSTRAINT `dirige_ibfk_2` FOREIGN KEY (`IDDojo`) REFERENCES `dojo` (`IDDojo`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`IDCompetidor`) REFERENCES `competidor` (`IDCompetidor`);

--
-- Filtros para la tabla `puntaje`
--
ALTER TABLE `puntaje`
  ADD CONSTRAINT `puntaje_ibfk_1` FOREIGN KEY (`IDEquipo`) REFERENCES `equipo` (`IDEquipo`),
  ADD CONSTRAINT `puntaje_ibfk_2` FOREIGN KEY (`IDUsuario`) REFERENCES `usuarios` (`IDUsuario`),
  ADD CONSTRAINT `puntaje_ibfk_3` FOREIGN KEY (`IDRonda`) REFERENCES `ronda` (`IDRonda`),
  ADD CONSTRAINT `puntaje_ibfk_4` FOREIGN KEY (`NumKata`) REFERENCES `kata` (`NumKata`);

--
-- Filtros para la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD CONSTRAINT `realiza_ibfk_1` FOREIGN KEY (`IDEquipo`) REFERENCES `equipo` (`IDEquipo`),
  ADD CONSTRAINT `realiza_ibfk_2` FOREIGN KEY (`NumKata`) REFERENCES `kata` (`NumKata`);

--
-- Filtros para la tabla `ronda`
--
ALTER TABLE `ronda`
  ADD CONSTRAINT `ronda_ibfk_1` FOREIGN KEY (`IDLlave`) REFERENCES `llave` (`IDLlave`);

--
-- Filtros para la tabla `seencuentraen`
--
ALTER TABLE `seencuentraen`
  ADD CONSTRAINT `seencuentraen_ibfk_1` FOREIGN KEY (`IDEquipo`) REFERENCES `equipo` (`IDEquipo`),
  ADD CONSTRAINT `seencuentraen_ibfk_2` FOREIGN KEY (`IDLlave`) REFERENCES `llave` (`IDLlave`),
  ADD CONSTRAINT `seencuentraen_ibfk_3` FOREIGN KEY (`IDTorneo`) REFERENCES `torneo` (`IDTorneo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
