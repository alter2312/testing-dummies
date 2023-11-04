-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2023 a las 01:33:56
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

--
-- Volcado de datos para la tabla `asiste`
--

INSERT INTO `asiste` (`IDTorneo`, `IDUsuario`) VALUES
(1, 3);

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

--
-- Volcado de datos para la tabla `coach`
--

INSERT INTO `coach` (`CI`, `Apellido`, `Nombre`, `Telefono`) VALUES
(55422733, 'Gomez', 'Fabrizio', 93332257),
(55433333, 'Cardozo', 'Melanie', 97304444),
(55499733, 'Martinez', 'Fabian', 97302257);

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

--
-- Volcado de datos para la tabla `competidor`
--

INSERT INTO `competidor` (`IDCompetidor`, `CI`, `Fecha_Nac`, `Nombre`, `Apellido`, `Genero`, `IDDojo`) VALUES
(1, 55499749, '2005-11-11', 'Juan', 'Gomez', 'Masculino', 1),
(2, 55499748, '2005-11-10', 'Juana', 'Gomez', 'Femenino', 2),
(3, 25499749, '2003-11-11', 'Pedro', 'Jimenes', 'Masculino', 1),
(4, 55439749, '2000-08-11', 'Franco', 'Luneli', 'Masculino', 2);

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

--
-- Volcado de datos para la tabla `compite`
--

INSERT INTO `compite` (`IDEquipo`, `IDTorneo`, `Categoria`, `Puesto`) VALUES
(1, 1, '12/13', 1),
(2, 2, '14/15', 2),
(3, 3, '12/13', 1),
(4, 4, '14/15', 1);

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

--
-- Volcado de datos para la tabla `componen`
--

INSERT INTO `componen` (`IDEquipo`, `IDRonda`, `IDTorneo`, `Resultado`) VALUES
(1, 1, 1, 'Gano'),
(2, 2, 2, 'Perdio'),
(3, 3, 1, 'Perdio'),
(4, 4, 2, 'Gano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conforma`
--

CREATE TABLE `conforma` (
  `IDCompetidor` int(11) NOT NULL,
  `IDEquipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `conforma`
--

INSERT INTO `conforma` (`IDCompetidor`, `IDEquipo`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constituye`
--

CREATE TABLE `constituye` (
  `IDEquipo` int(11) NOT NULL,
  `IDRonda` int(11) NOT NULL,
  `NumKata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `constituye`
--

INSERT INTO `constituye` (`IDEquipo`, `IDRonda`, `NumKata`) VALUES
(3, 1, 3),
(4, 1, 4),
(1, 2, 1),
(2, 2, 2);

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

--
-- Volcado de datos para la tabla `dojo`
--

INSERT INTO `dojo` (`IDDojo`, `NombreDojo`, `Escuela`) VALUES
(1, 'Dojo1', 'Escuela1'),
(2, 'Dojo2', 'Escuela2'),
(3, 'Dojo3', 'Escuela1'),
(4, 'Dojo4', 'Escuela2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `IDEquipo` int(11) NOT NULL,
  `IDCompetidor` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`IDEquipo`, `IDCompetidor`, `Cantidad`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kata`
--

CREATE TABLE `kata` (
  `NumKata` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
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
  `IDLlave` int(11) NOT NULL,
  `Color` enum('Ao','Aka','','') NOT NULL,
  `Categoria` enum('12/13','14/15','16/17','18/mayores') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `llave`
--

INSERT INTO `llave` (`IDLlave`, `Color`, `Categoria`) VALUES
(1, 'Ao', '12/13'),
(2, 'Aka', '14/15'),
(3, 'Aka', '12/13'),
(4, 'Ao', '14/15');

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

--
-- Volcado de datos para la tabla `puntaje`
--

INSERT INTO `puntaje` (`IDPuntaje`, `IDEquipo`, `IDUsuario`, `IDRonda`, `NumKata`, `Puntaje`) VALUES
(1, 1, 3, 2, 1, 5.20),
(2, 2, 3, 2, 2, 9.00),
(3, 3, 3, 1, 3, 6.20),
(4, 4, 3, 1, 4, 6.20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `IDEquipo` int(11) NOT NULL,
  `NumKata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `realiza`
--

INSERT INTO `realiza` (`IDEquipo`, `NumKata`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ronda`
--

CREATE TABLE `ronda` (
  `IDRonda` int(11) NOT NULL,
  `IDLlave` int(11) NOT NULL,
  `EstadoRonda` enum('Inicializada','Finalizada','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ronda`
--

INSERT INTO `ronda` (`IDRonda`, `IDLlave`, `EstadoRonda`) VALUES
(1, 1, 'Finalizada'),
(2, 2, 'Inicializada'),
(3, 3, 'Finalizada'),
(4, 4, 'Inicializada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seencuentraen`
--

CREATE TABLE `seencuentraen` (
  `IDEquipo` int(11) NOT NULL,
  `IDLlave` int(11) NOT NULL,
  `IDTorneo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `seencuentraen`
--

INSERT INTO `seencuentraen` (`IDEquipo`, `IDLlave`, `IDTorneo`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

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

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`IDTorneo`, `EstadoTorneo`, `Fecha`, `Genero`, `Tipo`, `Ubicacion`) VALUES
(1, 'Finalizado', '2023-11-10', 'Masculino', 'Individual', 'San jose de ordoñes'),
(2, 'Inicializado', '2023-08-10', 'Femenino', 'Grupal', '18 de marzo'),
(3, 'Finalizado', '2010-11-10', 'Masculino', 'Individual', 'San jose de ordoñes'),
(4, 'Finalizado', '2012-11-10', 'Femenino', 'Individual', '18 de marzo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDUsuario` int(11) NOT NULL,
  `GrupoUsuario` enum('AdministradorBDKarate','Juez','Juez1','Administrador') NOT NULL,
  `Contraseña` varchar(30) NOT NULL,
  `Nombre` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IDUsuario`, `GrupoUsuario`, `Contraseña`, `Nombre`) VALUES
(1, 'Administrador', 'Administrador', 'Juan'),
(2, 'AdministradorBDKarate', 'AdministradorBDKarate', 'Pancracio'),
(3, 'Juez', 'Juez', 'Federico');

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
  ADD PRIMARY KEY (`IDEquipo`,`NumKata`),
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
  MODIFY `IDCompetidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dojo`
--
ALTER TABLE `dojo`
  MODIFY `IDDojo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `IDEquipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `kata`
--
ALTER TABLE `kata`
  MODIFY `NumKata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `llave`
--
ALTER TABLE `llave`
  MODIFY `IDLlave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `puntaje`
--
ALTER TABLE `puntaje`
  MODIFY `IDPuntaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ronda`
--
ALTER TABLE `ronda`
  MODIFY `IDRonda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `IDTorneo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
