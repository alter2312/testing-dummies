-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2023 a las 16:27:23
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
-- Base de datos: `torneokata`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competidor`
--

CREATE TABLE `competidor` (
  `idcompetidores` int(11) NOT NULL,
  `ci` int(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `dojo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `escuela` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `fnac` date NOT NULL,
  `sexo` ENUM('Masculino','Femenino') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `competidor`
--

INSERT INTO `competidor` (`idcompetidores`, `ci`, `nombre`, `apellido`, `dojo`, `escuela`, `fnac`, `sexo`) VALUES
(2, 547256, 0, 0, 'oorterolo', 'satniago', '2023-07-25', ''),
(3, 547256, 0, 0, 'oorterolo', 'satniago', '2023-07-25', ''),
(4, 547256, 0, 0, 'oorterolo', 'satniago', '2023-07-25', ''),
(5, 1, 0, 0, '12', '123', '2023-07-23', ''),
(6, 1, 0, 0, '12', '123', '2023-07-23', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `competidor`
--
ALTER TABLE `competidor`
  ADD PRIMARY KEY (`idcompetidores`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `competidor`
--
ALTER TABLE `competidor`
  MODIFY `idcompetidores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
