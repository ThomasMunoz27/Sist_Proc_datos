-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2023 a las 18:46:28
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
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `art` int(20) NOT NULL,
  `detalle` varchar(60) NOT NULL,
  `unidad` varchar(40) NOT NULL,
  `puv` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`art`, `detalle`, `unidad`, `puv`) VALUES
(1, 'Tornillo rosca W 1x0,5', 'kg', 250),
(2, 'Chapa acanalada', 'un', 7800),
(3, 'Cemento de contacto', 'un', 520),
(24, 'Tornillo Cab exag Chapa', 'un', 350),
(25, 'Machimbre 1/2 x 3', 'mts', 1124),
(345, 'Plastico Negro', 'mts', 120),
(444, 'Tela plástica', 'mts', 125);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `nrocli` int(4) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `domicilio` varchar(60) NOT NULL,
  `localidad` varchar(60) NOT NULL,
  `cp` int(4) NOT NULL,
  `salario` int(10) NOT NULL,
  `seccion` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`nrocli`, `nombre`, `apellido`, `domicilio`, `localidad`, `cp`, `salario`, `seccion`) VALUES
(133, 'Maximiliano', 'Soloa', 'Puente del Inca', 'Maipú', 5515, 90000, 0),
(198, 'Esteban', 'Jardel', 'Ramirez 345', 'Mendoza', 5500, 92000, 1),
(199, 'Diego', 'Albornoz', 'Larrea 234', 'Godoy Cruz', 5501, 94000, 2),
(200, 'Juan', 'Perez', 'Rafael Obligado 605', 'Godoy Cruz', 5501, 95000, 3),
(205, 'Eliana', 'Azcurra', 'Velez Sarfield S/N', 'Guaymallén', 5519, 95500, 1),
(321, 'Gabriela', 'Caballero', 'Soler 123', 'Mendoza', 5500, 100000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `nrofact` int(4) NOT NULL,
  `art` int(4) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `puv` decimal(10,2) NOT NULL,
  `kg` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`nrofact`, `art`, `cantidad`, `puv`, `kg`) VALUES
(1000, 1, 0.50, 250.00, 0.50),
(1001, 345, 4.00, 120.00, 1.00),
(1002, 444, 10.00, 125.00, 2.50),
(1003, 3, 1.00, 520.00, 0.10),
(1004, 1, 2.00, 250.00, 2.00),
(1005, 345, 2.00, 120.00, 0.50),
(1006, 2, 2.00, 7800.00, 20.00),
(1007, 25, 50.00, 1124.00, 70.00),
(1008, 24, 30.00, 350.00, 2.30),
(1009, 1, 10.00, 250.00, 10.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `codempresa` int(6) NOT NULL,
  `nombre_empresa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`codempresa`, `nombre_empresa`) VALUES
(106, 'Andreani'),
(666, 'Medina SA'),
(580, 'OCA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `nrofact` int(4) NOT NULL,
  `nrocli` int(4) NOT NULL,
  `fecha` date NOT NULL,
  `hra` time(6) NOT NULL,
  `codempresa` int(10) NOT NULL,
  `envio` tinyint(6) NOT NULL,
  `kg` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`nrofact`, `nrocli`, `fecha`, `hra`, `codempresa`, `envio`, `kg`) VALUES
(1000, 200, '2023-02-10', '10:10:00.000000', 106, 0, 0.50),
(1001, 198, '2023-02-10', '09:05:00.000000', 580, 1, 1.00),
(1002, 205, '2023-02-14', '11:25:00.000000', 580, 1, 2.50),
(1003, 133, '2023-02-14', '10:15:00.000000', 106, 0, 0.10),
(1004, 198, '2023-02-15', '09:35:00.000000', 580, 0, 2.00),
(1005, 321, '2023-02-15', '09:36:00.000000', 580, 0, 0.50),
(1006, 198, '2023-02-15', '11:21:00.000000', 580, 1, 20.00),
(1007, 205, '2023-02-16', '16:00:00.000000', 666, 1, 70.00),
(1008, 200, '2023-02-16', '14:00:00.000000', 106, 1, 2.30),
(1009, 199, '2023-02-18', '14:05:00.000000', 106, 1, 10.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

CREATE TABLE `transporte` (
  `codempresa` int(6) NOT NULL,
  `codt` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `transporte`
--

INSERT INTO `transporte` (`codempresa`, `codt`) VALUES
(106, 'GC'),
(106, 'MP'),
(580, 'MZ'),
(666, 'MP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valorlocalidad`
--

CREATE TABLE `valorlocalidad` (
  `codt` char(4) NOT NULL,
  `valorloc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `valorlocalidad`
--

INSERT INTO `valorlocalidad` (`codt`, `valorloc`) VALUES
('', 0),
('GC', 1000),
('MP', 1200),
('MZ', 700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valorlocalidadkg`
--

CREATE TABLE `valorlocalidadkg` (
  `codt` char(4) NOT NULL,
  `preciokg` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `valorlocalidadkg`
--

INSERT INTO `valorlocalidadkg` (`codt`, `preciokg`) VALUES
('GC', 250),
('MP', 380),
('MZ', 125);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`art`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`nrocli`),
  ADD KEY `cp` (`cp`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD KEY `nrofact` (`nrofact`,`art`),
  ADD KEY `art` (`art`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`codempresa`),
  ADD KEY `nombre_empresa` (`nombre_empresa`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`nrofact`),
  ADD KEY `nrocli` (`nrocli`);

--
-- Indices de la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD KEY `codempresa` (`codempresa`,`codt`),
  ADD KEY `codt` (`codt`);

--
-- Indices de la tabla `valorlocalidad`
--
ALTER TABLE `valorlocalidad`
  ADD PRIMARY KEY (`codt`);

--
-- Indices de la tabla `valorlocalidadkg`
--
ALTER TABLE `valorlocalidadkg`
  ADD PRIMARY KEY (`codt`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`art`) REFERENCES `articulos` (`art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detallefactura_ibfk_2` FOREIGN KEY (`nrofact`) REFERENCES `factura` (`nrofact`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`nrocli`) REFERENCES `clientes` (`nrocli`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD CONSTRAINT `transporte_ibfk_1` FOREIGN KEY (`codempresa`) REFERENCES `empresa` (`codempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transporte_ibfk_2` FOREIGN KEY (`codt`) REFERENCES `valorlocalidad` (`codt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `valorlocalidadkg`
--
ALTER TABLE `valorlocalidadkg`
  ADD CONSTRAINT `valorlocalidadkg_ibfk_1` FOREIGN KEY (`codt`) REFERENCES `transporte` (`codt`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
