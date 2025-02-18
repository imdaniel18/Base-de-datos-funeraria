-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2025 a las 02:44:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `funeraria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `apellido_cliente` varchar(100) DEFAULT NULL,
  `direccion_cliente` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id_contrato` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_servicio_funeralario` int(11) NOT NULL,
  `fecha_contrato` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idd_empleado` int(11) NOT NULL,
  `nombre_empleado` varchar(200) DEFAULT NULL,
  `apellido_empleado` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `monto_pago` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planesfunerales`
--

CREATE TABLE `planesfunerales` (
  `idd_plan` int(11) NOT NULL,
  `tipo_plan` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciosfunerarios`
--

CREATE TABLE `serviciosfunerarios` (
  `id_servicio_funeralario` int(11) NOT NULL,
  `tipo_servicio` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uusuarios`
--

CREATE TABLE `uusuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('cliente','empleado') NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `uusuarios`
--

INSERT INTO `uusuarios` (`id`, `username`, `password`, `rol`, `role`) VALUES
(1, 'dani23', '$2y$10$KnysTUYiQDICqHI3glp87eKfhmaz//bf.u2bi1Nwy1YY62PVDnUI.', 'cliente', 'Paciente'),
(2, 'dani24', '$2y$10$8BF2Lkl36smcqZNglzS7HulUf4tUz8OV5ZfaQACi64cZ4ILw7LR9q', 'cliente', 'Paciente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `fk_contrato_clientes` (`id_cliente`),
  ADD KEY `fk_contrato_servicios` (`id_servicio_funeralario`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idd_empleado`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `planesfunerales`
--
ALTER TABLE `planesfunerales`
  ADD PRIMARY KEY (`idd_plan`);

--
-- Indices de la tabla `serviciosfunerarios`
--
ALTER TABLE `serviciosfunerarios`
  ADD PRIMARY KEY (`id_servicio_funeralario`);

--
-- Indices de la tabla `uusuarios`
--
ALTER TABLE `uusuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `planesfunerales`
--
ALTER TABLE `planesfunerales`
  MODIFY `idd_plan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uusuarios`
--
ALTER TABLE `uusuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `fk_contrato_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `fk_contrato_servicios` FOREIGN KEY (`id_servicio_funeralario`) REFERENCES `serviciosfunerarios` (`id_servicio_funeralario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
