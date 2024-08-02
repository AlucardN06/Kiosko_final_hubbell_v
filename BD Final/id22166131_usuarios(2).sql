-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2024 at 09:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id22166131_usuarios`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'Admin', '987654321'),
(3, '97106', '97106'),
(5, '118849', '118849');

-- --------------------------------------------------------

--
-- Table structure for table `citas`
--

CREATE TABLE `citas` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Confirmacion` varchar(255) DEFAULT NULL,
  `Genero` varchar(10) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Posicion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `citas`
--

INSERT INTO `citas` (`Id`, `Nombre`, `Correo`, `Fecha`, `Confirmacion`, `Genero`, `Telefono`, `Posicion`) VALUES
(78, 'Antonio Aldair Nuñez Ovando', 'antnunezovando@hotmail.com', '2024-07-24', '407180', 'Prefiero n', '6564449405', 'Operador'),
(79, 'Cristina Idali Berdeja Carrillo', 'cris96@gmail.com', '2024-07-24', '882479', 'Femenino', '6561003346', 'Operador'),
(80, 'Anahi Talamantes Morales', 'anahi.talamantes03@gmail.com', '2024-07-24', '35673', 'Femenino', '6562387548', 'Operador');

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `puesto` varchar(50) NOT NULL,
  `supervisor` varchar(100) NOT NULL,
  `turno` varchar(20) NOT NULL,
  `division` varchar(50) NOT NULL,
  `numero_locker` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fechas_disponibles`
--

CREATE TABLE `fechas_disponibles` (
  `Id` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Cupos` int(11) NOT NULL,
  `Posicion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fechas_disponibles`
--

INSERT INTO `fechas_disponibles` (`Id`, `Fecha`, `Cupos`, `Posicion`) VALUES
(18, '2024-07-24', 20, 'Operador'),
(19, '2024-07-25', 50, 'Operador');

-- --------------------------------------------------------

--
-- Table structure for table `lockers`
--

CREATE TABLE `lockers` (
  `id` int(11) NOT NULL,
  `numero_locker` varchar(10) NOT NULL,
  `status` enum('disponible','ocupado') NOT NULL DEFAULT 'disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lockers`
--

INSERT INTO `lockers` (`id`, `numero_locker`, `status`) VALUES
(1, 'C3421', 'disponible'),
(2, 'Rgregfwfq', 'disponible');

-- --------------------------------------------------------

--
-- Table structure for table `recomendados`
--

CREATE TABLE `recomendados` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Confirmacion` varchar(255) DEFAULT NULL,
  `Genero` varchar(10) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `solicitudes_empleo`
--

CREATE TABLE `solicitudes_empleo` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `trabajo_previo` varchar(50) DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `seguro_social` varchar(11) DEFAULT NULL,
  `codigo_postal` varchar(5) DEFAULT NULL,
  `genero` enum('Masculino','Femenino') DEFAULT NULL,
  `estado_civil` enum('Soltero(a)','Casado(a)','Viudo(a)','Divorciado(a)','Unión Libre') DEFAULT NULL,
  `idioma_preferido` varchar(50) DEFAULT NULL,
  `numero_hijos` int(11) DEFAULT NULL,
  `lugar_nacimiento_ciudad` varchar(50) DEFAULT NULL,
  `lugar_nacimiento_estado` varchar(50) DEFAULT NULL,
  `lugar_nacimiento_pais` varchar(50) DEFAULT NULL,
  `clinica_imss` varchar(50) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `telefono_celular1` varchar(20) DEFAULT NULL,
  `telefono_celular2` varchar(20) DEFAULT NULL,
  `direccion_calle` varchar(100) DEFAULT NULL,
  `direccion_numero_exterior` varchar(10) DEFAULT NULL,
  `direccion_numero_interior` varchar(10) DEFAULT NULL,
  `direccion_colonia` varchar(100) DEFAULT NULL,
  `direccion_ciudad` varchar(50) DEFAULT NULL,
  `direccion_estado` varchar(50) DEFAULT NULL,
  `direccion_codigo_postal` varchar(10) DEFAULT NULL,
  `nivel_estudios` enum('Primaria','Secundaria','Preparatoria','Licenciatura','Maestría','Doctorado') DEFAULT NULL,
  `visibilidad` enum('Pública','Privada') DEFAULT NULL,
  `documento_nivel_estudios` varchar(100) DEFAULT NULL,
  `contacto_emergencia1_nombre` varchar(50) DEFAULT NULL,
  `contacto_emergencia1_telefono` varchar(20) DEFAULT NULL,
  `contacto_emergencia1_parentesco` enum('Hijo','Amigo','Padre/madre','Hermano/a','Esposo(a)','Otro') DEFAULT NULL,
  `contacto_emergencia1_email` varchar(100) DEFAULT NULL,
  `contacto_emergencia2_nombre` varchar(50) DEFAULT NULL,
  `contacto_emergencia2_telefono` varchar(20) DEFAULT NULL,
  `contacto_emergencia2_parentesco` enum('Hijo','Amigo','Padre/madre','Hermano/a','Esposo(a)','Otro') DEFAULT NULL,
  `contacto_emergencia2_email` varchar(100) DEFAULT NULL,
  `declaracion_ajuste_verdad` varchar(500) DEFAULT NULL,
  `nombre_solicitante` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_locker` (`numero_locker`);

--
-- Indexes for table `fechas_disponibles`
--
ALTER TABLE `fechas_disponibles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `lockers`
--
ALTER TABLE `lockers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_locker` (`numero_locker`);

--
-- Indexes for table `solicitudes_empleo`
--
ALTER TABLE `solicitudes_empleo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `citas`
--
ALTER TABLE `citas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fechas_disponibles`
--
ALTER TABLE `fechas_disponibles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lockers`
--
ALTER TABLE `lockers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `solicitudes_empleo`
--
ALTER TABLE `solicitudes_empleo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`numero_locker`) REFERENCES `lockers` (`numero_locker`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
